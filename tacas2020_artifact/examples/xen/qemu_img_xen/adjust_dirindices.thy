theory adjust_dirindices
  imports
    "../../../isabelle/VCG/HTriple"
begin

locale "qemu_img_xen" = execution_context + exec_code +
  assumes fetch:
    "fetch 0xb970 \<equiv> (Binary (IS_8088 Mov) (Reg (General ThirtyTwo rax)) (Storage (Memory ThirtyTwo (A_SizeDirective 32 (A_Plus (A_FromReg (General SixtyFour rdi)) (A_WordConstant 32844))))), 6)"
    "fetch 0xb976 \<equiv> (Binary (IS_8088 Xor) (Reg (General ThirtyTwo rcx)) (Storage (Reg (General ThirtyTwo rcx))), 2)"
    "fetch 0xb978 \<equiv> (Binary (IS_8088 Test) (Reg (General ThirtyTwo rax)) (Storage (Reg (General ThirtyTwo rax))), 2)"
    "fetch 0xb97a \<equiv> (Unary (IS_8088 Je) (Immediate SixtyFour (ImmVal 47553)), 2)"
    "fetch 0xb97c \<equiv> (Unary (IS_8088 Nop) (Storage (Memory ThirtyTwo (A_SizeDirective 32 (A_Plus (A_FromReg (General SixtyFour rax)) (A_WordConstant 0))))), 4)"
    "fetch 0xb980 \<equiv> (Binary (IS_8088 Mov) (Reg (General ThirtyTwo rax)) (Storage (Reg (General ThirtyTwo rcx))), 2)"
    "fetch 0xb982 \<equiv> (Binary (IS_8088 Imul) (Reg (General ThirtyTwo rax)) (Storage (Memory ThirtyTwo (A_SizeDirective 32 (A_Plus (A_FromReg (General SixtyFour rdi)) (A_WordConstant 32848))))), 7)"
    "fetch 0xb989 \<equiv> (Binary (IS_8088 Add) (Reg (General SixtyFour rax)) (Storage (Memory SixtyFour (A_SizeDirective 64 (A_Plus (A_FromReg (General SixtyFour rdi)) (A_WordConstant 32832))))), 7)"
    "fetch 0xb990 \<equiv> (Binary (IS_8088 Mov) (Reg (General ThirtyTwo r8)) (Storage (Memory ThirtyTwo (A_SizeDirective 32 (A_Plus (A_FromReg (General SixtyFour rax)) (A_WordConstant 8))))), 4)"
    "fetch 0xb994 \<equiv> (Binary (IS_8088 Cmp) (Reg (General ThirtyTwo r8)) (Storage (Reg (General ThirtyTwo rsi))), 3)"
    "fetch 0xb997 \<equiv> (Unary (IS_8088 Jb) (Immediate SixtyFour (ImmVal 47520)), 2)"
    "fetch 0xb999 \<equiv> (Binary (IS_8088 Add) (Reg (General ThirtyTwo r8)) (Storage (Reg (General ThirtyTwo rdx))), 3)"
    "fetch 0xb99c \<equiv> (Binary (IS_8088 Mov) (Memory ThirtyTwo (A_SizeDirective 32 (A_Plus (A_FromReg (General SixtyFour rax)) (A_WordConstant 8)))) (Storage (Reg (General ThirtyTwo r8))), 4)"
    "fetch 0xb9a0 \<equiv> (Binary (IS_8088 Test) (Memory Eight (A_SizeDirective 8 (A_Plus (A_FromReg (General SixtyFour rax)) (A_WordConstant 32)))) (Immediate SixtyFour (ImmVal 4)), 4)"
    "fetch 0xb9a4 \<equiv> (Unary (IS_8088 Je) (Immediate SixtyFour (ImmVal 47542)), 2)"
    "fetch 0xb9a6 \<equiv> (Binary (IS_8088 Mov) (Reg (General ThirtyTwo r8)) (Storage (Memory ThirtyTwo (A_SizeDirective 32 (A_Plus (A_FromReg (General SixtyFour rax)) (A_WordConstant 20))))), 4)"
    "fetch 0xb9aa \<equiv> (Binary (IS_8088 Cmp) (Reg (General ThirtyTwo r8)) (Storage (Reg (General ThirtyTwo rsi))), 3)"
    "fetch 0xb9ad \<equiv> (Unary (IS_8088 Jl) (Immediate SixtyFour (ImmVal 47542)), 2)"
    "fetch 0xb9af \<equiv> (Binary (IS_8088 Add) (Reg (General ThirtyTwo r8)) (Storage (Reg (General ThirtyTwo rdx))), 3)"
    "fetch 0xb9b2 \<equiv> (Binary (IS_8088 Mov) (Memory ThirtyTwo (A_SizeDirective 32 (A_Plus (A_FromReg (General SixtyFour rax)) (A_WordConstant 20)))) (Storage (Reg (General ThirtyTwo r8))), 4)"
    "fetch 0xb9b6 \<equiv> (Binary (IS_8088 Add) (Reg (General ThirtyTwo rcx)) (Immediate SixtyFour (ImmVal 1)), 3)"
    "fetch 0xb9b9 \<equiv> (Binary (IS_8088 Cmp) (Memory ThirtyTwo (A_SizeDirective 32 (A_Plus (A_FromReg (General SixtyFour rdi)) (A_WordConstant 32844)))) (Storage (Reg (General ThirtyTwo rcx))), 6)"
    "fetch 0xb9bf \<equiv> (Unary (IS_8088 Ja) (Immediate SixtyFour (ImmVal 47488)), 2)"
    "fetch 0xb9c1 \<equiv> (Nullary (IS_8088 Ret), 1)"
    "fetch 0xb9c2 \<equiv> (Unary (IS_8088 Nop) (Storage (Memory Sixteen (A_SizeDirective 16 (A_Plus (A_FromReg (General SixtyFour cs)) (A_Plus (A_FromReg (General SixtyFour rax)) (A_Plus (A_Mult 1 (A_FromReg (General SixtyFour rax))) (A_WordConstant 0))))))), 11)"
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

locale "adjust_dirindices" = "qemu_img_xen" +
  fixes RAX\<^sub>0\<^sub>v RCX\<^sub>0\<^sub>v RDX\<^sub>0\<^sub>v RDI\<^sub>0\<^sub>v RSI\<^sub>0\<^sub>v RSP\<^sub>0\<^sub>v R8\<^sub>0\<^sub>v ret_address\<^sub>v :: \<open>64 word\<close>
