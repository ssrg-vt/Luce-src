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
theory dequeue_pop_mem
  imports dequeue
begin

text \<open>Up to two locales per function in the binary.\<close>
locale dequeue_pop_function = dequeue_context +
  fixes rsp\<^sub>0 rbp\<^sub>0 a dequeue_pop_ret :: \<open>64 word\<close>
    and v\<^sub>0 :: \<open>8 word\<close>
    and blocks :: \<open>(nat \<times> 64 word \<times> nat) set\<close>
  assumes seps: \<open>seps blocks\<close>
    and masters:
      \<open>master blocks (a, 1) 0\<close>
      \<open>master blocks (rsp\<^sub>0, 8) 1\<close>
      \<open>master blocks (rsp\<^sub>0-8, 8) 2\<close>
      \<open>master blocks (rsp\<^sub>0-16, 8) 3\<close>
      \<open>master blocks (rsp\<^sub>0-24, 8) 4\<close>
    and ret_address: \<open>outside dequeue_pop_ret 347 587\<close> \<comment> \<open>Only works for non-recursive functions.\<close>
begin

text \<open>
  The Floyd invariant expresses for some locations properties that are invariably true.
  Simply expresses that a byte in the memory remains untouched.
\<close>
definition pp_\<Theta> :: \<open>_ \<Rightarrow> floyd_invar\<close> where
  \<open>pp_\<Theta> dequeue \<equiv> [
    \<comment> \<open>precondition\<close>
    boffset+347 \<mapsto> \<lambda>\<sigma>. regs \<sigma> rsp = rsp\<^sub>0
      \<and> regs \<sigma> rbp = rbp\<^sub>0
      \<and> regs \<sigma> rdi = dequeue
      \<and> \<sigma> \<turnstile> *[rsp\<^sub>0,8] = boffset+dequeue_pop_ret
      \<and> \<sigma> \<turnstile> *[a,1] = v\<^sub>0,
    boffset+426 \<mapsto> \<lambda>\<sigma>. regs \<sigma> rsp = rsp\<^sub>0-24
      \<and> regs \<sigma> rbp = rsp\<^sub>0-8
      \<and> \<sigma> \<turnstile> *[rsp\<^sub>0-16,8] = dequeue
      \<and> \<sigma> \<turnstile> *[rsp\<^sub>0-8,8] = rbp\<^sub>0
      \<and> \<sigma> \<turnstile> *[rsp\<^sub>0,8] = boffset+dequeue_pop_ret
      \<and> \<sigma> \<turnstile> *[a,1] = v\<^sub>0,
    boffset+431 \<mapsto> \<lambda>\<sigma>. regs \<sigma> rsp = rsp\<^sub>0-24
      \<and> regs \<sigma> rbp = rsp\<^sub>0-8
      \<and> \<sigma> \<turnstile> *[rsp\<^sub>0-16,8] = dequeue
      \<and> \<sigma> \<turnstile> *[rsp\<^sub>0-8,8] = rbp\<^sub>0
      \<and> \<sigma> \<turnstile> *[rsp\<^sub>0,8] = boffset+dequeue_pop_ret
      \<and> \<sigma> \<turnstile> *[a,1] = v\<^sub>0,
    boffset+462 \<mapsto> \<lambda>\<sigma>. regs \<sigma> rsp = rsp\<^sub>0-24
      \<and> regs \<sigma> rbp = rsp\<^sub>0-8
      \<and> \<sigma> \<turnstile> *[rsp\<^sub>0-16,8] = dequeue
      \<and> \<sigma> \<turnstile> *[rsp\<^sub>0-8,8] = rbp\<^sub>0
      \<and> \<sigma> \<turnstile> *[rsp\<^sub>0,8] = boffset+dequeue_pop_ret
      \<and> \<sigma> \<turnstile> *[a,1] = v\<^sub>0,
    boffset+467 \<mapsto> \<lambda>\<sigma>. regs \<sigma> rsp = rsp\<^sub>0-24
      \<and> regs \<sigma> rbp = rsp\<^sub>0-8
      \<and> \<sigma> \<turnstile> *[rsp\<^sub>0-16,8] = dequeue
      \<and> \<sigma> \<turnstile> *[rsp\<^sub>0-8,8] = rbp\<^sub>0
      \<and> \<sigma> \<turnstile> *[rsp\<^sub>0,8] = boffset+dequeue_pop_ret
      \<and> \<sigma> \<turnstile> *[a,1] = v\<^sub>0,
    boffset+522 \<mapsto> \<lambda>\<sigma>. regs \<sigma> rsp = rsp\<^sub>0-24
      \<and> regs \<sigma> rbp = rsp\<^sub>0-8
      \<and> \<sigma> \<turnstile> *[rsp\<^sub>0-16,8] = dequeue
      \<and> \<sigma> \<turnstile> *[rsp\<^sub>0-8,8] = rbp\<^sub>0
      \<and> \<sigma> \<turnstile> *[rsp\<^sub>0,8] = boffset+dequeue_pop_ret
      \<and> \<sigma> \<turnstile> *[a,1] = v\<^sub>0,
    boffset+527 \<mapsto> \<lambda>\<sigma>. regs \<sigma> rsp = rsp\<^sub>0-24
      \<and> regs \<sigma> rbp = rsp\<^sub>0-8
      \<and> \<sigma> \<turnstile> *[rsp\<^sub>0-16,8] = dequeue
      \<and> \<sigma> \<turnstile> *[rsp\<^sub>0-8,8] = rbp\<^sub>0
      \<and> \<sigma> \<turnstile> *[rsp\<^sub>0,8] = boffset+dequeue_pop_ret
      \<and> \<sigma> \<turnstile> *[a,1] = v\<^sub>0,
    boffset+575 \<mapsto> \<lambda>\<sigma>. regs \<sigma> rsp = rsp\<^sub>0-24
      \<and> regs \<sigma> rbp = rsp\<^sub>0-8
      \<and> \<sigma> \<turnstile> *[rsp\<^sub>0-8,8] = rbp\<^sub>0
      \<and> \<sigma> \<turnstile> *[rsp\<^sub>0,8] = boffset+dequeue_pop_ret
      \<and> \<sigma> \<turnstile> *[a,1] = v\<^sub>0,
    boffset+580 \<mapsto> \<lambda>\<sigma>. regs \<sigma> rsp = rsp\<^sub>0-24
      \<and> regs \<sigma> rbp = rsp\<^sub>0-8
      \<and> \<sigma> \<turnstile> *[rsp\<^sub>0-8,8] = rbp\<^sub>0
      \<and> \<sigma> \<turnstile> *[rsp\<^sub>0,8] = boffset+dequeue_pop_ret
      \<and> \<sigma> \<turnstile> *[a,1] = v\<^sub>0,
    boffset+585 \<mapsto> \<lambda>\<sigma>. regs \<sigma> rsp = rsp\<^sub>0-24
      \<and> regs \<sigma> rbp = rsp\<^sub>0-8
      \<and> \<sigma> \<turnstile> *[rsp\<^sub>0-8,8] = rbp\<^sub>0
      \<and> \<sigma> \<turnstile> *[rsp\<^sub>0,8] = boffset+dequeue_pop_ret
      \<and> \<sigma> \<turnstile> *[a,1] = v\<^sub>0,
    \<comment> \<open>postcondition\<close>
    boffset+dequeue_pop_ret \<mapsto> \<lambda>\<sigma>. \<sigma> \<turnstile> *[a,1] = v\<^sub>0
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

locale dequeue_pop_function_calls = dequeue_pop_function +
  fixes spinlock_unlock memcpy spinlock_lock :: \<open>state \<Rightarrow> state\<close>
  assumes spinlock_unlock_def: \<open>exec_instr assembly semantics tasks_flag_annotation (Unary (IS_8088 Call) (Immediate (ImmLabel ''spinlock_unlock''))) 5 = spinlock_unlock\<close>
    and spinlock_unlock_incr: \<open>regs (spinlock_unlock \<sigma>) rip = regs \<sigma> rip + 5\<close>
    and spinlock_unlock462: \<open>the (pp_\<Theta> dequeue (boffset+462)) \<sigma> \<Longrightarrow> the (pp_\<Theta> dequeue (boffset+467)) (spinlock_unlock \<sigma>)\<close>
    and spinlock_unlock575: \<open>the (pp_\<Theta> dequeue (boffset+575)) \<sigma> \<Longrightarrow> the (pp_\<Theta> dequeue (boffset+580)) (spinlock_unlock \<sigma>)\<close>
    and memcpy_def: \<open>exec_instr assembly semantics tasks_flag_annotation (Unary (IS_8088 Call) (Immediate (ImmLabel ''memcpy''))) 5 = memcpy\<close>
    and memcpy_incr: \<open>regs (memcpy \<sigma>) rip = regs \<sigma> rip + 5\<close>
    and memcpy522: \<open>the (pp_\<Theta> dequeue (boffset+522)) \<sigma> \<Longrightarrow> the (pp_\<Theta> dequeue (boffset+527)) (memcpy \<sigma>)\<close>
    and spinlock_lock_def: \<open>exec_instr assembly semantics tasks_flag_annotation (Unary (IS_8088 Call) (Immediate (ImmLabel ''spinlock_lock''))) 5 = spinlock_lock\<close>
    and spinlock_lock_incr: \<open>regs (spinlock_lock \<sigma>) rip = regs \<sigma> rip + 5\<close>
    and spinlock_lock426: \<open>the (pp_\<Theta> dequeue (boffset+426)) \<sigma> \<Longrightarrow> the (pp_\<Theta> dequeue (boffset+431)) (spinlock_lock \<sigma>)\<close>
begin

lemma rewrite_dequeue_pop_mem:
  assumes \<open>master blocks (dequeue, 8) 5\<close>
  shows \<open>is_std_invar dequeue_pop_ret (floyd.invar dequeue_pop_ret (pp_\<Theta> dequeue))\<close>
proof -
  note masters = masters assms

  show ?thesis
    text \<open>Boilerplate code to start the VCG\<close>
    apply (rule floyd_invarI)
    apply (rewrite at \<open>floyd_vcs dequeue_pop_ret \<hole> _\<close> pp_\<Theta>_def)
    apply (intro floyd_vcsI)

    text \<open>Subgoal for rip = boffset+347\<close>
    subgoal premises prems for \<sigma>
      text \<open>Insert relevant knowledge\<close>
      apply (insert prems seps ret_address)
      text \<open>Apply VCG/symb.\ execution\<close>
      apply (restart_symbolic_execution?, (symbolic_execution masters: masters)+, (finish_symbolic_execution masters: masters)?)+
      done

    text \<open>Subgoal for rip = boffset+426\<close>
    subgoal premises prems for \<sigma>
      text \<open>Insert relevant knowledge\<close>
      apply (insert prems seps ret_address)
      text \<open>Discharge function call\<close>
      apply (rule wps_rls)
      apply (simp (no_asm_simp) add: lookup_table_def instr_index_def entry_size_def)
      apply (rewrite_one_let' add: assembly_def)
      apply (rewrite_one_let' add: spinlock_lock_def)
      apply (rule floyd_invarI'[of _ _ \<open>the (pp_\<Theta> dequeue (boffset+431))\<close>])
       apply (simp add: spinlock_lock_incr)
      using spinlock_lock426
      apply auto
      done

    text \<open>Subgoal for rip = boffset+431\<close>
    subgoal premises prems for \<sigma>
      text \<open>Insert relevant knowledge\<close>
      apply (insert prems seps ret_address)
      text \<open>Apply VCG/symb.\ execution\<close>
      apply (restart_symbolic_execution?, (symbolic_execution masters: masters)+, (finish_symbolic_execution masters: masters)?)+
      apply auto
      done

    text \<open>Subgoal for rip = boffset+462\<close>
    subgoal premises prems for \<sigma>
      text \<open>Insert relevant knowledge\<close>
      apply (insert prems seps ret_address)
      text \<open>Discharge function call\<close>
      apply (rule wps_rls)
      apply (simp (no_asm_simp) add: lookup_table_def instr_index_def entry_size_def)
      apply (rewrite_one_let' add: assembly_def)
      apply (rewrite_one_let' add: spinlock_unlock_def)
      apply (rule floyd_invarI'[of _ _ \<open>the (pp_\<Theta> dequeue (boffset+467))\<close>])
       apply (simp add: spinlock_unlock_incr)
      using spinlock_unlock462
      apply simp
      done

    text \<open>Subgoal for rip = boffset+467\<close>
    subgoal premises prems for \<sigma>
      text \<open>Insert relevant knowledge\<close>
      apply (insert prems seps ret_address)
      text \<open>Apply VCG/symb.\ execution\<close>
      apply (restart_symbolic_execution?, (symbolic_execution masters: masters)+, (finish_symbolic_execution masters: masters)?)+
      done

    text \<open>Subgoal for rip = boffset+522\<close>
    subgoal premises prems for \<sigma>
      text \<open>Insert relevant knowledge\<close>
      apply (insert prems seps ret_address)
      text \<open>Discharge function call\<close>
      apply (rule wps_rls)
      apply (simp (no_asm_simp) add: lookup_table_def instr_index_def entry_size_def)
      apply (rewrite_one_let' add: assembly_def)
      apply (rewrite_one_let' add: memcpy_def)
      apply (rule floyd_invarI'[of _ _ \<open>the (pp_\<Theta> dequeue (boffset+527))\<close>])
       apply (simp add: memcpy_incr)
      using memcpy522
      apply simp
      done

    text \<open>Subgoal for rip = boffset+527\<close>
    subgoal premises prems for \<sigma>
      text \<open>Insert relevant knowledge\<close>
      apply (insert prems seps ret_address)
      text \<open>Apply VCG/symb.\ execution\<close>
      apply (restart_symbolic_execution?, (symbolic_execution masters: masters)+, (finish_symbolic_execution masters: masters)?)+
      done

    text \<open>Subgoal for rip = boffset+575\<close>
    subgoal premises prems for \<sigma>
      text \<open>Insert relevant knowledge\<close>
      apply (insert prems seps ret_address)
      text \<open>Discharge function call\<close>
      apply (rule wps_rls)
      apply (simp (no_asm_simp) add: lookup_table_def instr_index_def entry_size_def)
      apply (rewrite_one_let' add: assembly_def)
      apply (rewrite_one_let' add: spinlock_unlock_def)
      apply (rule floyd_invarI'[of _ _ \<open>the (pp_\<Theta> dequeue (boffset+580))\<close>])
       apply (simp add: spinlock_unlock_incr)
      using spinlock_unlock575
      apply simp
      done

    text \<open>Subgoal for rip = boffset+580\<close>
    subgoal premises prems for \<sigma>
      text \<open>Insert relevant knowledge\<close>
      apply (insert prems seps ret_address)
      text \<open>Apply VCG/symb.\ execution\<close>
      apply (restart_symbolic_execution?, (symbolic_execution masters: masters)+, (finish_symbolic_execution masters: masters)?)+
      done

    text \<open>Subgoal for rip = boffset+585\<close>
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
