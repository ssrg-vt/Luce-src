theory qcow_is_allocated
  imports
    "../../../isabelle/VCG/HTriple"
begin

locale "qemu_img_xen" = execution_context + exec_code +
  fixes get_cluster_offset_isra_1_0x7197_retval\<^sub>v get_cluster_offset_0x133bd_retval\<^sub>v get_cluster_offset_addr get_cluster_offset_isra_1_addr :: \<open>64 word\<close>
    and get_cluster_offset_acode get_cluster_offset_isra_1_acode :: ACode
  assumes fetch:
    "fetch 0x7170 \<equiv> (Unary (IS_8088 Push) (Storage (Reg (General SixtyFour r13))), 2)"
    "fetch 0x7172 \<equiv> (Binary (IS_8088 Xor) (Reg (General ThirtyTwo r9)) (Storage (Reg (General ThirtyTwo r9))), 3)"
    "fetch 0x7175 \<equiv> (Binary (IS_8088 Xor) (Reg (General ThirtyTwo r8)) (Storage (Reg (General ThirtyTwo r8))), 3)"
    "fetch 0x7178 \<equiv> (Unary (IS_8088 Push) (Storage (Reg (General SixtyFour r12))), 2)"
    "fetch 0x717a \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour r12)) (Storage (Reg (General SixtyFour rcx))), 3)"
    "fetch 0x717d \<equiv> (Binary (IS_8088 Xor) (Reg (General ThirtyTwo rcx)) (Storage (Reg (General ThirtyTwo rcx))), 2)"
    "fetch 0x717f \<equiv> (Unary (IS_8088 Push) (Storage (Reg (General SixtyFour rbp))), 1)"
    "fetch 0x7180 \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour rbp)) (Storage (Reg (General SixtyFour rsi))), 3)"
    "fetch 0x7183 \<equiv> (Binary (IS_8088 Shl) (Reg (General SixtyFour rsi)) (Immediate SixtyFour (ImmVal 9)), 4)"
    "fetch 0x7187 \<equiv> (Unary (IS_8088 Push) (Storage (Reg (General SixtyFour rbx))), 1)"
    "fetch 0x7188 \<equiv> (Binary (IS_8088 Mov) (Reg (General ThirtyTwo rbx)) (Storage (Reg (General ThirtyTwo rdx))), 2)"
    "fetch 0x718a \<equiv> (Binary (IS_8088 Xor) (Reg (General ThirtyTwo rdx)) (Storage (Reg (General ThirtyTwo rdx))), 2)"
    "fetch 0x718c \<equiv> (Binary (IS_8088 Sub) (Reg (General SixtyFour rsp)) (Immediate SixtyFour (ImmVal 8)), 4)"
    "fetch 0x7190 \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour r13)) (Storage (Memory SixtyFour (A_SizeDirective 64 (A_Plus (A_FromReg (General SixtyFour rdi)) (A_WordConstant 64))))), 4)"
    "fetch 0x7194 \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour rdi)) (Storage (Reg (General SixtyFour r13))), 3)"
    "fetch 0x7197 \<equiv> (Unary (IS_8088 Call) (Immediate SixtyFour (ImmLabel ''get_cluster_offset.isra.1'')), 5)"
    "fetch 0x719c \<equiv> (Binary (IS_8088 Mov) (Reg (General ThirtyTwo rdx)) (Storage (Memory ThirtyTwo (A_SizeDirective 32 (A_Plus (A_FromReg (General SixtyFour r13)) (A_WordConstant 16))))), 4)"
    "fetch 0x71a0 \<equiv> (Binary (IS_8088 Lea) (Reg (General ThirtyTwo rsi)) (Storage (Memory SixtyFour (A_Minus (A_FromReg (General SixtyFour rdx)) (A_WordConstant 1)))), 3)"
    "fetch 0x71a3 \<equiv> (Binary (IS_8088 And) (Reg (General ThirtyTwo rsi)) (Storage (Reg (General ThirtyTwo rbp))), 2)"
    "fetch 0x71a5 \<equiv> (Binary (IS_8088 Sub) (Reg (General ThirtyTwo rdx)) (Storage (Reg (General ThirtyTwo rsi))), 2)"
    "fetch 0x71a7 \<equiv> (Binary (IS_8088 Cmp) (Reg (General ThirtyTwo rdx)) (Storage (Reg (General ThirtyTwo rbx))), 2)"
    "fetch 0x71a9 \<equiv> (Binary (IS_PentiumPro Cmovg) (Reg (General ThirtyTwo rdx)) (Storage (Reg (General ThirtyTwo rbx))), 3)"
    "fetch 0x71ac \<equiv> (Binary (IS_8088 Test) (Reg (General SixtyFour rax)) (Storage (Reg (General SixtyFour rax))), 3)"
    "fetch 0x71af \<equiv> (Unary (IS_80386 Setne) (Storage (Reg (General Eight rax))), 3)"
    "fetch 0x71b2 \<equiv> (Binary (IS_8088 Mov) (Memory ThirtyTwo (A_SizeDirective 32 (A_FromReg (General SixtyFour r12)))) (Storage (Reg (General ThirtyTwo rdx))), 4)"
    "fetch 0x71b6 \<equiv> (Binary (IS_8088 Add) (Reg (General SixtyFour rsp)) (Immediate SixtyFour (ImmVal 8)), 4)"
    "fetch 0x71ba \<equiv> (Binary (IS_80386 Movzx) (Reg (General ThirtyTwo rax)) (Storage (Reg (General Eight rax))), 3)"
    "fetch 0x71bd \<equiv> (Unary (IS_8088 Pop) (Storage (Reg (General SixtyFour rbx))), 1)"
    "fetch 0x71be \<equiv> (Unary (IS_8088 Pop) (Storage (Reg (General SixtyFour rbp))), 1)"
    "fetch 0x71bf \<equiv> (Unary (IS_8088 Pop) (Storage (Reg (General SixtyFour r12))), 2)"
    "fetch 0x71c1 \<equiv> (Unary (IS_8088 Pop) (Storage (Reg (General SixtyFour r13))), 2)"
    "fetch 0x71c3 \<equiv> (Nullary (IS_8088 Ret), 1)"
    "fetch 0x71c4 \<equiv> (Unary (IS_8088 Nop) (Storage (Memory Sixteen (A_SizeDirective 16 (A_Plus (A_FromReg (General SixtyFour cs)) (A_Plus (A_FromReg (General SixtyFour rax)) (A_Plus (A_Mult 1 (A_FromReg (General SixtyFour rax))) (A_WordConstant 0))))))), 11)"
    "fetch 0x133b0 \<equiv> (Binary (IS_8088 Sub) (Reg (General SixtyFour rsp)) (Immediate SixtyFour (ImmVal 8)), 4)"
    "fetch 0x133b4 \<equiv> (Binary (IS_8088 Mov) (Memory ThirtyTwo (A_SizeDirective 32 (A_FromReg (General SixtyFour rcx)))) (Storage (Reg (General ThirtyTwo rdx))), 2)"
    "fetch 0x133b6 \<equiv> (Binary (IS_8088 Shl) (Reg (General SixtyFour rsi)) (Immediate SixtyFour (ImmVal 9)), 4)"
    "fetch 0x133ba \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour rdx)) (Storage (Reg (General SixtyFour rcx))), 3)"
    "fetch 0x133bd \<equiv> (Unary (IS_8088 Call) (Immediate SixtyFour (ImmLabel ''get_cluster_offset'')), 5)"
    "fetch 0x133c2 \<equiv> (Binary (IS_8088 Test) (Reg (General SixtyFour rax)) (Storage (Reg (General SixtyFour rax))), 3)"
    "fetch 0x133c5 \<equiv> (Unary (IS_80386 Setne) (Storage (Reg (General Eight rax))), 3)"
    "fetch 0x133c8 \<equiv> (Binary (IS_8088 Add) (Reg (General SixtyFour rsp)) (Immediate SixtyFour (ImmVal 8)), 4)"
    "fetch 0x133cc \<equiv> (Binary (IS_80386 Movzx) (Reg (General ThirtyTwo rax)) (Storage (Reg (General Eight rax))), 3)"
    "fetch 0x133cf \<equiv> (Nullary (IS_8088 Ret), 1)"
    and \<alpha>_def: \<open>\<alpha> = \<lparr>text_sections = [], data_sections = [], labels_to_offsets = [], binary_offset = 0\<rparr>\<close>
    and get_cluster_offset\<^sub>a\<^sub>d\<^sub>d\<^sub>r[simp]: \<open>the (label_to_address \<alpha> ''get_cluster_offset'') = get_cluster_offset_addr\<close>
    and get_cluster_offset_isra_1\<^sub>a\<^sub>d\<^sub>d\<^sub>r[simp]: \<open>the (label_to_address \<alpha> ''get_cluster_offset.isra.1'') = get_cluster_offset_isra_1_addr\<close>
