theory qemu_fls
  imports
    "../../../isabelle/VCG/HTriple"
begin

locale "qemu_img_xen" = execution_context + exec_code +
  assumes fetch:
    "fetch 0x5790 \<equiv> (Binary (IS_8088 Xor) (Reg (General ThirtyTwo rax)) (Storage (Reg (General ThirtyTwo rax))), 2)"
    "fetch 0x5792 \<equiv> (Binary (IS_8088 Test) (Reg (General ThirtyTwo rdi)) (Storage (Reg (General ThirtyTwo rdi))), 2)"
    "fetch 0x5794 \<equiv> (Unary (IS_8088 Je) (Immediate SixtyFour (ImmVal 22435)), 2)"
    "fetch 0x5796 \<equiv> (Binary (IS_80386 Bsr) (Reg (General ThirtyTwo rdi)) (Storage (Reg (General ThirtyTwo rdi))), 3)"
    "fetch 0x5799 \<equiv> (Binary (IS_8088 Mov) (Reg (General ThirtyTwo rax)) (Immediate SixtyFour (ImmVal 32)), 5)"
    "fetch 0x579e \<equiv> (Binary (IS_8088 Xor) (Reg (General ThirtyTwo rdi)) (Immediate SixtyFour (ImmVal 31)), 3)"
    "fetch 0x57a1 \<equiv> (Binary (IS_8088 Sub) (Reg (General ThirtyTwo rax)) (Storage (Reg (General ThirtyTwo rdi))), 2)"
    "fetch 0x57a3 \<equiv> (Nullary (IS_8088 Ret), 1)"
    "fetch 0x57a4 \<equiv> (Unary (IS_8088 Nop) (Storage (Memory Sixteen (A_SizeDirective 16 (A_Plus (A_FromReg (General SixtyFour cs)) (A_Plus (A_FromReg (General SixtyFour rax)) (A_Plus (A_Mult 1 (A_FromReg (General SixtyFour rax))) (A_WordConstant 0))))))), 11)"
    and \<alpha>_def: \<open>\<alpha> = \<lparr>text_sections = [], data_sections = [], labels_to_offsets = [], binary_offset = 0\<rparr>\<close>
begin

text \<open>Using definitions that don't get unfolded immediately prevents locale argument issues.\<close>

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

locale "qemu_fls" = "qemu_img_xen" +
  fixes RAX\<^sub>0\<^sub>v RDI\<^sub>0\<^sub>v RSP\<^sub>0\<^sub>v ret_address\<^sub>v :: \<open>64 word\<close>
begin

text \<open>Using definitions that don't get unfolded immediately prevents locale argument issues.\<close>
definition \<open>RAX\<^sub>0 \<equiv> RAX\<^sub>0\<^sub>v\<close>
definition \<open>RDI\<^sub>0 \<equiv> RDI\<^sub>0\<^sub>v\<close>
definition \<open>RSP\<^sub>0 \<equiv> RSP\<^sub>0\<^sub>v\<close>
definition \<open>ret_address \<equiv> ret_address\<^sub>v\<close>

definition P_0x5790_0 :: state_pred where
  \<open>P_0x5790_0 \<sigma> \<equiv> RIP \<sigma> = 0x5790 \<and> RAX \<sigma> = RAX\<^sub>0 \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSP \<sigma> = RSP\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address\<close>
declare P_0x5790_0_def[Ps]

definition P_0x5790_0_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x5790_0_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8)
  }\<close>

definition P_0x5790_0_regions :: state_pred where
  \<open>P_0x5790_0_regions \<sigma> \<equiv> \<exists>regions. P_0x5790_0_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x5794_0 :: state_pred where
  \<open>Q_0x5794_0 \<sigma> \<equiv> RIP \<sigma> = 0x5794 \<and> RAX \<sigma> = 0x0 \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSP \<sigma> = RSP\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address\<close>
declare Q_0x5794_0_def[Qs]

schematic_goal qemu_fls_0_2_0x5790_0x5792_0[blocks]:
  assumes \<open>(P_0x5790_0 && P_0x5790_0_regions) \<sigma>\<close>
  shows \<open>exec_block 2 0x5792 0 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x5794_0 ?\<sigma> \<and> block_usage P_0x5790_0_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x5790_0_def P_0x5790_0_regions_def post: Q_0x5794_0_def regionset: P_0x5790_0_regions_set_def)

definition P_0x5794_true_1 :: state_pred where
  \<open>P_0x5794_true_1 \<sigma> \<equiv> RIP \<sigma> = 0x5794 \<and> RAX \<sigma> = 0x0 \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSP \<sigma> = RSP\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address\<close>
