theory l2_load_isra_5
  imports
    "../../../isabelle/VCG/HTriple"
begin

locale "qemu_img_xen" = execution_context + exec_code +
  fixes bdrv_pread_0x12bd8_retval\<^sub>v bdrv_pread_addr :: \<open>64 word\<close>
    and bdrv_pread_acode :: ACode
  assumes fetch:
    "fetch 0x12b60 \<equiv> (Unary (IS_8088 Push) (Storage (Reg (General SixtyFour r13))), 2)"
    "fetch 0x12b62 \<equiv> (Binary (IS_8088 Xor) (Reg (General ThirtyTwo rax)) (Storage (Reg (General ThirtyTwo rax))), 2)"
    "fetch 0x12b64 \<equiv> (Unary (IS_8088 Push) (Storage (Reg (General SixtyFour r12))), 2)"
    "fetch 0x12b66 \<equiv> (Unary (IS_8088 Push) (Storage (Reg (General SixtyFour rbp))), 1)"
    "fetch 0x12b67 \<equiv> (Unary (IS_8088 Push) (Storage (Reg (General SixtyFour rbx))), 1)"
    "fetch 0x12b68 \<equiv> (Binary (IS_8088 Sub) (Reg (General SixtyFour rsp)) (Immediate SixtyFour (ImmVal 8)), 4)"
    "fetch 0x12b6c \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour rbx)) (Storage (Memory SixtyFour (A_SizeDirective 64 (A_FromReg (General SixtyFour rdi))))), 3)"
    "fetch 0x12b6f \<equiv> (Nullary (IS_8088 Nop), 1)"
    "fetch 0x12b70 \<equiv> (Binary (IS_8088 Mov) (Reg (General ThirtyTwo rdx)) (Storage (Reg (General ThirtyTwo rax))), 2)"
    "fetch 0x12b72 \<equiv> (Binary (IS_8088 Cmp) (Reg (General SixtyFour rsi)) (Storage (Memory SixtyFour (A_SizeDirective 64 (A_Plus (A_FromReg (General SixtyFour rbx)) (A_Plus (A_Mult 8 (A_FromReg (General SixtyFour rax))) (A_WordConstant 80)))))), 5)"
    "fetch 0x12b77 \<equiv> (Unary (IS_8088 Je) (Immediate SixtyFour (ImmVal 76816)), 6)"
    "fetch 0x12b7d \<equiv> (Binary (IS_8088 Add) (Reg (General SixtyFour rax)) (Immediate SixtyFour (ImmVal 1)), 4)"
    "fetch 0x12b81 \<equiv> (Binary (IS_8088 Cmp) (Reg (General SixtyFour rax)) (Immediate SixtyFour (ImmVal 16)), 4)"
    "fetch 0x12b85 \<equiv> (Unary (IS_8088 Jne) (Immediate SixtyFour (ImmVal 76656)), 2)"
    "fetch 0x12b87 \<equiv> (Binary (IS_8088 Mov) (Reg (General ThirtyTwo rcx)) (Storage (Memory ThirtyTwo (A_SizeDirective 32 (A_Plus (A_FromReg (General SixtyFour rbx)) (A_WordConstant 20))))), 3)"
    "fetch 0x12b8a \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour r9)) (Storage (Memory SixtyFour (A_SizeDirective 64 (A_Plus (A_FromReg (General SixtyFour rbx)) (A_WordConstant 72))))), 4)"
    "fetch 0x12b8e \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour r8)) (Storage (Reg (General SixtyFour rbx))), 3)"
    "fetch 0x12b91 \<equiv> (Binary (IS_8088 Xor) (Reg (General ThirtyTwo rax)) (Storage (Reg (General ThirtyTwo rax))), 2)"
    "fetch 0x12b93 \<equiv> (Binary (IS_8088 Xor) (Reg (General ThirtyTwo rbp)) (Storage (Reg (General ThirtyTwo rbp))), 2)"
    "fetch 0x12b95 \<equiv> (Binary (IS_8088 Mov) (Reg (General ThirtyTwo rdi)) (Immediate SixtyFour (ImmVal 4294967295)), 5)"
    "fetch 0x12b9a \<equiv> (Unary (IS_8088 Nop) (Storage (Memory Sixteen (A_SizeDirective 16 (A_Plus (A_FromReg (General SixtyFour rax)) (A_Plus (A_Mult 1 (A_FromReg (General SixtyFour rax))) (A_WordConstant 0)))))), 6)"
    "fetch 0x12ba0 \<equiv> (Binary (IS_8088 Mov) (Reg (General ThirtyTwo rdx)) (Storage (Memory ThirtyTwo (A_SizeDirective 32 (A_Plus (A_FromReg (General SixtyFour r8)) (A_Plus (A_Mult 4 (A_FromReg (General SixtyFour rax))) (A_WordConstant 208)))))), 8)"
    "fetch 0x12ba8 \<equiv> (Binary (IS_8088 Cmp) (Reg (General ThirtyTwo rdx)) (Storage (Reg (General ThirtyTwo rdi))), 2)"
    "fetch 0x12baa \<equiv> (Unary (IS_8088 Jae) (Immediate SixtyFour (ImmVal 76721)), 2)"
    "fetch 0x12bac \<equiv> (Binary (IS_X86_64 Movsxd) (Reg (General SixtyFour rbp)) (Storage (Reg (General ThirtyTwo rax))), 3)"
    "fetch 0x12baf \<equiv> (Binary (IS_8088 Mov) (Reg (General ThirtyTwo rdi)) (Storage (Reg (General ThirtyTwo rdx))), 2)"
    "fetch 0x12bb1 \<equiv> (Binary (IS_8088 Add) (Reg (General SixtyFour rax)) (Immediate SixtyFour (ImmVal 1)), 4)"
    "fetch 0x12bb5 \<equiv> (Binary (IS_8088 Cmp) (Reg (General SixtyFour rax)) (Immediate SixtyFour (ImmVal 16)), 4)"
    "fetch 0x12bb9 \<equiv> (Unary (IS_8088 Jne) (Immediate SixtyFour (ImmVal 76704)), 2)"
    "fetch 0x12bbb \<equiv> (Binary (IS_8088 Mov) (Reg (General ThirtyTwo rax)) (Storage (Reg (General ThirtyTwo rbp))), 2)"
    "fetch 0x12bbd \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour rdi)) (Storage (Memory SixtyFour (A_SizeDirective 64 (A_FromReg (General SixtyFour rbx))))), 3)"
    "fetch 0x12bc0 \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour r13)) (Storage (Reg (General SixtyFour rsi))), 3)"
    "fetch 0x12bc3 \<equiv> (Binary (IS_8088 Shl) (Reg (General ThirtyTwo rax)) (Storage (Reg (General Eight rcx))), 2)"
    "fetch 0x12bc5 \<equiv> (Nullary (IS_X86_64 Cdqe), 2)"
    "fetch 0x12bc7 \<equiv> (Binary (IS_8088 Lea) (Reg (General SixtyFour r12)) (Storage (Memory SixtyFour (A_Plus (A_FromReg (General SixtyFour r9)) (A_Mult 8 (A_FromReg (General SixtyFour rax)))))), 4)"
    "fetch 0x12bcb \<equiv> (Binary (IS_8088 Mov) (Reg (General ThirtyTwo rax)) (Storage (Memory ThirtyTwo (A_SizeDirective 32 (A_Plus (A_FromReg (General SixtyFour rbx)) (A_WordConstant 24))))), 3)"
    "fetch 0x12bce \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour rdx)) (Storage (Reg (General SixtyFour r12))), 3)"
    "fetch 0x12bd1 \<equiv> (Binary (IS_8088 Lea) (Reg (General ThirtyTwo rcx)) (Storage (Memory SixtyFour (A_Plus (A_Mult 8 (A_FromReg (General SixtyFour rax))) (A_WordConstant 0)))), 7)"
    "fetch 0x12bd8 \<equiv> (Unary (IS_8088 Call) (Immediate SixtyFour (ImmLabel ''bdrv_pread'')), 5)"
    "fetch 0x12bdd \<equiv> (Binary (IS_X86_64 Movsxd) (Reg (General SixtyFour rdx)) (Storage (Memory ThirtyTwo (A_SizeDirective 32 (A_Plus (A_FromReg (General SixtyFour rbx)) (A_WordConstant 24))))), 4)"
    "fetch 0x12be1 \<equiv> (Nullary (IS_X86_64 Cdqe), 2)"
    "fetch 0x12be3 \<equiv> (Binary (IS_8088 Shl) (Reg (General SixtyFour rdx)) (Immediate SixtyFour (ImmVal 3)), 4)"
    "fetch 0x12be7 \<equiv> (Binary (IS_8088 Cmp) (Reg (General SixtyFour rax)) (Storage (Reg (General SixtyFour rdx))), 3)"
    "fetch 0x12bea \<equiv> (Unary (IS_8088 Jne) (Immediate SixtyFour (ImmVal 76912)), 6)"
    "fetch 0x12bf0 \<equiv> (Binary (IS_8088 Mov) (Memory SixtyFour (A_SizeDirective 64 (A_Plus (A_FromReg (General SixtyFour rbx)) (A_Plus (A_Mult 8 (A_FromReg (General SixtyFour rbp))) (A_WordConstant 80))))) (Storage (Reg (General SixtyFour r13))), 5)"
    "fetch 0x12bf5 \<equiv> (Binary (IS_8088 Mov) (Memory ThirtyTwo (A_SizeDirective 32 (A_Plus (A_FromReg (General SixtyFour rbx)) (A_Plus (A_Mult 4 (A_FromReg (General SixtyFour rbp))) (A_WordConstant 208))))) (Immediate SixtyFour (ImmVal 1)), 11)"
    "fetch 0x12c00 \<equiv> (Binary (IS_8088 Add) (Reg (General SixtyFour rsp)) (Immediate SixtyFour (ImmVal 8)), 4)"
    "fetch 0x12c04 \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour rax)) (Storage (Reg (General SixtyFour r12))), 3)"
    "fetch 0x12c07 \<equiv> (Unary (IS_8088 Pop) (Storage (Reg (General SixtyFour rbx))), 1)"
    "fetch 0x12c08 \<equiv> (Unary (IS_8088 Pop) (Storage (Reg (General SixtyFour rbp))), 1)"
    "fetch 0x12c09 \<equiv> (Unary (IS_8088 Pop) (Storage (Reg (General SixtyFour r12))), 2)"
    "fetch 0x12c0b \<equiv> (Unary (IS_8088 Pop) (Storage (Reg (General SixtyFour r13))), 2)"
    "fetch 0x12c0d \<equiv> (Nullary (IS_8088 Ret), 1)"
    "fetch 0x12c0e \<equiv> (Binary (IS_8088 Xchg) (Reg (General Sixteen rax)) (Storage (Reg (General Sixteen rax))), 2)"
    "fetch 0x12c10 \<equiv> (Nullary (IS_X86_64 Cdqe), 2)"
    "fetch 0x12c12 \<equiv> (Binary (IS_8088 Lea) (Reg (General SixtyFour rcx)) (Storage (Memory SixtyFour (A_Plus (A_FromReg (General SixtyFour rbx)) (A_Mult 4 (A_FromReg (General SixtyFour rax)))))), 4)"
    "fetch 0x12c16 \<equiv> (Binary (IS_8088 Mov) (Reg (General ThirtyTwo rax)) (Storage (Memory ThirtyTwo (A_SizeDirective 32 (A_Plus (A_FromReg (General SixtyFour rcx)) (A_WordConstant 208))))), 6)"
    "fetch 0x12c1c \<equiv> (Binary (IS_8088 Add) (Reg (General ThirtyTwo rax)) (Immediate SixtyFour (ImmVal 1)), 3)"
    "fetch 0x12c1f \<equiv> (Binary (IS_8088 Mov) (Memory ThirtyTwo (A_SizeDirective 32 (A_Plus (A_FromReg (General SixtyFour rcx)) (A_WordConstant 208)))) (Storage (Reg (General ThirtyTwo rax))), 6)"
    "fetch 0x12c25 \<equiv> (Binary (IS_8088 Cmp) (Reg (General ThirtyTwo rax)) (Immediate SixtyFour (ImmVal 4294967295)), 3)"
    "fetch 0x12c28 \<equiv> (Unary (IS_8088 Je) (Immediate SixtyFour (ImmVal 76880)), 2)"
    "fetch 0x12c2a \<equiv> (Binary (IS_8088 Mov) (Reg (General ThirtyTwo rcx)) (Storage (Memory ThirtyTwo (A_SizeDirective 32 (A_Plus (A_FromReg (General SixtyFour rbx)) (A_WordConstant 20))))), 3)"
    "fetch 0x12c2d \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour r9)) (Storage (Memory SixtyFour (A_SizeDirective 64 (A_Plus (A_FromReg (General SixtyFour rbx)) (A_WordConstant 72))))), 4)"
    "fetch 0x12c31 \<equiv> (Binary (IS_8088 Shl) (Reg (General ThirtyTwo rdx)) (Storage (Reg (General Eight rcx))), 2)"
    "fetch 0x12c33 \<equiv> (Binary (IS_X86_64 Movsxd) (Reg (General SixtyFour rdx)) (Storage (Reg (General ThirtyTwo rdx))), 3)"
    "fetch 0x12c36 \<equiv> (Binary (IS_8088 Lea) (Reg (General SixtyFour r12)) (Storage (Memory SixtyFour (A_Plus (A_FromReg (General SixtyFour r9)) (A_Mult 8 (A_FromReg (General SixtyFour rdx)))))), 4)"
    "fetch 0x12c3a \<equiv> (Binary (IS_8088 Test) (Reg (General SixtyFour r12)) (Storage (Reg (General SixtyFour r12))), 3)"
    "fetch 0x12c3d \<equiv> (Unary (IS_8088 Jne) (Immediate SixtyFour (ImmVal 76800)), 2)"
    "fetch 0x12c3f \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour r8)) (Storage (Memory SixtyFour (A_SizeDirective 64 (A_FromReg (General SixtyFour rdi))))), 3)"
    "fetch 0x12c42 \<equiv> (Unary (IS_8088 Jmp) (Immediate SixtyFour (ImmVal 76689)), 5)"
    "fetch 0x12c47 \<equiv> (Unary (IS_8088 Nop) (Storage (Memory Sixteen (A_SizeDirective 16 (A_Plus (A_FromReg (General SixtyFour rax)) (A_Plus (A_Mult 1 (A_FromReg (General SixtyFour rax))) (A_WordConstant 0)))))), 9)"
    "fetch 0x12c50 \<equiv> (Binary (IS_8088 Lea) (Reg (General SixtyFour rax)) (Storage (Memory SixtyFour (A_Plus (A_FromReg (General SixtyFour rbx)) (A_WordConstant 208)))), 7)"
    "fetch 0x12c57 \<equiv> (Binary (IS_8088 Lea) (Reg (General SixtyFour rcx)) (Storage (Memory SixtyFour (A_Plus (A_FromReg (General SixtyFour rbx)) (A_WordConstant 272)))), 7)"
    "fetch 0x12c5e \<equiv> (Binary (IS_8088 Xchg) (Reg (General Sixteen rax)) (Storage (Reg (General Sixteen rax))), 2)"
    "fetch 0x12c60 \<equiv> (Binary (IS_8088 Shr) (Memory ThirtyTwo (A_SizeDirective 32 (A_FromReg (General SixtyFour rax)))) (Immediate SixtyFour (ImmVal 1)), 2)"
    "fetch 0x12c62 \<equiv> (Binary (IS_8088 Add) (Reg (General SixtyFour rax)) (Immediate SixtyFour (ImmVal 4)), 4)"
    "fetch 0x12c66 \<equiv> (Binary (IS_8088 Cmp) (Reg (General SixtyFour rax)) (Storage (Reg (General SixtyFour rcx))), 3)"
    "fetch 0x12c69 \<equiv> (Unary (IS_8088 Jne) (Immediate SixtyFour (ImmVal 76896)), 2)"
    "fetch 0x12c6b \<equiv> (Unary (IS_8088 Jmp) (Immediate SixtyFour (ImmVal 76842)), 2)"
    "fetch 0x12c6d \<equiv> (Unary (IS_8088 Nop) (Storage (Memory ThirtyTwo (A_SizeDirective 32 (A_FromReg (General SixtyFour rax))))), 3)"
    "fetch 0x12c70 \<equiv> (Binary (IS_8088 Add) (Reg (General SixtyFour rsp)) (Immediate SixtyFour (ImmVal 8)), 4)"
    "fetch 0x12c74 \<equiv> (Binary (IS_8088 Xor) (Reg (General ThirtyTwo r12)) (Storage (Reg (General ThirtyTwo r12))), 3)"
    "fetch 0x12c77 \<equiv> (Unary (IS_8088 Pop) (Storage (Reg (General SixtyFour rbx))), 1)"
    "fetch 0x12c78 \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour rax)) (Storage (Reg (General SixtyFour r12))), 3)"
    "fetch 0x12c7b \<equiv> (Unary (IS_8088 Pop) (Storage (Reg (General SixtyFour rbp))), 1)"
    "fetch 0x12c7c \<equiv> (Unary (IS_8088 Pop) (Storage (Reg (General SixtyFour r12))), 2)"
    "fetch 0x12c7e \<equiv> (Unary (IS_8088 Pop) (Storage (Reg (General SixtyFour r13))), 2)"
    "fetch 0x12c80 \<equiv> (Nullary (IS_8088 Ret), 1)"
    "fetch 0x12c81 \<equiv> (Unary (IS_8088 Nop) (Storage (Memory Sixteen (A_SizeDirective 16 (A_Plus (A_FromReg (General SixtyFour cs)) (A_Plus (A_FromReg (General SixtyFour rax)) (A_Plus (A_Mult 1 (A_FromReg (General SixtyFour rax))) (A_WordConstant 0))))))), 11)"
    and \<alpha>_def: \<open>\<alpha> = \<lparr>text_sections = [], data_sections = [], labels_to_offsets = [], binary_offset = 0\<rparr>\<close>
    and bdrv_pread\<^sub>a\<^sub>d\<^sub>d\<^sub>r[simp]: \<open>the (label_to_address \<alpha> ''bdrv_pread'') = bdrv_pread_addr\<close>
begin

text \<open>Using definitions that don't get unfolded immediately prevents locale argument issues.\<close>
definition \<open>bdrv_pread_0x12bd8_retval \<equiv> bdrv_pread_0x12bd8_retval\<^sub>v\<close>

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

method vcg_step' uses assms =
  (rule htriples)+,
  simp,
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

locale "l2_load_isra_5" = "qemu_img_xen" +
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

definition P_0x12b60_0 :: state_pred where
  \<open>P_0x12b60_0 \<sigma> \<equiv> RIP \<sigma> = 0x12b60 \<and> RAX \<sigma> = RAX\<^sub>0 \<and> RBX \<sigma> = RBX\<^sub>0 \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = RDX\<^sub>0 \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = RSP\<^sub>0 \<and> RBP \<sigma> = RBP\<^sub>0 \<and> R13 \<sigma> = R13\<^sub>0 \<and> R12 \<sigma> = R12\<^sub>0 \<and> R9 \<sigma> = R9\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address\<close>
declare P_0x12b60_0_def[Ps]

definition P_0x12b60_0_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x12b60_0_regions_set \<sigma> \<equiv> {
    (0, RDI\<^sub>0, 8),
    (1, RSP\<^sub>0, 8),
    (2, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x20), 8)
  }\<close>

definition P_0x12b60_0_regions :: state_pred where
  \<open>P_0x12b60_0_regions \<sigma> \<equiv> \<exists>regions. P_0x12b60_0_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x12b70_0 :: state_pred where
  \<open>Q_0x12b70_0 \<sigma> \<equiv> RIP \<sigma> = 0x12b70 \<and> RBX \<sigma> = (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x28) \<and> RBP \<sigma> = RBP\<^sub>0 \<and> R13 \<sigma> = R13\<^sub>0 \<and> R12 \<sigma> = R12\<^sub>0 \<and> R9 \<sigma> = R9\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) = (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBX\<^sub>0\<close>
declare Q_0x12b70_0_def[Qs]

schematic_goal l2_load_isra_5_0_8_0x12b60_0x12b6f_0[blocks]:
  assumes \<open>(P_0x12b60_0 && P_0x12b60_0_regions) \<sigma>\<close>
  shows \<open>exec_block 8 0x12b6f 0 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x12b70_0 ?\<sigma> \<and> block_usage P_0x12b60_0_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x12b60_0_def P_0x12b60_0_regions_def post: Q_0x12b70_0_def regionset: P_0x12b60_0_regions_set_def)

definition P_0x12b70_1 :: state_pred where
  \<open>P_0x12b70_1 \<sigma> \<equiv> RIP \<sigma> = 0x12b70 \<and> RBX \<sigma> = (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x28) \<and> RBP \<sigma> = RBP\<^sub>0 \<and> R13 \<sigma> = R13\<^sub>0 \<and> R12 \<sigma> = R12\<^sub>0 \<and> R9 \<sigma> = R9\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) = (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBX\<^sub>0\<close>
declare P_0x12b70_1_def[Ps]

definition P_0x12b70_1_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x12b70_1_regions_set \<sigma> \<equiv> {
    (0, RDI\<^sub>0, 8),
    (1, RSP\<^sub>0, 8),
    (2, (((\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word)::64 word) + (((\<langle>63,0\<rangle>((RAX \<sigma>::64 word) * 0x8)::64 word)::64 word) + 0x50)), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x20), 8)
  }\<close>

