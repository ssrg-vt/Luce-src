theory fat_datetime_constprop_8
  imports
    "../../../isabelle/VCG/HTriple"
begin

locale "qemu_img_xen" = execution_context + exec_code +
  fixes localtime_r_0x108b3_retval\<^sub>v stack_chk_fail_0x108e8_retval\<^sub>v stack_chk_fail_addr localtime_r_addr :: \<open>64 word\<close>
    and stack_chk_fail_acode localtime_r_acode :: ACode
  assumes fetch:
    "fetch 0x10890 \<equiv> (Binary (IS_8088 Sub) (Reg (General SixtyFour rsp)) (Immediate SixtyFour (ImmVal 88)), 4)"
    "fetch 0x10894 \<equiv> (Binary (IS_8088 Mov) (Memory SixtyFour (A_SizeDirective 64 (A_Plus (A_FromReg (General SixtyFour rsp)) (A_WordConstant 8)))) (Storage (Reg (General SixtyFour rdi))), 5)"
    "fetch 0x10899 \<equiv> (Binary (IS_8088 Lea) (Reg (General SixtyFour rsi)) (Storage (Memory SixtyFour (A_Plus (A_FromReg (General SixtyFour rsp)) (A_WordConstant 16)))), 5)"
    "fetch 0x1089e \<equiv> (Binary (IS_8088 Lea) (Reg (General SixtyFour rdi)) (Storage (Memory SixtyFour (A_Plus (A_FromReg (General SixtyFour rsp)) (A_WordConstant 8)))), 5)"
    "fetch 0x108a3 \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour rax)) (Storage (Memory SixtyFour (A_SizeDirective 64 (A_Plus (A_FromReg (General SixtyFour fs)) (A_WordConstant 40))))), 9)"
    "fetch 0x108ac \<equiv> (Binary (IS_8088 Mov) (Memory SixtyFour (A_SizeDirective 64 (A_Plus (A_FromReg (General SixtyFour rsp)) (A_WordConstant 72)))) (Storage (Reg (General SixtyFour rax))), 5)"
    "fetch 0x108b1 \<equiv> (Binary (IS_8088 Xor) (Reg (General ThirtyTwo rax)) (Storage (Reg (General ThirtyTwo rax))), 2)"
    "fetch 0x108b3 \<equiv> (Unary (IS_8088 Call) (Immediate SixtyFour (ImmLabel ''localtime_r'')), 5)"
    "fetch 0x108b8 \<equiv> (Binary (IS_8088 Mov) (Reg (General ThirtyTwo rcx)) (Storage (Memory ThirtyTwo (A_SizeDirective 32 (A_Plus (A_FromReg (General SixtyFour rsp)) (A_WordConstant 36))))), 4)"
    "fetch 0x108bc \<equiv> (Binary (IS_8088 Mov) (Reg (General ThirtyTwo rax)) (Storage (Memory ThirtyTwo (A_SizeDirective 32 (A_Plus (A_FromReg (General SixtyFour rsp)) (A_WordConstant 32))))), 4)"
    "fetch 0x108c0 \<equiv> (Binary (IS_8088 Lea) (Reg (General ThirtyTwo rdx)) (Storage (Memory SixtyFour (A_Minus (A_FromReg (General SixtyFour rcx)) (A_WordConstant 80)))), 3)"
    "fetch 0x108c3 \<equiv> (Binary (IS_8088 Add) (Reg (General ThirtyTwo rax)) (Immediate SixtyFour (ImmVal 1)), 3)"
    "fetch 0x108c6 \<equiv> (Binary (IS_8088 Shl) (Reg (General ThirtyTwo rax)) (Immediate SixtyFour (ImmVal 5)), 3)"
    "fetch 0x108c9 \<equiv> (Binary (IS_8088 Shl) (Reg (General ThirtyTwo rdx)) (Immediate SixtyFour (ImmVal 9)), 3)"
    "fetch 0x108cc \<equiv> (Binary (IS_8088 Or) (Reg (General ThirtyTwo rax)) (Storage (Reg (General ThirtyTwo rdx))), 2)"
    "fetch 0x108ce \<equiv> (Binary (IS_8088 Or) (Reg (General Sixteen rax)) (Storage (Memory Sixteen (A_SizeDirective 16 (A_Plus (A_FromReg (General SixtyFour rsp)) (A_WordConstant 28))))), 5)"
    "fetch 0x108d3 \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour rcx)) (Storage (Memory SixtyFour (A_SizeDirective 64 (A_Plus (A_FromReg (General SixtyFour rsp)) (A_WordConstant 72))))), 5)"
    "fetch 0x108d8 \<equiv> (Binary (IS_8088 Xor) (Reg (General SixtyFour rcx)) (Storage (Memory SixtyFour (A_SizeDirective 64 (A_Plus (A_FromReg (General SixtyFour fs)) (A_WordConstant 40))))), 9)"
    "fetch 0x108e1 \<equiv> (Unary (IS_8088 Jne) (Immediate SixtyFour (ImmVal 67816)), 2)"
    "fetch 0x108e3 \<equiv> (Binary (IS_8088 Add) (Reg (General SixtyFour rsp)) (Immediate SixtyFour (ImmVal 88)), 4)"
    "fetch 0x108e7 \<equiv> (Nullary (IS_8088 Ret), 1)"
    "fetch 0x108e8 \<equiv> (Unary (IS_8088 Call) (Immediate SixtyFour (ImmLabel ''__stack_chk_fail'')), 5)"
    and \<alpha>_def: \<open>\<alpha> = \<lparr>text_sections = [], data_sections = [], labels_to_offsets = [], binary_offset = 0\<rparr>\<close>
    and stack_chk_fail\<^sub>a\<^sub>d\<^sub>d\<^sub>r[simp]: \<open>the (label_to_address \<alpha> ''__stack_chk_fail'') = stack_chk_fail_addr\<close>
    and localtime_r\<^sub>a\<^sub>d\<^sub>d\<^sub>r[simp]: \<open>the (label_to_address \<alpha> ''localtime_r'') = localtime_r_addr\<close>
