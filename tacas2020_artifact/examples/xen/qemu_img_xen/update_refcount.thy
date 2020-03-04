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
theory update_refcount
  imports "../../../isabelle/VCG/HTriple"
begin

locale "qemu_img_xen" = execution_context + exec_code +
  fixes update_cluster_refcount_0x14837_retval\<^sub>v update_cluster_refcount_addr :: \<open>64 word\<close>
    and update_cluster_refcount_acode :: ACode
  assumes fetch:
    "fetch 0x147f0 \<equiv> (Binary (IS_8088 Test) (Reg (General SixtyFour rdx)) (Storage (Reg (General SixtyFour rdx))), 3)"
    "fetch 0x147f3 \<equiv> (Unary (IS_8088 Jle) (Immediate SixtyFour (ImmVal 84056)), 2)"
    "fetch 0x147f5 \<equiv> (Unary (IS_8088 Push) (Storage (Reg (General SixtyFour r14))), 2)"
    "fetch 0x147f7 \<equiv> (Binary (IS_8088 Mov) (Reg (General ThirtyTwo r14)) (Storage (Reg (General ThirtyTwo rcx))), 3)"
    "fetch 0x147fa \<equiv> (Unary (IS_8088 Push) (Storage (Reg (General SixtyFour r13))), 2)"
    "fetch 0x147fc \<equiv> (Unary (IS_8088 Push) (Storage (Reg (General SixtyFour r12))), 2)"
    "fetch 0x147fe \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour r12)) (Storage (Reg (General SixtyFour rdi))), 3)"
    "fetch 0x14801 \<equiv> (Unary (IS_8088 Push) (Storage (Reg (General SixtyFour rbp))), 1)"
    "fetch 0x14802 \<equiv> (Unary (IS_8088 Push) (Storage (Reg (General SixtyFour rbx))), 1)"
    "fetch 0x14803 \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour rbp)) (Storage (Memory SixtyFour (A_SizeDirective 64 (A_Plus (A_FromReg (General SixtyFour rdi)) (A_WordConstant 64))))), 4)"
    "fetch 0x14807 \<equiv> (Binary (IS_8088 Mov) (Reg (General ThirtyTwo r13)) (Storage (Memory ThirtyTwo (A_SizeDirective 32 (A_Plus (A_FromReg (General SixtyFour rbp)) (A_WordConstant 12))))), 4)"
    "fetch 0x1480b \<equiv> (Unary (IS_8088 Neg) (Storage (Reg (General ThirtyTwo r13))), 3)"
    "fetch 0x1480e \<equiv> (Binary (IS_X86_64 Movsxd) (Reg (General SixtyFour rax)) (Storage (Reg (General ThirtyTwo r13))), 3)"
    "fetch 0x14811 \<equiv> (Binary (IS_8088 Lea) (Reg (General SixtyFour r13)) (Storage (Memory SixtyFour (A_Plus (A_FromReg (General SixtyFour rsi)) (A_Minus (A_Mult 1 (A_FromReg (General SixtyFour rdx))) (A_WordConstant 1))))), 5)"
    "fetch 0x14816 \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour rbx)) (Storage (Reg (General SixtyFour rax))), 3)"
    "fetch 0x14819 \<equiv> (Binary (IS_8088 And) (Reg (General SixtyFour r13)) (Storage (Reg (General SixtyFour rax))), 3)"
    "fetch 0x1481c \<equiv> (Binary (IS_8088 And) (Reg (General SixtyFour rbx)) (Storage (Reg (General SixtyFour rsi))), 3)"
    "fetch 0x1481f \<equiv> (Binary (IS_8088 Cmp) (Reg (General SixtyFour rbx)) (Storage (Reg (General SixtyFour r13))), 3)"
    "fetch 0x14822 \<equiv> (Unary (IS_8088 Jg) (Immediate SixtyFour (ImmVal 84040)), 2)"
    "fetch 0x14824 \<equiv> (Unary (IS_8088 Nop) (Storage (Memory ThirtyTwo (A_SizeDirective 32 (A_Plus (A_FromReg (General SixtyFour rax)) (A_WordConstant 0))))), 4)"
    "fetch 0x14828 \<equiv> (Binary (IS_8088 Mov) (Reg (General ThirtyTwo rcx)) (Storage (Memory ThirtyTwo (A_SizeDirective 32 (A_Plus (A_FromReg (General SixtyFour rbp)) (A_WordConstant 8))))), 3)"
    "fetch 0x1482b \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour rsi)) (Storage (Reg (General SixtyFour rbx))), 3)"
    "fetch 0x1482e \<equiv> (Binary (IS_8088 Mov) (Reg (General ThirtyTwo rdx)) (Storage (Reg (General ThirtyTwo r14))), 3)"
    "fetch 0x14831 \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour rdi)) (Storage (Reg (General SixtyFour r12))), 3)"
    "fetch 0x14834 \<equiv> (Binary (IS_8088 Sar) (Reg (General SixtyFour rsi)) (Storage (Reg (General Eight rcx))), 3)"
    "fetch 0x14837 \<equiv> (Unary (IS_8088 Call) (Immediate SixtyFour (ImmLabel ''update_cluster_refcount'')), 5)"
    "fetch 0x1483c \<equiv> (Binary (IS_X86_64 Movsxd) (Reg (General SixtyFour rax)) (Storage (Memory ThirtyTwo (A_SizeDirective 32 (A_Plus (A_FromReg (General SixtyFour rbp)) (A_WordConstant 12))))), 4)"
    "fetch 0x14840 \<equiv> (Binary (IS_8088 Add) (Reg (General SixtyFour rbx)) (Storage (Reg (General SixtyFour rax))), 3)"
    "fetch 0x14843 \<equiv> (Binary (IS_8088 Cmp) (Reg (General SixtyFour r13)) (Storage (Reg (General SixtyFour rbx))), 3)"
    "fetch 0x14846 \<equiv> (Unary (IS_8088 Jge) (Immediate SixtyFour (ImmVal 84008)), 2)"
    "fetch 0x14848 \<equiv> (Unary (IS_8088 Pop) (Storage (Reg (General SixtyFour rbx))), 1)"
    "fetch 0x14849 \<equiv> (Unary (IS_8088 Pop) (Storage (Reg (General SixtyFour rbp))), 1)"
    "fetch 0x1484a \<equiv> (Unary (IS_8088 Pop) (Storage (Reg (General SixtyFour r12))), 2)"
    "fetch 0x1484c \<equiv> (Unary (IS_8088 Pop) (Storage (Reg (General SixtyFour r13))), 2)"
    "fetch 0x1484e \<equiv> (Unary (IS_8088 Pop) (Storage (Reg (General SixtyFour r14))), 2)"
    "fetch 0x14850 \<equiv> (Nullary (IS_8088 Ret), 1)"
    "fetch 0x14851 \<equiv> (Unary (IS_8088 Nop) (Storage (Memory ThirtyTwo (A_SizeDirective 32 (A_Plus (A_FromReg (General SixtyFour rax)) (A_WordConstant 0))))), 7)"
    "fetch 0x14858 \<equiv> (Nullary (IS_8088 Ret), 1)"
    and \<alpha>_def: \<open>\<alpha> = \<lparr>text_sections = [], data_sections = [], labels_to_offsets = [], binary_offset = 0\<rparr>\<close>
    and update_cluster_refcount\<^sub>a\<^sub>d\<^sub>d\<^sub>r[simp]: \<open>the (label_to_address \<alpha> ''update_cluster_refcount'') = update_cluster_refcount_addr\<close>
