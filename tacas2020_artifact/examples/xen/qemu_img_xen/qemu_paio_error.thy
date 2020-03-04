theory qemu_paio_error
  imports
    "../../../isabelle/VCG/HTriple"
begin

locale "qemu_img_xen" = execution_context + exec_code +
  fixes mutex_lock_constprop_5_0x1b2e4_retval\<^sub>v mutex_unlock_constprop_4_0x1b2ed_retval\<^sub>v mutex_lock_constprop_5_addr mutex_unlock_constprop_4_addr :: \<open>64 word\<close>
    and mutex_lock_constprop_5_acode mutex_unlock_constprop_4_acode :: ACode
  assumes fetch:
    "fetch 0x1b2e0 \<equiv> (Unary (IS_8088 Push) (Storage (Reg (General SixtyFour rbx))), 1)"
    "fetch 0x1b2e1 \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour rbx)) (Storage (Reg (General SixtyFour rdi))), 3)"
    "fetch 0x1b2e4 \<equiv> (Unary (IS_8088 Call) (Immediate SixtyFour (ImmLabel ''mutex_lock.constprop.5'')), 5)"
    "fetch 0x1b2e9 \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour rbx)) (Storage (Memory SixtyFour (A_SizeDirective 64 (A_Plus (A_FromReg (General SixtyFour rbx)) (A_WordConstant 64))))), 4)"
    "fetch 0x1b2ed \<equiv> (Unary (IS_8088 Call) (Immediate SixtyFour (ImmLabel ''mutex_unlock.constprop.4'')), 5)"
    "fetch 0x1b2f2 \<equiv> (Binary (IS_8088 Mov) (Reg (General ThirtyTwo rax)) (Immediate SixtyFour (ImmVal 0)), 5)"
    "fetch 0x1b2f7 \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour rdx)) (Storage (Reg (General SixtyFour rbx))), 3)"
    "fetch 0x1b2fa \<equiv> (Unary (IS_8088 Neg) (Storage (Reg (General SixtyFour rdx))), 3)"
    "fetch 0x1b2fd \<equiv> (Binary (IS_8088 Test) (Reg (General SixtyFour rbx)) (Storage (Reg (General SixtyFour rbx))), 3)"
    "fetch 0x1b300 \<equiv> (Unary (IS_8088 Pop) (Storage (Reg (General SixtyFour rbx))), 1)"
    "fetch 0x1b301 \<equiv> (Binary (IS_PentiumPro Cmovs) (Reg (General ThirtyTwo rax)) (Storage (Reg (General ThirtyTwo rdx))), 3)"
    "fetch 0x1b304 \<equiv> (Nullary (IS_8088 Ret), 1)"
    and \<alpha>_def: \<open>\<alpha> = \<lparr>text_sections = [], data_sections = [], labels_to_offsets = [], binary_offset = 0\<rparr>\<close>
    and mutex_lock_constprop_5\<^sub>a\<^sub>d\<^sub>d\<^sub>r[simp]: \<open>the (label_to_address \<alpha> ''mutex_lock.constprop.5'') = mutex_lock_constprop_5_addr\<close>
    and mutex_unlock_constprop_4\<^sub>a\<^sub>d\<^sub>d\<^sub>r[simp]: \<open>the (label_to_address \<alpha> ''mutex_unlock.constprop.4'') = mutex_unlock_constprop_4_addr\<close>
begin

text \<open>Using definitions that don't get unfolded immediately prevents locale argument issues.\<close>
definition \<open>mutex_lock_constprop_5_0x1b2e4_retval \<equiv> mutex_lock_constprop_5_0x1b2e4_retval\<^sub>v\<close>
definition \<open>mutex_unlock_constprop_4_0x1b2ed_retval \<equiv> mutex_unlock_constprop_4_0x1b2ed_retval\<^sub>v\<close>

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

locale "qemu_paio_error" = "qemu_img_xen" +
  fixes RAX\<^sub>0\<^sub>v RBX\<^sub>0\<^sub>v RDX\<^sub>0\<^sub>v RDI\<^sub>0\<^sub>v RSP\<^sub>0\<^sub>v ret_address\<^sub>v :: \<open>64 word\<close>
