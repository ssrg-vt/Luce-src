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
theory readyqueues_push_back_mem
  imports tasks
begin

text \<open>Up to two locales per function in the binary.\<close>
locale readyqueues_push_back_function = tasks_context +
  fixes rsp\<^sub>0 rbp\<^sub>0 task a readyqueues_push_back_ret :: \<open>64 word\<close>
    and core_id :: \<open>32 word\<close>
    and v\<^sub>0 :: \<open>8 word\<close>
    and blocks :: \<open>(nat \<times> 64 word \<times> nat) set\<close>
  assumes seps: \<open>seps blocks\<close>
    and masters\<^sub>2:
      \<open>master blocks (a, 1) 0\<close>
      \<open>master blocks (rsp\<^sub>0, 8) 1\<close>
      \<open>master blocks (rsp\<^sub>0-8, 8) 2\<close>
      \<open>master blocks (rsp\<^sub>0-16, 8) 3\<close>
      \<open>master blocks (rsp\<^sub>0-28, 4) 4\<close>
      \<open>master blocks (rsp\<^sub>0-40, 8) 5\<close>
      \<open>master blocks (task + 41, 1) 6\<close> \<comment> \<open>\texttt{task->prio}\<close>
      \<open>master blocks (the (label_to_address assembly ''readyqueues'') + 24 + (ucast core_id + (ucast core_id << 3) << 6), 4) 7\<close>
    and ret_address: \<open>outside readyqueues_push_back_ret 464 649\<close> \<comment> \<open>Only works for non-recursive functions.\<close>
begin

text \<open>Need the exact format used in the below proofs, so doing this icky explicit simplification\<close>
lemma boffset_add_commute[simp]: \<open>x + boffset + y = boffset + (y + x)\<close>
  by simp
lemmas masters = masters\<^sub>2[simplified]
declare boffset_add_commute[simp del]

text \<open>
  The Floyd invariant expresses for some locations properties that are invariably true.
  Simply expresses that a byte in the memory remains untouched.
\<close>
definition pp_\<Theta> :: floyd_invar where
  \<open>pp_\<Theta> \<equiv> [
    \<comment> \<open>precondition\<close>
    boffset+464 \<mapsto> \<lambda>\<sigma>. regs \<sigma> rsp = rsp\<^sub>0
      \<and> regs \<sigma> rbp = rbp\<^sub>0
      \<and> \<langle>31,0\<rangle>regs \<sigma> rdi = core_id
      \<and> regs \<sigma> rsi = task
      \<and> \<sigma> \<turnstile> *[rsp\<^sub>0,8] = boffset+readyqueues_push_back_ret
      \<and> \<sigma> \<turnstile> *[a,1] = v\<^sub>0,
    boffset+555 \<mapsto> \<lambda>\<sigma>. regs \<sigma> rsp = rsp\<^sub>0-40
      \<and> regs \<sigma> rbp = rsp\<^sub>0-8
      \<and> \<sigma> \<turnstile> *[rsp\<^sub>0-8,8] = rbp\<^sub>0
      \<and> \<sigma> \<turnstile> *[rsp\<^sub>0-28,4] = core_id
      \<and> \<sigma> \<turnstile> *[rsp\<^sub>0-40,8] = task
      \<and> \<sigma> \<turnstile> *[rsp\<^sub>0,8] = boffset+readyqueues_push_back_ret
      \<and> \<sigma> \<turnstile> *[a,1] = v\<^sub>0,
    boffset+560 \<mapsto> \<lambda>\<sigma>. regs \<sigma> rsp = rsp\<^sub>0-40
      \<and> regs \<sigma> rbp = rsp\<^sub>0-8
      \<and> \<sigma> \<turnstile> *[rsp\<^sub>0-8,8] = rbp\<^sub>0
      \<and> \<sigma> \<turnstile> *[rsp\<^sub>0-28,4] = core_id
      \<and> \<sigma> \<turnstile> *[rsp\<^sub>0-40,8] = task
      \<and> \<sigma> \<turnstile> *[rsp\<^sub>0,8] = boffset+readyqueues_push_back_ret
      \<and> \<sigma> \<turnstile> *[a,1] = v\<^sub>0,
    \<comment> \<open>postcondition\<close>
    boffset+readyqueues_push_back_ret \<mapsto> \<lambda>\<sigma>. \<sigma> \<turnstile> *[a,1] = v\<^sub>0
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

locale readyqueues_push_back_function_calls = readyqueues_push_back_function +
  fixes task_list_push_back :: \<open>state \<Rightarrow> state\<close>
  assumes task_list_push_back_def: \<open>exec_instr assembly semantics tasks_flag_annotation (Unary (IS_8088 Call) (Immediate (ImmLabel ''task_list_push_back''))) 5 = task_list_push_back\<close>
    and task_list_push_back_incr: \<open>regs (task_list_push_back \<sigma>) rip = regs \<sigma> rip + 5\<close>
    and task_list_push_back555: \<open>the (pp_\<Theta> (boffset+555)) \<sigma> \<Longrightarrow> the (pp_\<Theta> (boffset+560)) (task_list_push_back \<sigma>)\<close>
begin

lemma rewrite_readyqueues_push_back_mem:
  \<open>is_std_invar readyqueues_push_back_ret (floyd.invar readyqueues_push_back_ret pp_\<Theta>)\<close>
  text \<open>Boilerplate code to start the VCG\<close>
  apply (rule floyd_invarI)
  apply (rewrite at \<open>floyd_vcs readyqueues_push_back_ret \<hole> _\<close> pp_\<Theta>_def)
  apply (intro floyd_vcsI)

  text \<open>Subgoal for rip = boffset+464\<close>
  subgoal premises prems for \<sigma>
    text \<open>Insert relevant knowledge\<close>
    apply (insert prems seps ret_address)
    text \<open>Apply VCG/symb.\ execution\<close>
    apply (restart_symbolic_execution?, (symbolic_execution masters: masters)+, (finish_symbolic_execution masters: masters)?)+
    done

  text \<open>Subgoal for rip = boffset+555\<close>
  subgoal premises prems for \<sigma>
    text \<open>Insert relevant knowledge\<close>
    apply (insert prems seps ret_address)
    text \<open>Discharge function call\<close>
    apply (rule wps_rls)
    apply (simp (no_asm_simp) add: lookup_table_def instr_index_def entry_size_def)
    apply (rewrite_one_let' add: assembly_def)
    apply (rewrite_one_let' add: task_list_push_back_def)
    apply (rule floyd_invarI'[of _ _ \<open>the (pp_\<Theta> (boffset+560))\<close>])
     apply (simp add: task_list_push_back_incr)
    using task_list_push_back555
    apply simp
    done

  text \<open>Subgoal for rip = boffset+560\<close>
  subgoal premises prems for \<sigma>
    text \<open>Insert relevant knowledge\<close>
    apply (insert prems seps ret_address)
    text \<open>Apply VCG/symb.\ execution\<close>
    apply (symbolic_execution masters: masters)+
    apply (finish_symbolic_execution masters: masters)
    done

  text \<open>Trivial ending subgoal.\<close>
  subgoal
    by simp
  done

end

end
