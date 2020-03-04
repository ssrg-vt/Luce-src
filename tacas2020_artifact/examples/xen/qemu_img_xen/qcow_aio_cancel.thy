theory qcow_aio_cancel
  imports
    "../../../isabelle/VCG/HTriple"
begin

locale "qemu_img_xen" = execution_context + exec_code +
  fixes bdrv_aio_cancel_0x626d_retval\<^sub>v bdrv_aio_cancel_0x129ad_retval\<^sub>v bdrv_aio_cancel_addr :: \<open>64 word\<close>
    and bdrv_aio_cancel_acode :: ACode
  assumes fetch:
    "fetch 0x6260 \<equiv> (Unary (IS_8088 Push) (Storage (Reg (General SixtyFour rbx))), 1)"
    "fetch 0x6261 \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour rbx)) (Storage (Reg (General SixtyFour rdi))), 3)"
    "fetch 0x6264 \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour rdi)) (Storage (Memory SixtyFour (A_SizeDirective 64 (A_Plus (A_FromReg (General SixtyFour rdi)) (A_WordConstant 80))))), 4)"
    "fetch 0x6268 \<equiv> (Binary (IS_8088 Test) (Reg (General SixtyFour rdi)) (Storage (Reg (General SixtyFour rdi))), 3)"
    "fetch 0x626b \<equiv> (Unary (IS_8088 Je) (Immediate SixtyFour (ImmVal 25202)), 2)"
    "fetch 0x626d \<equiv> (Unary (IS_8088 Call) (Immediate SixtyFour (ImmLabel ''bdrv_aio_cancel'')), 5)"
    "fetch 0x6272 \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour rdi)) (Storage (Reg (General SixtyFour rbx))), 3)"
    "fetch 0x6275 \<equiv> (Unary (IS_8088 Pop) (Storage (Reg (General SixtyFour rbx))), 1)"
    "fetch 0x6276 \<equiv> (Unary (IS_8088 Jmp) (Immediate SixtyFour (ImmVal 108640)), 5)"
    "fetch 0x129a0 \<equiv> (Unary (IS_8088 Push) (Storage (Reg (General SixtyFour rbx))), 1)"
    "fetch 0x129a1 \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour rbx)) (Storage (Reg (General SixtyFour rdi))), 3)"
    "fetch 0x129a4 \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour rdi)) (Storage (Memory SixtyFour (A_SizeDirective 64 (A_Plus (A_FromReg (General SixtyFour rdi)) (A_WordConstant 80))))), 4)"
    "fetch 0x129a8 \<equiv> (Binary (IS_8088 Test) (Reg (General SixtyFour rdi)) (Storage (Reg (General SixtyFour rdi))), 3)"
    "fetch 0x129ab \<equiv> (Unary (IS_8088 Je) (Immediate SixtyFour (ImmVal 76210)), 2)"
    "fetch 0x129ad \<equiv> (Unary (IS_8088 Call) (Immediate SixtyFour (ImmLabel ''bdrv_aio_cancel'')), 5)"
    "fetch 0x129b2 \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour rdi)) (Storage (Reg (General SixtyFour rbx))), 3)"
    "fetch 0x129b5 \<equiv> (Unary (IS_8088 Pop) (Storage (Reg (General SixtyFour rbx))), 1)"
    "fetch 0x129b6 \<equiv> (Unary (IS_8088 Jmp) (Immediate SixtyFour (ImmVal 108640)), 5)"
    "fetch 0x1a860 \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour rax)) (Storage (Memory SixtyFour (A_SizeDirective 64 (A_FromReg (General SixtyFour rdi))))), 3)"
    "fetch 0x1a863 \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour rdx)) (Storage (Memory SixtyFour (A_SizeDirective 64 (A_Plus (A_FromReg (General SixtyFour rax)) (A_WordConstant 16))))), 4)"
    "fetch 0x1a867 \<equiv> (Binary (IS_8088 Mov) (Memory SixtyFour (A_SizeDirective 64 (A_Plus (A_FromReg (General SixtyFour rdi)) (A_WordConstant 32)))) (Storage (Reg (General SixtyFour rdx))), 4)"
    "fetch 0x1a86b \<equiv> (Binary (IS_8088 Mov) (Memory SixtyFour (A_SizeDirective 64 (A_Plus (A_FromReg (General SixtyFour rax)) (A_WordConstant 16)))) (Storage (Reg (General SixtyFour rdi))), 4)"
    "fetch 0x1a86f \<equiv> (Nullary (IS_8088 Ret), 1)"
    and \<alpha>_def: \<open>\<alpha> = \<lparr>text_sections = [], data_sections = [], labels_to_offsets = [], binary_offset = 0\<rparr>\<close>
    and bdrv_aio_cancel\<^sub>a\<^sub>d\<^sub>d\<^sub>r[simp]: \<open>the (label_to_address \<alpha> ''bdrv_aio_cancel'') = bdrv_aio_cancel_addr\<close>
