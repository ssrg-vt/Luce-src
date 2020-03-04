theory "vmdk_read_cid_isra_2"
  imports
    "../../../isabelle/VCG/HTriple"
begin


locale "qemu_img_xen" = execution_context + exec_code +
  fixes bdrv_pread_0x8d36_retval\<^sub>v strstr_0x8d6b_retval\<^sub>v sscanf_0x8d87_retval\<^sub>v stack_chk_fail_0x8db1_retval\<^sub>v stack_chk_fail_addr bdrv_pread_addr sscanf_addr strstr_addr :: \<open>64 word\<close>
    and stack_chk_fail_acode bdrv_pread_acode sscanf_acode strstr_acode :: ACode
  assumes fetch:
    "fetch 0x8d00 \<equiv> (Unary (IS_8088 Push) (Storage (Reg (General SixtyFour r12))), 2)"
    "fetch 0x8d02 \<equiv> (Binary (IS_8088 Mov) (Reg (General ThirtyTwo rcx)) (Immediate SixtyFour (ImmVal 10240)), 5)"
    "fetch 0x8d07 \<equiv> (Binary (IS_8088 Mov) (Reg (General ThirtyTwo r12)) (Storage (Reg (General ThirtyTwo rsi))), 3)"
    "fetch 0x8d0a \<equiv> (Binary (IS_8088 Mov) (Reg (General ThirtyTwo rsi)) (Immediate SixtyFour (ImmVal 512)), 5)"
    "fetch 0x8d0f \<equiv> (Unary (IS_8088 Push) (Storage (Reg (General SixtyFour rbp))), 1)"
    "fetch 0x8d10 \<equiv> (Unary (IS_8088 Push) (Storage (Reg (General SixtyFour rbx))), 1)"
    "fetch 0x8d11 \<equiv> (Binary (IS_8088 Sub) (Reg (General SixtyFour rsp)) (Immediate SixtyFour (ImmVal 10272)), 7)"
    "fetch 0x8d18 \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour rdi)) (Storage (Memory SixtyFour (A_SizeDirective 64 (A_FromReg (General SixtyFour rdi))))), 3)"
    "fetch 0x8d1b \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour rax)) (Storage (Memory SixtyFour (A_SizeDirective 64 (A_Plus (A_FromReg (General SixtyFour fs)) (A_WordConstant 40))))), 9)"
    "fetch 0x8d24 \<equiv> (Binary (IS_8088 Mov) (Memory SixtyFour (A_SizeDirective 64 (A_Plus (A_FromReg (General SixtyFour rsp)) (A_WordConstant 10264)))) (Storage (Reg (General SixtyFour rax))), 8)"
    "fetch 0x8d2c \<equiv> (Binary (IS_8088 Xor) (Reg (General ThirtyTwo rax)) (Storage (Reg (General ThirtyTwo rax))), 2)"
    "fetch 0x8d2e \<equiv> (Binary (IS_8088 Lea) (Reg (General SixtyFour rbp)) (Storage (Memory SixtyFour (A_Plus (A_FromReg (General SixtyFour rsp)) (A_WordConstant 16)))), 5)"
    "fetch 0x8d33 \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour rdx)) (Storage (Reg (General SixtyFour rbp))), 3)"
    "fetch 0x8d36 \<equiv> (Unary (IS_8088 Call) (Immediate SixtyFour (ImmLabel ''bdrv_pread'')), 5)"
    "fetch 0x8d3b \<equiv> (Binary (IS_8088 Xor) (Reg (General ThirtyTwo rdx)) (Storage (Reg (General ThirtyTwo rdx))), 2)"
    "fetch 0x8d3d \<equiv> (Binary (IS_8088 Cmp) (Reg (General ThirtyTwo rax)) (Immediate SixtyFour (ImmVal 10240)), 5)"
    "fetch 0x8d42 \<equiv> (Unary (IS_8088 Jne) (Immediate SixtyFour (ImmVal 36240)), 2)"
    "fetch 0x8d44 \<equiv> (Binary (IS_8088 Cmp) (Reg (General ThirtyTwo r12)) (Immediate SixtyFour (ImmVal 1)), 4)"
    "fetch 0x8d48 \<equiv> (Binary (IS_8088 Lea) (Reg (General SixtyFour rsi)) (Storage (Memory SixtyFour (A_Plus (A_FromReg (General SixtyFour rip)) (A_WordConstant 96852)))), 7)"
    "fetch 0x8d4f \<equiv> (Binary (IS_8088 Lea) (Reg (General SixtyFour rax)) (Storage (Memory SixtyFour (A_Plus (A_FromReg (General SixtyFour rip)) (A_WordConstant 96851)))), 7)"
    "fetch 0x8d56 \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour rdi)) (Storage (Reg (General SixtyFour rbp))), 3)"
    "fetch 0x8d59 \<equiv> (Binary (IS_8088 Sbb) (Reg (General SixtyFour rbx)) (Storage (Reg (General SixtyFour rbx))), 3)"
    "fetch 0x8d5c \<equiv> (Binary (IS_8088 And) (Reg (General SixtyFour rbx)) (Immediate SixtyFour (ImmVal 18446744073709551610)), 4)"
    "fetch 0x8d60 \<equiv> (Binary (IS_8088 Add) (Reg (General SixtyFour rbx)) (Immediate SixtyFour (ImmVal 10)), 4)"
    "fetch 0x8d64 \<equiv> (Binary (IS_8088 Test) (Reg (General ThirtyTwo r12)) (Storage (Reg (General ThirtyTwo r12))), 3)"
    "fetch 0x8d67 \<equiv> (Binary (IS_PentiumPro Cmove) (Reg (General SixtyFour rsi)) (Storage (Reg (General SixtyFour rax))), 4)"
    "fetch 0x8d6b \<equiv> (Unary (IS_8088 Call) (Immediate SixtyFour (ImmLabel ''strstr'')), 5)"
    "fetch 0x8d70 \<equiv> (Binary (IS_8088 Test) (Reg (General SixtyFour rax)) (Storage (Reg (General SixtyFour rax))), 3)"
    "fetch 0x8d73 \<equiv> (Unary (IS_8088 Je) (Immediate SixtyFour (ImmVal 36236)), 2)"
    "fetch 0x8d75 \<equiv> (Binary (IS_8088 Lea) (Reg (General SixtyFour rdi)) (Storage (Memory SixtyFour (A_Plus (A_FromReg (General SixtyFour rax)) (A_Mult 1 (A_FromReg (General SixtyFour rbx)))))), 4)"
    "fetch 0x8d79 \<equiv> (Binary (IS_8088 Lea) (Reg (General SixtyFour rdx)) (Storage (Memory SixtyFour (A_Plus (A_FromReg (General SixtyFour rsp)) (A_WordConstant 12)))), 5)"
    "fetch 0x8d7e \<equiv> (Binary (IS_8088 Xor) (Reg (General ThirtyTwo rax)) (Storage (Reg (General ThirtyTwo rax))), 2)"
    "fetch 0x8d80 \<equiv> (Binary (IS_8088 Lea) (Reg (General SixtyFour rsi)) (Storage (Memory SixtyFour (A_Plus (A_FromReg (General SixtyFour rip)) (A_WordConstant 96793)))), 7)"
    "fetch 0x8d87 \<equiv> (Unary (IS_8088 Call) (Immediate SixtyFour (ImmLabel ''sscanf'')), 5)"
    "fetch 0x8d8c \<equiv> (Binary (IS_8088 Mov) (Reg (General ThirtyTwo rdx)) (Storage (Memory ThirtyTwo (A_SizeDirective 32 (A_Plus (A_FromReg (General SixtyFour rsp)) (A_WordConstant 12))))), 4)"
    "fetch 0x8d90 \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour rcx)) (Storage (Memory SixtyFour (A_SizeDirective 64 (A_Plus (A_FromReg (General SixtyFour rsp)) (A_WordConstant 10264))))), 8)"
    "fetch 0x8d98 \<equiv> (Binary (IS_8088 Xor) (Reg (General SixtyFour rcx)) (Storage (Memory SixtyFour (A_SizeDirective 64 (A_Plus (A_FromReg (General SixtyFour fs)) (A_WordConstant 40))))), 9)"
    "fetch 0x8da1 \<equiv> (Binary (IS_8088 Mov) (Reg (General ThirtyTwo rax)) (Storage (Reg (General ThirtyTwo rdx))), 2)"
    "fetch 0x8da3 \<equiv> (Unary (IS_8088 Jne) (Immediate SixtyFour (ImmVal 36273)), 2)"
    "fetch 0x8da5 \<equiv> (Binary (IS_8088 Add) (Reg (General SixtyFour rsp)) (Immediate SixtyFour (ImmVal 10272)), 7)"
    "fetch 0x8dac \<equiv> (Unary (IS_8088 Pop) (Storage (Reg (General SixtyFour rbx))), 1)"
    "fetch 0x8dad \<equiv> (Unary (IS_8088 Pop) (Storage (Reg (General SixtyFour rbp))), 1)"
    "fetch 0x8dae \<equiv> (Unary (IS_8088 Pop) (Storage (Reg (General SixtyFour r12))), 2)"
    "fetch 0x8db0 \<equiv> (Nullary (IS_8088 Ret), 1)"
    "fetch 0x8db1 \<equiv> (Unary (IS_8088 Call) (Immediate SixtyFour (ImmLabel ''__stack_chk_fail'')), 5)"
    and \<alpha>_def: \<open>\<alpha> = \<lparr>text_sections = [], data_sections = [], labels_to_offsets = [], binary_offset = 0\<rparr>\<close>
    and stack_chk_fail\<^sub>a\<^sub>d\<^sub>d\<^sub>r[simp]: \<open>the (label_to_address \<alpha> ''__stack_chk_fail'') = stack_chk_fail_addr\<close>
    and bdrv_pread\<^sub>a\<^sub>d\<^sub>d\<^sub>r[simp]: \<open>the (label_to_address \<alpha> ''bdrv_pread'') = bdrv_pread_addr\<close>
    and sscanf\<^sub>a\<^sub>d\<^sub>d\<^sub>r[simp]: \<open>the (label_to_address \<alpha> ''sscanf'') = sscanf_addr\<close>
    and strstr\<^sub>a\<^sub>d\<^sub>d\<^sub>r[simp]: \<open>the (label_to_address \<alpha> ''strstr'') = strstr_addr\<close>
