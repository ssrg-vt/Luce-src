(*
Copyright 2018

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
*)
theory sys_open_mem
  imports syscall
begin

text \<open>Up to two locales per function in the binary.\<close>
locale sys_open_function = syscall_context +
  fixes rsp\<^sub>0 rbp\<^sub>0 canary a sys_open_ret :: \<open>64 word\<close>
    and v\<^sub>0 :: \<open>8 word\<close>
    and blocks :: \<open>(nat \<times> 64 word \<times> nat) set\<close>
  assumes seps: \<open>seps blocks\<close>
    and masters:
      \<open>master blocks (a, 1) 0\<close>
      \<open>master blocks (rsp\<^sub>0, 8) 1\<close>
      \<open>master blocks (rsp\<^sub>0-8, 8) 2\<close>
      \<open>master blocks (rsp\<^sub>0-16, 8) 3\<close>
      \<open>master blocks (rsp\<^sub>0-24, 4) 4\<close>
      \<open>master blocks (rsp\<^sub>0-28, 4) 5\<close>
      \<open>master blocks (rsp\<^sub>0-32, 4) 6\<close>
      \<open>master blocks (rsp\<^sub>0-40, 8) 7\<close>
      \<open>master blocks (rsp\<^sub>0-44, 4) 8\<close>
      \<open>master blocks (rsp\<^sub>0-48, 4) 9\<close>
      \<open>master blocks (rsp\<^sub>0-52, 4) 10\<close>
      \<open>master blocks (rsp\<^sub>0-56, 4) 11\<close>
      \<open>master blocks (rsp\<^sub>0-64, 8) 12\<close>
      \<open>master blocks (rsp\<^sub>0-68, 4) 13\<close>
      \<open>master blocks (rsp\<^sub>0-72, 4) 14\<close>
      \<open>master blocks (canary, 8) 15\<close>
    and ret_address: \<open>outside sys_open_ret 962 1429\<close> \<comment> \<open>Only works for non-recursive functions.\<close>
begin

text \<open>
  The Floyd invariant expresses for some locations properties that are invariably true.
  Simply expresses that a byte in the memory remains untouched.
