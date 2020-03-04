theory mktimegm
  imports
    "../../../isabelle/VCG/HTriple"
begin


locale "qemu_img_xen" = execution_context + exec_code +
  assumes fetch:
    "fetch 0x56e0 \<equiv> (Binary (IS_8088 Mov) (Reg (General ThirtyTwo rdx)) (Storage (Memory ThirtyTwo (A_SizeDirective 32 (A_Plus (A_FromReg (General SixtyFour rdi)) (A_WordConstant 16))))), 3)"
    "fetch 0x56e3 \<equiv> (Binary (IS_8088 Mov) (Reg (General ThirtyTwo rsi)) (Storage (Memory ThirtyTwo (A_SizeDirective 32 (A_Plus (A_FromReg (General SixtyFour rdi)) (A_WordConstant 20))))), 3)"
    "fetch 0x56e6 \<equiv> (Binary (IS_8088 Mov) (Reg (General ThirtyTwo rcx)) (Storage (Memory ThirtyTwo (A_SizeDirective 32 (A_Plus (A_FromReg (General SixtyFour rdi)) (A_WordConstant 12))))), 3)"
    "fetch 0x56e9 \<equiv> (Binary (IS_8088 Lea) (Reg (General ThirtyTwo rax)) (Storage (Memory SixtyFour (A_Plus (A_FromReg (General SixtyFour rdx)) (A_WordConstant 1)))), 3)"
    "fetch 0x56ec \<equiv> (Binary (IS_8088 Cmp) (Reg (General ThirtyTwo rax)) (Immediate SixtyFour (ImmVal 2)), 3)"
    "fetch 0x56ef \<equiv> (Unary (IS_8088 Jle) (Immediate SixtyFour (ImmVal 22400)), 6)"
    "fetch 0x56f5 \<equiv> (Binary (IS_8088 Add) (Reg (General ThirtyTwo rsi)) (Immediate SixtyFour (ImmVal 1900)), 6)"
    "fetch 0x56fb \<equiv> (Ternary (IS_8088 Imul) (Reg (General ThirtyTwo rax)) (Storage (Reg (General ThirtyTwo rax))) (Immediate SixtyFour (ImmVal 153)), 6)"
    "fetch 0x5701 \<equiv> (Binary (IS_8088 Mov) (Reg (General ThirtyTwo rdx)) (Immediate SixtyFour (ImmVal 1717986919)), 5)"
    "fetch 0x5706 \<equiv> (Binary (IS_8088 Lea) (Reg (General ThirtyTwo r8)) (Storage (Memory SixtyFour (A_Minus (A_FromReg (General SixtyFour rax)) (A_WordConstant 457)))), 7)"
    "fetch 0x570d \<equiv> (Binary (IS_8088 Mov) (Reg (General ThirtyTwo rax)) (Storage (Reg (General ThirtyTwo r8))), 3)"
    "fetch 0x5710 \<equiv> (Binary (IS_8088 Sar) (Reg (General ThirtyTwo r8)) (Immediate SixtyFour (ImmVal 31)), 4)"
    "fetch 0x5714 \<equiv> (Unary (IS_8088 Imul) (Storage (Reg (General ThirtyTwo rdx))), 2)"
    "fetch 0x5716 \<equiv> (Binary (IS_8088 Mov) (Reg (General ThirtyTwo rax)) (Storage (Reg (General ThirtyTwo rsi))), 2)"
    "fetch 0x5718 \<equiv> (Binary (IS_8088 Sar) (Reg (General ThirtyTwo rdx)) (Immediate SixtyFour (ImmVal 1)), 2)"
    "fetch 0x571a \<equiv> (Binary (IS_8088 Sub) (Reg (General ThirtyTwo rdx)) (Storage (Reg (General ThirtyTwo r8))), 3)"
    "fetch 0x571d \<equiv> (Binary (IS_8088 Add) (Reg (General ThirtyTwo rdx)) (Storage (Reg (General ThirtyTwo rcx))), 2)"
    "fetch 0x571f \<equiv> (Ternary (IS_8088 Imul) (Reg (General ThirtyTwo rcx)) (Storage (Reg (General ThirtyTwo rsi))) (Immediate SixtyFour (ImmVal 365)), 6)"
    "fetch 0x5725 \<equiv> (Binary (IS_8088 Add) (Reg (General ThirtyTwo rdx)) (Storage (Reg (General ThirtyTwo rcx))), 2)"
    "fetch 0x5727 \<equiv> (Binary (IS_8088 Test) (Reg (General ThirtyTwo rsi)) (Storage (Reg (General ThirtyTwo rsi))), 2)"
    "fetch 0x5729 \<equiv> (Binary (IS_8088 Lea) (Reg (General ThirtyTwo rcx)) (Storage (Memory SixtyFour (A_Plus (A_FromReg (General SixtyFour rsi)) (A_WordConstant 3)))), 3)"
    "fetch 0x572c \<equiv> (Binary (IS_PentiumPro Cmovns) (Reg (General ThirtyTwo rcx)) (Storage (Reg (General ThirtyTwo rsi))), 3)"
    "fetch 0x572f \<equiv> (Binary (IS_8088 Sar) (Reg (General ThirtyTwo rsi)) (Immediate SixtyFour (ImmVal 31)), 3)"
    "fetch 0x5732 \<equiv> (Binary (IS_8088 Mov) (Reg (General ThirtyTwo r9)) (Storage (Reg (General ThirtyTwo rsi))), 3)"
    "fetch 0x5735 \<equiv> (Binary (IS_8088 Sar) (Reg (General ThirtyTwo rcx)) (Immediate SixtyFour (ImmVal 2)), 3)"
    "fetch 0x5738 \<equiv> (Binary (IS_8088 Add) (Reg (General ThirtyTwo rcx)) (Storage (Reg (General ThirtyTwo rdx))), 2)"
    "fetch 0x573a \<equiv> (Binary (IS_8088 Mov) (Reg (General ThirtyTwo rdx)) (Immediate SixtyFour (ImmVal 1374389535)), 5)"
    "fetch 0x573f \<equiv> (Unary (IS_8088 Imul) (Storage (Reg (General ThirtyTwo rdx))), 2)"
    "fetch 0x5741 \<equiv> (Binary (IS_8088 Mov) (Reg (General ThirtyTwo rax)) (Storage (Reg (General ThirtyTwo rdx))), 2)"
    "fetch 0x5743 \<equiv> (Binary (IS_8088 Sar) (Reg (General ThirtyTwo rdx)) (Immediate SixtyFour (ImmVal 7)), 3)"
    "fetch 0x5746 \<equiv> (Binary (IS_8088 Sar) (Reg (General ThirtyTwo rax)) (Immediate SixtyFour (ImmVal 5)), 3)"
    "fetch 0x5749 \<equiv> (Binary (IS_8088 Sub) (Reg (General ThirtyTwo rdx)) (Storage (Reg (General ThirtyTwo rsi))), 2)"
    "fetch 0x574b \<equiv> (Binary (IS_8088 Sub) (Reg (General ThirtyTwo r9)) (Storage (Reg (General ThirtyTwo rax))), 3)"
    "fetch 0x574e \<equiv> (Binary (IS_8088 Add) (Reg (General ThirtyTwo rcx)) (Storage (Reg (General ThirtyTwo r9))), 3)"
    "fetch 0x5751 \<equiv> (Binary (IS_8088 Lea) (Reg (General ThirtyTwo rax)) (Storage (Memory SixtyFour (A_Plus (A_FromReg (General SixtyFour rcx)) (A_Minus (A_Mult 1 (A_FromReg (General SixtyFour rdx))) (A_WordConstant 719469))))), 7)"
    "fetch 0x5758 \<equiv> (Ternary (IS_8088 Imul) (Reg (General ThirtyTwo rax)) (Storage (Reg (General ThirtyTwo rax))) (Immediate SixtyFour (ImmVal 86400)), 6)"
    "fetch 0x575e \<equiv> (Ternary (IS_8088 Imul) (Reg (General ThirtyTwo rdx)) (Storage (Memory ThirtyTwo (A_SizeDirective 32 (A_Plus (A_FromReg (General SixtyFour rdi)) (A_WordConstant 8))))) (Immediate SixtyFour (ImmVal 3600)), 7)"
    "fetch 0x5765 \<equiv> (Binary (IS_X86_64 Movsxd) (Reg (General SixtyFour rcx)) (Storage (Reg (General ThirtyTwo rax))), 3)"
    "fetch 0x5768 \<equiv> (Ternary (IS_8088 Imul) (Reg (General ThirtyTwo rax)) (Storage (Memory ThirtyTwo (A_SizeDirective 32 (A_Plus (A_FromReg (General SixtyFour rdi)) (A_WordConstant 4))))) (Immediate SixtyFour (ImmVal 60)), 4)"
    "fetch 0x576c \<equiv> (Binary (IS_8088 Add) (Reg (General ThirtyTwo rdx)) (Storage (Reg (General ThirtyTwo rax))), 2)"
    "fetch 0x576e \<equiv> (Binary (IS_8088 Mov) (Reg (General ThirtyTwo rax)) (Storage (Memory ThirtyTwo (A_SizeDirective 32 (A_FromReg (General SixtyFour rdi))))), 2)"
    "fetch 0x5770 \<equiv> (Binary (IS_8088 Add) (Reg (General ThirtyTwo rax)) (Storage (Reg (General ThirtyTwo rdx))), 2)"
    "fetch 0x5772 \<equiv> (Nullary (IS_X86_64 Cdqe), 2)"
    "fetch 0x5774 \<equiv> (Binary (IS_8088 Add) (Reg (General SixtyFour rax)) (Storage (Reg (General SixtyFour rcx))), 3)"
    "fetch 0x5777 \<equiv> (Nullary (IS_8088 Ret), 1)"
    "fetch 0x5778 \<equiv> (Unary (IS_8088 Nop) (Storage (Memory ThirtyTwo (A_SizeDirective 32 (A_Plus (A_FromReg (General SixtyFour rax)) (A_Plus (A_Mult 1 (A_FromReg (General SixtyFour rax))) (A_WordConstant 0)))))), 8)"
    "fetch 0x5780 \<equiv> (Binary (IS_8088 Lea) (Reg (General ThirtyTwo rax)) (Storage (Memory SixtyFour (A_Plus (A_FromReg (General SixtyFour rdx)) (A_WordConstant 13)))), 3)"
    "fetch 0x5783 \<equiv> (Binary (IS_8088 Add) (Reg (General ThirtyTwo rsi)) (Immediate SixtyFour (ImmVal 1899)), 6)"
    "fetch 0x5789 \<equiv> (Unary (IS_8088 Jmp) (Immediate SixtyFour (ImmVal 22267)), 5)"
    "fetch 0x578e \<equiv> (Binary (IS_8088 Xchg) (Reg (General Sixteen rax)) (Storage (Reg (General Sixteen rax))), 5)"
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
  auto simp: block_usage_def eq_def setcc_def cmovcc_def if'_then_else_def sub_sign_flag_def simp_rules Let'_def read_region'_def write_block'_def get'_def set'_def post regionset