begin

text \<open>Using definitions that don't get unfolded immediately prevents locale argument issues.\<close>
definition \<open>bdrv_pread_0x8d36_retval \<equiv> bdrv_pread_0x8d36_retval\<^sub>v\<close>
definition \<open>strstr_0x8d6b_retval \<equiv> strstr_0x8d6b_retval\<^sub>v\<close>
definition \<open>sscanf_0x8d87_retval \<equiv> sscanf_0x8d87_retval\<^sub>v\<close>
definition \<open>stack_chk_fail_0x8db1_retval \<equiv> stack_chk_fail_0x8db1_retval\<^sub>v\<close>

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

locale "vmdk_read_cid_isra_2" = "qemu_img_xen" +
  fixes RAX\<^sub>0\<^sub>v RBX\<^sub>0\<^sub>v RCX\<^sub>0\<^sub>v RDX\<^sub>0\<^sub>v RDI\<^sub>0\<^sub>v RSI\<^sub>0\<^sub>v RSP\<^sub>0\<^sub>v RBP\<^sub>0\<^sub>v R12\<^sub>0\<^sub>v FS\<^sub>0\<^sub>v ret_address\<^sub>v :: \<open>64 word\<close>
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
definition \<open>R12\<^sub>0 \<equiv> R12\<^sub>0\<^sub>v\<close>
definition \<open>FS\<^sub>0 \<equiv> FS\<^sub>0\<^sub>v\<close>
definition \<open>ret_address \<equiv> ret_address\<^sub>v\<close>

definition P_0x8d00_0 :: state_pred where
  \<open>P_0x8d00_0 \<sigma> \<equiv> RIP \<sigma> = 0x8d00 \<and> RAX \<sigma> = RAX\<^sub>0 \<and> RBX \<sigma> = RBX\<^sub>0 \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = RDX\<^sub>0 \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = RSP\<^sub>0 \<and> RBP \<sigma> = RBP\<^sub>0 \<and> R12 \<sigma> = R12\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address\<close>
declare P_0x8d00_0_def[Ps]

definition P_0x8d00_0_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x8d00_0_regions_set \<sigma> \<equiv> {
    (0, RDI\<^sub>0, 8),
    (1, RSP\<^sub>0, 8),
    (2, ((FS\<^sub>0::64 word) + 0x28), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x20), 8)
  }\<close>

definition P_0x8d00_0_regions :: state_pred where
  \<open>P_0x8d00_0_regions \<sigma> \<equiv> \<exists>regions. P_0x8d00_0_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x8d36_0 :: state_pred where
  \<open>Q_0x8d36_0 \<sigma> \<equiv> RIP \<sigma> = 0x8d36 \<and> RAX \<sigma> = 0x0 \<and> RBX \<sigma> = RBX\<^sub>0 \<and> RCX \<sigma> = 0x2800 \<and> RDX \<sigma> = ((RSP\<^sub>0::64 word) - 0x2828) \<and> RDI \<sigma> = (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) \<and> RSI \<sigma> = 0x200 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x2838) \<and> RBP \<sigma> = ((RSP\<^sub>0::64 word) - 0x2828) \<and> R12 \<sigma> = ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) = (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word)\<close>
