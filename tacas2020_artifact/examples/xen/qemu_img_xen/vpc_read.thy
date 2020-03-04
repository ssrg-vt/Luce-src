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
theory vpc_read
  imports "../../../isabelle/VCG/HTriple"
    begin

locale "qemu_img_xen" = execution_context + exec_code +
  fixes bdrv_pread_0xb13d_retval\<^sub>v rep_stos_ESRDI_RAX_0xb1a4_retval\<^sub>v bdrv_pread_addr rep_stos_ESRDI_RAX_addr :: \<open>64 word\<close>
    and bdrv_pread_acode rep_stos_ESRDI_RAX_acode :: ACode
  assumes fetch:
    "fetch 0xb0a0 \<equiv> (Unary (IS_8088 Push) (Storage (Reg (General SixtyFour r15))), 2)"
    "fetch 0xb0a2 \<equiv> (Unary (IS_8088 Push) (Storage (Reg (General SixtyFour r14))), 2)"
    "fetch 0xb0a4 \<equiv> (Unary (IS_8088 Push) (Storage (Reg (General SixtyFour r13))), 2)"
    "fetch 0xb0a6 \<equiv> (Unary (IS_8088 Push) (Storage (Reg (General SixtyFour r12))), 2)"
    "fetch 0xb0a8 \<equiv> (Unary (IS_8088 Push) (Storage (Reg (General SixtyFour rbp))), 1)"
    "fetch 0xb0a9 \<equiv> (Unary (IS_8088 Push) (Storage (Reg (General SixtyFour rbx))), 1)"
    "fetch 0xb0aa \<equiv> (Binary (IS_8088 Sub) (Reg (General SixtyFour rsp)) (Immediate SixtyFour (ImmVal 8)), 4)"
    "fetch 0xb0ae \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour r12)) (Storage (Memory SixtyFour (A_SizeDirective 64 (A_Plus (A_FromReg (General SixtyFour rdi)) (A_WordConstant 64))))), 4)"
    "fetch 0xb0b2 \<equiv> (Binary (IS_8088 Test) (Reg (General ThirtyTwo rcx)) (Storage (Reg (General ThirtyTwo rcx))), 2)"
    "fetch 0xb0b4 \<equiv> (Unary (IS_8088 Jle) (Immediate SixtyFour (ImmVal 45408)), 6)"
    "fetch 0xb0ba \<equiv> (Binary (IS_8088 Lea) (Reg (General ThirtyTwo rbx)) (Storage (Memory SixtyFour (A_Minus (A_FromReg (General SixtyFour rcx)) (A_WordConstant 1)))), 3)"
    "fetch 0xb0bd \<equiv> (Binary (IS_8088 Shl) (Reg (General SixtyFour rsi)) (Immediate SixtyFour (ImmVal 9)), 4)"
    "fetch 0xb0c1 \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour r13)) (Storage (Reg (General SixtyFour rdi))), 3)"
    "fetch 0xb0c4 \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour r15)) (Storage (Reg (General SixtyFour rdx))), 3)"
    "fetch 0xb0c7 \<equiv> (Binary (IS_8088 Add) (Reg (General SixtyFour rbx)) (Immediate SixtyFour (ImmVal 1)), 4)"
    "fetch 0xb0cb \<equiv> (Binary (IS_8088 Sub) (Reg (General SixtyFour rsi)) (Storage (Reg (General SixtyFour rdx))), 3)"
    "fetch 0xb0ce \<equiv> (Binary (IS_8088 Xor) (Reg (General ThirtyTwo r14)) (Storage (Reg (General ThirtyTwo r14))), 3)"
    "fetch 0xb0d1 \<equiv> (Binary (IS_8088 Shl) (Reg (General SixtyFour rbx)) (Immediate SixtyFour (ImmVal 9)), 4)"
    "fetch 0xb0d5 \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour rbp)) (Storage (Reg (General SixtyFour rsi))), 3)"
    "fetch 0xb0d8 \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour rsi)) (Storage (Reg (General SixtyFour r12))), 3)"
    "fetch 0xb0db \<equiv> (Binary (IS_8088 Add) (Reg (General SixtyFour rbx)) (Storage (Reg (General SixtyFour rdx))), 3)"
    "fetch 0xb0de \<equiv> (Unary (IS_8088 Jmp) (Immediate SixtyFour (ImmVal 45296)), 2)"
    "fetch 0xb0e0 \<equiv> (Binary (IS_8088 Add) (Reg (General SixtyFour r15)) (Immediate SixtyFour (ImmVal 512)), 7)"
    "fetch 0xb0e7 \<equiv> (Binary (IS_8088 Cmp) (Reg (General SixtyFour r15)) (Storage (Reg (General SixtyFour rbx))), 3)"
    "fetch 0xb0ea \<equiv> (Unary (IS_8088 Je) (Immediate SixtyFour (ImmVal 45408)), 2)"
    "fetch 0xb0ec \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour rsi)) (Storage (Memory SixtyFour (A_SizeDirective 64 (A_Plus (A_FromReg (General SixtyFour r13)) (A_WordConstant 64))))), 4)"
    "fetch 0xb0f0 \<equiv> (Binary (IS_8088 Mov) (Reg (General ThirtyTwo rcx)) (Storage (Memory ThirtyTwo (A_SizeDirective 32 (A_Plus (A_FromReg (General SixtyFour rsi)) (A_WordConstant 560))))), 6)"
    "fetch 0xb0f6 \<equiv> (Binary (IS_8088 Lea) (Reg (General SixtyFour rax)) (Storage (Memory SixtyFour (A_Plus (A_FromReg (General SixtyFour r15)) (A_Mult 1 (A_FromReg (General SixtyFour rbp)))))), 4)"
    "fetch 0xb0fa \<equiv> (Binary (IS_8088 Xor) (Reg (General ThirtyTwo rdx)) (Storage (Reg (General ThirtyTwo rdx))), 2)"
    "fetch 0xb0fc \<equiv> (Unary (IS_8088 Div) (Storage (Reg (General SixtyFour rcx))), 3)"
    "fetch 0xb0ff \<equiv> (Binary (IS_8088 Shr) (Reg (General SixtyFour rdx)) (Immediate SixtyFour (ImmVal 9)), 4)"
    "fetch 0xb103 \<equiv> (Binary (IS_8088 Cmp) (Memory ThirtyTwo (A_SizeDirective 32 (A_Plus (A_FromReg (General SixtyFour rsi)) (A_WordConstant 528)))) (Storage (Reg (General ThirtyTwo rax))), 6)"
    "fetch 0xb109 \<equiv> (Unary (IS_8088 Jbe) (Immediate SixtyFour (ImmVal 45432)), 2)"
    "fetch 0xb10b \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour rcx)) (Storage (Memory SixtyFour (A_SizeDirective 64 (A_Plus (A_FromReg (General SixtyFour rsi)) (A_WordConstant 536))))), 7)"
    "fetch 0xb112 \<equiv> (Binary (IS_8088 Mov) (Reg (General ThirtyTwo rax)) (Storage (Reg (General ThirtyTwo rax))), 2)"
    "fetch 0xb114 \<equiv> (Binary (IS_8088 Mov) (Reg (General ThirtyTwo rcx)) (Storage (Memory ThirtyTwo (A_SizeDirective 32 (A_Plus (A_FromReg (General SixtyFour rcx)) (A_Mult 4 (A_FromReg (General SixtyFour rax))))))), 3)"
    "fetch 0xb117 \<equiv> (Binary (IS_8088 Cmp) (Reg (General ThirtyTwo rcx)) (Immediate SixtyFour (ImmVal 4294967295)), 3)"
    "fetch 0xb11a \<equiv> (Unary (IS_8088 Je) (Immediate SixtyFour (ImmVal 45432)), 2)"
    "fetch 0xb11c \<equiv> (Binary (IS_8088 Mov) (Reg (General ThirtyTwo rsi)) (Storage (Memory ThirtyTwo (A_SizeDirective 32 (A_Plus (A_FromReg (General SixtyFour rsi)) (A_WordConstant 564))))), 6)"
    "fetch 0xb122 \<equiv> (Binary (IS_8088 Shl) (Reg (General SixtyFour rdx)) (Immediate SixtyFour (ImmVal 9)), 4)"
    "fetch 0xb126 \<equiv> (Binary (IS_8088 Shl) (Reg (General SixtyFour rcx)) (Immediate SixtyFour (ImmVal 9)), 4)"
    "fetch 0xb12a \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour rdi)) (Storage (Memory SixtyFour (A_SizeDirective 64 (A_FromReg (General SixtyFour r12))))), 4)"
    "fetch 0xb12e \<equiv> (Binary (IS_8088 Add) (Reg (General SixtyFour rdx)) (Storage (Reg (General SixtyFour rsi))), 3)"
    "fetch 0xb131 \<equiv> (Binary (IS_8088 Lea) (Reg (General SixtyFour rsi)) (Storage (Memory SixtyFour (A_Plus (A_FromReg (General SixtyFour rdx)) (A_Mult 1 (A_FromReg (General SixtyFour rcx)))))), 4)"
    "fetch 0xb135 \<equiv> (Binary (IS_8088 Mov) (Reg (General ThirtyTwo rcx)) (Immediate SixtyFour (ImmVal 512)), 5)"
    "fetch 0xb13a \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour rdx)) (Storage (Reg (General SixtyFour r15))), 3)"
    "fetch 0xb13d \<equiv> (Unary (IS_8088 Call) (Immediate SixtyFour (ImmLabel ''bdrv_pread'')), 5)"
    "fetch 0xb142 \<equiv> (Binary (IS_8088 Cmp) (Reg (General ThirtyTwo rax)) (Immediate SixtyFour (ImmVal 512)), 5)"
    "fetch 0xb147 \<equiv> (Unary (IS_8088 Je) (Immediate SixtyFour (ImmVal 45280)), 2)"
    "fetch 0xb149 \<equiv> (Binary (IS_8088 Add) (Reg (General SixtyFour rsp)) (Immediate SixtyFour (ImmVal 8)), 4)"
    "fetch 0xb14d \<equiv> (Binary (IS_8088 Mov) (Reg (General ThirtyTwo rax)) (Immediate SixtyFour (ImmVal 4294967295)), 5)"
    "fetch 0xb152 \<equiv> (Unary (IS_8088 Pop) (Storage (Reg (General SixtyFour rbx))), 1)"
    "fetch 0xb153 \<equiv> (Unary (IS_8088 Pop) (Storage (Reg (General SixtyFour rbp))), 1)"
    "fetch 0xb154 \<equiv> (Unary (IS_8088 Pop) (Storage (Reg (General SixtyFour r12))), 2)"
    "fetch 0xb156 \<equiv> (Unary (IS_8088 Pop) (Storage (Reg (General SixtyFour r13))), 2)"
    "fetch 0xb158 \<equiv> (Unary (IS_8088 Pop) (Storage (Reg (General SixtyFour r14))), 2)"
    "fetch 0xb15a \<equiv> (Unary (IS_8088 Pop) (Storage (Reg (General SixtyFour r15))), 2)"
    "fetch 0xb15c \<equiv> (Nullary (IS_8088 Ret), 1)"
    "fetch 0xb15d \<equiv> (Unary (IS_8088 Nop) (Storage (Memory ThirtyTwo (A_SizeDirective 32 (A_FromReg (General SixtyFour rax))))), 3)"
    "fetch 0xb160 \<equiv> (Binary (IS_8088 Add) (Reg (General SixtyFour rsp)) (Immediate SixtyFour (ImmVal 8)), 4)"
    "fetch 0xb164 \<equiv> (Binary (IS_8088 Xor) (Reg (General ThirtyTwo rax)) (Storage (Reg (General ThirtyTwo rax))), 2)"
    "fetch 0xb166 \<equiv> (Unary (IS_8088 Pop) (Storage (Reg (General SixtyFour rbx))), 1)"
    "fetch 0xb167 \<equiv> (Unary (IS_8088 Pop) (Storage (Reg (General SixtyFour rbp))), 1)"
    "fetch 0xb168 \<equiv> (Unary (IS_8088 Pop) (Storage (Reg (General SixtyFour r12))), 2)"
    "fetch 0xb16a \<equiv> (Unary (IS_8088 Pop) (Storage (Reg (General SixtyFour r13))), 2)"
    "fetch 0xb16c \<equiv> (Unary (IS_8088 Pop) (Storage (Reg (General SixtyFour r14))), 2)"
    "fetch 0xb16e \<equiv> (Unary (IS_8088 Pop) (Storage (Reg (General SixtyFour r15))), 2)"
    "fetch 0xb170 \<equiv> (Nullary (IS_8088 Ret), 1)"
    "fetch 0xb171 \<equiv> (Unary (IS_8088 Nop) (Storage (Memory ThirtyTwo (A_SizeDirective 32 (A_Plus (A_FromReg (General SixtyFour rax)) (A_WordConstant 0))))), 7)"
    "fetch 0xb178 \<equiv> (Binary (IS_8088 Lea) (Reg (General SixtyFour rdi)) (Storage (Memory SixtyFour (A_Plus (A_FromReg (General SixtyFour r15)) (A_WordConstant 8)))), 4)"
    "fetch 0xb17c \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour rcx)) (Storage (Reg (General SixtyFour r15))), 3)"
    "fetch 0xb17f \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour rax)) (Storage (Reg (General SixtyFour r14))), 3)"
    "fetch 0xb182 \<equiv> (Binary (IS_8088 Mov) (Memory SixtyFour (A_SizeDirective 64 (A_FromReg (General SixtyFour r15)))) (Immediate SixtyFour (ImmVal 0)), 7)"
    "fetch 0xb189 \<equiv> (Binary (IS_8088 Mov) (Memory SixtyFour (A_SizeDirective 64 (A_Plus (A_FromReg (General SixtyFour r15)) (A_WordConstant 504)))) (Immediate SixtyFour (ImmVal 0)), 11)"
    "fetch 0xb194 \<equiv> (Binary (IS_8088 And) (Reg (General SixtyFour rdi)) (Immediate SixtyFour (ImmVal 18446744073709551608)), 4)"
    "fetch 0xb198 \<equiv> (Binary (IS_8088 Sub) (Reg (General SixtyFour rcx)) (Storage (Reg (General SixtyFour rdi))), 3)"
    "fetch 0xb19b \<equiv> (Binary (IS_8088 Add) (Reg (General ThirtyTwo rcx)) (Immediate SixtyFour (ImmVal 512)), 6)"
    "fetch 0xb1a1 \<equiv> (Binary (IS_8088 Shr) (Reg (General ThirtyTwo rcx)) (Immediate SixtyFour (ImmVal 3)), 3)"
    "fetch 0xb1a4 \<equiv> (Unary (IS_8088 Call) (Immediate SixtyFour (ImmLabel ''rep_stos_ESRDI_RAX'')), 3)"
    "fetch 0xb1a7 \<equiv> (Unary (IS_8088 Jmp) (Immediate SixtyFour (ImmVal 45280)), 5)"
    and \<alpha>_def: \<open>\<alpha> = \<lparr>text_sections = [], data_sections = [], labels_to_offsets = [], binary_offset = 0\<rparr>\<close>
    and bdrv_pread\<^sub>a\<^sub>d\<^sub>d\<^sub>r[simp]: \<open>the (label_to_address \<alpha> ''bdrv_pread'') = bdrv_pread_addr\<close>
    and rep_stos_ESRDI_RAX\<^sub>a\<^sub>d\<^sub>d\<^sub>r[simp]: \<open>the (label_to_address \<alpha> ''rep_stos_ESRDI_RAX'') = rep_stos_ESRDI_RAX_addr\<close>
begin

text \<open>Using definitions that don't get unfolded immediately prevents locale argument issues.\<close>
definition \<open>bdrv_pread_0xb13d_retval \<equiv> bdrv_pread_0xb13d_retval\<^sub>v\<close>
definition \<open>rep_stos_ESRDI_RAX_0xb1a4_retval \<equiv> rep_stos_ESRDI_RAX_0xb1a4_retval\<^sub>v\<close>

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

locale "vpc_read" = "qemu_img_xen" +
  fixes RAX\<^sub>0\<^sub>v RBX\<^sub>0\<^sub>v RCX\<^sub>0\<^sub>v RDX\<^sub>0\<^sub>v RDI\<^sub>0\<^sub>v RSI\<^sub>0\<^sub>v RSP\<^sub>0\<^sub>v RBP\<^sub>0\<^sub>v R15\<^sub>0\<^sub>v R14\<^sub>0\<^sub>v R13\<^sub>0\<^sub>v R12\<^sub>0\<^sub>v ret_address\<^sub>v :: \<open>64 word\<close>
begin

text \<open>Using definitions that don't get unfolded immediately prevents locale argument issues.\<close>
definition \<open>RAX\<^sub>0 \<equiv> RAX\<^sub>0\<^sub>v\<close>
definition \<open>RBX\<^sub>0 \<equiv> RBX\<^sub>0\<^sub>v\<close>
definition \<open>RCX\<^sub>0 \<equiv> RCX\<^sub>0\<^sub>v\<close>
definition \<open>RDX\<^sub>0 \<equiv> RDX\<^sub>0\<^sub>v\<close>
definition \<open>RDI\<^sub>0 \<equiv> RDI\<^sub>0\<^sub>v\<close>
definition \<open>RSI\<^sub>0 \<equiv> RSI\<^sub>0\<^sub>v\<close>
definition \<open>RSP\<^sub>0 \<equiv> RSP\<^sub>0\<^sub>v\<close>
definition \<open>RBP\<^sub>0 \<equiv> RBP\<^sub>0\<^sub>v\<close>
definition \<open>R15\<^sub>0 \<equiv> R15\<^sub>0\<^sub>v\<close>
definition \<open>R14\<^sub>0 \<equiv> R14\<^sub>0\<^sub>v\<close>
definition \<open>R13\<^sub>0 \<equiv> R13\<^sub>0\<^sub>v\<close>
definition \<open>R12\<^sub>0 \<equiv> R12\<^sub>0\<^sub>v\<close>
definition \<open>ret_address \<equiv> ret_address\<^sub>v\<close>

