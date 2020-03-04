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
theory qcow_free_snapshots_isra_7
  imports "../../../isabelle/VCG/HTriple"
begin

locale "qemu_img_xen" = execution_context + exec_code +
  fixes qemu_free_0x12cc8_retval\<^sub>v qemu_free_0x12cda_retval\<^sub>v qemu_free_0x12cf1_retval\<^sub>v qemu_free_addr :: \<open>64 word\<close>
    and qemu_free_acode :: ACode
  assumes fetch:
    "fetch 0x12c90 \<equiv> (Unary (IS_8088 Push) (Storage (Reg (General SixtyFour r12))), 2)"
    "fetch 0x12c92 \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour r12)) (Storage (Reg (General SixtyFour rdi))), 3)"
    "fetch 0x12c95 \<equiv> (Unary (IS_8088 Push) (Storage (Reg (General SixtyFour rbp))), 1)"
    "fetch 0x12c96 \<equiv> (Unary (IS_8088 Push) (Storage (Reg (General SixtyFour rbx))), 1)"
    "fetch 0x12c97 \<equiv> (Binary (IS_8088 Mov) (Reg (General ThirtyTwo rax)) (Storage (Memory ThirtyTwo (A_SizeDirective 32 (A_Plus (A_FromReg (General SixtyFour rdi)) (A_WordConstant 860))))), 6)"
    "fetch 0x12c9d \<equiv> (Binary (IS_8088 Test) (Reg (General ThirtyTwo rax)) (Storage (Reg (General ThirtyTwo rax))), 2)"
    "fetch 0x12c9f \<equiv> (Unary (IS_8088 Jle) (Immediate SixtyFour (ImmVal 77033)), 2)"
    "fetch 0x12ca1 \<equiv> (Binary (IS_8088 Xor) (Reg (General ThirtyTwo rbp)) (Storage (Reg (General ThirtyTwo rbp))), 2)"
    "fetch 0x12ca3 \<equiv> (Unary (IS_8088 Nop) (Storage (Memory ThirtyTwo (A_SizeDirective 32 (A_Plus (A_FromReg (General SixtyFour rax)) (A_Plus (A_Mult 1 (A_FromReg (General SixtyFour rax))) (A_WordConstant 0)))))), 5)"
    "fetch 0x12ca8 \<equiv> (Binary (IS_8088 Lea) (Reg (General SixtyFour rbx)) (Storage (Memory SixtyFour (A_Plus (A_Mult 8 (A_FromReg (General SixtyFour rbp))) (A_WordConstant 0)))), 8)"
    "fetch 0x12cb0 \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour rax)) (Storage (Memory SixtyFour (A_SizeDirective 64 (A_Plus (A_FromReg (General SixtyFour r12)) (A_WordConstant 864))))), 8)"
    "fetch 0x12cb8 \<equiv> (Binary (IS_8088 Sub) (Reg (General SixtyFour rbx)) (Storage (Reg (General SixtyFour rbp))), 3)"
    "fetch 0x12cbb \<equiv> (Binary (IS_8088 Add) (Reg (General SixtyFour rbp)) (Immediate SixtyFour (ImmVal 1)), 4)"
    "fetch 0x12cbf \<equiv> (Binary (IS_8088 Shl) (Reg (General SixtyFour rbx)) (Immediate SixtyFour (ImmVal 3)), 4)"
    "fetch 0x12cc3 \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour rdi)) (Storage (Memory SixtyFour (A_SizeDirective 64 (A_Plus (A_FromReg (General SixtyFour rax)) (A_Plus (A_Mult 1 (A_FromReg (General SixtyFour rbx))) (A_WordConstant 24)))))), 5)"
    "fetch 0x12cc8 \<equiv> (Unary (IS_8088 Call) (Immediate SixtyFour (ImmLabel ''qemu_free'')), 5)"
    "fetch 0x12ccd \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour rax)) (Storage (Memory SixtyFour (A_SizeDirective 64 (A_Plus (A_FromReg (General SixtyFour r12)) (A_WordConstant 864))))), 8)"
    "fetch 0x12cd5 \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour rdi)) (Storage (Memory SixtyFour (A_SizeDirective 64 (A_Plus (A_FromReg (General SixtyFour rax)) (A_Plus (A_Mult 1 (A_FromReg (General SixtyFour rbx))) (A_WordConstant 16)))))), 5)"
    "fetch 0x12cda \<equiv> (Unary (IS_8088 Call) (Immediate SixtyFour (ImmLabel ''qemu_free'')), 5)"
    "fetch 0x12cdf \<equiv> (Binary (IS_8088 Cmp) (Memory ThirtyTwo (A_SizeDirective 32 (A_Plus (A_FromReg (General SixtyFour r12)) (A_WordConstant 860)))) (Storage (Reg (General ThirtyTwo rbp))), 8)"
    "fetch 0x12ce7 \<equiv> (Unary (IS_8088 Jg) (Immediate SixtyFour (ImmVal 76968)), 2)"
    "fetch 0x12ce9 \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour rdi)) (Storage (Memory SixtyFour (A_SizeDirective 64 (A_Plus (A_FromReg (General SixtyFour r12)) (A_WordConstant 864))))), 8)"
    "fetch 0x12cf1 \<equiv> (Unary (IS_8088 Call) (Immediate SixtyFour (ImmLabel ''qemu_free'')), 5)"
    "fetch 0x12cf6 \<equiv> (Unary (IS_8088 Pop) (Storage (Reg (General SixtyFour rbx))), 1)"
    "fetch 0x12cf7 \<equiv> (Unary (IS_8088 Pop) (Storage (Reg (General SixtyFour rbp))), 1)"
    "fetch 0x12cf8 \<equiv> (Binary (IS_8088 Mov) (Memory SixtyFour (A_SizeDirective 64 (A_Plus (A_FromReg (General SixtyFour r12)) (A_WordConstant 864)))) (Immediate SixtyFour (ImmVal 0)), 12)"
    "fetch 0x12d04 \<equiv> (Binary (IS_8088 Mov) (Memory ThirtyTwo (A_SizeDirective 32 (A_Plus (A_FromReg (General SixtyFour r12)) (A_WordConstant 860)))) (Immediate SixtyFour (ImmVal 0)), 12)"
    "fetch 0x12d10 \<equiv> (Unary (IS_8088 Pop) (Storage (Reg (General SixtyFour r12))), 2)"
    "fetch 0x12d12 \<equiv> (Nullary (IS_8088 Ret), 1)"
    "fetch 0x12d13 \<equiv> (Unary (IS_8088 Nop) (Storage (Memory Sixteen (A_SizeDirective 16 (A_Plus (A_FromReg (General SixtyFour cs)) (A_Plus (A_FromReg (General SixtyFour rax)) (A_Plus (A_Mult 1 (A_FromReg (General SixtyFour rax))) (A_WordConstant 0))))))), 11)"
    "fetch 0x12d1e \<equiv> (Binary (IS_8088 Xchg) (Reg (General Sixteen rax)) (Storage (Reg (General Sixteen rax))), 5)"
    and \<alpha>_def: \<open>\<alpha> = \<lparr>text_sections = [], data_sections = [], labels_to_offsets = [], binary_offset = 0\<rparr>\<close>
    and qemu_free\<^sub>a\<^sub>d\<^sub>d\<^sub>r[simp]: \<open>the (label_to_address \<alpha> ''qemu_free'') = qemu_free_addr\<close>
