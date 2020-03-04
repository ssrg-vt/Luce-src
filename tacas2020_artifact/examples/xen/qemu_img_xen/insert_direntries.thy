theory insert_direntries
  imports
    "../../../isabelle/VCG/HTriple"
begin

locale "qemu_img_xen" = execution_context + exec_code +
  fixes qemu_realloc_0xc074_retval\<^sub>v memmove_0xc0b2_retval\<^sub>v adjust_dirindices_0xc0dd_retval\<^sub>v adjust_dirindices_addr memmove_addr qemu_realloc_addr :: \<open>64 word\<close>
    and adjust_dirindices_acode memmove_acode qemu_realloc_acode :: ACode
  assumes fetch:
    "fetch 0xc030 \<equiv> (Unary (IS_8088 Push) (Storage (Reg (General SixtyFour r13))), 2)"
    "fetch 0xc032 \<equiv> (Binary (IS_8088 Mov) (Reg (General ThirtyTwo r13)) (Storage (Reg (General ThirtyTwo rdx))), 3)"
    "fetch 0xc035 \<equiv> (Unary (IS_8088 Push) (Storage (Reg (General SixtyFour r12))), 2)"
    "fetch 0xc037 \<equiv> (Binary (IS_8088 Mov) (Reg (General ThirtyTwo r12)) (Storage (Reg (General ThirtyTwo rsi))), 3)"
    "fetch 0xc03a \<equiv> (Unary (IS_8088 Push) (Storage (Reg (General SixtyFour rbp))), 1)"
    "fetch 0xc03b \<equiv> (Unary (IS_8088 Push) (Storage (Reg (General SixtyFour rbx))), 1)"
    "fetch 0xc03c \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour rbx)) (Storage (Reg (General SixtyFour rdi))), 3)"
    "fetch 0xc03f \<equiv> (Binary (IS_8088 Sub) (Reg (General SixtyFour rsp)) (Immediate SixtyFour (ImmVal 8)), 4)"
    "fetch 0xc043 \<equiv> (Binary (IS_8088 Mov) (Reg (General ThirtyTwo rdx)) (Storage (Memory ThirtyTwo (A_SizeDirective 32 (A_Plus (A_FromReg (General SixtyFour rdi)) (A_WordConstant 32820))))), 6)"
    "fetch 0xc049 \<equiv> (Binary (IS_8088 Mov) (Reg (General ThirtyTwo rcx)) (Storage (Memory ThirtyTwo (A_SizeDirective 32 (A_Plus (A_FromReg (General SixtyFour rdi)) (A_WordConstant 32824))))), 6)"
    "fetch 0xc04f \<equiv> (Binary (IS_8088 Mov) (Reg (General ThirtyTwo rdi)) (Storage (Memory ThirtyTwo (A_SizeDirective 32 (A_Plus (A_FromReg (General SixtyFour rdi)) (A_WordConstant 32816))))), 6)"
    "fetch 0xc055 \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour rax)) (Storage (Memory SixtyFour (A_SizeDirective 64 (A_Plus (A_FromReg (General SixtyFour rbx)) (A_WordConstant 32808))))), 7)"
    "fetch 0xc05c \<equiv> (Binary (IS_8088 Lea) (Reg (General ThirtyTwo rsi)) (Storage (Memory SixtyFour (A_Plus (A_FromReg (General SixtyFour r13)) (A_Plus (A_Mult 1 (A_FromReg (General SixtyFour rdx))) (A_WordConstant 0))))), 5)"
    "fetch 0xc061 \<equiv> (Binary (IS_8088 Imul) (Reg (General ThirtyTwo rsi)) (Storage (Reg (General ThirtyTwo rcx))), 3)"
    "fetch 0xc064 \<equiv> (Binary (IS_8088 Cmp) (Reg (General ThirtyTwo rsi)) (Storage (Reg (General ThirtyTwo rdi))), 2)"
    "fetch 0xc066 \<equiv> (Unary (IS_8088 Jbe) (Immediate SixtyFour (ImmVal 49303)), 2)"
    "fetch 0xc068 \<equiv> (Binary (IS_8088 Imul) (Reg (General ThirtyTwo rcx)) (Storage (Reg (General ThirtyTwo r13))), 4)"
    "fetch 0xc06c \<equiv> (Binary (IS_8088 Lea) (Reg (General ThirtyTwo rsi)) (Storage (Memory SixtyFour (A_Plus (A_FromReg (General SixtyFour rdi)) (A_Mult 1 (A_FromReg (General SixtyFour rcx)))))), 3)"
    "fetch 0xc06f \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour rdi)) (Storage (Reg (General SixtyFour rax))), 3)"
    "fetch 0xc072 \<equiv> (Binary (IS_8088 Mov) (Reg (General ThirtyTwo rbp)) (Storage (Reg (General ThirtyTwo rcx))), 2)"
    "fetch 0xc074 \<equiv> (Unary (IS_8088 Call) (Immediate SixtyFour (ImmLabel ''qemu_realloc'')), 5)"
    "fetch 0xc079 \<equiv> (Binary (IS_8088 Mov) (Memory SixtyFour (A_SizeDirective 64 (A_Plus (A_FromReg (General SixtyFour rbx)) (A_WordConstant 32808)))) (Storage (Reg (General SixtyFour rax))), 7)"
    "fetch 0xc080 \<equiv> (Binary (IS_8088 Test) (Reg (General SixtyFour rax)) (Storage (Reg (General SixtyFour rax))), 3)"
    "fetch 0xc083 \<equiv> (Unary (IS_8088 Je) (Immediate SixtyFour (ImmVal 49392)), 2)"
    "fetch 0xc085 \<equiv> (Binary (IS_8088 Add) (Memory ThirtyTwo (A_SizeDirective 32 (A_Plus (A_FromReg (General SixtyFour rbx)) (A_WordConstant 32816)))) (Storage (Reg (General ThirtyTwo rbp))), 6)"
    "fetch 0xc08b \<equiv> (Binary (IS_8088 Mov) (Reg (General ThirtyTwo rdx)) (Storage (Memory ThirtyTwo (A_SizeDirective 32 (A_Plus (A_FromReg (General SixtyFour rbx)) (A_WordConstant 32820))))), 6)"
    "fetch 0xc091 \<equiv> (Binary (IS_8088 Mov) (Reg (General ThirtyTwo rcx)) (Storage (Memory ThirtyTwo (A_SizeDirective 32 (A_Plus (A_FromReg (General SixtyFour rbx)) (A_WordConstant 32824))))), 6)"
    "fetch 0xc097 \<equiv> (Binary (IS_8088 Sub) (Reg (General ThirtyTwo rdx)) (Storage (Reg (General ThirtyTwo r12))), 3)"
    "fetch 0xc09a \<equiv> (Binary (IS_8088 Lea) (Reg (General ThirtyTwo rdi)) (Storage (Memory SixtyFour (A_Plus (A_FromReg (General SixtyFour r13)) (A_Plus (A_Mult 1 (A_FromReg (General SixtyFour r12))) (A_WordConstant 0))))), 5)"
    "fetch 0xc09f \<equiv> (Binary (IS_8088 Mov) (Reg (General ThirtyTwo rsi)) (Storage (Reg (General ThirtyTwo r12))), 3)"
    "fetch 0xc0a2 \<equiv> (Binary (IS_8088 Imul) (Reg (General ThirtyTwo rdx)) (Storage (Reg (General ThirtyTwo rcx))), 3)"
    "fetch 0xc0a5 \<equiv> (Binary (IS_8088 Imul) (Reg (General ThirtyTwo rsi)) (Storage (Reg (General ThirtyTwo rcx))), 3)"
    "fetch 0xc0a8 \<equiv> (Binary (IS_8088 Imul) (Reg (General ThirtyTwo rcx)) (Storage (Reg (General ThirtyTwo rdi))), 3)"
    "fetch 0xc0ab \<equiv> (Binary (IS_8088 Add) (Reg (General SixtyFour rsi)) (Storage (Reg (General SixtyFour rax))), 3)"
    "fetch 0xc0ae \<equiv> (Binary (IS_8088 Lea) (Reg (General SixtyFour rdi)) (Storage (Memory SixtyFour (A_Plus (A_FromReg (General SixtyFour rax)) (A_Mult 1 (A_FromReg (General SixtyFour rcx)))))), 4)"
    "fetch 0xc0b2 \<equiv> (Unary (IS_8088 Call) (Immediate SixtyFour (ImmLabel ''memmove'')), 5)"
    "fetch 0xc0b7 \<equiv> (Binary (IS_8088 Add) (Memory ThirtyTwo (A_SizeDirective 32 (A_Plus (A_FromReg (General SixtyFour rbx)) (A_WordConstant 32820)))) (Storage (Reg (General ThirtyTwo r13))), 7)"
    "fetch 0xc0be \<equiv> (Binary (IS_8088 Mov) (Reg (General ThirtyTwo rax)) (Storage (Reg (General ThirtyTwo r12))), 3)"
    "fetch 0xc0c1 \<equiv> (Binary (IS_8088 Imul) (Reg (General ThirtyTwo rax)) (Storage (Memory ThirtyTwo (A_SizeDirective 32 (A_Plus (A_FromReg (General SixtyFour rbx)) (A_WordConstant 32824))))), 7)"
    "fetch 0xc0c8 \<equiv> (Binary (IS_8088 Add) (Reg (General SixtyFour rax)) (Storage (Memory SixtyFour (A_SizeDirective 64 (A_Plus (A_FromReg (General SixtyFour rbx)) (A_WordConstant 32808))))), 7)"
    "fetch 0xc0cf \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour r9)) (Storage (Reg (General SixtyFour rax))), 3)"
    "fetch 0xc0d2 \<equiv> (Unary (IS_8088 Je) (Immediate SixtyFour (ImmVal 49378)), 2)"
    "fetch 0xc0d4 \<equiv> (Binary (IS_8088 Mov) (Reg (General ThirtyTwo rdx)) (Storage (Reg (General ThirtyTwo r13))), 3)"
    "fetch 0xc0d7 \<equiv> (Binary (IS_8088 Mov) (Reg (General ThirtyTwo rsi)) (Storage (Reg (General ThirtyTwo r12))), 3)"
    "fetch 0xc0da \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour rdi)) (Storage (Reg (General SixtyFour rbx))), 3)"
    "fetch 0xc0dd \<equiv> (Unary (IS_8088 Call) (Immediate SixtyFour (ImmLabel ''adjust_dirindices'')), 5)"
    "fetch 0xc0e2 \<equiv> (Binary (IS_8088 Add) (Reg (General SixtyFour rsp)) (Immediate SixtyFour (ImmVal 8)), 4)"
    "fetch 0xc0e6 \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour rax)) (Storage (Reg (General SixtyFour r9))), 3)"
    "fetch 0xc0e9 \<equiv> (Unary (IS_8088 Pop) (Storage (Reg (General SixtyFour rbx))), 1)"
    "fetch 0xc0ea \<equiv> (Unary (IS_8088 Pop) (Storage (Reg (General SixtyFour rbp))), 1)"
    "fetch 0xc0eb \<equiv> (Unary (IS_8088 Pop) (Storage (Reg (General SixtyFour r12))), 2)"
    "fetch 0xc0ed \<equiv> (Unary (IS_8088 Pop) (Storage (Reg (General SixtyFour r13))), 2)"
    "fetch 0xc0ef \<equiv> (Nullary (IS_8088 Ret), 1)"
    "fetch 0xc0f0 \<equiv> (Binary (IS_8088 Xor) (Reg (General ThirtyTwo r9)) (Storage (Reg (General ThirtyTwo r9))), 3)"
    "fetch 0xc0f3 \<equiv> (Unary (IS_8088 Jmp) (Immediate SixtyFour (ImmVal 49378)), 2)"
    and \<alpha>_def: \<open>\<alpha> = \<lparr>text_sections = [], data_sections = [], labels_to_offsets = [], binary_offset = 0\<rparr>\<close>
    and adjust_dirindices\<^sub>a\<^sub>d\<^sub>d\<^sub>r[simp]: \<open>the (label_to_address \<alpha> ''adjust_dirindices'') = adjust_dirindices_addr\<close>
    and memmove\<^sub>a\<^sub>d\<^sub>d\<^sub>r[simp]: \<open>the (label_to_address \<alpha> ''memmove'') = memmove_addr\<close>
    and qemu_realloc\<^sub>a\<^sub>d\<^sub>d\<^sub>r[simp]: \<open>the (label_to_address \<alpha> ''qemu_realloc'') = qemu_realloc_addr\<close>
