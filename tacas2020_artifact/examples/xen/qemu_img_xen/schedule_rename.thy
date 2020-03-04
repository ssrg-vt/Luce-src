theory schedule_rename
  imports
    "../../../isabelle/VCG/HTriple"
begin

locale "qemu_img_xen" = execution_context + exec_code +
  fixes UD2_0x373f_retval\<^sub>v qemu_realloc_0xc9d7_retval\<^sub>v assert_fail_0xca0f_retval\<^sub>v UD2_addr assert_fail_addr qemu_realloc_addr :: \<open>64 word\<close>
    and UD2_acode assert_fail_acode qemu_realloc_acode :: ACode
  assumes fetch:
    "fetch 0x3737 \<equiv> (Binary (IS_8088 Mov) (Memory SixtyFour (A_SizeDirective 64 (A_Plus (A_FromReg (General SixtyFour ds)) (A_WordConstant 0)))) (Storage (Reg (General SixtyFour r15))), 8)"
    "fetch 0x373f \<equiv> (Unary (IS_8088 Call) (Immediate SixtyFour (ImmLabel ''UD2'')), 5)"
    "fetch 0xc950 \<equiv> (Unary (IS_8088 Push) (Storage (Reg (General SixtyFour r15))), 2)"
    "fetch 0xc952 \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour r15)) (Storage (Reg (General SixtyFour rdx))), 3)"
    "fetch 0xc955 \<equiv> (Unary (IS_8088 Push) (Storage (Reg (General SixtyFour r14))), 2)"
    "fetch 0xc957 \<equiv> (Binary (IS_8088 Mov) (Reg (General ThirtyTwo r14)) (Storage (Reg (General ThirtyTwo rsi))), 3)"
    "fetch 0xc95a \<equiv> (Unary (IS_8088 Push) (Storage (Reg (General SixtyFour r13))), 2)"
    "fetch 0xc95c \<equiv> (Unary (IS_8088 Push) (Storage (Reg (General SixtyFour r12))), 2)"
    "fetch 0xc95e \<equiv> (Unary (IS_8088 Push) (Storage (Reg (General SixtyFour rbp))), 1)"
    "fetch 0xc95f \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour rbp)) (Storage (Reg (General SixtyFour rdi))), 3)"
    "fetch 0xc962 \<equiv> (Unary (IS_8088 Push) (Storage (Reg (General SixtyFour rbx))), 1)"
    "fetch 0xc963 \<equiv> (Binary (IS_8088 Sub) (Reg (General SixtyFour rsp)) (Immediate SixtyFour (ImmVal 8)), 4)"
    "fetch 0xc967 \<equiv> (Binary (IS_8088 Mov) (Reg (General ThirtyTwo rbx)) (Storage (Memory ThirtyTwo (A_SizeDirective 32 (A_Plus (A_FromReg (General SixtyFour rdi)) (A_WordConstant 32980))))), 6)"
    "fetch 0xc96d \<equiv> (Binary (IS_8088 Mov) (Reg (General ThirtyTwo rax)) (Storage (Memory ThirtyTwo (A_SizeDirective 32 (A_Plus (A_FromReg (General SixtyFour rdi)) (A_WordConstant 32984))))), 6)"
    "fetch 0xc973 \<equiv> (Binary (IS_8088 Lea) (Reg (General ThirtyTwo r12)) (Storage (Memory SixtyFour (A_Plus (A_FromReg (General SixtyFour rbx)) (A_WordConstant 1)))), 4)"
    "fetch 0xc977 \<equiv> (Binary (IS_8088 Mov) (Reg (General ThirtyTwo rcx)) (Storage (Reg (General ThirtyTwo r12))), 3)"
    "fetch 0xc97a \<equiv> (Binary (IS_8088 Imul) (Reg (General ThirtyTwo rcx)) (Storage (Reg (General ThirtyTwo rax))), 3)"
    "fetch 0xc97d \<equiv> (Binary (IS_8088 Cmp) (Reg (General ThirtyTwo rcx)) (Storage (Memory ThirtyTwo (A_SizeDirective 32 (A_Plus (A_FromReg (General SixtyFour rdi)) (A_WordConstant 32976))))), 6)"
    "fetch 0xc983 \<equiv> (Unary (IS_8088 Ja) (Immediate SixtyFour (ImmVal 51648)), 2)"
    "fetch 0xc985 \<equiv> (Binary (IS_8088 Mov) (Memory ThirtyTwo (A_SizeDirective 32 (A_Plus (A_FromReg (General SixtyFour rbp)) (A_WordConstant 32980)))) (Storage (Reg (General ThirtyTwo r12))), 7)"
    "fetch 0xc98c \<equiv> (Binary (IS_8088 Cmp) (Reg (General ThirtyTwo rbx)) (Storage (Reg (General ThirtyTwo r12))), 3)"
    "fetch 0xc98f \<equiv> (Unary (IS_8088 Jae) (Immediate SixtyFour (ImmVal 51701)), 2)"
    "fetch 0xc991 \<equiv> (Binary (IS_8088 Imul) (Reg (General ThirtyTwo rbx)) (Storage (Memory ThirtyTwo (A_SizeDirective 32 (A_Plus (A_FromReg (General SixtyFour rbp)) (A_WordConstant 32984))))), 7)"
    "fetch 0xc998 \<equiv> (Binary (IS_8088 Add) (Reg (General SixtyFour rbx)) (Storage (Memory SixtyFour (A_SizeDirective 64 (A_Plus (A_FromReg (General SixtyFour rbp)) (A_WordConstant 32968))))), 7)"
    "fetch 0xc99f \<equiv> (Binary (IS_8088 Mov) (Memory SixtyFour (A_SizeDirective 64 (A_FromReg (General SixtyFour rbx)))) (Storage (Reg (General SixtyFour r15))), 3)"
    "fetch 0xc9a2 \<equiv> (Binary (IS_8088 Mov) (Memory ThirtyTwo (A_SizeDirective 32 (A_Plus (A_FromReg (General SixtyFour rbx)) (A_WordConstant 8)))) (Storage (Reg (General ThirtyTwo r14))), 4)"
    "fetch 0xc9a6 \<equiv> (Binary (IS_8088 Mov) (Memory ThirtyTwo (A_SizeDirective 32 (A_Plus (A_FromReg (General SixtyFour rbx)) (A_WordConstant 16)))) (Immediate SixtyFour (ImmVal 0)), 7)"
    "fetch 0xc9ad \<equiv> (Binary (IS_8088 Add) (Reg (General SixtyFour rsp)) (Immediate SixtyFour (ImmVal 8)), 4)"
    "fetch 0xc9b1 \<equiv> (Unary (IS_8088 Pop) (Storage (Reg (General SixtyFour rbx))), 1)"
    "fetch 0xc9b2 \<equiv> (Unary (IS_8088 Pop) (Storage (Reg (General SixtyFour rbp))), 1)"
    "fetch 0xc9b3 \<equiv> (Unary (IS_8088 Pop) (Storage (Reg (General SixtyFour r12))), 2)"
    "fetch 0xc9b5 \<equiv> (Unary (IS_8088 Pop) (Storage (Reg (General SixtyFour r13))), 2)"
    "fetch 0xc9b7 \<equiv> (Unary (IS_8088 Pop) (Storage (Reg (General SixtyFour r14))), 2)"
    "fetch 0xc9b9 \<equiv> (Unary (IS_8088 Pop) (Storage (Reg (General SixtyFour r15))), 2)"
    "fetch 0xc9bb \<equiv> (Nullary (IS_8088 Ret), 1)"
    "fetch 0xc9bc \<equiv> (Unary (IS_8088 Nop) (Storage (Memory ThirtyTwo (A_SizeDirective 32 (A_Plus (A_FromReg (General SixtyFour rax)) (A_WordConstant 0))))), 4)"
    "fetch 0xc9c0 \<equiv> (Binary (IS_8088 Mov) (Reg (General ThirtyTwo r13)) (Storage (Reg (General ThirtyTwo rax))), 3)"
    "fetch 0xc9c3 \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour rdi)) (Storage (Memory SixtyFour (A_SizeDirective 64 (A_Plus (A_FromReg (General SixtyFour rdi)) (A_WordConstant 32968))))), 7)"
    "fetch 0xc9ca \<equiv> (Binary (IS_8088 Shl) (Reg (General ThirtyTwo r13)) (Immediate SixtyFour (ImmVal 5)), 4)"
    "fetch 0xc9ce \<equiv> (Binary (IS_8088 Sub) (Reg (General ThirtyTwo r13)) (Storage (Reg (General ThirtyTwo rax))), 3)"
    "fetch 0xc9d1 \<equiv> (Binary (IS_8088 Add) (Reg (General ThirtyTwo r13)) (Storage (Reg (General ThirtyTwo rcx))), 3)"
    "fetch 0xc9d4 \<equiv> (Binary (IS_X86_64 Movsxd) (Reg (General SixtyFour rsi)) (Storage (Reg (General ThirtyTwo r13))), 3)"
    "fetch 0xc9d7 \<equiv> (Unary (IS_8088 Call) (Immediate SixtyFour (ImmLabel ''qemu_realloc'')), 5)"
    "fetch 0xc9dc \<equiv> (Binary (IS_8088 Mov) (Memory SixtyFour (A_SizeDirective 64 (A_Plus (A_FromReg (General SixtyFour rbp)) (A_WordConstant 32968)))) (Storage (Reg (General SixtyFour rax))), 7)"
    "fetch 0xc9e3 \<equiv> (Binary (IS_8088 Test) (Reg (General SixtyFour rax)) (Storage (Reg (General SixtyFour rax))), 3)"
    "fetch 0xc9e6 \<equiv> (Unary (IS_8088 Je) (Immediate SixtyFour (ImmVal 14135)), 6)"
    "fetch 0xc9ec \<equiv> (Binary (IS_8088 Mov) (Memory ThirtyTwo (A_SizeDirective 32 (A_Plus (A_FromReg (General SixtyFour rbp)) (A_WordConstant 32976)))) (Storage (Reg (General ThirtyTwo r13))), 7)"
    "fetch 0xc9f3 \<equiv> (Unary (IS_8088 Jmp) (Immediate SixtyFour (ImmVal 51589)), 2)"
    "fetch 0xc9f5 \<equiv> (Binary (IS_8088 Lea) (Reg (General SixtyFour rcx)) (Storage (Memory SixtyFour (A_Plus (A_FromReg (General SixtyFour rip)) (A_WordConstant 84596)))), 7)"
    "fetch 0xc9fc \<equiv> (Binary (IS_8088 Mov) (Reg (General ThirtyTwo rdx)) (Immediate SixtyFour (ImmVal 96)), 5)"
    "fetch 0xca01 \<equiv> (Binary (IS_8088 Lea) (Reg (General SixtyFour rsi)) (Storage (Memory SixtyFour (A_Plus (A_FromReg (General SixtyFour rip)) (A_WordConstant 82142)))), 7)"
    "fetch 0xca08 \<equiv> (Binary (IS_8088 Lea) (Reg (General SixtyFour rdi)) (Storage (Memory SixtyFour (A_Plus (A_FromReg (General SixtyFour rip)) (A_WordConstant 82188)))), 7)"
    "fetch 0xca0f \<equiv> (Unary (IS_8088 Call) (Immediate SixtyFour (ImmLabel ''__assert_fail'')), 5)"
    "fetch 0xca14 \<equiv> (Unary (IS_8088 Nop) (Storage (Memory Sixteen (A_SizeDirective 16 (A_Plus (A_FromReg (General SixtyFour cs)) (A_Plus (A_FromReg (General SixtyFour rax)) (A_Plus (A_Mult 1 (A_FromReg (General SixtyFour rax))) (A_WordConstant 0))))))), 11)"
    and \<alpha>_def: \<open>\<alpha> = \<lparr>text_sections = [], data_sections = [], labels_to_offsets = [], binary_offset = 0\<rparr>\<close>
    and UD2\<^sub>a\<^sub>d\<^sub>d\<^sub>r[simp]: \<open>the (label_to_address \<alpha> ''UD2'') = UD2_addr\<close>
    and assert_fail\<^sub>a\<^sub>d\<^sub>d\<^sub>r[simp]: \<open>the (label_to_address \<alpha> ''__assert_fail'') = assert_fail_addr\<close>
    and qemu_realloc\<^sub>a\<^sub>d\<^sub>d\<^sub>r[simp]: \<open>the (label_to_address \<alpha> ''qemu_realloc'') = qemu_realloc_addr\<close>