begin

text \<open>Using definitions that don't get unfolded immediately prevents locale argument issues.\<close>
definition \<open>qemu_free_0x12cc8_retval \<equiv> qemu_free_0x12cc8_retval\<^sub>v\<close>
definition \<open>qemu_free_0x12cda_retval \<equiv> qemu_free_0x12cda_retval\<^sub>v\<close>
definition \<open>qemu_free_0x12cf1_retval \<equiv> qemu_free_0x12cf1_retval\<^sub>v\<close>

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

text \<open>May need to be moved down (close to the abstract code) to avoid TERM exceptions.\<close>
method vcg_while for P :: state_pred uses assms =
  ((rule htriples)+)?,
  rule HTriple_weaken[where P=P],
  simp add: pred_logic Ps Qs assms,
  rule HTriple_while,
  (vcg_step assms: assms)+,
  (simp add: pred_logic Ps Qs)+,
  (vcg_step' assms: assms | vcg_step assms: assms)+,
  ((simp add: assms)+)?

method vcg uses acode assms =
  subst acode,
  (vcg_step assms: assms)+

end

locale "qcow_free_snapshots_isra_7" = "qemu_img_xen" +
  fixes RAX\<^sub>0\<^sub>v RBX\<^sub>0\<^sub>v RDI\<^sub>0\<^sub>v RSP\<^sub>0\<^sub>v RBP\<^sub>0\<^sub>v R12\<^sub>0\<^sub>v ret_address\<^sub>v :: \<open>64 word\<close>
begin

text \<open>Using definitions that don't get unfolded immediately prevents locale argument issues.\<close>
definition \<open>RAX\<^sub>0 \<equiv> RAX\<^sub>0\<^sub>v\<close>
definition \<open>RBX\<^sub>0 \<equiv> RBX\<^sub>0\<^sub>v\<close>
definition \<open>RDI\<^sub>0 \<equiv> RDI\<^sub>0\<^sub>v\<close>
definition \<open>RSP\<^sub>0 \<equiv> RSP\<^sub>0\<^sub>v\<close>
definition \<open>RBP\<^sub>0 \<equiv> RBP\<^sub>0\<^sub>v\<close>
definition \<open>R12\<^sub>0 \<equiv> R12\<^sub>0\<^sub>v\<close>
definition \<open>ret_address \<equiv> ret_address\<^sub>v\<close>

definition P_0x12c90_0 :: state_pred where
  \<open>P_0x12c90_0 \<sigma> \<equiv> RIP \<sigma> = 0x12c90 \<and> RAX \<sigma> = RAX\<^sub>0 \<and> RBX \<sigma> = RBX\<^sub>0 \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSP \<sigma> = RSP\<^sub>0 \<and> RBP \<sigma> = RBP\<^sub>0 \<and> R12 \<sigma> = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address\<close>
declare P_0x12c90_0_def[Ps]

definition P_0x12c90_0_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x12c90_0_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((RDI\<^sub>0::64 word) + 0x35c), 4),
    (2, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x18), 8)
  }\<close>

