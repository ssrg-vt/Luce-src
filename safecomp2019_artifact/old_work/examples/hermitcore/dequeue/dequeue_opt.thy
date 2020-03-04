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
theory dequeue_opt
  imports reassembly_all_execution_debug.Leviathan_Setup
          reassembly_all_execution_debug.More_Eisbach_Tools
          "HOL-Library.Rewrite"
          "../../../isabelle/Monads/Abstract_System"
begin

fun memcpy :: \<open>state \<Rightarrow> state\<close> where
  \<open>memcpy \<sigma> = (let
    \<comment> \<open>Write RDX bytes from RSI to RDI, return RDI; behavior undefined if either pointer is null\<close>
    dest\<^sub>p\<^sub>t\<^sub>r = regs \<sigma> rdi;
    src\<^sub>p\<^sub>t\<^sub>r = regs \<sigma> rsi;
    count = regs \<sigma> rdx;
    bytes = if src\<^sub>p\<^sub>t\<^sub>r = 0 then undefined::64 word else \<sigma> \<turnstile> *[src\<^sub>p\<^sub>t\<^sub>r, unat count];
            \<comment> \<open>Assuming count is \<le> 8 for now until we get a proper pointer-range
               setup; this is extra hacky as the new setup doesn't restrict to 64 word anymore but
               we need to know the word size here for type consistency.\<close>
    newmem = if dest\<^sub>p\<^sub>t\<^sub>r = 0 then
      undefined
    else
      write_block (dest\<^sub>p\<^sub>t\<^sub>r \<rhd> rev (\<lbrace>unat count-1,0\<rbrace>bytes)) (mem \<sigma>)
  in \<sigma>\<lparr>
    mem := newmem,
    regs := (regs \<sigma>)(rax := dest\<^sub>p\<^sub>t\<^sub>r)
  \<rparr>)\<close>

(*5 flags generation CF,SF,OF,ZF,PF *)
instruction_semantics_parser "../InstructionSemantics/strata_rules_5flags"   
lemmas strata_rules_5flags.semantics_def[code]         


text \<open>
  A Floyd invariant is a partial map from locations to state predicates.
  A location consists of a tuple (ts, pc) which stores the current text section and the program
  counter.
\<close>
type_synonym floyd_invar = \<open>(int \<times> int) \<rightharpoonup> (state \<Rightarrow> bool)\<close>

text \<open>Load the \texttt{dequeue\_opt.s} file.\<close>
x86_64_parser "../examples/hermitcore/dequeue/dequeue_opt.s"

lemmas dequeue_opt.assembly_def[code]

text \<open>
  We use a locale to quantify over any @{term l}, i.e, any assignment of addresses to labels.
  This locale extends the locale generated by the parser.
\<close>
locale assembly = dequeue_opt + execution_context + strata_rules_5flags +
  assumes \<alpha>_def: \<open>\<alpha> \<equiv> assembly\<close>
      and memcpy[simp]: \<open>funcs ''memcpy'' \<equiv> Some memcpy\<close>
begin

lemma unfold_\<alpha>[simp]:
  shows \<open>text_sections \<alpha> = text_sections assembly\<close>
    and \<open>data_sections \<alpha> = data_sections assembly\<close>
    and \<open>labels_to_addresses \<alpha> = labels_to_addresses assembly\<close>
    and \<open>labels_to_indices \<alpha> = labels_to_indices assembly\<close>
  unfolding \<alpha>_def
  by simp+

label_simp_rules [".label_14", (* dequeue_init *)
    ".label_15", ".label_16", ".label_17", (* dequeue_push *)
    ".label_18", ".label_19", ".label_20"] (* dequeue_pop *)
  by (auto simp add: label_to_index_def label_to_address_def assembly_def assembly.defs(1) text_section.defs(1))

schematic_goal unfold_semantics:
  shows \<open>instr_semantics semantics instr_sig = ?x\<close>
  by (simp add: semantics_def simp_rules)

fun dequeue_opt_flag_annotation :: flag_annotation where
  \<open>dequeue_opt_flag_annotation _ = {}\<close>

text \<open>
  The step function fetches the next instruction and executes it.
  This matches exactly what method rewrite\_one\_instruction is able to rewrite.
  Need to switch to learned semantics rather than manual eventually?
\<close>
definition step :: \<open>(unit, state) se\<close> where
  \<open>step \<sigma> \<equiv>
    let' t = text_sections \<alpha>!(nat (ts \<sigma>));
         i = instructions t!(nat (pc \<sigma>));
         \<sigma> = exec_instr dequeue_opt_flag_annotation semantics i \<sigma>
    in
      Some ((), \<sigma>)\<close>