begin

text \<open>Using definitions that don't get unfolded immediately prevents locale argument issues.\<close>
definition \<open>get_cluster_offset_isra_1_0x7197_retval \<equiv> get_cluster_offset_isra_1_0x7197_retval\<^sub>v\<close>
definition \<open>get_cluster_offset_0x133bd_retval \<equiv> get_cluster_offset_0x133bd_retval\<^sub>v\<close>

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

locale "qcow_is_allocated_1" = "qemu_img_xen" +
  fixes RAX\<^sub>0\<^sub>v RBX\<^sub>0\<^sub>v RCX\<^sub>0\<^sub>v RDX\<^sub>0\<^sub>v RDI\<^sub>0\<^sub>v RSI\<^sub>0\<^sub>v RSP\<^sub>0\<^sub>v RBP\<^sub>0\<^sub>v R13\<^sub>0\<^sub>v R12\<^sub>0\<^sub>v R9\<^sub>0\<^sub>v R8\<^sub>0\<^sub>v ret_address\<^sub>v :: \<open>64 word\<close>
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
definition \<open>R13\<^sub>0 \<equiv> R13\<^sub>0\<^sub>v\<close>
definition \<open>R12\<^sub>0 \<equiv> R12\<^sub>0\<^sub>v\<close>
definition \<open>R9\<^sub>0 \<equiv> R9\<^sub>0\<^sub>v\<close>
definition \<open>R8\<^sub>0 \<equiv> R8\<^sub>0\<^sub>v\<close>
definition \<open>ret_address \<equiv> ret_address\<^sub>v\<close>

