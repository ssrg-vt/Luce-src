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
theory set_idle_task_opt_mem
  imports tasks_opt
begin

text \<open>Up to two locales per function in the binary.\<close>
locale set_idle_task_function = tasks_opt_context +
  fixes rsp\<^sub>0 rbp\<^sub>0 a set_idle_task_opt_ret :: \<open>64 word\<close>
    and v\<^sub>0 :: \<open>8 word\<close>
    and blocks :: \<open>(nat \<times> 64 word \<times> nat) set\<close>
  assumes seps: \<open>seps blocks\<close>
    and masters:
      \<open>master blocks (a, 1) 0\<close>
      \<open>master blocks (rbp\<^sub>0, 8) 1\<close>
      \<open>master blocks (rsp\<^sub>0, 8) 2\<close>
    and ret_address: \<open>outside set_idle_task_opt_ret 578 769\<close> \<comment> \<open>Only works for non-recursive functions.\<close>
begin

text \<open>
  The Floyd invariant expresses for some locations properties that are invariably true.
  Simply expresses that a byte in the memory remains untouched.
\<close>
definition pp_\<Theta> :: floyd_invar where
  \<open>pp_\<Theta> \<equiv> [
    \<comment> \<open>precondition\<close>
    boffset+578 \<mapsto> \<lambda>\<sigma>. regs \<sigma> rsp = rsp\<^sub>0
      \<and> regs \<sigma> rbp = rbp\<^sub>0
      \<and> \<sigma> \<turnstile> *[rsp\<^sub>0,8] = boffset+set_idle_task_opt_ret
      \<and> \<sigma> \<turnstile> *[a,1] = v\<^sub>0,
    boffset+586 \<mapsto> \<lambda>\<sigma>. regs \<sigma> rsp = rsp\<^sub>0-8
      \<and> regs \<sigma> rbp = rbp\<^sub>0+0
      \<and> regs \<sigma> rbx = rbx\<^sub>0+0
      \<and> \<sigma> \<turnstile> *[rsp\<^sub>0,8] = boffset+set_idle_task_opt_ret
      \<and> \<sigma> \<turnstile> *[a,1] = v\<^sub>0,
    boffset+591 \<mapsto> \<lambda>\<sigma>. regs \<sigma> rsp = rsp\<^sub>0-8
      \<and> regs \<sigma> rbp = rbp\<^sub>0+0
      \<and> regs \<sigma> rbx = rbx\<^sub>0+0
      \<and> \<sigma> \<turnstile> *[rsp\<^sub>0,8] = boffset+set_idle_task_opt_ret
      \<and> \<sigma> \<turnstile> *[a,1] = v\<^sub>0,
    boffset+651 \<mapsto> \<lambda>\<sigma>. regs \<sigma> rsp = rsp\<^sub>0-8
      \<and> regs \<sigma> rbp = rbp\<^sub>0+0
      \<and> regs \<sigma> rbx = rbx\<^sub>0+0
      \<and> \<sigma> \<turnstile> *[rsp\<^sub>0,8] = boffset+set_idle_task_opt_ret
      \<and> \<sigma> \<turnstile> *[a,1] = v\<^sub>0,
    boffset+656 \<mapsto> \<lambda>\<sigma>. regs \<sigma> rsp = rsp\<^sub>0-8
      \<and> regs \<sigma> rbp = rbp\<^sub>0+0
      \<and> regs \<sigma> rbx = rbx\<^sub>0+0
      \<and> \<sigma> \<turnstile> *[rsp\<^sub>0,8] = boffset+set_idle_task_opt_ret
      \<and> \<sigma> \<turnstile> *[a,1] = v\<^sub>0,
    boffset+671 \<mapsto> \<lambda>\<sigma>. regs \<sigma> rsp = rsp\<^sub>0+8
      \<and> regs \<sigma> rbp = rbp\<^sub>0+0
      \<and> regs \<sigma> rbx = rbx\<^sub>0+0
      \<and> \<sigma> \<turnstile> *[rsp\<^sub>0,8] = boffset+set_idle_task_opt_ret
      \<and> \<sigma> \<turnstile> *[a,1] = v\<^sub>0,
    boffset+752 \<mapsto> \<lambda>\<sigma>. regs \<sigma> rsp = rsp\<^sub>0+8
      \<and> regs \<sigma> rbp = rbp\<^sub>0+0
      \<and> regs \<sigma> rbx = rbx\<^sub>0+0
      \<and> \<sigma> \<turnstile> *[rsp\<^sub>0,8] = boffset+set_idle_task_opt_ret
      \<and> \<sigma> \<turnstile> *[a,1] = v\<^sub>0,
    boffset+757 \<mapsto> \<lambda>\<sigma>. regs \<sigma> rsp = rsp\<^sub>0+8
      \<and> regs \<sigma> rbp = rbp\<^sub>0+0
      \<and> regs \<sigma> rbx = rbx\<^sub>0+0
      \<and> \<sigma> \<turnstile> *[rsp\<^sub>0,8] = boffset+set_idle_task_opt_ret
      \<and> \<sigma> \<turnstile> *[a,1] = v\<^sub>0,
    \<comment> \<open>postcondition\<close>
    boffset+set_idle_task_opt_ret \<mapsto> \<lambda>\<sigma>. \<sigma> \<turnstile> *[a,1] = v\<^sub>0
      \<and> regs \<sigma> rsp = rsp\<^sub>0+8
      \<^cancel>\<open>\<and> regs \<sigma> rbp = rbp\<^sub>0\<close> \<comment> \<open>TODO: work in flow-through of rbp0 as necessary (such as when pushed, etc.)\<close>
  ]\<close>