begin

text \<open>Using definitions that don't get unfolded immediately prevents locale argument issues.\<close>
definition \<open>update_cluster_refcount_0x14837_retval \<equiv> update_cluster_refcount_0x14837_retval\<^sub>v\<close>

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

locale "update_refcount" = "qemu_img_xen" +
  fixes RAX\<^sub>0\<^sub>v RBX\<^sub>0\<^sub>v RCX\<^sub>0\<^sub>v RDX\<^sub>0\<^sub>v RDI\<^sub>0\<^sub>v RSI\<^sub>0\<^sub>v RSP\<^sub>0\<^sub>v RBP\<^sub>0\<^sub>v R14\<^sub>0\<^sub>v R13\<^sub>0\<^sub>v R12\<^sub>0\<^sub>v ret_address\<^sub>v :: \<open>64 word\<close>
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
definition \<open>R14\<^sub>0 \<equiv> R14\<^sub>0\<^sub>v\<close>
definition \<open>R13\<^sub>0 \<equiv> R13\<^sub>0\<^sub>v\<close>
definition \<open>R12\<^sub>0 \<equiv> R12\<^sub>0\<^sub>v\<close>
definition \<open>ret_address \<equiv> ret_address\<^sub>v\<close>

definition P_0x147f0_0 :: state_pred where
  \<open>P_0x147f0_0 \<sigma> \<equiv> RIP \<sigma> = 0x147f0 \<and> RAX \<sigma> = RAX\<^sub>0 \<and> RBX \<sigma> = RBX\<^sub>0 \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = RDX\<^sub>0 \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = RSP\<^sub>0 \<and> RBP \<sigma> = RBP\<^sub>0 \<and> R14 \<sigma> = R14\<^sub>0 \<and> R13 \<sigma> = R13\<^sub>0 \<and> R12 \<sigma> = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address\<close>
