(*
Copyright 2019

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
*)
theory AES_cbc_encrypt
  imports "../../../isabelle/VCG/HTriple"
begin

locale "qemu_img_xen" = execution_context + exec_code +
  fixes AES_decrypt_0x86a4_retval\<^sub>v AES_encrypt_0x876d_retval\<^sub>v AES_encrypt_0x87e5_retval\<^sub>v AES_decrypt_0x881d_retval\<^sub>v stack_chk_fail_0x8858_retval\<^sub>v AES_decrypt_addr AES_encrypt_addr stack_chk_fail_addr :: \<open>64 word\<close>
    and AES_decrypt_acode AES_encrypt_acode stack_chk_fail_acode :: ACode
  assumes fetch:
    "fetch 0x8630 \<equiv> (Unary (IS_8088 Push) (Storage (Reg (General SixtyFour r15))), 2)"
    "fetch 0x8632 \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour r15)) (Storage (Reg (General SixtyFour rdx))), 3)"
    "fetch 0x8635 \<equiv> (Unary (IS_8088 Push) (Storage (Reg (General SixtyFour r14))), 2)"
    "fetch 0x8637 \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour r14)) (Storage (Reg (General SixtyFour r8))), 3)"
    "fetch 0x863a \<equiv> (Unary (IS_8088 Push) (Storage (Reg (General SixtyFour r13))), 2)"
    "fetch 0x863c \<equiv> (Unary (IS_8088 Push) (Storage (Reg (General SixtyFour r12))), 2)"
    "fetch 0x863e \<equiv> (Unary (IS_8088 Push) (Storage (Reg (General SixtyFour rbp))), 1)"
    "fetch 0x863f \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour rbp)) (Storage (Reg (General SixtyFour rcx))), 3)"
    "fetch 0x8642 \<equiv> (Unary (IS_8088 Push) (Storage (Reg (General SixtyFour rbx))), 1)"
    "fetch 0x8643 \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour rbx)) (Storage (Reg (General SixtyFour rsi))), 3)"
    "fetch 0x8646 \<equiv> (Binary (IS_8088 Sub) (Reg (General SixtyFour rsp)) (Immediate SixtyFour (ImmVal 72)), 4)"
    "fetch 0x864a \<equiv> (Binary (IS_8088 Mov) (Memory SixtyFour (A_SizeDirective 64 (A_Plus (A_FromReg (General SixtyFour rsp)) (A_WordConstant 8)))) (Storage (Reg (General SixtyFour rdi))), 5)"
    "fetch 0x864f \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour rax)) (Storage (Memory SixtyFour (A_SizeDirective 64 (A_Plus (A_FromReg (General SixtyFour fs)) (A_WordConstant 40))))), 9)"
    "fetch 0x8658 \<equiv> (Binary (IS_8088 Mov) (Memory SixtyFour (A_SizeDirective 64 (A_Plus (A_FromReg (General SixtyFour rsp)) (A_WordConstant 56)))) (Storage (Reg (General SixtyFour rax))), 5)"
    "fetch 0x865d \<equiv> (Binary (IS_8088 Xor) (Reg (General ThirtyTwo rax)) (Storage (Reg (General ThirtyTwo rax))), 2)"
    "fetch 0x865f \<equiv> (Binary (IS_8088 Test) (Reg (General ThirtyTwo r9)) (Storage (Reg (General ThirtyTwo r9))), 3)"
    "fetch 0x8662 \<equiv> (Unary (IS_8088 Jne) (Immediate SixtyFour (ImmVal 34579)), 6)"
    "fetch 0x8668 \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour r12)) (Storage (Reg (General SixtyFour rsi))), 3)"
    "fetch 0x866b \<equiv> (Binary (IS_8088 Cmp) (Reg (General SixtyFour rdx)) (Immediate SixtyFour (ImmVal 15)), 4)"
    "fetch 0x866f \<equiv> (Unary (IS_8088 Jbe) (Immediate SixtyFour (ImmVal 34535)), 2)"
    "fetch 0x8671 \<equiv> (Binary (IS_8088 Lea) (Reg (General SixtyFour rax)) (Storage (Memory SixtyFour (A_Minus (A_FromReg (General SixtyFour rdx)) (A_WordConstant 16)))), 4)"
    "fetch 0x8675 \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour r13)) (Storage (Memory SixtyFour (A_SizeDirective 64 (A_Plus (A_FromReg (General SixtyFour rsp)) (A_WordConstant 8))))), 5)"
    "fetch 0x867a \<equiv> (Binary (IS_8088 And) (Reg (General SixtyFour rax)) (Immediate SixtyFour (ImmVal 18446744073709551600)), 4)"
    "fetch 0x867e \<equiv> (Binary (IS_8088 Add) (Reg (General SixtyFour rax)) (Immediate SixtyFour (ImmVal 16)), 4)"
    "fetch 0x8682 \<equiv> (Binary (IS_8088 Mov) (Memory SixtyFour (A_SizeDirective 64 (A_Plus (A_FromReg (General SixtyFour rsp)) (A_WordConstant 16)))) (Storage (Reg (General SixtyFour rax))), 5)"
    "fetch 0x8687 \<equiv> (Binary (IS_8088 Lea) (Reg (General SixtyFour r12)) (Storage (Memory SixtyFour (A_Plus (A_FromReg (General SixtyFour rsi)) (A_Mult 1 (A_FromReg (General SixtyFour rax)))))), 4)"
    "fetch 0x868b \<equiv> (Unary (IS_8088 Nop) (Storage (Memory ThirtyTwo (A_SizeDirective 32 (A_Plus (A_FromReg (General SixtyFour rax)) (A_Plus (A_Mult 1 (A_FromReg (General SixtyFour rax))) (A_WordConstant 0)))))), 5)"
    "fetch 0x8690 \<equiv> (Binary (IS_SSE2_SIMD Movdqu) (Reg (SIMD OneHundredTwentyEight ymm2w3 ymm2w2 ymm2w1 ymm2w0)) (Storage (Memory OneHundredTwentyEight (A_SizeDirective 128 (A_Plus (A_FromReg (General SixtyFour r13)) (A_WordConstant 0))))), 6)"
    "fetch 0x8696 \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour rdx)) (Storage (Reg (General SixtyFour rbp))), 3)"
    "fetch 0x8699 \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour rsi)) (Storage (Reg (General SixtyFour rbx))), 3)"
    "fetch 0x869c \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour rdi)) (Storage (Reg (General SixtyFour r13))), 3)"
    "fetch 0x869f \<equiv> (Binary (IS_SSE_SIMD Movaps) (Memory OneHundredTwentyEight (A_SizeDirective 128 (A_Plus (A_FromReg (General SixtyFour rsp)) (A_WordConstant 32)))) (Storage (Reg (SIMD OneHundredTwentyEight ymm2w3 ymm2w2 ymm2w1 ymm2w0))), 5)"
    "fetch 0x86a4 \<equiv> (Unary (IS_8088 Call) (Immediate SixtyFour (ImmLabel ''AES_decrypt'')), 5)"
    "fetch 0x86a9 \<equiv> (Binary (IS_8088 Xor) (Reg (General ThirtyTwo rax)) (Storage (Reg (General ThirtyTwo rax))), 2)"
    "fetch 0x86ab \<equiv> (Unary (IS_8088 Nop) (Storage (Memory ThirtyTwo (A_SizeDirective 32 (A_Plus (A_FromReg (General SixtyFour rax)) (A_Plus (A_Mult 1 (A_FromReg (General SixtyFour rax))) (A_WordConstant 0)))))), 5)"
    "fetch 0x86b0 \<equiv> (Binary (IS_80386 Movzx) (Reg (General ThirtyTwo rdx)) (Storage (Memory Eight (A_SizeDirective 8 (A_Plus (A_FromReg (General SixtyFour r14)) (A_Mult 1 (A_FromReg (General SixtyFour rax))))))), 5)"
    "fetch 0x86b5 \<equiv> (Binary (IS_8088 Xor) (Memory Eight (A_SizeDirective 8 (A_Plus (A_FromReg (General SixtyFour rbx)) (A_Mult 1 (A_FromReg (General SixtyFour rax)))))) (Storage (Reg (General Eight rdx))), 3)"
    "fetch 0x86b8 \<equiv> (Binary (IS_8088 Add) (Reg (General SixtyFour rax)) (Immediate SixtyFour (ImmVal 1)), 4)"
    "fetch 0x86bc \<equiv> (Binary (IS_8088 Cmp) (Reg (General SixtyFour rax)) (Immediate SixtyFour (ImmVal 16)), 4)"
    "fetch 0x86c0 \<equiv> (Unary (IS_8088 Jne) (Immediate SixtyFour (ImmVal 34480)), 2)"
    "fetch 0x86c2 \<equiv> (Binary (IS_SSE2_SIMD Movdqa) (Reg (SIMD OneHundredTwentyEight ymm3w3 ymm3w2 ymm3w1 ymm3w0)) (Storage (Memory OneHundredTwentyEight (A_SizeDirective 128 (A_Plus (A_FromReg (General SixtyFour rsp)) (A_WordConstant 32))))), 6)"
    "fetch 0x86c8 \<equiv> (Binary (IS_8088 Add) (Reg (General SixtyFour rbx)) (Immediate SixtyFour (ImmVal 16)), 4)"
    "fetch 0x86cc \<equiv> (Binary (IS_8088 Add) (Reg (General SixtyFour r13)) (Immediate SixtyFour (ImmVal 16)), 4)"
    "fetch 0x86d0 \<equiv> (Binary (IS_SSE_SIMD Movups) (Memory OneHundredTwentyEight (A_SizeDirective 128 (A_FromReg (General SixtyFour r14)))) (Storage (Reg (SIMD OneHundredTwentyEight ymm3w3 ymm3w2 ymm3w1 ymm3w0))), 4)"
    "fetch 0x86d4 \<equiv> (Binary (IS_8088 Cmp) (Reg (General SixtyFour rbx)) (Storage (Reg (General SixtyFour r12))), 3)"
    "fetch 0x86d7 \<equiv> (Unary (IS_8088 Jne) (Immediate SixtyFour (ImmVal 34448)), 2)"
    "fetch 0x86d9 \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour rcx)) (Storage (Memory SixtyFour (A_SizeDirective 64 (A_Plus (A_FromReg (General SixtyFour rsp)) (A_WordConstant 16))))), 5)"
    "fetch 0x86de \<equiv> (Binary (IS_8088 Add) (Memory SixtyFour (A_SizeDirective 64 (A_Plus (A_FromReg (General SixtyFour rsp)) (A_WordConstant 8)))) (Storage (Reg (General SixtyFour rcx))), 5)"
    "fetch 0x86e3 \<equiv> (Binary (IS_8088 And) (Reg (General ThirtyTwo r15)) (Immediate SixtyFour (ImmVal 15)), 4)"
    "fetch 0x86e7 \<equiv> (Binary (IS_8088 Test) (Reg (General SixtyFour r15)) (Storage (Reg (General SixtyFour r15))), 3)"
    "fetch 0x86ea \<equiv> (Unary (IS_8088 Jne) (Immediate SixtyFour (ImmVal 34817)), 6)"
    "fetch 0x86f0 \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour rax)) (Storage (Memory SixtyFour (A_SizeDirective 64 (A_Plus (A_FromReg (General SixtyFour rsp)) (A_WordConstant 56))))), 5)"
    "fetch 0x86f5 \<equiv> (Binary (IS_8088 Xor) (Reg (General SixtyFour rax)) (Storage (Memory SixtyFour (A_SizeDirective 64 (A_Plus (A_FromReg (General SixtyFour fs)) (A_WordConstant 40))))), 9)"
    "fetch 0x86fe \<equiv> (Unary (IS_8088 Jne) (Immediate SixtyFour (ImmVal 34904)), 6)"
    "fetch 0x8704 \<equiv> (Binary (IS_8088 Add) (Reg (General SixtyFour rsp)) (Immediate SixtyFour (ImmVal 72)), 4)"
    "fetch 0x8708 \<equiv> (Unary (IS_8088 Pop) (Storage (Reg (General SixtyFour rbx))), 1)"
    "fetch 0x8709 \<equiv> (Unary (IS_8088 Pop) (Storage (Reg (General SixtyFour rbp))), 1)"
    "fetch 0x870a \<equiv> (Unary (IS_8088 Pop) (Storage (Reg (General SixtyFour r12))), 2)"
    "fetch 0x870c \<equiv> (Unary (IS_8088 Pop) (Storage (Reg (General SixtyFour r13))), 2)"
    "fetch 0x870e \<equiv> (Unary (IS_8088 Pop) (Storage (Reg (General SixtyFour r14))), 2)"
    "fetch 0x8710 \<equiv> (Unary (IS_8088 Pop) (Storage (Reg (General SixtyFour r15))), 2)"
    "fetch 0x8712 \<equiv> (Nullary (IS_8088 Ret), 1)"
    "fetch 0x8713 \<equiv> (Binary (IS_8088 Cmp) (Reg (General SixtyFour rdx)) (Immediate SixtyFour (ImmVal 15)), 4)"
    "fetch 0x8717 \<equiv> (Unary (IS_8088 Jbe) (Immediate SixtyFour (ImmVal 34894)), 6)"
    "fetch 0x871d \<equiv> (Binary (IS_8088 Lea) (Reg (General SixtyFour rax)) (Storage (Memory SixtyFour (A_Minus (A_FromReg (General SixtyFour rdx)) (A_WordConstant 16)))), 4)"
    "fetch 0x8721 \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour r12)) (Storage (Memory SixtyFour (A_SizeDirective 64 (A_Plus (A_FromReg (General SixtyFour rsp)) (A_WordConstant 8))))), 5)"
    "fetch 0x8726 \<equiv> (Binary (IS_8088 Lea) (Reg (General SixtyFour r13)) (Storage (Memory SixtyFour (A_Plus (A_FromReg (General SixtyFour rsp)) (A_WordConstant 32)))), 5)"
    "fetch 0x872b \<equiv> (Binary (IS_8088 And) (Reg (General SixtyFour rax)) (Immediate SixtyFour (ImmVal 18446744073709551600)), 4)"
    "fetch 0x872f \<equiv> (Binary (IS_8088 Add) (Reg (General SixtyFour rax)) (Immediate SixtyFour (ImmVal 16)), 4)"
    "fetch 0x8733 \<equiv> (Binary (IS_8088 Mov) (Memory SixtyFour (A_SizeDirective 64 (A_Plus (A_FromReg (General SixtyFour rsp)) (A_WordConstant 24)))) (Storage (Reg (General SixtyFour rax))), 5)"
    "fetch 0x8738 \<equiv> (Binary (IS_8088 Add) (Reg (General SixtyFour rax)) (Storage (Reg (General SixtyFour rsi))), 3)"
    "fetch 0x873b \<equiv> (Binary (IS_8088 Mov) (Memory SixtyFour (A_SizeDirective 64 (A_Plus (A_FromReg (General SixtyFour rsp)) (A_WordConstant 16)))) (Storage (Reg (General SixtyFour rax))), 5)"
    "fetch 0x8740 \<equiv> (Binary (IS_8088 Xor) (Reg (General ThirtyTwo rax)) (Storage (Reg (General ThirtyTwo rax))), 2)"
    "fetch 0x8742 \<equiv> (Unary (IS_8088 Nop) (Storage (Memory Sixteen (A_SizeDirective 16 (A_Plus (A_FromReg (General SixtyFour rax)) (A_Plus (A_Mult 1 (A_FromReg (General SixtyFour rax))) (A_WordConstant 0)))))), 6)"
    "fetch 0x8748 \<equiv> (Binary (IS_80386 Movzx) (Reg (General ThirtyTwo rdx)) (Storage (Memory Eight (A_SizeDirective 8 (A_Plus (A_FromReg (General SixtyFour r12)) (A_Mult 1 (A_FromReg (General SixtyFour rax))))))), 5)"
    "fetch 0x874d \<equiv> (Binary (IS_8088 Xor) (Reg (General Eight rdx)) (Storage (Memory Eight (A_SizeDirective 8 (A_Plus (A_FromReg (General SixtyFour r14)) (A_Mult 1 (A_FromReg (General SixtyFour rax))))))), 4)"
    "fetch 0x8751 \<equiv> (Binary (IS_8088 Mov) (Memory Eight (A_SizeDirective 8 (A_Plus (A_FromReg (General SixtyFour r13)) (A_Plus (A_Mult 1 (A_FromReg (General SixtyFour rax))) (A_WordConstant 0))))) (Storage (Reg (General Eight rdx))), 5)"
    "fetch 0x8756 \<equiv> (Binary (IS_8088 Add) (Reg (General SixtyFour rax)) (Immediate SixtyFour (ImmVal 1)), 4)"
    "fetch 0x875a \<equiv> (Binary (IS_8088 Cmp) (Reg (General SixtyFour rax)) (Immediate SixtyFour (ImmVal 16)), 4)"
    "fetch 0x875e \<equiv> (Unary (IS_8088 Jne) (Immediate SixtyFour (ImmVal 34632)), 2)"
    "fetch 0x8760 \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour rsi)) (Storage (Reg (General SixtyFour rbx))), 3)"
    "fetch 0x8763 \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour rdx)) (Storage (Reg (General SixtyFour rbp))), 3)"
    "fetch 0x8766 \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour rdi)) (Storage (Reg (General SixtyFour r13))), 3)"
    "fetch 0x8769 \<equiv> (Binary (IS_8088 Add) (Reg (General SixtyFour r12)) (Immediate SixtyFour (ImmVal 16)), 4)"
    "fetch 0x876d \<equiv> (Unary (IS_8088 Call) (Immediate SixtyFour (ImmLabel ''AES_encrypt'')), 5)"
    "fetch 0x8772 \<equiv> (Binary (IS_SSE2_SIMD Movdqu) (Reg (SIMD OneHundredTwentyEight ymm1w3 ymm1w2 ymm1w1 ymm1w0)) (Storage (Memory OneHundredTwentyEight (A_SizeDirective 128 (A_FromReg (General SixtyFour rbx))))), 4)"
    "fetch 0x8776 \<equiv> (Binary (IS_8088 Add) (Reg (General SixtyFour rbx)) (Immediate SixtyFour (ImmVal 16)), 4)"
    "fetch 0x877a \<equiv> (Binary (IS_SSE_SIMD Movups) (Memory OneHundredTwentyEight (A_SizeDirective 128 (A_FromReg (General SixtyFour r14)))) (Storage (Reg (SIMD OneHundredTwentyEight ymm1w3 ymm1w2 ymm1w1 ymm1w0))), 4)"
    "fetch 0x877e \<equiv> (Binary (IS_8088 Cmp) (Reg (General SixtyFour rbx)) (Storage (Memory SixtyFour (A_SizeDirective 64 (A_Plus (A_FromReg (General SixtyFour rsp)) (A_WordConstant 16))))), 5)"
    "fetch 0x8783 \<equiv> (Unary (IS_8088 Jne) (Immediate SixtyFour (ImmVal 34624)), 2)"
    "fetch 0x8785 \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour rcx)) (Storage (Memory SixtyFour (A_SizeDirective 64 (A_Plus (A_FromReg (General SixtyFour rsp)) (A_WordConstant 24))))), 5)"
    "fetch 0x878a \<equiv> (Binary (IS_8088 Add) (Memory SixtyFour (A_SizeDirective 64 (A_Plus (A_FromReg (General SixtyFour rsp)) (A_WordConstant 8)))) (Storage (Reg (General SixtyFour rcx))), 5)"
    "fetch 0x878f \<equiv> (Binary (IS_8088 And) (Reg (General ThirtyTwo r15)) (Immediate SixtyFour (ImmVal 15)), 4)"
    "fetch 0x8793 \<equiv> (Binary (IS_8088 Test) (Reg (General SixtyFour r15)) (Storage (Reg (General SixtyFour r15))), 3)"
    "fetch 0x8796 \<equiv> (Unary (IS_8088 Je) (Immediate SixtyFour (ImmVal 34544)), 6)"
    "fetch 0x879c \<equiv> (Binary (IS_8088 Xor) (Reg (General ThirtyTwo rax)) (Storage (Reg (General ThirtyTwo rax))), 2)"
    "fetch 0x879e \<equiv> (Binary (IS_8088 Lea) (Reg (General SixtyFour r13)) (Storage (Memory SixtyFour (A_Plus (A_FromReg (General SixtyFour rsp)) (A_WordConstant 32)))), 5)"
    "fetch 0x87a3 \<equiv> (Unary (IS_8088 Nop) (Storage (Memory ThirtyTwo (A_SizeDirective 32 (A_Plus (A_FromReg (General SixtyFour rax)) (A_Plus (A_Mult 1 (A_FromReg (General SixtyFour rax))) (A_WordConstant 0)))))), 5)"
    "fetch 0x87a8 \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour rcx)) (Storage (Memory SixtyFour (A_SizeDirective 64 (A_Plus (A_FromReg (General SixtyFour rsp)) (A_WordConstant 8))))), 5)"
    "fetch 0x87ad \<equiv> (Binary (IS_80386 Movzx) (Reg (General ThirtyTwo rdx)) (Storage (Memory Eight (A_SizeDirective 8 (A_Plus (A_FromReg (General SixtyFour rcx)) (A_Mult 1 (A_FromReg (General SixtyFour rax))))))), 4)"
    "fetch 0x87b1 \<equiv> (Binary (IS_8088 Xor) (Reg (General Eight rdx)) (Storage (Memory Eight (A_SizeDirective 8 (A_Plus (A_FromReg (General SixtyFour r14)) (A_Mult 1 (A_FromReg (General SixtyFour rax))))))), 4)"
    "fetch 0x87b5 \<equiv> (Binary (IS_8088 Mov) (Memory Eight (A_SizeDirective 8 (A_Plus (A_FromReg (General SixtyFour r13)) (A_Plus (A_Mult 1 (A_FromReg (General SixtyFour rax))) (A_WordConstant 0))))) (Storage (Reg (General Eight rdx))), 5)"
    "fetch 0x87ba \<equiv> (Binary (IS_8088 Add) (Reg (General SixtyFour rax)) (Immediate SixtyFour (ImmVal 1)), 4)"
    "fetch 0x87be \<equiv> (Binary (IS_8088 Cmp) (Reg (General SixtyFour rax)) (Storage (Reg (General SixtyFour r15))), 3)"
    "fetch 0x87c1 \<equiv> (Unary (IS_8088 Jne) (Immediate SixtyFour (ImmVal 34728)), 2)"
    "fetch 0x87c3 \<equiv> (Unary (IS_8088 Nop) (Storage (Memory ThirtyTwo (A_SizeDirective 32 (A_Plus (A_FromReg (General SixtyFour rax)) (A_Plus (A_Mult 1 (A_FromReg (General SixtyFour rax))) (A_WordConstant 0)))))), 5)"
    "fetch 0x87c8 \<equiv> (Binary (IS_80386 Movzx) (Reg (General ThirtyTwo rax)) (Storage (Memory Eight (A_SizeDirective 8 (A_Plus (A_FromReg (General SixtyFour r14)) (A_Mult 1 (A_FromReg (General SixtyFour r15))))))), 5)"
    "fetch 0x87cd \<equiv> (Binary (IS_8088 Mov) (Memory Eight (A_SizeDirective 8 (A_Plus (A_FromReg (General SixtyFour r13)) (A_Plus (A_Mult 1 (A_FromReg (General SixtyFour r15))) (A_WordConstant 0))))) (Storage (Reg (General Eight rax))), 5)"
    "fetch 0x87d2 \<equiv> (Binary (IS_8088 Add) (Reg (General SixtyFour r15)) (Immediate SixtyFour (ImmVal 1)), 4)"
    "fetch 0x87d6 \<equiv> (Binary (IS_8088 Cmp) (Reg (General SixtyFour r15)) (Immediate SixtyFour (ImmVal 16)), 4)"
    "fetch 0x87da \<equiv> (Unary (IS_8088 Jne) (Immediate SixtyFour (ImmVal 34760)), 2)"
    "fetch 0x87dc \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour rdx)) (Storage (Reg (General SixtyFour rbp))), 3)"
    "fetch 0x87df \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour rsi)) (Storage (Reg (General SixtyFour r13))), 3)"
    "fetch 0x87e2 \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour rdi)) (Storage (Reg (General SixtyFour r13))), 3)"
    "fetch 0x87e5 \<equiv> (Unary (IS_8088 Call) (Immediate SixtyFour (ImmLabel ''AES_encrypt'')), 5)"
    "fetch 0x87ea \<equiv> (Binary (IS_SSE2_SIMD Movdqa) (Reg (SIMD OneHundredTwentyEight ymm0w3 ymm0w2 ymm0w1 ymm0w0)) (Storage (Memory OneHundredTwentyEight (A_SizeDirective 128 (A_Plus (A_FromReg (General SixtyFour rsp)) (A_WordConstant 32))))), 6)"
    "fetch 0x87f0 \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour rax)) (Storage (Memory SixtyFour (A_SizeDirective 64 (A_Plus (A_FromReg (General SixtyFour rsp)) (A_WordConstant 16))))), 5)"
    "fetch 0x87f5 \<equiv> (Binary (IS_SSE_SIMD Movups) (Memory OneHundredTwentyEight (A_SizeDirective 128 (A_FromReg (General SixtyFour rax)))) (Storage (Reg (SIMD OneHundredTwentyEight ymm0w3 ymm0w2 ymm0w1 ymm0w0))), 3)"
    "fetch 0x87f8 \<equiv> (Binary (IS_SSE_SIMD Movups) (Memory OneHundredTwentyEight (A_SizeDirective 128 (A_FromReg (General SixtyFour r14)))) (Storage (Reg (SIMD OneHundredTwentyEight ymm0w3 ymm0w2 ymm0w1 ymm0w0))), 4)"
    "fetch 0x87fc \<equiv> (Unary (IS_8088 Jmp) (Immediate SixtyFour (ImmVal 34544)), 5)"
    "fetch 0x8801 \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour rax)) (Storage (Memory SixtyFour (A_SizeDirective 64 (A_Plus (A_FromReg (General SixtyFour rsp)) (A_WordConstant 8))))), 5)"
    "fetch 0x8806 \<equiv> (Binary (IS_8088 Lea) (Reg (General SixtyFour r13)) (Storage (Memory SixtyFour (A_Plus (A_FromReg (General SixtyFour rsp)) (A_WordConstant 32)))), 5)"
    "fetch 0x880b \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour rdx)) (Storage (Reg (General SixtyFour rbp))), 3)"
    "fetch 0x880e \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour rsi)) (Storage (Reg (General SixtyFour r13))), 3)"
    "fetch 0x8811 \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour rdi)) (Storage (Reg (General SixtyFour r13))), 3)"
    "fetch 0x8814 \<equiv> (Binary (IS_SSE2_SIMD Movdqu) (Reg (SIMD OneHundredTwentyEight ymm4w3 ymm4w2 ymm4w1 ymm4w0)) (Storage (Memory OneHundredTwentyEight (A_SizeDirective 128 (A_FromReg (General SixtyFour rax))))), 4)"
    "fetch 0x8818 \<equiv> (Binary (IS_SSE_SIMD Movaps) (Memory OneHundredTwentyEight (A_SizeDirective 128 (A_Plus (A_FromReg (General SixtyFour rsp)) (A_WordConstant 32)))) (Storage (Reg (SIMD OneHundredTwentyEight ymm4w3 ymm4w2 ymm4w1 ymm4w0))), 5)"
    "fetch 0x881d \<equiv> (Unary (IS_8088 Call) (Immediate SixtyFour (ImmLabel ''AES_decrypt'')), 5)"
    "fetch 0x8822 \<equiv> (Binary (IS_8088 Xor) (Reg (General ThirtyTwo rax)) (Storage (Reg (General ThirtyTwo rax))), 2)"
    "fetch 0x8824 \<equiv> (Unary (IS_8088 Nop) (Storage (Memory ThirtyTwo (A_SizeDirective 32 (A_Plus (A_FromReg (General SixtyFour rax)) (A_WordConstant 0))))), 4)"
    "fetch 0x8828 \<equiv> (Binary (IS_80386 Movzx) (Reg (General ThirtyTwo rdx)) (Storage (Memory Eight (A_SizeDirective 8 (A_Plus (A_FromReg (General SixtyFour r13)) (A_Plus (A_Mult 1 (A_FromReg (General SixtyFour rax))) (A_WordConstant 0)))))), 6)"
    "fetch 0x882e \<equiv> (Binary (IS_8088 Xor) (Reg (General Eight rdx)) (Storage (Memory Eight (A_SizeDirective 8 (A_Plus (A_FromReg (General SixtyFour r14)) (A_Mult 1 (A_FromReg (General SixtyFour rax))))))), 4)"
    "fetch 0x8832 \<equiv> (Binary (IS_8088 Mov) (Memory Eight (A_SizeDirective 8 (A_Plus (A_FromReg (General SixtyFour r12)) (A_Mult 1 (A_FromReg (General SixtyFour rax)))))) (Storage (Reg (General Eight rdx))), 4)"
    "fetch 0x8836 \<equiv> (Binary (IS_8088 Add) (Reg (General SixtyFour rax)) (Immediate SixtyFour (ImmVal 1)), 4)"
    "fetch 0x883a \<equiv> (Binary (IS_8088 Cmp) (Reg (General SixtyFour rax)) (Storage (Reg (General SixtyFour r15))), 3)"
    "fetch 0x883d \<equiv> (Unary (IS_8088 Jne) (Immediate SixtyFour (ImmVal 34856)), 2)"
    "fetch 0x883f \<equiv> (Binary (IS_SSE2_SIMD Movdqa) (Reg (SIMD OneHundredTwentyEight ymm5w3 ymm5w2 ymm5w1 ymm5w0)) (Storage (Memory OneHundredTwentyEight (A_SizeDirective 128 (A_Plus (A_FromReg (General SixtyFour rsp)) (A_WordConstant 32))))), 6)"
    "fetch 0x8845 \<equiv> (Binary (IS_SSE_SIMD Movups) (Memory OneHundredTwentyEight (A_SizeDirective 128 (A_FromReg (General SixtyFour r14)))) (Storage (Reg (SIMD OneHundredTwentyEight ymm5w3 ymm5w2 ymm5w1 ymm5w0))), 4)"
    "fetch 0x8849 \<equiv> (Unary (IS_8088 Jmp) (Immediate SixtyFour (ImmVal 34544)), 5)"
    "fetch 0x884e \<equiv> (Binary (IS_8088 Mov) (Memory SixtyFour (A_SizeDirective 64 (A_Plus (A_FromReg (General SixtyFour rsp)) (A_WordConstant 16)))) (Storage (Reg (General SixtyFour rsi))), 5)"
    "fetch 0x8853 \<equiv> (Unary (IS_8088 Jmp) (Immediate SixtyFour (ImmVal 34707)), 5)"
    "fetch 0x8858 \<equiv> (Unary (IS_8088 Call) (Immediate SixtyFour (ImmLabel ''__stack_chk_fail'')), 5)"
    and \<alpha>_def: \<open>\<alpha> = \<lparr>text_sections = [], data_sections = [], labels_to_offsets = [], binary_offset = 0\<rparr>\<close>
    and AES_decrypt\<^sub>a\<^sub>d\<^sub>d\<^sub>r[simp]: \<open>the (label_to_address \<alpha> ''AES_decrypt'') = AES_decrypt_addr\<close>
    and AES_encrypt\<^sub>a\<^sub>d\<^sub>d\<^sub>r[simp]: \<open>the (label_to_address \<alpha> ''AES_encrypt'') = AES_encrypt_addr\<close>
    and stack_chk_fail\<^sub>a\<^sub>d\<^sub>d\<^sub>r[simp]: \<open>the (label_to_address \<alpha> ''__stack_chk_fail'') = stack_chk_fail_addr\<close>
begin

text \<open>Using definitions that don't get unfolded immediately prevents locale argument issues.\<close>
definition \<open>AES_decrypt_0x86a4_retval \<equiv> AES_decrypt_0x86a4_retval\<^sub>v\<close>
definition \<open>AES_encrypt_0x876d_retval \<equiv> AES_encrypt_0x876d_retval\<^sub>v\<close>
definition \<open>AES_encrypt_0x87e5_retval \<equiv> AES_encrypt_0x87e5_retval\<^sub>v\<close>
definition \<open>AES_decrypt_0x881d_retval \<equiv> AES_decrypt_0x881d_retval\<^sub>v\<close>
definition \<open>stack_chk_fail_0x8858_retval \<equiv> stack_chk_fail_0x8858_retval\<^sub>v\<close>

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