begin

text \<open>Using definitions that don't get unfolded immediately prevents locale argument issues.\<close>
definition \<open>bdrv_aio_cancel_0x626d_retval \<equiv> bdrv_aio_cancel_0x626d_retval\<^sub>v\<close>
definition \<open>bdrv_aio_cancel_0x129ad_retval \<equiv> bdrv_aio_cancel_0x129ad_retval\<^sub>v\<close>

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
  auto simp: block_usage_def eq_def setcc_def cmovcc_def if'_then_else_def simp_rules Let'_def read_region'_def write_block'_def get'_def set'_def post regionset

method vcg_step uses assms =
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

locale "qcow_aio_cancel_1" = "qemu_img_xen" +
  fixes RAX\<^sub>0\<^sub>v RBX\<^sub>0\<^sub>v RDX\<^sub>0\<^sub>v RDI\<^sub>0\<^sub>v RSP\<^sub>0\<^sub>v ret_address\<^sub>v :: \<open>64 word\<close>
begin

text \<open>Using definitions that don't get unfolded immediately prevents locale argument issues.\<close>
definition \<open>RAX\<^sub>0 \<equiv> RAX\<^sub>0\<^sub>v\<close>
definition \<open>RBX\<^sub>0 \<equiv> RBX\<^sub>0\<^sub>v\<close>
definition \<open>RDX\<^sub>0 \<equiv> RDX\<^sub>0\<^sub>v\<close>
definition \<open>RDI\<^sub>0 \<equiv> RDI\<^sub>0\<^sub>v\<close>
definition \<open>RSP\<^sub>0 \<equiv> RSP\<^sub>0\<^sub>v\<close>
definition \<open>ret_address \<equiv> ret_address\<^sub>v\<close>

definition P_0x6260_0 :: state_pred where
  \<open>P_0x6260_0 \<sigma> \<equiv> RIP \<sigma> = 0x6260 \<and> RAX \<sigma> = RAX\<^sub>0 \<and> RBX \<sigma> = RBX\<^sub>0 \<and> RDX \<sigma> = RDX\<^sub>0 \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSP \<sigma> = RSP\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address\<close>
declare P_0x6260_0_def[Ps]

definition P_0x6260_0_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x6260_0_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((RDI\<^sub>0::64 word) + 0x50), 8),
    (2, ((RSP\<^sub>0::64 word) - 0x8), 8)
  }\<close>

definition P_0x6260_0_regions :: state_pred where
  \<open>P_0x6260_0_regions \<sigma> \<equiv> \<exists>regions. P_0x6260_0_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x626b_0 :: state_pred where
  \<open>Q_0x626b_0 \<sigma> \<equiv> RIP \<sigma> = 0x626b \<and> RAX \<sigma> = RAX\<^sub>0 \<and> RBX \<sigma> = RDI\<^sub>0 \<and> RDX \<sigma> = RDX\<^sub>0 \<and> RDI \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x50),8]::64 word) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x8) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x50),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x50),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = RBX\<^sub>0\<close>
declare Q_0x626b_0_def[Qs]