declare P_0x147f0_0_def[Ps]

definition P_0x147f0_0_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x147f0_0_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8)
  }\<close>

definition P_0x147f0_0_regions :: state_pred where
  \<open>P_0x147f0_0_regions \<sigma> \<equiv> \<exists>regions. P_0x147f0_0_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x147f3_0 :: state_pred where
  \<open>Q_0x147f3_0 \<sigma> \<equiv> RIP \<sigma> = 0x147f3 \<and> RAX \<sigma> = RAX\<^sub>0 \<and> RBX \<sigma> = RBX\<^sub>0 \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = RDX\<^sub>0 \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = RSP\<^sub>0 \<and> RBP \<sigma> = RBP\<^sub>0 \<and> R14 \<sigma> = R14\<^sub>0 \<and> R13 \<sigma> = R13\<^sub>0 \<and> R12 \<sigma> = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address\<close>
declare Q_0x147f3_0_def[Qs]

schematic_goal update_refcount_0_1_0x147f0_0x147f0_0[blocks]:
  assumes \<open>(P_0x147f0_0 && P_0x147f0_0_regions) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x147f0 0 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x147f3_0 ?\<sigma> \<and> block_usage P_0x147f0_0_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x147f0_0_def P_0x147f0_0_regions_def post: Q_0x147f3_0_def regionset: P_0x147f0_0_regions_set_def)

definition P_0x147f3_true_1 :: state_pred where
  \<open>P_0x147f3_true_1 \<sigma> \<equiv> RIP \<sigma> = 0x147f3 \<and> RAX \<sigma> = RAX\<^sub>0 \<and> RBX \<sigma> = RBX\<^sub>0 \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = RDX\<^sub>0 \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = RSP\<^sub>0 \<and> RBP \<sigma> = RBP\<^sub>0 \<and> R14 \<sigma> = R14\<^sub>0 \<and> R13 \<sigma> = R13\<^sub>0 \<and> R12 \<sigma> = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address\<close>
declare P_0x147f3_true_1_def[Ps]

definition P_0x147f3_true_1_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x147f3_true_1_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8)
  }\<close>

definition P_0x147f3_true_1_regions :: state_pred where
  \<open>P_0x147f3_true_1_regions \<sigma> \<equiv> \<exists>regions. P_0x147f3_true_1_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_ret_address_1 :: state_pred where
  \<open>Q_ret_address_1 \<sigma> \<equiv> RIP \<sigma> = ret_address \<and> RBX \<sigma> = RBX\<^sub>0 \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) + 0x8) \<and> RBP \<sigma> = RBP\<^sub>0 \<and> R14 \<sigma> = R14\<^sub>0 \<and> R13 \<sigma> = R13\<^sub>0 \<and> R12 \<sigma> = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address\<close>
declare Q_ret_address_1_def[Qs]

schematic_goal update_refcount_0_2_0x147f3_0x14858_1[blocks]:
  assumes \<open>(P_0x147f3_true_1 && P_0x147f3_true_1_regions && jle) \<sigma>\<close>
  shows \<open>exec_block 2 0x14858 (Suc 0) \<sigma> \<triangleq> ?\<sigma> \<and> Q_ret_address_1 ?\<sigma> \<and> block_usage P_0x147f3_true_1_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x147f3_true_1_def P_0x147f3_true_1_regions_def post: Q_ret_address_1_def regionset: P_0x147f3_true_1_regions_set_def)

definition P_0x147f3_false_2 :: state_pred where
  \<open>P_0x147f3_false_2 \<sigma> \<equiv> RIP \<sigma> = 0x147f3 \<and> RAX \<sigma> = RAX\<^sub>0 \<and> RBX \<sigma> = RBX\<^sub>0 \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = RDX\<^sub>0 \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = RSP\<^sub>0 \<and> RBP \<sigma> = RBP\<^sub>0 \<and> R14 \<sigma> = R14\<^sub>0 \<and> R13 \<sigma> = R13\<^sub>0 \<and> R12 \<sigma> = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address\<close>
declare P_0x147f3_false_2_def[Ps]

definition P_0x147f3_false_2_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x147f3_false_2_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((RDI\<^sub>0::64 word) + 0x40), 8),
    (2, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0xc), 4),
    (3, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x28), 8)
  }\<close>