method vcg_step uses assms =
  ((rule htriples)+, rule blocks)+,
  (simp add: assms pred_logic Ps Qs)?,
  (((auto simp: eq_def)[])+)?

method vcg_step' uses assms =
  (rule htriples)+,
  simp,
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

locale "mktimegm" = "qemu_img_xen" +
  fixes RAX\<^sub>0\<^sub>v RCX\<^sub>0\<^sub>v RDX\<^sub>0\<^sub>v RDI\<^sub>0\<^sub>v RSI\<^sub>0\<^sub>v RSP\<^sub>0\<^sub>v R9\<^sub>0\<^sub>v R8\<^sub>0\<^sub>v ret_address\<^sub>v :: \<open>64 word\<close>
begin

text \<open>Using definitions that don't get unfolded immediately prevents locale argument issues.\<close>
definition \<open>RAX\<^sub>0 \<equiv> RAX\<^sub>0\<^sub>v\<close>
definition \<open>RCX\<^sub>0 \<equiv> RCX\<^sub>0\<^sub>v\<close>
definition \<open>RDX\<^sub>0 \<equiv> RDX\<^sub>0\<^sub>v\<close>
definition \<open>RDI\<^sub>0 \<equiv> RDI\<^sub>0\<^sub>v\<close>
definition \<open>RSI\<^sub>0 \<equiv> RSI\<^sub>0\<^sub>v\<close>
definition \<open>RSP\<^sub>0 \<equiv> RSP\<^sub>0\<^sub>v\<close>
definition \<open>R9\<^sub>0 \<equiv> R9\<^sub>0\<^sub>v\<close>
definition \<open>R8\<^sub>0 \<equiv> R8\<^sub>0\<^sub>v\<close>
definition \<open>ret_address \<equiv> ret_address\<^sub>v\<close>