begin

text \<open>Using definitions that don't get unfolded immediately prevents locale argument issues.\<close>
definition \<open>localtime_r_0x108b3_retval \<equiv> localtime_r_0x108b3_retval\<^sub>v\<close>
definition \<open>stack_chk_fail_0x108e8_retval \<equiv> stack_chk_fail_0x108e8_retval\<^sub>v\<close>

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

method vcg_step uses assms add =
  ((rule htriples)+, rule blocks)+,
  (simp add: assms pred_logic Ps Qs add)?,
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

locale "fat_datetime_constprop_8" = "qemu_img_xen" +
  fixes RAX\<^sub>0\<^sub>v RCX\<^sub>0\<^sub>v RDX\<^sub>0\<^sub>v RDI\<^sub>0\<^sub>v RSI\<^sub>0\<^sub>v RSP\<^sub>0\<^sub>v FS\<^sub>0\<^sub>v ret_address\<^sub>v :: \<open>64 word\<close>
begin

text \<open>Using definitions that don't get unfolded immediately prevents locale argument issues.\<close>
definition \<open>RAX\<^sub>0 \<equiv> RAX\<^sub>0\<^sub>v\<close>
definition \<open>RCX\<^sub>0 \<equiv> RCX\<^sub>0\<^sub>v\<close>
definition \<open>RDX\<^sub>0 \<equiv> RDX\<^sub>0\<^sub>v\<close>
definition \<open>RDI\<^sub>0 \<equiv> RDI\<^sub>0\<^sub>v\<close>
definition \<open>RSI\<^sub>0 \<equiv> RSI\<^sub>0\<^sub>v\<close>
definition \<open>RSP\<^sub>0 \<equiv> RSP\<^sub>0\<^sub>v\<close>
definition \<open>FS\<^sub>0 \<equiv> FS\<^sub>0\<^sub>v\<close>
definition \<open>ret_address \<equiv> ret_address\<^sub>v\<close>

