theory qemu_memalign
  imports Main
    "~/Documents/research/devel/VT/assembly/isabelle/VCG/HTriple"
begin


locale "qemu_img_xen" = execution_context + exec_code +
  fixes posix_memalign_0x53d0_retval\<^sub>v stack_chk_fail_0x53f7_retval\<^sub>v stack_chk_fail_addr posix_memalign_addr :: \<open>64 word\<close>
    and stack_chk_fail_acode posix_memalign_acode :: ACode
  assumes fetch:
    "fetch 0x53b0 \<equiv> (Binary (IS_8088 Sub) (Reg (General SixtyFour rsp)) (Immediate SixtyFour (ImmVal 24)), 4)"
    "fetch 0x53b4 \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour rax)) (Storage (Reg (General SixtyFour rdi))), 3)"
    "fetch 0x53b7 \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour rdx)) (Storage (Reg (General SixtyFour rsi))), 3)"
    "fetch 0x53ba \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour rcx)) (Storage (Memory SixtyFour (A_SizeDirective 64 (A_Plus (A_FromReg (General SixtyFour fs)) (A_WordConstant 40))))), 9)"
    "fetch 0x53c3 \<equiv> (Binary (IS_8088 Mov) (Memory SixtyFour (A_SizeDirective 64 (A_Plus (A_FromReg (General SixtyFour rsp)) (A_WordConstant 8)))) (Storage (Reg (General SixtyFour rcx))), 5)"
    "fetch 0x53c8 \<equiv> (Binary (IS_8088 Xor) (Reg (General ThirtyTwo rcx)) (Storage (Reg (General ThirtyTwo rcx))), 2)"
    "fetch 0x53ca \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour rdi)) (Storage (Reg (General SixtyFour rsp))), 3)"
    "fetch 0x53cd \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour rsi)) (Storage (Reg (General SixtyFour rax))), 3)"
    "fetch 0x53d0 \<equiv> (Unary (IS_8088 Call) (Immediate SixtyFour (ImmLabel ''posix_memalign'')), 5)"
    "fetch 0x53d5 \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour rdx)) (Storage (Memory SixtyFour (A_SizeDirective 64 (A_FromReg (General SixtyFour rsp))))), 4)"
    "fetch 0x53d9 \<equiv> (Binary (IS_8088 Test) (Reg (General ThirtyTwo rax)) (Storage (Reg (General ThirtyTwo rax))), 2)"
    "fetch 0x53db \<equiv> (Unary (IS_8088 Je) (Immediate SixtyFour (ImmVal 21471)), 2)"
    "fetch 0x53dd \<equiv> (Binary (IS_8088 Xor) (Reg (General ThirtyTwo rdx)) (Storage (Reg (General ThirtyTwo rdx))), 2)"
    "fetch 0x53df \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour rcx)) (Storage (Memory SixtyFour (A_SizeDirective 64 (A_Plus (A_FromReg (General SixtyFour rsp)) (A_WordConstant 8))))), 5)"
    "fetch 0x53e4 \<equiv> (Binary (IS_8088 Xor) (Reg (General SixtyFour rcx)) (Storage (Memory SixtyFour (A_SizeDirective 64 (A_Plus (A_FromReg (General SixtyFour fs)) (A_WordConstant 40))))), 9)"
    "fetch 0x53ed \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour rax)) (Storage (Reg (General SixtyFour rdx))), 3)"
    "fetch 0x53f0 \<equiv> (Unary (IS_8088 Jne) (Immediate SixtyFour (ImmVal 21495)), 2)"
    "fetch 0x53f2 \<equiv> (Binary (IS_8088 Add) (Reg (General SixtyFour rsp)) (Immediate SixtyFour (ImmVal 24)), 4)"
    "fetch 0x53f6 \<equiv> (Nullary (IS_8088 Ret), 1)"
    "fetch 0x53f7 \<equiv> (Unary (IS_8088 Call) (Immediate SixtyFour (ImmLabel ''__stack_chk_fail'')), 5)"
    and \<alpha>_def: \<open>\<alpha> = \<lparr>text_sections = [], data_sections = [], labels_to_offsets = [], binary_offset = 0\<rparr>\<close>
    and stack_chk_fail\<^sub>a\<^sub>d\<^sub>d\<^sub>r[simp]: \<open>the (label_to_address \<alpha> ''__stack_chk_fail'') = stack_chk_fail_addr\<close>
    and posix_memalign\<^sub>a\<^sub>d\<^sub>d\<^sub>r[simp]: \<open>the (label_to_address \<alpha> ''posix_memalign'') = posix_memalign_addr\<close>