begin

text \<open>Using definitions that don't get unfolded immediately prevents locale argument issues.\<close>
definition \<open>RAX\<^sub>0 \<equiv> RAX\<^sub>0\<^sub>v\<close>
definition \<open>RBX\<^sub>0 \<equiv> RBX\<^sub>0\<^sub>v\<close>
definition \<open>RDX\<^sub>0 \<equiv> RDX\<^sub>0\<^sub>v\<close>
definition \<open>RDI\<^sub>0 \<equiv> RDI\<^sub>0\<^sub>v\<close>
definition \<open>RSP\<^sub>0 \<equiv> RSP\<^sub>0\<^sub>v\<close>
definition \<open>ret_address \<equiv> ret_address\<^sub>v\<close>

definition P_0x1b2e0_0 :: state_pred where
  \<open>P_0x1b2e0_0 \<sigma> \<equiv> RIP \<sigma> = 0x1b2e0 \<and> RAX \<sigma> = RAX\<^sub>0 \<and> RBX \<sigma> = RBX\<^sub>0 \<and> RDX \<sigma> = RDX\<^sub>0 \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSP \<sigma> = RSP\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address\<close>
declare P_0x1b2e0_0_def[Ps]

definition P_0x1b2e0_0_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x1b2e0_0_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((RSP\<^sub>0::64 word) - 0x8), 8)
  }\<close>

definition P_0x1b2e0_0_regions :: state_pred where
  \<open>P_0x1b2e0_0_regions \<sigma> \<equiv> \<exists>regions. P_0x1b2e0_0_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x1b2e4_0 :: state_pred where
  \<open>Q_0x1b2e4_0 \<sigma> \<equiv> RIP \<sigma> = 0x1b2e4 \<and> RAX \<sigma> = RAX\<^sub>0 \<and> RBX \<sigma> = RDI\<^sub>0 \<and> RDX \<sigma> = RDX\<^sub>0 \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x8) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = RBX\<^sub>0\<close>
declare Q_0x1b2e4_0_def[Qs]

schematic_goal qemu_paio_error_0_2_0x1b2e0_0x1b2e1_0[blocks]:
  assumes \<open>(P_0x1b2e0_0 && P_0x1b2e0_0_regions) \<sigma>\<close>
  shows \<open>exec_block 2 0x1b2e1 0 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x1b2e4_0 ?\<sigma> \<and> block_usage P_0x1b2e0_0_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x1b2e0_0_def P_0x1b2e0_0_regions_def post: Q_0x1b2e4_0_def regionset: P_0x1b2e0_0_regions_set_def)

definition P_0x1b2e4_1 :: state_pred where
  \<open>P_0x1b2e4_1 \<sigma> \<equiv> RIP \<sigma> = 0x1b2e4 \<and> RAX \<sigma> = RAX\<^sub>0 \<and> RBX \<sigma> = RDI\<^sub>0 \<and> RDX \<sigma> = RDX\<^sub>0 \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x8) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = RBX\<^sub>0\<close>
declare P_0x1b2e4_1_def[Ps]

definition P_0x1b2e4_1_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x1b2e4_1_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (2, ((RSP\<^sub>0::64 word) - 0x10), 8)
  }\<close>

definition P_0x1b2e4_1_regions :: state_pred where
  \<open>P_0x1b2e4_1_regions \<sigma> \<equiv> \<exists>regions. P_0x1b2e4_1_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_mutex_lock_constprop_5_addr_0x1b2e4_1 :: state_pred where
  \<open>Q_mutex_lock_constprop_5_addr_0x1b2e4_1 \<sigma> \<equiv> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x10) \<and> RIP \<sigma> = mutex_lock_constprop_5_addr \<and> RAX \<sigma> = RAX\<^sub>0 \<and> RBX \<sigma> = RDI\<^sub>0 \<and> RDX \<sigma> = RDX\<^sub>0 \<and> RDI \<sigma> = RDI\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = 0x1b2e9\<close>
