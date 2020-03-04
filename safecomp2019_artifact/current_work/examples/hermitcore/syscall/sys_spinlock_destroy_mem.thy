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
theory sys_spinlock_destroy_mem
  imports syscall
begin

text \<open>Up to two locales per function in the binary.\<close>
locale sys_spinlock_destroy_function = syscall_context +
  fixes rsp\<^sub>0 rbp\<^sub>0 a sys_spinlock_destroy_ret :: \<open>64 word\<close>
    and v\<^sub>0 :: \<open>8 word\<close>
    and blocks :: \<open>(nat \<times> 64 word \<times> nat) set\<close>
  assumes seps: \<open>seps blocks\<close>
    and masters:
      \<open>master blocks (a, 1) 0\<close>
      \<open>master blocks (rsp\<^sub>0, 8) 1\<close>
      \<open>master blocks (rsp\<^sub>0-8, 8) 2\<close>
      \<open>master blocks (rsp\<^sub>0-12, 4) 3\<close>
      \<open>master blocks (rsp\<^sub>0-32, 8) 4\<close>
    and ret_address: \<open>outside sys_spinlock_destroy_ret 2311 2384\<close> \<comment> \<open>Only works for non-recursive functions.\<close>
begin

text \<open>
  The Floyd invariant expresses for some locations properties that are invariably true.
  Simply expresses that a byte in the memory remains untouched.
