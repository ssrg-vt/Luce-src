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
theory dequeue_pop_opt_mem
  imports dequeue_opt
begin

text \<open>Up to two locales per function in the binary.\<close>
locale dequeue_pop_function = dequeue_opt_context +
  fixes rsp\<^sub>0 rbp\<^sub>0 rbx\<^sub>0 r12\<^sub>0 a dequeue_pop_opt_ret :: \<open>64 word\<close>
    and v\<^sub>0 :: \<open>8 word\<close>
    and blocks :: \<open>(nat \<times> 64 word \<times> nat) set\<close>
  assumes seps: \<open>seps blocks\<close>
    and masters:
      \<open>master blocks (a, 1) 0\<close>
      \<open>master blocks (rsp\<^sub>0, 8) 1\<close>
    and ret_address: \<open>outside dequeue_pop_opt_ret 358 474\<close> \<comment> \<open>Only works for non-recursive functions.\<close>
begin

text \<open>
  The Floyd invariant expresses for some locations properties that are invariably true.
  Simply expresses that a byte in the memory remains untouched.
\<close>
definition pp_\<Theta> :: floyd_invar where
  \<open>pp_\<Theta> \<equiv> [
    \<comment> \<open>precondition\<close>
    boffset+358 \<mapsto> \<lambda>\<sigma>. regs \<sigma> rsp = rsp\<^sub>0
      \<and> regs \<sigma> rbp = rbp\<^sub>0
      \<and> \<sigma> \<turnstile> *[rsp\<^sub>0,8] = boffset+dequeue_pop_opt_ret
      \<and> \<sigma> \<turnstile> *[a,1] = v\<^sub>0,
    boffset+385 \<mapsto> \<lambda>\<sigma>. regs \<sigma> rsp = rsp\<^sub>0-24
      \<and> regs \<sigma> rbp = rbp\<^sub>0
      \<and> regs \<sigma> r12 = r12\<^sub>0
      \<and> regs \<sigma> rbx = rbx\<^sub>0
      \<and> \<sigma> \<turnstile> *[rsp\<^sub>0,8] = boffset+dequeue_pop_opt_ret
      \<and> \<sigma> \<turnstile> *[a,1] = v\<^sub>0,
    boffset+390 \<mapsto> \<lambda>\<sigma>. regs \<sigma> rsp = rsp\<^sub>0-24
      \<and> regs \<sigma> rbp = rbp\<^sub>0
      \<and> regs \<sigma> r12 = r12\<^sub>0
      \<and> regs \<sigma> rbx = rbx\<^sub>0
      \<and> \<sigma> \<turnstile> *[rsp\<^sub>0,8] = boffset+dequeue_pop_opt_ret
      \<and> \<sigma> \<turnstile> *[a,1] = v\<^sub>0,
    boffset+417 \<mapsto> \<lambda>\<sigma>. regs \<sigma> rsp = rsp\<^sub>0-24
      \<and> regs \<sigma> rbp = rbp\<^sub>0
      \<and> regs \<sigma> r12 = r12\<^sub>0
      \<and> regs \<sigma> rbx = rbx\<^sub>0
      \<and> \<sigma> \<turnstile> *[rsp\<^sub>0,8] = boffset+dequeue_pop_opt_ret
      \<and> \<sigma> \<turnstile> *[a,1] = v\<^sub>0,
    boffset+422 \<mapsto> \<lambda>\<sigma>. regs \<sigma> rsp = rsp\<^sub>0-24
      \<and> regs \<sigma> rbp = rbp\<^sub>0
      \<and> regs \<sigma> r12 = r12\<^sub>0
      \<and> regs \<sigma> rbx = rbx\<^sub>0
      \<and> \<sigma> \<turnstile> *[rsp\<^sub>0,8] = boffset+dequeue_pop_opt_ret
      \<and> \<sigma> \<turnstile> *[a,1] = v\<^sub>0,
    boffset+441 \<mapsto> \<lambda>\<sigma>. regs \<sigma> rsp = rsp\<^sub>0-24
      \<and> regs \<sigma> rbp = rbp\<^sub>0
      \<and> regs \<sigma> r12 = r12\<^sub>0
      \<and> regs \<sigma> rbx = rbx\<^sub>0
      \<and> \<sigma> \<turnstile> *[rsp\<^sub>0,8] = boffset+dequeue_pop_opt_ret
      \<and> \<sigma> \<turnstile> *[a,1] = v\<^sub>0,
    boffset+446 \<mapsto> \<lambda>\<sigma>. regs \<sigma> rsp = rsp\<^sub>0-24
      \<and> regs \<sigma> rbp = rbp\<^sub>0
      \<and> regs \<sigma> r12 = r12\<^sub>0
      \<and> regs \<sigma> rbx = rbx\<^sub>0
      \<and> \<sigma> \<turnstile> *[rsp\<^sub>0,8] = boffset+dequeue_pop_opt_ret
      \<and> \<sigma> \<turnstile> *[a,1] = v\<^sub>0,
    boffset+448 \<mapsto> \<lambda>\<sigma>. regs \<sigma> rsp = rsp\<^sub>0-24
      \<and> regs \<sigma> rbp = rbp\<^sub>0
      \<and> regs \<sigma> r12 = r12\<^sub>0
      \<and> regs \<sigma> rbx = rbx\<^sub>0
      \<and> \<sigma> \<turnstile> *[rsp\<^sub>0,8] = boffset+dequeue_pop_opt_ret
      \<and> \<sigma> \<turnstile> *[a,1] = v\<^sub>0,
    boffset+454 \<mapsto> \<lambda>\<sigma>. regs \<sigma> rsp = rsp\<^sub>0+8
      \<and> regs \<sigma> rbp = rbp\<^sub>0
      \<and> regs \<sigma> r12 = r12\<^sub>0
      \<and> regs \<sigma> rbx = rbx\<^sub>0
      \<and> \<sigma> \<turnstile> *[rsp\<^sub>0,8] = boffset+dequeue_pop_opt_ret
      \<and> \<sigma> \<turnstile> *[a,1] = v\<^sub>0,
    boffset+463 \<mapsto> \<lambda>\<sigma>. regs \<sigma> rsp = rsp\<^sub>0+16
      \<and> regs \<sigma> rbp = rbp\<^sub>0
      \<and> regs \<sigma> r12 = r12\<^sub>0
      \<and> regs \<sigma> rbx = rbx\<^sub>0
      \<and> \<sigma> \<turnstile> *[rsp\<^sub>0,8] = boffset+dequeue_pop_opt_ret
      \<and> \<sigma> \<turnstile> *[a,1] = v\<^sub>0,
    boffset+468 \<mapsto> \<lambda>\<sigma>. regs \<sigma> rsp = rsp\<^sub>0+16
      \<and> regs \<sigma> rbp = rbp\<^sub>0
      \<and> regs \<sigma> r12 = r12\<^sub>0
      \<and> regs \<sigma> rbx = rbx\<^sub>0
      \<and> \<sigma> \<turnstile> *[rsp\<^sub>0,8] = boffset+dequeue_pop_opt_ret
      \<and> \<sigma> \<turnstile> *[a,1] = v\<^sub>0,
    \<comment> \<open>postcondition\<close>
    boffset+dequeue_pop_opt_ret \<mapsto> \<lambda>\<sigma>. \<sigma> \<turnstile> *[a,1] = v\<^sub>0
      \<and> regs \<sigma> rsp = rsp\<^sub>0+8
      \<and> regs \<sigma> rbp = rbp\<^sub>0
      \<and> regs \<sigma> r12 = r12\<^sub>0
      \<and> regs \<sigma> rbx = rbx\<^sub>0
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

locale dequeue_pop_function_calls = dequeue_pop_function +
  fixes spinlock_lock memcpy spinlock_unlock :: \<open>state \<Rightarrow> state\<close>
  assumes spinlock_lock_def: \<open>exec_instr assembly semantics tasks_flag_annotation (Unary (IS_8088 Call) (Immediate (ImmLabel ''spinlock_lock''))) 5 = spinlock_lock\<close>
    and spinlock_lock_incr: \<open>regs (spinlock_lock \<sigma>) rip = regs \<sigma> rip + 5\<close>
    and spinlock_lock385: \<open>the (pp_\<Theta> (boffset+385)) \<sigma> \<Longrightarrow> the (pp_\<Theta> (boffset+390)) (spinlock_lock \<sigma>)\<close>
    and memcpy_def: \<open>exec_instr assembly semantics tasks_flag_annotation (Unary (IS_8088 Call) (Immediate (ImmLabel ''memcpy''))) 5 = memcpy\<close>
    and memcpy_incr: \<open>regs (memcpy \<sigma>) rip = regs \<sigma> rip + 5\<close>
    and memcpy417: \<open>the (pp_\<Theta> (boffset+417)) \<sigma> \<Longrightarrow> the (pp_\<Theta> (boffset+422)) (memcpy \<sigma>)\<close>
    and spinlock_unlock_def: \<open>exec_instr assembly semantics tasks_flag_annotation (Unary (IS_8088 Call) (Immediate (ImmLabel ''spinlock_unlock''))) 5 = spinlock_unlock\<close>
    and spinlock_unlock_incr: \<open>regs (spinlock_unlock \<sigma>) rip = regs \<sigma> rip + 5\<close>
    and spinlock_unlock441: \<open>the (pp_\<Theta> (boffset+441)) \<sigma> \<Longrightarrow> the (pp_\<Theta> (boffset+446)) (spinlock_unlock \<sigma>)\<close>
    and spinlock_unlock463: \<open>the (pp_\<Theta> (boffset+463)) \<sigma> \<Longrightarrow> the (pp_\<Theta> (boffset+468)) (spinlock_unlock \<sigma>)\<close>
begin

lemma rewrite_dequeue_pop_opt_mem:
  \<open>is_std_invar dequeue_pop_opt_ret (floyd.invar dequeue_pop_opt_ret pp_\<Theta>)\<close>
  text \<open>Boilerplate code to start the VCG\<close>
  apply (rule floyd_invarI)
  apply (rewrite at \<open>floyd_vcs dequeue_pop_opt_ret \<hole> _\<close> pp_\<Theta>_def)
  apply (intro floyd_vcsI)

  text \<open>Subgoal for rip = boffset+358\<close>
  subgoal premises prems for \<sigma>
    text \<open>Insert relevant knowledge\<close>
    apply (insert prems seps ret_address)
    text \<open>Apply VCG/symb.\ execution\<close>
    apply (restart_symbolic_execution?, (symbolic_execution masters: masters)+, (finish_symbolic_execution masters: masters)?)+
    done

  text \<open>Subgoal for rip = boffset+385\<close>
  subgoal premises prems for \<sigma>
    text \<open>Insert relevant knowledge\<close>
    apply (insert prems seps ret_address)
    text \<open>Discharge function call\<close>
    apply (rule wps_rls)
    apply (simp (no_asm_simp) add: lookup_table_def instr_index_def entry_size_def)
    apply (rewrite_one_let' add: assembly_def)
    apply (rewrite_one_let' add: spinlock_lock_def)
    apply (rule floyd_invarI'[of _ _ \<open>the (pp_\<Theta> (boffset+390))\<close>])
     apply (simp add: spinlock_lock_incr)
    using spinlock_lock385
    apply simp
    done

  text \<open>Subgoal for rip = boffset+390\<close>
  subgoal premises prems for \<sigma>
    text \<open>Insert relevant knowledge\<close>
    apply (insert prems seps ret_address)
    text \<open>Apply VCG/symb.\ execution\<close>
    apply (restart_symbolic_execution?, (symbolic_execution masters: masters)+, (finish_symbolic_execution masters: masters)?)+
    done

  text \<open>Subgoal for rip = boffset+417\<close>
  subgoal premises prems for \<sigma>
    text \<open>Insert relevant knowledge\<close>
    apply (insert prems seps ret_address)
    text \<open>Discharge function call\<close>
    apply (rule wps_rls)
    apply (simp (no_asm_simp) add: lookup_table_def instr_index_def entry_size_def)
    apply (rewrite_one_let' add: assembly_def)
    apply (rewrite_one_let' add: memcpy_def)
    apply (rule floyd_invarI'[of _ _ \<open>the (pp_\<Theta> (boffset+422))\<close>])
     apply (simp add: memcpy_incr)
    using memcpy417
    apply simp
    done

  text \<open>Subgoal for rip = boffset+422\<close>
  subgoal premises prems for \<sigma>
    text \<open>Insert relevant knowledge\<close>
    apply (insert prems seps ret_address)
    text \<open>Apply VCG/symb.\ execution\<close>
    apply (restart_symbolic_execution?, (symbolic_execution masters: masters)+, (finish_symbolic_execution masters: masters)?)+
    done

  text \<open>Subgoal for rip = boffset+441\<close>
  subgoal premises prems for \<sigma>
    text \<open>Insert relevant knowledge\<close>
    apply (insert prems seps ret_address)
    text \<open>Discharge function call\<close>
    apply (rule wps_rls)
    apply (simp (no_asm_simp) add: lookup_table_def instr_index_def entry_size_def)
    apply (rewrite_one_let' add: assembly_def)
    apply (rewrite_one_let' add: spinlock_unlock_def)
    apply (rule floyd_invarI'[of _ _ \<open>the (pp_\<Theta> (boffset+446))\<close>])
     apply (simp add: spinlock_unlock_incr)
    using spinlock_unlock441
    apply simp
    done

  text \<open>Subgoal for rip = boffset+446\<close>
  subgoal premises prems for \<sigma>
    text \<open>Insert relevant knowledge\<close>
    apply (insert prems seps ret_address)
    text \<open>Apply VCG/symb.\ execution\<close>
    apply (restart_symbolic_execution?, (symbolic_execution masters: masters)+, (finish_symbolic_execution masters: masters)?)+
    done

  text \<open>Subgoal for rip = boffset+448\<close>
  subgoal premises prems for \<sigma>
    text \<open>Insert relevant knowledge\<close>
    apply (insert prems seps ret_address)
    text \<open>Apply VCG/symb.\ execution\<close>
    apply (restart_symbolic_execution?, (symbolic_execution masters: masters)+, (finish_symbolic_execution masters: masters)?)+
    done

  text \<open>Subgoal for rip = boffset+454\<close>
  subgoal premises prems for \<sigma>
    text \<open>Insert relevant knowledge\<close>
    apply (insert prems seps ret_address)
    text \<open>Apply VCG/symb.\ execution\<close>
    apply (restart_symbolic_execution?, (symbolic_execution masters: masters)+, (finish_symbolic_execution masters: masters)?)+
    done

  text \<open>Subgoal for rip = boffset+463\<close>
  subgoal premises prems for \<sigma>
    text \<open>Insert relevant knowledge\<close>
    apply (insert prems seps ret_address)
    text \<open>Discharge function call\<close>
    apply (rule wps_rls)
    apply (simp (no_asm_simp) add: lookup_table_def instr_index_def entry_size_def)
    apply (rewrite_one_let' add: assembly_def)
    apply (rewrite_one_let' add: spinlock_unlock_def)
    apply (rule floyd_invarI'[of _ _ \<open>the (pp_\<Theta> (boffset+468))\<close>])
     apply (simp add: spinlock_unlock_incr)
    using spinlock_unlock463
    apply simp
    done

  text \<open>Subgoal for rip = boffset+468\<close>
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