definition P_0x10890_0 :: state_pred where
  \<open>P_0x10890_0 \<sigma> \<equiv> RIP \<sigma> = 0x10890 \<and> RAX \<sigma> = RAX\<^sub>0 \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = RDX\<^sub>0 \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = RSP\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address\<close>
declare P_0x10890_0_def[Ps]

definition P_0x10890_0_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x10890_0_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((FS\<^sub>0::64 word) + 0x28), 8),
    (2, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x50), 8)
  }\<close>

definition P_0x10890_0_regions :: state_pred where
  \<open>P_0x10890_0_regions \<sigma> \<equiv> \<exists>regions. P_0x10890_0_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x108b3_0 :: state_pred where
  \<open>Q_0x108b3_0 \<sigma> \<equiv> RIP \<sigma> = 0x108b3 \<and> RAX \<sigma> = 0x0 \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = RDX\<^sub>0 \<and> RDI \<sigma> = ((RSP\<^sub>0::64 word) - 0x50) \<and> RSI \<sigma> = ((RSP\<^sub>0::64 word) - 0x48) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x58) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),8]::64 word) = RDI\<^sub>0\<close>
declare Q_0x108b3_0_def[Qs]

schematic_goal fat_datetime_constprop_8_0_7_0x10890_0x108b1_0[blocks]:
  assumes \<open>(P_0x10890_0 && P_0x10890_0_regions) \<sigma>\<close>
  shows \<open>exec_block 7 0x108b1 0 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x108b3_0 ?\<sigma> \<and> block_usage P_0x10890_0_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x10890_0_def P_0x10890_0_regions_def post: Q_0x108b3_0_def regionset: P_0x10890_0_regions_set_def)

definition P_0x108b3_1 :: state_pred where
  \<open>P_0x108b3_1 \<sigma> \<equiv> RIP \<sigma> = 0x108b3 \<and> RAX \<sigma> = 0x0 \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = RDX\<^sub>0 \<and> RDI \<sigma> = ((RSP\<^sub>0::64 word) - 0x50) \<and> RSI \<sigma> = ((RSP\<^sub>0::64 word) - 0x48) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x58) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),8]::64 word) = RDI\<^sub>0\<close>
declare P_0x108b3_1_def[Ps]

definition P_0x108b3_1_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x108b3_1_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((FS\<^sub>0::64 word) + 0x28), 8),
    (2, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x50), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x60), 8)
  }\<close>

definition P_0x108b3_1_regions :: state_pred where
  \<open>P_0x108b3_1_regions \<sigma> \<equiv> \<exists>regions. P_0x108b3_1_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_localtime_r_addr_0x108b3_1 :: state_pred where
  \<open>Q_localtime_r_addr_0x108b3_1 \<sigma> \<equiv> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x60) \<and> RIP \<sigma> = localtime_r_addr \<and> RAX \<sigma> = 0x0 \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = RDX\<^sub>0 \<and> RDI \<sigma> = ((RSP\<^sub>0::64 word) - 0x50) \<and> RSI \<sigma> = ((RSP\<^sub>0::64 word) - 0x48) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),8]::64 word) = RDI\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x60),8]::64 word) = 0x108b8\<close>
declare Q_localtime_r_addr_0x108b3_1_def[Qs]

schematic_goal fat_datetime_constprop_8_0_1_0x108b3_0x108b3_1[blocks]:
  assumes \<open>(P_0x108b3_1 && P_0x108b3_1_regions) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x108b3 (Suc 0) \<sigma> \<triangleq> ?\<sigma> \<and> Q_localtime_r_addr_0x108b3_1 ?\<sigma> \<and> block_usage P_0x108b3_1_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x108b3_1_def P_0x108b3_1_regions_def post: Q_localtime_r_addr_0x108b3_1_def regionset: P_0x108b3_1_regions_set_def)

