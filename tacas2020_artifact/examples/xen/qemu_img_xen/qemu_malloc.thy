theory qemu_malloc
  imports "../../../isabelle/VCG/HTriple"
begin



locale "qemu_img_xen" = execution_context + exec_code +
  fixes abort_0x3710_retval\<^sub>v malloc_0x5974_retval\<^sub>v abort_addr malloc_addr :: \<open>64 word\<close>
    and abort_acode malloc_acode :: ACode
  assumes fetch:
    "fetch 0x3710 \<equiv> (Unary (IS_8088 Call) (Immediate SixtyFour (ImmLabel ''abort'')), 5)"
    "fetch 0x5970 \<equiv> (Binary (IS_8088 Sub) (Reg (General SixtyFour rsp)) (Immediate SixtyFour (ImmVal 8)), 4)"
    "fetch 0x5974 \<equiv> (Unary (IS_8088 Call) (Immediate SixtyFour (ImmLabel ''malloc'')), 5)"
    "fetch 0x5979 \<equiv> (Binary (IS_8088 Test) (Reg (General SixtyFour rax)) (Storage (Reg (General SixtyFour rax))), 3)"
    "fetch 0x597c \<equiv> (Unary (IS_8088 Je) (Immediate SixtyFour (ImmVal 14096)), 6)"
    "fetch 0x5982 \<equiv> (Binary (IS_8088 Add) (Reg (General SixtyFour rsp)) (Immediate SixtyFour (ImmVal 8)), 4)"
    "fetch 0x5986 \<equiv> (Nullary (IS_8088 Ret), 1)"
    and \<alpha>_def: \<open>\<alpha> = \<lparr>text_sections = [], data_sections = [], labels_to_offsets = [], binary_offset = 0\<rparr>\<close>
    and abort\<^sub>a\<^sub>d\<^sub>d\<^sub>r[simp]: \<open>the (label_to_address \<alpha> ''abort'') = abort_addr\<close>
    and malloc\<^sub>a\<^sub>d\<^sub>d\<^sub>r[simp]: \<open>the (label_to_address \<alpha> ''malloc'') = malloc_addr\<close>
begin

text \<open>Using definitions that don't get unfolded immediately prevents locale argument issues.\<close>
definition \<open>abort_0x3710_retval \<equiv> abort_0x3710_retval\<^sub>v\<close>
definition \<open>malloc_0x5974_retval \<equiv> malloc_0x5974_retval\<^sub>v\<close>

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
  auto simp: block_usage_def eq_def setcc_def simp_rules Let'_def read_region'_def write_block'_def get'_def set'_def post regionset

method vcg_step uses assms =
  ((rule htriples)+, rule blocks)+,
  (simp add: assms pred_logic Ps Qs)?,
  (((auto simp: eq_def)[])+)?

method vcg uses acode assms =
  subst acode,
  (vcg_step assms: assms)+

end

locale "qemu_malloc_cold_0" = "qemu_img_xen" +
  fixes RAX\<^sub>0\<^sub>v RSP\<^sub>0\<^sub>v ret_address\<^sub>v :: \<open>64 word\<close>
begin

text \<open>Using definitions that don't get unfolded immediately prevents locale argument issues.\<close>
definition \<open>RAX\<^sub>0 \<equiv> RAX\<^sub>0\<^sub>v\<close>
definition \<open>RSP\<^sub>0 \<equiv> RSP\<^sub>0\<^sub>v\<close>
definition \<open>ret_address \<equiv> ret_address\<^sub>v\<close>

definition P_0x3710_0 :: state_pred where
  \<open>P_0x3710_0 \<sigma> \<equiv> RIP \<sigma> = 0x3710 \<and> RAX \<sigma> = RAX\<^sub>0 \<and> RSP \<sigma> = RSP\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address\<close>
declare P_0x3710_0_def[Ps]

definition P_0x3710_0_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x3710_0_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((RSP\<^sub>0::64 word) - 0x8), 8)
  }\<close>

