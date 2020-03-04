theory qemu_strdup
  imports
    "../../../isabelle/VCG/HTriple"
begin

locale "qemu_img_xen" = execution_context + exec_code +
  fixes abort_0x371f_retval\<^sub>v strlen_0x59e9_retval\<^sub>v malloc_0x59f5_retval\<^sub>v memcpy_0x5a0c_retval\<^sub>v abort_addr malloc_addr memcpy_addr strlen_addr :: \<open>64 word\<close>
    and abort_acode malloc_acode memcpy_acode strlen_acode :: ACode
  assumes fetch:
    "fetch 0x371f \<equiv> (Unary (IS_8088 Call) (Immediate SixtyFour (ImmLabel ''abort'')), 5)"
    "fetch 0x59e0 \<equiv> (Unary (IS_8088 Push) (Storage (Reg (General SixtyFour rbp))), 1)"
    "fetch 0x59e1 \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour rbp)) (Storage (Reg (General SixtyFour rdi))), 3)"
    "fetch 0x59e4 \<equiv> (Unary (IS_8088 Push) (Storage (Reg (General SixtyFour rbx))), 1)"
    "fetch 0x59e5 \<equiv> (Binary (IS_8088 Sub) (Reg (General SixtyFour rsp)) (Immediate SixtyFour (ImmVal 8)), 4)"
    "fetch 0x59e9 \<equiv> (Unary (IS_8088 Call) (Immediate SixtyFour (ImmLabel ''strlen'')), 5)"
    "fetch 0x59ee \<equiv> (Binary (IS_8088 Lea) (Reg (General SixtyFour rbx)) (Storage (Memory SixtyFour (A_Plus (A_FromReg (General SixtyFour rax)) (A_WordConstant 1)))), 4)"
    "fetch 0x59f2 \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour rdi)) (Storage (Reg (General SixtyFour rbx))), 3)"
    "fetch 0x59f5 \<equiv> (Unary (IS_8088 Call) (Immediate SixtyFour (ImmLabel ''malloc'')), 5)"
    "fetch 0x59fa \<equiv> (Binary (IS_8088 Test) (Reg (General SixtyFour rax)) (Storage (Reg (General SixtyFour rax))), 3)"
    "fetch 0x59fd \<equiv> (Unary (IS_8088 Je) (Immediate SixtyFour (ImmVal 14111)), 6)"
    "fetch 0x5a03 \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour rdx)) (Storage (Reg (General SixtyFour rbx))), 3)"
    "fetch 0x5a06 \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour rsi)) (Storage (Reg (General SixtyFour rbp))), 3)"
    "fetch 0x5a09 \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour rdi)) (Storage (Reg (General SixtyFour rax))), 3)"
    "fetch 0x5a0c \<equiv> (Unary (IS_8088 Call) (Immediate SixtyFour (ImmLabel ''memcpy'')), 5)"
    "fetch 0x5a11 \<equiv> (Binary (IS_8088 Add) (Reg (General SixtyFour rsp)) (Immediate SixtyFour (ImmVal 8)), 4)"
    "fetch 0x5a15 \<equiv> (Unary (IS_8088 Pop) (Storage (Reg (General SixtyFour rbx))), 1)"
    "fetch 0x5a16 \<equiv> (Unary (IS_8088 Pop) (Storage (Reg (General SixtyFour rbp))), 1)"
    "fetch 0x5a17 \<equiv> (Nullary (IS_8088 Ret), 1)"
    and \<alpha>_def: \<open>\<alpha> = \<lparr>text_sections = [], data_sections = [], labels_to_offsets = [], binary_offset = 0\<rparr>\<close>
    and abort\<^sub>a\<^sub>d\<^sub>d\<^sub>r[simp]: \<open>the (label_to_address \<alpha> ''abort'') = abort_addr\<close>
    and malloc\<^sub>a\<^sub>d\<^sub>d\<^sub>r[simp]: \<open>the (label_to_address \<alpha> ''malloc'') = malloc_addr\<close>
    and memcpy\<^sub>a\<^sub>d\<^sub>d\<^sub>r[simp]: \<open>the (label_to_address \<alpha> ''memcpy'') = memcpy_addr\<close>
    and strlen\<^sub>a\<^sub>d\<^sub>d\<^sub>r[simp]: \<open>the (label_to_address \<alpha> ''strlen'') = strlen_addr\<close>
