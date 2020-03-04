theory get_tmp_filename
  imports
    "../../../isabelle/VCG/HTriple"
begin

locale "qemu_img_xen" = execution_context + exec_code +
  fixes getenv_0x180e2_retval\<^sub>v snprintf_chk_0x18110_retval\<^sub>v mkstemp64_0x18118_retval\<^sub>v close_0x18125_retval\<^sub>v snprintf_chk_addr close_addr getenv_addr mkstemp64_addr :: \<open>64 word\<close>
    and snprintf_chk_acode close_acode getenv_acode mkstemp64_acode :: ACode
  assumes fetch:
    "fetch 0x180d0 \<equiv> (Unary (IS_8088 Push) (Storage (Reg (General SixtyFour rbp))), 1)"
    "fetch 0x180d1 \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour rbp)) (Storage (Reg (General SixtyFour rdi))), 3)"
    "fetch 0x180d4 \<equiv> (Binary (IS_8088 Lea) (Reg (General SixtyFour rdi)) (Storage (Memory SixtyFour (A_Plus (A_FromReg (General SixtyFour rip)) (A_WordConstant 39082)))), 7)"
    "fetch 0x180db \<equiv> (Unary (IS_8088 Push) (Storage (Reg (General SixtyFour rbx))), 1)"
    "fetch 0x180dc \<equiv> (Binary (IS_8088 Mov) (Reg (General ThirtyTwo rbx)) (Storage (Reg (General ThirtyTwo rsi))), 2)"
    "fetch 0x180de \<equiv> (Binary (IS_8088 Sub) (Reg (General SixtyFour rsp)) (Immediate SixtyFour (ImmVal 8)), 4)"
    "fetch 0x180e2 \<equiv> (Unary (IS_8088 Call) (Immediate SixtyFour (ImmLabel ''getenv'')), 5)"
    "fetch 0x180e7 \<equiv> (Binary (IS_X86_64 Movsxd) (Reg (General SixtyFour rsi)) (Storage (Reg (General ThirtyTwo rbx))), 3)"
    "fetch 0x180ea \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour rdi)) (Storage (Reg (General SixtyFour rbp))), 3)"
    "fetch 0x180ed \<equiv> (Binary (IS_8088 Mov) (Reg (General ThirtyTwo rdx)) (Immediate SixtyFour (ImmVal 1)), 5)"
    "fetch 0x180f2 \<equiv> (Binary (IS_8088 Test) (Reg (General SixtyFour rax)) (Storage (Reg (General SixtyFour rax))), 3)"
    "fetch 0x180f5 \<equiv> (Binary (IS_8088 Lea) (Reg (General SixtyFour r9)) (Storage (Memory SixtyFour (A_Plus (A_FromReg (General SixtyFour rip)) (A_WordConstant 39044)))), 7)"
    "fetch 0x180fc \<equiv> (Binary (IS_8088 Lea) (Reg (General SixtyFour r8)) (Storage (Memory SixtyFour (A_Plus (A_FromReg (General SixtyFour rip)) (A_WordConstant 39049)))), 7)"
    "fetch 0x18103 \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour rcx)) (Immediate SixtyFour (ImmVal 18446744073709551615)), 7)"
    "fetch 0x1810a \<equiv> (Binary (IS_PentiumPro Cmovne) (Reg (General SixtyFour r9)) (Storage (Reg (General SixtyFour rax))), 4)"
    "fetch 0x1810e \<equiv> (Binary (IS_8088 Xor) (Reg (General ThirtyTwo rax)) (Storage (Reg (General ThirtyTwo rax))), 2)"
    "fetch 0x18110 \<equiv> (Unary (IS_8088 Call) (Immediate SixtyFour (ImmLabel ''__snprintf_chk'')), 5)"
    "fetch 0x18115 \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour rdi)) (Storage (Reg (General SixtyFour rbp))), 3)"
    "fetch 0x18118 \<equiv> (Unary (IS_8088 Call) (Immediate SixtyFour (ImmLabel ''mkstemp64'')), 5)"
    "fetch 0x1811d \<equiv> (Binary (IS_8088 Add) (Reg (General SixtyFour rsp)) (Immediate SixtyFour (ImmVal 8)), 4)"
    "fetch 0x18121 \<equiv> (Unary (IS_8088 Pop) (Storage (Reg (General SixtyFour rbx))), 1)"
    "fetch 0x18122 \<equiv> (Binary (IS_8088 Mov) (Reg (General ThirtyTwo rdi)) (Storage (Reg (General ThirtyTwo rax))), 2)"
    "fetch 0x18124 \<equiv> (Unary (IS_8088 Pop) (Storage (Reg (General SixtyFour rbp))), 1)"
    "fetch 0x18125 \<equiv> (Unary (IS_8088 Call) (Immediate SixtyFour (ImmLabel ''close'')), 1)"
    "fetch 0x18126 \<equiv> (Nullary (IS_8088 Ret), 4)"
    and \<alpha>_def: \<open>\<alpha> = \<lparr>text_sections = [], data_sections = [], labels_to_offsets = [], binary_offset = 0\<rparr>\<close>
    and snprintf_chk\<^sub>a\<^sub>d\<^sub>d\<^sub>r[simp]: \<open>the (label_to_address \<alpha> ''__snprintf_chk'') = snprintf_chk_addr\<close>
    and close\<^sub>a\<^sub>d\<^sub>d\<^sub>r[simp]: \<open>the (label_to_address \<alpha> ''close'') = close_addr\<close>
    and getenv\<^sub>a\<^sub>d\<^sub>d\<^sub>r[simp]: \<open>the (label_to_address \<alpha> ''getenv'') = getenv_addr\<close>
    and mkstemp64\<^sub>a\<^sub>d\<^sub>d\<^sub>r[simp]: \<open>the (label_to_address \<alpha> ''mkstemp64'') = mkstemp64_addr\<close>
