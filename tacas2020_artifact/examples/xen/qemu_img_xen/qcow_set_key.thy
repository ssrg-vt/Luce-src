theory qcow_set_key
  imports
    "../../../isabelle/VCG/HTriple"
begin

locale "qemu_img_xen" = execution_context + exec_code +
  fixes strlen_0x691d_retval\<^sub>v AES_set_encrypt_key_0x6970_retval\<^sub>v AES_set_decrypt_key_0x6989_retval\<^sub>v stack_chk_fail_0x69b8_retval\<^sub>v strlen_0x12fdd_retval\<^sub>v AES_set_encrypt_key_0x13030_retval\<^sub>v AES_set_decrypt_key_0x13049_retval\<^sub>v stack_chk_fail_0x13078_retval\<^sub>v AES_set_decrypt_key_addr AES_set_encrypt_key_addr stack_chk_fail_addr strlen_addr :: \<open>64 word\<close>
    and AES_set_decrypt_key_acode AES_set_encrypt_key_acode stack_chk_fail_acode strlen_acode :: ACode
  assumes fetch:
    "fetch 0x68f0 \<equiv> (Unary (IS_8088 Push) (Storage (Reg (General SixtyFour r12))), 2)"
    "fetch 0x68f2 \<equiv> (Binary (IS_PentiumMMX_MMX Pxor) (Reg (SIMD OneHundredTwentyEight ymm0w3 ymm0w2 ymm0w1 ymm0w0)) (Storage (Reg (SIMD OneHundredTwentyEight ymm0w3 ymm0w2 ymm0w1 ymm0w0))), 4)"
    "fetch 0x68f6 \<equiv> (Unary (IS_8088 Push) (Storage (Reg (General SixtyFour rbp))), 1)"
    "fetch 0x68f7 \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour rbp)) (Storage (Reg (General SixtyFour rsi))), 3)"
    "fetch 0x68fa \<equiv> (Unary (IS_8088 Push) (Storage (Reg (General SixtyFour rbx))), 1)"
    "fetch 0x68fb \<equiv> (Binary (IS_8088 Sub) (Reg (General SixtyFour rsp)) (Immediate SixtyFour (ImmVal 32)), 4)"
    "fetch 0x68ff \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour r12)) (Storage (Memory SixtyFour (A_SizeDirective 64 (A_Plus (A_FromReg (General SixtyFour rdi)) (A_WordConstant 64))))), 4)"
    "fetch 0x6903 \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour rdi)) (Storage (Reg (General SixtyFour rsi))), 3)"
    "fetch 0x6906 \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour rax)) (Storage (Memory SixtyFour (A_SizeDirective 64 (A_Plus (A_FromReg (General SixtyFour fs)) (A_WordConstant 40))))), 9)"
    "fetch 0x690f \<equiv> (Binary (IS_8088 Mov) (Memory SixtyFour (A_SizeDirective 64 (A_Plus (A_FromReg (General SixtyFour rsp)) (A_WordConstant 24)))) (Storage (Reg (General SixtyFour rax))), 5)"
    "fetch 0x6914 \<equiv> (Binary (IS_8088 Xor) (Reg (General ThirtyTwo rax)) (Storage (Reg (General ThirtyTwo rax))), 2)"
    "fetch 0x6916 \<equiv> (Binary (IS_SSE_SIMD Movaps) (Memory OneHundredTwentyEight (A_SizeDirective 128 (A_FromReg (General SixtyFour rsp)))) (Storage (Reg (SIMD OneHundredTwentyEight ymm0w3 ymm0w2 ymm0w1 ymm0w0))), 4)"
    "fetch 0x691a \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour rbx)) (Storage (Reg (General SixtyFour rsp))), 3)"
    "fetch 0x691d \<equiv> (Unary (IS_8088 Call) (Immediate SixtyFour (ImmLabel ''strlen'')), 5)"
    "fetch 0x6922 \<equiv> (Binary (IS_8088 Mov) (Reg (General ThirtyTwo rdi)) (Immediate SixtyFour (ImmVal 16)), 5)"
    "fetch 0x6927 \<equiv> (Binary (IS_8088 Cmp) (Reg (General ThirtyTwo rax)) (Immediate SixtyFour (ImmVal 16)), 3)"
    "fetch 0x692a \<equiv> (Binary (IS_PentiumPro Cmovle) (Reg (General ThirtyTwo rdi)) (Storage (Reg (General ThirtyTwo rax))), 3)"
    "fetch 0x692d \<equiv> (Binary (IS_8088 Test) (Reg (General ThirtyTwo rax)) (Storage (Reg (General ThirtyTwo rax))), 2)"
    "fetch 0x692f \<equiv> (Unary (IS_8088 Jle) (Immediate SixtyFour (ImmVal 26960)), 2)"
    "fetch 0x6931 \<equiv> (Binary (IS_8088 Xor) (Reg (General ThirtyTwo rax)) (Storage (Reg (General ThirtyTwo rax))), 2)"
    "fetch 0x6933 \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour rbx)) (Storage (Reg (General SixtyFour rsp))), 3)"
    "fetch 0x6936 \<equiv> (Unary (IS_8088 Nop) (Storage (Memory Sixteen (A_SizeDirective 16 (A_Plus (A_FromReg (General SixtyFour cs)) (A_Plus (A_FromReg (General SixtyFour rax)) (A_Plus (A_Mult 1 (A_FromReg (General SixtyFour rax))) (A_WordConstant 0))))))), 10)"
    "fetch 0x6940 \<equiv> (Binary (IS_80386 Movzx) (Reg (General ThirtyTwo rcx)) (Storage (Memory Eight (A_SizeDirective 8 (A_Plus (A_FromReg (General SixtyFour rbp)) (A_Plus (A_Mult 1 (A_FromReg (General SixtyFour rax))) (A_WordConstant 0)))))), 5)"
    "fetch 0x6945 \<equiv> (Binary (IS_8088 Mov) (Memory Eight (A_SizeDirective 8 (A_Plus (A_FromReg (General SixtyFour rbx)) (A_Mult 1 (A_FromReg (General SixtyFour rax)))))) (Storage (Reg (General Eight rcx))), 3)"
    "fetch 0x6948 \<equiv> (Binary (IS_8088 Add) (Reg (General SixtyFour rax)) (Immediate SixtyFour (ImmVal 1)), 4)"
    "fetch 0x694c \<equiv> (Binary (IS_8088 Cmp) (Reg (General ThirtyTwo rdi)) (Storage (Reg (General ThirtyTwo rax))), 2)"
    "fetch 0x694e \<equiv> (Unary (IS_8088 Jg) (Immediate SixtyFour (ImmVal 26944)), 2)"
    "fetch 0x6950 \<equiv> (Binary (IS_8088 Mov) (Reg (General ThirtyTwo rax)) (Storage (Memory ThirtyTwo (A_SizeDirective 32 (A_Plus (A_FromReg (General SixtyFour r12)) (A_WordConstant 284))))), 8)"
    "fetch 0x6958 \<equiv> (Binary (IS_8088 Lea) (Reg (General SixtyFour rdx)) (Storage (Memory SixtyFour (A_Plus (A_FromReg (General SixtyFour r12)) (A_WordConstant 288)))), 8)"
    "fetch 0x6960 \<equiv> (Binary (IS_8088 Mov) (Reg (General ThirtyTwo rsi)) (Immediate SixtyFour (ImmVal 128)), 5)"
    "fetch 0x6965 \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour rdi)) (Storage (Reg (General SixtyFour rbx))), 3)"
    "fetch 0x6968 \<equiv> (Binary (IS_8088 Mov) (Memory ThirtyTwo (A_SizeDirective 32 (A_Plus (A_FromReg (General SixtyFour r12)) (A_WordConstant 280)))) (Storage (Reg (General ThirtyTwo rax))), 8)"
    "fetch 0x6970 \<equiv> (Unary (IS_8088 Call) (Immediate SixtyFour (ImmLabel ''AES_set_encrypt_key'')), 5)"
    "fetch 0x6975 \<equiv> (Binary (IS_8088 Test) (Reg (General ThirtyTwo rax)) (Storage (Reg (General ThirtyTwo rax))), 2)"
    "fetch 0x6977 \<equiv> (Unary (IS_8088 Jne) (Immediate SixtyFour (ImmVal 27057)), 2)"
    "fetch 0x6979 \<equiv> (Binary (IS_8088 Lea) (Reg (General SixtyFour rdx)) (Storage (Memory SixtyFour (A_Plus (A_FromReg (General SixtyFour r12)) (A_WordConstant 532)))), 8)"
    "fetch 0x6981 \<equiv> (Binary (IS_8088 Mov) (Reg (General ThirtyTwo rsi)) (Immediate SixtyFour (ImmVal 128)), 5)"
    "fetch 0x6986 \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour rdi)) (Storage (Reg (General SixtyFour rbx))), 3)"
    "fetch 0x6989 \<equiv> (Unary (IS_8088 Call) (Immediate SixtyFour (ImmLabel ''AES_set_decrypt_key'')), 5)"
    "fetch 0x698e \<equiv> (Binary (IS_8088 Test) (Reg (General ThirtyTwo rax)) (Storage (Reg (General ThirtyTwo rax))), 2)"
    "fetch 0x6990 \<equiv> (Unary (IS_80386 Setne) (Storage (Reg (General Eight rax))), 3)"
    "fetch 0x6993 \<equiv> (Binary (IS_80386 Movzx) (Reg (General ThirtyTwo rax)) (Storage (Reg (General Eight rax))), 3)"
    "fetch 0x6996 \<equiv> (Unary (IS_8088 Neg) (Storage (Reg (General ThirtyTwo rax))), 2)"
    "fetch 0x6998 \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour rsi)) (Storage (Memory SixtyFour (A_SizeDirective 64 (A_Plus (A_FromReg (General SixtyFour rsp)) (A_WordConstant 24))))), 5)"
    "fetch 0x699d \<equiv> (Binary (IS_8088 Xor) (Reg (General SixtyFour rsi)) (Storage (Memory SixtyFour (A_SizeDirective 64 (A_Plus (A_FromReg (General SixtyFour fs)) (A_WordConstant 40))))), 9)"
    "fetch 0x69a6 \<equiv> (Unary (IS_8088 Jne) (Immediate SixtyFour (ImmVal 27064)), 2)"
    "fetch 0x69a8 \<equiv> (Binary (IS_8088 Add) (Reg (General SixtyFour rsp)) (Immediate SixtyFour (ImmVal 32)), 4)"
    "fetch 0x69ac \<equiv> (Unary (IS_8088 Pop) (Storage (Reg (General SixtyFour rbx))), 1)"
    "fetch 0x69ad \<equiv> (Unary (IS_8088 Pop) (Storage (Reg (General SixtyFour rbp))), 1)"
    "fetch 0x69ae \<equiv> (Unary (IS_8088 Pop) (Storage (Reg (General SixtyFour r12))), 2)"
    "fetch 0x69b0 \<equiv> (Nullary (IS_8088 Ret), 1)"
    "fetch 0x69b1 \<equiv> (Binary (IS_8088 Mov) (Reg (General ThirtyTwo rax)) (Immediate SixtyFour (ImmVal 4294967295)), 5)"
    "fetch 0x69b6 \<equiv> (Unary (IS_8088 Jmp) (Immediate SixtyFour (ImmVal 27032)), 2)"
    "fetch 0x69b8 \<equiv> (Unary (IS_8088 Call) (Immediate SixtyFour (ImmLabel ''__stack_chk_fail'')), 5)"
    "fetch 0x12fb0 \<equiv> (Unary (IS_8088 Push) (Storage (Reg (General SixtyFour r12))), 2)"
    "fetch 0x12fb2 \<equiv> (Binary (IS_PentiumMMX_MMX Pxor) (Reg (SIMD OneHundredTwentyEight ymm0w3 ymm0w2 ymm0w1 ymm0w0)) (Storage (Reg (SIMD OneHundredTwentyEight ymm0w3 ymm0w2 ymm0w1 ymm0w0))), 4)"
    "fetch 0x12fb6 \<equiv> (Unary (IS_8088 Push) (Storage (Reg (General SixtyFour rbp))), 1)"
    "fetch 0x12fb7 \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour rbp)) (Storage (Reg (General SixtyFour rsi))), 3)"
    "fetch 0x12fba \<equiv> (Unary (IS_8088 Push) (Storage (Reg (General SixtyFour rbx))), 1)"
    "fetch 0x12fbb \<equiv> (Binary (IS_8088 Sub) (Reg (General SixtyFour rsp)) (Immediate SixtyFour (ImmVal 32)), 4)"
    "fetch 0x12fbf \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour r12)) (Storage (Memory SixtyFour (A_SizeDirective 64 (A_Plus (A_FromReg (General SixtyFour rdi)) (A_WordConstant 64))))), 4)"
    "fetch 0x12fc3 \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour rdi)) (Storage (Reg (General SixtyFour rsi))), 3)"
    "fetch 0x12fc6 \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour rax)) (Storage (Memory SixtyFour (A_SizeDirective 64 (A_Plus (A_FromReg (General SixtyFour fs)) (A_WordConstant 40))))), 9)"
    "fetch 0x12fcf \<equiv> (Binary (IS_8088 Mov) (Memory SixtyFour (A_SizeDirective 64 (A_Plus (A_FromReg (General SixtyFour rsp)) (A_WordConstant 24)))) (Storage (Reg (General SixtyFour rax))), 5)"
    "fetch 0x12fd4 \<equiv> (Binary (IS_8088 Xor) (Reg (General ThirtyTwo rax)) (Storage (Reg (General ThirtyTwo rax))), 2)"
    "fetch 0x12fd6 \<equiv> (Binary (IS_SSE_SIMD Movaps) (Memory OneHundredTwentyEight (A_SizeDirective 128 (A_FromReg (General SixtyFour rsp)))) (Storage (Reg (SIMD OneHundredTwentyEight ymm0w3 ymm0w2 ymm0w1 ymm0w0))), 4)"
    "fetch 0x12fda \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour rbx)) (Storage (Reg (General SixtyFour rsp))), 3)"
    "fetch 0x12fdd \<equiv> (Unary (IS_8088 Call) (Immediate SixtyFour (ImmLabel ''strlen'')), 5)"
    "fetch 0x12fe2 \<equiv> (Binary (IS_8088 Mov) (Reg (General ThirtyTwo rdi)) (Immediate SixtyFour (ImmVal 16)), 5)"
    "fetch 0x12fe7 \<equiv> (Binary (IS_8088 Cmp) (Reg (General ThirtyTwo rax)) (Immediate SixtyFour (ImmVal 16)), 3)"
    "fetch 0x12fea \<equiv> (Binary (IS_PentiumPro Cmovle) (Reg (General ThirtyTwo rdi)) (Storage (Reg (General ThirtyTwo rax))), 3)"
    "fetch 0x12fed \<equiv> (Binary (IS_8088 Test) (Reg (General ThirtyTwo rax)) (Storage (Reg (General ThirtyTwo rax))), 2)"
    "fetch 0x12fef \<equiv> (Unary (IS_8088 Jle) (Immediate SixtyFour (ImmVal 77840)), 2)"
    "fetch 0x12ff1 \<equiv> (Binary (IS_8088 Xor) (Reg (General ThirtyTwo rax)) (Storage (Reg (General ThirtyTwo rax))), 2)"
    "fetch 0x12ff3 \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour rbx)) (Storage (Reg (General SixtyFour rsp))), 3)"
    "fetch 0x12ff6 \<equiv> (Unary (IS_8088 Nop) (Storage (Memory Sixteen (A_SizeDirective 16 (A_Plus (A_FromReg (General SixtyFour cs)) (A_Plus (A_FromReg (General SixtyFour rax)) (A_Plus (A_Mult 1 (A_FromReg (General SixtyFour rax))) (A_WordConstant 0))))))), 10)"
    "fetch 0x13000 \<equiv> (Binary (IS_80386 Movzx) (Reg (General ThirtyTwo rcx)) (Storage (Memory Eight (A_SizeDirective 8 (A_Plus (A_FromReg (General SixtyFour rbp)) (A_Plus (A_Mult 1 (A_FromReg (General SixtyFour rax))) (A_WordConstant 0)))))), 5)"
    "fetch 0x13005 \<equiv> (Binary (IS_8088 Mov) (Memory Eight (A_SizeDirective 8 (A_Plus (A_FromReg (General SixtyFour rbx)) (A_Mult 1 (A_FromReg (General SixtyFour rax)))))) (Storage (Reg (General Eight rcx))), 3)"
    "fetch 0x13008 \<equiv> (Binary (IS_8088 Add) (Reg (General SixtyFour rax)) (Immediate SixtyFour (ImmVal 1)), 4)"
    "fetch 0x1300c \<equiv> (Binary (IS_8088 Cmp) (Reg (General ThirtyTwo rdi)) (Storage (Reg (General ThirtyTwo rax))), 2)"
    "fetch 0x1300e \<equiv> (Unary (IS_8088 Jg) (Immediate SixtyFour (ImmVal 77824)), 2)"
    "fetch 0x13010 \<equiv> (Binary (IS_8088 Mov) (Reg (General ThirtyTwo rax)) (Storage (Memory ThirtyTwo (A_SizeDirective 32 (A_Plus (A_FromReg (General SixtyFour r12)) (A_WordConstant 356))))), 8)"
    "fetch 0x13018 \<equiv> (Binary (IS_8088 Lea) (Reg (General SixtyFour rdx)) (Storage (Memory SixtyFour (A_Plus (A_FromReg (General SixtyFour r12)) (A_WordConstant 360)))), 8)"
    "fetch 0x13020 \<equiv> (Binary (IS_8088 Mov) (Reg (General ThirtyTwo rsi)) (Immediate SixtyFour (ImmVal 128)), 5)"
    "fetch 0x13025 \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour rdi)) (Storage (Reg (General SixtyFour rbx))), 3)"
    "fetch 0x13028 \<equiv> (Binary (IS_8088 Mov) (Memory ThirtyTwo (A_SizeDirective 32 (A_Plus (A_FromReg (General SixtyFour r12)) (A_WordConstant 352)))) (Storage (Reg (General ThirtyTwo rax))), 8)"
    "fetch 0x13030 \<equiv> (Unary (IS_8088 Call) (Immediate SixtyFour (ImmLabel ''AES_set_encrypt_key'')), 5)"
    "fetch 0x13035 \<equiv> (Binary (IS_8088 Test) (Reg (General ThirtyTwo rax)) (Storage (Reg (General ThirtyTwo rax))), 2)"
    "fetch 0x13037 \<equiv> (Unary (IS_8088 Jne) (Immediate SixtyFour (ImmVal 77937)), 2)"
    "fetch 0x13039 \<equiv> (Binary (IS_8088 Lea) (Reg (General SixtyFour rdx)) (Storage (Memory SixtyFour (A_Plus (A_FromReg (General SixtyFour r12)) (A_WordConstant 604)))), 8)"
    "fetch 0x13041 \<equiv> (Binary (IS_8088 Mov) (Reg (General ThirtyTwo rsi)) (Immediate SixtyFour (ImmVal 128)), 5)"
    "fetch 0x13046 \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour rdi)) (Storage (Reg (General SixtyFour rbx))), 3)"
    "fetch 0x13049 \<equiv> (Unary (IS_8088 Call) (Immediate SixtyFour (ImmLabel ''AES_set_decrypt_key'')), 5)"
    "fetch 0x1304e \<equiv> (Binary (IS_8088 Test) (Reg (General ThirtyTwo rax)) (Storage (Reg (General ThirtyTwo rax))), 2)"
    "fetch 0x13050 \<equiv> (Unary (IS_80386 Setne) (Storage (Reg (General Eight rax))), 3)"
    "fetch 0x13053 \<equiv> (Binary (IS_80386 Movzx) (Reg (General ThirtyTwo rax)) (Storage (Reg (General Eight rax))), 3)"
    "fetch 0x13056 \<equiv> (Unary (IS_8088 Neg) (Storage (Reg (General ThirtyTwo rax))), 2)"
    "fetch 0x13058 \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour rsi)) (Storage (Memory SixtyFour (A_SizeDirective 64 (A_Plus (A_FromReg (General SixtyFour rsp)) (A_WordConstant 24))))), 5)"
    "fetch 0x1305d \<equiv> (Binary (IS_8088 Xor) (Reg (General SixtyFour rsi)) (Storage (Memory SixtyFour (A_SizeDirective 64 (A_Plus (A_FromReg (General SixtyFour fs)) (A_WordConstant 40))))), 9)"
    "fetch 0x13066 \<equiv> (Unary (IS_8088 Jne) (Immediate SixtyFour (ImmVal 77944)), 2)"
    "fetch 0x13068 \<equiv> (Binary (IS_8088 Add) (Reg (General SixtyFour rsp)) (Immediate SixtyFour (ImmVal 32)), 4)"
    "fetch 0x1306c \<equiv> (Unary (IS_8088 Pop) (Storage (Reg (General SixtyFour rbx))), 1)"
    "fetch 0x1306d \<equiv> (Unary (IS_8088 Pop) (Storage (Reg (General SixtyFour rbp))), 1)"
    "fetch 0x1306e \<equiv> (Unary (IS_8088 Pop) (Storage (Reg (General SixtyFour r12))), 2)"
    "fetch 0x13070 \<equiv> (Nullary (IS_8088 Ret), 1)"
    "fetch 0x13071 \<equiv> (Binary (IS_8088 Mov) (Reg (General ThirtyTwo rax)) (Immediate SixtyFour (ImmVal 4294967295)), 5)"
    "fetch 0x13076 \<equiv> (Unary (IS_8088 Jmp) (Immediate SixtyFour (ImmVal 77912)), 2)"
    "fetch 0x13078 \<equiv> (Unary (IS_8088 Call) (Immediate SixtyFour (ImmLabel ''__stack_chk_fail'')), 5)"
    and \<alpha>_def: \<open>\<alpha> = \<lparr>text_sections = [], data_sections = [], labels_to_offsets = [], binary_offset = 0\<rparr>\<close>
    and AES_set_decrypt_key\<^sub>a\<^sub>d\<^sub>d\<^sub>r[simp]: \<open>the (label_to_address \<alpha> ''AES_set_decrypt_key'') = AES_set_decrypt_key_addr\<close>
    and AES_set_encrypt_key\<^sub>a\<^sub>d\<^sub>d\<^sub>r[simp]: \<open>the (label_to_address \<alpha> ''AES_set_encrypt_key'') = AES_set_encrypt_key_addr\<close>
    and stack_chk_fail\<^sub>a\<^sub>d\<^sub>d\<^sub>r[simp]: \<open>the (label_to_address \<alpha> ''__stack_chk_fail'') = stack_chk_fail_addr\<close>
    and strlen\<^sub>a\<^sub>d\<^sub>d\<^sub>r[simp]: \<open>the (label_to_address \<alpha> ''strlen'') = strlen_addr\<close>
