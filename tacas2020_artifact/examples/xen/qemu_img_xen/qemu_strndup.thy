theory qemu_strndup
  imports
    "../../../isabelle/VCG/HTriple"
begin


locale "qemu_img_xen" = execution_context + exec_code +
  fixes abort_0x3724_retval\<^sub>v memchr_0x5a31_retval\<^sub>v malloc_0x5a47_retval\<^sub>v memcpy_0x5a68_retval\<^sub>v abort_addr malloc_addr memchr_addr memcpy_addr :: \<open>64 word\<close>
    and abort_acode malloc_acode memchr_acode memcpy_acode :: ACode
  assumes fetch:
    "fetch 0x3724 \<equiv> (Unary (IS_8088 Call) (Immediate SixtyFour (ImmLabel ''abort'')), 5)"
    "fetch 0x5a20 \<equiv> (Unary (IS_8088 Push) (Storage (Reg (General SixtyFour rbp))), 1)"
    "fetch 0x5a21 \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour rdx)) (Storage (Reg (General SixtyFour rsi))), 3)"
    "fetch 0x5a24 \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour rbp)) (Storage (Reg (General SixtyFour rdi))), 3)"
    "fetch 0x5a27 \<equiv> (Unary (IS_8088 Push) (Storage (Reg (General SixtyFour rbx))), 1)"
    "fetch 0x5a28 \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour rbx)) (Storage (Reg (General SixtyFour rsi))), 3)"
    "fetch 0x5a2b \<equiv> (Binary (IS_8088 Xor) (Reg (General ThirtyTwo rsi)) (Storage (Reg (General ThirtyTwo rsi))), 2)"
    "fetch 0x5a2d \<equiv> (Binary (IS_8088 Sub) (Reg (General SixtyFour rsp)) (Immediate SixtyFour (ImmVal 8)), 4)"
    "fetch 0x5a31 \<equiv> (Unary (IS_8088 Call) (Immediate SixtyFour (ImmLabel ''memchr'')), 5)"
    "fetch 0x5a36 \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour rdx)) (Storage (Reg (General SixtyFour rax))), 3)"
    "fetch 0x5a39 \<equiv> (Binary (IS_8088 Sub) (Reg (General SixtyFour rdx)) (Storage (Reg (General SixtyFour rbp))), 3)"
    "fetch 0x5a3c \<equiv> (Binary (IS_8088 Test) (Reg (General SixtyFour rax)) (Storage (Reg (General SixtyFour rax))), 3)"
    "fetch 0x5a3f \<equiv> (Binary (IS_PentiumPro Cmovne) (Reg (General SixtyFour rbx)) (Storage (Reg (General SixtyFour rdx))), 4)"
    "fetch 0x5a43 \<equiv> (Binary (IS_8088 Lea) (Reg (General SixtyFour rdi)) (Storage (Memory SixtyFour (A_Plus (A_FromReg (General SixtyFour rbx)) (A_WordConstant 1)))), 4)"
    "fetch 0x5a47 \<equiv> (Unary (IS_8088 Call) (Immediate SixtyFour (ImmLabel ''malloc'')), 5)"
    "fetch 0x5a4c \<equiv> (Binary (IS_8088 Test) (Reg (General SixtyFour rax)) (Storage (Reg (General SixtyFour rax))), 3)"
    "fetch 0x5a4f \<equiv> (Unary (IS_8088 Je) (Immediate SixtyFour (ImmVal 14116)), 6)"
    "fetch 0x5a55 \<equiv> (Binary (IS_8088 Mov) (Memory Eight (A_SizeDirective 8 (A_Plus (A_FromReg (General SixtyFour rax)) (A_Mult 1 (A_FromReg (General SixtyFour rbx)))))) (Immediate SixtyFour (ImmVal 0)), 4)"
    "fetch 0x5a59 \<equiv> (Binary (IS_8088 Add) (Reg (General SixtyFour rsp)) (Immediate SixtyFour (ImmVal 8)), 4)"
    "fetch 0x5a5d \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour rdx)) (Storage (Reg (General SixtyFour rbx))), 3)"
    "fetch 0x5a60 \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour rsi)) (Storage (Reg (General SixtyFour rbp))), 3)"
    "fetch 0x5a63 \<equiv> (Unary (IS_8088 Pop) (Storage (Reg (General SixtyFour rbx))), 1)"
    "fetch 0x5a64 \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour rdi)) (Storage (Reg (General SixtyFour rax))), 3)"
    "fetch 0x5a67 \<equiv> (Unary (IS_8088 Pop) (Storage (Reg (General SixtyFour rbp))), 1)"
    "fetch 0x5a68 \<equiv> (Unary (IS_8088 Call) (Immediate SixtyFour (ImmLabel ''memcpy'')), 1)"
    "fetch 0x5a69 \<equiv> (Nullary (IS_8088 Ret), 4)"
    and \<alpha>_def: \<open>\<alpha> = \<lparr>text_sections = [], data_sections = [], labels_to_offsets = [], binary_offset = 0\<rparr>\<close>
    and abort\<^sub>a\<^sub>d\<^sub>d\<^sub>r[simp]: \<open>the (label_to_address \<alpha> ''abort'') = abort_addr\<close>
    and malloc\<^sub>a\<^sub>d\<^sub>d\<^sub>r[simp]: \<open>the (label_to_address \<alpha> ''malloc'') = malloc_addr\<close>
    and memchr\<^sub>a\<^sub>d\<^sub>d\<^sub>r[simp]: \<open>the (label_to_address \<alpha> ''memchr'') = memchr_addr\<close>
    and memcpy\<^sub>a\<^sub>d\<^sub>d\<^sub>r[simp]: \<open>the (label_to_address \<alpha> ''memcpy'') = memcpy_addr\<close>