definition P_0xb0a0_0 :: state_pred where
  \<open>P_0xb0a0_0 \<sigma> \<equiv> RIP \<sigma> = 0xb0a0 \<and> RAX \<sigma> = RAX\<^sub>0 \<and> RBX \<sigma> = RBX\<^sub>0 \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = RDX\<^sub>0 \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = RSP\<^sub>0 \<and> RBP \<sigma> = RBP\<^sub>0 \<and> R15 \<sigma> = R15\<^sub>0 \<and> R14 \<sigma> = R14\<^sub>0 \<and> R13 \<sigma> = R13\<^sub>0 \<and> R12 \<sigma> = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address\<close>
declare P_0xb0a0_0_def[Ps]

definition P_0xb0a0_0_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0xb0a0_0_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((RDI\<^sub>0::64 word) + 0x40), 8),
    (2, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x30), 8)
  }\<close>

definition P_0xb0a0_0_regions :: state_pred where
  \<open>P_0xb0a0_0_regions \<sigma> \<equiv> \<exists>regions. P_0xb0a0_0_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0xb0b4_0 :: state_pred where
  \<open>Q_0xb0b4_0 \<sigma> \<equiv> RIP \<sigma> = 0xb0b4 \<and> RAX \<sigma> = RAX\<^sub>0 \<and> RBX \<sigma> = RBX\<^sub>0 \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = RDX\<^sub>0 \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x38) \<and> RBP \<sigma> = RBP\<^sub>0 \<and> R15 \<sigma> = R15\<^sub>0 \<and> R14 \<sigma> = R14\<^sub>0 \<and> R13 \<sigma> = R13\<^sub>0 \<and> R12 \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0\<close>
declare Q_0xb0b4_0_def[Qs]

schematic_goal vpc_read_0_9_0xb0a0_0xb0b2_0[blocks]:
  assumes \<open>(P_0xb0a0_0 && P_0xb0a0_0_regions) \<sigma>\<close>
  shows \<open>exec_block 9 0xb0b2 0 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0xb0b4_0 ?\<sigma> \<and> block_usage P_0xb0a0_0_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0xb0a0_0_def P_0xb0a0_0_regions_def post: Q_0xb0b4_0_def regionset: P_0xb0a0_0_regions_set_def)

definition P_0xb0b4_true_1 :: state_pred where
  \<open>P_0xb0b4_true_1 \<sigma> \<equiv> RIP \<sigma> = 0xb0b4 \<and> RAX \<sigma> = RAX\<^sub>0 \<and> RBX \<sigma> = RBX\<^sub>0 \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = RDX\<^sub>0 \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x38) \<and> RBP \<sigma> = RBP\<^sub>0 \<and> R15 \<sigma> = R15\<^sub>0 \<and> R14 \<sigma> = R14\<^sub>0 \<and> R13 \<sigma> = R13\<^sub>0 \<and> R12 \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0\<close>
declare P_0xb0b4_true_1_def[Ps]

definition P_0xb0b4_true_1_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0xb0b4_true_1_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((RDI\<^sub>0::64 word) + 0x40), 8),
    (2, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x30), 8)
  }\<close>

definition P_0xb0b4_true_1_regions :: state_pred where
  \<open>P_0xb0b4_true_1_regions \<sigma> \<equiv> \<exists>regions. P_0xb0b4_true_1_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_ret_address_1 :: state_pred where
  \<open>Q_ret_address_1 \<sigma> \<equiv> RIP \<sigma> = ret_address \<and> RBX \<sigma> = RBX\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) + 0x8) \<and> RBP \<sigma> = RBP\<^sub>0 \<and> R15 \<sigma> = R15\<^sub>0 \<and> R14 \<sigma> = R14\<^sub>0 \<and> R13 \<sigma> = R13\<^sub>0 \<and> R12 \<sigma> = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0\<close>
declare Q_ret_address_1_def[Qs]

schematic_goal vpc_read_0_10_0xb0b4_0xb170_1[blocks]:
  assumes \<open>(P_0xb0b4_true_1 && P_0xb0b4_true_1_regions && jle) \<sigma>\<close>
  shows \<open>exec_block 10 0xb170 (Suc 0) \<sigma> \<triangleq> ?\<sigma> \<and> Q_ret_address_1 ?\<sigma> \<and> block_usage P_0xb0b4_true_1_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0xb0b4_true_1_def P_0xb0b4_true_1_regions_def post: Q_ret_address_1_def regionset: P_0xb0b4_true_1_regions_set_def)

definition P_0xb0b4_false_2 :: state_pred where
  \<open>P_0xb0b4_false_2 \<sigma> \<equiv> RIP \<sigma> = 0xb0b4 \<and> RAX \<sigma> = RAX\<^sub>0 \<and> RBX \<sigma> = RBX\<^sub>0 \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = RDX\<^sub>0 \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x38) \<and> RBP \<sigma> = RBP\<^sub>0 \<and> R15 \<sigma> = R15\<^sub>0 \<and> R14 \<sigma> = R14\<^sub>0 \<and> R13 \<sigma> = R13\<^sub>0 \<and> R12 \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0\<close>
declare P_0xb0b4_false_2_def[Ps]

definition P_0xb0b4_false_2_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0xb0b4_false_2_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((RDI\<^sub>0::64 word) + 0x40), 8),
    (2, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x30), 8)
  }\<close>

definition P_0xb0b4_false_2_regions :: state_pred where
  \<open>P_0xb0b4_false_2_regions \<sigma> \<equiv> \<exists>regions. P_0xb0b4_false_2_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0xb0f0_2 :: state_pred where
  \<open>Q_0xb0f0_2 \<sigma> \<equiv> RIP \<sigma> = 0xb0f0 \<and> RBX \<sigma> = ((((ucast ((((ucast (((\<langle>31,0\<rangle>((RCX\<^sub>0::64 word) - 0x1)::32 word)::32 word))::64 word) + (0x1::64 word))::64 word))::64 word) << 9)::64 word) + RDX\<^sub>0) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x38) \<and> RBP \<sigma> = ((((ucast ((RSI\<^sub>0::64 word))::64 word) << 9)::64 word) - RDX\<^sub>0) \<and> R14 \<sigma> = 0x0 \<and> R13 \<sigma> = RDI\<^sub>0 \<and> R12 \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0\<close>
declare Q_0xb0f0_2_def[Qs]

schematic_goal vpc_read_0_13_0xb0b4_0xb0de_2[blocks]:
  assumes \<open>(P_0xb0b4_false_2 && P_0xb0b4_false_2_regions && ! jle) \<sigma>\<close>
  shows \<open>exec_block 13 0xb0de 2 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0xb0f0_2 ?\<sigma> \<and> block_usage P_0xb0b4_false_2_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0xb0b4_false_2_def P_0xb0b4_false_2_regions_def post: Q_0xb0f0_2_def regionset: P_0xb0b4_false_2_regions_set_def)

definition P_0xb0f0_3 :: state_pred where
  \<open>P_0xb0f0_3 \<sigma> \<equiv> RIP \<sigma> = 0xb0f0 \<and> RBX \<sigma> = ((((ucast ((((ucast (((\<langle>31,0\<rangle>((RCX\<^sub>0::64 word) - 0x1)::32 word)::32 word))::64 word) + (0x1::64 word))::64 word))::64 word) << 9)::64 word) + RDX\<^sub>0) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x38) \<and> RBP \<sigma> = ((((ucast ((RSI\<^sub>0::64 word))::64 word) << 9)::64 word) - RDX\<^sub>0) \<and> R14 \<sigma> = 0x0 \<and> R13 \<sigma> = RDI\<^sub>0 \<and> R12 \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0\<close>
declare P_0xb0f0_3_def[Ps]

definition P_0xb0f0_3_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0xb0f0_3_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((RSI \<sigma>::64 word) + 0x210), 4),
    (2, ((RSI \<sigma>::64 word) + 0x230), 4),
    (3, ((RDI\<^sub>0::64 word) + 0x40), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x30), 8)
  }\<close>

definition P_0xb0f0_3_regions :: state_pred where
  \<open>P_0xb0f0_3_regions \<sigma> \<equiv> \<exists>regions. P_0xb0f0_3_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0xb109_3 :: state_pred where
  \<open>Q_0xb109_3 \<sigma> \<equiv> RIP \<sigma> = 0xb109 \<and> RAX \<sigma> = ((ucast ((((R15 \<sigma>::64 word) + (\<langle>63,0\<rangle>((((((ucast ((RSI\<^sub>0::64 word))::64 word) << 9)::64 word) - RDX\<^sub>0)::64 word) * 0x1)::64 word))::64 word))::128 word) udiv (ucast (((\<sigma> \<turnstile> *[((RSI \<sigma>::64 word) + 0x230),4]::32 word)::32 word))::64 word)) \<and> RBX \<sigma> = ((((ucast ((((ucast (((\<langle>31,0\<rangle>((RCX\<^sub>0::64 word) - 0x1)::32 word)::32 word))::64 word) + (0x1::64 word))::64 word))::64 word) << 9)::64 word) + RDX\<^sub>0) \<and> RCX \<sigma> = ucast ((\<sigma> \<turnstile> *[((RSI \<sigma>::64 word) + 0x230),4]::32 word)) \<and> RDX \<sigma> = ((ucast ((((ucast ((((R15 \<sigma>::64 word) + (\<langle>63,0\<rangle>((((((ucast ((RSI\<^sub>0::64 word))::64 word) << 9)::64 word) - RDX\<^sub>0)::64 word) * 0x1)::64 word))::64 word))::128 word) umod (ucast (((\<sigma> \<turnstile> *[((RSI \<sigma>::64 word) + 0x230),4]::32 word)::32 word))::64 word))::64 word))::64 word) >> 9) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x38) \<and> RBP \<sigma> = ((((ucast ((RSI\<^sub>0::64 word))::64 word) << 9)::64 word) - RDX\<^sub>0) \<and> R14 \<sigma> = 0x0 \<and> R13 \<sigma> = RDI\<^sub>0 \<and> R12 \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSI \<sigma>::64 word) + 0x210),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSI \<sigma>::64 word) + 0x210),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSI \<sigma>::64 word) + 0x230),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSI \<sigma>::64 word) + 0x230),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0\<close>
declare Q_0xb109_3_def[Qs]

schematic_goal vpc_read_0_6_0xb0f0_0xb103_3[blocks]:
  assumes \<open>(P_0xb0f0_3 && P_0xb0f0_3_regions) \<sigma>\<close>
  shows \<open>exec_block 6 0xb103 3 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0xb109_3 ?\<sigma> \<and> block_usage P_0xb0f0_3_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0xb0f0_3_def P_0xb0f0_3_regions_def post: Q_0xb109_3_def regionset: P_0xb0f0_3_regions_set_def)

definition P_0xb109_true_4 :: state_pred where
  \<open>P_0xb109_true_4 \<sigma> \<equiv> RIP \<sigma> = 0xb109 \<and> RAX \<sigma> = ((ucast ((((R15 \<sigma>::64 word) + (\<langle>63,0\<rangle>((((((ucast ((RSI\<^sub>0::64 word))::64 word) << 9)::64 word) - RDX\<^sub>0)::64 word) * 0x1)::64 word))::64 word))::128 word) udiv (ucast (((\<sigma> \<turnstile> *[((RSI \<sigma>::64 word) + 0x230),4]::32 word)::32 word))::64 word)) \<and> RBX \<sigma> = ((((ucast ((((ucast (((\<langle>31,0\<rangle>((RCX\<^sub>0::64 word) - 0x1)::32 word)::32 word))::64 word) + (0x1::64 word))::64 word))::64 word) << 9)::64 word) + RDX\<^sub>0) \<and> RCX \<sigma> = ucast ((\<sigma> \<turnstile> *[((RSI \<sigma>::64 word) + 0x230),4]::32 word)) \<and> RDX \<sigma> = ((ucast ((((ucast ((((R15 \<sigma>::64 word) + (\<langle>63,0\<rangle>((((((ucast ((RSI\<^sub>0::64 word))::64 word) << 9)::64 word) - RDX\<^sub>0)::64 word) * 0x1)::64 word))::64 word))::128 word) umod (ucast (((\<sigma> \<turnstile> *[((RSI \<sigma>::64 word) + 0x230),4]::32 word)::32 word))::64 word))::64 word))::64 word) >> 9) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x38) \<and> RBP \<sigma> = ((((ucast ((RSI\<^sub>0::64 word))::64 word) << 9)::64 word) - RDX\<^sub>0) \<and> R14 \<sigma> = 0x0 \<and> R13 \<sigma> = RDI\<^sub>0 \<and> R12 \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSI \<sigma>::64 word) + 0x210),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSI \<sigma>::64 word) + 0x210),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSI \<sigma>::64 word) + 0x230),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSI \<sigma>::64 word) + 0x230),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0\<close>
declare P_0xb109_true_4_def[Ps]

definition P_0xb109_true_4_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0xb109_true_4_regions_set \<sigma> \<equiv> {
    (0, R15 \<sigma>, 8),
    (1, RSP\<^sub>0, 8),
    (2, ((RSI \<sigma>::64 word) + 0x210), 4),
    (3, ((RSI \<sigma>::64 word) + 0x230), 4),
    (4, ((R15 \<sigma>::64 word) + 0x1f8), 8),
    (5, ((RDI\<^sub>0::64 word) + 0x40), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (11, ((RSP\<^sub>0::64 word) - 0x30), 8)
  }\<close>

definition P_0xb109_true_4_regions :: state_pred where
  \<open>P_0xb109_true_4_regions \<sigma> \<equiv> \<exists>regions. P_0xb109_true_4_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0xb1a4_4 :: state_pred where
  \<open>Q_0xb1a4_4 \<sigma> \<equiv> RIP \<sigma> = 0xb1a4 \<and> RAX \<sigma> = 0x0 \<and> RBX \<sigma> = ((((ucast ((((ucast (((\<langle>31,0\<rangle>((RCX\<^sub>0::64 word) - 0x1)::32 word)::32 word))::64 word) + (0x1::64 word))::64 word))::64 word) << 9)::64 word) + RDX\<^sub>0) \<and> RCX \<sigma> = ucast (((ucast (((((\<langle>31,0\<rangle>((R15 \<sigma>::64 word) - ((((R15 \<sigma>::64 word) + 0x8)::64 word) AND 0xfffffffffffffff8))::32 word)::32 word) + 0x200)::32 word))::32 word) >> 3)) \<and> RDX \<sigma> = ((ucast ((((ucast ((((R15 \<sigma>::64 word) + (\<langle>63,0\<rangle>((((((ucast ((RSI\<^sub>0::64 word))::64 word) << 9)::64 word) - RDX\<^sub>0)::64 word) * 0x1)::64 word))::64 word))::128 word) umod (ucast (((\<sigma> \<turnstile> *[((RSI \<sigma>::64 word) + 0x230),4]::32 word)::32 word))::64 word))::64 word))::64 word) >> 9) \<and> RDI \<sigma> = ((((R15 \<sigma>::64 word) + 0x8)::64 word) AND 0xfffffffffffffff8) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x38) \<and> RBP \<sigma> = ((((ucast ((RSI\<^sub>0::64 word))::64 word) << 9)::64 word) - RDX\<^sub>0) \<and> R14 \<sigma> = 0x0 \<and> R13 \<sigma> = RDI\<^sub>0 \<and> R12 \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[R15 \<sigma>,8]::64 word) = 0x0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSI \<sigma>::64 word) + 0x210),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSI \<sigma>::64 word) + 0x210),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSI \<sigma>::64 word) + 0x230),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSI \<sigma>::64 word) + 0x230),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((R15 \<sigma>::64 word) + 0x1f8),8]::64 word) = 0x0 \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0\<close>
declare Q_0xb1a4_4_def[Qs]

schematic_goal vpc_read_0_10_0xb109_0xb1a1_4[blocks]:
  assumes \<open>(P_0xb109_true_4 && P_0xb109_true_4_regions && jbe) \<sigma>\<close>
  shows \<open>exec_block 10 0xb1a1 4 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0xb1a4_4 ?\<sigma> \<and> block_usage P_0xb109_true_4_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0xb109_true_4_def P_0xb109_true_4_regions_def post: Q_0xb1a4_4_def regionset: P_0xb109_true_4_regions_set_def)