definition P_0x3710_0_regions :: state_pred where
  \<open>P_0x3710_0_regions \<sigma> \<equiv> \<exists>regions. P_0x3710_0_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_abort_addr_0x3710_0 :: state_pred where
  \<open>Q_abort_addr_0x3710_0 \<sigma> \<equiv> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x8) \<and> RIP \<sigma> = abort_addr \<and> RAX \<sigma> = RAX\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = 0x3715\<close>
declare Q_abort_addr_0x3710_0_def[Qs]

schematic_goal qemu_malloc_cold_0_0_1_0x3710_0x3710_0[blocks]:
  assumes \<open>(P_0x3710_0 && P_0x3710_0_regions) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x3710 0 \<sigma> \<triangleq> ?\<sigma> \<and> Q_abort_addr_0x3710_0 ?\<sigma> \<and> block_usage P_0x3710_0_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x3710_0_def P_0x3710_0_regions_def post: Q_abort_addr_0x3710_0_def regionset: P_0x3710_0_regions_set_def)

definition qemu_malloc_cold_0_acode :: ACode where
  \<open>qemu_malloc_cold_0_acode =
    Block (Suc 0) 0x3710 0;
    CALL abort_acode
  \<close>

schematic_goal "qemu_malloc_cold_0":
  assumes
    [blocks]: \<open>{{Q_abort_addr_0x3710_0}} \<box>abort_acode {{Q_fail;M_0x3710}}\<close>
  shows \<open>{{?P}} qemu_malloc_cold_0_acode {{?Q;?M}}\<close>
  by (vcg acode: qemu_malloc_cold_0_acode_def assms: assms)

end

locale "qemu_malloc" = "qemu_img_xen" +
  fixes RAX\<^sub>0\<^sub>v RSP\<^sub>0\<^sub>v ret_address\<^sub>v :: \<open>64 word\<close>
begin

text \<open>Using definitions that don't get unfolded immediately prevents locale argument issues.\<close>
definition \<open>RAX\<^sub>0 \<equiv> RAX\<^sub>0\<^sub>v\<close>
definition \<open>RSP\<^sub>0 \<equiv> RSP\<^sub>0\<^sub>v\<close>
definition \<open>ret_address \<equiv> ret_address\<^sub>v\<close>

definition P_0x5970_0 :: state_pred where
  \<open>P_0x5970_0 \<sigma> \<equiv> RIP \<sigma> = 0x5970 \<and> RAX \<sigma> = RAX\<^sub>0 \<and> RSP \<sigma> = RSP\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address\<close>
declare P_0x5970_0_def[Ps]

definition P_0x5970_0_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x5970_0_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8)
  }\<close>

definition P_0x5970_0_regions :: state_pred where
  \<open>P_0x5970_0_regions \<sigma> \<equiv> \<exists>regions. P_0x5970_0_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x5974_0 :: state_pred where
  \<open>Q_0x5974_0 \<sigma> \<equiv> RIP \<sigma> = 0x5974 \<and> RAX \<sigma> = RAX\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x8) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address\<close>
declare Q_0x5974_0_def[Qs]

schematic_goal qemu_malloc_0_1_0x5970_0x5970_0[blocks]:
  assumes \<open>(P_0x5970_0 && P_0x5970_0_regions) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x5970 0 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x5974_0 ?\<sigma> \<and> block_usage P_0x5970_0_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x5970_0_def P_0x5970_0_regions_def post: Q_0x5974_0_def regionset: P_0x5970_0_regions_set_def)

definition P_0x5974_1 :: state_pred where
  \<open>P_0x5974_1 \<sigma> \<equiv> RIP \<sigma> = 0x5974 \<and> RAX \<sigma> = RAX\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x8) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address\<close>
declare P_0x5974_1_def[Ps]

definition P_0x5974_1_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x5974_1_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((RSP\<^sub>0::64 word) - 0x10), 8)
  }\<close>