begin

text \<open>Using definitions that don't get unfolded immediately prevents locale argument issues.\<close>
definition \<open>abort_0x3724_retval \<equiv> abort_0x3724_retval\<^sub>v\<close>
definition \<open>memchr_0x5a31_retval \<equiv> memchr_0x5a31_retval\<^sub>v\<close>
definition \<open>malloc_0x5a47_retval \<equiv> malloc_0x5a47_retval\<^sub>v\<close>
definition \<open>memcpy_0x5a68_retval \<equiv> memcpy_0x5a68_retval\<^sub>v\<close>

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

locale "qemu_strndup_cold_4" = "qemu_img_xen" +
  fixes RAX\<^sub>0\<^sub>v RSP\<^sub>0\<^sub>v ret_address\<^sub>v :: \<open>64 word\<close>
begin

text \<open>Using definitions that don't get unfolded immediately prevents locale argument issues.\<close>
definition \<open>RAX\<^sub>0 \<equiv> RAX\<^sub>0\<^sub>v\<close>
definition \<open>RSP\<^sub>0 \<equiv> RSP\<^sub>0\<^sub>v\<close>
definition \<open>ret_address \<equiv> ret_address\<^sub>v\<close>

definition P_0x3724_0 :: state_pred where
  \<open>P_0x3724_0 \<sigma> \<equiv> RIP \<sigma> = 0x3724 \<and> RAX \<sigma> = RAX\<^sub>0 \<and> RSP \<sigma> = RSP\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address\<close>
declare P_0x3724_0_def[Ps]

definition P_0x3724_0_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x3724_0_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((RSP\<^sub>0::64 word) - 0x8), 8)
  }\<close>

definition P_0x3724_0_regions :: state_pred where
  \<open>P_0x3724_0_regions \<sigma> \<equiv> \<exists>regions. P_0x3724_0_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_abort_addr_0x3724_0 :: state_pred where
  \<open>Q_abort_addr_0x3724_0 \<sigma> \<equiv> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x8) \<and> RIP \<sigma> = abort_addr \<and> RAX \<sigma> = RAX\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = 0x3729\<close>
declare Q_abort_addr_0x3724_0_def[Qs]

schematic_goal qemu_strndup_cold_4_0_1_0x3724_0x3724_0[blocks]:
  assumes \<open>(P_0x3724_0 && P_0x3724_0_regions) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x3724 0 \<sigma> \<triangleq> ?\<sigma> \<and> Q_abort_addr_0x3724_0 ?\<sigma> \<and> block_usage P_0x3724_0_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x3724_0_def P_0x3724_0_regions_def post: Q_abort_addr_0x3724_0_def regionset: P_0x3724_0_regions_set_def)

definition qemu_strndup_cold_4_acode :: ACode where
  \<open>qemu_strndup_cold_4_acode =
    Block (Suc 0) 0x3724 0;
    CALL abort_acode
  \<close>

schematic_goal "qemu_strndup_cold_4":
  assumes
    [blocks]: \<open>{{Q_abort_addr_0x3724_0}} \<box>abort_acode {{Q_fail;M_0x3724}}\<close>
  shows \<open>{{?P}} qemu_strndup_cold_4_acode {{?Q;?M}}\<close>
  by (vcg acode: qemu_strndup_cold_4_acode_def assms: assms)

end

locale "qemu_strndup" = "qemu_img_xen" +
  fixes RAX\<^sub>0\<^sub>v RBX\<^sub>0\<^sub>v RDX\<^sub>0\<^sub>v RDI\<^sub>0\<^sub>v RSI\<^sub>0\<^sub>v RSP\<^sub>0\<^sub>v RBP\<^sub>0\<^sub>v ret_address\<^sub>v :: \<open>64 word\<close>
begin

text \<open>Using definitions that don't get unfolded immediately prevents locale argument issues.\<close>
definition \<open>RAX\<^sub>0 \<equiv> RAX\<^sub>0\<^sub>v\<close>
definition \<open>RBX\<^sub>0 \<equiv> RBX\<^sub>0\<^sub>v\<close>
definition \<open>RDX\<^sub>0 \<equiv> RDX\<^sub>0\<^sub>v\<close>
definition \<open>RDI\<^sub>0 \<equiv> RDI\<^sub>0\<^sub>v\<close>
definition \<open>RSI\<^sub>0 \<equiv> RSI\<^sub>0\<^sub>v\<close>
definition \<open>RSP\<^sub>0 \<equiv> RSP\<^sub>0\<^sub>v\<close>
definition \<open>RBP\<^sub>0 \<equiv> RBP\<^sub>0\<^sub>v\<close>
definition \<open>ret_address \<equiv> ret_address\<^sub>v\<close>

