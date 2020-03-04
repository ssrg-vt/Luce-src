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
theory strncmp_mem
  imports string
begin

text \<open>Up to two locales per function in the binary.\<close>
locale strncmp_function = string_context +
  fixes rsp\<^sub>0 rbp\<^sub>0 s1 s2 a strncmp_ret :: \<open>64 word\<close>
    and v\<^sub>0 :: \<open>8 word\<close>
    and blocks :: \<open>(nat \<times> 64 word \<times> nat) set\<close>
  assumes seps: \<open>seps blocks\<close>
    and masters:
      \<open>master blocks (a, 1) 0\<close>
      \<open>master blocks (rsp\<^sub>0, 8) 1\<close>
      \<open>master blocks (rsp\<^sub>0-8, 8) 2\<close>
      \<open>master blocks (rsp\<^sub>0-16, 8) 3\<close>
      \<open>master blocks (rsp\<^sub>0-24, 8) 4\<close>
      \<open>master blocks (rsp\<^sub>0-32, 8) 5\<close>
    and s_masters:
      \<open>\<forall>i\<le>n. master blocks (n + s1 - i, 1) 6\<close>
      \<open>\<forall>i\<le>n. master blocks (n + s2 - i, 1) 7\<close>
    and ret_address: \<open>outside strncmp_ret 785 913\<close> \<comment> \<open>Only works for non-recursive functions.\<close>
begin

text \<open>
  The Floyd invariant expresses for some locations properties that are invariably true.
  Simply expresses that a byte in the memory remains untouched.
\<close>
definition pp_\<Theta> :: \<open>_ \<Rightarrow> floyd_invar\<close> where
  \<open>pp_\<Theta> n \<equiv> [
    \<comment> \<open>precondition\<close>
    boffset+785 \<mapsto> \<lambda>\<sigma>. regs \<sigma> rsp = rsp\<^sub>0
      \<and> regs \<sigma> rbp = rbp\<^sub>0
      \<and> regs \<sigma> rdi = s1
      \<and> regs \<sigma> rsi = s2
      \<and> regs \<sigma> rdx = n
      \<and> \<sigma> \<turnstile> *[rsp\<^sub>0,8] = boffset+strncmp_ret
      \<and> \<sigma> \<turnstile> *[a,1] = v\<^sub>0,
    boffset+852 \<mapsto> \<lambda>\<sigma>. regs \<sigma> rsp = rsp\<^sub>0-8
      \<and> regs \<sigma> rbp = rsp\<^sub>0-8
      \<and> \<sigma> \<turnstile> *[rsp\<^sub>0-32,8] \<le> n
      \<and> \<sigma> \<turnstile> *[rsp\<^sub>0-24,8] = s2 + n - (\<sigma> \<turnstile> *[rsp\<^sub>0-32,8])
      \<and> \<sigma> \<turnstile> *[rsp\<^sub>0-16,8] = s1 + n - (\<sigma> \<turnstile> *[rsp\<^sub>0-32,8])
      \<and> \<sigma> \<turnstile> *[rsp\<^sub>0-8,8] = rbp\<^sub>0
      \<and> \<sigma> \<turnstile> *[rsp\<^sub>0,8] = boffset+strncmp_ret
      \<and> \<sigma> \<turnstile> *[a,1] = v\<^sub>0,
    boffset+887 \<mapsto> \<lambda>\<sigma>. regs \<sigma> rsp = rsp\<^sub>0-8
      \<and> regs \<sigma> rbp = rsp\<^sub>0-8
      \<and> \<sigma> \<turnstile> *[rsp\<^sub>0-8,8] = rbp\<^sub>0
      \<and> \<sigma> \<turnstile> *[rsp\<^sub>0,8] = boffset+strncmp_ret
      \<and> \<sigma> \<turnstile> *[a,1] = v\<^sub>0,
    boffset+911 \<mapsto> \<lambda>\<sigma>. regs \<sigma> rsp = rsp\<^sub>0-8
      \<and> regs \<sigma> rbp = rsp\<^sub>0-8
      \<and> \<sigma> \<turnstile> *[rsp\<^sub>0-8,8] = rbp\<^sub>0
      \<and> \<sigma> \<turnstile> *[rsp\<^sub>0,8] = boffset+strncmp_ret
      \<and> \<sigma> \<turnstile> *[a,1] = v\<^sub>0,
    \<comment> \<open>postcondition\<close>
    boffset+strncmp_ret \<mapsto> \<lambda>\<sigma>. \<sigma> \<turnstile> *[a,1] = v\<^sub>0
      \<and> regs \<sigma> rsp = rsp\<^sub>0+8
      \<and> regs \<sigma> rbp = rbp\<^sub>0
  ]\<close>