definition P_0x108b8_2 :: state_pred where
  \<open>P_0x108b8_2 \<sigma> \<equiv> RIP \<sigma> = 0x108b8 \<and> RAX \<sigma> = localtime_r_0x108b3_retval \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = RDX\<^sub>0 \<and> RDI \<sigma> = ((RSP\<^sub>0::64 word) - 0x50) \<and> RSI \<sigma> = ((RSP\<^sub>0::64 word) - 0x48) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x58) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),8]::64 word) = RDI\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x60),8]::64 word) = 0x108b8\<close>
declare P_0x108b8_2_def[Ps]

definition P_0x108b8_2_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x108b8_2_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((FS\<^sub>0::64 word) + 0x28), 8),
    (2, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x34), 4),
    (4, ((RSP\<^sub>0::64 word) - 0x38), 4),
    (5, ((RSP\<^sub>0::64 word) - 0x3c), Suc (Suc 0)),
    (6, ((RSP\<^sub>0::64 word) - 0x50), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x60), 8)
  }\<close>

definition P_0x108b8_2_regions :: state_pred where
  \<open>P_0x108b8_2_regions \<sigma> \<equiv> \<exists>regions. P_0x108b8_2_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x108e1_2 :: state_pred where
  \<open>Q_0x108e1_2 \<sigma> \<equiv> RIP \<sigma> = 0x108e1 \<and> RAX \<sigma> = (ucast(fst (bv_cat ((ucast (((((\<langle>31,16\<rangle>((ucast (((((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x38),4]::32 word)::32 word) + 0x1)::32 word))::32 word) << 5)::48 word)::48 word) OR (\<langle>31,16\<rangle>((ucast (((\<langle>31,0\<rangle>(((\<langle>32,0\<rangle>(\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x34),4]::32 word)::64 word)::64 word) - 0x50)::32 word)::32 word))::32 word) << 9)::48 word))::48 word))::64 word), 48) ((ucast (((((((\<langle>15,0\<rangle>((ucast (((((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x38),4]::32 word)::32 word) + 0x1)::32 word))::32 word) << 5)::16 word)::16 word) OR (\<langle>15,0\<rangle>((ucast (((\<langle>31,0\<rangle>(((\<langle>32,0\<rangle>(\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x34),4]::32 word)::64 word)::64 word) - 0x50)::32 word)::32 word))::32 word) << 9)::16 word))::16 word) OR (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x3c),2]::16 word))::16 word))::64 word), 16)))::64 word) \<and> RCX \<sigma> = 0x0 \<and> RDX \<sigma> = ucast (((ucast (((\<langle>31,0\<rangle>(((\<langle>32,0\<rangle>(\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x34),4]::32 word)::64 word)::64 word) - 0x50)::32 word)::32 word))::32 word) << 9)) \<and> RDI \<sigma> = ((RSP\<^sub>0::64 word) - 0x50) \<and> RSI \<sigma> = ((RSP\<^sub>0::64 word) - 0x48) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x58) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x34),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x34),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x38),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x38),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x3c),2]::16 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x3c),2]::16 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),8]::64 word) = RDI\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x60),8]::64 word) = 0x108b8\<close>
declare Q_0x108e1_2_def[Qs]

schematic_goal fat_datetime_constprop_8_0_10_0x108b8_0x108d8_2[blocks]:
  assumes \<open>(P_0x108b8_2 && P_0x108b8_2_regions) \<sigma>\<close>
  shows \<open>exec_block 10 0x108d8 2 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x108e1_2 ?\<sigma> \<and> block_usage P_0x108b8_2_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x108b8_2_def P_0x108b8_2_regions_def post: Q_0x108e1_2_def regionset: P_0x108b8_2_regions_set_def)

