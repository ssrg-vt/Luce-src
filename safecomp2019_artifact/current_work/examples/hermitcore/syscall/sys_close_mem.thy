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
theory sys_close_mem
  imports syscall
begin

text \<open>Up to two locales per function in the binary.\<close>
locale sys_close_function = syscall_context +
  fixes rsp\<^sub>0 rbp\<^sub>0 canary current_task task a sys_close_ret :: \<open>64 word\<close>
    and v\<^sub>0 :: \<open>8 word\<close>
    and blocks :: \<open>(nat \<times> 64 word \<times> nat) set\<close>
  assumes seps: \<open>seps blocks\<close>
    and current_task: \<open>the (label_to_address assembly ''current_task'') = current_task\<close>
    and masters:
      \<open>master blocks (a, 1) 0\<close>
      \<open>master blocks (rsp\<^sub>0, 8) 1\<close>
      \<open>master blocks (rsp\<^sub>0-8, 8) 2\<close>
      \<open>master blocks (rsp\<^sub>0-16, 8) 3\<close>
      \<open>master blocks (rsp\<^sub>0-20, 4) 4\<close>
      \<open>master blocks (rsp\<^sub>0-24, 4) 5\<close>
      \<open>master blocks (rsp\<^sub>0-28, 4) 6\<close>
      \<open>master blocks (rsp\<^sub>0-32, 4) 7\<close>
      \<open>master blocks (rsp\<^sub>0-36, 4) 8\<close>
      \<open>master blocks (rsp\<^sub>0-44, 4) 9\<close>
      \<open>master blocks (canary, 8) 10\<close>
      \<open>master blocks (current_task, 8) 11\<close>
      \<open>master blocks (task + 120, 4) 12\<close>
    and ret_address: \<open>outside sys_close_ret 1429 1718\<close> \<comment> \<open>Only works for non-recursive functions.\<close>
begin

text \<open>
  The Floyd invariant expresses for some locations properties that are invariably true.
  Simply expresses that a byte in the memory remains untouched.