begin

text \<open>Using definitions that don't get unfolded immediately prevents locale argument issues.\<close>
definition \<open>qemu_realloc_0xc074_retval \<equiv> qemu_realloc_0xc074_retval\<^sub>v\<close>
definition \<open>memmove_0xc0b2_retval \<equiv> memmove_0xc0b2_retval\<^sub>v\<close>
definition \<open>adjust_dirindices_0xc0dd_retval \<equiv> adjust_dirindices_0xc0dd_retval\<^sub>v\<close>

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

locale "insert_direntries" = "qemu_img_xen" +
  fixes RAX\<^sub>0\<^sub>v RBX\<^sub>0\<^sub>v RCX\<^sub>0\<^sub>v RDX\<^sub>0\<^sub>v RDI\<^sub>0\<^sub>v RSI\<^sub>0\<^sub>v RSP\<^sub>0\<^sub>v RBP\<^sub>0\<^sub>v R13\<^sub>0\<^sub>v R12\<^sub>0\<^sub>v R9\<^sub>0\<^sub>v ret_address\<^sub>v :: \<open>64 word\<close>
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
definition \<open>ret_address \<equiv> ret_address\<^sub>v\<close>

definition P_0xc030_0 :: state_pred where
  \<open>P_0xc030_0 \<sigma> \<equiv> RIP \<sigma> = 0xc030 \<and> RAX \<sigma> = RAX\<^sub>0 \<and> RBX \<sigma> = RBX\<^sub>0 \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = RDX\<^sub>0 \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = RSP\<^sub>0 \<and> RBP \<sigma> = RBP\<^sub>0 \<and> R13 \<sigma> = R13\<^sub>0 \<and> R12 \<sigma> = R12\<^sub>0 \<and> R9 \<sigma> = R9\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address\<close>
declare P_0xc030_0_def[Ps]

definition P_0xc030_0_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0xc030_0_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((RDI\<^sub>0::64 word) + 0x8028), 8),
    (2, ((RDI\<^sub>0::64 word) + 0x8030), 4),
    (3, ((RDI\<^sub>0::64 word) + 0x8034), 4),
    (4, ((RDI\<^sub>0::64 word) + 0x8038), 4),
    (5, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x20), 8)
  }\<close>

definition P_0xc030_0_regions :: state_pred where
  \<open>P_0xc030_0_regions \<sigma> \<equiv> \<exists>regions. P_0xc030_0_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0xc066_0 :: state_pred where
  \<open>Q_0xc066_0 \<sigma> \<equiv> RIP \<sigma> = 0xc066 \<and> RAX \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8028),8]::64 word) \<and> RBX \<sigma> = RDI\<^sub>0 \<and> RCX \<sigma> = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8038),4]::32 word)) \<and> RDX \<sigma> = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8034),4]::32 word)) \<and> RDI \<sigma> = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8030),4]::32 word)) \<and> RSI \<sigma> = ucast ((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>((ucast (((\<langle>31,0\<rangle>RDX\<^sub>0::32 word)::32 word))::64 word) + ((\<langle>63,0\<rangle>(((\<langle>63,0\<rangle>(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8034),4]::32 word)::64 word)::64 word) * 0x1)::64 word)::64 word))::32 word)::32 word) * (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8038),4]::32 word))::32 word)) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x28) \<and> RBP \<sigma> = RBP\<^sub>0 \<and> R13 \<sigma> = ucast ((\<langle>31,0\<rangle>RDX\<^sub>0::32 word)) \<and> R12 \<sigma> = ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)) \<and> R9 \<sigma> = R9\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8028),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8028),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8030),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8030),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8034),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8034),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8038),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8038),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBX\<^sub>0\<close>
declare Q_0xc066_0_def[Qs]

schematic_goal insert_direntries_0_15_0xc030_0xc064_0[blocks]:
  assumes \<open>(P_0xc030_0 && P_0xc030_0_regions) \<sigma>\<close>
  shows \<open>exec_block 15 0xc064 0 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0xc066_0 ?\<sigma> \<and> block_usage P_0xc030_0_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0xc030_0_def P_0xc030_0_regions_def post: Q_0xc066_0_def regionset: P_0xc030_0_regions_set_def)

definition P_0xc066_true_1 :: state_pred where
  \<open>P_0xc066_true_1 \<sigma> \<equiv> RIP \<sigma> = 0xc066 \<and> RAX \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8028),8]::64 word) \<and> RBX \<sigma> = RDI\<^sub>0 \<and> RCX \<sigma> = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8038),4]::32 word)) \<and> RDX \<sigma> = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8034),4]::32 word)) \<and> RDI \<sigma> = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8030),4]::32 word)) \<and> RSI \<sigma> = ucast ((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>((ucast (((\<langle>31,0\<rangle>RDX\<^sub>0::32 word)::32 word))::64 word) + ((\<langle>63,0\<rangle>(((\<langle>63,0\<rangle>(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8034),4]::32 word)::64 word)::64 word) * 0x1)::64 word)::64 word))::32 word)::32 word) * (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8038),4]::32 word))::32 word)) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x28) \<and> RBP \<sigma> = RBP\<^sub>0 \<and> R13 \<sigma> = ucast ((\<langle>31,0\<rangle>RDX\<^sub>0::32 word)) \<and> R12 \<sigma> = ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)) \<and> R9 \<sigma> = R9\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8028),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8028),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8030),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8030),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8034),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8034),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8038),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8038),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBX\<^sub>0\<close>
declare P_0xc066_true_1_def[Ps]

definition P_0xc066_true_1_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0xc066_true_1_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((RDI\<^sub>0::64 word) + 0x8028), 8),
    (2, ((RDI\<^sub>0::64 word) + 0x8030), 4),
    (3, ((RDI\<^sub>0::64 word) + 0x8034), 4),
    (4, ((RDI\<^sub>0::64 word) + 0x8038), 4),
    (5, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x20), 8)
  }\<close>

definition P_0xc066_true_1_regions :: state_pred where
  \<open>P_0xc066_true_1_regions \<sigma> \<equiv> \<exists>regions. P_0xc066_true_1_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0xc0b2_1 :: state_pred where
  \<open>Q_0xc0b2_1 \<sigma> \<equiv> RIP \<sigma> = 0xc0b2 \<and> RAX \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8028),8]::64 word) \<and> RBX \<sigma> = RDI\<^sub>0 \<and> RCX \<sigma> = ucast ((\<langle>31,0\<rangle>(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8038),4]::32 word)::32 word) * (\<langle>31,0\<rangle>((ucast (((\<langle>31,0\<rangle>RDX\<^sub>0::32 word)::32 word))::64 word) + ((\<langle>63,0\<rangle>((ucast (((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word))::64 word) * (0x1::64 word))::64 word)::64 word))::32 word))::32 word)) \<and> RDX \<sigma> = ucast ((\<langle>31,0\<rangle>(((((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8034),4]::32 word)::32 word) - (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) * (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8038),4]::32 word))::32 word)) \<and> RDI \<sigma> = (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8028),8]::64 word)::64 word) + (\<langle>63,0\<rangle>((ucast (((\<langle>31,0\<rangle>(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8038),4]::32 word)::32 word) * (\<langle>31,0\<rangle>((ucast (((\<langle>31,0\<rangle>RDX\<^sub>0::32 word)::32 word))::64 word) + ((\<langle>63,0\<rangle>((ucast (((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word))::64 word) * (0x1::64 word))::64 word)::64 word))::32 word))::32 word)::32 word))::64 word) * (0x1::64 word))::64 word)) \<and> RSI \<sigma> = ((ucast (((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) * (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8038),4]::32 word))::32 word)::32 word))::64 word) + ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8028),8]::64 word)::64 word)) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x28) \<and> RBP \<sigma> = RBP\<^sub>0 \<and> R13 \<sigma> = ucast ((\<langle>31,0\<rangle>RDX\<^sub>0::32 word)) \<and> R12 \<sigma> = ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)) \<and> R9 \<sigma> = R9\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8028),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8028),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8030),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8030),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8034),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8034),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8038),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8038),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBX\<^sub>0\<close>
declare Q_0xc0b2_1_def[Qs]

schematic_goal insert_direntries_0_9_0xc066_0xc0ae_1[blocks]:
  assumes \<open>(P_0xc066_true_1 && P_0xc066_true_1_regions && jbe) \<sigma>\<close>
  shows \<open>exec_block 9 0xc0ae (Suc 0) \<sigma> \<triangleq> ?\<sigma> \<and> Q_0xc0b2_1 ?\<sigma> \<and> block_usage P_0xc066_true_1_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0xc066_true_1_def P_0xc066_true_1_regions_def post: Q_0xc0b2_1_def regionset: P_0xc066_true_1_regions_set_def)

definition P_0xc0b2_2 :: state_pred where
  \<open>P_0xc0b2_2 \<sigma> \<equiv> RIP \<sigma> = 0xc0b2 \<and> RAX \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8028),8]::64 word) \<and> RBX \<sigma> = RDI\<^sub>0 \<and> RCX \<sigma> = ucast ((\<langle>31,0\<rangle>(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8038),4]::32 word)::32 word) * (\<langle>31,0\<rangle>((ucast (((\<langle>31,0\<rangle>RDX\<^sub>0::32 word)::32 word))::64 word) + ((\<langle>63,0\<rangle>((ucast (((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word))::64 word) * (0x1::64 word))::64 word)::64 word))::32 word))::32 word)) \<and> RDX \<sigma> = ucast ((\<langle>31,0\<rangle>(((((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8034),4]::32 word)::32 word) - (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) * (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8038),4]::32 word))::32 word)) \<and> RDI \<sigma> = (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8028),8]::64 word)::64 word) + (\<langle>63,0\<rangle>((ucast (((\<langle>31,0\<rangle>(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8038),4]::32 word)::32 word) * (\<langle>31,0\<rangle>((ucast (((\<langle>31,0\<rangle>RDX\<^sub>0::32 word)::32 word))::64 word) + ((\<langle>63,0\<rangle>((ucast (((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word))::64 word) * (0x1::64 word))::64 word)::64 word))::32 word))::32 word)::32 word))::64 word) * (0x1::64 word))::64 word)) \<and> RSI \<sigma> = ((ucast (((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) * (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8038),4]::32 word))::32 word)::32 word))::64 word) + ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8028),8]::64 word)::64 word)) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x28) \<and> RBP \<sigma> = RBP\<^sub>0 \<and> R13 \<sigma> = ucast ((\<langle>31,0\<rangle>RDX\<^sub>0::32 word)) \<and> R12 \<sigma> = ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)) \<and> R9 \<sigma> = R9\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8028),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8028),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8030),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8030),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8034),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8034),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8038),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8038),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBX\<^sub>0\<close>
