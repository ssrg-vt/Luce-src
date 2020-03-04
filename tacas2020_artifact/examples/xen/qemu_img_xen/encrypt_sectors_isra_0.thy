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
theory encrypt_sectors_isra_0
  imports "../../../isabelle/VCG/HTriple"
begin

locale "qemu_img_xen" = execution_context + exec_code +
  fixes AES_cbc_encrypt_0x675e_retval\<^sub>v stack_chk_fail_0x678a_retval\<^sub>v AES_cbc_encrypt_addr stack_chk_fail_addr :: \<open>64 word\<close>
    and AES_cbc_encrypt_acode stack_chk_fail_acode :: ACode
  assumes fetch:
    "fetch 0x66e0 \<equiv> (Unary (IS_8088 Push) (Storage (Reg (General SixtyFour r15))), 2)"
    "fetch 0x66e2 \<equiv> (Unary (IS_8088 Push) (Storage (Reg (General SixtyFour r14))), 2)"
    "fetch 0x66e4 \<equiv> (Unary (IS_8088 Push) (Storage (Reg (General SixtyFour r13))), 2)"
    "fetch 0x66e6 \<equiv> (Unary (IS_8088 Push) (Storage (Reg (General SixtyFour r12))), 2)"
    "fetch 0x66e8 \<equiv> (Unary (IS_8088 Push) (Storage (Reg (General SixtyFour rbp))), 1)"
    "fetch 0x66e9 \<equiv> (Unary (IS_8088 Push) (Storage (Reg (General SixtyFour rbx))), 1)"
    "fetch 0x66ea \<equiv> (Binary (IS_8088 Sub) (Reg (General SixtyFour rsp)) (Immediate SixtyFour (ImmVal 56)), 4)"
    "fetch 0x66ee \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour rax)) (Storage (Memory SixtyFour (A_SizeDirective 64 (A_Plus (A_FromReg (General SixtyFour fs)) (A_WordConstant 40))))), 9)"
    "fetch 0x66f7 \<equiv> (Binary (IS_8088 Mov) (Memory SixtyFour (A_SizeDirective 64 (A_Plus (A_FromReg (General SixtyFour rsp)) (A_WordConstant 40)))) (Storage (Reg (General SixtyFour rax))), 5)"
    "fetch 0x66fc \<equiv> (Binary (IS_8088 Xor) (Reg (General ThirtyTwo rax)) (Storage (Reg (General ThirtyTwo rax))), 2)"
    "fetch 0x66fe \<equiv> (Binary (IS_8088 Test) (Reg (General ThirtyTwo rcx)) (Storage (Reg (General ThirtyTwo rcx))), 2)"
    "fetch 0x6700 \<equiv> (Unary (IS_8088 Jle) (Immediate SixtyFour (ImmVal 26475)), 2)"
    "fetch 0x6702 \<equiv> (Binary (IS_8088 Lea) (Reg (General ThirtyTwo r12)) (Storage (Memory SixtyFour (A_Minus (A_FromReg (General SixtyFour rcx)) (A_WordConstant 1)))), 4)"
    "fetch 0x6706 \<equiv> (Binary (IS_8088 Lea) (Reg (General SixtyFour rbx)) (Storage (Memory SixtyFour (A_Plus (A_FromReg (General SixtyFour rdi)) (A_WordConstant 1)))), 4)"
    "fetch 0x670a \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour rbp)) (Storage (Reg (General SixtyFour rsi))), 3)"
    "fetch 0x670d \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour r15)) (Storage (Reg (General SixtyFour rdx))), 3)"
    "fetch 0x6710 \<equiv> (Binary (IS_8088 Lea) (Reg (General SixtyFour rax)) (Storage (Memory SixtyFour (A_Plus (A_FromReg (General SixtyFour rsp)) (A_WordConstant 16)))), 5)"
    "fetch 0x6715 \<equiv> (Binary (IS_8088 Mov) (Reg (General ThirtyTwo r13)) (Storage (Reg (General ThirtyTwo r8))), 3)"
    "fetch 0x6718 \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour r14)) (Storage (Reg (General SixtyFour r9))), 3)"
    "fetch 0x671b \<equiv> (Binary (IS_8088 Add) (Reg (General SixtyFour r12)) (Storage (Reg (General SixtyFour rbx))), 3)"
    "fetch 0x671e \<equiv> (Binary (IS_8088 Mov) (Memory SixtyFour (A_SizeDirective 64 (A_Plus (A_FromReg (General SixtyFour rsp)) (A_WordConstant 8)))) (Storage (Reg (General SixtyFour rax))), 5)"
    "fetch 0x6723 \<equiv> (Unary (IS_8088 Jmp) (Immediate SixtyFour (ImmVal 26412)), 2)"
    "fetch 0x6725 \<equiv> (Unary (IS_8088 Nop) (Storage (Memory ThirtyTwo (A_SizeDirective 32 (A_FromReg (General SixtyFour rax))))), 3)"
    "fetch 0x6728 \<equiv> (Binary (IS_8088 Add) (Reg (General SixtyFour rbx)) (Immediate SixtyFour (ImmVal 1)), 4)"
    "fetch 0x672c \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour r8)) (Storage (Memory SixtyFour (A_SizeDirective 64 (A_Plus (A_FromReg (General SixtyFour rsp)) (A_WordConstant 8))))), 5)"
    "fetch 0x6731 \<equiv> (Binary (IS_8088 Mov) (Memory SixtyFour (A_SizeDirective 64 (A_Plus (A_FromReg (General SixtyFour rsp)) (A_WordConstant 16)))) (Storage (Reg (General SixtyFour rdi))), 5)"
    "fetch 0x6736 \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour rsi)) (Storage (Reg (General SixtyFour rbp))), 3)"
    "fetch 0x6739 \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour rdi)) (Storage (Reg (General SixtyFour r15))), 3)"
    "fetch 0x673c \<equiv> (Binary (IS_8088 Mov) (Reg (General ThirtyTwo r9)) (Storage (Reg (General ThirtyTwo r13))), 3)"
    "fetch 0x673f \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour rcx)) (Storage (Reg (General SixtyFour r14))), 3)"
    "fetch 0x6742 \<equiv> (Binary (IS_8088 Mov) (Reg (General ThirtyTwo rdx)) (Immediate SixtyFour (ImmVal 512)), 5)"
    "fetch 0x6747 \<equiv> (Binary (IS_8088 Mov) (Memory SixtyFour (A_SizeDirective 64 (A_Plus (A_FromReg (General SixtyFour rsp)) (A_WordConstant 24)))) (Immediate SixtyFour (ImmVal 0)), 9)"
    "fetch 0x6750 \<equiv> (Binary (IS_8088 Add) (Reg (General SixtyFour r15)) (Immediate SixtyFour (ImmVal 512)), 7)"
    "fetch 0x6757 \<equiv> (Binary (IS_8088 Add) (Reg (General SixtyFour rbp)) (Immediate SixtyFour (ImmVal 512)), 7)"
    "fetch 0x675e \<equiv> (Unary (IS_8088 Call) (Immediate SixtyFour (ImmLabel ''AES_cbc_encrypt'')), 5)"
    "fetch 0x6763 \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour rdi)) (Storage (Reg (General SixtyFour rbx))), 3)"
    "fetch 0x6766 \<equiv> (Binary (IS_8088 Cmp) (Reg (General SixtyFour rbx)) (Storage (Reg (General SixtyFour r12))), 3)"
    "fetch 0x6769 \<equiv> (Unary (IS_8088 Jne) (Immediate SixtyFour (ImmVal 26408)), 2)"
    "fetch 0x676b \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour rax)) (Storage (Memory SixtyFour (A_SizeDirective 64 (A_Plus (A_FromReg (General SixtyFour rsp)) (A_WordConstant 40))))), 5)"
    "fetch 0x6770 \<equiv> (Binary (IS_8088 Xor) (Reg (General SixtyFour rax)) (Storage (Memory SixtyFour (A_SizeDirective 64 (A_Plus (A_FromReg (General SixtyFour fs)) (A_WordConstant 40))))), 9)"
    "fetch 0x6779 \<equiv> (Unary (IS_8088 Jne) (Immediate SixtyFour (ImmVal 26506)), 2)"
    "fetch 0x677b \<equiv> (Binary (IS_8088 Add) (Reg (General SixtyFour rsp)) (Immediate SixtyFour (ImmVal 56)), 4)"
    "fetch 0x677f \<equiv> (Unary (IS_8088 Pop) (Storage (Reg (General SixtyFour rbx))), 1)"
    "fetch 0x6780 \<equiv> (Unary (IS_8088 Pop) (Storage (Reg (General SixtyFour rbp))), 1)"
    "fetch 0x6781 \<equiv> (Unary (IS_8088 Pop) (Storage (Reg (General SixtyFour r12))), 2)"
    "fetch 0x6783 \<equiv> (Unary (IS_8088 Pop) (Storage (Reg (General SixtyFour r13))), 2)"
    "fetch 0x6785 \<equiv> (Unary (IS_8088 Pop) (Storage (Reg (General SixtyFour r14))), 2)"
    "fetch 0x6787 \<equiv> (Unary (IS_8088 Pop) (Storage (Reg (General SixtyFour r15))), 2)"
    "fetch 0x6789 \<equiv> (Nullary (IS_8088 Ret), 1)"
    "fetch 0x678a \<equiv> (Unary (IS_8088 Call) (Immediate SixtyFour (ImmLabel ''__stack_chk_fail'')), 5)"
    and \<alpha>_def: \<open>\<alpha> = \<lparr>text_sections = [], data_sections = [], labels_to_offsets = [], binary_offset = 0\<rparr>\<close>
    and AES_cbc_encrypt\<^sub>a\<^sub>d\<^sub>d\<^sub>r[simp]: \<open>the (label_to_address \<alpha> ''AES_cbc_encrypt'') = AES_cbc_encrypt_addr\<close>
    and stack_chk_fail\<^sub>a\<^sub>d\<^sub>d\<^sub>r[simp]: \<open>the (label_to_address \<alpha> ''__stack_chk_fail'') = stack_chk_fail_addr\<close>