definition P_0x7170_0 :: state_pred where
  \<open>P_0x7170_0 \<sigma> \<equiv> RIP \<sigma> = 0x7170 \<and> RAX \<sigma> = RAX\<^sub>0 \<and> RBX \<sigma> = RBX\<^sub>0 \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = RDX\<^sub>0 \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = RSP\<^sub>0 \<and> RBP \<sigma> = RBP\<^sub>0 \<and> R13 \<sigma> = R13\<^sub>0 \<and> R12 \<sigma> = R12\<^sub>0 \<and> R9 \<sigma> = R9\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address\<close>
declare P_0x7170_0_def[Ps]

definition P_0x7170_0_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x7170_0_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((RDI\<^sub>0::64 word) + 0x40), 8),
    (2, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x20), 8)
  }\<close>

definition P_0x7170_0_regions :: state_pred where
  \<open>P_0x7170_0_regions \<sigma> \<equiv> \<exists>regions. P_0x7170_0_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x7197_0 :: state_pred where
  \<open>Q_0x7197_0 \<sigma> \<equiv> RIP \<sigma> = 0x7197 \<and> RAX \<sigma> = RAX\<^sub>0 \<and> RBX \<sigma> = ucast ((\<langle>31,0\<rangle>RDX\<^sub>0::32 word)) \<and> RCX \<sigma> = 0x0 \<and> RDX \<sigma> = 0x0 \<and> RDI \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> RSI \<sigma> = (RSI\<^sub>0 << 9) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x28) \<and> RBP \<sigma> = RSI\<^sub>0 \<and> R13 \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> R12 \<sigma> = RCX\<^sub>0 \<and> R9 \<sigma> = 0x0 \<and> R8 \<sigma> = 0x0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBX\<^sub>0\<close>
declare Q_0x7197_0_def[Qs]

