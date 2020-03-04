theory dump_snapshots
  imports
    "~/Documents/research/devel/VT/assembly/isabelle/VCG/HTriple"
begin



locale "qemu_img_xen" = execution_context + exec_code +
  fixes bdrv_snapshot_list_0x3eb3_retval\<^sub>v puts_0x3eca_retval\<^sub>v bdrv_snapshot_dump_0x3ee2_retval\<^sub>v puts_0x3ef1_retval\<^sub>v bdrv_snapshot_dump_0x3f17_retval\<^sub>v puts_0x3f1f_retval\<^sub>v qemu_free_0x3f2e_retval\<^sub>v stack_chk_fail_0x3f52_retval\<^sub>v stack_chk_fail_addr bdrv_snapshot_dump_addr bdrv_snapshot_list_addr puts_addr qemu_free_addr :: \<open>64 word\<close>
    and stack_chk_fail_acode bdrv_snapshot_dump_acode bdrv_snapshot_list_acode puts_acode qemu_free_acode :: ACode
  assumes fetch:
    "fetch 0x3e90 \<equiv> (Unary (IS_8088 Push) (Storage (Reg (General SixtyFour r12))), 2)"
    "fetch 0x3e92 \<equiv> (Unary (IS_8088 Push) (Storage (Reg (General SixtyFour rbp))), 1)"
    "fetch 0x3e93 \<equiv> (Unary (IS_8088 Push) (Storage (Reg (General SixtyFour rbx))), 1)"
    "fetch 0x3e94 \<equiv> (Binary (IS_8088 Sub) (Reg (General SixtyFour rsp)) (Immediate SixtyFour (ImmVal 288)), 7)"
    "fetch 0x3e9b \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour rax)) (Storage (Memory SixtyFour (A_SizeDirective 64 (A_Plus (A_FromReg (General SixtyFour fs)) (A_WordConstant 40))))), 9)"
    "fetch 0x3ea4 \<equiv> (Binary (IS_8088 Mov) (Memory SixtyFour (A_SizeDirective 64 (A_Plus (A_FromReg (General SixtyFour rsp)) (A_WordConstant 280)))) (Storage (Reg (General SixtyFour rax))), 8)"
    "fetch 0x3eac \<equiv> (Binary (IS_8088 Xor) (Reg (General ThirtyTwo rax)) (Storage (Reg (General ThirtyTwo rax))), 2)"
    "fetch 0x3eae \<equiv> (Binary (IS_8088 Lea) (Reg (General SixtyFour rsi)) (Storage (Memory SixtyFour (A_Plus (A_FromReg (General SixtyFour rsp)) (A_WordConstant 8)))), 5)"
    "fetch 0x3eb3 \<equiv> (Unary (IS_8088 Call) (Immediate SixtyFour (ImmLabel ''bdrv_snapshot_list'')), 5)"
    "fetch 0x3eb8 \<equiv> (Binary (IS_8088 Test) (Reg (General ThirtyTwo rax)) (Storage (Reg (General ThirtyTwo rax))), 2)"
    "fetch 0x3eba \<equiv> (Unary (IS_8088 Jle) (Immediate SixtyFour (ImmVal 16179)), 2)"
    "fetch 0x3ebc \<equiv> (Binary (IS_8088 Mov) (Reg (General ThirtyTwo rbx)) (Storage (Reg (General ThirtyTwo rax))), 2)"
    "fetch 0x3ebe \<equiv> (Binary (IS_8088 Lea) (Reg (General SixtyFour rdi)) (Storage (Memory SixtyFour (A_Plus (A_FromReg (General SixtyFour rip)) (A_WordConstant 102734)))), 7)"
    "fetch 0x3ec5 \<equiv> (Binary (IS_8088 Lea) (Reg (General SixtyFour r12)) (Storage (Memory SixtyFour (A_Plus (A_FromReg (General SixtyFour rsp)) (A_WordConstant 16)))), 5)"
    "fetch 0x3eca \<equiv> (Unary (IS_8088 Call) (Immediate SixtyFour (ImmLabel ''puts'')), 5)"
    "fetch 0x3ecf \<equiv> (Binary (IS_8088 Lea) (Reg (General ThirtyTwo rbp)) (Storage (Memory SixtyFour (A_Minus (A_FromReg (General SixtyFour rbx)) (A_WordConstant 1)))), 3)"
    "fetch 0x3ed2 \<equiv> (Binary (IS_8088 Xor) (Reg (General ThirtyTwo rdx)) (Storage (Reg (General ThirtyTwo rdx))), 2)"
    "fetch 0x3ed4 \<equiv> (Binary (IS_8088 Mov) (Reg (General ThirtyTwo rsi)) (Immediate SixtyFour (ImmVal 256)), 5)"
    "fetch 0x3ed9 \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour rdi)) (Storage (Reg (General SixtyFour r12))), 3)"
    "fetch 0x3edc \<equiv> (Binary (IS_8088 Add) (Reg (General SixtyFour rbp)) (Immediate SixtyFour (ImmVal 1)), 4)"
    "fetch 0x3ee0 \<equiv> (Binary (IS_8088 Xor) (Reg (General ThirtyTwo rbx)) (Storage (Reg (General ThirtyTwo rbx))), 2)"
    "fetch 0x3ee2 \<equiv> (Unary (IS_8088 Call) (Immediate SixtyFour (ImmLabel ''bdrv_snapshot_dump'')), 5)"
    "fetch 0x3ee7 \<equiv> (Ternary (IS_8088 Imul) (Reg (General SixtyFour rbp)) (Storage (Reg (General SixtyFour rbp))) (Immediate SixtyFour (ImmVal 408)), 7)"
    "fetch 0x3eee \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour rdi)) (Storage (Reg (General SixtyFour rax))), 3)"
    "fetch 0x3ef1 \<equiv> (Unary (IS_8088 Call) (Immediate SixtyFour (ImmLabel ''puts'')), 5)"
    "fetch 0x3ef6 \<equiv> (Unary (IS_8088 Nop) (Storage (Memory Sixteen (A_SizeDirective 16 (A_Plus (A_FromReg (General SixtyFour cs)) (A_Plus (A_FromReg (General SixtyFour rax)) (A_Plus (A_Mult 1 (A_FromReg (General SixtyFour rax))) (A_WordConstant 0))))))), 10)"
    "fetch 0x3f00 \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour rdx)) (Storage (Memory SixtyFour (A_SizeDirective 64 (A_Plus (A_FromReg (General SixtyFour rsp)) (A_WordConstant 8))))), 5)"
    "fetch 0x3f05 \<equiv> (Binary (IS_8088 Mov) (Reg (General ThirtyTwo rsi)) (Immediate SixtyFour (ImmVal 256)), 5)"
    "fetch 0x3f0a \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour rdi)) (Storage (Reg (General SixtyFour r12))), 3)"
    "fetch 0x3f0d \<equiv> (Binary (IS_8088 Add) (Reg (General SixtyFour rdx)) (Storage (Reg (General SixtyFour rbx))), 3)"
    "fetch 0x3f10 \<equiv> (Binary (IS_8088 Add) (Reg (General SixtyFour rbx)) (Immediate SixtyFour (ImmVal 408)), 7)"
    "fetch 0x3f17 \<equiv> (Unary (IS_8088 Call) (Immediate SixtyFour (ImmLabel ''bdrv_snapshot_dump'')), 5)"
    "fetch 0x3f1c \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour rdi)) (Storage (Reg (General SixtyFour rax))), 3)"
    "fetch 0x3f1f \<equiv> (Unary (IS_8088 Call) (Immediate SixtyFour (ImmLabel ''puts'')), 5)"
    "fetch 0x3f24 \<equiv> (Binary (IS_8088 Cmp) (Reg (General SixtyFour rbx)) (Storage (Reg (General SixtyFour rbp))), 3)"
    "fetch 0x3f27 \<equiv> (Unary (IS_8088 Jne) (Immediate SixtyFour (ImmVal 16128)), 2)"
    "fetch 0x3f29 \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour rdi)) (Storage (Memory SixtyFour (A_SizeDirective 64 (A_Plus (A_FromReg (General SixtyFour rsp)) (A_WordConstant 8))))), 5)"
    "fetch 0x3f2e \<equiv> (Unary (IS_8088 Call) (Immediate SixtyFour (ImmLabel ''qemu_free'')), 5)"
    "fetch 0x3f33 \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour rax)) (Storage (Memory SixtyFour (A_SizeDirective 64 (A_Plus (A_FromReg (General SixtyFour rsp)) (A_WordConstant 280))))), 8)"
    "fetch 0x3f3b \<equiv> (Binary (IS_8088 Xor) (Reg (General SixtyFour rax)) (Storage (Memory SixtyFour (A_SizeDirective 64 (A_Plus (A_FromReg (General SixtyFour fs)) (A_WordConstant 40))))), 9)"
    "fetch 0x3f44 \<equiv> (Unary (IS_8088 Jne) (Immediate SixtyFour (ImmVal 16210)), 2)"
    "fetch 0x3f46 \<equiv> (Binary (IS_8088 Add) (Reg (General SixtyFour rsp)) (Immediate SixtyFour (ImmVal 288)), 7)"
    "fetch 0x3f4d \<equiv> (Unary (IS_8088 Pop) (Storage (Reg (General SixtyFour rbx))), 1)"
    "fetch 0x3f4e \<equiv> (Unary (IS_8088 Pop) (Storage (Reg (General SixtyFour rbp))), 1)"
    "fetch 0x3f4f \<equiv> (Unary (IS_8088 Pop) (Storage (Reg (General SixtyFour r12))), 2)"
    "fetch 0x3f51 \<equiv> (Nullary (IS_8088 Ret), 1)"
    "fetch 0x3f52 \<equiv> (Unary (IS_8088 Call) (Immediate SixtyFour (ImmLabel ''__stack_chk_fail'')), 5)"
    and \<alpha>_def: \<open>\<alpha> = \<lparr>text_sections = [], data_sections = [], labels_to_offsets = [], binary_offset = 0\<rparr>\<close>
    and stack_chk_fail\<^sub>a\<^sub>d\<^sub>d\<^sub>r[simp]: \<open>the (label_to_address \<alpha> ''__stack_chk_fail'') = stack_chk_fail_addr\<close>
    and bdrv_snapshot_dump\<^sub>a\<^sub>d\<^sub>d\<^sub>r[simp]: \<open>the (label_to_address \<alpha> ''bdrv_snapshot_dump'') = bdrv_snapshot_dump_addr\<close>
    and bdrv_snapshot_list\<^sub>a\<^sub>d\<^sub>d\<^sub>r[simp]: \<open>the (label_to_address \<alpha> ''bdrv_snapshot_list'') = bdrv_snapshot_list_addr\<close>
    and puts\<^sub>a\<^sub>d\<^sub>d\<^sub>r[simp]: \<open>the (label_to_address \<alpha> ''puts'') = puts_addr\<close>
    and qemu_free\<^sub>a\<^sub>d\<^sub>d\<^sub>r[simp]: \<open>the (label_to_address \<alpha> ''qemu_free'') = qemu_free_addr\<close>