schematic_goal qcow_aio_cancel_1_0_4_0x6260_0x6268_0[blocks]:
  assumes \<open>(P_0x6260_0 && P_0x6260_0_regions) \<sigma>\<close>
  shows \<open>exec_block 4 0x6268 0 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x626b_0 ?\<sigma> \<and> block_usage P_0x6260_0_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x6260_0_def P_0x6260_0_regions_def post: Q_0x626b_0_def regionset: P_0x6260_0_regions_set_def)

definition P_0x626b_true_1 :: state_pred where
  \<open>P_0x626b_true_1 \<sigma> \<equiv> RIP \<sigma> = 0x626b \<and> RAX \<sigma> = RAX\<^sub>0 \<and> RBX \<sigma> = RDI\<^sub>0 \<and> RDX \<sigma> = RDX\<^sub>0 \<and> RDI \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x50),8]::64 word) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x8) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x50),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x50),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = RBX\<^sub>0\<close>
declare P_0x626b_true_1_def[Ps]

definition P_0x626b_true_1_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x626b_true_1_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((RDI\<^sub>0::64 word) + 0x50), 8),
    (2, ((RSP\<^sub>0::64 word) - 0x8), 8)
  }\<close>

definition P_0x626b_true_1_regions :: state_pred where
  \<open>P_0x626b_true_1_regions \<sigma> \<equiv> \<exists>regions. P_0x626b_true_1_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x6272_1 :: state_pred where
  \<open>Q_0x6272_1 \<sigma> \<equiv> RIP \<sigma> = 0x6272 \<and> RBX \<sigma> = RDI\<^sub>0 \<and> RDX \<sigma> = RDX\<^sub>0 \<and> RDI \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x50),8]::64 word) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x8) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x50),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x50),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = RBX\<^sub>0\<close>
declare Q_0x6272_1_def[Qs]

schematic_goal qcow_aio_cancel_1_0_1_0x626b_0x626b_1[blocks]:
  assumes \<open>(P_0x626b_true_1 && P_0x626b_true_1_regions && ZF) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x626b (Suc 0) \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x6272_1 ?\<sigma> \<and> block_usage P_0x626b_true_1_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x626b_true_1_def P_0x626b_true_1_regions_def post: Q_0x6272_1_def regionset: P_0x626b_true_1_regions_set_def)

definition P_0x626b_false_2 :: state_pred where
  \<open>P_0x626b_false_2 \<sigma> \<equiv> RIP \<sigma> = 0x626b \<and> RAX \<sigma> = RAX\<^sub>0 \<and> RBX \<sigma> = RDI\<^sub>0 \<and> RDX \<sigma> = RDX\<^sub>0 \<and> RDI \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x50),8]::64 word) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x8) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x50),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x50),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = RBX\<^sub>0\<close>
declare P_0x626b_false_2_def[Ps]

definition P_0x626b_false_2_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x626b_false_2_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((RDI\<^sub>0::64 word) + 0x50), 8),
    (2, ((RSP\<^sub>0::64 word) - 0x8), 8)
  }\<close>

definition P_0x626b_false_2_regions :: state_pred where
  \<open>P_0x626b_false_2_regions \<sigma> \<equiv> \<exists>regions. P_0x626b_false_2_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x626d_2 :: state_pred where
  \<open>Q_0x626d_2 \<sigma> \<equiv> RIP \<sigma> = 0x626d \<and> RAX \<sigma> = RAX\<^sub>0 \<and> RBX \<sigma> = RDI\<^sub>0 \<and> RDX \<sigma> = RDX\<^sub>0 \<and> RDI \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x50),8]::64 word) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x8) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x50),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x50),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = RBX\<^sub>0\<close>
declare Q_0x626d_2_def[Qs]

schematic_goal qcow_aio_cancel_1_0_1_0x626b_0x626b_2[blocks]:
  assumes \<open>(P_0x626b_false_2 && P_0x626b_false_2_regions && ! ZF) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x626b 2 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x626d_2 ?\<sigma> \<and> block_usage P_0x626b_false_2_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x626b_false_2_def P_0x626b_false_2_regions_def post: Q_0x626d_2_def regionset: P_0x626b_false_2_regions_set_def)