declare Q_mutex_lock_constprop_5_addr_0x1b2e4_1_def[Qs]

schematic_goal qemu_paio_error_0_1_0x1b2e4_0x1b2e4_1[blocks]:
  assumes \<open>(P_0x1b2e4_1 && P_0x1b2e4_1_regions) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x1b2e4 (Suc 0) \<sigma> \<triangleq> ?\<sigma> \<and> Q_mutex_lock_constprop_5_addr_0x1b2e4_1 ?\<sigma> \<and> block_usage P_0x1b2e4_1_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x1b2e4_1_def P_0x1b2e4_1_regions_def post: Q_mutex_lock_constprop_5_addr_0x1b2e4_1_def regionset: P_0x1b2e4_1_regions_set_def)

definition P_0x1b2e9_2 :: state_pred where
  \<open>P_0x1b2e9_2 \<sigma> \<equiv> RIP \<sigma> = 0x1b2e9 \<and> RAX \<sigma> = mutex_lock_constprop_5_0x1b2e4_retval \<and> RBX \<sigma> = RDI\<^sub>0 \<and> RDX \<sigma> = RDX\<^sub>0 \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x8) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = 0x1b2e9\<close>
declare P_0x1b2e9_2_def[Ps]

definition P_0x1b2e9_2_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x1b2e9_2_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((RDI\<^sub>0::64 word) + 0x40), 8),
    (2, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x10), 8)
  }\<close>

definition P_0x1b2e9_2_regions :: state_pred where
  \<open>P_0x1b2e9_2_regions \<sigma> \<equiv> \<exists>regions. P_0x1b2e9_2_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x1b2ed_2 :: state_pred where
  \<open>Q_0x1b2ed_2 \<sigma> \<equiv> RIP \<sigma> = 0x1b2ed \<and> RAX \<sigma> = mutex_lock_constprop_5_0x1b2e4_retval \<and> RBX \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> RDX \<sigma> = RDX\<^sub>0 \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x8) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = 0x1b2e9\<close>
declare Q_0x1b2ed_2_def[Qs]

schematic_goal qemu_paio_error_0_1_0x1b2e9_0x1b2e9_2[blocks]:
  assumes \<open>(P_0x1b2e9_2 && P_0x1b2e9_2_regions) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x1b2e9 2 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x1b2ed_2 ?\<sigma> \<and> block_usage P_0x1b2e9_2_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x1b2e9_2_def P_0x1b2e9_2_regions_def post: Q_0x1b2ed_2_def regionset: P_0x1b2e9_2_regions_set_def)

definition P_0x1b2ed_3 :: state_pred where
  \<open>P_0x1b2ed_3 \<sigma> \<equiv> RIP \<sigma> = 0x1b2ed \<and> RAX \<sigma> = mutex_lock_constprop_5_0x1b2e4_retval \<and> RBX \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> RDX \<sigma> = RDX\<^sub>0 \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x8) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = 0x1b2e9\<close>
declare P_0x1b2ed_3_def[Ps]

definition P_0x1b2ed_3_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x1b2ed_3_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((RDI\<^sub>0::64 word) + 0x40), 8),
    (2, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x10), 8)
  }\<close>

definition P_0x1b2ed_3_regions :: state_pred where
  \<open>P_0x1b2ed_3_regions \<sigma> \<equiv> \<exists>regions. P_0x1b2ed_3_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_mutex_unlock_constprop_4_addr_0x1b2ed_3 :: state_pred where
  \<open>Q_mutex_unlock_constprop_4_addr_0x1b2ed_3 \<sigma> \<equiv> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x10) \<and> RIP \<sigma> = mutex_unlock_constprop_4_addr \<and> RAX \<sigma> = mutex_lock_constprop_5_0x1b2e4_retval \<and> RBX \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> RDX \<sigma> = RDX\<^sub>0 \<and> RDI \<sigma> = RDI\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = 0x1b2f2\<close>
declare Q_mutex_unlock_constprop_4_addr_0x1b2ed_3_def[Qs]

