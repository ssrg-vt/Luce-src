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
theory spinlock_irqsave_init_mem
  imports spinlock
begin

text \<open>Up to two locales per function in the binary.\<close>
locale spinlock_irqsave_init_function = spinlock_context +
  fixes rsp\<^sub>0 rbp\<^sub>0 a spinlock_irqsave_init_ret :: \<open>64 word\<close>
    and v\<^sub>0 :: \<open>8 word\<close>
    and blocks :: \<open>(nat \<times> 64 word \<times> nat) set\<close>
  assumes seps: \<open>seps blocks\<close>
    and masters:
      \<open>master blocks (a, 1) 0\<close>
      \<open>master blocks (rsp\<^sub>0, 8) 1\<close>
      \<open>master blocks (rsp\<^sub>0-8, 8) 2\<close>
      \<open>master blocks (rsp\<^sub>0-16, 8) 3\<close>
    and ret_address: \<open>outside spinlock_irqsave_init_ret 565 675\<close> \<comment> \<open>Only works for non-recursive functions.\<close>
begin

text \<open>
  The Floyd invariant expresses for some locations properties that are invariably true.
  Simply expresses that a byte in the memory remains untouched.
\<close>
definition pp_\<Theta> :: \<open>_ \<Rightarrow> floyd_invar\<close> where
  \<open>pp_\<Theta> s \<equiv> [
    \<comment> \<open>precondition\<close>
    boffset+565 \<mapsto> \<lambda>\<sigma>. regs \<sigma> rsp = rsp\<^sub>0
      \<and> regs \<sigma> rbp = rbp\<^sub>0
      \<and> regs \<sigma> rdi = s
      \<and> \<sigma> \<turnstile> *[rsp\<^sub>0,8] = boffset+spinlock_irqsave_init_ret
      \<and> \<sigma> \<turnstile> *[a,1] = v\<^sub>0,
    boffset+612 \<mapsto> \<lambda>\<sigma>. regs \<sigma> rsp = rsp\<^sub>0-16
      \<and> regs \<sigma> rbp = rsp\<^sub>0-8
      \<and> \<sigma> \<turnstile> *[rsp\<^sub>0-16,8] = s
      \<and> \<sigma> \<turnstile> *[rsp\<^sub>0-8,8] = rbp\<^sub>0
      \<and> \<sigma> \<turnstile> *[rsp\<^sub>0,8] = boffset+spinlock_irqsave_init_ret
      \<and> \<sigma> \<turnstile> *[a,1] = v\<^sub>0,
    boffset+617 \<mapsto> \<lambda>\<sigma>. regs \<sigma> rsp = rsp\<^sub>0-16
      \<and> regs \<sigma> rbp = rsp\<^sub>0-8
      \<and> \<sigma> \<turnstile> *[rsp\<^sub>0-16,8] = s
      \<and> \<sigma> \<turnstile> *[rsp\<^sub>0-8,8] = rbp\<^sub>0
      \<and> \<sigma> \<turnstile> *[rsp\<^sub>0,8] = boffset+spinlock_irqsave_init_ret
      \<and> \<sigma> \<turnstile> *[a,1] = v\<^sub>0,
    boffset+633 \<mapsto> \<lambda>\<sigma>. regs \<sigma> rsp = rsp\<^sub>0-16
      \<and> regs \<sigma> rbp = rsp\<^sub>0-8
      \<and> \<sigma> \<turnstile> *[rsp\<^sub>0-16,8] = s
      \<and> \<sigma> \<turnstile> *[rsp\<^sub>0-8,8] = rbp\<^sub>0
      \<and> \<sigma> \<turnstile> *[rsp\<^sub>0,8] = boffset+spinlock_irqsave_init_ret
      \<and> \<sigma> \<turnstile> *[a,1] = v\<^sub>0,
    boffset+638 \<mapsto> \<lambda>\<sigma>. regs \<sigma> rsp = rsp\<^sub>0-16
      \<and> regs \<sigma> rbp = rsp\<^sub>0-8
      \<and> \<sigma> \<turnstile> *[rsp\<^sub>0-16,8] = s
      \<and> \<sigma> \<turnstile> *[rsp\<^sub>0-8,8] = rbp\<^sub>0
      \<and> \<sigma> \<turnstile> *[rsp\<^sub>0,8] = boffset+spinlock_irqsave_init_ret
      \<and> \<sigma> \<turnstile> *[a,1] = v\<^sub>0,
    boffset+673 \<mapsto> \<lambda>\<sigma>. regs \<sigma> rsp = rsp\<^sub>0-16
      \<and> regs \<sigma> rbp = rsp\<^sub>0-8
      \<and> \<sigma> \<turnstile> *[rsp\<^sub>0-8,8] = rbp\<^sub>0
      \<and> \<sigma> \<turnstile> *[rsp\<^sub>0,8] = boffset+spinlock_irqsave_init_ret
      \<and> \<sigma> \<turnstile> *[a,1] = v\<^sub>0,
    \<comment> \<open>postcondition\<close>
    boffset+spinlock_irqsave_init_ret \<mapsto> \<lambda>\<sigma>. \<sigma> \<turnstile> *[a,1] = v\<^sub>0
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

locale spinlock_irqsave_init_function_calls = spinlock_irqsave_init_function +
  fixes atomic_int64_set :: \<open>state \<Rightarrow> state\<close>
  assumes atomic_int64_set_def: \<open>exec_instr assembly semantics tasks_flag_annotation (Unary (IS_8088 Call) (Immediate (ImmLabel ''atomic_int64_set''))) 5 = atomic_int64_set\<close>
    and atomic_int64_set_incr: \<open>regs (atomic_int64_set \<sigma>) rip = regs \<sigma> rip + 5\<close>
    and atomic_int64_set612: \<open>the (pp_\<Theta> s (boffset+612)) \<sigma> \<Longrightarrow> the (pp_\<Theta> s (boffset+617)) (atomic_int64_set \<sigma>)\<close>
    and atomic_int64_set633: \<open>the (pp_\<Theta> s (boffset+633)) \<sigma> \<Longrightarrow> the (pp_\<Theta> s (boffset+638)) (atomic_int64_set \<sigma>)\<close>
begin

lemma rewrite_spinlock_irqsave_init_mem:
  assumes
    \<open>master blocks (s + 16, 4) 4\<close>
    \<open>master blocks (s + 20, 4) 5\<close>
    \<open>master blocks (s + 24, Suc 0) 6\<close>
  shows \<open>is_std_invar spinlock_irqsave_init_ret (floyd.invar spinlock_irqsave_init_ret (pp_\<Theta> s))\<close>
proof -
  note masters = masters assms

  show ?thesis
    text \<open>Boilerplate code to start the VCG\<close>
    apply (rule floyd_invarI)
    apply (rewrite at \<open>floyd_vcs spinlock_irqsave_init_ret \<hole> _\<close> pp_\<Theta>_def)
    apply (intro floyd_vcsI)

    text \<open>Subgoal for rip = boffset+565\<close>
    subgoal premises prems for \<sigma>
      text \<open>Insert relevant knowledge\<close>
      apply (insert prems seps ret_address)
      text \<open>Apply VCG/symb.\ execution\<close>
      apply (restart_symbolic_execution?, (symbolic_execution masters: masters)+, (finish_symbolic_execution masters: masters)?)+
      done

    text \<open>Subgoal for rip = boffset+612\<close>
    subgoal premises prems for \<sigma>
      text \<open>Insert relevant knowledge\<close>
      apply (insert prems seps ret_address)
      text \<open>Discharge function call\<close>
      apply (rule wps_rls)
      apply (simp (no_asm_simp) add: lookup_table_def instr_index_def entry_size_def)
      apply (rewrite_one_let' add: assembly_def)
      apply (rewrite_one_let' add: atomic_int64_set_def)
      apply (rule floyd_invarI'[of _ _ \<open>the (pp_\<Theta> s (boffset+617))\<close>])
       apply (simp add: atomic_int64_set_incr)
      using atomic_int64_set612
      apply simp
      done

    text \<open>Subgoal for rip = boffset+617\<close>
    subgoal premises prems for \<sigma>
      text \<open>Insert relevant knowledge\<close>
      apply (insert prems seps ret_address)
      text \<open>Apply VCG/symb.\ execution\<close>
      apply (restart_symbolic_execution?, (symbolic_execution masters: masters)+, (finish_symbolic_execution masters: masters)?)+
      done

    text \<open>Subgoal for rip = boffset+633\<close>
    subgoal premises prems for \<sigma>
      text \<open>Insert relevant knowledge\<close>
      apply (insert prems seps ret_address)
      text \<open>Discharge function call\<close>
      apply (rule wps_rls)
      apply (simp (no_asm_simp) add: lookup_table_def instr_index_def entry_size_def)
      apply (rewrite_one_let' add: assembly_def)
      apply (rewrite_one_let' add: atomic_int64_set_def)
      apply (rule floyd_invarI'[of _ _ \<open>the (pp_\<Theta> s (boffset+638))\<close>])
       apply (simp add: atomic_int64_set_incr)
      using atomic_int64_set633
      apply simp
      done

    text \<open>Subgoal for rip = boffset+638\<close>
    subgoal premises prems for \<sigma>
      text \<open>Insert relevant knowledge\<close>
      apply (insert prems seps ret_address)
      text \<open>Apply VCG/symb.\ execution\<close>
      apply (restart_symbolic_execution?, (symbolic_execution masters: masters)+, (finish_symbolic_execution masters: masters)?)+
      done

    text \<open>Subgoal for rip = boffset+673\<close>
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