locale "AES_cbc_encrypt" = "qemu_img_xen" +
  fixes RAX\<^sub>0\<^sub>v RBX\<^sub>0\<^sub>v RCX\<^sub>0\<^sub>v RDX\<^sub>0\<^sub>v RDI\<^sub>0\<^sub>v RSI\<^sub>0\<^sub>v RSP\<^sub>0\<^sub>v RBP\<^sub>0\<^sub>v R15\<^sub>0\<^sub>v R14\<^sub>0\<^sub>v R13\<^sub>0\<^sub>v R12\<^sub>0\<^sub>v R9\<^sub>0\<^sub>v R8\<^sub>0\<^sub>v FS\<^sub>0\<^sub>v ymm0w0\<^sub>0\<^sub>v ymm0w1\<^sub>0\<^sub>v ymm1w0\<^sub>0\<^sub>v ymm1w1\<^sub>0\<^sub>v ymm2w0\<^sub>0\<^sub>v ymm2w1\<^sub>0\<^sub>v ymm3w0\<^sub>0\<^sub>v ymm3w1\<^sub>0\<^sub>v ymm4w0\<^sub>0\<^sub>v ymm4w1\<^sub>0\<^sub>v ymm5w0\<^sub>0\<^sub>v ymm5w1\<^sub>0\<^sub>v ret_address\<^sub>v :: \<open>64 word\<close>
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
definition \<open>ymm4w0\<^sub>0 \<equiv> ymm4w0\<^sub>0\<^sub>v\<close>
definition \<open>ymm4w1\<^sub>0 \<equiv> ymm4w1\<^sub>0\<^sub>v\<close>
definition \<open>ymm5w0\<^sub>0 \<equiv> ymm5w0\<^sub>0\<^sub>v\<close>
definition \<open>ymm5w1\<^sub>0 \<equiv> ymm5w1\<^sub>0\<^sub>v\<close>
definition \<open>ret_address \<equiv> ret_address\<^sub>v\<close>

definition P_0x8630_0 :: state_pred where
  \<open>P_0x8630_0 \<sigma> \<equiv> RIP \<sigma> = 0x8630 \<and> RAX \<sigma> = RAX\<^sub>0 \<and> RBX \<sigma> = RBX\<^sub>0 \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = RDX\<^sub>0 \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = RSP\<^sub>0 \<and> RBP \<sigma> = RBP\<^sub>0 \<and> R15 \<sigma> = R15\<^sub>0 \<and> R14 \<sigma> = R14\<^sub>0 \<and> R13 \<sigma> = R13\<^sub>0 \<and> R12 \<sigma> = R12\<^sub>0 \<and> R9 \<sigma> = R9\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> regs \<sigma> ymm0w1 = ymm0w1\<^sub>0 \<and> regs \<sigma> ymm0w0 = ymm0w0\<^sub>0 \<and> regs \<sigma> ymm1w1 = ymm1w1\<^sub>0 \<and> regs \<sigma> ymm1w0 = ymm1w0\<^sub>0 \<and> regs \<sigma> ymm2w1 = ymm2w1\<^sub>0 \<and> regs \<sigma> ymm2w0 = ymm2w0\<^sub>0 \<and> regs \<sigma> ymm3w1 = ymm3w1\<^sub>0 \<and> regs \<sigma> ymm3w0 = ymm3w0\<^sub>0 \<and> regs \<sigma> ymm4w1 = ymm4w1\<^sub>0 \<and> regs \<sigma> ymm4w0 = ymm4w0\<^sub>0 \<and> regs \<sigma> ymm5w1 = ymm5w1\<^sub>0 \<and> regs \<sigma> ymm5w0 = ymm5w0\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address\<close>
declare P_0x8630_0_def[Ps]

definition P_0x8630_0_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x8630_0_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((FS\<^sub>0::64 word) + 0x28), 8),
    (2, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x40), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x70), 8)
  }\<close>

definition P_0x8630_0_regions :: state_pred where
  \<open>P_0x8630_0_regions \<sigma> \<equiv> \<exists>regions. P_0x8630_0_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x8662_0 :: state_pred where
  \<open>Q_0x8662_0 \<sigma> \<equiv> RIP \<sigma> = 0x8662 \<and> RAX \<sigma> = 0x0 \<and> RBX \<sigma> = RSI\<^sub>0 \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = RDX\<^sub>0 \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x78) \<and> RBP \<sigma> = RCX\<^sub>0 \<and> R15 \<sigma> = RDX\<^sub>0 \<and> R14 \<sigma> = R8\<^sub>0 \<and> R13 \<sigma> = R13\<^sub>0 \<and> R12 \<sigma> = R12\<^sub>0 \<and> R9 \<sigma> = R9\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> regs \<sigma> ymm0w1 = ymm0w1\<^sub>0 \<and> regs \<sigma> ymm0w0 = ymm0w0\<^sub>0 \<and> regs \<sigma> ymm1w1 = ymm1w1\<^sub>0 \<and> regs \<sigma> ymm1w0 = ymm1w0\<^sub>0 \<and> regs \<sigma> ymm2w1 = ymm2w1\<^sub>0 \<and> regs \<sigma> ymm2w0 = ymm2w0\<^sub>0 \<and> regs \<sigma> ymm3w1 = ymm3w1\<^sub>0 \<and> regs \<sigma> ymm3w0 = ymm3w0\<^sub>0 \<and> regs \<sigma> ymm4w1 = ymm4w1\<^sub>0 \<and> regs \<sigma> ymm4w0 = ymm4w0\<^sub>0 \<and> regs \<sigma> ymm5w1 = ymm5w1\<^sub>0 \<and> regs \<sigma> ymm5w0 = ymm5w0\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),8]::64 word) = RDI\<^sub>0\<close>
declare Q_0x8662_0_def[Qs]

schematic_goal AES_cbc_encrypt_0_16_0x8630_0x865f_0[blocks]:
  assumes \<open>(P_0x8630_0 && P_0x8630_0_regions) \<sigma>\<close>
  shows \<open>exec_block 16 0x865f 0 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x8662_0 ?\<sigma> \<and> block_usage P_0x8630_0_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x8630_0_def P_0x8630_0_regions_def post: Q_0x8662_0_def regionset: P_0x8630_0_regions_set_def)

definition P_0x8662_true_1 :: state_pred where
  \<open>P_0x8662_true_1 \<sigma> \<equiv> RIP \<sigma> = 0x8662 \<and> RAX \<sigma> = 0x0 \<and> RBX \<sigma> = RSI\<^sub>0 \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = RDX\<^sub>0 \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x78) \<and> RBP \<sigma> = RCX\<^sub>0 \<and> R15 \<sigma> = RDX\<^sub>0 \<and> R14 \<sigma> = R8\<^sub>0 \<and> R13 \<sigma> = R13\<^sub>0 \<and> R12 \<sigma> = R12\<^sub>0 \<and> R9 \<sigma> = R9\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> regs \<sigma> ymm0w1 = ymm0w1\<^sub>0 \<and> regs \<sigma> ymm0w0 = ymm0w0\<^sub>0 \<and> regs \<sigma> ymm1w1 = ymm1w1\<^sub>0 \<and> regs \<sigma> ymm1w0 = ymm1w0\<^sub>0 \<and> regs \<sigma> ymm2w1 = ymm2w1\<^sub>0 \<and> regs \<sigma> ymm2w0 = ymm2w0\<^sub>0 \<and> regs \<sigma> ymm3w1 = ymm3w1\<^sub>0 \<and> regs \<sigma> ymm3w0 = ymm3w0\<^sub>0 \<and> regs \<sigma> ymm4w1 = ymm4w1\<^sub>0 \<and> regs \<sigma> ymm4w0 = ymm4w0\<^sub>0 \<and> regs \<sigma> ymm5w1 = ymm5w1\<^sub>0 \<and> regs \<sigma> ymm5w0 = ymm5w0\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),8]::64 word) = RDI\<^sub>0\<close>
declare P_0x8662_true_1_def[Ps]

definition P_0x8662_true_1_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x8662_true_1_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((FS\<^sub>0::64 word) + 0x28), 8),
    (2, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x40), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x70), 8)
  }\<close>

definition P_0x8662_true_1_regions :: state_pred where
  \<open>P_0x8662_true_1_regions \<sigma> \<equiv> \<exists>regions. P_0x8662_true_1_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x8717_1 :: state_pred where
  \<open>Q_0x8717_1 \<sigma> \<equiv> RIP \<sigma> = 0x8717 \<and> RAX \<sigma> = 0x0 \<and> RBX \<sigma> = RSI\<^sub>0 \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = RDX\<^sub>0 \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x78) \<and> RBP \<sigma> = RCX\<^sub>0 \<and> R15 \<sigma> = RDX\<^sub>0 \<and> R14 \<sigma> = R8\<^sub>0 \<and> R13 \<sigma> = R13\<^sub>0 \<and> R12 \<sigma> = R12\<^sub>0 \<and> R9 \<sigma> = R9\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> regs \<sigma> ymm0w1 = ymm0w1\<^sub>0 \<and> regs \<sigma> ymm0w0 = ymm0w0\<^sub>0 \<and> regs \<sigma> ymm1w1 = ymm1w1\<^sub>0 \<and> regs \<sigma> ymm1w0 = ymm1w0\<^sub>0 \<and> regs \<sigma> ymm2w1 = ymm2w1\<^sub>0 \<and> regs \<sigma> ymm2w0 = ymm2w0\<^sub>0 \<and> regs \<sigma> ymm3w1 = ymm3w1\<^sub>0 \<and> regs \<sigma> ymm3w0 = ymm3w0\<^sub>0 \<and> regs \<sigma> ymm4w1 = ymm4w1\<^sub>0 \<and> regs \<sigma> ymm4w0 = ymm4w0\<^sub>0 \<and> regs \<sigma> ymm5w1 = ymm5w1\<^sub>0 \<and> regs \<sigma> ymm5w0 = ymm5w0\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),8]::64 word) = RDI\<^sub>0\<close>
declare Q_0x8717_1_def[Qs]

schematic_goal AES_cbc_encrypt_0_2_0x8662_0x8713_1[blocks]:
  assumes \<open>(P_0x8662_true_1 && P_0x8662_true_1_regions && !ZF) \<sigma>\<close>
  shows \<open>exec_block 2 0x8713 (Suc 0) \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x8717_1 ?\<sigma> \<and> block_usage P_0x8662_true_1_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x8662_true_1_def P_0x8662_true_1_regions_def post: Q_0x8717_1_def regionset: P_0x8662_true_1_regions_set_def)

definition P_0x8717_true_2 :: state_pred where
  \<open>P_0x8717_true_2 \<sigma> \<equiv> RIP \<sigma> = 0x8717 \<and> RAX \<sigma> = 0x0 \<and> RBX \<sigma> = RSI\<^sub>0 \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = RDX\<^sub>0 \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x78) \<and> RBP \<sigma> = RCX\<^sub>0 \<and> R15 \<sigma> = RDX\<^sub>0 \<and> R14 \<sigma> = R8\<^sub>0 \<and> R13 \<sigma> = R13\<^sub>0 \<and> R12 \<sigma> = R12\<^sub>0 \<and> R9 \<sigma> = R9\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> regs \<sigma> ymm0w1 = ymm0w1\<^sub>0 \<and> regs \<sigma> ymm0w0 = ymm0w0\<^sub>0 \<and> regs \<sigma> ymm1w1 = ymm1w1\<^sub>0 \<and> regs \<sigma> ymm1w0 = ymm1w0\<^sub>0 \<and> regs \<sigma> ymm2w1 = ymm2w1\<^sub>0 \<and> regs \<sigma> ymm2w0 = ymm2w0\<^sub>0 \<and> regs \<sigma> ymm3w1 = ymm3w1\<^sub>0 \<and> regs \<sigma> ymm3w0 = ymm3w0\<^sub>0 \<and> regs \<sigma> ymm4w1 = ymm4w1\<^sub>0 \<and> regs \<sigma> ymm4w0 = ymm4w0\<^sub>0 \<and> regs \<sigma> ymm5w1 = ymm5w1\<^sub>0 \<and> regs \<sigma> ymm5w0 = ymm5w0\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),8]::64 word) = RDI\<^sub>0\<close>
declare P_0x8717_true_2_def[Ps]

definition P_0x8717_true_2_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x8717_true_2_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((FS\<^sub>0::64 word) + 0x28), 8),
    (2, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x40), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x68), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x70), 8)
  }\<close>

definition P_0x8717_true_2_regions :: state_pred where
  \<open>P_0x8717_true_2_regions \<sigma> \<equiv> \<exists>regions. P_0x8717_true_2_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x8793_2 :: state_pred where
  \<open>Q_0x8793_2 \<sigma> \<equiv> RIP \<sigma> = 0x8793 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x78) \<and> RBP \<sigma> = RCX\<^sub>0 \<and> R14 \<sigma> = R8\<^sub>0 \<and> R9 \<sigma> = R9\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> regs \<sigma> ymm0w1 = ymm0w1\<^sub>0 \<and> regs \<sigma> ymm0w0 = ymm0w0\<^sub>0 \<and> regs \<sigma> ymm2w1 = ymm2w1\<^sub>0 \<and> regs \<sigma> ymm2w0 = ymm2w0\<^sub>0 \<and> regs \<sigma> ymm3w1 = ymm3w1\<^sub>0 \<and> regs \<sigma> ymm3w0 = ymm3w0\<^sub>0 \<and> regs \<sigma> ymm4w1 = ymm4w1\<^sub>0 \<and> regs \<sigma> ymm4w0 = ymm4w0\<^sub>0 \<and> regs \<sigma> ymm5w1 = ymm5w1\<^sub>0 \<and> regs \<sigma> ymm5w0 = ymm5w0\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word)\<close>
declare Q_0x8793_2_def[Qs]

schematic_goal AES_cbc_encrypt_0_3_0x8717_0x8853_2[blocks]:
  assumes \<open>(P_0x8717_true_2 && P_0x8717_true_2_regions && jbe) \<sigma>\<close>
  shows \<open>exec_block 3 0x8853 2 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x8793_2 ?\<sigma> \<and> block_usage P_0x8717_true_2_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x8717_true_2_def P_0x8717_true_2_regions_def post: Q_0x8793_2_def regionset: P_0x8717_true_2_regions_set_def)

definition P_0x8717_false_3 :: state_pred where
  \<open>P_0x8717_false_3 \<sigma> \<equiv> RIP \<sigma> = 0x8717 \<and> RAX \<sigma> = 0x0 \<and> RBX \<sigma> = RSI\<^sub>0 \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = RDX\<^sub>0 \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x78) \<and> RBP \<sigma> = RCX\<^sub>0 \<and> R15 \<sigma> = RDX\<^sub>0 \<and> R14 \<sigma> = R8\<^sub>0 \<and> R13 \<sigma> = R13\<^sub>0 \<and> R12 \<sigma> = R12\<^sub>0 \<and> R9 \<sigma> = R9\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> regs \<sigma> ymm0w1 = ymm0w1\<^sub>0 \<and> regs \<sigma> ymm0w0 = ymm0w0\<^sub>0 \<and> regs \<sigma> ymm1w1 = ymm1w1\<^sub>0 \<and> regs \<sigma> ymm1w0 = ymm1w0\<^sub>0 \<and> regs \<sigma> ymm2w1 = ymm2w1\<^sub>0 \<and> regs \<sigma> ymm2w0 = ymm2w0\<^sub>0 \<and> regs \<sigma> ymm3w1 = ymm3w1\<^sub>0 \<and> regs \<sigma> ymm3w0 = ymm3w0\<^sub>0 \<and> regs \<sigma> ymm4w1 = ymm4w1\<^sub>0 \<and> regs \<sigma> ymm4w0 = ymm4w0\<^sub>0 \<and> regs \<sigma> ymm5w1 = ymm5w1\<^sub>0 \<and> regs \<sigma> ymm5w0 = ymm5w0\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),8]::64 word) = RDI\<^sub>0\<close>
declare P_0x8717_false_3_def[Ps]

definition P_0x8717_false_3_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x8717_false_3_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((FS\<^sub>0::64 word) + 0x28), 8),
    (2, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x40), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x60), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x68), 8),
    (11, ((RSP\<^sub>0::64 word) - 0x70), 8)
  }\<close>

definition P_0x8717_false_3_regions :: state_pred where
  \<open>P_0x8717_false_3_regions \<sigma> \<equiv> \<exists>regions. P_0x8717_false_3_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x8740_3 :: state_pred where
  \<open>Q_0x8740_3 \<sigma> \<equiv> RIP \<sigma> = 0x8740 \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x78) \<and> RBP \<sigma> = RCX\<^sub>0 \<and> R15 \<sigma> = RDX\<^sub>0 \<and> R14 \<sigma> = R8\<^sub>0 \<and> R13 \<sigma> = ((RSP\<^sub>0::64 word) - 0x58) \<and> R9 \<sigma> = R9\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> regs \<sigma> ymm0w1 = ymm0w1\<^sub>0 \<and> regs \<sigma> ymm0w0 = ymm0w0\<^sub>0 \<and> regs \<sigma> ymm2w1 = ymm2w1\<^sub>0 \<and> regs \<sigma> ymm2w0 = ymm2w0\<^sub>0 \<and> regs \<sigma> ymm3w1 = ymm3w1\<^sub>0 \<and> regs \<sigma> ymm3w0 = ymm3w0\<^sub>0 \<and> regs \<sigma> ymm4w1 = ymm4w1\<^sub>0 \<and> regs \<sigma> ymm4w0 = ymm4w0\<^sub>0 \<and> regs \<sigma> ymm5w1 = ymm5w1\<^sub>0 \<and> regs \<sigma> ymm5w0 = ymm5w0\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x60),8]::64 word) = ((((((RDX\<^sub>0::64 word) - 0x10)::64 word) AND 0xfffffffffffffff0)::64 word) + 0x10) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),8]::64 word) = ((((((((RDX\<^sub>0::64 word) - 0x10)::64 word) AND 0xfffffffffffffff0)::64 word) + RSI\<^sub>0)::64 word) + 0x10) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),8]::64 word) = RDI\<^sub>0\<close>
declare Q_0x8740_3_def[Qs]

schematic_goal AES_cbc_encrypt_0_9_0x8717_0x873b_3[blocks]:
  assumes \<open>(P_0x8717_false_3 && P_0x8717_false_3_regions && ! jbe) \<sigma>\<close>
  shows \<open>exec_block 9 0x873b 3 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x8740_3 ?\<sigma> \<and> block_usage P_0x8717_false_3_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x8717_false_3_def P_0x8717_false_3_regions_def post: Q_0x8740_3_def regionset: P_0x8717_false_3_regions_set_def)

definition P_0x8740_4 :: state_pred where
  \<open>P_0x8740_4 \<sigma> \<equiv> RIP \<sigma> = 0x8740 \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x78) \<and> RBP \<sigma> = RCX\<^sub>0 \<and> R15 \<sigma> = RDX\<^sub>0 \<and> R14 \<sigma> = R8\<^sub>0 \<and> R13 \<sigma> = ((RSP\<^sub>0::64 word) - 0x58) \<and> R9 \<sigma> = R9\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> regs \<sigma> ymm0w1 = ymm0w1\<^sub>0 \<and> regs \<sigma> ymm0w0 = ymm0w0\<^sub>0 \<and> regs \<sigma> ymm2w1 = ymm2w1\<^sub>0 \<and> regs \<sigma> ymm2w0 = ymm2w0\<^sub>0 \<and> regs \<sigma> ymm3w1 = ymm3w1\<^sub>0 \<and> regs \<sigma> ymm3w0 = ymm3w0\<^sub>0 \<and> regs \<sigma> ymm4w1 = ymm4w1\<^sub>0 \<and> regs \<sigma> ymm4w0 = ymm4w0\<^sub>0 \<and> regs \<sigma> ymm5w1 = ymm5w1\<^sub>0 \<and> regs \<sigma> ymm5w0 = ymm5w0\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x60),8]::64 word) = ((((((RDX\<^sub>0::64 word) - 0x10)::64 word) AND 0xfffffffffffffff0)::64 word) + 0x10) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),8]::64 word) = ((((((((RDX\<^sub>0::64 word) - 0x10)::64 word) AND 0xfffffffffffffff0)::64 word) + RSI\<^sub>0)::64 word) + 0x10) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),8]::64 word) = RDI\<^sub>0\<close>
declare P_0x8740_4_def[Ps]

definition P_0x8740_4_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x8740_4_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((FS\<^sub>0::64 word) + 0x28), 8),
    (2, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x40), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x60), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x68), 8),
    (11, ((RSP\<^sub>0::64 word) - 0x70), 8)
  }\<close>

definition P_0x8740_4_regions :: state_pred where
  \<open>P_0x8740_4_regions \<sigma> \<equiv> \<exists>regions. P_0x8740_4_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x8748_4 :: state_pred where
  \<open>Q_0x8748_4 \<sigma> \<equiv> RIP \<sigma> = 0x8748 \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x78) \<and> RBP \<sigma> = RCX\<^sub>0 \<and> R15 \<sigma> = RDX\<^sub>0 \<and> R14 \<sigma> = R8\<^sub>0 \<and> R13 \<sigma> = ((RSP\<^sub>0::64 word) - 0x58) \<and> R9 \<sigma> = R9\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> regs \<sigma> ymm0w1 = ymm0w1\<^sub>0 \<and> regs \<sigma> ymm0w0 = ymm0w0\<^sub>0 \<and> regs \<sigma> ymm2w1 = ymm2w1\<^sub>0 \<and> regs \<sigma> ymm2w0 = ymm2w0\<^sub>0 \<and> regs \<sigma> ymm3w1 = ymm3w1\<^sub>0 \<and> regs \<sigma> ymm3w0 = ymm3w0\<^sub>0 \<and> regs \<sigma> ymm4w1 = ymm4w1\<^sub>0 \<and> regs \<sigma> ymm4w0 = ymm4w0\<^sub>0 \<and> regs \<sigma> ymm5w1 = ymm5w1\<^sub>0 \<and> regs \<sigma> ymm5w0 = ymm5w0\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x60),8]::64 word) = ((((((RDX\<^sub>0::64 word) - 0x10)::64 word) AND 0xfffffffffffffff0)::64 word) + 0x10) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),8]::64 word) = ((((((((RDX\<^sub>0::64 word) - 0x10)::64 word) AND 0xfffffffffffffff0)::64 word) + RSI\<^sub>0)::64 word) + 0x10) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),8]::64 word) = RDI\<^sub>0\<close>
declare Q_0x8748_4_def[Qs]

schematic_goal AES_cbc_encrypt_0_2_0x8740_0x8742_4[blocks]:
  assumes \<open>(P_0x8740_4 && P_0x8740_4_regions) \<sigma>\<close>
  shows \<open>exec_block 2 0x8742 4 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x8748_4 ?\<sigma> \<and> block_usage P_0x8740_4_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x8740_4_def P_0x8740_4_regions_def post: Q_0x8748_4_def regionset: P_0x8740_4_regions_set_def)

definition P_0x8748_5 :: state_pred where
  \<open>P_0x8748_5 \<sigma> \<equiv> RIP \<sigma> = 0x8748 \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x78) \<and> RBP \<sigma> = RCX\<^sub>0 \<and> R15 \<sigma> = RDX\<^sub>0 \<and> R14 \<sigma> = R8\<^sub>0 \<and> R13 \<sigma> = ((RSP\<^sub>0::64 word) - 0x58) \<and> R9 \<sigma> = R9\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> regs \<sigma> ymm0w1 = ymm0w1\<^sub>0 \<and> regs \<sigma> ymm0w0 = ymm0w0\<^sub>0 \<and> regs \<sigma> ymm2w1 = ymm2w1\<^sub>0 \<and> regs \<sigma> ymm2w0 = ymm2w0\<^sub>0 \<and> regs \<sigma> ymm3w1 = ymm3w1\<^sub>0 \<and> regs \<sigma> ymm3w0 = ymm3w0\<^sub>0 \<and> regs \<sigma> ymm4w1 = ymm4w1\<^sub>0 \<and> regs \<sigma> ymm4w0 = ymm4w0\<^sub>0 \<and> regs \<sigma> ymm5w1 = ymm5w1\<^sub>0 \<and> regs \<sigma> ymm5w0 = ymm5w0\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x60),8]::64 word) = ((((((RDX\<^sub>0::64 word) - 0x10)::64 word) AND 0xfffffffffffffff0)::64 word) + 0x10) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),8]::64 word) = ((((((((RDX\<^sub>0::64 word) - 0x10)::64 word) AND 0xfffffffffffffff0)::64 word) + RSI\<^sub>0)::64 word) + 0x10) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),8]::64 word) = RDI\<^sub>0\<close>
declare P_0x8748_5_def[Ps]

definition P_0x8748_5_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x8748_5_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((R12 \<sigma>::64 word) + (\<langle>63,0\<rangle>((RAX \<sigma>::64 word) * 0x1)::64 word)), Suc 0),
    (2, ((FS\<^sub>0::64 word) + 0x28), 8),
    (3, ((R8\<^sub>0::64 word) + (\<langle>63,0\<rangle>((RAX \<sigma>::64 word) * 0x1)::64 word)), Suc 0),
    (4, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x40), 8),
    (11, ((RSP\<^sub>0::64 word) - 0x60), 8),
    (12, ((RSP\<^sub>0::64 word) - 0x68), 8),
    (13, ((RSP\<^sub>0::64 word) - 0x70), 8),
    (14, ((((RSP\<^sub>0::64 word) + (\<langle>63,0\<rangle>((RAX \<sigma>::64 word) * 0x1)::64 word))::64 word) - 0x58), Suc 0)
  }\<close>

definition P_0x8748_5_regions :: state_pred where
  \<open>P_0x8748_5_regions \<sigma> \<equiv> \<exists>regions. P_0x8748_5_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x875e_5 :: state_pred where
  \<open>Q_0x875e_5 \<sigma> \<equiv> RIP \<sigma> = 0x875e \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x78) \<and> RBP \<sigma> = RCX\<^sub>0 \<and> R15 \<sigma> = RDX\<^sub>0 \<and> R14 \<sigma> = R8\<^sub>0 \<and> R13 \<sigma> = ((RSP\<^sub>0::64 word) - 0x58) \<and> R9 \<sigma> = R9\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> regs \<sigma> ymm0w1 = ymm0w1\<^sub>0 \<and> regs \<sigma> ymm0w0 = ymm0w0\<^sub>0 \<and> regs \<sigma> ymm2w1 = ymm2w1\<^sub>0 \<and> regs \<sigma> ymm2w0 = ymm2w0\<^sub>0 \<and> regs \<sigma> ymm3w1 = ymm3w1\<^sub>0 \<and> regs \<sigma> ymm3w0 = ymm3w0\<^sub>0 \<and> regs \<sigma> ymm4w1 = ymm4w1\<^sub>0 \<and> regs \<sigma> ymm4w0 = ymm4w0\<^sub>0 \<and> regs \<sigma> ymm5w1 = ymm5w1\<^sub>0 \<and> regs \<sigma> ymm5w0 = ymm5w0\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x60),8]::64 word) = ((((((RDX\<^sub>0::64 word) - 0x10)::64 word) AND 0xfffffffffffffff0)::64 word) + 0x10) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),8]::64 word) = ((((((((RDX\<^sub>0::64 word) - 0x10)::64 word) AND 0xfffffffffffffff0)::64 word) + RSI\<^sub>0)::64 word) + 0x10) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),8]::64 word) = RDI\<^sub>0\<close>
declare Q_0x875e_5_def[Qs]

schematic_goal AES_cbc_encrypt_0_5_0x8748_0x875a_5[blocks]:
  assumes \<open>(P_0x8748_5 && P_0x8748_5_regions) \<sigma>\<close>
  shows \<open>exec_block 5 0x875a 5 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x875e_5 ?\<sigma> \<and> block_usage P_0x8748_5_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x8748_5_def P_0x8748_5_regions_def post: Q_0x875e_5_def regionset: P_0x8748_5_regions_set_def)

definition P_0x875e_true_6 :: state_pred where
  \<open>P_0x875e_true_6 \<sigma> \<equiv> RIP \<sigma> = 0x875e \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x78) \<and> RBP \<sigma> = RCX\<^sub>0 \<and> R15 \<sigma> = RDX\<^sub>0 \<and> R14 \<sigma> = R8\<^sub>0 \<and> R13 \<sigma> = ((RSP\<^sub>0::64 word) - 0x58) \<and> R9 \<sigma> = R9\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> regs \<sigma> ymm0w1 = ymm0w1\<^sub>0 \<and> regs \<sigma> ymm0w0 = ymm0w0\<^sub>0 \<and> regs \<sigma> ymm2w1 = ymm2w1\<^sub>0 \<and> regs \<sigma> ymm2w0 = ymm2w0\<^sub>0 \<and> regs \<sigma> ymm3w1 = ymm3w1\<^sub>0 \<and> regs \<sigma> ymm3w0 = ymm3w0\<^sub>0 \<and> regs \<sigma> ymm4w1 = ymm4w1\<^sub>0 \<and> regs \<sigma> ymm4w0 = ymm4w0\<^sub>0 \<and> regs \<sigma> ymm5w1 = ymm5w1\<^sub>0 \<and> regs \<sigma> ymm5w0 = ymm5w0\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x60),8]::64 word) = ((((((RDX\<^sub>0::64 word) - 0x10)::64 word) AND 0xfffffffffffffff0)::64 word) + 0x10) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),8]::64 word) = ((((((((RDX\<^sub>0::64 word) - 0x10)::64 word) AND 0xfffffffffffffff0)::64 word) + RSI\<^sub>0)::64 word) + 0x10) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),8]::64 word) = RDI\<^sub>0\<close>
declare P_0x875e_true_6_def[Ps]

definition P_0x875e_true_6_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x875e_true_6_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((FS\<^sub>0::64 word) + 0x28), 8),
    (2, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x40), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x60), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x68), 8),
    (11, ((RSP\<^sub>0::64 word) - 0x70), 8)
  }\<close>

definition P_0x875e_true_6_regions :: state_pred where
  \<open>P_0x875e_true_6_regions \<sigma> \<equiv> \<exists>regions. P_0x875e_true_6_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x8748_6 :: state_pred where
  \<open>Q_0x8748_6 \<sigma> \<equiv> RIP \<sigma> = 0x8748 \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x78) \<and> RBP \<sigma> = RCX\<^sub>0 \<and> R15 \<sigma> = RDX\<^sub>0 \<and> R14 \<sigma> = R8\<^sub>0 \<and> R13 \<sigma> = ((RSP\<^sub>0::64 word) - 0x58) \<and> R9 \<sigma> = R9\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> regs \<sigma> ymm0w1 = ymm0w1\<^sub>0 \<and> regs \<sigma> ymm0w0 = ymm0w0\<^sub>0 \<and> regs \<sigma> ymm2w1 = ymm2w1\<^sub>0 \<and> regs \<sigma> ymm2w0 = ymm2w0\<^sub>0 \<and> regs \<sigma> ymm3w1 = ymm3w1\<^sub>0 \<and> regs \<sigma> ymm3w0 = ymm3w0\<^sub>0 \<and> regs \<sigma> ymm4w1 = ymm4w1\<^sub>0 \<and> regs \<sigma> ymm4w0 = ymm4w0\<^sub>0 \<and> regs \<sigma> ymm5w1 = ymm5w1\<^sub>0 \<and> regs \<sigma> ymm5w0 = ymm5w0\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x60),8]::64 word) = ((((((RDX\<^sub>0::64 word) - 0x10)::64 word) AND 0xfffffffffffffff0)::64 word) + 0x10) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),8]::64 word) = ((((((((RDX\<^sub>0::64 word) - 0x10)::64 word) AND 0xfffffffffffffff0)::64 word) + RSI\<^sub>0)::64 word) + 0x10) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),8]::64 word) = RDI\<^sub>0\<close>
declare Q_0x8748_6_def[Qs]

schematic_goal AES_cbc_encrypt_0_1_0x875e_0x875e_6[blocks]:
  assumes \<open>(P_0x875e_true_6 && P_0x875e_true_6_regions && !ZF) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x875e 6 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x8748_6 ?\<sigma> \<and> block_usage P_0x875e_true_6_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x875e_true_6_def P_0x875e_true_6_regions_def post: Q_0x8748_6_def regionset: P_0x875e_true_6_regions_set_def)

definition P_0x875e_false_7 :: state_pred where
  \<open>P_0x875e_false_7 \<sigma> \<equiv> RIP \<sigma> = 0x875e \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x78) \<and> RBP \<sigma> = RCX\<^sub>0 \<and> R15 \<sigma> = RDX\<^sub>0 \<and> R14 \<sigma> = R8\<^sub>0 \<and> R13 \<sigma> = ((RSP\<^sub>0::64 word) - 0x58) \<and> R9 \<sigma> = R9\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> regs \<sigma> ymm0w1 = ymm0w1\<^sub>0 \<and> regs \<sigma> ymm0w0 = ymm0w0\<^sub>0 \<and> regs \<sigma> ymm2w1 = ymm2w1\<^sub>0 \<and> regs \<sigma> ymm2w0 = ymm2w0\<^sub>0 \<and> regs \<sigma> ymm3w1 = ymm3w1\<^sub>0 \<and> regs \<sigma> ymm3w0 = ymm3w0\<^sub>0 \<and> regs \<sigma> ymm4w1 = ymm4w1\<^sub>0 \<and> regs \<sigma> ymm4w0 = ymm4w0\<^sub>0 \<and> regs \<sigma> ymm5w1 = ymm5w1\<^sub>0 \<and> regs \<sigma> ymm5w0 = ymm5w0\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x60),8]::64 word) = ((((((RDX\<^sub>0::64 word) - 0x10)::64 word) AND 0xfffffffffffffff0)::64 word) + 0x10) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),8]::64 word) = ((((((((RDX\<^sub>0::64 word) - 0x10)::64 word) AND 0xfffffffffffffff0)::64 word) + RSI\<^sub>0)::64 word) + 0x10) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),8]::64 word) = RDI\<^sub>0\<close>
declare P_0x875e_false_7_def[Ps]

definition P_0x875e_false_7_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x875e_false_7_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((FS\<^sub>0::64 word) + 0x28), 8),
    (2, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x40), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x60), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x68), 8),
    (11, ((RSP\<^sub>0::64 word) - 0x70), 8)
  }\<close>