definition P_0x12b70_1_regions :: state_pred where
  \<open>P_0x12b70_1_regions \<sigma> \<equiv> \<exists>regions. P_0x12b70_1_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x12b77_1 :: state_pred where
  \<open>Q_0x12b77_1 \<sigma> \<equiv> RIP \<sigma> = 0x12b77 \<and> RBX \<sigma> = (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = ucast ((\<langle>31,0\<rangle>RAX \<sigma>::32 word)) \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x28) \<and> RBP \<sigma> = RBP\<^sub>0 \<and> R13 \<sigma> = R13\<^sub>0 \<and> R12 \<sigma> = R12\<^sub>0 \<and> R9 \<sigma> = R9\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) = (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word)::64 word) + (((\<langle>63,0\<rangle>((RAX \<sigma>::64 word) * 0x8)::64 word)::64 word) + 0x50)),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word)::64 word) + (((\<langle>63,0\<rangle>((RAX \<sigma>::64 word) * 0x8)::64 word)::64 word) + 0x50)),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBX\<^sub>0\<close>
declare Q_0x12b77_1_def[Qs]

schematic_goal l2_load_isra_5_0_2_0x12b70_0x12b72_1[blocks]:
  assumes \<open>(P_0x12b70_1 && P_0x12b70_1_regions) \<sigma>\<close>
  shows \<open>exec_block 2 0x12b72 (Suc 0) \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x12b77_1 ?\<sigma> \<and> block_usage P_0x12b70_1_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x12b70_1_def P_0x12b70_1_regions_def post: Q_0x12b77_1_def regionset: P_0x12b70_1_regions_set_def)

definition P_0x12b77_true_2 :: state_pred where
  \<open>P_0x12b77_true_2 \<sigma> \<equiv> RIP \<sigma> = 0x12b77 \<and> RBX \<sigma> = (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = ucast ((\<langle>31,0\<rangle>RAX \<sigma>::32 word)) \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x28) \<and> RBP \<sigma> = RBP\<^sub>0 \<and> R13 \<sigma> = R13\<^sub>0 \<and> R12 \<sigma> = R12\<^sub>0 \<and> R9 \<sigma> = R9\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) = (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word)::64 word) + (((\<langle>63,0\<rangle>((RAX \<sigma>::64 word) * 0x8)::64 word)::64 word) + 0x50)),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word)::64 word) + (((\<langle>63,0\<rangle>((RAX \<sigma>::64 word) * 0x8)::64 word)::64 word) + 0x50)),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBX\<^sub>0\<close>
declare P_0x12b77_true_2_def[Ps]

definition P_0x12b77_true_2_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x12b77_true_2_regions_set \<sigma> \<equiv> {
    (0, RDI\<^sub>0, 8),
    (1, RSP\<^sub>0, 8),
    (2, (((\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word)::64 word) + (((\<langle>63,0\<rangle>((RAX \<sigma>::64 word) * 0x8)::64 word)::64 word) + 0x50)), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x20), 8)
  }\<close>

definition P_0x12b77_true_2_regions :: state_pred where
  \<open>P_0x12b77_true_2_regions \<sigma> \<equiv> \<exists>regions. P_0x12b77_true_2_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x12c10_2 :: state_pred where
  \<open>Q_0x12c10_2 \<sigma> \<equiv> RIP \<sigma> = 0x12c10 \<and> RBX \<sigma> = (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x28) \<and> RBP \<sigma> = RBP\<^sub>0 \<and> R13 \<sigma> = R13\<^sub>0 \<and> R12 \<sigma> = R12\<^sub>0 \<and> R9 \<sigma> = R9\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) = (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBX\<^sub>0\<close>
declare Q_0x12c10_2_def[Qs]

schematic_goal l2_load_isra_5_0_1_0x12b77_0x12b77_2[blocks]:
  assumes \<open>(P_0x12b77_true_2 && P_0x12b77_true_2_regions && ZF) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x12b77 2 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x12c10_2 ?\<sigma> \<and> block_usage P_0x12b77_true_2_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x12b77_true_2_def P_0x12b77_true_2_regions_def post: Q_0x12c10_2_def regionset: P_0x12b77_true_2_regions_set_def)

definition P_0x12b77_false_3 :: state_pred where
  \<open>P_0x12b77_false_3 \<sigma> \<equiv> RIP \<sigma> = 0x12b77 \<and> RBX \<sigma> = (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = ucast ((\<langle>31,0\<rangle>RAX \<sigma>::32 word)) \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x28) \<and> RBP \<sigma> = RBP\<^sub>0 \<and> R13 \<sigma> = R13\<^sub>0 \<and> R12 \<sigma> = R12\<^sub>0 \<and> R9 \<sigma> = R9\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) = (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word)::64 word) + (((\<langle>63,0\<rangle>((RAX \<sigma>::64 word) * 0x8)::64 word)::64 word) + 0x50)),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word)::64 word) + (((\<langle>63,0\<rangle>((RAX \<sigma>::64 word) * 0x8)::64 word)::64 word) + 0x50)),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBX\<^sub>0\<close>
declare P_0x12b77_false_3_def[Ps]

definition P_0x12b77_false_3_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x12b77_false_3_regions_set \<sigma> \<equiv> {
    (0, RDI\<^sub>0, 8),
    (1, RSP\<^sub>0, 8),
    (2, (((\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word)::64 word) + (((\<langle>63,0\<rangle>((RAX \<sigma>::64 word) * 0x8)::64 word)::64 word) + 0x50)), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x20), 8)
  }\<close>

definition P_0x12b77_false_3_regions :: state_pred where
  \<open>P_0x12b77_false_3_regions \<sigma> \<equiv> \<exists>regions. P_0x12b77_false_3_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x12b85_3 :: state_pred where
  \<open>Q_0x12b85_3 \<sigma> \<equiv> RIP \<sigma> = 0x12b85 \<and> RBX \<sigma> = (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x28) \<and> RBP \<sigma> = RBP\<^sub>0 \<and> R13 \<sigma> = R13\<^sub>0 \<and> R12 \<sigma> = R12\<^sub>0 \<and> R9 \<sigma> = R9\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) = (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBX\<^sub>0\<close>
declare Q_0x12b85_3_def[Qs]

schematic_goal l2_load_isra_5_0_3_0x12b77_0x12b81_3[blocks]:
  assumes \<open>(P_0x12b77_false_3 && P_0x12b77_false_3_regions && ! ZF) \<sigma>\<close>
  shows \<open>exec_block 3 0x12b81 3 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x12b85_3 ?\<sigma> \<and> block_usage P_0x12b77_false_3_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x12b77_false_3_def P_0x12b77_false_3_regions_def post: Q_0x12b85_3_def regionset: P_0x12b77_false_3_regions_set_def)

definition P_0x12b85_true_4 :: state_pred where
  \<open>P_0x12b85_true_4 \<sigma> \<equiv> RIP \<sigma> = 0x12b85 \<and> RBX \<sigma> = (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x28) \<and> RBP \<sigma> = RBP\<^sub>0 \<and> R13 \<sigma> = R13\<^sub>0 \<and> R12 \<sigma> = R12\<^sub>0 \<and> R9 \<sigma> = R9\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) = (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBX\<^sub>0\<close>
declare P_0x12b85_true_4_def[Ps]

definition P_0x12b85_true_4_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x12b85_true_4_regions_set \<sigma> \<equiv> {
    (0, RDI\<^sub>0, 8),
    (1, RSP\<^sub>0, 8),
    (2, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x20), 8)
  }\<close>

definition P_0x12b85_true_4_regions :: state_pred where
  \<open>P_0x12b85_true_4_regions \<sigma> \<equiv> \<exists>regions. P_0x12b85_true_4_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x12b70_4 :: state_pred where
  \<open>Q_0x12b70_4 \<sigma> \<equiv> RIP \<sigma> = 0x12b70 \<and> RBX \<sigma> = (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x28) \<and> RBP \<sigma> = RBP\<^sub>0 \<and> R13 \<sigma> = R13\<^sub>0 \<and> R12 \<sigma> = R12\<^sub>0 \<and> R9 \<sigma> = R9\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) = (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBX\<^sub>0\<close>
declare Q_0x12b70_4_def[Qs]

schematic_goal l2_load_isra_5_0_1_0x12b85_0x12b85_4[blocks]:
  assumes \<open>(P_0x12b85_true_4 && P_0x12b85_true_4_regions && !ZF) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x12b85 4 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x12b70_4 ?\<sigma> \<and> block_usage P_0x12b85_true_4_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x12b85_true_4_def P_0x12b85_true_4_regions_def post: Q_0x12b70_4_def regionset: P_0x12b85_true_4_regions_set_def)

definition P_0x12b85_false_5 :: state_pred where
  \<open>P_0x12b85_false_5 \<sigma> \<equiv> RIP \<sigma> = 0x12b85 \<and> RBX \<sigma> = (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x28) \<and> RBP \<sigma> = RBP\<^sub>0 \<and> R13 \<sigma> = R13\<^sub>0 \<and> R12 \<sigma> = R12\<^sub>0 \<and> R9 \<sigma> = R9\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) = (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBX\<^sub>0\<close>
declare P_0x12b85_false_5_def[Ps]

definition P_0x12b85_false_5_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x12b85_false_5_regions_set \<sigma> \<equiv> {
    (0, RDI\<^sub>0, 8),
    (1, RSP\<^sub>0, 8),
    (2, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x20), 8)
  }\<close>

definition P_0x12b85_false_5_regions :: state_pred where
  \<open>P_0x12b85_false_5_regions \<sigma> \<equiv> \<exists>regions. P_0x12b85_false_5_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x12b87_5 :: state_pred where
  \<open>Q_0x12b87_5 \<sigma> \<equiv> RIP \<sigma> = 0x12b87 \<and> RBX \<sigma> = (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x28) \<and> RBP \<sigma> = RBP\<^sub>0 \<and> R13 \<sigma> = R13\<^sub>0 \<and> R12 \<sigma> = R12\<^sub>0 \<and> R9 \<sigma> = R9\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) = (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBX\<^sub>0\<close>
declare Q_0x12b87_5_def[Qs]

schematic_goal l2_load_isra_5_0_1_0x12b85_0x12b85_5[blocks]:
  assumes \<open>(P_0x12b85_false_5 && P_0x12b85_false_5_regions && ! !ZF) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x12b85 5 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x12b87_5 ?\<sigma> \<and> block_usage P_0x12b85_false_5_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x12b85_false_5_def P_0x12b85_false_5_regions_def post: Q_0x12b87_5_def regionset: P_0x12b85_false_5_regions_set_def)

definition P_0x12b87_6 :: state_pred where
  \<open>P_0x12b87_6 \<sigma> \<equiv> RIP \<sigma> = 0x12b87 \<and> RBX \<sigma> = (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x28) \<and> RBP \<sigma> = RBP\<^sub>0 \<and> R13 \<sigma> = R13\<^sub>0 \<and> R12 \<sigma> = R12\<^sub>0 \<and> R9 \<sigma> = R9\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) = (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBX\<^sub>0\<close>
declare P_0x12b87_6_def[Ps]

definition P_0x12b87_6_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x12b87_6_regions_set \<sigma> \<equiv> {
    (0, RDI\<^sub>0, 8),
    (1, RSP\<^sub>0, 8),
    (2, (((\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word)::64 word) + 0x14), 4),
    (3, (((\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word)::64 word) + 0x48), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x20), 8)
  }\<close>

definition P_0x12b87_6_regions :: state_pred where
  \<open>P_0x12b87_6_regions \<sigma> \<equiv> \<exists>regions. P_0x12b87_6_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x12b91_6 :: state_pred where
  \<open>Q_0x12b91_6 \<sigma> \<equiv> RIP \<sigma> = 0x12b91 \<and> RBX \<sigma> = (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) \<and> RCX \<sigma> = ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word)::64 word) + 0x14),4]::32 word)) \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x28) \<and> RBP \<sigma> = RBP\<^sub>0 \<and> R13 \<sigma> = R13\<^sub>0 \<and> R12 \<sigma> = R12\<^sub>0 \<and> R9 \<sigma> = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word)::64 word) + 0x48),8]::64 word) \<and> R8 \<sigma> = (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) \<and> (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) = (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word)::64 word) + 0x14),4]::32 word) = ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word)::64 word) + 0x14),4]::32 word)) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word)::64 word) + 0x48),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word)::64 word) + 0x48),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBX\<^sub>0\<close>
declare Q_0x12b91_6_def[Qs]

schematic_goal l2_load_isra_5_0_3_0x12b87_0x12b8e_6[blocks]:
  assumes \<open>(P_0x12b87_6 && P_0x12b87_6_regions) \<sigma>\<close>
  shows \<open>exec_block 3 0x12b8e 6 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x12b91_6 ?\<sigma> \<and> block_usage P_0x12b87_6_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x12b87_6_def P_0x12b87_6_regions_def post: Q_0x12b91_6_def regionset: P_0x12b87_6_regions_set_def)

definition P_0x12b91_7 :: state_pred where
  \<open>P_0x12b91_7 \<sigma> \<equiv> RIP \<sigma> = 0x12b91 \<and> RBX \<sigma> = (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) \<and> RCX \<sigma> = ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word)::64 word) + 0x14),4]::32 word)) \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x28) \<and> RBP \<sigma> = RBP\<^sub>0 \<and> R13 \<sigma> = R13\<^sub>0 \<and> R12 \<sigma> = R12\<^sub>0 \<and> R9 \<sigma> = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word)::64 word) + 0x48),8]::64 word) \<and> R8 \<sigma> = (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) \<and> (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) = (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word)::64 word) + 0x14),4]::32 word) = ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word)::64 word) + 0x14),4]::32 word)) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word)::64 word) + 0x48),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word)::64 word) + 0x48),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBX\<^sub>0\<close>
declare P_0x12b91_7_def[Ps]

definition P_0x12b91_7_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x12b91_7_regions_set \<sigma> \<equiv> {
    (0, RDI\<^sub>0, 8),
    (1, RSP\<^sub>0, 8),
    (2, (((\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word)::64 word) + 0x14), 4),
    (3, (((\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word)::64 word) + 0x48), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x20), 8)
  }\<close>

definition P_0x12b91_7_regions :: state_pred where
  \<open>P_0x12b91_7_regions \<sigma> \<equiv> \<exists>regions. P_0x12b91_7_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x12ba0_7 :: state_pred where
  \<open>Q_0x12ba0_7 \<sigma> \<equiv> RIP \<sigma> = 0x12ba0 \<and> RBX \<sigma> = (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) \<and> RCX \<sigma> = ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word)::64 word) + 0x14),4]::32 word)) \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x28) \<and> R13 \<sigma> = R13\<^sub>0 \<and> R12 \<sigma> = R12\<^sub>0 \<and> R9 \<sigma> = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word)::64 word) + 0x48),8]::64 word) \<and> R8 \<sigma> = (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) \<and> (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) = (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word)::64 word) + 0x14),4]::32 word) = ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word)::64 word) + 0x14),4]::32 word)) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word)::64 word) + 0x48),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word)::64 word) + 0x48),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBX\<^sub>0\<close>
declare Q_0x12ba0_7_def[Qs]

schematic_goal l2_load_isra_5_0_4_0x12b91_0x12b9a_7[blocks]:
  assumes \<open>(P_0x12b91_7 && P_0x12b91_7_regions) \<sigma>\<close>
  shows \<open>exec_block 4 0x12b9a 7 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x12ba0_7 ?\<sigma> \<and> block_usage P_0x12b91_7_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x12b91_7_def P_0x12b91_7_regions_def post: Q_0x12ba0_7_def regionset: P_0x12b91_7_regions_set_def)

definition P_0x12ba0_8 :: state_pred where
  \<open>P_0x12ba0_8 \<sigma> \<equiv> RIP \<sigma> = 0x12ba0 \<and> RBX \<sigma> = (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) \<and> RCX \<sigma> = ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word)::64 word) + 0x14),4]::32 word)) \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x28) \<and> R13 \<sigma> = R13\<^sub>0 \<and> R12 \<sigma> = R12\<^sub>0 \<and> R9 \<sigma> = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word)::64 word) + 0x48),8]::64 word) \<and> R8 \<sigma> = (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) \<and> (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) = (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word)::64 word) + 0x14),4]::32 word) = ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word)::64 word) + 0x14),4]::32 word)) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word)::64 word) + 0x48),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word)::64 word) + 0x48),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBX\<^sub>0\<close>
declare P_0x12ba0_8_def[Ps]

definition P_0x12ba0_8_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x12ba0_8_regions_set \<sigma> \<equiv> {
    (0, RDI\<^sub>0, 8),
    (1, RSP\<^sub>0, 8),
    (2, (((\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word)::64 word) + 0x14), 4),
    (3, (((\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word)::64 word) + 0x48), 8),
    (4, (((\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word)::64 word) + (((\<langle>63,0\<rangle>((RAX \<sigma>::64 word) * 0x4)::64 word)::64 word) + 0xd0)), 4),
    (5, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x20), 8)
  }\<close>

definition P_0x12ba0_8_regions :: state_pred where
  \<open>P_0x12ba0_8_regions \<sigma> \<equiv> \<exists>regions. P_0x12ba0_8_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x12baa_8 :: state_pred where
  \<open>Q_0x12baa_8 \<sigma> \<equiv> RIP \<sigma> = 0x12baa \<and> RBX \<sigma> = (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) \<and> RCX \<sigma> = ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word)::64 word) + 0x14),4]::32 word)) \<and> RDX \<sigma> = ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word)::64 word) + (((\<langle>63,0\<rangle>((RAX \<sigma>::64 word) * 0x4)::64 word)::64 word) + 0xd0)),4]::32 word)) \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x28) \<and> R13 \<sigma> = R13\<^sub>0 \<and> R12 \<sigma> = R12\<^sub>0 \<and> R9 \<sigma> = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word)::64 word) + 0x48),8]::64 word) \<and> R8 \<sigma> = (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) \<and> (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) = (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word)::64 word) + 0x14),4]::32 word) = ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word)::64 word) + 0x14),4]::32 word)) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word)::64 word) + 0x48),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word)::64 word) + 0x48),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word)::64 word) + (((\<langle>63,0\<rangle>((RAX \<sigma>::64 word) * 0x4)::64 word)::64 word) + 0xd0)),4]::32 word) = ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word)::64 word) + (((\<langle>63,0\<rangle>((RAX \<sigma>::64 word) * 0x4)::64 word)::64 word) + 0xd0)),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBX\<^sub>0\<close>
declare Q_0x12baa_8_def[Qs]

schematic_goal l2_load_isra_5_0_2_0x12ba0_0x12ba8_8[blocks]:
  assumes \<open>(P_0x12ba0_8 && P_0x12ba0_8_regions) \<sigma>\<close>
  shows \<open>exec_block 2 0x12ba8 8 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x12baa_8 ?\<sigma> \<and> block_usage P_0x12ba0_8_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x12ba0_8_def P_0x12ba0_8_regions_def post: Q_0x12baa_8_def regionset: P_0x12ba0_8_regions_set_def)

definition P_0x12baa_true_9 :: state_pred where
  \<open>P_0x12baa_true_9 \<sigma> \<equiv> RIP \<sigma> = 0x12baa \<and> RBX \<sigma> = (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) \<and> RCX \<sigma> = ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word)::64 word) + 0x14),4]::32 word)) \<and> RDX \<sigma> = ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word)::64 word) + (((\<langle>63,0\<rangle>((RAX \<sigma>::64 word) * 0x4)::64 word)::64 word) + 0xd0)),4]::32 word)) \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x28) \<and> R13 \<sigma> = R13\<^sub>0 \<and> R12 \<sigma> = R12\<^sub>0 \<and> R9 \<sigma> = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word)::64 word) + 0x48),8]::64 word) \<and> R8 \<sigma> = (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) \<and> (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) = (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word)::64 word) + 0x14),4]::32 word) = ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word)::64 word) + 0x14),4]::32 word)) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word)::64 word) + 0x48),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word)::64 word) + 0x48),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word)::64 word) + (((\<langle>63,0\<rangle>((RAX \<sigma>::64 word) * 0x4)::64 word)::64 word) + 0xd0)),4]::32 word) = ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word)::64 word) + (((\<langle>63,0\<rangle>((RAX \<sigma>::64 word) * 0x4)::64 word)::64 word) + 0xd0)),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBX\<^sub>0\<close>
declare P_0x12baa_true_9_def[Ps]

definition P_0x12baa_true_9_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x12baa_true_9_regions_set \<sigma> \<equiv> {
    (0, RDI\<^sub>0, 8),
    (1, RSP\<^sub>0, 8),
    (2, (((\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word)::64 word) + 0x14), 4),
    (3, (((\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word)::64 word) + 0x48), 8),
    (4, (((\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word)::64 word) + (((\<langle>63,0\<rangle>((RAX \<sigma>::64 word) * 0x4)::64 word)::64 word) + 0xd0)), 4),
    (5, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x20), 8)
  }\<close>