begin

text \<open>Using definitions that don't get unfolded immediately prevents locale argument issues.\<close>
definition \<open>AES_cbc_encrypt_0x675e_retval \<equiv> AES_cbc_encrypt_0x675e_retval\<^sub>v\<close>
definition \<open>stack_chk_fail_0x678a_retval \<equiv> stack_chk_fail_0x678a_retval\<^sub>v\<close>

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
  auto simp add: simp_rules Let'_def read_region'_def write_block'_def get'_def set'_def step_def exec_instr_def presimplify add simp del: del

method steps uses pre post regionset add del =
  auto simp: pred_logic pre regionset,
  (step add: add del: del)+,
  (auto simp add: eq_def)[1],
  auto simp: block_usage_def eq_def setcc_def cmovcc_def if'_then_else_def sub_sign_flag_def simp_rules Let'_def read_region'_def write_block'_def get'_def set'_def post regionset

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

method vcg_while for P :: state_pred uses assms =
  ((rule htriples)+)?,
  rule HTriple_weaken[where P=P],
  simp add: pred_logic Ps Qs assms,
  rule HTriple_while

method vcg uses acode assms =
  subst acode,
  (vcg_step assms: assms)+

end

locale "encrypt_sectors_isra_0" = "qemu_img_xen" +
  fixes RAX\<^sub>0\<^sub>v RBX\<^sub>0\<^sub>v RCX\<^sub>0\<^sub>v RDX\<^sub>0\<^sub>v RDI\<^sub>0\<^sub>v RSI\<^sub>0\<^sub>v RSP\<^sub>0\<^sub>v RBP\<^sub>0\<^sub>v R15\<^sub>0\<^sub>v R14\<^sub>0\<^sub>v R13\<^sub>0\<^sub>v R12\<^sub>0\<^sub>v R9\<^sub>0\<^sub>v R8\<^sub>0\<^sub>v FS\<^sub>0\<^sub>v ret_address\<^sub>v :: \<open>64 word\<close>
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
definition \<open>R9\<^sub>0 \<equiv> R9\<^sub>0\<^sub>v\<close>
definition \<open>R8\<^sub>0 \<equiv> R8\<^sub>0\<^sub>v\<close>
definition \<open>FS\<^sub>0 \<equiv> FS\<^sub>0\<^sub>v\<close>
definition \<open>ret_address \<equiv> ret_address\<^sub>v\<close>