definition P_0x147f3_false_2_regions :: state_pred where
  \<open>P_0x147f3_false_2_regions \<sigma> \<equiv> \<exists>regions. P_0x147f3_false_2_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x14822_2 :: state_pred where
  \<open>Q_0x14822_2 \<sigma> \<equiv> RIP \<sigma> = 0x14822 \<and> RAX \<sigma> = (sextend (ucast ((- (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0xc),4]::32 word)))) 32 64::64 word) \<and> RBX \<sigma> = (((sextend (ucast ((- (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0xc),4]::32 word)))) 32 64::64 word)::64 word) AND RSI\<^sub>0) \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = RDX\<^sub>0 \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x28) \<and> RBP \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> R14 \<sigma> = ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)) \<and> R13 \<sigma> = ((((((RSI\<^sub>0::64 word) + (\<langle>63,0\<rangle>((RDX\<^sub>0::64 word) * 0x1)::64 word))::64 word) - 0x1)::64 word) AND (sextend (ucast ((- (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0xc),4]::32 word)))) 32 64::64 word)) \<and> R12 \<sigma> = RDI\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0xc),4]::32 word) = ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0xc),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBX\<^sub>0\<close>
declare Q_0x14822_2_def[Qs]

schematic_goal update_refcount_0_17_0x147f3_0x1481f_2[blocks]:
  assumes \<open>(P_0x147f3_false_2 && P_0x147f3_false_2_regions && ! jle) \<sigma>\<close>
  shows \<open>exec_block 17 0x1481f 2 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x14822_2 ?\<sigma> \<and> block_usage P_0x147f3_false_2_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x147f3_false_2_def P_0x147f3_false_2_regions_def post: Q_0x14822_2_def regionset: P_0x147f3_false_2_regions_set_def)

definition P_0x14822_true_3 :: state_pred where
  \<open>P_0x14822_true_3 \<sigma> \<equiv> RIP \<sigma> = 0x14822 \<and> RAX \<sigma> = (sextend (ucast ((- (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0xc),4]::32 word)))) 32 64::64 word) \<and> RBX \<sigma> = (((sextend (ucast ((- (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0xc),4]::32 word)))) 32 64::64 word)::64 word) AND RSI\<^sub>0) \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = RDX\<^sub>0 \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x28) \<and> RBP \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> R14 \<sigma> = ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)) \<and> R13 \<sigma> = ((((((RSI\<^sub>0::64 word) + (\<langle>63,0\<rangle>((RDX\<^sub>0::64 word) * 0x1)::64 word))::64 word) - 0x1)::64 word) AND (sextend (ucast ((- (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0xc),4]::32 word)))) 32 64::64 word)) \<and> R12 \<sigma> = RDI\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0xc),4]::32 word) = ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0xc),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBX\<^sub>0\<close>
declare P_0x14822_true_3_def[Ps]

definition P_0x14822_true_3_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x14822_true_3_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((RDI\<^sub>0::64 word) + 0x40), 8),
    (2, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0xc), 4),
    (3, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x28), 8)
  }\<close>

definition P_0x14822_true_3_regions :: state_pred where
  \<open>P_0x14822_true_3_regions \<sigma> \<equiv> \<exists>regions. P_0x14822_true_3_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x14848_3 :: state_pred where
  \<open>Q_0x14848_3 \<sigma> \<equiv> RIP \<sigma> = 0x14848 \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x28) \<and> RBP \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> R14 \<sigma> = ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)) \<and> R13 \<sigma> = ((((((RSI\<^sub>0::64 word) + (\<langle>63,0\<rangle>((RDX\<^sub>0::64 word) * 0x1)::64 word))::64 word) - 0x1)::64 word) AND (sextend (ucast ((- (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0xc),4]::32 word)))) 32 64::64 word)) \<and> R12 \<sigma> = RDI\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0xc),4]::32 word) = ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0xc),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBX\<^sub>0\<close>
declare Q_0x14848_3_def[Qs]

schematic_goal update_refcount_0_1_0x14822_0x14822_3[blocks]:
  assumes \<open>(P_0x14822_true_3 && P_0x14822_true_3_regions && jg) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x14822 3 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x14848_3 ?\<sigma> \<and> block_usage P_0x14822_true_3_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x14822_true_3_def P_0x14822_true_3_regions_def post: Q_0x14848_3_def regionset: P_0x14822_true_3_regions_set_def)

definition P_0x14822_false_4 :: state_pred where
  \<open>P_0x14822_false_4 \<sigma> \<equiv> RIP \<sigma> = 0x14822 \<and> RAX \<sigma> = (sextend (ucast ((- (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0xc),4]::32 word)))) 32 64::64 word) \<and> RBX \<sigma> = (((sextend (ucast ((- (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0xc),4]::32 word)))) 32 64::64 word)::64 word) AND RSI\<^sub>0) \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = RDX\<^sub>0 \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x28) \<and> RBP \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> R14 \<sigma> = ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)) \<and> R13 \<sigma> = ((((((RSI\<^sub>0::64 word) + (\<langle>63,0\<rangle>((RDX\<^sub>0::64 word) * 0x1)::64 word))::64 word) - 0x1)::64 word) AND (sextend (ucast ((- (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0xc),4]::32 word)))) 32 64::64 word)) \<and> R12 \<sigma> = RDI\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0xc),4]::32 word) = ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0xc),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBX\<^sub>0\<close>
