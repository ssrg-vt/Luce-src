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
theory bdrv_find
  imports "../../../isabelle/VCG/HTriple"
begin

locale "qemu_img_xen" = execution_context + exec_code +
  fixes strcmp_0x19696_retval\<^sub>v strcmp_addr :: \<open>64 word\<close>
    and strcmp_acode :: ACode
  assumes fetch:
    "fetch 0x19660 \<equiv> (Unary (IS_8088 Push) (Storage (Reg (General SixtyFour rbp))), 1)"
    "fetch 0x19661 \<equiv> (Unary (IS_8088 Push) (Storage (Reg (General SixtyFour rbx))), 1)"
    "fetch 0x19662 \<equiv> (Binary (IS_8088 Sub) (Reg (General SixtyFour rsp)) (Immediate SixtyFour (ImmVal 8)), 4)"
    "fetch 0x19666 \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour rbx)) (Storage (Memory SixtyFour (A_SizeDirective 64 (A_Plus (A_FromReg (General SixtyFour rip)) (A_WordConstant 69163))))), 7)"
    "fetch 0x1966d \<equiv> (Binary (IS_8088 Test) (Reg (General SixtyFour rbx)) (Storage (Reg (General SixtyFour rbx))), 3)"
    "fetch 0x19670 \<equiv> (Unary (IS_8088 Je) (Immediate SixtyFour (ImmVal 104095)), 2)"
    "fetch 0x19672 \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour rbp)) (Storage (Reg (General SixtyFour rdi))), 3)"
    "fetch 0x19675 \<equiv> (Unary (IS_8088 Jmp) (Immediate SixtyFour (ImmVal 104076)), 2)"
    "fetch 0x19677 \<equiv> (Unary (IS_8088 Nop) (Storage (Memory Sixteen (A_SizeDirective 16 (A_Plus (A_FromReg (General SixtyFour rax)) (A_Plus (A_Mult 1 (A_FromReg (General SixtyFour rax))) (A_WordConstant 0)))))), 9)"
    "fetch 0x19680 \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour rbx)) (Storage (Memory SixtyFour (A_SizeDirective 64 (A_Plus (A_FromReg (General SixtyFour rbx)) (A_WordConstant 2232))))), 7)"
    "fetch 0x19687 \<equiv> (Binary (IS_8088 Test) (Reg (General SixtyFour rbx)) (Storage (Reg (General SixtyFour rbx))), 3)"
    "fetch 0x1968a \<equiv> (Unary (IS_8088 Je) (Immediate SixtyFour (ImmVal 104095)), 2)"
    "fetch 0x1968c \<equiv> (Binary (IS_8088 Lea) (Reg (General SixtyFour rsi)) (Storage (Memory SixtyFour (A_Plus (A_FromReg (General SixtyFour rbx)) (A_WordConstant 2200)))), 7)"
    "fetch 0x19693 \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour rdi)) (Storage (Reg (General SixtyFour rbp))), 3)"
    "fetch 0x19696 \<equiv> (Unary (IS_8088 Call) (Immediate SixtyFour (ImmLabel ''strcmp'')), 5)"
    "fetch 0x1969b \<equiv> (Binary (IS_8088 Test) (Reg (General ThirtyTwo rax)) (Storage (Reg (General ThirtyTwo rax))), 2)"
    "fetch 0x1969d \<equiv> (Unary (IS_8088 Jne) (Immediate SixtyFour (ImmVal 104064)), 2)"
    "fetch 0x1969f \<equiv> (Binary (IS_8088 Add) (Reg (General SixtyFour rsp)) (Immediate SixtyFour (ImmVal 8)), 4)"
    "fetch 0x196a3 \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour rax)) (Storage (Reg (General SixtyFour rbx))), 3)"
    "fetch 0x196a6 \<equiv> (Unary (IS_8088 Pop) (Storage (Reg (General SixtyFour rbx))), 1)"
    "fetch 0x196a7 \<equiv> (Unary (IS_8088 Pop) (Storage (Reg (General SixtyFour rbp))), 1)"
    "fetch 0x196a8 \<equiv> (Nullary (IS_8088 Ret), 1)"
    and \<alpha>_def: \<open>\<alpha> = \<lparr>text_sections = [], data_sections = [], labels_to_offsets = [], binary_offset = 0\<rparr>\<close>
    and strcmp\<^sub>a\<^sub>d\<^sub>d\<^sub>r[simp]: \<open>the (label_to_address \<alpha> ''strcmp'') = strcmp_addr\<close>