definition P_0x626d_3 :: state_pred where
  \<open>P_0x626d_3 \<sigma> \<equiv> RIP \<sigma> = 0x626d \<and> RAX \<sigma> = RAX\<^sub>0 \<and> RBX \<sigma> = RDI\<^sub>0 \<and> RDX \<sigma> = RDX\<^sub>0 \<and> RDI \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x50),8]::64 word) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x8) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x50),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x50),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = RBX\<^sub>0\<close>
declare P_0x626d_3_def[Ps]

definition P_0x626d_3_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x626d_3_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((RDI\<^sub>0::64 word) + 0x50), 8),
    (2, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x10), 8)
  }\<close>

definition P_0x626d_3_regions :: state_pred where
  \<open>P_0x626d_3_regions \<sigma> \<equiv> \<exists>regions. P_0x626d_3_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_bdrv_aio_cancel_addr_0x626d_3 :: state_pred where
  \<open>Q_bdrv_aio_cancel_addr_0x626d_3 \<sigma> \<equiv> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x10) \<and> RIP \<sigma> = bdrv_aio_cancel_addr \<and> RAX \<sigma> = RAX\<^sub>0 \<and> RBX \<sigma> = RDI\<^sub>0 \<and> RDX \<sigma> = RDX\<^sub>0 \<and> RDI \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x50),8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x50),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x50),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = RBX\<^sub>0\<close>
declare Q_bdrv_aio_cancel_addr_0x626d_3_def[Qs]

schematic_goal qcow_aio_cancel_1_0_1_0x626d_0x626d_3[blocks]:
  assumes \<open>(P_0x626d_3 && P_0x626d_3_regions) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x626d 3 \<sigma> \<triangleq> ?\<sigma> \<and> Q_bdrv_aio_cancel_addr_0x626d_3 ?\<sigma> \<and> block_usage P_0x626d_3_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x626d_3_def P_0x626d_3_regions_def post: Q_bdrv_aio_cancel_addr_0x626d_3_def regionset: P_0x626d_3_regions_set_def)

definition P_0x6272_4 :: state_pred where
  \<open>P_0x6272_4 \<sigma> \<equiv> RIP \<sigma> = 0x6272 \<and> RBX \<sigma> = RDI\<^sub>0 \<and> RDX \<sigma> = RDX\<^sub>0 \<and> RDI \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x50),8]::64 word) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x8) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x50),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x50),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = RBX\<^sub>0\<close>
declare P_0x6272_4_def[Ps]

definition P_0x6272_4_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x6272_4_regions_set \<sigma> \<equiv> {
    (0, RDI\<^sub>0, 8),
    (1, RSP\<^sub>0, 8),
    (2, ((RDI\<^sub>0::64 word) + 0x20), 8),
    (3, ((RDI\<^sub>0::64 word) + 0x50), 8),
    (4, (((\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word)::64 word) + 0x10), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x8), 8)
  }\<close>

definition P_0x6272_4_regions :: state_pred where
  \<open>P_0x6272_4_regions \<sigma> \<equiv> \<exists>regions. P_0x6272_4_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_ret_address_4 :: state_pred where
  \<open>Q_ret_address_4 \<sigma> \<equiv> RIP \<sigma> = ret_address \<and> RAX \<sigma> = (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) \<and> RBX \<sigma> = RBX\<^sub>0 \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) + 0x8) \<and> (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) = (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x50),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x50),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word)::64 word) + 0x10),8]::64 word) = RDI\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = RBX\<^sub>0\<close>
declare Q_ret_address_4_def[Qs]

schematic_goal qcow_aio_cancel_1_0_8_0x6272_0x1a86f_4[blocks]:
  assumes \<open>(P_0x6272_4 && P_0x6272_4_regions) \<sigma>\<close>
  shows \<open>exec_block 8 0x1a86f 4 \<sigma> \<triangleq> ?\<sigma> \<and> Q_ret_address_4 ?\<sigma> \<and> block_usage P_0x6272_4_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x6272_4_def P_0x6272_4_regions_def post: Q_ret_address_4_def regionset: P_0x6272_4_regions_set_def)