definition P_0x12baa_true_9_regions :: state_pred where
  \<open>P_0x12baa_true_9_regions \<sigma> \<equiv> \<exists>regions. P_0x12baa_true_9_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x12bb1_9 :: state_pred where
  \<open>Q_0x12bb1_9 \<sigma> \<equiv> RIP \<sigma> = 0x12bb1 \<and> RBX \<sigma> = (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) \<and> RCX \<sigma> = ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word)::64 word) + 0x14),4]::32 word)) \<and> RDX \<sigma> = ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word)::64 word) + (((\<langle>63,0\<rangle>((RAX \<sigma>::64 word) * 0x4)::64 word)::64 word) + 0xd0)),4]::32 word)) \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x28) \<and> R13 \<sigma> = R13\<^sub>0 \<and> R12 \<sigma> = R12\<^sub>0 \<and> R9 \<sigma> = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word)::64 word) + 0x48),8]::64 word) \<and> R8 \<sigma> = (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) \<and> (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) = (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word)::64 word) + 0x14),4]::32 word) = ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word)::64 word) + 0x14),4]::32 word)) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word)::64 word) + 0x48),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word)::64 word) + 0x48),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word)::64 word) + (((\<langle>63,0\<rangle>((RAX \<sigma>::64 word) * 0x4)::64 word)::64 word) + 0xd0)),4]::32 word) = ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word)::64 word) + (((\<langle>63,0\<rangle>((RAX \<sigma>::64 word) * 0x4)::64 word)::64 word) + 0xd0)),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBX\<^sub>0\<close>
declare Q_0x12bb1_9_def[Qs]

schematic_goal l2_load_isra_5_0_1_0x12baa_0x12baa_9[blocks]:
  assumes \<open>(P_0x12baa_true_9 && P_0x12baa_true_9_regions && !CF) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x12baa 9 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x12bb1_9 ?\<sigma> \<and> block_usage P_0x12baa_true_9_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x12baa_true_9_def P_0x12baa_true_9_regions_def post: Q_0x12bb1_9_def regionset: P_0x12baa_true_9_regions_set_def)

definition P_0x12baa_false_10 :: state_pred where
  \<open>P_0x12baa_false_10 \<sigma> \<equiv> RIP \<sigma> = 0x12baa \<and> RBX \<sigma> = (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) \<and> RCX \<sigma> = ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word)::64 word) + 0x14),4]::32 word)) \<and> RDX \<sigma> = ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word)::64 word) + (((\<langle>63,0\<rangle>((RAX \<sigma>::64 word) * 0x4)::64 word)::64 word) + 0xd0)),4]::32 word)) \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x28) \<and> R13 \<sigma> = R13\<^sub>0 \<and> R12 \<sigma> = R12\<^sub>0 \<and> R9 \<sigma> = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word)::64 word) + 0x48),8]::64 word) \<and> R8 \<sigma> = (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) \<and> (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) = (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word)::64 word) + 0x14),4]::32 word) = ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word)::64 word) + 0x14),4]::32 word)) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word)::64 word) + 0x48),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word)::64 word) + 0x48),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word)::64 word) + (((\<langle>63,0\<rangle>((RAX \<sigma>::64 word) * 0x4)::64 word)::64 word) + 0xd0)),4]::32 word) = ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word)::64 word) + (((\<langle>63,0\<rangle>((RAX \<sigma>::64 word) * 0x4)::64 word)::64 word) + 0xd0)),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBX\<^sub>0\<close>
declare P_0x12baa_false_10_def[Ps]

definition P_0x12baa_false_10_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x12baa_false_10_regions_set \<sigma> \<equiv> {
    (0, RDI\<^sub>0, 8),
    (1, RSP\<^sub>0, 8),
    (2, (((\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word)::64 word) + 0x14), 4),
    (3, (((\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word)::64 word) + 0x48), 8),
    (4, (((\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word)::64 word) + (((\<langle>63,0\<rangle>((RAX \<sigma>::64 word) * 0x4)::64 word)::64 word) + 0xd0)), 4),
    (5, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x20), 8)
  }\<close>

definition P_0x12baa_false_10_regions :: state_pred where
  \<open>P_0x12baa_false_10_regions \<sigma> \<equiv> \<exists>regions. P_0x12baa_false_10_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x12bb1_10 :: state_pred where
  \<open>Q_0x12bb1_10 \<sigma> \<equiv> RIP \<sigma> = 0x12bb1 \<and> RBX \<sigma> = (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) \<and> RCX \<sigma> = ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word)::64 word) + 0x14),4]::32 word)) \<and> RDX \<sigma> = ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word)::64 word) + (((\<langle>63,0\<rangle>((RAX \<sigma>::64 word) * 0x4)::64 word)::64 word) + 0xd0)),4]::32 word)) \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x28) \<and> R13 \<sigma> = R13\<^sub>0 \<and> R12 \<sigma> = R12\<^sub>0 \<and> R9 \<sigma> = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word)::64 word) + 0x48),8]::64 word) \<and> R8 \<sigma> = (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) \<and> (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) = (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word)::64 word) + 0x14),4]::32 word) = ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word)::64 word) + 0x14),4]::32 word)) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word)::64 word) + 0x48),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word)::64 word) + 0x48),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word)::64 word) + (((\<langle>63,0\<rangle>((RAX \<sigma>::64 word) * 0x4)::64 word)::64 word) + 0xd0)),4]::32 word) = ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word)::64 word) + (((\<langle>63,0\<rangle>((RAX \<sigma>::64 word) * 0x4)::64 word)::64 word) + 0xd0)),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBX\<^sub>0\<close>
declare Q_0x12bb1_10_def[Qs]

schematic_goal l2_load_isra_5_0_3_0x12baa_0x12baf_10[blocks]:
  assumes \<open>(P_0x12baa_false_10 && P_0x12baa_false_10_regions && ! !CF) \<sigma>\<close>
  shows \<open>exec_block 3 0x12baf 10 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x12bb1_10 ?\<sigma> \<and> block_usage P_0x12baa_false_10_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x12baa_false_10_def P_0x12baa_false_10_regions_def post: Q_0x12bb1_10_def regionset: P_0x12baa_false_10_regions_set_def)

definition P_0x12bb1_11 :: state_pred where
  \<open>P_0x12bb1_11 \<sigma> \<equiv> RIP \<sigma> = 0x12bb1 \<and> RBX \<sigma> = (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) \<and> RCX \<sigma> = ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word)::64 word) + 0x14),4]::32 word)) \<and> RDX \<sigma> = ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word)::64 word) + (((\<langle>63,0\<rangle>((RAX \<sigma>::64 word) * 0x4)::64 word)::64 word) + 0xd0)),4]::32 word)) \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x28) \<and> R13 \<sigma> = R13\<^sub>0 \<and> R12 \<sigma> = R12\<^sub>0 \<and> R9 \<sigma> = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word)::64 word) + 0x48),8]::64 word) \<and> R8 \<sigma> = (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) \<and> (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) = (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word)::64 word) + 0x14),4]::32 word) = ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word)::64 word) + 0x14),4]::32 word)) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word)::64 word) + 0x48),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word)::64 word) + 0x48),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word)::64 word) + (((\<langle>63,0\<rangle>((RAX \<sigma>::64 word) * 0x4)::64 word)::64 word) + 0xd0)),4]::32 word) = ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word)::64 word) + (((\<langle>63,0\<rangle>((RAX \<sigma>::64 word) * 0x4)::64 word)::64 word) + 0xd0)),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBX\<^sub>0\<close>
declare P_0x12bb1_11_def[Ps]

definition P_0x12bb1_11_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x12bb1_11_regions_set \<sigma> \<equiv> {
    (0, RDI\<^sub>0, 8),
    (1, RSP\<^sub>0, 8),
    (2, (((\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word)::64 word) + 0x14), 4),
    (3, (((\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word)::64 word) + 0x48), 8),
    (4, (((\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word)::64 word) + (((\<langle>63,0\<rangle>((RAX \<sigma>::64 word) * 0x4)::64 word)::64 word) + 0xd0)), 4),
    (5, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x20), 8)
  }\<close>

definition P_0x12bb1_11_regions :: state_pred where
  \<open>P_0x12bb1_11_regions \<sigma> \<equiv> \<exists>regions. P_0x12bb1_11_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x12bb9_11 :: state_pred where
  \<open>Q_0x12bb9_11 \<sigma> \<equiv> RIP \<sigma> = 0x12bb9 \<and> RBX \<sigma> = (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) \<and> RCX \<sigma> = ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word)::64 word) + 0x14),4]::32 word)) \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x28) \<and> R13 \<sigma> = R13\<^sub>0 \<and> R12 \<sigma> = R12\<^sub>0 \<and> R9 \<sigma> = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word)::64 word) + 0x48),8]::64 word) \<and> R8 \<sigma> = (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) \<and> (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) = (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word)::64 word) + 0x14),4]::32 word) = ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word)::64 word) + 0x14),4]::32 word)) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word)::64 word) + 0x48),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word)::64 word) + 0x48),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBX\<^sub>0\<close>
declare Q_0x12bb9_11_def[Qs]

schematic_goal l2_load_isra_5_0_2_0x12bb1_0x12bb5_11[blocks]:
  assumes \<open>(P_0x12bb1_11 && P_0x12bb1_11_regions) \<sigma>\<close>
  shows \<open>exec_block 2 0x12bb5 11 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x12bb9_11 ?\<sigma> \<and> block_usage P_0x12bb1_11_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x12bb1_11_def P_0x12bb1_11_regions_def post: Q_0x12bb9_11_def regionset: P_0x12bb1_11_regions_set_def)

definition P_0x12bb9_true_12 :: state_pred where
  \<open>P_0x12bb9_true_12 \<sigma> \<equiv> RIP \<sigma> = 0x12bb9 \<and> RBX \<sigma> = (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) \<and> RCX \<sigma> = ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word)::64 word) + 0x14),4]::32 word)) \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x28) \<and> R13 \<sigma> = R13\<^sub>0 \<and> R12 \<sigma> = R12\<^sub>0 \<and> R9 \<sigma> = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word)::64 word) + 0x48),8]::64 word) \<and> R8 \<sigma> = (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) \<and> (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) = (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word)::64 word) + 0x14),4]::32 word) = ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word)::64 word) + 0x14),4]::32 word)) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word)::64 word) + 0x48),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word)::64 word) + 0x48),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBX\<^sub>0\<close>
declare P_0x12bb9_true_12_def[Ps]

definition P_0x12bb9_true_12_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x12bb9_true_12_regions_set \<sigma> \<equiv> {
    (0, RDI\<^sub>0, 8),
    (1, RSP\<^sub>0, 8),
    (2, (((\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word)::64 word) + 0x14), 4),
    (3, (((\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word)::64 word) + 0x48), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x20), 8)
  }\<close>

definition P_0x12bb9_true_12_regions :: state_pred where
  \<open>P_0x12bb9_true_12_regions \<sigma> \<equiv> \<exists>regions. P_0x12bb9_true_12_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x12ba0_12 :: state_pred where
  \<open>Q_0x12ba0_12 \<sigma> \<equiv> RIP \<sigma> = 0x12ba0 \<and> RBX \<sigma> = (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) \<and> RCX \<sigma> = ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word)::64 word) + 0x14),4]::32 word)) \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x28) \<and> R13 \<sigma> = R13\<^sub>0 \<and> R12 \<sigma> = R12\<^sub>0 \<and> R9 \<sigma> = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word)::64 word) + 0x48),8]::64 word) \<and> R8 \<sigma> = (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) \<and> (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) = (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word)::64 word) + 0x14),4]::32 word) = ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word)::64 word) + 0x14),4]::32 word)) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word)::64 word) + 0x48),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word)::64 word) + 0x48),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBX\<^sub>0\<close>
declare Q_0x12ba0_12_def[Qs]

schematic_goal l2_load_isra_5_0_1_0x12bb9_0x12bb9_12[blocks]:
  assumes \<open>(P_0x12bb9_true_12 && P_0x12bb9_true_12_regions && !ZF) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x12bb9 12 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x12ba0_12 ?\<sigma> \<and> block_usage P_0x12bb9_true_12_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x12bb9_true_12_def P_0x12bb9_true_12_regions_def post: Q_0x12ba0_12_def regionset: P_0x12bb9_true_12_regions_set_def)

definition P_0x12bb9_false_13 :: state_pred where
  \<open>P_0x12bb9_false_13 \<sigma> \<equiv> RIP \<sigma> = 0x12bb9 \<and> RBX \<sigma> = (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) \<and> RCX \<sigma> = ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word)::64 word) + 0x14),4]::32 word)) \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x28) \<and> R13 \<sigma> = R13\<^sub>0 \<and> R12 \<sigma> = R12\<^sub>0 \<and> R9 \<sigma> = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word)::64 word) + 0x48),8]::64 word) \<and> R8 \<sigma> = (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) \<and> (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) = (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word)::64 word) + 0x14),4]::32 word) = ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word)::64 word) + 0x14),4]::32 word)) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word)::64 word) + 0x48),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word)::64 word) + 0x48),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBX\<^sub>0\<close>
declare P_0x12bb9_false_13_def[Ps]

definition P_0x12bb9_false_13_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x12bb9_false_13_regions_set \<sigma> \<equiv> {
    (0, RDI\<^sub>0, 8),
    (1, RSP\<^sub>0, 8),
    (2, (((\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word)::64 word) + 0x14), 4),
    (3, (((\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word)::64 word) + 0x48), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x20), 8)
  }\<close>

definition P_0x12bb9_false_13_regions :: state_pred where
  \<open>P_0x12bb9_false_13_regions \<sigma> \<equiv> \<exists>regions. P_0x12bb9_false_13_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x12bbb_13 :: state_pred where
  \<open>Q_0x12bbb_13 \<sigma> \<equiv> RIP \<sigma> = 0x12bbb \<and> RBX \<sigma> = (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) \<and> RCX \<sigma> = ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word)::64 word) + 0x14),4]::32 word)) \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x28) \<and> R13 \<sigma> = R13\<^sub>0 \<and> R12 \<sigma> = R12\<^sub>0 \<and> R9 \<sigma> = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word)::64 word) + 0x48),8]::64 word) \<and> R8 \<sigma> = (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) \<and> (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) = (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word)::64 word) + 0x14),4]::32 word) = ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word)::64 word) + 0x14),4]::32 word)) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word)::64 word) + 0x48),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word)::64 word) + 0x48),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBX\<^sub>0\<close>
declare Q_0x12bbb_13_def[Qs]

schematic_goal l2_load_isra_5_0_1_0x12bb9_0x12bb9_13[blocks]:
  assumes \<open>(P_0x12bb9_false_13 && P_0x12bb9_false_13_regions && ! !ZF) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x12bb9 13 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x12bbb_13 ?\<sigma> \<and> block_usage P_0x12bb9_false_13_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x12bb9_false_13_def P_0x12bb9_false_13_regions_def post: Q_0x12bbb_13_def regionset: P_0x12bb9_false_13_regions_set_def)

definition P_0x12bbb_14 :: state_pred where
  \<open>P_0x12bbb_14 \<sigma> \<equiv> RIP \<sigma> = 0x12bbb \<and> RBX \<sigma> = (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) \<and> RCX \<sigma> = ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word)::64 word) + 0x14),4]::32 word)) \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x28) \<and> R13 \<sigma> = R13\<^sub>0 \<and> R12 \<sigma> = R12\<^sub>0 \<and> R9 \<sigma> = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word)::64 word) + 0x48),8]::64 word) \<and> R8 \<sigma> = (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) \<and> (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) = (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word)::64 word) + 0x14),4]::32 word) = ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word)::64 word) + 0x14),4]::32 word)) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word)::64 word) + 0x48),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word)::64 word) + 0x48),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBX\<^sub>0\<close>
declare P_0x12bbb_14_def[Ps]

definition P_0x12bbb_14_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x12bbb_14_regions_set \<sigma> \<equiv> {
    (0, RDI\<^sub>0, 8),
    (1, RSP\<^sub>0, 8),
    (2, (((\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word)::64 word) + 0x14), 4),
    (3, (((\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word)::64 word) + 0x18), 4),
    (4, (((\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word)::64 word) + 0x48), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (9, (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word), 8)
  }\<close>

definition P_0x12bbb_14_regions :: state_pred where
  \<open>P_0x12bbb_14_regions \<sigma> \<equiv> \<exists>regions. P_0x12bbb_14_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x12bd8_14 :: state_pred where
  \<open>Q_0x12bd8_14 \<sigma> \<equiv> RIP \<sigma> = 0x12bd8 \<and> RAX \<sigma> = ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word)::64 word) + 0x18),4]::32 word)) \<and> RBX \<sigma> = (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) \<and> RCX \<sigma> = ucast ((\<langle>31,0\<rangle>(((\<langle>63,0\<rangle>(\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word)::64 word) + 0x18),4]::32 word)::64 word)::64 word) * 0x8)::32 word)) \<and> RDX \<sigma> = (((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word)::64 word) + 0x48),8]::64 word)::64 word) + (\<langle>63,0\<rangle>(((\<langle>63,0\<rangle>(sextend (ucast (((ucast (((\<langle>31,0\<rangle>RBP \<sigma>::32 word)::32 word))::32 word) << unat (((\<langle>7,0\<rangle>(\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word)::64 word) + 0x14),4]::32 word)::8 word)::8 word))))) 32 64::64 word)::64 word)::64 word) * 0x8)::64 word)) \<and> RDI \<sigma> = (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word),8]::64 word) \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x28) \<and> R13 \<sigma> = RSI\<^sub>0 \<and> R12 \<sigma> = (((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word)::64 word) + 0x48),8]::64 word)::64 word) + (\<langle>63,0\<rangle>(((\<langle>63,0\<rangle>(sextend (ucast (((ucast (((\<langle>31,0\<rangle>RBP \<sigma>::32 word)::32 word))::32 word) << unat (((\<langle>7,0\<rangle>(\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word)::64 word) + 0x14),4]::32 word)::8 word)::8 word))))) 32 64::64 word)::64 word)::64 word) * 0x8)::64 word)) \<and> R9 \<sigma> = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word)::64 word) + 0x48),8]::64 word) \<and> R8 \<sigma> = (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) \<and> (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) = (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word)::64 word) + 0x14),4]::32 word) = ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word)::64 word) + 0x14),4]::32 word)) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word)::64 word) + 0x18),4]::32 word) = ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word)::64 word) + 0x18),4]::32 word)) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word)::64 word) + 0x48),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word)::64 word) + 0x48),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word),8]::64 word) = (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word),8]::64 word)\<close>
declare Q_0x12bd8_14_def[Qs]

schematic_goal l2_load_isra_5_0_9_0x12bbb_0x12bd1_14[blocks]:
  assumes \<open>(P_0x12bbb_14 && P_0x12bbb_14_regions) \<sigma>\<close>
  shows \<open>exec_block 9 0x12bd1 14 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x12bd8_14 ?\<sigma> \<and> block_usage P_0x12bbb_14_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x12bbb_14_def P_0x12bbb_14_regions_def post: Q_0x12bd8_14_def regionset: P_0x12bbb_14_regions_set_def)

definition P_0x12bd8_15 :: state_pred where
  \<open>P_0x12bd8_15 \<sigma> \<equiv> RIP \<sigma> = 0x12bd8 \<and> RAX \<sigma> = ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word)::64 word) + 0x18),4]::32 word)) \<and> RBX \<sigma> = (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) \<and> RCX \<sigma> = ucast ((\<langle>31,0\<rangle>(((\<langle>63,0\<rangle>(\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word)::64 word) + 0x18),4]::32 word)::64 word)::64 word) * 0x8)::32 word)) \<and> RDX \<sigma> = (((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word)::64 word) + 0x48),8]::64 word)::64 word) + (\<langle>63,0\<rangle>(((\<langle>63,0\<rangle>(sextend (ucast (((ucast (((\<langle>31,0\<rangle>RBP \<sigma>::32 word)::32 word))::32 word) << unat (((\<langle>7,0\<rangle>(\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word)::64 word) + 0x14),4]::32 word)::8 word)::8 word))))) 32 64::64 word)::64 word)::64 word) * 0x8)::64 word)) \<and> RDI \<sigma> = (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word),8]::64 word) \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x28) \<and> R13 \<sigma> = RSI\<^sub>0 \<and> R12 \<sigma> = (((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word)::64 word) + 0x48),8]::64 word)::64 word) + (\<langle>63,0\<rangle>(((\<langle>63,0\<rangle>(sextend (ucast (((ucast (((\<langle>31,0\<rangle>RBP \<sigma>::32 word)::32 word))::32 word) << unat (((\<langle>7,0\<rangle>(\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word)::64 word) + 0x14),4]::32 word)::8 word)::8 word))))) 32 64::64 word)::64 word)::64 word) * 0x8)::64 word)) \<and> R9 \<sigma> = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word)::64 word) + 0x48),8]::64 word) \<and> R8 \<sigma> = (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) \<and> (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) = (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word)::64 word) + 0x14),4]::32 word) = ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word)::64 word) + 0x14),4]::32 word)) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word)::64 word) + 0x18),4]::32 word) = ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word)::64 word) + 0x18),4]::32 word)) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word)::64 word) + 0x48),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word)::64 word) + 0x48),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word),8]::64 word) = (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word),8]::64 word)\<close>