definition P_0x875e_false_7_regions :: state_pred where
  \<open>P_0x875e_false_7_regions \<sigma> \<equiv> \<exists>regions. P_0x875e_false_7_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x8760_7 :: state_pred where
  \<open>Q_0x8760_7 \<sigma> \<equiv> RIP \<sigma> = 0x8760 \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x78) \<and> RBP \<sigma> = RCX\<^sub>0 \<and> R15 \<sigma> = RDX\<^sub>0 \<and> R14 \<sigma> = R8\<^sub>0 \<and> R13 \<sigma> = ((RSP\<^sub>0::64 word) - 0x58) \<and> R9 \<sigma> = R9\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> regs \<sigma> ymm0w1 = ymm0w1\<^sub>0 \<and> regs \<sigma> ymm0w0 = ymm0w0\<^sub>0 \<and> regs \<sigma> ymm2w1 = ymm2w1\<^sub>0 \<and> regs \<sigma> ymm2w0 = ymm2w0\<^sub>0 \<and> regs \<sigma> ymm3w1 = ymm3w1\<^sub>0 \<and> regs \<sigma> ymm3w0 = ymm3w0\<^sub>0 \<and> regs \<sigma> ymm4w1 = ymm4w1\<^sub>0 \<and> regs \<sigma> ymm4w0 = ymm4w0\<^sub>0 \<and> regs \<sigma> ymm5w1 = ymm5w1\<^sub>0 \<and> regs \<sigma> ymm5w0 = ymm5w0\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x60),8]::64 word) = ((((((RDX\<^sub>0::64 word) - 0x10)::64 word) AND 0xfffffffffffffff0)::64 word) + 0x10) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),8]::64 word) = ((((((((RDX\<^sub>0::64 word) - 0x10)::64 word) AND 0xfffffffffffffff0)::64 word) + RSI\<^sub>0)::64 word) + 0x10) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),8]::64 word) = RDI\<^sub>0\<close>
declare Q_0x8760_7_def[Qs]

schematic_goal AES_cbc_encrypt_0_1_0x875e_0x875e_7[blocks]:
  assumes \<open>(P_0x875e_false_7 && P_0x875e_false_7_regions && ! !ZF) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x875e 7 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x8760_7 ?\<sigma> \<and> block_usage P_0x875e_false_7_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x875e_false_7_def P_0x875e_false_7_regions_def post: Q_0x8760_7_def regionset: P_0x875e_false_7_regions_set_def)

definition P_0x8760_8 :: state_pred where
  \<open>P_0x8760_8 \<sigma> \<equiv> RIP \<sigma> = 0x8760 \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x78) \<and> RBP \<sigma> = RCX\<^sub>0 \<and> R15 \<sigma> = RDX\<^sub>0 \<and> R14 \<sigma> = R8\<^sub>0 \<and> R13 \<sigma> = ((RSP\<^sub>0::64 word) - 0x58) \<and> R9 \<sigma> = R9\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> regs \<sigma> ymm0w1 = ymm0w1\<^sub>0 \<and> regs \<sigma> ymm0w0 = ymm0w0\<^sub>0 \<and> regs \<sigma> ymm2w1 = ymm2w1\<^sub>0 \<and> regs \<sigma> ymm2w0 = ymm2w0\<^sub>0 \<and> regs \<sigma> ymm3w1 = ymm3w1\<^sub>0 \<and> regs \<sigma> ymm3w0 = ymm3w0\<^sub>0 \<and> regs \<sigma> ymm4w1 = ymm4w1\<^sub>0 \<and> regs \<sigma> ymm4w0 = ymm4w0\<^sub>0 \<and> regs \<sigma> ymm5w1 = ymm5w1\<^sub>0 \<and> regs \<sigma> ymm5w0 = ymm5w0\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x60),8]::64 word) = ((((((RDX\<^sub>0::64 word) - 0x10)::64 word) AND 0xfffffffffffffff0)::64 word) + 0x10) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),8]::64 word) = ((((((((RDX\<^sub>0::64 word) - 0x10)::64 word) AND 0xfffffffffffffff0)::64 word) + RSI\<^sub>0)::64 word) + 0x10) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),8]::64 word) = RDI\<^sub>0\<close>
declare P_0x8760_8_def[Ps]

definition P_0x8760_8_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x8760_8_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((FS\<^sub>0::64 word) + 0x28), 8),
    (2, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x40), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x60), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x68), 8),
    (11, ((RSP\<^sub>0::64 word) - 0x70), 8)
  }\<close>

definition P_0x8760_8_regions :: state_pred where
  \<open>P_0x8760_8_regions \<sigma> \<equiv> \<exists>regions. P_0x8760_8_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x876d_8 :: state_pred where
  \<open>Q_0x876d_8 \<sigma> \<equiv> RIP \<sigma> = 0x876d \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = RCX\<^sub>0 \<and> RDI \<sigma> = ((RSP\<^sub>0::64 word) - 0x58) \<and> RSI \<sigma> = RBX \<sigma> \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x78) \<and> RBP \<sigma> = RCX\<^sub>0 \<and> R15 \<sigma> = RDX\<^sub>0 \<and> R14 \<sigma> = R8\<^sub>0 \<and> R13 \<sigma> = ((RSP\<^sub>0::64 word) - 0x58) \<and> R9 \<sigma> = R9\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> regs \<sigma> ymm0w1 = ymm0w1\<^sub>0 \<and> regs \<sigma> ymm0w0 = ymm0w0\<^sub>0 \<and> regs \<sigma> ymm2w1 = ymm2w1\<^sub>0 \<and> regs \<sigma> ymm2w0 = ymm2w0\<^sub>0 \<and> regs \<sigma> ymm3w1 = ymm3w1\<^sub>0 \<and> regs \<sigma> ymm3w0 = ymm3w0\<^sub>0 \<and> regs \<sigma> ymm4w1 = ymm4w1\<^sub>0 \<and> regs \<sigma> ymm4w0 = ymm4w0\<^sub>0 \<and> regs \<sigma> ymm5w1 = ymm5w1\<^sub>0 \<and> regs \<sigma> ymm5w0 = ymm5w0\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x60),8]::64 word) = ((((((RDX\<^sub>0::64 word) - 0x10)::64 word) AND 0xfffffffffffffff0)::64 word) + 0x10) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),8]::64 word) = ((((((((RDX\<^sub>0::64 word) - 0x10)::64 word) AND 0xfffffffffffffff0)::64 word) + RSI\<^sub>0)::64 word) + 0x10) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),8]::64 word) = RDI\<^sub>0\<close>
declare Q_0x876d_8_def[Qs]

schematic_goal AES_cbc_encrypt_0_4_0x8760_0x8769_8[blocks]:
  assumes \<open>(P_0x8760_8 && P_0x8760_8_regions) \<sigma>\<close>
  shows \<open>exec_block 4 0x8769 8 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x876d_8 ?\<sigma> \<and> block_usage P_0x8760_8_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x8760_8_def P_0x8760_8_regions_def post: Q_0x876d_8_def regionset: P_0x8760_8_regions_set_def)

definition P_0x876d_9 :: state_pred where
  \<open>P_0x876d_9 \<sigma> \<equiv> RIP \<sigma> = 0x876d \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = RCX\<^sub>0 \<and> RDI \<sigma> = ((RSP\<^sub>0::64 word) - 0x58) \<and> RSI \<sigma> = RBX \<sigma> \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x78) \<and> RBP \<sigma> = RCX\<^sub>0 \<and> R15 \<sigma> = RDX\<^sub>0 \<and> R14 \<sigma> = R8\<^sub>0 \<and> R13 \<sigma> = ((RSP\<^sub>0::64 word) - 0x58) \<and> R9 \<sigma> = R9\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> regs \<sigma> ymm0w1 = ymm0w1\<^sub>0 \<and> regs \<sigma> ymm0w0 = ymm0w0\<^sub>0 \<and> regs \<sigma> ymm2w1 = ymm2w1\<^sub>0 \<and> regs \<sigma> ymm2w0 = ymm2w0\<^sub>0 \<and> regs \<sigma> ymm3w1 = ymm3w1\<^sub>0 \<and> regs \<sigma> ymm3w0 = ymm3w0\<^sub>0 \<and> regs \<sigma> ymm4w1 = ymm4w1\<^sub>0 \<and> regs \<sigma> ymm4w0 = ymm4w0\<^sub>0 \<and> regs \<sigma> ymm5w1 = ymm5w1\<^sub>0 \<and> regs \<sigma> ymm5w0 = ymm5w0\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x60),8]::64 word) = ((((((RDX\<^sub>0::64 word) - 0x10)::64 word) AND 0xfffffffffffffff0)::64 word) + 0x10) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),8]::64 word) = ((((((((RDX\<^sub>0::64 word) - 0x10)::64 word) AND 0xfffffffffffffff0)::64 word) + RSI\<^sub>0)::64 word) + 0x10) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),8]::64 word) = RDI\<^sub>0\<close>
declare P_0x876d_9_def[Ps]

definition P_0x876d_9_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x876d_9_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((FS\<^sub>0::64 word) + 0x28), 8),
    (2, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x40), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x60), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x68), 8),
    (11, ((RSP\<^sub>0::64 word) - 0x70), 8),
    (12, ((RSP\<^sub>0::64 word) - 0x80), 8)
  }\<close>

definition P_0x876d_9_regions :: state_pred where
  \<open>P_0x876d_9_regions \<sigma> \<equiv> \<exists>regions. P_0x876d_9_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_AES_encrypt_addr_0x876d_9 :: state_pred where
  \<open>Q_AES_encrypt_addr_0x876d_9 \<sigma> \<equiv> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x80) \<and> RIP \<sigma> = AES_encrypt_addr \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = RCX\<^sub>0 \<and> RDI \<sigma> = ((RSP\<^sub>0::64 word) - 0x58) \<and> RSI \<sigma> = RBX \<sigma> \<and> RBP \<sigma> = RCX\<^sub>0 \<and> R15 \<sigma> = RDX\<^sub>0 \<and> R14 \<sigma> = R8\<^sub>0 \<and> R13 \<sigma> = ((RSP\<^sub>0::64 word) - 0x58) \<and> R9 \<sigma> = R9\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> regs \<sigma> ymm0w1 = ymm0w1\<^sub>0 \<and> regs \<sigma> ymm0w0 = ymm0w0\<^sub>0 \<and> regs \<sigma> ymm2w1 = ymm2w1\<^sub>0 \<and> regs \<sigma> ymm2w0 = ymm2w0\<^sub>0 \<and> regs \<sigma> ymm3w1 = ymm3w1\<^sub>0 \<and> regs \<sigma> ymm3w0 = ymm3w0\<^sub>0 \<and> regs \<sigma> ymm4w1 = ymm4w1\<^sub>0 \<and> regs \<sigma> ymm4w0 = ymm4w0\<^sub>0 \<and> regs \<sigma> ymm5w1 = ymm5w1\<^sub>0 \<and> regs \<sigma> ymm5w0 = ymm5w0\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x60),8]::64 word) = ((((((RDX\<^sub>0::64 word) - 0x10)::64 word) AND 0xfffffffffffffff0)::64 word) + 0x10) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),8]::64 word) = ((((((((RDX\<^sub>0::64 word) - 0x10)::64 word) AND 0xfffffffffffffff0)::64 word) + RSI\<^sub>0)::64 word) + 0x10) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),8]::64 word) = RDI\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x80),8]::64 word) = 0x8772\<close>
declare Q_AES_encrypt_addr_0x876d_9_def[Qs]

schematic_goal AES_cbc_encrypt_0_1_0x876d_0x876d_9[blocks]:
  assumes \<open>(P_0x876d_9 && P_0x876d_9_regions) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x876d 9 \<sigma> \<triangleq> ?\<sigma> \<and> Q_AES_encrypt_addr_0x876d_9 ?\<sigma> \<and> block_usage P_0x876d_9_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x876d_9_def P_0x876d_9_regions_def post: Q_AES_encrypt_addr_0x876d_9_def regionset: P_0x876d_9_regions_set_def)

definition P_0x8772_10 :: state_pred where
  \<open>P_0x8772_10 \<sigma> \<equiv> RIP \<sigma> = 0x8772 \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = RCX\<^sub>0 \<and> RDI \<sigma> = ((RSP\<^sub>0::64 word) - 0x58) \<and> RSI \<sigma> = RBX \<sigma> \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x78) \<and> RBP \<sigma> = RCX\<^sub>0 \<and> R15 \<sigma> = RDX\<^sub>0 \<and> R14 \<sigma> = R8\<^sub>0 \<and> R13 \<sigma> = ((RSP\<^sub>0::64 word) - 0x58) \<and> R9 \<sigma> = R9\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> regs \<sigma> ymm0w1 = ymm0w1\<^sub>0 \<and> regs \<sigma> ymm0w0 = ymm0w0\<^sub>0 \<and> regs \<sigma> ymm2w1 = ymm2w1\<^sub>0 \<and> regs \<sigma> ymm2w0 = ymm2w0\<^sub>0 \<and> regs \<sigma> ymm3w1 = ymm3w1\<^sub>0 \<and> regs \<sigma> ymm3w0 = ymm3w0\<^sub>0 \<and> regs \<sigma> ymm4w1 = ymm4w1\<^sub>0 \<and> regs \<sigma> ymm4w0 = ymm4w0\<^sub>0 \<and> regs \<sigma> ymm5w1 = ymm5w1\<^sub>0 \<and> regs \<sigma> ymm5w0 = ymm5w0\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x60),8]::64 word) = ((((((RDX\<^sub>0::64 word) - 0x10)::64 word) AND 0xfffffffffffffff0)::64 word) + 0x10) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),8]::64 word) = ((((((((RDX\<^sub>0::64 word) - 0x10)::64 word) AND 0xfffffffffffffff0)::64 word) + RSI\<^sub>0)::64 word) + 0x10) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),8]::64 word) = RDI\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x80),8]::64 word) = 0x8772\<close>
declare P_0x8772_10_def[Ps]

definition P_0x8772_10_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x8772_10_regions_set \<sigma> \<equiv> {
    (0, RBX \<sigma>, 8),
    (1, R8\<^sub>0, 8),
    (2, RSP\<^sub>0, 8),
    (3, ((RBX \<sigma>::64 word) + (ucast ((0x8::64 word))::64 word)), 8),
    (4, ((FS\<^sub>0::64 word) + 0x28), 8),
    (5, ((R8\<^sub>0::64 word) + (ucast ((0x8::64 word))::64 word)), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (11, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (12, ((RSP\<^sub>0::64 word) - 0x40), 8),
    (13, ((RSP\<^sub>0::64 word) - 0x60), 8),
    (14, ((RSP\<^sub>0::64 word) - 0x68), 8),
    (15, ((RSP\<^sub>0::64 word) - 0x70), 8),
    (16, ((RSP\<^sub>0::64 word) - 0x80), 8)
  }\<close>

definition P_0x8772_10_regions :: state_pred where
  \<open>P_0x8772_10_regions \<sigma> \<equiv> \<exists>regions. P_0x8772_10_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x8783_10 :: state_pred where
  \<open>Q_0x8783_10 \<sigma> \<equiv> RIP \<sigma> = 0x8783 \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x78) \<and> RBP \<sigma> = RCX\<^sub>0 \<and> R15 \<sigma> = RDX\<^sub>0 \<and> R14 \<sigma> = R8\<^sub>0 \<and> R13 \<sigma> = ((RSP\<^sub>0::64 word) - 0x58) \<and> R9 \<sigma> = R9\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> regs \<sigma> ymm0w1 = ymm0w1\<^sub>0 \<and> regs \<sigma> ymm0w0 = ymm0w0\<^sub>0 \<and> regs \<sigma> ymm2w1 = ymm2w1\<^sub>0 \<and> regs \<sigma> ymm2w0 = ymm2w0\<^sub>0 \<and> regs \<sigma> ymm3w1 = ymm3w1\<^sub>0 \<and> regs \<sigma> ymm3w0 = ymm3w0\<^sub>0 \<and> regs \<sigma> ymm4w1 = ymm4w1\<^sub>0 \<and> regs \<sigma> ymm4w0 = ymm4w0\<^sub>0 \<and> regs \<sigma> ymm5w1 = ymm5w1\<^sub>0 \<and> regs \<sigma> ymm5w0 = ymm5w0\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x60),8]::64 word) = ((((((RDX\<^sub>0::64 word) - 0x10)::64 word) AND 0xfffffffffffffff0)::64 word) + 0x10) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),8]::64 word) = ((((((((RDX\<^sub>0::64 word) - 0x10)::64 word) AND 0xfffffffffffffff0)::64 word) + RSI\<^sub>0)::64 word) + 0x10) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),8]::64 word) = RDI\<^sub>0\<close>
declare Q_0x8783_10_def[Qs]

schematic_goal AES_cbc_encrypt_0_4_0x8772_0x877e_10[blocks]:
  assumes \<open>(P_0x8772_10 && P_0x8772_10_regions) \<sigma>\<close>
  shows \<open>exec_block 4 0x877e 10 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x8783_10 ?\<sigma> \<and> block_usage P_0x8772_10_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x8772_10_def P_0x8772_10_regions_def post: Q_0x8783_10_def regionset: P_0x8772_10_regions_set_def)

definition P_0x8783_true_11 :: state_pred where
  \<open>P_0x8783_true_11 \<sigma> \<equiv> RIP \<sigma> = 0x8783 \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x78) \<and> RBP \<sigma> = RCX\<^sub>0 \<and> R15 \<sigma> = RDX\<^sub>0 \<and> R14 \<sigma> = R8\<^sub>0 \<and> R13 \<sigma> = ((RSP\<^sub>0::64 word) - 0x58) \<and> R9 \<sigma> = R9\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> regs \<sigma> ymm0w1 = ymm0w1\<^sub>0 \<and> regs \<sigma> ymm0w0 = ymm0w0\<^sub>0 \<and> regs \<sigma> ymm2w1 = ymm2w1\<^sub>0 \<and> regs \<sigma> ymm2w0 = ymm2w0\<^sub>0 \<and> regs \<sigma> ymm3w1 = ymm3w1\<^sub>0 \<and> regs \<sigma> ymm3w0 = ymm3w0\<^sub>0 \<and> regs \<sigma> ymm4w1 = ymm4w1\<^sub>0 \<and> regs \<sigma> ymm4w0 = ymm4w0\<^sub>0 \<and> regs \<sigma> ymm5w1 = ymm5w1\<^sub>0 \<and> regs \<sigma> ymm5w0 = ymm5w0\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x60),8]::64 word) = ((((((RDX\<^sub>0::64 word) - 0x10)::64 word) AND 0xfffffffffffffff0)::64 word) + 0x10) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),8]::64 word) = ((((((((RDX\<^sub>0::64 word) - 0x10)::64 word) AND 0xfffffffffffffff0)::64 word) + RSI\<^sub>0)::64 word) + 0x10) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),8]::64 word) = RDI\<^sub>0\<close>
declare P_0x8783_true_11_def[Ps]

definition P_0x8783_true_11_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x8783_true_11_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((FS\<^sub>0::64 word) + 0x28), 8),
    (2, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x40), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x60), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x68), 8),
    (11, ((RSP\<^sub>0::64 word) - 0x70), 8)
  }\<close>

definition P_0x8783_true_11_regions :: state_pred where
  \<open>P_0x8783_true_11_regions \<sigma> \<equiv> \<exists>regions. P_0x8783_true_11_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x8740_11 :: state_pred where
  \<open>Q_0x8740_11 \<sigma> \<equiv> RIP \<sigma> = 0x8740 \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x78) \<and> RBP \<sigma> = RCX\<^sub>0 \<and> R15 \<sigma> = RDX\<^sub>0 \<and> R14 \<sigma> = R8\<^sub>0 \<and> R13 \<sigma> = ((RSP\<^sub>0::64 word) - 0x58) \<and> R9 \<sigma> = R9\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> regs \<sigma> ymm0w1 = ymm0w1\<^sub>0 \<and> regs \<sigma> ymm0w0 = ymm0w0\<^sub>0 \<and> regs \<sigma> ymm2w1 = ymm2w1\<^sub>0 \<and> regs \<sigma> ymm2w0 = ymm2w0\<^sub>0 \<and> regs \<sigma> ymm3w1 = ymm3w1\<^sub>0 \<and> regs \<sigma> ymm3w0 = ymm3w0\<^sub>0 \<and> regs \<sigma> ymm4w1 = ymm4w1\<^sub>0 \<and> regs \<sigma> ymm4w0 = ymm4w0\<^sub>0 \<and> regs \<sigma> ymm5w1 = ymm5w1\<^sub>0 \<and> regs \<sigma> ymm5w0 = ymm5w0\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x60),8]::64 word) = ((((((RDX\<^sub>0::64 word) - 0x10)::64 word) AND 0xfffffffffffffff0)::64 word) + 0x10) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),8]::64 word) = ((((((((RDX\<^sub>0::64 word) - 0x10)::64 word) AND 0xfffffffffffffff0)::64 word) + RSI\<^sub>0)::64 word) + 0x10) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),8]::64 word) = RDI\<^sub>0\<close>
declare Q_0x8740_11_def[Qs]

schematic_goal AES_cbc_encrypt_0_1_0x8783_0x8783_11[blocks]:
  assumes \<open>(P_0x8783_true_11 && P_0x8783_true_11_regions && !ZF) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x8783 11 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x8740_11 ?\<sigma> \<and> block_usage P_0x8783_true_11_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x8783_true_11_def P_0x8783_true_11_regions_def post: Q_0x8740_11_def regionset: P_0x8783_true_11_regions_set_def)

definition P_0x8783_false_12 :: state_pred where
  \<open>P_0x8783_false_12 \<sigma> \<equiv> RIP \<sigma> = 0x8783 \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x78) \<and> RBP \<sigma> = RCX\<^sub>0 \<and> R15 \<sigma> = RDX\<^sub>0 \<and> R14 \<sigma> = R8\<^sub>0 \<and> R13 \<sigma> = ((RSP\<^sub>0::64 word) - 0x58) \<and> R9 \<sigma> = R9\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> regs \<sigma> ymm0w1 = ymm0w1\<^sub>0 \<and> regs \<sigma> ymm0w0 = ymm0w0\<^sub>0 \<and> regs \<sigma> ymm2w1 = ymm2w1\<^sub>0 \<and> regs \<sigma> ymm2w0 = ymm2w0\<^sub>0 \<and> regs \<sigma> ymm3w1 = ymm3w1\<^sub>0 \<and> regs \<sigma> ymm3w0 = ymm3w0\<^sub>0 \<and> regs \<sigma> ymm4w1 = ymm4w1\<^sub>0 \<and> regs \<sigma> ymm4w0 = ymm4w0\<^sub>0 \<and> regs \<sigma> ymm5w1 = ymm5w1\<^sub>0 \<and> regs \<sigma> ymm5w0 = ymm5w0\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x60),8]::64 word) = ((((((RDX\<^sub>0::64 word) - 0x10)::64 word) AND 0xfffffffffffffff0)::64 word) + 0x10) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),8]::64 word) = ((((((((RDX\<^sub>0::64 word) - 0x10)::64 word) AND 0xfffffffffffffff0)::64 word) + RSI\<^sub>0)::64 word) + 0x10) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),8]::64 word) = RDI\<^sub>0\<close>
declare P_0x8783_false_12_def[Ps]

definition P_0x8783_false_12_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x8783_false_12_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((FS\<^sub>0::64 word) + 0x28), 8),
    (2, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x40), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x60), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x68), 8),
    (11, ((RSP\<^sub>0::64 word) - 0x70), 8)
  }\<close>

definition P_0x8783_false_12_regions :: state_pred where
  \<open>P_0x8783_false_12_regions \<sigma> \<equiv> \<exists>regions. P_0x8783_false_12_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x8785_12 :: state_pred where
  \<open>Q_0x8785_12 \<sigma> \<equiv> RIP \<sigma> = 0x8785 \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x78) \<and> RBP \<sigma> = RCX\<^sub>0 \<and> R15 \<sigma> = RDX\<^sub>0 \<and> R14 \<sigma> = R8\<^sub>0 \<and> R13 \<sigma> = ((RSP\<^sub>0::64 word) - 0x58) \<and> R9 \<sigma> = R9\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> regs \<sigma> ymm0w1 = ymm0w1\<^sub>0 \<and> regs \<sigma> ymm0w0 = ymm0w0\<^sub>0 \<and> regs \<sigma> ymm2w1 = ymm2w1\<^sub>0 \<and> regs \<sigma> ymm2w0 = ymm2w0\<^sub>0 \<and> regs \<sigma> ymm3w1 = ymm3w1\<^sub>0 \<and> regs \<sigma> ymm3w0 = ymm3w0\<^sub>0 \<and> regs \<sigma> ymm4w1 = ymm4w1\<^sub>0 \<and> regs \<sigma> ymm4w0 = ymm4w0\<^sub>0 \<and> regs \<sigma> ymm5w1 = ymm5w1\<^sub>0 \<and> regs \<sigma> ymm5w0 = ymm5w0\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x60),8]::64 word) = ((((((RDX\<^sub>0::64 word) - 0x10)::64 word) AND 0xfffffffffffffff0)::64 word) + 0x10) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),8]::64 word) = ((((((((RDX\<^sub>0::64 word) - 0x10)::64 word) AND 0xfffffffffffffff0)::64 word) + RSI\<^sub>0)::64 word) + 0x10) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),8]::64 word) = RDI\<^sub>0\<close>
declare Q_0x8785_12_def[Qs]

schematic_goal AES_cbc_encrypt_0_1_0x8783_0x8783_12[blocks]:
  assumes \<open>(P_0x8783_false_12 && P_0x8783_false_12_regions && ! !ZF) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x8783 12 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x8785_12 ?\<sigma> \<and> block_usage P_0x8783_false_12_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x8783_false_12_def P_0x8783_false_12_regions_def post: Q_0x8785_12_def regionset: P_0x8783_false_12_regions_set_def)

definition P_0x8785_13 :: state_pred where
  \<open>P_0x8785_13 \<sigma> \<equiv> RIP \<sigma> = 0x8785 \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x78) \<and> RBP \<sigma> = RCX\<^sub>0 \<and> R15 \<sigma> = RDX\<^sub>0 \<and> R14 \<sigma> = R8\<^sub>0 \<and> R13 \<sigma> = ((RSP\<^sub>0::64 word) - 0x58) \<and> R9 \<sigma> = R9\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> regs \<sigma> ymm0w1 = ymm0w1\<^sub>0 \<and> regs \<sigma> ymm0w0 = ymm0w0\<^sub>0 \<and> regs \<sigma> ymm2w1 = ymm2w1\<^sub>0 \<and> regs \<sigma> ymm2w0 = ymm2w0\<^sub>0 \<and> regs \<sigma> ymm3w1 = ymm3w1\<^sub>0 \<and> regs \<sigma> ymm3w0 = ymm3w0\<^sub>0 \<and> regs \<sigma> ymm4w1 = ymm4w1\<^sub>0 \<and> regs \<sigma> ymm4w0 = ymm4w0\<^sub>0 \<and> regs \<sigma> ymm5w1 = ymm5w1\<^sub>0 \<and> regs \<sigma> ymm5w0 = ymm5w0\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x60),8]::64 word) = ((((((RDX\<^sub>0::64 word) - 0x10)::64 word) AND 0xfffffffffffffff0)::64 word) + 0x10) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),8]::64 word) = ((((((((RDX\<^sub>0::64 word) - 0x10)::64 word) AND 0xfffffffffffffff0)::64 word) + RSI\<^sub>0)::64 word) + 0x10) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),8]::64 word) = RDI\<^sub>0\<close>
declare P_0x8785_13_def[Ps]

definition P_0x8785_13_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x8785_13_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((FS\<^sub>0::64 word) + 0x28), 8),
    (2, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x40), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x60), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x68), 8),
    (11, ((RSP\<^sub>0::64 word) - 0x70), 8)
  }\<close>

definition P_0x8785_13_regions :: state_pred where
  \<open>P_0x8785_13_regions \<sigma> \<equiv> \<exists>regions. P_0x8785_13_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x8793_13 :: state_pred where
  \<open>Q_0x8793_13 \<sigma> \<equiv> RIP \<sigma> = 0x8793 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x78) \<and> RBP \<sigma> = RCX\<^sub>0 \<and> R14 \<sigma> = R8\<^sub>0 \<and> R9 \<sigma> = R9\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> regs \<sigma> ymm0w1 = ymm0w1\<^sub>0 \<and> regs \<sigma> ymm0w0 = ymm0w0\<^sub>0 \<and> regs \<sigma> ymm2w1 = ymm2w1\<^sub>0 \<and> regs \<sigma> ymm2w0 = ymm2w0\<^sub>0 \<and> regs \<sigma> ymm3w1 = ymm3w1\<^sub>0 \<and> regs \<sigma> ymm3w0 = ymm3w0\<^sub>0 \<and> regs \<sigma> ymm4w1 = ymm4w1\<^sub>0 \<and> regs \<sigma> ymm4w0 = ymm4w0\<^sub>0 \<and> regs \<sigma> ymm5w1 = ymm5w1\<^sub>0 \<and> regs \<sigma> ymm5w0 = ymm5w0\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word)\<close>
declare Q_0x8793_13_def[Qs]

schematic_goal AES_cbc_encrypt_0_3_0x8785_0x878f_13[blocks]:
  assumes \<open>(P_0x8785_13 && P_0x8785_13_regions) \<sigma>\<close>
  shows \<open>exec_block 3 0x878f 13 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x8793_13 ?\<sigma> \<and> block_usage P_0x8785_13_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x8785_13_def P_0x8785_13_regions_def post: Q_0x8793_13_def regionset: P_0x8785_13_regions_set_def)

definition P_0x8793_14 :: state_pred where
  \<open>P_0x8793_14 \<sigma> \<equiv> RIP \<sigma> = 0x8793 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x78) \<and> RBP \<sigma> = RCX\<^sub>0 \<and> R14 \<sigma> = R8\<^sub>0 \<and> R9 \<sigma> = R9\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> regs \<sigma> ymm0w1 = ymm0w1\<^sub>0 \<and> regs \<sigma> ymm0w0 = ymm0w0\<^sub>0 \<and> regs \<sigma> ymm2w1 = ymm2w1\<^sub>0 \<and> regs \<sigma> ymm2w0 = ymm2w0\<^sub>0 \<and> regs \<sigma> ymm3w1 = ymm3w1\<^sub>0 \<and> regs \<sigma> ymm3w0 = ymm3w0\<^sub>0 \<and> regs \<sigma> ymm4w1 = ymm4w1\<^sub>0 \<and> regs \<sigma> ymm4w0 = ymm4w0\<^sub>0 \<and> regs \<sigma> ymm5w1 = ymm5w1\<^sub>0 \<and> regs \<sigma> ymm5w0 = ymm5w0\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word)\<close>
declare P_0x8793_14_def[Ps]

definition P_0x8793_14_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x8793_14_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((FS\<^sub>0::64 word) + 0x28), 8),
    (2, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x40), 8)
  }\<close>

definition P_0x8793_14_regions :: state_pred where
  \<open>P_0x8793_14_regions \<sigma> \<equiv> \<exists>regions. P_0x8793_14_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x8796_14 :: state_pred where
  \<open>Q_0x8796_14 \<sigma> \<equiv> RIP \<sigma> = 0x8796 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x78) \<and> RBP \<sigma> = RCX\<^sub>0 \<and> R14 \<sigma> = R8\<^sub>0 \<and> R9 \<sigma> = R9\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> regs \<sigma> ymm0w1 = ymm0w1\<^sub>0 \<and> regs \<sigma> ymm0w0 = ymm0w0\<^sub>0 \<and> regs \<sigma> ymm2w1 = ymm2w1\<^sub>0 \<and> regs \<sigma> ymm2w0 = ymm2w0\<^sub>0 \<and> regs \<sigma> ymm3w1 = ymm3w1\<^sub>0 \<and> regs \<sigma> ymm3w0 = ymm3w0\<^sub>0 \<and> regs \<sigma> ymm4w1 = ymm4w1\<^sub>0 \<and> regs \<sigma> ymm4w0 = ymm4w0\<^sub>0 \<and> regs \<sigma> ymm5w1 = ymm5w1\<^sub>0 \<and> regs \<sigma> ymm5w0 = ymm5w0\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word)\<close>
declare Q_0x8796_14_def[Qs]

schematic_goal AES_cbc_encrypt_0_1_0x8793_0x8793_14[blocks]:
  assumes \<open>(P_0x8793_14 && P_0x8793_14_regions) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x8793 14 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x8796_14 ?\<sigma> \<and> block_usage P_0x8793_14_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x8793_14_def P_0x8793_14_regions_def post: Q_0x8796_14_def regionset: P_0x8793_14_regions_set_def)

definition P_0x8796_true_15 :: state_pred where
  \<open>P_0x8796_true_15 \<sigma> \<equiv> RIP \<sigma> = 0x8796 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x78) \<and> RBP \<sigma> = RCX\<^sub>0 \<and> R14 \<sigma> = R8\<^sub>0 \<and> R9 \<sigma> = R9\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> regs \<sigma> ymm0w1 = ymm0w1\<^sub>0 \<and> regs \<sigma> ymm0w0 = ymm0w0\<^sub>0 \<and> regs \<sigma> ymm2w1 = ymm2w1\<^sub>0 \<and> regs \<sigma> ymm2w0 = ymm2w0\<^sub>0 \<and> regs \<sigma> ymm3w1 = ymm3w1\<^sub>0 \<and> regs \<sigma> ymm3w0 = ymm3w0\<^sub>0 \<and> regs \<sigma> ymm4w1 = ymm4w1\<^sub>0 \<and> regs \<sigma> ymm4w0 = ymm4w0\<^sub>0 \<and> regs \<sigma> ymm5w1 = ymm5w1\<^sub>0 \<and> regs \<sigma> ymm5w0 = ymm5w0\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word)\<close>