begin

text \<open>Using definitions that don't get unfolded immediately prevents locale argument issues.\<close>
definition \<open>bdrv_snapshot_list_0x3eb3_retval \<equiv> bdrv_snapshot_list_0x3eb3_retval\<^sub>v\<close>
definition \<open>puts_0x3eca_retval \<equiv> puts_0x3eca_retval\<^sub>v\<close>
definition \<open>bdrv_snapshot_dump_0x3ee2_retval \<equiv> bdrv_snapshot_dump_0x3ee2_retval\<^sub>v\<close>
definition \<open>puts_0x3ef1_retval \<equiv> puts_0x3ef1_retval\<^sub>v\<close>
definition \<open>bdrv_snapshot_dump_0x3f17_retval \<equiv> bdrv_snapshot_dump_0x3f17_retval\<^sub>v\<close>
definition \<open>puts_0x3f1f_retval \<equiv> puts_0x3f1f_retval\<^sub>v\<close>
definition \<open>qemu_free_0x3f2e_retval \<equiv> qemu_free_0x3f2e_retval\<^sub>v\<close>
definition \<open>stack_chk_fail_0x3f52_retval \<equiv> stack_chk_fail_0x3f52_retval\<^sub>v\<close>

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

locale "dump_snapshots" = "qemu_img_xen" +
  fixes RAX\<^sub>0\<^sub>v RBX\<^sub>0\<^sub>v RDX\<^sub>0\<^sub>v RDI\<^sub>0\<^sub>v RSI\<^sub>0\<^sub>v RSP\<^sub>0\<^sub>v RBP\<^sub>0\<^sub>v R12\<^sub>0\<^sub>v FS\<^sub>0\<^sub>v ret_address\<^sub>v :: \<open>64 word\<close>
begin

text \<open>Using definitions that don't get unfolded immediately prevents locale argument issues.\<close>
definition \<open>RAX\<^sub>0 \<equiv> RAX\<^sub>0\<^sub>v\<close>
definition \<open>RBX\<^sub>0 \<equiv> RBX\<^sub>0\<^sub>v\<close>
definition \<open>RDX\<^sub>0 \<equiv> RDX\<^sub>0\<^sub>v\<close>
definition \<open>RDI\<^sub>0 \<equiv> RDI\<^sub>0\<^sub>v\<close>
definition \<open>RSI\<^sub>0 \<equiv> RSI\<^sub>0\<^sub>v\<close>
definition \<open>RSP\<^sub>0 \<equiv> RSP\<^sub>0\<^sub>v\<close>
definition \<open>RBP\<^sub>0 \<equiv> RBP\<^sub>0\<^sub>v\<close>
definition \<open>R12\<^sub>0 \<equiv> R12\<^sub>0\<^sub>v\<close>
definition \<open>FS\<^sub>0 \<equiv> FS\<^sub>0\<^sub>v\<close>
definition \<open>ret_address \<equiv> ret_address\<^sub>v\<close>

definition P_0x3e90_0 :: state_pred where
  \<open>P_0x3e90_0 \<sigma> \<equiv> RIP \<sigma> = 0x3e90 \<and> RAX \<sigma> = RAX\<^sub>0 \<and> RBX \<sigma> = RBX\<^sub>0 \<and> RDX \<sigma> = RDX\<^sub>0 \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = RSP\<^sub>0 \<and> RBP \<sigma> = RBP\<^sub>0 \<and> R12 \<sigma> = R12\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address\<close>
declare P_0x3e90_0_def[Ps]

definition P_0x3e90_0_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x3e90_0_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((FS\<^sub>0::64 word) + 0x28), 8),
    (2, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x20), 8)
  }\<close>

definition P_0x3e90_0_regions :: state_pred where
  \<open>P_0x3e90_0_regions \<sigma> \<equiv> \<exists>regions. P_0x3e90_0_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x3eb3_0 :: state_pred where
  \<open>Q_0x3eb3_0 \<sigma> \<equiv> RIP \<sigma> = 0x3eb3 \<and> RAX \<sigma> = 0x0 \<and> RBX \<sigma> = RBX\<^sub>0 \<and> RDX \<sigma> = RDX\<^sub>0 \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = ((RSP\<^sub>0::64 word) - 0x130) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x138) \<and> RBP \<sigma> = RBP\<^sub>0 \<and> R12 \<sigma> = R12\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word)\<close>
declare Q_0x3eb3_0_def[Qs]

schematic_goal dump_snapshots_0_8_0x3e90_0x3eae_0[blocks]:
  assumes \<open>(P_0x3e90_0 && P_0x3e90_0_regions) \<sigma>\<close>
  shows \<open>exec_block 8 0x3eae 0 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x3eb3_0 ?\<sigma> \<and> block_usage P_0x3e90_0_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x3e90_0_def P_0x3e90_0_regions_def post: Q_0x3eb3_0_def regionset: P_0x3e90_0_regions_set_def)

definition P_0x3eb3_1 :: state_pred where
  \<open>P_0x3eb3_1 \<sigma> \<equiv> RIP \<sigma> = 0x3eb3 \<and> RAX \<sigma> = 0x0 \<and> RBX \<sigma> = RBX\<^sub>0 \<and> RDX \<sigma> = RDX\<^sub>0 \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = ((RSP\<^sub>0::64 word) - 0x130) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x138) \<and> RBP \<sigma> = RBP\<^sub>0 \<and> R12 \<sigma> = R12\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word)\<close>
declare P_0x3eb3_1_def[Ps]

definition P_0x3eb3_1_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x3eb3_1_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((FS\<^sub>0::64 word) + 0x28), 8),
    (2, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x140), 8)
  }\<close>

definition P_0x3eb3_1_regions :: state_pred where
  \<open>P_0x3eb3_1_regions \<sigma> \<equiv> \<exists>regions. P_0x3eb3_1_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_bdrv_snapshot_list_addr_0x3eb3_1 :: state_pred where
  \<open>Q_bdrv_snapshot_list_addr_0x3eb3_1 \<sigma> \<equiv> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x140) \<and> RIP \<sigma> = bdrv_snapshot_list_addr \<and> RAX \<sigma> = 0x0 \<and> RBX \<sigma> = RBX\<^sub>0 \<and> RDX \<sigma> = RDX\<^sub>0 \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = ((RSP\<^sub>0::64 word) - 0x130) \<and> RBP \<sigma> = RBP\<^sub>0 \<and> R12 \<sigma> = R12\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x140),8]::64 word) = 0x3eb8\<close>
declare Q_bdrv_snapshot_list_addr_0x3eb3_1_def[Qs]

schematic_goal dump_snapshots_0_1_0x3eb3_0x3eb3_1[blocks]:
  assumes \<open>(P_0x3eb3_1 && P_0x3eb3_1_regions) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x3eb3 (Suc 0) \<sigma> \<triangleq> ?\<sigma> \<and> Q_bdrv_snapshot_list_addr_0x3eb3_1 ?\<sigma> \<and> block_usage P_0x3eb3_1_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x3eb3_1_def P_0x3eb3_1_regions_def post: Q_bdrv_snapshot_list_addr_0x3eb3_1_def regionset: P_0x3eb3_1_regions_set_def)

definition P_0x3eb8_2 :: state_pred where
  \<open>P_0x3eb8_2 \<sigma> \<equiv> RIP \<sigma> = 0x3eb8 \<and> RAX \<sigma> = bdrv_snapshot_list_0x3eb3_retval \<and> RBX \<sigma> = RBX\<^sub>0 \<and> RDX \<sigma> = RDX\<^sub>0 \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = ((RSP\<^sub>0::64 word) - 0x130) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x138) \<and> RBP \<sigma> = RBP\<^sub>0 \<and> R12 \<sigma> = R12\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x140),8]::64 word) = 0x3eb8\<close>
declare P_0x3eb8_2_def[Ps]

definition P_0x3eb8_2_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x3eb8_2_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((FS\<^sub>0::64 word) + 0x28), 8),
    (2, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x140), 8)
  }\<close>

