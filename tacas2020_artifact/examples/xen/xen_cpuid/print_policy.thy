theory print_policy
  imports "../../../isabelle/VCG/HTriple"
begin

locale "xen_cpuid" = execution_context + exec_code +
  fixes printf_chk_0x2a17_retval\<^sub>v puts_0x2a23_retval\<^sub>v printf_chk_0x2a62_retval\<^sub>v printf_chk_0x2ab3_retval\<^sub>v puts_0x2aca_retval\<^sub>v printf_chk_0x2aeb_retval\<^sub>v printf_chk_0x2b24_retval\<^sub>v printf_chk_addr puts_addr :: \<open>64 word\<close>
    and printf_chk_acode puts_acode :: ACode
  assumes fetch:
    "fetch 0x29f0 \<equiv> (Unary (IS_8088 Push) (Storage (Reg (General SixtyFour r14))), 2)"
    "fetch 0x29f2 \<equiv> (Binary (IS_8088 Xor) (Reg (General ThirtyTwo rax)) (Storage (Reg (General ThirtyTwo rax))), 2)"
    "fetch 0x29f4 \<equiv> (Unary (IS_8088 Push) (Storage (Reg (General SixtyFour r13))), 2)"
    "fetch 0x29f6 \<equiv> (Binary (IS_8088 Mov) (Reg (General ThirtyTwo r13)) (Storage (Reg (General ThirtyTwo r8))), 3)"
    "fetch 0x29f9 \<equiv> (Unary (IS_8088 Push) (Storage (Reg (General SixtyFour r12))), 2)"
    "fetch 0x29fb \<equiv> (Binary (IS_8088 Mov) (Reg (General ThirtyTwo r12)) (Storage (Reg (General ThirtyTwo rdx))), 3)"
    "fetch 0x29fe \<equiv> (Unary (IS_8088 Push) (Storage (Reg (General SixtyFour rbp))), 1)"
    "fetch 0x29ff \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour rbp)) (Storage (Reg (General SixtyFour rcx))), 3)"
    "fetch 0x2a02 \<equiv> (Binary (IS_8088 Mov) (Reg (General ThirtyTwo rcx)) (Storage (Reg (General ThirtyTwo rdx))), 2)"
    "fetch 0x2a04 \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour rdx)) (Storage (Reg (General SixtyFour rdi))), 3)"
    "fetch 0x2a07 \<equiv> (Unary (IS_8088 Push) (Storage (Reg (General SixtyFour rbx))), 1)"
    "fetch 0x2a08 \<equiv> (Binary (IS_8088 Mov) (Reg (General ThirtyTwo rdi)) (Immediate SixtyFour (ImmVal 1)), 5)"
    "fetch 0x2a0d \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour rbx)) (Storage (Reg (General SixtyFour rsi))), 3)"
    "fetch 0x2a10 \<equiv> (Binary (IS_8088 Lea) (Reg (General SixtyFour rsi)) (Storage (Memory SixtyFour (A_Plus (A_FromReg (General SixtyFour rip)) (A_WordConstant 1521)))), 7)"
    "fetch 0x2a17 \<equiv> (Unary (IS_8088 Call) (Immediate SixtyFour (ImmLabel ''__printf_chk'')), 5)"
    "fetch 0x2a1c \<equiv> (Binary (IS_8088 Lea) (Reg (General SixtyFour rdi)) (Storage (Memory SixtyFour (A_Plus (A_FromReg (General SixtyFour rip)) (A_WordConstant 1813)))), 7)"
    "fetch 0x2a23 \<equiv> (Unary (IS_8088 Call) (Immediate SixtyFour (ImmLabel ''puts'')), 5)"
    "fetch 0x2a28 \<equiv> (Binary (IS_8088 Lea) (Reg (General SixtyFour rax)) (Storage (Memory SixtyFour (A_Plus (A_FromReg (General SixtyFour rip)) (A_WordConstant 2522)))), 7)"
    "fetch 0x2a2f \<equiv> (Binary (IS_8088 Lea) (Reg (General SixtyFour rcx)) (Storage (Memory SixtyFour (A_Plus (A_FromReg (General SixtyFour rip)) (A_WordConstant 1802)))), 7)"
    "fetch 0x2a36 \<equiv> (Binary (IS_8088 Mov) (Reg (General ThirtyTwo rdi)) (Immediate SixtyFour (ImmVal 1)), 5)"
    "fetch 0x2a3b \<equiv> (Unary (IS_8088 Push) (Storage (Reg (General SixtyFour rax))), 1)"
    "fetch 0x2a3c \<equiv> (Binary (IS_8088 Lea) (Reg (General SixtyFour rax)) (Storage (Memory SixtyFour (A_Plus (A_FromReg (General SixtyFour rip)) (A_WordConstant 2443)))), 7)"
    "fetch 0x2a43 \<equiv> (Binary (IS_8088 Lea) (Reg (General SixtyFour rsi)) (Storage (Memory SixtyFour (A_Plus (A_FromReg (General SixtyFour rip)) (A_WordConstant 1502)))), 7)"
    "fetch 0x2a4a \<equiv> (Unary (IS_8088 Push) (Storage (Reg (General SixtyFour rax))), 1)"
    "fetch 0x2a4b \<equiv> (Binary (IS_8088 Lea) (Reg (General SixtyFour r9)) (Storage (Memory SixtyFour (A_Plus (A_FromReg (General SixtyFour rip)) (A_WordConstant 2407)))), 7)"
    "fetch 0x2a52 \<equiv> (Binary (IS_8088 Lea) (Reg (General SixtyFour r8)) (Storage (Memory SixtyFour (A_Plus (A_FromReg (General SixtyFour rip)) (A_WordConstant 2379)))), 7)"
    "fetch 0x2a59 \<equiv> (Binary (IS_8088 Xor) (Reg (General ThirtyTwo rax)) (Storage (Reg (General ThirtyTwo rax))), 2)"
    "fetch 0x2a5b \<equiv> (Binary (IS_8088 Lea) (Reg (General SixtyFour rdx)) (Storage (Memory SixtyFour (A_Plus (A_FromReg (General SixtyFour rip)) (A_WordConstant 1761)))), 7)"
    "fetch 0x2a62 \<equiv> (Unary (IS_8088 Call) (Immediate SixtyFour (ImmLabel ''__printf_chk'')), 5)"
    "fetch 0x2a67 \<equiv> (Unary (IS_8088 Pop) (Storage (Reg (General SixtyFour rcx))), 1)"
    "fetch 0x2a68 \<equiv> (Unary (IS_8088 Pop) (Storage (Reg (General SixtyFour rsi))), 1)"
    "fetch 0x2a69 \<equiv> (Binary (IS_8088 Test) (Reg (General ThirtyTwo r12)) (Storage (Reg (General ThirtyTwo r12))), 3)"
    "fetch 0x2a6c \<equiv> (Unary (IS_8088 Je) (Immediate SixtyFour (ImmVal 10947)), 2)"
    "fetch 0x2a6e \<equiv> (Binary (IS_8088 Lea) (Reg (General ThirtyTwo rax)) (Storage (Memory SixtyFour (A_Minus (A_FromReg (General SixtyFour r12)) (A_WordConstant 1)))), 5)"
    "fetch 0x2a73 \<equiv> (Binary (IS_8088 Lea) (Reg (General SixtyFour r14)) (Storage (Memory SixtyFour (A_Plus (A_FromReg (General SixtyFour rip)) (A_WordConstant 1494)))), 7)"
    "fetch 0x2a7a \<equiv> (Binary (IS_8088 Lea) (Reg (General SixtyFour rax)) (Storage (Memory SixtyFour (A_Plus (A_FromReg (General SixtyFour rax)) (A_Mult 2 (A_FromReg (General SixtyFour rax)))))), 4)"
    "fetch 0x2a7e \<equiv> (Binary (IS_8088 Lea) (Reg (General SixtyFour r12)) (Storage (Memory SixtyFour (A_Plus (A_FromReg (General SixtyFour rbx)) (A_Plus (A_Mult 8 (A_FromReg (General SixtyFour rax))) (A_WordConstant 24))))), 5)"
    "fetch 0x2a83 \<equiv> (Unary (IS_8088 Nop) (Storage (Memory ThirtyTwo (A_SizeDirective 32 (A_Plus (A_FromReg (General SixtyFour rax)) (A_Plus (A_Mult 1 (A_FromReg (General SixtyFour rax))) (A_WordConstant 0)))))), 5)"
    "fetch 0x2a88 \<equiv> (Binary (IS_8088 Mov) (Reg (General ThirtyTwo r8)) (Storage (Memory ThirtyTwo (A_SizeDirective 32 (A_Plus (A_FromReg (General SixtyFour rbx)) (A_WordConstant 8))))), 4)"
    "fetch 0x2a8c \<equiv> (Binary (IS_8088 Mov) (Reg (General ThirtyTwo r9)) (Storage (Memory ThirtyTwo (A_SizeDirective 32 (A_Plus (A_FromReg (General SixtyFour rbx)) (A_WordConstant 12))))), 4)"
    "fetch 0x2a90 \<equiv> (Binary (IS_8088 Mov) (Reg (General ThirtyTwo rsi)) (Storage (Memory ThirtyTwo (A_SizeDirective 32 (A_Plus (A_FromReg (General SixtyFour rbx)) (A_WordConstant 20))))), 3)"
    "fetch 0x2a93 \<equiv> (Binary (IS_8088 Mov) (Reg (General ThirtyTwo rdx)) (Storage (Memory ThirtyTwo (A_SizeDirective 32 (A_Plus (A_FromReg (General SixtyFour rbx)) (A_WordConstant 16))))), 3)"
    "fetch 0x2a96 \<equiv> (Binary (IS_8088 Mov) (Reg (General ThirtyTwo rax)) (Storage (Reg (General ThirtyTwo r8))), 3)"
    "fetch 0x2a99 \<equiv> (Binary (IS_8088 Or) (Reg (General ThirtyTwo rax)) (Storage (Reg (General ThirtyTwo r9))), 3)"
    "fetch 0x2a9c \<equiv> (Binary (IS_8088 Or) (Reg (General ThirtyTwo rax)) (Storage (Reg (General ThirtyTwo rsi))), 2)"
    "fetch 0x2a9e \<equiv> (Binary (IS_8088 Or) (Reg (General ThirtyTwo rax)) (Storage (Reg (General ThirtyTwo rdx))), 2)"
    "fetch 0x2aa0 \<equiv> (Unary (IS_8088 Je) (Immediate SixtyFour (ImmVal 10938)), 2)"
    "fetch 0x2aa2 \<equiv> (Binary (IS_8088 Mov) (Reg (General ThirtyTwo rcx)) (Storage (Memory ThirtyTwo (A_SizeDirective 32 (A_Plus (A_FromReg (General SixtyFour rbx)) (A_WordConstant 4))))), 3)"
    "fetch 0x2aa5 \<equiv> (Unary (IS_8088 Push) (Storage (Reg (General SixtyFour rsi))), 1)"
    "fetch 0x2aa6 \<equiv> (Binary (IS_8088 Mov) (Reg (General ThirtyTwo rdi)) (Immediate SixtyFour (ImmVal 1)), 5)"
    "fetch 0x2aab \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour rsi)) (Storage (Reg (General SixtyFour r14))), 3)"
    "fetch 0x2aae \<equiv> (Unary (IS_8088 Push) (Storage (Reg (General SixtyFour rdx))), 1)"
    "fetch 0x2aaf \<equiv> (Binary (IS_8088 Mov) (Reg (General ThirtyTwo rdx)) (Storage (Memory ThirtyTwo (A_SizeDirective 32 (A_FromReg (General SixtyFour rbx))))), 2)"
    "fetch 0x2ab1 \<equiv> (Binary (IS_8088 Xor) (Reg (General ThirtyTwo rax)) (Storage (Reg (General ThirtyTwo rax))), 2)"
    "fetch 0x2ab3 \<equiv> (Unary (IS_8088 Call) (Immediate SixtyFour (ImmLabel ''__printf_chk'')), 5)"
    "fetch 0x2ab8 \<equiv> (Unary (IS_8088 Pop) (Storage (Reg (General SixtyFour rax))), 1)"
    "fetch 0x2ab9 \<equiv> (Unary (IS_8088 Pop) (Storage (Reg (General SixtyFour rdx))), 1)"
    "fetch 0x2aba \<equiv> (Binary (IS_8088 Add) (Reg (General SixtyFour rbx)) (Immediate SixtyFour (ImmVal 24)), 4)"
    "fetch 0x2abe \<equiv> (Binary (IS_8088 Cmp) (Reg (General SixtyFour r12)) (Storage (Reg (General SixtyFour rbx))), 3)"
    "fetch 0x2ac1 \<equiv> (Unary (IS_8088 Jne) (Immediate SixtyFour (ImmVal 10888)), 2)"
    "fetch 0x2ac3 \<equiv> (Binary (IS_8088 Lea) (Reg (General SixtyFour rdi)) (Storage (Memory SixtyFour (A_Plus (A_FromReg (General SixtyFour rip)) (A_WordConstant 1662)))), 7)"
    "fetch 0x2aca \<equiv> (Unary (IS_8088 Call) (Immediate SixtyFour (ImmLabel ''puts'')), 5)"
    "fetch 0x2acf \<equiv> (Binary (IS_8088 Xor) (Reg (General ThirtyTwo rax)) (Storage (Reg (General ThirtyTwo rax))), 2)"
    "fetch 0x2ad1 \<equiv> (Binary (IS_8088 Lea) (Reg (General SixtyFour rcx)) (Storage (Memory SixtyFour (A_Plus (A_FromReg (General SixtyFour rip)) (A_WordConstant 1655)))), 7)"
    "fetch 0x2ad8 \<equiv> (Binary (IS_8088 Lea) (Reg (General SixtyFour rdx)) (Storage (Memory SixtyFour (A_Plus (A_FromReg (General SixtyFour rip)) (A_WordConstant 1654)))), 7)"
    "fetch 0x2adf \<equiv> (Binary (IS_8088 Lea) (Reg (General SixtyFour rsi)) (Storage (Memory SixtyFour (A_Plus (A_FromReg (General SixtyFour rip)) (A_WordConstant 1653)))), 7)"
    "fetch 0x2ae6 \<equiv> (Binary (IS_8088 Mov) (Reg (General ThirtyTwo rdi)) (Immediate SixtyFour (ImmVal 1)), 5)"
    "fetch 0x2aeb \<equiv> (Unary (IS_8088 Call) (Immediate SixtyFour (ImmLabel ''__printf_chk'')), 5)"
    "fetch 0x2af0 \<equiv> (Binary (IS_8088 Test) (Reg (General ThirtyTwo r13)) (Storage (Reg (General ThirtyTwo r13))), 3)"
    "fetch 0x2af3 \<equiv> (Unary (IS_8088 Je) (Immediate SixtyFour (ImmVal 11054)), 2)"
    "fetch 0x2af5 \<equiv> (Binary (IS_8088 Lea) (Reg (General ThirtyTwo rax)) (Storage (Memory SixtyFour (A_Minus (A_FromReg (General SixtyFour r13)) (A_WordConstant 1)))), 4)"
    "fetch 0x2af9 \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour rbx)) (Storage (Reg (General SixtyFour rbp))), 3)"
    "fetch 0x2afc \<equiv> (Binary (IS_8088 Shl) (Reg (General SixtyFour rax)) (Immediate SixtyFour (ImmVal 4)), 4)"
    "fetch 0x2b00 \<equiv> (Binary (IS_8088 Lea) (Reg (General SixtyFour r12)) (Storage (Memory SixtyFour (A_Plus (A_FromReg (General SixtyFour rbp)) (A_Plus (A_Mult 1 (A_FromReg (General SixtyFour rax))) (A_WordConstant 16))))), 5)"
    "fetch 0x2b05 \<equiv> (Binary (IS_8088 Lea) (Reg (General SixtyFour rbp)) (Storage (Memory SixtyFour (A_Plus (A_FromReg (General SixtyFour rip)) (A_WordConstant 1632)))), 7)"
    "fetch 0x2b0c \<equiv> (Unary (IS_8088 Nop) (Storage (Memory ThirtyTwo (A_SizeDirective 32 (A_Plus (A_FromReg (General SixtyFour rax)) (A_WordConstant 0))))), 4)"
    "fetch 0x2b10 \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour rcx)) (Storage (Memory SixtyFour (A_SizeDirective 64 (A_Plus (A_FromReg (General SixtyFour rbx)) (A_WordConstant 8))))), 4)"
    "fetch 0x2b14 \<equiv> (Binary (IS_8088 Mov) (Reg (General ThirtyTwo rdx)) (Storage (Memory ThirtyTwo (A_SizeDirective 32 (A_FromReg (General SixtyFour rbx))))), 2)"
    "fetch 0x2b16 \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour rsi)) (Storage (Reg (General SixtyFour rbp))), 3)"
    "fetch 0x2b19 \<equiv> (Binary (IS_8088 Mov) (Reg (General ThirtyTwo rdi)) (Immediate SixtyFour (ImmVal 1)), 5)"
    "fetch 0x2b1e \<equiv> (Binary (IS_8088 Xor) (Reg (General ThirtyTwo rax)) (Storage (Reg (General ThirtyTwo rax))), 2)"
    "fetch 0x2b20 \<equiv> (Binary (IS_8088 Add) (Reg (General SixtyFour rbx)) (Immediate SixtyFour (ImmVal 16)), 4)"
    "fetch 0x2b24 \<equiv> (Unary (IS_8088 Call) (Immediate SixtyFour (ImmLabel ''__printf_chk'')), 5)"
    "fetch 0x2b29 \<equiv> (Binary (IS_8088 Cmp) (Reg (General SixtyFour rbx)) (Storage (Reg (General SixtyFour r12))), 3)"
    "fetch 0x2b2c \<equiv> (Unary (IS_8088 Jne) (Immediate SixtyFour (ImmVal 11024)), 2)"
    "fetch 0x2b2e \<equiv> (Unary (IS_8088 Pop) (Storage (Reg (General SixtyFour rbx))), 1)"
    "fetch 0x2b2f \<equiv> (Unary (IS_8088 Pop) (Storage (Reg (General SixtyFour rbp))), 1)"
    "fetch 0x2b30 \<equiv> (Unary (IS_8088 Pop) (Storage (Reg (General SixtyFour r12))), 2)"
    "fetch 0x2b32 \<equiv> (Unary (IS_8088 Pop) (Storage (Reg (General SixtyFour r13))), 2)"
    "fetch 0x2b34 \<equiv> (Unary (IS_8088 Pop) (Storage (Reg (General SixtyFour r14))), 2)"
    "fetch 0x2b36 \<equiv> (Nullary (IS_8088 Ret), 1)"
    and \<alpha>_def: \<open>\<alpha> = \<lparr>text_sections = [], data_sections = [], labels_to_offsets = [], binary_offset = 0\<rparr>\<close>
    and printf_chk\<^sub>a\<^sub>d\<^sub>d\<^sub>r[simp]: \<open>the (label_to_address \<alpha> ''__printf_chk'') = printf_chk_addr\<close>
    and puts\<^sub>a\<^sub>d\<^sub>d\<^sub>r[simp]: \<open>the (label_to_address \<alpha> ''puts'') = puts_addr\<close>
