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
theory strncpy_mem
  imports string
begin

text \<open>Up to two locales per function in the binary.\<close>
locale strncpy_function = string_context +
  fixes rsp\<^sub>0 rbp\<^sub>0 n a strncpy_ret :: \<open>64 word\<close>
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
      \<open>master blocks (rsp\<^sub>0, 8) 7\<close>
    and ret_address: \<open>outside strncpy_ret 402 576\<close> \<comment> \<open>Only works for non-recursive functions.\<close>
begin

text \<open>
  The Floyd invariant expresses for some locations properties that are invariably true.
  Simply expresses that a byte in the memory remains untouched.
\<close>
definition pp_\<Theta> :: \<open>_ \<Rightarrow> floyd_invar\<close> where
  \<open>pp_\<Theta> dest \<equiv> [
    \<comment> \<open>precondition\<close>
    boffset+402 \<mapsto> \<lambda>\<sigma>. regs \<sigma> rsp = rsp\<^sub>0
      \<and> regs \<sigma> rbp = rbp\<^sub>0
      \<and> regs \<sigma> rdi = dest
      \<and> regs \<sigma> rdx = n
      \<and> n > 0 \<comment> \<open>There's an access on n-1 in a situation where n could be 0 without a precondition, thus n must be at least 1.\<close>
      \<and> \<sigma> \<turnstile> *[rsp\<^sub>0,8] = boffset+strncpy_ret
      \<and> \<sigma> \<turnstile> *[a,1] = v\<^sub>0,
    boffset+450 \<mapsto> \<lambda>\<sigma>. regs \<sigma> rsp = rsp\<^sub>0-8
      \<and> regs \<sigma> rbp = rsp\<^sub>0-8
      \<and> n > 0
      \<and> \<sigma> \<turnstile> *[rsp\<^sub>0-48,8] = n
      \<and> \<sigma> \<turnstile> *[rsp\<^sub>0-32,8] = dest
      \<and> \<sigma> \<turnstile> *[rsp\<^sub>0-8,8] = rbp\<^sub>0
      \<and> \<sigma> \<turnstile> *[rsp\<^sub>0,8] = boffset+strncpy_ret
      \<and> \<sigma> \<turnstile> *[a,1] = v\<^sub>0,
    boffset+498 \<mapsto> \<lambda>\<sigma>. regs \<sigma> rsp = rsp\<^sub>0-8
      \<and> regs \<sigma> rbp = rsp\<^sub>0-8
      \<and> n > 0
      \<and> \<sigma> \<turnstile> *[rsp\<^sub>0-48,8] = n
      \<and> \<sigma> \<turnstile> *[rsp\<^sub>0-32,8] = dest
      \<and> \<sigma> \<turnstile> *[rsp\<^sub>0-8,8] = rbp\<^sub>0
      \<and> \<sigma> \<turnstile> *[rsp\<^sub>0,8] = boffset+strncpy_ret
      \<and> \<sigma> \<turnstile> *[a,1] = v\<^sub>0,
    boffset+526 \<mapsto> \<lambda>\<sigma>. regs \<sigma> rsp = rsp\<^sub>0-8
      \<and> regs \<sigma> rbp = rsp\<^sub>0-8
      \<and> n > 0
      \<and> \<sigma> \<turnstile> *[rsp\<^sub>0-48,8] = n
      \<and> \<sigma> \<turnstile> *[rsp\<^sub>0-32,8] = dest
      \<and> \<sigma> \<turnstile> *[rsp\<^sub>0-8,8] = rbp\<^sub>0
      \<and> \<sigma> \<turnstile> *[rsp\<^sub>0,8] = boffset+strncpy_ret
      \<and> \<sigma> \<turnstile> *[a,1] = v\<^sub>0,
    boffset+570 \<mapsto> \<lambda>\<sigma>. regs \<sigma> rsp = rsp\<^sub>0-8
      \<and> regs \<sigma> rbp = rsp\<^sub>0-8
      \<and> \<sigma> \<turnstile> *[rsp\<^sub>0-8,8] = rbp\<^sub>0
      \<and> \<sigma> \<turnstile> *[rsp\<^sub>0,8] = boffset+strncpy_ret
      \<and> \<sigma> \<turnstile> *[a,1] = v\<^sub>0,
    boffset+574 \<mapsto> \<lambda>\<sigma>. regs \<sigma> rsp = rsp\<^sub>0-8
      \<and> regs \<sigma> rbp = rsp\<^sub>0-8
      \<and> \<sigma> \<turnstile> *[rsp\<^sub>0-8,8] = rbp\<^sub>0
      \<and> \<sigma> \<turnstile> *[rsp\<^sub>0,8] = boffset+strncpy_ret
      \<and> \<sigma> \<turnstile> *[a,1] = v\<^sub>0,
    \<comment> \<open>postcondition\<close>
    boffset+strncpy_ret \<mapsto> \<lambda>\<sigma>. \<sigma> \<turnstile> *[a,1] = v\<^sub>0
      \<and> regs \<sigma> rsp = rsp\<^sub>0+8
      \<and> regs \<sigma> rbp = rbp\<^sub>0
  ]\<close>