definition P_0xb1a4_5 :: state_pred where
  \<open>P_0xb1a4_5 \<sigma> \<equiv> RIP \<sigma> = 0xb1a4 \<and> RAX \<sigma> = 0x0 \<and> RBX \<sigma> = ((((ucast ((((ucast (((\<langle>31,0\<rangle>((RCX\<^sub>0::64 word) - 0x1)::32 word)::32 word))::64 word) + (0x1::64 word))::64 word))::64 word) << 9)::64 word) + RDX\<^sub>0) \<and> RCX \<sigma> = ucast (((ucast (((((\<langle>31,0\<rangle>((R15 \<sigma>::64 word) - ((((R15 \<sigma>::64 word) + 0x8)::64 word) AND 0xfffffffffffffff8))::32 word)::32 word) + 0x200)::32 word))::32 word) >> 3)) \<and> RDX \<sigma> = ((ucast ((((ucast ((((R15 \<sigma>::64 word) + (\<langle>63,0\<rangle>((((((ucast ((RSI\<^sub>0::64 word))::64 word) << 9)::64 word) - RDX\<^sub>0)::64 word) * 0x1)::64 word))::64 word))::128 word) umod (ucast (((\<sigma> \<turnstile> *[((RSI \<sigma>::64 word) + 0x230),4]::32 word)::32 word))::64 word))::64 word))::64 word) >> 9) \<and> RDI \<sigma> = ((((R15 \<sigma>::64 word) + 0x8)::64 word) AND 0xfffffffffffffff8) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x38) \<and> RBP \<sigma> = ((((ucast ((RSI\<^sub>0::64 word))::64 word) << 9)::64 word) - RDX\<^sub>0) \<and> R14 \<sigma> = 0x0 \<and> R13 \<sigma> = RDI\<^sub>0 \<and> R12 \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[R15 \<sigma>,8]::64 word) = 0x0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSI \<sigma>::64 word) + 0x210),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSI \<sigma>::64 word) + 0x210),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSI \<sigma>::64 word) + 0x230),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSI \<sigma>::64 word) + 0x230),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((R15 \<sigma>::64 word) + 0x1f8),8]::64 word) = 0x0 \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0\<close>
declare P_0xb1a4_5_def[Ps]

definition P_0xb1a4_5_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0xb1a4_5_regions_set \<sigma> \<equiv> {
    (0, R15 \<sigma>, 8),
    (1, RSP\<^sub>0, 8),
    (2, ((RSI \<sigma>::64 word) + 0x210), 4),
    (3, ((RSI \<sigma>::64 word) + 0x230), 4),
    (4, ((R15 \<sigma>::64 word) + 0x1f8), 8),
    (5, ((RDI\<^sub>0::64 word) + 0x40), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (11, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (12, ((RSP\<^sub>0::64 word) - 0x40), 8)
  }\<close>

definition P_0xb1a4_5_regions :: state_pred where
  \<open>P_0xb1a4_5_regions \<sigma> \<equiv> \<exists>regions. P_0xb1a4_5_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_rep_stos_ESRDI_RAX_addr_0xb1a4_5 :: state_pred where
  \<open>Q_rep_stos_ESRDI_RAX_addr_0xb1a4_5 \<sigma> \<equiv> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x40) \<and> RIP \<sigma> = rep_stos_ESRDI_RAX_addr \<and> RAX \<sigma> = 0x0 \<and> RBX \<sigma> = ((((ucast ((((ucast (((\<langle>31,0\<rangle>((RCX\<^sub>0::64 word) - 0x1)::32 word)::32 word))::64 word) + (0x1::64 word))::64 word))::64 word) << 9)::64 word) + RDX\<^sub>0) \<and> RCX \<sigma> = ucast (((ucast (((((\<langle>31,0\<rangle>((R15 \<sigma>::64 word) - ((((R15 \<sigma>::64 word) + 0x8)::64 word) AND 0xfffffffffffffff8))::32 word)::32 word) + 0x200)::32 word))::32 word) >> 3)) \<and> RDX \<sigma> = ((ucast ((((ucast ((((R15 \<sigma>::64 word) + (\<langle>63,0\<rangle>((((((ucast ((RSI\<^sub>0::64 word))::64 word) << 9)::64 word) - RDX\<^sub>0)::64 word) * 0x1)::64 word))::64 word))::128 word) umod (ucast (((\<sigma> \<turnstile> *[((RSI \<sigma>::64 word) + 0x230),4]::32 word)::32 word))::64 word))::64 word))::64 word) >> 9) \<and> RDI \<sigma> = ((((R15 \<sigma>::64 word) + 0x8)::64 word) AND 0xfffffffffffffff8) \<and> RBP \<sigma> = ((((ucast ((RSI\<^sub>0::64 word))::64 word) << 9)::64 word) - RDX\<^sub>0) \<and> R14 \<sigma> = 0x0 \<and> R13 \<sigma> = RDI\<^sub>0 \<and> R12 \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[R15 \<sigma>,8]::64 word) = 0x0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSI \<sigma>::64 word) + 0x210),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSI \<sigma>::64 word) + 0x210),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSI \<sigma>::64 word) + 0x230),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSI \<sigma>::64 word) + 0x230),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((R15 \<sigma>::64 word) + 0x1f8),8]::64 word) = 0x0 \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = 0xb1a7\<close>
declare Q_rep_stos_ESRDI_RAX_addr_0xb1a4_5_def[Qs]

schematic_goal vpc_read_0_1_0xb1a4_0xb1a4_5[blocks]:
  assumes \<open>(P_0xb1a4_5 && P_0xb1a4_5_regions) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0xb1a4 5 \<sigma> \<triangleq> ?\<sigma> \<and> Q_rep_stos_ESRDI_RAX_addr_0xb1a4_5 ?\<sigma> \<and> block_usage P_0xb1a4_5_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0xb1a4_5_def P_0xb1a4_5_regions_def post: Q_rep_stos_ESRDI_RAX_addr_0xb1a4_5_def regionset: P_0xb1a4_5_regions_set_def)

definition P_0xb1a7_6 :: state_pred where
  \<open>P_0xb1a7_6 \<sigma> \<equiv> RIP \<sigma> = 0xb1a7 \<and> RAX \<sigma> = rep_stos_ESRDI_RAX_0xb1a4_retval \<and> RBX \<sigma> = ((((ucast ((((ucast (((\<langle>31,0\<rangle>((RCX\<^sub>0::64 word) - 0x1)::32 word)::32 word))::64 word) + (0x1::64 word))::64 word))::64 word) << 9)::64 word) + RDX\<^sub>0) \<and> RCX \<sigma> = ucast (((ucast (((((\<langle>31,0\<rangle>((R15 \<sigma>::64 word) - ((((R15 \<sigma>::64 word) + 0x8)::64 word) AND 0xfffffffffffffff8))::32 word)::32 word) + 0x200)::32 word))::32 word) >> 3)) \<and> RDX \<sigma> = ((ucast ((((ucast ((((R15 \<sigma>::64 word) + (\<langle>63,0\<rangle>((((((ucast ((RSI\<^sub>0::64 word))::64 word) << 9)::64 word) - RDX\<^sub>0)::64 word) * 0x1)::64 word))::64 word))::128 word) umod (ucast (((\<sigma> \<turnstile> *[((RSI \<sigma>::64 word) + 0x230),4]::32 word)::32 word))::64 word))::64 word))::64 word) >> 9) \<and> RDI \<sigma> = ((((R15 \<sigma>::64 word) + 0x8)::64 word) AND 0xfffffffffffffff8) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x38) \<and> RBP \<sigma> = ((((ucast ((RSI\<^sub>0::64 word))::64 word) << 9)::64 word) - RDX\<^sub>0) \<and> R14 \<sigma> = 0x0 \<and> R13 \<sigma> = RDI\<^sub>0 \<and> R12 \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[R15 \<sigma>,8]::64 word) = 0x0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSI \<sigma>::64 word) + 0x210),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSI \<sigma>::64 word) + 0x210),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSI \<sigma>::64 word) + 0x230),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSI \<sigma>::64 word) + 0x230),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((R15 \<sigma>::64 word) + 0x1f8),8]::64 word) = 0x0 \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = 0xb1a7\<close>
declare P_0xb1a7_6_def[Ps]

definition P_0xb1a7_6_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0xb1a7_6_regions_set \<sigma> \<equiv> {
    (0, R15 \<sigma>, 8),
    (1, RSP\<^sub>0, 8),
    (2, ((RSI \<sigma>::64 word) + 0x210), 4),
    (3, ((RSI \<sigma>::64 word) + 0x230), 4),
    (4, ((R15 \<sigma>::64 word) + 0x1f8), 8),
    (5, ((RDI\<^sub>0::64 word) + 0x40), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (11, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (12, ((RSP\<^sub>0::64 word) - 0x40), 8)
  }\<close>

definition P_0xb1a7_6_regions :: state_pred where
  \<open>P_0xb1a7_6_regions \<sigma> \<equiv> \<exists>regions. P_0xb1a7_6_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0xb0e0_6 :: state_pred where
  \<open>Q_0xb0e0_6 \<sigma> \<equiv> RIP \<sigma> = 0xb0e0 \<and> RAX \<sigma> = rep_stos_ESRDI_RAX_0xb1a4_retval \<and> RBX \<sigma> = ((((ucast ((((ucast (((\<langle>31,0\<rangle>((RCX\<^sub>0::64 word) - 0x1)::32 word)::32 word))::64 word) + (0x1::64 word))::64 word))::64 word) << 9)::64 word) + RDX\<^sub>0) \<and> RCX \<sigma> = ucast (((ucast (((((\<langle>31,0\<rangle>((R15 \<sigma>::64 word) - ((((R15 \<sigma>::64 word) + 0x8)::64 word) AND 0xfffffffffffffff8))::32 word)::32 word) + 0x200)::32 word))::32 word) >> 3)) \<and> RDX \<sigma> = ((ucast ((((ucast ((((R15 \<sigma>::64 word) + (\<langle>63,0\<rangle>((((((ucast ((RSI\<^sub>0::64 word))::64 word) << 9)::64 word) - RDX\<^sub>0)::64 word) * 0x1)::64 word))::64 word))::128 word) umod (ucast (((\<sigma> \<turnstile> *[((RSI \<sigma>::64 word) + 0x230),4]::32 word)::32 word))::64 word))::64 word))::64 word) >> 9) \<and> RDI \<sigma> = ((((R15 \<sigma>::64 word) + 0x8)::64 word) AND 0xfffffffffffffff8) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x38) \<and> RBP \<sigma> = ((((ucast ((RSI\<^sub>0::64 word))::64 word) << 9)::64 word) - RDX\<^sub>0) \<and> R14 \<sigma> = 0x0 \<and> R13 \<sigma> = RDI\<^sub>0 \<and> R12 \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[R15 \<sigma>,8]::64 word) = 0x0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSI \<sigma>::64 word) + 0x210),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSI \<sigma>::64 word) + 0x210),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSI \<sigma>::64 word) + 0x230),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSI \<sigma>::64 word) + 0x230),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((R15 \<sigma>::64 word) + 0x1f8),8]::64 word) = 0x0 \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = 0xb1a7\<close>
declare Q_0xb0e0_6_def[Qs]

schematic_goal vpc_read_0_1_0xb1a7_0xb1a7_6[blocks]:
  assumes \<open>(P_0xb1a7_6 && P_0xb1a7_6_regions) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0xb1a7 6 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0xb0e0_6 ?\<sigma> \<and> block_usage P_0xb1a7_6_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0xb1a7_6_def P_0xb1a7_6_regions_def post: Q_0xb0e0_6_def regionset: P_0xb1a7_6_regions_set_def)

definition P_0xb0e0_7 :: state_pred where
  \<open>P_0xb0e0_7 \<sigma> \<equiv> RIP \<sigma> = 0xb0e0 \<and> RAX \<sigma> = rep_stos_ESRDI_RAX_0xb1a4_retval \<and> RBX \<sigma> = ((((ucast ((((ucast (((\<langle>31,0\<rangle>((RCX\<^sub>0::64 word) - 0x1)::32 word)::32 word))::64 word) + (0x1::64 word))::64 word))::64 word) << 9)::64 word) + RDX\<^sub>0) \<and> RCX \<sigma> = ucast (((ucast (((((\<langle>31,0\<rangle>((R15 \<sigma>::64 word) - ((((R15 \<sigma>::64 word) + 0x8)::64 word) AND 0xfffffffffffffff8))::32 word)::32 word) + 0x200)::32 word))::32 word) >> 3)) \<and> RDX \<sigma> = ((ucast ((((ucast ((((R15 \<sigma>::64 word) + (\<langle>63,0\<rangle>((((((ucast ((RSI\<^sub>0::64 word))::64 word) << 9)::64 word) - RDX\<^sub>0)::64 word) * 0x1)::64 word))::64 word))::128 word) umod (ucast (((\<sigma> \<turnstile> *[((RSI \<sigma>::64 word) + 0x230),4]::32 word)::32 word))::64 word))::64 word))::64 word) >> 9) \<and> RDI \<sigma> = ((((R15 \<sigma>::64 word) + 0x8)::64 word) AND 0xfffffffffffffff8) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x38) \<and> RBP \<sigma> = ((((ucast ((RSI\<^sub>0::64 word))::64 word) << 9)::64 word) - RDX\<^sub>0) \<and> R14 \<sigma> = 0x0 \<and> R13 \<sigma> = RDI\<^sub>0 \<and> R12 \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[R15 \<sigma>,8]::64 word) = 0x0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSI \<sigma>::64 word) + 0x210),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSI \<sigma>::64 word) + 0x210),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSI \<sigma>::64 word) + 0x230),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSI \<sigma>::64 word) + 0x230),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((R15 \<sigma>::64 word) + 0x1f8),8]::64 word) = 0x0 \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = 0xb1a7\<close>
declare P_0xb0e0_7_def[Ps]

definition P_0xb0e0_7_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0xb0e0_7_regions_set \<sigma> \<equiv> {
    (0, R15 \<sigma>, 8),
    (1, RSP\<^sub>0, 8),
    (2, ((RSI \<sigma>::64 word) + 0x210), 4),
    (3, ((RSI \<sigma>::64 word) + 0x230), 4),
    (4, ((R15 \<sigma>::64 word) + 0x1f8), 8),
    (5, ((RDI\<^sub>0::64 word) + 0x40), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (11, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (12, ((RSP\<^sub>0::64 word) - 0x40), 8)
  }\<close>

definition P_0xb0e0_7_regions :: state_pred where
  \<open>P_0xb0e0_7_regions \<sigma> \<equiv> \<exists>regions. P_0xb0e0_7_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0xb0ea_7 :: state_pred where
  \<open>Q_0xb0ea_7 \<sigma> \<equiv> RIP \<sigma> = 0xb0ea \<and> RBX \<sigma> = ((((ucast ((((ucast (((\<langle>31,0\<rangle>((RCX\<^sub>0::64 word) - 0x1)::32 word)::32 word))::64 word) + (0x1::64 word))::64 word))::64 word) << 9)::64 word) + RDX\<^sub>0) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x38) \<and> RBP \<sigma> = ((((ucast ((RSI\<^sub>0::64 word))::64 word) << 9)::64 word) - RDX\<^sub>0) \<and> R14 \<sigma> = 0x0 \<and> R13 \<sigma> = RDI\<^sub>0 \<and> R12 \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSI \<sigma>::64 word) + 0x210),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSI \<sigma>::64 word) + 0x210),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSI \<sigma>::64 word) + 0x230),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSI \<sigma>::64 word) + 0x230),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = 0xb1a7\<close>
declare Q_0xb0ea_7_def[Qs]

schematic_goal vpc_read_0_2_0xb0e0_0xb0e7_7[blocks]:
  assumes \<open>(P_0xb0e0_7 && P_0xb0e0_7_regions) \<sigma>\<close>
  shows \<open>exec_block 2 0xb0e7 7 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0xb0ea_7 ?\<sigma> \<and> block_usage P_0xb0e0_7_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0xb0e0_7_def P_0xb0e0_7_regions_def post: Q_0xb0ea_7_def regionset: P_0xb0e0_7_regions_set_def)

definition P_0xb0ea_true_8 :: state_pred where
  \<open>P_0xb0ea_true_8 \<sigma> \<equiv> RIP \<sigma> = 0xb0ea \<and> RBX \<sigma> = ((((ucast ((((ucast (((\<langle>31,0\<rangle>((RCX\<^sub>0::64 word) - 0x1)::32 word)::32 word))::64 word) + (0x1::64 word))::64 word))::64 word) << 9)::64 word) + RDX\<^sub>0) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x38) \<and> RBP \<sigma> = ((((ucast ((RSI\<^sub>0::64 word))::64 word) << 9)::64 word) - RDX\<^sub>0) \<and> R14 \<sigma> = 0x0 \<and> R13 \<sigma> = RDI\<^sub>0 \<and> R12 \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSI \<sigma>::64 word) + 0x210),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSI \<sigma>::64 word) + 0x210),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSI \<sigma>::64 word) + 0x230),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSI \<sigma>::64 word) + 0x230),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = 0xb1a7\<close>
declare P_0xb0ea_true_8_def[Ps]

definition P_0xb0ea_true_8_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0xb0ea_true_8_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((RSI \<sigma>::64 word) + 0x210), 4),
    (2, ((RSI \<sigma>::64 word) + 0x230), 4),
    (3, ((RDI\<^sub>0::64 word) + 0x40), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x40), 8)
  }\<close>

definition P_0xb0ea_true_8_regions :: state_pred where
  \<open>P_0xb0ea_true_8_regions \<sigma> \<equiv> \<exists>regions. P_0xb0ea_true_8_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0xb160_8 :: state_pred where
  \<open>Q_0xb160_8 \<sigma> \<equiv> RIP \<sigma> = 0xb160 \<and> RBX \<sigma> = ((((ucast ((((ucast (((\<langle>31,0\<rangle>((RCX\<^sub>0::64 word) - 0x1)::32 word)::32 word))::64 word) + (0x1::64 word))::64 word))::64 word) << 9)::64 word) + RDX\<^sub>0) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x38) \<and> RBP \<sigma> = ((((ucast ((RSI\<^sub>0::64 word))::64 word) << 9)::64 word) - RDX\<^sub>0) \<and> R14 \<sigma> = 0x0 \<and> R13 \<sigma> = RDI\<^sub>0 \<and> R12 \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0\<close>
declare Q_0xb160_8_def[Qs]