definition P_0x66e0_0 :: state_pred where
  \<open>P_0x66e0_0 \<sigma> \<equiv> RIP \<sigma> = 0x66e0 \<and> RAX \<sigma> = RAX\<^sub>0 \<and> RBX \<sigma> = RBX\<^sub>0 \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = RDX\<^sub>0 \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = RSP\<^sub>0 \<and> RBP \<sigma> = RBP\<^sub>0 \<and> R15 \<sigma> = R15\<^sub>0 \<and> R14 \<sigma> = R14\<^sub>0 \<and> R13 \<sigma> = R13\<^sub>0 \<and> R12 \<sigma> = R12\<^sub>0 \<and> R9 \<sigma> = R9\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address\<close>
declare P_0x66e0_0_def[Ps]

definition P_0x66e0_0_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x66e0_0_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((FS\<^sub>0::64 word) + 0x28), 8),
    (2, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x40), 8)
  }\<close>

definition P_0x66e0_0_regions :: state_pred where
  \<open>P_0x66e0_0_regions \<sigma> \<equiv> \<exists>regions. P_0x66e0_0_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x6700_0 :: state_pred where
  \<open>Q_0x6700_0 \<sigma> \<equiv> RIP \<sigma> = 0x6700 \<and> RAX \<sigma> = 0x0 \<and> RBX \<sigma> = RBX\<^sub>0 \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = RDX\<^sub>0 \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x68) \<and> RBP \<sigma> = RBP\<^sub>0 \<and> R15 \<sigma> = R15\<^sub>0 \<and> R14 \<sigma> = R14\<^sub>0 \<and> R13 \<sigma> = R13\<^sub>0 \<and> R12 \<sigma> = R12\<^sub>0 \<and> R9 \<sigma> = R9\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word)\<close>
declare Q_0x6700_0_def[Qs]

schematic_goal encrypt_sectors_isra_0_0_11_0x66e0_0x66fe_0[blocks]:
  assumes \<open>(P_0x66e0_0 && P_0x66e0_0_regions) \<sigma>\<close>
  shows \<open>exec_block 11 0x66fe 0 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x6700_0 ?\<sigma> \<and> block_usage P_0x66e0_0_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x66e0_0_def P_0x66e0_0_regions_def post: Q_0x6700_0_def regionset: P_0x66e0_0_regions_set_def)

definition P_0x6700_true_1 :: state_pred where
  \<open>P_0x6700_true_1 \<sigma> \<equiv> RIP \<sigma> = 0x6700 \<and> RAX \<sigma> = 0x0 \<and> RBX \<sigma> = RBX\<^sub>0 \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = RDX\<^sub>0 \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x68) \<and> RBP \<sigma> = RBP\<^sub>0 \<and> R15 \<sigma> = R15\<^sub>0 \<and> R14 \<sigma> = R14\<^sub>0 \<and> R13 \<sigma> = R13\<^sub>0 \<and> R12 \<sigma> = R12\<^sub>0 \<and> R9 \<sigma> = R9\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word)\<close>
declare P_0x6700_true_1_def[Ps]

definition P_0x6700_true_1_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x6700_true_1_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((FS\<^sub>0::64 word) + 0x28), 8),
    (2, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x40), 8)
  }\<close>