definition P_0x56e0_0 :: state_pred where
  \<open>P_0x56e0_0 \<sigma> \<equiv> RIP \<sigma> = 0x56e0 \<and> RAX \<sigma> = RAX\<^sub>0 \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = RDX\<^sub>0 \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = RSP\<^sub>0 \<and> R9 \<sigma> = R9\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address\<close>
declare P_0x56e0_0_def[Ps]

definition P_0x56e0_0_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x56e0_0_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((RDI\<^sub>0::64 word) + 0xc), 4),
    (2, ((RDI\<^sub>0::64 word) + 0x10), 4),
    (3, ((RDI\<^sub>0::64 word) + 0x14), 4)
  }\<close>

definition P_0x56e0_0_regions :: state_pred where
  \<open>P_0x56e0_0_regions \<sigma> \<equiv> \<exists>regions. P_0x56e0_0_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x56ef_0 :: state_pred where
  \<open>Q_0x56ef_0 \<sigma> \<equiv> RIP \<sigma> = 0x56ef \<and> RAX \<sigma> = ucast ((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x10),4]::32 word)::64 word)::64 word) + 0x1)::32 word)) \<and> RCX \<sigma> = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0xc),4]::32 word)) \<and> RDX \<sigma> = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x10),4]::32 word)) \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x14),4]::32 word)) \<and> RSP \<sigma> = RSP\<^sub>0 \<and> R9 \<sigma> = R9\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0xc),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0xc),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x10),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x10),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x14),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x14),4]::32 word))\<close>