begin

text \<open>Using definitions that don't get unfolded immediately prevents locale argument issues.\<close>
definition \<open>abort_0x371f_retval \<equiv> abort_0x371f_retval\<^sub>v\<close>
definition \<open>strlen_0x59e9_retval \<equiv> strlen_0x59e9_retval\<^sub>v\<close>
definition \<open>malloc_0x59f5_retval \<equiv> malloc_0x59f5_retval\<^sub>v\<close>
definition \<open>memcpy_0x5a0c_retval \<equiv> memcpy_0x5a0c_retval\<^sub>v\<close>

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

method vcg_while for P :: state_pred uses assms =
  (rule htriples)+,
  rule HTriple_weaken[where P=P],
  simp add: pred_logic Ps Qs assms,
  rule HTriple_while

method vcg uses acode assms =
  subst acode,
  (vcg_step assms: assms)+

end

locale "qemu_strdup_cold_3" = "qemu_img_xen" +
  fixes RAX\<^sub>0\<^sub>v RSP\<^sub>0\<^sub>v ret_address\<^sub>v :: \<open>64 word\<close>
begin

text \<open>Using definitions that don't get unfolded immediately prevents locale argument issues.\<close>
definition \<open>RAX\<^sub>0 \<equiv> RAX\<^sub>0\<^sub>v\<close>
definition \<open>RSP\<^sub>0 \<equiv> RSP\<^sub>0\<^sub>v\<close>
definition \<open>ret_address \<equiv> ret_address\<^sub>v\<close>

definition P_0x371f_0 :: state_pred where
  \<open>P_0x371f_0 \<sigma> \<equiv> RIP \<sigma> = 0x371f \<and> RAX \<sigma> = RAX\<^sub>0 \<and> RSP \<sigma> = RSP\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address\<close>
declare P_0x371f_0_def[Ps]

definition P_0x371f_0_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x371f_0_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((RSP\<^sub>0::64 word) - 0x8), 8)
  }\<close>

definition P_0x371f_0_regions :: state_pred where
  \<open>P_0x371f_0_regions \<sigma> \<equiv> \<exists>regions. P_0x371f_0_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_abort_addr_0x371f_0 :: state_pred where
  \<open>Q_abort_addr_0x371f_0 \<sigma> \<equiv> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x8) \<and> RIP \<sigma> = abort_addr \<and> RAX \<sigma> = RAX\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = 0x3724\<close>
declare Q_abort_addr_0x371f_0_def[Qs]

schematic_goal qemu_strdup_cold_3_0_1_0x371f_0x371f_0[blocks]:
  assumes \<open>(P_0x371f_0 && P_0x371f_0_regions) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x371f 0 \<sigma> \<triangleq> ?\<sigma> \<and> Q_abort_addr_0x371f_0 ?\<sigma> \<and> block_usage P_0x371f_0_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x371f_0_def P_0x371f_0_regions_def post: Q_abort_addr_0x371f_0_def regionset: P_0x371f_0_regions_set_def)

definition qemu_strdup_cold_3_acode :: ACode where
  \<open>qemu_strdup_cold_3_acode =
    Block (Suc 0) 0x371f 0;
    CALL abort_acode
  \<close>

schematic_goal "qemu_strdup_cold_3":
  assumes
    [blocks]: \<open>{{Q_abort_addr_0x371f_0}} \<box>abort_acode {{Q_fail;M_0x371f}}\<close>
  shows \<open>{{?P}} qemu_strdup_cold_3_acode {{?Q;?M}}\<close>
  by (vcg acode: qemu_strdup_cold_3_acode_def assms: assms)