declare P_0x5794_true_1_def[Ps]

definition P_0x5794_true_1_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x5794_true_1_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8)
  }\<close>

definition P_0x5794_true_1_regions :: state_pred where
  \<open>P_0x5794_true_1_regions \<sigma> \<equiv> \<exists>regions. P_0x5794_true_1_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x57a3_1 :: state_pred where
  \<open>Q_0x57a3_1 \<sigma> \<equiv> RIP \<sigma> = 0x57a3 \<and> RSP \<sigma> = RSP\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address\<close>
declare Q_0x57a3_1_def[Qs]

schematic_goal qemu_fls_0_1_0x5794_0x5794_1[blocks]:
  assumes \<open>(P_0x5794_true_1 && P_0x5794_true_1_regions && ZF) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x5794 (Suc 0) \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x57a3_1 ?\<sigma> \<and> block_usage P_0x5794_true_1_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x5794_true_1_def P_0x5794_true_1_regions_def post: Q_0x57a3_1_def regionset: P_0x5794_true_1_regions_set_def)

definition P_0x5794_false_2 :: state_pred where
  \<open>P_0x5794_false_2 \<sigma> \<equiv> RIP \<sigma> = 0x5794 \<and> RAX \<sigma> = 0x0 \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSP \<sigma> = RSP\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address\<close>
declare P_0x5794_false_2_def[Ps]

definition P_0x5794_false_2_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x5794_false_2_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8)
  }\<close>

definition P_0x5794_false_2_regions :: state_pred where
  \<open>P_0x5794_false_2_regions \<sigma> \<equiv> \<exists>regions. P_0x5794_false_2_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x57a3_2 :: state_pred where
  \<open>Q_0x57a3_2 \<sigma> \<equiv> RIP \<sigma> = 0x57a3 \<and> RSP \<sigma> = RSP\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address\<close>
declare Q_0x57a3_2_def[Qs]

schematic_goal qemu_fls_0_5_0x5794_0x57a1_2[blocks]:
  assumes \<open>(P_0x5794_false_2 && P_0x5794_false_2_regions && ! ZF) \<sigma>\<close>
  shows \<open>exec_block 5 0x57a1 2 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x57a3_2 ?\<sigma> \<and> block_usage P_0x5794_false_2_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x5794_false_2_def P_0x5794_false_2_regions_def post: Q_0x57a3_2_def regionset: P_0x5794_false_2_regions_set_def)

definition P_0x57a3_3 :: state_pred where
  \<open>P_0x57a3_3 \<sigma> \<equiv> RIP \<sigma> = 0x57a3 \<and> RSP \<sigma> = RSP\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address\<close>
declare P_0x57a3_3_def[Ps]

definition P_0x57a3_3_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x57a3_3_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8)
  }\<close>

definition P_0x57a3_3_regions :: state_pred where
  \<open>P_0x57a3_3_regions \<sigma> \<equiv> \<exists>regions. P_0x57a3_3_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_ret_address_3 :: state_pred where
  \<open>Q_ret_address_3 \<sigma> \<equiv> RIP \<sigma> = ret_address \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) + 0x8) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address\<close>
declare Q_ret_address_3_def[Qs]

schematic_goal qemu_fls_0_1_0x57a3_0x57a3_3[blocks]:
  assumes \<open>(P_0x57a3_3 && P_0x57a3_3_regions) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x57a3 3 \<sigma> \<triangleq> ?\<sigma> \<and> Q_ret_address_3 ?\<sigma> \<and> block_usage P_0x57a3_3_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x57a3_3_def P_0x57a3_3_regions_def post: Q_ret_address_3_def regionset: P_0x57a3_3_regions_set_def)

definition qemu_fls_acode :: ACode where
  \<open>qemu_fls_acode =
    Block 2 0x5792 0;
    IF ZF THEN
      Block (Suc 0) 0x5794 (Suc 0)
    ELSE
      Block 5 0x57a1 2
    FI;
    Block (Suc 0) 0x57a3 3
  \<close>

schematic_goal "qemu_fls":
  assumes
    \<open>\<forall>\<sigma>. RIP \<sigma> = 0x5794 \<longrightarrow> P_0x5794_true_1_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x5794 \<longrightarrow> P_0x5794_false_2_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x57a3 \<longrightarrow> P_0x57a3_3_regions \<sigma>\<close>
  shows \<open>{{?P}} qemu_fls_acode {{?Q;?M}}\<close>
  by (vcg acode: qemu_fls_acode_def assms: assms)

end