definition P_0x5a20_0 :: state_pred where
  \<open>P_0x5a20_0 \<sigma> \<equiv> RIP \<sigma> = 0x5a20 \<and> RAX \<sigma> = RAX\<^sub>0 \<and> RBX \<sigma> = RBX\<^sub>0 \<and> RDX \<sigma> = RDX\<^sub>0 \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = RSP\<^sub>0 \<and> RBP \<sigma> = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address\<close>
declare P_0x5a20_0_def[Ps]

definition P_0x5a20_0_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x5a20_0_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (2, ((RSP\<^sub>0::64 word) - 0x10), 8)
  }\<close>

definition P_0x5a20_0_regions :: state_pred where
  \<open>P_0x5a20_0_regions \<sigma> \<equiv> \<exists>regions. P_0x5a20_0_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x5a31_0 :: state_pred where
  \<open>Q_0x5a31_0 \<sigma> \<equiv> RIP \<sigma> = 0x5a31 \<and> RAX \<sigma> = RAX\<^sub>0 \<and> RBX \<sigma> = RSI\<^sub>0 \<and> RDX \<sigma> = RSI\<^sub>0 \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = 0x0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x18) \<and> RBP \<sigma> = RDI\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = RBX\<^sub>0\<close>
declare Q_0x5a31_0_def[Qs]

schematic_goal qemu_strndup_0_7_0x5a20_0x5a2d_0[blocks]:
  assumes \<open>(P_0x5a20_0 && P_0x5a20_0_regions) \<sigma>\<close>
  shows \<open>exec_block 7 0x5a2d 0 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x5a31_0 ?\<sigma> \<and> block_usage P_0x5a20_0_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x5a20_0_def P_0x5a20_0_regions_def post: Q_0x5a31_0_def regionset: P_0x5a20_0_regions_set_def)

definition P_0x5a31_1 :: state_pred where
  \<open>P_0x5a31_1 \<sigma> \<equiv> RIP \<sigma> = 0x5a31 \<and> RAX \<sigma> = RAX\<^sub>0 \<and> RBX \<sigma> = RSI\<^sub>0 \<and> RDX \<sigma> = RSI\<^sub>0 \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = 0x0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x18) \<and> RBP \<sigma> = RDI\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = RBX\<^sub>0\<close>
declare P_0x5a31_1_def[Ps]

definition P_0x5a31_1_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x5a31_1_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (2, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x20), 8)
  }\<close>

definition P_0x5a31_1_regions :: state_pred where
  \<open>P_0x5a31_1_regions \<sigma> \<equiv> \<exists>regions. P_0x5a31_1_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_memchr_addr_0x5a31_1 :: state_pred where
  \<open>Q_memchr_addr_0x5a31_1 \<sigma> \<equiv> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x20) \<and> RIP \<sigma> = memchr_addr \<and> RAX \<sigma> = RAX\<^sub>0 \<and> RBX \<sigma> = RSI\<^sub>0 \<and> RDX \<sigma> = RSI\<^sub>0 \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = 0x0 \<and> RBP \<sigma> = RDI\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = 0x5a36\<close>
declare Q_memchr_addr_0x5a31_1_def[Qs]

schematic_goal qemu_strndup_0_1_0x5a31_0x5a31_1[blocks]:
  assumes \<open>(P_0x5a31_1 && P_0x5a31_1_regions) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x5a31 (Suc 0) \<sigma> \<triangleq> ?\<sigma> \<and> Q_memchr_addr_0x5a31_1 ?\<sigma> \<and> block_usage P_0x5a31_1_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x5a31_1_def P_0x5a31_1_regions_def post: Q_memchr_addr_0x5a31_1_def regionset: P_0x5a31_1_regions_set_def)

definition P_0x5a36_2 :: state_pred where
  \<open>P_0x5a36_2 \<sigma> \<equiv> RIP \<sigma> = 0x5a36 \<and> RAX \<sigma> = memchr_0x5a31_retval \<and> RBX \<sigma> = RSI\<^sub>0 \<and> RDX \<sigma> = RSI\<^sub>0 \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = 0x0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x18) \<and> RBP \<sigma> = RDI\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = 0x5a36\<close>
declare P_0x5a36_2_def[Ps]

definition P_0x5a36_2_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x5a36_2_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (2, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x20), 8)
  }\<close>