begin

text \<open>Using definitions that don't get unfolded immediately prevents locale argument issues.\<close>
definition \<open>getenv_0x180e2_retval \<equiv> getenv_0x180e2_retval\<^sub>v\<close>
definition \<open>snprintf_chk_0x18110_retval \<equiv> snprintf_chk_0x18110_retval\<^sub>v\<close>
definition \<open>mkstemp64_0x18118_retval \<equiv> mkstemp64_0x18118_retval\<^sub>v\<close>
definition \<open>close_0x18125_retval \<equiv> close_0x18125_retval\<^sub>v\<close>

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

locale "get_tmp_filename" = "qemu_img_xen" +
  fixes RAX\<^sub>0\<^sub>v RBX\<^sub>0\<^sub>v RCX\<^sub>0\<^sub>v RDX\<^sub>0\<^sub>v RDI\<^sub>0\<^sub>v RSI\<^sub>0\<^sub>v RSP\<^sub>0\<^sub>v RBP\<^sub>0\<^sub>v R9\<^sub>0\<^sub>v R8\<^sub>0\<^sub>v ret_address\<^sub>v :: \<open>64 word\<close>
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
definition \<open>R9\<^sub>0 \<equiv> R9\<^sub>0\<^sub>v\<close>
definition \<open>R8\<^sub>0 \<equiv> R8\<^sub>0\<^sub>v\<close>
definition \<open>ret_address \<equiv> ret_address\<^sub>v\<close>

definition P_0x180d0_0 :: state_pred where
  \<open>P_0x180d0_0 \<sigma> \<equiv> RIP \<sigma> = 0x180d0 \<and> RAX \<sigma> = RAX\<^sub>0 \<and> RBX \<sigma> = RBX\<^sub>0 \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = RDX\<^sub>0 \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = RSP\<^sub>0 \<and> RBP \<sigma> = RBP\<^sub>0 \<and> R9 \<sigma> = R9\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address\<close>
declare P_0x180d0_0_def[Ps]

