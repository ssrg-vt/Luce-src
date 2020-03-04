theory cow_is_allocated
  imports
    "../../../isabelle/VCG/HTriple"
begin

locale "qemu_img_xen" = execution_context + exec_code +
  assumes fetch:
    "fetch 0x5a70 \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour rax)) (Storage (Memory SixtyFour (A_SizeDirective 64 (A_Plus (A_FromReg (General SixtyFour rdi)) (A_WordConstant 64))))), 4)"
    "fetch 0x5a74 \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour r9)) (Storage (Reg (General SixtyFour rcx))), 3)"
    "fetch 0x5a77 \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour r8)) (Storage (Memory SixtyFour (A_SizeDirective 64 (A_Plus (A_FromReg (General SixtyFour rax)) (A_WordConstant 8))))), 4)"
    "fetch 0x5a7b \<equiv> (Binary (IS_8088 Test) (Reg (General SixtyFour r8)) (Storage (Reg (General SixtyFour r8))), 3)"
    "fetch 0x5a7e \<equiv> (Unary (IS_8088 Je) (Immediate SixtyFour (ImmVal 23384)), 6)"
    "fetch 0x5a84 \<equiv> (Binary (IS_8088 Test) (Reg (General ThirtyTwo rdx)) (Storage (Reg (General ThirtyTwo rdx))), 2)"
    "fetch 0x5a86 \<equiv> (Unary (IS_8088 Je) (Immediate SixtyFour (ImmVal 23384)), 6)"
    "fetch 0x5a8c \<equiv> (Binary (IS_8088 Test) (Reg (General SixtyFour rsi)) (Storage (Reg (General SixtyFour rsi))), 3)"
    "fetch 0x5a8f \<equiv> (Binary (IS_8088 Lea) (Reg (General SixtyFour rax)) (Storage (Memory SixtyFour (A_Plus (A_FromReg (General SixtyFour rsi)) (A_WordConstant 7)))), 4)"
    "fetch 0x5a93 \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour rdi)) (Storage (Reg (General SixtyFour rsi))), 3)"
    "fetch 0x5a96 \<equiv> (Binary (IS_PentiumPro Cmovns) (Reg (General SixtyFour rax)) (Storage (Reg (General SixtyFour rsi))), 4)"
    "fetch 0x5a9a \<equiv> (Binary (IS_8088 Sar) (Reg (General SixtyFour rdi)) (Immediate SixtyFour (ImmVal 63)), 4)"
    "fetch 0x5a9e \<equiv> (Binary (IS_8088 Shr) (Reg (General SixtyFour rdi)) (Immediate SixtyFour (ImmVal 61)), 4)"
    "fetch 0x5aa2 \<equiv> (Binary (IS_8088 Sar) (Reg (General SixtyFour rax)) (Immediate SixtyFour (ImmVal 3)), 4)"
    "fetch 0x5aa6 \<equiv> (Binary (IS_8088 Lea) (Reg (General SixtyFour rcx)) (Storage (Memory SixtyFour (A_Plus (A_FromReg (General SixtyFour rsi)) (A_Mult 1 (A_FromReg (General SixtyFour rdi)))))), 4)"
    "fetch 0x5aaa \<equiv> (Binary (IS_80386 Movzx) (Reg (General ThirtyTwo rax)) (Storage (Memory Eight (A_SizeDirective 8 (A_Plus (A_FromReg (General SixtyFour r8)) (A_Mult 1 (A_FromReg (General SixtyFour rax))))))), 5)"
    "fetch 0x5aaf \<equiv> (Binary (IS_8088 And) (Reg (General ThirtyTwo rcx)) (Immediate SixtyFour (ImmVal 7)), 3)"
    "fetch 0x5ab2 \<equiv> (Binary (IS_8088 Mov) (Memory ThirtyTwo (A_SizeDirective 32 (A_FromReg (General SixtyFour r9)))) (Immediate SixtyFour (ImmVal 1)), 7)"
    "fetch 0x5ab9 \<equiv> (Binary (IS_8088 Sub) (Reg (General SixtyFour rcx)) (Storage (Reg (General SixtyFour rdi))), 3)"
    "fetch 0x5abc \<equiv> (Binary (IS_8088 Sar) (Reg (General ThirtyTwo rax)) (Storage (Reg (General Eight rcx))), 2)"
    "fetch 0x5abe \<equiv> (Binary (IS_8088 And) (Reg (General ThirtyTwo rax)) (Immediate SixtyFour (ImmVal 1)), 3)"
    "fetch 0x5ac1 \<equiv> (Binary (IS_8088 Cmp) (Reg (General ThirtyTwo rdx)) (Immediate SixtyFour (ImmVal 1)), 3)"
    "fetch 0x5ac4 \<equiv> (Unary (IS_8088 Jle) (Immediate SixtyFour (ImmVal 23380)), 6)"
    "fetch 0x5aca \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour rcx)) (Storage (Reg (General SixtyFour rsi))), 3)"
    "fetch 0x5acd \<equiv> (Binary (IS_8088 Lea) (Reg (General SixtyFour rdi)) (Storage (Memory SixtyFour (A_Plus (A_FromReg (General SixtyFour rsi)) (A_WordConstant 8)))), 4)"
    "fetch 0x5ad1 \<equiv> (Binary (IS_8088 Add) (Reg (General SixtyFour rcx)) (Immediate SixtyFour (ImmVal 1)), 4)"
    "fetch 0x5ad5 \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour r10)) (Storage (Reg (General SixtyFour rcx))), 3)"
    "fetch 0x5ad8 \<equiv> (Binary (IS_PentiumPro Cmovns) (Reg (General SixtyFour rdi)) (Storage (Reg (General SixtyFour rcx))), 4)"
    "fetch 0x5adc \<equiv> (Binary (IS_8088 Sar) (Reg (General SixtyFour r10)) (Immediate SixtyFour (ImmVal 63)), 4)"
    "fetch 0x5ae0 \<equiv> (Binary (IS_8088 Shr) (Reg (General SixtyFour r10)) (Immediate SixtyFour (ImmVal 61)), 4)"
    "fetch 0x5ae4 \<equiv> (Binary (IS_8088 Sar) (Reg (General SixtyFour rdi)) (Immediate SixtyFour (ImmVal 3)), 4)"
    "fetch 0x5ae8 \<equiv> (Binary (IS_8088 Add) (Reg (General SixtyFour rcx)) (Storage (Reg (General SixtyFour r10))), 3)"
    "fetch 0x5aeb \<equiv> (Binary (IS_80386 Movzx) (Reg (General ThirtyTwo rdi)) (Storage (Memory Eight (A_SizeDirective 8 (A_Plus (A_FromReg (General SixtyFour r8)) (A_Mult 1 (A_FromReg (General SixtyFour rdi))))))), 5)"
    "fetch 0x5af0 \<equiv> (Binary (IS_8088 And) (Reg (General ThirtyTwo rcx)) (Immediate SixtyFour (ImmVal 7)), 3)"
    "fetch 0x5af3 \<equiv> (Binary (IS_8088 Sub) (Reg (General SixtyFour rcx)) (Storage (Reg (General SixtyFour r10))), 3)"
    "fetch 0x5af6 \<equiv> (Binary (IS_8088 Sar) (Reg (General ThirtyTwo rdi)) (Storage (Reg (General Eight rcx))), 2)"
    "fetch 0x5af8 \<equiv> (Binary (IS_8088 And) (Reg (General ThirtyTwo rdi)) (Immediate SixtyFour (ImmVal 1)), 3)"
    "fetch 0x5afb \<equiv> (Binary (IS_8088 Cmp) (Reg (General ThirtyTwo rax)) (Storage (Reg (General ThirtyTwo rdi))), 2)"
    "fetch 0x5afd \<equiv> (Unary (IS_8088 Jne) (Immediate SixtyFour (ImmVal 23380)), 2)"
    "fetch 0x5aff \<equiv> (Binary (IS_8088 Lea) (Reg (General SixtyFour rdi)) (Storage (Memory SixtyFour (A_Plus (A_FromReg (General SixtyFour rsi)) (A_WordConstant 2)))), 4)"
    "fetch 0x5b03 \<equiv> (Binary (IS_8088 Lea) (Reg (General ThirtyTwo r10)) (Storage (Memory SixtyFour (A_Minus (A_FromReg (General SixtyFour rdx)) (A_WordConstant 2)))), 4)"
    "fetch 0x5b07 \<equiv> (Binary (IS_8088 Add) (Reg (General SixtyFour r10)) (Storage (Reg (General SixtyFour rdi))), 3)"
    "fetch 0x5b0a \<equiv> (Unary (IS_8088 Jmp) (Immediate SixtyFour (ImmVal 23368)), 2)"
    "fetch 0x5b0c \<equiv> (Unary (IS_8088 Nop) (Storage (Memory ThirtyTwo (A_SizeDirective 32 (A_Plus (A_FromReg (General SixtyFour rax)) (A_WordConstant 0))))), 4)"
    "fetch 0x5b10 \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour rcx)) (Storage (Reg (General SixtyFour rdi))), 3)"
    "fetch 0x5b13 \<equiv> (Binary (IS_8088 Add) (Reg (General SixtyFour rdi)) (Immediate SixtyFour (ImmVal 1)), 4)"
    "fetch 0x5b17 \<equiv> (Binary (IS_8088 Lea) (Reg (General SixtyFour rdx)) (Storage (Memory SixtyFour (A_Plus (A_FromReg (General SixtyFour rcx)) (A_WordConstant 7)))), 4)"
    "fetch 0x5b1b \<equiv> (Binary (IS_8088 Test) (Reg (General SixtyFour rcx)) (Storage (Reg (General SixtyFour rcx))), 3)"
    "fetch 0x5b1e \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour r11)) (Storage (Reg (General SixtyFour rcx))), 3)"
    "fetch 0x5b21 \<equiv> (Binary (IS_PentiumPro Cmovns) (Reg (General SixtyFour rdx)) (Storage (Reg (General SixtyFour rcx))), 4)"
    "fetch 0x5b25 \<equiv> (Binary (IS_8088 Sar) (Reg (General SixtyFour r11)) (Immediate SixtyFour (ImmVal 63)), 4)"
    "fetch 0x5b29 \<equiv> (Binary (IS_8088 Shr) (Reg (General SixtyFour r11)) (Immediate SixtyFour (ImmVal 61)), 4)"
    "fetch 0x5b2d \<equiv> (Binary (IS_8088 Sar) (Reg (General SixtyFour rdx)) (Immediate SixtyFour (ImmVal 3)), 4)"
    "fetch 0x5b31 \<equiv> (Binary (IS_8088 Add) (Reg (General SixtyFour rcx)) (Storage (Reg (General SixtyFour r11))), 3)"
    "fetch 0x5b34 \<equiv> (Binary (IS_80386 Movzx) (Reg (General ThirtyTwo rdx)) (Storage (Memory Eight (A_SizeDirective 8 (A_Plus (A_FromReg (General SixtyFour r8)) (A_Mult 1 (A_FromReg (General SixtyFour rdx))))))), 5)"
    "fetch 0x5b39 \<equiv> (Binary (IS_8088 And) (Reg (General ThirtyTwo rcx)) (Immediate SixtyFour (ImmVal 7)), 3)"
    "fetch 0x5b3c \<equiv> (Binary (IS_8088 Sub) (Reg (General SixtyFour rcx)) (Storage (Reg (General SixtyFour r11))), 3)"
    "fetch 0x5b3f \<equiv> (Binary (IS_8088 Sar) (Reg (General ThirtyTwo rdx)) (Storage (Reg (General Eight rcx))), 2)"
    "fetch 0x5b41 \<equiv> (Binary (IS_8088 And) (Reg (General ThirtyTwo rdx)) (Immediate SixtyFour (ImmVal 1)), 3)"
    "fetch 0x5b44 \<equiv> (Binary (IS_8088 Cmp) (Reg (General ThirtyTwo rdx)) (Storage (Reg (General ThirtyTwo rax))), 2)"
    "fetch 0x5b46 \<equiv> (Unary (IS_8088 Jne) (Immediate SixtyFour (ImmVal 23380)), 2)"
    "fetch 0x5b48 \<equiv> (Binary (IS_8088 Mov) (Reg (General ThirtyTwo rdx)) (Storage (Reg (General ThirtyTwo rdi))), 2)"
    "fetch 0x5b4a \<equiv> (Binary (IS_8088 Sub) (Reg (General ThirtyTwo rdx)) (Storage (Reg (General ThirtyTwo rsi))), 2)"
    "fetch 0x5b4c \<equiv> (Binary (IS_8088 Mov) (Memory ThirtyTwo (A_SizeDirective 32 (A_FromReg (General SixtyFour r9)))) (Storage (Reg (General ThirtyTwo rdx))), 3)"
    "fetch 0x5b4f \<equiv> (Binary (IS_8088 Cmp) (Reg (General SixtyFour rdi)) (Storage (Reg (General SixtyFour r10))), 3)"
    "fetch 0x5b52 \<equiv> (Unary (IS_8088 Jne) (Immediate SixtyFour (ImmVal 23312)), 2)"
    "fetch 0x5b54 \<equiv> (Nullary (IS_8088 Ret), 1)"
    "fetch 0x5b55 \<equiv> (Unary (IS_8088 Nop) (Storage (Memory ThirtyTwo (A_SizeDirective 32 (A_FromReg (General SixtyFour rax))))), 3)"
    "fetch 0x5b58 \<equiv> (Binary (IS_8088 Mov) (Memory ThirtyTwo (A_SizeDirective 32 (A_FromReg (General SixtyFour r9)))) (Storage (Reg (General ThirtyTwo rdx))), 3)"
    "fetch 0x5b5b \<equiv> (Binary (IS_8088 Xor) (Reg (General ThirtyTwo rax)) (Storage (Reg (General ThirtyTwo rax))), 2)"
    "fetch 0x5b5d \<equiv> (Nullary (IS_8088 Ret), 1)"
    "fetch 0x5b5e \<equiv> (Binary (IS_8088 Xchg) (Reg (General Sixteen rax)) (Storage (Reg (General Sixteen rax))), 5)"
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

