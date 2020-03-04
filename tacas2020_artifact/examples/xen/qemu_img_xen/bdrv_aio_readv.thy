theory bdrv_aio_readv
  imports
    "../../../isabelle/VCG/HTriple"
begin


locale "qemu_img_xen" = execution_context + exec_code +
  fixes bdrv_check_byte_request_0x1a3d9_retval\<^sub>v bdrv_aio_rw_vector_0x1a3fe_retval\<^sub>v bdrv_aio_rw_vector_addr bdrv_check_byte_request_addr :: \<open>64 word\<close>
    and bdrv_aio_rw_vector_acode bdrv_check_byte_request_acode :: ACode
  assumes fetch:
    "fetch 0x1a3a0 \<equiv> (Unary (IS_8088 Push) (Storage (Reg (General SixtyFour r15))), 2)"
    "fetch 0x1a3a2 \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour rax)) (Storage (Reg (General SixtyFour rsi))), 3)"
    "fetch 0x1a3a5 \<equiv> (Binary (IS_8088 Mov) (Reg (General ThirtyTwo r15)) (Storage (Reg (General ThirtyTwo rcx))), 3)"
    "fetch 0x1a3a8 \<equiv> (Unary (IS_8088 Push) (Storage (Reg (General SixtyFour r14))), 2)"
    "fetch 0x1a3aa \<equiv> (Unary (IS_8088 Neg) (Storage (Reg (General SixtyFour rax))), 3)"
    "fetch 0x1a3ad \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour r14)) (Storage (Reg (General SixtyFour rdi))), 3)"
    "fetch 0x1a3b0 \<equiv> (Unary (IS_8088 Push) (Storage (Reg (General SixtyFour r13))), 2)"
    "fetch 0x1a3b2 \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour r13)) (Storage (Reg (General SixtyFour r9))), 3)"
    "fetch 0x1a3b5 \<equiv> (Unary (IS_8088 Push) (Storage (Reg (General SixtyFour r12))), 2)"
    "fetch 0x1a3b7 \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour r12)) (Storage (Reg (General SixtyFour r8))), 3)"
    "fetch 0x1a3ba \<equiv> (Unary (IS_8088 Push) (Storage (Reg (General SixtyFour rbp))), 1)"
    "fetch 0x1a3bb \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour rbp)) (Storage (Reg (General SixtyFour rdx))), 3)"
    "fetch 0x1a3be \<equiv> (Binary (IS_8088 Mov) (Reg (General ThirtyTwo rdx)) (Storage (Reg (General ThirtyTwo rcx))), 2)"
    "fetch 0x1a3c0 \<equiv> (Unary (IS_8088 Push) (Storage (Reg (General SixtyFour rbx))), 1)"
    "fetch 0x1a3c1 \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour rbx)) (Storage (Reg (General SixtyFour rsi))), 3)"
    "fetch 0x1a3c4 \<equiv> (Binary (IS_8088 Shl) (Reg (General SixtyFour rsi)) (Immediate SixtyFour (ImmVal 9)), 4)"
    "fetch 0x1a3c8 \<equiv> (Binary (IS_8088 Sub) (Reg (General SixtyFour rsp)) (Immediate SixtyFour (ImmVal 8)), 4)"
    "fetch 0x1a3cc \<equiv> (Binary (IS_8088 Test) (Reg (General SixtyFour rbx)) (Storage (Reg (General SixtyFour rbx))), 3)"
    "fetch 0x1a3cf \<equiv> (Binary (IS_PentiumPro Cmovs) (Reg (General SixtyFour rsi)) (Storage (Reg (General SixtyFour rax))), 4)"
    "fetch 0x1a3d3 \<equiv> (Binary (IS_8088 Shl) (Reg (General ThirtyTwo rdx)) (Immediate SixtyFour (ImmVal 9)), 3)"
    "fetch 0x1a3d6 \<equiv> (Binary (IS_X86_64 Movsxd) (Reg (General SixtyFour rdx)) (Storage (Reg (General ThirtyTwo rdx))), 3)"
    "fetch 0x1a3d9 \<equiv> (Unary (IS_8088 Call) (Immediate SixtyFour (ImmLabel ''bdrv_check_byte_request'')), 5)"
    "fetch 0x1a3de \<equiv> (Binary (IS_8088 Mov) (Reg (General ThirtyTwo rdx)) (Storage (Reg (General ThirtyTwo rax))), 2)"
    "fetch 0x1a3e0 \<equiv> (Binary (IS_8088 Xor) (Reg (General ThirtyTwo rax)) (Storage (Reg (General ThirtyTwo rax))), 2)"
    "fetch 0x1a3e2 \<equiv> (Binary (IS_8088 Test) (Reg (General ThirtyTwo rdx)) (Storage (Reg (General ThirtyTwo rdx))), 2)"
    "fetch 0x1a3e4 \<equiv> (Unary (IS_8088 Jne) (Immediate SixtyFour (ImmVal 107525)), 2)"
    "fetch 0x1a3e6 \<equiv> (Binary (IS_8088 Sub) (Reg (General SixtyFour rsp)) (Immediate SixtyFour (ImmVal 8)), 4)"
    "fetch 0x1a3ea \<equiv> (Binary (IS_8088 Mov) (Reg (General ThirtyTwo rcx)) (Storage (Reg (General ThirtyTwo r15))), 3)"
    "fetch 0x1a3ed \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour rdx)) (Storage (Reg (General SixtyFour rbp))), 3)"
    "fetch 0x1a3f0 \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour r9)) (Storage (Reg (General SixtyFour r13))), 3)"
    "fetch 0x1a3f3 \<equiv> (Unary (IS_8088 Push) (Immediate SixtyFour (ImmVal 0)), 2)"
    "fetch 0x1a3f5 \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour r8)) (Storage (Reg (General SixtyFour r12))), 3)"
    "fetch 0x1a3f8 \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour rsi)) (Storage (Reg (General SixtyFour rbx))), 3)"
    "fetch 0x1a3fb \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour rdi)) (Storage (Reg (General SixtyFour r14))), 3)"
    "fetch 0x1a3fe \<equiv> (Unary (IS_8088 Call) (Immediate SixtyFour (ImmLabel ''bdrv_aio_rw_vector'')), 5)"
    "fetch 0x1a403 \<equiv> (Unary (IS_8088 Pop) (Storage (Reg (General SixtyFour rdx))), 1)"
    "fetch 0x1a404 \<equiv> (Unary (IS_8088 Pop) (Storage (Reg (General SixtyFour rcx))), 1)"
    "fetch 0x1a405 \<equiv> (Binary (IS_8088 Add) (Reg (General SixtyFour rsp)) (Immediate SixtyFour (ImmVal 8)), 4)"
    "fetch 0x1a409 \<equiv> (Unary (IS_8088 Pop) (Storage (Reg (General SixtyFour rbx))), 1)"
    "fetch 0x1a40a \<equiv> (Unary (IS_8088 Pop) (Storage (Reg (General SixtyFour rbp))), 1)"
    "fetch 0x1a40b \<equiv> (Unary (IS_8088 Pop) (Storage (Reg (General SixtyFour r12))), 2)"
    "fetch 0x1a40d \<equiv> (Unary (IS_8088 Pop) (Storage (Reg (General SixtyFour r13))), 2)"
    "fetch 0x1a40f \<equiv> (Unary (IS_8088 Pop) (Storage (Reg (General SixtyFour r14))), 2)"
    "fetch 0x1a411 \<equiv> (Unary (IS_8088 Pop) (Storage (Reg (General SixtyFour r15))), 2)"
    "fetch 0x1a413 \<equiv> (Nullary (IS_8088 Ret), 1)"
    "fetch 0x1a414 \<equiv> (Unary (IS_8088 Nop) (Storage (Memory Sixteen (A_SizeDirective 16 (A_Plus (A_FromReg (General SixtyFour cs)) (A_Plus (A_FromReg (General SixtyFour rax)) (A_Plus (A_Mult 1 (A_FromReg (General SixtyFour rax))) (A_WordConstant 0))))))), 11)"
    and \<alpha>_def: \<open>\<alpha> = \<lparr>text_sections = [], data_sections = [], labels_to_offsets = [], binary_offset = 0\<rparr>\<close>
    and bdrv_aio_rw_vector\<^sub>a\<^sub>d\<^sub>d\<^sub>r[simp]: \<open>the (label_to_address \<alpha> ''bdrv_aio_rw_vector'') = bdrv_aio_rw_vector_addr\<close>
    and bdrv_check_byte_request\<^sub>a\<^sub>d\<^sub>d\<^sub>r[simp]: \<open>the (label_to_address \<alpha> ''bdrv_check_byte_request'') = bdrv_check_byte_request_addr\<close>