begin

text \<open>Using definitions that don't get unfolded immediately prevents locale argument issues.\<close>
definition \<open>strlen_0x691d_retval \<equiv> strlen_0x691d_retval\<^sub>v\<close>
definition \<open>AES_set_encrypt_key_0x6970_retval \<equiv> AES_set_encrypt_key_0x6970_retval\<^sub>v\<close>
definition \<open>AES_set_decrypt_key_0x6989_retval \<equiv> AES_set_decrypt_key_0x6989_retval\<^sub>v\<close>
definition \<open>stack_chk_fail_0x69b8_retval \<equiv> stack_chk_fail_0x69b8_retval\<^sub>v\<close>
definition \<open>strlen_0x12fdd_retval \<equiv> strlen_0x12fdd_retval\<^sub>v\<close>
definition \<open>AES_set_encrypt_key_0x13030_retval \<equiv> AES_set_encrypt_key_0x13030_retval\<^sub>v\<close>
definition \<open>AES_set_decrypt_key_0x13049_retval \<equiv> AES_set_decrypt_key_0x13049_retval\<^sub>v\<close>
definition \<open>stack_chk_fail_0x13078_retval \<equiv> stack_chk_fail_0x13078_retval\<^sub>v\<close>

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

locale "qcow_set_key_1" = "qemu_img_xen" +
  fixes RAX\<^sub>0\<^sub>v RBX\<^sub>0\<^sub>v RCX\<^sub>0\<^sub>v RDX\<^sub>0\<^sub>v RDI\<^sub>0\<^sub>v RSI\<^sub>0\<^sub>v RSP\<^sub>0\<^sub>v RBP\<^sub>0\<^sub>v R12\<^sub>0\<^sub>v FS\<^sub>0\<^sub>v ymm0w0\<^sub>0\<^sub>v ymm0w1\<^sub>0\<^sub>v ret_address\<^sub>v :: \<open>64 word\<close>
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
definition \<open>R12\<^sub>0 \<equiv> R12\<^sub>0\<^sub>v\<close>
definition \<open>FS\<^sub>0 \<equiv> FS\<^sub>0\<^sub>v\<close>
definition \<open>ymm0w0\<^sub>0 \<equiv> ymm0w0\<^sub>0\<^sub>v\<close>
definition \<open>ymm0w1\<^sub>0 \<equiv> ymm0w1\<^sub>0\<^sub>v\<close>
definition \<open>ret_address \<equiv> ret_address\<^sub>v\<close>

definition P_0x68f0_0 :: state_pred where
  \<open>P_0x68f0_0 \<sigma> \<equiv> RIP \<sigma> = 0x68f0 \<and> RAX \<sigma> = RAX\<^sub>0 \<and> RBX \<sigma> = RBX\<^sub>0 \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = RDX\<^sub>0 \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = RSP\<^sub>0 \<and> RBP \<sigma> = RBP\<^sub>0 \<and> R12 \<sigma> = R12\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> regs \<sigma> ymm0w1 = ymm0w1\<^sub>0 \<and> regs \<sigma> ymm0w0 = ymm0w0\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address\<close>
declare P_0x68f0_0_def[Ps]

definition P_0x68f0_0_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x68f0_0_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((FS\<^sub>0::64 word) + 0x28), 8),
    (2, ((RDI\<^sub>0::64 word) + 0x40), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x38), 8)
  }\<close>

definition P_0x68f0_0_regions :: state_pred where
  \<open>P_0x68f0_0_regions \<sigma> \<equiv> \<exists>regions. P_0x68f0_0_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x691d_0 :: state_pred where
  \<open>Q_0x691d_0 \<sigma> \<equiv> RIP \<sigma> = 0x691d \<and> RAX \<sigma> = 0x0 \<and> RBX \<sigma> = ((RSP\<^sub>0::64 word) - 0x38) \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = RDX\<^sub>0 \<and> RDI \<sigma> = RSI\<^sub>0 \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x38) \<and> RBP \<sigma> = RSI\<^sub>0 \<and> R12 \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> FS \<sigma> = FS\<^sub>0 \<and> regs \<sigma> ymm0w1 = 0x0 \<and> regs \<sigma> ymm0w0 = 0x0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((((RSP\<^sub>0::64 word) - 0x38)::64 word) + 0x8),8]::64 word) = 0x0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x38),8]::64 word) = 0x0\<close>
declare Q_0x691d_0_def[Qs]

schematic_goal qcow_set_key_1_0_13_0x68f0_0x691a_0[blocks]:
  assumes \<open>(P_0x68f0_0 && P_0x68f0_0_regions) \<sigma>\<close>
  shows \<open>exec_block 13 0x691a 0 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x691d_0 ?\<sigma> \<and> block_usage P_0x68f0_0_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x68f0_0_def P_0x68f0_0_regions_def post: Q_0x691d_0_def regionset: P_0x68f0_0_regions_set_def)

definition P_0x691d_1 :: state_pred where
  \<open>P_0x691d_1 \<sigma> \<equiv> RIP \<sigma> = 0x691d \<and> RAX \<sigma> = 0x0 \<and> RBX \<sigma> = ((RSP\<^sub>0::64 word) - 0x38) \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = RDX\<^sub>0 \<and> RDI \<sigma> = RSI\<^sub>0 \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x38) \<and> RBP \<sigma> = RSI\<^sub>0 \<and> R12 \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> FS \<sigma> = FS\<^sub>0 \<and> regs \<sigma> ymm0w1 = 0x0 \<and> regs \<sigma> ymm0w0 = 0x0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((((RSP\<^sub>0::64 word) - 0x38)::64 word) + 0x8),8]::64 word) = 0x0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x38),8]::64 word) = 0x0\<close>
declare P_0x691d_1_def[Ps]

definition P_0x691d_1_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x691d_1_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((FS\<^sub>0::64 word) + 0x28), 8),
    (2, ((RDI\<^sub>0::64 word) + 0x40), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x38), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x40), 8)
  }\<close>

definition P_0x691d_1_regions :: state_pred where
  \<open>P_0x691d_1_regions \<sigma> \<equiv> \<exists>regions. P_0x691d_1_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_strlen_addr_0x691d_1 :: state_pred where
  \<open>Q_strlen_addr_0x691d_1 \<sigma> \<equiv> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x40) \<and> RIP \<sigma> = strlen_addr \<and> RAX \<sigma> = 0x0 \<and> RBX \<sigma> = ((RSP\<^sub>0::64 word) - 0x38) \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = RDX\<^sub>0 \<and> RDI \<sigma> = RSI\<^sub>0 \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RBP \<sigma> = RSI\<^sub>0 \<and> R12 \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> FS \<sigma> = FS\<^sub>0 \<and> regs \<sigma> ymm0w1 = 0x0 \<and> regs \<sigma> ymm0w0 = 0x0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((((RSP\<^sub>0::64 word) - 0x38)::64 word) + 0x8),8]::64 word) = 0x0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x38),8]::64 word) = 0x0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = 0x6922\<close>
declare Q_strlen_addr_0x691d_1_def[Qs]

schematic_goal qcow_set_key_1_0_1_0x691d_0x691d_1[blocks]:
  assumes \<open>(P_0x691d_1 && P_0x691d_1_regions) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x691d (Suc 0) \<sigma> \<triangleq> ?\<sigma> \<and> Q_strlen_addr_0x691d_1 ?\<sigma> \<and> block_usage P_0x691d_1_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x691d_1_def P_0x691d_1_regions_def post: Q_strlen_addr_0x691d_1_def regionset: P_0x691d_1_regions_set_def)

definition P_0x6922_2 :: state_pred where
  \<open>P_0x6922_2 \<sigma> \<equiv> RIP \<sigma> = 0x6922 \<and> RAX \<sigma> = strlen_0x691d_retval \<and> RBX \<sigma> = ((RSP\<^sub>0::64 word) - 0x38) \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = RDX\<^sub>0 \<and> RDI \<sigma> = RSI\<^sub>0 \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x38) \<and> RBP \<sigma> = RSI\<^sub>0 \<and> R12 \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> FS \<sigma> = FS\<^sub>0 \<and> regs \<sigma> ymm0w1 = 0x0 \<and> regs \<sigma> ymm0w0 = 0x0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((((RSP\<^sub>0::64 word) - 0x38)::64 word) + 0x8),8]::64 word) = 0x0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x38),8]::64 word) = 0x0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = 0x6922\<close>
declare P_0x6922_2_def[Ps]

definition P_0x6922_2_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x6922_2_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((FS\<^sub>0::64 word) + 0x28), 8),
    (2, ((RDI\<^sub>0::64 word) + 0x40), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x38), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x40), 8)
  }\<close>

definition P_0x6922_2_regions :: state_pred where
  \<open>P_0x6922_2_regions \<sigma> \<equiv> \<exists>regions. P_0x6922_2_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x692f_2 :: state_pred where
  \<open>Q_0x692f_2 \<sigma> \<equiv> RIP \<sigma> = 0x692f \<and> RAX \<sigma> = strlen_0x691d_retval \<and> RBX \<sigma> = ((RSP\<^sub>0::64 word) - 0x38) \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = RDX\<^sub>0 
\<and> RDI \<sigma> = ucast ((if' ((\<langle>31,0\<rangle>strlen_0x691d_retval::32 word)::32 word) \<le>s 0x10 then (\<langle>31,0\<rangle>strlen_0x691d_retval::32 word) else (0x10::32 word))) 
\<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x38) 
\<and> RBP \<sigma> = RSI\<^sub>0 \<and> R12 \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> FS \<sigma> = FS\<^sub>0 \<and> regs \<sigma> ymm0w1 = 0x0 \<and> regs \<sigma> ymm0w0 = 0x0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R12\<^sub>0
 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((((RSP\<^sub>0::64 word) - 0x38)::64 word) + 0x8),8]::64 word) = 0x0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x38),8]::64 word) = 0x0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = 0x6922\<close>
declare Q_0x692f_2_def[Qs]

schematic_goal qcow_set_key_1_0_4_0x6922_0x692d_2[blocks]:
  assumes \<open>(P_0x6922_2 && P_0x6922_2_regions) \<sigma>\<close>
  shows \<open>exec_block 4 0x692d 2 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x692f_2 ?\<sigma> \<and> block_usage P_0x6922_2_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x6922_2_def P_0x6922_2_regions_def post: Q_0x692f_2_def regionset: P_0x6922_2_regions_set_def)

definition P_0x692f_true_3 :: state_pred where
  \<open>P_0x692f_true_3 \<sigma> \<equiv> RIP \<sigma> = 0x692f \<and> RAX \<sigma> = strlen_0x691d_retval \<and> RBX \<sigma> = ((RSP\<^sub>0::64 word) - 0x38) \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = RDX\<^sub>0 \<and> RDI \<sigma> = ucast ((if' ((\<langle>31,0\<rangle>strlen_0x691d_retval::32 word)::32 word) \<le>s 0x10 then (\<langle>31,0\<rangle>strlen_0x691d_retval::32 word) else (0x10::32 word))) \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x38) \<and> RBP \<sigma> = RSI\<^sub>0 \<and> R12 \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> FS \<sigma> = FS\<^sub>0 \<and> regs \<sigma> ymm0w1 = 0x0 \<and> regs \<sigma> ymm0w0 = 0x0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((((RSP\<^sub>0::64 word) - 0x38)::64 word) + 0x8),8]::64 word) = 0x0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x38),8]::64 word) = 0x0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = 0x6922\<close>
declare P_0x692f_true_3_def[Ps]

definition P_0x692f_true_3_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x692f_true_3_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((FS\<^sub>0::64 word) + 0x28), 8),
    (2, ((RDI\<^sub>0::64 word) + 0x40), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x38), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x40), 8)
  }\<close>

definition P_0x692f_true_3_regions :: state_pred where
  \<open>P_0x692f_true_3_regions \<sigma> \<equiv> \<exists>regions. P_0x692f_true_3_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x6950_3 :: state_pred where
  \<open>Q_0x6950_3 \<sigma> \<equiv> RIP \<sigma> = 0x6950 \<and> RBX \<sigma> = ((RSP\<^sub>0::64 word) - 0x38) \<and> RDX \<sigma> = RDX\<^sub>0 \<and> RDI \<sigma> = ucast ((if' ((\<langle>31,0\<rangle>strlen_0x691d_retval::32 word)::32 word) \<le>s 0x10 then (\<langle>31,0\<rangle>strlen_0x691d_retval::32 word) else (0x10::32 word))) \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x38) \<and> RBP \<sigma> = RSI\<^sub>0 \<and> R12 \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> FS \<sigma> = FS\<^sub>0 \<and> regs \<sigma> ymm0w1 = 0x0 \<and> regs \<sigma> ymm0w0 = 0x0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((((RSP\<^sub>0::64 word) - 0x38)::64 word) + 0x8),8]::64 word) = 0x0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x38),8]::64 word) = 0x0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = 0x6922\<close>
declare Q_0x6950_3_def[Qs]

schematic_goal qcow_set_key_1_0_1_0x692f_0x692f_3[blocks]:
  assumes \<open>(P_0x692f_true_3 && P_0x692f_true_3_regions && jle) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x692f 3 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x6950_3 ?\<sigma> \<and> block_usage P_0x692f_true_3_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x692f_true_3_def P_0x692f_true_3_regions_def post: Q_0x6950_3_def regionset: P_0x692f_true_3_regions_set_def)

definition P_0x692f_false_4 :: state_pred where
  \<open>P_0x692f_false_4 \<sigma> \<equiv> RIP \<sigma> = 0x692f \<and> RAX \<sigma> = strlen_0x691d_retval \<and> RBX \<sigma> = ((RSP\<^sub>0::64 word) - 0x38) \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = RDX\<^sub>0 \<and> RDI \<sigma> = ucast ((if' ((\<langle>31,0\<rangle>strlen_0x691d_retval::32 word)::32 word) \<le>s 0x10 then (\<langle>31,0\<rangle>strlen_0x691d_retval::32 word) else (0x10::32 word))) \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x38) \<and> RBP \<sigma> = RSI\<^sub>0 \<and> R12 \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> FS \<sigma> = FS\<^sub>0 \<and> regs \<sigma> ymm0w1 = 0x0 \<and> regs \<sigma> ymm0w0 = 0x0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((((RSP\<^sub>0::64 word) - 0x38)::64 word) + 0x8),8]::64 word) = 0x0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x38),8]::64 word) = 0x0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = 0x6922\<close>
declare P_0x692f_false_4_def[Ps]

definition P_0x692f_false_4_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x692f_false_4_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((FS\<^sub>0::64 word) + 0x28), 8),
    (2, ((RDI\<^sub>0::64 word) + 0x40), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x38), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x40), 8)
  }\<close>