definition P_0x6700_true_1_regions :: state_pred where
  \<open>P_0x6700_true_1_regions \<sigma> \<equiv> \<exists>regions. P_0x6700_true_1_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x676b_1 :: state_pred where
  \<open>Q_0x676b_1 \<sigma> \<equiv> RIP \<sigma> = 0x676b \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x68) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word)\<close>
declare Q_0x676b_1_def[Qs]

schematic_goal encrypt_sectors_isra_0_0_1_0x6700_0x6700_1[blocks]:
  assumes \<open>(P_0x6700_true_1 && P_0x6700_true_1_regions && jle) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x6700 (Suc 0) \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x676b_1 ?\<sigma> \<and> block_usage P_0x6700_true_1_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x6700_true_1_def P_0x6700_true_1_regions_def post: Q_0x676b_1_def regionset: P_0x6700_true_1_regions_set_def)

definition P_0x6700_false_2 :: state_pred where
  \<open>P_0x6700_false_2 \<sigma> \<equiv> RIP \<sigma> = 0x6700 \<and> RAX \<sigma> = 0x0 \<and> RBX \<sigma> = RBX\<^sub>0 \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = RDX\<^sub>0 \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x68) \<and> RBP \<sigma> = RBP\<^sub>0 \<and> R15 \<sigma> = R15\<^sub>0 \<and> R14 \<sigma> = R14\<^sub>0 \<and> R13 \<sigma> = R13\<^sub>0 \<and> R12 \<sigma> = R12\<^sub>0 \<and> R9 \<sigma> = R9\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word)\<close>
declare P_0x6700_false_2_def[Ps]

definition P_0x6700_false_2_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x6700_false_2_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((FS\<^sub>0::64 word) + 0x28), 8),
    (2, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x40), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x60), 8)
  }\<close>

definition P_0x6700_false_2_regions :: state_pred where
  \<open>P_0x6700_false_2_regions \<sigma> \<equiv> \<exists>regions. P_0x6700_false_2_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x672c_2 :: state_pred where
  \<open>Q_0x672c_2 \<sigma> \<equiv> RIP \<sigma> = 0x672c \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x68) \<and> R14 \<sigma> = R9\<^sub>0 \<and> R13 \<sigma> = ucast ((\<langle>31,0\<rangle>R8\<^sub>0::32 word)) \<and> R12 \<sigma> = ((ucast (((\<langle>31,0\<rangle>((RCX\<^sub>0::64 word) - 0x1)::32 word)::32 word))::64 word) + (((RDI\<^sub>0::64 word) + 0x1)::64 word)) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x60),8]::64 word) = ((RSP\<^sub>0::64 word) - 0x58)\<close>
declare Q_0x672c_2_def[Qs]

schematic_goal encrypt_sectors_isra_0_0_11_0x6700_0x6723_2[blocks]:
  assumes \<open>(P_0x6700_false_2 && P_0x6700_false_2_regions && ! jle) \<sigma>\<close>
  shows \<open>exec_block 11 0x6723 2 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x672c_2 ?\<sigma> \<and> block_usage P_0x6700_false_2_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x6700_false_2_def P_0x6700_false_2_regions_def post: Q_0x672c_2_def regionset: P_0x6700_false_2_regions_set_def)

definition P_0x672c_3 :: state_pred where
  \<open>P_0x672c_3 \<sigma> \<equiv> RIP \<sigma> = 0x672c \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x68) \<and> R14 \<sigma> = R9\<^sub>0 \<and> R13 \<sigma> = ucast ((\<langle>31,0\<rangle>R8\<^sub>0::32 word)) \<and> R12 \<sigma> = ((ucast (((\<langle>31,0\<rangle>((RCX\<^sub>0::64 word) - 0x1)::32 word)::32 word))::64 word) + (((RDI\<^sub>0::64 word) + 0x1)::64 word)) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x60),8]::64 word) = ((RSP\<^sub>0::64 word) - 0x58)\<close>
declare P_0x672c_3_def[Ps]

definition P_0x672c_3_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x672c_3_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((FS\<^sub>0::64 word) + 0x28), 8),
    (2, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x40), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x50), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x58), 8),
    (11, ((RSP\<^sub>0::64 word) - 0x60), 8)
  }\<close>

definition P_0x672c_3_regions :: state_pred where
  \<open>P_0x672c_3_regions \<sigma> \<equiv> \<exists>regions. P_0x672c_3_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x675e_3 :: state_pred where
  \<open>Q_0x675e_3 \<sigma> \<equiv> RIP \<sigma> = 0x675e \<and> RCX \<sigma> = R9\<^sub>0 \<and> RDX \<sigma> = 0x200 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x68) \<and> R14 \<sigma> = R9\<^sub>0 \<and> R13 \<sigma> = ucast ((\<langle>31,0\<rangle>R8\<^sub>0::32 word)) \<and> R12 \<sigma> = ((ucast (((\<langle>31,0\<rangle>((RCX\<^sub>0::64 word) - 0x1)::32 word)::32 word))::64 word) + (((RDI\<^sub>0::64 word) + 0x1)::64 word)) \<and> R9 \<sigma> = ucast ((\<langle>31,0\<rangle>R8\<^sub>0::32 word)) \<and> R8 \<sigma> = ((RSP\<^sub>0::64 word) - 0x58) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),8]::64 word) = 0x0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x60),8]::64 word) = ((RSP\<^sub>0::64 word) - 0x58)\<close>