declare P_0x8796_true_15_def[Ps]

definition P_0x8796_true_15_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x8796_true_15_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((FS\<^sub>0::64 word) + 0x28), 8),
    (2, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x40), 8)
  }\<close>

definition P_0x8796_true_15_regions :: state_pred where
  \<open>P_0x8796_true_15_regions \<sigma> \<equiv> \<exists>regions. P_0x8796_true_15_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x86f0_15 :: state_pred where
  \<open>Q_0x86f0_15 \<sigma> \<equiv> RIP \<sigma> = 0x86f0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x78) \<and> RBP \<sigma> = RCX\<^sub>0 \<and> R14 \<sigma> = R8\<^sub>0 \<and> R9 \<sigma> = R9\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word)\<close>
declare Q_0x86f0_15_def[Qs]

schematic_goal AES_cbc_encrypt_0_1_0x8796_0x8796_15[blocks]:
  assumes \<open>(P_0x8796_true_15 && P_0x8796_true_15_regions && ZF) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x8796 15 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x86f0_15 ?\<sigma> \<and> block_usage P_0x8796_true_15_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x8796_true_15_def P_0x8796_true_15_regions_def post: Q_0x86f0_15_def regionset: P_0x8796_true_15_regions_set_def)

definition P_0x8796_false_16 :: state_pred where
  \<open>P_0x8796_false_16 \<sigma> \<equiv> RIP \<sigma> = 0x8796 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x78) \<and> RBP \<sigma> = RCX\<^sub>0 \<and> R14 \<sigma> = R8\<^sub>0 \<and> R9 \<sigma> = R9\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> regs \<sigma> ymm0w1 = ymm0w1\<^sub>0 \<and> regs \<sigma> ymm0w0 = ymm0w0\<^sub>0 \<and> regs \<sigma> ymm2w1 = ymm2w1\<^sub>0 \<and> regs \<sigma> ymm2w0 = ymm2w0\<^sub>0 \<and> regs \<sigma> ymm3w1 = ymm3w1\<^sub>0 \<and> regs \<sigma> ymm3w0 = ymm3w0\<^sub>0 \<and> regs \<sigma> ymm4w1 = ymm4w1\<^sub>0 \<and> regs \<sigma> ymm4w0 = ymm4w0\<^sub>0 \<and> regs \<sigma> ymm5w1 = ymm5w1\<^sub>0 \<and> regs \<sigma> ymm5w0 = ymm5w0\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word)\<close>
declare P_0x8796_false_16_def[Ps]

definition P_0x8796_false_16_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x8796_false_16_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((FS\<^sub>0::64 word) + 0x28), 8),
    (2, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x40), 8)
  }\<close>

definition P_0x8796_false_16_regions :: state_pred where
  \<open>P_0x8796_false_16_regions \<sigma> \<equiv> \<exists>regions. P_0x8796_false_16_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x87a8_16 :: state_pred where
  \<open>Q_0x87a8_16 \<sigma> \<equiv> RIP \<sigma> = 0x87a8 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x78) \<and> RBP \<sigma> = RCX\<^sub>0 \<and> R14 \<sigma> = R8\<^sub>0 \<and> R13 \<sigma> = ((RSP\<^sub>0::64 word) - 0x58) \<and> R9 \<sigma> = R9\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> regs \<sigma> ymm0w1 = ymm0w1\<^sub>0 \<and> regs \<sigma> ymm0w0 = ymm0w0\<^sub>0 \<and> regs \<sigma> ymm2w1 = ymm2w1\<^sub>0 \<and> regs \<sigma> ymm2w0 = ymm2w0\<^sub>0 \<and> regs \<sigma> ymm3w1 = ymm3w1\<^sub>0 \<and> regs \<sigma> ymm3w0 = ymm3w0\<^sub>0 \<and> regs \<sigma> ymm4w1 = ymm4w1\<^sub>0 \<and> regs \<sigma> ymm4w0 = ymm4w0\<^sub>0 \<and> regs \<sigma> ymm5w1 = ymm5w1\<^sub>0 \<and> regs \<sigma> ymm5w0 = ymm5w0\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word)\<close>
declare Q_0x87a8_16_def[Qs]

schematic_goal AES_cbc_encrypt_0_4_0x8796_0x87a3_16[blocks]:
  assumes \<open>(P_0x8796_false_16 && P_0x8796_false_16_regions && ! ZF) \<sigma>\<close>
  shows \<open>exec_block 4 0x87a3 16 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x87a8_16 ?\<sigma> \<and> block_usage P_0x8796_false_16_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x8796_false_16_def P_0x8796_false_16_regions_def post: Q_0x87a8_16_def regionset: P_0x8796_false_16_regions_set_def)

definition P_0x87a8_17 :: state_pred where
  \<open>P_0x87a8_17 \<sigma> \<equiv> RIP \<sigma> = 0x87a8 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x78) \<and> RBP \<sigma> = RCX\<^sub>0 \<and> R14 \<sigma> = R8\<^sub>0 \<and> R13 \<sigma> = ((RSP\<^sub>0::64 word) - 0x58) \<and> R9 \<sigma> = R9\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> regs \<sigma> ymm0w1 = ymm0w1\<^sub>0 \<and> regs \<sigma> ymm0w0 = ymm0w0\<^sub>0 \<and> regs \<sigma> ymm2w1 = ymm2w1\<^sub>0 \<and> regs \<sigma> ymm2w0 = ymm2w0\<^sub>0 \<and> regs \<sigma> ymm3w1 = ymm3w1\<^sub>0 \<and> regs \<sigma> ymm3w0 = ymm3w0\<^sub>0 \<and> regs \<sigma> ymm4w1 = ymm4w1\<^sub>0 \<and> regs \<sigma> ymm4w0 = ymm4w0\<^sub>0 \<and> regs \<sigma> ymm5w1 = ymm5w1\<^sub>0 \<and> regs \<sigma> ymm5w0 = ymm5w0\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word)\<close>
declare P_0x87a8_17_def[Ps]

definition P_0x87a8_17_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x87a8_17_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((FS\<^sub>0::64 word) + 0x28), 8),
    (2, ((R8\<^sub>0::64 word) + (\<langle>63,0\<rangle>((RAX \<sigma>::64 word) * 0x1)::64 word)), Suc 0),
    (3, (((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),8]::64 word)::64 word) + (\<langle>63,0\<rangle>((RAX \<sigma>::64 word) * 0x1)::64 word)), Suc 0),
    (4, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x40), 8),
    (11, ((RSP\<^sub>0::64 word) - 0x70), 8),
    (12, ((((RSP\<^sub>0::64 word) + (\<langle>63,0\<rangle>((RAX \<sigma>::64 word) * 0x1)::64 word))::64 word) - 0x58), Suc 0)
  }\<close>

definition P_0x87a8_17_regions :: state_pred where
  \<open>P_0x87a8_17_regions \<sigma> \<equiv> \<exists>regions. P_0x87a8_17_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x87c1_17 :: state_pred where
  \<open>Q_0x87c1_17 \<sigma> \<equiv> RIP \<sigma> = 0x87c1 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x78) \<and> RBP \<sigma> = RCX\<^sub>0 \<and> R14 \<sigma> = R8\<^sub>0 \<and> R13 \<sigma> = ((RSP\<^sub>0::64 word) - 0x58) \<and> R9 \<sigma> = R9\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> regs \<sigma> ymm0w1 = ymm0w1\<^sub>0 \<and> regs \<sigma> ymm0w0 = ymm0w0\<^sub>0 \<and> regs \<sigma> ymm2w1 = ymm2w1\<^sub>0 \<and> regs \<sigma> ymm2w0 = ymm2w0\<^sub>0 \<and> regs \<sigma> ymm3w1 = ymm3w1\<^sub>0 \<and> regs \<sigma> ymm3w0 = ymm3w0\<^sub>0 \<and> regs \<sigma> ymm4w1 = ymm4w1\<^sub>0 \<and> regs \<sigma> ymm4w0 = ymm4w0\<^sub>0 \<and> regs \<sigma> ymm5w1 = ymm5w1\<^sub>0 \<and> regs \<sigma> ymm5w0 = ymm5w0\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word)\<close>
declare Q_0x87c1_17_def[Qs]

schematic_goal AES_cbc_encrypt_0_6_0x87a8_0x87be_17[blocks]:
  assumes \<open>(P_0x87a8_17 && P_0x87a8_17_regions) \<sigma>\<close>
  shows \<open>exec_block 6 0x87be 17 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x87c1_17 ?\<sigma> \<and> block_usage P_0x87a8_17_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x87a8_17_def P_0x87a8_17_regions_def post: Q_0x87c1_17_def regionset: P_0x87a8_17_regions_set_def)

definition P_0x87c1_true_18 :: state_pred where
  \<open>P_0x87c1_true_18 \<sigma> \<equiv> RIP \<sigma> = 0x87c1 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x78) \<and> RBP \<sigma> = RCX\<^sub>0 \<and> R14 \<sigma> = R8\<^sub>0 \<and> R13 \<sigma> = ((RSP\<^sub>0::64 word) - 0x58) \<and> R9 \<sigma> = R9\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> regs \<sigma> ymm0w1 = ymm0w1\<^sub>0 \<and> regs \<sigma> ymm0w0 = ymm0w0\<^sub>0 \<and> regs \<sigma> ymm2w1 = ymm2w1\<^sub>0 \<and> regs \<sigma> ymm2w0 = ymm2w0\<^sub>0 \<and> regs \<sigma> ymm3w1 = ymm3w1\<^sub>0 \<and> regs \<sigma> ymm3w0 = ymm3w0\<^sub>0 \<and> regs \<sigma> ymm4w1 = ymm4w1\<^sub>0 \<and> regs \<sigma> ymm4w0 = ymm4w0\<^sub>0 \<and> regs \<sigma> ymm5w1 = ymm5w1\<^sub>0 \<and> regs \<sigma> ymm5w0 = ymm5w0\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word)\<close>
declare P_0x87c1_true_18_def[Ps]

definition P_0x87c1_true_18_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x87c1_true_18_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((FS\<^sub>0::64 word) + 0x28), 8),
    (2, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x40), 8)
  }\<close>

definition P_0x87c1_true_18_regions :: state_pred where
  \<open>P_0x87c1_true_18_regions \<sigma> \<equiv> \<exists>regions. P_0x87c1_true_18_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x87a8_18 :: state_pred where
  \<open>Q_0x87a8_18 \<sigma> \<equiv> RIP \<sigma> = 0x87a8 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x78) \<and> RBP \<sigma> = RCX\<^sub>0 \<and> R14 \<sigma> = R8\<^sub>0 \<and> R13 \<sigma> = ((RSP\<^sub>0::64 word) - 0x58) \<and> R9 \<sigma> = R9\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> regs \<sigma> ymm0w1 = ymm0w1\<^sub>0 \<and> regs \<sigma> ymm0w0 = ymm0w0\<^sub>0 \<and> regs \<sigma> ymm2w1 = ymm2w1\<^sub>0 \<and> regs \<sigma> ymm2w0 = ymm2w0\<^sub>0 \<and> regs \<sigma> ymm3w1 = ymm3w1\<^sub>0 \<and> regs \<sigma> ymm3w0 = ymm3w0\<^sub>0 \<and> regs \<sigma> ymm4w1 = ymm4w1\<^sub>0 \<and> regs \<sigma> ymm4w0 = ymm4w0\<^sub>0 \<and> regs \<sigma> ymm5w1 = ymm5w1\<^sub>0 \<and> regs \<sigma> ymm5w0 = ymm5w0\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word)\<close>
declare Q_0x87a8_18_def[Qs]

schematic_goal AES_cbc_encrypt_0_1_0x87c1_0x87c1_18[blocks]:
  assumes \<open>(P_0x87c1_true_18 && P_0x87c1_true_18_regions && !ZF) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x87c1 18 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x87a8_18 ?\<sigma> \<and> block_usage P_0x87c1_true_18_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x87c1_true_18_def P_0x87c1_true_18_regions_def post: Q_0x87a8_18_def regionset: P_0x87c1_true_18_regions_set_def)

definition P_0x87c1_false_19 :: state_pred where
  \<open>P_0x87c1_false_19 \<sigma> \<equiv> RIP \<sigma> = 0x87c1 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x78) \<and> RBP \<sigma> = RCX\<^sub>0 \<and> R14 \<sigma> = R8\<^sub>0 \<and> R13 \<sigma> = ((RSP\<^sub>0::64 word) - 0x58) \<and> R9 \<sigma> = R9\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> regs \<sigma> ymm0w1 = ymm0w1\<^sub>0 \<and> regs \<sigma> ymm0w0 = ymm0w0\<^sub>0 \<and> regs \<sigma> ymm2w1 = ymm2w1\<^sub>0 \<and> regs \<sigma> ymm2w0 = ymm2w0\<^sub>0 \<and> regs \<sigma> ymm3w1 = ymm3w1\<^sub>0 \<and> regs \<sigma> ymm3w0 = ymm3w0\<^sub>0 \<and> regs \<sigma> ymm4w1 = ymm4w1\<^sub>0 \<and> regs \<sigma> ymm4w0 = ymm4w0\<^sub>0 \<and> regs \<sigma> ymm5w1 = ymm5w1\<^sub>0 \<and> regs \<sigma> ymm5w0 = ymm5w0\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word)\<close>
declare P_0x87c1_false_19_def[Ps]

definition P_0x87c1_false_19_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x87c1_false_19_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((FS\<^sub>0::64 word) + 0x28), 8),
    (2, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x40), 8)
  }\<close>

definition P_0x87c1_false_19_regions :: state_pred where
  \<open>P_0x87c1_false_19_regions \<sigma> \<equiv> \<exists>regions. P_0x87c1_false_19_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x87c3_19 :: state_pred where
  \<open>Q_0x87c3_19 \<sigma> \<equiv> RIP \<sigma> = 0x87c3 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x78) \<and> RBP \<sigma> = RCX\<^sub>0 \<and> R14 \<sigma> = R8\<^sub>0 \<and> R13 \<sigma> = ((RSP\<^sub>0::64 word) - 0x58) \<and> R9 \<sigma> = R9\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> regs \<sigma> ymm0w1 = ymm0w1\<^sub>0 \<and> regs \<sigma> ymm0w0 = ymm0w0\<^sub>0 \<and> regs \<sigma> ymm2w1 = ymm2w1\<^sub>0 \<and> regs \<sigma> ymm2w0 = ymm2w0\<^sub>0 \<and> regs \<sigma> ymm3w1 = ymm3w1\<^sub>0 \<and> regs \<sigma> ymm3w0 = ymm3w0\<^sub>0 \<and> regs \<sigma> ymm4w1 = ymm4w1\<^sub>0 \<and> regs \<sigma> ymm4w0 = ymm4w0\<^sub>0 \<and> regs \<sigma> ymm5w1 = ymm5w1\<^sub>0 \<and> regs \<sigma> ymm5w0 = ymm5w0\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word)\<close>
declare Q_0x87c3_19_def[Qs]

schematic_goal AES_cbc_encrypt_0_1_0x87c1_0x87c1_19[blocks]:
  assumes \<open>(P_0x87c1_false_19 && P_0x87c1_false_19_regions && ! !ZF) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x87c1 19 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x87c3_19 ?\<sigma> \<and> block_usage P_0x87c1_false_19_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x87c1_false_19_def P_0x87c1_false_19_regions_def post: Q_0x87c3_19_def regionset: P_0x87c1_false_19_regions_set_def)

definition P_0x87c3_20 :: state_pred where
  \<open>P_0x87c3_20 \<sigma> \<equiv> RIP \<sigma> = 0x87c3 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x78) \<and> RBP \<sigma> = RCX\<^sub>0 \<and> R14 \<sigma> = R8\<^sub>0 \<and> R13 \<sigma> = ((RSP\<^sub>0::64 word) - 0x58) \<and> R9 \<sigma> = R9\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> regs \<sigma> ymm0w1 = ymm0w1\<^sub>0 \<and> regs \<sigma> ymm0w0 = ymm0w0\<^sub>0 \<and> regs \<sigma> ymm2w1 = ymm2w1\<^sub>0 \<and> regs \<sigma> ymm2w0 = ymm2w0\<^sub>0 \<and> regs \<sigma> ymm3w1 = ymm3w1\<^sub>0 \<and> regs \<sigma> ymm3w0 = ymm3w0\<^sub>0 \<and> regs \<sigma> ymm4w1 = ymm4w1\<^sub>0 \<and> regs \<sigma> ymm4w0 = ymm4w0\<^sub>0 \<and> regs \<sigma> ymm5w1 = ymm5w1\<^sub>0 \<and> regs \<sigma> ymm5w0 = ymm5w0\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word)\<close>
declare P_0x87c3_20_def[Ps]

definition P_0x87c3_20_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x87c3_20_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((FS\<^sub>0::64 word) + 0x28), 8),
    (2, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x40), 8)
  }\<close>

definition P_0x87c3_20_regions :: state_pred where
  \<open>P_0x87c3_20_regions \<sigma> \<equiv> \<exists>regions. P_0x87c3_20_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x87c8_20 :: state_pred where
  \<open>Q_0x87c8_20 \<sigma> \<equiv> RIP \<sigma> = 0x87c8 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x78) \<and> RBP \<sigma> = RCX\<^sub>0 \<and> R14 \<sigma> = R8\<^sub>0 \<and> R13 \<sigma> = ((RSP\<^sub>0::64 word) - 0x58) \<and> R9 \<sigma> = R9\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> regs \<sigma> ymm0w1 = ymm0w1\<^sub>0 \<and> regs \<sigma> ymm0w0 = ymm0w0\<^sub>0 \<and> regs \<sigma> ymm2w1 = ymm2w1\<^sub>0 \<and> regs \<sigma> ymm2w0 = ymm2w0\<^sub>0 \<and> regs \<sigma> ymm3w1 = ymm3w1\<^sub>0 \<and> regs \<sigma> ymm3w0 = ymm3w0\<^sub>0 \<and> regs \<sigma> ymm4w1 = ymm4w1\<^sub>0 \<and> regs \<sigma> ymm4w0 = ymm4w0\<^sub>0 \<and> regs \<sigma> ymm5w1 = ymm5w1\<^sub>0 \<and> regs \<sigma> ymm5w0 = ymm5w0\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word)\<close>
declare Q_0x87c8_20_def[Qs]

schematic_goal AES_cbc_encrypt_0_1_0x87c3_0x87c3_20[blocks]:
  assumes \<open>(P_0x87c3_20 && P_0x87c3_20_regions) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x87c3 20 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x87c8_20 ?\<sigma> \<and> block_usage P_0x87c3_20_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x87c3_20_def P_0x87c3_20_regions_def post: Q_0x87c8_20_def regionset: P_0x87c3_20_regions_set_def)

definition P_0x87c8_21 :: state_pred where
  \<open>P_0x87c8_21 \<sigma> \<equiv> RIP \<sigma> = 0x87c8 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x78) \<and> RBP \<sigma> = RCX\<^sub>0 \<and> R14 \<sigma> = R8\<^sub>0 \<and> R13 \<sigma> = ((RSP\<^sub>0::64 word) - 0x58) \<and> R9 \<sigma> = R9\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> regs \<sigma> ymm0w1 = ymm0w1\<^sub>0 \<and> regs \<sigma> ymm0w0 = ymm0w0\<^sub>0 \<and> regs \<sigma> ymm2w1 = ymm2w1\<^sub>0 \<and> regs \<sigma> ymm2w0 = ymm2w0\<^sub>0 \<and> regs \<sigma> ymm3w1 = ymm3w1\<^sub>0 \<and> regs \<sigma> ymm3w0 = ymm3w0\<^sub>0 \<and> regs \<sigma> ymm4w1 = ymm4w1\<^sub>0 \<and> regs \<sigma> ymm4w0 = ymm4w0\<^sub>0 \<and> regs \<sigma> ymm5w1 = ymm5w1\<^sub>0 \<and> regs \<sigma> ymm5w0 = ymm5w0\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word)\<close>
declare P_0x87c8_21_def[Ps]

definition P_0x87c8_21_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x87c8_21_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((FS\<^sub>0::64 word) + 0x28), 8),
    (2, ((R8\<^sub>0::64 word) + (\<langle>63,0\<rangle>((R15 \<sigma>::64 word) * 0x1)::64 word)), Suc 0),
    (3, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x40), 8),
    (10, ((((RSP\<^sub>0::64 word) + (\<langle>63,0\<rangle>((R15 \<sigma>::64 word) * 0x1)::64 word))::64 word) - 0x58), Suc 0)
  }\<close>

definition P_0x87c8_21_regions :: state_pred where
  \<open>P_0x87c8_21_regions \<sigma> \<equiv> \<exists>regions. P_0x87c8_21_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x87da_21 :: state_pred where
  \<open>Q_0x87da_21 \<sigma> \<equiv> RIP \<sigma> = 0x87da \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x78) \<and> RBP \<sigma> = RCX\<^sub>0 \<and> R14 \<sigma> = R8\<^sub>0 \<and> R13 \<sigma> = ((RSP\<^sub>0::64 word) - 0x58) \<and> R9 \<sigma> = R9\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> regs \<sigma> ymm0w1 = ymm0w1\<^sub>0 \<and> regs \<sigma> ymm0w0 = ymm0w0\<^sub>0 \<and> regs \<sigma> ymm2w1 = ymm2w1\<^sub>0 \<and> regs \<sigma> ymm2w0 = ymm2w0\<^sub>0 \<and> regs \<sigma> ymm3w1 = ymm3w1\<^sub>0 \<and> regs \<sigma> ymm3w0 = ymm3w0\<^sub>0 \<and> regs \<sigma> ymm4w1 = ymm4w1\<^sub>0 \<and> regs \<sigma> ymm4w0 = ymm4w0\<^sub>0 \<and> regs \<sigma> ymm5w1 = ymm5w1\<^sub>0 \<and> regs \<sigma> ymm5w0 = ymm5w0\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word)\<close>
declare Q_0x87da_21_def[Qs]

schematic_goal AES_cbc_encrypt_0_4_0x87c8_0x87d6_21[blocks]:
  assumes \<open>(P_0x87c8_21 && P_0x87c8_21_regions) \<sigma>\<close>
  shows \<open>exec_block 4 0x87d6 21 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x87da_21 ?\<sigma> \<and> block_usage P_0x87c8_21_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x87c8_21_def P_0x87c8_21_regions_def post: Q_0x87da_21_def regionset: P_0x87c8_21_regions_set_def)

definition P_0x87da_true_22 :: state_pred where
  \<open>P_0x87da_true_22 \<sigma> \<equiv> RIP \<sigma> = 0x87da \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x78) \<and> RBP \<sigma> = RCX\<^sub>0 \<and> R14 \<sigma> = R8\<^sub>0 \<and> R13 \<sigma> = ((RSP\<^sub>0::64 word) - 0x58) \<and> R9 \<sigma> = R9\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> regs \<sigma> ymm0w1 = ymm0w1\<^sub>0 \<and> regs \<sigma> ymm0w0 = ymm0w0\<^sub>0 \<and> regs \<sigma> ymm2w1 = ymm2w1\<^sub>0 \<and> regs \<sigma> ymm2w0 = ymm2w0\<^sub>0 \<and> regs \<sigma> ymm3w1 = ymm3w1\<^sub>0 \<and> regs \<sigma> ymm3w0 = ymm3w0\<^sub>0 \<and> regs \<sigma> ymm4w1 = ymm4w1\<^sub>0 \<and> regs \<sigma> ymm4w0 = ymm4w0\<^sub>0 \<and> regs \<sigma> ymm5w1 = ymm5w1\<^sub>0 \<and> regs \<sigma> ymm5w0 = ymm5w0\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word)\<close>
declare P_0x87da_true_22_def[Ps]

definition P_0x87da_true_22_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x87da_true_22_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((FS\<^sub>0::64 word) + 0x28), 8),
    (2, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x40), 8)
  }\<close>

definition P_0x87da_true_22_regions :: state_pred where
  \<open>P_0x87da_true_22_regions \<sigma> \<equiv> \<exists>regions. P_0x87da_true_22_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x87c8_22 :: state_pred where
  \<open>Q_0x87c8_22 \<sigma> \<equiv> RIP \<sigma> = 0x87c8 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x78) \<and> RBP \<sigma> = RCX\<^sub>0 \<and> R14 \<sigma> = R8\<^sub>0 \<and> R13 \<sigma> = ((RSP\<^sub>0::64 word) - 0x58) \<and> R9 \<sigma> = R9\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> regs \<sigma> ymm0w1 = ymm0w1\<^sub>0 \<and> regs \<sigma> ymm0w0 = ymm0w0\<^sub>0 \<and> regs \<sigma> ymm2w1 = ymm2w1\<^sub>0 \<and> regs \<sigma> ymm2w0 = ymm2w0\<^sub>0 \<and> regs \<sigma> ymm3w1 = ymm3w1\<^sub>0 \<and> regs \<sigma> ymm3w0 = ymm3w0\<^sub>0 \<and> regs \<sigma> ymm4w1 = ymm4w1\<^sub>0 \<and> regs \<sigma> ymm4w0 = ymm4w0\<^sub>0 \<and> regs \<sigma> ymm5w1 = ymm5w1\<^sub>0 \<and> regs \<sigma> ymm5w0 = ymm5w0\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word)\<close>
declare Q_0x87c8_22_def[Qs]

schematic_goal AES_cbc_encrypt_0_1_0x87da_0x87da_22[blocks]:
  assumes \<open>(P_0x87da_true_22 && P_0x87da_true_22_regions && !ZF) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x87da 22 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x87c8_22 ?\<sigma> \<and> block_usage P_0x87da_true_22_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x87da_true_22_def P_0x87da_true_22_regions_def post: Q_0x87c8_22_def regionset: P_0x87da_true_22_regions_set_def)

definition P_0x87da_false_23 :: state_pred where
  \<open>P_0x87da_false_23 \<sigma> \<equiv> RIP \<sigma> = 0x87da \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x78) \<and> RBP \<sigma> = RCX\<^sub>0 \<and> R14 \<sigma> = R8\<^sub>0 \<and> R13 \<sigma> = ((RSP\<^sub>0::64 word) - 0x58) \<and> R9 \<sigma> = R9\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> regs \<sigma> ymm0w1 = ymm0w1\<^sub>0 \<and> regs \<sigma> ymm0w0 = ymm0w0\<^sub>0 \<and> regs \<sigma> ymm2w1 = ymm2w1\<^sub>0 \<and> regs \<sigma> ymm2w0 = ymm2w0\<^sub>0 \<and> regs \<sigma> ymm3w1 = ymm3w1\<^sub>0 \<and> regs \<sigma> ymm3w0 = ymm3w0\<^sub>0 \<and> regs \<sigma> ymm4w1 = ymm4w1\<^sub>0 \<and> regs \<sigma> ymm4w0 = ymm4w0\<^sub>0 \<and> regs \<sigma> ymm5w1 = ymm5w1\<^sub>0 \<and> regs \<sigma> ymm5w0 = ymm5w0\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word)\<close>
declare P_0x87da_false_23_def[Ps]

definition P_0x87da_false_23_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x87da_false_23_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((FS\<^sub>0::64 word) + 0x28), 8),
    (2, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x40), 8)
  }\<close>

definition P_0x87da_false_23_regions :: state_pred where
  \<open>P_0x87da_false_23_regions \<sigma> \<equiv> \<exists>regions. P_0x87da_false_23_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x87dc_23 :: state_pred where
  \<open>Q_0x87dc_23 \<sigma> \<equiv> RIP \<sigma> = 0x87dc \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x78) \<and> RBP \<sigma> = RCX\<^sub>0 \<and> R14 \<sigma> = R8\<^sub>0 \<and> R13 \<sigma> = ((RSP\<^sub>0::64 word) - 0x58) \<and> R9 \<sigma> = R9\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> regs \<sigma> ymm0w1 = ymm0w1\<^sub>0 \<and> regs \<sigma> ymm0w0 = ymm0w0\<^sub>0 \<and> regs \<sigma> ymm2w1 = ymm2w1\<^sub>0 \<and> regs \<sigma> ymm2w0 = ymm2w0\<^sub>0 \<and> regs \<sigma> ymm3w1 = ymm3w1\<^sub>0 \<and> regs \<sigma> ymm3w0 = ymm3w0\<^sub>0 \<and> regs \<sigma> ymm4w1 = ymm4w1\<^sub>0 \<and> regs \<sigma> ymm4w0 = ymm4w0\<^sub>0 \<and> regs \<sigma> ymm5w1 = ymm5w1\<^sub>0 \<and> regs \<sigma> ymm5w0 = ymm5w0\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word)\<close>
declare Q_0x87dc_23_def[Qs]

schematic_goal AES_cbc_encrypt_0_1_0x87da_0x87da_23[blocks]:
  assumes \<open>(P_0x87da_false_23 && P_0x87da_false_23_regions && ! !ZF) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x87da 23 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x87dc_23 ?\<sigma> \<and> block_usage P_0x87da_false_23_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x87da_false_23_def P_0x87da_false_23_regions_def post: Q_0x87dc_23_def regionset: P_0x87da_false_23_regions_set_def)

definition P_0x87dc_24 :: state_pred where
  \<open>P_0x87dc_24 \<sigma> \<equiv> RIP \<sigma> = 0x87dc \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x78) \<and> RBP \<sigma> = RCX\<^sub>0 \<and> R14 \<sigma> = R8\<^sub>0 \<and> R13 \<sigma> = ((RSP\<^sub>0::64 word) - 0x58) \<and> R9 \<sigma> = R9\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> regs \<sigma> ymm0w1 = ymm0w1\<^sub>0 \<and> regs \<sigma> ymm0w0 = ymm0w0\<^sub>0 \<and> regs \<sigma> ymm2w1 = ymm2w1\<^sub>0 \<and> regs \<sigma> ymm2w0 = ymm2w0\<^sub>0 \<and> regs \<sigma> ymm3w1 = ymm3w1\<^sub>0 \<and> regs \<sigma> ymm3w0 = ymm3w0\<^sub>0 \<and> regs \<sigma> ymm4w1 = ymm4w1\<^sub>0 \<and> regs \<sigma> ymm4w0 = ymm4w0\<^sub>0 \<and> regs \<sigma> ymm5w1 = ymm5w1\<^sub>0 \<and> regs \<sigma> ymm5w0 = ymm5w0\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word)\<close>
declare P_0x87dc_24_def[Ps]

definition P_0x87dc_24_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x87dc_24_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((FS\<^sub>0::64 word) + 0x28), 8),
    (2, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x40), 8)
  }\<close>

definition P_0x87dc_24_regions :: state_pred where
  \<open>P_0x87dc_24_regions \<sigma> \<equiv> \<exists>regions. P_0x87dc_24_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x87e5_24 :: state_pred where
  \<open>Q_0x87e5_24 \<sigma> \<equiv> RIP \<sigma> = 0x87e5 \<and> RDX \<sigma> = RCX\<^sub>0 \<and> RDI \<sigma> = ((RSP\<^sub>0::64 word) - 0x58) \<and> RSI \<sigma> = ((RSP\<^sub>0::64 word) - 0x58) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x78) \<and> RBP \<sigma> = RCX\<^sub>0 \<and> R14 \<sigma> = R8\<^sub>0 \<and> R13 \<sigma> = ((RSP\<^sub>0::64 word) - 0x58) \<and> R9 \<sigma> = R9\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> regs \<sigma> ymm0w1 = ymm0w1\<^sub>0 \<and> regs \<sigma> ymm0w0 = ymm0w0\<^sub>0 \<and> regs \<sigma> ymm2w1 = ymm2w1\<^sub>0 \<and> regs \<sigma> ymm2w0 = ymm2w0\<^sub>0 \<and> regs \<sigma> ymm3w1 = ymm3w1\<^sub>0 \<and> regs \<sigma> ymm3w0 = ymm3w0\<^sub>0 \<and> regs \<sigma> ymm4w1 = ymm4w1\<^sub>0 \<and> regs \<sigma> ymm4w0 = ymm4w0\<^sub>0 \<and> regs \<sigma> ymm5w1 = ymm5w1\<^sub>0 \<and> regs \<sigma> ymm5w0 = ymm5w0\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word)\<close>
declare Q_0x87e5_24_def[Qs]

schematic_goal AES_cbc_encrypt_0_3_0x87dc_0x87e2_24[blocks]:
  assumes \<open>(P_0x87dc_24 && P_0x87dc_24_regions) \<sigma>\<close>
  shows \<open>exec_block 3 0x87e2 24 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x87e5_24 ?\<sigma> \<and> block_usage P_0x87dc_24_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x87dc_24_def P_0x87dc_24_regions_def post: Q_0x87e5_24_def regionset: P_0x87dc_24_regions_set_def)

