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
theory strcpy_mem
  imports string
begin

text \<open>Up to two locales per function in the binary.\<close>
locale strcpy_function = string_context +
  fixes rsp\<^sub>0 rbp\<^sub>0 n a strcpy_ret :: \<open>64 word\<close>
    and v\<^sub>0 :: \<open>8 word\<close>
    and blocks :: \<open>(nat \<times> 64 word \<times> nat) set\<close>
  assumes seps: \<open>seps blocks\<close>
    and masters:
      \<open>master blocks (a, 1) 0\<close>
      \<open>master blocks (rsp\<^sub>0, 8) 1\<close>
      \<open>master blocks (rsp\<^sub>0-8, 8) 2\<close>
      \<open>master blocks (rsp\<^sub>0-16, 8) 3\<close>
      \<open>master blocks (rsp\<^sub>0-32, 8) 4\<close>
      \<open>master blocks (rsp\<^sub>0-40, 8) 5\<close>
      \<open>master blocks (rsp\<^sub>0-48, 8) 6\<close>
    and ret_address: \<open>outside strcpy_ret 576 706\<close> \<comment> \<open>Only works for non-recursive functions.\<close>
begin

text \<open>
  The Floyd invariant expresses for some locations properties that are invariably true.
  Simply expresses that a byte in the memory remains untouched.
\<close>
definition pp_\<Theta> :: \<open>_ \<Rightarrow> _ \<Rightarrow> floyd_invar\<close> where
  \<open>pp_\<Theta> dest src \<equiv> [
    \<comment> \<open>precondition\<close>
    boffset+576 \<mapsto> \<lambda>\<sigma>. regs \<sigma> rsp = rsp\<^sub>0
      \<and> regs \<sigma> rbp = rbp\<^sub>0
      \<and> regs \<sigma> rdi = dest
      \<and> regs \<sigma> rsi = src
      \<and> \<sigma> \<turnstile> *[src + n - 1,1] = (0::8 word) \<comment> \<open>src must be null-terminated\<close>
      \<and> n > 0 \<comment> \<open>empty strings still have a null terminator\<close>
      \<and> \<sigma> \<turnstile> *[rsp\<^sub>0,8] = boffset+strcpy_ret
      \<and> \<sigma> \<turnstile> *[a,1] = v\<^sub>0,
    boffset+620 \<mapsto> \<lambda>\<sigma>. regs \<sigma> rsp = rsp\<^sub>0-8
      \<and> regs \<sigma> rbp = rsp\<^sub>0-8
      \<and> n > 0
      \<and> \<sigma> \<turnstile> *[src + n - 1,1] = (0::8 word)
      \<and> \<sigma> \<turnstile> *[rsp\<^sub>0-40,8] = src
      \<and> \<sigma> \<turnstile> *[rsp\<^sub>0-32,8] = dest
      \<and> \<sigma> \<turnstile> *[rsp\<^sub>0-8,8] = rbp\<^sub>0
      \<and> \<sigma> \<turnstile> *[rsp\<^sub>0,8] = boffset+strcpy_ret
      \<and> \<sigma> \<turnstile> *[a,1] = v\<^sub>0,
    boffset+668 \<mapsto> \<lambda>\<sigma>. regs \<sigma> rsp = rsp\<^sub>0-8
      \<and> regs \<sigma> rbp = rsp\<^sub>0-8
      \<and> n > 0
      \<and> \<sigma> \<turnstile> *[src + n - 1,1] = (0::8 word)
      \<and> \<sigma> \<turnstile> *[rsp\<^sub>0-16,8] < n
      \<and> \<sigma> \<turnstile> *[rsp\<^sub>0-40,8] = src
      \<and> \<sigma> \<turnstile> *[rsp\<^sub>0-32,8] = dest
      \<and> \<sigma> \<turnstile> *[rsp\<^sub>0-8,8] = rbp\<^sub>0
      \<and> \<sigma> \<turnstile> *[rsp\<^sub>0,8] = boffset+strcpy_ret
      \<and> \<sigma> \<turnstile> *[a,1] = v\<^sub>0,
    boffset+704 \<mapsto> \<lambda>\<sigma>. regs \<sigma> rsp = rsp\<^sub>0-8
      \<and> regs \<sigma> rbp = rsp\<^sub>0-8
      \<and> \<sigma> \<turnstile> *[rsp\<^sub>0-8,8] = rbp\<^sub>0
      \<and> \<sigma> \<turnstile> *[rsp\<^sub>0,8] = boffset+strcpy_ret
      \<and> \<sigma> \<turnstile> *[a,1] = v\<^sub>0,
    \<comment> \<open>postcondition\<close>
    boffset+strcpy_ret \<mapsto> \<lambda>\<sigma>. \<sigma> \<turnstile> *[a,1] = v\<^sub>0
      \<and> regs \<sigma> rsp = rsp\<^sub>0+8
      \<and> regs \<sigma> rbp = rbp\<^sub>0
  ]\<close>