schematic_goal qcow_is_allocated_1_0_15_0x7170_0x7194_0[blocks]:
  assumes \<open>(P_0x7170_0 && P_0x7170_0_regions) \<sigma>\<close>
  shows \<open>exec_block 15 0x7194 0 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x7197_0 ?\<sigma> \<and> block_usage P_0x7170_0_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x7170_0_def P_0x7170_0_regions_def post: Q_0x7197_0_def regionset: P_0x7170_0_regions_set_def)

definition P_0x7197_1 :: state_pred where
  \<open>P_0x7197_1 \<sigma> \<equiv> RIP \<sigma> = 0x7197 \<and> RAX \<sigma> = RAX\<^sub>0 \<and> RBX \<sigma> = ucast ((\<langle>31,0\<rangle>RDX\<^sub>0::32 word)) \<and> RCX \<sigma> = 0x0 \<and> RDX \<sigma> = 0x0 \<and> RDI \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> RSI \<sigma> = (RSI\<^sub>0 << 9) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x28) \<and> RBP \<sigma> = RSI\<^sub>0 \<and> R13 \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> R12 \<sigma> = RCX\<^sub>0 \<and> R9 \<sigma> = 0x0 \<and> R8 \<sigma> = 0x0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBX\<^sub>0\<close>
declare P_0x7197_1_def[Ps]

definition P_0x7197_1_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x7197_1_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((RDI\<^sub>0::64 word) + 0x40), 8),
    (2, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x30), 8)
  }\<close>

definition P_0x7197_1_regions :: state_pred where
  \<open>P_0x7197_1_regions \<sigma> \<equiv> \<exists>regions. P_0x7197_1_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_get_cluster_offset_isra_1_addr_0x7197_1 :: state_pred where
  \<open>Q_get_cluster_offset_isra_1_addr_0x7197_1 \<sigma> \<equiv> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x30) \<and> RIP \<sigma> = get_cluster_offset_isra_1_addr \<and> RAX \<sigma> = RAX\<^sub>0 \<and> RBX \<sigma> = ucast ((\<langle>31,0\<rangle>RDX\<^sub>0::32 word)) \<and> RCX \<sigma> = 0x0 \<and> RDX \<sigma> = 0x0 \<and> RDI \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> RSI \<sigma> = (RSI\<^sub>0 << 9) \<and> RBP \<sigma> = RSI\<^sub>0 \<and> R13 \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> R12 \<sigma> = RCX\<^sub>0 \<and> R9 \<sigma> = 0x0 \<and> R8 \<sigma> = 0x0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = 0x719c\<close>
declare Q_get_cluster_offset_isra_1_addr_0x7197_1_def[Qs]

schematic_goal qcow_is_allocated_1_0_1_0x7197_0x7197_1[blocks]:
  assumes \<open>(P_0x7197_1 && P_0x7197_1_regions) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x7197 (Suc 0) \<sigma> \<triangleq> ?\<sigma> \<and> Q_get_cluster_offset_isra_1_addr_0x7197_1 ?\<sigma> \<and> block_usage P_0x7197_1_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x7197_1_def P_0x7197_1_regions_def post: Q_get_cluster_offset_isra_1_addr_0x7197_1_def regionset: P_0x7197_1_regions_set_def)

definition P_0x719c_2 :: state_pred where
  \<open>P_0x719c_2 \<sigma> \<equiv> RIP \<sigma> = 0x719c \<and> RAX \<sigma> = get_cluster_offset_isra_1_0x7197_retval \<and> RBX \<sigma> = ucast ((\<langle>31,0\<rangle>RDX\<^sub>0::32 word)) \<and> RCX \<sigma> = 0x0 \<and> RDX \<sigma> = 0x0 \<and> RDI \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> RSI \<sigma> = (RSI\<^sub>0 << 9) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x28) \<and> RBP \<sigma> = RSI\<^sub>0 \<and> R13 \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> R12 \<sigma> = RCX\<^sub>0 \<and> R9 \<sigma> = 0x0 \<and> R8 \<sigma> = 0x0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = 0x719c\<close>
declare P_0x719c_2_def[Ps]

definition P_0x719c_2_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x719c_2_regions_set \<sigma> \<equiv> {
    (0, RCX\<^sub>0, 4),
    (1, RSP\<^sub>0, 8),
    (2, ((RDI\<^sub>0::64 word) + 0x40), 8),
    (3, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x10), 4),
    (4, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x30), 8)
  }\<close>

