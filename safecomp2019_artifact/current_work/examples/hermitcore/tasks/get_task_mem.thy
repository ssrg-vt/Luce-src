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
theory get_task_mem
  imports tasks
begin

text \<open>One locale per function in the binary.\<close>
locale get_task_function = tasks_context +
  fixes rsp\<^sub>0 rbp\<^sub>0 a get_task_ret :: \<open>64 word\<close>
    and id' :: \<open>32 word\<close>
    and v\<^sub>0 :: \<open>8 word\<close>
    and blocks :: \<open>(nat \<times> 64 word \<times> nat) set\<close>
  assumes seps: \<open>seps blocks\<close>
    and masters:
      \<open>master blocks (a, 1) 0\<close>
      \<open>master blocks (rsp\<^sub>0-24, 8) 1\<close>
      \<open>master blocks (rsp\<^sub>0-12, 4) 2\<close>
      \<open>master blocks (rsp\<^sub>0-8, 8) 3\<close>
      \<open>master blocks (rsp\<^sub>0, 8) 4\<close>
      \<open>master blocks (the (label_to_address assembly ''task_table'') + 4 + (ucast id' + (ucast id' << 2) << 8), 4) 5\<close>
    and ret_address: \<open>outside get_task_ret 848 995\<close> \<comment> \<open>Only works for non-recursive functions.\<close>
begin

text \<open>
  The Floyd invariant expresses for some locations properties that are invariably true.
  Simply expresses that a byte in the memory remains untouched.
\<close>
definition pp_\<Theta> :: \<open>_ \<Rightarrow> floyd_invar\<close> where
  \<open>pp_\<Theta> task \<equiv> [
    \<comment> \<open>precondition\<close>
    boffset+848 \<mapsto> \<lambda>\<sigma>. regs \<sigma> rsp = rsp\<^sub>0
      \<and> regs \<sigma> rbp = rbp\<^sub>0
      \<and> \<langle>31,0\<rangle>regs \<sigma> rdi = id'
      \<and> regs \<sigma> rsi = task
      \<and> \<sigma> \<turnstile> *[rsp\<^sub>0,8] = boffset+get_task_ret
      \<and> \<sigma> \<turnstile> *[a,1] = v\<^sub>0,
    boffset+993 \<mapsto> \<lambda>\<sigma>. regs \<sigma> rsp = rsp\<^sub>0-8
      \<and> regs \<sigma> rbp = rsp\<^sub>0-8
      \<and> \<sigma> \<turnstile> *[rsp\<^sub>0-8,8] = rbp\<^sub>0
      \<and> \<sigma> \<turnstile> *[rsp\<^sub>0-12,4] = id'
      \<and> \<sigma> \<turnstile> *[rsp\<^sub>0-24,8] = task
      \<and> \<sigma> \<turnstile> *[rsp\<^sub>0,8] = boffset+get_task_ret
      \<and> \<sigma> \<turnstile> *[a,1] = v\<^sub>0,
    \<comment> \<open>postcondition\<close>
    boffset+get_task_ret \<mapsto> \<lambda>\<sigma>. \<sigma> \<turnstile> *[a,1] = v\<^sub>0
      \<and> regs \<sigma> rsp = rsp\<^sub>0+8
      \<and> regs \<sigma> rbp = rbp\<^sub>0
  ]\<close>

text \<open>Adding some rules to the simplifier to simplify proofs.\<close>
schematic_goal pp_\<Theta>_zero[simp]:
  shows \<open>pp_\<Theta> task boffset = ?x\<close>
  unfolding pp_\<Theta>_def
  by simp
schematic_goal pp_\<Theta>_numeral_l[simp]:
  shows \<open>pp_\<Theta> task (n + boffset) = ?x\<close>
  unfolding pp_\<Theta>_def
  by simp
schematic_goal pp_\<Theta>_numeral_r[simp]:
  shows \<open>pp_\<Theta> task (boffset + n) = ?x\<close>
  unfolding pp_\<Theta>_def
  by simp

text \<open>Need the exact format used in the below proofs, so doing this icky explicit simplification\<close>
lemma boffset_wrap[simp]: \<open>boffset + x + y = boffset + (x + y)\<close>
  by (rule Groups.add_ac(1))
lemmas masters\<^sub>2 = masters[simplified]
declare boffset_wrap[simp del]

lemma rewrite_get_task_mem:
  assumes
    \<open>master blocks (task, 8) 6\<close>
    \<open>master blocks (task + 8, 8) 7\<close>
  shows \<open>is_std_invar get_task_ret (floyd.invar get_task_ret (pp_\<Theta> task))\<close>
proof -
  note masters = masters\<^sub>2 assms

  show ?thesis
    text \<open>Boilerplate code to start the VCG\<close>
    apply (rule floyd_invarI)
    apply (rewrite at \<open>floyd_vcs get_task_ret \<hole> _\<close> pp_\<Theta>_def)
    apply (intro floyd_vcsI)
  
    text \<open>Subgoal for rip = boffset+848\<close>
    subgoal premises prems for \<sigma>
      text \<open>Insert relevant knowledge\<close>
      apply (insert prems seps ret_address)
      text \<open>Apply VCG/symb.\ execution\<close>
      apply (restart_symbolic_execution?, (symbolic_execution masters: masters)+, (finish_symbolic_execution masters: masters)?)+
      done

    text \<open>Subgoal for rip = boffset+993\<close>
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