\<close>
definition pp_\<Theta> :: floyd_invar where
  \<open>pp_\<Theta> \<equiv> [
    \<comment> \<open>precondition\<close>
    boffset+962 \<mapsto> \<lambda>\<sigma>. regs \<sigma> rsp = rsp\<^sub>0
      \<and> regs \<sigma> rbp = rbp\<^sub>0
      \<and> regs \<sigma> fs + 40 = canary
      \<and> \<sigma> \<turnstile> *[rsp\<^sub>0,8] = boffset+sys_open_ret
      \<and> \<sigma> \<turnstile> *[a,1] = v\<^sub>0,
    boffset+995 \<mapsto> \<lambda>\<sigma>. regs \<sigma> rsp = rsp\<^sub>0-72
      \<and> regs \<sigma> rbp = rsp\<^sub>0-8
      \<and> regs \<sigma> fs + 40 = canary
      \<and> \<sigma> \<turnstile> *[rsp\<^sub>0-8,8] = rbp\<^sub>0
      \<and> \<sigma> \<turnstile> *[rsp\<^sub>0,8] = boffset+sys_open_ret
      \<and> \<sigma> \<turnstile> *[a,1] = v\<^sub>0,
    boffset+1000 \<mapsto> \<lambda>\<sigma>. regs \<sigma> rsp = rsp\<^sub>0-72
      \<and> regs \<sigma> rbp = rsp\<^sub>0-8
      \<and> regs \<sigma> fs + 40 = canary
      \<and> \<sigma> \<turnstile> *[rsp\<^sub>0-8,8] = rbp\<^sub>0
      \<and> \<sigma> \<turnstile> *[rsp\<^sub>0,8] = boffset+sys_open_ret
      \<and> \<sigma> \<turnstile> *[a,1] = v\<^sub>0,
    boffset+1011 \<mapsto> \<lambda>\<sigma>. regs \<sigma> rsp = rsp\<^sub>0-72
      \<and> regs \<sigma> rbp = rsp\<^sub>0-8
      \<and> regs \<sigma> fs + 40 = canary
      \<and> \<sigma> \<turnstile> *[rsp\<^sub>0-8,8] = rbp\<^sub>0
      \<and> \<sigma> \<turnstile> *[rsp\<^sub>0,8] = boffset+sys_open_ret
      \<and> \<sigma> \<turnstile> *[a,1] = v\<^sub>0,
    boffset+1016 \<mapsto> \<lambda>\<sigma>. regs \<sigma> rsp = rsp\<^sub>0-72
      \<and> regs \<sigma> rbp = rsp\<^sub>0-8
      \<and> regs \<sigma> fs + 40 = canary
      \<and> \<sigma> \<turnstile> *[rsp\<^sub>0-8,8] = rbp\<^sub>0
      \<and> \<sigma> \<turnstile> *[rsp\<^sub>0,8] = boffset+sys_open_ret
      \<and> \<sigma> \<turnstile> *[a,1] = v\<^sub>0,
    boffset+1046 \<mapsto> \<lambda>\<sigma>. regs \<sigma> rsp = rsp\<^sub>0-72
      \<and> regs \<sigma> rbp = rsp\<^sub>0-8
      \<and> regs \<sigma> fs + 40 = canary
      \<and> \<sigma> \<turnstile> *[rsp\<^sub>0-8,8] = rbp\<^sub>0
      \<and> \<sigma> \<turnstile> *[rsp\<^sub>0,8] = boffset+sys_open_ret
      \<and> \<sigma> \<turnstile> *[a,1] = v\<^sub>0,
    boffset+1051 \<mapsto> \<lambda>\<sigma>. regs \<sigma> rsp = rsp\<^sub>0-72
      \<and> regs \<sigma> rbp = rsp\<^sub>0-8
      \<and> regs \<sigma> fs + 40 = canary
      \<and> \<sigma> \<turnstile> *[rsp\<^sub>0-8,8] = rbp\<^sub>0
      \<and> \<sigma> \<turnstile> *[rsp\<^sub>0,8] = boffset+sys_open_ret
      \<and> \<sigma> \<turnstile> *[a,1] = v\<^sub>0,
    boffset+1058 \<mapsto> \<lambda>\<sigma>. regs \<sigma> rsp = rsp\<^sub>0-72
      \<and> regs \<sigma> rbp = rsp\<^sub>0-8
      \<and> regs \<sigma> fs + 40 = canary
      \<and> \<sigma> \<turnstile> *[rsp\<^sub>0-8,8] = rbp\<^sub>0
      \<and> \<sigma> \<turnstile> *[rsp\<^sub>0,8] = boffset+sys_open_ret
      \<and> \<sigma> \<turnstile> *[a,1] = v\<^sub>0,
    boffset+1063 \<mapsto> \<lambda>\<sigma>. regs \<sigma> rsp = rsp\<^sub>0-72
      \<and> regs \<sigma> rbp = rsp\<^sub>0-8
      \<and> regs \<sigma> fs + 40 = canary
      \<and> \<sigma> \<turnstile> *[rsp\<^sub>0-8,8] = rbp\<^sub>0
      \<and> \<sigma> \<turnstile> *[rsp\<^sub>0,8] = boffset+sys_open_ret
      \<and> \<sigma> \<turnstile> *[a,1] = v\<^sub>0,
    boffset+1085 \<mapsto> \<lambda>\<sigma>. regs \<sigma> rsp = rsp\<^sub>0-72
      \<and> regs \<sigma> rbp = rsp\<^sub>0-8
      \<and> regs \<sigma> fs + 40 = canary
      \<and> \<sigma> \<turnstile> *[rsp\<^sub>0-8,8] = rbp\<^sub>0
      \<and> \<sigma> \<turnstile> *[rsp\<^sub>0,8] = boffset+sys_open_ret
      \<and> \<sigma> \<turnstile> *[a,1] = v\<^sub>0,
    boffset+1090 \<mapsto> \<lambda>\<sigma>. regs \<sigma> rsp = rsp\<^sub>0-72
      \<and> regs \<sigma> rbp = rsp\<^sub>0-8
      \<and> regs \<sigma> fs + 40 = canary
      \<and> \<sigma> \<turnstile> *[rsp\<^sub>0-8,8] = rbp\<^sub>0
      \<and> \<sigma> \<turnstile> *[rsp\<^sub>0,8] = boffset+sys_open_ret
      \<and> \<sigma> \<turnstile> *[a,1] = v\<^sub>0,
    boffset+1128 \<mapsto> \<lambda>\<sigma>. regs \<sigma> rsp = rsp\<^sub>0-72
      \<and> regs \<sigma> rbp = rsp\<^sub>0-8
      \<and> regs \<sigma> fs + 40 = canary
      \<and> \<sigma> \<turnstile> *[rsp\<^sub>0-8,8] = rbp\<^sub>0
      \<and> \<sigma> \<turnstile> *[rsp\<^sub>0,8] = boffset+sys_open_ret
      \<and> \<sigma> \<turnstile> *[a,1] = v\<^sub>0,
    boffset+1133 \<mapsto> \<lambda>\<sigma>. regs \<sigma> rsp = rsp\<^sub>0-72
      \<and> regs \<sigma> rbp = rsp\<^sub>0-8
      \<and> regs \<sigma> fs + 40 = canary
      \<and> \<sigma> \<turnstile> *[rsp\<^sub>0-8,8] = rbp\<^sub>0
      \<and> \<sigma> \<turnstile> *[rsp\<^sub>0,8] = boffset+sys_open_ret
      \<and> \<sigma> \<turnstile> *[a,1] = v\<^sub>0,
    boffset+1158 \<mapsto> \<lambda>\<sigma>. regs \<sigma> rsp = rsp\<^sub>0-72
      \<and> regs \<sigma> rbp = rsp\<^sub>0-8
      \<and> regs \<sigma> fs + 40 = canary
      \<and> \<sigma> \<turnstile> *[rsp\<^sub>0-8,8] = rbp\<^sub>0
      \<and> \<sigma> \<turnstile> *[rsp\<^sub>0,8] = boffset+sys_open_ret
      \<and> \<sigma> \<turnstile> *[a,1] = v\<^sub>0,
    boffset+1163 \<mapsto> \<lambda>\<sigma>. regs \<sigma> rsp = rsp\<^sub>0-72
      \<and> regs \<sigma> rbp = rsp\<^sub>0-8
      \<and> regs \<sigma> fs + 40 = canary
      \<and> \<sigma> \<turnstile> *[rsp\<^sub>0-8,8] = rbp\<^sub>0
      \<and> \<sigma> \<turnstile> *[rsp\<^sub>0,8] = boffset+sys_open_ret
      \<and> \<sigma> \<turnstile> *[a,1] = v\<^sub>0,
    boffset+1194 \<mapsto> \<lambda>\<sigma>. regs \<sigma> rsp = rsp\<^sub>0-72
      \<and> regs \<sigma> rbp = rsp\<^sub>0-8
      \<and> regs \<sigma> fs + 40 = canary
      \<and> \<sigma> \<turnstile> *[rsp\<^sub>0-8,8] = rbp\<^sub>0
      \<and> \<sigma> \<turnstile> *[rsp\<^sub>0,8] = boffset+sys_open_ret
      \<and> \<sigma> \<turnstile> *[a,1] = v\<^sub>0,
    boffset+1199 \<mapsto> \<lambda>\<sigma>. regs \<sigma> rsp = rsp\<^sub>0-72
      \<and> regs \<sigma> rbp = rsp\<^sub>0-8
      \<and> regs \<sigma> fs + 40 = canary
      \<and> \<sigma> \<turnstile> *[rsp\<^sub>0-8,8] = rbp\<^sub>0
      \<and> \<sigma> \<turnstile> *[rsp\<^sub>0,8] = boffset+sys_open_ret
      \<and> \<sigma> \<turnstile> *[a,1] = v\<^sub>0,
    boffset+1255 \<mapsto> \<lambda>\<sigma>. regs \<sigma> rsp = rsp\<^sub>0-72
      \<and> regs \<sigma> rbp = rsp\<^sub>0-8
      \<and> regs \<sigma> fs + 40 = canary
      \<and> \<sigma> \<turnstile> *[rsp\<^sub>0-8,8] = rbp\<^sub>0
      \<and> \<sigma> \<turnstile> *[rsp\<^sub>0,8] = boffset+sys_open_ret
      \<and> \<sigma> \<turnstile> *[a,1] = v\<^sub>0,
    boffset+1260 \<mapsto> \<lambda>\<sigma>. regs \<sigma> rsp = rsp\<^sub>0-72
      \<and> regs \<sigma> rbp = rsp\<^sub>0-8
      \<and> regs \<sigma> fs + 40 = canary
      \<and> \<sigma> \<turnstile> *[rsp\<^sub>0-8,8] = rbp\<^sub>0
      \<and> \<sigma> \<turnstile> *[rsp\<^sub>0,8] = boffset+sys_open_ret
      \<and> \<sigma> \<turnstile> *[a,1] = v\<^sub>0,
    boffset+1276 \<mapsto> \<lambda>\<sigma>. regs \<sigma> rsp = rsp\<^sub>0-72
      \<and> regs \<sigma> rbp = rsp\<^sub>0-8
      \<and> regs \<sigma> fs + 40 = canary
      \<and> \<sigma> \<turnstile> *[rsp\<^sub>0-8,8] = rbp\<^sub>0
      \<and> \<sigma> \<turnstile> *[rsp\<^sub>0,8] = boffset+sys_open_ret
      \<and> \<sigma> \<turnstile> *[a,1] = v\<^sub>0,
    boffset+1308 \<mapsto> \<lambda>\<sigma>. regs \<sigma> rsp = rsp\<^sub>0-72
      \<and> regs \<sigma> rbp = rsp\<^sub>0-8
      \<and> regs \<sigma> fs + 40 = canary
      \<and> \<sigma> \<turnstile> *[rsp\<^sub>0-8,8] = rbp\<^sub>0
      \<and> \<sigma> \<turnstile> *[rsp\<^sub>0,8] = boffset+sys_open_ret
      \<and> \<sigma> \<turnstile> *[a,1] = v\<^sub>0,
    boffset+1313 \<mapsto> \<lambda>\<sigma>. regs \<sigma> rsp = rsp\<^sub>0-72
      \<and> regs \<sigma> rbp = rsp\<^sub>0-8
      \<and> regs \<sigma> fs + 40 = canary
      \<and> \<sigma> \<turnstile> *[rsp\<^sub>0-8,8] = rbp\<^sub>0
      \<and> \<sigma> \<turnstile> *[rsp\<^sub>0,8] = boffset+sys_open_ret
      \<and> \<sigma> \<turnstile> *[a,1] = v\<^sub>0,
    boffset+1340 \<mapsto> \<lambda>\<sigma>. regs \<sigma> rsp = rsp\<^sub>0-72
      \<and> regs \<sigma> rbp = rsp\<^sub>0-8
      \<and> regs \<sigma> fs + 40 = canary
      \<and> \<sigma> \<turnstile> *[rsp\<^sub>0-8,8] = rbp\<^sub>0
      \<and> \<sigma> \<turnstile> *[rsp\<^sub>0,8] = boffset+sys_open_ret
      \<and> \<sigma> \<turnstile> *[a,1] = v\<^sub>0,
    boffset+1345 \<mapsto> \<lambda>\<sigma>. regs \<sigma> rsp = rsp\<^sub>0-72
      \<and> regs \<sigma> rbp = rsp\<^sub>0-8
      \<and> regs \<sigma> fs + 40 = canary
      \<and> \<sigma> \<turnstile> *[rsp\<^sub>0-8,8] = rbp\<^sub>0
      \<and> \<sigma> \<turnstile> *[rsp\<^sub>0,8] = boffset+sys_open_ret
      \<and> \<sigma> \<turnstile> *[a,1] = v\<^sub>0,
    boffset+1372 \<mapsto> \<lambda>\<sigma>. regs \<sigma> rsp = rsp\<^sub>0-72
      \<and> regs \<sigma> rbp = rsp\<^sub>0-8
      \<and> regs \<sigma> fs + 40 = canary
      \<and> \<sigma> \<turnstile> *[rsp\<^sub>0-8,8] = rbp\<^sub>0
      \<and> \<sigma> \<turnstile> *[rsp\<^sub>0,8] = boffset+sys_open_ret
      \<and> \<sigma> \<turnstile> *[a,1] = v\<^sub>0,
    boffset+1377 \<mapsto> \<lambda>\<sigma>. regs \<sigma> rsp = rsp\<^sub>0-72
      \<and> regs \<sigma> rbp = rsp\<^sub>0-8
      \<and> regs \<sigma> fs + 40 = canary
      \<and> \<sigma> \<turnstile> *[rsp\<^sub>0-8,8] = rbp\<^sub>0
      \<and> \<sigma> \<turnstile> *[rsp\<^sub>0,8] = boffset+sys_open_ret
      \<and> \<sigma> \<turnstile> *[a,1] = v\<^sub>0,
    boffset+1392 \<mapsto> \<lambda>\<sigma>. regs \<sigma> rsp = rsp\<^sub>0-72
      \<and> regs \<sigma> rbp = rsp\<^sub>0-8
      \<and> regs \<sigma> fs + 40 = canary
      \<and> \<sigma> \<turnstile> *[rsp\<^sub>0-8,8] = rbp\<^sub>0
      \<and> \<sigma> \<turnstile> *[rsp\<^sub>0,8] = boffset+sys_open_ret
      \<and> \<sigma> \<turnstile> *[a,1] = v\<^sub>0,
    boffset+1399 \<mapsto> \<lambda>\<sigma>. regs \<sigma> rsp = rsp\<^sub>0-72
      \<and> regs \<sigma> rbp = rsp\<^sub>0-8
      \<and> regs \<sigma> fs + 40 = canary
      \<and> \<sigma> \<turnstile> *[rsp\<^sub>0-8,8] = rbp\<^sub>0
      \<and> \<sigma> \<turnstile> *[rsp\<^sub>0,8] = boffset+sys_open_ret
      \<and> \<sigma> \<turnstile> *[a,1] = v\<^sub>0,
    boffset+1404 \<mapsto> \<lambda>\<sigma>. regs \<sigma> rsp = rsp\<^sub>0-72
      \<and> regs \<sigma> rbp = rsp\<^sub>0-8
      \<and> regs \<sigma> fs + 40 = canary
      \<and> \<sigma> \<turnstile> *[rsp\<^sub>0-8,8] = rbp\<^sub>0
      \<and> \<sigma> \<turnstile> *[rsp\<^sub>0,8] = boffset+sys_open_ret
      \<and> \<sigma> \<turnstile> *[a,1] = v\<^sub>0,
    boffset+1407 \<mapsto> \<lambda>\<sigma>. regs \<sigma> rsp = rsp\<^sub>0-72
      \<and> regs \<sigma> rbp = rsp\<^sub>0-8
      \<and> regs \<sigma> fs + 40 = canary
      \<and> \<sigma> \<turnstile> *[rsp\<^sub>0-8,8] = rbp\<^sub>0
      \<and> \<sigma> \<turnstile> *[rsp\<^sub>0,8] = boffset+sys_open_ret
      \<and> \<sigma> \<turnstile> *[a,1] = v\<^sub>0,
    boffset+1422 \<mapsto> \<lambda>\<sigma>. regs \<sigma> rsp = rsp\<^sub>0-72
      \<and> regs \<sigma> rbp = rsp\<^sub>0-8
      \<and> regs \<sigma> fs + 40 = canary
      \<and> \<sigma> \<turnstile> *[rsp\<^sub>0-8,8] = rbp\<^sub>0
      \<and> \<sigma> \<turnstile> *[rsp\<^sub>0,8] = boffset+sys_open_ret
      \<and> \<sigma> \<turnstile> *[a,1] = v\<^sub>0,
    boffset+1427 \<mapsto> \<lambda>\<sigma>. regs \<sigma> rsp = rsp\<^sub>0-72
      \<and> regs \<sigma> rbp = rsp\<^sub>0-8
      \<and> regs \<sigma> fs + 40 = canary
      \<and> \<sigma> \<turnstile> *[rsp\<^sub>0-8,8] = rbp\<^sub>0
      \<and> \<sigma> \<turnstile> *[rsp\<^sub>0,8] = boffset+sys_open_ret
      \<and> \<sigma> \<turnstile> *[a,1] = v\<^sub>0,
    \<comment> \<open>postcondition\<close>
    boffset+sys_open_ret \<mapsto> \<lambda>\<sigma>. \<sigma> \<turnstile> *[a,1] = v\<^sub>0
      \<and> regs \<sigma> rsp = rsp\<^sub>0+8
      \<and> regs \<sigma> rbp = rbp\<^sub>0
  ]\<close>

