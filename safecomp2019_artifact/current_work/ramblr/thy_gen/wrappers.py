# Copyright 2018
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http:#www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

__all__ = ['AngrWrapper']

import angr

from collections import defaultdict, namedtuple
from collections_extended import RangeMap
from itertools import chain

# TODO: replace with lru_cache (possibly setting maxsize to None) in Python 3
from .utils import memoized

CallSite = namedtuple('CallSite', 'callee size')

FUNC_IGNORES = {
    '_init',
    '__cxa_finalize',
    '_start',
    '_dl_relocate_static_pie',
    'deregister_tm_clones',
    'register_tm_clones',
    '__do_global_dtors_aux',
    'frame_dummy',
    '__libc_csu_init',
    '__libc_csu_fini',
    '_fini',
    '__stack_chk_fail',
    'sub_400590',
}
FLAG_MAP = {
    **dict.fromkeys(('jo', 'jno', 'seto', 'setno'), ('flag_of',)),
    **dict.fromkeys(('js', 'jns', 'sets', 'setns'), ('flag_sf',)),
    **dict.fromkeys(
        ('je', 'jz', 'jne', 'jnz', 'sete', 'setz', 'setne', 'setnz'),
        ('flag_zf',)
    ),
    **dict.fromkeys(
        ('jb', 'jnae', 'jc', 'jnb', 'jae', 'jnc', 'setb', 'setnae', 'setc', 'setnb', 'setae', 'setnc'),
        ('flag_cf',)
    ),
    **dict.fromkeys(
        ('jbe', 'jna', 'ja', 'jnbe', 'setbe', 'setna', 'seta', 'setnbe'),
        ('flag_cf', 'flag_zf')
    ),
    **dict.fromkeys(
        ('jl', 'jnge', 'jge', 'jnl', 'setl', 'setnge', 'setge', 'setnl'),
        ('flag_sf', 'flag_of')
    ),
    **dict.fromkeys(
        ('jle', 'jng', 'jg', 'jnle', 'setle', 'setng', 'setg', 'setnle'),
        ('flag_zf', 'flag_sf', 'flag_of')
    ),
    **dict.fromkeys(
        ('jp', 'jpe', 'jnp', 'jpo', 'setp', 'setpe', 'setnp', 'setpo'),
        ('flag_pf,')
    )
}

REG_MAP = { # add more as needed
    'bp': 'rbp',
    'sp': 'rsp',
}
SUPPORTED_REGS = set(REG_MAP.values())


def get_instructions(proc):
    # The chain object isn't reusable, so this function has to be called each time the insts are needed
    return chain.from_iterable(block.instructions for block in proc.blocks)


def _setup_boffset(procs):
    """Sets up the boffset range map

    As optimized binaries can have functions we ignore mixed in with the
    functions we do want, we need a way of properly setting up the offsets to
    match the offsets extracted in Isabelle.
    """
    # The size of a function alone doesn't tell us where the next function is
    # located, there may be padding.
    distances = [b.addr - a.addr for a, b in zip(procs, procs[1:])]
    distances.append(-1) # last distance should not be used but is needed to zip
    boffset = RangeMap()
    base_boffset = 0
    # need to keep track of the gap between size and distance as the Isabelle
    # parser only goes by instruction sizes and doesn't see any padding
    size_difference = 0
    # Don't want to start counting until we're past the first function to not
    # be ignored.
    past_first_function = False

    for proc, next_distance in zip(procs, distances):

        if proc.name not in FUNC_IGNORES:
            addr = proc.addr
            size = sum(b.size for b in proc.blocks)

            if not past_first_function:
                # We're at the first function to offset from
                base_boffset = addr
                past_first_function = True

            boffset[addr:addr + next_distance] = base_boffset + size_difference
            size_difference += next_distance - size
        elif past_first_function:
            base_boffset += next_distance

    return boffset