definition P_0x180d0_0_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x180d0_0_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (2, ((RSP\<^sub>0::64 word) - 0x10), 8)
  }\<close>

definition P_0x180d0_0_regions :: state_pred where
  \<open>P_0x180d0_0_regions \<sigma> \<equiv> \<exists>regions. P_0x180d0_0_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x180e2_0 :: state_pred where
  \<open>Q_0x180e2_0 \<sigma> \<equiv> RIP \<sigma> = 0x180e2 \<and> RAX \<sigma> = RAX\<^sub>0 \<and> RBX \<sigma> = ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)) \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = RDX\<^sub>0 \<and> RDI \<sigma> = 0x21985 \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x18) \<and> RBP \<sigma> = RDI\<^sub>0 \<and> R9 \<sigma> = R9\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = RBX\<^sub>0\<close>
declare Q_0x180e2_0_def[Qs]

schematic_goal get_tmp_filename_0_6_0x180d0_0x180de_0[blocks]:
  assumes \<open>(P_0x180d0_0 && P_0x180d0_0_regions) \<sigma>\<close>
  shows \<open>exec_block 6 0x180de 0 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x180e2_0 ?\<sigma> \<and> block_usage P_0x180d0_0_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x180d0_0_def P_0x180d0_0_regions_def post: Q_0x180e2_0_def regionset: P_0x180d0_0_regions_set_def)

definition P_0x180e2_1 :: state_pred where
  \<open>P_0x180e2_1 \<sigma> \<equiv> RIP \<sigma> = 0x180e2 \<and> RAX \<sigma> = RAX\<^sub>0 \<and> RBX \<sigma> = ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)) \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = RDX\<^sub>0 \<and> RDI \<sigma> = 0x21985 \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x18) \<and> RBP \<sigma> = RDI\<^sub>0 \<and> R9 \<sigma> = R9\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = RBX\<^sub>0\<close>
declare P_0x180e2_1_def[Ps]

definition P_0x180e2_1_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x180e2_1_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (2, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x20), 8)
  }\<close>

definition P_0x180e2_1_regions :: state_pred where
  \<open>P_0x180e2_1_regions \<sigma> \<equiv> \<exists>regions. P_0x180e2_1_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_getenv_addr_0x180e2_1 :: state_pred where
  \<open>Q_getenv_addr_0x180e2_1 \<sigma> \<equiv> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x20) \<and> RIP \<sigma> = getenv_addr \<and> RAX \<sigma> = RAX\<^sub>0 \<and> RBX \<sigma> = ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)) \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = RDX\<^sub>0 \<and> RDI \<sigma> = 0x21985 \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RBP \<sigma> = RDI\<^sub>0 \<and> R9 \<sigma> = R9\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = 0x180e7\<close>
declare Q_getenv_addr_0x180e2_1_def[Qs]

schematic_goal get_tmp_filename_0_1_0x180e2_0x180e2_1[blocks]:
  assumes \<open>(P_0x180e2_1 && P_0x180e2_1_regions) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x180e2 (Suc 0) \<sigma> \<triangleq> ?\<sigma> \<and> Q_getenv_addr_0x180e2_1 ?\<sigma> \<and> block_usage P_0x180e2_1_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x180e2_1_def P_0x180e2_1_regions_def post: Q_getenv_addr_0x180e2_1_def regionset: P_0x180e2_1_regions_set_def)

definition P_0x180e7_2 :: state_pred where
  \<open>P_0x180e7_2 \<sigma> \<equiv> RIP \<sigma> = 0x180e7 \<and> RAX \<sigma> = getenv_0x180e2_retval \<and> RBX \<sigma> = ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)) \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = RDX\<^sub>0 \<and> RDI \<sigma> = 0x21985 \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x18) \<and> RBP \<sigma> = RDI\<^sub>0 \<and> R9 \<sigma> = R9\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = 0x180e7\<close>
declare P_0x180e7_2_def[Ps]