text \<open>Adding some rules to the simplifier to simplify proofs.\<close>
schematic_goal pp_\<Theta>_zero[simp]:
  \<open>pp_\<Theta> dest boffset = ?x\<close>
  unfolding pp_\<Theta>_def
  by simp
schematic_goal pp_\<Theta>_numeral_l[simp]:
  \<open>pp_\<Theta> dest (nn + boffset) = ?x\<close>
  unfolding pp_\<Theta>_def
  by simp
schematic_goal pp_\<Theta>_numeral_r[simp]:
  \<open>pp_\<Theta> dest (boffset + nn) = ?x\<close>
  unfolding pp_\<Theta>_def
  by simp

lemma rewrite_strncpy_mem:
  assumes \<open>\<forall>i<n. master blocks (dest+i, 1) 8\<close>
  shows \<open>is_std_invar strncpy_ret (floyd.invar strncpy_ret (pp_\<Theta> dest))\<close>
  text \<open>Boilerplate code to start the VCG\<close>
  apply (rule floyd_invarI)
  apply (rewrite at \<open>floyd_vcs strncpy_ret \<hole> _\<close> pp_\<Theta>_def)
  apply (intro floyd_vcsI)

  text \<open>Subgoal for rip = boffset+402\<close>
  subgoal premises prems for \<sigma>
    text \<open>Insert relevant knowledge\<close>
    apply (insert prems seps ret_address)
    text \<open>Apply VCG/symb.\ execution\<close>
    apply (restart_symbolic_execution?, (symbolic_execution masters: masters)+, (finish_symbolic_execution masters: masters)?)+
    done

  text \<open>Subgoal for rip = boffset+450\<close>
  subgoal premises prems for \<sigma>
    text \<open>Insert relevant knowledge\<close>
    apply (insert prems seps ret_address)
    text \<open>Apply VCG/symb.\ execution\<close>
    apply (restart_symbolic_execution?, (symbolic_execution masters: masters)+, (finish_symbolic_execution masters: masters)?)+
    done

  text \<open>Subgoal for rip = boffset+498\<close>
  subgoal premises prems for \<sigma>
    text \<open>Insert relevant knowledge\<close>
    apply (insert prems seps ret_address)
    text \<open>Apply VCG/symb.\ execution\<close>
    apply (symbolic_execution masters: masters)+
    apply restart_symbolic_execution
    subgoal premises prems\<^sub>2
    proof -
      have x: \<open>regs \<sigma> rbp = rsp\<^sub>0 - 8\<close>
        using prems
        by simp
      note dest_masters = assms[THEN spec, of \<open>\<sigma> \<turnstile> *[rsp\<^sub>0-16,8]\<close>, THEN mp, OF `\<sigma> \<turnstile> *[rsp\<^sub>0-16,8] < n`, simplified]
      show ?thesis
        apply (insert prems\<^sub>2)
        apply (restart_symbolic_execution?, (symbolic_execution add: x masters: masters dest_masters)+, (finish_symbolic_execution add: x masters: masters dest_masters)?)+
        apply restart_symbolic_execution
        using prems\<^sub>2
        apply auto
        done
    qed
    done

  text \<open>Subgoal for rip = boffset+526\<close>
  subgoal premises prems for \<sigma>
  proof -
    have x: \<open>regs \<sigma> rbp = rsp\<^sub>0 - 8\<close>
      using prems
      by simp
    have \<open>n - 1 < n\<close>
      using prems
      by unat_arith
    then have m: \<open>master blocks (dest + n - 1, Suc 0) 8\<close>
      using assms[THEN spec,of \<open>n - 1\<close>]
      by (simp add: field_simps)
    show ?thesis
      text \<open>Insert relevant knowledge\<close>
      apply (insert prems seps ret_address)
      text \<open>Apply VCG/symb.\ execution\<close>
      apply (symbolic_execution add: x masters: m masters)+
       apply (finish_symbolic_execution add: x masters: m masters)
      apply restart_symbolic_execution
      apply (symbolic_execution add: x masters: m masters)+
      subgoal premises prems\<^sub>2
      proof -
        note dest_masters = assms[THEN spec, of \<open>\<sigma> \<turnstile> *[rsp\<^sub>0-16,8]\<close>, THEN mp, OF `\<sigma> \<turnstile> *[rsp\<^sub>0-16,8] < n`, simplified]
        show ?thesis
          by (insert prems\<^sub>2) (finish_symbolic_execution add: x masters: m masters dest_masters)
      qed
      done
  qed

  text \<open>Subgoal for rip = boffset+570\<close>
  subgoal premises prems for \<sigma>
    text \<open>Insert relevant knowledge\<close>
    apply (insert prems seps ret_address)
    text \<open>Apply VCG/symb.\ execution\<close>
    apply (restart_symbolic_execution?, (symbolic_execution masters: masters)+, (finish_symbolic_execution masters: masters)?)+
    done

  text \<open>Subgoal for rip = boffset+574\<close>
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