begin

text \<open>Using definitions that don't get unfolded immediately prevents locale argument issues.\<close>
definition \<open>RAX\<^sub>0 \<equiv> RAX\<^sub>0\<^sub>v\<close>
definition \<open>RCX\<^sub>0 \<equiv> RCX\<^sub>0\<^sub>v\<close>
definition \<open>RDX\<^sub>0 \<equiv> RDX\<^sub>0\<^sub>v\<close>
definition \<open>RDI\<^sub>0 \<equiv> RDI\<^sub>0\<^sub>v\<close>
definition \<open>RSI\<^sub>0 \<equiv> RSI\<^sub>0\<^sub>v\<close>
definition \<open>RSP\<^sub>0 \<equiv> RSP\<^sub>0\<^sub>v\<close>
definition \<open>R8\<^sub>0 \<equiv> R8\<^sub>0\<^sub>v\<close>
definition \<open>ret_address \<equiv> ret_address\<^sub>v\<close>

definition P_0xb970_0 :: state_pred where
  \<open>P_0xb970_0 \<sigma> \<equiv> RIP \<sigma> = 0xb970 \<and> RAX \<sigma> = RAX\<^sub>0 \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = RDX\<^sub>0 \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = RSP\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address\<close>
declare P_0xb970_0_def[Ps]

definition P_0xb970_0_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0xb970_0_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((RDI\<^sub>0::64 word) + 0x804c), 4)
  }\<close>

definition P_0xb970_0_regions :: state_pred where
  \<open>P_0xb970_0_regions \<sigma> \<equiv> \<exists>regions. P_0xb970_0_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0xb97a_0 :: state_pred where
  \<open>Q_0xb97a_0 \<sigma> \<equiv> RIP \<sigma> = 0xb97a \<and> RAX \<sigma> = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x804c),4]::32 word)) \<and> RCX \<sigma> = 0x0 \<and> RDX \<sigma> = RDX\<^sub>0 \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = RSP\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x804c),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x804c),4]::32 word))\<close>
declare Q_0xb97a_0_def[Qs]

schematic_goal adjust_dirindices_0_3_0xb970_0xb978_0[blocks]:
  assumes \<open>(P_0xb970_0 && P_0xb970_0_regions) \<sigma>\<close>
  shows \<open>exec_block 3 0xb978 0 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0xb97a_0 ?\<sigma> \<and> block_usage P_0xb970_0_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0xb970_0_def P_0xb970_0_regions_def post: Q_0xb97a_0_def regionset: P_0xb970_0_regions_set_def)

definition P_0xb97a_true_1 :: state_pred where
  \<open>P_0xb97a_true_1 \<sigma> \<equiv> RIP \<sigma> = 0xb97a \<and> RAX \<sigma> = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x804c),4]::32 word)) \<and> RCX \<sigma> = 0x0 \<and> RDX \<sigma> = RDX\<^sub>0 \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = RSP\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x804c),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x804c),4]::32 word))\<close>
declare P_0xb97a_true_1_def[Ps]

definition P_0xb97a_true_1_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0xb97a_true_1_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((RDI\<^sub>0::64 word) + 0x804c), 4)
  }\<close>

definition P_0xb97a_true_1_regions :: state_pred where
  \<open>P_0xb97a_true_1_regions \<sigma> \<equiv> \<exists>regions. P_0xb97a_true_1_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0xb9c1_1 :: state_pred where
  \<open>Q_0xb9c1_1 \<sigma> \<equiv> RIP \<sigma> = 0xb9c1 \<and> RDX \<sigma> = RDX\<^sub>0 \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = RSP\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x804c),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x804c),4]::32 word))\<close>
declare Q_0xb9c1_1_def[Qs]

schematic_goal adjust_dirindices_0_1_0xb97a_0xb97a_1[blocks]:
  assumes \<open>(P_0xb97a_true_1 && P_0xb97a_true_1_regions && ZF) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0xb97a (Suc 0) \<sigma> \<triangleq> ?\<sigma> \<and> Q_0xb9c1_1 ?\<sigma> \<and> block_usage P_0xb97a_true_1_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0xb97a_true_1_def P_0xb97a_true_1_regions_def post: Q_0xb9c1_1_def regionset: P_0xb97a_true_1_regions_set_def)

definition P_0xb97a_false_2 :: state_pred where
  \<open>P_0xb97a_false_2 \<sigma> \<equiv> RIP \<sigma> = 0xb97a \<and> RAX \<sigma> = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x804c),4]::32 word)) \<and> RCX \<sigma> = 0x0 \<and> RDX \<sigma> = RDX\<^sub>0 \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = RSP\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x804c),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x804c),4]::32 word))\<close>
declare P_0xb97a_false_2_def[Ps]

definition P_0xb97a_false_2_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0xb97a_false_2_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((RDI\<^sub>0::64 word) + 0x804c), 4)
  }\<close>

definition P_0xb97a_false_2_regions :: state_pred where
  \<open>P_0xb97a_false_2_regions \<sigma> \<equiv> \<exists>regions. P_0xb97a_false_2_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0xb980_2 :: state_pred where
  \<open>Q_0xb980_2 \<sigma> \<equiv> RIP \<sigma> = 0xb980 \<and> RDX \<sigma> = RDX\<^sub>0 \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = RSP\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x804c),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x804c),4]::32 word))\<close>
declare Q_0xb980_2_def[Qs]

schematic_goal adjust_dirindices_0_2_0xb97a_0xb97c_2[blocks]:
  assumes \<open>(P_0xb97a_false_2 && P_0xb97a_false_2_regions && ! ZF) \<sigma>\<close>
  shows \<open>exec_block 2 0xb97c 2 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0xb980_2 ?\<sigma> \<and> block_usage P_0xb97a_false_2_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0xb97a_false_2_def P_0xb97a_false_2_regions_def post: Q_0xb980_2_def regionset: P_0xb97a_false_2_regions_set_def)

definition P_0xb980_3 :: state_pred where
  \<open>P_0xb980_3 \<sigma> \<equiv> RIP \<sigma> = 0xb980 \<and> RDX \<sigma> = RDX\<^sub>0 \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = RSP\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x804c),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x804c),4]::32 word))\<close>
declare P_0xb980_3_def[Ps]

