theory array_index
  imports
    "../../../isabelle/VCG/HTriple"
begin


locale "qemu_img_xen" = execution_context + exec_code +
  fixes assert_fail_0xca5e_retval\<^sub>v assert_fail_0xca7d_retval\<^sub>v assert_fail_addr :: \<open>64 word\<close>
    and assert_fail_acode :: ACode
  assumes fetch:
    "fetch 0xca20 \<equiv> (Binary (IS_8088 Sub) (Reg (General SixtyFour rsp)) (Immediate SixtyFour (ImmVal 8)), 4)"
    "fetch 0xca24 \<equiv> (Binary (IS_8088 Mov) (Reg (General ThirtyTwo rcx)) (Storage (Memory ThirtyTwo (A_SizeDirective 32 (A_Plus (A_FromReg (General SixtyFour rdi)) (A_WordConstant 16))))), 3)"
    "fetch 0xca27 \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour rax)) (Storage (Reg (General SixtyFour rsi))), 3)"
    "fetch 0xca2a \<equiv> (Binary (IS_8088 Xor) (Reg (General ThirtyTwo rdx)) (Storage (Reg (General ThirtyTwo rdx))), 2)"
    "fetch 0xca2c \<equiv> (Binary (IS_8088 Sub) (Reg (General SixtyFour rax)) (Storage (Memory SixtyFour (A_SizeDirective 64 (A_FromReg (General SixtyFour rdi))))), 3)"
    "fetch 0xca2f \<equiv> (Unary (IS_8088 Div) (Storage (Reg (General SixtyFour rcx))), 3)"
    "fetch 0xca32 \<equiv> (Binary (IS_8088 Test) (Reg (General SixtyFour rdx)) (Storage (Reg (General SixtyFour rdx))), 3)"
    "fetch 0xca35 \<equiv> (Unary (IS_8088 Jne) (Immediate SixtyFour (ImmVal 51780)), 2)"
    "fetch 0xca37 \<equiv> (Binary (IS_8088 Mov) (Reg (General ThirtyTwo rdx)) (Storage (Memory ThirtyTwo (A_SizeDirective 32 (A_Plus (A_FromReg (General SixtyFour rdi)) (A_WordConstant 12))))), 3)"
    "fetch 0xca3a \<equiv> (Binary (IS_8088 Cmp) (Reg (General SixtyFour rax)) (Storage (Reg (General SixtyFour rdx))), 3)"
    "fetch 0xca3d \<equiv> (Unary (IS_8088 Jae) (Immediate SixtyFour (ImmVal 51811)), 2)"
    "fetch 0xca3f \<equiv> (Binary (IS_8088 Add) (Reg (General SixtyFour rsp)) (Immediate SixtyFour (ImmVal 8)), 4)"
    "fetch 0xca43 \<equiv> (Nullary (IS_8088 Ret), 1)"
    "fetch 0xca44 \<equiv> (Binary (IS_8088 Lea) (Reg (General SixtyFour rcx)) (Storage (Memory SixtyFour (A_Plus (A_FromReg (General SixtyFour rip)) (A_WordConstant 84405)))), 7)"
    "fetch 0xca4b \<equiv> (Binary (IS_8088 Mov) (Reg (General ThirtyTwo rdx)) (Immediate SixtyFour (ImmVal 197)), 5)"
    "fetch 0xca50 \<equiv> (Binary (IS_8088 Lea) (Reg (General SixtyFour rsi)) (Storage (Memory SixtyFour (A_Plus (A_FromReg (General SixtyFour rip)) (A_WordConstant 82063)))), 7)"
    "fetch 0xca57 \<equiv> (Binary (IS_8088 Lea) (Reg (General SixtyFour rdi)) (Storage (Memory SixtyFour (A_Plus (A_FromReg (General SixtyFour rip)) (A_WordConstant 83146)))), 7)"
    "fetch 0xca5e \<equiv> (Unary (IS_8088 Call) (Immediate SixtyFour (ImmLabel ''__assert_fail'')), 5)"
    "fetch 0xca63 \<equiv> (Binary (IS_8088 Lea) (Reg (General SixtyFour rcx)) (Storage (Memory SixtyFour (A_Plus (A_FromReg (General SixtyFour rip)) (A_WordConstant 84374)))), 7)"
    "fetch 0xca6a \<equiv> (Binary (IS_8088 Mov) (Reg (General ThirtyTwo rdx)) (Immediate SixtyFour (ImmVal 198)), 5)"
    "fetch 0xca6f \<equiv> (Binary (IS_8088 Lea) (Reg (General SixtyFour rsi)) (Storage (Memory SixtyFour (A_Plus (A_FromReg (General SixtyFour rip)) (A_WordConstant 82032)))), 7)"
    "fetch 0xca76 \<equiv> (Binary (IS_8088 Lea) (Reg (General SixtyFour rdi)) (Storage (Memory SixtyFour (A_Plus (A_FromReg (General SixtyFour rip)) (A_WordConstant 83155)))), 7)"
    "fetch 0xca7d \<equiv> (Unary (IS_8088 Call) (Immediate SixtyFour (ImmLabel ''__assert_fail'')), 5)"
    "fetch 0xca82 \<equiv> (Unary (IS_8088 Nop) (Storage (Memory Sixteen (A_SizeDirective 16 (A_Plus (A_FromReg (General SixtyFour cs)) (A_Plus (A_FromReg (General SixtyFour rax)) (A_Plus (A_Mult 1 (A_FromReg (General SixtyFour rax))) (A_WordConstant 0))))))), 11)"
    and \<alpha>_def: \<open>\<alpha> = \<lparr>text_sections = [], data_sections = [], labels_to_offsets = [], binary_offset = 0\<rparr>\<close>
    and assert_fail\<^sub>a\<^sub>d\<^sub>d\<^sub>r[simp]: \<open>the (label_to_address \<alpha> ''__assert_fail'') = assert_fail_addr\<close>