declare P_0x12bd8_15_def[Ps]

definition P_0x12bd8_15_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x12bd8_15_regions_set \<sigma> \<equiv> {
    (0, RDI\<^sub>0, 8),
    (1, RSP\<^sub>0, 8),
    (2, (((\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word)::64 word) + 0x14), 4),
    (3, (((\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word)::64 word) + 0x18), 4),
    (4, (((\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word)::64 word) + 0x48), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (10, (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word), 8)
  }\<close>

definition P_0x12bd8_15_regions :: state_pred where
  \<open>P_0x12bd8_15_regions \<sigma> \<equiv> \<exists>regions. P_0x12bd8_15_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_bdrv_pread_addr_0x12bd8_15 :: state_pred where
  \<open>Q_bdrv_pread_addr_0x12bd8_15 \<sigma> \<equiv> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x30) \<and> RIP \<sigma> = bdrv_pread_addr \<and> RAX \<sigma> = ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word)::64 word) + 0x18),4]::32 word)) \<and> RBX \<sigma> = (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) \<and> RCX \<sigma> = ucast ((\<langle>31,0\<rangle>(((\<langle>63,0\<rangle>(\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word)::64 word) + 0x18),4]::32 word)::64 word)::64 word) * 0x8)::32 word)) \<and> RDX \<sigma> = (((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word)::64 word) + 0x48),8]::64 word)::64 word) + (\<langle>63,0\<rangle>(((\<langle>63,0\<rangle>(sextend (ucast (((ucast (((\<langle>31,0\<rangle>RBP \<sigma>::32 word)::32 word))::32 word) << unat (((\<langle>7,0\<rangle>(\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word)::64 word) + 0x14),4]::32 word)::8 word)::8 word))))) 32 64::64 word)::64 word)::64 word) * 0x8)::64 word)) \<and> RDI \<sigma> = (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word),8]::64 word) \<and> RSI \<sigma> = RSI\<^sub>0 \<and> R13 \<sigma> = RSI\<^sub>0 \<and> R12 \<sigma> = (((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word)::64 word) + 0x48),8]::64 word)::64 word) + (\<langle>63,0\<rangle>(((\<langle>63,0\<rangle>(sextend (ucast (((ucast (((\<langle>31,0\<rangle>RBP \<sigma>::32 word)::32 word))::32 word) << unat (((\<langle>7,0\<rangle>(\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word)::64 word) + 0x14),4]::32 word)::8 word)::8 word))))) 32 64::64 word)::64 word)::64 word) * 0x8)::64 word)) \<and> R9 \<sigma> = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word)::64 word) + 0x48),8]::64 word) \<and> R8 \<sigma> = (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) \<and> (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) = (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word)::64 word) + 0x14),4]::32 word) = ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word)::64 word) + 0x14),4]::32 word)) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word)::64 word) + 0x18),4]::32 word) = ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word)::64 word) + 0x18),4]::32 word)) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word)::64 word) + 0x48),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word)::64 word) + 0x48),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = 0x12bdd \<and> (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word),8]::64 word) = (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word),8]::64 word)\<close>
declare Q_bdrv_pread_addr_0x12bd8_15_def[Qs]

schematic_goal l2_load_isra_5_0_1_0x12bd8_0x12bd8_15[blocks]:
  assumes \<open>(P_0x12bd8_15 && P_0x12bd8_15_regions) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x12bd8 15 \<sigma> \<triangleq> ?\<sigma> \<and> Q_bdrv_pread_addr_0x12bd8_15 ?\<sigma> \<and> block_usage P_0x12bd8_15_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x12bd8_15_def P_0x12bd8_15_regions_def post: Q_bdrv_pread_addr_0x12bd8_15_def regionset: P_0x12bd8_15_regions_set_def)

definition P_0x12bdd_16 :: state_pred where
  \<open>P_0x12bdd_16 \<sigma> \<equiv> RIP \<sigma> = 0x12bdd \<and> RAX \<sigma> = bdrv_pread_0x12bd8_retval \<and> RBX \<sigma> = (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) \<and> RCX \<sigma> = ucast ((\<langle>31,0\<rangle>(((\<langle>63,0\<rangle>(\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word)::64 word) + 0x18),4]::32 word)::64 word)::64 word) * 0x8)::32 word)) \<and> RDX \<sigma> = (((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word)::64 word) + 0x48),8]::64 word)::64 word) + (\<langle>63,0\<rangle>(((\<langle>63,0\<rangle>(sextend (ucast (((ucast (((\<langle>31,0\<rangle>RBP \<sigma>::32 word)::32 word))::32 word) << unat (((\<langle>7,0\<rangle>(\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word)::64 word) + 0x14),4]::32 word)::8 word)::8 word))))) 32 64::64 word)::64 word)::64 word) * 0x8)::64 word)) \<and> RDI \<sigma> = (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word),8]::64 word) \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x28) \<and> R13 \<sigma> = RSI\<^sub>0 \<and> R12 \<sigma> = (((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word)::64 word) + 0x48),8]::64 word)::64 word) + (\<langle>63,0\<rangle>(((\<langle>63,0\<rangle>(sextend (ucast (((ucast (((\<langle>31,0\<rangle>RBP \<sigma>::32 word)::32 word))::32 word) << unat (((\<langle>7,0\<rangle>(\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word)::64 word) + 0x14),4]::32 word)::8 word)::8 word))))) 32 64::64 word)::64 word)::64 word) * 0x8)::64 word)) \<and> R9 \<sigma> = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word)::64 word) + 0x48),8]::64 word) \<and> R8 \<sigma> = (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) \<and> (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) = (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word)::64 word) + 0x14),4]::32 word) = ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word)::64 word) + 0x14),4]::32 word)) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word)::64 word) + 0x18),4]::32 word) = ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word)::64 word) + 0x18),4]::32 word)) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word)::64 word) + 0x48),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word)::64 word) + 0x48),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = 0x12bdd \<and> (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word),8]::64 word) = (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word),8]::64 word)\<close>
declare P_0x12bdd_16_def[Ps]

definition P_0x12bdd_16_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x12bdd_16_regions_set \<sigma> \<equiv> {
    (0, RDI\<^sub>0, 8),
    (1, RSP\<^sub>0, 8),
    (2, (((\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word)::64 word) + 0x14), 4),
    (3, (((\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word)::64 word) + 0x18), 4),
    (4, (((\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word)::64 word) + 0x48), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (10, (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word), 8)
  }\<close>

definition P_0x12bdd_16_regions :: state_pred where
  \<open>P_0x12bdd_16_regions \<sigma> \<equiv> \<exists>regions. P_0x12bdd_16_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x12bea_16 :: state_pred where
  \<open>Q_0x12bea_16 \<sigma> \<equiv> RIP \<sigma> = 0x12bea \<and> RAX \<sigma> = (sextend (ucast ((\<langle>31,0\<rangle>bdrv_pread_0x12bd8_retval::32 word))) 32 64::64 word) \<and> RBX \<sigma> = (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) \<and> RCX \<sigma> = ucast ((\<langle>31,0\<rangle>(((\<langle>63,0\<rangle>(\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word)::64 word) + 0x18),4]::32 word)::64 word)::64 word) * 0x8)::32 word)) \<and> RDX \<sigma> = ((ucast (((sextend (ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word)::64 word) + 0x18),4]::32 word))) 32 64::64 word)::64 word))::64 word) << 3) \<and> RDI \<sigma> = (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word),8]::64 word) \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x28) \<and> R13 \<sigma> = RSI\<^sub>0 \<and> R12 \<sigma> = (((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word)::64 word) + 0x48),8]::64 word)::64 word) + (\<langle>63,0\<rangle>(((\<langle>63,0\<rangle>(sextend (ucast (((ucast (((\<langle>31,0\<rangle>RBP \<sigma>::32 word)::32 word))::32 word) << unat (((\<langle>7,0\<rangle>(\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word)::64 word) + 0x14),4]::32 word)::8 word)::8 word))))) 32 64::64 word)::64 word)::64 word) * 0x8)::64 word)) \<and> R9 \<sigma> = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word)::64 word) + 0x48),8]::64 word) \<and> R8 \<sigma> = (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) \<and> (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) = (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word)::64 word) + 0x14),4]::32 word) = ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word)::64 word) + 0x14),4]::32 word)) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word)::64 word) + 0x18),4]::32 word) = ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word)::64 word) + 0x18),4]::32 word)) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word)::64 word) + 0x48),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word)::64 word) + 0x48),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = 0x12bdd \<and> (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word),8]::64 word) = (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word),8]::64 word)\<close>
declare Q_0x12bea_16_def[Qs]

schematic_goal l2_load_isra_5_0_4_0x12bdd_0x12be7_16[blocks]:
  assumes \<open>(P_0x12bdd_16 && P_0x12bdd_16_regions) \<sigma>\<close>
  shows \<open>exec_block 4 0x12be7 16 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x12bea_16 ?\<sigma> \<and> block_usage P_0x12bdd_16_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x12bdd_16_def P_0x12bdd_16_regions_def post: Q_0x12bea_16_def regionset: P_0x12bdd_16_regions_set_def)

definition P_0x12bea_true_17 :: state_pred where
  \<open>P_0x12bea_true_17 \<sigma> \<equiv> RIP \<sigma> = 0x12bea \<and> RAX \<sigma> = (sextend (ucast ((\<langle>31,0\<rangle>bdrv_pread_0x12bd8_retval::32 word))) 32 64::64 word) \<and> RBX \<sigma> = (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) \<and> RCX \<sigma> = ucast ((\<langle>31,0\<rangle>(((\<langle>63,0\<rangle>(\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word)::64 word) + 0x18),4]::32 word)::64 word)::64 word) * 0x8)::32 word)) \<and> RDX \<sigma> = ((ucast (((sextend (ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word)::64 word) + 0x18),4]::32 word))) 32 64::64 word)::64 word))::64 word) << 3) \<and> RDI \<sigma> = (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word),8]::64 word) \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x28) \<and> R13 \<sigma> = RSI\<^sub>0 \<and> R12 \<sigma> = (((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word)::64 word) + 0x48),8]::64 word)::64 word) + (\<langle>63,0\<rangle>(((\<langle>63,0\<rangle>(sextend (ucast (((ucast (((\<langle>31,0\<rangle>RBP \<sigma>::32 word)::32 word))::32 word) << unat (((\<langle>7,0\<rangle>(\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word)::64 word) + 0x14),4]::32 word)::8 word)::8 word))))) 32 64::64 word)::64 word)::64 word) * 0x8)::64 word)) \<and> R9 \<sigma> = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word)::64 word) + 0x48),8]::64 word) \<and> R8 \<sigma> = (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) \<and> (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) = (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word)::64 word) + 0x14),4]::32 word) = ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word)::64 word) + 0x14),4]::32 word)) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word)::64 word) + 0x18),4]::32 word) = ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word)::64 word) + 0x18),4]::32 word)) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word)::64 word) + 0x48),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word)::64 word) + 0x48),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = 0x12bdd \<and> (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word),8]::64 word) = (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word),8]::64 word)\<close>
declare P_0x12bea_true_17_def[Ps]

definition P_0x12bea_true_17_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x12bea_true_17_regions_set \<sigma> \<equiv> {
    (0, RDI\<^sub>0, 8),
    (1, RSP\<^sub>0, 8),
    (2, (((\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word)::64 word) + 0x14), 4),
    (3, (((\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word)::64 word) + 0x18), 4),
    (4, (((\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word)::64 word) + 0x48), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (10, (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word), 8)
  }\<close>

definition P_0x12bea_true_17_regions :: state_pred where
  \<open>P_0x12bea_true_17_regions \<sigma> \<equiv> \<exists>regions. P_0x12bea_true_17_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_ret_address_17 :: state_pred where
  \<open>Q_ret_address_17 \<sigma> \<equiv> RIP \<sigma> = ret_address \<and> RBX \<sigma> = RBX\<^sub>0 \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) + 0x8) \<and> RBP \<sigma> = RBP\<^sub>0 \<and> R13 \<sigma> = R13\<^sub>0 \<and> R12 \<sigma> = R12\<^sub>0 \<and> R9 \<sigma> = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word)::64 word) + 0x48),8]::64 word) \<and> (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) = (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word)::64 word) + 0x14),4]::32 word) = ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word)::64 word) + 0x14),4]::32 word)) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word)::64 word) + 0x48),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word)::64 word) + 0x48),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBX\<^sub>0\<close>
declare Q_ret_address_17_def[Qs]

schematic_goal l2_load_isra_5_0_9_0x12bea_0x12c80_17[blocks]:
  assumes \<open>(P_0x12bea_true_17 && P_0x12bea_true_17_regions && !ZF) \<sigma>\<close>
  shows \<open>exec_block 9 0x12c80 17 \<sigma> \<triangleq> ?\<sigma> \<and> Q_ret_address_17 ?\<sigma> \<and> block_usage P_0x12bea_true_17_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x12bea_true_17_def P_0x12bea_true_17_regions_def post: Q_ret_address_17_def regionset: P_0x12bea_true_17_regions_set_def)

definition P_0x12bea_false_18 :: state_pred where
  \<open>P_0x12bea_false_18 \<sigma> \<equiv> RIP \<sigma> = 0x12bea \<and> RAX \<sigma> = (sextend (ucast ((\<langle>31,0\<rangle>bdrv_pread_0x12bd8_retval::32 word))) 32 64::64 word) \<and> RBX \<sigma> = (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) \<and> RCX \<sigma> = ucast ((\<langle>31,0\<rangle>(((\<langle>63,0\<rangle>(\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word)::64 word) + 0x18),4]::32 word)::64 word)::64 word) * 0x8)::32 word)) \<and> RDX \<sigma> = ((ucast (((sextend (ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word)::64 word) + 0x18),4]::32 word))) 32 64::64 word)::64 word))::64 word) << 3) \<and> RDI \<sigma> = (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word),8]::64 word) \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x28) \<and> R13 \<sigma> = RSI\<^sub>0 \<and> R12 \<sigma> = (((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word)::64 word) + 0x48),8]::64 word)::64 word) + (\<langle>63,0\<rangle>(((\<langle>63,0\<rangle>(sextend (ucast (((ucast (((\<langle>31,0\<rangle>RBP \<sigma>::32 word)::32 word))::32 word) << unat (((\<langle>7,0\<rangle>(\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word)::64 word) + 0x14),4]::32 word)::8 word)::8 word))))) 32 64::64 word)::64 word)::64 word) * 0x8)::64 word)) \<and> R9 \<sigma> = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word)::64 word) + 0x48),8]::64 word) \<and> R8 \<sigma> = (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) \<and> (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) = (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word)::64 word) + 0x14),4]::32 word) = ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word)::64 word) + 0x14),4]::32 word)) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word)::64 word) + 0x18),4]::32 word) = ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word)::64 word) + 0x18),4]::32 word)) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word)::64 word) + 0x48),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word)::64 word) + 0x48),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = 0x12bdd \<and> (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word),8]::64 word) = (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word),8]::64 word)\<close>
declare P_0x12bea_false_18_def[Ps]

definition P_0x12bea_false_18_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x12bea_false_18_regions_set \<sigma> \<equiv> {
    (0, RDI\<^sub>0, 8),
    (1, RSP\<^sub>0, 8),
    (2, (((\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word)::64 word) + 0x14), 4),
    (3, (((\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word)::64 word) + 0x18), 4),
    (4, (((\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word)::64 word) + 0x48), 8),
    (5, (((\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word)::64 word) + (((\<langle>63,0\<rangle>((RBP \<sigma>::64 word) * 0x4)::64 word)::64 word) + 0xd0)), 4),
    (6, (((\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word)::64 word) + (((\<langle>63,0\<rangle>((RBP \<sigma>::64 word) * 0x8)::64 word)::64 word) + 0x50)), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (11, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (12, (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word), 8)
  }\<close>

definition P_0x12bea_false_18_regions :: state_pred where
  \<open>P_0x12bea_false_18_regions \<sigma> \<equiv> \<exists>regions. P_0x12bea_false_18_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x12c00_18 :: state_pred where
  \<open>Q_0x12c00_18 \<sigma> \<equiv> RIP \<sigma> = 0x12c00 \<and> RAX \<sigma> = (sextend (ucast ((\<langle>31,0\<rangle>bdrv_pread_0x12bd8_retval::32 word))) 32 64::64 word) \<and> RBX \<sigma> = (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) \<and> RCX \<sigma> = ucast ((\<langle>31,0\<rangle>(((\<langle>63,0\<rangle>(\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word)::64 word) + 0x18),4]::32 word)::64 word)::64 word) * 0x8)::32 word)) \<and> RDX \<sigma> = ((ucast (((sextend (ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word)::64 word) + 0x18),4]::32 word))) 32 64::64 word)::64 word))::64 word) << 3) \<and> RDI \<sigma> = (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word),8]::64 word) \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x28) \<and> R13 \<sigma> = RSI\<^sub>0 \<and> R12 \<sigma> = (((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word)::64 word) + 0x48),8]::64 word)::64 word) + (\<langle>63,0\<rangle>(((\<langle>63,0\<rangle>(sextend (ucast (((ucast (((\<langle>31,0\<rangle>RBP \<sigma>::32 word)::32 word))::32 word) << unat (((\<langle>7,0\<rangle>(\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word)::64 word) + 0x14),4]::32 word)::8 word)::8 word))))) 32 64::64 word)::64 word)::64 word) * 0x8)::64 word)) \<and> R9 \<sigma> = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word)::64 word) + 0x48),8]::64 word) \<and> R8 \<sigma> = (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) \<and> (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) = (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word)::64 word) + 0x14),4]::32 word) = ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word)::64 word) + 0x14),4]::32 word)) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word)::64 word) + 0x18),4]::32 word) = ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word)::64 word) + 0x18),4]::32 word)) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word)::64 word) + 0x48),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word)::64 word) + 0x48),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word)::64 word) + (((\<langle>63,0\<rangle>((RBP \<sigma>::64 word) * 0x4)::64 word)::64 word) + 0xd0)),4]::32 word) = 0x1 \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word)::64 word) + (((\<langle>63,0\<rangle>((RBP \<sigma>::64 word) * 0x8)::64 word)::64 word) + 0x50)),8]::64 word) = RSI\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = 0x12bdd \<and> (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word),8]::64 word) = (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word),8]::64 word)\<close>
declare Q_0x12c00_18_def[Qs]

schematic_goal l2_load_isra_5_0_3_0x12bea_0x12bf5_18[blocks]:
  assumes \<open>(P_0x12bea_false_18 && P_0x12bea_false_18_regions && ! !ZF) \<sigma>\<close>
  shows \<open>exec_block 3 0x12bf5 18 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x12c00_18 ?\<sigma> \<and> block_usage P_0x12bea_false_18_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x12bea_false_18_def P_0x12bea_false_18_regions_def post: Q_0x12c00_18_def regionset: P_0x12bea_false_18_regions_set_def)

definition P_0x12c00_19 :: state_pred where
  \<open>P_0x12c00_19 \<sigma> \<equiv> RIP \<sigma> = 0x12c00 \<and> RAX \<sigma> = (sextend (ucast ((\<langle>31,0\<rangle>bdrv_pread_0x12bd8_retval::32 word))) 32 64::64 word) \<and> RBX \<sigma> = (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) \<and> RCX \<sigma> = ucast ((\<langle>31,0\<rangle>(((\<langle>63,0\<rangle>(\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word)::64 word) + 0x18),4]::32 word)::64 word)::64 word) * 0x8)::32 word)) \<and> RDX \<sigma> = ((ucast (((sextend (ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word)::64 word) + 0x18),4]::32 word))) 32 64::64 word)::64 word))::64 word) << 3) \<and> RDI \<sigma> = (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word),8]::64 word) \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x28) \<and> R13 \<sigma> = RSI\<^sub>0 \<and> R12 \<sigma> = (((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word)::64 word) + 0x48),8]::64 word)::64 word) + (\<langle>63,0\<rangle>(((\<langle>63,0\<rangle>(sextend (ucast (((ucast (((\<langle>31,0\<rangle>RBP \<sigma>::32 word)::32 word))::32 word) << unat (((\<langle>7,0\<rangle>(\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word)::64 word) + 0x14),4]::32 word)::8 word)::8 word))))) 32 64::64 word)::64 word)::64 word) * 0x8)::64 word)) \<and> R9 \<sigma> = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word)::64 word) + 0x48),8]::64 word) \<and> R8 \<sigma> = (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) \<and> (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) = (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word)::64 word) + 0x14),4]::32 word) = ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word)::64 word) + 0x14),4]::32 word)) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word)::64 word) + 0x18),4]::32 word) = ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word)::64 word) + 0x18),4]::32 word)) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word)::64 word) + 0x48),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word)::64 word) + 0x48),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word)::64 word) + (((\<langle>63,0\<rangle>((RBP \<sigma>::64 word) * 0x4)::64 word)::64 word) + 0xd0)),4]::32 word) = 0x1 \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word)::64 word) + (((\<langle>63,0\<rangle>((RBP \<sigma>::64 word) * 0x8)::64 word)::64 word) + 0x50)),8]::64 word) = RSI\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = 0x12bdd \<and> (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word),8]::64 word) = (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word),8]::64 word)\<close>