declare P_0x14822_false_4_def[Ps]

definition P_0x14822_false_4_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x14822_false_4_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((RDI\<^sub>0::64 word) + 0x40), 8),
    (2, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0xc), 4),
    (3, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x28), 8)
  }\<close>

definition P_0x14822_false_4_regions :: state_pred where
  \<open>P_0x14822_false_4_regions \<sigma> \<equiv> \<exists>regions. P_0x14822_false_4_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x14828_4 :: state_pred where
  \<open>Q_0x14828_4 \<sigma> \<equiv> RIP \<sigma> = 0x14828 \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x28) \<and> RBP \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> R14 \<sigma> = ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)) \<and> R13 \<sigma> = ((((((RSI\<^sub>0::64 word) + (\<langle>63,0\<rangle>((RDX\<^sub>0::64 word) * 0x1)::64 word))::64 word) - 0x1)::64 word) AND (sextend (ucast ((- (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0xc),4]::32 word)))) 32 64::64 word)) \<and> R12 \<sigma> = RDI\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0xc),4]::32 word) = ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0xc),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBX\<^sub>0\<close>
declare Q_0x14828_4_def[Qs]

schematic_goal update_refcount_0_2_0x14822_0x14824_4[blocks]:
  assumes \<open>(P_0x14822_false_4 && P_0x14822_false_4_regions && ! jg) \<sigma>\<close>
  shows \<open>exec_block 2 0x14824 4 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x14828_4 ?\<sigma> \<and> block_usage P_0x14822_false_4_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x14822_false_4_def P_0x14822_false_4_regions_def post: Q_0x14828_4_def regionset: P_0x14822_false_4_regions_set_def)

definition P_0x14828_5 :: state_pred where
  \<open>P_0x14828_5 \<sigma> \<equiv> RIP \<sigma> = 0x14828 \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x28) \<and> RBP \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> R14 \<sigma> = ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)) \<and> R13 \<sigma> = ((((((RSI\<^sub>0::64 word) + (\<langle>63,0\<rangle>((RDX\<^sub>0::64 word) * 0x1)::64 word))::64 word) - 0x1)::64 word) AND (sextend (ucast ((- (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0xc),4]::32 word)))) 32 64::64 word)) \<and> R12 \<sigma> = RDI\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0xc),4]::32 word) = ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0xc),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBX\<^sub>0\<close>
declare P_0x14828_5_def[Ps]

definition P_0x14828_5_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x14828_5_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((RDI\<^sub>0::64 word) + 0x40), 8),
    (2, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8), 4),
    (3, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0xc), 4),
    (4, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x28), 8)
  }\<close>

definition P_0x14828_5_regions :: state_pred where
  \<open>P_0x14828_5_regions \<sigma> \<equiv> \<exists>regions. P_0x14828_5_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x14837_5 :: state_pred where
  \<open>Q_0x14837_5 \<sigma> \<equiv> RIP \<sigma> = 0x14837 \<and> RCX \<sigma> = ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),4]::32 word)) \<and> RDX \<sigma> = ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)) \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = (RBX \<sigma> >>> unat (((\<langle>7,0\<rangle>(\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),4]::32 word)::8 word)::8 word))) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x28) \<and> RBP \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> R14 \<sigma> = ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)) \<and> R13 \<sigma> = ((((((RSI\<^sub>0::64 word) + (\<langle>63,0\<rangle>((RDX\<^sub>0::64 word) * 0x1)::64 word))::64 word) - 0x1)::64 word) AND (sextend (ucast ((- (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0xc),4]::32 word)))) 32 64::64 word)) \<and> R12 \<sigma> = RDI\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),4]::32 word) = ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),4]::32 word)) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0xc),4]::32 word) = ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0xc),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBX\<^sub>0\<close>
declare Q_0x14837_5_def[Qs]

schematic_goal update_refcount_0_5_0x14828_0x14834_5[blocks]:
  assumes \<open>(P_0x14828_5 && P_0x14828_5_regions) \<sigma>\<close>
  shows \<open>exec_block 5 0x14834 5 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x14837_5 ?\<sigma> \<and> block_usage P_0x14828_5_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x14828_5_def P_0x14828_5_regions_def post: Q_0x14837_5_def regionset: P_0x14828_5_regions_set_def)