definition P_0x5a36_2_regions :: state_pred where
  \<open>P_0x5a36_2_regions \<sigma> \<equiv> \<exists>regions. P_0x5a36_2_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x5a47_2 :: state_pred where
  \<open>Q_0x5a47_2 \<sigma> \<equiv> RIP \<sigma> = 0x5a47 \<and> RAX \<sigma> = memchr_0x5a31_retval \<and> RBX \<sigma> = (if' (memchr_0x5a31_retval::64 word) \<noteq> (ucast ((0x0::64 word))::64 word) then ((memchr_0x5a31_retval::64 word) - RDI\<^sub>0) else (RSI\<^sub>0::64 word)) \<and> RDX \<sigma> = ((memchr_0x5a31_retval::64 word) - RDI\<^sub>0) \<and> RDI \<sigma> = (((if' (memchr_0x5a31_retval::64 word) \<noteq> (ucast ((0x0::64 word))::64 word) then ((memchr_0x5a31_retval::64 word) - RDI\<^sub>0) else (RSI\<^sub>0::64 word))::64 word) + 0x1) \<and> RSI \<sigma> = 0x0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x18) \<and> RBP \<sigma> = RDI\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = 0x5a36\<close>
declare Q_0x5a47_2_def[Qs]

schematic_goal qemu_strndup_0_5_0x5a36_0x5a43_2[blocks]:
  assumes \<open>(P_0x5a36_2 && P_0x5a36_2_regions) \<sigma>\<close>
  shows \<open>exec_block 5 0x5a43 2 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x5a47_2 ?\<sigma> \<and> block_usage P_0x5a36_2_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x5a36_2_def P_0x5a36_2_regions_def post: Q_0x5a47_2_def regionset: P_0x5a36_2_regions_set_def)

definition P_0x5a47_3 :: state_pred where
  \<open>P_0x5a47_3 \<sigma> \<equiv> RIP \<sigma> = 0x5a47 \<and> RAX \<sigma> = memchr_0x5a31_retval \<and> RBX \<sigma> = (if' (memchr_0x5a31_retval::64 word) \<noteq> (ucast ((0x0::64 word))::64 word) then ((memchr_0x5a31_retval::64 word) - RDI\<^sub>0) else (RSI\<^sub>0::64 word)) \<and> RDX \<sigma> = ((memchr_0x5a31_retval::64 word) - RDI\<^sub>0) \<and> RDI \<sigma> = (((if' (memchr_0x5a31_retval::64 word) \<noteq> (ucast ((0x0::64 word))::64 word) then ((memchr_0x5a31_retval::64 word) - RDI\<^sub>0) else (RSI\<^sub>0::64 word))::64 word) + 0x1) \<and> RSI \<sigma> = 0x0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x18) \<and> RBP \<sigma> = RDI\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = 0x5a36\<close>
declare P_0x5a47_3_def[Ps]

definition P_0x5a47_3_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x5a47_3_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (2, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x20), 8)
  }\<close>

definition P_0x5a47_3_regions :: state_pred where
  \<open>P_0x5a47_3_regions \<sigma> \<equiv> \<exists>regions. P_0x5a47_3_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_malloc_addr_0x5a47_3 :: state_pred where
  \<open>Q_malloc_addr_0x5a47_3 \<sigma> \<equiv> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x20) \<and> RIP \<sigma> = malloc_addr \<and> RAX \<sigma> = memchr_0x5a31_retval \<and> RBX \<sigma> = (if' (memchr_0x5a31_retval::64 word) \<noteq> (ucast ((0x0::64 word))::64 word) then ((memchr_0x5a31_retval::64 word) - RDI\<^sub>0) else (RSI\<^sub>0::64 word)) \<and> RDX \<sigma> = ((memchr_0x5a31_retval::64 word) - RDI\<^sub>0) \<and> RDI \<sigma> = (((if' (memchr_0x5a31_retval::64 word) \<noteq> (ucast ((0x0::64 word))::64 word) then ((memchr_0x5a31_retval::64 word) - RDI\<^sub>0) else (RSI\<^sub>0::64 word))::64 word) + 0x1) \<and> RSI \<sigma> = 0x0 \<and> RBP \<sigma> = RDI\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = 0x5a4c\<close>
declare Q_malloc_addr_0x5a47_3_def[Qs]

schematic_goal qemu_strndup_0_1_0x5a47_0x5a47_3[blocks]:
  assumes \<open>(P_0x5a47_3 && P_0x5a47_3_regions) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x5a47 3 \<sigma> \<triangleq> ?\<sigma> \<and> Q_malloc_addr_0x5a47_3 ?\<sigma> \<and> block_usage P_0x5a47_3_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x5a47_3_def P_0x5a47_3_regions_def post: Q_malloc_addr_0x5a47_3_def regionset: P_0x5a47_3_regions_set_def)