definition P_0x108e1_true_3 :: state_pred where
  \<open>P_0x108e1_true_3 \<sigma> \<equiv> RIP \<sigma> = 0x108e1 \<and> RAX \<sigma> = (ucast(fst (bv_cat ((ucast (((((\<langle>31,16\<rangle>((ucast (((((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x38),4]::32 word)::32 word) + 0x1)::32 word))::32 word) << 5)::48 word)::48 word) OR (\<langle>31,16\<rangle>((ucast (((\<langle>31,0\<rangle>(((\<langle>32,0\<rangle>(\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x34),4]::32 word)::64 word)::64 word) - 0x50)::32 word)::32 word))::32 word) << 9)::48 word))::48 word))::64 word), 48) ((ucast (((((((\<langle>15,0\<rangle>((ucast (((((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x38),4]::32 word)::32 word) + 0x1)::32 word))::32 word) << 5)::16 word)::16 word) OR (\<langle>15,0\<rangle>((ucast (((\<langle>31,0\<rangle>(((\<langle>32,0\<rangle>(\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x34),4]::32 word)::64 word)::64 word) - 0x50)::32 word)::32 word))::32 word) << 9)::16 word))::16 word) OR (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x3c),2]::16 word))::16 word))::64 word), 16)))::64 word) \<and> RCX \<sigma> = 0x0 \<and> RDX \<sigma> = ucast (((ucast (((\<langle>31,0\<rangle>(((\<langle>32,0\<rangle>(\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x34),4]::32 word)::64 word)::64 word) - 0x50)::32 word)::32 word))::32 word) << 9)) \<and> RDI \<sigma> = ((RSP\<^sub>0::64 word) - 0x50) \<and> RSI \<sigma> = ((RSP\<^sub>0::64 word) - 0x48) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x58) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x34),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x34),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x38),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x38),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x3c),2]::16 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x3c),2]::16 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),8]::64 word) = RDI\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x60),8]::64 word) = 0x108b8\<close>
declare P_0x108e1_true_3_def[Ps]

definition P_0x108e1_true_3_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x108e1_true_3_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((FS\<^sub>0::64 word) + 0x28), 8),
    (2, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x34), 4),
    (4, ((RSP\<^sub>0::64 word) - 0x38), 4),
    (5, ((RSP\<^sub>0::64 word) - 0x3c), Suc (Suc 0)),
    (6, ((RSP\<^sub>0::64 word) - 0x50), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x60), 8)
  }\<close>

definition P_0x108e1_true_3_regions :: state_pred where
  \<open>P_0x108e1_true_3_regions \<sigma> \<equiv> \<exists>regions. P_0x108e1_true_3_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x108e8_3 :: state_pred where
  \<open>Q_0x108e8_3 \<sigma> \<equiv> RIP \<sigma> = 0x108e8 \<and> RAX \<sigma> = (ucast(fst (bv_cat ((ucast (((((\<langle>31,16\<rangle>((ucast (((((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x38),4]::32 word)::32 word) + 0x1)::32 word))::32 word) << 5)::48 word)::48 word) OR (\<langle>31,16\<rangle>((ucast (((\<langle>31,0\<rangle>(((\<langle>32,0\<rangle>(\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x34),4]::32 word)::64 word)::64 word) - 0x50)::32 word)::32 word))::32 word) << 9)::48 word))::48 word))::64 word), 48) ((ucast (((((((\<langle>15,0\<rangle>((ucast (((((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x38),4]::32 word)::32 word) + 0x1)::32 word))::32 word) << 5)::16 word)::16 word) OR (\<langle>15,0\<rangle>((ucast (((\<langle>31,0\<rangle>(((\<langle>32,0\<rangle>(\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x34),4]::32 word)::64 word)::64 word) - 0x50)::32 word)::32 word))::32 word) << 9)::16 word))::16 word) OR (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x3c),2]::16 word))::16 word))::64 word), 16)))::64 word) \<and> RCX \<sigma> = 0x0 \<and> RDX \<sigma> = ucast (((ucast (((\<langle>31,0\<rangle>(((\<langle>32,0\<rangle>(\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x34),4]::32 word)::64 word)::64 word) - 0x50)::32 word)::32 word))::32 word) << 9)) \<and> RDI \<sigma> = ((RSP\<^sub>0::64 word) - 0x50) \<and> RSI \<sigma> = ((RSP\<^sub>0::64 word) - 0x48) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x58) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x34),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x34),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x38),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x38),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x3c),2]::16 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x3c),2]::16 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),8]::64 word) = RDI\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x60),8]::64 word) = 0x108b8\<close>