definition P_0x14837_6 :: state_pred where
  \<open>P_0x14837_6 \<sigma> \<equiv> RIP \<sigma> = 0x14837 \<and> RCX \<sigma> = ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),4]::32 word)) \<and> RDX \<sigma> = ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)) \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = (RBX \<sigma> >>> unat (((\<langle>7,0\<rangle>(\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),4]::32 word)::8 word)::8 word))) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x28) \<and> RBP \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> R14 \<sigma> = ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)) \<and> R13 \<sigma> = ((((((RSI\<^sub>0::64 word) + (\<langle>63,0\<rangle>((RDX\<^sub>0::64 word) * 0x1)::64 word))::64 word) - 0x1)::64 word) AND (sextend (ucast ((- (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0xc),4]::32 word)))) 32 64::64 word)) \<and> R12 \<sigma> = RDI\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),4]::32 word) = ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),4]::32 word)) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0xc),4]::32 word) = ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0xc),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBX\<^sub>0\<close>
declare P_0x14837_6_def[Ps]

definition P_0x14837_6_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x14837_6_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((RDI\<^sub>0::64 word) + 0x40), 8),
    (2, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8), 4),
    (3, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0xc), 4),
    (4, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x30), 8)
  }\<close>

definition P_0x14837_6_regions :: state_pred where
  \<open>P_0x14837_6_regions \<sigma> \<equiv> \<exists>regions. P_0x14837_6_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_update_cluster_refcount_addr_0x14837_6 :: state_pred where
  \<open>Q_update_cluster_refcount_addr_0x14837_6 \<sigma> \<equiv> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x30) \<and> RIP \<sigma> = update_cluster_refcount_addr \<and> RCX \<sigma> = ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),4]::32 word)) \<and> RDX \<sigma> = ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)) \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = (RBX \<sigma> >>> unat (((\<langle>7,0\<rangle>(\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),4]::32 word)::8 word)::8 word))) \<and> RBP \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> R14 \<sigma> = ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)) \<and> R13 \<sigma> = ((((((RSI\<^sub>0::64 word) + (\<langle>63,0\<rangle>((RDX\<^sub>0::64 word) * 0x1)::64 word))::64 word) - 0x1)::64 word) AND (sextend (ucast ((- (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0xc),4]::32 word)))) 32 64::64 word)) \<and> R12 \<sigma> = RDI\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),4]::32 word) = ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),4]::32 word)) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0xc),4]::32 word) = ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0xc),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = 0x1483c\<close>
declare Q_update_cluster_refcount_addr_0x14837_6_def[Qs]

schematic_goal update_refcount_0_1_0x14837_0x14837_6[blocks]:
  assumes \<open>(P_0x14837_6 && P_0x14837_6_regions) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x14837 6 \<sigma> \<triangleq> ?\<sigma> \<and> Q_update_cluster_refcount_addr_0x14837_6 ?\<sigma> \<and> block_usage P_0x14837_6_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x14837_6_def P_0x14837_6_regions_def post: Q_update_cluster_refcount_addr_0x14837_6_def regionset: P_0x14837_6_regions_set_def)

definition P_0x1483c_7 :: state_pred where
  \<open>P_0x1483c_7 \<sigma> \<equiv> RIP \<sigma> = 0x1483c \<and> RCX \<sigma> = ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),4]::32 word)) \<and> RDX \<sigma> = ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)) \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = (RBX \<sigma> >>> unat (((\<langle>7,0\<rangle>(\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),4]::32 word)::8 word)::8 word))) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x28) \<and> RBP \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> R14 \<sigma> = ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)) \<and> R13 \<sigma> = ((((((RSI\<^sub>0::64 word) + (\<langle>63,0\<rangle>((RDX\<^sub>0::64 word) * 0x1)::64 word))::64 word) - 0x1)::64 word) AND (sextend (ucast ((- (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0xc),4]::32 word)))) 32 64::64 word)) \<and> R12 \<sigma> = RDI\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),4]::32 word) = ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),4]::32 word)) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0xc),4]::32 word) = ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0xc),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = 0x1483c\<close>
declare P_0x1483c_7_def[Ps]

definition P_0x1483c_7_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x1483c_7_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((RDI\<^sub>0::64 word) + 0x40), 8),
    (2, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8), 4),
    (3, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0xc), 4),
    (4, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x30), 8)
  }\<close>

definition P_0x1483c_7_regions :: state_pred where
  \<open>P_0x1483c_7_regions \<sigma> \<equiv> \<exists>regions. P_0x1483c_7_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x14846_7 :: state_pred where
  \<open>Q_0x14846_7 \<sigma> \<equiv> RIP \<sigma> = 0x14846 \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x28) \<and> RBP \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> R14 \<sigma> = ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)) \<and> R13 \<sigma> = ((((((RSI\<^sub>0::64 word) + (\<langle>63,0\<rangle>((RDX\<^sub>0::64 word) * 0x1)::64 word))::64 word) - 0x1)::64 word) AND (sextend (ucast ((- (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0xc),4]::32 word)))) 32 64::64 word)) \<and> R12 \<sigma> = RDI\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0xc),4]::32 word) = ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0xc),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBX\<^sub>0\<close>
