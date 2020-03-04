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
theory block_current_task_opt_mem
  imports tasks_opt
begin

text \<open>Up to two locales per function in the binary.\<close>
locale block_current_task_function = tasks_opt_context +
  fixes rsp\<^sub>0 rbp\<^sub>0 a block_current_task_opt_ret :: \<open>64 word\<close>
    and v\<^sub>0 :: \<open>8 word\<close>
    and blocks :: \<open>(nat \<times> 64 word \<times> nat) set\<close>
  assumes seps: \<open>seps blocks\<close>
    and masters:
      \<open>master blocks (a, 1) 0\<close>
      \<open>master blocks (rbp\<^sub>0, 8) 1\<close>
      \<open>master blocks (rsp\<^sub>0, 8) 2\<close>
    and ret_address: \<open>outside block_current_task_opt_ret 1094 1409\<close> \<comment> \<open>Only works for non-recursive functions.\<close>
begin

text \<open>
  The Floyd invariant expresses for some locations properties that are invariably true.
  Simply expresses that a byte in the memory remains untouched.
\<close>
definition pp_\<Theta> :: floyd_invar where
  \<open>pp_\<Theta> \<equiv> [
    \<comment> \<open>precondition\<close>
    boffset+1094 \<mapsto> \<lambda>\<sigma>. regs \<sigma> rsp = rsp\<^sub>0
      \<and> regs \<sigma> rbp = rbp\<^sub>0
      \<and> \<sigma> \<turnstile> *[rsp\<^sub>0,8] = boffset+block_current_task_opt_ret
      \<and> \<sigma> \<turnstile> *[a,1] = v\<^sub>0,
    boffset+1131 \<mapsto> \<lambda>\<sigma>. regs \<sigma> rsp = rsp\<^sub>0-72
      \<and> regs \<sigma> rbp = rbp\<^sub>0+0
      \<and> regs \<sigma> r15 = r15\<^sub>0+0
      \<and> regs \<sigma> r14 = r14\<^sub>0+0
      \<and> regs \<sigma> r13 = r13\<^sub>0+0
      \<and> regs \<sigma> r12 = r12\<^sub>0+0
      \<and> regs \<sigma> rbx = rbx\<^sub>0+0
      \<and> \<sigma> \<turnstile> *[rsp\<^sub>0,8] = boffset+block_current_task_opt_ret
      \<and> \<sigma> \<turnstile> *[a,1] = v\<^sub>0,
    boffset+1136 \<mapsto> \<lambda>\<sigma>. regs \<sigma> rsp = rsp\<^sub>0-72
      \<and> regs \<sigma> rbp = rbp\<^sub>0+0
      \<and> regs \<sigma> r15 = r15\<^sub>0+0
      \<and> regs \<sigma> r14 = r14\<^sub>0+0
      \<and> regs \<sigma> r13 = r13\<^sub>0+0
      \<and> regs \<sigma> r12 = r12\<^sub>0+0
      \<and> regs \<sigma> rbx = rbx\<^sub>0+0
      \<and> \<sigma> \<turnstile> *[rsp\<^sub>0,8] = boffset+block_current_task_opt_ret
      \<and> \<sigma> \<turnstile> *[a,1] = v\<^sub>0,
    boffset+1198 \<mapsto> \<lambda>\<sigma>. regs \<sigma> rsp = rsp\<^sub>0-72
      \<and> regs \<sigma> rbp = rbp\<^sub>0+0
      \<and> regs \<sigma> r15 = r15\<^sub>0+0
      \<and> regs \<sigma> r14 = r14\<^sub>0+0
      \<and> regs \<sigma> r13 = r13\<^sub>0+0
      \<and> regs \<sigma> r12 = r12\<^sub>0+0
      \<and> regs \<sigma> rbx = rbx\<^sub>0+0
      \<and> \<sigma> \<turnstile> *[rsp\<^sub>0,8] = boffset+block_current_task_opt_ret
      \<and> \<sigma> \<turnstile> *[a,1] = v\<^sub>0,
    boffset+1203 \<mapsto> \<lambda>\<sigma>. regs \<sigma> rsp = rsp\<^sub>0-72
      \<and> regs \<sigma> rbp = rbp\<^sub>0+0
      \<and> regs \<sigma> r15 = r15\<^sub>0+0
      \<and> regs \<sigma> r14 = r14\<^sub>0+0
      \<and> regs \<sigma> r13 = r13\<^sub>0+0
      \<and> regs \<sigma> r12 = r12\<^sub>0+0
      \<and> regs \<sigma> rbx = rbx\<^sub>0+0
      \<and> \<sigma> \<turnstile> *[rsp\<^sub>0,8] = boffset+block_current_task_opt_ret
      \<and> \<sigma> \<turnstile> *[a,1] = v\<^sub>0,
    boffset+1227 \<mapsto> \<lambda>\<sigma>. regs \<sigma> rsp = rsp\<^sub>0-72
      \<and> regs \<sigma> rbp = rbp\<^sub>0+0
      \<and> regs \<sigma> r15 = r15\<^sub>0+0
      \<and> regs \<sigma> r14 = r14\<^sub>0+0
      \<and> regs \<sigma> r13 = r13\<^sub>0+0
      \<and> regs \<sigma> r12 = r12\<^sub>0+0
      \<and> regs \<sigma> rbx = rbx\<^sub>0+0
      \<and> \<sigma> \<turnstile> *[rsp\<^sub>0,8] = boffset+block_current_task_opt_ret
      \<and> \<sigma> \<turnstile> *[a,1] = v\<^sub>0,
    boffset+1249 \<mapsto> \<lambda>\<sigma>. regs \<sigma> rsp = rsp\<^sub>0-72
      \<and> regs \<sigma> rbp = rbp\<^sub>0+0
      \<and> regs \<sigma> r15 = r15\<^sub>0+0
      \<and> regs \<sigma> r14 = r14\<^sub>0+0
      \<and> regs \<sigma> r13 = r13\<^sub>0+0
      \<and> regs \<sigma> r12 = r12\<^sub>0+0
      \<and> regs \<sigma> rbx = rbx\<^sub>0+0
      \<and> \<sigma> \<turnstile> *[rsp\<^sub>0,8] = boffset+block_current_task_opt_ret
      \<and> \<sigma> \<turnstile> *[a,1] = v\<^sub>0,
    boffset+1275 \<mapsto> \<lambda>\<sigma>. regs \<sigma> rsp = rsp\<^sub>0-72
      \<and> regs \<sigma> rbp = rbp\<^sub>0+0
      \<and> regs \<sigma> r15 = r15\<^sub>0+0
      \<and> regs \<sigma> r14 = r14\<^sub>0+0
      \<and> regs \<sigma> r13 = r13\<^sub>0+0
      \<and> regs \<sigma> r12 = r12\<^sub>0+0
      \<and> regs \<sigma> rbx = rbx\<^sub>0+0
      \<and> \<sigma> \<turnstile> *[rsp\<^sub>0,8] = boffset+block_current_task_opt_ret
      \<and> \<sigma> \<turnstile> *[a,1] = v\<^sub>0,
    boffset+1300 \<mapsto> \<lambda>\<sigma>. regs \<sigma> rsp = rsp\<^sub>0-72
      \<and> regs \<sigma> rbp = rbp\<^sub>0+0
      \<and> regs \<sigma> r15 = r15\<^sub>0+0
      \<and> regs \<sigma> r14 = r14\<^sub>0+0
      \<and> regs \<sigma> r13 = r13\<^sub>0+0
      \<and> regs \<sigma> r12 = r12\<^sub>0+0
      \<and> regs \<sigma> rbx = rbx\<^sub>0+0
      \<and> \<sigma> \<turnstile> *[rsp\<^sub>0,8] = boffset+block_current_task_opt_ret
      \<and> \<sigma> \<turnstile> *[a,1] = v\<^sub>0,
    boffset+1305 \<mapsto> \<lambda>\<sigma>. regs \<sigma> rsp = rsp\<^sub>0-72
      \<and> regs \<sigma> rbp = rbp\<^sub>0+0
      \<and> regs \<sigma> r15 = r15\<^sub>0+0
      \<and> regs \<sigma> r14 = r14\<^sub>0+0
      \<and> regs \<sigma> r13 = r13\<^sub>0+0
      \<and> regs \<sigma> r12 = r12\<^sub>0+0
      \<and> regs \<sigma> rbx = rbx\<^sub>0+0
      \<and> \<sigma> \<turnstile> *[rsp\<^sub>0,8] = boffset+block_current_task_opt_ret
      \<and> \<sigma> \<turnstile> *[a,1] = v\<^sub>0,
    boffset+1326 \<mapsto> \<lambda>\<sigma>. regs \<sigma> rsp = rsp\<^sub>0-72
      \<and> regs \<sigma> rbp = rbp\<^sub>0+0
      \<and> regs \<sigma> r15 = r15\<^sub>0+0
      \<and> regs \<sigma> r14 = r14\<^sub>0+0
      \<and> regs \<sigma> r13 = r13\<^sub>0+0
      \<and> regs \<sigma> r12 = r12\<^sub>0+0
      \<and> regs \<sigma> rbx = rbx\<^sub>0+0
      \<and> \<sigma> \<turnstile> *[rsp\<^sub>0,8] = boffset+block_current_task_opt_ret
      \<and> \<sigma> \<turnstile> *[a,1] = v\<^sub>0,
    boffset+1331 \<mapsto> \<lambda>\<sigma>. regs \<sigma> rsp = rsp\<^sub>0-72
      \<and> regs \<sigma> rbp = rbp\<^sub>0+0
      \<and> regs \<sigma> r15 = r15\<^sub>0+0
      \<and> regs \<sigma> r14 = r14\<^sub>0+0
      \<and> regs \<sigma> r13 = r13\<^sub>0+0
      \<and> regs \<sigma> r12 = r12\<^sub>0+0
      \<and> regs \<sigma> rbx = rbx\<^sub>0+0
      \<and> \<sigma> \<turnstile> *[rsp\<^sub>0,8] = boffset+block_current_task_opt_ret
      \<and> \<sigma> \<turnstile> *[a,1] = v\<^sub>0,
    boffset+1336 \<mapsto> \<lambda>\<sigma>. regs \<sigma> rsp = rsp\<^sub>0-72
      \<and> regs \<sigma> rbp = rbp\<^sub>0+0
      \<and> regs \<sigma> r15 = r15\<^sub>0+0
      \<and> regs \<sigma> r14 = r14\<^sub>0+0
      \<and> regs \<sigma> r13 = r13\<^sub>0+0
      \<and> regs \<sigma> r12 = r12\<^sub>0+0
      \<and> regs \<sigma> rbx = rbx\<^sub>0+0
      \<and> \<sigma> \<turnstile> *[rsp\<^sub>0,8] = boffset+block_current_task_opt_ret
      \<and> \<sigma> \<turnstile> *[a,1] = v\<^sub>0,
    boffset+1341 \<mapsto> \<lambda>\<sigma>. regs \<sigma> rsp = rsp\<^sub>0-72
      \<and> regs \<sigma> rbp = rbp\<^sub>0+0
      \<and> regs \<sigma> r15 = r15\<^sub>0+0
      \<and> regs \<sigma> r14 = r14\<^sub>0+0
      \<and> regs \<sigma> r13 = r13\<^sub>0+0
      \<and> regs \<sigma> r12 = r12\<^sub>0+0
      \<and> regs \<sigma> rbx = rbx\<^sub>0+0
      \<and> \<sigma> \<turnstile> *[rsp\<^sub>0,8] = boffset+block_current_task_opt_ret
      \<and> \<sigma> \<turnstile> *[a,1] = v\<^sub>0,
    \<comment> \<open>postcondition\<close>
    boffset+block_current_task_opt_ret \<mapsto> \<lambda>\<sigma>. \<sigma> \<turnstile> *[a,1] = v\<^sub>0
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

locale block_current_task_function_calls = block_current_task_function +
  fixes spinlock_irqsave_unlock irq_nested_enable spinlock_irqsave_lock irq_nested_disable :: \<open>state \<Rightarrow> state\<close>
  assumes spinlock_irqsave_unlock_def: \<open>exec_instr assembly semantics tasks_flag_annotation (Unary (IS_8088 Call) (Immediate (ImmLabel ''spinlock_irqsave_unlock''))) 5 = spinlock_irqsave_unlock\<close>
    and spinlock_irqsave_unlock_incr: \<open>regs (spinlock_irqsave_unlock \<sigma>) rip = regs \<sigma> rip + 5\<close>
    and spinlock_irqsave_unlock1326: \<open>the (pp_\<Theta> (boffset+1326)) \<sigma> \<Longrightarrow> the (pp_\<Theta> (boffset+1331)) (spinlock_irqsave_unlock \<sigma>)\<close>
    and irq_nested_enable_def: \<open>exec_instr assembly semantics tasks_flag_annotation (Unary (IS_8088 Call) (Immediate (ImmLabel ''irq_nested_enable''))) 5 = irq_nested_enable\<close>
    and irq_nested_enable_incr: \<open>regs (irq_nested_enable \<sigma>) rip = regs \<sigma> rip + 5\<close>
    and irq_nested_enable1336: \<open>the (pp_\<Theta> (boffset+1336)) \<sigma> \<Longrightarrow> the (pp_\<Theta> (boffset+1341)) (irq_nested_enable \<sigma>)\<close>
    and spinlock_irqsave_lock_def: \<open>exec_instr assembly semantics tasks_flag_annotation (Unary (IS_8088 Call) (Immediate (ImmLabel ''spinlock_irqsave_lock''))) 5 = spinlock_irqsave_lock\<close>
    and spinlock_irqsave_lock_incr: \<open>regs (spinlock_irqsave_lock \<sigma>) rip = regs \<sigma> rip + 5\<close>
    and spinlock_irqsave_lock1198: \<open>the (pp_\<Theta> (boffset+1198)) \<sigma> \<Longrightarrow> the (pp_\<Theta> (boffset+1203)) (spinlock_irqsave_lock \<sigma>)\<close>
    and irq_nested_disable_def: \<open>exec_instr assembly semantics tasks_flag_annotation (Unary (IS_8088 Call) (Immediate (ImmLabel ''irq_nested_disable''))) 5 = irq_nested_disable\<close>
    and irq_nested_disable_incr: \<open>regs (irq_nested_disable \<sigma>) rip = regs \<sigma> rip + 5\<close>
    and irq_nested_disable1131: \<open>the (pp_\<Theta> (boffset+1131)) \<sigma> \<Longrightarrow> the (pp_\<Theta> (boffset+1136)) (irq_nested_disable \<sigma>)\<close>
begin

lemma rewrite_block_current_task_opt_mem:
  \<open>is_std_invar block_current_task_opt_ret (floyd.invar block_current_task_opt_ret pp_\<Theta>)\<close>
  text \<open>Boilerplate code to start the VCG\<close>
  apply (rule floyd_invarI)
  apply (rewrite at \<open>floyd_vcs block_current_task_opt_ret \<hole> _\<close> pp_\<Theta>_def)
  apply (intro floyd_vcsI)

  text \<open>Subgoal for rip = boffset+1094\<close>
  subgoal premises prems for \<sigma>
    text \<open>Insert relevant knowledge\<close>
    apply (insert prems seps ret_address)
    text \<open>Apply VCG/symb.\ execution\<close>
    apply (restart_symbolic_execution?, (symbolic_execution masters: masters)+, (finish_symbolic_execution masters: masters)?)+
    done

  text \<open>Subgoal for rip = boffset+1131\<close>
  subgoal premises prems for \<sigma>
    text \<open>Insert relevant knowledge\<close>
    apply (insert prems seps ret_address)
    text \<open>Discharge function call\<close>
    apply (rule wps_rls)
    apply (simp (no_asm_simp) add: lookup_table_def instr_index_def entry_size_def)
    apply (rewrite_one_let' add: assembly_def)
    apply (rewrite_one_let' add: irq_nested_disable_def)
    apply (rule floyd_invarI'[of _ _ \<open>the (pp_\<Theta> (boffset+1136))\<close>])
     apply (simp add: irq_nested_disable_incr)
    using irq_nested_disable1131
    apply simp
    done

  text \<open>Subgoal for rip = boffset+1136\<close>
  subgoal premises prems for \<sigma>
    text \<open>Insert relevant knowledge\<close>
    apply (insert prems seps ret_address)
    text \<open>Apply VCG/symb.\ execution\<close>
    apply (restart_symbolic_execution?, (symbolic_execution masters: masters)+, (finish_symbolic_execution masters: masters)?)+
    done

  text \<open>Subgoal for rip = boffset+1198\<close>
  subgoal premises prems for \<sigma>
    text \<open>Insert relevant knowledge\<close>
    apply (insert prems seps ret_address)
    text \<open>Discharge function call\<close>
    apply (rule wps_rls)
    apply (simp (no_asm_simp) add: lookup_table_def instr_index_def entry_size_def)
    apply (rewrite_one_let' add: assembly_def)
    apply (rewrite_one_let' add: spinlock_irqsave_lock_def)
    apply (rule floyd_invarI'[of _ _ \<open>the (pp_\<Theta> (boffset+1203))\<close>])
     apply (simp add: spinlock_irqsave_lock_incr)
    using spinlock_irqsave_lock1198
    apply simp
    done

  text \<open>Subgoal for rip = boffset+1203\<close>
  subgoal premises prems for \<sigma>
    text \<open>Insert relevant knowledge\<close>
    apply (insert prems seps ret_address)
    text \<open>Apply VCG/symb.\ execution\<close>
    apply (restart_symbolic_execution?, (symbolic_execution masters: masters)+, (finish_symbolic_execution masters: masters)?)+
    done

  text \<open>Subgoal for rip = boffset+1227\<close>
  subgoal premises prems for \<sigma>
    text \<open>Insert relevant knowledge\<close>
    apply (insert prems seps ret_address)
    text \<open>Apply VCG/symb.\ execution\<close>
    apply (restart_symbolic_execution?, (symbolic_execution masters: masters)+, (finish_symbolic_execution masters: masters)?)+
    done

  text \<open>Subgoal for rip = boffset+1249\<close>
  subgoal premises prems for \<sigma>
    text \<open>Insert relevant knowledge\<close>
    apply (insert prems seps ret_address)
    text \<open>Apply VCG/symb.\ execution\<close>
    apply (restart_symbolic_execution?, (symbolic_execution masters: masters)+, (finish_symbolic_execution masters: masters)?)+
    done

  text \<open>Subgoal for rip = boffset+1275\<close>
  subgoal premises prems for \<sigma>
    text \<open>Insert relevant knowledge\<close>
    apply (insert prems seps ret_address)
    text \<open>Apply VCG/symb.\ execution\<close>
    apply (restart_symbolic_execution?, (symbolic_execution masters: masters)+, (finish_symbolic_execution masters: masters)?)+
    done

  text \<open>Subgoal for rip = boffset+1300\<close>
  subgoal premises prems for \<sigma>
    text \<open>Insert relevant knowledge\<close>
    apply (insert prems seps ret_address)
    text \<open>Apply VCG/symb.\ execution\<close>
    apply (restart_symbolic_execution?, (symbolic_execution masters: masters)+, (finish_symbolic_execution masters: masters)?)+
    done

  text \<open>Subgoal for rip = boffset+1305\<close>
  subgoal premises prems for \<sigma>
    text \<open>Insert relevant knowledge\<close>
    apply (insert prems seps ret_address)
    text \<open>Apply VCG/symb.\ execution\<close>
    apply (restart_symbolic_execution?, (symbolic_execution masters: masters)+, (finish_symbolic_execution masters: masters)?)+
    done

  text \<open>Subgoal for rip = boffset+1326\<close>
  subgoal premises prems for \<sigma>
    text \<open>Insert relevant knowledge\<close>
    apply (insert prems seps ret_address)
    text \<open>Discharge function call\<close>
    apply (rule wps_rls)
    apply (simp (no_asm_simp) add: lookup_table_def instr_index_def entry_size_def)
    apply (rewrite_one_let' add: assembly_def)
    apply (rewrite_one_let' add: spinlock_irqsave_unlock_def)
    apply (rule floyd_invarI'[of _ _ \<open>the (pp_\<Theta> (boffset+1331))\<close>])
     apply (simp add: spinlock_irqsave_unlock_incr)
    using spinlock_irqsave_unlock1326
    apply simp
    done

  text \<open>Subgoal for rip = boffset+1331\<close>
  subgoal premises prems for \<sigma>
    text \<open>Insert relevant knowledge\<close>
    apply (insert prems seps ret_address)
    text \<open>Apply VCG/symb.\ execution\<close>
    apply (restart_symbolic_execution?, (symbolic_execution masters: masters)+, (finish_symbolic_execution masters: masters)?)+
    done

  text \<open>Subgoal for rip = boffset+1336\<close>
  subgoal premises prems for \<sigma>
    text \<open>Insert relevant knowledge\<close>
    apply (insert prems seps ret_address)
    text \<open>Discharge function call\<close>
    apply (rule wps_rls)
    apply (simp (no_asm_simp) add: lookup_table_def instr_index_def entry_size_def)
    apply (rewrite_one_let' add: assembly_def)
    apply (rewrite_one_let' add: irq_nested_enable_def)
    apply (rule floyd_invarI'[of _ _ \<open>the (pp_\<Theta> (boffset+1341))\<close>])
     apply (simp add: irq_nested_enable_incr)
    using irq_nested_enable1336
    apply simp
    done

  text \<open>Subgoal for rip = boffset+1341\<close>
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