declare P_0x12c00_19_def[Ps]

definition P_0x12c00_19_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x12c00_19_regions_set \<sigma> \<equiv> {
    (0, RDI\<^sub>0, 8),
    (1, RSP\<^sub>0, 8),
    (2, (((\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word)::64 word) + 0x14), 4),
    (3, (((\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word)::64 word) + 0x18), 4),
    (4, (((\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word)::64 word) + 0x48), 8),
    (5, (((\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word)::64 word) + (((\<langle>63,0\<rangle>((RBP \<sigma>::64 word) * 0x4)::64 word)::64 word) + 0xd0)), 4),
    (6, (((\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word)::64 word) + (((\<langle>63,0\<rangle>((RBP \<sigma>::64 word) * 0x8)::64 word)::64 word) + 0x50)), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (11, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (12, (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word), 8)
  }\<close>

definition P_0x12c00_19_regions :: state_pred where
  \<open>P_0x12c00_19_regions \<sigma> \<equiv> \<exists>regions. P_0x12c00_19_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_ret_address_19 :: state_pred where
  \<open>Q_ret_address_19 \<sigma> \<equiv> RIP \<sigma> = ret_address \<and> RBX \<sigma> = RBX\<^sub>0 \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) + 0x8) \<and> RBP \<sigma> = RBP\<^sub>0 \<and> R13 \<sigma> = R13\<^sub>0 \<and> R12 \<sigma> = R12\<^sub>0 \<and> R9 \<sigma> = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word)::64 word) + 0x48),8]::64 word) \<and> (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) = (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word)::64 word) + 0x14),4]::32 word) = ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word)::64 word) + 0x14),4]::32 word)) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word)::64 word) + 0x48),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word)::64 word) + 0x48),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBX\<^sub>0\<close>
declare Q_ret_address_19_def[Qs]

schematic_goal l2_load_isra_5_0_7_0x12c00_0x12c0d_19[blocks]:
  assumes \<open>(P_0x12c00_19 && P_0x12c00_19_regions) \<sigma>\<close>
  shows \<open>exec_block 7 0x12c0d 19 \<sigma> \<triangleq> ?\<sigma> \<and> Q_ret_address_19 ?\<sigma> \<and> block_usage P_0x12c00_19_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x12c00_19_def P_0x12c00_19_regions_def post: Q_ret_address_19_def regionset: P_0x12c00_19_regions_set_def)

definition P_0x12c10_20 :: state_pred where
  \<open>P_0x12c10_20 \<sigma> \<equiv> RIP \<sigma> = 0x12c10 \<and> RBX \<sigma> = (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x28) \<and> RBP \<sigma> = RBP\<^sub>0 \<and> R13 \<sigma> = R13\<^sub>0 \<and> R12 \<sigma> = R12\<^sub>0 \<and> R9 \<sigma> = R9\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) = (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBX\<^sub>0\<close>
declare P_0x12c10_20_def[Ps]

definition P_0x12c10_20_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x12c10_20_regions_set \<sigma> \<equiv> {
    (0, RDI\<^sub>0, 8),
    (1, RSP\<^sub>0, 8),
    (2, (((((\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word)::64 word) + (\<langle>63,0\<rangle>(((\<langle>63,0\<rangle>(sextend (ucast ((\<langle>31,0\<rangle>RAX \<sigma>::32 word))) 32 64::64 word)::64 word)::64 word) * 0x4)::64 word))::64 word) + 0xd0), 4),
    (3, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x20), 8)
  }\<close>

definition P_0x12c10_20_regions :: state_pred where
  \<open>P_0x12c10_20_regions \<sigma> \<equiv> \<exists>regions. P_0x12c10_20_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x12c28_20 :: state_pred where
  \<open>Q_0x12c28_20 \<sigma> \<equiv> RIP \<sigma> = 0x12c28 \<and> RBX \<sigma> = (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x28) \<and> RBP \<sigma> = RBP\<^sub>0 \<and> R13 \<sigma> = R13\<^sub>0 \<and> R12 \<sigma> = R12\<^sub>0 \<and> R9 \<sigma> = R9\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) = (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBX\<^sub>0\<close>
declare Q_0x12c28_20_def[Qs]

schematic_goal l2_load_isra_5_0_6_0x12c10_0x12c25_20[blocks]:
  assumes \<open>(P_0x12c10_20 && P_0x12c10_20_regions) \<sigma>\<close>
  shows \<open>exec_block 6 0x12c25 20 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x12c28_20 ?\<sigma> \<and> block_usage P_0x12c10_20_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x12c10_20_def P_0x12c10_20_regions_def post: Q_0x12c28_20_def regionset: P_0x12c10_20_regions_set_def)

definition P_0x12c28_true_21 :: state_pred where
  \<open>P_0x12c28_true_21 \<sigma> \<equiv> RIP \<sigma> = 0x12c28 \<and> RBX \<sigma> = (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x28) \<and> RBP \<sigma> = RBP\<^sub>0 \<and> R13 \<sigma> = R13\<^sub>0 \<and> R12 \<sigma> = R12\<^sub>0 \<and> R9 \<sigma> = R9\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) = (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBX\<^sub>0\<close>
declare P_0x12c28_true_21_def[Ps]

definition P_0x12c28_true_21_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x12c28_true_21_regions_set \<sigma> \<equiv> {
    (0, RDI\<^sub>0, 8),
    (1, RSP\<^sub>0, 8),
    (2, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x20), 8)
  }\<close>

definition P_0x12c28_true_21_regions :: state_pred where
  \<open>P_0x12c28_true_21_regions \<sigma> \<equiv> \<exists>regions. P_0x12c28_true_21_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x12c60_21 :: state_pred where
  \<open>Q_0x12c60_21 \<sigma> \<equiv> RIP \<sigma> = 0x12c60 \<and> RBX \<sigma> = (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) \<and> RCX \<sigma> = (((\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word)::64 word) + 0x110) \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x28) \<and> RBP \<sigma> = RBP\<^sub>0 \<and> R13 \<sigma> = R13\<^sub>0 \<and> R12 \<sigma> = R12\<^sub>0 \<and> R9 \<sigma> = R9\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) = (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBX\<^sub>0\<close>
declare Q_0x12c60_21_def[Qs]

schematic_goal l2_load_isra_5_0_4_0x12c28_0x12c5e_21[blocks]:
  assumes \<open>(P_0x12c28_true_21 && P_0x12c28_true_21_regions && ZF) \<sigma>\<close>
  shows \<open>exec_block 4 0x12c5e 21 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x12c60_21 ?\<sigma> \<and> block_usage P_0x12c28_true_21_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x12c28_true_21_def P_0x12c28_true_21_regions_def post: Q_0x12c60_21_def regionset: P_0x12c28_true_21_regions_set_def)

definition P_0x12c60_22 :: state_pred where
  \<open>P_0x12c60_22 \<sigma> \<equiv> RIP \<sigma> = 0x12c60 \<and> RBX \<sigma> = (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) \<and> RCX \<sigma> = (((\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word)::64 word) + 0x110) \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x28) \<and> RBP \<sigma> = RBP\<^sub>0 \<and> R13 \<sigma> = R13\<^sub>0 \<and> R12 \<sigma> = R12\<^sub>0 \<and> R9 \<sigma> = R9\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) = (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBX\<^sub>0\<close>
declare P_0x12c60_22_def[Ps]

definition P_0x12c60_22_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x12c60_22_regions_set \<sigma> \<equiv> {
    (0, RAX \<sigma>, 4),
    (1, RDI\<^sub>0, 8),
    (2, RSP\<^sub>0, 8),
    (3, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x20), 8)
  }\<close>

definition P_0x12c60_22_regions :: state_pred where
  \<open>P_0x12c60_22_regions \<sigma> \<equiv> \<exists>regions. P_0x12c60_22_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x12c69_22 :: state_pred where
  \<open>Q_0x12c69_22 \<sigma> \<equiv> RIP \<sigma> = 0x12c69 \<and> RBX \<sigma> = (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) \<and> RCX \<sigma> = (((\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word)::64 word) + 0x110) \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x28) \<and> RBP \<sigma> = RBP\<^sub>0 \<and> R13 \<sigma> = R13\<^sub>0 \<and> R12 \<sigma> = R12\<^sub>0 \<and> R9 \<sigma> = R9\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) = (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBX\<^sub>0\<close>
declare Q_0x12c69_22_def[Qs]

schematic_goal l2_load_isra_5_0_3_0x12c60_0x12c66_22[blocks]:
  assumes \<open>(P_0x12c60_22 && P_0x12c60_22_regions) \<sigma>\<close>
  shows \<open>exec_block 3 0x12c66 22 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x12c69_22 ?\<sigma> \<and> block_usage P_0x12c60_22_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x12c60_22_def P_0x12c60_22_regions_def post: Q_0x12c69_22_def regionset: P_0x12c60_22_regions_set_def)

definition P_0x12c69_true_23 :: state_pred where
  \<open>P_0x12c69_true_23 \<sigma> \<equiv> RIP \<sigma> = 0x12c69 \<and> RBX \<sigma> = (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) \<and> RCX \<sigma> = (((\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word)::64 word) + 0x110) \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x28) \<and> RBP \<sigma> = RBP\<^sub>0 \<and> R13 \<sigma> = R13\<^sub>0 \<and> R12 \<sigma> = R12\<^sub>0 \<and> R9 \<sigma> = R9\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) = (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBX\<^sub>0\<close>
declare P_0x12c69_true_23_def[Ps]

definition P_0x12c69_true_23_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x12c69_true_23_regions_set \<sigma> \<equiv> {
    (0, RDI\<^sub>0, 8),
    (1, RSP\<^sub>0, 8),
    (2, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x20), 8)
  }\<close>

definition P_0x12c69_true_23_regions :: state_pred where
  \<open>P_0x12c69_true_23_regions \<sigma> \<equiv> \<exists>regions. P_0x12c69_true_23_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x12c60_23 :: state_pred where
  \<open>Q_0x12c60_23 \<sigma> \<equiv> RIP \<sigma> = 0x12c60 \<and> RBX \<sigma> = (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) \<and> RCX \<sigma> = (((\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word)::64 word) + 0x110) \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x28) \<and> RBP \<sigma> = RBP\<^sub>0 \<and> R13 \<sigma> = R13\<^sub>0 \<and> R12 \<sigma> = R12\<^sub>0 \<and> R9 \<sigma> = R9\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) = (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBX\<^sub>0\<close>
declare Q_0x12c60_23_def[Qs]

schematic_goal l2_load_isra_5_0_1_0x12c69_0x12c69_23[blocks]:
  assumes \<open>(P_0x12c69_true_23 && P_0x12c69_true_23_regions && !ZF) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x12c69 23 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x12c60_23 ?\<sigma> \<and> block_usage P_0x12c69_true_23_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x12c69_true_23_def P_0x12c69_true_23_regions_def post: Q_0x12c60_23_def regionset: P_0x12c69_true_23_regions_set_def)

definition P_0x12c69_false_24 :: state_pred where
  \<open>P_0x12c69_false_24 \<sigma> \<equiv> RIP \<sigma> = 0x12c69 \<and> RBX \<sigma> = (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) \<and> RCX \<sigma> = (((\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word)::64 word) + 0x110) \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x28) \<and> RBP \<sigma> = RBP\<^sub>0 \<and> R13 \<sigma> = R13\<^sub>0 \<and> R12 \<sigma> = R12\<^sub>0 \<and> R9 \<sigma> = R9\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) = (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBX\<^sub>0\<close>
declare P_0x12c69_false_24_def[Ps]

definition P_0x12c69_false_24_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x12c69_false_24_regions_set \<sigma> \<equiv> {
    (0, RDI\<^sub>0, 8),
    (1, RSP\<^sub>0, 8),
    (2, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x20), 8)
  }\<close>

definition P_0x12c69_false_24_regions :: state_pred where
  \<open>P_0x12c69_false_24_regions \<sigma> \<equiv> \<exists>regions. P_0x12c69_false_24_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x12c6b_24 :: state_pred where
  \<open>Q_0x12c6b_24 \<sigma> \<equiv> RIP \<sigma> = 0x12c6b \<and> RBX \<sigma> = (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) \<and> RCX \<sigma> = (((\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word)::64 word) + 0x110) \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x28) \<and> RBP \<sigma> = RBP\<^sub>0 \<and> R13 \<sigma> = R13\<^sub>0 \<and> R12 \<sigma> = R12\<^sub>0 \<and> R9 \<sigma> = R9\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) = (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBX\<^sub>0\<close>
declare Q_0x12c6b_24_def[Qs]

schematic_goal l2_load_isra_5_0_1_0x12c69_0x12c69_24[blocks]:
  assumes \<open>(P_0x12c69_false_24 && P_0x12c69_false_24_regions && ! !ZF) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x12c69 24 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x12c6b_24 ?\<sigma> \<and> block_usage P_0x12c69_false_24_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x12c69_false_24_def P_0x12c69_false_24_regions_def post: Q_0x12c6b_24_def regionset: P_0x12c69_false_24_regions_set_def)

definition P_0x12c6b_25 :: state_pred where
  \<open>P_0x12c6b_25 \<sigma> \<equiv> RIP \<sigma> = 0x12c6b \<and> RBX \<sigma> = (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) \<and> RCX \<sigma> = (((\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word)::64 word) + 0x110) \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x28) \<and> RBP \<sigma> = RBP\<^sub>0 \<and> R13 \<sigma> = R13\<^sub>0 \<and> R12 \<sigma> = R12\<^sub>0 \<and> R9 \<sigma> = R9\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) = (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBX\<^sub>0\<close>
declare P_0x12c6b_25_def[Ps]

definition P_0x12c6b_25_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x12c6b_25_regions_set \<sigma> \<equiv> {
    (0, RDI\<^sub>0, 8),
    (1, RSP\<^sub>0, 8),
    (2, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x20), 8)
  }\<close>

definition P_0x12c6b_25_regions :: state_pred where
  \<open>P_0x12c6b_25_regions \<sigma> \<equiv> \<exists>regions. P_0x12c6b_25_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x12c2a_25 :: state_pred where
  \<open>Q_0x12c2a_25 \<sigma> \<equiv> RIP \<sigma> = 0x12c2a \<and> RBX \<sigma> = (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x28) \<and> RBP \<sigma> = RBP\<^sub>0 \<and> R13 \<sigma> = R13\<^sub>0 \<and> R12 \<sigma> = R12\<^sub>0 \<and> R9 \<sigma> = R9\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) = (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBX\<^sub>0\<close>
declare Q_0x12c2a_25_def[Qs]

schematic_goal l2_load_isra_5_0_1_0x12c6b_0x12c6b_25[blocks]:
  assumes \<open>(P_0x12c6b_25 && P_0x12c6b_25_regions) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x12c6b 25 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x12c2a_25 ?\<sigma> \<and> block_usage P_0x12c6b_25_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x12c6b_25_def P_0x12c6b_25_regions_def post: Q_0x12c2a_25_def regionset: P_0x12c6b_25_regions_set_def)

definition P_0x12c28_false_26 :: state_pred where
  \<open>P_0x12c28_false_26 \<sigma> \<equiv> RIP \<sigma> = 0x12c28 \<and> RBX \<sigma> = (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x28) \<and> RBP \<sigma> = RBP\<^sub>0 \<and> R13 \<sigma> = R13\<^sub>0 \<and> R12 \<sigma> = R12\<^sub>0 \<and> R9 \<sigma> = R9\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) = (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBX\<^sub>0\<close>
declare P_0x12c28_false_26_def[Ps]

definition P_0x12c28_false_26_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x12c28_false_26_regions_set \<sigma> \<equiv> {
    (0, RDI\<^sub>0, 8),
    (1, RSP\<^sub>0, 8),
    (2, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x20), 8)
  }\<close>

definition P_0x12c28_false_26_regions :: state_pred where
  \<open>P_0x12c28_false_26_regions \<sigma> \<equiv> \<exists>regions. P_0x12c28_false_26_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x12c2a_26 :: state_pred where
  \<open>Q_0x12c2a_26 \<sigma> \<equiv> RIP \<sigma> = 0x12c2a \<and> RBX \<sigma> = (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x28) \<and> RBP \<sigma> = RBP\<^sub>0 \<and> R13 \<sigma> = R13\<^sub>0 \<and> R12 \<sigma> = R12\<^sub>0 \<and> R9 \<sigma> = R9\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) = (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBX\<^sub>0\<close>
declare Q_0x12c2a_26_def[Qs]

schematic_goal l2_load_isra_5_0_1_0x12c28_0x12c28_26[blocks]:
  assumes \<open>(P_0x12c28_false_26 && P_0x12c28_false_26_regions && ! ZF) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x12c28 26 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x12c2a_26 ?\<sigma> \<and> block_usage P_0x12c28_false_26_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x12c28_false_26_def P_0x12c28_false_26_regions_def post: Q_0x12c2a_26_def regionset: P_0x12c28_false_26_regions_set_def)

definition P_0x12c2a_27 :: state_pred where
  \<open>P_0x12c2a_27 \<sigma> \<equiv> RIP \<sigma> = 0x12c2a \<and> RBX \<sigma> = (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x28) \<and> RBP \<sigma> = RBP\<^sub>0 \<and> R13 \<sigma> = R13\<^sub>0 \<and> R12 \<sigma> = R12\<^sub>0 \<and> R9 \<sigma> = R9\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) = (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBX\<^sub>0\<close>
declare P_0x12c2a_27_def[Ps]

definition P_0x12c2a_27_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x12c2a_27_regions_set \<sigma> \<equiv> {
    (0, RDI\<^sub>0, 8),
    (1, RSP\<^sub>0, 8),
    (2, (((\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word)::64 word) + 0x14), 4),
    (3, (((\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word)::64 word) + 0x48), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x20), 8)
  }\<close>

definition P_0x12c2a_27_regions :: state_pred where
  \<open>P_0x12c2a_27_regions \<sigma> \<equiv> \<exists>regions. P_0x12c2a_27_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x12c3d_27 :: state_pred where
  \<open>Q_0x12c3d_27 \<sigma> \<equiv> RIP \<sigma> = 0x12c3d \<and> RBX \<sigma> = (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) \<and> RCX \<sigma> = ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word)::64 word) + 0x14),4]::32 word)) \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x28) \<and> RBP \<sigma> = RBP\<^sub>0 \<and> R13 \<sigma> = R13\<^sub>0 \<and> R9 \<sigma> = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word)::64 word) + 0x48),8]::64 word) \<and> R8 \<sigma> = R8\<^sub>0 \<and> (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) = (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word)::64 word) + 0x14),4]::32 word) = ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word)::64 word) + 0x14),4]::32 word)) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word)::64 word) + 0x48),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word)::64 word) + 0x48),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBX\<^sub>0\<close>
declare Q_0x12c3d_27_def[Qs]

schematic_goal l2_load_isra_5_0_6_0x12c2a_0x12c3a_27[blocks]:
  assumes \<open>(P_0x12c2a_27 && P_0x12c2a_27_regions) \<sigma>\<close>
  shows \<open>exec_block 6 0x12c3a 27 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x12c3d_27 ?\<sigma> \<and> block_usage P_0x12c2a_27_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x12c2a_27_def P_0x12c2a_27_regions_def post: Q_0x12c3d_27_def regionset: P_0x12c2a_27_regions_set_def)

definition P_0x12c3d_true_28 :: state_pred where
  \<open>P_0x12c3d_true_28 \<sigma> \<equiv> RIP \<sigma> = 0x12c3d \<and> RBX \<sigma> = (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) \<and> RCX \<sigma> = ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word)::64 word) + 0x14),4]::32 word)) \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x28) \<and> RBP \<sigma> = RBP\<^sub>0 \<and> R13 \<sigma> = R13\<^sub>0 \<and> R9 \<sigma> = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word)::64 word) + 0x48),8]::64 word) \<and> R8 \<sigma> = R8\<^sub>0 \<and> (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) = (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word)::64 word) + 0x14),4]::32 word) = ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word)::64 word) + 0x14),4]::32 word)) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word)::64 word) + 0x48),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word)::64 word) + 0x48),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBX\<^sub>0\<close>
declare P_0x12c3d_true_28_def[Ps]

definition P_0x12c3d_true_28_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x12c3d_true_28_regions_set \<sigma> \<equiv> {
    (0, RDI\<^sub>0, 8),
    (1, RSP\<^sub>0, 8),
    (2, (((\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word)::64 word) + 0x14), 4),
    (3, (((\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word)::64 word) + 0x48), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x20), 8)
  }\<close>

definition P_0x12c3d_true_28_regions :: state_pred where
  \<open>P_0x12c3d_true_28_regions \<sigma> \<equiv> \<exists>regions. P_0x12c3d_true_28_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_ret_address_28 :: state_pred where
  \<open>Q_ret_address_28 \<sigma> \<equiv> RIP \<sigma> = ret_address \<and> RBX \<sigma> = RBX\<^sub>0 \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) + 0x8) \<and> RBP \<sigma> = RBP\<^sub>0 \<and> R13 \<sigma> = R13\<^sub>0 \<and> R12 \<sigma> = R12\<^sub>0 \<and> R9 \<sigma> = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word)::64 word) + 0x48),8]::64 word) \<and> (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) = (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word)::64 word) + 0x14),4]::32 word) = ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word)::64 word) + 0x14),4]::32 word)) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word)::64 word) + 0x48),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word)::64 word) + 0x48),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBX\<^sub>0\<close>