locale "cow_is_allocated" = "qemu_img_xen" +
  fixes RAX\<^sub>0\<^sub>v RCX\<^sub>0\<^sub>v RDX\<^sub>0\<^sub>v RDI\<^sub>0\<^sub>v RSI\<^sub>0\<^sub>v RSP\<^sub>0\<^sub>v R11\<^sub>0\<^sub>v R10\<^sub>0\<^sub>v R9\<^sub>0\<^sub>v R8\<^sub>0\<^sub>v ret_address\<^sub>v :: \<open>64 word\<close>
begin

text \<open>Using definitions that don't get unfolded immediately prevents locale argument issues.\<close>
definition \<open>RAX\<^sub>0 \<equiv> RAX\<^sub>0\<^sub>v\<close>
definition \<open>RCX\<^sub>0 \<equiv> RCX\<^sub>0\<^sub>v\<close>
definition \<open>RDX\<^sub>0 \<equiv> RDX\<^sub>0\<^sub>v\<close>
definition \<open>RDI\<^sub>0 \<equiv> RDI\<^sub>0\<^sub>v\<close>
definition \<open>RSI\<^sub>0 \<equiv> RSI\<^sub>0\<^sub>v\<close>
definition \<open>RSP\<^sub>0 \<equiv> RSP\<^sub>0\<^sub>v\<close>
definition \<open>R11\<^sub>0 \<equiv> R11\<^sub>0\<^sub>v\<close>
definition \<open>R10\<^sub>0 \<equiv> R10\<^sub>0\<^sub>v\<close>
definition \<open>R9\<^sub>0 \<equiv> R9\<^sub>0\<^sub>v\<close>
definition \<open>R8\<^sub>0 \<equiv> R8\<^sub>0\<^sub>v\<close>
definition \<open>ret_address \<equiv> ret_address\<^sub>v\<close>

definition P_0x5a70_0 :: state_pred where
  \<open>P_0x5a70_0 \<sigma> \<equiv> RIP \<sigma> = 0x5a70 \<and> RAX \<sigma> = RAX\<^sub>0 \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = RDX\<^sub>0 \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = RSP\<^sub>0 \<and> R11 \<sigma> = R11\<^sub>0 \<and> R10 \<sigma> = R10\<^sub>0 \<and> R9 \<sigma> = R9\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address\<close>
declare P_0x5a70_0_def[Ps]

definition P_0x5a70_0_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x5a70_0_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((RDI\<^sub>0::64 word) + 0x40), 8),
    (2, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8), 8)
  }\<close>

definition P_0x5a70_0_regions :: state_pred where
  \<open>P_0x5a70_0_regions \<sigma> \<equiv> \<exists>regions. P_0x5a70_0_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x5a7e_0 :: state_pred where
  \<open>Q_0x5a7e_0 \<sigma> \<equiv> RIP \<sigma> = 0x5a7e \<and> RAX \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = RDX\<^sub>0 \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = RSP\<^sub>0 \<and> R11 \<sigma> = R11\<^sub>0 \<and> R10 \<sigma> = R10\<^sub>0 \<and> R9 \<sigma> = RCX\<^sub>0 \<and> R8 \<sigma> = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word)\<close>
declare Q_0x5a7e_0_def[Qs]

schematic_goal cow_is_allocated_0_4_0x5a70_0x5a7b_0[blocks]:
  assumes \<open>(P_0x5a70_0 && P_0x5a70_0_regions) \<sigma>\<close>
  shows \<open>exec_block 4 0x5a7b 0 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x5a7e_0 ?\<sigma> \<and> block_usage P_0x5a70_0_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x5a70_0_def P_0x5a70_0_regions_def post: Q_0x5a7e_0_def regionset: P_0x5a70_0_regions_set_def)

definition P_0x5a7e_true_1 :: state_pred where
  \<open>P_0x5a7e_true_1 \<sigma> \<equiv> RIP \<sigma> = 0x5a7e \<and> RAX \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = RDX\<^sub>0 \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = RSP\<^sub>0 \<and> R11 \<sigma> = R11\<^sub>0 \<and> R10 \<sigma> = R10\<^sub>0 \<and> R9 \<sigma> = RCX\<^sub>0 \<and> R8 \<sigma> = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word)\<close>
declare P_0x5a7e_true_1_def[Ps]

definition P_0x5a7e_true_1_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x5a7e_true_1_regions_set \<sigma> \<equiv> {
    (0, RCX\<^sub>0, 4),
    (1, RSP\<^sub>0, 8),
    (2, ((RDI\<^sub>0::64 word) + 0x40), 8),
    (3, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8), 8)
  }\<close>

definition P_0x5a7e_true_1_regions :: state_pred where
  \<open>P_0x5a7e_true_1_regions \<sigma> \<equiv> \<exists>regions. P_0x5a7e_true_1_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_ret_address_1 :: state_pred where
  \<open>Q_ret_address_1 \<sigma> \<equiv> RIP \<sigma> = ret_address \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) + 0x8) \<and> R9 \<sigma> = RCX\<^sub>0 \<and> R8 \<sigma> = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word)\<close>
declare Q_ret_address_1_def[Qs]

schematic_goal cow_is_allocated_0_4_0x5a7e_0x5b5d_1[blocks]:
  assumes \<open>(P_0x5a7e_true_1 && P_0x5a7e_true_1_regions && ZF) \<sigma>\<close>
  shows \<open>exec_block 4 0x5b5d (Suc 0) \<sigma> \<triangleq> ?\<sigma> \<and> Q_ret_address_1 ?\<sigma> \<and> block_usage P_0x5a7e_true_1_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x5a7e_true_1_def P_0x5a7e_true_1_regions_def post: Q_ret_address_1_def regionset: P_0x5a7e_true_1_regions_set_def)

definition P_0x5a7e_false_2 :: state_pred where
  \<open>P_0x5a7e_false_2 \<sigma> \<equiv> RIP \<sigma> = 0x5a7e \<and> RAX \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = RDX\<^sub>0 \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = RSP\<^sub>0 \<and> R11 \<sigma> = R11\<^sub>0 \<and> R10 \<sigma> = R10\<^sub>0 \<and> R9 \<sigma> = RCX\<^sub>0 \<and> R8 \<sigma> = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word)\<close>
declare P_0x5a7e_false_2_def[Ps]

definition P_0x5a7e_false_2_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x5a7e_false_2_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((RDI\<^sub>0::64 word) + 0x40), 8),
    (2, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8), 8)
  }\<close>

definition P_0x5a7e_false_2_regions :: state_pred where
  \<open>P_0x5a7e_false_2_regions \<sigma> \<equiv> \<exists>regions. P_0x5a7e_false_2_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x5a86_2 :: state_pred where
  \<open>Q_0x5a86_2 \<sigma> \<equiv> RIP \<sigma> = 0x5a86 \<and> RAX \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = RDX\<^sub>0 \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = RSP\<^sub>0 \<and> R11 \<sigma> = R11\<^sub>0 \<and> R10 \<sigma> = R10\<^sub>0 \<and> R9 \<sigma> = RCX\<^sub>0 \<and> R8 \<sigma> = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word)\<close>
declare Q_0x5a86_2_def[Qs]

schematic_goal cow_is_allocated_0_2_0x5a7e_0x5a84_2[blocks]:
  assumes \<open>(P_0x5a7e_false_2 && P_0x5a7e_false_2_regions && ! ZF) \<sigma>\<close>
  shows \<open>exec_block 2 0x5a84 2 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x5a86_2 ?\<sigma> \<and> block_usage P_0x5a7e_false_2_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x5a7e_false_2_def P_0x5a7e_false_2_regions_def post: Q_0x5a86_2_def regionset: P_0x5a7e_false_2_regions_set_def)

definition P_0x5a86_true_3 :: state_pred where
  \<open>P_0x5a86_true_3 \<sigma> \<equiv> RIP \<sigma> = 0x5a86 \<and> RAX \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = RDX\<^sub>0 \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = RSP\<^sub>0 \<and> R11 \<sigma> = R11\<^sub>0 \<and> R10 \<sigma> = R10\<^sub>0 \<and> R9 \<sigma> = RCX\<^sub>0 \<and> R8 \<sigma> = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word)\<close>
declare P_0x5a86_true_3_def[Ps]

definition P_0x5a86_true_3_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x5a86_true_3_regions_set \<sigma> \<equiv> {
    (0, RCX\<^sub>0, 4),
    (1, RSP\<^sub>0, 8),
    (2, ((RDI\<^sub>0::64 word) + 0x40), 8),
    (3, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8), 8)
  }\<close>

definition P_0x5a86_true_3_regions :: state_pred where
  \<open>P_0x5a86_true_3_regions \<sigma> \<equiv> \<exists>regions. P_0x5a86_true_3_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_ret_address_3 :: state_pred where
  \<open>Q_ret_address_3 \<sigma> \<equiv> RIP \<sigma> = ret_address \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) + 0x8) \<and> R9 \<sigma> = RCX\<^sub>0 \<and> R8 \<sigma> = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word)\<close>
declare Q_ret_address_3_def[Qs]

schematic_goal cow_is_allocated_0_4_0x5a86_0x5b5d_3[blocks]:
  assumes \<open>(P_0x5a86_true_3 && P_0x5a86_true_3_regions && ZF) \<sigma>\<close>
  shows \<open>exec_block 4 0x5b5d 3 \<sigma> \<triangleq> ?\<sigma> \<and> Q_ret_address_3 ?\<sigma> \<and> block_usage P_0x5a86_true_3_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x5a86_true_3_def P_0x5a86_true_3_regions_def post: Q_ret_address_3_def regionset: P_0x5a86_true_3_regions_set_def)

definition P_0x5a86_false_4 :: state_pred where
  \<open>P_0x5a86_false_4 \<sigma> \<equiv> RIP \<sigma> = 0x5a86 \<and> RAX \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = RDX\<^sub>0 \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = RSP\<^sub>0 \<and> R11 \<sigma> = R11\<^sub>0 \<and> R10 \<sigma> = R10\<^sub>0 \<and> R9 \<sigma> = RCX\<^sub>0 \<and> R8 \<sigma> = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word)\<close>
declare P_0x5a86_false_4_def[Ps]

