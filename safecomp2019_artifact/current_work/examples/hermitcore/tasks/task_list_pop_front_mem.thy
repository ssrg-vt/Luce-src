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
theory task_list_pop_front_mem
  imports tasks
begin

text \<open>Up to two locales per function in the binary.\<close>
locale task_list_pop_front_function = tasks_context +
  fixes rsp\<^sub>0 rbp\<^sub>0 a task_list_pop_front_ret :: \<open>64 word\<close>
    and v\<^sub>0 :: \<open>8 word\<close>
    and blocks :: \<open>(nat \<times> 64 word \<times> nat) set\<close>
  assumes seps: \<open>seps blocks\<close>
    and masters:
      \<open>master blocks (a, 1) 0\<close>
      \<open>master blocks (rsp\<^sub>0, 8) 1\<close>
      \<open>master blocks (rsp\<^sub>0-8, 8) 2\<close>
      \<open>master blocks (rsp\<^sub>0-16, 8) 3\<close>
      \<open>master blocks (rsp\<^sub>0-32, 8) 4\<close>
    and ret_address: \<open>outside task_list_pop_front_ret 317 464\<close> \<comment> \<open>Only works for non-recursive functions.\<close>
begin

text \<open>
  The Floyd invariant expresses for some locations properties that are invariably true.
  Simply expresses that a byte in the memory remains untouched.
\<close>
definition pp_\<Theta> :: \<open>_ \<Rightarrow> _ \<Rightarrow> _ \<Rightarrow> floyd_invar\<close> where
  \<open>pp_\<Theta> list first next \<equiv> [
    \<comment> \<open>precondition\<close>
    boffset+317 \<mapsto> \<lambda>\<sigma>. regs \<sigma> rsp = rsp\<^sub>0
      \<and> regs \<sigma> rbp = rbp\<^sub>0
      \<and> regs \<sigma> rdi = list
      \<and> \<sigma> \<turnstile> *[list,8] = first
      \<and> \<sigma> \<turnstile> *[first + 0x58,8] = next
      \<and> \<sigma> \<turnstile> *[rsp\<^sub>0,8] = boffset+task_list_pop_front_ret
      \<and> \<sigma> \<turnstile> *[a,1] = v\<^sub>0,
    boffset+430 \<mapsto> \<lambda>\<sigma>. regs \<sigma> rsp = rsp\<^sub>0-8
      \<and> regs \<sigma> rbp = rsp\<^sub>0-8
      \<and> (first \<noteq> 0 \<longrightarrow> \<sigma> \<turnstile> *[list,8] = next)
      \<and> \<sigma> \<turnstile> *[rsp\<^sub>0-32,8] = list
      \<and> \<sigma> \<turnstile> *[rsp\<^sub>0-16,8] = first
      \<and> \<sigma> \<turnstile> *[rsp\<^sub>0-8,8] = rbp\<^sub>0
      \<and> \<sigma> \<turnstile> *[rsp\<^sub>0,8] = boffset+task_list_pop_front_ret
      \<and> \<sigma> \<turnstile> *[a,1] = v\<^sub>0,
    boffset+462 \<mapsto> \<lambda>\<sigma>. regs \<sigma> rsp = rsp\<^sub>0-8
      \<and> regs \<sigma> rbp = rsp\<^sub>0-8
      \<and> \<sigma> \<turnstile> *[rsp\<^sub>0-8,8] = rbp\<^sub>0
      \<and> \<sigma> \<turnstile> *[rsp\<^sub>0,8] = boffset+task_list_pop_front_ret
      \<and> \<sigma> \<turnstile> *[a,1] = v\<^sub>0,
    \<comment> \<open>postcondition\<close>
    boffset+task_list_pop_front_ret \<mapsto> \<lambda>\<sigma>. \<sigma> \<turnstile> *[a,1] = v\<^sub>0
      \<and> regs \<sigma> rsp = rsp\<^sub>0+8
      \<and> regs \<sigma> rbp = rbp\<^sub>0
  ]\<close>

text \<open>Adding some rules to the simplifier to simplify proofs.\<close>
schematic_goal pp_\<Theta>_zero[simp]:
  \<open>pp_\<Theta> list first next boffset = ?x\<close>
  unfolding pp_\<Theta>_def
  by simp
schematic_goal pp_\<Theta>_numeral_l[simp]:
  \<open>pp_\<Theta> list first next (n + boffset) = ?x\<close>
  unfolding pp_\<Theta>_def
  by simp
schematic_goal pp_\<Theta>_numeral_r[simp]:
  \<open>pp_\<Theta> list first next (boffset + n) = ?x\<close>
  unfolding pp_\<Theta>_def
  by simp

lemma rewrite_task_list_pop_front_mem:
  assumes
    \<open>master blocks (list, 8) 5\<close>
    \<open>master blocks (list+8, 8) 6\<close>
    \<open>master blocks (first+0x58, 8) 7\<close>
    \<open>master blocks (first+0x60, 8) 8\<close>
    \<open>master blocks (next+0x60, 8) 9\<close>
  shows \<open>is_std_invar task_list_pop_front_ret (floyd.invar task_list_pop_front_ret (pp_\<Theta> list first next))\<close>
proof -
  note masters = masters assms

  show ?thesis
    text \<open>Boilerplate code to start the VCG\<close>
    apply (rule floyd_invarI)
    apply (rewrite at \<open>floyd_vcs task_list_pop_front_ret \<hole> _\<close> pp_\<Theta>_def)
    apply (intro floyd_vcsI)

    text \<open>Subgoal for rip = boffset+317\<close>
    subgoal premises prems for \<sigma>
      text \<open>Insert relevant knowledge\<close>
      apply (insert prems seps ret_address)
      text \<open>Apply VCG/symb.\ execution\<close>
      apply (restart_symbolic_execution?, (symbolic_execution masters: masters)+, (finish_symbolic_execution masters: masters)?)+
      done

    text \<open>Subgoal for rip = boffset+430\<close>
    subgoal premises prems for \<sigma>
      text \<open>Insert relevant knowledge\<close>
      apply (insert prems seps ret_address)
      text \<open>Apply VCG/symb.\ execution\<close>
      apply (restart_symbolic_execution?, (symbolic_execution masters: masters)+, (finish_symbolic_execution masters: masters)?)+
      done

    text \<open>Subgoal for rip = boffset+462\<close>
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