definition P_0x180e7_2_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x180e7_2_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (2, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x20), 8)
  }\<close>

definition P_0x180e7_2_regions :: state_pred where
  \<open>P_0x180e7_2_regions \<sigma> \<equiv> \<exists>regions. P_0x180e7_2_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x18110_2 :: state_pred where
  \<open>Q_0x18110_2 \<sigma> \<equiv> RIP \<sigma> = 0x18110 \<and> RAX \<sigma> = 0x0 \<and> RBX \<sigma> = ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)) \<and> RCX \<sigma> = 0xffffffffffffffff \<and> RDX \<sigma> = 0x1 \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = (sextend (ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word))) 32 64::64 word) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x18) \<and> RBP \<sigma> = RDI\<^sub>0 \<and> R9 \<sigma> = (if' (getenv_0x180e2_retval::64 word) \<noteq> (ucast ((0x0::64 word))::64 word) then getenv_0x180e2_retval else (0x21980::64 word)) \<and> R8 \<sigma> = 0x2198c \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = 0x180e7\<close>
declare Q_0x18110_2_def[Qs]

schematic_goal get_tmp_filename_0_9_0x180e7_0x1810e_2[blocks]:
  assumes \<open>(P_0x180e7_2 && P_0x180e7_2_regions) \<sigma>\<close>
  shows \<open>exec_block 9 0x1810e 2 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x18110_2 ?\<sigma> \<and> block_usage P_0x180e7_2_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x180e7_2_def P_0x180e7_2_regions_def post: Q_0x18110_2_def regionset: P_0x180e7_2_regions_set_def)

definition P_0x18110_3 :: state_pred where
  \<open>P_0x18110_3 \<sigma> \<equiv> RIP \<sigma> = 0x18110 \<and> RAX \<sigma> = 0x0 \<and> RBX \<sigma> = ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)) \<and> RCX \<sigma> = 0xffffffffffffffff \<and> RDX \<sigma> = 0x1 \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = (sextend (ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word))) 32 64::64 word) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x18) \<and> RBP \<sigma> = RDI\<^sub>0 \<and> R9 \<sigma> = (if' (getenv_0x180e2_retval::64 word) \<noteq> (ucast ((0x0::64 word))::64 word) then getenv_0x180e2_retval else (0x21980::64 word)) \<and> R8 \<sigma> = 0x2198c \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = 0x180e7\<close>
declare P_0x18110_3_def[Ps]

definition P_0x18110_3_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x18110_3_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (2, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x20), 8)
  }\<close>

definition P_0x18110_3_regions :: state_pred where
  \<open>P_0x18110_3_regions \<sigma> \<equiv> \<exists>regions. P_0x18110_3_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_snprintf_chk_addr_0x18110_3 :: state_pred where
  \<open>Q_snprintf_chk_addr_0x18110_3 \<sigma> \<equiv> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x20) \<and> RIP \<sigma> = snprintf_chk_addr \<and> RAX \<sigma> = 0x0 \<and> RBX \<sigma> = ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)) \<and> RCX \<sigma> = 0xffffffffffffffff \<and> RDX \<sigma> = 0x1 \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = (sextend (ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word))) 32 64::64 word) \<and> RBP \<sigma> = RDI\<^sub>0 \<and> R9 \<sigma> = (if' (getenv_0x180e2_retval::64 word) \<noteq> (ucast ((0x0::64 word))::64 word) then getenv_0x180e2_retval else (0x21980::64 word)) \<and> R8 \<sigma> = 0x2198c \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = 0x18115\<close>
declare Q_snprintf_chk_addr_0x18110_3_def[Qs]

schematic_goal get_tmp_filename_0_1_0x18110_0x18110_3[blocks]:
  assumes \<open>(P_0x18110_3 && P_0x18110_3_regions) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x18110 3 \<sigma> \<triangleq> ?\<sigma> \<and> Q_snprintf_chk_addr_0x18110_3 ?\<sigma> \<and> block_usage P_0x18110_3_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x18110_3_def P_0x18110_3_regions_def post: Q_snprintf_chk_addr_0x18110_3_def regionset: P_0x18110_3_regions_set_def)