begin

text \<open>Using definitions that don't get unfolded immediately prevents locale argument issues.\<close>
definition \<open>printf_chk_0x2a17_retval \<equiv> printf_chk_0x2a17_retval\<^sub>v\<close>
definition \<open>puts_0x2a23_retval \<equiv> puts_0x2a23_retval\<^sub>v\<close>
definition \<open>printf_chk_0x2a62_retval \<equiv> printf_chk_0x2a62_retval\<^sub>v\<close>
definition \<open>printf_chk_0x2ab3_retval \<equiv> printf_chk_0x2ab3_retval\<^sub>v\<close>
definition \<open>puts_0x2aca_retval \<equiv> puts_0x2aca_retval\<^sub>v\<close>
definition \<open>printf_chk_0x2aeb_retval \<equiv> printf_chk_0x2aeb_retval\<^sub>v\<close>
definition \<open>printf_chk_0x2b24_retval \<equiv> printf_chk_0x2b24_retval\<^sub>v\<close>

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

locale "print_policy" = "xen_cpuid" +
  fixes RAX\<^sub>0\<^sub>v RBX\<^sub>0\<^sub>v RCX\<^sub>0\<^sub>v RDX\<^sub>0\<^sub>v RDI\<^sub>0\<^sub>v RSI\<^sub>0\<^sub>v RSP\<^sub>0\<^sub>v RBP\<^sub>0\<^sub>v R14\<^sub>0\<^sub>v R13\<^sub>0\<^sub>v R12\<^sub>0\<^sub>v R9\<^sub>0\<^sub>v R8\<^sub>0\<^sub>v ret_address\<^sub>v :: \<open>64 word\<close>
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
definition \<open>R14\<^sub>0 \<equiv> R14\<^sub>0\<^sub>v\<close>
definition \<open>R13\<^sub>0 \<equiv> R13\<^sub>0\<^sub>v\<close>
definition \<open>R12\<^sub>0 \<equiv> R12\<^sub>0\<^sub>v\<close>
definition \<open>R9\<^sub>0 \<equiv> R9\<^sub>0\<^sub>v\<close>
definition \<open>R8\<^sub>0 \<equiv> R8\<^sub>0\<^sub>v\<close>
definition \<open>ret_address \<equiv> ret_address\<^sub>v\<close>

definition P_0x29f0_0 :: state_pred where
  \<open>P_0x29f0_0 \<sigma> \<equiv> RIP \<sigma> = 0x29f0 \<and> RAX \<sigma> = RAX\<^sub>0 \<and> RBX \<sigma> = RBX\<^sub>0 \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = RDX\<^sub>0 \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = RSP\<^sub>0 \<and> RBP \<sigma> = RBP\<^sub>0 \<and> R14 \<sigma> = R14\<^sub>0 \<and> R13 \<sigma> = R13\<^sub>0 \<and> R12 \<sigma> = R12\<^sub>0 \<and> R9 \<sigma> = R9\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address\<close>
declare P_0x29f0_0_def[Ps]

definition P_0x29f0_0_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x29f0_0_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (2, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x28), 8)
  }\<close>

definition P_0x29f0_0_regions :: state_pred where
  \<open>P_0x29f0_0_regions \<sigma> \<equiv> \<exists>regions. P_0x29f0_0_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x2a17_0 :: state_pred where
  \<open>Q_0x2a17_0 \<sigma> \<equiv> RIP \<sigma> = 0x2a17 \<and> RAX \<sigma> = 0x0 \<and> RBX \<sigma> = RSI\<^sub>0 \<and> RCX \<sigma> = ucast ((\<langle>31,0\<rangle>RDX\<^sub>0::32 word)) \<and> RDX \<sigma> = RDI\<^sub>0 \<and> RDI \<sigma> = 0x1 \<and> RSI \<sigma> = 0x3008 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x28) \<and> RBP \<sigma> = RCX\<^sub>0 \<and> R14 \<sigma> = R14\<^sub>0 \<and> R13 \<sigma> = ucast ((\<langle>31,0\<rangle>R8\<^sub>0::32 word)) \<and> R12 \<sigma> = ucast ((\<langle>31,0\<rangle>RDX\<^sub>0::32 word)) \<and> R9 \<sigma> = R9\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBX\<^sub>0\<close>
declare Q_0x2a17_0_def[Qs]

schematic_goal print_policy_0_14_0x29f0_0x2a10_0[blocks]:
  assumes \<open>(P_0x29f0_0 && P_0x29f0_0_regions) \<sigma>\<close>
  shows \<open>exec_block 14 0x2a10 0 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x2a17_0 ?\<sigma> \<and> block_usage P_0x29f0_0_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x29f0_0_def P_0x29f0_0_regions_def post: Q_0x2a17_0_def regionset: P_0x29f0_0_regions_set_def)

definition P_0x2a17_1 :: state_pred where
  \<open>P_0x2a17_1 \<sigma> \<equiv> RIP \<sigma> = 0x2a17 \<and> RAX \<sigma> = 0x0 \<and> RBX \<sigma> = RSI\<^sub>0 \<and> RCX \<sigma> = ucast ((\<langle>31,0\<rangle>RDX\<^sub>0::32 word)) \<and> RDX \<sigma> = RDI\<^sub>0 \<and> RDI \<sigma> = 0x1 \<and> RSI \<sigma> = 0x3008 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x28) \<and> RBP \<sigma> = RCX\<^sub>0 \<and> R14 \<sigma> = R14\<^sub>0 \<and> R13 \<sigma> = ucast ((\<langle>31,0\<rangle>R8\<^sub>0::32 word)) \<and> R12 \<sigma> = ucast ((\<langle>31,0\<rangle>RDX\<^sub>0::32 word)) \<and> R9 \<sigma> = R9\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBX\<^sub>0\<close>
declare P_0x2a17_1_def[Ps]

definition P_0x2a17_1_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x2a17_1_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (2, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x30), 8)
  }\<close>

definition P_0x2a17_1_regions :: state_pred where
  \<open>P_0x2a17_1_regions \<sigma> \<equiv> \<exists>regions. P_0x2a17_1_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_printf_chk_addr_0x2a17_1 :: state_pred where
  \<open>Q_printf_chk_addr_0x2a17_1 \<sigma> \<equiv> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x30) \<and> RIP \<sigma> = printf_chk_addr \<and> RAX \<sigma> = 0x0 \<and> RBX \<sigma> = RSI\<^sub>0 \<and> RCX \<sigma> = ucast ((\<langle>31,0\<rangle>RDX\<^sub>0::32 word)) \<and> RDX \<sigma> = RDI\<^sub>0 \<and> RDI \<sigma> = 0x1 \<and> RSI \<sigma> = 0x3008 \<and> RBP \<sigma> = RCX\<^sub>0 \<and> R14 \<sigma> = R14\<^sub>0 \<and> R13 \<sigma> = ucast ((\<langle>31,0\<rangle>R8\<^sub>0::32 word)) \<and> R12 \<sigma> = ucast ((\<langle>31,0\<rangle>RDX\<^sub>0::32 word)) \<and> R9 \<sigma> = R9\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = 0x2a1c\<close>
declare Q_printf_chk_addr_0x2a17_1_def[Qs]

schematic_goal print_policy_0_1_0x2a17_0x2a17_1[blocks]:
  assumes \<open>(P_0x2a17_1 && P_0x2a17_1_regions) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x2a17 (Suc 0) \<sigma> \<triangleq> ?\<sigma> \<and> Q_printf_chk_addr_0x2a17_1 ?\<sigma> \<and> block_usage P_0x2a17_1_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x2a17_1_def P_0x2a17_1_regions_def post: Q_printf_chk_addr_0x2a17_1_def regionset: P_0x2a17_1_regions_set_def)

definition P_0x2a1c_2 :: state_pred where
  \<open>P_0x2a1c_2 \<sigma> \<equiv> RIP \<sigma> = 0x2a1c \<and> RAX \<sigma> = printf_chk_0x2a17_retval \<and> RBX \<sigma> = RSI\<^sub>0 \<and> RCX \<sigma> = ucast ((\<langle>31,0\<rangle>RDX\<^sub>0::32 word)) \<and> RDX \<sigma> = RDI\<^sub>0 \<and> RDI \<sigma> = 0x1 \<and> RSI \<sigma> = 0x3008 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x28) \<and> RBP \<sigma> = RCX\<^sub>0 \<and> R14 \<sigma> = R14\<^sub>0 \<and> R13 \<sigma> = ucast ((\<langle>31,0\<rangle>R8\<^sub>0::32 word)) \<and> R12 \<sigma> = ucast ((\<langle>31,0\<rangle>RDX\<^sub>0::32 word)) \<and> R9 \<sigma> = R9\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = 0x2a1c\<close>
declare P_0x2a1c_2_def[Ps]

definition P_0x2a1c_2_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x2a1c_2_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (2, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x30), 8)
  }\<close>

definition P_0x2a1c_2_regions :: state_pred where
  \<open>P_0x2a1c_2_regions \<sigma> \<equiv> \<exists>regions. P_0x2a1c_2_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x2a23_2 :: state_pred where
  \<open>Q_0x2a23_2 \<sigma> \<equiv> RIP \<sigma> = 0x2a23 \<and> RAX \<sigma> = printf_chk_0x2a17_retval \<and> RBX \<sigma> = RSI\<^sub>0 \<and> RCX \<sigma> = ucast ((\<langle>31,0\<rangle>RDX\<^sub>0::32 word)) \<and> RDX \<sigma> = RDI\<^sub>0 \<and> RDI \<sigma> = 0x3138 \<and> RSI \<sigma> = 0x3008 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x28) \<and> RBP \<sigma> = RCX\<^sub>0 \<and> R14 \<sigma> = R14\<^sub>0 \<and> R13 \<sigma> = ucast ((\<langle>31,0\<rangle>R8\<^sub>0::32 word)) \<and> R12 \<sigma> = ucast ((\<langle>31,0\<rangle>RDX\<^sub>0::32 word)) \<and> R9 \<sigma> = R9\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = 0x2a1c\<close>
declare Q_0x2a23_2_def[Qs]

