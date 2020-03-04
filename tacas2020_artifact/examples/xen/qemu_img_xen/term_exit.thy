theory term_exit 
  imports
    "~/Documents/research/devel/VT/assembly/isabelle/VCG/HTriple"
begin


locale "qemu_img_xen" = execution_context + exec_code +
  fixes tcsetattr_0x3d7b_retval\<^sub>v tcsetattr_addr :: \<open>64 word\<close>
    and tcsetattr_acode :: ACode
  assumes fetch:
    "fetch 0x3d70 \<equiv> (Binary (IS_8088 Lea) (Reg (General SixtyFour rdx)) (Storage (Memory SixtyFour (A_Plus (A_FromReg (General SixtyFour rip)) (A_WordConstant 157097)))), 7)"
    "fetch 0x3d77 \<equiv> (Binary (IS_8088 Xor) (Reg (General ThirtyTwo rsi)) (Storage (Reg (General ThirtyTwo rsi))), 2)"
    "fetch 0x3d79 \<equiv> (Binary (IS_8088 Xor) (Reg (General ThirtyTwo rdi)) (Storage (Reg (General ThirtyTwo rdi))), 2)"
    "fetch 0x3d7b \<equiv> (Unary (IS_8088 Call) (Immediate SixtyFour (ImmLabel ''tcsetattr'')), 1)"
    "fetch 0x3d7c \<equiv> (Nullary (IS_8088 Ret), 4)"
    and \<alpha>_def: \<open>\<alpha> = \<lparr>text_sections = [], data_sections = [], labels_to_offsets = [], binary_offset = 0\<rparr>\<close>
    and tcsetattr\<^sub>a\<^sub>d\<^sub>d\<^sub>r[simp]: \<open>the (label_to_address \<alpha> ''tcsetattr'') = tcsetattr_addr\<close>
begin

text \<open>Using definitions that don't get unfolded immediately prevents locale argument issues.\<close>
definition \<open>tcsetattr_0x3d7b_retval \<equiv> tcsetattr_0x3d7b_retval\<^sub>v\<close>

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

locale "term_exit" = "qemu_img_xen" +
  fixes RAX\<^sub>0\<^sub>v RDX\<^sub>0\<^sub>v RDI\<^sub>0\<^sub>v RSI\<^sub>0\<^sub>v RSP\<^sub>0\<^sub>v ret_address\<^sub>v :: \<open>64 word\<close>
begin

text \<open>Using definitions that don't get unfolded immediately prevents locale argument issues.\<close>
definition \<open>RAX\<^sub>0 \<equiv> RAX\<^sub>0\<^sub>v\<close>
definition \<open>RDX\<^sub>0 \<equiv> RDX\<^sub>0\<^sub>v\<close>
definition \<open>RDI\<^sub>0 \<equiv> RDI\<^sub>0\<^sub>v\<close>
definition \<open>RSI\<^sub>0 \<equiv> RSI\<^sub>0\<^sub>v\<close>
definition \<open>RSP\<^sub>0 \<equiv> RSP\<^sub>0\<^sub>v\<close>
definition \<open>ret_address \<equiv> ret_address\<^sub>v\<close>

definition P_0x3d70_0 :: state_pred where
  \<open>P_0x3d70_0 \<sigma> \<equiv> RIP \<sigma> = 0x3d70 \<and> RAX \<sigma> = RAX\<^sub>0 \<and> RDX \<sigma> = RDX\<^sub>0 \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = RSP\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address\<close>
declare P_0x3d70_0_def[Ps]

definition P_0x3d70_0_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x3d70_0_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8)
  }\<close>

definition P_0x3d70_0_regions :: state_pred where
  \<open>P_0x3d70_0_regions \<sigma> \<equiv> \<exists>regions. P_0x3d70_0_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x3d7b_0 :: state_pred where
  \<open>Q_0x3d7b_0 \<sigma> \<equiv> RIP \<sigma> = 0x3d7b \<and> RAX \<sigma> = RAX\<^sub>0 \<and> RDX \<sigma> = 0x2a320 \<and> RDI \<sigma> = 0x0 \<and> RSI \<sigma> = 0x0 \<and> RSP \<sigma> = RSP\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address\<close>
declare Q_0x3d7b_0_def[Qs]

schematic_goal term_exit_0_3_0x3d70_0x3d79_0[blocks]:
  assumes \<open>(P_0x3d70_0 && P_0x3d70_0_regions) \<sigma>\<close>
  shows \<open>exec_block 3 0x3d79 0 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x3d7b_0 ?\<sigma> \<and> block_usage P_0x3d70_0_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x3d70_0_def P_0x3d70_0_regions_def post: Q_0x3d7b_0_def regionset: P_0x3d70_0_regions_set_def)

