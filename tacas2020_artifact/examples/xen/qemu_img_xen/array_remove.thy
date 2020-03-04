theory array_remove
  imports
    "../../../isabelle/VCG/HTriple"
begin

locale "qemu_img_xen" = execution_context + exec_code +
  fixes qemu_malloc_0xbb39_retval\<^sub>v memcpy_0xbb4c_retval\<^sub>v memmove_0xbb6e_retval\<^sub>v memcpy_0xbb7c_retval\<^sub>v free_0xbb84_retval\<^sub>v memmove_0xbbb6_retval\<^sub>v assert_fail_0xbbe1_retval\<^sub>v assert_fail_0xbc00_retval\<^sub>v assert_fail_addr free_addr memcpy_addr memmove_addr qemu_malloc_addr :: \<open>64 word\<close>
    and assert_fail_acode free_acode memcpy_acode memmove_acode qemu_malloc_acode :: ACode
  assumes fetch:
    "fetch 0xbac0 \<equiv> (Unary (IS_8088 Push) (Storage (Reg (General SixtyFour r15))), 2)"
    "fetch 0xbac2 \<equiv> (Unary (IS_8088 Push) (Storage (Reg (General SixtyFour r14))), 2)"
    "fetch 0xbac4 \<equiv> (Unary (IS_8088 Push) (Storage (Reg (General SixtyFour r13))), 2)"
    "fetch 0xbac6 \<equiv> (Unary (IS_8088 Push) (Storage (Reg (General SixtyFour r12))), 2)"
    "fetch 0xbac8 \<equiv> (Unary (IS_8088 Push) (Storage (Reg (General SixtyFour rbp))), 1)"
    "fetch 0xbac9 \<equiv> (Unary (IS_8088 Push) (Storage (Reg (General SixtyFour rbx))), 1)"
    "fetch 0xbaca \<equiv> (Binary (IS_8088 Sub) (Reg (General SixtyFour rsp)) (Immediate SixtyFour (ImmVal 40)), 4)"
    "fetch 0xbace \<equiv> (Binary (IS_8088 Test) (Reg (General ThirtyTwo rsi)) (Storage (Reg (General ThirtyTwo rsi))), 2)"
    "fetch 0xbad0 \<equiv> (Unary (IS_8088 Js) (Immediate SixtyFour (ImmVal 48102)), 6)"
    "fetch 0xbad6 \<equiv> (Binary (IS_8088 Mov) (Reg (General ThirtyTwo rax)) (Storage (Memory ThirtyTwo (A_SizeDirective 32 (A_Plus (A_FromReg (General SixtyFour rdi)) (A_WordConstant 12))))), 3)"
    "fetch 0xbad9 \<equiv> (Binary (IS_8088 Lea) (Reg (General ThirtyTwo rdx)) (Storage (Memory SixtyFour (A_Plus (A_FromReg (General SixtyFour rsi)) (A_WordConstant 1)))), 3)"
    "fetch 0xbadc \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour r15)) (Storage (Reg (General SixtyFour rdi))), 3)"
    "fetch 0xbadf \<equiv> (Binary (IS_8088 Mov) (Reg (General ThirtyTwo rbx)) (Storage (Reg (General ThirtyTwo rsi))), 2)"
    "fetch 0xbae1 \<equiv> (Binary (IS_8088 Cmp) (Reg (General ThirtyTwo rdx)) (Storage (Reg (General ThirtyTwo rax))), 2)"
    "fetch 0xbae3 \<equiv> (Unary (IS_8088 Ja) (Immediate SixtyFour (ImmVal 48071)), 6)"
    "fetch 0xbae9 \<equiv> (Binary (IS_8088 Mov) (Reg (General ThirtyTwo rbp)) (Storage (Reg (General ThirtyTwo rax))), 2)"
    "fetch 0xbaeb \<equiv> (Binary (IS_8088 Sub) (Reg (General ThirtyTwo rbp)) (Immediate SixtyFour (ImmVal 1)), 3)"
    "fetch 0xbaee \<equiv> (Unary (IS_8088 Js) (Immediate SixtyFour (ImmVal 48064)), 6)"
    "fetch 0xbaf4 \<equiv> (Binary (IS_8088 Cmp) (Reg (General ThirtyTwo rax)) (Storage (Reg (General ThirtyTwo rsi))), 2)"
    "fetch 0xbaf6 \<equiv> (Unary (IS_8088 Jbe) (Immediate SixtyFour (ImmVal 48064)), 6)"
    "fetch 0xbafc \<equiv> (Binary (IS_8088 Cmp) (Reg (General ThirtyTwo rsi)) (Storage (Reg (General ThirtyTwo rbp))), 2)"
    "fetch 0xbafe \<equiv> (Unary (IS_8088 Je) (Immediate SixtyFour (ImmVal 48016)), 6)"
    "fetch 0xbb04 \<equiv> (Binary (IS_X86_64 Movsxd) (Reg (General SixtyFour r12)) (Storage (Memory ThirtyTwo (A_SizeDirective 32 (A_Plus (A_FromReg (General SixtyFour rdi)) (A_WordConstant 16))))), 4)"
    "fetch 0xbb08 \<equiv> (Binary (IS_8088 Mov) (Reg (General ThirtyTwo r9)) (Storage (Reg (General ThirtyTwo rsi))), 3)"
    "fetch 0xbb0b \<equiv> (Binary (IS_8088 Mov) (Reg (General ThirtyTwo r8)) (Storage (Reg (General ThirtyTwo rbp))), 3)"
    "fetch 0xbb0e \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour r13)) (Storage (Memory SixtyFour (A_SizeDirective 64 (A_FromReg (General SixtyFour rdi))))), 3)"
    "fetch 0xbb11 \<equiv> (Binary (IS_8088 Imul) (Reg (General ThirtyTwo r9)) (Storage (Reg (General ThirtyTwo r12))), 4)"
    "fetch 0xbb15 \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour rdi)) (Storage (Reg (General SixtyFour r12))), 3)"
    "fetch 0xbb18 \<equiv> (Binary (IS_8088 Imul) (Reg (General ThirtyTwo r8)) (Storage (Reg (General ThirtyTwo r12))), 4)"
    "fetch 0xbb1c \<equiv> (Binary (IS_X86_64 Movsxd) (Reg (General SixtyFour r9)) (Storage (Reg (General ThirtyTwo r9))), 3)"
    "fetch 0xbb1f \<equiv> (Binary (IS_8088 Lea) (Reg (General SixtyFour rax)) (Storage (Memory SixtyFour (A_Plus (A_FromReg (General SixtyFour r13)) (A_Plus (A_Mult 1 (A_FromReg (General SixtyFour r9))) (A_WordConstant 0))))), 5)"
    "fetch 0xbb24 \<equiv> (Binary (IS_X86_64 Movsxd) (Reg (General SixtyFour r8)) (Storage (Reg (General ThirtyTwo r8))), 3)"
    "fetch 0xbb27 \<equiv> (Binary (IS_8088 Mov) (Memory SixtyFour (A_SizeDirective 64 (A_Plus (A_FromReg (General SixtyFour rsp)) (A_WordConstant 24)))) (Storage (Reg (General SixtyFour r9))), 5)"
    "fetch 0xbb2c \<equiv> (Binary (IS_8088 Add) (Reg (General SixtyFour r13)) (Storage (Reg (General SixtyFour r8))), 3)"
    "fetch 0xbb2f \<equiv> (Binary (IS_8088 Mov) (Memory SixtyFour (A_SizeDirective 64 (A_Plus (A_FromReg (General SixtyFour rsp)) (A_WordConstant 16)))) (Storage (Reg (General SixtyFour r8))), 5)"
    "fetch 0xbb34 \<equiv> (Binary (IS_8088 Mov) (Memory SixtyFour (A_SizeDirective 64 (A_Plus (A_FromReg (General SixtyFour rsp)) (A_WordConstant 8)))) (Storage (Reg (General SixtyFour rax))), 5)"
    "fetch 0xbb39 \<equiv> (Unary (IS_8088 Call) (Immediate SixtyFour (ImmLabel ''qemu_malloc'')), 5)"
    "fetch 0xbb3e \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour rsi)) (Storage (Memory SixtyFour (A_SizeDirective 64 (A_Plus (A_FromReg (General SixtyFour rsp)) (A_WordConstant 8))))), 5)"
    "fetch 0xbb43 \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour rdx)) (Storage (Reg (General SixtyFour r12))), 3)"
    "fetch 0xbb46 \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour rdi)) (Storage (Reg (General SixtyFour rax))), 3)"
    "fetch 0xbb49 \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour r14)) (Storage (Reg (General SixtyFour rax))), 3)"
    "fetch 0xbb4c \<equiv> (Unary (IS_8088 Call) (Immediate SixtyFour (ImmLabel ''memcpy'')), 5)"
    "fetch 0xbb51 \<equiv> (Binary (IS_8088 Cmp) (Reg (General ThirtyTwo rbx)) (Storage (Reg (General ThirtyTwo rbp))), 2)"
    "fetch 0xbb53 \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour r8)) (Storage (Memory SixtyFour (A_SizeDirective 64 (A_Plus (A_FromReg (General SixtyFour rsp)) (A_WordConstant 16))))), 5)"
    "fetch 0xbb58 \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour r9)) (Storage (Memory SixtyFour (A_SizeDirective 64 (A_Plus (A_FromReg (General SixtyFour rsp)) (A_WordConstant 24))))), 5)"
    "fetch 0xbb5d \<equiv> (Unary (IS_8088 Jg) (Immediate SixtyFour (ImmVal 48040)), 2)"
    "fetch 0xbb5f \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour rdi)) (Storage (Memory SixtyFour (A_SizeDirective 64 (A_Plus (A_FromReg (General SixtyFour rsp)) (A_WordConstant 8))))), 5)"
    "fetch 0xbb64 \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour rdx)) (Storage (Reg (General SixtyFour r8))), 3)"
    "fetch 0xbb67 \<equiv> (Binary (IS_8088 Sub) (Reg (General SixtyFour rdx)) (Storage (Reg (General SixtyFour r9))), 3)"
    "fetch 0xbb6a \<equiv> (Binary (IS_8088 Lea) (Reg (General SixtyFour rsi)) (Storage (Memory SixtyFour (A_Plus (A_FromReg (General SixtyFour rdi)) (A_Mult 1 (A_FromReg (General SixtyFour r12)))))), 4)"
    "fetch 0xbb6e \<equiv> (Unary (IS_8088 Call) (Immediate SixtyFour (ImmLabel ''memmove'')), 5)"
    "fetch 0xbb73 \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour rdx)) (Storage (Reg (General SixtyFour r12))), 3)"
    "fetch 0xbb76 \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour rsi)) (Storage (Reg (General SixtyFour r14))), 3)"
    "fetch 0xbb79 \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour rdi)) (Storage (Reg (General SixtyFour r13))), 3)"
    "fetch 0xbb7c \<equiv> (Unary (IS_8088 Call) (Immediate SixtyFour (ImmLabel ''memcpy'')), 5)"
    "fetch 0xbb81 \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour rdi)) (Storage (Reg (General SixtyFour r14))), 3)"
    "fetch 0xbb84 \<equiv> (Unary (IS_8088 Call) (Immediate SixtyFour (ImmLabel ''free'')), 5)"
    "fetch 0xbb89 \<equiv> (Binary (IS_8088 Mov) (Reg (General ThirtyTwo rax)) (Storage (Memory ThirtyTwo (A_SizeDirective 32 (A_Plus (A_FromReg (General SixtyFour r15)) (A_WordConstant 12))))), 4)"
    "fetch 0xbb8d \<equiv> (Binary (IS_8088 Lea) (Reg (General ThirtyTwo rbp)) (Storage (Memory SixtyFour (A_Minus (A_FromReg (General SixtyFour rax)) (A_WordConstant 1)))), 3)"
    "fetch 0xbb90 \<equiv> (Binary (IS_8088 Mov) (Memory ThirtyTwo (A_SizeDirective 32 (A_Plus (A_FromReg (General SixtyFour r15)) (A_WordConstant 12)))) (Storage (Reg (General ThirtyTwo rbp))), 4)"
    "fetch 0xbb94 \<equiv> (Binary (IS_8088 Xor) (Reg (General ThirtyTwo rax)) (Storage (Reg (General ThirtyTwo rax))), 2)"
    "fetch 0xbb96 \<equiv> (Binary (IS_8088 Add) (Reg (General SixtyFour rsp)) (Immediate SixtyFour (ImmVal 40)), 4)"
    "fetch 0xbb9a \<equiv> (Unary (IS_8088 Pop) (Storage (Reg (General SixtyFour rbx))), 1)"
    "fetch 0xbb9b \<equiv> (Unary (IS_8088 Pop) (Storage (Reg (General SixtyFour rbp))), 1)"
    "fetch 0xbb9c \<equiv> (Unary (IS_8088 Pop) (Storage (Reg (General SixtyFour r12))), 2)"
    "fetch 0xbb9e \<equiv> (Unary (IS_8088 Pop) (Storage (Reg (General SixtyFour r13))), 2)"
    "fetch 0xbba0 \<equiv> (Unary (IS_8088 Pop) (Storage (Reg (General SixtyFour r14))), 2)"
    "fetch 0xbba2 \<equiv> (Unary (IS_8088 Pop) (Storage (Reg (General SixtyFour r15))), 2)"
    "fetch 0xbba4 \<equiv> (Nullary (IS_8088 Ret), 1)"
    "fetch 0xbba5 \<equiv> (Unary (IS_8088 Nop) (Storage (Memory ThirtyTwo (A_SizeDirective 32 (A_FromReg (General SixtyFour rax))))), 3)"
    "fetch 0xbba8 \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour rdx)) (Storage (Reg (General SixtyFour r9))), 3)"
    "fetch 0xbbab \<equiv> (Binary (IS_8088 Lea) (Reg (General SixtyFour rdi)) (Storage (Memory SixtyFour (A_Plus (A_FromReg (General SixtyFour r13)) (A_Plus (A_Mult 1 (A_FromReg (General SixtyFour r12))) (A_WordConstant 0))))), 5)"
    "fetch 0xbbb0 \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour rsi)) (Storage (Reg (General SixtyFour r13))), 3)"
    "fetch 0xbbb3 \<equiv> (Binary (IS_8088 Sub) (Reg (General SixtyFour rdx)) (Storage (Reg (General SixtyFour r8))), 3)"
    "fetch 0xbbb6 \<equiv> (Unary (IS_8088 Call) (Immediate SixtyFour (ImmLabel ''memmove'')), 5)"
    "fetch 0xbbbb \<equiv> (Unary (IS_8088 Jmp) (Immediate SixtyFour (ImmVal 47987)), 2)"
    "fetch 0xbbbd \<equiv> (Unary (IS_8088 Nop) (Storage (Memory ThirtyTwo (A_SizeDirective 32 (A_FromReg (General SixtyFour rax))))), 3)"
    "fetch 0xbbc0 \<equiv> (Binary (IS_8088 Mov) (Reg (General ThirtyTwo rax)) (Immediate SixtyFour (ImmVal 4294967295)), 5)"
    "fetch 0xbbc5 \<equiv> (Unary (IS_8088 Jmp) (Immediate SixtyFour (ImmVal 48022)), 2)"
    "fetch 0xbbc7 \<equiv> (Binary (IS_8088 Lea) (Reg (General SixtyFour rcx)) (Storage (Memory SixtyFour (A_Plus (A_FromReg (General SixtyFour rip)) (A_WordConstant 88034)))), 7)"
    "fetch 0xbbce \<equiv> (Binary (IS_8088 Mov) (Reg (General ThirtyTwo rdx)) (Immediate SixtyFour (ImmVal 181)), 5)"
    "fetch 0xbbd3 \<equiv> (Binary (IS_8088 Lea) (Reg (General SixtyFour rsi)) (Storage (Memory SixtyFour (A_Plus (A_FromReg (General SixtyFour rip)) (A_WordConstant 85772)))), 7)"
    "fetch 0xbbda \<equiv> (Binary (IS_8088 Lea) (Reg (General SixtyFour rdi)) (Storage (Memory SixtyFour (A_Plus (A_FromReg (General SixtyFour rip)) (A_WordConstant 85789)))), 7)"
    "fetch 0xbbe1 \<equiv> (Unary (IS_8088 Call) (Immediate SixtyFour (ImmLabel ''__assert_fail'')), 5)"
    "fetch 0xbbe6 \<equiv> (Binary (IS_8088 Lea) (Reg (General SixtyFour rcx)) (Storage (Memory SixtyFour (A_Plus (A_FromReg (General SixtyFour rip)) (A_WordConstant 88003)))), 7)"
    "fetch 0xbbed \<equiv> (Binary (IS_8088 Mov) (Reg (General ThirtyTwo rdx)) (Immediate SixtyFour (ImmVal 179)), 5)"
    "fetch 0xbbf2 \<equiv> (Binary (IS_8088 Lea) (Reg (General SixtyFour rsi)) (Storage (Memory SixtyFour (A_Plus (A_FromReg (General SixtyFour rip)) (A_WordConstant 85741)))), 7)"
    "fetch 0xbbf9 \<equiv> (Binary (IS_8088 Lea) (Reg (General SixtyFour rdi)) (Storage (Memory SixtyFour (A_Plus (A_FromReg (General SixtyFour rip)) (A_WordConstant 85748)))), 7)"
    "fetch 0xbc00 \<equiv> (Unary (IS_8088 Call) (Immediate SixtyFour (ImmLabel ''__assert_fail'')), 5)"
    and \<alpha>_def: \<open>\<alpha> = \<lparr>text_sections = [], data_sections = [], labels_to_offsets = [], binary_offset = 0\<rparr>\<close>
    and assert_fail\<^sub>a\<^sub>d\<^sub>d\<^sub>r[simp]: \<open>the (label_to_address \<alpha> ''__assert_fail'') = assert_fail_addr\<close>
    and free\<^sub>a\<^sub>d\<^sub>d\<^sub>r[simp]: \<open>the (label_to_address \<alpha> ''free'') = free_addr\<close>
    and memcpy\<^sub>a\<^sub>d\<^sub>d\<^sub>r[simp]: \<open>the (label_to_address \<alpha> ''memcpy'') = memcpy_addr\<close>
    and memmove\<^sub>a\<^sub>d\<^sub>d\<^sub>r[simp]: \<open>the (label_to_address \<alpha> ''memmove'') = memmove_addr\<close>
    and qemu_malloc\<^sub>a\<^sub>d\<^sub>d\<^sub>r[simp]: \<open>the (label_to_address \<alpha> ''qemu_malloc'') = qemu_malloc_addr\<close>