schematic_goal print_policy_0_1_0x2a1c_0x2a1c_2[blocks]:
  assumes \<open>(P_0x2a1c_2 && P_0x2a1c_2_regions) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x2a1c 2 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x2a23_2 ?\<sigma> \<and> block_usage P_0x2a1c_2_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x2a1c_2_def P_0x2a1c_2_regions_def post: Q_0x2a23_2_def regionset: P_0x2a1c_2_regions_set_def)

definition P_0x2a23_3 :: state_pred where
  \<open>P_0x2a23_3 \<sigma> \<equiv> RIP \<sigma> = 0x2a23 \<and> RAX \<sigma> = printf_chk_0x2a17_retval \<and> RBX \<sigma> = RSI\<^sub>0 \<and> RCX \<sigma> = ucast ((\<langle>31,0\<rangle>RDX\<^sub>0::32 word)) \<and> RDX \<sigma> = RDI\<^sub>0 \<and> RDI \<sigma> = 0x3138 \<and> RSI \<sigma> = 0x3008 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x28) \<and> RBP \<sigma> = RCX\<^sub>0 \<and> R14 \<sigma> = R14\<^sub>0 \<and> R13 \<sigma> = ucast ((\<langle>31,0\<rangle>R8\<^sub>0::32 word)) \<and> R12 \<sigma> = ucast ((\<langle>31,0\<rangle>RDX\<^sub>0::32 word)) \<and> R9 \<sigma> = R9\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = 0x2a1c\<close>
declare P_0x2a23_3_def[Ps]

definition P_0x2a23_3_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x2a23_3_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (2, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x30), 8)
  }\<close>

definition P_0x2a23_3_regions :: state_pred where
  \<open>P_0x2a23_3_regions \<sigma> \<equiv> \<exists>regions. P_0x2a23_3_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_puts_addr_0x2a23_3 :: state_pred where
  \<open>Q_puts_addr_0x2a23_3 \<sigma> \<equiv> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x30) \<and> RIP \<sigma> = puts_addr \<and> RAX \<sigma> = printf_chk_0x2a17_retval \<and> RBX \<sigma> = RSI\<^sub>0 \<and> RCX \<sigma> = ucast ((\<langle>31,0\<rangle>RDX\<^sub>0::32 word)) \<and> RDX \<sigma> = RDI\<^sub>0 \<and> RDI \<sigma> = 0x3138 \<and> RSI \<sigma> = 0x3008 \<and> RBP \<sigma> = RCX\<^sub>0 \<and> R14 \<sigma> = R14\<^sub>0 \<and> R13 \<sigma> = ucast ((\<langle>31,0\<rangle>R8\<^sub>0::32 word)) \<and> R12 \<sigma> = ucast ((\<langle>31,0\<rangle>RDX\<^sub>0::32 word)) \<and> R9 \<sigma> = R9\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = 0x2a28\<close>
declare Q_puts_addr_0x2a23_3_def[Qs]

schematic_goal print_policy_0_1_0x2a23_0x2a23_3[blocks]:
  assumes \<open>(P_0x2a23_3 && P_0x2a23_3_regions) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x2a23 3 \<sigma> \<triangleq> ?\<sigma> \<and> Q_puts_addr_0x2a23_3 ?\<sigma> \<and> block_usage P_0x2a23_3_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x2a23_3_def P_0x2a23_3_regions_def post: Q_puts_addr_0x2a23_3_def regionset: P_0x2a23_3_regions_set_def)

definition P_0x2a28_4 :: state_pred where
  \<open>P_0x2a28_4 \<sigma> \<equiv> RIP \<sigma> = 0x2a28 \<and> RAX \<sigma> = ucast (puts_0x2a23_retval) \<and> RBX \<sigma> = RSI\<^sub>0 \<and> RCX \<sigma> = ucast ((\<langle>31,0\<rangle>RDX\<^sub>0::32 word)) \<and> RDX \<sigma> = RDI\<^sub>0 \<and> RDI \<sigma> = 0x3138 \<and> RSI \<sigma> = 0x3008 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x28) \<and> RBP \<sigma> = RCX\<^sub>0 \<and> R14 \<sigma> = R14\<^sub>0 \<and> R13 \<sigma> = ucast ((\<langle>31,0\<rangle>R8\<^sub>0::32 word)) \<and> R12 \<sigma> = ucast ((\<langle>31,0\<rangle>RDX\<^sub>0::32 word)) \<and> R9 \<sigma> = R9\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = 0x2a28\<close>
declare P_0x2a28_4_def[Ps]

definition P_0x2a28_4_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x2a28_4_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (2, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x38), 8)
  }\<close>

definition P_0x2a28_4_regions :: state_pred where
  \<open>P_0x2a28_4_regions \<sigma> \<equiv> \<exists>regions. P_0x2a28_4_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x2a62_4 :: state_pred where
  \<open>Q_0x2a62_4 \<sigma> \<equiv> RIP \<sigma> = 0x2a62 \<and> RAX \<sigma> = 0x0 \<and> RBX \<sigma> = RSI\<^sub>0 \<and> RCX \<sigma> = 0x3140 \<and> RDX \<sigma> = 0x3143 \<and> RDI \<sigma> = 0x1 \<and> RSI \<sigma> = 0x3028 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x38) \<and> RBP \<sigma> = RCX\<^sub>0 \<and> R14 \<sigma> = R14\<^sub>0 \<and> R13 \<sigma> = ucast ((\<langle>31,0\<rangle>R8\<^sub>0::32 word)) \<and> R12 \<sigma> = ucast ((\<langle>31,0\<rangle>RDX\<^sub>0::32 word)) \<and> R9 \<sigma> = 0x33b9 \<and> R8 \<sigma> = 0x33a4 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = 0x3409 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x38),8]::64 word) = 0x33ce\<close>
declare Q_0x2a62_4_def[Qs]

schematic_goal print_policy_0_11_0x2a28_0x2a5b_4[blocks]:
  assumes \<open>(P_0x2a28_4 && P_0x2a28_4_regions) \<sigma>\<close>
  shows \<open>exec_block 11 0x2a5b 4 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x2a62_4 ?\<sigma> \<and> block_usage P_0x2a28_4_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x2a28_4_def P_0x2a28_4_regions_def post: Q_0x2a62_4_def regionset: P_0x2a28_4_regions_set_def)

definition P_0x2a62_5 :: state_pred where
  \<open>P_0x2a62_5 \<sigma> \<equiv> RIP \<sigma> = 0x2a62 \<and> RAX \<sigma> = 0x0 \<and> RBX \<sigma> = RSI\<^sub>0 \<and> RCX \<sigma> = 0x3140 \<and> RDX \<sigma> = 0x3143 \<and> RDI \<sigma> = 0x1 \<and> RSI \<sigma> = 0x3028 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x38) \<and> RBP \<sigma> = RCX\<^sub>0 \<and> R14 \<sigma> = R14\<^sub>0 \<and> R13 \<sigma> = ucast ((\<langle>31,0\<rangle>R8\<^sub>0::32 word)) \<and> R12 \<sigma> = ucast ((\<langle>31,0\<rangle>RDX\<^sub>0::32 word)) \<and> R9 \<sigma> = 0x33b9 \<and> R8 \<sigma> = 0x33a4 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = 0x3409 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x38),8]::64 word) = 0x33ce\<close>
declare P_0x2a62_5_def[Ps]

definition P_0x2a62_5_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x2a62_5_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (2, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x38), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x40), 8)
  }\<close>

definition P_0x2a62_5_regions :: state_pred where
  \<open>P_0x2a62_5_regions \<sigma> \<equiv> \<exists>regions. P_0x2a62_5_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_printf_chk_addr_0x2a62_5 :: state_pred where
  \<open>Q_printf_chk_addr_0x2a62_5 \<sigma> \<equiv> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x40) \<and> RIP \<sigma> = printf_chk_addr \<and> RAX \<sigma> = 0x0 \<and> RBX \<sigma> = RSI\<^sub>0 \<and> RCX \<sigma> = 0x3140 \<and> RDX \<sigma> = 0x3143 \<and> RDI \<sigma> = 0x1 \<and> RSI \<sigma> = 0x3028 \<and> RBP \<sigma> = RCX\<^sub>0 \<and> R14 \<sigma> = R14\<^sub>0 \<and> R13 \<sigma> = ucast ((\<langle>31,0\<rangle>R8\<^sub>0::32 word)) \<and> R12 \<sigma> = ucast ((\<langle>31,0\<rangle>RDX\<^sub>0::32 word)) \<and> R9 \<sigma> = 0x33b9 \<and> R8 \<sigma> = 0x33a4 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = 0x3409 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x38),8]::64 word) = 0x33ce \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = 0x2a67\<close>
declare Q_printf_chk_addr_0x2a62_5_def[Qs]

schematic_goal print_policy_0_1_0x2a62_0x2a62_5[blocks]:
  assumes \<open>(P_0x2a62_5 && P_0x2a62_5_regions) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x2a62 5 \<sigma> \<triangleq> ?\<sigma> \<and> Q_printf_chk_addr_0x2a62_5 ?\<sigma> \<and> block_usage P_0x2a62_5_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x2a62_5_def P_0x2a62_5_regions_def post: Q_printf_chk_addr_0x2a62_5_def regionset: P_0x2a62_5_regions_set_def)

definition P_0x2a67_6 :: state_pred where
  \<open>P_0x2a67_6 \<sigma> \<equiv> RIP \<sigma> = 0x2a67 \<and> RAX \<sigma> = printf_chk_0x2a62_retval \<and> RBX \<sigma> = RSI\<^sub>0 \<and> RCX \<sigma> = 0x3140 \<and> RDX \<sigma> = 0x3143 \<and> RDI \<sigma> = 0x1 \<and> RSI \<sigma> = 0x3028 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x38) \<and> RBP \<sigma> = RCX\<^sub>0 \<and> R14 \<sigma> = R14\<^sub>0 \<and> R13 \<sigma> = ucast ((\<langle>31,0\<rangle>R8\<^sub>0::32 word)) \<and> R12 \<sigma> = ucast ((\<langle>31,0\<rangle>RDX\<^sub>0::32 word)) \<and> R9 \<sigma> = 0x33b9 \<and> R8 \<sigma> = 0x33a4 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = 0x3409 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x38),8]::64 word) = 0x33ce \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = 0x2a67\<close>
declare P_0x2a67_6_def[Ps]

definition P_0x2a67_6_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x2a67_6_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (2, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x38), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x40), 8)
  }\<close>

definition P_0x2a67_6_regions :: state_pred where
  \<open>P_0x2a67_6_regions \<sigma> \<equiv> \<exists>regions. P_0x2a67_6_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x2a6c_6 :: state_pred where
  \<open>Q_0x2a6c_6 \<sigma> \<equiv> RIP \<sigma> = 0x2a6c \<and> RAX \<sigma> = printf_chk_0x2a62_retval \<and> RBX \<sigma> = RSI\<^sub>0 \<and> RCX \<sigma> = 0x33ce \<and> RDX \<sigma> = 0x3143 \<and> RDI \<sigma> = 0x1 \<and> RSI \<sigma> = 0x3409 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x28) \<and> RBP \<sigma> = RCX\<^sub>0 \<and> R14 \<sigma> = R14\<^sub>0 \<and> R13 \<sigma> = ucast ((\<langle>31,0\<rangle>R8\<^sub>0::32 word)) \<and> R12 \<sigma> = ucast ((\<langle>31,0\<rangle>RDX\<^sub>0::32 word)) \<and> R9 \<sigma> = 0x33b9 \<and> R8 \<sigma> = 0x33a4 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = 0x3409 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x38),8]::64 word) = 0x33ce \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = 0x2a67\<close>
declare Q_0x2a6c_6_def[Qs]

schematic_goal print_policy_0_3_0x2a67_0x2a69_6[blocks]:
  assumes \<open>(P_0x2a67_6 && P_0x2a67_6_regions) \<sigma>\<close>
  shows \<open>exec_block 3 0x2a69 6 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x2a6c_6 ?\<sigma> \<and> block_usage P_0x2a67_6_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x2a67_6_def P_0x2a67_6_regions_def post: Q_0x2a6c_6_def regionset: P_0x2a67_6_regions_set_def)

definition P_0x2a6c_true_7 :: state_pred where
  \<open>P_0x2a6c_true_7 \<sigma> \<equiv> RIP \<sigma> = 0x2a6c \<and> RAX \<sigma> = printf_chk_0x2a62_retval \<and> RBX \<sigma> = RSI\<^sub>0 \<and> RCX \<sigma> = 0x33ce \<and> RDX \<sigma> = 0x3143 \<and> RDI \<sigma> = 0x1 \<and> RSI \<sigma> = 0x3409 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x28) \<and> RBP \<sigma> = RCX\<^sub>0 \<and> R14 \<sigma> = R14\<^sub>0 \<and> R13 \<sigma> = ucast ((\<langle>31,0\<rangle>R8\<^sub>0::32 word)) \<and> R12 \<sigma> = ucast ((\<langle>31,0\<rangle>RDX\<^sub>0::32 word)) \<and> R9 \<sigma> = 0x33b9 \<and> R8 \<sigma> = 0x33a4 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = 0x3409 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x38),8]::64 word) = 0x33ce \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = 0x2a67\<close>
declare P_0x2a6c_true_7_def[Ps]

definition P_0x2a6c_true_7_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x2a6c_true_7_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (2, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x38), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x40), 8)
  }\<close>

definition P_0x2a6c_true_7_regions :: state_pred where
  \<open>P_0x2a6c_true_7_regions \<sigma> \<equiv> \<exists>regions. P_0x2a6c_true_7_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x2ac3_7 :: state_pred where
  \<open>Q_0x2ac3_7 \<sigma> \<equiv> RIP \<sigma> = 0x2ac3 \<and> RDI \<sigma> = 0x1 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x28) \<and> RBP \<sigma> = RCX\<^sub>0 \<and> R13 \<sigma> = ucast ((\<langle>31,0\<rangle>R8\<^sub>0::32 word)) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBX\<^sub>0\<close>
declare Q_0x2ac3_7_def[Qs]

schematic_goal print_policy_0_1_0x2a6c_0x2a6c_7[blocks]:
  assumes \<open>(P_0x2a6c_true_7 && P_0x2a6c_true_7_regions && ZF) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x2a6c 7 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x2ac3_7 ?\<sigma> \<and> block_usage P_0x2a6c_true_7_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x2a6c_true_7_def P_0x2a6c_true_7_regions_def post: Q_0x2ac3_7_def regionset: P_0x2a6c_true_7_regions_set_def)