schematic_goal vpc_read_0_1_0xb0ea_0xb0ea_8[blocks]:
  assumes \<open>(P_0xb0ea_true_8 && P_0xb0ea_true_8_regions && ZF) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0xb0ea 8 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0xb160_8 ?\<sigma> \<and> block_usage P_0xb0ea_true_8_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0xb0ea_true_8_def P_0xb0ea_true_8_regions_def post: Q_0xb160_8_def regionset: P_0xb0ea_true_8_regions_set_def)

definition P_0xb0ea_false_9 :: state_pred where
  \<open>P_0xb0ea_false_9 \<sigma> \<equiv> RIP \<sigma> = 0xb0ea \<and> RBX \<sigma> = ((((ucast ((((ucast (((\<langle>31,0\<rangle>((RCX\<^sub>0::64 word) - 0x1)::32 word)::32 word))::64 word) + (0x1::64 word))::64 word))::64 word) << 9)::64 word) + RDX\<^sub>0) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x38) \<and> RBP \<sigma> = ((((ucast ((RSI\<^sub>0::64 word))::64 word) << 9)::64 word) - RDX\<^sub>0) \<and> R14 \<sigma> = 0x0 \<and> R13 \<sigma> = RDI\<^sub>0 \<and> R12 \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSI \<sigma>::64 word) + 0x210),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSI \<sigma>::64 word) + 0x210),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSI \<sigma>::64 word) + 0x230),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSI \<sigma>::64 word) + 0x230),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = 0xb1a7\<close>
declare P_0xb0ea_false_9_def[Ps]

definition P_0xb0ea_false_9_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0xb0ea_false_9_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((RSI \<sigma>::64 word) + 0x210), 4),
    (2, ((RSI \<sigma>::64 word) + 0x230), 4),
    (3, ((RDI\<^sub>0::64 word) + 0x40), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x40), 8)
  }\<close>

definition P_0xb0ea_false_9_regions :: state_pred where
  \<open>P_0xb0ea_false_9_regions \<sigma> \<equiv> \<exists>regions. P_0xb0ea_false_9_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0xb0f0_9 :: state_pred where
  \<open>Q_0xb0f0_9 \<sigma> \<equiv> RIP \<sigma> = 0xb0f0 \<and> RBX \<sigma> = ((((ucast ((((ucast (((\<langle>31,0\<rangle>((RCX\<^sub>0::64 word) - 0x1)::32 word)::32 word))::64 word) + (0x1::64 word))::64 word))::64 word) << 9)::64 word) + RDX\<^sub>0) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x38) \<and> RBP \<sigma> = ((((ucast ((RSI\<^sub>0::64 word))::64 word) << 9)::64 word) - RDX\<^sub>0) \<and> R14 \<sigma> = 0x0 \<and> R13 \<sigma> = RDI\<^sub>0 \<and> R12 \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0\<close>
declare Q_0xb0f0_9_def[Qs]

schematic_goal vpc_read_0_2_0xb0ea_0xb0ec_9[blocks]:
  assumes \<open>(P_0xb0ea_false_9 && P_0xb0ea_false_9_regions && ! ZF) \<sigma>\<close>
  shows \<open>exec_block 2 0xb0ec 9 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0xb0f0_9 ?\<sigma> \<and> block_usage P_0xb0ea_false_9_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0xb0ea_false_9_def P_0xb0ea_false_9_regions_def post: Q_0xb0f0_9_def regionset: P_0xb0ea_false_9_regions_set_def)

definition P_0xb109_false_10 :: state_pred where
  \<open>P_0xb109_false_10 \<sigma> \<equiv> RIP \<sigma> = 0xb109 \<and> RAX \<sigma> = ((ucast ((((R15 \<sigma>::64 word) + (\<langle>63,0\<rangle>((((((ucast ((RSI\<^sub>0::64 word))::64 word) << 9)::64 word) - RDX\<^sub>0)::64 word) * 0x1)::64 word))::64 word))::128 word) udiv (ucast (((\<sigma> \<turnstile> *[((RSI \<sigma>::64 word) + 0x230),4]::32 word)::32 word))::64 word)) \<and> RBX \<sigma> = ((((ucast ((((ucast (((\<langle>31,0\<rangle>((RCX\<^sub>0::64 word) - 0x1)::32 word)::32 word))::64 word) + (0x1::64 word))::64 word))::64 word) << 9)::64 word) + RDX\<^sub>0) \<and> RCX \<sigma> = ucast ((\<sigma> \<turnstile> *[((RSI \<sigma>::64 word) + 0x230),4]::32 word)) \<and> RDX \<sigma> = ((ucast ((((ucast ((((R15 \<sigma>::64 word) + (\<langle>63,0\<rangle>((((((ucast ((RSI\<^sub>0::64 word))::64 word) << 9)::64 word) - RDX\<^sub>0)::64 word) * 0x1)::64 word))::64 word))::128 word) umod (ucast (((\<sigma> \<turnstile> *[((RSI \<sigma>::64 word) + 0x230),4]::32 word)::32 word))::64 word))::64 word))::64 word) >> 9) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x38) \<and> RBP \<sigma> = ((((ucast ((RSI\<^sub>0::64 word))::64 word) << 9)::64 word) - RDX\<^sub>0) \<and> R14 \<sigma> = 0x0 \<and> R13 \<sigma> = RDI\<^sub>0 \<and> R12 \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSI \<sigma>::64 word) + 0x210),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSI \<sigma>::64 word) + 0x210),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSI \<sigma>::64 word) + 0x230),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSI \<sigma>::64 word) + 0x230),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0\<close>
declare P_0xb109_false_10_def[Ps]

definition P_0xb109_false_10_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0xb109_false_10_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((RSI \<sigma>::64 word) + 0x210), 4),
    (2, ((RSI \<sigma>::64 word) + 0x218), 8),
    (3, ((RSI \<sigma>::64 word) + 0x230), 4),
    (4, ((RDI\<^sub>0::64 word) + 0x40), 8),
    (5, (((\<sigma> \<turnstile> *[((RSI \<sigma>::64 word) + 0x218),8]::64 word)::64 word) + (\<langle>63,0\<rangle>((ucast (((\<langle>31,0\<rangle>((ucast ((((R15 \<sigma>::64 word) + (\<langle>63,0\<rangle>((((((ucast ((RSI\<^sub>0::64 word))::64 word) << 9)::64 word) - RDX\<^sub>0)::64 word) * 0x1)::64 word))::64 word))::128 word) udiv (ucast (((\<sigma> \<turnstile> *[((RSI \<sigma>::64 word) + 0x230),4]::32 word)::32 word))::64 word))::32 word)::32 word))::64 word) * (0x4::64 word))::64 word)), 4),
    (6, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (11, ((RSP\<^sub>0::64 word) - 0x30), 8)
  }\<close>

definition P_0xb109_false_10_regions :: state_pred where
  \<open>P_0xb109_false_10_regions \<sigma> \<equiv> \<exists>regions. P_0xb109_false_10_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0xb11a_10 :: state_pred where
  \<open>Q_0xb11a_10 \<sigma> \<equiv> RIP \<sigma> = 0xb11a \<and> RAX \<sigma> = ucast ((\<langle>31,0\<rangle>((ucast ((((R15 \<sigma>::64 word) + (\<langle>63,0\<rangle>((((((ucast ((RSI\<^sub>0::64 word))::64 word) << 9)::64 word) - RDX\<^sub>0)::64 word) * 0x1)::64 word))::64 word))::128 word) udiv (ucast (((\<sigma> \<turnstile> *[((RSI \<sigma>::64 word) + 0x230),4]::32 word)::32 word))::64 word))::32 word)) \<and> RBX \<sigma> = ((((ucast ((((ucast (((\<langle>31,0\<rangle>((RCX\<^sub>0::64 word) - 0x1)::32 word)::32 word))::64 word) + (0x1::64 word))::64 word))::64 word) << 9)::64 word) + RDX\<^sub>0) \<and> RCX \<sigma> = ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RSI \<sigma>::64 word) + 0x218),8]::64 word)::64 word) + (\<langle>63,0\<rangle>((ucast (((\<langle>31,0\<rangle>((ucast ((((R15 \<sigma>::64 word) + (\<langle>63,0\<rangle>((((((ucast ((RSI\<^sub>0::64 word))::64 word) << 9)::64 word) - RDX\<^sub>0)::64 word) * 0x1)::64 word))::64 word))::128 word) udiv (ucast (((\<sigma> \<turnstile> *[((RSI \<sigma>::64 word) + 0x230),4]::32 word)::32 word))::64 word))::32 word)::32 word))::64 word) * (0x4::64 word))::64 word)),4]::32 word)) \<and> RDX \<sigma> = ((ucast ((((ucast ((((R15 \<sigma>::64 word) + (\<langle>63,0\<rangle>((((((ucast ((RSI\<^sub>0::64 word))::64 word) << 9)::64 word) - RDX\<^sub>0)::64 word) * 0x1)::64 word))::64 word))::128 word) umod (ucast (((\<sigma> \<turnstile> *[((RSI \<sigma>::64 word) + 0x230),4]::32 word)::32 word))::64 word))::64 word))::64 word) >> 9) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x38) \<and> RBP \<sigma> = ((((ucast ((RSI\<^sub>0::64 word))::64 word) << 9)::64 word) - RDX\<^sub>0) \<and> R14 \<sigma> = 0x0 \<and> R13 \<sigma> = RDI\<^sub>0 \<and> R12 \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSI \<sigma>::64 word) + 0x210),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSI \<sigma>::64 word) + 0x210),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSI \<sigma>::64 word) + 0x218),8]::64 word) = (\<sigma> \<turnstile> *[((RSI \<sigma>::64 word) + 0x218),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSI \<sigma>::64 word) + 0x230),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSI \<sigma>::64 word) + 0x230),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RSI \<sigma>::64 word) + 0x218),8]::64 word)::64 word) + (\<langle>63,0\<rangle>((ucast (((\<langle>31,0\<rangle>((ucast ((((R15 \<sigma>::64 word) + (\<langle>63,0\<rangle>((((((ucast ((RSI\<^sub>0::64 word))::64 word) << 9)::64 word) - RDX\<^sub>0)::64 word) * 0x1)::64 word))::64 word))::128 word) udiv (ucast (((\<sigma> \<turnstile> *[((RSI \<sigma>::64 word) + 0x230),4]::32 word)::32 word))::64 word))::32 word)::32 word))::64 word) * (0x4::64 word))::64 word)),4]::32 word) = ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RSI \<sigma>::64 word) + 0x218),8]::64 word)::64 word) + (\<langle>63,0\<rangle>((ucast (((\<langle>31,0\<rangle>((ucast ((((R15 \<sigma>::64 word) + (\<langle>63,0\<rangle>((((((ucast ((RSI\<^sub>0::64 word))::64 word) << 9)::64 word) - RDX\<^sub>0)::64 word) * 0x1)::64 word))::64 word))::128 word) udiv (ucast (((\<sigma> \<turnstile> *[((RSI \<sigma>::64 word) + 0x230),4]::32 word)::32 word))::64 word))::32 word)::32 word))::64 word) * (0x4::64 word))::64 word)),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0\<close>
declare Q_0xb11a_10_def[Qs]

schematic_goal vpc_read_0_5_0xb109_0xb117_10[blocks]:
  assumes \<open>(P_0xb109_false_10 && P_0xb109_false_10_regions && ! jbe) \<sigma>\<close>
  shows \<open>exec_block 5 0xb117 10 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0xb11a_10 ?\<sigma> \<and> block_usage P_0xb109_false_10_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0xb109_false_10_def P_0xb109_false_10_regions_def post: Q_0xb11a_10_def regionset: P_0xb109_false_10_regions_set_def)

definition P_0xb11a_true_11 :: state_pred where
  \<open>P_0xb11a_true_11 \<sigma> \<equiv> RIP \<sigma> = 0xb11a \<and> RAX \<sigma> = ucast ((\<langle>31,0\<rangle>((ucast ((((R15 \<sigma>::64 word) + (\<langle>63,0\<rangle>((((((ucast ((RSI\<^sub>0::64 word))::64 word) << 9)::64 word) - RDX\<^sub>0)::64 word) * 0x1)::64 word))::64 word))::128 word) udiv (ucast (((\<sigma> \<turnstile> *[((RSI \<sigma>::64 word) + 0x230),4]::32 word)::32 word))::64 word))::32 word)) \<and> RBX \<sigma> = ((((ucast ((((ucast (((\<langle>31,0\<rangle>((RCX\<^sub>0::64 word) - 0x1)::32 word)::32 word))::64 word) + (0x1::64 word))::64 word))::64 word) << 9)::64 word) + RDX\<^sub>0) \<and> RCX \<sigma> = ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RSI \<sigma>::64 word) + 0x218),8]::64 word)::64 word) + (\<langle>63,0\<rangle>((ucast (((\<langle>31,0\<rangle>((ucast ((((R15 \<sigma>::64 word) + (\<langle>63,0\<rangle>((((((ucast ((RSI\<^sub>0::64 word))::64 word) << 9)::64 word) - RDX\<^sub>0)::64 word) * 0x1)::64 word))::64 word))::128 word) udiv (ucast (((\<sigma> \<turnstile> *[((RSI \<sigma>::64 word) + 0x230),4]::32 word)::32 word))::64 word))::32 word)::32 word))::64 word) * (0x4::64 word))::64 word)),4]::32 word)) \<and> RDX \<sigma> = ((ucast ((((ucast ((((R15 \<sigma>::64 word) + (\<langle>63,0\<rangle>((((((ucast ((RSI\<^sub>0::64 word))::64 word) << 9)::64 word) - RDX\<^sub>0)::64 word) * 0x1)::64 word))::64 word))::128 word) umod (ucast (((\<sigma> \<turnstile> *[((RSI \<sigma>::64 word) + 0x230),4]::32 word)::32 word))::64 word))::64 word))::64 word) >> 9) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x38) \<and> RBP \<sigma> = ((((ucast ((RSI\<^sub>0::64 word))::64 word) << 9)::64 word) - RDX\<^sub>0) \<and> R14 \<sigma> = 0x0 \<and> R13 \<sigma> = RDI\<^sub>0 \<and> R12 \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSI \<sigma>::64 word) + 0x210),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSI \<sigma>::64 word) + 0x210),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSI \<sigma>::64 word) + 0x218),8]::64 word) = (\<sigma> \<turnstile> *[((RSI \<sigma>::64 word) + 0x218),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSI \<sigma>::64 word) + 0x230),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSI \<sigma>::64 word) + 0x230),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RSI \<sigma>::64 word) + 0x218),8]::64 word)::64 word) + (\<langle>63,0\<rangle>((ucast (((\<langle>31,0\<rangle>((ucast ((((R15 \<sigma>::64 word) + (\<langle>63,0\<rangle>((((((ucast ((RSI\<^sub>0::64 word))::64 word) << 9)::64 word) - RDX\<^sub>0)::64 word) * 0x1)::64 word))::64 word))::128 word) udiv (ucast (((\<sigma> \<turnstile> *[((RSI \<sigma>::64 word) + 0x230),4]::32 word)::32 word))::64 word))::32 word)::32 word))::64 word) * (0x4::64 word))::64 word)),4]::32 word) = ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RSI \<sigma>::64 word) + 0x218),8]::64 word)::64 word) + (\<langle>63,0\<rangle>((ucast (((\<langle>31,0\<rangle>((ucast ((((R15 \<sigma>::64 word) + (\<langle>63,0\<rangle>((((((ucast ((RSI\<^sub>0::64 word))::64 word) << 9)::64 word) - RDX\<^sub>0)::64 word) * 0x1)::64 word))::64 word))::128 word) udiv (ucast (((\<sigma> \<turnstile> *[((RSI \<sigma>::64 word) + 0x230),4]::32 word)::32 word))::64 word))::32 word)::32 word))::64 word) * (0x4::64 word))::64 word)),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0\<close>
declare P_0xb11a_true_11_def[Ps]