definition P_0x3eb8_2_regions :: state_pred where
  \<open>P_0x3eb8_2_regions \<sigma> \<equiv> \<exists>regions. P_0x3eb8_2_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x3eba_2 :: state_pred where
  \<open>Q_0x3eba_2 \<sigma> \<equiv> RIP \<sigma> = 0x3eba \<and> RAX \<sigma> = bdrv_snapshot_list_0x3eb3_retval \<and> RBX \<sigma> = RBX\<^sub>0 \<and> RDX \<sigma> = RDX\<^sub>0 \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = ((RSP\<^sub>0::64 word) - 0x130) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x138) \<and> RBP \<sigma> = RBP\<^sub>0 \<and> R12 \<sigma> = R12\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x140),8]::64 word) = 0x3eb8\<close>
declare Q_0x3eba_2_def[Qs]

schematic_goal dump_snapshots_0_1_0x3eb8_0x3eb8_2[blocks]:
  assumes \<open>(P_0x3eb8_2 && P_0x3eb8_2_regions) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x3eb8 2 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x3eba_2 ?\<sigma> \<and> block_usage P_0x3eb8_2_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x3eb8_2_def P_0x3eb8_2_regions_def post: Q_0x3eba_2_def regionset: P_0x3eb8_2_regions_set_def)

definition P_0x3eba_true_3 :: state_pred where
  \<open>P_0x3eba_true_3 \<sigma> \<equiv> RIP \<sigma> = 0x3eba \<and> RAX \<sigma> = bdrv_snapshot_list_0x3eb3_retval \<and> RBX \<sigma> = RBX\<^sub>0 \<and> RDX \<sigma> = RDX\<^sub>0 \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = ((RSP\<^sub>0::64 word) - 0x130) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x138) \<and> RBP \<sigma> = RBP\<^sub>0 \<and> R12 \<sigma> = R12\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x140),8]::64 word) = 0x3eb8\<close>
declare P_0x3eba_true_3_def[Ps]

definition P_0x3eba_true_3_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x3eba_true_3_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((FS\<^sub>0::64 word) + 0x28), 8),
    (2, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x140), 8)
  }\<close>

definition P_0x3eba_true_3_regions :: state_pred where
  \<open>P_0x3eba_true_3_regions \<sigma> \<equiv> \<exists>regions. P_0x3eba_true_3_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x3f33_3 :: state_pred where
  \<open>Q_0x3f33_3 \<sigma> \<equiv> RIP \<sigma> = 0x3f33 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x138) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word)\<close>
declare Q_0x3f33_3_def[Qs]

schematic_goal dump_snapshots_0_1_0x3eba_0x3eba_3[blocks]:
  assumes \<open>(P_0x3eba_true_3 && P_0x3eba_true_3_regions && jle) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x3eba 3 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x3f33_3 ?\<sigma> \<and> block_usage P_0x3eba_true_3_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x3eba_true_3_def P_0x3eba_true_3_regions_def post: Q_0x3f33_3_def regionset: P_0x3eba_true_3_regions_set_def)

definition P_0x3eba_false_4 :: state_pred where
  \<open>P_0x3eba_false_4 \<sigma> \<equiv> RIP \<sigma> = 0x3eba \<and> RAX \<sigma> = bdrv_snapshot_list_0x3eb3_retval \<and> RBX \<sigma> = RBX\<^sub>0 \<and> RDX \<sigma> = RDX\<^sub>0 \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = ((RSP\<^sub>0::64 word) - 0x130) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x138) \<and> RBP \<sigma> = RBP\<^sub>0 \<and> R12 \<sigma> = R12\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x140),8]::64 word) = 0x3eb8\<close>
declare P_0x3eba_false_4_def[Ps]

definition P_0x3eba_false_4_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x3eba_false_4_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((FS\<^sub>0::64 word) + 0x28), 8),
    (2, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x140), 8)
  }\<close>

definition P_0x3eba_false_4_regions :: state_pred where
  \<open>P_0x3eba_false_4_regions \<sigma> \<equiv> \<exists>regions. P_0x3eba_false_4_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x3eca_4 :: state_pred where
  \<open>Q_0x3eca_4 \<sigma> \<equiv> RIP \<sigma> = 0x3eca \<and> RAX \<sigma> = bdrv_snapshot_list_0x3eb3_retval \<and> RBX \<sigma> = ucast ((\<langle>31,0\<rangle>bdrv_snapshot_list_0x3eb3_retval::32 word)) \<and> RDX \<sigma> = RDX\<^sub>0 \<and> RDI \<sigma> = 0x1d013 \<and> RSI \<sigma> = ((RSP\<^sub>0::64 word) - 0x130) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x138) \<and> RBP \<sigma> = RBP\<^sub>0 \<and> R12 \<sigma> = ((RSP\<^sub>0::64 word) - 0x128) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x140),8]::64 word) = 0x3eb8\<close>
declare Q_0x3eca_4_def[Qs]

schematic_goal dump_snapshots_0_4_0x3eba_0x3ec5_4[blocks]:
  assumes \<open>(P_0x3eba_false_4 && P_0x3eba_false_4_regions && ! jle) \<sigma>\<close>
  shows \<open>exec_block 4 0x3ec5 4 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x3eca_4 ?\<sigma> \<and> block_usage P_0x3eba_false_4_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x3eba_false_4_def P_0x3eba_false_4_regions_def post: Q_0x3eca_4_def regionset: P_0x3eba_false_4_regions_set_def)

definition P_0x3eca_5 :: state_pred where
  \<open>P_0x3eca_5 \<sigma> \<equiv> RIP \<sigma> = 0x3eca \<and> RAX \<sigma> = bdrv_snapshot_list_0x3eb3_retval \<and> RBX \<sigma> = ucast ((\<langle>31,0\<rangle>bdrv_snapshot_list_0x3eb3_retval::32 word)) \<and> RDX \<sigma> = RDX\<^sub>0 \<and> RDI \<sigma> = 0x1d013 \<and> RSI \<sigma> = ((RSP\<^sub>0::64 word) - 0x130) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x138) \<and> RBP \<sigma> = RBP\<^sub>0 \<and> R12 \<sigma> = ((RSP\<^sub>0::64 word) - 0x128) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x140),8]::64 word) = 0x3eb8\<close>
declare P_0x3eca_5_def[Ps]

definition P_0x3eca_5_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x3eca_5_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((FS\<^sub>0::64 word) + 0x28), 8),
    (2, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x140), 8)
  }\<close>

definition P_0x3eca_5_regions :: state_pred where
  \<open>P_0x3eca_5_regions \<sigma> \<equiv> \<exists>regions. P_0x3eca_5_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_puts_addr_0x3eca_5 :: state_pred where
  \<open>Q_puts_addr_0x3eca_5 \<sigma> \<equiv> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x140) \<and> RIP \<sigma> = puts_addr \<and> RAX \<sigma> = bdrv_snapshot_list_0x3eb3_retval \<and> RBX \<sigma> = ucast ((\<langle>31,0\<rangle>bdrv_snapshot_list_0x3eb3_retval::32 word)) \<and> RDX \<sigma> = RDX\<^sub>0 \<and> RDI \<sigma> = 0x1d013 \<and> RSI \<sigma> = ((RSP\<^sub>0::64 word) - 0x130) \<and> RBP \<sigma> = RBP\<^sub>0 \<and> R12 \<sigma> = ((RSP\<^sub>0::64 word) - 0x128) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x140),8]::64 word) = 0x3ecf\<close>
declare Q_puts_addr_0x3eca_5_def[Qs]

schematic_goal dump_snapshots_0_1_0x3eca_0x3eca_5[blocks]:
  assumes \<open>(P_0x3eca_5 && P_0x3eca_5_regions) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x3eca 5 \<sigma> \<triangleq> ?\<sigma> \<and> Q_puts_addr_0x3eca_5 ?\<sigma> \<and> block_usage P_0x3eca_5_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x3eca_5_def P_0x3eca_5_regions_def post: Q_puts_addr_0x3eca_5_def regionset: P_0x3eca_5_regions_set_def)

definition P_0x3ecf_6 :: state_pred where
  \<open>P_0x3ecf_6 \<sigma> \<equiv> RIP \<sigma> = 0x3ecf \<and> RAX \<sigma> = puts_0x3eca_retval \<and> RBX \<sigma> = ucast ((\<langle>31,0\<rangle>bdrv_snapshot_list_0x3eb3_retval::32 word)) \<and> RDX \<sigma> = RDX\<^sub>0 \<and> RDI \<sigma> = 0x1d013 \<and> RSI \<sigma> = ((RSP\<^sub>0::64 word) - 0x130) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x138) \<and> RBP \<sigma> = RBP\<^sub>0 \<and> R12 \<sigma> = ((RSP\<^sub>0::64 word) - 0x128) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x140),8]::64 word) = 0x3ecf\<close>
declare P_0x3ecf_6_def[Ps]

definition P_0x3ecf_6_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x3ecf_6_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((FS\<^sub>0::64 word) + 0x28), 8),
    (2, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x140), 8)
  }\<close>

definition P_0x3ecf_6_regions :: state_pred where
  \<open>P_0x3ecf_6_regions \<sigma> \<equiv> \<exists>regions. P_0x3ecf_6_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x3ee2_6 :: state_pred where
  \<open>Q_0x3ee2_6 \<sigma> \<equiv> RIP \<sigma> = 0x3ee2 \<and> RAX \<sigma> = puts_0x3eca_retval \<and> RBX \<sigma> = 0x0 \<and> RDX \<sigma> = 0x0 \<and> RDI \<sigma> = ((RSP\<^sub>0::64 word) - 0x128) \<and> RSI \<sigma> = 0x100 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x138) \<and> RBP \<sigma> = ((ucast((\<langle>31,0\<rangle>((ucast((\<langle>31,0\<rangle>bdrv_snapshot_list_0x3eb3_retval::32 word))::64 word) - (0x1::64 word))::32 word))::64 word) + (0x1::64 word)) \<and> R12 \<sigma> = ((RSP\<^sub>0::64 word) - 0x128) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x140),8]::64 word) = 0x3ecf\<close>