definition P_0x2a6c_false_8 :: state_pred where
  \<open>P_0x2a6c_false_8 \<sigma> \<equiv> RIP \<sigma> = 0x2a6c \<and> RAX \<sigma> = printf_chk_0x2a62_retval \<and> RBX \<sigma> = RSI\<^sub>0 \<and> RCX \<sigma> = 0x33ce \<and> RDX \<sigma> = 0x3143 \<and> RDI \<sigma> = 0x1 \<and> RSI \<sigma> = 0x3409 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x28) \<and> RBP \<sigma> = RCX\<^sub>0 \<and> R14 \<sigma> = R14\<^sub>0 \<and> R13 \<sigma> = ucast ((\<langle>31,0\<rangle>R8\<^sub>0::32 word)) \<and> R12 \<sigma> = ucast ((\<langle>31,0\<rangle>RDX\<^sub>0::32 word)) \<and> R9 \<sigma> = 0x33b9 \<and> R8 \<sigma> = 0x33a4 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = 0x3409 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x38),8]::64 word) = 0x33ce \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = 0x2a67\<close>
declare P_0x2a6c_false_8_def[Ps]

definition P_0x2a6c_false_8_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x2a6c_false_8_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (2, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x38), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x40), 8)
  }\<close>

definition P_0x2a6c_false_8_regions :: state_pred where
  \<open>P_0x2a6c_false_8_regions \<sigma> \<equiv> \<exists>regions. P_0x2a6c_false_8_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x2a88_8 :: state_pred where
  \<open>Q_0x2a88_8 \<sigma> \<equiv> RIP \<sigma> = 0x2a88 \<and> RDI \<sigma> = 0x1 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x28) \<and> RBP \<sigma> = RCX\<^sub>0 \<and> R14 \<sigma> = 0x3050 \<and> R13 \<sigma> = ucast ((\<langle>31,0\<rangle>R8\<^sub>0::32 word)) \<and> R12 \<sigma> = ((RSI\<^sub>0::64 word) + (((\<langle>63,0\<rangle>((((ucast((\<langle>31,0\<rangle>((ucast((\<langle>31,0\<rangle>RDX\<^sub>0::32 word))::64 word) - (0x1::64 word))::32 word))::64 word) + ((\<langle>63,0\<rangle>((ucast((\<langle>31,0\<rangle>((ucast((\<langle>31,0\<rangle>RDX\<^sub>0::32 word))::64 word) - (0x1::64 word))::32 word))::64 word) * (0x2::64 word))::64 word)::64 word))::64 word) * 0x8)::64 word)::64 word) + 0x18)) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBX\<^sub>0\<close>
declare Q_0x2a88_8_def[Qs]

schematic_goal print_policy_0_6_0x2a6c_0x2a83_8[blocks]:
  assumes \<open>(P_0x2a6c_false_8 && P_0x2a6c_false_8_regions && ! ZF) \<sigma>\<close>
  shows \<open>exec_block 6 0x2a83 8 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x2a88_8 ?\<sigma> \<and> block_usage P_0x2a6c_false_8_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x2a6c_false_8_def P_0x2a6c_false_8_regions_def post: Q_0x2a88_8_def regionset: P_0x2a6c_false_8_regions_set_def)

definition P_0x2a88_9 :: state_pred where
  \<open>P_0x2a88_9 \<sigma> \<equiv> RIP \<sigma> = 0x2a88 \<and> RDI \<sigma> = 0x1 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x28) \<and> RBP \<sigma> = RCX\<^sub>0 \<and> R14 \<sigma> = 0x3050 \<and> R13 \<sigma> = ucast ((\<langle>31,0\<rangle>R8\<^sub>0::32 word)) \<and> R12 \<sigma> = ((RSI\<^sub>0::64 word) + (((\<langle>63,0\<rangle>((((ucast((\<langle>31,0\<rangle>((ucast((\<langle>31,0\<rangle>RDX\<^sub>0::32 word))::64 word) - (0x1::64 word))::32 word))::64 word) + ((\<langle>63,0\<rangle>((ucast((\<langle>31,0\<rangle>((ucast((\<langle>31,0\<rangle>RDX\<^sub>0::32 word))::64 word) - (0x1::64 word))::32 word))::64 word) * (0x2::64 word))::64 word)::64 word))::64 word) * 0x8)::64 word)::64 word) + 0x18)) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBX\<^sub>0\<close>
declare P_0x2a88_9_def[Ps]

definition P_0x2a88_9_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x2a88_9_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((RBX \<sigma>::64 word) + 0x8), 4),
    (2, ((RBX \<sigma>::64 word) + 0xc), 4),
    (3, ((RBX \<sigma>::64 word) + 0x10), 4),
    (4, ((RBX \<sigma>::64 word) + 0x14), 4),
    (5, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x28), 8)
  }\<close>

definition P_0x2a88_9_regions :: state_pred where
  \<open>P_0x2a88_9_regions \<sigma> \<equiv> \<exists>regions. P_0x2a88_9_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x2aa0_9 :: state_pred where
  \<open>Q_0x2aa0_9 \<sigma> \<equiv> RIP \<sigma> = 0x2aa0 \<and> RAX \<sigma> = ucast ((((((((\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x8),4]::32 word)::32 word) OR (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0xc),4]::32 word))::32 word) OR (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x14),4]::32 word))::32 word) OR (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x10),4]::32 word))) \<and> RDX \<sigma> = ucast ((\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x10),4]::32 word)) \<and> RDI \<sigma> = 0x1 \<and> RSI \<sigma> = ucast ((\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x14),4]::32 word)) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x28) \<and> RBP \<sigma> = RCX\<^sub>0 \<and> R14 \<sigma> = 0x3050 \<and> R13 \<sigma> = ucast ((\<langle>31,0\<rangle>R8\<^sub>0::32 word)) \<and> R12 \<sigma> = ((RSI\<^sub>0::64 word) + (((\<langle>63,0\<rangle>((((ucast((\<langle>31,0\<rangle>((ucast((\<langle>31,0\<rangle>RDX\<^sub>0::32 word))::64 word) - (0x1::64 word))::32 word))::64 word) + ((\<langle>63,0\<rangle>((ucast((\<langle>31,0\<rangle>((ucast((\<langle>31,0\<rangle>RDX\<^sub>0::32 word))::64 word) - (0x1::64 word))::32 word))::64 word) * (0x2::64 word))::64 word)::64 word))::64 word) * 0x8)::64 word)::64 word) + 0x18)) \<and> R9 \<sigma> = ucast ((\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0xc),4]::32 word)) \<and> R8 \<sigma> = ucast ((\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x8),4]::32 word)) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x8),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x8),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0xc),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0xc),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x10),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x10),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x14),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x14),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBX\<^sub>0\<close>
declare Q_0x2aa0_9_def[Qs]

schematic_goal print_policy_0_8_0x2a88_0x2a9e_9[blocks]:
  assumes \<open>(P_0x2a88_9 && P_0x2a88_9_regions) \<sigma>\<close>
  shows \<open>exec_block 8 0x2a9e 9 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x2aa0_9 ?\<sigma> \<and> block_usage P_0x2a88_9_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x2a88_9_def P_0x2a88_9_regions_def post: Q_0x2aa0_9_def regionset: P_0x2a88_9_regions_set_def)

definition P_0x2aa0_true_10 :: state_pred where
  \<open>P_0x2aa0_true_10 \<sigma> \<equiv> RIP \<sigma> = 0x2aa0 \<and> RAX \<sigma> = ucast ((((((((\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x8),4]::32 word)::32 word) OR (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0xc),4]::32 word))::32 word) OR (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x14),4]::32 word))::32 word) OR (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x10),4]::32 word))) \<and> RDX \<sigma> = ucast ((\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x10),4]::32 word)) \<and> RDI \<sigma> = 0x1 \<and> RSI \<sigma> = ucast ((\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x14),4]::32 word)) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x28) \<and> RBP \<sigma> = RCX\<^sub>0 \<and> R14 \<sigma> = 0x3050 \<and> R13 \<sigma> = ucast ((\<langle>31,0\<rangle>R8\<^sub>0::32 word)) \<and> R12 \<sigma> = ((RSI\<^sub>0::64 word) + (((\<langle>63,0\<rangle>((((ucast((\<langle>31,0\<rangle>((ucast((\<langle>31,0\<rangle>RDX\<^sub>0::32 word))::64 word) - (0x1::64 word))::32 word))::64 word) + ((\<langle>63,0\<rangle>((ucast((\<langle>31,0\<rangle>((ucast((\<langle>31,0\<rangle>RDX\<^sub>0::32 word))::64 word) - (0x1::64 word))::32 word))::64 word) * (0x2::64 word))::64 word)::64 word))::64 word) * 0x8)::64 word)::64 word) + 0x18)) \<and> R9 \<sigma> = ucast ((\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0xc),4]::32 word)) \<and> R8 \<sigma> = ucast ((\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x8),4]::32 word)) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x8),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x8),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0xc),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0xc),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x10),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x10),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x14),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x14),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBX\<^sub>0\<close>
declare P_0x2aa0_true_10_def[Ps]

definition P_0x2aa0_true_10_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x2aa0_true_10_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((RBX \<sigma>::64 word) + 0x8), 4),
    (2, ((RBX \<sigma>::64 word) + 0xc), 4),
    (3, ((RBX \<sigma>::64 word) + 0x10), 4),
    (4, ((RBX \<sigma>::64 word) + 0x14), 4),
    (5, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x28), 8)
  }\<close>

definition P_0x2aa0_true_10_regions :: state_pred where
  \<open>P_0x2aa0_true_10_regions \<sigma> \<equiv> \<exists>regions. P_0x2aa0_true_10_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x2aba_10 :: state_pred where
  \<open>Q_0x2aba_10 \<sigma> \<equiv> RIP \<sigma> = 0x2aba \<and> RDI \<sigma> = 0x1 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x28) \<and> RBP \<sigma> = RCX\<^sub>0 \<and> R14 \<sigma> = 0x3050 \<and> R13 \<sigma> = ucast ((\<langle>31,0\<rangle>R8\<^sub>0::32 word)) \<and> R12 \<sigma> = ((RSI\<^sub>0::64 word) + (((\<langle>63,0\<rangle>((((ucast((\<langle>31,0\<rangle>((ucast((\<langle>31,0\<rangle>RDX\<^sub>0::32 word))::64 word) - (0x1::64 word))::32 word))::64 word) + ((\<langle>63,0\<rangle>((ucast((\<langle>31,0\<rangle>((ucast((\<langle>31,0\<rangle>RDX\<^sub>0::32 word))::64 word) - (0x1::64 word))::32 word))::64 word) * (0x2::64 word))::64 word)::64 word))::64 word) * 0x8)::64 word)::64 word) + 0x18)) \<and> R9 \<sigma> = ucast ((\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0xc),4]::32 word)) \<and> R8 \<sigma> = ucast ((\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x8),4]::32 word)) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x8),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x8),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0xc),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0xc),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x10),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x10),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x14),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x14),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBX\<^sub>0\<close>
declare Q_0x2aba_10_def[Qs]

schematic_goal print_policy_0_1_0x2aa0_0x2aa0_10[blocks]:
  assumes \<open>(P_0x2aa0_true_10 && P_0x2aa0_true_10_regions && ZF) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x2aa0 10 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x2aba_10 ?\<sigma> \<and> block_usage P_0x2aa0_true_10_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x2aa0_true_10_def P_0x2aa0_true_10_regions_def post: Q_0x2aba_10_def regionset: P_0x2aa0_true_10_regions_set_def)

definition P_0x2aa0_false_11 :: state_pred where
  \<open>P_0x2aa0_false_11 \<sigma> \<equiv> RIP \<sigma> = 0x2aa0 \<and> RAX \<sigma> = ucast ((((((((\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x8),4]::32 word)::32 word) OR (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0xc),4]::32 word))::32 word) OR (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x14),4]::32 word))::32 word) OR (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x10),4]::32 word))) \<and> RDX \<sigma> = ucast ((\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x10),4]::32 word)) \<and> RDI \<sigma> = 0x1 \<and> RSI \<sigma> = ucast ((\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x14),4]::32 word)) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x28) \<and> RBP \<sigma> = RCX\<^sub>0 \<and> R14 \<sigma> = 0x3050 \<and> R13 \<sigma> = ucast ((\<langle>31,0\<rangle>R8\<^sub>0::32 word)) \<and> R12 \<sigma> = ((RSI\<^sub>0::64 word) + (((\<langle>63,0\<rangle>((((ucast((\<langle>31,0\<rangle>((ucast((\<langle>31,0\<rangle>RDX\<^sub>0::32 word))::64 word) - (0x1::64 word))::32 word))::64 word) + ((\<langle>63,0\<rangle>((ucast((\<langle>31,0\<rangle>((ucast((\<langle>31,0\<rangle>RDX\<^sub>0::32 word))::64 word) - (0x1::64 word))::32 word))::64 word) * (0x2::64 word))::64 word)::64 word))::64 word) * 0x8)::64 word)::64 word) + 0x18)) \<and> R9 \<sigma> = ucast ((\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0xc),4]::32 word)) \<and> R8 \<sigma> = ucast ((\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x8),4]::32 word)) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x8),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x8),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0xc),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0xc),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x10),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x10),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x14),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x14),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBX\<^sub>0\<close>
declare P_0x2aa0_false_11_def[Ps]

definition P_0x2aa0_false_11_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x2aa0_false_11_regions_set \<sigma> \<equiv> {
    (0, RBX \<sigma>, 4),
    (1, RSP\<^sub>0, 8),
    (2, ((RBX \<sigma>::64 word) + 0x4), 4),
    (3, ((RBX \<sigma>::64 word) + 0x8), 4),
    (4, ((RBX \<sigma>::64 word) + 0xc), 4),
    (5, ((RBX \<sigma>::64 word) + 0x10), 4),
    (6, ((RBX \<sigma>::64 word) + 0x14), 4),
    (7, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (11, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (12, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (13, ((RSP\<^sub>0::64 word) - 0x38), 8)
  }\<close>

definition P_0x2aa0_false_11_regions :: state_pred where
  \<open>P_0x2aa0_false_11_regions \<sigma> \<equiv> \<exists>regions. P_0x2aa0_false_11_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x2ab3_11 :: state_pred where
  \<open>Q_0x2ab3_11 \<sigma> \<equiv> RIP \<sigma> = 0x2ab3 \<and> RAX \<sigma> = 0x0 \<and> RCX \<sigma> = ucast ((\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x4),4]::32 word)) \<and> RDX \<sigma> = ucast ((\<sigma> \<turnstile> *[RBX \<sigma>,4]::32 word)) \<and> RDI \<sigma> = 0x1 \<and> RSI \<sigma> = 0x3050 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x38) \<and> RBP \<sigma> = RCX\<^sub>0 \<and> R14 \<sigma> = 0x3050 \<and> R13 \<sigma> = ucast ((\<langle>31,0\<rangle>R8\<^sub>0::32 word)) \<and> R12 \<sigma> = ((RSI\<^sub>0::64 word) + (((\<langle>63,0\<rangle>((((ucast((\<langle>31,0\<rangle>((ucast((\<langle>31,0\<rangle>RDX\<^sub>0::32 word))::64 word) - (0x1::64 word))::32 word))::64 word) + ((\<langle>63,0\<rangle>((ucast((\<langle>31,0\<rangle>((ucast((\<langle>31,0\<rangle>RDX\<^sub>0::32 word))::64 word) - (0x1::64 word))::32 word))::64 word) * (0x2::64 word))::64 word)::64 word))::64 word) * 0x8)::64 word)::64 word) + 0x18)) \<and> R9 \<sigma> = ucast ((\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0xc),4]::32 word)) \<and> R8 \<sigma> = ucast ((\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x8),4]::32 word)) \<and> (\<sigma> \<turnstile> *[RBX \<sigma>,4]::32 word) = ucast ((\<sigma> \<turnstile> *[RBX \<sigma>,4]::32 word)) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x4),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x4),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x8),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x8),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0xc),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0xc),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x10),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x10),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x14),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x14),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = ucast ((\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x14),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x38),8]::64 word) = ucast ((\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x10),4]::32 word))\<close>