definition P_0xb980_3_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0xb980_3_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((RDI\<^sub>0::64 word) + 0x8040), 8),
    (2, ((RDI\<^sub>0::64 word) + 0x804c), 4),
    (3, ((RDI\<^sub>0::64 word) + 0x8050), 4),
    (4, ((((ucast (((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>RCX \<sigma>::32 word)::32 word) * (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8050),4]::32 word))::32 word)::32 word))::64 word) + ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8040),8]::64 word)::64 word))::64 word) + 0x8), 4)
  }\<close>

definition P_0xb980_3_regions :: state_pred where
  \<open>P_0xb980_3_regions \<sigma> \<equiv> \<exists>regions. P_0xb980_3_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0xb997_3 :: state_pred where
  \<open>Q_0xb997_3 \<sigma> \<equiv> RIP \<sigma> = 0xb997 \<and>
RAX \<sigma> = ((ucast (((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>RCX \<sigma>::32 word)::32 word) * (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8050),4]::32 word))::32 word)::32 word))::64 word) + ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8040),8]::64 word)::64 word)) \<and>
RDX \<sigma> = RDX\<^sub>0 \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = RSP\<^sub>0 
\<and> R8 \<sigma> = ucast ((\<sigma> \<turnstile> *[((((ucast (((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>RCX \<sigma>::32 word)::32 word) * (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8050),4]::32 word))::32 word)::32 word))::64 word) + ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8040),8]::64 word)::64 word))::64 word) + 0x8),4]::32 word)) 
\<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8040),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8040),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x804c),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x804c),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8050),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8050),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((((ucast (((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>RCX \<sigma>::32 word)::32 word) * (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8050),4]::32 word))::32 word)::32 word))::64 word) + ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8040),8]::64 word)::64 word))::64 word) + 0x8),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((((ucast (((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>RCX \<sigma>::32 word)::32 word) * (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8050),4]::32 word))::32 word)::32 word))::64 word) + ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8040),8]::64 word)::64 word))::64 word) + 0x8),4]::32 word))\<close>
declare Q_0xb997_3_def[Qs]

schematic_goal adjust_dirindices_0_5_0xb980_0xb994_3[blocks]:
  assumes \<open>(P_0xb980_3 && P_0xb980_3_regions) \<sigma>\<close>
  shows \<open>exec_block 5 0xb994 3 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0xb997_3 ?\<sigma> \<and> block_usage P_0xb980_3_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0xb980_3_def P_0xb980_3_regions_def post: Q_0xb997_3_def regionset: P_0xb980_3_regions_set_def)

definition P_0xb997_true_4 :: state_pred where
  \<open>P_0xb997_true_4 \<sigma> \<equiv> RIP \<sigma> = 0xb997 \<and> RAX \<sigma> = ((ucast (((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>RCX \<sigma>::32 word)::32 word) * (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8050),4]::32 word))::32 word)::32 word))::64 word) + ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8040),8]::64 word)::64 word)) \<and> RDX \<sigma> = RDX\<^sub>0 \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = RSP\<^sub>0 \<and> R8 \<sigma> = ucast ((\<sigma> \<turnstile> *[((((ucast (((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>RCX \<sigma>::32 word)::32 word) * (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8050),4]::32 word))::32 word)::32 word))::64 word) + ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8040),8]::64 word)::64 word))::64 word) + 0x8),4]::32 word)) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8040),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8040),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x804c),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x804c),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8050),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8050),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((((ucast (((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>RCX \<sigma>::32 word)::32 word) * (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8050),4]::32 word))::32 word)::32 word))::64 word) + ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8040),8]::64 word)::64 word))::64 word) + 0x8),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((((ucast (((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>RCX \<sigma>::32 word)::32 word) * (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8050),4]::32 word))::32 word)::32 word))::64 word) + ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8040),8]::64 word)::64 word))::64 word) + 0x8),4]::32 word))\<close>
declare P_0xb997_true_4_def[Ps]

definition P_0xb997_true_4_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0xb997_true_4_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((RDI\<^sub>0::64 word) + 0x8040), 8),
    (2, ((RDI\<^sub>0::64 word) + 0x804c), 4),
    (3, ((RDI\<^sub>0::64 word) + 0x8050), 4),
    (4, ((((ucast (((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>RCX \<sigma>::32 word)::32 word) * (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8050),4]::32 word))::32 word)::32 word))::64 word) + ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8040),8]::64 word)::64 word))::64 word) + 0x8), 4)
  }\<close>

definition P_0xb997_true_4_regions :: state_pred where
  \<open>P_0xb997_true_4_regions \<sigma> \<equiv> \<exists>regions. P_0xb997_true_4_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0xb9a0_4 :: state_pred where
  \<open>Q_0xb9a0_4 \<sigma> \<equiv> RIP \<sigma> = 0xb9a0 \<and> RAX \<sigma> = ((ucast (((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>RCX \<sigma>::32 word)::32 word) * (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8050),4]::32 word))::32 word)::32 word))::64 word) + ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8040),8]::64 word)::64 word)) \<and> RDX \<sigma> = RDX\<^sub>0 \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = RSP\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8040),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8040),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x804c),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x804c),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8050),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8050),4]::32 word))\<close>
declare Q_0xb9a0_4_def[Qs]

schematic_goal adjust_dirindices_0_1_0xb997_0xb997_4[blocks]:
  assumes \<open>(P_0xb997_true_4 && P_0xb997_true_4_regions && CF) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0xb997 4 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0xb9a0_4 ?\<sigma> \<and> block_usage P_0xb997_true_4_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0xb997_true_4_def P_0xb997_true_4_regions_def post: Q_0xb9a0_4_def regionset: P_0xb997_true_4_regions_set_def)

definition P_0xb997_false_5 :: state_pred where
  \<open>P_0xb997_false_5 \<sigma> \<equiv> RIP \<sigma> = 0xb997 \<and> RAX \<sigma> = ((ucast (((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>RCX \<sigma>::32 word)::32 word) * (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8050),4]::32 word))::32 word)::32 word))::64 word) + ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8040),8]::64 word)::64 word)) \<and> RDX \<sigma> = RDX\<^sub>0 \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = RSP\<^sub>0 \<and> R8 \<sigma> = ucast ((\<sigma> \<turnstile> *[((((ucast (((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>RCX \<sigma>::32 word)::32 word) * (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8050),4]::32 word))::32 word)::32 word))::64 word) + ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8040),8]::64 word)::64 word))::64 word) + 0x8),4]::32 word)) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8040),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8040),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x804c),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x804c),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8050),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8050),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((((ucast (((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>RCX \<sigma>::32 word)::32 word) * (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8050),4]::32 word))::32 word)::32 word))::64 word) + ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8040),8]::64 word)::64 word))::64 word) + 0x8),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((((ucast (((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>RCX \<sigma>::32 word)::32 word) * (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8050),4]::32 word))::32 word)::32 word))::64 word) + ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8040),8]::64 word)::64 word))::64 word) + 0x8),4]::32 word))\<close>
