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
theory bdrv_delete
  imports "../../../isabelle/VCG/HTriple"
begin

locale "qemu_img_xen" = execution_context + exec_code +
  fixes free_0x5960_retval\<^sub>v bdrv_close_0x18188_retval\<^sub>v bdrv_close_addr free_addr :: \<open>64 word\<close>
    and bdrv_close_acode free_acode :: ACode
  assumes fetch:
    "fetch 0x5960 \<equiv> (Unary (IS_8088 Call) (Immediate SixtyFour (ImmLabel ''free'')), 1)"
    "fetch 0x5961 \<equiv> (Nullary (IS_8088 Ret), 4)"
    "fetch 0x18130 \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour rax)) (Storage (Memory SixtyFour (A_SizeDirective 64 (A_Plus (A_FromReg (General SixtyFour rip)) (A_WordConstant 74593))))), 7)"
    "fetch 0x18137 \<equiv> (Unary (IS_8088 Push) (Storage (Reg (General SixtyFour rbx))), 1)"
    "fetch 0x18138 \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour rbx)) (Storage (Reg (General SixtyFour rdi))), 3)"
    "fetch 0x1813b \<equiv> (Binary (IS_8088 Cmp) (Reg (General SixtyFour rax)) (Storage (Reg (General SixtyFour rdi))), 3)"
    "fetch 0x1813e \<equiv> (Unary (IS_8088 Je) (Immediate SixtyFour (ImmVal 98710)), 2)"
    "fetch 0x18140 \<equiv> (Binary (IS_8088 Test) (Reg (General SixtyFour rax)) (Storage (Reg (General SixtyFour rax))), 3)"
    "fetch 0x18143 \<equiv> (Unary (IS_8088 Jne) (Immediate SixtyFour (ImmVal 98645)), 2)"
    "fetch 0x18145 \<equiv> (Unary (IS_8088 Jmp) (Immediate SixtyFour (ImmVal 98676)), 2)"
    "fetch 0x18147 \<equiv> (Unary (IS_8088 Nop) (Storage (Memory Sixteen (A_SizeDirective 16 (A_Plus (A_FromReg (General SixtyFour rax)) (A_Plus (A_Mult 1 (A_FromReg (General SixtyFour rax))) (A_WordConstant 0)))))), 9)"
    "fetch 0x18150 \<equiv> (Binary (IS_8088 Test) (Reg (General SixtyFour rax)) (Storage (Reg (General SixtyFour rax))), 3)"
    "fetch 0x18153 \<equiv> (Unary (IS_8088 Je) (Immediate SixtyFour (ImmVal 98688)), 2)"
    "fetch 0x18155 \<equiv> (Binary (IS_8088 Lea) (Reg (General SixtyFour rdx)) (Storage (Memory SixtyFour (A_Plus (A_FromReg (General SixtyFour rax)) (A_WordConstant 2232)))), 7)"
    "fetch 0x1815c \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour rax)) (Storage (Memory SixtyFour (A_SizeDirective 64 (A_Plus (A_FromReg (General SixtyFour rax)) (A_WordConstant 2232))))), 7)"
    "fetch 0x18163 \<equiv> (Binary (IS_8088 Cmp) (Reg (General SixtyFour rbx)) (Storage (Reg (General SixtyFour rax))), 3)"
    "fetch 0x18166 \<equiv> (Unary (IS_8088 Jne) (Immediate SixtyFour (ImmVal 98640)), 2)"
    "fetch 0x18168 \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour rax)) (Storage (Memory SixtyFour (A_SizeDirective 64 (A_Plus (A_FromReg (General SixtyFour rbx)) (A_WordConstant 2232))))), 7)"
    "fetch 0x1816f \<equiv> (Binary (IS_8088 Mov) (Memory SixtyFour (A_SizeDirective 64 (A_FromReg (General SixtyFour rdx)))) (Storage (Reg (General SixtyFour rax))), 3)"
    "fetch 0x18172 \<equiv> (Unary (IS_8088 Jmp) (Immediate SixtyFour (ImmVal 98693)), 2)"
    "fetch 0x18174 \<equiv> (Binary (IS_8088 Lea) (Reg (General SixtyFour rdx)) (Storage (Memory SixtyFour (A_Plus (A_FromReg (General SixtyFour rip)) (A_WordConstant 74525)))), 7)"
    "fetch 0x1817b \<equiv> (Unary (IS_8088 Nop) (Storage (Memory ThirtyTwo (A_SizeDirective 32 (A_Plus (A_FromReg (General SixtyFour rax)) (A_Plus (A_Mult 1 (A_FromReg (General SixtyFour rax))) (A_WordConstant 0)))))), 5)"
    "fetch 0x18180 \<equiv> (Binary (IS_8088 Test) (Reg (General SixtyFour rbx)) (Storage (Reg (General SixtyFour rbx))), 3)"
    "fetch 0x18183 \<equiv> (Unary (IS_8088 Je) (Immediate SixtyFour (ImmVal 98664)), 2)"
    "fetch 0x18185 \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour rdi)) (Storage (Reg (General SixtyFour rbx))), 3)"
    "fetch 0x18188 \<equiv> (Unary (IS_8088 Call) (Immediate SixtyFour (ImmLabel ''bdrv_close'')), 5)"
    "fetch 0x1818d \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour rdi)) (Storage (Reg (General SixtyFour rbx))), 3)"
    "fetch 0x18190 \<equiv> (Unary (IS_8088 Pop) (Storage (Reg (General SixtyFour rbx))), 1)"
    "fetch 0x18191 \<equiv> (Unary (IS_8088 Jmp) (Immediate SixtyFour (ImmVal 22880)), 5)"
    "fetch 0x18196 \<equiv> (Binary (IS_8088 Lea) (Reg (General SixtyFour rdx)) (Storage (Memory SixtyFour (A_Plus (A_FromReg (General SixtyFour rip)) (A_WordConstant 74491)))), 7)"
    "fetch 0x1819d \<equiv> (Unary (IS_8088 Jmp) (Immediate SixtyFour (ImmVal 98664)), 2)"
    and \<alpha>_def: \<open>\<alpha> = \<lparr>text_sections = [], data_sections = [], labels_to_offsets = [], binary_offset = 0\<rparr>\<close>
    and bdrv_close\<^sub>a\<^sub>d\<^sub>d\<^sub>r[simp]: \<open>the (label_to_address \<alpha> ''bdrv_close'') = bdrv_close_addr\<close>
    and free\<^sub>a\<^sub>d\<^sub>d\<^sub>r[simp]: \<open>the (label_to_address \<alpha> ''free'') = free_addr\<close>
begin

text \<open>Using definitions that don't get unfolded immediately prevents locale argument issues.\<close>
definition \<open>free_0x5960_retval \<equiv> free_0x5960_retval\<^sub>v\<close>
definition \<open>bdrv_close_0x18188_retval \<equiv> bdrv_close_0x18188_retval\<^sub>v\<close>

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

locale "qemu_free" = "qemu_img_xen" +
  fixes RAX\<^sub>0\<^sub>v RSP\<^sub>0\<^sub>v ret_address\<^sub>v :: \<open>64 word\<close>
begin