definition P_0x12c90_0_regions :: state_pred where
  \<open>P_0x12c90_0_regions \<sigma> \<equiv> \<exists>regions. P_0x12c90_0_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x12c9f_0 :: state_pred where
  \<open>Q_0x12c9f_0 \<sigma> \<equiv> RIP \<sigma> = 0x12c9f \<and> RAX \<sigma> = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x35c),4]::32 word)) \<and> RBX \<sigma> = RBX\<^sub>0 \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x18) \<and> RBP \<sigma> = RBP\<^sub>0 \<and> R12 \<sigma> = RDI\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x35c),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x35c),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBX\<^sub>0\<close>
declare Q_0x12c9f_0_def[Qs]

schematic_goal qcow_free_snapshots_isra_7_0_6_0x12c90_0x12c9d_0[blocks]:
  assumes \<open>(P_0x12c90_0 && P_0x12c90_0_regions) \<sigma>\<close>
  shows \<open>exec_block 6 0x12c9d 0 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x12c9f_0 ?\<sigma> \<and> block_usage P_0x12c90_0_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x12c90_0_def P_0x12c90_0_regions_def post: Q_0x12c9f_0_def regionset: P_0x12c90_0_regions_set_def)

definition P_0x12c9f_true_1 :: state_pred where
  \<open>P_0x12c9f_true_1 \<sigma> \<equiv> RIP \<sigma> = 0x12c9f \<and> RAX \<sigma> = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x35c),4]::32 word)) \<and> RBX \<sigma> = RBX\<^sub>0 \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x18) \<and> RBP \<sigma> = RBP\<^sub>0 \<and> R12 \<sigma> = RDI\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x35c),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x35c),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBX\<^sub>0\<close>
declare P_0x12c9f_true_1_def[Ps]

definition P_0x12c9f_true_1_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x12c9f_true_1_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((RDI\<^sub>0::64 word) + 0x35c), 4),
    (2, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x18), 8)
  }\<close>

definition P_0x12c9f_true_1_regions :: state_pred where
  \<open>P_0x12c9f_true_1_regions \<sigma> \<equiv> \<exists>regions. P_0x12c9f_true_1_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x12ce9_1 :: state_pred where
  \<open>Q_0x12ce9_1 \<sigma> \<equiv> RIP \<sigma> = 0x12ce9 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x18) \<and> R12 \<sigma> = RDI\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x35c),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x35c),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBX\<^sub>0\<close>
declare Q_0x12ce9_1_def[Qs]

schematic_goal qcow_free_snapshots_isra_7_0_1_0x12c9f_0x12c9f_1[blocks]:
  assumes \<open>(P_0x12c9f_true_1 && P_0x12c9f_true_1_regions && jle) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x12c9f (Suc 0) \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x12ce9_1 ?\<sigma> \<and> block_usage P_0x12c9f_true_1_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x12c9f_true_1_def P_0x12c9f_true_1_regions_def post: Q_0x12ce9_1_def regionset: P_0x12c9f_true_1_regions_set_def)

definition P_0x12c9f_false_2 :: state_pred where
  \<open>P_0x12c9f_false_2 \<sigma> \<equiv> RIP \<sigma> = 0x12c9f \<and> RAX \<sigma> = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x35c),4]::32 word)) \<and> RBX \<sigma> = RBX\<^sub>0 \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x18) \<and> RBP \<sigma> = RBP\<^sub>0 \<and> R12 \<sigma> = RDI\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x35c),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x35c),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBX\<^sub>0\<close>
declare P_0x12c9f_false_2_def[Ps]

definition P_0x12c9f_false_2_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x12c9f_false_2_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((RDI\<^sub>0::64 word) + 0x35c), 4),
    (2, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x18), 8)
  }\<close>

definition P_0x12c9f_false_2_regions :: state_pred where
  \<open>P_0x12c9f_false_2_regions \<sigma> \<equiv> \<exists>regions. P_0x12c9f_false_2_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x12ca8_2 :: state_pred where
  \<open>Q_0x12ca8_2 \<sigma> \<equiv> RIP \<sigma> = 0x12ca8 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x18) \<and> R12 \<sigma> = RDI\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x35c),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x35c),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBX\<^sub>0\<close>