declare Q_0x108e8_3_def[Qs]

schematic_goal fat_datetime_constprop_8_0_1_0x108e1_0x108e1_3[blocks]:
  assumes \<open>(P_0x108e1_true_3 && P_0x108e1_true_3_regions && !ZF) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x108e1 3 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x108e8_3 ?\<sigma> \<and> block_usage P_0x108e1_true_3_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x108e1_true_3_def P_0x108e1_true_3_regions_def post: Q_0x108e8_3_def regionset: P_0x108e1_true_3_regions_set_def)

definition P_0x108e8_4 :: state_pred where
  \<open>P_0x108e8_4 \<sigma> \<equiv> RIP \<sigma> = 0x108e8 \<and> RAX \<sigma> = (ucast(fst (bv_cat ((ucast (((((\<langle>31,16\<rangle>((ucast (((((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x38),4]::32 word)::32 word) + 0x1)::32 word))::32 word) << 5)::48 word)::48 word) OR (\<langle>31,16\<rangle>((ucast (((\<langle>31,0\<rangle>(((\<langle>32,0\<rangle>(\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x34),4]::32 word)::64 word)::64 word) - 0x50)::32 word)::32 word))::32 word) << 9)::48 word))::48 word))::64 word), 48) ((ucast (((((((\<langle>15,0\<rangle>((ucast (((((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x38),4]::32 word)::32 word) + 0x1)::32 word))::32 word) << 5)::16 word)::16 word) OR (\<langle>15,0\<rangle>((ucast (((\<langle>31,0\<rangle>(((\<langle>32,0\<rangle>(\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x34),4]::32 word)::64 word)::64 word) - 0x50)::32 word)::32 word))::32 word) << 9)::16 word))::16 word) OR (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x3c),2]::16 word))::16 word))::64 word), 16)))::64 word) \<and> RCX \<sigma> = 0x0 \<and> RDX \<sigma> = ucast (((ucast (((\<langle>31,0\<rangle>(((\<langle>32,0\<rangle>(\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x34),4]::32 word)::64 word)::64 word) - 0x50)::32 word)::32 word))::32 word) << 9)) \<and> RDI \<sigma> = ((RSP\<^sub>0::64 word) - 0x50) \<and> RSI \<sigma> = ((RSP\<^sub>0::64 word) - 0x48) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x58) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x34),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x34),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x38),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x38),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x3c),2]::16 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x3c),2]::16 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),8]::64 word) = RDI\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x60),8]::64 word) = 0x108b8\<close>
declare P_0x108e8_4_def[Ps]

definition P_0x108e8_4_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x108e8_4_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((FS\<^sub>0::64 word) + 0x28), 8),
    (2, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x34), 4),
    (4, ((RSP\<^sub>0::64 word) - 0x38), 4),
    (5, ((RSP\<^sub>0::64 word) - 0x3c), 2),
    (6, ((RSP\<^sub>0::64 word) - 0x50), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x60), 8)
  }\<close>