definition P_0x692f_false_4_regions :: state_pred where
  \<open>P_0x692f_false_4_regions \<sigma> \<equiv> \<exists>regions. P_0x692f_false_4_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x6940_4 :: state_pred where
  \<open>Q_0x6940_4 \<sigma> \<equiv> RIP \<sigma> = 0x6940 \<and> RBX \<sigma> = ((RSP\<^sub>0::64 word) - 0x38) \<and> RDX \<sigma> = RDX\<^sub>0 \<and> RDI \<sigma> = ucast ((if' ((\<langle>31,0\<rangle>strlen_0x691d_retval::32 word)::32 word) \<le>s 0x10 then (\<langle>31,0\<rangle>strlen_0x691d_retval::32 word) else (0x10::32 word))) \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x38) \<and> RBP \<sigma> = RSI\<^sub>0 \<and> R12 \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> FS \<sigma> = FS\<^sub>0 \<and> regs \<sigma> ymm0w1 = 0x0 \<and> regs \<sigma> ymm0w0 = 0x0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((((RSP\<^sub>0::64 word) - 0x38)::64 word) + 0x8),8]::64 word) = 0x0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x38),8]::64 word) = 0x0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = 0x6922\<close>
declare Q_0x6940_4_def[Qs]

schematic_goal qcow_set_key_1_0_4_0x692f_0x6936_4[blocks]:
  assumes \<open>(P_0x692f_false_4 && P_0x692f_false_4_regions && ! jle) \<sigma>\<close>
  shows \<open>exec_block 4 0x6936 4 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x6940_4 ?\<sigma> \<and> block_usage P_0x692f_false_4_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x692f_false_4_def P_0x692f_false_4_regions_def post: Q_0x6940_4_def regionset: P_0x692f_false_4_regions_set_def)

definition P_0x6940_5 :: state_pred where
  \<open>P_0x6940_5 \<sigma> \<equiv> RIP \<sigma> = 0x6940 \<and> RBX \<sigma> = ((RSP\<^sub>0::64 word) - 0x38) \<and> RDX \<sigma> = RDX\<^sub>0 \<and> RDI \<sigma> = ucast ((if' ((\<langle>31,0\<rangle>strlen_0x691d_retval::32 word)::32 word) \<le>s 0x10 then (\<langle>31,0\<rangle>strlen_0x691d_retval::32 word) else (0x10::32 word))) \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x38) \<and> RBP \<sigma> = RSI\<^sub>0 \<and> R12 \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> FS \<sigma> = FS\<^sub>0 \<and> regs \<sigma> ymm0w1 = 0x0 \<and> regs \<sigma> ymm0w0 = 0x0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((((RSP\<^sub>0::64 word) - 0x38)::64 word) + 0x8),8]::64 word) = 0x0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x38),8]::64 word) = 0x0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = 0x6922\<close>
declare P_0x6940_5_def[Ps]

definition P_0x6940_5_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x6940_5_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((FS\<^sub>0::64 word) + 0x28), 8),
    (2, ((RDI\<^sub>0::64 word) + 0x40), 8),
    (3, ((RSI\<^sub>0::64 word) + (\<langle>63,0\<rangle>((RAX \<sigma>::64 word) * 0x1)::64 word)), Suc 0),
    (4, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x38), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x40), 8),
    (11, ((((RSP\<^sub>0::64 word) + (\<langle>63,0\<rangle>((RAX \<sigma>::64 word) * 0x1)::64 word))::64 word) - 0x38), Suc 0)
  }\<close>

definition P_0x6940_5_regions :: state_pred where
  \<open>P_0x6940_5_regions \<sigma> \<equiv> \<exists>regions. P_0x6940_5_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x694e_5 :: state_pred where
  \<open>Q_0x694e_5 \<sigma> \<equiv> RIP \<sigma> = 0x694e \<and> RBX \<sigma> = ((RSP\<^sub>0::64 word) - 0x38) \<and> RDX \<sigma> = RDX\<^sub>0 \<and> RDI \<sigma> = ucast ((if' ((\<langle>31,0\<rangle>strlen_0x691d_retval::32 word)::32 word) \<le>s 0x10 then (\<langle>31,0\<rangle>strlen_0x691d_retval::32 word) else (0x10::32 word))) \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x38) \<and> RBP \<sigma> = RSI\<^sub>0 \<and> R12 \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> FS \<sigma> = FS\<^sub>0 \<and> regs \<sigma> ymm0w1 = 0x0 \<and> regs \<sigma> ymm0w0 = 0x0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((((RSP\<^sub>0::64 word) - 0x38)::64 word) + 0x8),8]::64 word) = 0x0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x38),8]::64 word) = 0x0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = 0x6922\<close>
declare Q_0x694e_5_def[Qs]

schematic_goal qcow_set_key_1_0_4_0x6940_0x694c_5[blocks]:
  assumes \<open>(P_0x6940_5 && P_0x6940_5_regions) \<sigma>\<close>
  shows \<open>exec_block 4 0x694c 5 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x694e_5 ?\<sigma> \<and> block_usage P_0x6940_5_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x6940_5_def P_0x6940_5_regions_def post: Q_0x694e_5_def regionset: P_0x6940_5_regions_set_def)

definition P_0x694e_true_6 :: state_pred where
  \<open>P_0x694e_true_6 \<sigma> \<equiv> RIP \<sigma> = 0x694e \<and> RBX \<sigma> = ((RSP\<^sub>0::64 word) - 0x38) \<and> RDX \<sigma> = RDX\<^sub>0 \<and> RDI \<sigma> = ucast ((if' ((\<langle>31,0\<rangle>strlen_0x691d_retval::32 word)::32 word) \<le>s 0x10 then (\<langle>31,0\<rangle>strlen_0x691d_retval::32 word) else (0x10::32 word))) \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x38) \<and> RBP \<sigma> = RSI\<^sub>0 \<and> R12 \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> FS \<sigma> = FS\<^sub>0 \<and> regs \<sigma> ymm0w1 = 0x0 \<and> regs \<sigma> ymm0w0 = 0x0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((((RSP\<^sub>0::64 word) - 0x38)::64 word) + 0x8),8]::64 word) = 0x0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x38),8]::64 word) = 0x0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = 0x6922\<close>
declare P_0x694e_true_6_def[Ps]

definition P_0x694e_true_6_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x694e_true_6_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((FS\<^sub>0::64 word) + 0x28), 8),
    (2, ((RDI\<^sub>0::64 word) + 0x40), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x38), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x40), 8)
  }\<close>

definition P_0x694e_true_6_regions :: state_pred where
  \<open>P_0x694e_true_6_regions \<sigma> \<equiv> \<exists>regions. P_0x694e_true_6_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x6940_6 :: state_pred where
  \<open>Q_0x6940_6 \<sigma> \<equiv> RIP \<sigma> = 0x6940 \<and> RBX \<sigma> = ((RSP\<^sub>0::64 word) - 0x38) \<and> RDX \<sigma> = RDX\<^sub>0 \<and> RDI \<sigma> = ucast ((if' ((\<langle>31,0\<rangle>strlen_0x691d_retval::32 word)::32 word) \<le>s 0x10 then (\<langle>31,0\<rangle>strlen_0x691d_retval::32 word) else (0x10::32 word))) \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x38) \<and> RBP \<sigma> = RSI\<^sub>0 \<and> R12 \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> FS \<sigma> = FS\<^sub>0 \<and> regs \<sigma> ymm0w1 = 0x0 \<and> regs \<sigma> ymm0w0 = 0x0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((((RSP\<^sub>0::64 word) - 0x38)::64 word) + 0x8),8]::64 word) = 0x0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x38),8]::64 word) = 0x0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = 0x6922\<close>
declare Q_0x6940_6_def[Qs]

schematic_goal qcow_set_key_1_0_1_0x694e_0x694e_6[blocks]:
  assumes \<open>(P_0x694e_true_6 && P_0x694e_true_6_regions && jg) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x694e 6 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x6940_6 ?\<sigma> \<and> block_usage P_0x694e_true_6_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x694e_true_6_def P_0x694e_true_6_regions_def post: Q_0x6940_6_def regionset: P_0x694e_true_6_regions_set_def)

definition P_0x694e_false_7 :: state_pred where
  \<open>P_0x694e_false_7 \<sigma> \<equiv> RIP \<sigma> = 0x694e \<and> RBX \<sigma> = ((RSP\<^sub>0::64 word) - 0x38) \<and> RDX \<sigma> = RDX\<^sub>0 \<and> RDI \<sigma> = ucast ((if' ((\<langle>31,0\<rangle>strlen_0x691d_retval::32 word)::32 word) \<le>s 0x10 then (\<langle>31,0\<rangle>strlen_0x691d_retval::32 word) else (0x10::32 word))) \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x38) \<and> RBP \<sigma> = RSI\<^sub>0 \<and> R12 \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> FS \<sigma> = FS\<^sub>0 \<and> regs \<sigma> ymm0w1 = 0x0 \<and> regs \<sigma> ymm0w0 = 0x0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((((RSP\<^sub>0::64 word) - 0x38)::64 word) + 0x8),8]::64 word) = 0x0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x38),8]::64 word) = 0x0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = 0x6922\<close>
declare P_0x694e_false_7_def[Ps]

definition P_0x694e_false_7_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x694e_false_7_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((FS\<^sub>0::64 word) + 0x28), 8),
    (2, ((RDI\<^sub>0::64 word) + 0x40), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x38), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x40), 8)
  }\<close>

definition P_0x694e_false_7_regions :: state_pred where
  \<open>P_0x694e_false_7_regions \<sigma> \<equiv> \<exists>regions. P_0x694e_false_7_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x6950_7 :: state_pred where
  \<open>Q_0x6950_7 \<sigma> \<equiv> RIP \<sigma> = 0x6950 \<and> RBX \<sigma> = ((RSP\<^sub>0::64 word) - 0x38) \<and> RDX \<sigma> = RDX\<^sub>0 \<and> RDI \<sigma> = ucast ((if' ((\<langle>31,0\<rangle>strlen_0x691d_retval::32 word)::32 word) \<le>s 0x10 then (\<langle>31,0\<rangle>strlen_0x691d_retval::32 word) else (0x10::32 word))) \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x38) \<and> RBP \<sigma> = RSI\<^sub>0 \<and> R12 \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> FS \<sigma> = FS\<^sub>0 \<and> regs \<sigma> ymm0w1 = 0x0 \<and> regs \<sigma> ymm0w0 = 0x0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((((RSP\<^sub>0::64 word) - 0x38)::64 word) + 0x8),8]::64 word) = 0x0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x38),8]::64 word) = 0x0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = 0x6922\<close>
declare Q_0x6950_7_def[Qs]

schematic_goal qcow_set_key_1_0_1_0x694e_0x694e_7[blocks]:
  assumes \<open>(P_0x694e_false_7 && P_0x694e_false_7_regions && ! jg) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x694e 7 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x6950_7 ?\<sigma> \<and> block_usage P_0x694e_false_7_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x694e_false_7_def P_0x694e_false_7_regions_def post: Q_0x6950_7_def regionset: P_0x694e_false_7_regions_set_def)

definition P_0x6950_8 :: state_pred where
  \<open>P_0x6950_8 \<sigma> \<equiv> RIP \<sigma> = 0x6950 \<and> RBX \<sigma> = ((RSP\<^sub>0::64 word) - 0x38) \<and> RDX \<sigma> = RDX\<^sub>0 \<and> RDI \<sigma> = ucast ((if' ((\<langle>31,0\<rangle>strlen_0x691d_retval::32 word)::32 word) \<le>s 0x10 then (\<langle>31,0\<rangle>strlen_0x691d_retval::32 word) else (0x10::32 word))) \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x38) \<and> RBP \<sigma> = RSI\<^sub>0 \<and> R12 \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> FS \<sigma> = FS\<^sub>0 \<and> regs \<sigma> ymm0w1 = 0x0 \<and> regs \<sigma> ymm0w0 = 0x0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((((RSP\<^sub>0::64 word) - 0x38)::64 word) + 0x8),8]::64 word) = 0x0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x38),8]::64 word) = 0x0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = 0x6922\<close>
declare P_0x6950_8_def[Ps]

definition P_0x6950_8_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x6950_8_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((FS\<^sub>0::64 word) + 0x28), 8),
    (2, ((RDI\<^sub>0::64 word) + 0x40), 8),
    (3, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x118), 4),
    (4, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x11c), 4),
    (5, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x38), 8),
    (11, ((RSP\<^sub>0::64 word) - 0x40), 8)
  }\<close>

definition P_0x6950_8_regions :: state_pred where
  \<open>P_0x6950_8_regions \<sigma> \<equiv> \<exists>regions. P_0x6950_8_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x6970_8 :: state_pred where
  \<open>Q_0x6970_8 \<sigma> \<equiv> RIP \<sigma> = 0x6970 \<and> RAX \<sigma> = ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x11c),4]::32 word)) \<and> RBX \<sigma> = ((RSP\<^sub>0::64 word) - 0x38) \<and> RDX \<sigma> = (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x120) \<and> RDI \<sigma> = ((RSP\<^sub>0::64 word) - 0x38) \<and> RSI \<sigma> = 0x80 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x38) \<and> RBP \<sigma> = RSI\<^sub>0 \<and> R12 \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> FS \<sigma> = FS\<^sub>0 \<and> regs \<sigma> ymm0w1 = 0x0 \<and> regs \<sigma> ymm0w0 = 0x0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x118),4]::32 word) = ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x11c),4]::32 word)) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x11c),4]::32 word) = ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x11c),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((((RSP\<^sub>0::64 word) - 0x38)::64 word) + 0x8),8]::64 word) = 0x0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x38),8]::64 word) = 0x0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = 0x6922\<close>
declare Q_0x6970_8_def[Qs]

schematic_goal qcow_set_key_1_0_5_0x6950_0x6968_8[blocks]:
  assumes \<open>(P_0x6950_8 && P_0x6950_8_regions) \<sigma>\<close>
  shows \<open>exec_block 5 0x6968 8 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x6970_8 ?\<sigma> \<and> block_usage P_0x6950_8_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x6950_8_def P_0x6950_8_regions_def post: Q_0x6970_8_def regionset: P_0x6950_8_regions_set_def)

definition P_0x6970_9 :: state_pred where
  \<open>P_0x6970_9 \<sigma> \<equiv> RIP \<sigma> = 0x6970 \<and> RAX \<sigma> = ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x11c),4]::32 word)) \<and> RBX \<sigma> = ((RSP\<^sub>0::64 word) - 0x38) \<and> RDX \<sigma> = (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x120) \<and> RDI \<sigma> = ((RSP\<^sub>0::64 word) - 0x38) \<and> RSI \<sigma> = 0x80 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x38) \<and> RBP \<sigma> = RSI\<^sub>0 \<and> R12 \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> FS \<sigma> = FS\<^sub>0 \<and> regs \<sigma> ymm0w1 = 0x0 \<and> regs \<sigma> ymm0w0 = 0x0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x118),4]::32 word) = ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x11c),4]::32 word)) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x11c),4]::32 word) = ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x11c),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((((RSP\<^sub>0::64 word) - 0x38)::64 word) + 0x8),8]::64 word) = 0x0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x38),8]::64 word) = 0x0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = 0x6922\<close>
declare P_0x6970_9_def[Ps]

definition P_0x6970_9_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x6970_9_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((FS\<^sub>0::64 word) + 0x28), 8),
    (2, ((RDI\<^sub>0::64 word) + 0x40), 8),
    (3, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x118), 4),
    (4, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x11c), 4),
    (5, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x38), 8),
    (11, ((RSP\<^sub>0::64 word) - 0x40), 8)
  }\<close>

definition P_0x6970_9_regions :: state_pred where
  \<open>P_0x6970_9_regions \<sigma> \<equiv> \<exists>regions. P_0x6970_9_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_AES_set_encrypt_key_addr_0x6970_9 :: state_pred where
  \<open>Q_AES_set_encrypt_key_addr_0x6970_9 \<sigma> \<equiv> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x40) \<and> RIP \<sigma> = AES_set_encrypt_key_addr \<and> RAX \<sigma> = ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x11c),4]::32 word)) \<and> RBX \<sigma> = ((RSP\<^sub>0::64 word) - 0x38) \<and> RDX \<sigma> = (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x120) \<and> RDI \<sigma> = ((RSP\<^sub>0::64 word) - 0x38) \<and> RSI \<sigma> = 0x80 \<and> RBP \<sigma> = RSI\<^sub>0 \<and> R12 \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> FS \<sigma> = FS\<^sub>0 \<and> regs \<sigma> ymm0w1 = 0x0 \<and> regs \<sigma> ymm0w0 = 0x0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x118),4]::32 word) = ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x11c),4]::32 word)) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x11c),4]::32 word) = ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x11c),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((((RSP\<^sub>0::64 word) - 0x38)::64 word) + 0x8),8]::64 word) = 0x0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x38),8]::64 word) = 0x0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = 0x6975\<close>
declare Q_AES_set_encrypt_key_addr_0x6970_9_def[Qs]

schematic_goal qcow_set_key_1_0_1_0x6970_0x6970_9[blocks]:
  assumes \<open>(P_0x6970_9 && P_0x6970_9_regions) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x6970 9 \<sigma> \<triangleq> ?\<sigma> \<and> Q_AES_set_encrypt_key_addr_0x6970_9 ?\<sigma> \<and> block_usage P_0x6970_9_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x6970_9_def P_0x6970_9_regions_def post: Q_AES_set_encrypt_key_addr_0x6970_9_def regionset: P_0x6970_9_regions_set_def)

definition P_0x6975_10 :: state_pred where
  \<open>P_0x6975_10 \<sigma> \<equiv> RIP \<sigma> = 0x6975 \<and> RAX \<sigma> = AES_set_encrypt_key_0x6970_retval \<and> RBX \<sigma> = ((RSP\<^sub>0::64 word) - 0x38) \<and> RDX \<sigma> = (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x120) \<and> RDI \<sigma> = ((RSP\<^sub>0::64 word) - 0x38) \<and> RSI \<sigma> = 0x80 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x38) \<and> RBP \<sigma> = RSI\<^sub>0 \<and> R12 \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> FS \<sigma> = FS\<^sub>0 \<and> regs \<sigma> ymm0w1 = 0x0 \<and> regs \<sigma> ymm0w0 = 0x0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x118),4]::32 word) = ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x11c),4]::32 word)) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x11c),4]::32 word) = ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x11c),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((((RSP\<^sub>0::64 word) - 0x38)::64 word) + 0x8),8]::64 word) = 0x0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x38),8]::64 word) = 0x0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = 0x6975\<close>