declare Q_0x14846_7_def[Qs]

schematic_goal update_refcount_0_3_0x1483c_0x14843_7[blocks]:
  assumes \<open>(P_0x1483c_7 && P_0x1483c_7_regions) \<sigma>\<close>
  shows \<open>exec_block 3 0x14843 7 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x14846_7 ?\<sigma> \<and> block_usage P_0x1483c_7_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x1483c_7_def P_0x1483c_7_regions_def post: Q_0x14846_7_def regionset: P_0x1483c_7_regions_set_def)

definition P_0x14846_true_8 :: state_pred where
  \<open>P_0x14846_true_8 \<sigma> \<equiv> RIP \<sigma> = 0x14846 \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x28) \<and> RBP \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> R14 \<sigma> = ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)) \<and> R13 \<sigma> = ((((((RSI\<^sub>0::64 word) + (\<langle>63,0\<rangle>((RDX\<^sub>0::64 word) * 0x1)::64 word))::64 word) - 0x1)::64 word) AND (sextend (ucast ((- (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0xc),4]::32 word)))) 32 64::64 word)) \<and> R12 \<sigma> = RDI\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0xc),4]::32 word) = ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0xc),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBX\<^sub>0\<close>
declare P_0x14846_true_8_def[Ps]

definition P_0x14846_true_8_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x14846_true_8_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((RDI\<^sub>0::64 word) + 0x40), 8),
    (2, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0xc), 4),
    (3, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x28), 8)
  }\<close>

definition P_0x14846_true_8_regions :: state_pred where
  \<open>P_0x14846_true_8_regions \<sigma> \<equiv> \<exists>regions. P_0x14846_true_8_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x14828_8 :: state_pred where
  \<open>Q_0x14828_8 \<sigma> \<equiv> RIP \<sigma> = 0x14828 \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x28) \<and> RBP \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> R14 \<sigma> = ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)) \<and> R13 \<sigma> = ((((((RSI\<^sub>0::64 word) + (\<langle>63,0\<rangle>((RDX\<^sub>0::64 word) * 0x1)::64 word))::64 word) - 0x1)::64 word) AND (sextend (ucast ((- (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0xc),4]::32 word)))) 32 64::64 word)) \<and> R12 \<sigma> = RDI\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0xc),4]::32 word) = ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0xc),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBX\<^sub>0\<close>
declare Q_0x14828_8_def[Qs]

schematic_goal update_refcount_0_1_0x14846_0x14846_8[blocks]:
  assumes \<open>(P_0x14846_true_8 && P_0x14846_true_8_regions && jge) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x14846 8 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x14828_8 ?\<sigma> \<and> block_usage P_0x14846_true_8_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x14846_true_8_def P_0x14846_true_8_regions_def post: Q_0x14828_8_def regionset: P_0x14846_true_8_regions_set_def)

definition P_0x14846_false_9 :: state_pred where
  \<open>P_0x14846_false_9 \<sigma> \<equiv> RIP \<sigma> = 0x14846 \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x28) \<and> RBP \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> R14 \<sigma> = ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)) \<and> R13 \<sigma> = ((((((RSI\<^sub>0::64 word) + (\<langle>63,0\<rangle>((RDX\<^sub>0::64 word) * 0x1)::64 word))::64 word) - 0x1)::64 word) AND (sextend (ucast ((- (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0xc),4]::32 word)))) 32 64::64 word)) \<and> R12 \<sigma> = RDI\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0xc),4]::32 word) = ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0xc),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBX\<^sub>0\<close>
declare P_0x14846_false_9_def[Ps]

definition P_0x14846_false_9_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x14846_false_9_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((RDI\<^sub>0::64 word) + 0x40), 8),
    (2, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0xc), 4),
    (3, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x28), 8)
  }\<close>

definition P_0x14846_false_9_regions :: state_pred where
  \<open>P_0x14846_false_9_regions \<sigma> \<equiv> \<exists>regions. P_0x14846_false_9_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x14848_9 :: state_pred where
  \<open>Q_0x14848_9 \<sigma> \<equiv> RIP \<sigma> = 0x14848 \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x28) \<and> RBP \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> R14 \<sigma> = ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)) \<and> R13 \<sigma> = ((((((RSI\<^sub>0::64 word) + (\<langle>63,0\<rangle>((RDX\<^sub>0::64 word) * 0x1)::64 word))::64 word) - 0x1)::64 word) AND (sextend (ucast ((- (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0xc),4]::32 word)))) 32 64::64 word)) \<and> R12 \<sigma> = RDI\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0xc),4]::32 word) = ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0xc),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBX\<^sub>0\<close>