declare Q_ret_address_28_def[Qs]

schematic_goal l2_load_isra_5_0_8_0x12c3d_0x12c0d_28[blocks]:
  assumes \<open>(P_0x12c3d_true_28 && P_0x12c3d_true_28_regions && !ZF) \<sigma>\<close>
  shows \<open>exec_block 8 0x12c0d 28 \<sigma> \<triangleq> ?\<sigma> \<and> Q_ret_address_28 ?\<sigma> \<and> block_usage P_0x12c3d_true_28_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x12c3d_true_28_def P_0x12c3d_true_28_regions_def post: Q_ret_address_28_def regionset: P_0x12c3d_true_28_regions_set_def)

definition P_0x12c3d_false_29 :: state_pred where
  \<open>P_0x12c3d_false_29 \<sigma> \<equiv> RIP \<sigma> = 0x12c3d \<and> RBX \<sigma> = (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) \<and> RCX \<sigma> = ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word)::64 word) + 0x14),4]::32 word)) \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x28) \<and> RBP \<sigma> = RBP\<^sub>0 \<and> R13 \<sigma> = R13\<^sub>0 \<and> R9 \<sigma> = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word)::64 word) + 0x48),8]::64 word) \<and> R8 \<sigma> = R8\<^sub>0 \<and> (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) = (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word)::64 word) + 0x14),4]::32 word) = ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word)::64 word) + 0x14),4]::32 word)) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word)::64 word) + 0x48),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word)::64 word) + 0x48),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBX\<^sub>0\<close>
declare P_0x12c3d_false_29_def[Ps]

definition P_0x12c3d_false_29_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x12c3d_false_29_regions_set \<sigma> \<equiv> {
    (0, RDI\<^sub>0, 8),
    (1, RSP\<^sub>0, 8),
    (2, (((\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word)::64 word) + 0x14), 4),
    (3, (((\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word)::64 word) + 0x48), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x20), 8)
  }\<close>

definition P_0x12c3d_false_29_regions :: state_pred where
  \<open>P_0x12c3d_false_29_regions \<sigma> \<equiv> \<exists>regions. P_0x12c3d_false_29_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x12b91_29 :: state_pred where
  \<open>Q_0x12b91_29 \<sigma> \<equiv> RIP \<sigma> = 0x12b91 \<and> RBX \<sigma> = (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) \<and> RCX \<sigma> = ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word)::64 word) + 0x14),4]::32 word)) \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x28) \<and> RBP \<sigma> = RBP\<^sub>0 \<and> R13 \<sigma> = R13\<^sub>0 \<and> R9 \<sigma> = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word)::64 word) + 0x48),8]::64 word) \<and> R8 \<sigma> = (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) \<and> (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) = (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word)::64 word) + 0x14),4]::32 word) = ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word)::64 word) + 0x14),4]::32 word)) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word)::64 word) + 0x48),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word)::64 word) + 0x48),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBX\<^sub>0\<close>
declare Q_0x12b91_29_def[Qs]

schematic_goal l2_load_isra_5_0_3_0x12c3d_0x12c42_29[blocks]:
  assumes \<open>(P_0x12c3d_false_29 && P_0x12c3d_false_29_regions && ! !ZF) \<sigma>\<close>
  shows \<open>exec_block 3 0x12c42 29 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x12b91_29 ?\<sigma> \<and> block_usage P_0x12c3d_false_29_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x12c3d_false_29_def P_0x12c3d_false_29_regions_def post: Q_0x12b91_29_def regionset: P_0x12c3d_false_29_regions_set_def)

definition P_0x12b91_30 :: state_pred where
  \<open>P_0x12b91_30 \<sigma> \<equiv> RIP \<sigma> = 0x12b91 \<and> RBX \<sigma> = (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) \<and> RCX \<sigma> = ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word)::64 word) + 0x14),4]::32 word)) \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x28) \<and> RBP \<sigma> = RBP\<^sub>0 \<and> R13 \<sigma> = R13\<^sub>0 \<and> R9 \<sigma> = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word)::64 word) + 0x48),8]::64 word) \<and> R8 \<sigma> = (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) \<and> (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) = (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word)::64 word) + 0x14),4]::32 word) = ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word)::64 word) + 0x14),4]::32 word)) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word)::64 word) + 0x48),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word)::64 word) + 0x48),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBX\<^sub>0\<close>
declare P_0x12b91_30_def[Ps]

definition P_0x12b91_30_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x12b91_30_regions_set \<sigma> \<equiv> {
    (0, RDI\<^sub>0, 8),
    (1, RSP\<^sub>0, 8),
    (2, (((\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word)::64 word) + 0x14), 4),
    (3, (((\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word)::64 word) + 0x48), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x20), 8)
  }\<close>

definition P_0x12b91_30_regions :: state_pred where
  \<open>P_0x12b91_30_regions \<sigma> \<equiv> \<exists>regions. P_0x12b91_30_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x12ba0_30 :: state_pred where
  \<open>Q_0x12ba0_30 \<sigma> \<equiv> RIP \<sigma> = 0x12ba0 \<and> RBX \<sigma> = (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) \<and> RCX \<sigma> = ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word)::64 word) + 0x14),4]::32 word)) \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x28) \<and> R13 \<sigma> = R13\<^sub>0 \<and> R9 \<sigma> = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word)::64 word) + 0x48),8]::64 word) \<and> R8 \<sigma> = (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) \<and> (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) = (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word)::64 word) + 0x14),4]::32 word) = ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word)::64 word) + 0x14),4]::32 word)) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word)::64 word) + 0x48),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word)::64 word) + 0x48),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBX\<^sub>0\<close>
declare Q_0x12ba0_30_def[Qs]

schematic_goal l2_load_isra_5_0_4_0x12b91_0x12b9a_30[blocks]:
  assumes \<open>(P_0x12b91_30 && P_0x12b91_30_regions) \<sigma>\<close>
  shows \<open>exec_block 4 0x12b9a 30 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x12ba0_30 ?\<sigma> \<and> block_usage P_0x12b91_30_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x12b91_30_def P_0x12b91_30_regions_def post: Q_0x12ba0_30_def regionset: P_0x12b91_30_regions_set_def)

definition P_0x12ba0_31 :: state_pred where
  \<open>P_0x12ba0_31 \<sigma> \<equiv> RIP \<sigma> = 0x12ba0 \<and> RBX \<sigma> = (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) \<and> RCX \<sigma> = ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word)::64 word) + 0x14),4]::32 word)) \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x28) \<and> R13 \<sigma> = R13\<^sub>0 \<and> R9 \<sigma> = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word)::64 word) + 0x48),8]::64 word) \<and> R8 \<sigma> = (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) \<and> (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) = (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word)::64 word) + 0x14),4]::32 word) = ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word)::64 word) + 0x14),4]::32 word)) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word)::64 word) + 0x48),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word)::64 word) + 0x48),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBX\<^sub>0\<close>
declare P_0x12ba0_31_def[Ps]

definition P_0x12ba0_31_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x12ba0_31_regions_set \<sigma> \<equiv> {
    (0, RDI\<^sub>0, 8),
    (1, RSP\<^sub>0, 8),
    (2, (((\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word)::64 word) + 0x14), 4),
    (3, (((\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word)::64 word) + 0x48), 8),
    (4, (((\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word)::64 word) + (((\<langle>63,0\<rangle>((RAX \<sigma>::64 word) * 0x4)::64 word)::64 word) + 0xd0)), 4),
    (5, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x20), 8)
  }\<close>

definition P_0x12ba0_31_regions :: state_pred where
  \<open>P_0x12ba0_31_regions \<sigma> \<equiv> \<exists>regions. P_0x12ba0_31_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x12baa_31 :: state_pred where
  \<open>Q_0x12baa_31 \<sigma> \<equiv> RIP \<sigma> = 0x12baa \<and> RBX \<sigma> = (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) \<and> RCX \<sigma> = ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word)::64 word) + 0x14),4]::32 word)) \<and> RDX \<sigma> = ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word)::64 word) + (((\<langle>63,0\<rangle>((RAX \<sigma>::64 word) * 0x4)::64 word)::64 word) + 0xd0)),4]::32 word)) \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x28) \<and> R13 \<sigma> = R13\<^sub>0 \<and> R9 \<sigma> = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word)::64 word) + 0x48),8]::64 word) \<and> R8 \<sigma> = (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) \<and> (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) = (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word)::64 word) + 0x14),4]::32 word) = ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word)::64 word) + 0x14),4]::32 word)) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word)::64 word) + 0x48),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word)::64 word) + 0x48),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word)::64 word) + (((\<langle>63,0\<rangle>((RAX \<sigma>::64 word) * 0x4)::64 word)::64 word) + 0xd0)),4]::32 word) = ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word)::64 word) + (((\<langle>63,0\<rangle>((RAX \<sigma>::64 word) * 0x4)::64 word)::64 word) + 0xd0)),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBX\<^sub>0\<close>
declare Q_0x12baa_31_def[Qs]

schematic_goal l2_load_isra_5_0_2_0x12ba0_0x12ba8_31[blocks]:
  assumes \<open>(P_0x12ba0_31 && P_0x12ba0_31_regions) \<sigma>\<close>
  shows \<open>exec_block 2 0x12ba8 31 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x12baa_31 ?\<sigma> \<and> block_usage P_0x12ba0_31_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x12ba0_31_def P_0x12ba0_31_regions_def post: Q_0x12baa_31_def regionset: P_0x12ba0_31_regions_set_def)

definition P_0x12baa_true_32 :: state_pred where
  \<open>P_0x12baa_true_32 \<sigma> \<equiv> RIP \<sigma> = 0x12baa \<and> RBX \<sigma> = (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) \<and> RCX \<sigma> = ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word)::64 word) + 0x14),4]::32 word)) \<and> RDX \<sigma> = ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word)::64 word) + (((\<langle>63,0\<rangle>((RAX \<sigma>::64 word) * 0x4)::64 word)::64 word) + 0xd0)),4]::32 word)) \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x28) \<and> R13 \<sigma> = R13\<^sub>0 \<and> R9 \<sigma> = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word)::64 word) + 0x48),8]::64 word) \<and> R8 \<sigma> = (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) \<and> (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) = (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word)::64 word) + 0x14),4]::32 word) = ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word)::64 word) + 0x14),4]::32 word)) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word)::64 word) + 0x48),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word)::64 word) + 0x48),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word)::64 word) + (((\<langle>63,0\<rangle>((RAX \<sigma>::64 word) * 0x4)::64 word)::64 word) + 0xd0)),4]::32 word) = ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word)::64 word) + (((\<langle>63,0\<rangle>((RAX \<sigma>::64 word) * 0x4)::64 word)::64 word) + 0xd0)),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBX\<^sub>0\<close>
declare P_0x12baa_true_32_def[Ps]

definition P_0x12baa_true_32_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x12baa_true_32_regions_set \<sigma> \<equiv> {
    (0, RDI\<^sub>0, 8),
    (1, RSP\<^sub>0, 8),
    (2, (((\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word)::64 word) + 0x14), 4),
    (3, (((\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word)::64 word) + 0x48), 8),
    (4, (((\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word)::64 word) + (((\<langle>63,0\<rangle>((RAX \<sigma>::64 word) * 0x4)::64 word)::64 word) + 0xd0)), 4),
    (5, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x20), 8)
  }\<close>

definition P_0x12baa_true_32_regions :: state_pred where
  \<open>P_0x12baa_true_32_regions \<sigma> \<equiv> \<exists>regions. P_0x12baa_true_32_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x12bb1_32 :: state_pred where
  \<open>Q_0x12bb1_32 \<sigma> \<equiv> RIP \<sigma> = 0x12bb1 \<and> RBX \<sigma> = (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) \<and> RCX \<sigma> = ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word)::64 word) + 0x14),4]::32 word)) \<and> RDX \<sigma> = ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word)::64 word) + (((\<langle>63,0\<rangle>((RAX \<sigma>::64 word) * 0x4)::64 word)::64 word) + 0xd0)),4]::32 word)) \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x28) \<and> R13 \<sigma> = R13\<^sub>0 \<and> R9 \<sigma> = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word)::64 word) + 0x48),8]::64 word) \<and> R8 \<sigma> = (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) \<and> (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) = (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word)::64 word) + 0x14),4]::32 word) = ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word)::64 word) + 0x14),4]::32 word)) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word)::64 word) + 0x48),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word)::64 word) + 0x48),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word)::64 word) + (((\<langle>63,0\<rangle>((RAX \<sigma>::64 word) * 0x4)::64 word)::64 word) + 0xd0)),4]::32 word) = ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word)::64 word) + (((\<langle>63,0\<rangle>((RAX \<sigma>::64 word) * 0x4)::64 word)::64 word) + 0xd0)),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBX\<^sub>0\<close>
declare Q_0x12bb1_32_def[Qs]

schematic_goal l2_load_isra_5_0_1_0x12baa_0x12baa_32[blocks]:
  assumes \<open>(P_0x12baa_true_32 && P_0x12baa_true_32_regions && !CF) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x12baa 32 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x12bb1_32 ?\<sigma> \<and> block_usage P_0x12baa_true_32_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x12baa_true_32_def P_0x12baa_true_32_regions_def post: Q_0x12bb1_32_def regionset: P_0x12baa_true_32_regions_set_def)

definition P_0x12baa_false_33 :: state_pred where
  \<open>P_0x12baa_false_33 \<sigma> \<equiv> RIP \<sigma> = 0x12baa \<and> RBX \<sigma> = (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) \<and> RCX \<sigma> = ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word)::64 word) + 0x14),4]::32 word)) \<and> RDX \<sigma> = ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word)::64 word) + (((\<langle>63,0\<rangle>((RAX \<sigma>::64 word) * 0x4)::64 word)::64 word) + 0xd0)),4]::32 word)) \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x28) \<and> R13 \<sigma> = R13\<^sub>0 \<and> R9 \<sigma> = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word)::64 word) + 0x48),8]::64 word) \<and> R8 \<sigma> = (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) \<and> (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) = (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word)::64 word) + 0x14),4]::32 word) = ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word)::64 word) + 0x14),4]::32 word)) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word)::64 word) + 0x48),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word)::64 word) + 0x48),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word)::64 word) + (((\<langle>63,0\<rangle>((RAX \<sigma>::64 word) * 0x4)::64 word)::64 word) + 0xd0)),4]::32 word) = ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word)::64 word) + (((\<langle>63,0\<rangle>((RAX \<sigma>::64 word) * 0x4)::64 word)::64 word) + 0xd0)),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBX\<^sub>0\<close>
declare P_0x12baa_false_33_def[Ps]

definition P_0x12baa_false_33_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x12baa_false_33_regions_set \<sigma> \<equiv> {
    (0, RDI\<^sub>0, 8),
    (1, RSP\<^sub>0, 8),
    (2, (((\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word)::64 word) + 0x14), 4),
    (3, (((\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word)::64 word) + 0x48), 8),
    (4, (((\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word)::64 word) + (((\<langle>63,0\<rangle>((RAX \<sigma>::64 word) * 0x4)::64 word)::64 word) + 0xd0)), 4),
    (5, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x20), 8)
  }\<close>

definition P_0x12baa_false_33_regions :: state_pred where
  \<open>P_0x12baa_false_33_regions \<sigma> \<equiv> \<exists>regions. P_0x12baa_false_33_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x12bb1_33 :: state_pred where
  \<open>Q_0x12bb1_33 \<sigma> \<equiv> RIP \<sigma> = 0x12bb1 \<and> RBX \<sigma> = (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) \<and> RCX \<sigma> = ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word)::64 word) + 0x14),4]::32 word)) \<and> RDX \<sigma> = ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word)::64 word) + (((\<langle>63,0\<rangle>((RAX \<sigma>::64 word) * 0x4)::64 word)::64 word) + 0xd0)),4]::32 word)) \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x28) \<and> R13 \<sigma> = R13\<^sub>0 \<and> R9 \<sigma> = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word)::64 word) + 0x48),8]::64 word) \<and> R8 \<sigma> = (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) \<and> (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) = (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word)::64 word) + 0x14),4]::32 word) = ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word)::64 word) + 0x14),4]::32 word)) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word)::64 word) + 0x48),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word)::64 word) + 0x48),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word)::64 word) + (((\<langle>63,0\<rangle>((RAX \<sigma>::64 word) * 0x4)::64 word)::64 word) + 0xd0)),4]::32 word) = ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word)::64 word) + (((\<langle>63,0\<rangle>((RAX \<sigma>::64 word) * 0x4)::64 word)::64 word) + 0xd0)),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBX\<^sub>0\<close>
declare Q_0x12bb1_33_def[Qs]

schematic_goal l2_load_isra_5_0_3_0x12baa_0x12baf_33[blocks]:
  assumes \<open>(P_0x12baa_false_33 && P_0x12baa_false_33_regions && ! !CF) \<sigma>\<close>
  shows \<open>exec_block 3 0x12baf 33 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x12bb1_33 ?\<sigma> \<and> block_usage P_0x12baa_false_33_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x12baa_false_33_def P_0x12baa_false_33_regions_def post: Q_0x12bb1_33_def regionset: P_0x12baa_false_33_regions_set_def)

definition P_0x12bb1_34 :: state_pred where
  \<open>P_0x12bb1_34 \<sigma> \<equiv> RIP \<sigma> = 0x12bb1 \<and> RBX \<sigma> = (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) \<and> RCX \<sigma> = ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word)::64 word) + 0x14),4]::32 word)) \<and> RDX \<sigma> = ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word)::64 word) + (((\<langle>63,0\<rangle>((RAX \<sigma>::64 word) * 0x4)::64 word)::64 word) + 0xd0)),4]::32 word)) \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x28) \<and> R13 \<sigma> = R13\<^sub>0 \<and> R9 \<sigma> = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word)::64 word) + 0x48),8]::64 word) \<and> R8 \<sigma> = (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) \<and> (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) = (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word)::64 word) + 0x14),4]::32 word) = ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word)::64 word) + 0x14),4]::32 word)) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word)::64 word) + 0x48),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word)::64 word) + 0x48),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word)::64 word) + (((\<langle>63,0\<rangle>((RAX \<sigma>::64 word) * 0x4)::64 word)::64 word) + 0xd0)),4]::32 word) = ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word)::64 word) + (((\<langle>63,0\<rangle>((RAX \<sigma>::64 word) * 0x4)::64 word)::64 word) + 0xd0)),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBX\<^sub>0\<close>
declare P_0x12bb1_34_def[Ps]

definition P_0x12bb1_34_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x12bb1_34_regions_set \<sigma> \<equiv> {
    (0, RDI\<^sub>0, 8),
    (1, RSP\<^sub>0, 8),
    (2, (((\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word)::64 word) + 0x14), 4),
    (3, (((\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word)::64 word) + 0x48), 8),
    (4, (((\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word)::64 word) + (((\<langle>63,0\<rangle>((RAX \<sigma>::64 word) * 0x4)::64 word)::64 word) + 0xd0)), 4),
    (5, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x20), 8)
  }\<close>

definition P_0x12bb1_34_regions :: state_pred where
  \<open>P_0x12bb1_34_regions \<sigma> \<equiv> \<exists>regions. P_0x12bb1_34_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x12bb9_34 :: state_pred where
  \<open>Q_0x12bb9_34 \<sigma> \<equiv> RIP \<sigma> = 0x12bb9 \<and> RBX \<sigma> = (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) \<and> RCX \<sigma> = ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word)::64 word) + 0x14),4]::32 word)) \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x28) \<and> R13 \<sigma> = R13\<^sub>0 \<and> R9 \<sigma> = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word)::64 word) + 0x48),8]::64 word) \<and> R8 \<sigma> = (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) \<and> (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) = (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word)::64 word) + 0x14),4]::32 word) = ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word)::64 word) + 0x14),4]::32 word)) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word)::64 word) + 0x48),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word)::64 word) + 0x48),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBX\<^sub>0\<close>
declare Q_0x12bb9_34_def[Qs]

schematic_goal l2_load_isra_5_0_2_0x12bb1_0x12bb5_34[blocks]:
  assumes \<open>(P_0x12bb1_34 && P_0x12bb1_34_regions) \<sigma>\<close>
  shows \<open>exec_block 2 0x12bb5 34 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x12bb9_34 ?\<sigma> \<and> block_usage P_0x12bb1_34_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x12bb1_34_def P_0x12bb1_34_regions_def post: Q_0x12bb9_34_def regionset: P_0x12bb1_34_regions_set_def)