text \<open>Adding some rules to the simplifier to simplify proofs.\<close>
schematic_goal pp_\<Theta>_zero[simp]:
  \<open>pp_\<Theta> boffset = ?x\<close>
  unfolding pp_\<Theta>_def
  by simp
schematic_goal pp_\<Theta>_numeral_l[simp]:
  \<open>pp_\<Theta> (n + boffset) = ?x\<close>
  unfolding pp_\<Theta>_def
  by simp
schematic_goal pp_\<Theta>_numeral_r[simp]:
  \<open>pp_\<Theta> (boffset + n) = ?x\<close>
  unfolding pp_\<Theta>_def
  by simp

end

locale set_idle_task_function_calls = set_idle_task_function +
  fixes spinlock_irqsave_unlock spinlock_irqsave_lock :: \<open>state \<Rightarrow> state\<close>
  assumes spinlock_irqsave_unlock_def: \<open>exec_instr assembly semantics tasks_flag_annotation (Unary (IS_8088 Call) (Immediate (ImmLabel ''spinlock_irqsave_unlock''))) 5 = spinlock_irqsave_unlock\<close>
    and spinlock_irqsave_unlock_incr: \<open>regs (spinlock_irqsave_unlock \<sigma>) rip = regs \<sigma> rip + 5\<close>
    and spinlock_irqsave_unlock651: \<open>the (pp_\<Theta> (boffset+651)) \<sigma> \<Longrightarrow> the (pp_\<Theta> (boffset+656)) (spinlock_irqsave_unlock \<sigma>)\<close>
    and spinlock_irqsave_unlock752: \<open>the (pp_\<Theta> (boffset+752)) \<sigma> \<Longrightarrow> the (pp_\<Theta> (boffset+757)) (spinlock_irqsave_unlock \<sigma>)\<close>
    and spinlock_irqsave_lock_def: \<open>exec_instr assembly semantics tasks_flag_annotation (Unary (IS_8088 Call) (Immediate (ImmLabel ''spinlock_irqsave_lock''))) 5 = spinlock_irqsave_lock\<close>
    and spinlock_irqsave_lock_incr: \<open>regs (spinlock_irqsave_lock \<sigma>) rip = regs \<sigma> rip + 5\<close>
    and spinlock_irqsave_lock586: \<open>the (pp_\<Theta> (boffset+586)) \<sigma> \<Longrightarrow> the (pp_\<Theta> (boffset+591)) (spinlock_irqsave_lock \<sigma>)\<close>
begin

