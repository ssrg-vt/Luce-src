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
theory buddy_get_opt_mem
  imports buddy_opt
begin

context assembly
begin

text \<open>
  As we want to verify individual function bodies, it seems useful for now to treat the end of a
  function's section as the halting point. This may need to be changed if we encounter functions
  that are split across sections, but for now that is not an issue. For now, each function gets its
  own @{text halted}.
\<close>

(* TODO: need to adapt to the recursion style used for the updated factorial proof *)
value \<open>length (instructions (text_sections assembly!5))\<close>
definition halted :: \<open>state \<Rightarrow> bool\<close> where
  \<open>halted \<sigma> \<equiv> pc \<sigma> = 24\<close>

interpretation cfg_system step halted wf_state location
  by standard (simp add: wf_state_def det_system.is_weak_invar_def)

declare halted_def[simp]
declare wf_state_def[simp]
declare location_def[simp]

text \<open>
  This method runs symbolic execution per instruction.
  It unfolds the step function, fetches the next instruction,
  inserts master-information and then simplifies until no further let's are in the goal.
  Then, the masters are cleaned up again (to prevent littering of the subgoal).
\<close>
method symbolic_execution uses masters add del =
  (rule wps_rls)?,
  (simp del: del)?,
  simp only: assembly_def cong: Let'_weak_cong,
  rewrite_one_let',
  rewrite_one_let' del: del,
  rewrite_one_let' add: exec_instr.simps del: del,
  rewrite_one_let' add: unfold_semantics del: del,
  insert masters,
  (rewrite_one_let' add: add del: del)+,
  (thin_tac \<open>master _ _ _\<close>)+,
  rule linvar_unfoldI,
  simp del: del

text \<open>
  Symbolic execution can produce multiple subgoals (e.g., due to conditional jumps).
  If one subgoal is finished, call this method once to restart the symbolic execution on the unfinished
  next subgoal.
\<close>
method restart_symbolic_execution uses add del =
  (rewrite_one_let' add: add del: del)+,
  (thin_tac \<open>master _ _ _\<close>)+,
  rule linvar_unfoldI,
  simp del: del
|
  ((thin_tac \<open>master _ _ _\<close>)+)?,
  rule linvar_unfoldI,
  simp del: del

text \<open>If symbolic execution is finished, the subgoal often contains a large term, possibly with let's.
  This can be simplified by inserting information on the masters and running simplification.
\<close>
method finish_symbolic_execution uses add del masters =
  insert masters,
  simp add: simp_rules add del: del,
  (rewrite_one_let' add: add del: del)+,
  (simp add: simp_rules add del: del; fail)?,
  ((thin_tac \<open>master _ _ _\<close>)+)?

text \<open>
  The Floyd invariant expresses for some locations properties that are invariably true.
  Simply expresses that a byte in the memory remains untouched.
\<close>
definition pp_\<Theta> :: \<open>_ \<Rightarrow> _ \<Rightarrow> _ \<Rightarrow> _ \<Rightarrow> _ \<Rightarrow> floyd_invar\<close> where
  \<open>pp_\<Theta> rsp\<^sub>0 a v\<^sub>0 ts_ret pc_ret \<equiv> [
    (* precondition *)
    (5,   0) \<mapsto> \<lambda>\<sigma>. \<sigma> \<turnstile> *[a,1] = v\<^sub>0
                  \<and> RSP \<sigma> = rsp\<^sub>0, (* fix *)
    (* resume *)
    (5, 318) \<mapsto> \<lambda>\<sigma>. \<sigma> \<turnstile> *[a,1] = v\<^sub>0, (* fill out *)
    (* postcondition *)
    (ts_ret, pc_ret - 1) \<mapsto> \<lambda>\<sigma>. \<sigma> \<turnstile> *[a,1] = v\<^sub>0
                              \<and> RSP \<sigma> = rsp\<^sub>0 + 8
  ]\<close>

schematic_goal pp_\<Theta>_zero[simp]: \<comment> \<open>@{term 0} is not a numeral\<close>
  shows \<open>pp_\<Theta> rsp\<^sub>0 a v\<^sub>0 ts_ret pc_ret (5, 0) = ?x\<close>
  unfolding pp_\<Theta>_def
  by simp
schematic_goal pp_\<Theta>_one[simp]: \<comment> \<open>@{term 1} is not a numeral\<close>
  shows \<open>pp_\<Theta> rsp\<^sub>0 a v\<^sub>0 ts_ret pc_ret (5, 1) = ?x\<close>
  unfolding pp_\<Theta>_def
  by simp
schematic_goal pp_\<Theta>_numeral[simp]:
  shows \<open>pp_\<Theta> rsp\<^sub>0 a v\<^sub>0 ts_ret pc_ret (5, numeral m) = ?x\<close>
  unfolding pp_\<Theta>_def
  by simp

lemma rewrite_buddy_get:
  assumes \<open>seps blocks\<close>
      and \<open>(2, a, 1) \<in> blocks\<close>
      and \<open>(3, l ''completed.7641'' + 32, 8) \<in> blocks\<close> \<comment> \<open>@{const buddy_lists}\<close>
      and \<open>ts_ret \<noteq> 5\<close>
    shows \<open>is_std_invar (floyd.invar (pp_\<Theta> rsp\<^sub>0 a v\<^sub>0 ts_ret pc_ret))\<close>
proof -
  (* Boilerplate code for setting up the master blocks: *)
  have masters:
    \<open>master blocks (a, 1) 2\<close>
    \<open>master blocks (l ''completed.7641'' + 32, 8) 3\<close>
    by (find_master' assms: assms)+

  have two's_complement_fix\<^sub>1: \<open>18446744073709551552 = -(64::64 word)\<close>
    by simp
  have two's_complement_fix\<^sub>2: \<open>4294967290 = -(6::32 word)\<close>
    by simp

  show ?thesis
    (* Boilerplate code  to start the VCG *)
    apply (rule floyd_invarI)
    apply (rewrite at \<open>floyd_vcs \<hole> _\<close> pp_\<Theta>_def)
    apply (intro floyd_vcsI; clarsimp?)

    (* Subgoal for (ts, pc) = (5, 0) to (5, 0) *)
    subgoal premises prems for \<sigma>
    proof -
      have rsp_min: \<open>64 \<le> RSP \<sigma>\<close>
        sorry
      note 1 = order_trans[OF _ rsp_min]
      note 2 = word_sub_le[OF 1]

      have m\<^sub>2:
        \<open>master blocks (RSP \<sigma> - 8, 8) 4\<close>
        \<open>master blocks (RSP \<sigma> - 16, 8) 4\<close>
        \<open>master blocks (RSP \<sigma> - 24, 8) 4\<close>
        \<open>master blocks (RSP \<sigma> - 32, 8) 4\<close>
        \<open>master blocks (RSP \<sigma> - 40, 8) 4\<close>
        \<open>master blocks (RSP \<sigma> - 48, 8) 4\<close>
        \<open>master blocks (RSP \<sigma> - 64, 8) 4\<close>
(*         \<open>master blocks (RSP \<sigma>, 8) 5\<close> *)
        sorry

      show ?thesis
        (* Insert relevant knowledge *)
        apply (insert prems assms rsp_min 1 2)
        (* Apply VCG/symb. execution *)
        apply (symbolic_execution masters: masters m\<^sub>2) (* push *)
        apply (symbolic_execution masters: masters m\<^sub>2) (* push *)
        apply (symbolic_execution masters: masters m\<^sub>2) (* push *)
        apply (symbolic_execution masters: masters m\<^sub>2) (* movzx *)
        apply (symbolic_execution masters: masters m\<^sub>2) (* push *)
        apply (symbolic_execution masters: masters m\<^sub>2) (* push *)
        apply (symbolic_execution masters: masters m\<^sub>2) (* lea *)
        apply (symbolic_execution masters: masters m\<^sub>2) (* push *)
        apply (symbolic_execution masters: masters m\<^sub>2) (* lea *)
        apply (symbolic_execution masters: masters m\<^sub>2) (* movsxd *)
        apply (symbolic_execution masters: masters m\<^sub>2) (* sub *)
        apply (symbolic_execution masters: masters m\<^sub>2) (* mov *)
        apply (symbolic_execution masters: masters m\<^sub>2) (* test *)
        apply (symbolic_execution masters: masters m\<^sub>2) (* je .label_28 *)
         apply (symbolic_execution masters: masters m\<^sub>2) (* cmp *)
         apply (symbolic_execution masters: masters m\<^sub>2 del: imp_disjL) (* jbe .label_19 *)
          apply (symbolic_execution masters: masters m\<^sub>2) (* lea *)
          apply (symbolic_execution masters: masters m\<^sub>2) (* movzx *)
          apply (symbolic_execution masters: masters m\<^sub>2 add: two's_complement_fix\<^sub>2) (* sub *)
          apply (symbolic_execution masters: masters m\<^sub>2) (* movsxd *)
          apply (symbolic_execution masters: masters m\<^sub>2) (* mov *)
          apply (symbolic_execution masters: masters m\<^sub>2) (* test *)
          apply (symbolic_execution masters: masters m\<^sub>2) (* je .label_29 *)
           apply (symbolic_execution masters: masters m\<^sub>2) (* cmp *)
           apply (symbolic_execution masters: masters m\<^sub>2 del: imp_disjL) (* jbe .label_20 *)
            apply (symbolic_execution masters: masters m\<^sub>2) (* add *)
            apply (symbolic_execution masters: masters m\<^sub>2) (* movzx *)
            apply (symbolic_execution masters: masters m\<^sub>2 add: two's_complement_fix\<^sub>1) (* call buddy_get *)
        subgoal sorry (* apply (finish_symbolic_execution masters: masters m\<^sub>2) *)

           (* jbe .label_20 not taken *)
           apply restart_symbolic_execution
           apply (symbolic_execution masters: masters m\<^sub>2) (* cmp *)
           apply (symbolic_execution masters: masters m\<^sub>2 del: imp_disjL) (* ja .label_27 *)
            apply (symbolic_execution masters: masters m\<^sub>2) (* cmp *)
            apply (symbolic_execution masters: masters m\<^sub>2) (* je .label_23 *)
             apply (symbolic_execution masters: masters m\<^sub>2) (* mov *)
             apply (symbolic_execution masters: masters m\<^sub>2) (* mov *)
             apply (symbolic_execution masters: masters m\<^sub>2) (* mov *)
             apply (symbolic_execution masters: masters m\<^sub>2) (* shl *)
             apply (symbolic_execution masters: masters m\<^sub>2) (* movsxd *)
             apply (symbolic_execution masters: masters m\<^sub>2) (* call palloc *)
             apply (symbolic_execution masters: masters m\<^sub>2) (* test *)
             apply (symbolic_execution masters: masters m\<^sub>2) (* je .label_21 *) \<comment> \<open>\texttt{.label\_21}, \texttt{.label\_22}, \texttt{.label\_23} would be good places to put additional annotations to avoid having to symbolically execute those over and over, maybe\<close>
              apply (symbolic_execution masters: masters m\<^sub>2) (* add *)
              apply (symbolic_execution masters: masters m\<^sub>2) (* mov *)
              apply (symbolic_execution masters: masters m\<^sub>2) (* pop *)
              apply (symbolic_execution masters: masters m\<^sub>2) (* pop *)
              apply (symbolic_execution masters: masters m\<^sub>2) (* pop *)
              apply (symbolic_execution masters: masters m\<^sub>2) (* pop *)
              apply (symbolic_execution masters: masters m\<^sub>2) (* pop *)
              apply (symbolic_execution masters: masters m\<^sub>2) (* pop *)
              apply (symbolic_execution masters: masters m\<^sub>2) (* ret *)
              apply (finish_symbolic_execution masters: masters m\<^sub>2)

             (* je .label_21 not taken *)
             apply restart_symbolic_execution
             apply (symbolic_execution masters: masters m\<^sub>2) (* mov *)
             apply (symbolic_execution masters: masters m\<^sub>2) (* xor *)
             apply (symbolic_execution masters: masters m\<^sub>2) (* mov *)
             apply (symbolic_execution masters: masters m\<^sub>2) (* jmp .label_25 *)
             apply (symbolic_execution masters: masters m\<^sub>2) (* mov *)
             apply (symbolic_execution masters: masters m\<^sub>2) (* mov *)
             apply (symbolic_execution masters: masters m\<^sub>2) (* shl *)
             apply (symbolic_execution masters: masters m\<^sub>2) (* movsxd *)
             apply (symbolic_execution masters: masters m\<^sub>2) (* add *)
             apply (symbolic_execution masters: masters m\<^sub>2) (* mov *)
             apply (symbolic_execution masters: masters m\<^sub>2) (* mov *)
             apply (symbolic_execution masters: masters m\<^sub>2) (* jmp .label_21 *)
             apply (symbolic_execution masters: masters m\<^sub>2) (* add *)
             apply (symbolic_execution masters: masters m\<^sub>2) (* mov *)
             apply (symbolic_execution masters: masters m\<^sub>2) (* pop *)
             apply (symbolic_execution masters: masters m\<^sub>2) (* pop *)
             apply (symbolic_execution masters: masters m\<^sub>2) (* pop *)
             apply (symbolic_execution masters: masters m\<^sub>2) (* pop *)
             apply (symbolic_execution masters: masters m\<^sub>2) (* pop *)
             apply (symbolic_execution masters: masters m\<^sub>2) (* pop *)
             apply (symbolic_execution masters: masters m\<^sub>2) (* ret *)
             apply (finish_symbolic_execution masters: masters m\<^sub>2)

            (* je .label_23 not taken *)
            apply restart_symbolic_execution
            (* .... *)

           (* ja .label_27 not taken *)
           apply restart_symbolic_execution
           (* .... *)

          (* je .label_29 not taken *)
          apply restart_symbolic_execution
          apply (symbolic_execution masters: masters m\<^sub>2) (* mov *)
          apply (symbolic_execution masters: masters m\<^sub>2) (* mov *)
          apply (symbolic_execution masters: masters m\<^sub>2) (* mov *)
          apply (symbolic_execution masters: masters m\<^sub>2) (* mov *)
          (* .... *)

         (* jbe .label_19 not taken *)
         apply restart_symbolic_execution
         apply (symbolic_execution masters: masters m\<^sub>2) (* cmp *)
         apply (symbolic_execution masters: masters m\<^sub>2 del: imp_disjL) (* ja .label_24 *)
         (* .... *)

        (* je .label_28 not taken *)
        apply restart_symbolic_execution
        apply (symbolic_execution masters: masters m\<^sub>2) (* mov *)
        apply (symbolic_execution masters: masters m\<^sub>2) (* mov *)
        apply (symbolic_execution masters: masters m\<^sub>2) (* add *)
        apply (symbolic_execution masters: masters m\<^sub>2) (* mov *)
        apply (symbolic_execution masters: masters m\<^sub>2) (* pop *)
        apply (symbolic_execution masters: masters m\<^sub>2) (* pop *)
        apply (symbolic_execution masters: masters m\<^sub>2) (* pop *)
        apply (symbolic_execution masters: masters m\<^sub>2) (* pop *)
        apply (symbolic_execution masters: masters m\<^sub>2) (* pop *)
        apply (symbolic_execution masters: masters m\<^sub>2) (* pop *)
        apply (symbolic_execution masters: masters m\<^sub>2) (* ret *)
        apply (finish_symbolic_execution masters: masters m\<^sub>2)
        done
    qed
    done
qed

end

end