lemma wps_stepI[wps_intros]:
  assumes \<open>let' t = text_sections \<alpha>!(nat (ts \<sigma>));
                i = instructions t!(nat (pc \<sigma>));
                \<sigma> = exec_instr dequeue_opt_flag_annotation semantics i \<sigma>
           in
             Q () \<sigma>\<close>
  shows \<open>wps step Q \<sigma>\<close>
  using assms
  unfolding step_def
  by (auto simp add: Let'_def Let_def wps_def)

definition wf_state :: \<open>state \<Rightarrow> bool\<close> where
  \<open>wf_state _ = True\<close>

definition location :: \<open>state \<Rightarrow> int \<times> int\<close> where
  \<open>location \<sigma> \<equiv> (ts \<sigma>, pc \<sigma>)\<close>

definition until :: \<open>(int \<times> int) set \<Rightarrow> state \<Rightarrow> bool\<close>
  where \<open>until H \<sigma> \<equiv> \<exists>(ts\<^sub>H, pc\<^sub>H) \<in> H. location \<sigma> = (ts\<^sub>H, pc\<^sub>H - 1)\<close>

abbreviation \<open>RDI \<sigma> \<equiv> regs \<sigma> rdi\<close>
abbreviation \<open>RSI \<sigma> \<equiv> regs \<sigma> rsi\<close>
abbreviation \<open>RSP \<sigma> \<equiv> regs \<sigma> rsp\<close>

text \<open>
   suggested @{text \<open>(sublist n m xs = []) = (Suc m \<le> n \<or> length xs \<le> n)\<close>} for efficiency, but
  that unfortunately doesn't work.
\<close>
lemma sublist_empty: (* TODO: move elsewhere eventually *)
  assumes \<open>n \<ge> length xs\<close>
    and \<open>m \<ge> length xs\<close>
  shows \<open>sublist n m xs = []\<close>
  using assms unfolding sublist_def
  by simp

end

declare plus_less_left_cancel_nowrap[simp add]
lemma x_less_x_plus_y[simp]:
  fixes x y :: \<open>'a::len word\<close>
  assumes \<open>x \<le> max_word - y\<close>
  shows \<open>x \<le> x + y\<close>
  apply (rule plus_minus_no_overflow_ab[of x "max_word::'a::len word" y,OF assms])
  by auto
lemma x_plus_y_less_x[simp]:
  fixes x y :: \<open>'a::len word\<close>
  assumes \<open>x \<le> max_word - y\<close>
    and \<open>y > 0\<close>
  shows \<open>x + y \<le> x \<longleftrightarrow> False\<close>
  using assms x_less_x_plus_y
  by fastforce
lemma less_max_word_minus[simp]:
  fixes x y z :: \<open>'a::len word\<close>
  assumes \<open>x \<le> max_word - y\<close>
     and \<open>y \<ge> z\<close>
   shows \<open>x \<le> max_word - z\<close>
  apply (rule order_trans[OF assms(1)])
  using assms
  by simp
lemma plus_lt_left_cancel_nowrap[simp]: \<open>x \<le> x + y' \<Longrightarrow> x \<le> x + y \<Longrightarrow> x + y' < x + y \<longleftrightarrow> y' < y\<close>
  for x y y' :: \<open>'a::len0 word\<close>
  by uint_arith
lemma plus_lt_right_cancel_nowrap[simp]: \<open>x \<le> x + y' \<Longrightarrow> x \<le> x + y \<Longrightarrow> y' + x < y + x \<longleftrightarrow> y' < y\<close>
  for x y y' :: \<open>'a::len0 word\<close>
  by uint_arith
lemma x_lt_x_plus_y[simp]:
  fixes x y :: \<open>'a::len word\<close>
  assumes \<open>x \<le> max_word - y\<close>
    shows \<open>x < x + y \<longleftrightarrow> y > 0\<close>
proof -
  have \<open>x \<le> x + y\<close>
    apply (rule plus_minus_no_overflow_ab[of x \<open>max_word::'a::len word\<close> y, OF assms(1)])
    by auto
  thus ?thesis
    apply (auto simp add: word_le_less_eq)
    by uint_arith
qed

context execution_context
begin

lemmas sub_overflow_flag_simps[simp] =
  sub_overflow_flag_def[of 0 0]
  sub_overflow_flag_def[of 0 1]
  sub_overflow_flag_def[of 0 \<open>numeral m\<close>]
  sub_overflow_flag_def[of 1 0]
  sub_overflow_flag_def[of 1 1]
  sub_overflow_flag_def[of 1 \<open>numeral m\<close>]
  sub_overflow_flag_def[of \<open>numeral n\<close> 0]
  sub_overflow_flag_def[of \<open>numeral n\<close> 1]
  sub_overflow_flag_def[of \<open>numeral n\<close> \<open>numeral m\<close>]
  for n m

lemmas sub_sign_flag_simps[simp] =
  sub_sign_flag_def[of 0 0]
  sub_sign_flag_def[of 0 1]
  sub_sign_flag_def[of 0 \<open>numeral m\<close>]
  sub_sign_flag_def[of 1 0]
  sub_sign_flag_def[of 1 1]
  sub_sign_flag_def[of 1 \<open>numeral m\<close>]
  sub_sign_flag_def[of \<open>numeral n\<close> 0]
  sub_sign_flag_def[of \<open>numeral n\<close> 1]
  sub_sign_flag_def[of \<open>numeral n\<close> \<open>numeral m\<close>]
  for n m
end

end