declare P_0xb997_false_5_def[Ps]

definition P_0xb997_false_5_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0xb997_false_5_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((RDI\<^sub>0::64 word) + 0x8040), 8),
    (2, ((RDI\<^sub>0::64 word) + 0x804c), 4),
    (3, ((RDI\<^sub>0::64 word) + 0x8050), 4),
    (4, ((((ucast (((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>RCX \<sigma>::32 word)::32 word) * (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8050),4]::32 word))::32 word)::32 word))::64 word) + ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8040),8]::64 word)::64 word))::64 word) + 0x8), 4)
  }\<close>

definition P_0xb997_false_5_regions :: state_pred where
  \<open>P_0xb997_false_5_regions \<sigma> \<equiv> \<exists>regions. P_0xb997_false_5_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0xb9a0_5 :: state_pred where
  \<open>Q_0xb9a0_5 \<sigma> \<equiv> RIP \<sigma> = 0xb9a0 \<and> RAX \<sigma> = ((ucast (((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>RCX \<sigma>::32 word)::32 word) * (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8050),4]::32 word))::32 word)::32 word))::64 word) + ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8040),8]::64 word)::64 word)) \<and> RDX \<sigma> = RDX\<^sub>0 \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = RSP\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8040),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8040),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x804c),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x804c),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8050),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8050),4]::32 word))\<close>
declare Q_0xb9a0_5_def[Qs]

schematic_goal adjust_dirindices_0_3_0xb997_0xb99c_5[blocks]:
  assumes \<open>(P_0xb997_false_5 && P_0xb997_false_5_regions && ! CF) \<sigma>\<close>
  shows \<open>exec_block 3 0xb99c 5 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0xb9a0_5 ?\<sigma> \<and> block_usage P_0xb997_false_5_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0xb997_false_5_def P_0xb997_false_5_regions_def post: Q_0xb9a0_5_def regionset: P_0xb997_false_5_regions_set_def)

definition P_0xb9a0_6 :: state_pred where
  \<open>P_0xb9a0_6 \<sigma> \<equiv> RIP \<sigma> = 0xb9a0 \<and> RAX \<sigma> = ((ucast (((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>RCX \<sigma>::32 word)::32 word) * (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8050),4]::32 word))::32 word)::32 word))::64 word) + ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8040),8]::64 word)::64 word)) \<and> RDX \<sigma> = RDX\<^sub>0 \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = RSP\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8040),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8040),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x804c),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x804c),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8050),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8050),4]::32 word))\<close>
declare P_0xb9a0_6_def[Ps]

definition P_0xb9a0_6_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0xb9a0_6_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((RDI\<^sub>0::64 word) + 0x8040), 8),
    (2, ((RDI\<^sub>0::64 word) + 0x804c), 4),
    (3, ((RDI\<^sub>0::64 word) + 0x8050), 4),
    (4, ((((ucast (((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>RCX \<sigma>::32 word)::32 word) * (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8050),4]::32 word))::32 word)::32 word))::64 word) + ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8040),8]::64 word)::64 word))::64 word) + 0x20), Suc 0)
  }\<close>

definition P_0xb9a0_6_regions :: state_pred where
  \<open>P_0xb9a0_6_regions \<sigma> \<equiv> \<exists>regions. P_0xb9a0_6_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0xb9a4_6 :: state_pred where
  \<open>Q_0xb9a4_6 \<sigma> \<equiv> RIP \<sigma> = 0xb9a4 \<and> RAX \<sigma> = ((ucast (((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>RCX \<sigma>::32 word)::32 word) * (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8050),4]::32 word))::32 word)::32 word))::64 word) + ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8040),8]::64 word)::64 word)) \<and> RDX \<sigma> = RDX\<^sub>0 \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = RSP\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8040),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8040),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x804c),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x804c),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8050),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8050),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((((ucast (((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>RCX \<sigma>::32 word)::32 word) * (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8050),4]::32 word))::32 word)::32 word))::64 word) + ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8040),8]::64 word)::64 word))::64 word) + 0x20),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((((ucast (((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>RCX \<sigma>::32 word)::32 word) * (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8050),4]::32 word))::32 word)::32 word))::64 word) + ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8040),8]::64 word)::64 word))::64 word) + 0x20),1]::8 word))\<close>
declare Q_0xb9a4_6_def[Qs]

schematic_goal adjust_dirindices_0_1_0xb9a0_0xb9a0_6[blocks]:
  assumes \<open>(P_0xb9a0_6 && P_0xb9a0_6_regions) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0xb9a0 6 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0xb9a4_6 ?\<sigma> \<and> block_usage P_0xb9a0_6_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0xb9a0_6_def P_0xb9a0_6_regions_def post: Q_0xb9a4_6_def regionset: P_0xb9a0_6_regions_set_def)

definition P_0xb9a4_true_7 :: state_pred where
  \<open>P_0xb9a4_true_7 \<sigma> \<equiv> RIP \<sigma> = 0xb9a4 \<and> RAX \<sigma> = ((ucast (((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>RCX \<sigma>::32 word)::32 word) * (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8050),4]::32 word))::32 word)::32 word))::64 word) + ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8040),8]::64 word)::64 word)) \<and> RDX \<sigma> = RDX\<^sub>0 \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = RSP\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8040),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8040),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x804c),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x804c),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8050),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8050),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((((ucast (((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>RCX \<sigma>::32 word)::32 word) * (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8050),4]::32 word))::32 word)::32 word))::64 word) + ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8040),8]::64 word)::64 word))::64 word) + 0x20),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((((ucast (((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>RCX \<sigma>::32 word)::32 word) * (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8050),4]::32 word))::32 word)::32 word))::64 word) + ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8040),8]::64 word)::64 word))::64 word) + 0x20),1]::8 word))\<close>
declare P_0xb9a4_true_7_def[Ps]

