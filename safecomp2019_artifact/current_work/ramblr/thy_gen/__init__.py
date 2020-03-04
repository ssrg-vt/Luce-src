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

# angr 8 will support Python 3 (with no Python 2 support) but until then we're
# stuck with Python 2 due to issues with packages the version of angr in the
# Python repositories at the time of this comment being written (7.8.8.1)
# depends on.

'Package for theory generation package and related work'

__all__ = ['DataDumper', 'TheoryGenerator']

import os

from collections import defaultdict

from .dumper import DataDumper
from .wrappers import AngrWrapper, SUPPORTED_REGS

# Assumes Leviathan setup script has been sourced
LEVIATHAN_DIR = os.environ['LEVIATHAN']
TEMPLATE_DIR = os.path.dirname(__file__) # doesn't work when run directly, but this should not be run directly anyway

REG0_STR = '{}\\<^sub>0'
MASTER_STR = '      \\<open>master blocks ({}{:+}, {}) {}\\<close>\n'
MASTER_STR_ZERO_OFFSET = '      \\<open>master blocks ({}, {}) {}\\<close>\n'
LOC_STR = 'if loc \\<in> {{\n    {}\n  }} then {{{}}} else '
REG_INVR_STR = 'regs \\<sigma> {} = {}\\<^sub>0{:+}'
REG_INVR_STR_JOINER = '\n      \\<and> '
PREMS_STR = 'prems(1,2,{}-) prems(3-{})[symmetric]'
PREMS_STR_ONE_SYM = 'prems(1,2,4-) prems(3)[symmetric]'

PREMS_BASE = 3

templates = {}
for name in (
    'base',
    'mem',
    'subgoal',
    'invariant',
    'mem_calls',
    'call',
    'call_subgoal',
    'callsite',
):
    with open(os.path.join(TEMPLATE_DIR, name + '_template.thy')) as inf:
        templates[name] = inf.read()


def get_master(counter, base, offset, size):
    if base not in SUPPORTED_REGS:
        raise Exception('Base {} not handled yet'.format(base))

    base = REG0_STR.format(base)

    # special-casing for an offset of zero to make the result look nicer
    if offset == 0:
        return MASTER_STR_ZERO_OFFSET.format(base, size, counter)
    else:
        return MASTER_STR.format(base, offset, size, counter)