declare P_0xc0b2_2_def[Ps]

definition P_0xc0b2_2_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0xc0b2_2_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((RDI\<^sub>0::64 word) + 0x8028), 8),
    (2, ((RDI\<^sub>0::64 word) + 0x8030), 4),
    (3, ((RDI\<^sub>0::64 word) + 0x8034), 4),
    (4, ((RDI\<^sub>0::64 word) + 0x8038), 4),
    (5, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x30), 8)
  }\<close>

definition P_0xc0b2_2_regions :: state_pred where
  \<open>P_0xc0b2_2_regions \<sigma> \<equiv> \<exists>regions. P_0xc0b2_2_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_memmove_addr_0xc0b2_2 :: state_pred where
  \<open>Q_memmove_addr_0xc0b2_2 \<sigma> \<equiv> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x30) \<and> RIP \<sigma> = memmove_addr \<and> RAX \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8028),8]::64 word) \<and> RBX \<sigma> = RDI\<^sub>0 \<and> RCX \<sigma> = ucast ((\<langle>31,0\<rangle>(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8038),4]::32 word)::32 word) * (\<langle>31,0\<rangle>((ucast (((\<langle>31,0\<rangle>RDX\<^sub>0::32 word)::32 word))::64 word) + ((\<langle>63,0\<rangle>((ucast (((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word))::64 word) * (0x1::64 word))::64 word)::64 word))::32 word))::32 word)) \<and> RDX \<sigma> = ucast ((\<langle>31,0\<rangle>(((((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8034),4]::32 word)::32 word) - (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) * (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8038),4]::32 word))::32 word)) \<and> RDI \<sigma> = (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8028),8]::64 word)::64 word) + (\<langle>63,0\<rangle>((ucast (((\<langle>31,0\<rangle>(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8038),4]::32 word)::32 word) * (\<langle>31,0\<rangle>((ucast (((\<langle>31,0\<rangle>RDX\<^sub>0::32 word)::32 word))::64 word) + ((\<langle>63,0\<rangle>((ucast (((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word))::64 word) * (0x1::64 word))::64 word)::64 word))::32 word))::32 word)::32 word))::64 word) * (0x1::64 word))::64 word)) \<and> RSI \<sigma> = ((ucast (((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) * (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8038),4]::32 word))::32 word)::32 word))::64 word) + ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8028),8]::64 word)::64 word)) \<and> RBP \<sigma> = RBP\<^sub>0 \<and> R13 \<sigma> = ucast ((\<langle>31,0\<rangle>RDX\<^sub>0::32 word)) \<and> R12 \<sigma> = ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)) \<and> R9 \<sigma> = R9\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8028),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8028),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8030),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8030),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8034),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8034),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8038),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8038),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = 0xc0b7\<close>
declare Q_memmove_addr_0xc0b2_2_def[Qs]

schematic_goal insert_direntries_0_1_0xc0b2_0xc0b2_2[blocks]:
  assumes \<open>(P_0xc0b2_2 && P_0xc0b2_2_regions) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0xc0b2 2 \<sigma> \<triangleq> ?\<sigma> \<and> Q_memmove_addr_0xc0b2_2 ?\<sigma> \<and> block_usage P_0xc0b2_2_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0xc0b2_2_def P_0xc0b2_2_regions_def post: Q_memmove_addr_0xc0b2_2_def regionset: P_0xc0b2_2_regions_set_def)

definition P_0xc0b7_3 :: state_pred where
  \<open>P_0xc0b7_3 \<sigma> \<equiv> RIP \<sigma> = 0xc0b7 \<and> RAX \<sigma> = memmove_0xc0b2_retval \<and> RBX \<sigma> = RDI\<^sub>0 \<and> RCX \<sigma> = ucast ((\<langle>31,0\<rangle>(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8038),4]::32 word)::32 word) * (\<langle>31,0\<rangle>((ucast (((\<langle>31,0\<rangle>RDX\<^sub>0::32 word)::32 word))::64 word) + ((\<langle>63,0\<rangle>((ucast (((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word))::64 word) * (0x1::64 word))::64 word)::64 word))::32 word))::32 word)) \<and> RDX \<sigma> = ucast ((\<langle>31,0\<rangle>(((((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8034),4]::32 word)::32 word) - (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) * (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8038),4]::32 word))::32 word)) \<and> RDI \<sigma> = (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8028),8]::64 word)::64 word) + (\<langle>63,0\<rangle>((ucast (((\<langle>31,0\<rangle>(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8038),4]::32 word)::32 word) * (\<langle>31,0\<rangle>((ucast (((\<langle>31,0\<rangle>RDX\<^sub>0::32 word)::32 word))::64 word) + ((\<langle>63,0\<rangle>((ucast (((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word))::64 word) * (0x1::64 word))::64 word)::64 word))::32 word))::32 word)::32 word))::64 word) * (0x1::64 word))::64 word)) \<and> RSI \<sigma> = ((ucast (((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) * (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8038),4]::32 word))::32 word)::32 word))::64 word) + ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8028),8]::64 word)::64 word)) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x28) \<and> RBP \<sigma> = RBP\<^sub>0 \<and> R13 \<sigma> = ucast ((\<langle>31,0\<rangle>RDX\<^sub>0::32 word)) \<and> R12 \<sigma> = ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)) \<and> R9 \<sigma> = R9\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8028),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8028),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8030),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8030),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8034),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8034),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8038),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8038),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = 0xc0b7\<close>
declare P_0xc0b7_3_def[Ps]

definition P_0xc0b7_3_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0xc0b7_3_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((RDI\<^sub>0::64 word) + 0x8028), 8),
    (2, ((RDI\<^sub>0::64 word) + 0x8030), 4),
    (3, ((RDI\<^sub>0::64 word) + 0x8034), 4),
    (4, ((RDI\<^sub>0::64 word) + 0x8038), 4),
    (5, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x30), 8)
  }\<close>

definition P_0xc0b7_3_regions :: state_pred where
  \<open>P_0xc0b7_3_regions \<sigma> \<equiv> \<exists>regions. P_0xc0b7_3_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0xc0d2_3 :: state_pred where
  \<open>Q_0xc0d2_3 \<sigma> \<equiv> RIP \<sigma> = 0xc0d2 \<and> RAX \<sigma> = ((ucast (((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) * (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8038),4]::32 word))::32 word)::32 word))::64 word) + ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8028),8]::64 word)::64 word)) \<and> RBX \<sigma> = RDI\<^sub>0 \<and> RCX \<sigma> = ucast ((\<langle>31,0\<rangle>(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8038),4]::32 word)::32 word) * (\<langle>31,0\<rangle>((ucast (((\<langle>31,0\<rangle>RDX\<^sub>0::32 word)::32 word))::64 word) + ((\<langle>63,0\<rangle>((ucast (((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word))::64 word) * (0x1::64 word))::64 word)::64 word))::32 word))::32 word)) \<and> RDI \<sigma> = (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8028),8]::64 word)::64 word) + (\<langle>63,0\<rangle>((ucast (((\<langle>31,0\<rangle>(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8038),4]::32 word)::32 word) * (\<langle>31,0\<rangle>((ucast (((\<langle>31,0\<rangle>RDX\<^sub>0::32 word)::32 word))::64 word) + ((\<langle>63,0\<rangle>((ucast (((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word))::64 word) * (0x1::64 word))::64 word)::64 word))::32 word))::32 word)::32 word))::64 word) * (0x1::64 word))::64 word)) \<and> RSI \<sigma> = ((ucast (((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) * (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8038),4]::32 word))::32 word)::32 word))::64 word) + ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8028),8]::64 word)::64 word)) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x28) \<and> RBP \<sigma> = RBP\<^sub>0 \<and> R13 \<sigma> = ucast ((\<langle>31,0\<rangle>RDX\<^sub>0::32 word)) \<and> R12 \<sigma> = ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)) \<and> R9 \<sigma> = ((ucast (((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) * (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8038),4]::32 word))::32 word)::32 word))::64 word) + ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8028),8]::64 word)::64 word)) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8028),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8028),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8030),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8030),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8038),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8038),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = 0xc0b7\<close>
declare Q_0xc0d2_3_def[Qs]

schematic_goal insert_direntries_0_5_0xc0b7_0xc0cf_3[blocks]:
  assumes \<open>(P_0xc0b7_3 && P_0xc0b7_3_regions) \<sigma>\<close>
  shows \<open>exec_block 5 0xc0cf 3 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0xc0d2_3 ?\<sigma> \<and> block_usage P_0xc0b7_3_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0xc0b7_3_def P_0xc0b7_3_regions_def post: Q_0xc0d2_3_def regionset: P_0xc0b7_3_regions_set_def)

definition P_0xc0d2_true_4 :: state_pred where
  \<open>P_0xc0d2_true_4 \<sigma> \<equiv> RIP \<sigma> = 0xc0d2 \<and> RAX \<sigma> = ((ucast (((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) * (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8038),4]::32 word))::32 word)::32 word))::64 word) + ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8028),8]::64 word)::64 word)) \<and> RBX \<sigma> = RDI\<^sub>0 \<and> RCX \<sigma> = ucast ((\<langle>31,0\<rangle>(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8038),4]::32 word)::32 word) * (\<langle>31,0\<rangle>((ucast (((\<langle>31,0\<rangle>RDX\<^sub>0::32 word)::32 word))::64 word) + ((\<langle>63,0\<rangle>((ucast (((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word))::64 word) * (0x1::64 word))::64 word)::64 word))::32 word))::32 word)) \<and> RDI \<sigma> = (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8028),8]::64 word)::64 word) + (\<langle>63,0\<rangle>((ucast (((\<langle>31,0\<rangle>(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8038),4]::32 word)::32 word) * (\<langle>31,0\<rangle>((ucast (((\<langle>31,0\<rangle>RDX\<^sub>0::32 word)::32 word))::64 word) + ((\<langle>63,0\<rangle>((ucast (((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word))::64 word) * (0x1::64 word))::64 word)::64 word))::32 word))::32 word)::32 word))::64 word) * (0x1::64 word))::64 word)) \<and> RSI \<sigma> = ((ucast (((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) * (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8038),4]::32 word))::32 word)::32 word))::64 word) + ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8028),8]::64 word)::64 word)) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x28) \<and> RBP \<sigma> = RBP\<^sub>0 \<and> R13 \<sigma> = ucast ((\<langle>31,0\<rangle>RDX\<^sub>0::32 word)) \<and> R12 \<sigma> = ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)) \<and> R9 \<sigma> = ((ucast (((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) * (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8038),4]::32 word))::32 word)::32 word))::64 word) + ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8028),8]::64 word)::64 word)) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8028),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8028),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8030),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8030),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8038),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8038),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = 0xc0b7\<close>
declare P_0xc0d2_true_4_def[Ps]

definition P_0xc0d2_true_4_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0xc0d2_true_4_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((RDI\<^sub>0::64 word) + 0x8028), 8),
    (2, ((RDI\<^sub>0::64 word) + 0x8030), 4),
    (3, ((RDI\<^sub>0::64 word) + 0x8038), 4),
    (4, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x30), 8)
  }\<close>