begin

text \<open>Using definitions that don't get unfolded immediately prevents locale argument issues.\<close>
definition \<open>bdrv_check_byte_request_0x1a3d9_retval \<equiv> bdrv_check_byte_request_0x1a3d9_retval\<^sub>v\<close>
definition \<open>bdrv_aio_rw_vector_0x1a3fe_retval \<equiv> bdrv_aio_rw_vector_0x1a3fe_retval\<^sub>v\<close>

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

locale "bdrv_aio_readv" = "qemu_img_xen" +
  fixes RAX\<^sub>0\<^sub>v RBX\<^sub>0\<^sub>v RCX\<^sub>0\<^sub>v RDX\<^sub>0\<^sub>v RDI\<^sub>0\<^sub>v RSI\<^sub>0\<^sub>v RSP\<^sub>0\<^sub>v RBP\<^sub>0\<^sub>v R15\<^sub>0\<^sub>v R14\<^sub>0\<^sub>v R13\<^sub>0\<^sub>v R12\<^sub>0\<^sub>v R9\<^sub>0\<^sub>v R8\<^sub>0\<^sub>v ret_address\<^sub>v :: \<open>64 word\<close>
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
definition \<open>R9\<^sub>0 \<equiv> R9\<^sub>0\<^sub>v\<close>
definition \<open>R8\<^sub>0 \<equiv> R8\<^sub>0\<^sub>v\<close>
definition \<open>ret_address \<equiv> ret_address\<^sub>v\<close>