end

locale "qemu_strdup" = "qemu_img_xen" +
  fixes RAX\<^sub>0\<^sub>v RBX\<^sub>0\<^sub>v RDX\<^sub>0\<^sub>v RDI\<^sub>0\<^sub>v RSI\<^sub>0\<^sub>v RSP\<^sub>0\<^sub>v RBP\<^sub>0\<^sub>v ret_address\<^sub>v :: \<open>64 word\<close>
begin

text \<open>Using definitions that don't get unfolded immediately prevents locale argument issues.\<close>
definition \<open>RAX\<^sub>0 \<equiv> RAX\<^sub>0\<^sub>v\<close>
definition \<open>RBX\<^sub>0 \<equiv> RBX\<^sub>0\<^sub>v\<close>
definition \<open>RDX\<^sub>0 \<equiv> RDX\<^sub>0\<^sub>v\<close>
definition \<open>RDI\<^sub>0 \<equiv> RDI\<^sub>0\<^sub>v\<close>
definition \<open>RSI\<^sub>0 \<equiv> RSI\<^sub>0\<^sub>v\<close>
definition \<open>RSP\<^sub>0 \<equiv> RSP\<^sub>0\<^sub>v\<close>
definition \<open>RBP\<^sub>0 \<equiv> RBP\<^sub>0\<^sub>v\<close>
definition \<open>ret_address \<equiv> ret_address\<^sub>v\<close>

definition P_0x59e0_0 :: state_pred where
  \<open>P_0x59e0_0 \<sigma> \<equiv> RIP \<sigma> = 0x59e0 \<and> RAX \<sigma> = RAX\<^sub>0 \<and> RBX \<sigma> = RBX\<^sub>0 \<and> RDX \<sigma> = RDX\<^sub>0 \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = RSP\<^sub>0 \<and> RBP \<sigma> = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address\<close>
declare P_0x59e0_0_def[Ps]

definition P_0x59e0_0_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x59e0_0_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (2, ((RSP\<^sub>0::64 word) - 0x10), 8)
  }\<close>

definition P_0x59e0_0_regions :: state_pred where
  \<open>P_0x59e0_0_regions \<sigma> \<equiv> \<exists>regions. P_0x59e0_0_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x59e9_0 :: state_pred where
  \<open>Q_0x59e9_0 \<sigma> \<equiv> RIP \<sigma> = 0x59e9 \<and> RAX \<sigma> = RAX\<^sub>0 \<and> RBX \<sigma> = RBX\<^sub>0 \<and> RDX \<sigma> = RDX\<^sub>0 \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x18) \<and> RBP \<sigma> = RDI\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = RBX\<^sub>0\<close>
declare Q_0x59e9_0_def[Qs]

schematic_goal qemu_strdup_0_4_0x59e0_0x59e5_0[blocks]:
  assumes \<open>(P_0x59e0_0 && P_0x59e0_0_regions) \<sigma>\<close>
  shows \<open>exec_block 4 0x59e5 0 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x59e9_0 ?\<sigma> \<and> block_usage P_0x59e0_0_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x59e0_0_def P_0x59e0_0_regions_def post: Q_0x59e9_0_def regionset: P_0x59e0_0_regions_set_def)

definition P_0x59e9_1 :: state_pred where
  \<open>P_0x59e9_1 \<sigma> \<equiv> RIP \<sigma> = 0x59e9 \<and> RAX \<sigma> = RAX\<^sub>0 \<and> RBX \<sigma> = RBX\<^sub>0 \<and> RDX \<sigma> = RDX\<^sub>0 \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x18) \<and> RBP \<sigma> = RDI\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = RBX\<^sub>0\<close>
declare P_0x59e9_1_def[Ps]