begin

text \<open>Using definitions that don't get unfolded immediately prevents locale argument issues.\<close>
definition \<open>qemu_malloc_0xbb39_retval \<equiv> qemu_malloc_0xbb39_retval\<^sub>v\<close>
definition \<open>memcpy_0xbb4c_retval \<equiv> memcpy_0xbb4c_retval\<^sub>v\<close>
definition \<open>memmove_0xbb6e_retval \<equiv> memmove_0xbb6e_retval\<^sub>v\<close>
definition \<open>memcpy_0xbb7c_retval \<equiv> memcpy_0xbb7c_retval\<^sub>v\<close>
definition \<open>free_0xbb84_retval \<equiv> free_0xbb84_retval\<^sub>v\<close>
definition \<open>memmove_0xbbb6_retval \<equiv> memmove_0xbbb6_retval\<^sub>v\<close>
definition \<open>assert_fail_0xbbe1_retval \<equiv> assert_fail_0xbbe1_retval\<^sub>v\<close>
definition \<open>assert_fail_0xbc00_retval \<equiv> assert_fail_0xbc00_retval\<^sub>v\<close>

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

locale "array_remove" = "qemu_img_xen" +
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

definition P_0xbac0_0 :: state_pred where
  \<open>P_0xbac0_0 \<sigma> \<equiv> RIP \<sigma> = 0xbac0 \<and> RAX \<sigma> = RAX\<^sub>0 \<and> RBX \<sigma> = RBX\<^sub>0 \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = RDX\<^sub>0 \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = RSP\<^sub>0 \<and> RBP \<sigma> = RBP\<^sub>0 \<and> R15 \<sigma> = R15\<^sub>0 \<and> R14 \<sigma> = R14\<^sub>0 \<and> R13 \<sigma> = R13\<^sub>0 \<and> R12 \<sigma> = R12\<^sub>0 \<and> R9 \<sigma> = R9\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address\<close>
declare P_0xbac0_0_def[Ps]

definition P_0xbac0_0_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0xbac0_0_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (2, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x30), 8)
  }\<close>

definition P_0xbac0_0_regions :: state_pred where
  \<open>P_0xbac0_0_regions \<sigma> \<equiv> \<exists>regions. P_0xbac0_0_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0xbad0_0 :: state_pred where
  \<open>Q_0xbad0_0 \<sigma> \<equiv> RIP \<sigma> = 0xbad0 \<and> RAX \<sigma> = RAX\<^sub>0 \<and> RBX \<sigma> = RBX\<^sub>0 \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = RDX\<^sub>0 \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x58) \<and> RBP \<sigma> = RBP\<^sub>0 \<and> R15 \<sigma> = R15\<^sub>0 \<and> R14 \<sigma> = R14\<^sub>0 \<and> R13 \<sigma> = R13\<^sub>0 \<and> R12 \<sigma> = R12\<^sub>0 \<and> R9 \<sigma> = R9\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0\<close>
declare Q_0xbad0_0_def[Qs]

schematic_goal array_remove_0_8_0xbac0_0xbace_0[blocks]:
  assumes \<open>(P_0xbac0_0 && P_0xbac0_0_regions) \<sigma>\<close>
  shows \<open>exec_block 8 0xbace 0 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0xbad0_0 ?\<sigma> \<and> block_usage P_0xbac0_0_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0xbac0_0_def P_0xbac0_0_regions_def post: Q_0xbad0_0_def regionset: P_0xbac0_0_regions_set_def)

definition P_0xbad0_true_1 :: state_pred where
  \<open>P_0xbad0_true_1 \<sigma> \<equiv> RIP \<sigma> = 0xbad0 \<and> RAX \<sigma> = RAX\<^sub>0 \<and> RBX \<sigma> = RBX\<^sub>0 \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = RDX\<^sub>0 \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x58) \<and> RBP \<sigma> = RBP\<^sub>0 \<and> R15 \<sigma> = R15\<^sub>0 \<and> R14 \<sigma> = R14\<^sub>0 \<and> R13 \<sigma> = R13\<^sub>0 \<and> R12 \<sigma> = R12\<^sub>0 \<and> R9 \<sigma> = R9\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0\<close>
declare P_0xbad0_true_1_def[Ps]

definition P_0xbad0_true_1_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0xbad0_true_1_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (2, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x30), 8)
  }\<close>

definition P_0xbad0_true_1_regions :: state_pred where
  \<open>P_0xbad0_true_1_regions \<sigma> \<equiv> \<exists>regions. P_0xbad0_true_1_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0xbc00_1 :: state_pred where
  \<open>Q_0xbc00_1 \<sigma> \<equiv> RIP \<sigma> = 0xbc00 \<and> RAX \<sigma> = RAX\<^sub>0 \<and> RBX \<sigma> = RBX\<^sub>0 \<and> RCX \<sigma> = 0x213b0 \<and> RDX \<sigma> = 0xb3 \<and> RDI \<sigma> = 0x20af4 \<and> RSI \<sigma> = 0x20ae6 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x58) \<and> RBP \<sigma> = RBP\<^sub>0 \<and> R15 \<sigma> = R15\<^sub>0 \<and> R14 \<sigma> = R14\<^sub>0 \<and> R13 \<sigma> = R13\<^sub>0 \<and> R12 \<sigma> = R12\<^sub>0 \<and> R9 \<sigma> = R9\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0\<close>
declare Q_0xbc00_1_def[Qs]

schematic_goal array_remove_0_5_0xbad0_0xbbf9_1[blocks]:
  assumes \<open>(P_0xbad0_true_1 && P_0xbad0_true_1_regions && SF) \<sigma>\<close>
  shows \<open>exec_block 5 0xbbf9 (Suc 0) \<sigma> \<triangleq> ?\<sigma> \<and> Q_0xbc00_1 ?\<sigma> \<and> block_usage P_0xbad0_true_1_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0xbad0_true_1_def P_0xbad0_true_1_regions_def post: Q_0xbc00_1_def regionset: P_0xbad0_true_1_regions_set_def)

definition P_0xbc00_2 :: state_pred where
  \<open>P_0xbc00_2 \<sigma> \<equiv> RIP \<sigma> = 0xbc00 \<and> RAX \<sigma> = RAX\<^sub>0 \<and> RBX \<sigma> = RBX\<^sub>0 \<and> RCX \<sigma> = 0x213b0 \<and> RDX \<sigma> = 0xb3 \<and> RDI \<sigma> = 0x20af4 \<and> RSI \<sigma> = 0x20ae6 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x58) \<and> RBP \<sigma> = RBP\<^sub>0 \<and> R15 \<sigma> = R15\<^sub>0 \<and> R14 \<sigma> = R14\<^sub>0 \<and> R13 \<sigma> = R13\<^sub>0 \<and> R12 \<sigma> = R12\<^sub>0 \<and> R9 \<sigma> = R9\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0\<close>
declare P_0xbc00_2_def[Ps]

definition P_0xbc00_2_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0xbc00_2_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (2, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x60), 8)
  }\<close>

definition P_0xbc00_2_regions :: state_pred where
  \<open>P_0xbc00_2_regions \<sigma> \<equiv> \<exists>regions. P_0xbc00_2_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_assert_fail_addr_0xbc00_2 :: state_pred where
  \<open>Q_assert_fail_addr_0xbc00_2 \<sigma> \<equiv> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x60) \<and> RIP \<sigma> = assert_fail_addr \<and> RAX \<sigma> = RAX\<^sub>0 \<and> RBP \<sigma> = RBP\<^sub>0 \<and> R14 \<sigma> = R14\<^sub>0 \<and> R13 \<sigma> = R13\<^sub>0 \<and> R12 \<sigma> = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0\<close>
declare Q_assert_fail_addr_0xbc00_2_def[Qs]

schematic_goal array_remove_0_1_0xbc00_0xbc00_2[blocks]:
  assumes \<open>(P_0xbc00_2 && P_0xbc00_2_regions) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0xbc00 2 \<sigma> \<triangleq> ?\<sigma> \<and> Q_assert_fail_addr_0xbc00_2 ?\<sigma> \<and> block_usage P_0xbc00_2_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0xbc00_2_def P_0xbc00_2_regions_def post: Q_assert_fail_addr_0xbc00_2_def regionset: P_0xbc00_2_regions_set_def)

definition P_0xbad0_false_3 :: state_pred where
  \<open>P_0xbad0_false_3 \<sigma> \<equiv> RIP \<sigma> = 0xbad0 \<and> RAX \<sigma> = RAX\<^sub>0 \<and> RBX \<sigma> = RBX\<^sub>0 \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = RDX\<^sub>0 \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x58) \<and> RBP \<sigma> = RBP\<^sub>0 \<and> R15 \<sigma> = R15\<^sub>0 \<and> R14 \<sigma> = R14\<^sub>0 \<and> R13 \<sigma> = R13\<^sub>0 \<and> R12 \<sigma> = R12\<^sub>0 \<and> R9 \<sigma> = R9\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0\<close>
declare P_0xbad0_false_3_def[Ps]

definition P_0xbad0_false_3_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0xbad0_false_3_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((RDI\<^sub>0::64 word) + 0xc), 4),
    (2, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x30), 8)
  }\<close>

definition P_0xbad0_false_3_regions :: state_pred where
  \<open>P_0xbad0_false_3_regions \<sigma> \<equiv> \<exists>regions. P_0xbad0_false_3_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0xbae3_3 :: state_pred where
  \<open>Q_0xbae3_3 \<sigma> \<equiv> RIP \<sigma> = 0xbae3 \<and> RAX \<sigma> = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0xc),4]::32 word)) \<and> RBX \<sigma> = ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)) \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = ucast ((\<langle>31,0\<rangle>((RSI\<^sub>0::64 word) + 0x1)::32 word)) \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x58) \<and> RBP \<sigma> = RBP\<^sub>0 \<and> R15 \<sigma> = RDI\<^sub>0 \<and> R14 \<sigma> = R14\<^sub>0 \<and> R13 \<sigma> = R13\<^sub>0 \<and> R12 \<sigma> = R12\<^sub>0 \<and> R9 \<sigma> = R9\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0xc),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0xc),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0\<close>
declare Q_0xbae3_3_def[Qs]

schematic_goal array_remove_0_6_0xbad0_0xbae1_3[blocks]:
  assumes \<open>(P_0xbad0_false_3 && P_0xbad0_false_3_regions && ! SF) \<sigma>\<close>
  shows \<open>exec_block 6 0xbae1 3 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0xbae3_3 ?\<sigma> \<and> block_usage P_0xbad0_false_3_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0xbad0_false_3_def P_0xbad0_false_3_regions_def post: Q_0xbae3_3_def regionset: P_0xbad0_false_3_regions_set_def)

definition P_0xbae3_true_4 :: state_pred where
  \<open>P_0xbae3_true_4 \<sigma> \<equiv> RIP \<sigma> = 0xbae3 \<and> RAX \<sigma> = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0xc),4]::32 word)) \<and> RBX \<sigma> = ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)) \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = ucast ((\<langle>31,0\<rangle>((RSI\<^sub>0::64 word) + 0x1)::32 word)) \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x58) \<and> RBP \<sigma> = RBP\<^sub>0 \<and> R15 \<sigma> = RDI\<^sub>0 \<and> R14 \<sigma> = R14\<^sub>0 \<and> R13 \<sigma> = R13\<^sub>0 \<and> R12 \<sigma> = R12\<^sub>0 \<and> R9 \<sigma> = R9\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0xc),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0xc),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0\<close>
declare P_0xbae3_true_4_def[Ps]

definition P_0xbae3_true_4_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0xbae3_true_4_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((RDI\<^sub>0::64 word) + 0xc), 4),
    (2, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x30), 8)
  }\<close>

definition P_0xbae3_true_4_regions :: state_pred where
  \<open>P_0xbae3_true_4_regions \<sigma> \<equiv> \<exists>regions. P_0xbae3_true_4_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0xbbe1_4 :: state_pred where
  \<open>Q_0xbbe1_4 \<sigma> \<equiv> RIP \<sigma> = 0xbbe1 \<and> RAX \<sigma> = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0xc),4]::32 word)) \<and> RBX \<sigma> = ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)) \<and> RCX \<sigma> = 0x213b0 \<and> RDX \<sigma> = 0xb5 \<and> RDI \<sigma> = 0x20afe \<and> RSI \<sigma> = 0x20ae6 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x58) \<and> RBP \<sigma> = RBP\<^sub>0 \<and> R15 \<sigma> = RDI\<^sub>0 \<and> R14 \<sigma> = R14\<^sub>0 \<and> R13 \<sigma> = R13\<^sub>0 \<and> R12 \<sigma> = R12\<^sub>0 \<and> R9 \<sigma> = R9\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0xc),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0xc),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0\<close>
declare Q_0xbbe1_4_def[Qs]

schematic_goal array_remove_0_5_0xbae3_0xbbda_4[blocks]:
  assumes \<open>(P_0xbae3_true_4 && P_0xbae3_true_4_regions && ja) \<sigma>\<close>
  shows \<open>exec_block 5 0xbbda 4 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0xbbe1_4 ?\<sigma> \<and> block_usage P_0xbae3_true_4_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0xbae3_true_4_def P_0xbae3_true_4_regions_def post: Q_0xbbe1_4_def regionset: P_0xbae3_true_4_regions_set_def)

definition P_0xbbe1_5 :: state_pred where
  \<open>P_0xbbe1_5 \<sigma> \<equiv> RIP \<sigma> = 0xbbe1 \<and> RAX \<sigma> = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0xc),4]::32 word)) \<and> RBX \<sigma> = ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)) \<and> RCX \<sigma> = 0x213b0 \<and> RDX \<sigma> = 0xb5 \<and> RDI \<sigma> = 0x20afe \<and> RSI \<sigma> = 0x20ae6 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x58) \<and> RBP \<sigma> = RBP\<^sub>0 \<and> R15 \<sigma> = RDI\<^sub>0 \<and> R14 \<sigma> = R14\<^sub>0 \<and> R13 \<sigma> = R13\<^sub>0 \<and> R12 \<sigma> = R12\<^sub>0 \<and> R9 \<sigma> = R9\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0xc),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0xc),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0\<close>
declare P_0xbbe1_5_def[Ps]

definition P_0xbbe1_5_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0xbbe1_5_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((RDI\<^sub>0::64 word) + 0xc), 4),
    (2, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x60), 8)
  }\<close>

definition P_0xbbe1_5_regions :: state_pred where
  \<open>P_0xbbe1_5_regions \<sigma> \<equiv> \<exists>regions. P_0xbbe1_5_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_assert_fail_addr_0xbbe1_5 :: state_pred where
  \<open>Q_assert_fail_addr_0xbbe1_5 \<sigma> \<equiv> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x60) \<and> RIP \<sigma> = assert_fail_addr \<and> RAX \<sigma> = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0xc),4]::32 word)) \<and> RBP \<sigma> = RBP\<^sub>0 \<and> R14 \<sigma> = R14\<^sub>0 \<and> R13 \<sigma> = R13\<^sub>0 \<and> R12 \<sigma> = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0\<close>
declare Q_assert_fail_addr_0xbbe1_5_def[Qs]

schematic_goal array_remove_0_1_0xbbe1_0xbbe1_5[blocks]:
  assumes \<open>(P_0xbbe1_5 && P_0xbbe1_5_regions) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0xbbe1 5 \<sigma> \<triangleq> ?\<sigma> \<and> Q_assert_fail_addr_0xbbe1_5 ?\<sigma> \<and> block_usage P_0xbbe1_5_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0xbbe1_5_def P_0xbbe1_5_regions_def post: Q_assert_fail_addr_0xbbe1_5_def regionset: P_0xbbe1_5_regions_set_def)

definition P_0xbae3_false_6 :: state_pred where
  \<open>P_0xbae3_false_6 \<sigma> \<equiv> RIP \<sigma> = 0xbae3 \<and> RAX \<sigma> = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0xc),4]::32 word)) \<and> RBX \<sigma> = ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)) \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = ucast ((\<langle>31,0\<rangle>((RSI\<^sub>0::64 word) + 0x1)::32 word)) \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x58) \<and> RBP \<sigma> = RBP\<^sub>0 \<and> R15 \<sigma> = RDI\<^sub>0 \<and> R14 \<sigma> = R14\<^sub>0 \<and> R13 \<sigma> = R13\<^sub>0 \<and> R12 \<sigma> = R12\<^sub>0 \<and> R9 \<sigma> = R9\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0xc),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0xc),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0\<close>
declare P_0xbae3_false_6_def[Ps]

definition P_0xbae3_false_6_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0xbae3_false_6_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((RDI\<^sub>0::64 word) + 0xc), 4),
    (2, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x30), 8)
  }\<close>

definition P_0xbae3_false_6_regions :: state_pred where
  \<open>P_0xbae3_false_6_regions \<sigma> \<equiv> \<exists>regions. P_0xbae3_false_6_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0xbaee_6 :: state_pred where
  \<open>Q_0xbaee_6 \<sigma> \<equiv> RIP \<sigma> = 0xbaee \<and> RAX \<sigma> = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0xc),4]::32 word)) \<and> RBX \<sigma> = ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)) \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = ucast ((\<langle>31,0\<rangle>((RSI\<^sub>0::64 word) + 0x1)::32 word)) \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x58) \<and> RBP \<sigma> = ucast ((((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0xc),4]::32 word)::32 word) - 0x1)) \<and> R15 \<sigma> = RDI\<^sub>0 \<and> R14 \<sigma> = R14\<^sub>0 \<and> R13 \<sigma> = R13\<^sub>0 \<and> R12 \<sigma> = R12\<^sub>0 \<and> R9 \<sigma> = R9\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0xc),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0xc),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0\<close>
declare Q_0xbaee_6_def[Qs]