text \<open>Adding some rules to the simplifier to simplify proofs.\<close>
schematic_goal pp_\<Theta>_zero[simp]:
  \<open>pp_\<Theta> dest src boffset = ?x\<close>
  unfolding pp_\<Theta>_def
  by simp
schematic_goal pp_\<Theta>_numeral_l[simp]:
  \<open>pp_\<Theta> dest src (nn + boffset) = ?x\<close>
  unfolding pp_\<Theta>_def
  by simp
schematic_goal pp_\<Theta>_numeral_r[simp]:
  \<open>pp_\<Theta> dest src (boffset + nn) = ?x\<close>
  unfolding pp_\<Theta>_def
  by simp

lemma x_le_y_minus_1:
  fixes x :: \<open>'a::len0 word\<close>
  assumes \<open>x < y\<close> \<open>x \<noteq> y - 1\<close>
  shows \<open>x < y - 1\<close>
  using assms
  by (smt add_diff_cancel_left' add_diff_cancel_right' add_uminus_conv_diff linorder_not_le order_less_le word_less_add_right word_n1_ge word_sub_le_iff)

lemma move_1_around:
  fixes x :: \<open>'a::len word\<close>
  assumes \<open>x < y - 1\<close> \<open>y > 0\<close>
  shows \<open>1 + x < y\<close>
  using assms
  by (metis (no_types, hide_lams) add_diff_cancel_left' assms linorder_not_le mcs(2) order_less_le word_less_1)

lemma rewrite_strcpy_mem:
  assumes dm: \<open>\<forall>i<n. master blocks (dest + i, Suc 0) 7\<close>
      and sm: \<open>master blocks (n + src - 1, Suc 0) 8\<close>
  shows \<open>is_std_invar strcpy_ret (floyd.invar strcpy_ret (pp_\<Theta> dest src))\<close>
  text \<open>Boilerplate code to start the VCG\<close>
  apply (rule floyd_invarI)
  apply (rewrite at \<open>floyd_vcs strcpy_ret \<hole> _\<close> pp_\<Theta>_def)
  apply (intro floyd_vcsI)

  text \<open>Subgoal for rip = boffset+576\<close>
  subgoal premises prems for \<sigma>
    text \<open>Insert relevant knowledge\<close>
    apply (insert prems seps ret_address)
    text \<open>Apply VCG/symb.\ execution\<close>
    apply (restart_symbolic_execution?, (symbolic_execution masters: masters sm)+, (finish_symbolic_execution masters: masters sm)?)+
    done

  text \<open>Subgoal for rip = boffset+620\<close>
  subgoal premises prems for \<sigma>
    text \<open>Insert relevant knowledge\<close>
    apply (insert prems seps ret_address)
    text \<open>Apply VCG/symb.\ execution\<close>
    apply (restart_symbolic_execution?, (symbolic_execution masters: masters)+, (finish_symbolic_execution masters: masters)?)+
    done

  text \<open>Subgoal for rip = boffset+668\<close>
  subgoal premises prems for \<sigma>
  proof -
    have blah: \<open>\<sigma> \<turnstile> *[rsp\<^sub>0-16,8] < n\<close>
      using prems
      by simp
    note dm = dm[THEN spec, of \<open>\<sigma> \<turnstile> *[rsp\<^sub>0-16,8]\<close>, THEN mp, OF blah]
    show ?thesis
      text \<open>Insert relevant knowledge\<close>
      apply (insert prems seps ret_address)
      text \<open>Apply VCG/symb.\ execution\<close>
      apply (restart_symbolic_execution?, (symbolic_execution masters: masters sm dm)+, (finish_symbolic_execution masters: masters sm dm)?)+
      subgoal
        by (cases \<open>\<sigma> \<turnstile> *[rsp\<^sub>0 - 16,8] = n - 1\<close>) (auto simp: simp_rules x_le_y_minus_1 move_1_around)
      apply (restart_symbolic_execution?, (symbolic_execution masters: masters sm dm)+, (finish_symbolic_execution masters: masters sm dm)?)+
      done
  qed

  text \<open>Subgoal for rip = boffset+704\<close>
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