lemma rewrite_set_idle_task_opt_mem:
  \<open>is_std_invar set_idle_task_opt_ret (floyd.invar set_idle_task_opt_ret pp_\<Theta>)\<close>
  text \<open>Boilerplate code to start the VCG\<close>
  apply (rule floyd_invarI)
  apply (rewrite at \<open>floyd_vcs set_idle_task_opt_ret \<hole> _\<close> pp_\<Theta>_def)
  apply (intro floyd_vcsI)

  text \<open>Subgoal for rip = boffset+578\<close>
  subgoal premises prems for \<sigma>
    text \<open>Insert relevant knowledge\<close>
    apply (insert prems seps ret_address)
    text \<open>Apply VCG/symb.\ execution\<close>
    apply (restart_symbolic_execution?, (symbolic_execution masters: masters)+, (finish_symbolic_execution masters: masters)?)+
    done

  text \<open>Subgoal for rip = boffset+586\<close>
  subgoal premises prems for \<sigma>
    text \<open>Insert relevant knowledge\<close>
    apply (insert prems seps ret_address)
    text \<open>Discharge function call\<close>
    apply (rule wps_rls)
    apply (simp (no_asm_simp) add: lookup_table_def instr_index_def entry_size_def)
    apply (rewrite_one_let' add: assembly_def)
    apply (rewrite_one_let' add: spinlock_irqsave_lock_def)
    apply (rule floyd_invarI'[of _ _ \<open>the (pp_\<Theta> (boffset+591))\<close>])
     apply (simp add: spinlock_irqsave_lock_incr)
    using spinlock_irqsave_lock586
    apply simp
    done

  text \<open>Subgoal for rip = boffset+591\<close>
  subgoal premises prems for \<sigma>
    text \<open>Insert relevant knowledge\<close>
    apply (insert prems seps ret_address)
    text \<open>Apply VCG/symb.\ execution\<close>
    apply (restart_symbolic_execution?, (symbolic_execution masters: masters)+, (finish_symbolic_execution masters: masters)?)+
    done

  text \<open>Subgoal for rip = boffset+651\<close>
  subgoal premises prems for \<sigma>
    text \<open>Insert relevant knowledge\<close>
    apply (insert prems seps ret_address)
    text \<open>Discharge function call\<close>
    apply (rule wps_rls)
    apply (simp (no_asm_simp) add: lookup_table_def instr_index_def entry_size_def)
    apply (rewrite_one_let' add: assembly_def)
    apply (rewrite_one_let' add: spinlock_irqsave_unlock_def)
    apply (rule floyd_invarI'[of _ _ \<open>the (pp_\<Theta> (boffset+656))\<close>])
     apply (simp add: spinlock_irqsave_unlock_incr)
    using spinlock_irqsave_unlock651
    apply simp
    done

  text \<open>Subgoal for rip = boffset+656\<close>
  subgoal premises prems for \<sigma>
    text \<open>Insert relevant knowledge\<close>
    apply (insert prems seps ret_address)
    text \<open>Apply VCG/symb.\ execution\<close>
    apply (restart_symbolic_execution?, (symbolic_execution masters: masters)+, (finish_symbolic_execution masters: masters)?)+
    done

  text \<open>Subgoal for rip = boffset+671\<close>
  subgoal premises prems for \<sigma>
    text \<open>Insert relevant knowledge\<close>
    apply (insert prems seps ret_address)
    text \<open>Apply VCG/symb.\ execution\<close>
    apply (restart_symbolic_execution?, (symbolic_execution masters: masters)+, (finish_symbolic_execution masters: masters)?)+
    done

  text \<open>Subgoal for rip = boffset+752\<close>
  subgoal premises prems for \<sigma>
    text \<open>Insert relevant knowledge\<close>
    apply (insert prems seps ret_address)
    text \<open>Discharge function call\<close>
    apply (rule wps_rls)
    apply (simp (no_asm_simp) add: lookup_table_def instr_index_def entry_size_def)
    apply (rewrite_one_let' add: assembly_def)
    apply (rewrite_one_let' add: spinlock_irqsave_unlock_def)
    apply (rule floyd_invarI'[of _ _ \<open>the (pp_\<Theta> (boffset+757))\<close>])
     apply (simp add: spinlock_irqsave_unlock_incr)
    using spinlock_irqsave_unlock752
    apply simp
    done

  text \<open>Subgoal for rip = boffset+757\<close>
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