definition P_0x59e9_1_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x59e9_1_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (2, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x20), 8)
  }\<close>

definition P_0x59e9_1_regions :: state_pred where
  \<open>P_0x59e9_1_regions \<sigma> \<equiv> \<exists>regions. P_0x59e9_1_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_strlen_addr_0x59e9_1 :: state_pred where
  \<open>Q_strlen_addr_0x59e9_1 \<sigma> \<equiv> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x20) \<and> RIP \<sigma> = strlen_addr \<and> RAX \<sigma> = RAX\<^sub>0 \<and> RBX \<sigma> = RBX\<^sub>0 \<and> RDX \<sigma> = RDX\<^sub>0 \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RBP \<sigma> = RDI\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = 0x59ee\<close>
declare Q_strlen_addr_0x59e9_1_def[Qs]

schematic_goal qemu_strdup_0_1_0x59e9_0x59e9_1[blocks]:
  assumes \<open>(P_0x59e9_1 && P_0x59e9_1_regions) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x59e9 (Suc 0) \<sigma> \<triangleq> ?\<sigma> \<and> Q_strlen_addr_0x59e9_1 ?\<sigma> \<and> block_usage P_0x59e9_1_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x59e9_1_def P_0x59e9_1_regions_def post: Q_strlen_addr_0x59e9_1_def regionset: P_0x59e9_1_regions_set_def)

definition P_0x59ee_2 :: state_pred where
  \<open>P_0x59ee_2 \<sigma> \<equiv> RIP \<sigma> = 0x59ee \<and> RAX \<sigma> = strlen_0x59e9_retval \<and> RBX \<sigma> = RBX\<^sub>0 \<and> RDX \<sigma> = RDX\<^sub>0 \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x18) \<and> RBP \<sigma> = RDI\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = 0x59ee\<close>
declare P_0x59ee_2_def[Ps]

definition P_0x59ee_2_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x59ee_2_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (2, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x20), 8)
  }\<close>

definition P_0x59ee_2_regions :: state_pred where
  \<open>P_0x59ee_2_regions \<sigma> \<equiv> \<exists>regions. P_0x59ee_2_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x59f5_2 :: state_pred where
  \<open>Q_0x59f5_2 \<sigma> \<equiv> RIP \<sigma> = 0x59f5 \<and> RAX \<sigma> = strlen_0x59e9_retval \<and> RBX \<sigma> = ((strlen_0x59e9_retval::64 word) + 0x1) \<and> RDX \<sigma> = RDX\<^sub>0 \<and> RDI \<sigma> = ((strlen_0x59e9_retval::64 word) + 0x1) \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x18) \<and> RBP \<sigma> = RDI\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = 0x59ee\<close>
declare Q_0x59f5_2_def[Qs]

schematic_goal qemu_strdup_0_2_0x59ee_0x59f2_2[blocks]:
  assumes \<open>(P_0x59ee_2 && P_0x59ee_2_regions) \<sigma>\<close>
  shows \<open>exec_block 2 0x59f2 2 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x59f5_2 ?\<sigma> \<and> block_usage P_0x59ee_2_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x59ee_2_def P_0x59ee_2_regions_def post: Q_0x59f5_2_def regionset: P_0x59ee_2_regions_set_def)

definition P_0x59f5_3 :: state_pred where
  \<open>P_0x59f5_3 \<sigma> \<equiv> RIP \<sigma> = 0x59f5 \<and> RAX \<sigma> = strlen_0x59e9_retval \<and> RBX \<sigma> = ((strlen_0x59e9_retval::64 word) + 0x1) \<and> RDX \<sigma> = RDX\<^sub>0 \<and> RDI \<sigma> = ((strlen_0x59e9_retval::64 word) + 0x1) \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x18) \<and> RBP \<sigma> = RDI\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = 0x59ee\<close>
declare P_0x59f5_3_def[Ps]

definition P_0x59f5_3_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x59f5_3_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (2, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x20), 8)
  }\<close>

