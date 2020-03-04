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
theory sys_read_mem
  imports syscall
begin

text \<open>Up to two locales per function in the binary.\<close>
locale sys_read_function = syscall_context +
  fixes rsp\<^sub>0 rbp\<^sub>0 canary a sys_read_ret :: \<open>64 word\<close>
    and v\<^sub>0 :: \<open>8 word\<close>
    and blocks :: \<open>(nat \<times> 64 word \<times> nat) set\<close>
  assumes seps: \<open>seps blocks\<close>
    and masters:
      \<open>master blocks (a, 1) 0\<close>
      \<open>master blocks (rsp\<^sub>0, 8) 1\<close>
      \<open>master blocks (rsp\<^sub>0-8, 8) 2\<close>
      \<open>master blocks (rsp\<^sub>0-16, 8) 3\<close>
      \<open>master blocks (rsp\<^sub>0-36, 8) 4\<close>
      \<open>master blocks (rsp\<^sub>0-44, 8) 5\<close>
      \<open>master blocks (rsp\<^sub>0-52, 8) 6\<close>
      \<open>master blocks (rsp\<^sub>0-56, 4) 7\<close>
      \<open>master blocks (rsp\<^sub>0-64, 8) 8\<close>
      \<open>master blocks (rsp\<^sub>0-68, 4) 9\<close>
      \<open>master blocks (rsp\<^sub>0-72, 4) 10\<close>
      \<open>master blocks (rsp\<^sub>0-80, 8) 11\<close>
      \<open>master blocks (rsp\<^sub>0-88, 8) 12\<close>
      \<open>master blocks (rsp\<^sub>0-92, 4) 13\<close>
      \<open>master blocks (rsp\<^sub>0-108, 4) 14\<close>
      \<open>master blocks (rsp\<^sub>0-120, 8) 15\<close>
      \<open>master blocks (rsp\<^sub>0-128, 8) 16\<close>
      \<open>master blocks (canary, 8) 17\<close>
    and ret_address: \<open>outside sys_read_ret 1718 2173\<close> \<comment> \<open>Only works for non-recursive functions.\<close>
begin

text \<open>
  The Floyd invariant expresses for some locations properties that are invariably true.
  Simply expresses that a byte in the memory remains untouched.