definition P_0x1a3a0_0 :: state_pred where
  \<open>P_0x1a3a0_0 \<sigma> \<equiv> RIP \<sigma> = 0x1a3a0 \<and> RAX \<sigma> = RAX\<^sub>0 \<and> RBX \<sigma> = RBX\<^sub>0 \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = RDX\<^sub>0 \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = RSP\<^sub>0 \<and> RBP \<sigma> = RBP\<^sub>0 \<and> R15 \<sigma> = R15\<^sub>0 \<and> R14 \<sigma> = R14\<^sub>0 \<and> R13 \<sigma> = R13\<^sub>0 \<and> R12 \<sigma> = R12\<^sub>0 \<and> R9 \<sigma> = R9\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address\<close>
declare P_0x1a3a0_0_def[Ps]

definition P_0x1a3a0_0_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x1a3a0_0_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (2, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x30), 8)
  }\<close>

definition P_0x1a3a0_0_regions :: state_pred where
  \<open>P_0x1a3a0_0_regions \<sigma> \<equiv> \<exists>regions. P_0x1a3a0_0_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x1a3d9_0 :: state_pred where
  \<open>Q_0x1a3d9_0 \<sigma> \<equiv> RIP \<sigma> = 0x1a3d9 \<and> RAX \<sigma> = (- RSI\<^sub>0) \<and> RBX \<sigma> = RSI\<^sub>0 \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = (sextend (ucast (((\<langle>31,0\<rangle>RCX\<^sub>0::32 word) << 9))) 32 64::64 word) \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = (if' (RSI\<^sub>0::64 word) <s (ucast ((0x0::64 word))::64 word) then (- RSI\<^sub>0) else ((RSI\<^sub>0 << 9)::64 word)) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x38) \<and> RBP \<sigma> = RDX\<^sub>0 \<and> R15 \<sigma> = ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)) \<and> R14 \<sigma> = RDI\<^sub>0 \<and> R13 \<sigma> = R9\<^sub>0 \<and> R12 \<sigma> = R8\<^sub>0 \<and> R9 \<sigma> = R9\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0\<close>
declare Q_0x1a3d9_0_def[Qs]


schematic_goal bdrv_aio_readv_0_21_0x1a3a0_0x1a3d6_0[blocks]:
  assumes \<open>(P_0x1a3a0_0 && P_0x1a3a0_0_regions) \<sigma>\<close>
  shows \<open>exec_block 21 0x1a3d6 0 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x1a3d9_0 ?\<sigma> \<and> block_usage P_0x1a3a0_0_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x1a3a0_0_def P_0x1a3a0_0_regions_def post: Q_0x1a3d9_0_def regionset: P_0x1a3a0_0_regions_set_def)