definition P_0x5a4c_4 :: state_pred where
  \<open>P_0x5a4c_4 \<sigma> \<equiv> RIP \<sigma> = 0x5a4c \<and> RAX \<sigma> = malloc_0x5a47_retval \<and> RBX \<sigma> = (if' (memchr_0x5a31_retval::64 word) \<noteq> (ucast ((0x0::64 word))::64 word) then ((memchr_0x5a31_retval::64 word) - RDI\<^sub>0) else (RSI\<^sub>0::64 word)) \<and> RDX \<sigma> = ((memchr_0x5a31_retval::64 word) - RDI\<^sub>0) \<and> RDI \<sigma> = (((if' (memchr_0x5a31_retval::64 word) \<noteq> (ucast ((0x0::64 word))::64 word) then ((memchr_0x5a31_retval::64 word) - RDI\<^sub>0) else (RSI\<^sub>0::64 word))::64 word) + 0x1) \<and> RSI \<sigma> = 0x0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x18) \<and> RBP \<sigma> = RDI\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = 0x5a4c\<close>
declare P_0x5a4c_4_def[Ps]

definition P_0x5a4c_4_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x5a4c_4_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (2, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x20), 8)
  }\<close>

definition P_0x5a4c_4_regions :: state_pred where
  \<open>P_0x5a4c_4_regions \<sigma> \<equiv> \<exists>regions. P_0x5a4c_4_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x5a4f_4 :: state_pred where
  \<open>Q_0x5a4f_4 \<sigma> \<equiv> RIP \<sigma> = 0x5a4f \<and> RAX \<sigma> = malloc_0x5a47_retval \<and> RBX \<sigma> = (if' (memchr_0x5a31_retval::64 word) \<noteq> (ucast ((0x0::64 word))::64 word) then ((memchr_0x5a31_retval::64 word) - RDI\<^sub>0) else (RSI\<^sub>0::64 word)) \<and> RDX \<sigma> = ((memchr_0x5a31_retval::64 word) - RDI\<^sub>0) \<and> RDI \<sigma> = (((if' (memchr_0x5a31_retval::64 word) \<noteq> (ucast ((0x0::64 word))::64 word) then ((memchr_0x5a31_retval::64 word) - RDI\<^sub>0) else (RSI\<^sub>0::64 word))::64 word) + 0x1) \<and> RSI \<sigma> = 0x0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x18) \<and> RBP \<sigma> = RDI\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = 0x5a4c\<close>
declare Q_0x5a4f_4_def[Qs]

schematic_goal qemu_strndup_0_1_0x5a4c_0x5a4c_4[blocks]:
  assumes \<open>(P_0x5a4c_4 && P_0x5a4c_4_regions) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x5a4c 4 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x5a4f_4 ?\<sigma> \<and> block_usage P_0x5a4c_4_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x5a4c_4_def P_0x5a4c_4_regions_def post: Q_0x5a4f_4_def regionset: P_0x5a4c_4_regions_set_def)

definition P_0x5a4f_true_5 :: state_pred where
  \<open>P_0x5a4f_true_5 \<sigma> \<equiv> RIP \<sigma> = 0x5a4f \<and> RAX \<sigma> = malloc_0x5a47_retval \<and> RBX \<sigma> = (if' (memchr_0x5a31_retval::64 word) \<noteq> (ucast ((0x0::64 word))::64 word) then ((memchr_0x5a31_retval::64 word) - RDI\<^sub>0) else (RSI\<^sub>0::64 word)) \<and> RDX \<sigma> = ((memchr_0x5a31_retval::64 word) - RDI\<^sub>0) \<and> RDI \<sigma> = (((if' (memchr_0x5a31_retval::64 word) \<noteq> (ucast ((0x0::64 word))::64 word) then ((memchr_0x5a31_retval::64 word) - RDI\<^sub>0) else (RSI\<^sub>0::64 word))::64 word) + 0x1) \<and> RSI \<sigma> = 0x0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x18) \<and> RBP \<sigma> = RDI\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = 0x5a4c\<close>
declare P_0x5a4f_true_5_def[Ps]

definition P_0x5a4f_true_5_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x5a4f_true_5_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (2, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x20), 8)
  }\<close>

definition P_0x5a4f_true_5_regions :: state_pred where
  \<open>P_0x5a4f_true_5_regions \<sigma> \<equiv> \<exists>regions. P_0x5a4f_true_5_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x3724_5 :: state_pred where
  \<open>Q_0x3724_5 \<sigma> \<equiv> RIP \<sigma> = 0x3724 \<and> RAX \<sigma> = malloc_0x5a47_retval \<and> RBX \<sigma> = (if' (memchr_0x5a31_retval::64 word) \<noteq> (ucast ((0x0::64 word))::64 word) then ((memchr_0x5a31_retval::64 word) - RDI\<^sub>0) else (RSI\<^sub>0::64 word)) \<and> RDX \<sigma> = ((memchr_0x5a31_retval::64 word) - RDI\<^sub>0) \<and> RDI \<sigma> = (((if' (memchr_0x5a31_retval::64 word) \<noteq> (ucast ((0x0::64 word))::64 word) then ((memchr_0x5a31_retval::64 word) - RDI\<^sub>0) else (RSI\<^sub>0::64 word))::64 word) + 0x1) \<and> RSI \<sigma> = 0x0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x18) \<and> RBP \<sigma> = RDI\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = 0x5a4c\<close>
declare Q_0x3724_5_def[Qs]