definition P_0x719c_2_regions :: state_pred where
  \<open>P_0x719c_2_regions \<sigma> \<equiv> \<exists>regions. P_0x719c_2_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_ret_address_2 :: state_pred where
  \<open>Q_ret_address_2 \<sigma> \<equiv> RIP \<sigma> = ret_address 
\<and> RAX \<sigma> = ucast ((if' (get_cluster_offset_isra_1_0x7197_retval::64 word) \<noteq> (ucast ((0x0::64 word))::64 word) then 0x1 else (0x0::8 word))) 
\<and> RBX \<sigma> = RBX\<^sub>0 \<and> RCX \<sigma> = 0x0 
\<and> RDI \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> RSI \<sigma> = ucast ((((\<langle>31,0\<rangle>(((\<langle>63,0\<rangle>(\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x10),4]::32 word)::64 word)::64 word) - 0x1)::32 word)::32 word) AND (\<langle>31,0\<rangle>RSI\<^sub>0))) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) + 0x8) \<and> RBP \<sigma> = RBP\<^sub>0 \<and> R13 \<sigma> = R13\<^sub>0 \<and> R12 \<sigma> = R12\<^sub>0 \<and> R9 \<sigma> = 0x0 \<and> R8 \<sigma> = 0x0 
\<and> (\<sigma> \<turnstile> *[RCX\<^sub>0,4]::32 word) = ucast ((if' ((((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x10),4]::32 word)::32 word) - (((\<langle>31,0\<rangle>(((\<langle>63,0\<rangle>(\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x10),4]::32 word)::64 word)::64 word) - 0x1)::32 word)::32 word) AND (\<langle>31,0\<rangle>RSI\<^sub>0)))::32 word) >s (\<langle>31,0\<rangle>RDX\<^sub>0::32 word) then (\<langle>31,0\<rangle>RDX\<^sub>0::32 word) else ((((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x10),4]::32 word)::32 word) - (((\<langle>31,0\<rangle>(((\<langle>63,0\<rangle>(\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x10),4]::32 word)::64 word)::64 word) - 0x1)::32 word)::32 word) AND (\<langle>31,0\<rangle>RSI\<^sub>0)))::32 word)))
 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x10),4]::32 word) = ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x10),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = 0x719c\<close>
declare Q_ret_address_2_def[Qs]

schematic_goal qcow_is_allocated_1_0_16_0x719c_0x71c3_2[blocks]:
  assumes \<open>(P_0x719c_2 && P_0x719c_2_regions) \<sigma>\<close>
  shows \<open>exec_block 16 0x71c3 2 \<sigma> \<triangleq> ?\<sigma> \<and> Q_ret_address_2 ?\<sigma> \<and> block_usage P_0x719c_2_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x719c_2_def P_0x719c_2_regions_def post: Q_ret_address_2_def regionset: P_0x719c_2_regions_set_def)

definition qcow_is_allocated_1_acode :: ACode where
  \<open>qcow_is_allocated_1_acode =
    Block 15 0x7194 0;
    Block (Suc 0) 0x7197 (Suc 0);
    CALL get_cluster_offset_isra_1_acode;
    Block 16 0x71c3 2
  \<close>

schematic_goal "qcow_is_allocated_1":
  assumes
    \<open>\<forall>\<sigma>. RIP \<sigma> = 0x7197 \<longrightarrow> P_0x7197_1_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x719c \<longrightarrow> P_0x719c_2_regions \<sigma>\<close>
    and [blocks]: \<open>{{Q_get_cluster_offset_isra_1_addr_0x7197_1}} \<box>get_cluster_offset_isra_1_acode {{P_0x719c_2;M_0x7197}}\<close>
  shows \<open>{{?P}} qcow_is_allocated_1_acode {{?Q;?M}}\<close>
  by (vcg acode: qcow_is_allocated_1_acode_def assms: assms)

end

locale "qcow_is_allocated" = "qemu_img_xen" +
  fixes RAX\<^sub>0\<^sub>v RCX\<^sub>0\<^sub>v RDX\<^sub>0\<^sub>v RSI\<^sub>0\<^sub>v RSP\<^sub>0\<^sub>v ret_address\<^sub>v :: \<open>64 word\<close>