definition P_0x1a3d9_1 :: state_pred where
  \<open>P_0x1a3d9_1 \<sigma> \<equiv> RIP \<sigma> = 0x1a3d9 \<and> RAX \<sigma> = (- RSI\<^sub>0) \<and> RBX \<sigma> = RSI\<^sub>0 \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = (sextend (ucast (((\<langle>31,0\<rangle>RCX\<^sub>0::32 word) << 9))) 32 64::64 word) \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = (if' (RSI\<^sub>0::64 word) <s (ucast ((0x0::64 word))::64 word) then (- RSI\<^sub>0) else ((RSI\<^sub>0 << 9)::64 word)) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x38) \<and> RBP \<sigma> = RDX\<^sub>0 \<and> R15 \<sigma> = ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)) \<and> R14 \<sigma> = RDI\<^sub>0 \<and> R13 \<sigma> = R9\<^sub>0 \<and> R12 \<sigma> = R8\<^sub>0 \<and> R9 \<sigma> = R9\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0\<close>
declare P_0x1a3d9_1_def[Ps]

definition P_0x1a3d9_1_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x1a3d9_1_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (2, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x40), 8)
  }\<close>

definition P_0x1a3d9_1_regions :: state_pred where
  \<open>P_0x1a3d9_1_regions \<sigma> \<equiv> \<exists>regions. P_0x1a3d9_1_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_bdrv_check_byte_request_addr_0x1a3d9_1 :: state_pred where
  \<open>Q_bdrv_check_byte_request_addr_0x1a3d9_1 \<sigma> \<equiv> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x40) \<and> RIP \<sigma> = bdrv_check_byte_request_addr \<and> RAX \<sigma> = (- RSI\<^sub>0) \<and> RBX \<sigma> = RSI\<^sub>0 \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = (sextend (ucast (((\<langle>31,0\<rangle>RCX\<^sub>0::32 word) << 9))) 32 64::64 word) \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = (if' (RSI\<^sub>0::64 word) <s (ucast ((0x0::64 word))::64 word) then (- RSI\<^sub>0) else ((RSI\<^sub>0 << 9)::64 word)) \<and> RBP \<sigma> = RDX\<^sub>0 \<and> R15 \<sigma> = ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)) \<and> R14 \<sigma> = RDI\<^sub>0 \<and> R13 \<sigma> = R9\<^sub>0 \<and> R12 \<sigma> = R8\<^sub>0 \<and> R9 \<sigma> = R9\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = 0x1a3de\<close>
declare Q_bdrv_check_byte_request_addr_0x1a3d9_1_def[Qs]

schematic_goal bdrv_aio_readv_0_1_0x1a3d9_0x1a3d9_1[blocks]:
  assumes \<open>(P_0x1a3d9_1 && P_0x1a3d9_1_regions) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x1a3d9 (Suc 0) \<sigma> \<triangleq> ?\<sigma> \<and> Q_bdrv_check_byte_request_addr_0x1a3d9_1 ?\<sigma> \<and> block_usage P_0x1a3d9_1_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x1a3d9_1_def P_0x1a3d9_1_regions_def post: Q_bdrv_check_byte_request_addr_0x1a3d9_1_def regionset: P_0x1a3d9_1_regions_set_def)

definition P_0x1a3de_2 :: state_pred where
  \<open>P_0x1a3de_2 \<sigma> \<equiv> RIP \<sigma> = 0x1a3de \<and> RAX \<sigma> = bdrv_check_byte_request_0x1a3d9_retval \<and> RBX \<sigma> = RSI\<^sub>0 \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = (sextend (ucast (((\<langle>31,0\<rangle>RCX\<^sub>0::32 word) << 9))) 32 64::64 word) \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = (if' (RSI\<^sub>0::64 word) <s (ucast ((0x0::64 word))::64 word) then (- RSI\<^sub>0) else ((RSI\<^sub>0 << 9)::64 word)) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x38) \<and> RBP \<sigma> = RDX\<^sub>0 \<and> R15 \<sigma> = ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)) \<and> R14 \<sigma> = RDI\<^sub>0 \<and> R13 \<sigma> = R9\<^sub>0 \<and> R12 \<sigma> = R8\<^sub>0 \<and> R9 \<sigma> = R9\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = 0x1a3de\<close>
declare P_0x1a3de_2_def[Ps]

definition P_0x1a3de_2_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x1a3de_2_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (2, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x40), 8)
  }\<close>

