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
theory tasks
  imports "../../../isabelle/Presimplified_Semantics_Manual2"
          "HOL-Library.Rewrite"
          reassembly_setup.Abstract_System
          reassembly_setup.Det_Step
begin

text \<open>Load the \texttt{tasks.s} file.\<close>
x86_64_parser "../examples/hermitcore/tasks/tasks.s"

text \<open>
  A Floyd invariant is a partial map from locations to state predicates.
  A location consists of an address which stores the current text section and the program
  counter.
\<close>
type_synonym floyd_invar = \<open>64 word \<rightharpoonup> (state \<Rightarrow> bool)\<close>

text \<open>
  A locale building a context for tasks.s. This locale can be auto-generated.
\<close>
locale tasks_context = tasks + presimplified_semantics
begin

abbreviation \<open>\<alpha> \<equiv> assembly\<close>

lemma binary_offset[simp]:
  shows \<open>binary_offset assembly = boffset\<close>
  by (simp add: assembly_def assembly.defs)

schematic_goal unfold_labels[simp]:
  shows \<open>label_to_address assembly = ?x\<close>
  apply (rule ext)
  apply (unfold label_to_address_def)
  apply (unfold binary_offset)
  by (auto simp add: label_to_address_def assembly_def assembly.defs)

text \<open>Generated automatically for cmp and test\<close>
fun tasks_flag_annotation :: flag_annotation where
  \<open>tasks_flag_annotation loc = (if loc \<in> {
    boffset + 20,
    boffset + 53,
    boffset + 86,
    boffset + 115,
    boffset + 151,
    boffset + 162,
    boffset + 171,
    boffset + 182,
    boffset + 195,
    boffset + 325,
    boffset + 336,
    boffset + 366,
    boffset + 396,
    boffset + 752,
    boffset + 859,
    boffset + 870,
    boffset + 892,
    boffset + 934,
    boffset + 942,
    boffset + 1012,
    boffset + 1021,
    boffset + 1162,
    boffset + 1261,
    boffset + 1689,
    boffset + 1758,
    boffset + 1822,
    boffset + 1831,
    boffset + 2162
  } then {flag_zf} else if loc \<in> {
    boffset + 882,
    boffset + 1652,
    boffset + 1777
  } then {flag_cf, flag_zf} else {})\<close>

text \<open>
  The step function fetches the next instruction and executes it.
  This matches exactly what method \texttt{rewrite\_one\_instruction} is able
  to rewrite.
\<close>
definition step :: \<open>(unit, state) se\<close> where
  \<open>step \<sigma> \<equiv>
    let  pc = regs \<sigma> rip;
         index = the (instr_index lookup_table boffset pc) in
    let' (_, i, s) = text_sections \<alpha>!index;
         \<sigma> = exec_instr \<alpha> semantics tasks_flag_annotation i s \<sigma>
    in
      Some ((), \<sigma>)\<close>