schematic_goal qemu_strndup_0_1_0x5a4f_0x5a4f_5[blocks]:
  assumes \<open>(P_0x5a4f_true_5 && P_0x5a4f_true_5_regions && ZF) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x5a4f 5 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x3724_5 ?\<sigma> \<and> block_usage P_0x5a4f_true_5_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x5a4f_true_5_def P_0x5a4f_true_5_regions_def post: Q_0x3724_5_def regionset: P_0x5a4f_true_5_regions_set_def)

definition P_0x3724_6 :: state_pred where
  \<open>P_0x3724_6 \<sigma> \<equiv> RIP \<sigma> = 0x3724 \<and> RAX \<sigma> = malloc_0x5a47_retval \<and> RBX \<sigma> = (if' (memchr_0x5a31_retval::64 word) \<noteq> (ucast ((0x0::64 word))::64 word) then ((memchr_0x5a31_retval::64 word) - RDI\<^sub>0) else (RSI\<^sub>0::64 word)) \<and> RDX \<sigma> = ((memchr_0x5a31_retval::64 word) - RDI\<^sub>0) \<and> RDI \<sigma> = (((if' (memchr_0x5a31_retval::64 word) \<noteq> (ucast ((0x0::64 word))::64 word) then ((memchr_0x5a31_retval::64 word) - RDI\<^sub>0) else (RSI\<^sub>0::64 word))::64 word) + 0x1) \<and> RSI \<sigma> = 0x0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x18) \<and> RBP \<sigma> = RDI\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = 0x5a4c\<close>
declare P_0x3724_6_def[Ps]

definition P_0x3724_6_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x3724_6_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (2, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x20), 8)
  }\<close>

definition P_0x3724_6_regions :: state_pred where
  \<open>P_0x3724_6_regions \<sigma> \<equiv> \<exists>regions. P_0x3724_6_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_abort_addr_0x3724_6 :: state_pred where
  \<open>Q_abort_addr_0x3724_6 \<sigma> \<equiv> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x20) \<and> RIP \<sigma> = abort_addr \<and> RAX \<sigma> = malloc_0x5a47_retval \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = RBX\<^sub>0\<close>
declare Q_abort_addr_0x3724_6_def[Qs]

schematic_goal qemu_strndup_0_1_0x3724_0x3724_6[blocks]:
  assumes \<open>(P_0x3724_6 && P_0x3724_6_regions) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x3724 6 \<sigma> \<triangleq> ?\<sigma> \<and> Q_abort_addr_0x3724_6 ?\<sigma> \<and> block_usage P_0x3724_6_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x3724_6_def P_0x3724_6_regions_def post: Q_abort_addr_0x3724_6_def regionset: P_0x3724_6_regions_set_def)

definition P_0x5a4f_false_7 :: state_pred where
  \<open>P_0x5a4f_false_7 \<sigma> \<equiv> RIP \<sigma> = 0x5a4f \<and> RAX \<sigma> = malloc_0x5a47_retval \<and> RBX \<sigma> = (if' (memchr_0x5a31_retval::64 word) \<noteq> (ucast ((0x0::64 word))::64 word) then ((memchr_0x5a31_retval::64 word) - RDI\<^sub>0) else (RSI\<^sub>0::64 word)) \<and> RDX \<sigma> = ((memchr_0x5a31_retval::64 word) - RDI\<^sub>0) \<and> RDI \<sigma> = (((if' (memchr_0x5a31_retval::64 word) \<noteq> (ucast ((0x0::64 word))::64 word) then ((memchr_0x5a31_retval::64 word) - RDI\<^sub>0) else (RSI\<^sub>0::64 word))::64 word) + 0x1) \<and> RSI \<sigma> = 0x0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x18) \<and> RBP \<sigma> = RDI\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = 0x5a4c\<close>
declare P_0x5a4f_false_7_def[Ps]

definition P_0x5a4f_false_7_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x5a4f_false_7_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((malloc_0x5a47_retval::64 word) + (\<langle>63,0\<rangle>(((if' (memchr_0x5a31_retval::64 word) \<noteq> (ucast ((0x0::64 word))::64 word) then ((memchr_0x5a31_retval::64 word) - RDI\<^sub>0) else (RSI\<^sub>0::64 word))::64 word) * 0x1)::64 word)), 1),
    (2, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x20), 8)
  }\<close>

definition P_0x5a4f_false_7_regions :: state_pred where
  \<open>P_0x5a4f_false_7_regions \<sigma> \<equiv> \<exists>regions. P_0x5a4f_false_7_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x5a68_7 :: state_pred where
  \<open>Q_0x5a68_7 \<sigma> \<equiv> RIP \<sigma> = 0x5a68 \<and> RAX \<sigma> = malloc_0x5a47_retval \<and> RBX \<sigma> = RBX\<^sub>0 \<and> RDX \<sigma> = (if' (memchr_0x5a31_retval::64 word) \<noteq> (ucast ((0x0::64 word))::64 word) then ((memchr_0x5a31_retval::64 word) - RDI\<^sub>0) else (RSI\<^sub>0::64 word)) \<and> RDI \<sigma> = malloc_0x5a47_retval \<and> RSI \<sigma> = RDI\<^sub>0 \<and> RSP \<sigma> = RSP\<^sub>0 \<and> RBP \<sigma> = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((malloc_0x5a47_retval::64 word) + (\<langle>63,0\<rangle>(((if' (memchr_0x5a31_retval::64 word) \<noteq> (ucast ((0x0::64 word))::64 word) then ((memchr_0x5a31_retval::64 word) - RDI\<^sub>0) else (RSI\<^sub>0::64 word))::64 word) * 0x1)::64 word)),1]::8 word) = 0x0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = 0x5a4c\<close>