definition P_0x5a86_false_4_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x5a86_false_4_regions_set \<sigma> \<equiv> {
    (0, RCX\<^sub>0, 4),
    (1, RSP\<^sub>0, 8),
    (2, ((RDI\<^sub>0::64 word) + 0x40), 8),
    (3, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8), 8),
    (4, (((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word)::64 word) + (\<langle>63,0\<rangle>((((if' (RSI\<^sub>0::64 word) \<ge>s (ucast ((0x0::64 word))::64 word) then RSI\<^sub>0 else (((RSI\<^sub>0::64 word) + 0x7)::64 word)) >>> 3)::64 word) * 0x1)::64 word)), 1)
  }\<close>

definition P_0x5a86_false_4_regions :: state_pred where
  \<open>P_0x5a86_false_4_regions \<sigma> \<equiv> \<exists>regions. P_0x5a86_false_4_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x5ac4_4 :: state_pred where
  \<open>Q_0x5ac4_4 \<sigma> \<equiv> RIP \<sigma> = 0x5ac4 \<and> RAX \<sigma> = ucast (((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word)::64 word) + (\<langle>63,0\<rangle>((((if' (RSI\<^sub>0::64 word) \<ge>s (ucast ((0x0::64 word))::64 word) then RSI\<^sub>0 else (((RSI\<^sub>0::64 word) + 0x7)::64 word)) >>> 3)::64 word) * 0x1)::64 word)),1]::8 word)::32 word) >>> unat (((\<langle>7,0\<rangle>((ucast (((((\<langle>31,0\<rangle>((RSI\<^sub>0::64 word) + (\<langle>63,0\<rangle>((((RSI\<^sub>0 >>> 63) >> 61)::64 word) * 0x1)::64 word))::32 word)::32 word) AND 0x7)::32 word))::64 word) - (((RSI\<^sub>0 >>> 63) >> 61)::64 word))::8 word)::8 word)))::32 word) AND 0x1)) \<and> RCX \<sigma> = ((ucast (((((\<langle>31,0\<rangle>((RSI\<^sub>0::64 word) + (\<langle>63,0\<rangle>((((RSI\<^sub>0 >>> 63) >> 61)::64 word) * 0x1)::64 word))::32 word)::32 word) AND 0x7)::32 word))::64 word) - (((RSI\<^sub>0 >>> 63) >> 61)::64 word)) \<and> RDX \<sigma> = RDX\<^sub>0 \<and> RDI \<sigma> = ((RSI\<^sub>0 >>> 63) >> 61) \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = RSP\<^sub>0 \<and> R11 \<sigma> = R11\<^sub>0 \<and> R10 \<sigma> = R10\<^sub>0 \<and> R9 \<sigma> = RCX\<^sub>0 \<and> R8 \<sigma> = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word) \<and> (\<sigma> \<turnstile> *[RCX\<^sub>0,4]::32 word) = 0x1 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word)::64 word) + (\<langle>63,0\<rangle>((((if' (RSI\<^sub>0::64 word) \<ge>s (ucast ((0x0::64 word))::64 word) then RSI\<^sub>0 else (((RSI\<^sub>0::64 word) + 0x7)::64 word)) >>> 3)::64 word) * 0x1)::64 word)),1]::8 word) = ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word)::64 word) + (\<langle>63,0\<rangle>((((if' (RSI\<^sub>0::64 word) \<ge>s (ucast ((0x0::64 word))::64 word) then RSI\<^sub>0 else (((RSI\<^sub>0::64 word) + 0x7)::64 word)) >>> 3)::64 word) * 0x1)::64 word)),1]::8 word))\<close>
declare Q_0x5ac4_4_def[Qs]

schematic_goal cow_is_allocated_0_16_0x5a86_0x5ac1_4[blocks]:
  assumes \<open>(P_0x5a86_false_4 && P_0x5a86_false_4_regions && ! ZF) \<sigma>\<close>
  shows \<open>exec_block 16 0x5ac1 4 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x5ac4_4 ?\<sigma> \<and> block_usage P_0x5a86_false_4_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x5a86_false_4_def P_0x5a86_false_4_regions_def post: Q_0x5ac4_4_def regionset: P_0x5a86_false_4_regions_set_def)

definition P_0x5ac4_true_5 :: state_pred where
  \<open>P_0x5ac4_true_5 \<sigma> \<equiv> RIP \<sigma> = 0x5ac4 \<and> RAX \<sigma> = ucast (((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word)::64 word) + (\<langle>63,0\<rangle>((((if' (RSI\<^sub>0::64 word) \<ge>s (ucast ((0x0::64 word))::64 word) then RSI\<^sub>0 else (((RSI\<^sub>0::64 word) + 0x7)::64 word)) >>> 3)::64 word) * 0x1)::64 word)),1]::8 word)::32 word) >>> unat (((\<langle>7,0\<rangle>((ucast (((((\<langle>31,0\<rangle>((RSI\<^sub>0::64 word) + (\<langle>63,0\<rangle>((((RSI\<^sub>0 >>> 63) >> 61)::64 word) * 0x1)::64 word))::32 word)::32 word) AND 0x7)::32 word))::64 word) - (((RSI\<^sub>0 >>> 63) >> 61)::64 word))::8 word)::8 word)))::32 word) AND 0x1)) \<and> RCX \<sigma> = ((ucast (((((\<langle>31,0\<rangle>((RSI\<^sub>0::64 word) + (\<langle>63,0\<rangle>((((RSI\<^sub>0 >>> 63) >> 61)::64 word) * 0x1)::64 word))::32 word)::32 word) AND 0x7)::32 word))::64 word) - (((RSI\<^sub>0 >>> 63) >> 61)::64 word)) \<and> RDX \<sigma> = RDX\<^sub>0 \<and> RDI \<sigma> = ((RSI\<^sub>0 >>> 63) >> 61) \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = RSP\<^sub>0 \<and> R11 \<sigma> = R11\<^sub>0 \<and> R10 \<sigma> = R10\<^sub>0 \<and> R9 \<sigma> = RCX\<^sub>0 \<and> R8 \<sigma> = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word) \<and> (\<sigma> \<turnstile> *[RCX\<^sub>0,4]::32 word) = 0x1 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word)::64 word) + (\<langle>63,0\<rangle>((((if' (RSI\<^sub>0::64 word) \<ge>s (ucast ((0x0::64 word))::64 word) then RSI\<^sub>0 else (((RSI\<^sub>0::64 word) + 0x7)::64 word)) >>> 3)::64 word) * 0x1)::64 word)),1]::8 word) = ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word)::64 word) + (\<langle>63,0\<rangle>((((if' (RSI\<^sub>0::64 word) \<ge>s (ucast ((0x0::64 word))::64 word) then RSI\<^sub>0 else (((RSI\<^sub>0::64 word) + 0x7)::64 word)) >>> 3)::64 word) * 0x1)::64 word)),1]::8 word))\<close>
declare P_0x5ac4_true_5_def[Ps]

definition P_0x5ac4_true_5_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x5ac4_true_5_regions_set \<sigma> \<equiv> {
    (0, RCX\<^sub>0, 4),
    (1, RSP\<^sub>0, 8),
    (2, ((RDI\<^sub>0::64 word) + 0x40), 8),
    (3, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8), 8),
    (4, (((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word)::64 word) + (\<langle>63,0\<rangle>((((if' (RSI\<^sub>0::64 word) \<ge>s (ucast ((0x0::64 word))::64 word) then RSI\<^sub>0 else (((RSI\<^sub>0::64 word) + 0x7)::64 word)) >>> 3)::64 word) * 0x1)::64 word)), 1)
  }\<close>

definition P_0x5ac4_true_5_regions :: state_pred where
  \<open>P_0x5ac4_true_5_regions \<sigma> \<equiv> \<exists>regions. P_0x5ac4_true_5_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x5b54_5 :: state_pred where
  \<open>Q_0x5b54_5 \<sigma> \<equiv> RIP \<sigma> = 0x5b54 \<and> RAX \<sigma> = ucast (((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word)::64 word) + (\<langle>63,0\<rangle>((((if' (RSI\<^sub>0::64 word) \<ge>s (ucast ((0x0::64 word))::64 word) then RSI\<^sub>0 else (((RSI\<^sub>0::64 word) + 0x7)::64 word)) >>> 3)::64 word) * 0x1)::64 word)),1]::8 word)::32 word) >>> unat (((\<langle>7,0\<rangle>((ucast (((((\<langle>31,0\<rangle>((RSI\<^sub>0::64 word) + (\<langle>63,0\<rangle>((((RSI\<^sub>0 >>> 63) >> 61)::64 word) * 0x1)::64 word))::32 word)::32 word) AND 0x7)::32 word))::64 word) - (((RSI\<^sub>0 >>> 63) >> 61)::64 word))::8 word)::8 word)))::32 word) AND 0x1)) \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = RSP\<^sub>0 \<and> R9 \<sigma> = RCX\<^sub>0 \<and> R8 \<sigma> = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word)::64 word) + (\<langle>63,0\<rangle>((((if' (RSI\<^sub>0::64 word) \<ge>s (ucast ((0x0::64 word))::64 word) then RSI\<^sub>0 else (((RSI\<^sub>0::64 word) + 0x7)::64 word)) >>> 3)::64 word) * 0x1)::64 word)),1]::8 word) = ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word)::64 word) + (\<langle>63,0\<rangle>((((if' (RSI\<^sub>0::64 word) \<ge>s (ucast ((0x0::64 word))::64 word) then RSI\<^sub>0 else (((RSI\<^sub>0::64 word) + 0x7)::64 word)) >>> 3)::64 word) * 0x1)::64 word)),1]::8 word))\<close>
declare Q_0x5b54_5_def[Qs]

schematic_goal cow_is_allocated_0_1_0x5ac4_0x5ac4_5[blocks]:
  assumes \<open>(P_0x5ac4_true_5 && P_0x5ac4_true_5_regions && jle) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x5ac4 5 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x5b54_5 ?\<sigma> \<and> block_usage P_0x5ac4_true_5_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x5ac4_true_5_def P_0x5ac4_true_5_regions_def post: Q_0x5b54_5_def regionset: P_0x5ac4_true_5_regions_set_def)

definition P_0x5ac4_false_6 :: state_pred where
  \<open>P_0x5ac4_false_6 \<sigma> \<equiv> RIP \<sigma> = 0x5ac4 \<and> RAX \<sigma> = ucast (((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word)::64 word) + (\<langle>63,0\<rangle>((((if' (RSI\<^sub>0::64 word) \<ge>s (ucast ((0x0::64 word))::64 word) then RSI\<^sub>0 else (((RSI\<^sub>0::64 word) + 0x7)::64 word)) >>> 3)::64 word) * 0x1)::64 word)),1]::8 word)::32 word) >>> unat (((\<langle>7,0\<rangle>((ucast (((((\<langle>31,0\<rangle>((RSI\<^sub>0::64 word) + (\<langle>63,0\<rangle>((((RSI\<^sub>0 >>> 63) >> 61)::64 word) * 0x1)::64 word))::32 word)::32 word) AND 0x7)::32 word))::64 word) - (((RSI\<^sub>0 >>> 63) >> 61)::64 word))::8 word)::8 word)))::32 word) AND 0x1)) \<and> RCX \<sigma> = ((ucast (((((\<langle>31,0\<rangle>((RSI\<^sub>0::64 word) + (\<langle>63,0\<rangle>((((RSI\<^sub>0 >>> 63) >> 61)::64 word) * 0x1)::64 word))::32 word)::32 word) AND 0x7)::32 word))::64 word) - (((RSI\<^sub>0 >>> 63) >> 61)::64 word)) \<and> RDX \<sigma> = RDX\<^sub>0 \<and> RDI \<sigma> = ((RSI\<^sub>0 >>> 63) >> 61) \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = RSP\<^sub>0 \<and> R11 \<sigma> = R11\<^sub>0 \<and> R10 \<sigma> = R10\<^sub>0 \<and> R9 \<sigma> = RCX\<^sub>0 \<and> R8 \<sigma> = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word) \<and> (\<sigma> \<turnstile> *[RCX\<^sub>0,4]::32 word) = 0x1 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word)::64 word) + (\<langle>63,0\<rangle>((((if' (RSI\<^sub>0::64 word) \<ge>s (ucast ((0x0::64 word))::64 word) then RSI\<^sub>0 else (((RSI\<^sub>0::64 word) + 0x7)::64 word)) >>> 3)::64 word) * 0x1)::64 word)),1]::8 word) = ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word)::64 word) + (\<langle>63,0\<rangle>((((if' (RSI\<^sub>0::64 word) \<ge>s (ucast ((0x0::64 word))::64 word) then RSI\<^sub>0 else (((RSI\<^sub>0::64 word) + 0x7)::64 word)) >>> 3)::64 word) * 0x1)::64 word)),1]::8 word))\<close>
declare P_0x5ac4_false_6_def[Ps]

definition P_0x5ac4_false_6_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x5ac4_false_6_regions_set \<sigma> \<equiv> {
    (0, RCX\<^sub>0, 4),
    (1, RSP\<^sub>0, 8),
    (2, ((RDI\<^sub>0::64 word) + 0x40), 8),
    (3, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8), 8),
    (4, (((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word)::64 word) + (\<langle>63,0\<rangle>((((if' (RSI\<^sub>0::64 word) \<ge>s (ucast ((0x0::64 word))::64 word) then RSI\<^sub>0 else (((RSI\<^sub>0::64 word) + 0x7)::64 word)) >>> 3)::64 word) * 0x1)::64 word)), 1),
    (5, (((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word)::64 word) + (\<langle>63,0\<rangle>((((if' (((RSI\<^sub>0::64 word) + 0x1)::64 word) \<ge>s (ucast ((0x0::64 word))::64 word) then ((RSI\<^sub>0::64 word) + 0x1) else (((RSI\<^sub>0::64 word) + 0x8)::64 word)) >>> 3)::64 word) * 0x1)::64 word)), 1)
  }\<close>

definition P_0x5ac4_false_6_regions :: state_pred where
  \<open>P_0x5ac4_false_6_regions \<sigma> \<equiv> \<exists>regions. P_0x5ac4_false_6_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x5afd_6 :: state_pred where
  \<open>Q_0x5afd_6 \<sigma> \<equiv> RIP \<sigma> = 0x5afd \<and> RAX \<sigma> = ucast (((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word)::64 word) + (\<langle>63,0\<rangle>((((if' (RSI\<^sub>0::64 word) \<ge>s (ucast ((0x0::64 word))::64 word) then RSI\<^sub>0 else (((RSI\<^sub>0::64 word) + 0x7)::64 word)) >>> 3)::64 word) * 0x1)::64 word)),1]::8 word)::32 word) >>> unat (((\<langle>7,0\<rangle>((ucast (((((\<langle>31,0\<rangle>((RSI\<^sub>0::64 word) + (\<langle>63,0\<rangle>((((RSI\<^sub>0 >>> 63) >> 61)::64 word) * 0x1)::64 word))::32 word)::32 word) AND 0x7)::32 word))::64 word) - (((RSI\<^sub>0 >>> 63) >> 61)::64 word))::8 word)::8 word)))::32 word) AND 0x1)) \<and> RCX \<sigma> = ((ucast (((((\<langle>31,0\<rangle>((((RSI\<^sub>0::64 word) + ((((RSI\<^sub>0::64 word) + 0x1) >>> 63) >> 61))::64 word) + 0x1)::32 word)::32 word) AND 0x7)::32 word))::64 word) - (((((RSI\<^sub>0::64 word) + 0x1) >>> 63) >> 61)::64 word)) \<and> RDX \<sigma> = RDX\<^sub>0 \<and> RDI \<sigma> = ucast (((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word)::64 word) + (\<langle>63,0\<rangle>((((if' (((RSI\<^sub>0::64 word) + 0x1)::64 word) \<ge>s (ucast ((0x0::64 word))::64 word) then ((RSI\<^sub>0::64 word) + 0x1) else (((RSI\<^sub>0::64 word) + 0x8)::64 word)) >>> 3)::64 word) * 0x1)::64 word)),1]::8 word)::32 word) >>> unat (((\<langle>7,0\<rangle>((ucast (((((\<langle>31,0\<rangle>((((RSI\<^sub>0::64 word) + ((((RSI\<^sub>0::64 word) + 0x1) >>> 63) >> 61))::64 word) + 0x1)::32 word)::32 word) AND 0x7)::32 word))::64 word) - (((((RSI\<^sub>0::64 word) + 0x1) >>> 63) >> 61)::64 word))::8 word)::8 word)))::32 word) AND 0x1)) \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = RSP\<^sub>0 \<and> R11 \<sigma> = R11\<^sub>0 \<and> R10 \<sigma> = ((((RSI\<^sub>0::64 word) + 0x1) >>> 63) >> 61) \<and> R9 \<sigma> = RCX\<^sub>0 \<and> R8 \<sigma> = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word) \<and> (\<sigma> \<turnstile> *[RCX\<^sub>0,4]::32 word) = 0x1 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word)::64 word) + (\<langle>63,0\<rangle>((((if' (RSI\<^sub>0::64 word) \<ge>s (ucast ((0x0::64 word))::64 word) then RSI\<^sub>0 else (((RSI\<^sub>0::64 word) + 0x7)::64 word)) >>> 3)::64 word) * 0x1)::64 word)),1]::8 word) = ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word)::64 word) + (\<langle>63,0\<rangle>((((if' (RSI\<^sub>0::64 word) \<ge>s (ucast ((0x0::64 word))::64 word) then RSI\<^sub>0 else (((RSI\<^sub>0::64 word) + 0x7)::64 word)) >>> 3)::64 word) * 0x1)::64 word)),1]::8 word)) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word)::64 word) + (\<langle>63,0\<rangle>((((if' (((RSI\<^sub>0::64 word) + 0x1)::64 word) \<ge>s (ucast ((0x0::64 word))::64 word) then ((RSI\<^sub>0::64 word) + 0x1) else (((RSI\<^sub>0::64 word) + 0x8)::64 word)) >>> 3)::64 word) * 0x1)::64 word)),1]::8 word) = ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word)::64 word) + (\<langle>63,0\<rangle>((((if' (((RSI\<^sub>0::64 word) + 0x1)::64 word) \<ge>s (ucast ((0x0::64 word))::64 word) then ((RSI\<^sub>0::64 word) + 0x1) else (((RSI\<^sub>0::64 word) + 0x8)::64 word)) >>> 3)::64 word) * 0x1)::64 word)),1]::8 word))\<close>
declare Q_0x5afd_6_def[Qs]

schematic_goal cow_is_allocated_0_16_0x5ac4_0x5afb_6[blocks]:
  assumes \<open>(P_0x5ac4_false_6 && P_0x5ac4_false_6_regions && ! jle) \<sigma>\<close>
  shows \<open>exec_block 16 0x5afb 6 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x5afd_6 ?\<sigma> \<and> block_usage P_0x5ac4_false_6_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x5ac4_false_6_def P_0x5ac4_false_6_regions_def post: Q_0x5afd_6_def regionset: P_0x5ac4_false_6_regions_set_def)

definition P_0x5afd_true_7 :: state_pred where
  \<open>P_0x5afd_true_7 \<sigma> \<equiv> RIP \<sigma> = 0x5afd \<and> RAX \<sigma> = ucast (((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word)::64 word) + (\<langle>63,0\<rangle>((((if' (RSI\<^sub>0::64 word) \<ge>s (ucast ((0x0::64 word))::64 word) then RSI\<^sub>0 else (((RSI\<^sub>0::64 word) + 0x7)::64 word)) >>> 3)::64 word) * 0x1)::64 word)),1]::8 word)::32 word) >>> unat (((\<langle>7,0\<rangle>((ucast (((((\<langle>31,0\<rangle>((RSI\<^sub>0::64 word) + (\<langle>63,0\<rangle>((((RSI\<^sub>0 >>> 63) >> 61)::64 word) * 0x1)::64 word))::32 word)::32 word) AND 0x7)::32 word))::64 word) - (((RSI\<^sub>0 >>> 63) >> 61)::64 word))::8 word)::8 word)))::32 word) AND 0x1)) \<and> RCX \<sigma> = ((ucast (((((\<langle>31,0\<rangle>((((RSI\<^sub>0::64 word) + ((((RSI\<^sub>0::64 word) + 0x1) >>> 63) >> 61))::64 word) + 0x1)::32 word)::32 word) AND 0x7)::32 word))::64 word) - (((((RSI\<^sub>0::64 word) + 0x1) >>> 63) >> 61)::64 word)) \<and> RDX \<sigma> = RDX\<^sub>0 \<and> RDI \<sigma> = ucast (((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word)::64 word) + (\<langle>63,0\<rangle>((((if' (((RSI\<^sub>0::64 word) + 0x1)::64 word) \<ge>s (ucast ((0x0::64 word))::64 word) then ((RSI\<^sub>0::64 word) + 0x1) else (((RSI\<^sub>0::64 word) + 0x8)::64 word)) >>> 3)::64 word) * 0x1)::64 word)),1]::8 word)::32 word) >>> unat (((\<langle>7,0\<rangle>((ucast (((((\<langle>31,0\<rangle>((((RSI\<^sub>0::64 word) + ((((RSI\<^sub>0::64 word) + 0x1) >>> 63) >> 61))::64 word) + 0x1)::32 word)::32 word) AND 0x7)::32 word))::64 word) - (((((RSI\<^sub>0::64 word) + 0x1) >>> 63) >> 61)::64 word))::8 word)::8 word)))::32 word) AND 0x1)) \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = RSP\<^sub>0 \<and> R11 \<sigma> = R11\<^sub>0 \<and> R10 \<sigma> = ((((RSI\<^sub>0::64 word) + 0x1) >>> 63) >> 61) \<and> R9 \<sigma> = RCX\<^sub>0 \<and> R8 \<sigma> = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word) \<and> (\<sigma> \<turnstile> *[RCX\<^sub>0,4]::32 word) = 0x1 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word)::64 word) + (\<langle>63,0\<rangle>((((if' (RSI\<^sub>0::64 word) \<ge>s (ucast ((0x0::64 word))::64 word) then RSI\<^sub>0 else (((RSI\<^sub>0::64 word) + 0x7)::64 word)) >>> 3)::64 word) * 0x1)::64 word)),1]::8 word) = ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word)::64 word) + (\<langle>63,0\<rangle>((((if' (RSI\<^sub>0::64 word) \<ge>s (ucast ((0x0::64 word))::64 word) then RSI\<^sub>0 else (((RSI\<^sub>0::64 word) + 0x7)::64 word)) >>> 3)::64 word) * 0x1)::64 word)),1]::8 word)) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word)::64 word) + (\<langle>63,0\<rangle>((((if' (((RSI\<^sub>0::64 word) + 0x1)::64 word) \<ge>s (ucast ((0x0::64 word))::64 word) then ((RSI\<^sub>0::64 word) + 0x1) else (((RSI\<^sub>0::64 word) + 0x8)::64 word)) >>> 3)::64 word) * 0x1)::64 word)),1]::8 word) = ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word)::64 word) + (\<langle>63,0\<rangle>((((if' (((RSI\<^sub>0::64 word) + 0x1)::64 word) \<ge>s (ucast ((0x0::64 word))::64 word) then ((RSI\<^sub>0::64 word) + 0x1) else (((RSI\<^sub>0::64 word) + 0x8)::64 word)) >>> 3)::64 word) * 0x1)::64 word)),1]::8 word))\<close>