declare Q_0x3ee2_6_def[Qs]

schematic_goal dump_snapshots_0_6_0x3ecf_0x3ee0_6[blocks]:
  assumes \<open>(P_0x3ecf_6 && P_0x3ecf_6_regions) \<sigma>\<close>
  shows \<open>exec_block 6 0x3ee0 6 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x3ee2_6 ?\<sigma> \<and> block_usage P_0x3ecf_6_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x3ecf_6_def P_0x3ecf_6_regions_def post: Q_0x3ee2_6_def regionset: P_0x3ecf_6_regions_set_def)

definition P_0x3ee2_7 :: state_pred where
  \<open>P_0x3ee2_7 \<sigma> \<equiv> RIP \<sigma> = 0x3ee2 \<and> RAX \<sigma> = puts_0x3eca_retval \<and> RBX \<sigma> = 0x0 \<and> RDX \<sigma> = 0x0 \<and> RDI \<sigma> = ((RSP\<^sub>0::64 word) - 0x128) \<and> RSI \<sigma> = 0x100 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x138) \<and> RBP \<sigma> = ((ucast((\<langle>31,0\<rangle>((ucast((\<langle>31,0\<rangle>bdrv_snapshot_list_0x3eb3_retval::32 word))::64 word) - (0x1::64 word))::32 word))::64 word) + (0x1::64 word)) \<and> R12 \<sigma> = ((RSP\<^sub>0::64 word) - 0x128) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x140),8]::64 word) = 0x3ecf\<close>
declare P_0x3ee2_7_def[Ps]

definition P_0x3ee2_7_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x3ee2_7_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((FS\<^sub>0::64 word) + 0x28), 8),
    (2, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x140), 8)
  }\<close>

definition P_0x3ee2_7_regions :: state_pred where
  \<open>P_0x3ee2_7_regions \<sigma> \<equiv> \<exists>regions. P_0x3ee2_7_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_bdrv_snapshot_dump_addr_0x3ee2_7 :: state_pred where
  \<open>Q_bdrv_snapshot_dump_addr_0x3ee2_7 \<sigma> \<equiv> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x140) \<and> RIP \<sigma> = bdrv_snapshot_dump_addr \<and> RAX \<sigma> = puts_0x3eca_retval \<and> RBX \<sigma> = 0x0 \<and> RDX \<sigma> = 0x0 \<and> RDI \<sigma> = ((RSP\<^sub>0::64 word) - 0x128) \<and> RSI \<sigma> = 0x100 \<and> RBP \<sigma> = ((ucast((\<langle>31,0\<rangle>((ucast((\<langle>31,0\<rangle>bdrv_snapshot_list_0x3eb3_retval::32 word))::64 word) - (0x1::64 word))::32 word))::64 word) + (0x1::64 word)) \<and> R12 \<sigma> = ((RSP\<^sub>0::64 word) - 0x128) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x140),8]::64 word) = 0x3ee7\<close>
declare Q_bdrv_snapshot_dump_addr_0x3ee2_7_def[Qs]

schematic_goal dump_snapshots_0_1_0x3ee2_0x3ee2_7[blocks]:
  assumes \<open>(P_0x3ee2_7 && P_0x3ee2_7_regions) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x3ee2 7 \<sigma> \<triangleq> ?\<sigma> \<and> Q_bdrv_snapshot_dump_addr_0x3ee2_7 ?\<sigma> \<and> block_usage P_0x3ee2_7_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x3ee2_7_def P_0x3ee2_7_regions_def post: Q_bdrv_snapshot_dump_addr_0x3ee2_7_def regionset: P_0x3ee2_7_regions_set_def)

definition P_0x3ee7_8 :: state_pred where
  \<open>P_0x3ee7_8 \<sigma> \<equiv> RIP \<sigma> = 0x3ee7 \<and> RAX \<sigma> = bdrv_snapshot_dump_0x3ee2_retval \<and> RBX \<sigma> = 0x0 \<and> RDX \<sigma> = 0x0 \<and> RDI \<sigma> = ((RSP\<^sub>0::64 word) - 0x128) \<and> RSI \<sigma> = 0x100 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x138) \<and> RBP \<sigma> = ((ucast((\<langle>31,0\<rangle>((ucast((\<langle>31,0\<rangle>bdrv_snapshot_list_0x3eb3_retval::32 word))::64 word) - (0x1::64 word))::32 word))::64 word) + (0x1::64 word)) \<and> R12 \<sigma> = ((RSP\<^sub>0::64 word) - 0x128) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x140),8]::64 word) = 0x3ee7\<close>
declare P_0x3ee7_8_def[Ps]

definition P_0x3ee7_8_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x3ee7_8_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((FS\<^sub>0::64 word) + 0x28), 8),
    (2, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x140), 8)
  }\<close>

definition P_0x3ee7_8_regions :: state_pred where
  \<open>P_0x3ee7_8_regions \<sigma> \<equiv> \<exists>regions. P_0x3ee7_8_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x3ef1_8 :: state_pred where
  \<open>Q_0x3ef1_8 \<sigma> \<equiv> RIP \<sigma> = 0x3ef1 \<and> RAX \<sigma> = bdrv_snapshot_dump_0x3ee2_retval \<and> RBX \<sigma> = 0x0 \<and> RDX \<sigma> = 0x0 \<and> RDI \<sigma> = bdrv_snapshot_dump_0x3ee2_retval \<and> RSI \<sigma> = 0x100 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x138) \<and> RBP \<sigma> = (\<langle>63,0\<rangle>((((ucast((\<langle>31,0\<rangle>((ucast((\<langle>31,0\<rangle>bdrv_snapshot_list_0x3eb3_retval::32 word))::64 word) - (0x1::64 word))::32 word))::64 word) + (0x1::64 word))::64 word) * 0x198)::64 word) \<and> R12 \<sigma> = ((RSP\<^sub>0::64 word) - 0x128) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x140),8]::64 word) = 0x3ee7\<close>
declare Q_0x3ef1_8_def[Qs]

schematic_goal dump_snapshots_0_2_0x3ee7_0x3eee_8[blocks]:
  assumes \<open>(P_0x3ee7_8 && P_0x3ee7_8_regions) \<sigma>\<close>
  shows \<open>exec_block 2 0x3eee 8 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x3ef1_8 ?\<sigma> \<and> block_usage P_0x3ee7_8_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x3ee7_8_def P_0x3ee7_8_regions_def post: Q_0x3ef1_8_def regionset: P_0x3ee7_8_regions_set_def)

definition P_0x3ef1_9 :: state_pred where
  \<open>P_0x3ef1_9 \<sigma> \<equiv> RIP \<sigma> = 0x3ef1 \<and> RAX \<sigma> = bdrv_snapshot_dump_0x3ee2_retval \<and> RBX \<sigma> = 0x0 \<and> RDX \<sigma> = 0x0 \<and> RDI \<sigma> = bdrv_snapshot_dump_0x3ee2_retval \<and> RSI \<sigma> = 0x100 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x138) \<and> RBP \<sigma> = (\<langle>63,0\<rangle>((((ucast((\<langle>31,0\<rangle>((ucast((\<langle>31,0\<rangle>bdrv_snapshot_list_0x3eb3_retval::32 word))::64 word) - (0x1::64 word))::32 word))::64 word) + (0x1::64 word))::64 word) * 0x198)::64 word) \<and> R12 \<sigma> = ((RSP\<^sub>0::64 word) - 0x128) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x140),8]::64 word) = 0x3ee7\<close>
declare P_0x3ef1_9_def[Ps]

definition P_0x3ef1_9_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x3ef1_9_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((FS\<^sub>0::64 word) + 0x28), 8),
    (2, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x140), 8)
  }\<close>

definition P_0x3ef1_9_regions :: state_pred where
  \<open>P_0x3ef1_9_regions \<sigma> \<equiv> \<exists>regions. P_0x3ef1_9_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_puts_addr_0x3ef1_9 :: state_pred where
  \<open>Q_puts_addr_0x3ef1_9 \<sigma> \<equiv> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x140) \<and> RIP \<sigma> = puts_addr \<and> RAX \<sigma> = bdrv_snapshot_dump_0x3ee2_retval \<and> RBX \<sigma> = 0x0 \<and> RDX \<sigma> = 0x0 \<and> RDI \<sigma> = bdrv_snapshot_dump_0x3ee2_retval \<and> RSI \<sigma> = 0x100 \<and> RBP \<sigma> = (\<langle>63,0\<rangle>((((ucast((\<langle>31,0\<rangle>((ucast((\<langle>31,0\<rangle>bdrv_snapshot_list_0x3eb3_retval::32 word))::64 word) - (0x1::64 word))::32 word))::64 word) + (0x1::64 word))::64 word) * 0x198)::64 word) \<and> R12 \<sigma> = ((RSP\<^sub>0::64 word) - 0x128) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x140),8]::64 word) = 0x3ef6\<close>
declare Q_puts_addr_0x3ef1_9_def[Qs]