declare Q_0x8d36_0_def[Qs]

schematic_goal vmdk_read_cid_isra_2_0_13_0x8d00_0x8d33_0[blocks]:
  assumes \<open>(P_0x8d00_0 && P_0x8d00_0_regions) \<sigma>\<close>
  shows \<open>exec_block 13 0x8d33 0 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x8d36_0 ?\<sigma> \<and> block_usage P_0x8d00_0_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x8d00_0_def P_0x8d00_0_regions_def post: Q_0x8d36_0_def regionset: P_0x8d00_0_regions_set_def)

definition P_0x8d36_1 :: state_pred where
  \<open>P_0x8d36_1 \<sigma> \<equiv> RIP \<sigma> = 0x8d36 \<and> RAX \<sigma> = 0x0 \<and> RBX \<sigma> = RBX\<^sub>0 \<and> RCX \<sigma> = 0x2800 \<and> RDX \<sigma> = ((RSP\<^sub>0::64 word) - 0x2828) \<and> RDI \<sigma> = (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) \<and> RSI \<sigma> = 0x200 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x2838) \<and> RBP \<sigma> = ((RSP\<^sub>0::64 word) - 0x2828) \<and> R12 \<sigma> = ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) = (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word)\<close>
declare P_0x8d36_1_def[Ps]

definition P_0x8d36_1_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x8d36_1_regions_set \<sigma> \<equiv> {
    (0, RDI\<^sub>0, 8),
    (1, RSP\<^sub>0, 8),
    (2, ((FS\<^sub>0::64 word) + 0x28), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x2840), 8)
  }\<close>

definition P_0x8d36_1_regions :: state_pred where
  \<open>P_0x8d36_1_regions \<sigma> \<equiv> \<exists>regions. P_0x8d36_1_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_bdrv_pread_addr_0x8d36_1 :: state_pred where
  \<open>Q_bdrv_pread_addr_0x8d36_1 \<sigma> \<equiv> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x2840) \<and> RIP \<sigma> = bdrv_pread_addr \<and> RAX \<sigma> = 0x0 \<and> RBX \<sigma> = RBX\<^sub>0 \<and> RCX \<sigma> = 0x2800 \<and> RDX \<sigma> = ((RSP\<^sub>0::64 word) - 0x2828) \<and> RDI \<sigma> = (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) \<and> RSI \<sigma> = 0x200 \<and> RBP \<sigma> = ((RSP\<^sub>0::64 word) - 0x2828) \<and> R12 \<sigma> = ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) = (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x2840),8]::64 word) = 0x8d3b\<close>
declare Q_bdrv_pread_addr_0x8d36_1_def[Qs]

schematic_goal vmdk_read_cid_isra_2_0_1_0x8d36_0x8d36_1[blocks]:
  assumes \<open>(P_0x8d36_1 && P_0x8d36_1_regions) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x8d36 (Suc 0) \<sigma> \<triangleq> ?\<sigma> \<and> Q_bdrv_pread_addr_0x8d36_1 ?\<sigma> \<and> block_usage P_0x8d36_1_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x8d36_1_def P_0x8d36_1_regions_def post: Q_bdrv_pread_addr_0x8d36_1_def regionset: P_0x8d36_1_regions_set_def)

definition P_0x8d3b_2 :: state_pred where
  \<open>P_0x8d3b_2 \<sigma> \<equiv> RIP \<sigma> = 0x8d3b \<and> RAX \<sigma> = bdrv_pread_0x8d36_retval \<and> RBX \<sigma> = RBX\<^sub>0 \<and> RCX \<sigma> = 0x2800 \<and> RDX \<sigma> = ((RSP\<^sub>0::64 word) - 0x2828) \<and> RDI \<sigma> = (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) \<and> RSI \<sigma> = 0x200 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x2838) \<and> RBP \<sigma> = ((RSP\<^sub>0::64 word) - 0x2828) \<and> R12 \<sigma> = ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) = (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x2840),8]::64 word) = 0x8d3b\<close>
declare P_0x8d3b_2_def[Ps]

definition P_0x8d3b_2_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x8d3b_2_regions_set \<sigma> \<equiv> {
    (0, RDI\<^sub>0, 8),
    (1, RSP\<^sub>0, 8),
    (2, ((FS\<^sub>0::64 word) + 0x28), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x2840), 8)
  }\<close>

definition P_0x8d3b_2_regions :: state_pred where
  \<open>P_0x8d3b_2_regions \<sigma> \<equiv> \<exists>regions. P_0x8d3b_2_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x8d42_2 :: state_pred where
  \<open>Q_0x8d42_2 \<sigma> \<equiv> RIP \<sigma> = 0x8d42 \<and> RAX \<sigma> = bdrv_pread_0x8d36_retval \<and> RBX \<sigma> = RBX\<^sub>0 \<and> RCX \<sigma> = 0x2800 \<and> RDX \<sigma> = 0x0 \<and> RDI \<sigma> = (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) \<and> RSI \<sigma> = 0x200 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x2838) \<and> RBP \<sigma> = ((RSP\<^sub>0::64 word) - 0x2828) \<and> R12 \<sigma> = ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) = (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x2840),8]::64 word) = 0x8d3b\<close>
declare Q_0x8d42_2_def[Qs]

schematic_goal vmdk_read_cid_isra_2_0_2_0x8d3b_0x8d3d_2[blocks]:
  assumes \<open>(P_0x8d3b_2 && P_0x8d3b_2_regions) \<sigma>\<close>
  shows \<open>exec_block 2 0x8d3d 2 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x8d42_2 ?\<sigma> \<and> block_usage P_0x8d3b_2_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x8d3b_2_def P_0x8d3b_2_regions_def post: Q_0x8d42_2_def regionset: P_0x8d3b_2_regions_set_def)

definition P_0x8d42_true_3 :: state_pred where
  \<open>P_0x8d42_true_3 \<sigma> \<equiv> RIP \<sigma> = 0x8d42 \<and> RAX \<sigma> = bdrv_pread_0x8d36_retval \<and> RBX \<sigma> = RBX\<^sub>0 \<and> RCX \<sigma> = 0x2800 \<and> RDX \<sigma> = 0x0 \<and> RDI \<sigma> = (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) \<and> RSI \<sigma> = 0x200 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x2838) \<and> RBP \<sigma> = ((RSP\<^sub>0::64 word) - 0x2828) \<and> R12 \<sigma> = ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) = (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x2840),8]::64 word) = 0x8d3b\<close>
declare P_0x8d42_true_3_def[Ps]