declare Q_0x56ef_0_def[Qs]

schematic_goal mktimegm_0_5_0x56e0_0x56ec_0[blocks]:
  assumes \<open>(P_0x56e0_0 && P_0x56e0_0_regions) \<sigma>\<close>
  shows \<open>exec_block 5 0x56ec 0 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x56ef_0 ?\<sigma> \<and> block_usage P_0x56e0_0_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x56e0_0_def P_0x56e0_0_regions_def post: Q_0x56ef_0_def regionset: P_0x56e0_0_regions_set_def)

definition P_0x56ef_true_1 :: state_pred where
  \<open>P_0x56ef_true_1 \<sigma> \<equiv> RIP \<sigma> = 0x56ef \<and> RAX \<sigma> = ucast ((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x10),4]::32 word)::64 word)::64 word) + 0x1)::32 word)) \<and> RCX \<sigma> = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0xc),4]::32 word)) \<and> RDX \<sigma> = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x10),4]::32 word)) \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x14),4]::32 word)) \<and> RSP \<sigma> = RSP\<^sub>0 \<and> R9 \<sigma> = R9\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0xc),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0xc),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x10),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x10),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x14),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x14),4]::32 word))\<close>
declare P_0x56ef_true_1_def[Ps]

definition P_0x56ef_true_1_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x56ef_true_1_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((RDI\<^sub>0::64 word) + 0xc), 4),
    (2, ((RDI\<^sub>0::64 word) + 0x10), 4),
    (3, ((RDI\<^sub>0::64 word) + 0x14), 4)
  }\<close>