schematic_goal array_remove_0_3_0xbae3_0xbaeb_6[blocks]:
  assumes \<open>(P_0xbae3_false_6 && P_0xbae3_false_6_regions && ! ja) \<sigma>\<close>
  shows \<open>exec_block 3 0xbaeb 6 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0xbaee_6 ?\<sigma> \<and> block_usage P_0xbae3_false_6_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0xbae3_false_6_def P_0xbae3_false_6_regions_def post: Q_0xbaee_6_def regionset: P_0xbae3_false_6_regions_set_def)

definition P_0xbaee_true_7 :: state_pred where
  \<open>P_0xbaee_true_7 \<sigma> \<equiv> RIP \<sigma> = 0xbaee \<and> RAX \<sigma> = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0xc),4]::32 word)) \<and> RBX \<sigma> = ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)) \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = ucast ((\<langle>31,0\<rangle>((RSI\<^sub>0::64 word) + 0x1)::32 word)) \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x58) \<and> RBP \<sigma> = ucast ((((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0xc),4]::32 word)::32 word) - 0x1)) \<and> R15 \<sigma> = RDI\<^sub>0 \<and> R14 \<sigma> = R14\<^sub>0 \<and> R13 \<sigma> = R13\<^sub>0 \<and> R12 \<sigma> = R12\<^sub>0 \<and> R9 \<sigma> = R9\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0xc),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0xc),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0\<close>
declare P_0xbaee_true_7_def[Ps]

definition P_0xbaee_true_7_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0xbaee_true_7_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((RDI\<^sub>0::64 word) + 0xc), 4),
    (2, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x30), 8)
  }\<close>

definition P_0xbaee_true_7_regions :: state_pred where
  \<open>P_0xbaee_true_7_regions \<sigma> \<equiv> \<exists>regions. P_0xbaee_true_7_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0xbb96_7 :: state_pred where
  \<open>Q_0xbb96_7 \<sigma> \<equiv> RIP \<sigma> = 0xbb96 \<and> RBX \<sigma> = ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)) \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x58) \<and> R15 \<sigma> = RDI\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0\<close>
declare Q_0xbb96_7_def[Qs]

schematic_goal array_remove_0_3_0xbaee_0xbbc5_7[blocks]:
  assumes \<open>(P_0xbaee_true_7 && P_0xbaee_true_7_regions && SF) \<sigma>\<close>
  shows \<open>exec_block 3 0xbbc5 7 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0xbb96_7 ?\<sigma> \<and> block_usage P_0xbaee_true_7_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0xbaee_true_7_def P_0xbaee_true_7_regions_def post: Q_0xbb96_7_def regionset: P_0xbaee_true_7_regions_set_def)

definition P_0xbaee_false_8 :: state_pred where
  \<open>P_0xbaee_false_8 \<sigma> \<equiv> RIP \<sigma> = 0xbaee \<and> RAX \<sigma> = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0xc),4]::32 word)) \<and> RBX \<sigma> = ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)) \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = ucast ((\<langle>31,0\<rangle>((RSI\<^sub>0::64 word) + 0x1)::32 word)) \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x58) \<and> RBP \<sigma> = ucast ((((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0xc),4]::32 word)::32 word) - 0x1)) \<and> R15 \<sigma> = RDI\<^sub>0 \<and> R14 \<sigma> = R14\<^sub>0 \<and> R13 \<sigma> = R13\<^sub>0 \<and> R12 \<sigma> = R12\<^sub>0 \<and> R9 \<sigma> = R9\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0xc),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0xc),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0\<close>
declare P_0xbaee_false_8_def[Ps]

definition P_0xbaee_false_8_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0xbaee_false_8_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((RDI\<^sub>0::64 word) + 0xc), 4),
    (2, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x30), 8)
  }\<close>

definition P_0xbaee_false_8_regions :: state_pred where
  \<open>P_0xbaee_false_8_regions \<sigma> \<equiv> \<exists>regions. P_0xbaee_false_8_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0xbaf6_8 :: state_pred where
  \<open>Q_0xbaf6_8 \<sigma> \<equiv> RIP \<sigma> = 0xbaf6 \<and> RAX \<sigma> = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0xc),4]::32 word)) \<and> RBX \<sigma> = ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)) \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = ucast ((\<langle>31,0\<rangle>((RSI\<^sub>0::64 word) + 0x1)::32 word)) \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x58) \<and> RBP \<sigma> = ucast ((((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0xc),4]::32 word)::32 word) - 0x1)) \<and> R15 \<sigma> = RDI\<^sub>0 \<and> R14 \<sigma> = R14\<^sub>0 \<and> R13 \<sigma> = R13\<^sub>0 \<and> R12 \<sigma> = R12\<^sub>0 \<and> R9 \<sigma> = R9\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0xc),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0xc),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0\<close>
declare Q_0xbaf6_8_def[Qs]

schematic_goal array_remove_0_2_0xbaee_0xbaf4_8[blocks]:
  assumes \<open>(P_0xbaee_false_8 && P_0xbaee_false_8_regions && ! SF) \<sigma>\<close>
  shows \<open>exec_block 2 0xbaf4 8 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0xbaf6_8 ?\<sigma> \<and> block_usage P_0xbaee_false_8_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0xbaee_false_8_def P_0xbaee_false_8_regions_def post: Q_0xbaf6_8_def regionset: P_0xbaee_false_8_regions_set_def)

definition P_0xbaf6_true_9 :: state_pred where
  \<open>P_0xbaf6_true_9 \<sigma> \<equiv> RIP \<sigma> = 0xbaf6 \<and> RAX \<sigma> = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0xc),4]::32 word)) \<and> RBX \<sigma> = ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)) \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = ucast ((\<langle>31,0\<rangle>((RSI\<^sub>0::64 word) + 0x1)::32 word)) \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x58) \<and> RBP \<sigma> = ucast ((((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0xc),4]::32 word)::32 word) - 0x1)) \<and> R15 \<sigma> = RDI\<^sub>0 \<and> R14 \<sigma> = R14\<^sub>0 \<and> R13 \<sigma> = R13\<^sub>0 \<and> R12 \<sigma> = R12\<^sub>0 \<and> R9 \<sigma> = R9\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0xc),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0xc),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0\<close>
declare P_0xbaf6_true_9_def[Ps]

definition P_0xbaf6_true_9_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0xbaf6_true_9_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((RDI\<^sub>0::64 word) + 0xc), 4),
    (2, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x30), 8)
  }\<close>

definition P_0xbaf6_true_9_regions :: state_pred where
  \<open>P_0xbaf6_true_9_regions \<sigma> \<equiv> \<exists>regions. P_0xbaf6_true_9_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0xbb96_9 :: state_pred where
  \<open>Q_0xbb96_9 \<sigma> \<equiv> RIP \<sigma> = 0xbb96 \<and> RBX \<sigma> = ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)) \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x58) \<and> R15 \<sigma> = RDI\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0\<close>
declare Q_0xbb96_9_def[Qs]

schematic_goal array_remove_0_3_0xbaf6_0xbbc5_9[blocks]:
  assumes \<open>(P_0xbaf6_true_9 && P_0xbaf6_true_9_regions && jbe) \<sigma>\<close>
  shows \<open>exec_block 3 0xbbc5 9 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0xbb96_9 ?\<sigma> \<and> block_usage P_0xbaf6_true_9_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0xbaf6_true_9_def P_0xbaf6_true_9_regions_def post: Q_0xbb96_9_def regionset: P_0xbaf6_true_9_regions_set_def)

definition P_0xbaf6_false_10 :: state_pred where
  \<open>P_0xbaf6_false_10 \<sigma> \<equiv> RIP \<sigma> = 0xbaf6 \<and> RAX \<sigma> = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0xc),4]::32 word)) \<and> RBX \<sigma> = ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)) \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = ucast ((\<langle>31,0\<rangle>((RSI\<^sub>0::64 word) + 0x1)::32 word)) \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x58) \<and> RBP \<sigma> = ucast ((((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0xc),4]::32 word)::32 word) - 0x1)) \<and> R15 \<sigma> = RDI\<^sub>0 \<and> R14 \<sigma> = R14\<^sub>0 \<and> R13 \<sigma> = R13\<^sub>0 \<and> R12 \<sigma> = R12\<^sub>0 \<and> R9 \<sigma> = R9\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0xc),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0xc),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0\<close>
declare P_0xbaf6_false_10_def[Ps]

definition P_0xbaf6_false_10_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0xbaf6_false_10_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((RDI\<^sub>0::64 word) + 0xc), 4),
    (2, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x30), 8)
  }\<close>

definition P_0xbaf6_false_10_regions :: state_pred where
  \<open>P_0xbaf6_false_10_regions \<sigma> \<equiv> \<exists>regions. P_0xbaf6_false_10_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0xbafe_10 :: state_pred where
  \<open>Q_0xbafe_10 \<sigma> \<equiv> RIP \<sigma> = 0xbafe \<and> RAX \<sigma> = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0xc),4]::32 word)) \<and> RBX \<sigma> = ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)) \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = ucast ((\<langle>31,0\<rangle>((RSI\<^sub>0::64 word) + 0x1)::32 word)) \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x58) \<and> RBP \<sigma> = ucast ((((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0xc),4]::32 word)::32 word) - 0x1)) \<and> R15 \<sigma> = RDI\<^sub>0 \<and> R14 \<sigma> = R14\<^sub>0 \<and> R13 \<sigma> = R13\<^sub>0 \<and> R12 \<sigma> = R12\<^sub>0 \<and> R9 \<sigma> = R9\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0xc),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0xc),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0\<close>
declare Q_0xbafe_10_def[Qs]

schematic_goal array_remove_0_2_0xbaf6_0xbafc_10[blocks]:
  assumes \<open>(P_0xbaf6_false_10 && P_0xbaf6_false_10_regions && ! jbe) \<sigma>\<close>
  shows \<open>exec_block 2 0xbafc 10 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0xbafe_10 ?\<sigma> \<and> block_usage P_0xbaf6_false_10_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0xbaf6_false_10_def P_0xbaf6_false_10_regions_def post: Q_0xbafe_10_def regionset: P_0xbaf6_false_10_regions_set_def)

definition P_0xbafe_true_11 :: state_pred where
  \<open>P_0xbafe_true_11 \<sigma> \<equiv> RIP \<sigma> = 0xbafe \<and> RAX \<sigma> = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0xc),4]::32 word)) \<and> RBX \<sigma> = ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)) \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = ucast ((\<langle>31,0\<rangle>((RSI\<^sub>0::64 word) + 0x1)::32 word)) \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x58) \<and> RBP \<sigma> = ucast ((((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0xc),4]::32 word)::32 word) - 0x1)) \<and> R15 \<sigma> = RDI\<^sub>0 \<and> R14 \<sigma> = R14\<^sub>0 \<and> R13 \<sigma> = R13\<^sub>0 \<and> R12 \<sigma> = R12\<^sub>0 \<and> R9 \<sigma> = R9\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0xc),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0xc),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0\<close>
declare P_0xbafe_true_11_def[Ps]

definition P_0xbafe_true_11_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0xbafe_true_11_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((RDI\<^sub>0::64 word) + 0xc), 4),
    (2, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x30), 8)
  }\<close>

definition P_0xbafe_true_11_regions :: state_pred where
  \<open>P_0xbafe_true_11_regions \<sigma> \<equiv> \<exists>regions. P_0xbafe_true_11_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0xbb90_11 :: state_pred where
  \<open>Q_0xbb90_11 \<sigma> \<equiv> RIP \<sigma> = 0xbb90 \<and> RAX \<sigma> = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0xc),4]::32 word)) \<and> RBX \<sigma> = ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)) \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x58) \<and> R15 \<sigma> = RDI\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0xc),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0xc),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0\<close>
declare Q_0xbb90_11_def[Qs]

schematic_goal array_remove_0_1_0xbafe_0xbafe_11[blocks]:
  assumes \<open>(P_0xbafe_true_11 && P_0xbafe_true_11_regions && ZF) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0xbafe 11 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0xbb90_11 ?\<sigma> \<and> block_usage P_0xbafe_true_11_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0xbafe_true_11_def P_0xbafe_true_11_regions_def post: Q_0xbb90_11_def regionset: P_0xbafe_true_11_regions_set_def)

definition P_0xbafe_false_12 :: state_pred where
  \<open>P_0xbafe_false_12 \<sigma> \<equiv> RIP \<sigma> = 0xbafe \<and> RAX \<sigma> = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0xc),4]::32 word)) \<and> RBX \<sigma> = ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)) \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = ucast ((\<langle>31,0\<rangle>((RSI\<^sub>0::64 word) + 0x1)::32 word)) \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x58) \<and> RBP \<sigma> = ucast ((((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0xc),4]::32 word)::32 word) - 0x1)) \<and> R15 \<sigma> = RDI\<^sub>0 \<and> R14 \<sigma> = R14\<^sub>0 \<and> R13 \<sigma> = R13\<^sub>0 \<and> R12 \<sigma> = R12\<^sub>0 \<and> R9 \<sigma> = R9\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0xc),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0xc),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0\<close>
declare P_0xbafe_false_12_def[Ps]

definition P_0xbafe_false_12_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0xbafe_false_12_regions_set \<sigma> \<equiv> {
    (0, RDI\<^sub>0, 8),
    (1, RSP\<^sub>0, 8),
    (2, ((RDI\<^sub>0::64 word) + 0xc), 4),
    (3, ((RDI\<^sub>0::64 word) + 0x10), 4),
    (4, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x40), 8),
    (11, ((RSP\<^sub>0::64 word) - 0x48), 8),
    (12, ((RSP\<^sub>0::64 word) - 0x50), 8)
  }\<close>

definition P_0xbafe_false_12_regions :: state_pred where
  \<open>P_0xbafe_false_12_regions \<sigma> \<equiv> \<exists>regions. P_0xbafe_false_12_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0xbb39_12 :: state_pred where
  \<open>Q_0xbb39_12 \<sigma> \<equiv> RIP \<sigma> = 0xbb39 \<and> RAX \<sigma> = (((\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word)::64 word) + (\<langle>63,0\<rangle>(((\<langle>63,0\<rangle>(sextend (ucast ((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) * (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x10),4]::32 word))::32 word))) 32 64::64 word)::64 word)::64 word) * 0x1)::64 word)) \<and> RBX \<sigma> = ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)) \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = ucast ((\<langle>31,0\<rangle>((RSI\<^sub>0::64 word) + 0x1)::32 word)) \<and> RDI \<sigma> = (sextend (ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x10),4]::32 word))) 32 64::64 word) \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x58) \<and> RBP \<sigma> = ucast ((((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0xc),4]::32 word)::32 word) - 0x1)) \<and> R15 \<sigma> = RDI\<^sub>0 \<and> R14 \<sigma> = R14\<^sub>0 \<and> R13 \<sigma> = (((\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word)::64 word) + (sextend (ucast ((\<langle>31,0\<rangle>(((((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0xc),4]::32 word)::32 word) - 0x1)::32 word) * (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x10),4]::32 word))::32 word))) 32 64::64 word)) \<and> R12 \<sigma> = (sextend (ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x10),4]::32 word))) 32 64::64 word) \<and> R9 \<sigma> = (sextend (ucast ((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) * (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x10),4]::32 word))::32 word))) 32 64::64 word) \<and> R8 \<sigma> = (sextend (ucast ((\<langle>31,0\<rangle>(((((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0xc),4]::32 word)::32 word) - 0x1)::32 word) * (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x10),4]::32 word))::32 word))) 32 64::64 word) \<and> (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) = (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0xc),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0xc),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x10),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x10),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (sextend (ucast ((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) * (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x10),4]::32 word))::32 word))) 32 64::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x48),8]::64 word) = (sextend (ucast ((\<langle>31,0\<rangle>(((((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0xc),4]::32 word)::32 word) - 0x1)::32 word) * (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x10),4]::32 word))::32 word))) 32 64::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),8]::64 word) = (((\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word)::64 word) + (\<langle>63,0\<rangle>(((\<langle>63,0\<rangle>(sextend (ucast ((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) * (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x10),4]::32 word))::32 word))) 32 64::64 word)::64 word)::64 word) * 0x1)::64 word))\<close>
declare Q_0xbb39_12_def[Qs]

schematic_goal array_remove_0_15_0xbafe_0xbb34_12[blocks]:
  assumes \<open>(P_0xbafe_false_12 && P_0xbafe_false_12_regions && ! ZF) \<sigma>\<close>
  shows \<open>exec_block 15 0xbb34 12 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0xbb39_12 ?\<sigma> \<and> block_usage P_0xbafe_false_12_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0xbafe_false_12_def P_0xbafe_false_12_regions_def post: Q_0xbb39_12_def regionset: P_0xbafe_false_12_regions_set_def)

definition P_0xbb39_13 :: state_pred where
  \<open>P_0xbb39_13 \<sigma> \<equiv> RIP \<sigma> = 0xbb39 \<and> RAX \<sigma> = (((\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word)::64 word) + (\<langle>63,0\<rangle>(((\<langle>63,0\<rangle>(sextend (ucast ((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) * (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x10),4]::32 word))::32 word))) 32 64::64 word)::64 word)::64 word) * 0x1)::64 word)) \<and> RBX \<sigma> = ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)) \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = ucast ((\<langle>31,0\<rangle>((RSI\<^sub>0::64 word) + 0x1)::32 word)) \<and> RDI \<sigma> = (sextend (ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x10),4]::32 word))) 32 64::64 word) \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x58) \<and> RBP \<sigma> = ucast ((((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0xc),4]::32 word)::32 word) - 0x1)) \<and> R15 \<sigma> = RDI\<^sub>0 \<and> R14 \<sigma> = R14\<^sub>0 \<and> R13 \<sigma> = (((\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word)::64 word) + (sextend (ucast ((\<langle>31,0\<rangle>(((((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0xc),4]::32 word)::32 word) - 0x1)::32 word) * (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x10),4]::32 word))::32 word))) 32 64::64 word)) \<and> R12 \<sigma> = (sextend (ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x10),4]::32 word))) 32 64::64 word) \<and> R9 \<sigma> = (sextend (ucast ((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) * (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x10),4]::32 word))::32 word))) 32 64::64 word) \<and> R8 \<sigma> = (sextend (ucast ((\<langle>31,0\<rangle>(((((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0xc),4]::32 word)::32 word) - 0x1)::32 word) * (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x10),4]::32 word))::32 word))) 32 64::64 word) \<and> (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) = (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0xc),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0xc),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x10),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x10),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (sextend (ucast ((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) * (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x10),4]::32 word))::32 word))) 32 64::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x48),8]::64 word) = (sextend (ucast ((\<langle>31,0\<rangle>(((((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0xc),4]::32 word)::32 word) - 0x1)::32 word) * (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x10),4]::32 word))::32 word))) 32 64::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),8]::64 word) = (((\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word)::64 word) + (\<langle>63,0\<rangle>(((\<langle>63,0\<rangle>(sextend (ucast ((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) * (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x10),4]::32 word))::32 word))) 32 64::64 word)::64 word)::64 word) * 0x1)::64 word))\<close>