definition P_0x8d42_true_3_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x8d42_true_3_regions_set \<sigma> \<equiv> {
    (0, RDI\<^sub>0, 8),
    (1, RSP\<^sub>0, 8),
    (2, ((FS\<^sub>0::64 word) + 0x28), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x2840), 8)
  }\<close>

definition P_0x8d42_true_3_regions :: state_pred where
  \<open>P_0x8d42_true_3_regions \<sigma> \<equiv> \<exists>regions. P_0x8d42_true_3_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x8d90_3 :: state_pred where
  \<open>Q_0x8d90_3 \<sigma> \<equiv> RIP \<sigma> = 0x8d90 \<and> RCX \<sigma> = 0x2800 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x2838) \<and> RBP \<sigma> = ((RSP\<^sub>0::64 word) - 0x2828) \<and> R12 \<sigma> = ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) = (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word)\<close>
declare Q_0x8d90_3_def[Qs]

schematic_goal vmdk_read_cid_isra_2_0_1_0x8d42_0x8d42_3[blocks]:
  assumes \<open>(P_0x8d42_true_3 && P_0x8d42_true_3_regions && !ZF) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x8d42 3 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x8d90_3 ?\<sigma> \<and> block_usage P_0x8d42_true_3_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x8d42_true_3_def P_0x8d42_true_3_regions_def post: Q_0x8d90_3_def regionset: P_0x8d42_true_3_regions_set_def)

definition P_0x8d42_false_4 :: state_pred where
  \<open>P_0x8d42_false_4 \<sigma> \<equiv> RIP \<sigma> = 0x8d42 \<and> RAX \<sigma> = bdrv_pread_0x8d36_retval \<and> RBX \<sigma> = RBX\<^sub>0 \<and> RCX \<sigma> = 0x2800 \<and> RDX \<sigma> = 0x0 \<and> RDI \<sigma> = (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) \<and> RSI \<sigma> = 0x200 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x2838) \<and> RBP \<sigma> = ((RSP\<^sub>0::64 word) - 0x2828) \<and> R12 \<sigma> = ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) = (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x2840),8]::64 word) = 0x8d3b\<close>
declare P_0x8d42_false_4_def[Ps]

definition P_0x8d42_false_4_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x8d42_false_4_regions_set \<sigma> \<equiv> {
    (0, RDI\<^sub>0, 8),
    (1, RSP\<^sub>0, 8),
    (2, ((FS\<^sub>0::64 word) + 0x28), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x2840), 8)
  }\<close>

definition P_0x8d42_false_4_regions :: state_pred where
  \<open>P_0x8d42_false_4_regions \<sigma> \<equiv> \<exists>regions. P_0x8d42_false_4_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x8d6b_4 :: state_pred where
  \<open>Q_0x8d6b_4 \<sigma> \<equiv> RIP \<sigma> = 0x8d6b \<and> RAX \<sigma> = 0x207a9 \<and> RBX \<sigma> = ((((((RBX\<^sub>0::64 word) - ((RBX\<^sub>0::64 word) + (if' ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) < 0x1 then 0x1 else (0x0::64 word))))::64 word) AND 0xfffffffffffffffa)::64 word) + 0xa) \<and> RCX \<sigma> = 0x2800 \<and> RDX \<sigma> = 0x0 \<and> RDI \<sigma> = ((RSP\<^sub>0::64 word) - 0x2828) \<and> RSI \<sigma> = (if' ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) = (ucast ((0x0::64 word))::32 word) then 0x207a9 else (0x207a3::64 word)) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x2838) \<and> RBP \<sigma> = ((RSP\<^sub>0::64 word) - 0x2828) \<and> R12 \<sigma> = ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) = (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x2840),8]::64 word) = 0x8d3b\<close>
declare Q_0x8d6b_4_def[Qs]

schematic_goal vmdk_read_cid_isra_2_0_10_0x8d42_0x8d67_4[blocks]:
  assumes \<open>(P_0x8d42_false_4 && P_0x8d42_false_4_regions && ! !ZF) \<sigma>\<close>
  shows \<open>exec_block 10 0x8d67 4 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x8d6b_4 ?\<sigma> \<and> block_usage P_0x8d42_false_4_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x8d42_false_4_def P_0x8d42_false_4_regions_def post: Q_0x8d6b_4_def regionset: P_0x8d42_false_4_regions_set_def)

definition P_0x8d6b_5 :: state_pred where
  \<open>P_0x8d6b_5 \<sigma> \<equiv> RIP \<sigma> = 0x8d6b \<and> RAX \<sigma> = 0x207a9 \<and> RBX \<sigma> = ((((((RBX\<^sub>0::64 word) - ((RBX\<^sub>0::64 word) + (if' ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) < 0x1 then 0x1 else (0x0::64 word))))::64 word) AND 0xfffffffffffffffa)::64 word) + 0xa) \<and> RCX \<sigma> = 0x2800 \<and> RDX \<sigma> = 0x0 \<and> RDI \<sigma> = ((RSP\<^sub>0::64 word) - 0x2828) \<and> RSI \<sigma> = (if' ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) = (ucast ((0x0::64 word))::32 word) then 0x207a9 else (0x207a3::64 word)) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x2838) \<and> RBP \<sigma> = ((RSP\<^sub>0::64 word) - 0x2828) \<and> R12 \<sigma> = ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) = (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x2840),8]::64 word) = 0x8d3b\<close>
declare P_0x8d6b_5_def[Ps]

definition P_0x8d6b_5_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x8d6b_5_regions_set \<sigma> \<equiv> {
    (0, RDI\<^sub>0, 8),
    (1, RSP\<^sub>0, 8),
    (2, ((FS\<^sub>0::64 word) + 0x28), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x2840), 8)
  }\<close>

