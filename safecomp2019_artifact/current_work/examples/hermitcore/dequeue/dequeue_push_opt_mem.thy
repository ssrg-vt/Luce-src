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
theory dequeue_push_opt_mem
  imports dequeue_opt
begin

text \<open>Up to two locales per function in the binary.\<close>
locale dequeue_push_function = dequeue_opt_context +
  fixes rsp\<^sub>0 rbp\<^sub>0 a dequeue_push_opt_ret :: \<open>64 word\<close>
    and v\<^sub>0 :: \<open>8 word\<close>
    and blocks :: \<open>(nat \<times> 64 word \<times> nat) set\<close>
  assumes seps: \<open>seps blocks\<close>
    and masters:
      \<open>master blocks (a, 1) 0\<close>
      \<open>master blocks (rsp\<^sub>0, 8) 1\<close>
    and ret_address: \<open>outside dequeue_push_opt_ret 528 650\<close> \<comment> \<open>Only works for non-recursive functions.\<close>
begin

text \<open>
  The Floyd invariant expresses for some locations properties that are invariably true.
  Simply expresses that a byte in the memory remains untouched.
\<close>
definition pp_\<Theta> :: floyd_invar where
  \<open>pp_\<Theta> \<equiv> [
    \<comment> \<open>precondition\<close>
    boffset+528 \<mapsto> \<lambda>\<sigma>. regs \<sigma> rsp = rsp\<^sub>0
      \<and> regs \<sigma> rbp = rbp\<^sub>0
      \<and> \<sigma> \<turnstile> *[rsp\<^sub>0,8] = boffset+dequeue_push_opt_ret
      \<and> \<sigma> \<turnstile> *[a,1] = v\<^sub>0,
    boffset+561 \<mapsto> \<lambda>\<sigma>. regs \<sigma> rsp = rsp\<^sub>0-40
      \<and> regs \<sigma> rbp = rbp\<^sub>0+0
      \<and> regs \<sigma> r13 = r13\<^sub>0+0
      \<and> regs \<sigma> r12 = r12\<^sub>0+0
      \<and> regs \<sigma> rbx = rbx\<^sub>0+0
      \<and> \<sigma> \<turnstile> *[rsp\<^sub>0,8] = boffset+dequeue_push_opt_ret
      \<and> \<sigma> \<turnstile> *[a,1] = v\<^sub>0,
    boffset+566 \<mapsto> \<lambda>\<sigma>. regs \<sigma> rsp = rsp\<^sub>0-40
      \<and> regs \<sigma> rbp = rbp\<^sub>0+0
      \<and> regs \<sigma> r13 = r13\<^sub>0+0
      \<and> regs \<sigma> r12 = r12\<^sub>0+0
      \<and> regs \<sigma> rbx = rbx\<^sub>0+0
      \<and> \<sigma> \<turnstile> *[rsp\<^sub>0,8] = boffset+dequeue_push_opt_ret
      \<and> \<sigma> \<turnstile> *[a,1] = v\<^sub>0,
    boffset+603 \<mapsto> \<lambda>\<sigma>. regs \<sigma> rsp = rsp\<^sub>0-40
      \<and> regs \<sigma> rbp = rbp\<^sub>0+0
      \<and> regs \<sigma> r13 = r13\<^sub>0+0
      \<and> regs \<sigma> r12 = r12\<^sub>0+0
      \<and> regs \<sigma> rbx = rbx\<^sub>0+0
      \<and> \<sigma> \<turnstile> *[rsp\<^sub>0,8] = boffset+dequeue_push_opt_ret
      \<and> \<sigma> \<turnstile> *[a,1] = v\<^sub>0,
    boffset+608 \<mapsto> \<lambda>\<sigma>. regs \<sigma> rsp = rsp\<^sub>0-40
      \<and> regs \<sigma> rbp = rbp\<^sub>0+0
      \<and> regs \<sigma> r13 = r13\<^sub>0+0
      \<and> regs \<sigma> r12 = r12\<^sub>0+0
      \<and> regs \<sigma> rbx = rbx\<^sub>0+0
      \<and> \<sigma> \<turnstile> *[rsp\<^sub>0,8] = boffset+dequeue_push_opt_ret
      \<and> \<sigma> \<turnstile> *[a,1] = v\<^sub>0,
    boffset+615 \<mapsto> \<lambda>\<sigma>. regs \<sigma> rsp = rsp\<^sub>0-40
      \<and> regs \<sigma> rbp = rbp\<^sub>0+0
      \<and> regs \<sigma> r13 = r13\<^sub>0+0
      \<and> regs \<sigma> r12 = r12\<^sub>0+0
      \<and> regs \<sigma> rbx = rbx\<^sub>0+0
      \<and> \<sigma> \<turnstile> *[rsp\<^sub>0,8] = boffset+dequeue_push_opt_ret
      \<and> \<sigma> \<turnstile> *[a,1] = v\<^sub>0,
    boffset+620 \<mapsto> \<lambda>\<sigma>. regs \<sigma> rsp = rsp\<^sub>0-40
      \<and> regs \<sigma> rbp = rbp\<^sub>0+0
      \<and> regs \<sigma> r13 = r13\<^sub>0+0
      \<and> regs \<sigma> r12 = r12\<^sub>0+0
      \<and> regs \<sigma> rbx = rbx\<^sub>0+0
      \<and> \<sigma> \<turnstile> *[rsp\<^sub>0,8] = boffset+dequeue_push_opt_ret
      \<and> \<sigma> \<turnstile> *[a,1] = v\<^sub>0,
    boffset+622 \<mapsto> \<lambda>\<sigma>. regs \<sigma> rsp = rsp\<^sub>0-40
      \<and> regs \<sigma> rbp = rbp\<^sub>0+0
      \<and> regs \<sigma> r13 = r13\<^sub>0+0
      \<and> regs \<sigma> r12 = r12\<^sub>0+0
      \<and> regs \<sigma> rbx = rbx\<^sub>0+0
      \<and> \<sigma> \<turnstile> *[rsp\<^sub>0,8] = boffset+dequeue_push_opt_ret
      \<and> \<sigma> \<turnstile> *[a,1] = v\<^sub>0,
    boffset+645 \<mapsto> \<lambda>\<sigma>. regs \<sigma> rsp = rsp\<^sub>0+16
      \<and> regs \<sigma> rbp = rbp\<^sub>0+0
      \<and> regs \<sigma> r13 = r13\<^sub>0+0
      \<and> regs \<sigma> r12 = r12\<^sub>0+0
      \<and> regs \<sigma> rbx = rbx\<^sub>0+0
      \<and> \<sigma> \<turnstile> *[rsp\<^sub>0,8] = boffset+dequeue_push_opt_ret
      \<and> \<sigma> \<turnstile> *[a,1] = v\<^sub>0,
    boffset+650 \<mapsto> \<lambda>\<sigma>. regs \<sigma> rsp = rsp\<^sub>0+16
      \<and> regs \<sigma> rbp = rbp\<^sub>0+0
      \<and> regs \<sigma> r13 = r13\<^sub>0+0
      \<and> regs \<sigma> r12 = r12\<^sub>0+0
      \<and> regs \<sigma> rbx = rbx\<^sub>0+0
      \<and> \<sigma> \<turnstile> *[rsp\<^sub>0,8] = boffset+dequeue_push_opt_ret
      \<and> \<sigma> \<turnstile> *[a,1] = v\<^sub>0,
    \<comment> \<open>postcondition\<close>
    boffset+dequeue_push_opt_ret \<mapsto> \<lambda>\<sigma>. \<sigma> \<turnstile> *[a,1] = v\<^sub>0
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

locale dequeue_push_function_calls = dequeue_push_function +
  fixes spinlock_lock memcpy spinlock_unlock :: \<open>state \<Rightarrow> state\<close>
  assumes spinlock_lock_def: \<open>exec_instr assembly semantics tasks_flag_annotation (Unary (IS_8088 Call) (Immediate (ImmLabel ''spinlock_lock''))) 5 = spinlock_lock\<close>
    and spinlock_lock_incr: \<open>regs (spinlock_lock \<sigma>) rip = regs \<sigma> rip + 5\<close>
    and spinlock_lock561: \<open>the (pp_\<Theta> (boffset+561)) \<sigma> \<Longrightarrow> the (pp_\<Theta> (boffset+566)) (spinlock_lock \<sigma>)\<close>
    and memcpy_def: \<open>exec_instr assembly semantics tasks_flag_annotation (Unary (IS_8088 Call) (Immediate (ImmLabel ''memcpy''))) 5 = memcpy\<close>
    and memcpy_incr: \<open>regs (memcpy \<sigma>) rip = regs \<sigma> rip + 5\<close>
    and memcpy603: \<open>the (pp_\<Theta> (boffset+603)) \<sigma> \<Longrightarrow> the (pp_\<Theta> (boffset+608)) (memcpy \<sigma>)\<close>
    and spinlock_unlock_def: \<open>exec_instr assembly semantics tasks_flag_annotation (Unary (IS_8088 Call) (Immediate (ImmLabel ''spinlock_unlock''))) 5 = spinlock_unlock\<close>
    and spinlock_unlock_incr: \<open>regs (spinlock_unlock \<sigma>) rip = regs \<sigma> rip + 5\<close>
    and spinlock_unlock615: \<open>the (pp_\<Theta> (boffset+615)) \<sigma> \<Longrightarrow> the (pp_\<Theta> (boffset+620)) (spinlock_unlock \<sigma>)\<close>
    and spinlock_unlock645: \<open>the (pp_\<Theta> (boffset+645)) \<sigma> \<Longrightarrow> the (pp_\<Theta> (boffset+650)) (spinlock_unlock \<sigma>)\<close>
begin

lemma rewrite_dequeue_push_opt_mem:
  \<open>is_std_invar dequeue_push_opt_ret (floyd.invar dequeue_push_opt_ret pp_\<Theta>)\<close>
  text \<open>Boilerplate code to start the VCG\<close>
  apply (rule floyd_invarI)
  apply (rewrite at \<open>floyd_vcs dequeue_push_opt_ret \<hole> _\<close> pp_\<Theta>_def)
  apply (intro floyd_vcsI)

  text \<open>Subgoal for rip = boffset+528\<close>
  subgoal premises prems for \<sigma>
    text \<open>Insert relevant knowledge\<close>
    apply (insert prems seps ret_address)
    text \<open>Apply VCG/symb.\ execution\<close>
    apply (restart_symbolic_execution?, (symbolic_execution masters: masters)+, (finish_symbolic_execution masters: masters)?)+
    done

  text \<open>Subgoal for rip = boffset+561\<close>
  subgoal premises prems for \<sigma>
    text \<open>Insert relevant knowledge\<close>
    apply (insert prems seps ret_address)
    text \<open>Discharge function call\<close>
    apply (rule wps_rls)
    apply (simp (no_asm_simp) add: lookup_table_def instr_index_def entry_size_def)
    apply (rewrite_one_let' add: assembly_def)
    apply (rewrite_one_let' add: spinlock_lock_def)
    apply (rule floyd_invarI'[of _ _ \<open>the (pp_\<Theta> (boffset+566))\<close>])
     apply (simp add: spinlock_lock_incr)
    using spinlock_lock561
    apply simp
    done

  text \<open>Subgoal for rip = boffset+566\<close>
  subgoal premises prems for \<sigma>
    text \<open>Insert relevant knowledge\<close>
    apply (insert prems seps ret_address)
    text \<open>Apply VCG/symb.\ execution\<close>
    apply (restart_symbolic_execution?, (symbolic_execution masters: masters)+, (finish_symbolic_execution masters: masters)?)+
    done

  text \<open>Subgoal for rip = boffset+603\<close>
  subgoal premises prems for \<sigma>
    text \<open>Insert relevant knowledge\<close>
    apply (insert prems seps ret_address)
    text \<open>Discharge function call\<close>
    apply (rule wps_rls)
    apply (simp (no_asm_simp) add: lookup_table_def instr_index_def entry_size_def)
    apply (rewrite_one_let' add: assembly_def)
    apply (rewrite_one_let' add: memcpy_def)
    apply (rule floyd_invarI'[of _ _ \<open>the (pp_\<Theta> (boffset+608))\<close>])
     apply (simp add: memcpy_incr)
    using memcpy603
    apply simp
    done

  text \<open>Subgoal for rip = boffset+608\<close>
  subgoal premises prems for \<sigma>
    text \<open>Insert relevant knowledge\<close>
    apply (insert prems seps ret_address)
    text \<open>Apply VCG/symb.\ execution\<close>
    apply (restart_symbolic_execution?, (symbolic_execution masters: masters)+, (finish_symbolic_execution masters: masters)?)+
    done

  text \<open>Subgoal for rip = boffset+615\<close>
  subgoal premises prems for \<sigma>
    text \<open>Insert relevant knowledge\<close>
    apply (insert prems seps ret_address)
    text \<open>Discharge function call\<close>
    apply (rule wps_rls)
    apply (simp (no_asm_simp) add: lookup_table_def instr_index_def entry_size_def)
    apply (rewrite_one_let' add: assembly_def)
    apply (rewrite_one_let' add: spinlock_unlock_def)
    apply (rule floyd_invarI'[of _ _ \<open>the (pp_\<Theta> (boffset+620))\<close>])
     apply (simp add: spinlock_unlock_incr)
    using spinlock_unlock615
    apply simp
    done

  text \<open>Subgoal for rip = boffset+620\<close>
  subgoal premises prems for \<sigma>
    text \<open>Insert relevant knowledge\<close>
    apply (insert prems seps ret_address)
    text \<open>Apply VCG/symb.\ execution\<close>
    apply (restart_symbolic_execution?, (symbolic_execution masters: masters)+, (finish_symbolic_execution masters: masters)?)+
    done

  text \<open>Subgoal for rip = boffset+622\<close>
  subgoal premises prems for \<sigma>
    text \<open>Insert relevant knowledge\<close>
    apply (insert prems seps ret_address)
    text \<open>Apply VCG/symb.\ execution\<close>
    apply (restart_symbolic_execution?, (symbolic_execution masters: masters)+, (finish_symbolic_execution masters: masters)?)+
    done

  text \<open>Subgoal for rip = boffset+645\<close>
  subgoal premises prems for \<sigma>
    text \<open>Insert relevant knowledge\<close>
    apply (insert prems seps ret_address)
    text \<open>Discharge function call\<close>
    apply (rule wps_rls)
    apply (simp (no_asm_simp) add: lookup_table_def instr_index_def entry_size_def)
    apply (rewrite_one_let' add: assembly_def)
    apply (rewrite_one_let' add: spinlock_unlock_def)
    apply (rule floyd_invarI'[of _ _ \<open>the (pp_\<Theta> (boffset+650))\<close>])
     apply (simp add: spinlock_unlock_incr)
    using spinlock_unlock645
    apply simp
    done

  text \<open>Subgoal for rip = boffset+650\<close>
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