declare Q_0x12ca8_2_def[Qs]

schematic_goal qcow_free_snapshots_isra_7_0_3_0x12c9f_0x12ca3_2[blocks]:
  assumes \<open>(P_0x12c9f_false_2 && P_0x12c9f_false_2_regions && ! jle) \<sigma>\<close>
  shows \<open>exec_block 3 0x12ca3 2 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x12ca8_2 ?\<sigma> \<and> block_usage P_0x12c9f_false_2_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x12c9f_false_2_def P_0x12c9f_false_2_regions_def post: Q_0x12ca8_2_def regionset: P_0x12c9f_false_2_regions_set_def)

definition P_0x12ca8_3 :: state_pred where
  \<open>P_0x12ca8_3 \<sigma> \<equiv> RIP \<sigma> = 0x12ca8 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x18) \<and> R12 \<sigma> = RDI\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x35c),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x35c),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBX\<^sub>0\<close>
declare P_0x12ca8_3_def[Ps]

definition P_0x12ca8_3_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x12ca8_3_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((RDI\<^sub>0::64 word) + 0x35c), 4),
    (2, ((RDI\<^sub>0::64 word) + 0x360), 8),
    (3, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x360),8]::64 word)::64 word) + (((\<langle>63,0\<rangle>((((ucast (((((\<langle>63,0\<rangle>((RBP \<sigma>::64 word) * 0x8)::64 word)::64 word) - RBP \<sigma>)::64 word))::64 word) << 3)::64 word) * 0x1)::64 word)::64 word) + 0x18)), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x18), 8)
  }\<close>

definition P_0x12ca8_3_regions :: state_pred where
  \<open>P_0x12ca8_3_regions \<sigma> \<equiv> \<exists>regions. P_0x12ca8_3_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x12cc8_3 :: state_pred where
  \<open>Q_0x12cc8_3 \<sigma> \<equiv> RIP \<sigma> = 0x12cc8 \<and> RAX \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x360),8]::64 word) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x18) \<and> R12 \<sigma> = RDI\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x35c),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x35c),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x360),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x360),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBX\<^sub>0\<close>
declare Q_0x12cc8_3_def[Qs]

schematic_goal qcow_free_snapshots_isra_7_0_6_0x12ca8_0x12cc3_3[blocks]:
  assumes \<open>(P_0x12ca8_3 && P_0x12ca8_3_regions) \<sigma>\<close>
  shows \<open>exec_block 6 0x12cc3 3 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x12cc8_3 ?\<sigma> \<and> block_usage P_0x12ca8_3_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x12ca8_3_def P_0x12ca8_3_regions_def post: Q_0x12cc8_3_def regionset: P_0x12ca8_3_regions_set_def)

definition P_0x12cc8_4 :: state_pred where
  \<open>P_0x12cc8_4 \<sigma> \<equiv> RIP \<sigma> = 0x12cc8 \<and> RAX \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x360),8]::64 word) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x18) \<and> R12 \<sigma> = RDI\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x35c),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x35c),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x360),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x360),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBX\<^sub>0\<close>
declare P_0x12cc8_4_def[Ps]

definition P_0x12cc8_4_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x12cc8_4_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((RDI\<^sub>0::64 word) + 0x35c), 4),
    (2, ((RDI\<^sub>0::64 word) + 0x360), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x20), 8)
  }\<close>

definition P_0x12cc8_4_regions :: state_pred where
  \<open>P_0x12cc8_4_regions \<sigma> \<equiv> \<exists>regions. P_0x12cc8_4_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_qemu_free_addr_0x12cc8_4 :: state_pred where
  \<open>Q_qemu_free_addr_0x12cc8_4 \<sigma> \<equiv> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x20) \<and> RIP \<sigma> = qemu_free_addr \<and> RAX \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x360),8]::64 word) \<and> R12 \<sigma> = RDI\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x35c),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x35c),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x360),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x360),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = 0x12ccd\<close>
declare Q_qemu_free_addr_0x12cc8_4_def[Qs]

schematic_goal qcow_free_snapshots_isra_7_0_1_0x12cc8_0x12cc8_4[blocks]:
  assumes \<open>(P_0x12cc8_4 && P_0x12cc8_4_regions) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x12cc8 4 \<sigma> \<triangleq> ?\<sigma> \<and> Q_qemu_free_addr_0x12cc8_4 ?\<sigma> \<and> block_usage P_0x12cc8_4_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x12cc8_4_def P_0x12cc8_4_regions_def post: Q_qemu_free_addr_0x12cc8_4_def regionset: P_0x12cc8_4_regions_set_def)

definition P_0x12ccd_5 :: state_pred where
  \<open>P_0x12ccd_5 \<sigma> \<equiv> RIP \<sigma> = 0x12ccd \<and> RAX \<sigma> = qemu_free_0x12cc8_retval \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x18) \<and> R12 \<sigma> = RDI\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x35c),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x35c),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x360),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x360),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = 0x12ccd\<close>