schematic_goal dump_snapshots_0_1_0x3ef1_0x3ef1_9[blocks]:
  assumes \<open>(P_0x3ef1_9 && P_0x3ef1_9_regions) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x3ef1 9 \<sigma> \<triangleq> ?\<sigma> \<and> Q_puts_addr_0x3ef1_9 ?\<sigma> \<and> block_usage P_0x3ef1_9_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x3ef1_9_def P_0x3ef1_9_regions_def post: Q_puts_addr_0x3ef1_9_def regionset: P_0x3ef1_9_regions_set_def)

definition P_0x3ef6_10 :: state_pred where
  \<open>P_0x3ef6_10 \<sigma> \<equiv> RIP \<sigma> = 0x3ef6 \<and> RAX \<sigma> = puts_0x3ef1_retval \<and> RBX \<sigma> = 0x0 \<and> RDX \<sigma> = 0x0 \<and> RDI \<sigma> = bdrv_snapshot_dump_0x3ee2_retval \<and> RSI \<sigma> = 0x100 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x138) \<and> RBP \<sigma> = (\<langle>63,0\<rangle>((((ucast((\<langle>31,0\<rangle>((ucast((\<langle>31,0\<rangle>bdrv_snapshot_list_0x3eb3_retval::32 word))::64 word) - (0x1::64 word))::32 word))::64 word) + (0x1::64 word))::64 word) * 0x198)::64 word) \<and> R12 \<sigma> = ((RSP\<^sub>0::64 word) - 0x128) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x140),8]::64 word) = 0x3ef6\<close>
declare P_0x3ef6_10_def[Ps]

definition P_0x3ef6_10_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x3ef6_10_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((FS\<^sub>0::64 word) + 0x28), 8),
    (2, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x140), 8)
  }\<close>

definition P_0x3ef6_10_regions :: state_pred where
  \<open>P_0x3ef6_10_regions \<sigma> \<equiv> \<exists>regions. P_0x3ef6_10_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x3f00_10 :: state_pred where
  \<open>Q_0x3f00_10 \<sigma> \<equiv> RIP \<sigma> = 0x3f00 \<and> RSI \<sigma> = 0x100 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x138) \<and> RBP \<sigma> = (\<langle>63,0\<rangle>((((ucast((\<langle>31,0\<rangle>((ucast((\<langle>31,0\<rangle>bdrv_snapshot_list_0x3eb3_retval::32 word))::64 word) - (0x1::64 word))::32 word))::64 word) + (0x1::64 word))::64 word) * 0x198)::64 word) \<and> R12 \<sigma> = ((RSP\<^sub>0::64 word) - 0x128) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word)\<close>
declare Q_0x3f00_10_def[Qs]

schematic_goal dump_snapshots_0_1_0x3ef6_0x3ef6_10[blocks]:
  assumes \<open>(P_0x3ef6_10 && P_0x3ef6_10_regions) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x3ef6 10 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x3f00_10 ?\<sigma> \<and> block_usage P_0x3ef6_10_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x3ef6_10_def P_0x3ef6_10_regions_def post: Q_0x3f00_10_def regionset: P_0x3ef6_10_regions_set_def)

definition P_0x3f00_11 :: state_pred where
  \<open>P_0x3f00_11 \<sigma> \<equiv> RIP \<sigma> = 0x3f00 \<and> RSI \<sigma> = 0x100 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x138) \<and> RBP \<sigma> = (\<langle>63,0\<rangle>((((ucast((\<langle>31,0\<rangle>((ucast((\<langle>31,0\<rangle>bdrv_snapshot_list_0x3eb3_retval::32 word))::64 word) - (0x1::64 word))::32 word))::64 word) + (0x1::64 word))::64 word) * 0x198)::64 word) \<and> R12 \<sigma> = ((RSP\<^sub>0::64 word) - 0x128) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word)\<close>
declare P_0x3f00_11_def[Ps]


definition P_0x3f00_11_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x3f00_11_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((FS\<^sub>0::64 word) + 0x28), 8),
    (2, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x130), 8)
  }\<close>

definition P_0x3f00_11_regions :: state_pred where
  \<open>P_0x3f00_11_regions \<sigma> \<equiv> \<exists>regions. P_0x3f00_11_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x3f17_11 :: state_pred where
  \<open>Q_0x3f17_11 \<sigma> \<equiv> RIP \<sigma> = 0x3f17 \<and> RDI \<sigma> = ((RSP\<^sub>0::64 word) - 0x128) \<and> RSI \<sigma> = 0x100 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x138) \<and> RBP \<sigma> = (\<langle>63,0\<rangle>((((ucast((\<langle>31,0\<rangle>((ucast((\<langle>31,0\<rangle>bdrv_snapshot_list_0x3eb3_retval::32 word))::64 word) - (0x1::64 word))::32 word))::64 word) + (0x1::64 word))::64 word) * 0x198)::64 word) \<and> R12 \<sigma> = ((RSP\<^sub>0::64 word) - 0x128) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x130),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x130),8]::64 word)\<close>
declare Q_0x3f17_11_def[Qs]

schematic_goal dump_snapshots_0_5_0x3f00_0x3f10_11[blocks]:
  assumes \<open>(P_0x3f00_11 && P_0x3f00_11_regions) \<sigma>\<close>
  shows \<open>exec_block 5 0x3f10 11 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x3f17_11 ?\<sigma> \<and> block_usage P_0x3f00_11_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x3f00_11_def P_0x3f00_11_regions_def post: Q_0x3f17_11_def regionset: P_0x3f00_11_regions_set_def)

definition P_0x3f17_12 :: state_pred where
  \<open>P_0x3f17_12 \<sigma> \<equiv> RIP \<sigma> = 0x3f17 \<and> RDI \<sigma> = ((RSP\<^sub>0::64 word) - 0x128) \<and> RSI \<sigma> = 0x100 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x138) \<and> RBP \<sigma> = (\<langle>63,0\<rangle>((((ucast((\<langle>31,0\<rangle>((ucast((\<langle>31,0\<rangle>bdrv_snapshot_list_0x3eb3_retval::32 word))::64 word) - (0x1::64 word))::32 word))::64 word) + (0x1::64 word))::64 word) * 0x198)::64 word) \<and> R12 \<sigma> = ((RSP\<^sub>0::64 word) - 0x128) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x130),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x130),8]::64 word)\<close>
declare P_0x3f17_12_def[Ps]

definition P_0x3f17_12_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x3f17_12_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((FS\<^sub>0::64 word) + 0x28), 8),
    (2, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x130), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x140), 8)
  }\<close>

definition P_0x3f17_12_regions :: state_pred where
  \<open>P_0x3f17_12_regions \<sigma> \<equiv> \<exists>regions. P_0x3f17_12_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_bdrv_snapshot_dump_addr_0x3f17_12 :: state_pred where
  \<open>Q_bdrv_snapshot_dump_addr_0x3f17_12 \<sigma> \<equiv> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x140) \<and> RIP \<sigma> = bdrv_snapshot_dump_addr \<and> RDI \<sigma> = ((RSP\<^sub>0::64 word) - 0x128) \<and> RSI \<sigma> = 0x100 \<and> RBP \<sigma> = (\<langle>63,0\<rangle>((((ucast((\<langle>31,0\<rangle>((ucast((\<langle>31,0\<rangle>bdrv_snapshot_list_0x3eb3_retval::32 word))::64 word) - (0x1::64 word))::32 word))::64 word) + (0x1::64 word))::64 word) * 0x198)::64 word) \<and> R12 \<sigma> = ((RSP\<^sub>0::64 word) - 0x128) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x130),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x130),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x140),8]::64 word) = 0x3f1c\<close>
declare Q_bdrv_snapshot_dump_addr_0x3f17_12_def[Qs]

schematic_goal dump_snapshots_0_1_0x3f17_0x3f17_12[blocks]:
  assumes \<open>(P_0x3f17_12 && P_0x3f17_12_regions) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x3f17 12 \<sigma> \<triangleq> ?\<sigma> \<and> Q_bdrv_snapshot_dump_addr_0x3f17_12 ?\<sigma> \<and> block_usage P_0x3f17_12_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x3f17_12_def P_0x3f17_12_regions_def post: Q_bdrv_snapshot_dump_addr_0x3f17_12_def regionset: P_0x3f17_12_regions_set_def)

definition P_0x3f1c_13 :: state_pred where
  \<open>P_0x3f1c_13 \<sigma> \<equiv> RIP \<sigma> = 0x3f1c \<and> RDI \<sigma> = ((RSP\<^sub>0::64 word) - 0x128) \<and> RSI \<sigma> = 0x100 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x138) \<and> RBP \<sigma> = (\<langle>63,0\<rangle>((((ucast((\<langle>31,0\<rangle>((ucast((\<langle>31,0\<rangle>bdrv_snapshot_list_0x3eb3_retval::32 word))::64 word) - (0x1::64 word))::32 word))::64 word) + (0x1::64 word))::64 word) * 0x198)::64 word) \<and> R12 \<sigma> = ((RSP\<^sub>0::64 word) - 0x128) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x130),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x130),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x140),8]::64 word) = 0x3f1c\<close>
declare P_0x3f1c_13_def[Ps]

definition P_0x3f1c_13_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x3f1c_13_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((FS\<^sub>0::64 word) + 0x28), 8),
    (2, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x130), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x140), 8)
  }\<close>

