{callee}_def: \<open>exec_instr assembly semantics tasks_flag_annotation (Unary (IS_8088 Call) (Immediate (ImmLabel ''{callee}''))) {call_size} = {callee}\<close>
    and {callee}_incr: \<open>regs ({callee} \<sigma>) rip = regs \<sigma> rip + {call_size}\<close>
    and {callsites}