declare P_0x12ccd_5_def[Ps]

definition P_0x12ccd_5_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x12ccd_5_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((RDI\<^sub>0::64 word) + 0x35c), 4),
    (2, ((RDI\<^sub>0::64 word) + 0x360), 8),
    (3, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x360),8]::64 word)::64 word) + (((\<langle>63,0\<rangle>((RBX \<sigma>::64 word) * 0x1)::64 word)::64 word) + 0x10)), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x20), 8)
  }\<close>

definition P_0x12ccd_5_regions :: state_pred where
  \<open>P_0x12ccd_5_regions \<sigma> \<equiv> \<exists>regions. P_0x12ccd_5_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x12cda_5 :: state_pred where
  \<open>Q_0x12cda_5 \<sigma> \<equiv> RIP \<sigma> = 0x12cda \<and> RAX \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x360),8]::64 word) \<and> RDI \<sigma> = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x360),8]::64 word)::64 word) + (((\<langle>63,0\<rangle>((RBX \<sigma>::64 word) * 0x1)::64 word)::64 word) + 0x10)),8]::64 word) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x18) \<and> R12 \<sigma> = RDI\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x35c),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x35c),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x360),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x360),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x360),8]::64 word)::64 word) + (((\<langle>63,0\<rangle>((RBX \<sigma>::64 word) * 0x1)::64 word)::64 word) + 0x10)),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x360),8]::64 word)::64 word) + (((\<langle>63,0\<rangle>((RBX \<sigma>::64 word) * 0x1)::64 word)::64 word) + 0x10)),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = 0x12ccd\<close>
declare Q_0x12cda_5_def[Qs]

schematic_goal qcow_free_snapshots_isra_7_0_2_0x12ccd_0x12cd5_5[blocks]:
  assumes \<open>(P_0x12ccd_5 && P_0x12ccd_5_regions) \<sigma>\<close>
  shows \<open>exec_block 2 0x12cd5 5 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x12cda_5 ?\<sigma> \<and> block_usage P_0x12ccd_5_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x12ccd_5_def P_0x12ccd_5_regions_def post: Q_0x12cda_5_def regionset: P_0x12ccd_5_regions_set_def)

definition P_0x12cda_6 :: state_pred where
  \<open>P_0x12cda_6 \<sigma> \<equiv> RIP \<sigma> = 0x12cda \<and> RAX \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x360),8]::64 word) \<and> RDI \<sigma> = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x360),8]::64 word)::64 word) + (((\<langle>63,0\<rangle>((RBX \<sigma>::64 word) * 0x1)::64 word)::64 word) + 0x10)),8]::64 word) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x18) \<and> R12 \<sigma> = RDI\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x35c),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x35c),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x360),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x360),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x360),8]::64 word)::64 word) + (((\<langle>63,0\<rangle>((RBX \<sigma>::64 word) * 0x1)::64 word)::64 word) + 0x10)),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x360),8]::64 word)::64 word) + (((\<langle>63,0\<rangle>((RBX \<sigma>::64 word) * 0x1)::64 word)::64 word) + 0x10)),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = 0x12ccd\<close>
declare P_0x12cda_6_def[Ps]

definition P_0x12cda_6_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x12cda_6_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((RDI\<^sub>0::64 word) + 0x35c), 4),
    (2, ((RDI\<^sub>0::64 word) + 0x360), 8),
    (3, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x360),8]::64 word)::64 word) + (((\<langle>63,0\<rangle>((RBX \<sigma>::64 word) * 0x1)::64 word)::64 word) + 0x10)), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x20), 8)
  }\<close>

definition P_0x12cda_6_regions :: state_pred where
  \<open>P_0x12cda_6_regions \<sigma> \<equiv> \<exists>regions. P_0x12cda_6_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_qemu_free_addr_0x12cda_6 :: state_pred where
  \<open>Q_qemu_free_addr_0x12cda_6 \<sigma> \<equiv> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x20) \<and> RIP \<sigma> = qemu_free_addr \<and> RAX \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x360),8]::64 word) \<and> RDI \<sigma> = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x360),8]::64 word)::64 word) + (((\<langle>63,0\<rangle>((RBX \<sigma>::64 word) * 0x1)::64 word)::64 word) + 0x10)),8]::64 word) \<and> R12 \<sigma> = RDI\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x35c),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x35c),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x360),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x360),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x360),8]::64 word)::64 word) + (((\<langle>63,0\<rangle>((RBX \<sigma>::64 word) * 0x1)::64 word)::64 word) + 0x10)),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x360),8]::64 word)::64 word) + (((\<langle>63,0\<rangle>((RBX \<sigma>::64 word) * 0x1)::64 word)::64 word) + 0x10)),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = 0x12cdf\<close>