text \<open>Using definitions that don't get unfolded immediately prevents locale argument issues.\<close>
definition \<open>RAX\<^sub>0 \<equiv> RAX\<^sub>0\<^sub>v\<close>
definition \<open>RSP\<^sub>0 \<equiv> RSP\<^sub>0\<^sub>v\<close>
definition \<open>ret_address \<equiv> ret_address\<^sub>v\<close>

definition P_0x5960_0 :: state_pred where
  \<open>P_0x5960_0 \<sigma> \<equiv> RIP \<sigma> = 0x5960 \<and> RAX \<sigma> = RAX\<^sub>0 \<and> RSP \<sigma> = RSP\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address\<close>
declare P_0x5960_0_def[Ps]

definition P_0x5960_0_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x5960_0_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((RSP\<^sub>0::64 word) - 0x8), 8)
  }\<close>

definition P_0x5960_0_regions :: state_pred where
  \<open>P_0x5960_0_regions \<sigma> \<equiv> \<exists>regions. P_0x5960_0_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_free_addr_0x5960_0 :: state_pred where
  \<open>Q_free_addr_0x5960_0 \<sigma> \<equiv> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x8) \<and> RIP \<sigma> = free_addr \<and> RAX \<sigma> = RAX\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = 0x5961\<close>
declare Q_free_addr_0x5960_0_def[Qs]

schematic_goal qemu_free_0_1_0x5960_0x5960_0[blocks]:
  assumes \<open>(P_0x5960_0 && P_0x5960_0_regions) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x5960 0 \<sigma> \<triangleq> ?\<sigma> \<and> Q_free_addr_0x5960_0 ?\<sigma> \<and> block_usage P_0x5960_0_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x5960_0_def P_0x5960_0_regions_def post: Q_free_addr_0x5960_0_def regionset: P_0x5960_0_regions_set_def)

definition P_0x5961_1 :: state_pred where
  \<open>P_0x5961_1 \<sigma> \<equiv> RIP \<sigma> = 0x5961 \<and> RAX \<sigma> = free_0x5960_retval \<and> RSP \<sigma> = RSP\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = 0x5961\<close>
declare P_0x5961_1_def[Ps]

definition P_0x5961_1_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x5961_1_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((RSP\<^sub>0::64 word) - 0x8), 8)
  }\<close>

definition P_0x5961_1_regions :: state_pred where
  \<open>P_0x5961_1_regions \<sigma> \<equiv> \<exists>regions. P_0x5961_1_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_ret_address_1 :: state_pred where
  \<open>Q_ret_address_1 \<sigma> \<equiv> RIP \<sigma> = ret_address \<and> RAX \<sigma> = free_0x5960_retval \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) + 0x8) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = 0x5961\<close>
declare Q_ret_address_1_def[Qs]

schematic_goal qemu_free_0_1_0x5961_0x5961_1[blocks]:
  assumes \<open>(P_0x5961_1 && P_0x5961_1_regions) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x5961 (Suc 0) \<sigma> \<triangleq> ?\<sigma> \<and> Q_ret_address_1 ?\<sigma> \<and> block_usage P_0x5961_1_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x5961_1_def P_0x5961_1_regions_def post: Q_ret_address_1_def regionset: P_0x5961_1_regions_set_def)

definition qemu_free_acode :: ACode where
  \<open>qemu_free_acode =
    Block (Suc 0) 0x5960 0;
    CALL free_acode;
    Block (Suc 0) 0x5961 (Suc 0)
  \<close>

schematic_goal "qemu_free":
  assumes
    \<open>\<forall>\<sigma>. RIP \<sigma> = 0x5961 \<longrightarrow> P_0x5961_1_regions \<sigma>\<close>
    and [blocks]: \<open>{{Q_free_addr_0x5960_0}} \<box>free_acode {{P_0x5961_1;M_0x5960}}\<close>
  shows \<open>{{?P}} qemu_free_acode {{?Q;?M}}\<close>
  by (vcg acode: qemu_free_acode_def assms: assms)

end

locale "bdrv_delete" = "qemu_img_xen" +
  fixes RAX\<^sub>0\<^sub>v RBX\<^sub>0\<^sub>v RDX\<^sub>0\<^sub>v RDI\<^sub>0\<^sub>v RSP\<^sub>0\<^sub>v ret_address\<^sub>v :: \<open>64 word\<close>
begin

text \<open>Using definitions that don't get unfolded immediately prevents locale argument issues.\<close>
definition \<open>RAX\<^sub>0 \<equiv> RAX\<^sub>0\<^sub>v\<close>
definition \<open>RBX\<^sub>0 \<equiv> RBX\<^sub>0\<^sub>v\<close>
definition \<open>RDX\<^sub>0 \<equiv> RDX\<^sub>0\<^sub>v\<close>
definition \<open>RDI\<^sub>0 \<equiv> RDI\<^sub>0\<^sub>v\<close>
definition \<open>RSP\<^sub>0 \<equiv> RSP\<^sub>0\<^sub>v\<close>
definition \<open>ret_address \<equiv> ret_address\<^sub>v\<close>

definition P_0x18130_0 :: state_pred where
  \<open>P_0x18130_0 \<sigma> \<equiv> RIP \<sigma> = 0x18130 \<and> RAX \<sigma> = RAX\<^sub>0 \<and> RBX \<sigma> = RBX\<^sub>0 \<and> RDX \<sigma> = RDX\<^sub>0 \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSP \<sigma> = RSP\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address\<close>
declare P_0x18130_0_def[Ps]

definition P_0x18130_0_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x18130_0_regions_set \<sigma> \<equiv> {
    (0, 0x2a498, 8),
    (1, RSP\<^sub>0, 8),
    (2, ((RSP\<^sub>0::64 word) - 0x8), 8)
  }\<close>