definition P_0x59f5_3_regions :: state_pred where
  \<open>P_0x59f5_3_regions \<sigma> \<equiv> \<exists>regions. P_0x59f5_3_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_malloc_addr_0x59f5_3 :: state_pred where
  \<open>Q_malloc_addr_0x59f5_3 \<sigma> \<equiv> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x20) \<and> RIP \<sigma> = malloc_addr \<and> RAX \<sigma> = strlen_0x59e9_retval \<and> RBX \<sigma> = ((strlen_0x59e9_retval::64 word) + 0x1) \<and> RDX \<sigma> = RDX\<^sub>0 \<and> RDI \<sigma> = ((strlen_0x59e9_retval::64 word) + 0x1) \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RBP \<sigma> = RDI\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = 0x59fa\<close>
declare Q_malloc_addr_0x59f5_3_def[Qs]

schematic_goal qemu_strdup_0_1_0x59f5_0x59f5_3[blocks]:
  assumes \<open>(P_0x59f5_3 && P_0x59f5_3_regions) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x59f5 3 \<sigma> \<triangleq> ?\<sigma> \<and> Q_malloc_addr_0x59f5_3 ?\<sigma> \<and> block_usage P_0x59f5_3_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x59f5_3_def P_0x59f5_3_regions_def post: Q_malloc_addr_0x59f5_3_def regionset: P_0x59f5_3_regions_set_def)

definition P_0x59fa_4 :: state_pred where
  \<open>P_0x59fa_4 \<sigma> \<equiv> RIP \<sigma> = 0x59fa \<and> RAX \<sigma> = malloc_0x59f5_retval \<and> RBX \<sigma> = ((strlen_0x59e9_retval::64 word) + 0x1) \<and> RDX \<sigma> = RDX\<^sub>0 \<and> RDI \<sigma> = ((strlen_0x59e9_retval::64 word) + 0x1) \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x18) \<and> RBP \<sigma> = RDI\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = 0x59fa\<close>
declare P_0x59fa_4_def[Ps]

definition P_0x59fa_4_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x59fa_4_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (2, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x20), 8)
  }\<close>

definition P_0x59fa_4_regions :: state_pred where
  \<open>P_0x59fa_4_regions \<sigma> \<equiv> \<exists>regions. P_0x59fa_4_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x59fd_4 :: state_pred where
  \<open>Q_0x59fd_4 \<sigma> \<equiv> RIP \<sigma> = 0x59fd \<and> RAX \<sigma> = malloc_0x59f5_retval \<and> RBX \<sigma> = ((strlen_0x59e9_retval::64 word) + 0x1) \<and> RDX \<sigma> = RDX\<^sub>0 \<and> RDI \<sigma> = ((strlen_0x59e9_retval::64 word) + 0x1) \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x18) \<and> RBP \<sigma> = RDI\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = 0x59fa\<close>
declare Q_0x59fd_4_def[Qs]

schematic_goal qemu_strdup_0_1_0x59fa_0x59fa_4[blocks]:
  assumes \<open>(P_0x59fa_4 && P_0x59fa_4_regions) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x59fa 4 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x59fd_4 ?\<sigma> \<and> block_usage P_0x59fa_4_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x59fa_4_def P_0x59fa_4_regions_def post: Q_0x59fd_4_def regionset: P_0x59fa_4_regions_set_def)

definition P_0x59fd_true_5 :: state_pred where
  \<open>P_0x59fd_true_5 \<sigma> \<equiv> RIP \<sigma> = 0x59fd \<and> RAX \<sigma> = malloc_0x59f5_retval \<and> RBX \<sigma> = ((strlen_0x59e9_retval::64 word) + 0x1) \<and> RDX \<sigma> = RDX\<^sub>0 \<and> RDI \<sigma> = ((strlen_0x59e9_retval::64 word) + 0x1) \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x18) \<and> RBP \<sigma> = RDI\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = 0x59fa\<close>