definition P_0xc0d2_true_4_regions :: state_pred where
  \<open>P_0xc0d2_true_4_regions \<sigma> \<equiv> \<exists>regions. P_0xc0d2_true_4_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0xc0e2_4 :: state_pred where
  \<open>Q_0xc0e2_4 \<sigma> \<equiv> RIP \<sigma> = 0xc0e2 \<and> RBX \<sigma> = RDI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x28) \<and> R13 \<sigma> = ucast ((\<langle>31,0\<rangle>RDX\<^sub>0::32 word)) \<and> R12 \<sigma> = ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8038),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8038),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBX\<^sub>0\<close>
declare Q_0xc0e2_4_def[Qs]

schematic_goal insert_direntries_0_1_0xc0d2_0xc0d2_4[blocks]:
  assumes \<open>(P_0xc0d2_true_4 && P_0xc0d2_true_4_regions && ZF) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0xc0d2 4 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0xc0e2_4 ?\<sigma> \<and> block_usage P_0xc0d2_true_4_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0xc0d2_true_4_def P_0xc0d2_true_4_regions_def post: Q_0xc0e2_4_def regionset: P_0xc0d2_true_4_regions_set_def)

definition P_0xc0d2_false_5 :: state_pred where
  \<open>P_0xc0d2_false_5 \<sigma> \<equiv> RIP \<sigma> = 0xc0d2 \<and> RAX \<sigma> = ((ucast (((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) * (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8038),4]::32 word))::32 word)::32 word))::64 word) + ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8028),8]::64 word)::64 word)) \<and> RBX \<sigma> = RDI\<^sub>0 \<and> RCX \<sigma> = ucast ((\<langle>31,0\<rangle>(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8038),4]::32 word)::32 word) * (\<langle>31,0\<rangle>((ucast (((\<langle>31,0\<rangle>RDX\<^sub>0::32 word)::32 word))::64 word) + ((\<langle>63,0\<rangle>((ucast (((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word))::64 word) * (0x1::64 word))::64 word)::64 word))::32 word))::32 word)) \<and> RDI \<sigma> = (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8028),8]::64 word)::64 word) + (\<langle>63,0\<rangle>((ucast (((\<langle>31,0\<rangle>(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8038),4]::32 word)::32 word) * (\<langle>31,0\<rangle>((ucast (((\<langle>31,0\<rangle>RDX\<^sub>0::32 word)::32 word))::64 word) + ((\<langle>63,0\<rangle>((ucast (((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word))::64 word) * (0x1::64 word))::64 word)::64 word))::32 word))::32 word)::32 word))::64 word) * (0x1::64 word))::64 word)) \<and> RSI \<sigma> = ((ucast (((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) * (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8038),4]::32 word))::32 word)::32 word))::64 word) + ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8028),8]::64 word)::64 word)) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x28) \<and> RBP \<sigma> = RBP\<^sub>0 \<and> R13 \<sigma> = ucast ((\<langle>31,0\<rangle>RDX\<^sub>0::32 word)) \<and> R12 \<sigma> = ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)) \<and> R9 \<sigma> = ((ucast (((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) * (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8038),4]::32 word))::32 word)::32 word))::64 word) + ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8028),8]::64 word)::64 word)) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8028),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8028),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8030),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8030),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8038),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8038),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = 0xc0b7\<close>
declare P_0xc0d2_false_5_def[Ps]

definition P_0xc0d2_false_5_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0xc0d2_false_5_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((RDI\<^sub>0::64 word) + 0x8028), 8),
    (2, ((RDI\<^sub>0::64 word) + 0x8030), 4),
    (3, ((RDI\<^sub>0::64 word) + 0x8038), 4),
    (4, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x30), 8)
  }\<close>

definition P_0xc0d2_false_5_regions :: state_pred where
  \<open>P_0xc0d2_false_5_regions \<sigma> \<equiv> \<exists>regions. P_0xc0d2_false_5_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0xc0dd_5 :: state_pred where
  \<open>Q_0xc0dd_5 \<sigma> \<equiv> RIP \<sigma> = 0xc0dd \<and> RAX \<sigma> = ((ucast (((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) * (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8038),4]::32 word))::32 word)::32 word))::64 word) + ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8028),8]::64 word)::64 word)) \<and> RBX \<sigma> = RDI\<^sub>0 \<and> RCX \<sigma> = ucast ((\<langle>31,0\<rangle>(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8038),4]::32 word)::32 word) * (\<langle>31,0\<rangle>((ucast (((\<langle>31,0\<rangle>RDX\<^sub>0::32 word)::32 word))::64 word) + ((\<langle>63,0\<rangle>((ucast (((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word))::64 word) * (0x1::64 word))::64 word)::64 word))::32 word))::32 word)) \<and> RDX \<sigma> = ucast ((\<langle>31,0\<rangle>RDX\<^sub>0::32 word)) \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x28) \<and> RBP \<sigma> = RBP\<^sub>0 \<and> R13 \<sigma> = ucast ((\<langle>31,0\<rangle>RDX\<^sub>0::32 word)) \<and> R12 \<sigma> = ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)) \<and> R9 \<sigma> = ((ucast (((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) * (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8038),4]::32 word))::32 word)::32 word))::64 word) + ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8028),8]::64 word)::64 word)) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8028),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8028),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8030),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8030),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8038),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8038),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = 0xc0b7\<close>
declare Q_0xc0dd_5_def[Qs]

schematic_goal insert_direntries_0_4_0xc0d2_0xc0da_5[blocks]:
  assumes \<open>(P_0xc0d2_false_5 && P_0xc0d2_false_5_regions && ! ZF) \<sigma>\<close>
  shows \<open>exec_block 4 0xc0da 5 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0xc0dd_5 ?\<sigma> \<and> block_usage P_0xc0d2_false_5_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0xc0d2_false_5_def P_0xc0d2_false_5_regions_def post: Q_0xc0dd_5_def regionset: P_0xc0d2_false_5_regions_set_def)

definition P_0xc0dd_6 :: state_pred where
  \<open>P_0xc0dd_6 \<sigma> \<equiv> RIP \<sigma> = 0xc0dd \<and> RAX \<sigma> = ((ucast (((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) * (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8038),4]::32 word))::32 word)::32 word))::64 word) + ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8028),8]::64 word)::64 word)) \<and> RBX \<sigma> = RDI\<^sub>0 \<and> RCX \<sigma> = ucast ((\<langle>31,0\<rangle>(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8038),4]::32 word)::32 word) * (\<langle>31,0\<rangle>((ucast (((\<langle>31,0\<rangle>RDX\<^sub>0::32 word)::32 word))::64 word) + ((\<langle>63,0\<rangle>((ucast (((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word))::64 word) * (0x1::64 word))::64 word)::64 word))::32 word))::32 word)) \<and> RDX \<sigma> = ucast ((\<langle>31,0\<rangle>RDX\<^sub>0::32 word)) \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x28) \<and> RBP \<sigma> = RBP\<^sub>0 \<and> R13 \<sigma> = ucast ((\<langle>31,0\<rangle>RDX\<^sub>0::32 word)) \<and> R12 \<sigma> = ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)) \<and> R9 \<sigma> = ((ucast (((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) * (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8038),4]::32 word))::32 word)::32 word))::64 word) + ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8028),8]::64 word)::64 word)) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8028),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8028),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8030),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8030),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8038),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8038),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = 0xc0b7\<close>
declare P_0xc0dd_6_def[Ps]

definition P_0xc0dd_6_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0xc0dd_6_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((RDI\<^sub>0::64 word) + 0x8028), 8),
    (2, ((RDI\<^sub>0::64 word) + 0x8030), 4),
    (3, ((RDI\<^sub>0::64 word) + 0x8038), 4),
    (4, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x30), 8)
  }\<close>

definition P_0xc0dd_6_regions :: state_pred where
  \<open>P_0xc0dd_6_regions \<sigma> \<equiv> \<exists>regions. P_0xc0dd_6_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_adjust_dirindices_addr_0xc0dd_6 :: state_pred where
  \<open>Q_adjust_dirindices_addr_0xc0dd_6 \<sigma> \<equiv> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x30) \<and> RIP \<sigma> = adjust_dirindices_addr \<and> RAX \<sigma> = ((ucast (((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) * (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8038),4]::32 word))::32 word)::32 word))::64 word) + ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8028),8]::64 word)::64 word)) \<and> RBX \<sigma> = RDI\<^sub>0 \<and> R13 \<sigma> = ucast ((\<langle>31,0\<rangle>RDX\<^sub>0::32 word)) \<and> R12 \<sigma> = ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8038),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8038),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBX\<^sub>0\<close>
declare Q_adjust_dirindices_addr_0xc0dd_6_def[Qs]

schematic_goal insert_direntries_0_1_0xc0dd_0xc0dd_6[blocks]:
  assumes \<open>(P_0xc0dd_6 && P_0xc0dd_6_regions) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0xc0dd 6 \<sigma> \<triangleq> ?\<sigma> \<and> Q_adjust_dirindices_addr_0xc0dd_6 ?\<sigma> \<and> block_usage P_0xc0dd_6_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0xc0dd_6_def P_0xc0dd_6_regions_def post: Q_adjust_dirindices_addr_0xc0dd_6_def regionset: P_0xc0dd_6_regions_set_def)

definition P_0xc066_false_7 :: state_pred where
  \<open>P_0xc066_false_7 \<sigma> \<equiv> RIP \<sigma> = 0xc066 \<and> RAX \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8028),8]::64 word) \<and> RBX \<sigma> = RDI\<^sub>0 \<and> RCX \<sigma> = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8038),4]::32 word)) \<and> RDX \<sigma> = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8034),4]::32 word)) \<and> RDI \<sigma> = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8030),4]::32 word)) \<and> RSI \<sigma> = ucast ((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>((ucast (((\<langle>31,0\<rangle>RDX\<^sub>0::32 word)::32 word))::64 word) + ((\<langle>63,0\<rangle>(((\<langle>63,0\<rangle>(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8034),4]::32 word)::64 word)::64 word) * 0x1)::64 word)::64 word))::32 word)::32 word) * (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8038),4]::32 word))::32 word)) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x28) \<and> RBP \<sigma> = RBP\<^sub>0 \<and> R13 \<sigma> = ucast ((\<langle>31,0\<rangle>RDX\<^sub>0::32 word)) \<and> R12 \<sigma> = ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)) \<and> R9 \<sigma> = R9\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8028),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8028),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8030),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8030),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8034),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8034),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8038),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8038),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBX\<^sub>0\<close>
declare P_0xc066_false_7_def[Ps]

definition P_0xc066_false_7_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0xc066_false_7_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((RDI\<^sub>0::64 word) + 0x8028), 8),
    (2, ((RDI\<^sub>0::64 word) + 0x8030), 4),
    (3, ((RDI\<^sub>0::64 word) + 0x8034), 4),
    (4, ((RDI\<^sub>0::64 word) + 0x8038), 4),
    (5, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x20), 8)
  }\<close>