\<close>
definition pp_\<Theta> :: floyd_invar where
  \<open>pp_\<Theta> \<equiv> [
    \<comment> \<open>precondition\<close>
    boffset+2311 \<mapsto> \<lambda>\<sigma>. regs \<sigma> rsp = rsp\<^sub>0
      \<and> regs \<sigma> rbp = rbp\<^sub>0
      \<and> \<sigma> \<turnstile> *[rsp\<^sub>0,8] = boffset+sys_spinlock_destroy_ret
      \<and> \<sigma> \<turnstile> *[a,1] = v\<^sub>0,
    boffset+2353 \<mapsto> \<lambda>\<sigma>. regs \<sigma> rsp = rsp\<^sub>0-40
      \<and> regs \<sigma> rbp = rsp\<^sub>0-8
      \<and> \<sigma> \<turnstile> *[rsp\<^sub>0-8,8] = rbp\<^sub>0
      \<and> \<sigma> \<turnstile> *[rsp\<^sub>0,8] = boffset+sys_spinlock_destroy_ret
      \<and> \<sigma> \<turnstile> *[a,1] = v\<^sub>0,
    boffset+2358 \<mapsto> \<lambda>\<sigma>. regs \<sigma> rsp = rsp\<^sub>0-40
      \<and> regs \<sigma> rbp = rsp\<^sub>0-8
      \<and> \<sigma> \<turnstile> *[rsp\<^sub>0-8,8] = rbp\<^sub>0
      \<and> \<sigma> \<turnstile> *[rsp\<^sub>0,8] = boffset+sys_spinlock_destroy_ret
      \<and> \<sigma> \<turnstile> *[a,1] = v\<^sub>0,
    boffset+2374 \<mapsto> \<lambda>\<sigma>. regs \<sigma> rsp = rsp\<^sub>0-40
      \<and> regs \<sigma> rbp = rsp\<^sub>0-8
      \<and> \<sigma> \<turnstile> *[rsp\<^sub>0-8,8] = rbp\<^sub>0
      \<and> \<sigma> \<turnstile> *[rsp\<^sub>0,8] = boffset+sys_spinlock_destroy_ret
      \<and> \<sigma> \<turnstile> *[a,1] = v\<^sub>0,
    boffset+2379 \<mapsto> \<lambda>\<sigma>. regs \<sigma> rsp = rsp\<^sub>0-40
      \<and> regs \<sigma> rbp = rsp\<^sub>0-8
      \<and> \<sigma> \<turnstile> *[rsp\<^sub>0-8,8] = rbp\<^sub>0
      \<and> \<sigma> \<turnstile> *[rsp\<^sub>0,8] = boffset+sys_spinlock_destroy_ret
      \<and> \<sigma> \<turnstile> *[a,1] = v\<^sub>0,
    boffset+2382 \<mapsto> \<lambda>\<sigma>. regs \<sigma> rsp = rsp\<^sub>0-40
      \<and> regs \<sigma> rbp = rsp\<^sub>0-8
      \<and> \<sigma> \<turnstile> *[rsp\<^sub>0-8,8] = rbp\<^sub>0
      \<and> \<sigma> \<turnstile> *[rsp\<^sub>0,8] = boffset+sys_spinlock_destroy_ret
      \<and> \<sigma> \<turnstile> *[a,1] = v\<^sub>0,
    \<comment> \<open>postcondition\<close>
    boffset+sys_spinlock_destroy_ret \<mapsto> \<lambda>\<sigma>. \<sigma> \<turnstile> *[a,1] = v\<^sub>0
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

locale sys_spinlock_destroy_function_calls = sys_spinlock_destroy_function +
  fixes kfree spinlock_destroy :: \<open>state \<Rightarrow> state\<close>
  assumes kfree_def: \<open>exec_instr assembly semantics tasks_flag_annotation (Unary (IS_8088 Call) (Immediate (ImmLabel ''kfree''))) 5 = kfree\<close>
    and kfree_incr: \<open>regs (kfree \<sigma>) rip = regs \<sigma> rip + 5\<close>
    and kfree2374: \<open>the (pp_\<Theta> (boffset+2374)) \<sigma> \<Longrightarrow> the (pp_\<Theta> (boffset+2379)) (kfree \<sigma>)\<close>
    and spinlock_destroy_def: \<open>exec_instr assembly semantics tasks_flag_annotation (Unary (IS_8088 Call) (Immediate (ImmLabel ''spinlock_destroy''))) 5 = spinlock_destroy\<close>
    and spinlock_destroy_incr: \<open>regs (spinlock_destroy \<sigma>) rip = regs \<sigma> rip + 5\<close>
    and spinlock_destroy2353: \<open>the (pp_\<Theta> (boffset+2353)) \<sigma> \<Longrightarrow> the (pp_\<Theta> (boffset+2358)) (spinlock_destroy \<sigma>)\<close>
begin

lemma rewrite_sys_spinlock_destroy_mem:
  \<open>is_std_invar sys_spinlock_destroy_ret (floyd.invar sys_spinlock_destroy_ret pp_\<Theta>)\<close>
  text \<open>Boilerplate code to start the VCG\<close>
  apply (rule floyd_invarI)
  apply (rewrite at \<open>floyd_vcs sys_spinlock_destroy_ret \<hole> _\<close> pp_\<Theta>_def)
  apply (intro floyd_vcsI)

  text \<open>Subgoal for rip = boffset+2311\<close>
  subgoal premises prems for \<sigma>
    text \<open>Insert relevant knowledge\<close>
    apply (insert prems seps ret_address)
    text \<open>Apply VCG/symb.\ execution\<close>
    apply (restart_symbolic_execution?, (symbolic_execution masters: masters)+, (finish_symbolic_execution masters: masters)?)+
    done

  text \<open>Subgoal for rip = boffset+2353\<close>
  subgoal premises prems for \<sigma>
    text \<open>Insert relevant knowledge\<close>
    apply (insert prems seps ret_address)
    text \<open>Discharge function call\<close>
    apply (rule wps_rls)
    apply (simp (no_asm_simp) add: lookup_table_def instr_index_def entry_size_def)
    apply (rewrite_one_let' add: assembly_def)
    apply (rewrite_one_let' add: spinlock_destroy_def)
    apply (rule floyd_invarI'[of _ _ \<open>the (pp_\<Theta> (boffset+2358))\<close>])
     apply (simp add: spinlock_destroy_incr)
    using spinlock_destroy2353
    apply simp
    done

  text \<open>Subgoal for rip = boffset+2358\<close>
  subgoal premises prems for \<sigma>
  proof -
    have x: \<open>regs \<sigma> rbp = rsp\<^sub>0 - 8\<close> \<comment> \<open>Not fully automatic here.\<close>
      using prems
      by auto
    show ?thesis
      apply (insert prems seps ret_address)
      apply ((restart_symbolic_execution add: x)?, (symbolic_execution add: x masters: masters)+, (finish_symbolic_execution add: x masters: masters)?)+
      done
  qed

  text \<open>Subgoal for rip = boffset+2374\<close>
  subgoal premises prems for \<sigma>
    text \<open>Insert relevant knowledge\<close>
    apply (insert prems seps ret_address)
    text \<open>Discharge function call\<close>
    apply (rule wps_rls)
    apply (simp (no_asm_simp) add: lookup_table_def instr_index_def entry_size_def)
    apply (rewrite_one_let' add: assembly_def)
    apply (rewrite_one_let' add: kfree_def)
    apply (rule floyd_invarI'[of _ _ \<open>the (pp_\<Theta> (boffset+2379))\<close>])
     apply (simp add: kfree_incr)
    using kfree2374
    apply simp
    done

  text \<open>Subgoal for rip = boffset+2379\<close>
  subgoal premises prems for \<sigma>
    text \<open>Insert relevant knowledge\<close>
    apply (insert prems seps ret_address)
    text \<open>Apply VCG/symb.\ execution\<close>
    apply (restart_symbolic_execution?, (symbolic_execution masters: masters)+, (finish_symbolic_execution masters: masters)?)+
    done

  text \<open>Subgoal for rip = boffset+2382\<close>
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