definition P_0x87e5_25 :: state_pred where
  \<open>P_0x87e5_25 \<sigma> \<equiv> RIP \<sigma> = 0x87e5 \<and> RDX \<sigma> = RCX\<^sub>0 \<and> RDI \<sigma> = ((RSP\<^sub>0::64 word) - 0x58) \<and> RSI \<sigma> = ((RSP\<^sub>0::64 word) - 0x58) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x78) \<and> RBP \<sigma> = RCX\<^sub>0 \<and> R14 \<sigma> = R8\<^sub>0 \<and> R13 \<sigma> = ((RSP\<^sub>0::64 word) - 0x58) \<and> R9 \<sigma> = R9\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> regs \<sigma> ymm0w1 = ymm0w1\<^sub>0 \<and> regs \<sigma> ymm0w0 = ymm0w0\<^sub>0 \<and> regs \<sigma> ymm2w1 = ymm2w1\<^sub>0 \<and> regs \<sigma> ymm2w0 = ymm2w0\<^sub>0 \<and> regs \<sigma> ymm3w1 = ymm3w1\<^sub>0 \<and> regs \<sigma> ymm3w0 = ymm3w0\<^sub>0 \<and> regs \<sigma> ymm4w1 = ymm4w1\<^sub>0 \<and> regs \<sigma> ymm4w0 = ymm4w0\<^sub>0 \<and> regs \<sigma> ymm5w1 = ymm5w1\<^sub>0 \<and> regs \<sigma> ymm5w0 = ymm5w0\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word)\<close>
declare P_0x87e5_25_def[Ps]

definition P_0x87e5_25_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x87e5_25_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((FS\<^sub>0::64 word) + 0x28), 8),
    (2, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x40), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x80), 8)
  }\<close>

definition P_0x87e5_25_regions :: state_pred where
  \<open>P_0x87e5_25_regions \<sigma> \<equiv> \<exists>regions. P_0x87e5_25_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_AES_encrypt_addr_0x87e5_25 :: state_pred where
  \<open>Q_AES_encrypt_addr_0x87e5_25 \<sigma> \<equiv> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x80) \<and> RIP \<sigma> = AES_encrypt_addr \<and> RDX \<sigma> = RCX\<^sub>0 \<and> RDI \<sigma> = ((RSP\<^sub>0::64 word) - 0x58) \<and> RSI \<sigma> = ((RSP\<^sub>0::64 word) - 0x58) \<and> RBP \<sigma> = RCX\<^sub>0 \<and> R14 \<sigma> = R8\<^sub>0 \<and> R13 \<sigma> = ((RSP\<^sub>0::64 word) - 0x58) \<and> R9 \<sigma> = R9\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> regs \<sigma> ymm0w1 = ymm0w1\<^sub>0 \<and> regs \<sigma> ymm0w0 = ymm0w0\<^sub>0 \<and> regs \<sigma> ymm2w1 = ymm2w1\<^sub>0 \<and> regs \<sigma> ymm2w0 = ymm2w0\<^sub>0 \<and> regs \<sigma> ymm3w1 = ymm3w1\<^sub>0 \<and> regs \<sigma> ymm3w0 = ymm3w0\<^sub>0 \<and> regs \<sigma> ymm4w1 = ymm4w1\<^sub>0 \<and> regs \<sigma> ymm4w0 = ymm4w0\<^sub>0 \<and> regs \<sigma> ymm5w1 = ymm5w1\<^sub>0 \<and> regs \<sigma> ymm5w0 = ymm5w0\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x80),8]::64 word) = 0x87ea\<close>
declare Q_AES_encrypt_addr_0x87e5_25_def[Qs]

schematic_goal AES_cbc_encrypt_0_1_0x87e5_0x87e5_25[blocks]:
  assumes \<open>(P_0x87e5_25 && P_0x87e5_25_regions) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x87e5 25 \<sigma> \<triangleq> ?\<sigma> \<and> Q_AES_encrypt_addr_0x87e5_25 ?\<sigma> \<and> block_usage P_0x87e5_25_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x87e5_25_def P_0x87e5_25_regions_def post: Q_AES_encrypt_addr_0x87e5_25_def regionset: P_0x87e5_25_regions_set_def)

definition P_0x87ea_26 :: state_pred where
  \<open>P_0x87ea_26 \<sigma> \<equiv> RIP \<sigma> = 0x87ea \<and> RDX \<sigma> = RCX\<^sub>0 \<and> RDI \<sigma> = ((RSP\<^sub>0::64 word) - 0x58) \<and> RSI \<sigma> = ((RSP\<^sub>0::64 word) - 0x58) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x78) \<and> RBP \<sigma> = RCX\<^sub>0 \<and> R14 \<sigma> = R8\<^sub>0 \<and> R13 \<sigma> = ((RSP\<^sub>0::64 word) - 0x58) \<and> R9 \<sigma> = R9\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> regs \<sigma> ymm0w1 = ymm0w1\<^sub>0 \<and> regs \<sigma> ymm0w0 = ymm0w0\<^sub>0 \<and> regs \<sigma> ymm2w1 = ymm2w1\<^sub>0 \<and> regs \<sigma> ymm2w0 = ymm2w0\<^sub>0 \<and> regs \<sigma> ymm3w1 = ymm3w1\<^sub>0 \<and> regs \<sigma> ymm3w0 = ymm3w0\<^sub>0 \<and> regs \<sigma> ymm4w1 = ymm4w1\<^sub>0 \<and> regs \<sigma> ymm4w0 = ymm4w0\<^sub>0 \<and> regs \<sigma> ymm5w1 = ymm5w1\<^sub>0 \<and> regs \<sigma> ymm5w0 = ymm5w0\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x80),8]::64 word) = 0x87ea\<close>
declare P_0x87ea_26_def[Ps]

definition P_0x87ea_26_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x87ea_26_regions_set \<sigma> \<equiv> {
    (0, R8\<^sub>0, 8),
    (1, RSP\<^sub>0, 8),
    (2, ((FS\<^sub>0::64 word) + 0x28), 8),
    (3, ((R8\<^sub>0::64 word) + (ucast ((0x8::64 word))::64 word)), 8),
    (4, (((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),8]::64 word)::64 word) + (ucast ((0x8::64 word))::64 word)), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (11, ((RSP\<^sub>0::64 word) - 0x40), 8),
    (12, ((RSP\<^sub>0::64 word) - 0x50), 8),
    (13, ((RSP\<^sub>0::64 word) - 0x58), 8),
    (14, ((RSP\<^sub>0::64 word) - 0x68), 8),
    (15, ((RSP\<^sub>0::64 word) - 0x80), 8),
    (16, (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),8]::64 word), 8)
  }\<close>

definition P_0x87ea_26_regions :: state_pred where
  \<open>P_0x87ea_26_regions \<sigma> \<equiv> \<exists>regions. P_0x87ea_26_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x86f0_26 :: state_pred where
  \<open>Q_0x86f0_26 \<sigma> \<equiv> RIP \<sigma> = 0x86f0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x78) \<and> RBP \<sigma> = RCX\<^sub>0 \<and> R14 \<sigma> = R8\<^sub>0 \<and> R9 \<sigma> = R9\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word)\<close>
declare Q_0x86f0_26_def[Qs]

schematic_goal AES_cbc_encrypt_0_5_0x87ea_0x87fc_26[blocks]:
  assumes \<open>(P_0x87ea_26 && P_0x87ea_26_regions) \<sigma>\<close>
  shows \<open>exec_block 5 0x87fc 26 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x86f0_26 ?\<sigma> \<and> block_usage P_0x87ea_26_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x87ea_26_def P_0x87ea_26_regions_def post: Q_0x86f0_26_def regionset: P_0x87ea_26_regions_set_def)

definition P_0x8662_false_27 :: state_pred where
  \<open>P_0x8662_false_27 \<sigma> \<equiv> RIP \<sigma> = 0x8662 \<and> RAX \<sigma> = 0x0 \<and> RBX \<sigma> = RSI\<^sub>0 \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = RDX\<^sub>0 \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x78) \<and> RBP \<sigma> = RCX\<^sub>0 \<and> R15 \<sigma> = RDX\<^sub>0 \<and> R14 \<sigma> = R8\<^sub>0 \<and> R13 \<sigma> = R13\<^sub>0 \<and> R12 \<sigma> = R12\<^sub>0 \<and> R9 \<sigma> = R9\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> regs \<sigma> ymm0w1 = ymm0w1\<^sub>0 \<and> regs \<sigma> ymm0w0 = ymm0w0\<^sub>0 \<and> regs \<sigma> ymm1w1 = ymm1w1\<^sub>0 \<and> regs \<sigma> ymm1w0 = ymm1w0\<^sub>0 \<and> regs \<sigma> ymm2w1 = ymm2w1\<^sub>0 \<and> regs \<sigma> ymm2w0 = ymm2w0\<^sub>0 \<and> regs \<sigma> ymm3w1 = ymm3w1\<^sub>0 \<and> regs \<sigma> ymm3w0 = ymm3w0\<^sub>0 \<and> regs \<sigma> ymm4w1 = ymm4w1\<^sub>0 \<and> regs \<sigma> ymm4w0 = ymm4w0\<^sub>0 \<and> regs \<sigma> ymm5w1 = ymm5w1\<^sub>0 \<and> regs \<sigma> ymm5w0 = ymm5w0\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),8]::64 word) = RDI\<^sub>0\<close>
declare P_0x8662_false_27_def[Ps]

definition P_0x8662_false_27_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x8662_false_27_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((FS\<^sub>0::64 word) + 0x28), 8),
    (2, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x40), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x70), 8)
  }\<close>

definition P_0x8662_false_27_regions :: state_pred where
  \<open>P_0x8662_false_27_regions \<sigma> \<equiv> \<exists>regions. P_0x8662_false_27_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x866f_27 :: state_pred where
  \<open>Q_0x866f_27 \<sigma> \<equiv> RIP \<sigma> = 0x866f \<and> RAX \<sigma> = 0x0 \<and> RBX \<sigma> = RSI\<^sub>0 \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = RDX\<^sub>0 \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x78) \<and> RBP \<sigma> = RCX\<^sub>0 \<and> R15 \<sigma> = RDX\<^sub>0 \<and> R14 \<sigma> = R8\<^sub>0 \<and> R13 \<sigma> = R13\<^sub>0 \<and> R12 \<sigma> = RSI\<^sub>0 \<and> R9 \<sigma> = R9\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> regs \<sigma> ymm0w1 = ymm0w1\<^sub>0 \<and> regs \<sigma> ymm0w0 = ymm0w0\<^sub>0 \<and> regs \<sigma> ymm1w1 = ymm1w1\<^sub>0 \<and> regs \<sigma> ymm1w0 = ymm1w0\<^sub>0 \<and> regs \<sigma> ymm2w1 = ymm2w1\<^sub>0 \<and> regs \<sigma> ymm2w0 = ymm2w0\<^sub>0 \<and> regs \<sigma> ymm3w1 = ymm3w1\<^sub>0 \<and> regs \<sigma> ymm3w0 = ymm3w0\<^sub>0 \<and> regs \<sigma> ymm4w1 = ymm4w1\<^sub>0 \<and> regs \<sigma> ymm4w0 = ymm4w0\<^sub>0 \<and> regs \<sigma> ymm5w1 = ymm5w1\<^sub>0 \<and> regs \<sigma> ymm5w0 = ymm5w0\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),8]::64 word) = RDI\<^sub>0\<close>
declare Q_0x866f_27_def[Qs]

schematic_goal AES_cbc_encrypt_0_3_0x8662_0x866b_27[blocks]:
  assumes \<open>(P_0x8662_false_27 && P_0x8662_false_27_regions && ! !ZF) \<sigma>\<close>
  shows \<open>exec_block 3 0x866b 27 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x866f_27 ?\<sigma> \<and> block_usage P_0x8662_false_27_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x8662_false_27_def P_0x8662_false_27_regions_def post: Q_0x866f_27_def regionset: P_0x8662_false_27_regions_set_def)

definition P_0x866f_true_28 :: state_pred where
  \<open>P_0x866f_true_28 \<sigma> \<equiv> RIP \<sigma> = 0x866f \<and> RAX \<sigma> = 0x0 \<and> RBX \<sigma> = RSI\<^sub>0 \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = RDX\<^sub>0 \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x78) \<and> RBP \<sigma> = RCX\<^sub>0 \<and> R15 \<sigma> = RDX\<^sub>0 \<and> R14 \<sigma> = R8\<^sub>0 \<and> R13 \<sigma> = R13\<^sub>0 \<and> R12 \<sigma> = RSI\<^sub>0 \<and> R9 \<sigma> = R9\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> regs \<sigma> ymm0w1 = ymm0w1\<^sub>0 \<and> regs \<sigma> ymm0w0 = ymm0w0\<^sub>0 \<and> regs \<sigma> ymm1w1 = ymm1w1\<^sub>0 \<and> regs \<sigma> ymm1w0 = ymm1w0\<^sub>0 \<and> regs \<sigma> ymm2w1 = ymm2w1\<^sub>0 \<and> regs \<sigma> ymm2w0 = ymm2w0\<^sub>0 \<and> regs \<sigma> ymm3w1 = ymm3w1\<^sub>0 \<and> regs \<sigma> ymm3w0 = ymm3w0\<^sub>0 \<and> regs \<sigma> ymm4w1 = ymm4w1\<^sub>0 \<and> regs \<sigma> ymm4w0 = ymm4w0\<^sub>0 \<and> regs \<sigma> ymm5w1 = ymm5w1\<^sub>0 \<and> regs \<sigma> ymm5w0 = ymm5w0\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),8]::64 word) = RDI\<^sub>0\<close>
declare P_0x866f_true_28_def[Ps]

definition P_0x866f_true_28_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x866f_true_28_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((FS\<^sub>0::64 word) + 0x28), 8),
    (2, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x40), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x70), 8)
  }\<close>

definition P_0x866f_true_28_regions :: state_pred where
  \<open>P_0x866f_true_28_regions \<sigma> \<equiv> \<exists>regions. P_0x866f_true_28_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x86e7_28 :: state_pred where
  \<open>Q_0x86e7_28 \<sigma> \<equiv> RIP \<sigma> = 0x86e7 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x78) \<and> RBP \<sigma> = RCX\<^sub>0 \<and> R14 \<sigma> = R8\<^sub>0 \<and> R9 \<sigma> = R9\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> regs \<sigma> ymm0w1 = ymm0w1\<^sub>0 \<and> regs \<sigma> ymm0w0 = ymm0w0\<^sub>0 \<and> regs \<sigma> ymm1w1 = ymm1w1\<^sub>0 \<and> regs \<sigma> ymm1w0 = ymm1w0\<^sub>0 \<and> regs \<sigma> ymm4w1 = ymm4w1\<^sub>0 \<and> regs \<sigma> ymm4w0 = ymm4w0\<^sub>0 \<and> regs \<sigma> ymm5w1 = ymm5w1\<^sub>0 \<and> regs \<sigma> ymm5w0 = ymm5w0\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word)\<close>
declare Q_0x86e7_28_def[Qs]

schematic_goal AES_cbc_encrypt_0_1_0x866f_0x866f_28[blocks]:
  assumes \<open>(P_0x866f_true_28 && P_0x866f_true_28_regions && jbe) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x866f 28 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x86e7_28 ?\<sigma> \<and> block_usage P_0x866f_true_28_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x866f_true_28_def P_0x866f_true_28_regions_def post: Q_0x86e7_28_def regionset: P_0x866f_true_28_regions_set_def)

definition P_0x866f_false_29 :: state_pred where
  \<open>P_0x866f_false_29 \<sigma> \<equiv> RIP \<sigma> = 0x866f \<and> RAX \<sigma> = 0x0 \<and> RBX \<sigma> = RSI\<^sub>0 \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = RDX\<^sub>0 \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x78) \<and> RBP \<sigma> = RCX\<^sub>0 \<and> R15 \<sigma> = RDX\<^sub>0 \<and> R14 \<sigma> = R8\<^sub>0 \<and> R13 \<sigma> = R13\<^sub>0 \<and> R12 \<sigma> = RSI\<^sub>0 \<and> R9 \<sigma> = R9\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> regs \<sigma> ymm0w1 = ymm0w1\<^sub>0 \<and> regs \<sigma> ymm0w0 = ymm0w0\<^sub>0 \<and> regs \<sigma> ymm1w1 = ymm1w1\<^sub>0 \<and> regs \<sigma> ymm1w0 = ymm1w0\<^sub>0 \<and> regs \<sigma> ymm2w1 = ymm2w1\<^sub>0 \<and> regs \<sigma> ymm2w0 = ymm2w0\<^sub>0 \<and> regs \<sigma> ymm3w1 = ymm3w1\<^sub>0 \<and> regs \<sigma> ymm3w0 = ymm3w0\<^sub>0 \<and> regs \<sigma> ymm4w1 = ymm4w1\<^sub>0 \<and> regs \<sigma> ymm4w0 = ymm4w0\<^sub>0 \<and> regs \<sigma> ymm5w1 = ymm5w1\<^sub>0 \<and> regs \<sigma> ymm5w0 = ymm5w0\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),8]::64 word) = RDI\<^sub>0\<close>
declare P_0x866f_false_29_def[Ps]

definition P_0x866f_false_29_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x866f_false_29_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((FS\<^sub>0::64 word) + 0x28), 8),
    (2, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x40), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x68), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x70), 8)
  }\<close>

definition P_0x866f_false_29_regions :: state_pred where
  \<open>P_0x866f_false_29_regions \<sigma> \<equiv> \<exists>regions. P_0x866f_false_29_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x8690_29 :: state_pred where
  \<open>Q_0x8690_29 \<sigma> \<equiv> RIP \<sigma> = 0x8690 \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x78) \<and> RBP \<sigma> = RCX\<^sub>0 \<and> R15 \<sigma> = RDX\<^sub>0 \<and> R14 \<sigma> = R8\<^sub>0 \<and> R12 \<sigma> = ((RSI\<^sub>0::64 word) + (\<langle>63,0\<rangle>((((((((RDX\<^sub>0::64 word) - 0x10)::64 word) AND 0xfffffffffffffff0)::64 word) + 0x10)::64 word) * 0x1)::64 word)) \<and> R9 \<sigma> = R9\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> regs \<sigma> ymm0w1 = ymm0w1\<^sub>0 \<and> regs \<sigma> ymm0w0 = ymm0w0\<^sub>0 \<and> regs \<sigma> ymm1w1 = ymm1w1\<^sub>0 \<and> regs \<sigma> ymm1w0 = ymm1w0\<^sub>0 \<and> regs \<sigma> ymm4w1 = ymm4w1\<^sub>0 \<and> regs \<sigma> ymm4w0 = ymm4w0\<^sub>0 \<and> regs \<sigma> ymm5w1 = ymm5w1\<^sub>0 \<and> regs \<sigma> ymm5w0 = ymm5w0\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),8]::64 word) = ((((((RDX\<^sub>0::64 word) - 0x10)::64 word) AND 0xfffffffffffffff0)::64 word) + 0x10) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),8]::64 word) = RDI\<^sub>0\<close>
declare Q_0x8690_29_def[Qs]

schematic_goal AES_cbc_encrypt_0_8_0x866f_0x868b_29[blocks]:
  assumes \<open>(P_0x866f_false_29 && P_0x866f_false_29_regions && ! jbe) \<sigma>\<close>
  shows \<open>exec_block 8 0x868b 29 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x8690_29 ?\<sigma> \<and> block_usage P_0x866f_false_29_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x866f_false_29_def P_0x866f_false_29_regions_def post: Q_0x8690_29_def regionset: P_0x866f_false_29_regions_set_def)

definition P_0x8690_30 :: state_pred where
  \<open>P_0x8690_30 \<sigma> \<equiv> RIP \<sigma> = 0x8690 \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x78) \<and> RBP \<sigma> = RCX\<^sub>0 \<and> R15 \<sigma> = RDX\<^sub>0 \<and> R14 \<sigma> = R8\<^sub>0 \<and> R12 \<sigma> = ((RSI\<^sub>0::64 word) + (\<langle>63,0\<rangle>((((((((RDX\<^sub>0::64 word) - 0x10)::64 word) AND 0xfffffffffffffff0)::64 word) + 0x10)::64 word) * 0x1)::64 word)) \<and> R9 \<sigma> = R9\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> regs \<sigma> ymm0w1 = ymm0w1\<^sub>0 \<and> regs \<sigma> ymm0w0 = ymm0w0\<^sub>0 \<and> regs \<sigma> ymm1w1 = ymm1w1\<^sub>0 \<and> regs \<sigma> ymm1w0 = ymm1w0\<^sub>0 \<and> regs \<sigma> ymm4w1 = ymm4w1\<^sub>0 \<and> regs \<sigma> ymm4w0 = ymm4w0\<^sub>0 \<and> regs \<sigma> ymm5w1 = ymm5w1\<^sub>0 \<and> regs \<sigma> ymm5w0 = ymm5w0\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),8]::64 word) = ((((((RDX\<^sub>0::64 word) - 0x10)::64 word) AND 0xfffffffffffffff0)::64 word) + 0x10) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),8]::64 word) = RDI\<^sub>0\<close>
declare P_0x8690_30_def[Ps]

definition P_0x8690_30_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x8690_30_regions_set \<sigma> \<equiv> {
    (0, R13 \<sigma>, 8),
    (1, RSP\<^sub>0, 8),
    (2, ((R13 \<sigma>::64 word) + (ucast ((0x8::64 word))::64 word)), 8),
    (3, ((FS\<^sub>0::64 word) + 0x28), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x40), 8),
    (11, ((RSP\<^sub>0::64 word) - 0x50), 8),
    (12, ((RSP\<^sub>0::64 word) - 0x58), 8),
    (13, ((RSP\<^sub>0::64 word) - 0x68), 8),
    (14, ((RSP\<^sub>0::64 word) - 0x70), 8)
  }\<close>

definition P_0x8690_30_regions :: state_pred where
  \<open>P_0x8690_30_regions \<sigma> \<equiv> \<exists>regions. P_0x8690_30_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x86a4_30 :: state_pred where
  \<open>Q_0x86a4_30 \<sigma> \<equiv> RIP \<sigma> = 0x86a4 \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = RCX\<^sub>0 \<and> RDI \<sigma> = R13 \<sigma> \<and> RSI \<sigma> = RBX \<sigma> \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x78) \<and> RBP \<sigma> = RCX\<^sub>0 \<and> R15 \<sigma> = RDX\<^sub>0 \<and> R14 \<sigma> = R8\<^sub>0 \<and> R12 \<sigma> = ((RSI\<^sub>0::64 word) + (\<langle>63,0\<rangle>((((((((RDX\<^sub>0::64 word) - 0x10)::64 word) AND 0xfffffffffffffff0)::64 word) + 0x10)::64 word) * 0x1)::64 word)) \<and> R9 \<sigma> = R9\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> regs \<sigma> ymm0w1 = ymm0w1\<^sub>0 \<and> regs \<sigma> ymm0w0 = ymm0w0\<^sub>0 \<and> regs \<sigma> ymm1w1 = ymm1w1\<^sub>0 \<and> regs \<sigma> ymm1w0 = ymm1w0\<^sub>0 \<and> regs \<sigma> ymm2w1 = (\<sigma> \<turnstile> *[((R13 \<sigma>::64 word) + (ucast ((0x8::64 word))::64 word)),8]::64 word) \<and> regs \<sigma> ymm2w0 = (\<sigma> \<turnstile> *[R13 \<sigma>,8]::64 word) \<and> regs \<sigma> ymm4w1 = ymm4w1\<^sub>0 \<and> regs \<sigma> ymm4w0 = ymm4w0\<^sub>0 \<and> regs \<sigma> ymm5w1 = ymm5w1\<^sub>0 \<and> regs \<sigma> ymm5w0 = ymm5w0\<^sub>0 \<and> (\<sigma> \<turnstile> *[((R13 \<sigma>::64 word) + 0x8),8]::64 word) = (\<sigma> \<turnstile> *[((R13 \<sigma>::64 word) + (ucast ((0x8::64 word))::64 word)),8]::64 word) \<and> (\<sigma> \<turnstile> *[R13 \<sigma>,8]::64 word) = (\<sigma> \<turnstile> *[R13 \<sigma>,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((((RSP\<^sub>0::64 word) - 0x58)::64 word) + 0x8),8]::64 word) = (\<sigma> \<turnstile> *[((R13 \<sigma>::64 word) + (ucast ((0x8::64 word))::64 word)),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),8]::64 word) = (\<sigma> \<turnstile> *[R13 \<sigma>,8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),8]::64 word) = ((((((RDX\<^sub>0::64 word) - 0x10)::64 word) AND 0xfffffffffffffff0)::64 word) + 0x10) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),8]::64 word) = RDI\<^sub>0\<close>
declare Q_0x86a4_30_def[Qs]

schematic_goal AES_cbc_encrypt_0_5_0x8690_0x869f_30[blocks]:
  assumes \<open>(P_0x8690_30 && P_0x8690_30_regions) \<sigma>\<close>
  shows \<open>exec_block 5 0x869f 30 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x86a4_30 ?\<sigma> \<and> block_usage P_0x8690_30_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x8690_30_def P_0x8690_30_regions_def post: Q_0x86a4_30_def regionset: P_0x8690_30_regions_set_def)

definition P_0x86a4_31 :: state_pred where
  \<open>P_0x86a4_31 \<sigma> \<equiv> RIP \<sigma> = 0x86a4 \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = RCX\<^sub>0 \<and> RDI \<sigma> = R13 \<sigma> \<and> RSI \<sigma> = RBX \<sigma> \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x78) \<and> RBP \<sigma> = RCX\<^sub>0 \<and> R15 \<sigma> = RDX\<^sub>0 \<and> R14 \<sigma> = R8\<^sub>0 \<and> R12 \<sigma> = ((RSI\<^sub>0::64 word) + (\<langle>63,0\<rangle>((((((((RDX\<^sub>0::64 word) - 0x10)::64 word) AND 0xfffffffffffffff0)::64 word) + 0x10)::64 word) * 0x1)::64 word)) \<and> R9 \<sigma> = R9\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> regs \<sigma> ymm0w1 = ymm0w1\<^sub>0 \<and> regs \<sigma> ymm0w0 = ymm0w0\<^sub>0 \<and> regs \<sigma> ymm1w1 = ymm1w1\<^sub>0 \<and> regs \<sigma> ymm1w0 = ymm1w0\<^sub>0 \<and> regs \<sigma> ymm2w1 = (\<sigma> \<turnstile> *[((R13 \<sigma>::64 word) + (ucast ((0x8::64 word))::64 word)),8]::64 word) \<and> regs \<sigma> ymm2w0 = (\<sigma> \<turnstile> *[R13 \<sigma>,8]::64 word) \<and> regs \<sigma> ymm4w1 = ymm4w1\<^sub>0 \<and> regs \<sigma> ymm4w0 = ymm4w0\<^sub>0 \<and> regs \<sigma> ymm5w1 = ymm5w1\<^sub>0 \<and> regs \<sigma> ymm5w0 = ymm5w0\<^sub>0 \<and> (\<sigma> \<turnstile> *[((R13 \<sigma>::64 word) + 0x8),8]::64 word) = (\<sigma> \<turnstile> *[((R13 \<sigma>::64 word) + (ucast ((0x8::64 word))::64 word)),8]::64 word) \<and> (\<sigma> \<turnstile> *[R13 \<sigma>,8]::64 word) = (\<sigma> \<turnstile> *[R13 \<sigma>,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((((RSP\<^sub>0::64 word) - 0x58)::64 word) + 0x8),8]::64 word) = (\<sigma> \<turnstile> *[((R13 \<sigma>::64 word) + (ucast ((0x8::64 word))::64 word)),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),8]::64 word) = (\<sigma> \<turnstile> *[R13 \<sigma>,8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),8]::64 word) = ((((((RDX\<^sub>0::64 word) - 0x10)::64 word) AND 0xfffffffffffffff0)::64 word) + 0x10) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),8]::64 word) = RDI\<^sub>0\<close>
declare P_0x86a4_31_def[Ps]

definition P_0x86a4_31_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x86a4_31_regions_set \<sigma> \<equiv> {
    (0, R13 \<sigma>, 8),
    (1, RSP\<^sub>0, 8),
    (2, ((R13 \<sigma>::64 word) + (ucast ((0x8::64 word))::64 word)), 8),
    (3, ((FS\<^sub>0::64 word) + 0x28), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x40), 8),
    (11, ((RSP\<^sub>0::64 word) - 0x50), 8),
    (12, ((RSP\<^sub>0::64 word) - 0x58), 8),
    (13, ((RSP\<^sub>0::64 word) - 0x68), 8),
    (14, ((RSP\<^sub>0::64 word) - 0x70), 8),
    (15, ((RSP\<^sub>0::64 word) - 0x80), 8)
  }\<close>

definition P_0x86a4_31_regions :: state_pred where
  \<open>P_0x86a4_31_regions \<sigma> \<equiv> \<exists>regions. P_0x86a4_31_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_AES_decrypt_addr_0x86a4_31 :: state_pred where
  \<open>Q_AES_decrypt_addr_0x86a4_31 \<sigma> \<equiv> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x80) \<and> RIP \<sigma> = AES_decrypt_addr \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = RCX\<^sub>0 \<and> RDI \<sigma> = R13 \<sigma> \<and> RSI \<sigma> = RBX \<sigma> \<and> RBP \<sigma> = RCX\<^sub>0 \<and> R15 \<sigma> = RDX\<^sub>0 \<and> R14 \<sigma> = R8\<^sub>0 \<and> R12 \<sigma> = ((RSI\<^sub>0::64 word) + (\<langle>63,0\<rangle>((((((((RDX\<^sub>0::64 word) - 0x10)::64 word) AND 0xfffffffffffffff0)::64 word) + 0x10)::64 word) * 0x1)::64 word)) \<and> R9 \<sigma> = R9\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> regs \<sigma> ymm0w1 = ymm0w1\<^sub>0 \<and> regs \<sigma> ymm0w0 = ymm0w0\<^sub>0 \<and> regs \<sigma> ymm1w1 = ymm1w1\<^sub>0 \<and> regs \<sigma> ymm1w0 = ymm1w0\<^sub>0 \<and> regs \<sigma> ymm2w1 = (\<sigma> \<turnstile> *[((R13 \<sigma>::64 word) + (ucast ((0x8::64 word))::64 word)),8]::64 word) \<and> regs \<sigma> ymm2w0 = (\<sigma> \<turnstile> *[R13 \<sigma>,8]::64 word) \<and> regs \<sigma> ymm4w1 = ymm4w1\<^sub>0 \<and> regs \<sigma> ymm4w0 = ymm4w0\<^sub>0 \<and> regs \<sigma> ymm5w1 = ymm5w1\<^sub>0 \<and> regs \<sigma> ymm5w0 = ymm5w0\<^sub>0 \<and> (\<sigma> \<turnstile> *[((R13 \<sigma>::64 word) + 0x8),8]::64 word) = (\<sigma> \<turnstile> *[((R13 \<sigma>::64 word) + (ucast ((0x8::64 word))::64 word)),8]::64 word) \<and> (\<sigma> \<turnstile> *[R13 \<sigma>,8]::64 word) = (\<sigma> \<turnstile> *[R13 \<sigma>,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((((RSP\<^sub>0::64 word) - 0x58)::64 word) + 0x8),8]::64 word) = (\<sigma> \<turnstile> *[((R13 \<sigma>::64 word) + (ucast ((0x8::64 word))::64 word)),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),8]::64 word) = (\<sigma> \<turnstile> *[R13 \<sigma>,8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),8]::64 word) = ((((((RDX\<^sub>0::64 word) - 0x10)::64 word) AND 0xfffffffffffffff0)::64 word) + 0x10) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),8]::64 word) = RDI\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x80),8]::64 word) = 0x86a9\<close>
declare Q_AES_decrypt_addr_0x86a4_31_def[Qs]

schematic_goal AES_cbc_encrypt_0_1_0x86a4_0x86a4_31[blocks]:
  assumes \<open>(P_0x86a4_31 && P_0x86a4_31_regions) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x86a4 31 \<sigma> \<triangleq> ?\<sigma> \<and> Q_AES_decrypt_addr_0x86a4_31 ?\<sigma> \<and> block_usage P_0x86a4_31_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x86a4_31_def P_0x86a4_31_regions_def post: Q_AES_decrypt_addr_0x86a4_31_def regionset: P_0x86a4_31_regions_set_def)