begin

text \<open>Using definitions that don't get unfolded immediately prevents locale argument issues.\<close>
definition \<open>assert_fail_0xca5e_retval \<equiv> assert_fail_0xca5e_retval\<^sub>v\<close>
definition \<open>assert_fail_0xca7d_retval \<equiv> assert_fail_0xca7d_retval\<^sub>v\<close>

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

locale "array_index" = "qemu_img_xen" +
  fixes RAX\<^sub>0\<^sub>v RCX\<^sub>0\<^sub>v RDX\<^sub>0\<^sub>v RDI\<^sub>0\<^sub>v RSI\<^sub>0\<^sub>v RSP\<^sub>0\<^sub>v ret_address\<^sub>v :: \<open>64 word\<close>
begin

text \<open>Using definitions that don't get unfolded immediately prevents locale argument issues.\<close>
definition \<open>RAX\<^sub>0 \<equiv> RAX\<^sub>0\<^sub>v\<close>
definition \<open>RCX\<^sub>0 \<equiv> RCX\<^sub>0\<^sub>v\<close>
definition \<open>RDX\<^sub>0 \<equiv> RDX\<^sub>0\<^sub>v\<close>
definition \<open>RDI\<^sub>0 \<equiv> RDI\<^sub>0\<^sub>v\<close>
definition \<open>RSI\<^sub>0 \<equiv> RSI\<^sub>0\<^sub>v\<close>
definition \<open>RSP\<^sub>0 \<equiv> RSP\<^sub>0\<^sub>v\<close>
definition \<open>ret_address \<equiv> ret_address\<^sub>v\<close>

definition P_0xca20_0 :: state_pred where
  \<open>P_0xca20_0 \<sigma> \<equiv> RIP \<sigma> = 0xca20 \<and> RAX \<sigma> = RAX\<^sub>0 \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = RDX\<^sub>0 \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = RSP\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address\<close>
declare P_0xca20_0_def[Ps]

definition P_0xca20_0_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0xca20_0_regions_set \<sigma> \<equiv> {
    (0, RDI\<^sub>0, 8),
    (1, RSP\<^sub>0, 8),
    (2, ((RDI\<^sub>0::64 word) + 0x10), 4)
  }\<close>