definition P_0x8d6b_5_regions :: state_pred where
  \<open>P_0x8d6b_5_regions \<sigma> \<equiv> \<exists>regions. P_0x8d6b_5_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_strstr_addr_0x8d6b_5 :: state_pred where
  \<open>Q_strstr_addr_0x8d6b_5 \<sigma> \<equiv> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x2840) \<and> RIP \<sigma> = strstr_addr \<and> RAX \<sigma> = 0x207a9 \<and> RBX \<sigma> = ((((((RBX\<^sub>0::64 word) - ((RBX\<^sub>0::64 word) + (if' ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) < 0x1 then 0x1 else (0x0::64 word))))::64 word) AND 0xfffffffffffffffa)::64 word) + 0xa) \<and> RCX \<sigma> = 0x2800 \<and> RDX \<sigma> = 0x0 \<and> RDI \<sigma> = ((RSP\<^sub>0::64 word) - 0x2828) \<and> RSI \<sigma> = (if' ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) = (ucast ((0x0::64 word))::32 word) then 0x207a9 else (0x207a3::64 word)) \<and> RBP \<sigma> = ((RSP\<^sub>0::64 word) - 0x2828) \<and> R12 \<sigma> = ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) = (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x2840),8]::64 word) = 0x8d70\<close>
declare Q_strstr_addr_0x8d6b_5_def[Qs]

schematic_goal vmdk_read_cid_isra_2_0_1_0x8d6b_0x8d6b_5[blocks]:
  assumes \<open>(P_0x8d6b_5 && P_0x8d6b_5_regions) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x8d6b 5 \<sigma> \<triangleq> ?\<sigma> \<and> Q_strstr_addr_0x8d6b_5 ?\<sigma> \<and> block_usage P_0x8d6b_5_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x8d6b_5_def P_0x8d6b_5_regions_def post: Q_strstr_addr_0x8d6b_5_def regionset: P_0x8d6b_5_regions_set_def)

definition P_0x8d70_6 :: state_pred where
  \<open>P_0x8d70_6 \<sigma> \<equiv> RIP \<sigma> = 0x8d70 \<and> RAX \<sigma> = strstr_0x8d6b_retval \<and> RBX \<sigma> = ((((((RBX\<^sub>0::64 word) - ((RBX\<^sub>0::64 word) + (if' ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) < 0x1 then 0x1 else (0x0::64 word))))::64 word) AND 0xfffffffffffffffa)::64 word) + 0xa) \<and> RCX \<sigma> = 0x2800 \<and> RDX \<sigma> = 0x0 \<and> RDI \<sigma> = ((RSP\<^sub>0::64 word) - 0x2828) \<and> RSI \<sigma> = (if' ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) = (ucast ((0x0::64 word))::32 word) then 0x207a9 else (0x207a3::64 word)) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x2838) \<and> RBP \<sigma> = ((RSP\<^sub>0::64 word) - 0x2828) \<and> R12 \<sigma> = ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) = (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x2840),8]::64 word) = 0x8d70\<close>
declare P_0x8d70_6_def[Ps]

definition P_0x8d70_6_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x8d70_6_regions_set \<sigma> \<equiv> {
    (0, RDI\<^sub>0, 8),
    (1, RSP\<^sub>0, 8),
    (2, ((FS\<^sub>0::64 word) + 0x28), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x2840), 8)
  }\<close>

definition P_0x8d70_6_regions :: state_pred where
  \<open>P_0x8d70_6_regions \<sigma> \<equiv> \<exists>regions. P_0x8d70_6_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x8d73_6 :: state_pred where
  \<open>Q_0x8d73_6 \<sigma> \<equiv> RIP \<sigma> = 0x8d73 \<and> RAX \<sigma> = strstr_0x8d6b_retval \<and> RBX \<sigma> = ((((((RBX\<^sub>0::64 word) - ((RBX\<^sub>0::64 word) + (if' ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) < 0x1 then 0x1 else (0x0::64 word))))::64 word) AND 0xfffffffffffffffa)::64 word) + 0xa) \<and> RCX \<sigma> = 0x2800 \<and> RDX \<sigma> = 0x0 \<and> RDI \<sigma> = ((RSP\<^sub>0::64 word) - 0x2828) \<and> RSI \<sigma> = (if' ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) = (ucast ((0x0::64 word))::32 word) then 0x207a9 else (0x207a3::64 word)) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x2838) \<and> RBP \<sigma> = ((RSP\<^sub>0::64 word) - 0x2828) \<and> R12 \<sigma> = ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) = (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x2840),8]::64 word) = 0x8d70\<close>
declare Q_0x8d73_6_def[Qs]

schematic_goal vmdk_read_cid_isra_2_0_1_0x8d70_0x8d70_6[blocks]:
  assumes \<open>(P_0x8d70_6 && P_0x8d70_6_regions) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x8d70 6 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x8d73_6 ?\<sigma> \<and> block_usage P_0x8d70_6_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x8d70_6_def P_0x8d70_6_regions_def post: Q_0x8d73_6_def regionset: P_0x8d70_6_regions_set_def)

definition P_0x8d73_true_7 :: state_pred where
  \<open>P_0x8d73_true_7 \<sigma> \<equiv> RIP \<sigma> = 0x8d73 \<and> RAX \<sigma> = strstr_0x8d6b_retval \<and> RBX \<sigma> = ((((((RBX\<^sub>0::64 word) - ((RBX\<^sub>0::64 word) + (if' ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) < 0x1 then 0x1 else (0x0::64 word))))::64 word) AND 0xfffffffffffffffa)::64 word) + 0xa) \<and> RCX \<sigma> = 0x2800 \<and> RDX \<sigma> = 0x0 \<and> RDI \<sigma> = ((RSP\<^sub>0::64 word) - 0x2828) \<and> RSI \<sigma> = (if' ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) = (ucast ((0x0::64 word))::32 word) then 0x207a9 else (0x207a3::64 word)) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x2838) \<and> RBP \<sigma> = ((RSP\<^sub>0::64 word) - 0x2828) \<and> R12 \<sigma> = ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) = (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x2840),8]::64 word) = 0x8d70\<close>
declare P_0x8d73_true_7_def[Ps]

definition P_0x8d73_true_7_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x8d73_true_7_regions_set \<sigma> \<equiv> {
    (0, RDI\<^sub>0, 8),
    (1, RSP\<^sub>0, 8),
    (2, ((FS\<^sub>0::64 word) + 0x28), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x2840), 8)
  }\<close>

definition P_0x8d73_true_7_regions :: state_pred where
  \<open>P_0x8d73_true_7_regions \<sigma> \<equiv> \<exists>regions. P_0x8d73_true_7_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x8d8c_7 :: state_pred where
  \<open>Q_0x8d8c_7 \<sigma> \<equiv> RIP \<sigma> = 0x8d8c \<and> RBX \<sigma> = ((((((RBX\<^sub>0::64 word) - ((RBX\<^sub>0::64 word) + (if' ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) < 0x1 then 0x1 else (0x0::64 word))))::64 word) AND 0xfffffffffffffffa)::64 word) + 0xa) \<and> RCX \<sigma> = 0x2800 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x2838) \<and> RBP \<sigma> = ((RSP\<^sub>0::64 word) - 0x2828) \<and> R12 \<sigma> = ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) = (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word)\<close>
declare Q_0x8d8c_7_def[Qs]

schematic_goal vmdk_read_cid_isra_2_0_1_0x8d73_0x8d73_7[blocks]:
  assumes \<open>(P_0x8d73_true_7 && P_0x8d73_true_7_regions && ZF) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x8d73 7 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x8d8c_7 ?\<sigma> \<and> block_usage P_0x8d73_true_7_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x8d73_true_7_def P_0x8d73_true_7_regions_def post: Q_0x8d8c_7_def regionset: P_0x8d73_true_7_regions_set_def)

definition P_0x8d73_false_8 :: state_pred where
  \<open>P_0x8d73_false_8 \<sigma> \<equiv> RIP \<sigma> = 0x8d73 \<and> RAX \<sigma> = strstr_0x8d6b_retval \<and> RBX \<sigma> = ((((((RBX\<^sub>0::64 word) - ((RBX\<^sub>0::64 word) + (if' ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) < 0x1 then 0x1 else (0x0::64 word))))::64 word) AND 0xfffffffffffffffa)::64 word) + 0xa) \<and> RCX \<sigma> = 0x2800 \<and> RDX \<sigma> = 0x0 \<and> RDI \<sigma> = ((RSP\<^sub>0::64 word) - 0x2828) \<and> RSI \<sigma> = (if' ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) = (ucast ((0x0::64 word))::32 word) then 0x207a9 else (0x207a3::64 word)) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x2838) \<and> RBP \<sigma> = ((RSP\<^sub>0::64 word) - 0x2828) \<and> R12 \<sigma> = ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) = (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x2840),8]::64 word) = 0x8d70\<close>
declare P_0x8d73_false_8_def[Ps]

definition P_0x8d73_false_8_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x8d73_false_8_regions_set \<sigma> \<equiv> {
    (0, RDI\<^sub>0, 8),
    (1, RSP\<^sub>0, 8),
    (2, ((FS\<^sub>0::64 word) + 0x28), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x2840), 8)
  }\<close>

definition P_0x8d73_false_8_regions :: state_pred where
  \<open>P_0x8d73_false_8_regions \<sigma> \<equiv> \<exists>regions. P_0x8d73_false_8_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x8d87_8 :: state_pred where
  \<open>Q_0x8d87_8 \<sigma> \<equiv> RIP \<sigma> = 0x8d87 \<and> RAX \<sigma> = 0x0 \<and> RBX \<sigma> = ((((((RBX\<^sub>0::64 word) - ((RBX\<^sub>0::64 word) + (if' ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) < 0x1 then 0x1 else (0x0::64 word))))::64 word) AND 0xfffffffffffffffa)::64 word) + 0xa) \<and> RCX \<sigma> = 0x2800 \<and> RDX \<sigma> = ((RSP\<^sub>0::64 word) - 0x282c) \<and> RDI \<sigma> = ((strstr_0x8d6b_retval::64 word) + (\<langle>63,0\<rangle>((((((((RBX\<^sub>0::64 word) - ((RBX\<^sub>0::64 word) + (if' ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) < 0x1 then 0x1 else (0x0::64 word))))::64 word) AND 0xfffffffffffffffa)::64 word) + 0xa)::64 word) * 0x1)::64 word)) \<and> RSI \<sigma> = 0x207a0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x2838) \<and> RBP \<sigma> = ((RSP\<^sub>0::64 word) - 0x2828) \<and> R12 \<sigma> = ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) = (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x2840),8]::64 word) = 0x8d70\<close>