begin

text \<open>Using definitions that don't get unfolded immediately prevents locale argument issues.\<close>
definition \<open>strcmp_0x19696_retval \<equiv> strcmp_0x19696_retval\<^sub>v\<close>

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

locale "bdrv_find" = "qemu_img_xen" +
  fixes RAX\<^sub>0\<^sub>v RBX\<^sub>0\<^sub>v RDI\<^sub>0\<^sub>v RSI\<^sub>0\<^sub>v RSP\<^sub>0\<^sub>v RBP\<^sub>0\<^sub>v ret_address\<^sub>v :: \<open>64 word\<close>
begin

text \<open>Using definitions that don't get unfolded immediately prevents locale argument issues.\<close>
definition \<open>RAX\<^sub>0 \<equiv> RAX\<^sub>0\<^sub>v\<close>
definition \<open>RBX\<^sub>0 \<equiv> RBX\<^sub>0\<^sub>v\<close>
definition \<open>RDI\<^sub>0 \<equiv> RDI\<^sub>0\<^sub>v\<close>
definition \<open>RSI\<^sub>0 \<equiv> RSI\<^sub>0\<^sub>v\<close>
definition \<open>RSP\<^sub>0 \<equiv> RSP\<^sub>0\<^sub>v\<close>
definition \<open>RBP\<^sub>0 \<equiv> RBP\<^sub>0\<^sub>v\<close>
definition \<open>ret_address \<equiv> ret_address\<^sub>v\<close>

definition P_0x19660_0 :: state_pred where
  \<open>P_0x19660_0 \<sigma> \<equiv> RIP \<sigma> = 0x19660 \<and> RAX \<sigma> = RAX\<^sub>0 \<and> RBX \<sigma> = RBX\<^sub>0 \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = RSP\<^sub>0 \<and> RBP \<sigma> = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address\<close>
declare P_0x19660_0_def[Ps]

definition P_0x19660_0_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x19660_0_regions_set \<sigma> \<equiv> {
    (0, 0x2a498, 8),
    (1, RSP\<^sub>0, 8),
    (2, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x10), 8)
  }\<close>