definition P_0x18130_0_regions :: state_pred where
  \<open>P_0x18130_0_regions \<sigma> \<equiv> \<exists>regions. P_0x18130_0_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x1813e_0 :: state_pred where
  \<open>Q_0x1813e_0 \<sigma> \<equiv> RIP \<sigma> = 0x1813e \<and> RAX \<sigma> = (\<sigma> \<turnstile> *[0x2a498,8]::64 word) \<and> RBX \<sigma> = RDI\<^sub>0 \<and> RDX \<sigma> = RDX\<^sub>0 \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x8) \<and> (\<sigma> \<turnstile> *[0x2a498,8]::64 word) = (\<sigma> \<turnstile> *[0x2a498,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = RBX\<^sub>0\<close>
declare Q_0x1813e_0_def[Qs]

schematic_goal bdrv_delete_0_4_0x18130_0x1813b_0[blocks]:
  assumes \<open>(P_0x18130_0 && P_0x18130_0_regions) \<sigma>\<close>
  shows \<open>exec_block 4 0x1813b 0 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x1813e_0 ?\<sigma> \<and> block_usage P_0x18130_0_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x18130_0_def P_0x18130_0_regions_def post: Q_0x1813e_0_def regionset: P_0x18130_0_regions_set_def)

definition P_0x1813e_true_1 :: state_pred where
  \<open>P_0x1813e_true_1 \<sigma> \<equiv> RIP \<sigma> = 0x1813e \<and> RAX \<sigma> = (\<sigma> \<turnstile> *[0x2a498,8]::64 word) \<and> RBX \<sigma> = RDI\<^sub>0 \<and> RDX \<sigma> = RDX\<^sub>0 \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x8) \<and> (\<sigma> \<turnstile> *[0x2a498,8]::64 word) = (\<sigma> \<turnstile> *[0x2a498,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = RBX\<^sub>0\<close>
declare P_0x1813e_true_1_def[Ps]

definition P_0x1813e_true_1_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x1813e_true_1_regions_set \<sigma> \<equiv> {
    (0, 0x2a498, 8),
    (1, RSP\<^sub>0, 8),
    (2, ((RSP\<^sub>0::64 word) - 0x8), 8)
  }\<close>

definition P_0x1813e_true_1_regions :: state_pred where
  \<open>P_0x1813e_true_1_regions \<sigma> \<equiv> \<exists>regions. P_0x1813e_true_1_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x18168_1 :: state_pred where
  \<open>Q_0x18168_1 \<sigma> \<equiv> RIP \<sigma> = 0x18168 \<and> RAX \<sigma> = (\<sigma> \<turnstile> *[0x2a498,8]::64 word) \<and> RBX \<sigma> = RDI\<^sub>0 \<and> RDX \<sigma> = 0x2a498 \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x8) \<and> (\<sigma> \<turnstile> *[0x2a498,8]::64 word) = (\<sigma> \<turnstile> *[0x2a498,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = RBX\<^sub>0\<close>
declare Q_0x18168_1_def[Qs]

schematic_goal bdrv_delete_0_3_0x1813e_0x1819d_1[blocks]:
  assumes \<open>(P_0x1813e_true_1 && P_0x1813e_true_1_regions && ZF) \<sigma>\<close>
  shows \<open>exec_block 3 0x1819d (Suc 0) \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x18168_1 ?\<sigma> \<and> block_usage P_0x1813e_true_1_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x1813e_true_1_def P_0x1813e_true_1_regions_def post: Q_0x18168_1_def regionset: P_0x1813e_true_1_regions_set_def)

definition P_0x18168_2 :: state_pred where
  \<open>P_0x18168_2 \<sigma> \<equiv> RIP \<sigma> = 0x18168 \<and> RAX \<sigma> = (\<sigma> \<turnstile> *[0x2a498,8]::64 word) \<and> RBX \<sigma> = RDI\<^sub>0 \<and> RDX \<sigma> = 0x2a498 \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x8) \<and> (\<sigma> \<turnstile> *[0x2a498,8]::64 word) = (\<sigma> \<turnstile> *[0x2a498,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = RBX\<^sub>0\<close>
declare P_0x18168_2_def[Ps]

definition P_0x18168_2_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x18168_2_regions_set \<sigma> \<equiv> {
    (0, 0x2a498, 8),
    (1, RSP\<^sub>0, 8),
    (2, ((RDI\<^sub>0::64 word) + 0x8b8), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x8), 8)
  }\<close>

definition P_0x18168_2_regions :: state_pred where
  \<open>P_0x18168_2_regions \<sigma> \<equiv> \<exists>regions. P_0x18168_2_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x18185_2 :: state_pred where
  \<open>Q_0x18185_2 \<sigma> \<equiv> RIP \<sigma> = 0x18185 \<and> RBX \<sigma> = RDI\<^sub>0 \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x8) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = RBX\<^sub>0\<close>
declare Q_0x18185_2_def[Qs]

schematic_goal bdrv_delete_0_3_0x18168_0x18172_2[blocks]:
  assumes \<open>(P_0x18168_2 && P_0x18168_2_regions) \<sigma>\<close>
  shows \<open>exec_block 3 0x18172 2 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x18185_2 ?\<sigma> \<and> block_usage P_0x18168_2_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x18168_2_def P_0x18168_2_regions_def post: Q_0x18185_2_def regionset: P_0x18168_2_regions_set_def)