declare P_0x6975_10_def[Ps]

definition P_0x6975_10_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x6975_10_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((FS\<^sub>0::64 word) + 0x28), 8),
    (2, ((RDI\<^sub>0::64 word) + 0x40), 8),
    (3, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x118), 4),
    (4, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x11c), 4),
    (5, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x38), 8),
    (11, ((RSP\<^sub>0::64 word) - 0x40), 8)
  }\<close>

definition P_0x6975_10_regions :: state_pred where
  \<open>P_0x6975_10_regions \<sigma> \<equiv> \<exists>regions. P_0x6975_10_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x6977_10 :: state_pred where
  \<open>Q_0x6977_10 \<sigma> \<equiv> RIP \<sigma> = 0x6977 \<and> RAX \<sigma> = AES_set_encrypt_key_0x6970_retval \<and> RBX \<sigma> = ((RSP\<^sub>0::64 word) - 0x38) \<and> RDX \<sigma> = (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x120) \<and> RDI \<sigma> = ((RSP\<^sub>0::64 word) - 0x38) \<and> RSI \<sigma> = 0x80 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x38) \<and> RBP \<sigma> = RSI\<^sub>0 \<and> R12 \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> FS \<sigma> = FS\<^sub>0 \<and> regs \<sigma> ymm0w1 = 0x0 \<and> regs \<sigma> ymm0w0 = 0x0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x118),4]::32 word) = ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x11c),4]::32 word)) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x11c),4]::32 word) = ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x11c),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((((RSP\<^sub>0::64 word) - 0x38)::64 word) + 0x8),8]::64 word) = 0x0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x38),8]::64 word) = 0x0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = 0x6975\<close>
declare Q_0x6977_10_def[Qs]

schematic_goal qcow_set_key_1_0_1_0x6975_0x6975_10[blocks]:
  assumes \<open>(P_0x6975_10 && P_0x6975_10_regions) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x6975 10 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x6977_10 ?\<sigma> \<and> block_usage P_0x6975_10_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x6975_10_def P_0x6975_10_regions_def post: Q_0x6977_10_def regionset: P_0x6975_10_regions_set_def)

definition P_0x6977_true_11 :: state_pred where
  \<open>P_0x6977_true_11 \<sigma> \<equiv> RIP \<sigma> = 0x6977 \<and> RAX \<sigma> = AES_set_encrypt_key_0x6970_retval \<and> RBX \<sigma> = ((RSP\<^sub>0::64 word) - 0x38) \<and> RDX \<sigma> = (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x120) \<and> RDI \<sigma> = ((RSP\<^sub>0::64 word) - 0x38) \<and> RSI \<sigma> = 0x80 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x38) \<and> RBP \<sigma> = RSI\<^sub>0 \<and> R12 \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> FS \<sigma> = FS\<^sub>0 \<and> regs \<sigma> ymm0w1 = 0x0 \<and> regs \<sigma> ymm0w0 = 0x0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x118),4]::32 word) = ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x11c),4]::32 word)) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x11c),4]::32 word) = ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x11c),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((((RSP\<^sub>0::64 word) - 0x38)::64 word) + 0x8),8]::64 word) = 0x0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x38),8]::64 word) = 0x0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = 0x6975\<close>
declare P_0x6977_true_11_def[Ps]

definition P_0x6977_true_11_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x6977_true_11_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((FS\<^sub>0::64 word) + 0x28), 8),
    (2, ((RDI\<^sub>0::64 word) + 0x40), 8),
    (3, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x118), 4),
    (4, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x11c), 4),
    (5, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x38), 8),
    (11, ((RSP\<^sub>0::64 word) - 0x40), 8)
  }\<close>

definition P_0x6977_true_11_regions :: state_pred where
  \<open>P_0x6977_true_11_regions \<sigma> \<equiv> \<exists>regions. P_0x6977_true_11_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x6998_11 :: state_pred where
  \<open>Q_0x6998_11 \<sigma> \<equiv> RIP \<sigma> = 0x6998 \<and> RBX \<sigma> = ((RSP\<^sub>0::64 word) - 0x38) \<and> RDI \<sigma> = ((RSP\<^sub>0::64 word) - 0x38) \<and> RSI \<sigma> = 0x80 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x38) \<and> RBP \<sigma> = RSI\<^sub>0 \<and> R12 \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> FS \<sigma> = FS\<^sub>0 \<and> regs \<sigma> ymm0w1 = 0x0 \<and> regs \<sigma> ymm0w0 = 0x0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x118),4]::32 word) = ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x11c),4]::32 word)) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x11c),4]::32 word) = ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x11c),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((((RSP\<^sub>0::64 word) - 0x38)::64 word) + 0x8),8]::64 word) = 0x0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x38),8]::64 word) = 0x0\<close>
declare Q_0x6998_11_def[Qs]

schematic_goal qcow_set_key_1_0_3_0x6977_0x69b6_11[blocks]:
  assumes \<open>(P_0x6977_true_11 && P_0x6977_true_11_regions && !ZF) \<sigma>\<close>
  shows \<open>exec_block 3 0x69b6 11 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x6998_11 ?\<sigma> \<and> block_usage P_0x6977_true_11_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x6977_true_11_def P_0x6977_true_11_regions_def post: Q_0x6998_11_def regionset: P_0x6977_true_11_regions_set_def)

definition P_0x6977_false_12 :: state_pred where
  \<open>P_0x6977_false_12 \<sigma> \<equiv> RIP \<sigma> = 0x6977 \<and> RAX \<sigma> = AES_set_encrypt_key_0x6970_retval \<and> RBX \<sigma> = ((RSP\<^sub>0::64 word) - 0x38) \<and> RDX \<sigma> = (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x120) \<and> RDI \<sigma> = ((RSP\<^sub>0::64 word) - 0x38) \<and> RSI \<sigma> = 0x80 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x38) \<and> RBP \<sigma> = RSI\<^sub>0 \<and> R12 \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> FS \<sigma> = FS\<^sub>0 \<and> regs \<sigma> ymm0w1 = 0x0 \<and> regs \<sigma> ymm0w0 = 0x0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x118),4]::32 word) = ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x11c),4]::32 word)) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x11c),4]::32 word) = ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x11c),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((((RSP\<^sub>0::64 word) - 0x38)::64 word) + 0x8),8]::64 word) = 0x0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x38),8]::64 word) = 0x0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = 0x6975\<close>
declare P_0x6977_false_12_def[Ps]

definition P_0x6977_false_12_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x6977_false_12_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((FS\<^sub>0::64 word) + 0x28), 8),
    (2, ((RDI\<^sub>0::64 word) + 0x40), 8),
    (3, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x118), 4),
    (4, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x11c), 4),
    (5, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x38), 8),
    (11, ((RSP\<^sub>0::64 word) - 0x40), 8)
  }\<close>

definition P_0x6977_false_12_regions :: state_pred where
  \<open>P_0x6977_false_12_regions \<sigma> \<equiv> \<exists>regions. P_0x6977_false_12_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x6989_12 :: state_pred where
  \<open>Q_0x6989_12 \<sigma> \<equiv> RIP \<sigma> = 0x6989 \<and> RAX \<sigma> = AES_set_encrypt_key_0x6970_retval \<and> RBX \<sigma> = ((RSP\<^sub>0::64 word) - 0x38) \<and> RDX \<sigma> = (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x214) \<and> RDI \<sigma> = ((RSP\<^sub>0::64 word) - 0x38) \<and> RSI \<sigma> = 0x80 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x38) \<and> RBP \<sigma> = RSI\<^sub>0 \<and> R12 \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> FS \<sigma> = FS\<^sub>0 \<and> regs \<sigma> ymm0w1 = 0x0 \<and> regs \<sigma> ymm0w0 = 0x0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x118),4]::32 word) = ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x11c),4]::32 word)) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x11c),4]::32 word) = ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x11c),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((((RSP\<^sub>0::64 word) - 0x38)::64 word) + 0x8),8]::64 word) = 0x0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x38),8]::64 word) = 0x0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = 0x6975\<close>
declare Q_0x6989_12_def[Qs]

schematic_goal qcow_set_key_1_0_4_0x6977_0x6986_12[blocks]:
  assumes \<open>(P_0x6977_false_12 && P_0x6977_false_12_regions && ! !ZF) \<sigma>\<close>
  shows \<open>exec_block 4 0x6986 12 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x6989_12 ?\<sigma> \<and> block_usage P_0x6977_false_12_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x6977_false_12_def P_0x6977_false_12_regions_def post: Q_0x6989_12_def regionset: P_0x6977_false_12_regions_set_def)

definition P_0x6989_13 :: state_pred where
  \<open>P_0x6989_13 \<sigma> \<equiv> RIP \<sigma> = 0x6989 \<and> RAX \<sigma> = AES_set_encrypt_key_0x6970_retval \<and> RBX \<sigma> = ((RSP\<^sub>0::64 word) - 0x38) \<and> RDX \<sigma> = (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x214) \<and> RDI \<sigma> = ((RSP\<^sub>0::64 word) - 0x38) \<and> RSI \<sigma> = 0x80 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x38) \<and> RBP \<sigma> = RSI\<^sub>0 \<and> R12 \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> FS \<sigma> = FS\<^sub>0 \<and> regs \<sigma> ymm0w1 = 0x0 \<and> regs \<sigma> ymm0w0 = 0x0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x118),4]::32 word) = ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x11c),4]::32 word)) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x11c),4]::32 word) = ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x11c),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((((RSP\<^sub>0::64 word) - 0x38)::64 word) + 0x8),8]::64 word) = 0x0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x38),8]::64 word) = 0x0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = 0x6975\<close>
declare P_0x6989_13_def[Ps]

definition P_0x6989_13_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x6989_13_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((FS\<^sub>0::64 word) + 0x28), 8),
    (2, ((RDI\<^sub>0::64 word) + 0x40), 8),
    (3, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x118), 4),
    (4, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x11c), 4),
    (5, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x38), 8),
    (11, ((RSP\<^sub>0::64 word) - 0x40), 8)
  }\<close>

definition P_0x6989_13_regions :: state_pred where
  \<open>P_0x6989_13_regions \<sigma> \<equiv> \<exists>regions. P_0x6989_13_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_AES_set_decrypt_key_addr_0x6989_13 :: state_pred where
  \<open>Q_AES_set_decrypt_key_addr_0x6989_13 \<sigma> \<equiv> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x40) \<and> RIP \<sigma> = AES_set_decrypt_key_addr \<and> RAX \<sigma> = AES_set_encrypt_key_0x6970_retval \<and> RBX \<sigma> = ((RSP\<^sub>0::64 word) - 0x38) \<and> RDX \<sigma> = (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x214) \<and> RDI \<sigma> = ((RSP\<^sub>0::64 word) - 0x38) \<and> RSI \<sigma> = 0x80 \<and> RBP \<sigma> = RSI\<^sub>0 \<and> R12 \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> FS \<sigma> = FS\<^sub>0 \<and> regs \<sigma> ymm0w1 = 0x0 \<and> regs \<sigma> ymm0w0 = 0x0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x118),4]::32 word) = ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x11c),4]::32 word)) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x11c),4]::32 word) = ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x11c),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((((RSP\<^sub>0::64 word) - 0x38)::64 word) + 0x8),8]::64 word) = 0x0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x38),8]::64 word) = 0x0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = 0x698e\<close>
declare Q_AES_set_decrypt_key_addr_0x6989_13_def[Qs]

schematic_goal qcow_set_key_1_0_1_0x6989_0x6989_13[blocks]:
  assumes \<open>(P_0x6989_13 && P_0x6989_13_regions) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x6989 13 \<sigma> \<triangleq> ?\<sigma> \<and> Q_AES_set_decrypt_key_addr_0x6989_13 ?\<sigma> \<and> block_usage P_0x6989_13_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x6989_13_def P_0x6989_13_regions_def post: Q_AES_set_decrypt_key_addr_0x6989_13_def regionset: P_0x6989_13_regions_set_def)

definition P_0x698e_14 :: state_pred where
  \<open>P_0x698e_14 \<sigma> \<equiv> RIP \<sigma> = 0x698e \<and> RAX \<sigma> = AES_set_decrypt_key_0x6989_retval \<and> RBX \<sigma> = ((RSP\<^sub>0::64 word) - 0x38) \<and> RDX \<sigma> = (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x214) \<and> RDI \<sigma> = ((RSP\<^sub>0::64 word) - 0x38) \<and> RSI \<sigma> = 0x80 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x38) \<and> RBP \<sigma> = RSI\<^sub>0 \<and> R12 \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> FS \<sigma> = FS\<^sub>0 \<and> regs \<sigma> ymm0w1 = 0x0 \<and> regs \<sigma> ymm0w0 = 0x0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x118),4]::32 word) = ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x11c),4]::32 word)) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x11c),4]::32 word) = ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x11c),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((((RSP\<^sub>0::64 word) - 0x38)::64 word) + 0x8),8]::64 word) = 0x0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x38),8]::64 word) = 0x0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = 0x698e\<close>
declare P_0x698e_14_def[Ps]

definition P_0x698e_14_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x698e_14_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((FS\<^sub>0::64 word) + 0x28), 8),
    (2, ((RDI\<^sub>0::64 word) + 0x40), 8),
    (3, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x118), 4),
    (4, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x11c), 4),
    (5, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x38), 8),
    (11, ((RSP\<^sub>0::64 word) - 0x40), 8)
  }\<close>

definition P_0x698e_14_regions :: state_pred where
  \<open>P_0x698e_14_regions \<sigma> \<equiv> \<exists>regions. P_0x698e_14_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x6998_14 :: state_pred where
  \<open>Q_0x6998_14 \<sigma> \<equiv> RIP \<sigma> = 0x6998 \<and> RBX \<sigma> = ((RSP\<^sub>0::64 word) - 0x38) \<and> RDI \<sigma> = ((RSP\<^sub>0::64 word) - 0x38) \<and> RSI \<sigma> = 0x80 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x38) \<and> RBP \<sigma> = RSI\<^sub>0 \<and> R12 \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> FS \<sigma> = FS\<^sub>0 \<and> regs \<sigma> ymm0w1 = 0x0 \<and> regs \<sigma> ymm0w0 = 0x0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x118),4]::32 word) = ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x11c),4]::32 word)) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x11c),4]::32 word) = ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x11c),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((((RSP\<^sub>0::64 word) - 0x38)::64 word) + 0x8),8]::64 word) = 0x0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x38),8]::64 word) = 0x0\<close>
declare Q_0x6998_14_def[Qs]

schematic_goal qcow_set_key_1_0_4_0x698e_0x6996_14[blocks]:
  assumes \<open>(P_0x698e_14 && P_0x698e_14_regions) \<sigma>\<close>
  shows \<open>exec_block 4 0x6996 14 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x6998_14 ?\<sigma> \<and> block_usage P_0x698e_14_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x698e_14_def P_0x698e_14_regions_def post: Q_0x6998_14_def regionset: P_0x698e_14_regions_set_def)

definition P_0x6998_15 :: state_pred where
  \<open>P_0x6998_15 \<sigma> \<equiv> RIP \<sigma> = 0x6998 \<and> RBX \<sigma> = ((RSP\<^sub>0::64 word) - 0x38) \<and> RDI \<sigma> = ((RSP\<^sub>0::64 word) - 0x38) \<and> RSI \<sigma> = 0x80 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x38) \<and> RBP \<sigma> = RSI\<^sub>0 \<and> R12 \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> FS \<sigma> = FS\<^sub>0 \<and> regs \<sigma> ymm0w1 = 0x0 \<and> regs \<sigma> ymm0w0 = 0x0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x118),4]::32 word) = ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x11c),4]::32 word)) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x11c),4]::32 word) = ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x11c),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((((RSP\<^sub>0::64 word) - 0x38)::64 word) + 0x8),8]::64 word) = 0x0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x38),8]::64 word) = 0x0\<close>
declare P_0x6998_15_def[Ps]

definition P_0x6998_15_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x6998_15_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((FS\<^sub>0::64 word) + 0x28), 8),
    (2, ((RDI\<^sub>0::64 word) + 0x40), 8),
    (3, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x118), 4),
    (4, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x11c), 4),
    (5, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x38), 8)
  }\<close>

definition P_0x6998_15_regions :: state_pred where
  \<open>P_0x6998_15_regions \<sigma> \<equiv> \<exists>regions. P_0x6998_15_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x69a6_15 :: state_pred where
  \<open>Q_0x69a6_15 \<sigma> \<equiv> RIP \<sigma> = 0x69a6 \<and> RBX \<sigma> = ((RSP\<^sub>0::64 word) - 0x38) \<and> RDI \<sigma> = ((RSP\<^sub>0::64 word) - 0x38) \<and> RSI \<sigma> = 0x0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x38) \<and> RBP \<sigma> = RSI\<^sub>0 \<and> R12 \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> FS \<sigma> = FS\<^sub>0 \<and> regs \<sigma> ymm0w1 = 0x0 \<and> regs \<sigma> ymm0w0 = 0x0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x118),4]::32 word) = ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x11c),4]::32 word)) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x11c),4]::32 word) = ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x11c),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((((RSP\<^sub>0::64 word) - 0x38)::64 word) + 0x8),8]::64 word) = 0x0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x38),8]::64 word) = 0x0\<close>
declare Q_0x69a6_15_def[Qs]

schematic_goal qcow_set_key_1_0_2_0x6998_0x699d_15[blocks]:
  assumes \<open>(P_0x6998_15 && P_0x6998_15_regions) \<sigma>\<close>
  shows \<open>exec_block 2 0x699d 15 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x69a6_15 ?\<sigma> \<and> block_usage P_0x6998_15_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x6998_15_def P_0x6998_15_regions_def post: Q_0x69a6_15_def regionset: P_0x6998_15_regions_set_def)

definition P_0x69a6_true_16 :: state_pred where
  \<open>P_0x69a6_true_16 \<sigma> \<equiv> RIP \<sigma> = 0x69a6 \<and> RBX \<sigma> = ((RSP\<^sub>0::64 word) - 0x38) \<and> RDI \<sigma> = ((RSP\<^sub>0::64 word) - 0x38) \<and> RSI \<sigma> = 0x0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x38) \<and> RBP \<sigma> = RSI\<^sub>0 \<and> R12 \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> FS \<sigma> = FS\<^sub>0 \<and> regs \<sigma> ymm0w1 = 0x0 \<and> regs \<sigma> ymm0w0 = 0x0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x118),4]::32 word) = ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x11c),4]::32 word)) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x11c),4]::32 word) = ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x11c),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((((RSP\<^sub>0::64 word) - 0x38)::64 word) + 0x8),8]::64 word) = 0x0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x38),8]::64 word) = 0x0\<close>