definition P_0xca20_0_regions :: state_pred where
  \<open>P_0xca20_0_regions \<sigma> \<equiv> \<exists>regions. P_0xca20_0_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0xca35_0 :: state_pred where
  \<open>Q_0xca35_0 \<sigma> \<equiv> RIP \<sigma> = 0xca35 \<and> RAX \<sigma> = (ucast ((((RSI\<^sub>0::64 word) - (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word))::64 word))::128 word) udiv (ucast (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x10),4]::32 word)::32 word))::64 word) \<and> RCX \<sigma> = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x10),4]::32 word)) \<and> RDX \<sigma> = (ucast ((((RSI\<^sub>0::64 word) - (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word))::64 word))::128 word) umod (ucast (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x10),4]::32 word)::32 word))::64 word) \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x8) \<and> (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) = (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x10),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x10),4]::32 word))\<close>
declare Q_0xca35_0_def[Qs]

schematic_goal array_index_0_7_0xca20_0xca32_0[blocks]:
  assumes \<open>(P_0xca20_0 && P_0xca20_0_regions) \<sigma>\<close>
  shows \<open>exec_block 7 0xca32 0 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0xca35_0 ?\<sigma> \<and> block_usage P_0xca20_0_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0xca20_0_def P_0xca20_0_regions_def post: Q_0xca35_0_def regionset: P_0xca20_0_regions_set_def)

definition P_0xca35_true_1 :: state_pred where
  \<open>P_0xca35_true_1 \<sigma> \<equiv> RIP \<sigma> = 0xca35 \<and> RAX \<sigma> = (ucast ((((RSI\<^sub>0::64 word) - (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word))::64 word))::128 word) udiv (ucast (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x10),4]::32 word)::32 word))::64 word) \<and> RCX \<sigma> = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x10),4]::32 word)) \<and> RDX \<sigma> = (ucast ((((RSI\<^sub>0::64 word) - (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word))::64 word))::128 word) umod (ucast (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x10),4]::32 word)::32 word))::64 word) \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x8) \<and> (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) = (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x10),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x10),4]::32 word))\<close>
declare P_0xca35_true_1_def[Ps]

definition P_0xca35_true_1_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0xca35_true_1_regions_set \<sigma> \<equiv> {
    (0, RDI\<^sub>0, 8),
    (1, RSP\<^sub>0, 8),
    (2, ((RDI\<^sub>0::64 word) + 0x10), 4)
  }\<close>

definition P_0xca35_true_1_regions :: state_pred where
  \<open>P_0xca35_true_1_regions \<sigma> \<equiv> \<exists>regions. P_0xca35_true_1_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0xca5e_1 :: state_pred where
  \<open>Q_0xca5e_1 \<sigma> \<equiv> RIP \<sigma> = 0xca5e \<and> RAX \<sigma> = (ucast ((((RSI\<^sub>0::64 word) - (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word))::64 word))::128 word) udiv (ucast (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x10),4]::32 word)::32 word))::64 word) \<and> RCX \<sigma> = 0x21400 \<and> RDX \<sigma> = 0xc5 \<and> RDI \<sigma> = 0x20f28 \<and> RSI \<sigma> = 0x20ae6 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x8) \<and> (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) = (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x10),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x10),4]::32 word))\<close>
declare Q_0xca5e_1_def[Qs]

schematic_goal array_index_0_5_0xca35_0xca57_1[blocks]:
  assumes \<open>(P_0xca35_true_1 && P_0xca35_true_1_regions && !ZF) \<sigma>\<close>
  shows \<open>exec_block 5 0xca57 (Suc 0) \<sigma> \<triangleq> ?\<sigma> \<and> Q_0xca5e_1 ?\<sigma> \<and> block_usage P_0xca35_true_1_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0xca35_true_1_def P_0xca35_true_1_regions_def post: Q_0xca5e_1_def regionset: P_0xca35_true_1_regions_set_def)

definition P_0xca5e_2 :: state_pred where
  \<open>P_0xca5e_2 \<sigma> \<equiv> RIP \<sigma> = 0xca5e \<and> RAX \<sigma> = (ucast ((((RSI\<^sub>0::64 word) - (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word))::64 word))::128 word) udiv (ucast (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x10),4]::32 word)::32 word))::64 word) \<and> RCX \<sigma> = 0x21400 \<and> RDX \<sigma> = 0xc5 \<and> RDI \<sigma> = 0x20f28 \<and> RSI \<sigma> = 0x20ae6 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x8) \<and> (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) = (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x10),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x10),4]::32 word))\<close>
declare P_0xca5e_2_def[Ps]