definition P_0x1813e_false_3 :: state_pred where
  \<open>P_0x1813e_false_3 \<sigma> \<equiv> RIP \<sigma> = 0x1813e \<and> RAX \<sigma> = (\<sigma> \<turnstile> *[0x2a498,8]::64 word) \<and> RBX \<sigma> = RDI\<^sub>0 \<and> RDX \<sigma> = RDX\<^sub>0 \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x8) \<and> (\<sigma> \<turnstile> *[0x2a498,8]::64 word) = (\<sigma> \<turnstile> *[0x2a498,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = RBX\<^sub>0\<close>
declare P_0x1813e_false_3_def[Ps]

definition P_0x1813e_false_3_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x1813e_false_3_regions_set \<sigma> \<equiv> {
    (0, 0x2a498, 8),
    (1, RSP\<^sub>0, 8),
    (2, ((RSP\<^sub>0::64 word) - 0x8), 8)
  }\<close>

definition P_0x1813e_false_3_regions :: state_pred where
  \<open>P_0x1813e_false_3_regions \<sigma> \<equiv> \<exists>regions. P_0x1813e_false_3_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x18143_3 :: state_pred where
  \<open>Q_0x18143_3 \<sigma> \<equiv> RIP \<sigma> = 0x18143 \<and> RAX \<sigma> = (\<sigma> \<turnstile> *[0x2a498,8]::64 word) \<and> RBX \<sigma> = RDI\<^sub>0 \<and> RDX \<sigma> = RDX\<^sub>0 \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x8) \<and> (\<sigma> \<turnstile> *[0x2a498,8]::64 word) = (\<sigma> \<turnstile> *[0x2a498,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = RBX\<^sub>0\<close>
declare Q_0x18143_3_def[Qs]

schematic_goal bdrv_delete_0_2_0x1813e_0x18140_3[blocks]:
  assumes \<open>(P_0x1813e_false_3 && P_0x1813e_false_3_regions && ! ZF) \<sigma>\<close>
  shows \<open>exec_block 2 0x18140 3 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x18143_3 ?\<sigma> \<and> block_usage P_0x1813e_false_3_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x1813e_false_3_def P_0x1813e_false_3_regions_def post: Q_0x18143_3_def regionset: P_0x1813e_false_3_regions_set_def)

definition P_0x18143_true_4 :: state_pred where
  \<open>P_0x18143_true_4 \<sigma> \<equiv> RIP \<sigma> = 0x18143 \<and> RAX \<sigma> = (\<sigma> \<turnstile> *[0x2a498,8]::64 word) \<and> RBX \<sigma> = RDI\<^sub>0 \<and> RDX \<sigma> = RDX\<^sub>0 \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x8) \<and> (\<sigma> \<turnstile> *[0x2a498,8]::64 word) = (\<sigma> \<turnstile> *[0x2a498,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = RBX\<^sub>0\<close>
declare P_0x18143_true_4_def[Ps]

definition P_0x18143_true_4_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x18143_true_4_regions_set \<sigma> \<equiv> {
    (0, 0x2a498, 8),
    (1, RSP\<^sub>0, 8),
    (2, ((RSP\<^sub>0::64 word) - 0x8), 8)
  }\<close>

definition P_0x18143_true_4_regions :: state_pred where
  \<open>P_0x18143_true_4_regions \<sigma> \<equiv> \<exists>regions. P_0x18143_true_4_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x18155_4 :: state_pred where
  \<open>Q_0x18155_4 \<sigma> \<equiv> RIP \<sigma> = 0x18155 \<and> RBX \<sigma> = RDI\<^sub>0 \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x8) \<and> (\<sigma> \<turnstile> *[0x2a498,8]::64 word) = (\<sigma> \<turnstile> *[0x2a498,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = RBX\<^sub>0\<close>
declare Q_0x18155_4_def[Qs]

schematic_goal bdrv_delete_0_1_0x18143_0x18143_4[blocks]:
  assumes \<open>(P_0x18143_true_4 && P_0x18143_true_4_regions && !ZF) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x18143 4 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x18155_4 ?\<sigma> \<and> block_usage P_0x18143_true_4_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x18143_true_4_def P_0x18143_true_4_regions_def post: Q_0x18155_4_def regionset: P_0x18143_true_4_regions_set_def)

definition P_0x18155_5 :: state_pred where
  \<open>P_0x18155_5 \<sigma> \<equiv> RIP \<sigma> = 0x18155 \<and> RBX \<sigma> = RDI\<^sub>0 \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x8) \<and> (\<sigma> \<turnstile> *[0x2a498,8]::64 word) = (\<sigma> \<turnstile> *[0x2a498,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = RBX\<^sub>0\<close>
declare P_0x18155_5_def[Ps]

definition P_0x18155_5_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x18155_5_regions_set \<sigma> \<equiv> {
    (0, 0x2a498, 8),
    (1, RSP\<^sub>0, 8),
    (2, ((RAX \<sigma>::64 word) + 0x8b8), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x8), 8)
  }\<close>

definition P_0x18155_5_regions :: state_pred where
  \<open>P_0x18155_5_regions \<sigma> \<equiv> \<exists>regions. P_0x18155_5_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x18166_5 :: state_pred where
  \<open>Q_0x18166_5 \<sigma> \<equiv> RIP \<sigma> = 0x18166 \<and> RBX \<sigma> = RDI\<^sub>0 \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x8) \<and> (\<sigma> \<turnstile> *[0x2a498,8]::64 word) = (\<sigma> \<turnstile> *[0x2a498,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = RBX\<^sub>0\<close>
declare Q_0x18166_5_def[Qs]

schematic_goal bdrv_delete_0_3_0x18155_0x18163_5[blocks]:
  assumes \<open>(P_0x18155_5 && P_0x18155_5_regions) \<sigma>\<close>
  shows \<open>exec_block 3 0x18163 5 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x18166_5 ?\<sigma> \<and> block_usage P_0x18155_5_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x18155_5_def P_0x18155_5_regions_def post: Q_0x18166_5_def regionset: P_0x18155_5_regions_set_def)

definition P_0x18166_true_6 :: state_pred where
  \<open>P_0x18166_true_6 \<sigma> \<equiv> RIP \<sigma> = 0x18166 \<and> RBX \<sigma> = RDI\<^sub>0 \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x8) \<and> (\<sigma> \<turnstile> *[0x2a498,8]::64 word) = (\<sigma> \<turnstile> *[0x2a498,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = RBX\<^sub>0\<close>
declare P_0x18166_true_6_def[Ps]

definition P_0x18166_true_6_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x18166_true_6_regions_set \<sigma> \<equiv> {
    (0, 0x2a498, 8),
    (1, RSP\<^sub>0, 8),
    (2, ((RSP\<^sub>0::64 word) - 0x8), 8)
  }\<close>

definition P_0x18166_true_6_regions :: state_pred where
  \<open>P_0x18166_true_6_regions \<sigma> \<equiv> \<exists>regions. P_0x18166_true_6_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x18153_6 :: state_pred where
  \<open>Q_0x18153_6 \<sigma> \<equiv> RIP \<sigma> = 0x18153 \<and> RBX \<sigma> = RDI\<^sub>0 \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x8) \<and> (\<sigma> \<turnstile> *[0x2a498,8]::64 word) = (\<sigma> \<turnstile> *[0x2a498,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = RBX\<^sub>0\<close>
declare Q_0x18153_6_def[Qs]

schematic_goal bdrv_delete_0_2_0x18166_0x18150_6[blocks]:
  assumes \<open>(P_0x18166_true_6 && P_0x18166_true_6_regions && !ZF) \<sigma>\<close>
  shows \<open>exec_block 2 0x18150 6 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x18153_6 ?\<sigma> \<and> block_usage P_0x18166_true_6_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x18166_true_6_def P_0x18166_true_6_regions_def post: Q_0x18153_6_def regionset: P_0x18166_true_6_regions_set_def)

definition P_0x18153_true_7 :: state_pred where
  \<open>P_0x18153_true_7 \<sigma> \<equiv> RIP \<sigma> = 0x18153 \<and> RBX \<sigma> = RDI\<^sub>0 \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x8) \<and> (\<sigma> \<turnstile> *[0x2a498,8]::64 word) = (\<sigma> \<turnstile> *[0x2a498,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = RBX\<^sub>0\<close>
declare P_0x18153_true_7_def[Ps]

definition P_0x18153_true_7_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x18153_true_7_regions_set \<sigma> \<equiv> {
    (0, 0x2a498, 8),
    (1, RSP\<^sub>0, 8),
    (2, ((RSP\<^sub>0::64 word) - 0x8), 8)
  }\<close>

definition P_0x18153_true_7_regions :: state_pred where
  \<open>P_0x18153_true_7_regions \<sigma> \<equiv> \<exists>regions. P_0x18153_true_7_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x18180_7 :: state_pred where
  \<open>Q_0x18180_7 \<sigma> \<equiv> RIP \<sigma> = 0x18180 \<and> RBX \<sigma> = RDI\<^sub>0 \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x8) \<and> (\<sigma> \<turnstile> *[0x2a498,8]::64 word) = (\<sigma> \<turnstile> *[0x2a498,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = RBX\<^sub>0\<close>
declare Q_0x18180_7_def[Qs]

schematic_goal bdrv_delete_0_1_0x18153_0x18153_7[blocks]:
  assumes \<open>(P_0x18153_true_7 && P_0x18153_true_7_regions && ZF) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x18153 7 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x18180_7 ?\<sigma> \<and> block_usage P_0x18153_true_7_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x18153_true_7_def P_0x18153_true_7_regions_def post: Q_0x18180_7_def regionset: P_0x18153_true_7_regions_set_def)

definition P_0x18153_false_8 :: state_pred where
  \<open>P_0x18153_false_8 \<sigma> \<equiv> RIP \<sigma> = 0x18153 \<and> RBX \<sigma> = RDI\<^sub>0 \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x8) \<and> (\<sigma> \<turnstile> *[0x2a498,8]::64 word) = (\<sigma> \<turnstile> *[0x2a498,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = RBX\<^sub>0\<close>
declare P_0x18153_false_8_def[Ps]

definition P_0x18153_false_8_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x18153_false_8_regions_set \<sigma> \<equiv> {
    (0, 0x2a498, 8),
    (1, RSP\<^sub>0, 8),
    (2, ((RSP\<^sub>0::64 word) - 0x8), 8)
  }\<close>

definition P_0x18153_false_8_regions :: state_pred where
  \<open>P_0x18153_false_8_regions \<sigma> \<equiv> \<exists>regions. P_0x18153_false_8_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x18155_8 :: state_pred where
  \<open>Q_0x18155_8 \<sigma> \<equiv> RIP \<sigma> = 0x18155 \<and> RBX \<sigma> = RDI\<^sub>0 \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x8) \<and> (\<sigma> \<turnstile> *[0x2a498,8]::64 word) = (\<sigma> \<turnstile> *[0x2a498,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = RBX\<^sub>0\<close>
declare Q_0x18155_8_def[Qs]

schematic_goal bdrv_delete_0_1_0x18153_0x18153_8[blocks]:
  assumes \<open>(P_0x18153_false_8 && P_0x18153_false_8_regions && ! ZF) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x18153 8 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x18155_8 ?\<sigma> \<and> block_usage P_0x18153_false_8_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x18153_false_8_def P_0x18153_false_8_regions_def post: Q_0x18155_8_def regionset: P_0x18153_false_8_regions_set_def)

definition P_0x18166_false_9 :: state_pred where
  \<open>P_0x18166_false_9 \<sigma> \<equiv> RIP \<sigma> = 0x18166 \<and> RBX \<sigma> = RDI\<^sub>0 \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x8) \<and> (\<sigma> \<turnstile> *[0x2a498,8]::64 word) = (\<sigma> \<turnstile> *[0x2a498,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = RBX\<^sub>0\<close>
declare P_0x18166_false_9_def[Ps]

definition P_0x18166_false_9_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x18166_false_9_regions_set \<sigma> \<equiv> {
    (0, 0x2a498, 8),
    (1, RSP\<^sub>0, 8),
    (2, ((RSP\<^sub>0::64 word) - 0x8), 8)
  }\<close>

definition P_0x18166_false_9_regions :: state_pred where
  \<open>P_0x18166_false_9_regions \<sigma> \<equiv> \<exists>regions. P_0x18166_false_9_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x18168_9 :: state_pred where
  \<open>Q_0x18168_9 \<sigma> \<equiv> RIP \<sigma> = 0x18168 \<and> RBX \<sigma> = RDI\<^sub>0 \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x8) \<and> (\<sigma> \<turnstile> *[0x2a498,8]::64 word) = (\<sigma> \<turnstile> *[0x2a498,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = RBX\<^sub>0\<close>
declare Q_0x18168_9_def[Qs]

schematic_goal bdrv_delete_0_1_0x18166_0x18166_9[blocks]:
  assumes \<open>(P_0x18166_false_9 && P_0x18166_false_9_regions && ! !ZF) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x18166 9 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x18168_9 ?\<sigma> \<and> block_usage P_0x18166_false_9_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x18166_false_9_def P_0x18166_false_9_regions_def post: Q_0x18168_9_def regionset: P_0x18166_false_9_regions_set_def)

definition P_0x18180_10 :: state_pred where
  \<open>P_0x18180_10 \<sigma> \<equiv> RIP \<sigma> = 0x18180 \<and> RBX \<sigma> = RDI\<^sub>0 \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x8) \<and> (\<sigma> \<turnstile> *[0x2a498,8]::64 word) = (\<sigma> \<turnstile> *[0x2a498,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = RBX\<^sub>0\<close>
declare P_0x18180_10_def[Ps]

definition P_0x18180_10_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x18180_10_regions_set \<sigma> \<equiv> {
    (0, 0x2a498, 8),
    (1, RSP\<^sub>0, 8),
    (2, ((RSP\<^sub>0::64 word) - 0x8), 8)
  }\<close>

definition P_0x18180_10_regions :: state_pred where
  \<open>P_0x18180_10_regions \<sigma> \<equiv> \<exists>regions. P_0x18180_10_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x18183_10 :: state_pred where
  \<open>Q_0x18183_10 \<sigma> \<equiv> RIP \<sigma> = 0x18183 \<and> RBX \<sigma> = RDI\<^sub>0 \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x8) \<and> (\<sigma> \<turnstile> *[0x2a498,8]::64 word) = (\<sigma> \<turnstile> *[0x2a498,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = RBX\<^sub>0\<close>
declare Q_0x18183_10_def[Qs]

schematic_goal bdrv_delete_0_1_0x18180_0x18180_10[blocks]:
  assumes \<open>(P_0x18180_10 && P_0x18180_10_regions) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x18180 10 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x18183_10 ?\<sigma> \<and> block_usage P_0x18180_10_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x18180_10_def P_0x18180_10_regions_def post: Q_0x18183_10_def regionset: P_0x18180_10_regions_set_def)

definition P_0x18183_true_11 :: state_pred where
  \<open>P_0x18183_true_11 \<sigma> \<equiv> RIP \<sigma> = 0x18183 \<and> RBX \<sigma> = RDI\<^sub>0 \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x8) \<and> (\<sigma> \<turnstile> *[0x2a498,8]::64 word) = (\<sigma> \<turnstile> *[0x2a498,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = RBX\<^sub>0\<close>
declare P_0x18183_true_11_def[Ps]

definition P_0x18183_true_11_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x18183_true_11_regions_set \<sigma> \<equiv> {
    (0, RDX \<sigma>, 8),
    (1, 0x2a498, 8),
    (2, RSP\<^sub>0, 8),
    (3, ((RDI\<^sub>0::64 word) + 0x8b8), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x8), 8)
  }\<close>

definition P_0x18183_true_11_regions :: state_pred where
  \<open>P_0x18183_true_11_regions \<sigma> \<equiv> \<exists>regions. P_0x18183_true_11_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x18185_11 :: state_pred where
  \<open>Q_0x18185_11 \<sigma> \<equiv> RIP \<sigma> = 0x18185 \<and> RBX \<sigma> = RDI\<^sub>0 \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x8) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = RBX\<^sub>0\<close>
declare Q_0x18185_11_def[Qs]

schematic_goal bdrv_delete_0_4_0x18183_0x18172_11[blocks]:
  assumes \<open>(P_0x18183_true_11 && P_0x18183_true_11_regions && ZF) \<sigma>\<close>
  shows \<open>exec_block 4 0x18172 11 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x18185_11 ?\<sigma> \<and> block_usage P_0x18183_true_11_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x18183_true_11_def P_0x18183_true_11_regions_def post: Q_0x18185_11_def regionset: P_0x18183_true_11_regions_set_def)

definition P_0x18183_false_12 :: state_pred where
  \<open>P_0x18183_false_12 \<sigma> \<equiv> RIP \<sigma> = 0x18183 \<and> RBX \<sigma> = RDI\<^sub>0 \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x8) \<and> (\<sigma> \<turnstile> *[0x2a498,8]::64 word) = (\<sigma> \<turnstile> *[0x2a498,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = RBX\<^sub>0\<close>
declare P_0x18183_false_12_def[Ps]

definition P_0x18183_false_12_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x18183_false_12_regions_set \<sigma> \<equiv> {
    (0, 0x2a498, 8),
    (1, RSP\<^sub>0, 8),
    (2, ((RSP\<^sub>0::64 word) - 0x8), 8)
  }\<close>

definition P_0x18183_false_12_regions :: state_pred where
  \<open>P_0x18183_false_12_regions \<sigma> \<equiv> \<exists>regions. P_0x18183_false_12_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x18185_12 :: state_pred where
  \<open>Q_0x18185_12 \<sigma> \<equiv> RIP \<sigma> = 0x18185 \<and> RBX \<sigma> = RDI\<^sub>0 \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x8) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = RBX\<^sub>0\<close>
declare Q_0x18185_12_def[Qs]

schematic_goal bdrv_delete_0_1_0x18183_0x18183_12[blocks]:
  assumes \<open>(P_0x18183_false_12 && P_0x18183_false_12_regions && ! ZF) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x18183 12 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x18185_12 ?\<sigma> \<and> block_usage P_0x18183_false_12_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x18183_false_12_def P_0x18183_false_12_regions_def post: Q_0x18185_12_def regionset: P_0x18183_false_12_regions_set_def)

definition P_0x18168_13 :: state_pred where
  \<open>P_0x18168_13 \<sigma> \<equiv> RIP \<sigma> = 0x18168 \<and> RBX \<sigma> = RDI\<^sub>0 \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x8) \<and> (\<sigma> \<turnstile> *[0x2a498,8]::64 word) = (\<sigma> \<turnstile> *[0x2a498,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = RBX\<^sub>0\<close>
declare P_0x18168_13_def[Ps]

definition P_0x18168_13_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x18168_13_regions_set \<sigma> \<equiv> {
    (0, RDX \<sigma>, 8),
    (1, 0x2a498, 8),
    (2, RSP\<^sub>0, 8),
    (3, ((RDI\<^sub>0::64 word) + 0x8b8), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x8), 8)
  }\<close>

definition P_0x18168_13_regions :: state_pred where
  \<open>P_0x18168_13_regions \<sigma> \<equiv> \<exists>regions. P_0x18168_13_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x18185_13 :: state_pred where
  \<open>Q_0x18185_13 \<sigma> \<equiv> RIP \<sigma> = 0x18185 \<and> RBX \<sigma> = RDI\<^sub>0 \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x8) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = RBX\<^sub>0\<close>
declare Q_0x18185_13_def[Qs]

schematic_goal bdrv_delete_0_3_0x18168_0x18172_13[blocks]:
  assumes \<open>(P_0x18168_13 && P_0x18168_13_regions) \<sigma>\<close>
  shows \<open>exec_block 3 0x18172 13 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x18185_13 ?\<sigma> \<and> block_usage P_0x18168_13_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x18168_13_def P_0x18168_13_regions_def post: Q_0x18185_13_def regionset: P_0x18168_13_regions_set_def)

definition P_0x18143_false_14 :: state_pred where
  \<open>P_0x18143_false_14 \<sigma> \<equiv> RIP \<sigma> = 0x18143 \<and> RAX \<sigma> = (\<sigma> \<turnstile> *[0x2a498,8]::64 word) \<and> RBX \<sigma> = RDI\<^sub>0 \<and> RDX \<sigma> = RDX\<^sub>0 \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x8) \<and> (\<sigma> \<turnstile> *[0x2a498,8]::64 word) = (\<sigma> \<turnstile> *[0x2a498,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = RBX\<^sub>0\<close>
declare P_0x18143_false_14_def[Ps]

definition P_0x18143_false_14_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x18143_false_14_regions_set \<sigma> \<equiv> {
    (0, 0x2a498, 8),
    (1, RSP\<^sub>0, 8),
    (2, ((RSP\<^sub>0::64 word) - 0x8), 8)
  }\<close>

definition P_0x18143_false_14_regions :: state_pred where
  \<open>P_0x18143_false_14_regions \<sigma> \<equiv> \<exists>regions. P_0x18143_false_14_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x18180_14 :: state_pred where
  \<open>Q_0x18180_14 \<sigma> \<equiv> RIP \<sigma> = 0x18180 \<and> RAX \<sigma> = (\<sigma> \<turnstile> *[0x2a498,8]::64 word) \<and> RBX \<sigma> = RDI\<^sub>0 \<and> RDX \<sigma> = 0x2a498 \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x8) \<and> (\<sigma> \<turnstile> *[0x2a498,8]::64 word) = (\<sigma> \<turnstile> *[0x2a498,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = RBX\<^sub>0\<close>
declare Q_0x18180_14_def[Qs]

schematic_goal bdrv_delete_0_4_0x18143_0x1817b_14[blocks]:
  assumes \<open>(P_0x18143_false_14 && P_0x18143_false_14_regions && ! !ZF) \<sigma>\<close>
  shows \<open>exec_block 4 0x1817b 14 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x18180_14 ?\<sigma> \<and> block_usage P_0x18143_false_14_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x18143_false_14_def P_0x18143_false_14_regions_def post: Q_0x18180_14_def regionset: P_0x18143_false_14_regions_set_def)

definition P_0x18180_15 :: state_pred where
  \<open>P_0x18180_15 \<sigma> \<equiv> RIP \<sigma> = 0x18180 \<and> RAX \<sigma> = (\<sigma> \<turnstile> *[0x2a498,8]::64 word) \<and> RBX \<sigma> = RDI\<^sub>0 \<and> RDX \<sigma> = 0x2a498 \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x8) \<and> (\<sigma> \<turnstile> *[0x2a498,8]::64 word) = (\<sigma> \<turnstile> *[0x2a498,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = RBX\<^sub>0\<close>
declare P_0x18180_15_def[Ps]

definition P_0x18180_15_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x18180_15_regions_set \<sigma> \<equiv> {
    (0, 0x2a498, 8),
    (1, RSP\<^sub>0, 8),
    (2, ((RSP\<^sub>0::64 word) - 0x8), 8)
  }\<close>

definition P_0x18180_15_regions :: state_pred where
  \<open>P_0x18180_15_regions \<sigma> \<equiv> \<exists>regions. P_0x18180_15_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x18183_15 :: state_pred where
  \<open>Q_0x18183_15 \<sigma> \<equiv> RIP \<sigma> = 0x18183 \<and> RAX \<sigma> = (\<sigma> \<turnstile> *[0x2a498,8]::64 word) \<and> RBX \<sigma> = RDI\<^sub>0 \<and> RDX \<sigma> = 0x2a498 \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x8) \<and> (\<sigma> \<turnstile> *[0x2a498,8]::64 word) = (\<sigma> \<turnstile> *[0x2a498,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = RBX\<^sub>0\<close>
declare Q_0x18183_15_def[Qs]

schematic_goal bdrv_delete_0_1_0x18180_0x18180_15[blocks]:
  assumes \<open>(P_0x18180_15 && P_0x18180_15_regions) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x18180 15 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x18183_15 ?\<sigma> \<and> block_usage P_0x18180_15_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x18180_15_def P_0x18180_15_regions_def post: Q_0x18183_15_def regionset: P_0x18180_15_regions_set_def)

definition P_0x18183_true_16 :: state_pred where
  \<open>P_0x18183_true_16 \<sigma> \<equiv> RIP \<sigma> = 0x18183 \<and> RAX \<sigma> = (\<sigma> \<turnstile> *[0x2a498,8]::64 word) \<and> RBX \<sigma> = RDI\<^sub>0 \<and> RDX \<sigma> = 0x2a498 \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x8) \<and> (\<sigma> \<turnstile> *[0x2a498,8]::64 word) = (\<sigma> \<turnstile> *[0x2a498,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = RBX\<^sub>0\<close>
declare P_0x18183_true_16_def[Ps]

definition P_0x18183_true_16_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x18183_true_16_regions_set \<sigma> \<equiv> {
    (0, 0x2a498, 8),
    (1, RSP\<^sub>0, 8),
    (2, ((RDI\<^sub>0::64 word) + 0x8b8), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x8), 8)
  }\<close>

definition P_0x18183_true_16_regions :: state_pred where
  \<open>P_0x18183_true_16_regions \<sigma> \<equiv> \<exists>regions. P_0x18183_true_16_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x18185_16 :: state_pred where
  \<open>Q_0x18185_16 \<sigma> \<equiv> RIP \<sigma> = 0x18185 \<and> RBX \<sigma> = RDI\<^sub>0 \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x8) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = RBX\<^sub>0\<close>
declare Q_0x18185_16_def[Qs]

schematic_goal bdrv_delete_0_4_0x18183_0x18172_16[blocks]:
  assumes \<open>(P_0x18183_true_16 && P_0x18183_true_16_regions && ZF) \<sigma>\<close>
  shows \<open>exec_block 4 0x18172 16 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x18185_16 ?\<sigma> \<and> block_usage P_0x18183_true_16_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x18183_true_16_def P_0x18183_true_16_regions_def post: Q_0x18185_16_def regionset: P_0x18183_true_16_regions_set_def)

definition P_0x18183_false_17 :: state_pred where
  \<open>P_0x18183_false_17 \<sigma> \<equiv> RIP \<sigma> = 0x18183 \<and> RAX \<sigma> = (\<sigma> \<turnstile> *[0x2a498,8]::64 word) \<and> RBX \<sigma> = RDI\<^sub>0 \<and> RDX \<sigma> = 0x2a498 \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x8) \<and> (\<sigma> \<turnstile> *[0x2a498,8]::64 word) = (\<sigma> \<turnstile> *[0x2a498,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = RBX\<^sub>0\<close>
declare P_0x18183_false_17_def[Ps]

definition P_0x18183_false_17_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x18183_false_17_regions_set \<sigma> \<equiv> {
    (0, 0x2a498, 8),
    (1, RSP\<^sub>0, 8),
    (2, ((RSP\<^sub>0::64 word) - 0x8), 8)
  }\<close>

definition P_0x18183_false_17_regions :: state_pred where
  \<open>P_0x18183_false_17_regions \<sigma> \<equiv> \<exists>regions. P_0x18183_false_17_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x18185_17 :: state_pred where
  \<open>Q_0x18185_17 \<sigma> \<equiv> RIP \<sigma> = 0x18185 \<and> RBX \<sigma> = RDI\<^sub>0 \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x8) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = RBX\<^sub>0\<close>
declare Q_0x18185_17_def[Qs]

schematic_goal bdrv_delete_0_1_0x18183_0x18183_17[blocks]:
  assumes \<open>(P_0x18183_false_17 && P_0x18183_false_17_regions && ! ZF) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x18183 17 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x18185_17 ?\<sigma> \<and> block_usage P_0x18183_false_17_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x18183_false_17_def P_0x18183_false_17_regions_def post: Q_0x18185_17_def regionset: P_0x18183_false_17_regions_set_def)

definition P_0x18185_18 :: state_pred where
  \<open>P_0x18185_18 \<sigma> \<equiv> RIP \<sigma> = 0x18185 \<and> RBX \<sigma> = RDI\<^sub>0 \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x8) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = RBX\<^sub>0\<close>
declare P_0x18185_18_def[Ps]

definition P_0x18185_18_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x18185_18_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((RSP\<^sub>0::64 word) - 0x8), 8)
  }\<close>