definition P_0x18115_4 :: state_pred where
  \<open>P_0x18115_4 \<sigma> \<equiv> RIP \<sigma> = 0x18115 \<and> RAX \<sigma> = snprintf_chk_0x18110_retval \<and> RBX \<sigma> = ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)) \<and> RCX \<sigma> = 0xffffffffffffffff \<and> RDX \<sigma> = 0x1 \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = (sextend (ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word))) 32 64::64 word) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x18) \<and> RBP \<sigma> = RDI\<^sub>0 \<and> R9 \<sigma> = (if' (getenv_0x180e2_retval::64 word) \<noteq> (ucast ((0x0::64 word))::64 word) then getenv_0x180e2_retval else (0x21980::64 word)) \<and> R8 \<sigma> = 0x2198c \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = 0x18115\<close>
declare P_0x18115_4_def[Ps]

definition P_0x18115_4_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x18115_4_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (2, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x20), 8)
  }\<close>

definition P_0x18115_4_regions :: state_pred where
  \<open>P_0x18115_4_regions \<sigma> \<equiv> \<exists>regions. P_0x18115_4_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x18118_4 :: state_pred where
  \<open>Q_0x18118_4 \<sigma> \<equiv> RIP \<sigma> = 0x18118 \<and> RAX \<sigma> = snprintf_chk_0x18110_retval \<and> RBX \<sigma> = ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)) \<and> RCX \<sigma> = 0xffffffffffffffff \<and> RDX \<sigma> = 0x1 \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = (sextend (ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word))) 32 64::64 word) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x18) \<and> RBP \<sigma> = RDI\<^sub>0 \<and> R9 \<sigma> = (if' (getenv_0x180e2_retval::64 word) \<noteq> (ucast ((0x0::64 word))::64 word) then getenv_0x180e2_retval else (0x21980::64 word)) \<and> R8 \<sigma> = 0x2198c \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = 0x18115\<close>
declare Q_0x18118_4_def[Qs]

schematic_goal get_tmp_filename_0_1_0x18115_0x18115_4[blocks]:
  assumes \<open>(P_0x18115_4 && P_0x18115_4_regions) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x18115 4 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x18118_4 ?\<sigma> \<and> block_usage P_0x18115_4_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x18115_4_def P_0x18115_4_regions_def post: Q_0x18118_4_def regionset: P_0x18115_4_regions_set_def)

definition P_0x18118_5 :: state_pred where
  \<open>P_0x18118_5 \<sigma> \<equiv> RIP \<sigma> = 0x18118 \<and> RAX \<sigma> = snprintf_chk_0x18110_retval \<and> RBX \<sigma> = ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)) \<and> RCX \<sigma> = 0xffffffffffffffff \<and> RDX \<sigma> = 0x1 \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = (sextend (ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word))) 32 64::64 word) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x18) \<and> RBP \<sigma> = RDI\<^sub>0 \<and> R9 \<sigma> = (if' (getenv_0x180e2_retval::64 word) \<noteq> (ucast ((0x0::64 word))::64 word) then getenv_0x180e2_retval else (0x21980::64 word)) \<and> R8 \<sigma> = 0x2198c \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = 0x18115\<close>
declare P_0x18118_5_def[Ps]

definition P_0x18118_5_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x18118_5_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (2, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x20), 8)
  }\<close>