declare Q_0x2ab3_11_def[Qs]

schematic_goal print_policy_0_8_0x2aa0_0x2ab1_11[blocks]:
  assumes \<open>(P_0x2aa0_false_11 && P_0x2aa0_false_11_regions && ! ZF) \<sigma>\<close>
  shows \<open>exec_block 8 0x2ab1 11 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x2ab3_11 ?\<sigma> \<and> block_usage P_0x2aa0_false_11_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x2aa0_false_11_def P_0x2aa0_false_11_regions_def post: Q_0x2ab3_11_def regionset: P_0x2aa0_false_11_regions_set_def)

definition P_0x2ab3_12 :: state_pred where
  \<open>P_0x2ab3_12 \<sigma> \<equiv> RIP \<sigma> = 0x2ab3 \<and> RAX \<sigma> = 0x0 \<and> RCX \<sigma> = ucast ((\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x4),4]::32 word)) \<and> RDX \<sigma> = ucast ((\<sigma> \<turnstile> *[RBX \<sigma>,4]::32 word)) \<and> RDI \<sigma> = 0x1 \<and> RSI \<sigma> = 0x3050 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x38) \<and> RBP \<sigma> = RCX\<^sub>0 \<and> R14 \<sigma> = 0x3050 \<and> R13 \<sigma> = ucast ((\<langle>31,0\<rangle>R8\<^sub>0::32 word)) \<and> R12 \<sigma> = ((RSI\<^sub>0::64 word) + (((\<langle>63,0\<rangle>((((ucast((\<langle>31,0\<rangle>((ucast((\<langle>31,0\<rangle>RDX\<^sub>0::32 word))::64 word) - (0x1::64 word))::32 word))::64 word) + ((\<langle>63,0\<rangle>((ucast((\<langle>31,0\<rangle>((ucast((\<langle>31,0\<rangle>RDX\<^sub>0::32 word))::64 word) - (0x1::64 word))::32 word))::64 word) * (0x2::64 word))::64 word)::64 word))::64 word) * 0x8)::64 word)::64 word) + 0x18)) \<and> R9 \<sigma> = ucast ((\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0xc),4]::32 word)) \<and> R8 \<sigma> = ucast ((\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x8),4]::32 word)) \<and> (\<sigma> \<turnstile> *[RBX \<sigma>,4]::32 word) = ucast ((\<sigma> \<turnstile> *[RBX \<sigma>,4]::32 word)) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x4),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x4),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x8),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x8),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0xc),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0xc),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x10),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x10),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x14),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x14),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = ucast ((\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x14),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x38),8]::64 word) = ucast ((\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x10),4]::32 word))\<close>
declare P_0x2ab3_12_def[Ps]

definition P_0x2ab3_12_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x2ab3_12_regions_set \<sigma> \<equiv> {
    (0, RBX \<sigma>, 4),
    (1, RSP\<^sub>0, 8),
    (2, ((RBX \<sigma>::64 word) + 0x4), 4),
    (3, ((RBX \<sigma>::64 word) + 0x8), 4),
    (4, ((RBX \<sigma>::64 word) + 0xc), 4),
    (5, ((RBX \<sigma>::64 word) + 0x10), 4),
    (6, ((RBX \<sigma>::64 word) + 0x14), 4),
    (7, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (11, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (12, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (13, ((RSP\<^sub>0::64 word) - 0x38), 8),
    (14, ((RSP\<^sub>0::64 word) - 0x40), 8)
  }\<close>

definition P_0x2ab3_12_regions :: state_pred where
  \<open>P_0x2ab3_12_regions \<sigma> \<equiv> \<exists>regions. P_0x2ab3_12_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_printf_chk_addr_0x2ab3_12 :: state_pred where
  \<open>Q_printf_chk_addr_0x2ab3_12 \<sigma> \<equiv> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x40) \<and> RIP \<sigma> = printf_chk_addr \<and> RAX \<sigma> = 0x0 \<and> RCX \<sigma> = ucast ((\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x4),4]::32 word)) \<and> RDX \<sigma> = ucast ((\<sigma> \<turnstile> *[RBX \<sigma>,4]::32 word)) \<and> RDI \<sigma> = 0x1 \<and> RSI \<sigma> = 0x3050 \<and> RBP \<sigma> = RCX\<^sub>0 \<and> R14 \<sigma> = 0x3050 \<and> R13 \<sigma> = ucast ((\<langle>31,0\<rangle>R8\<^sub>0::32 word)) \<and> R12 \<sigma> = ((RSI\<^sub>0::64 word) + (((\<langle>63,0\<rangle>((((ucast((\<langle>31,0\<rangle>((ucast((\<langle>31,0\<rangle>RDX\<^sub>0::32 word))::64 word) - (0x1::64 word))::32 word))::64 word) + ((\<langle>63,0\<rangle>((ucast((\<langle>31,0\<rangle>((ucast((\<langle>31,0\<rangle>RDX\<^sub>0::32 word))::64 word) - (0x1::64 word))::32 word))::64 word) * (0x2::64 word))::64 word)::64 word))::64 word) * 0x8)::64 word)::64 word) + 0x18)) \<and> R9 \<sigma> = ucast ((\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0xc),4]::32 word)) \<and> R8 \<sigma> = ucast ((\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x8),4]::32 word)) \<and> (\<sigma> \<turnstile> *[RBX \<sigma>,4]::32 word) = ucast ((\<sigma> \<turnstile> *[RBX \<sigma>,4]::32 word)) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x4),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x4),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x8),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x8),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0xc),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0xc),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x10),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x10),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x14),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x14),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = ucast ((\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x14),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x38),8]::64 word) = ucast ((\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x10),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = 0x2ab8\<close>
declare Q_printf_chk_addr_0x2ab3_12_def[Qs]

schematic_goal print_policy_0_1_0x2ab3_0x2ab3_12[blocks]:
  assumes \<open>(P_0x2ab3_12 && P_0x2ab3_12_regions) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x2ab3 12 \<sigma> \<triangleq> ?\<sigma> \<and> Q_printf_chk_addr_0x2ab3_12 ?\<sigma> \<and> block_usage P_0x2ab3_12_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x2ab3_12_def P_0x2ab3_12_regions_def post: Q_printf_chk_addr_0x2ab3_12_def regionset: P_0x2ab3_12_regions_set_def)

definition P_0x2ab8_13 :: state_pred where
  \<open>P_0x2ab8_13 \<sigma> \<equiv> RIP \<sigma> = 0x2ab8 \<and> RAX \<sigma> = printf_chk_0x2ab3_retval \<and> RCX \<sigma> = ucast ((\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x4),4]::32 word)) \<and> RDX \<sigma> = ucast ((\<sigma> \<turnstile> *[RBX \<sigma>,4]::32 word)) \<and> RDI \<sigma> = 0x1 \<and> RSI \<sigma> = 0x3050 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x38) \<and> RBP \<sigma> = RCX\<^sub>0 \<and> R14 \<sigma> = 0x3050 \<and> R13 \<sigma> = ucast ((\<langle>31,0\<rangle>R8\<^sub>0::32 word)) \<and> R12 \<sigma> = ((RSI\<^sub>0::64 word) + (((\<langle>63,0\<rangle>((((ucast((\<langle>31,0\<rangle>((ucast((\<langle>31,0\<rangle>RDX\<^sub>0::32 word))::64 word) - (0x1::64 word))::32 word))::64 word) + ((\<langle>63,0\<rangle>((ucast((\<langle>31,0\<rangle>((ucast((\<langle>31,0\<rangle>RDX\<^sub>0::32 word))::64 word) - (0x1::64 word))::32 word))::64 word) * (0x2::64 word))::64 word)::64 word))::64 word) * 0x8)::64 word)::64 word) + 0x18)) \<and> R9 \<sigma> = ucast ((\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0xc),4]::32 word)) \<and> R8 \<sigma> = ucast ((\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x8),4]::32 word)) \<and> (\<sigma> \<turnstile> *[RBX \<sigma>,4]::32 word) = ucast ((\<sigma> \<turnstile> *[RBX \<sigma>,4]::32 word)) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x4),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x4),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x8),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x8),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0xc),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0xc),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x10),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x10),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x14),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x14),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = ucast ((\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x14),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x38),8]::64 word) = ucast ((\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x10),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = 0x2ab8\<close>
declare P_0x2ab8_13_def[Ps]

definition P_0x2ab8_13_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x2ab8_13_regions_set \<sigma> \<equiv> {
    (0, RBX \<sigma>, 4),
    (1, RSP\<^sub>0, 8),
    (2, ((RBX \<sigma>::64 word) + 0x4), 4),
    (3, ((RBX \<sigma>::64 word) + 0x8), 4),
    (4, ((RBX \<sigma>::64 word) + 0xc), 4),
    (5, ((RBX \<sigma>::64 word) + 0x10), 4),
    (6, ((RBX \<sigma>::64 word) + 0x14), 4),
    (7, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (11, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (12, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (13, ((RSP\<^sub>0::64 word) - 0x38), 8),
    (14, ((RSP\<^sub>0::64 word) - 0x40), 8)
  }\<close>

definition P_0x2ab8_13_regions :: state_pred where
  \<open>P_0x2ab8_13_regions \<sigma> \<equiv> \<exists>regions. P_0x2ab8_13_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x2aba_13 :: state_pred where
  \<open>Q_0x2aba_13 \<sigma> \<equiv> RIP \<sigma> = 0x2aba \<and> RDI \<sigma> = 0x1 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x28) \<and> RBP \<sigma> = RCX\<^sub>0 \<and> R14 \<sigma> = 0x3050 \<and> R13 \<sigma> = ucast ((\<langle>31,0\<rangle>R8\<^sub>0::32 word)) \<and> R12 \<sigma> = ((RSI\<^sub>0::64 word) + (((\<langle>63,0\<rangle>((((ucast((\<langle>31,0\<rangle>((ucast((\<langle>31,0\<rangle>RDX\<^sub>0::32 word))::64 word) - (0x1::64 word))::32 word))::64 word) + ((\<langle>63,0\<rangle>((ucast((\<langle>31,0\<rangle>((ucast((\<langle>31,0\<rangle>RDX\<^sub>0::32 word))::64 word) - (0x1::64 word))::32 word))::64 word) * (0x2::64 word))::64 word)::64 word))::64 word) * 0x8)::64 word)::64 word) + 0x18)) \<and> R9 \<sigma> = ucast ((\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0xc),4]::32 word)) \<and> R8 \<sigma> = ucast ((\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x8),4]::32 word)) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x8),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x8),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0xc),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0xc),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x10),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x10),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x14),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x14),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBX\<^sub>0\<close>
declare Q_0x2aba_13_def[Qs]

schematic_goal print_policy_0_2_0x2ab8_0x2ab9_13[blocks]:
  assumes \<open>(P_0x2ab8_13 && P_0x2ab8_13_regions) \<sigma>\<close>
  shows \<open>exec_block 2 0x2ab9 13 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x2aba_13 ?\<sigma> \<and> block_usage P_0x2ab8_13_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x2ab8_13_def P_0x2ab8_13_regions_def post: Q_0x2aba_13_def regionset: P_0x2ab8_13_regions_set_def)

definition P_0x2aba_14 :: state_pred where
  \<open>P_0x2aba_14 \<sigma> \<equiv> RIP \<sigma> = 0x2aba \<and> RDI \<sigma> = 0x1 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x28) \<and> RBP \<sigma> = RCX\<^sub>0 \<and> R14 \<sigma> = 0x3050 \<and> R13 \<sigma> = ucast ((\<langle>31,0\<rangle>R8\<^sub>0::32 word)) \<and> R12 \<sigma> = ((RSI\<^sub>0::64 word) + (((\<langle>63,0\<rangle>((((ucast((\<langle>31,0\<rangle>((ucast((\<langle>31,0\<rangle>RDX\<^sub>0::32 word))::64 word) - (0x1::64 word))::32 word))::64 word) + ((\<langle>63,0\<rangle>((ucast((\<langle>31,0\<rangle>((ucast((\<langle>31,0\<rangle>RDX\<^sub>0::32 word))::64 word) - (0x1::64 word))::32 word))::64 word) * (0x2::64 word))::64 word)::64 word))::64 word) * 0x8)::64 word)::64 word) + 0x18)) \<and> R9 \<sigma> = ucast ((\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0xc),4]::32 word)) \<and> R8 \<sigma> = ucast ((\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x8),4]::32 word)) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x8),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x8),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0xc),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0xc),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x10),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x10),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x14),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x14),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBX\<^sub>0\<close>
declare P_0x2aba_14_def[Ps]

definition P_0x2aba_14_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x2aba_14_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((RBX \<sigma>::64 word) + 0x8), 4),
    (2, ((RBX \<sigma>::64 word) + 0xc), 4),
    (3, ((RBX \<sigma>::64 word) + 0x10), 4),
    (4, ((RBX \<sigma>::64 word) + 0x14), 4),
    (5, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x28), 8)
  }\<close>