definition P_0x18185_18_regions :: state_pred where
  \<open>P_0x18185_18_regions \<sigma> \<equiv> \<exists>regions. P_0x18185_18_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x18188_18 :: state_pred where
  \<open>Q_0x18188_18 \<sigma> \<equiv> RIP \<sigma> = 0x18188 \<and> RBX \<sigma> = RDI\<^sub>0 \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x8) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = RBX\<^sub>0\<close>
declare Q_0x18188_18_def[Qs]

schematic_goal bdrv_delete_0_1_0x18185_0x18185_18[blocks]:
  assumes \<open>(P_0x18185_18 && P_0x18185_18_regions) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x18185 18 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x18188_18 ?\<sigma> \<and> block_usage P_0x18185_18_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x18185_18_def P_0x18185_18_regions_def post: Q_0x18188_18_def regionset: P_0x18185_18_regions_set_def)

definition P_0x18188_19 :: state_pred where
  \<open>P_0x18188_19 \<sigma> \<equiv> RIP \<sigma> = 0x18188 \<and> RBX \<sigma> = RDI\<^sub>0 \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x8) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = RBX\<^sub>0\<close>
declare P_0x18188_19_def[Ps]

definition P_0x18188_19_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x18188_19_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (2, ((RSP\<^sub>0::64 word) - 0x10), 8)
  }\<close>

