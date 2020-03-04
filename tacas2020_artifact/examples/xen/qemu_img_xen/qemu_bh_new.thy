theory qemu_bh_new 
  imports "../../../isabelle/VCG/HTriple"
begin

locale "qemu_img_xen" = execution_context + exec_code +
  fixes qemu_malloc_0x5131_retval\<^sub>v qemu_malloc_addr :: \<open>64 word\<close>
    and qemu_malloc_acode :: ACode
  assumes fetch:
    "fetch 0x5120 \<equiv> (Unary (IS_8088 Push) (Storage (Reg (General SixtyFour rbp))), 1)"
    "fetch 0x5121 \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour rbp)) (Storage (Reg (General SixtyFour rdi))), 3)"
    "fetch 0x5124 \<equiv> (Binary (IS_8088 Mov) (Reg (General ThirtyTwo rdi)) (Immediate SixtyFour (ImmVal 16)), 5)"
    "fetch 0x5129 \<equiv> (Unary (IS_8088 Push) (Storage (Reg (General SixtyFour rbx))), 1)"
    "fetch 0x512a \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour rbx)) (Storage (Reg (General SixtyFour rsi))), 3)"
    "fetch 0x512d \<equiv> (Binary (IS_8088 Sub) (Reg (General SixtyFour rsp)) (Immediate SixtyFour (ImmVal 8)), 4)"
    "fetch 0x5131 \<equiv> (Unary (IS_8088 Call) (Immediate SixtyFour (ImmLabel ''qemu_malloc'')), 5)"
    "fetch 0x5136 \<equiv> (Binary (IS_8088 Mov) (Memory SixtyFour (A_SizeDirective 64 (A_FromReg (General SixtyFour rax)))) (Storage (Reg (General SixtyFour rbp))), 3)"
    "fetch 0x5139 \<equiv> (Binary (IS_8088 Mov) (Memory SixtyFour (A_SizeDirective 64 (A_Plus (A_FromReg (General SixtyFour rax)) (A_WordConstant 8)))) (Storage (Reg (General SixtyFour rbx))), 4)"
    "fetch 0x513d \<equiv> (Binary (IS_8088 Add) (Reg (General SixtyFour rsp)) (Immediate SixtyFour (ImmVal 8)), 4)"
    "fetch 0x5141 \<equiv> (Unary (IS_8088 Pop) (Storage (Reg (General SixtyFour rbx))), 1)"
    "fetch 0x5142 \<equiv> (Unary (IS_8088 Pop) (Storage (Reg (General SixtyFour rbp))), 1)"
    "fetch 0x5143 \<equiv> (Nullary (IS_8088 Ret), 1)"
    "fetch 0x5144 \<equiv> (Unary (IS_8088 Nop) (Storage (Memory Sixteen (A_SizeDirective 16 (A_Plus (A_FromReg (General SixtyFour cs)) (A_Plus (A_FromReg (General SixtyFour rax)) (A_Plus (A_Mult 1 (A_FromReg (General SixtyFour rax))) (A_WordConstant 0))))))), 11)"
    and \<alpha>_def: \<open>\<alpha> = \<lparr>text_sections = [], data_sections = [], labels_to_offsets = [], binary_offset = 0\<rparr>\<close>
    and qemu_malloc\<^sub>a\<^sub>d\<^sub>d\<^sub>r[simp]: \<open>the (label_to_address \<alpha> ''qemu_malloc'') = qemu_malloc_addr\<close>
begin

text \<open>Using definitions that don't get unfolded immediately prevents locale argument issues.\<close>
definition \<open>qemu_malloc_0x5131_retval \<equiv> qemu_malloc_0x5131_retval\<^sub>v\<close>

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

locale "qemu_bh_new" = "qemu_img_xen" +
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

definition P_0x5120_0 :: state_pred where
  \<open>P_0x5120_0 \<sigma> \<equiv> RIP \<sigma> = 0x5120 \<and> RAX \<sigma> = RAX\<^sub>0 \<and> RBX \<sigma> = RBX\<^sub>0 \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = RSP\<^sub>0 \<and> RBP \<sigma> = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address\<close>
declare P_0x5120_0_def[Ps]

definition P_0x5120_0_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x5120_0_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (2, ((RSP\<^sub>0::64 word) - 0x10), 8)
  }\<close>

definition P_0x5120_0_regions :: state_pred where
  \<open>P_0x5120_0_regions \<sigma> \<equiv> \<exists>regions. P_0x5120_0_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x5131_0 :: state_pred where
  \<open>Q_0x5131_0 \<sigma> \<equiv> RIP \<sigma> = 0x5131 \<and> RAX \<sigma> = RAX\<^sub>0 \<and> RBX \<sigma> = RSI\<^sub>0 \<and> RDI \<sigma> = 0x10 \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x18) \<and> RBP \<sigma> = RDI\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = RBX\<^sub>0\<close>
declare Q_0x5131_0_def[Qs]