lemma wps_stepI[wps_intros]:
  assumes \<open>
    let  pc = regs \<sigma> rip;
         index = the (instr_index lookup_table boffset pc) in
    let' (_, i, s) = text_sections \<alpha>!index;
         \<sigma> = exec_instr \<alpha> semantics tasks_flag_annotation i s \<sigma>
    in
      Q () \<sigma>\<close>
  shows \<open>wps step Q \<sigma>\<close>
  using assms
  unfolding step_def
  by (auto simp add: Let'_def Let_def wps_def)

definition wf_state :: \<open>state \<Rightarrow> bool\<close> where
  \<open>wf_state _ = True\<close>
declare wf_state_def[simp]

definition at_offset :: \<open>64 word \<Rightarrow> state \<Rightarrow> bool\<close> where
  \<open>at_offset n \<sigma> \<equiv> regs \<sigma> rip = boffset + n\<close>
declare at_offset_def[simp]

(* interpretation until_ret: *)
sublocale cfg_system step \<open>at_offset ret_address\<close> wf_state get_rip
  by standard (simp add: det_system.is_weak_invar_def)

section \<open>Possibly unnecessary\<close>
definition at_offsets :: \<open>64 word set \<Rightarrow> state \<Rightarrow> bool\<close> where
  \<open>at_offsets N \<sigma> \<equiv> \<exists>n\<in>N. at_offset n \<sigma>\<close>
declare at_offsets_def[simp]

lemma at_offset_OR_at_offset:
  \<open>(at_offset n || at_offset m) = at_offsets {n, m}\<close>
  unfolding pred_OR_def at_offsets_def
  by auto

lemma at_offset_OR_at_offsets:
  \<open>(at_offset n || at_offsets N) = at_offsets ({n} \<union> N)\<close>
  unfolding pred_OR_def at_offsets_def
  by auto

lemma at_offsets_OR_at_offsets:
  \<open>(at_offsets N || at_offsets M) = at_offsets (N \<union> M)\<close>
  unfolding pred_OR_def at_offsets_def
  by auto

lemma at_offsets_OR_at_offset:
  \<open>(at_offsets N || at_offset n) = at_offsets (N \<union> {n})\<close>
  unfolding pred_OR_def at_offsets_def
  by auto

lemmas at_offset_simps = at_offset_OR_at_offset at_offset_OR_at_offsets at_offsets_OR_at_offsets at_offsets_OR_at_offset insert_commute

section \<open>Symbolic Execution\<close>

method symbolic_execution uses masters add del =
  rule wps_rls,
  simp (no_asm_simp) add: add step_def lookup_table_def instr_index_def entry_size_def del: del,
  rewrite_one_let' del: del add: add assembly_def,
  simp add: exec_instr_def,
  subst presimplify,
  rewrite_one_let' del: del add: add,
  subst is_manual,
  (insert masters)[1],
  (rewrite_one_let' del: del add: add)+,
  ((thin_tac \<open>master _ _ _\<close>)+)?,
  rule linvar_unfoldI,
  simp (no_asm_simp) add: spec_of_outside add del: del

method restart_symbolic_execution uses add del =
  (rewrite_one_let' add: add del: del)+,
  (thin_tac \<open>master _ _ _\<close>)+,
  rule linvar_unfoldI,
  simp (no_asm_simp) add: spec_of_outside add del: del
|
  ((thin_tac \<open>master _ _ _\<close>)+)?,
  rule linvar_unfoldI,
  simp (no_asm_simp) add: spec_of_outside add del: del

method finish_symbolic_execution uses masters add del =
  insert masters,
  simp add: simp_rules add del: del,
  (rewrite_one_let' add: add del: del)+,
  (simp add: simp_rules add: add del: del)?,
  ((thin_tac \<open>master _ _ _\<close>)+)?

section \<open>Additional lemmas\<close>
lemma floyd_invarI':
  assumes \<open>pp_\<Theta> (regs \<sigma> rip) = Some \<phi>\<close>
    and \<open>\<phi> \<sigma>\<close>
  shows \<open>floyd.invar ret_address pp_\<Theta> \<sigma>\<close>
proof -
  have 1: \<open>floyd.isys.is_result ret_address pp_\<Theta> \<sigma> (Some \<sigma>)\<close>
    using assms(1)
    by (auto simp add: floyd.isys.is_result_def floyd.has_invar_def linvar_def split: option.splits)
  hence \<open>The (floyd.isys.is_result ret_address pp_\<Theta> \<sigma>) = Some \<sigma>\<close>
    using floyd.isys.result_determ
      theI_unique[of \<open>floyd.isys.is_result ret_address pp_\<Theta> \<sigma>\<close>]
    by (auto split: option.splits simp add: floyd.invar_def floyd.isys.yields'_def)
  thus ?thesis
    using assms(1,2)
    apply (auto simp add: floyd.invar_def floyd.isys.yields'_def linvar_def split: option.splits)
    using 1
    by metis
qed

end

end