definition P_0xca5e_2_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0xca5e_2_regions_set \<sigma> \<equiv> {
    (0, RDI\<^sub>0, 8),
    (1, RSP\<^sub>0, 8),
    (2, ((RDI\<^sub>0::64 word) + 0x10), 4),
    (3, ((RSP\<^sub>0::64 word) - 0x10), 8)
  }\<close>

definition P_0xca5e_2_regions :: state_pred where
  \<open>P_0xca5e_2_regions \<sigma> \<equiv> \<exists>regions. P_0xca5e_2_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_assert_fail_addr_0xca5e_2 :: state_pred where
  \<open>Q_assert_fail_addr_0xca5e_2 \<sigma> \<equiv> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x10) \<and> RIP \<sigma> = assert_fail_addr \<and> RAX \<sigma> = (ucast ((((RSI\<^sub>0::64 word) - (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word))::64 word))::128 word) udiv (ucast (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x10),4]::32 word)::32 word))::64 word) \<and> (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) = (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x10),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x10),4]::32 word))\<close>
declare Q_assert_fail_addr_0xca5e_2_def[Qs]

schematic_goal array_index_0_1_0xca5e_0xca5e_2[blocks]:
  assumes \<open>(P_0xca5e_2 && P_0xca5e_2_regions) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0xca5e 2 \<sigma> \<triangleq> ?\<sigma> \<and> Q_assert_fail_addr_0xca5e_2 ?\<sigma> \<and> block_usage P_0xca5e_2_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0xca5e_2_def P_0xca5e_2_regions_def post: Q_assert_fail_addr_0xca5e_2_def regionset: P_0xca5e_2_regions_set_def)

definition P_0xca35_false_3 :: state_pred where
  \<open>P_0xca35_false_3 \<sigma> \<equiv> RIP \<sigma> = 0xca35 \<and> RAX \<sigma> = (ucast ((((RSI\<^sub>0::64 word) - (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word))::64 word))::128 word) udiv (ucast (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x10),4]::32 word)::32 word))::64 word) \<and> RCX \<sigma> = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x10),4]::32 word)) \<and> RDX \<sigma> = (ucast ((((RSI\<^sub>0::64 word) - (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word))::64 word))::128 word) umod (ucast (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x10),4]::32 word)::32 word))::64 word) \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x8) \<and> (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) = (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x10),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x10),4]::32 word))\<close>
declare P_0xca35_false_3_def[Ps]

definition P_0xca35_false_3_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0xca35_false_3_regions_set \<sigma> \<equiv> {
    (0, RDI\<^sub>0, 8),
    (1, RSP\<^sub>0, 8),
    (2, ((RDI\<^sub>0::64 word) + 0xc), 4),
    (3, ((RDI\<^sub>0::64 word) + 0x10), 4)
  }\<close>

definition P_0xca35_false_3_regions :: state_pred where
  \<open>P_0xca35_false_3_regions \<sigma> \<equiv> \<exists>regions. P_0xca35_false_3_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0xca3d_3 :: state_pred where
  \<open>Q_0xca3d_3 \<sigma> \<equiv> RIP \<sigma> = 0xca3d \<and> RAX \<sigma> = (ucast ((((RSI\<^sub>0::64 word) - (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word))::64 word))::128 word) udiv (ucast (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x10),4]::32 word)::32 word))::64 word) \<and> RCX \<sigma> = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x10),4]::32 word)) \<and> RDX \<sigma> = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0xc),4]::32 word)) \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x8) \<and> (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) = (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0xc),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0xc),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x10),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x10),4]::32 word))\<close>
declare Q_0xca3d_3_def[Qs]

schematic_goal array_index_0_3_0xca35_0xca3a_3[blocks]:
  assumes \<open>(P_0xca35_false_3 && P_0xca35_false_3_regions && ! !ZF) \<sigma>\<close>
  shows \<open>exec_block 3 0xca3a 3 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0xca3d_3 ?\<sigma> \<and> block_usage P_0xca35_false_3_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0xca35_false_3_def P_0xca35_false_3_regions_def post: Q_0xca3d_3_def regionset: P_0xca35_false_3_regions_set_def)