definition P_0x3f1c_13_regions :: state_pred where
  \<open>P_0x3f1c_13_regions \<sigma> \<equiv> \<exists>regions. P_0x3f1c_13_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x3f1f_13 :: state_pred where
  \<open>Q_0x3f1f_13 \<sigma> \<equiv> RIP \<sigma> = 0x3f1f \<and> RDI \<sigma> = RAX \<sigma> \<and> RSI \<sigma> = 0x100 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x138) \<and> RBP \<sigma> = (\<langle>63,0\<rangle>((((ucast((\<langle>31,0\<rangle>((ucast((\<langle>31,0\<rangle>bdrv_snapshot_list_0x3eb3_retval::32 word))::64 word) - (0x1::64 word))::32 word))::64 word) + (0x1::64 word))::64 word) * 0x198)::64 word) \<and> R12 \<sigma> = ((RSP\<^sub>0::64 word) - 0x128) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x130),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x130),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x140),8]::64 word) = 0x3f1c\<close>
declare Q_0x3f1f_13_def[Qs]

schematic_goal dump_snapshots_0_1_0x3f1c_0x3f1c_13[blocks]:
  assumes \<open>(P_0x3f1c_13 && P_0x3f1c_13_regions) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x3f1c 13 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x3f1f_13 ?\<sigma> \<and> block_usage P_0x3f1c_13_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x3f1c_13_def P_0x3f1c_13_regions_def post: Q_0x3f1f_13_def regionset: P_0x3f1c_13_regions_set_def)

definition P_0x3f1f_14 :: state_pred where
  \<open>P_0x3f1f_14 \<sigma> \<equiv> RIP \<sigma> = 0x3f1f \<and> RDI \<sigma> = RAX \<sigma> \<and> RSI \<sigma> = 0x100 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x138) \<and> RBP \<sigma> = (\<langle>63,0\<rangle>((((ucast((\<langle>31,0\<rangle>((ucast((\<langle>31,0\<rangle>bdrv_snapshot_list_0x3eb3_retval::32 word))::64 word) - (0x1::64 word))::32 word))::64 word) + (0x1::64 word))::64 word) * 0x198)::64 word) \<and> R12 \<sigma> = ((RSP\<^sub>0::64 word) - 0x128) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x130),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x130),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x140),8]::64 word) = 0x3f1c\<close>
declare P_0x3f1f_14_def[Ps]

definition P_0x3f1f_14_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x3f1f_14_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((FS\<^sub>0::64 word) + 0x28), 8),
    (2, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x130), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x140), 8)
  }\<close>

definition P_0x3f1f_14_regions :: state_pred where
  \<open>P_0x3f1f_14_regions \<sigma> \<equiv> \<exists>regions. P_0x3f1f_14_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_puts_addr_0x3f1f_14 :: state_pred where
  \<open>Q_puts_addr_0x3f1f_14 \<sigma> \<equiv> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x140) \<and> RIP \<sigma> = puts_addr \<and> RSI \<sigma> = 0x100 \<and> RBP \<sigma> = (\<langle>63,0\<rangle>((((ucast((\<langle>31,0\<rangle>((ucast((\<langle>31,0\<rangle>bdrv_snapshot_list_0x3eb3_retval::32 word))::64 word) - (0x1::64 word))::32 word))::64 word) + (0x1::64 word))::64 word) * 0x198)::64 word) \<and> R12 \<sigma> = ((RSP\<^sub>0::64 word) - 0x128) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x130),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x130),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x140),8]::64 word) = 0x3f24\<close>
declare Q_puts_addr_0x3f1f_14_def[Qs]

schematic_goal dump_snapshots_0_1_0x3f1f_0x3f1f_14[blocks]:
  assumes \<open>(P_0x3f1f_14 && P_0x3f1f_14_regions) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x3f1f 14 \<sigma> \<triangleq> ?\<sigma> \<and> Q_puts_addr_0x3f1f_14 ?\<sigma> \<and> block_usage P_0x3f1f_14_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x3f1f_14_def P_0x3f1f_14_regions_def post: Q_puts_addr_0x3f1f_14_def regionset: P_0x3f1f_14_regions_set_def)

definition P_0x3f24_15 :: state_pred where
  \<open>P_0x3f24_15 \<sigma> \<equiv> RIP \<sigma> = 0x3f24 \<and> RSI \<sigma> = 0x100 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x138) \<and> RBP \<sigma> = (\<langle>63,0\<rangle>((((ucast((\<langle>31,0\<rangle>((ucast((\<langle>31,0\<rangle>bdrv_snapshot_list_0x3eb3_retval::32 word))::64 word) - (0x1::64 word))::32 word))::64 word) + (0x1::64 word))::64 word) * 0x198)::64 word) \<and> R12 \<sigma> = ((RSP\<^sub>0::64 word) - 0x128) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x130),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x130),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x140),8]::64 word) = 0x3f24\<close>
declare P_0x3f24_15_def[Ps]

definition P_0x3f24_15_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x3f24_15_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((FS\<^sub>0::64 word) + 0x28), 8),
    (2, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x130), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x140), 8)
  }\<close>

definition P_0x3f24_15_regions :: state_pred where
  \<open>P_0x3f24_15_regions \<sigma> \<equiv> \<exists>regions. P_0x3f24_15_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x3f27_15 :: state_pred where
  \<open>Q_0x3f27_15 \<sigma> \<equiv> RIP \<sigma> = 0x3f27 \<and> RSI \<sigma> = 0x100 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x138) \<and> RBP \<sigma> = (\<langle>63,0\<rangle>((((ucast((\<langle>31,0\<rangle>((ucast((\<langle>31,0\<rangle>bdrv_snapshot_list_0x3eb3_retval::32 word))::64 word) - (0x1::64 word))::32 word))::64 word) + (0x1::64 word))::64 word) * 0x198)::64 word) \<and> R12 \<sigma> = ((RSP\<^sub>0::64 word) - 0x128) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word)\<close>
declare Q_0x3f27_15_def[Qs]

schematic_goal dump_snapshots_0_1_0x3f24_0x3f24_15[blocks]:
  assumes \<open>(P_0x3f24_15 && P_0x3f24_15_regions) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x3f24 15 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x3f27_15 ?\<sigma> \<and> block_usage P_0x3f24_15_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x3f24_15_def P_0x3f24_15_regions_def post: Q_0x3f27_15_def regionset: P_0x3f24_15_regions_set_def)

definition P_0x3f27_true_16 :: state_pred where
  \<open>P_0x3f27_true_16 \<sigma> \<equiv> RIP \<sigma> = 0x3f27 \<and> RSI \<sigma> = 0x100 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x138) \<and> RBP \<sigma> = (\<langle>63,0\<rangle>((((ucast((\<langle>31,0\<rangle>((ucast((\<langle>31,0\<rangle>bdrv_snapshot_list_0x3eb3_retval::32 word))::64 word) - (0x1::64 word))::32 word))::64 word) + (0x1::64 word))::64 word) * 0x198)::64 word) \<and> R12 \<sigma> = ((RSP\<^sub>0::64 word) - 0x128) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word)\<close>
declare P_0x3f27_true_16_def[Ps]

definition P_0x3f27_true_16_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x3f27_true_16_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((FS\<^sub>0::64 word) + 0x28), 8),
    (2, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x20), 8)
  }\<close>

definition P_0x3f27_true_16_regions :: state_pred where
  \<open>P_0x3f27_true_16_regions \<sigma> \<equiv> \<exists>regions. P_0x3f27_true_16_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x3f00_16 :: state_pred where
  \<open>Q_0x3f00_16 \<sigma> \<equiv> RIP \<sigma> = 0x3f00 \<and> RSI \<sigma> = 0x100 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x138) \<and> RBP \<sigma> = (\<langle>63,0\<rangle>((((ucast((\<langle>31,0\<rangle>((ucast((\<langle>31,0\<rangle>bdrv_snapshot_list_0x3eb3_retval::32 word))::64 word) - (0x1::64 word))::32 word))::64 word) + (0x1::64 word))::64 word) * 0x198)::64 word) \<and> R12 \<sigma> = ((RSP\<^sub>0::64 word) - 0x128) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word)\<close>
declare Q_0x3f00_16_def[Qs]

schematic_goal dump_snapshots_0_1_0x3f27_0x3f27_16[blocks]:
  assumes \<open>(P_0x3f27_true_16 && P_0x3f27_true_16_regions && !ZF) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x3f27 16 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x3f00_16 ?\<sigma> \<and> block_usage P_0x3f27_true_16_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x3f27_true_16_def P_0x3f27_true_16_regions_def post: Q_0x3f00_16_def regionset: P_0x3f27_true_16_regions_set_def)

definition P_0x3f27_false_17 :: state_pred where
  \<open>P_0x3f27_false_17 \<sigma> \<equiv> RIP \<sigma> = 0x3f27 \<and> RSI \<sigma> = 0x100 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x138) \<and> RBP \<sigma> = (\<langle>63,0\<rangle>((((ucast((\<langle>31,0\<rangle>((ucast((\<langle>31,0\<rangle>bdrv_snapshot_list_0x3eb3_retval::32 word))::64 word) - (0x1::64 word))::32 word))::64 word) + (0x1::64 word))::64 word) * 0x198)::64 word) \<and> R12 \<sigma> = ((RSP\<^sub>0::64 word) - 0x128) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word)\<close>
declare P_0x3f27_false_17_def[Ps]

definition P_0x3f27_false_17_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x3f27_false_17_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((FS\<^sub>0::64 word) + 0x28), 8),
    (2, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x20), 8)
  }\<close>