definition P_0x19660_0_regions :: state_pred where
  \<open>P_0x19660_0_regions \<sigma> \<equiv> \<exists>regions. P_0x19660_0_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x19670_0 :: state_pred where
  \<open>Q_0x19670_0 \<sigma> \<equiv> RIP \<sigma> = 0x19670 \<and> RAX \<sigma> = RAX\<^sub>0 \<and> RBX \<sigma> = (\<sigma> \<turnstile> *[0x2a498,8]::64 word) \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x18) \<and> RBP \<sigma> = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[0x2a498,8]::64 word) = (\<sigma> \<turnstile> *[0x2a498,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = RBX\<^sub>0\<close>
declare Q_0x19670_0_def[Qs]

schematic_goal bdrv_find_0_5_0x19660_0x1966d_0[blocks]:
  assumes \<open>(P_0x19660_0 && P_0x19660_0_regions) \<sigma>\<close>
  shows \<open>exec_block 5 0x1966d 0 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x19670_0 ?\<sigma> \<and> block_usage P_0x19660_0_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x19660_0_def P_0x19660_0_regions_def post: Q_0x19670_0_def regionset: P_0x19660_0_regions_set_def)

definition P_0x19670_true_1 :: state_pred where
  \<open>P_0x19670_true_1 \<sigma> \<equiv> RIP \<sigma> = 0x19670 \<and> RAX \<sigma> = RAX\<^sub>0 \<and> RBX \<sigma> = (\<sigma> \<turnstile> *[0x2a498,8]::64 word) \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x18) \<and> RBP \<sigma> = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[0x2a498,8]::64 word) = (\<sigma> \<turnstile> *[0x2a498,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = RBX\<^sub>0\<close>
declare P_0x19670_true_1_def[Ps]

definition P_0x19670_true_1_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x19670_true_1_regions_set \<sigma> \<equiv> {
    (0, 0x2a498, 8),
    (1, RSP\<^sub>0, 8),
    (2, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x10), 8)
  }\<close>

definition P_0x19670_true_1_regions :: state_pred where
  \<open>P_0x19670_true_1_regions \<sigma> \<equiv> \<exists>regions. P_0x19670_true_1_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x1969f_1 :: state_pred where
  \<open>Q_0x1969f_1 \<sigma> \<equiv> RIP \<sigma> = 0x1969f \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x18) \<and> (\<sigma> \<turnstile> *[0x2a498,8]::64 word) = (\<sigma> \<turnstile> *[0x2a498,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = RBX\<^sub>0\<close>
declare Q_0x1969f_1_def[Qs]

schematic_goal bdrv_find_0_1_0x19670_0x19670_1[blocks]:
  assumes \<open>(P_0x19670_true_1 && P_0x19670_true_1_regions && ZF) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x19670 (Suc 0) \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x1969f_1 ?\<sigma> \<and> block_usage P_0x19670_true_1_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x19670_true_1_def P_0x19670_true_1_regions_def post: Q_0x1969f_1_def regionset: P_0x19670_true_1_regions_set_def)

definition P_0x19670_false_2 :: state_pred where
  \<open>P_0x19670_false_2 \<sigma> \<equiv> RIP \<sigma> = 0x19670 \<and> RAX \<sigma> = RAX\<^sub>0 \<and> RBX \<sigma> = (\<sigma> \<turnstile> *[0x2a498,8]::64 word) \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x18) \<and> RBP \<sigma> = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[0x2a498,8]::64 word) = (\<sigma> \<turnstile> *[0x2a498,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = RBX\<^sub>0\<close>
declare P_0x19670_false_2_def[Ps]

definition P_0x19670_false_2_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x19670_false_2_regions_set \<sigma> \<equiv> {
    (0, 0x2a498, 8),
    (1, RSP\<^sub>0, 8),
    (2, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x10), 8)
  }\<close>

definition P_0x19670_false_2_regions :: state_pred where
  \<open>P_0x19670_false_2_regions \<sigma> \<equiv> \<exists>regions. P_0x19670_false_2_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x1968c_2 :: state_pred where
  \<open>Q_0x1968c_2 \<sigma> \<equiv> RIP \<sigma> = 0x1968c \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x18) \<and> RBP \<sigma> = RDI\<^sub>0 \<and> (\<sigma> \<turnstile> *[0x2a498,8]::64 word) = (\<sigma> \<turnstile> *[0x2a498,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = RBX\<^sub>0\<close>
declare Q_0x1968c_2_def[Qs]

schematic_goal bdrv_find_0_3_0x19670_0x19675_2[blocks]:
  assumes \<open>(P_0x19670_false_2 && P_0x19670_false_2_regions && ! ZF) \<sigma>\<close>
  shows \<open>exec_block 3 0x19675 2 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x1968c_2 ?\<sigma> \<and> block_usage P_0x19670_false_2_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x19670_false_2_def P_0x19670_false_2_regions_def post: Q_0x1968c_2_def regionset: P_0x19670_false_2_regions_set_def)

definition P_0x1968c_3 :: state_pred where
  \<open>P_0x1968c_3 \<sigma> \<equiv> RIP \<sigma> = 0x1968c \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x18) \<and> RBP \<sigma> = RDI\<^sub>0 \<and> (\<sigma> \<turnstile> *[0x2a498,8]::64 word) = (\<sigma> \<turnstile> *[0x2a498,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = RBX\<^sub>0\<close>
declare P_0x1968c_3_def[Ps]

definition P_0x1968c_3_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x1968c_3_regions_set \<sigma> \<equiv> {
    (0, 0x2a498, 8),
    (1, RSP\<^sub>0, 8),
    (2, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x10), 8)
  }\<close>

definition P_0x1968c_3_regions :: state_pred where
  \<open>P_0x1968c_3_regions \<sigma> \<equiv> \<exists>regions. P_0x1968c_3_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x19696_3 :: state_pred where
  \<open>Q_0x19696_3 \<sigma> \<equiv> RIP \<sigma> = 0x19696 \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = ((RBX \<sigma>::64 word) + 0x898) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x18) \<and> RBP \<sigma> = RDI\<^sub>0 \<and> (\<sigma> \<turnstile> *[0x2a498,8]::64 word) = (\<sigma> \<turnstile> *[0x2a498,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = RBX\<^sub>0\<close>
declare Q_0x19696_3_def[Qs]

schematic_goal bdrv_find_0_2_0x1968c_0x19693_3[blocks]:
  assumes \<open>(P_0x1968c_3 && P_0x1968c_3_regions) \<sigma>\<close>
  shows \<open>exec_block 2 0x19693 3 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x19696_3 ?\<sigma> \<and> block_usage P_0x1968c_3_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x1968c_3_def P_0x1968c_3_regions_def post: Q_0x19696_3_def regionset: P_0x1968c_3_regions_set_def)

definition P_0x19696_4 :: state_pred where
  \<open>P_0x19696_4 \<sigma> \<equiv> RIP \<sigma> = 0x19696 \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = ((RBX \<sigma>::64 word) + 0x898) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x18) \<and> RBP \<sigma> = RDI\<^sub>0 \<and> (\<sigma> \<turnstile> *[0x2a498,8]::64 word) = (\<sigma> \<turnstile> *[0x2a498,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = RBX\<^sub>0\<close>
declare P_0x19696_4_def[Ps]

definition P_0x19696_4_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x19696_4_regions_set \<sigma> \<equiv> {
    (0, 0x2a498, 8),
    (1, RSP\<^sub>0, 8),
    (2, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x20), 8)
  }\<close>

definition P_0x19696_4_regions :: state_pred where
  \<open>P_0x19696_4_regions \<sigma> \<equiv> \<exists>regions. P_0x19696_4_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_strcmp_addr_0x19696_4 :: state_pred where
  \<open>Q_strcmp_addr_0x19696_4 \<sigma> \<equiv> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x20) \<and> RIP \<sigma> = strcmp_addr \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = ((RBX \<sigma>::64 word) + 0x898) \<and> RBP \<sigma> = RDI\<^sub>0 \<and> (\<sigma> \<turnstile> *[0x2a498,8]::64 word) = (\<sigma> \<turnstile> *[0x2a498,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = 0x1969b\<close>
declare Q_strcmp_addr_0x19696_4_def[Qs]

schematic_goal bdrv_find_0_1_0x19696_0x19696_4[blocks]:
  assumes \<open>(P_0x19696_4 && P_0x19696_4_regions) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x19696 4 \<sigma> \<triangleq> ?\<sigma> \<and> Q_strcmp_addr_0x19696_4 ?\<sigma> \<and> block_usage P_0x19696_4_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x19696_4_def P_0x19696_4_regions_def post: Q_strcmp_addr_0x19696_4_def regionset: P_0x19696_4_regions_set_def)

definition P_0x1969b_5 :: state_pred where
  \<open>P_0x1969b_5 \<sigma> \<equiv> RIP \<sigma> = 0x1969b \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = ((RBX \<sigma>::64 word) + 0x898) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x18) \<and> RBP \<sigma> = RDI\<^sub>0 \<and> (\<sigma> \<turnstile> *[0x2a498,8]::64 word) = (\<sigma> \<turnstile> *[0x2a498,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = 0x1969b\<close>
declare P_0x1969b_5_def[Ps]

definition P_0x1969b_5_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x1969b_5_regions_set \<sigma> \<equiv> {
    (0, 0x2a498, 8),
    (1, RSP\<^sub>0, 8),
    (2, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x20), 8)
  }\<close>

definition P_0x1969b_5_regions :: state_pred where
  \<open>P_0x1969b_5_regions \<sigma> \<equiv> \<exists>regions. P_0x1969b_5_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x1969d_5 :: state_pred where
  \<open>Q_0x1969d_5 \<sigma> \<equiv> RIP \<sigma> = 0x1969d \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = ((RBX \<sigma>::64 word) + 0x898) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x18) \<and> RBP \<sigma> = RDI\<^sub>0 \<and> (\<sigma> \<turnstile> *[0x2a498,8]::64 word) = (\<sigma> \<turnstile> *[0x2a498,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = 0x1969b\<close>
declare Q_0x1969d_5_def[Qs]

schematic_goal bdrv_find_0_1_0x1969b_0x1969b_5[blocks]:
  assumes \<open>(P_0x1969b_5 && P_0x1969b_5_regions) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x1969b 5 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x1969d_5 ?\<sigma> \<and> block_usage P_0x1969b_5_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x1969b_5_def P_0x1969b_5_regions_def post: Q_0x1969d_5_def regionset: P_0x1969b_5_regions_set_def)

definition P_0x1969d_true_6 :: state_pred where
  \<open>P_0x1969d_true_6 \<sigma> \<equiv> RIP \<sigma> = 0x1969d \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = ((RBX \<sigma>::64 word) + 0x898) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x18) \<and> RBP \<sigma> = RDI\<^sub>0 \<and> (\<sigma> \<turnstile> *[0x2a498,8]::64 word) = (\<sigma> \<turnstile> *[0x2a498,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = 0x1969b\<close>
declare P_0x1969d_true_6_def[Ps]

definition P_0x1969d_true_6_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x1969d_true_6_regions_set \<sigma> \<equiv> {
    (0, 0x2a498, 8),
    (1, RSP\<^sub>0, 8),
    (2, ((RBX \<sigma>::64 word) + 0x8b8), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x20), 8)
  }\<close>

definition P_0x1969d_true_6_regions :: state_pred where
  \<open>P_0x1969d_true_6_regions \<sigma> \<equiv> \<exists>regions. P_0x1969d_true_6_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x1968a_6 :: state_pred where
  \<open>Q_0x1968a_6 \<sigma> \<equiv> RIP \<sigma> = 0x1968a \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x18) \<and> RBP \<sigma> = RDI\<^sub>0 \<and> (\<sigma> \<turnstile> *[0x2a498,8]::64 word) = (\<sigma> \<turnstile> *[0x2a498,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = RBX\<^sub>0\<close>
declare Q_0x1968a_6_def[Qs]

schematic_goal bdrv_find_0_3_0x1969d_0x19687_6[blocks]:
  assumes \<open>(P_0x1969d_true_6 && P_0x1969d_true_6_regions && !ZF) \<sigma>\<close>
  shows \<open>exec_block 3 0x19687 6 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x1968a_6 ?\<sigma> \<and> block_usage P_0x1969d_true_6_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x1969d_true_6_def P_0x1969d_true_6_regions_def post: Q_0x1968a_6_def regionset: P_0x1969d_true_6_regions_set_def)

definition P_0x1968a_true_7 :: state_pred where
  \<open>P_0x1968a_true_7 \<sigma> \<equiv> RIP \<sigma> = 0x1968a \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x18) \<and> RBP \<sigma> = RDI\<^sub>0 \<and> (\<sigma> \<turnstile> *[0x2a498,8]::64 word) = (\<sigma> \<turnstile> *[0x2a498,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = RBX\<^sub>0\<close>
declare P_0x1968a_true_7_def[Ps]

definition P_0x1968a_true_7_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x1968a_true_7_regions_set \<sigma> \<equiv> {
    (0, 0x2a498, 8),
    (1, RSP\<^sub>0, 8),
    (2, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x10), 8)
  }\<close>

definition P_0x1968a_true_7_regions :: state_pred where
  \<open>P_0x1968a_true_7_regions \<sigma> \<equiv> \<exists>regions. P_0x1968a_true_7_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x1969f_7 :: state_pred where
  \<open>Q_0x1969f_7 \<sigma> \<equiv> RIP \<sigma> = 0x1969f \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x18) \<and> RBP \<sigma> = RDI\<^sub>0 \<and> (\<sigma> \<turnstile> *[0x2a498,8]::64 word) = (\<sigma> \<turnstile> *[0x2a498,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = RBX\<^sub>0\<close>
declare Q_0x1969f_7_def[Qs]

schematic_goal bdrv_find_0_1_0x1968a_0x1968a_7[blocks]:
  assumes \<open>(P_0x1968a_true_7 && P_0x1968a_true_7_regions && ZF) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x1968a 7 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x1969f_7 ?\<sigma> \<and> block_usage P_0x1968a_true_7_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x1968a_true_7_def P_0x1968a_true_7_regions_def post: Q_0x1969f_7_def regionset: P_0x1968a_true_7_regions_set_def)

definition P_0x1968a_false_8 :: state_pred where
  \<open>P_0x1968a_false_8 \<sigma> \<equiv> RIP \<sigma> = 0x1968a \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x18) \<and> RBP \<sigma> = RDI\<^sub>0 \<and> (\<sigma> \<turnstile> *[0x2a498,8]::64 word) = (\<sigma> \<turnstile> *[0x2a498,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = RBX\<^sub>0\<close>
declare P_0x1968a_false_8_def[Ps]

definition P_0x1968a_false_8_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x1968a_false_8_regions_set \<sigma> \<equiv> {
    (0, 0x2a498, 8),
    (1, RSP\<^sub>0, 8),
    (2, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x10), 8)
  }\<close>

definition P_0x1968a_false_8_regions :: state_pred where
  \<open>P_0x1968a_false_8_regions \<sigma> \<equiv> \<exists>regions. P_0x1968a_false_8_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x1968c_8 :: state_pred where
  \<open>Q_0x1968c_8 \<sigma> \<equiv> RIP \<sigma> = 0x1968c \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x18) \<and> RBP \<sigma> = RDI\<^sub>0 \<and> (\<sigma> \<turnstile> *[0x2a498,8]::64 word) = (\<sigma> \<turnstile> *[0x2a498,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = RBX\<^sub>0\<close>
declare Q_0x1968c_8_def[Qs]

schematic_goal bdrv_find_0_1_0x1968a_0x1968a_8[blocks]:
  assumes \<open>(P_0x1968a_false_8 && P_0x1968a_false_8_regions && ! ZF) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x1968a 8 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x1968c_8 ?\<sigma> \<and> block_usage P_0x1968a_false_8_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x1968a_false_8_def P_0x1968a_false_8_regions_def post: Q_0x1968c_8_def regionset: P_0x1968a_false_8_regions_set_def)

definition P_0x1969d_false_9 :: state_pred where
  \<open>P_0x1969d_false_9 \<sigma> \<equiv> RIP \<sigma> = 0x1969d \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = ((RBX \<sigma>::64 word) + 0x898) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x18) \<and> RBP \<sigma> = RDI\<^sub>0 \<and> (\<sigma> \<turnstile> *[0x2a498,8]::64 word) = (\<sigma> \<turnstile> *[0x2a498,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = 0x1969b\<close>
declare P_0x1969d_false_9_def[Ps]

definition P_0x1969d_false_9_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x1969d_false_9_regions_set \<sigma> \<equiv> {
    (0, 0x2a498, 8),
    (1, RSP\<^sub>0, 8),
    (2, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x20), 8)
  }\<close>

definition P_0x1969d_false_9_regions :: state_pred where
  \<open>P_0x1969d_false_9_regions \<sigma> \<equiv> \<exists>regions. P_0x1969d_false_9_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x1969f_9 :: state_pred where
  \<open>Q_0x1969f_9 \<sigma> \<equiv> RIP \<sigma> = 0x1969f \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x18) \<and> RBP \<sigma> = RDI\<^sub>0 \<and> (\<sigma> \<turnstile> *[0x2a498,8]::64 word) = (\<sigma> \<turnstile> *[0x2a498,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = RBX\<^sub>0\<close>
declare Q_0x1969f_9_def[Qs]

schematic_goal bdrv_find_0_1_0x1969d_0x1969d_9[blocks]:
  assumes \<open>(P_0x1969d_false_9 && P_0x1969d_false_9_regions && ! !ZF) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x1969d 9 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x1969f_9 ?\<sigma> \<and> block_usage P_0x1969d_false_9_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x1969d_false_9_def P_0x1969d_false_9_regions_def post: Q_0x1969f_9_def regionset: P_0x1969d_false_9_regions_set_def)

definition P_0x1969f_10 :: state_pred where
  \<open>P_0x1969f_10 \<sigma> \<equiv> RIP \<sigma> = 0x1969f \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x18) \<and> (\<sigma> \<turnstile> *[0x2a498,8]::64 word) = (\<sigma> \<turnstile> *[0x2a498,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = RBX\<^sub>0\<close>
declare P_0x1969f_10_def[Ps]

definition P_0x1969f_10_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x1969f_10_regions_set \<sigma> \<equiv> {
    (0, 0x2a498, 8),
    (1, RSP\<^sub>0, 8),
    (2, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x10), 8)
  }\<close>

definition P_0x1969f_10_regions :: state_pred where
  \<open>P_0x1969f_10_regions \<sigma> \<equiv> \<exists>regions. P_0x1969f_10_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_ret_address_10 :: state_pred where
  \<open>Q_ret_address_10 \<sigma> \<equiv> RIP \<sigma> = ret_address \<and> RBX \<sigma> = RBX\<^sub>0 \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) + 0x8) \<and> RBP \<sigma> = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[0x2a498,8]::64 word) = (\<sigma> \<turnstile> *[0x2a498,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = RBX\<^sub>0\<close>
declare Q_ret_address_10_def[Qs]

schematic_goal bdrv_find_0_5_0x1969f_0x196a8_10[blocks]:
  assumes \<open>(P_0x1969f_10 && P_0x1969f_10_regions) \<sigma>\<close>
  shows \<open>exec_block 5 0x196a8 10 \<sigma> \<triangleq> ?\<sigma> \<and> Q_ret_address_10 ?\<sigma> \<and> block_usage P_0x1969f_10_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x1969f_10_def P_0x1969f_10_regions_def post: Q_ret_address_10_def regionset: P_0x1969f_10_regions_set_def)

definition bdrv_find_acode :: ACode where
  \<open>bdrv_find_acode =
    Block 5 0x1966d 0;
    IF ZF THEN
      Block (Suc 0) 0x19670 (Suc 0)
    ELSE
      Block 3 0x19675 2;
      WHILE P_0x1968c_3 DO
        Block 2 0x19693 3;
        Block (Suc 0) 0x19696 4;
        CALL strcmp_acode;
        Block (Suc 0) 0x1969b 5;
        IF !ZF THEN
          Block 3 0x19687 6;
          IF ZF THEN
            Block (Suc 0) 0x1968a 7
          ELSE
            Block (Suc 0) 0x1968a 8
          FI
        ELSE
          Block (Suc 0) 0x1969d 9
        FI
      OD
    FI;
    Block 5 0x196a8 10
  \<close>

schematic_goal "bdrv_find":
  assumes
    \<open>\<forall>\<sigma>. RIP \<sigma> = 0x19670 \<longrightarrow> P_0x19670_true_1_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x19670 \<longrightarrow> P_0x19670_false_2_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x1968c \<longrightarrow> P_0x1968c_3_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x19696 \<longrightarrow> P_0x19696_4_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x1969b \<longrightarrow> P_0x1969b_5_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x1969d \<longrightarrow> P_0x1969d_true_6_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x1968a \<longrightarrow> P_0x1968a_true_7_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x1968a \<longrightarrow> P_0x1968a_false_8_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x1969d \<longrightarrow> P_0x1969d_false_9_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x1969f \<longrightarrow> P_0x1969f_10_regions \<sigma>\<close>
    and [blocks]: \<open>{{Q_strcmp_addr_0x19696_4}} \<box>strcmp_acode {{P_0x1969b_5;M_0x19696}}\<close>
  shows \<open>{{?P}} bdrv_find_acode {{?Q;?M}}\<close>
  apply (vcg acode: bdrv_find_acode_def assms: assms)
        apply (vcg_while \<open>P_0x1968c_3 || P_0x1969f_10\<close> assms: assms)
  done

end

end