definition P_0x86a9_32 :: state_pred where
  \<open>P_0x86a9_32 \<sigma> \<equiv> RIP \<sigma> = 0x86a9 \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = RCX\<^sub>0 \<and> RDI \<sigma> = R13 \<sigma> \<and> RSI \<sigma> = RBX \<sigma> \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x78) \<and> RBP \<sigma> = RCX\<^sub>0 \<and> R15 \<sigma> = RDX\<^sub>0 \<and> R14 \<sigma> = R8\<^sub>0 \<and> R12 \<sigma> = ((RSI\<^sub>0::64 word) + (\<langle>63,0\<rangle>((((((((RDX\<^sub>0::64 word) - 0x10)::64 word) AND 0xfffffffffffffff0)::64 word) + 0x10)::64 word) * 0x1)::64 word)) \<and> R9 \<sigma> = R9\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> regs \<sigma> ymm0w1 = ymm0w1\<^sub>0 \<and> regs \<sigma> ymm0w0 = ymm0w0\<^sub>0 \<and> regs \<sigma> ymm1w1 = ymm1w1\<^sub>0 \<and> regs \<sigma> ymm1w0 = ymm1w0\<^sub>0 \<and> regs \<sigma> ymm2w1 = (\<sigma> \<turnstile> *[((R13 \<sigma>::64 word) + (ucast ((0x8::64 word))::64 word)),8]::64 word) \<and> regs \<sigma> ymm2w0 = (\<sigma> \<turnstile> *[R13 \<sigma>,8]::64 word) \<and> regs \<sigma> ymm4w1 = ymm4w1\<^sub>0 \<and> regs \<sigma> ymm4w0 = ymm4w0\<^sub>0 \<and> regs \<sigma> ymm5w1 = ymm5w1\<^sub>0 \<and> regs \<sigma> ymm5w0 = ymm5w0\<^sub>0 \<and> (\<sigma> \<turnstile> *[((R13 \<sigma>::64 word) + 0x8),8]::64 word) = (\<sigma> \<turnstile> *[((R13 \<sigma>::64 word) + (ucast ((0x8::64 word))::64 word)),8]::64 word) \<and> (\<sigma> \<turnstile> *[R13 \<sigma>,8]::64 word) = (\<sigma> \<turnstile> *[R13 \<sigma>,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((((RSP\<^sub>0::64 word) - 0x58)::64 word) + 0x8),8]::64 word) = (\<sigma> \<turnstile> *[((R13 \<sigma>::64 word) + (ucast ((0x8::64 word))::64 word)),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),8]::64 word) = (\<sigma> \<turnstile> *[R13 \<sigma>,8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),8]::64 word) = ((((((RDX\<^sub>0::64 word) - 0x10)::64 word) AND 0xfffffffffffffff0)::64 word) + 0x10) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),8]::64 word) = RDI\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x80),8]::64 word) = 0x86a9\<close>
declare P_0x86a9_32_def[Ps]

definition P_0x86a9_32_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x86a9_32_regions_set \<sigma> \<equiv> {
    (0, R13 \<sigma>, 8),
    (1, RSP\<^sub>0, 8),
    (2, ((R13 \<sigma>::64 word) + (ucast ((0x8::64 word))::64 word)), 8),
    (3, ((FS\<^sub>0::64 word) + 0x28), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x40), 8),
    (11, ((RSP\<^sub>0::64 word) - 0x50), 8),
    (12, ((RSP\<^sub>0::64 word) - 0x58), 8),
    (13, ((RSP\<^sub>0::64 word) - 0x68), 8),
    (14, ((RSP\<^sub>0::64 word) - 0x70), 8),
    (15, ((RSP\<^sub>0::64 word) - 0x80), 8)
  }\<close>

definition P_0x86a9_32_regions :: state_pred where
  \<open>P_0x86a9_32_regions \<sigma> \<equiv> \<exists>regions. P_0x86a9_32_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x86b0_32 :: state_pred where
  \<open>Q_0x86b0_32 \<sigma> \<equiv> RIP \<sigma> = 0x86b0 \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDI \<sigma> = R13 \<sigma> \<and> RSI \<sigma> = RBX \<sigma> \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x78) \<and> RBP \<sigma> = RCX\<^sub>0 \<and> R15 \<sigma> = RDX\<^sub>0 \<and> R14 \<sigma> = R8\<^sub>0 \<and> R12 \<sigma> = ((RSI\<^sub>0::64 word) + (\<langle>63,0\<rangle>((((((((RDX\<^sub>0::64 word) - 0x10)::64 word) AND 0xfffffffffffffff0)::64 word) + 0x10)::64 word) * 0x1)::64 word)) \<and> R9 \<sigma> = R9\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> regs \<sigma> ymm0w1 = ymm0w1\<^sub>0 \<and> regs \<sigma> ymm0w0 = ymm0w0\<^sub>0 \<and> regs \<sigma> ymm1w1 = ymm1w1\<^sub>0 \<and> regs \<sigma> ymm1w0 = ymm1w0\<^sub>0 \<and> regs \<sigma> ymm2w1 = (\<sigma> \<turnstile> *[((R13 \<sigma>::64 word) + (ucast ((0x8::64 word))::64 word)),8]::64 word) \<and> regs \<sigma> ymm2w0 = (\<sigma> \<turnstile> *[R13 \<sigma>,8]::64 word) \<and> regs \<sigma> ymm4w1 = ymm4w1\<^sub>0 \<and> regs \<sigma> ymm4w0 = ymm4w0\<^sub>0 \<and> regs \<sigma> ymm5w1 = ymm5w1\<^sub>0 \<and> regs \<sigma> ymm5w0 = ymm5w0\<^sub>0 \<and> (\<sigma> \<turnstile> *[((R13 \<sigma>::64 word) + 0x8),8]::64 word) = (\<sigma> \<turnstile> *[((R13 \<sigma>::64 word) + (ucast ((0x8::64 word))::64 word)),8]::64 word) \<and> (\<sigma> \<turnstile> *[R13 \<sigma>,8]::64 word) = (\<sigma> \<turnstile> *[R13 \<sigma>,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((((RSP\<^sub>0::64 word) - 0x58)::64 word) + 0x8),8]::64 word) = (\<sigma> \<turnstile> *[((R13 \<sigma>::64 word) + (ucast ((0x8::64 word))::64 word)),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),8]::64 word) = (\<sigma> \<turnstile> *[R13 \<sigma>,8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),8]::64 word) = ((((((RDX\<^sub>0::64 word) - 0x10)::64 word) AND 0xfffffffffffffff0)::64 word) + 0x10) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),8]::64 word) = RDI\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x80),8]::64 word) = 0x86a9\<close>
declare Q_0x86b0_32_def[Qs]

schematic_goal AES_cbc_encrypt_0_2_0x86a9_0x86ab_32[blocks]:
  assumes \<open>(P_0x86a9_32 && P_0x86a9_32_regions) \<sigma>\<close>
  shows \<open>exec_block 2 0x86ab 32 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x86b0_32 ?\<sigma> \<and> block_usage P_0x86a9_32_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x86a9_32_def P_0x86a9_32_regions_def post: Q_0x86b0_32_def regionset: P_0x86a9_32_regions_set_def)

definition P_0x86b0_33 :: state_pred where
  \<open>P_0x86b0_33 \<sigma> \<equiv> RIP \<sigma> = 0x86b0 \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDI \<sigma> = R13 \<sigma> \<and> RSI \<sigma> = RBX \<sigma> \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x78) \<and> RBP \<sigma> = RCX\<^sub>0 \<and> R15 \<sigma> = RDX\<^sub>0 \<and> R14 \<sigma> = R8\<^sub>0 \<and> R12 \<sigma> = ((RSI\<^sub>0::64 word) + (\<langle>63,0\<rangle>((((((((RDX\<^sub>0::64 word) - 0x10)::64 word) AND 0xfffffffffffffff0)::64 word) + 0x10)::64 word) * 0x1)::64 word)) \<and> R9 \<sigma> = R9\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> regs \<sigma> ymm0w1 = ymm0w1\<^sub>0 \<and> regs \<sigma> ymm0w0 = ymm0w0\<^sub>0 \<and> regs \<sigma> ymm1w1 = ymm1w1\<^sub>0 \<and> regs \<sigma> ymm1w0 = ymm1w0\<^sub>0 \<and> regs \<sigma> ymm2w1 = (\<sigma> \<turnstile> *[((R13 \<sigma>::64 word) + (ucast ((0x8::64 word))::64 word)),8]::64 word) \<and> regs \<sigma> ymm2w0 = (\<sigma> \<turnstile> *[R13 \<sigma>,8]::64 word) \<and> regs \<sigma> ymm4w1 = ymm4w1\<^sub>0 \<and> regs \<sigma> ymm4w0 = ymm4w0\<^sub>0 \<and> regs \<sigma> ymm5w1 = ymm5w1\<^sub>0 \<and> regs \<sigma> ymm5w0 = ymm5w0\<^sub>0 \<and> (\<sigma> \<turnstile> *[((R13 \<sigma>::64 word) + 0x8),8]::64 word) = (\<sigma> \<turnstile> *[((R13 \<sigma>::64 word) + (ucast ((0x8::64 word))::64 word)),8]::64 word) \<and> (\<sigma> \<turnstile> *[R13 \<sigma>,8]::64 word) = (\<sigma> \<turnstile> *[R13 \<sigma>,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((((RSP\<^sub>0::64 word) - 0x58)::64 word) + 0x8),8]::64 word) = (\<sigma> \<turnstile> *[((R13 \<sigma>::64 word) + (ucast ((0x8::64 word))::64 word)),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),8]::64 word) = (\<sigma> \<turnstile> *[R13 \<sigma>,8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),8]::64 word) = ((((((RDX\<^sub>0::64 word) - 0x10)::64 word) AND 0xfffffffffffffff0)::64 word) + 0x10) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),8]::64 word) = RDI\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x80),8]::64 word) = 0x86a9\<close>
declare P_0x86b0_33_def[Ps]

definition P_0x86b0_33_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x86b0_33_regions_set \<sigma> \<equiv> {
    (0, R13 \<sigma>, 8),
    (1, RSP\<^sub>0, 8),
    (2, ((RBX \<sigma>::64 word) + (\<langle>63,0\<rangle>((RAX \<sigma>::64 word) * 0x1)::64 word)), Suc 0),
    (3, ((R13 \<sigma>::64 word) + (ucast ((0x8::64 word))::64 word)), 8),
    (4, ((FS\<^sub>0::64 word) + 0x28), 8),
    (5, ((R8\<^sub>0::64 word) + (\<langle>63,0\<rangle>((RAX \<sigma>::64 word) * 0x1)::64 word)), Suc 0),
    (6, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (11, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (12, ((RSP\<^sub>0::64 word) - 0x40), 8),
    (13, ((RSP\<^sub>0::64 word) - 0x50), 8),
    (14, ((RSP\<^sub>0::64 word) - 0x58), 8),
    (15, ((RSP\<^sub>0::64 word) - 0x68), 8),
    (16, ((RSP\<^sub>0::64 word) - 0x70), 8),
    (17, ((RSP\<^sub>0::64 word) - 0x80), 8)
  }\<close>

definition P_0x86b0_33_regions :: state_pred where
  \<open>P_0x86b0_33_regions \<sigma> \<equiv> \<exists>regions. P_0x86b0_33_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x86c0_33 :: state_pred where
  \<open>Q_0x86c0_33 \<sigma> \<equiv> RIP \<sigma> = 0x86c0 \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDI \<sigma> = R13 \<sigma> \<and> RSI \<sigma> = RBX \<sigma> \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x78) \<and> RBP \<sigma> = RCX\<^sub>0 \<and> R15 \<sigma> = RDX\<^sub>0 \<and> R14 \<sigma> = R8\<^sub>0 \<and> R12 \<sigma> = ((RSI\<^sub>0::64 word) + (\<langle>63,0\<rangle>((((((((RDX\<^sub>0::64 word) - 0x10)::64 word) AND 0xfffffffffffffff0)::64 word) + 0x10)::64 word) * 0x1)::64 word)) \<and> R9 \<sigma> = R9\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> regs \<sigma> ymm0w1 = ymm0w1\<^sub>0 \<and> regs \<sigma> ymm0w0 = ymm0w0\<^sub>0 \<and> regs \<sigma> ymm1w1 = ymm1w1\<^sub>0 \<and> regs \<sigma> ymm1w0 = ymm1w0\<^sub>0 \<and> regs \<sigma> ymm2w1 = (\<sigma> \<turnstile> *[((R13 \<sigma>::64 word) + (ucast ((0x8::64 word))::64 word)),8]::64 word) \<and> regs \<sigma> ymm2w0 = (\<sigma> \<turnstile> *[R13 \<sigma>,8]::64 word) \<and> regs \<sigma> ymm4w1 = ymm4w1\<^sub>0 \<and> regs \<sigma> ymm4w0 = ymm4w0\<^sub>0 \<and> regs \<sigma> ymm5w1 = ymm5w1\<^sub>0 \<and> regs \<sigma> ymm5w0 = ymm5w0\<^sub>0 \<and> (\<sigma> \<turnstile> *[((R13 \<sigma>::64 word) + 0x8),8]::64 word) = (\<sigma> \<turnstile> *[((R13 \<sigma>::64 word) + (ucast ((0x8::64 word))::64 word)),8]::64 word) \<and> (\<sigma> \<turnstile> *[R13 \<sigma>,8]::64 word) = (\<sigma> \<turnstile> *[R13 \<sigma>,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((((RSP\<^sub>0::64 word) - 0x58)::64 word) + 0x8),8]::64 word) = (\<sigma> \<turnstile> *[((R13 \<sigma>::64 word) + (ucast ((0x8::64 word))::64 word)),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),8]::64 word) = (\<sigma> \<turnstile> *[R13 \<sigma>,8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),8]::64 word) = ((((((RDX\<^sub>0::64 word) - 0x10)::64 word) AND 0xfffffffffffffff0)::64 word) + 0x10) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),8]::64 word) = RDI\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x80),8]::64 word) = 0x86a9\<close>
declare Q_0x86c0_33_def[Qs]

schematic_goal AES_cbc_encrypt_0_4_0x86b0_0x86bc_33[blocks]:
  assumes \<open>(P_0x86b0_33 && P_0x86b0_33_regions) \<sigma>\<close>
  shows \<open>exec_block 4 0x86bc 33 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x86c0_33 ?\<sigma> \<and> block_usage P_0x86b0_33_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x86b0_33_def P_0x86b0_33_regions_def post: Q_0x86c0_33_def regionset: P_0x86b0_33_regions_set_def)

definition P_0x86c0_true_34 :: state_pred where
  \<open>P_0x86c0_true_34 \<sigma> \<equiv> RIP \<sigma> = 0x86c0 \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDI \<sigma> = R13 \<sigma> \<and> RSI \<sigma> = RBX \<sigma> \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x78) \<and> RBP \<sigma> = RCX\<^sub>0 \<and> R15 \<sigma> = RDX\<^sub>0 \<and> R14 \<sigma> = R8\<^sub>0 \<and> R12 \<sigma> = ((RSI\<^sub>0::64 word) + (\<langle>63,0\<rangle>((((((((RDX\<^sub>0::64 word) - 0x10)::64 word) AND 0xfffffffffffffff0)::64 word) + 0x10)::64 word) * 0x1)::64 word)) \<and> R9 \<sigma> = R9\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> regs \<sigma> ymm0w1 = ymm0w1\<^sub>0 \<and> regs \<sigma> ymm0w0 = ymm0w0\<^sub>0 \<and> regs \<sigma> ymm1w1 = ymm1w1\<^sub>0 \<and> regs \<sigma> ymm1w0 = ymm1w0\<^sub>0 \<and> regs \<sigma> ymm2w1 = (\<sigma> \<turnstile> *[((R13 \<sigma>::64 word) + (ucast ((0x8::64 word))::64 word)),8]::64 word) \<and> regs \<sigma> ymm2w0 = (\<sigma> \<turnstile> *[R13 \<sigma>,8]::64 word) \<and> regs \<sigma> ymm4w1 = ymm4w1\<^sub>0 \<and> regs \<sigma> ymm4w0 = ymm4w0\<^sub>0 \<and> regs \<sigma> ymm5w1 = ymm5w1\<^sub>0 \<and> regs \<sigma> ymm5w0 = ymm5w0\<^sub>0 \<and> (\<sigma> \<turnstile> *[((R13 \<sigma>::64 word) + 0x8),8]::64 word) = (\<sigma> \<turnstile> *[((R13 \<sigma>::64 word) + (ucast ((0x8::64 word))::64 word)),8]::64 word) \<and> (\<sigma> \<turnstile> *[R13 \<sigma>,8]::64 word) = (\<sigma> \<turnstile> *[R13 \<sigma>,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((((RSP\<^sub>0::64 word) - 0x58)::64 word) + 0x8),8]::64 word) = (\<sigma> \<turnstile> *[((R13 \<sigma>::64 word) + (ucast ((0x8::64 word))::64 word)),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),8]::64 word) = (\<sigma> \<turnstile> *[R13 \<sigma>,8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),8]::64 word) = ((((((RDX\<^sub>0::64 word) - 0x10)::64 word) AND 0xfffffffffffffff0)::64 word) + 0x10) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),8]::64 word) = RDI\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x80),8]::64 word) = 0x86a9\<close>
declare P_0x86c0_true_34_def[Ps]

definition P_0x86c0_true_34_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x86c0_true_34_regions_set \<sigma> \<equiv> {
    (0, R13 \<sigma>, 8),
    (1, RSP\<^sub>0, 8),
    (2, ((R13 \<sigma>::64 word) + (ucast ((0x8::64 word))::64 word)), 8),
    (3, ((FS\<^sub>0::64 word) + 0x28), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x40), 8),
    (11, ((RSP\<^sub>0::64 word) - 0x50), 8),
    (12, ((RSP\<^sub>0::64 word) - 0x58), 8),
    (13, ((RSP\<^sub>0::64 word) - 0x68), 8),
    (14, ((RSP\<^sub>0::64 word) - 0x70), 8),
    (15, ((RSP\<^sub>0::64 word) - 0x80), 8)
  }\<close>

definition P_0x86c0_true_34_regions :: state_pred where
  \<open>P_0x86c0_true_34_regions \<sigma> \<equiv> \<exists>regions. P_0x86c0_true_34_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x86b0_34 :: state_pred where
  \<open>Q_0x86b0_34 \<sigma> \<equiv> RIP \<sigma> = 0x86b0 \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDI \<sigma> = R13 \<sigma> \<and> RSI \<sigma> = RBX \<sigma> \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x78) \<and> RBP \<sigma> = RCX\<^sub>0 \<and> R15 \<sigma> = RDX\<^sub>0 \<and> R14 \<sigma> = R8\<^sub>0 \<and> R12 \<sigma> = ((RSI\<^sub>0::64 word) + (\<langle>63,0\<rangle>((((((((RDX\<^sub>0::64 word) - 0x10)::64 word) AND 0xfffffffffffffff0)::64 word) + 0x10)::64 word) * 0x1)::64 word)) \<and> R9 \<sigma> = R9\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> regs \<sigma> ymm0w1 = ymm0w1\<^sub>0 \<and> regs \<sigma> ymm0w0 = ymm0w0\<^sub>0 \<and> regs \<sigma> ymm1w1 = ymm1w1\<^sub>0 \<and> regs \<sigma> ymm1w0 = ymm1w0\<^sub>0 \<and> regs \<sigma> ymm2w1 = (\<sigma> \<turnstile> *[((R13 \<sigma>::64 word) + (ucast ((0x8::64 word))::64 word)),8]::64 word) \<and> regs \<sigma> ymm2w0 = (\<sigma> \<turnstile> *[R13 \<sigma>,8]::64 word) \<and> regs \<sigma> ymm4w1 = ymm4w1\<^sub>0 \<and> regs \<sigma> ymm4w0 = ymm4w0\<^sub>0 \<and> regs \<sigma> ymm5w1 = ymm5w1\<^sub>0 \<and> regs \<sigma> ymm5w0 = ymm5w0\<^sub>0 \<and> (\<sigma> \<turnstile> *[((R13 \<sigma>::64 word) + 0x8),8]::64 word) = (\<sigma> \<turnstile> *[((R13 \<sigma>::64 word) + (ucast ((0x8::64 word))::64 word)),8]::64 word) \<and> (\<sigma> \<turnstile> *[R13 \<sigma>,8]::64 word) = (\<sigma> \<turnstile> *[R13 \<sigma>,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((((RSP\<^sub>0::64 word) - 0x58)::64 word) + 0x8),8]::64 word) = (\<sigma> \<turnstile> *[((R13 \<sigma>::64 word) + (ucast ((0x8::64 word))::64 word)),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),8]::64 word) = (\<sigma> \<turnstile> *[R13 \<sigma>,8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),8]::64 word) = ((((((RDX\<^sub>0::64 word) - 0x10)::64 word) AND 0xfffffffffffffff0)::64 word) + 0x10) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),8]::64 word) = RDI\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x80),8]::64 word) = 0x86a9\<close>
declare Q_0x86b0_34_def[Qs]

schematic_goal AES_cbc_encrypt_0_1_0x86c0_0x86c0_34[blocks]:
  assumes \<open>(P_0x86c0_true_34 && P_0x86c0_true_34_regions && !ZF) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x86c0 34 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x86b0_34 ?\<sigma> \<and> block_usage P_0x86c0_true_34_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x86c0_true_34_def P_0x86c0_true_34_regions_def post: Q_0x86b0_34_def regionset: P_0x86c0_true_34_regions_set_def)

definition P_0x86c0_false_35 :: state_pred where
  \<open>P_0x86c0_false_35 \<sigma> \<equiv> RIP \<sigma> = 0x86c0 \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDI \<sigma> = R13 \<sigma> \<and> RSI \<sigma> = RBX \<sigma> \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x78) \<and> RBP \<sigma> = RCX\<^sub>0 \<and> R15 \<sigma> = RDX\<^sub>0 \<and> R14 \<sigma> = R8\<^sub>0 \<and> R12 \<sigma> = ((RSI\<^sub>0::64 word) + (\<langle>63,0\<rangle>((((((((RDX\<^sub>0::64 word) - 0x10)::64 word) AND 0xfffffffffffffff0)::64 word) + 0x10)::64 word) * 0x1)::64 word)) \<and> R9 \<sigma> = R9\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> regs \<sigma> ymm0w1 = ymm0w1\<^sub>0 \<and> regs \<sigma> ymm0w0 = ymm0w0\<^sub>0 \<and> regs \<sigma> ymm1w1 = ymm1w1\<^sub>0 \<and> regs \<sigma> ymm1w0 = ymm1w0\<^sub>0 \<and> regs \<sigma> ymm2w1 = (\<sigma> \<turnstile> *[((R13 \<sigma>::64 word) + (ucast ((0x8::64 word))::64 word)),8]::64 word) \<and> regs \<sigma> ymm2w0 = (\<sigma> \<turnstile> *[R13 \<sigma>,8]::64 word) \<and> regs \<sigma> ymm4w1 = ymm4w1\<^sub>0 \<and> regs \<sigma> ymm4w0 = ymm4w0\<^sub>0 \<and> regs \<sigma> ymm5w1 = ymm5w1\<^sub>0 \<and> regs \<sigma> ymm5w0 = ymm5w0\<^sub>0 \<and> (\<sigma> \<turnstile> *[((R13 \<sigma>::64 word) + 0x8),8]::64 word) = (\<sigma> \<turnstile> *[((R13 \<sigma>::64 word) + (ucast ((0x8::64 word))::64 word)),8]::64 word) \<and> (\<sigma> \<turnstile> *[R13 \<sigma>,8]::64 word) = (\<sigma> \<turnstile> *[R13 \<sigma>,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((((RSP\<^sub>0::64 word) - 0x58)::64 word) + 0x8),8]::64 word) = (\<sigma> \<turnstile> *[((R13 \<sigma>::64 word) + (ucast ((0x8::64 word))::64 word)),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),8]::64 word) = (\<sigma> \<turnstile> *[R13 \<sigma>,8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),8]::64 word) = ((((((RDX\<^sub>0::64 word) - 0x10)::64 word) AND 0xfffffffffffffff0)::64 word) + 0x10) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),8]::64 word) = RDI\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x80),8]::64 word) = 0x86a9\<close>
declare P_0x86c0_false_35_def[Ps]

definition P_0x86c0_false_35_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x86c0_false_35_regions_set \<sigma> \<equiv> {
    (0, R13 \<sigma>, 8),
    (1, RSP\<^sub>0, 8),
    (2, ((R13 \<sigma>::64 word) + (ucast ((0x8::64 word))::64 word)), 8),
    (3, ((FS\<^sub>0::64 word) + 0x28), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x40), 8),
    (11, ((RSP\<^sub>0::64 word) - 0x50), 8),
    (12, ((RSP\<^sub>0::64 word) - 0x58), 8),
    (13, ((RSP\<^sub>0::64 word) - 0x68), 8),
    (14, ((RSP\<^sub>0::64 word) - 0x70), 8),
    (15, ((RSP\<^sub>0::64 word) - 0x80), 8)
  }\<close>

definition P_0x86c0_false_35_regions :: state_pred where
  \<open>P_0x86c0_false_35_regions \<sigma> \<equiv> \<exists>regions. P_0x86c0_false_35_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x86c2_35 :: state_pred where
  \<open>Q_0x86c2_35 \<sigma> \<equiv> RIP \<sigma> = 0x86c2 \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDI \<sigma> = R13 \<sigma> \<and> RSI \<sigma> = RBX \<sigma> \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x78) \<and> RBP \<sigma> = RCX\<^sub>0 \<and> R15 \<sigma> = RDX\<^sub>0 \<and> R14 \<sigma> = R8\<^sub>0 \<and> R12 \<sigma> = ((RSI\<^sub>0::64 word) + (\<langle>63,0\<rangle>((((((((RDX\<^sub>0::64 word) - 0x10)::64 word) AND 0xfffffffffffffff0)::64 word) + 0x10)::64 word) * 0x1)::64 word)) \<and> R9 \<sigma> = R9\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> regs \<sigma> ymm0w1 = ymm0w1\<^sub>0 \<and> regs \<sigma> ymm0w0 = ymm0w0\<^sub>0 \<and> regs \<sigma> ymm1w1 = ymm1w1\<^sub>0 \<and> regs \<sigma> ymm1w0 = ymm1w0\<^sub>0 \<and> regs \<sigma> ymm2w1 = (\<sigma> \<turnstile> *[((R13 \<sigma>::64 word) + (ucast ((0x8::64 word))::64 word)),8]::64 word) \<and> regs \<sigma> ymm2w0 = (\<sigma> \<turnstile> *[R13 \<sigma>,8]::64 word) \<and> regs \<sigma> ymm4w1 = ymm4w1\<^sub>0 \<and> regs \<sigma> ymm4w0 = ymm4w0\<^sub>0 \<and> regs \<sigma> ymm5w1 = ymm5w1\<^sub>0 \<and> regs \<sigma> ymm5w0 = ymm5w0\<^sub>0 \<and> (\<sigma> \<turnstile> *[((R13 \<sigma>::64 word) + 0x8),8]::64 word) = (\<sigma> \<turnstile> *[((R13 \<sigma>::64 word) + (ucast ((0x8::64 word))::64 word)),8]::64 word) \<and> (\<sigma> \<turnstile> *[R13 \<sigma>,8]::64 word) = (\<sigma> \<turnstile> *[R13 \<sigma>,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((((RSP\<^sub>0::64 word) - 0x58)::64 word) + 0x8),8]::64 word) = (\<sigma> \<turnstile> *[((R13 \<sigma>::64 word) + (ucast ((0x8::64 word))::64 word)),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),8]::64 word) = (\<sigma> \<turnstile> *[R13 \<sigma>,8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),8]::64 word) = ((((((RDX\<^sub>0::64 word) - 0x10)::64 word) AND 0xfffffffffffffff0)::64 word) + 0x10) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),8]::64 word) = RDI\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x80),8]::64 word) = 0x86a9\<close>
declare Q_0x86c2_35_def[Qs]

schematic_goal AES_cbc_encrypt_0_1_0x86c0_0x86c0_35[blocks]:
  assumes \<open>(P_0x86c0_false_35 && P_0x86c0_false_35_regions && ! !ZF) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x86c0 35 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x86c2_35 ?\<sigma> \<and> block_usage P_0x86c0_false_35_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x86c0_false_35_def P_0x86c0_false_35_regions_def post: Q_0x86c2_35_def regionset: P_0x86c0_false_35_regions_set_def)

definition P_0x86c2_36 :: state_pred where
  \<open>P_0x86c2_36 \<sigma> \<equiv> RIP \<sigma> = 0x86c2 \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDI \<sigma> = R13 \<sigma> \<and> RSI \<sigma> = RBX \<sigma> \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x78) \<and> RBP \<sigma> = RCX\<^sub>0 \<and> R15 \<sigma> = RDX\<^sub>0 \<and> R14 \<sigma> = R8\<^sub>0 \<and> R12 \<sigma> = ((RSI\<^sub>0::64 word) + (\<langle>63,0\<rangle>((((((((RDX\<^sub>0::64 word) - 0x10)::64 word) AND 0xfffffffffffffff0)::64 word) + 0x10)::64 word) * 0x1)::64 word)) \<and> R9 \<sigma> = R9\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> regs \<sigma> ymm0w1 = ymm0w1\<^sub>0 \<and> regs \<sigma> ymm0w0 = ymm0w0\<^sub>0 \<and> regs \<sigma> ymm1w1 = ymm1w1\<^sub>0 \<and> regs \<sigma> ymm1w0 = ymm1w0\<^sub>0 \<and> regs \<sigma> ymm2w1 = (\<sigma> \<turnstile> *[((R13 \<sigma>::64 word) + (ucast ((0x8::64 word))::64 word)),8]::64 word) \<and> regs \<sigma> ymm2w0 = (\<sigma> \<turnstile> *[R13 \<sigma>,8]::64 word) \<and> regs \<sigma> ymm4w1 = ymm4w1\<^sub>0 \<and> regs \<sigma> ymm4w0 = ymm4w0\<^sub>0 \<and> regs \<sigma> ymm5w1 = ymm5w1\<^sub>0 \<and> regs \<sigma> ymm5w0 = ymm5w0\<^sub>0 \<and> (\<sigma> \<turnstile> *[((R13 \<sigma>::64 word) + 0x8),8]::64 word) = (\<sigma> \<turnstile> *[((R13 \<sigma>::64 word) + (ucast ((0x8::64 word))::64 word)),8]::64 word) \<and> (\<sigma> \<turnstile> *[R13 \<sigma>,8]::64 word) = (\<sigma> \<turnstile> *[R13 \<sigma>,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((((RSP\<^sub>0::64 word) - 0x58)::64 word) + 0x8),8]::64 word) = (\<sigma> \<turnstile> *[((R13 \<sigma>::64 word) + (ucast ((0x8::64 word))::64 word)),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),8]::64 word) = (\<sigma> \<turnstile> *[R13 \<sigma>,8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),8]::64 word) = ((((((RDX\<^sub>0::64 word) - 0x10)::64 word) AND 0xfffffffffffffff0)::64 word) + 0x10) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),8]::64 word) = RDI\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x80),8]::64 word) = 0x86a9\<close>
declare P_0x86c2_36_def[Ps]

definition P_0x86c2_36_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x86c2_36_regions_set \<sigma> \<equiv> {
    (0, R13 \<sigma>, 8),
    (1, R8\<^sub>0, 8),
    (2, RSP\<^sub>0, 8),
    (3, ((R13 \<sigma>::64 word) + (ucast ((0x8::64 word))::64 word)), 8),
    (4, ((FS\<^sub>0::64 word) + 0x28), 8),
    (5, ((R8\<^sub>0::64 word) + (ucast ((0x8::64 word))::64 word)), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (11, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (12, ((RSP\<^sub>0::64 word) - 0x40), 8),
    (13, ((RSP\<^sub>0::64 word) - 0x50), 8),
    (14, ((RSP\<^sub>0::64 word) - 0x58), 8),
    (15, ((RSP\<^sub>0::64 word) - 0x68), 8),
    (16, ((RSP\<^sub>0::64 word) - 0x70), 8),
    (17, ((RSP\<^sub>0::64 word) - 0x80), 8)
  }\<close>

definition P_0x86c2_36_regions :: state_pred where
  \<open>P_0x86c2_36_regions \<sigma> \<equiv> \<exists>regions. P_0x86c2_36_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x86d7_36 :: state_pred where
  \<open>Q_0x86d7_36 \<sigma> \<equiv> RIP \<sigma> = 0x86d7 \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x78) \<and> RBP \<sigma> = RCX\<^sub>0 \<and> R15 \<sigma> = RDX\<^sub>0 \<and> R14 \<sigma> = R8\<^sub>0 \<and> R12 \<sigma> = ((RSI\<^sub>0::64 word) + (\<langle>63,0\<rangle>((((((((RDX\<^sub>0::64 word) - 0x10)::64 word) AND 0xfffffffffffffff0)::64 word) + 0x10)::64 word) * 0x1)::64 word)) \<and> R9 \<sigma> = R9\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> regs \<sigma> ymm0w1 = ymm0w1\<^sub>0 \<and> regs \<sigma> ymm0w0 = ymm0w0\<^sub>0 \<and> regs \<sigma> ymm1w1 = ymm1w1\<^sub>0 \<and> regs \<sigma> ymm1w0 = ymm1w0\<^sub>0 \<and> regs \<sigma> ymm4w1 = ymm4w1\<^sub>0 \<and> regs \<sigma> ymm4w0 = ymm4w0\<^sub>0 \<and> regs \<sigma> ymm5w1 = ymm5w1\<^sub>0 \<and> regs \<sigma> ymm5w0 = ymm5w0\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),8]::64 word) = ((((((RDX\<^sub>0::64 word) - 0x10)::64 word) AND 0xfffffffffffffff0)::64 word) + 0x10) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),8]::64 word) = RDI\<^sub>0\<close>
declare Q_0x86d7_36_def[Qs]

schematic_goal AES_cbc_encrypt_0_5_0x86c2_0x86d4_36[blocks]:
  assumes \<open>(P_0x86c2_36 && P_0x86c2_36_regions) \<sigma>\<close>
  shows \<open>exec_block 5 0x86d4 36 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x86d7_36 ?\<sigma> \<and> block_usage P_0x86c2_36_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x86c2_36_def P_0x86c2_36_regions_def post: Q_0x86d7_36_def regionset: P_0x86c2_36_regions_set_def)