definition P_0x56ef_true_1_regions :: state_pred where
  \<open>P_0x56ef_true_1_regions \<sigma> \<equiv> \<exists>regions. P_0x56ef_true_1_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x56fb_1 :: state_pred where
  \<open>Q_0x56fb_1 \<sigma> \<equiv> RIP \<sigma> = 0x56fb \<and> RCX \<sigma> = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0xc),4]::32 word)) \<and> RDX \<sigma> = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x10),4]::32 word)) \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSP \<sigma> = RSP\<^sub>0 \<and> R9 \<sigma> = R9\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0xc),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0xc),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x10),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x10),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x14),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x14),4]::32 word))\<close>
declare Q_0x56fb_1_def[Qs]

schematic_goal mktimegm_0_4_0x56ef_0x5789_1[blocks]:
  assumes \<open>(P_0x56ef_true_1 && P_0x56ef_true_1_regions && jle) \<sigma>\<close>
  shows \<open>exec_block 4 0x5789 (Suc 0) \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x56fb_1 ?\<sigma> \<and> block_usage P_0x56ef_true_1_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x56ef_true_1_def P_0x56ef_true_1_regions_def post: Q_0x56fb_1_def regionset: P_0x56ef_true_1_regions_set_def)

definition P_0x56ef_false_2 :: state_pred where
  \<open>P_0x56ef_false_2 \<sigma> \<equiv> RIP \<sigma> = 0x56ef \<and> RAX \<sigma> = ucast ((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x10),4]::32 word)::64 word)::64 word) + 0x1)::32 word)) \<and> RCX \<sigma> = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0xc),4]::32 word)) \<and> RDX \<sigma> = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x10),4]::32 word)) \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x14),4]::32 word)) \<and> RSP \<sigma> = RSP\<^sub>0 \<and> R9 \<sigma> = R9\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0xc),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0xc),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x10),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x10),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x14),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x14),4]::32 word))\<close>
declare P_0x56ef_false_2_def[Ps]

definition P_0x56ef_false_2_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x56ef_false_2_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((RDI\<^sub>0::64 word) + 0xc), 4),
    (2, ((RDI\<^sub>0::64 word) + 0x10), 4),
    (3, ((RDI\<^sub>0::64 word) + 0x14), 4)
  }\<close>

definition P_0x56ef_false_2_regions :: state_pred where
  \<open>P_0x56ef_false_2_regions \<sigma> \<equiv> \<exists>regions. P_0x56ef_false_2_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x56fb_2 :: state_pred where
  \<open>Q_0x56fb_2 \<sigma> \<equiv> RIP \<sigma> = 0x56fb \<and> RCX \<sigma> = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0xc),4]::32 word)) \<and> RDX \<sigma> = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x10),4]::32 word)) \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSP \<sigma> = RSP\<^sub>0 \<and> R9 \<sigma> = R9\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0xc),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0xc),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x10),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x10),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x14),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x14),4]::32 word))\<close>
declare Q_0x56fb_2_def[Qs]