declare Q_0x5a68_7_def[Qs]

schematic_goal qemu_strndup_0_8_0x5a4f_0x5a67_7[blocks]:
  assumes \<open>(P_0x5a4f_false_7 && P_0x5a4f_false_7_regions && ! ZF) \<sigma>\<close>
  shows \<open>exec_block 8 0x5a67 7 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x5a68_7 ?\<sigma> \<and> block_usage P_0x5a4f_false_7_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x5a4f_false_7_def P_0x5a4f_false_7_regions_def post: Q_0x5a68_7_def regionset: P_0x5a4f_false_7_regions_set_def)

definition P_0x5a68_8 :: state_pred where
  \<open>P_0x5a68_8 \<sigma> \<equiv> RIP \<sigma> = 0x5a68 \<and> RAX \<sigma> = malloc_0x5a47_retval \<and> RBX \<sigma> = RBX\<^sub>0 \<and> RDX \<sigma> = (if' (memchr_0x5a31_retval::64 word) \<noteq> (ucast ((0x0::64 word))::64 word) then ((memchr_0x5a31_retval::64 word) - RDI\<^sub>0) else (RSI\<^sub>0::64 word)) \<and> RDI \<sigma> = malloc_0x5a47_retval \<and> RSI \<sigma> = RDI\<^sub>0 \<and> RSP \<sigma> = RSP\<^sub>0 \<and> RBP \<sigma> = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((malloc_0x5a47_retval::64 word) + (\<langle>63,0\<rangle>(((if' (memchr_0x5a31_retval::64 word) \<noteq> (ucast ((0x0::64 word))::64 word) then ((memchr_0x5a31_retval::64 word) - RDI\<^sub>0) else (RSI\<^sub>0::64 word))::64 word) * 0x1)::64 word)),1]::8 word) = 0x0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = 0x5a4c\<close>
declare P_0x5a68_8_def[Ps]

definition P_0x5a68_8_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x5a68_8_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((malloc_0x5a47_retval::64 word) + (\<langle>63,0\<rangle>(((if' (memchr_0x5a31_retval::64 word) \<noteq> (ucast ((0x0::64 word))::64 word) then ((memchr_0x5a31_retval::64 word) - RDI\<^sub>0) else (RSI\<^sub>0::64 word))::64 word) * 0x1)::64 word)), 1),
    (2, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x20), 8)
  }\<close>

definition P_0x5a68_8_regions :: state_pred where
  \<open>P_0x5a68_8_regions \<sigma> \<equiv> \<exists>regions. P_0x5a68_8_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_memcpy_addr_0x5a68_8 :: state_pred where
  \<open>Q_memcpy_addr_0x5a68_8 \<sigma> \<equiv> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x8) \<and> RIP \<sigma> = memcpy_addr \<and> RAX \<sigma> = malloc_0x5a47_retval \<and> RBX \<sigma> = RBX\<^sub>0 \<and> RDX \<sigma> = (if' (memchr_0x5a31_retval::64 word) \<noteq> (ucast ((0x0::64 word))::64 word) then ((memchr_0x5a31_retval::64 word) - RDI\<^sub>0) else (RSI\<^sub>0::64 word)) \<and> RDI \<sigma> = malloc_0x5a47_retval \<and> RSI \<sigma> = RDI\<^sub>0 \<and> RBP \<sigma> = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((malloc_0x5a47_retval::64 word) + (\<langle>63,0\<rangle>(((if' (memchr_0x5a31_retval::64 word) \<noteq> (ucast ((0x0::64 word))::64 word) then ((memchr_0x5a31_retval::64 word) - RDI\<^sub>0) else (RSI\<^sub>0::64 word))::64 word) * 0x1)::64 word)),1]::8 word) = 0x0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = 0x5a69 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = 0x5a4c\<close>
declare Q_memcpy_addr_0x5a68_8_def[Qs]

schematic_goal qemu_strndup_0_1_0x5a68_0x5a68_8[blocks]:
  assumes \<open>(P_0x5a68_8 && P_0x5a68_8_regions) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x5a68 8 \<sigma> \<triangleq> ?\<sigma> \<and> Q_memcpy_addr_0x5a68_8 ?\<sigma> \<and> block_usage P_0x5a68_8_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x5a68_8_def P_0x5a68_8_regions_def post: Q_memcpy_addr_0x5a68_8_def regionset: P_0x5a68_8_regions_set_def)