declare P_0x5afd_true_7_def[Ps]

definition P_0x5afd_true_7_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x5afd_true_7_regions_set \<sigma> \<equiv> {
    (0, RCX\<^sub>0, 4),
    (1, RSP\<^sub>0, 8),
    (2, ((RDI\<^sub>0::64 word) + 0x40), 8),
    (3, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8), 8),
    (4, (((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word)::64 word) + (\<langle>63,0\<rangle>((((if' (RSI\<^sub>0::64 word) \<ge>s (ucast ((0x0::64 word))::64 word) then RSI\<^sub>0 else (((RSI\<^sub>0::64 word) + 0x7)::64 word)) >>> 3)::64 word) * 0x1)::64 word)), 1),
    (5, (((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word)::64 word) + (\<langle>63,0\<rangle>((((if' (((RSI\<^sub>0::64 word) + 0x1)::64 word) \<ge>s (ucast ((0x0::64 word))::64 word) then ((RSI\<^sub>0::64 word) + 0x1) else (((RSI\<^sub>0::64 word) + 0x8)::64 word)) >>> 3)::64 word) * 0x1)::64 word)), 1)
  }\<close>

definition P_0x5afd_true_7_regions :: state_pred where
  \<open>P_0x5afd_true_7_regions \<sigma> \<equiv> \<exists>regions. P_0x5afd_true_7_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x5b54_7 :: state_pred where
  \<open>Q_0x5b54_7 \<sigma> \<equiv> RIP \<sigma> = 0x5b54 \<and> RAX \<sigma> = ucast (((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word)::64 word) + (\<langle>63,0\<rangle>((((if' (RSI\<^sub>0::64 word) \<ge>s (ucast ((0x0::64 word))::64 word) then RSI\<^sub>0 else (((RSI\<^sub>0::64 word) + 0x7)::64 word)) >>> 3)::64 word) * 0x1)::64 word)),1]::8 word)::32 word) >>> unat (((\<langle>7,0\<rangle>((ucast (((((\<langle>31,0\<rangle>((RSI\<^sub>0::64 word) + (\<langle>63,0\<rangle>((((RSI\<^sub>0 >>> 63) >> 61)::64 word) * 0x1)::64 word))::32 word)::32 word) AND 0x7)::32 word))::64 word) - (((RSI\<^sub>0 >>> 63) >> 61)::64 word))::8 word)::8 word)))::32 word) AND 0x1)) \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = RSP\<^sub>0 \<and> R9 \<sigma> = RCX\<^sub>0 \<and> R8 \<sigma> = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word)::64 word) + (\<langle>63,0\<rangle>((((if' (RSI\<^sub>0::64 word) \<ge>s (ucast ((0x0::64 word))::64 word) then RSI\<^sub>0 else (((RSI\<^sub>0::64 word) + 0x7)::64 word)) >>> 3)::64 word) * 0x1)::64 word)),1]::8 word) = ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word)::64 word) + (\<langle>63,0\<rangle>((((if' (RSI\<^sub>0::64 word) \<ge>s (ucast ((0x0::64 word))::64 word) then RSI\<^sub>0 else (((RSI\<^sub>0::64 word) + 0x7)::64 word)) >>> 3)::64 word) * 0x1)::64 word)),1]::8 word))\<close>
declare Q_0x5b54_7_def[Qs]

schematic_goal cow_is_allocated_0_1_0x5afd_0x5afd_7[blocks]:
  assumes \<open>(P_0x5afd_true_7 && P_0x5afd_true_7_regions && !ZF) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x5afd 7 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x5b54_7 ?\<sigma> \<and> block_usage P_0x5afd_true_7_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x5afd_true_7_def P_0x5afd_true_7_regions_def post: Q_0x5b54_7_def regionset: P_0x5afd_true_7_regions_set_def)

definition P_0x5afd_false_8 :: state_pred where
  \<open>P_0x5afd_false_8 \<sigma> \<equiv> RIP \<sigma> = 0x5afd \<and> RAX \<sigma> = ucast (((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word)::64 word) + (\<langle>63,0\<rangle>((((if' (RSI\<^sub>0::64 word) \<ge>s (ucast ((0x0::64 word))::64 word) then RSI\<^sub>0 else (((RSI\<^sub>0::64 word) + 0x7)::64 word)) >>> 3)::64 word) * 0x1)::64 word)),1]::8 word)::32 word) >>> unat (((\<langle>7,0\<rangle>((ucast (((((\<langle>31,0\<rangle>((RSI\<^sub>0::64 word) + (\<langle>63,0\<rangle>((((RSI\<^sub>0 >>> 63) >> 61)::64 word) * 0x1)::64 word))::32 word)::32 word) AND 0x7)::32 word))::64 word) - (((RSI\<^sub>0 >>> 63) >> 61)::64 word))::8 word)::8 word)))::32 word) AND 0x1)) \<and> RCX \<sigma> = ((ucast (((((\<langle>31,0\<rangle>((((RSI\<^sub>0::64 word) + ((((RSI\<^sub>0::64 word) + 0x1) >>> 63) >> 61))::64 word) + 0x1)::32 word)::32 word) AND 0x7)::32 word))::64 word) - (((((RSI\<^sub>0::64 word) + 0x1) >>> 63) >> 61)::64 word)) \<and> RDX \<sigma> = RDX\<^sub>0 \<and> RDI \<sigma> = ucast (((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word)::64 word) + (\<langle>63,0\<rangle>((((if' (((RSI\<^sub>0::64 word) + 0x1)::64 word) \<ge>s (ucast ((0x0::64 word))::64 word) then ((RSI\<^sub>0::64 word) + 0x1) else (((RSI\<^sub>0::64 word) + 0x8)::64 word)) >>> 3)::64 word) * 0x1)::64 word)),1]::8 word)::32 word) >>> unat (((\<langle>7,0\<rangle>((ucast (((((\<langle>31,0\<rangle>((((RSI\<^sub>0::64 word) + ((((RSI\<^sub>0::64 word) + 0x1) >>> 63) >> 61))::64 word) + 0x1)::32 word)::32 word) AND 0x7)::32 word))::64 word) - (((((RSI\<^sub>0::64 word) + 0x1) >>> 63) >> 61)::64 word))::8 word)::8 word)))::32 word) AND 0x1)) \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = RSP\<^sub>0 \<and> R11 \<sigma> = R11\<^sub>0 \<and> R10 \<sigma> = ((((RSI\<^sub>0::64 word) + 0x1) >>> 63) >> 61) \<and> R9 \<sigma> = RCX\<^sub>0 \<and> R8 \<sigma> = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word) \<and> (\<sigma> \<turnstile> *[RCX\<^sub>0,4]::32 word) = 0x1 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word)::64 word) + (\<langle>63,0\<rangle>((((if' (RSI\<^sub>0::64 word) \<ge>s (ucast ((0x0::64 word))::64 word) then RSI\<^sub>0 else (((RSI\<^sub>0::64 word) + 0x7)::64 word)) >>> 3)::64 word) * 0x1)::64 word)),1]::8 word) = ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word)::64 word) + (\<langle>63,0\<rangle>((((if' (RSI\<^sub>0::64 word) \<ge>s (ucast ((0x0::64 word))::64 word) then RSI\<^sub>0 else (((RSI\<^sub>0::64 word) + 0x7)::64 word)) >>> 3)::64 word) * 0x1)::64 word)),1]::8 word)) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word)::64 word) + (\<langle>63,0\<rangle>((((if' (((RSI\<^sub>0::64 word) + 0x1)::64 word) \<ge>s (ucast ((0x0::64 word))::64 word) then ((RSI\<^sub>0::64 word) + 0x1) else (((RSI\<^sub>0::64 word) + 0x8)::64 word)) >>> 3)::64 word) * 0x1)::64 word)),1]::8 word) = ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word)::64 word) + (\<langle>63,0\<rangle>((((if' (((RSI\<^sub>0::64 word) + 0x1)::64 word) \<ge>s (ucast ((0x0::64 word))::64 word) then ((RSI\<^sub>0::64 word) + 0x1) else (((RSI\<^sub>0::64 word) + 0x8)::64 word)) >>> 3)::64 word) * 0x1)::64 word)),1]::8 word))\<close>
