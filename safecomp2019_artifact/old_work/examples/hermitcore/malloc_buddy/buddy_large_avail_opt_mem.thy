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
theory buddy_large_avail_opt_mem
  imports buddy_opt
begin

context assembly
begin

interpretation until_ret: cfg_system step \<open>until {(ts_ret, pc_ret)}\<close> wf_state location
  by standard (simp add: wf_state_def det_system.is_weak_invar_def)

declare until_def[simp]
declare wf_state_def[simp]
declare location_def[simp]

text \<open>
  This method runs symbolic execution per instruction.
  It unfolds the step function, fetches the next instruction
  and then simplifies until no further let's are in the goal.
\<close>
method symbolic_execution uses add del =
  (rule wps_rls)?,
  (simp del: del)?,
  simp only: assembly_def cong: Let'_weak_cong,
  rewrite_one_let',
  rewrite_one_let' del: del,
  rewrite_one_let' add: exec_instr.simps del: del,
  rewrite_one_let' add: unfold_semantics del: del,
  (rewrite_one_let' add: add del: del)+,
  rule until_ret.linvar_unfoldI,
  simp del: del

text \<open>
  Symbolic execution can produce multiple subgoals (e.g., due to conditional jumps).
  If one subgoal is finished, call this method once to restart the symbolic execution on the
  unfinished next subgoal.
\<close>
method restart_symbolic_execution uses add del =
  (rewrite_one_let' add: add del: del)+,
  rule until_ret.linvar_unfoldI,
  simp del: del
|
  rule until_ret.linvar_unfoldI,
  simp del: del

text \<open>
  If symbolic execution is finished, the subgoal often contains a large term, possibly with let's.
  This can be simplified by running simplification.
\<close>
method finish_symbolic_execution uses add del =
  simp add: simp_rules add del: del,
  (rewrite_one_let' add: add del: del)+,
  (simp add: simp_rules add del: del; fail)?

text \<open>
  The Floyd invariant expresses for some locations properties that are invariably true.
  Simply expresses that a byte in the memory remains untouched.
\<close>
definition pp_\<Theta> :: \<open>_ \<Rightarrow> _ \<Rightarrow> _ \<Rightarrow> _ \<Rightarrow> _ \<Rightarrow> _ \<Rightarrow> floyd_invar\<close> where
  \<open>pp_\<Theta> rsp\<^sub>0 a v\<^sub>0 large_avail_ret ts_ret pc_ret \<equiv> [
    \<comment> \<open>precondition\<close>
    (1,  0) \<mapsto> \<lambda>\<sigma>. RSP \<sigma> = rsp\<^sub>0
                 \<and> \<sigma> \<turnstile> *[a,1] = v\<^sub>0
                 \<and> \<sigma> \<turnstile> *[rsp\<^sub>0,8] = large_avail_ret,
    \<comment> \<open>loop invariant\<close>
    (1, 19) \<mapsto> \<lambda>\<sigma>. RSP \<sigma> = rsp\<^sub>0
                 \<and> \<sigma> \<turnstile> *[a,1] = v\<^sub>0
                 \<and> \<sigma> \<turnstile> *[rsp\<^sub>0,8] = large_avail_ret,
    \<comment> \<open>postcondition\<close>
    (ts_ret, pc_ret - 1) \<mapsto> \<lambda>\<sigma>. \<sigma> \<turnstile> *[a,1] = v\<^sub>0
                              \<and> RSP \<sigma> = rsp\<^sub>0 + 8
  ]\<close>

schematic_goal pp_\<Theta>_zero[simp]: \<comment> \<open>@{term 0} is not a numeral\<close>
  shows \<open>pp_\<Theta> rsp\<^sub>0 a v\<^sub>0 large_avail_ret ts_ret pc_ret (1, 0) = ?x\<close>
  unfolding pp_\<Theta>_def
  by simp
schematic_goal pp_\<Theta>_one[simp]: \<comment> \<open>@{term 1} is not a numeral\<close>
  shows \<open>pp_\<Theta> rsp\<^sub>0 a v\<^sub>0 large_avail_ret ts_ret pc_ret (1, 1) = ?x\<close>
  unfolding pp_\<Theta>_def
  by simp
schematic_goal pp_\<Theta>_numeral[simp]:
  shows \<open>pp_\<Theta> rsp\<^sub>0 a v\<^sub>0 large_avail_ret ts_ret pc_ret (1, numeral m) = ?x\<close>
  unfolding pp_\<Theta>_def
  by simp
schematic_goal pp_\<Theta>_ret[simp]:
  shows \<open>pp_\<Theta> rsp\<^sub>0 a v\<^sub>0 large_avail_ret ts_ret pc_ret (ts_ret, pc_ret - 1) = ?x\<close>
  unfolding pp_\<Theta>_def
  by simp

lemma rewrite_buddy_large_avail:
  assumes \<open>master blocks (buddy_lists, BUDDY_LISTS * 8) 2\<close>
      and \<open>master blocks (a, 1) 3\<close>
      and \<open>master blocks (rsp\<^sub>0, 8) 4\<close>
      and \<open>seps blocks\<close>
      and \<open>label_to_index \<alpha> (the (address_to_label large_avail_ret)) = Some (ts_ret, pc_ret)\<close>
      and \<open>ts_ret \<noteq> 1\<close>
    shows \<open>until_ret.is_std_invar ts_ret pc_ret (until_ret.floyd.invar ts_ret pc_ret (pp_\<Theta> rsp\<^sub>0 a v\<^sub>0 large_avail_ret ts_ret pc_ret))\<close>
  (* Boilerplate code  to start the VCG *)
  apply (rule until_ret.floyd_invarI)
  apply (rewrite at \<open>until_ret.floyd_vcs ts_ret pc_ret \<hole> _\<close> pp_\<Theta>_def)
  apply (intro until_ret.floyd_vcsI; clarsimp?)

  (* Subgoal for (ts, pc) = (1, 0) to (1, 18) *)
  subgoal premises prems for \<sigma>
    (* Insert relevant knowledge *)
    apply (insert prems assms)
    (* Apply VCG/symb. execution *)
    apply symbolic_execution (* cmp *)
    apply symbolic_execution (* mov *)
    apply (symbolic_execution del: imp_disjL) (* ja .label_15 *)
     apply symbolic_execution (* cmp *)
     apply symbolic_execution (* setne *)
      apply symbolic_execution (* movzx *)
      apply symbolic_execution (* ret *)

     (* continuing from setne *)
     apply restart_symbolic_execution
     apply symbolic_execution (* movzx *)
     apply symbolic_execution (* ret *)

    (* ja .label_15 not taken *)
    apply (restart_symbolic_execution del: imp_disjL)
    apply symbolic_execution (* movzx *)
    apply symbolic_execution (* lea *)
    apply symbolic_execution (* sub *)
    apply symbolic_execution (* movsxd *)
    apply symbolic_execution (* cmp *)
    apply symbolic_execution (* jne .label_15 *)
     apply symbolic_execution (* cmp *)
     apply symbolic_execution (* setne *)
     apply symbolic_execution (* movzx *)
     apply symbolic_execution (* ret *)

    (* jne .label_15 not taken *)
    apply restart_symbolic_execution
    apply symbolic_execution (* lea *)
    apply symbolic_execution (* movzx *)
    apply symbolic_execution (* sub *)
    apply symbolic_execution (* movsxd *)
    apply symbolic_execution (* lea *)
    apply symbolic_execution (* jmp .label_14 *)
    apply symbolic_execution (* add *)
    done

  (* Subgoal for (ts, pc) = (1, 18) to (1, 17) and (ts_ret, pc_ret - 1) *)
  subgoal premises prems for \<sigma>
    (* Insert relevant knowledge *)
    apply (insert prems assms)
    (* Apply VCG/symb. execution *)
    apply symbolic_execution (* cmp *)
    apply symbolic_execution (* jne .label_16 *)
     apply symbolic_execution (* add *)
     apply symbolic_execution (* cmp *)
     apply symbolic_execution (* jne .label_15 *)
      apply symbolic_execution (* cmp *)
      apply symbolic_execution (* setne *)
      apply symbolic_execution (* movzx *)
      apply symbolic_execution (* ret *)

     (* jne .label_15 not taken *)
     apply restart_symbolic_execution
     apply symbolic_execution (* add *)

    (* jne .label_16 not taken *)
    apply restart_symbolic_execution
    apply symbolic_execution (* cmp *)
    apply symbolic_execution (* setne *)
    apply symbolic_execution (* movzx *)
    apply symbolic_execution (* ret *)
    done
  done

end

end