begin

text \<open>Using definitions that don't get unfolded immediately prevents locale argument issues.\<close>
definition \<open>UD2_0x373f_retval \<equiv> UD2_0x373f_retval\<^sub>v\<close>
definition \<open>qemu_realloc_0xc9d7_retval \<equiv> qemu_realloc_0xc9d7_retval\<^sub>v\<close>
definition \<open>assert_fail_0xca0f_retval \<equiv> assert_fail_0xca0f_retval\<^sub>v\<close>

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

locale "schedule_rename_cold_10" = "qemu_img_xen" +
  fixes RAX\<^sub>0\<^sub>v RSP\<^sub>0\<^sub>v R15\<^sub>0\<^sub>v DS\<^sub>0\<^sub>v ret_address\<^sub>v :: \<open>64 word\<close>
begin

text \<open>Using definitions that don't get unfolded immediately prevents locale argument issues.\<close>
definition \<open>RAX\<^sub>0 \<equiv> RAX\<^sub>0\<^sub>v\<close>
definition \<open>RSP\<^sub>0 \<equiv> RSP\<^sub>0\<^sub>v\<close>
definition \<open>R15\<^sub>0 \<equiv> R15\<^sub>0\<^sub>v\<close>
definition \<open>DS\<^sub>0 \<equiv> DS\<^sub>0\<^sub>v\<close>
definition \<open>ret_address \<equiv> ret_address\<^sub>v\<close>

definition P_0x3737_0 :: state_pred where
  \<open>P_0x3737_0 \<sigma> \<equiv> RIP \<sigma> = 0x3737 \<and> RAX \<sigma> = RAX\<^sub>0 \<and> RSP \<sigma> = RSP\<^sub>0 \<and> R15 \<sigma> = R15\<^sub>0 \<and> DS \<sigma> = DS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address\<close>
declare P_0x3737_0_def[Ps]

definition P_0x3737_0_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x3737_0_regions_set \<sigma> \<equiv> {
    (0, DS\<^sub>0, 8),
    (1, RSP\<^sub>0, 8)
  }\<close>

definition P_0x3737_0_regions :: state_pred where
  \<open>P_0x3737_0_regions \<sigma> \<equiv> \<exists>regions. P_0x3737_0_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x373f_0 :: state_pred where
  \<open>Q_0x373f_0 \<sigma> \<equiv> RIP \<sigma> = 0x373f \<and> RAX \<sigma> = RAX\<^sub>0 \<and> RSP \<sigma> = RSP\<^sub>0 \<and> R15 \<sigma> = R15\<^sub>0 \<and> DS \<sigma> = DS\<^sub>0 \<and> (\<sigma> \<turnstile> *[DS\<^sub>0,8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address\<close>
declare Q_0x373f_0_def[Qs]

schematic_goal schedule_rename_cold_10_0_1_0x3737_0x3737_0[blocks]:
  assumes \<open>(P_0x3737_0 && P_0x3737_0_regions) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x3737 0 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x373f_0 ?\<sigma> \<and> block_usage P_0x3737_0_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x3737_0_def P_0x3737_0_regions_def post: Q_0x373f_0_def regionset: P_0x3737_0_regions_set_def)

definition P_0x373f_1 :: state_pred where
  \<open>P_0x373f_1 \<sigma> \<equiv> RIP \<sigma> = 0x373f \<and> RAX \<sigma> = RAX\<^sub>0 \<and> RSP \<sigma> = RSP\<^sub>0 \<and> R15 \<sigma> = R15\<^sub>0 \<and> DS \<sigma> = DS\<^sub>0 \<and> (\<sigma> \<turnstile> *[DS\<^sub>0,8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address\<close>
declare P_0x373f_1_def[Ps]

definition P_0x373f_1_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x373f_1_regions_set \<sigma> \<equiv> {
    (0, DS\<^sub>0, 8),
    (1, RSP\<^sub>0, 8),
    (2, ((RSP\<^sub>0::64 word) - 0x8), 8)
  }\<close>

definition P_0x373f_1_regions :: state_pred where
  \<open>P_0x373f_1_regions \<sigma> \<equiv> \<exists>regions. P_0x373f_1_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_UD2_addr_0x373f_1 :: state_pred where
  \<open>Q_UD2_addr_0x373f_1 \<sigma> \<equiv> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x8) \<and> RIP \<sigma> = UD2_addr \<and> RAX \<sigma> = RAX\<^sub>0 \<and> R15 \<sigma> = R15\<^sub>0 \<and> DS \<sigma> = DS\<^sub>0 \<and> (\<sigma> \<turnstile> *[DS\<^sub>0,8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = 0x3744\<close>
declare Q_UD2_addr_0x373f_1_def[Qs]

schematic_goal schedule_rename_cold_10_0_1_0x373f_0x373f_1[blocks]:
  assumes \<open>(P_0x373f_1 && P_0x373f_1_regions) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x373f (Suc 0) \<sigma> \<triangleq> ?\<sigma> \<and> Q_UD2_addr_0x373f_1 ?\<sigma> \<and> block_usage P_0x373f_1_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x373f_1_def P_0x373f_1_regions_def post: Q_UD2_addr_0x373f_1_def regionset: P_0x373f_1_regions_set_def)

definition schedule_rename_cold_10_acode :: ACode where
  \<open>schedule_rename_cold_10_acode =
    Block (Suc 0) 0x3737 0;
    Block (Suc 0) 0x373f (Suc 0);
    CALL UD2_acode
  \<close>

schematic_goal "schedule_rename_cold_10":
  assumes
    \<open>\<forall>\<sigma>. RIP \<sigma> = 0x373f \<longrightarrow> P_0x373f_1_regions \<sigma>\<close>
    and [blocks]: \<open>{{Q_UD2_addr_0x373f_1}} \<box>UD2_acode {{Q_fail;M_0x373f}}\<close>
  shows \<open>{{?P}} schedule_rename_cold_10_acode {{?Q;?M}}\<close>
  by (vcg acode: schedule_rename_cold_10_acode_def assms: assms)

end

locale "schedule_rename" = "qemu_img_xen" +
  fixes RAX\<^sub>0\<^sub>v RBX\<^sub>0\<^sub>v RCX\<^sub>0\<^sub>v RDX\<^sub>0\<^sub>v RDI\<^sub>0\<^sub>v RSI\<^sub>0\<^sub>v RSP\<^sub>0\<^sub>v RBP\<^sub>0\<^sub>v R15\<^sub>0\<^sub>v R14\<^sub>0\<^sub>v R13\<^sub>0\<^sub>v R12\<^sub>0\<^sub>v DS\<^sub>0\<^sub>v ret_address\<^sub>v :: \<open>64 word\<close>
begin

text \<open>Using definitions that don't get unfolded immediately prevents locale argument issues.\<close>
definition \<open>RAX\<^sub>0 \<equiv> RAX\<^sub>0\<^sub>v\<close>
definition \<open>RBX\<^sub>0 \<equiv> RBX\<^sub>0\<^sub>v\<close>
definition \<open>RCX\<^sub>0 \<equiv> RCX\<^sub>0\<^sub>v\<close>
definition \<open>RDX\<^sub>0 \<equiv> RDX\<^sub>0\<^sub>v\<close>
definition \<open>RDI\<^sub>0 \<equiv> RDI\<^sub>0\<^sub>v\<close>
definition \<open>RSI\<^sub>0 \<equiv> RSI\<^sub>0\<^sub>v\<close>
definition \<open>RSP\<^sub>0 \<equiv> RSP\<^sub>0\<^sub>v\<close>
definition \<open>RBP\<^sub>0 \<equiv> RBP\<^sub>0\<^sub>v\<close>
definition \<open>R15\<^sub>0 \<equiv> R15\<^sub>0\<^sub>v\<close>
definition \<open>R14\<^sub>0 \<equiv> R14\<^sub>0\<^sub>v\<close>
definition \<open>R13\<^sub>0 \<equiv> R13\<^sub>0\<^sub>v\<close>
definition \<open>R12\<^sub>0 \<equiv> R12\<^sub>0\<^sub>v\<close>
definition \<open>DS\<^sub>0 \<equiv> DS\<^sub>0\<^sub>v\<close>
definition \<open>ret_address \<equiv> ret_address\<^sub>v\<close>

definition P_0xc950_0 :: state_pred where
  \<open>P_0xc950_0 \<sigma> \<equiv> RIP \<sigma> = 0xc950 \<and> RAX \<sigma> = RAX\<^sub>0 \<and> RBX \<sigma> = RBX\<^sub>0 \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = RDX\<^sub>0 \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = RSP\<^sub>0 \<and> RBP \<sigma> = RBP\<^sub>0 \<and> R15 \<sigma> = R15\<^sub>0 \<and> R14 \<sigma> = R14\<^sub>0 \<and> R13 \<sigma> = R13\<^sub>0 \<and> R12 \<sigma> = R12\<^sub>0 \<and> DS \<sigma> = DS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address\<close>
declare P_0xc950_0_def[Ps]

definition P_0xc950_0_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0xc950_0_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((RDI\<^sub>0::64 word) + 0x80d0), 4),
    (2, ((RDI\<^sub>0::64 word) + 0x80d4), 4),
    (3, ((RDI\<^sub>0::64 word) + 0x80d8), 4),
    (4, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x30), 8)
  }\<close>