definition P_0x3f27_false_17_regions :: state_pred where
  \<open>P_0x3f27_false_17_regions \<sigma> \<equiv> \<exists>regions. P_0x3f27_false_17_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x3f29_17 :: state_pred where
  \<open>Q_0x3f29_17 \<sigma> \<equiv> RIP \<sigma> = 0x3f29 \<and> RSI \<sigma> = 0x100 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x138) \<and> RBP \<sigma> = (\<langle>63,0\<rangle>((((ucast((\<langle>31,0\<rangle>((ucast((\<langle>31,0\<rangle>bdrv_snapshot_list_0x3eb3_retval::32 word))::64 word) - (0x1::64 word))::32 word))::64 word) + (0x1::64 word))::64 word) * 0x198)::64 word) \<and> R12 \<sigma> = ((RSP\<^sub>0::64 word) - 0x128) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word)\<close>
declare Q_0x3f29_17_def[Qs]

schematic_goal dump_snapshots_0_1_0x3f27_0x3f27_17[blocks]:
  assumes \<open>(P_0x3f27_false_17 && P_0x3f27_false_17_regions && ! !ZF) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x3f27 17 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x3f29_17 ?\<sigma> \<and> block_usage P_0x3f27_false_17_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x3f27_false_17_def P_0x3f27_false_17_regions_def post: Q_0x3f29_17_def regionset: P_0x3f27_false_17_regions_set_def)

definition P_0x3f29_18 :: state_pred where
  \<open>P_0x3f29_18 \<sigma> \<equiv> RIP \<sigma> = 0x3f29 \<and> RSI \<sigma> = 0x100 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x138) \<and> RBP \<sigma> = (\<langle>63,0\<rangle>((((ucast((\<langle>31,0\<rangle>((ucast((\<langle>31,0\<rangle>bdrv_snapshot_list_0x3eb3_retval::32 word))::64 word) - (0x1::64 word))::32 word))::64 word) + (0x1::64 word))::64 word) * 0x198)::64 word) \<and> R12 \<sigma> = ((RSP\<^sub>0::64 word) - 0x128) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word)\<close>
declare P_0x3f29_18_def[Ps]

definition P_0x3f29_18_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x3f29_18_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((FS\<^sub>0::64 word) + 0x28), 8),
    (2, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x130), 8)
  }\<close>

definition P_0x3f29_18_regions :: state_pred where
  \<open>P_0x3f29_18_regions \<sigma> \<equiv> \<exists>regions. P_0x3f29_18_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x3f2e_18 :: state_pred where
  \<open>Q_0x3f2e_18 \<sigma> \<equiv> RIP \<sigma> = 0x3f2e \<and> RDI \<sigma> = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x130),8]::64 word) \<and> RSI \<sigma> = 0x100 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x138) \<and> RBP \<sigma> = (\<langle>63,0\<rangle>((((ucast((\<langle>31,0\<rangle>((ucast((\<langle>31,0\<rangle>bdrv_snapshot_list_0x3eb3_retval::32 word))::64 word) - (0x1::64 word))::32 word))::64 word) + (0x1::64 word))::64 word) * 0x198)::64 word) \<and> R12 \<sigma> = ((RSP\<^sub>0::64 word) - 0x128) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x130),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x130),8]::64 word)\<close>
declare Q_0x3f2e_18_def[Qs]

schematic_goal dump_snapshots_0_1_0x3f29_0x3f29_18[blocks]:
  assumes \<open>(P_0x3f29_18 && P_0x3f29_18_regions) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x3f29 18 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x3f2e_18 ?\<sigma> \<and> block_usage P_0x3f29_18_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x3f29_18_def P_0x3f29_18_regions_def post: Q_0x3f2e_18_def regionset: P_0x3f29_18_regions_set_def)

definition P_0x3f2e_19 :: state_pred where
  \<open>P_0x3f2e_19 \<sigma> \<equiv> RIP \<sigma> = 0x3f2e \<and> RDI \<sigma> = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x130),8]::64 word) \<and> RSI \<sigma> = 0x100 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x138) \<and> RBP \<sigma> = (\<langle>63,0\<rangle>((((ucast((\<langle>31,0\<rangle>((ucast((\<langle>31,0\<rangle>bdrv_snapshot_list_0x3eb3_retval::32 word))::64 word) - (0x1::64 word))::32 word))::64 word) + (0x1::64 word))::64 word) * 0x198)::64 word) \<and> R12 \<sigma> = ((RSP\<^sub>0::64 word) - 0x128) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x130),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x130),8]::64 word)\<close>
declare P_0x3f2e_19_def[Ps]

definition P_0x3f2e_19_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x3f2e_19_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((FS\<^sub>0::64 word) + 0x28), 8),
    (2, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x130), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x140), 8)
  }\<close>

definition P_0x3f2e_19_regions :: state_pred where
  \<open>P_0x3f2e_19_regions \<sigma> \<equiv> \<exists>regions. P_0x3f2e_19_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_qemu_free_addr_0x3f2e_19 :: state_pred where
  \<open>Q_qemu_free_addr_0x3f2e_19 \<sigma> \<equiv> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x140) \<and> RIP \<sigma> = qemu_free_addr \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word)\<close>
declare Q_qemu_free_addr_0x3f2e_19_def[Qs]

schematic_goal dump_snapshots_0_1_0x3f2e_0x3f2e_19[blocks]:
  assumes \<open>(P_0x3f2e_19 && P_0x3f2e_19_regions) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x3f2e 19 \<sigma> \<triangleq> ?\<sigma> \<and> Q_qemu_free_addr_0x3f2e_19 ?\<sigma> \<and> block_usage P_0x3f2e_19_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x3f2e_19_def P_0x3f2e_19_regions_def post: Q_qemu_free_addr_0x3f2e_19_def regionset: P_0x3f2e_19_regions_set_def)

definition P_0x3f33_20 :: state_pred where
  \<open>P_0x3f33_20 \<sigma> \<equiv> RIP \<sigma> = 0x3f33 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x138) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word)\<close>
declare P_0x3f33_20_def[Ps]

definition P_0x3f33_20_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x3f33_20_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((FS\<^sub>0::64 word) + 0x28), 8),
    (2, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x20), 8)
  }\<close>

definition P_0x3f33_20_regions :: state_pred where
  \<open>P_0x3f33_20_regions \<sigma> \<equiv> \<exists>regions. P_0x3f33_20_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x3f44_20 :: state_pred where
  \<open>Q_0x3f44_20 \<sigma> \<equiv> RIP \<sigma> = 0x3f44 \<and> RAX \<sigma> = 0x0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x138) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word)\<close>
declare Q_0x3f44_20_def[Qs]

schematic_goal dump_snapshots_0_2_0x3f33_0x3f3b_20[blocks]:
  assumes \<open>(P_0x3f33_20 && P_0x3f33_20_regions) \<sigma>\<close>
  shows \<open>exec_block 2 0x3f3b 20 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x3f44_20 ?\<sigma> \<and> block_usage P_0x3f33_20_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x3f33_20_def P_0x3f33_20_regions_def post: Q_0x3f44_20_def regionset: P_0x3f33_20_regions_set_def)

definition P_0x3f44_true_21 :: state_pred where
  \<open>P_0x3f44_true_21 \<sigma> \<equiv> RIP \<sigma> = 0x3f44 \<and> RAX \<sigma> = 0x0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x138) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word)\<close>
declare P_0x3f44_true_21_def[Ps]

definition P_0x3f44_true_21_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x3f44_true_21_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((FS\<^sub>0::64 word) + 0x28), 8),
    (2, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x20), 8)
  }\<close>

definition P_0x3f44_true_21_regions :: state_pred where
  \<open>P_0x3f44_true_21_regions \<sigma> \<equiv> \<exists>regions. P_0x3f44_true_21_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x3f52_21 :: state_pred where
  \<open>Q_0x3f52_21 \<sigma> \<equiv> RIP \<sigma> = 0x3f52 \<and> RAX \<sigma> = 0x0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x138) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word)\<close>
declare Q_0x3f52_21_def[Qs]

schematic_goal dump_snapshots_0_1_0x3f44_0x3f44_21[blocks]:
  assumes \<open>(P_0x3f44_true_21 && P_0x3f44_true_21_regions && !ZF) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x3f44 21 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x3f52_21 ?\<sigma> \<and> block_usage P_0x3f44_true_21_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x3f44_true_21_def P_0x3f44_true_21_regions_def post: Q_0x3f52_21_def regionset: P_0x3f44_true_21_regions_set_def)

definition P_0x3f52_22 :: state_pred where
  \<open>P_0x3f52_22 \<sigma> \<equiv> RIP \<sigma> = 0x3f52 \<and> RAX \<sigma> = 0x0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x138) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word)\<close>
declare P_0x3f52_22_def[Ps]

definition P_0x3f52_22_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x3f52_22_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((FS\<^sub>0::64 word) + 0x28), 8),
    (2, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x140), 8)
  }\<close>

definition P_0x3f52_22_regions :: state_pred where
  \<open>P_0x3f52_22_regions \<sigma> \<equiv> \<exists>regions. P_0x3f52_22_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_stack_chk_fail_addr_0x3f52_22 :: state_pred where
  \<open>Q_stack_chk_fail_addr_0x3f52_22 \<sigma> \<equiv> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x140) \<and> RIP \<sigma> = stack_chk_fail_addr \<and> RAX \<sigma> = 0x0 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word)\<close>
declare Q_stack_chk_fail_addr_0x3f52_22_def[Qs]

schematic_goal dump_snapshots_0_1_0x3f52_0x3f52_22[blocks]:
  assumes \<open>(P_0x3f52_22 && P_0x3f52_22_regions) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x3f52 22 \<sigma> \<triangleq> ?\<sigma> \<and> Q_stack_chk_fail_addr_0x3f52_22 ?\<sigma> \<and> block_usage P_0x3f52_22_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x3f52_22_def P_0x3f52_22_regions_def post: Q_stack_chk_fail_addr_0x3f52_22_def regionset: P_0x3f52_22_regions_set_def)

