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
theory spinlock_irqsave_unlock_mem
  imports spinlock
begin

text \<open>Up to two locales per function in the binary.\<close>
locale spinlock_irqsave_unlock_function = spinlock_context +
  fixes rsp\<^sub>0 rbp\<^sub>0 a spinlock_irqsave_unlock_ret :: \<open>64 word\<close>
    and v\<^sub>0 :: \<open>8 word\<close>
    and blocks :: \<open>(nat \<times> 64 word \<times> nat) set\<close>
  assumes seps: \<open>seps blocks\<close>
    and masters:
      \<open>master blocks (a, 1) 0\<close>
      \<open>master blocks (rsp\<^sub>0, 8) 1\<close>
      \<open>master blocks (rsp\<^sub>0-8, 8) 2\<close>
      \<open>master blocks (rsp\<^sub>0-16, 8) 3\<close>
    and ret_address: \<open>outside spinlock_irqsave_unlock_ret 925 1040\<close> \<comment> \<open>Only works for non-recursive functions.\<close>
begin

text \<open>
  The Floyd invariant expresses for some locations properties that are invariably true.
  Simply expresses that a byte in the memory remains untouched.
\<close>
definition pp_\<Theta> :: \<open>_ \<Rightarrow> floyd_invar\<close> where
  \<open>pp_\<Theta> s \<equiv> [
    \<comment> \<open>precondition\<close>
    boffset+925 \<mapsto> \<lambda>\<sigma>. regs \<sigma> rsp = rsp\<^sub>0
      \<and> regs \<sigma> rbp = rbp\<^sub>0
      \<and> regs \<sigma> rdi = s
      \<and> \<sigma> \<turnstile> *[rsp\<^sub>0,8] = boffset+spinlock_irqsave_unlock_ret
      \<and> \<sigma> \<turnstile> *[a,1] = v\<^sub>0,
    boffset+1010 \<mapsto> \<lambda>\<sigma>. regs \<sigma> rsp = rsp\<^sub>0-24
      \<and> regs \<sigma> rbp = rsp\<^sub>0-8
      \<and> \<sigma> \<turnstile> *[rsp\<^sub>0-8,8] = rbp\<^sub>0
      \<and> \<sigma> \<turnstile> *[rsp\<^sub>0,8] = boffset+spinlock_irqsave_unlock_ret
      \<and> \<sigma> \<turnstile> *[a,1] = v\<^sub>0,
    boffset+1015 \<mapsto> \<lambda>\<sigma>. regs \<sigma> rsp = rsp\<^sub>0-24
      \<and> regs \<sigma> rbp = rsp\<^sub>0-8
      \<and> \<sigma> \<turnstile> *[rsp\<^sub>0-8,8] = rbp\<^sub>0
      \<and> \<sigma> \<turnstile> *[rsp\<^sub>0,8] = boffset+spinlock_irqsave_unlock_ret
      \<and> \<sigma> \<turnstile> *[a,1] = v\<^sub>0,
    boffset+1028 \<mapsto> \<lambda>\<sigma>. regs \<sigma> rsp = rsp\<^sub>0-24
      \<and> regs \<sigma> rbp = rsp\<^sub>0-8
      \<and> \<sigma> \<turnstile> *[rsp\<^sub>0-8,8] = rbp\<^sub>0
      \<and> \<sigma> \<turnstile> *[rsp\<^sub>0,8] = boffset+spinlock_irqsave_unlock_ret
      \<and> \<sigma> \<turnstile> *[a,1] = v\<^sub>0,
    boffset+1033 \<mapsto> \<lambda>\<sigma>. regs \<sigma> rsp = rsp\<^sub>0-24
      \<and> regs \<sigma> rbp = rsp\<^sub>0-8
      \<and> \<sigma> \<turnstile> *[rsp\<^sub>0-8,8] = rbp\<^sub>0
      \<and> \<sigma> \<turnstile> *[rsp\<^sub>0,8] = boffset+spinlock_irqsave_unlock_ret
      \<and> \<sigma> \<turnstile> *[a,1] = v\<^sub>0,
    boffset+1038 \<mapsto> \<lambda>\<sigma>. regs \<sigma> rsp = rsp\<^sub>0-24
      \<and> regs \<sigma> rbp = rsp\<^sub>0-8
      \<and> \<sigma> \<turnstile> *[rsp\<^sub>0-8,8] = rbp\<^sub>0
      \<and> \<sigma> \<turnstile> *[rsp\<^sub>0,8] = boffset+spinlock_irqsave_unlock_ret
      \<and> \<sigma> \<turnstile> *[a,1] = v\<^sub>0,
    \<comment> \<open>postcondition\<close>
    boffset+spinlock_irqsave_unlock_ret \<mapsto> \<lambda>\<sigma>. \<sigma> \<turnstile> *[a,1] = v\<^sub>0
      \<and> regs \<sigma> rsp = rsp\<^sub>0+8
      \<and> regs \<sigma> rbp = rbp\<^sub>0
  ]\<close>

text \<open>Adding some rules to the simplifier to simplify proofs.\<close>
schematic_goal pp_\<Theta>_zero[simp]:
  \<open>pp_\<Theta> s boffset = ?x\<close>
  unfolding pp_\<Theta>_def
  by simp