definition P_0x86d7_true_37 :: state_pred where
  \<open>P_0x86d7_true_37 \<sigma> \<equiv> RIP \<sigma> = 0x86d7 \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x78) \<and> RBP \<sigma> = RCX\<^sub>0 \<and> R15 \<sigma> = RDX\<^sub>0 \<and> R14 \<sigma> = R8\<^sub>0 \<and> R12 \<sigma> = ((RSI\<^sub>0::64 word) + (\<langle>63,0\<rangle>((((((((RDX\<^sub>0::64 word) - 0x10)::64 word) AND 0xfffffffffffffff0)::64 word) + 0x10)::64 word) * 0x1)::64 word)) \<and> R9 \<sigma> = R9\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> regs \<sigma> ymm0w1 = ymm0w1\<^sub>0 \<and> regs \<sigma> ymm0w0 = ymm0w0\<^sub>0 \<and> regs \<sigma> ymm1w1 = ymm1w1\<^sub>0 \<and> regs \<sigma> ymm1w0 = ymm1w0\<^sub>0 \<and> regs \<sigma> ymm4w1 = ymm4w1\<^sub>0 \<and> regs \<sigma> ymm4w0 = ymm4w0\<^sub>0 \<and> regs \<sigma> ymm5w1 = ymm5w1\<^sub>0 \<and> regs \<sigma> ymm5w0 = ymm5w0\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),8]::64 word) = ((((((RDX\<^sub>0::64 word) - 0x10)::64 word) AND 0xfffffffffffffff0)::64 word) + 0x10) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),8]::64 word) = RDI\<^sub>0\<close>
declare P_0x86d7_true_37_def[Ps]

definition P_0x86d7_true_37_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x86d7_true_37_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((FS\<^sub>0::64 word) + 0x28), 8),
    (2, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x40), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x68), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x70), 8)
  }\<close>

definition P_0x86d7_true_37_regions :: state_pred where
  \<open>P_0x86d7_true_37_regions \<sigma> \<equiv> \<exists>regions. P_0x86d7_true_37_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x8690_37 :: state_pred where
  \<open>Q_0x8690_37 \<sigma> \<equiv> RIP \<sigma> = 0x8690 \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x78) \<and> RBP \<sigma> = RCX\<^sub>0 \<and> R15 \<sigma> = RDX\<^sub>0 \<and> R14 \<sigma> = R8\<^sub>0 \<and> R12 \<sigma> = ((RSI\<^sub>0::64 word) + (\<langle>63,0\<rangle>((((((((RDX\<^sub>0::64 word) - 0x10)::64 word) AND 0xfffffffffffffff0)::64 word) + 0x10)::64 word) * 0x1)::64 word)) \<and> R9 \<sigma> = R9\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> regs \<sigma> ymm0w1 = ymm0w1\<^sub>0 \<and> regs \<sigma> ymm0w0 = ymm0w0\<^sub>0 \<and> regs \<sigma> ymm1w1 = ymm1w1\<^sub>0 \<and> regs \<sigma> ymm1w0 = ymm1w0\<^sub>0 \<and> regs \<sigma> ymm4w1 = ymm4w1\<^sub>0 \<and> regs \<sigma> ymm4w0 = ymm4w0\<^sub>0 \<and> regs \<sigma> ymm5w1 = ymm5w1\<^sub>0 \<and> regs \<sigma> ymm5w0 = ymm5w0\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),8]::64 word) = ((((((RDX\<^sub>0::64 word) - 0x10)::64 word) AND 0xfffffffffffffff0)::64 word) + 0x10) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),8]::64 word) = RDI\<^sub>0\<close>
declare Q_0x8690_37_def[Qs]

schematic_goal AES_cbc_encrypt_0_1_0x86d7_0x86d7_37[blocks]:
  assumes \<open>(P_0x86d7_true_37 && P_0x86d7_true_37_regions && !ZF) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x86d7 37 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x8690_37 ?\<sigma> \<and> block_usage P_0x86d7_true_37_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x86d7_true_37_def P_0x86d7_true_37_regions_def post: Q_0x8690_37_def regionset: P_0x86d7_true_37_regions_set_def)

definition P_0x86d7_false_38 :: state_pred where
  \<open>P_0x86d7_false_38 \<sigma> \<equiv> RIP \<sigma> = 0x86d7 \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x78) \<and> RBP \<sigma> = RCX\<^sub>0 \<and> R15 \<sigma> = RDX\<^sub>0 \<and> R14 \<sigma> = R8\<^sub>0 \<and> R12 \<sigma> = ((RSI\<^sub>0::64 word) + (\<langle>63,0\<rangle>((((((((RDX\<^sub>0::64 word) - 0x10)::64 word) AND 0xfffffffffffffff0)::64 word) + 0x10)::64 word) * 0x1)::64 word)) \<and> R9 \<sigma> = R9\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> regs \<sigma> ymm0w1 = ymm0w1\<^sub>0 \<and> regs \<sigma> ymm0w0 = ymm0w0\<^sub>0 \<and> regs \<sigma> ymm1w1 = ymm1w1\<^sub>0 \<and> regs \<sigma> ymm1w0 = ymm1w0\<^sub>0 \<and> regs \<sigma> ymm4w1 = ymm4w1\<^sub>0 \<and> regs \<sigma> ymm4w0 = ymm4w0\<^sub>0 \<and> regs \<sigma> ymm5w1 = ymm5w1\<^sub>0 \<and> regs \<sigma> ymm5w0 = ymm5w0\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),8]::64 word) = ((((((RDX\<^sub>0::64 word) - 0x10)::64 word) AND 0xfffffffffffffff0)::64 word) + 0x10) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),8]::64 word) = RDI\<^sub>0\<close>
declare P_0x86d7_false_38_def[Ps]

definition P_0x86d7_false_38_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x86d7_false_38_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((FS\<^sub>0::64 word) + 0x28), 8),
    (2, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x40), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x68), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x70), 8)
  }\<close>

definition P_0x86d7_false_38_regions :: state_pred where
  \<open>P_0x86d7_false_38_regions \<sigma> \<equiv> \<exists>regions. P_0x86d7_false_38_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x86d9_38 :: state_pred where
  \<open>Q_0x86d9_38 \<sigma> \<equiv> RIP \<sigma> = 0x86d9 \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x78) \<and> RBP \<sigma> = RCX\<^sub>0 \<and> R15 \<sigma> = RDX\<^sub>0 \<and> R14 \<sigma> = R8\<^sub>0 \<and> R12 \<sigma> = ((RSI\<^sub>0::64 word) + (\<langle>63,0\<rangle>((((((((RDX\<^sub>0::64 word) - 0x10)::64 word) AND 0xfffffffffffffff0)::64 word) + 0x10)::64 word) * 0x1)::64 word)) \<and> R9 \<sigma> = R9\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> regs \<sigma> ymm0w1 = ymm0w1\<^sub>0 \<and> regs \<sigma> ymm0w0 = ymm0w0\<^sub>0 \<and> regs \<sigma> ymm1w1 = ymm1w1\<^sub>0 \<and> regs \<sigma> ymm1w0 = ymm1w0\<^sub>0 \<and> regs \<sigma> ymm4w1 = ymm4w1\<^sub>0 \<and> regs \<sigma> ymm4w0 = ymm4w0\<^sub>0 \<and> regs \<sigma> ymm5w1 = ymm5w1\<^sub>0 \<and> regs \<sigma> ymm5w0 = ymm5w0\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),8]::64 word) = ((((((RDX\<^sub>0::64 word) - 0x10)::64 word) AND 0xfffffffffffffff0)::64 word) + 0x10) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),8]::64 word) = RDI\<^sub>0\<close>
declare Q_0x86d9_38_def[Qs]

schematic_goal AES_cbc_encrypt_0_1_0x86d7_0x86d7_38[blocks]:
  assumes \<open>(P_0x86d7_false_38 && P_0x86d7_false_38_regions && ! !ZF) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x86d7 38 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x86d9_38 ?\<sigma> \<and> block_usage P_0x86d7_false_38_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x86d7_false_38_def P_0x86d7_false_38_regions_def post: Q_0x86d9_38_def regionset: P_0x86d7_false_38_regions_set_def)

definition P_0x86d9_39 :: state_pred where
  \<open>P_0x86d9_39 \<sigma> \<equiv> RIP \<sigma> = 0x86d9 \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x78) \<and> RBP \<sigma> = RCX\<^sub>0 \<and> R15 \<sigma> = RDX\<^sub>0 \<and> R14 \<sigma> = R8\<^sub>0 \<and> R12 \<sigma> = ((RSI\<^sub>0::64 word) + (\<langle>63,0\<rangle>((((((((RDX\<^sub>0::64 word) - 0x10)::64 word) AND 0xfffffffffffffff0)::64 word) + 0x10)::64 word) * 0x1)::64 word)) \<and> R9 \<sigma> = R9\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> regs \<sigma> ymm0w1 = ymm0w1\<^sub>0 \<and> regs \<sigma> ymm0w0 = ymm0w0\<^sub>0 \<and> regs \<sigma> ymm1w1 = ymm1w1\<^sub>0 \<and> regs \<sigma> ymm1w0 = ymm1w0\<^sub>0 \<and> regs \<sigma> ymm4w1 = ymm4w1\<^sub>0 \<and> regs \<sigma> ymm4w0 = ymm4w0\<^sub>0 \<and> regs \<sigma> ymm5w1 = ymm5w1\<^sub>0 \<and> regs \<sigma> ymm5w0 = ymm5w0\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),8]::64 word) = ((((((RDX\<^sub>0::64 word) - 0x10)::64 word) AND 0xfffffffffffffff0)::64 word) + 0x10) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),8]::64 word) = RDI\<^sub>0\<close>
declare P_0x86d9_39_def[Ps]

definition P_0x86d9_39_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x86d9_39_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((FS\<^sub>0::64 word) + 0x28), 8),
    (2, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x40), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x68), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x70), 8)
  }\<close>

definition P_0x86d9_39_regions :: state_pred where
  \<open>P_0x86d9_39_regions \<sigma> \<equiv> \<exists>regions. P_0x86d9_39_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x86e7_39 :: state_pred where
  \<open>Q_0x86e7_39 \<sigma> \<equiv> RIP \<sigma> = 0x86e7 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x78) \<and> RBP \<sigma> = RCX\<^sub>0 \<and> R14 \<sigma> = R8\<^sub>0 \<and> R9 \<sigma> = R9\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> regs \<sigma> ymm0w1 = ymm0w1\<^sub>0 \<and> regs \<sigma> ymm0w0 = ymm0w0\<^sub>0 \<and> regs \<sigma> ymm1w1 = ymm1w1\<^sub>0 \<and> regs \<sigma> ymm1w0 = ymm1w0\<^sub>0 \<and> regs \<sigma> ymm4w1 = ymm4w1\<^sub>0 \<and> regs \<sigma> ymm4w0 = ymm4w0\<^sub>0 \<and> regs \<sigma> ymm5w1 = ymm5w1\<^sub>0 \<and> regs \<sigma> ymm5w0 = ymm5w0\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word)\<close>
declare Q_0x86e7_39_def[Qs]

schematic_goal AES_cbc_encrypt_0_3_0x86d9_0x86e3_39[blocks]:
  assumes \<open>(P_0x86d9_39 && P_0x86d9_39_regions) \<sigma>\<close>
  shows \<open>exec_block 3 0x86e3 39 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x86e7_39 ?\<sigma> \<and> block_usage P_0x86d9_39_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x86d9_39_def P_0x86d9_39_regions_def post: Q_0x86e7_39_def regionset: P_0x86d9_39_regions_set_def)

definition P_0x86e7_40 :: state_pred where
  \<open>P_0x86e7_40 \<sigma> \<equiv> RIP \<sigma> = 0x86e7 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x78) \<and> RBP \<sigma> = RCX\<^sub>0 \<and> R14 \<sigma> = R8\<^sub>0 \<and> R9 \<sigma> = R9\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> regs \<sigma> ymm0w1 = ymm0w1\<^sub>0 \<and> regs \<sigma> ymm0w0 = ymm0w0\<^sub>0 \<and> regs \<sigma> ymm1w1 = ymm1w1\<^sub>0 \<and> regs \<sigma> ymm1w0 = ymm1w0\<^sub>0 \<and> regs \<sigma> ymm4w1 = ymm4w1\<^sub>0 \<and> regs \<sigma> ymm4w0 = ymm4w0\<^sub>0 \<and> regs \<sigma> ymm5w1 = ymm5w1\<^sub>0 \<and> regs \<sigma> ymm5w0 = ymm5w0\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word)\<close>
declare P_0x86e7_40_def[Ps]

definition P_0x86e7_40_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x86e7_40_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((FS\<^sub>0::64 word) + 0x28), 8),
    (2, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x40), 8)
  }\<close>

definition P_0x86e7_40_regions :: state_pred where
  \<open>P_0x86e7_40_regions \<sigma> \<equiv> \<exists>regions. P_0x86e7_40_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x86ea_40 :: state_pred where
  \<open>Q_0x86ea_40 \<sigma> \<equiv> RIP \<sigma> = 0x86ea \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x78) \<and> RBP \<sigma> = RCX\<^sub>0 \<and> R14 \<sigma> = R8\<^sub>0 \<and> R9 \<sigma> = R9\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> regs \<sigma> ymm0w1 = ymm0w1\<^sub>0 \<and> regs \<sigma> ymm0w0 = ymm0w0\<^sub>0 \<and> regs \<sigma> ymm1w1 = ymm1w1\<^sub>0 \<and> regs \<sigma> ymm1w0 = ymm1w0\<^sub>0 \<and> regs \<sigma> ymm4w1 = ymm4w1\<^sub>0 \<and> regs \<sigma> ymm4w0 = ymm4w0\<^sub>0 \<and> regs \<sigma> ymm5w1 = ymm5w1\<^sub>0 \<and> regs \<sigma> ymm5w0 = ymm5w0\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word)\<close>
declare Q_0x86ea_40_def[Qs]

schematic_goal AES_cbc_encrypt_0_1_0x86e7_0x86e7_40[blocks]:
  assumes \<open>(P_0x86e7_40 && P_0x86e7_40_regions) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x86e7 40 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x86ea_40 ?\<sigma> \<and> block_usage P_0x86e7_40_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x86e7_40_def P_0x86e7_40_regions_def post: Q_0x86ea_40_def regionset: P_0x86e7_40_regions_set_def)

definition P_0x86ea_true_41 :: state_pred where
  \<open>P_0x86ea_true_41 \<sigma> \<equiv> RIP \<sigma> = 0x86ea \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x78) \<and> RBP \<sigma> = RCX\<^sub>0 \<and> R14 \<sigma> = R8\<^sub>0 \<and> R9 \<sigma> = R9\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> regs \<sigma> ymm0w1 = ymm0w1\<^sub>0 \<and> regs \<sigma> ymm0w0 = ymm0w0\<^sub>0 \<and> regs \<sigma> ymm1w1 = ymm1w1\<^sub>0 \<and> regs \<sigma> ymm1w0 = ymm1w0\<^sub>0 \<and> regs \<sigma> ymm4w1 = ymm4w1\<^sub>0 \<and> regs \<sigma> ymm4w0 = ymm4w0\<^sub>0 \<and> regs \<sigma> ymm5w1 = ymm5w1\<^sub>0 \<and> regs \<sigma> ymm5w0 = ymm5w0\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word)\<close>
declare P_0x86ea_true_41_def[Ps]

definition P_0x86ea_true_41_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x86ea_true_41_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((FS\<^sub>0::64 word) + 0x28), 8),
    (2, (((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),8]::64 word)::64 word) + (ucast ((0x8::64 word))::64 word)), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x40), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x50), 8),
    (11, ((RSP\<^sub>0::64 word) - 0x58), 8),
    (12, ((RSP\<^sub>0::64 word) - 0x70), 8),
    (13, (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),8]::64 word), 8)
  }\<close>

definition P_0x86ea_true_41_regions :: state_pred where
  \<open>P_0x86ea_true_41_regions \<sigma> \<equiv> \<exists>regions. P_0x86ea_true_41_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x881d_41 :: state_pred where
  \<open>Q_0x881d_41 \<sigma> \<equiv> RIP \<sigma> = 0x881d \<and> RAX \<sigma> = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),8]::64 word) \<and> RDX \<sigma> = RCX\<^sub>0 \<and> RDI \<sigma> = ((RSP\<^sub>0::64 word) - 0x58) \<and> RSI \<sigma> = ((RSP\<^sub>0::64 word) - 0x58) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x78) \<and> RBP \<sigma> = RCX\<^sub>0 \<and> R14 \<sigma> = R8\<^sub>0 \<and> R13 \<sigma> = ((RSP\<^sub>0::64 word) - 0x58) \<and> R9 \<sigma> = R9\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> regs \<sigma> ymm0w1 = ymm0w1\<^sub>0 \<and> regs \<sigma> ymm0w0 = ymm0w0\<^sub>0 \<and> regs \<sigma> ymm1w1 = ymm1w1\<^sub>0 \<and> regs \<sigma> ymm1w0 = ymm1w0\<^sub>0 \<and> regs \<sigma> ymm4w1 = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),8]::64 word)::64 word) + (ucast ((0x8::64 word))::64 word)),8]::64 word) \<and> regs \<sigma> ymm4w0 = (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),8]::64 word),8]::64 word) \<and> regs \<sigma> ymm5w1 = ymm5w1\<^sub>0 \<and> regs \<sigma> ymm5w0 = ymm5w0\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((((RSP\<^sub>0::64 word) - 0x58)::64 word) + 0x8),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),8]::64 word)::64 word) + (ucast ((0x8::64 word))::64 word)),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),8]::64 word) = (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),8]::64 word),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),8]::64 word)::64 word) + 0x8),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),8]::64 word)::64 word) + (ucast ((0x8::64 word))::64 word)),8]::64 word) \<and> (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),8]::64 word),8]::64 word) = (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),8]::64 word),8]::64 word)\<close>
declare Q_0x881d_41_def[Qs]

schematic_goal AES_cbc_encrypt_0_8_0x86ea_0x8818_41[blocks]:
  assumes \<open>(P_0x86ea_true_41 && P_0x86ea_true_41_regions && !ZF) \<sigma>\<close>
  shows \<open>exec_block 8 0x8818 41 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x881d_41 ?\<sigma> \<and> block_usage P_0x86ea_true_41_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x86ea_true_41_def P_0x86ea_true_41_regions_def post: Q_0x881d_41_def regionset: P_0x86ea_true_41_regions_set_def)

definition P_0x881d_42 :: state_pred where
  \<open>P_0x881d_42 \<sigma> \<equiv> RIP \<sigma> = 0x881d \<and> RAX \<sigma> = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),8]::64 word) \<and> RDX \<sigma> = RCX\<^sub>0 \<and> RDI \<sigma> = ((RSP\<^sub>0::64 word) - 0x58) \<and> RSI \<sigma> = ((RSP\<^sub>0::64 word) - 0x58) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x78) \<and> RBP \<sigma> = RCX\<^sub>0 \<and> R14 \<sigma> = R8\<^sub>0 \<and> R13 \<sigma> = ((RSP\<^sub>0::64 word) - 0x58) \<and> R9 \<sigma> = R9\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> regs \<sigma> ymm0w1 = ymm0w1\<^sub>0 \<and> regs \<sigma> ymm0w0 = ymm0w0\<^sub>0 \<and> regs \<sigma> ymm1w1 = ymm1w1\<^sub>0 \<and> regs \<sigma> ymm1w0 = ymm1w0\<^sub>0 \<and> regs \<sigma> ymm4w1 = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),8]::64 word)::64 word) + (ucast ((0x8::64 word))::64 word)),8]::64 word) \<and> regs \<sigma> ymm4w0 = (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),8]::64 word),8]::64 word) \<and> regs \<sigma> ymm5w1 = ymm5w1\<^sub>0 \<and> regs \<sigma> ymm5w0 = ymm5w0\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((((RSP\<^sub>0::64 word) - 0x58)::64 word) + 0x8),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),8]::64 word)::64 word) + (ucast ((0x8::64 word))::64 word)),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),8]::64 word) = (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),8]::64 word),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),8]::64 word)::64 word) + 0x8),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),8]::64 word)::64 word) + (ucast ((0x8::64 word))::64 word)),8]::64 word) \<and> (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),8]::64 word),8]::64 word) = (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),8]::64 word),8]::64 word)\<close>
declare P_0x881d_42_def[Ps]

definition P_0x881d_42_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x881d_42_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((FS\<^sub>0::64 word) + 0x28), 8),
    (2, (((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),8]::64 word)::64 word) + (ucast ((0x8::64 word))::64 word)), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x40), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x50), 8),
    (11, ((RSP\<^sub>0::64 word) - 0x58), 8),
    (12, ((RSP\<^sub>0::64 word) - 0x70), 8),
    (13, ((RSP\<^sub>0::64 word) - 0x80), 8),
    (14, (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),8]::64 word), 8)
  }\<close>

definition P_0x881d_42_regions :: state_pred where
  \<open>P_0x881d_42_regions \<sigma> \<equiv> \<exists>regions. P_0x881d_42_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_AES_decrypt_addr_0x881d_42 :: state_pred where
  \<open>Q_AES_decrypt_addr_0x881d_42 \<sigma> \<equiv> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x80) \<and> RIP \<sigma> = AES_decrypt_addr \<and> RAX \<sigma> = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),8]::64 word) \<and> RDX \<sigma> = RCX\<^sub>0 \<and> RDI \<sigma> = ((RSP\<^sub>0::64 word) - 0x58) \<and> RSI \<sigma> = ((RSP\<^sub>0::64 word) - 0x58) \<and> RBP \<sigma> = RCX\<^sub>0 \<and> R14 \<sigma> = R8\<^sub>0 \<and> R13 \<sigma> = ((RSP\<^sub>0::64 word) - 0x58) \<and> R9 \<sigma> = R9\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> regs \<sigma> ymm0w1 = ymm0w1\<^sub>0 \<and> regs \<sigma> ymm0w0 = ymm0w0\<^sub>0 \<and> regs \<sigma> ymm1w1 = ymm1w1\<^sub>0 \<and> regs \<sigma> ymm1w0 = ymm1w0\<^sub>0 \<and> regs \<sigma> ymm4w1 = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),8]::64 word)::64 word) + (ucast ((0x8::64 word))::64 word)),8]::64 word) \<and> regs \<sigma> ymm4w0 = (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),8]::64 word),8]::64 word) \<and> regs \<sigma> ymm5w1 = ymm5w1\<^sub>0 \<and> regs \<sigma> ymm5w0 = ymm5w0\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((((RSP\<^sub>0::64 word) - 0x58)::64 word) + 0x8),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),8]::64 word)::64 word) + (ucast ((0x8::64 word))::64 word)),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),8]::64 word) = (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),8]::64 word),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x80),8]::64 word) = 0x8822 \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),8]::64 word)::64 word) + 0x8),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),8]::64 word)::64 word) + (ucast ((0x8::64 word))::64 word)),8]::64 word) \<and> (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),8]::64 word),8]::64 word) = (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),8]::64 word),8]::64 word)\<close>
declare Q_AES_decrypt_addr_0x881d_42_def[Qs]

schematic_goal AES_cbc_encrypt_0_1_0x881d_0x881d_42[blocks]:
  assumes \<open>(P_0x881d_42 && P_0x881d_42_regions) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x881d 42 \<sigma> \<triangleq> ?\<sigma> \<and> Q_AES_decrypt_addr_0x881d_42 ?\<sigma> \<and> block_usage P_0x881d_42_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x881d_42_def P_0x881d_42_regions_def post: Q_AES_decrypt_addr_0x881d_42_def regionset: P_0x881d_42_regions_set_def)

definition P_0x8822_43 :: state_pred where
  \<open>P_0x8822_43 \<sigma> \<equiv> RIP \<sigma> = 0x8822 \<and> RAX \<sigma> = AES_decrypt_0x881d_retval \<and> RDX \<sigma> = RCX\<^sub>0 \<and> RDI \<sigma> = ((RSP\<^sub>0::64 word) - 0x58) \<and> RSI \<sigma> = ((RSP\<^sub>0::64 word) - 0x58) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x78) \<and> RBP \<sigma> = RCX\<^sub>0 \<and> R14 \<sigma> = R8\<^sub>0 \<and> R13 \<sigma> = ((RSP\<^sub>0::64 word) - 0x58) \<and> R9 \<sigma> = R9\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> regs \<sigma> ymm0w1 = ymm0w1\<^sub>0 \<and> regs \<sigma> ymm0w0 = ymm0w0\<^sub>0 \<and> regs \<sigma> ymm1w1 = ymm1w1\<^sub>0 \<and> regs \<sigma> ymm1w0 = ymm1w0\<^sub>0 \<and> regs \<sigma> ymm4w1 = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),8]::64 word)::64 word) + (ucast ((0x8::64 word))::64 word)),8]::64 word) \<and> regs \<sigma> ymm4w0 = (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),8]::64 word),8]::64 word) \<and> regs \<sigma> ymm5w1 = ymm5w1\<^sub>0 \<and> regs \<sigma> ymm5w0 = ymm5w0\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((((RSP\<^sub>0::64 word) - 0x58)::64 word) + 0x8),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),8]::64 word)::64 word) + (ucast ((0x8::64 word))::64 word)),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),8]::64 word) = (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),8]::64 word),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x80),8]::64 word) = 0x8822 \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),8]::64 word)::64 word) + 0x8),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),8]::64 word)::64 word) + (ucast ((0x8::64 word))::64 word)),8]::64 word) \<and> (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),8]::64 word),8]::64 word) = (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),8]::64 word),8]::64 word)\<close>
declare P_0x8822_43_def[Ps]

definition P_0x8822_43_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x8822_43_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((FS\<^sub>0::64 word) + 0x28), 8),
    (2, (((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),8]::64 word)::64 word) + (ucast ((0x8::64 word))::64 word)), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x40), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x50), 8),
    (11, ((RSP\<^sub>0::64 word) - 0x58), 8),
    (12, ((RSP\<^sub>0::64 word) - 0x70), 8),
    (13, ((RSP\<^sub>0::64 word) - 0x80), 8),
    (14, (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),8]::64 word), 8)
  }\<close>

definition P_0x8822_43_regions :: state_pred where
  \<open>P_0x8822_43_regions \<sigma> \<equiv> \<exists>regions. P_0x8822_43_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x8828_43 :: state_pred where
  \<open>Q_0x8828_43 \<sigma> \<equiv> RIP \<sigma> = 0x8828 \<and> RDI \<sigma> = ((RSP\<^sub>0::64 word) - 0x58) \<and> RSI \<sigma> = ((RSP\<^sub>0::64 word) - 0x58) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x78) \<and> RBP \<sigma> = RCX\<^sub>0 \<and> R14 \<sigma> = R8\<^sub>0 \<and> R13 \<sigma> = ((RSP\<^sub>0::64 word) - 0x58) \<and> R9 \<sigma> = R9\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> regs \<sigma> ymm0w1 = ymm0w1\<^sub>0 \<and> regs \<sigma> ymm0w0 = ymm0w0\<^sub>0 \<and> regs \<sigma> ymm1w1 = ymm1w1\<^sub>0 \<and> regs \<sigma> ymm1w0 = ymm1w0\<^sub>0 \<and> regs \<sigma> ymm4w1 = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),8]::64 word)::64 word) + (ucast ((0x8::64 word))::64 word)),8]::64 word) \<and> regs \<sigma> ymm4w0 = (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),8]::64 word),8]::64 word) \<and> regs \<sigma> ymm5w1 = ymm5w1\<^sub>0 \<and> regs \<sigma> ymm5w0 = ymm5w0\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((((RSP\<^sub>0::64 word) - 0x58)::64 word) + 0x8),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),8]::64 word)::64 word) + (ucast ((0x8::64 word))::64 word)),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),8]::64 word) = (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),8]::64 word),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x80),8]::64 word) = 0x8822 \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),8]::64 word)::64 word) + 0x8),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),8]::64 word)::64 word) + (ucast ((0x8::64 word))::64 word)),8]::64 word) \<and> (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),8]::64 word),8]::64 word) = (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),8]::64 word),8]::64 word)\<close>
declare Q_0x8828_43_def[Qs]

schematic_goal AES_cbc_encrypt_0_2_0x8822_0x8824_43[blocks]:
  assumes \<open>(P_0x8822_43 && P_0x8822_43_regions) \<sigma>\<close>
  shows \<open>exec_block 2 0x8824 43 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x8828_43 ?\<sigma> \<and> block_usage P_0x8822_43_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x8822_43_def P_0x8822_43_regions_def post: Q_0x8828_43_def regionset: P_0x8822_43_regions_set_def)

definition P_0x8828_44 :: state_pred where
  \<open>P_0x8828_44 \<sigma> \<equiv> RIP \<sigma> = 0x8828 \<and> RDI \<sigma> = ((RSP\<^sub>0::64 word) - 0x58) \<and> RSI \<sigma> = ((RSP\<^sub>0::64 word) - 0x58) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x78) \<and> RBP \<sigma> = RCX\<^sub>0 \<and> R14 \<sigma> = R8\<^sub>0 \<and> R13 \<sigma> = ((RSP\<^sub>0::64 word) - 0x58) \<and> R9 \<sigma> = R9\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> regs \<sigma> ymm0w1 = ymm0w1\<^sub>0 \<and> regs \<sigma> ymm0w0 = ymm0w0\<^sub>0 \<and> regs \<sigma> ymm1w1 = ymm1w1\<^sub>0 \<and> regs \<sigma> ymm1w0 = ymm1w0\<^sub>0 \<and> regs \<sigma> ymm4w1 = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),8]::64 word)::64 word) + (ucast ((0x8::64 word))::64 word)),8]::64 word) \<and> regs \<sigma> ymm4w0 = (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),8]::64 word),8]::64 word) \<and> regs \<sigma> ymm5w1 = ymm5w1\<^sub>0 \<and> regs \<sigma> ymm5w0 = ymm5w0\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((((RSP\<^sub>0::64 word) - 0x58)::64 word) + 0x8),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),8]::64 word)::64 word) + (ucast ((0x8::64 word))::64 word)),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),8]::64 word) = (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),8]::64 word),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x80),8]::64 word) = 0x8822 \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),8]::64 word)::64 word) + 0x8),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),8]::64 word)::64 word) + (ucast ((0x8::64 word))::64 word)),8]::64 word) \<and> (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),8]::64 word),8]::64 word) = (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),8]::64 word),8]::64 word)\<close>
declare P_0x8828_44_def[Ps]

definition P_0x8828_44_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x8828_44_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((R12 \<sigma>::64 word) + (\<langle>63,0\<rangle>((RAX \<sigma>::64 word) * 0x1)::64 word)), Suc 0),
    (2, ((FS\<^sub>0::64 word) + 0x28), 8),
    (3, ((R8\<^sub>0::64 word) + (\<langle>63,0\<rangle>((RAX \<sigma>::64 word) * 0x1)::64 word)), Suc 0),
    (4, (((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),8]::64 word)::64 word) + (ucast ((0x8::64 word))::64 word)), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (11, ((RSP\<^sub>0::64 word) - 0x40), 8),
    (12, ((RSP\<^sub>0::64 word) - 0x50), 8),
    (13, ((RSP\<^sub>0::64 word) - 0x58), 8),
    (14, ((RSP\<^sub>0::64 word) - 0x70), 8),
    (15, ((RSP\<^sub>0::64 word) - 0x80), 8),
    (16, ((((RSP\<^sub>0::64 word) + (\<langle>63,0\<rangle>((RAX \<sigma>::64 word) * 0x1)::64 word))::64 word) - 0x58), Suc 0),
    (17, (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),8]::64 word), 8)
  }\<close>

definition P_0x8828_44_regions :: state_pred where
  \<open>P_0x8828_44_regions \<sigma> \<equiv> \<exists>regions. P_0x8828_44_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x883d_44 :: state_pred where
  \<open>Q_0x883d_44 \<sigma> \<equiv> RIP \<sigma> = 0x883d \<and> RDI \<sigma> = ((RSP\<^sub>0::64 word) - 0x58) \<and> RSI \<sigma> = ((RSP\<^sub>0::64 word) - 0x58) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x78) \<and> RBP \<sigma> = RCX\<^sub>0 \<and> R14 \<sigma> = R8\<^sub>0 \<and> R13 \<sigma> = ((RSP\<^sub>0::64 word) - 0x58) \<and> R9 \<sigma> = R9\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> regs \<sigma> ymm0w1 = ymm0w1\<^sub>0 \<and> regs \<sigma> ymm0w0 = ymm0w0\<^sub>0 \<and> regs \<sigma> ymm1w1 = ymm1w1\<^sub>0 \<and> regs \<sigma> ymm1w0 = ymm1w0\<^sub>0 \<and> regs \<sigma> ymm4w1 = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),8]::64 word)::64 word) + (ucast ((0x8::64 word))::64 word)),8]::64 word) \<and> regs \<sigma> ymm4w0 = (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),8]::64 word),8]::64 word) \<and> regs \<sigma> ymm5w1 = ymm5w1\<^sub>0 \<and> regs \<sigma> ymm5w0 = ymm5w0\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((((RSP\<^sub>0::64 word) - 0x58)::64 word) + 0x8),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),8]::64 word)::64 word) + (ucast ((0x8::64 word))::64 word)),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),8]::64 word) = (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),8]::64 word),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x80),8]::64 word) = 0x8822 \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),8]::64 word)::64 word) + 0x8),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),8]::64 word)::64 word) + (ucast ((0x8::64 word))::64 word)),8]::64 word) \<and> (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),8]::64 word),8]::64 word) = (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),8]::64 word),8]::64 word)\<close>