definition P_0xc950_0_regions :: state_pred where
  \<open>P_0xc950_0_regions \<sigma> \<equiv> \<exists>regions. P_0xc950_0_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0xc983_0 :: state_pred where
  \<open>Q_0xc983_0 \<sigma> \<equiv> RIP \<sigma> = 0xc983 \<and> RAX \<sigma> = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x80d8),4]::32 word)) \<and> RBX \<sigma> = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x80d4),4]::32 word)) \<and> RCX \<sigma> = ucast ((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>(((\<langle>63,0\<rangle>(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x80d4),4]::32 word)::64 word)::64 word) + 0x1)::32 word)::32 word) * (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x80d8),4]::32 word))::32 word)) \<and> RDX \<sigma> = RDX\<^sub>0 \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x38) \<and> RBP \<sigma> = RDI\<^sub>0 \<and> R15 \<sigma> = RDX\<^sub>0 \<and> R14 \<sigma> = ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)) \<and> R13 \<sigma> = R13\<^sub>0 \<and> R12 \<sigma> = ucast ((\<langle>31,0\<rangle>(((\<langle>63,0\<rangle>(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x80d4),4]::32 word)::64 word)::64 word) + 0x1)::32 word)) \<and> DS \<sigma> = DS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x80d0),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x80d0),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x80d4),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x80d4),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x80d8),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x80d8),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0\<close>
declare Q_0xc983_0_def[Qs]

schematic_goal schedule_rename_0_16_0xc950_0xc97d_0[blocks]:
  assumes \<open>(P_0xc950_0 && P_0xc950_0_regions) \<sigma>\<close>
  shows \<open>exec_block 16 0xc97d 0 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0xc983_0 ?\<sigma> \<and> block_usage P_0xc950_0_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0xc950_0_def P_0xc950_0_regions_def post: Q_0xc983_0_def regionset: P_0xc950_0_regions_set_def)

definition P_0xc983_true_1 :: state_pred where
  \<open>P_0xc983_true_1 \<sigma> \<equiv> RIP \<sigma> = 0xc983 \<and> RAX \<sigma> = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x80d8),4]::32 word)) \<and> RBX \<sigma> = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x80d4),4]::32 word)) \<and> RCX \<sigma> = ucast ((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>(((\<langle>63,0\<rangle>(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x80d4),4]::32 word)::64 word)::64 word) + 0x1)::32 word)::32 word) * (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x80d8),4]::32 word))::32 word)) \<and> RDX \<sigma> = RDX\<^sub>0 \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x38) \<and> RBP \<sigma> = RDI\<^sub>0 \<and> R15 \<sigma> = RDX\<^sub>0 \<and> R14 \<sigma> = ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)) \<and> R13 \<sigma> = R13\<^sub>0 \<and> R12 \<sigma> = ucast ((\<langle>31,0\<rangle>(((\<langle>63,0\<rangle>(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x80d4),4]::32 word)::64 word)::64 word) + 0x1)::32 word)) \<and> DS \<sigma> = DS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x80d0),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x80d0),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x80d4),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x80d4),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x80d8),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x80d8),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0\<close>
declare P_0xc983_true_1_def[Ps]

definition P_0xc983_true_1_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0xc983_true_1_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((RDI\<^sub>0::64 word) + 0x80c8), 8),
    (2, ((RDI\<^sub>0::64 word) + 0x80d0), 4),
    (3, ((RDI\<^sub>0::64 word) + 0x80d4), 4),
    (4, ((RDI\<^sub>0::64 word) + 0x80d8), 4),
    (5, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x30), 8)
  }\<close>

definition P_0xc983_true_1_regions :: state_pred where
  \<open>P_0xc983_true_1_regions \<sigma> \<equiv> \<exists>regions. P_0xc983_true_1_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0xc9d7_1 :: state_pred where
  \<open>Q_0xc9d7_1 \<sigma> \<equiv> RIP \<sigma> = 0xc9d7 \<and> RAX \<sigma> = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x80d8),4]::32 word)) \<and> RBX \<sigma> = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x80d4),4]::32 word)) \<and> RCX \<sigma> = ucast ((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>(((\<langle>63,0\<rangle>(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x80d4),4]::32 word)::64 word)::64 word) + 0x1)::32 word)::32 word) * (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x80d8),4]::32 word))::32 word)) \<and> RDX \<sigma> = RDX\<^sub>0 \<and> RDI \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x80c8),8]::64 word) \<and> RSI \<sigma> = (sextend (ucast (((((((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x80d8),4]::32 word) << 5)::32 word) - (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x80d8),4]::32 word))::32 word) + (\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>(((\<langle>63,0\<rangle>(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x80d4),4]::32 word)::64 word)::64 word) + 0x1)::32 word)::32 word) * (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x80d8),4]::32 word))::32 word)))) 32 64::64 word) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x38) \<and> RBP \<sigma> = RDI\<^sub>0 \<and> R15 \<sigma> = RDX\<^sub>0 \<and> R14 \<sigma> = ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)) \<and> R13 \<sigma> = ucast (((((((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x80d8),4]::32 word) << 5)::32 word) - (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x80d8),4]::32 word))::32 word) + (\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>(((\<langle>63,0\<rangle>(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x80d4),4]::32 word)::64 word)::64 word) + 0x1)::32 word)::32 word) * (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x80d8),4]::32 word))::32 word))) \<and> R12 \<sigma> = ucast ((\<langle>31,0\<rangle>(((\<langle>63,0\<rangle>(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x80d4),4]::32 word)::64 word)::64 word) + 0x1)::32 word)) \<and> DS \<sigma> = DS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x80c8),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x80c8),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x80d0),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x80d0),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x80d4),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x80d4),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x80d8),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x80d8),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0\<close>
declare Q_0xc9d7_1_def[Qs]
  
schematic_goal schedule_rename_0_7_0xc983_0xc9d4_1[blocks]:
  assumes \<open>(P_0xc983_true_1 && P_0xc983_true_1_regions && ja) \<sigma>\<close>
  shows \<open>exec_block 7 0xc9d4 (Suc 0) \<sigma> \<triangleq> ?\<sigma> \<and> Q_0xc9d7_1 ?\<sigma> \<and> block_usage P_0xc983_true_1_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0xc983_true_1_def P_0xc983_true_1_regions_def post: Q_0xc9d7_1_def regionset: P_0xc983_true_1_regions_set_def)