definition P_0x18188_19_regions :: state_pred where
  \<open>P_0x18188_19_regions \<sigma> \<equiv> \<exists>regions. P_0x18188_19_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_bdrv_close_addr_0x18188_19 :: state_pred where
  \<open>Q_bdrv_close_addr_0x18188_19 \<sigma> \<equiv> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x10) \<and> RIP \<sigma> = bdrv_close_addr \<and> RBX \<sigma> = RDI\<^sub>0 \<and> RDI \<sigma> = RDI\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = 0x1818d\<close>
declare Q_bdrv_close_addr_0x18188_19_def[Qs]

schematic_goal bdrv_delete_0_1_0x18188_0x18188_19[blocks]:
  assumes \<open>(P_0x18188_19 && P_0x18188_19_regions) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x18188 19 \<sigma> \<triangleq> ?\<sigma> \<and> Q_bdrv_close_addr_0x18188_19 ?\<sigma> \<and> block_usage P_0x18188_19_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x18188_19_def P_0x18188_19_regions_def post: Q_bdrv_close_addr_0x18188_19_def regionset: P_0x18188_19_regions_set_def)

definition P_0x1818d_20 :: state_pred where
  \<open>P_0x1818d_20 \<sigma> \<equiv> RIP \<sigma> = 0x1818d \<and> RBX \<sigma> = RDI\<^sub>0 \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x8) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = 0x1818d\<close>