class AngrWrapper:
    def __init__(self, args):
        self.proj = angr.Project(args.infile, auto_load_libs=False)
        self.asm = self.proj.analyses.Reassembler()
        self.args = args

        # Reporting addrs relative to the first procedure address, with some
        # messiness added to deal with functions we ignore mixed in.
        self.boffset = _setup_boffset(self.asm.procedures)

        # text section and relevant procs
        self.procs = {
            proc.name: proc for proc in self.asm.procedures
            if proc.name not in FUNC_IGNORES
        }

        # We need a list of all referenced functions in the binary to help
        # distinguish jumps that are actually calls.
        # This might not work right if there are functions present that aren't
        # explicitly called (like in optimized code), might need to experiment.
        self.func_names = {f.name for f in self.proj.kb.functions.values()}

    @memoized
    def _proc_size(self, proc_name):
        """Using proc to get byte count

        The value from the function itself (f.size) seems to not be accurate for
        our purposes, so just using the total size of all the basic blocks in
        the function.

        On the other hand, retesting shows no difference now, so now I'm not
        sure what the issue I ran into before was caused by.
        """
        return self.find_func(proc_name).size

    def _calculate_invariant(self, addr_source, reg_offsets):
        """Organizes register offsets for a specific address

        May handle more stuff in the future.
        """
        addr = addr_source.addr
        reg_invrs = tuple(
            (reg, *roff) for reg, roff in reg_offsets[addr].items()
        )

        return addr - self.boffset[addr], reg_invrs

    @memoized
    def get_func_bounds(self, func):
        'Determines start and end offsets for the supplied function'
        addr = func.addr
        start_offset = addr - self.boffset[addr]
        end_offset = start_offset + self._proc_size(func.name)

        return start_offset, end_offset

    @memoized
    def get_cfg(self, func_name):
        """Obtains the CFG for a function even if not used in main.

        Optimized test code sometimes inlines functions under test, which causes
        their symbols to not be detected by the CFG analysis, which defaults to
        starting from main() (the entry point to the binary). Thus, we need to
        do our CFG work per function.
        """
        # Using self.proj.kb.functions[func_name].addr might work too
        sym = self.proj.loader.find_symbol(func_name)
        return self.proj.analyses.CFGEmulated(
            keep_state=True,
            starts=[sym.rebased_addr]
        )

    @memoized
    def find_func(self, func_name):
        'Finds function by name'
        func = self.get_cfg(func_name).kb.functions[func_name]
        # The below is necessary to normalize any loops so we get good block selection
        self.proj.analyses.LoopFinder(functions=[func])
        return func

    def get_flag_data(self):
        loc_map = defaultdict(list)

        for func_name in self.args.function:
            proc = self.procs[func_name]
            boffset = self.boffset[proc.addr]

            # reversed doesn't work with get_instructions directly, unfortunately.
            # Luckily the lists shouldn't be super-long anyway so making a copy is fine.
            insts = reversed(list(get_instructions(proc)))

            looking_for_flag_loc = False
            for inst in insts:
                if looking_for_flag_loc:
                    # Perhaps look for the instruction based on the flags set
                    # rather than just assuming the closest one is correct? It
                    # seems xor resets certain flags anyway so we can assume if
                    # it's present right before a jump then that's the one to
                    # use, maybe...
                    if inst.mnemonic in {'cmp', 'test', 'xor'}:
                        # Shouldn't really use flags before defining it, but it works
                        loc_map[flags].append(inst.addr - boffset)
                        looking_for_flag_loc = False
                    continue

                flags = FLAG_MAP.get(inst.mnemonic)
                if flags:
                    looking_for_flag_loc = True

        return loc_map

    # TODO: need to use pushed_offsets somehow so we can keep track of pushed
    # initial register values on the stack
    #
    # also figure out how to generalize sub/add for other stored registers
    #
    # Really, this function needs refactoring in general.
    @memoized
    def get_reg0_offsets(self, func):
        """Calculates offsets from initial registers in a function.

        More specifically, creates a map of instruction addresses to maps of
        registers and their value relative to the initial registers (of course,
        this includes rsp itself). It might be more efficient to only show the
        points where the rsp-relative stuff changes, but just doing a map of the
        instructions in a function makes it easier, maybe.

        This method assumes that the pushes/subs and pops/adds don't happen
        within branching control flow, which is reasonable as even in optimized
        code I've encountered the setup is usually only at the start/end of
        functions.
        """
        proc = self.procs[func.name]
        offsets = defaultdict(dict)
        current_offsets = {'rsp': ('rsp', 0), 'rbp': ('rbp', 0)}
        # keeping track to restore after pops
        pushed_offsets = {}

        # TODO: revise to work from entry/exit blocks eventually, the current
        # method does not work right if the "end" block is actually in the
        # middle of the list of instructions, as is the case for optimized
        # functions. Not sure how to fill in the rest, though (as in between
        # entry/exit there will be bits that carry through the offsets).
        for inst in get_instructions(proc):
            # We want the offset at an instruction before that instruction executes
            offsets[inst.addr].update(current_offsets)
            ops = inst.operands # not used by everything but used by enough

            if inst.mnemonic == 'leave':
                # equivalent to moving frame pointer to stack pointer and then
                # popping, resulting in rsp and rbp regaining their original
                # values (assuming no messiness happened with rsp)
                current_offsets['rsp'] = 'rsp', 0
                current_offsets['rbp'] = 'rbp', 0
            elif inst.mnemonic in {'push', 'enter'}:
                if inst.mnemonic == 'enter':
                    # equivalent to pushing frame pointer on stack and then
                    # moving current stack pointer to frame pointer
                    pushed_offsets['rbp'] = current_offsets['rbp']
                    current_offsets['rbp'] = current_offsets['rsp']
                else:
                    reg = ops[0].operand_str
                    if reg not in current_offsets:
                         # so we can at least kind of keep track
                        current_offsets[reg] = (reg, 0)
                    pushed_offsets[reg] = current_offsets[reg]

                # no easy way to get a new tuple with an updated element
                base, offset = current_offsets['rsp']
                current_offsets['rsp'] = base, offset - 8
            elif inst.mnemonic in {'pop', 'ret'}:
                # ret not so useful here but is included for completeness
                base, offset = current_offsets['rsp']
                current_offsets['rsp'] = base, offset + 8
                if inst.mnemonic == 'pop':
                    # restoring register to its original value (assumes there
                    # was an equivalent push)
                    reg = ops[0].operand_str
                    current_offsets[reg] = pushed_offsets[reg]
            elif inst.mnemonic == 'sub' and ops[0].operand_str == 'rsp':
                # determine base from supplied string literal; assuming it's an
                # immediate value. We won't handle VLAs just yet.
                base, offset = current_offsets['rsp']
                current_offsets['rsp'] = base, offset - int(ops[1].operand_str, 0)
            elif inst.mnemonic == 'add' and ops[0].operand_str == 'rsp':
                base, offset = current_offsets['rsp']
                current_offsets['rsp'] = base, offset + int(ops[1].operand_str, 0)
            elif inst.mnemonic == 'mov' and ops[1].operand_str.strip() == 'rsp':
                # This is extendible to other source registers if necessary
                current_offsets[ops[0].operand_str] = current_offsets['rsp']

        return offsets

    @memoized
    def get_invariant_data(self, func):
        """Adds an annotation for every block with multiple predecessors.

        Sidenote: It seems func.graph and func.transition_graph produce the same
        graph, though the nodes appear in different order when the graphs are
        iterated over. The results are different when used with bingraphvis,
        though...
        """
        reg_offsets = self.get_reg0_offsets(func)
        data = set() # w/o set there could be duplicates from the two loops

        for node in func.graph:
            if len(node.predecessors()) > 1:
                data.add(self._calculate_invariant(node, reg_offsets))

        # need to do invariants for callsites as well
        last_was_call = False
        for block in self.procs[func.name].blocks:
            for inst in block.instructions:
                if inst.mnemonic == 'call':
                    data.add(self._calculate_invariant(inst, reg_offsets))
                    last_was_call = True
                elif last_was_call:
                    data.add(self._calculate_invariant(inst, reg_offsets))
                    last_was_call = False

        # having the invariants in order is nice
        return sorted(data)

    def get_loops(self, func):
        return self.proj.analyses.LoopFinder(functions=[func]).loops

    def get_loop_heirarchy(self, func):
        return self.proj.analyses.LoopFinder(functions=[func]).loops_heirarchy

    def get_loop_entries(self, func):
        loops = self.get_loops(func)
        boffset = self.boffset[func.addr]
        return [l.entry.addr - boffset for l in loops]

    # TODO: figure out how to eliminate references from push and the like?
    def get_variable_data(self, func):
        vm = self.proj.analyses.VariableRecovery(func)
        vmi = vm.variable_manager[func.addr]
        offsets = self.get_reg0_offsets(func)

        # Using a set as VariableRecovery can result in duplicates
        variables = set()
        for var in vmi.get_variables():
            # avoiding empty variables, not sure where they come from
            if not var.size: continue

            for access in vmi.get_variable_accesses(var):
                base = REG_MAP[var.base]
                actual_base, offset = offsets[access.location.ins_addr][base]
                actual_offset = var.offset + offset

                variables.add((actual_base, actual_offset, var.size))

        variables.add(('rsp', 0, 8)) # VariableRecovery deoesn't always detect the return address slot
        return variables

    def get_post_callsites(self, func_name):
        """Produces the offsets of the instructions following each call site.

        If no such instruction exists, that means the called function probably
        does not return, and as such we will return -1 for those cases.

        Occasionally, programs will be optimized such that the jmp instruction
        is used to call a function, which results in the called function
        returning to the function that called the calling function rather than
        to the calling function; this is a shortcut to avoid having to add an
        extra ret instruction to the calling function. We can detect such
        behaviors if the function involved is listed in the project knowledge
        base, but there may be false negatives in edge cases. For those we do
        detect, we again return -1 and the caller must determine what to do.
        """
        post_callsites = []
        after_call = False
        proc = self.procs[func_name]
        boffset = self.boffset[proc.addr]
        for inst in get_instructions(proc):
            if after_call: # We're after the instruction that was a call
                post_callsites.append(inst.addr - boffset)
                after_call = False

            if inst.mnemonic == 'call':
                after_call = True
            elif (
                inst.mnemonic == 'jmp'
                and inst.operands[0].label.name in self.func_names
            ):
                post_callsites.append(-1)

        return post_callsites

    def get_edges(self, func):
        """Produces an adjacency list with the right offsets.

        When a vertex has two children (meaning it is a conditional jump), the
        first child is the 'true' path.

        Not sure how to deal with the fake-return/confirmed stuff right now
        that is included as metadata in the dicts used as values in the dict
        returned by graph.adjacency().
        """
        boffset = self.boffset[func.addr]
        graph = func.graph
        edges = []
        for block, succs in graph.adjacency():
            children = sorted(
                (succ.addr for succ in succs),
                key=lambda s, b=block: b.addr + b.size == s
            )
            edges.append({
                'vertex': block.addr - boffset,
                'children': [child - boffset for child in children]
            })

        return edges

    def get_conditional_map(self, func_name):
        """Produces a map of block addr to conditional jump addr for a function.

        This includes branches for loops and such.
        """
        proc = self.procs[func_name]
        boffset = self.boffset[proc.addr]
        condmap = {}

        for block in proc.blocks:
            last_inst = block.instructions[-1]
            mne = last_inst.mnemonic
            if mne.startswith('j') and not mne == 'jmp':
                condmap[block.addr - boffset] = last_inst.addr - boffset

        return condmap

    @memoized
    def get_callmap(self, func_name):
        """Returns a map of inst offsets to function labels and call sizes

        This function does not handle those cases where the instruction is a
        jump rather than a call.
        """
        callmap = {}
        proc = self.procs[func_name]
        boffset = self.boffset[proc.addr]
        for inst in get_instructions(proc):
            if inst.mnemonic == 'call':
                op = inst.operands[0]
                name = op.label.function_name # not sure if .name is better
                callmap[inst.addr - boffset] = CallSite(name, inst.size)

        return callmap

    def has_calls(self, func_name):
        return len(self.get_callmap(func_name)) > 0