definition P_0xca3d_true_4 :: state_pred where
  \<open>P_0xca3d_true_4 \<sigma> \<equiv> RIP \<sigma> = 0xca3d \<and> RAX \<sigma> = (ucast ((((RSI\<^sub>0::64 word) - (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word))::64 word))::128 word) udiv (ucast (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x10),4]::32 word)::32 word))::64 word) \<and> RCX \<sigma> = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x10),4]::32 word)) \<and> RDX \<sigma> = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0xc),4]::32 word)) \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x8) \<and> (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) = (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0xc),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0xc),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x10),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x10),4]::32 word))\<close>
declare P_0xca3d_true_4_def[Ps]

definition P_0xca3d_true_4_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0xca3d_true_4_regions_set \<sigma> \<equiv> {
    (0, RDI\<^sub>0, 8),
    (1, RSP\<^sub>0, 8),
    (2, ((RDI\<^sub>0::64 word) + 0xc), 4),
    (3, ((RDI\<^sub>0::64 word) + 0x10), 4)
  }\<close>

definition P_0xca3d_true_4_regions :: state_pred where
  \<open>P_0xca3d_true_4_regions \<sigma> \<equiv> \<exists>regions. P_0xca3d_true_4_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0xca7d_4 :: state_pred where
  \<open>Q_0xca7d_4 \<sigma> \<equiv> RIP \<sigma> = 0xca7d \<and> RAX \<sigma> = (ucast ((((RSI\<^sub>0::64 word) - (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word))::64 word))::128 word) udiv (ucast (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x10),4]::32 word)::32 word))::64 word) \<and> RCX \<sigma> = 0x21400 \<and> RDX \<sigma> = 0xc6 \<and> RDI \<sigma> = 0x20f50 \<and> RSI \<sigma> = 0x20ae6 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x8) \<and> (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) = (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0xc),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0xc),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x10),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x10),4]::32 word))\<close>
declare Q_0xca7d_4_def[Qs]

schematic_goal array_index_0_5_0xca3d_0xca76_4[blocks]:
  assumes \<open>(P_0xca3d_true_4 && P_0xca3d_true_4_regions && !CF) \<sigma>\<close>
  shows \<open>exec_block 5 0xca76 4 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0xca7d_4 ?\<sigma> \<and> block_usage P_0xca3d_true_4_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0xca3d_true_4_def P_0xca3d_true_4_regions_def post: Q_0xca7d_4_def regionset: P_0xca3d_true_4_regions_set_def)

definition P_0xca7d_5 :: state_pred where
  \<open>P_0xca7d_5 \<sigma> \<equiv> RIP \<sigma> = 0xca7d \<and> RAX \<sigma> = (ucast ((((RSI\<^sub>0::64 word) - (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word))::64 word))::128 word) udiv (ucast (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x10),4]::32 word)::32 word))::64 word) \<and> RCX \<sigma> = 0x21400 \<and> RDX \<sigma> = 0xc6 \<and> RDI \<sigma> = 0x20f50 \<and> RSI \<sigma> = 0x20ae6 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x8) \<and> (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) = (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0xc),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0xc),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x10),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x10),4]::32 word))\<close>
declare P_0xca7d_5_def[Ps]

definition P_0xca7d_5_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0xca7d_5_regions_set \<sigma> \<equiv> {
    (0, RDI\<^sub>0, 8),
    (1, RSP\<^sub>0, 8),
    (2, ((RDI\<^sub>0::64 word) + 0xc), 4),
    (3, ((RDI\<^sub>0::64 word) + 0x10), 4),
    (4, ((RSP\<^sub>0::64 word) - 0x10), 8)
  }\<close>

definition P_0xca7d_5_regions :: state_pred where
  \<open>P_0xca7d_5_regions \<sigma> \<equiv> \<exists>regions. P_0xca7d_5_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_assert_fail_addr_0xca7d_5 :: state_pred where
  \<open>Q_assert_fail_addr_0xca7d_5 \<sigma> \<equiv> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x10) \<and> RIP \<sigma> = assert_fail_addr \<and> RAX \<sigma> = (ucast ((((RSI\<^sub>0::64 word) - (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word))::64 word))::128 word) udiv (ucast (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x10),4]::32 word)::32 word))::64 word) \<and> (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) = (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x10),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x10),4]::32 word))\<close>
