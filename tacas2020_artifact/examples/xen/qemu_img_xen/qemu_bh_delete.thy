theory qemu_bh_delete
  imports
    "../../../isabelle/VCG/HTriple"
begin

locale "qemu_img_xen" = execution_context + exec_code +
  fixes free_0x5960_retval\<^sub>v free_addr :: \<open>64 word\<close>
    and free_acode :: ACode
  assumes fetch:
    "fetch 0x5180 \<equiv> (Unary (IS_8088 Jmp) (Immediate SixtyFour (ImmVal 22880)), 5)"
    "fetch 0x5960 \<equiv> (Unary (IS_8088 Call) (Immediate SixtyFour (ImmLabel ''free'')), 1)"
    "fetch 0x5961 \<equiv> (Nullary (IS_8088 Ret), 4)"
    and \<alpha>_def: \<open>\<alpha> = \<lparr>text_sections = [], data_sections = [], labels_to_offsets = [], binary_offset = 0\<rparr>\<close>
    and free\<^sub>a\<^sub>d\<^sub>d\<^sub>r[simp]: \<open>the (label_to_address \<alpha> ''free'') = free_addr\<close>
begin

text \<open>Using definitions that don't get unfolded immediately prevents locale argument issues.\<close>
definition \<open>free_0x5960_retval \<equiv> free_0x5960_retval\<^sub>v\<close>

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

locale "qemu_bh_delete" = "qemu_img_xen" +
  fixes RAX\<^sub>0\<^sub>v RSP\<^sub>0\<^sub>v ret_address\<^sub>v :: \<open>64 word\<close>
begin

text \<open>Using definitions that don't get unfolded immediately prevents locale argument issues.\<close>
definition \<open>RAX\<^sub>0 \<equiv> RAX\<^sub>0\<^sub>v\<close>
definition \<open>RSP\<^sub>0 \<equiv> RSP\<^sub>0\<^sub>v\<close>
definition \<open>ret_address \<equiv> ret_address\<^sub>v\<close>

definition P_0x5180_0 :: state_pred where
  \<open>P_0x5180_0 \<sigma> \<equiv> RIP \<sigma> = 0x5180 \<and> RAX \<sigma> = RAX\<^sub>0 \<and> RSP \<sigma> = RSP\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address\<close>
declare P_0x5180_0_def[Ps]

definition P_0x5180_0_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x5180_0_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8)
  }\<close>

definition P_0x5180_0_regions :: state_pred where
  \<open>P_0x5180_0_regions \<sigma> \<equiv> \<exists>regions. P_0x5180_0_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x5960_0 :: state_pred where
  \<open>Q_0x5960_0 \<sigma> \<equiv> RIP \<sigma> = 0x5960 \<and> RAX \<sigma> = RAX\<^sub>0 \<and> RSP \<sigma> = RSP\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address\<close>
declare Q_0x5960_0_def[Qs]

schematic_goal qemu_bh_delete_0_1_0x5180_0x5180_0[blocks]:
  assumes \<open>(P_0x5180_0 && P_0x5180_0_regions) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x5180 0 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x5960_0 ?\<sigma> \<and> block_usage P_0x5180_0_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x5180_0_def P_0x5180_0_regions_def post: Q_0x5960_0_def regionset: P_0x5180_0_regions_set_def)

definition P_0x5960_1 :: state_pred where
  \<open>P_0x5960_1 \<sigma> \<equiv> RIP \<sigma> = 0x5960 \<and> RAX \<sigma> = RAX\<^sub>0 \<and> RSP \<sigma> = RSP\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address\<close>
declare P_0x5960_1_def[Ps]

definition P_0x5960_1_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x5960_1_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((RSP\<^sub>0::64 word) - 0x8), 8)
  }\<close>

definition P_0x5960_1_regions :: state_pred where
  \<open>P_0x5960_1_regions \<sigma> \<equiv> \<exists>regions. P_0x5960_1_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_free_addr_0x5960_1 :: state_pred where
  \<open>Q_free_addr_0x5960_1 \<sigma> \<equiv> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x8) \<and> RIP \<sigma> = free_addr \<and> RAX \<sigma> = RAX\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = 0x5961\<close>
declare Q_free_addr_0x5960_1_def[Qs]

schematic_goal qemu_bh_delete_0_1_0x5960_0x5960_1[blocks]:
  assumes \<open>(P_0x5960_1 && P_0x5960_1_regions) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x5960 (Suc 0) \<sigma> \<triangleq> ?\<sigma> \<and> Q_free_addr_0x5960_1 ?\<sigma> \<and> block_usage P_0x5960_1_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x5960_1_def P_0x5960_1_regions_def post: Q_free_addr_0x5960_1_def regionset: P_0x5960_1_regions_set_def)

definition P_0x5961_2 :: state_pred where
  \<open>P_0x5961_2 \<sigma> \<equiv> RIP \<sigma> = 0x5961 \<and> RAX \<sigma> = free_0x5960_retval \<and> RSP \<sigma> = RSP\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = 0x5961\<close>
declare P_0x5961_2_def[Ps]

definition P_0x5961_2_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x5961_2_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((RSP\<^sub>0::64 word) - 0x8), 8)
  }\<close>

definition P_0x5961_2_regions :: state_pred where
  \<open>P_0x5961_2_regions \<sigma> \<equiv> \<exists>regions. P_0x5961_2_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_ret_address_2 :: state_pred where
  \<open>Q_ret_address_2 \<sigma> \<equiv> RIP \<sigma> = ret_address \<and> RAX \<sigma> = free_0x5960_retval \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) + 0x8) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = 0x5961\<close>
declare Q_ret_address_2_def[Qs]

schematic_goal qemu_bh_delete_0_1_0x5961_0x5961_2[blocks]:
  assumes \<open>(P_0x5961_2 && P_0x5961_2_regions) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x5961 2 \<sigma> \<triangleq> ?\<sigma> \<and> Q_ret_address_2 ?\<sigma> \<and> block_usage P_0x5961_2_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x5961_2_def P_0x5961_2_regions_def post: Q_ret_address_2_def regionset: P_0x5961_2_regions_set_def)

definition qemu_bh_delete_acode :: ACode where
  \<open>qemu_bh_delete_acode =
    Block (Suc 0) 0x5180 0;
    Block (Suc 0) 0x5960 (Suc 0);
    CALL free_acode;
    Block (Suc 0) 0x5961 2
  \<close>

schematic_goal "qemu_bh_delete":
  assumes
    \<open>\<forall>\<sigma>. RIP \<sigma> = 0x5960 \<longrightarrow> P_0x5960_1_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x5961 \<longrightarrow> P_0x5961_2_regions \<sigma>\<close>
    and [blocks]: \<open>{{Q_free_addr_0x5960_1}} \<box>free_acode {{P_0x5961_2;M_0x5960}}\<close>
  shows \<open>{{?P}} qemu_bh_delete_acode {{?Q;?M}}\<close>
  by (vcg acode: qemu_bh_delete_acode_def assms: assms)

find_theorems bv_cat

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