definition P_0xb11a_true_11_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0xb11a_true_11_regions_set \<sigma> \<equiv> {
    (0, R15 \<sigma>, 8),
    (1, RSP\<^sub>0, 8),
    (2, ((RSI \<sigma>::64 word) + 0x210), 4),
    (3, ((RSI \<sigma>::64 word) + 0x218), 8),
    (4, ((RSI \<sigma>::64 word) + 0x230), 4),
    (5, ((R15 \<sigma>::64 word) + 0x1f8), 8),
    (6, ((RDI\<^sub>0::64 word) + 0x40), 8),
    (7, (((\<sigma> \<turnstile> *[((RSI \<sigma>::64 word) + 0x218),8]::64 word)::64 word) + (\<langle>63,0\<rangle>((ucast (((\<langle>31,0\<rangle>((ucast ((((R15 \<sigma>::64 word) + (\<langle>63,0\<rangle>((((((ucast ((RSI\<^sub>0::64 word))::64 word) << 9)::64 word) - RDX\<^sub>0)::64 word) * 0x1)::64 word))::64 word))::128 word) udiv (ucast (((\<sigma> \<turnstile> *[((RSI \<sigma>::64 word) + 0x230),4]::32 word)::32 word))::64 word))::32 word)::32 word))::64 word) * (0x4::64 word))::64 word)), 4),
    (8, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (11, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (12, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (13, ((RSP\<^sub>0::64 word) - 0x30), 8)
  }\<close>

definition P_0xb11a_true_11_regions :: state_pred where
  \<open>P_0xb11a_true_11_regions \<sigma> \<equiv> \<exists>regions. P_0xb11a_true_11_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0xb1a4_11 :: state_pred where
  \<open>Q_0xb1a4_11 \<sigma> \<equiv> RIP \<sigma> = 0xb1a4 \<and> RAX \<sigma> = 0x0 \<and> RBX \<sigma> = ((((ucast ((((ucast (((\<langle>31,0\<rangle>((RCX\<^sub>0::64 word) - 0x1)::32 word)::32 word))::64 word) + (0x1::64 word))::64 word))::64 word) << 9)::64 word) + RDX\<^sub>0) \<and> RCX \<sigma> = ucast (((ucast (((((\<langle>31,0\<rangle>((R15 \<sigma>::64 word) - ((((R15 \<sigma>::64 word) + 0x8)::64 word) AND 0xfffffffffffffff8))::32 word)::32 word) + 0x200)::32 word))::32 word) >> 3)) \<and> RDX \<sigma> = ((ucast ((((ucast ((((R15 \<sigma>::64 word) + (\<langle>63,0\<rangle>((((((ucast ((RSI\<^sub>0::64 word))::64 word) << 9)::64 word) - RDX\<^sub>0)::64 word) * 0x1)::64 word))::64 word))::128 word) umod (ucast (((\<sigma> \<turnstile> *[((RSI \<sigma>::64 word) + 0x230),4]::32 word)::32 word))::64 word))::64 word))::64 word) >> 9) \<and> RDI \<sigma> = ((((R15 \<sigma>::64 word) + 0x8)::64 word) AND 0xfffffffffffffff8) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x38) \<and> RBP \<sigma> = ((((ucast ((RSI\<^sub>0::64 word))::64 word) << 9)::64 word) - RDX\<^sub>0) \<and> R14 \<sigma> = 0x0 \<and> R13 \<sigma> = RDI\<^sub>0 \<and> R12 \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[R15 \<sigma>,8]::64 word) = 0x0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSI \<sigma>::64 word) + 0x210),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSI \<sigma>::64 word) + 0x210),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSI \<sigma>::64 word) + 0x218),8]::64 word) = (\<sigma> \<turnstile> *[((RSI \<sigma>::64 word) + 0x218),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSI \<sigma>::64 word) + 0x230),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSI \<sigma>::64 word) + 0x230),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((R15 \<sigma>::64 word) + 0x1f8),8]::64 word) = 0x0 \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RSI \<sigma>::64 word) + 0x218),8]::64 word)::64 word) + (\<langle>63,0\<rangle>((ucast (((\<langle>31,0\<rangle>((ucast ((((R15 \<sigma>::64 word) + (\<langle>63,0\<rangle>((((((ucast ((RSI\<^sub>0::64 word))::64 word) << 9)::64 word) - RDX\<^sub>0)::64 word) * 0x1)::64 word))::64 word))::128 word) udiv (ucast (((\<sigma> \<turnstile> *[((RSI \<sigma>::64 word) + 0x230),4]::32 word)::32 word))::64 word))::32 word)::32 word))::64 word) * (0x4::64 word))::64 word)),4]::32 word) = ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RSI \<sigma>::64 word) + 0x218),8]::64 word)::64 word) + (\<langle>63,0\<rangle>((ucast (((\<langle>31,0\<rangle>((ucast ((((R15 \<sigma>::64 word) + (\<langle>63,0\<rangle>((((((ucast ((RSI\<^sub>0::64 word))::64 word) << 9)::64 word) - RDX\<^sub>0)::64 word) * 0x1)::64 word))::64 word))::128 word) udiv (ucast (((\<sigma> \<turnstile> *[((RSI \<sigma>::64 word) + 0x230),4]::32 word)::32 word))::64 word))::32 word)::32 word))::64 word) * (0x4::64 word))::64 word)),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0\<close>
declare Q_0xb1a4_11_def[Qs]

schematic_goal vpc_read_0_10_0xb11a_0xb1a1_11[blocks]:
  assumes \<open>(P_0xb11a_true_11 && P_0xb11a_true_11_regions && ZF) \<sigma>\<close>
  shows \<open>exec_block 10 0xb1a1 11 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0xb1a4_11 ?\<sigma> \<and> block_usage P_0xb11a_true_11_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0xb11a_true_11_def P_0xb11a_true_11_regions_def post: Q_0xb1a4_11_def regionset: P_0xb11a_true_11_regions_set_def)

definition P_0xb1a4_12 :: state_pred where
  \<open>P_0xb1a4_12 \<sigma> \<equiv> RIP \<sigma> = 0xb1a4 \<and> RAX \<sigma> = 0x0 \<and> RBX \<sigma> = ((((ucast ((((ucast (((\<langle>31,0\<rangle>((RCX\<^sub>0::64 word) - 0x1)::32 word)::32 word))::64 word) + (0x1::64 word))::64 word))::64 word) << 9)::64 word) + RDX\<^sub>0) \<and> RCX \<sigma> = ucast (((ucast (((((\<langle>31,0\<rangle>((R15 \<sigma>::64 word) - ((((R15 \<sigma>::64 word) + 0x8)::64 word) AND 0xfffffffffffffff8))::32 word)::32 word) + 0x200)::32 word))::32 word) >> 3)) \<and> RDX \<sigma> = ((ucast ((((ucast ((((R15 \<sigma>::64 word) + (\<langle>63,0\<rangle>((((((ucast ((RSI\<^sub>0::64 word))::64 word) << 9)::64 word) - RDX\<^sub>0)::64 word) * 0x1)::64 word))::64 word))::128 word) umod (ucast (((\<sigma> \<turnstile> *[((RSI \<sigma>::64 word) + 0x230),4]::32 word)::32 word))::64 word))::64 word))::64 word) >> 9) \<and> RDI \<sigma> = ((((R15 \<sigma>::64 word) + 0x8)::64 word) AND 0xfffffffffffffff8) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x38) \<and> RBP \<sigma> = ((((ucast ((RSI\<^sub>0::64 word))::64 word) << 9)::64 word) - RDX\<^sub>0) \<and> R14 \<sigma> = 0x0 \<and> R13 \<sigma> = RDI\<^sub>0 \<and> R12 \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[R15 \<sigma>,8]::64 word) = 0x0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSI \<sigma>::64 word) + 0x210),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSI \<sigma>::64 word) + 0x210),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSI \<sigma>::64 word) + 0x218),8]::64 word) = (\<sigma> \<turnstile> *[((RSI \<sigma>::64 word) + 0x218),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSI \<sigma>::64 word) + 0x230),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSI \<sigma>::64 word) + 0x230),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((R15 \<sigma>::64 word) + 0x1f8),8]::64 word) = 0x0 \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RSI \<sigma>::64 word) + 0x218),8]::64 word)::64 word) + (\<langle>63,0\<rangle>((ucast (((\<langle>31,0\<rangle>((ucast ((((R15 \<sigma>::64 word) + (\<langle>63,0\<rangle>((((((ucast ((RSI\<^sub>0::64 word))::64 word) << 9)::64 word) - RDX\<^sub>0)::64 word) * 0x1)::64 word))::64 word))::128 word) udiv (ucast (((\<sigma> \<turnstile> *[((RSI \<sigma>::64 word) + 0x230),4]::32 word)::32 word))::64 word))::32 word)::32 word))::64 word) * (0x4::64 word))::64 word)),4]::32 word) = ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RSI \<sigma>::64 word) + 0x218),8]::64 word)::64 word) + (\<langle>63,0\<rangle>((ucast (((\<langle>31,0\<rangle>((ucast ((((R15 \<sigma>::64 word) + (\<langle>63,0\<rangle>((((((ucast ((RSI\<^sub>0::64 word))::64 word) << 9)::64 word) - RDX\<^sub>0)::64 word) * 0x1)::64 word))::64 word))::128 word) udiv (ucast (((\<sigma> \<turnstile> *[((RSI \<sigma>::64 word) + 0x230),4]::32 word)::32 word))::64 word))::32 word)::32 word))::64 word) * (0x4::64 word))::64 word)),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0\<close>
declare P_0xb1a4_12_def[Ps]

definition P_0xb1a4_12_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0xb1a4_12_regions_set \<sigma> \<equiv> {
    (0, R15 \<sigma>, 8),
    (1, RSP\<^sub>0, 8),
    (2, ((RSI \<sigma>::64 word) + 0x210), 4),
    (3, ((RSI \<sigma>::64 word) + 0x218), 8),
    (4, ((RSI \<sigma>::64 word) + 0x230), 4),
    (5, ((R15 \<sigma>::64 word) + 0x1f8), 8),
    (6, ((RDI\<^sub>0::64 word) + 0x40), 8),
    (7, (((\<sigma> \<turnstile> *[((RSI \<sigma>::64 word) + 0x218),8]::64 word)::64 word) + (\<langle>63,0\<rangle>((ucast (((\<langle>31,0\<rangle>((ucast ((((R15 \<sigma>::64 word) + (\<langle>63,0\<rangle>((((((ucast ((RSI\<^sub>0::64 word))::64 word) << 9)::64 word) - RDX\<^sub>0)::64 word) * 0x1)::64 word))::64 word))::128 word) udiv (ucast (((\<sigma> \<turnstile> *[((RSI \<sigma>::64 word) + 0x230),4]::32 word)::32 word))::64 word))::32 word)::32 word))::64 word) * (0x4::64 word))::64 word)), 4),
    (8, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (11, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (12, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (13, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (14, ((RSP\<^sub>0::64 word) - 0x40), 8)
  }\<close>

definition P_0xb1a4_12_regions :: state_pred where
  \<open>P_0xb1a4_12_regions \<sigma> \<equiv> \<exists>regions. P_0xb1a4_12_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_rep_stos_ESRDI_RAX_addr_0xb1a4_12 :: state_pred where
  \<open>Q_rep_stos_ESRDI_RAX_addr_0xb1a4_12 \<sigma> \<equiv> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x40) \<and> RIP \<sigma> = rep_stos_ESRDI_RAX_addr \<and> RAX \<sigma> = 0x0 \<and> RBX \<sigma> = ((((ucast ((((ucast (((\<langle>31,0\<rangle>((RCX\<^sub>0::64 word) - 0x1)::32 word)::32 word))::64 word) + (0x1::64 word))::64 word))::64 word) << 9)::64 word) + RDX\<^sub>0) \<and> RCX \<sigma> = ucast (((ucast (((((\<langle>31,0\<rangle>((R15 \<sigma>::64 word) - ((((R15 \<sigma>::64 word) + 0x8)::64 word) AND 0xfffffffffffffff8))::32 word)::32 word) + 0x200)::32 word))::32 word) >> 3)) \<and> RDX \<sigma> = ((ucast ((((ucast ((((R15 \<sigma>::64 word) + (\<langle>63,0\<rangle>((((((ucast ((RSI\<^sub>0::64 word))::64 word) << 9)::64 word) - RDX\<^sub>0)::64 word) * 0x1)::64 word))::64 word))::128 word) umod (ucast (((\<sigma> \<turnstile> *[((RSI \<sigma>::64 word) + 0x230),4]::32 word)::32 word))::64 word))::64 word))::64 word) >> 9) \<and> RDI \<sigma> = ((((R15 \<sigma>::64 word) + 0x8)::64 word) AND 0xfffffffffffffff8) \<and> RBP \<sigma> = ((((ucast ((RSI\<^sub>0::64 word))::64 word) << 9)::64 word) - RDX\<^sub>0) \<and> R14 \<sigma> = 0x0 \<and> R13 \<sigma> = RDI\<^sub>0 \<and> R12 \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[R15 \<sigma>,8]::64 word) = 0x0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSI \<sigma>::64 word) + 0x210),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSI \<sigma>::64 word) + 0x210),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSI \<sigma>::64 word) + 0x218),8]::64 word) = (\<sigma> \<turnstile> *[((RSI \<sigma>::64 word) + 0x218),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSI \<sigma>::64 word) + 0x230),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSI \<sigma>::64 word) + 0x230),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((R15 \<sigma>::64 word) + 0x1f8),8]::64 word) = 0x0 \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RSI \<sigma>::64 word) + 0x218),8]::64 word)::64 word) + (\<langle>63,0\<rangle>((ucast (((\<langle>31,0\<rangle>((ucast ((((R15 \<sigma>::64 word) + (\<langle>63,0\<rangle>((((((ucast ((RSI\<^sub>0::64 word))::64 word) << 9)::64 word) - RDX\<^sub>0)::64 word) * 0x1)::64 word))::64 word))::128 word) udiv (ucast (((\<sigma> \<turnstile> *[((RSI \<sigma>::64 word) + 0x230),4]::32 word)::32 word))::64 word))::32 word)::32 word))::64 word) * (0x4::64 word))::64 word)),4]::32 word) = ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RSI \<sigma>::64 word) + 0x218),8]::64 word)::64 word) + (\<langle>63,0\<rangle>((ucast (((\<langle>31,0\<rangle>((ucast ((((R15 \<sigma>::64 word) + (\<langle>63,0\<rangle>((((((ucast ((RSI\<^sub>0::64 word))::64 word) << 9)::64 word) - RDX\<^sub>0)::64 word) * 0x1)::64 word))::64 word))::128 word) udiv (ucast (((\<sigma> \<turnstile> *[((RSI \<sigma>::64 word) + 0x230),4]::32 word)::32 word))::64 word))::32 word)::32 word))::64 word) * (0x4::64 word))::64 word)),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = 0xb1a7\<close>
declare Q_rep_stos_ESRDI_RAX_addr_0xb1a4_12_def[Qs]

schematic_goal vpc_read_0_1_0xb1a4_0xb1a4_12[blocks]:
  assumes \<open>(P_0xb1a4_12 && P_0xb1a4_12_regions) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0xb1a4 12 \<sigma> \<triangleq> ?\<sigma> \<and> Q_rep_stos_ESRDI_RAX_addr_0xb1a4_12 ?\<sigma> \<and> block_usage P_0xb1a4_12_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0xb1a4_12_def P_0xb1a4_12_regions_def post: Q_rep_stos_ESRDI_RAX_addr_0xb1a4_12_def regionset: P_0xb1a4_12_regions_set_def)

definition P_0xb1a7_13 :: state_pred where
  \<open>P_0xb1a7_13 \<sigma> \<equiv> RIP \<sigma> = 0xb1a7 \<and> RAX \<sigma> = rep_stos_ESRDI_RAX_0xb1a4_retval \<and> RBX \<sigma> = ((((ucast ((((ucast (((\<langle>31,0\<rangle>((RCX\<^sub>0::64 word) - 0x1)::32 word)::32 word))::64 word) + (0x1::64 word))::64 word))::64 word) << 9)::64 word) + RDX\<^sub>0) \<and> RCX \<sigma> = ucast (((ucast (((((\<langle>31,0\<rangle>((R15 \<sigma>::64 word) - ((((R15 \<sigma>::64 word) + 0x8)::64 word) AND 0xfffffffffffffff8))::32 word)::32 word) + 0x200)::32 word))::32 word) >> 3)) \<and> RDX \<sigma> = ((ucast ((((ucast ((((R15 \<sigma>::64 word) + (\<langle>63,0\<rangle>((((((ucast ((RSI\<^sub>0::64 word))::64 word) << 9)::64 word) - RDX\<^sub>0)::64 word) * 0x1)::64 word))::64 word))::128 word) umod (ucast (((\<sigma> \<turnstile> *[((RSI \<sigma>::64 word) + 0x230),4]::32 word)::32 word))::64 word))::64 word))::64 word) >> 9) \<and> RDI \<sigma> = ((((R15 \<sigma>::64 word) + 0x8)::64 word) AND 0xfffffffffffffff8) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x38) \<and> RBP \<sigma> = ((((ucast ((RSI\<^sub>0::64 word))::64 word) << 9)::64 word) - RDX\<^sub>0) \<and> R14 \<sigma> = 0x0 \<and> R13 \<sigma> = RDI\<^sub>0 \<and> R12 \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[R15 \<sigma>,8]::64 word) = 0x0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSI \<sigma>::64 word) + 0x210),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSI \<sigma>::64 word) + 0x210),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSI \<sigma>::64 word) + 0x218),8]::64 word) = (\<sigma> \<turnstile> *[((RSI \<sigma>::64 word) + 0x218),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSI \<sigma>::64 word) + 0x230),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSI \<sigma>::64 word) + 0x230),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((R15 \<sigma>::64 word) + 0x1f8),8]::64 word) = 0x0 \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RSI \<sigma>::64 word) + 0x218),8]::64 word)::64 word) + (\<langle>63,0\<rangle>((ucast (((\<langle>31,0\<rangle>((ucast ((((R15 \<sigma>::64 word) + (\<langle>63,0\<rangle>((((((ucast ((RSI\<^sub>0::64 word))::64 word) << 9)::64 word) - RDX\<^sub>0)::64 word) * 0x1)::64 word))::64 word))::128 word) udiv (ucast (((\<sigma> \<turnstile> *[((RSI \<sigma>::64 word) + 0x230),4]::32 word)::32 word))::64 word))::32 word)::32 word))::64 word) * (0x4::64 word))::64 word)),4]::32 word) = ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RSI \<sigma>::64 word) + 0x218),8]::64 word)::64 word) + (\<langle>63,0\<rangle>((ucast (((\<langle>31,0\<rangle>((ucast ((((R15 \<sigma>::64 word) + (\<langle>63,0\<rangle>((((((ucast ((RSI\<^sub>0::64 word))::64 word) << 9)::64 word) - RDX\<^sub>0)::64 word) * 0x1)::64 word))::64 word))::128 word) udiv (ucast (((\<sigma> \<turnstile> *[((RSI \<sigma>::64 word) + 0x230),4]::32 word)::32 word))::64 word))::32 word)::32 word))::64 word) * (0x4::64 word))::64 word)),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = 0xb1a7\<close>
declare P_0xb1a7_13_def[Ps]