definition P_0xb9a4_true_7_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0xb9a4_true_7_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((RDI\<^sub>0::64 word) + 0x8040), 8),
    (2, ((RDI\<^sub>0::64 word) + 0x804c), 4),
    (3, ((RDI\<^sub>0::64 word) + 0x8050), 4),
    (4, ((((ucast (((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>RCX \<sigma>::32 word)::32 word) * (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8050),4]::32 word))::32 word)::32 word))::64 word) + ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8040),8]::64 word)::64 word))::64 word) + 0x20), Suc 0)
  }\<close>

definition P_0xb9a4_true_7_regions :: state_pred where
  \<open>P_0xb9a4_true_7_regions \<sigma> \<equiv> \<exists>regions. P_0xb9a4_true_7_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0xb9b6_7 :: state_pred where
  \<open>Q_0xb9b6_7 \<sigma> \<equiv> RIP \<sigma> = 0xb9b6 \<and> RAX \<sigma> = ((ucast (((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>RCX \<sigma>::32 word)::32 word) * (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8050),4]::32 word))::32 word)::32 word))::64 word) + ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8040),8]::64 word)::64 word)) \<and> RDX \<sigma> = RDX\<^sub>0 \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = RSP\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8040),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8040),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x804c),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x804c),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8050),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8050),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((((ucast (((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>RCX \<sigma>::32 word)::32 word) * (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8050),4]::32 word))::32 word)::32 word))::64 word) + ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8040),8]::64 word)::64 word))::64 word) + 0x20),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((((ucast (((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>RCX \<sigma>::32 word)::32 word) * (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8050),4]::32 word))::32 word)::32 word))::64 word) + ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8040),8]::64 word)::64 word))::64 word) + 0x20),1]::8 word))\<close>
declare Q_0xb9b6_7_def[Qs]

schematic_goal adjust_dirindices_0_1_0xb9a4_0xb9a4_7[blocks]:
  assumes \<open>(P_0xb9a4_true_7 && P_0xb9a4_true_7_regions && ZF) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0xb9a4 7 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0xb9b6_7 ?\<sigma> \<and> block_usage P_0xb9a4_true_7_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0xb9a4_true_7_def P_0xb9a4_true_7_regions_def post: Q_0xb9b6_7_def regionset: P_0xb9a4_true_7_regions_set_def)

definition P_0xb9a4_false_8 :: state_pred where
  \<open>P_0xb9a4_false_8 \<sigma> \<equiv> RIP \<sigma> = 0xb9a4 \<and> RAX \<sigma> = ((ucast (((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>RCX \<sigma>::32 word)::32 word) * (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8050),4]::32 word))::32 word)::32 word))::64 word) + ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8040),8]::64 word)::64 word)) \<and> RDX \<sigma> = RDX\<^sub>0 \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = RSP\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8040),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8040),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x804c),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x804c),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8050),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8050),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((((ucast (((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>RCX \<sigma>::32 word)::32 word) * (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8050),4]::32 word))::32 word)::32 word))::64 word) + ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8040),8]::64 word)::64 word))::64 word) + 0x20),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((((ucast (((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>RCX \<sigma>::32 word)::32 word) * (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8050),4]::32 word))::32 word)::32 word))::64 word) + ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8040),8]::64 word)::64 word))::64 word) + 0x20),1]::8 word))\<close>
declare P_0xb9a4_false_8_def[Ps]

definition P_0xb9a4_false_8_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0xb9a4_false_8_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((RDI\<^sub>0::64 word) + 0x8040), 8),
    (2, ((RDI\<^sub>0::64 word) + 0x804c), 4),
    (3, ((RDI\<^sub>0::64 word) + 0x8050), 4),
    (4, ((((ucast (((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>RCX \<sigma>::32 word)::32 word) * (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8050),4]::32 word))::32 word)::32 word))::64 word) + ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8040),8]::64 word)::64 word))::64 word) + 0x14), 4),
    (5, ((((ucast (((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>RCX \<sigma>::32 word)::32 word) * (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8050),4]::32 word))::32 word)::32 word))::64 word) + ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8040),8]::64 word)::64 word))::64 word) + 0x20), Suc 0)
  }\<close>

definition P_0xb9a4_false_8_regions :: state_pred where
  \<open>P_0xb9a4_false_8_regions \<sigma> \<equiv> \<exists>regions. P_0xb9a4_false_8_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0xb9ad_8 :: state_pred where
  \<open>Q_0xb9ad_8 \<sigma> \<equiv> RIP \<sigma> = 0xb9ad \<and> RAX \<sigma> = ((ucast (((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>RCX \<sigma>::32 word)::32 word) * (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8050),4]::32 word))::32 word)::32 word))::64 word) + ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8040),8]::64 word)::64 word)) \<and> RDX \<sigma> = RDX\<^sub>0 \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = RSP\<^sub>0 \<and> R8 \<sigma> = ucast ((\<sigma> \<turnstile> *[((((ucast (((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>RCX \<sigma>::32 word)::32 word) * (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8050),4]::32 word))::32 word)::32 word))::64 word) + ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8040),8]::64 word)::64 word))::64 word) + 0x14),4]::32 word)) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8040),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8040),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x804c),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x804c),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8050),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8050),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((((ucast (((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>RCX \<sigma>::32 word)::32 word) * (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8050),4]::32 word))::32 word)::32 word))::64 word) + ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8040),8]::64 word)::64 word))::64 word) + 0x14),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((((ucast (((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>RCX \<sigma>::32 word)::32 word) * (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8050),4]::32 word))::32 word)::32 word))::64 word) + ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8040),8]::64 word)::64 word))::64 word) + 0x14),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((((ucast (((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>RCX \<sigma>::32 word)::32 word) * (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8050),4]::32 word))::32 word)::32 word))::64 word) + ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8040),8]::64 word)::64 word))::64 word) + 0x20),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((((ucast (((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>RCX \<sigma>::32 word)::32 word) * (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8050),4]::32 word))::32 word)::32 word))::64 word) + ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8040),8]::64 word)::64 word))::64 word) + 0x20),1]::8 word))\<close>
declare Q_0xb9ad_8_def[Qs]