definition P_0xc066_false_7_regions :: state_pred where
  \<open>P_0xc066_false_7_regions \<sigma> \<equiv> \<exists>regions. P_0xc066_false_7_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0xc074_7 :: state_pred where
  \<open>Q_0xc074_7 \<sigma> \<equiv> RIP \<sigma> = 0xc074 \<and> RAX \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8028),8]::64 word) \<and> RBX \<sigma> = RDI\<^sub>0 \<and> RCX \<sigma> = ucast ((\<langle>31,0\<rangle>(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8038),4]::32 word)::32 word) * (\<langle>31,0\<rangle>RDX\<^sub>0::32 word))::32 word)) \<and> RDX \<sigma> = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8034),4]::32 word)) \<and> RDI \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8028),8]::64 word) \<and> RSI \<sigma> = ucast ((\<langle>31,0\<rangle>((ucast (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8030),4]::32 word)::32 word))::64 word) + ((\<langle>63,0\<rangle>((ucast (((\<langle>31,0\<rangle>(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8038),4]::32 word)::32 word) * (\<langle>31,0\<rangle>RDX\<^sub>0::32 word))::32 word)::32 word))::64 word) * (0x1::64 word))::64 word)::64 word))::32 word)) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x28) \<and> RBP \<sigma> = ucast ((\<langle>31,0\<rangle>(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8038),4]::32 word)::32 word) * (\<langle>31,0\<rangle>RDX\<^sub>0::32 word))::32 word)) \<and> R13 \<sigma> = ucast ((\<langle>31,0\<rangle>RDX\<^sub>0::32 word)) \<and> R12 \<sigma> = ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)) \<and> R9 \<sigma> = R9\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8028),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8028),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8030),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8030),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8034),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8034),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8038),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8038),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBX\<^sub>0\<close>
declare Q_0xc074_7_def[Qs]

schematic_goal insert_direntries_0_5_0xc066_0xc072_7[blocks]:
  assumes \<open>(P_0xc066_false_7 && P_0xc066_false_7_regions && ! jbe) \<sigma>\<close>
  shows \<open>exec_block 5 0xc072 7 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0xc074_7 ?\<sigma> \<and> block_usage P_0xc066_false_7_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0xc066_false_7_def P_0xc066_false_7_regions_def post: Q_0xc074_7_def regionset: P_0xc066_false_7_regions_set_def)

definition P_0xc074_8 :: state_pred where
  \<open>P_0xc074_8 \<sigma> \<equiv> RIP \<sigma> = 0xc074 \<and> RAX \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8028),8]::64 word) \<and> RBX \<sigma> = RDI\<^sub>0 \<and> RCX \<sigma> = ucast ((\<langle>31,0\<rangle>(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8038),4]::32 word)::32 word) * (\<langle>31,0\<rangle>RDX\<^sub>0::32 word))::32 word)) \<and> RDX \<sigma> = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8034),4]::32 word)) \<and> RDI \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8028),8]::64 word) \<and> RSI \<sigma> = ucast ((\<langle>31,0\<rangle>((ucast (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8030),4]::32 word)::32 word))::64 word) + ((\<langle>63,0\<rangle>((ucast (((\<langle>31,0\<rangle>(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8038),4]::32 word)::32 word) * (\<langle>31,0\<rangle>RDX\<^sub>0::32 word))::32 word)::32 word))::64 word) * (0x1::64 word))::64 word)::64 word))::32 word)) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x28) \<and> RBP \<sigma> = ucast ((\<langle>31,0\<rangle>(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8038),4]::32 word)::32 word) * (\<langle>31,0\<rangle>RDX\<^sub>0::32 word))::32 word)) \<and> R13 \<sigma> = ucast ((\<langle>31,0\<rangle>RDX\<^sub>0::32 word)) \<and> R12 \<sigma> = ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)) \<and> R9 \<sigma> = R9\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8028),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8028),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8030),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8030),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8034),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8034),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8038),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8038),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBX\<^sub>0\<close>
declare P_0xc074_8_def[Ps]

definition P_0xc074_8_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0xc074_8_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((RDI\<^sub>0::64 word) + 0x8028), 8),
    (2, ((RDI\<^sub>0::64 word) + 0x8030), 4),
    (3, ((RDI\<^sub>0::64 word) + 0x8034), 4),
    (4, ((RDI\<^sub>0::64 word) + 0x8038), 4),
    (5, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x30), 8)
  }\<close>

definition P_0xc074_8_regions :: state_pred where
  \<open>P_0xc074_8_regions \<sigma> \<equiv> \<exists>regions. P_0xc074_8_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_qemu_realloc_addr_0xc074_8 :: state_pred where
  \<open>Q_qemu_realloc_addr_0xc074_8 \<sigma> \<equiv> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x30) \<and> RIP \<sigma> = qemu_realloc_addr \<and> RAX \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8028),8]::64 word) \<and> RBX \<sigma> = RDI\<^sub>0 \<and> RCX \<sigma> = ucast ((\<langle>31,0\<rangle>(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8038),4]::32 word)::32 word) * (\<langle>31,0\<rangle>RDX\<^sub>0::32 word))::32 word)) \<and> RDX \<sigma> = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8034),4]::32 word)) \<and> RDI \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8028),8]::64 word) \<and> RSI \<sigma> = ucast ((\<langle>31,0\<rangle>((ucast (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8030),4]::32 word)::32 word))::64 word) + ((\<langle>63,0\<rangle>((ucast (((\<langle>31,0\<rangle>(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8038),4]::32 word)::32 word) * (\<langle>31,0\<rangle>RDX\<^sub>0::32 word))::32 word)::32 word))::64 word) * (0x1::64 word))::64 word)::64 word))::32 word)) \<and> RBP \<sigma> = ucast ((\<langle>31,0\<rangle>(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8038),4]::32 word)::32 word) * (\<langle>31,0\<rangle>RDX\<^sub>0::32 word))::32 word)) \<and> R13 \<sigma> = ucast ((\<langle>31,0\<rangle>RDX\<^sub>0::32 word)) \<and> R12 \<sigma> = ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)) \<and> R9 \<sigma> = R9\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8028),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8028),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8030),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8030),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8034),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8034),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8038),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8038),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = 0xc079\<close>
declare Q_qemu_realloc_addr_0xc074_8_def[Qs]

schematic_goal insert_direntries_0_1_0xc074_0xc074_8[blocks]:
  assumes \<open>(P_0xc074_8 && P_0xc074_8_regions) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0xc074 8 \<sigma> \<triangleq> ?\<sigma> \<and> Q_qemu_realloc_addr_0xc074_8 ?\<sigma> \<and> block_usage P_0xc074_8_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0xc074_8_def P_0xc074_8_regions_def post: Q_qemu_realloc_addr_0xc074_8_def regionset: P_0xc074_8_regions_set_def)

definition P_0xc079_9 :: state_pred where
  \<open>P_0xc079_9 \<sigma> \<equiv> RIP \<sigma> = 0xc079 \<and> RAX \<sigma> = qemu_realloc_0xc074_retval \<and> RBX \<sigma> = RDI\<^sub>0 \<and> RCX \<sigma> = ucast ((\<langle>31,0\<rangle>(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8038),4]::32 word)::32 word) * (\<langle>31,0\<rangle>RDX\<^sub>0::32 word))::32 word)) \<and> RDX \<sigma> = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8034),4]::32 word)) \<and> RDI \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8028),8]::64 word) \<and> RSI \<sigma> = ucast ((\<langle>31,0\<rangle>((ucast (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8030),4]::32 word)::32 word))::64 word) + ((\<langle>63,0\<rangle>((ucast (((\<langle>31,0\<rangle>(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8038),4]::32 word)::32 word) * (\<langle>31,0\<rangle>RDX\<^sub>0::32 word))::32 word)::32 word))::64 word) * (0x1::64 word))::64 word)::64 word))::32 word)) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x28) \<and> RBP \<sigma> = ucast ((\<langle>31,0\<rangle>(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8038),4]::32 word)::32 word) * (\<langle>31,0\<rangle>RDX\<^sub>0::32 word))::32 word)) \<and> R13 \<sigma> = ucast ((\<langle>31,0\<rangle>RDX\<^sub>0::32 word)) \<and> R12 \<sigma> = ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)) \<and> R9 \<sigma> = R9\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8028),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8028),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8030),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8030),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8034),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8034),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8038),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8038),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = 0xc079\<close>
declare P_0xc079_9_def[Ps]

definition P_0xc079_9_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0xc079_9_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((RDI\<^sub>0::64 word) + 0x8028), 8),
    (2, ((RDI\<^sub>0::64 word) + 0x8030), 4),
    (3, ((RDI\<^sub>0::64 word) + 0x8034), 4),
    (4, ((RDI\<^sub>0::64 word) + 0x8038), 4),
    (5, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x30), 8)
  }\<close>

definition P_0xc079_9_regions :: state_pred where
  \<open>P_0xc079_9_regions \<sigma> \<equiv> \<exists>regions. P_0xc079_9_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0xc083_9 :: state_pred where
  \<open>Q_0xc083_9 \<sigma> \<equiv> RIP \<sigma> = 0xc083 \<and> RBX \<sigma> = RDI\<^sub>0 \<and> RCX \<sigma> = ucast ((\<langle>31,0\<rangle>(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8038),4]::32 word)::32 word) * (\<langle>31,0\<rangle>RDX\<^sub>0::32 word))::32 word)) \<and> RDX \<sigma> = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8034),4]::32 word)) \<and> RSI \<sigma> = ucast ((\<langle>31,0\<rangle>((ucast (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8030),4]::32 word)::32 word))::64 word) + ((\<langle>63,0\<rangle>((ucast (((\<langle>31,0\<rangle>(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8038),4]::32 word)::32 word) * (\<langle>31,0\<rangle>RDX\<^sub>0::32 word))::32 word)::32 word))::64 word) * (0x1::64 word))::64 word)::64 word))::32 word)) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x28) \<and> RBP \<sigma> = ucast ((\<langle>31,0\<rangle>(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8038),4]::32 word)::32 word) * (\<langle>31,0\<rangle>RDX\<^sub>0::32 word))::32 word)) \<and> R13 \<sigma> = ucast ((\<langle>31,0\<rangle>RDX\<^sub>0::32 word)) \<and> R12 \<sigma> = ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)) \<and> R9 \<sigma> = R9\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8030),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8030),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8034),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8034),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8038),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8038),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = 0xc079\<close>
declare Q_0xc083_9_def[Qs]

schematic_goal insert_direntries_0_2_0xc079_0xc080_9[blocks]:
  assumes \<open>(P_0xc079_9 && P_0xc079_9_regions) \<sigma>\<close>
  shows \<open>exec_block 2 0xc080 9 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0xc083_9 ?\<sigma> \<and> block_usage P_0xc079_9_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0xc079_9_def P_0xc079_9_regions_def post: Q_0xc083_9_def regionset: P_0xc079_9_regions_set_def)

definition P_0xc083_true_10 :: state_pred where
  \<open>P_0xc083_true_10 \<sigma> \<equiv> RIP \<sigma> = 0xc083 \<and> RBX \<sigma> = RDI\<^sub>0 \<and> RCX \<sigma> = ucast ((\<langle>31,0\<rangle>(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8038),4]::32 word)::32 word) * (\<langle>31,0\<rangle>RDX\<^sub>0::32 word))::32 word)) \<and> RDX \<sigma> = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8034),4]::32 word)) \<and> RSI \<sigma> = ucast ((\<langle>31,0\<rangle>((ucast (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8030),4]::32 word)::32 word))::64 word) + ((\<langle>63,0\<rangle>((ucast (((\<langle>31,0\<rangle>(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8038),4]::32 word)::32 word) * (\<langle>31,0\<rangle>RDX\<^sub>0::32 word))::32 word)::32 word))::64 word) * (0x1::64 word))::64 word)::64 word))::32 word)) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x28) \<and> RBP \<sigma> = ucast ((\<langle>31,0\<rangle>(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8038),4]::32 word)::32 word) * (\<langle>31,0\<rangle>RDX\<^sub>0::32 word))::32 word)) \<and> R13 \<sigma> = ucast ((\<langle>31,0\<rangle>RDX\<^sub>0::32 word)) \<and> R12 \<sigma> = ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)) \<and> R9 \<sigma> = R9\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8030),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8030),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8034),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8034),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8038),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8038),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = 0xc079\<close>