definition P_0x3d7b_1 :: state_pred where
  \<open>P_0x3d7b_1 \<sigma> \<equiv> RIP \<sigma> = 0x3d7b \<and> RAX \<sigma> = RAX\<^sub>0 \<and> RDX \<sigma> = 0x2a320 \<and> RDI \<sigma> = 0x0 \<and> RSI \<sigma> = 0x0 \<and> RSP \<sigma> = RSP\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address\<close>
declare P_0x3d7b_1_def[Ps]

definition P_0x3d7b_1_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x3d7b_1_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((RSP\<^sub>0::64 word) - 0x8), 8)
  }\<close>

definition P_0x3d7b_1_regions :: state_pred where
  \<open>P_0x3d7b_1_regions \<sigma> \<equiv> \<exists>regions. P_0x3d7b_1_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_tcsetattr_addr_0x3d7b_1 :: state_pred where
  \<open>Q_tcsetattr_addr_0x3d7b_1 \<sigma> \<equiv> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x8) \<and> RIP \<sigma> = tcsetattr_addr \<and> RAX \<sigma> = RAX\<^sub>0 \<and> RDX \<sigma> = 0x2a320 \<and> RDI \<sigma> = 0x0 \<and> RSI \<sigma> = 0x0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = 0x3d7c\<close>
declare Q_tcsetattr_addr_0x3d7b_1_def[Qs]

schematic_goal term_exit_0_1_0x3d7b_0x3d7b_1[blocks]:
  assumes \<open>(P_0x3d7b_1 && P_0x3d7b_1_regions) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x3d7b (Suc 0) \<sigma> \<triangleq> ?\<sigma> \<and> Q_tcsetattr_addr_0x3d7b_1 ?\<sigma> \<and> block_usage P_0x3d7b_1_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x3d7b_1_def P_0x3d7b_1_regions_def post: Q_tcsetattr_addr_0x3d7b_1_def regionset: P_0x3d7b_1_regions_set_def)

definition P_0x3d7c_2 :: state_pred where
  \<open>P_0x3d7c_2 \<sigma> \<equiv> RIP \<sigma> = 0x3d7c \<and> RAX \<sigma> = tcsetattr_0x3d7b_retval \<and> RDX \<sigma> = 0x2a320 \<and> RDI \<sigma> = 0x0 \<and> RSI \<sigma> = 0x0 \<and> RSP \<sigma> = RSP\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = 0x3d7c\<close>
declare P_0x3d7c_2_def[Ps]

definition P_0x3d7c_2_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x3d7c_2_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((RSP\<^sub>0::64 word) - 0x8), 8)
  }\<close>

definition P_0x3d7c_2_regions :: state_pred where
  \<open>P_0x3d7c_2_regions \<sigma> \<equiv> \<exists>regions. P_0x3d7c_2_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_ret_address_2 :: state_pred where
  \<open>Q_ret_address_2 \<sigma> \<equiv> RIP \<sigma> = ret_address \<and> RAX \<sigma> = tcsetattr_0x3d7b_retval \<and> RDX \<sigma> = 0x2a320 \<and> RDI \<sigma> = 0x0 \<and> RSI \<sigma> = 0x0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) + 0x8) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = 0x3d7c\<close>
declare Q_ret_address_2_def[Qs]

schematic_goal term_exit_0_1_0x3d7c_0x3d7c_2[blocks]:
  assumes \<open>(P_0x3d7c_2 && P_0x3d7c_2_regions) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x3d7c 2 \<sigma> \<triangleq> ?\<sigma> \<and> Q_ret_address_2 ?\<sigma> \<and> block_usage P_0x3d7c_2_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x3d7c_2_def P_0x3d7c_2_regions_def post: Q_ret_address_2_def regionset: P_0x3d7c_2_regions_set_def)

definition term_exit_acode :: ACode where
  \<open>term_exit_acode =
    Block 3 0x3d79 0;
    Block (Suc 0) 0x3d7b (Suc 0);
    CALL tcsetattr_acode;
    Block (Suc 0) 0x3d7c 2
  \<close>

schematic_goal "term_exit":
  assumes \<open>\<forall>\<sigma>. RIP \<sigma> = 0x3d7b \<longrightarrow> P_0x3d7b_1_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x3d7c \<longrightarrow> P_0x3d7c_2_regions \<sigma>\<close>
    and [blocks]: \<open>{{Q_tcsetattr_addr_0x3d7b_1}} \<box>tcsetattr_acode {{P_0x3d7c_2;M_0x3d7b}}\<close>
  shows \<open>{{?P}} term_exit_acode {{?Q;?M}}\<close>
  by (vcg acode: term_exit_acode_def assms: assms)

end