definition P_0x1a3de_2_regions :: state_pred where
  \<open>P_0x1a3de_2_regions \<sigma> \<equiv> \<exists>regions. P_0x1a3de_2_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x1a3e4_2 :: state_pred where
  \<open>Q_0x1a3e4_2 \<sigma> \<equiv> RIP \<sigma> = 0x1a3e4 \<and> RAX \<sigma> = 0x0 \<and> RBX \<sigma> = RSI\<^sub>0 \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = ucast ((\<langle>31,0\<rangle>bdrv_check_byte_request_0x1a3d9_retval::32 word)) \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = (if' (RSI\<^sub>0::64 word) <s (ucast ((0x0::64 word))::64 word) then (- RSI\<^sub>0) else ((RSI\<^sub>0 << 9)::64 word)) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x38) \<and> RBP \<sigma> = RDX\<^sub>0 \<and> R15 \<sigma> = ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)) \<and> R14 \<sigma> = RDI\<^sub>0 \<and> R13 \<sigma> = R9\<^sub>0 \<and> R12 \<sigma> = R8\<^sub>0 \<and> R9 \<sigma> = R9\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = 0x1a3de\<close>
declare Q_0x1a3e4_2_def[Qs]

schematic_goal bdrv_aio_readv_0_3_0x1a3de_0x1a3e2_2[blocks]:
  assumes \<open>(P_0x1a3de_2 && P_0x1a3de_2_regions) \<sigma>\<close>
  shows \<open>exec_block 3 0x1a3e2 2 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x1a3e4_2 ?\<sigma> \<and> block_usage P_0x1a3de_2_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x1a3de_2_def P_0x1a3de_2_regions_def post: Q_0x1a3e4_2_def regionset: P_0x1a3de_2_regions_set_def)

definition P_0x1a3e4_true_3 :: state_pred where
  \<open>P_0x1a3e4_true_3 \<sigma> \<equiv> RIP \<sigma> = 0x1a3e4 \<and> RAX \<sigma> = 0x0 \<and> RBX \<sigma> = RSI\<^sub>0 \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = ucast ((\<langle>31,0\<rangle>bdrv_check_byte_request_0x1a3d9_retval::32 word)) \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = (if' (RSI\<^sub>0::64 word) <s (ucast ((0x0::64 word))::64 word) then (- RSI\<^sub>0) else ((RSI\<^sub>0 << 9)::64 word)) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x38) \<and> RBP \<sigma> = RDX\<^sub>0 \<and> R15 \<sigma> = ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)) \<and> R14 \<sigma> = RDI\<^sub>0 \<and> R13 \<sigma> = R9\<^sub>0 \<and> R12 \<sigma> = R8\<^sub>0 \<and> R9 \<sigma> = R9\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = 0x1a3de\<close>
declare P_0x1a3e4_true_3_def[Ps]

definition P_0x1a3e4_true_3_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x1a3e4_true_3_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (2, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x40), 8)
  }\<close>

definition P_0x1a3e4_true_3_regions :: state_pred where
  \<open>P_0x1a3e4_true_3_regions \<sigma> \<equiv> \<exists>regions. P_0x1a3e4_true_3_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x1a405_3 :: state_pred where
  \<open>Q_0x1a405_3 \<sigma> \<equiv> RIP \<sigma> = 0x1a405 \<and> RBX \<sigma> = RSI\<^sub>0 \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x38) \<and> RBP \<sigma> = RDX\<^sub>0 \<and> R15 \<sigma> = ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)) \<and> R14 \<sigma> = RDI\<^sub>0 \<and> R13 \<sigma> = R9\<^sub>0 \<and> R12 \<sigma> = R8\<^sub>0 \<and> R9 \<sigma> = R9\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = 0x1a3de\<close>
declare Q_0x1a405_3_def[Qs]

