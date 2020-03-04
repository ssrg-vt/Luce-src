theory qcow_snapshot_create
  imports
    "../../../isabelle/VCG/HTriple"
begin

locale "qemu_img_xen" = execution_context + exec_code +
  fixes find_snapshot_by_id_isra_8_0x15e32_retval\<^sub>v qemu_strdup_0x15e42_retval\<^sub>v qemu_strdup_0x15e5f_retval\<^sub>v update_snapshot_refcount_0x15ea7_retval\<^sub>v alloc_clusters_0x15ebf_retval\<^sub>v qemu_malloc_0x15ed7_retval\<^sub>v bdrv_pwrite_0x15f17_retval\<^sub>v qemu_free_0x15f32_retval\<^sub>v qemu_malloc_0x15f51_retval\<^sub>v memcpy_0x15f7e_retval\<^sub>v qemu_free_0x15f8a_retval\<^sub>v qcow_write_snapshots_0x15fde_retval\<^sub>v strtoul_0x16043_retval\<^sub>v snprintf_chk_0x1607d_retval\<^sub>v qemu_free_0x16092_retval\<^sub>v qemu_free_0x1609a_retval\<^sub>v stack_chk_fail_0x160bb_retval\<^sub>v snprintf_chk_addr stack_chk_fail_addr alloc_clusters_addr bdrv_pwrite_addr find_snapshot_by_id_isra_8_addr memcpy_addr qcow_write_snapshots_addr qemu_free_addr qemu_malloc_addr qemu_strdup_addr strtoul_addr update_snapshot_refcount_addr :: \<open>64 word\<close>
    and snprintf_chk_acode stack_chk_fail_acode alloc_clusters_acode bdrv_pwrite_acode find_snapshot_by_id_isra_8_acode memcpy_acode qcow_write_snapshots_acode qemu_free_acode qemu_malloc_acode qemu_strdup_acode strtoul_acode update_snapshot_refcount_acode :: ACode
  assumes fetch:
    "fetch 0x15de0 \<equiv> (Unary (IS_8088 Push) (Storage (Reg (General SixtyFour r15))), 2)"
    "fetch 0x15de2 \<equiv> (Binary (IS_PentiumMMX_MMX Pxor) (Reg (SIMD OneHundredTwentyEight ymm0w3 ymm0w2 ymm0w1 ymm0w0)) (Storage (Reg (SIMD OneHundredTwentyEight ymm0w3 ymm0w2 ymm0w1 ymm0w0))), 4)"
    "fetch 0x15de6 \<equiv> (Unary (IS_8088 Push) (Storage (Reg (General SixtyFour r14))), 2)"
    "fetch 0x15de8 \<equiv> (Unary (IS_8088 Push) (Storage (Reg (General SixtyFour r13))), 2)"
    "fetch 0x15dea \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour r13)) (Storage (Reg (General SixtyFour rsi))), 3)"
    "fetch 0x15ded \<equiv> (Unary (IS_8088 Push) (Storage (Reg (General SixtyFour r12))), 2)"
    "fetch 0x15def \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour r12)) (Storage (Reg (General SixtyFour rdi))), 3)"
    "fetch 0x15df2 \<equiv> (Unary (IS_8088 Push) (Storage (Reg (General SixtyFour rbp))), 1)"
    "fetch 0x15df3 \<equiv> (Unary (IS_8088 Push) (Storage (Reg (General SixtyFour rbx))), 1)"
    "fetch 0x15df4 \<equiv> (Binary (IS_8088 Sub) (Reg (General SixtyFour rsp)) (Immediate SixtyFour (ImmVal 72)), 4)"
    "fetch 0x15df8 \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour rbx)) (Storage (Memory SixtyFour (A_SizeDirective 64 (A_Plus (A_FromReg (General SixtyFour rdi)) (A_WordConstant 64))))), 4)"
    "fetch 0x15dfc \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour rax)) (Storage (Memory SixtyFour (A_SizeDirective 64 (A_Plus (A_FromReg (General SixtyFour fs)) (A_WordConstant 40))))), 9)"
    "fetch 0x15e05 \<equiv> (Binary (IS_8088 Mov) (Memory SixtyFour (A_SizeDirective 64 (A_Plus (A_FromReg (General SixtyFour rsp)) (A_WordConstant 56)))) (Storage (Reg (General SixtyFour rax))), 5)"
    "fetch 0x15e0a \<equiv> (Binary (IS_8088 Xor) (Reg (General ThirtyTwo rax)) (Storage (Reg (General ThirtyTwo rax))), 2)"
    "fetch 0x15e0c \<equiv> (Binary (IS_8088 Cmp) (Memory Eight (A_SizeDirective 8 (A_FromReg (General SixtyFour rsi)))) (Immediate SixtyFour (ImmVal 0)), 3)"
    "fetch 0x15e0f \<equiv> (Binary (IS_SSE_SIMD Movaps) (Memory OneHundredTwentyEight (A_SizeDirective 128 (A_FromReg (General SixtyFour rsp)))) (Storage (Reg (SIMD OneHundredTwentyEight ymm0w3 ymm0w2 ymm0w1 ymm0w0))), 4)"
    "fetch 0x15e13 \<equiv> (Binary (IS_SSE_SIMD Movaps) (Memory OneHundredTwentyEight (A_SizeDirective 128 (A_Plus (A_FromReg (General SixtyFour rsp)) (A_WordConstant 16)))) (Storage (Reg (SIMD OneHundredTwentyEight ymm0w3 ymm0w2 ymm0w1 ymm0w0))), 5)"
    "fetch 0x15e18 \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour rdi)) (Storage (Reg (General SixtyFour rbx))), 3)"
    "fetch 0x15e1b \<equiv> (Binary (IS_SSE_SIMD Movaps) (Memory OneHundredTwentyEight (A_SizeDirective 128 (A_Plus (A_FromReg (General SixtyFour rsp)) (A_WordConstant 32)))) (Storage (Reg (SIMD OneHundredTwentyEight ymm0w3 ymm0w2 ymm0w1 ymm0w0))), 5)"
    "fetch 0x15e20 \<equiv> (Binary (IS_8088 Mov) (Memory SixtyFour (A_SizeDirective 64 (A_Plus (A_FromReg (General SixtyFour rsp)) (A_WordConstant 48)))) (Immediate SixtyFour (ImmVal 0)), 9)"
    "fetch 0x15e29 \<equiv> (Unary (IS_8088 Je) (Immediate SixtyFour (ImmVal 90128)), 6)"
    "fetch 0x15e2f \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour rsi)) (Storage (Reg (General SixtyFour r13))), 3)"
    "fetch 0x15e32 \<equiv> (Unary (IS_8088 Call) (Immediate SixtyFour (ImmLabel ''find_snapshot_by_id.isra.8'')), 5)"
    "fetch 0x15e37 \<equiv> (Binary (IS_8088 Test) (Reg (General ThirtyTwo rax)) (Storage (Reg (General ThirtyTwo rax))), 2)"
    "fetch 0x15e39 \<equiv> (Unary (IS_8088 Jns) (Immediate SixtyFour (ImmVal 90289)), 6)"
    "fetch 0x15e3f \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour rdi)) (Storage (Reg (General SixtyFour r13))), 3)"
    "fetch 0x15e42 \<equiv> (Unary (IS_8088 Call) (Immediate SixtyFour (ImmLabel ''qemu_strdup'')), 5)"
    "fetch 0x15e47 \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour rbp)) (Storage (Reg (General SixtyFour rax))), 3)"
    "fetch 0x15e4a \<equiv> (Binary (IS_8088 Mov) (Memory SixtyFour (A_SizeDirective 64 (A_Plus (A_FromReg (General SixtyFour rsp)) (A_WordConstant 16)))) (Storage (Reg (General SixtyFour rax))), 5)"
    "fetch 0x15e4f \<equiv> (Binary (IS_8088 Test) (Reg (General SixtyFour rax)) (Storage (Reg (General SixtyFour rax))), 3)"
    "fetch 0x15e52 \<equiv> (Unary (IS_8088 Je) (Immediate SixtyFour (ImmVal 90252)), 6)"
    "fetch 0x15e58 \<equiv> (Binary (IS_8088 Lea) (Reg (General SixtyFour rdi)) (Storage (Memory SixtyFour (A_Plus (A_FromReg (General SixtyFour r13)) (A_WordConstant 128)))), 7)"
    "fetch 0x15e5f \<equiv> (Unary (IS_8088 Call) (Immediate SixtyFour (ImmLabel ''qemu_strdup'')), 5)"
    "fetch 0x15e64 \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour rbp)) (Storage (Reg (General SixtyFour rax))), 3)"
    "fetch 0x15e67 \<equiv> (Binary (IS_8088 Mov) (Memory SixtyFour (A_SizeDirective 64 (A_Plus (A_FromReg (General SixtyFour rsp)) (A_WordConstant 24)))) (Storage (Reg (General SixtyFour rax))), 5)"
    "fetch 0x15e6c \<equiv> (Binary (IS_8088 Test) (Reg (General SixtyFour rax)) (Storage (Reg (General SixtyFour rax))), 3)"
    "fetch 0x15e6f \<equiv> (Unary (IS_8088 Je) (Immediate SixtyFour (ImmVal 90252)), 6)"
    "fetch 0x15e75 \<equiv> (Binary (IS_8088 Mov) (Reg (General ThirtyTwo rax)) (Storage (Memory ThirtyTwo (A_SizeDirective 32 (A_Plus (A_FromReg (General SixtyFour r13)) (A_WordConstant 392))))), 7)"
    "fetch 0x15e7c \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour rdx)) (Storage (Memory SixtyFour (A_SizeDirective 64 (A_Plus (A_FromReg (General SixtyFour r13)) (A_WordConstant 384))))), 7)"
    "fetch 0x15e83 \<equiv> (Binary (IS_8088 Mov) (Reg (General ThirtyTwo rcx)) (Immediate SixtyFour (ImmVal 1)), 5)"
    "fetch 0x15e88 \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour rdi)) (Storage (Reg (General SixtyFour r12))), 3)"
    "fetch 0x15e8b \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour rsi)) (Storage (Memory SixtyFour (A_SizeDirective 64 (A_Plus (A_FromReg (General SixtyFour rbx)) (A_WordConstant 56))))), 4)"
    "fetch 0x15e8f \<equiv> (Binary (IS_8088 Mov) (Memory SixtyFour (A_SizeDirective 64 (A_Plus (A_FromReg (General SixtyFour rsp)) (A_WordConstant 32)))) (Storage (Reg (General SixtyFour rdx))), 5)"
    "fetch 0x15e94 \<equiv> (Binary (IS_8088 Mov) (Reg (General ThirtyTwo rdx)) (Storage (Memory ThirtyTwo (A_SizeDirective 32 (A_Plus (A_FromReg (General SixtyFour rbx)) (A_WordConstant 28))))), 3)"
    "fetch 0x15e97 \<equiv> (Binary (IS_8088 Mov) (Memory ThirtyTwo (A_SizeDirective 32 (A_Plus (A_FromReg (General SixtyFour rsp)) (A_WordConstant 40)))) (Storage (Reg (General ThirtyTwo rax))), 4)"
    "fetch 0x15e9b \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour rax)) (Storage (Memory SixtyFour (A_SizeDirective 64 (A_Plus (A_FromReg (General SixtyFour r13)) (A_WordConstant 400))))), 7)"
    "fetch 0x15ea2 \<equiv> (Binary (IS_8088 Mov) (Memory SixtyFour (A_SizeDirective 64 (A_Plus (A_FromReg (General SixtyFour rsp)) (A_WordConstant 48)))) (Storage (Reg (General SixtyFour rax))), 5)"
    "fetch 0x15ea7 \<equiv> (Unary (IS_8088 Call) (Immediate SixtyFour (ImmLabel ''update_snapshot_refcount'')), 5)"
    "fetch 0x15eac \<equiv> (Binary (IS_8088 Test) (Reg (General ThirtyTwo rax)) (Storage (Reg (General ThirtyTwo rax))), 2)"
    "fetch 0x15eae \<equiv> (Unary (IS_8088 Js) (Immediate SixtyFour (ImmVal 90252)), 6)"
    "fetch 0x15eb4 \<equiv> (Binary (IS_X86_64 Movsxd) (Reg (General SixtyFour rsi)) (Storage (Memory ThirtyTwo (A_SizeDirective 32 (A_Plus (A_FromReg (General SixtyFour rbx)) (A_WordConstant 28))))), 4)"
    "fetch 0x15eb8 \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour rdi)) (Storage (Reg (General SixtyFour r12))), 3)"
    "fetch 0x15ebb \<equiv> (Binary (IS_8088 Shl) (Reg (General SixtyFour rsi)) (Immediate SixtyFour (ImmVal 3)), 4)"
    "fetch 0x15ebf \<equiv> (Unary (IS_8088 Call) (Immediate SixtyFour (ImmLabel ''alloc_clusters'')), 5)"
    "fetch 0x15ec4 \<equiv> (Binary (IS_X86_64 Movsxd) (Reg (General SixtyFour rdi)) (Storage (Memory ThirtyTwo (A_SizeDirective 32 (A_Plus (A_FromReg (General SixtyFour rbx)) (A_WordConstant 28))))), 4)"
    "fetch 0x15ec8 \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour r14)) (Storage (Reg (General SixtyFour rax))), 3)"
    "fetch 0x15ecb \<equiv> (Binary (IS_8088 Mov) (Memory SixtyFour (A_SizeDirective 64 (A_FromReg (General SixtyFour rsp)))) (Storage (Reg (General SixtyFour rax))), 4)"
    "fetch 0x15ecf \<equiv> (Binary (IS_8088 Mov) (Memory ThirtyTwo (A_SizeDirective 32 (A_Plus (A_FromReg (General SixtyFour rsp)) (A_WordConstant 8)))) (Storage (Reg (General ThirtyTwo rdi))), 4)"
    "fetch 0x15ed3 \<equiv> (Binary (IS_8088 Shl) (Reg (General SixtyFour rdi)) (Immediate SixtyFour (ImmVal 3)), 4)"
    "fetch 0x15ed7 \<equiv> (Unary (IS_8088 Call) (Immediate SixtyFour (ImmLabel ''qemu_malloc'')), 5)"
    "fetch 0x15edc \<equiv> (Binary (IS_8088 Mov) (Reg (General ThirtyTwo rcx)) (Storage (Memory ThirtyTwo (A_SizeDirective 32 (A_Plus (A_FromReg (General SixtyFour rbx)) (A_WordConstant 28))))), 3)"
    "fetch 0x15edf \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour r13)) (Storage (Reg (General SixtyFour rax))), 3)"
    "fetch 0x15ee2 \<equiv> (Binary (IS_8088 Test) (Reg (General ThirtyTwo rcx)) (Storage (Reg (General ThirtyTwo rcx))), 2)"
    "fetch 0x15ee4 \<equiv> (Unary (IS_8088 Jle) (Immediate SixtyFour (ImmVal 89867)), 2)"
    "fetch 0x15ee6 \<equiv> (Binary (IS_8088 Xor) (Reg (General ThirtyTwo rax)) (Storage (Reg (General ThirtyTwo rax))), 2)"
    "fetch 0x15ee8 \<equiv> (Unary (IS_8088 Nop) (Storage (Memory ThirtyTwo (A_SizeDirective 32 (A_Plus (A_FromReg (General SixtyFour rax)) (A_Plus (A_Mult 1 (A_FromReg (General SixtyFour rax))) (A_WordConstant 0)))))), 8)"
    "fetch 0x15ef0 \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour rdx)) (Storage (Memory SixtyFour (A_SizeDirective 64 (A_Plus (A_FromReg (General SixtyFour rbx)) (A_WordConstant 64))))), 4)"
    "fetch 0x15ef4 \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour rdx)) (Storage (Memory SixtyFour (A_SizeDirective 64 (A_Plus (A_FromReg (General SixtyFour rdx)) (A_Mult 8 (A_FromReg (General SixtyFour rax))))))), 4)"
    "fetch 0x15ef8 \<equiv> (Unary (IS_80486 Bswap) (Storage (Reg (General SixtyFour rdx))), 3)"
    "fetch 0x15efb \<equiv> (Binary (IS_8088 Mov) (Memory SixtyFour (A_SizeDirective 64 (A_Plus (A_FromReg (General SixtyFour r13)) (A_Plus (A_Mult 8 (A_FromReg (General SixtyFour rax))) (A_WordConstant 0))))) (Storage (Reg (General SixtyFour rdx))), 5)"
    "fetch 0x15f00 \<equiv> (Binary (IS_8088 Mov) (Reg (General ThirtyTwo rcx)) (Storage (Memory ThirtyTwo (A_SizeDirective 32 (A_Plus (A_FromReg (General SixtyFour rbx)) (A_WordConstant 28))))), 3)"
    "fetch 0x15f03 \<equiv> (Binary (IS_8088 Add) (Reg (General SixtyFour rax)) (Immediate SixtyFour (ImmVal 1)), 4)"
    "fetch 0x15f07 \<equiv> (Binary (IS_8088 Cmp) (Reg (General ThirtyTwo rcx)) (Storage (Reg (General ThirtyTwo rax))), 2)"
    "fetch 0x15f09 \<equiv> (Unary (IS_8088 Jg) (Immediate SixtyFour (ImmVal 89840)), 2)"
    "fetch 0x15f0b \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour rdi)) (Storage (Memory SixtyFour (A_SizeDirective 64 (A_FromReg (General SixtyFour rbx))))), 3)"
    "fetch 0x15f0e \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour rdx)) (Storage (Reg (General SixtyFour r13))), 3)"
    "fetch 0x15f11 \<equiv> (Binary (IS_8088 Shl) (Reg (General ThirtyTwo rcx)) (Immediate SixtyFour (ImmVal 3)), 3)"
    "fetch 0x15f14 \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour rsi)) (Storage (Reg (General SixtyFour r14))), 3)"
    "fetch 0x15f17 \<equiv> (Unary (IS_8088 Call) (Immediate SixtyFour (ImmLabel ''bdrv_pwrite'')), 5)"
    "fetch 0x15f1c \<equiv> (Binary (IS_X86_64 Movsxd) (Reg (General SixtyFour rdx)) (Storage (Memory ThirtyTwo (A_SizeDirective 32 (A_Plus (A_FromReg (General SixtyFour rbx)) (A_WordConstant 28))))), 4)"
    "fetch 0x15f20 \<equiv> (Nullary (IS_X86_64 Cdqe), 2)"
    "fetch 0x15f22 \<equiv> (Binary (IS_8088 Shl) (Reg (General SixtyFour rdx)) (Immediate SixtyFour (ImmVal 3)), 4)"
    "fetch 0x15f26 \<equiv> (Binary (IS_8088 Cmp) (Reg (General SixtyFour rax)) (Storage (Reg (General SixtyFour rdx))), 3)"
    "fetch 0x15f29 \<equiv> (Unary (IS_8088 Jne) (Immediate SixtyFour (ImmVal 90255)), 6)"
    "fetch 0x15f2f \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour rdi)) (Storage (Reg (General SixtyFour r13))), 3)"
    "fetch 0x15f32 \<equiv> (Unary (IS_8088 Call) (Immediate SixtyFour (ImmLabel ''qemu_free'')), 5)"
    "fetch 0x15f37 \<equiv> (Binary (IS_8088 Mov) (Reg (General ThirtyTwo rax)) (Storage (Memory ThirtyTwo (A_SizeDirective 32 (A_Plus (A_FromReg (General SixtyFour rbx)) (A_WordConstant 860))))), 6)"
    "fetch 0x15f3d \<equiv> (Binary (IS_8088 Add) (Reg (General ThirtyTwo rax)) (Immediate SixtyFour (ImmVal 1)), 3)"
    "fetch 0x15f40 \<equiv> (Nullary (IS_X86_64 Cdqe), 2)"
    "fetch 0x15f42 \<equiv> (Binary (IS_8088 Lea) (Reg (General SixtyFour rdi)) (Storage (Memory SixtyFour (A_Plus (A_Mult 8 (A_FromReg (General SixtyFour rax))) (A_WordConstant 0)))), 8)"
    "fetch 0x15f4a \<equiv> (Binary (IS_8088 Sub) (Reg (General SixtyFour rdi)) (Storage (Reg (General SixtyFour rax))), 3)"
    "fetch 0x15f4d \<equiv> (Binary (IS_8088 Shl) (Reg (General SixtyFour rdi)) (Immediate SixtyFour (ImmVal 3)), 4)"
    "fetch 0x15f51 \<equiv> (Unary (IS_8088 Call) (Immediate SixtyFour (ImmLabel ''qemu_malloc'')), 5)"
    "fetch 0x15f56 \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour rsi)) (Storage (Memory SixtyFour (A_SizeDirective 64 (A_Plus (A_FromReg (General SixtyFour rbx)) (A_WordConstant 864))))), 7)"
    "fetch 0x15f5d \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour r13)) (Storage (Reg (General SixtyFour rax))), 3)"
    "fetch 0x15f60 \<equiv> (Binary (IS_8088 Test) (Reg (General SixtyFour rsi)) (Storage (Reg (General SixtyFour rsi))), 3)"
    "fetch 0x15f63 \<equiv> (Unary (IS_8088 Je) (Immediate SixtyFour (ImmVal 89999)), 2)"
    "fetch 0x15f65 \<equiv> (Binary (IS_X86_64 Movsxd) (Reg (General SixtyFour rax)) (Storage (Memory ThirtyTwo (A_SizeDirective 32 (A_Plus (A_FromReg (General SixtyFour rbx)) (A_WordConstant 860))))), 7)"
    "fetch 0x15f6c \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour rdi)) (Storage (Reg (General SixtyFour r13))), 3)"
    "fetch 0x15f6f \<equiv> (Binary (IS_8088 Lea) (Reg (General SixtyFour rdx)) (Storage (Memory SixtyFour (A_Plus (A_Mult 8 (A_FromReg (General SixtyFour rax))) (A_WordConstant 0)))), 8)"
    "fetch 0x15f77 \<equiv> (Binary (IS_8088 Sub) (Reg (General SixtyFour rdx)) (Storage (Reg (General SixtyFour rax))), 3)"
    "fetch 0x15f7a \<equiv> (Binary (IS_8088 Shl) (Reg (General SixtyFour rdx)) (Immediate SixtyFour (ImmVal 3)), 4)"
    "fetch 0x15f7e \<equiv> (Unary (IS_8088 Call) (Immediate SixtyFour (ImmLabel ''memcpy'')), 5)"
    "fetch 0x15f83 \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour rdi)) (Storage (Memory SixtyFour (A_SizeDirective 64 (A_Plus (A_FromReg (General SixtyFour rbx)) (A_WordConstant 864))))), 7)"
    "fetch 0x15f8a \<equiv> (Unary (IS_8088 Call) (Immediate SixtyFour (ImmLabel ''qemu_free'')), 5)"
    "fetch 0x15f8f \<equiv> (Binary (IS_X86_64 Movsxd) (Reg (General SixtyFour rax)) (Storage (Memory ThirtyTwo (A_SizeDirective 32 (A_Plus (A_FromReg (General SixtyFour rbx)) (A_WordConstant 860))))), 7)"
    "fetch 0x15f96 \<equiv> (Binary (IS_8088 Mov) (Memory SixtyFour (A_SizeDirective 64 (A_Plus (A_FromReg (General SixtyFour rbx)) (A_WordConstant 864)))) (Storage (Reg (General SixtyFour r13))), 7)"
    "fetch 0x15f9d \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour rdi)) (Storage (Reg (General SixtyFour r12))), 3)"
    "fetch 0x15fa0 \<equiv> (Binary (IS_SSE2_SIMD Movdqa) (Reg (SIMD OneHundredTwentyEight ymm1w3 ymm1w2 ymm1w1 ymm1w0)) (Storage (Memory OneHundredTwentyEight (A_SizeDirective 128 (A_FromReg (General SixtyFour rsp))))), 5)"
    "fetch 0x15fa5 \<equiv> (Binary (IS_SSE2_SIMD Movdqa) (Reg (SIMD OneHundredTwentyEight ymm2w3 ymm2w2 ymm2w1 ymm2w0)) (Storage (Memory OneHundredTwentyEight (A_SizeDirective 128 (A_Plus (A_FromReg (General SixtyFour rsp)) (A_WordConstant 16))))), 6)"
    "fetch 0x15fab \<equiv> (Binary (IS_8088 Lea) (Reg (General ThirtyTwo rdx)) (Storage (Memory SixtyFour (A_Plus (A_FromReg (General SixtyFour rax)) (A_WordConstant 1)))), 3)"
    "fetch 0x15fae \<equiv> (Binary (IS_SSE2_SIMD Movdqa) (Reg (SIMD OneHundredTwentyEight ymm3w3 ymm3w2 ymm3w1 ymm3w0)) (Storage (Memory OneHundredTwentyEight (A_SizeDirective 128 (A_Plus (A_FromReg (General SixtyFour rsp)) (A_WordConstant 32))))), 6)"
    "fetch 0x15fb4 \<equiv> (Binary (IS_8088 Mov) (Memory ThirtyTwo (A_SizeDirective 32 (A_Plus (A_FromReg (General SixtyFour rbx)) (A_WordConstant 860)))) (Storage (Reg (General ThirtyTwo rdx))), 6)"
    "fetch 0x15fba \<equiv> (Binary (IS_8088 Lea) (Reg (General SixtyFour rdx)) (Storage (Memory SixtyFour (A_Plus (A_Mult 8 (A_FromReg (General SixtyFour rax))) (A_WordConstant 0)))), 8)"
    "fetch 0x15fc2 \<equiv> (Binary (IS_8088 Sub) (Reg (General SixtyFour rdx)) (Storage (Reg (General SixtyFour rax))), 3)"
    "fetch 0x15fc5 \<equiv> (Binary (IS_8088 Lea) (Reg (General SixtyFour rax)) (Storage (Memory SixtyFour (A_Plus (A_FromReg (General SixtyFour r13)) (A_Plus (A_Mult 8 (A_FromReg (General SixtyFour rdx))) (A_WordConstant 0))))), 5)"
    "fetch 0x15fca \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour rdx)) (Storage (Memory SixtyFour (A_SizeDirective 64 (A_Plus (A_FromReg (General SixtyFour rsp)) (A_WordConstant 48))))), 5)"
    "fetch 0x15fcf \<equiv> (Binary (IS_SSE_SIMD Movups) (Memory OneHundredTwentyEight (A_SizeDirective 128 (A_FromReg (General SixtyFour rax)))) (Storage (Reg (SIMD OneHundredTwentyEight ymm1w3 ymm1w2 ymm1w1 ymm1w0))), 3)"
    "fetch 0x15fd2 \<equiv> (Binary (IS_8088 Mov) (Memory SixtyFour (A_SizeDirective 64 (A_Plus (A_FromReg (General SixtyFour rax)) (A_WordConstant 48)))) (Storage (Reg (General SixtyFour rdx))), 4)"
    "fetch 0x15fd6 \<equiv> (Binary (IS_SSE_SIMD Movups) (Memory OneHundredTwentyEight (A_SizeDirective 128 (A_Plus (A_FromReg (General SixtyFour rax)) (A_WordConstant 16)))) (Storage (Reg (SIMD OneHundredTwentyEight ymm2w3 ymm2w2 ymm2w1 ymm2w0))), 4)"
    "fetch 0x15fda \<equiv> (Binary (IS_SSE_SIMD Movups) (Memory OneHundredTwentyEight (A_SizeDirective 128 (A_Plus (A_FromReg (General SixtyFour rax)) (A_WordConstant 32)))) (Storage (Reg (SIMD OneHundredTwentyEight ymm3w3 ymm3w2 ymm3w1 ymm3w0))), 4)"
    "fetch 0x15fde \<equiv> (Unary (IS_8088 Call) (Immediate SixtyFour (ImmLabel ''qcow_write_snapshots'')), 5)"
    "fetch 0x15fe3 \<equiv> (Binary (IS_8088 Test) (Reg (General ThirtyTwo rax)) (Storage (Reg (General ThirtyTwo rax))), 2)"
    "fetch 0x15fe5 \<equiv> (Unary (IS_8088 Js) (Immediate SixtyFour (ImmVal 90252)), 6)"
    "fetch 0x15feb \<equiv> (Binary (IS_8088 Xor) (Reg (General ThirtyTwo rax)) (Storage (Reg (General ThirtyTwo rax))), 2)"
    "fetch 0x15fed \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour rsi)) (Storage (Memory SixtyFour (A_SizeDirective 64 (A_Plus (A_FromReg (General SixtyFour rsp)) (A_WordConstant 56))))), 5)"
    "fetch 0x15ff2 \<equiv> (Binary (IS_8088 Xor) (Reg (General SixtyFour rsi)) (Storage (Memory SixtyFour (A_SizeDirective 64 (A_Plus (A_FromReg (General SixtyFour fs)) (A_WordConstant 40))))), 9)"
    "fetch 0x15ffb \<equiv> (Unary (IS_8088 Jne) (Immediate SixtyFour (ImmVal 90299)), 6)"
    "fetch 0x16001 \<equiv> (Binary (IS_8088 Add) (Reg (General SixtyFour rsp)) (Immediate SixtyFour (ImmVal 72)), 4)"
    "fetch 0x16005 \<equiv> (Unary (IS_8088 Pop) (Storage (Reg (General SixtyFour rbx))), 1)"
    "fetch 0x16006 \<equiv> (Unary (IS_8088 Pop) (Storage (Reg (General SixtyFour rbp))), 1)"
    "fetch 0x16007 \<equiv> (Unary (IS_8088 Pop) (Storage (Reg (General SixtyFour r12))), 2)"
    "fetch 0x16009 \<equiv> (Unary (IS_8088 Pop) (Storage (Reg (General SixtyFour r13))), 2)"
    "fetch 0x1600b \<equiv> (Unary (IS_8088 Pop) (Storage (Reg (General SixtyFour r14))), 2)"
    "fetch 0x1600d \<equiv> (Unary (IS_8088 Pop) (Storage (Reg (General SixtyFour r15))), 2)"
    "fetch 0x1600f \<equiv> (Nullary (IS_8088 Ret), 1)"
    "fetch 0x16010 \<equiv> (Binary (IS_8088 Mov) (Reg (General ThirtyTwo rax)) (Storage (Memory ThirtyTwo (A_SizeDirective 32 (A_Plus (A_FromReg (General SixtyFour rbx)) (A_WordConstant 860))))), 6)"
    "fetch 0x16016 \<equiv> (Binary (IS_8088 Test) (Reg (General ThirtyTwo rax)) (Storage (Reg (General ThirtyTwo rax))), 2)"
    "fetch 0x16018 \<equiv> (Unary (IS_8088 Jle) (Immediate SixtyFour (ImmVal 90281)), 6)"
    "fetch 0x1601e \<equiv> (Binary (IS_8088 Xor) (Reg (General ThirtyTwo r15)) (Storage (Reg (General ThirtyTwo r15))), 3)"
    "fetch 0x16021 \<equiv> (Binary (IS_8088 Xor) (Reg (General ThirtyTwo rbp)) (Storage (Reg (General ThirtyTwo rbp))), 2)"
    "fetch 0x16023 \<equiv> (Binary (IS_8088 Xor) (Reg (General ThirtyTwo r14)) (Storage (Reg (General ThirtyTwo r14))), 3)"
    "fetch 0x16026 \<equiv> (Unary (IS_8088 Nop) (Storage (Memory Sixteen (A_SizeDirective 16 (A_Plus (A_FromReg (General SixtyFour cs)) (A_Plus (A_FromReg (General SixtyFour rax)) (A_Plus (A_Mult 1 (A_FromReg (General SixtyFour rax))) (A_WordConstant 0))))))), 10)"
    "fetch 0x16030 \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour rax)) (Storage (Memory SixtyFour (A_SizeDirective 64 (A_Plus (A_FromReg (General SixtyFour rbx)) (A_WordConstant 864))))), 7)"
    "fetch 0x16037 \<equiv> (Binary (IS_8088 Xor) (Reg (General ThirtyTwo rsi)) (Storage (Reg (General ThirtyTwo rsi))), 2)"
    "fetch 0x16039 \<equiv> (Binary (IS_8088 Mov) (Reg (General ThirtyTwo rdx)) (Immediate SixtyFour (ImmVal 10)), 5)"
    "fetch 0x1603e \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour rdi)) (Storage (Memory SixtyFour (A_SizeDirective 64 (A_Plus (A_FromReg (General SixtyFour rax)) (A_Plus (A_Mult 1 (A_FromReg (General SixtyFour r15))) (A_WordConstant 16)))))), 5)"
    "fetch 0x16043 \<equiv> (Unary (IS_8088 Call) (Immediate SixtyFour (ImmLabel ''strtoul'')), 5)"
    "fetch 0x16048 \<equiv> (Binary (IS_8088 Cmp) (Reg (General ThirtyTwo rbp)) (Storage (Reg (General ThirtyTwo rax))), 2)"
    "fetch 0x1604a \<equiv> (Binary (IS_PentiumPro Cmovl) (Reg (General ThirtyTwo rbp)) (Storage (Reg (General ThirtyTwo rax))), 3)"
    "fetch 0x1604d \<equiv> (Binary (IS_8088 Add) (Reg (General ThirtyTwo r14)) (Immediate SixtyFour (ImmVal 1)), 4)"
    "fetch 0x16051 \<equiv> (Binary (IS_8088 Add) (Reg (General SixtyFour r15)) (Immediate SixtyFour (ImmVal 56)), 4)"
    "fetch 0x16055 \<equiv> (Binary (IS_8088 Cmp) (Reg (General ThirtyTwo r14)) (Storage (Memory ThirtyTwo (A_SizeDirective 32 (A_Plus (A_FromReg (General SixtyFour rbx)) (A_WordConstant 860))))), 7)"
    "fetch 0x1605c \<equiv> (Unary (IS_8088 Jl) (Immediate SixtyFour (ImmVal 90160)), 2)"
    "fetch 0x1605e \<equiv> (Binary (IS_8088 Lea) (Reg (General ThirtyTwo r9)) (Storage (Memory SixtyFour (A_Plus (A_FromReg (General SixtyFour rbp)) (A_WordConstant 1)))), 4)"
    "fetch 0x16062 \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour rdi)) (Storage (Reg (General SixtyFour r13))), 3)"
    "fetch 0x16065 \<equiv> (Binary (IS_8088 Mov) (Reg (General ThirtyTwo rcx)) (Immediate SixtyFour (ImmVal 128)), 5)"
    "fetch 0x1606a \<equiv> (Binary (IS_8088 Mov) (Reg (General ThirtyTwo rdx)) (Immediate SixtyFour (ImmVal 1)), 5)"
    "fetch 0x1606f \<equiv> (Binary (IS_8088 Xor) (Reg (General ThirtyTwo rax)) (Storage (Reg (General ThirtyTwo rax))), 2)"
    "fetch 0x16071 \<equiv> (Binary (IS_8088 Lea) (Reg (General SixtyFour r8)) (Storage (Memory SixtyFour (A_Plus (A_FromReg (General SixtyFour rip)) (A_WordConstant 47466)))), 7)"
    "fetch 0x16078 \<equiv> (Binary (IS_8088 Mov) (Reg (General ThirtyTwo rsi)) (Immediate SixtyFour (ImmVal 128)), 5)"
    "fetch 0x1607d \<equiv> (Unary (IS_8088 Call) (Immediate SixtyFour (ImmLabel ''__snprintf_chk'')), 5)"
    "fetch 0x16082 \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour rdi)) (Storage (Memory SixtyFour (A_SizeDirective 64 (A_Plus (A_FromReg (General SixtyFour r12)) (A_WordConstant 64))))), 5)"
    "fetch 0x16087 \<equiv> (Unary (IS_8088 Jmp) (Immediate SixtyFour (ImmVal 89647)), 5)"
    "fetch 0x1608c \<equiv> (Binary (IS_8088 Xor) (Reg (General ThirtyTwo r13)) (Storage (Reg (General ThirtyTwo r13))), 3)"
    "fetch 0x1608f \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour rdi)) (Storage (Reg (General SixtyFour rbp))), 3)"
    "fetch 0x16092 \<equiv> (Unary (IS_8088 Call) (Immediate SixtyFour (ImmLabel ''qemu_free'')), 5)"
    "fetch 0x16097 \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour rdi)) (Storage (Reg (General SixtyFour r13))), 3)"
    "fetch 0x1609a \<equiv> (Unary (IS_8088 Call) (Immediate SixtyFour (ImmLabel ''qemu_free'')), 5)"
    "fetch 0x1609f \<equiv> (Binary (IS_8088 Mov) (Reg (General ThirtyTwo rax)) (Immediate SixtyFour (ImmVal 4294967295)), 5)"
    "fetch 0x160a4 \<equiv> (Unary (IS_8088 Jmp) (Immediate SixtyFour (ImmVal 90093)), 5)"
    "fetch 0x160a9 \<equiv> (Binary (IS_8088 Mov) (Reg (General ThirtyTwo r9)) (Immediate SixtyFour (ImmVal 1)), 6)"
    "fetch 0x160af \<equiv> (Unary (IS_8088 Jmp) (Immediate SixtyFour (ImmVal 90210)), 2)"
    "fetch 0x160b1 \<equiv> (Binary (IS_8088 Mov) (Reg (General ThirtyTwo rax)) (Immediate SixtyFour (ImmVal 4294967294)), 5)"
    "fetch 0x160b6 \<equiv> (Unary (IS_8088 Jmp) (Immediate SixtyFour (ImmVal 90093)), 5)"
    "fetch 0x160bb \<equiv> (Unary (IS_8088 Call) (Immediate SixtyFour (ImmLabel ''__stack_chk_fail'')), 5)"
    and \<alpha>_def: \<open>\<alpha> = \<lparr>text_sections = [], data_sections = [], labels_to_offsets = [], binary_offset = 0\<rparr>\<close>
    and snprintf_chk\<^sub>a\<^sub>d\<^sub>d\<^sub>r[simp]: \<open>the (label_to_address \<alpha> ''__snprintf_chk'') = snprintf_chk_addr\<close>
    and stack_chk_fail\<^sub>a\<^sub>d\<^sub>d\<^sub>r[simp]: \<open>the (label_to_address \<alpha> ''__stack_chk_fail'') = stack_chk_fail_addr\<close>
    and alloc_clusters\<^sub>a\<^sub>d\<^sub>d\<^sub>r[simp]: \<open>the (label_to_address \<alpha> ''alloc_clusters'') = alloc_clusters_addr\<close>
    and bdrv_pwrite\<^sub>a\<^sub>d\<^sub>d\<^sub>r[simp]: \<open>the (label_to_address \<alpha> ''bdrv_pwrite'') = bdrv_pwrite_addr\<close>
    and find_snapshot_by_id_isra_8\<^sub>a\<^sub>d\<^sub>d\<^sub>r[simp]: \<open>the (label_to_address \<alpha> ''find_snapshot_by_id.isra.8'') = find_snapshot_by_id_isra_8_addr\<close>
    and memcpy\<^sub>a\<^sub>d\<^sub>d\<^sub>r[simp]: \<open>the (label_to_address \<alpha> ''memcpy'') = memcpy_addr\<close>
    and qcow_write_snapshots\<^sub>a\<^sub>d\<^sub>d\<^sub>r[simp]: \<open>the (label_to_address \<alpha> ''qcow_write_snapshots'') = qcow_write_snapshots_addr\<close>
    and qemu_free\<^sub>a\<^sub>d\<^sub>d\<^sub>r[simp]: \<open>the (label_to_address \<alpha> ''qemu_free'') = qemu_free_addr\<close>
    and qemu_malloc\<^sub>a\<^sub>d\<^sub>d\<^sub>r[simp]: \<open>the (label_to_address \<alpha> ''qemu_malloc'') = qemu_malloc_addr\<close>
    and qemu_strdup\<^sub>a\<^sub>d\<^sub>d\<^sub>r[simp]: \<open>the (label_to_address \<alpha> ''qemu_strdup'') = qemu_strdup_addr\<close>
    and strtoul\<^sub>a\<^sub>d\<^sub>d\<^sub>r[simp]: \<open>the (label_to_address \<alpha> ''strtoul'') = strtoul_addr\<close>
    and update_snapshot_refcount\<^sub>a\<^sub>d\<^sub>d\<^sub>r[simp]: \<open>the (label_to_address \<alpha> ''update_snapshot_refcount'') = update_snapshot_refcount_addr\<close>
begin

text \<open>Using definitions that don't get unfolded immediately prevents locale argument issues.\<close>
definition \<open>find_snapshot_by_id_isra_8_0x15e32_retval \<equiv> find_snapshot_by_id_isra_8_0x15e32_retval\<^sub>v\<close>
definition \<open>qemu_strdup_0x15e42_retval \<equiv> qemu_strdup_0x15e42_retval\<^sub>v\<close>
definition \<open>qemu_strdup_0x15e5f_retval \<equiv> qemu_strdup_0x15e5f_retval\<^sub>v\<close>
definition \<open>update_snapshot_refcount_0x15ea7_retval \<equiv> update_snapshot_refcount_0x15ea7_retval\<^sub>v\<close>
definition \<open>alloc_clusters_0x15ebf_retval \<equiv> alloc_clusters_0x15ebf_retval\<^sub>v\<close>
definition \<open>qemu_malloc_0x15ed7_retval \<equiv> qemu_malloc_0x15ed7_retval\<^sub>v\<close>
definition \<open>bdrv_pwrite_0x15f17_retval \<equiv> bdrv_pwrite_0x15f17_retval\<^sub>v\<close>
definition \<open>qemu_free_0x15f32_retval \<equiv> qemu_free_0x15f32_retval\<^sub>v\<close>
definition \<open>qemu_malloc_0x15f51_retval \<equiv> qemu_malloc_0x15f51_retval\<^sub>v\<close>
definition \<open>memcpy_0x15f7e_retval \<equiv> memcpy_0x15f7e_retval\<^sub>v\<close>
definition \<open>qemu_free_0x15f8a_retval \<equiv> qemu_free_0x15f8a_retval\<^sub>v\<close>
definition \<open>qcow_write_snapshots_0x15fde_retval \<equiv> qcow_write_snapshots_0x15fde_retval\<^sub>v\<close>
definition \<open>strtoul_0x16043_retval \<equiv> strtoul_0x16043_retval\<^sub>v\<close>
definition \<open>snprintf_chk_0x1607d_retval \<equiv> snprintf_chk_0x1607d_retval\<^sub>v\<close>
definition \<open>qemu_free_0x16092_retval \<equiv> qemu_free_0x16092_retval\<^sub>v\<close>
definition \<open>qemu_free_0x1609a_retval \<equiv> qemu_free_0x1609a_retval\<^sub>v\<close>
definition \<open>stack_chk_fail_0x160bb_retval \<equiv> stack_chk_fail_0x160bb_retval\<^sub>v\<close>

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
  auto simp add: simp_rules Let'_def read_region'_def write_block'_def get'_def set'_def step_def exec_instr_def presimplify add numeral_2_eq_2[symmetric] simp del: del

method steps uses pre post regionset add del =
  auto simp: pred_logic pre regionset,
  (step add: add del: del)+,
  (auto simp add: eq_def)[1],
  auto simp: block_usage_def eq_def setcc_def cmovcc_def if'_then_else_def sub_sign_flag_def simp_rules numeral_2_eq_2[symmetric] Let'_def read_region'_def write_block'_def get'_def set'_def post regionset

(* ((simp add: assms pred_logic Ps Qs)+)? helps keep goals clean but causes issues when there are subcalls *)
method vcg_step uses assms =
  ((rule htriples)+, rule blocks)+,
  (simp add: assms pred_logic Ps Qs)?,
  (((auto simp: eq_def)[])+)?

text \<open>For @{const CASES}.\<close>
method vcg_step' uses assms =
  (rule htriples)+,
  simp,
  ((rule htriples)+, rule blocks)+,
  (simp add: assms pred_logic Ps Qs)?,
  (((auto simp: eq_def)[])+)?

text \<open>
  Sometimes needs to be moved down (close to the abstract code) to avoid TERM exceptions,
  haven't figured out the cause.
  Also haven't settled on a proper setup for the ending methods,
  there are troubles when nested loops and such are involved.
\<close>
method vcg_while for P :: state_pred uses assms =
  ((rule htriples)+)?,
  rule HTriple_weaken[where P=P],
  simp add: pred_logic Ps Qs assms,
  rule HTriple_while,
  (vcg_step assms: assms)+,
  (simp add: pred_logic Ps Qs)+,
  (
    (vcg_step' assms: assms | vcg_step assms: assms)+,
    ((simp add: assms)+)?
  )

method vcg uses acode assms =
  subst acode,
  (vcg_step assms: assms)+

end

locale "qcow_snapshot_create" = "qemu_img_xen" +
  fixes RAX\<^sub>0\<^sub>v RBX\<^sub>0\<^sub>v RCX\<^sub>0\<^sub>v RDX\<^sub>0\<^sub>v RDI\<^sub>0\<^sub>v RSI\<^sub>0\<^sub>v RSP\<^sub>0\<^sub>v RBP\<^sub>0\<^sub>v R15\<^sub>0\<^sub>v R14\<^sub>0\<^sub>v R13\<^sub>0\<^sub>v R12\<^sub>0\<^sub>v R9\<^sub>0\<^sub>v R8\<^sub>0\<^sub>v FS\<^sub>0\<^sub>v ymm0w0\<^sub>0\<^sub>v ymm0w1\<^sub>0\<^sub>v ymm1w0\<^sub>0\<^sub>v ymm1w1\<^sub>0\<^sub>v ymm2w0\<^sub>0\<^sub>v ymm2w1\<^sub>0\<^sub>v ymm3w0\<^sub>0\<^sub>v ymm3w1\<^sub>0\<^sub>v ret_address\<^sub>v :: \<open>64 word\<close>
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
definition \<open>FS\<^sub>0 \<equiv> FS\<^sub>0\<^sub>v\<close>
definition \<open>ymm0w0\<^sub>0 \<equiv> ymm0w0\<^sub>0\<^sub>v\<close>
definition \<open>ymm0w1\<^sub>0 \<equiv> ymm0w1\<^sub>0\<^sub>v\<close>
definition \<open>ymm1w0\<^sub>0 \<equiv> ymm1w0\<^sub>0\<^sub>v\<close>
definition \<open>ymm1w1\<^sub>0 \<equiv> ymm1w1\<^sub>0\<^sub>v\<close>
definition \<open>ymm2w0\<^sub>0 \<equiv> ymm2w0\<^sub>0\<^sub>v\<close>
definition \<open>ymm2w1\<^sub>0 \<equiv> ymm2w1\<^sub>0\<^sub>v\<close>
definition \<open>ymm3w0\<^sub>0 \<equiv> ymm3w0\<^sub>0\<^sub>v\<close>
definition \<open>ymm3w1\<^sub>0 \<equiv> ymm3w1\<^sub>0\<^sub>v\<close>
definition \<open>ret_address \<equiv> ret_address\<^sub>v\<close>

definition P_0x15de0_0 :: state_pred where
  \<open>P_0x15de0_0 \<sigma> \<equiv> RIP \<sigma> = 0x15de0 \<and> RAX \<sigma> = RAX\<^sub>0 \<and> RBX \<sigma> = RBX\<^sub>0 \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = RDX\<^sub>0 \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = RSP\<^sub>0 \<and> RBP \<sigma> = RBP\<^sub>0 \<and> R15 \<sigma> = R15\<^sub>0 \<and> R14 \<sigma> = R14\<^sub>0 \<and> R13 \<sigma> = R13\<^sub>0 \<and> R12 \<sigma> = R12\<^sub>0 \<and> R9 \<sigma> = R9\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> regs \<sigma> ymm0w1 = ymm0w1\<^sub>0 \<and> regs \<sigma> ymm0w0 = ymm0w0\<^sub>0 \<and> regs \<sigma> ymm1w1 = ymm1w1\<^sub>0 \<and> regs \<sigma> ymm1w0 = ymm1w0\<^sub>0 \<and> regs \<sigma> ymm2w1 = ymm2w1\<^sub>0 \<and> regs \<sigma> ymm2w0 = ymm2w0\<^sub>0 \<and> regs \<sigma> ymm3w1 = ymm3w1\<^sub>0 \<and> regs \<sigma> ymm3w0 = ymm3w0\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address\<close>
declare P_0x15de0_0_def[Ps]

definition P_0x15de0_0_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x15de0_0_regions_set \<sigma> \<equiv> {
    (0, RSI\<^sub>0, Suc 0),
    (1, RSP\<^sub>0, 8),
    (2, ((FS\<^sub>0::64 word) + 0x28), 8),
    (3, ((RDI\<^sub>0::64 word) + 0x40), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x40), 8),
    (11, ((RSP\<^sub>0::64 word) - 0x48), 8),
    (12, ((RSP\<^sub>0::64 word) - 0x50), 8),
    (13, ((RSP\<^sub>0::64 word) - 0x58), 8),
    (14, ((RSP\<^sub>0::64 word) - 0x60), 8),
    (15, ((RSP\<^sub>0::64 word) - 0x68), 8),
    (16, ((RSP\<^sub>0::64 word) - 0x70), 8),
    (17, ((RSP\<^sub>0::64 word) - 0x78), 8)
  }\<close>

definition P_0x15de0_0_regions :: state_pred where
  \<open>P_0x15de0_0_regions \<sigma> \<equiv> \<exists>regions. P_0x15de0_0_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x15e29_0 :: state_pred where
  \<open>Q_0x15e29_0 \<sigma> \<equiv> RIP \<sigma> = 0x15e29 \<and> RAX \<sigma> = 0x0 \<and> RBX \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = RDX\<^sub>0 \<and> RDI \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x78) \<and> RBP \<sigma> = RBP\<^sub>0 \<and> R15 \<sigma> = R15\<^sub>0 \<and> R14 \<sigma> = R14\<^sub>0 \<and> R13 \<sigma> = RSI\<^sub>0 \<and> R12 \<sigma> = RDI\<^sub>0 \<and> R9 \<sigma> = R9\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> regs \<sigma> ymm0w1 = 0x0 \<and> regs \<sigma> ymm0w0 = 0x0 \<and> regs \<sigma> ymm1w1 = ymm1w1\<^sub>0 \<and> regs \<sigma> ymm1w0 = ymm1w0\<^sub>0 \<and> regs \<sigma> ymm2w1 = ymm2w1\<^sub>0 \<and> regs \<sigma> ymm2w0 = ymm2w0\<^sub>0 \<and> regs \<sigma> ymm3w1 = ymm3w1\<^sub>0 \<and> regs \<sigma> ymm3w0 = ymm3w0\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word) = ucast ((\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x48),8]::64 word) = 0x0 \<and> (\<sigma> \<turnstile> *[((((RSP\<^sub>0::64 word) - 0x58)::64 word) + 0x8),8]::64 word) = 0x0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),8]::64 word) = 0x0 \<and> (\<sigma> \<turnstile> *[((((RSP\<^sub>0::64 word) - 0x68)::64 word) + 0x8),8]::64 word) = 0x0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),8]::64 word) = 0x0 \<and> (\<sigma> \<turnstile> *[((((RSP\<^sub>0::64 word) - 0x78)::64 word) + 0x8),8]::64 word) = 0x0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x78),8]::64 word) = 0x0\<close>
declare Q_0x15e29_0_def[Qs]

schematic_goal qcow_snapshot_create_0_20_0x15de0_0x15e20_0[blocks]:
  assumes \<open>(P_0x15de0_0 && P_0x15de0_0_regions) \<sigma>\<close>
  shows \<open>exec_block 20 0x15e20 0 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x15e29_0 ?\<sigma> \<and> block_usage P_0x15de0_0_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x15de0_0_def P_0x15de0_0_regions_def post: Q_0x15e29_0_def regionset: P_0x15de0_0_regions_set_def)

definition P_0x15e29_true_1 :: state_pred where
  \<open>P_0x15e29_true_1 \<sigma> \<equiv> RIP \<sigma> = 0x15e29 \<and> RAX \<sigma> = 0x0 \<and> RBX \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = RDX\<^sub>0 \<and> RDI \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x78) \<and> RBP \<sigma> = RBP\<^sub>0 \<and> R15 \<sigma> = R15\<^sub>0 \<and> R14 \<sigma> = R14\<^sub>0 \<and> R13 \<sigma> = RSI\<^sub>0 \<and> R12 \<sigma> = RDI\<^sub>0 \<and> R9 \<sigma> = R9\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> regs \<sigma> ymm0w1 = 0x0 \<and> regs \<sigma> ymm0w0 = 0x0 \<and> regs \<sigma> ymm1w1 = ymm1w1\<^sub>0 \<and> regs \<sigma> ymm1w0 = ymm1w0\<^sub>0 \<and> regs \<sigma> ymm2w1 = ymm2w1\<^sub>0 \<and> regs \<sigma> ymm2w0 = ymm2w0\<^sub>0 \<and> regs \<sigma> ymm3w1 = ymm3w1\<^sub>0 \<and> regs \<sigma> ymm3w0 = ymm3w0\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word) = ucast ((\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x48),8]::64 word) = 0x0 \<and> (\<sigma> \<turnstile> *[((((RSP\<^sub>0::64 word) - 0x58)::64 word) + 0x8),8]::64 word) = 0x0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),8]::64 word) = 0x0 \<and> (\<sigma> \<turnstile> *[((((RSP\<^sub>0::64 word) - 0x68)::64 word) + 0x8),8]::64 word) = 0x0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),8]::64 word) = 0x0 \<and> (\<sigma> \<turnstile> *[((((RSP\<^sub>0::64 word) - 0x78)::64 word) + 0x8),8]::64 word) = 0x0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x78),8]::64 word) = 0x0\<close>
declare P_0x15e29_true_1_def[Ps]

definition P_0x15e29_true_1_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x15e29_true_1_regions_set \<sigma> \<equiv> {
    (0, RSI\<^sub>0, Suc 0),
    (1, RSP\<^sub>0, 8),
    (2, ((FS\<^sub>0::64 word) + 0x28), 8),
    (3, ((RDI\<^sub>0::64 word) + 0x40), 8),
    (4, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x35c), 4),
    (5, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (11, ((RSP\<^sub>0::64 word) - 0x40), 8),
    (12, ((RSP\<^sub>0::64 word) - 0x48), 8),
    (13, ((RSP\<^sub>0::64 word) - 0x50), 8),
    (14, ((RSP\<^sub>0::64 word) - 0x58), 8),
    (15, ((RSP\<^sub>0::64 word) - 0x60), 8),
    (16, ((RSP\<^sub>0::64 word) - 0x68), 8),
    (17, ((RSP\<^sub>0::64 word) - 0x70), 8),
    (18, ((RSP\<^sub>0::64 word) - 0x78), 8)
  }\<close>

definition P_0x15e29_true_1_regions :: state_pred where
  \<open>P_0x15e29_true_1_regions \<sigma> \<equiv> \<exists>regions. P_0x15e29_true_1_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x16018_1 :: state_pred where
  \<open>Q_0x16018_1 \<sigma> \<equiv> RIP \<sigma> = 0x16018 \<and> RAX \<sigma> = ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x35c),4]::32 word)) \<and> RBX \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = RDX\<^sub>0 \<and> RDI \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x78) \<and> RBP \<sigma> = RBP\<^sub>0 \<and> R15 \<sigma> = R15\<^sub>0 \<and> R14 \<sigma> = R14\<^sub>0 \<and> R13 \<sigma> = RSI\<^sub>0 \<and> R12 \<sigma> = RDI\<^sub>0 \<and> R9 \<sigma> = R9\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> regs \<sigma> ymm0w1 = 0x0 \<and> regs \<sigma> ymm0w0 = 0x0 \<and> regs \<sigma> ymm1w1 = ymm1w1\<^sub>0 \<and> regs \<sigma> ymm1w0 = ymm1w0\<^sub>0 \<and> regs \<sigma> ymm2w1 = ymm2w1\<^sub>0 \<and> regs \<sigma> ymm2w0 = ymm2w0\<^sub>0 \<and> regs \<sigma> ymm3w1 = ymm3w1\<^sub>0 \<and> regs \<sigma> ymm3w0 = ymm3w0\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word) = ucast ((\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x35c),4]::32 word) = ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x35c),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x48),8]::64 word) = 0x0 \<and> (\<sigma> \<turnstile> *[((((RSP\<^sub>0::64 word) - 0x58)::64 word) + 0x8),8]::64 word) = 0x0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),8]::64 word) = 0x0 \<and> (\<sigma> \<turnstile> *[((((RSP\<^sub>0::64 word) - 0x68)::64 word) + 0x8),8]::64 word) = 0x0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),8]::64 word) = 0x0 \<and> (\<sigma> \<turnstile> *[((((RSP\<^sub>0::64 word) - 0x78)::64 word) + 0x8),8]::64 word) = 0x0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x78),8]::64 word) = 0x0\<close>
declare Q_0x16018_1_def[Qs]

schematic_goal qcow_snapshot_create_0_3_0x15e29_0x16016_1[blocks]:
  assumes \<open>(P_0x15e29_true_1 && P_0x15e29_true_1_regions && ZF) \<sigma>\<close>
  shows \<open>exec_block 3 0x16016 (Suc 0) \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x16018_1 ?\<sigma> \<and> block_usage P_0x15e29_true_1_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x15e29_true_1_def P_0x15e29_true_1_regions_def post: Q_0x16018_1_def regionset: P_0x15e29_true_1_regions_set_def)

definition P_0x16018_true_2 :: state_pred where
  \<open>P_0x16018_true_2 \<sigma> \<equiv> RIP \<sigma> = 0x16018 \<and> RAX \<sigma> = ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x35c),4]::32 word)) \<and> RBX \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = RDX\<^sub>0 \<and> RDI \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x78) \<and> RBP \<sigma> = RBP\<^sub>0 \<and> R15 \<sigma> = R15\<^sub>0 \<and> R14 \<sigma> = R14\<^sub>0 \<and> R13 \<sigma> = RSI\<^sub>0 \<and> R12 \<sigma> = RDI\<^sub>0 \<and> R9 \<sigma> = R9\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> regs \<sigma> ymm0w1 = 0x0 \<and> regs \<sigma> ymm0w0 = 0x0 \<and> regs \<sigma> ymm1w1 = ymm1w1\<^sub>0 \<and> regs \<sigma> ymm1w0 = ymm1w0\<^sub>0 \<and> regs \<sigma> ymm2w1 = ymm2w1\<^sub>0 \<and> regs \<sigma> ymm2w0 = ymm2w0\<^sub>0 \<and> regs \<sigma> ymm3w1 = ymm3w1\<^sub>0 \<and> regs \<sigma> ymm3w0 = ymm3w0\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word) = ucast ((\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x35c),4]::32 word) = ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x35c),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x48),8]::64 word) = 0x0 \<and> (\<sigma> \<turnstile> *[((((RSP\<^sub>0::64 word) - 0x58)::64 word) + 0x8),8]::64 word) = 0x0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),8]::64 word) = 0x0 \<and> (\<sigma> \<turnstile> *[((((RSP\<^sub>0::64 word) - 0x68)::64 word) + 0x8),8]::64 word) = 0x0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),8]::64 word) = 0x0 \<and> (\<sigma> \<turnstile> *[((((RSP\<^sub>0::64 word) - 0x78)::64 word) + 0x8),8]::64 word) = 0x0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x78),8]::64 word) = 0x0\<close>
declare P_0x16018_true_2_def[Ps]

definition P_0x16018_true_2_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x16018_true_2_regions_set \<sigma> \<equiv> {
    (0, RSI\<^sub>0, Suc 0),
    (1, RSP\<^sub>0, 8),
    (2, ((FS\<^sub>0::64 word) + 0x28), 8),
    (3, ((RDI\<^sub>0::64 word) + 0x40), 8),
    (4, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x35c), 4),
    (5, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (11, ((RSP\<^sub>0::64 word) - 0x40), 8),
    (12, ((RSP\<^sub>0::64 word) - 0x48), 8),
    (13, ((RSP\<^sub>0::64 word) - 0x50), 8),
    (14, ((RSP\<^sub>0::64 word) - 0x58), 8),
    (15, ((RSP\<^sub>0::64 word) - 0x60), 8),
    (16, ((RSP\<^sub>0::64 word) - 0x68), 8),
    (17, ((RSP\<^sub>0::64 word) - 0x70), 8),
    (18, ((RSP\<^sub>0::64 word) - 0x78), 8)
  }\<close>

definition P_0x16018_true_2_regions :: state_pred where
  \<open>P_0x16018_true_2_regions \<sigma> \<equiv> \<exists>regions. P_0x16018_true_2_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x16062_2 :: state_pred where
  \<open>Q_0x16062_2 \<sigma> \<equiv> RIP \<sigma> = 0x16062 \<and> RBX \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x78) \<and> R13 \<sigma> = RSI\<^sub>0 \<and> R12 \<sigma> = RDI\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> regs \<sigma> ymm0w1 = 0x0 \<and> regs \<sigma> ymm0w0 = 0x0 \<and> regs \<sigma> ymm1w1 = ymm1w1\<^sub>0 \<and> regs \<sigma> ymm1w0 = ymm1w0\<^sub>0 \<and> regs \<sigma> ymm2w1 = ymm2w1\<^sub>0 \<and> regs \<sigma> ymm2w0 = ymm2w0\<^sub>0 \<and> regs \<sigma> ymm3w1 = ymm3w1\<^sub>0 \<and> regs \<sigma> ymm3w0 = ymm3w0\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word) = ucast ((\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x35c),4]::32 word) = ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x35c),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x48),8]::64 word) = 0x0 \<and> (\<sigma> \<turnstile> *[((((RSP\<^sub>0::64 word) - 0x58)::64 word) + 0x8),8]::64 word) = 0x0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),8]::64 word) = 0x0 \<and> (\<sigma> \<turnstile> *[((((RSP\<^sub>0::64 word) - 0x68)::64 word) + 0x8),8]::64 word) = 0x0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),8]::64 word) = 0x0 \<and> (\<sigma> \<turnstile> *[((((RSP\<^sub>0::64 word) - 0x78)::64 word) + 0x8),8]::64 word) = 0x0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x78),8]::64 word) = 0x0\<close>
declare Q_0x16062_2_def[Qs]

schematic_goal qcow_snapshot_create_0_3_0x16018_0x160af_2[blocks]:
  assumes \<open>(P_0x16018_true_2 && P_0x16018_true_2_regions && jle) \<sigma>\<close>
  shows \<open>exec_block 3 0x160af 2 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x16062_2 ?\<sigma> \<and> block_usage P_0x16018_true_2_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x16018_true_2_def P_0x16018_true_2_regions_def post: Q_0x16062_2_def regionset: P_0x16018_true_2_regions_set_def)

definition P_0x16018_false_3 :: state_pred where
  \<open>P_0x16018_false_3 \<sigma> \<equiv> RIP \<sigma> = 0x16018 \<and> RAX \<sigma> = ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x35c),4]::32 word)) \<and> RBX \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = RDX\<^sub>0 \<and> RDI \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x78) \<and> RBP \<sigma> = RBP\<^sub>0 \<and> R15 \<sigma> = R15\<^sub>0 \<and> R14 \<sigma> = R14\<^sub>0 \<and> R13 \<sigma> = RSI\<^sub>0 \<and> R12 \<sigma> = RDI\<^sub>0 \<and> R9 \<sigma> = R9\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> regs \<sigma> ymm0w1 = 0x0 \<and> regs \<sigma> ymm0w0 = 0x0 \<and> regs \<sigma> ymm1w1 = ymm1w1\<^sub>0 \<and> regs \<sigma> ymm1w0 = ymm1w0\<^sub>0 \<and> regs \<sigma> ymm2w1 = ymm2w1\<^sub>0 \<and> regs \<sigma> ymm2w0 = ymm2w0\<^sub>0 \<and> regs \<sigma> ymm3w1 = ymm3w1\<^sub>0 \<and> regs \<sigma> ymm3w0 = ymm3w0\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word) = ucast ((\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x35c),4]::32 word) = ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x35c),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x48),8]::64 word) = 0x0 \<and> (\<sigma> \<turnstile> *[((((RSP\<^sub>0::64 word) - 0x58)::64 word) + 0x8),8]::64 word) = 0x0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),8]::64 word) = 0x0 \<and> (\<sigma> \<turnstile> *[((((RSP\<^sub>0::64 word) - 0x68)::64 word) + 0x8),8]::64 word) = 0x0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),8]::64 word) = 0x0 \<and> (\<sigma> \<turnstile> *[((((RSP\<^sub>0::64 word) - 0x78)::64 word) + 0x8),8]::64 word) = 0x0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x78),8]::64 word) = 0x0\<close>
declare P_0x16018_false_3_def[Ps]

definition P_0x16018_false_3_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x16018_false_3_regions_set \<sigma> \<equiv> {
    (0, RSI\<^sub>0, Suc 0),
    (1, RSP\<^sub>0, 8),
    (2, ((FS\<^sub>0::64 word) + 0x28), 8),
    (3, ((RDI\<^sub>0::64 word) + 0x40), 8),
    (4, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x35c), 4),
    (5, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (11, ((RSP\<^sub>0::64 word) - 0x40), 8),
    (12, ((RSP\<^sub>0::64 word) - 0x48), 8),
    (13, ((RSP\<^sub>0::64 word) - 0x50), 8),
    (14, ((RSP\<^sub>0::64 word) - 0x58), 8),
    (15, ((RSP\<^sub>0::64 word) - 0x60), 8),
    (16, ((RSP\<^sub>0::64 word) - 0x68), 8),
    (17, ((RSP\<^sub>0::64 word) - 0x70), 8),
    (18, ((RSP\<^sub>0::64 word) - 0x78), 8)
  }\<close>

definition P_0x16018_false_3_regions :: state_pred where
  \<open>P_0x16018_false_3_regions \<sigma> \<equiv> \<exists>regions. P_0x16018_false_3_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x16030_3 :: state_pred where
  \<open>Q_0x16030_3 \<sigma> \<equiv> RIP \<sigma> = 0x16030 \<and> RBX \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x78) \<and> R13 \<sigma> = RSI\<^sub>0 \<and> R12 \<sigma> = RDI\<^sub>0 \<and> R9 \<sigma> = R9\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> regs \<sigma> ymm0w1 = 0x0 \<and> regs \<sigma> ymm0w0 = 0x0 \<and> regs \<sigma> ymm1w1 = ymm1w1\<^sub>0 \<and> regs \<sigma> ymm1w0 = ymm1w0\<^sub>0 \<and> regs \<sigma> ymm2w1 = ymm2w1\<^sub>0 \<and> regs \<sigma> ymm2w0 = ymm2w0\<^sub>0 \<and> regs \<sigma> ymm3w1 = ymm3w1\<^sub>0 \<and> regs \<sigma> ymm3w0 = ymm3w0\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word) = ucast ((\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x35c),4]::32 word) = ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x35c),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x48),8]::64 word) = 0x0 \<and> (\<sigma> \<turnstile> *[((((RSP\<^sub>0::64 word) - 0x58)::64 word) + 0x8),8]::64 word) = 0x0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),8]::64 word) = 0x0 \<and> (\<sigma> \<turnstile> *[((((RSP\<^sub>0::64 word) - 0x68)::64 word) + 0x8),8]::64 word) = 0x0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),8]::64 word) = 0x0 \<and> (\<sigma> \<turnstile> *[((((RSP\<^sub>0::64 word) - 0x78)::64 word) + 0x8),8]::64 word) = 0x0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x78),8]::64 word) = 0x0\<close>
declare Q_0x16030_3_def[Qs]

schematic_goal qcow_snapshot_create_0_5_0x16018_0x16026_3[blocks]:
  assumes \<open>(P_0x16018_false_3 && P_0x16018_false_3_regions && ! jle) \<sigma>\<close>
  shows \<open>exec_block 5 0x16026 3 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x16030_3 ?\<sigma> \<and> block_usage P_0x16018_false_3_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x16018_false_3_def P_0x16018_false_3_regions_def post: Q_0x16030_3_def regionset: P_0x16018_false_3_regions_set_def)

definition P_0x16030_4 :: state_pred where
  \<open>P_0x16030_4 \<sigma> \<equiv> RIP \<sigma> = 0x16030 \<and> RBX \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x78) \<and> R13 \<sigma> = RSI\<^sub>0 \<and> R12 \<sigma> = RDI\<^sub>0 \<and> R9 \<sigma> = R9\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> regs \<sigma> ymm0w1 = 0x0 \<and> regs \<sigma> ymm0w0 = 0x0 \<and> regs \<sigma> ymm1w1 = ymm1w1\<^sub>0 \<and> regs \<sigma> ymm1w0 = ymm1w0\<^sub>0 \<and> regs \<sigma> ymm2w1 = ymm2w1\<^sub>0 \<and> regs \<sigma> ymm2w0 = ymm2w0\<^sub>0 \<and> regs \<sigma> ymm3w1 = ymm3w1\<^sub>0 \<and> regs \<sigma> ymm3w0 = ymm3w0\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word) = ucast ((\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x35c),4]::32 word) = ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x35c),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x48),8]::64 word) = 0x0 \<and> (\<sigma> \<turnstile> *[((((RSP\<^sub>0::64 word) - 0x58)::64 word) + 0x8),8]::64 word) = 0x0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),8]::64 word) = 0x0 \<and> (\<sigma> \<turnstile> *[((((RSP\<^sub>0::64 word) - 0x68)::64 word) + 0x8),8]::64 word) = 0x0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),8]::64 word) = 0x0 \<and> (\<sigma> \<turnstile> *[((((RSP\<^sub>0::64 word) - 0x78)::64 word) + 0x8),8]::64 word) = 0x0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x78),8]::64 word) = 0x0\<close>
declare P_0x16030_4_def[Ps]

definition P_0x16030_4_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x16030_4_regions_set \<sigma> \<equiv> {
    (0, RSI\<^sub>0, Suc 0),
    (1, RSP\<^sub>0, 8),
    (2, ((FS\<^sub>0::64 word) + 0x28), 8),
    (3, ((RDI\<^sub>0::64 word) + 0x40), 8),
    (4, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x35c), 4),
    (5, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x360), 8),
    (6, (((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x360),8]::64 word)::64 word) + (((\<langle>63,0\<rangle>((R15 \<sigma>::64 word) * 0x1)::64 word)::64 word) + 0x10)), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (11, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (12, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (13, ((RSP\<^sub>0::64 word) - 0x40), 8),
    (14, ((RSP\<^sub>0::64 word) - 0x48), 8),
    (15, ((RSP\<^sub>0::64 word) - 0x50), 8),
    (16, ((RSP\<^sub>0::64 word) - 0x58), 8),
    (17, ((RSP\<^sub>0::64 word) - 0x60), 8),
    (18, ((RSP\<^sub>0::64 word) - 0x68), 8),
    (19, ((RSP\<^sub>0::64 word) - 0x70), 8),
    (20, ((RSP\<^sub>0::64 word) - 0x78), 8)
  }\<close>

definition P_0x16030_4_regions :: state_pred where
  \<open>P_0x16030_4_regions \<sigma> \<equiv> \<exists>regions. P_0x16030_4_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x16043_4 :: state_pred where
  \<open>Q_0x16043_4 \<sigma> \<equiv> RIP \<sigma> = 0x16043 \<and> RAX \<sigma> = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x360),8]::64 word) \<and> RBX \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = 0xa \<and> RDI \<sigma> = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x360),8]::64 word)::64 word) + (((\<langle>63,0\<rangle>((R15 \<sigma>::64 word) * 0x1)::64 word)::64 word) + 0x10)),8]::64 word) \<and> RSI \<sigma> = 0x0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x78) \<and> R13 \<sigma> = RSI\<^sub>0 \<and> R12 \<sigma> = RDI\<^sub>0 \<and> R9 \<sigma> = R9\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> regs \<sigma> ymm0w1 = 0x0 \<and> regs \<sigma> ymm0w0 = 0x0 \<and> regs \<sigma> ymm1w1 = ymm1w1\<^sub>0 \<and> regs \<sigma> ymm1w0 = ymm1w0\<^sub>0 \<and> regs \<sigma> ymm2w1 = ymm2w1\<^sub>0 \<and> regs \<sigma> ymm2w0 = ymm2w0\<^sub>0 \<and> regs \<sigma> ymm3w1 = ymm3w1\<^sub>0 \<and> regs \<sigma> ymm3w0 = ymm3w0\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word) = ucast ((\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x35c),4]::32 word) = ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x35c),4]::32 word)) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x360),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x360),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x360),8]::64 word)::64 word) + (((\<langle>63,0\<rangle>((R15 \<sigma>::64 word) * 0x1)::64 word)::64 word) + 0x10)),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x360),8]::64 word)::64 word) + (((\<langle>63,0\<rangle>((R15 \<sigma>::64 word) * 0x1)::64 word)::64 word) + 0x10)),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x48),8]::64 word) = 0x0 \<and> (\<sigma> \<turnstile> *[((((RSP\<^sub>0::64 word) - 0x58)::64 word) + 0x8),8]::64 word) = 0x0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),8]::64 word) = 0x0 \<and> (\<sigma> \<turnstile> *[((((RSP\<^sub>0::64 word) - 0x68)::64 word) + 0x8),8]::64 word) = 0x0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),8]::64 word) = 0x0 \<and> (\<sigma> \<turnstile> *[((((RSP\<^sub>0::64 word) - 0x78)::64 word) + 0x8),8]::64 word) = 0x0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x78),8]::64 word) = 0x0\<close>
declare Q_0x16043_4_def[Qs]

schematic_goal qcow_snapshot_create_0_4_0x16030_0x1603e_4[blocks]:
  assumes \<open>(P_0x16030_4 && P_0x16030_4_regions) \<sigma>\<close>
  shows \<open>exec_block 4 0x1603e 4 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x16043_4 ?\<sigma> \<and> block_usage P_0x16030_4_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x16030_4_def P_0x16030_4_regions_def post: Q_0x16043_4_def regionset: P_0x16030_4_regions_set_def)

definition P_0x16043_5 :: state_pred where
  \<open>P_0x16043_5 \<sigma> \<equiv> RIP \<sigma> = 0x16043 \<and> RAX \<sigma> = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x360),8]::64 word) \<and> RBX \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = 0xa \<and> RDI \<sigma> = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x360),8]::64 word)::64 word) + (((\<langle>63,0\<rangle>((R15 \<sigma>::64 word) * 0x1)::64 word)::64 word) + 0x10)),8]::64 word) \<and> RSI \<sigma> = 0x0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x78) \<and> R13 \<sigma> = RSI\<^sub>0 \<and> R12 \<sigma> = RDI\<^sub>0 \<and> R9 \<sigma> = R9\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> regs \<sigma> ymm0w1 = 0x0 \<and> regs \<sigma> ymm0w0 = 0x0 \<and> regs \<sigma> ymm1w1 = ymm1w1\<^sub>0 \<and> regs \<sigma> ymm1w0 = ymm1w0\<^sub>0 \<and> regs \<sigma> ymm2w1 = ymm2w1\<^sub>0 \<and> regs \<sigma> ymm2w0 = ymm2w0\<^sub>0 \<and> regs \<sigma> ymm3w1 = ymm3w1\<^sub>0 \<and> regs \<sigma> ymm3w0 = ymm3w0\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word) = ucast ((\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x35c),4]::32 word) = ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x35c),4]::32 word)) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x360),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x360),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x360),8]::64 word)::64 word) + (((\<langle>63,0\<rangle>((R15 \<sigma>::64 word) * 0x1)::64 word)::64 word) + 0x10)),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x360),8]::64 word)::64 word) + (((\<langle>63,0\<rangle>((R15 \<sigma>::64 word) * 0x1)::64 word)::64 word) + 0x10)),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x48),8]::64 word) = 0x0 \<and> (\<sigma> \<turnstile> *[((((RSP\<^sub>0::64 word) - 0x58)::64 word) + 0x8),8]::64 word) = 0x0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),8]::64 word) = 0x0 \<and> (\<sigma> \<turnstile> *[((((RSP\<^sub>0::64 word) - 0x68)::64 word) + 0x8),8]::64 word) = 0x0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),8]::64 word) = 0x0 \<and> (\<sigma> \<turnstile> *[((((RSP\<^sub>0::64 word) - 0x78)::64 word) + 0x8),8]::64 word) = 0x0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x78),8]::64 word) = 0x0\<close>
declare P_0x16043_5_def[Ps]

definition P_0x16043_5_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x16043_5_regions_set \<sigma> \<equiv> {
    (0, RSI\<^sub>0, Suc 0),
    (1, RSP\<^sub>0, 8),
    (2, ((FS\<^sub>0::64 word) + 0x28), 8),
    (3, ((RDI\<^sub>0::64 word) + 0x40), 8),
    (4, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x35c), 4),
    (5, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x360), 8),
    (6, (((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x360),8]::64 word)::64 word) + (((\<langle>63,0\<rangle>((R15 \<sigma>::64 word) * 0x1)::64 word)::64 word) + 0x10)), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (11, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (12, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (13, ((RSP\<^sub>0::64 word) - 0x40), 8),
    (14, ((RSP\<^sub>0::64 word) - 0x48), 8),
    (15, ((RSP\<^sub>0::64 word) - 0x50), 8),
    (16, ((RSP\<^sub>0::64 word) - 0x58), 8),
    (17, ((RSP\<^sub>0::64 word) - 0x60), 8),
    (18, ((RSP\<^sub>0::64 word) - 0x68), 8),
    (19, ((RSP\<^sub>0::64 word) - 0x70), 8),
    (20, ((RSP\<^sub>0::64 word) - 0x78), 8),
    (21, ((RSP\<^sub>0::64 word) - 0x80), 8)
  }\<close>

definition P_0x16043_5_regions :: state_pred where
  \<open>P_0x16043_5_regions \<sigma> \<equiv> \<exists>regions. P_0x16043_5_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_strtoul_addr_0x16043_5 :: state_pred where
  \<open>Q_strtoul_addr_0x16043_5 \<sigma> \<equiv> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x80) \<and> RIP \<sigma> = strtoul_addr \<and> RAX \<sigma> = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x360),8]::64 word) \<and> RBX \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = 0xa \<and> RDI \<sigma> = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x360),8]::64 word)::64 word) + (((\<langle>63,0\<rangle>((R15 \<sigma>::64 word) * 0x1)::64 word)::64 word) + 0x10)),8]::64 word) \<and> RSI \<sigma> = 0x0 \<and> R13 \<sigma> = RSI\<^sub>0 \<and> R12 \<sigma> = RDI\<^sub>0 \<and> R9 \<sigma> = R9\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> regs \<sigma> ymm0w1 = 0x0 \<and> regs \<sigma> ymm0w0 = 0x0 \<and> regs \<sigma> ymm1w1 = ymm1w1\<^sub>0 \<and> regs \<sigma> ymm1w0 = ymm1w0\<^sub>0 \<and> regs \<sigma> ymm2w1 = ymm2w1\<^sub>0 \<and> regs \<sigma> ymm2w0 = ymm2w0\<^sub>0 \<and> regs \<sigma> ymm3w1 = ymm3w1\<^sub>0 \<and> regs \<sigma> ymm3w0 = ymm3w0\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word) = ucast ((\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x35c),4]::32 word) = ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x35c),4]::32 word)) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x360),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x360),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x360),8]::64 word)::64 word) + (((\<langle>63,0\<rangle>((R15 \<sigma>::64 word) * 0x1)::64 word)::64 word) + 0x10)),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x360),8]::64 word)::64 word) + (((\<langle>63,0\<rangle>((R15 \<sigma>::64 word) * 0x1)::64 word)::64 word) + 0x10)),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x48),8]::64 word) = 0x0 \<and> (\<sigma> \<turnstile> *[((((RSP\<^sub>0::64 word) - 0x58)::64 word) + 0x8),8]::64 word) = 0x0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),8]::64 word) = 0x0 \<and> (\<sigma> \<turnstile> *[((((RSP\<^sub>0::64 word) - 0x68)::64 word) + 0x8),8]::64 word) = 0x0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),8]::64 word) = 0x0 \<and> (\<sigma> \<turnstile> *[((((RSP\<^sub>0::64 word) - 0x78)::64 word) + 0x8),8]::64 word) = 0x0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x78),8]::64 word) = 0x0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x80),8]::64 word) = 0x16048\<close>
declare Q_strtoul_addr_0x16043_5_def[Qs]

schematic_goal qcow_snapshot_create_0_1_0x16043_0x16043_5[blocks]:
  assumes \<open>(P_0x16043_5 && P_0x16043_5_regions) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x16043 5 \<sigma> \<triangleq> ?\<sigma> \<and> Q_strtoul_addr_0x16043_5 ?\<sigma> \<and> block_usage P_0x16043_5_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x16043_5_def P_0x16043_5_regions_def post: Q_strtoul_addr_0x16043_5_def regionset: P_0x16043_5_regions_set_def)

definition P_0x16048_6 :: state_pred where
  \<open>P_0x16048_6 \<sigma> \<equiv> RIP \<sigma> = 0x16048 \<and> RAX \<sigma> = strtoul_0x16043_retval \<and> RBX \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = 0xa \<and> RDI \<sigma> = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x360),8]::64 word)::64 word) + (((\<langle>63,0\<rangle>((R15 \<sigma>::64 word) * 0x1)::64 word)::64 word) + 0x10)),8]::64 word) \<and> RSI \<sigma> = 0x0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x78) \<and> R13 \<sigma> = RSI\<^sub>0 \<and> R12 \<sigma> = RDI\<^sub>0 \<and> R9 \<sigma> = R9\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> regs \<sigma> ymm0w1 = 0x0 \<and> regs \<sigma> ymm0w0 = 0x0 \<and> regs \<sigma> ymm1w1 = ymm1w1\<^sub>0 \<and> regs \<sigma> ymm1w0 = ymm1w0\<^sub>0 \<and> regs \<sigma> ymm2w1 = ymm2w1\<^sub>0 \<and> regs \<sigma> ymm2w0 = ymm2w0\<^sub>0 \<and> regs \<sigma> ymm3w1 = ymm3w1\<^sub>0 \<and> regs \<sigma> ymm3w0 = ymm3w0\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word) = ucast ((\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x35c),4]::32 word) = ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x35c),4]::32 word)) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x360),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x360),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x360),8]::64 word)::64 word) + (((\<langle>63,0\<rangle>((R15 \<sigma>::64 word) * 0x1)::64 word)::64 word) + 0x10)),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x360),8]::64 word)::64 word) + (((\<langle>63,0\<rangle>((R15 \<sigma>::64 word) * 0x1)::64 word)::64 word) + 0x10)),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x48),8]::64 word) = 0x0 \<and> (\<sigma> \<turnstile> *[((((RSP\<^sub>0::64 word) - 0x58)::64 word) + 0x8),8]::64 word) = 0x0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),8]::64 word) = 0x0 \<and> (\<sigma> \<turnstile> *[((((RSP\<^sub>0::64 word) - 0x68)::64 word) + 0x8),8]::64 word) = 0x0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),8]::64 word) = 0x0 \<and> (\<sigma> \<turnstile> *[((((RSP\<^sub>0::64 word) - 0x78)::64 word) + 0x8),8]::64 word) = 0x0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x78),8]::64 word) = 0x0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x80),8]::64 word) = 0x16048\<close>
declare P_0x16048_6_def[Ps]

definition P_0x16048_6_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x16048_6_regions_set \<sigma> \<equiv> {
    (0, RSI\<^sub>0, Suc 0),
    (1, RSP\<^sub>0, 8),
    (2, ((FS\<^sub>0::64 word) + 0x28), 8),
    (3, ((RDI\<^sub>0::64 word) + 0x40), 8),
    (4, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x35c), 4),
    (5, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x360), 8),
    (6, (((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x360),8]::64 word)::64 word) + (((\<langle>63,0\<rangle>((R15 \<sigma>::64 word) * 0x1)::64 word)::64 word) + 0x10)), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (11, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (12, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (13, ((RSP\<^sub>0::64 word) - 0x40), 8),
    (14, ((RSP\<^sub>0::64 word) - 0x48), 8),
    (15, ((RSP\<^sub>0::64 word) - 0x50), 8),
    (16, ((RSP\<^sub>0::64 word) - 0x58), 8),
    (17, ((RSP\<^sub>0::64 word) - 0x60), 8),
    (18, ((RSP\<^sub>0::64 word) - 0x68), 8),
    (19, ((RSP\<^sub>0::64 word) - 0x70), 8),
    (20, ((RSP\<^sub>0::64 word) - 0x78), 8),
    (21, ((RSP\<^sub>0::64 word) - 0x80), 8)
  }\<close>

definition P_0x16048_6_regions :: state_pred where
  \<open>P_0x16048_6_regions \<sigma> \<equiv> \<exists>regions. P_0x16048_6_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x1605c_6 :: state_pred where
  \<open>Q_0x1605c_6 \<sigma> \<equiv> RIP \<sigma> = 0x1605c \<and> RBX \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x78) \<and> R13 \<sigma> = RSI\<^sub>0 \<and> R12 \<sigma> = RDI\<^sub>0 \<and> R9 \<sigma> = R9\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> regs \<sigma> ymm0w1 = 0x0 \<and> regs \<sigma> ymm0w0 = 0x0 \<and> regs \<sigma> ymm1w1 = ymm1w1\<^sub>0 \<and> regs \<sigma> ymm1w0 = ymm1w0\<^sub>0 \<and> regs \<sigma> ymm2w1 = ymm2w1\<^sub>0 \<and> regs \<sigma> ymm2w0 = ymm2w0\<^sub>0 \<and> regs \<sigma> ymm3w1 = ymm3w1\<^sub>0 \<and> regs \<sigma> ymm3w0 = ymm3w0\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word) = ucast ((\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x35c),4]::32 word) = ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x35c),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x48),8]::64 word) = 0x0 \<and> (\<sigma> \<turnstile> *[((((RSP\<^sub>0::64 word) - 0x58)::64 word) + 0x8),8]::64 word) = 0x0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),8]::64 word) = 0x0 \<and> (\<sigma> \<turnstile> *[((((RSP\<^sub>0::64 word) - 0x68)::64 word) + 0x8),8]::64 word) = 0x0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),8]::64 word) = 0x0 \<and> (\<sigma> \<turnstile> *[((((RSP\<^sub>0::64 word) - 0x78)::64 word) + 0x8),8]::64 word) = 0x0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x78),8]::64 word) = 0x0\<close>
declare Q_0x1605c_6_def[Qs]

schematic_goal qcow_snapshot_create_0_5_0x16048_0x16055_6[blocks]:
  assumes \<open>(P_0x16048_6 && P_0x16048_6_regions) \<sigma>\<close>
  shows \<open>exec_block 5 0x16055 6 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x1605c_6 ?\<sigma> \<and> block_usage P_0x16048_6_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x16048_6_def P_0x16048_6_regions_def post: Q_0x1605c_6_def regionset: P_0x16048_6_regions_set_def)

definition P_0x1605c_true_7 :: state_pred where
  \<open>P_0x1605c_true_7 \<sigma> \<equiv> RIP \<sigma> = 0x1605c \<and> RBX \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x78) \<and> R13 \<sigma> = RSI\<^sub>0 \<and> R12 \<sigma> = RDI\<^sub>0 \<and> R9 \<sigma> = R9\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> regs \<sigma> ymm0w1 = 0x0 \<and> regs \<sigma> ymm0w0 = 0x0 \<and> regs \<sigma> ymm1w1 = ymm1w1\<^sub>0 \<and> regs \<sigma> ymm1w0 = ymm1w0\<^sub>0 \<and> regs \<sigma> ymm2w1 = ymm2w1\<^sub>0 \<and> regs \<sigma> ymm2w0 = ymm2w0\<^sub>0 \<and> regs \<sigma> ymm3w1 = ymm3w1\<^sub>0 \<and> regs \<sigma> ymm3w0 = ymm3w0\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word) = ucast ((\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x35c),4]::32 word) = ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x35c),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x48),8]::64 word) = 0x0 \<and> (\<sigma> \<turnstile> *[((((RSP\<^sub>0::64 word) - 0x58)::64 word) + 0x8),8]::64 word) = 0x0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),8]::64 word) = 0x0 \<and> (\<sigma> \<turnstile> *[((((RSP\<^sub>0::64 word) - 0x68)::64 word) + 0x8),8]::64 word) = 0x0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),8]::64 word) = 0x0 \<and> (\<sigma> \<turnstile> *[((((RSP\<^sub>0::64 word) - 0x78)::64 word) + 0x8),8]::64 word) = 0x0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x78),8]::64 word) = 0x0\<close>
declare P_0x1605c_true_7_def[Ps]

definition P_0x1605c_true_7_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x1605c_true_7_regions_set \<sigma> \<equiv> {
    (0, RSI\<^sub>0, Suc 0),
    (1, RSP\<^sub>0, 8),
    (2, ((FS\<^sub>0::64 word) + 0x28), 8),
    (3, ((RDI\<^sub>0::64 word) + 0x40), 8),
    (4, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x35c), 4),
    (5, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (11, ((RSP\<^sub>0::64 word) - 0x40), 8),
    (12, ((RSP\<^sub>0::64 word) - 0x48), 8),
    (13, ((RSP\<^sub>0::64 word) - 0x50), 8),
    (14, ((RSP\<^sub>0::64 word) - 0x58), 8),
    (15, ((RSP\<^sub>0::64 word) - 0x60), 8),
    (16, ((RSP\<^sub>0::64 word) - 0x68), 8),
    (17, ((RSP\<^sub>0::64 word) - 0x70), 8),
    (18, ((RSP\<^sub>0::64 word) - 0x78), 8)
  }\<close>

definition P_0x1605c_true_7_regions :: state_pred where
  \<open>P_0x1605c_true_7_regions \<sigma> \<equiv> \<exists>regions. P_0x1605c_true_7_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x16030_7 :: state_pred where
  \<open>Q_0x16030_7 \<sigma> \<equiv> RIP \<sigma> = 0x16030 \<and> RBX \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x78) \<and> R13 \<sigma> = RSI\<^sub>0 \<and> R12 \<sigma> = RDI\<^sub>0 \<and> R9 \<sigma> = R9\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> regs \<sigma> ymm0w1 = 0x0 \<and> regs \<sigma> ymm0w0 = 0x0 \<and> regs \<sigma> ymm1w1 = ymm1w1\<^sub>0 \<and> regs \<sigma> ymm1w0 = ymm1w0\<^sub>0 \<and> regs \<sigma> ymm2w1 = ymm2w1\<^sub>0 \<and> regs \<sigma> ymm2w0 = ymm2w0\<^sub>0 \<and> regs \<sigma> ymm3w1 = ymm3w1\<^sub>0 \<and> regs \<sigma> ymm3w0 = ymm3w0\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word) = ucast ((\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x35c),4]::32 word) = ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x35c),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x48),8]::64 word) = 0x0 \<and> (\<sigma> \<turnstile> *[((((RSP\<^sub>0::64 word) - 0x58)::64 word) + 0x8),8]::64 word) = 0x0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),8]::64 word) = 0x0 \<and> (\<sigma> \<turnstile> *[((((RSP\<^sub>0::64 word) - 0x68)::64 word) + 0x8),8]::64 word) = 0x0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),8]::64 word) = 0x0 \<and> (\<sigma> \<turnstile> *[((((RSP\<^sub>0::64 word) - 0x78)::64 word) + 0x8),8]::64 word) = 0x0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x78),8]::64 word) = 0x0\<close>
declare Q_0x16030_7_def[Qs]

schematic_goal qcow_snapshot_create_0_1_0x1605c_0x1605c_7[blocks]:
  assumes \<open>(P_0x1605c_true_7 && P_0x1605c_true_7_regions && jl) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x1605c 7 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x16030_7 ?\<sigma> \<and> block_usage P_0x1605c_true_7_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x1605c_true_7_def P_0x1605c_true_7_regions_def post: Q_0x16030_7_def regionset: P_0x1605c_true_7_regions_set_def)

definition P_0x1605c_false_8 :: state_pred where
  \<open>P_0x1605c_false_8 \<sigma> \<equiv> RIP \<sigma> = 0x1605c \<and> RBX \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x78) \<and> R13 \<sigma> = RSI\<^sub>0 \<and> R12 \<sigma> = RDI\<^sub>0 \<and> R9 \<sigma> = R9\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> regs \<sigma> ymm0w1 = 0x0 \<and> regs \<sigma> ymm0w0 = 0x0 \<and> regs \<sigma> ymm1w1 = ymm1w1\<^sub>0 \<and> regs \<sigma> ymm1w0 = ymm1w0\<^sub>0 \<and> regs \<sigma> ymm2w1 = ymm2w1\<^sub>0 \<and> regs \<sigma> ymm2w0 = ymm2w0\<^sub>0 \<and> regs \<sigma> ymm3w1 = ymm3w1\<^sub>0 \<and> regs \<sigma> ymm3w0 = ymm3w0\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word) = ucast ((\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x35c),4]::32 word) = ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x35c),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x48),8]::64 word) = 0x0 \<and> (\<sigma> \<turnstile> *[((((RSP\<^sub>0::64 word) - 0x58)::64 word) + 0x8),8]::64 word) = 0x0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),8]::64 word) = 0x0 \<and> (\<sigma> \<turnstile> *[((((RSP\<^sub>0::64 word) - 0x68)::64 word) + 0x8),8]::64 word) = 0x0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),8]::64 word) = 0x0 \<and> (\<sigma> \<turnstile> *[((((RSP\<^sub>0::64 word) - 0x78)::64 word) + 0x8),8]::64 word) = 0x0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x78),8]::64 word) = 0x0\<close>
declare P_0x1605c_false_8_def[Ps]

definition P_0x1605c_false_8_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x1605c_false_8_regions_set \<sigma> \<equiv> {
    (0, RSI\<^sub>0, Suc 0),
    (1, RSP\<^sub>0, 8),
    (2, ((FS\<^sub>0::64 word) + 0x28), 8),
    (3, ((RDI\<^sub>0::64 word) + 0x40), 8),
    (4, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x35c), 4),
    (5, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (11, ((RSP\<^sub>0::64 word) - 0x40), 8),
    (12, ((RSP\<^sub>0::64 word) - 0x48), 8),
    (13, ((RSP\<^sub>0::64 word) - 0x50), 8),
    (14, ((RSP\<^sub>0::64 word) - 0x58), 8),
    (15, ((RSP\<^sub>0::64 word) - 0x60), 8),
    (16, ((RSP\<^sub>0::64 word) - 0x68), 8),
    (17, ((RSP\<^sub>0::64 word) - 0x70), 8),
    (18, ((RSP\<^sub>0::64 word) - 0x78), 8)
  }\<close>

definition P_0x1605c_false_8_regions :: state_pred where
  \<open>P_0x1605c_false_8_regions \<sigma> \<equiv> \<exists>regions. P_0x1605c_false_8_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x1605e_8 :: state_pred where
  \<open>Q_0x1605e_8 \<sigma> \<equiv> RIP \<sigma> = 0x1605e \<and> RBX \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x78) \<and> R13 \<sigma> = RSI\<^sub>0 \<and> R12 \<sigma> = RDI\<^sub>0 \<and> R9 \<sigma> = R9\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> regs \<sigma> ymm0w1 = 0x0 \<and> regs \<sigma> ymm0w0 = 0x0 \<and> regs \<sigma> ymm1w1 = ymm1w1\<^sub>0 \<and> regs \<sigma> ymm1w0 = ymm1w0\<^sub>0 \<and> regs \<sigma> ymm2w1 = ymm2w1\<^sub>0 \<and> regs \<sigma> ymm2w0 = ymm2w0\<^sub>0 \<and> regs \<sigma> ymm3w1 = ymm3w1\<^sub>0 \<and> regs \<sigma> ymm3w0 = ymm3w0\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word) = ucast ((\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x35c),4]::32 word) = ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x35c),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x48),8]::64 word) = 0x0 \<and> (\<sigma> \<turnstile> *[((((RSP\<^sub>0::64 word) - 0x58)::64 word) + 0x8),8]::64 word) = 0x0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),8]::64 word) = 0x0 \<and> (\<sigma> \<turnstile> *[((((RSP\<^sub>0::64 word) - 0x68)::64 word) + 0x8),8]::64 word) = 0x0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),8]::64 word) = 0x0 \<and> (\<sigma> \<turnstile> *[((((RSP\<^sub>0::64 word) - 0x78)::64 word) + 0x8),8]::64 word) = 0x0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x78),8]::64 word) = 0x0\<close>
declare Q_0x1605e_8_def[Qs]

schematic_goal qcow_snapshot_create_0_1_0x1605c_0x1605c_8[blocks]:
  assumes \<open>(P_0x1605c_false_8 && P_0x1605c_false_8_regions && ! jl) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x1605c 8 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x1605e_8 ?\<sigma> \<and> block_usage P_0x1605c_false_8_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x1605c_false_8_def P_0x1605c_false_8_regions_def post: Q_0x1605e_8_def regionset: P_0x1605c_false_8_regions_set_def)

definition P_0x1605e_9 :: state_pred where
  \<open>P_0x1605e_9 \<sigma> \<equiv> RIP \<sigma> = 0x1605e \<and> RBX \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x78) \<and> R13 \<sigma> = RSI\<^sub>0 \<and> R12 \<sigma> = RDI\<^sub>0 \<and> R9 \<sigma> = R9\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> regs \<sigma> ymm0w1 = 0x0 \<and> regs \<sigma> ymm0w0 = 0x0 \<and> regs \<sigma> ymm1w1 = ymm1w1\<^sub>0 \<and> regs \<sigma> ymm1w0 = ymm1w0\<^sub>0 \<and> regs \<sigma> ymm2w1 = ymm2w1\<^sub>0 \<and> regs \<sigma> ymm2w0 = ymm2w0\<^sub>0 \<and> regs \<sigma> ymm3w1 = ymm3w1\<^sub>0 \<and> regs \<sigma> ymm3w0 = ymm3w0\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word) = ucast ((\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x35c),4]::32 word) = ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x35c),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x48),8]::64 word) = 0x0 \<and> (\<sigma> \<turnstile> *[((((RSP\<^sub>0::64 word) - 0x58)::64 word) + 0x8),8]::64 word) = 0x0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),8]::64 word) = 0x0 \<and> (\<sigma> \<turnstile> *[((((RSP\<^sub>0::64 word) - 0x68)::64 word) + 0x8),8]::64 word) = 0x0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),8]::64 word) = 0x0 \<and> (\<sigma> \<turnstile> *[((((RSP\<^sub>0::64 word) - 0x78)::64 word) + 0x8),8]::64 word) = 0x0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x78),8]::64 word) = 0x0\<close>
declare P_0x1605e_9_def[Ps]

definition P_0x1605e_9_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x1605e_9_regions_set \<sigma> \<equiv> {
    (0, RSI\<^sub>0, Suc 0),
    (1, RSP\<^sub>0, 8),
    (2, ((FS\<^sub>0::64 word) + 0x28), 8),
    (3, ((RDI\<^sub>0::64 word) + 0x40), 8),
    (4, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x35c), 4),
    (5, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (11, ((RSP\<^sub>0::64 word) - 0x40), 8),
    (12, ((RSP\<^sub>0::64 word) - 0x48), 8),
    (13, ((RSP\<^sub>0::64 word) - 0x50), 8),
    (14, ((RSP\<^sub>0::64 word) - 0x58), 8),
    (15, ((RSP\<^sub>0::64 word) - 0x60), 8),
    (16, ((RSP\<^sub>0::64 word) - 0x68), 8),
    (17, ((RSP\<^sub>0::64 word) - 0x70), 8),
    (18, ((RSP\<^sub>0::64 word) - 0x78), 8)
  }\<close>

definition P_0x1605e_9_regions :: state_pred where
  \<open>P_0x1605e_9_regions \<sigma> \<equiv> \<exists>regions. P_0x1605e_9_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x16062_9 :: state_pred where
  \<open>Q_0x16062_9 \<sigma> \<equiv> RIP \<sigma> = 0x16062 \<and> RBX \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x78) \<and> R13 \<sigma> = RSI\<^sub>0 \<and> R12 \<sigma> = RDI\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> regs \<sigma> ymm0w1 = 0x0 \<and> regs \<sigma> ymm0w0 = 0x0 \<and> regs \<sigma> ymm1w1 = ymm1w1\<^sub>0 \<and> regs \<sigma> ymm1w0 = ymm1w0\<^sub>0 \<and> regs \<sigma> ymm2w1 = ymm2w1\<^sub>0 \<and> regs \<sigma> ymm2w0 = ymm2w0\<^sub>0 \<and> regs \<sigma> ymm3w1 = ymm3w1\<^sub>0 \<and> regs \<sigma> ymm3w0 = ymm3w0\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word) = ucast ((\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x35c),4]::32 word) = ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x35c),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x48),8]::64 word) = 0x0 \<and> (\<sigma> \<turnstile> *[((((RSP\<^sub>0::64 word) - 0x58)::64 word) + 0x8),8]::64 word) = 0x0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),8]::64 word) = 0x0 \<and> (\<sigma> \<turnstile> *[((((RSP\<^sub>0::64 word) - 0x68)::64 word) + 0x8),8]::64 word) = 0x0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),8]::64 word) = 0x0 \<and> (\<sigma> \<turnstile> *[((((RSP\<^sub>0::64 word) - 0x78)::64 word) + 0x8),8]::64 word) = 0x0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x78),8]::64 word) = 0x0\<close>
declare Q_0x16062_9_def[Qs]

schematic_goal qcow_snapshot_create_0_1_0x1605e_0x1605e_9[blocks]:
  assumes \<open>(P_0x1605e_9 && P_0x1605e_9_regions) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x1605e 9 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x16062_9 ?\<sigma> \<and> block_usage P_0x1605e_9_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x1605e_9_def P_0x1605e_9_regions_def post: Q_0x16062_9_def regionset: P_0x1605e_9_regions_set_def)

definition P_0x16062_10 :: state_pred where
  \<open>P_0x16062_10 \<sigma> \<equiv> RIP \<sigma> = 0x16062 \<and> RBX \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x78) \<and> R13 \<sigma> = RSI\<^sub>0 \<and> R12 \<sigma> = RDI\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> regs \<sigma> ymm0w1 = 0x0 \<and> regs \<sigma> ymm0w0 = 0x0 \<and> regs \<sigma> ymm1w1 = ymm1w1\<^sub>0 \<and> regs \<sigma> ymm1w0 = ymm1w0\<^sub>0 \<and> regs \<sigma> ymm2w1 = ymm2w1\<^sub>0 \<and> regs \<sigma> ymm2w0 = ymm2w0\<^sub>0 \<and> regs \<sigma> ymm3w1 = ymm3w1\<^sub>0 \<and> regs \<sigma> ymm3w0 = ymm3w0\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word) = ucast ((\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x35c),4]::32 word) = ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x35c),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x48),8]::64 word) = 0x0 \<and> (\<sigma> \<turnstile> *[((((RSP\<^sub>0::64 word) - 0x58)::64 word) + 0x8),8]::64 word) = 0x0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),8]::64 word) = 0x0 \<and> (\<sigma> \<turnstile> *[((((RSP\<^sub>0::64 word) - 0x68)::64 word) + 0x8),8]::64 word) = 0x0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),8]::64 word) = 0x0 \<and> (\<sigma> \<turnstile> *[((((RSP\<^sub>0::64 word) - 0x78)::64 word) + 0x8),8]::64 word) = 0x0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x78),8]::64 word) = 0x0\<close>
declare P_0x16062_10_def[Ps]

definition P_0x16062_10_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x16062_10_regions_set \<sigma> \<equiv> {
    (0, RSI\<^sub>0, Suc 0),
    (1, RSP\<^sub>0, 8),
    (2, ((FS\<^sub>0::64 word) + 0x28), 8),
    (3, ((RDI\<^sub>0::64 word) + 0x40), 8),
    (4, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x35c), 4),
    (5, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (11, ((RSP\<^sub>0::64 word) - 0x40), 8),
    (12, ((RSP\<^sub>0::64 word) - 0x48), 8),
    (13, ((RSP\<^sub>0::64 word) - 0x50), 8),
    (14, ((RSP\<^sub>0::64 word) - 0x58), 8),
    (15, ((RSP\<^sub>0::64 word) - 0x60), 8),
    (16, ((RSP\<^sub>0::64 word) - 0x68), 8),
    (17, ((RSP\<^sub>0::64 word) - 0x70), 8),
    (18, ((RSP\<^sub>0::64 word) - 0x78), 8)
  }\<close>

definition P_0x16062_10_regions :: state_pred where
  \<open>P_0x16062_10_regions \<sigma> \<equiv> \<exists>regions. P_0x16062_10_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x1607d_10 :: state_pred where
  \<open>Q_0x1607d_10 \<sigma> \<equiv> RIP \<sigma> = 0x1607d \<and> RAX \<sigma> = 0x0 \<and> RBX \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> RCX \<sigma> = 0x80 \<and> RDX \<sigma> = 0x1 \<and> RDI \<sigma> = RSI\<^sub>0 \<and> RSI \<sigma> = 0x80 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x78) \<and> R13 \<sigma> = RSI\<^sub>0 \<and> R12 \<sigma> = RDI\<^sub>0 \<and> R8 \<sigma> = 0x219e2 \<and> FS \<sigma> = FS\<^sub>0 \<and> regs \<sigma> ymm0w1 = 0x0 \<and> regs \<sigma> ymm0w0 = 0x0 \<and> regs \<sigma> ymm1w1 = ymm1w1\<^sub>0 \<and> regs \<sigma> ymm1w0 = ymm1w0\<^sub>0 \<and> regs \<sigma> ymm2w1 = ymm2w1\<^sub>0 \<and> regs \<sigma> ymm2w0 = ymm2w0\<^sub>0 \<and> regs \<sigma> ymm3w1 = ymm3w1\<^sub>0 \<and> regs \<sigma> ymm3w0 = ymm3w0\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word) = ucast ((\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x35c),4]::32 word) = ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x35c),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x48),8]::64 word) = 0x0 \<and> (\<sigma> \<turnstile> *[((((RSP\<^sub>0::64 word) - 0x58)::64 word) + 0x8),8]::64 word) = 0x0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),8]::64 word) = 0x0 \<and> (\<sigma> \<turnstile> *[((((RSP\<^sub>0::64 word) - 0x68)::64 word) + 0x8),8]::64 word) = 0x0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),8]::64 word) = 0x0 \<and> (\<sigma> \<turnstile> *[((((RSP\<^sub>0::64 word) - 0x78)::64 word) + 0x8),8]::64 word) = 0x0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x78),8]::64 word) = 0x0\<close>
declare Q_0x1607d_10_def[Qs]

schematic_goal qcow_snapshot_create_0_6_0x16062_0x16078_10[blocks]:
  assumes \<open>(P_0x16062_10 && P_0x16062_10_regions) \<sigma>\<close>
  shows \<open>exec_block 6 0x16078 10 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x1607d_10 ?\<sigma> \<and> block_usage P_0x16062_10_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x16062_10_def P_0x16062_10_regions_def post: Q_0x1607d_10_def regionset: P_0x16062_10_regions_set_def)

definition P_0x1607d_11 :: state_pred where
  \<open>P_0x1607d_11 \<sigma> \<equiv> RIP \<sigma> = 0x1607d \<and> RAX \<sigma> = 0x0 \<and> RBX \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> RCX \<sigma> = 0x80 \<and> RDX \<sigma> = 0x1 \<and> RDI \<sigma> = RSI\<^sub>0 \<and> RSI \<sigma> = 0x80 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x78) \<and> R13 \<sigma> = RSI\<^sub>0 \<and> R12 \<sigma> = RDI\<^sub>0 \<and> R8 \<sigma> = 0x219e2 \<and> FS \<sigma> = FS\<^sub>0 \<and> regs \<sigma> ymm0w1 = 0x0 \<and> regs \<sigma> ymm0w0 = 0x0 \<and> regs \<sigma> ymm1w1 = ymm1w1\<^sub>0 \<and> regs \<sigma> ymm1w0 = ymm1w0\<^sub>0 \<and> regs \<sigma> ymm2w1 = ymm2w1\<^sub>0 \<and> regs \<sigma> ymm2w0 = ymm2w0\<^sub>0 \<and> regs \<sigma> ymm3w1 = ymm3w1\<^sub>0 \<and> regs \<sigma> ymm3w0 = ymm3w0\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word) = ucast ((\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x35c),4]::32 word) = ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x35c),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x48),8]::64 word) = 0x0 \<and> (\<sigma> \<turnstile> *[((((RSP\<^sub>0::64 word) - 0x58)::64 word) + 0x8),8]::64 word) = 0x0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),8]::64 word) = 0x0 \<and> (\<sigma> \<turnstile> *[((((RSP\<^sub>0::64 word) - 0x68)::64 word) + 0x8),8]::64 word) = 0x0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),8]::64 word) = 0x0 \<and> (\<sigma> \<turnstile> *[((((RSP\<^sub>0::64 word) - 0x78)::64 word) + 0x8),8]::64 word) = 0x0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x78),8]::64 word) = 0x0\<close>
declare P_0x1607d_11_def[Ps]

definition P_0x1607d_11_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x1607d_11_regions_set \<sigma> \<equiv> {
    (0, RSI\<^sub>0, Suc 0),
    (1, RSP\<^sub>0, 8),
    (2, ((FS\<^sub>0::64 word) + 0x28), 8),
    (3, ((RDI\<^sub>0::64 word) + 0x40), 8),
    (4, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x35c), 4),
    (5, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (11, ((RSP\<^sub>0::64 word) - 0x40), 8),
    (12, ((RSP\<^sub>0::64 word) - 0x48), 8),
    (13, ((RSP\<^sub>0::64 word) - 0x50), 8),
    (14, ((RSP\<^sub>0::64 word) - 0x58), 8),
    (15, ((RSP\<^sub>0::64 word) - 0x60), 8),
    (16, ((RSP\<^sub>0::64 word) - 0x68), 8),
    (17, ((RSP\<^sub>0::64 word) - 0x70), 8),
    (18, ((RSP\<^sub>0::64 word) - 0x78), 8),
    (19, ((RSP\<^sub>0::64 word) - 0x80), 8)
  }\<close>

definition P_0x1607d_11_regions :: state_pred where
  \<open>P_0x1607d_11_regions \<sigma> \<equiv> \<exists>regions. P_0x1607d_11_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_snprintf_chk_addr_0x1607d_11 :: state_pred where
  \<open>Q_snprintf_chk_addr_0x1607d_11 \<sigma> \<equiv> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x80) \<and> RIP \<sigma> = snprintf_chk_addr \<and> RAX \<sigma> = 0x0 \<and> RBX \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> RCX \<sigma> = 0x80 \<and> RDX \<sigma> = 0x1 \<and> RDI \<sigma> = RSI\<^sub>0 \<and> RSI \<sigma> = 0x80 \<and> R13 \<sigma> = RSI\<^sub>0 \<and> R12 \<sigma> = RDI\<^sub>0 \<and> R8 \<sigma> = 0x219e2 \<and> FS \<sigma> = FS\<^sub>0 \<and> regs \<sigma> ymm0w1 = 0x0 \<and> regs \<sigma> ymm0w0 = 0x0 \<and> regs \<sigma> ymm1w1 = ymm1w1\<^sub>0 \<and> regs \<sigma> ymm1w0 = ymm1w0\<^sub>0 \<and> regs \<sigma> ymm2w1 = ymm2w1\<^sub>0 \<and> regs \<sigma> ymm2w0 = ymm2w0\<^sub>0 \<and> regs \<sigma> ymm3w1 = ymm3w1\<^sub>0 \<and> regs \<sigma> ymm3w0 = ymm3w0\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word) = ucast ((\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x35c),4]::32 word) = ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x35c),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x48),8]::64 word) = 0x0 \<and> (\<sigma> \<turnstile> *[((((RSP\<^sub>0::64 word) - 0x58)::64 word) + 0x8),8]::64 word) = 0x0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),8]::64 word) = 0x0 \<and> (\<sigma> \<turnstile> *[((((RSP\<^sub>0::64 word) - 0x68)::64 word) + 0x8),8]::64 word) = 0x0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),8]::64 word) = 0x0 \<and> (\<sigma> \<turnstile> *[((((RSP\<^sub>0::64 word) - 0x78)::64 word) + 0x8),8]::64 word) = 0x0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x78),8]::64 word) = 0x0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x80),8]::64 word) = 0x16082\<close>
declare Q_snprintf_chk_addr_0x1607d_11_def[Qs]

schematic_goal qcow_snapshot_create_0_1_0x1607d_0x1607d_11[blocks]:
  assumes \<open>(P_0x1607d_11 && P_0x1607d_11_regions) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x1607d 11 \<sigma> \<triangleq> ?\<sigma> \<and> Q_snprintf_chk_addr_0x1607d_11 ?\<sigma> \<and> block_usage P_0x1607d_11_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x1607d_11_def P_0x1607d_11_regions_def post: Q_snprintf_chk_addr_0x1607d_11_def regionset: P_0x1607d_11_regions_set_def)

definition P_0x16082_12 :: state_pred where
  \<open>P_0x16082_12 \<sigma> \<equiv> RIP \<sigma> = 0x16082 \<and> RAX \<sigma> = snprintf_chk_0x1607d_retval \<and> RBX \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> RCX \<sigma> = 0x80 \<and> RDX \<sigma> = 0x1 \<and> RDI \<sigma> = RSI\<^sub>0 \<and> RSI \<sigma> = 0x80 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x78) \<and> R13 \<sigma> = RSI\<^sub>0 \<and> R12 \<sigma> = RDI\<^sub>0 \<and> R8 \<sigma> = 0x219e2 \<and> FS \<sigma> = FS\<^sub>0 \<and> regs \<sigma> ymm0w1 = 0x0 \<and> regs \<sigma> ymm0w0 = 0x0 \<and> regs \<sigma> ymm1w1 = ymm1w1\<^sub>0 \<and> regs \<sigma> ymm1w0 = ymm1w0\<^sub>0 \<and> regs \<sigma> ymm2w1 = ymm2w1\<^sub>0 \<and> regs \<sigma> ymm2w0 = ymm2w0\<^sub>0 \<and> regs \<sigma> ymm3w1 = ymm3w1\<^sub>0 \<and> regs \<sigma> ymm3w0 = ymm3w0\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word) = ucast ((\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x35c),4]::32 word) = ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x35c),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x48),8]::64 word) = 0x0 \<and> (\<sigma> \<turnstile> *[((((RSP\<^sub>0::64 word) - 0x58)::64 word) + 0x8),8]::64 word) = 0x0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),8]::64 word) = 0x0 \<and> (\<sigma> \<turnstile> *[((((RSP\<^sub>0::64 word) - 0x68)::64 word) + 0x8),8]::64 word) = 0x0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),8]::64 word) = 0x0 \<and> (\<sigma> \<turnstile> *[((((RSP\<^sub>0::64 word) - 0x78)::64 word) + 0x8),8]::64 word) = 0x0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x78),8]::64 word) = 0x0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x80),8]::64 word) = 0x16082\<close>
declare P_0x16082_12_def[Ps]

definition P_0x16082_12_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x16082_12_regions_set \<sigma> \<equiv> {
    (0, RSI\<^sub>0, Suc 0),
    (1, RSP\<^sub>0, 8),
    (2, ((FS\<^sub>0::64 word) + 0x28), 8),
    (3, ((RDI\<^sub>0::64 word) + 0x40), 8),
    (4, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x35c), 4),
    (5, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (11, ((RSP\<^sub>0::64 word) - 0x40), 8),
    (12, ((RSP\<^sub>0::64 word) - 0x48), 8),
    (13, ((RSP\<^sub>0::64 word) - 0x50), 8),
    (14, ((RSP\<^sub>0::64 word) - 0x58), 8),
    (15, ((RSP\<^sub>0::64 word) - 0x60), 8),
    (16, ((RSP\<^sub>0::64 word) - 0x68), 8),
    (17, ((RSP\<^sub>0::64 word) - 0x70), 8),
    (18, ((RSP\<^sub>0::64 word) - 0x78), 8),
    (19, ((RSP\<^sub>0::64 word) - 0x80), 8)
  }\<close>

definition P_0x16082_12_regions :: state_pred where
  \<open>P_0x16082_12_regions \<sigma> \<equiv> \<exists>regions. P_0x16082_12_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x15e2f_12 :: state_pred where
  \<open>Q_0x15e2f_12 \<sigma> \<equiv> RIP \<sigma> = 0x15e2f \<and> RBX \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> RDI \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x78) \<and> R13 \<sigma> = RSI\<^sub>0 \<and> R12 \<sigma> = RDI\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> regs \<sigma> ymm0w1 = 0x0 \<and> regs \<sigma> ymm0w0 = 0x0 \<and> regs \<sigma> ymm1w1 = ymm1w1\<^sub>0 \<and> regs \<sigma> ymm1w0 = ymm1w0\<^sub>0 \<and> regs \<sigma> ymm2w1 = ymm2w1\<^sub>0 \<and> regs \<sigma> ymm2w0 = ymm2w0\<^sub>0 \<and> regs \<sigma> ymm3w1 = ymm3w1\<^sub>0 \<and> regs \<sigma> ymm3w0 = ymm3w0\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word) = ucast ((\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x48),8]::64 word) = 0x0 \<and> (\<sigma> \<turnstile> *[((((RSP\<^sub>0::64 word) - 0x58)::64 word) + 0x8),8]::64 word) = 0x0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),8]::64 word) = 0x0 \<and> (\<sigma> \<turnstile> *[((((RSP\<^sub>0::64 word) - 0x68)::64 word) + 0x8),8]::64 word) = 0x0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),8]::64 word) = 0x0 \<and> (\<sigma> \<turnstile> *[((((RSP\<^sub>0::64 word) - 0x78)::64 word) + 0x8),8]::64 word) = 0x0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x78),8]::64 word) = 0x0\<close>
declare Q_0x15e2f_12_def[Qs]

schematic_goal qcow_snapshot_create_0_2_0x16082_0x16087_12[blocks]:
  assumes \<open>(P_0x16082_12 && P_0x16082_12_regions) \<sigma>\<close>
  shows \<open>exec_block 2 0x16087 12 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x15e2f_12 ?\<sigma> \<and> block_usage P_0x16082_12_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x16082_12_def P_0x16082_12_regions_def post: Q_0x15e2f_12_def regionset: P_0x16082_12_regions_set_def)

definition P_0x15e29_false_13 :: state_pred where
  \<open>P_0x15e29_false_13 \<sigma> \<equiv> RIP \<sigma> = 0x15e29 \<and> RAX \<sigma> = 0x0 \<and> RBX \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = RDX\<^sub>0 \<and> RDI \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x78) \<and> RBP \<sigma> = RBP\<^sub>0 \<and> R15 \<sigma> = R15\<^sub>0 \<and> R14 \<sigma> = R14\<^sub>0 \<and> R13 \<sigma> = RSI\<^sub>0 \<and> R12 \<sigma> = RDI\<^sub>0 \<and> R9 \<sigma> = R9\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> regs \<sigma> ymm0w1 = 0x0 \<and> regs \<sigma> ymm0w0 = 0x0 \<and> regs \<sigma> ymm1w1 = ymm1w1\<^sub>0 \<and> regs \<sigma> ymm1w0 = ymm1w0\<^sub>0 \<and> regs \<sigma> ymm2w1 = ymm2w1\<^sub>0 \<and> regs \<sigma> ymm2w0 = ymm2w0\<^sub>0 \<and> regs \<sigma> ymm3w1 = ymm3w1\<^sub>0 \<and> regs \<sigma> ymm3w0 = ymm3w0\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word) = ucast ((\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x48),8]::64 word) = 0x0 \<and> (\<sigma> \<turnstile> *[((((RSP\<^sub>0::64 word) - 0x58)::64 word) + 0x8),8]::64 word) = 0x0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),8]::64 word) = 0x0 \<and> (\<sigma> \<turnstile> *[((((RSP\<^sub>0::64 word) - 0x68)::64 word) + 0x8),8]::64 word) = 0x0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),8]::64 word) = 0x0 \<and> (\<sigma> \<turnstile> *[((((RSP\<^sub>0::64 word) - 0x78)::64 word) + 0x8),8]::64 word) = 0x0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x78),8]::64 word) = 0x0\<close>
declare P_0x15e29_false_13_def[Ps]

definition P_0x15e29_false_13_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x15e29_false_13_regions_set \<sigma> \<equiv> {
    (0, RSI\<^sub>0, Suc 0),
    (1, RSP\<^sub>0, 8),
    (2, ((FS\<^sub>0::64 word) + 0x28), 8),
    (3, ((RDI\<^sub>0::64 word) + 0x40), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x40), 8),
    (11, ((RSP\<^sub>0::64 word) - 0x48), 8),
    (12, ((RSP\<^sub>0::64 word) - 0x50), 8),
    (13, ((RSP\<^sub>0::64 word) - 0x58), 8),
    (14, ((RSP\<^sub>0::64 word) - 0x60), 8),
    (15, ((RSP\<^sub>0::64 word) - 0x68), 8),
    (16, ((RSP\<^sub>0::64 word) - 0x70), 8),
    (17, ((RSP\<^sub>0::64 word) - 0x78), 8)
  }\<close>

definition P_0x15e29_false_13_regions :: state_pred where
  \<open>P_0x15e29_false_13_regions \<sigma> \<equiv> \<exists>regions. P_0x15e29_false_13_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x15e2f_13 :: state_pred where
  \<open>Q_0x15e2f_13 \<sigma> \<equiv> RIP \<sigma> = 0x15e2f \<and> RBX \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> RDI \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x78) \<and> R13 \<sigma> = RSI\<^sub>0 \<and> R12 \<sigma> = RDI\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> regs \<sigma> ymm0w1 = 0x0 \<and> regs \<sigma> ymm0w0 = 0x0 \<and> regs \<sigma> ymm1w1 = ymm1w1\<^sub>0 \<and> regs \<sigma> ymm1w0 = ymm1w0\<^sub>0 \<and> regs \<sigma> ymm2w1 = ymm2w1\<^sub>0 \<and> regs \<sigma> ymm2w0 = ymm2w0\<^sub>0 \<and> regs \<sigma> ymm3w1 = ymm3w1\<^sub>0 \<and> regs \<sigma> ymm3w0 = ymm3w0\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word) = ucast ((\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x48),8]::64 word) = 0x0 \<and> (\<sigma> \<turnstile> *[((((RSP\<^sub>0::64 word) - 0x58)::64 word) + 0x8),8]::64 word) = 0x0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),8]::64 word) = 0x0 \<and> (\<sigma> \<turnstile> *[((((RSP\<^sub>0::64 word) - 0x68)::64 word) + 0x8),8]::64 word) = 0x0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),8]::64 word) = 0x0 \<and> (\<sigma> \<turnstile> *[((((RSP\<^sub>0::64 word) - 0x78)::64 word) + 0x8),8]::64 word) = 0x0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x78),8]::64 word) = 0x0\<close>
declare Q_0x15e2f_13_def[Qs]

schematic_goal qcow_snapshot_create_0_1_0x15e29_0x15e29_13[blocks]:
  assumes \<open>(P_0x15e29_false_13 && P_0x15e29_false_13_regions && ! ZF) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x15e29 13 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x15e2f_13 ?\<sigma> \<and> block_usage P_0x15e29_false_13_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x15e29_false_13_def P_0x15e29_false_13_regions_def post: Q_0x15e2f_13_def regionset: P_0x15e29_false_13_regions_set_def)

definition P_0x15e2f_14 :: state_pred where
  \<open>P_0x15e2f_14 \<sigma> \<equiv> RIP \<sigma> = 0x15e2f \<and> RBX \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> RDI \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x78) \<and> R13 \<sigma> = RSI\<^sub>0 \<and> R12 \<sigma> = RDI\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> regs \<sigma> ymm0w1 = 0x0 \<and> regs \<sigma> ymm0w0 = 0x0 \<and> regs \<sigma> ymm1w1 = ymm1w1\<^sub>0 \<and> regs \<sigma> ymm1w0 = ymm1w0\<^sub>0 \<and> regs \<sigma> ymm2w1 = ymm2w1\<^sub>0 \<and> regs \<sigma> ymm2w0 = ymm2w0\<^sub>0 \<and> regs \<sigma> ymm3w1 = ymm3w1\<^sub>0 \<and> regs \<sigma> ymm3w0 = ymm3w0\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word) = ucast ((\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x48),8]::64 word) = 0x0 \<and> (\<sigma> \<turnstile> *[((((RSP\<^sub>0::64 word) - 0x58)::64 word) + 0x8),8]::64 word) = 0x0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),8]::64 word) = 0x0 \<and> (\<sigma> \<turnstile> *[((((RSP\<^sub>0::64 word) - 0x68)::64 word) + 0x8),8]::64 word) = 0x0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),8]::64 word) = 0x0 \<and> (\<sigma> \<turnstile> *[((((RSP\<^sub>0::64 word) - 0x78)::64 word) + 0x8),8]::64 word) = 0x0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x78),8]::64 word) = 0x0\<close>
declare P_0x15e2f_14_def[Ps]

definition P_0x15e2f_14_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x15e2f_14_regions_set \<sigma> \<equiv> {
    (0, RSI\<^sub>0, Suc 0),
    (1, RSP\<^sub>0, 8),
    (2, ((FS\<^sub>0::64 word) + 0x28), 8),
    (3, ((RDI\<^sub>0::64 word) + 0x40), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x40), 8),
    (11, ((RSP\<^sub>0::64 word) - 0x48), 8),
    (12, ((RSP\<^sub>0::64 word) - 0x50), 8),
    (13, ((RSP\<^sub>0::64 word) - 0x58), 8),
    (14, ((RSP\<^sub>0::64 word) - 0x60), 8),
    (15, ((RSP\<^sub>0::64 word) - 0x68), 8),
    (16, ((RSP\<^sub>0::64 word) - 0x70), 8),
    (17, ((RSP\<^sub>0::64 word) - 0x78), 8)
  }\<close>

definition P_0x15e2f_14_regions :: state_pred where
  \<open>P_0x15e2f_14_regions \<sigma> \<equiv> \<exists>regions. P_0x15e2f_14_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x15e32_14 :: state_pred where
  \<open>Q_0x15e32_14 \<sigma> \<equiv> RIP \<sigma> = 0x15e32 \<and> RBX \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> RDI \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x78) \<and> R13 \<sigma> = RSI\<^sub>0 \<and> R12 \<sigma> = RDI\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> regs \<sigma> ymm0w1 = 0x0 \<and> regs \<sigma> ymm0w0 = 0x0 \<and> regs \<sigma> ymm1w1 = ymm1w1\<^sub>0 \<and> regs \<sigma> ymm1w0 = ymm1w0\<^sub>0 \<and> regs \<sigma> ymm2w1 = ymm2w1\<^sub>0 \<and> regs \<sigma> ymm2w0 = ymm2w0\<^sub>0 \<and> regs \<sigma> ymm3w1 = ymm3w1\<^sub>0 \<and> regs \<sigma> ymm3w0 = ymm3w0\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word) = ucast ((\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x48),8]::64 word) = 0x0 \<and> (\<sigma> \<turnstile> *[((((RSP\<^sub>0::64 word) - 0x58)::64 word) + 0x8),8]::64 word) = 0x0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),8]::64 word) = 0x0 \<and> (\<sigma> \<turnstile> *[((((RSP\<^sub>0::64 word) - 0x68)::64 word) + 0x8),8]::64 word) = 0x0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),8]::64 word) = 0x0 \<and> (\<sigma> \<turnstile> *[((((RSP\<^sub>0::64 word) - 0x78)::64 word) + 0x8),8]::64 word) = 0x0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x78),8]::64 word) = 0x0\<close>
declare Q_0x15e32_14_def[Qs]

schematic_goal qcow_snapshot_create_0_1_0x15e2f_0x15e2f_14[blocks]:
  assumes \<open>(P_0x15e2f_14 && P_0x15e2f_14_regions) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x15e2f 14 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x15e32_14 ?\<sigma> \<and> block_usage P_0x15e2f_14_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x15e2f_14_def P_0x15e2f_14_regions_def post: Q_0x15e32_14_def regionset: P_0x15e2f_14_regions_set_def)

definition P_0x15e32_15 :: state_pred where
  \<open>P_0x15e32_15 \<sigma> \<equiv> RIP \<sigma> = 0x15e32 \<and> RBX \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> RDI \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x78) \<and> R13 \<sigma> = RSI\<^sub>0 \<and> R12 \<sigma> = RDI\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> regs \<sigma> ymm0w1 = 0x0 \<and> regs \<sigma> ymm0w0 = 0x0 \<and> regs \<sigma> ymm1w1 = ymm1w1\<^sub>0 \<and> regs \<sigma> ymm1w0 = ymm1w0\<^sub>0 \<and> regs \<sigma> ymm2w1 = ymm2w1\<^sub>0 \<and> regs \<sigma> ymm2w0 = ymm2w0\<^sub>0 \<and> regs \<sigma> ymm3w1 = ymm3w1\<^sub>0 \<and> regs \<sigma> ymm3w0 = ymm3w0\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word) = ucast ((\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x48),8]::64 word) = 0x0 \<and> (\<sigma> \<turnstile> *[((((RSP\<^sub>0::64 word) - 0x58)::64 word) + 0x8),8]::64 word) = 0x0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),8]::64 word) = 0x0 \<and> (\<sigma> \<turnstile> *[((((RSP\<^sub>0::64 word) - 0x68)::64 word) + 0x8),8]::64 word) = 0x0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),8]::64 word) = 0x0 \<and> (\<sigma> \<turnstile> *[((((RSP\<^sub>0::64 word) - 0x78)::64 word) + 0x8),8]::64 word) = 0x0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x78),8]::64 word) = 0x0\<close>
declare P_0x15e32_15_def[Ps]

definition P_0x15e32_15_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x15e32_15_regions_set \<sigma> \<equiv> {
    (0, RSI\<^sub>0, Suc 0),
    (1, RSP\<^sub>0, 8),
    (2, ((FS\<^sub>0::64 word) + 0x28), 8),
    (3, ((RDI\<^sub>0::64 word) + 0x40), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x40), 8),
    (11, ((RSP\<^sub>0::64 word) - 0x48), 8),
    (12, ((RSP\<^sub>0::64 word) - 0x50), 8),
    (13, ((RSP\<^sub>0::64 word) - 0x58), 8),
    (14, ((RSP\<^sub>0::64 word) - 0x60), 8),
    (15, ((RSP\<^sub>0::64 word) - 0x68), 8),
    (16, ((RSP\<^sub>0::64 word) - 0x70), 8),
    (17, ((RSP\<^sub>0::64 word) - 0x78), 8),
    (18, ((RSP\<^sub>0::64 word) - 0x80), 8)
  }\<close>

definition P_0x15e32_15_regions :: state_pred where
  \<open>P_0x15e32_15_regions \<sigma> \<equiv> \<exists>regions. P_0x15e32_15_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_find_snapshot_by_id_isra_8_addr_0x15e32_15 :: state_pred where
  \<open>Q_find_snapshot_by_id_isra_8_addr_0x15e32_15 \<sigma> \<equiv> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x80) \<and> RIP \<sigma> = find_snapshot_by_id_isra_8_addr \<and> RBX \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> RDI \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> RSI \<sigma> = RSI\<^sub>0 \<and> R13 \<sigma> = RSI\<^sub>0 \<and> R12 \<sigma> = RDI\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> regs \<sigma> ymm0w1 = 0x0 \<and> regs \<sigma> ymm0w0 = 0x0 \<and> regs \<sigma> ymm1w1 = ymm1w1\<^sub>0 \<and> regs \<sigma> ymm1w0 = ymm1w0\<^sub>0 \<and> regs \<sigma> ymm2w1 = ymm2w1\<^sub>0 \<and> regs \<sigma> ymm2w0 = ymm2w0\<^sub>0 \<and> regs \<sigma> ymm3w1 = ymm3w1\<^sub>0 \<and> regs \<sigma> ymm3w0 = ymm3w0\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word) = ucast ((\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x48),8]::64 word) = 0x0 \<and> (\<sigma> \<turnstile> *[((((RSP\<^sub>0::64 word) - 0x58)::64 word) + 0x8),8]::64 word) = 0x0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),8]::64 word) = 0x0 \<and> (\<sigma> \<turnstile> *[((((RSP\<^sub>0::64 word) - 0x68)::64 word) + 0x8),8]::64 word) = 0x0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),8]::64 word) = 0x0 \<and> (\<sigma> \<turnstile> *[((((RSP\<^sub>0::64 word) - 0x78)::64 word) + 0x8),8]::64 word) = 0x0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x78),8]::64 word) = 0x0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x80),8]::64 word) = 0x15e37\<close>
declare Q_find_snapshot_by_id_isra_8_addr_0x15e32_15_def[Qs]

schematic_goal qcow_snapshot_create_0_1_0x15e32_0x15e32_15[blocks]:
  assumes \<open>(P_0x15e32_15 && P_0x15e32_15_regions) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x15e32 15 \<sigma> \<triangleq> ?\<sigma> \<and> Q_find_snapshot_by_id_isra_8_addr_0x15e32_15 ?\<sigma> \<and> block_usage P_0x15e32_15_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x15e32_15_def P_0x15e32_15_regions_def post: Q_find_snapshot_by_id_isra_8_addr_0x15e32_15_def regionset: P_0x15e32_15_regions_set_def)

definition P_0x15e37_16 :: state_pred where
  \<open>P_0x15e37_16 \<sigma> \<equiv> RIP \<sigma> = 0x15e37 \<and> RBX \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> RDI \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x78) \<and> R13 \<sigma> = RSI\<^sub>0 \<and> R12 \<sigma> = RDI\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> regs \<sigma> ymm0w1 = 0x0 \<and> regs \<sigma> ymm0w0 = 0x0 \<and> regs \<sigma> ymm1w1 = ymm1w1\<^sub>0 \<and> regs \<sigma> ymm1w0 = ymm1w0\<^sub>0 \<and> regs \<sigma> ymm2w1 = ymm2w1\<^sub>0 \<and> regs \<sigma> ymm2w0 = ymm2w0\<^sub>0 \<and> regs \<sigma> ymm3w1 = ymm3w1\<^sub>0 \<and> regs \<sigma> ymm3w0 = ymm3w0\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word) = ucast ((\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x48),8]::64 word) = 0x0 \<and> (\<sigma> \<turnstile> *[((((RSP\<^sub>0::64 word) - 0x58)::64 word) + 0x8),8]::64 word) = 0x0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),8]::64 word) = 0x0 \<and> (\<sigma> \<turnstile> *[((((RSP\<^sub>0::64 word) - 0x68)::64 word) + 0x8),8]::64 word) = 0x0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),8]::64 word) = 0x0 \<and> (\<sigma> \<turnstile> *[((((RSP\<^sub>0::64 word) - 0x78)::64 word) + 0x8),8]::64 word) = 0x0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x78),8]::64 word) = 0x0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x80),8]::64 word) = 0x15e37\<close>
declare P_0x15e37_16_def[Ps]

definition P_0x15e37_16_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x15e37_16_regions_set \<sigma> \<equiv> {
    (0, RSI\<^sub>0, Suc 0),
    (1, RSP\<^sub>0, 8),
    (2, ((FS\<^sub>0::64 word) + 0x28), 8),
    (3, ((RDI\<^sub>0::64 word) + 0x40), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x40), 8),
    (11, ((RSP\<^sub>0::64 word) - 0x48), 8),
    (12, ((RSP\<^sub>0::64 word) - 0x50), 8),
    (13, ((RSP\<^sub>0::64 word) - 0x58), 8),
    (14, ((RSP\<^sub>0::64 word) - 0x60), 8),
    (15, ((RSP\<^sub>0::64 word) - 0x68), 8),
    (16, ((RSP\<^sub>0::64 word) - 0x70), 8),
    (17, ((RSP\<^sub>0::64 word) - 0x78), 8),
    (18, ((RSP\<^sub>0::64 word) - 0x80), 8)
  }\<close>

definition P_0x15e37_16_regions :: state_pred where
  \<open>P_0x15e37_16_regions \<sigma> \<equiv> \<exists>regions. P_0x15e37_16_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x15e39_16 :: state_pred where
  \<open>Q_0x15e39_16 \<sigma> \<equiv> RIP \<sigma> = 0x15e39 \<and> RBX \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> RDI \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x78) \<and> R13 \<sigma> = RSI\<^sub>0 \<and> R12 \<sigma> = RDI\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> regs \<sigma> ymm0w1 = 0x0 \<and> regs \<sigma> ymm0w0 = 0x0 \<and> regs \<sigma> ymm1w1 = ymm1w1\<^sub>0 \<and> regs \<sigma> ymm1w0 = ymm1w0\<^sub>0 \<and> regs \<sigma> ymm2w1 = ymm2w1\<^sub>0 \<and> regs \<sigma> ymm2w0 = ymm2w0\<^sub>0 \<and> regs \<sigma> ymm3w1 = ymm3w1\<^sub>0 \<and> regs \<sigma> ymm3w0 = ymm3w0\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word) = ucast ((\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x48),8]::64 word) = 0x0 \<and> (\<sigma> \<turnstile> *[((((RSP\<^sub>0::64 word) - 0x58)::64 word) + 0x8),8]::64 word) = 0x0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),8]::64 word) = 0x0 \<and> (\<sigma> \<turnstile> *[((((RSP\<^sub>0::64 word) - 0x68)::64 word) + 0x8),8]::64 word) = 0x0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),8]::64 word) = 0x0 \<and> (\<sigma> \<turnstile> *[((((RSP\<^sub>0::64 word) - 0x78)::64 word) + 0x8),8]::64 word) = 0x0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x78),8]::64 word) = 0x0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x80),8]::64 word) = 0x15e37\<close>
declare Q_0x15e39_16_def[Qs]

schematic_goal qcow_snapshot_create_0_1_0x15e37_0x15e37_16[blocks]:
  assumes \<open>(P_0x15e37_16 && P_0x15e37_16_regions) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x15e37 16 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x15e39_16 ?\<sigma> \<and> block_usage P_0x15e37_16_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x15e37_16_def P_0x15e37_16_regions_def post: Q_0x15e39_16_def regionset: P_0x15e37_16_regions_set_def)

definition P_0x15e39_true_17 :: state_pred where
  \<open>P_0x15e39_true_17 \<sigma> \<equiv> RIP \<sigma> = 0x15e39 \<and> RBX \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> RDI \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x78) \<and> R13 \<sigma> = RSI\<^sub>0 \<and> R12 \<sigma> = RDI\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> regs \<sigma> ymm0w1 = 0x0 \<and> regs \<sigma> ymm0w0 = 0x0 \<and> regs \<sigma> ymm1w1 = ymm1w1\<^sub>0 \<and> regs \<sigma> ymm1w0 = ymm1w0\<^sub>0 \<and> regs \<sigma> ymm2w1 = ymm2w1\<^sub>0 \<and> regs \<sigma> ymm2w0 = ymm2w0\<^sub>0 \<and> regs \<sigma> ymm3w1 = ymm3w1\<^sub>0 \<and> regs \<sigma> ymm3w0 = ymm3w0\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word) = ucast ((\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x48),8]::64 word) = 0x0 \<and> (\<sigma> \<turnstile> *[((((RSP\<^sub>0::64 word) - 0x58)::64 word) + 0x8),8]::64 word) = 0x0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),8]::64 word) = 0x0 \<and> (\<sigma> \<turnstile> *[((((RSP\<^sub>0::64 word) - 0x68)::64 word) + 0x8),8]::64 word) = 0x0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),8]::64 word) = 0x0 \<and> (\<sigma> \<turnstile> *[((((RSP\<^sub>0::64 word) - 0x78)::64 word) + 0x8),8]::64 word) = 0x0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x78),8]::64 word) = 0x0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x80),8]::64 word) = 0x15e37\<close>
declare P_0x15e39_true_17_def[Ps]

definition P_0x15e39_true_17_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x15e39_true_17_regions_set \<sigma> \<equiv> {
    (0, RSI\<^sub>0, Suc 0),
    (1, RSP\<^sub>0, 8),
    (2, ((FS\<^sub>0::64 word) + 0x28), 8),
    (3, ((RDI\<^sub>0::64 word) + 0x40), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x40), 8),
    (11, ((RSP\<^sub>0::64 word) - 0x48), 8),
    (12, ((RSP\<^sub>0::64 word) - 0x50), 8),
    (13, ((RSP\<^sub>0::64 word) - 0x58), 8),
    (14, ((RSP\<^sub>0::64 word) - 0x60), 8),
    (15, ((RSP\<^sub>0::64 word) - 0x68), 8),
    (16, ((RSP\<^sub>0::64 word) - 0x70), 8),
    (17, ((RSP\<^sub>0::64 word) - 0x78), 8),
    (18, ((RSP\<^sub>0::64 word) - 0x80), 8)
  }\<close>

definition P_0x15e39_true_17_regions :: state_pred where
  \<open>P_0x15e39_true_17_regions \<sigma> \<equiv> \<exists>regions. P_0x15e39_true_17_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x15fed_17 :: state_pred where
  \<open>Q_0x15fed_17 \<sigma> \<equiv> RIP \<sigma> = 0x15fed \<and> RBX \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x78) \<and> R12 \<sigma> = RDI\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> regs \<sigma> ymm0w1 = 0x0 \<and> regs \<sigma> ymm0w0 = 0x0 \<and> (\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word) = ucast ((\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word)\<close>
declare Q_0x15fed_17_def[Qs]

schematic_goal qcow_snapshot_create_0_3_0x15e39_0x160b6_17[blocks]:
  assumes \<open>(P_0x15e39_true_17 && P_0x15e39_true_17_regions && !SF) \<sigma>\<close>
  shows \<open>exec_block 3 0x160b6 17 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x15fed_17 ?\<sigma> \<and> block_usage P_0x15e39_true_17_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x15e39_true_17_def P_0x15e39_true_17_regions_def post: Q_0x15fed_17_def regionset: P_0x15e39_true_17_regions_set_def)

definition P_0x15e39_false_18 :: state_pred where
  \<open>P_0x15e39_false_18 \<sigma> \<equiv> RIP \<sigma> = 0x15e39 \<and> RBX \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> RDI \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x78) \<and> R13 \<sigma> = RSI\<^sub>0 \<and> R12 \<sigma> = RDI\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> regs \<sigma> ymm0w1 = 0x0 \<and> regs \<sigma> ymm0w0 = 0x0 \<and> regs \<sigma> ymm1w1 = ymm1w1\<^sub>0 \<and> regs \<sigma> ymm1w0 = ymm1w0\<^sub>0 \<and> regs \<sigma> ymm2w1 = ymm2w1\<^sub>0 \<and> regs \<sigma> ymm2w0 = ymm2w0\<^sub>0 \<and> regs \<sigma> ymm3w1 = ymm3w1\<^sub>0 \<and> regs \<sigma> ymm3w0 = ymm3w0\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word) = ucast ((\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x48),8]::64 word) = 0x0 \<and> (\<sigma> \<turnstile> *[((((RSP\<^sub>0::64 word) - 0x58)::64 word) + 0x8),8]::64 word) = 0x0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),8]::64 word) = 0x0 \<and> (\<sigma> \<turnstile> *[((((RSP\<^sub>0::64 word) - 0x68)::64 word) + 0x8),8]::64 word) = 0x0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),8]::64 word) = 0x0 \<and> (\<sigma> \<turnstile> *[((((RSP\<^sub>0::64 word) - 0x78)::64 word) + 0x8),8]::64 word) = 0x0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x78),8]::64 word) = 0x0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x80),8]::64 word) = 0x15e37\<close>
declare P_0x15e39_false_18_def[Ps]

definition P_0x15e39_false_18_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x15e39_false_18_regions_set \<sigma> \<equiv> {
    (0, RSI\<^sub>0, Suc 0),
    (1, RSP\<^sub>0, 8),
    (2, ((FS\<^sub>0::64 word) + 0x28), 8),
    (3, ((RDI\<^sub>0::64 word) + 0x40), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x40), 8),
    (11, ((RSP\<^sub>0::64 word) - 0x48), 8),
    (12, ((RSP\<^sub>0::64 word) - 0x50), 8),
    (13, ((RSP\<^sub>0::64 word) - 0x58), 8),
    (14, ((RSP\<^sub>0::64 word) - 0x60), 8),
    (15, ((RSP\<^sub>0::64 word) - 0x68), 8),
    (16, ((RSP\<^sub>0::64 word) - 0x70), 8),
    (17, ((RSP\<^sub>0::64 word) - 0x78), 8),
    (18, ((RSP\<^sub>0::64 word) - 0x80), 8)
  }\<close>

definition P_0x15e39_false_18_regions :: state_pred where
  \<open>P_0x15e39_false_18_regions \<sigma> \<equiv> \<exists>regions. P_0x15e39_false_18_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x15e42_18 :: state_pred where
  \<open>Q_0x15e42_18 \<sigma> \<equiv> RIP \<sigma> = 0x15e42 \<and> RBX \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> RDI \<sigma> = RSI\<^sub>0 \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x78) \<and> R13 \<sigma> = RSI\<^sub>0 \<and> R12 \<sigma> = RDI\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> regs \<sigma> ymm0w1 = 0x0 \<and> regs \<sigma> ymm0w0 = 0x0 \<and> regs \<sigma> ymm1w1 = ymm1w1\<^sub>0 \<and> regs \<sigma> ymm1w0 = ymm1w0\<^sub>0 \<and> regs \<sigma> ymm2w1 = ymm2w1\<^sub>0 \<and> regs \<sigma> ymm2w0 = ymm2w0\<^sub>0 \<and> regs \<sigma> ymm3w1 = ymm3w1\<^sub>0 \<and> regs \<sigma> ymm3w0 = ymm3w0\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word) = ucast ((\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x48),8]::64 word) = 0x0 \<and> (\<sigma> \<turnstile> *[((((RSP\<^sub>0::64 word) - 0x58)::64 word) + 0x8),8]::64 word) = 0x0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),8]::64 word) = 0x0 \<and> (\<sigma> \<turnstile> *[((((RSP\<^sub>0::64 word) - 0x68)::64 word) + 0x8),8]::64 word) = 0x0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),8]::64 word) = 0x0 \<and> (\<sigma> \<turnstile> *[((((RSP\<^sub>0::64 word) - 0x78)::64 word) + 0x8),8]::64 word) = 0x0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x78),8]::64 word) = 0x0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x80),8]::64 word) = 0x15e37\<close>
declare Q_0x15e42_18_def[Qs]

schematic_goal qcow_snapshot_create_0_2_0x15e39_0x15e3f_18[blocks]:
  assumes \<open>(P_0x15e39_false_18 && P_0x15e39_false_18_regions && ! !SF) \<sigma>\<close>
  shows \<open>exec_block 2 0x15e3f 18 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x15e42_18 ?\<sigma> \<and> block_usage P_0x15e39_false_18_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x15e39_false_18_def P_0x15e39_false_18_regions_def post: Q_0x15e42_18_def regionset: P_0x15e39_false_18_regions_set_def)

definition P_0x15e42_19 :: state_pred where
  \<open>P_0x15e42_19 \<sigma> \<equiv> RIP \<sigma> = 0x15e42 \<and> RBX \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> RDI \<sigma> = RSI\<^sub>0 \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x78) \<and> R13 \<sigma> = RSI\<^sub>0 \<and> R12 \<sigma> = RDI\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> regs \<sigma> ymm0w1 = 0x0 \<and> regs \<sigma> ymm0w0 = 0x0 \<and> regs \<sigma> ymm1w1 = ymm1w1\<^sub>0 \<and> regs \<sigma> ymm1w0 = ymm1w0\<^sub>0 \<and> regs \<sigma> ymm2w1 = ymm2w1\<^sub>0 \<and> regs \<sigma> ymm2w0 = ymm2w0\<^sub>0 \<and> regs \<sigma> ymm3w1 = ymm3w1\<^sub>0 \<and> regs \<sigma> ymm3w0 = ymm3w0\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word) = ucast ((\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x48),8]::64 word) = 0x0 \<and> (\<sigma> \<turnstile> *[((((RSP\<^sub>0::64 word) - 0x58)::64 word) + 0x8),8]::64 word) = 0x0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),8]::64 word) = 0x0 \<and> (\<sigma> \<turnstile> *[((((RSP\<^sub>0::64 word) - 0x68)::64 word) + 0x8),8]::64 word) = 0x0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),8]::64 word) = 0x0 \<and> (\<sigma> \<turnstile> *[((((RSP\<^sub>0::64 word) - 0x78)::64 word) + 0x8),8]::64 word) = 0x0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x78),8]::64 word) = 0x0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x80),8]::64 word) = 0x15e37\<close>
declare P_0x15e42_19_def[Ps]

definition P_0x15e42_19_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x15e42_19_regions_set \<sigma> \<equiv> {
    (0, RSI\<^sub>0, Suc 0),
    (1, RSP\<^sub>0, 8),
    (2, ((FS\<^sub>0::64 word) + 0x28), 8),
    (3, ((RDI\<^sub>0::64 word) + 0x40), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x40), 8),
    (11, ((RSP\<^sub>0::64 word) - 0x48), 8),
    (12, ((RSP\<^sub>0::64 word) - 0x50), 8),
    (13, ((RSP\<^sub>0::64 word) - 0x58), 8),
    (14, ((RSP\<^sub>0::64 word) - 0x60), 8),
    (15, ((RSP\<^sub>0::64 word) - 0x68), 8),
    (16, ((RSP\<^sub>0::64 word) - 0x70), 8),
    (17, ((RSP\<^sub>0::64 word) - 0x78), 8),
    (18, ((RSP\<^sub>0::64 word) - 0x80), 8)
  }\<close>

definition P_0x15e42_19_regions :: state_pred where
  \<open>P_0x15e42_19_regions \<sigma> \<equiv> \<exists>regions. P_0x15e42_19_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_qemu_strdup_addr_0x15e42_19 :: state_pred where
  \<open>Q_qemu_strdup_addr_0x15e42_19 \<sigma> \<equiv> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x80) \<and> RIP \<sigma> = qemu_strdup_addr \<and> RBX \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> RDI \<sigma> = RSI\<^sub>0 \<and> RSI \<sigma> = RSI\<^sub>0 \<and> R13 \<sigma> = RSI\<^sub>0 \<and> R12 \<sigma> = RDI\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> regs \<sigma> ymm0w1 = 0x0 \<and> regs \<sigma> ymm0w0 = 0x0 \<and> regs \<sigma> ymm1w1 = ymm1w1\<^sub>0 \<and> regs \<sigma> ymm1w0 = ymm1w0\<^sub>0 \<and> regs \<sigma> ymm2w1 = ymm2w1\<^sub>0 \<and> regs \<sigma> ymm2w0 = ymm2w0\<^sub>0 \<and> regs \<sigma> ymm3w1 = ymm3w1\<^sub>0 \<and> regs \<sigma> ymm3w0 = ymm3w0\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word) = ucast ((\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x48),8]::64 word) = 0x0 \<and> (\<sigma> \<turnstile> *[((((RSP\<^sub>0::64 word) - 0x58)::64 word) + 0x8),8]::64 word) = 0x0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),8]::64 word) = 0x0 \<and> (\<sigma> \<turnstile> *[((((RSP\<^sub>0::64 word) - 0x68)::64 word) + 0x8),8]::64 word) = 0x0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),8]::64 word) = 0x0 \<and> (\<sigma> \<turnstile> *[((((RSP\<^sub>0::64 word) - 0x78)::64 word) + 0x8),8]::64 word) = 0x0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x78),8]::64 word) = 0x0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x80),8]::64 word) = 0x15e47\<close>
declare Q_qemu_strdup_addr_0x15e42_19_def[Qs]

schematic_goal qcow_snapshot_create_0_1_0x15e42_0x15e42_19[blocks]:
  assumes \<open>(P_0x15e42_19 && P_0x15e42_19_regions) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x15e42 19 \<sigma> \<triangleq> ?\<sigma> \<and> Q_qemu_strdup_addr_0x15e42_19 ?\<sigma> \<and> block_usage P_0x15e42_19_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x15e42_19_def P_0x15e42_19_regions_def post: Q_qemu_strdup_addr_0x15e42_19_def regionset: P_0x15e42_19_regions_set_def)

definition P_0x15e47_20 :: state_pred where
  \<open>P_0x15e47_20 \<sigma> \<equiv> RIP \<sigma> = 0x15e47 \<and> RBX \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> RDI \<sigma> = RSI\<^sub>0 \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x78) \<and> R13 \<sigma> = RSI\<^sub>0 \<and> R12 \<sigma> = RDI\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> regs \<sigma> ymm0w1 = 0x0 \<and> regs \<sigma> ymm0w0 = 0x0 \<and> regs \<sigma> ymm1w1 = ymm1w1\<^sub>0 \<and> regs \<sigma> ymm1w0 = ymm1w0\<^sub>0 \<and> regs \<sigma> ymm2w1 = ymm2w1\<^sub>0 \<and> regs \<sigma> ymm2w0 = ymm2w0\<^sub>0 \<and> regs \<sigma> ymm3w1 = ymm3w1\<^sub>0 \<and> regs \<sigma> ymm3w0 = ymm3w0\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word) = ucast ((\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x48),8]::64 word) = 0x0 \<and> (\<sigma> \<turnstile> *[((((RSP\<^sub>0::64 word) - 0x58)::64 word) + 0x8),8]::64 word) = 0x0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),8]::64 word) = 0x0 \<and> (\<sigma> \<turnstile> *[((((RSP\<^sub>0::64 word) - 0x68)::64 word) + 0x8),8]::64 word) = 0x0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),8]::64 word) = 0x0 \<and> (\<sigma> \<turnstile> *[((((RSP\<^sub>0::64 word) - 0x78)::64 word) + 0x8),8]::64 word) = 0x0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x78),8]::64 word) = 0x0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x80),8]::64 word) = 0x15e47\<close>
declare P_0x15e47_20_def[Ps]

definition P_0x15e47_20_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x15e47_20_regions_set \<sigma> \<equiv> {
    (0, RSI\<^sub>0, Suc 0),
    (1, RSP\<^sub>0, 8),
    (2, ((FS\<^sub>0::64 word) + 0x28), 8),
    (3, ((RDI\<^sub>0::64 word) + 0x40), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x40), 8),
    (11, ((RSP\<^sub>0::64 word) - 0x48), 8),
    (12, ((RSP\<^sub>0::64 word) - 0x50), 8),
    (13, ((RSP\<^sub>0::64 word) - 0x58), 8),
    (14, ((RSP\<^sub>0::64 word) - 0x60), 8),
    (15, ((RSP\<^sub>0::64 word) - 0x68), 8),
    (16, ((RSP\<^sub>0::64 word) - 0x70), 8),
    (17, ((RSP\<^sub>0::64 word) - 0x78), 8),
    (18, ((RSP\<^sub>0::64 word) - 0x80), 8)
  }\<close>

definition P_0x15e47_20_regions :: state_pred where
  \<open>P_0x15e47_20_regions \<sigma> \<equiv> \<exists>regions. P_0x15e47_20_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x15e52_20 :: state_pred where
  \<open>Q_0x15e52_20 \<sigma> \<equiv> RIP \<sigma> = 0x15e52 \<and> RBX \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> RDI \<sigma> = RSI\<^sub>0 \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x78) \<and> RBP \<sigma> = RAX \<sigma> \<and> R13 \<sigma> = RSI\<^sub>0 \<and> R12 \<sigma> = RDI\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> regs \<sigma> ymm0w1 = 0x0 \<and> regs \<sigma> ymm0w0 = 0x0 \<and> regs \<sigma> ymm1w1 = ymm1w1\<^sub>0 \<and> regs \<sigma> ymm1w0 = ymm1w0\<^sub>0 \<and> regs \<sigma> ymm2w1 = ymm2w1\<^sub>0 \<and> regs \<sigma> ymm2w0 = ymm2w0\<^sub>0 \<and> regs \<sigma> ymm3w1 = ymm3w1\<^sub>0 \<and> regs \<sigma> ymm3w0 = ymm3w0\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word) = ucast ((\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x48),8]::64 word) = 0x0 \<and> (\<sigma> \<turnstile> *[((((RSP\<^sub>0::64 word) - 0x58)::64 word) + 0x8),8]::64 word) = 0x0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),8]::64 word) = 0x0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),8]::64 word) = RAX \<sigma> \<and> (\<sigma> \<turnstile> *[((((RSP\<^sub>0::64 word) - 0x78)::64 word) + 0x8),8]::64 word) = 0x0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x78),8]::64 word) = 0x0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x80),8]::64 word) = 0x15e47\<close>
declare Q_0x15e52_20_def[Qs]

schematic_goal qcow_snapshot_create_0_3_0x15e47_0x15e4f_20[blocks]:
  assumes \<open>(P_0x15e47_20 && P_0x15e47_20_regions) \<sigma>\<close>
  shows \<open>exec_block 3 0x15e4f 20 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x15e52_20 ?\<sigma> \<and> block_usage P_0x15e47_20_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x15e47_20_def P_0x15e47_20_regions_def post: Q_0x15e52_20_def regionset: P_0x15e47_20_regions_set_def)

definition P_0x15e52_true_21 :: state_pred where
  \<open>P_0x15e52_true_21 \<sigma> \<equiv> RIP \<sigma> = 0x15e52 \<and> RBX \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> RDI \<sigma> = RSI\<^sub>0 \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x78) \<and> RBP \<sigma> = RAX \<sigma> \<and> R13 \<sigma> = RSI\<^sub>0 \<and> R12 \<sigma> = RDI\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> regs \<sigma> ymm0w1 = 0x0 \<and> regs \<sigma> ymm0w0 = 0x0 \<and> regs \<sigma> ymm1w1 = ymm1w1\<^sub>0 \<and> regs \<sigma> ymm1w0 = ymm1w0\<^sub>0 \<and> regs \<sigma> ymm2w1 = ymm2w1\<^sub>0 \<and> regs \<sigma> ymm2w0 = ymm2w0\<^sub>0 \<and> regs \<sigma> ymm3w1 = ymm3w1\<^sub>0 \<and> regs \<sigma> ymm3w0 = ymm3w0\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word) = ucast ((\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x48),8]::64 word) = 0x0 \<and> (\<sigma> \<turnstile> *[((((RSP\<^sub>0::64 word) - 0x58)::64 word) + 0x8),8]::64 word) = 0x0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),8]::64 word) = 0x0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),8]::64 word) = RAX \<sigma> \<and> (\<sigma> \<turnstile> *[((((RSP\<^sub>0::64 word) - 0x78)::64 word) + 0x8),8]::64 word) = 0x0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x78),8]::64 word) = 0x0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x80),8]::64 word) = 0x15e47\<close>
declare P_0x15e52_true_21_def[Ps]

definition P_0x15e52_true_21_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x15e52_true_21_regions_set \<sigma> \<equiv> {
    (0, RSI\<^sub>0, Suc 0),
    (1, RSP\<^sub>0, 8),
    (2, ((FS\<^sub>0::64 word) + 0x28), 8),
    (3, ((RDI\<^sub>0::64 word) + 0x40), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x40), 8),
    (11, ((RSP\<^sub>0::64 word) - 0x48), 8),
    (12, ((RSP\<^sub>0::64 word) - 0x50), 8),
    (13, ((RSP\<^sub>0::64 word) - 0x58), 8),
    (14, ((RSP\<^sub>0::64 word) - 0x68), 8),
    (15, ((RSP\<^sub>0::64 word) - 0x70), 8),
    (16, ((RSP\<^sub>0::64 word) - 0x78), 8),
    (17, ((RSP\<^sub>0::64 word) - 0x80), 8)
  }\<close>

definition P_0x15e52_true_21_regions :: state_pred where
  \<open>P_0x15e52_true_21_regions \<sigma> \<equiv> \<exists>regions. P_0x15e52_true_21_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x1608f_21 :: state_pred where
  \<open>Q_0x1608f_21 \<sigma> \<equiv> RIP \<sigma> = 0x1608f \<and> RBX \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> RDI \<sigma> = RSI\<^sub>0 \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x78) \<and> RBP \<sigma> = RAX \<sigma> \<and> R13 \<sigma> = 0x0 \<and> R12 \<sigma> = RDI\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> regs \<sigma> ymm0w1 = 0x0 \<and> regs \<sigma> ymm0w0 = 0x0 \<and> regs \<sigma> ymm1w1 = ymm1w1\<^sub>0 \<and> regs \<sigma> ymm1w0 = ymm1w0\<^sub>0 \<and> regs \<sigma> ymm2w1 = ymm2w1\<^sub>0 \<and> regs \<sigma> ymm2w0 = ymm2w0\<^sub>0 \<and> regs \<sigma> ymm3w1 = ymm3w1\<^sub>0 \<and> regs \<sigma> ymm3w0 = ymm3w0\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word) = ucast ((\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x48),8]::64 word) = 0x0 \<and> (\<sigma> \<turnstile> *[((((RSP\<^sub>0::64 word) - 0x58)::64 word) + 0x8),8]::64 word) = 0x0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),8]::64 word) = 0x0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),8]::64 word) = RAX \<sigma> \<and> (\<sigma> \<turnstile> *[((((RSP\<^sub>0::64 word) - 0x78)::64 word) + 0x8),8]::64 word) = 0x0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x78),8]::64 word) = 0x0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x80),8]::64 word) = 0x15e47\<close>
declare Q_0x1608f_21_def[Qs]

schematic_goal qcow_snapshot_create_0_2_0x15e52_0x1608c_21[blocks]:
  assumes \<open>(P_0x15e52_true_21 && P_0x15e52_true_21_regions && ZF) \<sigma>\<close>
  shows \<open>exec_block 2 0x1608c 21 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x1608f_21 ?\<sigma> \<and> block_usage P_0x15e52_true_21_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x15e52_true_21_def P_0x15e52_true_21_regions_def post: Q_0x1608f_21_def regionset: P_0x15e52_true_21_regions_set_def)

definition P_0x1608f_22 :: state_pred where
  \<open>P_0x1608f_22 \<sigma> \<equiv> RIP \<sigma> = 0x1608f \<and> RBX \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> RDI \<sigma> = RSI\<^sub>0 \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x78) \<and> RBP \<sigma> = RAX \<sigma> \<and> R13 \<sigma> = 0x0 \<and> R12 \<sigma> = RDI\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> regs \<sigma> ymm0w1 = 0x0 \<and> regs \<sigma> ymm0w0 = 0x0 \<and> regs \<sigma> ymm1w1 = ymm1w1\<^sub>0 \<and> regs \<sigma> ymm1w0 = ymm1w0\<^sub>0 \<and> regs \<sigma> ymm2w1 = ymm2w1\<^sub>0 \<and> regs \<sigma> ymm2w0 = ymm2w0\<^sub>0 \<and> regs \<sigma> ymm3w1 = ymm3w1\<^sub>0 \<and> regs \<sigma> ymm3w0 = ymm3w0\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word) = ucast ((\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x48),8]::64 word) = 0x0 \<and> (\<sigma> \<turnstile> *[((((RSP\<^sub>0::64 word) - 0x58)::64 word) + 0x8),8]::64 word) = 0x0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),8]::64 word) = 0x0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),8]::64 word) = RAX \<sigma> \<and> (\<sigma> \<turnstile> *[((((RSP\<^sub>0::64 word) - 0x78)::64 word) + 0x8),8]::64 word) = 0x0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x78),8]::64 word) = 0x0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x80),8]::64 word) = 0x15e47\<close>
declare P_0x1608f_22_def[Ps]

definition P_0x1608f_22_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x1608f_22_regions_set \<sigma> \<equiv> {
    (0, RSI\<^sub>0, Suc 0),
    (1, RSP\<^sub>0, 8),
    (2, ((FS\<^sub>0::64 word) + 0x28), 8),
    (3, ((RDI\<^sub>0::64 word) + 0x40), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x40), 8),
    (11, ((RSP\<^sub>0::64 word) - 0x48), 8),
    (12, ((RSP\<^sub>0::64 word) - 0x50), 8),
    (13, ((RSP\<^sub>0::64 word) - 0x58), 8),
    (14, ((RSP\<^sub>0::64 word) - 0x68), 8),
    (15, ((RSP\<^sub>0::64 word) - 0x70), 8),
    (16, ((RSP\<^sub>0::64 word) - 0x78), 8),
    (17, ((RSP\<^sub>0::64 word) - 0x80), 8)
  }\<close>

definition P_0x1608f_22_regions :: state_pred where
  \<open>P_0x1608f_22_regions \<sigma> \<equiv> \<exists>regions. P_0x1608f_22_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x16092_22 :: state_pred where
  \<open>Q_0x16092_22 \<sigma> \<equiv> RIP \<sigma> = 0x16092 \<and> RBX \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> RDI \<sigma> = RAX \<sigma> \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x78) \<and> RBP \<sigma> = RAX \<sigma> \<and> R13 \<sigma> = 0x0 \<and> R12 \<sigma> = RDI\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> regs \<sigma> ymm0w1 = 0x0 \<and> regs \<sigma> ymm0w0 = 0x0 \<and> regs \<sigma> ymm1w1 = ymm1w1\<^sub>0 \<and> regs \<sigma> ymm1w0 = ymm1w0\<^sub>0 \<and> regs \<sigma> ymm2w1 = ymm2w1\<^sub>0 \<and> regs \<sigma> ymm2w0 = ymm2w0\<^sub>0 \<and> regs \<sigma> ymm3w1 = ymm3w1\<^sub>0 \<and> regs \<sigma> ymm3w0 = ymm3w0\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word) = ucast ((\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x48),8]::64 word) = 0x0 \<and> (\<sigma> \<turnstile> *[((((RSP\<^sub>0::64 word) - 0x58)::64 word) + 0x8),8]::64 word) = 0x0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),8]::64 word) = 0x0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),8]::64 word) = RAX \<sigma> \<and> (\<sigma> \<turnstile> *[((((RSP\<^sub>0::64 word) - 0x78)::64 word) + 0x8),8]::64 word) = 0x0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x78),8]::64 word) = 0x0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x80),8]::64 word) = 0x15e47\<close>
declare Q_0x16092_22_def[Qs]

schematic_goal qcow_snapshot_create_0_1_0x1608f_0x1608f_22[blocks]:
  assumes \<open>(P_0x1608f_22 && P_0x1608f_22_regions) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x1608f 22 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x16092_22 ?\<sigma> \<and> block_usage P_0x1608f_22_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x1608f_22_def P_0x1608f_22_regions_def post: Q_0x16092_22_def regionset: P_0x1608f_22_regions_set_def)

definition P_0x16092_23 :: state_pred where
  \<open>P_0x16092_23 \<sigma> \<equiv> RIP \<sigma> = 0x16092 \<and> RBX \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> RDI \<sigma> = RAX \<sigma> \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x78) \<and> RBP \<sigma> = RAX \<sigma> \<and> R13 \<sigma> = 0x0 \<and> R12 \<sigma> = RDI\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> regs \<sigma> ymm0w1 = 0x0 \<and> regs \<sigma> ymm0w0 = 0x0 \<and> regs \<sigma> ymm1w1 = ymm1w1\<^sub>0 \<and> regs \<sigma> ymm1w0 = ymm1w0\<^sub>0 \<and> regs \<sigma> ymm2w1 = ymm2w1\<^sub>0 \<and> regs \<sigma> ymm2w0 = ymm2w0\<^sub>0 \<and> regs \<sigma> ymm3w1 = ymm3w1\<^sub>0 \<and> regs \<sigma> ymm3w0 = ymm3w0\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word) = ucast ((\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x48),8]::64 word) = 0x0 \<and> (\<sigma> \<turnstile> *[((((RSP\<^sub>0::64 word) - 0x58)::64 word) + 0x8),8]::64 word) = 0x0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),8]::64 word) = 0x0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),8]::64 word) = RAX \<sigma> \<and> (\<sigma> \<turnstile> *[((((RSP\<^sub>0::64 word) - 0x78)::64 word) + 0x8),8]::64 word) = 0x0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x78),8]::64 word) = 0x0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x80),8]::64 word) = 0x15e47\<close>
declare P_0x16092_23_def[Ps]

definition P_0x16092_23_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x16092_23_regions_set \<sigma> \<equiv> {
    (0, RSI\<^sub>0, Suc 0),
    (1, RSP\<^sub>0, 8),
    (2, ((FS\<^sub>0::64 word) + 0x28), 8),
    (3, ((RDI\<^sub>0::64 word) + 0x40), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x40), 8),
    (11, ((RSP\<^sub>0::64 word) - 0x48), 8),
    (12, ((RSP\<^sub>0::64 word) - 0x50), 8),
    (13, ((RSP\<^sub>0::64 word) - 0x58), 8),
    (14, ((RSP\<^sub>0::64 word) - 0x68), 8),
    (15, ((RSP\<^sub>0::64 word) - 0x70), 8),
    (16, ((RSP\<^sub>0::64 word) - 0x78), 8),
    (17, ((RSP\<^sub>0::64 word) - 0x80), 8)
  }\<close>

definition P_0x16092_23_regions :: state_pred where
  \<open>P_0x16092_23_regions \<sigma> \<equiv> \<exists>regions. P_0x16092_23_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_qemu_free_addr_0x16092_23 :: state_pred where
  \<open>Q_qemu_free_addr_0x16092_23 \<sigma> \<equiv> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x80) \<and> RIP \<sigma> = qemu_free_addr \<and> RBX \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> RSI \<sigma> = RSI\<^sub>0 \<and> R13 \<sigma> = 0x0 \<and> R12 \<sigma> = RDI\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> regs \<sigma> ymm0w1 = 0x0 \<and> regs \<sigma> ymm0w0 = 0x0 \<and> regs \<sigma> ymm1w1 = ymm1w1\<^sub>0 \<and> regs \<sigma> ymm1w0 = ymm1w0\<^sub>0 \<and> regs \<sigma> ymm2w1 = ymm2w1\<^sub>0 \<and> regs \<sigma> ymm2w0 = ymm2w0\<^sub>0 \<and> regs \<sigma> ymm3w1 = ymm3w1\<^sub>0 \<and> regs \<sigma> ymm3w0 = ymm3w0\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word) = ucast ((\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x48),8]::64 word) = 0x0 \<and> (\<sigma> \<turnstile> *[((((RSP\<^sub>0::64 word) - 0x58)::64 word) + 0x8),8]::64 word) = 0x0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),8]::64 word) = 0x0 \<and> (\<sigma> \<turnstile> *[((((RSP\<^sub>0::64 word) - 0x78)::64 word) + 0x8),8]::64 word) = 0x0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x78),8]::64 word) = 0x0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x80),8]::64 word) = 0x16097\<close>
declare Q_qemu_free_addr_0x16092_23_def[Qs]

schematic_goal qcow_snapshot_create_0_1_0x16092_0x16092_23[blocks]:
  assumes \<open>(P_0x16092_23 && P_0x16092_23_regions) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x16092 23 \<sigma> \<triangleq> ?\<sigma> \<and> Q_qemu_free_addr_0x16092_23 ?\<sigma> \<and> block_usage P_0x16092_23_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x16092_23_def P_0x16092_23_regions_def post: Q_qemu_free_addr_0x16092_23_def regionset: P_0x16092_23_regions_set_def)

definition P_0x16097_24 :: state_pred where
  \<open>P_0x16097_24 \<sigma> \<equiv> RIP \<sigma> = 0x16097 \<and> RBX \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x78) \<and> R13 \<sigma> = 0x0 \<and> R12 \<sigma> = RDI\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> regs \<sigma> ymm0w1 = 0x0 \<and> regs \<sigma> ymm0w0 = 0x0 \<and> regs \<sigma> ymm1w1 = ymm1w1\<^sub>0 \<and> regs \<sigma> ymm1w0 = ymm1w0\<^sub>0 \<and> regs \<sigma> ymm2w1 = ymm2w1\<^sub>0 \<and> regs \<sigma> ymm2w0 = ymm2w0\<^sub>0 \<and> regs \<sigma> ymm3w1 = ymm3w1\<^sub>0 \<and> regs \<sigma> ymm3w0 = ymm3w0\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word) = ucast ((\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x48),8]::64 word) = 0x0 \<and> (\<sigma> \<turnstile> *[((((RSP\<^sub>0::64 word) - 0x58)::64 word) + 0x8),8]::64 word) = 0x0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),8]::64 word) = 0x0 \<and> (\<sigma> \<turnstile> *[((((RSP\<^sub>0::64 word) - 0x78)::64 word) + 0x8),8]::64 word) = 0x0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x78),8]::64 word) = 0x0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x80),8]::64 word) = 0x16097\<close>
declare P_0x16097_24_def[Ps]

definition P_0x16097_24_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x16097_24_regions_set \<sigma> \<equiv> {
    (0, RSI\<^sub>0, Suc 0),
    (1, RSP\<^sub>0, 8),
    (2, ((FS\<^sub>0::64 word) + 0x28), 8),
    (3, ((RDI\<^sub>0::64 word) + 0x40), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x40), 8),
    (11, ((RSP\<^sub>0::64 word) - 0x48), 8),
    (12, ((RSP\<^sub>0::64 word) - 0x50), 8),
    (13, ((RSP\<^sub>0::64 word) - 0x58), 8),
    (14, ((RSP\<^sub>0::64 word) - 0x70), 8),
    (15, ((RSP\<^sub>0::64 word) - 0x78), 8),
    (16, ((RSP\<^sub>0::64 word) - 0x80), 8)
  }\<close>

definition P_0x16097_24_regions :: state_pred where
  \<open>P_0x16097_24_regions \<sigma> \<equiv> \<exists>regions. P_0x16097_24_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x1609a_24 :: state_pred where
  \<open>Q_0x1609a_24 \<sigma> \<equiv> RIP \<sigma> = 0x1609a \<and> RBX \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> RDI \<sigma> = 0x0 \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x78) \<and> R13 \<sigma> = 0x0 \<and> R12 \<sigma> = RDI\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> regs \<sigma> ymm0w1 = 0x0 \<and> regs \<sigma> ymm0w0 = 0x0 \<and> regs \<sigma> ymm1w1 = ymm1w1\<^sub>0 \<and> regs \<sigma> ymm1w0 = ymm1w0\<^sub>0 \<and> regs \<sigma> ymm2w1 = ymm2w1\<^sub>0 \<and> regs \<sigma> ymm2w0 = ymm2w0\<^sub>0 \<and> regs \<sigma> ymm3w1 = ymm3w1\<^sub>0 \<and> regs \<sigma> ymm3w0 = ymm3w0\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word) = ucast ((\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x48),8]::64 word) = 0x0 \<and> (\<sigma> \<turnstile> *[((((RSP\<^sub>0::64 word) - 0x58)::64 word) + 0x8),8]::64 word) = 0x0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),8]::64 word) = 0x0 \<and> (\<sigma> \<turnstile> *[((((RSP\<^sub>0::64 word) - 0x78)::64 word) + 0x8),8]::64 word) = 0x0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x78),8]::64 word) = 0x0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x80),8]::64 word) = 0x16097\<close>
declare Q_0x1609a_24_def[Qs]

schematic_goal qcow_snapshot_create_0_1_0x16097_0x16097_24[blocks]:
  assumes \<open>(P_0x16097_24 && P_0x16097_24_regions) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x16097 24 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x1609a_24 ?\<sigma> \<and> block_usage P_0x16097_24_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x16097_24_def P_0x16097_24_regions_def post: Q_0x1609a_24_def regionset: P_0x16097_24_regions_set_def)

definition P_0x1609a_25 :: state_pred where
  \<open>P_0x1609a_25 \<sigma> \<equiv> RIP \<sigma> = 0x1609a \<and> RBX \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> RDI \<sigma> = 0x0 \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x78) \<and> R13 \<sigma> = 0x0 \<and> R12 \<sigma> = RDI\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> regs \<sigma> ymm0w1 = 0x0 \<and> regs \<sigma> ymm0w0 = 0x0 \<and> regs \<sigma> ymm1w1 = ymm1w1\<^sub>0 \<and> regs \<sigma> ymm1w0 = ymm1w0\<^sub>0 \<and> regs \<sigma> ymm2w1 = ymm2w1\<^sub>0 \<and> regs \<sigma> ymm2w0 = ymm2w0\<^sub>0 \<and> regs \<sigma> ymm3w1 = ymm3w1\<^sub>0 \<and> regs \<sigma> ymm3w0 = ymm3w0\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word) = ucast ((\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x48),8]::64 word) = 0x0 \<and> (\<sigma> \<turnstile> *[((((RSP\<^sub>0::64 word) - 0x58)::64 word) + 0x8),8]::64 word) = 0x0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),8]::64 word) = 0x0 \<and> (\<sigma> \<turnstile> *[((((RSP\<^sub>0::64 word) - 0x78)::64 word) + 0x8),8]::64 word) = 0x0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x78),8]::64 word) = 0x0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x80),8]::64 word) = 0x16097\<close>
declare P_0x1609a_25_def[Ps]

definition P_0x1609a_25_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x1609a_25_regions_set \<sigma> \<equiv> {
    (0, RSI\<^sub>0, Suc 0),
    (1, RSP\<^sub>0, 8),
    (2, ((FS\<^sub>0::64 word) + 0x28), 8),
    (3, ((RDI\<^sub>0::64 word) + 0x40), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x40), 8),
    (11, ((RSP\<^sub>0::64 word) - 0x48), 8),
    (12, ((RSP\<^sub>0::64 word) - 0x50), 8),
    (13, ((RSP\<^sub>0::64 word) - 0x58), 8),
    (14, ((RSP\<^sub>0::64 word) - 0x70), 8),
    (15, ((RSP\<^sub>0::64 word) - 0x78), 8),
    (16, ((RSP\<^sub>0::64 word) - 0x80), 8)
  }\<close>

definition P_0x1609a_25_regions :: state_pred where
  \<open>P_0x1609a_25_regions \<sigma> \<equiv> \<exists>regions. P_0x1609a_25_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_qemu_free_addr_0x1609a_25 :: state_pred where
  \<open>Q_qemu_free_addr_0x1609a_25 \<sigma> \<equiv> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x80) \<and> RIP \<sigma> = qemu_free_addr \<and> RBX \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> RDI \<sigma> = 0x0 \<and> RSI \<sigma> = RSI\<^sub>0 \<and> R13 \<sigma> = 0x0 \<and> R12 \<sigma> = RDI\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> regs \<sigma> ymm0w1 = 0x0 \<and> regs \<sigma> ymm0w0 = 0x0 \<and> regs \<sigma> ymm1w1 = ymm1w1\<^sub>0 \<and> regs \<sigma> ymm1w0 = ymm1w0\<^sub>0 \<and> regs \<sigma> ymm2w1 = ymm2w1\<^sub>0 \<and> regs \<sigma> ymm2w0 = ymm2w0\<^sub>0 \<and> regs \<sigma> ymm3w1 = ymm3w1\<^sub>0 \<and> regs \<sigma> ymm3w0 = ymm3w0\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word) = ucast ((\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x48),8]::64 word) = 0x0 \<and> (\<sigma> \<turnstile> *[((((RSP\<^sub>0::64 word) - 0x58)::64 word) + 0x8),8]::64 word) = 0x0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),8]::64 word) = 0x0 \<and> (\<sigma> \<turnstile> *[((((RSP\<^sub>0::64 word) - 0x78)::64 word) + 0x8),8]::64 word) = 0x0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x78),8]::64 word) = 0x0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x80),8]::64 word) = 0x1609f\<close>
declare Q_qemu_free_addr_0x1609a_25_def[Qs]

schematic_goal qcow_snapshot_create_0_1_0x1609a_0x1609a_25[blocks]:
  assumes \<open>(P_0x1609a_25 && P_0x1609a_25_regions) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x1609a 25 \<sigma> \<triangleq> ?\<sigma> \<and> Q_qemu_free_addr_0x1609a_25 ?\<sigma> \<and> block_usage P_0x1609a_25_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x1609a_25_def P_0x1609a_25_regions_def post: Q_qemu_free_addr_0x1609a_25_def regionset: P_0x1609a_25_regions_set_def)

definition P_0x1609f_26 :: state_pred where
  \<open>P_0x1609f_26 \<sigma> \<equiv> RIP \<sigma> = 0x1609f \<and> RBX \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> RDI \<sigma> = 0x0 \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x78) \<and> R13 \<sigma> = 0x0 \<and> R12 \<sigma> = RDI\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> regs \<sigma> ymm0w1 = 0x0 \<and> regs \<sigma> ymm0w0 = 0x0 \<and> regs \<sigma> ymm1w1 = ymm1w1\<^sub>0 \<and> regs \<sigma> ymm1w0 = ymm1w0\<^sub>0 \<and> regs \<sigma> ymm2w1 = ymm2w1\<^sub>0 \<and> regs \<sigma> ymm2w0 = ymm2w0\<^sub>0 \<and> regs \<sigma> ymm3w1 = ymm3w1\<^sub>0 \<and> regs \<sigma> ymm3w0 = ymm3w0\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word) = ucast ((\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x48),8]::64 word) = 0x0 \<and> (\<sigma> \<turnstile> *[((((RSP\<^sub>0::64 word) - 0x58)::64 word) + 0x8),8]::64 word) = 0x0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),8]::64 word) = 0x0 \<and> (\<sigma> \<turnstile> *[((((RSP\<^sub>0::64 word) - 0x78)::64 word) + 0x8),8]::64 word) = 0x0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x78),8]::64 word) = 0x0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x80),8]::64 word) = 0x1609f\<close>
declare P_0x1609f_26_def[Ps]

definition P_0x1609f_26_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x1609f_26_regions_set \<sigma> \<equiv> {
    (0, RSI\<^sub>0, Suc 0),
    (1, RSP\<^sub>0, 8),
    (2, ((FS\<^sub>0::64 word) + 0x28), 8),
    (3, ((RDI\<^sub>0::64 word) + 0x40), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x40), 8),
    (11, ((RSP\<^sub>0::64 word) - 0x48), 8),
    (12, ((RSP\<^sub>0::64 word) - 0x50), 8),
    (13, ((RSP\<^sub>0::64 word) - 0x58), 8),
    (14, ((RSP\<^sub>0::64 word) - 0x70), 8),
    (15, ((RSP\<^sub>0::64 word) - 0x78), 8),
    (16, ((RSP\<^sub>0::64 word) - 0x80), 8)
  }\<close>

definition P_0x1609f_26_regions :: state_pred where
  \<open>P_0x1609f_26_regions \<sigma> \<equiv> \<exists>regions. P_0x1609f_26_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x15fed_26 :: state_pred where
  \<open>Q_0x15fed_26 \<sigma> \<equiv> RIP \<sigma> = 0x15fed \<and> RBX \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x78) \<and> R12 \<sigma> = RDI\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> regs \<sigma> ymm0w1 = 0x0 \<and> regs \<sigma> ymm0w0 = 0x0 \<and> (\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word) = ucast ((\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word)\<close>
declare Q_0x15fed_26_def[Qs]

schematic_goal qcow_snapshot_create_0_2_0x1609f_0x160a4_26[blocks]:
  assumes \<open>(P_0x1609f_26 && P_0x1609f_26_regions) \<sigma>\<close>
  shows \<open>exec_block 2 0x160a4 26 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x15fed_26 ?\<sigma> \<and> block_usage P_0x1609f_26_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x1609f_26_def P_0x1609f_26_regions_def post: Q_0x15fed_26_def regionset: P_0x1609f_26_regions_set_def)

definition P_0x15e52_false_27 :: state_pred where
  \<open>P_0x15e52_false_27 \<sigma> \<equiv> RIP \<sigma> = 0x15e52 \<and> RBX \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> RDI \<sigma> = RSI\<^sub>0 \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x78) \<and> RBP \<sigma> = RAX \<sigma> \<and> R13 \<sigma> = RSI\<^sub>0 \<and> R12 \<sigma> = RDI\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> regs \<sigma> ymm0w1 = 0x0 \<and> regs \<sigma> ymm0w0 = 0x0 \<and> regs \<sigma> ymm1w1 = ymm1w1\<^sub>0 \<and> regs \<sigma> ymm1w0 = ymm1w0\<^sub>0 \<and> regs \<sigma> ymm2w1 = ymm2w1\<^sub>0 \<and> regs \<sigma> ymm2w0 = ymm2w0\<^sub>0 \<and> regs \<sigma> ymm3w1 = ymm3w1\<^sub>0 \<and> regs \<sigma> ymm3w0 = ymm3w0\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word) = ucast ((\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x48),8]::64 word) = 0x0 \<and> (\<sigma> \<turnstile> *[((((RSP\<^sub>0::64 word) - 0x58)::64 word) + 0x8),8]::64 word) = 0x0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),8]::64 word) = 0x0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),8]::64 word) = RAX \<sigma> \<and> (\<sigma> \<turnstile> *[((((RSP\<^sub>0::64 word) - 0x78)::64 word) + 0x8),8]::64 word) = 0x0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x78),8]::64 word) = 0x0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x80),8]::64 word) = 0x15e47\<close>
declare P_0x15e52_false_27_def[Ps]

definition P_0x15e52_false_27_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x15e52_false_27_regions_set \<sigma> \<equiv> {
    (0, RSI\<^sub>0, Suc 0),
    (1, RSP\<^sub>0, 8),
    (2, ((FS\<^sub>0::64 word) + 0x28), 8),
    (3, ((RDI\<^sub>0::64 word) + 0x40), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x40), 8),
    (11, ((RSP\<^sub>0::64 word) - 0x48), 8),
    (12, ((RSP\<^sub>0::64 word) - 0x50), 8),
    (13, ((RSP\<^sub>0::64 word) - 0x58), 8),
    (14, ((RSP\<^sub>0::64 word) - 0x68), 8),
    (15, ((RSP\<^sub>0::64 word) - 0x70), 8),
    (16, ((RSP\<^sub>0::64 word) - 0x78), 8),
    (17, ((RSP\<^sub>0::64 word) - 0x80), 8)
  }\<close>

definition P_0x15e52_false_27_regions :: state_pred where
  \<open>P_0x15e52_false_27_regions \<sigma> \<equiv> \<exists>regions. P_0x15e52_false_27_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x15e5f_27 :: state_pred where
  \<open>Q_0x15e5f_27 \<sigma> \<equiv> RIP \<sigma> = 0x15e5f \<and> RBX \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> RDI \<sigma> = ((RSI\<^sub>0::64 word) + 0x80) \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x78) \<and> RBP \<sigma> = RAX \<sigma> \<and> R13 \<sigma> = RSI\<^sub>0 \<and> R12 \<sigma> = RDI\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> regs \<sigma> ymm0w1 = 0x0 \<and> regs \<sigma> ymm0w0 = 0x0 \<and> regs \<sigma> ymm1w1 = ymm1w1\<^sub>0 \<and> regs \<sigma> ymm1w0 = ymm1w0\<^sub>0 \<and> regs \<sigma> ymm2w1 = ymm2w1\<^sub>0 \<and> regs \<sigma> ymm2w0 = ymm2w0\<^sub>0 \<and> regs \<sigma> ymm3w1 = ymm3w1\<^sub>0 \<and> regs \<sigma> ymm3w0 = ymm3w0\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word) = ucast ((\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x48),8]::64 word) = 0x0 \<and> (\<sigma> \<turnstile> *[((((RSP\<^sub>0::64 word) - 0x58)::64 word) + 0x8),8]::64 word) = 0x0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),8]::64 word) = 0x0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),8]::64 word) = RAX \<sigma> \<and> (\<sigma> \<turnstile> *[((((RSP\<^sub>0::64 word) - 0x78)::64 word) + 0x8),8]::64 word) = 0x0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x78),8]::64 word) = 0x0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x80),8]::64 word) = 0x15e47\<close>
declare Q_0x15e5f_27_def[Qs]

schematic_goal qcow_snapshot_create_0_2_0x15e52_0x15e58_27[blocks]:
  assumes \<open>(P_0x15e52_false_27 && P_0x15e52_false_27_regions && ! ZF) \<sigma>\<close>
  shows \<open>exec_block 2 0x15e58 27 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x15e5f_27 ?\<sigma> \<and> block_usage P_0x15e52_false_27_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x15e52_false_27_def P_0x15e52_false_27_regions_def post: Q_0x15e5f_27_def regionset: P_0x15e52_false_27_regions_set_def)

definition P_0x15e5f_28 :: state_pred where
  \<open>P_0x15e5f_28 \<sigma> \<equiv> RIP \<sigma> = 0x15e5f \<and> RBX \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> RDI \<sigma> = ((RSI\<^sub>0::64 word) + 0x80) \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x78) \<and> RBP \<sigma> = RAX \<sigma> \<and> R13 \<sigma> = RSI\<^sub>0 \<and> R12 \<sigma> = RDI\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> regs \<sigma> ymm0w1 = 0x0 \<and> regs \<sigma> ymm0w0 = 0x0 \<and> regs \<sigma> ymm1w1 = ymm1w1\<^sub>0 \<and> regs \<sigma> ymm1w0 = ymm1w0\<^sub>0 \<and> regs \<sigma> ymm2w1 = ymm2w1\<^sub>0 \<and> regs \<sigma> ymm2w0 = ymm2w0\<^sub>0 \<and> regs \<sigma> ymm3w1 = ymm3w1\<^sub>0 \<and> regs \<sigma> ymm3w0 = ymm3w0\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word) = ucast ((\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x48),8]::64 word) = 0x0 \<and> (\<sigma> \<turnstile> *[((((RSP\<^sub>0::64 word) - 0x58)::64 word) + 0x8),8]::64 word) = 0x0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),8]::64 word) = 0x0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),8]::64 word) = RAX \<sigma> \<and> (\<sigma> \<turnstile> *[((((RSP\<^sub>0::64 word) - 0x78)::64 word) + 0x8),8]::64 word) = 0x0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x78),8]::64 word) = 0x0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x80),8]::64 word) = 0x15e47\<close>
declare P_0x15e5f_28_def[Ps]

definition P_0x15e5f_28_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x15e5f_28_regions_set \<sigma> \<equiv> {
    (0, RSI\<^sub>0, Suc 0),
    (1, RSP\<^sub>0, 8),
    (2, ((FS\<^sub>0::64 word) + 0x28), 8),
    (3, ((RDI\<^sub>0::64 word) + 0x40), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x40), 8),
    (11, ((RSP\<^sub>0::64 word) - 0x48), 8),
    (12, ((RSP\<^sub>0::64 word) - 0x50), 8),
    (13, ((RSP\<^sub>0::64 word) - 0x58), 8),
    (14, ((RSP\<^sub>0::64 word) - 0x68), 8),
    (15, ((RSP\<^sub>0::64 word) - 0x70), 8),
    (16, ((RSP\<^sub>0::64 word) - 0x78), 8),
    (17, ((RSP\<^sub>0::64 word) - 0x80), 8)
  }\<close>

definition P_0x15e5f_28_regions :: state_pred where
  \<open>P_0x15e5f_28_regions \<sigma> \<equiv> \<exists>regions. P_0x15e5f_28_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_qemu_strdup_addr_0x15e5f_28 :: state_pred where
  \<open>Q_qemu_strdup_addr_0x15e5f_28 \<sigma> \<equiv> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x80) \<and> RIP \<sigma> = qemu_strdup_addr \<and> RBX \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> RDI \<sigma> = ((RSI\<^sub>0::64 word) + 0x80) \<and> RSI \<sigma> = RSI\<^sub>0 \<and> R13 \<sigma> = RSI\<^sub>0 \<and> R12 \<sigma> = RDI\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> regs \<sigma> ymm0w1 = 0x0 \<and> regs \<sigma> ymm0w0 = 0x0 \<and> regs \<sigma> ymm1w1 = ymm1w1\<^sub>0 \<and> regs \<sigma> ymm1w0 = ymm1w0\<^sub>0 \<and> regs \<sigma> ymm2w1 = ymm2w1\<^sub>0 \<and> regs \<sigma> ymm2w0 = ymm2w0\<^sub>0 \<and> regs \<sigma> ymm3w1 = ymm3w1\<^sub>0 \<and> regs \<sigma> ymm3w0 = ymm3w0\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word) = ucast ((\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x48),8]::64 word) = 0x0 \<and> (\<sigma> \<turnstile> *[((((RSP\<^sub>0::64 word) - 0x58)::64 word) + 0x8),8]::64 word) = 0x0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),8]::64 word) = 0x0 \<and> (\<sigma> \<turnstile> *[((((RSP\<^sub>0::64 word) - 0x78)::64 word) + 0x8),8]::64 word) = 0x0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x78),8]::64 word) = 0x0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x80),8]::64 word) = 0x15e64\<close>
declare Q_qemu_strdup_addr_0x15e5f_28_def[Qs]

schematic_goal qcow_snapshot_create_0_1_0x15e5f_0x15e5f_28[blocks]:
  assumes \<open>(P_0x15e5f_28 && P_0x15e5f_28_regions) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x15e5f 28 \<sigma> \<triangleq> ?\<sigma> \<and> Q_qemu_strdup_addr_0x15e5f_28 ?\<sigma> \<and> block_usage P_0x15e5f_28_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x15e5f_28_def P_0x15e5f_28_regions_def post: Q_qemu_strdup_addr_0x15e5f_28_def regionset: P_0x15e5f_28_regions_set_def)

definition P_0x15e64_29 :: state_pred where
  \<open>P_0x15e64_29 \<sigma> \<equiv> RIP \<sigma> = 0x15e64 \<and> RBX \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> RDI \<sigma> = ((RSI\<^sub>0::64 word) + 0x80) \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x78) \<and> R13 \<sigma> = RSI\<^sub>0 \<and> R12 \<sigma> = RDI\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> regs \<sigma> ymm0w1 = 0x0 \<and> regs \<sigma> ymm0w0 = 0x0 \<and> regs \<sigma> ymm1w1 = ymm1w1\<^sub>0 \<and> regs \<sigma> ymm1w0 = ymm1w0\<^sub>0 \<and> regs \<sigma> ymm2w1 = ymm2w1\<^sub>0 \<and> regs \<sigma> ymm2w0 = ymm2w0\<^sub>0 \<and> regs \<sigma> ymm3w1 = ymm3w1\<^sub>0 \<and> regs \<sigma> ymm3w0 = ymm3w0\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word) = ucast ((\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x48),8]::64 word) = 0x0 \<and> (\<sigma> \<turnstile> *[((((RSP\<^sub>0::64 word) - 0x58)::64 word) + 0x8),8]::64 word) = 0x0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),8]::64 word) = 0x0 \<and> (\<sigma> \<turnstile> *[((((RSP\<^sub>0::64 word) - 0x78)::64 word) + 0x8),8]::64 word) = 0x0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x78),8]::64 word) = 0x0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x80),8]::64 word) = 0x15e64\<close>
declare P_0x15e64_29_def[Ps]

definition P_0x15e64_29_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x15e64_29_regions_set \<sigma> \<equiv> {
    (0, RSI\<^sub>0, Suc 0),
    (1, RSP\<^sub>0, 8),
    (2, ((FS\<^sub>0::64 word) + 0x28), 8),
    (3, ((RDI\<^sub>0::64 word) + 0x40), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x40), 8),
    (11, ((RSP\<^sub>0::64 word) - 0x48), 8),
    (12, ((RSP\<^sub>0::64 word) - 0x50), 8),
    (13, ((RSP\<^sub>0::64 word) - 0x58), 8),
    (14, ((RSP\<^sub>0::64 word) - 0x60), 8),
    (15, ((RSP\<^sub>0::64 word) - 0x70), 8),
    (16, ((RSP\<^sub>0::64 word) - 0x78), 8),
    (17, ((RSP\<^sub>0::64 word) - 0x80), 8)
  }\<close>

definition P_0x15e64_29_regions :: state_pred where
  \<open>P_0x15e64_29_regions \<sigma> \<equiv> \<exists>regions. P_0x15e64_29_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x15e6f_29 :: state_pred where
  \<open>Q_0x15e6f_29 \<sigma> \<equiv> RIP \<sigma> = 0x15e6f \<and> RBX \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> RDI \<sigma> = ((RSI\<^sub>0::64 word) + 0x80) \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x78) \<and> RBP \<sigma> = RAX \<sigma> \<and> R13 \<sigma> = RSI\<^sub>0 \<and> R12 \<sigma> = RDI\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> regs \<sigma> ymm0w1 = 0x0 \<and> regs \<sigma> ymm0w0 = 0x0 \<and> regs \<sigma> ymm1w1 = ymm1w1\<^sub>0 \<and> regs \<sigma> ymm1w0 = ymm1w0\<^sub>0 \<and> regs \<sigma> ymm2w1 = ymm2w1\<^sub>0 \<and> regs \<sigma> ymm2w0 = ymm2w0\<^sub>0 \<and> regs \<sigma> ymm3w1 = ymm3w1\<^sub>0 \<and> regs \<sigma> ymm3w0 = ymm3w0\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word) = ucast ((\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x48),8]::64 word) = 0x0 \<and> (\<sigma> \<turnstile> *[((((RSP\<^sub>0::64 word) - 0x58)::64 word) + 0x8),8]::64 word) = 0x0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),8]::64 word) = 0x0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x60),8]::64 word) = RAX \<sigma> \<and> (\<sigma> \<turnstile> *[((((RSP\<^sub>0::64 word) - 0x78)::64 word) + 0x8),8]::64 word) = 0x0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x78),8]::64 word) = 0x0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x80),8]::64 word) = 0x15e64\<close>
declare Q_0x15e6f_29_def[Qs]

schematic_goal qcow_snapshot_create_0_3_0x15e64_0x15e6c_29[blocks]:
  assumes \<open>(P_0x15e64_29 && P_0x15e64_29_regions) \<sigma>\<close>
  shows \<open>exec_block 3 0x15e6c 29 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x15e6f_29 ?\<sigma> \<and> block_usage P_0x15e64_29_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x15e64_29_def P_0x15e64_29_regions_def post: Q_0x15e6f_29_def regionset: P_0x15e64_29_regions_set_def)

definition P_0x15e6f_true_30 :: state_pred where
  \<open>P_0x15e6f_true_30 \<sigma> \<equiv> RIP \<sigma> = 0x15e6f \<and> RBX \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> RDI \<sigma> = ((RSI\<^sub>0::64 word) + 0x80) \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x78) \<and> RBP \<sigma> = RAX \<sigma> \<and> R13 \<sigma> = RSI\<^sub>0 \<and> R12 \<sigma> = RDI\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> regs \<sigma> ymm0w1 = 0x0 \<and> regs \<sigma> ymm0w0 = 0x0 \<and> regs \<sigma> ymm1w1 = ymm1w1\<^sub>0 \<and> regs \<sigma> ymm1w0 = ymm1w0\<^sub>0 \<and> regs \<sigma> ymm2w1 = ymm2w1\<^sub>0 \<and> regs \<sigma> ymm2w0 = ymm2w0\<^sub>0 \<and> regs \<sigma> ymm3w1 = ymm3w1\<^sub>0 \<and> regs \<sigma> ymm3w0 = ymm3w0\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word) = ucast ((\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x48),8]::64 word) = 0x0 \<and> (\<sigma> \<turnstile> *[((((RSP\<^sub>0::64 word) - 0x58)::64 word) + 0x8),8]::64 word) = 0x0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),8]::64 word) = 0x0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x60),8]::64 word) = RAX \<sigma> \<and> (\<sigma> \<turnstile> *[((((RSP\<^sub>0::64 word) - 0x78)::64 word) + 0x8),8]::64 word) = 0x0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x78),8]::64 word) = 0x0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x80),8]::64 word) = 0x15e64\<close>
declare P_0x15e6f_true_30_def[Ps]

definition P_0x15e6f_true_30_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x15e6f_true_30_regions_set \<sigma> \<equiv> {
    (0, RSI\<^sub>0, Suc 0),
    (1, RSP\<^sub>0, 8),
    (2, ((FS\<^sub>0::64 word) + 0x28), 8),
    (3, ((RDI\<^sub>0::64 word) + 0x40), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x40), 8),
    (11, ((RSP\<^sub>0::64 word) - 0x48), 8),
    (12, ((RSP\<^sub>0::64 word) - 0x50), 8),
    (13, ((RSP\<^sub>0::64 word) - 0x58), 8),
    (14, ((RSP\<^sub>0::64 word) - 0x60), 8),
    (15, ((RSP\<^sub>0::64 word) - 0x70), 8),
    (16, ((RSP\<^sub>0::64 word) - 0x78), 8),
    (17, ((RSP\<^sub>0::64 word) - 0x80), 8)
  }\<close>

definition P_0x15e6f_true_30_regions :: state_pred where
  \<open>P_0x15e6f_true_30_regions \<sigma> \<equiv> \<exists>regions. P_0x15e6f_true_30_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x1608f_30 :: state_pred where
  \<open>Q_0x1608f_30 \<sigma> \<equiv> RIP \<sigma> = 0x1608f \<and> RBX \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> RDI \<sigma> = ((RSI\<^sub>0::64 word) + 0x80) \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x78) \<and> RBP \<sigma> = RAX \<sigma> \<and> R13 \<sigma> = 0x0 \<and> R12 \<sigma> = RDI\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> regs \<sigma> ymm0w1 = 0x0 \<and> regs \<sigma> ymm0w0 = 0x0 \<and> regs \<sigma> ymm1w1 = ymm1w1\<^sub>0 \<and> regs \<sigma> ymm1w0 = ymm1w0\<^sub>0 \<and> regs \<sigma> ymm2w1 = ymm2w1\<^sub>0 \<and> regs \<sigma> ymm2w0 = ymm2w0\<^sub>0 \<and> regs \<sigma> ymm3w1 = ymm3w1\<^sub>0 \<and> regs \<sigma> ymm3w0 = ymm3w0\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word) = ucast ((\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x48),8]::64 word) = 0x0 \<and> (\<sigma> \<turnstile> *[((((RSP\<^sub>0::64 word) - 0x58)::64 word) + 0x8),8]::64 word) = 0x0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),8]::64 word) = 0x0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x60),8]::64 word) = RAX \<sigma> \<and> (\<sigma> \<turnstile> *[((((RSP\<^sub>0::64 word) - 0x78)::64 word) + 0x8),8]::64 word) = 0x0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x78),8]::64 word) = 0x0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x80),8]::64 word) = 0x15e64\<close>
declare Q_0x1608f_30_def[Qs]

schematic_goal qcow_snapshot_create_0_2_0x15e6f_0x1608c_30[blocks]:
  assumes \<open>(P_0x15e6f_true_30 && P_0x15e6f_true_30_regions && ZF) \<sigma>\<close>
  shows \<open>exec_block 2 0x1608c 30 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x1608f_30 ?\<sigma> \<and> block_usage P_0x15e6f_true_30_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x15e6f_true_30_def P_0x15e6f_true_30_regions_def post: Q_0x1608f_30_def regionset: P_0x15e6f_true_30_regions_set_def)

definition P_0x1608f_31 :: state_pred where
  \<open>P_0x1608f_31 \<sigma> \<equiv> RIP \<sigma> = 0x1608f \<and> RBX \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> RDI \<sigma> = ((RSI\<^sub>0::64 word) + 0x80) \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x78) \<and> RBP \<sigma> = RAX \<sigma> \<and> R13 \<sigma> = 0x0 \<and> R12 \<sigma> = RDI\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> regs \<sigma> ymm0w1 = 0x0 \<and> regs \<sigma> ymm0w0 = 0x0 \<and> regs \<sigma> ymm1w1 = ymm1w1\<^sub>0 \<and> regs \<sigma> ymm1w0 = ymm1w0\<^sub>0 \<and> regs \<sigma> ymm2w1 = ymm2w1\<^sub>0 \<and> regs \<sigma> ymm2w0 = ymm2w0\<^sub>0 \<and> regs \<sigma> ymm3w1 = ymm3w1\<^sub>0 \<and> regs \<sigma> ymm3w0 = ymm3w0\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word) = ucast ((\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x48),8]::64 word) = 0x0 \<and> (\<sigma> \<turnstile> *[((((RSP\<^sub>0::64 word) - 0x58)::64 word) + 0x8),8]::64 word) = 0x0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),8]::64 word) = 0x0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x60),8]::64 word) = RAX \<sigma> \<and> (\<sigma> \<turnstile> *[((((RSP\<^sub>0::64 word) - 0x78)::64 word) + 0x8),8]::64 word) = 0x0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x78),8]::64 word) = 0x0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x80),8]::64 word) = 0x15e64\<close>
declare P_0x1608f_31_def[Ps]

definition P_0x1608f_31_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x1608f_31_regions_set \<sigma> \<equiv> {
    (0, RSI\<^sub>0, Suc 0),
    (1, RSP\<^sub>0, 8),
    (2, ((FS\<^sub>0::64 word) + 0x28), 8),
    (3, ((RDI\<^sub>0::64 word) + 0x40), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x40), 8),
    (11, ((RSP\<^sub>0::64 word) - 0x48), 8),
    (12, ((RSP\<^sub>0::64 word) - 0x50), 8),
    (13, ((RSP\<^sub>0::64 word) - 0x58), 8),
    (14, ((RSP\<^sub>0::64 word) - 0x60), 8),
    (15, ((RSP\<^sub>0::64 word) - 0x70), 8),
    (16, ((RSP\<^sub>0::64 word) - 0x78), 8),
    (17, ((RSP\<^sub>0::64 word) - 0x80), 8)
  }\<close>

definition P_0x1608f_31_regions :: state_pred where
  \<open>P_0x1608f_31_regions \<sigma> \<equiv> \<exists>regions. P_0x1608f_31_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x16092_31 :: state_pred where
  \<open>Q_0x16092_31 \<sigma> \<equiv> RIP \<sigma> = 0x16092 \<and> RBX \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> RDI \<sigma> = RAX \<sigma> \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x78) \<and> RBP \<sigma> = RAX \<sigma> \<and> R13 \<sigma> = 0x0 \<and> R12 \<sigma> = RDI\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> regs \<sigma> ymm0w1 = 0x0 \<and> regs \<sigma> ymm0w0 = 0x0 \<and> regs \<sigma> ymm1w1 = ymm1w1\<^sub>0 \<and> regs \<sigma> ymm1w0 = ymm1w0\<^sub>0 \<and> regs \<sigma> ymm2w1 = ymm2w1\<^sub>0 \<and> regs \<sigma> ymm2w0 = ymm2w0\<^sub>0 \<and> regs \<sigma> ymm3w1 = ymm3w1\<^sub>0 \<and> regs \<sigma> ymm3w0 = ymm3w0\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word) = ucast ((\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x48),8]::64 word) = 0x0 \<and> (\<sigma> \<turnstile> *[((((RSP\<^sub>0::64 word) - 0x58)::64 word) + 0x8),8]::64 word) = 0x0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),8]::64 word) = 0x0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x60),8]::64 word) = RAX \<sigma> \<and> (\<sigma> \<turnstile> *[((((RSP\<^sub>0::64 word) - 0x78)::64 word) + 0x8),8]::64 word) = 0x0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x78),8]::64 word) = 0x0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x80),8]::64 word) = 0x15e64\<close>
declare Q_0x16092_31_def[Qs]

schematic_goal qcow_snapshot_create_0_1_0x1608f_0x1608f_31[blocks]:
  assumes \<open>(P_0x1608f_31 && P_0x1608f_31_regions) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x1608f 31 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x16092_31 ?\<sigma> \<and> block_usage P_0x1608f_31_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x1608f_31_def P_0x1608f_31_regions_def post: Q_0x16092_31_def regionset: P_0x1608f_31_regions_set_def)

definition P_0x16092_32 :: state_pred where
  \<open>P_0x16092_32 \<sigma> \<equiv> RIP \<sigma> = 0x16092 \<and> RBX \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> RDI \<sigma> = RAX \<sigma> \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x78) \<and> RBP \<sigma> = RAX \<sigma> \<and> R13 \<sigma> = 0x0 \<and> R12 \<sigma> = RDI\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> regs \<sigma> ymm0w1 = 0x0 \<and> regs \<sigma> ymm0w0 = 0x0 \<and> regs \<sigma> ymm1w1 = ymm1w1\<^sub>0 \<and> regs \<sigma> ymm1w0 = ymm1w0\<^sub>0 \<and> regs \<sigma> ymm2w1 = ymm2w1\<^sub>0 \<and> regs \<sigma> ymm2w0 = ymm2w0\<^sub>0 \<and> regs \<sigma> ymm3w1 = ymm3w1\<^sub>0 \<and> regs \<sigma> ymm3w0 = ymm3w0\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word) = ucast ((\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x48),8]::64 word) = 0x0 \<and> (\<sigma> \<turnstile> *[((((RSP\<^sub>0::64 word) - 0x58)::64 word) + 0x8),8]::64 word) = 0x0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),8]::64 word) = 0x0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x60),8]::64 word) = RAX \<sigma> \<and> (\<sigma> \<turnstile> *[((((RSP\<^sub>0::64 word) - 0x78)::64 word) + 0x8),8]::64 word) = 0x0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x78),8]::64 word) = 0x0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x80),8]::64 word) = 0x15e64\<close>
declare P_0x16092_32_def[Ps]

definition P_0x16092_32_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x16092_32_regions_set \<sigma> \<equiv> {
    (0, RSI\<^sub>0, Suc 0),
    (1, RSP\<^sub>0, 8),
    (2, ((FS\<^sub>0::64 word) + 0x28), 8),
    (3, ((RDI\<^sub>0::64 word) + 0x40), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x40), 8),
    (11, ((RSP\<^sub>0::64 word) - 0x48), 8),
    (12, ((RSP\<^sub>0::64 word) - 0x50), 8),
    (13, ((RSP\<^sub>0::64 word) - 0x58), 8),
    (14, ((RSP\<^sub>0::64 word) - 0x60), 8),
    (15, ((RSP\<^sub>0::64 word) - 0x70), 8),
    (16, ((RSP\<^sub>0::64 word) - 0x78), 8),
    (17, ((RSP\<^sub>0::64 word) - 0x80), 8)
  }\<close>

definition P_0x16092_32_regions :: state_pred where
  \<open>P_0x16092_32_regions \<sigma> \<equiv> \<exists>regions. P_0x16092_32_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_qemu_free_addr_0x16092_32 :: state_pred where
  \<open>Q_qemu_free_addr_0x16092_32 \<sigma> \<equiv> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x80) \<and> RIP \<sigma> = qemu_free_addr \<and> RBX \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> RSI \<sigma> = RSI\<^sub>0 \<and> R13 \<sigma> = 0x0 \<and> R12 \<sigma> = RDI\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> regs \<sigma> ymm0w1 = 0x0 \<and> regs \<sigma> ymm0w0 = 0x0 \<and> regs \<sigma> ymm1w1 = ymm1w1\<^sub>0 \<and> regs \<sigma> ymm1w0 = ymm1w0\<^sub>0 \<and> regs \<sigma> ymm2w1 = ymm2w1\<^sub>0 \<and> regs \<sigma> ymm2w0 = ymm2w0\<^sub>0 \<and> regs \<sigma> ymm3w1 = ymm3w1\<^sub>0 \<and> regs \<sigma> ymm3w0 = ymm3w0\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word) = ucast ((\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x48),8]::64 word) = 0x0 \<and> (\<sigma> \<turnstile> *[((((RSP\<^sub>0::64 word) - 0x58)::64 word) + 0x8),8]::64 word) = 0x0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),8]::64 word) = 0x0 \<and> (\<sigma> \<turnstile> *[((((RSP\<^sub>0::64 word) - 0x78)::64 word) + 0x8),8]::64 word) = 0x0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x78),8]::64 word) = 0x0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x80),8]::64 word) = 0x16097\<close>
declare Q_qemu_free_addr_0x16092_32_def[Qs]

schematic_goal qcow_snapshot_create_0_1_0x16092_0x16092_32[blocks]:
  assumes \<open>(P_0x16092_32 && P_0x16092_32_regions) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x16092 32 \<sigma> \<triangleq> ?\<sigma> \<and> Q_qemu_free_addr_0x16092_32 ?\<sigma> \<and> block_usage P_0x16092_32_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x16092_32_def P_0x16092_32_regions_def post: Q_qemu_free_addr_0x16092_32_def regionset: P_0x16092_32_regions_set_def)

definition P_0x16097_33 :: state_pred where
  \<open>P_0x16097_33 \<sigma> \<equiv> RIP \<sigma> = 0x16097 \<and> RBX \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x78) \<and> R13 \<sigma> = 0x0 \<and> R12 \<sigma> = RDI\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> regs \<sigma> ymm0w1 = 0x0 \<and> regs \<sigma> ymm0w0 = 0x0 \<and> regs \<sigma> ymm1w1 = ymm1w1\<^sub>0 \<and> regs \<sigma> ymm1w0 = ymm1w0\<^sub>0 \<and> regs \<sigma> ymm2w1 = ymm2w1\<^sub>0 \<and> regs \<sigma> ymm2w0 = ymm2w0\<^sub>0 \<and> regs \<sigma> ymm3w1 = ymm3w1\<^sub>0 \<and> regs \<sigma> ymm3w0 = ymm3w0\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word) = ucast ((\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x48),8]::64 word) = 0x0 \<and> (\<sigma> \<turnstile> *[((((RSP\<^sub>0::64 word) - 0x58)::64 word) + 0x8),8]::64 word) = 0x0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),8]::64 word) = 0x0 \<and> (\<sigma> \<turnstile> *[((((RSP\<^sub>0::64 word) - 0x78)::64 word) + 0x8),8]::64 word) = 0x0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x78),8]::64 word) = 0x0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x80),8]::64 word) = 0x16097\<close>
declare P_0x16097_33_def[Ps]

definition P_0x16097_33_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x16097_33_regions_set \<sigma> \<equiv> {
    (0, RSI\<^sub>0, Suc 0),
    (1, RSP\<^sub>0, 8),
    (2, ((FS\<^sub>0::64 word) + 0x28), 8),
    (3, ((RDI\<^sub>0::64 word) + 0x40), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x40), 8),
    (11, ((RSP\<^sub>0::64 word) - 0x48), 8),
    (12, ((RSP\<^sub>0::64 word) - 0x50), 8),
    (13, ((RSP\<^sub>0::64 word) - 0x58), 8),
    (14, ((RSP\<^sub>0::64 word) - 0x70), 8),
    (15, ((RSP\<^sub>0::64 word) - 0x78), 8),
    (16, ((RSP\<^sub>0::64 word) - 0x80), 8)
  }\<close>

definition P_0x16097_33_regions :: state_pred where
  \<open>P_0x16097_33_regions \<sigma> \<equiv> \<exists>regions. P_0x16097_33_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x1609a_33 :: state_pred where
  \<open>Q_0x1609a_33 \<sigma> \<equiv> RIP \<sigma> = 0x1609a \<and> RBX \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> RDI \<sigma> = 0x0 \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x78) \<and> R13 \<sigma> = 0x0 \<and> R12 \<sigma> = RDI\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> regs \<sigma> ymm0w1 = 0x0 \<and> regs \<sigma> ymm0w0 = 0x0 \<and> regs \<sigma> ymm1w1 = ymm1w1\<^sub>0 \<and> regs \<sigma> ymm1w0 = ymm1w0\<^sub>0 \<and> regs \<sigma> ymm2w1 = ymm2w1\<^sub>0 \<and> regs \<sigma> ymm2w0 = ymm2w0\<^sub>0 \<and> regs \<sigma> ymm3w1 = ymm3w1\<^sub>0 \<and> regs \<sigma> ymm3w0 = ymm3w0\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word) = ucast ((\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x48),8]::64 word) = 0x0 \<and> (\<sigma> \<turnstile> *[((((RSP\<^sub>0::64 word) - 0x58)::64 word) + 0x8),8]::64 word) = 0x0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),8]::64 word) = 0x0 \<and> (\<sigma> \<turnstile> *[((((RSP\<^sub>0::64 word) - 0x78)::64 word) + 0x8),8]::64 word) = 0x0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x78),8]::64 word) = 0x0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x80),8]::64 word) = 0x16097\<close>
declare Q_0x1609a_33_def[Qs]

schematic_goal qcow_snapshot_create_0_1_0x16097_0x16097_33[blocks]:
  assumes \<open>(P_0x16097_33 && P_0x16097_33_regions) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x16097 33 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x1609a_33 ?\<sigma> \<and> block_usage P_0x16097_33_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x16097_33_def P_0x16097_33_regions_def post: Q_0x1609a_33_def regionset: P_0x16097_33_regions_set_def)

definition P_0x1609a_34 :: state_pred where
  \<open>P_0x1609a_34 \<sigma> \<equiv> RIP \<sigma> = 0x1609a \<and> RBX \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> RDI \<sigma> = 0x0 \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x78) \<and> R13 \<sigma> = 0x0 \<and> R12 \<sigma> = RDI\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> regs \<sigma> ymm0w1 = 0x0 \<and> regs \<sigma> ymm0w0 = 0x0 \<and> regs \<sigma> ymm1w1 = ymm1w1\<^sub>0 \<and> regs \<sigma> ymm1w0 = ymm1w0\<^sub>0 \<and> regs \<sigma> ymm2w1 = ymm2w1\<^sub>0 \<and> regs \<sigma> ymm2w0 = ymm2w0\<^sub>0 \<and> regs \<sigma> ymm3w1 = ymm3w1\<^sub>0 \<and> regs \<sigma> ymm3w0 = ymm3w0\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word) = ucast ((\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x48),8]::64 word) = 0x0 \<and> (\<sigma> \<turnstile> *[((((RSP\<^sub>0::64 word) - 0x58)::64 word) + 0x8),8]::64 word) = 0x0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),8]::64 word) = 0x0 \<and> (\<sigma> \<turnstile> *[((((RSP\<^sub>0::64 word) - 0x78)::64 word) + 0x8),8]::64 word) = 0x0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x78),8]::64 word) = 0x0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x80),8]::64 word) = 0x16097\<close>
declare P_0x1609a_34_def[Ps]

definition P_0x1609a_34_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x1609a_34_regions_set \<sigma> \<equiv> {
    (0, RSI\<^sub>0, Suc 0),
    (1, RSP\<^sub>0, 8),
    (2, ((FS\<^sub>0::64 word) + 0x28), 8),
    (3, ((RDI\<^sub>0::64 word) + 0x40), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x40), 8),
    (11, ((RSP\<^sub>0::64 word) - 0x48), 8),
    (12, ((RSP\<^sub>0::64 word) - 0x50), 8),
    (13, ((RSP\<^sub>0::64 word) - 0x58), 8),
    (14, ((RSP\<^sub>0::64 word) - 0x70), 8),
    (15, ((RSP\<^sub>0::64 word) - 0x78), 8),
    (16, ((RSP\<^sub>0::64 word) - 0x80), 8)
  }\<close>

definition P_0x1609a_34_regions :: state_pred where
  \<open>P_0x1609a_34_regions \<sigma> \<equiv> \<exists>regions. P_0x1609a_34_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_qemu_free_addr_0x1609a_34 :: state_pred where
  \<open>Q_qemu_free_addr_0x1609a_34 \<sigma> \<equiv> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x80) \<and> RIP \<sigma> = qemu_free_addr \<and> RBX \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> RDI \<sigma> = 0x0 \<and> RSI \<sigma> = RSI\<^sub>0 \<and> R13 \<sigma> = 0x0 \<and> R12 \<sigma> = RDI\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> regs \<sigma> ymm0w1 = 0x0 \<and> regs \<sigma> ymm0w0 = 0x0 \<and> regs \<sigma> ymm1w1 = ymm1w1\<^sub>0 \<and> regs \<sigma> ymm1w0 = ymm1w0\<^sub>0 \<and> regs \<sigma> ymm2w1 = ymm2w1\<^sub>0 \<and> regs \<sigma> ymm2w0 = ymm2w0\<^sub>0 \<and> regs \<sigma> ymm3w1 = ymm3w1\<^sub>0 \<and> regs \<sigma> ymm3w0 = ymm3w0\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word) = ucast ((\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x48),8]::64 word) = 0x0 \<and> (\<sigma> \<turnstile> *[((((RSP\<^sub>0::64 word) - 0x58)::64 word) + 0x8),8]::64 word) = 0x0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),8]::64 word) = 0x0 \<and> (\<sigma> \<turnstile> *[((((RSP\<^sub>0::64 word) - 0x78)::64 word) + 0x8),8]::64 word) = 0x0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x78),8]::64 word) = 0x0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x80),8]::64 word) = 0x1609f\<close>
declare Q_qemu_free_addr_0x1609a_34_def[Qs]

schematic_goal qcow_snapshot_create_0_1_0x1609a_0x1609a_34[blocks]:
  assumes \<open>(P_0x1609a_34 && P_0x1609a_34_regions) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x1609a 34 \<sigma> \<triangleq> ?\<sigma> \<and> Q_qemu_free_addr_0x1609a_34 ?\<sigma> \<and> block_usage P_0x1609a_34_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x1609a_34_def P_0x1609a_34_regions_def post: Q_qemu_free_addr_0x1609a_34_def regionset: P_0x1609a_34_regions_set_def)

definition P_0x1609f_35 :: state_pred where
  \<open>P_0x1609f_35 \<sigma> \<equiv> RIP \<sigma> = 0x1609f \<and> RBX \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> RDI \<sigma> = 0x0 \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x78) \<and> R13 \<sigma> = 0x0 \<and> R12 \<sigma> = RDI\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> regs \<sigma> ymm0w1 = 0x0 \<and> regs \<sigma> ymm0w0 = 0x0 \<and> regs \<sigma> ymm1w1 = ymm1w1\<^sub>0 \<and> regs \<sigma> ymm1w0 = ymm1w0\<^sub>0 \<and> regs \<sigma> ymm2w1 = ymm2w1\<^sub>0 \<and> regs \<sigma> ymm2w0 = ymm2w0\<^sub>0 \<and> regs \<sigma> ymm3w1 = ymm3w1\<^sub>0 \<and> regs \<sigma> ymm3w0 = ymm3w0\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word) = ucast ((\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x48),8]::64 word) = 0x0 \<and> (\<sigma> \<turnstile> *[((((RSP\<^sub>0::64 word) - 0x58)::64 word) + 0x8),8]::64 word) = 0x0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),8]::64 word) = 0x0 \<and> (\<sigma> \<turnstile> *[((((RSP\<^sub>0::64 word) - 0x78)::64 word) + 0x8),8]::64 word) = 0x0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x78),8]::64 word) = 0x0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x80),8]::64 word) = 0x1609f\<close>
declare P_0x1609f_35_def[Ps]

definition P_0x1609f_35_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x1609f_35_regions_set \<sigma> \<equiv> {
    (0, RSI\<^sub>0, Suc 0),
    (1, RSP\<^sub>0, 8),
    (2, ((FS\<^sub>0::64 word) + 0x28), 8),
    (3, ((RDI\<^sub>0::64 word) + 0x40), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x40), 8),
    (11, ((RSP\<^sub>0::64 word) - 0x48), 8),
    (12, ((RSP\<^sub>0::64 word) - 0x50), 8),
    (13, ((RSP\<^sub>0::64 word) - 0x58), 8),
    (14, ((RSP\<^sub>0::64 word) - 0x70), 8),
    (15, ((RSP\<^sub>0::64 word) - 0x78), 8),
    (16, ((RSP\<^sub>0::64 word) - 0x80), 8)
  }\<close>

definition P_0x1609f_35_regions :: state_pred where
  \<open>P_0x1609f_35_regions \<sigma> \<equiv> \<exists>regions. P_0x1609f_35_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x15fed_35 :: state_pred where
  \<open>Q_0x15fed_35 \<sigma> \<equiv> RIP \<sigma> = 0x15fed \<and> RBX \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x78) \<and> R12 \<sigma> = RDI\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> regs \<sigma> ymm0w1 = 0x0 \<and> regs \<sigma> ymm0w0 = 0x0 \<and> (\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word) = ucast ((\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word)\<close>
declare Q_0x15fed_35_def[Qs]

schematic_goal qcow_snapshot_create_0_2_0x1609f_0x160a4_35[blocks]:
  assumes \<open>(P_0x1609f_35 && P_0x1609f_35_regions) \<sigma>\<close>
  shows \<open>exec_block 2 0x160a4 35 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x15fed_35 ?\<sigma> \<and> block_usage P_0x1609f_35_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x1609f_35_def P_0x1609f_35_regions_def post: Q_0x15fed_35_def regionset: P_0x1609f_35_regions_set_def)

definition P_0x15e6f_false_36 :: state_pred where
  \<open>P_0x15e6f_false_36 \<sigma> \<equiv> RIP \<sigma> = 0x15e6f \<and> RBX \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> RDI \<sigma> = ((RSI\<^sub>0::64 word) + 0x80) \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x78) \<and> RBP \<sigma> = RAX \<sigma> \<and> R13 \<sigma> = RSI\<^sub>0 \<and> R12 \<sigma> = RDI\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> regs \<sigma> ymm0w1 = 0x0 \<and> regs \<sigma> ymm0w0 = 0x0 \<and> regs \<sigma> ymm1w1 = ymm1w1\<^sub>0 \<and> regs \<sigma> ymm1w0 = ymm1w0\<^sub>0 \<and> regs \<sigma> ymm2w1 = ymm2w1\<^sub>0 \<and> regs \<sigma> ymm2w0 = ymm2w0\<^sub>0 \<and> regs \<sigma> ymm3w1 = ymm3w1\<^sub>0 \<and> regs \<sigma> ymm3w0 = ymm3w0\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word) = ucast ((\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x48),8]::64 word) = 0x0 \<and> (\<sigma> \<turnstile> *[((((RSP\<^sub>0::64 word) - 0x58)::64 word) + 0x8),8]::64 word) = 0x0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),8]::64 word) = 0x0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x60),8]::64 word) = RAX \<sigma> \<and> (\<sigma> \<turnstile> *[((((RSP\<^sub>0::64 word) - 0x78)::64 word) + 0x8),8]::64 word) = 0x0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x78),8]::64 word) = 0x0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x80),8]::64 word) = 0x15e64\<close>
declare P_0x15e6f_false_36_def[Ps]

definition P_0x15e6f_false_36_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x15e6f_false_36_regions_set \<sigma> \<equiv> {
    (0, RSI\<^sub>0, Suc 0),
    (1, RSP\<^sub>0, 8),
    (2, ((FS\<^sub>0::64 word) + 0x28), 8),
    (3, ((RDI\<^sub>0::64 word) + 0x40), 8),
    (4, ((RSI\<^sub>0::64 word) + 0x180), 8),
    (5, ((RSI\<^sub>0::64 word) + 0x188), 4),
    (6, ((RSI\<^sub>0::64 word) + 0x190), 8),
    (7, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x1c), 4),
    (8, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x38), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (11, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (12, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (13, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (14, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (15, ((RSP\<^sub>0::64 word) - 0x40), 8),
    (16, ((RSP\<^sub>0::64 word) - 0x48), 8),
    (17, ((RSP\<^sub>0::64 word) - 0x50), 4),
    (18, ((RSP\<^sub>0::64 word) - 0x50), 8),
    (19, ((RSP\<^sub>0::64 word) - 0x58), 8),
    (20, ((RSP\<^sub>0::64 word) - 0x60), 8),
    (21, ((RSP\<^sub>0::64 word) - 0x70), 8),
    (22, ((RSP\<^sub>0::64 word) - 0x78), 8),
    (23, ((RSP\<^sub>0::64 word) - 0x80), 8)
  }\<close>

definition P_0x15e6f_false_36_regions :: state_pred where
  \<open>P_0x15e6f_false_36_regions \<sigma> \<equiv> \<exists>regions. P_0x15e6f_false_36_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {(17,18)}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {(17,18), (18,17)}))
\<close>

definition Q_0x15ea7_36 :: state_pred where
  \<open>Q_0x15ea7_36 \<sigma> \<equiv> RIP \<sigma> = 0x15ea7 \<and> RAX \<sigma> = (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x190),8]::64 word) \<and> RBX \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> RCX \<sigma> = 0x1 \<and> RDX \<sigma> = ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x1c),4]::32 word)) \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x38),8]::64 word) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x78) \<and> R13 \<sigma> = RSI\<^sub>0 \<and> R12 \<sigma> = RDI\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> regs \<sigma> ymm0w1 = 0x0 \<and> regs \<sigma> ymm0w0 = 0x0 \<and> regs \<sigma> ymm1w1 = ymm1w1\<^sub>0 \<and> regs \<sigma> ymm1w0 = ymm1w0\<^sub>0 \<and> regs \<sigma> ymm2w1 = ymm2w1\<^sub>0 \<and> regs \<sigma> ymm2w0 = ymm2w0\<^sub>0 \<and> regs \<sigma> ymm3w1 = ymm3w1\<^sub>0 \<and> regs \<sigma> ymm3w0 = ymm3w0\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word) = ucast ((\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x180),8]::64 word) = (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x180),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x188),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x188),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x190),8]::64 word) = (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x190),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x1c),4]::32 word) = ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x1c),4]::32 word)) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x38),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x38),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x48),8]::64 word) = (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x190),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x188),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),8]::64 word) = (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x180),8]::64 word) \<and> (\<sigma> \<turnstile> *[((((RSP\<^sub>0::64 word) - 0x78)::64 word) + 0x8),8]::64 word) = 0x0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x78),8]::64 word) = 0x0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x80),8]::64 word) = 0x15e64\<close>
declare Q_0x15ea7_36_def[Qs]

schematic_goal qcow_snapshot_create_0_11_0x15e6f_0x15ea2_36[blocks]:
  assumes \<open>(P_0x15e6f_false_36 && P_0x15e6f_false_36_regions && ! ZF) \<sigma>\<close>
  shows \<open>exec_block 11 0x15ea2 36 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x15ea7_36 ?\<sigma> \<and> block_usage P_0x15e6f_false_36_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x15e6f_false_36_def P_0x15e6f_false_36_regions_def post: Q_0x15ea7_36_def regionset: P_0x15e6f_false_36_regions_set_def)

definition P_0x15ea7_37 :: state_pred where
  \<open>P_0x15ea7_37 \<sigma> \<equiv> RIP \<sigma> = 0x15ea7 \<and> RAX \<sigma> = (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x190),8]::64 word) \<and> RBX \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> RCX \<sigma> = 0x1 \<and> RDX \<sigma> = ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x1c),4]::32 word)) \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x38),8]::64 word) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x78) \<and> R13 \<sigma> = RSI\<^sub>0 \<and> R12 \<sigma> = RDI\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> regs \<sigma> ymm0w1 = 0x0 \<and> regs \<sigma> ymm0w0 = 0x0 \<and> regs \<sigma> ymm1w1 = ymm1w1\<^sub>0 \<and> regs \<sigma> ymm1w0 = ymm1w0\<^sub>0 \<and> regs \<sigma> ymm2w1 = ymm2w1\<^sub>0 \<and> regs \<sigma> ymm2w0 = ymm2w0\<^sub>0 \<and> regs \<sigma> ymm3w1 = ymm3w1\<^sub>0 \<and> regs \<sigma> ymm3w0 = ymm3w0\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word) = ucast ((\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x180),8]::64 word) = (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x180),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x188),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x188),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x190),8]::64 word) = (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x190),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x1c),4]::32 word) = ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x1c),4]::32 word)) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x38),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x38),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x48),8]::64 word) = (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x190),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x188),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),8]::64 word) = (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x180),8]::64 word) \<and> (\<sigma> \<turnstile> *[((((RSP\<^sub>0::64 word) - 0x78)::64 word) + 0x8),8]::64 word) = 0x0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x78),8]::64 word) = 0x0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x80),8]::64 word) = 0x15e64\<close>
declare P_0x15ea7_37_def[Ps]

definition P_0x15ea7_37_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x15ea7_37_regions_set \<sigma> \<equiv> {
    (0, RSI\<^sub>0, Suc 0),
    (1, RSP\<^sub>0, 8),
    (2, ((FS\<^sub>0::64 word) + 0x28), 8),
    (3, ((RDI\<^sub>0::64 word) + 0x40), 8),
    (4, ((RSI\<^sub>0::64 word) + 0x180), 8),
    (5, ((RSI\<^sub>0::64 word) + 0x188), 4),
    (6, ((RSI\<^sub>0::64 word) + 0x190), 8),
    (7, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x1c), 4),
    (8, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x38), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (11, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (12, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (13, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (14, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (15, ((RSP\<^sub>0::64 word) - 0x40), 8),
    (16, ((RSP\<^sub>0::64 word) - 0x48), 8),
    (17, ((RSP\<^sub>0::64 word) - 0x50), 4),
    (18, ((RSP\<^sub>0::64 word) - 0x58), 8),
    (19, ((RSP\<^sub>0::64 word) - 0x70), 8),
    (20, ((RSP\<^sub>0::64 word) - 0x78), 8),
    (21, ((RSP\<^sub>0::64 word) - 0x80), 8)
  }\<close>

definition P_0x15ea7_37_regions :: state_pred where
  \<open>P_0x15ea7_37_regions \<sigma> \<equiv> \<exists>regions. P_0x15ea7_37_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_update_snapshot_refcount_addr_0x15ea7_37 :: state_pred where
  \<open>Q_update_snapshot_refcount_addr_0x15ea7_37 \<sigma> \<equiv> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x80) \<and> RIP \<sigma> = update_snapshot_refcount_addr \<and> RAX \<sigma> = (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x190),8]::64 word) \<and> RBX \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> RCX \<sigma> = 0x1 \<and> RDX \<sigma> = ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x1c),4]::32 word)) \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x38),8]::64 word) \<and> R13 \<sigma> = RSI\<^sub>0 \<and> R12 \<sigma> = RDI\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> regs \<sigma> ymm0w1 = 0x0 \<and> regs \<sigma> ymm0w0 = 0x0 \<and> regs \<sigma> ymm1w1 = ymm1w1\<^sub>0 \<and> regs \<sigma> ymm1w0 = ymm1w0\<^sub>0 \<and> regs \<sigma> ymm2w1 = ymm2w1\<^sub>0 \<and> regs \<sigma> ymm2w0 = ymm2w0\<^sub>0 \<and> regs \<sigma> ymm3w1 = ymm3w1\<^sub>0 \<and> regs \<sigma> ymm3w0 = ymm3w0\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word) = ucast ((\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x180),8]::64 word) = (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x180),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x188),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x188),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x190),8]::64 word) = (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x190),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x1c),4]::32 word) = ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x1c),4]::32 word)) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x38),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x38),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x48),8]::64 word) = (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x190),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x188),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),8]::64 word) = (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x180),8]::64 word) \<and> (\<sigma> \<turnstile> *[((((RSP\<^sub>0::64 word) - 0x78)::64 word) + 0x8),8]::64 word) = 0x0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x78),8]::64 word) = 0x0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x80),8]::64 word) = 0x15eac\<close>
declare Q_update_snapshot_refcount_addr_0x15ea7_37_def[Qs]

schematic_goal qcow_snapshot_create_0_1_0x15ea7_0x15ea7_37[blocks]:
  assumes \<open>(P_0x15ea7_37 && P_0x15ea7_37_regions) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x15ea7 37 \<sigma> \<triangleq> ?\<sigma> \<and> Q_update_snapshot_refcount_addr_0x15ea7_37 ?\<sigma> \<and> block_usage P_0x15ea7_37_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x15ea7_37_def P_0x15ea7_37_regions_def post: Q_update_snapshot_refcount_addr_0x15ea7_37_def regionset: P_0x15ea7_37_regions_set_def)

definition P_0x15eac_38 :: state_pred where
  \<open>P_0x15eac_38 \<sigma> \<equiv> RIP \<sigma> = 0x15eac \<and> RAX \<sigma> = update_snapshot_refcount_0x15ea7_retval \<and> RBX \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> RCX \<sigma> = 0x1 \<and> RDX \<sigma> = ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x1c),4]::32 word)) \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x38),8]::64 word) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x78) \<and> R13 \<sigma> = RSI\<^sub>0 \<and> R12 \<sigma> = RDI\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> regs \<sigma> ymm0w1 = 0x0 \<and> regs \<sigma> ymm0w0 = 0x0 \<and> regs \<sigma> ymm1w1 = ymm1w1\<^sub>0 \<and> regs \<sigma> ymm1w0 = ymm1w0\<^sub>0 \<and> regs \<sigma> ymm2w1 = ymm2w1\<^sub>0 \<and> regs \<sigma> ymm2w0 = ymm2w0\<^sub>0 \<and> regs \<sigma> ymm3w1 = ymm3w1\<^sub>0 \<and> regs \<sigma> ymm3w0 = ymm3w0\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word) = ucast ((\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x180),8]::64 word) = (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x180),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x188),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x188),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x190),8]::64 word) = (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x190),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x1c),4]::32 word) = ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x1c),4]::32 word)) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x38),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x38),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x48),8]::64 word) = (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x190),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x188),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),8]::64 word) = (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x180),8]::64 word) \<and> (\<sigma> \<turnstile> *[((((RSP\<^sub>0::64 word) - 0x78)::64 word) + 0x8),8]::64 word) = 0x0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x78),8]::64 word) = 0x0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x80),8]::64 word) = 0x15eac\<close>
declare P_0x15eac_38_def[Ps]

definition P_0x15eac_38_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x15eac_38_regions_set \<sigma> \<equiv> {
    (0, RSI\<^sub>0, Suc 0),
    (1, RSP\<^sub>0, 8),
    (2, ((FS\<^sub>0::64 word) + 0x28), 8),
    (3, ((RDI\<^sub>0::64 word) + 0x40), 8),
    (4, ((RSI\<^sub>0::64 word) + 0x180), 8),
    (5, ((RSI\<^sub>0::64 word) + 0x188), 4),
    (6, ((RSI\<^sub>0::64 word) + 0x190), 8),
    (7, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x1c), 4),
    (8, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x38), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (11, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (12, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (13, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (14, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (15, ((RSP\<^sub>0::64 word) - 0x40), 8),
    (16, ((RSP\<^sub>0::64 word) - 0x48), 8),
    (17, ((RSP\<^sub>0::64 word) - 0x50), 4),
    (18, ((RSP\<^sub>0::64 word) - 0x58), 8),
    (19, ((RSP\<^sub>0::64 word) - 0x70), 8),
    (20, ((RSP\<^sub>0::64 word) - 0x78), 8),
    (21, ((RSP\<^sub>0::64 word) - 0x80), 8)
  }\<close>

definition P_0x15eac_38_regions :: state_pred where
  \<open>P_0x15eac_38_regions \<sigma> \<equiv> \<exists>regions. P_0x15eac_38_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x15eae_38 :: state_pred where
  \<open>Q_0x15eae_38 \<sigma> \<equiv> RIP \<sigma> = 0x15eae \<and> RAX \<sigma> = update_snapshot_refcount_0x15ea7_retval \<and> RBX \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> RCX \<sigma> = 0x1 \<and> RDX \<sigma> = ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x1c),4]::32 word)) \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x38),8]::64 word) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x78) \<and> R13 \<sigma> = RSI\<^sub>0 \<and> R12 \<sigma> = RDI\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> regs \<sigma> ymm0w1 = 0x0 \<and> regs \<sigma> ymm0w0 = 0x0 \<and> regs \<sigma> ymm1w1 = ymm1w1\<^sub>0 \<and> regs \<sigma> ymm1w0 = ymm1w0\<^sub>0 \<and> regs \<sigma> ymm2w1 = ymm2w1\<^sub>0 \<and> regs \<sigma> ymm2w0 = ymm2w0\<^sub>0 \<and> regs \<sigma> ymm3w1 = ymm3w1\<^sub>0 \<and> regs \<sigma> ymm3w0 = ymm3w0\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word) = ucast ((\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x180),8]::64 word) = (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x180),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x188),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x188),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x190),8]::64 word) = (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x190),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x1c),4]::32 word) = ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x1c),4]::32 word)) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x38),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x38),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x48),8]::64 word) = (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x190),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x188),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),8]::64 word) = (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x180),8]::64 word) \<and> (\<sigma> \<turnstile> *[((((RSP\<^sub>0::64 word) - 0x78)::64 word) + 0x8),8]::64 word) = 0x0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x78),8]::64 word) = 0x0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x80),8]::64 word) = 0x15eac\<close>
declare Q_0x15eae_38_def[Qs]

schematic_goal qcow_snapshot_create_0_1_0x15eac_0x15eac_38[blocks]:
  assumes \<open>(P_0x15eac_38 && P_0x15eac_38_regions) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x15eac 38 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x15eae_38 ?\<sigma> \<and> block_usage P_0x15eac_38_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x15eac_38_def P_0x15eac_38_regions_def post: Q_0x15eae_38_def regionset: P_0x15eac_38_regions_set_def)

definition P_0x15eae_true_39 :: state_pred where
  \<open>P_0x15eae_true_39 \<sigma> \<equiv> RIP \<sigma> = 0x15eae \<and> RAX \<sigma> = update_snapshot_refcount_0x15ea7_retval \<and> RBX \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> RCX \<sigma> = 0x1 \<and> RDX \<sigma> = ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x1c),4]::32 word)) \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x38),8]::64 word) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x78) \<and> R13 \<sigma> = RSI\<^sub>0 \<and> R12 \<sigma> = RDI\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> regs \<sigma> ymm0w1 = 0x0 \<and> regs \<sigma> ymm0w0 = 0x0 \<and> regs \<sigma> ymm1w1 = ymm1w1\<^sub>0 \<and> regs \<sigma> ymm1w0 = ymm1w0\<^sub>0 \<and> regs \<sigma> ymm2w1 = ymm2w1\<^sub>0 \<and> regs \<sigma> ymm2w0 = ymm2w0\<^sub>0 \<and> regs \<sigma> ymm3w1 = ymm3w1\<^sub>0 \<and> regs \<sigma> ymm3w0 = ymm3w0\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word) = ucast ((\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x180),8]::64 word) = (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x180),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x188),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x188),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x190),8]::64 word) = (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x190),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x1c),4]::32 word) = ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x1c),4]::32 word)) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x38),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x38),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x48),8]::64 word) = (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x190),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x188),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),8]::64 word) = (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x180),8]::64 word) \<and> (\<sigma> \<turnstile> *[((((RSP\<^sub>0::64 word) - 0x78)::64 word) + 0x8),8]::64 word) = 0x0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x78),8]::64 word) = 0x0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x80),8]::64 word) = 0x15eac\<close>
declare P_0x15eae_true_39_def[Ps]

definition P_0x15eae_true_39_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x15eae_true_39_regions_set \<sigma> \<equiv> {
    (0, RSI\<^sub>0, Suc 0),
    (1, RSP\<^sub>0, 8),
    (2, ((FS\<^sub>0::64 word) + 0x28), 8),
    (3, ((RDI\<^sub>0::64 word) + 0x40), 8),
    (4, ((RSI\<^sub>0::64 word) + 0x180), 8),
    (5, ((RSI\<^sub>0::64 word) + 0x188), 4),
    (6, ((RSI\<^sub>0::64 word) + 0x190), 8),
    (7, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x1c), 4),
    (8, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x38), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (11, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (12, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (13, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (14, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (15, ((RSP\<^sub>0::64 word) - 0x40), 8),
    (16, ((RSP\<^sub>0::64 word) - 0x48), 8),
    (17, ((RSP\<^sub>0::64 word) - 0x50), 4),
    (18, ((RSP\<^sub>0::64 word) - 0x58), 8),
    (19, ((RSP\<^sub>0::64 word) - 0x70), 8),
    (20, ((RSP\<^sub>0::64 word) - 0x78), 8),
    (21, ((RSP\<^sub>0::64 word) - 0x80), 8)
  }\<close>

definition P_0x15eae_true_39_regions :: state_pred where
  \<open>P_0x15eae_true_39_regions \<sigma> \<equiv> \<exists>regions. P_0x15eae_true_39_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x1608f_39 :: state_pred where
  \<open>Q_0x1608f_39 \<sigma> \<equiv> RIP \<sigma> = 0x1608f \<and> RAX \<sigma> = update_snapshot_refcount_0x15ea7_retval \<and> RBX \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> RCX \<sigma> = 0x1 \<and> RDX \<sigma> = ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x1c),4]::32 word)) \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x38),8]::64 word) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x78) \<and> R13 \<sigma> = 0x0 \<and> R12 \<sigma> = RDI\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> regs \<sigma> ymm0w1 = 0x0 \<and> regs \<sigma> ymm0w0 = 0x0 \<and> regs \<sigma> ymm1w1 = ymm1w1\<^sub>0 \<and> regs \<sigma> ymm1w0 = ymm1w0\<^sub>0 \<and> regs \<sigma> ymm2w1 = ymm2w1\<^sub>0 \<and> regs \<sigma> ymm2w0 = ymm2w0\<^sub>0 \<and> regs \<sigma> ymm3w1 = ymm3w1\<^sub>0 \<and> regs \<sigma> ymm3w0 = ymm3w0\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word) = ucast ((\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x180),8]::64 word) = (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x180),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x188),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x188),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x190),8]::64 word) = (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x190),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x1c),4]::32 word) = ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x1c),4]::32 word)) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x38),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x38),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x48),8]::64 word) = (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x190),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x188),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),8]::64 word) = (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x180),8]::64 word) \<and> (\<sigma> \<turnstile> *[((((RSP\<^sub>0::64 word) - 0x78)::64 word) + 0x8),8]::64 word) = 0x0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x78),8]::64 word) = 0x0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x80),8]::64 word) = 0x15eac\<close>
declare Q_0x1608f_39_def[Qs]

schematic_goal qcow_snapshot_create_0_2_0x15eae_0x1608c_39[blocks]:
  assumes \<open>(P_0x15eae_true_39 && P_0x15eae_true_39_regions && SF) \<sigma>\<close>
  shows \<open>exec_block 2 0x1608c 39 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x1608f_39 ?\<sigma> \<and> block_usage P_0x15eae_true_39_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x15eae_true_39_def P_0x15eae_true_39_regions_def post: Q_0x1608f_39_def regionset: P_0x15eae_true_39_regions_set_def)

definition P_0x1608f_40 :: state_pred where
  \<open>P_0x1608f_40 \<sigma> \<equiv> RIP \<sigma> = 0x1608f \<and> RAX \<sigma> = update_snapshot_refcount_0x15ea7_retval \<and> RBX \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> RCX \<sigma> = 0x1 \<and> RDX \<sigma> = ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x1c),4]::32 word)) \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x38),8]::64 word) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x78) \<and> R13 \<sigma> = 0x0 \<and> R12 \<sigma> = RDI\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> regs \<sigma> ymm0w1 = 0x0 \<and> regs \<sigma> ymm0w0 = 0x0 \<and> regs \<sigma> ymm1w1 = ymm1w1\<^sub>0 \<and> regs \<sigma> ymm1w0 = ymm1w0\<^sub>0 \<and> regs \<sigma> ymm2w1 = ymm2w1\<^sub>0 \<and> regs \<sigma> ymm2w0 = ymm2w0\<^sub>0 \<and> regs \<sigma> ymm3w1 = ymm3w1\<^sub>0 \<and> regs \<sigma> ymm3w0 = ymm3w0\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word) = ucast ((\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x180),8]::64 word) = (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x180),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x188),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x188),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x190),8]::64 word) = (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x190),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x1c),4]::32 word) = ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x1c),4]::32 word)) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x38),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x38),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x48),8]::64 word) = (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x190),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x188),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),8]::64 word) = (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x180),8]::64 word) \<and> (\<sigma> \<turnstile> *[((((RSP\<^sub>0::64 word) - 0x78)::64 word) + 0x8),8]::64 word) = 0x0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x78),8]::64 word) = 0x0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x80),8]::64 word) = 0x15eac\<close>
declare P_0x1608f_40_def[Ps]

definition P_0x1608f_40_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x1608f_40_regions_set \<sigma> \<equiv> {
    (0, RSI\<^sub>0, Suc 0),
    (1, RSP\<^sub>0, 8),
    (2, ((FS\<^sub>0::64 word) + 0x28), 8),
    (3, ((RDI\<^sub>0::64 word) + 0x40), 8),
    (4, ((RSI\<^sub>0::64 word) + 0x180), 8),
    (5, ((RSI\<^sub>0::64 word) + 0x188), 4),
    (6, ((RSI\<^sub>0::64 word) + 0x190), 8),
    (7, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x1c), 4),
    (8, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x38), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (11, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (12, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (13, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (14, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (15, ((RSP\<^sub>0::64 word) - 0x40), 8),
    (16, ((RSP\<^sub>0::64 word) - 0x48), 8),
    (17, ((RSP\<^sub>0::64 word) - 0x50), 4),
    (18, ((RSP\<^sub>0::64 word) - 0x58), 8),
    (19, ((RSP\<^sub>0::64 word) - 0x70), 8),
    (20, ((RSP\<^sub>0::64 word) - 0x78), 8),
    (21, ((RSP\<^sub>0::64 word) - 0x80), 8)
  }\<close>

definition P_0x1608f_40_regions :: state_pred where
  \<open>P_0x1608f_40_regions \<sigma> \<equiv> \<exists>regions. P_0x1608f_40_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x16092_40 :: state_pred where
  \<open>Q_0x16092_40 \<sigma> \<equiv> RIP \<sigma> = 0x16092 \<and> RAX \<sigma> = update_snapshot_refcount_0x15ea7_retval \<and> RBX \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> RCX \<sigma> = 0x1 \<and> RDX \<sigma> = ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x1c),4]::32 word)) \<and> RDI \<sigma> = RBP \<sigma> \<and> RSI \<sigma> = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x38),8]::64 word) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x78) \<and> R13 \<sigma> = 0x0 \<and> R12 \<sigma> = RDI\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> regs \<sigma> ymm0w1 = 0x0 \<and> regs \<sigma> ymm0w0 = 0x0 \<and> regs \<sigma> ymm1w1 = ymm1w1\<^sub>0 \<and> regs \<sigma> ymm1w0 = ymm1w0\<^sub>0 \<and> regs \<sigma> ymm2w1 = ymm2w1\<^sub>0 \<and> regs \<sigma> ymm2w0 = ymm2w0\<^sub>0 \<and> regs \<sigma> ymm3w1 = ymm3w1\<^sub>0 \<and> regs \<sigma> ymm3w0 = ymm3w0\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word) = ucast ((\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x180),8]::64 word) = (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x180),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x188),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x188),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x190),8]::64 word) = (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x190),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x1c),4]::32 word) = ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x1c),4]::32 word)) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x38),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x38),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x48),8]::64 word) = (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x190),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x188),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),8]::64 word) = (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x180),8]::64 word) \<and> (\<sigma> \<turnstile> *[((((RSP\<^sub>0::64 word) - 0x78)::64 word) + 0x8),8]::64 word) = 0x0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x78),8]::64 word) = 0x0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x80),8]::64 word) = 0x15eac\<close>
declare Q_0x16092_40_def[Qs]

schematic_goal qcow_snapshot_create_0_1_0x1608f_0x1608f_40[blocks]:
  assumes \<open>(P_0x1608f_40 && P_0x1608f_40_regions) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x1608f 40 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x16092_40 ?\<sigma> \<and> block_usage P_0x1608f_40_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x1608f_40_def P_0x1608f_40_regions_def post: Q_0x16092_40_def regionset: P_0x1608f_40_regions_set_def)

definition P_0x16092_41 :: state_pred where
  \<open>P_0x16092_41 \<sigma> \<equiv> RIP \<sigma> = 0x16092 \<and> RAX \<sigma> = update_snapshot_refcount_0x15ea7_retval \<and> RBX \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> RCX \<sigma> = 0x1 \<and> RDX \<sigma> = ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x1c),4]::32 word)) \<and> RDI \<sigma> = RBP \<sigma> \<and> RSI \<sigma> = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x38),8]::64 word) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x78) \<and> R13 \<sigma> = 0x0 \<and> R12 \<sigma> = RDI\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> regs \<sigma> ymm0w1 = 0x0 \<and> regs \<sigma> ymm0w0 = 0x0 \<and> regs \<sigma> ymm1w1 = ymm1w1\<^sub>0 \<and> regs \<sigma> ymm1w0 = ymm1w0\<^sub>0 \<and> regs \<sigma> ymm2w1 = ymm2w1\<^sub>0 \<and> regs \<sigma> ymm2w0 = ymm2w0\<^sub>0 \<and> regs \<sigma> ymm3w1 = ymm3w1\<^sub>0 \<and> regs \<sigma> ymm3w0 = ymm3w0\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word) = ucast ((\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x180),8]::64 word) = (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x180),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x188),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x188),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x190),8]::64 word) = (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x190),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x1c),4]::32 word) = ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x1c),4]::32 word)) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x38),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x38),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x48),8]::64 word) = (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x190),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x188),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),8]::64 word) = (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x180),8]::64 word) \<and> (\<sigma> \<turnstile> *[((((RSP\<^sub>0::64 word) - 0x78)::64 word) + 0x8),8]::64 word) = 0x0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x78),8]::64 word) = 0x0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x80),8]::64 word) = 0x15eac\<close>
declare P_0x16092_41_def[Ps]

definition P_0x16092_41_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x16092_41_regions_set \<sigma> \<equiv> {
    (0, RSI\<^sub>0, Suc 0),
    (1, RSP\<^sub>0, 8),
    (2, ((FS\<^sub>0::64 word) + 0x28), 8),
    (3, ((RDI\<^sub>0::64 word) + 0x40), 8),
    (4, ((RSI\<^sub>0::64 word) + 0x180), 8),
    (5, ((RSI\<^sub>0::64 word) + 0x188), 4),
    (6, ((RSI\<^sub>0::64 word) + 0x190), 8),
    (7, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x1c), 4),
    (8, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x38), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (11, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (12, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (13, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (14, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (15, ((RSP\<^sub>0::64 word) - 0x40), 8),
    (16, ((RSP\<^sub>0::64 word) - 0x48), 8),
    (17, ((RSP\<^sub>0::64 word) - 0x50), 4),
    (18, ((RSP\<^sub>0::64 word) - 0x58), 8),
    (19, ((RSP\<^sub>0::64 word) - 0x70), 8),
    (20, ((RSP\<^sub>0::64 word) - 0x78), 8),
    (21, ((RSP\<^sub>0::64 word) - 0x80), 8)
  }\<close>

definition P_0x16092_41_regions :: state_pred where
  \<open>P_0x16092_41_regions \<sigma> \<equiv> \<exists>regions. P_0x16092_41_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_qemu_free_addr_0x16092_41 :: state_pred where
  \<open>Q_qemu_free_addr_0x16092_41 \<sigma> \<equiv> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x80) \<and> RIP \<sigma> = qemu_free_addr \<and> RAX \<sigma> = update_snapshot_refcount_0x15ea7_retval \<and> RBX \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> RCX \<sigma> = 0x1 \<and> RDX \<sigma> = ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x1c),4]::32 word)) \<and> RDI \<sigma> = RBP \<sigma> \<and> RSI \<sigma> = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x38),8]::64 word) \<and> R13 \<sigma> = 0x0 \<and> R12 \<sigma> = RDI\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> regs \<sigma> ymm0w1 = 0x0 \<and> regs \<sigma> ymm0w0 = 0x0 \<and> regs \<sigma> ymm1w1 = ymm1w1\<^sub>0 \<and> regs \<sigma> ymm1w0 = ymm1w0\<^sub>0 \<and> regs \<sigma> ymm2w1 = ymm2w1\<^sub>0 \<and> regs \<sigma> ymm2w0 = ymm2w0\<^sub>0 \<and> regs \<sigma> ymm3w1 = ymm3w1\<^sub>0 \<and> regs \<sigma> ymm3w0 = ymm3w0\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word) = ucast ((\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x180),8]::64 word) = (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x180),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x188),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x188),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x190),8]::64 word) = (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x190),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x1c),4]::32 word) = ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x1c),4]::32 word)) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x38),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x38),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x48),8]::64 word) = (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x190),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x188),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),8]::64 word) = (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x180),8]::64 word) \<and> (\<sigma> \<turnstile> *[((((RSP\<^sub>0::64 word) - 0x78)::64 word) + 0x8),8]::64 word) = 0x0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x78),8]::64 word) = 0x0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x80),8]::64 word) = 0x16097\<close>
declare Q_qemu_free_addr_0x16092_41_def[Qs]

schematic_goal qcow_snapshot_create_0_1_0x16092_0x16092_41[blocks]:
  assumes \<open>(P_0x16092_41 && P_0x16092_41_regions) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x16092 41 \<sigma> \<triangleq> ?\<sigma> \<and> Q_qemu_free_addr_0x16092_41 ?\<sigma> \<and> block_usage P_0x16092_41_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x16092_41_def P_0x16092_41_regions_def post: Q_qemu_free_addr_0x16092_41_def regionset: P_0x16092_41_regions_set_def)

definition P_0x16097_42 :: state_pred where
  \<open>P_0x16097_42 \<sigma> \<equiv> RIP \<sigma> = 0x16097 \<and> RAX \<sigma> = qemu_free_0x16092_retval \<and> RBX \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> RCX \<sigma> = 0x1 \<and> RDX \<sigma> = ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x1c),4]::32 word)) \<and> RDI \<sigma> = RBP \<sigma> \<and> RSI \<sigma> = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x38),8]::64 word) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x78) \<and> R13 \<sigma> = 0x0 \<and> R12 \<sigma> = RDI\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> regs \<sigma> ymm0w1 = 0x0 \<and> regs \<sigma> ymm0w0 = 0x0 \<and> regs \<sigma> ymm1w1 = ymm1w1\<^sub>0 \<and> regs \<sigma> ymm1w0 = ymm1w0\<^sub>0 \<and> regs \<sigma> ymm2w1 = ymm2w1\<^sub>0 \<and> regs \<sigma> ymm2w0 = ymm2w0\<^sub>0 \<and> regs \<sigma> ymm3w1 = ymm3w1\<^sub>0 \<and> regs \<sigma> ymm3w0 = ymm3w0\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word) = ucast ((\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x180),8]::64 word) = (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x180),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x188),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x188),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x190),8]::64 word) = (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x190),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x1c),4]::32 word) = ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x1c),4]::32 word)) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x38),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x38),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x48),8]::64 word) = (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x190),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x188),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),8]::64 word) = (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x180),8]::64 word) \<and> (\<sigma> \<turnstile> *[((((RSP\<^sub>0::64 word) - 0x78)::64 word) + 0x8),8]::64 word) = 0x0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x78),8]::64 word) = 0x0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x80),8]::64 word) = 0x16097\<close>
declare P_0x16097_42_def[Ps]

definition P_0x16097_42_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x16097_42_regions_set \<sigma> \<equiv> {
    (0, RSI\<^sub>0, Suc 0),
    (1, RSP\<^sub>0, 8),
    (2, ((FS\<^sub>0::64 word) + 0x28), 8),
    (3, ((RDI\<^sub>0::64 word) + 0x40), 8),
    (4, ((RSI\<^sub>0::64 word) + 0x180), 8),
    (5, ((RSI\<^sub>0::64 word) + 0x188), 4),
    (6, ((RSI\<^sub>0::64 word) + 0x190), 8),
    (7, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x1c), 4),
    (8, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x38), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (11, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (12, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (13, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (14, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (15, ((RSP\<^sub>0::64 word) - 0x40), 8),
    (16, ((RSP\<^sub>0::64 word) - 0x48), 8),
    (17, ((RSP\<^sub>0::64 word) - 0x50), 4),
    (18, ((RSP\<^sub>0::64 word) - 0x58), 8),
    (19, ((RSP\<^sub>0::64 word) - 0x70), 8),
    (20, ((RSP\<^sub>0::64 word) - 0x78), 8),
    (21, ((RSP\<^sub>0::64 word) - 0x80), 8)
  }\<close>

definition P_0x16097_42_regions :: state_pred where
  \<open>P_0x16097_42_regions \<sigma> \<equiv> \<exists>regions. P_0x16097_42_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x1609a_42 :: state_pred where
  \<open>Q_0x1609a_42 \<sigma> \<equiv> RIP \<sigma> = 0x1609a \<and> RAX \<sigma> = qemu_free_0x16092_retval \<and> RBX \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> RCX \<sigma> = 0x1 \<and> RDX \<sigma> = ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x1c),4]::32 word)) \<and> RDI \<sigma> = 0x0 \<and> RSI \<sigma> = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x38),8]::64 word) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x78) \<and> R13 \<sigma> = 0x0 \<and> R12 \<sigma> = RDI\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> regs \<sigma> ymm0w1 = 0x0 \<and> regs \<sigma> ymm0w0 = 0x0 \<and> regs \<sigma> ymm1w1 = ymm1w1\<^sub>0 \<and> regs \<sigma> ymm1w0 = ymm1w0\<^sub>0 \<and> regs \<sigma> ymm2w1 = ymm2w1\<^sub>0 \<and> regs \<sigma> ymm2w0 = ymm2w0\<^sub>0 \<and> regs \<sigma> ymm3w1 = ymm3w1\<^sub>0 \<and> regs \<sigma> ymm3w0 = ymm3w0\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word) = ucast ((\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x180),8]::64 word) = (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x180),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x188),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x188),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x190),8]::64 word) = (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x190),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x1c),4]::32 word) = ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x1c),4]::32 word)) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x38),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x38),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x48),8]::64 word) = (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x190),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x188),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),8]::64 word) = (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x180),8]::64 word) \<and> (\<sigma> \<turnstile> *[((((RSP\<^sub>0::64 word) - 0x78)::64 word) + 0x8),8]::64 word) = 0x0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x78),8]::64 word) = 0x0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x80),8]::64 word) = 0x16097\<close>
declare Q_0x1609a_42_def[Qs]

schematic_goal qcow_snapshot_create_0_1_0x16097_0x16097_42[blocks]:
  assumes \<open>(P_0x16097_42 && P_0x16097_42_regions) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x16097 42 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x1609a_42 ?\<sigma> \<and> block_usage P_0x16097_42_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x16097_42_def P_0x16097_42_regions_def post: Q_0x1609a_42_def regionset: P_0x16097_42_regions_set_def)

definition P_0x1609a_43 :: state_pred where
  \<open>P_0x1609a_43 \<sigma> \<equiv> RIP \<sigma> = 0x1609a \<and> RAX \<sigma> = qemu_free_0x16092_retval \<and> RBX \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> RCX \<sigma> = 0x1 \<and> RDX \<sigma> = ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x1c),4]::32 word)) \<and> RDI \<sigma> = 0x0 \<and> RSI \<sigma> = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x38),8]::64 word) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x78) \<and> R13 \<sigma> = 0x0 \<and> R12 \<sigma> = RDI\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> regs \<sigma> ymm0w1 = 0x0 \<and> regs \<sigma> ymm0w0 = 0x0 \<and> regs \<sigma> ymm1w1 = ymm1w1\<^sub>0 \<and> regs \<sigma> ymm1w0 = ymm1w0\<^sub>0 \<and> regs \<sigma> ymm2w1 = ymm2w1\<^sub>0 \<and> regs \<sigma> ymm2w0 = ymm2w0\<^sub>0 \<and> regs \<sigma> ymm3w1 = ymm3w1\<^sub>0 \<and> regs \<sigma> ymm3w0 = ymm3w0\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word) = ucast ((\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x180),8]::64 word) = (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x180),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x188),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x188),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x190),8]::64 word) = (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x190),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x1c),4]::32 word) = ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x1c),4]::32 word)) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x38),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x38),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x48),8]::64 word) = (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x190),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x188),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),8]::64 word) = (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x180),8]::64 word) \<and> (\<sigma> \<turnstile> *[((((RSP\<^sub>0::64 word) - 0x78)::64 word) + 0x8),8]::64 word) = 0x0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x78),8]::64 word) = 0x0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x80),8]::64 word) = 0x16097\<close>
declare P_0x1609a_43_def[Ps]

definition P_0x1609a_43_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x1609a_43_regions_set \<sigma> \<equiv> {
    (0, RSI\<^sub>0, Suc 0),
    (1, RSP\<^sub>0, 8),
    (2, ((FS\<^sub>0::64 word) + 0x28), 8),
    (3, ((RDI\<^sub>0::64 word) + 0x40), 8),
    (4, ((RSI\<^sub>0::64 word) + 0x180), 8),
    (5, ((RSI\<^sub>0::64 word) + 0x188), 4),
    (6, ((RSI\<^sub>0::64 word) + 0x190), 8),
    (7, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x1c), 4),
    (8, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x38), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (11, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (12, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (13, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (14, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (15, ((RSP\<^sub>0::64 word) - 0x40), 8),
    (16, ((RSP\<^sub>0::64 word) - 0x48), 8),
    (17, ((RSP\<^sub>0::64 word) - 0x50), 4),
    (18, ((RSP\<^sub>0::64 word) - 0x58), 8),
    (19, ((RSP\<^sub>0::64 word) - 0x70), 8),
    (20, ((RSP\<^sub>0::64 word) - 0x78), 8),
    (21, ((RSP\<^sub>0::64 word) - 0x80), 8)
  }\<close>

definition P_0x1609a_43_regions :: state_pred where
  \<open>P_0x1609a_43_regions \<sigma> \<equiv> \<exists>regions. P_0x1609a_43_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_qemu_free_addr_0x1609a_43 :: state_pred where
  \<open>Q_qemu_free_addr_0x1609a_43 \<sigma> \<equiv> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x80) \<and> RIP \<sigma> = qemu_free_addr \<and> RAX \<sigma> = qemu_free_0x16092_retval \<and> RBX \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> RCX \<sigma> = 0x1 \<and> RDX \<sigma> = ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x1c),4]::32 word)) \<and> RDI \<sigma> = 0x0 \<and> RSI \<sigma> = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x38),8]::64 word) \<and> R13 \<sigma> = 0x0 \<and> R12 \<sigma> = RDI\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> regs \<sigma> ymm0w1 = 0x0 \<and> regs \<sigma> ymm0w0 = 0x0 \<and> regs \<sigma> ymm1w1 = ymm1w1\<^sub>0 \<and> regs \<sigma> ymm1w0 = ymm1w0\<^sub>0 \<and> regs \<sigma> ymm2w1 = ymm2w1\<^sub>0 \<and> regs \<sigma> ymm2w0 = ymm2w0\<^sub>0 \<and> regs \<sigma> ymm3w1 = ymm3w1\<^sub>0 \<and> regs \<sigma> ymm3w0 = ymm3w0\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word) = ucast ((\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x180),8]::64 word) = (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x180),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x188),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x188),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x190),8]::64 word) = (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x190),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x1c),4]::32 word) = ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x1c),4]::32 word)) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x38),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x38),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x48),8]::64 word) = (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x190),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x188),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),8]::64 word) = (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x180),8]::64 word) \<and> (\<sigma> \<turnstile> *[((((RSP\<^sub>0::64 word) - 0x78)::64 word) + 0x8),8]::64 word) = 0x0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x78),8]::64 word) = 0x0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x80),8]::64 word) = 0x1609f\<close>
declare Q_qemu_free_addr_0x1609a_43_def[Qs]

schematic_goal qcow_snapshot_create_0_1_0x1609a_0x1609a_43[blocks]:
  assumes \<open>(P_0x1609a_43 && P_0x1609a_43_regions) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x1609a 43 \<sigma> \<triangleq> ?\<sigma> \<and> Q_qemu_free_addr_0x1609a_43 ?\<sigma> \<and> block_usage P_0x1609a_43_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x1609a_43_def P_0x1609a_43_regions_def post: Q_qemu_free_addr_0x1609a_43_def regionset: P_0x1609a_43_regions_set_def)

definition P_0x1609f_44 :: state_pred where
  \<open>P_0x1609f_44 \<sigma> \<equiv> RIP \<sigma> = 0x1609f \<and> RAX \<sigma> = qemu_free_0x1609a_retval \<and> RBX \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> RCX \<sigma> = 0x1 \<and> RDX \<sigma> = ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x1c),4]::32 word)) \<and> RDI \<sigma> = 0x0 \<and> RSI \<sigma> = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x38),8]::64 word) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x78) \<and> R13 \<sigma> = 0x0 \<and> R12 \<sigma> = RDI\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> regs \<sigma> ymm0w1 = 0x0 \<and> regs \<sigma> ymm0w0 = 0x0 \<and> regs \<sigma> ymm1w1 = ymm1w1\<^sub>0 \<and> regs \<sigma> ymm1w0 = ymm1w0\<^sub>0 \<and> regs \<sigma> ymm2w1 = ymm2w1\<^sub>0 \<and> regs \<sigma> ymm2w0 = ymm2w0\<^sub>0 \<and> regs \<sigma> ymm3w1 = ymm3w1\<^sub>0 \<and> regs \<sigma> ymm3w0 = ymm3w0\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word) = ucast ((\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x180),8]::64 word) = (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x180),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x188),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x188),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x190),8]::64 word) = (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x190),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x1c),4]::32 word) = ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x1c),4]::32 word)) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x38),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x38),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x48),8]::64 word) = (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x190),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x188),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),8]::64 word) = (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x180),8]::64 word) \<and> (\<sigma> \<turnstile> *[((((RSP\<^sub>0::64 word) - 0x78)::64 word) + 0x8),8]::64 word) = 0x0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x78),8]::64 word) = 0x0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x80),8]::64 word) = 0x1609f\<close>
declare P_0x1609f_44_def[Ps]

definition P_0x1609f_44_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x1609f_44_regions_set \<sigma> \<equiv> {
    (0, RSI\<^sub>0, Suc 0),
    (1, RSP\<^sub>0, 8),
    (2, ((FS\<^sub>0::64 word) + 0x28), 8),
    (3, ((RDI\<^sub>0::64 word) + 0x40), 8),
    (4, ((RSI\<^sub>0::64 word) + 0x180), 8),
    (5, ((RSI\<^sub>0::64 word) + 0x188), 4),
    (6, ((RSI\<^sub>0::64 word) + 0x190), 8),
    (7, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x1c), 4),
    (8, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x38), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (11, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (12, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (13, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (14, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (15, ((RSP\<^sub>0::64 word) - 0x40), 8),
    (16, ((RSP\<^sub>0::64 word) - 0x48), 8),
    (17, ((RSP\<^sub>0::64 word) - 0x50), 4),
    (18, ((RSP\<^sub>0::64 word) - 0x58), 8),
    (19, ((RSP\<^sub>0::64 word) - 0x70), 8),
    (20, ((RSP\<^sub>0::64 word) - 0x78), 8),
    (21, ((RSP\<^sub>0::64 word) - 0x80), 8)
  }\<close>

definition P_0x1609f_44_regions :: state_pred where
  \<open>P_0x1609f_44_regions \<sigma> \<equiv> \<exists>regions. P_0x1609f_44_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x15fed_44 :: state_pred where
  \<open>Q_0x15fed_44 \<sigma> \<equiv> RIP \<sigma> = 0x15fed \<and> RBX \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x78) \<and> R12 \<sigma> = RDI\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> regs \<sigma> ymm0w1 = 0x0 \<and> regs \<sigma> ymm0w0 = 0x0 \<and> (\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word) = ucast ((\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word)\<close>
declare Q_0x15fed_44_def[Qs]

schematic_goal qcow_snapshot_create_0_2_0x1609f_0x160a4_44[blocks]:
  assumes \<open>(P_0x1609f_44 && P_0x1609f_44_regions) \<sigma>\<close>
  shows \<open>exec_block 2 0x160a4 44 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x15fed_44 ?\<sigma> \<and> block_usage P_0x1609f_44_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x1609f_44_def P_0x1609f_44_regions_def post: Q_0x15fed_44_def regionset: P_0x1609f_44_regions_set_def)

definition P_0x15eae_false_45 :: state_pred where
  \<open>P_0x15eae_false_45 \<sigma> \<equiv> RIP \<sigma> = 0x15eae \<and> RAX \<sigma> = update_snapshot_refcount_0x15ea7_retval \<and> RBX \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> RCX \<sigma> = 0x1 \<and> RDX \<sigma> = ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x1c),4]::32 word)) \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x38),8]::64 word) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x78) \<and> R13 \<sigma> = RSI\<^sub>0 \<and> R12 \<sigma> = RDI\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> regs \<sigma> ymm0w1 = 0x0 \<and> regs \<sigma> ymm0w0 = 0x0 \<and> regs \<sigma> ymm1w1 = ymm1w1\<^sub>0 \<and> regs \<sigma> ymm1w0 = ymm1w0\<^sub>0 \<and> regs \<sigma> ymm2w1 = ymm2w1\<^sub>0 \<and> regs \<sigma> ymm2w0 = ymm2w0\<^sub>0 \<and> regs \<sigma> ymm3w1 = ymm3w1\<^sub>0 \<and> regs \<sigma> ymm3w0 = ymm3w0\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word) = ucast ((\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x180),8]::64 word) = (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x180),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x188),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x188),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x190),8]::64 word) = (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x190),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x1c),4]::32 word) = ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x1c),4]::32 word)) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x38),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x38),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x48),8]::64 word) = (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x190),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x188),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),8]::64 word) = (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x180),8]::64 word) \<and> (\<sigma> \<turnstile> *[((((RSP\<^sub>0::64 word) - 0x78)::64 word) + 0x8),8]::64 word) = 0x0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x78),8]::64 word) = 0x0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x80),8]::64 word) = 0x15eac\<close>
declare P_0x15eae_false_45_def[Ps]

definition P_0x15eae_false_45_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x15eae_false_45_regions_set \<sigma> \<equiv> {
    (0, RSI\<^sub>0, Suc 0),
    (1, RSP\<^sub>0, 8),
    (2, ((FS\<^sub>0::64 word) + 0x28), 8),
    (3, ((RDI\<^sub>0::64 word) + 0x40), 8),
    (4, ((RSI\<^sub>0::64 word) + 0x180), 8),
    (5, ((RSI\<^sub>0::64 word) + 0x188), 4),
    (6, ((RSI\<^sub>0::64 word) + 0x190), 8),
    (7, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x1c), 4),
    (8, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x38), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (11, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (12, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (13, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (14, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (15, ((RSP\<^sub>0::64 word) - 0x40), 8),
    (16, ((RSP\<^sub>0::64 word) - 0x48), 8),
    (17, ((RSP\<^sub>0::64 word) - 0x50), 4),
    (18, ((RSP\<^sub>0::64 word) - 0x58), 8),
    (19, ((RSP\<^sub>0::64 word) - 0x70), 8),
    (20, ((RSP\<^sub>0::64 word) - 0x78), 8),
    (21, ((RSP\<^sub>0::64 word) - 0x80), 8)
  }\<close>

definition P_0x15eae_false_45_regions :: state_pred where
  \<open>P_0x15eae_false_45_regions \<sigma> \<equiv> \<exists>regions. P_0x15eae_false_45_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x15ebf_45 :: state_pred where
  \<open>Q_0x15ebf_45 \<sigma> \<equiv> RIP \<sigma> = 0x15ebf \<and> RAX \<sigma> = update_snapshot_refcount_0x15ea7_retval \<and> RBX \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> RCX \<sigma> = 0x1 \<and> RDX \<sigma> = ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x1c),4]::32 word)) \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = ((ucast (((sextend (ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x1c),4]::32 word))) 32 64::64 word)::64 word))::64 word) << 3) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x78) \<and> R13 \<sigma> = RSI\<^sub>0 \<and> R12 \<sigma> = RDI\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> regs \<sigma> ymm0w1 = 0x0 \<and> regs \<sigma> ymm0w0 = 0x0 \<and> regs \<sigma> ymm1w1 = ymm1w1\<^sub>0 \<and> regs \<sigma> ymm1w0 = ymm1w0\<^sub>0 \<and> regs \<sigma> ymm2w1 = ymm2w1\<^sub>0 \<and> regs \<sigma> ymm2w0 = ymm2w0\<^sub>0 \<and> regs \<sigma> ymm3w1 = ymm3w1\<^sub>0 \<and> regs \<sigma> ymm3w0 = ymm3w0\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word) = ucast ((\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x180),8]::64 word) = (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x180),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x188),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x188),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x190),8]::64 word) = (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x190),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x1c),4]::32 word) = ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x1c),4]::32 word)) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x38),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x38),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x48),8]::64 word) = (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x190),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x188),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),8]::64 word) = (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x180),8]::64 word) \<and> (\<sigma> \<turnstile> *[((((RSP\<^sub>0::64 word) - 0x78)::64 word) + 0x8),8]::64 word) = 0x0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x78),8]::64 word) = 0x0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x80),8]::64 word) = 0x15eac\<close>
declare Q_0x15ebf_45_def[Qs]

schematic_goal qcow_snapshot_create_0_4_0x15eae_0x15ebb_45[blocks]:
  assumes \<open>(P_0x15eae_false_45 && P_0x15eae_false_45_regions && ! SF) \<sigma>\<close>
  shows \<open>exec_block 4 0x15ebb 45 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x15ebf_45 ?\<sigma> \<and> block_usage P_0x15eae_false_45_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x15eae_false_45_def P_0x15eae_false_45_regions_def post: Q_0x15ebf_45_def regionset: P_0x15eae_false_45_regions_set_def)

definition P_0x15ebf_46 :: state_pred where
  \<open>P_0x15ebf_46 \<sigma> \<equiv> RIP \<sigma> = 0x15ebf \<and> RAX \<sigma> = update_snapshot_refcount_0x15ea7_retval \<and> RBX \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> RCX \<sigma> = 0x1 \<and> RDX \<sigma> = ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x1c),4]::32 word)) \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = ((ucast (((sextend (ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x1c),4]::32 word))) 32 64::64 word)::64 word))::64 word) << 3) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x78) \<and> R13 \<sigma> = RSI\<^sub>0 \<and> R12 \<sigma> = RDI\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> regs \<sigma> ymm0w1 = 0x0 \<and> regs \<sigma> ymm0w0 = 0x0 \<and> regs \<sigma> ymm1w1 = ymm1w1\<^sub>0 \<and> regs \<sigma> ymm1w0 = ymm1w0\<^sub>0 \<and> regs \<sigma> ymm2w1 = ymm2w1\<^sub>0 \<and> regs \<sigma> ymm2w0 = ymm2w0\<^sub>0 \<and> regs \<sigma> ymm3w1 = ymm3w1\<^sub>0 \<and> regs \<sigma> ymm3w0 = ymm3w0\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word) = ucast ((\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x180),8]::64 word) = (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x180),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x188),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x188),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x190),8]::64 word) = (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x190),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x1c),4]::32 word) = ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x1c),4]::32 word)) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x38),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x38),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x48),8]::64 word) = (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x190),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x188),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),8]::64 word) = (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x180),8]::64 word) \<and> (\<sigma> \<turnstile> *[((((RSP\<^sub>0::64 word) - 0x78)::64 word) + 0x8),8]::64 word) = 0x0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x78),8]::64 word) = 0x0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x80),8]::64 word) = 0x15eac\<close>
declare P_0x15ebf_46_def[Ps]

definition P_0x15ebf_46_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x15ebf_46_regions_set \<sigma> \<equiv> {
    (0, RSI\<^sub>0, Suc 0),
    (1, RSP\<^sub>0, 8),
    (2, ((FS\<^sub>0::64 word) + 0x28), 8),
    (3, ((RDI\<^sub>0::64 word) + 0x40), 8),
    (4, ((RSI\<^sub>0::64 word) + 0x180), 8),
    (5, ((RSI\<^sub>0::64 word) + 0x188), 4),
    (6, ((RSI\<^sub>0::64 word) + 0x190), 8),
    (7, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x1c), 4),
    (8, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x38), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (11, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (12, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (13, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (14, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (15, ((RSP\<^sub>0::64 word) - 0x40), 8),
    (16, ((RSP\<^sub>0::64 word) - 0x48), 8),
    (17, ((RSP\<^sub>0::64 word) - 0x50), 4),
    (18, ((RSP\<^sub>0::64 word) - 0x58), 8),
    (19, ((RSP\<^sub>0::64 word) - 0x70), 8),
    (20, ((RSP\<^sub>0::64 word) - 0x78), 8),
    (21, ((RSP\<^sub>0::64 word) - 0x80), 8)
  }\<close>

definition P_0x15ebf_46_regions :: state_pred where
  \<open>P_0x15ebf_46_regions \<sigma> \<equiv> \<exists>regions. P_0x15ebf_46_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_alloc_clusters_addr_0x15ebf_46 :: state_pred where
  \<open>Q_alloc_clusters_addr_0x15ebf_46 \<sigma> \<equiv> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x80) \<and> RIP \<sigma> = alloc_clusters_addr \<and> RAX \<sigma> = update_snapshot_refcount_0x15ea7_retval \<and> RBX \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> RCX \<sigma> = 0x1 \<and> RDX \<sigma> = ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x1c),4]::32 word)) \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = ((ucast (((sextend (ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x1c),4]::32 word))) 32 64::64 word)::64 word))::64 word) << 3) \<and> R13 \<sigma> = RSI\<^sub>0 \<and> R12 \<sigma> = RDI\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> regs \<sigma> ymm0w1 = 0x0 \<and> regs \<sigma> ymm0w0 = 0x0 \<and> regs \<sigma> ymm1w1 = ymm1w1\<^sub>0 \<and> regs \<sigma> ymm1w0 = ymm1w0\<^sub>0 \<and> regs \<sigma> ymm2w1 = ymm2w1\<^sub>0 \<and> regs \<sigma> ymm2w0 = ymm2w0\<^sub>0 \<and> regs \<sigma> ymm3w1 = ymm3w1\<^sub>0 \<and> regs \<sigma> ymm3w0 = ymm3w0\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word) = ucast ((\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x180),8]::64 word) = (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x180),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x188),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x188),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x190),8]::64 word) = (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x190),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x1c),4]::32 word) = ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x1c),4]::32 word)) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x38),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x38),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x48),8]::64 word) = (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x190),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x188),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),8]::64 word) = (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x180),8]::64 word) \<and> (\<sigma> \<turnstile> *[((((RSP\<^sub>0::64 word) - 0x78)::64 word) + 0x8),8]::64 word) = 0x0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x78),8]::64 word) = 0x0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x80),8]::64 word) = 0x15ec4\<close>
declare Q_alloc_clusters_addr_0x15ebf_46_def[Qs]

schematic_goal qcow_snapshot_create_0_1_0x15ebf_0x15ebf_46[blocks]:
  assumes \<open>(P_0x15ebf_46 && P_0x15ebf_46_regions) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x15ebf 46 \<sigma> \<triangleq> ?\<sigma> \<and> Q_alloc_clusters_addr_0x15ebf_46 ?\<sigma> \<and> block_usage P_0x15ebf_46_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x15ebf_46_def P_0x15ebf_46_regions_def post: Q_alloc_clusters_addr_0x15ebf_46_def regionset: P_0x15ebf_46_regions_set_def)

definition P_0x15ec4_47 :: state_pred where
  \<open>P_0x15ec4_47 \<sigma> \<equiv> RIP \<sigma> = 0x15ec4 \<and> RAX \<sigma> = alloc_clusters_0x15ebf_retval \<and> RBX \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> RCX \<sigma> = 0x1 \<and> RDX \<sigma> = ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x1c),4]::32 word)) \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = ((ucast (((sextend (ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x1c),4]::32 word))) 32 64::64 word)::64 word))::64 word) << 3) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x78) \<and> R13 \<sigma> = RSI\<^sub>0 \<and> R12 \<sigma> = RDI\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> regs \<sigma> ymm0w1 = 0x0 \<and> regs \<sigma> ymm0w0 = 0x0 \<and> regs \<sigma> ymm1w1 = ymm1w1\<^sub>0 \<and> regs \<sigma> ymm1w0 = ymm1w0\<^sub>0 \<and> regs \<sigma> ymm2w1 = ymm2w1\<^sub>0 \<and> regs \<sigma> ymm2w0 = ymm2w0\<^sub>0 \<and> regs \<sigma> ymm3w1 = ymm3w1\<^sub>0 \<and> regs \<sigma> ymm3w0 = ymm3w0\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word) = ucast ((\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x180),8]::64 word) = (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x180),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x188),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x188),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x190),8]::64 word) = (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x190),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x1c),4]::32 word) = ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x1c),4]::32 word)) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x38),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x38),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x48),8]::64 word) = (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x190),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x188),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),8]::64 word) = (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x180),8]::64 word) \<and> (\<sigma> \<turnstile> *[((((RSP\<^sub>0::64 word) - 0x78)::64 word) + 0x8),8]::64 word) = 0x0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x78),8]::64 word) = 0x0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x80),8]::64 word) = 0x15ec4\<close>
declare P_0x15ec4_47_def[Ps]

definition P_0x15ec4_47_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x15ec4_47_regions_set \<sigma> \<equiv> {
    (0, RSI\<^sub>0, Suc 0),
    (1, RSP\<^sub>0, 8),
    (2, ((FS\<^sub>0::64 word) + 0x28), 8),
    (3, ((RDI\<^sub>0::64 word) + 0x40), 8),
    (4, ((RSI\<^sub>0::64 word) + 0x180), 8),
    (5, ((RSI\<^sub>0::64 word) + 0x188), 4),
    (6, ((RSI\<^sub>0::64 word) + 0x190), 8),
    (7, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x1c), 4),
    (8, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x38), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (11, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (12, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (13, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (14, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (15, ((RSP\<^sub>0::64 word) - 0x40), 8),
    (16, ((RSP\<^sub>0::64 word) - 0x48), 8),
    (17, ((RSP\<^sub>0::64 word) - 0x50), 4),
    (18, ((RSP\<^sub>0::64 word) - 0x58), 8),
    (19, ((RSP\<^sub>0::64 word) - 0x70), 4),
    (20, ((RSP\<^sub>0::64 word) - 0x70), 8),
    (21, ((RSP\<^sub>0::64 word) - 0x78), 8),
    (22, ((RSP\<^sub>0::64 word) - 0x80), 8)
  }\<close>

definition P_0x15ec4_47_regions :: state_pred where
  \<open>P_0x15ec4_47_regions \<sigma> \<equiv> \<exists>regions. P_0x15ec4_47_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {(19,20)}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {(19,20), (20,19)}))
\<close>

definition Q_0x15ed7_47 :: state_pred where
  \<open>Q_0x15ed7_47 \<sigma> \<equiv> RIP \<sigma> = 0x15ed7 \<and> RAX \<sigma> = alloc_clusters_0x15ebf_retval \<and> RBX \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> RCX \<sigma> = 0x1 \<and> RDX \<sigma> = ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x1c),4]::32 word)) \<and> RDI \<sigma> = ((ucast (((sextend (ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x1c),4]::32 word))) 32 64::64 word)::64 word))::64 word) << 3) \<and> RSI \<sigma> = ((ucast (((sextend (ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x1c),4]::32 word))) 32 64::64 word)::64 word))::64 word) << 3) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x78) \<and> R13 \<sigma> = RSI\<^sub>0 \<and> R12 \<sigma> = RDI\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> regs \<sigma> ymm0w1 = 0x0 \<and> regs \<sigma> ymm0w0 = 0x0 \<and> regs \<sigma> ymm1w1 = ymm1w1\<^sub>0 \<and> regs \<sigma> ymm1w0 = ymm1w0\<^sub>0 \<and> regs \<sigma> ymm2w1 = ymm2w1\<^sub>0 \<and> regs \<sigma> ymm2w0 = ymm2w0\<^sub>0 \<and> regs \<sigma> ymm3w1 = ymm3w1\<^sub>0 \<and> regs \<sigma> ymm3w0 = ymm3w0\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word) = ucast ((\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x180),8]::64 word) = (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x180),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x188),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x188),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x190),8]::64 word) = (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x190),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x1c),4]::32 word) = ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x1c),4]::32 word)) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x38),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x38),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x48),8]::64 word) = (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x190),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x188),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),8]::64 word) = (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x180),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),4]::32 word) = ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x1c),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x80),8]::64 word) = 0x15ec4\<close>
declare Q_0x15ed7_47_def[Qs]

schematic_goal qcow_snapshot_create_0_5_0x15ec4_0x15ed3_47[blocks]:
  assumes \<open>(P_0x15ec4_47 && P_0x15ec4_47_regions) \<sigma>\<close>
  shows \<open>exec_block 5 0x15ed3 47 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x15ed7_47 ?\<sigma> \<and> block_usage P_0x15ec4_47_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x15ec4_47_def P_0x15ec4_47_regions_def post: Q_0x15ed7_47_def regionset: P_0x15ec4_47_regions_set_def)

definition P_0x15ed7_48 :: state_pred where
  \<open>P_0x15ed7_48 \<sigma> \<equiv> RIP \<sigma> = 0x15ed7 \<and> RAX \<sigma> = alloc_clusters_0x15ebf_retval \<and> RBX \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> RCX \<sigma> = 0x1 \<and> RDX \<sigma> = ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x1c),4]::32 word)) \<and> RDI \<sigma> = ((ucast (((sextend (ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x1c),4]::32 word))) 32 64::64 word)::64 word))::64 word) << 3) \<and> RSI \<sigma> = ((ucast (((sextend (ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x1c),4]::32 word))) 32 64::64 word)::64 word))::64 word) << 3) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x78) \<and> R13 \<sigma> = RSI\<^sub>0 \<and> R12 \<sigma> = RDI\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> regs \<sigma> ymm0w1 = 0x0 \<and> regs \<sigma> ymm0w0 = 0x0 \<and> regs \<sigma> ymm1w1 = ymm1w1\<^sub>0 \<and> regs \<sigma> ymm1w0 = ymm1w0\<^sub>0 \<and> regs \<sigma> ymm2w1 = ymm2w1\<^sub>0 \<and> regs \<sigma> ymm2w0 = ymm2w0\<^sub>0 \<and> regs \<sigma> ymm3w1 = ymm3w1\<^sub>0 \<and> regs \<sigma> ymm3w0 = ymm3w0\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word) = ucast ((\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x180),8]::64 word) = (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x180),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x188),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x188),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x190),8]::64 word) = (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x190),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x1c),4]::32 word) = ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x1c),4]::32 word)) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x38),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x38),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x48),8]::64 word) = (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x190),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x188),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),8]::64 word) = (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x180),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),4]::32 word) = ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x1c),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x80),8]::64 word) = 0x15ec4\<close>
declare P_0x15ed7_48_def[Ps]

definition P_0x15ed7_48_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x15ed7_48_regions_set \<sigma> \<equiv> {
    (0, RSI\<^sub>0, Suc 0),
    (1, RSP\<^sub>0, 8),
    (2, ((FS\<^sub>0::64 word) + 0x28), 8),
    (3, ((RDI\<^sub>0::64 word) + 0x40), 8),
    (4, ((RSI\<^sub>0::64 word) + 0x180), 8),
    (5, ((RSI\<^sub>0::64 word) + 0x188), 4),
    (6, ((RSI\<^sub>0::64 word) + 0x190), 8),
    (7, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x1c), 4),
    (8, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x38), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (11, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (12, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (13, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (14, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (15, ((RSP\<^sub>0::64 word) - 0x40), 8),
    (16, ((RSP\<^sub>0::64 word) - 0x48), 8),
    (17, ((RSP\<^sub>0::64 word) - 0x50), 4),
    (18, ((RSP\<^sub>0::64 word) - 0x58), 8),
    (19, ((RSP\<^sub>0::64 word) - 0x70), 4),
    (20, ((RSP\<^sub>0::64 word) - 0x80), 8)
  }\<close>

definition P_0x15ed7_48_regions :: state_pred where
  \<open>P_0x15ed7_48_regions \<sigma> \<equiv> \<exists>regions. P_0x15ed7_48_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_qemu_malloc_addr_0x15ed7_48 :: state_pred where
  \<open>Q_qemu_malloc_addr_0x15ed7_48 \<sigma> \<equiv> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x80) \<and> RIP \<sigma> = qemu_malloc_addr \<and> RAX \<sigma> = alloc_clusters_0x15ebf_retval \<and> RBX \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> RCX \<sigma> = 0x1 \<and> RDX \<sigma> = ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x1c),4]::32 word)) \<and> RDI \<sigma> = ((ucast (((sextend (ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x1c),4]::32 word))) 32 64::64 word)::64 word))::64 word) << 3) \<and> RSI \<sigma> = ((ucast (((sextend (ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x1c),4]::32 word))) 32 64::64 word)::64 word))::64 word) << 3) \<and> R13 \<sigma> = RSI\<^sub>0 \<and> R12 \<sigma> = RDI\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> regs \<sigma> ymm0w1 = 0x0 \<and> regs \<sigma> ymm0w0 = 0x0 \<and> regs \<sigma> ymm1w1 = ymm1w1\<^sub>0 \<and> regs \<sigma> ymm1w0 = ymm1w0\<^sub>0 \<and> regs \<sigma> ymm2w1 = ymm2w1\<^sub>0 \<and> regs \<sigma> ymm2w0 = ymm2w0\<^sub>0 \<and> regs \<sigma> ymm3w1 = ymm3w1\<^sub>0 \<and> regs \<sigma> ymm3w0 = ymm3w0\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word) = ucast ((\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x180),8]::64 word) = (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x180),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x188),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x188),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x190),8]::64 word) = (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x190),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x1c),4]::32 word) = ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x1c),4]::32 word)) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x38),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x38),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x48),8]::64 word) = (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x190),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x188),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),8]::64 word) = (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x180),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),4]::32 word) = ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x1c),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x80),8]::64 word) = 0x15edc\<close>
declare Q_qemu_malloc_addr_0x15ed7_48_def[Qs]

schematic_goal qcow_snapshot_create_0_1_0x15ed7_0x15ed7_48[blocks]:
  assumes \<open>(P_0x15ed7_48 && P_0x15ed7_48_regions) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x15ed7 48 \<sigma> \<triangleq> ?\<sigma> \<and> Q_qemu_malloc_addr_0x15ed7_48 ?\<sigma> \<and> block_usage P_0x15ed7_48_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x15ed7_48_def P_0x15ed7_48_regions_def post: Q_qemu_malloc_addr_0x15ed7_48_def regionset: P_0x15ed7_48_regions_set_def)

definition P_0x15edc_49 :: state_pred where
  \<open>P_0x15edc_49 \<sigma> \<equiv> RIP \<sigma> = 0x15edc \<and> RAX \<sigma> = qemu_malloc_0x15ed7_retval \<and> RBX \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> RCX \<sigma> = 0x1 \<and> RDX \<sigma> = ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x1c),4]::32 word)) \<and> RDI \<sigma> = ((ucast (((sextend (ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x1c),4]::32 word))) 32 64::64 word)::64 word))::64 word) << 3) \<and> RSI \<sigma> = ((ucast (((sextend (ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x1c),4]::32 word))) 32 64::64 word)::64 word))::64 word) << 3) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x78) \<and> R13 \<sigma> = RSI\<^sub>0 \<and> R12 \<sigma> = RDI\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> regs \<sigma> ymm0w1 = 0x0 \<and> regs \<sigma> ymm0w0 = 0x0 \<and> regs \<sigma> ymm1w1 = ymm1w1\<^sub>0 \<and> regs \<sigma> ymm1w0 = ymm1w0\<^sub>0 \<and> regs \<sigma> ymm2w1 = ymm2w1\<^sub>0 \<and> regs \<sigma> ymm2w0 = ymm2w0\<^sub>0 \<and> regs \<sigma> ymm3w1 = ymm3w1\<^sub>0 \<and> regs \<sigma> ymm3w0 = ymm3w0\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word) = ucast ((\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x180),8]::64 word) = (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x180),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x188),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x188),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x190),8]::64 word) = (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x190),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x1c),4]::32 word) = ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x1c),4]::32 word)) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x38),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x38),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x48),8]::64 word) = (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x190),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x188),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),8]::64 word) = (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x180),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),4]::32 word) = ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x1c),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x80),8]::64 word) = 0x15edc\<close>
declare P_0x15edc_49_def[Ps]

definition P_0x15edc_49_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x15edc_49_regions_set \<sigma> \<equiv> {
    (0, RSI\<^sub>0, Suc 0),
    (1, RSP\<^sub>0, 8),
    (2, ((FS\<^sub>0::64 word) + 0x28), 8),
    (3, ((RDI\<^sub>0::64 word) + 0x40), 8),
    (4, ((RSI\<^sub>0::64 word) + 0x180), 8),
    (5, ((RSI\<^sub>0::64 word) + 0x188), 4),
    (6, ((RSI\<^sub>0::64 word) + 0x190), 8),
    (7, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x1c), 4),
    (8, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x38), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (11, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (12, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (13, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (14, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (15, ((RSP\<^sub>0::64 word) - 0x40), 8),
    (16, ((RSP\<^sub>0::64 word) - 0x48), 8),
    (17, ((RSP\<^sub>0::64 word) - 0x50), 4),
    (18, ((RSP\<^sub>0::64 word) - 0x58), 8),
    (19, ((RSP\<^sub>0::64 word) - 0x70), 4),
    (20, ((RSP\<^sub>0::64 word) - 0x80), 8)
  }\<close>

definition P_0x15edc_49_regions :: state_pred where
  \<open>P_0x15edc_49_regions \<sigma> \<equiv> \<exists>regions. P_0x15edc_49_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x15ee4_49 :: state_pred where
  \<open>Q_0x15ee4_49 \<sigma> \<equiv> RIP \<sigma> = 0x15ee4 \<and> RAX \<sigma> = qemu_malloc_0x15ed7_retval \<and> RBX \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> RCX \<sigma> = ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x1c),4]::32 word)) \<and> RDX \<sigma> = ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x1c),4]::32 word)) \<and> RDI \<sigma> = ((ucast (((sextend (ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x1c),4]::32 word))) 32 64::64 word)::64 word))::64 word) << 3) \<and> RSI \<sigma> = ((ucast (((sextend (ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x1c),4]::32 word))) 32 64::64 word)::64 word))::64 word) << 3) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x78) \<and> R13 \<sigma> = qemu_malloc_0x15ed7_retval \<and> R12 \<sigma> = RDI\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> regs \<sigma> ymm0w1 = 0x0 \<and> regs \<sigma> ymm0w0 = 0x0 \<and> regs \<sigma> ymm1w1 = ymm1w1\<^sub>0 \<and> regs \<sigma> ymm1w0 = ymm1w0\<^sub>0 \<and> regs \<sigma> ymm2w1 = ymm2w1\<^sub>0 \<and> regs \<sigma> ymm2w0 = ymm2w0\<^sub>0 \<and> regs \<sigma> ymm3w1 = ymm3w1\<^sub>0 \<and> regs \<sigma> ymm3w0 = ymm3w0\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word) = ucast ((\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x180),8]::64 word) = (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x180),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x188),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x188),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x190),8]::64 word) = (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x190),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x1c),4]::32 word) = ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x1c),4]::32 word)) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x38),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x38),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x48),8]::64 word) = (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x190),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x188),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),8]::64 word) = (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x180),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),4]::32 word) = ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x1c),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x80),8]::64 word) = 0x15edc\<close>
declare Q_0x15ee4_49_def[Qs]

schematic_goal qcow_snapshot_create_0_3_0x15edc_0x15ee2_49[blocks]:
  assumes \<open>(P_0x15edc_49 && P_0x15edc_49_regions) \<sigma>\<close>
  shows \<open>exec_block 3 0x15ee2 49 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x15ee4_49 ?\<sigma> \<and> block_usage P_0x15edc_49_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x15edc_49_def P_0x15edc_49_regions_def post: Q_0x15ee4_49_def regionset: P_0x15edc_49_regions_set_def)

definition P_0x15ee4_true_50 :: state_pred where
  \<open>P_0x15ee4_true_50 \<sigma> \<equiv> RIP \<sigma> = 0x15ee4 \<and> RAX \<sigma> = qemu_malloc_0x15ed7_retval \<and> RBX \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> RCX \<sigma> = ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x1c),4]::32 word)) \<and> RDX \<sigma> = ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x1c),4]::32 word)) \<and> RDI \<sigma> = ((ucast (((sextend (ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x1c),4]::32 word))) 32 64::64 word)::64 word))::64 word) << 3) \<and> RSI \<sigma> = ((ucast (((sextend (ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x1c),4]::32 word))) 32 64::64 word)::64 word))::64 word) << 3) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x78) \<and> R13 \<sigma> = qemu_malloc_0x15ed7_retval \<and> R12 \<sigma> = RDI\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> regs \<sigma> ymm0w1 = 0x0 \<and> regs \<sigma> ymm0w0 = 0x0 \<and> regs \<sigma> ymm1w1 = ymm1w1\<^sub>0 \<and> regs \<sigma> ymm1w0 = ymm1w0\<^sub>0 \<and> regs \<sigma> ymm2w1 = ymm2w1\<^sub>0 \<and> regs \<sigma> ymm2w0 = ymm2w0\<^sub>0 \<and> regs \<sigma> ymm3w1 = ymm3w1\<^sub>0 \<and> regs \<sigma> ymm3w0 = ymm3w0\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word) = ucast ((\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x180),8]::64 word) = (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x180),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x188),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x188),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x190),8]::64 word) = (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x190),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x1c),4]::32 word) = ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x1c),4]::32 word)) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x38),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x38),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x48),8]::64 word) = (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x190),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x188),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),8]::64 word) = (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x180),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),4]::32 word) = ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x1c),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x80),8]::64 word) = 0x15edc\<close>
declare P_0x15ee4_true_50_def[Ps]

definition P_0x15ee4_true_50_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x15ee4_true_50_regions_set \<sigma> \<equiv> {
    (0, RSI\<^sub>0, Suc 0),
    (1, RSP\<^sub>0, 8),
    (2, ((FS\<^sub>0::64 word) + 0x28), 8),
    (3, ((RDI\<^sub>0::64 word) + 0x40), 8),
    (4, ((RSI\<^sub>0::64 word) + 0x180), 8),
    (5, ((RSI\<^sub>0::64 word) + 0x188), 4),
    (6, ((RSI\<^sub>0::64 word) + 0x190), 8),
    (7, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x1c), 4),
    (8, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x38), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (11, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (12, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (13, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (14, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (15, ((RSP\<^sub>0::64 word) - 0x40), 8),
    (16, ((RSP\<^sub>0::64 word) - 0x48), 8),
    (17, ((RSP\<^sub>0::64 word) - 0x50), 4),
    (18, ((RSP\<^sub>0::64 word) - 0x58), 8),
    (19, ((RSP\<^sub>0::64 word) - 0x70), 4),
    (20, ((RSP\<^sub>0::64 word) - 0x80), 8)
  }\<close>

definition P_0x15ee4_true_50_regions :: state_pred where
  \<open>P_0x15ee4_true_50_regions \<sigma> \<equiv> \<exists>regions. P_0x15ee4_true_50_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x15f0b_50 :: state_pred where
  \<open>Q_0x15f0b_50 \<sigma> \<equiv> RIP \<sigma> = 0x15f0b \<and> RBX \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> RCX \<sigma> = ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x1c),4]::32 word)) \<and> RDI \<sigma> = ((ucast (((sextend (ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x1c),4]::32 word))) 32 64::64 word)::64 word))::64 word) << 3) \<and> RSI \<sigma> = ((ucast (((sextend (ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x1c),4]::32 word))) 32 64::64 word)::64 word))::64 word) << 3) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x78) \<and> R13 \<sigma> = qemu_malloc_0x15ed7_retval \<and> R12 \<sigma> = RDI\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> regs \<sigma> ymm0w1 = 0x0 \<and> regs \<sigma> ymm0w0 = 0x0 \<and> regs \<sigma> ymm1w1 = ymm1w1\<^sub>0 \<and> regs \<sigma> ymm1w0 = ymm1w0\<^sub>0 \<and> regs \<sigma> ymm2w1 = ymm2w1\<^sub>0 \<and> regs \<sigma> ymm2w0 = ymm2w0\<^sub>0 \<and> regs \<sigma> ymm3w1 = ymm3w1\<^sub>0 \<and> regs \<sigma> ymm3w0 = ymm3w0\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word) = ucast ((\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x180),8]::64 word) = (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x180),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x188),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x188),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x190),8]::64 word) = (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x190),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x1c),4]::32 word) = ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x1c),4]::32 word)) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x38),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x38),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x48),8]::64 word) = (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x190),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x188),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),8]::64 word) = (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x180),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),4]::32 word) = ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x1c),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x80),8]::64 word) = 0x15edc\<close>
declare Q_0x15f0b_50_def[Qs]

schematic_goal qcow_snapshot_create_0_1_0x15ee4_0x15ee4_50[blocks]:
  assumes \<open>(P_0x15ee4_true_50 && P_0x15ee4_true_50_regions && jle) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x15ee4 50 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x15f0b_50 ?\<sigma> \<and> block_usage P_0x15ee4_true_50_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x15ee4_true_50_def P_0x15ee4_true_50_regions_def post: Q_0x15f0b_50_def regionset: P_0x15ee4_true_50_regions_set_def)

definition P_0x15ee4_false_51 :: state_pred where
  \<open>P_0x15ee4_false_51 \<sigma> \<equiv> RIP \<sigma> = 0x15ee4 \<and> RAX \<sigma> = qemu_malloc_0x15ed7_retval \<and> RBX \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> RCX \<sigma> = ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x1c),4]::32 word)) \<and> RDX \<sigma> = ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x1c),4]::32 word)) \<and> RDI \<sigma> = ((ucast (((sextend (ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x1c),4]::32 word))) 32 64::64 word)::64 word))::64 word) << 3) \<and> RSI \<sigma> = ((ucast (((sextend (ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x1c),4]::32 word))) 32 64::64 word)::64 word))::64 word) << 3) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x78) \<and> R13 \<sigma> = qemu_malloc_0x15ed7_retval \<and> R12 \<sigma> = RDI\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> regs \<sigma> ymm0w1 = 0x0 \<and> regs \<sigma> ymm0w0 = 0x0 \<and> regs \<sigma> ymm1w1 = ymm1w1\<^sub>0 \<and> regs \<sigma> ymm1w0 = ymm1w0\<^sub>0 \<and> regs \<sigma> ymm2w1 = ymm2w1\<^sub>0 \<and> regs \<sigma> ymm2w0 = ymm2w0\<^sub>0 \<and> regs \<sigma> ymm3w1 = ymm3w1\<^sub>0 \<and> regs \<sigma> ymm3w0 = ymm3w0\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word) = ucast ((\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x180),8]::64 word) = (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x180),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x188),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x188),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x190),8]::64 word) = (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x190),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x1c),4]::32 word) = ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x1c),4]::32 word)) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x38),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x38),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x48),8]::64 word) = (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x190),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x188),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),8]::64 word) = (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x180),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),4]::32 word) = ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x1c),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x80),8]::64 word) = 0x15edc\<close>
declare P_0x15ee4_false_51_def[Ps]

definition P_0x15ee4_false_51_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x15ee4_false_51_regions_set \<sigma> \<equiv> {
    (0, RSI\<^sub>0, Suc 0),
    (1, RSP\<^sub>0, 8),
    (2, ((FS\<^sub>0::64 word) + 0x28), 8),
    (3, ((RDI\<^sub>0::64 word) + 0x40), 8),
    (4, ((RSI\<^sub>0::64 word) + 0x180), 8),
    (5, ((RSI\<^sub>0::64 word) + 0x188), 4),
    (6, ((RSI\<^sub>0::64 word) + 0x190), 8),
    (7, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x1c), 4),
    (8, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x38), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (11, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (12, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (13, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (14, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (15, ((RSP\<^sub>0::64 word) - 0x40), 8),
    (16, ((RSP\<^sub>0::64 word) - 0x48), 8),
    (17, ((RSP\<^sub>0::64 word) - 0x50), 4),
    (18, ((RSP\<^sub>0::64 word) - 0x58), 8),
    (19, ((RSP\<^sub>0::64 word) - 0x70), 4),
    (20, ((RSP\<^sub>0::64 word) - 0x80), 8)
  }\<close>

definition P_0x15ee4_false_51_regions :: state_pred where
  \<open>P_0x15ee4_false_51_regions \<sigma> \<equiv> \<exists>regions. P_0x15ee4_false_51_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x15ef0_51 :: state_pred where
  \<open>Q_0x15ef0_51 \<sigma> \<equiv> RIP \<sigma> = 0x15ef0 \<and> RBX \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> RCX \<sigma> = ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x1c),4]::32 word)) \<and> RDI \<sigma> = ((ucast (((sextend (ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x1c),4]::32 word))) 32 64::64 word)::64 word))::64 word) << 3) \<and> RSI \<sigma> = ((ucast (((sextend (ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x1c),4]::32 word))) 32 64::64 word)::64 word))::64 word) << 3) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x78) \<and> R13 \<sigma> = qemu_malloc_0x15ed7_retval \<and> R12 \<sigma> = RDI\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> regs \<sigma> ymm0w1 = 0x0 \<and> regs \<sigma> ymm0w0 = 0x0 \<and> regs \<sigma> ymm1w1 = ymm1w1\<^sub>0 \<and> regs \<sigma> ymm1w0 = ymm1w0\<^sub>0 \<and> regs \<sigma> ymm2w1 = ymm2w1\<^sub>0 \<and> regs \<sigma> ymm2w0 = ymm2w0\<^sub>0 \<and> regs \<sigma> ymm3w1 = ymm3w1\<^sub>0 \<and> regs \<sigma> ymm3w0 = ymm3w0\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word) = ucast ((\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x180),8]::64 word) = (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x180),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x188),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x188),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x190),8]::64 word) = (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x190),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x1c),4]::32 word) = ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x1c),4]::32 word)) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x38),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x38),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x48),8]::64 word) = (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x190),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x188),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),8]::64 word) = (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x180),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),4]::32 word) = ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x1c),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x80),8]::64 word) = 0x15edc\<close>
declare Q_0x15ef0_51_def[Qs]

schematic_goal qcow_snapshot_create_0_3_0x15ee4_0x15ee8_51[blocks]:
  assumes \<open>(P_0x15ee4_false_51 && P_0x15ee4_false_51_regions && ! jle) \<sigma>\<close>
  shows \<open>exec_block 3 0x15ee8 51 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x15ef0_51 ?\<sigma> \<and> block_usage P_0x15ee4_false_51_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x15ee4_false_51_def P_0x15ee4_false_51_regions_def post: Q_0x15ef0_51_def regionset: P_0x15ee4_false_51_regions_set_def)

definition P_0x15ef0_52 :: state_pred where
  \<open>P_0x15ef0_52 \<sigma> \<equiv> RIP \<sigma> = 0x15ef0 \<and> RBX \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> RCX \<sigma> = ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x1c),4]::32 word)) \<and> RDI \<sigma> = ((ucast (((sextend (ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x1c),4]::32 word))) 32 64::64 word)::64 word))::64 word) << 3) \<and> RSI \<sigma> = ((ucast (((sextend (ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x1c),4]::32 word))) 32 64::64 word)::64 word))::64 word) << 3) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x78) \<and> R13 \<sigma> = qemu_malloc_0x15ed7_retval \<and> R12 \<sigma> = RDI\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> regs \<sigma> ymm0w1 = 0x0 \<and> regs \<sigma> ymm0w0 = 0x0 \<and> regs \<sigma> ymm1w1 = ymm1w1\<^sub>0 \<and> regs \<sigma> ymm1w0 = ymm1w0\<^sub>0 \<and> regs \<sigma> ymm2w1 = ymm2w1\<^sub>0 \<and> regs \<sigma> ymm2w0 = ymm2w0\<^sub>0 \<and> regs \<sigma> ymm3w1 = ymm3w1\<^sub>0 \<and> regs \<sigma> ymm3w0 = ymm3w0\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word) = ucast ((\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x180),8]::64 word) = (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x180),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x188),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x188),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x190),8]::64 word) = (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x190),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x1c),4]::32 word) = ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x1c),4]::32 word)) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x38),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x38),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x48),8]::64 word) = (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x190),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x188),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),8]::64 word) = (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x180),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),4]::32 word) = ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x1c),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x80),8]::64 word) = 0x15edc\<close>
declare P_0x15ef0_52_def[Ps]

definition P_0x15ef0_52_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x15ef0_52_regions_set \<sigma> \<equiv> {
    (0, RSI\<^sub>0, Suc 0),
    (1, RSP\<^sub>0, 8),
    (2, ((FS\<^sub>0::64 word) + 0x28), 8),
    (3, ((RDI\<^sub>0::64 word) + 0x40), 8),
    (4, ((RSI\<^sub>0::64 word) + 0x180), 8),
    (5, ((RSI\<^sub>0::64 word) + 0x188), 4),
    (6, ((RSI\<^sub>0::64 word) + 0x190), 8),
    (7, ((qemu_malloc_0x15ed7_retval::64 word) + (\<langle>63,0\<rangle>((RAX \<sigma>::64 word) * 0x8)::64 word)), 8),
    (8, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x1c), 4),
    (9, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x38), 8),
    (10, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x40), 8),
    (11, (((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x40),8]::64 word)::64 word) + (\<langle>63,0\<rangle>((RAX \<sigma>::64 word) * 0x8)::64 word)), 8),
    (12, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (13, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (14, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (15, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (16, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (17, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (18, ((RSP\<^sub>0::64 word) - 0x40), 8),
    (19, ((RSP\<^sub>0::64 word) - 0x48), 8),
    (20, ((RSP\<^sub>0::64 word) - 0x50), 4),
    (21, ((RSP\<^sub>0::64 word) - 0x58), 8),
    (22, ((RSP\<^sub>0::64 word) - 0x70), 4),
    (23, ((RSP\<^sub>0::64 word) - 0x80), 8)
  }\<close>

definition P_0x15ef0_52_regions :: state_pred where
  \<open>P_0x15ef0_52_regions \<sigma> \<equiv> \<exists>regions. P_0x15ef0_52_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x15f09_52 :: state_pred where
  \<open>Q_0x15f09_52 \<sigma> \<equiv> RIP \<sigma> = 0x15f09 \<and> RBX \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> RCX \<sigma> = ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x1c),4]::32 word)) \<and> RDI \<sigma> = ((ucast (((sextend (ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x1c),4]::32 word))) 32 64::64 word)::64 word))::64 word) << 3) \<and> RSI \<sigma> = ((ucast (((sextend (ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x1c),4]::32 word))) 32 64::64 word)::64 word))::64 word) << 3) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x78) \<and> R13 \<sigma> = qemu_malloc_0x15ed7_retval \<and> R12 \<sigma> = RDI\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> regs \<sigma> ymm0w1 = 0x0 \<and> regs \<sigma> ymm0w0 = 0x0 \<and> regs \<sigma> ymm1w1 = ymm1w1\<^sub>0 \<and> regs \<sigma> ymm1w0 = ymm1w0\<^sub>0 \<and> regs \<sigma> ymm2w1 = ymm2w1\<^sub>0 \<and> regs \<sigma> ymm2w0 = ymm2w0\<^sub>0 \<and> regs \<sigma> ymm3w1 = ymm3w1\<^sub>0 \<and> regs \<sigma> ymm3w0 = ymm3w0\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word) = ucast ((\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x180),8]::64 word) = (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x180),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x188),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x188),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x190),8]::64 word) = (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x190),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x1c),4]::32 word) = ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x1c),4]::32 word)) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x38),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x38),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x48),8]::64 word) = (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x190),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x188),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),8]::64 word) = (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x180),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),4]::32 word) = ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x1c),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x80),8]::64 word) = 0x15edc\<close>
declare Q_0x15f09_52_def[Qs]

schematic_goal qcow_snapshot_create_0_7_0x15ef0_0x15f07_52[blocks]:
  assumes \<open>(P_0x15ef0_52 && P_0x15ef0_52_regions) \<sigma>\<close>
  shows \<open>exec_block 7 0x15f07 52 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x15f09_52 ?\<sigma> \<and> block_usage P_0x15ef0_52_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x15ef0_52_def P_0x15ef0_52_regions_def post: Q_0x15f09_52_def regionset: P_0x15ef0_52_regions_set_def)

definition P_0x15f09_true_53 :: state_pred where
  \<open>P_0x15f09_true_53 \<sigma> \<equiv> RIP \<sigma> = 0x15f09 \<and> RBX \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> RCX \<sigma> = ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x1c),4]::32 word)) \<and> RDI \<sigma> = ((ucast (((sextend (ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x1c),4]::32 word))) 32 64::64 word)::64 word))::64 word) << 3) \<and> RSI \<sigma> = ((ucast (((sextend (ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x1c),4]::32 word))) 32 64::64 word)::64 word))::64 word) << 3) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x78) \<and> R13 \<sigma> = qemu_malloc_0x15ed7_retval \<and> R12 \<sigma> = RDI\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> regs \<sigma> ymm0w1 = 0x0 \<and> regs \<sigma> ymm0w0 = 0x0 \<and> regs \<sigma> ymm1w1 = ymm1w1\<^sub>0 \<and> regs \<sigma> ymm1w0 = ymm1w0\<^sub>0 \<and> regs \<sigma> ymm2w1 = ymm2w1\<^sub>0 \<and> regs \<sigma> ymm2w0 = ymm2w0\<^sub>0 \<and> regs \<sigma> ymm3w1 = ymm3w1\<^sub>0 \<and> regs \<sigma> ymm3w0 = ymm3w0\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word) = ucast ((\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x180),8]::64 word) = (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x180),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x188),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x188),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x190),8]::64 word) = (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x190),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x1c),4]::32 word) = ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x1c),4]::32 word)) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x38),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x38),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x48),8]::64 word) = (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x190),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x188),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),8]::64 word) = (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x180),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),4]::32 word) = ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x1c),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x80),8]::64 word) = 0x15edc\<close>
declare P_0x15f09_true_53_def[Ps]

definition P_0x15f09_true_53_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x15f09_true_53_regions_set \<sigma> \<equiv> {
    (0, RSI\<^sub>0, Suc 0),
    (1, RSP\<^sub>0, 8),
    (2, ((FS\<^sub>0::64 word) + 0x28), 8),
    (3, ((RDI\<^sub>0::64 word) + 0x40), 8),
    (4, ((RSI\<^sub>0::64 word) + 0x180), 8),
    (5, ((RSI\<^sub>0::64 word) + 0x188), 4),
    (6, ((RSI\<^sub>0::64 word) + 0x190), 8),
    (7, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x1c), 4),
    (8, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x38), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (11, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (12, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (13, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (14, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (15, ((RSP\<^sub>0::64 word) - 0x40), 8),
    (16, ((RSP\<^sub>0::64 word) - 0x48), 8),
    (17, ((RSP\<^sub>0::64 word) - 0x50), 4),
    (18, ((RSP\<^sub>0::64 word) - 0x58), 8),
    (19, ((RSP\<^sub>0::64 word) - 0x70), 4),
    (20, ((RSP\<^sub>0::64 word) - 0x80), 8)
  }\<close>

definition P_0x15f09_true_53_regions :: state_pred where
  \<open>P_0x15f09_true_53_regions \<sigma> \<equiv> \<exists>regions. P_0x15f09_true_53_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x15ef0_53 :: state_pred where
  \<open>Q_0x15ef0_53 \<sigma> \<equiv> RIP \<sigma> = 0x15ef0 \<and> RBX \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> RCX \<sigma> = ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x1c),4]::32 word)) \<and> RDI \<sigma> = ((ucast (((sextend (ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x1c),4]::32 word))) 32 64::64 word)::64 word))::64 word) << 3) \<and> RSI \<sigma> = ((ucast (((sextend (ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x1c),4]::32 word))) 32 64::64 word)::64 word))::64 word) << 3) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x78) \<and> R13 \<sigma> = qemu_malloc_0x15ed7_retval \<and> R12 \<sigma> = RDI\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> regs \<sigma> ymm0w1 = 0x0 \<and> regs \<sigma> ymm0w0 = 0x0 \<and> regs \<sigma> ymm1w1 = ymm1w1\<^sub>0 \<and> regs \<sigma> ymm1w0 = ymm1w0\<^sub>0 \<and> regs \<sigma> ymm2w1 = ymm2w1\<^sub>0 \<and> regs \<sigma> ymm2w0 = ymm2w0\<^sub>0 \<and> regs \<sigma> ymm3w1 = ymm3w1\<^sub>0 \<and> regs \<sigma> ymm3w0 = ymm3w0\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word) = ucast ((\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x180),8]::64 word) = (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x180),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x188),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x188),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x190),8]::64 word) = (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x190),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x1c),4]::32 word) = ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x1c),4]::32 word)) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x38),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x38),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x48),8]::64 word) = (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x190),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x188),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),8]::64 word) = (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x180),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),4]::32 word) = ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x1c),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x80),8]::64 word) = 0x15edc\<close>
declare Q_0x15ef0_53_def[Qs]

schematic_goal qcow_snapshot_create_0_1_0x15f09_0x15f09_53[blocks]:
  assumes \<open>(P_0x15f09_true_53 && P_0x15f09_true_53_regions && jg) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x15f09 53 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x15ef0_53 ?\<sigma> \<and> block_usage P_0x15f09_true_53_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x15f09_true_53_def P_0x15f09_true_53_regions_def post: Q_0x15ef0_53_def regionset: P_0x15f09_true_53_regions_set_def)

definition P_0x15f09_false_54 :: state_pred where
  \<open>P_0x15f09_false_54 \<sigma> \<equiv> RIP \<sigma> = 0x15f09 \<and> RBX \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> RCX \<sigma> = ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x1c),4]::32 word)) \<and> RDI \<sigma> = ((ucast (((sextend (ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x1c),4]::32 word))) 32 64::64 word)::64 word))::64 word) << 3) \<and> RSI \<sigma> = ((ucast (((sextend (ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x1c),4]::32 word))) 32 64::64 word)::64 word))::64 word) << 3) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x78) \<and> R13 \<sigma> = qemu_malloc_0x15ed7_retval \<and> R12 \<sigma> = RDI\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> regs \<sigma> ymm0w1 = 0x0 \<and> regs \<sigma> ymm0w0 = 0x0 \<and> regs \<sigma> ymm1w1 = ymm1w1\<^sub>0 \<and> regs \<sigma> ymm1w0 = ymm1w0\<^sub>0 \<and> regs \<sigma> ymm2w1 = ymm2w1\<^sub>0 \<and> regs \<sigma> ymm2w0 = ymm2w0\<^sub>0 \<and> regs \<sigma> ymm3w1 = ymm3w1\<^sub>0 \<and> regs \<sigma> ymm3w0 = ymm3w0\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word) = ucast ((\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x180),8]::64 word) = (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x180),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x188),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x188),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x190),8]::64 word) = (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x190),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x1c),4]::32 word) = ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x1c),4]::32 word)) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x38),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x38),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x48),8]::64 word) = (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x190),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x188),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),8]::64 word) = (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x180),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),4]::32 word) = ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x1c),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x80),8]::64 word) = 0x15edc\<close>
declare P_0x15f09_false_54_def[Ps]

definition P_0x15f09_false_54_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x15f09_false_54_regions_set \<sigma> \<equiv> {
    (0, RSI\<^sub>0, Suc 0),
    (1, RSP\<^sub>0, 8),
    (2, ((FS\<^sub>0::64 word) + 0x28), 8),
    (3, ((RDI\<^sub>0::64 word) + 0x40), 8),
    (4, ((RSI\<^sub>0::64 word) + 0x180), 8),
    (5, ((RSI\<^sub>0::64 word) + 0x188), 4),
    (6, ((RSI\<^sub>0::64 word) + 0x190), 8),
    (7, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x1c), 4),
    (8, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x38), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (11, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (12, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (13, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (14, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (15, ((RSP\<^sub>0::64 word) - 0x40), 8),
    (16, ((RSP\<^sub>0::64 word) - 0x48), 8),
    (17, ((RSP\<^sub>0::64 word) - 0x50), 4),
    (18, ((RSP\<^sub>0::64 word) - 0x58), 8),
    (19, ((RSP\<^sub>0::64 word) - 0x70), 4),
    (20, ((RSP\<^sub>0::64 word) - 0x80), 8)
  }\<close>

definition P_0x15f09_false_54_regions :: state_pred where
  \<open>P_0x15f09_false_54_regions \<sigma> \<equiv> \<exists>regions. P_0x15f09_false_54_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x15f0b_54 :: state_pred where
  \<open>Q_0x15f0b_54 \<sigma> \<equiv> RIP \<sigma> = 0x15f0b \<and> RBX \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> RCX \<sigma> = ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x1c),4]::32 word)) \<and> RDI \<sigma> = ((ucast (((sextend (ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x1c),4]::32 word))) 32 64::64 word)::64 word))::64 word) << 3) \<and> RSI \<sigma> = ((ucast (((sextend (ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x1c),4]::32 word))) 32 64::64 word)::64 word))::64 word) << 3) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x78) \<and> R13 \<sigma> = qemu_malloc_0x15ed7_retval \<and> R12 \<sigma> = RDI\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> regs \<sigma> ymm0w1 = 0x0 \<and> regs \<sigma> ymm0w0 = 0x0 \<and> regs \<sigma> ymm1w1 = ymm1w1\<^sub>0 \<and> regs \<sigma> ymm1w0 = ymm1w0\<^sub>0 \<and> regs \<sigma> ymm2w1 = ymm2w1\<^sub>0 \<and> regs \<sigma> ymm2w0 = ymm2w0\<^sub>0 \<and> regs \<sigma> ymm3w1 = ymm3w1\<^sub>0 \<and> regs \<sigma> ymm3w0 = ymm3w0\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word) = ucast ((\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x180),8]::64 word) = (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x180),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x188),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x188),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x190),8]::64 word) = (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x190),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x1c),4]::32 word) = ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x1c),4]::32 word)) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x38),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x38),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x48),8]::64 word) = (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x190),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x188),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),8]::64 word) = (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x180),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),4]::32 word) = ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x1c),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x80),8]::64 word) = 0x15edc\<close>
declare Q_0x15f0b_54_def[Qs]

schematic_goal qcow_snapshot_create_0_1_0x15f09_0x15f09_54[blocks]:
  assumes \<open>(P_0x15f09_false_54 && P_0x15f09_false_54_regions && ! jg) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x15f09 54 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x15f0b_54 ?\<sigma> \<and> block_usage P_0x15f09_false_54_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x15f09_false_54_def P_0x15f09_false_54_regions_def post: Q_0x15f0b_54_def regionset: P_0x15f09_false_54_regions_set_def)

definition P_0x15f0b_55 :: state_pred where
  \<open>P_0x15f0b_55 \<sigma> \<equiv> RIP \<sigma> = 0x15f0b \<and> RBX \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> RCX \<sigma> = ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x1c),4]::32 word)) \<and> RDI \<sigma> = ((ucast (((sextend (ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x1c),4]::32 word))) 32 64::64 word)::64 word))::64 word) << 3) \<and> RSI \<sigma> = ((ucast (((sextend (ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x1c),4]::32 word))) 32 64::64 word)::64 word))::64 word) << 3) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x78) \<and> R13 \<sigma> = qemu_malloc_0x15ed7_retval \<and> R12 \<sigma> = RDI\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> regs \<sigma> ymm0w1 = 0x0 \<and> regs \<sigma> ymm0w0 = 0x0 \<and> regs \<sigma> ymm1w1 = ymm1w1\<^sub>0 \<and> regs \<sigma> ymm1w0 = ymm1w0\<^sub>0 \<and> regs \<sigma> ymm2w1 = ymm2w1\<^sub>0 \<and> regs \<sigma> ymm2w0 = ymm2w0\<^sub>0 \<and> regs \<sigma> ymm3w1 = ymm3w1\<^sub>0 \<and> regs \<sigma> ymm3w0 = ymm3w0\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word) = ucast ((\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x180),8]::64 word) = (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x180),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x188),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x188),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x190),8]::64 word) = (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x190),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x1c),4]::32 word) = ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x1c),4]::32 word)) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x38),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x38),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x48),8]::64 word) = (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x190),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x188),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),8]::64 word) = (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x180),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),4]::32 word) = ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x1c),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x80),8]::64 word) = 0x15edc\<close>
declare P_0x15f0b_55_def[Ps]

definition P_0x15f0b_55_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x15f0b_55_regions_set \<sigma> \<equiv> {
    (0, RSI\<^sub>0, Suc 0),
    (1, RSP\<^sub>0, 8),
    (2, ((FS\<^sub>0::64 word) + 0x28), 8),
    (3, ((RDI\<^sub>0::64 word) + 0x40), 8),
    (4, ((RSI\<^sub>0::64 word) + 0x180), 8),
    (5, ((RSI\<^sub>0::64 word) + 0x188), 4),
    (6, ((RSI\<^sub>0::64 word) + 0x190), 8),
    (7, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x1c), 4),
    (8, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x38), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (11, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (12, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (13, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (14, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (15, ((RSP\<^sub>0::64 word) - 0x40), 8),
    (16, ((RSP\<^sub>0::64 word) - 0x48), 8),
    (17, ((RSP\<^sub>0::64 word) - 0x50), 4),
    (18, ((RSP\<^sub>0::64 word) - 0x58), 8),
    (19, ((RSP\<^sub>0::64 word) - 0x70), 4),
    (20, ((RSP\<^sub>0::64 word) - 0x80), 8),
    (21, (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word), 8)
  }\<close>

definition P_0x15f0b_55_regions :: state_pred where
  \<open>P_0x15f0b_55_regions \<sigma> \<equiv> \<exists>regions. P_0x15f0b_55_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x15f17_55 :: state_pred where
  \<open>Q_0x15f17_55 \<sigma> \<equiv> RIP \<sigma> = 0x15f17 \<and> RBX \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> RCX \<sigma> = ucast (((ucast (((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x1c),4]::32 word)::32 word))::32 word) << 3)) \<and> RDI \<sigma> = (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word),8]::64 word) \<and> RSI \<sigma> = R14 \<sigma> \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x78) \<and> R13 \<sigma> = qemu_malloc_0x15ed7_retval \<and> R12 \<sigma> = RDI\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> regs \<sigma> ymm0w1 = 0x0 \<and> regs \<sigma> ymm0w0 = 0x0 \<and> regs \<sigma> ymm1w1 = ymm1w1\<^sub>0 \<and> regs \<sigma> ymm1w0 = ymm1w0\<^sub>0 \<and> regs \<sigma> ymm2w1 = ymm2w1\<^sub>0 \<and> regs \<sigma> ymm2w0 = ymm2w0\<^sub>0 \<and> regs \<sigma> ymm3w1 = ymm3w1\<^sub>0 \<and> regs \<sigma> ymm3w0 = ymm3w0\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word) = ucast ((\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x180),8]::64 word) = (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x180),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x188),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x188),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x190),8]::64 word) = (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x190),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x1c),4]::32 word) = ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x1c),4]::32 word)) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x38),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x38),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x48),8]::64 word) = (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x190),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x188),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),8]::64 word) = (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x180),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),4]::32 word) = ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x1c),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x80),8]::64 word) = 0x15edc \<and> (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word),8]::64 word) = (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word),8]::64 word)\<close>
declare Q_0x15f17_55_def[Qs]

schematic_goal qcow_snapshot_create_0_4_0x15f0b_0x15f14_55[blocks]:
  assumes \<open>(P_0x15f0b_55 && P_0x15f0b_55_regions) \<sigma>\<close>
  shows \<open>exec_block 4 0x15f14 55 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x15f17_55 ?\<sigma> \<and> block_usage P_0x15f0b_55_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x15f0b_55_def P_0x15f0b_55_regions_def post: Q_0x15f17_55_def regionset: P_0x15f0b_55_regions_set_def)

definition P_0x15f17_56 :: state_pred where
  \<open>P_0x15f17_56 \<sigma> \<equiv> RIP \<sigma> = 0x15f17 \<and> RBX \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> RCX \<sigma> = ucast (((ucast (((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x1c),4]::32 word)::32 word))::32 word) << 3)) \<and> RDI \<sigma> = (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word),8]::64 word) \<and> RSI \<sigma> = R14 \<sigma> \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x78) \<and> R13 \<sigma> = qemu_malloc_0x15ed7_retval \<and> R12 \<sigma> = RDI\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> regs \<sigma> ymm0w1 = 0x0 \<and> regs \<sigma> ymm0w0 = 0x0 \<and> regs \<sigma> ymm1w1 = ymm1w1\<^sub>0 \<and> regs \<sigma> ymm1w0 = ymm1w0\<^sub>0 \<and> regs \<sigma> ymm2w1 = ymm2w1\<^sub>0 \<and> regs \<sigma> ymm2w0 = ymm2w0\<^sub>0 \<and> regs \<sigma> ymm3w1 = ymm3w1\<^sub>0 \<and> regs \<sigma> ymm3w0 = ymm3w0\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word) = ucast ((\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x180),8]::64 word) = (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x180),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x188),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x188),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x190),8]::64 word) = (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x190),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x1c),4]::32 word) = ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x1c),4]::32 word)) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x38),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x38),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x48),8]::64 word) = (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x190),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x188),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),8]::64 word) = (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x180),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),4]::32 word) = ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x1c),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x80),8]::64 word) = 0x15edc \<and> (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word),8]::64 word) = (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word),8]::64 word)\<close>
declare P_0x15f17_56_def[Ps]

definition P_0x15f17_56_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x15f17_56_regions_set \<sigma> \<equiv> {
    (0, RSI\<^sub>0, Suc 0),
    (1, RSP\<^sub>0, 8),
    (2, ((FS\<^sub>0::64 word) + 0x28), 8),
    (3, ((RDI\<^sub>0::64 word) + 0x40), 8),
    (4, ((RSI\<^sub>0::64 word) + 0x180), 8),
    (5, ((RSI\<^sub>0::64 word) + 0x188), 4),
    (6, ((RSI\<^sub>0::64 word) + 0x190), 8),
    (7, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x1c), 4),
    (8, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x38), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (11, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (12, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (13, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (14, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (15, ((RSP\<^sub>0::64 word) - 0x40), 8),
    (16, ((RSP\<^sub>0::64 word) - 0x48), 8),
    (17, ((RSP\<^sub>0::64 word) - 0x50), 4),
    (18, ((RSP\<^sub>0::64 word) - 0x58), 8),
    (19, ((RSP\<^sub>0::64 word) - 0x70), 4),
    (20, ((RSP\<^sub>0::64 word) - 0x80), 8),
    (21, (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word), 8)
  }\<close>

definition P_0x15f17_56_regions :: state_pred where
  \<open>P_0x15f17_56_regions \<sigma> \<equiv> \<exists>regions. P_0x15f17_56_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_bdrv_pwrite_addr_0x15f17_56 :: state_pred where
  \<open>Q_bdrv_pwrite_addr_0x15f17_56 \<sigma> \<equiv> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x80) \<and> RIP \<sigma> = bdrv_pwrite_addr \<and> RBX \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> RCX \<sigma> = ucast (((ucast (((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x1c),4]::32 word)::32 word))::32 word) << 3)) \<and> RDI \<sigma> = (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word),8]::64 word) \<and> RSI \<sigma> = R14 \<sigma> \<and> R13 \<sigma> = qemu_malloc_0x15ed7_retval \<and> R12 \<sigma> = RDI\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> regs \<sigma> ymm0w1 = 0x0 \<and> regs \<sigma> ymm0w0 = 0x0 \<and> regs \<sigma> ymm1w1 = ymm1w1\<^sub>0 \<and> regs \<sigma> ymm1w0 = ymm1w0\<^sub>0 \<and> regs \<sigma> ymm2w1 = ymm2w1\<^sub>0 \<and> regs \<sigma> ymm2w0 = ymm2w0\<^sub>0 \<and> regs \<sigma> ymm3w1 = ymm3w1\<^sub>0 \<and> regs \<sigma> ymm3w0 = ymm3w0\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word) = ucast ((\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x180),8]::64 word) = (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x180),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x188),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x188),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x190),8]::64 word) = (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x190),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x1c),4]::32 word) = ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x1c),4]::32 word)) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x38),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x38),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x48),8]::64 word) = (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x190),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x188),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),8]::64 word) = (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x180),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),4]::32 word) = ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x1c),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x80),8]::64 word) = 0x15f1c \<and> (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word),8]::64 word) = (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word),8]::64 word)\<close>
declare Q_bdrv_pwrite_addr_0x15f17_56_def[Qs]

schematic_goal qcow_snapshot_create_0_1_0x15f17_0x15f17_56[blocks]:
  assumes \<open>(P_0x15f17_56 && P_0x15f17_56_regions) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x15f17 56 \<sigma> \<triangleq> ?\<sigma> \<and> Q_bdrv_pwrite_addr_0x15f17_56 ?\<sigma> \<and> block_usage P_0x15f17_56_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x15f17_56_def P_0x15f17_56_regions_def post: Q_bdrv_pwrite_addr_0x15f17_56_def regionset: P_0x15f17_56_regions_set_def)

definition P_0x15f1c_57 :: state_pred where
  \<open>P_0x15f1c_57 \<sigma> \<equiv> RIP \<sigma> = 0x15f1c \<and> RBX \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> RCX \<sigma> = ucast (((ucast (((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x1c),4]::32 word)::32 word))::32 word) << 3)) \<and> RDI \<sigma> = (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word),8]::64 word) \<and> RSI \<sigma> = R14 \<sigma> \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x78) \<and> R13 \<sigma> = qemu_malloc_0x15ed7_retval \<and> R12 \<sigma> = RDI\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> regs \<sigma> ymm0w1 = 0x0 \<and> regs \<sigma> ymm0w0 = 0x0 \<and> regs \<sigma> ymm1w1 = ymm1w1\<^sub>0 \<and> regs \<sigma> ymm1w0 = ymm1w0\<^sub>0 \<and> regs \<sigma> ymm2w1 = ymm2w1\<^sub>0 \<and> regs \<sigma> ymm2w0 = ymm2w0\<^sub>0 \<and> regs \<sigma> ymm3w1 = ymm3w1\<^sub>0 \<and> regs \<sigma> ymm3w0 = ymm3w0\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word) = ucast ((\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x180),8]::64 word) = (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x180),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x188),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x188),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x190),8]::64 word) = (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x190),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x1c),4]::32 word) = ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x1c),4]::32 word)) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x38),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x38),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x48),8]::64 word) = (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x190),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x188),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),8]::64 word) = (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x180),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),4]::32 word) = ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x1c),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x80),8]::64 word) = 0x15f1c \<and> (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word),8]::64 word) = (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word),8]::64 word)\<close>
declare P_0x15f1c_57_def[Ps]

definition P_0x15f1c_57_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x15f1c_57_regions_set \<sigma> \<equiv> {
    (0, RSI\<^sub>0, Suc 0),
    (1, RSP\<^sub>0, 8),
    (2, ((FS\<^sub>0::64 word) + 0x28), 8),
    (3, ((RDI\<^sub>0::64 word) + 0x40), 8),
    (4, ((RSI\<^sub>0::64 word) + 0x180), 8),
    (5, ((RSI\<^sub>0::64 word) + 0x188), 4),
    (6, ((RSI\<^sub>0::64 word) + 0x190), 8),
    (7, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x1c), 4),
    (8, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x38), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (11, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (12, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (13, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (14, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (15, ((RSP\<^sub>0::64 word) - 0x40), 8),
    (16, ((RSP\<^sub>0::64 word) - 0x48), 8),
    (17, ((RSP\<^sub>0::64 word) - 0x50), 4),
    (18, ((RSP\<^sub>0::64 word) - 0x58), 8),
    (19, ((RSP\<^sub>0::64 word) - 0x70), 4),
    (20, ((RSP\<^sub>0::64 word) - 0x80), 8),
    (21, (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word), 8)
  }\<close>

definition P_0x15f1c_57_regions :: state_pred where
  \<open>P_0x15f1c_57_regions \<sigma> \<equiv> \<exists>regions. P_0x15f1c_57_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x15f29_57 :: state_pred where
  \<open>Q_0x15f29_57 \<sigma> \<equiv> RIP \<sigma> = 0x15f29 \<and> RBX \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> RCX \<sigma> = ucast (((ucast (((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x1c),4]::32 word)::32 word))::32 word) << 3)) \<and> RDX \<sigma> = ((ucast (((sextend (ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x1c),4]::32 word))) 32 64::64 word)::64 word))::64 word) << 3) \<and> RDI \<sigma> = (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word),8]::64 word) \<and> RSI \<sigma> = R14 \<sigma> \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x78) \<and> R13 \<sigma> = qemu_malloc_0x15ed7_retval \<and> R12 \<sigma> = RDI\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> regs \<sigma> ymm0w1 = 0x0 \<and> regs \<sigma> ymm0w0 = 0x0 \<and> regs \<sigma> ymm1w1 = ymm1w1\<^sub>0 \<and> regs \<sigma> ymm1w0 = ymm1w0\<^sub>0 \<and> regs \<sigma> ymm2w1 = ymm2w1\<^sub>0 \<and> regs \<sigma> ymm2w0 = ymm2w0\<^sub>0 \<and> regs \<sigma> ymm3w1 = ymm3w1\<^sub>0 \<and> regs \<sigma> ymm3w0 = ymm3w0\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word) = ucast ((\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x180),8]::64 word) = (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x180),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x188),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x188),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x190),8]::64 word) = (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x190),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x1c),4]::32 word) = ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x1c),4]::32 word)) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x38),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x38),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x48),8]::64 word) = (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x190),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x188),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),8]::64 word) = (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x180),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),4]::32 word) = ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x1c),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x80),8]::64 word) = 0x15f1c \<and> (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word),8]::64 word) = (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word),8]::64 word)\<close>
declare Q_0x15f29_57_def[Qs]

schematic_goal qcow_snapshot_create_0_4_0x15f1c_0x15f26_57[blocks]:
  assumes \<open>(P_0x15f1c_57 && P_0x15f1c_57_regions) \<sigma>\<close>
  shows \<open>exec_block 4 0x15f26 57 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x15f29_57 ?\<sigma> \<and> block_usage P_0x15f1c_57_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x15f1c_57_def P_0x15f1c_57_regions_def post: Q_0x15f29_57_def regionset: P_0x15f1c_57_regions_set_def)

definition P_0x15f29_true_58 :: state_pred where
  \<open>P_0x15f29_true_58 \<sigma> \<equiv> RIP \<sigma> = 0x15f29 \<and> RBX \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> RCX \<sigma> = ucast (((ucast (((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x1c),4]::32 word)::32 word))::32 word) << 3)) \<and> RDX \<sigma> = ((ucast (((sextend (ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x1c),4]::32 word))) 32 64::64 word)::64 word))::64 word) << 3) \<and> RDI \<sigma> = (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word),8]::64 word) \<and> RSI \<sigma> = R14 \<sigma> \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x78) \<and> R13 \<sigma> = qemu_malloc_0x15ed7_retval \<and> R12 \<sigma> = RDI\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> regs \<sigma> ymm0w1 = 0x0 \<and> regs \<sigma> ymm0w0 = 0x0 \<and> regs \<sigma> ymm1w1 = ymm1w1\<^sub>0 \<and> regs \<sigma> ymm1w0 = ymm1w0\<^sub>0 \<and> regs \<sigma> ymm2w1 = ymm2w1\<^sub>0 \<and> regs \<sigma> ymm2w0 = ymm2w0\<^sub>0 \<and> regs \<sigma> ymm3w1 = ymm3w1\<^sub>0 \<and> regs \<sigma> ymm3w0 = ymm3w0\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word) = ucast ((\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x180),8]::64 word) = (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x180),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x188),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x188),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x190),8]::64 word) = (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x190),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x1c),4]::32 word) = ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x1c),4]::32 word)) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x38),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x38),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x48),8]::64 word) = (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x190),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x188),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),8]::64 word) = (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x180),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),4]::32 word) = ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x1c),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x80),8]::64 word) = 0x15f1c \<and> (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word),8]::64 word) = (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word),8]::64 word)\<close>
declare P_0x15f29_true_58_def[Ps]

definition P_0x15f29_true_58_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x15f29_true_58_regions_set \<sigma> \<equiv> {
    (0, RSI\<^sub>0, Suc 0),
    (1, RSP\<^sub>0, 8),
    (2, ((FS\<^sub>0::64 word) + 0x28), 8),
    (3, ((RDI\<^sub>0::64 word) + 0x40), 8),
    (4, ((RSI\<^sub>0::64 word) + 0x180), 8),
    (5, ((RSI\<^sub>0::64 word) + 0x188), 4),
    (6, ((RSI\<^sub>0::64 word) + 0x190), 8),
    (7, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x1c), 4),
    (8, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x38), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (11, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (12, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (13, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (14, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (15, ((RSP\<^sub>0::64 word) - 0x40), 8),
    (16, ((RSP\<^sub>0::64 word) - 0x48), 8),
    (17, ((RSP\<^sub>0::64 word) - 0x50), 4),
    (18, ((RSP\<^sub>0::64 word) - 0x58), 8),
    (19, ((RSP\<^sub>0::64 word) - 0x70), 4),
    (20, ((RSP\<^sub>0::64 word) - 0x80), 8),
    (21, (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word), 8)
  }\<close>

definition P_0x15f29_true_58_regions :: state_pred where
  \<open>P_0x15f29_true_58_regions \<sigma> \<equiv> \<exists>regions. P_0x15f29_true_58_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x16092_58 :: state_pred where
  \<open>Q_0x16092_58 \<sigma> \<equiv> RIP \<sigma> = 0x16092 \<and> RBX \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> RCX \<sigma> = ucast (((ucast (((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x1c),4]::32 word)::32 word))::32 word) << 3)) \<and> RDX \<sigma> = ((ucast (((sextend (ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x1c),4]::32 word))) 32 64::64 word)::64 word))::64 word) << 3) \<and> RDI \<sigma> = RBP \<sigma> \<and> RSI \<sigma> = R14 \<sigma> \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x78) \<and> R13 \<sigma> = qemu_malloc_0x15ed7_retval \<and> R12 \<sigma> = RDI\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> regs \<sigma> ymm0w1 = 0x0 \<and> regs \<sigma> ymm0w0 = 0x0 \<and> regs \<sigma> ymm1w1 = ymm1w1\<^sub>0 \<and> regs \<sigma> ymm1w0 = ymm1w0\<^sub>0 \<and> regs \<sigma> ymm2w1 = ymm2w1\<^sub>0 \<and> regs \<sigma> ymm2w0 = ymm2w0\<^sub>0 \<and> regs \<sigma> ymm3w1 = ymm3w1\<^sub>0 \<and> regs \<sigma> ymm3w0 = ymm3w0\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word) = ucast ((\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x180),8]::64 word) = (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x180),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x188),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x188),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x190),8]::64 word) = (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x190),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x1c),4]::32 word) = ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x1c),4]::32 word)) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x38),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x38),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x48),8]::64 word) = (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x190),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x188),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),8]::64 word) = (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x180),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),4]::32 word) = ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x1c),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x80),8]::64 word) = 0x15f1c \<and> (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word),8]::64 word) = (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word),8]::64 word)\<close>
declare Q_0x16092_58_def[Qs]

schematic_goal qcow_snapshot_create_0_2_0x15f29_0x1608f_58[blocks]:
  assumes \<open>(P_0x15f29_true_58 && P_0x15f29_true_58_regions && !ZF) \<sigma>\<close>
  shows \<open>exec_block 2 0x1608f 58 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x16092_58 ?\<sigma> \<and> block_usage P_0x15f29_true_58_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x15f29_true_58_def P_0x15f29_true_58_regions_def post: Q_0x16092_58_def regionset: P_0x15f29_true_58_regions_set_def)

definition P_0x16092_59 :: state_pred where
  \<open>P_0x16092_59 \<sigma> \<equiv> RIP \<sigma> = 0x16092 \<and> RBX \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> RCX \<sigma> = ucast (((ucast (((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x1c),4]::32 word)::32 word))::32 word) << 3)) \<and> RDX \<sigma> = ((ucast (((sextend (ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x1c),4]::32 word))) 32 64::64 word)::64 word))::64 word) << 3) \<and> RDI \<sigma> = RBP \<sigma> \<and> RSI \<sigma> = R14 \<sigma> \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x78) \<and> R13 \<sigma> = qemu_malloc_0x15ed7_retval \<and> R12 \<sigma> = RDI\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> regs \<sigma> ymm0w1 = 0x0 \<and> regs \<sigma> ymm0w0 = 0x0 \<and> regs \<sigma> ymm1w1 = ymm1w1\<^sub>0 \<and> regs \<sigma> ymm1w0 = ymm1w0\<^sub>0 \<and> regs \<sigma> ymm2w1 = ymm2w1\<^sub>0 \<and> regs \<sigma> ymm2w0 = ymm2w0\<^sub>0 \<and> regs \<sigma> ymm3w1 = ymm3w1\<^sub>0 \<and> regs \<sigma> ymm3w0 = ymm3w0\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word) = ucast ((\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x180),8]::64 word) = (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x180),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x188),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x188),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x190),8]::64 word) = (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x190),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x1c),4]::32 word) = ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x1c),4]::32 word)) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x38),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x38),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x48),8]::64 word) = (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x190),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x188),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),8]::64 word) = (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x180),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),4]::32 word) = ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x1c),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x80),8]::64 word) = 0x15f1c \<and> (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word),8]::64 word) = (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word),8]::64 word)\<close>
declare P_0x16092_59_def[Ps]

definition P_0x16092_59_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x16092_59_regions_set \<sigma> \<equiv> {
    (0, RSI\<^sub>0, Suc 0),
    (1, RSP\<^sub>0, 8),
    (2, ((FS\<^sub>0::64 word) + 0x28), 8),
    (3, ((RDI\<^sub>0::64 word) + 0x40), 8),
    (4, ((RSI\<^sub>0::64 word) + 0x180), 8),
    (5, ((RSI\<^sub>0::64 word) + 0x188), 4),
    (6, ((RSI\<^sub>0::64 word) + 0x190), 8),
    (7, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x1c), 4),
    (8, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x38), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (11, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (12, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (13, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (14, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (15, ((RSP\<^sub>0::64 word) - 0x40), 8),
    (16, ((RSP\<^sub>0::64 word) - 0x48), 8),
    (17, ((RSP\<^sub>0::64 word) - 0x50), 4),
    (18, ((RSP\<^sub>0::64 word) - 0x58), 8),
    (19, ((RSP\<^sub>0::64 word) - 0x70), 4),
    (20, ((RSP\<^sub>0::64 word) - 0x80), 8),
    (21, (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word), 8)
  }\<close>

definition P_0x16092_59_regions :: state_pred where
  \<open>P_0x16092_59_regions \<sigma> \<equiv> \<exists>regions. P_0x16092_59_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_qemu_free_addr_0x16092_59 :: state_pred where
  \<open>Q_qemu_free_addr_0x16092_59 \<sigma> \<equiv> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x80) \<and> RIP \<sigma> = qemu_free_addr \<and> RBX \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> RCX \<sigma> = ucast (((ucast (((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x1c),4]::32 word)::32 word))::32 word) << 3)) \<and> RDX \<sigma> = ((ucast (((sextend (ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x1c),4]::32 word))) 32 64::64 word)::64 word))::64 word) << 3) \<and> RDI \<sigma> = RBP \<sigma> \<and> RSI \<sigma> = R14 \<sigma> \<and> R13 \<sigma> = qemu_malloc_0x15ed7_retval \<and> R12 \<sigma> = RDI\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> regs \<sigma> ymm0w1 = 0x0 \<and> regs \<sigma> ymm0w0 = 0x0 \<and> regs \<sigma> ymm1w1 = ymm1w1\<^sub>0 \<and> regs \<sigma> ymm1w0 = ymm1w0\<^sub>0 \<and> regs \<sigma> ymm2w1 = ymm2w1\<^sub>0 \<and> regs \<sigma> ymm2w0 = ymm2w0\<^sub>0 \<and> regs \<sigma> ymm3w1 = ymm3w1\<^sub>0 \<and> regs \<sigma> ymm3w0 = ymm3w0\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word) = ucast ((\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x180),8]::64 word) = (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x180),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x188),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x188),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x190),8]::64 word) = (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x190),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x1c),4]::32 word) = ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x1c),4]::32 word)) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x38),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x38),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x48),8]::64 word) = (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x190),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x188),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),8]::64 word) = (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x180),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),4]::32 word) = ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x1c),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x80),8]::64 word) = 0x16097 \<and> (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word),8]::64 word) = (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word),8]::64 word)\<close>
declare Q_qemu_free_addr_0x16092_59_def[Qs]

schematic_goal qcow_snapshot_create_0_1_0x16092_0x16092_59[blocks]:
  assumes \<open>(P_0x16092_59 && P_0x16092_59_regions) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x16092 59 \<sigma> \<triangleq> ?\<sigma> \<and> Q_qemu_free_addr_0x16092_59 ?\<sigma> \<and> block_usage P_0x16092_59_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x16092_59_def P_0x16092_59_regions_def post: Q_qemu_free_addr_0x16092_59_def regionset: P_0x16092_59_regions_set_def)

definition P_0x16097_60 :: state_pred where
  \<open>P_0x16097_60 \<sigma> \<equiv> RIP \<sigma> = 0x16097 \<and> RBX \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> RCX \<sigma> = ucast (((ucast (((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x1c),4]::32 word)::32 word))::32 word) << 3)) \<and> RDX \<sigma> = ((ucast (((sextend (ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x1c),4]::32 word))) 32 64::64 word)::64 word))::64 word) << 3) \<and> RDI \<sigma> = RBP \<sigma> \<and> RSI \<sigma> = R14 \<sigma> \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x78) \<and> R13 \<sigma> = qemu_malloc_0x15ed7_retval \<and> R12 \<sigma> = RDI\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> regs \<sigma> ymm0w1 = 0x0 \<and> regs \<sigma> ymm0w0 = 0x0 \<and> regs \<sigma> ymm1w1 = ymm1w1\<^sub>0 \<and> regs \<sigma> ymm1w0 = ymm1w0\<^sub>0 \<and> regs \<sigma> ymm2w1 = ymm2w1\<^sub>0 \<and> regs \<sigma> ymm2w0 = ymm2w0\<^sub>0 \<and> regs \<sigma> ymm3w1 = ymm3w1\<^sub>0 \<and> regs \<sigma> ymm3w0 = ymm3w0\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word) = ucast ((\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x180),8]::64 word) = (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x180),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x188),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x188),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x190),8]::64 word) = (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x190),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x1c),4]::32 word) = ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x1c),4]::32 word)) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x38),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x38),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x48),8]::64 word) = (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x190),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x188),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),8]::64 word) = (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x180),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),4]::32 word) = ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x1c),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x80),8]::64 word) = 0x16097 \<and> (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word),8]::64 word) = (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word),8]::64 word)\<close>
declare P_0x16097_60_def[Ps]

definition P_0x16097_60_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x16097_60_regions_set \<sigma> \<equiv> {
    (0, RSI\<^sub>0, Suc 0),
    (1, RSP\<^sub>0, 8),
    (2, ((FS\<^sub>0::64 word) + 0x28), 8),
    (3, ((RDI\<^sub>0::64 word) + 0x40), 8),
    (4, ((RSI\<^sub>0::64 word) + 0x180), 8),
    (5, ((RSI\<^sub>0::64 word) + 0x188), 4),
    (6, ((RSI\<^sub>0::64 word) + 0x190), 8),
    (7, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x1c), 4),
    (8, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x38), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (11, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (12, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (13, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (14, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (15, ((RSP\<^sub>0::64 word) - 0x40), 8),
    (16, ((RSP\<^sub>0::64 word) - 0x48), 8),
    (17, ((RSP\<^sub>0::64 word) - 0x50), 4),
    (18, ((RSP\<^sub>0::64 word) - 0x58), 8),
    (19, ((RSP\<^sub>0::64 word) - 0x70), 4),
    (20, ((RSP\<^sub>0::64 word) - 0x80), 8),
    (21, (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word), 8)
  }\<close>

definition P_0x16097_60_regions :: state_pred where
  \<open>P_0x16097_60_regions \<sigma> \<equiv> \<exists>regions. P_0x16097_60_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x1609a_60 :: state_pred where
  \<open>Q_0x1609a_60 \<sigma> \<equiv> RIP \<sigma> = 0x1609a \<and> RBX \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> RCX \<sigma> = ucast (((ucast (((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x1c),4]::32 word)::32 word))::32 word) << 3)) \<and> RDX \<sigma> = ((ucast (((sextend (ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x1c),4]::32 word))) 32 64::64 word)::64 word))::64 word) << 3) \<and> RDI \<sigma> = qemu_malloc_0x15ed7_retval \<and> RSI \<sigma> = R14 \<sigma> \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x78) \<and> R13 \<sigma> = qemu_malloc_0x15ed7_retval \<and> R12 \<sigma> = RDI\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> regs \<sigma> ymm0w1 = 0x0 \<and> regs \<sigma> ymm0w0 = 0x0 \<and> regs \<sigma> ymm1w1 = ymm1w1\<^sub>0 \<and> regs \<sigma> ymm1w0 = ymm1w0\<^sub>0 \<and> regs \<sigma> ymm2w1 = ymm2w1\<^sub>0 \<and> regs \<sigma> ymm2w0 = ymm2w0\<^sub>0 \<and> regs \<sigma> ymm3w1 = ymm3w1\<^sub>0 \<and> regs \<sigma> ymm3w0 = ymm3w0\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word) = ucast ((\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x180),8]::64 word) = (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x180),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x188),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x188),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x190),8]::64 word) = (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x190),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x1c),4]::32 word) = ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x1c),4]::32 word)) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x38),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x38),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x48),8]::64 word) = (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x190),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x188),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),8]::64 word) = (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x180),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),4]::32 word) = ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x1c),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x80),8]::64 word) = 0x16097 \<and> (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word),8]::64 word) = (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word),8]::64 word)\<close>
declare Q_0x1609a_60_def[Qs]

schematic_goal qcow_snapshot_create_0_1_0x16097_0x16097_60[blocks]:
  assumes \<open>(P_0x16097_60 && P_0x16097_60_regions) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x16097 60 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x1609a_60 ?\<sigma> \<and> block_usage P_0x16097_60_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x16097_60_def P_0x16097_60_regions_def post: Q_0x1609a_60_def regionset: P_0x16097_60_regions_set_def)

definition P_0x1609a_61 :: state_pred where
  \<open>P_0x1609a_61 \<sigma> \<equiv> RIP \<sigma> = 0x1609a \<and> RBX \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> RCX \<sigma> = ucast (((ucast (((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x1c),4]::32 word)::32 word))::32 word) << 3)) \<and> RDX \<sigma> = ((ucast (((sextend (ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x1c),4]::32 word))) 32 64::64 word)::64 word))::64 word) << 3) \<and> RDI \<sigma> = qemu_malloc_0x15ed7_retval \<and> RSI \<sigma> = R14 \<sigma> \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x78) \<and> R13 \<sigma> = qemu_malloc_0x15ed7_retval \<and> R12 \<sigma> = RDI\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> regs \<sigma> ymm0w1 = 0x0 \<and> regs \<sigma> ymm0w0 = 0x0 \<and> regs \<sigma> ymm1w1 = ymm1w1\<^sub>0 \<and> regs \<sigma> ymm1w0 = ymm1w0\<^sub>0 \<and> regs \<sigma> ymm2w1 = ymm2w1\<^sub>0 \<and> regs \<sigma> ymm2w0 = ymm2w0\<^sub>0 \<and> regs \<sigma> ymm3w1 = ymm3w1\<^sub>0 \<and> regs \<sigma> ymm3w0 = ymm3w0\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word) = ucast ((\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x180),8]::64 word) = (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x180),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x188),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x188),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x190),8]::64 word) = (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x190),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x1c),4]::32 word) = ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x1c),4]::32 word)) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x38),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x38),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x48),8]::64 word) = (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x190),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x188),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),8]::64 word) = (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x180),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),4]::32 word) = ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x1c),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x80),8]::64 word) = 0x16097 \<and> (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word),8]::64 word) = (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word),8]::64 word)\<close>
declare P_0x1609a_61_def[Ps]

definition P_0x1609a_61_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x1609a_61_regions_set \<sigma> \<equiv> {
    (0, RSI\<^sub>0, Suc 0),
    (1, RSP\<^sub>0, 8),
    (2, ((FS\<^sub>0::64 word) + 0x28), 8),
    (3, ((RDI\<^sub>0::64 word) + 0x40), 8),
    (4, ((RSI\<^sub>0::64 word) + 0x180), 8),
    (5, ((RSI\<^sub>0::64 word) + 0x188), 4),
    (6, ((RSI\<^sub>0::64 word) + 0x190), 8),
    (7, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x1c), 4),
    (8, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x38), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (11, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (12, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (13, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (14, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (15, ((RSP\<^sub>0::64 word) - 0x40), 8),
    (16, ((RSP\<^sub>0::64 word) - 0x48), 8),
    (17, ((RSP\<^sub>0::64 word) - 0x50), 4),
    (18, ((RSP\<^sub>0::64 word) - 0x58), 8),
    (19, ((RSP\<^sub>0::64 word) - 0x70), 4),
    (20, ((RSP\<^sub>0::64 word) - 0x80), 8),
    (21, (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word), 8)
  }\<close>

definition P_0x1609a_61_regions :: state_pred where
  \<open>P_0x1609a_61_regions \<sigma> \<equiv> \<exists>regions. P_0x1609a_61_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_qemu_free_addr_0x1609a_61 :: state_pred where
  \<open>Q_qemu_free_addr_0x1609a_61 \<sigma> \<equiv> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x80) \<and> RIP \<sigma> = qemu_free_addr \<and> RBX \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> RCX \<sigma> = ucast (((ucast (((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x1c),4]::32 word)::32 word))::32 word) << 3)) \<and> RDX \<sigma> = ((ucast (((sextend (ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x1c),4]::32 word))) 32 64::64 word)::64 word))::64 word) << 3) \<and> RDI \<sigma> = qemu_malloc_0x15ed7_retval \<and> RSI \<sigma> = R14 \<sigma> \<and> R13 \<sigma> = qemu_malloc_0x15ed7_retval \<and> R12 \<sigma> = RDI\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> regs \<sigma> ymm0w1 = 0x0 \<and> regs \<sigma> ymm0w0 = 0x0 \<and> regs \<sigma> ymm1w1 = ymm1w1\<^sub>0 \<and> regs \<sigma> ymm1w0 = ymm1w0\<^sub>0 \<and> regs \<sigma> ymm2w1 = ymm2w1\<^sub>0 \<and> regs \<sigma> ymm2w0 = ymm2w0\<^sub>0 \<and> regs \<sigma> ymm3w1 = ymm3w1\<^sub>0 \<and> regs \<sigma> ymm3w0 = ymm3w0\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word) = ucast ((\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x180),8]::64 word) = (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x180),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x188),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x188),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x190),8]::64 word) = (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x190),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x1c),4]::32 word) = ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x1c),4]::32 word)) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x38),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x38),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x48),8]::64 word) = (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x190),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x188),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),8]::64 word) = (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x180),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),4]::32 word) = ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x1c),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x80),8]::64 word) = 0x1609f \<and> (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word),8]::64 word) = (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word),8]::64 word)\<close>
declare Q_qemu_free_addr_0x1609a_61_def[Qs]

schematic_goal qcow_snapshot_create_0_1_0x1609a_0x1609a_61[blocks]:
  assumes \<open>(P_0x1609a_61 && P_0x1609a_61_regions) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x1609a 61 \<sigma> \<triangleq> ?\<sigma> \<and> Q_qemu_free_addr_0x1609a_61 ?\<sigma> \<and> block_usage P_0x1609a_61_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x1609a_61_def P_0x1609a_61_regions_def post: Q_qemu_free_addr_0x1609a_61_def regionset: P_0x1609a_61_regions_set_def)

definition P_0x1609f_62 :: state_pred where
  \<open>P_0x1609f_62 \<sigma> \<equiv> RIP \<sigma> = 0x1609f \<and> RBX \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> RCX \<sigma> = ucast (((ucast (((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x1c),4]::32 word)::32 word))::32 word) << 3)) \<and> RDX \<sigma> = ((ucast (((sextend (ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x1c),4]::32 word))) 32 64::64 word)::64 word))::64 word) << 3) \<and> RDI \<sigma> = qemu_malloc_0x15ed7_retval \<and> RSI \<sigma> = R14 \<sigma> \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x78) \<and> R13 \<sigma> = qemu_malloc_0x15ed7_retval \<and> R12 \<sigma> = RDI\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> regs \<sigma> ymm0w1 = 0x0 \<and> regs \<sigma> ymm0w0 = 0x0 \<and> regs \<sigma> ymm1w1 = ymm1w1\<^sub>0 \<and> regs \<sigma> ymm1w0 = ymm1w0\<^sub>0 \<and> regs \<sigma> ymm2w1 = ymm2w1\<^sub>0 \<and> regs \<sigma> ymm2w0 = ymm2w0\<^sub>0 \<and> regs \<sigma> ymm3w1 = ymm3w1\<^sub>0 \<and> regs \<sigma> ymm3w0 = ymm3w0\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word) = ucast ((\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x180),8]::64 word) = (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x180),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x188),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x188),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x190),8]::64 word) = (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x190),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x1c),4]::32 word) = ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x1c),4]::32 word)) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x38),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x38),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x48),8]::64 word) = (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x190),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x188),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),8]::64 word) = (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x180),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),4]::32 word) = ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x1c),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x80),8]::64 word) = 0x1609f \<and> (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word),8]::64 word) = (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word),8]::64 word)\<close>
declare P_0x1609f_62_def[Ps]

definition P_0x1609f_62_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x1609f_62_regions_set \<sigma> \<equiv> {
    (0, RSI\<^sub>0, Suc 0),
    (1, RSP\<^sub>0, 8),
    (2, ((FS\<^sub>0::64 word) + 0x28), 8),
    (3, ((RDI\<^sub>0::64 word) + 0x40), 8),
    (4, ((RSI\<^sub>0::64 word) + 0x180), 8),
    (5, ((RSI\<^sub>0::64 word) + 0x188), 4),
    (6, ((RSI\<^sub>0::64 word) + 0x190), 8),
    (7, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x1c), 4),
    (8, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x38), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (11, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (12, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (13, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (14, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (15, ((RSP\<^sub>0::64 word) - 0x40), 8),
    (16, ((RSP\<^sub>0::64 word) - 0x48), 8),
    (17, ((RSP\<^sub>0::64 word) - 0x50), 4),
    (18, ((RSP\<^sub>0::64 word) - 0x58), 8),
    (19, ((RSP\<^sub>0::64 word) - 0x70), 4),
    (20, ((RSP\<^sub>0::64 word) - 0x80), 8),
    (21, (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word), 8)
  }\<close>

definition P_0x1609f_62_regions :: state_pred where
  \<open>P_0x1609f_62_regions \<sigma> \<equiv> \<exists>regions. P_0x1609f_62_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x15fed_62 :: state_pred where
  \<open>Q_0x15fed_62 \<sigma> \<equiv> RIP \<sigma> = 0x15fed \<and> RBX \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x78) \<and> R12 \<sigma> = RDI\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> regs \<sigma> ymm0w1 = 0x0 \<and> regs \<sigma> ymm0w0 = 0x0 \<and> (\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word) = ucast ((\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word)\<close>
declare Q_0x15fed_62_def[Qs]

schematic_goal qcow_snapshot_create_0_2_0x1609f_0x160a4_62[blocks]:
  assumes \<open>(P_0x1609f_62 && P_0x1609f_62_regions) \<sigma>\<close>
  shows \<open>exec_block 2 0x160a4 62 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x15fed_62 ?\<sigma> \<and> block_usage P_0x1609f_62_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x1609f_62_def P_0x1609f_62_regions_def post: Q_0x15fed_62_def regionset: P_0x1609f_62_regions_set_def)

definition P_0x15f29_false_63 :: state_pred where
  \<open>P_0x15f29_false_63 \<sigma> \<equiv> RIP \<sigma> = 0x15f29 \<and> RBX \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> RCX \<sigma> = ucast (((ucast (((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x1c),4]::32 word)::32 word))::32 word) << 3)) \<and> RDX \<sigma> = ((ucast (((sextend (ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x1c),4]::32 word))) 32 64::64 word)::64 word))::64 word) << 3) \<and> RDI \<sigma> = (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word),8]::64 word) \<and> RSI \<sigma> = R14 \<sigma> \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x78) \<and> R13 \<sigma> = qemu_malloc_0x15ed7_retval \<and> R12 \<sigma> = RDI\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> regs \<sigma> ymm0w1 = 0x0 \<and> regs \<sigma> ymm0w0 = 0x0 \<and> regs \<sigma> ymm1w1 = ymm1w1\<^sub>0 \<and> regs \<sigma> ymm1w0 = ymm1w0\<^sub>0 \<and> regs \<sigma> ymm2w1 = ymm2w1\<^sub>0 \<and> regs \<sigma> ymm2w0 = ymm2w0\<^sub>0 \<and> regs \<sigma> ymm3w1 = ymm3w1\<^sub>0 \<and> regs \<sigma> ymm3w0 = ymm3w0\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word) = ucast ((\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x180),8]::64 word) = (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x180),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x188),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x188),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x190),8]::64 word) = (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x190),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x1c),4]::32 word) = ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x1c),4]::32 word)) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x38),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x38),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x48),8]::64 word) = (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x190),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x188),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),8]::64 word) = (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x180),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),4]::32 word) = ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x1c),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x80),8]::64 word) = 0x15f1c \<and> (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word),8]::64 word) = (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word),8]::64 word)\<close>
declare P_0x15f29_false_63_def[Ps]

definition P_0x15f29_false_63_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x15f29_false_63_regions_set \<sigma> \<equiv> {
    (0, RSI\<^sub>0, Suc 0),
    (1, RSP\<^sub>0, 8),
    (2, ((FS\<^sub>0::64 word) + 0x28), 8),
    (3, ((RDI\<^sub>0::64 word) + 0x40), 8),
    (4, ((RSI\<^sub>0::64 word) + 0x180), 8),
    (5, ((RSI\<^sub>0::64 word) + 0x188), 4),
    (6, ((RSI\<^sub>0::64 word) + 0x190), 8),
    (7, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x1c), 4),
    (8, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x38), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (11, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (12, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (13, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (14, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (15, ((RSP\<^sub>0::64 word) - 0x40), 8),
    (16, ((RSP\<^sub>0::64 word) - 0x48), 8),
    (17, ((RSP\<^sub>0::64 word) - 0x50), 4),
    (18, ((RSP\<^sub>0::64 word) - 0x58), 8),
    (19, ((RSP\<^sub>0::64 word) - 0x70), 4),
    (20, ((RSP\<^sub>0::64 word) - 0x80), 8),
    (21, (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word), 8)
  }\<close>

definition P_0x15f29_false_63_regions :: state_pred where
  \<open>P_0x15f29_false_63_regions \<sigma> \<equiv> \<exists>regions. P_0x15f29_false_63_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x15f32_63 :: state_pred where
  \<open>Q_0x15f32_63 \<sigma> \<equiv> RIP \<sigma> = 0x15f32 \<and> RBX \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> RCX \<sigma> = ucast (((ucast (((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x1c),4]::32 word)::32 word))::32 word) << 3)) \<and> RDX \<sigma> = ((ucast (((sextend (ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x1c),4]::32 word))) 32 64::64 word)::64 word))::64 word) << 3) \<and> RDI \<sigma> = qemu_malloc_0x15ed7_retval \<and> RSI \<sigma> = R14 \<sigma> \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x78) \<and> R13 \<sigma> = qemu_malloc_0x15ed7_retval \<and> R12 \<sigma> = RDI\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> regs \<sigma> ymm0w1 = 0x0 \<and> regs \<sigma> ymm0w0 = 0x0 \<and> regs \<sigma> ymm1w1 = ymm1w1\<^sub>0 \<and> regs \<sigma> ymm1w0 = ymm1w0\<^sub>0 \<and> regs \<sigma> ymm2w1 = ymm2w1\<^sub>0 \<and> regs \<sigma> ymm2w0 = ymm2w0\<^sub>0 \<and> regs \<sigma> ymm3w1 = ymm3w1\<^sub>0 \<and> regs \<sigma> ymm3w0 = ymm3w0\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word) = ucast ((\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x180),8]::64 word) = (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x180),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x188),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x188),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x190),8]::64 word) = (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x190),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x1c),4]::32 word) = ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x1c),4]::32 word)) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x38),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x38),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x48),8]::64 word) = (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x190),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x188),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),8]::64 word) = (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x180),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),4]::32 word) = ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x1c),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x80),8]::64 word) = 0x15f1c \<and> (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word),8]::64 word) = (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word),8]::64 word)\<close>
declare Q_0x15f32_63_def[Qs]

schematic_goal qcow_snapshot_create_0_2_0x15f29_0x15f2f_63[blocks]:
  assumes \<open>(P_0x15f29_false_63 && P_0x15f29_false_63_regions && ! !ZF) \<sigma>\<close>
  shows \<open>exec_block 2 0x15f2f 63 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x15f32_63 ?\<sigma> \<and> block_usage P_0x15f29_false_63_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x15f29_false_63_def P_0x15f29_false_63_regions_def post: Q_0x15f32_63_def regionset: P_0x15f29_false_63_regions_set_def)

definition P_0x15f32_64 :: state_pred where
  \<open>P_0x15f32_64 \<sigma> \<equiv> RIP \<sigma> = 0x15f32 \<and> RBX \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> RCX \<sigma> = ucast (((ucast (((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x1c),4]::32 word)::32 word))::32 word) << 3)) \<and> RDX \<sigma> = ((ucast (((sextend (ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x1c),4]::32 word))) 32 64::64 word)::64 word))::64 word) << 3) \<and> RDI \<sigma> = qemu_malloc_0x15ed7_retval \<and> RSI \<sigma> = R14 \<sigma> \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x78) \<and> R13 \<sigma> = qemu_malloc_0x15ed7_retval \<and> R12 \<sigma> = RDI\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> regs \<sigma> ymm0w1 = 0x0 \<and> regs \<sigma> ymm0w0 = 0x0 \<and> regs \<sigma> ymm1w1 = ymm1w1\<^sub>0 \<and> regs \<sigma> ymm1w0 = ymm1w0\<^sub>0 \<and> regs \<sigma> ymm2w1 = ymm2w1\<^sub>0 \<and> regs \<sigma> ymm2w0 = ymm2w0\<^sub>0 \<and> regs \<sigma> ymm3w1 = ymm3w1\<^sub>0 \<and> regs \<sigma> ymm3w0 = ymm3w0\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word) = ucast ((\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x180),8]::64 word) = (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x180),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x188),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x188),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x190),8]::64 word) = (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x190),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x1c),4]::32 word) = ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x1c),4]::32 word)) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x38),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x38),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x48),8]::64 word) = (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x190),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x188),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),8]::64 word) = (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x180),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),4]::32 word) = ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x1c),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x80),8]::64 word) = 0x15f1c \<and> (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word),8]::64 word) = (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word),8]::64 word)\<close>
declare P_0x15f32_64_def[Ps]

definition P_0x15f32_64_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x15f32_64_regions_set \<sigma> \<equiv> {
    (0, RSI\<^sub>0, Suc 0),
    (1, RSP\<^sub>0, 8),
    (2, ((FS\<^sub>0::64 word) + 0x28), 8),
    (3, ((RDI\<^sub>0::64 word) + 0x40), 8),
    (4, ((RSI\<^sub>0::64 word) + 0x180), 8),
    (5, ((RSI\<^sub>0::64 word) + 0x188), 4),
    (6, ((RSI\<^sub>0::64 word) + 0x190), 8),
    (7, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x1c), 4),
    (8, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x38), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (11, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (12, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (13, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (14, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (15, ((RSP\<^sub>0::64 word) - 0x40), 8),
    (16, ((RSP\<^sub>0::64 word) - 0x48), 8),
    (17, ((RSP\<^sub>0::64 word) - 0x50), 4),
    (18, ((RSP\<^sub>0::64 word) - 0x58), 8),
    (19, ((RSP\<^sub>0::64 word) - 0x70), 4),
    (20, ((RSP\<^sub>0::64 word) - 0x80), 8),
    (21, (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word), 8)
  }\<close>

definition P_0x15f32_64_regions :: state_pred where
  \<open>P_0x15f32_64_regions \<sigma> \<equiv> \<exists>regions. P_0x15f32_64_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_qemu_free_addr_0x15f32_64 :: state_pred where
  \<open>Q_qemu_free_addr_0x15f32_64 \<sigma> \<equiv> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x80) \<and> RIP \<sigma> = qemu_free_addr \<and> RBX \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> RCX \<sigma> = ucast (((ucast (((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x1c),4]::32 word)::32 word))::32 word) << 3)) \<and> RDX \<sigma> = ((ucast (((sextend (ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x1c),4]::32 word))) 32 64::64 word)::64 word))::64 word) << 3) \<and> RDI \<sigma> = qemu_malloc_0x15ed7_retval \<and> RSI \<sigma> = R14 \<sigma> \<and> R13 \<sigma> = qemu_malloc_0x15ed7_retval \<and> R12 \<sigma> = RDI\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> regs \<sigma> ymm0w1 = 0x0 \<and> regs \<sigma> ymm0w0 = 0x0 \<and> regs \<sigma> ymm1w1 = ymm1w1\<^sub>0 \<and> regs \<sigma> ymm1w0 = ymm1w0\<^sub>0 \<and> regs \<sigma> ymm2w1 = ymm2w1\<^sub>0 \<and> regs \<sigma> ymm2w0 = ymm2w0\<^sub>0 \<and> regs \<sigma> ymm3w1 = ymm3w1\<^sub>0 \<and> regs \<sigma> ymm3w0 = ymm3w0\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word) = ucast ((\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x180),8]::64 word) = (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x180),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x188),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x188),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x190),8]::64 word) = (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x190),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x1c),4]::32 word) = ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x1c),4]::32 word)) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x38),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x38),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x48),8]::64 word) = (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x190),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x188),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),8]::64 word) = (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x180),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),4]::32 word) = ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x1c),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x80),8]::64 word) = 0x15f37 \<and> (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word),8]::64 word) = (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word),8]::64 word)\<close>
declare Q_qemu_free_addr_0x15f32_64_def[Qs]

schematic_goal qcow_snapshot_create_0_1_0x15f32_0x15f32_64[blocks]:
  assumes \<open>(P_0x15f32_64 && P_0x15f32_64_regions) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x15f32 64 \<sigma> \<triangleq> ?\<sigma> \<and> Q_qemu_free_addr_0x15f32_64 ?\<sigma> \<and> block_usage P_0x15f32_64_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x15f32_64_def P_0x15f32_64_regions_def post: Q_qemu_free_addr_0x15f32_64_def regionset: P_0x15f32_64_regions_set_def)

definition P_0x15f37_65 :: state_pred where
  \<open>P_0x15f37_65 \<sigma> \<equiv> RIP \<sigma> = 0x15f37 \<and> RBX \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> RCX \<sigma> = ucast (((ucast (((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x1c),4]::32 word)::32 word))::32 word) << 3)) \<and> RDX \<sigma> = ((ucast (((sextend (ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x1c),4]::32 word))) 32 64::64 word)::64 word))::64 word) << 3) \<and> RDI \<sigma> = qemu_malloc_0x15ed7_retval \<and> RSI \<sigma> = R14 \<sigma> \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x78) \<and> R13 \<sigma> = qemu_malloc_0x15ed7_retval \<and> R12 \<sigma> = RDI\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> regs \<sigma> ymm0w1 = 0x0 \<and> regs \<sigma> ymm0w0 = 0x0 \<and> regs \<sigma> ymm1w1 = ymm1w1\<^sub>0 \<and> regs \<sigma> ymm1w0 = ymm1w0\<^sub>0 \<and> regs \<sigma> ymm2w1 = ymm2w1\<^sub>0 \<and> regs \<sigma> ymm2w0 = ymm2w0\<^sub>0 \<and> regs \<sigma> ymm3w1 = ymm3w1\<^sub>0 \<and> regs \<sigma> ymm3w0 = ymm3w0\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word) = ucast ((\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x180),8]::64 word) = (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x180),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x188),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x188),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x190),8]::64 word) = (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x190),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x1c),4]::32 word) = ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x1c),4]::32 word)) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x38),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x38),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x48),8]::64 word) = (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x190),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x188),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),8]::64 word) = (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x180),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),4]::32 word) = ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x1c),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x80),8]::64 word) = 0x15f37 \<and> (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word),8]::64 word) = (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word),8]::64 word)\<close>
declare P_0x15f37_65_def[Ps]

definition P_0x15f37_65_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x15f37_65_regions_set \<sigma> \<equiv> {
    (0, RSI\<^sub>0, Suc 0),
    (1, RSP\<^sub>0, 8),
    (2, ((FS\<^sub>0::64 word) + 0x28), 8),
    (3, ((RDI\<^sub>0::64 word) + 0x40), 8),
    (4, ((RSI\<^sub>0::64 word) + 0x180), 8),
    (5, ((RSI\<^sub>0::64 word) + 0x188), 4),
    (6, ((RSI\<^sub>0::64 word) + 0x190), 8),
    (7, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x1c), 4),
    (8, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x38), 8),
    (9, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x35c), 4),
    (10, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (11, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (12, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (13, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (14, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (15, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (16, ((RSP\<^sub>0::64 word) - 0x40), 8),
    (17, ((RSP\<^sub>0::64 word) - 0x48), 8),
    (18, ((RSP\<^sub>0::64 word) - 0x50), 4),
    (19, ((RSP\<^sub>0::64 word) - 0x58), 8),
    (20, ((RSP\<^sub>0::64 word) - 0x70), 4),
    (21, ((RSP\<^sub>0::64 word) - 0x80), 8),
    (22, (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word), 8)
  }\<close>

definition P_0x15f37_65_regions :: state_pred where
  \<open>P_0x15f37_65_regions \<sigma> \<equiv> \<exists>regions. P_0x15f37_65_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x15f51_65 :: state_pred where
  \<open>Q_0x15f51_65 \<sigma> \<equiv> RIP \<sigma> = 0x15f51 \<and> RAX \<sigma> = (sextend (ucast ((((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x35c),4]::32 word)::32 word) + 0x1))) 32 64::64 word) \<and> RBX \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> RCX \<sigma> = ucast (((ucast (((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x1c),4]::32 word)::32 word))::32 word) << 3)) \<and> RDX \<sigma> = ((ucast (((sextend (ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x1c),4]::32 word))) 32 64::64 word)::64 word))::64 word) << 3) \<and> RDI \<sigma> = ((ucast (((((\<langle>63,0\<rangle>(((\<langle>63,0\<rangle>(sextend (ucast ((((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x35c),4]::32 word)::32 word) + 0x1))) 32 64::64 word)::64 word)::64 word) * 0x8)::64 word)::64 word) - (sextend (ucast ((((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x35c),4]::32 word)::32 word) + 0x1))) 32 64::64 word))::64 word))::64 word) << 3) \<and> RSI \<sigma> = R14 \<sigma> \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x78) \<and> R13 \<sigma> = qemu_malloc_0x15ed7_retval \<and> R12 \<sigma> = RDI\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> regs \<sigma> ymm0w1 = 0x0 \<and> regs \<sigma> ymm0w0 = 0x0 \<and> regs \<sigma> ymm1w1 = ymm1w1\<^sub>0 \<and> regs \<sigma> ymm1w0 = ymm1w0\<^sub>0 \<and> regs \<sigma> ymm2w1 = ymm2w1\<^sub>0 \<and> regs \<sigma> ymm2w0 = ymm2w0\<^sub>0 \<and> regs \<sigma> ymm3w1 = ymm3w1\<^sub>0 \<and> regs \<sigma> ymm3w0 = ymm3w0\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word) = ucast ((\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x180),8]::64 word) = (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x180),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x188),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x188),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x190),8]::64 word) = (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x190),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x1c),4]::32 word) = ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x1c),4]::32 word)) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x38),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x38),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x35c),4]::32 word) = ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x35c),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x48),8]::64 word) = (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x190),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x188),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),8]::64 word) = (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x180),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),4]::32 word) = ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x1c),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x80),8]::64 word) = 0x15f37 \<and> (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word),8]::64 word) = (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word),8]::64 word)\<close>
declare Q_0x15f51_65_def[Qs]

schematic_goal qcow_snapshot_create_0_6_0x15f37_0x15f4d_65[blocks]:
  assumes \<open>(P_0x15f37_65 && P_0x15f37_65_regions) \<sigma>\<close>
  shows \<open>exec_block 6 0x15f4d 65 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x15f51_65 ?\<sigma> \<and> block_usage P_0x15f37_65_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x15f37_65_def P_0x15f37_65_regions_def post: Q_0x15f51_65_def regionset: P_0x15f37_65_regions_set_def)

definition P_0x15f51_66 :: state_pred where
  \<open>P_0x15f51_66 \<sigma> \<equiv> RIP \<sigma> = 0x15f51 \<and> RAX \<sigma> = (sextend (ucast ((((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x35c),4]::32 word)::32 word) + 0x1))) 32 64::64 word) \<and> RBX \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> RCX \<sigma> = ucast (((ucast (((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x1c),4]::32 word)::32 word))::32 word) << 3)) \<and> RDX \<sigma> = ((ucast (((sextend (ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x1c),4]::32 word))) 32 64::64 word)::64 word))::64 word) << 3) \<and> RDI \<sigma> = ((ucast (((((\<langle>63,0\<rangle>(((\<langle>63,0\<rangle>(sextend (ucast ((((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x35c),4]::32 word)::32 word) + 0x1))) 32 64::64 word)::64 word)::64 word) * 0x8)::64 word)::64 word) - (sextend (ucast ((((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x35c),4]::32 word)::32 word) + 0x1))) 32 64::64 word))::64 word))::64 word) << 3) \<and> RSI \<sigma> = R14 \<sigma> \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x78) \<and> R13 \<sigma> = qemu_malloc_0x15ed7_retval \<and> R12 \<sigma> = RDI\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> regs \<sigma> ymm0w1 = 0x0 \<and> regs \<sigma> ymm0w0 = 0x0 \<and> regs \<sigma> ymm1w1 = ymm1w1\<^sub>0 \<and> regs \<sigma> ymm1w0 = ymm1w0\<^sub>0 \<and> regs \<sigma> ymm2w1 = ymm2w1\<^sub>0 \<and> regs \<sigma> ymm2w0 = ymm2w0\<^sub>0 \<and> regs \<sigma> ymm3w1 = ymm3w1\<^sub>0 \<and> regs \<sigma> ymm3w0 = ymm3w0\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word) = ucast ((\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x180),8]::64 word) = (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x180),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x188),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x188),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x190),8]::64 word) = (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x190),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x1c),4]::32 word) = ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x1c),4]::32 word)) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x38),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x38),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x35c),4]::32 word) = ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x35c),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x48),8]::64 word) = (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x190),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x188),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),8]::64 word) = (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x180),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),4]::32 word) = ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x1c),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x80),8]::64 word) = 0x15f37 \<and> (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word),8]::64 word) = (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word),8]::64 word)\<close>
declare P_0x15f51_66_def[Ps]

definition P_0x15f51_66_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x15f51_66_regions_set \<sigma> \<equiv> {
    (0, RSI\<^sub>0, Suc 0),
    (1, RSP\<^sub>0, 8),
    (2, ((FS\<^sub>0::64 word) + 0x28), 8),
    (3, ((RDI\<^sub>0::64 word) + 0x40), 8),
    (4, ((RSI\<^sub>0::64 word) + 0x180), 8),
    (5, ((RSI\<^sub>0::64 word) + 0x188), 4),
    (6, ((RSI\<^sub>0::64 word) + 0x190), 8),
    (7, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x1c), 4),
    (8, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x38), 8),
    (9, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x35c), 4),
    (10, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (11, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (12, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (13, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (14, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (15, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (16, ((RSP\<^sub>0::64 word) - 0x40), 8),
    (17, ((RSP\<^sub>0::64 word) - 0x48), 8),
    (18, ((RSP\<^sub>0::64 word) - 0x50), 4),
    (19, ((RSP\<^sub>0::64 word) - 0x58), 8),
    (20, ((RSP\<^sub>0::64 word) - 0x70), 4),
    (21, ((RSP\<^sub>0::64 word) - 0x80), 8),
    (22, (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word), 8)
  }\<close>

definition P_0x15f51_66_regions :: state_pred where
  \<open>P_0x15f51_66_regions \<sigma> \<equiv> \<exists>regions. P_0x15f51_66_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_qemu_malloc_addr_0x15f51_66 :: state_pred where
  \<open>Q_qemu_malloc_addr_0x15f51_66 \<sigma> \<equiv> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x80) \<and> RIP \<sigma> = qemu_malloc_addr \<and> RAX \<sigma> = (sextend (ucast ((((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x35c),4]::32 word)::32 word) + 0x1))) 32 64::64 word) \<and> RBX \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> RCX \<sigma> = ucast (((ucast (((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x1c),4]::32 word)::32 word))::32 word) << 3)) \<and> RDX \<sigma> = ((ucast (((sextend (ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x1c),4]::32 word))) 32 64::64 word)::64 word))::64 word) << 3) \<and> RDI \<sigma> = ((ucast (((((\<langle>63,0\<rangle>(((\<langle>63,0\<rangle>(sextend (ucast ((((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x35c),4]::32 word)::32 word) + 0x1))) 32 64::64 word)::64 word)::64 word) * 0x8)::64 word)::64 word) - (sextend (ucast ((((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x35c),4]::32 word)::32 word) + 0x1))) 32 64::64 word))::64 word))::64 word) << 3) \<and> RSI \<sigma> = R14 \<sigma> \<and> R13 \<sigma> = qemu_malloc_0x15ed7_retval \<and> R12 \<sigma> = RDI\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> regs \<sigma> ymm0w1 = 0x0 \<and> regs \<sigma> ymm0w0 = 0x0 \<and> regs \<sigma> ymm1w1 = ymm1w1\<^sub>0 \<and> regs \<sigma> ymm1w0 = ymm1w0\<^sub>0 \<and> regs \<sigma> ymm2w1 = ymm2w1\<^sub>0 \<and> regs \<sigma> ymm2w0 = ymm2w0\<^sub>0 \<and> regs \<sigma> ymm3w1 = ymm3w1\<^sub>0 \<and> regs \<sigma> ymm3w0 = ymm3w0\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word) = ucast ((\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x180),8]::64 word) = (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x180),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x188),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x188),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x190),8]::64 word) = (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x190),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x1c),4]::32 word) = ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x1c),4]::32 word)) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x38),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x38),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x35c),4]::32 word) = ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x35c),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x48),8]::64 word) = (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x190),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x188),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),8]::64 word) = (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x180),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),4]::32 word) = ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x1c),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x80),8]::64 word) = 0x15f56 \<and> (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word),8]::64 word) = (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word),8]::64 word)\<close>
declare Q_qemu_malloc_addr_0x15f51_66_def[Qs]

schematic_goal qcow_snapshot_create_0_1_0x15f51_0x15f51_66[blocks]:
  assumes \<open>(P_0x15f51_66 && P_0x15f51_66_regions) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x15f51 66 \<sigma> \<triangleq> ?\<sigma> \<and> Q_qemu_malloc_addr_0x15f51_66 ?\<sigma> \<and> block_usage P_0x15f51_66_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x15f51_66_def P_0x15f51_66_regions_def post: Q_qemu_malloc_addr_0x15f51_66_def regionset: P_0x15f51_66_regions_set_def)

definition P_0x15f56_67 :: state_pred where
  \<open>P_0x15f56_67 \<sigma> \<equiv> RIP \<sigma> = 0x15f56 \<and> RAX \<sigma> = qemu_malloc_0x15f51_retval \<and> RBX \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> RCX \<sigma> = ucast (((ucast (((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x1c),4]::32 word)::32 word))::32 word) << 3)) \<and> RDX \<sigma> = ((ucast (((sextend (ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x1c),4]::32 word))) 32 64::64 word)::64 word))::64 word) << 3) \<and> RDI \<sigma> = ((ucast (((((\<langle>63,0\<rangle>(((\<langle>63,0\<rangle>(sextend (ucast ((((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x35c),4]::32 word)::32 word) + 0x1))) 32 64::64 word)::64 word)::64 word) * 0x8)::64 word)::64 word) - (sextend (ucast ((((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x35c),4]::32 word)::32 word) + 0x1))) 32 64::64 word))::64 word))::64 word) << 3) \<and> RSI \<sigma> = R14 \<sigma> \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x78) \<and> R13 \<sigma> = qemu_malloc_0x15ed7_retval \<and> R12 \<sigma> = RDI\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> regs \<sigma> ymm0w1 = 0x0 \<and> regs \<sigma> ymm0w0 = 0x0 \<and> regs \<sigma> ymm1w1 = ymm1w1\<^sub>0 \<and> regs \<sigma> ymm1w0 = ymm1w0\<^sub>0 \<and> regs \<sigma> ymm2w1 = ymm2w1\<^sub>0 \<and> regs \<sigma> ymm2w0 = ymm2w0\<^sub>0 \<and> regs \<sigma> ymm3w1 = ymm3w1\<^sub>0 \<and> regs \<sigma> ymm3w0 = ymm3w0\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word) = ucast ((\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x180),8]::64 word) = (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x180),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x188),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x188),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x190),8]::64 word) = (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x190),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x1c),4]::32 word) = ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x1c),4]::32 word)) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x38),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x38),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x35c),4]::32 word) = ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x35c),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x48),8]::64 word) = (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x190),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x188),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),8]::64 word) = (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x180),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),4]::32 word) = ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x1c),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x80),8]::64 word) = 0x15f56 \<and> (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word),8]::64 word) = (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word),8]::64 word)\<close>
declare P_0x15f56_67_def[Ps]

definition P_0x15f56_67_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x15f56_67_regions_set \<sigma> \<equiv> {
    (0, RSI\<^sub>0, Suc 0),
    (1, RSP\<^sub>0, 8),
    (2, ((FS\<^sub>0::64 word) + 0x28), 8),
    (3, ((RDI\<^sub>0::64 word) + 0x40), 8),
    (4, ((RSI\<^sub>0::64 word) + 0x180), 8),
    (5, ((RSI\<^sub>0::64 word) + 0x188), 4),
    (6, ((RSI\<^sub>0::64 word) + 0x190), 8),
    (7, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x1c), 4),
    (8, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x38), 8),
    (9, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x35c), 4),
    (10, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x360), 8),
    (11, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (12, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (13, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (14, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (15, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (16, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (17, ((RSP\<^sub>0::64 word) - 0x40), 8),
    (18, ((RSP\<^sub>0::64 word) - 0x48), 8),
    (19, ((RSP\<^sub>0::64 word) - 0x50), 4),
    (20, ((RSP\<^sub>0::64 word) - 0x58), 8),
    (21, ((RSP\<^sub>0::64 word) - 0x70), 4),
    (22, ((RSP\<^sub>0::64 word) - 0x80), 8),
    (23, (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word), 8)
  }\<close>

definition P_0x15f56_67_regions :: state_pred where
  \<open>P_0x15f56_67_regions \<sigma> \<equiv> \<exists>regions. P_0x15f56_67_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x15f63_67 :: state_pred where
  \<open>Q_0x15f63_67 \<sigma> \<equiv> RIP \<sigma> = 0x15f63 \<and> RAX \<sigma> = qemu_malloc_0x15f51_retval \<and> RBX \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> RCX \<sigma> = ucast (((ucast (((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x1c),4]::32 word)::32 word))::32 word) << 3)) \<and> RDX \<sigma> = ((ucast (((sextend (ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x1c),4]::32 word))) 32 64::64 word)::64 word))::64 word) << 3) \<and> RDI \<sigma> = ((ucast (((((\<langle>63,0\<rangle>(((\<langle>63,0\<rangle>(sextend (ucast ((((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x35c),4]::32 word)::32 word) + 0x1))) 32 64::64 word)::64 word)::64 word) * 0x8)::64 word)::64 word) - (sextend (ucast ((((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x35c),4]::32 word)::32 word) + 0x1))) 32 64::64 word))::64 word))::64 word) << 3) \<and> RSI \<sigma> = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x360),8]::64 word) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x78) \<and> R13 \<sigma> = qemu_malloc_0x15f51_retval \<and> R12 \<sigma> = RDI\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> regs \<sigma> ymm0w1 = 0x0 \<and> regs \<sigma> ymm0w0 = 0x0 \<and> regs \<sigma> ymm1w1 = ymm1w1\<^sub>0 \<and> regs \<sigma> ymm1w0 = ymm1w0\<^sub>0 \<and> regs \<sigma> ymm2w1 = ymm2w1\<^sub>0 \<and> regs \<sigma> ymm2w0 = ymm2w0\<^sub>0 \<and> regs \<sigma> ymm3w1 = ymm3w1\<^sub>0 \<and> regs \<sigma> ymm3w0 = ymm3w0\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word) = ucast ((\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x180),8]::64 word) = (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x180),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x188),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x188),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x190),8]::64 word) = (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x190),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x1c),4]::32 word) = ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x1c),4]::32 word)) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x38),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x38),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x35c),4]::32 word) = ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x35c),4]::32 word)) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x360),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x360),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x48),8]::64 word) = (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x190),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x188),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),8]::64 word) = (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x180),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),4]::32 word) = ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x1c),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x80),8]::64 word) = 0x15f56 \<and> (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word),8]::64 word) = (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word),8]::64 word)\<close>
declare Q_0x15f63_67_def[Qs]

schematic_goal qcow_snapshot_create_0_3_0x15f56_0x15f60_67[blocks]:
  assumes \<open>(P_0x15f56_67 && P_0x15f56_67_regions) \<sigma>\<close>
  shows \<open>exec_block 3 0x15f60 67 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x15f63_67 ?\<sigma> \<and> block_usage P_0x15f56_67_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x15f56_67_def P_0x15f56_67_regions_def post: Q_0x15f63_67_def regionset: P_0x15f56_67_regions_set_def)

definition P_0x15f63_true_68 :: state_pred where
  \<open>P_0x15f63_true_68 \<sigma> \<equiv> RIP \<sigma> = 0x15f63 \<and> RAX \<sigma> = qemu_malloc_0x15f51_retval \<and> RBX \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> RCX \<sigma> = ucast (((ucast (((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x1c),4]::32 word)::32 word))::32 word) << 3)) \<and> RDX \<sigma> = ((ucast (((sextend (ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x1c),4]::32 word))) 32 64::64 word)::64 word))::64 word) << 3) \<and> RDI \<sigma> = ((ucast (((((\<langle>63,0\<rangle>(((\<langle>63,0\<rangle>(sextend (ucast ((((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x35c),4]::32 word)::32 word) + 0x1))) 32 64::64 word)::64 word)::64 word) * 0x8)::64 word)::64 word) - (sextend (ucast ((((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x35c),4]::32 word)::32 word) + 0x1))) 32 64::64 word))::64 word))::64 word) << 3) \<and> RSI \<sigma> = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x360),8]::64 word) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x78) \<and> R13 \<sigma> = qemu_malloc_0x15f51_retval \<and> R12 \<sigma> = RDI\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> regs \<sigma> ymm0w1 = 0x0 \<and> regs \<sigma> ymm0w0 = 0x0 \<and> regs \<sigma> ymm1w1 = ymm1w1\<^sub>0 \<and> regs \<sigma> ymm1w0 = ymm1w0\<^sub>0 \<and> regs \<sigma> ymm2w1 = ymm2w1\<^sub>0 \<and> regs \<sigma> ymm2w0 = ymm2w0\<^sub>0 \<and> regs \<sigma> ymm3w1 = ymm3w1\<^sub>0 \<and> regs \<sigma> ymm3w0 = ymm3w0\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word) = ucast ((\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x180),8]::64 word) = (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x180),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x188),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x188),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x190),8]::64 word) = (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x190),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x1c),4]::32 word) = ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x1c),4]::32 word)) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x38),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x38),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x35c),4]::32 word) = ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x35c),4]::32 word)) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x360),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x360),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x48),8]::64 word) = (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x190),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x188),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),8]::64 word) = (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x180),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),4]::32 word) = ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x1c),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x80),8]::64 word) = 0x15f56 \<and> (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word),8]::64 word) = (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word),8]::64 word)\<close>
declare P_0x15f63_true_68_def[Ps]

definition P_0x15f63_true_68_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x15f63_true_68_regions_set \<sigma> \<equiv> {
    (0, RSI\<^sub>0, Suc 0),
    (1, RSP\<^sub>0, 8),
    (2, ((FS\<^sub>0::64 word) + 0x28), 8),
    (3, ((RDI\<^sub>0::64 word) + 0x40), 8),
    (4, ((RSI\<^sub>0::64 word) + 0x180), 8),
    (5, ((RSI\<^sub>0::64 word) + 0x188), 4),
    (6, ((RSI\<^sub>0::64 word) + 0x190), 8),
    (7, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x1c), 4),
    (8, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x38), 8),
    (9, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x35c), 4),
    (10, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x360), 8),
    (11, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (12, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (13, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (14, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (15, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (16, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (17, ((RSP\<^sub>0::64 word) - 0x40), 8),
    (18, ((RSP\<^sub>0::64 word) - 0x48), 8),
    (19, ((RSP\<^sub>0::64 word) - 0x50), 4),
    (20, ((RSP\<^sub>0::64 word) - 0x58), 8),
    (21, ((RSP\<^sub>0::64 word) - 0x70), 4),
    (22, ((RSP\<^sub>0::64 word) - 0x80), 8),
    (23, (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word), 8)
  }\<close>

definition P_0x15f63_true_68_regions :: state_pred where
  \<open>P_0x15f63_true_68_regions \<sigma> \<equiv> \<exists>regions. P_0x15f63_true_68_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x15f8f_68 :: state_pred where
  \<open>Q_0x15f8f_68 \<sigma> \<equiv> RIP \<sigma> = 0x15f8f \<and> RBX \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> RCX \<sigma> = ucast (((ucast (((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x1c),4]::32 word)::32 word))::32 word) << 3)) \<and> RSI \<sigma> = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x360),8]::64 word) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x78) \<and> R13 \<sigma> = qemu_malloc_0x15f51_retval \<and> R12 \<sigma> = RDI\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> regs \<sigma> ymm0w1 = 0x0 \<and> regs \<sigma> ymm0w0 = 0x0 \<and> regs \<sigma> ymm1w1 = ymm1w1\<^sub>0 \<and> regs \<sigma> ymm1w0 = ymm1w0\<^sub>0 \<and> regs \<sigma> ymm2w1 = ymm2w1\<^sub>0 \<and> regs \<sigma> ymm2w0 = ymm2w0\<^sub>0 \<and> regs \<sigma> ymm3w1 = ymm3w1\<^sub>0 \<and> regs \<sigma> ymm3w0 = ymm3w0\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word) = ucast ((\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x180),8]::64 word) = (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x180),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x188),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x188),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x190),8]::64 word) = (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x190),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x1c),4]::32 word) = ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x1c),4]::32 word)) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x38),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x38),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x35c),4]::32 word) = ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x35c),4]::32 word)) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x360),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x360),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x48),8]::64 word) = (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x190),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x188),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),8]::64 word) = (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x180),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),4]::32 word) = ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x1c),4]::32 word)) \<and> (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word),8]::64 word) = (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word),8]::64 word)\<close>
declare Q_0x15f8f_68_def[Qs]

schematic_goal qcow_snapshot_create_0_1_0x15f63_0x15f63_68[blocks]:
  assumes \<open>(P_0x15f63_true_68 && P_0x15f63_true_68_regions && ZF) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x15f63 68 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x15f8f_68 ?\<sigma> \<and> block_usage P_0x15f63_true_68_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x15f63_true_68_def P_0x15f63_true_68_regions_def post: Q_0x15f8f_68_def regionset: P_0x15f63_true_68_regions_set_def)

definition P_0x15f63_false_69 :: state_pred where
  \<open>P_0x15f63_false_69 \<sigma> \<equiv> RIP \<sigma> = 0x15f63 \<and> RAX \<sigma> = qemu_malloc_0x15f51_retval \<and> RBX \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> RCX \<sigma> = ucast (((ucast (((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x1c),4]::32 word)::32 word))::32 word) << 3)) \<and> RDX \<sigma> = ((ucast (((sextend (ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x1c),4]::32 word))) 32 64::64 word)::64 word))::64 word) << 3) \<and> RDI \<sigma> = ((ucast (((((\<langle>63,0\<rangle>(((\<langle>63,0\<rangle>(sextend (ucast ((((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x35c),4]::32 word)::32 word) + 0x1))) 32 64::64 word)::64 word)::64 word) * 0x8)::64 word)::64 word) - (sextend (ucast ((((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x35c),4]::32 word)::32 word) + 0x1))) 32 64::64 word))::64 word))::64 word) << 3) \<and> RSI \<sigma> = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x360),8]::64 word) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x78) \<and> R13 \<sigma> = qemu_malloc_0x15f51_retval \<and> R12 \<sigma> = RDI\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> regs \<sigma> ymm0w1 = 0x0 \<and> regs \<sigma> ymm0w0 = 0x0 \<and> regs \<sigma> ymm1w1 = ymm1w1\<^sub>0 \<and> regs \<sigma> ymm1w0 = ymm1w0\<^sub>0 \<and> regs \<sigma> ymm2w1 = ymm2w1\<^sub>0 \<and> regs \<sigma> ymm2w0 = ymm2w0\<^sub>0 \<and> regs \<sigma> ymm3w1 = ymm3w1\<^sub>0 \<and> regs \<sigma> ymm3w0 = ymm3w0\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word) = ucast ((\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x180),8]::64 word) = (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x180),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x188),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x188),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x190),8]::64 word) = (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x190),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x1c),4]::32 word) = ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x1c),4]::32 word)) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x38),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x38),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x35c),4]::32 word) = ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x35c),4]::32 word)) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x360),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x360),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x48),8]::64 word) = (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x190),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x188),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),8]::64 word) = (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x180),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),4]::32 word) = ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x1c),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x80),8]::64 word) = 0x15f56 \<and> (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word),8]::64 word) = (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word),8]::64 word)\<close>
declare P_0x15f63_false_69_def[Ps]

definition P_0x15f63_false_69_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x15f63_false_69_regions_set \<sigma> \<equiv> {
    (0, RSI\<^sub>0, Suc 0),
    (1, RSP\<^sub>0, 8),
    (2, ((FS\<^sub>0::64 word) + 0x28), 8),
    (3, ((RDI\<^sub>0::64 word) + 0x40), 8),
    (4, ((RSI\<^sub>0::64 word) + 0x180), 8),
    (5, ((RSI\<^sub>0::64 word) + 0x188), 4),
    (6, ((RSI\<^sub>0::64 word) + 0x190), 8),
    (7, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x1c), 4),
    (8, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x38), 8),
    (9, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x35c), 4),
    (10, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x360), 8),
    (11, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (12, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (13, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (14, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (15, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (16, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (17, ((RSP\<^sub>0::64 word) - 0x40), 8),
    (18, ((RSP\<^sub>0::64 word) - 0x48), 8),
    (19, ((RSP\<^sub>0::64 word) - 0x50), 4),
    (20, ((RSP\<^sub>0::64 word) - 0x58), 8),
    (21, ((RSP\<^sub>0::64 word) - 0x70), 4),
    (22, ((RSP\<^sub>0::64 word) - 0x80), 8),
    (23, (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word), 8)
  }\<close>

definition P_0x15f63_false_69_regions :: state_pred where
  \<open>P_0x15f63_false_69_regions \<sigma> \<equiv> \<exists>regions. P_0x15f63_false_69_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x15f7e_69 :: state_pred where
  \<open>Q_0x15f7e_69 \<sigma> \<equiv> RIP \<sigma> = 0x15f7e \<and> RAX \<sigma> = (sextend (ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x35c),4]::32 word))) 32 64::64 word) \<and> RBX \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> RCX \<sigma> = ucast (((ucast (((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x1c),4]::32 word)::32 word))::32 word) << 3)) \<and> RDX \<sigma> = ((ucast (((((\<langle>63,0\<rangle>(((\<langle>63,0\<rangle>(sextend (ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x35c),4]::32 word))) 32 64::64 word)::64 word)::64 word) * 0x8)::64 word)::64 word) - (sextend (ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x35c),4]::32 word))) 32 64::64 word))::64 word))::64 word) << 3) \<and> RDI \<sigma> = qemu_malloc_0x15f51_retval \<and> RSI \<sigma> = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x360),8]::64 word) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x78) \<and> R13 \<sigma> = qemu_malloc_0x15f51_retval \<and> R12 \<sigma> = RDI\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> regs \<sigma> ymm0w1 = 0x0 \<and> regs \<sigma> ymm0w0 = 0x0 \<and> regs \<sigma> ymm1w1 = ymm1w1\<^sub>0 \<and> regs \<sigma> ymm1w0 = ymm1w0\<^sub>0 \<and> regs \<sigma> ymm2w1 = ymm2w1\<^sub>0 \<and> regs \<sigma> ymm2w0 = ymm2w0\<^sub>0 \<and> regs \<sigma> ymm3w1 = ymm3w1\<^sub>0 \<and> regs \<sigma> ymm3w0 = ymm3w0\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word) = ucast ((\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x180),8]::64 word) = (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x180),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x188),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x188),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x190),8]::64 word) = (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x190),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x1c),4]::32 word) = ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x1c),4]::32 word)) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x38),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x38),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x35c),4]::32 word) = ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x35c),4]::32 word)) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x360),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x360),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x48),8]::64 word) = (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x190),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x188),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),8]::64 word) = (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x180),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),4]::32 word) = ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x1c),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x80),8]::64 word) = 0x15f56 \<and> (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word),8]::64 word) = (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word),8]::64 word)\<close>
declare Q_0x15f7e_69_def[Qs]

schematic_goal qcow_snapshot_create_0_6_0x15f63_0x15f7a_69[blocks]:
  assumes \<open>(P_0x15f63_false_69 && P_0x15f63_false_69_regions && ! ZF) \<sigma>\<close>
  shows \<open>exec_block 6 0x15f7a 69 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x15f7e_69 ?\<sigma> \<and> block_usage P_0x15f63_false_69_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x15f63_false_69_def P_0x15f63_false_69_regions_def post: Q_0x15f7e_69_def regionset: P_0x15f63_false_69_regions_set_def)

definition P_0x15f7e_70 :: state_pred where
  \<open>P_0x15f7e_70 \<sigma> \<equiv> RIP \<sigma> = 0x15f7e \<and> RAX \<sigma> = (sextend (ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x35c),4]::32 word))) 32 64::64 word) \<and> RBX \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> RCX \<sigma> = ucast (((ucast (((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x1c),4]::32 word)::32 word))::32 word) << 3)) \<and> RDX \<sigma> = ((ucast (((((\<langle>63,0\<rangle>(((\<langle>63,0\<rangle>(sextend (ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x35c),4]::32 word))) 32 64::64 word)::64 word)::64 word) * 0x8)::64 word)::64 word) - (sextend (ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x35c),4]::32 word))) 32 64::64 word))::64 word))::64 word) << 3) \<and> RDI \<sigma> = qemu_malloc_0x15f51_retval \<and> RSI \<sigma> = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x360),8]::64 word) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x78) \<and> R13 \<sigma> = qemu_malloc_0x15f51_retval \<and> R12 \<sigma> = RDI\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> regs \<sigma> ymm0w1 = 0x0 \<and> regs \<sigma> ymm0w0 = 0x0 \<and> regs \<sigma> ymm1w1 = ymm1w1\<^sub>0 \<and> regs \<sigma> ymm1w0 = ymm1w0\<^sub>0 \<and> regs \<sigma> ymm2w1 = ymm2w1\<^sub>0 \<and> regs \<sigma> ymm2w0 = ymm2w0\<^sub>0 \<and> regs \<sigma> ymm3w1 = ymm3w1\<^sub>0 \<and> regs \<sigma> ymm3w0 = ymm3w0\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word) = ucast ((\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x180),8]::64 word) = (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x180),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x188),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x188),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x190),8]::64 word) = (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x190),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x1c),4]::32 word) = ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x1c),4]::32 word)) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x38),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x38),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x35c),4]::32 word) = ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x35c),4]::32 word)) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x360),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x360),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x48),8]::64 word) = (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x190),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x188),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),8]::64 word) = (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x180),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),4]::32 word) = ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x1c),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x80),8]::64 word) = 0x15f56 \<and> (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word),8]::64 word) = (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word),8]::64 word)\<close>
declare P_0x15f7e_70_def[Ps]

definition P_0x15f7e_70_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x15f7e_70_regions_set \<sigma> \<equiv> {
    (0, RSI\<^sub>0, Suc 0),
    (1, RSP\<^sub>0, 8),
    (2, ((FS\<^sub>0::64 word) + 0x28), 8),
    (3, ((RDI\<^sub>0::64 word) + 0x40), 8),
    (4, ((RSI\<^sub>0::64 word) + 0x180), 8),
    (5, ((RSI\<^sub>0::64 word) + 0x188), 4),
    (6, ((RSI\<^sub>0::64 word) + 0x190), 8),
    (7, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x1c), 4),
    (8, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x38), 8),
    (9, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x35c), 4),
    (10, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x360), 8),
    (11, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (12, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (13, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (14, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (15, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (16, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (17, ((RSP\<^sub>0::64 word) - 0x40), 8),
    (18, ((RSP\<^sub>0::64 word) - 0x48), 8),
    (19, ((RSP\<^sub>0::64 word) - 0x50), 4),
    (20, ((RSP\<^sub>0::64 word) - 0x58), 8),
    (21, ((RSP\<^sub>0::64 word) - 0x70), 4),
    (22, ((RSP\<^sub>0::64 word) - 0x80), 8),
    (23, (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word), 8)
  }\<close>

definition P_0x15f7e_70_regions :: state_pred where
  \<open>P_0x15f7e_70_regions \<sigma> \<equiv> \<exists>regions. P_0x15f7e_70_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_memcpy_addr_0x15f7e_70 :: state_pred where
  \<open>Q_memcpy_addr_0x15f7e_70 \<sigma> \<equiv> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x80) \<and> RIP \<sigma> = memcpy_addr \<and> RAX \<sigma> = (sextend (ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x35c),4]::32 word))) 32 64::64 word) \<and> RBX \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> RCX \<sigma> = ucast (((ucast (((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x1c),4]::32 word)::32 word))::32 word) << 3)) \<and> RDX \<sigma> = ((ucast (((((\<langle>63,0\<rangle>(((\<langle>63,0\<rangle>(sextend (ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x35c),4]::32 word))) 32 64::64 word)::64 word)::64 word) * 0x8)::64 word)::64 word) - (sextend (ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x35c),4]::32 word))) 32 64::64 word))::64 word))::64 word) << 3) \<and> RDI \<sigma> = qemu_malloc_0x15f51_retval \<and> RSI \<sigma> = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x360),8]::64 word) \<and> R13 \<sigma> = qemu_malloc_0x15f51_retval \<and> R12 \<sigma> = RDI\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> regs \<sigma> ymm0w1 = 0x0 \<and> regs \<sigma> ymm0w0 = 0x0 \<and> regs \<sigma> ymm1w1 = ymm1w1\<^sub>0 \<and> regs \<sigma> ymm1w0 = ymm1w0\<^sub>0 \<and> regs \<sigma> ymm2w1 = ymm2w1\<^sub>0 \<and> regs \<sigma> ymm2w0 = ymm2w0\<^sub>0 \<and> regs \<sigma> ymm3w1 = ymm3w1\<^sub>0 \<and> regs \<sigma> ymm3w0 = ymm3w0\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word) = ucast ((\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x180),8]::64 word) = (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x180),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x188),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x188),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x190),8]::64 word) = (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x190),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x1c),4]::32 word) = ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x1c),4]::32 word)) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x38),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x38),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x35c),4]::32 word) = ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x35c),4]::32 word)) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x360),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x360),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x48),8]::64 word) = (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x190),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x188),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),8]::64 word) = (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x180),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),4]::32 word) = ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x1c),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x80),8]::64 word) = 0x15f83 \<and> (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word),8]::64 word) = (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word),8]::64 word)\<close>
declare Q_memcpy_addr_0x15f7e_70_def[Qs]

schematic_goal qcow_snapshot_create_0_1_0x15f7e_0x15f7e_70[blocks]:
  assumes \<open>(P_0x15f7e_70 && P_0x15f7e_70_regions) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x15f7e 70 \<sigma> \<triangleq> ?\<sigma> \<and> Q_memcpy_addr_0x15f7e_70 ?\<sigma> \<and> block_usage P_0x15f7e_70_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x15f7e_70_def P_0x15f7e_70_regions_def post: Q_memcpy_addr_0x15f7e_70_def regionset: P_0x15f7e_70_regions_set_def)

definition P_0x15f83_71 :: state_pred where
  \<open>P_0x15f83_71 \<sigma> \<equiv> RIP \<sigma> = 0x15f83 \<and> RAX \<sigma> = memcpy_0x15f7e_retval \<and> RBX \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> RCX \<sigma> = ucast (((ucast (((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x1c),4]::32 word)::32 word))::32 word) << 3)) \<and> RDX \<sigma> = ((ucast (((((\<langle>63,0\<rangle>(((\<langle>63,0\<rangle>(sextend (ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x35c),4]::32 word))) 32 64::64 word)::64 word)::64 word) * 0x8)::64 word)::64 word) - (sextend (ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x35c),4]::32 word))) 32 64::64 word))::64 word))::64 word) << 3) \<and> RDI \<sigma> = qemu_malloc_0x15f51_retval \<and> RSI \<sigma> = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x360),8]::64 word) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x78) \<and> R13 \<sigma> = qemu_malloc_0x15f51_retval \<and> R12 \<sigma> = RDI\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> regs \<sigma> ymm0w1 = 0x0 \<and> regs \<sigma> ymm0w0 = 0x0 \<and> regs \<sigma> ymm1w1 = ymm1w1\<^sub>0 \<and> regs \<sigma> ymm1w0 = ymm1w0\<^sub>0 \<and> regs \<sigma> ymm2w1 = ymm2w1\<^sub>0 \<and> regs \<sigma> ymm2w0 = ymm2w0\<^sub>0 \<and> regs \<sigma> ymm3w1 = ymm3w1\<^sub>0 \<and> regs \<sigma> ymm3w0 = ymm3w0\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word) = ucast ((\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x180),8]::64 word) = (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x180),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x188),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x188),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x190),8]::64 word) = (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x190),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x1c),4]::32 word) = ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x1c),4]::32 word)) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x38),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x38),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x35c),4]::32 word) = ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x35c),4]::32 word)) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x360),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x360),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x48),8]::64 word) = (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x190),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x188),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),8]::64 word) = (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x180),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),4]::32 word) = ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x1c),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x80),8]::64 word) = 0x15f83 \<and> (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word),8]::64 word) = (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word),8]::64 word)\<close>
declare P_0x15f83_71_def[Ps]

definition P_0x15f83_71_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x15f83_71_regions_set \<sigma> \<equiv> {
    (0, RSI\<^sub>0, Suc 0),
    (1, RSP\<^sub>0, 8),
    (2, ((FS\<^sub>0::64 word) + 0x28), 8),
    (3, ((RDI\<^sub>0::64 word) + 0x40), 8),
    (4, ((RSI\<^sub>0::64 word) + 0x180), 8),
    (5, ((RSI\<^sub>0::64 word) + 0x188), 4),
    (6, ((RSI\<^sub>0::64 word) + 0x190), 8),
    (7, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x1c), 4),
    (8, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x38), 8),
    (9, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x35c), 4),
    (10, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x360), 8),
    (11, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (12, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (13, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (14, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (15, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (16, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (17, ((RSP\<^sub>0::64 word) - 0x40), 8),
    (18, ((RSP\<^sub>0::64 word) - 0x48), 8),
    (19, ((RSP\<^sub>0::64 word) - 0x50), 4),
    (20, ((RSP\<^sub>0::64 word) - 0x58), 8),
    (21, ((RSP\<^sub>0::64 word) - 0x70), 4),
    (22, ((RSP\<^sub>0::64 word) - 0x80), 8),
    (23, (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word), 8)
  }\<close>

definition P_0x15f83_71_regions :: state_pred where
  \<open>P_0x15f83_71_regions \<sigma> \<equiv> \<exists>regions. P_0x15f83_71_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x15f8a_71 :: state_pred where
  \<open>Q_0x15f8a_71 \<sigma> \<equiv> RIP \<sigma> = 0x15f8a \<and> RAX \<sigma> = memcpy_0x15f7e_retval \<and> RBX \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> RCX \<sigma> = ucast (((ucast (((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x1c),4]::32 word)::32 word))::32 word) << 3)) \<and> RDX \<sigma> = ((ucast (((((\<langle>63,0\<rangle>(((\<langle>63,0\<rangle>(sextend (ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x35c),4]::32 word))) 32 64::64 word)::64 word)::64 word) * 0x8)::64 word)::64 word) - (sextend (ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x35c),4]::32 word))) 32 64::64 word))::64 word))::64 word) << 3) \<and> RDI \<sigma> = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x360),8]::64 word) \<and> RSI \<sigma> = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x360),8]::64 word) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x78) \<and> R13 \<sigma> = qemu_malloc_0x15f51_retval \<and> R12 \<sigma> = RDI\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> regs \<sigma> ymm0w1 = 0x0 \<and> regs \<sigma> ymm0w0 = 0x0 \<and> regs \<sigma> ymm1w1 = ymm1w1\<^sub>0 \<and> regs \<sigma> ymm1w0 = ymm1w0\<^sub>0 \<and> regs \<sigma> ymm2w1 = ymm2w1\<^sub>0 \<and> regs \<sigma> ymm2w0 = ymm2w0\<^sub>0 \<and> regs \<sigma> ymm3w1 = ymm3w1\<^sub>0 \<and> regs \<sigma> ymm3w0 = ymm3w0\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word) = ucast ((\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x180),8]::64 word) = (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x180),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x188),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x188),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x190),8]::64 word) = (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x190),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x1c),4]::32 word) = ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x1c),4]::32 word)) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x38),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x38),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x35c),4]::32 word) = ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x35c),4]::32 word)) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x360),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x360),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x48),8]::64 word) = (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x190),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x188),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),8]::64 word) = (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x180),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),4]::32 word) = ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x1c),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x80),8]::64 word) = 0x15f83 \<and> (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word),8]::64 word) = (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word),8]::64 word)\<close>
declare Q_0x15f8a_71_def[Qs]

schematic_goal qcow_snapshot_create_0_1_0x15f83_0x15f83_71[blocks]:
  assumes \<open>(P_0x15f83_71 && P_0x15f83_71_regions) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x15f83 71 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x15f8a_71 ?\<sigma> \<and> block_usage P_0x15f83_71_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x15f83_71_def P_0x15f83_71_regions_def post: Q_0x15f8a_71_def regionset: P_0x15f83_71_regions_set_def)

definition P_0x15f8a_72 :: state_pred where
  \<open>P_0x15f8a_72 \<sigma> \<equiv> RIP \<sigma> = 0x15f8a \<and> RAX \<sigma> = memcpy_0x15f7e_retval \<and> RBX \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> RCX \<sigma> = ucast (((ucast (((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x1c),4]::32 word)::32 word))::32 word) << 3)) \<and> RDX \<sigma> = ((ucast (((((\<langle>63,0\<rangle>(((\<langle>63,0\<rangle>(sextend (ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x35c),4]::32 word))) 32 64::64 word)::64 word)::64 word) * 0x8)::64 word)::64 word) - (sextend (ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x35c),4]::32 word))) 32 64::64 word))::64 word))::64 word) << 3) \<and> RDI \<sigma> = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x360),8]::64 word) \<and> RSI \<sigma> = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x360),8]::64 word) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x78) \<and> R13 \<sigma> = qemu_malloc_0x15f51_retval \<and> R12 \<sigma> = RDI\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> regs \<sigma> ymm0w1 = 0x0 \<and> regs \<sigma> ymm0w0 = 0x0 \<and> regs \<sigma> ymm1w1 = ymm1w1\<^sub>0 \<and> regs \<sigma> ymm1w0 = ymm1w0\<^sub>0 \<and> regs \<sigma> ymm2w1 = ymm2w1\<^sub>0 \<and> regs \<sigma> ymm2w0 = ymm2w0\<^sub>0 \<and> regs \<sigma> ymm3w1 = ymm3w1\<^sub>0 \<and> regs \<sigma> ymm3w0 = ymm3w0\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word) = ucast ((\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x180),8]::64 word) = (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x180),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x188),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x188),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x190),8]::64 word) = (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x190),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x1c),4]::32 word) = ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x1c),4]::32 word)) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x38),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x38),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x35c),4]::32 word) = ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x35c),4]::32 word)) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x360),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x360),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x48),8]::64 word) = (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x190),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x188),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),8]::64 word) = (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x180),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),4]::32 word) = ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x1c),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x80),8]::64 word) = 0x15f83 \<and> (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word),8]::64 word) = (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word),8]::64 word)\<close>
declare P_0x15f8a_72_def[Ps]

definition P_0x15f8a_72_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x15f8a_72_regions_set \<sigma> \<equiv> {
    (0, RSI\<^sub>0, Suc 0),
    (1, RSP\<^sub>0, 8),
    (2, ((FS\<^sub>0::64 word) + 0x28), 8),
    (3, ((RDI\<^sub>0::64 word) + 0x40), 8),
    (4, ((RSI\<^sub>0::64 word) + 0x180), 8),
    (5, ((RSI\<^sub>0::64 word) + 0x188), 4),
    (6, ((RSI\<^sub>0::64 word) + 0x190), 8),
    (7, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x1c), 4),
    (8, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x38), 8),
    (9, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x35c), 4),
    (10, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x360), 8),
    (11, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (12, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (13, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (14, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (15, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (16, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (17, ((RSP\<^sub>0::64 word) - 0x40), 8),
    (18, ((RSP\<^sub>0::64 word) - 0x48), 8),
    (19, ((RSP\<^sub>0::64 word) - 0x50), 4),
    (20, ((RSP\<^sub>0::64 word) - 0x58), 8),
    (21, ((RSP\<^sub>0::64 word) - 0x70), 4),
    (22, ((RSP\<^sub>0::64 word) - 0x80), 8),
    (23, (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word), 8)
  }\<close>

definition P_0x15f8a_72_regions :: state_pred where
  \<open>P_0x15f8a_72_regions \<sigma> \<equiv> \<exists>regions. P_0x15f8a_72_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_qemu_free_addr_0x15f8a_72 :: state_pred where
  \<open>Q_qemu_free_addr_0x15f8a_72 \<sigma> \<equiv> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x80) \<and> RIP \<sigma> = qemu_free_addr \<and> RAX \<sigma> = memcpy_0x15f7e_retval \<and> RBX \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> RCX \<sigma> = ucast (((ucast (((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x1c),4]::32 word)::32 word))::32 word) << 3)) \<and> RSI \<sigma> = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x360),8]::64 word) \<and> R13 \<sigma> = qemu_malloc_0x15f51_retval \<and> R12 \<sigma> = RDI\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> regs \<sigma> ymm0w1 = 0x0 \<and> regs \<sigma> ymm0w0 = 0x0 \<and> regs \<sigma> ymm1w1 = ymm1w1\<^sub>0 \<and> regs \<sigma> ymm1w0 = ymm1w0\<^sub>0 \<and> regs \<sigma> ymm2w1 = ymm2w1\<^sub>0 \<and> regs \<sigma> ymm2w0 = ymm2w0\<^sub>0 \<and> regs \<sigma> ymm3w1 = ymm3w1\<^sub>0 \<and> regs \<sigma> ymm3w0 = ymm3w0\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word) = ucast ((\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x180),8]::64 word) = (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x180),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x188),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x188),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x190),8]::64 word) = (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x190),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x1c),4]::32 word) = ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x1c),4]::32 word)) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x38),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x38),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x35c),4]::32 word) = ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x35c),4]::32 word)) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x360),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x360),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x48),8]::64 word) = (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x190),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x188),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),8]::64 word) = (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x180),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),4]::32 word) = ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x1c),4]::32 word)) \<and> (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word),8]::64 word) = (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word),8]::64 word)\<close>
declare Q_qemu_free_addr_0x15f8a_72_def[Qs]

schematic_goal qcow_snapshot_create_0_1_0x15f8a_0x15f8a_72[blocks]:
  assumes \<open>(P_0x15f8a_72 && P_0x15f8a_72_regions) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x15f8a 72 \<sigma> \<triangleq> ?\<sigma> \<and> Q_qemu_free_addr_0x15f8a_72 ?\<sigma> \<and> block_usage P_0x15f8a_72_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x15f8a_72_def P_0x15f8a_72_regions_def post: Q_qemu_free_addr_0x15f8a_72_def regionset: P_0x15f8a_72_regions_set_def)

definition P_0x15f8f_73 :: state_pred where
  \<open>P_0x15f8f_73 \<sigma> \<equiv> RIP \<sigma> = 0x15f8f \<and> RBX \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> RCX \<sigma> = ucast (((ucast (((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x1c),4]::32 word)::32 word))::32 word) << 3)) \<and> RSI \<sigma> = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x360),8]::64 word) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x78) \<and> R13 \<sigma> = qemu_malloc_0x15f51_retval \<and> R12 \<sigma> = RDI\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> regs \<sigma> ymm0w1 = 0x0 \<and> regs \<sigma> ymm0w0 = 0x0 \<and> regs \<sigma> ymm1w1 = ymm1w1\<^sub>0 \<and> regs \<sigma> ymm1w0 = ymm1w0\<^sub>0 \<and> regs \<sigma> ymm2w1 = ymm2w1\<^sub>0 \<and> regs \<sigma> ymm2w0 = ymm2w0\<^sub>0 \<and> regs \<sigma> ymm3w1 = ymm3w1\<^sub>0 \<and> regs \<sigma> ymm3w0 = ymm3w0\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word) = ucast ((\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x180),8]::64 word) = (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x180),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x188),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x188),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x190),8]::64 word) = (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x190),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x1c),4]::32 word) = ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x1c),4]::32 word)) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x38),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x38),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x35c),4]::32 word) = ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x35c),4]::32 word)) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x360),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x360),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x48),8]::64 word) = (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x190),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x188),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),8]::64 word) = (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x180),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),4]::32 word) = ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x1c),4]::32 word)) \<and> (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word),8]::64 word) = (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word),8]::64 word)\<close>
declare P_0x15f8f_73_def[Ps]

definition P_0x15f8f_73_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x15f8f_73_regions_set \<sigma> \<equiv> {
    (0, RSI\<^sub>0, Suc 0),
    (1, RSP\<^sub>0, 8),
    (2, ((FS\<^sub>0::64 word) + 0x28), 8),
    (3, ((RDI\<^sub>0::64 word) + 0x40), 8),
    (4, ((RSI\<^sub>0::64 word) + 0x180), 8),
    (5, ((RSI\<^sub>0::64 word) + 0x188), 4),
    (6, ((RSI\<^sub>0::64 word) + 0x190), 8),
    (7, ((((qemu_malloc_0x15f51_retval::64 word) + (\<langle>63,0\<rangle>(((((\<langle>63,0\<rangle>(((\<langle>63,0\<rangle>(sextend (ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x35c),4]::32 word))) 32 64::64 word)::64 word)::64 word) * 0x8)::64 word)::64 word) - (sextend (ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x35c),4]::32 word))) 32 64::64 word))::64 word) * 0x8)::64 word))::64 word) + (ucast ((0x8::64 word))::64 word)), 8),
    (8, ((((qemu_malloc_0x15f51_retval::64 word) + (\<langle>63,0\<rangle>(((((\<langle>63,0\<rangle>(((\<langle>63,0\<rangle>(sextend (ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x35c),4]::32 word))) 32 64::64 word)::64 word)::64 word) * 0x8)::64 word)::64 word) - (sextend (ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x35c),4]::32 word))) 32 64::64 word))::64 word) * 0x8)::64 word))::64 word) + 0x10), 8),
    (9, ((((qemu_malloc_0x15f51_retval::64 word) + (\<langle>63,0\<rangle>(((((\<langle>63,0\<rangle>(((\<langle>63,0\<rangle>(sextend (ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x35c),4]::32 word))) 32 64::64 word)::64 word)::64 word) * 0x8)::64 word)::64 word) - (sextend (ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x35c),4]::32 word))) 32 64::64 word))::64 word) * 0x8)::64 word))::64 word) + 0x18), 8),
    (10, ((((qemu_malloc_0x15f51_retval::64 word) + (\<langle>63,0\<rangle>(((((\<langle>63,0\<rangle>(((\<langle>63,0\<rangle>(sextend (ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x35c),4]::32 word))) 32 64::64 word)::64 word)::64 word) * 0x8)::64 word)::64 word) - (sextend (ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x35c),4]::32 word))) 32 64::64 word))::64 word) * 0x8)::64 word))::64 word) + 0x20), 8),
    (11, ((((qemu_malloc_0x15f51_retval::64 word) + (\<langle>63,0\<rangle>(((((\<langle>63,0\<rangle>(((\<langle>63,0\<rangle>(sextend (ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x35c),4]::32 word))) 32 64::64 word)::64 word)::64 word) * 0x8)::64 word)::64 word) - (sextend (ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x35c),4]::32 word))) 32 64::64 word))::64 word) * 0x8)::64 word))::64 word) + 0x28), 8),
    (12, ((((qemu_malloc_0x15f51_retval::64 word) + (\<langle>63,0\<rangle>(((((\<langle>63,0\<rangle>(((\<langle>63,0\<rangle>(sextend (ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x35c),4]::32 word))) 32 64::64 word)::64 word)::64 word) * 0x8)::64 word)::64 word) - (sextend (ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x35c),4]::32 word))) 32 64::64 word))::64 word) * 0x8)::64 word))::64 word) + 0x30), 8),
    (13, ((qemu_malloc_0x15f51_retval::64 word) + (\<langle>63,0\<rangle>(((((\<langle>63,0\<rangle>(((\<langle>63,0\<rangle>(sextend (ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x35c),4]::32 word))) 32 64::64 word)::64 word)::64 word) * 0x8)::64 word)::64 word) - (sextend (ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x35c),4]::32 word))) 32 64::64 word))::64 word) * 0x8)::64 word)), 8),
    (14, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x1c), 4),
    (15, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x38), 8),
    (16, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x35c), 4),
    (17, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x360), 8),
    (18, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (19, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (20, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (21, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (22, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (23, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (24, ((RSP\<^sub>0::64 word) - 0x40), 8),
    (25, ((RSP\<^sub>0::64 word) - 0x48), 8),
    (26, ((RSP\<^sub>0::64 word) - 0x50), 4),
    (27, ((RSP\<^sub>0::64 word) - 0x50), 8),
    (28, ((RSP\<^sub>0::64 word) - 0x58), 8),
    (29, ((RSP\<^sub>0::64 word) - 0x60), 8),
    (30, ((RSP\<^sub>0::64 word) - 0x68), 8),
    (31, ((RSP\<^sub>0::64 word) - 0x70), 4),
    (32, ((RSP\<^sub>0::64 word) - 0x70), 8),
    (33, ((RSP\<^sub>0::64 word) - 0x78), 8),
    (34, (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word), 8)
  }\<close>

definition P_0x15f8f_73_regions :: state_pred where
  \<open>P_0x15f8f_73_regions \<sigma> \<equiv> \<exists>regions. P_0x15f8f_73_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {(26,27), (31,32)}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {(26,27), (27,26), (31,32), (32,31)}))
\<close>

definition Q_0x15fde_73 :: state_pred where
  \<open>Q_0x15fde_73 \<sigma> \<equiv> RIP \<sigma> = 0x15fde \<and> RBX \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> RCX \<sigma> = ucast (((ucast (((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x1c),4]::32 word)::32 word))::32 word) << 3)) \<and> RDX \<sigma> = (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x190),8]::64 word) \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x78) \<and> R13 \<sigma> = qemu_malloc_0x15f51_retval \<and> R12 \<sigma> = RDI\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> regs \<sigma> ymm0w1 = 0x0 \<and> regs \<sigma> ymm0w0 = 0x0 \<and> regs \<sigma> ymm1w1 = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),8]::64 word) \<and> regs \<sigma> ymm1w0 = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x78),8]::64 word) \<and> regs \<sigma> ymm2w1 = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x60),8]::64 word) \<and> regs \<sigma> ymm2w0 = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),8]::64 word) \<and> regs \<sigma> ymm3w1 = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),8]::64 word) \<and> regs \<sigma> ymm3w0 = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),8]::64 word) \<and> (\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word) = ucast ((\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x180),8]::64 word) = (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x180),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x188),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x188),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x190),8]::64 word) = (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x190),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x1c),4]::32 word) = ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x1c),4]::32 word)) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x38),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x38),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x48),8]::64 word) = (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x190),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x188),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),8]::64 word) = (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x180),8]::64 word) \<and> (\<sigma> \<turnstile> *[((((RSP\<^sub>0::64 word) - 0x58)::64 word) + 0x8),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),8]::64 word) \<and> (\<sigma> \<turnstile> *[((((RSP\<^sub>0::64 word) - 0x68)::64 word) + 0x8),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x60),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),4]::32 word) = ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x1c),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((((RSP\<^sub>0::64 word) - 0x78)::64 word) + 0x8),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x78),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x78),8]::64 word) \<and> (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word),8]::64 word) = (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word),8]::64 word)\<close>
declare Q_0x15fde_73_def[Qs]

schematic_goal qcow_snapshot_create_0_16_0x15f8f_0x15fda_73[blocks]:
  assumes \<open>(P_0x15f8f_73 && P_0x15f8f_73_regions) \<sigma>\<close>
  shows \<open>exec_block 16 0x15fda 73 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x15fde_73 ?\<sigma> \<and> block_usage P_0x15f8f_73_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x15f8f_73_def P_0x15f8f_73_regions_def post: Q_0x15fde_73_def regionset: P_0x15f8f_73_regions_set_def)

definition P_0x15fde_74 :: state_pred where
  \<open>P_0x15fde_74 \<sigma> \<equiv> RIP \<sigma> = 0x15fde \<and> RBX \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> RCX \<sigma> = ucast (((ucast (((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x1c),4]::32 word)::32 word))::32 word) << 3)) \<and> RDX \<sigma> = (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x190),8]::64 word) \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x78) \<and> R13 \<sigma> = qemu_malloc_0x15f51_retval \<and> R12 \<sigma> = RDI\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> regs \<sigma> ymm0w1 = 0x0 \<and> regs \<sigma> ymm0w0 = 0x0 \<and> regs \<sigma> ymm1w1 = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),8]::64 word) \<and> regs \<sigma> ymm1w0 = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x78),8]::64 word) \<and> regs \<sigma> ymm2w1 = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x60),8]::64 word) \<and> regs \<sigma> ymm2w0 = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),8]::64 word) \<and> regs \<sigma> ymm3w1 = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),8]::64 word) \<and> regs \<sigma> ymm3w0 = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),8]::64 word) \<and> (\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word) = ucast ((\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x180),8]::64 word) = (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x180),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x188),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x188),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x190),8]::64 word) = (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x190),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x1c),4]::32 word) = ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x1c),4]::32 word)) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x38),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x38),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x48),8]::64 word) = (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x190),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x188),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),8]::64 word) = (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x180),8]::64 word) \<and> (\<sigma> \<turnstile> *[((((RSP\<^sub>0::64 word) - 0x58)::64 word) + 0x8),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),8]::64 word) \<and> (\<sigma> \<turnstile> *[((((RSP\<^sub>0::64 word) - 0x68)::64 word) + 0x8),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x60),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),4]::32 word) = ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x1c),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((((RSP\<^sub>0::64 word) - 0x78)::64 word) + 0x8),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x78),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x78),8]::64 word) \<and> (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word),8]::64 word) = (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word),8]::64 word)\<close>
declare P_0x15fde_74_def[Ps]

definition P_0x15fde_74_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x15fde_74_regions_set \<sigma> \<equiv> {
    (0, RSI\<^sub>0, Suc 0),
    (1, RSP\<^sub>0, 8),
    (2, ((FS\<^sub>0::64 word) + 0x28), 8),
    (3, ((RDI\<^sub>0::64 word) + 0x40), 8),
    (4, ((RSI\<^sub>0::64 word) + 0x180), 8),
    (5, ((RSI\<^sub>0::64 word) + 0x188), 4),
    (6, ((RSI\<^sub>0::64 word) + 0x190), 8),
    (7, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x1c), 4),
    (8, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x38), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (11, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (12, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (13, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (14, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (15, ((RSP\<^sub>0::64 word) - 0x40), 8),
    (16, ((RSP\<^sub>0::64 word) - 0x48), 8),
    (17, ((RSP\<^sub>0::64 word) - 0x50), 4),
    (18, ((RSP\<^sub>0::64 word) - 0x50), 8),
    (19, ((RSP\<^sub>0::64 word) - 0x58), 8),
    (20, ((RSP\<^sub>0::64 word) - 0x60), 8),
    (21, ((RSP\<^sub>0::64 word) - 0x68), 8),
    (22, ((RSP\<^sub>0::64 word) - 0x70), 4),
    (23, ((RSP\<^sub>0::64 word) - 0x70), 8),
    (24, ((RSP\<^sub>0::64 word) - 0x78), 8),
    (25, ((RSP\<^sub>0::64 word) - 0x80), 8),
    (26, (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word), 8)
  }\<close>

definition P_0x15fde_74_regions :: state_pred where
  \<open>P_0x15fde_74_regions \<sigma> \<equiv> \<exists>regions. P_0x15fde_74_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {(17,18), (22,23)}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {(17,18), (18,17), (22,23), (23,22)}))
\<close>

definition Q_qcow_write_snapshots_addr_0x15fde_74 :: state_pred where
  \<open>Q_qcow_write_snapshots_addr_0x15fde_74 \<sigma> \<equiv> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x80) \<and> RIP \<sigma> = qcow_write_snapshots_addr \<and> RBX \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> RCX \<sigma> = ucast (((ucast (((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x1c),4]::32 word)::32 word))::32 word) << 3)) \<and> RDX \<sigma> = (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x190),8]::64 word) \<and> RDI \<sigma> = RDI\<^sub>0 \<and> R13 \<sigma> = qemu_malloc_0x15f51_retval \<and> R12 \<sigma> = RDI\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> regs \<sigma> ymm0w1 = 0x0 \<and> regs \<sigma> ymm0w0 = 0x0 \<and> regs \<sigma> ymm1w1 = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),8]::64 word) \<and> regs \<sigma> ymm1w0 = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x78),8]::64 word) \<and> regs \<sigma> ymm2w1 = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x60),8]::64 word) \<and> regs \<sigma> ymm2w0 = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),8]::64 word) \<and> regs \<sigma> ymm3w1 = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),8]::64 word) \<and> regs \<sigma> ymm3w0 = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),8]::64 word) \<and> (\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word) = ucast ((\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x180),8]::64 word) = (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x180),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x188),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x188),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x190),8]::64 word) = (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x190),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x1c),4]::32 word) = ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x1c),4]::32 word)) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x38),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x38),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x48),8]::64 word) = (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x190),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x188),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),8]::64 word) = (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x180),8]::64 word) \<and> (\<sigma> \<turnstile> *[((((RSP\<^sub>0::64 word) - 0x58)::64 word) + 0x8),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),8]::64 word) \<and> (\<sigma> \<turnstile> *[((((RSP\<^sub>0::64 word) - 0x68)::64 word) + 0x8),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x60),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),4]::32 word) = ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x1c),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((((RSP\<^sub>0::64 word) - 0x78)::64 word) + 0x8),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x78),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x78),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x80),8]::64 word) = 0x15fe3 \<and> (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word),8]::64 word) = (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word),8]::64 word)\<close>
declare Q_qcow_write_snapshots_addr_0x15fde_74_def[Qs]

schematic_goal qcow_snapshot_create_0_1_0x15fde_0x15fde_74[blocks]:
  assumes \<open>(P_0x15fde_74 && P_0x15fde_74_regions) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x15fde 74 \<sigma> \<triangleq> ?\<sigma> \<and> Q_qcow_write_snapshots_addr_0x15fde_74 ?\<sigma> \<and> block_usage P_0x15fde_74_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x15fde_74_def P_0x15fde_74_regions_def post: Q_qcow_write_snapshots_addr_0x15fde_74_def regionset: P_0x15fde_74_regions_set_def)

definition P_0x15fe3_75 :: state_pred where
  \<open>P_0x15fe3_75 \<sigma> \<equiv> RIP \<sigma> = 0x15fe3 \<and> RBX \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> RCX \<sigma> = ucast (((ucast (((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x1c),4]::32 word)::32 word))::32 word) << 3)) \<and> RDX \<sigma> = (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x190),8]::64 word) \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x78) \<and> R13 \<sigma> = qemu_malloc_0x15f51_retval \<and> R12 \<sigma> = RDI\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> regs \<sigma> ymm0w1 = 0x0 \<and> regs \<sigma> ymm0w0 = 0x0 \<and> regs \<sigma> ymm1w1 = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),8]::64 word) \<and> regs \<sigma> ymm1w0 = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x78),8]::64 word) \<and> regs \<sigma> ymm2w1 = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x60),8]::64 word) \<and> regs \<sigma> ymm2w0 = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),8]::64 word) \<and> regs \<sigma> ymm3w1 = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),8]::64 word) \<and> regs \<sigma> ymm3w0 = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),8]::64 word) \<and> (\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word) = ucast ((\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x180),8]::64 word) = (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x180),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x188),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x188),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x190),8]::64 word) = (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x190),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x1c),4]::32 word) = ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x1c),4]::32 word)) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x38),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x38),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x48),8]::64 word) = (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x190),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x188),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),8]::64 word) = (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x180),8]::64 word) \<and> (\<sigma> \<turnstile> *[((((RSP\<^sub>0::64 word) - 0x58)::64 word) + 0x8),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),8]::64 word) \<and> (\<sigma> \<turnstile> *[((((RSP\<^sub>0::64 word) - 0x68)::64 word) + 0x8),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x60),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),4]::32 word) = ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x1c),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((((RSP\<^sub>0::64 word) - 0x78)::64 word) + 0x8),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x78),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x78),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x80),8]::64 word) = 0x15fe3 \<and> (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word),8]::64 word) = (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word),8]::64 word)\<close>
declare P_0x15fe3_75_def[Ps]

definition P_0x15fe3_75_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x15fe3_75_regions_set \<sigma> \<equiv> {
    (0, RSI\<^sub>0, Suc 0),
    (1, RSP\<^sub>0, 8),
    (2, ((FS\<^sub>0::64 word) + 0x28), 8),
    (3, ((RDI\<^sub>0::64 word) + 0x40), 8),
    (4, ((RSI\<^sub>0::64 word) + 0x180), 8),
    (5, ((RSI\<^sub>0::64 word) + 0x188), 4),
    (6, ((RSI\<^sub>0::64 word) + 0x190), 8),
    (7, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x1c), 4),
    (8, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x38), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (11, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (12, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (13, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (14, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (15, ((RSP\<^sub>0::64 word) - 0x40), 8),
    (16, ((RSP\<^sub>0::64 word) - 0x48), 8),
    (17, ((RSP\<^sub>0::64 word) - 0x50), 4),
    (18, ((RSP\<^sub>0::64 word) - 0x50), 8),
    (19, ((RSP\<^sub>0::64 word) - 0x58), 8),
    (20, ((RSP\<^sub>0::64 word) - 0x60), 8),
    (21, ((RSP\<^sub>0::64 word) - 0x68), 8),
    (22, ((RSP\<^sub>0::64 word) - 0x70), 4),
    (23, ((RSP\<^sub>0::64 word) - 0x70), 8),
    (24, ((RSP\<^sub>0::64 word) - 0x78), 8),
    (25, ((RSP\<^sub>0::64 word) - 0x80), 8),
    (26, (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word), 8)
  }\<close>

definition P_0x15fe3_75_regions :: state_pred where
  \<open>P_0x15fe3_75_regions \<sigma> \<equiv> \<exists>regions. P_0x15fe3_75_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {(17,18), (22,23)}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {(17,18), (18,17), (22,23), (23,22)}))
\<close>

definition Q_0x15fe5_75 :: state_pred where
  \<open>Q_0x15fe5_75 \<sigma> \<equiv> RIP \<sigma> = 0x15fe5 \<and> RBX \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> RCX \<sigma> = ucast (((ucast (((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x1c),4]::32 word)::32 word))::32 word) << 3)) \<and> RDX \<sigma> = (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x190),8]::64 word) \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x78) \<and> R13 \<sigma> = qemu_malloc_0x15f51_retval \<and> R12 \<sigma> = RDI\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> regs \<sigma> ymm0w1 = 0x0 \<and> regs \<sigma> ymm0w0 = 0x0 \<and> regs \<sigma> ymm1w1 = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),8]::64 word) \<and> regs \<sigma> ymm1w0 = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x78),8]::64 word) \<and> regs \<sigma> ymm2w1 = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x60),8]::64 word) \<and> regs \<sigma> ymm2w0 = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),8]::64 word) \<and> regs \<sigma> ymm3w1 = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),8]::64 word) \<and> regs \<sigma> ymm3w0 = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),8]::64 word) \<and> (\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word) = ucast ((\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x180),8]::64 word) = (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x180),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x188),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x188),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x190),8]::64 word) = (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x190),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x1c),4]::32 word) = ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x1c),4]::32 word)) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x38),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x38),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x48),8]::64 word) = (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x190),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x188),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),8]::64 word) = (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x180),8]::64 word) \<and> (\<sigma> \<turnstile> *[((((RSP\<^sub>0::64 word) - 0x58)::64 word) + 0x8),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),8]::64 word) \<and> (\<sigma> \<turnstile> *[((((RSP\<^sub>0::64 word) - 0x68)::64 word) + 0x8),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x60),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),4]::32 word) = ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x1c),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((((RSP\<^sub>0::64 word) - 0x78)::64 word) + 0x8),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x78),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x78),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x80),8]::64 word) = 0x15fe3 \<and> (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word),8]::64 word) = (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word),8]::64 word)\<close>
declare Q_0x15fe5_75_def[Qs]

schematic_goal qcow_snapshot_create_0_1_0x15fe3_0x15fe3_75[blocks]:
  assumes \<open>(P_0x15fe3_75 && P_0x15fe3_75_regions) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x15fe3 75 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x15fe5_75 ?\<sigma> \<and> block_usage P_0x15fe3_75_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x15fe3_75_def P_0x15fe3_75_regions_def post: Q_0x15fe5_75_def regionset: P_0x15fe3_75_regions_set_def)

definition P_0x15fe5_true_76 :: state_pred where
  \<open>P_0x15fe5_true_76 \<sigma> \<equiv> RIP \<sigma> = 0x15fe5 \<and> RBX \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> RCX \<sigma> = ucast (((ucast (((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x1c),4]::32 word)::32 word))::32 word) << 3)) \<and> RDX \<sigma> = (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x190),8]::64 word) \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x78) \<and> R13 \<sigma> = qemu_malloc_0x15f51_retval \<and> R12 \<sigma> = RDI\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> regs \<sigma> ymm0w1 = 0x0 \<and> regs \<sigma> ymm0w0 = 0x0 \<and> regs \<sigma> ymm1w1 = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),8]::64 word) \<and> regs \<sigma> ymm1w0 = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x78),8]::64 word) \<and> regs \<sigma> ymm2w1 = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x60),8]::64 word) \<and> regs \<sigma> ymm2w0 = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),8]::64 word) \<and> regs \<sigma> ymm3w1 = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),8]::64 word) \<and> regs \<sigma> ymm3w0 = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),8]::64 word) \<and> (\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word) = ucast ((\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x180),8]::64 word) = (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x180),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x188),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x188),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x190),8]::64 word) = (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x190),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x1c),4]::32 word) = ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x1c),4]::32 word)) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x38),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x38),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x48),8]::64 word) = (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x190),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x188),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),8]::64 word) = (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x180),8]::64 word) \<and> (\<sigma> \<turnstile> *[((((RSP\<^sub>0::64 word) - 0x58)::64 word) + 0x8),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),8]::64 word) \<and> (\<sigma> \<turnstile> *[((((RSP\<^sub>0::64 word) - 0x68)::64 word) + 0x8),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x60),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),4]::32 word) = ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x1c),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((((RSP\<^sub>0::64 word) - 0x78)::64 word) + 0x8),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x78),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x78),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x80),8]::64 word) = 0x15fe3 \<and> (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word),8]::64 word) = (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word),8]::64 word)\<close>
declare P_0x15fe5_true_76_def[Ps]

definition P_0x15fe5_true_76_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x15fe5_true_76_regions_set \<sigma> \<equiv> {
    (0, RSI\<^sub>0, Suc 0),
    (1, RSP\<^sub>0, 8),
    (2, ((FS\<^sub>0::64 word) + 0x28), 8),
    (3, ((RDI\<^sub>0::64 word) + 0x40), 8),
    (4, ((RSI\<^sub>0::64 word) + 0x180), 8),
    (5, ((RSI\<^sub>0::64 word) + 0x188), 4),
    (6, ((RSI\<^sub>0::64 word) + 0x190), 8),
    (7, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x1c), 4),
    (8, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x38), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (11, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (12, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (13, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (14, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (15, ((RSP\<^sub>0::64 word) - 0x40), 8),
    (16, ((RSP\<^sub>0::64 word) - 0x48), 8),
    (17, ((RSP\<^sub>0::64 word) - 0x50), 4),
    (18, ((RSP\<^sub>0::64 word) - 0x50), 8),
    (19, ((RSP\<^sub>0::64 word) - 0x58), 8),
    (20, ((RSP\<^sub>0::64 word) - 0x60), 8),
    (21, ((RSP\<^sub>0::64 word) - 0x68), 8),
    (22, ((RSP\<^sub>0::64 word) - 0x70), 4),
    (23, ((RSP\<^sub>0::64 word) - 0x70), 8),
    (24, ((RSP\<^sub>0::64 word) - 0x78), 8),
    (25, ((RSP\<^sub>0::64 word) - 0x80), 8),
    (26, (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word), 8)
  }\<close>

definition P_0x15fe5_true_76_regions :: state_pred where
  \<open>P_0x15fe5_true_76_regions \<sigma> \<equiv> \<exists>regions. P_0x15fe5_true_76_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {(17,18), (22,23)}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {(17,18), (18,17), (22,23), (23,22)}))
\<close>

definition Q_0x1608f_76 :: state_pred where
  \<open>Q_0x1608f_76 \<sigma> \<equiv> RIP \<sigma> = 0x1608f \<and> RBX \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> RCX \<sigma> = ucast (((ucast (((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x1c),4]::32 word)::32 word))::32 word) << 3)) \<and> RDX \<sigma> = (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x190),8]::64 word) \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x78) \<and> R13 \<sigma> = 0x0 \<and> R12 \<sigma> = RDI\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> regs \<sigma> ymm0w1 = 0x0 \<and> regs \<sigma> ymm0w0 = 0x0 \<and> regs \<sigma> ymm1w1 = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),8]::64 word) \<and> regs \<sigma> ymm1w0 = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x78),8]::64 word) \<and> regs \<sigma> ymm2w1 = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x60),8]::64 word) \<and> regs \<sigma> ymm2w0 = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),8]::64 word) \<and> regs \<sigma> ymm3w1 = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),8]::64 word) \<and> regs \<sigma> ymm3w0 = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),8]::64 word) \<and> (\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word) = ucast ((\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x180),8]::64 word) = (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x180),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x188),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x188),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x190),8]::64 word) = (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x190),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x1c),4]::32 word) = ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x1c),4]::32 word)) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x38),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x38),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x48),8]::64 word) = (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x190),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x188),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),8]::64 word) = (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x180),8]::64 word) \<and> (\<sigma> \<turnstile> *[((((RSP\<^sub>0::64 word) - 0x58)::64 word) + 0x8),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),8]::64 word) \<and> (\<sigma> \<turnstile> *[((((RSP\<^sub>0::64 word) - 0x68)::64 word) + 0x8),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x60),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),4]::32 word) = ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x1c),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((((RSP\<^sub>0::64 word) - 0x78)::64 word) + 0x8),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x78),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x78),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x80),8]::64 word) = 0x15fe3 \<and> (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word),8]::64 word) = (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word),8]::64 word)\<close>
declare Q_0x1608f_76_def[Qs]

schematic_goal qcow_snapshot_create_0_2_0x15fe5_0x1608c_76[blocks]:
  assumes \<open>(P_0x15fe5_true_76 && P_0x15fe5_true_76_regions && SF) \<sigma>\<close>
  shows \<open>exec_block 2 0x1608c 76 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x1608f_76 ?\<sigma> \<and> block_usage P_0x15fe5_true_76_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x15fe5_true_76_def P_0x15fe5_true_76_regions_def post: Q_0x1608f_76_def regionset: P_0x15fe5_true_76_regions_set_def)

definition P_0x1608f_77 :: state_pred where
  \<open>P_0x1608f_77 \<sigma> \<equiv> RIP \<sigma> = 0x1608f \<and> RBX \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> RCX \<sigma> = ucast (((ucast (((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x1c),4]::32 word)::32 word))::32 word) << 3)) \<and> RDX \<sigma> = (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x190),8]::64 word) \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x78) \<and> R13 \<sigma> = 0x0 \<and> R12 \<sigma> = RDI\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> regs \<sigma> ymm0w1 = 0x0 \<and> regs \<sigma> ymm0w0 = 0x0 \<and> regs \<sigma> ymm1w1 = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),8]::64 word) \<and> regs \<sigma> ymm1w0 = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x78),8]::64 word) \<and> regs \<sigma> ymm2w1 = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x60),8]::64 word) \<and> regs \<sigma> ymm2w0 = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),8]::64 word) \<and> regs \<sigma> ymm3w1 = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),8]::64 word) \<and> regs \<sigma> ymm3w0 = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),8]::64 word) \<and> (\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word) = ucast ((\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x180),8]::64 word) = (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x180),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x188),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x188),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x190),8]::64 word) = (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x190),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x1c),4]::32 word) = ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x1c),4]::32 word)) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x38),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x38),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x48),8]::64 word) = (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x190),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x188),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),8]::64 word) = (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x180),8]::64 word) \<and> (\<sigma> \<turnstile> *[((((RSP\<^sub>0::64 word) - 0x58)::64 word) + 0x8),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),8]::64 word) \<and> (\<sigma> \<turnstile> *[((((RSP\<^sub>0::64 word) - 0x68)::64 word) + 0x8),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x60),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),4]::32 word) = ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x1c),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((((RSP\<^sub>0::64 word) - 0x78)::64 word) + 0x8),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x78),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x78),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x80),8]::64 word) = 0x15fe3 \<and> (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word),8]::64 word) = (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word),8]::64 word)\<close>
declare P_0x1608f_77_def[Ps]

definition P_0x1608f_77_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x1608f_77_regions_set \<sigma> \<equiv> {
    (0, RSI\<^sub>0, Suc 0),
    (1, RSP\<^sub>0, 8),
    (2, ((FS\<^sub>0::64 word) + 0x28), 8),
    (3, ((RDI\<^sub>0::64 word) + 0x40), 8),
    (4, ((RSI\<^sub>0::64 word) + 0x180), 8),
    (5, ((RSI\<^sub>0::64 word) + 0x188), 4),
    (6, ((RSI\<^sub>0::64 word) + 0x190), 8),
    (7, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x1c), 4),
    (8, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x38), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (11, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (12, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (13, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (14, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (15, ((RSP\<^sub>0::64 word) - 0x40), 8),
    (16, ((RSP\<^sub>0::64 word) - 0x48), 8),
    (17, ((RSP\<^sub>0::64 word) - 0x50), 4),
    (18, ((RSP\<^sub>0::64 word) - 0x50), 8),
    (19, ((RSP\<^sub>0::64 word) - 0x58), 8),
    (20, ((RSP\<^sub>0::64 word) - 0x60), 8),
    (21, ((RSP\<^sub>0::64 word) - 0x68), 8),
    (22, ((RSP\<^sub>0::64 word) - 0x70), 4),
    (23, ((RSP\<^sub>0::64 word) - 0x70), 8),
    (24, ((RSP\<^sub>0::64 word) - 0x78), 8),
    (25, ((RSP\<^sub>0::64 word) - 0x80), 8),
    (26, (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word), 8)
  }\<close>

definition P_0x1608f_77_regions :: state_pred where
  \<open>P_0x1608f_77_regions \<sigma> \<equiv> \<exists>regions. P_0x1608f_77_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {(17,18), (22,23)}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {(17,18), (18,17), (22,23), (23,22)}))
\<close>

definition Q_0x16092_77 :: state_pred where
  \<open>Q_0x16092_77 \<sigma> \<equiv> RIP \<sigma> = 0x16092 \<and> RBX \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> RCX \<sigma> = ucast (((ucast (((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x1c),4]::32 word)::32 word))::32 word) << 3)) \<and> RDX \<sigma> = (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x190),8]::64 word) \<and> RDI \<sigma> = RBP \<sigma> \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x78) \<and> R13 \<sigma> = 0x0 \<and> R12 \<sigma> = RDI\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> regs \<sigma> ymm0w1 = 0x0 \<and> regs \<sigma> ymm0w0 = 0x0 \<and> regs \<sigma> ymm1w1 = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),8]::64 word) \<and> regs \<sigma> ymm1w0 = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x78),8]::64 word) \<and> regs \<sigma> ymm2w1 = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x60),8]::64 word) \<and> regs \<sigma> ymm2w0 = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),8]::64 word) \<and> regs \<sigma> ymm3w1 = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),8]::64 word) \<and> regs \<sigma> ymm3w0 = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),8]::64 word) \<and> (\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word) = ucast ((\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x180),8]::64 word) = (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x180),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x188),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x188),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x190),8]::64 word) = (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x190),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x1c),4]::32 word) = ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x1c),4]::32 word)) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x38),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x38),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x48),8]::64 word) = (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x190),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x188),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),8]::64 word) = (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x180),8]::64 word) \<and> (\<sigma> \<turnstile> *[((((RSP\<^sub>0::64 word) - 0x58)::64 word) + 0x8),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),8]::64 word) \<and> (\<sigma> \<turnstile> *[((((RSP\<^sub>0::64 word) - 0x68)::64 word) + 0x8),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x60),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),4]::32 word) = ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x1c),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((((RSP\<^sub>0::64 word) - 0x78)::64 word) + 0x8),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x78),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x78),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x80),8]::64 word) = 0x15fe3 \<and> (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word),8]::64 word) = (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word),8]::64 word)\<close>
declare Q_0x16092_77_def[Qs]

schematic_goal qcow_snapshot_create_0_1_0x1608f_0x1608f_77[blocks]:
  assumes \<open>(P_0x1608f_77 && P_0x1608f_77_regions) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x1608f 77 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x16092_77 ?\<sigma> \<and> block_usage P_0x1608f_77_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x1608f_77_def P_0x1608f_77_regions_def post: Q_0x16092_77_def regionset: P_0x1608f_77_regions_set_def)

definition P_0x16092_78 :: state_pred where
  \<open>P_0x16092_78 \<sigma> \<equiv> RIP \<sigma> = 0x16092 \<and> RBX \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> RCX \<sigma> = ucast (((ucast (((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x1c),4]::32 word)::32 word))::32 word) << 3)) \<and> RDX \<sigma> = (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x190),8]::64 word) \<and> RDI \<sigma> = RBP \<sigma> \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x78) \<and> R13 \<sigma> = 0x0 \<and> R12 \<sigma> = RDI\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> regs \<sigma> ymm0w1 = 0x0 \<and> regs \<sigma> ymm0w0 = 0x0 \<and> regs \<sigma> ymm1w1 = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),8]::64 word) \<and> regs \<sigma> ymm1w0 = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x78),8]::64 word) \<and> regs \<sigma> ymm2w1 = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x60),8]::64 word) \<and> regs \<sigma> ymm2w0 = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),8]::64 word) \<and> regs \<sigma> ymm3w1 = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),8]::64 word) \<and> regs \<sigma> ymm3w0 = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),8]::64 word) \<and> (\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word) = ucast ((\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x180),8]::64 word) = (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x180),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x188),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x188),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x190),8]::64 word) = (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x190),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x1c),4]::32 word) = ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x1c),4]::32 word)) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x38),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x38),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x48),8]::64 word) = (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x190),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x188),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),8]::64 word) = (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x180),8]::64 word) \<and> (\<sigma> \<turnstile> *[((((RSP\<^sub>0::64 word) - 0x58)::64 word) + 0x8),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),8]::64 word) \<and> (\<sigma> \<turnstile> *[((((RSP\<^sub>0::64 word) - 0x68)::64 word) + 0x8),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x60),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),4]::32 word) = ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x1c),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((((RSP\<^sub>0::64 word) - 0x78)::64 word) + 0x8),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x78),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x78),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x80),8]::64 word) = 0x15fe3 \<and> (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word),8]::64 word) = (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word),8]::64 word)\<close>
declare P_0x16092_78_def[Ps]

definition P_0x16092_78_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x16092_78_regions_set \<sigma> \<equiv> {
    (0, RSI\<^sub>0, Suc 0),
    (1, RSP\<^sub>0, 8),
    (2, ((FS\<^sub>0::64 word) + 0x28), 8),
    (3, ((RDI\<^sub>0::64 word) + 0x40), 8),
    (4, ((RSI\<^sub>0::64 word) + 0x180), 8),
    (5, ((RSI\<^sub>0::64 word) + 0x188), 4),
    (6, ((RSI\<^sub>0::64 word) + 0x190), 8),
    (7, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x1c), 4),
    (8, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x38), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (11, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (12, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (13, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (14, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (15, ((RSP\<^sub>0::64 word) - 0x40), 8),
    (16, ((RSP\<^sub>0::64 word) - 0x48), 8),
    (17, ((RSP\<^sub>0::64 word) - 0x50), 4),
    (18, ((RSP\<^sub>0::64 word) - 0x50), 8),
    (19, ((RSP\<^sub>0::64 word) - 0x58), 8),
    (20, ((RSP\<^sub>0::64 word) - 0x60), 8),
    (21, ((RSP\<^sub>0::64 word) - 0x68), 8),
    (22, ((RSP\<^sub>0::64 word) - 0x70), 4),
    (23, ((RSP\<^sub>0::64 word) - 0x70), 8),
    (24, ((RSP\<^sub>0::64 word) - 0x78), 8),
    (25, ((RSP\<^sub>0::64 word) - 0x80), 8),
    (26, (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word), 8)
  }\<close>

definition P_0x16092_78_regions :: state_pred where
  \<open>P_0x16092_78_regions \<sigma> \<equiv> \<exists>regions. P_0x16092_78_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {(17,18), (22,23)}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {(17,18), (18,17), (22,23), (23,22)}))
\<close>

definition Q_qemu_free_addr_0x16092_78 :: state_pred where
  \<open>Q_qemu_free_addr_0x16092_78 \<sigma> \<equiv> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x80) \<and> RIP \<sigma> = qemu_free_addr \<and> RBX \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> RCX \<sigma> = ucast (((ucast (((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x1c),4]::32 word)::32 word))::32 word) << 3)) \<and> RDX \<sigma> = (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x190),8]::64 word) \<and> RDI \<sigma> = RBP \<sigma> \<and> R13 \<sigma> = 0x0 \<and> R12 \<sigma> = RDI\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> regs \<sigma> ymm0w1 = 0x0 \<and> regs \<sigma> ymm0w0 = 0x0 \<and> regs \<sigma> ymm1w1 = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),8]::64 word) \<and> regs \<sigma> ymm1w0 = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x78),8]::64 word) \<and> regs \<sigma> ymm2w1 = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x60),8]::64 word) \<and> regs \<sigma> ymm2w0 = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),8]::64 word) \<and> regs \<sigma> ymm3w1 = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),8]::64 word) \<and> regs \<sigma> ymm3w0 = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),8]::64 word) \<and> (\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word) = ucast ((\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x180),8]::64 word) = (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x180),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x188),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x188),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x190),8]::64 word) = (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x190),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x1c),4]::32 word) = ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x1c),4]::32 word)) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x38),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x38),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x48),8]::64 word) = (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x190),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x188),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),8]::64 word) = (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x180),8]::64 word) \<and> (\<sigma> \<turnstile> *[((((RSP\<^sub>0::64 word) - 0x58)::64 word) + 0x8),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),8]::64 word) \<and> (\<sigma> \<turnstile> *[((((RSP\<^sub>0::64 word) - 0x68)::64 word) + 0x8),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x60),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),4]::32 word) = ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x1c),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((((RSP\<^sub>0::64 word) - 0x78)::64 word) + 0x8),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x78),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x78),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x80),8]::64 word) = 0x16097 \<and> (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word),8]::64 word) = (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word),8]::64 word)\<close>
declare Q_qemu_free_addr_0x16092_78_def[Qs]

schematic_goal qcow_snapshot_create_0_1_0x16092_0x16092_78[blocks]:
  assumes \<open>(P_0x16092_78 && P_0x16092_78_regions) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x16092 78 \<sigma> \<triangleq> ?\<sigma> \<and> Q_qemu_free_addr_0x16092_78 ?\<sigma> \<and> block_usage P_0x16092_78_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x16092_78_def P_0x16092_78_regions_def post: Q_qemu_free_addr_0x16092_78_def regionset: P_0x16092_78_regions_set_def)

definition P_0x16097_79 :: state_pred where
  \<open>P_0x16097_79 \<sigma> \<equiv> RIP \<sigma> = 0x16097 \<and> RBX \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> RCX \<sigma> = ucast (((ucast (((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x1c),4]::32 word)::32 word))::32 word) << 3)) \<and> RDX \<sigma> = (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x190),8]::64 word) \<and> RDI \<sigma> = RBP \<sigma> \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x78) \<and> R13 \<sigma> = 0x0 \<and> R12 \<sigma> = RDI\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> regs \<sigma> ymm0w1 = 0x0 \<and> regs \<sigma> ymm0w0 = 0x0 \<and> regs \<sigma> ymm1w1 = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),8]::64 word) \<and> regs \<sigma> ymm1w0 = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x78),8]::64 word) \<and> regs \<sigma> ymm2w1 = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x60),8]::64 word) \<and> regs \<sigma> ymm2w0 = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),8]::64 word) \<and> regs \<sigma> ymm3w1 = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),8]::64 word) \<and> regs \<sigma> ymm3w0 = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),8]::64 word) \<and> (\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word) = ucast ((\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x180),8]::64 word) = (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x180),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x188),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x188),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x190),8]::64 word) = (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x190),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x1c),4]::32 word) = ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x1c),4]::32 word)) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x38),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x38),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x48),8]::64 word) = (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x190),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x188),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),8]::64 word) = (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x180),8]::64 word) \<and> (\<sigma> \<turnstile> *[((((RSP\<^sub>0::64 word) - 0x58)::64 word) + 0x8),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),8]::64 word) \<and> (\<sigma> \<turnstile> *[((((RSP\<^sub>0::64 word) - 0x68)::64 word) + 0x8),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x60),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),4]::32 word) = ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x1c),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((((RSP\<^sub>0::64 word) - 0x78)::64 word) + 0x8),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x78),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x78),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x80),8]::64 word) = 0x16097 \<and> (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word),8]::64 word) = (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word),8]::64 word)\<close>
declare P_0x16097_79_def[Ps]

definition P_0x16097_79_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x16097_79_regions_set \<sigma> \<equiv> {
    (0, RSI\<^sub>0, Suc 0),
    (1, RSP\<^sub>0, 8),
    (2, ((FS\<^sub>0::64 word) + 0x28), 8),
    (3, ((RDI\<^sub>0::64 word) + 0x40), 8),
    (4, ((RSI\<^sub>0::64 word) + 0x180), 8),
    (5, ((RSI\<^sub>0::64 word) + 0x188), 4),
    (6, ((RSI\<^sub>0::64 word) + 0x190), 8),
    (7, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x1c), 4),
    (8, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x38), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (11, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (12, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (13, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (14, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (15, ((RSP\<^sub>0::64 word) - 0x40), 8),
    (16, ((RSP\<^sub>0::64 word) - 0x48), 8),
    (17, ((RSP\<^sub>0::64 word) - 0x50), 4),
    (18, ((RSP\<^sub>0::64 word) - 0x50), 8),
    (19, ((RSP\<^sub>0::64 word) - 0x58), 8),
    (20, ((RSP\<^sub>0::64 word) - 0x60), 8),
    (21, ((RSP\<^sub>0::64 word) - 0x68), 8),
    (22, ((RSP\<^sub>0::64 word) - 0x70), 4),
    (23, ((RSP\<^sub>0::64 word) - 0x70), 8),
    (24, ((RSP\<^sub>0::64 word) - 0x78), 8),
    (25, ((RSP\<^sub>0::64 word) - 0x80), 8),
    (26, (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word), 8)
  }\<close>

definition P_0x16097_79_regions :: state_pred where
  \<open>P_0x16097_79_regions \<sigma> \<equiv> \<exists>regions. P_0x16097_79_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {(17,18), (22,23)}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {(17,18), (18,17), (22,23), (23,22)}))
\<close>

definition Q_0x1609a_79 :: state_pred where
  \<open>Q_0x1609a_79 \<sigma> \<equiv> RIP \<sigma> = 0x1609a \<and> RBX \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> RCX \<sigma> = ucast (((ucast (((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x1c),4]::32 word)::32 word))::32 word) << 3)) \<and> RDX \<sigma> = (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x190),8]::64 word) \<and> RDI \<sigma> = 0x0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x78) \<and> R13 \<sigma> = 0x0 \<and> R12 \<sigma> = RDI\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> regs \<sigma> ymm0w1 = 0x0 \<and> regs \<sigma> ymm0w0 = 0x0 \<and> regs \<sigma> ymm1w1 = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),8]::64 word) \<and> regs \<sigma> ymm1w0 = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x78),8]::64 word) \<and> regs \<sigma> ymm2w1 = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x60),8]::64 word) \<and> regs \<sigma> ymm2w0 = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),8]::64 word) \<and> regs \<sigma> ymm3w1 = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),8]::64 word) \<and> regs \<sigma> ymm3w0 = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),8]::64 word) \<and> (\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word) = ucast ((\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x180),8]::64 word) = (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x180),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x188),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x188),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x190),8]::64 word) = (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x190),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x1c),4]::32 word) = ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x1c),4]::32 word)) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x38),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x38),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x48),8]::64 word) = (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x190),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x188),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),8]::64 word) = (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x180),8]::64 word) \<and> (\<sigma> \<turnstile> *[((((RSP\<^sub>0::64 word) - 0x58)::64 word) + 0x8),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),8]::64 word) \<and> (\<sigma> \<turnstile> *[((((RSP\<^sub>0::64 word) - 0x68)::64 word) + 0x8),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x60),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),4]::32 word) = ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x1c),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((((RSP\<^sub>0::64 word) - 0x78)::64 word) + 0x8),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x78),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x78),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x80),8]::64 word) = 0x16097 \<and> (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word),8]::64 word) = (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word),8]::64 word)\<close>
declare Q_0x1609a_79_def[Qs]

schematic_goal qcow_snapshot_create_0_1_0x16097_0x16097_79[blocks]:
  assumes \<open>(P_0x16097_79 && P_0x16097_79_regions) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x16097 79 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x1609a_79 ?\<sigma> \<and> block_usage P_0x16097_79_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x16097_79_def P_0x16097_79_regions_def post: Q_0x1609a_79_def regionset: P_0x16097_79_regions_set_def)

definition P_0x1609a_80 :: state_pred where
  \<open>P_0x1609a_80 \<sigma> \<equiv> RIP \<sigma> = 0x1609a \<and> RBX \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> RCX \<sigma> = ucast (((ucast (((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x1c),4]::32 word)::32 word))::32 word) << 3)) \<and> RDX \<sigma> = (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x190),8]::64 word) \<and> RDI \<sigma> = 0x0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x78) \<and> R13 \<sigma> = 0x0 \<and> R12 \<sigma> = RDI\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> regs \<sigma> ymm0w1 = 0x0 \<and> regs \<sigma> ymm0w0 = 0x0 \<and> regs \<sigma> ymm1w1 = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),8]::64 word) \<and> regs \<sigma> ymm1w0 = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x78),8]::64 word) \<and> regs \<sigma> ymm2w1 = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x60),8]::64 word) \<and> regs \<sigma> ymm2w0 = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),8]::64 word) \<and> regs \<sigma> ymm3w1 = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),8]::64 word) \<and> regs \<sigma> ymm3w0 = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),8]::64 word) \<and> (\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word) = ucast ((\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x180),8]::64 word) = (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x180),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x188),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x188),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x190),8]::64 word) = (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x190),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x1c),4]::32 word) = ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x1c),4]::32 word)) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x38),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x38),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x48),8]::64 word) = (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x190),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x188),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),8]::64 word) = (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x180),8]::64 word) \<and> (\<sigma> \<turnstile> *[((((RSP\<^sub>0::64 word) - 0x58)::64 word) + 0x8),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),8]::64 word) \<and> (\<sigma> \<turnstile> *[((((RSP\<^sub>0::64 word) - 0x68)::64 word) + 0x8),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x60),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),4]::32 word) = ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x1c),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((((RSP\<^sub>0::64 word) - 0x78)::64 word) + 0x8),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x78),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x78),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x80),8]::64 word) = 0x16097 \<and> (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word),8]::64 word) = (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word),8]::64 word)\<close>
declare P_0x1609a_80_def[Ps]

definition P_0x1609a_80_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x1609a_80_regions_set \<sigma> \<equiv> {
    (0, RSI\<^sub>0, Suc 0),
    (1, RSP\<^sub>0, 8),
    (2, ((FS\<^sub>0::64 word) + 0x28), 8),
    (3, ((RDI\<^sub>0::64 word) + 0x40), 8),
    (4, ((RSI\<^sub>0::64 word) + 0x180), 8),
    (5, ((RSI\<^sub>0::64 word) + 0x188), 4),
    (6, ((RSI\<^sub>0::64 word) + 0x190), 8),
    (7, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x1c), 4),
    (8, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x38), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (11, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (12, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (13, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (14, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (15, ((RSP\<^sub>0::64 word) - 0x40), 8),
    (16, ((RSP\<^sub>0::64 word) - 0x48), 8),
    (17, ((RSP\<^sub>0::64 word) - 0x50), 4),
    (18, ((RSP\<^sub>0::64 word) - 0x50), 8),
    (19, ((RSP\<^sub>0::64 word) - 0x58), 8),
    (20, ((RSP\<^sub>0::64 word) - 0x60), 8),
    (21, ((RSP\<^sub>0::64 word) - 0x68), 8),
    (22, ((RSP\<^sub>0::64 word) - 0x70), 4),
    (23, ((RSP\<^sub>0::64 word) - 0x70), 8),
    (24, ((RSP\<^sub>0::64 word) - 0x78), 8),
    (25, ((RSP\<^sub>0::64 word) - 0x80), 8),
    (26, (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word), 8)
  }\<close>

definition P_0x1609a_80_regions :: state_pred where
  \<open>P_0x1609a_80_regions \<sigma> \<equiv> \<exists>regions. P_0x1609a_80_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {(17,18), (22,23)}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {(17,18), (18,17), (22,23), (23,22)}))
\<close>

definition Q_qemu_free_addr_0x1609a_80 :: state_pred where
  \<open>Q_qemu_free_addr_0x1609a_80 \<sigma> \<equiv> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x80) \<and> RIP \<sigma> = qemu_free_addr \<and> RBX \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> RCX \<sigma> = ucast (((ucast (((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x1c),4]::32 word)::32 word))::32 word) << 3)) \<and> RDX \<sigma> = (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x190),8]::64 word) \<and> RDI \<sigma> = 0x0 \<and> R13 \<sigma> = 0x0 \<and> R12 \<sigma> = RDI\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> regs \<sigma> ymm0w1 = 0x0 \<and> regs \<sigma> ymm0w0 = 0x0 \<and> regs \<sigma> ymm1w1 = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),8]::64 word) \<and> regs \<sigma> ymm1w0 = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x78),8]::64 word) \<and> regs \<sigma> ymm2w1 = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x60),8]::64 word) \<and> regs \<sigma> ymm2w0 = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),8]::64 word) \<and> regs \<sigma> ymm3w1 = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),8]::64 word) \<and> regs \<sigma> ymm3w0 = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),8]::64 word) \<and> (\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word) = ucast ((\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x180),8]::64 word) = (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x180),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x188),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x188),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x190),8]::64 word) = (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x190),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x1c),4]::32 word) = ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x1c),4]::32 word)) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x38),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x38),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x48),8]::64 word) = (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x190),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x188),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),8]::64 word) = (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x180),8]::64 word) \<and> (\<sigma> \<turnstile> *[((((RSP\<^sub>0::64 word) - 0x58)::64 word) + 0x8),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),8]::64 word) \<and> (\<sigma> \<turnstile> *[((((RSP\<^sub>0::64 word) - 0x68)::64 word) + 0x8),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x60),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),4]::32 word) = ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x1c),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((((RSP\<^sub>0::64 word) - 0x78)::64 word) + 0x8),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x78),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x78),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x80),8]::64 word) = 0x1609f \<and> (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word),8]::64 word) = (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word),8]::64 word)\<close>
declare Q_qemu_free_addr_0x1609a_80_def[Qs]

schematic_goal qcow_snapshot_create_0_1_0x1609a_0x1609a_80[blocks]:
  assumes \<open>(P_0x1609a_80 && P_0x1609a_80_regions) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x1609a 80 \<sigma> \<triangleq> ?\<sigma> \<and> Q_qemu_free_addr_0x1609a_80 ?\<sigma> \<and> block_usage P_0x1609a_80_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x1609a_80_def P_0x1609a_80_regions_def post: Q_qemu_free_addr_0x1609a_80_def regionset: P_0x1609a_80_regions_set_def)

definition P_0x1609f_81 :: state_pred where
  \<open>P_0x1609f_81 \<sigma> \<equiv> RIP \<sigma> = 0x1609f \<and> RBX \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> RCX \<sigma> = ucast (((ucast (((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x1c),4]::32 word)::32 word))::32 word) << 3)) \<and> RDX \<sigma> = (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x190),8]::64 word) \<and> RDI \<sigma> = 0x0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x78) \<and> R13 \<sigma> = 0x0 \<and> R12 \<sigma> = RDI\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> regs \<sigma> ymm0w1 = 0x0 \<and> regs \<sigma> ymm0w0 = 0x0 \<and> regs \<sigma> ymm1w1 = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),8]::64 word) \<and> regs \<sigma> ymm1w0 = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x78),8]::64 word) \<and> regs \<sigma> ymm2w1 = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x60),8]::64 word) \<and> regs \<sigma> ymm2w0 = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),8]::64 word) \<and> regs \<sigma> ymm3w1 = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),8]::64 word) \<and> regs \<sigma> ymm3w0 = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),8]::64 word) \<and> (\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word) = ucast ((\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x180),8]::64 word) = (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x180),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x188),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x188),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x190),8]::64 word) = (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x190),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x1c),4]::32 word) = ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x1c),4]::32 word)) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x38),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x38),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x48),8]::64 word) = (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x190),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x188),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),8]::64 word) = (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x180),8]::64 word) \<and> (\<sigma> \<turnstile> *[((((RSP\<^sub>0::64 word) - 0x58)::64 word) + 0x8),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),8]::64 word) \<and> (\<sigma> \<turnstile> *[((((RSP\<^sub>0::64 word) - 0x68)::64 word) + 0x8),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x60),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),4]::32 word) = ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x1c),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((((RSP\<^sub>0::64 word) - 0x78)::64 word) + 0x8),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x78),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x78),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x80),8]::64 word) = 0x1609f \<and> (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word),8]::64 word) = (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word),8]::64 word)\<close>
declare P_0x1609f_81_def[Ps]

definition P_0x1609f_81_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x1609f_81_regions_set \<sigma> \<equiv> {
    (0, RSI\<^sub>0, Suc 0),
    (1, RSP\<^sub>0, 8),
    (2, ((FS\<^sub>0::64 word) + 0x28), 8),
    (3, ((RDI\<^sub>0::64 word) + 0x40), 8),
    (4, ((RSI\<^sub>0::64 word) + 0x180), 8),
    (5, ((RSI\<^sub>0::64 word) + 0x188), 4),
    (6, ((RSI\<^sub>0::64 word) + 0x190), 8),
    (7, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x1c), 4),
    (8, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x38), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (11, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (12, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (13, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (14, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (15, ((RSP\<^sub>0::64 word) - 0x40), 8),
    (16, ((RSP\<^sub>0::64 word) - 0x48), 8),
    (17, ((RSP\<^sub>0::64 word) - 0x50), 4),
    (18, ((RSP\<^sub>0::64 word) - 0x50), 8),
    (19, ((RSP\<^sub>0::64 word) - 0x58), 8),
    (20, ((RSP\<^sub>0::64 word) - 0x60), 8),
    (21, ((RSP\<^sub>0::64 word) - 0x68), 8),
    (22, ((RSP\<^sub>0::64 word) - 0x70), 4),
    (23, ((RSP\<^sub>0::64 word) - 0x70), 8),
    (24, ((RSP\<^sub>0::64 word) - 0x78), 8),
    (25, ((RSP\<^sub>0::64 word) - 0x80), 8),
    (26, (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word), 8)
  }\<close>

definition P_0x1609f_81_regions :: state_pred where
  \<open>P_0x1609f_81_regions \<sigma> \<equiv> \<exists>regions. P_0x1609f_81_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {(17,18), (22,23)}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {(17,18), (18,17), (22,23), (23,22)}))
\<close>

definition Q_0x15fed_81 :: state_pred where
  \<open>Q_0x15fed_81 \<sigma> \<equiv> RIP \<sigma> = 0x15fed \<and> RBX \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x78) \<and> R12 \<sigma> = RDI\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> regs \<sigma> ymm0w1 = 0x0 \<and> regs \<sigma> ymm0w0 = 0x0 \<and> (\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word) = ucast ((\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word)\<close>
declare Q_0x15fed_81_def[Qs]

schematic_goal qcow_snapshot_create_0_2_0x1609f_0x160a4_81[blocks]:
  assumes \<open>(P_0x1609f_81 && P_0x1609f_81_regions) \<sigma>\<close>
  shows \<open>exec_block 2 0x160a4 81 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x15fed_81 ?\<sigma> \<and> block_usage P_0x1609f_81_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x1609f_81_def P_0x1609f_81_regions_def post: Q_0x15fed_81_def regionset: P_0x1609f_81_regions_set_def)

definition P_0x15fe5_false_82 :: state_pred where
  \<open>P_0x15fe5_false_82 \<sigma> \<equiv> RIP \<sigma> = 0x15fe5 \<and> RBX \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> RCX \<sigma> = ucast (((ucast (((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x1c),4]::32 word)::32 word))::32 word) << 3)) \<and> RDX \<sigma> = (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x190),8]::64 word) \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x78) \<and> R13 \<sigma> = qemu_malloc_0x15f51_retval \<and> R12 \<sigma> = RDI\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> regs \<sigma> ymm0w1 = 0x0 \<and> regs \<sigma> ymm0w0 = 0x0 \<and> regs \<sigma> ymm1w1 = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),8]::64 word) \<and> regs \<sigma> ymm1w0 = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x78),8]::64 word) \<and> regs \<sigma> ymm2w1 = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x60),8]::64 word) \<and> regs \<sigma> ymm2w0 = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),8]::64 word) \<and> regs \<sigma> ymm3w1 = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),8]::64 word) \<and> regs \<sigma> ymm3w0 = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),8]::64 word) \<and> (\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word) = ucast ((\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x180),8]::64 word) = (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x180),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x188),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x188),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x190),8]::64 word) = (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x190),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x1c),4]::32 word) = ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x1c),4]::32 word)) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x38),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x38),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x48),8]::64 word) = (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x190),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x188),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),8]::64 word) = (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x180),8]::64 word) \<and> (\<sigma> \<turnstile> *[((((RSP\<^sub>0::64 word) - 0x58)::64 word) + 0x8),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),8]::64 word) \<and> (\<sigma> \<turnstile> *[((((RSP\<^sub>0::64 word) - 0x68)::64 word) + 0x8),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x60),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),4]::32 word) = ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x1c),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((((RSP\<^sub>0::64 word) - 0x78)::64 word) + 0x8),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x78),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x78),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x80),8]::64 word) = 0x15fe3 \<and> (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word),8]::64 word) = (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word),8]::64 word)\<close>
declare P_0x15fe5_false_82_def[Ps]

definition P_0x15fe5_false_82_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x15fe5_false_82_regions_set \<sigma> \<equiv> {
    (0, RSI\<^sub>0, Suc 0),
    (1, RSP\<^sub>0, 8),
    (2, ((FS\<^sub>0::64 word) + 0x28), 8),
    (3, ((RDI\<^sub>0::64 word) + 0x40), 8),
    (4, ((RSI\<^sub>0::64 word) + 0x180), 8),
    (5, ((RSI\<^sub>0::64 word) + 0x188), 4),
    (6, ((RSI\<^sub>0::64 word) + 0x190), 8),
    (7, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x1c), 4),
    (8, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x38), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (11, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (12, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (13, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (14, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (15, ((RSP\<^sub>0::64 word) - 0x40), 8),
    (16, ((RSP\<^sub>0::64 word) - 0x48), 8),
    (17, ((RSP\<^sub>0::64 word) - 0x50), 4),
    (18, ((RSP\<^sub>0::64 word) - 0x50), 8),
    (19, ((RSP\<^sub>0::64 word) - 0x58), 8),
    (20, ((RSP\<^sub>0::64 word) - 0x60), 8),
    (21, ((RSP\<^sub>0::64 word) - 0x68), 8),
    (22, ((RSP\<^sub>0::64 word) - 0x70), 4),
    (23, ((RSP\<^sub>0::64 word) - 0x70), 8),
    (24, ((RSP\<^sub>0::64 word) - 0x78), 8),
    (25, ((RSP\<^sub>0::64 word) - 0x80), 8),
    (26, (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word), 8)
  }\<close>

definition P_0x15fe5_false_82_regions :: state_pred where
  \<open>P_0x15fe5_false_82_regions \<sigma> \<equiv> \<exists>regions. P_0x15fe5_false_82_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {(17,18), (22,23)}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {(17,18), (18,17), (22,23), (23,22)}))
\<close>

definition Q_0x15fed_82 :: state_pred where
  \<open>Q_0x15fed_82 \<sigma> \<equiv> RIP \<sigma> = 0x15fed \<and> RBX \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x78) \<and> R12 \<sigma> = RDI\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> regs \<sigma> ymm0w1 = 0x0 \<and> regs \<sigma> ymm0w0 = 0x0 \<and> (\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word) = ucast ((\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word)\<close>
declare Q_0x15fed_82_def[Qs]

schematic_goal qcow_snapshot_create_0_2_0x15fe5_0x15feb_82[blocks]:
  assumes \<open>(P_0x15fe5_false_82 && P_0x15fe5_false_82_regions && ! SF) \<sigma>\<close>
  shows \<open>exec_block 2 0x15feb 82 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x15fed_82 ?\<sigma> \<and> block_usage P_0x15fe5_false_82_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x15fe5_false_82_def P_0x15fe5_false_82_regions_def post: Q_0x15fed_82_def regionset: P_0x15fe5_false_82_regions_set_def)

definition P_0x15fed_83 :: state_pred where
  \<open>P_0x15fed_83 \<sigma> \<equiv> RIP \<sigma> = 0x15fed \<and> RBX \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x78) \<and> R12 \<sigma> = RDI\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> regs \<sigma> ymm0w1 = 0x0 \<and> regs \<sigma> ymm0w0 = 0x0 \<and> (\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word) = ucast ((\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word)\<close>
declare P_0x15fed_83_def[Ps]

definition P_0x15fed_83_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x15fed_83_regions_set \<sigma> \<equiv> {
    (0, RSI\<^sub>0, Suc 0),
    (1, RSP\<^sub>0, 8),
    (2, ((FS\<^sub>0::64 word) + 0x28), 8),
    (3, ((RDI\<^sub>0::64 word) + 0x40), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x40), 8)
  }\<close>

definition P_0x15fed_83_regions :: state_pred where
  \<open>P_0x15fed_83_regions \<sigma> \<equiv> \<exists>regions. P_0x15fed_83_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x15ffb_83 :: state_pred where
  \<open>Q_0x15ffb_83 \<sigma> \<equiv> RIP \<sigma> = 0x15ffb \<and> RBX \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> RSI \<sigma> = 0x0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x78) \<and> R12 \<sigma> = RDI\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> regs \<sigma> ymm0w1 = 0x0 \<and> regs \<sigma> ymm0w0 = 0x0 \<and> (\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word) = ucast ((\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word)\<close>
declare Q_0x15ffb_83_def[Qs]

schematic_goal qcow_snapshot_create_0_2_0x15fed_0x15ff2_83[blocks]:
  assumes \<open>(P_0x15fed_83 && P_0x15fed_83_regions) \<sigma>\<close>
  shows \<open>exec_block 2 0x15ff2 83 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x15ffb_83 ?\<sigma> \<and> block_usage P_0x15fed_83_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x15fed_83_def P_0x15fed_83_regions_def post: Q_0x15ffb_83_def regionset: P_0x15fed_83_regions_set_def)

definition P_0x15ffb_true_84 :: state_pred where
  \<open>P_0x15ffb_true_84 \<sigma> \<equiv> RIP \<sigma> = 0x15ffb \<and> RBX \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> RSI \<sigma> = 0x0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x78) \<and> R12 \<sigma> = RDI\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> regs \<sigma> ymm0w1 = 0x0 \<and> regs \<sigma> ymm0w0 = 0x0 \<and> (\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word) = ucast ((\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word)\<close>
declare P_0x15ffb_true_84_def[Ps]

definition P_0x15ffb_true_84_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x15ffb_true_84_regions_set \<sigma> \<equiv> {
    (0, RSI\<^sub>0, Suc 0),
    (1, RSP\<^sub>0, 8),
    (2, ((FS\<^sub>0::64 word) + 0x28), 8),
    (3, ((RDI\<^sub>0::64 word) + 0x40), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x40), 8)
  }\<close>

definition P_0x15ffb_true_84_regions :: state_pred where
  \<open>P_0x15ffb_true_84_regions \<sigma> \<equiv> \<exists>regions. P_0x15ffb_true_84_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x160bb_84 :: state_pred where
  \<open>Q_0x160bb_84 \<sigma> \<equiv> RIP \<sigma> = 0x160bb \<and> RBX \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> RSI \<sigma> = 0x0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x78) \<and> R12 \<sigma> = RDI\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> regs \<sigma> ymm0w1 = 0x0 \<and> regs \<sigma> ymm0w0 = 0x0 \<and> (\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word) = ucast ((\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word)\<close>
declare Q_0x160bb_84_def[Qs]

schematic_goal qcow_snapshot_create_0_1_0x15ffb_0x15ffb_84[blocks]:
  assumes \<open>(P_0x15ffb_true_84 && P_0x15ffb_true_84_regions && !ZF) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x15ffb 84 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x160bb_84 ?\<sigma> \<and> block_usage P_0x15ffb_true_84_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x15ffb_true_84_def P_0x15ffb_true_84_regions_def post: Q_0x160bb_84_def regionset: P_0x15ffb_true_84_regions_set_def)

definition P_0x160bb_85 :: state_pred where
  \<open>P_0x160bb_85 \<sigma> \<equiv> RIP \<sigma> = 0x160bb \<and> RBX \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> RSI \<sigma> = 0x0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x78) \<and> R12 \<sigma> = RDI\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> regs \<sigma> ymm0w1 = 0x0 \<and> regs \<sigma> ymm0w0 = 0x0 \<and> (\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word) = ucast ((\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word)\<close>
declare P_0x160bb_85_def[Ps]

definition P_0x160bb_85_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x160bb_85_regions_set \<sigma> \<equiv> {
    (0, RSI\<^sub>0, Suc 0),
    (1, RSP\<^sub>0, 8),
    (2, ((FS\<^sub>0::64 word) + 0x28), 8),
    (3, ((RDI\<^sub>0::64 word) + 0x40), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x40), 8),
    (11, ((RSP\<^sub>0::64 word) - 0x80), 8)
  }\<close>

definition P_0x160bb_85_regions :: state_pred where
  \<open>P_0x160bb_85_regions \<sigma> \<equiv> \<exists>regions. P_0x160bb_85_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_stack_chk_fail_addr_0x160bb_85 :: state_pred where
  \<open>Q_stack_chk_fail_addr_0x160bb_85 \<sigma> \<equiv> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x80) \<and> RIP \<sigma> = stack_chk_fail_addr \<and> RSI \<sigma> = 0x0 \<and> FS \<sigma> = FS\<^sub>0 \<and> regs \<sigma> ymm0w1 = 0x0 \<and> regs \<sigma> ymm0w0 = 0x0 \<and> (\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word) = ucast ((\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word)\<close>
declare Q_stack_chk_fail_addr_0x160bb_85_def[Qs]

schematic_goal qcow_snapshot_create_0_1_0x160bb_0x160bb_85[blocks]:
  assumes \<open>(P_0x160bb_85 && P_0x160bb_85_regions) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x160bb 85 \<sigma> \<triangleq> ?\<sigma> \<and> Q_stack_chk_fail_addr_0x160bb_85 ?\<sigma> \<and> block_usage P_0x160bb_85_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x160bb_85_def P_0x160bb_85_regions_def post: Q_stack_chk_fail_addr_0x160bb_85_def regionset: P_0x160bb_85_regions_set_def)

definition P_0x15ffb_false_86 :: state_pred where
  \<open>P_0x15ffb_false_86 \<sigma> \<equiv> RIP \<sigma> = 0x15ffb \<and> RBX \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> RSI \<sigma> = 0x0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x78) \<and> R12 \<sigma> = RDI\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> regs \<sigma> ymm0w1 = 0x0 \<and> regs \<sigma> ymm0w0 = 0x0 \<and> (\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word) = ucast ((\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word)\<close>
declare P_0x15ffb_false_86_def[Ps]

definition P_0x15ffb_false_86_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x15ffb_false_86_regions_set \<sigma> \<equiv> {
    (0, RSI\<^sub>0, Suc 0),
    (1, RSP\<^sub>0, 8),
    (2, ((FS\<^sub>0::64 word) + 0x28), 8),
    (3, ((RDI\<^sub>0::64 word) + 0x40), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x40), 8)
  }\<close>

definition P_0x15ffb_false_86_regions :: state_pred where
  \<open>P_0x15ffb_false_86_regions \<sigma> \<equiv> \<exists>regions. P_0x15ffb_false_86_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_ret_address_86 :: state_pred where
  \<open>Q_ret_address_86 \<sigma> \<equiv> RIP \<sigma> = ret_address \<and> RSI \<sigma> = 0x0 \<and> FS \<sigma> = FS\<^sub>0 \<and> regs \<sigma> ymm0w1 = 0x0 \<and> regs \<sigma> ymm0w0 = 0x0 \<and> (\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word) = ucast ((\<sigma> \<turnstile> *[RSI\<^sub>0,1]::8 word)) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word)\<close>
declare Q_ret_address_86_def[Qs]

schematic_goal qcow_snapshot_create_0_9_0x15ffb_0x1600f_86[blocks]:
  assumes \<open>(P_0x15ffb_false_86 && P_0x15ffb_false_86_regions && ! !ZF) \<sigma>\<close>
  shows \<open>exec_block 9 0x1600f 86 \<sigma> \<triangleq> ?\<sigma> \<and> Q_ret_address_86 ?\<sigma> \<and> block_usage P_0x15ffb_false_86_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x15ffb_false_86_def P_0x15ffb_false_86_regions_def post: Q_ret_address_86_def regionset: P_0x15ffb_false_86_regions_set_def)

definition qcow_snapshot_create_acode :: ACode where
  \<open>qcow_snapshot_create_acode =
    Block 20 0x15e20 0;
    IF ZF THEN
      Block 3 0x16016 (Suc 0);
      IF jle THEN
        Block 3 0x160af 2
      ELSE
        Block 5 0x16026 3;
        WHILE P_0x16030_4 DO
          Block 4 0x1603e 4;
          Block (Suc 0) 0x16043 5;
          CALL strtoul_acode;
          Block 5 0x16055 6;
          IF jl THEN
            Block (Suc 0) 0x1605c 7
          ELSE
            Block (Suc 0) 0x1605c 8
          FI
        OD;
        Block (Suc 0) 0x1605e 9
      FI;
      Block 6 0x16078 10;
      Block (Suc 0) 0x1607d 11;
      CALL snprintf_chk_acode;
      Block 2 0x16087 12
    ELSE
      Block (Suc 0) 0x15e29 13
    FI;
    Block (Suc 0) 0x15e2f 14;
    Block (Suc 0) 0x15e32 15;
    CALL find_snapshot_by_id_isra_8_acode;
    Block (Suc 0) 0x15e37 16;
    IF !SF THEN
      Block 3 0x160b6 17
    ELSE
      Block 2 0x15e3f 18;
      Block (Suc 0) 0x15e42 19;
      CALL qemu_strdup_acode;
      Block 3 0x15e4f 20;
      IF ZF THEN
        Block 2 0x1608c 21;
        Block (Suc 0) 0x1608f 22;
        Block (Suc 0) 0x16092 23;
        CALL qemu_free_acode;
        Block (Suc 0) 0x16097 24;
        Block (Suc 0) 0x1609a 25;
        CALL qemu_free_acode;
        Block 2 0x160a4 26
      ELSE
        Block 2 0x15e58 27;
        Block (Suc 0) 0x15e5f 28;
        CALL qemu_strdup_acode;
        Block 3 0x15e6c 29;
        IF ZF THEN
          Block 2 0x1608c 30;
          Block (Suc 0) 0x1608f 31;
          Block (Suc 0) 0x16092 32;
          CALL qemu_free_acode;
          Block (Suc 0) 0x16097 33;
          Block (Suc 0) 0x1609a 34;
          CALL qemu_free_acode;
          Block 2 0x160a4 35
        ELSE
          Block 11 0x15ea2 36;
          Block (Suc 0) 0x15ea7 37;
          CALL update_snapshot_refcount_acode;
          Block (Suc 0) 0x15eac 38;
          IF SF THEN
            Block 2 0x1608c 39;
            Block (Suc 0) 0x1608f 40;
            Block (Suc 0) 0x16092 41;
            CALL qemu_free_acode;
            Block (Suc 0) 0x16097 42;
            Block (Suc 0) 0x1609a 43;
            CALL qemu_free_acode;
            Block 2 0x160a4 44
          ELSE
            Block 4 0x15ebb 45;
            Block (Suc 0) 0x15ebf 46;
            CALL alloc_clusters_acode;
            Block 5 0x15ed3 47;
            Block (Suc 0) 0x15ed7 48;
            CALL qemu_malloc_acode;
            Block 3 0x15ee2 49;
            IF jle THEN
              Block (Suc 0) 0x15ee4 50
            ELSE
              Block 3 0x15ee8 51;
              WHILE P_0x15ef0_52 DO
                Block 7 0x15f07 52;
                IF jg THEN
                  Block (Suc 0) 0x15f09 53
                ELSE
                  Block (Suc 0) 0x15f09 54
                FI
              OD
            FI;
            Block 4 0x15f14 55;
            Block (Suc 0) 0x15f17 56;
            CALL bdrv_pwrite_acode;
            Block 4 0x15f26 57;
            IF !ZF THEN
              Block 2 0x1608f 58;
              Block (Suc 0) 0x16092 59;
              CALL qemu_free_acode;
              Block (Suc 0) 0x16097 60;
              Block (Suc 0) 0x1609a 61;
              CALL qemu_free_acode;
              Block 2 0x160a4 62
            ELSE
              Block 2 0x15f2f 63;
              Block (Suc 0) 0x15f32 64;
              CALL qemu_free_acode;
              Block 6 0x15f4d 65;
              Block (Suc 0) 0x15f51 66;
              CALL qemu_malloc_acode;
              Block 3 0x15f60 67;
              IF ZF THEN
                Block (Suc 0) 0x15f63 68
              ELSE
                Block 6 0x15f7a 69;
                Block (Suc 0) 0x15f7e 70;
                CALL memcpy_acode;
                Block (Suc 0) 0x15f83 71;
                Block (Suc 0) 0x15f8a 72;
                CALL qemu_free_acode
              FI;
              Block 16 0x15fda 73;
              Block (Suc 0) 0x15fde 74;
              CALL qcow_write_snapshots_acode;
              Block (Suc 0) 0x15fe3 75;
              IF SF THEN
                Block 2 0x1608c 76;
                Block (Suc 0) 0x1608f 77;
                Block (Suc 0) 0x16092 78;
                CALL qemu_free_acode;
                Block (Suc 0) 0x16097 79;
                Block (Suc 0) 0x1609a 80;
                CALL qemu_free_acode;
                Block 2 0x160a4 81
              ELSE
                Block 2 0x15feb 82
              FI
            FI
          FI
        FI
      FI
    FI;
    Block 2 0x15ff2 83;
    IF !ZF THEN
      Block (Suc 0) 0x15ffb 84;
      Block (Suc 0) 0x160bb 85;
      CALL stack_chk_fail_acode
    ELSE
      Block 9 0x1600f 86
    FI
  \<close>

schematic_goal "qcow_snapshot_create":
  assumes
    \<open>\<forall>\<sigma>. RIP \<sigma> = 0x15e29 \<longrightarrow> P_0x15e29_true_1_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x16018 \<longrightarrow> P_0x16018_true_2_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x16018 \<longrightarrow> P_0x16018_false_3_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x16030 \<longrightarrow> P_0x16030_4_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x16043 \<longrightarrow> P_0x16043_5_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x16048 \<longrightarrow> P_0x16048_6_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x1605c \<longrightarrow> P_0x1605c_true_7_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x1605c \<longrightarrow> P_0x1605c_false_8_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x1605e \<longrightarrow> P_0x1605e_9_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x16062 \<longrightarrow> P_0x16062_10_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x1607d \<longrightarrow> P_0x1607d_11_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x16082 \<longrightarrow> P_0x16082_12_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x15e29 \<longrightarrow> P_0x15e29_false_13_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x15e2f \<longrightarrow> P_0x15e2f_14_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x15e32 \<longrightarrow> P_0x15e32_15_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x15e37 \<longrightarrow> P_0x15e37_16_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x15e39 \<longrightarrow> P_0x15e39_true_17_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x15e39 \<longrightarrow> P_0x15e39_false_18_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x15e42 \<longrightarrow> P_0x15e42_19_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x15e47 \<longrightarrow> P_0x15e47_20_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x15e52 \<longrightarrow> P_0x15e52_true_21_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x1608f \<longrightarrow> P_0x1608f_22_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x16092 \<longrightarrow> P_0x16092_23_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x16097 \<longrightarrow> P_0x16097_24_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x1609a \<longrightarrow> P_0x1609a_25_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x1609f \<longrightarrow> P_0x1609f_26_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x15e52 \<longrightarrow> P_0x15e52_false_27_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x15e5f \<longrightarrow> P_0x15e5f_28_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x15e64 \<longrightarrow> P_0x15e64_29_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x15e6f \<longrightarrow> P_0x15e6f_true_30_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x1608f \<longrightarrow> P_0x1608f_31_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x16092 \<longrightarrow> P_0x16092_32_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x16097 \<longrightarrow> P_0x16097_33_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x1609a \<longrightarrow> P_0x1609a_34_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x1609f \<longrightarrow> P_0x1609f_35_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x15e6f \<longrightarrow> P_0x15e6f_false_36_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x15ea7 \<longrightarrow> P_0x15ea7_37_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x15eac \<longrightarrow> P_0x15eac_38_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x15eae \<longrightarrow> P_0x15eae_true_39_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x1608f \<longrightarrow> P_0x1608f_40_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x16092 \<longrightarrow> P_0x16092_41_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x16097 \<longrightarrow> P_0x16097_42_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x1609a \<longrightarrow> P_0x1609a_43_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x1609f \<longrightarrow> P_0x1609f_44_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x15eae \<longrightarrow> P_0x15eae_false_45_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x15ebf \<longrightarrow> P_0x15ebf_46_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x15ec4 \<longrightarrow> P_0x15ec4_47_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x15ed7 \<longrightarrow> P_0x15ed7_48_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x15edc \<longrightarrow> P_0x15edc_49_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x15ee4 \<longrightarrow> P_0x15ee4_true_50_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x15ee4 \<longrightarrow> P_0x15ee4_false_51_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x15ef0 \<longrightarrow> P_0x15ef0_52_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x15f09 \<longrightarrow> P_0x15f09_true_53_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x15f09 \<longrightarrow> P_0x15f09_false_54_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x15f0b \<longrightarrow> P_0x15f0b_55_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x15f17 \<longrightarrow> P_0x15f17_56_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x15f1c \<longrightarrow> P_0x15f1c_57_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x15f29 \<longrightarrow> P_0x15f29_true_58_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x16092 \<longrightarrow> P_0x16092_59_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x16097 \<longrightarrow> P_0x16097_60_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x1609a \<longrightarrow> P_0x1609a_61_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x1609f \<longrightarrow> P_0x1609f_62_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x15f29 \<longrightarrow> P_0x15f29_false_63_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x15f32 \<longrightarrow> P_0x15f32_64_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x15f37 \<longrightarrow> P_0x15f37_65_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x15f51 \<longrightarrow> P_0x15f51_66_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x15f56 \<longrightarrow> P_0x15f56_67_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x15f63 \<longrightarrow> P_0x15f63_true_68_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x15f63 \<longrightarrow> P_0x15f63_false_69_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x15f7e \<longrightarrow> P_0x15f7e_70_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x15f83 \<longrightarrow> P_0x15f83_71_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x15f8a \<longrightarrow> P_0x15f8a_72_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x15f8f \<longrightarrow> P_0x15f8f_73_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x15fde \<longrightarrow> P_0x15fde_74_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x15fe3 \<longrightarrow> P_0x15fe3_75_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x15fe5 \<longrightarrow> P_0x15fe5_true_76_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x1608f \<longrightarrow> P_0x1608f_77_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x16092 \<longrightarrow> P_0x16092_78_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x16097 \<longrightarrow> P_0x16097_79_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x1609a \<longrightarrow> P_0x1609a_80_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x1609f \<longrightarrow> P_0x1609f_81_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x15fe5 \<longrightarrow> P_0x15fe5_false_82_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x15fed \<longrightarrow> P_0x15fed_83_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x15ffb \<longrightarrow> P_0x15ffb_true_84_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x160bb \<longrightarrow> P_0x160bb_85_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x15ffb \<longrightarrow> P_0x15ffb_false_86_regions \<sigma>\<close>
    and [blocks]: \<open>{{Q_strtoul_addr_0x16043_5}} \<box>strtoul_acode {{P_0x16048_6;M_0x16043}}\<close>
    and [blocks]: \<open>{{Q_snprintf_chk_addr_0x1607d_11}} \<box>snprintf_chk_acode {{P_0x16082_12;M_0x1607d}}\<close>
    and [blocks]: \<open>{{Q_find_snapshot_by_id_isra_8_addr_0x15e32_15}} \<box>find_snapshot_by_id_isra_8_acode {{P_0x15e37_16;M_0x15e32}}\<close>
    and [blocks]: \<open>{{Q_qemu_strdup_addr_0x15e42_19}} \<box>qemu_strdup_acode {{P_0x15e47_20;M_0x15e42}}\<close>
    and [blocks]: \<open>{{Q_qemu_free_addr_0x16092_23}} \<box>qemu_free_acode {{P_0x16097_24;M_0x16092}}\<close>
    and [blocks]: \<open>{{Q_qemu_free_addr_0x1609a_25}} \<box>qemu_free_acode {{P_0x1609f_26;M_0x1609a}}\<close>
    and [blocks]: \<open>{{Q_qemu_strdup_addr_0x15e5f_28}} \<box>qemu_strdup_acode {{P_0x15e64_29;M_0x15e5f}}\<close>
    and [blocks]: \<open>{{Q_qemu_free_addr_0x16092_32}} \<box>qemu_free_acode {{P_0x16097_33;M_0x16092}}\<close>
    and [blocks]: \<open>{{Q_qemu_free_addr_0x1609a_34}} \<box>qemu_free_acode {{P_0x1609f_35;M_0x1609a}}\<close>
    and [blocks]: \<open>{{Q_update_snapshot_refcount_addr_0x15ea7_37}} \<box>update_snapshot_refcount_acode {{P_0x15eac_38;M_0x15ea7}}\<close>
    and [blocks]: \<open>{{Q_qemu_free_addr_0x16092_41}} \<box>qemu_free_acode {{P_0x16097_42;M_0x16092}}\<close>
    and [blocks]: \<open>{{Q_qemu_free_addr_0x1609a_43}} \<box>qemu_free_acode {{P_0x1609f_44;M_0x1609a}}\<close>
    and [blocks]: \<open>{{Q_alloc_clusters_addr_0x15ebf_46}} \<box>alloc_clusters_acode {{P_0x15ec4_47;M_0x15ebf}}\<close>
    and [blocks]: \<open>{{Q_qemu_malloc_addr_0x15ed7_48}} \<box>qemu_malloc_acode {{P_0x15edc_49;M_0x15ed7}}\<close>
    and [blocks]: \<open>{{Q_bdrv_pwrite_addr_0x15f17_56}} \<box>bdrv_pwrite_acode {{P_0x15f1c_57;M_0x15f17}}\<close>
    and [blocks]: \<open>{{Q_qemu_free_addr_0x16092_59}} \<box>qemu_free_acode {{P_0x16097_60;M_0x16092}}\<close>
    and [blocks]: \<open>{{Q_qemu_free_addr_0x1609a_61}} \<box>qemu_free_acode {{P_0x1609f_62;M_0x1609a}}\<close>
    and [blocks]: \<open>{{Q_qemu_free_addr_0x15f32_64}} \<box>qemu_free_acode {{P_0x15f37_65;M_0x15f32}}\<close>
    and [blocks]: \<open>{{Q_qemu_malloc_addr_0x15f51_66}} \<box>qemu_malloc_acode {{P_0x15f56_67;M_0x15f51}}\<close>
    and [blocks]: \<open>{{Q_memcpy_addr_0x15f7e_70}} \<box>memcpy_acode {{P_0x15f83_71;M_0x15f7e}}\<close>
    and [blocks]: \<open>{{Q_qemu_free_addr_0x15f8a_72}} \<box>qemu_free_acode {{P_0x15f8f_73;M_0x15f8a}}\<close>
    and [blocks]: \<open>{{Q_qcow_write_snapshots_addr_0x15fde_74}} \<box>qcow_write_snapshots_acode {{P_0x15fe3_75;M_0x15fde}}\<close>
    and [blocks]: \<open>{{Q_qemu_free_addr_0x16092_78}} \<box>qemu_free_acode {{P_0x16097_79;M_0x16092}}\<close>
    and [blocks]: \<open>{{Q_qemu_free_addr_0x1609a_80}} \<box>qemu_free_acode {{P_0x1609f_81;M_0x1609a}}\<close>
    and [blocks]: \<open>{{Q_stack_chk_fail_addr_0x160bb_85}} \<box>stack_chk_fail_acode {{Q_fail;M_0x160bb}}\<close>
  shows \<open>{{?P}} qcow_snapshot_create_acode {{?Q;?M}}\<close>
  apply (vcg acode: qcow_snapshot_create_acode_def assms: assms)
  apply ((rule htriples)+)?
  apply (rule HTriple_weaken[where P="P_0x16030_4 || P_0x1605e_9"])
  apply (simp add: pred_logic Ps Qs assms)
  apply (rule HTriple_while)
  apply (vcg_step assms: assms)+
  apply (simp add: pred_logic Ps Qs assms)[1]
  apply (vcg_step assms: assms)+
  apply (simp add: pred_logic Ps Qs assms)[1]
  apply simp
  apply simp
  apply simp
  apply simp
  apply simp
  apply (vcg_step assms: assms)+
  apply ((rule htriples)+)?
  apply (rule HTriple_weaken[where P="P_0x15ef0_52 || P_0x15f0b_55"])
  apply (simp add: pred_logic Ps Qs assms)
  apply (rule HTriple_while)
  apply (vcg_step assms: assms)+
  apply (simp add: pred_logic Ps Qs assms)[1]
  apply simp
  apply simp
  apply simp
  apply (vcg_step assms: assms)+
  apply (simp add: pred_logic Ps Qs assms)[1]
  apply (simp add: pred_logic Ps Qs assms)[1]
  apply simp
  apply (vcg_step assms: assms)+
  done

end