declare P_0x5afd_false_8_def[Ps]

definition P_0x5afd_false_8_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x5afd_false_8_regions_set \<sigma> \<equiv> {
    (0, RCX\<^sub>0, 4),
    (1, RSP\<^sub>0, 8),
    (2, ((RDI\<^sub>0::64 word) + 0x40), 8),
    (3, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8), 8),
    (4, (((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word)::64 word) + (\<langle>63,0\<rangle>((((if' (RSI\<^sub>0::64 word) \<ge>s (ucast ((0x0::64 word))::64 word) then RSI\<^sub>0 else (((RSI\<^sub>0::64 word) + 0x7)::64 word)) >>> 3)::64 word) * 0x1)::64 word)), 1),
    (5, (((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word)::64 word) + (\<langle>63,0\<rangle>((((if' (((RSI\<^sub>0::64 word) + 0x1)::64 word) \<ge>s (ucast ((0x0::64 word))::64 word) then ((RSI\<^sub>0::64 word) + 0x1) else (((RSI\<^sub>0::64 word) + 0x8)::64 word)) >>> 3)::64 word) * 0x1)::64 word)), 1)
  }\<close>

definition P_0x5afd_false_8_regions :: state_pred where
  \<open>P_0x5afd_false_8_regions \<sigma> \<equiv> \<exists>regions. P_0x5afd_false_8_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x5b48_8 :: state_pred where
  \<open>Q_0x5b48_8 \<sigma> \<equiv> RIP \<sigma> = 0x5b48 \<and> RAX \<sigma> = ucast (((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word)::64 word) + (\<langle>63,0\<rangle>((((if' (RSI\<^sub>0::64 word) \<ge>s (ucast ((0x0::64 word))::64 word) then RSI\<^sub>0 else (((RSI\<^sub>0::64 word) + 0x7)::64 word)) >>> 3)::64 word) * 0x1)::64 word)),1]::8 word)::32 word) >>> unat (((\<langle>7,0\<rangle>((ucast (((((\<langle>31,0\<rangle>((RSI\<^sub>0::64 word) + (\<langle>63,0\<rangle>((((RSI\<^sub>0 >>> 63) >> 61)::64 word) * 0x1)::64 word))::32 word)::32 word) AND 0x7)::32 word))::64 word) - (((RSI\<^sub>0 >>> 63) >> 61)::64 word))::8 word)::8 word)))::32 word) AND 0x1)) \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = RSP\<^sub>0 \<and> R10 \<sigma> = ((ucast (((\<langle>31,0\<rangle>((RDX\<^sub>0::64 word) - 0x2)::32 word)::32 word))::64 word) + (((RSI\<^sub>0::64 word) + 0x2)::64 word)) \<and> R9 \<sigma> = RCX\<^sub>0 \<and> R8 \<sigma> = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word)::64 word) + (\<langle>63,0\<rangle>((((if' (RSI\<^sub>0::64 word) \<ge>s (ucast ((0x0::64 word))::64 word) then RSI\<^sub>0 else (((RSI\<^sub>0::64 word) + 0x7)::64 word)) >>> 3)::64 word) * 0x1)::64 word)),1]::8 word) = ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word)::64 word) + (\<langle>63,0\<rangle>((((if' (RSI\<^sub>0::64 word) \<ge>s (ucast ((0x0::64 word))::64 word) then RSI\<^sub>0 else (((RSI\<^sub>0::64 word) + 0x7)::64 word)) >>> 3)::64 word) * 0x1)::64 word)),1]::8 word)) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word)::64 word) + (\<langle>63,0\<rangle>((((if' (((RSI\<^sub>0::64 word) + 0x1)::64 word) \<ge>s (ucast ((0x0::64 word))::64 word) then ((RSI\<^sub>0::64 word) + 0x1) else (((RSI\<^sub>0::64 word) + 0x8)::64 word)) >>> 3)::64 word) * 0x1)::64 word)),1]::8 word) = ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word)::64 word) + (\<langle>63,0\<rangle>((((if' (((RSI\<^sub>0::64 word) + 0x1)::64 word) \<ge>s (ucast ((0x0::64 word))::64 word) then ((RSI\<^sub>0::64 word) + 0x1) else (((RSI\<^sub>0::64 word) + 0x8)::64 word)) >>> 3)::64 word) * 0x1)::64 word)),1]::8 word))\<close>
declare Q_0x5b48_8_def[Qs]

schematic_goal cow_is_allocated_0_5_0x5afd_0x5b0a_8[blocks]:
  assumes \<open>(P_0x5afd_false_8 && P_0x5afd_false_8_regions && ! !ZF) \<sigma>\<close>
  shows \<open>exec_block 5 0x5b0a 8 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x5b48_8 ?\<sigma> \<and> block_usage P_0x5afd_false_8_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x5afd_false_8_def P_0x5afd_false_8_regions_def post: Q_0x5b48_8_def regionset: P_0x5afd_false_8_regions_set_def)

definition P_0x5b48_9 :: state_pred where
  \<open>P_0x5b48_9 \<sigma> \<equiv> RIP \<sigma> = 0x5b48 \<and> RAX \<sigma> = ucast (((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word)::64 word) + (\<langle>63,0\<rangle>((((if' (RSI\<^sub>0::64 word) \<ge>s (ucast ((0x0::64 word))::64 word) then RSI\<^sub>0 else (((RSI\<^sub>0::64 word) + 0x7)::64 word)) >>> 3)::64 word) * 0x1)::64 word)),1]::8 word)::32 word) >>> unat (((\<langle>7,0\<rangle>((ucast (((((\<langle>31,0\<rangle>((RSI\<^sub>0::64 word) + (\<langle>63,0\<rangle>((((RSI\<^sub>0 >>> 63) >> 61)::64 word) * 0x1)::64 word))::32 word)::32 word) AND 0x7)::32 word))::64 word) - (((RSI\<^sub>0 >>> 63) >> 61)::64 word))::8 word)::8 word)))::32 word) AND 0x1)) \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = RSP\<^sub>0 \<and> R10 \<sigma> = ((ucast (((\<langle>31,0\<rangle>((RDX\<^sub>0::64 word) - 0x2)::32 word)::32 word))::64 word) + (((RSI\<^sub>0::64 word) + 0x2)::64 word)) \<and> R9 \<sigma> = RCX\<^sub>0 \<and> R8 \<sigma> = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word)::64 word) + (\<langle>63,0\<rangle>((((if' (RSI\<^sub>0::64 word) \<ge>s (ucast ((0x0::64 word))::64 word) then RSI\<^sub>0 else (((RSI\<^sub>0::64 word) + 0x7)::64 word)) >>> 3)::64 word) * 0x1)::64 word)),1]::8 word) = ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word)::64 word) + (\<langle>63,0\<rangle>((((if' (RSI\<^sub>0::64 word) \<ge>s (ucast ((0x0::64 word))::64 word) then RSI\<^sub>0 else (((RSI\<^sub>0::64 word) + 0x7)::64 word)) >>> 3)::64 word) * 0x1)::64 word)),1]::8 word)) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word)::64 word) + (\<langle>63,0\<rangle>((((if' (((RSI\<^sub>0::64 word) + 0x1)::64 word) \<ge>s (ucast ((0x0::64 word))::64 word) then ((RSI\<^sub>0::64 word) + 0x1) else (((RSI\<^sub>0::64 word) + 0x8)::64 word)) >>> 3)::64 word) * 0x1)::64 word)),1]::8 word) = ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word)::64 word) + (\<langle>63,0\<rangle>((((if' (((RSI\<^sub>0::64 word) + 0x1)::64 word) \<ge>s (ucast ((0x0::64 word))::64 word) then ((RSI\<^sub>0::64 word) + 0x1) else (((RSI\<^sub>0::64 word) + 0x8)::64 word)) >>> 3)::64 word) * 0x1)::64 word)),1]::8 word))\<close>
declare P_0x5b48_9_def[Ps]

definition P_0x5b48_9_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x5b48_9_regions_set \<sigma> \<equiv> {
    (0, RCX\<^sub>0, 4),
    (1, RSP\<^sub>0, 8),
    (2, ((RDI\<^sub>0::64 word) + 0x40), 8),
    (3, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8), 8),
    (4, (((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word)::64 word) + (\<langle>63,0\<rangle>((((if' (RSI\<^sub>0::64 word) \<ge>s (ucast ((0x0::64 word))::64 word) then RSI\<^sub>0 else (((RSI\<^sub>0::64 word) + 0x7)::64 word)) >>> 3)::64 word) * 0x1)::64 word)), 1),
    (5, (((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word)::64 word) + (\<langle>63,0\<rangle>((((if' (((RSI\<^sub>0::64 word) + 0x1)::64 word) \<ge>s (ucast ((0x0::64 word))::64 word) then ((RSI\<^sub>0::64 word) + 0x1) else (((RSI\<^sub>0::64 word) + 0x8)::64 word)) >>> 3)::64 word) * 0x1)::64 word)), 1)
  }\<close>

definition P_0x5b48_9_regions :: state_pred where
  \<open>P_0x5b48_9_regions \<sigma> \<equiv> \<exists>regions. P_0x5b48_9_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x5b52_9 :: state_pred where
  \<open>Q_0x5b52_9 \<sigma> \<equiv> RIP \<sigma> = 0x5b52 \<and> RAX \<sigma> = ucast (((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word)::64 word) + (\<langle>63,0\<rangle>((((if' (RSI\<^sub>0::64 word) \<ge>s (ucast ((0x0::64 word))::64 word) then RSI\<^sub>0 else (((RSI\<^sub>0::64 word) + 0x7)::64 word)) >>> 3)::64 word) * 0x1)::64 word)),1]::8 word)::32 word) >>> unat (((\<langle>7,0\<rangle>((ucast (((((\<langle>31,0\<rangle>((RSI\<^sub>0::64 word) + (\<langle>63,0\<rangle>((((RSI\<^sub>0 >>> 63) >> 61)::64 word) * 0x1)::64 word))::32 word)::32 word) AND 0x7)::32 word))::64 word) - (((RSI\<^sub>0 >>> 63) >> 61)::64 word))::8 word)::8 word)))::32 word) AND 0x1)) \<and> RDX \<sigma> = ucast ((((\<langle>31,0\<rangle>RDI \<sigma>::32 word)::32 word) - (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))) \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = RSP\<^sub>0 \<and> R10 \<sigma> = ((ucast (((\<langle>31,0\<rangle>((RDX\<^sub>0::64 word) - 0x2)::32 word)::32 word))::64 word) + (((RSI\<^sub>0::64 word) + 0x2)::64 word)) \<and> R9 \<sigma> = RCX\<^sub>0 \<and> R8 \<sigma> = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word) \<and> (\<sigma> \<turnstile> *[RCX\<^sub>0,4]::32 word) = ucast ((((\<langle>31,0\<rangle>RDI \<sigma>::32 word)::32 word) - (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word)::64 word) + (\<langle>63,0\<rangle>((((if' (RSI\<^sub>0::64 word) \<ge>s (ucast ((0x0::64 word))::64 word) then RSI\<^sub>0 else (((RSI\<^sub>0::64 word) + 0x7)::64 word)) >>> 3)::64 word) * 0x1)::64 word)),1]::8 word) = ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word)::64 word) + (\<langle>63,0\<rangle>((((if' (RSI\<^sub>0::64 word) \<ge>s (ucast ((0x0::64 word))::64 word) then RSI\<^sub>0 else (((RSI\<^sub>0::64 word) + 0x7)::64 word)) >>> 3)::64 word) * 0x1)::64 word)),1]::8 word)) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word)::64 word) + (\<langle>63,0\<rangle>((((if' (((RSI\<^sub>0::64 word) + 0x1)::64 word) \<ge>s (ucast ((0x0::64 word))::64 word) then ((RSI\<^sub>0::64 word) + 0x1) else (((RSI\<^sub>0::64 word) + 0x8)::64 word)) >>> 3)::64 word) * 0x1)::64 word)),1]::8 word) = ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word)::64 word) + (\<langle>63,0\<rangle>((((if' (((RSI\<^sub>0::64 word) + 0x1)::64 word) \<ge>s (ucast ((0x0::64 word))::64 word) then ((RSI\<^sub>0::64 word) + 0x1) else (((RSI\<^sub>0::64 word) + 0x8)::64 word)) >>> 3)::64 word) * 0x1)::64 word)),1]::8 word))\<close>
declare Q_0x5b52_9_def[Qs]

schematic_goal cow_is_allocated_0_4_0x5b48_0x5b4f_9[blocks]:
  assumes \<open>(P_0x5b48_9 && P_0x5b48_9_regions) \<sigma>\<close>
  shows \<open>exec_block 4 0x5b4f 9 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x5b52_9 ?\<sigma> \<and> block_usage P_0x5b48_9_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x5b48_9_def P_0x5b48_9_regions_def post: Q_0x5b52_9_def regionset: P_0x5b48_9_regions_set_def)

definition P_0x5b52_true_10 :: state_pred where
  \<open>P_0x5b52_true_10 \<sigma> \<equiv> RIP \<sigma> = 0x5b52 \<and> RAX \<sigma> = ucast (((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word)::64 word) + (\<langle>63,0\<rangle>((((if' (RSI\<^sub>0::64 word) \<ge>s (ucast ((0x0::64 word))::64 word) then RSI\<^sub>0 else (((RSI\<^sub>0::64 word) + 0x7)::64 word)) >>> 3)::64 word) * 0x1)::64 word)),1]::8 word)::32 word) >>> unat (((\<langle>7,0\<rangle>((ucast (((((\<langle>31,0\<rangle>((RSI\<^sub>0::64 word) + (\<langle>63,0\<rangle>((((RSI\<^sub>0 >>> 63) >> 61)::64 word) * 0x1)::64 word))::32 word)::32 word) AND 0x7)::32 word))::64 word) - (((RSI\<^sub>0 >>> 63) >> 61)::64 word))::8 word)::8 word)))::32 word) AND 0x1)) \<and> RDX \<sigma> = ucast ((((\<langle>31,0\<rangle>RDI \<sigma>::32 word)::32 word) - (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))) \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = RSP\<^sub>0 \<and> R10 \<sigma> = ((ucast (((\<langle>31,0\<rangle>((RDX\<^sub>0::64 word) - 0x2)::32 word)::32 word))::64 word) + (((RSI\<^sub>0::64 word) + 0x2)::64 word)) \<and> R9 \<sigma> = RCX\<^sub>0 \<and> R8 \<sigma> = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word) \<and> (\<sigma> \<turnstile> *[RCX\<^sub>0,4]::32 word) = ucast ((((\<langle>31,0\<rangle>RDI \<sigma>::32 word)::32 word) - (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word)::64 word) + (\<langle>63,0\<rangle>((((if' (RSI\<^sub>0::64 word) \<ge>s (ucast ((0x0::64 word))::64 word) then RSI\<^sub>0 else (((RSI\<^sub>0::64 word) + 0x7)::64 word)) >>> 3)::64 word) * 0x1)::64 word)),1]::8 word) = ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word)::64 word) + (\<langle>63,0\<rangle>((((if' (RSI\<^sub>0::64 word) \<ge>s (ucast ((0x0::64 word))::64 word) then RSI\<^sub>0 else (((RSI\<^sub>0::64 word) + 0x7)::64 word)) >>> 3)::64 word) * 0x1)::64 word)),1]::8 word)) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word)::64 word) + (\<langle>63,0\<rangle>((((if' (((RSI\<^sub>0::64 word) + 0x1)::64 word) \<ge>s (ucast ((0x0::64 word))::64 word) then ((RSI\<^sub>0::64 word) + 0x1) else (((RSI\<^sub>0::64 word) + 0x8)::64 word)) >>> 3)::64 word) * 0x1)::64 word)),1]::8 word) = ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word)::64 word) + (\<langle>63,0\<rangle>((((if' (((RSI\<^sub>0::64 word) + 0x1)::64 word) \<ge>s (ucast ((0x0::64 word))::64 word) then ((RSI\<^sub>0::64 word) + 0x1) else (((RSI\<^sub>0::64 word) + 0x8)::64 word)) >>> 3)::64 word) * 0x1)::64 word)),1]::8 word))\<close>
declare P_0x5b52_true_10_def[Ps]

definition P_0x5b52_true_10_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x5b52_true_10_regions_set \<sigma> \<equiv> {
    (0, RCX\<^sub>0, 4),
    (1, RSP\<^sub>0, 8),
    (2, ((RDI\<^sub>0::64 word) + 0x40), 8),
    (3, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8), 8),
    (4, (((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word)::64 word) + (\<langle>63,0\<rangle>((((if' (RDI \<sigma>::64 word) \<ge>s (ucast ((0x0::64 word))::64 word) then RDI \<sigma> else (((RDI \<sigma>::64 word) + 0x7)::64 word)) >>> 3)::64 word) * 0x1)::64 word)), 1),
    (5, (((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word)::64 word) + (\<langle>63,0\<rangle>((((if' (RSI\<^sub>0::64 word) \<ge>s (ucast ((0x0::64 word))::64 word) then RSI\<^sub>0 else (((RSI\<^sub>0::64 word) + 0x7)::64 word)) >>> 3)::64 word) * 0x1)::64 word)), 1),
    (6, (((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word)::64 word) + (\<langle>63,0\<rangle>((((if' (((RSI\<^sub>0::64 word) + 0x1)::64 word) \<ge>s (ucast ((0x0::64 word))::64 word) then ((RSI\<^sub>0::64 word) + 0x1) else (((RSI\<^sub>0::64 word) + 0x8)::64 word)) >>> 3)::64 word) * 0x1)::64 word)), 1)
  }\<close>

definition P_0x5b52_true_10_regions :: state_pred where
  \<open>P_0x5b52_true_10_regions \<sigma> \<equiv> \<exists>regions. P_0x5b52_true_10_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x5b46_10 :: state_pred where
  \<open>Q_0x5b46_10 \<sigma> \<equiv> RIP \<sigma> = 0x5b46 \<and> RAX \<sigma> = ucast (((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word)::64 word) + (\<langle>63,0\<rangle>((((if' (RSI\<^sub>0::64 word) \<ge>s (ucast ((0x0::64 word))::64 word) then RSI\<^sub>0 else (((RSI\<^sub>0::64 word) + 0x7)::64 word)) >>> 3)::64 word) * 0x1)::64 word)),1]::8 word)::32 word) >>> unat (((\<langle>7,0\<rangle>((ucast (((((\<langle>31,0\<rangle>((RSI\<^sub>0::64 word) + (\<langle>63,0\<rangle>((((RSI\<^sub>0 >>> 63) >> 61)::64 word) * 0x1)::64 word))::32 word)::32 word) AND 0x7)::32 word))::64 word) - (((RSI\<^sub>0 >>> 63) >> 61)::64 word))::8 word)::8 word)))::32 word) AND 0x1)) \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = RSP\<^sub>0 \<and> R10 \<sigma> = ((ucast (((\<langle>31,0\<rangle>((RDX\<^sub>0::64 word) - 0x2)::32 word)::32 word))::64 word) + (((RSI\<^sub>0::64 word) + 0x2)::64 word)) \<and> R9 \<sigma> = RCX\<^sub>0 \<and> R8 \<sigma> = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word)::64 word) + (\<langle>63,0\<rangle>((((if' (RSI\<^sub>0::64 word) \<ge>s (ucast ((0x0::64 word))::64 word) then RSI\<^sub>0 else (((RSI\<^sub>0::64 word) + 0x7)::64 word)) >>> 3)::64 word) * 0x1)::64 word)),1]::8 word) = ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word)::64 word) + (\<langle>63,0\<rangle>((((if' (RSI\<^sub>0::64 word) \<ge>s (ucast ((0x0::64 word))::64 word) then RSI\<^sub>0 else (((RSI\<^sub>0::64 word) + 0x7)::64 word)) >>> 3)::64 word) * 0x1)::64 word)),1]::8 word)) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word)::64 word) + (\<langle>63,0\<rangle>((((if' (((RSI\<^sub>0::64 word) + 0x1)::64 word) \<ge>s (ucast ((0x0::64 word))::64 word) then ((RSI\<^sub>0::64 word) + 0x1) else (((RSI\<^sub>0::64 word) + 0x8)::64 word)) >>> 3)::64 word) * 0x1)::64 word)),1]::8 word) = ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word)::64 word) + (\<langle>63,0\<rangle>((((if' (((RSI\<^sub>0::64 word) + 0x1)::64 word) \<ge>s (ucast ((0x0::64 word))::64 word) then ((RSI\<^sub>0::64 word) + 0x1) else (((RSI\<^sub>0::64 word) + 0x8)::64 word)) >>> 3)::64 word) * 0x1)::64 word)),1]::8 word))\<close>
declare Q_0x5b46_10_def[Qs]

schematic_goal cow_is_allocated_0_17_0x5b52_0x5b44_10[blocks]:
  assumes \<open>(P_0x5b52_true_10 && P_0x5b52_true_10_regions && !ZF) \<sigma>\<close>
  shows \<open>exec_block 17 0x5b44 10 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x5b46_10 ?\<sigma> \<and> block_usage P_0x5b52_true_10_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x5b52_true_10_def P_0x5b52_true_10_regions_def post: Q_0x5b46_10_def regionset: P_0x5b52_true_10_regions_set_def)

definition P_0x5b46_true_11 :: state_pred where
  \<open>P_0x5b46_true_11 \<sigma> \<equiv> RIP \<sigma> = 0x5b46 \<and> RAX \<sigma> = ucast (((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word)::64 word) + (\<langle>63,0\<rangle>((((if' (RSI\<^sub>0::64 word) \<ge>s (ucast ((0x0::64 word))::64 word) then RSI\<^sub>0 else (((RSI\<^sub>0::64 word) + 0x7)::64 word)) >>> 3)::64 word) * 0x1)::64 word)),1]::8 word)::32 word) >>> unat (((\<langle>7,0\<rangle>((ucast (((((\<langle>31,0\<rangle>((RSI\<^sub>0::64 word) + (\<langle>63,0\<rangle>((((RSI\<^sub>0 >>> 63) >> 61)::64 word) * 0x1)::64 word))::32 word)::32 word) AND 0x7)::32 word))::64 word) - (((RSI\<^sub>0 >>> 63) >> 61)::64 word))::8 word)::8 word)))::32 word) AND 0x1)) \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = RSP\<^sub>0 \<and> R10 \<sigma> = ((ucast (((\<langle>31,0\<rangle>((RDX\<^sub>0::64 word) - 0x2)::32 word)::32 word))::64 word) + (((RSI\<^sub>0::64 word) + 0x2)::64 word)) \<and> R9 \<sigma> = RCX\<^sub>0 \<and> R8 \<sigma> = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word)::64 word) + (\<langle>63,0\<rangle>((((if' (RSI\<^sub>0::64 word) \<ge>s (ucast ((0x0::64 word))::64 word) then RSI\<^sub>0 else (((RSI\<^sub>0::64 word) + 0x7)::64 word)) >>> 3)::64 word) * 0x1)::64 word)),1]::8 word) = ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word)::64 word) + (\<langle>63,0\<rangle>((((if' (RSI\<^sub>0::64 word) \<ge>s (ucast ((0x0::64 word))::64 word) then RSI\<^sub>0 else (((RSI\<^sub>0::64 word) + 0x7)::64 word)) >>> 3)::64 word) * 0x1)::64 word)),1]::8 word)) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word)::64 word) + (\<langle>63,0\<rangle>((((if' (((RSI\<^sub>0::64 word) + 0x1)::64 word) \<ge>s (ucast ((0x0::64 word))::64 word) then ((RSI\<^sub>0::64 word) + 0x1) else (((RSI\<^sub>0::64 word) + 0x8)::64 word)) >>> 3)::64 word) * 0x1)::64 word)),1]::8 word) = ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word)::64 word) + (\<langle>63,0\<rangle>((((if' (((RSI\<^sub>0::64 word) + 0x1)::64 word) \<ge>s (ucast ((0x0::64 word))::64 word) then ((RSI\<^sub>0::64 word) + 0x1) else (((RSI\<^sub>0::64 word) + 0x8)::64 word)) >>> 3)::64 word) * 0x1)::64 word)),1]::8 word))\<close>
declare P_0x5b46_true_11_def[Ps]

definition P_0x5b46_true_11_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x5b46_true_11_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((RDI\<^sub>0::64 word) + 0x40), 8),
    (2, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8), 8),
    (3, (((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word)::64 word) + (\<langle>63,0\<rangle>((((if' (RSI\<^sub>0::64 word) \<ge>s (ucast ((0x0::64 word))::64 word) then RSI\<^sub>0 else (((RSI\<^sub>0::64 word) + 0x7)::64 word)) >>> 3)::64 word) * 0x1)::64 word)), 1),
    (4, (((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word)::64 word) + (\<langle>63,0\<rangle>((((if' (((RSI\<^sub>0::64 word) + 0x1)::64 word) \<ge>s (ucast ((0x0::64 word))::64 word) then ((RSI\<^sub>0::64 word) + 0x1) else (((RSI\<^sub>0::64 word) + 0x8)::64 word)) >>> 3)::64 word) * 0x1)::64 word)), 1)
  }\<close>

definition P_0x5b46_true_11_regions :: state_pred where
  \<open>P_0x5b46_true_11_regions \<sigma> \<equiv> \<exists>regions. P_0x5b46_true_11_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x5b54_11 :: state_pred where
  \<open>Q_0x5b54_11 \<sigma> \<equiv> RIP \<sigma> = 0x5b54 \<and> RAX \<sigma> = ucast (((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word)::64 word) + (\<langle>63,0\<rangle>((((if' (RSI\<^sub>0::64 word) \<ge>s (ucast ((0x0::64 word))::64 word) then RSI\<^sub>0 else (((RSI\<^sub>0::64 word) + 0x7)::64 word)) >>> 3)::64 word) * 0x1)::64 word)),1]::8 word)::32 word) >>> unat (((\<langle>7,0\<rangle>((ucast (((((\<langle>31,0\<rangle>((RSI\<^sub>0::64 word) + (\<langle>63,0\<rangle>((((RSI\<^sub>0 >>> 63) >> 61)::64 word) * 0x1)::64 word))::32 word)::32 word) AND 0x7)::32 word))::64 word) - (((RSI\<^sub>0 >>> 63) >> 61)::64 word))::8 word)::8 word)))::32 word) AND 0x1)) \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = RSP\<^sub>0 \<and> R10 \<sigma> = ((ucast (((\<langle>31,0\<rangle>((RDX\<^sub>0::64 word) - 0x2)::32 word)::32 word))::64 word) + (((RSI\<^sub>0::64 word) + 0x2)::64 word)) \<and> R9 \<sigma> = RCX\<^sub>0 \<and> R8 \<sigma> = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word)::64 word) + (\<langle>63,0\<rangle>((((if' (RSI\<^sub>0::64 word) \<ge>s (ucast ((0x0::64 word))::64 word) then RSI\<^sub>0 else (((RSI\<^sub>0::64 word) + 0x7)::64 word)) >>> 3)::64 word) * 0x1)::64 word)),1]::8 word) = ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word)::64 word) + (\<langle>63,0\<rangle>((((if' (RSI\<^sub>0::64 word) \<ge>s (ucast ((0x0::64 word))::64 word) then RSI\<^sub>0 else (((RSI\<^sub>0::64 word) + 0x7)::64 word)) >>> 3)::64 word) * 0x1)::64 word)),1]::8 word)) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word)::64 word) + (\<langle>63,0\<rangle>((((if' (((RSI\<^sub>0::64 word) + 0x1)::64 word) \<ge>s (ucast ((0x0::64 word))::64 word) then ((RSI\<^sub>0::64 word) + 0x1) else (((RSI\<^sub>0::64 word) + 0x8)::64 word)) >>> 3)::64 word) * 0x1)::64 word)),1]::8 word) = ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word)::64 word) + (\<langle>63,0\<rangle>((((if' (((RSI\<^sub>0::64 word) + 0x1)::64 word) \<ge>s (ucast ((0x0::64 word))::64 word) then ((RSI\<^sub>0::64 word) + 0x1) else (((RSI\<^sub>0::64 word) + 0x8)::64 word)) >>> 3)::64 word) * 0x1)::64 word)),1]::8 word))\<close>
declare Q_0x5b54_11_def[Qs]

schematic_goal cow_is_allocated_0_1_0x5b46_0x5b46_11[blocks]:
  assumes \<open>(P_0x5b46_true_11 && P_0x5b46_true_11_regions && !ZF) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x5b46 11 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x5b54_11 ?\<sigma> \<and> block_usage P_0x5b46_true_11_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x5b46_true_11_def P_0x5b46_true_11_regions_def post: Q_0x5b54_11_def regionset: P_0x5b46_true_11_regions_set_def)

definition P_0x5b46_false_12 :: state_pred where
  \<open>P_0x5b46_false_12 \<sigma> \<equiv> RIP \<sigma> = 0x5b46 \<and> RAX \<sigma> = ucast (((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word)::64 word) + (\<langle>63,0\<rangle>((((if' (RSI\<^sub>0::64 word) \<ge>s (ucast ((0x0::64 word))::64 word) then RSI\<^sub>0 else (((RSI\<^sub>0::64 word) + 0x7)::64 word)) >>> 3)::64 word) * 0x1)::64 word)),1]::8 word)::32 word) >>> unat (((\<langle>7,0\<rangle>((ucast (((((\<langle>31,0\<rangle>((RSI\<^sub>0::64 word) + (\<langle>63,0\<rangle>((((RSI\<^sub>0 >>> 63) >> 61)::64 word) * 0x1)::64 word))::32 word)::32 word) AND 0x7)::32 word))::64 word) - (((RSI\<^sub>0 >>> 63) >> 61)::64 word))::8 word)::8 word)))::32 word) AND 0x1)) \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = RSP\<^sub>0 \<and> R10 \<sigma> = ((ucast (((\<langle>31,0\<rangle>((RDX\<^sub>0::64 word) - 0x2)::32 word)::32 word))::64 word) + (((RSI\<^sub>0::64 word) + 0x2)::64 word)) \<and> R9 \<sigma> = RCX\<^sub>0 \<and> R8 \<sigma> = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word)::64 word) + (\<langle>63,0\<rangle>((((if' (RSI\<^sub>0::64 word) \<ge>s (ucast ((0x0::64 word))::64 word) then RSI\<^sub>0 else (((RSI\<^sub>0::64 word) + 0x7)::64 word)) >>> 3)::64 word) * 0x1)::64 word)),1]::8 word) = ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word)::64 word) + (\<langle>63,0\<rangle>((((if' (RSI\<^sub>0::64 word) \<ge>s (ucast ((0x0::64 word))::64 word) then RSI\<^sub>0 else (((RSI\<^sub>0::64 word) + 0x7)::64 word)) >>> 3)::64 word) * 0x1)::64 word)),1]::8 word)) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word)::64 word) + (\<langle>63,0\<rangle>((((if' (((RSI\<^sub>0::64 word) + 0x1)::64 word) \<ge>s (ucast ((0x0::64 word))::64 word) then ((RSI\<^sub>0::64 word) + 0x1) else (((RSI\<^sub>0::64 word) + 0x8)::64 word)) >>> 3)::64 word) * 0x1)::64 word)),1]::8 word) = ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word)::64 word) + (\<langle>63,0\<rangle>((((if' (((RSI\<^sub>0::64 word) + 0x1)::64 word) \<ge>s (ucast ((0x0::64 word))::64 word) then ((RSI\<^sub>0::64 word) + 0x1) else (((RSI\<^sub>0::64 word) + 0x8)::64 word)) >>> 3)::64 word) * 0x1)::64 word)),1]::8 word))\<close>
declare P_0x5b46_false_12_def[Ps]

definition P_0x5b46_false_12_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x5b46_false_12_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((RDI\<^sub>0::64 word) + 0x40), 8),
    (2, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8), 8),
    (3, (((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word)::64 word) + (\<langle>63,0\<rangle>((((if' (RSI\<^sub>0::64 word) \<ge>s (ucast ((0x0::64 word))::64 word) then RSI\<^sub>0 else (((RSI\<^sub>0::64 word) + 0x7)::64 word)) >>> 3)::64 word) * 0x1)::64 word)), 1),
    (4, (((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word)::64 word) + (\<langle>63,0\<rangle>((((if' (((RSI\<^sub>0::64 word) + 0x1)::64 word) \<ge>s (ucast ((0x0::64 word))::64 word) then ((RSI\<^sub>0::64 word) + 0x1) else (((RSI\<^sub>0::64 word) + 0x8)::64 word)) >>> 3)::64 word) * 0x1)::64 word)), 1)
  }\<close>

definition P_0x5b46_false_12_regions :: state_pred where
  \<open>P_0x5b46_false_12_regions \<sigma> \<equiv> \<exists>regions. P_0x5b46_false_12_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x5b48_12 :: state_pred where
  \<open>Q_0x5b48_12 \<sigma> \<equiv> RIP \<sigma> = 0x5b48 \<and> RAX \<sigma> = ucast (((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word)::64 word) + (\<langle>63,0\<rangle>((((if' (RSI\<^sub>0::64 word) \<ge>s (ucast ((0x0::64 word))::64 word) then RSI\<^sub>0 else (((RSI\<^sub>0::64 word) + 0x7)::64 word)) >>> 3)::64 word) * 0x1)::64 word)),1]::8 word)::32 word) >>> unat (((\<langle>7,0\<rangle>((ucast (((((\<langle>31,0\<rangle>((RSI\<^sub>0::64 word) + (\<langle>63,0\<rangle>((((RSI\<^sub>0 >>> 63) >> 61)::64 word) * 0x1)::64 word))::32 word)::32 word) AND 0x7)::32 word))::64 word) - (((RSI\<^sub>0 >>> 63) >> 61)::64 word))::8 word)::8 word)))::32 word) AND 0x1)) \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = RSP\<^sub>0 \<and> R10 \<sigma> = ((ucast (((\<langle>31,0\<rangle>((RDX\<^sub>0::64 word) - 0x2)::32 word)::32 word))::64 word) + (((RSI\<^sub>0::64 word) + 0x2)::64 word)) \<and> R9 \<sigma> = RCX\<^sub>0 \<and> R8 \<sigma> = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word)::64 word) + (\<langle>63,0\<rangle>((((if' (RSI\<^sub>0::64 word) \<ge>s (ucast ((0x0::64 word))::64 word) then RSI\<^sub>0 else (((RSI\<^sub>0::64 word) + 0x7)::64 word)) >>> 3)::64 word) * 0x1)::64 word)),1]::8 word) = ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word)::64 word) + (\<langle>63,0\<rangle>((((if' (RSI\<^sub>0::64 word) \<ge>s (ucast ((0x0::64 word))::64 word) then RSI\<^sub>0 else (((RSI\<^sub>0::64 word) + 0x7)::64 word)) >>> 3)::64 word) * 0x1)::64 word)),1]::8 word)) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word)::64 word) + (\<langle>63,0\<rangle>((((if' (((RSI\<^sub>0::64 word) + 0x1)::64 word) \<ge>s (ucast ((0x0::64 word))::64 word) then ((RSI\<^sub>0::64 word) + 0x1) else (((RSI\<^sub>0::64 word) + 0x8)::64 word)) >>> 3)::64 word) * 0x1)::64 word)),1]::8 word) = ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word)::64 word) + (\<langle>63,0\<rangle>((((if' (((RSI\<^sub>0::64 word) + 0x1)::64 word) \<ge>s (ucast ((0x0::64 word))::64 word) then ((RSI\<^sub>0::64 word) + 0x1) else (((RSI\<^sub>0::64 word) + 0x8)::64 word)) >>> 3)::64 word) * 0x1)::64 word)),1]::8 word))\<close>
declare Q_0x5b48_12_def[Qs]

schematic_goal cow_is_allocated_0_1_0x5b46_0x5b46_12[blocks]:
  assumes \<open>(P_0x5b46_false_12 && P_0x5b46_false_12_regions && ! !ZF) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x5b46 12 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x5b48_12 ?\<sigma> \<and> block_usage P_0x5b46_false_12_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x5b46_false_12_def P_0x5b46_false_12_regions_def post: Q_0x5b48_12_def regionset: P_0x5b46_false_12_regions_set_def)

definition P_0x5b52_false_13 :: state_pred where
  \<open>P_0x5b52_false_13 \<sigma> \<equiv> RIP \<sigma> = 0x5b52 \<and> RAX \<sigma> = ucast (((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word)::64 word) + (\<langle>63,0\<rangle>((((if' (RSI\<^sub>0::64 word) \<ge>s (ucast ((0x0::64 word))::64 word) then RSI\<^sub>0 else (((RSI\<^sub>0::64 word) + 0x7)::64 word)) >>> 3)::64 word) * 0x1)::64 word)),1]::8 word)::32 word) >>> unat (((\<langle>7,0\<rangle>((ucast (((((\<langle>31,0\<rangle>((RSI\<^sub>0::64 word) + (\<langle>63,0\<rangle>((((RSI\<^sub>0 >>> 63) >> 61)::64 word) * 0x1)::64 word))::32 word)::32 word) AND 0x7)::32 word))::64 word) - (((RSI\<^sub>0 >>> 63) >> 61)::64 word))::8 word)::8 word)))::32 word) AND 0x1)) \<and> RDX \<sigma> = ucast ((((\<langle>31,0\<rangle>RDI \<sigma>::32 word)::32 word) - (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))) \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = RSP\<^sub>0 \<and> R10 \<sigma> = ((ucast (((\<langle>31,0\<rangle>((RDX\<^sub>0::64 word) - 0x2)::32 word)::32 word))::64 word) + (((RSI\<^sub>0::64 word) + 0x2)::64 word)) \<and> R9 \<sigma> = RCX\<^sub>0 \<and> R8 \<sigma> = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word) \<and> (\<sigma> \<turnstile> *[RCX\<^sub>0,4]::32 word) = ucast ((((\<langle>31,0\<rangle>RDI \<sigma>::32 word)::32 word) - (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word)::64 word) + (\<langle>63,0\<rangle>((((if' (RSI\<^sub>0::64 word) \<ge>s (ucast ((0x0::64 word))::64 word) then RSI\<^sub>0 else (((RSI\<^sub>0::64 word) + 0x7)::64 word)) >>> 3)::64 word) * 0x1)::64 word)),1]::8 word) = ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word)::64 word) + (\<langle>63,0\<rangle>((((if' (RSI\<^sub>0::64 word) \<ge>s (ucast ((0x0::64 word))::64 word) then RSI\<^sub>0 else (((RSI\<^sub>0::64 word) + 0x7)::64 word)) >>> 3)::64 word) * 0x1)::64 word)),1]::8 word)) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word)::64 word) + (\<langle>63,0\<rangle>((((if' (((RSI\<^sub>0::64 word) + 0x1)::64 word) \<ge>s (ucast ((0x0::64 word))::64 word) then ((RSI\<^sub>0::64 word) + 0x1) else (((RSI\<^sub>0::64 word) + 0x8)::64 word)) >>> 3)::64 word) * 0x1)::64 word)),1]::8 word) = ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word)::64 word) + (\<langle>63,0\<rangle>((((if' (((RSI\<^sub>0::64 word) + 0x1)::64 word) \<ge>s (ucast ((0x0::64 word))::64 word) then ((RSI\<^sub>0::64 word) + 0x1) else (((RSI\<^sub>0::64 word) + 0x8)::64 word)) >>> 3)::64 word) * 0x1)::64 word)),1]::8 word))\<close>
declare P_0x5b52_false_13_def[Ps]

definition P_0x5b52_false_13_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x5b52_false_13_regions_set \<sigma> \<equiv> {
    (0, RCX\<^sub>0, 4),
    (1, RSP\<^sub>0, 8),
    (2, ((RDI\<^sub>0::64 word) + 0x40), 8),
    (3, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8), 8),
    (4, (((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word)::64 word) + (\<langle>63,0\<rangle>((((if' (RSI\<^sub>0::64 word) \<ge>s (ucast ((0x0::64 word))::64 word) then RSI\<^sub>0 else (((RSI\<^sub>0::64 word) + 0x7)::64 word)) >>> 3)::64 word) * 0x1)::64 word)), 1),
    (5, (((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word)::64 word) + (\<langle>63,0\<rangle>((((if' (((RSI\<^sub>0::64 word) + 0x1)::64 word) \<ge>s (ucast ((0x0::64 word))::64 word) then ((RSI\<^sub>0::64 word) + 0x1) else (((RSI\<^sub>0::64 word) + 0x8)::64 word)) >>> 3)::64 word) * 0x1)::64 word)), 1)
  }\<close>

definition P_0x5b52_false_13_regions :: state_pred where
  \<open>P_0x5b52_false_13_regions \<sigma> \<equiv> \<exists>regions. P_0x5b52_false_13_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x5b54_13 :: state_pred where
  \<open>Q_0x5b54_13 \<sigma> \<equiv> RIP \<sigma> = 0x5b54 \<and> RAX \<sigma> = ucast (((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word)::64 word) + (\<langle>63,0\<rangle>((((if' (RSI\<^sub>0::64 word) \<ge>s (ucast ((0x0::64 word))::64 word) then RSI\<^sub>0 else (((RSI\<^sub>0::64 word) + 0x7)::64 word)) >>> 3)::64 word) * 0x1)::64 word)),1]::8 word)::32 word) >>> unat (((\<langle>7,0\<rangle>((ucast (((((\<langle>31,0\<rangle>((RSI\<^sub>0::64 word) + (\<langle>63,0\<rangle>((((RSI\<^sub>0 >>> 63) >> 61)::64 word) * 0x1)::64 word))::32 word)::32 word) AND 0x7)::32 word))::64 word) - (((RSI\<^sub>0 >>> 63) >> 61)::64 word))::8 word)::8 word)))::32 word) AND 0x1)) \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = RSP\<^sub>0 \<and> R10 \<sigma> = ((ucast (((\<langle>31,0\<rangle>((RDX\<^sub>0::64 word) - 0x2)::32 word)::32 word))::64 word) + (((RSI\<^sub>0::64 word) + 0x2)::64 word)) \<and> R9 \<sigma> = RCX\<^sub>0 \<and> R8 \<sigma> = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word)::64 word) + (\<langle>63,0\<rangle>((((if' (RSI\<^sub>0::64 word) \<ge>s (ucast ((0x0::64 word))::64 word) then RSI\<^sub>0 else (((RSI\<^sub>0::64 word) + 0x7)::64 word)) >>> 3)::64 word) * 0x1)::64 word)),1]::8 word) = ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word)::64 word) + (\<langle>63,0\<rangle>((((if' (RSI\<^sub>0::64 word) \<ge>s (ucast ((0x0::64 word))::64 word) then RSI\<^sub>0 else (((RSI\<^sub>0::64 word) + 0x7)::64 word)) >>> 3)::64 word) * 0x1)::64 word)),1]::8 word)) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word)::64 word) + (\<langle>63,0\<rangle>((((if' (((RSI\<^sub>0::64 word) + 0x1)::64 word) \<ge>s (ucast ((0x0::64 word))::64 word) then ((RSI\<^sub>0::64 word) + 0x1) else (((RSI\<^sub>0::64 word) + 0x8)::64 word)) >>> 3)::64 word) * 0x1)::64 word)),1]::8 word) = ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word)::64 word) + (\<langle>63,0\<rangle>((((if' (((RSI\<^sub>0::64 word) + 0x1)::64 word) \<ge>s (ucast ((0x0::64 word))::64 word) then ((RSI\<^sub>0::64 word) + 0x1) else (((RSI\<^sub>0::64 word) + 0x8)::64 word)) >>> 3)::64 word) * 0x1)::64 word)),1]::8 word))\<close>
declare Q_0x5b54_13_def[Qs]

schematic_goal cow_is_allocated_0_1_0x5b52_0x5b52_13[blocks]:
  assumes \<open>(P_0x5b52_false_13 && P_0x5b52_false_13_regions && ! !ZF) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x5b52 13 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x5b54_13 ?\<sigma> \<and> block_usage P_0x5b52_false_13_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x5b52_false_13_def P_0x5b52_false_13_regions_def post: Q_0x5b54_13_def regionset: P_0x5b52_false_13_regions_set_def)

definition P_0x5b54_14 :: state_pred where
  \<open>P_0x5b54_14 \<sigma> \<equiv> RIP \<sigma> = 0x5b54 \<and> RAX \<sigma> = ucast (((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word)::64 word) + (\<langle>63,0\<rangle>((((if' (RSI\<^sub>0::64 word) \<ge>s (ucast ((0x0::64 word))::64 word) then RSI\<^sub>0 else (((RSI\<^sub>0::64 word) + 0x7)::64 word)) >>> 3)::64 word) * 0x1)::64 word)),1]::8 word)::32 word) >>> unat (((\<langle>7,0\<rangle>((ucast (((((\<langle>31,0\<rangle>((RSI\<^sub>0::64 word) + (\<langle>63,0\<rangle>((((RSI\<^sub>0 >>> 63) >> 61)::64 word) * 0x1)::64 word))::32 word)::32 word) AND 0x7)::32 word))::64 word) - (((RSI\<^sub>0 >>> 63) >> 61)::64 word))::8 word)::8 word)))::32 word) AND 0x1)) \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = RSP\<^sub>0 \<and> R9 \<sigma> = RCX\<^sub>0 \<and> R8 \<sigma> = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word)::64 word) + (\<langle>63,0\<rangle>((((if' (RSI\<^sub>0::64 word) \<ge>s (ucast ((0x0::64 word))::64 word) then RSI\<^sub>0 else (((RSI\<^sub>0::64 word) + 0x7)::64 word)) >>> 3)::64 word) * 0x1)::64 word)),1]::8 word) = ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word)::64 word) + (\<langle>63,0\<rangle>((((if' (RSI\<^sub>0::64 word) \<ge>s (ucast ((0x0::64 word))::64 word) then RSI\<^sub>0 else (((RSI\<^sub>0::64 word) + 0x7)::64 word)) >>> 3)::64 word) * 0x1)::64 word)),1]::8 word))\<close>
declare P_0x5b54_14_def[Ps]

definition P_0x5b54_14_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x5b54_14_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((RDI\<^sub>0::64 word) + 0x40), 8),
    (2, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8), 8),
    (3, (((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word)::64 word) + (\<langle>63,0\<rangle>((((if' (RSI\<^sub>0::64 word) \<ge>s (ucast ((0x0::64 word))::64 word) then RSI\<^sub>0 else (((RSI\<^sub>0::64 word) + 0x7)::64 word)) >>> 3)::64 word) * 0x1)::64 word)), 1)
  }\<close>

definition P_0x5b54_14_regions :: state_pred where
  \<open>P_0x5b54_14_regions \<sigma> \<equiv> \<exists>regions. P_0x5b54_14_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_ret_address_14 :: state_pred where
  \<open>Q_ret_address_14 \<sigma> \<equiv> RIP \<sigma> = ret_address \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) + 0x8) \<and> R9 \<sigma> = RCX\<^sub>0 \<and> R8 \<sigma> = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word)\<close>
declare Q_ret_address_14_def[Qs]

schematic_goal cow_is_allocated_0_1_0x5b54_0x5b54_14[blocks]:
  assumes \<open>(P_0x5b54_14 && P_0x5b54_14_regions) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x5b54 14 \<sigma> \<triangleq> ?\<sigma> \<and> Q_ret_address_14 ?\<sigma> \<and> block_usage P_0x5b54_14_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x5b54_14_def P_0x5b54_14_regions_def post: Q_ret_address_14_def regionset: P_0x5b54_14_regions_set_def)

definition cow_is_allocated_acode :: ACode where
  \<open>cow_is_allocated_acode =
    Block 4 0x5a7b 0;
    IF ZF THEN
      Block 4 0x5b5d (Suc 0)
    ELSE
      Block 2 0x5a84 2;
      IF ZF THEN
        Block 4 0x5b5d 3
      ELSE
        Block 16 0x5ac1 4;
        IF jle THEN
          Block (Suc 0) 0x5ac4 5
        ELSE
          Block 16 0x5afb 6;
          IF !ZF THEN
            Block (Suc 0) 0x5afd 7
          ELSE
            Block 5 0x5b0a 8;
            WHILE P_0x5b48_9 DO
              Block 4 0x5b4f 9;
              IF !ZF THEN
                Block 17 0x5b44 10;
                IF !ZF THEN
                  Block (Suc 0) 0x5b46 11
                ELSE
                  Block (Suc 0) 0x5b46 12
                FI
              ELSE
                Block (Suc 0) 0x5b52 13
              FI
            OD
          FI
        FI;
        Block (Suc 0) 0x5b54 14
      FI
    FI
  \<close>

schematic_goal "cow_is_allocated":
  assumes
    \<open>\<forall>\<sigma>. RIP \<sigma> = 0x5a7e \<longrightarrow> P_0x5a7e_true_1_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x5a7e \<longrightarrow> P_0x5a7e_false_2_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x5a86 \<longrightarrow> P_0x5a86_true_3_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x5a86 \<longrightarrow> P_0x5a86_false_4_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x5ac4 \<longrightarrow> P_0x5ac4_true_5_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x5ac4 \<longrightarrow> P_0x5ac4_false_6_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x5afd \<longrightarrow> P_0x5afd_true_7_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x5afd \<longrightarrow> P_0x5afd_false_8_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x5b48 \<longrightarrow> P_0x5b48_9_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x5b52 \<longrightarrow> P_0x5b52_true_10_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x5b46 \<longrightarrow> P_0x5b46_true_11_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x5b46 \<longrightarrow> P_0x5b46_false_12_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x5b52 \<longrightarrow> P_0x5b52_false_13_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x5b54 \<longrightarrow> P_0x5b54_14_regions \<sigma>\<close>
  shows \<open>{{?P}} cow_is_allocated_acode {{?Q;?M}}\<close>
  apply (vcg acode: cow_is_allocated_acode_def assms: assms)
  apply (vcg_while "P_0x5b48_9 || P_0x5b54_14")
  apply (vcg_step assms: assms)+
  apply (auto simp add: pred_logic Ps Qs)[1]
  apply auto
  apply (vcg_step assms: assms)+
  apply (auto simp add: pred_logic Ps Qs assms)[1]
  apply (auto simp add: pred_logic Ps Qs assms)[1]
  apply (auto simp add: pred_logic Ps Qs assms)[1]
  apply (auto simp add: pred_logic Ps Qs assms)[1]
  apply auto
  done
end