declare P_0x59fd_true_5_def[Ps]

definition P_0x59fd_true_5_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x59fd_true_5_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (2, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x20), 8)
  }\<close>

definition P_0x59fd_true_5_regions :: state_pred where
  \<open>P_0x59fd_true_5_regions \<sigma> \<equiv> \<exists>regions. P_0x59fd_true_5_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x371f_5 :: state_pred where
  \<open>Q_0x371f_5 \<sigma> \<equiv> RIP \<sigma> = 0x371f \<and> RAX \<sigma> = malloc_0x59f5_retval \<and> RBX \<sigma> = ((strlen_0x59e9_retval::64 word) + 0x1) \<and> RDX \<sigma> = RDX\<^sub>0 \<and> RDI \<sigma> = ((strlen_0x59e9_retval::64 word) + 0x1) \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x18) \<and> RBP \<sigma> = RDI\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = 0x59fa\<close>
declare Q_0x371f_5_def[Qs]

schematic_goal qemu_strdup_0_1_0x59fd_0x59fd_5[blocks]:
  assumes \<open>(P_0x59fd_true_5 && P_0x59fd_true_5_regions && ZF) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x59fd 5 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x371f_5 ?\<sigma> \<and> block_usage P_0x59fd_true_5_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x59fd_true_5_def P_0x59fd_true_5_regions_def post: Q_0x371f_5_def regionset: P_0x59fd_true_5_regions_set_def)

definition P_0x371f_6 :: state_pred where
  \<open>P_0x371f_6 \<sigma> \<equiv> RIP \<sigma> = 0x371f \<and> RAX \<sigma> = malloc_0x59f5_retval \<and> RBX \<sigma> = ((strlen_0x59e9_retval::64 word) + 0x1) \<and> RDX \<sigma> = RDX\<^sub>0 \<and> RDI \<sigma> = ((strlen_0x59e9_retval::64 word) + 0x1) \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x18) \<and> RBP \<sigma> = RDI\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = 0x59fa\<close>
declare P_0x371f_6_def[Ps]

definition P_0x371f_6_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x371f_6_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (2, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x20), 8)
  }\<close>

definition P_0x371f_6_regions :: state_pred where
  \<open>P_0x371f_6_regions \<sigma> \<equiv> \<exists>regions. P_0x371f_6_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_abort_addr_0x371f_6 :: state_pred where
  \<open>Q_abort_addr_0x371f_6 \<sigma> \<equiv> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x20) \<and> RIP \<sigma> = abort_addr \<and> RAX \<sigma> = malloc_0x59f5_retval \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = RBX\<^sub>0\<close>
declare Q_abort_addr_0x371f_6_def[Qs]

schematic_goal qemu_strdup_0_1_0x371f_0x371f_6[blocks]:
  assumes \<open>(P_0x371f_6 && P_0x371f_6_regions) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x371f 6 \<sigma> \<triangleq> ?\<sigma> \<and> Q_abort_addr_0x371f_6 ?\<sigma> \<and> block_usage P_0x371f_6_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x371f_6_def P_0x371f_6_regions_def post: Q_abort_addr_0x371f_6_def regionset: P_0x371f_6_regions_set_def)

definition P_0x59fd_false_7 :: state_pred where
  \<open>P_0x59fd_false_7 \<sigma> \<equiv> RIP \<sigma> = 0x59fd \<and> RAX \<sigma> = malloc_0x59f5_retval \<and> RBX \<sigma> = ((strlen_0x59e9_retval::64 word) + 0x1) \<and> RDX \<sigma> = RDX\<^sub>0 \<and> RDI \<sigma> = ((strlen_0x59e9_retval::64 word) + 0x1) \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x18) \<and> RBP \<sigma> = RDI\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = 0x59fa\<close>
declare P_0x59fd_false_7_def[Ps]

definition P_0x59fd_false_7_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x59fd_false_7_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (2, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x20), 8)
  }\<close>