declare Q_0x883d_44_def[Qs]

schematic_goal AES_cbc_encrypt_0_5_0x8828_0x883a_44[blocks]:
  assumes \<open>(P_0x8828_44 && P_0x8828_44_regions) \<sigma>\<close>
  shows \<open>exec_block 5 0x883a 44 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x883d_44 ?\<sigma> \<and> block_usage P_0x8828_44_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x8828_44_def P_0x8828_44_regions_def post: Q_0x883d_44_def regionset: P_0x8828_44_regions_set_def)

definition P_0x883d_true_45 :: state_pred where
  \<open>P_0x883d_true_45 \<sigma> \<equiv> RIP \<sigma> = 0x883d \<and> RDI \<sigma> = ((RSP\<^sub>0::64 word) - 0x58) \<and> RSI \<sigma> = ((RSP\<^sub>0::64 word) - 0x58) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x78) \<and> RBP \<sigma> = RCX\<^sub>0 \<and> R14 \<sigma> = R8\<^sub>0 \<and> R13 \<sigma> = ((RSP\<^sub>0::64 word) - 0x58) \<and> R9 \<sigma> = R9\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> regs \<sigma> ymm0w1 = ymm0w1\<^sub>0 \<and> regs \<sigma> ymm0w0 = ymm0w0\<^sub>0 \<and> regs \<sigma> ymm1w1 = ymm1w1\<^sub>0 \<and> regs \<sigma> ymm1w0 = ymm1w0\<^sub>0 \<and> regs \<sigma> ymm4w1 = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),8]::64 word)::64 word) + (ucast ((0x8::64 word))::64 word)),8]::64 word) \<and> regs \<sigma> ymm4w0 = (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),8]::64 word),8]::64 word) \<and> regs \<sigma> ymm5w1 = ymm5w1\<^sub>0 \<and> regs \<sigma> ymm5w0 = ymm5w0\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((((RSP\<^sub>0::64 word) - 0x58)::64 word) + 0x8),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),8]::64 word)::64 word) + (ucast ((0x8::64 word))::64 word)),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),8]::64 word) = (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),8]::64 word),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x80),8]::64 word) = 0x8822 \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),8]::64 word)::64 word) + 0x8),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),8]::64 word)::64 word) + (ucast ((0x8::64 word))::64 word)),8]::64 word) \<and> (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),8]::64 word),8]::64 word) = (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),8]::64 word),8]::64 word)\<close>
declare P_0x883d_true_45_def[Ps]

definition P_0x883d_true_45_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x883d_true_45_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((FS\<^sub>0::64 word) + 0x28), 8),
    (2, (((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),8]::64 word)::64 word) + (ucast ((0x8::64 word))::64 word)), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x40), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x50), 8),
    (11, ((RSP\<^sub>0::64 word) - 0x58), 8),
    (12, ((RSP\<^sub>0::64 word) - 0x70), 8),
    (13, ((RSP\<^sub>0::64 word) - 0x80), 8),
    (14, (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),8]::64 word), 8)
  }\<close>

definition P_0x883d_true_45_regions :: state_pred where
  \<open>P_0x883d_true_45_regions \<sigma> \<equiv> \<exists>regions. P_0x883d_true_45_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x8828_45 :: state_pred where
  \<open>Q_0x8828_45 \<sigma> \<equiv> RIP \<sigma> = 0x8828 \<and> RDI \<sigma> = ((RSP\<^sub>0::64 word) - 0x58) \<and> RSI \<sigma> = ((RSP\<^sub>0::64 word) - 0x58) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x78) \<and> RBP \<sigma> = RCX\<^sub>0 \<and> R14 \<sigma> = R8\<^sub>0 \<and> R13 \<sigma> = ((RSP\<^sub>0::64 word) - 0x58) \<and> R9 \<sigma> = R9\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> regs \<sigma> ymm0w1 = ymm0w1\<^sub>0 \<and> regs \<sigma> ymm0w0 = ymm0w0\<^sub>0 \<and> regs \<sigma> ymm1w1 = ymm1w1\<^sub>0 \<and> regs \<sigma> ymm1w0 = ymm1w0\<^sub>0 \<and> regs \<sigma> ymm4w1 = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),8]::64 word)::64 word) + (ucast ((0x8::64 word))::64 word)),8]::64 word) \<and> regs \<sigma> ymm4w0 = (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),8]::64 word),8]::64 word) \<and> regs \<sigma> ymm5w1 = ymm5w1\<^sub>0 \<and> regs \<sigma> ymm5w0 = ymm5w0\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((((RSP\<^sub>0::64 word) - 0x58)::64 word) + 0x8),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),8]::64 word)::64 word) + (ucast ((0x8::64 word))::64 word)),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),8]::64 word) = (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),8]::64 word),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x80),8]::64 word) = 0x8822 \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),8]::64 word)::64 word) + 0x8),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),8]::64 word)::64 word) + (ucast ((0x8::64 word))::64 word)),8]::64 word) \<and> (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),8]::64 word),8]::64 word) = (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),8]::64 word),8]::64 word)\<close>
declare Q_0x8828_45_def[Qs]

schematic_goal AES_cbc_encrypt_0_1_0x883d_0x883d_45[blocks]:
  assumes \<open>(P_0x883d_true_45 && P_0x883d_true_45_regions && !ZF) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x883d 45 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x8828_45 ?\<sigma> \<and> block_usage P_0x883d_true_45_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x883d_true_45_def P_0x883d_true_45_regions_def post: Q_0x8828_45_def regionset: P_0x883d_true_45_regions_set_def)

definition P_0x883d_false_46 :: state_pred where
  \<open>P_0x883d_false_46 \<sigma> \<equiv> RIP \<sigma> = 0x883d \<and> RDI \<sigma> = ((RSP\<^sub>0::64 word) - 0x58) \<and> RSI \<sigma> = ((RSP\<^sub>0::64 word) - 0x58) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x78) \<and> RBP \<sigma> = RCX\<^sub>0 \<and> R14 \<sigma> = R8\<^sub>0 \<and> R13 \<sigma> = ((RSP\<^sub>0::64 word) - 0x58) \<and> R9 \<sigma> = R9\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> regs \<sigma> ymm0w1 = ymm0w1\<^sub>0 \<and> regs \<sigma> ymm0w0 = ymm0w0\<^sub>0 \<and> regs \<sigma> ymm1w1 = ymm1w1\<^sub>0 \<and> regs \<sigma> ymm1w0 = ymm1w0\<^sub>0 \<and> regs \<sigma> ymm4w1 = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),8]::64 word)::64 word) + (ucast ((0x8::64 word))::64 word)),8]::64 word) \<and> regs \<sigma> ymm4w0 = (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),8]::64 word),8]::64 word) \<and> regs \<sigma> ymm5w1 = ymm5w1\<^sub>0 \<and> regs \<sigma> ymm5w0 = ymm5w0\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((((RSP\<^sub>0::64 word) - 0x58)::64 word) + 0x8),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),8]::64 word)::64 word) + (ucast ((0x8::64 word))::64 word)),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),8]::64 word) = (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),8]::64 word),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x80),8]::64 word) = 0x8822 \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),8]::64 word)::64 word) + 0x8),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),8]::64 word)::64 word) + (ucast ((0x8::64 word))::64 word)),8]::64 word) \<and> (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),8]::64 word),8]::64 word) = (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),8]::64 word),8]::64 word)\<close>
declare P_0x883d_false_46_def[Ps]

definition P_0x883d_false_46_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x883d_false_46_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((FS\<^sub>0::64 word) + 0x28), 8),
    (2, (((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),8]::64 word)::64 word) + (ucast ((0x8::64 word))::64 word)), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x40), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x50), 8),
    (11, ((RSP\<^sub>0::64 word) - 0x58), 8),
    (12, ((RSP\<^sub>0::64 word) - 0x70), 8),
    (13, ((RSP\<^sub>0::64 word) - 0x80), 8),
    (14, (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),8]::64 word), 8)
  }\<close>

definition P_0x883d_false_46_regions :: state_pred where
  \<open>P_0x883d_false_46_regions \<sigma> \<equiv> \<exists>regions. P_0x883d_false_46_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x883f_46 :: state_pred where
  \<open>Q_0x883f_46 \<sigma> \<equiv> RIP \<sigma> = 0x883f \<and> RDI \<sigma> = ((RSP\<^sub>0::64 word) - 0x58) \<and> RSI \<sigma> = ((RSP\<^sub>0::64 word) - 0x58) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x78) \<and> RBP \<sigma> = RCX\<^sub>0 \<and> R14 \<sigma> = R8\<^sub>0 \<and> R13 \<sigma> = ((RSP\<^sub>0::64 word) - 0x58) \<and> R9 \<sigma> = R9\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> regs \<sigma> ymm0w1 = ymm0w1\<^sub>0 \<and> regs \<sigma> ymm0w0 = ymm0w0\<^sub>0 \<and> regs \<sigma> ymm1w1 = ymm1w1\<^sub>0 \<and> regs \<sigma> ymm1w0 = ymm1w0\<^sub>0 \<and> regs \<sigma> ymm4w1 = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),8]::64 word)::64 word) + (ucast ((0x8::64 word))::64 word)),8]::64 word) \<and> regs \<sigma> ymm4w0 = (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),8]::64 word),8]::64 word) \<and> regs \<sigma> ymm5w1 = ymm5w1\<^sub>0 \<and> regs \<sigma> ymm5w0 = ymm5w0\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((((RSP\<^sub>0::64 word) - 0x58)::64 word) + 0x8),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),8]::64 word)::64 word) + (ucast ((0x8::64 word))::64 word)),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),8]::64 word) = (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),8]::64 word),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x80),8]::64 word) = 0x8822 \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),8]::64 word)::64 word) + 0x8),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),8]::64 word)::64 word) + (ucast ((0x8::64 word))::64 word)),8]::64 word) \<and> (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),8]::64 word),8]::64 word) = (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),8]::64 word),8]::64 word)\<close>
declare Q_0x883f_46_def[Qs]

schematic_goal AES_cbc_encrypt_0_1_0x883d_0x883d_46[blocks]:
  assumes \<open>(P_0x883d_false_46 && P_0x883d_false_46_regions && ! !ZF) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x883d 46 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x883f_46 ?\<sigma> \<and> block_usage P_0x883d_false_46_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x883d_false_46_def P_0x883d_false_46_regions_def post: Q_0x883f_46_def regionset: P_0x883d_false_46_regions_set_def)

definition P_0x883f_47 :: state_pred where
  \<open>P_0x883f_47 \<sigma> \<equiv> RIP \<sigma> = 0x883f \<and> RDI \<sigma> = ((RSP\<^sub>0::64 word) - 0x58) \<and> RSI \<sigma> = ((RSP\<^sub>0::64 word) - 0x58) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x78) \<and> RBP \<sigma> = RCX\<^sub>0 \<and> R14 \<sigma> = R8\<^sub>0 \<and> R13 \<sigma> = ((RSP\<^sub>0::64 word) - 0x58) \<and> R9 \<sigma> = R9\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> regs \<sigma> ymm0w1 = ymm0w1\<^sub>0 \<and> regs \<sigma> ymm0w0 = ymm0w0\<^sub>0 \<and> regs \<sigma> ymm1w1 = ymm1w1\<^sub>0 \<and> regs \<sigma> ymm1w0 = ymm1w0\<^sub>0 \<and> regs \<sigma> ymm4w1 = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),8]::64 word)::64 word) + (ucast ((0x8::64 word))::64 word)),8]::64 word) \<and> regs \<sigma> ymm4w0 = (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),8]::64 word),8]::64 word) \<and> regs \<sigma> ymm5w1 = ymm5w1\<^sub>0 \<and> regs \<sigma> ymm5w0 = ymm5w0\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((((RSP\<^sub>0::64 word) - 0x58)::64 word) + 0x8),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),8]::64 word)::64 word) + (ucast ((0x8::64 word))::64 word)),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),8]::64 word) = (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),8]::64 word),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x80),8]::64 word) = 0x8822 \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),8]::64 word)::64 word) + 0x8),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),8]::64 word)::64 word) + (ucast ((0x8::64 word))::64 word)),8]::64 word) \<and> (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),8]::64 word),8]::64 word) = (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),8]::64 word),8]::64 word)\<close>
declare P_0x883f_47_def[Ps]

definition P_0x883f_47_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x883f_47_regions_set \<sigma> \<equiv> {
    (0, R8\<^sub>0, 8),
    (1, RSP\<^sub>0, 8),
    (2, ((FS\<^sub>0::64 word) + 0x28), 8),
    (3, ((R8\<^sub>0::64 word) + (ucast ((0x8::64 word))::64 word)), 8),
    (4, (((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),8]::64 word)::64 word) + (ucast ((0x8::64 word))::64 word)), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (11, ((RSP\<^sub>0::64 word) - 0x40), 8),
    (12, ((RSP\<^sub>0::64 word) - 0x50), 8),
    (13, ((RSP\<^sub>0::64 word) - 0x58), 8),
    (14, ((RSP\<^sub>0::64 word) - 0x70), 8),
    (15, ((RSP\<^sub>0::64 word) - 0x80), 8),
    (16, (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),8]::64 word), 8)
  }\<close>

definition P_0x883f_47_regions :: state_pred where
  \<open>P_0x883f_47_regions \<sigma> \<equiv> \<exists>regions. P_0x883f_47_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x86f0_47 :: state_pred where
  \<open>Q_0x86f0_47 \<sigma> \<equiv> RIP \<sigma> = 0x86f0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x78) \<and> RBP \<sigma> = RCX\<^sub>0 \<and> R14 \<sigma> = R8\<^sub>0 \<and> R9 \<sigma> = R9\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word)\<close>
declare Q_0x86f0_47_def[Qs]

schematic_goal AES_cbc_encrypt_0_3_0x883f_0x8849_47[blocks]:
  assumes \<open>(P_0x883f_47 && P_0x883f_47_regions) \<sigma>\<close>
  shows \<open>exec_block 3 0x8849 47 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x86f0_47 ?\<sigma> \<and> block_usage P_0x883f_47_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x883f_47_def P_0x883f_47_regions_def post: Q_0x86f0_47_def regionset: P_0x883f_47_regions_set_def)

definition P_0x86ea_false_48 :: state_pred where
  \<open>P_0x86ea_false_48 \<sigma> \<equiv> RIP \<sigma> = 0x86ea \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x78) \<and> RBP \<sigma> = RCX\<^sub>0 \<and> R14 \<sigma> = R8\<^sub>0 \<and> R9 \<sigma> = R9\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> regs \<sigma> ymm0w1 = ymm0w1\<^sub>0 \<and> regs \<sigma> ymm0w0 = ymm0w0\<^sub>0 \<and> regs \<sigma> ymm1w1 = ymm1w1\<^sub>0 \<and> regs \<sigma> ymm1w0 = ymm1w0\<^sub>0 \<and> regs \<sigma> ymm4w1 = ymm4w1\<^sub>0 \<and> regs \<sigma> ymm4w0 = ymm4w0\<^sub>0 \<and> regs \<sigma> ymm5w1 = ymm5w1\<^sub>0 \<and> regs \<sigma> ymm5w0 = ymm5w0\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word)\<close>
declare P_0x86ea_false_48_def[Ps]

definition P_0x86ea_false_48_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x86ea_false_48_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((FS\<^sub>0::64 word) + 0x28), 8),
    (2, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x40), 8)
  }\<close>

definition P_0x86ea_false_48_regions :: state_pred where
  \<open>P_0x86ea_false_48_regions \<sigma> \<equiv> \<exists>regions. P_0x86ea_false_48_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x86f0_48 :: state_pred where
  \<open>Q_0x86f0_48 \<sigma> \<equiv> RIP \<sigma> = 0x86f0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x78) \<and> RBP \<sigma> = RCX\<^sub>0 \<and> R14 \<sigma> = R8\<^sub>0 \<and> R9 \<sigma> = R9\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word)\<close>
declare Q_0x86f0_48_def[Qs]

schematic_goal AES_cbc_encrypt_0_1_0x86ea_0x86ea_48[blocks]:
  assumes \<open>(P_0x86ea_false_48 && P_0x86ea_false_48_regions && ! !ZF) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x86ea 48 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x86f0_48 ?\<sigma> \<and> block_usage P_0x86ea_false_48_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x86ea_false_48_def P_0x86ea_false_48_regions_def post: Q_0x86f0_48_def regionset: P_0x86ea_false_48_regions_set_def)

definition P_0x86f0_49 :: state_pred where
  \<open>P_0x86f0_49 \<sigma> \<equiv> RIP \<sigma> = 0x86f0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x78) \<and> RBP \<sigma> = RCX\<^sub>0 \<and> R14 \<sigma> = R8\<^sub>0 \<and> R9 \<sigma> = R9\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word)\<close>
declare P_0x86f0_49_def[Ps]

definition P_0x86f0_49_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x86f0_49_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((FS\<^sub>0::64 word) + 0x28), 8),
    (2, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x40), 8)
  }\<close>

definition P_0x86f0_49_regions :: state_pred where
  \<open>P_0x86f0_49_regions \<sigma> \<equiv> \<exists>regions. P_0x86f0_49_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x86fe_49 :: state_pred where
  \<open>Q_0x86fe_49 \<sigma> \<equiv> RIP \<sigma> = 0x86fe \<and> RAX \<sigma> = 0x0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x78) \<and> RBP \<sigma> = RCX\<^sub>0 \<and> R14 \<sigma> = R8\<^sub>0 \<and> R9 \<sigma> = R9\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word)\<close>
declare Q_0x86fe_49_def[Qs]

schematic_goal AES_cbc_encrypt_0_2_0x86f0_0x86f5_49[blocks]:
  assumes \<open>(P_0x86f0_49 && P_0x86f0_49_regions) \<sigma>\<close>
  shows \<open>exec_block 2 0x86f5 49 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x86fe_49 ?\<sigma> \<and> block_usage P_0x86f0_49_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x86f0_49_def P_0x86f0_49_regions_def post: Q_0x86fe_49_def regionset: P_0x86f0_49_regions_set_def)

definition P_0x86fe_true_50 :: state_pred where
  \<open>P_0x86fe_true_50 \<sigma> \<equiv> RIP \<sigma> = 0x86fe \<and> RAX \<sigma> = 0x0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x78) \<and> RBP \<sigma> = RCX\<^sub>0 \<and> R14 \<sigma> = R8\<^sub>0 \<and> R9 \<sigma> = R9\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word)\<close>
declare P_0x86fe_true_50_def[Ps]

definition P_0x86fe_true_50_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x86fe_true_50_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((FS\<^sub>0::64 word) + 0x28), 8),
    (2, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x40), 8)
  }\<close>

definition P_0x86fe_true_50_regions :: state_pred where
  \<open>P_0x86fe_true_50_regions \<sigma> \<equiv> \<exists>regions. P_0x86fe_true_50_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x8858_50 :: state_pred where
  \<open>Q_0x8858_50 \<sigma> \<equiv> RIP \<sigma> = 0x8858 \<and> RAX \<sigma> = 0x0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x78) \<and> RBP \<sigma> = RCX\<^sub>0 \<and> R14 \<sigma> = R8\<^sub>0 \<and> R9 \<sigma> = R9\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word)\<close>
declare Q_0x8858_50_def[Qs]

schematic_goal AES_cbc_encrypt_0_1_0x86fe_0x86fe_50[blocks]:
  assumes \<open>(P_0x86fe_true_50 && P_0x86fe_true_50_regions && !ZF) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x86fe 50 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x8858_50 ?\<sigma> \<and> block_usage P_0x86fe_true_50_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x86fe_true_50_def P_0x86fe_true_50_regions_def post: Q_0x8858_50_def regionset: P_0x86fe_true_50_regions_set_def)

definition P_0x8858_51 :: state_pred where
  \<open>P_0x8858_51 \<sigma> \<equiv> RIP \<sigma> = 0x8858 \<and> RAX \<sigma> = 0x0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x78) \<and> RBP \<sigma> = RCX\<^sub>0 \<and> R14 \<sigma> = R8\<^sub>0 \<and> R9 \<sigma> = R9\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word)\<close>
declare P_0x8858_51_def[Ps]

definition P_0x8858_51_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x8858_51_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((FS\<^sub>0::64 word) + 0x28), 8),
    (2, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x40), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x80), 8)
  }\<close>

definition P_0x8858_51_regions :: state_pred where
  \<open>P_0x8858_51_regions \<sigma> \<equiv> \<exists>regions. P_0x8858_51_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_stack_chk_fail_addr_0x8858_51 :: state_pred where
  \<open>Q_stack_chk_fail_addr_0x8858_51 \<sigma> \<equiv> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x80) \<and> RIP \<sigma> = stack_chk_fail_addr \<and> RAX \<sigma> = 0x0 \<and> R9 \<sigma> = R9\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word)\<close>
declare Q_stack_chk_fail_addr_0x8858_51_def[Qs]

schematic_goal AES_cbc_encrypt_0_1_0x8858_0x8858_51[blocks]:
  assumes \<open>(P_0x8858_51 && P_0x8858_51_regions) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x8858 51 \<sigma> \<triangleq> ?\<sigma> \<and> Q_stack_chk_fail_addr_0x8858_51 ?\<sigma> \<and> block_usage P_0x8858_51_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x8858_51_def P_0x8858_51_regions_def post: Q_stack_chk_fail_addr_0x8858_51_def regionset: P_0x8858_51_regions_set_def)

definition P_0x86fe_false_52 :: state_pred where
  \<open>P_0x86fe_false_52 \<sigma> \<equiv> RIP \<sigma> = 0x86fe \<and> RAX \<sigma> = 0x0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x78) \<and> RBP \<sigma> = RCX\<^sub>0 \<and> R14 \<sigma> = R8\<^sub>0 \<and> R9 \<sigma> = R9\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word)\<close>
declare P_0x86fe_false_52_def[Ps]

definition P_0x86fe_false_52_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x86fe_false_52_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((FS\<^sub>0::64 word) + 0x28), 8),
    (2, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x40), 8)
  }\<close>

definition P_0x86fe_false_52_regions :: state_pred where
  \<open>P_0x86fe_false_52_regions \<sigma> \<equiv> \<exists>regions. P_0x86fe_false_52_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_ret_address_52 :: state_pred where
  \<open>Q_ret_address_52 \<sigma> \<equiv> RIP \<sigma> = ret_address \<and> R9 \<sigma> = R9\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word)\<close>
declare Q_ret_address_52_def[Qs]

schematic_goal AES_cbc_encrypt_0_9_0x86fe_0x8712_52[blocks]:
  assumes \<open>(P_0x86fe_false_52 && P_0x86fe_false_52_regions && ! !ZF) \<sigma>\<close>
  shows \<open>exec_block 9 0x8712 52 \<sigma> \<triangleq> ?\<sigma> \<and> Q_ret_address_52 ?\<sigma> \<and> block_usage P_0x86fe_false_52_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x86fe_false_52_def P_0x86fe_false_52_regions_def post: Q_ret_address_52_def regionset: P_0x86fe_false_52_regions_set_def)

definition AES_cbc_encrypt_acode :: ACode where
  \<open>AES_cbc_encrypt_acode =
    Block 16 0x865f 0;
    IF !ZF THEN
      Block 2 0x8713 (Suc 0);
      IF jbe THEN
        Block 3 0x8853 2
      ELSE
        Block 9 0x873b 3;
        WHILE P_0x8740_4 DO
          Block 2 0x8742 4;
          WHILE P_0x8748_5 DO
            Block 5 0x875a 5;
            IF !ZF THEN
              Block (Suc 0) 0x875e 6
            ELSE
              Block (Suc 0) 0x875e 7
            FI
          OD;
          Block 4 0x8769 8;
          Block (Suc 0) 0x876d 9;
          CALL AES_encrypt_acode;
          Block 4 0x877e 10;
          IF !ZF THEN
            Block (Suc 0) 0x8783 11
          ELSE
            Block (Suc 0) 0x8783 12
          FI
        OD;
        Block 3 0x878f 13
      FI;
      Block (Suc 0) 0x8793 14;
      IF ZF THEN
        Block (Suc 0) 0x8796 15
      ELSE
        Block 4 0x87a3 16;
        WHILE P_0x87a8_17 DO
          Block 6 0x87be 17;
          IF !ZF THEN
            Block (Suc 0) 0x87c1 18
          ELSE
            Block (Suc 0) 0x87c1 19
          FI
        OD;
        Block (Suc 0) 0x87c3 20;
        WHILE P_0x87c8_21 DO
          Block 4 0x87d6 21;
          IF !ZF THEN
            Block (Suc 0) 0x87da 22
          ELSE
            Block (Suc 0) 0x87da 23
          FI
        OD;
        Block 3 0x87e2 24;
        Block (Suc 0) 0x87e5 25;
        CALL AES_encrypt_acode;
        Block 5 0x87fc 26
      FI
    ELSE
      Block 3 0x866b 27;
      IF jbe THEN
        Block (Suc 0) 0x866f 28
      ELSE
        Block 8 0x868b 29;
        WHILE P_0x8690_30 DO
          Block 5 0x869f 30;
          Block (Suc 0) 0x86a4 31;
          CALL AES_decrypt_acode;
          Block 2 0x86ab 32;
          WHILE P_0x86b0_33 DO
            Block 4 0x86bc 33;
            IF !ZF THEN
              Block (Suc 0) 0x86c0 34
            ELSE
              Block (Suc 0) 0x86c0 35
            FI
          OD;
          Block 5 0x86d4 36;
          IF !ZF THEN
            Block (Suc 0) 0x86d7 37
          ELSE
            Block (Suc 0) 0x86d7 38
          FI
        OD;
        Block 3 0x86e3 39
      FI;
      Block (Suc 0) 0x86e7 40;
      IF !ZF THEN
        Block 8 0x8818 41;
        Block (Suc 0) 0x881d 42;
        CALL AES_decrypt_acode;
        Block 2 0x8824 43;
        WHILE P_0x8828_44 DO
          Block 5 0x883a 44;
          IF !ZF THEN
            Block (Suc 0) 0x883d 45
          ELSE
            Block (Suc 0) 0x883d 46
          FI
        OD;
        Block 3 0x8849 47
      ELSE
        Block (Suc 0) 0x86ea 48
      FI
    FI;
    Block 2 0x86f5 49;
    IF !ZF THEN
      Block (Suc 0) 0x86fe 50;
      Block (Suc 0) 0x8858 51;
      CALL stack_chk_fail_acode
    ELSE
      Block 9 0x8712 52
    FI
  \<close>

schematic_goal "AES_cbc_encrypt":
  assumes
    \<open>\<forall>\<sigma>. RIP \<sigma> = 0x8662 \<longrightarrow> P_0x8662_true_1_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x8717 \<longrightarrow> P_0x8717_true_2_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x8717 \<longrightarrow> P_0x8717_false_3_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x8740 \<longrightarrow> P_0x8740_4_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x8748 \<longrightarrow> P_0x8748_5_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x875e \<longrightarrow> P_0x875e_true_6_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x875e \<longrightarrow> P_0x875e_false_7_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x8760 \<longrightarrow> P_0x8760_8_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x876d \<longrightarrow> P_0x876d_9_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x8772 \<longrightarrow> P_0x8772_10_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x8783 \<longrightarrow> P_0x8783_true_11_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x8783 \<longrightarrow> P_0x8783_false_12_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x8785 \<longrightarrow> P_0x8785_13_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x8793 \<longrightarrow> P_0x8793_14_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x8796 \<longrightarrow> P_0x8796_true_15_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x8796 \<longrightarrow> P_0x8796_false_16_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x87a8 \<longrightarrow> P_0x87a8_17_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x87c1 \<longrightarrow> P_0x87c1_true_18_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x87c1 \<longrightarrow> P_0x87c1_false_19_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x87c3 \<longrightarrow> P_0x87c3_20_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x87c8 \<longrightarrow> P_0x87c8_21_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x87da \<longrightarrow> P_0x87da_true_22_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x87da \<longrightarrow> P_0x87da_false_23_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x87dc \<longrightarrow> P_0x87dc_24_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x87e5 \<longrightarrow> P_0x87e5_25_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x87ea \<longrightarrow> P_0x87ea_26_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x8662 \<longrightarrow> P_0x8662_false_27_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x866f \<longrightarrow> P_0x866f_true_28_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x866f \<longrightarrow> P_0x866f_false_29_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x8690 \<longrightarrow> P_0x8690_30_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x86a4 \<longrightarrow> P_0x86a4_31_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x86a9 \<longrightarrow> P_0x86a9_32_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x86b0 \<longrightarrow> P_0x86b0_33_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x86c0 \<longrightarrow> P_0x86c0_true_34_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x86c0 \<longrightarrow> P_0x86c0_false_35_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x86c2 \<longrightarrow> P_0x86c2_36_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x86d7 \<longrightarrow> P_0x86d7_true_37_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x86d7 \<longrightarrow> P_0x86d7_false_38_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x86d9 \<longrightarrow> P_0x86d9_39_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x86e7 \<longrightarrow> P_0x86e7_40_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x86ea \<longrightarrow> P_0x86ea_true_41_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x881d \<longrightarrow> P_0x881d_42_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x8822 \<longrightarrow> P_0x8822_43_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x8828 \<longrightarrow> P_0x8828_44_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x883d \<longrightarrow> P_0x883d_true_45_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x883d \<longrightarrow> P_0x883d_false_46_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x883f \<longrightarrow> P_0x883f_47_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x86ea \<longrightarrow> P_0x86ea_false_48_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x86f0 \<longrightarrow> P_0x86f0_49_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x86fe \<longrightarrow> P_0x86fe_true_50_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x8858 \<longrightarrow> P_0x8858_51_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x86fe \<longrightarrow> P_0x86fe_false_52_regions \<sigma>\<close>
    and [blocks]: \<open>{{Q_AES_encrypt_addr_0x876d_9}} \<box>AES_encrypt_acode {{P_0x8772_10;M_0x876d}}\<close>
    and [blocks]: \<open>{{Q_AES_encrypt_addr_0x87e5_25}} \<box>AES_encrypt_acode {{P_0x87ea_26;M_0x87e5}}\<close>
    and [blocks]: \<open>{{Q_AES_decrypt_addr_0x86a4_31}} \<box>AES_decrypt_acode {{P_0x86a9_32;M_0x86a4}}\<close>
    and [blocks]: \<open>{{Q_AES_decrypt_addr_0x881d_42}} \<box>AES_decrypt_acode {{P_0x8822_43;M_0x881d}}\<close>
    and [blocks]: \<open>{{Q_stack_chk_fail_addr_0x8858_51}} \<box>stack_chk_fail_acode {{Q_fail;M_0x8858}}\<close>
  shows \<open>{{?P}} AES_cbc_encrypt_acode {{?Q;?M}}\<close>
  apply (vcg acode: AES_cbc_encrypt_acode_def assms: assms)
              apply (vcg_while \<open>P_0x8740_4 || P_0x8785_13\<close> assms: assms)
                 apply (vcg_step assms: assms)
                  apply (vcg_while \<open>P_0x8748_5 || P_0x8760_8\<close> assms: assms)
                     apply (vcg_step assms: assms)+
                    apply (simp add: pred_logic Ps Qs)
                   apply (vcg_step assms: assms)
                      apply (simp add: assms)
                     apply simp
                    apply (vcg_step assms: assms)+
                apply (simp add: pred_logic Ps Qs)
               apply (vcg_step assms: assms)
                apply (simp add: assms)
               apply simp+
          apply (vcg_step assms: assms)+
              apply (vcg_while \<open>P_0x87a8_17 || P_0x87c3_20\<close> assms: assms)
                 apply (vcg_step assms: assms)+
                apply (simp add: pred_logic Ps Qs)
               apply (vcg_step assms: assms)
                  apply (simp add: assms)
                 apply simp
                apply (vcg_while \<open>P_0x87c8_21 || P_0x87dc_24\<close> assms: assms)
                   apply (vcg_step assms: assms)+
                  apply (simp add: pred_logic Ps Qs)
                 apply (vcg_step assms: assms)
                    apply (simp add: assms)
                   apply simp
                  apply (vcg_step assms: assms)+
             apply (vcg_while \<open>P_0x8690_30 || P_0x86d9_39\<close> assms: assms)
                apply (vcg_step assms: assms)+
                    apply (vcg_while \<open>P_0x86b0_33 || P_0x86c2_36\<close> assms: assms)
                      apply (vcg_step assms: assms)+
                      apply (simp add: pred_logic Ps Qs)
                     apply (vcg_step assms: assms)
                      apply (simp add: assms)
                      apply simp
                      apply (vcg_step assms: assms)+
               apply (simp add: pred_logic Ps Qs)
              apply (vcg_step assms: assms)
               apply (simp add: assms)
              apply simp+
         apply (vcg_step assms: assms)+
                 apply (vcg_while \<open>P_0x8828_44 || P_0x883f_47\<close> assms: assms)
                    apply (vcg_step assms: assms)+
                   apply (simp add: pred_logic Ps Qs)
                  apply (vcg_step assms: assms)
                   apply (simp add: assms)
                  apply simp+
            apply (vcg_step assms: assms)+
  done

end

end