definition P_0x3f44_false_23 :: state_pred where
  \<open>P_0x3f44_false_23 \<sigma> \<equiv> RIP \<sigma> = 0x3f44 \<and> RAX \<sigma> = 0x0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x138) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word)\<close>
declare P_0x3f44_false_23_def[Ps]

definition P_0x3f44_false_23_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x3f44_false_23_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((FS\<^sub>0::64 word) + 0x28), 8),
    (2, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x20), 8)
  }\<close>

definition P_0x3f44_false_23_regions :: state_pred where
  \<open>P_0x3f44_false_23_regions \<sigma> \<equiv> \<exists>regions. P_0x3f44_false_23_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_ret_address_23 :: state_pred where
  \<open>Q_ret_address_23 \<sigma> \<equiv> RIP \<sigma> = ret_address \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word)\<close>
declare Q_ret_address_23_def[Qs]

schematic_goal dump_snapshots_0_6_0x3f44_0x3f51_23[blocks]:
  assumes \<open>(P_0x3f44_false_23 && P_0x3f44_false_23_regions && ! !ZF) \<sigma>\<close>
  shows \<open>exec_block 6 0x3f51 23 \<sigma> \<triangleq> ?\<sigma> \<and> Q_ret_address_23 ?\<sigma> \<and> block_usage P_0x3f44_false_23_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x3f44_false_23_def P_0x3f44_false_23_regions_def post: Q_ret_address_23_def regionset: P_0x3f44_false_23_regions_set_def)

definition dump_snapshots_acode :: ACode where
  \<open>dump_snapshots_acode =
    Block 8 0x3eae 0;
    Block (Suc 0) 0x3eb3 (Suc 0);
    CALL bdrv_snapshot_list_acode;
    Block (Suc 0) 0x3eb8 2;
    IF jle THEN
      Block (Suc 0) 0x3eba 3
    ELSE
      Block 4 0x3ec5 4;
      Block (Suc 0) 0x3eca 5;
      CALL puts_acode;
      Block 6 0x3ee0 6;
      Block (Suc 0) 0x3ee2 7;
      CALL bdrv_snapshot_dump_acode;
      Block 2 0x3eee 8;
      Block (Suc 0) 0x3ef1 9;
      CALL puts_acode;
      Block (Suc 0) 0x3ef6 10;
      WHILE P_0x3f00_11 DO
        Block 5 0x3f10 11;
        Block (Suc 0) 0x3f17 12;
        CALL bdrv_snapshot_dump_acode;
        Block (Suc 0) 0x3f1c 13;
        Block (Suc 0) 0x3f1f 14;
        CALL puts_acode;
        Block (Suc 0) 0x3f24 15;
        IF !ZF THEN
          Block (Suc 0) 0x3f27 16
        ELSE
          Block (Suc 0) 0x3f27 17
        FI
      OD;
      Block (Suc 0) 0x3f29 18;
      Block (Suc 0) 0x3f2e 19;
      CALL qemu_free_acode
    FI;
    Block 2 0x3f3b 20;
    IF !ZF THEN
      Block (Suc 0) 0x3f44 21;
      Block (Suc 0) 0x3f52 22;
      CALL stack_chk_fail_acode
    ELSE
      Block 6 0x3f51 23
    FI
  \<close>






schematic_goal dump_snapshots:
  assumes
    \<open>\<forall>\<sigma>. RIP \<sigma> = 0x3eb3 \<longrightarrow> P_0x3eb3_1_regions \<sigma>\<close>
    \<open>\<forall>\<sigma>. RIP \<sigma> = 0x3eb8 \<longrightarrow> P_0x3eb8_2_regions \<sigma>\<close>
    \<open>\<forall>\<sigma>. RIP \<sigma> = 0x3eba \<longrightarrow> P_0x3eba_true_3_regions \<sigma>\<close>
    \<open>\<forall>\<sigma>. RIP \<sigma> = 0x3eba \<longrightarrow> P_0x3eba_false_4_regions \<sigma>\<close>
    \<open>\<forall>\<sigma>. RIP \<sigma> = 0x3eca \<longrightarrow> P_0x3eca_5_regions \<sigma>\<close>
    \<open>\<forall>\<sigma>. RIP \<sigma> = 0x3ecf \<longrightarrow> P_0x3ecf_6_regions \<sigma>\<close>
    \<open>\<forall>\<sigma>. RIP \<sigma> = 0x3ee2 \<longrightarrow> P_0x3ee2_7_regions \<sigma>\<close>
    \<open>\<forall>\<sigma>. RIP \<sigma> = 0x3ee7 \<longrightarrow> P_0x3ee7_8_regions \<sigma>\<close>
    \<open>\<forall>\<sigma>. RIP \<sigma> = 0x3ef1 \<longrightarrow> P_0x3ef1_9_regions \<sigma>\<close>
    \<open>\<forall>\<sigma>. RIP \<sigma> = 0x3ef6 \<longrightarrow> P_0x3ef6_10_regions \<sigma>\<close>
    \<open>\<forall>\<sigma>. RIP \<sigma> = 0x3f00 \<longrightarrow> P_0x3f00_11_regions \<sigma>\<close>
    \<open>\<forall>\<sigma>. RIP \<sigma> = 0x3f17 \<longrightarrow> P_0x3f17_12_regions \<sigma>\<close>
    \<open>\<forall>\<sigma>. RIP \<sigma> = 0x3f1c \<longrightarrow> P_0x3f1c_13_regions \<sigma>\<close>
    \<open>\<forall>\<sigma>. RIP \<sigma> = 0x3f1f \<longrightarrow> P_0x3f1f_14_regions \<sigma>\<close>
    \<open>\<forall>\<sigma>. RIP \<sigma> = 0x3f24 \<longrightarrow> P_0x3f24_15_regions \<sigma>\<close>
    \<open>\<forall>\<sigma>. RIP \<sigma> = 0x3f27 \<longrightarrow> P_0x3f27_true_16_regions \<sigma>\<close>
    \<open>\<forall>\<sigma>. RIP \<sigma> = 0x3f27 \<longrightarrow> P_0x3f27_false_17_regions \<sigma>\<close>
    \<open>\<forall>\<sigma>. RIP \<sigma> = 0x3f29 \<longrightarrow> P_0x3f29_18_regions \<sigma>\<close>
    \<open>\<forall>\<sigma>. RIP \<sigma> = 0x3f2e \<longrightarrow> P_0x3f2e_19_regions \<sigma>\<close>
    \<open>\<forall>\<sigma>. RIP \<sigma> = 0x3f33 \<longrightarrow> P_0x3f33_20_regions \<sigma>\<close>
    \<open>\<forall>\<sigma>. RIP \<sigma> = 0x3f44 \<longrightarrow> P_0x3f44_true_21_regions \<sigma>\<close>
    \<open>\<forall>\<sigma>. RIP \<sigma> = 0x3f52 \<longrightarrow> P_0x3f52_22_regions \<sigma>\<close>
    \<open>\<forall>\<sigma>. RIP \<sigma> = 0x3f44 \<longrightarrow> P_0x3f44_false_23_regions \<sigma>\<close>
    and [blocks]: \<open>{{Q_bdrv_snapshot_list_addr_0x3eb3_1}} \<box>bdrv_snapshot_list_acode {{P_0x3eb8_2;M_0x3eb3}}\<close>
    and [blocks]: \<open>{{Q_puts_addr_0x3eca_5}} \<box>puts_acode {{P_0x3ecf_6;M_0x3eca}}\<close>
    and [blocks]: \<open>{{Q_bdrv_snapshot_dump_addr_0x3ee2_7}} \<box>bdrv_snapshot_dump_acode {{P_0x3ee7_8;M_0x3ee2}}\<close>
    and [blocks]: \<open>{{Q_puts_addr_0x3ef1_9}} \<box>puts_acode {{P_0x3ef6_10;M_0x3ef1}}\<close>
    and [blocks]: \<open>{{Q_bdrv_snapshot_dump_addr_0x3f17_12}} \<box>bdrv_snapshot_dump_acode {{P_0x3f1c_13;M_0x3f17}}\<close>
    and [blocks]: \<open>{{Q_puts_addr_0x3f1f_14}} \<box>puts_acode {{P_0x3f24_15;M_0x3f1f}}\<close>
    and [blocks]: \<open>{{Q_qemu_free_addr_0x3f2e_19}} \<box>qemu_free_acode {{P_0x3f33_20;M_0x3f2e}}\<close>
    and [blocks]: \<open>{{Q_stack_chk_fail_addr_0x3f52_22}} \<box>stack_chk_fail_acode {{Q_fail;M_0x3f2e}}\<close>
  shows \<open>{{?P}} dump_snapshots_acode {{?Q;?M}}\<close>
  apply (subst dump_snapshots_acode_def)
  apply (vcg_step assms: assms)+
  apply (rule htriples)+
  apply (rule HTriple_weaken[where P= "P_0x3f00_11 || P_0x3f29_18"])
  apply (simp add: pred_logic)
  apply (auto simp add: pred_logic Ps Qs assms)[1]
  apply (rule HTriple_while)
  apply (simp add: pred_logic)
  apply (vcg_step assms: assms)+
  apply (auto simp add: pred_logic Ps Qs assms)[1]
  apply (rule HTriple_weaken[where P= "P_0x3f29_18"])
  apply (auto simp add: pred_logic Ps Qs assms)[1]
  apply (vcg_step assms: assms)+
  done


end
