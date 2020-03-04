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
theory Leviathan_Setup
  imports "../isabelle/Chum_Rewriting"
keywords
      "x86_64_parser" :: thy_decl
  and "label_simp_rules" :: thy_goal
begin

text \<open>Open the x86-64 assembly parser.\<close>
ML_file "x86_64.grm.sig"
ML_file "x86_64.grm.sml"
ML_file "x86_64.lex.sml"

text \<open>Open the embedding of the parsed ML datastructure into Isabelle/HOL.\<close>
ML_file "x86_64_parser.ML"

text \<open>
  Set up the simplifier.
  This actually already happens in Memory_Rewriting. However, sometimes this doesn't carry over
  when that file is included. I have no idea what is going on then, but for certainty, redo this.
\<close>

declare write_block.simps[simp del]
declare write_bytes.simps[simp del]
declare write_blocks.simps(2)[simp del]
declare read_bytes.simps(2)[simp del]
declare cat_bytes.simps(2)[simp del]

declare take_bits_dereference_bit8[simp add]
declare take_bits_dereference_bit32[simp add]
declare rewrite_cat_bytes_to_take_bits[simp add]
declare take_bits_cat_bytes[simp add]
declare sextend.simps[simp del]

context execution_context
begin

declare exec_instr.simps[simp del]

text \<open>Fixing up master blocks rules\<close>

lemma master_blocks_implies_sep':
  assumes \<open>seps blocks\<close>
      and \<open>master blocks (a, s) i\<close>
      and \<open>master blocks (b, s') i'\<close>
      and \<open>i \<noteq> i'\<close>
      and \<open>a = a'\<close>
      and \<open>b = b'\<close>
    shows \<open>(a', s) \<bowtie> (b', s')\<close>
  using assms master_blocks_implies_sep
  by blast

lemma master_block_implies_no_block_overflow':
  assumes \<open>master blocks (a, s) i\<close>
    and \<open>a = a'\<close>
  shows \<open>no_block_overflow (a', s)\<close>
  using assms
  unfolding seps_def master_def
  by (auto simp add: case_prod_unfold)

lemma master_blocks_implies_not_enclosed':
  assumes \<open>seps blocks\<close>
      and \<open>master blocks (a, s) i\<close>
      and \<open>master blocks (b, s') i'\<close>
      and \<open>s > 0\<close>
      and \<open>s' > 0\<close>
      and \<open>i \<noteq> i'\<close>
     and \<open>a = a'\<close>
    and \<open>b = b'\<close>
    shows \<open>\<not> (a', s) \<sqsubseteq> (b', s')\<close>
proof -
  have \<open>(a, s) \<bowtie> (b, s')\<close>
    using assms master_blocks_implies_sep
    by auto
  thus ?thesis
    using sep_implies_not_enclosed assms
    unfolding master_def
    by auto
qed

lemmas sep_enclosed_simps' =
  master_blocks_implies_sep'
  master_block_implies_no_block_overflow'
  master_blocks_implies_not_enclosed'

lemmas simp_rules = assembly.defs(1) data_section.defs(1) text_section.defs(1) Let_def
                    Suc3_eq_add_3  semantics.defs(1)
                    incr_pc_def apply_binop_def jmp_def case_prod_unfold
                    take_rev drop_rev ucast_id
                    get_set_rewrite_rules sep_enclosed_simps'
                    memory_read_rewrite_rules memory_write_rewrite_rules
                    bit_vector_simps algebra_simps(1-9,11-)

lemma sep_not_reflexive[simp]:
  assumes \<open>master blocks (a, s) i\<close>
    and \<open>0 < s\<close>
  shows \<open>\<not> (a, s) \<bowtie> (a, s)\<close>
  using assms master_def sep_implies_not_enclosed
  by fastforce


lemma master_block_in_array: \<comment> \<open>Doesn't work as a simp rule but can be used with subst/rule\<close>
  assumes \<open>\<forall>i<n. master blocks (w + i, s) j\<close>
    and \<open>k < n\<close>
    and \<open>x = w + k\<close>
  shows \<open>master blocks (x, s) j\<close>
  using assms
  by blast

method rewrite_one_let' uses add del =
  (* First, rewrite the first let' *)
  (simp add: add simp_rules del: del cong: Let'_weak_cong)?,
  (* This may produce '-versions of functions, which should be substituted by their original *)
  (subst get'_def)?, (subst set'_def)?, (subst write_block'_def)?, (subst read_region'_def)?, (subst bv_cat'_def)?,
  (* Unfold the rewritten let' *)
  subst inline_Let',
  (* If the rewritten let' contained an if statement, split the goal *)
  ((rule ifI | rule conjI | rule impI)+)?,
  (* Some cleaning up of the entire goal *)
  (simp_all only: nat_to_numeral if_not_true not_True_eq_False simp_Let'_mem simp_Let'_mem2)?
  (* TODO: (simp_all del: del)?*)

method rewrite_one_instruction uses add del masters a =
  (* Unfold the let' that instructs to fetch the next instruction *)
  rewrite_one_let' add: exec_assembly_def add del: del,
  (* Unfold the assembly definition to fetch the next instruction *)
  rewrite_one_let' add: a add del: del,
  (* Unfold exec_instr to start execution of the instruction *)
  rewrite_one_let' add: exec_instr.simps del: del,
  (* Add the master-knowledge to the current goal *)
  insert masters,
  (* Do rewriting of let's *)
  (rewrite_one_let' add: add del: del)+,
  (* Remove the master-knowledge from the current goal *)
  (thin_tac \<open>master _ _ _\<close>)+


ML \<open>
val fail_on_multiple_subgoals_tac =
  COND (fn st => Thm.nprems_of st > 1) no_tac all_tac
\<close>

method rewrite_one_instruction' uses add del masters a =
  determ \<open>rewrite_one_instruction add: add del: del masters: masters a: a\<close>,
  tactic fail_on_multiple_subgoals_tac

ML \<open>
local

fun mk_schematic_goal_for_label_index l =
  let val l'  = if String.isPrefix "." l then String.extract (l,1,NONE) else l in
    (((Binding.make ("index_of_" ^ l', Position.none))  , [[Token.make_string ("simp", Position.none)]]), [("label_to_index \<alpha> ''" ^ l ^ "'' = ?x" ^ l', [])])
  end

fun mk_schematic_goal_for_label_address l =
  let val l'  = if String.isPrefix "." l then String.extract (l,1,NONE) else l in
    (((Binding.make ("address_of_" ^ l', Position.none))  , [[Token.make_string ("simp", Position.none)]]
        ), [("label_to_address l \<alpha> ''" ^ l ^ "'' = ?y" ^ l', [])])
  end

fun parse_list f = Parse.$$$ "[" |-- Parse.!!! (Parse.list f --|  Parse.$$$ "]")

fun theorem spec descr =
  Outer_Syntax.local_theory_to_proof' spec ("state " ^ descr)
    (parse_list (Parse.string) >> (fn (labels) =>
      let val (long, binding, includes, elems, concl) = (false, Binding.empty_atts, [], [Element.Fixes [], Element.Assumes []],
                                                          Element.Shows (map mk_schematic_goal_for_label_index labels @
                                                                          map mk_schematic_goal_for_label_address labels))
           in
      (Specification.schematic_theorem_cmd long Thm.theoremK NONE (K I) binding includes elems concl)
      end
    ));

val _ = theorem @{command_keyword label_simp_rules} "label_simp_rules";

in end\<close>

end
end