definition P_0x2aba_14_regions :: state_pred where
  \<open>P_0x2aba_14_regions \<sigma> \<equiv> \<exists>regions. P_0x2aba_14_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x2ac1_14 :: state_pred where
  \<open>Q_0x2ac1_14 \<sigma> \<equiv> RIP \<sigma> = 0x2ac1 \<and> RDI \<sigma> = 0x1 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x28) \<and> RBP \<sigma> = RCX\<^sub>0 \<and> R14 \<sigma> = 0x3050 \<and> R13 \<sigma> = ucast ((\<langle>31,0\<rangle>R8\<^sub>0::32 word)) \<and> R12 \<sigma> = ((RSI\<^sub>0::64 word) + (((\<langle>63,0\<rangle>((((ucast((\<langle>31,0\<rangle>((ucast((\<langle>31,0\<rangle>RDX\<^sub>0::32 word))::64 word) - (0x1::64 word))::32 word))::64 word) + ((\<langle>63,0\<rangle>((ucast((\<langle>31,0\<rangle>((ucast((\<langle>31,0\<rangle>RDX\<^sub>0::32 word))::64 word) - (0x1::64 word))::32 word))::64 word) * (0x2::64 word))::64 word)::64 word))::64 word) * 0x8)::64 word)::64 word) + 0x18)) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBX\<^sub>0\<close>
declare Q_0x2ac1_14_def[Qs]

schematic_goal print_policy_0_2_0x2aba_0x2abe_14[blocks]:
  assumes \<open>(P_0x2aba_14 && P_0x2aba_14_regions) \<sigma>\<close>
  shows \<open>exec_block 2 0x2abe 14 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x2ac1_14 ?\<sigma> \<and> block_usage P_0x2aba_14_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x2aba_14_def P_0x2aba_14_regions_def post: Q_0x2ac1_14_def regionset: P_0x2aba_14_regions_set_def)

definition P_0x2ac1_true_15 :: state_pred where
  \<open>P_0x2ac1_true_15 \<sigma> \<equiv> RIP \<sigma> = 0x2ac1 \<and> RDI \<sigma> = 0x1 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x28) \<and> RBP \<sigma> = RCX\<^sub>0 \<and> R14 \<sigma> = 0x3050 \<and> R13 \<sigma> = ucast ((\<langle>31,0\<rangle>R8\<^sub>0::32 word)) \<and> R12 \<sigma> = ((RSI\<^sub>0::64 word) + (((\<langle>63,0\<rangle>((((ucast((\<langle>31,0\<rangle>((ucast((\<langle>31,0\<rangle>RDX\<^sub>0::32 word))::64 word) - (0x1::64 word))::32 word))::64 word) + ((\<langle>63,0\<rangle>((ucast((\<langle>31,0\<rangle>((ucast((\<langle>31,0\<rangle>RDX\<^sub>0::32 word))::64 word) - (0x1::64 word))::32 word))::64 word) * (0x2::64 word))::64 word)::64 word))::64 word) * 0x8)::64 word)::64 word) + 0x18)) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBX\<^sub>0\<close>
declare P_0x2ac1_true_15_def[Ps]

definition P_0x2ac1_true_15_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x2ac1_true_15_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (2, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x28), 8)
  }\<close>

definition P_0x2ac1_true_15_regions :: state_pred where
  \<open>P_0x2ac1_true_15_regions \<sigma> \<equiv> \<exists>regions. P_0x2ac1_true_15_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x2a88_15 :: state_pred where
  \<open>Q_0x2a88_15 \<sigma> \<equiv> RIP \<sigma> = 0x2a88 \<and> RDI \<sigma> = 0x1 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x28) \<and> RBP \<sigma> = RCX\<^sub>0 \<and> R14 \<sigma> = 0x3050 \<and> R13 \<sigma> = ucast ((\<langle>31,0\<rangle>R8\<^sub>0::32 word)) \<and> R12 \<sigma> = ((RSI\<^sub>0::64 word) + (((\<langle>63,0\<rangle>((((ucast((\<langle>31,0\<rangle>((ucast((\<langle>31,0\<rangle>RDX\<^sub>0::32 word))::64 word) - (0x1::64 word))::32 word))::64 word) + ((\<langle>63,0\<rangle>((ucast((\<langle>31,0\<rangle>((ucast((\<langle>31,0\<rangle>RDX\<^sub>0::32 word))::64 word) - (0x1::64 word))::32 word))::64 word) * (0x2::64 word))::64 word)::64 word))::64 word) * 0x8)::64 word)::64 word) + 0x18)) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBX\<^sub>0\<close>
declare Q_0x2a88_15_def[Qs]

schematic_goal print_policy_0_1_0x2ac1_0x2ac1_15[blocks]:
  assumes \<open>(P_0x2ac1_true_15 && P_0x2ac1_true_15_regions && !ZF) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x2ac1 15 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x2a88_15 ?\<sigma> \<and> block_usage P_0x2ac1_true_15_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x2ac1_true_15_def P_0x2ac1_true_15_regions_def post: Q_0x2a88_15_def regionset: P_0x2ac1_true_15_regions_set_def)

definition P_0x2ac1_false_16 :: state_pred where
  \<open>P_0x2ac1_false_16 \<sigma> \<equiv> RIP \<sigma> = 0x2ac1 \<and> RDI \<sigma> = 0x1 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x28) \<and> RBP \<sigma> = RCX\<^sub>0 \<and> R14 \<sigma> = 0x3050 \<and> R13 \<sigma> = ucast ((\<langle>31,0\<rangle>R8\<^sub>0::32 word)) \<and> R12 \<sigma> = ((RSI\<^sub>0::64 word) + (((\<langle>63,0\<rangle>((((ucast((\<langle>31,0\<rangle>((ucast((\<langle>31,0\<rangle>RDX\<^sub>0::32 word))::64 word) - (0x1::64 word))::32 word))::64 word) + ((\<langle>63,0\<rangle>((ucast((\<langle>31,0\<rangle>((ucast((\<langle>31,0\<rangle>RDX\<^sub>0::32 word))::64 word) - (0x1::64 word))::32 word))::64 word) * (0x2::64 word))::64 word)::64 word))::64 word) * 0x8)::64 word)::64 word) + 0x18)) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBX\<^sub>0\<close>
declare P_0x2ac1_false_16_def[Ps]

definition P_0x2ac1_false_16_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x2ac1_false_16_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (2, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x28), 8)
  }\<close>

definition P_0x2ac1_false_16_regions :: state_pred where
  \<open>P_0x2ac1_false_16_regions \<sigma> \<equiv> \<exists>regions. P_0x2ac1_false_16_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x2ac3_16 :: state_pred where
  \<open>Q_0x2ac3_16 \<sigma> \<equiv> RIP \<sigma> = 0x2ac3 \<and> RDI \<sigma> = 0x1 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x28) \<and> RBP \<sigma> = RCX\<^sub>0 \<and> R14 \<sigma> = 0x3050 \<and> R13 \<sigma> = ucast ((\<langle>31,0\<rangle>R8\<^sub>0::32 word)) \<and> R12 \<sigma> = ((RSI\<^sub>0::64 word) + (((\<langle>63,0\<rangle>((((ucast((\<langle>31,0\<rangle>((ucast((\<langle>31,0\<rangle>RDX\<^sub>0::32 word))::64 word) - (0x1::64 word))::32 word))::64 word) + ((\<langle>63,0\<rangle>((ucast((\<langle>31,0\<rangle>((ucast((\<langle>31,0\<rangle>RDX\<^sub>0::32 word))::64 word) - (0x1::64 word))::32 word))::64 word) * (0x2::64 word))::64 word)::64 word))::64 word) * 0x8)::64 word)::64 word) + 0x18)) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBX\<^sub>0\<close>
declare Q_0x2ac3_16_def[Qs]

schematic_goal print_policy_0_1_0x2ac1_0x2ac1_16[blocks]:
  assumes \<open>(P_0x2ac1_false_16 && P_0x2ac1_false_16_regions && ! !ZF) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x2ac1 16 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x2ac3_16 ?\<sigma> \<and> block_usage P_0x2ac1_false_16_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x2ac1_false_16_def P_0x2ac1_false_16_regions_def post: Q_0x2ac3_16_def regionset: P_0x2ac1_false_16_regions_set_def)

definition P_0x2ac3_17 :: state_pred where
  \<open>P_0x2ac3_17 \<sigma> \<equiv> RIP \<sigma> = 0x2ac3 \<and> RDI \<sigma> = 0x1 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x28) \<and> RBP \<sigma> = RCX\<^sub>0 \<and> R13 \<sigma> = ucast ((\<langle>31,0\<rangle>R8\<^sub>0::32 word)) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBX\<^sub>0\<close>
declare P_0x2ac3_17_def[Ps]

definition P_0x2ac3_17_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x2ac3_17_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (2, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x28), 8)
  }\<close>

definition P_0x2ac3_17_regions :: state_pred where
  \<open>P_0x2ac3_17_regions \<sigma> \<equiv> \<exists>regions. P_0x2ac3_17_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x2aca_17 :: state_pred where
  \<open>Q_0x2aca_17 \<sigma> \<equiv> RIP \<sigma> = 0x2aca \<and> RDI \<sigma> = 0x3148 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x28) \<and> RBP \<sigma> = RCX\<^sub>0 \<and> R13 \<sigma> = ucast ((\<langle>31,0\<rangle>R8\<^sub>0::32 word)) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBX\<^sub>0\<close>
declare Q_0x2aca_17_def[Qs]

schematic_goal print_policy_0_1_0x2ac3_0x2ac3_17[blocks]:
  assumes \<open>(P_0x2ac3_17 && P_0x2ac3_17_regions) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x2ac3 17 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x2aca_17 ?\<sigma> \<and> block_usage P_0x2ac3_17_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x2ac3_17_def P_0x2ac3_17_regions_def post: Q_0x2aca_17_def regionset: P_0x2ac3_17_regions_set_def)

definition P_0x2aca_18 :: state_pred where
  \<open>P_0x2aca_18 \<sigma> \<equiv> RIP \<sigma> = 0x2aca \<and> RDI \<sigma> = 0x3148 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x28) \<and> RBP \<sigma> = RCX\<^sub>0 \<and> R13 \<sigma> = ucast ((\<langle>31,0\<rangle>R8\<^sub>0::32 word)) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBX\<^sub>0\<close>
declare P_0x2aca_18_def[Ps]

definition P_0x2aca_18_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x2aca_18_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (2, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x30), 8)
  }\<close>

definition P_0x2aca_18_regions :: state_pred where
  \<open>P_0x2aca_18_regions \<sigma> \<equiv> \<exists>regions. P_0x2aca_18_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_puts_addr_0x2aca_18 :: state_pred where
  \<open>Q_puts_addr_0x2aca_18 \<sigma> \<equiv> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x30) \<and> RIP \<sigma> = puts_addr \<and> RDI \<sigma> = 0x3148 \<and> RBP \<sigma> = RCX\<^sub>0 \<and> R13 \<sigma> = ucast ((\<langle>31,0\<rangle>R8\<^sub>0::32 word)) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = 0x2acf\<close>
declare Q_puts_addr_0x2aca_18_def[Qs]

schematic_goal print_policy_0_1_0x2aca_0x2aca_18[blocks]:
  assumes \<open>(P_0x2aca_18 && P_0x2aca_18_regions) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x2aca 18 \<sigma> \<triangleq> ?\<sigma> \<and> Q_puts_addr_0x2aca_18 ?\<sigma> \<and> block_usage P_0x2aca_18_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x2aca_18_def P_0x2aca_18_regions_def post: Q_puts_addr_0x2aca_18_def regionset: P_0x2aca_18_regions_set_def)

definition P_0x2acf_19 :: state_pred where
  \<open>P_0x2acf_19 \<sigma> \<equiv> RIP \<sigma> = 0x2acf \<and> RDI \<sigma> = 0x3148 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x28) \<and> RBP \<sigma> = RCX\<^sub>0 \<and> R13 \<sigma> = ucast ((\<langle>31,0\<rangle>R8\<^sub>0::32 word)) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = 0x2acf\<close>
declare P_0x2acf_19_def[Ps]

definition P_0x2acf_19_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x2acf_19_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (2, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x30), 8)
  }\<close>

definition P_0x2acf_19_regions :: state_pred where
  \<open>P_0x2acf_19_regions \<sigma> \<equiv> \<exists>regions. P_0x2acf_19_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x2aeb_19 :: state_pred where
  \<open>Q_0x2aeb_19 \<sigma> \<equiv> RIP \<sigma> = 0x2aeb \<and> RAX \<sigma> = 0x0 \<and> RCX \<sigma> = 0x314f \<and> RDX \<sigma> = 0x3155 \<and> RDI \<sigma> = 0x1 \<and> RSI \<sigma> = 0x315b \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x28) \<and> RBP \<sigma> = RCX\<^sub>0 \<and> R13 \<sigma> = ucast ((\<langle>31,0\<rangle>R8\<^sub>0::32 word)) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = 0x2acf\<close>
declare Q_0x2aeb_19_def[Qs]

schematic_goal print_policy_0_5_0x2acf_0x2ae6_19[blocks]:
  assumes \<open>(P_0x2acf_19 && P_0x2acf_19_regions) \<sigma>\<close>
  shows \<open>exec_block 5 0x2ae6 19 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x2aeb_19 ?\<sigma> \<and> block_usage P_0x2acf_19_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x2acf_19_def P_0x2acf_19_regions_def post: Q_0x2aeb_19_def regionset: P_0x2acf_19_regions_set_def)

definition P_0x2aeb_20 :: state_pred where
  \<open>P_0x2aeb_20 \<sigma> \<equiv> RIP \<sigma> = 0x2aeb \<and> RAX \<sigma> = 0x0 \<and> RCX \<sigma> = 0x314f \<and> RDX \<sigma> = 0x3155 \<and> RDI \<sigma> = 0x1 \<and> RSI \<sigma> = 0x315b \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x28) \<and> RBP \<sigma> = RCX\<^sub>0 \<and> R13 \<sigma> = ucast ((\<langle>31,0\<rangle>R8\<^sub>0::32 word)) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = 0x2acf\<close>
declare P_0x2aeb_20_def[Ps]

definition P_0x2aeb_20_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x2aeb_20_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (2, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x30), 8)
  }\<close>

definition P_0x2aeb_20_regions :: state_pred where
  \<open>P_0x2aeb_20_regions \<sigma> \<equiv> \<exists>regions. P_0x2aeb_20_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_printf_chk_addr_0x2aeb_20 :: state_pred where
  \<open>Q_printf_chk_addr_0x2aeb_20 \<sigma> \<equiv> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x30) \<and> RIP \<sigma> = printf_chk_addr \<and> RAX \<sigma> = 0x0 \<and> RCX \<sigma> = 0x314f \<and> RDX \<sigma> = 0x3155 \<and> RDI \<sigma> = 0x1 \<and> RSI \<sigma> = 0x315b \<and> RBP \<sigma> = RCX\<^sub>0 \<and> R13 \<sigma> = ucast ((\<langle>31,0\<rangle>R8\<^sub>0::32 word)) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = 0x2af0\<close>
declare Q_printf_chk_addr_0x2aeb_20_def[Qs]