definition P_0xb1a7_13_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0xb1a7_13_regions_set \<sigma> \<equiv> {
    (0, R15 \<sigma>, 8),
    (1, RSP\<^sub>0, 8),
    (2, ((RSI \<sigma>::64 word) + 0x210), 4),
    (3, ((RSI \<sigma>::64 word) + 0x218), 8),
    (4, ((RSI \<sigma>::64 word) + 0x230), 4),
    (5, ((R15 \<sigma>::64 word) + 0x1f8), 8),
    (6, ((RDI\<^sub>0::64 word) + 0x40), 8),
    (7, (((\<sigma> \<turnstile> *[((RSI \<sigma>::64 word) + 0x218),8]::64 word)::64 word) + (\<langle>63,0\<rangle>((ucast (((\<langle>31,0\<rangle>((ucast ((((R15 \<sigma>::64 word) + (\<langle>63,0\<rangle>((((((ucast ((RSI\<^sub>0::64 word))::64 word) << 9)::64 word) - RDX\<^sub>0)::64 word) * 0x1)::64 word))::64 word))::128 word) udiv (ucast (((\<sigma> \<turnstile> *[((RSI \<sigma>::64 word) + 0x230),4]::32 word)::32 word))::64 word))::32 word)::32 word))::64 word) * (0x4::64 word))::64 word)), 4),
    (8, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (11, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (12, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (13, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (14, ((RSP\<^sub>0::64 word) - 0x40), 8)
  }\<close>

definition P_0xb1a7_13_regions :: state_pred where
  \<open>P_0xb1a7_13_regions \<sigma> \<equiv> \<exists>regions. P_0xb1a7_13_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0xb0e0_13 :: state_pred where
  \<open>Q_0xb0e0_13 \<sigma> \<equiv> RIP \<sigma> = 0xb0e0 \<and> RAX \<sigma> = rep_stos_ESRDI_RAX_0xb1a4_retval \<and> RBX \<sigma> = ((((ucast ((((ucast (((\<langle>31,0\<rangle>((RCX\<^sub>0::64 word) - 0x1)::32 word)::32 word))::64 word) + (0x1::64 word))::64 word))::64 word) << 9)::64 word) + RDX\<^sub>0) \<and> RCX \<sigma> = ucast (((ucast (((((\<langle>31,0\<rangle>((R15 \<sigma>::64 word) - ((((R15 \<sigma>::64 word) + 0x8)::64 word) AND 0xfffffffffffffff8))::32 word)::32 word) + 0x200)::32 word))::32 word) >> 3)) \<and> RDX \<sigma> = ((ucast ((((ucast ((((R15 \<sigma>::64 word) + (\<langle>63,0\<rangle>((((((ucast ((RSI\<^sub>0::64 word))::64 word) << 9)::64 word) - RDX\<^sub>0)::64 word) * 0x1)::64 word))::64 word))::128 word) umod (ucast (((\<sigma> \<turnstile> *[((RSI \<sigma>::64 word) + 0x230),4]::32 word)::32 word))::64 word))::64 word))::64 word) >> 9) \<and> RDI \<sigma> = ((((R15 \<sigma>::64 word) + 0x8)::64 word) AND 0xfffffffffffffff8) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x38) \<and> RBP \<sigma> = ((((ucast ((RSI\<^sub>0::64 word))::64 word) << 9)::64 word) - RDX\<^sub>0) \<and> R14 \<sigma> = 0x0 \<and> R13 \<sigma> = RDI\<^sub>0 \<and> R12 \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[R15 \<sigma>,8]::64 word) = 0x0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSI \<sigma>::64 word) + 0x210),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSI \<sigma>::64 word) + 0x210),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSI \<sigma>::64 word) + 0x218),8]::64 word) = (\<sigma> \<turnstile> *[((RSI \<sigma>::64 word) + 0x218),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSI \<sigma>::64 word) + 0x230),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSI \<sigma>::64 word) + 0x230),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((R15 \<sigma>::64 word) + 0x1f8),8]::64 word) = 0x0 \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RSI \<sigma>::64 word) + 0x218),8]::64 word)::64 word) + (\<langle>63,0\<rangle>((ucast (((\<langle>31,0\<rangle>((ucast ((((R15 \<sigma>::64 word) + (\<langle>63,0\<rangle>((((((ucast ((RSI\<^sub>0::64 word))::64 word) << 9)::64 word) - RDX\<^sub>0)::64 word) * 0x1)::64 word))::64 word))::128 word) udiv (ucast (((\<sigma> \<turnstile> *[((RSI \<sigma>::64 word) + 0x230),4]::32 word)::32 word))::64 word))::32 word)::32 word))::64 word) * (0x4::64 word))::64 word)),4]::32 word) = ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RSI \<sigma>::64 word) + 0x218),8]::64 word)::64 word) + (\<langle>63,0\<rangle>((ucast (((\<langle>31,0\<rangle>((ucast ((((R15 \<sigma>::64 word) + (\<langle>63,0\<rangle>((((((ucast ((RSI\<^sub>0::64 word))::64 word) << 9)::64 word) - RDX\<^sub>0)::64 word) * 0x1)::64 word))::64 word))::128 word) udiv (ucast (((\<sigma> \<turnstile> *[((RSI \<sigma>::64 word) + 0x230),4]::32 word)::32 word))::64 word))::32 word)::32 word))::64 word) * (0x4::64 word))::64 word)),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = 0xb1a7\<close>
declare Q_0xb0e0_13_def[Qs]

schematic_goal vpc_read_0_1_0xb1a7_0xb1a7_13[blocks]:
  assumes \<open>(P_0xb1a7_13 && P_0xb1a7_13_regions) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0xb1a7 13 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0xb0e0_13 ?\<sigma> \<and> block_usage P_0xb1a7_13_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0xb1a7_13_def P_0xb1a7_13_regions_def post: Q_0xb0e0_13_def regionset: P_0xb1a7_13_regions_set_def)

definition P_0xb0e0_14 :: state_pred where
  \<open>P_0xb0e0_14 \<sigma> \<equiv> RIP \<sigma> = 0xb0e0 \<and> RAX \<sigma> = rep_stos_ESRDI_RAX_0xb1a4_retval \<and> RBX \<sigma> = ((((ucast ((((ucast (((\<langle>31,0\<rangle>((RCX\<^sub>0::64 word) - 0x1)::32 word)::32 word))::64 word) + (0x1::64 word))::64 word))::64 word) << 9)::64 word) + RDX\<^sub>0) \<and> RCX \<sigma> = ucast (((ucast (((((\<langle>31,0\<rangle>((R15 \<sigma>::64 word) - ((((R15 \<sigma>::64 word) + 0x8)::64 word) AND 0xfffffffffffffff8))::32 word)::32 word) + 0x200)::32 word))::32 word) >> 3)) \<and> RDX \<sigma> = ((ucast ((((ucast ((((R15 \<sigma>::64 word) + (\<langle>63,0\<rangle>((((((ucast ((RSI\<^sub>0::64 word))::64 word) << 9)::64 word) - RDX\<^sub>0)::64 word) * 0x1)::64 word))::64 word))::128 word) umod (ucast (((\<sigma> \<turnstile> *[((RSI \<sigma>::64 word) + 0x230),4]::32 word)::32 word))::64 word))::64 word))::64 word) >> 9) \<and> RDI \<sigma> = ((((R15 \<sigma>::64 word) + 0x8)::64 word) AND 0xfffffffffffffff8) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x38) \<and> RBP \<sigma> = ((((ucast ((RSI\<^sub>0::64 word))::64 word) << 9)::64 word) - RDX\<^sub>0) \<and> R14 \<sigma> = 0x0 \<and> R13 \<sigma> = RDI\<^sub>0 \<and> R12 \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[R15 \<sigma>,8]::64 word) = 0x0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSI \<sigma>::64 word) + 0x210),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSI \<sigma>::64 word) + 0x210),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSI \<sigma>::64 word) + 0x218),8]::64 word) = (\<sigma> \<turnstile> *[((RSI \<sigma>::64 word) + 0x218),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSI \<sigma>::64 word) + 0x230),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSI \<sigma>::64 word) + 0x230),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((R15 \<sigma>::64 word) + 0x1f8),8]::64 word) = 0x0 \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RSI \<sigma>::64 word) + 0x218),8]::64 word)::64 word) + (\<langle>63,0\<rangle>((ucast (((\<langle>31,0\<rangle>((ucast ((((R15 \<sigma>::64 word) + (\<langle>63,0\<rangle>((((((ucast ((RSI\<^sub>0::64 word))::64 word) << 9)::64 word) - RDX\<^sub>0)::64 word) * 0x1)::64 word))::64 word))::128 word) udiv (ucast (((\<sigma> \<turnstile> *[((RSI \<sigma>::64 word) + 0x230),4]::32 word)::32 word))::64 word))::32 word)::32 word))::64 word) * (0x4::64 word))::64 word)),4]::32 word) = ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RSI \<sigma>::64 word) + 0x218),8]::64 word)::64 word) + (\<langle>63,0\<rangle>((ucast (((\<langle>31,0\<rangle>((ucast ((((R15 \<sigma>::64 word) + (\<langle>63,0\<rangle>((((((ucast ((RSI\<^sub>0::64 word))::64 word) << 9)::64 word) - RDX\<^sub>0)::64 word) * 0x1)::64 word))::64 word))::128 word) udiv (ucast (((\<sigma> \<turnstile> *[((RSI \<sigma>::64 word) + 0x230),4]::32 word)::32 word))::64 word))::32 word)::32 word))::64 word) * (0x4::64 word))::64 word)),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = 0xb1a7\<close>
declare P_0xb0e0_14_def[Ps]

definition P_0xb0e0_14_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0xb0e0_14_regions_set \<sigma> \<equiv> {
    (0, R15 \<sigma>, 8),
    (1, RSP\<^sub>0, 8),
    (2, ((RSI \<sigma>::64 word) + 0x210), 4),
    (3, ((RSI \<sigma>::64 word) + 0x218), 8),
    (4, ((RSI \<sigma>::64 word) + 0x230), 4),
    (5, ((R15 \<sigma>::64 word) + 0x1f8), 8),
    (6, ((RDI\<^sub>0::64 word) + 0x40), 8),
    (7, (((\<sigma> \<turnstile> *[((RSI \<sigma>::64 word) + 0x218),8]::64 word)::64 word) + (\<langle>63,0\<rangle>((ucast (((\<langle>31,0\<rangle>((ucast ((((R15 \<sigma>::64 word) + (\<langle>63,0\<rangle>((((((ucast ((RSI\<^sub>0::64 word))::64 word) << 9)::64 word) - RDX\<^sub>0)::64 word) * 0x1)::64 word))::64 word))::128 word) udiv (ucast (((\<sigma> \<turnstile> *[((RSI \<sigma>::64 word) + 0x230),4]::32 word)::32 word))::64 word))::32 word)::32 word))::64 word) * (0x4::64 word))::64 word)), 4),
    (8, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (11, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (12, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (13, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (14, ((RSP\<^sub>0::64 word) - 0x40), 8)
  }\<close>

definition P_0xb0e0_14_regions :: state_pred where
  \<open>P_0xb0e0_14_regions \<sigma> \<equiv> \<exists>regions. P_0xb0e0_14_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0xb0ea_14 :: state_pred where
  \<open>Q_0xb0ea_14 \<sigma> \<equiv> RIP \<sigma> = 0xb0ea \<and> RBX \<sigma> = ((((ucast ((((ucast (((\<langle>31,0\<rangle>((RCX\<^sub>0::64 word) - 0x1)::32 word)::32 word))::64 word) + (0x1::64 word))::64 word))::64 word) << 9)::64 word) + RDX\<^sub>0) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x38) \<and> RBP \<sigma> = ((((ucast ((RSI\<^sub>0::64 word))::64 word) << 9)::64 word) - RDX\<^sub>0) \<and> R14 \<sigma> = 0x0 \<and> R13 \<sigma> = RDI\<^sub>0 \<and> R12 \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSI \<sigma>::64 word) + 0x210),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSI \<sigma>::64 word) + 0x210),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSI \<sigma>::64 word) + 0x218),8]::64 word) = (\<sigma> \<turnstile> *[((RSI \<sigma>::64 word) + 0x218),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSI \<sigma>::64 word) + 0x230),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSI \<sigma>::64 word) + 0x230),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = 0xb1a7\<close>
declare Q_0xb0ea_14_def[Qs]

schematic_goal vpc_read_0_2_0xb0e0_0xb0e7_14[blocks]:
  assumes \<open>(P_0xb0e0_14 && P_0xb0e0_14_regions) \<sigma>\<close>
  shows \<open>exec_block 2 0xb0e7 14 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0xb0ea_14 ?\<sigma> \<and> block_usage P_0xb0e0_14_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0xb0e0_14_def P_0xb0e0_14_regions_def post: Q_0xb0ea_14_def regionset: P_0xb0e0_14_regions_set_def)

definition P_0xb0ea_true_15 :: state_pred where
  \<open>P_0xb0ea_true_15 \<sigma> \<equiv> RIP \<sigma> = 0xb0ea \<and> RBX \<sigma> = ((((ucast ((((ucast (((\<langle>31,0\<rangle>((RCX\<^sub>0::64 word) - 0x1)::32 word)::32 word))::64 word) + (0x1::64 word))::64 word))::64 word) << 9)::64 word) + RDX\<^sub>0) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x38) \<and> RBP \<sigma> = ((((ucast ((RSI\<^sub>0::64 word))::64 word) << 9)::64 word) - RDX\<^sub>0) \<and> R14 \<sigma> = 0x0 \<and> R13 \<sigma> = RDI\<^sub>0 \<and> R12 \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSI \<sigma>::64 word) + 0x210),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSI \<sigma>::64 word) + 0x210),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSI \<sigma>::64 word) + 0x218),8]::64 word) = (\<sigma> \<turnstile> *[((RSI \<sigma>::64 word) + 0x218),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSI \<sigma>::64 word) + 0x230),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSI \<sigma>::64 word) + 0x230),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = 0xb1a7\<close>
declare P_0xb0ea_true_15_def[Ps]

definition P_0xb0ea_true_15_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0xb0ea_true_15_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((RSI \<sigma>::64 word) + 0x210), 4),
    (2, ((RSI \<sigma>::64 word) + 0x218), 8),
    (3, ((RSI \<sigma>::64 word) + 0x230), 4),
    (4, ((RDI\<^sub>0::64 word) + 0x40), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (11, ((RSP\<^sub>0::64 word) - 0x40), 8)
  }\<close>

definition P_0xb0ea_true_15_regions :: state_pred where
  \<open>P_0xb0ea_true_15_regions \<sigma> \<equiv> \<exists>regions. P_0xb0ea_true_15_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0xb160_15 :: state_pred where
  \<open>Q_0xb160_15 \<sigma> \<equiv> RIP \<sigma> = 0xb160 \<and> RBX \<sigma> = ((((ucast ((((ucast (((\<langle>31,0\<rangle>((RCX\<^sub>0::64 word) - 0x1)::32 word)::32 word))::64 word) + (0x1::64 word))::64 word))::64 word) << 9)::64 word) + RDX\<^sub>0) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x38) \<and> RBP \<sigma> = ((((ucast ((RSI\<^sub>0::64 word))::64 word) << 9)::64 word) - RDX\<^sub>0) \<and> R14 \<sigma> = 0x0 \<and> R13 \<sigma> = RDI\<^sub>0 \<and> R12 \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0\<close>
declare Q_0xb160_15_def[Qs]

schematic_goal vpc_read_0_1_0xb0ea_0xb0ea_15[blocks]:
  assumes \<open>(P_0xb0ea_true_15 && P_0xb0ea_true_15_regions && ZF) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0xb0ea 15 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0xb160_15 ?\<sigma> \<and> block_usage P_0xb0ea_true_15_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0xb0ea_true_15_def P_0xb0ea_true_15_regions_def post: Q_0xb160_15_def regionset: P_0xb0ea_true_15_regions_set_def)

definition P_0xb0ea_false_16 :: state_pred where
  \<open>P_0xb0ea_false_16 \<sigma> \<equiv> RIP \<sigma> = 0xb0ea \<and> RBX \<sigma> = ((((ucast ((((ucast (((\<langle>31,0\<rangle>((RCX\<^sub>0::64 word) - 0x1)::32 word)::32 word))::64 word) + (0x1::64 word))::64 word))::64 word) << 9)::64 word) + RDX\<^sub>0) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x38) \<and> RBP \<sigma> = ((((ucast ((RSI\<^sub>0::64 word))::64 word) << 9)::64 word) - RDX\<^sub>0) \<and> R14 \<sigma> = 0x0 \<and> R13 \<sigma> = RDI\<^sub>0 \<and> R12 \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSI \<sigma>::64 word) + 0x210),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSI \<sigma>::64 word) + 0x210),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSI \<sigma>::64 word) + 0x218),8]::64 word) = (\<sigma> \<turnstile> *[((RSI \<sigma>::64 word) + 0x218),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSI \<sigma>::64 word) + 0x230),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSI \<sigma>::64 word) + 0x230),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = 0xb1a7\<close>
declare P_0xb0ea_false_16_def[Ps]

definition P_0xb0ea_false_16_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0xb0ea_false_16_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((RSI \<sigma>::64 word) + 0x210), 4),
    (2, ((RSI \<sigma>::64 word) + 0x218), 8),
    (3, ((RSI \<sigma>::64 word) + 0x230), 4),
    (4, ((RDI\<^sub>0::64 word) + 0x40), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (11, ((RSP\<^sub>0::64 word) - 0x40), 8)
  }\<close>