declare P_0xc083_true_10_def[Ps]

definition P_0xc083_true_10_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0xc083_true_10_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((RDI\<^sub>0::64 word) + 0x8030), 4),
    (2, ((RDI\<^sub>0::64 word) + 0x8034), 4),
    (3, ((RDI\<^sub>0::64 word) + 0x8038), 4),
    (4, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x30), 8)
  }\<close>

definition P_0xc083_true_10_regions :: state_pred where
  \<open>P_0xc083_true_10_regions \<sigma> \<equiv> \<exists>regions. P_0xc083_true_10_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0xc0e2_10 :: state_pred where
  \<open>Q_0xc0e2_10 \<sigma> \<equiv> RIP \<sigma> = 0xc0e2 \<and> RBX \<sigma> = RDI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x28) \<and> R13 \<sigma> = ucast ((\<langle>31,0\<rangle>RDX\<^sub>0::32 word)) \<and> R12 \<sigma> = ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8038),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8038),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBX\<^sub>0\<close>
declare Q_0xc0e2_10_def[Qs]

schematic_goal insert_direntries_0_3_0xc083_0xc0f3_10[blocks]:
  assumes \<open>(P_0xc083_true_10 && P_0xc083_true_10_regions && ZF) \<sigma>\<close>
  shows \<open>exec_block 3 0xc0f3 10 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0xc0e2_10 ?\<sigma> \<and> block_usage P_0xc083_true_10_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0xc083_true_10_def P_0xc083_true_10_regions_def post: Q_0xc0e2_10_def regionset: P_0xc083_true_10_regions_set_def)

definition P_0xc083_false_11 :: state_pred where
  \<open>P_0xc083_false_11 \<sigma> \<equiv> RIP \<sigma> = 0xc083 \<and> RBX \<sigma> = RDI\<^sub>0 \<and> RCX \<sigma> = ucast ((\<langle>31,0\<rangle>(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8038),4]::32 word)::32 word) * (\<langle>31,0\<rangle>RDX\<^sub>0::32 word))::32 word)) \<and> RDX \<sigma> = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8034),4]::32 word)) \<and> RSI \<sigma> = ucast ((\<langle>31,0\<rangle>((ucast (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8030),4]::32 word)::32 word))::64 word) + ((\<langle>63,0\<rangle>((ucast (((\<langle>31,0\<rangle>(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8038),4]::32 word)::32 word) * (\<langle>31,0\<rangle>RDX\<^sub>0::32 word))::32 word)::32 word))::64 word) * (0x1::64 word))::64 word)::64 word))::32 word)) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x28) \<and> RBP \<sigma> = ucast ((\<langle>31,0\<rangle>(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8038),4]::32 word)::32 word) * (\<langle>31,0\<rangle>RDX\<^sub>0::32 word))::32 word)) \<and> R13 \<sigma> = ucast ((\<langle>31,0\<rangle>RDX\<^sub>0::32 word)) \<and> R12 \<sigma> = ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)) \<and> R9 \<sigma> = R9\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8030),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8030),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8034),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8034),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8038),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8038),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = 0xc079\<close>
declare P_0xc083_false_11_def[Ps]

definition P_0xc083_false_11_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0xc083_false_11_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((RDI\<^sub>0::64 word) + 0x8030), 4),
    (2, ((RDI\<^sub>0::64 word) + 0x8034), 4),
    (3, ((RDI\<^sub>0::64 word) + 0x8038), 4),
    (4, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x30), 8)
  }\<close>

definition P_0xc083_false_11_regions :: state_pred where
  \<open>P_0xc083_false_11_regions \<sigma> \<equiv> \<exists>regions. P_0xc083_false_11_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0xc097_11 :: state_pred where
  \<open>Q_0xc097_11 \<sigma> \<equiv> RIP \<sigma> = 0xc097 \<and> RBX \<sigma> = RDI\<^sub>0 \<and> RCX \<sigma> = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8038),4]::32 word)) \<and> RDX \<sigma> = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8034),4]::32 word)) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x28) \<and> RBP \<sigma> = ucast ((\<langle>31,0\<rangle>(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8038),4]::32 word)::32 word) * (\<langle>31,0\<rangle>RDX\<^sub>0::32 word))::32 word)) \<and> R13 \<sigma> = ucast ((\<langle>31,0\<rangle>RDX\<^sub>0::32 word)) \<and> R12 \<sigma> = ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)) \<and> R9 \<sigma> = R9\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8034),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8034),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8038),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8038),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = 0xc079\<close>
declare Q_0xc097_11_def[Qs]

schematic_goal insert_direntries_0_4_0xc083_0xc091_11[blocks]:
  assumes \<open>(P_0xc083_false_11 && P_0xc083_false_11_regions && ! ZF) \<sigma>\<close>
  shows \<open>exec_block 4 0xc091 11 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0xc097_11 ?\<sigma> \<and> block_usage P_0xc083_false_11_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0xc083_false_11_def P_0xc083_false_11_regions_def post: Q_0xc097_11_def regionset: P_0xc083_false_11_regions_set_def)

definition P_0xc097_12 :: state_pred where
  \<open>P_0xc097_12 \<sigma> \<equiv> RIP \<sigma> = 0xc097 \<and> RBX \<sigma> = RDI\<^sub>0 \<and> RCX \<sigma> = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8038),4]::32 word)) \<and> RDX \<sigma> = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8034),4]::32 word)) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x28) \<and> RBP \<sigma> = ucast ((\<langle>31,0\<rangle>(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8038),4]::32 word)::32 word) * (\<langle>31,0\<rangle>RDX\<^sub>0::32 word))::32 word)) \<and> R13 \<sigma> = ucast ((\<langle>31,0\<rangle>RDX\<^sub>0::32 word)) \<and> R12 \<sigma> = ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)) \<and> R9 \<sigma> = R9\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8034),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8034),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8038),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8038),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = 0xc079\<close>
declare P_0xc097_12_def[Ps]

definition P_0xc097_12_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0xc097_12_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((RDI\<^sub>0::64 word) + 0x8034), 4),
    (2, ((RDI\<^sub>0::64 word) + 0x8038), 4),
    (3, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x30), 8)
  }\<close>

definition P_0xc097_12_regions :: state_pred where
  \<open>P_0xc097_12_regions \<sigma> \<equiv> \<exists>regions. P_0xc097_12_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0xc0b2_12 :: state_pred where
  \<open>Q_0xc0b2_12 \<sigma> \<equiv> RIP \<sigma> = 0xc0b2 \<and> RBX \<sigma> = RDI\<^sub>0 \<and> RCX \<sigma> = ucast ((\<langle>31,0\<rangle>(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8038),4]::32 word)::32 word) * (\<langle>31,0\<rangle>((ucast (((\<langle>31,0\<rangle>RDX\<^sub>0::32 word)::32 word))::64 word) + ((\<langle>63,0\<rangle>((ucast (((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word))::64 word) * (0x1::64 word))::64 word)::64 word))::32 word))::32 word)) \<and> RDX \<sigma> = ucast ((\<langle>31,0\<rangle>(((((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8034),4]::32 word)::32 word) - (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) * (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8038),4]::32 word))::32 word)) \<and> RDI \<sigma> = ((RAX \<sigma>::64 word) + (\<langle>63,0\<rangle>((ucast (((\<langle>31,0\<rangle>(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8038),4]::32 word)::32 word) * (\<langle>31,0\<rangle>((ucast (((\<langle>31,0\<rangle>RDX\<^sub>0::32 word)::32 word))::64 word) + ((\<langle>63,0\<rangle>((ucast (((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word))::64 word) * (0x1::64 word))::64 word)::64 word))::32 word))::32 word)::32 word))::64 word) * (0x1::64 word))::64 word)) \<and> RSI \<sigma> = ((ucast (((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) * (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8038),4]::32 word))::32 word)::32 word))::64 word) + (RAX \<sigma>::64 word)) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x28) \<and> RBP \<sigma> = ucast ((\<langle>31,0\<rangle>(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8038),4]::32 word)::32 word) * (\<langle>31,0\<rangle>RDX\<^sub>0::32 word))::32 word)) \<and> R13 \<sigma> = ucast ((\<langle>31,0\<rangle>RDX\<^sub>0::32 word)) \<and> R12 \<sigma> = ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)) \<and> R9 \<sigma> = R9\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8034),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8034),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8038),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8038),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = 0xc079\<close>
declare Q_0xc0b2_12_def[Qs]

schematic_goal insert_direntries_0_8_0xc097_0xc0ae_12[blocks]:
  assumes \<open>(P_0xc097_12 && P_0xc097_12_regions) \<sigma>\<close>
  shows \<open>exec_block 8 0xc0ae 12 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0xc0b2_12 ?\<sigma> \<and> block_usage P_0xc097_12_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0xc097_12_def P_0xc097_12_regions_def post: Q_0xc0b2_12_def regionset: P_0xc097_12_regions_set_def)

definition P_0xc0b2_13 :: state_pred where
  \<open>P_0xc0b2_13 \<sigma> \<equiv> RIP \<sigma> = 0xc0b2 \<and> RBX \<sigma> = RDI\<^sub>0 \<and> RCX \<sigma> = ucast ((\<langle>31,0\<rangle>(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8038),4]::32 word)::32 word) * (\<langle>31,0\<rangle>((ucast (((\<langle>31,0\<rangle>RDX\<^sub>0::32 word)::32 word))::64 word) + ((\<langle>63,0\<rangle>((ucast (((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word))::64 word) * (0x1::64 word))::64 word)::64 word))::32 word))::32 word)) \<and> RDX \<sigma> = ucast ((\<langle>31,0\<rangle>(((((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8034),4]::32 word)::32 word) - (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) * (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8038),4]::32 word))::32 word)) \<and> RDI \<sigma> = ((RAX \<sigma>::64 word) + (\<langle>63,0\<rangle>((ucast (((\<langle>31,0\<rangle>(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8038),4]::32 word)::32 word) * (\<langle>31,0\<rangle>((ucast (((\<langle>31,0\<rangle>RDX\<^sub>0::32 word)::32 word))::64 word) + ((\<langle>63,0\<rangle>((ucast (((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word))::64 word) * (0x1::64 word))::64 word)::64 word))::32 word))::32 word)::32 word))::64 word) * (0x1::64 word))::64 word)) \<and> RSI \<sigma> = ((ucast (((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) * (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8038),4]::32 word))::32 word)::32 word))::64 word) + (RAX \<sigma>::64 word)) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x28) \<and> RBP \<sigma> = ucast ((\<langle>31,0\<rangle>(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8038),4]::32 word)::32 word) * (\<langle>31,0\<rangle>RDX\<^sub>0::32 word))::32 word)) \<and> R13 \<sigma> = ucast ((\<langle>31,0\<rangle>RDX\<^sub>0::32 word)) \<and> R12 \<sigma> = ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)) \<and> R9 \<sigma> = R9\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8034),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8034),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8038),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8038),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = 0xc079\<close>