schematic_goal mktimegm_0_2_0x56ef_0x56f5_2[blocks]:
  assumes \<open>(P_0x56ef_false_2 && P_0x56ef_false_2_regions && ! jle) \<sigma>\<close>
  shows \<open>exec_block 2 0x56f5 2 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x56fb_2 ?\<sigma> \<and> block_usage P_0x56ef_false_2_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x56ef_false_2_def P_0x56ef_false_2_regions_def post: Q_0x56fb_2_def regionset: P_0x56ef_false_2_regions_set_def)

definition P_0x56fb_3 :: state_pred where
  \<open>P_0x56fb_3 \<sigma> \<equiv> RIP \<sigma> = 0x56fb \<and> RCX \<sigma> = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0xc),4]::32 word)) \<and> RDX \<sigma> = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x10),4]::32 word)) \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSP \<sigma> = RSP\<^sub>0 \<and> R9 \<sigma> = R9\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0xc),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0xc),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x10),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x10),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x14),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x14),4]::32 word))\<close>
declare P_0x56fb_3_def[Ps]

definition P_0x56fb_3_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x56fb_3_regions_set \<sigma> \<equiv> {
    (0, RDI\<^sub>0, 4),
    (1, RSP\<^sub>0, 8),
    (2, ((RDI\<^sub>0::64 word) + 0x4), 4),
    (3, ((RDI\<^sub>0::64 word) + 0x8), 4),
    (4, ((RDI\<^sub>0::64 word) + 0xc), 4),
    (5, ((RDI\<^sub>0::64 word) + 0x10), 4),
    (6, ((RDI\<^sub>0::64 word) + 0x14), 4)
  }\<close>

definition P_0x56fb_3_regions :: state_pred where
  \<open>P_0x56fb_3_regions \<sigma> \<equiv> \<exists>regions. P_0x56fb_3_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_ret_address_3 :: state_pred where
  \<open>Q_ret_address_3 \<sigma> \<equiv> RIP \<sigma> = ret_address \<and> RDX \<sigma> = ucast ((((\<langle>31,0\<rangle>(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8),4]::32 word)::32 word) * 0xe10)::32 word)::32 word) + (\<langle>31,0\<rangle>(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x4),4]::32 word)::32 word) * 0x3c)::32 word))) \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) + 0x8) \<and> (\<sigma> \<turnstile> *[RDI\<^sub>0,4]::32 word) = ucast ((\<sigma> \<turnstile> *[RDI\<^sub>0,4]::32 word)) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x4),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x4),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0xc),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0xc),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x10),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x10),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x14),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x14),4]::32 word))\<close>
declare Q_ret_address_3_def[Qs]

schematic_goal mktimegm_0_38_0x56fb_0x5777_3[blocks]:
  assumes \<open>(P_0x56fb_3 && P_0x56fb_3_regions) \<sigma>\<close>
  shows \<open>exec_block 38 0x5777 3 \<sigma> \<triangleq> ?\<sigma> \<and> Q_ret_address_3 ?\<sigma> \<and> block_usage P_0x56fb_3_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x56fb_3_def P_0x56fb_3_regions_def post: Q_ret_address_3_def regionset: P_0x56fb_3_regions_set_def)

definition mktimegm_acode :: ACode where
  \<open>mktimegm_acode =
    Block 5 0x56ec 0;
    IF jle THEN
      Block 4 0x5789 (Suc 0)
    ELSE
      Block 2 0x56f5 2
    FI;
    Block 38 0x5777 3
  \<close>

schematic_goal "mktimegm":
  assumes
    \<open>\<forall>\<sigma>. RIP \<sigma> = 0x56ef \<longrightarrow> P_0x56ef_true_1_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x56ef \<longrightarrow> P_0x56ef_false_2_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x56fb \<longrightarrow> P_0x56fb_3_regions \<sigma>\<close>
  shows \<open>{{?P}} mktimegm_acode {{?Q;?M}}\<close>
  by (vcg acode: mktimegm_acode_def assms: assms)
end