declare Q_0x8d87_8_def[Qs]

schematic_goal vmdk_read_cid_isra_2_0_5_0x8d73_0x8d80_8[blocks]:
  assumes \<open>(P_0x8d73_false_8 && P_0x8d73_false_8_regions && ! ZF) \<sigma>\<close>
  shows \<open>exec_block 5 0x8d80 8 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x8d87_8 ?\<sigma> \<and> block_usage P_0x8d73_false_8_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x8d73_false_8_def P_0x8d73_false_8_regions_def post: Q_0x8d87_8_def regionset: P_0x8d73_false_8_regions_set_def)

definition P_0x8d87_9 :: state_pred where
  \<open>P_0x8d87_9 \<sigma> \<equiv> RIP \<sigma> = 0x8d87 \<and> RAX \<sigma> = 0x0 \<and> RBX \<sigma> = ((((((RBX\<^sub>0::64 word) - ((RBX\<^sub>0::64 word) + (if' ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) < 0x1 then 0x1 else (0x0::64 word))))::64 word) AND 0xfffffffffffffffa)::64 word) + 0xa) \<and> RCX \<sigma> = 0x2800 \<and> RDX \<sigma> = ((RSP\<^sub>0::64 word) - 0x282c) \<and> RDI \<sigma> = ((strstr_0x8d6b_retval::64 word) + (\<langle>63,0\<rangle>((((((((RBX\<^sub>0::64 word) - ((RBX\<^sub>0::64 word) + (if' ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) < 0x1 then 0x1 else (0x0::64 word))))::64 word) AND 0xfffffffffffffffa)::64 word) + 0xa)::64 word) * 0x1)::64 word)) \<and> RSI \<sigma> = 0x207a0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x2838) \<and> RBP \<sigma> = ((RSP\<^sub>0::64 word) - 0x2828) \<and> R12 \<sigma> = ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) = (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x2840),8]::64 word) = 0x8d70\<close>
declare P_0x8d87_9_def[Ps]

definition P_0x8d87_9_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x8d87_9_regions_set \<sigma> \<equiv> {
    (0, RDI\<^sub>0, 8),
    (1, RSP\<^sub>0, 8),
    (2, ((FS\<^sub>0::64 word) + 0x28), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x2840), 8)
  }\<close>