definition P_0x59fd_false_7_regions :: state_pred where
  \<open>P_0x59fd_false_7_regions \<sigma> \<equiv> \<exists>regions. P_0x59fd_false_7_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x5a0c_7 :: state_pred where
  \<open>Q_0x5a0c_7 \<sigma> \<equiv> RIP \<sigma> = 0x5a0c \<and> RAX \<sigma> = malloc_0x59f5_retval \<and> RBX \<sigma> = ((strlen_0x59e9_retval::64 word) + 0x1) \<and> RDX \<sigma> = ((strlen_0x59e9_retval::64 word) + 0x1) \<and> RDI \<sigma> = malloc_0x59f5_retval \<and> RSI \<sigma> = RDI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x18) \<and> RBP \<sigma> = RDI\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = 0x59fa\<close>
declare Q_0x5a0c_7_def[Qs]

schematic_goal qemu_strdup_0_4_0x59fd_0x5a09_7[blocks]:
  assumes \<open>(P_0x59fd_false_7 && P_0x59fd_false_7_regions && ! ZF) \<sigma>\<close>
  shows \<open>exec_block 4 0x5a09 7 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x5a0c_7 ?\<sigma> \<and> block_usage P_0x59fd_false_7_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x59fd_false_7_def P_0x59fd_false_7_regions_def post: Q_0x5a0c_7_def regionset: P_0x59fd_false_7_regions_set_def)

definition P_0x5a0c_8 :: state_pred where
  \<open>P_0x5a0c_8 \<sigma> \<equiv> RIP \<sigma> = 0x5a0c \<and> RAX \<sigma> = malloc_0x59f5_retval \<and> RBX \<sigma> = ((strlen_0x59e9_retval::64 word) + 0x1) \<and> RDX \<sigma> = ((strlen_0x59e9_retval::64 word) + 0x1) \<and> RDI \<sigma> = malloc_0x59f5_retval \<and> RSI \<sigma> = RDI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x18) \<and> RBP \<sigma> = RDI\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = 0x59fa\<close>
declare P_0x5a0c_8_def[Ps]

definition P_0x5a0c_8_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x5a0c_8_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (2, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x20), 8)
  }\<close>

definition P_0x5a0c_8_regions :: state_pred where
  \<open>P_0x5a0c_8_regions \<sigma> \<equiv> \<exists>regions. P_0x5a0c_8_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_memcpy_addr_0x5a0c_8 :: state_pred where
  \<open>Q_memcpy_addr_0x5a0c_8 \<sigma> \<equiv> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x20) \<and> RIP \<sigma> = memcpy_addr \<and> RAX \<sigma> = malloc_0x59f5_retval \<and> RBX \<sigma> = ((strlen_0x59e9_retval::64 word) + 0x1) \<and> RDX \<sigma> = ((strlen_0x59e9_retval::64 word) + 0x1) \<and> RDI \<sigma> = malloc_0x59f5_retval \<and> RSI \<sigma> = RDI\<^sub>0 \<and> RBP \<sigma> = RDI\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = 0x5a11\<close>
declare Q_memcpy_addr_0x5a0c_8_def[Qs]

schematic_goal qemu_strdup_0_1_0x5a0c_0x5a0c_8[blocks]:
  assumes \<open>(P_0x5a0c_8 && P_0x5a0c_8_regions) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x5a0c 8 \<sigma> \<triangleq> ?\<sigma> \<and> Q_memcpy_addr_0x5a0c_8 ?\<sigma> \<and> block_usage P_0x5a0c_8_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x5a0c_8_def P_0x5a0c_8_regions_def post: Q_memcpy_addr_0x5a0c_8_def regionset: P_0x5a0c_8_regions_set_def)