text \<open>Adding some rules to the simplifier to simplify proofs.\<close>
schematic_goal pp_\<Theta>_zero[simp]:
  shows \<open>pp_\<Theta> boffset = ?x\<close>
  unfolding pp_\<Theta>_def
  by simp
schematic_goal pp_\<Theta>_numeral_l[simp]:
  shows \<open>pp_\<Theta> (n + boffset) = ?x\<close>
  unfolding pp_\<Theta>_def
  by simp
schematic_goal pp_\<Theta>_numeral_r[simp]:
  shows \<open>pp_\<Theta> (boffset + n) = ?x\<close>
  unfolding pp_\<Theta>_def
  by simp

end

locale sys_open_function_calls = sys_open_function +
  fixes spinlock_irqsave_lock stack_chk_fail socket_recv is_uhyve virt_to_phys socket_send strlen spinlock_irqsave_unlock uhyve_send :: \<open>state \<Rightarrow> state\<close>
  assumes spinlock_irqsave_lock_def: \<open>exec_instr assembly semantics tasks_flag_annotation (Unary (IS_8088 Call) (Immediate (ImmLabel ''spinlock_irqsave_lock''))) 5 = spinlock_irqsave_lock\<close>
    and spinlock_irqsave_lock_incr: \<open>regs (spinlock_irqsave_lock \<sigma>) rip = regs \<sigma> rip + 5\<close>
    and spinlock_irqsave_lock1085: \<open>the (pp_\<Theta> (boffset+1085)) \<sigma> \<Longrightarrow> the (pp_\<Theta> (boffset+1090)) (spinlock_irqsave_lock \<sigma>)\<close>
    and stack_chk_fail_def: \<open>exec_instr assembly semantics tasks_flag_annotation (Unary (IS_8088 Call) (Immediate (ImmLabel ''__stack_chk_fail''))) 5 = stack_chk_fail\<close>
    and stack_chk_fail_incr: \<open>regs (stack_chk_fail \<sigma>) rip = regs \<sigma> rip + 5\<close>
    and stack_chk_fail1422: \<open>the (pp_\<Theta> (boffset+1422)) \<sigma> \<Longrightarrow> the (pp_\<Theta> (boffset+1427)) (stack_chk_fail \<sigma>)\<close>
    and socket_recv_def: \<open>exec_instr assembly semantics tasks_flag_annotation (Unary (IS_8088 Call) (Immediate (ImmLabel ''socket_recv''))) 5 = socket_recv\<close>
    and socket_recv_incr: \<open>regs (socket_recv \<sigma>) rip = regs \<sigma> rip + 5\<close>
    and socket_recv1372: \<open>the (pp_\<Theta> (boffset+1372)) \<sigma> \<Longrightarrow> the (pp_\<Theta> (boffset+1377)) (socket_recv \<sigma>)\<close>
    and is_uhyve_def: \<open>exec_instr assembly semantics tasks_flag_annotation (Unary (IS_8088 Call) (Immediate (ImmLabel ''is_uhyve''))) 5 = is_uhyve\<close>
    and is_uhyve_incr: \<open>regs (is_uhyve \<sigma>) rip = regs \<sigma> rip + 5\<close>
    and is_uhyve995: \<open>the (pp_\<Theta> (boffset+995)) \<sigma> \<Longrightarrow> the (pp_\<Theta> (boffset+1000)) (is_uhyve \<sigma>)\<close>
    and virt_to_phys_def: \<open>exec_instr assembly semantics tasks_flag_annotation (Unary (IS_8088 Call) (Immediate (ImmLabel ''virt_to_phys''))) 5 = virt_to_phys\<close>
    and virt_to_phys_incr: \<open>regs (virt_to_phys \<sigma>) rip = regs \<sigma> rip + 5\<close>
    and virt_to_phys1011: \<open>the (pp_\<Theta> (boffset+1011)) \<sigma> \<Longrightarrow> the (pp_\<Theta> (boffset+1016)) (virt_to_phys \<sigma>)\<close>
    and virt_to_phys1046: \<open>the (pp_\<Theta> (boffset+1046)) \<sigma> \<Longrightarrow> the (pp_\<Theta> (boffset+1051)) (virt_to_phys \<sigma>)\<close>
    and socket_send_def: \<open>exec_instr assembly semantics tasks_flag_annotation (Unary (IS_8088 Call) (Immediate (ImmLabel ''socket_send''))) 5 = socket_send\<close>
    and socket_send_incr: \<open>regs (socket_send \<sigma>) rip = regs \<sigma> rip + 5\<close>
    and socket_send1158: \<open>the (pp_\<Theta> (boffset+1158)) \<sigma> \<Longrightarrow> the (pp_\<Theta> (boffset+1163)) (socket_send \<sigma>)\<close>
    and socket_send1194: \<open>the (pp_\<Theta> (boffset+1194)) \<sigma> \<Longrightarrow> the (pp_\<Theta> (boffset+1199)) (socket_send \<sigma>)\<close>
    and socket_send1255: \<open>the (pp_\<Theta> (boffset+1255)) \<sigma> \<Longrightarrow> the (pp_\<Theta> (boffset+1260)) (socket_send \<sigma>)\<close>
    and socket_send1308: \<open>the (pp_\<Theta> (boffset+1308)) \<sigma> \<Longrightarrow> the (pp_\<Theta> (boffset+1313)) (socket_send \<sigma>)\<close>
    and socket_send1340: \<open>the (pp_\<Theta> (boffset+1340)) \<sigma> \<Longrightarrow> the (pp_\<Theta> (boffset+1345)) (socket_send \<sigma>)\<close>
    and strlen_def: \<open>exec_instr assembly semantics tasks_flag_annotation (Unary (IS_8088 Call) (Immediate (ImmLabel ''strlen''))) 5 = strlen\<close>
    and strlen_incr: \<open>regs (strlen \<sigma>) rip = regs \<sigma> rip + 5\<close>
    and strlen1128: \<open>the (pp_\<Theta> (boffset+1128)) \<sigma> \<Longrightarrow> the (pp_\<Theta> (boffset+1133)) (strlen \<sigma>)\<close>
    and spinlock_irqsave_unlock_def: \<open>exec_instr assembly semantics tasks_flag_annotation (Unary (IS_8088 Call) (Immediate (ImmLabel ''spinlock_irqsave_unlock''))) 5 = spinlock_irqsave_unlock\<close>
    and spinlock_irqsave_unlock_incr: \<open>regs (spinlock_irqsave_unlock \<sigma>) rip = regs \<sigma> rip + 5\<close>
    and spinlock_irqsave_unlock1399: \<open>the (pp_\<Theta> (boffset+1399)) \<sigma> \<Longrightarrow> the (pp_\<Theta> (boffset+1404)) (spinlock_irqsave_unlock \<sigma>)\<close>
    and uhyve_send_def: \<open>exec_instr assembly semantics tasks_flag_annotation (Unary (IS_8088 Call) (Immediate (ImmLabel ''uhyve_send''))) 5 = uhyve_send\<close>
    and uhyve_send_incr: \<open>regs (uhyve_send \<sigma>) rip = regs \<sigma> rip + 5\<close>
    and uhyve_send1058: \<open>the (pp_\<Theta> (boffset+1058)) \<sigma> \<Longrightarrow> the (pp_\<Theta> (boffset+1063)) (uhyve_send \<sigma>)\<close>
