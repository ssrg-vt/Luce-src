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
theory dequeue_init_opt_mem
  imports dequeue_opt
begin

text \<open>Up to two locales per function in the binary.\<close>
locale dequeue_init_function = dequeue_opt_context +
  fixes rsp\<^sub>0 rbp\<^sub>0 a dequeue_init_opt_ret :: \<open>64 word\<close>
    and v\<^sub>0 :: \<open>8 word\<close>
    and blocks :: \<open>(nat \<times> 64 word \<times> nat) set\<close>
  assumes seps: \<open>seps blocks\<close>
    and masters:
      \<open>master blocks (a, 1) 0\<close>
      \<open>master blocks (rsp\<^sub>0, 8) 1\<close>
    and ret_address: \<open>outside dequeue_init_opt_ret 177 236\<close> \<comment> \<open>Only works for non-recursive functions.\<close>
begin

text \<open>
  The Floyd invariant expresses for some locations properties that are invariably true.
  Simply expresses that a byte in the memory remains untouched.
\<close>
definition pp_\<Theta> :: \<open>_ \<Rightarrow> floyd_invar\<close> where
  \<open>pp_\<Theta> dequeue \<equiv> [
    \<comment> \<open>precondition\<close>
    boffset+177 \<mapsto> \<lambda>\<sigma>. regs \<sigma> rsp = rsp\<^sub>0
      \<and> regs \<sigma> rbp = rbp\<^sub>0
      \<and> regs \<sigma> rdi = dequeue
      \<and> \<sigma> \<turnstile> *[rsp\<^sub>0,8] = boffset+dequeue_init_opt_ret
      \<and> \<sigma> \<turnstile> *[a,1] = v\<^sub>0,
    boffset+218 \<mapsto> \<lambda>\<sigma>. regs \<sigma> rsp = rsp\<^sub>0-8
      \<and> regs \<sigma> rbp = rbp\<^sub>0
      \<and> \<sigma> \<turnstile> *[rsp\<^sub>0,8] = boffset+dequeue_init_opt_ret
      \<and> \<sigma> \<turnstile> *[a,1] = v\<^sub>0,
    boffset+223 \<mapsto> \<lambda>\<sigma>. regs \<sigma> rsp = rsp\<^sub>0-8
      \<and> regs \<sigma> rbp = rbp\<^sub>0
      \<and> \<sigma> \<turnstile> *[rsp\<^sub>0,8] = boffset+dequeue_init_opt_ret
      \<and> \<sigma> \<turnstile> *[a,1] = v\<^sub>0,
    \<comment> \<open>postcondition\<close>
    boffset+dequeue_init_opt_ret \<mapsto> \<lambda>\<sigma>. \<sigma> \<turnstile> *[a,1] = v\<^sub>0
      \<and> regs \<sigma> rsp = rsp\<^sub>0+8
      \<and> regs \<sigma> rbp = rbp\<^sub>0
  ]\<close>

text \<open>Adding some rules to the simplifier to simplify proofs.\<close>
schematic_goal pp_\<Theta>_zero[simp]:
  \<open>pp_\<Theta> dequeue boffset = ?x\<close>
  unfolding pp_\<Theta>_def
  by simp
schematic_goal pp_\<Theta>_numeral_l[simp]:
  \<open>pp_\<Theta> dequeue (n + boffset) = ?x\<close>
  unfolding pp_\<Theta>_def
  by simp
schematic_goal pp_\<Theta>_numeral_r[simp]:
  \<open>pp_\<Theta> dequeue (boffset + n) = ?x\<close>
  unfolding pp_\<Theta>_def
  by simp

end

locale dequeue_init_function_calls = dequeue_init_function +
  fixes spinlock_init :: \<open>state \<Rightarrow> state\<close>
  assumes spinlock_init_def: \<open>exec_instr assembly semantics tasks_flag_annotation (Unary (IS_8088 Call) (Immediate (ImmLabel ''spinlock_init''))) 5 = spinlock_init\<close>
    and spinlock_init_incr: \<open>regs (spinlock_init \<sigma>) rip = regs \<sigma> rip + 5\<close>
    and spinlock_init218: \<open>the (pp_\<Theta> dequeue (boffset+218)) \<sigma> \<Longrightarrow> the (pp_\<Theta> dequeue (boffset+223)) (spinlock_init \<sigma>)\<close>
begin

lemma rewrite_dequeue_init_opt_mem:
  assumes
    \<open>master blocks (dequeue, 8) 2\<close>
    \<open>master blocks (dequeue + 8, 8) 3\<close>
    \<open>master blocks (dequeue + 40, 8) 4\<close>
    \<open>master blocks (dequeue + 48, 8) 5\<close>
    \<open>master blocks (dequeue + 56, 8) 6\<close>
  shows \<open>is_std_invar dequeue_init_opt_ret (floyd.invar dequeue_init_opt_ret (pp_\<Theta> dequeue))\<close>
proof -
  note masters = masters assms

  show ?thesis
    text \<open>Boilerplate code to start the VCG\<close>
    apply (rule floyd_invarI)
    apply (rewrite at \<open>floyd_vcs dequeue_init_opt_ret \<hole> _\<close> pp_\<Theta>_def)
    apply (intro floyd_vcsI)

    text \<open>Subgoal for rip = boffset+177\<close>
    subgoal premises prems for \<sigma>
      text \<open>Insert relevant knowledge\<close>
      apply (insert prems seps ret_address)
      text \<open>Apply VCG/symb.\ execution\<close>
      apply (restart_symbolic_execution?, (symbolic_execution masters: masters)+, (finish_symbolic_execution masters: masters)?)+
      done

    text \<open>Subgoal for rip = boffset+218\<close>
    subgoal premises prems for \<sigma>
      text \<open>Insert relevant knowledge\<close>
      apply (insert prems seps ret_address)
      text \<open>Discharge function call\<close>
      apply (rule wps_rls)
      apply (simp (no_asm_simp) add: lookup_table_def instr_index_def entry_size_def)
      apply (rewrite_one_let' add: assembly_def)
      apply (rewrite_one_let' add: spinlock_init_def)
      apply (rule floyd_invarI'[of _ _ \<open>the (pp_\<Theta> dequeue (boffset+223))\<close>])
       apply (simp add: spinlock_init_incr)
      using spinlock_init218
      apply simp
      done

    text \<open>Subgoal for rip = boffset+223\<close>
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