begin

text \<open>Using definitions that don't get unfolded immediately prevents locale argument issues.\<close>
definition \<open>posix_memalign_0x53d0_retval \<equiv> posix_memalign_0x53d0_retval\<^sub>v\<close>
definition \<open>stack_chk_fail_0x53f7_retval \<equiv> stack_chk_fail_0x53f7_retval\<^sub>v\<close>

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

locale "qemu_memalign" = "qemu_img_xen" +
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

definition P_0x53b0_0 :: state_pred where
  \<open>P_0x53b0_0 \<sigma> \<equiv> RIP \<sigma> = 0x53b0 \<and> RAX \<sigma> = RAX\<^sub>0 \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = RDX\<^sub>0 \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = RSP\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address\<close>
declare P_0x53b0_0_def[Ps]

definition P_0x53b0_0_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x53b0_0_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((FS\<^sub>0::64 word) + 0x28), 8),
    (2, ((RSP\<^sub>0::64 word) - 0x10), 8)
  }\<close>

definition P_0x53b0_0_regions :: state_pred where
  \<open>P_0x53b0_0_regions \<sigma> \<equiv> \<exists>regions. P_0x53b0_0_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x53d0_0 :: state_pred where
  \<open>Q_0x53d0_0 \<sigma> \<equiv> RIP \<sigma> = 0x53d0 \<and> RAX \<sigma> = RDI\<^sub>0 \<and> RCX \<sigma> = 0x0 \<and> RDX \<sigma> = RSI\<^sub>0 \<and> RDI \<sigma> = ((RSP\<^sub>0::64 word) - 0x18) \<and> RSI \<sigma> = RDI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x18) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word)\<close>
declare Q_0x53d0_0_def[Qs]

schematic_goal qemu_memalign_0_8_0x53b0_0x53cd_0[blocks]:
  assumes \<open>(P_0x53b0_0 && P_0x53b0_0_regions) \<sigma>\<close>
  shows \<open>exec_block 8 0x53cd 0 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x53d0_0 ?\<sigma> \<and> block_usage P_0x53b0_0_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x53b0_0_def P_0x53b0_0_regions_def post: Q_0x53d0_0_def regionset: P_0x53b0_0_regions_set_def)

definition P_0x53d0_1 :: state_pred where
  \<open>P_0x53d0_1 \<sigma> \<equiv> RIP \<sigma> = 0x53d0 \<and> RAX \<sigma> = RDI\<^sub>0 \<and> RCX \<sigma> = 0x0 \<and> RDX \<sigma> = RSI\<^sub>0 \<and> RDI \<sigma> = ((RSP\<^sub>0::64 word) - 0x18) \<and> RSI \<sigma> = RDI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x18) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word)\<close>
declare P_0x53d0_1_def[Ps]

definition P_0x53d0_1_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x53d0_1_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((FS\<^sub>0::64 word) + 0x28), 8),
    (2, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x20), 8)
  }\<close>

definition P_0x53d0_1_regions :: state_pred where
  \<open>P_0x53d0_1_regions \<sigma> \<equiv> \<exists>regions. P_0x53d0_1_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_posix_memalign_addr_0x53d0_1 :: state_pred where
  \<open>Q_posix_memalign_addr_0x53d0_1 \<sigma> \<equiv> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x20) \<and> RIP \<sigma> = posix_memalign_addr \<and> RAX \<sigma> = RDI\<^sub>0 \<and> RCX \<sigma> = 0x0 \<and> RDX \<sigma> = RSI\<^sub>0 \<and> RDI \<sigma> = ((RSP\<^sub>0::64 word) - 0x18) \<and> RSI \<sigma> = RDI\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = 0x53d5\<close>