schematic_goal print_policy_0_1_0x2aeb_0x2aeb_20[blocks]:
  assumes \<open>(P_0x2aeb_20 && P_0x2aeb_20_regions) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x2aeb 20 \<sigma> \<triangleq> ?\<sigma> \<and> Q_printf_chk_addr_0x2aeb_20 ?\<sigma> \<and> block_usage P_0x2aeb_20_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x2aeb_20_def P_0x2aeb_20_regions_def post: Q_printf_chk_addr_0x2aeb_20_def regionset: P_0x2aeb_20_regions_set_def)

definition P_0x2af0_21 :: state_pred where
  \<open>P_0x2af0_21 \<sigma> \<equiv> RIP \<sigma> = 0x2af0 \<and> RAX \<sigma> = printf_chk_0x2aeb_retval \<and> RCX \<sigma> = 0x314f \<and> RDX \<sigma> = 0x3155 \<and> RDI \<sigma> = 0x1 \<and> RSI \<sigma> = 0x315b \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x28) \<and> RBP \<sigma> = RCX\<^sub>0 \<and> R13 \<sigma> = ucast ((\<langle>31,0\<rangle>R8\<^sub>0::32 word)) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = 0x2af0\<close>
declare P_0x2af0_21_def[Ps]

definition P_0x2af0_21_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x2af0_21_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (2, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x30), 8)
  }\<close>

definition P_0x2af0_21_regions :: state_pred where
  \<open>P_0x2af0_21_regions \<sigma> \<equiv> \<exists>regions. P_0x2af0_21_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x2af3_21 :: state_pred where
  \<open>Q_0x2af3_21 \<sigma> \<equiv> RIP \<sigma> = 0x2af3 \<and> RAX \<sigma> = printf_chk_0x2aeb_retval \<and> RCX \<sigma> = 0x314f \<and> RDX \<sigma> = 0x3155 \<and> RDI \<sigma> = 0x1 \<and> RSI \<sigma> = 0x315b \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x28) \<and> RBP \<sigma> = RCX\<^sub>0 \<and> R13 \<sigma> = ucast ((\<langle>31,0\<rangle>R8\<^sub>0::32 word)) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = 0x2af0\<close>
declare Q_0x2af3_21_def[Qs]

schematic_goal print_policy_0_1_0x2af0_0x2af0_21[blocks]:
  assumes \<open>(P_0x2af0_21 && P_0x2af0_21_regions) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x2af0 21 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x2af3_21 ?\<sigma> \<and> block_usage P_0x2af0_21_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x2af0_21_def P_0x2af0_21_regions_def post: Q_0x2af3_21_def regionset: P_0x2af0_21_regions_set_def)

definition P_0x2af3_true_22 :: state_pred where
  \<open>P_0x2af3_true_22 \<sigma> \<equiv> RIP \<sigma> = 0x2af3 \<and> RAX \<sigma> = printf_chk_0x2aeb_retval \<and> RCX \<sigma> = 0x314f \<and> RDX \<sigma> = 0x3155 \<and> RDI \<sigma> = 0x1 \<and> RSI \<sigma> = 0x315b \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x28) \<and> RBP \<sigma> = RCX\<^sub>0 \<and> R13 \<sigma> = ucast ((\<langle>31,0\<rangle>R8\<^sub>0::32 word)) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = 0x2af0\<close>
declare P_0x2af3_true_22_def[Ps]

definition P_0x2af3_true_22_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x2af3_true_22_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (2, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x30), 8)
  }\<close>

definition P_0x2af3_true_22_regions :: state_pred where
  \<open>P_0x2af3_true_22_regions \<sigma> \<equiv> \<exists>regions. P_0x2af3_true_22_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x2b2e_22 :: state_pred where
  \<open>Q_0x2b2e_22 \<sigma> \<equiv> RIP \<sigma> = 0x2b2e \<and> RDI \<sigma> = 0x1 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x28) \<and> R13 \<sigma> = ucast ((\<langle>31,0\<rangle>R8\<^sub>0::32 word)) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBX\<^sub>0\<close>
declare Q_0x2b2e_22_def[Qs]

schematic_goal print_policy_0_1_0x2af3_0x2af3_22[blocks]:
  assumes \<open>(P_0x2af3_true_22 && P_0x2af3_true_22_regions && ZF) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x2af3 22 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x2b2e_22 ?\<sigma> \<and> block_usage P_0x2af3_true_22_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x2af3_true_22_def P_0x2af3_true_22_regions_def post: Q_0x2b2e_22_def regionset: P_0x2af3_true_22_regions_set_def)

definition P_0x2af3_false_23 :: state_pred where
  \<open>P_0x2af3_false_23 \<sigma> \<equiv> RIP \<sigma> = 0x2af3 \<and> RAX \<sigma> = printf_chk_0x2aeb_retval \<and> RCX \<sigma> = 0x314f \<and> RDX \<sigma> = 0x3155 \<and> RDI \<sigma> = 0x1 \<and> RSI \<sigma> = 0x315b \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x28) \<and> RBP \<sigma> = RCX\<^sub>0 \<and> R13 \<sigma> = ucast ((\<langle>31,0\<rangle>R8\<^sub>0::32 word)) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = 0x2af0\<close>
declare P_0x2af3_false_23_def[Ps]

definition P_0x2af3_false_23_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x2af3_false_23_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (2, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x30), 8)
  }\<close>

definition P_0x2af3_false_23_regions :: state_pred where
  \<open>P_0x2af3_false_23_regions \<sigma> \<equiv> \<exists>regions. P_0x2af3_false_23_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x2b10_23 :: state_pred where
  \<open>Q_0x2b10_23 \<sigma> \<equiv> RIP \<sigma> = 0x2b10 \<and> RDI \<sigma> = 0x1 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x28) \<and> RBP \<sigma> = 0x316c \<and> R13 \<sigma> = ucast ((\<langle>31,0\<rangle>R8\<^sub>0::32 word)) \<and> R12 \<sigma> = ((RCX\<^sub>0::64 word) + (((\<langle>63,0\<rangle>(((\<langle>63,0\<rangle>((ucast((\<langle>31,0\<rangle>((ucast((\<langle>31,0\<rangle>R8\<^sub>0::32 word))::64 word) - (0x1::64 word))::32 word))::64 word) << 0x4)::64 word)::64 word) * 0x1)::64 word)::64 word) + 0x10)) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBX\<^sub>0\<close>
declare Q_0x2b10_23_def[Qs]

schematic_goal print_policy_0_7_0x2af3_0x2b0c_23[blocks]:
  assumes \<open>(P_0x2af3_false_23 && P_0x2af3_false_23_regions && ! ZF) \<sigma>\<close>
  shows \<open>exec_block 7 0x2b0c 23 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x2b10_23 ?\<sigma> \<and> block_usage P_0x2af3_false_23_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x2af3_false_23_def P_0x2af3_false_23_regions_def post: Q_0x2b10_23_def regionset: P_0x2af3_false_23_regions_set_def)

definition P_0x2b10_24 :: state_pred where
  \<open>P_0x2b10_24 \<sigma> \<equiv> RIP \<sigma> = 0x2b10 \<and> RDI \<sigma> = 0x1 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x28) \<and> RBP \<sigma> = 0x316c \<and> R13 \<sigma> = ucast ((\<langle>31,0\<rangle>R8\<^sub>0::32 word)) \<and> R12 \<sigma> = ((RCX\<^sub>0::64 word) + (((\<langle>63,0\<rangle>(((\<langle>63,0\<rangle>((ucast((\<langle>31,0\<rangle>((ucast((\<langle>31,0\<rangle>R8\<^sub>0::32 word))::64 word) - (0x1::64 word))::32 word))::64 word) << 0x4)::64 word)::64 word) * 0x1)::64 word)::64 word) + 0x10)) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBX\<^sub>0\<close>
declare P_0x2b10_24_def[Ps]

definition P_0x2b10_24_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x2b10_24_regions_set \<sigma> \<equiv> {
    (0, RBX \<sigma>, 4),
    (1, RSP\<^sub>0, 8),
    (2, ((RBX \<sigma>::64 word) + 0x8), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x28), 8)
  }\<close>

definition P_0x2b10_24_regions :: state_pred where
  \<open>P_0x2b10_24_regions \<sigma> \<equiv> \<exists>regions. P_0x2b10_24_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x2b24_24 :: state_pred where
  \<open>Q_0x2b24_24 \<sigma> \<equiv> RIP \<sigma> = 0x2b24 \<and> RAX \<sigma> = 0x0 \<and> RDI \<sigma> = 0x1 \<and> RSI \<sigma> = 0x316c \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x28) \<and> RBP \<sigma> = 0x316c \<and> R13 \<sigma> = ucast ((\<langle>31,0\<rangle>R8\<^sub>0::32 word)) \<and> R12 \<sigma> = ((RCX\<^sub>0::64 word) + (((\<langle>63,0\<rangle>(((\<langle>63,0\<rangle>((ucast((\<langle>31,0\<rangle>((ucast((\<langle>31,0\<rangle>R8\<^sub>0::32 word))::64 word) - (0x1::64 word))::32 word))::64 word) << 0x4)::64 word)::64 word) * 0x1)::64 word)::64 word) + 0x10)) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBX\<^sub>0\<close>
declare Q_0x2b24_24_def[Qs]

schematic_goal print_policy_0_6_0x2b10_0x2b20_24[blocks]:
  assumes \<open>(P_0x2b10_24 && P_0x2b10_24_regions) \<sigma>\<close>
  shows \<open>exec_block 6 0x2b20 24 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x2b24_24 ?\<sigma> \<and> block_usage P_0x2b10_24_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x2b10_24_def P_0x2b10_24_regions_def post: Q_0x2b24_24_def regionset: P_0x2b10_24_regions_set_def)

definition P_0x2b24_25 :: state_pred where
  \<open>P_0x2b24_25 \<sigma> \<equiv> RIP \<sigma> = 0x2b24 \<and> RAX \<sigma> = 0x0 \<and> RDI \<sigma> = 0x1 \<and> RSI \<sigma> = 0x316c \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x28) \<and> RBP \<sigma> = 0x316c \<and> R13 \<sigma> = ucast ((\<langle>31,0\<rangle>R8\<^sub>0::32 word)) \<and> R12 \<sigma> = ((RCX\<^sub>0::64 word) + (((\<langle>63,0\<rangle>(((\<langle>63,0\<rangle>((ucast((\<langle>31,0\<rangle>((ucast((\<langle>31,0\<rangle>R8\<^sub>0::32 word))::64 word) - (0x1::64 word))::32 word))::64 word) << 0x4)::64 word)::64 word) * 0x1)::64 word)::64 word) + 0x10)) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBX\<^sub>0\<close>
declare P_0x2b24_25_def[Ps]

definition P_0x2b24_25_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x2b24_25_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (2, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x30), 8)
  }\<close>

definition P_0x2b24_25_regions :: state_pred where
  \<open>P_0x2b24_25_regions \<sigma> \<equiv> \<exists>regions. P_0x2b24_25_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_printf_chk_addr_0x2b24_25 :: state_pred where
  \<open>Q_printf_chk_addr_0x2b24_25 \<sigma> \<equiv> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x30) \<and> RIP \<sigma> = printf_chk_addr \<and> RAX \<sigma> = 0x0 \<and> RDI \<sigma> = 0x1 \<and> RSI \<sigma> = 0x316c \<and> RBP \<sigma> = 0x316c \<and> R13 \<sigma> = ucast ((\<langle>31,0\<rangle>R8\<^sub>0::32 word)) \<and> R12 \<sigma> = ((RCX\<^sub>0::64 word) + (((\<langle>63,0\<rangle>(((\<langle>63,0\<rangle>((ucast((\<langle>31,0\<rangle>((ucast((\<langle>31,0\<rangle>R8\<^sub>0::32 word))::64 word) - (0x1::64 word))::32 word))::64 word) << 0x4)::64 word)::64 word) * 0x1)::64 word)::64 word) + 0x10)) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = 0x2b29\<close>
declare Q_printf_chk_addr_0x2b24_25_def[Qs]

schematic_goal print_policy_0_1_0x2b24_0x2b24_25[blocks]:
  assumes \<open>(P_0x2b24_25 && P_0x2b24_25_regions) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x2b24 25 \<sigma> \<triangleq> ?\<sigma> \<and> Q_printf_chk_addr_0x2b24_25 ?\<sigma> \<and> block_usage P_0x2b24_25_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x2b24_25_def P_0x2b24_25_regions_def post: Q_printf_chk_addr_0x2b24_25_def regionset: P_0x2b24_25_regions_set_def)

definition P_0x2b29_26 :: state_pred where
  \<open>P_0x2b29_26 \<sigma> \<equiv> RIP \<sigma> = 0x2b29 \<and> RAX \<sigma> = printf_chk_0x2b24_retval \<and> RDI \<sigma> = 0x1 \<and> RSI \<sigma> = 0x316c \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x28) \<and> RBP \<sigma> = 0x316c \<and> R13 \<sigma> = ucast ((\<langle>31,0\<rangle>R8\<^sub>0::32 word)) \<and> R12 \<sigma> = ((RCX\<^sub>0::64 word) + (((\<langle>63,0\<rangle>(((\<langle>63,0\<rangle>((ucast((\<langle>31,0\<rangle>((ucast((\<langle>31,0\<rangle>R8\<^sub>0::32 word))::64 word) - (0x1::64 word))::32 word))::64 word) << 0x4)::64 word)::64 word) * 0x1)::64 word)::64 word) + 0x10)) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = 0x2b29\<close>
declare P_0x2b29_26_def[Ps]

definition P_0x2b29_26_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x2b29_26_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (2, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x30), 8)
  }\<close>

definition P_0x2b29_26_regions :: state_pred where
  \<open>P_0x2b29_26_regions \<sigma> \<equiv> \<exists>regions. P_0x2b29_26_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x2b2c_26 :: state_pred where
  \<open>Q_0x2b2c_26 \<sigma> \<equiv> RIP \<sigma> = 0x2b2c \<and> RDI \<sigma> = 0x1 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x28) \<and> RBP \<sigma> = 0x316c \<and> R13 \<sigma> = ucast ((\<langle>31,0\<rangle>R8\<^sub>0::32 word)) \<and> R12 \<sigma> = ((RCX\<^sub>0::64 word) + (((\<langle>63,0\<rangle>(((\<langle>63,0\<rangle>((ucast((\<langle>31,0\<rangle>((ucast((\<langle>31,0\<rangle>R8\<^sub>0::32 word))::64 word) - (0x1::64 word))::32 word))::64 word) << 0x4)::64 word)::64 word) * 0x1)::64 word)::64 word) + 0x10)) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBX\<^sub>0\<close>
declare Q_0x2b2c_26_def[Qs]