definition P_0xc9d7_2 :: state_pred where
  \<open>P_0xc9d7_2 \<sigma> \<equiv> RIP \<sigma> = 0xc9d7 \<and> RAX \<sigma> = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x80d8),4]::32 word)) \<and> RBX \<sigma> = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x80d4),4]::32 word)) \<and> RCX \<sigma> = ucast ((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>(((\<langle>63,0\<rangle>(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x80d4),4]::32 word)::64 word)::64 word) + 0x1)::32 word)::32 word) * (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x80d8),4]::32 word))::32 word)) \<and> RDX \<sigma> = RDX\<^sub>0 \<and> RDI \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x80c8),8]::64 word) \<and> RSI \<sigma> = (sextend (ucast (((((((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x80d8),4]::32 word) << 5)::32 word) - (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x80d8),4]::32 word))::32 word) + (\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>(((\<langle>63,0\<rangle>(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x80d4),4]::32 word)::64 word)::64 word) + 0x1)::32 word)::32 word) * (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x80d8),4]::32 word))::32 word)))) 32 64::64 word) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x38) \<and> RBP \<sigma> = RDI\<^sub>0 \<and> R15 \<sigma> = RDX\<^sub>0 \<and> R14 \<sigma> = ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)) \<and> R13 \<sigma> = ucast (((((((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x80d8),4]::32 word) << 5)::32 word) - (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x80d8),4]::32 word))::32 word) + (\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>(((\<langle>63,0\<rangle>(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x80d4),4]::32 word)::64 word)::64 word) + 0x1)::32 word)::32 word) * (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x80d8),4]::32 word))::32 word))) \<and> R12 \<sigma> = ucast ((\<langle>31,0\<rangle>(((\<langle>63,0\<rangle>(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x80d4),4]::32 word)::64 word)::64 word) + 0x1)::32 word)) \<and> DS \<sigma> = DS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x80c8),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x80c8),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x80d0),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x80d0),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x80d4),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x80d4),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x80d8),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x80d8),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0\<close>
declare P_0xc9d7_2_def[Ps]

definition P_0xc9d7_2_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0xc9d7_2_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((RDI\<^sub>0::64 word) + 0x80c8), 8),
    (2, ((RDI\<^sub>0::64 word) + 0x80d0), 4),
    (3, ((RDI\<^sub>0::64 word) + 0x80d4), 4),
    (4, ((RDI\<^sub>0::64 word) + 0x80d8), 4),
    (5, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (11, ((RSP\<^sub>0::64 word) - 0x40), 8)
  }\<close>

definition P_0xc9d7_2_regions :: state_pred where
  \<open>P_0xc9d7_2_regions \<sigma> \<equiv> \<exists>regions. P_0xc9d7_2_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_qemu_realloc_addr_0xc9d7_2 :: state_pred where
  \<open>Q_qemu_realloc_addr_0xc9d7_2 \<sigma> \<equiv> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x40) \<and> RIP \<sigma> = qemu_realloc_addr \<and> RAX \<sigma> = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x80d8),4]::32 word)) \<and> RBX \<sigma> = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x80d4),4]::32 word)) \<and> RCX \<sigma> = ucast ((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>(((\<langle>63,0\<rangle>(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x80d4),4]::32 word)::64 word)::64 word) + 0x1)::32 word)::32 word) * (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x80d8),4]::32 word))::32 word)) \<and> RDX \<sigma> = RDX\<^sub>0 \<and> RDI \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x80c8),8]::64 word) \<and> RSI \<sigma> = (sextend (ucast (((((((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x80d8),4]::32 word) << 5)::32 word) - (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x80d8),4]::32 word))::32 word) + (\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>(((\<langle>63,0\<rangle>(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x80d4),4]::32 word)::64 word)::64 word) + 0x1)::32 word)::32 word) * (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x80d8),4]::32 word))::32 word)))) 32 64::64 word) \<and> RBP \<sigma> = RDI\<^sub>0 \<and> R15 \<sigma> = RDX\<^sub>0 \<and> R14 \<sigma> = ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)) \<and> R13 \<sigma> = ucast (((((((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x80d8),4]::32 word) << 5)::32 word) - (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x80d8),4]::32 word))::32 word) + (\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>(((\<langle>63,0\<rangle>(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x80d4),4]::32 word)::64 word)::64 word) + 0x1)::32 word)::32 word) * (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x80d8),4]::32 word))::32 word))) \<and> R12 \<sigma> = ucast ((\<langle>31,0\<rangle>(((\<langle>63,0\<rangle>(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x80d4),4]::32 word)::64 word)::64 word) + 0x1)::32 word)) \<and> DS \<sigma> = DS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x80c8),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x80c8),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x80d0),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x80d0),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x80d4),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x80d4),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x80d8),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x80d8),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = 0xc9dc\<close>
declare Q_qemu_realloc_addr_0xc9d7_2_def[Qs]

schematic_goal schedule_rename_0_1_0xc9d7_0xc9d7_2[blocks]:
  assumes \<open>(P_0xc9d7_2 && P_0xc9d7_2_regions) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0xc9d7 2 \<sigma> \<triangleq> ?\<sigma> \<and> Q_qemu_realloc_addr_0xc9d7_2 ?\<sigma> \<and> block_usage P_0xc9d7_2_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0xc9d7_2_def P_0xc9d7_2_regions_def post: Q_qemu_realloc_addr_0xc9d7_2_def regionset: P_0xc9d7_2_regions_set_def)

definition P_0xc9dc_3 :: state_pred where
  \<open>P_0xc9dc_3 \<sigma> \<equiv> RIP \<sigma> = 0xc9dc \<and> RAX \<sigma> = qemu_realloc_0xc9d7_retval \<and> RBX \<sigma> = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x80d4),4]::32 word)) \<and> RCX \<sigma> = ucast ((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>(((\<langle>63,0\<rangle>(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x80d4),4]::32 word)::64 word)::64 word) + 0x1)::32 word)::32 word) * (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x80d8),4]::32 word))::32 word)) \<and> RDX \<sigma> = RDX\<^sub>0 \<and> RDI \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x80c8),8]::64 word) \<and> RSI \<sigma> = (sextend (ucast (((((((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x80d8),4]::32 word) << 5)::32 word) - (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x80d8),4]::32 word))::32 word) + (\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>(((\<langle>63,0\<rangle>(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x80d4),4]::32 word)::64 word)::64 word) + 0x1)::32 word)::32 word) * (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x80d8),4]::32 word))::32 word)))) 32 64::64 word) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x38) \<and> RBP \<sigma> = RDI\<^sub>0 \<and> R15 \<sigma> = RDX\<^sub>0 \<and> R14 \<sigma> = ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)) \<and> R13 \<sigma> = ucast (((((((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x80d8),4]::32 word) << 5)::32 word) - (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x80d8),4]::32 word))::32 word) + (\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>(((\<langle>63,0\<rangle>(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x80d4),4]::32 word)::64 word)::64 word) + 0x1)::32 word)::32 word) * (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x80d8),4]::32 word))::32 word))) \<and> R12 \<sigma> = ucast ((\<langle>31,0\<rangle>(((\<langle>63,0\<rangle>(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x80d4),4]::32 word)::64 word)::64 word) + 0x1)::32 word)) \<and> DS \<sigma> = DS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x80c8),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x80c8),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x80d0),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x80d0),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x80d4),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x80d4),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x80d8),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x80d8),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = 0xc9dc\<close>
declare P_0xc9dc_3_def[Ps]

definition P_0xc9dc_3_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0xc9dc_3_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((RDI\<^sub>0::64 word) + 0x80c8), 8),
    (2, ((RDI\<^sub>0::64 word) + 0x80d0), 4),
    (3, ((RDI\<^sub>0::64 word) + 0x80d4), 4),
    (4, ((RDI\<^sub>0::64 word) + 0x80d8), 4),
    (5, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (11, ((RSP\<^sub>0::64 word) - 0x40), 8)
  }\<close>

definition P_0xc9dc_3_regions :: state_pred where
  \<open>P_0xc9dc_3_regions \<sigma> \<equiv> \<exists>regions. P_0xc9dc_3_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0xc9e6_3 :: state_pred where
  \<open>Q_0xc9e6_3 \<sigma> \<equiv> RIP \<sigma> = 0xc9e6 \<and> RBX \<sigma> = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x80d4),4]::32 word)) \<and> RCX \<sigma> = ucast ((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>(((\<langle>63,0\<rangle>(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x80d4),4]::32 word)::64 word)::64 word) + 0x1)::32 word)::32 word) * (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x80d8),4]::32 word))::32 word)) \<and> RDX \<sigma> = RDX\<^sub>0 \<and> RSI \<sigma> = (sextend (ucast (((((((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x80d8),4]::32 word) << 5)::32 word) - (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x80d8),4]::32 word))::32 word) + (\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>(((\<langle>63,0\<rangle>(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x80d4),4]::32 word)::64 word)::64 word) + 0x1)::32 word)::32 word) * (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x80d8),4]::32 word))::32 word)))) 32 64::64 word) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x38) \<and> RBP \<sigma> = RDI\<^sub>0 \<and> R15 \<sigma> = RDX\<^sub>0 \<and> R14 \<sigma> = ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)) \<and> R13 \<sigma> = ucast (((((((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x80d8),4]::32 word) << 5)::32 word) - (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x80d8),4]::32 word))::32 word) + (\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>(((\<langle>63,0\<rangle>(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x80d4),4]::32 word)::64 word)::64 word) + 0x1)::32 word)::32 word) * (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x80d8),4]::32 word))::32 word))) \<and> R12 \<sigma> = ucast ((\<langle>31,0\<rangle>(((\<langle>63,0\<rangle>(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x80d4),4]::32 word)::64 word)::64 word) + 0x1)::32 word)) \<and> DS \<sigma> = DS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x80d0),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x80d0),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x80d4),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x80d4),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x80d8),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x80d8),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = 0xc9dc\<close>
declare Q_0xc9e6_3_def[Qs]

