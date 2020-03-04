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
theory socket_send_mem
  imports syscall
begin

text \<open>Up to two locales per function in the binary.\<close>
locale socket_send_function = syscall_context +
  fixes rsp\<^sub>0 rbp\<^sub>0 a socket_send_ret :: \<open>64 word\<close>
    and v\<^sub>0 :: \<open>8 word\<close>
    and blocks :: \<open>(nat \<times> 64 word \<times> nat) set\<close>
  assumes seps: \<open>seps blocks\<close>
    and masters:
      \<open>master blocks (a, 1) 0\<close>
      \<open>master blocks (rsp\<^sub>0, 8) 1\<close>
      \<open>master blocks (rsp\<^sub>0-8, 8) 2\<close>
      \<open>master blocks (rsp\<^sub>0-12, 4) 3\<close>
      \<open>master blocks (rsp\<^sub>0-16, 4) 4\<close>
      \<open>master blocks (rsp\<^sub>0-28, 4) 5\<close>
      \<open>master blocks (rsp\<^sub>0-40, 8) 6\<close>
      \<open>master blocks (rsp\<^sub>0-48, 8) 7\<close>
    and ret_address: \<open>outside socket_send_ret 103 206\<close> \<comment> \<open>Only works for non-recursive functions.\<close>
begin

text \<open>
  The Floyd invariant expresses for some locations properties that are invariably true.
  Simply expresses that a byte in the memory remains untouched.
\<close>
definition pp_\<Theta> :: floyd_invar where
  \<open>pp_\<Theta> \<equiv> [
    \<comment> \<open>precondition\<close>
    boffset+103 \<mapsto> \<lambda>\<sigma>. regs \<sigma> rsp = rsp\<^sub>0
      \<and> regs \<sigma> rbp = rbp\<^sub>0
      \<and> \<sigma> \<turnstile> *[rsp\<^sub>0,8] = boffset+socket_send_ret
      \<and> \<sigma> \<turnstile> *[a,1] = v\<^sub>0,
    boffset+129 \<mapsto> \<lambda>\<sigma>. regs \<sigma> rsp = rsp\<^sub>0-56
      \<and> regs \<sigma> rbp = rsp\<^sub>0-8
      \<and> \<sigma> \<turnstile> *[rsp\<^sub>0-8,8] = rbp\<^sub>0
      \<and> \<sigma> \<turnstile> *[rsp\<^sub>0,8] = boffset+socket_send_ret
      \<and> \<sigma> \<turnstile> *[a,1] = v\<^sub>0,
    boffset+162 \<mapsto> \<lambda>\<sigma>. regs \<sigma> rsp = rsp\<^sub>0-56
      \<and> regs \<sigma> rbp = rsp\<^sub>0-8
      \<and> \<sigma> \<turnstile> *[rsp\<^sub>0-8,8] = rbp\<^sub>0
      \<and> \<sigma> \<turnstile> *[rsp\<^sub>0,8] = boffset+socket_send_ret
      \<and> \<sigma> \<turnstile> *[a,1] = v\<^sub>0,
    boffset+167 \<mapsto> \<lambda>\<sigma>. regs \<sigma> rsp = rsp\<^sub>0-56
      \<and> regs \<sigma> rbp = rsp\<^sub>0-8
      \<and> \<sigma> \<turnstile> *[rsp\<^sub>0-8,8] = rbp\<^sub>0
      \<and> \<sigma> \<turnstile> *[rsp\<^sub>0,8] = boffset+socket_send_ret
      \<and> \<sigma> \<turnstile> *[a,1] = v\<^sub>0,
    boffset+204 \<mapsto> \<lambda>\<sigma>. regs \<sigma> rsp = rsp\<^sub>0-56
      \<and> regs \<sigma> rbp = rsp\<^sub>0-8
      \<and> \<sigma> \<turnstile> *[rsp\<^sub>0-8,8] = rbp\<^sub>0
      \<and> \<sigma> \<turnstile> *[rsp\<^sub>0,8] = boffset+socket_send_ret
      \<and> \<sigma> \<turnstile> *[a,1] = v\<^sub>0,
    \<comment> \<open>postcondition\<close>
    boffset+socket_send_ret \<mapsto> \<lambda>\<sigma>. \<sigma> \<turnstile> *[a,1] = v\<^sub>0
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

locale socket_send_function_calls = socket_send_function +
  fixes lwip_write :: \<open>state \<Rightarrow> state\<close>
  assumes lwip_write_def: \<open>exec_instr assembly semantics tasks_flag_annotation (Unary (IS_8088 Call) (Immediate (ImmLabel ''lwip_write''))) 5 = lwip_write\<close>
    and lwip_write_incr: \<open>regs (lwip_write \<sigma>) rip = regs \<sigma> rip + 5\<close>
    and lwip_write162: \<open>the (pp_\<Theta> (boffset+162)) \<sigma> \<Longrightarrow> the (pp_\<Theta> (boffset+167)) (lwip_write \<sigma>)\<close>
begin

lemma rewrite_socket_send_mem:
  \<open>is_std_invar socket_send_ret (floyd.invar socket_send_ret pp_\<Theta>)\<close>
  text \<open>Boilerplate code to start the VCG\<close>
  apply (rule floyd_invarI)
  apply (rewrite at \<open>floyd_vcs socket_send_ret \<hole> _\<close> pp_\<Theta>_def)
  apply (intro floyd_vcsI)

  text \<open>Subgoal for rip = boffset+103\<close>
  subgoal premises prems for \<sigma>
    text \<open>Insert relevant knowledge\<close>
    apply (insert prems seps ret_address)
    text \<open>Apply VCG/symb.\ execution\<close>
    apply (restart_symbolic_execution?, (symbolic_execution masters: masters)+, (finish_symbolic_execution masters: masters)?)+
    done

  text \<open>Subgoal for rip = boffset+129\<close>
  subgoal premises prems for \<sigma>
    text \<open>Insert relevant knowledge\<close>
    apply (insert prems seps ret_address)
    text \<open>Apply VCG/symb.\ execution\<close>
    apply (restart_symbolic_execution?, (symbolic_execution masters: masters)+, (finish_symbolic_execution masters: masters)?)+
    done

  text \<open>Subgoal for rip = boffset+162\<close>
  subgoal premises prems for \<sigma>
    text \<open>Insert relevant knowledge\<close>
    apply (insert prems seps ret_address)
    text \<open>Discharge function call\<close>
    apply (rule wps_rls)
    apply (simp (no_asm_simp) add: lookup_table_def instr_index_def entry_size_def)
    apply (rewrite_one_let' add: assembly_def)
    apply (rewrite_one_let' add: lwip_write_def)
    apply (rule floyd_invarI'[of _ _ \<open>the (pp_\<Theta> (boffset+167))\<close>])
     apply (simp add: lwip_write_incr)
    using lwip_write162
    apply simp
    done

  text \<open>Subgoal for rip = boffset+167\<close>
  subgoal premises prems for \<sigma>
  proof -
    have x: \<open>regs \<sigma> rbp = rsp\<^sub>0 - 8\<close> \<comment> \<open>Not sure why this isn't done automatically here as it usually is.\<close>
      using prems
      by simp
    show ?thesis
      apply (insert prems seps ret_address)
      apply ((restart_symbolic_execution add: x)?, (symbolic_execution add: x masters: masters)+, (finish_symbolic_execution add: x masters: masters)?)+
      done
  qed

  text \<open>Subgoal for rip = boffset+204\<close>
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