declare P_0xc0b2_13_def[Ps]

definition P_0xc0b2_13_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0xc0b2_13_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((RDI\<^sub>0::64 word) + 0x8034), 4),
    (2, ((RDI\<^sub>0::64 word) + 0x8038), 4),
    (3, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x30), 8)
  }\<close>

definition P_0xc0b2_13_regions :: state_pred where
  \<open>P_0xc0b2_13_regions \<sigma> \<equiv> \<exists>regions. P_0xc0b2_13_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_memmove_addr_0xc0b2_13 :: state_pred where
  \<open>Q_memmove_addr_0xc0b2_13 \<sigma> \<equiv> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x30) \<and> RIP \<sigma> = memmove_addr \<and> RBX \<sigma> = RDI\<^sub>0 \<and> RCX \<sigma> = ucast ((\<langle>31,0\<rangle>(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8038),4]::32 word)::32 word) * (\<langle>31,0\<rangle>((ucast (((\<langle>31,0\<rangle>RDX\<^sub>0::32 word)::32 word))::64 word) + ((\<langle>63,0\<rangle>((ucast (((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word))::64 word) * (0x1::64 word))::64 word)::64 word))::32 word))::32 word)) \<and> RDX \<sigma> = ucast ((\<langle>31,0\<rangle>(((((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8034),4]::32 word)::32 word) - (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) * (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8038),4]::32 word))::32 word)) \<and> RBP \<sigma> = ucast ((\<langle>31,0\<rangle>(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8038),4]::32 word)::32 word) * (\<langle>31,0\<rangle>RDX\<^sub>0::32 word))::32 word)) \<and> R13 \<sigma> = ucast ((\<langle>31,0\<rangle>RDX\<^sub>0::32 word)) \<and> R12 \<sigma> = ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)) \<and> R9 \<sigma> = R9\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8034),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8034),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8038),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8038),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = 0xc0b7\<close>
declare Q_memmove_addr_0xc0b2_13_def[Qs]

schematic_goal insert_direntries_0_1_0xc0b2_0xc0b2_13[blocks]:
  assumes \<open>(P_0xc0b2_13 && P_0xc0b2_13_regions) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0xc0b2 13 \<sigma> \<triangleq> ?\<sigma> \<and> Q_memmove_addr_0xc0b2_13 ?\<sigma> \<and> block_usage P_0xc0b2_13_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0xc0b2_13_def P_0xc0b2_13_regions_def post: Q_memmove_addr_0xc0b2_13_def regionset: P_0xc0b2_13_regions_set_def)

definition P_0xc0b7_14 :: state_pred where
  \<open>P_0xc0b7_14 \<sigma> \<equiv> RIP \<sigma> = 0xc0b7 \<and> RBX \<sigma> = RDI\<^sub>0 \<and> RCX \<sigma> = ucast ((\<langle>31,0\<rangle>(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8038),4]::32 word)::32 word) * (\<langle>31,0\<rangle>((ucast (((\<langle>31,0\<rangle>RDX\<^sub>0::32 word)::32 word))::64 word) + ((\<langle>63,0\<rangle>((ucast (((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word))::64 word) * (0x1::64 word))::64 word)::64 word))::32 word))::32 word)) \<and> RDX \<sigma> = ucast ((\<langle>31,0\<rangle>(((((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8034),4]::32 word)::32 word) - (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) * (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8038),4]::32 word))::32 word)) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x28) \<and> RBP \<sigma> = ucast ((\<langle>31,0\<rangle>(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8038),4]::32 word)::32 word) * (\<langle>31,0\<rangle>RDX\<^sub>0::32 word))::32 word)) \<and> R13 \<sigma> = ucast ((\<langle>31,0\<rangle>RDX\<^sub>0::32 word)) \<and> R12 \<sigma> = ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)) \<and> R9 \<sigma> = R9\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8034),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8034),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8038),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8038),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = 0xc0b7\<close>
declare P_0xc0b7_14_def[Ps]

definition P_0xc0b7_14_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0xc0b7_14_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((RDI\<^sub>0::64 word) + 0x8028), 8),
    (2, ((RDI\<^sub>0::64 word) + 0x8034), 4),
    (3, ((RDI\<^sub>0::64 word) + 0x8038), 4),
    (4, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x30), 8)
  }\<close>

definition P_0xc0b7_14_regions :: state_pred where
  \<open>P_0xc0b7_14_regions \<sigma> \<equiv> \<exists>regions. P_0xc0b7_14_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0xc0d2_14 :: state_pred where
  \<open>Q_0xc0d2_14 \<sigma> \<equiv> RIP \<sigma> = 0xc0d2 \<and> RAX \<sigma> = ((ucast (((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) * (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8038),4]::32 word))::32 word)::32 word))::64 word) + ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8028),8]::64 word)::64 word)) \<and> RBX \<sigma> = RDI\<^sub>0 \<and> RCX \<sigma> = ucast ((\<langle>31,0\<rangle>(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8038),4]::32 word)::32 word) * (\<langle>31,0\<rangle>((ucast (((\<langle>31,0\<rangle>RDX\<^sub>0::32 word)::32 word))::64 word) + ((\<langle>63,0\<rangle>((ucast (((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word))::64 word) * (0x1::64 word))::64 word)::64 word))::32 word))::32 word)) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x28) \<and> RBP \<sigma> = ucast ((\<langle>31,0\<rangle>(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8038),4]::32 word)::32 word) * (\<langle>31,0\<rangle>RDX\<^sub>0::32 word))::32 word)) \<and> R13 \<sigma> = ucast ((\<langle>31,0\<rangle>RDX\<^sub>0::32 word)) \<and> R12 \<sigma> = ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)) \<and> R9 \<sigma> = ((ucast (((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) * (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8038),4]::32 word))::32 word)::32 word))::64 word) + ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8028),8]::64 word)::64 word)) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8028),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8028),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8038),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8038),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = 0xc0b7\<close>
declare Q_0xc0d2_14_def[Qs]

schematic_goal insert_direntries_0_5_0xc0b7_0xc0cf_14[blocks]:
  assumes \<open>(P_0xc0b7_14 && P_0xc0b7_14_regions) \<sigma>\<close>
  shows \<open>exec_block 5 0xc0cf 14 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0xc0d2_14 ?\<sigma> \<and> block_usage P_0xc0b7_14_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0xc0b7_14_def P_0xc0b7_14_regions_def post: Q_0xc0d2_14_def regionset: P_0xc0b7_14_regions_set_def)

definition P_0xc0d2_true_15 :: state_pred where
  \<open>P_0xc0d2_true_15 \<sigma> \<equiv> RIP \<sigma> = 0xc0d2 \<and> RAX \<sigma> = ((ucast (((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) * (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8038),4]::32 word))::32 word)::32 word))::64 word) + ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8028),8]::64 word)::64 word)) \<and> RBX \<sigma> = RDI\<^sub>0 \<and> RCX \<sigma> = ucast ((\<langle>31,0\<rangle>(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8038),4]::32 word)::32 word) * (\<langle>31,0\<rangle>((ucast (((\<langle>31,0\<rangle>RDX\<^sub>0::32 word)::32 word))::64 word) + ((\<langle>63,0\<rangle>((ucast (((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word))::64 word) * (0x1::64 word))::64 word)::64 word))::32 word))::32 word)) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x28) \<and> RBP \<sigma> = ucast ((\<langle>31,0\<rangle>(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8038),4]::32 word)::32 word) * (\<langle>31,0\<rangle>RDX\<^sub>0::32 word))::32 word)) \<and> R13 \<sigma> = ucast ((\<langle>31,0\<rangle>RDX\<^sub>0::32 word)) \<and> R12 \<sigma> = ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)) \<and> R9 \<sigma> = ((ucast (((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) * (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8038),4]::32 word))::32 word)::32 word))::64 word) + ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8028),8]::64 word)::64 word)) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8028),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8028),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8038),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8038),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = 0xc0b7\<close>
declare P_0xc0d2_true_15_def[Ps]

definition P_0xc0d2_true_15_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0xc0d2_true_15_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((RDI\<^sub>0::64 word) + 0x8028), 8),
    (2, ((RDI\<^sub>0::64 word) + 0x8038), 4),
    (3, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x30), 8)
  }\<close>

definition P_0xc0d2_true_15_regions :: state_pred where
  \<open>P_0xc0d2_true_15_regions \<sigma> \<equiv> \<exists>regions. P_0xc0d2_true_15_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0xc0e2_15 :: state_pred where
  \<open>Q_0xc0e2_15 \<sigma> \<equiv> RIP \<sigma> = 0xc0e2 \<and> RBX \<sigma> = RDI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x28) \<and> R13 \<sigma> = ucast ((\<langle>31,0\<rangle>RDX\<^sub>0::32 word)) \<and> R12 \<sigma> = ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8038),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8038),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBX\<^sub>0\<close>
declare Q_0xc0e2_15_def[Qs]

schematic_goal insert_direntries_0_1_0xc0d2_0xc0d2_15[blocks]:
  assumes \<open>(P_0xc0d2_true_15 && P_0xc0d2_true_15_regions && ZF) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0xc0d2 15 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0xc0e2_15 ?\<sigma> \<and> block_usage P_0xc0d2_true_15_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0xc0d2_true_15_def P_0xc0d2_true_15_regions_def post: Q_0xc0e2_15_def regionset: P_0xc0d2_true_15_regions_set_def)

definition P_0xc0d2_false_16 :: state_pred where
  \<open>P_0xc0d2_false_16 \<sigma> \<equiv> RIP \<sigma> = 0xc0d2 \<and> RAX \<sigma> = ((ucast (((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) * (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8038),4]::32 word))::32 word)::32 word))::64 word) + ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8028),8]::64 word)::64 word)) \<and> RBX \<sigma> = RDI\<^sub>0 \<and> RCX \<sigma> = ucast ((\<langle>31,0\<rangle>(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8038),4]::32 word)::32 word) * (\<langle>31,0\<rangle>((ucast (((\<langle>31,0\<rangle>RDX\<^sub>0::32 word)::32 word))::64 word) + ((\<langle>63,0\<rangle>((ucast (((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word))::64 word) * (0x1::64 word))::64 word)::64 word))::32 word))::32 word)) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x28) \<and> RBP \<sigma> = ucast ((\<langle>31,0\<rangle>(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8038),4]::32 word)::32 word) * (\<langle>31,0\<rangle>RDX\<^sub>0::32 word))::32 word)) \<and> R13 \<sigma> = ucast ((\<langle>31,0\<rangle>RDX\<^sub>0::32 word)) \<and> R12 \<sigma> = ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)) \<and> R9 \<sigma> = ((ucast (((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) * (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8038),4]::32 word))::32 word)::32 word))::64 word) + ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8028),8]::64 word)::64 word)) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8028),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8028),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8038),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8038),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = 0xc0b7\<close>
declare P_0xc0d2_false_16_def[Ps]

definition P_0xc0d2_false_16_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0xc0d2_false_16_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((RDI\<^sub>0::64 word) + 0x8028), 8),
    (2, ((RDI\<^sub>0::64 word) + 0x8038), 4),
    (3, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x30), 8)
  }\<close>

