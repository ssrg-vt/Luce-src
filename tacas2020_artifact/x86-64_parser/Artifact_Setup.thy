(*

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

theory Artifact_Setup
  imports "../isabelle/Chum_Rewriting" 
(*keywords
      "x86_64_parser" :: thy_decl 
*)
begin

(*
text \<open>Open the x86-64 assembly parser.\<close>
ML_file "x86_64.grm.sig"
ML_file "x86_64.grm.sml"
ML_file "x86_64.lex.sml"

ML_file "x86_64_parser.ML"
*)

text \<open>
  Set up the simplifier.
  Some of this actually already happens in Memory_Rewriting. However, sometimes this doesn't carry over
  when that file is included. I have no idea what is going on then, but for certainty, redo this.
\<close>
declare bv_cat.simps[simp del]
declare sep.simps[simp del]
declare enclosed.simps(1)[simp del]
declare write_block.simps[simp del]
declare write_bytes.simps[simp del]
declare write_blocks.simps(2)[simp del]
declare merge_blocks.simps[simp del]
declare read_bytes.simps(2)[simp del]
declare cat_bytes.simps(2)[simp del]

declare take_bits_bitAND[simp add]
declare take_bits_bitOR[simp add]
declare take_bits_bitXOR[simp add]
declare take_bits_of_take_bits[simp add]
declare take_bits_dereference_bit8[simp add]
declare take_bits_dereference_bit32[simp add]
declare rewrite_byte_of_to_take_bits[simp add]
declare rewrite_cat_bytes_to_take_bits[simp add]
declare take_bits_cat_bytes[simp add]
declare sextend.simps[simp del]

declare bv_cat.simps[simp del]
declare bv_slice.simps[simp del]

declare linorder_class.not_le[simp add]
declare word_le_minus_mono_left[simp add]


context execution_context
begin

(* TO BE MERGED *)

(* ALSO: simplify incr_rip without set *)
lemma master_blocks_implies_sep':
  assumes "seps blocks"
      and "master blocks a i"
      and "master blocks b i'"
      and "i \<noteq> i'"
    shows "a \<bowtie> b"
  using assms master_blocks_implies_sep
  by auto


lemma sep_reflexive_only_when_empty:
  assumes "master blocks a i"
  shows "(a \<bowtie> a) = (snd a = 0)"
  using assms
  apply (cases a, auto simp add: sep.simps master_def no_block_overflow.simps)
  apply unat_arith
  by (auto simp add: unat_of_nat)

lemmas sep_enclosed_simps' =
  master_blocks_implies_sep'
  master_block_implies_no_block_overflow
  master_blocks_implies_not_enclosed
  master_blocks_implies_enclosed
  sep_reflexive_only_when_empty




lemma ucast_bitOR[simp]:
  shows "ucast (a OR b) = ucast a OR ucast b"
  apply (intro word_eqI)
  by (auto simp add: word_size nth_ucast test_bit_of_take_bits word_ao_nth)

lemma ucast_bitAND[simp]:
  shows "ucast (a AND b) = ucast a AND ucast b"
  apply (intro word_eqI)
  by (auto simp add: word_size nth_ucast test_bit_of_take_bits word_ao_nth)

lemma ucast_bitXOR[simp]:
  shows "ucast (a XOR b) = ucast a XOR ucast b"
  apply (intro word_eqI)
  by (auto simp add: word_size nth_ucast test_bit_of_take_bits bitXOR_nth)

(* END TO BE MERGED *)

declare sf_eq_of_iff_le[simp add]
declare bit_vector_simps[simp add]

lemmas simp_rules = assembly.defs(1) Let_def
                    Suc3_eq_add_3  semantics.defs(1)
                    incr_rip_def apply_binop_def jmp_def case_prod_unfold
                    take_rev drop_rev ucast_id
                    get_set_rewrite_rules sep_enclosed_simps'
                    memory_read_rewrite_rules memory_write_rewrite_rules nth_ucast
                    algebra_simps

method rewrite_one_let' uses add del =
  (
     (* First, rewrite the first let' *)
     (simp (no_asm_simp) add: add simp_rules del: del imp_disjL cong: Let'_weak_cong)?,
     (* This may produce '-versions of functions, which should be substituted by their original *)
     (subst get'_def)?, (subst set'_def)?, (subst write_block'_def)?, (subst read_region'_def)?,
     (* Unfold the rewritten let' *)
     subst inline_Let',
     (* If the rewritten let' contained an if statement, split the goal *)
     ((rule ifI | rule conjI | rule impI)+)?,
     (* Some cleaning up of the entire goal *)
     (simp_all (no_asm_simp) only: nat_to_numeral if_not_true not_True_eq_False simp_Let'_mem simp_Let'_mem2 case_prod_unfold)?
   )



method_setup determ =
  \<open>Method.text_closure >> (fn (text) => fn ctxt => fn using => fn st =>
    Seq.DETERM (Method.evaluate_runtime text ctxt using) st)\<close>





abbreviation \<open>EDI \<sigma> \<equiv> \<langle>31,0\<rangle>regs \<sigma> rdi :: 32 word\<close>
abbreviation \<open>DL \<sigma> \<equiv> \<langle>7,0\<rangle>regs \<sigma> rdi :: 8 word\<close>
abbreviation \<open>RDX \<sigma> \<equiv> regs \<sigma> rdx\<close>
abbreviation \<open>EDX \<sigma> \<equiv> \<langle>31,0\<rangle>regs \<sigma> rdx :: 32 word\<close>
abbreviation \<open>DX \<sigma> \<equiv> \<langle>15,0\<rangle>regs \<sigma> rdx :: 16 word\<close>
abbreviation \<open>RDI \<sigma> \<equiv> regs \<sigma> rdi\<close>
abbreviation \<open>RSI \<sigma> \<equiv> regs \<sigma> rsi\<close>
abbreviation \<open>RCX \<sigma> \<equiv> regs \<sigma> rcx\<close>
abbreviation \<open>ECX \<sigma> \<equiv> \<langle>31,0\<rangle>regs \<sigma> rcx :: 32 word\<close>
abbreviation \<open>ESI \<sigma> \<equiv> \<langle>31,0\<rangle>regs \<sigma> rsi :: 32 word\<close>
abbreviation \<open>RBP \<sigma> \<equiv> regs \<sigma> rbp\<close>
abbreviation \<open>RIP \<sigma> \<equiv> regs \<sigma> rip\<close>
abbreviation \<open>RSP \<sigma> \<equiv> regs \<sigma> rsp\<close>
abbreviation \<open>RAX \<sigma> \<equiv> regs \<sigma> rax\<close>
abbreviation \<open>AX \<sigma> \<equiv> \<langle>15,0\<rangle>regs \<sigma> rax :: 16 word\<close>
abbreviation \<open>EAX \<sigma> \<equiv> \<langle>31,0\<rangle>regs \<sigma> rax :: 32 word\<close>
abbreviation \<open>RBX \<sigma> \<equiv> \<langle>63,0\<rangle>regs \<sigma> rbx :: 64 word\<close>
abbreviation \<open>BL \<sigma> \<equiv> \<langle>7,0\<rangle>regs \<sigma> rbx :: 8 word\<close>
abbreviation \<open>DS \<sigma> \<equiv> regs \<sigma> ds\<close>
abbreviation \<open>FS \<sigma> \<equiv> regs \<sigma> fs\<close>
abbreviation \<open>R8 \<sigma> \<equiv> regs \<sigma> r8\<close>
abbreviation \<open>R9 \<sigma> \<equiv> regs \<sigma> r9\<close>
abbreviation \<open>R10 \<sigma> \<equiv> regs \<sigma> r10\<close>
abbreviation \<open>R11 \<sigma> \<equiv> regs \<sigma> r11\<close>
abbreviation \<open>R12 \<sigma> \<equiv> regs \<sigma> r12\<close>
abbreviation \<open>R13 \<sigma> \<equiv> regs \<sigma> r13\<close>
abbreviation \<open>R14 \<sigma> \<equiv> regs \<sigma> r14\<close>
abbreviation \<open>R15 \<sigma> \<equiv> regs \<sigma> r15\<close>

end

end