definition P_0x108e8_4_regions :: state_pred where
  \<open>P_0x108e8_4_regions \<sigma> \<equiv> \<exists>regions. P_0x108e8_4_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_stack_chk_fail_addr_0x108e8_4 :: state_pred where
  \<open>Q_stack_chk_fail_addr_0x108e8_4 \<sigma> \<equiv> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x60) \<and> RIP \<sigma> = stack_chk_fail_addr \<and> RAX \<sigma> = (ucast(fst (bv_cat ((ucast (((((\<langle>31,16\<rangle>((ucast (((((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x38),4]::32 word)::32 word) + 0x1)::32 word))::32 word) << 5)::48 word)::48 word) OR (\<langle>31,16\<rangle>((ucast (((\<langle>31,0\<rangle>(((\<langle>32,0\<rangle>(\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x34),4]::32 word)::64 word)::64 word) - 0x50)::32 word)::32 word))::32 word) << 9)::48 word))::48 word))::64 word), 48) ((ucast (((((((\<langle>15,0\<rangle>((ucast (((((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x38),4]::32 word)::32 word) + 0x1)::32 word))::32 word) << 5)::16 word)::16 word) OR (\<langle>15,0\<rangle>((ucast (((\<langle>31,0\<rangle>(((\<langle>32,0\<rangle>(\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x34),4]::32 word)::64 word)::64 word) - 0x50)::32 word)::32 word))::32 word) << 9)::16 word))::16 word) OR (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x3c),2]::16 word))::16 word))::64 word), 16)))::64 word) \<and> RCX \<sigma> = 0x0 \<and> RDX \<sigma> = ucast (((ucast (((\<langle>31,0\<rangle>(((\<langle>32,0\<rangle>(\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x34),4]::32 word)::64 word)::64 word) - 0x50)::32 word)::32 word))::32 word) << 9)) \<and> RDI \<sigma> = ((RSP\<^sub>0::64 word) - 0x50) \<and> RSI \<sigma> = ((RSP\<^sub>0::64 word) - 0x48) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x34),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x34),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x38),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x38),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x3c),2]::16 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x3c),2]::16 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),8]::64 word) = RDI\<^sub>0\<close>
declare Q_stack_chk_fail_addr_0x108e8_4_def[Qs]

schematic_goal fat_datetime_constprop_8_0_1_0x108e8_0x108e8_4[blocks]:
  assumes \<open>(P_0x108e8_4 && P_0x108e8_4_regions) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x108e8 4 \<sigma> \<triangleq> ?\<sigma> \<and> Q_stack_chk_fail_addr_0x108e8_4 ?\<sigma> \<and> block_usage P_0x108e8_4_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x108e8_4_def P_0x108e8_4_regions_def post: Q_stack_chk_fail_addr_0x108e8_4_def regionset: P_0x108e8_4_regions_set_def)

definition P_0x108e1_false_5 :: state_pred where
  \<open>P_0x108e1_false_5 \<sigma> \<equiv> RIP \<sigma> = 0x108e1 \<and> RAX \<sigma> = (ucast(fst (bv_cat ((ucast (((((\<langle>31,16\<rangle>((ucast (((((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x38),4]::32 word)::32 word) + 0x1)::32 word))::32 word) << 5)::48 word)::48 word) OR (\<langle>31,16\<rangle>((ucast (((\<langle>31,0\<rangle>(((\<langle>32,0\<rangle>(\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x34),4]::32 word)::64 word)::64 word) - 0x50)::32 word)::32 word))::32 word) << 9)::48 word))::48 word))::64 word), 48) ((ucast (((((((\<langle>15,0\<rangle>((ucast (((((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x38),4]::32 word)::32 word) + 0x1)::32 word))::32 word) << 5)::16 word)::16 word) OR (\<langle>15,0\<rangle>((ucast (((\<langle>31,0\<rangle>(((\<langle>32,0\<rangle>(\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x34),4]::32 word)::64 word)::64 word) - 0x50)::32 word)::32 word))::32 word) << 9)::16 word))::16 word) OR (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x3c),2]::16 word))::16 word))::64 word), 16)))::64 word) \<and> RCX \<sigma> = 0x0 \<and> RDX \<sigma> = ucast (((ucast (((\<langle>31,0\<rangle>(((\<langle>32,0\<rangle>(\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x34),4]::32 word)::64 word)::64 word) - 0x50)::32 word)::32 word))::32 word) << 9)) \<and> RDI \<sigma> = ((RSP\<^sub>0::64 word) - 0x50) \<and> RSI \<sigma> = ((RSP\<^sub>0::64 word) - 0x48) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x58) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x34),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x34),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x38),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x38),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x3c),2]::16 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x3c),2]::16 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),8]::64 word) = RDI\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x60),8]::64 word) = 0x108b8\<close>