definition P_0x8d87_9_regions :: state_pred where
  \<open>P_0x8d87_9_regions \<sigma> \<equiv> \<exists>regions. P_0x8d87_9_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_sscanf_addr_0x8d87_9 :: state_pred where
  \<open>Q_sscanf_addr_0x8d87_9 \<sigma> \<equiv> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x2840) \<and> RIP \<sigma> = sscanf_addr \<and> RAX \<sigma> = 0x0 \<and> RBX \<sigma> = ((((((RBX\<^sub>0::64 word) - ((RBX\<^sub>0::64 word) + (if' ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) < 0x1 then 0x1 else (0x0::64 word))))::64 word) AND 0xfffffffffffffffa)::64 word) + 0xa) \<and> RCX \<sigma> = 0x2800 \<and> RBP \<sigma> = ((RSP\<^sub>0::64 word) - 0x2828) \<and> R12 \<sigma> = ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) = (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word)\<close>
declare Q_sscanf_addr_0x8d87_9_def[Qs]

schematic_goal vmdk_read_cid_isra_2_0_1_0x8d87_0x8d87_9[blocks]:
  assumes \<open>(P_0x8d87_9 && P_0x8d87_9_regions) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x8d87 9 \<sigma> \<triangleq> ?\<sigma> \<and> Q_sscanf_addr_0x8d87_9 ?\<sigma> \<and> block_usage P_0x8d87_9_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x8d87_9_def P_0x8d87_9_regions_def post: Q_sscanf_addr_0x8d87_9_def regionset: P_0x8d87_9_regions_set_def)

definition P_0x8d8c_10 :: state_pred where
  \<open>P_0x8d8c_10 \<sigma> \<equiv> RIP \<sigma> = 0x8d8c \<and> RBX \<sigma> = ((((((RBX\<^sub>0::64 word) - ((RBX\<^sub>0::64 word) + (if' ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) < 0x1 then 0x1 else (0x0::64 word))))::64 word) AND 0xfffffffffffffffa)::64 word) + 0xa) \<and> RCX \<sigma> = 0x2800 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x2838) \<and> RBP \<sigma> = ((RSP\<^sub>0::64 word) - 0x2828) \<and> R12 \<sigma> = ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) = (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word)\<close>
declare P_0x8d8c_10_def[Ps]

definition P_0x8d8c_10_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x8d8c_10_regions_set \<sigma> \<equiv> {
    (0, RDI\<^sub>0, 8),
    (1, RSP\<^sub>0, 8),
    (2, ((FS\<^sub>0::64 word) + 0x28), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x282c), 4)
  }\<close>

definition P_0x8d8c_10_regions :: state_pred where
  \<open>P_0x8d8c_10_regions \<sigma> \<equiv> \<exists>regions. P_0x8d8c_10_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x8d90_10 :: state_pred where
  \<open>Q_0x8d90_10 \<sigma> \<equiv> RIP \<sigma> = 0x8d90 \<and> RCX \<sigma> = 0x2800 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x2838) \<and> RBP \<sigma> = ((RSP\<^sub>0::64 word) - 0x2828) \<and> R12 \<sigma> = ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) = (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word)\<close>
declare Q_0x8d90_10_def[Qs]

schematic_goal vmdk_read_cid_isra_2_0_1_0x8d8c_0x8d8c_10[blocks]:
  assumes \<open>(P_0x8d8c_10 && P_0x8d8c_10_regions) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x8d8c 10 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x8d90_10 ?\<sigma> \<and> block_usage P_0x8d8c_10_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x8d8c_10_def P_0x8d8c_10_regions_def post: Q_0x8d90_10_def regionset: P_0x8d8c_10_regions_set_def)

definition P_0x8d90_11 :: state_pred where
  \<open>P_0x8d90_11 \<sigma> \<equiv> RIP \<sigma> = 0x8d90 \<and> RCX \<sigma> = 0x2800 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x2838) \<and> RBP \<sigma> = ((RSP\<^sub>0::64 word) - 0x2828) \<and> R12 \<sigma> = ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) = (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word)\<close>
declare P_0x8d90_11_def[Ps]

definition P_0x8d90_11_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x8d90_11_regions_set \<sigma> \<equiv> {
    (0, RDI\<^sub>0, 8),
    (1, RSP\<^sub>0, 8),
    (2, ((FS\<^sub>0::64 word) + 0x28), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x20), 8)
  }\<close>

definition P_0x8d90_11_regions :: state_pred where
  \<open>P_0x8d90_11_regions \<sigma> \<equiv> \<exists>regions. P_0x8d90_11_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x8da3_11 :: state_pred where
  \<open>Q_0x8da3_11 \<sigma> \<equiv> RIP \<sigma> = 0x8da3 \<and> RAX \<sigma> = ucast ((\<langle>31,0\<rangle>RDX \<sigma>::32 word)) \<and> RCX \<sigma> = 0x0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x2838) \<and> RBP \<sigma> = ((RSP\<^sub>0::64 word) - 0x2828) \<and> R12 \<sigma> = ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) = (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word)\<close>
declare Q_0x8da3_11_def[Qs]

schematic_goal vmdk_read_cid_isra_2_0_3_0x8d90_0x8da1_11[blocks]:
  assumes \<open>(P_0x8d90_11 && P_0x8d90_11_regions) \<sigma>\<close>
  shows \<open>exec_block 3 0x8da1 11 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x8da3_11 ?\<sigma> \<and> block_usage P_0x8d90_11_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x8d90_11_def P_0x8d90_11_regions_def post: Q_0x8da3_11_def regionset: P_0x8d90_11_regions_set_def)

definition P_0x8da3_true_12 :: state_pred where
  \<open>P_0x8da3_true_12 \<sigma> \<equiv> RIP \<sigma> = 0x8da3 \<and> RAX \<sigma> = ucast ((\<langle>31,0\<rangle>RDX \<sigma>::32 word)) \<and> RCX \<sigma> = 0x0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x2838) \<and> RBP \<sigma> = ((RSP\<^sub>0::64 word) - 0x2828) \<and> R12 \<sigma> = ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) = (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word)\<close>
declare P_0x8da3_true_12_def[Ps]

definition P_0x8da3_true_12_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x8da3_true_12_regions_set \<sigma> \<equiv> {
    (0, RDI\<^sub>0, 8),
    (1, RSP\<^sub>0, 8),
    (2, ((FS\<^sub>0::64 word) + 0x28), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x20), 8)
  }\<close>

definition P_0x8da3_true_12_regions :: state_pred where
  \<open>P_0x8da3_true_12_regions \<sigma> \<equiv> \<exists>regions. P_0x8da3_true_12_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x8db1_12 :: state_pred where
  \<open>Q_0x8db1_12 \<sigma> \<equiv> RIP \<sigma> = 0x8db1 \<and> RAX \<sigma> = ucast ((\<langle>31,0\<rangle>RDX \<sigma>::32 word)) \<and> RCX \<sigma> = 0x0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x2838) \<and> RBP \<sigma> = ((RSP\<^sub>0::64 word) - 0x2828) \<and> R12 \<sigma> = ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) = (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word)\<close>
declare Q_0x8db1_12_def[Qs]

schematic_goal vmdk_read_cid_isra_2_0_1_0x8da3_0x8da3_12[blocks]:
  assumes \<open>(P_0x8da3_true_12 && P_0x8da3_true_12_regions && !ZF) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x8da3 12 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x8db1_12 ?\<sigma> \<and> block_usage P_0x8da3_true_12_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x8da3_true_12_def P_0x8da3_true_12_regions_def post: Q_0x8db1_12_def regionset: P_0x8da3_true_12_regions_set_def)

definition P_0x8db1_13 :: state_pred where
  \<open>P_0x8db1_13 \<sigma> \<equiv> RIP \<sigma> = 0x8db1 \<and> RAX \<sigma> = ucast ((\<langle>31,0\<rangle>RDX \<sigma>::32 word)) \<and> RCX \<sigma> = 0x0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x2838) \<and> RBP \<sigma> = ((RSP\<^sub>0::64 word) - 0x2828) \<and> R12 \<sigma> = ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) = (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word)\<close>