definition P_0x18118_5_regions :: state_pred where
  \<open>P_0x18118_5_regions \<sigma> \<equiv> \<exists>regions. P_0x18118_5_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_mkstemp64_addr_0x18118_5 :: state_pred where
  \<open>Q_mkstemp64_addr_0x18118_5 \<sigma> \<equiv> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x20) \<and> RIP \<sigma> = mkstemp64_addr \<and> RAX \<sigma> = snprintf_chk_0x18110_retval \<and> RBX \<sigma> = ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)) \<and> RCX \<sigma> = 0xffffffffffffffff \<and> RDX \<sigma> = 0x1 \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = (sextend (ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word))) 32 64::64 word) \<and> RBP \<sigma> = RDI\<^sub>0 \<and> R9 \<sigma> = (if' (getenv_0x180e2_retval::64 word) \<noteq> (ucast ((0x0::64 word))::64 word) then getenv_0x180e2_retval else (0x21980::64 word)) \<and> R8 \<sigma> = 0x2198c \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = 0x1811d\<close>
declare Q_mkstemp64_addr_0x18118_5_def[Qs]

schematic_goal get_tmp_filename_0_1_0x18118_0x18118_5[blocks]:
  assumes \<open>(P_0x18118_5 && P_0x18118_5_regions) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x18118 5 \<sigma> \<triangleq> ?\<sigma> \<and> Q_mkstemp64_addr_0x18118_5 ?\<sigma> \<and> block_usage P_0x18118_5_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x18118_5_def P_0x18118_5_regions_def post: Q_mkstemp64_addr_0x18118_5_def regionset: P_0x18118_5_regions_set_def)

definition P_0x1811d_6 :: state_pred where
  \<open>P_0x1811d_6 \<sigma> \<equiv> RIP \<sigma> = 0x1811d \<and> RAX \<sigma> = mkstemp64_0x18118_retval \<and> RBX \<sigma> = ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)) \<and> RCX \<sigma> = 0xffffffffffffffff \<and> RDX \<sigma> = 0x1 \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = (sextend (ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word))) 32 64::64 word) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x18) \<and> RBP \<sigma> = RDI\<^sub>0 \<and> R9 \<sigma> = (if' (getenv_0x180e2_retval::64 word) \<noteq> (ucast ((0x0::64 word))::64 word) then getenv_0x180e2_retval else (0x21980::64 word)) \<and> R8 \<sigma> = 0x2198c \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = 0x1811d\<close>
declare P_0x1811d_6_def[Ps]

definition P_0x1811d_6_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x1811d_6_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (2, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x20), 8)
  }\<close>

definition P_0x1811d_6_regions :: state_pred where
  \<open>P_0x1811d_6_regions \<sigma> \<equiv> \<exists>regions. P_0x1811d_6_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x18125_6 :: state_pred where
  \<open>Q_0x18125_6 \<sigma> \<equiv> RIP \<sigma> = 0x18125 \<and> RAX \<sigma> = mkstemp64_0x18118_retval \<and> RBX \<sigma> = RBX\<^sub>0 \<and> RCX \<sigma> = 0xffffffffffffffff \<and> RDX \<sigma> = 0x1 \<and> RDI \<sigma> = ucast ((\<langle>31,0\<rangle>mkstemp64_0x18118_retval::32 word)) \<and> RSI \<sigma> = (sextend (ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word))) 32 64::64 word) \<and> RSP \<sigma> = RSP\<^sub>0 \<and> RBP \<sigma> = RBP\<^sub>0 \<and> R9 \<sigma> = (if' (getenv_0x180e2_retval::64 word) \<noteq> (ucast ((0x0::64 word))::64 word) then getenv_0x180e2_retval else (0x21980::64 word)) \<and> R8 \<sigma> = 0x2198c \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = 0x1811d\<close>
declare Q_0x18125_6_def[Qs]

schematic_goal get_tmp_filename_0_4_0x1811d_0x18124_6[blocks]:
  assumes \<open>(P_0x1811d_6 && P_0x1811d_6_regions) \<sigma>\<close>
  shows \<open>exec_block 4 0x18124 6 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x18125_6 ?\<sigma> \<and> block_usage P_0x1811d_6_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x1811d_6_def P_0x1811d_6_regions_def post: Q_0x18125_6_def regionset: P_0x1811d_6_regions_set_def)