begin

text \<open>Using definitions that don't get unfolded immediately prevents locale argument issues.\<close>
definition \<open>RAX\<^sub>0 \<equiv> RAX\<^sub>0\<^sub>v\<close>
definition \<open>RCX\<^sub>0 \<equiv> RCX\<^sub>0\<^sub>v\<close>
definition \<open>RDX\<^sub>0 \<equiv> RDX\<^sub>0\<^sub>v\<close>
definition \<open>RSI\<^sub>0 \<equiv> RSI\<^sub>0\<^sub>v\<close>
definition \<open>RSP\<^sub>0 \<equiv> RSP\<^sub>0\<^sub>v\<close>
definition \<open>ret_address \<equiv> ret_address\<^sub>v\<close>

definition P_0x133b0_0 :: state_pred where
  \<open>P_0x133b0_0 \<sigma> \<equiv> RIP \<sigma> = 0x133b0 \<and> RAX \<sigma> = RAX\<^sub>0 \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = RDX\<^sub>0 \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = RSP\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address\<close>
declare P_0x133b0_0_def[Ps]

definition P_0x133b0_0_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x133b0_0_regions_set \<sigma> \<equiv> {
    (0, RCX\<^sub>0, 4),
    (1, RSP\<^sub>0, 8)
  }\<close>

definition P_0x133b0_0_regions :: state_pred where
  \<open>P_0x133b0_0_regions \<sigma> \<equiv> \<exists>regions. P_0x133b0_0_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x133bd_0 :: state_pred where
  \<open>Q_0x133bd_0 \<sigma> \<equiv> RIP \<sigma> = 0x133bd \<and> RAX \<sigma> = RAX\<^sub>0 \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = RCX\<^sub>0 \<and> RSI \<sigma> = (RSI\<^sub>0 << 9) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x8) \<and> (\<sigma> \<turnstile> *[RCX\<^sub>0,4]::32 word) = ucast ((\<langle>31,0\<rangle>RDX\<^sub>0::32 word)) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address\<close>
declare Q_0x133bd_0_def[Qs]

schematic_goal qcow_is_allocated_0_4_0x133b0_0x133ba_0[blocks]:
  assumes \<open>(P_0x133b0_0 && P_0x133b0_0_regions) \<sigma>\<close>
  shows \<open>exec_block 4 0x133ba 0 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x133bd_0 ?\<sigma> \<and> block_usage P_0x133b0_0_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x133b0_0_def P_0x133b0_0_regions_def post: Q_0x133bd_0_def regionset: P_0x133b0_0_regions_set_def)

definition P_0x133bd_1 :: state_pred where
  \<open>P_0x133bd_1 \<sigma> \<equiv> RIP \<sigma> = 0x133bd \<and> RAX \<sigma> = RAX\<^sub>0 \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = RCX\<^sub>0 \<and> RSI \<sigma> = (RSI\<^sub>0 << 9) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x8) \<and> (\<sigma> \<turnstile> *[RCX\<^sub>0,4]::32 word) = ucast ((\<langle>31,0\<rangle>RDX\<^sub>0::32 word)) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address\<close>
declare P_0x133bd_1_def[Ps]

definition P_0x133bd_1_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x133bd_1_regions_set \<sigma> \<equiv> {
    (0, RCX\<^sub>0, 4),
    (1, RSP\<^sub>0, 8),
    (2, ((RSP\<^sub>0::64 word) - 0x10), 8)
  }\<close>

definition P_0x133bd_1_regions :: state_pred where
  \<open>P_0x133bd_1_regions \<sigma> \<equiv> \<exists>regions. P_0x133bd_1_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_get_cluster_offset_addr_0x133bd_1 :: state_pred where
  \<open>Q_get_cluster_offset_addr_0x133bd_1 \<sigma> \<equiv> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x10) \<and> RIP \<sigma> = get_cluster_offset_addr \<and> RAX \<sigma> = RAX\<^sub>0 \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = RCX\<^sub>0 \<and> RSI \<sigma> = (RSI\<^sub>0 << 9) \<and> (\<sigma> \<turnstile> *[RCX\<^sub>0,4]::32 word) = ucast ((\<langle>31,0\<rangle>RDX\<^sub>0::32 word)) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = 0x133c2\<close>