schematic_goal schedule_rename_0_2_0xc9dc_0xc9e3_3[blocks]:
  assumes \<open>(P_0xc9dc_3 && P_0xc9dc_3_regions) \<sigma>\<close>
  shows \<open>exec_block 2 0xc9e3 3 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0xc9e6_3 ?\<sigma> \<and> block_usage P_0xc9dc_3_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0xc9dc_3_def P_0xc9dc_3_regions_def post: Q_0xc9e6_3_def regionset: P_0xc9dc_3_regions_set_def)

definition P_0xc9e6_true_4 :: state_pred where
  \<open>P_0xc9e6_true_4 \<sigma> \<equiv> RIP \<sigma> = 0xc9e6 \<and> RBX \<sigma> = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x80d4),4]::32 word)) \<and> RCX \<sigma> = ucast ((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>(((\<langle>63,0\<rangle>(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x80d4),4]::32 word)::64 word)::64 word) + 0x1)::32 word)::32 word) * (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x80d8),4]::32 word))::32 word)) \<and> RDX \<sigma> = RDX\<^sub>0 \<and> RSI \<sigma> = (sextend (ucast (((((((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x80d8),4]::32 word) << 5)::32 word) - (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x80d8),4]::32 word))::32 word) + (\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>(((\<langle>63,0\<rangle>(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x80d4),4]::32 word)::64 word)::64 word) + 0x1)::32 word)::32 word) * (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x80d8),4]::32 word))::32 word)))) 32 64::64 word) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x38) \<and> RBP \<sigma> = RDI\<^sub>0 \<and> R15 \<sigma> = RDX\<^sub>0 \<and> R14 \<sigma> = ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)) \<and> R13 \<sigma> = ucast (((((((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x80d8),4]::32 word) << 5)::32 word) - (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x80d8),4]::32 word))::32 word) + (\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>(((\<langle>63,0\<rangle>(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x80d4),4]::32 word)::64 word)::64 word) + 0x1)::32 word)::32 word) * (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x80d8),4]::32 word))::32 word))) \<and> R12 \<sigma> = ucast ((\<langle>31,0\<rangle>(((\<langle>63,0\<rangle>(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x80d4),4]::32 word)::64 word)::64 word) + 0x1)::32 word)) \<and> DS \<sigma> = DS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x80d0),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x80d0),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x80d4),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x80d4),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x80d8),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x80d8),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = 0xc9dc\<close>
declare P_0xc9e6_true_4_def[Ps]

definition P_0xc9e6_true_4_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0xc9e6_true_4_regions_set \<sigma> \<equiv> {
    (0, DS\<^sub>0, 8),
    (1, RSP\<^sub>0, 8),
    (2, ((RDI\<^sub>0::64 word) + 0x80d0), 4),
    (3, ((RDI\<^sub>0::64 word) + 0x80d4), 4),
    (4, ((RDI\<^sub>0::64 word) + 0x80d8), 4),
    (5, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (11, ((RSP\<^sub>0::64 word) - 0x40), 8)
  }\<close>

definition P_0xc9e6_true_4_regions :: state_pred where
  \<open>P_0xc9e6_true_4_regions \<sigma> \<equiv> \<exists>regions. P_0xc9e6_true_4_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x373f_4 :: state_pred where
  \<open>Q_0x373f_4 \<sigma> \<equiv> RIP \<sigma> = 0x373f \<and> RBX \<sigma> = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x80d4),4]::32 word)) \<and> RCX \<sigma> = ucast ((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>(((\<langle>63,0\<rangle>(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x80d4),4]::32 word)::64 word)::64 word) + 0x1)::32 word)::32 word) * (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x80d8),4]::32 word))::32 word)) \<and> RDX \<sigma> = RDX\<^sub>0 \<and> RSI \<sigma> = (sextend (ucast (((((((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x80d8),4]::32 word) << 5)::32 word) - (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x80d8),4]::32 word))::32 word) + (\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>(((\<langle>63,0\<rangle>(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x80d4),4]::32 word)::64 word)::64 word) + 0x1)::32 word)::32 word) * (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x80d8),4]::32 word))::32 word)))) 32 64::64 word) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x38) \<and> RBP \<sigma> = RDI\<^sub>0 \<and> R15 \<sigma> = RDX\<^sub>0 \<and> R14 \<sigma> = ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)) \<and> R13 \<sigma> = ucast (((((((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x80d8),4]::32 word) << 5)::32 word) - (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x80d8),4]::32 word))::32 word) + (\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>(((\<langle>63,0\<rangle>(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x80d4),4]::32 word)::64 word)::64 word) + 0x1)::32 word)::32 word) * (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x80d8),4]::32 word))::32 word))) \<and> R12 \<sigma> = ucast ((\<langle>31,0\<rangle>(((\<langle>63,0\<rangle>(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x80d4),4]::32 word)::64 word)::64 word) + 0x1)::32 word)) \<and> DS \<sigma> = DS\<^sub>0 \<and> (\<sigma> \<turnstile> *[DS\<^sub>0,8]::64 word) = RDX\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x80d0),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x80d0),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x80d4),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x80d4),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x80d8),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x80d8),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = 0xc9dc\<close>
declare Q_0x373f_4_def[Qs]

schematic_goal schedule_rename_0_2_0xc9e6_0x3737_4[blocks]:
  assumes \<open>(P_0xc9e6_true_4 && P_0xc9e6_true_4_regions && ZF) \<sigma>\<close>
  shows \<open>exec_block 2 0x3737 4 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x373f_4 ?\<sigma> \<and> block_usage P_0xc9e6_true_4_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0xc9e6_true_4_def P_0xc9e6_true_4_regions_def post: Q_0x373f_4_def regionset: P_0xc9e6_true_4_regions_set_def)

definition P_0x373f_5 :: state_pred where
  \<open>P_0x373f_5 \<sigma> \<equiv> RIP \<sigma> = 0x373f \<and> RBX \<sigma> = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x80d4),4]::32 word)) \<and> RCX \<sigma> = ucast ((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>(((\<langle>63,0\<rangle>(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x80d4),4]::32 word)::64 word)::64 word) + 0x1)::32 word)::32 word) * (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x80d8),4]::32 word))::32 word)) \<and> RDX \<sigma> = RDX\<^sub>0 \<and> RSI \<sigma> = (sextend (ucast (((((((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x80d8),4]::32 word) << 5)::32 word) - (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x80d8),4]::32 word))::32 word) + (\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>(((\<langle>63,0\<rangle>(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x80d4),4]::32 word)::64 word)::64 word) + 0x1)::32 word)::32 word) * (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x80d8),4]::32 word))::32 word)))) 32 64::64 word) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x38) \<and> RBP \<sigma> = RDI\<^sub>0 \<and> R15 \<sigma> = RDX\<^sub>0 \<and> R14 \<sigma> = ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)) \<and> R13 \<sigma> = ucast (((((((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x80d8),4]::32 word) << 5)::32 word) - (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x80d8),4]::32 word))::32 word) + (\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>(((\<langle>63,0\<rangle>(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x80d4),4]::32 word)::64 word)::64 word) + 0x1)::32 word)::32 word) * (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x80d8),4]::32 word))::32 word))) \<and> R12 \<sigma> = ucast ((\<langle>31,0\<rangle>(((\<langle>63,0\<rangle>(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x80d4),4]::32 word)::64 word)::64 word) + 0x1)::32 word)) \<and> DS \<sigma> = DS\<^sub>0 \<and> (\<sigma> \<turnstile> *[DS\<^sub>0,8]::64 word) = RDX\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x80d0),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x80d0),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x80d4),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x80d4),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x80d8),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x80d8),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = 0xc9dc\<close>
declare P_0x373f_5_def[Ps]

definition P_0x373f_5_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x373f_5_regions_set \<sigma> \<equiv> {
    (0, DS\<^sub>0, 8),
    (1, RSP\<^sub>0, 8),
    (2, ((RDI\<^sub>0::64 word) + 0x80d0), 4),
    (3, ((RDI\<^sub>0::64 word) + 0x80d4), 4),
    (4, ((RDI\<^sub>0::64 word) + 0x80d8), 4),
    (5, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (11, ((RSP\<^sub>0::64 word) - 0x40), 8)
  }\<close>

definition P_0x373f_5_regions :: state_pred where
  \<open>P_0x373f_5_regions \<sigma> \<equiv> \<exists>regions. P_0x373f_5_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_UD2_addr_0x373f_5 :: state_pred where
  \<open>Q_UD2_addr_0x373f_5 \<sigma> \<equiv> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x40) \<and> RIP \<sigma> = UD2_addr \<and> DS \<sigma> = DS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x80d8),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x80d8),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0\<close>
declare Q_UD2_addr_0x373f_5_def[Qs]

schematic_goal schedule_rename_0_1_0x373f_0x373f_5[blocks]:
  assumes \<open>(P_0x373f_5 && P_0x373f_5_regions) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x373f 5 \<sigma> \<triangleq> ?\<sigma> \<and> Q_UD2_addr_0x373f_5 ?\<sigma> \<and> block_usage P_0x373f_5_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x373f_5_def P_0x373f_5_regions_def post: Q_UD2_addr_0x373f_5_def regionset: P_0x373f_5_regions_set_def)