\<close>
definition pp_\<Theta> :: floyd_invar where
  \<open>pp_\<Theta> \<equiv> [
    \<comment> \<open>precondition\<close>
    boffset+1718 \<mapsto> \<lambda>\<sigma>. regs \<sigma> rsp = rsp\<^sub>0
      \<and> regs \<sigma> rbp = rbp\<^sub>0
      \<and> regs \<sigma> fs + 40 = canary
      \<and> \<sigma> \<turnstile> *[rsp\<^sub>0,8] = boffset+sys_read_ret
      \<and> \<sigma> \<turnstile> *[a,1] = v\<^sub>0,
    boffset+1792 \<mapsto> \<lambda>\<sigma>. regs \<sigma> rsp = rsp\<^sub>0-136
      \<and> regs \<sigma> rbp = rsp\<^sub>0-8
      \<and> regs \<sigma> fs + 40 = canary
      \<and> \<sigma> \<turnstile> *[rsp\<^sub>0-8,8] = rbp\<^sub>0
      \<and> \<sigma> \<turnstile> *[rsp\<^sub>0,8] = boffset+sys_read_ret
      \<and> \<sigma> \<turnstile> *[a,1] = v\<^sub>0,
    boffset+1797 \<mapsto> \<lambda>\<sigma>. regs \<sigma> rsp = rsp\<^sub>0-136
      \<and> regs \<sigma> rbp = rsp\<^sub>0-8
      \<and> regs \<sigma> fs + 40 = canary
      \<and> \<sigma> \<turnstile> *[rsp\<^sub>0-8,8] = rbp\<^sub>0
      \<and> \<sigma> \<turnstile> *[rsp\<^sub>0,8] = boffset+sys_read_ret
      \<and> \<sigma> \<turnstile> *[a,1] = v\<^sub>0,
    boffset+1820 \<mapsto> \<lambda>\<sigma>. regs \<sigma> rsp = rsp\<^sub>0-136
      \<and> regs \<sigma> rbp = rsp\<^sub>0-8
      \<and> regs \<sigma> fs + 40 = canary
      \<and> \<sigma> \<turnstile> *[rsp\<^sub>0-8,8] = rbp\<^sub>0
      \<and> \<sigma> \<turnstile> *[rsp\<^sub>0,8] = boffset+sys_read_ret
      \<and> \<sigma> \<turnstile> *[a,1] = v\<^sub>0,
    boffset+1825 \<mapsto> \<lambda>\<sigma>. regs \<sigma> rsp = rsp\<^sub>0-136
      \<and> regs \<sigma> rbp = rsp\<^sub>0-8
      \<and> regs \<sigma> fs + 40 = canary
      \<and> \<sigma> \<turnstile> *[rsp\<^sub>0-8,8] = rbp\<^sub>0
      \<and> \<sigma> \<turnstile> *[rsp\<^sub>0,8] = boffset+sys_read_ret
      \<and> \<sigma> \<turnstile> *[a,1] = v\<^sub>0,
    boffset+1838 \<mapsto> \<lambda>\<sigma>. regs \<sigma> rsp = rsp\<^sub>0-136
      \<and> regs \<sigma> rbp = rsp\<^sub>0-8
      \<and> regs \<sigma> fs + 40 = canary
      \<and> \<sigma> \<turnstile> *[rsp\<^sub>0-8,8] = rbp\<^sub>0
      \<and> \<sigma> \<turnstile> *[rsp\<^sub>0,8] = boffset+sys_read_ret
      \<and> \<sigma> \<turnstile> *[a,1] = v\<^sub>0,
    boffset+1843 \<mapsto> \<lambda>\<sigma>. regs \<sigma> rsp = rsp\<^sub>0-136
      \<and> regs \<sigma> rbp = rsp\<^sub>0-8
      \<and> regs \<sigma> fs + 40 = canary
      \<and> \<sigma> \<turnstile> *[rsp\<^sub>0-8,8] = rbp\<^sub>0
      \<and> \<sigma> \<turnstile> *[rsp\<^sub>0,8] = boffset+sys_read_ret
      \<and> \<sigma> \<turnstile> *[a,1] = v\<^sub>0,
    boffset+1878 \<mapsto> \<lambda>\<sigma>. regs \<sigma> rsp = rsp\<^sub>0-136
      \<and> regs \<sigma> rbp = rsp\<^sub>0-8
      \<and> regs \<sigma> fs + 40 = canary
      \<and> \<sigma> \<turnstile> *[rsp\<^sub>0-8,8] = rbp\<^sub>0
      \<and> \<sigma> \<turnstile> *[rsp\<^sub>0,8] = boffset+sys_read_ret
      \<and> \<sigma> \<turnstile> *[a,1] = v\<^sub>0,
    boffset+1883 \<mapsto> \<lambda>\<sigma>. regs \<sigma> rsp = rsp\<^sub>0-136
      \<and> regs \<sigma> rbp = rsp\<^sub>0-8
      \<and> regs \<sigma> fs + 40 = canary
      \<and> \<sigma> \<turnstile> *[rsp\<^sub>0-8,8] = rbp\<^sub>0
      \<and> \<sigma> \<turnstile> *[rsp\<^sub>0,8] = boffset+sys_read_ret
      \<and> \<sigma> \<turnstile> *[a,1] = v\<^sub>0,
    boffset+1924 \<mapsto> \<lambda>\<sigma>. regs \<sigma> rsp = rsp\<^sub>0-136
      \<and> regs \<sigma> rbp = rsp\<^sub>0-8
      \<and> regs \<sigma> fs + 40 = canary
      \<and> \<sigma> \<turnstile> *[rsp\<^sub>0-8,8] = rbp\<^sub>0
      \<and> \<sigma> \<turnstile> *[rsp\<^sub>0,8] = boffset+sys_read_ret
      \<and> \<sigma> \<turnstile> *[a,1] = v\<^sub>0,
    boffset+1929 \<mapsto> \<lambda>\<sigma>. regs \<sigma> rsp = rsp\<^sub>0-136
      \<and> regs \<sigma> rbp = rsp\<^sub>0-8
      \<and> regs \<sigma> fs + 40 = canary
      \<and> \<sigma> \<turnstile> *[rsp\<^sub>0-8,8] = rbp\<^sub>0
      \<and> \<sigma> \<turnstile> *[rsp\<^sub>0,8] = boffset+sys_read_ret
      \<and> \<sigma> \<turnstile> *[a,1] = v\<^sub>0,
    boffset+1936 \<mapsto> \<lambda>\<sigma>. regs \<sigma> rsp = rsp\<^sub>0-136
      \<and> regs \<sigma> rbp = rsp\<^sub>0-8
      \<and> regs \<sigma> fs + 40 = canary
      \<and> \<sigma> \<turnstile> *[rsp\<^sub>0-8,8] = rbp\<^sub>0
      \<and> \<sigma> \<turnstile> *[rsp\<^sub>0,8] = boffset+sys_read_ret
      \<and> \<sigma> \<turnstile> *[a,1] = v\<^sub>0,
    boffset+1941 \<mapsto> \<lambda>\<sigma>. regs \<sigma> rsp = rsp\<^sub>0-136
      \<and> regs \<sigma> rbp = rsp\<^sub>0-8
      \<and> regs \<sigma> fs + 40 = canary
      \<and> \<sigma> \<turnstile> *[rsp\<^sub>0-8,8] = rbp\<^sub>0
      \<and> \<sigma> \<turnstile> *[rsp\<^sub>0,8] = boffset+sys_read_ret
      \<and> \<sigma> \<turnstile> *[a,1] = v\<^sub>0,
    boffset+1979 \<mapsto> \<lambda>\<sigma>. regs \<sigma> rsp = rsp\<^sub>0-136
      \<and> regs \<sigma> rbp = rsp\<^sub>0-8
      \<and> regs \<sigma> fs + 40 = canary
      \<and> \<sigma> \<turnstile> *[rsp\<^sub>0-8,8] = rbp\<^sub>0
      \<and> \<sigma> \<turnstile> *[rsp\<^sub>0,8] = boffset+sys_read_ret
      \<and> \<sigma> \<turnstile> *[a,1] = v\<^sub>0,
    boffset+1984 \<mapsto> \<lambda>\<sigma>. regs \<sigma> rsp = rsp\<^sub>0-136
      \<and> regs \<sigma> rbp = rsp\<^sub>0-8
      \<and> regs \<sigma> fs + 40 = canary
      \<and> \<sigma> \<turnstile> *[rsp\<^sub>0-8,8] = rbp\<^sub>0
      \<and> \<sigma> \<turnstile> *[rsp\<^sub>0,8] = boffset+sys_read_ret
      \<and> \<sigma> \<turnstile> *[a,1] = v\<^sub>0,
    boffset+2010 \<mapsto> \<lambda>\<sigma>. regs \<sigma> rsp = rsp\<^sub>0-136
      \<and> regs \<sigma> rbp = rsp\<^sub>0-8
      \<and> regs \<sigma> fs + 40 = canary
      \<and> \<sigma> \<turnstile> *[rsp\<^sub>0-8,8] = rbp\<^sub>0
      \<and> \<sigma> \<turnstile> *[rsp\<^sub>0,8] = boffset+sys_read_ret
      \<and> \<sigma> \<turnstile> *[a,1] = v\<^sub>0,
    boffset+2015 \<mapsto> \<lambda>\<sigma>. regs \<sigma> rsp = rsp\<^sub>0-136
      \<and> regs \<sigma> rbp = rsp\<^sub>0-8
      \<and> regs \<sigma> fs + 40 = canary
      \<and> \<sigma> \<turnstile> *[rsp\<^sub>0-8,8] = rbp\<^sub>0
      \<and> \<sigma> \<turnstile> *[rsp\<^sub>0,8] = boffset+sys_read_ret
      \<and> \<sigma> \<turnstile> *[a,1] = v\<^sub>0,
    boffset+2032 \<mapsto> \<lambda>\<sigma>. regs \<sigma> rsp = rsp\<^sub>0-136
      \<and> regs \<sigma> rbp = rsp\<^sub>0-8
      \<and> regs \<sigma> fs + 40 = canary
      \<and> \<sigma> \<turnstile> *[rsp\<^sub>0-8,8] = rbp\<^sub>0
      \<and> \<sigma> \<turnstile> *[rsp\<^sub>0,8] = boffset+sys_read_ret
      \<and> \<sigma> \<turnstile> *[a,1] = v\<^sub>0,
    boffset+2037 \<mapsto> \<lambda>\<sigma>. regs \<sigma> rsp = rsp\<^sub>0-136
      \<and> regs \<sigma> rbp = rsp\<^sub>0-8
      \<and> regs \<sigma> fs + 40 = canary
      \<and> \<sigma> \<turnstile> *[rsp\<^sub>0-8,8] = rbp\<^sub>0
      \<and> \<sigma> \<turnstile> *[rsp\<^sub>0,8] = boffset+sys_read_ret
      \<and> \<sigma> \<turnstile> *[a,1] = v\<^sub>0,
    boffset+2081 \<mapsto> \<lambda>\<sigma>. regs \<sigma> rsp = rsp\<^sub>0-136
      \<and> regs \<sigma> rbp = rsp\<^sub>0-8
      \<and> regs \<sigma> fs + 40 = canary
      \<and> \<sigma> \<turnstile> *[rsp\<^sub>0-8,8] = rbp\<^sub>0
      \<and> \<sigma> \<turnstile> *[rsp\<^sub>0,8] = boffset+sys_read_ret
      \<and> \<sigma> \<turnstile> *[a,1] = v\<^sub>0,
    boffset+2086 \<mapsto> \<lambda>\<sigma>. regs \<sigma> rsp = rsp\<^sub>0-136
      \<and> regs \<sigma> rbp = rsp\<^sub>0-8
      \<and> regs \<sigma> fs + 40 = canary
      \<and> \<sigma> \<turnstile> *[rsp\<^sub>0-8,8] = rbp\<^sub>0
      \<and> \<sigma> \<turnstile> *[rsp\<^sub>0,8] = boffset+sys_read_ret
      \<and> \<sigma> \<turnstile> *[a,1] = v\<^sub>0,
    boffset+2106 \<mapsto> \<lambda>\<sigma>. regs \<sigma> rsp = rsp\<^sub>0-136
      \<and> regs \<sigma> rbp = rsp\<^sub>0-8
      \<and> regs \<sigma> fs + 40 = canary
      \<and> \<sigma> \<turnstile> *[rsp\<^sub>0-8,8] = rbp\<^sub>0
      \<and> \<sigma> \<turnstile> *[rsp\<^sub>0,8] = boffset+sys_read_ret
      \<and> \<sigma> \<turnstile> *[a,1] = v\<^sub>0,
    boffset+2111 \<mapsto> \<lambda>\<sigma>. regs \<sigma> rsp = rsp\<^sub>0-136
      \<and> regs \<sigma> rbp = rsp\<^sub>0-8
      \<and> regs \<sigma> fs + 40 = canary
      \<and> \<sigma> \<turnstile> *[rsp\<^sub>0-8,8] = rbp\<^sub>0
      \<and> \<sigma> \<turnstile> *[rsp\<^sub>0,8] = boffset+sys_read_ret
      \<and> \<sigma> \<turnstile> *[a,1] = v\<^sub>0,
    boffset+2125 \<mapsto> \<lambda>\<sigma>. regs \<sigma> rsp = rsp\<^sub>0-136
      \<and> regs \<sigma> rbp = rsp\<^sub>0-8
      \<and> regs \<sigma> fs + 40 = canary
      \<and> \<sigma> \<turnstile> *[rsp\<^sub>0-8,8] = rbp\<^sub>0
      \<and> \<sigma> \<turnstile> *[rsp\<^sub>0,8] = boffset+sys_read_ret
      \<and> \<sigma> \<turnstile> *[a,1] = v\<^sub>0,
    boffset+2142 \<mapsto> \<lambda>\<sigma>. regs \<sigma> rsp = rsp\<^sub>0-136
      \<and> regs \<sigma> rbp = rsp\<^sub>0-8
      \<and> regs \<sigma> fs + 40 = canary
      \<and> \<sigma> \<turnstile> *[rsp\<^sub>0-8,8] = rbp\<^sub>0
      \<and> \<sigma> \<turnstile> *[rsp\<^sub>0,8] = boffset+sys_read_ret
      \<and> \<sigma> \<turnstile> *[a,1] = v\<^sub>0,
    boffset+2147 \<mapsto> \<lambda>\<sigma>. regs \<sigma> rsp = rsp\<^sub>0-136
      \<and> regs \<sigma> rbp = rsp\<^sub>0-8
      \<and> regs \<sigma> fs + 40 = canary
      \<and> \<sigma> \<turnstile> *[rsp\<^sub>0-8,8] = rbp\<^sub>0
      \<and> \<sigma> \<turnstile> *[rsp\<^sub>0,8] = boffset+sys_read_ret
      \<and> \<sigma> \<turnstile> *[a,1] = v\<^sub>0,
    boffset+2151 \<mapsto> \<lambda>\<sigma>. regs \<sigma> rsp = rsp\<^sub>0-136
      \<and> regs \<sigma> rbp = rsp\<^sub>0-8
      \<and> regs \<sigma> fs + 40 = canary
      \<and> \<sigma> \<turnstile> *[rsp\<^sub>0-8,8] = rbp\<^sub>0
      \<and> \<sigma> \<turnstile> *[rsp\<^sub>0,8] = boffset+sys_read_ret
      \<and> \<sigma> \<turnstile> *[a,1] = v\<^sub>0,
    boffset+2166 \<mapsto> \<lambda>\<sigma>. regs \<sigma> rsp = rsp\<^sub>0-136
      \<and> regs \<sigma> rbp = rsp\<^sub>0-8
      \<and> regs \<sigma> fs + 40 = canary
      \<and> \<sigma> \<turnstile> *[rsp\<^sub>0-8,8] = rbp\<^sub>0
      \<and> \<sigma> \<turnstile> *[rsp\<^sub>0,8] = boffset+sys_read_ret
      \<and> \<sigma> \<turnstile> *[a,1] = v\<^sub>0,
    boffset+2171 \<mapsto> \<lambda>\<sigma>. regs \<sigma> rsp = rsp\<^sub>0-136
      \<and> regs \<sigma> rbp = rsp\<^sub>0-8
      \<and> regs \<sigma> fs + 40 = canary
      \<and> \<sigma> \<turnstile> *[rsp\<^sub>0-8,8] = rbp\<^sub>0
      \<and> \<sigma> \<turnstile> *[rsp\<^sub>0,8] = boffset+sys_read_ret
      \<and> \<sigma> \<turnstile> *[a,1] = v\<^sub>0,
    \<comment> \<open>postcondition\<close>
    boffset+sys_read_ret \<mapsto> \<lambda>\<sigma>. \<sigma> \<turnstile> *[a,1] = v\<^sub>0
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

locale sys_read_function_calls = sys_read_function +
  fixes is_uhyve socket_send stack_chk_fail spinlock_irqsave_unlock lwip_read uhyve_send virt_to_phys socket_recv spinlock_irqsave_lock :: \<open>state \<Rightarrow> state\<close>
  assumes is_uhyve_def: \<open>exec_instr assembly semantics tasks_flag_annotation (Unary (IS_8088 Call) (Immediate (ImmLabel ''is_uhyve''))) 5 = is_uhyve\<close>
    and is_uhyve_incr: \<open>regs (is_uhyve \<sigma>) rip = regs \<sigma> rip + 5\<close>
    and is_uhyve1878: \<open>the (pp_\<Theta> (boffset+1878)) \<sigma> \<Longrightarrow> the (pp_\<Theta> (boffset+1883)) (is_uhyve \<sigma>)\<close>
    and socket_send_def: \<open>exec_instr assembly semantics tasks_flag_annotation (Unary (IS_8088 Call) (Immediate (ImmLabel ''socket_send''))) 5 = socket_send\<close>
    and socket_send_incr: \<open>regs (socket_send \<sigma>) rip = regs \<sigma> rip + 5\<close>
    and socket_send2010: \<open>the (pp_\<Theta> (boffset+2010)) \<sigma> \<Longrightarrow> the (pp_\<Theta> (boffset+2015)) (socket_send \<sigma>)\<close>
    and stack_chk_fail_def: \<open>exec_instr assembly semantics tasks_flag_annotation (Unary (IS_8088 Call) (Immediate (ImmLabel ''__stack_chk_fail''))) 5 = stack_chk_fail\<close>
    and stack_chk_fail_incr: \<open>regs (stack_chk_fail \<sigma>) rip = regs \<sigma> rip + 5\<close>
    and stack_chk_fail2166: \<open>the (pp_\<Theta> (boffset+2166)) \<sigma> \<Longrightarrow> the (pp_\<Theta> (boffset+2171)) (stack_chk_fail \<sigma>)\<close>
    and spinlock_irqsave_unlock_def: \<open>exec_instr assembly semantics tasks_flag_annotation (Unary (IS_8088 Call) (Immediate (ImmLabel ''spinlock_irqsave_unlock''))) 5 = spinlock_irqsave_unlock\<close>
    and spinlock_irqsave_unlock_incr: \<open>regs (spinlock_irqsave_unlock \<sigma>) rip = regs \<sigma> rip + 5\<close>
    and spinlock_irqsave_unlock1838: \<open>the (pp_\<Theta> (boffset+1838)) \<sigma> \<Longrightarrow> the (pp_\<Theta> (boffset+1843)) (spinlock_irqsave_unlock \<sigma>)\<close>
    and spinlock_irqsave_unlock2106: \<open>the (pp_\<Theta> (boffset+2106)) \<sigma> \<Longrightarrow> the (pp_\<Theta> (boffset+2111)) (spinlock_irqsave_unlock \<sigma>)\<close>
    and spinlock_irqsave_unlock2142: \<open>the (pp_\<Theta> (boffset+2142)) \<sigma> \<Longrightarrow> the (pp_\<Theta> (boffset+2147)) (spinlock_irqsave_unlock \<sigma>)\<close>
    and lwip_read_def: \<open>exec_instr assembly semantics tasks_flag_annotation (Unary (IS_8088 Call) (Immediate (ImmLabel ''lwip_read''))) 5 = lwip_read\<close>
    and lwip_read_incr: \<open>regs (lwip_read \<sigma>) rip = regs \<sigma> rip + 5\<close>
    and lwip_read1820: \<open>the (pp_\<Theta> (boffset+1820)) \<sigma> \<Longrightarrow> the (pp_\<Theta> (boffset+1825)) (lwip_read \<sigma>)\<close>
    and lwip_read2081: \<open>the (pp_\<Theta> (boffset+2081)) \<sigma> \<Longrightarrow> the (pp_\<Theta> (boffset+2086)) (lwip_read \<sigma>)\<close>
    and uhyve_send_def: \<open>exec_instr assembly semantics tasks_flag_annotation (Unary (IS_8088 Call) (Immediate (ImmLabel ''uhyve_send''))) 5 = uhyve_send\<close>
    and uhyve_send_incr: \<open>regs (uhyve_send \<sigma>) rip = regs \<sigma> rip + 5\<close>
    and uhyve_send1936: \<open>the (pp_\<Theta> (boffset+1936)) \<sigma> \<Longrightarrow> the (pp_\<Theta> (boffset+1941)) (uhyve_send \<sigma>)\<close>
    and virt_to_phys_def: \<open>exec_instr assembly semantics tasks_flag_annotation (Unary (IS_8088 Call) (Immediate (ImmLabel ''virt_to_phys''))) 5 = virt_to_phys\<close>
    and virt_to_phys_incr: \<open>regs (virt_to_phys \<sigma>) rip = regs \<sigma> rip + 5\<close>
    and virt_to_phys1924: \<open>the (pp_\<Theta> (boffset+1924)) \<sigma> \<Longrightarrow> the (pp_\<Theta> (boffset+1929)) (virt_to_phys \<sigma>)\<close>
    and socket_recv_def: \<open>exec_instr assembly semantics tasks_flag_annotation (Unary (IS_8088 Call) (Immediate (ImmLabel ''socket_recv''))) 5 = socket_recv\<close>
    and socket_recv_incr: \<open>regs (socket_recv \<sigma>) rip = regs \<sigma> rip + 5\<close>
    and socket_recv2032: \<open>the (pp_\<Theta> (boffset+2032)) \<sigma> \<Longrightarrow> the (pp_\<Theta> (boffset+2037)) (socket_recv \<sigma>)\<close>
    and spinlock_irqsave_lock_def: \<open>exec_instr assembly semantics tasks_flag_annotation (Unary (IS_8088 Call) (Immediate (ImmLabel ''spinlock_irqsave_lock''))) 5 = spinlock_irqsave_lock\<close>
    and spinlock_irqsave_lock_incr: \<open>regs (spinlock_irqsave_lock \<sigma>) rip = regs \<sigma> rip + 5\<close>
    and spinlock_irqsave_lock1792: \<open>the (pp_\<Theta> (boffset+1792)) \<sigma> \<Longrightarrow> the (pp_\<Theta> (boffset+1797)) (spinlock_irqsave_lock \<sigma>)\<close>
    and spinlock_irqsave_lock1979: \<open>the (pp_\<Theta> (boffset+1979)) \<sigma> \<Longrightarrow> the (pp_\<Theta> (boffset+1984)) (spinlock_irqsave_lock \<sigma>)\<close>
begin

lemma rewrite_sys_read_mem:
  \<open>is_std_invar sys_read_ret (floyd.invar sys_read_ret pp_\<Theta>)\<close>
  text \<open>Boilerplate code to start the VCG\<close>
  apply (rule floyd_invarI)
  apply (rewrite at \<open>floyd_vcs sys_read_ret \<hole> _\<close> pp_\<Theta>_def)
  apply (intro floyd_vcsI)

  text \<open>Subgoal for rip = boffset+1718\<close>
  subgoal premises prems for \<sigma>
    text \<open>Insert relevant knowledge\<close>
    apply (insert prems seps ret_address)
    text \<open>Apply VCG/symb.\ execution\<close>
    apply (restart_symbolic_execution?, (symbolic_execution masters: masters)+, (finish_symbolic_execution masters: masters)?)+
    done

  text \<open>Subgoal for rip = boffset+1792\<close>
  subgoal premises prems for \<sigma>
    text \<open>Insert relevant knowledge\<close>
    apply (insert prems seps ret_address)
    text \<open>Discharge function call\<close>
    apply (rule wps_rls)
    apply (simp (no_asm_simp) add: lookup_table_def instr_index_def entry_size_def)
    apply (rewrite_one_let' add: assembly_def)
    apply (rewrite_one_let' add: spinlock_irqsave_lock_def)
    apply (rule floyd_invarI'[of _ _ \<open>the (pp_\<Theta> (boffset+1797))\<close>])
     apply (simp add: spinlock_irqsave_lock_incr)
    using spinlock_irqsave_lock1792
    apply simp
    done

  text \<open>Subgoal for rip = boffset+1797\<close>
  subgoal premises prems for \<sigma>
    text \<open>Insert relevant knowledge\<close>
    apply (insert prems seps ret_address)
    text \<open>Apply VCG/symb.\ execution\<close>
    apply (restart_symbolic_execution?, (symbolic_execution masters: masters)+, (finish_symbolic_execution masters: masters)?)+
    done

  text \<open>Subgoal for rip = boffset+1820\<close>
  subgoal premises prems for \<sigma>
    text \<open>Insert relevant knowledge\<close>
    apply (insert prems seps ret_address)
    text \<open>Discharge function call\<close>
    apply (rule wps_rls)
    apply (simp (no_asm_simp) add: lookup_table_def instr_index_def entry_size_def)
    apply (rewrite_one_let' add: assembly_def)
    apply (rewrite_one_let' add: lwip_read_def)
    apply (rule floyd_invarI'[of _ _ \<open>the (pp_\<Theta> (boffset+1825))\<close>])
     apply (simp add: lwip_read_incr)
    using lwip_read1820
    apply simp
    done

  text \<open>Subgoal for rip = boffset+1825\<close>
  subgoal premises prems for \<sigma>
    text \<open>Insert relevant knowledge\<close>
    apply (insert prems seps ret_address)
    text \<open>Apply VCG/symb.\ execution\<close>
    apply (restart_symbolic_execution?, (symbolic_execution masters: masters)+, (finish_symbolic_execution masters: masters)?)+
    done

  text \<open>Subgoal for rip = boffset+1838\<close>
  subgoal premises prems for \<sigma>
    text \<open>Insert relevant knowledge\<close>
    apply (insert prems seps ret_address)
    text \<open>Discharge function call\<close>
    apply (rule wps_rls)
    apply (simp (no_asm_simp) add: lookup_table_def instr_index_def entry_size_def)
    apply (rewrite_one_let' add: assembly_def)
    apply (rewrite_one_let' add: spinlock_irqsave_unlock_def)
    apply (rule floyd_invarI'[of _ _ \<open>the (pp_\<Theta> (boffset+1843))\<close>])
     apply (simp add: spinlock_irqsave_unlock_incr)
    using spinlock_irqsave_unlock1838
    apply simp
    done

  text \<open>Subgoal for rip = boffset+1843\<close>
  subgoal premises prems for \<sigma>
    text \<open>Insert relevant knowledge\<close>
    apply (insert prems seps ret_address)
    text \<open>Apply VCG/symb.\ execution\<close>
    apply (restart_symbolic_execution?, (symbolic_execution masters: masters)+, (finish_symbolic_execution masters: masters)?)+
    apply auto
    done

  text \<open>Subgoal for rip = boffset+1878\<close>
  subgoal premises prems for \<sigma>
    text \<open>Insert relevant knowledge\<close>
    apply (insert prems seps ret_address)
    text \<open>Discharge function call\<close>
    apply (rule wps_rls)
    apply (simp (no_asm_simp) add: lookup_table_def instr_index_def entry_size_def)
    apply (rewrite_one_let' add: assembly_def)
    apply (rewrite_one_let' add: is_uhyve_def)
    apply (rule floyd_invarI'[of _ _ \<open>the (pp_\<Theta> (boffset+1883))\<close>])
     apply (simp add: is_uhyve_incr)
    using is_uhyve1878
    apply simp
    done

  text \<open>Subgoal for rip = boffset+1883\<close>
  subgoal premises prems for \<sigma>
  proof -
    have x: \<open>regs \<sigma> rbp = rsp\<^sub>0 - 8\<close>
      using prems
      by simp
    show ?thesis
      apply (insert prems seps ret_address)
      apply ((restart_symbolic_execution add: x)?, (symbolic_execution add: x masters: masters)+, (finish_symbolic_execution add: x masters: masters)?)+
      done
  qed

  text \<open>Subgoal for rip = boffset+1924\<close>
  subgoal premises prems for \<sigma>
    text \<open>Insert relevant knowledge\<close>
    apply (insert prems seps ret_address)
    text \<open>Discharge function call\<close>
    apply (rule wps_rls)
    apply (simp (no_asm_simp) add: lookup_table_def instr_index_def entry_size_def)
    apply (rewrite_one_let' add: assembly_def)
    apply (rewrite_one_let' add: virt_to_phys_def)
    apply (rule floyd_invarI'[of _ _ \<open>the (pp_\<Theta> (boffset+1929))\<close>])
     apply (simp add: virt_to_phys_incr)
    using virt_to_phys1924
    apply simp
    done

  text \<open>Subgoal for rip = boffset+1929\<close>
  subgoal premises prems for \<sigma>
    text \<open>Insert relevant knowledge\<close>
    apply (insert prems seps ret_address)
    text \<open>Apply VCG/symb.\ execution\<close>
    apply (restart_symbolic_execution?, (symbolic_execution masters: masters)+, (finish_symbolic_execution masters: masters)?)+
    done

  text \<open>Subgoal for rip = boffset+1936\<close>
  subgoal premises prems for \<sigma>
    text \<open>Insert relevant knowledge\<close>
    apply (insert prems seps ret_address)
    text \<open>Discharge function call\<close>
    apply (rule wps_rls)
    apply (simp (no_asm_simp) add: lookup_table_def instr_index_def entry_size_def)
    apply (rewrite_one_let' add: assembly_def)
    apply (rewrite_one_let' add: uhyve_send_def)
    apply (rule floyd_invarI'[of _ _ \<open>the (pp_\<Theta> (boffset+1941))\<close>])
     apply (simp add: uhyve_send_incr)
    using uhyve_send1936
    apply simp
    done

  text \<open>Subgoal for rip = boffset+1941\<close>
  subgoal premises prems for \<sigma>
    text \<open>Insert relevant knowledge\<close>
    apply (insert prems seps ret_address)
    text \<open>Apply VCG/symb.\ execution\<close>
    apply (restart_symbolic_execution?, (symbolic_execution masters: masters)+, (finish_symbolic_execution masters: masters)?)+
    done

  text \<open>Subgoal for rip = boffset+1979\<close>
  subgoal premises prems for \<sigma>
    text \<open>Insert relevant knowledge\<close>
    apply (insert prems seps ret_address)
    text \<open>Discharge function call\<close>
    apply (rule wps_rls)
    apply (simp (no_asm_simp) add: lookup_table_def instr_index_def entry_size_def)
    apply (rewrite_one_let' add: assembly_def)
    apply (rewrite_one_let' add: spinlock_irqsave_lock_def)
    apply (rule floyd_invarI'[of _ _ \<open>the (pp_\<Theta> (boffset+1984))\<close>])
     apply (simp add: spinlock_irqsave_lock_incr)
    using spinlock_irqsave_lock1979
    apply simp
    done

  text \<open>Subgoal for rip = boffset+1984\<close>
  subgoal premises prems for \<sigma>
    text \<open>Insert relevant knowledge\<close>
    apply (insert prems seps ret_address)
    text \<open>Apply VCG/symb.\ execution\<close>
    apply (restart_symbolic_execution?, (symbolic_execution masters: masters)+, (finish_symbolic_execution masters: masters)?)+
    done

  text \<open>Subgoal for rip = boffset+2010\<close>
  subgoal premises prems for \<sigma>
    text \<open>Insert relevant knowledge\<close>
    apply (insert prems seps ret_address)
    text \<open>Discharge function call\<close>
    apply (rule wps_rls)
    apply (simp (no_asm_simp) add: lookup_table_def instr_index_def entry_size_def)
    apply (rewrite_one_let' add: assembly_def)
    apply (rewrite_one_let' add: socket_send_def)
    apply (rule floyd_invarI'[of _ _ \<open>the (pp_\<Theta> (boffset+2015))\<close>])
     apply (simp add: socket_send_incr)
    using socket_send2010
    apply simp
    done

  text \<open>Subgoal for rip = boffset+2015\<close>
  subgoal premises prems for \<sigma>
    text \<open>Insert relevant knowledge\<close>
    apply (insert prems seps ret_address)
    text \<open>Apply VCG/symb.\ execution\<close>
    apply (restart_symbolic_execution?, (symbolic_execution masters: masters)+, (finish_symbolic_execution masters: masters)?)+
    done

  text \<open>Subgoal for rip = boffset+2032\<close>
  subgoal premises prems for \<sigma>
    text \<open>Insert relevant knowledge\<close>
    apply (insert prems seps ret_address)
    text \<open>Discharge function call\<close>
    apply (rule wps_rls)
    apply (simp (no_asm_simp) add: lookup_table_def instr_index_def entry_size_def)
    apply (rewrite_one_let' add: assembly_def)
    apply (rewrite_one_let' add: socket_recv_def)
    apply (rule floyd_invarI'[of _ _ \<open>the (pp_\<Theta> (boffset+2037))\<close>])
     apply (simp add: socket_recv_incr)
    using socket_recv2032
    apply simp
    done

  text \<open>Subgoal for rip = boffset+2037\<close>
  subgoal premises prems for \<sigma>
    text \<open>Insert relevant knowledge\<close>
    apply (insert prems seps ret_address)
    text \<open>Apply VCG/symb.\ execution\<close>
    apply (restart_symbolic_execution?, (symbolic_execution masters: masters)+, (finish_symbolic_execution masters: masters)?)+
    done

  text \<open>Subgoal for rip = boffset+2081\<close>
  subgoal premises prems for \<sigma>
    text \<open>Insert relevant knowledge\<close>
    apply (insert prems seps ret_address)
    text \<open>Discharge function call\<close>
    apply (rule wps_rls)
    apply (simp (no_asm_simp) add: lookup_table_def instr_index_def entry_size_def)
    apply (rewrite_one_let' add: assembly_def)
    apply (rewrite_one_let' add: lwip_read_def)
    apply (rule floyd_invarI'[of _ _ \<open>the (pp_\<Theta> (boffset+2086))\<close>])
     apply (simp add: lwip_read_incr)
    using lwip_read2081
    apply simp
    done

  text \<open>Subgoal for rip = boffset+2086\<close>
  subgoal premises prems for \<sigma>
    text \<open>Insert relevant knowledge\<close>
    apply (insert prems seps ret_address)
    text \<open>Apply VCG/symb.\ execution\<close>
    apply (restart_symbolic_execution?, (symbolic_execution masters: masters)+, (finish_symbolic_execution masters: masters)?)+
    done

  text \<open>Subgoal for rip = boffset+2106\<close>
  subgoal premises prems for \<sigma>
    text \<open>Insert relevant knowledge\<close>
    apply (insert prems seps ret_address)
    text \<open>Discharge function call\<close>
    apply (rule wps_rls)
    apply (simp (no_asm_simp) add: lookup_table_def instr_index_def entry_size_def)
    apply (rewrite_one_let' add: assembly_def)
    apply (rewrite_one_let' add: spinlock_irqsave_unlock_def)
    apply (rule floyd_invarI'[of _ _ \<open>the (pp_\<Theta> (boffset+2111))\<close>])
     apply (simp add: spinlock_irqsave_unlock_incr)
    using spinlock_irqsave_unlock2106
    apply simp
    done

  text \<open>Subgoal for rip = boffset+2111\<close>
  subgoal premises prems for \<sigma>
    text \<open>Insert relevant knowledge\<close>
    apply (insert prems seps ret_address)
    text \<open>Apply VCG/symb.\ execution\<close>
    apply (restart_symbolic_execution?, (symbolic_execution masters: masters)+, (finish_symbolic_execution masters: masters)?)+
    done

  text \<open>Subgoal for rip = boffset+2125\<close>
  subgoal premises prems for \<sigma>
    text \<open>Insert relevant knowledge\<close>
    apply (insert prems seps ret_address)
    text \<open>Apply VCG/symb.\ execution\<close>
    apply (restart_symbolic_execution?, (symbolic_execution masters: masters)+, (finish_symbolic_execution masters: masters)?)+
    apply auto
    done

  text \<open>Subgoal for rip = boffset+2142\<close>
  subgoal premises prems for \<sigma>
    text \<open>Insert relevant knowledge\<close>
    apply (insert prems seps ret_address)
    text \<open>Discharge function call\<close>
    apply (rule wps_rls)
    apply (simp (no_asm_simp) add: lookup_table_def instr_index_def entry_size_def)
    apply (rewrite_one_let' add: assembly_def)
    apply (rewrite_one_let' add: spinlock_irqsave_unlock_def)
    apply (rule floyd_invarI'[of _ _ \<open>the (pp_\<Theta> (boffset+2147))\<close>])
     apply (simp add: spinlock_irqsave_unlock_incr)
    using spinlock_irqsave_unlock2142
    apply simp
    done

  text \<open>Subgoal for rip = boffset+2147\<close>
  subgoal premises prems for \<sigma>
    text \<open>Insert relevant knowledge\<close>
    apply (insert prems seps ret_address)
    text \<open>Apply VCG/symb.\ execution\<close>
    apply (restart_symbolic_execution?, (symbolic_execution masters: masters)+, (finish_symbolic_execution masters: masters)?)+
    done

  text \<open>Subgoal for rip = boffset+2151\<close>
  subgoal premises prems for \<sigma>
    text \<open>Insert relevant knowledge\<close>
    apply (insert prems seps ret_address)
    text \<open>Apply VCG/symb.\ execution\<close>
    apply (restart_symbolic_execution?, (symbolic_execution masters: masters)+, (finish_symbolic_execution masters: masters)?)+
    apply restart_symbolic_execution
    apply auto
    done

  text \<open>Subgoal for rip = boffset+2166\<close>
  subgoal premises prems for \<sigma>
    text \<open>Insert relevant knowledge\<close>
    apply (insert prems seps ret_address)
    text \<open>Discharge function call\<close>
    apply (rule wps_rls)
    apply (simp (no_asm_simp) add: lookup_table_def instr_index_def entry_size_def)
    apply (rewrite_one_let' add: assembly_def)
    apply (rewrite_one_let' add: stack_chk_fail_def)
    apply (rule floyd_invarI'[of _ _ \<open>the (pp_\<Theta> (boffset+2171))\<close>])
     apply (simp add: stack_chk_fail_incr)
    using stack_chk_fail2166
    apply simp
    done

  text \<open>Subgoal for rip = boffset+2171\<close>
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