definition P_0x5974_1_regions :: state_pred where
  \<open>P_0x5974_1_regions \<sigma> \<equiv> \<exists>regions. P_0x5974_1_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_malloc_addr_0x5974_1 :: state_pred where
  \<open>Q_malloc_addr_0x5974_1 \<sigma> \<equiv> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x10) \<and> RIP \<sigma> = malloc_addr \<and> RAX \<sigma> = RAX\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = 0x5979\<close>
declare Q_malloc_addr_0x5974_1_def[Qs]

schematic_goal qemu_malloc_0_1_0x5974_0x5974_1[blocks]:
  assumes \<open>(P_0x5974_1 && P_0x5974_1_regions) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x5974 (Suc 0) \<sigma> \<triangleq> ?\<sigma> \<and> Q_malloc_addr_0x5974_1 ?\<sigma> \<and> block_usage P_0x5974_1_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x5974_1_def P_0x5974_1_regions_def post: Q_malloc_addr_0x5974_1_def regionset: P_0x5974_1_regions_set_def)

definition P_0x5979_2 :: state_pred where
  \<open>P_0x5979_2 \<sigma> \<equiv> RIP \<sigma> = 0x5979 \<and> RAX \<sigma> = malloc_0x5974_retval \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x8) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = 0x5979\<close>
declare P_0x5979_2_def[Ps]

definition P_0x5979_2_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x5979_2_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((RSP\<^sub>0::64 word) - 0x10), 8)
  }\<close>

definition P_0x5979_2_regions :: state_pred where
  \<open>P_0x5979_2_regions \<sigma> \<equiv> \<exists>regions. P_0x5979_2_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x597c_2 :: state_pred where
  \<open>Q_0x597c_2 \<sigma> \<equiv> RIP \<sigma> = 0x597c \<and> RAX \<sigma> = malloc_0x5974_retval \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x8) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = 0x5979\<close>
declare Q_0x597c_2_def[Qs]

schematic_goal qemu_malloc_0_1_0x5979_0x5979_2[blocks]:
  assumes \<open>(P_0x5979_2 && P_0x5979_2_regions) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x5979 2 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x597c_2 ?\<sigma> \<and> block_usage P_0x5979_2_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x5979_2_def P_0x5979_2_regions_def post: Q_0x597c_2_def regionset: P_0x5979_2_regions_set_def)

definition P_0x597c_true_3 :: state_pred where
  \<open>P_0x597c_true_3 \<sigma> \<equiv> RIP \<sigma> = 0x597c \<and> RAX \<sigma> = malloc_0x5974_retval \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x8) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = 0x5979\<close>
declare P_0x597c_true_3_def[Ps]

definition P_0x597c_true_3_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x597c_true_3_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((RSP\<^sub>0::64 word) - 0x10), 8)
  }\<close>

definition P_0x597c_true_3_regions :: state_pred where
  \<open>P_0x597c_true_3_regions \<sigma> \<equiv> \<exists>regions. P_0x597c_true_3_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x3710_3 :: state_pred where
  \<open>Q_0x3710_3 \<sigma> \<equiv> RIP \<sigma> = 0x3710 \<and> RAX \<sigma> = malloc_0x5974_retval \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x8) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = 0x5979\<close>
declare Q_0x3710_3_def[Qs]

schematic_goal qemu_malloc_0_1_0x597c_0x597c_3[blocks]:
  assumes \<open>(P_0x597c_true_3 && P_0x597c_true_3_regions && ZF) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x597c 3 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x3710_3 ?\<sigma> \<and> block_usage P_0x597c_true_3_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x597c_true_3_def P_0x597c_true_3_regions_def post: Q_0x3710_3_def regionset: P_0x597c_true_3_regions_set_def)

definition P_0x3710_4 :: state_pred where
  \<open>P_0x3710_4 \<sigma> \<equiv> RIP \<sigma> = 0x3710 \<and> RAX \<sigma> = malloc_0x5974_retval \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x8) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = 0x5979\<close>
declare P_0x3710_4_def[Ps]