declare P_0x69a6_true_16_def[Ps]

definition P_0x69a6_true_16_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x69a6_true_16_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((FS\<^sub>0::64 word) + 0x28), 8),
    (2, ((RDI\<^sub>0::64 word) + 0x40), 8),
    (3, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x118), 4),
    (4, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x11c), 4),
    (5, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x38), 8)
  }\<close>

definition P_0x69a6_true_16_regions :: state_pred where
  \<open>P_0x69a6_true_16_regions \<sigma> \<equiv> \<exists>regions. P_0x69a6_true_16_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x69b8_16 :: state_pred where
  \<open>Q_0x69b8_16 \<sigma> \<equiv> RIP \<sigma> = 0x69b8 \<and> RBX \<sigma> = ((RSP\<^sub>0::64 word) - 0x38) \<and> RDI \<sigma> = ((RSP\<^sub>0::64 word) - 0x38) \<and> RSI \<sigma> = 0x0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x38) \<and> RBP \<sigma> = RSI\<^sub>0 \<and> R12 \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> FS \<sigma> = FS\<^sub>0 \<and> regs \<sigma> ymm0w1 = 0x0 \<and> regs \<sigma> ymm0w0 = 0x0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x118),4]::32 word) = ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x11c),4]::32 word)) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x11c),4]::32 word) = ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x11c),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((((RSP\<^sub>0::64 word) - 0x38)::64 word) + 0x8),8]::64 word) = 0x0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x38),8]::64 word) = 0x0\<close>
declare Q_0x69b8_16_def[Qs]

schematic_goal qcow_set_key_1_0_1_0x69a6_0x69a6_16[blocks]:
  assumes \<open>(P_0x69a6_true_16 && P_0x69a6_true_16_regions && !ZF) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x69a6 16 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x69b8_16 ?\<sigma> \<and> block_usage P_0x69a6_true_16_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x69a6_true_16_def P_0x69a6_true_16_regions_def post: Q_0x69b8_16_def regionset: P_0x69a6_true_16_regions_set_def)

definition P_0x69b8_17 :: state_pred where
  \<open>P_0x69b8_17 \<sigma> \<equiv> RIP \<sigma> = 0x69b8 \<and> RBX \<sigma> = ((RSP\<^sub>0::64 word) - 0x38) \<and> RDI \<sigma> = ((RSP\<^sub>0::64 word) - 0x38) \<and> RSI \<sigma> = 0x0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x38) \<and> RBP \<sigma> = RSI\<^sub>0 \<and> R12 \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> FS \<sigma> = FS\<^sub>0 \<and> regs \<sigma> ymm0w1 = 0x0 \<and> regs \<sigma> ymm0w0 = 0x0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x118),4]::32 word) = ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x11c),4]::32 word)) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x11c),4]::32 word) = ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x11c),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((((RSP\<^sub>0::64 word) - 0x38)::64 word) + 0x8),8]::64 word) = 0x0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x38),8]::64 word) = 0x0\<close>
declare P_0x69b8_17_def[Ps]

definition P_0x69b8_17_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x69b8_17_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((FS\<^sub>0::64 word) + 0x28), 8),
    (2, ((RDI\<^sub>0::64 word) + 0x40), 8),
    (3, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x118), 4),
    (4, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x11c), 4),
    (5, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x38), 8),
    (11, ((RSP\<^sub>0::64 word) - 0x40), 8)
  }\<close>

definition P_0x69b8_17_regions :: state_pred where
  \<open>P_0x69b8_17_regions \<sigma> \<equiv> \<exists>regions. P_0x69b8_17_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_stack_chk_fail_addr_0x69b8_17 :: state_pred where
  \<open>Q_stack_chk_fail_addr_0x69b8_17 \<sigma> \<equiv> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x40) \<and> RIP \<sigma> = stack_chk_fail_addr \<and> RDI \<sigma> = ((RSP\<^sub>0::64 word) - 0x38) \<and> RSI \<sigma> = 0x0 \<and> FS \<sigma> = FS\<^sub>0 \<and> regs \<sigma> ymm0w1 = 0x0 \<and> regs \<sigma> ymm0w0 = 0x0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x118),4]::32 word) = ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x11c),4]::32 word)) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x11c),4]::32 word) = ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x11c),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((((RSP\<^sub>0::64 word) - 0x38)::64 word) + 0x8),8]::64 word) = 0x0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x38),8]::64 word) = 0x0\<close>
declare Q_stack_chk_fail_addr_0x69b8_17_def[Qs]

schematic_goal qcow_set_key_1_0_1_0x69b8_0x69b8_17[blocks]:
  assumes \<open>(P_0x69b8_17 && P_0x69b8_17_regions) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x69b8 17 \<sigma> \<triangleq> ?\<sigma> \<and> Q_stack_chk_fail_addr_0x69b8_17 ?\<sigma> \<and> block_usage P_0x69b8_17_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x69b8_17_def P_0x69b8_17_regions_def post: Q_stack_chk_fail_addr_0x69b8_17_def regionset: P_0x69b8_17_regions_set_def)

definition P_0x69a6_false_18 :: state_pred where
  \<open>P_0x69a6_false_18 \<sigma> \<equiv> RIP \<sigma> = 0x69a6 \<and> RBX \<sigma> = ((RSP\<^sub>0::64 word) - 0x38) \<and> RDI \<sigma> = ((RSP\<^sub>0::64 word) - 0x38) \<and> RSI \<sigma> = 0x0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x38) \<and> RBP \<sigma> = RSI\<^sub>0 \<and> R12 \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> FS \<sigma> = FS\<^sub>0 \<and> regs \<sigma> ymm0w1 = 0x0 \<and> regs \<sigma> ymm0w0 = 0x0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x118),4]::32 word) = ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x11c),4]::32 word)) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x11c),4]::32 word) = ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x11c),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((((RSP\<^sub>0::64 word) - 0x38)::64 word) + 0x8),8]::64 word) = 0x0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x38),8]::64 word) = 0x0\<close>
declare P_0x69a6_false_18_def[Ps]

definition P_0x69a6_false_18_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x69a6_false_18_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((FS\<^sub>0::64 word) + 0x28), 8),
    (2, ((RDI\<^sub>0::64 word) + 0x40), 8),
    (3, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x118), 4),
    (4, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x11c), 4),
    (5, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x38), 8)
  }\<close>

definition P_0x69a6_false_18_regions :: state_pred where
  \<open>P_0x69a6_false_18_regions \<sigma> \<equiv> \<exists>regions. P_0x69a6_false_18_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_ret_address_18 :: state_pred where
  \<open>Q_ret_address_18 \<sigma> \<equiv> RIP \<sigma> = ret_address \<and> RDI \<sigma> = ((RSP\<^sub>0::64 word) - 0x38) \<and> RSI \<sigma> = 0x0 \<and> FS \<sigma> = FS\<^sub>0 \<and> regs \<sigma> ymm0w1 = 0x0 \<and> regs \<sigma> ymm0w0 = 0x0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x118),4]::32 word) = ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x11c),4]::32 word)) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x11c),4]::32 word) = ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x11c),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((((RSP\<^sub>0::64 word) - 0x38)::64 word) + 0x8),8]::64 word) = 0x0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x38),8]::64 word) = 0x0\<close>
declare Q_ret_address_18_def[Qs]

schematic_goal qcow_set_key_1_0_6_0x69a6_0x69b0_18[blocks]:
  assumes \<open>(P_0x69a6_false_18 && P_0x69a6_false_18_regions && ! !ZF) \<sigma>\<close>
  shows \<open>exec_block 6 0x69b0 18 \<sigma> \<triangleq> ?\<sigma> \<and> Q_ret_address_18 ?\<sigma> \<and> block_usage P_0x69a6_false_18_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x69a6_false_18_def P_0x69a6_false_18_regions_def post: Q_ret_address_18_def regionset: P_0x69a6_false_18_regions_set_def)

definition qcow_set_key_1_acode :: ACode where
  \<open>qcow_set_key_1_acode =
    Block 13 0x691a 0;
    Block (Suc 0) 0x691d (Suc 0);
    CALL strlen_acode;
    Block 4 0x692d 2;
    IF jle THEN
      Block (Suc 0) 0x692f 3
    ELSE
      Block 4 0x6936 4;
      WHILE P_0x6940_5 DO
        Block 4 0x694c 5;
        IF jg THEN
          Block (Suc 0) 0x694e 6
        ELSE
          Block (Suc 0) 0x694e 7
        FI
      OD
    FI;
    Block 5 0x6968 8;
    Block (Suc 0) 0x6970 9;
    CALL AES_set_encrypt_key_acode;
    Block (Suc 0) 0x6975 10;
    IF !ZF THEN
      Block 3 0x69b6 11
    ELSE
      Block 4 0x6986 12;
      Block (Suc 0) 0x6989 13;
      CALL AES_set_decrypt_key_acode;
      Block 4 0x6996 14
    FI;
    Block 2 0x699d 15;
    IF !ZF THEN
      Block (Suc 0) 0x69a6 16;
      Block (Suc 0) 0x69b8 17;
      CALL stack_chk_fail_acode
    ELSE
      Block 6 0x69b0 18
    FI
  \<close>

schematic_goal "qcow_set_key_1":
  assumes
    \<open>\<forall>\<sigma>. RIP \<sigma> = 0x691d \<longrightarrow> P_0x691d_1_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x6922 \<longrightarrow> P_0x6922_2_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x692f \<longrightarrow> P_0x692f_true_3_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x692f \<longrightarrow> P_0x692f_false_4_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x6940 \<longrightarrow> P_0x6940_5_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x694e \<longrightarrow> P_0x694e_true_6_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x694e \<longrightarrow> P_0x694e_false_7_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x6950 \<longrightarrow> P_0x6950_8_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x6970 \<longrightarrow> P_0x6970_9_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x6975 \<longrightarrow> P_0x6975_10_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x6977 \<longrightarrow> P_0x6977_true_11_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x6977 \<longrightarrow> P_0x6977_false_12_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x6989 \<longrightarrow> P_0x6989_13_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x698e \<longrightarrow> P_0x698e_14_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x6998 \<longrightarrow> P_0x6998_15_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x69a6 \<longrightarrow> P_0x69a6_true_16_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x69b8 \<longrightarrow> P_0x69b8_17_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x69a6 \<longrightarrow> P_0x69a6_false_18_regions \<sigma>\<close>
    and [blocks]: \<open>{{Q_strlen_addr_0x691d_1}} \<box>strlen_acode {{P_0x6922_2;M_0x691d}}\<close>
    and [blocks]: \<open>{{Q_AES_set_encrypt_key_addr_0x6970_9}} \<box>AES_set_encrypt_key_acode {{P_0x6975_10;M_0x6970}}\<close>
    and [blocks]: \<open>{{Q_AES_set_decrypt_key_addr_0x6989_13}} \<box>AES_set_decrypt_key_acode {{P_0x698e_14;M_0x6989}}\<close>
    and [blocks]: \<open>{{Q_stack_chk_fail_addr_0x69b8_17}} \<box>stack_chk_fail_acode {{Q_fail;M_0x69b8}}\<close>
  shows \<open>{{?P}} qcow_set_key_1_acode {{?Q;?M}}\<close>
  apply (vcg acode: qcow_set_key_1_acode_def assms: assms)
  apply (vcg_while "P_0x6940_5 || P_0x6950_8")
  apply (vcg_step assms: assms)+
  apply (auto simp add: assms Ps Qs pred_logic)[1]
  apply auto
  apply (vcg_step assms: assms)+
  apply (auto simp add: assms Ps Qs pred_logic)[1]
  apply (auto simp add: assms Ps Qs pred_logic)[1]
  apply auto
  apply (vcg_step assms: assms)+
  done
end

locale "qcow_set_key" = "qemu_img_xen" +
  fixes RAX\<^sub>0\<^sub>v RBX\<^sub>0\<^sub>v RCX\<^sub>0\<^sub>v RDX\<^sub>0\<^sub>v RDI\<^sub>0\<^sub>v RSI\<^sub>0\<^sub>v RSP\<^sub>0\<^sub>v RBP\<^sub>0\<^sub>v R12\<^sub>0\<^sub>v FS\<^sub>0\<^sub>v ymm0w0\<^sub>0\<^sub>v ymm0w1\<^sub>0\<^sub>v ret_address\<^sub>v :: \<open>64 word\<close>
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
definition \<open>R12\<^sub>0 \<equiv> R12\<^sub>0\<^sub>v\<close>
definition \<open>FS\<^sub>0 \<equiv> FS\<^sub>0\<^sub>v\<close>
definition \<open>ymm0w0\<^sub>0 \<equiv> ymm0w0\<^sub>0\<^sub>v\<close>
definition \<open>ymm0w1\<^sub>0 \<equiv> ymm0w1\<^sub>0\<^sub>v\<close>
definition \<open>ret_address \<equiv> ret_address\<^sub>v\<close>

definition P_0x12fb0_0 :: state_pred where
  \<open>P_0x12fb0_0 \<sigma> \<equiv> RIP \<sigma> = 0x12fb0 \<and> RAX \<sigma> = RAX\<^sub>0 \<and> RBX \<sigma> = RBX\<^sub>0 \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = RDX\<^sub>0 \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = RSP\<^sub>0 \<and> RBP \<sigma> = RBP\<^sub>0 \<and> R12 \<sigma> = R12\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> regs \<sigma> ymm0w1 = ymm0w1\<^sub>0 \<and> regs \<sigma> ymm0w0 = ymm0w0\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address\<close>
declare P_0x12fb0_0_def[Ps]

definition P_0x12fb0_0_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x12fb0_0_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((FS\<^sub>0::64 word) + 0x28), 8),
    (2, ((RDI\<^sub>0::64 word) + 0x40), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x38), 8)
  }\<close>

definition P_0x12fb0_0_regions :: state_pred where
  \<open>P_0x12fb0_0_regions \<sigma> \<equiv> \<exists>regions. P_0x12fb0_0_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x12fdd_0 :: state_pred where
  \<open>Q_0x12fdd_0 \<sigma> \<equiv> RIP \<sigma> = 0x12fdd \<and> RAX \<sigma> = 0x0 \<and> RBX \<sigma> = ((RSP\<^sub>0::64 word) - 0x38) \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = RDX\<^sub>0 \<and> RDI \<sigma> = RSI\<^sub>0 \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x38) \<and> RBP \<sigma> = RSI\<^sub>0 \<and> R12 \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> FS \<sigma> = FS\<^sub>0 \<and> regs \<sigma> ymm0w1 = 0x0 \<and> regs \<sigma> ymm0w0 = 0x0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((((RSP\<^sub>0::64 word) - 0x38)::64 word) + 0x8),8]::64 word) = 0x0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x38),8]::64 word) = 0x0\<close>
declare Q_0x12fdd_0_def[Qs]

schematic_goal qcow_set_key_0_13_0x12fb0_0x12fda_0[blocks]:
  assumes \<open>(P_0x12fb0_0 && P_0x12fb0_0_regions) \<sigma>\<close>
  shows \<open>exec_block 13 0x12fda 0 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x12fdd_0 ?\<sigma> \<and> block_usage P_0x12fb0_0_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x12fb0_0_def P_0x12fb0_0_regions_def post: Q_0x12fdd_0_def regionset: P_0x12fb0_0_regions_set_def)

definition P_0x12fdd_1 :: state_pred where
  \<open>P_0x12fdd_1 \<sigma> \<equiv> RIP \<sigma> = 0x12fdd \<and> RAX \<sigma> = 0x0 \<and> RBX \<sigma> = ((RSP\<^sub>0::64 word) - 0x38) \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = RDX\<^sub>0 \<and> RDI \<sigma> = RSI\<^sub>0 \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x38) \<and> RBP \<sigma> = RSI\<^sub>0 \<and> R12 \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> FS \<sigma> = FS\<^sub>0 \<and> regs \<sigma> ymm0w1 = 0x0 \<and> regs \<sigma> ymm0w0 = 0x0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((((RSP\<^sub>0::64 word) - 0x38)::64 word) + 0x8),8]::64 word) = 0x0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x38),8]::64 word) = 0x0\<close>
declare P_0x12fdd_1_def[Ps]

definition P_0x12fdd_1_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x12fdd_1_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((FS\<^sub>0::64 word) + 0x28), 8),
    (2, ((RDI\<^sub>0::64 word) + 0x40), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x38), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x40), 8)
  }\<close>

definition P_0x12fdd_1_regions :: state_pred where
  \<open>P_0x12fdd_1_regions \<sigma> \<equiv> \<exists>regions. P_0x12fdd_1_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_strlen_addr_0x12fdd_1 :: state_pred where
  \<open>Q_strlen_addr_0x12fdd_1 \<sigma> \<equiv> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x40) \<and> RIP \<sigma> = strlen_addr \<and> RAX \<sigma> = 0x0 \<and> RBX \<sigma> = ((RSP\<^sub>0::64 word) - 0x38) \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = RDX\<^sub>0 \<and> RDI \<sigma> = RSI\<^sub>0 \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RBP \<sigma> = RSI\<^sub>0 \<and> R12 \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> FS \<sigma> = FS\<^sub>0 \<and> regs \<sigma> ymm0w1 = 0x0 \<and> regs \<sigma> ymm0w0 = 0x0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((((RSP\<^sub>0::64 word) - 0x38)::64 word) + 0x8),8]::64 word) = 0x0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x38),8]::64 word) = 0x0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = 0x12fe2\<close>
declare Q_strlen_addr_0x12fdd_1_def[Qs]

schematic_goal qcow_set_key_0_1_0x12fdd_0x12fdd_1[blocks]:
  assumes \<open>(P_0x12fdd_1 && P_0x12fdd_1_regions) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x12fdd (Suc 0) \<sigma> \<triangleq> ?\<sigma> \<and> Q_strlen_addr_0x12fdd_1 ?\<sigma> \<and> block_usage P_0x12fdd_1_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x12fdd_1_def P_0x12fdd_1_regions_def post: Q_strlen_addr_0x12fdd_1_def regionset: P_0x12fdd_1_regions_set_def)