definition P_0xc0d2_false_16_regions :: state_pred where
  \<open>P_0xc0d2_false_16_regions \<sigma> \<equiv> \<exists>regions. P_0xc0d2_false_16_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0xc0dd_16 :: state_pred where
  \<open>Q_0xc0dd_16 \<sigma> \<equiv> RIP \<sigma> = 0xc0dd \<and> RAX \<sigma> = ((ucast (((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) * (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8038),4]::32 word))::32 word)::32 word))::64 word) + ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8028),8]::64 word)::64 word)) \<and> RBX \<sigma> = RDI\<^sub>0 \<and> RCX \<sigma> = ucast ((\<langle>31,0\<rangle>(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8038),4]::32 word)::32 word) * (\<langle>31,0\<rangle>((ucast (((\<langle>31,0\<rangle>RDX\<^sub>0::32 word)::32 word))::64 word) + ((\<langle>63,0\<rangle>((ucast (((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word))::64 word) * (0x1::64 word))::64 word)::64 word))::32 word))::32 word)) \<and> RDX \<sigma> = ucast ((\<langle>31,0\<rangle>RDX\<^sub>0::32 word)) \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x28) \<and> RBP \<sigma> = ucast ((\<langle>31,0\<rangle>(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8038),4]::32 word)::32 word) * (\<langle>31,0\<rangle>RDX\<^sub>0::32 word))::32 word)) \<and> R13 \<sigma> = ucast ((\<langle>31,0\<rangle>RDX\<^sub>0::32 word)) \<and> R12 \<sigma> = ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)) \<and> R9 \<sigma> = ((ucast (((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) * (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8038),4]::32 word))::32 word)::32 word))::64 word) + ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8028),8]::64 word)::64 word)) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8028),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8028),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8038),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8038),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = 0xc0b7\<close>
declare Q_0xc0dd_16_def[Qs]

schematic_goal insert_direntries_0_4_0xc0d2_0xc0da_16[blocks]:
  assumes \<open>(P_0xc0d2_false_16 && P_0xc0d2_false_16_regions && ! ZF) \<sigma>\<close>
  shows \<open>exec_block 4 0xc0da 16 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0xc0dd_16 ?\<sigma> \<and> block_usage P_0xc0d2_false_16_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0xc0d2_false_16_def P_0xc0d2_false_16_regions_def post: Q_0xc0dd_16_def regionset: P_0xc0d2_false_16_regions_set_def)

definition P_0xc0dd_17 :: state_pred where
  \<open>P_0xc0dd_17 \<sigma> \<equiv> RIP \<sigma> = 0xc0dd \<and> RAX \<sigma> = ((ucast (((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) * (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8038),4]::32 word))::32 word)::32 word))::64 word) + ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8028),8]::64 word)::64 word)) \<and> RBX \<sigma> = RDI\<^sub>0 \<and> RCX \<sigma> = ucast ((\<langle>31,0\<rangle>(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8038),4]::32 word)::32 word) * (\<langle>31,0\<rangle>((ucast (((\<langle>31,0\<rangle>RDX\<^sub>0::32 word)::32 word))::64 word) + ((\<langle>63,0\<rangle>((ucast (((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word))::64 word) * (0x1::64 word))::64 word)::64 word))::32 word))::32 word)) \<and> RDX \<sigma> = ucast ((\<langle>31,0\<rangle>RDX\<^sub>0::32 word)) \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x28) \<and> RBP \<sigma> = ucast ((\<langle>31,0\<rangle>(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8038),4]::32 word)::32 word) * (\<langle>31,0\<rangle>RDX\<^sub>0::32 word))::32 word)) \<and> R13 \<sigma> = ucast ((\<langle>31,0\<rangle>RDX\<^sub>0::32 word)) \<and> R12 \<sigma> = ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)) \<and> R9 \<sigma> = ((ucast (((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) * (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8038),4]::32 word))::32 word)::32 word))::64 word) + ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8028),8]::64 word)::64 word)) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8028),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8028),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8038),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8038),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = 0xc0b7\<close>
declare P_0xc0dd_17_def[Ps]

definition P_0xc0dd_17_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0xc0dd_17_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((RDI\<^sub>0::64 word) + 0x8028), 8),
    (2, ((RDI\<^sub>0::64 word) + 0x8038), 4),
    (3, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x30), 8)
  }\<close>

definition P_0xc0dd_17_regions :: state_pred where
  \<open>P_0xc0dd_17_regions \<sigma> \<equiv> \<exists>regions. P_0xc0dd_17_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_adjust_dirindices_addr_0xc0dd_17 :: state_pred where
  \<open>Q_adjust_dirindices_addr_0xc0dd_17 \<sigma> \<equiv> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x30) \<and> RIP \<sigma> = adjust_dirindices_addr \<and> RAX \<sigma> = ((ucast (((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) * (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8038),4]::32 word))::32 word)::32 word))::64 word) + ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8028),8]::64 word)::64 word)) \<and> RBX \<sigma> = RDI\<^sub>0 \<and> R13 \<sigma> = ucast ((\<langle>31,0\<rangle>RDX\<^sub>0::32 word)) \<and> R12 \<sigma> = ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8038),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8038),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBX\<^sub>0\<close>
declare Q_adjust_dirindices_addr_0xc0dd_17_def[Qs]

schematic_goal insert_direntries_0_1_0xc0dd_0xc0dd_17[blocks]:
  assumes \<open>(P_0xc0dd_17 && P_0xc0dd_17_regions) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0xc0dd 17 \<sigma> \<triangleq> ?\<sigma> \<and> Q_adjust_dirindices_addr_0xc0dd_17 ?\<sigma> \<and> block_usage P_0xc0dd_17_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0xc0dd_17_def P_0xc0dd_17_regions_def post: Q_adjust_dirindices_addr_0xc0dd_17_def regionset: P_0xc0dd_17_regions_set_def)

definition P_0xc0e2_18 :: state_pred where
  \<open>P_0xc0e2_18 \<sigma> \<equiv> RIP \<sigma> = 0xc0e2 \<and> RBX \<sigma> = RDI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x28) \<and> R13 \<sigma> = ucast ((\<langle>31,0\<rangle>RDX\<^sub>0::32 word)) \<and> R12 \<sigma> = ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8038),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8038),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBX\<^sub>0\<close>
declare P_0xc0e2_18_def[Ps]

definition P_0xc0e2_18_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0xc0e2_18_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((RDI\<^sub>0::64 word) + 0x8038), 4),
    (2, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x20), 8)
  }\<close>

definition P_0xc0e2_18_regions :: state_pred where
  \<open>P_0xc0e2_18_regions \<sigma> \<equiv> \<exists>regions. P_0xc0e2_18_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_ret_address_18 :: state_pred where
  \<open>Q_ret_address_18 \<sigma> \<equiv> RIP \<sigma> = ret_address \<and> RAX \<sigma> = R9 \<sigma> \<and> RBX \<sigma> = RBX\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) + 0x8) \<and> RBP \<sigma> = RBP\<^sub>0 \<and> R13 \<sigma> = R13\<^sub>0 \<and> R12 \<sigma> = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8038),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8038),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBX\<^sub>0\<close>
declare Q_ret_address_18_def[Qs]

schematic_goal insert_direntries_0_7_0xc0e2_0xc0ef_18[blocks]:
  assumes \<open>(P_0xc0e2_18 && P_0xc0e2_18_regions) \<sigma>\<close>
  shows \<open>exec_block 7 0xc0ef 18 \<sigma> \<triangleq> ?\<sigma> \<and> Q_ret_address_18 ?\<sigma> \<and> block_usage P_0xc0e2_18_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0xc0e2_18_def P_0xc0e2_18_regions_def post: Q_ret_address_18_def regionset: P_0xc0e2_18_regions_set_def)

definition insert_direntries_acode :: ACode where
  \<open>insert_direntries_acode =
    Block 15 0xc064 0;
    IF jbe THEN
      Block 9 0xc0ae (Suc 0);
      Block (Suc 0) 0xc0b2 2;
      CALL memmove_acode;
      Block 5 0xc0cf 3;
      IF ZF THEN
        Block (Suc 0) 0xc0d2 4
      ELSE
        Block 4 0xc0da 5;
        Block (Suc 0) 0xc0dd 6;
        CALL adjust_dirindices_acode
      FI
    ELSE
      Block 5 0xc072 7;
      Block (Suc 0) 0xc074 8;
      CALL qemu_realloc_acode;
      Block 2 0xc080 9;
      IF ZF THEN
        Block 3 0xc0f3 10
      ELSE
        Block 4 0xc091 11;
        Block 8 0xc0ae 12;
        Block (Suc 0) 0xc0b2 13;
        CALL memmove_acode;
        Block 5 0xc0cf 14;
        IF ZF THEN
          Block (Suc 0) 0xc0d2 15
        ELSE
          Block 4 0xc0da 16;
          Block (Suc 0) 0xc0dd 17;
          CALL adjust_dirindices_acode
        FI
      FI
    FI;
    Block 7 0xc0ef 18
  \<close>

schematic_goal "insert_direntries":
  assumes
    \<open>\<forall>\<sigma>. RIP \<sigma> = 0xc066 \<longrightarrow> P_0xc066_true_1_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0xc0b2 \<longrightarrow> P_0xc0b2_2_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0xc0b7 \<longrightarrow> P_0xc0b7_3_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0xc0d2 \<longrightarrow> P_0xc0d2_true_4_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0xc0d2 \<longrightarrow> P_0xc0d2_false_5_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0xc0dd \<longrightarrow> P_0xc0dd_6_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0xc066 \<longrightarrow> P_0xc066_false_7_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0xc074 \<longrightarrow> P_0xc074_8_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0xc079 \<longrightarrow> P_0xc079_9_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0xc083 \<longrightarrow> P_0xc083_true_10_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0xc083 \<longrightarrow> P_0xc083_false_11_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0xc097 \<longrightarrow> P_0xc097_12_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0xc0b2 \<longrightarrow> P_0xc0b2_13_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0xc0b7 \<longrightarrow> P_0xc0b7_14_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0xc0d2 \<longrightarrow> P_0xc0d2_true_15_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0xc0d2 \<longrightarrow> P_0xc0d2_false_16_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0xc0dd \<longrightarrow> P_0xc0dd_17_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0xc0e2 \<longrightarrow> P_0xc0e2_18_regions \<sigma>\<close>
    and [blocks]: \<open>{{Q_memmove_addr_0xc0b2_2}} \<box>memmove_acode {{P_0xc0b7_3;M_0xc0b2}}\<close>
    and [blocks]: \<open>{{Q_adjust_dirindices_addr_0xc0dd_6}} \<box>adjust_dirindices_acode {{P_0xc0e2_18;M_0xc0dd}}\<close> \<comment> \<open>P_0xc0e2_7 must be P_0xc0e2_18\<close>
    and [blocks]: \<open>{{Q_qemu_realloc_addr_0xc074_8}} \<box>qemu_realloc_acode {{P_0xc079_9;M_0xc074}}\<close>
    and [blocks]: \<open>{{Q_memmove_addr_0xc0b2_13}} \<box>memmove_acode {{P_0xc0b7_14;M_0xc0b2}}\<close>
    and [blocks]: \<open>{{Q_adjust_dirindices_addr_0xc0dd_17}} \<box>adjust_dirindices_acode {{P_0xc0e2_18;M_0xc0dd}}\<close>
  shows \<open>{{?P}} insert_direntries_acode {{?Q;?M}}\<close>
  by (vcg acode: insert_direntries_acode_def assms: assms)

end