declare P_0x108e1_false_5_def[Ps]

definition P_0x108e1_false_5_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x108e1_false_5_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((FS\<^sub>0::64 word) + 0x28), 8),
    (2, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x34), 4),
    (4, ((RSP\<^sub>0::64 word) - 0x38), 4),
    (5, ((RSP\<^sub>0::64 word) - 0x3c), 2),
    (6, ((RSP\<^sub>0::64 word) - 0x50), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x60), 8)
  }\<close>

definition P_0x108e1_false_5_regions :: state_pred where
  \<open>P_0x108e1_false_5_regions \<sigma> \<equiv> \<exists>regions. P_0x108e1_false_5_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_ret_address_5 :: state_pred where
  \<open>Q_ret_address_5 \<sigma> \<equiv> RIP \<sigma> = ret_address \<and> RCX \<sigma> = 0x0 \<and> RDX \<sigma> = ucast (((ucast (((\<langle>31,0\<rangle>(((\<langle>32,0\<rangle>(\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x34),4]::32 word)::64 word)::64 word) - 0x50)::32 word)::32 word))::32 word) << 9)) \<and> RDI \<sigma> = ((RSP\<^sub>0::64 word) - 0x50) \<and> RSI \<sigma> = ((RSP\<^sub>0::64 word) - 0x48) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x34),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x34),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x38),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x38),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x3c),2]::16 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x3c),2]::16 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),8]::64 word) = RDI\<^sub>0\<close>
declare Q_ret_address_5_def[Qs]

schematic_goal fat_datetime_constprop_8_0_3_0x108e1_0x108e7_5[blocks]:
  assumes \<open>(P_0x108e1_false_5 && P_0x108e1_false_5_regions && ! !ZF) \<sigma>\<close>
  shows \<open>exec_block 3 0x108e7 5 \<sigma> \<triangleq> ?\<sigma> \<and> Q_ret_address_5 ?\<sigma> \<and> block_usage P_0x108e1_false_5_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x108e1_false_5_def P_0x108e1_false_5_regions_def post: Q_ret_address_5_def regionset: P_0x108e1_false_5_regions_set_def)

definition fat_datetime_constprop_8_acode :: ACode where
  \<open>fat_datetime_constprop_8_acode =
    Block 7 0x108b1 0;
    Block (Suc 0) 0x108b3 (Suc 0);
    CALL localtime_r_acode;
    Block 10 0x108d8 2;
    IF !ZF THEN
      Block (Suc 0) 0x108e1 3;
      Block (Suc 0) 0x108e8 4;
      CALL stack_chk_fail_acode
    ELSE
      Block 3 0x108e7 5
    FI
  \<close>

schematic_goal "fat_datetime_constprop_8":
  assumes
    \<open>\<forall>\<sigma>. RIP \<sigma> = 0x108b3 \<longrightarrow> P_0x108b3_1_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x108b8 \<longrightarrow> P_0x108b8_2_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x108e1 \<longrightarrow> P_0x108e1_true_3_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x108e8 \<longrightarrow> P_0x108e8_4_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x108e1 \<longrightarrow> P_0x108e1_false_5_regions \<sigma>\<close>
    and [blocks]: \<open>{{Q_localtime_r_addr_0x108b3_1}} \<box>localtime_r_acode {{P_0x108b8_2;M_0x108b3}}\<close>
    and [blocks]: \<open>{{Q_stack_chk_fail_addr_0x108e8_4}} \<box>stack_chk_fail_acode {{Q_fail;M_0x108e8}}\<close>
  shows \<open>{{?P}} fat_datetime_constprop_8_acode {{?Q;?M}}\<close>
  apply (subst fat_datetime_constprop_8_acode_def)
  apply (vcg_step assms: assms add: simp_rules)+
  done

end