definition P_0x12fe2_2 :: state_pred where
  \<open>P_0x12fe2_2 \<sigma> \<equiv> RIP \<sigma> = 0x12fe2 \<and> RAX \<sigma> = strlen_0x12fdd_retval \<and> RBX \<sigma> = ((RSP\<^sub>0::64 word) - 0x38) \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = RDX\<^sub>0 \<and> RDI \<sigma> = RSI\<^sub>0 \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x38) \<and> RBP \<sigma> = RSI\<^sub>0 \<and> R12 \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> FS \<sigma> = FS\<^sub>0 \<and> regs \<sigma> ymm0w1 = 0x0 \<and> regs \<sigma> ymm0w0 = 0x0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((((RSP\<^sub>0::64 word) - 0x38)::64 word) + 0x8),8]::64 word) = 0x0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x38),8]::64 word) = 0x0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = 0x12fe2\<close>
declare P_0x12fe2_2_def[Ps]

definition P_0x12fe2_2_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x12fe2_2_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((FS\<^sub>0::64 word) + 0x28), 8),
    (2, ((RDI\<^sub>0::64 word) + 0x40), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x38), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x40), 8)
  }\<close>

definition P_0x12fe2_2_regions :: state_pred where
  \<open>P_0x12fe2_2_regions \<sigma> \<equiv> \<exists>regions. P_0x12fe2_2_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x12fef_2 :: state_pred where
  \<open>Q_0x12fef_2 \<sigma> \<equiv> RIP \<sigma> = 0x12fef \<and> RAX \<sigma> = strlen_0x12fdd_retval \<and> RBX \<sigma> = ((RSP\<^sub>0::64 word) - 0x38) \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = RDX\<^sub>0 \<and> RDI \<sigma> = ucast ((if' ((\<langle>31,0\<rangle>strlen_0x12fdd_retval::32 word)::32 word) \<le>s 0x10 then (\<langle>31,0\<rangle>strlen_0x12fdd_retval::32 word) else (0x10::32 word))) \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x38) \<and> RBP \<sigma> = RSI\<^sub>0 \<and> R12 \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> FS \<sigma> = FS\<^sub>0 \<and> regs \<sigma> ymm0w1 = 0x0 \<and> regs \<sigma> ymm0w0 = 0x0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((((RSP\<^sub>0::64 word) - 0x38)::64 word) + 0x8),8]::64 word) = 0x0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x38),8]::64 word) = 0x0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = 0x12fe2\<close>
declare Q_0x12fef_2_def[Qs]

schematic_goal qcow_set_key_0_4_0x12fe2_0x12fed_2[blocks]:
  assumes \<open>(P_0x12fe2_2 && P_0x12fe2_2_regions) \<sigma>\<close>
  shows \<open>exec_block 4 0x12fed 2 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x12fef_2 ?\<sigma> \<and> block_usage P_0x12fe2_2_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x12fe2_2_def P_0x12fe2_2_regions_def post: Q_0x12fef_2_def regionset: P_0x12fe2_2_regions_set_def)

definition P_0x12fef_true_3 :: state_pred where
  \<open>P_0x12fef_true_3 \<sigma> \<equiv> RIP \<sigma> = 0x12fef \<and> RAX \<sigma> = strlen_0x12fdd_retval \<and> RBX \<sigma> = ((RSP\<^sub>0::64 word) - 0x38) \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = RDX\<^sub>0 \<and> RDI \<sigma> = ucast ((if' ((\<langle>31,0\<rangle>strlen_0x12fdd_retval::32 word)::32 word) \<le>s 0x10 then (\<langle>31,0\<rangle>strlen_0x12fdd_retval::32 word) else (0x10::32 word))) \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x38) \<and> RBP \<sigma> = RSI\<^sub>0 \<and> R12 \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> FS \<sigma> = FS\<^sub>0 \<and> regs \<sigma> ymm0w1 = 0x0 \<and> regs \<sigma> ymm0w0 = 0x0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((((RSP\<^sub>0::64 word) - 0x38)::64 word) + 0x8),8]::64 word) = 0x0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x38),8]::64 word) = 0x0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = 0x12fe2\<close>
declare P_0x12fef_true_3_def[Ps]

definition P_0x12fef_true_3_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x12fef_true_3_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((FS\<^sub>0::64 word) + 0x28), 8),
    (2, ((RDI\<^sub>0::64 word) + 0x40), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x38), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x40), 8)
  }\<close>

definition P_0x12fef_true_3_regions :: state_pred where
  \<open>P_0x12fef_true_3_regions \<sigma> \<equiv> \<exists>regions. P_0x12fef_true_3_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x13010_3 :: state_pred where
  \<open>Q_0x13010_3 \<sigma> \<equiv> RIP \<sigma> = 0x13010 \<and> RBX \<sigma> = ((RSP\<^sub>0::64 word) - 0x38) \<and> RDX \<sigma> = RDX\<^sub>0 \<and> RDI \<sigma> = ucast ((if' ((\<langle>31,0\<rangle>strlen_0x12fdd_retval::32 word)::32 word) \<le>s 0x10 then (\<langle>31,0\<rangle>strlen_0x12fdd_retval::32 word) else (0x10::32 word))) \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x38) \<and> RBP \<sigma> = RSI\<^sub>0 \<and> R12 \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> FS \<sigma> = FS\<^sub>0 \<and> regs \<sigma> ymm0w1 = 0x0 \<and> regs \<sigma> ymm0w0 = 0x0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((((RSP\<^sub>0::64 word) - 0x38)::64 word) + 0x8),8]::64 word) = 0x0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x38),8]::64 word) = 0x0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = 0x12fe2\<close>
declare Q_0x13010_3_def[Qs]

schematic_goal qcow_set_key_0_1_0x12fef_0x12fef_3[blocks]:
  assumes \<open>(P_0x12fef_true_3 && P_0x12fef_true_3_regions && jle) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x12fef 3 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x13010_3 ?\<sigma> \<and> block_usage P_0x12fef_true_3_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x12fef_true_3_def P_0x12fef_true_3_regions_def post: Q_0x13010_3_def regionset: P_0x12fef_true_3_regions_set_def)

definition P_0x12fef_false_4 :: state_pred where
  \<open>P_0x12fef_false_4 \<sigma> \<equiv> RIP \<sigma> = 0x12fef \<and> RAX \<sigma> = strlen_0x12fdd_retval \<and> RBX \<sigma> = ((RSP\<^sub>0::64 word) - 0x38) \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = RDX\<^sub>0 \<and> RDI \<sigma> = ucast ((if' ((\<langle>31,0\<rangle>strlen_0x12fdd_retval::32 word)::32 word) \<le>s 0x10 then (\<langle>31,0\<rangle>strlen_0x12fdd_retval::32 word) else (0x10::32 word))) \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x38) \<and> RBP \<sigma> = RSI\<^sub>0 \<and> R12 \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> FS \<sigma> = FS\<^sub>0 \<and> regs \<sigma> ymm0w1 = 0x0 \<and> regs \<sigma> ymm0w0 = 0x0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((((RSP\<^sub>0::64 word) - 0x38)::64 word) + 0x8),8]::64 word) = 0x0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x38),8]::64 word) = 0x0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = 0x12fe2\<close>
declare P_0x12fef_false_4_def[Ps]

definition P_0x12fef_false_4_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x12fef_false_4_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((FS\<^sub>0::64 word) + 0x28), 8),
    (2, ((RDI\<^sub>0::64 word) + 0x40), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x38), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x40), 8)
  }\<close>

definition P_0x12fef_false_4_regions :: state_pred where
  \<open>P_0x12fef_false_4_regions \<sigma> \<equiv> \<exists>regions. P_0x12fef_false_4_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x13000_4 :: state_pred where
  \<open>Q_0x13000_4 \<sigma> \<equiv> RIP \<sigma> = 0x13000 \<and> RBX \<sigma> = ((RSP\<^sub>0::64 word) - 0x38) \<and> RDX \<sigma> = RDX\<^sub>0 \<and> RDI \<sigma> = ucast ((if' ((\<langle>31,0\<rangle>strlen_0x12fdd_retval::32 word)::32 word) \<le>s 0x10 then (\<langle>31,0\<rangle>strlen_0x12fdd_retval::32 word) else (0x10::32 word))) \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x38) \<and> RBP \<sigma> = RSI\<^sub>0 \<and> R12 \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> FS \<sigma> = FS\<^sub>0 \<and> regs \<sigma> ymm0w1 = 0x0 \<and> regs \<sigma> ymm0w0 = 0x0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((((RSP\<^sub>0::64 word) - 0x38)::64 word) + 0x8),8]::64 word) = 0x0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x38),8]::64 word) = 0x0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = 0x12fe2\<close>
declare Q_0x13000_4_def[Qs]

schematic_goal qcow_set_key_0_4_0x12fef_0x12ff6_4[blocks]:
  assumes \<open>(P_0x12fef_false_4 && P_0x12fef_false_4_regions && ! jle) \<sigma>\<close>
  shows \<open>exec_block 4 0x12ff6 4 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x13000_4 ?\<sigma> \<and> block_usage P_0x12fef_false_4_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x12fef_false_4_def P_0x12fef_false_4_regions_def post: Q_0x13000_4_def regionset: P_0x12fef_false_4_regions_set_def)

definition P_0x13000_5 :: state_pred where
  \<open>P_0x13000_5 \<sigma> \<equiv> RIP \<sigma> = 0x13000 \<and> RBX \<sigma> = ((RSP\<^sub>0::64 word) - 0x38) \<and> RDX \<sigma> = RDX\<^sub>0 \<and> RDI \<sigma> = ucast ((if' ((\<langle>31,0\<rangle>strlen_0x12fdd_retval::32 word)::32 word) \<le>s 0x10 then (\<langle>31,0\<rangle>strlen_0x12fdd_retval::32 word) else (0x10::32 word))) \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x38) \<and> RBP \<sigma> = RSI\<^sub>0 \<and> R12 \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> FS \<sigma> = FS\<^sub>0 \<and> regs \<sigma> ymm0w1 = 0x0 \<and> regs \<sigma> ymm0w0 = 0x0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((((RSP\<^sub>0::64 word) - 0x38)::64 word) + 0x8),8]::64 word) = 0x0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x38),8]::64 word) = 0x0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = 0x12fe2\<close>
declare P_0x13000_5_def[Ps]

definition P_0x13000_5_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x13000_5_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((FS\<^sub>0::64 word) + 0x28), 8),
    (2, ((RDI\<^sub>0::64 word) + 0x40), 8),
    (3, ((RSI\<^sub>0::64 word) + (\<langle>63,0\<rangle>((RAX \<sigma>::64 word) * 0x1)::64 word)), Suc 0),
    (4, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x38), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x40), 8),
    (11, ((((RSP\<^sub>0::64 word) + (\<langle>63,0\<rangle>((RAX \<sigma>::64 word) * 0x1)::64 word))::64 word) - 0x38), Suc 0)
  }\<close>

definition P_0x13000_5_regions :: state_pred where
  \<open>P_0x13000_5_regions \<sigma> \<equiv> \<exists>regions. P_0x13000_5_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x1300e_5 :: state_pred where
  \<open>Q_0x1300e_5 \<sigma> \<equiv> RIP \<sigma> = 0x1300e \<and> RBX \<sigma> = ((RSP\<^sub>0::64 word) - 0x38) \<and> RDX \<sigma> = RDX\<^sub>0 \<and> RDI \<sigma> = ucast ((if' ((\<langle>31,0\<rangle>strlen_0x12fdd_retval::32 word)::32 word) \<le>s 0x10 then (\<langle>31,0\<rangle>strlen_0x12fdd_retval::32 word) else (0x10::32 word))) \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x38) \<and> RBP \<sigma> = RSI\<^sub>0 \<and> R12 \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> FS \<sigma> = FS\<^sub>0 \<and> regs \<sigma> ymm0w1 = 0x0 \<and> regs \<sigma> ymm0w0 = 0x0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((((RSP\<^sub>0::64 word) - 0x38)::64 word) + 0x8),8]::64 word) = 0x0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x38),8]::64 word) = 0x0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = 0x12fe2\<close>
declare Q_0x1300e_5_def[Qs]

schematic_goal qcow_set_key_0_4_0x13000_0x1300c_5[blocks]:
  assumes \<open>(P_0x13000_5 && P_0x13000_5_regions) \<sigma>\<close>
  shows \<open>exec_block 4 0x1300c 5 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x1300e_5 ?\<sigma> \<and> block_usage P_0x13000_5_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x13000_5_def P_0x13000_5_regions_def post: Q_0x1300e_5_def regionset: P_0x13000_5_regions_set_def)

definition P_0x1300e_true_6 :: state_pred where
  \<open>P_0x1300e_true_6 \<sigma> \<equiv> RIP \<sigma> = 0x1300e \<and> RBX \<sigma> = ((RSP\<^sub>0::64 word) - 0x38) \<and> RDX \<sigma> = RDX\<^sub>0 \<and> RDI \<sigma> = ucast ((if' ((\<langle>31,0\<rangle>strlen_0x12fdd_retval::32 word)::32 word) \<le>s 0x10 then (\<langle>31,0\<rangle>strlen_0x12fdd_retval::32 word) else (0x10::32 word))) \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x38) \<and> RBP \<sigma> = RSI\<^sub>0 \<and> R12 \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> FS \<sigma> = FS\<^sub>0 \<and> regs \<sigma> ymm0w1 = 0x0 \<and> regs \<sigma> ymm0w0 = 0x0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((((RSP\<^sub>0::64 word) - 0x38)::64 word) + 0x8),8]::64 word) = 0x0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x38),8]::64 word) = 0x0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = 0x12fe2\<close>
declare P_0x1300e_true_6_def[Ps]

definition P_0x1300e_true_6_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x1300e_true_6_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((FS\<^sub>0::64 word) + 0x28), 8),
    (2, ((RDI\<^sub>0::64 word) + 0x40), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x38), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x40), 8)
  }\<close>

definition P_0x1300e_true_6_regions :: state_pred where
  \<open>P_0x1300e_true_6_regions \<sigma> \<equiv> \<exists>regions. P_0x1300e_true_6_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x13000_6 :: state_pred where
  \<open>Q_0x13000_6 \<sigma> \<equiv> RIP \<sigma> = 0x13000 \<and> RBX \<sigma> = ((RSP\<^sub>0::64 word) - 0x38) \<and> RDX \<sigma> = RDX\<^sub>0 \<and> RDI \<sigma> = ucast ((if' ((\<langle>31,0\<rangle>strlen_0x12fdd_retval::32 word)::32 word) \<le>s 0x10 then (\<langle>31,0\<rangle>strlen_0x12fdd_retval::32 word) else (0x10::32 word))) \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x38) \<and> RBP \<sigma> = RSI\<^sub>0 \<and> R12 \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> FS \<sigma> = FS\<^sub>0 \<and> regs \<sigma> ymm0w1 = 0x0 \<and> regs \<sigma> ymm0w0 = 0x0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((((RSP\<^sub>0::64 word) - 0x38)::64 word) + 0x8),8]::64 word) = 0x0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x38),8]::64 word) = 0x0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = 0x12fe2\<close>
declare Q_0x13000_6_def[Qs]

schematic_goal qcow_set_key_0_1_0x1300e_0x1300e_6[blocks]:
  assumes \<open>(P_0x1300e_true_6 && P_0x1300e_true_6_regions && jg) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x1300e 6 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x13000_6 ?\<sigma> \<and> block_usage P_0x1300e_true_6_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x1300e_true_6_def P_0x1300e_true_6_regions_def post: Q_0x13000_6_def regionset: P_0x1300e_true_6_regions_set_def)

definition P_0x1300e_false_7 :: state_pred where
  \<open>P_0x1300e_false_7 \<sigma> \<equiv> RIP \<sigma> = 0x1300e \<and> RBX \<sigma> = ((RSP\<^sub>0::64 word) - 0x38) \<and> RDX \<sigma> = RDX\<^sub>0 \<and> RDI \<sigma> = ucast ((if' ((\<langle>31,0\<rangle>strlen_0x12fdd_retval::32 word)::32 word) \<le>s 0x10 then (\<langle>31,0\<rangle>strlen_0x12fdd_retval::32 word) else (0x10::32 word))) \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x38) \<and> RBP \<sigma> = RSI\<^sub>0 \<and> R12 \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> FS \<sigma> = FS\<^sub>0 \<and> regs \<sigma> ymm0w1 = 0x0 \<and> regs \<sigma> ymm0w0 = 0x0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((((RSP\<^sub>0::64 word) - 0x38)::64 word) + 0x8),8]::64 word) = 0x0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x38),8]::64 word) = 0x0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = 0x12fe2\<close>
declare P_0x1300e_false_7_def[Ps]

definition P_0x1300e_false_7_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x1300e_false_7_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((FS\<^sub>0::64 word) + 0x28), 8),
    (2, ((RDI\<^sub>0::64 word) + 0x40), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x38), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x40), 8)
  }\<close>

definition P_0x1300e_false_7_regions :: state_pred where
  \<open>P_0x1300e_false_7_regions \<sigma> \<equiv> \<exists>regions. P_0x1300e_false_7_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x13010_7 :: state_pred where
  \<open>Q_0x13010_7 \<sigma> \<equiv> RIP \<sigma> = 0x13010 \<and> RBX \<sigma> = ((RSP\<^sub>0::64 word) - 0x38) \<and> RDX \<sigma> = RDX\<^sub>0 \<and> RDI \<sigma> = ucast ((if' ((\<langle>31,0\<rangle>strlen_0x12fdd_retval::32 word)::32 word) \<le>s 0x10 then (\<langle>31,0\<rangle>strlen_0x12fdd_retval::32 word) else (0x10::32 word))) \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x38) \<and> RBP \<sigma> = RSI\<^sub>0 \<and> R12 \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> FS \<sigma> = FS\<^sub>0 \<and> regs \<sigma> ymm0w1 = 0x0 \<and> regs \<sigma> ymm0w0 = 0x0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((((RSP\<^sub>0::64 word) - 0x38)::64 word) + 0x8),8]::64 word) = 0x0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x38),8]::64 word) = 0x0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = 0x12fe2\<close>
declare Q_0x13010_7_def[Qs]

schematic_goal qcow_set_key_0_1_0x1300e_0x1300e_7[blocks]:
  assumes \<open>(P_0x1300e_false_7 && P_0x1300e_false_7_regions && ! jg) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x1300e 7 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x13010_7 ?\<sigma> \<and> block_usage P_0x1300e_false_7_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x1300e_false_7_def P_0x1300e_false_7_regions_def post: Q_0x13010_7_def regionset: P_0x1300e_false_7_regions_set_def)

definition P_0x13010_8 :: state_pred where
  \<open>P_0x13010_8 \<sigma> \<equiv> RIP \<sigma> = 0x13010 \<and> RBX \<sigma> = ((RSP\<^sub>0::64 word) - 0x38) \<and> RDX \<sigma> = RDX\<^sub>0 \<and> RDI \<sigma> = ucast ((if' ((\<langle>31,0\<rangle>strlen_0x12fdd_retval::32 word)::32 word) \<le>s 0x10 then (\<langle>31,0\<rangle>strlen_0x12fdd_retval::32 word) else (0x10::32 word))) \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x38) \<and> RBP \<sigma> = RSI\<^sub>0 \<and> R12 \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> FS \<sigma> = FS\<^sub>0 \<and> regs \<sigma> ymm0w1 = 0x0 \<and> regs \<sigma> ymm0w0 = 0x0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((((RSP\<^sub>0::64 word) - 0x38)::64 word) + 0x8),8]::64 word) = 0x0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x38),8]::64 word) = 0x0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = 0x12fe2\<close>
declare P_0x13010_8_def[Ps]

definition P_0x13010_8_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x13010_8_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((FS\<^sub>0::64 word) + 0x28), 8),
    (2, ((RDI\<^sub>0::64 word) + 0x40), 8),
    (3, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x160), 4),
    (4, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x164), 4),
    (5, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x38), 8),
    (11, ((RSP\<^sub>0::64 word) - 0x40), 8)
  }\<close>

