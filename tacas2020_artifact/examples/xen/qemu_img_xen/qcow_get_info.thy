theory qcow_get_info
  imports
    "../../../isabelle/VCG/HTriple"
begin

locale "qemu_img_xen" = execution_context + exec_code +
  assumes fetch:
    "fetch 0x6170 \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour rax)) (Storage (Memory SixtyFour (A_SizeDirective 64 (A_Plus (A_FromReg (General SixtyFour rdi)) (A_WordConstant 64))))), 4)"
    "fetch 0x6174 \<equiv> (Binary (IS_8088 Mov) (Reg (General ThirtyTwo rax)) (Storage (Memory ThirtyTwo (A_SizeDirective 32 (A_Plus (A_FromReg (General SixtyFour rax)) (A_WordConstant 12))))), 3)"
    "fetch 0x6177 \<equiv> (Binary (IS_8088 Mov) (Memory ThirtyTwo (A_SizeDirective 32 (A_FromReg (General SixtyFour rsi)))) (Storage (Reg (General ThirtyTwo rax))), 2)"
    "fetch 0x6179 \<equiv> (Binary (IS_8088 Xor) (Reg (General ThirtyTwo rax)) (Storage (Reg (General ThirtyTwo rax))), 2)"
    "fetch 0x617b \<equiv> (Nullary (IS_8088 Ret), 1)"
    "fetch 0x12820 \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour rax)) (Storage (Memory SixtyFour (A_SizeDirective 64 (A_Plus (A_FromReg (General SixtyFour rdi)) (A_WordConstant 64))))), 4)"
    "fetch 0x12824 \<equiv> (Binary (IS_8088 Mov) (Reg (General ThirtyTwo rdx)) (Storage (Memory ThirtyTwo (A_SizeDirective 32 (A_Plus (A_FromReg (General SixtyFour rax)) (A_WordConstant 12))))), 3)"
    "fetch 0x12827 \<equiv> (Binary (IS_8088 Mov) (Memory ThirtyTwo (A_SizeDirective 32 (A_FromReg (General SixtyFour rsi)))) (Storage (Reg (General ThirtyTwo rdx))), 2)"
    "fetch 0x12829 \<equiv> (Binary (IS_X86_64 Movsxd) (Reg (General SixtyFour rdx)) (Storage (Memory ThirtyTwo (A_SizeDirective 32 (A_Plus (A_FromReg (General SixtyFour rax)) (A_WordConstant 32))))), 4)"
    "fetch 0x1282d \<equiv> (Binary (IS_8088 Mov) (Reg (General ThirtyTwo rcx)) (Storage (Memory ThirtyTwo (A_SizeDirective 32 (A_Plus (A_FromReg (General SixtyFour rax)) (A_WordConstant 20))))), 3)"
    "fetch 0x12830 \<equiv> (Binary (IS_8088 Add) (Reg (General ThirtyTwo rcx)) (Storage (Memory ThirtyTwo (A_SizeDirective 32 (A_Plus (A_FromReg (General SixtyFour rax)) (A_WordConstant 8))))), 3)"
    "fetch 0x12833 \<equiv> (Binary (IS_8088 Xor) (Reg (General ThirtyTwo rax)) (Storage (Reg (General ThirtyTwo rax))), 2)"
    "fetch 0x12835 \<equiv> (Binary (IS_8088 Shl) (Reg (General SixtyFour rdx)) (Storage (Reg (General Eight rcx))), 3)"
    "fetch 0x12838 \<equiv> (Binary (IS_8088 Mov) (Memory SixtyFour (A_SizeDirective 64 (A_Plus (A_FromReg (General SixtyFour rsi)) (A_WordConstant 8)))) (Storage (Reg (General SixtyFour rdx))), 4)"
    "fetch 0x1283c \<equiv> (Nullary (IS_8088 Ret), 1)"
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

locale "qcow_get_info_1" = "qemu_img_xen" +
  fixes RAX\<^sub>0\<^sub>v RDI\<^sub>0\<^sub>v RSI\<^sub>0\<^sub>v RSP\<^sub>0\<^sub>v ret_address\<^sub>v :: \<open>64 word\<close>
begin

text \<open>Using definitions that don't get unfolded immediately prevents locale argument issues.\<close>
definition \<open>RAX\<^sub>0 \<equiv> RAX\<^sub>0\<^sub>v\<close>
definition \<open>RDI\<^sub>0 \<equiv> RDI\<^sub>0\<^sub>v\<close>
definition \<open>RSI\<^sub>0 \<equiv> RSI\<^sub>0\<^sub>v\<close>
definition \<open>RSP\<^sub>0 \<equiv> RSP\<^sub>0\<^sub>v\<close>
definition \<open>ret_address \<equiv> ret_address\<^sub>v\<close>

definition P_0x6170_0 :: state_pred where
  \<open>P_0x6170_0 \<sigma> \<equiv> RIP \<sigma> = 0x6170 \<and> RAX \<sigma> = RAX\<^sub>0 \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = RSP\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address\<close>
declare P_0x6170_0_def[Ps]