declare Q_qemu_free_addr_0x12cda_6_def[Qs]

schematic_goal qcow_free_snapshots_isra_7_0_1_0x12cda_0x12cda_6[blocks]:
  assumes \<open>(P_0x12cda_6 && P_0x12cda_6_regions) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x12cda 6 \<sigma> \<triangleq> ?\<sigma> \<and> Q_qemu_free_addr_0x12cda_6 ?\<sigma> \<and> block_usage P_0x12cda_6_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x12cda_6_def P_0x12cda_6_regions_def post: Q_qemu_free_addr_0x12cda_6_def regionset: P_0x12cda_6_regions_set_def)

definition P_0x12cdf_7 :: state_pred where
  \<open>P_0x12cdf_7 \<sigma> \<equiv> RIP \<sigma> = 0x12cdf \<and> RAX \<sigma> = qemu_free_0x12cda_retval \<and> RDI \<sigma> = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x360),8]::64 word)::64 word) + (((\<langle>63,0\<rangle>((RBX \<sigma>::64 word) * 0x1)::64 word)::64 word) + 0x10)),8]::64 word) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x18) \<and> R12 \<sigma> = RDI\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x35c),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x35c),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x360),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x360),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x360),8]::64 word)::64 word) + (((\<langle>63,0\<rangle>((RBX \<sigma>::64 word) * 0x1)::64 word)::64 word) + 0x10)),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x360),8]::64 word)::64 word) + (((\<langle>63,0\<rangle>((RBX \<sigma>::64 word) * 0x1)::64 word)::64 word) + 0x10)),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = 0x12cdf\<close>
declare P_0x12cdf_7_def[Ps]

definition P_0x12cdf_7_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x12cdf_7_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((RDI\<^sub>0::64 word) + 0x35c), 4),
    (2, ((RDI\<^sub>0::64 word) + 0x360), 8),
    (3, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x360),8]::64 word)::64 word) + (((\<langle>63,0\<rangle>((RBX \<sigma>::64 word) * 0x1)::64 word)::64 word) + 0x10)), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x20), 8)
  }\<close>

definition P_0x12cdf_7_regions :: state_pred where
  \<open>P_0x12cdf_7_regions \<sigma> \<equiv> \<exists>regions. P_0x12cdf_7_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x12ce7_7 :: state_pred where
  \<open>Q_0x12ce7_7 \<sigma> \<equiv> RIP \<sigma> = 0x12ce7 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x18) \<and> R12 \<sigma> = RDI\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x35c),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x35c),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBX\<^sub>0\<close>
declare Q_0x12ce7_7_def[Qs]

schematic_goal qcow_free_snapshots_isra_7_0_1_0x12cdf_0x12cdf_7[blocks]:
  assumes \<open>(P_0x12cdf_7 && P_0x12cdf_7_regions) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x12cdf 7 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x12ce7_7 ?\<sigma> \<and> block_usage P_0x12cdf_7_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x12cdf_7_def P_0x12cdf_7_regions_def post: Q_0x12ce7_7_def regionset: P_0x12cdf_7_regions_set_def)

definition P_0x12ce7_true_8 :: state_pred where
  \<open>P_0x12ce7_true_8 \<sigma> \<equiv> RIP \<sigma> = 0x12ce7 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x18) \<and> R12 \<sigma> = RDI\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x35c),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x35c),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBX\<^sub>0\<close>
declare P_0x12ce7_true_8_def[Ps]

definition P_0x12ce7_true_8_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x12ce7_true_8_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((RDI\<^sub>0::64 word) + 0x35c), 4),
    (2, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x18), 8)
  }\<close>

definition P_0x12ce7_true_8_regions :: state_pred where
  \<open>P_0x12ce7_true_8_regions \<sigma> \<equiv> \<exists>regions. P_0x12ce7_true_8_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x12ca8_8 :: state_pred where
  \<open>Q_0x12ca8_8 \<sigma> \<equiv> RIP \<sigma> = 0x12ca8 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x18) \<and> R12 \<sigma> = RDI\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x35c),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x35c),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBX\<^sub>0\<close>
declare Q_0x12ca8_8_def[Qs]

schematic_goal qcow_free_snapshots_isra_7_0_1_0x12ce7_0x12ce7_8[blocks]:
  assumes \<open>(P_0x12ce7_true_8 && P_0x12ce7_true_8_regions && jg) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x12ce7 8 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x12ca8_8 ?\<sigma> \<and> block_usage P_0x12ce7_true_8_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x12ce7_true_8_def P_0x12ce7_true_8_regions_def post: Q_0x12ca8_8_def regionset: P_0x12ce7_true_8_regions_set_def)

definition P_0x12ce7_false_9 :: state_pred where
  \<open>P_0x12ce7_false_9 \<sigma> \<equiv> RIP \<sigma> = 0x12ce7 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x18) \<and> R12 \<sigma> = RDI\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x35c),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x35c),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBX\<^sub>0\<close>