schematic_goal print_policy_0_1_0x2b29_0x2b29_26[blocks]:
  assumes \<open>(P_0x2b29_26 && P_0x2b29_26_regions) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x2b29 26 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x2b2c_26 ?\<sigma> \<and> block_usage P_0x2b29_26_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x2b29_26_def P_0x2b29_26_regions_def post: Q_0x2b2c_26_def regionset: P_0x2b29_26_regions_set_def)

definition P_0x2b2c_true_27 :: state_pred where
  \<open>P_0x2b2c_true_27 \<sigma> \<equiv> RIP \<sigma> = 0x2b2c \<and> RDI \<sigma> = 0x1 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x28) \<and> RBP \<sigma> = 0x316c \<and> R13 \<sigma> = ucast ((\<langle>31,0\<rangle>R8\<^sub>0::32 word)) \<and> R12 \<sigma> = ((RCX\<^sub>0::64 word) + (((\<langle>63,0\<rangle>(((\<langle>63,0\<rangle>((ucast((\<langle>31,0\<rangle>((ucast((\<langle>31,0\<rangle>R8\<^sub>0::32 word))::64 word) - (0x1::64 word))::32 word))::64 word) << 0x4)::64 word)::64 word) * 0x1)::64 word)::64 word) + 0x10)) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBX\<^sub>0\<close>
declare P_0x2b2c_true_27_def[Ps]

definition P_0x2b2c_true_27_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x2b2c_true_27_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (2, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x28), 8)
  }\<close>

definition P_0x2b2c_true_27_regions :: state_pred where
  \<open>P_0x2b2c_true_27_regions \<sigma> \<equiv> \<exists>regions. P_0x2b2c_true_27_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x2b10_27 :: state_pred where
  \<open>Q_0x2b10_27 \<sigma> \<equiv> RIP \<sigma> = 0x2b10 \<and> RDI \<sigma> = 0x1 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x28) \<and> RBP \<sigma> = 0x316c \<and> R13 \<sigma> = ucast ((\<langle>31,0\<rangle>R8\<^sub>0::32 word)) \<and> R12 \<sigma> = ((RCX\<^sub>0::64 word) + (((\<langle>63,0\<rangle>(((\<langle>63,0\<rangle>((ucast((\<langle>31,0\<rangle>((ucast((\<langle>31,0\<rangle>R8\<^sub>0::32 word))::64 word) - (0x1::64 word))::32 word))::64 word) << 0x4)::64 word)::64 word) * 0x1)::64 word)::64 word) + 0x10)) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBX\<^sub>0\<close>
declare Q_0x2b10_27_def[Qs]

schematic_goal print_policy_0_1_0x2b2c_0x2b2c_27[blocks]:
  assumes \<open>(P_0x2b2c_true_27 && P_0x2b2c_true_27_regions && !ZF) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x2b2c 27 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x2b10_27 ?\<sigma> \<and> block_usage P_0x2b2c_true_27_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x2b2c_true_27_def P_0x2b2c_true_27_regions_def post: Q_0x2b10_27_def regionset: P_0x2b2c_true_27_regions_set_def)

definition P_0x2b2c_false_28 :: state_pred where
  \<open>P_0x2b2c_false_28 \<sigma> \<equiv> RIP \<sigma> = 0x2b2c \<and> RDI \<sigma> = 0x1 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x28) \<and> RBP \<sigma> = 0x316c \<and> R13 \<sigma> = ucast ((\<langle>31,0\<rangle>R8\<^sub>0::32 word)) \<and> R12 \<sigma> = ((RCX\<^sub>0::64 word) + (((\<langle>63,0\<rangle>(((\<langle>63,0\<rangle>((ucast((\<langle>31,0\<rangle>((ucast((\<langle>31,0\<rangle>R8\<^sub>0::32 word))::64 word) - (0x1::64 word))::32 word))::64 word) << 0x4)::64 word)::64 word) * 0x1)::64 word)::64 word) + 0x10)) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBX\<^sub>0\<close>
declare P_0x2b2c_false_28_def[Ps]

definition P_0x2b2c_false_28_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x2b2c_false_28_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (2, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x28), 8)
  }\<close>

definition P_0x2b2c_false_28_regions :: state_pred where
  \<open>P_0x2b2c_false_28_regions \<sigma> \<equiv> \<exists>regions. P_0x2b2c_false_28_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x2b2e_28 :: state_pred where
  \<open>Q_0x2b2e_28 \<sigma> \<equiv> RIP \<sigma> = 0x2b2e \<and> RDI \<sigma> = 0x1 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x28) \<and> RBP \<sigma> = 0x316c \<and> R13 \<sigma> = ucast ((\<langle>31,0\<rangle>R8\<^sub>0::32 word)) \<and> R12 \<sigma> = ((RCX\<^sub>0::64 word) + (((\<langle>63,0\<rangle>(((\<langle>63,0\<rangle>((ucast((\<langle>31,0\<rangle>((ucast((\<langle>31,0\<rangle>R8\<^sub>0::32 word))::64 word) - (0x1::64 word))::32 word))::64 word) << 0x4)::64 word)::64 word) * 0x1)::64 word)::64 word) + 0x10)) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBX\<^sub>0\<close>
declare Q_0x2b2e_28_def[Qs]

schematic_goal print_policy_0_1_0x2b2c_0x2b2c_28[blocks]:
  assumes \<open>(P_0x2b2c_false_28 && P_0x2b2c_false_28_regions && ! !ZF) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x2b2c 28 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x2b2e_28 ?\<sigma> \<and> block_usage P_0x2b2c_false_28_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x2b2c_false_28_def P_0x2b2c_false_28_regions_def post: Q_0x2b2e_28_def regionset: P_0x2b2c_false_28_regions_set_def)

definition P_0x2b2e_29 :: state_pred where
  \<open>P_0x2b2e_29 \<sigma> \<equiv> RIP \<sigma> = 0x2b2e \<and> RDI \<sigma> = 0x1 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x28) \<and> R13 \<sigma> = ucast ((\<langle>31,0\<rangle>R8\<^sub>0::32 word)) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBX\<^sub>0\<close>
declare P_0x2b2e_29_def[Ps]

definition P_0x2b2e_29_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x2b2e_29_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (2, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x28), 8)
  }\<close>

definition P_0x2b2e_29_regions :: state_pred where
  \<open>P_0x2b2e_29_regions \<sigma> \<equiv> \<exists>regions. P_0x2b2e_29_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_ret_address_29 :: state_pred where
  \<open>Q_ret_address_29 \<sigma> \<equiv> RIP \<sigma> = ret_address \<and> RBX \<sigma> = RBX\<^sub>0 \<and> RDI \<sigma> = 0x1 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) + 0x8) \<and> RBP \<sigma> = RBP\<^sub>0 \<and> R14 \<sigma> = R14\<^sub>0 \<and> R13 \<sigma> = R13\<^sub>0 \<and> R12 \<sigma> = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBX\<^sub>0\<close>
declare Q_ret_address_29_def[Qs]

schematic_goal print_policy_0_6_0x2b2e_0x2b36_29[blocks]:
  assumes \<open>(P_0x2b2e_29 && P_0x2b2e_29_regions) \<sigma>\<close>
  shows \<open>exec_block 6 0x2b36 29 \<sigma> \<triangleq> ?\<sigma> \<and> Q_ret_address_29 ?\<sigma> \<and> block_usage P_0x2b2e_29_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x2b2e_29_def P_0x2b2e_29_regions_def post: Q_ret_address_29_def regionset: P_0x2b2e_29_regions_set_def)

definition print_policy_acode :: ACode where
  \<open>print_policy_acode =
    Block 14 0x2a10 0;
    Block (Suc 0) 0x2a17 (Suc 0);
    CALL printf_chk_acode;
    Block (Suc 0) 0x2a1c 2;
    Block (Suc 0) 0x2a23 3;
    CALL puts_acode;
    Block 11 0x2a5b 4;
    Block (Suc 0) 0x2a62 5;
    CALL printf_chk_acode;
    Block 3 0x2a69 6;
    IF ZF THEN
      Block (Suc 0) 0x2a6c 7
    ELSE
      Block 6 0x2a83 8;
      WHILE P_0x2a88_9 DO
        Block 8 0x2a9e 9;
        IF ZF THEN
          Block (Suc 0) 0x2aa0 10
        ELSE
          Block 8 0x2ab1 11;
          Block (Suc 0) 0x2ab3 12;
          CALL printf_chk_acode;
          Block 2 0x2ab9 13
        FI;
        Block 2 0x2abe 14;
        IF !ZF THEN
          Block (Suc 0) 0x2ac1 15
        ELSE
          Block (Suc 0) 0x2ac1 16
        FI
      OD
    FI;
    Block (Suc 0) 0x2ac3 17;
    Block (Suc 0) 0x2aca 18;
    CALL puts_acode;
    Block 5 0x2ae6 19;
    Block (Suc 0) 0x2aeb 20;
    CALL printf_chk_acode;
    Block (Suc 0) 0x2af0 21;
    IF ZF THEN
      Block (Suc 0) 0x2af3 22
    ELSE
      Block 7 0x2b0c 23;
      WHILE P_0x2b10_24 DO
        Block 6 0x2b20 24;
        Block (Suc 0) 0x2b24 25;
        CALL printf_chk_acode;
        Block (Suc 0) 0x2b29 26;
        IF !ZF THEN
          Block (Suc 0) 0x2b2c 27
        ELSE
          Block (Suc 0) 0x2b2c 28
        FI
      OD
    FI;
    Block 6 0x2b36 29
  \<close>




schematic_goal "print_policy":
  assumes
    \<open>\<forall>\<sigma>. RIP \<sigma> = 0x2a17 \<longrightarrow> P_0x2a17_1_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x2a1c \<longrightarrow> P_0x2a1c_2_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x2a23 \<longrightarrow> P_0x2a23_3_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x2a28 \<longrightarrow> P_0x2a28_4_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x2a62 \<longrightarrow> P_0x2a62_5_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x2a67 \<longrightarrow> P_0x2a67_6_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x2a6c \<longrightarrow> P_0x2a6c_true_7_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x2a6c \<longrightarrow> P_0x2a6c_false_8_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x2a88 \<longrightarrow> P_0x2a88_9_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x2aa0 \<longrightarrow> P_0x2aa0_true_10_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x2aa0 \<longrightarrow> P_0x2aa0_false_11_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x2ab3 \<longrightarrow> P_0x2ab3_12_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x2ab8 \<longrightarrow> P_0x2ab8_13_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x2aba \<longrightarrow> P_0x2aba_14_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x2ac1 \<longrightarrow> P_0x2ac1_true_15_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x2ac1 \<longrightarrow> P_0x2ac1_false_16_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x2ac3 \<longrightarrow> P_0x2ac3_17_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x2aca \<longrightarrow> P_0x2aca_18_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x2acf \<longrightarrow> P_0x2acf_19_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x2aeb \<longrightarrow> P_0x2aeb_20_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x2af0 \<longrightarrow> P_0x2af0_21_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x2af3 \<longrightarrow> P_0x2af3_true_22_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x2af3 \<longrightarrow> P_0x2af3_false_23_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x2b10 \<longrightarrow> P_0x2b10_24_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x2b24 \<longrightarrow> P_0x2b24_25_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x2b29 \<longrightarrow> P_0x2b29_26_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x2b2c \<longrightarrow> P_0x2b2c_true_27_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x2b2c \<longrightarrow> P_0x2b2c_false_28_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x2b2e \<longrightarrow> P_0x2b2e_29_regions \<sigma>\<close>
    and [blocks]: \<open>{{Q_printf_chk_addr_0x2a17_1}} \<box>printf_chk_acode {{P_0x2a1c_2;M_0x2a17}}\<close>
    and [blocks]: \<open>{{Q_puts_addr_0x2a23_3}} \<box>puts_acode {{P_0x2a28_4;M_0x2a23}}\<close>
    and [blocks]: \<open>{{Q_printf_chk_addr_0x2a62_5}} \<box>printf_chk_acode {{P_0x2a67_6;M_0x2a62}}\<close>
    and [blocks]: \<open>{{Q_printf_chk_addr_0x2ab3_12}} \<box>printf_chk_acode {{P_0x2ab8_13;M_0x2ab3}}\<close>
    and [blocks]: \<open>{{Q_puts_addr_0x2aca_18}} \<box>puts_acode {{P_0x2acf_19;M_0x2aca}}\<close>
    and [blocks]: \<open>{{Q_printf_chk_addr_0x2aeb_20}} \<box>printf_chk_acode {{P_0x2af0_21;M_0x2aeb}}\<close>
    and [blocks]: \<open>{{Q_printf_chk_addr_0x2b24_25}} \<box>printf_chk_acode {{P_0x2b29_26;M_0x2b24}}\<close>
  shows \<open>{{?P}} print_policy_acode {{?Q;?M}}\<close>
  apply (vcg acode: print_policy_acode_def assms: assms)
  apply (rule HTriple_weaken[where P="P_0x2a88_9 || P_0x2ac3_17"]) \<comment> \<open>The invariant: the precondition of the loop or the postcondition(s) after termination.\<close>
  apply (simp add: pred_logic)
  apply (auto simp add: pred_logic Ps Qs)[1]
  apply (rule HTriple_while)
  apply (rule HTriple_weaken[where P="P_0x2a88_9"]) \<comment> \<open>Running a loop body, with the precondition of the loop\<close>
  apply (simp add: pred_logic)
  apply (vcg_step assms: assms)+
  apply (auto simp add: pred_logic Ps Qs)[1]
  apply (simp add: pred_logic)
  apply (simp add: pred_logic)
  apply (simp add: pred_logic)
  apply (rule HTriple_weaken[where P="P_0x2ac3_17"]) \<comment> \<open>Terminated.\<close>
  apply (auto simp add: pred_logic Ps Qs)[1]
  apply (vcg_step assms: assms)+
  apply (rule HTriple_weaken[where P="P_0x2b10_24 || P_0x2b2e_29"]) \<comment> \<open>The invariant: the precondition of the loop or the postcondition(s) after termination.\<close>
  apply (simp add: pred_logic)
  apply (auto simp add: pred_logic Ps Qs)[1]
  apply (rule HTriple_while)
  apply (rule HTriple_weaken[where P="P_0x2b10_24"]) \<comment> \<open>Running a loop body, with the precondition of the loop\<close>
  apply (simp add: pred_logic)
  apply (vcg_step assms: assms)+
  apply (auto simp add: pred_logic Ps Qs)[1]
  apply (simp add: pred_logic)
  apply (simp add: pred_logic)
  apply (simp add: pred_logic)
  apply (vcg_step assms: assms)+
  apply (simp add: pred_logic assms)
  apply (simp add: pred_logic assms)
  apply (simp add: pred_logic assms)
  apply (simp add: pred_logic assms)
  apply (auto simp add: pred_logic Ps Qs)
  done


end

