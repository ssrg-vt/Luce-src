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
theory is_task_available_mem
  imports tasks
begin

text \<open>One locale per function in the binary.\<close>
locale is_task_available_function = tasks_context +
  fixes rsp\<^sub>0 rbp\<^sub>0 a is_task_available_ret :: \<open>64 word\<close>
    and v\<^sub>0 :: \<open>8 word\<close>
    and blocks :: \<open>(nat \<times> 64 word \<times> nat) set\<close>
  assumes seps: \<open>seps blocks\<close>
    and masters:
      \<open>master blocks (a, 1) 0\<close>
      \<open>master blocks (rsp\<^sub>0, 8) 1\<close>
      \<open>master blocks (rsp\<^sub>0-8, 8) 2\<close>
      \<open>master blocks (rsp\<^sub>0-12, 4) 3\<close>
      \<open>master blocks (the (label_to_address assembly ''readyqueues'') + 20, 4) 4\<close>
    and ret_address: \<open>outside is_task_available_ret 1121 1172\<close> \<comment> \<open>Only works for non-recursive functions.\<close>
begin

text \<open>
  The Floyd invariant expresses for some locations properties that are invariably true.
  Simply expresses that a byte in the memory remains untouched.
\<close>
definition pp_\<Theta> :: floyd_invar where
  \<open>pp_\<Theta> \<equiv> [
    \<comment> \<open>precondition\<close>
    boffset+1121 \<mapsto> \<lambda>\<sigma>. regs \<sigma> rsp = rsp\<^sub>0
      \<and> regs \<sigma> rbp = rbp\<^sub>0
      \<and> \<sigma> \<turnstile> *[rsp\<^sub>0,8] = boffset+is_task_available_ret
      \<and> \<sigma> \<turnstile> *[a,1] = v\<^sub>0,
    \<comment> \<open>postcondition\<close>
    boffset+is_task_available_ret \<mapsto> \<lambda>\<sigma>. \<sigma> \<turnstile> *[a,1] = v\<^sub>0
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

text \<open>Want boffset as the first operand in master blocks as that's how the accesses are generated.\<close>
lemma boffset_first[simp]: \<open>x + boffset = boffset + x\<close>
  by (rule Groups.ab_semigroup_add_class.add.commute)
lemmas masters\<^sub>2 = masters[simplified]
declare boffset_first[simp del] \<comment> \<open>Don't want it working on everything, takes too long.\<close>

lemma rewrite_is_task_available_mem:
  \<open>is_std_invar is_task_available_ret (floyd.invar is_task_available_ret pp_\<Theta>)\<close>
proof -
  note masters = masters\<^sub>2

  show ?thesis
    text \<open>Boilerplate code to start the VCG\<close>
    apply (rule floyd_invarI)
    apply (rewrite at \<open>floyd_vcs is_task_available_ret \<hole> _\<close> pp_\<Theta>_def)
    apply (intro floyd_vcsI)
  
    text \<open>Subgoal for rip = boffset+1121\<close>
    subgoal premises prems for \<sigma>
      text \<open>Insert relevant knowledge\<close>
      apply (insert prems seps ret_address)
      text \<open>Apply VCG/symb.\ execution\<close>
      apply (symbolic_execution masters: masters)+
       apply (finish_symbolic_execution masters: masters)
      apply restart_symbolic_execution
      apply (symbolic_execution masters: masters)+
      apply (finish_symbolic_execution masters: masters)
      done
  
    text \<open>Trivial ending subgoal.\<close>
    subgoal
      by simp
    done
qed

end

end