declare Q_assert_fail_addr_0xca7d_5_def[Qs]

schematic_goal array_index_0_1_0xca7d_0xca7d_5[blocks]:
  assumes \<open>(P_0xca7d_5 && P_0xca7d_5_regions) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0xca7d 5 \<sigma> \<triangleq> ?\<sigma> \<and> Q_assert_fail_addr_0xca7d_5 ?\<sigma> \<and> block_usage P_0xca7d_5_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0xca7d_5_def P_0xca7d_5_regions_def post: Q_assert_fail_addr_0xca7d_5_def regionset: P_0xca7d_5_regions_set_def)

definition P_0xca3d_false_6 :: state_pred where
  \<open>P_0xca3d_false_6 \<sigma> \<equiv> RIP \<sigma> = 0xca3d \<and> RAX \<sigma> = (ucast ((((RSI\<^sub>0::64 word) - (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word))::64 word))::128 word) udiv (ucast (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x10),4]::32 word)::32 word))::64 word) \<and> RCX \<sigma> = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x10),4]::32 word)) \<and> RDX \<sigma> = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0xc),4]::32 word)) \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x8) \<and> (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) = (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0xc),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0xc),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x10),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x10),4]::32 word))\<close>
declare P_0xca3d_false_6_def[Ps]

definition P_0xca3d_false_6_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0xca3d_false_6_regions_set \<sigma> \<equiv> {
    (0, RDI\<^sub>0, 8),
    (1, RSP\<^sub>0, 8),
    (2, ((RDI\<^sub>0::64 word) + 0xc), 4),
    (3, ((RDI\<^sub>0::64 word) + 0x10), 4)
  }\<close>

definition P_0xca3d_false_6_regions :: state_pred where
  \<open>P_0xca3d_false_6_regions \<sigma> \<equiv> \<exists>regions. P_0xca3d_false_6_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_ret_address_6 :: state_pred where
  \<open>Q_ret_address_6 \<sigma> \<equiv> RIP \<sigma> = ret_address \<and> (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) = (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x10),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x10),4]::32 word))\<close>
declare Q_ret_address_6_def[Qs]

schematic_goal array_index_0_3_0xca3d_0xca43_6[blocks]:
  assumes \<open>(P_0xca3d_false_6 && P_0xca3d_false_6_regions && ! !CF) \<sigma>\<close>
  shows \<open>exec_block 3 0xca43 6 \<sigma> \<triangleq> ?\<sigma> \<and> Q_ret_address_6 ?\<sigma> \<and> block_usage P_0xca3d_false_6_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0xca3d_false_6_def P_0xca3d_false_6_regions_def post: Q_ret_address_6_def regionset: P_0xca3d_false_6_regions_set_def)

definition array_index_acode :: ACode where
  \<open>array_index_acode =
    Block 7 0xca32 0;
    IF !ZF THEN
      Block 5 0xca57 (Suc 0);
      Block (Suc 0) 0xca5e 2;
      CALL assert_fail_acode
    ELSE
      Block 3 0xca3a 3;
      IF !CF THEN
        Block 5 0xca76 4;
        Block (Suc 0) 0xca7d 5;
        CALL assert_fail_acode
      ELSE
        Block 3 0xca43 6
      FI
    FI
  \<close>

schematic_goal "array_index":
  assumes
    \<open>\<forall>\<sigma>. RIP \<sigma> = 0xca35 \<longrightarrow> P_0xca35_true_1_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0xca5e \<longrightarrow> P_0xca5e_2_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0xca35 \<longrightarrow> P_0xca35_false_3_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0xca3d \<longrightarrow> P_0xca3d_true_4_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0xca7d \<longrightarrow> P_0xca7d_5_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0xca3d \<longrightarrow> P_0xca3d_false_6_regions \<sigma>\<close>
    and [blocks]: \<open>{{Q_assert_fail_addr_0xca5e_2}} \<box>assert_fail_acode {{Q_fail;M_0xca5e}}\<close>
    and [blocks]: \<open>{{Q_assert_fail_addr_0xca7d_5}} \<box>assert_fail_acode {{Q_fail;M_0xca7d}}\<close>
  shows \<open>{{?P}} array_index_acode {{?Q;?M}}\<close>
  by (vcg acode: array_index_acode_def assms: assms)

end