schematic_goal adjust_dirindices_0_3_0xb9a4_0xb9aa_8[blocks]:
  assumes \<open>(P_0xb9a4_false_8 && P_0xb9a4_false_8_regions && ! ZF) \<sigma>\<close>
  shows \<open>exec_block 3 0xb9aa 8 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0xb9ad_8 ?\<sigma> \<and> block_usage P_0xb9a4_false_8_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0xb9a4_false_8_def P_0xb9a4_false_8_regions_def post: Q_0xb9ad_8_def regionset: P_0xb9a4_false_8_regions_set_def)

definition P_0xb9ad_true_9 :: state_pred where
  \<open>P_0xb9ad_true_9 \<sigma> \<equiv> RIP \<sigma> = 0xb9ad \<and> RAX \<sigma> = ((ucast (((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>RCX \<sigma>::32 word)::32 word) * (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8050),4]::32 word))::32 word)::32 word))::64 word) + ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8040),8]::64 word)::64 word)) \<and> RDX \<sigma> = RDX\<^sub>0 \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = RSP\<^sub>0 \<and> R8 \<sigma> = ucast ((\<sigma> \<turnstile> *[((((ucast (((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>RCX \<sigma>::32 word)::32 word) * (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8050),4]::32 word))::32 word)::32 word))::64 word) + ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8040),8]::64 word)::64 word))::64 word) + 0x14),4]::32 word)) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8040),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8040),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x804c),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x804c),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8050),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8050),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((((ucast (((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>RCX \<sigma>::32 word)::32 word) * (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8050),4]::32 word))::32 word)::32 word))::64 word) + ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8040),8]::64 word)::64 word))::64 word) + 0x14),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((((ucast (((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>RCX \<sigma>::32 word)::32 word) * (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8050),4]::32 word))::32 word)::32 word))::64 word) + ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8040),8]::64 word)::64 word))::64 word) + 0x14),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((((ucast (((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>RCX \<sigma>::32 word)::32 word) * (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8050),4]::32 word))::32 word)::32 word))::64 word) + ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8040),8]::64 word)::64 word))::64 word) + 0x20),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((((ucast (((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>RCX \<sigma>::32 word)::32 word) * (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8050),4]::32 word))::32 word)::32 word))::64 word) + ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8040),8]::64 word)::64 word))::64 word) + 0x20),1]::8 word))\<close>
declare P_0xb9ad_true_9_def[Ps]

definition P_0xb9ad_true_9_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0xb9ad_true_9_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((RDI\<^sub>0::64 word) + 0x8040), 8),
    (2, ((RDI\<^sub>0::64 word) + 0x804c), 4),
    (3, ((RDI\<^sub>0::64 word) + 0x8050), 4),
    (4, ((((ucast (((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>RCX \<sigma>::32 word)::32 word) * (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8050),4]::32 word))::32 word)::32 word))::64 word) + ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8040),8]::64 word)::64 word))::64 word) + 0x14), 4),
    (5, ((((ucast (((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>RCX \<sigma>::32 word)::32 word) * (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8050),4]::32 word))::32 word)::32 word))::64 word) + ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8040),8]::64 word)::64 word))::64 word) + 0x20), Suc 0)
  }\<close>

definition P_0xb9ad_true_9_regions :: state_pred where
  \<open>P_0xb9ad_true_9_regions \<sigma> \<equiv> \<exists>regions. P_0xb9ad_true_9_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0xb9b6_9 :: state_pred where
  \<open>Q_0xb9b6_9 \<sigma> \<equiv> RIP \<sigma> = 0xb9b6 \<and> RAX \<sigma> = ((ucast (((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>RCX \<sigma>::32 word)::32 word) * (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8050),4]::32 word))::32 word)::32 word))::64 word) + ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8040),8]::64 word)::64 word)) \<and> RDX \<sigma> = RDX\<^sub>0 \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = RSP\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8040),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8040),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x804c),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x804c),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8050),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8050),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((((ucast (((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>RCX \<sigma>::32 word)::32 word) * (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8050),4]::32 word))::32 word)::32 word))::64 word) + ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8040),8]::64 word)::64 word))::64 word) + 0x20),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((((ucast (((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>RCX \<sigma>::32 word)::32 word) * (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8050),4]::32 word))::32 word)::32 word))::64 word) + ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8040),8]::64 word)::64 word))::64 word) + 0x20),1]::8 word))\<close>
declare Q_0xb9b6_9_def[Qs]

schematic_goal adjust_dirindices_0_1_0xb9ad_0xb9ad_9[blocks]:
  assumes \<open>(P_0xb9ad_true_9 && P_0xb9ad_true_9_regions && jl) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0xb9ad 9 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0xb9b6_9 ?\<sigma> \<and> block_usage P_0xb9ad_true_9_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0xb9ad_true_9_def P_0xb9ad_true_9_regions_def post: Q_0xb9b6_9_def regionset: P_0xb9ad_true_9_regions_set_def)

definition P_0xb9ad_false_10 :: state_pred where
  \<open>P_0xb9ad_false_10 \<sigma> \<equiv> RIP \<sigma> = 0xb9ad \<and> RAX \<sigma> = ((ucast (((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>RCX \<sigma>::32 word)::32 word) * (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8050),4]::32 word))::32 word)::32 word))::64 word) + ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8040),8]::64 word)::64 word)) \<and> RDX \<sigma> = RDX\<^sub>0 \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = RSP\<^sub>0 \<and> R8 \<sigma> = ucast ((\<sigma> \<turnstile> *[((((ucast (((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>RCX \<sigma>::32 word)::32 word) * (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8050),4]::32 word))::32 word)::32 word))::64 word) + ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8040),8]::64 word)::64 word))::64 word) + 0x14),4]::32 word)) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8040),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8040),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x804c),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x804c),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8050),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8050),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((((ucast (((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>RCX \<sigma>::32 word)::32 word) * (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8050),4]::32 word))::32 word)::32 word))::64 word) + ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8040),8]::64 word)::64 word))::64 word) + 0x14),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((((ucast (((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>RCX \<sigma>::32 word)::32 word) * (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8050),4]::32 word))::32 word)::32 word))::64 word) + ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8040),8]::64 word)::64 word))::64 word) + 0x14),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((((ucast (((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>RCX \<sigma>::32 word)::32 word) * (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8050),4]::32 word))::32 word)::32 word))::64 word) + ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8040),8]::64 word)::64 word))::64 word) + 0x20),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((((ucast (((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>RCX \<sigma>::32 word)::32 word) * (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8050),4]::32 word))::32 word)::32 word))::64 word) + ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8040),8]::64 word)::64 word))::64 word) + 0x20),1]::8 word))\<close>