text \<open>Adding some rules to the simplifier to simplify proofs.\<close>
schematic_goal pp_\<Theta>_zero[simp]:
  \<open>pp_\<Theta> n boffset = ?x\<close>
  unfolding pp_\<Theta>_def
  by simp
schematic_goal pp_\<Theta>_numeral_l[simp]:
  \<open>pp_\<Theta> n (nn + boffset) = ?x\<close>
  unfolding pp_\<Theta>_def
  by simp
schematic_goal pp_\<Theta>_numeral_r[simp]:
  \<open>pp_\<Theta> n (boffset + nn) = ?x\<close>
  unfolding pp_\<Theta>_def
  by simp

lemma word_minus_ge_no_wrap: (* TODO: to be merged somewhere *)
  fixes c b :: \<open>'a::len word\<close>
  assumes \<open>c \<le> b\<close>
      and \<open>0 < c\<close>
  shows \<open>c - 1 \<le> b\<close>
  using assms
  by unat_arith

lemma rewrite_strncmp_mem:
  \<open>is_std_invar strncmp_ret (floyd.invar strncmp_ret (pp_\<Theta> n))\<close>
  text \<open>Boilerplate code to start the VCG\<close>
  apply (rule floyd_invarI)
  apply (rewrite at \<open>floyd_vcs strncmp_ret \<hole> _\<close> pp_\<Theta>_def)
  apply (intro floyd_vcsI)

  text \<open>Subgoal for rip = boffset+785\<close>
  subgoal premises prems for \<sigma>
    text \<open>Insert relevant knowledge\<close>
    apply (insert prems seps ret_address)
    text \<open>Apply VCG/symb.\ execution\<close>
    apply (restart_symbolic_execution?, (symbolic_execution masters: masters)+, (finish_symbolic_execution masters: masters)?)+
    done

  text \<open>Subgoal for rip = boffset+852\<close>
  subgoal premises prems for \<sigma>
  proof -
    have x: \<open>regs \<sigma> rbp = rsp\<^sub>0 - 8\<close>
      using prems
      by simp
    show ?thesis
      text \<open>Insert relevant knowledge\<close>
      apply (insert prems seps ret_address)
      text \<open>Apply VCG/symb.\ execution\<close>
      apply (symbolic_execution masters: masters)+
       apply (finish_symbolic_execution masters: masters)
      apply restart_symbolic_execution
      apply (symbolic_execution add: x masters: masters)
      subgoal premises prems\<^sub>2
      proof -
        have rsps:
          \<open>(\<sigma> \<turnstile> *[rsp\<^sub>0 - 16,8]) = s1 + n - (\<sigma> \<turnstile> *[rsp\<^sub>0 - 32,8])\<close>
          \<open>(\<sigma> \<turnstile> *[rsp\<^sub>0 - 24,8]) = s2 + n - (\<sigma> \<turnstile> *[rsp\<^sub>0 - 32,8])\<close>
          using prems
          by simp+
        have blah: \<open>\<sigma> \<turnstile> *[rsp\<^sub>0-32,8] \<le> n\<close>
          using prems
          by simp
        note s_masters = s_masters[THEN spec, of \<open>\<sigma> \<turnstile> *[rsp\<^sub>0-32,8]\<close>, THEN mp, OF blah, simplified]
        show ?thesis
          apply (insert prems\<^sub>2)
          apply (symbolic_execution add: x rsps masters: masters s_masters)+
            apply (finish_symbolic_execution masters: masters)
           apply restart_symbolic_execution
           apply (symbolic_execution add: x rsps masters: masters s_masters)+
            apply (finish_symbolic_execution masters: masters)
           apply restart_symbolic_execution
           apply (symbolic_execution add: x rsps masters: masters s_masters)+
           apply (finish_symbolic_execution add: word_minus_ge_no_wrap word_neq_0_conv masters: masters)
          apply restart_symbolic_execution
          apply (finish_symbolic_execution masters: masters)
          done
      qed
      done
  qed

  text \<open>Subgoal for rip = boffset+887\<close>
  subgoal premises prems for \<sigma>
    text \<open>Insert relevant knowledge\<close>
    apply (insert prems seps ret_address)
    text \<open>Apply VCG/symb.\ execution\<close>
    apply (restart_symbolic_execution?, (symbolic_execution masters: masters)+, (finish_symbolic_execution masters: masters)?)+
    done

  text \<open>Subgoal for rip = boffset+911\<close>
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