definition P_0x18125_7 :: state_pred where
  \<open>P_0x18125_7 \<sigma> \<equiv> RIP \<sigma> = 0x18125 \<and> RAX \<sigma> = mkstemp64_0x18118_retval \<and> RBX \<sigma> = RBX\<^sub>0 \<and> RCX \<sigma> = 0xffffffffffffffff \<and> RDX \<sigma> = 0x1 \<and> RDI \<sigma> = ucast ((\<langle>31,0\<rangle>mkstemp64_0x18118_retval::32 word)) \<and> RSI \<sigma> = (sextend (ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word))) 32 64::64 word) \<and> RSP \<sigma> = RSP\<^sub>0 \<and> RBP \<sigma> = RBP\<^sub>0 \<and> R9 \<sigma> = (if' (getenv_0x180e2_retval::64 word) \<noteq> (ucast ((0x0::64 word))::64 word) then getenv_0x180e2_retval else (0x21980::64 word)) \<and> R8 \<sigma> = 0x2198c \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = 0x1811d\<close>
declare P_0x18125_7_def[Ps]

definition P_0x18125_7_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x18125_7_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (2, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x20), 8)
  }\<close>

definition P_0x18125_7_regions :: state_pred where
  \<open>P_0x18125_7_regions \<sigma> \<equiv> \<exists>regions. P_0x18125_7_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_close_addr_0x18125_7 :: state_pred where
  \<open>Q_close_addr_0x18125_7 \<sigma> \<equiv> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x8) \<and> RIP \<sigma> = close_addr \<and> RAX \<sigma> = mkstemp64_0x18118_retval \<and> RBX \<sigma> = RBX\<^sub>0 \<and> RCX \<sigma> = 0xffffffffffffffff \<and> RDX \<sigma> = 0x1 \<and> RDI \<sigma> = ucast ((\<langle>31,0\<rangle>mkstemp64_0x18118_retval::32 word)) \<and> RSI \<sigma> = (sextend (ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word))) 32 64::64 word) \<and> RBP \<sigma> = RBP\<^sub>0 \<and> R9 \<sigma> = (if' (getenv_0x180e2_retval::64 word) \<noteq> (ucast ((0x0::64 word))::64 word) then getenv_0x180e2_retval else (0x21980::64 word)) \<and> R8 \<sigma> = 0x2198c \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = 0x18126 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = 0x1811d\<close>
declare Q_close_addr_0x18125_7_def[Qs]

schematic_goal get_tmp_filename_0_1_0x18125_0x18125_7[blocks]:
  assumes \<open>(P_0x18125_7 && P_0x18125_7_regions) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x18125 7 \<sigma> \<triangleq> ?\<sigma> \<and> Q_close_addr_0x18125_7 ?\<sigma> \<and> block_usage P_0x18125_7_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x18125_7_def P_0x18125_7_regions_def post: Q_close_addr_0x18125_7_def regionset: P_0x18125_7_regions_set_def)

definition P_0x18126_8 :: state_pred where
  \<open>P_0x18126_8 \<sigma> \<equiv> RIP \<sigma> = 0x18126 \<and> RAX \<sigma> = close_0x18125_retval \<and> RBX \<sigma> = RBX\<^sub>0 \<and> RCX \<sigma> = 0xffffffffffffffff \<and> RDX \<sigma> = 0x1 \<and> RDI \<sigma> = ucast ((\<langle>31,0\<rangle>mkstemp64_0x18118_retval::32 word)) \<and> RSI \<sigma> = (sextend (ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word))) 32 64::64 word) \<and> RSP \<sigma> = RSP\<^sub>0 \<and> RBP \<sigma> = RBP\<^sub>0 \<and> R9 \<sigma> = (if' (getenv_0x180e2_retval::64 word) \<noteq> (ucast ((0x0::64 word))::64 word) then getenv_0x180e2_retval else (0x21980::64 word)) \<and> R8 \<sigma> = 0x2198c \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = 0x18126 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = 0x1811d\<close>
declare P_0x18126_8_def[Ps]

definition P_0x18126_8_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x18126_8_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (2, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x20), 8)
  }\<close>