definition P_0x12bb9_true_35 :: state_pred where
  \<open>P_0x12bb9_true_35 \<sigma> \<equiv> RIP \<sigma> = 0x12bb9 \<and> RBX \<sigma> = (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) \<and> RCX \<sigma> = ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word)::64 word) + 0x14),4]::32 word)) \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x28) \<and> R13 \<sigma> = R13\<^sub>0 \<and> R9 \<sigma> = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word)::64 word) + 0x48),8]::64 word) \<and> R8 \<sigma> = (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) \<and> (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) = (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word)::64 word) + 0x14),4]::32 word) = ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word)::64 word) + 0x14),4]::32 word)) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word)::64 word) + 0x48),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word)::64 word) + 0x48),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBX\<^sub>0\<close>
declare P_0x12bb9_true_35_def[Ps]

definition P_0x12bb9_true_35_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x12bb9_true_35_regions_set \<sigma> \<equiv> {
    (0, RDI\<^sub>0, 8),
    (1, RSP\<^sub>0, 8),
    (2, (((\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word)::64 word) + 0x14), 4),
    (3, (((\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word)::64 word) + 0x48), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x20), 8)
  }\<close>

definition P_0x12bb9_true_35_regions :: state_pred where
  \<open>P_0x12bb9_true_35_regions \<sigma> \<equiv> \<exists>regions. P_0x12bb9_true_35_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x12ba0_35 :: state_pred where
  \<open>Q_0x12ba0_35 \<sigma> \<equiv> RIP \<sigma> = 0x12ba0 \<and> RBX \<sigma> = (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) \<and> RCX \<sigma> = ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word)::64 word) + 0x14),4]::32 word)) \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x28) \<and> R13 \<sigma> = R13\<^sub>0 \<and> R9 \<sigma> = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word)::64 word) + 0x48),8]::64 word) \<and> R8 \<sigma> = (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) \<and> (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) = (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word)::64 word) + 0x14),4]::32 word) = ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word)::64 word) + 0x14),4]::32 word)) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word)::64 word) + 0x48),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word)::64 word) + 0x48),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBX\<^sub>0\<close>
declare Q_0x12ba0_35_def[Qs]

schematic_goal l2_load_isra_5_0_1_0x12bb9_0x12bb9_35[blocks]:
  assumes \<open>(P_0x12bb9_true_35 && P_0x12bb9_true_35_regions && !ZF) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x12bb9 35 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x12ba0_35 ?\<sigma> \<and> block_usage P_0x12bb9_true_35_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x12bb9_true_35_def P_0x12bb9_true_35_regions_def post: Q_0x12ba0_35_def regionset: P_0x12bb9_true_35_regions_set_def)

definition P_0x12bb9_false_36 :: state_pred where
  \<open>P_0x12bb9_false_36 \<sigma> \<equiv> RIP \<sigma> = 0x12bb9 \<and> RBX \<sigma> = (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) \<and> RCX \<sigma> = ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word)::64 word) + 0x14),4]::32 word)) \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x28) \<and> R13 \<sigma> = R13\<^sub>0 \<and> R9 \<sigma> = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word)::64 word) + 0x48),8]::64 word) \<and> R8 \<sigma> = (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) \<and> (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) = (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word)::64 word) + 0x14),4]::32 word) = ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word)::64 word) + 0x14),4]::32 word)) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word)::64 word) + 0x48),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word)::64 word) + 0x48),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBX\<^sub>0\<close>
declare P_0x12bb9_false_36_def[Ps]

definition P_0x12bb9_false_36_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x12bb9_false_36_regions_set \<sigma> \<equiv> {
    (0, RDI\<^sub>0, 8),
    (1, RSP\<^sub>0, 8),
    (2, (((\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word)::64 word) + 0x14), 4),
    (3, (((\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word)::64 word) + 0x48), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x20), 8)
  }\<close>

definition P_0x12bb9_false_36_regions :: state_pred where
  \<open>P_0x12bb9_false_36_regions \<sigma> \<equiv> \<exists>regions. P_0x12bb9_false_36_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x12bbb_36 :: state_pred where
  \<open>Q_0x12bbb_36 \<sigma> \<equiv> RIP \<sigma> = 0x12bbb \<and> RBX \<sigma> = (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) \<and> RCX \<sigma> = ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word)::64 word) + 0x14),4]::32 word)) \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x28) \<and> R13 \<sigma> = R13\<^sub>0 \<and> R9 \<sigma> = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word)::64 word) + 0x48),8]::64 word) \<and> R8 \<sigma> = (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) \<and> (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) = (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word)::64 word) + 0x14),4]::32 word) = ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word)::64 word) + 0x14),4]::32 word)) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word)::64 word) + 0x48),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word)::64 word) + 0x48),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBX\<^sub>0\<close>
declare Q_0x12bbb_36_def[Qs]

schematic_goal l2_load_isra_5_0_1_0x12bb9_0x12bb9_36[blocks]:
  assumes \<open>(P_0x12bb9_false_36 && P_0x12bb9_false_36_regions && ! !ZF) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x12bb9 36 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x12bbb_36 ?\<sigma> \<and> block_usage P_0x12bb9_false_36_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x12bb9_false_36_def P_0x12bb9_false_36_regions_def post: Q_0x12bbb_36_def regionset: P_0x12bb9_false_36_regions_set_def)

definition P_0x12bbb_37 :: state_pred where
  \<open>P_0x12bbb_37 \<sigma> \<equiv> RIP \<sigma> = 0x12bbb \<and> RBX \<sigma> = (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) \<and> RCX \<sigma> = ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word)::64 word) + 0x14),4]::32 word)) \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x28) \<and> R13 \<sigma> = R13\<^sub>0 \<and> R9 \<sigma> = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word)::64 word) + 0x48),8]::64 word) \<and> R8 \<sigma> = (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) \<and> (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) = (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word)::64 word) + 0x14),4]::32 word) = ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word)::64 word) + 0x14),4]::32 word)) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word)::64 word) + 0x48),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word)::64 word) + 0x48),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBX\<^sub>0\<close>
declare P_0x12bbb_37_def[Ps]

definition P_0x12bbb_37_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x12bbb_37_regions_set \<sigma> \<equiv> {
    (0, RDI\<^sub>0, 8),
    (1, RSP\<^sub>0, 8),
    (2, (((\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word)::64 word) + 0x14), 4),
    (3, (((\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word)::64 word) + 0x18), 4),
    (4, (((\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word)::64 word) + 0x48), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (9, (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word), 8)
  }\<close>

definition P_0x12bbb_37_regions :: state_pred where
  \<open>P_0x12bbb_37_regions \<sigma> \<equiv> \<exists>regions. P_0x12bbb_37_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x12bd8_37 :: state_pred where
  \<open>Q_0x12bd8_37 \<sigma> \<equiv> RIP \<sigma> = 0x12bd8 \<and> RAX \<sigma> = ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word)::64 word) + 0x18),4]::32 word)) \<and> RBX \<sigma> = (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) \<and> RCX \<sigma> = ucast ((\<langle>31,0\<rangle>(((\<langle>63,0\<rangle>(\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word)::64 word) + 0x18),4]::32 word)::64 word)::64 word) * 0x8)::32 word)) \<and> RDX \<sigma> = (((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word)::64 word) + 0x48),8]::64 word)::64 word) + (\<langle>63,0\<rangle>(((\<langle>63,0\<rangle>(sextend (ucast (((ucast (((\<langle>31,0\<rangle>RBP \<sigma>::32 word)::32 word))::32 word) << unat (((\<langle>7,0\<rangle>(\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word)::64 word) + 0x14),4]::32 word)::8 word)::8 word))))) 32 64::64 word)::64 word)::64 word) * 0x8)::64 word)) \<and> RDI \<sigma> = (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word),8]::64 word) \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x28) \<and> R13 \<sigma> = RSI\<^sub>0 \<and> R12 \<sigma> = (((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word)::64 word) + 0x48),8]::64 word)::64 word) + (\<langle>63,0\<rangle>(((\<langle>63,0\<rangle>(sextend (ucast (((ucast (((\<langle>31,0\<rangle>RBP \<sigma>::32 word)::32 word))::32 word) << unat (((\<langle>7,0\<rangle>(\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word)::64 word) + 0x14),4]::32 word)::8 word)::8 word))))) 32 64::64 word)::64 word)::64 word) * 0x8)::64 word)) \<and> R9 \<sigma> = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word)::64 word) + 0x48),8]::64 word) \<and> R8 \<sigma> = (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) \<and> (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) = (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word)::64 word) + 0x14),4]::32 word) = ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word)::64 word) + 0x14),4]::32 word)) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word)::64 word) + 0x18),4]::32 word) = ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word)::64 word) + 0x18),4]::32 word)) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word)::64 word) + 0x48),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word)::64 word) + 0x48),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word),8]::64 word) = (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word),8]::64 word)\<close>
declare Q_0x12bd8_37_def[Qs]

schematic_goal l2_load_isra_5_0_9_0x12bbb_0x12bd1_37[blocks]:
  assumes \<open>(P_0x12bbb_37 && P_0x12bbb_37_regions) \<sigma>\<close>
  shows \<open>exec_block 9 0x12bd1 37 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x12bd8_37 ?\<sigma> \<and> block_usage P_0x12bbb_37_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x12bbb_37_def P_0x12bbb_37_regions_def post: Q_0x12bd8_37_def regionset: P_0x12bbb_37_regions_set_def)

definition P_0x12bd8_38 :: state_pred where
  \<open>P_0x12bd8_38 \<sigma> \<equiv> RIP \<sigma> = 0x12bd8 \<and> RAX \<sigma> = ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word)::64 word) + 0x18),4]::32 word)) \<and> RBX \<sigma> = (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) \<and> RCX \<sigma> = ucast ((\<langle>31,0\<rangle>(((\<langle>63,0\<rangle>(\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word)::64 word) + 0x18),4]::32 word)::64 word)::64 word) * 0x8)::32 word)) \<and> RDX \<sigma> = (((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word)::64 word) + 0x48),8]::64 word)::64 word) + (\<langle>63,0\<rangle>(((\<langle>63,0\<rangle>(sextend (ucast (((ucast (((\<langle>31,0\<rangle>RBP \<sigma>::32 word)::32 word))::32 word) << unat (((\<langle>7,0\<rangle>(\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word)::64 word) + 0x14),4]::32 word)::8 word)::8 word))))) 32 64::64 word)::64 word)::64 word) * 0x8)::64 word)) \<and> RDI \<sigma> = (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word),8]::64 word) \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x28) \<and> R13 \<sigma> = RSI\<^sub>0 \<and> R12 \<sigma> = (((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word)::64 word) + 0x48),8]::64 word)::64 word) + (\<langle>63,0\<rangle>(((\<langle>63,0\<rangle>(sextend (ucast (((ucast (((\<langle>31,0\<rangle>RBP \<sigma>::32 word)::32 word))::32 word) << unat (((\<langle>7,0\<rangle>(\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word)::64 word) + 0x14),4]::32 word)::8 word)::8 word))))) 32 64::64 word)::64 word)::64 word) * 0x8)::64 word)) \<and> R9 \<sigma> = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word)::64 word) + 0x48),8]::64 word) \<and> R8 \<sigma> = (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) \<and> (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) = (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word)::64 word) + 0x14),4]::32 word) = ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word)::64 word) + 0x14),4]::32 word)) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word)::64 word) + 0x18),4]::32 word) = ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word)::64 word) + 0x18),4]::32 word)) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word)::64 word) + 0x48),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word)::64 word) + 0x48),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word),8]::64 word) = (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word),8]::64 word)\<close>
declare P_0x12bd8_38_def[Ps]

definition P_0x12bd8_38_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x12bd8_38_regions_set \<sigma> \<equiv> {
    (0, RDI\<^sub>0, 8),
    (1, RSP\<^sub>0, 8),
    (2, (((\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word)::64 word) + 0x14), 4),
    (3, (((\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word)::64 word) + 0x18), 4),
    (4, (((\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word)::64 word) + 0x48), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (10, (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word), 8)
  }\<close>

definition P_0x12bd8_38_regions :: state_pred where
  \<open>P_0x12bd8_38_regions \<sigma> \<equiv> \<exists>regions. P_0x12bd8_38_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_bdrv_pread_addr_0x12bd8_38 :: state_pred where
  \<open>Q_bdrv_pread_addr_0x12bd8_38 \<sigma> \<equiv> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x30) \<and> RIP \<sigma> = bdrv_pread_addr \<and> RAX \<sigma> = ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word)::64 word) + 0x18),4]::32 word)) \<and> RBX \<sigma> = (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) \<and> RCX \<sigma> = ucast ((\<langle>31,0\<rangle>(((\<langle>63,0\<rangle>(\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word)::64 word) + 0x18),4]::32 word)::64 word)::64 word) * 0x8)::32 word)) \<and> RDX \<sigma> = (((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word)::64 word) + 0x48),8]::64 word)::64 word) + (\<langle>63,0\<rangle>(((\<langle>63,0\<rangle>(sextend (ucast (((ucast (((\<langle>31,0\<rangle>RBP \<sigma>::32 word)::32 word))::32 word) << unat (((\<langle>7,0\<rangle>(\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word)::64 word) + 0x14),4]::32 word)::8 word)::8 word))))) 32 64::64 word)::64 word)::64 word) * 0x8)::64 word)) \<and> RDI \<sigma> = (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word),8]::64 word) \<and> RSI \<sigma> = RSI\<^sub>0 \<and> R13 \<sigma> = RSI\<^sub>0 \<and> R12 \<sigma> = (((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word)::64 word) + 0x48),8]::64 word)::64 word) + (\<langle>63,0\<rangle>(((\<langle>63,0\<rangle>(sextend (ucast (((ucast (((\<langle>31,0\<rangle>RBP \<sigma>::32 word)::32 word))::32 word) << unat (((\<langle>7,0\<rangle>(\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word)::64 word) + 0x14),4]::32 word)::8 word)::8 word))))) 32 64::64 word)::64 word)::64 word) * 0x8)::64 word)) \<and> R9 \<sigma> = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word)::64 word) + 0x48),8]::64 word) \<and> R8 \<sigma> = (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) \<and> (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) = (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word)::64 word) + 0x14),4]::32 word) = ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word)::64 word) + 0x14),4]::32 word)) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word)::64 word) + 0x18),4]::32 word) = ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word)::64 word) + 0x18),4]::32 word)) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word)::64 word) + 0x48),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word)::64 word) + 0x48),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = 0x12bdd \<and> (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word),8]::64 word) = (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word),8]::64 word)\<close>
declare Q_bdrv_pread_addr_0x12bd8_38_def[Qs]

schematic_goal l2_load_isra_5_0_1_0x12bd8_0x12bd8_38[blocks]:
  assumes \<open>(P_0x12bd8_38 && P_0x12bd8_38_regions) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x12bd8 38 \<sigma> \<triangleq> ?\<sigma> \<and> Q_bdrv_pread_addr_0x12bd8_38 ?\<sigma> \<and> block_usage P_0x12bd8_38_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x12bd8_38_def P_0x12bd8_38_regions_def post: Q_bdrv_pread_addr_0x12bd8_38_def regionset: P_0x12bd8_38_regions_set_def)

definition P_0x12bdd_39 :: state_pred where
  \<open>P_0x12bdd_39 \<sigma> \<equiv> RIP \<sigma> = 0x12bdd \<and> RAX \<sigma> = bdrv_pread_0x12bd8_retval \<and> RBX \<sigma> = (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) \<and> RCX \<sigma> = ucast ((\<langle>31,0\<rangle>(((\<langle>63,0\<rangle>(\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word)::64 word) + 0x18),4]::32 word)::64 word)::64 word) * 0x8)::32 word)) \<and> RDX \<sigma> = (((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word)::64 word) + 0x48),8]::64 word)::64 word) + (\<langle>63,0\<rangle>(((\<langle>63,0\<rangle>(sextend (ucast (((ucast (((\<langle>31,0\<rangle>RBP \<sigma>::32 word)::32 word))::32 word) << unat (((\<langle>7,0\<rangle>(\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word)::64 word) + 0x14),4]::32 word)::8 word)::8 word))))) 32 64::64 word)::64 word)::64 word) * 0x8)::64 word)) \<and> RDI \<sigma> = (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word),8]::64 word) \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x28) \<and> R13 \<sigma> = RSI\<^sub>0 \<and> R12 \<sigma> = (((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word)::64 word) + 0x48),8]::64 word)::64 word) + (\<langle>63,0\<rangle>(((\<langle>63,0\<rangle>(sextend (ucast (((ucast (((\<langle>31,0\<rangle>RBP \<sigma>::32 word)::32 word))::32 word) << unat (((\<langle>7,0\<rangle>(\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word)::64 word) + 0x14),4]::32 word)::8 word)::8 word))))) 32 64::64 word)::64 word)::64 word) * 0x8)::64 word)) \<and> R9 \<sigma> = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word)::64 word) + 0x48),8]::64 word) \<and> R8 \<sigma> = (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) \<and> (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) = (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word)::64 word) + 0x14),4]::32 word) = ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word)::64 word) + 0x14),4]::32 word)) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word)::64 word) + 0x18),4]::32 word) = ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word)::64 word) + 0x18),4]::32 word)) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word)::64 word) + 0x48),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word)::64 word) + 0x48),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = 0x12bdd \<and> (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word),8]::64 word) = (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word),8]::64 word)\<close>
declare P_0x12bdd_39_def[Ps]

definition P_0x12bdd_39_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x12bdd_39_regions_set \<sigma> \<equiv> {
    (0, RDI\<^sub>0, 8),
    (1, RSP\<^sub>0, 8),
    (2, (((\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word)::64 word) + 0x14), 4),
    (3, (((\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word)::64 word) + 0x18), 4),
    (4, (((\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word)::64 word) + 0x48), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (10, (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word), 8)
  }\<close>

definition P_0x12bdd_39_regions :: state_pred where
  \<open>P_0x12bdd_39_regions \<sigma> \<equiv> \<exists>regions. P_0x12bdd_39_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x12bea_39 :: state_pred where
  \<open>Q_0x12bea_39 \<sigma> \<equiv> RIP \<sigma> = 0x12bea \<and> RAX \<sigma> = (sextend (ucast ((\<langle>31,0\<rangle>bdrv_pread_0x12bd8_retval::32 word))) 32 64::64 word) \<and> RBX \<sigma> = (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) \<and> RCX \<sigma> = ucast ((\<langle>31,0\<rangle>(((\<langle>63,0\<rangle>(\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word)::64 word) + 0x18),4]::32 word)::64 word)::64 word) * 0x8)::32 word)) \<and> RDX \<sigma> = ((ucast (((sextend (ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word)::64 word) + 0x18),4]::32 word))) 32 64::64 word)::64 word))::64 word) << 3) \<and> RDI \<sigma> = (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word),8]::64 word) \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x28) \<and> R13 \<sigma> = RSI\<^sub>0 \<and> R12 \<sigma> = (((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word)::64 word) + 0x48),8]::64 word)::64 word) + (\<langle>63,0\<rangle>(((\<langle>63,0\<rangle>(sextend (ucast (((ucast (((\<langle>31,0\<rangle>RBP \<sigma>::32 word)::32 word))::32 word) << unat (((\<langle>7,0\<rangle>(\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word)::64 word) + 0x14),4]::32 word)::8 word)::8 word))))) 32 64::64 word)::64 word)::64 word) * 0x8)::64 word)) \<and> R9 \<sigma> = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word)::64 word) + 0x48),8]::64 word) \<and> R8 \<sigma> = (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) \<and> (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) = (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word)::64 word) + 0x14),4]::32 word) = ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word)::64 word) + 0x14),4]::32 word)) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word)::64 word) + 0x18),4]::32 word) = ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word)::64 word) + 0x18),4]::32 word)) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word)::64 word) + 0x48),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word)::64 word) + 0x48),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = 0x12bdd \<and> (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word),8]::64 word) = (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word),8]::64 word)\<close>
declare Q_0x12bea_39_def[Qs]

schematic_goal l2_load_isra_5_0_4_0x12bdd_0x12be7_39[blocks]:
  assumes \<open>(P_0x12bdd_39 && P_0x12bdd_39_regions) \<sigma>\<close>
  shows \<open>exec_block 4 0x12be7 39 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x12bea_39 ?\<sigma> \<and> block_usage P_0x12bdd_39_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x12bdd_39_def P_0x12bdd_39_regions_def post: Q_0x12bea_39_def regionset: P_0x12bdd_39_regions_set_def)

definition P_0x12bea_true_40 :: state_pred where
  \<open>P_0x12bea_true_40 \<sigma> \<equiv> RIP \<sigma> = 0x12bea \<and> RAX \<sigma> = (sextend (ucast ((\<langle>31,0\<rangle>bdrv_pread_0x12bd8_retval::32 word))) 32 64::64 word) \<and> RBX \<sigma> = (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) \<and> RCX \<sigma> = ucast ((\<langle>31,0\<rangle>(((\<langle>63,0\<rangle>(\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word)::64 word) + 0x18),4]::32 word)::64 word)::64 word) * 0x8)::32 word)) \<and> RDX \<sigma> = ((ucast (((sextend (ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word)::64 word) + 0x18),4]::32 word))) 32 64::64 word)::64 word))::64 word) << 3) \<and> RDI \<sigma> = (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word),8]::64 word) \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x28) \<and> R13 \<sigma> = RSI\<^sub>0 \<and> R12 \<sigma> = (((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word)::64 word) + 0x48),8]::64 word)::64 word) + (\<langle>63,0\<rangle>(((\<langle>63,0\<rangle>(sextend (ucast (((ucast (((\<langle>31,0\<rangle>RBP \<sigma>::32 word)::32 word))::32 word) << unat (((\<langle>7,0\<rangle>(\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word)::64 word) + 0x14),4]::32 word)::8 word)::8 word))))) 32 64::64 word)::64 word)::64 word) * 0x8)::64 word)) \<and> R9 \<sigma> = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word)::64 word) + 0x48),8]::64 word) \<and> R8 \<sigma> = (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) \<and> (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) = (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word)::64 word) + 0x14),4]::32 word) = ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word)::64 word) + 0x14),4]::32 word)) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word)::64 word) + 0x18),4]::32 word) = ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word)::64 word) + 0x18),4]::32 word)) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word)::64 word) + 0x48),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word)::64 word) + 0x48),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = 0x12bdd \<and> (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word),8]::64 word) = (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word),8]::64 word)\<close>