declare Q_0x675e_3_def[Qs]

schematic_goal encrypt_sectors_isra_0_0_10_0x672c_0x6757_3[blocks]:
  assumes \<open>(P_0x672c_3 && P_0x672c_3_regions) \<sigma>\<close>
  shows \<open>exec_block 10 0x6757 3 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x675e_3 ?\<sigma> \<and> block_usage P_0x672c_3_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x672c_3_def P_0x672c_3_regions_def post: Q_0x675e_3_def regionset: P_0x672c_3_regions_set_def)

definition P_0x675e_4 :: state_pred where
  \<open>P_0x675e_4 \<sigma> \<equiv> RIP \<sigma> = 0x675e \<and> RCX \<sigma> = R9\<^sub>0 \<and> RDX \<sigma> = 0x200 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x68) \<and> R14 \<sigma> = R9\<^sub>0 \<and> R13 \<sigma> = ucast ((\<langle>31,0\<rangle>R8\<^sub>0::32 word)) \<and> R12 \<sigma> = ((ucast (((\<langle>31,0\<rangle>((RCX\<^sub>0::64 word) - 0x1)::32 word)::32 word))::64 word) + (((RDI\<^sub>0::64 word) + 0x1)::64 word)) \<and> R9 \<sigma> = ucast ((\<langle>31,0\<rangle>R8\<^sub>0::32 word)) \<and> R8 \<sigma> = ((RSP\<^sub>0::64 word) - 0x58) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),8]::64 word) = 0x0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x60),8]::64 word) = ((RSP\<^sub>0::64 word) - 0x58)\<close>
declare P_0x675e_4_def[Ps]

definition P_0x675e_4_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x675e_4_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((FS\<^sub>0::64 word) + 0x28), 8),
    (2, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x40), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x50), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x60), 8),
    (11, ((RSP\<^sub>0::64 word) - 0x70), 8)
  }\<close>

definition P_0x675e_4_regions :: state_pred where
  \<open>P_0x675e_4_regions \<sigma> \<equiv> \<exists>regions. P_0x675e_4_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_AES_cbc_encrypt_addr_0x675e_4 :: state_pred where
  \<open>Q_AES_cbc_encrypt_addr_0x675e_4 \<sigma> \<equiv> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x70) \<and> RIP \<sigma> = AES_cbc_encrypt_addr \<and> RCX \<sigma> = R9\<^sub>0 \<and> RDX \<sigma> = 0x200 \<and> R14 \<sigma> = R9\<^sub>0 \<and> R13 \<sigma> = ucast ((\<langle>31,0\<rangle>R8\<^sub>0::32 word)) \<and> R12 \<sigma> = ((ucast (((\<langle>31,0\<rangle>((RCX\<^sub>0::64 word) - 0x1)::32 word)::32 word))::64 word) + (((RDI\<^sub>0::64 word) + 0x1)::64 word)) \<and> R9 \<sigma> = ucast ((\<langle>31,0\<rangle>R8\<^sub>0::32 word)) \<and> R8 \<sigma> = ((RSP\<^sub>0::64 word) - 0x58) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),8]::64 word) = 0x0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x60),8]::64 word) = ((RSP\<^sub>0::64 word) - 0x58) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),8]::64 word) = 0x6763\<close>
declare Q_AES_cbc_encrypt_addr_0x675e_4_def[Qs]

schematic_goal encrypt_sectors_isra_0_0_1_0x675e_0x675e_4[blocks]:
  assumes \<open>(P_0x675e_4 && P_0x675e_4_regions) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x675e 4 \<sigma> \<triangleq> ?\<sigma> \<and> Q_AES_cbc_encrypt_addr_0x675e_4 ?\<sigma> \<and> block_usage P_0x675e_4_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x675e_4_def P_0x675e_4_regions_def post: Q_AES_cbc_encrypt_addr_0x675e_4_def regionset: P_0x675e_4_regions_set_def)

definition P_0x6763_5 :: state_pred where
  \<open>P_0x6763_5 \<sigma> \<equiv> RIP \<sigma> = 0x6763 \<and> RCX \<sigma> = R9\<^sub>0 \<and> RDX \<sigma> = 0x200 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x68) \<and> R14 \<sigma> = R9\<^sub>0 \<and> R13 \<sigma> = ucast ((\<langle>31,0\<rangle>R8\<^sub>0::32 word)) \<and> R12 \<sigma> = ((ucast (((\<langle>31,0\<rangle>((RCX\<^sub>0::64 word) - 0x1)::32 word)::32 word))::64 word) + (((RDI\<^sub>0::64 word) + 0x1)::64 word)) \<and> R9 \<sigma> = ucast ((\<langle>31,0\<rangle>R8\<^sub>0::32 word)) \<and> R8 \<sigma> = ((RSP\<^sub>0::64 word) - 0x58) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),8]::64 word) = 0x0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x60),8]::64 word) = ((RSP\<^sub>0::64 word) - 0x58) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),8]::64 word) = 0x6763\<close>
declare P_0x6763_5_def[Ps]

definition P_0x6763_5_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x6763_5_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((FS\<^sub>0::64 word) + 0x28), 8),
    (2, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x40), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x50), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x60), 8),
    (11, ((RSP\<^sub>0::64 word) - 0x70), 8)
  }\<close>