definition P_0xb0ea_false_16_regions :: state_pred where
  \<open>P_0xb0ea_false_16_regions \<sigma> \<equiv> \<exists>regions. P_0xb0ea_false_16_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0xb0f0_16 :: state_pred where
  \<open>Q_0xb0f0_16 \<sigma> \<equiv> RIP \<sigma> = 0xb0f0 \<and> RBX \<sigma> = ((((ucast ((((ucast (((\<langle>31,0\<rangle>((RCX\<^sub>0::64 word) - 0x1)::32 word)::32 word))::64 word) + (0x1::64 word))::64 word))::64 word) << 9)::64 word) + RDX\<^sub>0) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x38) \<and> RBP \<sigma> = ((((ucast ((RSI\<^sub>0::64 word))::64 word) << 9)::64 word) - RDX\<^sub>0) \<and> R14 \<sigma> = 0x0 \<and> R13 \<sigma> = RDI\<^sub>0 \<and> R12 \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0\<close>
declare Q_0xb0f0_16_def[Qs]

schematic_goal vpc_read_0_2_0xb0ea_0xb0ec_16[blocks]:
  assumes \<open>(P_0xb0ea_false_16 && P_0xb0ea_false_16_regions && ! ZF) \<sigma>\<close>
  shows \<open>exec_block 2 0xb0ec 16 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0xb0f0_16 ?\<sigma> \<and> block_usage P_0xb0ea_false_16_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0xb0ea_false_16_def P_0xb0ea_false_16_regions_def post: Q_0xb0f0_16_def regionset: P_0xb0ea_false_16_regions_set_def)

definition P_0xb11a_false_17 :: state_pred where
  \<open>P_0xb11a_false_17 \<sigma> \<equiv> RIP \<sigma> = 0xb11a \<and> RAX \<sigma> = ucast ((\<langle>31,0\<rangle>((ucast ((((R15 \<sigma>::64 word) + (\<langle>63,0\<rangle>((((((ucast ((RSI\<^sub>0::64 word))::64 word) << 9)::64 word) - RDX\<^sub>0)::64 word) * 0x1)::64 word))::64 word))::128 word) udiv (ucast (((\<sigma> \<turnstile> *[((RSI \<sigma>::64 word) + 0x230),4]::32 word)::32 word))::64 word))::32 word)) \<and> RBX \<sigma> = ((((ucast ((((ucast (((\<langle>31,0\<rangle>((RCX\<^sub>0::64 word) - 0x1)::32 word)::32 word))::64 word) + (0x1::64 word))::64 word))::64 word) << 9)::64 word) + RDX\<^sub>0) \<and> RCX \<sigma> = ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RSI \<sigma>::64 word) + 0x218),8]::64 word)::64 word) + (\<langle>63,0\<rangle>((ucast (((\<langle>31,0\<rangle>((ucast ((((R15 \<sigma>::64 word) + (\<langle>63,0\<rangle>((((((ucast ((RSI\<^sub>0::64 word))::64 word) << 9)::64 word) - RDX\<^sub>0)::64 word) * 0x1)::64 word))::64 word))::128 word) udiv (ucast (((\<sigma> \<turnstile> *[((RSI \<sigma>::64 word) + 0x230),4]::32 word)::32 word))::64 word))::32 word)::32 word))::64 word) * (0x4::64 word))::64 word)),4]::32 word)) \<and> RDX \<sigma> = ((ucast ((((ucast ((((R15 \<sigma>::64 word) + (\<langle>63,0\<rangle>((((((ucast ((RSI\<^sub>0::64 word))::64 word) << 9)::64 word) - RDX\<^sub>0)::64 word) * 0x1)::64 word))::64 word))::128 word) umod (ucast (((\<sigma> \<turnstile> *[((RSI \<sigma>::64 word) + 0x230),4]::32 word)::32 word))::64 word))::64 word))::64 word) >> 9) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x38) \<and> RBP \<sigma> = ((((ucast ((RSI\<^sub>0::64 word))::64 word) << 9)::64 word) - RDX\<^sub>0) \<and> R14 \<sigma> = 0x0 \<and> R13 \<sigma> = RDI\<^sub>0 \<and> R12 \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSI \<sigma>::64 word) + 0x210),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSI \<sigma>::64 word) + 0x210),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSI \<sigma>::64 word) + 0x218),8]::64 word) = (\<sigma> \<turnstile> *[((RSI \<sigma>::64 word) + 0x218),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSI \<sigma>::64 word) + 0x230),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSI \<sigma>::64 word) + 0x230),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RSI \<sigma>::64 word) + 0x218),8]::64 word)::64 word) + (\<langle>63,0\<rangle>((ucast (((\<langle>31,0\<rangle>((ucast ((((R15 \<sigma>::64 word) + (\<langle>63,0\<rangle>((((((ucast ((RSI\<^sub>0::64 word))::64 word) << 9)::64 word) - RDX\<^sub>0)::64 word) * 0x1)::64 word))::64 word))::128 word) udiv (ucast (((\<sigma> \<turnstile> *[((RSI \<sigma>::64 word) + 0x230),4]::32 word)::32 word))::64 word))::32 word)::32 word))::64 word) * (0x4::64 word))::64 word)),4]::32 word) = ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RSI \<sigma>::64 word) + 0x218),8]::64 word)::64 word) + (\<langle>63,0\<rangle>((ucast (((\<langle>31,0\<rangle>((ucast ((((R15 \<sigma>::64 word) + (\<langle>63,0\<rangle>((((((ucast ((RSI\<^sub>0::64 word))::64 word) << 9)::64 word) - RDX\<^sub>0)::64 word) * 0x1)::64 word))::64 word))::128 word) udiv (ucast (((\<sigma> \<turnstile> *[((RSI \<sigma>::64 word) + 0x230),4]::32 word)::32 word))::64 word))::32 word)::32 word))::64 word) * (0x4::64 word))::64 word)),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0\<close>
declare P_0xb11a_false_17_def[Ps]

definition P_0xb11a_false_17_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0xb11a_false_17_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((RSI \<sigma>::64 word) + 0x210), 4),
    (2, ((RSI \<sigma>::64 word) + 0x218), 8),
    (3, ((RSI \<sigma>::64 word) + 0x230), 4),
    (4, ((RSI \<sigma>::64 word) + 0x234), 4),
    (5, ((RDI\<^sub>0::64 word) + 0x40), 8),
    (6, (((\<sigma> \<turnstile> *[((RSI \<sigma>::64 word) + 0x218),8]::64 word)::64 word) + (\<langle>63,0\<rangle>((ucast (((\<langle>31,0\<rangle>((ucast ((((R15 \<sigma>::64 word) + (\<langle>63,0\<rangle>((((((ucast ((RSI\<^sub>0::64 word))::64 word) << 9)::64 word) - RDX\<^sub>0)::64 word) * 0x1)::64 word))::64 word))::128 word) udiv (ucast (((\<sigma> \<turnstile> *[((RSI \<sigma>::64 word) + 0x230),4]::32 word)::32 word))::64 word))::32 word)::32 word))::64 word) * (0x4::64 word))::64 word)), 4),
    (7, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (11, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (12, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (13, (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word), 8)
  }\<close>

definition P_0xb11a_false_17_regions :: state_pred where
  \<open>P_0xb11a_false_17_regions \<sigma> \<equiv> \<exists>regions. P_0xb11a_false_17_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0xb13d_17 :: state_pred where
  \<open>Q_0xb13d_17 \<sigma> \<equiv> RIP \<sigma> = 0xb13d \<and> RBX \<sigma> = ((((ucast ((((ucast (((\<langle>31,0\<rangle>((RCX\<^sub>0::64 word) - 0x1)::32 word)::32 word))::64 word) + (0x1::64 word))::64 word))::64 word) << 9)::64 word) + RDX\<^sub>0) \<and> RCX \<sigma> = 0x200 \<and> RDX \<sigma> = R15 \<sigma> \<and> RDI \<sigma> = (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word),8]::64 word) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x38) \<and> RBP \<sigma> = ((((ucast ((RSI\<^sub>0::64 word))::64 word) << 9)::64 word) - RDX\<^sub>0) \<and> R14 \<sigma> = 0x0 \<and> R13 \<sigma> = RDI\<^sub>0 \<and> R12 \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word),8]::64 word) = (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word),8]::64 word)\<close>
declare Q_0xb13d_17_def[Qs]

schematic_goal vpc_read_0_9_0xb11a_0xb13a_17[blocks]:
  assumes \<open>(P_0xb11a_false_17 && P_0xb11a_false_17_regions && ! ZF) \<sigma>\<close>
  shows \<open>exec_block 9 0xb13a 17 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0xb13d_17 ?\<sigma> \<and> block_usage P_0xb11a_false_17_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0xb11a_false_17_def P_0xb11a_false_17_regions_def post: Q_0xb13d_17_def regionset: P_0xb11a_false_17_regions_set_def)

definition P_0xb13d_18 :: state_pred where
  \<open>P_0xb13d_18 \<sigma> \<equiv> RIP \<sigma> = 0xb13d \<and> RBX \<sigma> = ((((ucast ((((ucast (((\<langle>31,0\<rangle>((RCX\<^sub>0::64 word) - 0x1)::32 word)::32 word))::64 word) + (0x1::64 word))::64 word))::64 word) << 9)::64 word) + RDX\<^sub>0) \<and> RCX \<sigma> = 0x200 \<and> RDX \<sigma> = R15 \<sigma> \<and> RDI \<sigma> = (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word),8]::64 word) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x38) \<and> RBP \<sigma> = ((((ucast ((RSI\<^sub>0::64 word))::64 word) << 9)::64 word) - RDX\<^sub>0) \<and> R14 \<sigma> = 0x0 \<and> R13 \<sigma> = RDI\<^sub>0 \<and> R12 \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word),8]::64 word) = (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word),8]::64 word)\<close>
declare P_0xb13d_18_def[Ps]

definition P_0xb13d_18_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0xb13d_18_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((RDI\<^sub>0::64 word) + 0x40), 8),
    (2, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x40), 8),
    (9, (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word), 8)
  }\<close>

definition P_0xb13d_18_regions :: state_pred where
  \<open>P_0xb13d_18_regions \<sigma> \<equiv> \<exists>regions. P_0xb13d_18_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_bdrv_pread_addr_0xb13d_18 :: state_pred where
  \<open>Q_bdrv_pread_addr_0xb13d_18 \<sigma> \<equiv> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x40) \<and> RIP \<sigma> = bdrv_pread_addr \<and> RBX \<sigma> = ((((ucast ((((ucast (((\<langle>31,0\<rangle>((RCX\<^sub>0::64 word) - 0x1)::32 word)::32 word))::64 word) + (0x1::64 word))::64 word))::64 word) << 9)::64 word) + RDX\<^sub>0) \<and> RCX \<sigma> = 0x200 \<and> RDX \<sigma> = R15 \<sigma> \<and> RDI \<sigma> = (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word),8]::64 word) \<and> RBP \<sigma> = ((((ucast ((RSI\<^sub>0::64 word))::64 word) << 9)::64 word) - RDX\<^sub>0) \<and> R14 \<sigma> = 0x0 \<and> R13 \<sigma> = RDI\<^sub>0 \<and> R12 \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = 0xb142 \<and> (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word),8]::64 word) = (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word),8]::64 word)\<close>
declare Q_bdrv_pread_addr_0xb13d_18_def[Qs]

schematic_goal vpc_read_0_1_0xb13d_0xb13d_18[blocks]:
  assumes \<open>(P_0xb13d_18 && P_0xb13d_18_regions) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0xb13d 18 \<sigma> \<triangleq> ?\<sigma> \<and> Q_bdrv_pread_addr_0xb13d_18 ?\<sigma> \<and> block_usage P_0xb13d_18_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0xb13d_18_def P_0xb13d_18_regions_def post: Q_bdrv_pread_addr_0xb13d_18_def regionset: P_0xb13d_18_regions_set_def)

definition P_0xb142_19 :: state_pred where
  \<open>P_0xb142_19 \<sigma> \<equiv> RIP \<sigma> = 0xb142 \<and> RBX \<sigma> = ((((ucast ((((ucast (((\<langle>31,0\<rangle>((RCX\<^sub>0::64 word) - 0x1)::32 word)::32 word))::64 word) + (0x1::64 word))::64 word))::64 word) << 9)::64 word) + RDX\<^sub>0) \<and> RCX \<sigma> = 0x200 \<and> RDX \<sigma> = R15 \<sigma> \<and> RDI \<sigma> = (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word),8]::64 word) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x38) \<and> RBP \<sigma> = ((((ucast ((RSI\<^sub>0::64 word))::64 word) << 9)::64 word) - RDX\<^sub>0) \<and> R14 \<sigma> = 0x0 \<and> R13 \<sigma> = RDI\<^sub>0 \<and> R12 \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = 0xb142 \<and> (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word),8]::64 word) = (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word),8]::64 word)\<close>
declare P_0xb142_19_def[Ps]

definition P_0xb142_19_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0xb142_19_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((RDI\<^sub>0::64 word) + 0x40), 8),
    (2, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x40), 8),
    (9, (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word), 8)
  }\<close>

definition P_0xb142_19_regions :: state_pred where
  \<open>P_0xb142_19_regions \<sigma> \<equiv> \<exists>regions. P_0xb142_19_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0xb147_19 :: state_pred where
  \<open>Q_0xb147_19 \<sigma> \<equiv> RIP \<sigma> = 0xb147 \<and> RBX \<sigma> = ((((ucast ((((ucast (((\<langle>31,0\<rangle>((RCX\<^sub>0::64 word) - 0x1)::32 word)::32 word))::64 word) + (0x1::64 word))::64 word))::64 word) << 9)::64 word) + RDX\<^sub>0) \<and> RCX \<sigma> = 0x200 \<and> RDX \<sigma> = R15 \<sigma> \<and> RDI \<sigma> = (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word),8]::64 word) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x38) \<and> RBP \<sigma> = ((((ucast ((RSI\<^sub>0::64 word))::64 word) << 9)::64 word) - RDX\<^sub>0) \<and> R14 \<sigma> = 0x0 \<and> R13 \<sigma> = RDI\<^sub>0 \<and> R12 \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = 0xb142 \<and> (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word),8]::64 word) = (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word),8]::64 word)\<close>
declare Q_0xb147_19_def[Qs]

schematic_goal vpc_read_0_1_0xb142_0xb142_19[blocks]:
  assumes \<open>(P_0xb142_19 && P_0xb142_19_regions) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0xb142 19 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0xb147_19 ?\<sigma> \<and> block_usage P_0xb142_19_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0xb142_19_def P_0xb142_19_regions_def post: Q_0xb147_19_def regionset: P_0xb142_19_regions_set_def)

definition P_0xb147_true_20 :: state_pred where
  \<open>P_0xb147_true_20 \<sigma> \<equiv> RIP \<sigma> = 0xb147 \<and> RBX \<sigma> = ((((ucast ((((ucast (((\<langle>31,0\<rangle>((RCX\<^sub>0::64 word) - 0x1)::32 word)::32 word))::64 word) + (0x1::64 word))::64 word))::64 word) << 9)::64 word) + RDX\<^sub>0) \<and> RCX \<sigma> = 0x200 \<and> RDX \<sigma> = R15 \<sigma> \<and> RDI \<sigma> = (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word),8]::64 word) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x38) \<and> RBP \<sigma> = ((((ucast ((RSI\<^sub>0::64 word))::64 word) << 9)::64 word) - RDX\<^sub>0) \<and> R14 \<sigma> = 0x0 \<and> R13 \<sigma> = RDI\<^sub>0 \<and> R12 \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = 0xb142 \<and> (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word),8]::64 word) = (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word),8]::64 word)\<close>
declare P_0xb147_true_20_def[Ps]

definition P_0xb147_true_20_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0xb147_true_20_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((RDI\<^sub>0::64 word) + 0x40), 8),
    (2, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x40), 8),
    (9, (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word), 8)
  }\<close>

definition P_0xb147_true_20_regions :: state_pred where
  \<open>P_0xb147_true_20_regions \<sigma> \<equiv> \<exists>regions. P_0xb147_true_20_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0xb0ea_20 :: state_pred where
  \<open>Q_0xb0ea_20 \<sigma> \<equiv> RIP \<sigma> = 0xb0ea \<and> RBX \<sigma> = ((((ucast ((((ucast (((\<langle>31,0\<rangle>((RCX\<^sub>0::64 word) - 0x1)::32 word)::32 word))::64 word) + (0x1::64 word))::64 word))::64 word) << 9)::64 word) + RDX\<^sub>0) \<and> RCX \<sigma> = 0x200 \<and> RDI \<sigma> = (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word),8]::64 word) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x38) \<and> RBP \<sigma> = ((((ucast ((RSI\<^sub>0::64 word))::64 word) << 9)::64 word) - RDX\<^sub>0) \<and> R14 \<sigma> = 0x0 \<and> R13 \<sigma> = RDI\<^sub>0 \<and> R12 \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = 0xb142 \<and> (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word),8]::64 word) = (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word),8]::64 word)\<close>
declare Q_0xb0ea_20_def[Qs]

schematic_goal vpc_read_0_3_0xb147_0xb0e7_20[blocks]:
  assumes \<open>(P_0xb147_true_20 && P_0xb147_true_20_regions && ZF) \<sigma>\<close>
  shows \<open>exec_block 3 0xb0e7 20 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0xb0ea_20 ?\<sigma> \<and> block_usage P_0xb147_true_20_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0xb147_true_20_def P_0xb147_true_20_regions_def post: Q_0xb0ea_20_def regionset: P_0xb147_true_20_regions_set_def)