definition P_0x5a69_9 :: state_pred where
  \<open>P_0x5a69_9 \<sigma> \<equiv> RIP \<sigma> = 0x5a69 \<and> RAX \<sigma> = memcpy_0x5a68_retval \<and> RBX \<sigma> = RBX\<^sub>0 \<and> RDX \<sigma> = (if' (memchr_0x5a31_retval::64 word) \<noteq> (ucast ((0x0::64 word))::64 word) then ((memchr_0x5a31_retval::64 word) - RDI\<^sub>0) else (RSI\<^sub>0::64 word)) \<and> RDI \<sigma> = malloc_0x5a47_retval \<and> RSI \<sigma> = RDI\<^sub>0 \<and> RSP \<sigma> = RSP\<^sub>0 \<and> RBP \<sigma> = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((malloc_0x5a47_retval::64 word) + (\<langle>63,0\<rangle>(((if' (memchr_0x5a31_retval::64 word) \<noteq> (ucast ((0x0::64 word))::64 word) then ((memchr_0x5a31_retval::64 word) - RDI\<^sub>0) else (RSI\<^sub>0::64 word))::64 word) * 0x1)::64 word)),1]::8 word) = 0x0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = 0x5a69 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = 0x5a4c\<close>
declare P_0x5a69_9_def[Ps]

definition P_0x5a69_9_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x5a69_9_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((malloc_0x5a47_retval::64 word) + (\<langle>63,0\<rangle>(((if' (memchr_0x5a31_retval::64 word) \<noteq> (ucast ((0x0::64 word))::64 word) then ((memchr_0x5a31_retval::64 word) - RDI\<^sub>0) else (RSI\<^sub>0::64 word))::64 word) * 0x1)::64 word)), 1),
    (2, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x20), 8)
  }\<close>

definition P_0x5a69_9_regions :: state_pred where
  \<open>P_0x5a69_9_regions \<sigma> \<equiv> \<exists>regions. P_0x5a69_9_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_ret_address_9 :: state_pred where
  \<open>Q_ret_address_9 \<sigma> \<equiv> RIP \<sigma> = ret_address \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = RBX\<^sub>0\<close>
declare Q_ret_address_9_def[Qs]

schematic_goal qemu_strndup_0_1_0x5a69_0x5a69_9[blocks]:
  assumes \<open>(P_0x5a69_9 && P_0x5a69_9_regions) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x5a69 9 \<sigma> \<triangleq> ?\<sigma> \<and> Q_ret_address_9 ?\<sigma> \<and> block_usage P_0x5a69_9_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x5a69_9_def P_0x5a69_9_regions_def post: Q_ret_address_9_def regionset: P_0x5a69_9_regions_set_def)

definition qemu_strndup_acode :: ACode where
  \<open>qemu_strndup_acode =
    Block 7 0x5a2d 0;
    Block (Suc 0) 0x5a31 (Suc 0);
    CALL memchr_acode;
    Block 5 0x5a43 2;
    Block (Suc 0) 0x5a47 3;
    CALL malloc_acode;
    Block (Suc 0) 0x5a4c 4;
    IF ZF THEN
      Block (Suc 0) 0x5a4f 5;
      Block (Suc 0) 0x3724 6;
      CALL abort_acode
    ELSE
      Block 8 0x5a67 7;
      Block (Suc 0) 0x5a68 8;
      CALL memcpy_acode;
      Block (Suc 0) 0x5a69 9
    FI
  \<close>

schematic_goal "qemu_strndup":
  assumes
    \<open>\<forall>\<sigma>. RIP \<sigma> = 0x5a31 \<longrightarrow> P_0x5a31_1_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x5a36 \<longrightarrow> P_0x5a36_2_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x5a47 \<longrightarrow> P_0x5a47_3_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x5a4c \<longrightarrow> P_0x5a4c_4_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x5a4f \<longrightarrow> P_0x5a4f_true_5_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x3724 \<longrightarrow> P_0x3724_6_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x5a4f \<longrightarrow> P_0x5a4f_false_7_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x5a68 \<longrightarrow> P_0x5a68_8_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x5a69 \<longrightarrow> P_0x5a69_9_regions \<sigma>\<close>
    and [blocks]: \<open>{{Q_memchr_addr_0x5a31_1}} \<box>memchr_acode {{P_0x5a36_2;M_0x5a31}}\<close>
    and [blocks]: \<open>{{Q_malloc_addr_0x5a47_3}} \<box>malloc_acode {{P_0x5a4c_4;M_0x5a47}}\<close>
    and [blocks]: \<open>{{Q_abort_addr_0x3724_6}} \<box>abort_acode {{Q_fail;M_0x3724}}\<close>
    and [blocks]: \<open>{{Q_memcpy_addr_0x5a68_8}} \<box>memcpy_acode {{P_0x5a69_9;M_0x5a68}}\<close>
  shows \<open>{{?P}} qemu_strndup_acode {{?Q;?M}}\<close>
  by (vcg acode: qemu_strndup_acode_def assms: assms)

end
