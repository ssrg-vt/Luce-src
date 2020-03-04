(*
Copyright 2019

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
theory simple
  imports "../../isabelle/VCG/HTriple"
begin

locale "simple" = execution_context + exec_code +
  assumes fetch:
    "fetch 0x5fa \<equiv> (Unary (IS_8088 Push) (Storage (Reg (General SixtyFour rbp))), 1)"
    "fetch 0x5fb \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour rbp)) (Storage (Reg (General SixtyFour rsp))), 3)"
    "fetch 0x5fe \<equiv> (Binary (IS_8088 Mov) (Memory ThirtyTwo (A_SizeDirective 32 (A_Minus (A_FromReg (General SixtyFour rbp)) (A_WordConstant 4)))) (Storage (Reg (General ThirtyTwo rdi))), 3)"
    "fetch 0x601 \<equiv> (Binary (IS_8088 Mov) (Memory SixtyFour (A_SizeDirective 64 (A_Minus (A_FromReg (General SixtyFour rbp)) (A_WordConstant 16)))) (Storage (Reg (General SixtyFour rsi))), 4)"
    "fetch 0x605 \<equiv> (Binary (IS_8088 Mov) (Reg (General ThirtyTwo rax)) (Storage (Memory ThirtyTwo (A_SizeDirective 32 (A_Minus (A_FromReg (General SixtyFour rbp)) (A_WordConstant 4))))), 3)"
    "fetch 0x608 \<equiv> (Nullary (IS_X86_64 Cdqe), 2)"
    "fetch 0x60a \<equiv> (Binary (IS_8088 Shl) (Reg (General SixtyFour rax)) (Immediate SixtyFour (ImmVal 3)), 4)"
    "fetch 0x60e \<equiv> (Binary (IS_8088 Lea) (Reg (General SixtyFour rdx)) (Storage (Memory SixtyFour (A_Minus (A_FromReg (General SixtyFour rax)) (A_WordConstant 8)))), 4)"
    "fetch 0x612 \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour rax)) (Storage (Memory SixtyFour (A_SizeDirective 64 (A_Minus (A_FromReg (General SixtyFour rbp)) (A_WordConstant 16))))), 4)"
    "fetch 0x616 \<equiv> (Binary (IS_8088 Add) (Reg (General SixtyFour rax)) (Storage (Reg (General SixtyFour rdx))), 3)"
    "fetch 0x619 \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour rax)) (Storage (Memory SixtyFour (A_SizeDirective 64 (A_FromReg (General SixtyFour rax))))), 3)"
    "fetch 0x61c \<equiv> (Binary (IS_80386 Movzx) (Reg (General ThirtyTwo rax)) (Storage (Memory Eight (A_SizeDirective 8 (A_FromReg (General SixtyFour rax))))), 3)"
    "fetch 0x61f \<equiv> (Binary (IS_80386 Movsx) (Reg (General ThirtyTwo rax)) (Storage (Reg (General Eight rax))), 3)"
    "fetch 0x622 \<equiv> (Unary (IS_8088 Pop) (Storage (Reg (General SixtyFour rbp))), 1)"
    "fetch 0x623 \<equiv> (Nullary (IS_8088 Ret), 1)"
    "fetch 0x624 \<equiv> (Unary (IS_8088 Nop) (Storage (Memory Sixteen (A_SizeDirective 16 (A_Plus (A_FromReg (General SixtyFour cs)) (A_Plus (A_FromReg (General SixtyFour rax)) (A_Plus (A_Mult 1 (A_FromReg (General SixtyFour rax))) (A_WordConstant 0))))))), 10)"
    "fetch 0x62e \<equiv> (Binary (IS_8088 Xchg) (Reg (General Sixteen rax)) (Storage (Reg (General Sixteen rax))), 5)"
    and \<alpha>_def: \<open>\<alpha> = \<lparr>text_sections = [], data_sections = [], labels_to_offsets = [], binary_offset = 0\<rparr>\<close>
begin

text \<open>Using definitions that don't get unfolded immediately prevents locale argument issues.\<close>

text \<open>
  Going with a binary offset of 0 for now to make things easier. (We do want to keep that field
  around, though, for future more generic usage.)
\<close>
lemma \<alpha>_boffset[simp]: \<open>binary_offset \<alpha> = 0\<close>
  unfolding \<alpha>_def
  by simp

named_theorems blocks and Ps and Qs

method step uses add del =
  subst exec_block.simps,
  rewrite_one_let',
  rewrite_one_let' add: fetch,
  rewrite_one_let',
  auto simp add: simp_rules Let'_def read_region'_def write_block'_def get'_def set'_def step_def exec_instr_def presimplify add numeral_2_eq_2[symmetric] simp del: del

method steps uses pre post regionset add del =
  auto simp: pred_logic pre regionset,
  (step add: add del: del)+,
  (auto simp add: eq_def)[1],
  auto simp: block_usage_def eq_def setcc_def cmovcc_def if'_then_else_def sub_sign_flag_def simp_rules numeral_2_eq_2[symmetric] Let'_def read_region'_def write_block'_def get'_def set'_def post regionset

(* ((simp add: assms pred_logic Ps Qs)+)? helps keep goals clean but causes issues when there are subcalls *)
method vcg_step uses assms =
  ((rule htriples)+, rule blocks)+,
  (simp add: assms pred_logic Ps Qs)?,
  (((auto simp: eq_def)[])+)?

text \<open>For @{const CASES}.\<close>
method vcg_step' uses assms =
  (rule htriples)+,
  simp,
  ((rule htriples)+, rule blocks)+,
  (simp add: assms pred_logic Ps Qs)?,
  (((auto simp: eq_def)[])+)?

text \<open>
  Sometimes needs to be moved down (close to the abstract code) to avoid TERM exceptions,
  haven't figured out the cause.
  Also haven't settled on a proper setup for the ending methods,
  there are troubles when nested loops and such are involved.
\<close>
method vcg_while for P :: state_pred uses assms =
  ((rule htriples)+)?,
  rule HTriple_weaken[where P=P],
  simp add: pred_logic Ps Qs assms,
  rule HTriple_while,
  (vcg_step assms: assms)+,
  (simp add: pred_logic Ps Qs)+,
  (
    (vcg_step' assms: assms | vcg_step assms: assms)+,
    ((simp add: assms)+)?
  )?

method vcg uses acode assms =
  subst acode,
  (vcg_step assms: assms)+

end

locale "main" = "simple" +
  fixes RAX\<^sub>0\<^sub>v RDX\<^sub>0\<^sub>v RDI\<^sub>0\<^sub>v RSI\<^sub>0\<^sub>v RSP\<^sub>0\<^sub>v RBP\<^sub>0\<^sub>v ret_address\<^sub>v :: \<open>64 word\<close>
begin

text \<open>Using definitions that don't get unfolded immediately prevents locale argument issues.\<close>
definition \<open>RAX\<^sub>0 \<equiv> RAX\<^sub>0\<^sub>v\<close>
definition \<open>RDX\<^sub>0 \<equiv> RDX\<^sub>0\<^sub>v\<close>
definition \<open>RDI\<^sub>0 \<equiv> RDI\<^sub>0\<^sub>v\<close>
definition \<open>RSI\<^sub>0 \<equiv> RSI\<^sub>0\<^sub>v\<close>
definition \<open>RSP\<^sub>0 \<equiv> RSP\<^sub>0\<^sub>v\<close>
definition \<open>RBP\<^sub>0 \<equiv> RBP\<^sub>0\<^sub>v\<close>
definition \<open>ret_address \<equiv> ret_address\<^sub>v\<close>

definition P_0x5fa_0 :: state_pred where
  \<open>P_0x5fa_0 \<sigma> \<equiv> RIP \<sigma> = 0x5fa \<and> RAX \<sigma> = RAX\<^sub>0 \<and> RDX \<sigma> = RDX\<^sub>0 \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = RSP\<^sub>0 \<and> RBP \<sigma> = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address\<close>
declare P_0x5fa_0_def[Ps]

definition P_0x5fa_0_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x5fa_0_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (2, ((RSP\<^sub>0::64 word) - 0xc), 4),
    (3, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (4, ((((RSI\<^sub>0::64 word) + ((ucast (((sextend (ucast ((\<langle>31,0\<rangle>RDI\<^sub>0::32 word))) 32 64::64 word)::64 word))::64 word) << 3))::64 word) - 0x8), 8),
    (5, (\<sigma> \<turnstile> *[((((RSI\<^sub>0::64 word) + ((ucast (((sextend (ucast ((\<langle>31,0\<rangle>RDI\<^sub>0::32 word))) 32 64::64 word)::64 word))::64 word) << 3))::64 word) - 0x8),8]::64 word), Suc 0)
  }\<close>

definition P_0x5fa_0_regions :: state_pred where
  \<open>P_0x5fa_0_regions \<sigma> \<equiv> \<exists>regions. P_0x5fa_0_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_ret_address_0 :: state_pred where
  \<open>Q_ret_address_0 \<sigma> \<equiv> RIP \<sigma> = ret_address \<and> RAX \<sigma> = ucast ((\<langle>31,0\<rangle>(sextend (ucast ((\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((((RSI\<^sub>0::64 word) + ((ucast (((sextend (ucast ((\<langle>31,0\<rangle>RDI\<^sub>0::32 word))) 32 64::64 word)::64 word))::64 word) << 3))::64 word) - 0x8),8]::64 word),1]::8 word))) 8 32::32 word)::32 word)) \<and> RDX \<sigma> = ((((ucast (((sextend (ucast ((\<langle>31,0\<rangle>RDI\<^sub>0::32 word))) 32 64::64 word)::64 word))::64 word) << 3)::64 word) - 0x8) \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) + 0x8) \<and> RBP \<sigma> = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xc),4]::32 word) = ucast ((\<langle>31,0\<rangle>RDI\<^sub>0::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RSI\<^sub>0 \<and> (\<sigma> \<turnstile> *[((((RSI\<^sub>0::64 word) + ((ucast (((sextend (ucast ((\<langle>31,0\<rangle>RDI\<^sub>0::32 word))) 32 64::64 word)::64 word))::64 word) << 3))::64 word) - 0x8),8]::64 word) = (\<sigma> \<turnstile> *[((((RSI\<^sub>0::64 word) + ((ucast (((sextend (ucast ((\<langle>31,0\<rangle>RDI\<^sub>0::32 word))) 32 64::64 word)::64 word))::64 word) << 3))::64 word) - 0x8),8]::64 word) \<and> (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((((RSI\<^sub>0::64 word) + ((ucast (((sextend (ucast ((\<langle>31,0\<rangle>RDI\<^sub>0::32 word))) 32 64::64 word)::64 word))::64 word) << 3))::64 word) - 0x8),8]::64 word),1]::8 word) = ucast ((\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((((RSI\<^sub>0::64 word) + ((ucast (((sextend (ucast ((\<langle>31,0\<rangle>RDI\<^sub>0::32 word))) 32 64::64 word)::64 word))::64 word) << 3))::64 word) - 0x8),8]::64 word),1]::8 word))\<close>
declare Q_ret_address_0_def[Qs]

schematic_goal main_0_15_0x5fa_0x623_0[blocks]:
  assumes \<open>(P_0x5fa_0 && P_0x5fa_0_regions) \<sigma>\<close>
  shows \<open>exec_block 15 0x623 0 \<sigma> \<triangleq> ?\<sigma> \<and> Q_ret_address_0 ?\<sigma> \<and> block_usage P_0x5fa_0_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x5fa_0_def P_0x5fa_0_regions_def post: Q_ret_address_0_def regionset: P_0x5fa_0_regions_set_def)

definition main_acode :: ACode where
  \<open>main_acode =
    Block 15 0x623 0
  \<close>

schematic_goal "main":
  \<open>{{?P}} main_acode {{?Q;?M}}\<close>
  by (vcg acode: main_acode_def)

end

end