begin

lemma rewrite_sys_open_mem:
  \<open>is_std_invar sys_open_ret (floyd.invar sys_open_ret pp_\<Theta>)\<close>
  text \<open>Boilerplate code to start the VCG\<close>
  apply (rule floyd_invarI)
  apply (rewrite at \<open>floyd_vcs sys_open_ret \<hole> _\<close> pp_\<Theta>_def)
  apply (intro floyd_vcsI)

  text \<open>Subgoal for rip = boffset+962\<close>
  subgoal premises prems for \<sigma>
    text \<open>Insert relevant knowledge\<close>
    apply (insert prems seps ret_address)
    text \<open>Apply VCG/symb.\ execution\<close>
    apply (restart_symbolic_execution?, (symbolic_execution masters: masters)+, (finish_symbolic_execution masters: masters)?)+
    done

  text \<open>Subgoal for rip = boffset+995\<close>
  subgoal premises prems for \<sigma>
    text \<open>Insert relevant knowledge\<close>
    apply (insert prems seps ret_address)
    text \<open>Discharge function call\<close>
    apply (rule wps_rls)
    apply (simp (no_asm_simp) add: lookup_table_def instr_index_def entry_size_def)
    apply (rewrite_one_let' add: assembly_def)
    apply (rewrite_one_let' add: is_uhyve_def)
    apply (rule floyd_invarI'[of _ _ \<open>the (pp_\<Theta> (boffset+1000))\<close>])
     apply (simp add: is_uhyve_incr)
    using is_uhyve995
    apply simp
    done

  text \<open>Subgoal for rip = boffset+1000\<close>
  subgoal premises prems for \<sigma>
    text \<open>Insert relevant knowledge\<close>
    apply (insert prems seps ret_address)
    text \<open>Apply VCG/symb.\ execution\<close>
    apply (restart_symbolic_execution?, (symbolic_execution masters: masters)+, (finish_symbolic_execution masters: masters)?)+
    apply auto
    done

  text \<open>Subgoal for rip = boffset+1011\<close>
  subgoal premises prems for \<sigma>
    text \<open>Insert relevant knowledge\<close>
    apply (insert prems seps ret_address)
    text \<open>Discharge function call\<close>
    apply (rule wps_rls)
    apply (simp (no_asm_simp) add: lookup_table_def instr_index_def entry_size_def)
    apply (rewrite_one_let' add: assembly_def)
    apply (rewrite_one_let' add: virt_to_phys_def)
    apply (rule floyd_invarI'[of _ _ \<open>the (pp_\<Theta> (boffset+1016))\<close>])
     apply (simp add: virt_to_phys_incr)
    using virt_to_phys1011
    apply simp
    done

  text \<open>Subgoal for rip = boffset+1016\<close>
  subgoal premises prems for \<sigma>
    text \<open>Insert relevant knowledge\<close>
    apply (insert prems seps ret_address)
    text \<open>Apply VCG/symb.\ execution\<close>
    apply (restart_symbolic_execution?, (symbolic_execution masters: masters)+, (finish_symbolic_execution masters: masters)?)+
    done

  text \<open>Subgoal for rip = boffset+1046\<close>
  subgoal premises prems for \<sigma>
    text \<open>Insert relevant knowledge\<close>
    apply (insert prems seps ret_address)
    text \<open>Discharge function call\<close>
    apply (rule wps_rls)
    apply (simp (no_asm_simp) add: lookup_table_def instr_index_def entry_size_def)
    apply (rewrite_one_let' add: assembly_def)
    apply (rewrite_one_let' add: virt_to_phys_def)
    apply (rule floyd_invarI'[of _ _ \<open>the (pp_\<Theta> (boffset+1051))\<close>])
     apply (simp add: virt_to_phys_incr)
    using virt_to_phys1046
    apply simp
    done

  text \<open>Subgoal for rip = boffset+1051\<close>
  subgoal premises prems for \<sigma>
    text \<open>Insert relevant knowledge\<close>
    apply (insert prems seps ret_address)
    text \<open>Apply VCG/symb.\ execution\<close>
    apply (restart_symbolic_execution?, (symbolic_execution masters: masters)+, (finish_symbolic_execution masters: masters)?)+
    done

  text \<open>Subgoal for rip = boffset+1058\<close>
  subgoal premises prems for \<sigma>
    text \<open>Insert relevant knowledge\<close>
    apply (insert prems seps ret_address)
    text \<open>Discharge function call\<close>
    apply (rule wps_rls)
    apply (simp (no_asm_simp) add: lookup_table_def instr_index_def entry_size_def)
    apply (rewrite_one_let' add: assembly_def)
    apply (rewrite_one_let' add: uhyve_send_def)
    apply (rule floyd_invarI'[of _ _ \<open>the (pp_\<Theta> (boffset+1063))\<close>])
     apply (simp add: uhyve_send_incr)
    using uhyve_send1058
    apply simp
    done

  text \<open>Subgoal for rip = boffset+1063\<close>
  subgoal premises prems for \<sigma>
    text \<open>Insert relevant knowledge\<close>
    apply (insert prems seps ret_address)
    text \<open>Apply VCG/symb.\ execution\<close>
    apply (restart_symbolic_execution?, (symbolic_execution masters: masters)+, (finish_symbolic_execution masters: masters)?)+
    done

  text \<open>Subgoal for rip = boffset+1085\<close>
  subgoal premises prems for \<sigma>
    text \<open>Insert relevant knowledge\<close>
    apply (insert prems seps ret_address)
    text \<open>Discharge function call\<close>
    apply (rule wps_rls)
    apply (simp (no_asm_simp) add: lookup_table_def instr_index_def entry_size_def)
    apply (rewrite_one_let' add: assembly_def)
    apply (rewrite_one_let' add: spinlock_irqsave_lock_def)
    apply (rule floyd_invarI'[of _ _ \<open>the (pp_\<Theta> (boffset+1090))\<close>])
     apply (simp add: spinlock_irqsave_lock_incr)
    using spinlock_irqsave_lock1085
    apply simp
    done

  text \<open>Subgoal for rip = boffset+1090\<close>
  subgoal premises prems for \<sigma>
  proof -
    have x: \<open>regs \<sigma> rbp = rsp\<^sub>0 - 8\<close> \<comment> \<open>Not fully automatic here.\<close>
      using prems
      by simp
    show ?thesis
      text \<open>Insert relevant knowledge\<close>
      apply (insert prems seps ret_address)
      text \<open>Apply VCG/symb.\ execution\<close>
      apply ((restart_symbolic_execution add: x)?, (symbolic_execution add: x masters: masters)+, (finish_symbolic_execution add: x masters: masters)?)+
      done
  qed

  text \<open>Subgoal for rip = boffset+1128\<close>
  subgoal premises prems for \<sigma>
    text \<open>Insert relevant knowledge\<close>
    apply (insert prems seps ret_address)
    text \<open>Discharge function call\<close>
    apply (rule wps_rls)
    apply (simp (no_asm_simp) add: lookup_table_def instr_index_def entry_size_def)
    apply (rewrite_one_let' add: assembly_def)
    apply (rewrite_one_let' add: strlen_def)
    apply (rule floyd_invarI'[of _ _ \<open>the (pp_\<Theta> (boffset+1133))\<close>])
     apply (simp add: strlen_incr)
    using strlen1128
    apply simp
    done

  text \<open>Subgoal for rip = boffset+1133\<close>
  subgoal premises prems for \<sigma>
    text \<open>Insert relevant knowledge\<close>
    apply (insert prems seps ret_address)
    text \<open>Apply VCG/symb.\ execution\<close>
    apply (restart_symbolic_execution?, (symbolic_execution masters: masters)+, (finish_symbolic_execution masters: masters)?)+
    done

  text \<open>Subgoal for rip = boffset+1158\<close>
  subgoal premises prems for \<sigma>
    text \<open>Insert relevant knowledge\<close>
    apply (insert prems seps ret_address)
    text \<open>Discharge function call\<close>
    apply (rule wps_rls)
    apply (simp (no_asm_simp) add: lookup_table_def instr_index_def entry_size_def)
    apply (rewrite_one_let' add: assembly_def)
    apply (rewrite_one_let' add: socket_send_def)
    apply (rule floyd_invarI'[of _ _ \<open>the (pp_\<Theta> (boffset+1163))\<close>])
     apply (simp add: socket_send_incr)
    using socket_send1158
    apply simp
    done

  text \<open>Subgoal for rip = boffset+1163\<close>
  subgoal premises prems for \<sigma>
    text \<open>Insert relevant knowledge\<close>
    apply (insert prems seps ret_address)
    text \<open>Apply VCG/symb.\ execution\<close>
    apply (restart_symbolic_execution?, (symbolic_execution masters: masters)+, (finish_symbolic_execution masters: masters)?)+
    done

  text \<open>Subgoal for rip = boffset+1194\<close>
  subgoal premises prems for \<sigma>
    text \<open>Insert relevant knowledge\<close>
    apply (insert prems seps ret_address)
    text \<open>Discharge function call\<close>
    apply (rule wps_rls)
    apply (simp (no_asm_simp) add: lookup_table_def instr_index_def entry_size_def)
    apply (rewrite_one_let' add: assembly_def)
    apply (rewrite_one_let' add: socket_send_def)
    apply (rule floyd_invarI'[of _ _ \<open>the (pp_\<Theta> (boffset+1199))\<close>])
     apply (simp add: socket_send_incr)
    using socket_send1194
    apply simp
    done

  text \<open>Subgoal for rip = boffset+1199\<close>
  subgoal premises prems for \<sigma>
  proof -
    have x: \<open>regs \<sigma> rbp = rsp\<^sub>0 - 8\<close> \<comment> \<open>Not fully automatic here.\<close>
      using prems
      by simp
    show ?thesis
      text \<open>Insert relevant knowledge\<close>
      apply (insert prems seps ret_address)
      text \<open>Apply VCG/symb.\ execution\<close>
      apply ((restart_symbolic_execution add: x)?, (symbolic_execution add: x masters: masters)+, (finish_symbolic_execution add: x masters: masters)?)+
      done
  qed

  text \<open>Subgoal for rip = boffset+1255\<close>
  subgoal premises prems for \<sigma>
    text \<open>Insert relevant knowledge\<close>
    apply (insert prems seps ret_address)
    text \<open>Discharge function call\<close>
    apply (rule wps_rls)
    apply (simp (no_asm_simp) add: lookup_table_def instr_index_def entry_size_def)
    apply (rewrite_one_let' add: assembly_def)
    apply (rewrite_one_let' add: socket_send_def)
    apply (rule floyd_invarI'[of _ _ \<open>the (pp_\<Theta> (boffset+1260))\<close>])
     apply (simp add: socket_send_incr)
    using socket_send1255
    apply simp
    done

  text \<open>Subgoal for rip = boffset+1260\<close>
  subgoal premises prems for \<sigma>
  proof -
    have x: \<open>regs \<sigma> rbp = rsp\<^sub>0 - 8\<close> \<comment> \<open>Not fully automatic here.\<close>
      using prems
      by simp
    show ?thesis
      text \<open>Insert relevant knowledge\<close>
      apply (insert prems seps ret_address)
      text \<open>Apply VCG/symb.\ execution\<close>
      apply ((restart_symbolic_execution add: x)?, (symbolic_execution add: x masters: masters)+, (finish_symbolic_execution add: x masters: masters)?)+
      done
  qed

  text \<open>Subgoal for rip = boffset+1276\<close>
  subgoal premises prems for \<sigma>
    text \<open>Insert relevant knowledge\<close>
    apply (insert prems seps ret_address)
    text \<open>Apply VCG/symb.\ execution\<close>
    apply (restart_symbolic_execution?, (symbolic_execution masters: masters)+, (finish_symbolic_execution masters: masters)?)+
    apply auto
    done

  text \<open>Subgoal for rip = boffset+1308\<close>
  subgoal premises prems for \<sigma>
    text \<open>Insert relevant knowledge\<close>
    apply (insert prems seps ret_address)
    text \<open>Discharge function call\<close>
    apply (rule wps_rls)
    apply (simp (no_asm_simp) add: lookup_table_def instr_index_def entry_size_def)
    apply (rewrite_one_let' add: assembly_def)
    apply (rewrite_one_let' add: socket_send_def)
    apply (rule floyd_invarI'[of _ _ \<open>the (pp_\<Theta> (boffset+1313))\<close>])
     apply (simp add: socket_send_incr)
    using socket_send1308
    apply simp
    done

  text \<open>Subgoal for rip = boffset+1313\<close>
  subgoal premises prems for \<sigma>
    text \<open>Insert relevant knowledge\<close>
    apply (insert prems seps ret_address)
    text \<open>Apply VCG/symb.\ execution\<close>
    apply (restart_symbolic_execution?, (symbolic_execution masters: masters)+, (finish_symbolic_execution masters: masters)?)+
    done

  text \<open>Subgoal for rip = boffset+1340\<close>
  subgoal premises prems for \<sigma>
    text \<open>Insert relevant knowledge\<close>
    apply (insert prems seps ret_address)
    text \<open>Discharge function call\<close>
    apply (rule wps_rls)
    apply (simp (no_asm_simp) add: lookup_table_def instr_index_def entry_size_def)
    apply (rewrite_one_let' add: assembly_def)
    apply (rewrite_one_let' add: socket_send_def)
    apply (rule floyd_invarI'[of _ _ \<open>the (pp_\<Theta> (boffset+1345))\<close>])
     apply (simp add: socket_send_incr)
    using socket_send1340
    apply simp
    done

  text \<open>Subgoal for rip = boffset+1345\<close>
  subgoal premises prems for \<sigma>
    text \<open>Insert relevant knowledge\<close>
    apply (insert prems seps ret_address)
    text \<open>Apply VCG/symb.\ execution\<close>
    apply (restart_symbolic_execution?, (symbolic_execution masters: masters)+, (finish_symbolic_execution masters: masters)?)+
    done

  text \<open>Subgoal for rip = boffset+1372\<close>
  subgoal premises prems for \<sigma>
    text \<open>Insert relevant knowledge\<close>
    apply (insert prems seps ret_address)
    text \<open>Discharge function call\<close>
    apply (rule wps_rls)
    apply (simp (no_asm_simp) add: lookup_table_def instr_index_def entry_size_def)
    apply (rewrite_one_let' add: assembly_def)
    apply (rewrite_one_let' add: socket_recv_def)
    apply (rule floyd_invarI'[of _ _ \<open>the (pp_\<Theta> (boffset+1377))\<close>])
     apply (simp add: socket_recv_incr)
    using socket_recv1372
    apply simp
    done

  text \<open>Subgoal for rip = boffset+1377\<close>
  subgoal premises prems for \<sigma>
    text \<open>Insert relevant knowledge\<close>
    apply (insert prems seps ret_address)
    text \<open>Apply VCG/symb.\ execution\<close>
    apply (restart_symbolic_execution?, (symbolic_execution masters: masters)+, (finish_symbolic_execution masters: masters)?)+
    done

  text \<open>Subgoal for rip = boffset+1392\<close>
  subgoal premises prems for \<sigma>
    text \<open>Insert relevant knowledge\<close>
    apply (insert prems seps ret_address)
    text \<open>Apply VCG/symb.\ execution\<close>
    apply (restart_symbolic_execution?, (symbolic_execution masters: masters)+, (finish_symbolic_execution masters: masters)?)+
    done

  text \<open>Subgoal for rip = boffset+1399\<close>
  subgoal premises prems for \<sigma>
    text \<open>Insert relevant knowledge\<close>
    apply (insert prems seps ret_address)
    text \<open>Discharge function call\<close>
    apply (rule wps_rls)
    apply (simp (no_asm_simp) add: lookup_table_def instr_index_def entry_size_def)
    apply (rewrite_one_let' add: assembly_def)
    apply (rewrite_one_let' add: spinlock_irqsave_unlock_def)
    apply (rule floyd_invarI'[of _ _ \<open>the (pp_\<Theta> (boffset+1404))\<close>])
     apply (simp add: spinlock_irqsave_unlock_incr)
    using spinlock_irqsave_unlock1399
    apply simp
    done

  text \<open>Subgoal for rip = boffset+1404\<close>
  subgoal premises prems for \<sigma>
    text \<open>Insert relevant knowledge\<close>
    apply (insert prems seps ret_address)
    text \<open>Apply VCG/symb.\ execution\<close>
    apply (restart_symbolic_execution?, (symbolic_execution masters: masters)+, (finish_symbolic_execution masters: masters)?)+
    done

  text \<open>Subgoal for rip = boffset+1407\<close>
  subgoal premises prems for \<sigma>
    text \<open>Insert relevant knowledge\<close>
    apply (insert prems seps ret_address)
    text \<open>Apply VCG/symb.\ execution\<close>
    apply (restart_symbolic_execution?, (symbolic_execution masters: masters)+, (finish_symbolic_execution masters: masters)?)+
    apply restart_symbolic_execution
    apply auto
    done

  text \<open>Subgoal for rip = boffset+1422\<close>
  subgoal premises prems for \<sigma>
    text \<open>Insert relevant knowledge\<close>
    apply (insert prems seps ret_address)
    text \<open>Discharge function call\<close>
    apply (rule wps_rls)
    apply (simp (no_asm_simp) add: lookup_table_def instr_index_def entry_size_def)
    apply (rewrite_one_let' add: assembly_def)
    apply (rewrite_one_let' add: stack_chk_fail_def)
    apply (rule floyd_invarI'[of _ _ \<open>the (pp_\<Theta> (boffset+1427))\<close>])
     apply (simp add: stack_chk_fail_incr)
    using stack_chk_fail1422
    apply simp
    done

  text \<open>Subgoal for rip = boffset+1427\<close>
  subgoal premises prems for \<sigma>
    text \<open>Insert relevant knowledge\<close>
    apply (insert prems seps ret_address)
    text \<open>Apply VCG/symb.\ execution\<close>
    apply (restart_symbolic_execution?, (symbolic_execution masters: masters)+, (finish_symbolic_execution masters: masters)?)+
    done

  text \<open>Trivial ending subgoal.\<close>
  subgoal
    by simp
  done

end

end