schematic_goal qemu_bh_new_0_6_0x5120_0x512d_0[blocks]:
  assumes \<open>(P_0x5120_0 && P_0x5120_0_regions) \<sigma>\<close>
  shows \<open>exec_block 6 0x512d 0 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x5131_0 ?\<sigma> \<and> block_usage P_0x5120_0_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x5120_0_def P_0x5120_0_regions_def post: Q_0x5131_0_def regionset: P_0x5120_0_regions_set_def)

definition P_0x5131_1 :: state_pred where
  \<open>P_0x5131_1 \<sigma> \<equiv> RIP \<sigma> = 0x5131 \<and> RAX \<sigma> = RAX\<^sub>0 \<and> RBX \<sigma> = RSI\<^sub>0 \<and> RDI \<sigma> = 0x10 \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x18) \<and> RBP \<sigma> = RDI\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = RBX\<^sub>0\<close>
declare P_0x5131_1_def[Ps]

definition P_0x5131_1_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x5131_1_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (2, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x20), 8)
  }\<close>

definition P_0x5131_1_regions :: state_pred where
  \<open>P_0x5131_1_regions \<sigma> \<equiv> \<exists>regions. P_0x5131_1_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_qemu_malloc_addr_0x5131_1 :: state_pred where
  \<open>Q_qemu_malloc_addr_0x5131_1 \<sigma> \<equiv> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x20) \<and> RIP \<sigma> = qemu_malloc_addr \<and> RAX \<sigma> = RAX\<^sub>0 \<and> RBX \<sigma> = RSI\<^sub>0 \<and> RDI \<sigma> = 0x10 \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RBP \<sigma> = RDI\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = 0x5136\<close>
declare Q_qemu_malloc_addr_0x5131_1_def[Qs]

schematic_goal qemu_bh_new_0_1_0x5131_0x5131_1[blocks]:
  assumes \<open>(P_0x5131_1 && P_0x5131_1_regions) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x5131 (Suc 0) \<sigma> \<triangleq> ?\<sigma> \<and> Q_qemu_malloc_addr_0x5131_1 ?\<sigma> \<and> block_usage P_0x5131_1_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x5131_1_def P_0x5131_1_regions_def post: Q_qemu_malloc_addr_0x5131_1_def regionset: P_0x5131_1_regions_set_def)

definition P_0x5136_2 :: state_pred where
  \<open>P_0x5136_2 \<sigma> \<equiv> RIP \<sigma> = 0x5136 \<and> RAX \<sigma> = qemu_malloc_0x5131_retval \<and> RBX \<sigma> = RSI\<^sub>0 \<and> RDI \<sigma> = 0x10 \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x18) \<and> RBP \<sigma> = RDI\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = 0x5136\<close>
declare P_0x5136_2_def[Ps]

definition P_0x5136_2_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x5136_2_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((qemu_malloc_0x5131_retval::64 word) + 0x8), 8),
    (2, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (5, qemu_malloc_0x5131_retval, 8)
  }\<close>

definition P_0x5136_2_regions :: state_pred where
  \<open>P_0x5136_2_regions \<sigma> \<equiv> \<exists>regions. P_0x5136_2_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_ret_address_2 :: state_pred where
  \<open>Q_ret_address_2 \<sigma> \<equiv> RIP \<sigma> = ret_address \<and> RAX \<sigma> = qemu_malloc_0x5131_retval \<and> RBX \<sigma> = RBX\<^sub>0 \<and> RDI \<sigma> = 0x10 \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) + 0x8) \<and> RBP \<sigma> = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((qemu_malloc_0x5131_retval::64 word) + 0x8),8]::64 word) = RSI\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = 0x5136 \<and> (\<sigma> \<turnstile> *[qemu_malloc_0x5131_retval,8]::64 word) = RDI\<^sub>0\<close>
declare Q_ret_address_2_def[Qs]

schematic_goal qemu_bh_new_0_6_0x5136_0x5143_2[blocks]:
  assumes \<open>(P_0x5136_2 && P_0x5136_2_regions) \<sigma>\<close>
  shows \<open>exec_block 6 0x5143 2 \<sigma> \<triangleq> ?\<sigma> \<and> Q_ret_address_2 ?\<sigma> \<and> block_usage P_0x5136_2_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x5136_2_def P_0x5136_2_regions_def post: Q_ret_address_2_def regionset: P_0x5136_2_regions_set_def)

definition qemu_bh_new_acode :: ACode where
  \<open>qemu_bh_new_acode =
    Block 6 0x512d 0;
    Block (Suc 0) 0x5131 (Suc 0);
    CALL qemu_malloc_acode;
    Block 6 0x5143 2
  \<close>

schematic_goal "qemu_bh_new":
  assumes
    \<open>\<forall>\<sigma>. RIP \<sigma> = 0x5131 \<longrightarrow> P_0x5131_1_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x5136 \<longrightarrow> P_0x5136_2_regions \<sigma>\<close>
    and [blocks]: \<open>{{Q_qemu_malloc_addr_0x5131_1}} \<box>qemu_malloc_acode {{P_0x5136_2;M_0x5131}}\<close>
  shows \<open>{{?P}} qemu_bh_new_acode {{?Q;?M}}\<close>
  by (vcg acode: qemu_bh_new_acode_def assms: assms)

end

end