declare P_0x8db1_13_def[Ps]

definition P_0x8db1_13_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x8db1_13_regions_set \<sigma> \<equiv> {
    (0, RDI\<^sub>0, 8),
    (1, RSP\<^sub>0, 8),
    (2, ((FS\<^sub>0::64 word) + 0x28), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x2840), 8)
  }\<close>

definition P_0x8db1_13_regions :: state_pred where
  \<open>P_0x8db1_13_regions \<sigma> \<equiv> \<exists>regions. P_0x8db1_13_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_stack_chk_fail_addr_0x8db1_13 :: state_pred where
  \<open>Q_stack_chk_fail_addr_0x8db1_13 \<sigma> \<equiv> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x2840) \<and> RIP \<sigma> = stack_chk_fail_addr \<and> RAX \<sigma> = ucast ((\<langle>31,0\<rangle>RDX \<sigma>::32 word)) \<and> RCX \<sigma> = 0x0 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) = (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word)\<close>
declare Q_stack_chk_fail_addr_0x8db1_13_def[Qs]

schematic_goal vmdk_read_cid_isra_2_0_1_0x8db1_0x8db1_13[blocks]:
  assumes \<open>(P_0x8db1_13 && P_0x8db1_13_regions) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x8db1 13 \<sigma> \<triangleq> ?\<sigma> \<and> Q_stack_chk_fail_addr_0x8db1_13 ?\<sigma> \<and> block_usage P_0x8db1_13_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x8db1_13_def P_0x8db1_13_regions_def post: Q_stack_chk_fail_addr_0x8db1_13_def regionset: P_0x8db1_13_regions_set_def)

definition P_0x8da3_false_14 :: state_pred where
  \<open>P_0x8da3_false_14 \<sigma> \<equiv> RIP \<sigma> = 0x8da3 \<and> RAX \<sigma> = ucast ((\<langle>31,0\<rangle>RDX \<sigma>::32 word)) \<and> RCX \<sigma> = 0x0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x2838) \<and> RBP \<sigma> = ((RSP\<^sub>0::64 word) - 0x2828) \<and> R12 \<sigma> = ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) = (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word)\<close>
declare P_0x8da3_false_14_def[Ps]

definition P_0x8da3_false_14_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x8da3_false_14_regions_set \<sigma> \<equiv> {
    (0, RDI\<^sub>0, 8),
    (1, RSP\<^sub>0, 8),
    (2, ((FS\<^sub>0::64 word) + 0x28), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x20), 8)
  }\<close>

definition P_0x8da3_false_14_regions :: state_pred where
  \<open>P_0x8da3_false_14_regions \<sigma> \<equiv> \<exists>regions. P_0x8da3_false_14_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_ret_address_14 :: state_pred where
  \<open>Q_ret_address_14 \<sigma> \<equiv> RIP \<sigma> = ret_address \<and> RCX \<sigma> = 0x0 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) = (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word)\<close>
declare Q_ret_address_14_def[Qs]

schematic_goal vmdk_read_cid_isra_2_0_6_0x8da3_0x8db0_14[blocks]:
  assumes \<open>(P_0x8da3_false_14 && P_0x8da3_false_14_regions && ! !ZF) \<sigma>\<close>
  shows \<open>exec_block 6 0x8db0 14 \<sigma> \<triangleq> ?\<sigma> \<and> Q_ret_address_14 ?\<sigma> \<and> block_usage P_0x8da3_false_14_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x8da3_false_14_def P_0x8da3_false_14_regions_def post: Q_ret_address_14_def regionset: P_0x8da3_false_14_regions_set_def)

definition vmdk_read_cid_isra_2_acode :: ACode where
  \<open>vmdk_read_cid_isra_2_acode =
    Block 13 0x8d33 0;
    Block (Suc 0) 0x8d36 (Suc 0);
    CALL bdrv_pread_acode;
    Block 2 0x8d3d 2;
    IF !ZF THEN
      Block (Suc 0) 0x8d42 3
    ELSE
      Block 10 0x8d67 4;
      Block (Suc 0) 0x8d6b 5;
      CALL strstr_acode;
      Block (Suc 0) 0x8d70 6;
      IF ZF THEN
        Block (Suc 0) 0x8d73 7
      ELSE
        Block 5 0x8d80 8;
        Block (Suc 0) 0x8d87 9;
        CALL sscanf_acode
      FI;
      Block (Suc 0) 0x8d8c 10
    FI;
    Block 3 0x8da1 11;
    IF !ZF THEN
      Block (Suc 0) 0x8da3 12;
      Block (Suc 0) 0x8db1 13;
      CALL stack_chk_fail_acode
    ELSE
      Block 6 0x8db0 14
    FI
  \<close>

schematic_goal "vmdk_read_cid_isra_2":
  assumes
    \<open>\<forall>\<sigma>. RIP \<sigma> = 0x8d36 \<longrightarrow> P_0x8d36_1_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x8d3b \<longrightarrow> P_0x8d3b_2_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x8d42 \<longrightarrow> P_0x8d42_true_3_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x8d42 \<longrightarrow> P_0x8d42_false_4_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x8d6b \<longrightarrow> P_0x8d6b_5_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x8d70 \<longrightarrow> P_0x8d70_6_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x8d73 \<longrightarrow> P_0x8d73_true_7_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x8d73 \<longrightarrow> P_0x8d73_false_8_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x8d87 \<longrightarrow> P_0x8d87_9_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x8d8c \<longrightarrow> P_0x8d8c_10_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x8d90 \<longrightarrow> P_0x8d90_11_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x8da3 \<longrightarrow> P_0x8da3_true_12_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x8db1 \<longrightarrow> P_0x8db1_13_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x8da3 \<longrightarrow> P_0x8da3_false_14_regions \<sigma>\<close>
    and [blocks]: \<open>{{Q_bdrv_pread_addr_0x8d36_1}} \<box>bdrv_pread_acode {{P_0x8d3b_2;M_0x8d36}}\<close>
    and [blocks]: \<open>{{Q_strstr_addr_0x8d6b_5}} \<box>strstr_acode {{P_0x8d70_6;M_0x8d6b}}\<close>
    and [blocks]: \<open>{{Q_sscanf_addr_0x8d87_9}} \<box>sscanf_acode {{P_0x8d8c_10;M_0x8d87}}\<close>
    and [blocks]: \<open>{{Q_stack_chk_fail_addr_0x8db1_13}} \<box>stack_chk_fail_acode {{Q_fail;M_0x8db1}}\<close>
  shows \<open>{{?P}} vmdk_read_cid_isra_2_acode {{?Q;?M}}\<close>
  by (vcg acode: vmdk_read_cid_isra_2_acode_def assms: assms)

end