schematic_goal bdrv_aio_readv_0_1_0x1a3e4_0x1a3e4_3[blocks]:
  assumes \<open>(P_0x1a3e4_true_3 && P_0x1a3e4_true_3_regions && !ZF) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x1a3e4 3 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x1a405_3 ?\<sigma> \<and> block_usage P_0x1a3e4_true_3_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x1a3e4_true_3_def P_0x1a3e4_true_3_regions_def post: Q_0x1a405_3_def regionset: P_0x1a3e4_true_3_regions_set_def)

definition P_0x1a3e4_false_4 :: state_pred where
  \<open>P_0x1a3e4_false_4 \<sigma> \<equiv> RIP \<sigma> = 0x1a3e4 \<and> RAX \<sigma> = 0x0 \<and> RBX \<sigma> = RSI\<^sub>0 \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = ucast ((\<langle>31,0\<rangle>bdrv_check_byte_request_0x1a3d9_retval::32 word)) \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = (if' (RSI\<^sub>0::64 word) <s (ucast ((0x0::64 word))::64 word) then (- RSI\<^sub>0) else ((RSI\<^sub>0 << 9)::64 word)) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x38) \<and> RBP \<sigma> = RDX\<^sub>0 \<and> R15 \<sigma> = ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)) \<and> R14 \<sigma> = RDI\<^sub>0 \<and> R13 \<sigma> = R9\<^sub>0 \<and> R12 \<sigma> = R8\<^sub>0 \<and> R9 \<sigma> = R9\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = 0x1a3de\<close>
declare P_0x1a3e4_false_4_def[Ps]

definition P_0x1a3e4_false_4_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x1a3e4_false_4_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (2, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x40), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x48), 8)
  }\<close>

definition P_0x1a3e4_false_4_regions :: state_pred where
  \<open>P_0x1a3e4_false_4_regions \<sigma> \<equiv> \<exists>regions. P_0x1a3e4_false_4_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x1a3fe_4 :: state_pred where
  \<open>Q_0x1a3fe_4 \<sigma> \<equiv> RIP \<sigma> = 0x1a3fe \<and> RAX \<sigma> = 0x0 \<and> RBX \<sigma> = RSI\<^sub>0 \<and> RCX \<sigma> = ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)) \<and> RDX \<sigma> = RDX\<^sub>0 \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x48) \<and> RBP \<sigma> = RDX\<^sub>0 \<and> R15 \<sigma> = ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)) \<and> R14 \<sigma> = RDI\<^sub>0 \<and> R13 \<sigma> = R9\<^sub>0 \<and> R12 \<sigma> = R8\<^sub>0 \<and> R9 \<sigma> = R9\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = 0x1a3de \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x48),8]::64 word) = 0x0\<close>
declare Q_0x1a3fe_4_def[Qs]

schematic_goal bdrv_aio_readv_0_9_0x1a3e4_0x1a3fb_4[blocks]:
  assumes \<open>(P_0x1a3e4_false_4 && P_0x1a3e4_false_4_regions && ! !ZF) \<sigma>\<close>
  shows \<open>exec_block 9 0x1a3fb 4 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x1a3fe_4 ?\<sigma> \<and> block_usage P_0x1a3e4_false_4_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x1a3e4_false_4_def P_0x1a3e4_false_4_regions_def post: Q_0x1a3fe_4_def regionset: P_0x1a3e4_false_4_regions_set_def)

definition P_0x1a3fe_5 :: state_pred where
  \<open>P_0x1a3fe_5 \<sigma> \<equiv> RIP \<sigma> = 0x1a3fe \<and> RAX \<sigma> = 0x0 \<and> RBX \<sigma> = RSI\<^sub>0 \<and> RCX \<sigma> = ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)) \<and> RDX \<sigma> = RDX\<^sub>0 \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x48) \<and> RBP \<sigma> = RDX\<^sub>0 \<and> R15 \<sigma> = ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)) \<and> R14 \<sigma> = RDI\<^sub>0 \<and> R13 \<sigma> = R9\<^sub>0 \<and> R12 \<sigma> = R8\<^sub>0 \<and> R9 \<sigma> = R9\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = 0x1a3de \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x48),8]::64 word) = 0x0\<close>
declare P_0x1a3fe_5_def[Ps]