schematic_goal pp_\<Theta>_numeral_l[simp]:
  \<open>pp_\<Theta> s (n + boffset) = ?x\<close>
  unfolding pp_\<Theta>_def
  by simp
schematic_goal pp_\<Theta>_numeral_r[simp]:
  \<open>pp_\<Theta> s (boffset + n) = ?x\<close>
  unfolding pp_\<Theta>_def
  by simp

end

locale spinlock_irqsave_unlock_function_calls = spinlock_irqsave_unlock_function +
  fixes irq_nested_enable atomic_int64_inc :: \<open>state \<Rightarrow> state\<close>
  assumes irq_nested_enable_def: \<open>exec_instr assembly semantics tasks_flag_annotation (Unary (IS_8088 Call) (Immediate (ImmLabel ''irq_nested_enable''))) 5 = irq_nested_enable\<close>
    and irq_nested_enable_incr: \<open>regs (irq_nested_enable \<sigma>) rip = regs \<sigma> rip + 5\<close>
    and irq_nested_enable1028: \<open>the (pp_\<Theta> s (boffset+1028)) \<sigma> \<Longrightarrow> the (pp_\<Theta> s (boffset+1033)) (irq_nested_enable \<sigma>)\<close>
    and atomic_int64_inc_def: \<open>exec_instr assembly semantics tasks_flag_annotation (Unary (IS_8088 Call) (Immediate (ImmLabel ''atomic_int64_inc''))) 5 = atomic_int64_inc\<close>
    and atomic_int64_inc_incr: \<open>regs (atomic_int64_inc \<sigma>) rip = regs \<sigma> rip + 5\<close>
    and atomic_int64_inc1010: \<open>the (pp_\<Theta> s (boffset+1010)) \<sigma> \<Longrightarrow> the (pp_\<Theta> s (boffset+1015)) (atomic_int64_inc \<sigma>)\<close>
begin

lemma rewrite_spinlock_irqsave_unlock_mem:
  assumes
    \<open>master blocks (s + 16, 4) 4\<close>
    \<open>master blocks (s + 20, 4) 5\<close>
  shows \<open>is_std_invar spinlock_irqsave_unlock_ret (floyd.invar spinlock_irqsave_unlock_ret (pp_\<Theta> s))\<close>
proof -
  note masters = masters assms

  show ?thesis
    text \<open>Boilerplate code to start the VCG\<close>
    apply (rule floyd_invarI)
    apply (rewrite at \<open>floyd_vcs spinlock_irqsave_unlock_ret \<hole> _\<close> pp_\<Theta>_def)
    apply (intro floyd_vcsI)

    text \<open>Subgoal for rip = boffset+925\<close>
    subgoal premises prems for \<sigma>
      text \<open>Insert relevant knowledge\<close>
      apply (insert prems seps ret_address)
      text \<open>Apply VCG/symb.\ execution\<close>
      apply (restart_symbolic_execution?, (symbolic_execution masters: masters)+, (finish_symbolic_execution masters: masters)?)+
      done

    text \<open>Subgoal for rip = boffset+1010\<close>
    subgoal premises prems for \<sigma>
      text \<open>Insert relevant knowledge\<close>
      apply (insert prems seps ret_address)
      text \<open>Discharge function call\<close>
      apply (rule wps_rls)
      apply (simp (no_asm_simp) add: lookup_table_def instr_index_def entry_size_def)
      apply (rewrite_one_let' add: assembly_def)
      apply (rewrite_one_let' add: atomic_int64_inc_def)
      apply (rule floyd_invarI'[of _ _ \<open>the (pp_\<Theta> s (boffset+1015))\<close>])
       apply (simp add: atomic_int64_inc_incr)
      using atomic_int64_inc1010
      apply simp
      done

    text \<open>Subgoal for rip = boffset+1015\<close>
    subgoal premises prems for \<sigma>
      text \<open>Insert relevant knowledge\<close>
      apply (insert prems seps ret_address)
      text \<open>Apply VCG/symb.\ execution\<close>
      apply (restart_symbolic_execution?, (symbolic_execution masters: masters)+, (finish_symbolic_execution masters: masters)?)+
      done

    text \<open>Subgoal for rip = boffset+1028\<close>
    subgoal premises prems for \<sigma>
      text \<open>Insert relevant knowledge\<close>
      apply (insert prems seps ret_address)
      text \<open>Discharge function call\<close>
      apply (rule wps_rls)
      apply (simp (no_asm_simp) add: lookup_table_def instr_index_def entry_size_def)
      apply (rewrite_one_let' add: assembly_def)
      apply (rewrite_one_let' add: irq_nested_enable_def)
      apply (rule floyd_invarI'[of _ _ \<open>the (pp_\<Theta> s (boffset+1033))\<close>])
       apply (simp add: irq_nested_enable_incr)
      using irq_nested_enable1028
      apply simp
      done

    text \<open>Subgoal for rip = boffset+1033\<close>
    subgoal premises prems for \<sigma>
      text \<open>Insert relevant knowledge\<close>
      apply (insert prems seps ret_address)
      text \<open>Apply VCG/symb.\ execution\<close>
      apply (restart_symbolic_execution?, (symbolic_execution masters: masters)+, (finish_symbolic_execution masters: masters)?)+
      done

    text \<open>Subgoal for rip = boffset+1038\<close>
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
qed

end

end