definition P_0x13010_8_regions :: state_pred where
  \<open>P_0x13010_8_regions \<sigma> \<equiv> \<exists>regions. P_0x13010_8_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x13030_8 :: state_pred where
  \<open>Q_0x13030_8 \<sigma> \<equiv> RIP \<sigma> = 0x13030 \<and> RAX \<sigma> = ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x164),4]::32 word)) \<and> RBX \<sigma> = ((RSP\<^sub>0::64 word) - 0x38) \<and> RDX \<sigma> = (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x168) \<and> RDI \<sigma> = ((RSP\<^sub>0::64 word) - 0x38) \<and> RSI \<sigma> = 0x80 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x38) \<and> RBP \<sigma> = RSI\<^sub>0 \<and> R12 \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> FS \<sigma> = FS\<^sub>0 \<and> regs \<sigma> ymm0w1 = 0x0 \<and> regs \<sigma> ymm0w0 = 0x0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x160),4]::32 word) = ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x164),4]::32 word)) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x164),4]::32 word) = ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x164),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((((RSP\<^sub>0::64 word) - 0x38)::64 word) + 0x8),8]::64 word) = 0x0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x38),8]::64 word) = 0x0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = 0x12fe2\<close>
declare Q_0x13030_8_def[Qs]

schematic_goal qcow_set_key_0_5_0x13010_0x13028_8[blocks]:
  assumes \<open>(P_0x13010_8 && P_0x13010_8_regions) \<sigma>\<close>
  shows \<open>exec_block 5 0x13028 8 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x13030_8 ?\<sigma> \<and> block_usage P_0x13010_8_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x13010_8_def P_0x13010_8_regions_def post: Q_0x13030_8_def regionset: P_0x13010_8_regions_set_def)

definition P_0x13030_9 :: state_pred where
  \<open>P_0x13030_9 \<sigma> \<equiv> RIP \<sigma> = 0x13030 \<and> RAX \<sigma> = ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x164),4]::32 word)) \<and> RBX \<sigma> = ((RSP\<^sub>0::64 word) - 0x38) \<and> RDX \<sigma> = (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x168) \<and> RDI \<sigma> = ((RSP\<^sub>0::64 word) - 0x38) \<and> RSI \<sigma> = 0x80 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x38) \<and> RBP \<sigma> = RSI\<^sub>0 \<and> R12 \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> FS \<sigma> = FS\<^sub>0 \<and> regs \<sigma> ymm0w1 = 0x0 \<and> regs \<sigma> ymm0w0 = 0x0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x160),4]::32 word) = ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x164),4]::32 word)) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x164),4]::32 word) = ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x164),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((((RSP\<^sub>0::64 word) - 0x38)::64 word) + 0x8),8]::64 word) = 0x0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x38),8]::64 word) = 0x0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = 0x12fe2\<close>
declare P_0x13030_9_def[Ps]

definition P_0x13030_9_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x13030_9_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((FS\<^sub>0::64 word) + 0x28), 8),
    (2, ((RDI\<^sub>0::64 word) + 0x40), 8),
    (3, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x160), 4),
    (4, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x164), 4),
    (5, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x38), 8),
    (11, ((RSP\<^sub>0::64 word) - 0x40), 8)
  }\<close>

definition P_0x13030_9_regions :: state_pred where
  \<open>P_0x13030_9_regions \<sigma> \<equiv> \<exists>regions. P_0x13030_9_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_AES_set_encrypt_key_addr_0x13030_9 :: state_pred where
  \<open>Q_AES_set_encrypt_key_addr_0x13030_9 \<sigma> \<equiv> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x40) \<and> RIP \<sigma> = AES_set_encrypt_key_addr \<and> RAX \<sigma> = ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x164),4]::32 word)) \<and> RBX \<sigma> = ((RSP\<^sub>0::64 word) - 0x38) \<and> RDX \<sigma> = (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x168) \<and> RDI \<sigma> = ((RSP\<^sub>0::64 word) - 0x38) \<and> RSI \<sigma> = 0x80 \<and> RBP \<sigma> = RSI\<^sub>0 \<and> R12 \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> FS \<sigma> = FS\<^sub>0 \<and> regs \<sigma> ymm0w1 = 0x0 \<and> regs \<sigma> ymm0w0 = 0x0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x160),4]::32 word) = ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x164),4]::32 word)) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x164),4]::32 word) = ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x164),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((((RSP\<^sub>0::64 word) - 0x38)::64 word) + 0x8),8]::64 word) = 0x0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x38),8]::64 word) = 0x0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = 0x13035\<close>
declare Q_AES_set_encrypt_key_addr_0x13030_9_def[Qs]

schematic_goal qcow_set_key_0_1_0x13030_0x13030_9[blocks]:
  assumes \<open>(P_0x13030_9 && P_0x13030_9_regions) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x13030 9 \<sigma> \<triangleq> ?\<sigma> \<and> Q_AES_set_encrypt_key_addr_0x13030_9 ?\<sigma> \<and> block_usage P_0x13030_9_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x13030_9_def P_0x13030_9_regions_def post: Q_AES_set_encrypt_key_addr_0x13030_9_def regionset: P_0x13030_9_regions_set_def)

definition P_0x13035_10 :: state_pred where
  \<open>P_0x13035_10 \<sigma> \<equiv> RIP \<sigma> = 0x13035 \<and> RAX \<sigma> = AES_set_encrypt_key_0x13030_retval \<and> RBX \<sigma> = ((RSP\<^sub>0::64 word) - 0x38) \<and> RDX \<sigma> = (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x168) \<and> RDI \<sigma> = ((RSP\<^sub>0::64 word) - 0x38) \<and> RSI \<sigma> = 0x80 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x38) \<and> RBP \<sigma> = RSI\<^sub>0 \<and> R12 \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> FS \<sigma> = FS\<^sub>0 \<and> regs \<sigma> ymm0w1 = 0x0 \<and> regs \<sigma> ymm0w0 = 0x0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x160),4]::32 word) = ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x164),4]::32 word)) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x164),4]::32 word) = ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x164),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((((RSP\<^sub>0::64 word) - 0x38)::64 word) + 0x8),8]::64 word) = 0x0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x38),8]::64 word) = 0x0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = 0x13035\<close>
declare P_0x13035_10_def[Ps]

definition P_0x13035_10_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x13035_10_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((FS\<^sub>0::64 word) + 0x28), 8),
    (2, ((RDI\<^sub>0::64 word) + 0x40), 8),
    (3, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x160), 4),
    (4, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x164), 4),
    (5, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x38), 8),
    (11, ((RSP\<^sub>0::64 word) - 0x40), 8)
  }\<close>

definition P_0x13035_10_regions :: state_pred where
  \<open>P_0x13035_10_regions \<sigma> \<equiv> \<exists>regions. P_0x13035_10_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x13037_10 :: state_pred where
  \<open>Q_0x13037_10 \<sigma> \<equiv> RIP \<sigma> = 0x13037 \<and> RAX \<sigma> = AES_set_encrypt_key_0x13030_retval \<and> RBX \<sigma> = ((RSP\<^sub>0::64 word) - 0x38) \<and> RDX \<sigma> = (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x168) \<and> RDI \<sigma> = ((RSP\<^sub>0::64 word) - 0x38) \<and> RSI \<sigma> = 0x80 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x38) \<and> RBP \<sigma> = RSI\<^sub>0 \<and> R12 \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> FS \<sigma> = FS\<^sub>0 \<and> regs \<sigma> ymm0w1 = 0x0 \<and> regs \<sigma> ymm0w0 = 0x0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x160),4]::32 word) = ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x164),4]::32 word)) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x164),4]::32 word) = ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x164),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((((RSP\<^sub>0::64 word) - 0x38)::64 word) + 0x8),8]::64 word) = 0x0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x38),8]::64 word) = 0x0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = 0x13035\<close>
declare Q_0x13037_10_def[Qs]

schematic_goal qcow_set_key_0_1_0x13035_0x13035_10[blocks]:
  assumes \<open>(P_0x13035_10 && P_0x13035_10_regions) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x13035 10 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x13037_10 ?\<sigma> \<and> block_usage P_0x13035_10_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x13035_10_def P_0x13035_10_regions_def post: Q_0x13037_10_def regionset: P_0x13035_10_regions_set_def)

definition P_0x13037_true_11 :: state_pred where
  \<open>P_0x13037_true_11 \<sigma> \<equiv> RIP \<sigma> = 0x13037 \<and> RAX \<sigma> = AES_set_encrypt_key_0x13030_retval \<and> RBX \<sigma> = ((RSP\<^sub>0::64 word) - 0x38) \<and> RDX \<sigma> = (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x168) \<and> RDI \<sigma> = ((RSP\<^sub>0::64 word) - 0x38) \<and> RSI \<sigma> = 0x80 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x38) \<and> RBP \<sigma> = RSI\<^sub>0 \<and> R12 \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> FS \<sigma> = FS\<^sub>0 \<and> regs \<sigma> ymm0w1 = 0x0 \<and> regs \<sigma> ymm0w0 = 0x0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x160),4]::32 word) = ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x164),4]::32 word)) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x164),4]::32 word) = ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x164),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((((RSP\<^sub>0::64 word) - 0x38)::64 word) + 0x8),8]::64 word) = 0x0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x38),8]::64 word) = 0x0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = 0x13035\<close>
declare P_0x13037_true_11_def[Ps]

definition P_0x13037_true_11_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x13037_true_11_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((FS\<^sub>0::64 word) + 0x28), 8),
    (2, ((RDI\<^sub>0::64 word) + 0x40), 8),
    (3, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x160), 4),
    (4, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x164), 4),
    (5, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x38), 8),
    (11, ((RSP\<^sub>0::64 word) - 0x40), 8)
  }\<close>

definition P_0x13037_true_11_regions :: state_pred where
  \<open>P_0x13037_true_11_regions \<sigma> \<equiv> \<exists>regions. P_0x13037_true_11_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x13058_11 :: state_pred where
  \<open>Q_0x13058_11 \<sigma> \<equiv> RIP \<sigma> = 0x13058 \<and> RBX \<sigma> = ((RSP\<^sub>0::64 word) - 0x38) \<and> RDI \<sigma> = ((RSP\<^sub>0::64 word) - 0x38) \<and> RSI \<sigma> = 0x80 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x38) \<and> RBP \<sigma> = RSI\<^sub>0 \<and> R12 \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> FS \<sigma> = FS\<^sub>0 \<and> regs \<sigma> ymm0w1 = 0x0 \<and> regs \<sigma> ymm0w0 = 0x0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x160),4]::32 word) = ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x164),4]::32 word)) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x164),4]::32 word) = ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x164),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((((RSP\<^sub>0::64 word) - 0x38)::64 word) + 0x8),8]::64 word) = 0x0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x38),8]::64 word) = 0x0\<close>
declare Q_0x13058_11_def[Qs]

schematic_goal qcow_set_key_0_3_0x13037_0x13076_11[blocks]:
  assumes \<open>(P_0x13037_true_11 && P_0x13037_true_11_regions && !ZF) \<sigma>\<close>
  shows \<open>exec_block 3 0x13076 11 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x13058_11 ?\<sigma> \<and> block_usage P_0x13037_true_11_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x13037_true_11_def P_0x13037_true_11_regions_def post: Q_0x13058_11_def regionset: P_0x13037_true_11_regions_set_def)

definition P_0x13037_false_12 :: state_pred where
  \<open>P_0x13037_false_12 \<sigma> \<equiv> RIP \<sigma> = 0x13037 \<and> RAX \<sigma> = AES_set_encrypt_key_0x13030_retval \<and> RBX \<sigma> = ((RSP\<^sub>0::64 word) - 0x38) \<and> RDX \<sigma> = (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x168) \<and> RDI \<sigma> = ((RSP\<^sub>0::64 word) - 0x38) \<and> RSI \<sigma> = 0x80 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x38) \<and> RBP \<sigma> = RSI\<^sub>0 \<and> R12 \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> FS \<sigma> = FS\<^sub>0 \<and> regs \<sigma> ymm0w1 = 0x0 \<and> regs \<sigma> ymm0w0 = 0x0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x160),4]::32 word) = ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x164),4]::32 word)) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x164),4]::32 word) = ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x164),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((((RSP\<^sub>0::64 word) - 0x38)::64 word) + 0x8),8]::64 word) = 0x0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x38),8]::64 word) = 0x0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = 0x13035\<close>
declare P_0x13037_false_12_def[Ps]

definition P_0x13037_false_12_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x13037_false_12_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((FS\<^sub>0::64 word) + 0x28), 8),
    (2, ((RDI\<^sub>0::64 word) + 0x40), 8),
    (3, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x160), 4),
    (4, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x164), 4),
    (5, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x38), 8),
    (11, ((RSP\<^sub>0::64 word) - 0x40), 8)
  }\<close>

definition P_0x13037_false_12_regions :: state_pred where
  \<open>P_0x13037_false_12_regions \<sigma> \<equiv> \<exists>regions. P_0x13037_false_12_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x13049_12 :: state_pred where
  \<open>Q_0x13049_12 \<sigma> \<equiv> RIP \<sigma> = 0x13049 \<and> RAX \<sigma> = AES_set_encrypt_key_0x13030_retval \<and> RBX \<sigma> = ((RSP\<^sub>0::64 word) - 0x38) \<and> RDX \<sigma> = (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x25c) \<and> RDI \<sigma> = ((RSP\<^sub>0::64 word) - 0x38) \<and> RSI \<sigma> = 0x80 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x38) \<and> RBP \<sigma> = RSI\<^sub>0 \<and> R12 \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> FS \<sigma> = FS\<^sub>0 \<and> regs \<sigma> ymm0w1 = 0x0 \<and> regs \<sigma> ymm0w0 = 0x0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x160),4]::32 word) = ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x164),4]::32 word)) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x164),4]::32 word) = ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x164),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((((RSP\<^sub>0::64 word) - 0x38)::64 word) + 0x8),8]::64 word) = 0x0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x38),8]::64 word) = 0x0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = 0x13035\<close>
declare Q_0x13049_12_def[Qs]

schematic_goal qcow_set_key_0_4_0x13037_0x13046_12[blocks]:
  assumes \<open>(P_0x13037_false_12 && P_0x13037_false_12_regions && ! !ZF) \<sigma>\<close>
  shows \<open>exec_block 4 0x13046 12 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x13049_12 ?\<sigma> \<and> block_usage P_0x13037_false_12_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x13037_false_12_def P_0x13037_false_12_regions_def post: Q_0x13049_12_def regionset: P_0x13037_false_12_regions_set_def)

definition P_0x13049_13 :: state_pred where
  \<open>P_0x13049_13 \<sigma> \<equiv> RIP \<sigma> = 0x13049 \<and> RAX \<sigma> = AES_set_encrypt_key_0x13030_retval \<and> RBX \<sigma> = ((RSP\<^sub>0::64 word) - 0x38) \<and> RDX \<sigma> = (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x25c) \<and> RDI \<sigma> = ((RSP\<^sub>0::64 word) - 0x38) \<and> RSI \<sigma> = 0x80 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x38) \<and> RBP \<sigma> = RSI\<^sub>0 \<and> R12 \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> FS \<sigma> = FS\<^sub>0 \<and> regs \<sigma> ymm0w1 = 0x0 \<and> regs \<sigma> ymm0w0 = 0x0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x160),4]::32 word) = ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x164),4]::32 word)) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x164),4]::32 word) = ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x164),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((((RSP\<^sub>0::64 word) - 0x38)::64 word) + 0x8),8]::64 word) = 0x0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x38),8]::64 word) = 0x0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = 0x13035\<close>
declare P_0x13049_13_def[Ps]

definition P_0x13049_13_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x13049_13_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((FS\<^sub>0::64 word) + 0x28), 8),
    (2, ((RDI\<^sub>0::64 word) + 0x40), 8),
    (3, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x160), 4),
    (4, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x164), 4),
    (5, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x38), 8),
    (11, ((RSP\<^sub>0::64 word) - 0x40), 8)
  }\<close>

definition P_0x13049_13_regions :: state_pred where
  \<open>P_0x13049_13_regions \<sigma> \<equiv> \<exists>regions. P_0x13049_13_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_AES_set_decrypt_key_addr_0x13049_13 :: state_pred where
  \<open>Q_AES_set_decrypt_key_addr_0x13049_13 \<sigma> \<equiv> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x40) \<and> RIP \<sigma> = AES_set_decrypt_key_addr \<and> RAX \<sigma> = AES_set_encrypt_key_0x13030_retval \<and> RBX \<sigma> = ((RSP\<^sub>0::64 word) - 0x38) \<and> RDX \<sigma> = (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x25c) \<and> RDI \<sigma> = ((RSP\<^sub>0::64 word) - 0x38) \<and> RSI \<sigma> = 0x80 \<and> RBP \<sigma> = RSI\<^sub>0 \<and> R12 \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> FS \<sigma> = FS\<^sub>0 \<and> regs \<sigma> ymm0w1 = 0x0 \<and> regs \<sigma> ymm0w0 = 0x0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x160),4]::32 word) = ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x164),4]::32 word)) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x164),4]::32 word) = ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x164),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((((RSP\<^sub>0::64 word) - 0x38)::64 word) + 0x8),8]::64 word) = 0x0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x38),8]::64 word) = 0x0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = 0x1304e\<close>
declare Q_AES_set_decrypt_key_addr_0x13049_13_def[Qs]