definition qcow_aio_cancel_1_acode :: ACode where
  \<open>qcow_aio_cancel_1_acode =
    Block 4 0x6268 0;
    IF ZF THEN
      Block (Suc 0) 0x626b (Suc 0)
    ELSE
      Block (Suc 0) 0x626b 2;
      Block (Suc 0) 0x626d 3;
      CALL bdrv_aio_cancel_acode
    FI;
    Block 8 0x1a86f 4
  \<close>

schematic_goal "qcow_aio_cancel_1":
  assumes
    \<open>\<forall>\<sigma>. RIP \<sigma> = 0x626b \<longrightarrow> P_0x626b_true_1_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x626b \<longrightarrow> P_0x626b_false_2_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x626d \<longrightarrow> P_0x626d_3_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x6272 \<longrightarrow> P_0x6272_4_regions \<sigma>\<close>
    and [blocks]: \<open>{{Q_bdrv_aio_cancel_addr_0x626d_3}} \<box>bdrv_aio_cancel_acode {{P_0x6272_4;M_0x626d}}\<close>
  shows \<open>{{?P}} qcow_aio_cancel_1_acode {{?Q;?M}}\<close>
  by (vcg acode: qcow_aio_cancel_1_acode_def assms: assms)

end

locale "qcow_aio_cancel" = "qemu_img_xen" +
  fixes RAX\<^sub>0\<^sub>v RBX\<^sub>0\<^sub>v RDX\<^sub>0\<^sub>v RDI\<^sub>0\<^sub>v RSP\<^sub>0\<^sub>v ret_address\<^sub>v :: \<open>64 word\<close>
begin

text \<open>Using definitions that don't get unfolded immediately prevents locale argument issues.\<close>
definition \<open>RAX\<^sub>0 \<equiv> RAX\<^sub>0\<^sub>v\<close>
definition \<open>RBX\<^sub>0 \<equiv> RBX\<^sub>0\<^sub>v\<close>
definition \<open>RDX\<^sub>0 \<equiv> RDX\<^sub>0\<^sub>v\<close>
definition \<open>RDI\<^sub>0 \<equiv> RDI\<^sub>0\<^sub>v\<close>
definition \<open>RSP\<^sub>0 \<equiv> RSP\<^sub>0\<^sub>v\<close>
definition \<open>ret_address \<equiv> ret_address\<^sub>v\<close>

definition P_0x129a0_0 :: state_pred where
  \<open>P_0x129a0_0 \<sigma> \<equiv> RIP \<sigma> = 0x129a0 \<and> RAX \<sigma> = RAX\<^sub>0 \<and> RBX \<sigma> = RBX\<^sub>0 \<and> RDX \<sigma> = RDX\<^sub>0 \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSP \<sigma> = RSP\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address\<close>
declare P_0x129a0_0_def[Ps]

definition P_0x129a0_0_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x129a0_0_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((RDI\<^sub>0::64 word) + 0x50), 8),
    (2, ((RSP\<^sub>0::64 word) - 0x8), 8)
  }\<close>

definition P_0x129a0_0_regions :: state_pred where
  \<open>P_0x129a0_0_regions \<sigma> \<equiv> \<exists>regions. P_0x129a0_0_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x129ab_0 :: state_pred where
  \<open>Q_0x129ab_0 \<sigma> \<equiv> RIP \<sigma> = 0x129ab \<and> RAX \<sigma> = RAX\<^sub>0 \<and> RBX \<sigma> = RDI\<^sub>0 \<and> RDX \<sigma> = RDX\<^sub>0 \<and> RDI \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x50),8]::64 word) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x8) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x50),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x50),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = RBX\<^sub>0\<close>
declare Q_0x129ab_0_def[Qs]

schematic_goal qcow_aio_cancel_0_4_0x129a0_0x129a8_0[blocks]:
  assumes \<open>(P_0x129a0_0 && P_0x129a0_0_regions) \<sigma>\<close>
  shows \<open>exec_block 4 0x129a8 0 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x129ab_0 ?\<sigma> \<and> block_usage P_0x129a0_0_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x129a0_0_def P_0x129a0_0_regions_def post: Q_0x129ab_0_def regionset: P_0x129a0_0_regions_set_def)