declare Q_posix_memalign_addr_0x53d0_1_def[Qs]

schematic_goal qemu_memalign_0_1_0x53d0_0x53d0_1[blocks]:
  assumes \<open>(P_0x53d0_1 && P_0x53d0_1_regions) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x53d0 (Suc 0) \<sigma> \<triangleq> ?\<sigma> \<and> Q_posix_memalign_addr_0x53d0_1 ?\<sigma> \<and> block_usage P_0x53d0_1_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x53d0_1_def P_0x53d0_1_regions_def post: Q_posix_memalign_addr_0x53d0_1_def regionset: P_0x53d0_1_regions_set_def)

definition P_0x53d5_2 :: state_pred where
  \<open>P_0x53d5_2 \<sigma> \<equiv> RIP \<sigma> = 0x53d5 \<and> RAX \<sigma> = posix_memalign_0x53d0_retval \<and> RCX \<sigma> = 0x0 \<and> RDX \<sigma> = RSI\<^sub>0 \<and> RDI \<sigma> = ((RSP\<^sub>0::64 word) - 0x18) \<and> RSI \<sigma> = RDI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x18) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = 0x53d5\<close>
declare P_0x53d5_2_def[Ps]

definition P_0x53d5_2_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x53d5_2_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((FS\<^sub>0::64 word) + 0x28), 8),
    (2, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x20), 8)
  }\<close>

definition P_0x53d5_2_regions :: state_pred where
  \<open>P_0x53d5_2_regions \<sigma> \<equiv> \<exists>regions. P_0x53d5_2_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x53db_2 :: state_pred where
  \<open>Q_0x53db_2 \<sigma> \<equiv> RIP \<sigma> = 0x53db \<and> RAX \<sigma> = posix_memalign_0x53d0_retval \<and> RCX \<sigma> = 0x0 \<and> RDX \<sigma> = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) \<and> RDI \<sigma> = ((RSP\<^sub>0::64 word) - 0x18) \<and> RSI \<sigma> = RDI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x18) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = 0x53d5\<close>
declare Q_0x53db_2_def[Qs]

schematic_goal qemu_memalign_0_2_0x53d5_0x53d9_2[blocks]:
  assumes \<open>(P_0x53d5_2 && P_0x53d5_2_regions) \<sigma>\<close>
  shows \<open>exec_block 2 0x53d9 2 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x53db_2 ?\<sigma> \<and> block_usage P_0x53d5_2_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x53d5_2_def P_0x53d5_2_regions_def post: Q_0x53db_2_def regionset: P_0x53d5_2_regions_set_def)

definition P_0x53db_true_3 :: state_pred where
  \<open>P_0x53db_true_3 \<sigma> \<equiv> RIP \<sigma> = 0x53db \<and> RAX \<sigma> = posix_memalign_0x53d0_retval \<and> RCX \<sigma> = 0x0 \<and> RDX \<sigma> = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) \<and> RDI \<sigma> = ((RSP\<^sub>0::64 word) - 0x18) \<and> RSI \<sigma> = RDI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x18) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = 0x53d5\<close>
declare P_0x53db_true_3_def[Ps]

definition P_0x53db_true_3_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x53db_true_3_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((FS\<^sub>0::64 word) + 0x28), 8),
    (2, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x20), 8)
  }\<close>

definition P_0x53db_true_3_regions :: state_pred where
  \<open>P_0x53db_true_3_regions \<sigma> \<equiv> \<exists>regions. P_0x53db_true_3_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x53df_3 :: state_pred where
  \<open>Q_0x53df_3 \<sigma> \<equiv> RIP \<sigma> = 0x53df \<and> RAX \<sigma> = posix_memalign_0x53d0_retval \<and> RCX \<sigma> = 0x0 \<and> RDI \<sigma> = ((RSP\<^sub>0::64 word) - 0x18) \<and> RSI \<sigma> = RDI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x18) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = 0x53d5\<close>