declare P_0xbb39_13_def[Ps]

definition P_0xbb39_13_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0xbb39_13_regions_set \<sigma> \<equiv> {
    (0, RDI\<^sub>0, 8),
    (1, RSP\<^sub>0, 8),
    (2, ((RDI\<^sub>0::64 word) + 0xc), 4),
    (3, ((RDI\<^sub>0::64 word) + 0x10), 4),
    (4, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x40), 8),
    (11, ((RSP\<^sub>0::64 word) - 0x48), 8),
    (12, ((RSP\<^sub>0::64 word) - 0x50), 8),
    (13, ((RSP\<^sub>0::64 word) - 0x60), 8)
  }\<close>

definition P_0xbb39_13_regions :: state_pred where
  \<open>P_0xbb39_13_regions \<sigma> \<equiv> \<exists>regions. P_0xbb39_13_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_qemu_malloc_addr_0xbb39_13 :: state_pred where
  \<open>Q_qemu_malloc_addr_0xbb39_13 \<sigma> \<equiv> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x60) \<and> RIP \<sigma> = qemu_malloc_addr \<and> RAX \<sigma> = (((\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word)::64 word) + (\<langle>63,0\<rangle>(((\<langle>63,0\<rangle>(sextend (ucast ((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) * (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x10),4]::32 word))::32 word))) 32 64::64 word)::64 word)::64 word) * 0x1)::64 word)) \<and> RBX \<sigma> = ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)) \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = ucast ((\<langle>31,0\<rangle>((RSI\<^sub>0::64 word) + 0x1)::32 word)) \<and> RDI \<sigma> = (sextend (ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x10),4]::32 word))) 32 64::64 word) \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RBP \<sigma> = ucast ((((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0xc),4]::32 word)::32 word) - 0x1)) \<and> R15 \<sigma> = RDI\<^sub>0 \<and> R14 \<sigma> = R14\<^sub>0 \<and> R13 \<sigma> = (((\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word)::64 word) + (sextend (ucast ((\<langle>31,0\<rangle>(((((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0xc),4]::32 word)::32 word) - 0x1)::32 word) * (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x10),4]::32 word))::32 word))) 32 64::64 word)) \<and> R12 \<sigma> = (sextend (ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x10),4]::32 word))) 32 64::64 word) \<and> R9 \<sigma> = (sextend (ucast ((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) * (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x10),4]::32 word))::32 word))) 32 64::64 word) \<and> R8 \<sigma> = (sextend (ucast ((\<langle>31,0\<rangle>(((((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0xc),4]::32 word)::32 word) - 0x1)::32 word) * (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x10),4]::32 word))::32 word))) 32 64::64 word) \<and> (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) = (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0xc),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0xc),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x10),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x10),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (sextend (ucast ((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) * (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x10),4]::32 word))::32 word))) 32 64::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x48),8]::64 word) = (sextend (ucast ((\<langle>31,0\<rangle>(((((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0xc),4]::32 word)::32 word) - 0x1)::32 word) * (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x10),4]::32 word))::32 word))) 32 64::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),8]::64 word) = (((\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word)::64 word) + (\<langle>63,0\<rangle>(((\<langle>63,0\<rangle>(sextend (ucast ((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) * (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x10),4]::32 word))::32 word))) 32 64::64 word)::64 word)::64 word) * 0x1)::64 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x60),8]::64 word) = 0xbb3e\<close>
declare Q_qemu_malloc_addr_0xbb39_13_def[Qs]

schematic_goal array_remove_0_1_0xbb39_0xbb39_13[blocks]:
  assumes \<open>(P_0xbb39_13 && P_0xbb39_13_regions) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0xbb39 13 \<sigma> \<triangleq> ?\<sigma> \<and> Q_qemu_malloc_addr_0xbb39_13 ?\<sigma> \<and> block_usage P_0xbb39_13_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0xbb39_13_def P_0xbb39_13_regions_def post: Q_qemu_malloc_addr_0xbb39_13_def regionset: P_0xbb39_13_regions_set_def)

definition P_0xbb3e_14 :: state_pred where
  \<open>P_0xbb3e_14 \<sigma> \<equiv> RIP \<sigma> = 0xbb3e \<and> RAX \<sigma> = qemu_malloc_0xbb39_retval \<and> RBX \<sigma> = ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)) \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = ucast ((\<langle>31,0\<rangle>((RSI\<^sub>0::64 word) + 0x1)::32 word)) \<and> RDI \<sigma> = (sextend (ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x10),4]::32 word))) 32 64::64 word) \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x58) \<and> RBP \<sigma> = ucast ((((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0xc),4]::32 word)::32 word) - 0x1)) \<and> R15 \<sigma> = RDI\<^sub>0 \<and> R14 \<sigma> = R14\<^sub>0 \<and> R13 \<sigma> = (((\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word)::64 word) + (sextend (ucast ((\<langle>31,0\<rangle>(((((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0xc),4]::32 word)::32 word) - 0x1)::32 word) * (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x10),4]::32 word))::32 word))) 32 64::64 word)) \<and> R12 \<sigma> = (sextend (ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x10),4]::32 word))) 32 64::64 word) \<and> R9 \<sigma> = (sextend (ucast ((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) * (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x10),4]::32 word))::32 word))) 32 64::64 word) \<and> R8 \<sigma> = (sextend (ucast ((\<langle>31,0\<rangle>(((((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0xc),4]::32 word)::32 word) - 0x1)::32 word) * (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x10),4]::32 word))::32 word))) 32 64::64 word) \<and> (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) = (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0xc),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0xc),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x10),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x10),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (sextend (ucast ((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) * (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x10),4]::32 word))::32 word))) 32 64::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x48),8]::64 word) = (sextend (ucast ((\<langle>31,0\<rangle>(((((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0xc),4]::32 word)::32 word) - 0x1)::32 word) * (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x10),4]::32 word))::32 word))) 32 64::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),8]::64 word) = (((\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word)::64 word) + (\<langle>63,0\<rangle>(((\<langle>63,0\<rangle>(sextend (ucast ((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) * (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x10),4]::32 word))::32 word))) 32 64::64 word)::64 word)::64 word) * 0x1)::64 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x60),8]::64 word) = 0xbb3e\<close>
declare P_0xbb3e_14_def[Ps]

definition P_0xbb3e_14_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0xbb3e_14_regions_set \<sigma> \<equiv> {
    (0, RDI\<^sub>0, 8),
    (1, RSP\<^sub>0, 8),
    (2, ((RDI\<^sub>0::64 word) + 0xc), 4),
    (3, ((RDI\<^sub>0::64 word) + 0x10), 4),
    (4, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x40), 8),
    (11, ((RSP\<^sub>0::64 word) - 0x48), 8),
    (12, ((RSP\<^sub>0::64 word) - 0x50), 8),
    (13, ((RSP\<^sub>0::64 word) - 0x60), 8)
  }\<close>

definition P_0xbb3e_14_regions :: state_pred where
  \<open>P_0xbb3e_14_regions \<sigma> \<equiv> \<exists>regions. P_0xbb3e_14_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0xbb4c_14 :: state_pred where
  \<open>Q_0xbb4c_14 \<sigma> \<equiv> RIP \<sigma> = 0xbb4c \<and> RAX \<sigma> = qemu_malloc_0xbb39_retval \<and> RBX \<sigma> = ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)) \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = (sextend (ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x10),4]::32 word))) 32 64::64 word) \<and> RDI \<sigma> = qemu_malloc_0xbb39_retval \<and> RSI \<sigma> = (((\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word)::64 word) + (\<langle>63,0\<rangle>(((\<langle>63,0\<rangle>(sextend (ucast ((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) * (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x10),4]::32 word))::32 word))) 32 64::64 word)::64 word)::64 word) * 0x1)::64 word)) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x58) \<and> RBP \<sigma> = ucast ((((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0xc),4]::32 word)::32 word) - 0x1)) \<and> R15 \<sigma> = RDI\<^sub>0 \<and> R14 \<sigma> = qemu_malloc_0xbb39_retval \<and> R13 \<sigma> = (((\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word)::64 word) + (sextend (ucast ((\<langle>31,0\<rangle>(((((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0xc),4]::32 word)::32 word) - 0x1)::32 word) * (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x10),4]::32 word))::32 word))) 32 64::64 word)) \<and> R12 \<sigma> = (sextend (ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x10),4]::32 word))) 32 64::64 word) \<and> R9 \<sigma> = (sextend (ucast ((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) * (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x10),4]::32 word))::32 word))) 32 64::64 word) \<and> R8 \<sigma> = (sextend (ucast ((\<langle>31,0\<rangle>(((((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0xc),4]::32 word)::32 word) - 0x1)::32 word) * (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x10),4]::32 word))::32 word))) 32 64::64 word) \<and> (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) = (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0xc),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0xc),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x10),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x10),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (sextend (ucast ((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) * (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x10),4]::32 word))::32 word))) 32 64::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x48),8]::64 word) = (sextend (ucast ((\<langle>31,0\<rangle>(((((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0xc),4]::32 word)::32 word) - 0x1)::32 word) * (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x10),4]::32 word))::32 word))) 32 64::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),8]::64 word) = (((\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word)::64 word) + (\<langle>63,0\<rangle>(((\<langle>63,0\<rangle>(sextend (ucast ((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) * (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x10),4]::32 word))::32 word))) 32 64::64 word)::64 word)::64 word) * 0x1)::64 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x60),8]::64 word) = 0xbb3e\<close>
declare Q_0xbb4c_14_def[Qs]

schematic_goal array_remove_0_4_0xbb3e_0xbb49_14[blocks]:
  assumes \<open>(P_0xbb3e_14 && P_0xbb3e_14_regions) \<sigma>\<close>
  shows \<open>exec_block 4 0xbb49 14 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0xbb4c_14 ?\<sigma> \<and> block_usage P_0xbb3e_14_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0xbb3e_14_def P_0xbb3e_14_regions_def post: Q_0xbb4c_14_def regionset: P_0xbb3e_14_regions_set_def)

definition P_0xbb4c_15 :: state_pred where
  \<open>P_0xbb4c_15 \<sigma> \<equiv> RIP \<sigma> = 0xbb4c \<and> RAX \<sigma> = qemu_malloc_0xbb39_retval \<and> RBX \<sigma> = ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)) \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = (sextend (ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x10),4]::32 word))) 32 64::64 word) \<and> RDI \<sigma> = qemu_malloc_0xbb39_retval \<and> RSI \<sigma> = (((\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word)::64 word) + (\<langle>63,0\<rangle>(((\<langle>63,0\<rangle>(sextend (ucast ((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) * (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x10),4]::32 word))::32 word))) 32 64::64 word)::64 word)::64 word) * 0x1)::64 word)) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x58) \<and> RBP \<sigma> = ucast ((((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0xc),4]::32 word)::32 word) - 0x1)) \<and> R15 \<sigma> = RDI\<^sub>0 \<and> R14 \<sigma> = qemu_malloc_0xbb39_retval \<and> R13 \<sigma> = (((\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word)::64 word) + (sextend (ucast ((\<langle>31,0\<rangle>(((((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0xc),4]::32 word)::32 word) - 0x1)::32 word) * (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x10),4]::32 word))::32 word))) 32 64::64 word)) \<and> R12 \<sigma> = (sextend (ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x10),4]::32 word))) 32 64::64 word) \<and> R9 \<sigma> = (sextend (ucast ((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) * (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x10),4]::32 word))::32 word))) 32 64::64 word) \<and> R8 \<sigma> = (sextend (ucast ((\<langle>31,0\<rangle>(((((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0xc),4]::32 word)::32 word) - 0x1)::32 word) * (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x10),4]::32 word))::32 word))) 32 64::64 word) \<and> (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) = (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0xc),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0xc),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x10),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x10),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (sextend (ucast ((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) * (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x10),4]::32 word))::32 word))) 32 64::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x48),8]::64 word) = (sextend (ucast ((\<langle>31,0\<rangle>(((((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0xc),4]::32 word)::32 word) - 0x1)::32 word) * (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x10),4]::32 word))::32 word))) 32 64::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),8]::64 word) = (((\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word)::64 word) + (\<langle>63,0\<rangle>(((\<langle>63,0\<rangle>(sextend (ucast ((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) * (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x10),4]::32 word))::32 word))) 32 64::64 word)::64 word)::64 word) * 0x1)::64 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x60),8]::64 word) = 0xbb3e\<close>
declare P_0xbb4c_15_def[Ps]

definition P_0xbb4c_15_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0xbb4c_15_regions_set \<sigma> \<equiv> {
    (0, RDI\<^sub>0, 8),
    (1, RSP\<^sub>0, 8),
    (2, ((RDI\<^sub>0::64 word) + 0xc), 4),
    (3, ((RDI\<^sub>0::64 word) + 0x10), 4),
    (4, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x40), 8),
    (11, ((RSP\<^sub>0::64 word) - 0x48), 8),
    (12, ((RSP\<^sub>0::64 word) - 0x50), 8),
    (13, ((RSP\<^sub>0::64 word) - 0x60), 8)
  }\<close>

definition P_0xbb4c_15_regions :: state_pred where
  \<open>P_0xbb4c_15_regions \<sigma> \<equiv> \<exists>regions. P_0xbb4c_15_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_memcpy_addr_0xbb4c_15 :: state_pred where
  \<open>Q_memcpy_addr_0xbb4c_15 \<sigma> \<equiv> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x60) \<and> RIP \<sigma> = memcpy_addr \<and> RAX \<sigma> = qemu_malloc_0xbb39_retval \<and> RBX \<sigma> = ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)) \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = (sextend (ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x10),4]::32 word))) 32 64::64 word) \<and> RDI \<sigma> = qemu_malloc_0xbb39_retval \<and> RSI \<sigma> = (((\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word)::64 word) + (\<langle>63,0\<rangle>(((\<langle>63,0\<rangle>(sextend (ucast ((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) * (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x10),4]::32 word))::32 word))) 32 64::64 word)::64 word)::64 word) * 0x1)::64 word)) \<and> RBP \<sigma> = ucast ((((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0xc),4]::32 word)::32 word) - 0x1)) \<and> R15 \<sigma> = RDI\<^sub>0 \<and> R14 \<sigma> = qemu_malloc_0xbb39_retval \<and> R13 \<sigma> = (((\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word)::64 word) + (sextend (ucast ((\<langle>31,0\<rangle>(((((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0xc),4]::32 word)::32 word) - 0x1)::32 word) * (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x10),4]::32 word))::32 word))) 32 64::64 word)) \<and> R12 \<sigma> = (sextend (ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x10),4]::32 word))) 32 64::64 word) \<and> R9 \<sigma> = (sextend (ucast ((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) * (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x10),4]::32 word))::32 word))) 32 64::64 word) \<and> R8 \<sigma> = (sextend (ucast ((\<langle>31,0\<rangle>(((((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0xc),4]::32 word)::32 word) - 0x1)::32 word) * (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x10),4]::32 word))::32 word))) 32 64::64 word) \<and> (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) = (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0xc),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0xc),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x10),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x10),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (sextend (ucast ((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) * (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x10),4]::32 word))::32 word))) 32 64::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x48),8]::64 word) = (sextend (ucast ((\<langle>31,0\<rangle>(((((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0xc),4]::32 word)::32 word) - 0x1)::32 word) * (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x10),4]::32 word))::32 word))) 32 64::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),8]::64 word) = (((\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word)::64 word) + (\<langle>63,0\<rangle>(((\<langle>63,0\<rangle>(sextend (ucast ((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) * (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x10),4]::32 word))::32 word))) 32 64::64 word)::64 word)::64 word) * 0x1)::64 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x60),8]::64 word) = 0xbb51\<close>
declare Q_memcpy_addr_0xbb4c_15_def[Qs]

schematic_goal array_remove_0_1_0xbb4c_0xbb4c_15[blocks]:
  assumes \<open>(P_0xbb4c_15 && P_0xbb4c_15_regions) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0xbb4c 15 \<sigma> \<triangleq> ?\<sigma> \<and> Q_memcpy_addr_0xbb4c_15 ?\<sigma> \<and> block_usage P_0xbb4c_15_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0xbb4c_15_def P_0xbb4c_15_regions_def post: Q_memcpy_addr_0xbb4c_15_def regionset: P_0xbb4c_15_regions_set_def)

definition P_0xbb51_16 :: state_pred where
  \<open>P_0xbb51_16 \<sigma> \<equiv> RIP \<sigma> = 0xbb51 \<and> RAX \<sigma> = memcpy_0xbb4c_retval \<and> RBX \<sigma> = ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)) \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = (sextend (ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x10),4]::32 word))) 32 64::64 word) \<and> RDI \<sigma> = qemu_malloc_0xbb39_retval \<and> RSI \<sigma> = (((\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word)::64 word) + (\<langle>63,0\<rangle>(((\<langle>63,0\<rangle>(sextend (ucast ((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) * (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x10),4]::32 word))::32 word))) 32 64::64 word)::64 word)::64 word) * 0x1)::64 word)) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x58) \<and> RBP \<sigma> = ucast ((((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0xc),4]::32 word)::32 word) - 0x1)) \<and> R15 \<sigma> = RDI\<^sub>0 \<and> R14 \<sigma> = qemu_malloc_0xbb39_retval \<and> R13 \<sigma> = (((\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word)::64 word) + (sextend (ucast ((\<langle>31,0\<rangle>(((((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0xc),4]::32 word)::32 word) - 0x1)::32 word) * (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x10),4]::32 word))::32 word))) 32 64::64 word)) \<and> R12 \<sigma> = (sextend (ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x10),4]::32 word))) 32 64::64 word) \<and> R9 \<sigma> = (sextend (ucast ((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) * (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x10),4]::32 word))::32 word))) 32 64::64 word) \<and> R8 \<sigma> = (sextend (ucast ((\<langle>31,0\<rangle>(((((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0xc),4]::32 word)::32 word) - 0x1)::32 word) * (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x10),4]::32 word))::32 word))) 32 64::64 word) \<and> (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) = (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0xc),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0xc),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x10),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x10),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (sextend (ucast ((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) * (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x10),4]::32 word))::32 word))) 32 64::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x48),8]::64 word) = (sextend (ucast ((\<langle>31,0\<rangle>(((((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0xc),4]::32 word)::32 word) - 0x1)::32 word) * (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x10),4]::32 word))::32 word))) 32 64::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),8]::64 word) = (((\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word)::64 word) + (\<langle>63,0\<rangle>(((\<langle>63,0\<rangle>(sextend (ucast ((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) * (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x10),4]::32 word))::32 word))) 32 64::64 word)::64 word)::64 word) * 0x1)::64 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x60),8]::64 word) = 0xbb51\<close>