schematic_goal qcow_set_key_0_1_0x13049_0x13049_13[blocks]:
  assumes \<open>(P_0x13049_13 && P_0x13049_13_regions) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x13049 13 \<sigma> \<triangleq> ?\<sigma> \<and> Q_AES_set_decrypt_key_addr_0x13049_13 ?\<sigma> \<and> block_usage P_0x13049_13_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x13049_13_def P_0x13049_13_regions_def post: Q_AES_set_decrypt_key_addr_0x13049_13_def regionset: P_0x13049_13_regions_set_def)

definition P_0x1304e_14 :: state_pred where
  \<open>P_0x1304e_14 \<sigma> \<equiv> RIP \<sigma> = 0x1304e \<and> RAX \<sigma> = AES_set_decrypt_key_0x13049_retval \<and> RBX \<sigma> = ((RSP\<^sub>0::64 word) - 0x38) \<and> RDX \<sigma> = (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x25c) \<and> RDI \<sigma> = ((RSP\<^sub>0::64 word) - 0x38) \<and> RSI \<sigma> = 0x80 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x38) \<and> RBP \<sigma> = RSI\<^sub>0 \<and> R12 \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> FS \<sigma> = FS\<^sub>0 \<and> regs \<sigma> ymm0w1 = 0x0 \<and> regs \<sigma> ymm0w0 = 0x0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x160),4]::32 word) = ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x164),4]::32 word)) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x164),4]::32 word) = ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x164),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((((RSP\<^sub>0::64 word) - 0x38)::64 word) + 0x8),8]::64 word) = 0x0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x38),8]::64 word) = 0x0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = 0x1304e\<close>
declare P_0x1304e_14_def[Ps]

definition P_0x1304e_14_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x1304e_14_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((FS\<^sub>0::64 word) + 0x28), 8),
    (2, ((RDI\<^sub>0::64 word) + 0x40), 8),
    (3, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x160), 4),
    (4, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x164), 4),
    (5, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x38), 8),
    (11, ((RSP\<^sub>0::64 word) - 0x40), 8)
  }\<close>

definition P_0x1304e_14_regions :: state_pred where
  \<open>P_0x1304e_14_regions \<sigma> \<equiv> \<exists>regions. P_0x1304e_14_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x13058_14 :: state_pred where
  \<open>Q_0x13058_14 \<sigma> \<equiv> RIP \<sigma> = 0x13058 \<and> RBX \<sigma> = ((RSP\<^sub>0::64 word) - 0x38) \<and> RDI \<sigma> = ((RSP\<^sub>0::64 word) - 0x38) \<and> RSI \<sigma> = 0x80 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x38) \<and> RBP \<sigma> = RSI\<^sub>0 \<and> R12 \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> FS \<sigma> = FS\<^sub>0 \<and> regs \<sigma> ymm0w1 = 0x0 \<and> regs \<sigma> ymm0w0 = 0x0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x160),4]::32 word) = ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x164),4]::32 word)) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x164),4]::32 word) = ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x164),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((((RSP\<^sub>0::64 word) - 0x38)::64 word) + 0x8),8]::64 word) = 0x0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x38),8]::64 word) = 0x0\<close>
declare Q_0x13058_14_def[Qs]

schematic_goal qcow_set_key_0_4_0x1304e_0x13056_14[blocks]:
  assumes \<open>(P_0x1304e_14 && P_0x1304e_14_regions) \<sigma>\<close>
  shows \<open>exec_block 4 0x13056 14 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x13058_14 ?\<sigma> \<and> block_usage P_0x1304e_14_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x1304e_14_def P_0x1304e_14_regions_def post: Q_0x13058_14_def regionset: P_0x1304e_14_regions_set_def)

definition P_0x13058_15 :: state_pred where
  \<open>P_0x13058_15 \<sigma> \<equiv> RIP \<sigma> = 0x13058 \<and> RBX \<sigma> = ((RSP\<^sub>0::64 word) - 0x38) \<and> RDI \<sigma> = ((RSP\<^sub>0::64 word) - 0x38) \<and> RSI \<sigma> = 0x80 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x38) \<and> RBP \<sigma> = RSI\<^sub>0 \<and> R12 \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> FS \<sigma> = FS\<^sub>0 \<and> regs \<sigma> ymm0w1 = 0x0 \<and> regs \<sigma> ymm0w0 = 0x0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x160),4]::32 word) = ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x164),4]::32 word)) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x164),4]::32 word) = ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x164),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((((RSP\<^sub>0::64 word) - 0x38)::64 word) + 0x8),8]::64 word) = 0x0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x38),8]::64 word) = 0x0\<close>
declare P_0x13058_15_def[Ps]

definition P_0x13058_15_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x13058_15_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((FS\<^sub>0::64 word) + 0x28), 8),
    (2, ((RDI\<^sub>0::64 word) + 0x40), 8),
    (3, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x160), 4),
    (4, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x164), 4),
    (5, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x38), 8)
  }\<close>

definition P_0x13058_15_regions :: state_pred where
  \<open>P_0x13058_15_regions \<sigma> \<equiv> \<exists>regions. P_0x13058_15_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x13066_15 :: state_pred where
  \<open>Q_0x13066_15 \<sigma> \<equiv> RIP \<sigma> = 0x13066 \<and> RBX \<sigma> = ((RSP\<^sub>0::64 word) - 0x38) \<and> RDI \<sigma> = ((RSP\<^sub>0::64 word) - 0x38) \<and> RSI \<sigma> = 0x0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x38) \<and> RBP \<sigma> = RSI\<^sub>0 \<and> R12 \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> FS \<sigma> = FS\<^sub>0 \<and> regs \<sigma> ymm0w1 = 0x0 \<and> regs \<sigma> ymm0w0 = 0x0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x160),4]::32 word) = ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x164),4]::32 word)) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x164),4]::32 word) = ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x164),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((((RSP\<^sub>0::64 word) - 0x38)::64 word) + 0x8),8]::64 word) = 0x0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x38),8]::64 word) = 0x0\<close>
declare Q_0x13066_15_def[Qs]

schematic_goal qcow_set_key_0_2_0x13058_0x1305d_15[blocks]:
  assumes \<open>(P_0x13058_15 && P_0x13058_15_regions) \<sigma>\<close>
  shows \<open>exec_block 2 0x1305d 15 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x13066_15 ?\<sigma> \<and> block_usage P_0x13058_15_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x13058_15_def P_0x13058_15_regions_def post: Q_0x13066_15_def regionset: P_0x13058_15_regions_set_def)

definition P_0x13066_true_16 :: state_pred where
  \<open>P_0x13066_true_16 \<sigma> \<equiv> RIP \<sigma> = 0x13066 \<and> RBX \<sigma> = ((RSP\<^sub>0::64 word) - 0x38) \<and> RDI \<sigma> = ((RSP\<^sub>0::64 word) - 0x38) \<and> RSI \<sigma> = 0x0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x38) \<and> RBP \<sigma> = RSI\<^sub>0 \<and> R12 \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> FS \<sigma> = FS\<^sub>0 \<and> regs \<sigma> ymm0w1 = 0x0 \<and> regs \<sigma> ymm0w0 = 0x0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x160),4]::32 word) = ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x164),4]::32 word)) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x164),4]::32 word) = ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x164),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((((RSP\<^sub>0::64 word) - 0x38)::64 word) + 0x8),8]::64 word) = 0x0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x38),8]::64 word) = 0x0\<close>
declare P_0x13066_true_16_def[Ps]

definition P_0x13066_true_16_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x13066_true_16_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((FS\<^sub>0::64 word) + 0x28), 8),
    (2, ((RDI\<^sub>0::64 word) + 0x40), 8),
    (3, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x160), 4),
    (4, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x164), 4),
    (5, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x38), 8)
  }\<close>

definition P_0x13066_true_16_regions :: state_pred where
  \<open>P_0x13066_true_16_regions \<sigma> \<equiv> \<exists>regions. P_0x13066_true_16_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x13078_16 :: state_pred where
  \<open>Q_0x13078_16 \<sigma> \<equiv> RIP \<sigma> = 0x13078 \<and> RBX \<sigma> = ((RSP\<^sub>0::64 word) - 0x38) \<and> RDI \<sigma> = ((RSP\<^sub>0::64 word) - 0x38) \<and> RSI \<sigma> = 0x0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x38) \<and> RBP \<sigma> = RSI\<^sub>0 \<and> R12 \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> FS \<sigma> = FS\<^sub>0 \<and> regs \<sigma> ymm0w1 = 0x0 \<and> regs \<sigma> ymm0w0 = 0x0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x160),4]::32 word) = ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x164),4]::32 word)) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x164),4]::32 word) = ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x164),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((((RSP\<^sub>0::64 word) - 0x38)::64 word) + 0x8),8]::64 word) = 0x0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x38),8]::64 word) = 0x0\<close>
declare Q_0x13078_16_def[Qs]

schematic_goal qcow_set_key_0_1_0x13066_0x13066_16[blocks]:
  assumes \<open>(P_0x13066_true_16 && P_0x13066_true_16_regions && !ZF) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x13066 16 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x13078_16 ?\<sigma> \<and> block_usage P_0x13066_true_16_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x13066_true_16_def P_0x13066_true_16_regions_def post: Q_0x13078_16_def regionset: P_0x13066_true_16_regions_set_def)

definition P_0x13078_17 :: state_pred where
  \<open>P_0x13078_17 \<sigma> \<equiv> RIP \<sigma> = 0x13078 \<and> RBX \<sigma> = ((RSP\<^sub>0::64 word) - 0x38) \<and> RDI \<sigma> = ((RSP\<^sub>0::64 word) - 0x38) \<and> RSI \<sigma> = 0x0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x38) \<and> RBP \<sigma> = RSI\<^sub>0 \<and> R12 \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> FS \<sigma> = FS\<^sub>0 \<and> regs \<sigma> ymm0w1 = 0x0 \<and> regs \<sigma> ymm0w0 = 0x0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x160),4]::32 word) = ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x164),4]::32 word)) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x164),4]::32 word) = ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x164),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((((RSP\<^sub>0::64 word) - 0x38)::64 word) + 0x8),8]::64 word) = 0x0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x38),8]::64 word) = 0x0\<close>
declare P_0x13078_17_def[Ps]

definition P_0x13078_17_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x13078_17_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((FS\<^sub>0::64 word) + 0x28), 8),
    (2, ((RDI\<^sub>0::64 word) + 0x40), 8),
    (3, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x160), 4),
    (4, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x164), 4),
    (5, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x38), 8),
    (11, ((RSP\<^sub>0::64 word) - 0x40), 8)
  }\<close>

definition P_0x13078_17_regions :: state_pred where
  \<open>P_0x13078_17_regions \<sigma> \<equiv> \<exists>regions. P_0x13078_17_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_stack_chk_fail_addr_0x13078_17 :: state_pred where
  \<open>Q_stack_chk_fail_addr_0x13078_17 \<sigma> \<equiv> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x40) \<and> RIP \<sigma> = stack_chk_fail_addr \<and> RDI \<sigma> = ((RSP\<^sub>0::64 word) - 0x38) \<and> RSI \<sigma> = 0x0 \<and> FS \<sigma> = FS\<^sub>0 \<and> regs \<sigma> ymm0w1 = 0x0 \<and> regs \<sigma> ymm0w0 = 0x0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x160),4]::32 word) = ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x164),4]::32 word)) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x164),4]::32 word) = ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x164),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((((RSP\<^sub>0::64 word) - 0x38)::64 word) + 0x8),8]::64 word) = 0x0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x38),8]::64 word) = 0x0\<close>
declare Q_stack_chk_fail_addr_0x13078_17_def[Qs]

schematic_goal qcow_set_key_0_1_0x13078_0x13078_17[blocks]:
  assumes \<open>(P_0x13078_17 && P_0x13078_17_regions) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x13078 17 \<sigma> \<triangleq> ?\<sigma> \<and> Q_stack_chk_fail_addr_0x13078_17 ?\<sigma> \<and> block_usage P_0x13078_17_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x13078_17_def P_0x13078_17_regions_def post: Q_stack_chk_fail_addr_0x13078_17_def regionset: P_0x13078_17_regions_set_def)

definition P_0x13066_false_18 :: state_pred where
  \<open>P_0x13066_false_18 \<sigma> \<equiv> RIP \<sigma> = 0x13066 \<and> RBX \<sigma> = ((RSP\<^sub>0::64 word) - 0x38) \<and> RDI \<sigma> = ((RSP\<^sub>0::64 word) - 0x38) \<and> RSI \<sigma> = 0x0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x38) \<and> RBP \<sigma> = RSI\<^sub>0 \<and> R12 \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> FS \<sigma> = FS\<^sub>0 \<and> regs \<sigma> ymm0w1 = 0x0 \<and> regs \<sigma> ymm0w0 = 0x0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x160),4]::32 word) = ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x164),4]::32 word)) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x164),4]::32 word) = ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x164),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((((RSP\<^sub>0::64 word) - 0x38)::64 word) + 0x8),8]::64 word) = 0x0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x38),8]::64 word) = 0x0\<close>
declare P_0x13066_false_18_def[Ps]

definition P_0x13066_false_18_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x13066_false_18_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((FS\<^sub>0::64 word) + 0x28), 8),
    (2, ((RDI\<^sub>0::64 word) + 0x40), 8),
    (3, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x160), 4),
    (4, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x164), 4),
    (5, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x38), 8)
  }\<close>

definition P_0x13066_false_18_regions :: state_pred where
  \<open>P_0x13066_false_18_regions \<sigma> \<equiv> \<exists>regions. P_0x13066_false_18_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_ret_address_18 :: state_pred where
  \<open>Q_ret_address_18 \<sigma> \<equiv> RIP \<sigma> = ret_address \<and> RDI \<sigma> = ((RSP\<^sub>0::64 word) - 0x38) \<and> RSI \<sigma> = 0x0 \<and> FS \<sigma> = FS\<^sub>0 \<and> regs \<sigma> ymm0w1 = 0x0 \<and> regs \<sigma> ymm0w0 = 0x0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x160),4]::32 word) = ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x164),4]::32 word)) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x164),4]::32 word) = ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x164),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((((RSP\<^sub>0::64 word) - 0x38)::64 word) + 0x8),8]::64 word) = 0x0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x38),8]::64 word) = 0x0\<close>
declare Q_ret_address_18_def[Qs]

schematic_goal qcow_set_key_0_6_0x13066_0x13070_18[blocks]:
  assumes \<open>(P_0x13066_false_18 && P_0x13066_false_18_regions && ! !ZF) \<sigma>\<close>
  shows \<open>exec_block 6 0x13070 18 \<sigma> \<triangleq> ?\<sigma> \<and> Q_ret_address_18 ?\<sigma> \<and> block_usage P_0x13066_false_18_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x13066_false_18_def P_0x13066_false_18_regions_def post: Q_ret_address_18_def regionset: P_0x13066_false_18_regions_set_def)

definition qcow_set_key_acode :: ACode where
  \<open>qcow_set_key_acode =
    Block 13 0x12fda 0;
    Block (Suc 0) 0x12fdd (Suc 0);
    CALL strlen_acode;
    Block 4 0x12fed 2;
    IF jle THEN
      Block (Suc 0) 0x12fef 3
    ELSE
      Block 4 0x12ff6 4;
      WHILE P_0x13000_5 DO
        Block 4 0x1300c 5;
        IF jg THEN
          Block (Suc 0) 0x1300e 6
        ELSE
          Block (Suc 0) 0x1300e 7
        FI
      OD
    FI;
    Block 5 0x13028 8;
    Block (Suc 0) 0x13030 9;
    CALL AES_set_encrypt_key_acode;
    Block (Suc 0) 0x13035 10;
    IF !ZF THEN
      Block 3 0x13076 11
    ELSE
      Block 4 0x13046 12;
      Block (Suc 0) 0x13049 13;
      CALL AES_set_decrypt_key_acode;
      Block 4 0x13056 14
    FI;
    Block 2 0x1305d 15;
    IF !ZF THEN
      Block (Suc 0) 0x13066 16;
      Block (Suc 0) 0x13078 17;
      CALL stack_chk_fail_acode
    ELSE
      Block 6 0x13070 18
    FI
  \<close>

schematic_goal "qcow_set_key":
  assumes
    \<open>\<forall>\<sigma>. RIP \<sigma> = 0x12fdd \<longrightarrow> P_0x12fdd_1_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x12fe2 \<longrightarrow> P_0x12fe2_2_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x12fef \<longrightarrow> P_0x12fef_true_3_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x12fef \<longrightarrow> P_0x12fef_false_4_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x13000 \<longrightarrow> P_0x13000_5_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x1300e \<longrightarrow> P_0x1300e_true_6_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x1300e \<longrightarrow> P_0x1300e_false_7_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x13010 \<longrightarrow> P_0x13010_8_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x13030 \<longrightarrow> P_0x13030_9_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x13035 \<longrightarrow> P_0x13035_10_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x13037 \<longrightarrow> P_0x13037_true_11_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x13037 \<longrightarrow> P_0x13037_false_12_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x13049 \<longrightarrow> P_0x13049_13_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x1304e \<longrightarrow> P_0x1304e_14_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x13058 \<longrightarrow> P_0x13058_15_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x13066 \<longrightarrow> P_0x13066_true_16_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x13078 \<longrightarrow> P_0x13078_17_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x13066 \<longrightarrow> P_0x13066_false_18_regions \<sigma>\<close>
    and [blocks]: \<open>{{Q_strlen_addr_0x12fdd_1}} \<box>strlen_acode {{P_0x12fe2_2;M_0x12fdd}}\<close>
    and [blocks]: \<open>{{Q_AES_set_encrypt_key_addr_0x13030_9}} \<box>AES_set_encrypt_key_acode {{P_0x13035_10;M_0x13030}}\<close>
    and [blocks]: \<open>{{Q_AES_set_decrypt_key_addr_0x13049_13}} \<box>AES_set_decrypt_key_acode {{P_0x1304e_14;M_0x13049}}\<close>
    and [blocks]: \<open>{{Q_stack_chk_fail_addr_0x13078_17}} \<box>stack_chk_fail_acode {{Q_fail;M_0x13078}}\<close>
  shows \<open>{{?P}} qcow_set_key_acode {{?Q;?M}}\<close>
  apply (vcg acode: qcow_set_key_acode_def assms: assms)
  apply (vcg_while "P_0x13000_5 || P_0x13010_8")
  apply (vcg_step assms: assms)+
  apply (auto simp add: assms pred_logic Ps Qs)[1]
  apply auto
  apply (vcg_step assms: assms)+
  apply (auto simp add: assms pred_logic Ps Qs)[1]
  apply (auto simp add: assms pred_logic Ps Qs)[1]
  apply auto
  apply (vcg_step assms: assms)+
  done

end