declare Q_0x53df_3_def[Qs]

schematic_goal qemu_memalign_0_1_0x53db_0x53db_3[blocks]:
  assumes \<open>(P_0x53db_true_3 && P_0x53db_true_3_regions && ZF) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x53db 3 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x53df_3 ?\<sigma> \<and> block_usage P_0x53db_true_3_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x53db_true_3_def P_0x53db_true_3_regions_def post: Q_0x53df_3_def regionset: P_0x53db_true_3_regions_set_def)

definition P_0x53db_false_4 :: state_pred where
  \<open>P_0x53db_false_4 \<sigma> \<equiv> RIP \<sigma> = 0x53db \<and> RAX \<sigma> = posix_memalign_0x53d0_retval \<and> RCX \<sigma> = 0x0 \<and> RDX \<sigma> = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) \<and> RDI \<sigma> = ((RSP\<^sub>0::64 word) - 0x18) \<and> RSI \<sigma> = RDI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x18) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = 0x53d5\<close>
declare P_0x53db_false_4_def[Ps]

definition P_0x53db_false_4_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x53db_false_4_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((FS\<^sub>0::64 word) + 0x28), 8),
    (2, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x20), 8)
  }\<close>

definition P_0x53db_false_4_regions :: state_pred where
  \<open>P_0x53db_false_4_regions \<sigma> \<equiv> \<exists>regions. P_0x53db_false_4_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x53df_4 :: state_pred where
  \<open>Q_0x53df_4 \<sigma> \<equiv> RIP \<sigma> = 0x53df \<and> RAX \<sigma> = posix_memalign_0x53d0_retval \<and> RCX \<sigma> = 0x0 \<and> RDI \<sigma> = ((RSP\<^sub>0::64 word) - 0x18) \<and> RSI \<sigma> = RDI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x18) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = 0x53d5\<close>
declare Q_0x53df_4_def[Qs]

schematic_goal qemu_memalign_0_2_0x53db_0x53dd_4[blocks]:
  assumes \<open>(P_0x53db_false_4 && P_0x53db_false_4_regions && ! ZF) \<sigma>\<close>
  shows \<open>exec_block 2 0x53dd 4 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x53df_4 ?\<sigma> \<and> block_usage P_0x53db_false_4_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x53db_false_4_def P_0x53db_false_4_regions_def post: Q_0x53df_4_def regionset: P_0x53db_false_4_regions_set_def)

definition P_0x53df_5 :: state_pred where
  \<open>P_0x53df_5 \<sigma> \<equiv> RIP \<sigma> = 0x53df \<and> RAX \<sigma> = posix_memalign_0x53d0_retval \<and> RCX \<sigma> = 0x0 \<and> RDI \<sigma> = ((RSP\<^sub>0::64 word) - 0x18) \<and> RSI \<sigma> = RDI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x18) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = 0x53d5\<close>
declare P_0x53df_5_def[Ps]

definition P_0x53df_5_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x53df_5_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((FS\<^sub>0::64 word) + 0x28), 8),
    (2, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x20), 8)
  }\<close>

definition P_0x53df_5_regions :: state_pred where
  \<open>P_0x53df_5_regions \<sigma> \<equiv> \<exists>regions. P_0x53df_5_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x53f0_5 :: state_pred where
  \<open>Q_0x53f0_5 \<sigma> \<equiv> RIP \<sigma> = 0x53f0 \<and> RAX \<sigma> = RDX \<sigma> \<and> RCX \<sigma> = 0x0 \<and> RDI \<sigma> = ((RSP\<^sub>0::64 word) - 0x18) \<and> RSI \<sigma> = RDI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x18) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = 0x53d5\<close>
declare Q_0x53f0_5_def[Qs]