definition P_0x129ab_true_1 :: state_pred where
  \<open>P_0x129ab_true_1 \<sigma> \<equiv> RIP \<sigma> = 0x129ab \<and> RAX \<sigma> = RAX\<^sub>0 \<and> RBX \<sigma> = RDI\<^sub>0 \<and> RDX \<sigma> = RDX\<^sub>0 \<and> RDI \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x50),8]::64 word) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x8) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x50),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x50),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = RBX\<^sub>0\<close>
declare P_0x129ab_true_1_def[Ps]

definition P_0x129ab_true_1_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x129ab_true_1_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((RDI\<^sub>0::64 word) + 0x50), 8),
    (2, ((RSP\<^sub>0::64 word) - 0x8), 8)
  }\<close>

definition P_0x129ab_true_1_regions :: state_pred where
  \<open>P_0x129ab_true_1_regions \<sigma> \<equiv> \<exists>regions. P_0x129ab_true_1_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x129b2_1 :: state_pred where
  \<open>Q_0x129b2_1 \<sigma> \<equiv> RIP \<sigma> = 0x129b2 \<and> RBX \<sigma> = RDI\<^sub>0 \<and> RDX \<sigma> = RDX\<^sub>0 \<and> RDI \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x50),8]::64 word) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x8) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x50),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x50),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = RBX\<^sub>0\<close>
declare Q_0x129b2_1_def[Qs]

schematic_goal qcow_aio_cancel_0_1_0x129ab_0x129ab_1[blocks]:
  assumes \<open>(P_0x129ab_true_1 && P_0x129ab_true_1_regions && ZF) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x129ab (Suc 0) \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x129b2_1 ?\<sigma> \<and> block_usage P_0x129ab_true_1_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x129ab_true_1_def P_0x129ab_true_1_regions_def post: Q_0x129b2_1_def regionset: P_0x129ab_true_1_regions_set_def)

definition P_0x129ab_false_2 :: state_pred where
  \<open>P_0x129ab_false_2 \<sigma> \<equiv> RIP \<sigma> = 0x129ab \<and> RAX \<sigma> = RAX\<^sub>0 \<and> RBX \<sigma> = RDI\<^sub>0 \<and> RDX \<sigma> = RDX\<^sub>0 \<and> RDI \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x50),8]::64 word) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x8) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x50),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x50),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = RBX\<^sub>0\<close>
declare P_0x129ab_false_2_def[Ps]

definition P_0x129ab_false_2_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x129ab_false_2_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((RDI\<^sub>0::64 word) + 0x50), 8),
    (2, ((RSP\<^sub>0::64 word) - 0x8), 8)
  }\<close>

definition P_0x129ab_false_2_regions :: state_pred where
  \<open>P_0x129ab_false_2_regions \<sigma> \<equiv> \<exists>regions. P_0x129ab_false_2_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x129ad_2 :: state_pred where
  \<open>Q_0x129ad_2 \<sigma> \<equiv> RIP \<sigma> = 0x129ad \<and> RAX \<sigma> = RAX\<^sub>0 \<and> RBX \<sigma> = RDI\<^sub>0 \<and> RDX \<sigma> = RDX\<^sub>0 \<and> RDI \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x50),8]::64 word) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x8) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x50),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x50),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = RBX\<^sub>0\<close>
declare Q_0x129ad_2_def[Qs]

schematic_goal qcow_aio_cancel_0_1_0x129ab_0x129ab_2[blocks]:
  assumes \<open>(P_0x129ab_false_2 && P_0x129ab_false_2_regions && ! ZF) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x129ab 2 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x129ad_2 ?\<sigma> \<and> block_usage P_0x129ab_false_2_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x129ab_false_2_def P_0x129ab_false_2_regions_def post: Q_0x129ad_2_def regionset: P_0x129ab_false_2_regions_set_def)

definition P_0x129ad_3 :: state_pred where
  \<open>P_0x129ad_3 \<sigma> \<equiv> RIP \<sigma> = 0x129ad \<and> RAX \<sigma> = RAX\<^sub>0 \<and> RBX \<sigma> = RDI\<^sub>0 \<and> RDX \<sigma> = RDX\<^sub>0 \<and> RDI \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x50),8]::64 word) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x8) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x50),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x50),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = RBX\<^sub>0\<close>