declare P_0x12ce7_false_9_def[Ps]

definition P_0x12ce7_false_9_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x12ce7_false_9_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((RDI\<^sub>0::64 word) + 0x35c), 4),
    (2, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x18), 8)
  }\<close>

definition P_0x12ce7_false_9_regions :: state_pred where
  \<open>P_0x12ce7_false_9_regions \<sigma> \<equiv> \<exists>regions. P_0x12ce7_false_9_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x12ce9_9 :: state_pred where
  \<open>Q_0x12ce9_9 \<sigma> \<equiv> RIP \<sigma> = 0x12ce9 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x18) \<and> R12 \<sigma> = RDI\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x35c),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x35c),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBX\<^sub>0\<close>
declare Q_0x12ce9_9_def[Qs]

schematic_goal qcow_free_snapshots_isra_7_0_1_0x12ce7_0x12ce7_9[blocks]:
  assumes \<open>(P_0x12ce7_false_9 && P_0x12ce7_false_9_regions && ! jg) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x12ce7 9 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x12ce9_9 ?\<sigma> \<and> block_usage P_0x12ce7_false_9_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x12ce7_false_9_def P_0x12ce7_false_9_regions_def post: Q_0x12ce9_9_def regionset: P_0x12ce7_false_9_regions_set_def)

definition P_0x12ce9_10 :: state_pred where
  \<open>P_0x12ce9_10 \<sigma> \<equiv> RIP \<sigma> = 0x12ce9 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x18) \<and> R12 \<sigma> = RDI\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x35c),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x35c),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBX\<^sub>0\<close>
declare P_0x12ce9_10_def[Ps]

definition P_0x12ce9_10_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x12ce9_10_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((RDI\<^sub>0::64 word) + 0x35c), 4),
    (2, ((RDI\<^sub>0::64 word) + 0x360), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x18), 8)
  }\<close>

definition P_0x12ce9_10_regions :: state_pred where
  \<open>P_0x12ce9_10_regions \<sigma> \<equiv> \<exists>regions. P_0x12ce9_10_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x12cf1_10 :: state_pred where
  \<open>Q_0x12cf1_10 \<sigma> \<equiv> RIP \<sigma> = 0x12cf1 \<and> RDI \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x360),8]::64 word) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x18) \<and> R12 \<sigma> = RDI\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x35c),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x35c),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x360),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x360),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBX\<^sub>0\<close>
declare Q_0x12cf1_10_def[Qs]

schematic_goal qcow_free_snapshots_isra_7_0_1_0x12ce9_0x12ce9_10[blocks]:
  assumes \<open>(P_0x12ce9_10 && P_0x12ce9_10_regions) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x12ce9 10 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x12cf1_10 ?\<sigma> \<and> block_usage P_0x12ce9_10_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x12ce9_10_def P_0x12ce9_10_regions_def post: Q_0x12cf1_10_def regionset: P_0x12ce9_10_regions_set_def)

definition P_0x12cf1_11 :: state_pred where
  \<open>P_0x12cf1_11 \<sigma> \<equiv> RIP \<sigma> = 0x12cf1 \<and> RDI \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x360),8]::64 word) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x18) \<and> R12 \<sigma> = RDI\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x35c),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x35c),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x360),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x360),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBX\<^sub>0\<close>
declare P_0x12cf1_11_def[Ps]

definition P_0x12cf1_11_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x12cf1_11_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((RDI\<^sub>0::64 word) + 0x35c), 4),
    (2, ((RDI\<^sub>0::64 word) + 0x360), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x20), 8)
  }\<close>

definition P_0x12cf1_11_regions :: state_pred where
  \<open>P_0x12cf1_11_regions \<sigma> \<equiv> \<exists>regions. P_0x12cf1_11_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_qemu_free_addr_0x12cf1_11 :: state_pred where
  \<open>Q_qemu_free_addr_0x12cf1_11 \<sigma> \<equiv> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x20) \<and> RIP \<sigma> = qemu_free_addr \<and> RDI \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x360),8]::64 word) \<and> R12 \<sigma> = RDI\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x35c),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x35c),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x360),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x360),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = 0x12cf6\<close>
declare Q_qemu_free_addr_0x12cf1_11_def[Qs]

schematic_goal qcow_free_snapshots_isra_7_0_1_0x12cf1_0x12cf1_11[blocks]:
  assumes \<open>(P_0x12cf1_11 && P_0x12cf1_11_regions) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x12cf1 11 \<sigma> \<triangleq> ?\<sigma> \<and> Q_qemu_free_addr_0x12cf1_11 ?\<sigma> \<and> block_usage P_0x12cf1_11_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x12cf1_11_def P_0x12cf1_11_regions_def post: Q_qemu_free_addr_0x12cf1_11_def regionset: P_0x12cf1_11_regions_set_def)