definition P_0xb0ea_true_21 :: state_pred where
  \<open>P_0xb0ea_true_21 \<sigma> \<equiv> RIP \<sigma> = 0xb0ea \<and> RBX \<sigma> = ((((ucast ((((ucast (((\<langle>31,0\<rangle>((RCX\<^sub>0::64 word) - 0x1)::32 word)::32 word))::64 word) + (0x1::64 word))::64 word))::64 word) << 9)::64 word) + RDX\<^sub>0) \<and> RCX \<sigma> = 0x200 \<and> RDI \<sigma> = (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word),8]::64 word) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x38) \<and> RBP \<sigma> = ((((ucast ((RSI\<^sub>0::64 word))::64 word) << 9)::64 word) - RDX\<^sub>0) \<and> R14 \<sigma> = 0x0 \<and> R13 \<sigma> = RDI\<^sub>0 \<and> R12 \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = 0xb142 \<and> (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word),8]::64 word) = (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word),8]::64 word)\<close>
declare P_0xb0ea_true_21_def[Ps]

definition P_0xb0ea_true_21_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0xb0ea_true_21_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((RDI\<^sub>0::64 word) + 0x40), 8),
    (2, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x40), 8),
    (9, (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word), 8)
  }\<close>

definition P_0xb0ea_true_21_regions :: state_pred where
  \<open>P_0xb0ea_true_21_regions \<sigma> \<equiv> \<exists>regions. P_0xb0ea_true_21_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0xb160_21 :: state_pred where
  \<open>Q_0xb160_21 \<sigma> \<equiv> RIP \<sigma> = 0xb160 \<and> RBX \<sigma> = ((((ucast ((((ucast (((\<langle>31,0\<rangle>((RCX\<^sub>0::64 word) - 0x1)::32 word)::32 word))::64 word) + (0x1::64 word))::64 word))::64 word) << 9)::64 word) + RDX\<^sub>0) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x38) \<and> RBP \<sigma> = ((((ucast ((RSI\<^sub>0::64 word))::64 word) << 9)::64 word) - RDX\<^sub>0) \<and> R14 \<sigma> = 0x0 \<and> R13 \<sigma> = RDI\<^sub>0 \<and> R12 \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0\<close>
declare Q_0xb160_21_def[Qs]

schematic_goal vpc_read_0_1_0xb0ea_0xb0ea_21[blocks]:
  assumes \<open>(P_0xb0ea_true_21 && P_0xb0ea_true_21_regions && ZF) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0xb0ea 21 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0xb160_21 ?\<sigma> \<and> block_usage P_0xb0ea_true_21_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0xb0ea_true_21_def P_0xb0ea_true_21_regions_def post: Q_0xb160_21_def regionset: P_0xb0ea_true_21_regions_set_def)

definition P_0xb0ea_false_22 :: state_pred where
  \<open>P_0xb0ea_false_22 \<sigma> \<equiv> RIP \<sigma> = 0xb0ea \<and> RBX \<sigma> = ((((ucast ((((ucast (((\<langle>31,0\<rangle>((RCX\<^sub>0::64 word) - 0x1)::32 word)::32 word))::64 word) + (0x1::64 word))::64 word))::64 word) << 9)::64 word) + RDX\<^sub>0) \<and> RCX \<sigma> = 0x200 \<and> RDI \<sigma> = (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word),8]::64 word) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x38) \<and> RBP \<sigma> = ((((ucast ((RSI\<^sub>0::64 word))::64 word) << 9)::64 word) - RDX\<^sub>0) \<and> R14 \<sigma> = 0x0 \<and> R13 \<sigma> = RDI\<^sub>0 \<and> R12 \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = 0xb142 \<and> (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word),8]::64 word) = (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word),8]::64 word)\<close>
declare P_0xb0ea_false_22_def[Ps]

definition P_0xb0ea_false_22_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0xb0ea_false_22_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((RDI\<^sub>0::64 word) + 0x40), 8),
    (2, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x40), 8),
    (9, (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word), 8)
  }\<close>

definition P_0xb0ea_false_22_regions :: state_pred where
  \<open>P_0xb0ea_false_22_regions \<sigma> \<equiv> \<exists>regions. P_0xb0ea_false_22_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0xb0f0_22 :: state_pred where
  \<open>Q_0xb0f0_22 \<sigma> \<equiv> RIP \<sigma> = 0xb0f0 \<and> RBX \<sigma> = ((((ucast ((((ucast (((\<langle>31,0\<rangle>((RCX\<^sub>0::64 word) - 0x1)::32 word)::32 word))::64 word) + (0x1::64 word))::64 word))::64 word) << 9)::64 word) + RDX\<^sub>0) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x38) \<and> RBP \<sigma> = ((((ucast ((RSI\<^sub>0::64 word))::64 word) << 9)::64 word) - RDX\<^sub>0) \<and> R14 \<sigma> = 0x0 \<and> R13 \<sigma> = RDI\<^sub>0 \<and> R12 \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0\<close>
declare Q_0xb0f0_22_def[Qs]

schematic_goal vpc_read_0_2_0xb0ea_0xb0ec_22[blocks]:
  assumes \<open>(P_0xb0ea_false_22 && P_0xb0ea_false_22_regions && ! ZF) \<sigma>\<close>
  shows \<open>exec_block 2 0xb0ec 22 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0xb0f0_22 ?\<sigma> \<and> block_usage P_0xb0ea_false_22_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0xb0ea_false_22_def P_0xb0ea_false_22_regions_def post: Q_0xb0f0_22_def regionset: P_0xb0ea_false_22_regions_set_def)

definition P_0xb147_false_23 :: state_pred where
  \<open>P_0xb147_false_23 \<sigma> \<equiv> RIP \<sigma> = 0xb147 \<and> RBX \<sigma> = ((((ucast ((((ucast (((\<langle>31,0\<rangle>((RCX\<^sub>0::64 word) - 0x1)::32 word)::32 word))::64 word) + (0x1::64 word))::64 word))::64 word) << 9)::64 word) + RDX\<^sub>0) \<and> RCX \<sigma> = 0x200 \<and> RDX \<sigma> = R15 \<sigma> \<and> RDI \<sigma> = (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word),8]::64 word) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x38) \<and> RBP \<sigma> = ((((ucast ((RSI\<^sub>0::64 word))::64 word) << 9)::64 word) - RDX\<^sub>0) \<and> R14 \<sigma> = 0x0 \<and> R13 \<sigma> = RDI\<^sub>0 \<and> R12 \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = 0xb142 \<and> (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word),8]::64 word) = (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word),8]::64 word)\<close>
declare P_0xb147_false_23_def[Ps]

definition P_0xb147_false_23_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0xb147_false_23_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((RDI\<^sub>0::64 word) + 0x40), 8),
    (2, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x40), 8),
    (9, (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word), 8)
  }\<close>

definition P_0xb147_false_23_regions :: state_pred where
  \<open>P_0xb147_false_23_regions \<sigma> \<equiv> \<exists>regions. P_0xb147_false_23_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0xb149_23 :: state_pred where
  \<open>Q_0xb149_23 \<sigma> \<equiv> RIP \<sigma> = 0xb149 \<and> RBX \<sigma> = ((((ucast ((((ucast (((\<langle>31,0\<rangle>((RCX\<^sub>0::64 word) - 0x1)::32 word)::32 word))::64 word) + (0x1::64 word))::64 word))::64 word) << 9)::64 word) + RDX\<^sub>0) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x38) \<and> RBP \<sigma> = ((((ucast ((RSI\<^sub>0::64 word))::64 word) << 9)::64 word) - RDX\<^sub>0) \<and> R14 \<sigma> = 0x0 \<and> R13 \<sigma> = RDI\<^sub>0 \<and> R12 \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0\<close>
declare Q_0xb149_23_def[Qs]

schematic_goal vpc_read_0_1_0xb147_0xb147_23[blocks]:
  assumes \<open>(P_0xb147_false_23 && P_0xb147_false_23_regions && ! ZF) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0xb147 23 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0xb149_23 ?\<sigma> \<and> block_usage P_0xb147_false_23_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0xb147_false_23_def P_0xb147_false_23_regions_def post: Q_0xb149_23_def regionset: P_0xb147_false_23_regions_set_def)

definition P_0xb160_24 :: state_pred where
  \<open>P_0xb160_24 \<sigma> \<equiv> RIP \<sigma> = 0xb160 \<and> RBX \<sigma> = ((((ucast ((((ucast (((\<langle>31,0\<rangle>((RCX\<^sub>0::64 word) - 0x1)::32 word)::32 word))::64 word) + (0x1::64 word))::64 word))::64 word) << 9)::64 word) + RDX\<^sub>0) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x38) \<and> RBP \<sigma> = ((((ucast ((RSI\<^sub>0::64 word))::64 word) << 9)::64 word) - RDX\<^sub>0) \<and> R14 \<sigma> = 0x0 \<and> R13 \<sigma> = RDI\<^sub>0 \<and> R12 \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0\<close>
declare P_0xb160_24_def[Ps]

definition P_0xb160_24_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0xb160_24_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((RDI\<^sub>0::64 word) + 0x40), 8),
    (2, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x30), 8)
  }\<close>

definition P_0xb160_24_regions :: state_pred where
  \<open>P_0xb160_24_regions \<sigma> \<equiv> \<exists>regions. P_0xb160_24_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_ret_address_24 :: state_pred where
  \<open>Q_ret_address_24 \<sigma> \<equiv> RIP \<sigma> = ret_address \<and> RBX \<sigma> = RBX\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) + 0x8) \<and> RBP \<sigma> = RBP\<^sub>0 \<and> R15 \<sigma> = R15\<^sub>0 \<and> R14 \<sigma> = R14\<^sub>0 \<and> R13 \<sigma> = R13\<^sub>0 \<and> R12 \<sigma> = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0\<close>
declare Q_ret_address_24_def[Qs]

schematic_goal vpc_read_0_9_0xb160_0xb170_24[blocks]:
  assumes \<open>(P_0xb160_24 && P_0xb160_24_regions) \<sigma>\<close>
  shows \<open>exec_block 9 0xb170 24 \<sigma> \<triangleq> ?\<sigma> \<and> Q_ret_address_24 ?\<sigma> \<and> block_usage P_0xb160_24_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0xb160_24_def P_0xb160_24_regions_def post: Q_ret_address_24_def regionset: P_0xb160_24_regions_set_def)

definition P_0xb149_25 :: state_pred where
  \<open>P_0xb149_25 \<sigma> \<equiv> RIP \<sigma> = 0xb149 \<and> RBX \<sigma> = ((((ucast ((((ucast (((\<langle>31,0\<rangle>((RCX\<^sub>0::64 word) - 0x1)::32 word)::32 word))::64 word) + (0x1::64 word))::64 word))::64 word) << 9)::64 word) + RDX\<^sub>0) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x38) \<and> RBP \<sigma> = ((((ucast ((RSI\<^sub>0::64 word))::64 word) << 9)::64 word) - RDX\<^sub>0) \<and> R14 \<sigma> = 0x0 \<and> R13 \<sigma> = RDI\<^sub>0 \<and> R12 \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0\<close>
declare P_0xb149_25_def[Ps]

definition P_0xb149_25_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0xb149_25_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((RDI\<^sub>0::64 word) + 0x40), 8),
    (2, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x30), 8)
  }\<close>

definition P_0xb149_25_regions :: state_pred where
  \<open>P_0xb149_25_regions \<sigma> \<equiv> \<exists>regions. P_0xb149_25_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_ret_address_25 :: state_pred where
  \<open>Q_ret_address_25 \<sigma> \<equiv> RIP \<sigma> = ret_address \<and> RBX \<sigma> = RBX\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) + 0x8) \<and> RBP \<sigma> = RBP\<^sub>0 \<and> R15 \<sigma> = R15\<^sub>0 \<and> R14 \<sigma> = R14\<^sub>0 \<and> R13 \<sigma> = R13\<^sub>0 \<and> R12 \<sigma> = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0\<close>
declare Q_ret_address_25_def[Qs]

schematic_goal vpc_read_0_9_0xb149_0xb15c_25[blocks]:
  assumes \<open>(P_0xb149_25 && P_0xb149_25_regions) \<sigma>\<close>
  shows \<open>exec_block 9 0xb15c 25 \<sigma> \<triangleq> ?\<sigma> \<and> Q_ret_address_25 ?\<sigma> \<and> block_usage P_0xb149_25_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0xb149_25_def P_0xb149_25_regions_def post: Q_ret_address_25_def regionset: P_0xb149_25_regions_set_def)

definition vpc_read_acode :: ACode where
  \<open>vpc_read_acode =
    Block 9 0xb0b2 0;
    IF jle THEN
      Block 10 0xb170 (Suc 0)
    ELSE
      Block 13 0xb0de 2;
      WHILE P_0xb0f0_3 DO
        Block 6 0xb103 3;
        IF jbe THEN
          Block 10 0xb1a1 4;
          Block (Suc 0) 0xb1a4 5;
          CALL rep_stos_ESRDI_RAX_acode;
          Block (Suc 0) 0xb1a7 6;
          Block 2 0xb0e7 7;
          IF ZF THEN
            Block (Suc 0) 0xb0ea 8
          ELSE
            Block 2 0xb0ec 9
          FI
        ELSE
          Block 5 0xb117 10;
          IF ZF THEN
            Block 10 0xb1a1 11;
            Block (Suc 0) 0xb1a4 12;
            CALL rep_stos_ESRDI_RAX_acode;
            Block (Suc 0) 0xb1a7 13;
            Block 2 0xb0e7 14;
            IF ZF THEN
              Block (Suc 0) 0xb0ea 15
            ELSE
              Block 2 0xb0ec 16
            FI
          ELSE
            Block 9 0xb13a 17;
            Block (Suc 0) 0xb13d 18;
            CALL bdrv_pread_acode;
            Block (Suc 0) 0xb142 19;
            IF ZF THEN
              Block 3 0xb0e7 20;
              IF ZF THEN
                Block (Suc 0) 0xb0ea 21
              ELSE
                Block 2 0xb0ec 22
              FI
            ELSE
              Block (Suc 0) 0xb147 23
            FI
          FI
        FI
      OD;
      CASES [
        (P_0xb160_24,
          Block 9 0xb170 24
        ),
        (P_0xb149_25,
          Block 9 0xb15c 25
        )
      ]
    FI
  \<close>

method vcg_while for P :: state_pred uses assms =
  ((rule htriples)+)?,
  rule HTriple_weaken[where P=P],
  simp add: pred_logic Ps Qs assms,
  rule HTriple_while,
  (vcg_step assms: assms)+,
  (
    (vcg_step' assms: assms | vcg_step assms: assms)+,
    ((simp add: assms)+)?
  )?


schematic_goal "vpc_read":
  assumes
    \<open>\<forall>\<sigma>. RIP \<sigma> = 0xb0b4 \<longrightarrow> P_0xb0b4_true_1_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0xb0b4 \<longrightarrow> P_0xb0b4_false_2_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0xb0f0 \<longrightarrow> P_0xb0f0_3_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0xb109 \<longrightarrow> P_0xb109_true_4_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0xb1a4 \<longrightarrow> P_0xb1a4_5_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0xb1a7 \<longrightarrow> P_0xb1a7_6_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0xb0e0 \<longrightarrow> P_0xb0e0_7_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0xb0ea \<longrightarrow> P_0xb0ea_true_8_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0xb0ea \<longrightarrow> P_0xb0ea_false_9_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0xb109 \<longrightarrow> P_0xb109_false_10_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0xb11a \<longrightarrow> P_0xb11a_true_11_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0xb1a4 \<longrightarrow> P_0xb1a4_12_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0xb1a7 \<longrightarrow> P_0xb1a7_13_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0xb0e0 \<longrightarrow> P_0xb0e0_14_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0xb0ea \<longrightarrow> P_0xb0ea_true_15_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0xb0ea \<longrightarrow> P_0xb0ea_false_16_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0xb11a \<longrightarrow> P_0xb11a_false_17_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0xb13d \<longrightarrow> P_0xb13d_18_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0xb142 \<longrightarrow> P_0xb142_19_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0xb147 \<longrightarrow> P_0xb147_true_20_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0xb0ea \<longrightarrow> P_0xb0ea_true_21_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0xb0ea \<longrightarrow> P_0xb0ea_false_22_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0xb147 \<longrightarrow> P_0xb147_false_23_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0xb160 \<longrightarrow> P_0xb160_24_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0xb149 \<longrightarrow> P_0xb149_25_regions \<sigma>\<close>
    and [blocks]: \<open>{{Q_rep_stos_ESRDI_RAX_addr_0xb1a4_5}} \<box>rep_stos_ESRDI_RAX_acode {{P_0xb1a7_6;M_0xb1a4}}\<close>
    and [blocks]: \<open>{{Q_rep_stos_ESRDI_RAX_addr_0xb1a4_12}} \<box>rep_stos_ESRDI_RAX_acode {{P_0xb1a7_13;M_0xb1a4}}\<close>
    and [blocks]: \<open>{{Q_bdrv_pread_addr_0xb13d_18}} \<box>bdrv_pread_acode {{P_0xb142_19;M_0xb13d}}\<close>
  shows \<open>{{?P}} vpc_read_acode {{?Q;?M}}\<close>
  apply (vcg acode: vpc_read_acode_def assms: assms)
  apply (vcg_while "P_0xb0f0_3 || P_0xb160_24 || P_0xb149_25")
  apply (auto simp add: assms Ps Qs pred_logic)[1]
  apply simp
  apply (vcg_step assms: assms)+
  apply (auto simp add: assms Ps Qs pred_logic)[1]
  apply (rule htriples)+
  apply simp
  apply (vcg_step assms: assms)+
  done

end