declare Q_get_cluster_offset_addr_0x133bd_1_def[Qs]

schematic_goal qcow_is_allocated_0_1_0x133bd_0x133bd_1[blocks]:
  assumes \<open>(P_0x133bd_1 && P_0x133bd_1_regions) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x133bd (Suc 0) \<sigma> \<triangleq> ?\<sigma> \<and> Q_get_cluster_offset_addr_0x133bd_1 ?\<sigma> \<and> block_usage P_0x133bd_1_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x133bd_1_def P_0x133bd_1_regions_def post: Q_get_cluster_offset_addr_0x133bd_1_def regionset: P_0x133bd_1_regions_set_def)

definition P_0x133c2_2 :: state_pred where
  \<open>P_0x133c2_2 \<sigma> \<equiv> RIP \<sigma> = 0x133c2 \<and> RAX \<sigma> = get_cluster_offset_0x133bd_retval \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = RCX\<^sub>0 \<and> RSI \<sigma> = (RSI\<^sub>0 << 9) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x8) \<and> (\<sigma> \<turnstile> *[RCX\<^sub>0,4]::32 word) = ucast ((\<langle>31,0\<rangle>RDX\<^sub>0::32 word)) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = 0x133c2\<close>
declare P_0x133c2_2_def[Ps]

definition P_0x133c2_2_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x133c2_2_regions_set \<sigma> \<equiv> {
    (0, RCX\<^sub>0, 4),
    (1, RSP\<^sub>0, 8),
    (2, ((RSP\<^sub>0::64 word) - 0x10), 8)
  }\<close>

definition P_0x133c2_2_regions :: state_pred where
  \<open>P_0x133c2_2_regions \<sigma> \<equiv> \<exists>regions. P_0x133c2_2_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_ret_address_2 :: state_pred where
  \<open>Q_ret_address_2 \<sigma> \<equiv> RIP \<sigma> = ret_address \<and> RAX \<sigma> = ucast ((if' (get_cluster_offset_0x133bd_retval::64 word) \<noteq> (ucast ((0x0::64 word))::64 word) then 0x1 else (0x0::8 word))) \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = RCX\<^sub>0 \<and> RSI \<sigma> = (RSI\<^sub>0 << 9) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) + 0x8) \<and> (\<sigma> \<turnstile> *[RCX\<^sub>0,4]::32 word) = ucast ((\<langle>31,0\<rangle>RDX\<^sub>0::32 word)) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = 0x133c2\<close>
declare Q_ret_address_2_def[Qs]

schematic_goal qcow_is_allocated_0_5_0x133c2_0x133cf_2[blocks]:
  assumes \<open>(P_0x133c2_2 && P_0x133c2_2_regions) \<sigma>\<close>
  shows \<open>exec_block 5 0x133cf 2 \<sigma> \<triangleq> ?\<sigma> \<and> Q_ret_address_2 ?\<sigma> \<and> block_usage P_0x133c2_2_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x133c2_2_def P_0x133c2_2_regions_def post: Q_ret_address_2_def regionset: P_0x133c2_2_regions_set_def)

definition qcow_is_allocated_acode :: ACode where
  \<open>qcow_is_allocated_acode =
    Block 4 0x133ba 0;
    Block (Suc 0) 0x133bd (Suc 0);
    CALL get_cluster_offset_acode;
    Block 5 0x133cf 2
  \<close>

schematic_goal "qcow_is_allocated":
  assumes
    \<open>\<forall>\<sigma>. RIP \<sigma> = 0x133bd \<longrightarrow> P_0x133bd_1_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x133c2 \<longrightarrow> P_0x133c2_2_regions \<sigma>\<close>
    and [blocks]: \<open>{{Q_get_cluster_offset_addr_0x133bd_1}} \<box>get_cluster_offset_acode {{P_0x133c2_2;M_0x133bd}}\<close>
  shows \<open>{{?P}} qcow_is_allocated_acode {{?Q;?M}}\<close>
  by (vcg acode: qcow_is_allocated_acode_def assms: assms)

end