definition P_0x6763_5_regions :: state_pred where
  \<open>P_0x6763_5_regions \<sigma> \<equiv> \<exists>regions. P_0x6763_5_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x6769_5 :: state_pred where
  \<open>Q_0x6769_5 \<sigma> \<equiv> RIP \<sigma> = 0x6769 \<and> RCX \<sigma> = R9\<^sub>0 \<and> RDX \<sigma> = 0x200 \<and> RDI \<sigma> = RBX \<sigma> \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x68) \<and> R14 \<sigma> = R9\<^sub>0 \<and> R13 \<sigma> = ucast ((\<langle>31,0\<rangle>R8\<^sub>0::32 word)) \<and> R12 \<sigma> = ((ucast (((\<langle>31,0\<rangle>((RCX\<^sub>0::64 word) - 0x1)::32 word)::32 word))::64 word) + (((RDI\<^sub>0::64 word) + 0x1)::64 word)) \<and> R9 \<sigma> = ucast ((\<langle>31,0\<rangle>R8\<^sub>0::32 word)) \<and> R8 \<sigma> = ((RSP\<^sub>0::64 word) - 0x58) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),8]::64 word) = 0x0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x60),8]::64 word) = ((RSP\<^sub>0::64 word) - 0x58) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),8]::64 word) = 0x6763\<close>
declare Q_0x6769_5_def[Qs]

schematic_goal encrypt_sectors_isra_0_0_2_0x6763_0x6766_5[blocks]:
  assumes \<open>(P_0x6763_5 && P_0x6763_5_regions) \<sigma>\<close>
  shows \<open>exec_block 2 0x6766 5 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x6769_5 ?\<sigma> \<and> block_usage P_0x6763_5_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x6763_5_def P_0x6763_5_regions_def post: Q_0x6769_5_def regionset: P_0x6763_5_regions_set_def)

definition P_0x6769_true_6 :: state_pred where
  \<open>P_0x6769_true_6 \<sigma> \<equiv> RIP \<sigma> = 0x6769 \<and> RCX \<sigma> = R9\<^sub>0 \<and> RDX \<sigma> = 0x200 \<and> RDI \<sigma> = RBX \<sigma> \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x68) \<and> R14 \<sigma> = R9\<^sub>0 \<and> R13 \<sigma> = ucast ((\<langle>31,0\<rangle>R8\<^sub>0::32 word)) \<and> R12 \<sigma> = ((ucast (((\<langle>31,0\<rangle>((RCX\<^sub>0::64 word) - 0x1)::32 word)::32 word))::64 word) + (((RDI\<^sub>0::64 word) + 0x1)::64 word)) \<and> R9 \<sigma> = ucast ((\<langle>31,0\<rangle>R8\<^sub>0::32 word)) \<and> R8 \<sigma> = ((RSP\<^sub>0::64 word) - 0x58) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),8]::64 word) = 0x0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x60),8]::64 word) = ((RSP\<^sub>0::64 word) - 0x58) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),8]::64 word) = 0x6763\<close>
declare P_0x6769_true_6_def[Ps]

definition P_0x6769_true_6_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x6769_true_6_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((FS\<^sub>0::64 word) + 0x28), 8),
    (2, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x40), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x50), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x60), 8),
    (11, ((RSP\<^sub>0::64 word) - 0x70), 8)
  }\<close>

definition P_0x6769_true_6_regions :: state_pred where
  \<open>P_0x6769_true_6_regions \<sigma> \<equiv> \<exists>regions. P_0x6769_true_6_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x672c_6 :: state_pred where
  \<open>Q_0x672c_6 \<sigma> \<equiv> RIP \<sigma> = 0x672c \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x68) \<and> R14 \<sigma> = R9\<^sub>0 \<and> R13 \<sigma> = ucast ((\<langle>31,0\<rangle>R8\<^sub>0::32 word)) \<and> R12 \<sigma> = ((ucast (((\<langle>31,0\<rangle>((RCX\<^sub>0::64 word) - 0x1)::32 word)::32 word))::64 word) + (((RDI\<^sub>0::64 word) + 0x1)::64 word)) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x60),8]::64 word) = ((RSP\<^sub>0::64 word) - 0x58)\<close>
declare Q_0x672c_6_def[Qs]

schematic_goal encrypt_sectors_isra_0_0_2_0x6769_0x6728_6[blocks]:
  assumes \<open>(P_0x6769_true_6 && P_0x6769_true_6_regions && !ZF) \<sigma>\<close>
  shows \<open>exec_block 2 0x6728 6 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x672c_6 ?\<sigma> \<and> block_usage P_0x6769_true_6_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x6769_true_6_def P_0x6769_true_6_regions_def post: Q_0x672c_6_def regionset: P_0x6769_true_6_regions_set_def)