definition P_0x1a3fe_5_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x1a3fe_5_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (2, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x40), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x48), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x50), 8)
  }\<close>

definition P_0x1a3fe_5_regions :: state_pred where
  \<open>P_0x1a3fe_5_regions \<sigma> \<equiv> \<exists>regions. P_0x1a3fe_5_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_bdrv_aio_rw_vector_addr_0x1a3fe_5 :: state_pred where
  \<open>Q_bdrv_aio_rw_vector_addr_0x1a3fe_5 \<sigma> \<equiv> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x50) \<and> RIP \<sigma> = bdrv_aio_rw_vector_addr \<and> RAX \<sigma> = 0x0 \<and> RBX \<sigma> = RSI\<^sub>0 \<and> RCX \<sigma> = ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)) \<and> RDX \<sigma> = RDX\<^sub>0 \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RBP \<sigma> = RDX\<^sub>0 \<and> R15 \<sigma> = ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)) \<and> R14 \<sigma> = RDI\<^sub>0 \<and> R13 \<sigma> = R9\<^sub>0 \<and> R12 \<sigma> = R8\<^sub>0 \<and> R9 \<sigma> = R9\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = 0x1a3de \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x48),8]::64 word) = 0x0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),8]::64 word) = 0x1a403\<close>
declare Q_bdrv_aio_rw_vector_addr_0x1a3fe_5_def[Qs]

schematic_goal bdrv_aio_readv_0_1_0x1a3fe_0x1a3fe_5[blocks]:
  assumes \<open>(P_0x1a3fe_5 && P_0x1a3fe_5_regions) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x1a3fe 5 \<sigma> \<triangleq> ?\<sigma> \<and> Q_bdrv_aio_rw_vector_addr_0x1a3fe_5 ?\<sigma> \<and> block_usage P_0x1a3fe_5_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x1a3fe_5_def P_0x1a3fe_5_regions_def post: Q_bdrv_aio_rw_vector_addr_0x1a3fe_5_def regionset: P_0x1a3fe_5_regions_set_def)

definition P_0x1a403_6 :: state_pred where
  \<open>P_0x1a403_6 \<sigma> \<equiv> RIP \<sigma> = 0x1a403 \<and> RAX \<sigma> = bdrv_aio_rw_vector_0x1a3fe_retval \<and> RBX \<sigma> = RSI\<^sub>0 \<and> RCX \<sigma> = ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)) \<and> RDX \<sigma> = RDX\<^sub>0 \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x48) \<and> RBP \<sigma> = RDX\<^sub>0 \<and> R15 \<sigma> = ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)) \<and> R14 \<sigma> = RDI\<^sub>0 \<and> R13 \<sigma> = R9\<^sub>0 \<and> R12 \<sigma> = R8\<^sub>0 \<and> R9 \<sigma> = R9\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = 0x1a3de \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x48),8]::64 word) = 0x0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),8]::64 word) = 0x1a403\<close>
declare P_0x1a403_6_def[Ps]

definition P_0x1a403_6_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x1a403_6_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (2, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x40), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x48), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x50), 8)
  }\<close>

definition P_0x1a403_6_regions :: state_pred where
  \<open>P_0x1a403_6_regions \<sigma> \<equiv> \<exists>regions. P_0x1a403_6_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x1a405_6 :: state_pred where
  \<open>Q_0x1a405_6 \<sigma> \<equiv> RIP \<sigma> = 0x1a405 \<and> RBX \<sigma> = RSI\<^sub>0 \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x38) \<and> RBP \<sigma> = RDX\<^sub>0 \<and> R15 \<sigma> = ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)) \<and> R14 \<sigma> = RDI\<^sub>0 \<and> R13 \<sigma> = R9\<^sub>0 \<and> R12 \<sigma> = R8\<^sub>0 \<and> R9 \<sigma> = R9\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = 0x1a3de\<close>
declare Q_0x1a405_6_def[Qs]

schematic_goal bdrv_aio_readv_0_2_0x1a403_0x1a404_6[blocks]:
  assumes \<open>(P_0x1a403_6 && P_0x1a403_6_regions) \<sigma>\<close>
  shows \<open>exec_block 2 0x1a404 6 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x1a405_6 ?\<sigma> \<and> block_usage P_0x1a403_6_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x1a403_6_def P_0x1a403_6_regions_def post: Q_0x1a405_6_def regionset: P_0x1a403_6_regions_set_def)

