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
theory sys_getprio_mem
  imports syscall
begin

text \<open>One locale per function in the binary.\<close>
locale sys_getprio_function = syscall_context +
  fixes rsp\<^sub>0 rbp\<^sub>0 current_task id' a sys_getprio_ret :: \<open>64 word\<close>
    and v\<^sub>0 :: \<open>8 word\<close>
    and blocks :: \<open>(nat \<times> 64 word \<times> nat) set\<close>
  assumes seps: \<open>seps blocks\<close>
    and masters:
      \<open>master blocks (a, 1) 0\<close>
      \<open>master blocks (rsp\<^sub>0, 8) 1\<close>
      \<open>master blocks (rsp\<^sub>0-8, 8) 2\<close>
      \<open>master blocks (rsp\<^sub>0-16, 8) 3\<close>
      \<open>master blocks (rsp\<^sub>0-32, 8) 4\<close>
      \<open>master blocks (current_task, 8) 5\<close>
      \<open>master blocks (id', 4) 6\<close>
    and ret_address: \<open>outside sys_getprio_ret 23 85\<close> \<comment> \<open>Only works for non-recursive functions.\<close>
    and task: \<open>the (label_to_address assembly ''current_task'') = current_task\<close>
begin

text \<open>
  The Floyd invariant expresses for some locations properties that are invariably true.
  Simply expresses that a byte in the memory remains untouched.
\<close>
definition pp_\<Theta> :: \<open>_ \<Rightarrow> floyd_invar\<close> where
  \<open>pp_\<Theta> tid \<equiv> [
    \<comment> \<open>precondition\<close>
    boffset+23 \<mapsto> \<lambda>\<sigma>. regs \<sigma> rsp = rsp\<^sub>0
      \<and> regs \<sigma> rbp = rbp\<^sub>0
      \<and> regs \<sigma> rdi = tid
      \<and> \<sigma> \<turnstile> *[current_task,8] = id'
      \<and> \<sigma> \<turnstile> *[rsp\<^sub>0,8] = boffset+sys_getprio_ret
      \<and> \<sigma> \<turnstile> *[a,1] = v\<^sub>0,
    boffset+65 \<mapsto> \<lambda>\<sigma>. regs \<sigma> rsp = rsp\<^sub>0-8
      \<and> regs \<sigma> rbp = rsp\<^sub>0-8
      \<and> \<sigma> \<turnstile> *[rsp\<^sub>0-8,8] = rbp\<^sub>0
      \<and> \<sigma> \<turnstile> *[rsp\<^sub>0-32,8] = tid
      \<and> \<sigma> \<turnstile> *[rsp\<^sub>0,8] = boffset+sys_getprio_ret
      \<and> \<sigma> \<turnstile> *[a,1] = v\<^sub>0,
    boffset+83 \<mapsto> \<lambda>\<sigma>. regs \<sigma> rsp = rsp\<^sub>0-8
      \<and> regs \<sigma> rbp = rsp\<^sub>0-8
      \<and> \<sigma> \<turnstile> *[rsp\<^sub>0-8,8] = rbp\<^sub>0
      \<and> \<sigma> \<turnstile> *[rsp\<^sub>0-32,8] = tid
      \<and> \<sigma> \<turnstile> *[rsp\<^sub>0,8] = boffset+sys_getprio_ret
      \<and> \<sigma> \<turnstile> *[a,1] = v\<^sub>0,
    \<comment> \<open>postcondition\<close>
    boffset+sys_getprio_ret \<mapsto> \<lambda>\<sigma>. \<sigma> \<turnstile> *[a,1] = v\<^sub>0
      \<and> regs \<sigma> rsp = rsp\<^sub>0+8
      \<and> regs \<sigma> rbp = rbp\<^sub>0
  ]\<close>

text \<open>Adding some rules to the simplifier to simplify proofs.\<close>
schematic_goal pp_\<Theta>_zero[simp]:
  shows \<open>pp_\<Theta> tid boffset = ?x\<close>
  unfolding pp_\<Theta>_def
  by simp
schematic_goal pp_\<Theta>_numeral_l[simp]:
  shows \<open>pp_\<Theta> tid (n + boffset) = ?x\<close>
  unfolding pp_\<Theta>_def
  by simp
schematic_goal pp_\<Theta>_numeral_r[simp]:
  shows \<open>pp_\<Theta> tid (boffset + n) = ?x\<close>
  unfolding pp_\<Theta>_def
  by simp

lemma rewrite_sys_getprio_mem:
  assumes \<open>master blocks (tid, 4) 7\<close>
  shows \<open>is_std_invar sys_getprio_ret (floyd.invar sys_getprio_ret (pp_\<Theta> tid))\<close>
proof -
  note masters = masters assms

  show ?thesis
    text \<open>Boilerplate code to start the VCG\<close>
    apply (rule floyd_invarI)
    apply (rewrite at \<open>floyd_vcs sys_getprio_ret \<hole> _\<close> pp_\<Theta>_def)
    apply (intro floyd_vcsI)
  
    text \<open>Subgoal for rip = boffset+23\<close>
    subgoal premises prems for \<sigma>
      text \<open>Insert relevant knowledge\<close>
      apply (insert prems seps ret_address task)
      text \<open>Apply VCG/symb.\ execution\<close>
      apply (restart_symbolic_execution?, (symbolic_execution masters: masters)+, (finish_symbolic_execution masters: masters)?)+
      apply restart_symbolic_execution
      apply (finish_symbolic_execution masters: masters)
      done
  
    text \<open>Subgoal for rip = boffset+65\<close>
    subgoal premises prems for \<sigma>
      text \<open>Insert relevant knowledge\<close>
      apply (insert prems seps ret_address task)
      text \<open>Apply VCG/symb.\ execution\<close>
      apply (restart_symbolic_execution?, (symbolic_execution masters: masters)+, (finish_symbolic_execution masters: masters)?)+
      done
  
    text \<open>Subgoal for rip = boffset+83\<close>
    subgoal premises prems for \<sigma>
      text \<open>Insert relevant knowledge\<close>
      apply (insert prems seps ret_address task)
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