definition P_0x6769_false_7 :: state_pred where
  \<open>P_0x6769_false_7 \<sigma> \<equiv> RIP \<sigma> = 0x6769 \<and> RCX \<sigma> = R9\<^sub>0 \<and> RDX \<sigma> = 0x200 \<and> RDI \<sigma> = RBX \<sigma> \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x68) \<and> R14 \<sigma> = R9\<^sub>0 \<and> R13 \<sigma> = ucast ((\<langle>31,0\<rangle>R8\<^sub>0::32 word)) \<and> R12 \<sigma> = ((ucast (((\<langle>31,0\<rangle>((RCX\<^sub>0::64 word) - 0x1)::32 word)::32 word))::64 word) + (((RDI\<^sub>0::64 word) + 0x1)::64 word)) \<and> R9 \<sigma> = ucast ((\<langle>31,0\<rangle>R8\<^sub>0::32 word)) \<and> R8 \<sigma> = ((RSP\<^sub>0::64 word) - 0x58) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),8]::64 word) = 0x0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x60),8]::64 word) = ((RSP\<^sub>0::64 word) - 0x58) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),8]::64 word) = 0x6763\<close>
declare P_0x6769_false_7_def[Ps]

definition P_0x6769_false_7_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x6769_false_7_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((FS\<^sub>0::64 word) + 0x28), 8),
    (2, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x40), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x50), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x60), 8),
    (11, ((RSP\<^sub>0::64 word) - 0x70), 8)
  }\<close>

definition P_0x6769_false_7_regions :: state_pred where
  \<open>P_0x6769_false_7_regions \<sigma> \<equiv> \<exists>regions. P_0x6769_false_7_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x676b_7 :: state_pred where
  \<open>Q_0x676b_7 \<sigma> \<equiv> RIP \<sigma> = 0x676b \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x68) \<and> R14 \<sigma> = R9\<^sub>0 \<and> R13 \<sigma> = ucast ((\<langle>31,0\<rangle>R8\<^sub>0::32 word)) \<and> R12 \<sigma> = ((ucast (((\<langle>31,0\<rangle>((RCX\<^sub>0::64 word) - 0x1)::32 word)::32 word))::64 word) + (((RDI\<^sub>0::64 word) + 0x1)::64 word)) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x60),8]::64 word) = ((RSP\<^sub>0::64 word) - 0x58)\<close>
declare Q_0x676b_7_def[Qs]

schematic_goal encrypt_sectors_isra_0_0_1_0x6769_0x6769_7[blocks]:
  assumes \<open>(P_0x6769_false_7 && P_0x6769_false_7_regions && ! !ZF) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x6769 7 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x676b_7 ?\<sigma> \<and> block_usage P_0x6769_false_7_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x6769_false_7_def P_0x6769_false_7_regions_def post: Q_0x676b_7_def regionset: P_0x6769_false_7_regions_set_def)

definition P_0x676b_8 :: state_pred where
  \<open>P_0x676b_8 \<sigma> \<equiv> RIP \<sigma> = 0x676b \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x68) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word)\<close>
declare P_0x676b_8_def[Ps]

definition P_0x676b_8_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x676b_8_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((FS\<^sub>0::64 word) + 0x28), 8),
    (2, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x40), 8)
  }\<close>

definition P_0x676b_8_regions :: state_pred where
  \<open>P_0x676b_8_regions \<sigma> \<equiv> \<exists>regions. P_0x676b_8_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x6779_8 :: state_pred where
  \<open>Q_0x6779_8 \<sigma> \<equiv> RIP \<sigma> = 0x6779 \<and> RAX \<sigma> = 0x0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x68) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word)\<close>
declare Q_0x6779_8_def[Qs]

schematic_goal encrypt_sectors_isra_0_0_2_0x676b_0x6770_8[blocks]:
  assumes \<open>(P_0x676b_8 && P_0x676b_8_regions) \<sigma>\<close>
  shows \<open>exec_block 2 0x6770 8 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x6779_8 ?\<sigma> \<and> block_usage P_0x676b_8_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x676b_8_def P_0x676b_8_regions_def post: Q_0x6779_8_def regionset: P_0x676b_8_regions_set_def)

definition P_0x6779_true_9 :: state_pred where
  \<open>P_0x6779_true_9 \<sigma> \<equiv> RIP \<sigma> = 0x6779 \<and> RAX \<sigma> = 0x0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x68) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word)\<close>
declare P_0x6779_true_9_def[Ps]

definition P_0x6779_true_9_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x6779_true_9_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((FS\<^sub>0::64 word) + 0x28), 8),
    (2, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x40), 8)
  }\<close>

definition P_0x6779_true_9_regions :: state_pred where
  \<open>P_0x6779_true_9_regions \<sigma> \<equiv> \<exists>regions. P_0x6779_true_9_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x678a_9 :: state_pred where
  \<open>Q_0x678a_9 \<sigma> \<equiv> RIP \<sigma> = 0x678a \<and> RAX \<sigma> = 0x0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x68) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word)\<close>
declare Q_0x678a_9_def[Qs]

schematic_goal encrypt_sectors_isra_0_0_1_0x6779_0x6779_9[blocks]:
  assumes \<open>(P_0x6779_true_9 && P_0x6779_true_9_regions && !ZF) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x6779 9 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x678a_9 ?\<sigma> \<and> block_usage P_0x6779_true_9_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x6779_true_9_def P_0x6779_true_9_regions_def post: Q_0x678a_9_def regionset: P_0x6779_true_9_regions_set_def)

definition P_0x678a_10 :: state_pred where
  \<open>P_0x678a_10 \<sigma> \<equiv> RIP \<sigma> = 0x678a \<and> RAX \<sigma> = 0x0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x68) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word)\<close>
declare P_0x678a_10_def[Ps]

definition P_0x678a_10_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x678a_10_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((FS\<^sub>0::64 word) + 0x28), 8),
    (2, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x40), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x70), 8)
  }\<close>