declare P_0x129ad_3_def[Ps]

definition P_0x129ad_3_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x129ad_3_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((RDI\<^sub>0::64 word) + 0x50), 8),
    (2, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x10), 8)
  }\<close>

definition P_0x129ad_3_regions :: state_pred where
  \<open>P_0x129ad_3_regions \<sigma> \<equiv> \<exists>regions. P_0x129ad_3_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_bdrv_aio_cancel_addr_0x129ad_3 :: state_pred where
  \<open>Q_bdrv_aio_cancel_addr_0x129ad_3 \<sigma> \<equiv> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x10) \<and> RIP \<sigma> = bdrv_aio_cancel_addr \<and> RAX \<sigma> = RAX\<^sub>0 \<and> RBX \<sigma> = RDI\<^sub>0 \<and> RDX \<sigma> = RDX\<^sub>0 \<and> RDI \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x50),8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x50),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x50),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = RBX\<^sub>0\<close>
declare Q_bdrv_aio_cancel_addr_0x129ad_3_def[Qs]

schematic_goal qcow_aio_cancel_0_1_0x129ad_0x129ad_3[blocks]:
  assumes \<open>(P_0x129ad_3 && P_0x129ad_3_regions) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x129ad 3 \<sigma> \<triangleq> ?\<sigma> \<and> Q_bdrv_aio_cancel_addr_0x129ad_3 ?\<sigma> \<and> block_usage P_0x129ad_3_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x129ad_3_def P_0x129ad_3_regions_def post: Q_bdrv_aio_cancel_addr_0x129ad_3_def regionset: P_0x129ad_3_regions_set_def)

definition P_0x129b2_4 :: state_pred where
  \<open>P_0x129b2_4 \<sigma> \<equiv> RIP \<sigma> = 0x129b2 \<and> RBX \<sigma> = RDI\<^sub>0 \<and> RDX \<sigma> = RDX\<^sub>0 \<and> RDI \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x50),8]::64 word) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x8) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x50),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x50),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = RBX\<^sub>0\<close>
declare P_0x129b2_4_def[Ps]

definition P_0x129b2_4_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x129b2_4_regions_set \<sigma> \<equiv> {
    (0, RDI\<^sub>0, 8),
    (1, RSP\<^sub>0, 8),
    (2, ((RDI\<^sub>0::64 word) + 0x20), 8),
    (3, ((RDI\<^sub>0::64 word) + 0x50), 8),
    (4, (((\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word)::64 word) + 0x10), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x8), 8)
  }\<close>

definition P_0x129b2_4_regions :: state_pred where
  \<open>P_0x129b2_4_regions \<sigma> \<equiv> \<exists>regions. P_0x129b2_4_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_ret_address_4 :: state_pred where
  \<open>Q_ret_address_4 \<sigma> \<equiv> RIP \<sigma> = ret_address \<and> RAX \<sigma> = (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) \<and> RBX \<sigma> = RBX\<^sub>0 \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) + 0x8) \<and> (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) = (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x50),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x50),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word)::64 word) + 0x10),8]::64 word) = RDI\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = RBX\<^sub>0\<close>
declare Q_ret_address_4_def[Qs]

schematic_goal qcow_aio_cancel_0_8_0x129b2_0x1a86f_4[blocks]:
  assumes \<open>(P_0x129b2_4 && P_0x129b2_4_regions) \<sigma>\<close>
  shows \<open>exec_block 8 0x1a86f 4 \<sigma> \<triangleq> ?\<sigma> \<and> Q_ret_address_4 ?\<sigma> \<and> block_usage P_0x129b2_4_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x129b2_4_def P_0x129b2_4_regions_def post: Q_ret_address_4_def regionset: P_0x129b2_4_regions_set_def)

definition qcow_aio_cancel_acode :: ACode where
  \<open>qcow_aio_cancel_acode =
    Block 4 0x129a8 0;
    IF ZF THEN
      Block (Suc 0) 0x129ab (Suc 0)
    ELSE
      Block (Suc 0) 0x129ab 2;
      Block (Suc 0) 0x129ad 3;
      CALL bdrv_aio_cancel_acode
    FI;
    Block 8 0x1a86f 4
  \<close>