definition P_0xc9e6_false_6 :: state_pred where
  \<open>P_0xc9e6_false_6 \<sigma> \<equiv> RIP \<sigma> = 0xc9e6 \<and> RBX \<sigma> = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x80d4),4]::32 word)) \<and> RCX \<sigma> = ucast ((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>(((\<langle>63,0\<rangle>(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x80d4),4]::32 word)::64 word)::64 word) + 0x1)::32 word)::32 word) * (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x80d8),4]::32 word))::32 word)) \<and> RDX \<sigma> = RDX\<^sub>0 \<and> RSI \<sigma> = (sextend (ucast (((((((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x80d8),4]::32 word) << 5)::32 word) - (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x80d8),4]::32 word))::32 word) + (\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>(((\<langle>63,0\<rangle>(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x80d4),4]::32 word)::64 word)::64 word) + 0x1)::32 word)::32 word) * (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x80d8),4]::32 word))::32 word)))) 32 64::64 word) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x38) \<and> RBP \<sigma> = RDI\<^sub>0 \<and> R15 \<sigma> = RDX\<^sub>0 \<and> R14 \<sigma> = ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)) \<and> R13 \<sigma> = ucast (((((((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x80d8),4]::32 word) << 5)::32 word) - (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x80d8),4]::32 word))::32 word) + (\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>(((\<langle>63,0\<rangle>(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x80d4),4]::32 word)::64 word)::64 word) + 0x1)::32 word)::32 word) * (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x80d8),4]::32 word))::32 word))) \<and> R12 \<sigma> = ucast ((\<langle>31,0\<rangle>(((\<langle>63,0\<rangle>(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x80d4),4]::32 word)::64 word)::64 word) + 0x1)::32 word)) \<and> DS \<sigma> = DS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x80d0),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x80d0),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x80d4),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x80d4),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x80d8),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x80d8),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = 0xc9dc\<close>
declare P_0xc9e6_false_6_def[Ps]

definition P_0xc9e6_false_6_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0xc9e6_false_6_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((RDI\<^sub>0::64 word) + 0x80d0), 4),
    (2, ((RDI\<^sub>0::64 word) + 0x80d4), 4),
    (3, ((RDI\<^sub>0::64 word) + 0x80d8), 4),
    (4, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x40), 8)
  }\<close>

definition P_0xc9e6_false_6_regions :: state_pred where
  \<open>P_0xc9e6_false_6_regions \<sigma> \<equiv> \<exists>regions. P_0xc9e6_false_6_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0xc985_6 :: state_pred where
  \<open>Q_0xc985_6 \<sigma> \<equiv> RIP \<sigma> = 0xc985 \<and> RBX \<sigma> = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x80d4),4]::32 word)) \<and> RCX \<sigma> = ucast ((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>(((\<langle>63,0\<rangle>(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x80d4),4]::32 word)::64 word)::64 word) + 0x1)::32 word)::32 word) * (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x80d8),4]::32 word))::32 word)) \<and> RDX \<sigma> = RDX\<^sub>0 \<and> RSI \<sigma> = (sextend (ucast (((((((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x80d8),4]::32 word) << 5)::32 word) - (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x80d8),4]::32 word))::32 word) + (\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>(((\<langle>63,0\<rangle>(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x80d4),4]::32 word)::64 word)::64 word) + 0x1)::32 word)::32 word) * (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x80d8),4]::32 word))::32 word)))) 32 64::64 word) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x38) \<and> RBP \<sigma> = RDI\<^sub>0 \<and> R15 \<sigma> = RDX\<^sub>0 \<and> R14 \<sigma> = ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)) \<and> R13 \<sigma> = ucast (((((((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x80d8),4]::32 word) << 5)::32 word) - (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x80d8),4]::32 word))::32 word) + (\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>(((\<langle>63,0\<rangle>(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x80d4),4]::32 word)::64 word)::64 word) + 0x1)::32 word)::32 word) * (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x80d8),4]::32 word))::32 word))) \<and> R12 \<sigma> = ucast ((\<langle>31,0\<rangle>(((\<langle>63,0\<rangle>(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x80d4),4]::32 word)::64 word)::64 word) + 0x1)::32 word)) \<and> DS \<sigma> = DS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x80d0),4]::32 word) = ucast (((((((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x80d8),4]::32 word) << 5)::32 word) - (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x80d8),4]::32 word))::32 word) + (\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>(((\<langle>63,0\<rangle>(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x80d4),4]::32 word)::64 word)::64 word) + 0x1)::32 word)::32 word) * (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x80d8),4]::32 word))::32 word))) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x80d4),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x80d4),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x80d8),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x80d8),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = 0xc9dc\<close>
declare Q_0xc985_6_def[Qs]

schematic_goal schedule_rename_0_3_0xc9e6_0xc9f3_6[blocks]:
  assumes \<open>(P_0xc9e6_false_6 && P_0xc9e6_false_6_regions && ! ZF) \<sigma>\<close>
  shows \<open>exec_block 3 0xc9f3 6 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0xc985_6 ?\<sigma> \<and> block_usage P_0xc9e6_false_6_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0xc9e6_false_6_def P_0xc9e6_false_6_regions_def post: Q_0xc985_6_def regionset: P_0xc9e6_false_6_regions_set_def)

definition P_0xc985_7 :: state_pred where
  \<open>P_0xc985_7 \<sigma> \<equiv> RIP \<sigma> = 0xc985 \<and> RBX \<sigma> = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x80d4),4]::32 word)) \<and> RCX \<sigma> = ucast ((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>(((\<langle>63,0\<rangle>(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x80d4),4]::32 word)::64 word)::64 word) + 0x1)::32 word)::32 word) * (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x80d8),4]::32 word))::32 word)) \<and> RDX \<sigma> = RDX\<^sub>0 \<and> RSI \<sigma> = (sextend (ucast (((((((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x80d8),4]::32 word) << 5)::32 word) - (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x80d8),4]::32 word))::32 word) + (\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>(((\<langle>63,0\<rangle>(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x80d4),4]::32 word)::64 word)::64 word) + 0x1)::32 word)::32 word) * (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x80d8),4]::32 word))::32 word)))) 32 64::64 word) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x38) \<and> RBP \<sigma> = RDI\<^sub>0 \<and> R15 \<sigma> = RDX\<^sub>0 \<and> R14 \<sigma> = ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)) \<and> R13 \<sigma> = ucast (((((((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x80d8),4]::32 word) << 5)::32 word) - (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x80d8),4]::32 word))::32 word) + (\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>(((\<langle>63,0\<rangle>(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x80d4),4]::32 word)::64 word)::64 word) + 0x1)::32 word)::32 word) * (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x80d8),4]::32 word))::32 word))) \<and> R12 \<sigma> = ucast ((\<langle>31,0\<rangle>(((\<langle>63,0\<rangle>(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x80d4),4]::32 word)::64 word)::64 word) + 0x1)::32 word)) \<and> DS \<sigma> = DS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x80d0),4]::32 word) = ucast (((((((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x80d8),4]::32 word) << 5)::32 word) - (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x80d8),4]::32 word))::32 word) + (\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>(((\<langle>63,0\<rangle>(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x80d4),4]::32 word)::64 word)::64 word) + 0x1)::32 word)::32 word) * (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x80d8),4]::32 word))::32 word))) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x80d4),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x80d4),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x80d8),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x80d8),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = 0xc9dc\<close>
declare P_0xc985_7_def[Ps]

definition P_0xc985_7_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0xc985_7_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((RDI\<^sub>0::64 word) + 0x80d0), 4),
    (2, ((RDI\<^sub>0::64 word) + 0x80d4), 4),
    (3, ((RDI\<^sub>0::64 word) + 0x80d8), 4),
    (4, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x40), 8)
  }\<close>

definition P_0xc985_7_regions :: state_pred where
  \<open>P_0xc985_7_regions \<sigma> \<equiv> \<exists>regions. P_0xc985_7_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0xc98f_7 :: state_pred where
  \<open>Q_0xc98f_7 \<sigma> \<equiv> RIP \<sigma> = 0xc98f \<and> RDX \<sigma> = RDX\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x38) \<and> RBP \<sigma> = RDI\<^sub>0 \<and> R15 \<sigma> = RDX\<^sub>0 \<and> R14 \<sigma> = ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)) \<and> DS \<sigma> = DS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x80d8),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x80d8),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = 0xc9dc\<close>
declare Q_0xc98f_7_def[Qs]

schematic_goal schedule_rename_0_2_0xc985_0xc98c_7[blocks]:
  assumes \<open>(P_0xc985_7 && P_0xc985_7_regions) \<sigma>\<close>
  shows \<open>exec_block 2 0xc98c 7 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0xc98f_7 ?\<sigma> \<and> block_usage P_0xc985_7_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0xc985_7_def P_0xc985_7_regions_def post: Q_0xc98f_7_def regionset: P_0xc985_7_regions_set_def)

definition P_0xc98f_true_8 :: state_pred where
  \<open>P_0xc98f_true_8 \<sigma> \<equiv> RIP \<sigma> = 0xc98f \<and> RDX \<sigma> = RDX\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x38) \<and> RBP \<sigma> = RDI\<^sub>0 \<and> R15 \<sigma> = RDX\<^sub>0 \<and> R14 \<sigma> = ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)) \<and> DS \<sigma> = DS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x80d8),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x80d8),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = 0xc9dc\<close>
declare P_0xc98f_true_8_def[Ps]

definition P_0xc98f_true_8_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0xc98f_true_8_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((RDI\<^sub>0::64 word) + 0x80d8), 4),
    (2, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x40), 8)
  }\<close>