declare Q_0x14848_9_def[Qs]

schematic_goal update_refcount_0_1_0x14846_0x14846_9[blocks]:
  assumes \<open>(P_0x14846_false_9 && P_0x14846_false_9_regions && ! jge) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x14846 9 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x14848_9 ?\<sigma> \<and> block_usage P_0x14846_false_9_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x14846_false_9_def P_0x14846_false_9_regions_def post: Q_0x14848_9_def regionset: P_0x14846_false_9_regions_set_def)

definition P_0x14848_10 :: state_pred where
  \<open>P_0x14848_10 \<sigma> \<equiv> RIP \<sigma> = 0x14848 \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x28) \<and> RBP \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> R14 \<sigma> = ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)) \<and> R13 \<sigma> = ((((((RSI\<^sub>0::64 word) + (\<langle>63,0\<rangle>((RDX\<^sub>0::64 word) * 0x1)::64 word))::64 word) - 0x1)::64 word) AND (sextend (ucast ((- (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0xc),4]::32 word)))) 32 64::64 word)) \<and> R12 \<sigma> = RDI\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0xc),4]::32 word) = ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0xc),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBX\<^sub>0\<close>
declare P_0x14848_10_def[Ps]

definition P_0x14848_10_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x14848_10_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((RDI\<^sub>0::64 word) + 0x40), 8),
    (2, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0xc), 4),
    (3, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x28), 8)
  }\<close>

definition P_0x14848_10_regions :: state_pred where
  \<open>P_0x14848_10_regions \<sigma> \<equiv> \<exists>regions. P_0x14848_10_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_ret_address_10 :: state_pred where
  \<open>Q_ret_address_10 \<sigma> \<equiv> RIP \<sigma> = ret_address \<and> RBX \<sigma> = RBX\<^sub>0 \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) + 0x8) \<and> RBP \<sigma> = RBP\<^sub>0 \<and> R14 \<sigma> = R14\<^sub>0 \<and> R13 \<sigma> = R13\<^sub>0 \<and> R12 \<sigma> = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address\<close>
declare Q_ret_address_10_def[Qs]

schematic_goal update_refcount_0_6_0x14848_0x14850_10[blocks]:
  assumes \<open>(P_0x14848_10 && P_0x14848_10_regions) \<sigma>\<close>
  shows \<open>exec_block 6 0x14850 10 \<sigma> \<triangleq> ?\<sigma> \<and> Q_ret_address_10 ?\<sigma> \<and> block_usage P_0x14848_10_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x14848_10_def P_0x14848_10_regions_def post: Q_ret_address_10_def regionset: P_0x14848_10_regions_set_def)

definition update_refcount_acode :: ACode where
  \<open>update_refcount_acode =
    Block (Suc 0) 0x147f0 0;
    IF jle THEN
      Block 2 0x14858 (Suc 0)
    ELSE
      Block 17 0x1481f 2;
      IF jg THEN
        Block (Suc 0) 0x14822 3
      ELSE
        Block 2 0x14824 4;
        WHILE P_0x14828_5 DO
          Block 5 0x14834 5;
          Block (Suc 0) 0x14837 6;
          CALL update_cluster_refcount_acode;
          Block 3 0x14843 7;
          IF jge THEN
            Block (Suc 0) 0x14846 8
          ELSE
            Block (Suc 0) 0x14846 9
          FI
        OD
      FI;
      Block 6 0x14850 10
    FI
  \<close>

schematic_goal "update_refcount":
  assumes
    \<open>\<forall>\<sigma>. RIP \<sigma> = 0x147f3 \<longrightarrow> P_0x147f3_true_1_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x147f3 \<longrightarrow> P_0x147f3_false_2_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x14822 \<longrightarrow> P_0x14822_true_3_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x14822 \<longrightarrow> P_0x14822_false_4_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x14828 \<longrightarrow> P_0x14828_5_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x14837 \<longrightarrow> P_0x14837_6_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x1483c \<longrightarrow> P_0x1483c_7_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x14846 \<longrightarrow> P_0x14846_true_8_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x14846 \<longrightarrow> P_0x14846_false_9_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x14848 \<longrightarrow> P_0x14848_10_regions \<sigma>\<close>
    and [blocks]: \<open>{{Q_update_cluster_refcount_addr_0x14837_6}} \<box>update_cluster_refcount_acode {{P_0x1483c_7;M_0x14837}}\<close>
  shows \<open>{{?P}} update_refcount_acode {{?Q;?M}}\<close>
  apply (vcg acode: update_refcount_acode_def assms: assms)
           apply (vcg_while \<open>P_0x14828_5 || P_0x14848_10\<close> assms: assms)
  done

end

end