declare P_0xbb51_16_def[Ps]

definition P_0xbb51_16_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0xbb51_16_regions_set \<sigma> \<equiv> {
    (0, RDI\<^sub>0, 8),
    (1, RSP\<^sub>0, 8),
    (2, ((RDI\<^sub>0::64 word) + 0xc), 4),
    (3, ((RDI\<^sub>0::64 word) + 0x10), 4),
    (4, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x40), 8),
    (11, ((RSP\<^sub>0::64 word) - 0x48), 8),
    (12, ((RSP\<^sub>0::64 word) - 0x50), 8),
    (13, ((RSP\<^sub>0::64 word) - 0x60), 8)
  }\<close>

definition P_0xbb51_16_regions :: state_pred where
  \<open>P_0xbb51_16_regions \<sigma> \<equiv> \<exists>regions. P_0xbb51_16_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0xbb5d_16 :: state_pred where
  \<open>Q_0xbb5d_16 \<sigma> \<equiv> RIP \<sigma> = 0xbb5d \<and> RAX \<sigma> = memcpy_0xbb4c_retval \<and> RBX \<sigma> = ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)) \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = (sextend (ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x10),4]::32 word))) 32 64::64 word) \<and> RDI \<sigma> = qemu_malloc_0xbb39_retval \<and> RSI \<sigma> = (((\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word)::64 word) + (\<langle>63,0\<rangle>(((\<langle>63,0\<rangle>(sextend (ucast ((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) * (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x10),4]::32 word))::32 word))) 32 64::64 word)::64 word)::64 word) * 0x1)::64 word)) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x58) \<and> RBP \<sigma> = ucast ((((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0xc),4]::32 word)::32 word) - 0x1)) \<and> R15 \<sigma> = RDI\<^sub>0 \<and> R14 \<sigma> = qemu_malloc_0xbb39_retval \<and> R13 \<sigma> = (((\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word)::64 word) + (sextend (ucast ((\<langle>31,0\<rangle>(((((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0xc),4]::32 word)::32 word) - 0x1)::32 word) * (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x10),4]::32 word))::32 word))) 32 64::64 word)) \<and> R12 \<sigma> = (sextend (ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x10),4]::32 word))) 32 64::64 word) \<and> R9 \<sigma> = (sextend (ucast ((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) * (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x10),4]::32 word))::32 word))) 32 64::64 word) \<and> R8 \<sigma> = (sextend (ucast ((\<langle>31,0\<rangle>(((((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0xc),4]::32 word)::32 word) - 0x1)::32 word) * (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x10),4]::32 word))::32 word))) 32 64::64 word) \<and> (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) = (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0xc),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0xc),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x10),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x10),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (sextend (ucast ((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) * (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x10),4]::32 word))::32 word))) 32 64::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x48),8]::64 word) = (sextend (ucast ((\<langle>31,0\<rangle>(((((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0xc),4]::32 word)::32 word) - 0x1)::32 word) * (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x10),4]::32 word))::32 word))) 32 64::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),8]::64 word) = (((\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word)::64 word) + (\<langle>63,0\<rangle>(((\<langle>63,0\<rangle>(sextend (ucast ((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) * (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x10),4]::32 word))::32 word))) 32 64::64 word)::64 word)::64 word) * 0x1)::64 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x60),8]::64 word) = 0xbb51\<close>
declare Q_0xbb5d_16_def[Qs]

schematic_goal array_remove_0_3_0xbb51_0xbb58_16[blocks]:
  assumes \<open>(P_0xbb51_16 && P_0xbb51_16_regions) \<sigma>\<close>
  shows \<open>exec_block 3 0xbb58 16 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0xbb5d_16 ?\<sigma> \<and> block_usage P_0xbb51_16_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0xbb51_16_def P_0xbb51_16_regions_def post: Q_0xbb5d_16_def regionset: P_0xbb51_16_regions_set_def)

definition P_0xbb5d_true_17 :: state_pred where
  \<open>P_0xbb5d_true_17 \<sigma> \<equiv> RIP \<sigma> = 0xbb5d \<and> RAX \<sigma> = memcpy_0xbb4c_retval \<and> RBX \<sigma> = ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)) \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = (sextend (ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x10),4]::32 word))) 32 64::64 word) \<and> RDI \<sigma> = qemu_malloc_0xbb39_retval \<and> RSI \<sigma> = (((\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word)::64 word) + (\<langle>63,0\<rangle>(((\<langle>63,0\<rangle>(sextend (ucast ((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) * (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x10),4]::32 word))::32 word))) 32 64::64 word)::64 word)::64 word) * 0x1)::64 word)) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x58) \<and> RBP \<sigma> = ucast ((((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0xc),4]::32 word)::32 word) - 0x1)) \<and> R15 \<sigma> = RDI\<^sub>0 \<and> R14 \<sigma> = qemu_malloc_0xbb39_retval \<and> R13 \<sigma> = (((\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word)::64 word) + (sextend (ucast ((\<langle>31,0\<rangle>(((((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0xc),4]::32 word)::32 word) - 0x1)::32 word) * (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x10),4]::32 word))::32 word))) 32 64::64 word)) \<and> R12 \<sigma> = (sextend (ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x10),4]::32 word))) 32 64::64 word) \<and> R9 \<sigma> = (sextend (ucast ((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) * (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x10),4]::32 word))::32 word))) 32 64::64 word) \<and> R8 \<sigma> = (sextend (ucast ((\<langle>31,0\<rangle>(((((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0xc),4]::32 word)::32 word) - 0x1)::32 word) * (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x10),4]::32 word))::32 word))) 32 64::64 word) \<and> (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) = (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0xc),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0xc),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x10),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x10),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (sextend (ucast ((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) * (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x10),4]::32 word))::32 word))) 32 64::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x48),8]::64 word) = (sextend (ucast ((\<langle>31,0\<rangle>(((((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0xc),4]::32 word)::32 word) - 0x1)::32 word) * (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x10),4]::32 word))::32 word))) 32 64::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),8]::64 word) = (((\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word)::64 word) + (\<langle>63,0\<rangle>(((\<langle>63,0\<rangle>(sextend (ucast ((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) * (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x10),4]::32 word))::32 word))) 32 64::64 word)::64 word)::64 word) * 0x1)::64 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x60),8]::64 word) = 0xbb51\<close>
declare P_0xbb5d_true_17_def[Ps]

definition P_0xbb5d_true_17_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0xbb5d_true_17_regions_set \<sigma> \<equiv> {
    (0, RDI\<^sub>0, 8),
    (1, RSP\<^sub>0, 8),
    (2, ((RDI\<^sub>0::64 word) + 0xc), 4),
    (3, ((RDI\<^sub>0::64 word) + 0x10), 4),
    (4, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x40), 8),
    (11, ((RSP\<^sub>0::64 word) - 0x48), 8),
    (12, ((RSP\<^sub>0::64 word) - 0x50), 8),
    (13, ((RSP\<^sub>0::64 word) - 0x60), 8)
  }\<close>

definition P_0xbb5d_true_17_regions :: state_pred where
  \<open>P_0xbb5d_true_17_regions \<sigma> \<equiv> \<exists>regions. P_0xbb5d_true_17_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0xbbb6_17 :: state_pred where
  \<open>Q_0xbbb6_17 \<sigma> \<equiv> RIP \<sigma> = 0xbbb6 \<and> RAX \<sigma> = memcpy_0xbb4c_retval \<and> RBX \<sigma> = ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)) \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = (((sextend (ucast ((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) * (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x10),4]::32 word))::32 word))) 32 64::64 word)::64 word) - (sextend (ucast ((\<langle>31,0\<rangle>(((((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0xc),4]::32 word)::32 word) - 0x1)::32 word) * (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x10),4]::32 word))::32 word))) 32 64::64 word)) \<and> RDI \<sigma> = (((((\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word)::64 word) + (sextend (ucast ((\<langle>31,0\<rangle>(((((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0xc),4]::32 word)::32 word) - 0x1)::32 word) * (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x10),4]::32 word))::32 word))) 32 64::64 word))::64 word) + (\<langle>63,0\<rangle>(((sextend (ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x10),4]::32 word))) 32 64::64 word)::64 word) * 0x1)::64 word)) \<and> RSI \<sigma> = (((\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word)::64 word) + (sextend (ucast ((\<langle>31,0\<rangle>(((((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0xc),4]::32 word)::32 word) - 0x1)::32 word) * (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x10),4]::32 word))::32 word))) 32 64::64 word)) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x58) \<and> RBP \<sigma> = ucast ((((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0xc),4]::32 word)::32 word) - 0x1)) \<and> R15 \<sigma> = RDI\<^sub>0 \<and> R14 \<sigma> = qemu_malloc_0xbb39_retval \<and> R13 \<sigma> = (((\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word)::64 word) + (sextend (ucast ((\<langle>31,0\<rangle>(((((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0xc),4]::32 word)::32 word) - 0x1)::32 word) * (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x10),4]::32 word))::32 word))) 32 64::64 word)) \<and> R12 \<sigma> = (sextend (ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x10),4]::32 word))) 32 64::64 word) \<and> R9 \<sigma> = (sextend (ucast ((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) * (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x10),4]::32 word))::32 word))) 32 64::64 word) \<and> R8 \<sigma> = (sextend (ucast ((\<langle>31,0\<rangle>(((((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0xc),4]::32 word)::32 word) - 0x1)::32 word) * (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x10),4]::32 word))::32 word))) 32 64::64 word) \<and> (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) = (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0xc),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0xc),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x10),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x10),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (sextend (ucast ((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) * (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x10),4]::32 word))::32 word))) 32 64::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x48),8]::64 word) = (sextend (ucast ((\<langle>31,0\<rangle>(((((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0xc),4]::32 word)::32 word) - 0x1)::32 word) * (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x10),4]::32 word))::32 word))) 32 64::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),8]::64 word) = (((\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word)::64 word) + (\<langle>63,0\<rangle>(((\<langle>63,0\<rangle>(sextend (ucast ((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) * (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x10),4]::32 word))::32 word))) 32 64::64 word)::64 word)::64 word) * 0x1)::64 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x60),8]::64 word) = 0xbb51\<close>
declare Q_0xbbb6_17_def[Qs]

schematic_goal array_remove_0_5_0xbb5d_0xbbb3_17[blocks]:
  assumes \<open>(P_0xbb5d_true_17 && P_0xbb5d_true_17_regions && jg) \<sigma>\<close>
  shows \<open>exec_block 5 0xbbb3 17 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0xbbb6_17 ?\<sigma> \<and> block_usage P_0xbb5d_true_17_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0xbb5d_true_17_def P_0xbb5d_true_17_regions_def post: Q_0xbbb6_17_def regionset: P_0xbb5d_true_17_regions_set_def)

definition P_0xbbb6_18 :: state_pred where
  \<open>P_0xbbb6_18 \<sigma> \<equiv> RIP \<sigma> = 0xbbb6 \<and> RAX \<sigma> = memcpy_0xbb4c_retval \<and> RBX \<sigma> = ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)) \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = (((sextend (ucast ((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) * (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x10),4]::32 word))::32 word))) 32 64::64 word)::64 word) - (sextend (ucast ((\<langle>31,0\<rangle>(((((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0xc),4]::32 word)::32 word) - 0x1)::32 word) * (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x10),4]::32 word))::32 word))) 32 64::64 word)) \<and> RDI \<sigma> = (((((\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word)::64 word) + (sextend (ucast ((\<langle>31,0\<rangle>(((((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0xc),4]::32 word)::32 word) - 0x1)::32 word) * (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x10),4]::32 word))::32 word))) 32 64::64 word))::64 word) + (\<langle>63,0\<rangle>(((sextend (ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x10),4]::32 word))) 32 64::64 word)::64 word) * 0x1)::64 word)) \<and> RSI \<sigma> = (((\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word)::64 word) + (sextend (ucast ((\<langle>31,0\<rangle>(((((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0xc),4]::32 word)::32 word) - 0x1)::32 word) * (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x10),4]::32 word))::32 word))) 32 64::64 word)) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x58) \<and> RBP \<sigma> = ucast ((((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0xc),4]::32 word)::32 word) - 0x1)) \<and> R15 \<sigma> = RDI\<^sub>0 \<and> R14 \<sigma> = qemu_malloc_0xbb39_retval \<and> R13 \<sigma> = (((\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word)::64 word) + (sextend (ucast ((\<langle>31,0\<rangle>(((((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0xc),4]::32 word)::32 word) - 0x1)::32 word) * (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x10),4]::32 word))::32 word))) 32 64::64 word)) \<and> R12 \<sigma> = (sextend (ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x10),4]::32 word))) 32 64::64 word) \<and> R9 \<sigma> = (sextend (ucast ((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) * (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x10),4]::32 word))::32 word))) 32 64::64 word) \<and> R8 \<sigma> = (sextend (ucast ((\<langle>31,0\<rangle>(((((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0xc),4]::32 word)::32 word) - 0x1)::32 word) * (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x10),4]::32 word))::32 word))) 32 64::64 word) \<and> (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) = (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0xc),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0xc),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x10),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x10),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (sextend (ucast ((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) * (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x10),4]::32 word))::32 word))) 32 64::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x48),8]::64 word) = (sextend (ucast ((\<langle>31,0\<rangle>(((((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0xc),4]::32 word)::32 word) - 0x1)::32 word) * (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x10),4]::32 word))::32 word))) 32 64::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),8]::64 word) = (((\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word)::64 word) + (\<langle>63,0\<rangle>(((\<langle>63,0\<rangle>(sextend (ucast ((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) * (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x10),4]::32 word))::32 word))) 32 64::64 word)::64 word)::64 word) * 0x1)::64 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x60),8]::64 word) = 0xbb51\<close>
declare P_0xbbb6_18_def[Ps]

definition P_0xbbb6_18_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0xbbb6_18_regions_set \<sigma> \<equiv> {
    (0, RDI\<^sub>0, 8),
    (1, RSP\<^sub>0, 8),
    (2, ((RDI\<^sub>0::64 word) + 0xc), 4),
    (3, ((RDI\<^sub>0::64 word) + 0x10), 4),
    (4, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x40), 8),
    (11, ((RSP\<^sub>0::64 word) - 0x48), 8),
    (12, ((RSP\<^sub>0::64 word) - 0x50), 8),
    (13, ((RSP\<^sub>0::64 word) - 0x60), 8)
  }\<close>

definition P_0xbbb6_18_regions :: state_pred where
  \<open>P_0xbbb6_18_regions \<sigma> \<equiv> \<exists>regions. P_0xbbb6_18_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_memmove_addr_0xbbb6_18 :: state_pred where
  \<open>Q_memmove_addr_0xbbb6_18 \<sigma> \<equiv> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x60) \<and> RIP \<sigma> = memmove_addr \<and> RAX \<sigma> = memcpy_0xbb4c_retval \<and> RBX \<sigma> = ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)) \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = (((sextend (ucast ((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) * (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x10),4]::32 word))::32 word))) 32 64::64 word)::64 word) - (sextend (ucast ((\<langle>31,0\<rangle>(((((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0xc),4]::32 word)::32 word) - 0x1)::32 word) * (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x10),4]::32 word))::32 word))) 32 64::64 word)) \<and> RDI \<sigma> = (((((\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word)::64 word) + (sextend (ucast ((\<langle>31,0\<rangle>(((((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0xc),4]::32 word)::32 word) - 0x1)::32 word) * (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x10),4]::32 word))::32 word))) 32 64::64 word))::64 word) + (\<langle>63,0\<rangle>(((sextend (ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x10),4]::32 word))) 32 64::64 word)::64 word) * 0x1)::64 word)) \<and> RSI \<sigma> = (((\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word)::64 word) + (sextend (ucast ((\<langle>31,0\<rangle>(((((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0xc),4]::32 word)::32 word) - 0x1)::32 word) * (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x10),4]::32 word))::32 word))) 32 64::64 word)) \<and> RBP \<sigma> = ucast ((((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0xc),4]::32 word)::32 word) - 0x1)) \<and> R15 \<sigma> = RDI\<^sub>0 \<and> R14 \<sigma> = qemu_malloc_0xbb39_retval \<and> R13 \<sigma> = (((\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word)::64 word) + (sextend (ucast ((\<langle>31,0\<rangle>(((((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0xc),4]::32 word)::32 word) - 0x1)::32 word) * (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x10),4]::32 word))::32 word))) 32 64::64 word)) \<and> R12 \<sigma> = (sextend (ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x10),4]::32 word))) 32 64::64 word) \<and> R9 \<sigma> = (sextend (ucast ((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) * (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x10),4]::32 word))::32 word))) 32 64::64 word) \<and> R8 \<sigma> = (sextend (ucast ((\<langle>31,0\<rangle>(((((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0xc),4]::32 word)::32 word) - 0x1)::32 word) * (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x10),4]::32 word))::32 word))) 32 64::64 word) \<and> (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) = (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0xc),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0xc),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x10),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x10),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (sextend (ucast ((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) * (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x10),4]::32 word))::32 word))) 32 64::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x48),8]::64 word) = (sextend (ucast ((\<langle>31,0\<rangle>(((((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0xc),4]::32 word)::32 word) - 0x1)::32 word) * (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x10),4]::32 word))::32 word))) 32 64::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),8]::64 word) = (((\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word)::64 word) + (\<langle>63,0\<rangle>(((\<langle>63,0\<rangle>(sextend (ucast ((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) * (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x10),4]::32 word))::32 word))) 32 64::64 word)::64 word)::64 word) * 0x1)::64 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x60),8]::64 word) = 0xbbbb\<close>
