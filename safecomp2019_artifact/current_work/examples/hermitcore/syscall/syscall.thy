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
theory syscall
  imports "../../../isabelle/Presimplified_Semantics_Manual2"
          "HOL-Library.Rewrite"
          reassembly_setup.Abstract_System
          reassembly_setup.Det_Step
begin

text \<open>Load the \texttt{syscall.s} file.\<close>
x86_64_parser "../examples/hermitcore/syscall/syscall.s"

text \<open>
  A Floyd invariant is a partial map from locations to state predicates.
  A location consists of an address which stores the current text section and the program
  counter.
\<close>
type_synonym floyd_invar = \<open>64 word \<rightharpoonup> (state \<Rightarrow> bool)\<close>

text \<open>
  A locale building a context for syscall.s. This locale can be auto-generated.
\<close>
locale syscall_context = syscall + presimplified_semantics
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
fun syscall_flag_annotation :: flag_annotation where
  \<open>syscall_flag_annotation loc = (if loc \<in> {
    boffset + 42,
    boffset + 61,
    boffset + 417,
    boffset + 428,
    boffset + 474,
    boffset + 576,
    boffset + 944,
    boffset + 1000,
    boffset + 1411,
    boffset + 1476,
    boffset + 1537,
    boffset + 1651,
    boffset + 1700,
    boffset + 1781,
    boffset + 1883,
    boffset + 2155,
    boffset + 2185,
    boffset + 2196,
    boffset + 2235,
    boffset + 2244,
    boffset + 2274,
    boffset + 2323,
    boffset + 2334,
    boffset + 2361,
    boffset + 2396,
    boffset + 2407,
    boffset + 2445,
    boffset + 2456,
    boffset + 2497,
    boffset + 2508,
    boffset + 2547,
    boffset + 2556,
    boffset + 2591,
    boffset + 2640,
    boffset + 2651,
    boffset + 2678,
    boffset + 2713,
    boffset + 2724,
    boffset + 2767,
    boffset + 2778,
    boffset + 2819,
    boffset + 2830,
    boffset + 2876,
    boffset + 2887
  } then {flag_zf} else if loc \<in> {
    boffset + 194,
    boffset + 297,
    boffset + 710,
    boffset + 884
  } then {flag_cf, flag_zf} else if loc \<in> {
    boffset + 170,
    boffset + 273,
    boffset + 536,
    boffset + 641,
    boffset + 840,
    boffset + 1096,
    boffset + 1169,
    boffset + 1205,
    boffset + 1266,
    boffset + 1319,
    boffset + 1351,
    boffset + 1501,
    boffset + 1601,
    boffset + 1843,
    boffset + 1956,
    boffset + 2092
  } then {flag_sf} else if loc \<in> {
    boffset + 890
  } then {flag_zf, flag_sf, flag_of} else if loc \<in> {
    boffset + 1286
  } then {flag_cf} else if loc \<in> {
    boffset + 2129
  } then {flag_sf, flag_of} else {})\<close>

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
         \<sigma> = exec_instr \<alpha> semantics syscall_flag_annotation i s \<sigma>
    in
      Some ((), \<sigma>)\<close>

lemma wps_stepI[wps_intros]:
  assumes \<open>
    let  pc = regs \<sigma> rip;
         index = the (instr_index lookup_table boffset pc) in
    let' (_, i, s) = text_sections \<alpha>!index;
         \<sigma> = exec_instr \<alpha> semantics syscall_flag_annotation i s \<sigma>
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