definition P_0x5a11_9 :: state_pred where
  \<open>P_0x5a11_9 \<sigma> \<equiv> RIP \<sigma> = 0x5a11 \<and> RAX \<sigma> = memcpy_0x5a0c_retval \<and> RBX \<sigma> = ((strlen_0x59e9_retval::64 word) + 0x1) \<and> RDX \<sigma> = ((strlen_0x59e9_retval::64 word) + 0x1) \<and> RDI \<sigma> = malloc_0x59f5_retval \<and> RSI \<sigma> = RDI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x18) \<and> RBP \<sigma> = RDI\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = 0x5a11\<close>
declare P_0x5a11_9_def[Ps]

definition P_0x5a11_9_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x5a11_9_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (2, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x20), 8)
  }\<close>

definition P_0x5a11_9_regions :: state_pred where
  \<open>P_0x5a11_9_regions \<sigma> \<equiv> \<exists>regions. P_0x5a11_9_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_ret_address_9 :: state_pred where
  \<open>Q_ret_address_9 \<sigma> \<equiv> RIP \<sigma> = ret_address \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = RBX\<^sub>0\<close>
declare Q_ret_address_9_def[Qs]

schematic_goal qemu_strdup_0_4_0x5a11_0x5a17_9[blocks]:
  assumes \<open>(P_0x5a11_9 && P_0x5a11_9_regions) \<sigma>\<close>
  shows \<open>exec_block 4 0x5a17 9 \<sigma> \<triangleq> ?\<sigma> \<and> Q_ret_address_9 ?\<sigma> \<and> block_usage P_0x5a11_9_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x5a11_9_def P_0x5a11_9_regions_def post: Q_ret_address_9_def regionset: P_0x5a11_9_regions_set_def)

definition qemu_strdup_acode :: ACode where
  \<open>qemu_strdup_acode =
    Block 4 0x59e5 0;
    Block (Suc 0) 0x59e9 (Suc 0);
    CALL strlen_acode;
    Block 2 0x59f2 2;
    Block (Suc 0) 0x59f5 3;
    CALL malloc_acode;
    Block (Suc 0) 0x59fa 4;
    IF ZF THEN
      Block (Suc 0) 0x59fd 5;
      Block (Suc 0) 0x371f 6;
      CALL abort_acode
    ELSE
      Block 4 0x5a09 7;
      Block (Suc 0) 0x5a0c 8;
      CALL memcpy_acode;
      Block 4 0x5a17 9
    FI
  \<close>

schematic_goal "qemu_strdup":
  assumes
    \<open>\<forall>\<sigma>. RIP \<sigma> = 0x59e9 \<longrightarrow> P_0x59e9_1_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x59ee \<longrightarrow> P_0x59ee_2_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x59f5 \<longrightarrow> P_0x59f5_3_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x59fa \<longrightarrow> P_0x59fa_4_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x59fd \<longrightarrow> P_0x59fd_true_5_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x371f \<longrightarrow> P_0x371f_6_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x59fd \<longrightarrow> P_0x59fd_false_7_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x5a0c \<longrightarrow> P_0x5a0c_8_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x5a11 \<longrightarrow> P_0x5a11_9_regions \<sigma>\<close>
    and [blocks]: \<open>{{Q_strlen_addr_0x59e9_1}} \<box>strlen_acode {{P_0x59ee_2;M_0x59e9}}\<close>
    and [blocks]: \<open>{{Q_malloc_addr_0x59f5_3}} \<box>malloc_acode {{P_0x59fa_4;M_0x59f5}}\<close>
    and [blocks]: \<open>{{Q_abort_addr_0x371f_6}} \<box>abort_acode {{Q_fail;M_0x371f}}\<close>
    and [blocks]: \<open>{{Q_memcpy_addr_0x5a0c_8}} \<box>memcpy_acode {{P_0x5a11_9;M_0x5a0c}}\<close>
  shows \<open>{{?P}} qemu_strdup_acode {{?Q;?M}}\<close>
  by (vcg acode: qemu_strdup_acode_def assms: assms)

end
