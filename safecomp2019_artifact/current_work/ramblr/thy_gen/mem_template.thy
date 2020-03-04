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
theory {func_name}{suffix}_mem
  imports {infile}
begin

text \<open>Up to two locales per function in the binary.\<close>
locale {func_name}_function = {infile}_context +
  fixes rsp\<^sub>0 rbp\<^sub>0 a {func_name}{suffix}_ret :: \<open>64 word\<close>
    and v\<^sub>0 :: \<open>8 word\<close>
    and blocks :: \<open>(nat \<times> 64 word \<times> nat) set\<close>
  assumes seps: \<open>seps blocks\<close>
    and masters:
      \<open>master blocks (a, 1) 0\<close>
{masters}    and ret_address: \<open>outside {func_name}{suffix}_ret {func_start} {func_end}\<close> \<comment> \<open>Only works for non-recursive functions.\<close>
begin

text \<open>
  The Floyd invariant expresses for some locations properties that are invariably true.
  Simply expresses that a byte in the memory remains untouched.
\<close>
definition pp_\<Theta> :: floyd_invar where
  \<open>pp_\<Theta> \<equiv> [
    \<comment> \<open>precondition\<close>
    {func_boffset} \<mapsto> \<lambda>\<sigma>. regs \<sigma> rsp = rsp\<^sub>0
      \<and> regs \<sigma> rbp = rbp\<^sub>0
      \<and> \<sigma> \<turnstile> *[rsp\<^sub>0,8] = boffset+{func_name}{suffix}_ret
      \<and> \<sigma> \<turnstile> *[a,1] = v\<^sub>0,
{invariant_annotations}    \<comment> \<open>postcondition\<close>
    boffset+{func_name}{suffix}_ret \<mapsto> \<lambda>\<sigma>. \<sigma> \<turnstile> *[a,1] = v\<^sub>0
      \<and> regs \<sigma> rsp = rsp\<^sub>0+8
      \<^cancel>\<open>\<and> regs \<sigma> rbp = rbp\<^sub>0\<close> \<comment> \<open>TODO: work in flow-through of rbp0 as necessary (such as when pushed, etc.)\<close>
  ]\<close>

text \<open>Adding some rules to the simplifier to simplify proofs.\<close>
schematic_goal pp_\<Theta>_zero[simp]:
  \<open>pp_\<Theta> boffset = ?x\<close>
  unfolding pp_\<Theta>_def
  by simp
schematic_goal pp_\<Theta>_numeral_l[simp]:
  \<open>pp_\<Theta> (n + boffset) = ?x\<close>
  unfolding pp_\<Theta>_def
  by simp
schematic_goal pp_\<Theta>_numeral_r[simp]:
  \<open>pp_\<Theta> (boffset + n) = ?x\<close>
  unfolding pp_\<Theta>_def
  by simp

lemma rewrite_{func_name}{suffix}_mem:
  \<open>is_std_invar {func_name}{suffix}_ret (floyd.invar {func_name}{suffix}_ret pp_\<Theta>)\<close>
  text \<open>Boilerplate code to start the VCG\<close>
  apply (rule floyd_invarI)
  apply (rewrite at \<open>floyd_vcs {func_name}{suffix}_ret \<hole> _\<close> pp_\<Theta>_def)
  apply (intro floyd_vcsI)

{subgoals}
  text \<open>Trivial ending subgoal.\<close>
  subgoal
    by simp
  done

end

end