schematic_goal qemu_memalign_0_3_0x53df_0x53ed_5[blocks]:
  assumes \<open>(P_0x53df_5 && P_0x53df_5_regions) \<sigma>\<close>
  shows \<open>exec_block 3 0x53ed 5 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x53f0_5 ?\<sigma> \<and> block_usage P_0x53df_5_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x53df_5_def P_0x53df_5_regions_def post: Q_0x53f0_5_def regionset: P_0x53df_5_regions_set_def)

definition P_0x53f0_true_6 :: state_pred where
  \<open>P_0x53f0_true_6 \<sigma> \<equiv> RIP \<sigma> = 0x53f0 \<and> RAX \<sigma> = RDX \<sigma> \<and> RCX \<sigma> = 0x0 \<and> RDI \<sigma> = ((RSP\<^sub>0::64 word) - 0x18) \<and> RSI \<sigma> = RDI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x18) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = 0x53d5\<close>
declare P_0x53f0_true_6_def[Ps]

definition P_0x53f0_true_6_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x53f0_true_6_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((FS\<^sub>0::64 word) + 0x28), 8),
    (2, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x20), 8)
  }\<close>

definition P_0x53f0_true_6_regions :: state_pred where
  \<open>P_0x53f0_true_6_regions \<sigma> \<equiv> \<exists>regions. P_0x53f0_true_6_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x53f7_6 :: state_pred where
  \<open>Q_0x53f7_6 \<sigma> \<equiv> RIP \<sigma> = 0x53f7 \<and> RAX \<sigma> = RDX \<sigma> \<and> RCX \<sigma> = 0x0 \<and> RDI \<sigma> = ((RSP\<^sub>0::64 word) - 0x18) \<and> RSI \<sigma> = RDI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x18) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = 0x53d5\<close>
declare Q_0x53f7_6_def[Qs]

schematic_goal qemu_memalign_0_1_0x53f0_0x53f0_6[blocks]:
  assumes \<open>(P_0x53f0_true_6 && P_0x53f0_true_6_regions && !ZF) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x53f0 6 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x53f7_6 ?\<sigma> \<and> block_usage P_0x53f0_true_6_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x53f0_true_6_def P_0x53f0_true_6_regions_def post: Q_0x53f7_6_def regionset: P_0x53f0_true_6_regions_set_def)

definition P_0x53f7_7 :: state_pred where
  \<open>P_0x53f7_7 \<sigma> \<equiv> RIP \<sigma> = 0x53f7 \<and> RAX \<sigma> = RDX \<sigma> \<and> RCX \<sigma> = 0x0 \<and> RDI \<sigma> = ((RSP\<^sub>0::64 word) - 0x18) \<and> RSI \<sigma> = RDI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x18) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = 0x53d5\<close>
declare P_0x53f7_7_def[Ps]

definition P_0x53f7_7_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x53f7_7_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((FS\<^sub>0::64 word) + 0x28), 8),
    (2, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x20), 8)
  }\<close>

definition P_0x53f7_7_regions :: state_pred where
  \<open>P_0x53f7_7_regions \<sigma> \<equiv> \<exists>regions. P_0x53f7_7_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_stack_chk_fail_addr_0x53f7_7 :: state_pred where
  \<open>Q_stack_chk_fail_addr_0x53f7_7 \<sigma> \<equiv> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x20) \<and> RIP \<sigma> = stack_chk_fail_addr \<and> RAX \<sigma> = RDX \<sigma> \<and> RCX \<sigma> = 0x0 \<and> RDI \<sigma> = ((RSP\<^sub>0::64 word) - 0x18) \<and> RSI \<sigma> = RDI\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word)\<close>
declare Q_stack_chk_fail_addr_0x53f7_7_def[Qs]

schematic_goal qemu_memalign_0_1_0x53f7_0x53f7_7[blocks]:
  assumes \<open>(P_0x53f7_7 && P_0x53f7_7_regions) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x53f7 7 \<sigma> \<triangleq> ?\<sigma> \<and> Q_stack_chk_fail_addr_0x53f7_7 ?\<sigma> \<and> block_usage P_0x53f7_7_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x53f7_7_def P_0x53f7_7_regions_def post: Q_stack_chk_fail_addr_0x53f7_7_def regionset: P_0x53f7_7_regions_set_def)