definition P_0x18126_8_regions :: state_pred where
  \<open>P_0x18126_8_regions \<sigma> \<equiv> \<exists>regions. P_0x18126_8_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_ret_address_8 :: state_pred where
  \<open>Q_ret_address_8 \<sigma> \<equiv> RIP \<sigma> = ret_address \<and> RAX \<sigma> = close_0x18125_retval \<and> RBX \<sigma> = RBX\<^sub>0 \<and> RCX \<sigma> = 0xffffffffffffffff \<and> RDX \<sigma> = 0x1 \<and> RDI \<sigma> = ucast ((\<langle>31,0\<rangle>mkstemp64_0x18118_retval::32 word)) \<and> RSI \<sigma> = (sextend (ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word))) 32 64::64 word) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) + 0x8) \<and> RBP \<sigma> = RBP\<^sub>0 \<and> R9 \<sigma> = (if' (getenv_0x180e2_retval::64 word) \<noteq> (ucast ((0x0::64 word))::64 word) then getenv_0x180e2_retval else (0x21980::64 word)) \<and> R8 \<sigma> = 0x2198c \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = 0x18126 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = 0x1811d\<close>
declare Q_ret_address_8_def[Qs]

schematic_goal get_tmp_filename_0_1_0x18126_0x18126_8[blocks]:
  assumes \<open>(P_0x18126_8 && P_0x18126_8_regions) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x18126 8 \<sigma> \<triangleq> ?\<sigma> \<and> Q_ret_address_8 ?\<sigma> \<and> block_usage P_0x18126_8_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x18126_8_def P_0x18126_8_regions_def post: Q_ret_address_8_def regionset: P_0x18126_8_regions_set_def)

definition get_tmp_filename_acode :: ACode where
  \<open>get_tmp_filename_acode =
    Block 6 0x180de 0;
    Block (Suc 0) 0x180e2 (Suc 0);
    CALL getenv_acode;
    Block 9 0x1810e 2;
    Block (Suc 0) 0x18110 3;
    CALL snprintf_chk_acode;
    Block (Suc 0) 0x18115 4;
    Block (Suc 0) 0x18118 5;
    CALL mkstemp64_acode;
    Block 4 0x18124 6;
    Block (Suc 0) 0x18125 7;
    CALL close_acode;
    Block (Suc 0) 0x18126 8
  \<close>

schematic_goal "get_tmp_filename":
  assumes
    \<open>\<forall>\<sigma>. RIP \<sigma> = 0x180e2 \<longrightarrow> P_0x180e2_1_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x180e7 \<longrightarrow> P_0x180e7_2_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x18110 \<longrightarrow> P_0x18110_3_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x18115 \<longrightarrow> P_0x18115_4_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x18118 \<longrightarrow> P_0x18118_5_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x1811d \<longrightarrow> P_0x1811d_6_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x18125 \<longrightarrow> P_0x18125_7_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x18126 \<longrightarrow> P_0x18126_8_regions \<sigma>\<close>
    and [blocks]: \<open>{{Q_getenv_addr_0x180e2_1}} \<box>getenv_acode {{P_0x180e7_2;M_0x180e2}}\<close>
    and [blocks]: \<open>{{Q_snprintf_chk_addr_0x18110_3}} \<box>snprintf_chk_acode {{P_0x18115_4;M_0x18110}}\<close>
    and [blocks]: \<open>{{Q_mkstemp64_addr_0x18118_5}} \<box>mkstemp64_acode {{P_0x1811d_6;M_0x18118}}\<close>
    and [blocks]: \<open>{{Q_close_addr_0x18125_7}} \<box>close_acode {{P_0x18126_8;M_0x18125}}\<close>
  shows \<open>{{?P}} get_tmp_filename_acode {{?Q;?M}}\<close>
  by (vcg acode: get_tmp_filename_acode_def assms: assms)

end