definition P_0x6170_0_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x6170_0_regions_set \<sigma> \<equiv> {
    (0, RSI\<^sub>0, 4),
    (1, RSP\<^sub>0, 8),
    (2, ((RDI\<^sub>0::64 word) + 0x40), 8),
    (3, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0xc), 4)
  }\<close>

definition P_0x6170_0_regions :: state_pred where
  \<open>P_0x6170_0_regions \<sigma> \<equiv> \<exists>regions. P_0x6170_0_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_ret_address_0 :: state_pred where
  \<open>Q_ret_address_0 \<sigma> \<equiv> RIP \<sigma> = ret_address \<and> RAX \<sigma> = 0x0 \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) + 0x8) \<and> (\<sigma> \<turnstile> *[RSI\<^sub>0,4]::32 word) = ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0xc),4]::32 word)) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0xc),4]::32 word) = ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0xc),4]::32 word))\<close>
declare Q_ret_address_0_def[Qs]

schematic_goal qcow_get_info_1_0_5_0x6170_0x617b_0[blocks]:
  assumes \<open>(P_0x6170_0 && P_0x6170_0_regions) \<sigma>\<close>
  shows \<open>exec_block 5 0x617b 0 \<sigma> \<triangleq> ?\<sigma> \<and> Q_ret_address_0 ?\<sigma> \<and> block_usage P_0x6170_0_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x6170_0_def P_0x6170_0_regions_def post: Q_ret_address_0_def regionset: P_0x6170_0_regions_set_def)

definition qcow_get_info_1_acode :: ACode where
  \<open>qcow_get_info_1_acode =
    Block 5 0x617b 0
  \<close>

schematic_goal "qcow_get_info_1":
  \<open>{{?P}} qcow_get_info_1_acode {{?Q;?M}}\<close>
  by (vcg acode: qcow_get_info_1_acode_def)

end

locale "qcow_get_info" = "qemu_img_xen" +
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

definition P_0x12820_0 :: state_pred where
  \<open>P_0x12820_0 \<sigma> \<equiv> RIP \<sigma> = 0x12820 \<and> RAX \<sigma> = RAX\<^sub>0 \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = RDX\<^sub>0 \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = RSP\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address\<close>
declare P_0x12820_0_def[Ps]

definition P_0x12820_0_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x12820_0_regions_set \<sigma> \<equiv> {
    (0, RSI\<^sub>0, 4),
    (1, RSP\<^sub>0, 8),
    (2, ((RDI\<^sub>0::64 word) + 0x40), 8),
    (3, ((RSI\<^sub>0::64 word) + 0x8), 8),
    (4, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8), 4),
    (5, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0xc), 4),
    (6, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x14), 4),
    (7, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x20), 4)
  }\<close>

definition P_0x12820_0_regions :: state_pred where
  \<open>P_0x12820_0_regions \<sigma> \<equiv> \<exists>regions. P_0x12820_0_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_ret_address_0 :: state_pred where
  \<open>Q_ret_address_0 \<sigma> \<equiv> RIP \<sigma> = ret_address \<and> RAX \<sigma> = 0x0 \<and> RCX \<sigma> = ucast ((((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x14),4]::32 word)::32 word) + (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),4]::32 word))) \<and> RDX \<sigma> = ((sextend (ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x20),4]::32 word))) 32 64::64 word) << unat (((\<langle>7,0\<rangle>(((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x14),4]::32 word)::32 word) + (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),4]::32 word))::8 word)::8 word))) \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) + 0x8) \<and> (\<sigma> \<turnstile> *[RSI\<^sub>0,4]::32 word) = ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0xc),4]::32 word)) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x8),8]::64 word) = ((sextend (ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x20),4]::32 word))) 32 64::64 word) << unat (((\<langle>7,0\<rangle>(((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x14),4]::32 word)::32 word) + (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),4]::32 word))::8 word)::8 word))) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),4]::32 word) = ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),4]::32 word)) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0xc),4]::32 word) = ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0xc),4]::32 word)) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x14),4]::32 word) = ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x14),4]::32 word)) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x20),4]::32 word) = ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x20),4]::32 word))\<close>
declare Q_ret_address_0_def[Qs]

schematic_goal qcow_get_info_0_10_0x12820_0x1283c_0[blocks]:
  assumes \<open>(P_0x12820_0 && P_0x12820_0_regions) \<sigma>\<close>
  shows \<open>exec_block 10 0x1283c 0 \<sigma> \<triangleq> ?\<sigma> \<and> Q_ret_address_0 ?\<sigma> \<and> block_usage P_0x12820_0_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x12820_0_def P_0x12820_0_regions_def post: Q_ret_address_0_def regionset: P_0x12820_0_regions_set_def)

definition qcow_get_info_acode :: ACode where
  \<open>qcow_get_info_acode =
    Block 10 0x1283c 0
  \<close>

schematic_goal "qcow_get_info":
  \<open>{{?P}} qcow_get_info_acode {{?Q;?M}}\<close>
  by (vcg acode: qcow_get_info_acode_def)

end