definition P_0x3710_4_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x3710_4_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((RSP\<^sub>0::64 word) - 0x10), 8)
  }\<close>

definition P_0x3710_4_regions :: state_pred where
  \<open>P_0x3710_4_regions \<sigma> \<equiv> \<exists>regions. P_0x3710_4_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_abort_addr_0x3710_4 :: state_pred where
  \<open>Q_abort_addr_0x3710_4 \<sigma> \<equiv> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x10) \<and> RIP \<sigma> = abort_addr \<and> RAX \<sigma> = malloc_0x5974_retval \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address\<close>
declare Q_abort_addr_0x3710_4_def[Qs]

schematic_goal qemu_malloc_0_1_0x3710_0x3710_4[blocks]:
  assumes \<open>(P_0x3710_4 && P_0x3710_4_regions) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x3710 4 \<sigma> \<triangleq> ?\<sigma> \<and> Q_abort_addr_0x3710_4 ?\<sigma> \<and> block_usage P_0x3710_4_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x3710_4_def P_0x3710_4_regions_def post: Q_abort_addr_0x3710_4_def regionset: P_0x3710_4_regions_set_def)

definition P_0x597c_false_5 :: state_pred where
  \<open>P_0x597c_false_5 \<sigma> \<equiv> RIP \<sigma> = 0x597c \<and> RAX \<sigma> = malloc_0x5974_retval \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x8) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = 0x5979\<close>
declare P_0x597c_false_5_def[Ps]

definition P_0x597c_false_5_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x597c_false_5_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((RSP\<^sub>0::64 word) - 0x10), 8)
  }\<close>

definition P_0x597c_false_5_regions :: state_pred where
  \<open>P_0x597c_false_5_regions \<sigma> \<equiv> \<exists>regions. P_0x597c_false_5_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_ret_address_5 :: state_pred where
  \<open>Q_ret_address_5 \<sigma> \<equiv> RIP \<sigma> = ret_address \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address\<close>
declare Q_ret_address_5_def[Qs]

schematic_goal qemu_malloc_0_3_0x597c_0x5986_5[blocks]:
  assumes \<open>(P_0x597c_false_5 && P_0x597c_false_5_regions && ! ZF) \<sigma>\<close>
  shows \<open>exec_block 3 0x5986 5 \<sigma> \<triangleq> ?\<sigma> \<and> Q_ret_address_5 ?\<sigma> \<and> block_usage P_0x597c_false_5_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x597c_false_5_def P_0x597c_false_5_regions_def post: Q_ret_address_5_def regionset: P_0x597c_false_5_regions_set_def)

definition qemu_malloc_acode :: ACode where
  \<open>qemu_malloc_acode =
    Block (Suc 0) 0x5970 0;
    Block (Suc 0) 0x5974 (Suc 0);
    CALL malloc_acode;
    Block (Suc 0) 0x5979 2;
    IF ZF THEN
      Block (Suc 0) 0x597c 3;
      Block (Suc 0) 0x3710 4;
      CALL abort_acode
    ELSE
      Block 3 0x5986 5
    FI
  \<close>

schematic_goal "qemu_malloc":
  assumes
    \<open>\<forall>\<sigma>. RIP \<sigma> = 0x5974 \<longrightarrow> P_0x5974_1_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x5979 \<longrightarrow> P_0x5979_2_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x597c \<longrightarrow> P_0x597c_true_3_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x3710 \<longrightarrow> P_0x3710_4_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x597c \<longrightarrow> P_0x597c_false_5_regions \<sigma>\<close>
    and [blocks]: \<open>{{Q_malloc_addr_0x5974_1}} \<box>malloc_acode {{P_0x5979_2;M_0x5974}}\<close>
    and [blocks]: \<open>{{Q_abort_addr_0x3710_4}} \<box>abort_acode {{Q_fail;M_0x3710}}\<close>
  shows \<open>{{?P}} qemu_malloc_acode {{?Q;?M}}\<close>
  by (vcg acode: qemu_malloc_acode_def assms: assms)

end