definition P_0x12cf6_12 :: state_pred where
  \<open>P_0x12cf6_12 \<sigma> \<equiv> RIP \<sigma> = 0x12cf6 \<and> RDI \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x360),8]::64 word) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x18) \<and> R12 \<sigma> = RDI\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x35c),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x35c),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x360),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x360),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = 0x12cf6\<close>
declare P_0x12cf6_12_def[Ps]

definition P_0x12cf6_12_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x12cf6_12_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((RDI\<^sub>0::64 word) + 0x35c), 4),
    (2, ((RDI\<^sub>0::64 word) + 0x360), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x20), 8)
  }\<close>

definition P_0x12cf6_12_regions :: state_pred where
  \<open>P_0x12cf6_12_regions \<sigma> \<equiv> \<exists>regions. P_0x12cf6_12_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_ret_address_12 :: state_pred where
  \<open>Q_ret_address_12 \<sigma> \<equiv> RIP \<sigma> = ret_address \<and> RBX \<sigma> = RBX\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) + 0x8) \<and> RBP \<sigma> = RBP\<^sub>0 \<and> R12 \<sigma> = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x35c),4]::32 word) = 0x0 \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x360),8]::64 word) = 0x0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = 0x12cf6\<close>
declare Q_ret_address_12_def[Qs]

schematic_goal qcow_free_snapshots_isra_7_0_6_0x12cf6_0x12d12_12[blocks]:
  assumes \<open>(P_0x12cf6_12 && P_0x12cf6_12_regions) \<sigma>\<close>
  shows \<open>exec_block 6 0x12d12 12 \<sigma> \<triangleq> ?\<sigma> \<and> Q_ret_address_12 ?\<sigma> \<and> block_usage P_0x12cf6_12_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x12cf6_12_def P_0x12cf6_12_regions_def post: Q_ret_address_12_def regionset: P_0x12cf6_12_regions_set_def)

definition qcow_free_snapshots_isra_7_acode :: ACode where
  \<open>qcow_free_snapshots_isra_7_acode =
    Block 6 0x12c9d 0;
    IF jle THEN
      Block (Suc 0) 0x12c9f (Suc 0)
    ELSE
      Block 3 0x12ca3 2;
      WHILE P_0x12ca8_3 DO
        Block 6 0x12cc3 3;
        Block (Suc 0) 0x12cc8 4;
        CALL qemu_free_acode;
        Block 2 0x12cd5 5;
        Block (Suc 0) 0x12cda 6;
        CALL qemu_free_acode;
        Block (Suc 0) 0x12cdf 7;
        IF jg THEN
          Block (Suc 0) 0x12ce7 8
        ELSE
          Block (Suc 0) 0x12ce7 9
        FI
      OD
    FI;
    Block (Suc 0) 0x12ce9 10;
    Block (Suc 0) 0x12cf1 11;
    CALL qemu_free_acode;
    Block 6 0x12d12 12
  \<close>

schematic_goal "qcow_free_snapshots_isra_7":
  assumes
    \<open>\<forall>\<sigma>. RIP \<sigma> = 0x12c9f \<longrightarrow> P_0x12c9f_true_1_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x12c9f \<longrightarrow> P_0x12c9f_false_2_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x12ca8 \<longrightarrow> P_0x12ca8_3_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x12cc8 \<longrightarrow> P_0x12cc8_4_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x12ccd \<longrightarrow> P_0x12ccd_5_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x12cda \<longrightarrow> P_0x12cda_6_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x12cdf \<longrightarrow> P_0x12cdf_7_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x12ce7 \<longrightarrow> P_0x12ce7_true_8_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x12ce7 \<longrightarrow> P_0x12ce7_false_9_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x12ce9 \<longrightarrow> P_0x12ce9_10_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x12cf1 \<longrightarrow> P_0x12cf1_11_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x12cf6 \<longrightarrow> P_0x12cf6_12_regions \<sigma>\<close>
    and [blocks]: \<open>{{Q_qemu_free_addr_0x12cc8_4}} \<box>qemu_free_acode {{P_0x12ccd_5;M_0x12cc8}}\<close>
    and [blocks]: \<open>{{Q_qemu_free_addr_0x12cda_6}} \<box>qemu_free_acode {{P_0x12cdf_7;M_0x12cda}}\<close>
    and [blocks]: \<open>{{Q_qemu_free_addr_0x12cf1_11}} \<box>qemu_free_acode {{P_0x12cf6_12;M_0x12cf1}}\<close>
  shows \<open>{{?P}} qcow_free_snapshots_isra_7_acode {{?Q;?M}}\<close>
  apply (vcg acode: qcow_free_snapshots_isra_7_acode_def assms: assms)
        apply (vcg_while \<open>P_0x12ca8_3 || P_0x12ce9_10\<close> assms: assms)
     apply (vcg_step assms: assms)+
  done

end

end