\<close>
definition pp_\<Theta> :: floyd_invar where
  \<open>pp_\<Theta> \<equiv> [
    \<comment> \<open>precondition\<close>
    boffset+1429 \<mapsto> \<lambda>\<sigma>. regs \<sigma> rsp = rsp\<^sub>0
      \<and> regs \<sigma> rbp = rbp\<^sub>0
      \<and> regs \<sigma> fs + 40 = canary
      \<and> \<sigma> \<turnstile> *[current_task,8] = task
      \<and> \<sigma> \<turnstile> *[rsp\<^sub>0,8] = boffset+sys_close_ret
      \<and> \<sigma> \<turnstile> *[a,1] = v\<^sub>0,
    boffset+1490 \<mapsto> \<lambda>\<sigma>. regs \<sigma> rsp = rsp\<^sub>0-56
      \<and> regs \<sigma> rbp = rsp\<^sub>0-8
      \<and> regs \<sigma> fs + 40 = canary
      \<and> \<sigma> \<turnstile> *[current_task,8] = task
      \<and> \<sigma> \<turnstile> *[rsp\<^sub>0-8,8] = rbp\<^sub>0
      \<and> \<sigma> \<turnstile> *[rsp\<^sub>0,8] = boffset+sys_close_ret
      \<and> \<sigma> \<turnstile> *[a,1] = v\<^sub>0,
    boffset+1495 \<mapsto> \<lambda>\<sigma>. regs \<sigma> rsp = rsp\<^sub>0-56
      \<and> regs \<sigma> rbp = rsp\<^sub>0-8
      \<and> regs \<sigma> fs + 40 = canary
      \<and> \<sigma> \<turnstile> *[current_task,8] = task
      \<and> \<sigma> \<turnstile> *[rsp\<^sub>0-8,8] = rbp\<^sub>0
      \<and> \<sigma> \<turnstile> *[rsp\<^sub>0,8] = boffset+sys_close_ret
      \<and> \<sigma> \<turnstile> *[a,1] = v\<^sub>0,
    boffset+1532 \<mapsto> \<lambda>\<sigma>. regs \<sigma> rsp = rsp\<^sub>0-56
      \<and> regs \<sigma> rbp = rsp\<^sub>0-8
      \<and> regs \<sigma> fs + 40 = canary
      \<and> \<sigma> \<turnstile> *[current_task,8] = task
      \<and> \<sigma> \<turnstile> *[rsp\<^sub>0-8,8] = rbp\<^sub>0
      \<and> \<sigma> \<turnstile> *[rsp\<^sub>0,8] = boffset+sys_close_ret
      \<and> \<sigma> \<turnstile> *[a,1] = v\<^sub>0,
    boffset+1537 \<mapsto> \<lambda>\<sigma>. regs \<sigma> rsp = rsp\<^sub>0-56
      \<and> regs \<sigma> rbp = rsp\<^sub>0-8
      \<and> regs \<sigma> fs + 40 = canary
      \<and> \<sigma> \<turnstile> *[current_task,8] = task
      \<and> \<sigma> \<turnstile> *[rsp\<^sub>0-8,8] = rbp\<^sub>0
      \<and> \<sigma> \<turnstile> *[rsp\<^sub>0,8] = boffset+sys_close_ret
      \<and> \<sigma> \<turnstile> *[a,1] = v\<^sub>0,
    boffset+1561 \<mapsto> \<lambda>\<sigma>. regs \<sigma> rsp = rsp\<^sub>0-56
      \<and> regs \<sigma> rbp = rsp\<^sub>0-8
      \<and> regs \<sigma> fs + 40 = canary
      \<and> \<sigma> \<turnstile> *[current_task,8] = task
      \<and> \<sigma> \<turnstile> *[rsp\<^sub>0-8,8] = rbp\<^sub>0
      \<and> \<sigma> \<turnstile> *[rsp\<^sub>0,8] = boffset+sys_close_ret
      \<and> \<sigma> \<turnstile> *[a,1] = v\<^sub>0,
    boffset+1566 \<mapsto> \<lambda>\<sigma>. regs \<sigma> rsp = rsp\<^sub>0-56
      \<and> regs \<sigma> rbp = rsp\<^sub>0-8
      \<and> regs \<sigma> fs + 40 = canary
      \<and> \<sigma> \<turnstile> *[current_task,8] = task
      \<and> \<sigma> \<turnstile> *[rsp\<^sub>0-8,8] = rbp\<^sub>0
      \<and> \<sigma> \<turnstile> *[rsp\<^sub>0,8] = boffset+sys_close_ret
      \<and> \<sigma> \<turnstile> *[a,1] = v\<^sub>0,
    boffset+1573 \<mapsto> \<lambda>\<sigma>. regs \<sigma> rsp = rsp\<^sub>0-56
      \<and> regs \<sigma> rbp = rsp\<^sub>0-8
      \<and> regs \<sigma> fs + 40 = canary
      \<and> \<sigma> \<turnstile> *[current_task,8] = task
      \<and> \<sigma> \<turnstile> *[rsp\<^sub>0-8,8] = rbp\<^sub>0
      \<and> \<sigma> \<turnstile> *[rsp\<^sub>0,8] = boffset+sys_close_ret
      \<and> \<sigma> \<turnstile> *[a,1] = v\<^sub>0,
    boffset+1578 \<mapsto> \<lambda>\<sigma>. regs \<sigma> rsp = rsp\<^sub>0-56
      \<and> regs \<sigma> rbp = rsp\<^sub>0-8
      \<and> regs \<sigma> fs + 40 = canary
      \<and> \<sigma> \<turnstile> *[current_task,8] = task
      \<and> \<sigma> \<turnstile> *[rsp\<^sub>0-8,8] = rbp\<^sub>0
      \<and> \<sigma> \<turnstile> *[rsp\<^sub>0,8] = boffset+sys_close_ret
      \<and> \<sigma> \<turnstile> *[a,1] = v\<^sub>0,
    boffset+1590 \<mapsto> \<lambda>\<sigma>. regs \<sigma> rsp = rsp\<^sub>0-56
      \<and> regs \<sigma> rbp = rsp\<^sub>0-8
      \<and> regs \<sigma> fs + 40 = canary
      \<and> \<sigma> \<turnstile> *[current_task,8] = task
      \<and> \<sigma> \<turnstile> *[rsp\<^sub>0-8,8] = rbp\<^sub>0
      \<and> \<sigma> \<turnstile> *[rsp\<^sub>0,8] = boffset+sys_close_ret
      \<and> \<sigma> \<turnstile> *[a,1] = v\<^sub>0,
    boffset+1595 \<mapsto> \<lambda>\<sigma>. regs \<sigma> rsp = rsp\<^sub>0-56
      \<and> regs \<sigma> rbp = rsp\<^sub>0-8
      \<and> regs \<sigma> fs + 40 = canary
      \<and> \<sigma> \<turnstile> *[current_task,8] = task
      \<and> \<sigma> \<turnstile> *[rsp\<^sub>0-8,8] = rbp\<^sub>0
      \<and> \<sigma> \<turnstile> *[rsp\<^sub>0,8] = boffset+sys_close_ret
      \<and> \<sigma> \<turnstile> *[a,1] = v\<^sub>0,
    boffset+1640 \<mapsto> \<lambda>\<sigma>. regs \<sigma> rsp = rsp\<^sub>0-56
      \<and> regs \<sigma> rbp = rsp\<^sub>0-8
      \<and> regs \<sigma> fs + 40 = canary
      \<and> \<sigma> \<turnstile> *[current_task,8] = task
      \<and> \<sigma> \<turnstile> *[rsp\<^sub>0-8,8] = rbp\<^sub>0
      \<and> \<sigma> \<turnstile> *[rsp\<^sub>0,8] = boffset+sys_close_ret
      \<and> \<sigma> \<turnstile> *[a,1] = v\<^sub>0,
    boffset+1645 \<mapsto> \<lambda>\<sigma>. regs \<sigma> rsp = rsp\<^sub>0-56
      \<and> regs \<sigma> rbp = rsp\<^sub>0-8
      \<and> regs \<sigma> fs + 40 = canary
      \<and> \<sigma> \<turnstile> *[current_task,8] = task
      \<and> \<sigma> \<turnstile> *[rsp\<^sub>0-8,8] = rbp\<^sub>0
      \<and> \<sigma> \<turnstile> *[rsp\<^sub>0,8] = boffset+sys_close_ret
      \<and> \<sigma> \<turnstile> *[a,1] = v\<^sub>0,
    boffset+1673 \<mapsto> \<lambda>\<sigma>. regs \<sigma> rsp = rsp\<^sub>0-56
      \<and> regs \<sigma> rbp = rsp\<^sub>0-8
      \<and> regs \<sigma> fs + 40 = canary
      \<and> \<sigma> \<turnstile> *[current_task,8] = task
      \<and> \<sigma> \<turnstile> *[rsp\<^sub>0-8,8] = rbp\<^sub>0
      \<and> \<sigma> \<turnstile> *[rsp\<^sub>0,8] = boffset+sys_close_ret
      \<and> \<sigma> \<turnstile> *[a,1] = v\<^sub>0,
    boffset+1678 \<mapsto> \<lambda>\<sigma>. regs \<sigma> rsp = rsp\<^sub>0-56
      \<and> regs \<sigma> rbp = rsp\<^sub>0-8
      \<and> regs \<sigma> fs + 40 = canary
      \<and> \<sigma> \<turnstile> *[current_task,8] = task
      \<and> \<sigma> \<turnstile> *[rsp\<^sub>0-8,8] = rbp\<^sub>0
      \<and> \<sigma> \<turnstile> *[rsp\<^sub>0,8] = boffset+sys_close_ret
      \<and> \<sigma> \<turnstile> *[a,1] = v\<^sub>0,
    boffset+1681 \<mapsto> \<lambda>\<sigma>. regs \<sigma> rsp = rsp\<^sub>0-56
      \<and> regs \<sigma> rbp = rsp\<^sub>0-8
      \<and> regs \<sigma> fs + 40 = canary
      \<and> \<sigma> \<turnstile> *[current_task,8] = task
      \<and> \<sigma> \<turnstile> *[rsp\<^sub>0-8,8] = rbp\<^sub>0
      \<and> \<sigma> \<turnstile> *[rsp\<^sub>0,8] = boffset+sys_close_ret
      \<and> \<sigma> \<turnstile> *[a,1] = v\<^sub>0,
    boffset+1688 \<mapsto> \<lambda>\<sigma>. regs \<sigma> rsp = rsp\<^sub>0-56
      \<and> regs \<sigma> rbp = rsp\<^sub>0-8
      \<and> regs \<sigma> fs + 40 = canary
      \<and> \<sigma> \<turnstile> *[current_task,8] = task
      \<and> \<sigma> \<turnstile> *[rsp\<^sub>0-8,8] = rbp\<^sub>0
      \<and> \<sigma> \<turnstile> *[rsp\<^sub>0,8] = boffset+sys_close_ret
      \<and> \<sigma> \<turnstile> *[a,1] = v\<^sub>0,
    boffset+1693 \<mapsto> \<lambda>\<sigma>. regs \<sigma> rsp = rsp\<^sub>0-56
      \<and> regs \<sigma> rbp = rsp\<^sub>0-8
      \<and> regs \<sigma> fs + 40 = canary
      \<and> \<sigma> \<turnstile> *[current_task,8] = task
      \<and> \<sigma> \<turnstile> *[rsp\<^sub>0-8,8] = rbp\<^sub>0
      \<and> \<sigma> \<turnstile> *[rsp\<^sub>0,8] = boffset+sys_close_ret
      \<and> \<sigma> \<turnstile> *[a,1] = v\<^sub>0,
    boffset+1696 \<mapsto> \<lambda>\<sigma>. regs \<sigma> rsp = rsp\<^sub>0-56
      \<and> regs \<sigma> rbp = rsp\<^sub>0-8
      \<and> regs \<sigma> fs + 40 = canary
      \<and> \<sigma> \<turnstile> *[current_task,8] = task
      \<and> \<sigma> \<turnstile> *[rsp\<^sub>0-8,8] = rbp\<^sub>0
      \<and> \<sigma> \<turnstile> *[rsp\<^sub>0,8] = boffset+sys_close_ret
      \<and> \<sigma> \<turnstile> *[a,1] = v\<^sub>0,
    boffset+1711 \<mapsto> \<lambda>\<sigma>. regs \<sigma> rsp = rsp\<^sub>0-56
      \<and> regs \<sigma> rbp = rsp\<^sub>0-8
      \<and> regs \<sigma> fs + 40 = canary
      \<and> \<sigma> \<turnstile> *[current_task,8] = task
      \<and> \<sigma> \<turnstile> *[rsp\<^sub>0-8,8] = rbp\<^sub>0
      \<and> \<sigma> \<turnstile> *[rsp\<^sub>0,8] = boffset+sys_close_ret
      \<and> \<sigma> \<turnstile> *[a,1] = v\<^sub>0,
    boffset+1716 \<mapsto> \<lambda>\<sigma>. regs \<sigma> rsp = rsp\<^sub>0-56
      \<and> regs \<sigma> rbp = rsp\<^sub>0-8
      \<and> regs \<sigma> fs + 40 = canary
      \<and> \<sigma> \<turnstile> *[current_task,8] = task
      \<and> \<sigma> \<turnstile> *[rsp\<^sub>0-8,8] = rbp\<^sub>0
      \<and> \<sigma> \<turnstile> *[rsp\<^sub>0,8] = boffset+sys_close_ret
      \<and> \<sigma> \<turnstile> *[a,1] = v\<^sub>0,
    \<comment> \<open>postcondition\<close>
    boffset+sys_close_ret \<mapsto> \<lambda>\<sigma>. \<sigma> \<turnstile> *[a,1] = v\<^sub>0
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

locale sys_close_function_calls = sys_close_function +
  fixes spinlock_irqsave_lock socket_send lwip_close uhyve_send is_uhyve socket_recv stack_chk_fail spinlock_irqsave_unlock virt_to_phys :: \<open>state \<Rightarrow> state\<close>
  assumes spinlock_irqsave_lock_def: \<open>exec_instr assembly semantics tasks_flag_annotation (Unary (IS_8088 Call) (Immediate (ImmLabel ''spinlock_irqsave_lock''))) 5 = spinlock_irqsave_lock\<close>
    and spinlock_irqsave_lock_incr: \<open>regs (spinlock_irqsave_lock \<sigma>) rip = regs \<sigma> rip + 5\<close>
    and spinlock_irqsave_lock1590: \<open>the (pp_\<Theta> (boffset+1590)) \<sigma> \<Longrightarrow> the (pp_\<Theta> (boffset+1595)) (spinlock_irqsave_lock \<sigma>)\<close>
    and socket_send_def: \<open>exec_instr assembly semantics tasks_flag_annotation (Unary (IS_8088 Call) (Immediate (ImmLabel ''socket_send''))) 5 = socket_send\<close>
    and socket_send_incr: \<open>regs (socket_send \<sigma>) rip = regs \<sigma> rip + 5\<close>
    and socket_send1640: \<open>the (pp_\<Theta> (boffset+1640)) \<sigma> \<Longrightarrow> the (pp_\<Theta> (boffset+1645)) (socket_send \<sigma>)\<close>
    and lwip_close_def: \<open>exec_instr assembly semantics tasks_flag_annotation (Unary (IS_8088 Call) (Immediate (ImmLabel ''lwip_close''))) 5 = lwip_close\<close>
    and lwip_close_incr: \<open>regs (lwip_close \<sigma>) rip = regs \<sigma> rip + 5\<close>
    and lwip_close1490: \<open>the (pp_\<Theta> (boffset+1490)) \<sigma> \<Longrightarrow> the (pp_\<Theta> (boffset+1495)) (lwip_close \<sigma>)\<close>
    and uhyve_send_def: \<open>exec_instr assembly semantics tasks_flag_annotation (Unary (IS_8088 Call) (Immediate (ImmLabel ''uhyve_send''))) 5 = uhyve_send\<close>
    and uhyve_send_incr: \<open>regs (uhyve_send \<sigma>) rip = regs \<sigma> rip + 5\<close>
    and uhyve_send1573: \<open>the (pp_\<Theta> (boffset+1573)) \<sigma> \<Longrightarrow> the (pp_\<Theta> (boffset+1578)) (uhyve_send \<sigma>)\<close>
    and is_uhyve_def: \<open>exec_instr assembly semantics tasks_flag_annotation (Unary (IS_8088 Call) (Immediate (ImmLabel ''is_uhyve''))) 5 = is_uhyve\<close>
    and is_uhyve_incr: \<open>regs (is_uhyve \<sigma>) rip = regs \<sigma> rip + 5\<close>
    and is_uhyve1532: \<open>the (pp_\<Theta> (boffset+1532)) \<sigma> \<Longrightarrow> the (pp_\<Theta> (boffset+1537)) (is_uhyve \<sigma>)\<close>
    and socket_recv_def: \<open>exec_instr assembly semantics tasks_flag_annotation (Unary (IS_8088 Call) (Immediate (ImmLabel ''socket_recv''))) 5 = socket_recv\<close>
    and socket_recv_incr: \<open>regs (socket_recv \<sigma>) rip = regs \<sigma> rip + 5\<close>
    and socket_recv1673: \<open>the (pp_\<Theta> (boffset+1673)) \<sigma> \<Longrightarrow> the (pp_\<Theta> (boffset+1678)) (socket_recv \<sigma>)\<close>
    and stack_chk_fail_def: \<open>exec_instr assembly semantics tasks_flag_annotation (Unary (IS_8088 Call) (Immediate (ImmLabel ''__stack_chk_fail''))) 5 = stack_chk_fail\<close>
    and stack_chk_fail_incr: \<open>regs (stack_chk_fail \<sigma>) rip = regs \<sigma> rip + 5\<close>
    and stack_chk_fail1711: \<open>the (pp_\<Theta> (boffset+1711)) \<sigma> \<Longrightarrow> the (pp_\<Theta> (boffset+1716)) (stack_chk_fail \<sigma>)\<close>
    and spinlock_irqsave_unlock_def: \<open>exec_instr assembly semantics tasks_flag_annotation (Unary (IS_8088 Call) (Immediate (ImmLabel ''spinlock_irqsave_unlock''))) 5 = spinlock_irqsave_unlock\<close>
    and spinlock_irqsave_unlock_incr: \<open>regs (spinlock_irqsave_unlock \<sigma>) rip = regs \<sigma> rip + 5\<close>
    and spinlock_irqsave_unlock1688: \<open>the (pp_\<Theta> (boffset+1688)) \<sigma> \<Longrightarrow> the (pp_\<Theta> (boffset+1693)) (spinlock_irqsave_unlock \<sigma>)\<close>
    and virt_to_phys_def: \<open>exec_instr assembly semantics tasks_flag_annotation (Unary (IS_8088 Call) (Immediate (ImmLabel ''virt_to_phys''))) 5 = virt_to_phys\<close>
    and virt_to_phys_incr: \<open>regs (virt_to_phys \<sigma>) rip = regs \<sigma> rip + 5\<close>
    and virt_to_phys1561: \<open>the (pp_\<Theta> (boffset+1561)) \<sigma> \<Longrightarrow> the (pp_\<Theta> (boffset+1566)) (virt_to_phys \<sigma>)\<close>
begin

lemma rewrite_sys_close_mem:
  \<open>is_std_invar sys_close_ret (floyd.invar sys_close_ret pp_\<Theta>)\<close>
  text \<open>Boilerplate code to start the VCG\<close>
  apply (rule floyd_invarI)
  apply (rewrite at \<open>floyd_vcs sys_close_ret \<hole> _\<close> pp_\<Theta>_def)
  apply (intro floyd_vcsI)

  text \<open>Subgoal for rip = boffset+1429\<close>
  subgoal premises prems for \<sigma>
    text \<open>Insert relevant knowledge\<close>
    apply (insert prems seps ret_address current_task)
    text \<open>Apply VCG/symb.\ execution\<close>
    apply (restart_symbolic_execution?, (symbolic_execution masters: masters)+, (finish_symbolic_execution masters: masters)?)+
    done

  text \<open>Subgoal for rip = boffset+1490\<close>
  subgoal premises prems for \<sigma>
    text \<open>Insert relevant knowledge\<close>
    apply (insert prems seps ret_address current_task)
    text \<open>Discharge function call\<close>
    apply (rule wps_rls)
    apply (simp (no_asm_simp) add: lookup_table_def instr_index_def entry_size_def)
    apply (rewrite_one_let' add: assembly_def)
    apply (rewrite_one_let' add: lwip_close_def)
    apply (rule floyd_invarI'[of _ _ \<open>the (pp_\<Theta> (boffset+1495))\<close>])
     apply (simp add: lwip_close_incr)
    using lwip_close1490
    apply simp
    done

  text \<open>Subgoal for rip = boffset+1495\<close>
  subgoal premises prems for \<sigma>
    text \<open>Insert relevant knowledge\<close>
    apply (insert prems seps ret_address current_task)
    text \<open>Apply VCG/symb.\ execution\<close>
    apply (restart_symbolic_execution?, (symbolic_execution masters: masters)+, (finish_symbolic_execution masters: masters)?)+
    done

  text \<open>Subgoal for rip = boffset+1532\<close>
  subgoal premises prems for \<sigma>
    text \<open>Insert relevant knowledge\<close>
    apply (insert prems seps ret_address current_task)
    text \<open>Discharge function call\<close>
    apply (rule wps_rls)
    apply (simp (no_asm_simp) add: lookup_table_def instr_index_def entry_size_def)
    apply (rewrite_one_let' add: assembly_def)
    apply (rewrite_one_let' add: is_uhyve_def)
    apply (rule floyd_invarI'[of _ _ \<open>the (pp_\<Theta> (boffset+1537))\<close>])
     apply (simp add: is_uhyve_incr)
    using is_uhyve1532
    apply simp
    done

  text \<open>Subgoal for rip = boffset+1537\<close>
  subgoal premises prems for \<sigma>
  proof -
    have x: \<open>regs \<sigma> rbp = rsp\<^sub>0 - 8\<close>
      using prems
      by simp
    show ?thesis
      text \<open>Insert relevant knowledge\<close>
      apply (insert prems seps ret_address current_task)
      text \<open>Apply VCG/symb.\ execution\<close>
      apply ((restart_symbolic_execution add: x)?, (symbolic_execution add: x masters: masters)+, (finish_symbolic_execution add: x masters: masters)?)+
      done
  qed

  text \<open>Subgoal for rip = boffset+1561\<close>
  subgoal premises prems for \<sigma>
    text \<open>Insert relevant knowledge\<close>
    apply (insert prems seps ret_address current_task)
    text \<open>Discharge function call\<close>
    apply (rule wps_rls)
    apply (simp (no_asm_simp) add: lookup_table_def instr_index_def entry_size_def)
    apply (rewrite_one_let' add: assembly_def)
    apply (rewrite_one_let' add: virt_to_phys_def)
    apply (rule floyd_invarI'[of _ _ \<open>the (pp_\<Theta> (boffset+1566))\<close>])
     apply (simp add: virt_to_phys_incr)
    using virt_to_phys1561
    apply simp
    done

  text \<open>Subgoal for rip = boffset+1566\<close>
  subgoal premises prems for \<sigma>
    text \<open>Insert relevant knowledge\<close>
    apply (insert prems seps ret_address current_task)
    text \<open>Apply VCG/symb.\ execution\<close>
    apply (restart_symbolic_execution?, (symbolic_execution masters: masters)+, (finish_symbolic_execution masters: masters)?)+
    done

  text \<open>Subgoal for rip = boffset+1573\<close>
  subgoal premises prems for \<sigma>
    text \<open>Insert relevant knowledge\<close>
    apply (insert prems seps ret_address current_task)
    text \<open>Discharge function call\<close>
    apply (rule wps_rls)
    apply (simp (no_asm_simp) add: lookup_table_def instr_index_def entry_size_def)
    apply (rewrite_one_let' add: assembly_def)
    apply (rewrite_one_let' add: uhyve_send_def)
    apply (rule floyd_invarI'[of _ _ \<open>the (pp_\<Theta> (boffset+1578))\<close>])
     apply (simp add: uhyve_send_incr)
    using uhyve_send1573
    apply simp
    done

  text \<open>Subgoal for rip = boffset+1578\<close>
  subgoal premises prems for \<sigma>
    text \<open>Insert relevant knowledge\<close>
    apply (insert prems seps ret_address current_task)
    text \<open>Apply VCG/symb.\ execution\<close>
    apply (restart_symbolic_execution?, (symbolic_execution masters: masters)+, (finish_symbolic_execution masters: masters)?)+
    done

  text \<open>Subgoal for rip = boffset+1590\<close>
  subgoal premises prems for \<sigma>
    text \<open>Insert relevant knowledge\<close>
    apply (insert prems seps ret_address current_task)
    text \<open>Discharge function call\<close>
    apply (rule wps_rls)
    apply (simp (no_asm_simp) add: lookup_table_def instr_index_def entry_size_def)
    apply (rewrite_one_let' add: assembly_def)
    apply (rewrite_one_let' add: spinlock_irqsave_lock_def)
    apply (rule floyd_invarI'[of _ _ \<open>the (pp_\<Theta> (boffset+1595))\<close>])
     apply (simp add: spinlock_irqsave_lock_incr)
    using spinlock_irqsave_lock1590
    apply simp
    done

  text \<open>Subgoal for rip = boffset+1595\<close>
  subgoal premises prems for \<sigma>
  proof -
    have x: \<open>regs \<sigma> rbp = rsp\<^sub>0 - 8\<close>
      using prems
      by simp
    show ?thesis
      text \<open>Insert relevant knowledge\<close>
      apply (insert prems seps ret_address current_task)
      text \<open>Apply VCG/symb.\ execution\<close>
      apply ((restart_symbolic_execution add: x)?, (symbolic_execution add: x masters: masters)+, (finish_symbolic_execution add: x masters: masters)?)+
      done
  qed

  text \<open>Subgoal for rip = boffset+1640\<close>
  subgoal premises prems for \<sigma>
    text \<open>Insert relevant knowledge\<close>
    apply (insert prems seps ret_address current_task)
    text \<open>Discharge function call\<close>
    apply (rule wps_rls)
    apply (simp (no_asm_simp) add: lookup_table_def instr_index_def entry_size_def)
    apply (rewrite_one_let' add: assembly_def)
    apply (rewrite_one_let' add: socket_send_def)
    apply (rule floyd_invarI'[of _ _ \<open>the (pp_\<Theta> (boffset+1645))\<close>])
     apply (simp add: socket_send_incr)
    using socket_send1640
    apply simp
    done

  text \<open>Subgoal for rip = boffset+1645\<close>
  subgoal premises prems for \<sigma>
    text \<open>Insert relevant knowledge\<close>
    apply (insert prems seps ret_address current_task)
    text \<open>Apply VCG/symb.\ execution\<close>
    apply (restart_symbolic_execution?, (symbolic_execution masters: masters)+, (finish_symbolic_execution masters: masters)?)+
    done

  text \<open>Subgoal for rip = boffset+1673\<close>
  subgoal premises prems for \<sigma>
    text \<open>Insert relevant knowledge\<close>
    apply (insert prems seps ret_address current_task)
    text \<open>Discharge function call\<close>
    apply (rule wps_rls)
    apply (simp (no_asm_simp) add: lookup_table_def instr_index_def entry_size_def)
    apply (rewrite_one_let' add: assembly_def)
    apply (rewrite_one_let' add: socket_recv_def)
    apply (rule floyd_invarI'[of _ _ \<open>the (pp_\<Theta> (boffset+1678))\<close>])
     apply (simp add: socket_recv_incr)
    using socket_recv1673
    apply simp
    done

  text \<open>Subgoal for rip = boffset+1678\<close>
  subgoal premises prems for \<sigma>
    text \<open>Insert relevant knowledge\<close>
    apply (insert prems seps ret_address current_task)
    text \<open>Apply VCG/symb.\ execution\<close>
    apply (restart_symbolic_execution?, (symbolic_execution masters: masters)+, (finish_symbolic_execution masters: masters)?)+
    done

  text \<open>Subgoal for rip = boffset+1681\<close>
  subgoal premises prems for \<sigma>
    text \<open>Insert relevant knowledge\<close>
    apply (insert prems seps ret_address current_task)
    text \<open>Apply VCG/symb.\ execution\<close>
    apply (restart_symbolic_execution?, (symbolic_execution masters: masters)+, (finish_symbolic_execution masters: masters)?)+
    done

  text \<open>Subgoal for rip = boffset+1688\<close>
  subgoal premises prems for \<sigma>
    text \<open>Insert relevant knowledge\<close>
    apply (insert prems seps ret_address current_task)
    text \<open>Discharge function call\<close>
    apply (rule wps_rls)
    apply (simp (no_asm_simp) add: lookup_table_def instr_index_def entry_size_def)
    apply (rewrite_one_let' add: assembly_def)
    apply (rewrite_one_let' add: spinlock_irqsave_unlock_def)
    apply (rule floyd_invarI'[of _ _ \<open>the (pp_\<Theta> (boffset+1693))\<close>])
     apply (simp add: spinlock_irqsave_unlock_incr)
    using spinlock_irqsave_unlock1688
    apply simp
    done

  text \<open>Subgoal for rip = boffset+1693\<close>
  subgoal premises prems for \<sigma>
    text \<open>Insert relevant knowledge\<close>
    apply (insert prems seps ret_address current_task)
    text \<open>Apply VCG/symb.\ execution\<close>
    apply (restart_symbolic_execution?, (symbolic_execution masters: masters)+, (finish_symbolic_execution masters: masters)?)+
    done

  text \<open>Subgoal for rip = boffset+1696\<close>
  subgoal premises prems for \<sigma>
    text \<open>Insert relevant knowledge\<close>
    apply (insert prems seps ret_address current_task)
    text \<open>Apply VCG/symb.\ execution\<close>
    apply (restart_symbolic_execution?, (symbolic_execution masters: masters)+, (finish_symbolic_execution masters: masters)?)+
    apply restart_symbolic_execution
    apply auto
    done

  text \<open>Subgoal for rip = boffset+1711\<close>
  subgoal premises prems for \<sigma>
    text \<open>Insert relevant knowledge\<close>
    apply (insert prems seps ret_address current_task)
    text \<open>Discharge function call\<close>
    apply (rule wps_rls)
    apply (simp (no_asm_simp) add: lookup_table_def instr_index_def entry_size_def)
    apply (rewrite_one_let' add: assembly_def)
    apply (rewrite_one_let' add: stack_chk_fail_def)
    apply (rule floyd_invarI'[of _ _ \<open>the (pp_\<Theta> (boffset+1716))\<close>])
     apply (simp add: stack_chk_fail_incr)
    using stack_chk_fail1711
    apply simp
    done

  text \<open>Subgoal for rip = boffset+1716\<close>
  subgoal premises prems for \<sigma>
    text \<open>Insert relevant knowledge\<close>
    apply (insert prems seps ret_address current_task)
    text \<open>Apply VCG/symb.\ execution\<close>
    apply (restart_symbolic_execution?, (symbolic_execution masters: masters)+, (finish_symbolic_execution masters: masters)?)+
    done

  text \<open>Trivial ending subgoal.\<close>
  subgoal
    by simp
  done

end

end