class TheoryGenerator:
    def __init__(self, args):
        self.args = args
        self.wrapper = AngrWrapper(args)

    def get_flag_annotations(self):
        loc_map = self.wrapper.get_flag_data()

        annot_str = ''
        for flags, locations in loc_map.items():
            locations.sort() # makes the locations easier to read when printed

            loc_str = ',\n    '.join(
                'boffset + {}'.format(loc) for loc in locations
            )
            flags_str = ', '.join(flags)
            annot_str += LOC_STR.format(loc_str, flags_str)

        return annot_str + '{}' # Need that last empty set for all the other locations

        # sorting makes things easier to follow in the generated files
        annots.sort()
        return annots

    def get_invariant_annotations(self, func):
        data = self.wrapper.get_invariant_data(func)

        func_name = func.name + self.args.suffix # not the best place for this
        outstr = ''
        for offset, reg_invrs in data:
            invrs = REG_INVR_STR_JOINER.join(
                REG_INVR_STR.format(*x) for x in reg_invrs
            )
            outstr += templates['invariant'].format(offset, invrs, func_name)

        return outstr

    def get_masters(self, func):
        variable_data = self.wrapper.get_variable_data(func)

        # starting at 1 as we already have an ID of 0 for the preserved region
        # Using sorted list to look nicer
        x = enumerate(sorted(variable_data), 1)
        return ''.join(get_master(counter, *rest) for counter, rest in x)

    def get_subgoals(self, *subgoal_offsets):
        'Gets the string of subgoals for a function proof'
        subgoals = []
        for offset in subgoal_offsets:
            if offset:
                offset_str = 'boffset{:+}'.format(offset)
            else: # making the offset look nicer when it's 0
                offset_str = 'boffset'

            subgoals.append(templates['subgoal'].format(offset_str))

        return '\n'.join(subgoals)

    def get_subgoals_for_call_case(self, func_name, *subgoal_offsets):
        'Gets the string of subgoals for a function proof'
        callmap = self.wrapper.get_callmap(func_name)

        subgoals = []
        for offset in subgoal_offsets:
            if offset:
                offset_str = 'boffset{:+}'.format(offset)
            else: # making the offset look nicer when it's 0
                offset_str = 'boffset'

            if offset in callmap:
                call_data = callmap[offset]
                post_offset = 'boffset{:+}'.format(offset + call_data.size)
                subgoals.append(templates['call_subgoal'].format(
                    callee=call_data.callee,
                    callsite=call_data.callee + str(offset),
                    call_boffset=offset_str,
                    post_call_boffset=post_offset,
                ))
            else:
                subgoals.append(templates['subgoal'].format(offset_str))

        return '\n'.join(subgoals)

    def get_call_fixes_assms(self, func_name):
        callmap = self.wrapper.get_callmap(func_name)
        callsites = defaultdict(list)

        for offset, call in callmap.items():
            callsite = templates['callsite'].format(
                callee=call.callee,
                callsite=call.callee + str(offset),
                call_boffset='boffset{:+}'.format(offset),
                post_call_boffset='boffset{:+}'.format(offset + call.size)

            )
            callsites[call].append(callsite)

        for x in callsites:
            callsites[x] = '    and '.join(callsites[x])

        call_fixes = []
        call_assms = []
        # assuming each call to a specific function has the same size
        for call in set(callmap.values()):
            call_fixes.append(call.callee)

            call_assms.append(templates['call'].format(
                callee=call.callee,
                call_size=call.size,
                callsites=callsites[call],
            ).strip())

        return ' '.join(call_fixes), '\n    and '.join(call_assms)

    def generate_base_theory(self):
        # x86_64_parser requires assembly path be relative to LEVIATHAN_DIR
        rel_outpath = os.path.relpath(self.args.outpath, LEVIATHAN_DIR)
        # Some theory imports require LEVIATHAN_DIR be relative to outpath
        # (this can be removed later once all imports are non-relative)
        isabelle_path = os.path.relpath(LEVIATHAN_DIR, self.args.outpath)

        outname = os.path.join(self.args.outpath, self.args.infile + '.thy')
        with open(outname, 'w') as outf:
            outf.write(templates['base'].format(
                flag_annotations=self.get_flag_annotations(),
                rel_outpath=rel_outpath,
                isabelle_path=isabelle_path,
                **self.args.__dict__
            ))

    def generate_function_theory_without_calls(self, outname, **data):
        f = data['f']
        subgoals = self.get_subgoals(data['func_start'], *data['offsets'])

        with open(outname, 'w') as outf:
            outf.write(templates['mem'].format(
                subgoals=subgoals,
                **data,
                **self.args.__dict__
            ))

    def generate_function_theory_with_calls(self, outname, **data):
        fn = data['f'].name
        fs = data['func_start']
        subgoals = self.get_subgoals_for_call_case(fn, fs, *data['offsets'])
        call_fixes, call_assms = self.get_call_fixes_assms(fn)

        with open(outname, 'w') as outf:
            outf.write(templates['mem_calls'].format(
                subgoals=subgoals,
                call_fixes=call_fixes,
                call_assms=call_assms,
                **data,
                **self.args.__dict__
            ))

    def generate_function_theory(self, func_name):
        f = self.wrapper.find_func(func_name)
        masters = self.get_masters(f)

        func_offset, func_end = self.wrapper.get_func_bounds(f)
        if func_offset:
            func_boffset_str = 'boffset{:+}'.format(func_offset)
        else: # avoiding +0; not strictly necessary but looks nicer
            func_boffset_str = 'boffset'

        offsets = (o[0] for o in self.wrapper.get_invariant_data(f))
        invariant_annotations = self.get_invariant_annotations(f)
        outname = func_name + self.args.suffix + '_mem.thy'

        if self.wrapper.has_calls(func_name):
            self.generate_function_theory_with_calls(
                os.path.join(self.args.outpath, outname),
                f=f,
                func_name=func_name,
                masters=masters,
                func_boffset=func_boffset_str,
                func_start=func_offset,
                func_end=func_end,
                invariant_annotations=invariant_annotations,
                offsets=offsets,
            )
        else:
            self.generate_function_theory_without_calls(
                os.path.join(self.args.outpath, outname),
                f=f,
                func_name=func_name,
                masters=masters,
                func_boffset=func_boffset_str,
                func_start=func_offset,
                func_end=func_end,
                invariant_annotations=invariant_annotations,
                offsets=offsets,
            )

    def generate_theories(self):
        self.generate_base_theory()

        for fn in self.args.function:
            self.generate_function_theory(fn)