definition P_0x678a_10_regions :: state_pred where
  \<open>P_0x678a_10_regions \<sigma> \<equiv> \<exists>regions. P_0x678a_10_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_stack_chk_fail_addr_0x678a_10 :: state_pred where
  \<open>Q_stack_chk_fail_addr_0x678a_10 \<sigma> \<equiv> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x70) \<and> RIP \<sigma> = stack_chk_fail_addr \<and> RAX \<sigma> = 0x0 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word)\<close>
declare Q_stack_chk_fail_addr_0x678a_10_def[Qs]

schematic_goal encrypt_sectors_isra_0_0_1_0x678a_0x678a_10[blocks]:
  assumes \<open>(P_0x678a_10 && P_0x678a_10_regions) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x678a 10 \<sigma> \<triangleq> ?\<sigma> \<and> Q_stack_chk_fail_addr_0x678a_10 ?\<sigma> \<and> block_usage P_0x678a_10_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x678a_10_def P_0x678a_10_regions_def post: Q_stack_chk_fail_addr_0x678a_10_def regionset: P_0x678a_10_regions_set_def)

definition P_0x6779_false_11 :: state_pred where
  \<open>P_0x6779_false_11 \<sigma> \<equiv> RIP \<sigma> = 0x6779 \<and> RAX \<sigma> = 0x0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x68) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word)\<close>
declare P_0x6779_false_11_def[Ps]

definition P_0x6779_false_11_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x6779_false_11_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((FS\<^sub>0::64 word) + 0x28), 8),
    (2, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x40), 8)
  }\<close>

definition P_0x6779_false_11_regions :: state_pred where
  \<open>P_0x6779_false_11_regions \<sigma> \<equiv> \<exists>regions. P_0x6779_false_11_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_ret_address_11 :: state_pred where
  \<open>Q_ret_address_11 \<sigma> \<equiv> RIP \<sigma> = ret_address \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word)\<close>
declare Q_ret_address_11_def[Qs]

schematic_goal encrypt_sectors_isra_0_0_9_0x6779_0x6789_11[blocks]:
  assumes \<open>(P_0x6779_false_11 && P_0x6779_false_11_regions && ! !ZF) \<sigma>\<close>
  shows \<open>exec_block 9 0x6789 11 \<sigma> \<triangleq> ?\<sigma> \<and> Q_ret_address_11 ?\<sigma> \<and> block_usage P_0x6779_false_11_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x6779_false_11_def P_0x6779_false_11_regions_def post: Q_ret_address_11_def regionset: P_0x6779_false_11_regions_set_def)

definition encrypt_sectors_isra_0_acode :: ACode where
  \<open>encrypt_sectors_isra_0_acode =
    Block 11 0x66fe 0;
    IF jle THEN
      Block (Suc 0) 0x6700 (Suc 0)
    ELSE
      Block 11 0x6723 2;
      WHILE P_0x672c_3 DO
        Block 10 0x6757 3;
        Block (Suc 0) 0x675e 4;
        CALL AES_cbc_encrypt_acode;
        Block 2 0x6766 5;
        IF !ZF THEN
          Block 2 0x6728 6
        ELSE
          Block (Suc 0) 0x6769 7
        FI
      OD
    FI;
    Block 2 0x6770 8;
    IF !ZF THEN
      Block (Suc 0) 0x6779 9;
      Block (Suc 0) 0x678a 10;
      CALL stack_chk_fail_acode
    ELSE
      Block 9 0x6789 11
    FI
  \<close>

schematic_goal "encrypt_sectors_isra_0":
  assumes
    \<open>\<forall>\<sigma>. RIP \<sigma> = 0x6700 \<longrightarrow> P_0x6700_true_1_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x6700 \<longrightarrow> P_0x6700_false_2_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x672c \<longrightarrow> P_0x672c_3_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x675e \<longrightarrow> P_0x675e_4_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x6763 \<longrightarrow> P_0x6763_5_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x6769 \<longrightarrow> P_0x6769_true_6_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x6769 \<longrightarrow> P_0x6769_false_7_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x676b \<longrightarrow> P_0x676b_8_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x6779 \<longrightarrow> P_0x6779_true_9_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x678a \<longrightarrow> P_0x678a_10_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x6779 \<longrightarrow> P_0x6779_false_11_regions \<sigma>\<close>
    and [blocks]: \<open>{{Q_AES_cbc_encrypt_addr_0x675e_4}} \<box>AES_cbc_encrypt_acode {{P_0x6763_5;M_0x675e}}\<close>
    and [blocks]: \<open>{{Q_stack_chk_fail_addr_0x678a_10}} \<box>stack_chk_fail_acode {{Q_fail;M_0x678a}}\<close>
  shows \<open>{{?P}} encrypt_sectors_isra_0_acode {{?Q;?M}}\<close>
  apply (vcg acode: encrypt_sectors_isra_0_acode_def assms: assms)
        apply (vcg_while \<open>P_0x672c_3 || P_0x676b_8\<close> assms: assms)
         apply (vcg_step assms: assms)+
        apply (simp add: pred_logic Ps Qs)
       apply simp+
    apply (vcg_step assms: assms)
            apply (simp add: assms)+
     apply (vcg_step assms: assms)+
  done

end

end