declare Q_memmove_addr_0xbbb6_18_def[Qs]

schematic_goal array_remove_0_1_0xbbb6_0xbbb6_18[blocks]:
  assumes \<open>(P_0xbbb6_18 && P_0xbbb6_18_regions) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0xbbb6 18 \<sigma> \<triangleq> ?\<sigma> \<and> Q_memmove_addr_0xbbb6_18 ?\<sigma> \<and> block_usage P_0xbbb6_18_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0xbbb6_18_def P_0xbbb6_18_regions_def post: Q_memmove_addr_0xbbb6_18_def regionset: P_0xbbb6_18_regions_set_def)

definition P_0xbbbb_19 :: state_pred where
  \<open>P_0xbbbb_19 \<sigma> \<equiv> RIP \<sigma> = 0xbbbb \<and> RAX \<sigma> = memmove_0xbbb6_retval \<and> RBX \<sigma> = ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)) \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = (((sextend (ucast ((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) * (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x10),4]::32 word))::32 word))) 32 64::64 word)::64 word) - (sextend (ucast ((\<langle>31,0\<rangle>(((((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0xc),4]::32 word)::32 word) - 0x1)::32 word) * (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x10),4]::32 word))::32 word))) 32 64::64 word)) \<and> RDI \<sigma> = (((((\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word)::64 word) + (sextend (ucast ((\<langle>31,0\<rangle>(((((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0xc),4]::32 word)::32 word) - 0x1)::32 word) * (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x10),4]::32 word))::32 word))) 32 64::64 word))::64 word) + (\<langle>63,0\<rangle>(((sextend (ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x10),4]::32 word))) 32 64::64 word)::64 word) * 0x1)::64 word)) \<and> RSI \<sigma> = (((\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word)::64 word) + (sextend (ucast ((\<langle>31,0\<rangle>(((((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0xc),4]::32 word)::32 word) - 0x1)::32 word) * (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x10),4]::32 word))::32 word))) 32 64::64 word)) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x58) \<and> RBP \<sigma> = ucast ((((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0xc),4]::32 word)::32 word) - 0x1)) \<and> R15 \<sigma> = RDI\<^sub>0 \<and> R14 \<sigma> = qemu_malloc_0xbb39_retval \<and> R13 \<sigma> = (((\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word)::64 word) + (sextend (ucast ((\<langle>31,0\<rangle>(((((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0xc),4]::32 word)::32 word) - 0x1)::32 word) * (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x10),4]::32 word))::32 word))) 32 64::64 word)) \<and> R12 \<sigma> = (sextend (ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x10),4]::32 word))) 32 64::64 word) \<and> R9 \<sigma> = (sextend (ucast ((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) * (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x10),4]::32 word))::32 word))) 32 64::64 word) \<and> R8 \<sigma> = (sextend (ucast ((\<langle>31,0\<rangle>(((((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0xc),4]::32 word)::32 word) - 0x1)::32 word) * (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x10),4]::32 word))::32 word))) 32 64::64 word) \<and> (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) = (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0xc),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0xc),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x10),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x10),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (sextend (ucast ((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) * (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x10),4]::32 word))::32 word))) 32 64::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x48),8]::64 word) = (sextend (ucast ((\<langle>31,0\<rangle>(((((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0xc),4]::32 word)::32 word) - 0x1)::32 word) * (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x10),4]::32 word))::32 word))) 32 64::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),8]::64 word) = (((\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word)::64 word) + (\<langle>63,0\<rangle>(((\<langle>63,0\<rangle>(sextend (ucast ((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) * (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x10),4]::32 word))::32 word))) 32 64::64 word)::64 word)::64 word) * 0x1)::64 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x60),8]::64 word) = 0xbbbb\<close>
declare P_0xbbbb_19_def[Ps]

definition P_0xbbbb_19_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0xbbbb_19_regions_set \<sigma> \<equiv> {
    (0, RDI\<^sub>0, 8),
    (1, RSP\<^sub>0, 8),
    (2, ((RDI\<^sub>0::64 word) + 0xc), 4),
    (3, ((RDI\<^sub>0::64 word) + 0x10), 4),
    (4, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x40), 8),
    (11, ((RSP\<^sub>0::64 word) - 0x48), 8),
    (12, ((RSP\<^sub>0::64 word) - 0x50), 8),
    (13, ((RSP\<^sub>0::64 word) - 0x60), 8)
  }\<close>

definition P_0xbbbb_19_regions :: state_pred where
  \<open>P_0xbbbb_19_regions \<sigma> \<equiv> \<exists>regions. P_0xbbbb_19_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0xbb73_19 :: state_pred where
  \<open>Q_0xbb73_19 \<sigma> \<equiv> RIP \<sigma> = 0xbb73 \<and> RBX \<sigma> = ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)) \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x58) \<and> RBP \<sigma> = ucast ((((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0xc),4]::32 word)::32 word) - 0x1)) \<and> R15 \<sigma> = RDI\<^sub>0 \<and> R14 \<sigma> = qemu_malloc_0xbb39_retval \<and> R13 \<sigma> = (((\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word)::64 word) + (sextend (ucast ((\<langle>31,0\<rangle>(((((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0xc),4]::32 word)::32 word) - 0x1)::32 word) * (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x10),4]::32 word))::32 word))) 32 64::64 word)) \<and> R12 \<sigma> = (sextend (ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x10),4]::32 word))) 32 64::64 word) \<and> R9 \<sigma> = (sextend (ucast ((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) * (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x10),4]::32 word))::32 word))) 32 64::64 word) \<and> R8 \<sigma> = (sextend (ucast ((\<langle>31,0\<rangle>(((((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0xc),4]::32 word)::32 word) - 0x1)::32 word) * (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x10),4]::32 word))::32 word))) 32 64::64 word) \<and> (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) = (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0xc),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0xc),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x10),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x10),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (sextend (ucast ((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) * (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x10),4]::32 word))::32 word))) 32 64::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x48),8]::64 word) = (sextend (ucast ((\<langle>31,0\<rangle>(((((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0xc),4]::32 word)::32 word) - 0x1)::32 word) * (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x10),4]::32 word))::32 word))) 32 64::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),8]::64 word) = (((\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word)::64 word) + (\<langle>63,0\<rangle>(((\<langle>63,0\<rangle>(sextend (ucast ((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) * (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x10),4]::32 word))::32 word))) 32 64::64 word)::64 word)::64 word) * 0x1)::64 word))\<close>
declare Q_0xbb73_19_def[Qs]

schematic_goal array_remove_0_1_0xbbbb_0xbbbb_19[blocks]:
  assumes \<open>(P_0xbbbb_19 && P_0xbbbb_19_regions) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0xbbbb 19 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0xbb73_19 ?\<sigma> \<and> block_usage P_0xbbbb_19_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0xbbbb_19_def P_0xbbbb_19_regions_def post: Q_0xbb73_19_def regionset: P_0xbbbb_19_regions_set_def)

definition P_0xbb5d_false_20 :: state_pred where
  \<open>P_0xbb5d_false_20 \<sigma> \<equiv> RIP \<sigma> = 0xbb5d \<and> RAX \<sigma> = memcpy_0xbb4c_retval \<and> RBX \<sigma> = ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)) \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = (sextend (ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x10),4]::32 word))) 32 64::64 word) \<and> RDI \<sigma> = qemu_malloc_0xbb39_retval \<and> RSI \<sigma> = (((\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word)::64 word) + (\<langle>63,0\<rangle>(((\<langle>63,0\<rangle>(sextend (ucast ((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) * (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x10),4]::32 word))::32 word))) 32 64::64 word)::64 word)::64 word) * 0x1)::64 word)) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x58) \<and> RBP \<sigma> = ucast ((((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0xc),4]::32 word)::32 word) - 0x1)) \<and> R15 \<sigma> = RDI\<^sub>0 \<and> R14 \<sigma> = qemu_malloc_0xbb39_retval \<and> R13 \<sigma> = (((\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word)::64 word) + (sextend (ucast ((\<langle>31,0\<rangle>(((((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0xc),4]::32 word)::32 word) - 0x1)::32 word) * (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x10),4]::32 word))::32 word))) 32 64::64 word)) \<and> R12 \<sigma> = (sextend (ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x10),4]::32 word))) 32 64::64 word) \<and> R9 \<sigma> = (sextend (ucast ((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) * (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x10),4]::32 word))::32 word))) 32 64::64 word) \<and> R8 \<sigma> = (sextend (ucast ((\<langle>31,0\<rangle>(((((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0xc),4]::32 word)::32 word) - 0x1)::32 word) * (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x10),4]::32 word))::32 word))) 32 64::64 word) \<and> (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) = (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0xc),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0xc),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x10),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x10),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (sextend (ucast ((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) * (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x10),4]::32 word))::32 word))) 32 64::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x48),8]::64 word) = (sextend (ucast ((\<langle>31,0\<rangle>(((((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0xc),4]::32 word)::32 word) - 0x1)::32 word) * (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x10),4]::32 word))::32 word))) 32 64::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),8]::64 word) = (((\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word)::64 word) + (\<langle>63,0\<rangle>(((\<langle>63,0\<rangle>(sextend (ucast ((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) * (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x10),4]::32 word))::32 word))) 32 64::64 word)::64 word)::64 word) * 0x1)::64 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x60),8]::64 word) = 0xbb51\<close>
declare P_0xbb5d_false_20_def[Ps]

definition P_0xbb5d_false_20_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0xbb5d_false_20_regions_set \<sigma> \<equiv> {
    (0, RDI\<^sub>0, 8),
    (1, RSP\<^sub>0, 8),
    (2, ((RDI\<^sub>0::64 word) + 0xc), 4),
    (3, ((RDI\<^sub>0::64 word) + 0x10), 4),
    (4, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x40), 8),
    (11, ((RSP\<^sub>0::64 word) - 0x48), 8),
    (12, ((RSP\<^sub>0::64 word) - 0x50), 8),
    (13, ((RSP\<^sub>0::64 word) - 0x60), 8)
  }\<close>

definition P_0xbb5d_false_20_regions :: state_pred where
  \<open>P_0xbb5d_false_20_regions \<sigma> \<equiv> \<exists>regions. P_0xbb5d_false_20_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0xbb6e_20 :: state_pred where
  \<open>Q_0xbb6e_20 \<sigma> \<equiv> RIP \<sigma> = 0xbb6e \<and> RAX \<sigma> = memcpy_0xbb4c_retval \<and> RBX \<sigma> = ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)) \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = (((sextend (ucast ((\<langle>31,0\<rangle>(((((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0xc),4]::32 word)::32 word) - 0x1)::32 word) * (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x10),4]::32 word))::32 word))) 32 64::64 word)::64 word) - (sextend (ucast ((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) * (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x10),4]::32 word))::32 word))) 32 64::64 word)) \<and> RDI \<sigma> = (((\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word)::64 word) + (\<langle>63,0\<rangle>(((\<langle>63,0\<rangle>(sextend (ucast ((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) * (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x10),4]::32 word))::32 word))) 32 64::64 word)::64 word)::64 word) * 0x1)::64 word)) \<and> RSI \<sigma> = (((((\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word)::64 word) + (\<langle>63,0\<rangle>(((\<langle>63,0\<rangle>(sextend (ucast ((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) * (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x10),4]::32 word))::32 word))) 32 64::64 word)::64 word)::64 word) * 0x1)::64 word))::64 word) + (\<langle>63,0\<rangle>(((sextend (ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x10),4]::32 word))) 32 64::64 word)::64 word) * 0x1)::64 word)) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x58) \<and> RBP \<sigma> = ucast ((((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0xc),4]::32 word)::32 word) - 0x1)) \<and> R15 \<sigma> = RDI\<^sub>0 \<and> R14 \<sigma> = qemu_malloc_0xbb39_retval \<and> R13 \<sigma> = (((\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word)::64 word) + (sextend (ucast ((\<langle>31,0\<rangle>(((((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0xc),4]::32 word)::32 word) - 0x1)::32 word) * (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x10),4]::32 word))::32 word))) 32 64::64 word)) \<and> R12 \<sigma> = (sextend (ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x10),4]::32 word))) 32 64::64 word) \<and> R9 \<sigma> = (sextend (ucast ((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) * (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x10),4]::32 word))::32 word))) 32 64::64 word) \<and> R8 \<sigma> = (sextend (ucast ((\<langle>31,0\<rangle>(((((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0xc),4]::32 word)::32 word) - 0x1)::32 word) * (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x10),4]::32 word))::32 word))) 32 64::64 word) \<and> (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) = (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0xc),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0xc),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x10),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x10),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (sextend (ucast ((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) * (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x10),4]::32 word))::32 word))) 32 64::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x48),8]::64 word) = (sextend (ucast ((\<langle>31,0\<rangle>(((((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0xc),4]::32 word)::32 word) - 0x1)::32 word) * (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x10),4]::32 word))::32 word))) 32 64::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),8]::64 word) = (((\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word)::64 word) + (\<langle>63,0\<rangle>(((\<langle>63,0\<rangle>(sextend (ucast ((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) * (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x10),4]::32 word))::32 word))) 32 64::64 word)::64 word)::64 word) * 0x1)::64 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x60),8]::64 word) = 0xbb51\<close>
declare Q_0xbb6e_20_def[Qs]

schematic_goal array_remove_0_5_0xbb5d_0xbb6a_20[blocks]:
  assumes \<open>(P_0xbb5d_false_20 && P_0xbb5d_false_20_regions && ! jg) \<sigma>\<close>
  shows \<open>exec_block 5 0xbb6a 20 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0xbb6e_20 ?\<sigma> \<and> block_usage P_0xbb5d_false_20_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0xbb5d_false_20_def P_0xbb5d_false_20_regions_def post: Q_0xbb6e_20_def regionset: P_0xbb5d_false_20_regions_set_def)

definition P_0xbb6e_21 :: state_pred where
  \<open>P_0xbb6e_21 \<sigma> \<equiv> RIP \<sigma> = 0xbb6e \<and> RAX \<sigma> = memcpy_0xbb4c_retval \<and> RBX \<sigma> = ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)) \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = (((sextend (ucast ((\<langle>31,0\<rangle>(((((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0xc),4]::32 word)::32 word) - 0x1)::32 word) * (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x10),4]::32 word))::32 word))) 32 64::64 word)::64 word) - (sextend (ucast ((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) * (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x10),4]::32 word))::32 word))) 32 64::64 word)) \<and> RDI \<sigma> = (((\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word)::64 word) + (\<langle>63,0\<rangle>(((\<langle>63,0\<rangle>(sextend (ucast ((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) * (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x10),4]::32 word))::32 word))) 32 64::64 word)::64 word)::64 word) * 0x1)::64 word)) \<and> RSI \<sigma> = (((((\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word)::64 word) + (\<langle>63,0\<rangle>(((\<langle>63,0\<rangle>(sextend (ucast ((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) * (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x10),4]::32 word))::32 word))) 32 64::64 word)::64 word)::64 word) * 0x1)::64 word))::64 word) + (\<langle>63,0\<rangle>(((sextend (ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x10),4]::32 word))) 32 64::64 word)::64 word) * 0x1)::64 word)) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x58) \<and> RBP \<sigma> = ucast ((((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0xc),4]::32 word)::32 word) - 0x1)) \<and> R15 \<sigma> = RDI\<^sub>0 \<and> R14 \<sigma> = qemu_malloc_0xbb39_retval \<and> R13 \<sigma> = (((\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word)::64 word) + (sextend (ucast ((\<langle>31,0\<rangle>(((((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0xc),4]::32 word)::32 word) - 0x1)::32 word) * (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x10),4]::32 word))::32 word))) 32 64::64 word)) \<and> R12 \<sigma> = (sextend (ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x10),4]::32 word))) 32 64::64 word) \<and> R9 \<sigma> = (sextend (ucast ((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) * (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x10),4]::32 word))::32 word))) 32 64::64 word) \<and> R8 \<sigma> = (sextend (ucast ((\<langle>31,0\<rangle>(((((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0xc),4]::32 word)::32 word) - 0x1)::32 word) * (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x10),4]::32 word))::32 word))) 32 64::64 word) \<and> (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) = (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0xc),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0xc),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x10),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x10),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (sextend (ucast ((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) * (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x10),4]::32 word))::32 word))) 32 64::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x48),8]::64 word) = (sextend (ucast ((\<langle>31,0\<rangle>(((((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0xc),4]::32 word)::32 word) - 0x1)::32 word) * (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x10),4]::32 word))::32 word))) 32 64::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),8]::64 word) = (((\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word)::64 word) + (\<langle>63,0\<rangle>(((\<langle>63,0\<rangle>(sextend (ucast ((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) * (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x10),4]::32 word))::32 word))) 32 64::64 word)::64 word)::64 word) * 0x1)::64 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x60),8]::64 word) = 0xbb51\<close>
declare P_0xbb6e_21_def[Ps]

definition P_0xbb6e_21_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0xbb6e_21_regions_set \<sigma> \<equiv> {
    (0, RDI\<^sub>0, 8),
    (1, RSP\<^sub>0, 8),
    (2, ((RDI\<^sub>0::64 word) + 0xc), 4),
    (3, ((RDI\<^sub>0::64 word) + 0x10), 4),
    (4, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x40), 8),
    (11, ((RSP\<^sub>0::64 word) - 0x48), 8),
    (12, ((RSP\<^sub>0::64 word) - 0x50), 8),
    (13, ((RSP\<^sub>0::64 word) - 0x60), 8)
  }\<close>