declare P_0x1818d_20_def[Ps]

definition P_0x1818d_20_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x1818d_20_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (2, ((RSP\<^sub>0::64 word) - 0x10), 8)
  }\<close>

definition P_0x1818d_20_regions :: state_pred where
  \<open>P_0x1818d_20_regions \<sigma> \<equiv> \<exists>regions. P_0x1818d_20_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x5960_20 :: state_pred where
  \<open>Q_0x5960_20 \<sigma> \<equiv> RIP \<sigma> = 0x5960 \<and> RBX \<sigma> = RBX\<^sub>0 \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSP \<sigma> = RSP\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = 0x1818d\<close>
declare Q_0x5960_20_def[Qs]

schematic_goal bdrv_delete_0_3_0x1818d_0x18191_20[blocks]:
  assumes \<open>(P_0x1818d_20 && P_0x1818d_20_regions) \<sigma>\<close>
  shows \<open>exec_block 3 0x18191 20 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x5960_20 ?\<sigma> \<and> block_usage P_0x1818d_20_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x1818d_20_def P_0x1818d_20_regions_def post: Q_0x5960_20_def regionset: P_0x1818d_20_regions_set_def)

definition P_0x5960_21 :: state_pred where
  \<open>P_0x5960_21 \<sigma> \<equiv> RIP \<sigma> = 0x5960 \<and> RBX \<sigma> = RBX\<^sub>0 \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSP \<sigma> = RSP\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = 0x1818d\<close>