schematic_goal "qcow_aio_cancel":
  assumes
    \<open>\<forall>\<sigma>. RIP \<sigma> = 0x129ab \<longrightarrow> P_0x129ab_true_1_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x129ab \<longrightarrow> P_0x129ab_false_2_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x129ad \<longrightarrow> P_0x129ad_3_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x129b2 \<longrightarrow> P_0x129b2_4_regions \<sigma>\<close>
    and [blocks]: \<open>{{Q_bdrv_aio_cancel_addr_0x129ad_3}} \<box>bdrv_aio_cancel_acode {{P_0x129b2_4;M_0x129ad}}\<close>
  shows \<open>{{?P}} qcow_aio_cancel_acode {{?Q;?M}}\<close>
  by (vcg acode: qcow_aio_cancel_acode_def assms: assms)

end

locale "qemu_aio_release" = "qemu_img_xen" +
  fixes RAX\<^sub>0\<^sub>v RDX\<^sub>0\<^sub>v RDI\<^sub>0\<^sub>v RSP\<^sub>0\<^sub>v ret_address\<^sub>v :: \<open>64 word\<close>
begin

text \<open>Using definitions that don't get unfolded immediately prevents locale argument issues.\<close>
definition \<open>RAX\<^sub>0 \<equiv> RAX\<^sub>0\<^sub>v\<close>
definition \<open>RDX\<^sub>0 \<equiv> RDX\<^sub>0\<^sub>v\<close>
definition \<open>RDI\<^sub>0 \<equiv> RDI\<^sub>0\<^sub>v\<close>
definition \<open>RSP\<^sub>0 \<equiv> RSP\<^sub>0\<^sub>v\<close>
definition \<open>ret_address \<equiv> ret_address\<^sub>v\<close>

definition P_0x1a860_0 :: state_pred where
  \<open>P_0x1a860_0 \<sigma> \<equiv> RIP \<sigma> = 0x1a860 \<and> RAX \<sigma> = RAX\<^sub>0 \<and> RDX \<sigma> = RDX\<^sub>0 \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSP \<sigma> = RSP\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address\<close>
declare P_0x1a860_0_def[Ps]

definition P_0x1a860_0_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x1a860_0_regions_set \<sigma> \<equiv> {
    (0, RDI\<^sub>0, 8),
    (1, RSP\<^sub>0, 8),
    (2, ((RDI\<^sub>0::64 word) + 0x20), 8),
    (3, (((\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word)::64 word) + 0x10), 8)
  }\<close>

definition P_0x1a860_0_regions :: state_pred where
  \<open>P_0x1a860_0_regions \<sigma> \<equiv> \<exists>regions. P_0x1a860_0_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_ret_address_0 :: state_pred where
  \<open>Q_ret_address_0 \<sigma> \<equiv> RIP \<sigma> = ret_address \<and> RAX \<sigma> = (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) + 0x8) \<and> (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) = (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word)::64 word) + 0x10),8]::64 word) = RDI\<^sub>0\<close>
declare Q_ret_address_0_def[Qs]

schematic_goal qemu_aio_release_0_5_0x1a860_0x1a86f_0[blocks]:
  assumes \<open>(P_0x1a860_0 && P_0x1a860_0_regions) \<sigma>\<close>
  shows \<open>exec_block 5 0x1a86f 0 \<sigma> \<triangleq> ?\<sigma> \<and> Q_ret_address_0 ?\<sigma> \<and> block_usage P_0x1a860_0_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x1a860_0_def P_0x1a860_0_regions_def post: Q_ret_address_0_def regionset: P_0x1a860_0_regions_set_def)

definition qemu_aio_release_acode :: ACode where
  \<open>qemu_aio_release_acode =
    Block 5 0x1a86f 0
  \<close>

schematic_goal "qemu_aio_release":
  \<open>{{?P}} qemu_aio_release_acode {{?Q;?M}}\<close>
  by (vcg acode: qemu_aio_release_acode_def)

end