definition P_0xbb6e_21_regions :: state_pred where
  \<open>P_0xbb6e_21_regions \<sigma> \<equiv> \<exists>regions. P_0xbb6e_21_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_memmove_addr_0xbb6e_21 :: state_pred where
  \<open>Q_memmove_addr_0xbb6e_21 \<sigma> \<equiv> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x60) \<and> RIP \<sigma> = memmove_addr \<and> RAX \<sigma> = memcpy_0xbb4c_retval \<and> RBX \<sigma> = ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)) \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RBP \<sigma> = ucast ((((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0xc),4]::32 word)::32 word) - 0x1)) \<and> R15 \<sigma> = RDI\<^sub>0 \<and> R14 \<sigma> = qemu_malloc_0xbb39_retval \<and> R13 \<sigma> = (((\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word)::64 word) + (sextend (ucast ((\<langle>31,0\<rangle>(((((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0xc),4]::32 word)::32 word) - 0x1)::32 word) * (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x10),4]::32 word))::32 word))) 32 64::64 word)) \<and> R12 \<sigma> = (sextend (ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x10),4]::32 word))) 32 64::64 word) \<and> R9 \<sigma> = (sextend (ucast ((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) * (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x10),4]::32 word))::32 word))) 32 64::64 word) \<and> R8 \<sigma> = (sextend (ucast ((\<langle>31,0\<rangle>(((((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0xc),4]::32 word)::32 word) - 0x1)::32 word) * (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x10),4]::32 word))::32 word))) 32 64::64 word) \<and> (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) = (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0xc),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0xc),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x10),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x10),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (sextend (ucast ((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) * (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x10),4]::32 word))::32 word))) 32 64::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x48),8]::64 word) = (sextend (ucast ((\<langle>31,0\<rangle>(((((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0xc),4]::32 word)::32 word) - 0x1)::32 word) * (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x10),4]::32 word))::32 word))) 32 64::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),8]::64 word) = (((\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word)::64 word) + (\<langle>63,0\<rangle>(((\<langle>63,0\<rangle>(sextend (ucast ((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) * (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x10),4]::32 word))::32 word))) 32 64::64 word)::64 word)::64 word) * 0x1)::64 word))\<close>
declare Q_memmove_addr_0xbb6e_21_def[Qs]

schematic_goal array_remove_0_1_0xbb6e_0xbb6e_21[blocks]:
  assumes \<open>(P_0xbb6e_21 && P_0xbb6e_21_regions) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0xbb6e 21 \<sigma> \<triangleq> ?\<sigma> \<and> Q_memmove_addr_0xbb6e_21 ?\<sigma> \<and> block_usage P_0xbb6e_21_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0xbb6e_21_def P_0xbb6e_21_regions_def post: Q_memmove_addr_0xbb6e_21_def regionset: P_0xbb6e_21_regions_set_def)

definition P_0xbb73_22 :: state_pred where
  \<open>P_0xbb73_22 \<sigma> \<equiv> RIP \<sigma> = 0xbb73 \<and> RBX \<sigma> = ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)) \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x58) \<and> RBP \<sigma> = ucast ((((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0xc),4]::32 word)::32 word) - 0x1)) \<and> R15 \<sigma> = RDI\<^sub>0 \<and> R14 \<sigma> = qemu_malloc_0xbb39_retval \<and> R13 \<sigma> = (((\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word)::64 word) + (sextend (ucast ((\<langle>31,0\<rangle>(((((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0xc),4]::32 word)::32 word) - 0x1)::32 word) * (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x10),4]::32 word))::32 word))) 32 64::64 word)) \<and> R12 \<sigma> = (sextend (ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x10),4]::32 word))) 32 64::64 word) \<and> R9 \<sigma> = (sextend (ucast ((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) * (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x10),4]::32 word))::32 word))) 32 64::64 word) \<and> R8 \<sigma> = (sextend (ucast ((\<langle>31,0\<rangle>(((((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0xc),4]::32 word)::32 word) - 0x1)::32 word) * (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x10),4]::32 word))::32 word))) 32 64::64 word) \<and> (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) = (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0xc),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0xc),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x10),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x10),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (sextend (ucast ((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) * (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x10),4]::32 word))::32 word))) 32 64::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x48),8]::64 word) = (sextend (ucast ((\<langle>31,0\<rangle>(((((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0xc),4]::32 word)::32 word) - 0x1)::32 word) * (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x10),4]::32 word))::32 word))) 32 64::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),8]::64 word) = (((\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word)::64 word) + (\<langle>63,0\<rangle>(((\<langle>63,0\<rangle>(sextend (ucast ((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) * (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x10),4]::32 word))::32 word))) 32 64::64 word)::64 word)::64 word) * 0x1)::64 word))\<close>
declare P_0xbb73_22_def[Ps]

definition P_0xbb73_22_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0xbb73_22_regions_set \<sigma> \<equiv> {
    (0, RDI\<^sub>0, 8),
    (1, RSP\<^sub>0, 8),
    (2, ((RDI\<^sub>0::64 word) + 0xc), 4),
    (3, ((RDI\<^sub>0::64 word) + 0x10), 4),
    (4, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x40), 8),
    (11, ((RSP\<^sub>0::64 word) - 0x48), 8),
    (12, ((RSP\<^sub>0::64 word) - 0x50), 8)
  }\<close>

definition P_0xbb73_22_regions :: state_pred where
  \<open>P_0xbb73_22_regions \<sigma> \<equiv> \<exists>regions. P_0xbb73_22_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0xbb7c_22 :: state_pred where
  \<open>Q_0xbb7c_22 \<sigma> \<equiv> RIP \<sigma> = 0xbb7c \<and> RBX \<sigma> = ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)) \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = (sextend (ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x10),4]::32 word))) 32 64::64 word) \<and> RDI \<sigma> = (((\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word)::64 word) + (sextend (ucast ((\<langle>31,0\<rangle>(((((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0xc),4]::32 word)::32 word) - 0x1)::32 word) * (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x10),4]::32 word))::32 word))) 32 64::64 word)) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x58) \<and> RBP \<sigma> = ucast ((((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0xc),4]::32 word)::32 word) - 0x1)) \<and> R15 \<sigma> = RDI\<^sub>0 \<and> R14 \<sigma> = qemu_malloc_0xbb39_retval \<and> R13 \<sigma> = (((\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word)::64 word) + (sextend (ucast ((\<langle>31,0\<rangle>(((((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0xc),4]::32 word)::32 word) - 0x1)::32 word) * (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x10),4]::32 word))::32 word))) 32 64::64 word)) \<and> R12 \<sigma> = (sextend (ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x10),4]::32 word))) 32 64::64 word) \<and> R9 \<sigma> = (sextend (ucast ((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) * (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x10),4]::32 word))::32 word))) 32 64::64 word) \<and> R8 \<sigma> = (sextend (ucast ((\<langle>31,0\<rangle>(((((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0xc),4]::32 word)::32 word) - 0x1)::32 word) * (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x10),4]::32 word))::32 word))) 32 64::64 word) \<and> (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) = (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0xc),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0xc),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x10),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x10),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (sextend (ucast ((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) * (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x10),4]::32 word))::32 word))) 32 64::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x48),8]::64 word) = (sextend (ucast ((\<langle>31,0\<rangle>(((((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0xc),4]::32 word)::32 word) - 0x1)::32 word) * (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x10),4]::32 word))::32 word))) 32 64::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),8]::64 word) = (((\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word)::64 word) + (\<langle>63,0\<rangle>(((\<langle>63,0\<rangle>(sextend (ucast ((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) * (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x10),4]::32 word))::32 word))) 32 64::64 word)::64 word)::64 word) * 0x1)::64 word))\<close>
declare Q_0xbb7c_22_def[Qs]

schematic_goal array_remove_0_3_0xbb73_0xbb79_22[blocks]:
  assumes \<open>(P_0xbb73_22 && P_0xbb73_22_regions) \<sigma>\<close>
  shows \<open>exec_block 3 0xbb79 22 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0xbb7c_22 ?\<sigma> \<and> block_usage P_0xbb73_22_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0xbb73_22_def P_0xbb73_22_regions_def post: Q_0xbb7c_22_def regionset: P_0xbb73_22_regions_set_def)

definition P_0xbb7c_23 :: state_pred where
  \<open>P_0xbb7c_23 \<sigma> \<equiv> RIP \<sigma> = 0xbb7c \<and> RBX \<sigma> = ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)) \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = (sextend (ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x10),4]::32 word))) 32 64::64 word) \<and> RDI \<sigma> = (((\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word)::64 word) + (sextend (ucast ((\<langle>31,0\<rangle>(((((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0xc),4]::32 word)::32 word) - 0x1)::32 word) * (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x10),4]::32 word))::32 word))) 32 64::64 word)) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x58) \<and> RBP \<sigma> = ucast ((((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0xc),4]::32 word)::32 word) - 0x1)) \<and> R15 \<sigma> = RDI\<^sub>0 \<and> R14 \<sigma> = qemu_malloc_0xbb39_retval \<and> R13 \<sigma> = (((\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word)::64 word) + (sextend (ucast ((\<langle>31,0\<rangle>(((((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0xc),4]::32 word)::32 word) - 0x1)::32 word) * (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x10),4]::32 word))::32 word))) 32 64::64 word)) \<and> R12 \<sigma> = (sextend (ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x10),4]::32 word))) 32 64::64 word) \<and> R9 \<sigma> = (sextend (ucast ((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) * (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x10),4]::32 word))::32 word))) 32 64::64 word) \<and> R8 \<sigma> = (sextend (ucast ((\<langle>31,0\<rangle>(((((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0xc),4]::32 word)::32 word) - 0x1)::32 word) * (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x10),4]::32 word))::32 word))) 32 64::64 word) \<and> (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) = (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0xc),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0xc),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x10),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x10),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (sextend (ucast ((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) * (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x10),4]::32 word))::32 word))) 32 64::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x48),8]::64 word) = (sextend (ucast ((\<langle>31,0\<rangle>(((((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0xc),4]::32 word)::32 word) - 0x1)::32 word) * (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x10),4]::32 word))::32 word))) 32 64::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),8]::64 word) = (((\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word)::64 word) + (\<langle>63,0\<rangle>(((\<langle>63,0\<rangle>(sextend (ucast ((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) * (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x10),4]::32 word))::32 word))) 32 64::64 word)::64 word)::64 word) * 0x1)::64 word))\<close>
declare P_0xbb7c_23_def[Ps]

definition P_0xbb7c_23_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0xbb7c_23_regions_set \<sigma> \<equiv> {
    (0, RDI\<^sub>0, 8),
    (1, RSP\<^sub>0, 8),
    (2, ((RDI\<^sub>0::64 word) + 0xc), 4),
    (3, ((RDI\<^sub>0::64 word) + 0x10), 4),
    (4, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x40), 8),
    (11, ((RSP\<^sub>0::64 word) - 0x48), 8),
    (12, ((RSP\<^sub>0::64 word) - 0x50), 8),
    (13, ((RSP\<^sub>0::64 word) - 0x60), 8)
  }\<close>

definition P_0xbb7c_23_regions :: state_pred where
  \<open>P_0xbb7c_23_regions \<sigma> \<equiv> \<exists>regions. P_0xbb7c_23_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_memcpy_addr_0xbb7c_23 :: state_pred where
  \<open>Q_memcpy_addr_0xbb7c_23 \<sigma> \<equiv> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x60) \<and> RIP \<sigma> = memcpy_addr \<and> RBX \<sigma> = ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)) \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = (sextend (ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x10),4]::32 word))) 32 64::64 word) \<and> RDI \<sigma> = (((\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word)::64 word) + (sextend (ucast ((\<langle>31,0\<rangle>(((((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0xc),4]::32 word)::32 word) - 0x1)::32 word) * (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x10),4]::32 word))::32 word))) 32 64::64 word)) \<and> RBP \<sigma> = ucast ((((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0xc),4]::32 word)::32 word) - 0x1)) \<and> R15 \<sigma> = RDI\<^sub>0 \<and> R14 \<sigma> = qemu_malloc_0xbb39_retval \<and> R13 \<sigma> = (((\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word)::64 word) + (sextend (ucast ((\<langle>31,0\<rangle>(((((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0xc),4]::32 word)::32 word) - 0x1)::32 word) * (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x10),4]::32 word))::32 word))) 32 64::64 word)) \<and> R12 \<sigma> = (sextend (ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x10),4]::32 word))) 32 64::64 word) \<and> R9 \<sigma> = (sextend (ucast ((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) * (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x10),4]::32 word))::32 word))) 32 64::64 word) \<and> R8 \<sigma> = (sextend (ucast ((\<langle>31,0\<rangle>(((((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0xc),4]::32 word)::32 word) - 0x1)::32 word) * (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x10),4]::32 word))::32 word))) 32 64::64 word) \<and> (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) = (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0xc),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0xc),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x10),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x10),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (sextend (ucast ((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) * (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x10),4]::32 word))::32 word))) 32 64::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x48),8]::64 word) = (sextend (ucast ((\<langle>31,0\<rangle>(((((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0xc),4]::32 word)::32 word) - 0x1)::32 word) * (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x10),4]::32 word))::32 word))) 32 64::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),8]::64 word) = (((\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word)::64 word) + (\<langle>63,0\<rangle>(((\<langle>63,0\<rangle>(sextend (ucast ((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) * (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x10),4]::32 word))::32 word))) 32 64::64 word)::64 word)::64 word) * 0x1)::64 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x60),8]::64 word) = 0xbb81\<close>
declare Q_memcpy_addr_0xbb7c_23_def[Qs]

schematic_goal array_remove_0_1_0xbb7c_0xbb7c_23[blocks]:
  assumes \<open>(P_0xbb7c_23 && P_0xbb7c_23_regions) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0xbb7c 23 \<sigma> \<triangleq> ?\<sigma> \<and> Q_memcpy_addr_0xbb7c_23 ?\<sigma> \<and> block_usage P_0xbb7c_23_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0xbb7c_23_def P_0xbb7c_23_regions_def post: Q_memcpy_addr_0xbb7c_23_def regionset: P_0xbb7c_23_regions_set_def)

definition P_0xbb81_24 :: state_pred where
  \<open>P_0xbb81_24 \<sigma> \<equiv> RIP \<sigma> = 0xbb81 \<and> RBX \<sigma> = ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)) \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = (sextend (ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x10),4]::32 word))) 32 64::64 word) \<and> RDI \<sigma> = (((\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word)::64 word) + (sextend (ucast ((\<langle>31,0\<rangle>(((((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0xc),4]::32 word)::32 word) - 0x1)::32 word) * (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x10),4]::32 word))::32 word))) 32 64::64 word)) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x58) \<and> RBP \<sigma> = ucast ((((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0xc),4]::32 word)::32 word) - 0x1)) \<and> R15 \<sigma> = RDI\<^sub>0 \<and> R14 \<sigma> = qemu_malloc_0xbb39_retval \<and> R13 \<sigma> = (((\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word)::64 word) + (sextend (ucast ((\<langle>31,0\<rangle>(((((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0xc),4]::32 word)::32 word) - 0x1)::32 word) * (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x10),4]::32 word))::32 word))) 32 64::64 word)) \<and> R12 \<sigma> = (sextend (ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x10),4]::32 word))) 32 64::64 word) \<and> R9 \<sigma> = (sextend (ucast ((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) * (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x10),4]::32 word))::32 word))) 32 64::64 word) \<and> R8 \<sigma> = (sextend (ucast ((\<langle>31,0\<rangle>(((((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0xc),4]::32 word)::32 word) - 0x1)::32 word) * (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x10),4]::32 word))::32 word))) 32 64::64 word) \<and> (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) = (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0xc),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0xc),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x10),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x10),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (sextend (ucast ((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) * (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x10),4]::32 word))::32 word))) 32 64::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x48),8]::64 word) = (sextend (ucast ((\<langle>31,0\<rangle>(((((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0xc),4]::32 word)::32 word) - 0x1)::32 word) * (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x10),4]::32 word))::32 word))) 32 64::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),8]::64 word) = (((\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word)::64 word) + (\<langle>63,0\<rangle>(((\<langle>63,0\<rangle>(sextend (ucast ((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) * (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x10),4]::32 word))::32 word))) 32 64::64 word)::64 word)::64 word) * 0x1)::64 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x60),8]::64 word) = 0xbb81\<close>
declare P_0xbb81_24_def[Ps]

definition P_0xbb81_24_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0xbb81_24_regions_set \<sigma> \<equiv> {
    (0, RDI\<^sub>0, 8),
    (1, RSP\<^sub>0, 8),
    (2, ((RDI\<^sub>0::64 word) + 0xc), 4),
    (3, ((RDI\<^sub>0::64 word) + 0x10), 4),
    (4, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x40), 8),
    (11, ((RSP\<^sub>0::64 word) - 0x48), 8),
    (12, ((RSP\<^sub>0::64 word) - 0x50), 8),
    (13, ((RSP\<^sub>0::64 word) - 0x60), 8)
  }\<close>

definition P_0xbb81_24_regions :: state_pred where
  \<open>P_0xbb81_24_regions \<sigma> \<equiv> \<exists>regions. P_0xbb81_24_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0xbb84_24 :: state_pred where
  \<open>Q_0xbb84_24 \<sigma> \<equiv> RIP \<sigma> = 0xbb84 \<and> RBX \<sigma> = ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)) \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = (sextend (ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x10),4]::32 word))) 32 64::64 word) \<and> RDI \<sigma> = qemu_malloc_0xbb39_retval \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x58) \<and> RBP \<sigma> = ucast ((((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0xc),4]::32 word)::32 word) - 0x1)) \<and> R15 \<sigma> = RDI\<^sub>0 \<and> R14 \<sigma> = qemu_malloc_0xbb39_retval \<and> R13 \<sigma> = (((\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word)::64 word) + (sextend (ucast ((\<langle>31,0\<rangle>(((((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0xc),4]::32 word)::32 word) - 0x1)::32 word) * (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x10),4]::32 word))::32 word))) 32 64::64 word)) \<and> R12 \<sigma> = (sextend (ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x10),4]::32 word))) 32 64::64 word) \<and> R9 \<sigma> = (sextend (ucast ((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) * (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x10),4]::32 word))::32 word))) 32 64::64 word) \<and> R8 \<sigma> = (sextend (ucast ((\<langle>31,0\<rangle>(((((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0xc),4]::32 word)::32 word) - 0x1)::32 word) * (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x10),4]::32 word))::32 word))) 32 64::64 word) \<and> (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) = (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0xc),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0xc),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x10),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x10),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (sextend (ucast ((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) * (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x10),4]::32 word))::32 word))) 32 64::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x48),8]::64 word) = (sextend (ucast ((\<langle>31,0\<rangle>(((((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0xc),4]::32 word)::32 word) - 0x1)::32 word) * (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x10),4]::32 word))::32 word))) 32 64::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),8]::64 word) = (((\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word)::64 word) + (\<langle>63,0\<rangle>(((\<langle>63,0\<rangle>(sextend (ucast ((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) * (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x10),4]::32 word))::32 word))) 32 64::64 word)::64 word)::64 word) * 0x1)::64 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x60),8]::64 word) = 0xbb81\<close>