definition P_0xc98f_true_8_regions :: state_pred where
  \<open>P_0xc98f_true_8_regions \<sigma> \<equiv> \<exists>regions. P_0xc98f_true_8_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0xca0f_8 :: state_pred where
  \<open>Q_0xca0f_8 \<sigma> \<equiv> RIP \<sigma> = 0xca0f \<and> RCX \<sigma> = 0x21470 \<and> RDX \<sigma> = 0x60 \<and> RDI \<sigma> = 0x20b1b \<and> RSI \<sigma> = 0x20ae6 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x38) \<and> RBP \<sigma> = RDI\<^sub>0 \<and> R15 \<sigma> = RDX\<^sub>0 \<and> R14 \<sigma> = ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)) \<and> DS \<sigma> = DS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x80d8),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x80d8),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = 0xc9dc\<close>
declare Q_0xca0f_8_def[Qs]

schematic_goal schedule_rename_0_5_0xc98f_0xca08_8[blocks]:
  assumes \<open>(P_0xc98f_true_8 && P_0xc98f_true_8_regions && !CF) \<sigma>\<close>
  shows \<open>exec_block 5 0xca08 8 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0xca0f_8 ?\<sigma> \<and> block_usage P_0xc98f_true_8_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0xc98f_true_8_def P_0xc98f_true_8_regions_def post: Q_0xca0f_8_def regionset: P_0xc98f_true_8_regions_set_def)

definition P_0xca0f_9 :: state_pred where
  \<open>P_0xca0f_9 \<sigma> \<equiv> RIP \<sigma> = 0xca0f \<and> RCX \<sigma> = 0x21470 \<and> RDX \<sigma> = 0x60 \<and> RDI \<sigma> = 0x20b1b \<and> RSI \<sigma> = 0x20ae6 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x38) \<and> RBP \<sigma> = RDI\<^sub>0 \<and> R15 \<sigma> = RDX\<^sub>0 \<and> R14 \<sigma> = ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)) \<and> DS \<sigma> = DS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x80d8),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x80d8),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = 0xc9dc\<close>
declare P_0xca0f_9_def[Ps]

definition P_0xca0f_9_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0xca0f_9_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((RDI\<^sub>0::64 word) + 0x80d8), 4),
    (2, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x40), 8)
  }\<close>

definition P_0xca0f_9_regions :: state_pred where
  \<open>P_0xca0f_9_regions \<sigma> \<equiv> \<exists>regions. P_0xca0f_9_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_assert_fail_addr_0xca0f_9 :: state_pred where
  \<open>Q_assert_fail_addr_0xca0f_9 \<sigma> \<equiv> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x40) \<and> RIP \<sigma> = assert_fail_addr \<and> DS \<sigma> = DS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x80d8),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x80d8),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0\<close>
declare Q_assert_fail_addr_0xca0f_9_def[Qs]

schematic_goal schedule_rename_0_1_0xca0f_0xca0f_9[blocks]:
  assumes \<open>(P_0xca0f_9 && P_0xca0f_9_regions) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0xca0f 9 \<sigma> \<triangleq> ?\<sigma> \<and> Q_assert_fail_addr_0xca0f_9 ?\<sigma> \<and> block_usage P_0xca0f_9_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0xca0f_9_def P_0xca0f_9_regions_def post: Q_assert_fail_addr_0xca0f_9_def regionset: P_0xca0f_9_regions_set_def)

definition P_0xc98f_false_10 :: state_pred where
  \<open>P_0xc98f_false_10 \<sigma> \<equiv> RIP \<sigma> = 0xc98f \<and> RDX \<sigma> = RDX\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x38) \<and> RBP \<sigma> = RDI\<^sub>0 \<and> R15 \<sigma> = RDX\<^sub>0 \<and> R14 \<sigma> = ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)) \<and> DS \<sigma> = DS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x80d8),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x80d8),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = 0xc9dc\<close>
declare P_0xc98f_false_10_def[Ps]

definition P_0xc98f_false_10_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0xc98f_false_10_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((RDI\<^sub>0::64 word) + 0x80c8), 8),
    (2, ((RDI\<^sub>0::64 word) + 0x80d8), 4),
    (3, ((((ucast (((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>RBX \<sigma>::32 word)::32 word) * (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x80d8),4]::32 word))::32 word)::32 word))::64 word) + ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x80c8),8]::64 word)::64 word))::64 word) + 0x8), 4),
    (4, ((((ucast (((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>RBX \<sigma>::32 word)::32 word) * (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x80d8),4]::32 word))::32 word)::32 word))::64 word) + ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x80c8),8]::64 word)::64 word))::64 word) + 0x10), 4),
    (5, ((ucast (((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>RBX \<sigma>::32 word)::32 word) * (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x80d8),4]::32 word))::32 word)::32 word))::64 word) + ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x80c8),8]::64 word)::64 word)), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (11, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (12, ((RSP\<^sub>0::64 word) - 0x40), 8)
  }\<close>

definition P_0xc98f_false_10_regions :: state_pred where
  \<open>P_0xc98f_false_10_regions \<sigma> \<equiv> \<exists>regions. P_0xc98f_false_10_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_ret_address_10 :: state_pred where
  \<open>Q_ret_address_10 \<sigma> \<equiv> RIP \<sigma> = ret_address \<and> DS \<sigma> = DS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x80d8),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x80d8),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0\<close>
declare Q_ret_address_10_def[Qs]

schematic_goal schedule_rename_0_14_0xc98f_0xc9bb_10[blocks]:
  assumes \<open>(P_0xc98f_false_10 && P_0xc98f_false_10_regions && ! !CF) \<sigma>\<close>
  shows \<open>exec_block 14 0xc9bb 10 \<sigma> \<triangleq> ?\<sigma> \<and> Q_ret_address_10 ?\<sigma> \<and> block_usage P_0xc98f_false_10_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0xc98f_false_10_def P_0xc98f_false_10_regions_def post: Q_ret_address_10_def regionset: P_0xc98f_false_10_regions_set_def)

definition P_0xc983_false_11 :: state_pred where
  \<open>P_0xc983_false_11 \<sigma> \<equiv> RIP \<sigma> = 0xc983 \<and> RAX \<sigma> = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x80d8),4]::32 word)) \<and> RBX \<sigma> = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x80d4),4]::32 word)) \<and> RCX \<sigma> = ucast ((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>(((\<langle>63,0\<rangle>(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x80d4),4]::32 word)::64 word)::64 word) + 0x1)::32 word)::32 word) * (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x80d8),4]::32 word))::32 word)) \<and> RDX \<sigma> = RDX\<^sub>0 \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x38) \<and> RBP \<sigma> = RDI\<^sub>0 \<and> R15 \<sigma> = RDX\<^sub>0 \<and> R14 \<sigma> = ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)) \<and> R13 \<sigma> = R13\<^sub>0 \<and> R12 \<sigma> = ucast ((\<langle>31,0\<rangle>(((\<langle>63,0\<rangle>(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x80d4),4]::32 word)::64 word)::64 word) + 0x1)::32 word)) \<and> DS \<sigma> = DS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x80d0),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x80d0),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x80d4),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x80d4),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x80d8),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x80d8),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0\<close>
declare P_0xc983_false_11_def[Ps]

definition P_0xc983_false_11_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0xc983_false_11_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((RDI\<^sub>0::64 word) + 0x80d0), 4),
    (2, ((RDI\<^sub>0::64 word) + 0x80d4), 4),
    (3, ((RDI\<^sub>0::64 word) + 0x80d8), 4),
    (4, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x30), 8)
  }\<close>

definition P_0xc983_false_11_regions :: state_pred where
  \<open>P_0xc983_false_11_regions \<sigma> \<equiv> \<exists>regions. P_0xc983_false_11_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0xc98f_11 :: state_pred where
  \<open>Q_0xc98f_11 \<sigma> \<equiv> RIP \<sigma> = 0xc98f \<and> RAX \<sigma> = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x80d8),4]::32 word)) \<and> RDX \<sigma> = RDX\<^sub>0 \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x38) \<and> RBP \<sigma> = RDI\<^sub>0 \<and> R15 \<sigma> = RDX\<^sub>0 \<and> R14 \<sigma> = ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)) \<and> R13 \<sigma> = R13\<^sub>0 \<and> DS \<sigma> = DS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x80d0),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x80d0),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x80d8),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x80d8),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0\<close>
declare Q_0xc98f_11_def[Qs]

schematic_goal schedule_rename_0_3_0xc983_0xc98c_11[blocks]:
  assumes \<open>(P_0xc983_false_11 && P_0xc983_false_11_regions && ! ja) \<sigma>\<close>
  shows \<open>exec_block 3 0xc98c 11 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0xc98f_11 ?\<sigma> \<and> block_usage P_0xc983_false_11_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0xc983_false_11_def P_0xc983_false_11_regions_def post: Q_0xc98f_11_def regionset: P_0xc983_false_11_regions_set_def)

definition P_0xc98f_true_12 :: state_pred where
  \<open>P_0xc98f_true_12 \<sigma> \<equiv> RIP \<sigma> = 0xc98f \<and> RAX \<sigma> = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x80d8),4]::32 word)) \<and> RDX \<sigma> = RDX\<^sub>0 \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x38) \<and> RBP \<sigma> = RDI\<^sub>0 \<and> R15 \<sigma> = RDX\<^sub>0 \<and> R14 \<sigma> = ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)) \<and> R13 \<sigma> = R13\<^sub>0 \<and> DS \<sigma> = DS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x80d0),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x80d0),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x80d8),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x80d8),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0\<close>
declare P_0xc98f_true_12_def[Ps]

definition P_0xc98f_true_12_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0xc98f_true_12_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((RDI\<^sub>0::64 word) + 0x80d0), 4),
    (2, ((RDI\<^sub>0::64 word) + 0x80d8), 4),
    (3, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x30), 8)
  }\<close>