declare P_0xb9ad_false_10_def[Ps]

definition P_0xb9ad_false_10_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0xb9ad_false_10_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((RDI\<^sub>0::64 word) + 0x8040), 8),
    (2, ((RDI\<^sub>0::64 word) + 0x804c), 4),
    (3, ((RDI\<^sub>0::64 word) + 0x8050), 4),
    (4, ((((ucast (((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>RCX \<sigma>::32 word)::32 word) * (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8050),4]::32 word))::32 word)::32 word))::64 word) + ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8040),8]::64 word)::64 word))::64 word) + 0x14), 4),
    (5, ((((ucast (((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>RCX \<sigma>::32 word)::32 word) * (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8050),4]::32 word))::32 word)::32 word))::64 word) + ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8040),8]::64 word)::64 word))::64 word) + 0x20), Suc 0)
  }\<close>

definition P_0xb9ad_false_10_regions :: state_pred where
  \<open>P_0xb9ad_false_10_regions \<sigma> \<equiv> \<exists>regions. P_0xb9ad_false_10_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0xb9b6_10 :: state_pred where
  \<open>Q_0xb9b6_10 \<sigma> \<equiv> RIP \<sigma> = 0xb9b6 \<and> RAX \<sigma> = ((ucast (((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>RCX \<sigma>::32 word)::32 word) * (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8050),4]::32 word))::32 word)::32 word))::64 word) + ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8040),8]::64 word)::64 word)) \<and> RDX \<sigma> = RDX\<^sub>0 \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = RSP\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8040),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8040),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x804c),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x804c),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8050),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8050),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((((ucast (((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>RCX \<sigma>::32 word)::32 word) * (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8050),4]::32 word))::32 word)::32 word))::64 word) + ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8040),8]::64 word)::64 word))::64 word) + 0x20),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((((ucast (((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>RCX \<sigma>::32 word)::32 word) * (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8050),4]::32 word))::32 word)::32 word))::64 word) + ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8040),8]::64 word)::64 word))::64 word) + 0x20),1]::8 word))\<close>
declare Q_0xb9b6_10_def[Qs]

schematic_goal adjust_dirindices_0_3_0xb9ad_0xb9b2_10[blocks]:
  assumes \<open>(P_0xb9ad_false_10 && P_0xb9ad_false_10_regions && ! jl) \<sigma>\<close>
  shows \<open>exec_block 3 0xb9b2 10 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0xb9b6_10 ?\<sigma> \<and> block_usage P_0xb9ad_false_10_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0xb9ad_false_10_def P_0xb9ad_false_10_regions_def post: Q_0xb9b6_10_def regionset: P_0xb9ad_false_10_regions_set_def)

definition P_0xb9b6_11 :: state_pred where
  \<open>P_0xb9b6_11 \<sigma> \<equiv> RIP \<sigma> = 0xb9b6 \<and> RAX \<sigma> = ((ucast (((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>RCX \<sigma>::32 word)::32 word) * (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8050),4]::32 word))::32 word)::32 word))::64 word) + ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8040),8]::64 word)::64 word)) \<and> RDX \<sigma> = RDX\<^sub>0 \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = RSP\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8040),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8040),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x804c),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x804c),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8050),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8050),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((((ucast (((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>RCX \<sigma>::32 word)::32 word) * (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8050),4]::32 word))::32 word)::32 word))::64 word) + ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8040),8]::64 word)::64 word))::64 word) + 0x20),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((((ucast (((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>RCX \<sigma>::32 word)::32 word) * (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8050),4]::32 word))::32 word)::32 word))::64 word) + ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8040),8]::64 word)::64 word))::64 word) + 0x20),1]::8 word))\<close>
declare P_0xb9b6_11_def[Ps]

definition P_0xb9b6_11_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0xb9b6_11_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((RDI\<^sub>0::64 word) + 0x8040), 8),
    (2, ((RDI\<^sub>0::64 word) + 0x804c), 4),
    (3, ((RDI\<^sub>0::64 word) + 0x8050), 4),
    (4, ((((ucast (((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>RCX \<sigma>::32 word)::32 word) * (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8050),4]::32 word))::32 word)::32 word))::64 word) + ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8040),8]::64 word)::64 word))::64 word) + 0x20), Suc 0)
  }\<close>

definition P_0xb9b6_11_regions :: state_pred where
  \<open>P_0xb9b6_11_regions \<sigma> \<equiv> \<exists>regions. P_0xb9b6_11_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0xb9bf_11 :: state_pred where
  \<open>Q_0xb9bf_11 \<sigma> \<equiv> RIP \<sigma> = 0xb9bf \<and> RDX \<sigma> = RDX\<^sub>0 \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = RSP\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x804c),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x804c),4]::32 word))\<close>
declare Q_0xb9bf_11_def[Qs]

schematic_goal adjust_dirindices_0_2_0xb9b6_0xb9b9_11[blocks]:
  assumes \<open>(P_0xb9b6_11 && P_0xb9b6_11_regions) \<sigma>\<close>
  shows \<open>exec_block 2 0xb9b9 11 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0xb9bf_11 ?\<sigma> \<and> block_usage P_0xb9b6_11_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0xb9b6_11_def P_0xb9b6_11_regions_def post: Q_0xb9bf_11_def regionset: P_0xb9b6_11_regions_set_def)

definition P_0xb9bf_true_12 :: state_pred where
  \<open>P_0xb9bf_true_12 \<sigma> \<equiv> RIP \<sigma> = 0xb9bf \<and> RDX \<sigma> = RDX\<^sub>0 \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = RSP\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x804c),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x804c),4]::32 word))\<close>
declare P_0xb9bf_true_12_def[Ps]

definition P_0xb9bf_true_12_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0xb9bf_true_12_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((RDI\<^sub>0::64 word) + 0x804c), 4)
  }\<close>

definition P_0xb9bf_true_12_regions :: state_pred where
  \<open>P_0xb9bf_true_12_regions \<sigma> \<equiv> \<exists>regions. P_0xb9bf_true_12_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0xb980_12 :: state_pred where
  \<open>Q_0xb980_12 \<sigma> \<equiv> RIP \<sigma> = 0xb980 \<and> RDX \<sigma> = RDX\<^sub>0 \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = RSP\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x804c),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x804c),4]::32 word))\<close>
declare Q_0xb980_12_def[Qs]