definition P_0x53f0_false_8 :: state_pred where
  \<open>P_0x53f0_false_8 \<sigma> \<equiv> RIP \<sigma> = 0x53f0 \<and> RAX \<sigma> = RDX \<sigma> \<and> RCX \<sigma> = 0x0 \<and> RDI \<sigma> = ((RSP\<^sub>0::64 word) - 0x18) \<and> RSI \<sigma> = RDI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x18) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = 0x53d5\<close>
declare P_0x53f0_false_8_def[Ps]

definition P_0x53f0_false_8_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x53f0_false_8_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((FS\<^sub>0::64 word) + 0x28), 8),
    (2, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x20), 8)
  }\<close>

definition P_0x53f0_false_8_regions :: state_pred where
  \<open>P_0x53f0_false_8_regions \<sigma> \<equiv> \<exists>regions. P_0x53f0_false_8_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_ret_address_8 :: state_pred where
  \<open>Q_ret_address_8 \<sigma> \<equiv> RIP \<sigma> = ret_address \<and> RCX \<sigma> = 0x0 \<and> RDI \<sigma> = ((RSP\<^sub>0::64 word) - 0x18) \<and> RSI \<sigma> = RDI\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word)\<close>
declare Q_ret_address_8_def[Qs]

schematic_goal qemu_memalign_0_3_0x53f0_0x53f6_8[blocks]:
  assumes \<open>(P_0x53f0_false_8 && P_0x53f0_false_8_regions && ! !ZF) \<sigma>\<close>
  shows \<open>exec_block 3 0x53f6 8 \<sigma> \<triangleq> ?\<sigma> \<and> Q_ret_address_8 ?\<sigma> \<and> block_usage P_0x53f0_false_8_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x53f0_false_8_def P_0x53f0_false_8_regions_def post: Q_ret_address_8_def regionset: P_0x53f0_false_8_regions_set_def)

definition qemu_memalign_acode :: ACode where
  \<open>qemu_memalign_acode =
    Block 8 0x53cd 0;
    Block (Suc 0) 0x53d0 (Suc 0);
    CALL posix_memalign_acode;
    Block 2 0x53d9 2;
    IF ZF THEN
      Block (Suc 0) 0x53db 3
    ELSE
      Block 2 0x53dd 4
    FI;
    Block 3 0x53ed 5;
    IF !ZF THEN
      Block (Suc 0) 0x53f0 6;
      Block (Suc 0) 0x53f7 7;
      CALL stack_chk_fail_acode
    ELSE
      Block 3 0x53f6 8
    FI
  \<close>

schematic_goal "qemu_memalign":
  assumes
    \<open>\<forall>\<sigma>. RIP \<sigma> = 0x53d0 \<longrightarrow> P_0x53d0_1_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x53d5 \<longrightarrow> P_0x53d5_2_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x53db \<longrightarrow> P_0x53db_true_3_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x53db \<longrightarrow> P_0x53db_false_4_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x53df \<longrightarrow> P_0x53df_5_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x53f0 \<longrightarrow> P_0x53f0_true_6_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x53f7 \<longrightarrow> P_0x53f7_7_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x53f0 \<longrightarrow> P_0x53f0_false_8_regions \<sigma>\<close>
    and [blocks]: \<open>{{Q_posix_memalign_addr_0x53d0_1}} \<box>posix_memalign_acode {{P_0x53d5_2;M_0x53d0}}\<close>
    and [blocks]: \<open>{{Q_stack_chk_fail_addr_0x53f7_7}} \<box>stack_chk_fail_acode {{Q_fail;M_0x53f7}}\<close>
  shows \<open>{{?P}} qemu_memalign_acode {{?Q;?M}}\<close>
  by (vcg acode: qemu_memalign_acode_def assms: assms)

end