definition P_0x1a405_7 :: state_pred where
  \<open>P_0x1a405_7 \<sigma> \<equiv> RIP \<sigma> = 0x1a405 \<and> RBX \<sigma> = RSI\<^sub>0 \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x38) \<and> RBP \<sigma> = RDX\<^sub>0 \<and> R15 \<sigma> = ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)) \<and> R14 \<sigma> = RDI\<^sub>0 \<and> R13 \<sigma> = R9\<^sub>0 \<and> R12 \<sigma> = R8\<^sub>0 \<and> R9 \<sigma> = R9\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = 0x1a3de\<close>
declare P_0x1a405_7_def[Ps]

definition P_0x1a405_7_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x1a405_7_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (2, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x40), 8)
  }\<close>

definition P_0x1a405_7_regions :: state_pred where
  \<open>P_0x1a405_7_regions \<sigma> \<equiv> \<exists>regions. P_0x1a405_7_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_ret_address_7 :: state_pred where
  \<open>Q_ret_address_7 \<sigma> \<equiv> RIP \<sigma> = ret_address \<and> RBX \<sigma> = RBX\<^sub>0 \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) + 0x8) \<and> RBP \<sigma> = RBP\<^sub>0 \<and> R15 \<sigma> = R15\<^sub>0 \<and> R14 \<sigma> = R14\<^sub>0 \<and> R13 \<sigma> = R13\<^sub>0 \<and> R12 \<sigma> = R12\<^sub>0 \<and> R9 \<sigma> = R9\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = 0x1a3de\<close>
declare Q_ret_address_7_def[Qs]

schematic_goal bdrv_aio_readv_0_8_0x1a405_0x1a413_7[blocks]:
  assumes \<open>(P_0x1a405_7 && P_0x1a405_7_regions) \<sigma>\<close>
  shows \<open>exec_block 8 0x1a413 7 \<sigma> \<triangleq> ?\<sigma> \<and> Q_ret_address_7 ?\<sigma> \<and> block_usage P_0x1a405_7_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x1a405_7_def P_0x1a405_7_regions_def post: Q_ret_address_7_def regionset: P_0x1a405_7_regions_set_def)

definition bdrv_aio_readv_acode :: ACode where
  \<open>bdrv_aio_readv_acode =
    Block 21 0x1a3d6 0;
    Block (Suc 0) 0x1a3d9 (Suc 0);
    CALL bdrv_check_byte_request_acode;
    Block 3 0x1a3e2 2;
    IF !ZF THEN
      Block (Suc 0) 0x1a3e4 3
    ELSE
      Block 9 0x1a3fb 4;
      Block (Suc 0) 0x1a3fe 5;
      CALL bdrv_aio_rw_vector_acode;
      Block 2 0x1a404 6
    FI;
    Block 8 0x1a413 7
  \<close>

schematic_goal "bdrv_aio_readv":
  assumes
    \<open>\<forall>\<sigma>. RIP \<sigma> = 0x1a3d9 \<longrightarrow> P_0x1a3d9_1_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x1a3de \<longrightarrow> P_0x1a3de_2_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x1a3e4 \<longrightarrow> P_0x1a3e4_true_3_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x1a3e4 \<longrightarrow> P_0x1a3e4_false_4_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x1a3fe \<longrightarrow> P_0x1a3fe_5_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x1a403 \<longrightarrow> P_0x1a403_6_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x1a405 \<longrightarrow> P_0x1a405_7_regions \<sigma>\<close>
    and [blocks]: \<open>{{Q_bdrv_check_byte_request_addr_0x1a3d9_1}} \<box>bdrv_check_byte_request_acode {{P_0x1a3de_2;M_0x1a3d9}}\<close>
    and [blocks]: \<open>{{Q_bdrv_aio_rw_vector_addr_0x1a3fe_5}} \<box>bdrv_aio_rw_vector_acode {{P_0x1a403_6;M_0x1a3fe}}\<close>
  shows \<open>{{?P}} bdrv_aio_readv_acode {{?Q;?M}}\<close>
  by (vcg acode: bdrv_aio_readv_acode_def assms: assms)

end