declare P_0x12bea_true_40_def[Ps]

definition P_0x12bea_true_40_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x12bea_true_40_regions_set \<sigma> \<equiv> {
    (0, RDI\<^sub>0, 8),
    (1, RSP\<^sub>0, 8),
    (2, (((\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word)::64 word) + 0x14), 4),
    (3, (((\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word)::64 word) + 0x18), 4),
    (4, (((\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word)::64 word) + 0x48), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (10, (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word), 8)
  }\<close>

definition P_0x12bea_true_40_regions :: state_pred where
  \<open>P_0x12bea_true_40_regions \<sigma> \<equiv> \<exists>regions. P_0x12bea_true_40_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_ret_address_40 :: state_pred where
  \<open>Q_ret_address_40 \<sigma> \<equiv> RIP \<sigma> = ret_address \<and> RBX \<sigma> = RBX\<^sub>0 \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) + 0x8) \<and> RBP \<sigma> = RBP\<^sub>0 \<and> R13 \<sigma> = R13\<^sub>0 \<and> R12 \<sigma> = R12\<^sub>0 \<and> R9 \<sigma> = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word)::64 word) + 0x48),8]::64 word) \<and> (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) = (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word)::64 word) + 0x14),4]::32 word) = ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word)::64 word) + 0x14),4]::32 word)) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word)::64 word) + 0x48),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word)::64 word) + 0x48),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBX\<^sub>0\<close>
declare Q_ret_address_40_def[Qs]

schematic_goal l2_load_isra_5_0_9_0x12bea_0x12c80_40[blocks]:
  assumes \<open>(P_0x12bea_true_40 && P_0x12bea_true_40_regions && !ZF) \<sigma>\<close>
  shows \<open>exec_block 9 0x12c80 40 \<sigma> \<triangleq> ?\<sigma> \<and> Q_ret_address_40 ?\<sigma> \<and> block_usage P_0x12bea_true_40_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x12bea_true_40_def P_0x12bea_true_40_regions_def post: Q_ret_address_40_def regionset: P_0x12bea_true_40_regions_set_def)

definition P_0x12bea_false_41 :: state_pred where
  \<open>P_0x12bea_false_41 \<sigma> \<equiv> RIP \<sigma> = 0x12bea \<and> RAX \<sigma> = (sextend (ucast ((\<langle>31,0\<rangle>bdrv_pread_0x12bd8_retval::32 word))) 32 64::64 word) \<and> RBX \<sigma> = (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) \<and> RCX \<sigma> = ucast ((\<langle>31,0\<rangle>(((\<langle>63,0\<rangle>(\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word)::64 word) + 0x18),4]::32 word)::64 word)::64 word) * 0x8)::32 word)) \<and> RDX \<sigma> = ((ucast (((sextend (ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word)::64 word) + 0x18),4]::32 word))) 32 64::64 word)::64 word))::64 word) << 3) \<and> RDI \<sigma> = (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word),8]::64 word) \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x28) \<and> R13 \<sigma> = RSI\<^sub>0 \<and> R12 \<sigma> = (((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word)::64 word) + 0x48),8]::64 word)::64 word) + (\<langle>63,0\<rangle>(((\<langle>63,0\<rangle>(sextend (ucast (((ucast (((\<langle>31,0\<rangle>RBP \<sigma>::32 word)::32 word))::32 word) << unat (((\<langle>7,0\<rangle>(\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word)::64 word) + 0x14),4]::32 word)::8 word)::8 word))))) 32 64::64 word)::64 word)::64 word) * 0x8)::64 word)) \<and> R9 \<sigma> = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word)::64 word) + 0x48),8]::64 word) \<and> R8 \<sigma> = (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) \<and> (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) = (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word)::64 word) + 0x14),4]::32 word) = ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word)::64 word) + 0x14),4]::32 word)) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word)::64 word) + 0x18),4]::32 word) = ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word)::64 word) + 0x18),4]::32 word)) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word)::64 word) + 0x48),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word)::64 word) + 0x48),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = 0x12bdd \<and> (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word),8]::64 word) = (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word),8]::64 word)\<close>
declare P_0x12bea_false_41_def[Ps]

definition P_0x12bea_false_41_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x12bea_false_41_regions_set \<sigma> \<equiv> {
    (0, RDI\<^sub>0, 8),
    (1, RSP\<^sub>0, 8),
    (2, (((\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word)::64 word) + 0x14), 4),
    (3, (((\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word)::64 word) + 0x18), 4),
    (4, (((\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word)::64 word) + 0x48), 8),
    (5, (((\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word)::64 word) + (((\<langle>63,0\<rangle>((RBP \<sigma>::64 word) * 0x4)::64 word)::64 word) + 0xd0)), 4),
    (6, (((\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word)::64 word) + (((\<langle>63,0\<rangle>((RBP \<sigma>::64 word) * 0x8)::64 word)::64 word) + 0x50)), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (11, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (12, (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word), 8)
  }\<close>

definition P_0x12bea_false_41_regions :: state_pred where
  \<open>P_0x12bea_false_41_regions \<sigma> \<equiv> \<exists>regions. P_0x12bea_false_41_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x12c00_41 :: state_pred where
  \<open>Q_0x12c00_41 \<sigma> \<equiv> RIP \<sigma> = 0x12c00 \<and> RAX \<sigma> = (sextend (ucast ((\<langle>31,0\<rangle>bdrv_pread_0x12bd8_retval::32 word))) 32 64::64 word) \<and> RBX \<sigma> = (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) \<and> RCX \<sigma> = ucast ((\<langle>31,0\<rangle>(((\<langle>63,0\<rangle>(\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word)::64 word) + 0x18),4]::32 word)::64 word)::64 word) * 0x8)::32 word)) \<and> RDX \<sigma> = ((ucast (((sextend (ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word)::64 word) + 0x18),4]::32 word))) 32 64::64 word)::64 word))::64 word) << 3) \<and> RDI \<sigma> = (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word),8]::64 word) \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x28) \<and> R13 \<sigma> = RSI\<^sub>0 \<and> R12 \<sigma> = (((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word)::64 word) + 0x48),8]::64 word)::64 word) + (\<langle>63,0\<rangle>(((\<langle>63,0\<rangle>(sextend (ucast (((ucast (((\<langle>31,0\<rangle>RBP \<sigma>::32 word)::32 word))::32 word) << unat (((\<langle>7,0\<rangle>(\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word)::64 word) + 0x14),4]::32 word)::8 word)::8 word))))) 32 64::64 word)::64 word)::64 word) * 0x8)::64 word)) \<and> R9 \<sigma> = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word)::64 word) + 0x48),8]::64 word) \<and> R8 \<sigma> = (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) \<and> (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) = (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word)::64 word) + 0x14),4]::32 word) = ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word)::64 word) + 0x14),4]::32 word)) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word)::64 word) + 0x18),4]::32 word) = ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word)::64 word) + 0x18),4]::32 word)) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word)::64 word) + 0x48),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word)::64 word) + 0x48),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word)::64 word) + (((\<langle>63,0\<rangle>((RBP \<sigma>::64 word) * 0x4)::64 word)::64 word) + 0xd0)),4]::32 word) = 0x1 \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word)::64 word) + (((\<langle>63,0\<rangle>((RBP \<sigma>::64 word) * 0x8)::64 word)::64 word) + 0x50)),8]::64 word) = RSI\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = 0x12bdd \<and> (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word),8]::64 word) = (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word),8]::64 word)\<close>
declare Q_0x12c00_41_def[Qs]

schematic_goal l2_load_isra_5_0_3_0x12bea_0x12bf5_41[blocks]:
  assumes \<open>(P_0x12bea_false_41 && P_0x12bea_false_41_regions && ! !ZF) \<sigma>\<close>
  shows \<open>exec_block 3 0x12bf5 41 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x12c00_41 ?\<sigma> \<and> block_usage P_0x12bea_false_41_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x12bea_false_41_def P_0x12bea_false_41_regions_def post: Q_0x12c00_41_def regionset: P_0x12bea_false_41_regions_set_def)

definition P_0x12c00_42 :: state_pred where
  \<open>P_0x12c00_42 \<sigma> \<equiv> RIP \<sigma> = 0x12c00 \<and> RAX \<sigma> = (sextend (ucast ((\<langle>31,0\<rangle>bdrv_pread_0x12bd8_retval::32 word))) 32 64::64 word) \<and> RBX \<sigma> = (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) \<and> RCX \<sigma> = ucast ((\<langle>31,0\<rangle>(((\<langle>63,0\<rangle>(\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word)::64 word) + 0x18),4]::32 word)::64 word)::64 word) * 0x8)::32 word)) \<and> RDX \<sigma> = ((ucast (((sextend (ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word)::64 word) + 0x18),4]::32 word))) 32 64::64 word)::64 word))::64 word) << 3) \<and> RDI \<sigma> = (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word),8]::64 word) \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x28) \<and> R13 \<sigma> = RSI\<^sub>0 \<and> R12 \<sigma> = (((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word)::64 word) + 0x48),8]::64 word)::64 word) + (\<langle>63,0\<rangle>(((\<langle>63,0\<rangle>(sextend (ucast (((ucast (((\<langle>31,0\<rangle>RBP \<sigma>::32 word)::32 word))::32 word) << unat (((\<langle>7,0\<rangle>(\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word)::64 word) + 0x14),4]::32 word)::8 word)::8 word))))) 32 64::64 word)::64 word)::64 word) * 0x8)::64 word)) \<and> R9 \<sigma> = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word)::64 word) + 0x48),8]::64 word) \<and> R8 \<sigma> = (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) \<and> (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) = (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word)::64 word) + 0x14),4]::32 word) = ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word)::64 word) + 0x14),4]::32 word)) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word)::64 word) + 0x18),4]::32 word) = ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word)::64 word) + 0x18),4]::32 word)) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word)::64 word) + 0x48),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word)::64 word) + 0x48),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word)::64 word) + (((\<langle>63,0\<rangle>((RBP \<sigma>::64 word) * 0x4)::64 word)::64 word) + 0xd0)),4]::32 word) = 0x1 \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word)::64 word) + (((\<langle>63,0\<rangle>((RBP \<sigma>::64 word) * 0x8)::64 word)::64 word) + 0x50)),8]::64 word) = RSI\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = 0x12bdd \<and> (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word),8]::64 word) = (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word),8]::64 word)\<close>
declare P_0x12c00_42_def[Ps]

definition P_0x12c00_42_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x12c00_42_regions_set \<sigma> \<equiv> {
    (0, RDI\<^sub>0, 8),
    (1, RSP\<^sub>0, 8),
    (2, (((\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word)::64 word) + 0x14), 4),
    (3, (((\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word)::64 word) + 0x18), 4),
    (4, (((\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word)::64 word) + 0x48), 8),
    (5, (((\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word)::64 word) + (((\<langle>63,0\<rangle>((RBP \<sigma>::64 word) * 0x4)::64 word)::64 word) + 0xd0)), 4),
    (6, (((\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word)::64 word) + (((\<langle>63,0\<rangle>((RBP \<sigma>::64 word) * 0x8)::64 word)::64 word) + 0x50)), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (11, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (12, (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word), 8)
  }\<close>

definition P_0x12c00_42_regions :: state_pred where
  \<open>P_0x12c00_42_regions \<sigma> \<equiv> \<exists>regions. P_0x12c00_42_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_ret_address_42 :: state_pred where
  \<open>Q_ret_address_42 \<sigma> \<equiv> RIP \<sigma> = ret_address \<and> RBX \<sigma> = RBX\<^sub>0 \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) + 0x8) \<and> RBP \<sigma> = RBP\<^sub>0 \<and> R13 \<sigma> = R13\<^sub>0 \<and> R12 \<sigma> = R12\<^sub>0 \<and> R9 \<sigma> = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word)::64 word) + 0x48),8]::64 word) \<and> (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) = (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word)::64 word) + 0x14),4]::32 word) = ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word)::64 word) + 0x14),4]::32 word)) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word)::64 word) + 0x48),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word)::64 word) + 0x48),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBX\<^sub>0\<close>
declare Q_ret_address_42_def[Qs]

schematic_goal l2_load_isra_5_0_7_0x12c00_0x12c0d_42[blocks]:
  assumes \<open>(P_0x12c00_42 && P_0x12c00_42_regions) \<sigma>\<close>
  shows \<open>exec_block 7 0x12c0d 42 \<sigma> \<triangleq> ?\<sigma> \<and> Q_ret_address_42 ?\<sigma> \<and> block_usage P_0x12c00_42_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x12c00_42_def P_0x12c00_42_regions_def post: Q_ret_address_42_def regionset: P_0x12c00_42_regions_set_def)

definition l2_load_isra_5_acode :: ACode where
  \<open>l2_load_isra_5_acode =
    Block 8 0x12b6f 0;
    WHILE P_0x12b70_1 DO
      Block 2 0x12b72 (Suc 0);
      IF ZF THEN
        Block (Suc 0) 0x12b77 2
      ELSE
        Block 3 0x12b81 3;
        IF !ZF THEN
          Block (Suc 0) 0x12b85 4
        ELSE
          Block (Suc 0) 0x12b85 5
        FI
      FI
    OD;
    CASES [
      (P_0x12b87_6,
        Block 3 0x12b8e 6;
        Block 4 0x12b9a 7;
        WHILE P_0x12ba0_8 DO
          Block 2 0x12ba8 8;
          IF !CF THEN
            Block (Suc 0) 0x12baa 9
          ELSE
            Block 3 0x12baf 10
          FI;
          Block 2 0x12bb5 11;
          IF !ZF THEN
            Block (Suc 0) 0x12bb9 12
          ELSE
            Block (Suc 0) 0x12bb9 13
          FI
        OD;
        Block 9 0x12bd1 14;
        Block (Suc 0) 0x12bd8 15;
        CALL bdrv_pread_acode;
        Block 4 0x12be7 16;
        IF !ZF THEN
          Block 9 0x12c80 17
        ELSE
          Block 3 0x12bf5 18;
          Block 7 0x12c0d 19
        FI
      ),
      (P_0x12c10_20,
        Block 6 0x12c25 20;
        IF ZF THEN
          Block 4 0x12c5e 21;
          WHILE P_0x12c60_22 DO
            Block 3 0x12c66 22;
            IF !ZF THEN
              Block (Suc 0) 0x12c69 23
            ELSE
              Block (Suc 0) 0x12c69 24
            FI
          OD;
          Block (Suc 0) 0x12c6b 25
        ELSE
          Block (Suc 0) 0x12c28 26
        FI;
        Block 6 0x12c3a 27;
        IF !ZF THEN
          Block 8 0x12c0d 28
        ELSE
          Block 3 0x12c42 29;
          Block 4 0x12b9a 30;
          WHILE P_0x12ba0_31 DO
            Block 2 0x12ba8 31;
            IF !CF THEN
              Block (Suc 0) 0x12baa 32
            ELSE
              Block 3 0x12baf 33
            FI;
            Block 2 0x12bb5 34;
            IF !ZF THEN
              Block (Suc 0) 0x12bb9 35
            ELSE
              Block (Suc 0) 0x12bb9 36
            FI
          OD;
          Block 9 0x12bd1 37;
          Block (Suc 0) 0x12bd8 38;
          CALL bdrv_pread_acode;
          Block 4 0x12be7 39;
          IF !ZF THEN
            Block 9 0x12c80 40
          ELSE
            Block 3 0x12bf5 41;
            Block 7 0x12c0d 42
          FI
        FI
      )
    ]
  \<close>

schematic_goal "l2_load_isra_5":
  assumes
    \<open>\<forall>\<sigma>. RIP \<sigma> = 0x12b70 \<longrightarrow> P_0x12b70_1_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x12b77 \<longrightarrow> P_0x12b77_true_2_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x12b77 \<longrightarrow> P_0x12b77_false_3_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x12b85 \<longrightarrow> P_0x12b85_true_4_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x12b85 \<longrightarrow> P_0x12b85_false_5_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x12b87 \<longrightarrow> P_0x12b87_6_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x12b91 \<longrightarrow> P_0x12b91_7_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x12ba0 \<longrightarrow> P_0x12ba0_8_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x12baa \<longrightarrow> P_0x12baa_true_9_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x12baa \<longrightarrow> P_0x12baa_false_10_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x12bb1 \<longrightarrow> P_0x12bb1_11_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x12bb9 \<longrightarrow> P_0x12bb9_true_12_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x12bb9 \<longrightarrow> P_0x12bb9_false_13_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x12bbb \<longrightarrow> P_0x12bbb_14_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x12bd8 \<longrightarrow> P_0x12bd8_15_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x12bdd \<longrightarrow> P_0x12bdd_16_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x12bea \<longrightarrow> P_0x12bea_true_17_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x12bea \<longrightarrow> P_0x12bea_false_18_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x12c00 \<longrightarrow> P_0x12c00_19_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x12c10 \<longrightarrow> P_0x12c10_20_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x12c28 \<longrightarrow> P_0x12c28_true_21_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x12c60 \<longrightarrow> P_0x12c60_22_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x12c69 \<longrightarrow> P_0x12c69_true_23_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x12c69 \<longrightarrow> P_0x12c69_false_24_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x12c6b \<longrightarrow> P_0x12c6b_25_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x12c28 \<longrightarrow> P_0x12c28_false_26_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x12c2a \<longrightarrow> P_0x12c2a_27_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x12c3d \<longrightarrow> P_0x12c3d_true_28_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x12c3d \<longrightarrow> P_0x12c3d_false_29_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x12b91 \<longrightarrow> P_0x12b91_30_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x12ba0 \<longrightarrow> P_0x12ba0_31_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x12baa \<longrightarrow> P_0x12baa_true_32_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x12baa \<longrightarrow> P_0x12baa_false_33_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x12bb1 \<longrightarrow> P_0x12bb1_34_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x12bb9 \<longrightarrow> P_0x12bb9_true_35_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x12bb9 \<longrightarrow> P_0x12bb9_false_36_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x12bbb \<longrightarrow> P_0x12bbb_37_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x12bd8 \<longrightarrow> P_0x12bd8_38_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x12bdd \<longrightarrow> P_0x12bdd_39_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x12bea \<longrightarrow> P_0x12bea_true_40_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x12bea \<longrightarrow> P_0x12bea_false_41_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x12c00 \<longrightarrow> P_0x12c00_42_regions \<sigma>\<close>
    and [blocks]: \<open>{{Q_bdrv_pread_addr_0x12bd8_15}} \<box>bdrv_pread_acode {{P_0x12bdd_16;M_0x12bd8}}\<close>
    and [blocks]: \<open>{{Q_bdrv_pread_addr_0x12bd8_38}} \<box>bdrv_pread_acode {{P_0x12bdd_39;M_0x12bd8}}\<close>
  shows \<open>{{?P}} l2_load_isra_5_acode {{?Q;?M}}\<close>
  apply (vcg acode: l2_load_isra_5_acode_def assms: assms)
  apply (vcg_while "P_0x12b70_1 || P_0x12b87_6 || P_0x12c10_20")
  apply (vcg_step assms: assms)+
  apply (auto simp add: pred_logic Ps Qs assms)[1]
  apply (vcg_step' assms: assms)
  apply (vcg_step assms: assms)+
  apply (vcg_while "P_0x12ba0_8 || P_0x12bbb_14")
  apply (vcg_step assms: assms)+
  apply (auto simp add: pred_logic Ps Qs assms)[1]
  apply (vcg_step assms: assms)+
  apply (auto simp add: pred_logic Ps Qs assms)[1]
  apply simp
  apply (vcg_step assms: assms)+
  apply (vcg_while "P_0x12c60_22 || P_0x12c6b_25")
  apply (vcg_step assms: assms)+
  apply (auto simp add: pred_logic Ps Qs assms)[1]
  apply (vcg_step assms: assms)+
  apply (auto simp add: pred_logic Ps Qs assms)[1]
  apply simp
  apply simp
  apply simp
  apply (vcg_step assms: assms)+
  apply (vcg_while "P_0x12ba0_31 || P_0x12bbb_37")
  apply (vcg_step assms: assms)+
  apply (auto simp add: pred_logic Ps Qs assms)[1]
  apply (vcg_step assms: assms)+
  apply (auto simp add: pred_logic Ps Qs assms)[1]
  apply simp
  apply (vcg_step assms: assms)+
  done
end