declare P_0x5960_21_def[Ps]

definition P_0x5960_21_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x5960_21_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (2, ((RSP\<^sub>0::64 word) - 0x10), 8)
  }\<close>

definition P_0x5960_21_regions :: state_pred where
  \<open>P_0x5960_21_regions \<sigma> \<equiv> \<exists>regions. P_0x5960_21_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_free_addr_0x5960_21 :: state_pred where
  \<open>Q_free_addr_0x5960_21 \<sigma> \<equiv> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x8) \<and> RIP \<sigma> = free_addr \<and> RBX \<sigma> = RBX\<^sub>0 \<and> RDI \<sigma> = RDI\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = 0x5961 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = 0x1818d\<close>
declare Q_free_addr_0x5960_21_def[Qs]

schematic_goal bdrv_delete_0_1_0x5960_0x5960_21[blocks]:
  assumes \<open>(P_0x5960_21 && P_0x5960_21_regions) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x5960 21 \<sigma> \<triangleq> ?\<sigma> \<and> Q_free_addr_0x5960_21 ?\<sigma> \<and> block_usage P_0x5960_21_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x5960_21_def P_0x5960_21_regions_def post: Q_free_addr_0x5960_21_def regionset: P_0x5960_21_regions_set_def)

definition P_0x5961_22 :: state_pred where
  \<open>P_0x5961_22 \<sigma> \<equiv> RIP \<sigma> = 0x5961 \<and> RBX \<sigma> = RBX\<^sub>0 \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSP \<sigma> = RSP\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = 0x5961 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = 0x1818d\<close>
declare P_0x5961_22_def[Ps]

definition P_0x5961_22_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x5961_22_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (2, ((RSP\<^sub>0::64 word) - 0x10), 8)
  }\<close>

definition P_0x5961_22_regions :: state_pred where
  \<open>P_0x5961_22_regions \<sigma> \<equiv> \<exists>regions. P_0x5961_22_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_ret_address_22 :: state_pred where
  \<open>Q_ret_address_22 \<sigma> \<equiv> RIP \<sigma> = ret_address \<and> RBX \<sigma> = RBX\<^sub>0 \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) + 0x8) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = 0x5961 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = 0x1818d\<close>
declare Q_ret_address_22_def[Qs]

schematic_goal bdrv_delete_0_1_0x5961_0x5961_22[blocks]:
  assumes \<open>(P_0x5961_22 && P_0x5961_22_regions) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x5961 22 \<sigma> \<triangleq> ?\<sigma> \<and> Q_ret_address_22 ?\<sigma> \<and> block_usage P_0x5961_22_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x5961_22_def P_0x5961_22_regions_def post: Q_ret_address_22_def regionset: P_0x5961_22_regions_set_def)

definition bdrv_delete_acode :: ACode where
  \<open>bdrv_delete_acode =
    Block 4 0x1813b 0;
    IF ZF THEN
      Block 3 0x1819d (Suc 0);
      Block 3 0x18172 2
    ELSE
      Block 2 0x18140 3;
      IF !ZF THEN
        Block (Suc 0) 0x18143 4;
        WHILE P_0x18155_5 DO
          Block 3 0x18163 5;
          IF !ZF THEN
            Block 2 0x18150 6;
            IF ZF THEN
              Block (Suc 0) 0x18153 7
            ELSE
              Block (Suc 0) 0x18153 8
            FI
          ELSE
            Block (Suc 0) 0x18166 9
          FI
        OD;
        CASES [
          (P_0x18180_10,
            Block (Suc 0) 0x18180 10;
            IF ZF THEN
              Block 4 0x18172 11
            ELSE
              Block (Suc 0) 0x18183 12
            FI
          ),
          (P_0x18168_13,
            Block 3 0x18172 13
          )
        ]
      ELSE
        Block 4 0x1817b 14;
        Block (Suc 0) 0x18180 15;
        IF ZF THEN
          Block 4 0x18172 16
        ELSE
          Block (Suc 0) 0x18183 17
        FI
      FI
    FI;
    Block (Suc 0) 0x18185 18;
    Block (Suc 0) 0x18188 19;
    CALL bdrv_close_acode;
    Block 3 0x18191 20;
    Block (Suc 0) 0x5960 21;
    CALL free_acode;
    Block (Suc 0) 0x5961 22
  \<close>

schematic_goal "bdrv_delete":
  assumes
    \<open>\<forall>\<sigma>. RIP \<sigma> = 0x1813e \<longrightarrow> P_0x1813e_true_1_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x18168 \<longrightarrow> P_0x18168_2_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x1813e \<longrightarrow> P_0x1813e_false_3_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x18143 \<longrightarrow> P_0x18143_true_4_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x18155 \<longrightarrow> P_0x18155_5_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x18166 \<longrightarrow> P_0x18166_true_6_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x18153 \<longrightarrow> P_0x18153_true_7_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x18153 \<longrightarrow> P_0x18153_false_8_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x18166 \<longrightarrow> P_0x18166_false_9_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x18180 \<longrightarrow> P_0x18180_10_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x18183 \<longrightarrow> P_0x18183_true_11_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x18183 \<longrightarrow> P_0x18183_false_12_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x18168 \<longrightarrow> P_0x18168_13_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x18143 \<longrightarrow> P_0x18143_false_14_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x18180 \<longrightarrow> P_0x18180_15_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x18183 \<longrightarrow> P_0x18183_true_16_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x18183 \<longrightarrow> P_0x18183_false_17_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x18185 \<longrightarrow> P_0x18185_18_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x18188 \<longrightarrow> P_0x18188_19_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x1818d \<longrightarrow> P_0x1818d_20_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x5960 \<longrightarrow> P_0x5960_21_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x5961 \<longrightarrow> P_0x5961_22_regions \<sigma>\<close>
    and [blocks]: \<open>{{Q_bdrv_close_addr_0x18188_19}} \<box>bdrv_close_acode {{P_0x1818d_20;M_0x18188}}\<close>
    and [blocks]: \<open>{{Q_free_addr_0x5960_21}} \<box>free_acode {{P_0x5961_22;M_0x5960}}\<close>
  shows \<open>{{?P}} bdrv_delete_acode {{?Q;?M}}\<close>
  apply (vcg acode: bdrv_delete_acode_def assms: assms)
            apply (vcg_while \<open>P_0x18155_5 || P_0x18180_10 || P_0x18168_13\<close> assms: assms)
  done

end

end