declare Q_0xbb84_24_def[Qs]

schematic_goal array_remove_0_1_0xbb81_0xbb81_24[blocks]:
  assumes \<open>(P_0xbb81_24 && P_0xbb81_24_regions) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0xbb81 24 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0xbb84_24 ?\<sigma> \<and> block_usage P_0xbb81_24_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0xbb81_24_def P_0xbb81_24_regions_def post: Q_0xbb84_24_def regionset: P_0xbb81_24_regions_set_def)

definition P_0xbb84_25 :: state_pred where
  \<open>P_0xbb84_25 \<sigma> \<equiv> RIP \<sigma> = 0xbb84 \<and> RBX \<sigma> = ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)) \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = (sextend (ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x10),4]::32 word))) 32 64::64 word) \<and> RDI \<sigma> = qemu_malloc_0xbb39_retval \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x58) \<and> RBP \<sigma> = ucast ((((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0xc),4]::32 word)::32 word) - 0x1)) \<and> R15 \<sigma> = RDI\<^sub>0 \<and> R14 \<sigma> = qemu_malloc_0xbb39_retval \<and> R13 \<sigma> = (((\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word)::64 word) + (sextend (ucast ((\<langle>31,0\<rangle>(((((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0xc),4]::32 word)::32 word) - 0x1)::32 word) * (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x10),4]::32 word))::32 word))) 32 64::64 word)) \<and> R12 \<sigma> = (sextend (ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x10),4]::32 word))) 32 64::64 word) \<and> R9 \<sigma> = (sextend (ucast ((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) * (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x10),4]::32 word))::32 word))) 32 64::64 word) \<and> R8 \<sigma> = (sextend (ucast ((\<langle>31,0\<rangle>(((((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0xc),4]::32 word)::32 word) - 0x1)::32 word) * (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x10),4]::32 word))::32 word))) 32 64::64 word) \<and> (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) = (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0xc),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0xc),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x10),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x10),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (sextend (ucast ((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) * (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x10),4]::32 word))::32 word))) 32 64::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x48),8]::64 word) = (sextend (ucast ((\<langle>31,0\<rangle>(((((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0xc),4]::32 word)::32 word) - 0x1)::32 word) * (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x10),4]::32 word))::32 word))) 32 64::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),8]::64 word) = (((\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word)::64 word) + (\<langle>63,0\<rangle>(((\<langle>63,0\<rangle>(sextend (ucast ((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) * (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x10),4]::32 word))::32 word))) 32 64::64 word)::64 word)::64 word) * 0x1)::64 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x60),8]::64 word) = 0xbb81\<close>
declare P_0xbb84_25_def[Ps]

definition P_0xbb84_25_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0xbb84_25_regions_set \<sigma> \<equiv> {
    (0, RDI\<^sub>0, 8),
    (1, RSP\<^sub>0, 8),
    (2, ((RDI\<^sub>0::64 word) + 0xc), 4),
    (3, ((RDI\<^sub>0::64 word) + 0x10), 4),
    (4, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x40), 8),
    (11, ((RSP\<^sub>0::64 word) - 0x48), 8),
    (12, ((RSP\<^sub>0::64 word) - 0x50), 8),
    (13, ((RSP\<^sub>0::64 word) - 0x60), 8)
  }\<close>

definition P_0xbb84_25_regions :: state_pred where
  \<open>P_0xbb84_25_regions \<sigma> \<equiv> \<exists>regions. P_0xbb84_25_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_free_addr_0xbb84_25 :: state_pred where
  \<open>Q_free_addr_0xbb84_25 \<sigma> \<equiv> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x60) \<and> RIP \<sigma> = free_addr \<and> RBX \<sigma> = ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)) \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = (sextend (ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x10),4]::32 word))) 32 64::64 word) \<and> RDI \<sigma> = qemu_malloc_0xbb39_retval \<and> RBP \<sigma> = ucast ((((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0xc),4]::32 word)::32 word) - 0x1)) \<and> R15 \<sigma> = RDI\<^sub>0 \<and> R14 \<sigma> = qemu_malloc_0xbb39_retval \<and> R13 \<sigma> = (((\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word)::64 word) + (sextend (ucast ((\<langle>31,0\<rangle>(((((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0xc),4]::32 word)::32 word) - 0x1)::32 word) * (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x10),4]::32 word))::32 word))) 32 64::64 word)) \<and> R12 \<sigma> = (sextend (ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x10),4]::32 word))) 32 64::64 word) \<and> R9 \<sigma> = (sextend (ucast ((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) * (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x10),4]::32 word))::32 word))) 32 64::64 word) \<and> R8 \<sigma> = (sextend (ucast ((\<langle>31,0\<rangle>(((((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0xc),4]::32 word)::32 word) - 0x1)::32 word) * (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x10),4]::32 word))::32 word))) 32 64::64 word) \<and> (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) = (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0xc),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0xc),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x10),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x10),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (sextend (ucast ((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) * (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x10),4]::32 word))::32 word))) 32 64::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x48),8]::64 word) = (sextend (ucast ((\<langle>31,0\<rangle>(((((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0xc),4]::32 word)::32 word) - 0x1)::32 word) * (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x10),4]::32 word))::32 word))) 32 64::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),8]::64 word) = (((\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word)::64 word) + (\<langle>63,0\<rangle>(((\<langle>63,0\<rangle>(sextend (ucast ((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) * (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x10),4]::32 word))::32 word))) 32 64::64 word)::64 word)::64 word) * 0x1)::64 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x60),8]::64 word) = 0xbb89\<close>
declare Q_free_addr_0xbb84_25_def[Qs]

schematic_goal array_remove_0_1_0xbb84_0xbb84_25[blocks]:
  assumes \<open>(P_0xbb84_25 && P_0xbb84_25_regions) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0xbb84 25 \<sigma> \<triangleq> ?\<sigma> \<and> Q_free_addr_0xbb84_25 ?\<sigma> \<and> block_usage P_0xbb84_25_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0xbb84_25_def P_0xbb84_25_regions_def post: Q_free_addr_0xbb84_25_def regionset: P_0xbb84_25_regions_set_def)

definition P_0xbb89_26 :: state_pred where
  \<open>P_0xbb89_26 \<sigma> \<equiv> RIP \<sigma> = 0xbb89 \<and> RBX \<sigma> = ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)) \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = (sextend (ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x10),4]::32 word))) 32 64::64 word) \<and> RDI \<sigma> = qemu_malloc_0xbb39_retval \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x58) \<and> RBP \<sigma> = ucast ((((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0xc),4]::32 word)::32 word) - 0x1)) \<and> R15 \<sigma> = RDI\<^sub>0 \<and> R14 \<sigma> = qemu_malloc_0xbb39_retval \<and> R13 \<sigma> = (((\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word)::64 word) + (sextend (ucast ((\<langle>31,0\<rangle>(((((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0xc),4]::32 word)::32 word) - 0x1)::32 word) * (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x10),4]::32 word))::32 word))) 32 64::64 word)) \<and> R12 \<sigma> = (sextend (ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x10),4]::32 word))) 32 64::64 word) \<and> R9 \<sigma> = (sextend (ucast ((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) * (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x10),4]::32 word))::32 word))) 32 64::64 word) \<and> R8 \<sigma> = (sextend (ucast ((\<langle>31,0\<rangle>(((((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0xc),4]::32 word)::32 word) - 0x1)::32 word) * (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x10),4]::32 word))::32 word))) 32 64::64 word) \<and> (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) = (\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0xc),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0xc),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x10),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x10),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (sextend (ucast ((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) * (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x10),4]::32 word))::32 word))) 32 64::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x48),8]::64 word) = (sextend (ucast ((\<langle>31,0\<rangle>(((((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0xc),4]::32 word)::32 word) - 0x1)::32 word) * (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x10),4]::32 word))::32 word))) 32 64::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),8]::64 word) = (((\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word)::64 word) + (\<langle>63,0\<rangle>(((\<langle>63,0\<rangle>(sextend (ucast ((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) * (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x10),4]::32 word))::32 word))) 32 64::64 word)::64 word)::64 word) * 0x1)::64 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x60),8]::64 word) = 0xbb89\<close>
declare P_0xbb89_26_def[Ps]

definition P_0xbb89_26_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0xbb89_26_regions_set \<sigma> \<equiv> {
    (0, RDI\<^sub>0, 8),
    (1, RSP\<^sub>0, 8),
    (2, ((RDI\<^sub>0::64 word) + 0xc), 4),
    (3, ((RDI\<^sub>0::64 word) + 0x10), 4),
    (4, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x40), 8),
    (11, ((RSP\<^sub>0::64 word) - 0x48), 8),
    (12, ((RSP\<^sub>0::64 word) - 0x50), 8),
    (13, ((RSP\<^sub>0::64 word) - 0x60), 8)
  }\<close>

definition P_0xbb89_26_regions :: state_pred where
  \<open>P_0xbb89_26_regions \<sigma> \<equiv> \<exists>regions. P_0xbb89_26_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0xbb90_26 :: state_pred where
  \<open>Q_0xbb90_26 \<sigma> \<equiv> RIP \<sigma> = 0xbb90 \<and> RAX \<sigma> = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0xc),4]::32 word)) \<and> RBX \<sigma> = ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)) \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x58) \<and> R15 \<sigma> = RDI\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0xc),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0xc),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0\<close>
declare Q_0xbb90_26_def[Qs]

schematic_goal array_remove_0_2_0xbb89_0xbb8d_26[blocks]:
  assumes \<open>(P_0xbb89_26 && P_0xbb89_26_regions) \<sigma>\<close>
  shows \<open>exec_block 2 0xbb8d 26 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0xbb90_26 ?\<sigma> \<and> block_usage P_0xbb89_26_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0xbb89_26_def P_0xbb89_26_regions_def post: Q_0xbb90_26_def regionset: P_0xbb89_26_regions_set_def)

definition P_0xbb90_27 :: state_pred where
  \<open>P_0xbb90_27 \<sigma> \<equiv> RIP \<sigma> = 0xbb90 \<and> RAX \<sigma> = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0xc),4]::32 word)) \<and> RBX \<sigma> = ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)) \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x58) \<and> R15 \<sigma> = RDI\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0xc),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0xc),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0\<close>
declare P_0xbb90_27_def[Ps]

definition P_0xbb90_27_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0xbb90_27_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((RDI\<^sub>0::64 word) + 0xc), 4),
    (2, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x30), 8)
  }\<close>

definition P_0xbb90_27_regions :: state_pred where
  \<open>P_0xbb90_27_regions \<sigma> \<equiv> \<exists>regions. P_0xbb90_27_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0xbb96_27 :: state_pred where
  \<open>Q_0xbb96_27 \<sigma> \<equiv> RIP \<sigma> = 0xbb96 \<and> RBX \<sigma> = ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)) \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x58) \<and> R15 \<sigma> = RDI\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0\<close>
declare Q_0xbb96_27_def[Qs]

schematic_goal array_remove_0_2_0xbb90_0xbb94_27[blocks]:
  assumes \<open>(P_0xbb90_27 && P_0xbb90_27_regions) \<sigma>\<close>
  shows \<open>exec_block 2 0xbb94 27 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0xbb96_27 ?\<sigma> \<and> block_usage P_0xbb90_27_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0xbb90_27_def P_0xbb90_27_regions_def post: Q_0xbb96_27_def regionset: P_0xbb90_27_regions_set_def)

definition P_0xbb96_28 :: state_pred where
  \<open>P_0xbb96_28 \<sigma> \<equiv> RIP \<sigma> = 0xbb96 \<and> RBX \<sigma> = ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)) \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x58) \<and> R15 \<sigma> = RDI\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0\<close>
declare P_0xbb96_28_def[Ps]

definition P_0xbb96_28_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0xbb96_28_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (2, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x30), 8)
  }\<close>

definition P_0xbb96_28_regions :: state_pred where
  \<open>P_0xbb96_28_regions \<sigma> \<equiv> \<exists>regions. P_0xbb96_28_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_ret_address_28 :: state_pred where
  \<open>Q_ret_address_28 \<sigma> \<equiv> RIP \<sigma> = ret_address \<and> RBP \<sigma> = RBP\<^sub>0 \<and> R14 \<sigma> = R14\<^sub>0 \<and> R13 \<sigma> = R13\<^sub>0 \<and> R12 \<sigma> = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0\<close>
declare Q_ret_address_28_def[Qs]

schematic_goal array_remove_0_8_0xbb96_0xbba4_28[blocks]:
  assumes \<open>(P_0xbb96_28 && P_0xbb96_28_regions) \<sigma>\<close>
  shows \<open>exec_block 8 0xbba4 28 \<sigma> \<triangleq> ?\<sigma> \<and> Q_ret_address_28 ?\<sigma> \<and> block_usage P_0xbb96_28_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0xbb96_28_def P_0xbb96_28_regions_def post: Q_ret_address_28_def regionset: P_0xbb96_28_regions_set_def)

definition array_remove_acode :: ACode where
  \<open>array_remove_acode =
    Block 8 0xbace 0;
    IF SF THEN
      Block 5 0xbbf9 (Suc 0);
      Block (Suc 0) 0xbc00 2;
      CALL assert_fail_acode
    ELSE
      Block 6 0xbae1 3;
      IF ja THEN
        Block 5 0xbbda 4;
        Block (Suc 0) 0xbbe1 5;
        CALL assert_fail_acode
      ELSE
        Block 3 0xbaeb 6;
        IF SF THEN
          Block 3 0xbbc5 7
        ELSE
          Block 2 0xbaf4 8;
          IF jbe THEN
            Block 3 0xbbc5 9
          ELSE
            Block 2 0xbafc 10;
            IF ZF THEN
              Block (Suc 0) 0xbafe 11
            ELSE
              Block 15 0xbb34 12;
              Block (Suc 0) 0xbb39 13;
              CALL qemu_malloc_acode;
              Block 4 0xbb49 14;
              Block (Suc 0) 0xbb4c 15;
              CALL memcpy_acode;
              Block 3 0xbb58 16;
              IF jg THEN
                Block 5 0xbbb3 17;
                Block (Suc 0) 0xbbb6 18;
                CALL memmove_acode;
                Block (Suc 0) 0xbbbb 19
              ELSE
                Block 5 0xbb6a 20;
                Block (Suc 0) 0xbb6e 21;
                CALL memmove_acode
              FI;
              Block 3 0xbb79 22;
              Block (Suc 0) 0xbb7c 23;
              CALL memcpy_acode;
              Block (Suc 0) 0xbb81 24;
              Block (Suc 0) 0xbb84 25;
              CALL free_acode;
              Block 2 0xbb8d 26
            FI;
            Block 2 0xbb94 27
          FI
        FI;
        Block 8 0xbba4 28
      FI
    FI
  \<close>

schematic_goal "array_remove":
  assumes
    \<open>\<forall>\<sigma>. RIP \<sigma> = 0xbad0 \<longrightarrow> P_0xbad0_true_1_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0xbc00 \<longrightarrow> P_0xbc00_2_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0xbad0 \<longrightarrow> P_0xbad0_false_3_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0xbae3 \<longrightarrow> P_0xbae3_true_4_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0xbbe1 \<longrightarrow> P_0xbbe1_5_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0xbae3 \<longrightarrow> P_0xbae3_false_6_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0xbaee \<longrightarrow> P_0xbaee_true_7_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0xbaee \<longrightarrow> P_0xbaee_false_8_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0xbaf6 \<longrightarrow> P_0xbaf6_true_9_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0xbaf6 \<longrightarrow> P_0xbaf6_false_10_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0xbafe \<longrightarrow> P_0xbafe_true_11_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0xbafe \<longrightarrow> P_0xbafe_false_12_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0xbb39 \<longrightarrow> P_0xbb39_13_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0xbb3e \<longrightarrow> P_0xbb3e_14_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0xbb4c \<longrightarrow> P_0xbb4c_15_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0xbb51 \<longrightarrow> P_0xbb51_16_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0xbb5d \<longrightarrow> P_0xbb5d_true_17_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0xbbb6 \<longrightarrow> P_0xbbb6_18_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0xbbbb \<longrightarrow> P_0xbbbb_19_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0xbb5d \<longrightarrow> P_0xbb5d_false_20_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0xbb6e \<longrightarrow> P_0xbb6e_21_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0xbb73 \<longrightarrow> P_0xbb73_22_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0xbb7c \<longrightarrow> P_0xbb7c_23_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0xbb81 \<longrightarrow> P_0xbb81_24_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0xbb84 \<longrightarrow> P_0xbb84_25_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0xbb89 \<longrightarrow> P_0xbb89_26_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0xbb90 \<longrightarrow> P_0xbb90_27_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0xbb96 \<longrightarrow> P_0xbb96_28_regions \<sigma>\<close>
    and [blocks]: \<open>{{Q_assert_fail_addr_0xbc00_2}} \<box>assert_fail_acode {{Q_fail;M_0xbc00}}\<close>
    and [blocks]: \<open>{{Q_assert_fail_addr_0xbbe1_5}} \<box>assert_fail_acode {{Q_fail;M_0xbbe1}}\<close>
    and [blocks]: \<open>{{Q_qemu_malloc_addr_0xbb39_13}} \<box>qemu_malloc_acode {{P_0xbb3e_14;M_0xbb39}}\<close>
    and [blocks]: \<open>{{Q_memcpy_addr_0xbb4c_15}} \<box>memcpy_acode {{P_0xbb51_16;M_0xbb4c}}\<close>
    and [blocks]: \<open>{{Q_memmove_addr_0xbbb6_18}} \<box>memmove_acode {{P_0xbbbb_19;M_0xbbb6}}\<close>
    and [blocks]: \<open>{{Q_memmove_addr_0xbb6e_21}} \<box>memmove_acode {{P_0xbb73_22;M_0xbb6e}}\<close>
    and [blocks]: \<open>{{Q_memcpy_addr_0xbb7c_23}} \<box>memcpy_acode {{P_0xbb81_24;M_0xbb7c}}\<close>
    and [blocks]: \<open>{{Q_free_addr_0xbb84_25}} \<box>free_acode {{P_0xbb89_26;M_0xbb84}}\<close>
  shows \<open>{{?P}} array_remove_acode {{?Q;?M}}\<close>
  by (vcg acode: array_remove_acode_def assms: assms)

end