definition P_0xc98f_true_12_regions :: state_pred where
  \<open>P_0xc98f_true_12_regions \<sigma> \<equiv> \<exists>regions. P_0xc98f_true_12_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0xca0f_12 :: state_pred where
  \<open>Q_0xca0f_12 \<sigma> \<equiv> RIP \<sigma> = 0xca0f \<and> RAX \<sigma> = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x80d8),4]::32 word)) \<and> RCX \<sigma> = 0x21470 \<and> RDX \<sigma> = 0x60 \<and> RDI \<sigma> = 0x20b1b \<and> RSI \<sigma> = 0x20ae6 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x38) \<and> RBP \<sigma> = RDI\<^sub>0 \<and> R15 \<sigma> = RDX\<^sub>0 \<and> R14 \<sigma> = ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)) \<and> R13 \<sigma> = R13\<^sub>0 \<and> DS \<sigma> = DS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x80d0),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x80d0),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x80d8),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x80d8),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0\<close>
declare Q_0xca0f_12_def[Qs]

schematic_goal schedule_rename_0_5_0xc98f_0xca08_12[blocks]:
  assumes \<open>(P_0xc98f_true_12 && P_0xc98f_true_12_regions && !CF) \<sigma>\<close>
  shows \<open>exec_block 5 0xca08 12 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0xca0f_12 ?\<sigma> \<and> block_usage P_0xc98f_true_12_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0xc98f_true_12_def P_0xc98f_true_12_regions_def post: Q_0xca0f_12_def regionset: P_0xc98f_true_12_regions_set_def)

definition P_0xca0f_13 :: state_pred where
  \<open>P_0xca0f_13 \<sigma> \<equiv> RIP \<sigma> = 0xca0f \<and> RAX \<sigma> = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x80d8),4]::32 word)) \<and> RCX \<sigma> = 0x21470 \<and> RDX \<sigma> = 0x60 \<and> RDI \<sigma> = 0x20b1b \<and> RSI \<sigma> = 0x20ae6 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x38) \<and> RBP \<sigma> = RDI\<^sub>0 \<and> R15 \<sigma> = RDX\<^sub>0 \<and> R14 \<sigma> = ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)) \<and> R13 \<sigma> = R13\<^sub>0 \<and> DS \<sigma> = DS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x80d0),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x80d0),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x80d8),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x80d8),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0\<close>
declare P_0xca0f_13_def[Ps]

definition P_0xca0f_13_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0xca0f_13_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((RDI\<^sub>0::64 word) + 0x80d0), 4),
    (2, ((RDI\<^sub>0::64 word) + 0x80d8), 4),
    (3, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x40), 8)
  }\<close>

definition P_0xca0f_13_regions :: state_pred where
  \<open>P_0xca0f_13_regions \<sigma> \<equiv> \<exists>regions. P_0xca0f_13_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_assert_fail_addr_0xca0f_13 :: state_pred where
  \<open>Q_assert_fail_addr_0xca0f_13 \<sigma> \<equiv> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x40) \<and> RIP \<sigma> = assert_fail_addr \<and> RAX \<sigma> = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x80d8),4]::32 word)) \<and> DS \<sigma> = DS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x80d8),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x80d8),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0\<close>
declare Q_assert_fail_addr_0xca0f_13_def[Qs]

schematic_goal schedule_rename_0_1_0xca0f_0xca0f_13[blocks]:
  assumes \<open>(P_0xca0f_13 && P_0xca0f_13_regions) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0xca0f 13 \<sigma> \<triangleq> ?\<sigma> \<and> Q_assert_fail_addr_0xca0f_13 ?\<sigma> \<and> block_usage P_0xca0f_13_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0xca0f_13_def P_0xca0f_13_regions_def post: Q_assert_fail_addr_0xca0f_13_def regionset: P_0xca0f_13_regions_set_def)

definition P_0xc98f_false_14 :: state_pred where
  \<open>P_0xc98f_false_14 \<sigma> \<equiv> RIP \<sigma> = 0xc98f \<and> RAX \<sigma> = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x80d8),4]::32 word)) \<and> RDX \<sigma> = RDX\<^sub>0 \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x38) \<and> RBP \<sigma> = RDI\<^sub>0 \<and> R15 \<sigma> = RDX\<^sub>0 \<and> R14 \<sigma> = ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)) \<and> R13 \<sigma> = R13\<^sub>0 \<and> DS \<sigma> = DS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x80d0),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x80d0),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x80d8),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x80d8),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0\<close>
declare P_0xc98f_false_14_def[Ps]

definition P_0xc98f_false_14_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0xc98f_false_14_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((RDI\<^sub>0::64 word) + 0x80c8), 8),
    (2, ((RDI\<^sub>0::64 word) + 0x80d0), 4),
    (3, ((RDI\<^sub>0::64 word) + 0x80d8), 4),
    (4, ((((ucast (((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>RBX \<sigma>::32 word)::32 word) * (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x80d8),4]::32 word))::32 word)::32 word))::64 word) + ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x80c8),8]::64 word)::64 word))::64 word) + 0x8), 4),
    (5, ((((ucast (((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>RBX \<sigma>::32 word)::32 word) * (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x80d8),4]::32 word))::32 word)::32 word))::64 word) + ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x80c8),8]::64 word)::64 word))::64 word) + 0x10), 4),
    (6, ((ucast (((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>RBX \<sigma>::32 word)::32 word) * (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x80d8),4]::32 word))::32 word)::32 word))::64 word) + ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x80c8),8]::64 word)::64 word)), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (11, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (12, ((RSP\<^sub>0::64 word) - 0x30), 8)
  }\<close>

definition P_0xc98f_false_14_regions :: state_pred where
  \<open>P_0xc98f_false_14_regions \<sigma> \<equiv> \<exists>regions. P_0xc98f_false_14_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_ret_address_14 :: state_pred where
  \<open>Q_ret_address_14 \<sigma> \<equiv> RIP \<sigma> = ret_address \<and> DS \<sigma> = DS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x80d8),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x80d8),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0\<close>
declare Q_ret_address_14_def[Qs]

schematic_goal schedule_rename_0_14_0xc98f_0xc9bb_14[blocks]:
  assumes \<open>(P_0xc98f_false_14 && P_0xc98f_false_14_regions && ! !CF) \<sigma>\<close>
  shows \<open>exec_block 14 0xc9bb 14 \<sigma> \<triangleq> ?\<sigma> \<and> Q_ret_address_14 ?\<sigma> \<and> block_usage P_0xc98f_false_14_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0xc98f_false_14_def P_0xc98f_false_14_regions_def post: Q_ret_address_14_def regionset: P_0xc98f_false_14_regions_set_def)

definition schedule_rename_acode :: ACode where
  \<open>schedule_rename_acode =
    Block 16 0xc97d 0;
    IF ja THEN
      Block 7 0xc9d4 (Suc 0);
      Block (Suc 0) 0xc9d7 2;
      CALL qemu_realloc_acode;
      Block 2 0xc9e3 3;
      IF ZF THEN
        Block 2 0x3737 4;
        Block (Suc 0) 0x373f 5;
        CALL UD2_acode
      ELSE
        Block 3 0xc9f3 6;
        Block 2 0xc98c 7;
        IF !CF THEN
          Block 5 0xca08 8;
          Block (Suc 0) 0xca0f 9;
          CALL assert_fail_acode
        ELSE
          Block 14 0xc9bb 10
        FI
      FI
    ELSE
      Block 3 0xc98c 11;
      IF !CF THEN
        Block 5 0xca08 12;
        Block (Suc 0) 0xca0f 13;
        CALL assert_fail_acode
      ELSE
        Block 14 0xc9bb 14
      FI
    FI
  \<close>

schematic_goal "schedule_rename":
  assumes
    \<open>\<forall>\<sigma>. RIP \<sigma> = 0xc983 \<longrightarrow> P_0xc983_true_1_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0xc9d7 \<longrightarrow> P_0xc9d7_2_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0xc9dc \<longrightarrow> P_0xc9dc_3_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0xc9e6 \<longrightarrow> P_0xc9e6_true_4_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x373f \<longrightarrow> P_0x373f_5_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0xc9e6 \<longrightarrow> P_0xc9e6_false_6_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0xc985 \<longrightarrow> P_0xc985_7_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0xc98f \<longrightarrow> P_0xc98f_true_8_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0xca0f \<longrightarrow> P_0xca0f_9_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0xc98f \<longrightarrow> P_0xc98f_false_10_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0xc983 \<longrightarrow> P_0xc983_false_11_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0xc98f \<longrightarrow> P_0xc98f_true_12_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0xca0f \<longrightarrow> P_0xca0f_13_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0xc98f \<longrightarrow> P_0xc98f_false_14_regions \<sigma>\<close>
    and [blocks]: \<open>{{Q_qemu_realloc_addr_0xc9d7_2}} \<box>qemu_realloc_acode {{P_0xc9dc_3;M_0xc9d7}}\<close>
    and [blocks]: \<open>{{Q_UD2_addr_0x373f_5}} \<box>UD2_acode {{Q_fail;M_0x373f}}\<close>
    and [blocks]: \<open>{{Q_assert_fail_addr_0xca0f_9}} \<box>assert_fail_acode {{Q_fail;M_0xca0f}}\<close>
    and [blocks]: \<open>{{Q_assert_fail_addr_0xca0f_13}} \<box>assert_fail_acode {{Q_fail;M_0xca0f}}\<close>
  shows \<open>{{?P}} schedule_rename_acode {{?Q;?M}}\<close>
  by (vcg acode: schedule_rename_acode_def assms: assms)

end