schematic_goal qemu_paio_error_0_1_0x1b2ed_0x1b2ed_3[blocks]:
  assumes \<open>(P_0x1b2ed_3 && P_0x1b2ed_3_regions) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x1b2ed 3 \<sigma> \<triangleq> ?\<sigma> \<and> Q_mutex_unlock_constprop_4_addr_0x1b2ed_3 ?\<sigma> \<and> block_usage P_0x1b2ed_3_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x1b2ed_3_def P_0x1b2ed_3_regions_def post: Q_mutex_unlock_constprop_4_addr_0x1b2ed_3_def regionset: P_0x1b2ed_3_regions_set_def)

definition P_0x1b2f2_4 :: state_pred where
  \<open>P_0x1b2f2_4 \<sigma> \<equiv> RIP \<sigma> = 0x1b2f2 \<and> RAX \<sigma> = mutex_unlock_constprop_4_0x1b2ed_retval \<and> RBX \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> RDX \<sigma> = RDX\<^sub>0 \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x8) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = 0x1b2f2\<close>
declare P_0x1b2f2_4_def[Ps]

definition P_0x1b2f2_4_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x1b2f2_4_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((RDI\<^sub>0::64 word) + 0x40), 8),
    (2, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x10), 8)
  }\<close>

definition P_0x1b2f2_4_regions :: state_pred where
  \<open>P_0x1b2f2_4_regions \<sigma> \<equiv> \<exists>regions. P_0x1b2f2_4_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_ret_address_4 :: state_pred where
  \<open>Q_ret_address_4 \<sigma> \<equiv> RIP \<sigma> = ret_address \<and> RAX \<sigma> = ucast ((if' ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) <s (ucast ((0x0::64 word))::64 word) then (\<langle>31,0\<rangle>(- (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word))::32 word) else (0x0::32 word))) \<and> RBX \<sigma> = RBX\<^sub>0 \<and> RDX \<sigma> = (- (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)) \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) + 0x8) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = 0x1b2f2\<close>
declare Q_ret_address_4_def[Qs]

schematic_goal qemu_paio_error_0_7_0x1b2f2_0x1b304_4[blocks]:
  assumes \<open>(P_0x1b2f2_4 && P_0x1b2f2_4_regions) \<sigma>\<close>
  shows \<open>exec_block 7 0x1b304 4 \<sigma> \<triangleq> ?\<sigma> \<and> Q_ret_address_4 ?\<sigma> \<and> block_usage P_0x1b2f2_4_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x1b2f2_4_def P_0x1b2f2_4_regions_def post: Q_ret_address_4_def regionset: P_0x1b2f2_4_regions_set_def)

definition qemu_paio_error_acode :: ACode where
  \<open>qemu_paio_error_acode =
    Block 2 0x1b2e1 0;
    Block (Suc 0) 0x1b2e4 (Suc 0);
    CALL mutex_lock_constprop_5_acode;
    Block (Suc 0) 0x1b2e9 2;
    Block (Suc 0) 0x1b2ed 3;
    CALL mutex_unlock_constprop_4_acode;
    Block 7 0x1b304 4
  \<close>

schematic_goal "qemu_paio_error":
  assumes
    \<open>\<forall>\<sigma>. RIP \<sigma> = 0x1b2e4 \<longrightarrow> P_0x1b2e4_1_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x1b2e9 \<longrightarrow> P_0x1b2e9_2_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x1b2ed \<longrightarrow> P_0x1b2ed_3_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x1b2f2 \<longrightarrow> P_0x1b2f2_4_regions \<sigma>\<close>
    and [blocks]: \<open>{{Q_mutex_lock_constprop_5_addr_0x1b2e4_1}} \<box>mutex_lock_constprop_5_acode {{P_0x1b2e9_2;M_0x1b2e4}}\<close>
    and [blocks]: \<open>{{Q_mutex_unlock_constprop_4_addr_0x1b2ed_3}} \<box>mutex_unlock_constprop_4_acode {{P_0x1b2f2_4;M_0x1b2ed}}\<close>
  shows \<open>{{?P}} qemu_paio_error_acode {{?Q;?M}}\<close>
  by (vcg acode: qemu_paio_error_acode_def assms: assms)

end