schematic_goal adjust_dirindices_0_1_0xb9bf_0xb9bf_12[blocks]:
  assumes \<open>(P_0xb9bf_true_12 && P_0xb9bf_true_12_regions && ja) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0xb9bf 12 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0xb980_12 ?\<sigma> \<and> block_usage P_0xb9bf_true_12_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0xb9bf_true_12_def P_0xb9bf_true_12_regions_def post: Q_0xb980_12_def regionset: P_0xb9bf_true_12_regions_set_def)

definition P_0xb9bf_false_13 :: state_pred where
  \<open>P_0xb9bf_false_13 \<sigma> \<equiv> RIP \<sigma> = 0xb9bf \<and> RDX \<sigma> = RDX\<^sub>0 \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = RSP\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x804c),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x804c),4]::32 word))\<close>
declare P_0xb9bf_false_13_def[Ps]

definition P_0xb9bf_false_13_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0xb9bf_false_13_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((RDI\<^sub>0::64 word) + 0x804c), 4)
  }\<close>

definition P_0xb9bf_false_13_regions :: state_pred where
  \<open>P_0xb9bf_false_13_regions \<sigma> \<equiv> \<exists>regions. P_0xb9bf_false_13_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0xb9c1_13 :: state_pred where
  \<open>Q_0xb9c1_13 \<sigma> \<equiv> RIP \<sigma> = 0xb9c1 \<and> RDX \<sigma> = RDX\<^sub>0 \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = RSP\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x804c),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x804c),4]::32 word))\<close>
declare Q_0xb9c1_13_def[Qs]

schematic_goal adjust_dirindices_0_1_0xb9bf_0xb9bf_13[blocks]:
  assumes \<open>(P_0xb9bf_false_13 && P_0xb9bf_false_13_regions && ! ja) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0xb9bf 13 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0xb9c1_13 ?\<sigma> \<and> block_usage P_0xb9bf_false_13_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0xb9bf_false_13_def P_0xb9bf_false_13_regions_def post: Q_0xb9c1_13_def regionset: P_0xb9bf_false_13_regions_set_def)

definition P_0xb9c1_14 :: state_pred where
  \<open>P_0xb9c1_14 \<sigma> \<equiv> RIP \<sigma> = 0xb9c1 \<and> RDX \<sigma> = RDX\<^sub>0 \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = RSP\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x804c),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x804c),4]::32 word))\<close>
declare P_0xb9c1_14_def[Ps]

definition P_0xb9c1_14_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0xb9c1_14_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((RDI\<^sub>0::64 word) + 0x804c), 4)
  }\<close>

definition P_0xb9c1_14_regions :: state_pred where
  \<open>P_0xb9c1_14_regions \<sigma> \<equiv> \<exists>regions. P_0xb9c1_14_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_ret_address_14 :: state_pred where
  \<open>Q_ret_address_14 \<sigma> \<equiv> RIP \<sigma> = ret_address \<and> RDX \<sigma> = RDX\<^sub>0 \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) + 0x8) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x804c),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x804c),4]::32 word))\<close>
declare Q_ret_address_14_def[Qs]

schematic_goal adjust_dirindices_0_1_0xb9c1_0xb9c1_14[blocks]:
  assumes \<open>(P_0xb9c1_14 && P_0xb9c1_14_regions) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0xb9c1 14 \<sigma> \<triangleq> ?\<sigma> \<and> Q_ret_address_14 ?\<sigma> \<and> block_usage P_0xb9c1_14_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0xb9c1_14_def P_0xb9c1_14_regions_def post: Q_ret_address_14_def regionset: P_0xb9c1_14_regions_set_def)

definition adjust_dirindices_acode :: ACode where
  \<open>adjust_dirindices_acode =
    Block 3 0xb978 0;
    IF ZF THEN
      Block (Suc 0) 0xb97a (Suc 0)
    ELSE
      Block 2 0xb97c 2;
      WHILE P_0xb980_3 DO
        Block 5 0xb994 3;
        IF CF THEN
          Block (Suc 0) 0xb997 4
        ELSE
          Block 3 0xb99c 5
        FI;
        Block (Suc 0) 0xb9a0 6;
        IF ZF THEN
          Block (Suc 0) 0xb9a4 7
        ELSE
          Block 3 0xb9aa 8;
          IF jl THEN
            Block (Suc 0) 0xb9ad 9
          ELSE
            Block 3 0xb9b2 10
          FI
        FI;
        Block 2 0xb9b9 11;
        IF ja THEN
          Block (Suc 0) 0xb9bf 12
        ELSE
          Block (Suc 0) 0xb9bf 13
        FI
      OD
    FI;
    Block (Suc 0) 0xb9c1 14
  \<close>

schematic_goal "adjust_dirindices":
  assumes
    \<open>\<forall>\<sigma>. RIP \<sigma> = 0xb97a \<longrightarrow> P_0xb97a_true_1_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0xb97a \<longrightarrow> P_0xb97a_false_2_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0xb980 \<longrightarrow> P_0xb980_3_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0xb997 \<longrightarrow> P_0xb997_true_4_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0xb997 \<longrightarrow> P_0xb997_false_5_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0xb9a0 \<longrightarrow> P_0xb9a0_6_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0xb9a4 \<longrightarrow> P_0xb9a4_true_7_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0xb9a4 \<longrightarrow> P_0xb9a4_false_8_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0xb9ad \<longrightarrow> P_0xb9ad_true_9_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0xb9ad \<longrightarrow> P_0xb9ad_false_10_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0xb9b6 \<longrightarrow> P_0xb9b6_11_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0xb9bf \<longrightarrow> P_0xb9bf_true_12_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0xb9bf \<longrightarrow> P_0xb9bf_false_13_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0xb9c1 \<longrightarrow> P_0xb9c1_14_regions \<sigma>\<close>
  shows \<open>{{?P}} adjust_dirindices_acode {{?Q;?M}}\<close>
  apply (vcg acode: adjust_dirindices_acode_def assms: assms)
  apply (vcg_while "P_0xb980_3 || P_0xb9c1_14")
  apply (vcg_step assms: assms)+
  apply (auto simp add: Ps Qs pred_logic assms)[1]
  apply auto
  apply (vcg_step assms: assms)+
  apply (auto simp add: Ps Qs pred_logic assms)[1]
  apply (auto simp add: Ps Qs pred_logic assms)[1]
  apply auto
  done
end
