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
theory raw_pread
  imports "../../../isabelle/VCG/HTriple"
begin

locale "qemu_img_xen" = execution_context + exec_code +
  fixes raw_pread_aligned_0x1b66f_retval\<^sub>v raw_pread_aligned_0x1b702_retval\<^sub>v rep_movs_ESRDI_DSRSI_0x1b75c_retval\<^sub>v raw_pread_aligned_0x1b7b7_retval\<^sub>v memcpy_0x1b7df_retval\<^sub>v rep_movs_ESRDI_DSRSI_0x1b887_retval\<^sub>v memcpy_addr raw_pread_aligned_addr rep_movs_ESRDI_DSRSI_addr :: \<open>64 word\<close>
    and memcpy_acode raw_pread_aligned_acode rep_movs_ESRDI_DSRSI_acode :: ACode
  assumes fetch:
    "fetch 0x1b610 \<equiv> (Unary (IS_8088 Push) (Storage (Reg (General SixtyFour r15))), 2)"
    "fetch 0x1b612 \<equiv> (Binary (IS_8088 Mov) (Reg (General ThirtyTwo r15)) (Storage (Reg (General ThirtyTwo rcx))), 3)"
    "fetch 0x1b615 \<equiv> (Unary (IS_8088 Push) (Storage (Reg (General SixtyFour r14))), 2)"
    "fetch 0x1b617 \<equiv> (Unary (IS_8088 Push) (Storage (Reg (General SixtyFour r13))), 2)"
    "fetch 0x1b619 \<equiv> (Unary (IS_8088 Push) (Storage (Reg (General SixtyFour r12))), 2)"
    "fetch 0x1b61b \<equiv> (Unary (IS_8088 Push) (Storage (Reg (General SixtyFour rbp))), 1)"
    "fetch 0x1b61c \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour rbp)) (Storage (Reg (General SixtyFour rdx))), 3)"
    "fetch 0x1b61f \<equiv> (Unary (IS_8088 Push) (Storage (Reg (General SixtyFour rbx))), 1)"
    "fetch 0x1b620 \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour rbx)) (Storage (Reg (General SixtyFour rsi))), 3)"
    "fetch 0x1b623 \<equiv> (Binary (IS_8088 Sub) (Reg (General SixtyFour rsp)) (Immediate SixtyFour (ImmVal 24)), 4)"
    "fetch 0x1b627 \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour r13)) (Storage (Memory SixtyFour (A_SizeDirective 64 (A_Plus (A_FromReg (General SixtyFour rdi)) (A_WordConstant 64))))), 4)"
    "fetch 0x1b62b \<equiv> (Binary (IS_8088 Mov) (Memory SixtyFour (A_SizeDirective 64 (A_Plus (A_FromReg (General SixtyFour rsp)) (A_WordConstant 8)))) (Storage (Reg (General SixtyFour rdi))), 5)"
    "fetch 0x1b630 \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour rdx)) (Storage (Memory SixtyFour (A_SizeDirective 64 (A_Plus (A_FromReg (General SixtyFour r13)) (A_WordConstant 40))))), 4)"
    "fetch 0x1b634 \<equiv> (Binary (IS_8088 Test) (Reg (General SixtyFour rdx)) (Storage (Reg (General SixtyFour rdx))), 3)"
    "fetch 0x1b637 \<equiv> (Unary (IS_8088 Je) (Immediate SixtyFour (ImmVal 112728)), 6)"
    "fetch 0x1b63d \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour r12)) (Storage (Reg (General SixtyFour rsi))), 3)"
    "fetch 0x1b640 \<equiv> (Binary (IS_8088 And) (Reg (General ThirtyTwo r12)) (Immediate SixtyFour (ImmVal 511)), 7)"
    "fetch 0x1b647 \<equiv> (Unary (IS_8088 Je) (Immediate SixtyFour (ImmVal 112344)), 6)"
    "fetch 0x1b64d \<equiv> (Binary (IS_8088 Lea) (Reg (General ThirtyTwo rcx)) (Storage (Memory SixtyFour (A_Plus (A_FromReg (General SixtyFour rcx)) (A_Plus (A_Mult 1 (A_FromReg (General SixtyFour r12))) (A_WordConstant 511))))), 8)"
    "fetch 0x1b655 \<equiv> (Binary (IS_8088 Mov) (Reg (General ThirtyTwo rax)) (Immediate SixtyFour (ImmVal 16384)), 5)"
    "fetch 0x1b65a \<equiv> (Binary (IS_X86_64 Movsxd) (Reg (General SixtyFour r14)) (Storage (Reg (General ThirtyTwo r12))), 3)"
    "fetch 0x1b65d \<equiv> (Binary (IS_8088 And) (Reg (General ThirtyTwo rcx)) (Immediate SixtyFour (ImmVal 4294966784)), 6)"
    "fetch 0x1b663 \<equiv> (Binary (IS_8088 Cmp) (Reg (General ThirtyTwo rcx)) (Immediate SixtyFour (ImmVal 16384)), 6)"
    "fetch 0x1b669 \<equiv> (Binary (IS_PentiumPro Cmovg) (Reg (General ThirtyTwo rcx)) (Storage (Reg (General ThirtyTwo rax))), 3)"
    "fetch 0x1b66c \<equiv> (Binary (IS_8088 Sub) (Reg (General SixtyFour rsi)) (Storage (Reg (General SixtyFour r14))), 3)"
    "fetch 0x1b66f \<equiv> (Unary (IS_8088 Call) (Immediate SixtyFour (ImmLabel ''raw_pread_aligned'')), 5)"
    "fetch 0x1b674 \<equiv> (Binary (IS_8088 Test) (Reg (General ThirtyTwo rax)) (Storage (Reg (General ThirtyTwo rax))), 2)"
    "fetch 0x1b676 \<equiv> (Unary (IS_8088 Js) (Immediate SixtyFour (ImmVal 112394)), 6)"
    "fetch 0x1b67c \<equiv> (Binary (IS_8088 Mov) (Reg (General ThirtyTwo rax)) (Immediate SixtyFour (ImmVal 512)), 5)"
    "fetch 0x1b681 \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour rsi)) (Storage (Memory SixtyFour (A_SizeDirective 64 (A_Plus (A_FromReg (General SixtyFour r13)) (A_WordConstant 40))))), 4)"
    "fetch 0x1b685 \<equiv> (Binary (IS_8088 Sub) (Reg (General ThirtyTwo rax)) (Storage (Reg (General ThirtyTwo r12))), 3)"
    "fetch 0x1b688 \<equiv> (Binary (IS_8088 Mov) (Reg (General ThirtyTwo r12)) (Storage (Reg (General ThirtyTwo rax))), 3)"
    "fetch 0x1b68b \<equiv> (Binary (IS_8088 Add) (Reg (General SixtyFour rsi)) (Storage (Reg (General SixtyFour r14))), 3)"
    "fetch 0x1b68e \<equiv> (Binary (IS_8088 Cmp) (Reg (General ThirtyTwo r15)) (Storage (Reg (General ThirtyTwo rax))), 3)"
    "fetch 0x1b691 \<equiv> (Unary (IS_8088 Jge) (Immediate SixtyFour (ImmVal 112416)), 6)"
    "fetch 0x1b697 \<equiv> (Binary (IS_X86_64 Movsxd) (Reg (General SixtyFour rax)) (Storage (Reg (General ThirtyTwo r15))), 3)"
    "fetch 0x1b69a \<equiv> (Binary (IS_8088 Cmp) (Reg (General SixtyFour rax)) (Immediate SixtyFour (ImmVal 8)), 4)"
    "fetch 0x1b69e \<equiv> (Unary (IS_8088 Jae) (Immediate SixtyFour (ImmVal 112736)), 6)"
    "fetch 0x1b6a4 \<equiv> (Binary (IS_8088 Test) (Reg (General Eight rax)) (Immediate SixtyFour (ImmVal 4)), 2)"
    "fetch 0x1b6a6 \<equiv> (Unary (IS_8088 Jne) (Immediate SixtyFour (ImmVal 112796)), 6)"
    "fetch 0x1b6ac \<equiv> (Binary (IS_8088 Test) (Reg (General SixtyFour rax)) (Storage (Reg (General SixtyFour rax))), 3)"
    "fetch 0x1b6af \<equiv> (Unary (IS_8088 Je) (Immediate SixtyFour (ImmVal 112778)), 6)"
    "fetch 0x1b6b5 \<equiv> (Binary (IS_80386 Movzx) (Reg (General ThirtyTwo rdx)) (Storage (Memory Eight (A_SizeDirective 8 (A_FromReg (General SixtyFour rsi))))), 3)"
    "fetch 0x1b6b8 \<equiv> (Binary (IS_8088 Mov) (Memory Eight (A_SizeDirective 8 (A_Plus (A_FromReg (General SixtyFour rbp)) (A_WordConstant 0)))) (Storage (Reg (General Eight rdx))), 3)"
    "fetch 0x1b6bb \<equiv> (Binary (IS_8088 Test) (Reg (General Eight rax)) (Immediate SixtyFour (ImmVal 2)), 2)"
    "fetch 0x1b6bd \<equiv> (Unary (IS_8088 Je) (Immediate SixtyFour (ImmVal 112778)), 6)"
    "fetch 0x1b6c3 \<equiv> (Binary (IS_80386 Movzx) (Reg (General ThirtyTwo rdx)) (Storage (Memory Sixteen (A_SizeDirective 16 (A_Plus (A_FromReg (General SixtyFour rsi)) (A_Minus (A_Mult 1 (A_FromReg (General SixtyFour rax))) (A_WordConstant 2)))))), 5)"
    "fetch 0x1b6c8 \<equiv> (Binary (IS_8088 Mov) (Memory Sixteen (A_SizeDirective 16 (A_Plus (A_FromReg (General SixtyFour rbp)) (A_Minus (A_Mult 1 (A_FromReg (General SixtyFour rax))) (A_WordConstant 2))))) (Storage (Reg (General Sixteen rdx))), 5)"
    "fetch 0x1b6cd \<equiv> (Unary (IS_8088 Jmp) (Immediate SixtyFour (ImmVal 112778)), 5)"
    "fetch 0x1b6d2 \<equiv> (Unary (IS_8088 Nop) (Storage (Memory Sixteen (A_SizeDirective 16 (A_Plus (A_FromReg (General SixtyFour rax)) (A_Plus (A_Mult 1 (A_FromReg (General SixtyFour rax))) (A_WordConstant 0)))))), 6)"
    "fetch 0x1b6d8 \<equiv> (Binary (IS_8088 Mov) (Reg (General ThirtyTwo r12)) (Storage (Reg (General ThirtyTwo rcx))), 3)"
    "fetch 0x1b6db \<equiv> (Binary (IS_8088 And) (Reg (General ThirtyTwo r12)) (Immediate SixtyFour (ImmVal 511)), 7)"
    "fetch 0x1b6e2 \<equiv> (Unary (IS_8088 Jne) (Immediate SixtyFour (ImmVal 112520)), 6)"
    "fetch 0x1b6e8 \<equiv> (Binary (IS_8088 Test) (Reg (General ThirtyTwo rbp)) (Immediate SixtyFour (ImmVal 511)), 6)"
    "fetch 0x1b6ee \<equiv> (Unary (IS_8088 Jne) (Immediate SixtyFour (ImmVal 112656)), 6)"
    "fetch 0x1b6f4 \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour rdi)) (Storage (Memory SixtyFour (A_SizeDirective 64 (A_Plus (A_FromReg (General SixtyFour rsp)) (A_WordConstant 8))))), 5)"
    "fetch 0x1b6f9 \<equiv> (Binary (IS_8088 Mov) (Reg (General ThirtyTwo rcx)) (Storage (Reg (General ThirtyTwo r15))), 3)"
    "fetch 0x1b6fc \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour rdx)) (Storage (Reg (General SixtyFour rbp))), 3)"
    "fetch 0x1b6ff \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour rsi)) (Storage (Reg (General SixtyFour rbx))), 3)"
    "fetch 0x1b702 \<equiv> (Unary (IS_8088 Call) (Immediate SixtyFour (ImmLabel ''raw_pread_aligned'')), 5)"
    "fetch 0x1b707 \<equiv> (Binary (IS_8088 Add) (Reg (General ThirtyTwo rax)) (Storage (Reg (General ThirtyTwo r12))), 3)"
    "fetch 0x1b70a \<equiv> (Binary (IS_8088 Add) (Reg (General SixtyFour rsp)) (Immediate SixtyFour (ImmVal 24)), 4)"
    "fetch 0x1b70e \<equiv> (Unary (IS_8088 Pop) (Storage (Reg (General SixtyFour rbx))), 1)"
    "fetch 0x1b70f \<equiv> (Unary (IS_8088 Pop) (Storage (Reg (General SixtyFour rbp))), 1)"
    "fetch 0x1b710 \<equiv> (Unary (IS_8088 Pop) (Storage (Reg (General SixtyFour r12))), 2)"
    "fetch 0x1b712 \<equiv> (Unary (IS_8088 Pop) (Storage (Reg (General SixtyFour r13))), 2)"
    "fetch 0x1b714 \<equiv> (Unary (IS_8088 Pop) (Storage (Reg (General SixtyFour r14))), 2)"
    "fetch 0x1b716 \<equiv> (Unary (IS_8088 Pop) (Storage (Reg (General SixtyFour r15))), 2)"
    "fetch 0x1b718 \<equiv> (Nullary (IS_8088 Ret), 1)"
    "fetch 0x1b719 \<equiv> (Unary (IS_8088 Nop) (Storage (Memory ThirtyTwo (A_SizeDirective 32 (A_Plus (A_FromReg (General SixtyFour rax)) (A_WordConstant 0))))), 7)"
    "fetch 0x1b720 \<equiv> (Binary (IS_X86_64 Movsxd) (Reg (General SixtyFour rdx)) (Storage (Reg (General ThirtyTwo rax))), 3)"
    "fetch 0x1b723 \<equiv> (Binary (IS_8088 Cmp) (Reg (General ThirtyTwo rax)) (Immediate SixtyFour (ImmVal 8)), 3)"
    "fetch 0x1b726 \<equiv> (Unary (IS_8088 Jb) (Immediate SixtyFour (ImmVal 112672)), 6)"
    "fetch 0x1b72c \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour rax)) (Storage (Memory SixtyFour (A_SizeDirective 64 (A_FromReg (General SixtyFour rsi))))), 3)"
    "fetch 0x1b72f \<equiv> (Binary (IS_8088 Lea) (Reg (General SixtyFour rdi)) (Storage (Memory SixtyFour (A_Plus (A_FromReg (General SixtyFour rbp)) (A_WordConstant 8)))), 4)"
    "fetch 0x1b733 \<equiv> (Binary (IS_8088 And) (Reg (General SixtyFour rdi)) (Immediate SixtyFour (ImmVal 18446744073709551608)), 4)"
    "fetch 0x1b737 \<equiv> (Binary (IS_8088 Mov) (Memory SixtyFour (A_SizeDirective 64 (A_Plus (A_FromReg (General SixtyFour rbp)) (A_WordConstant 0)))) (Storage (Reg (General SixtyFour rax))), 4)"
    "fetch 0x1b73b \<equiv> (Binary (IS_8088 Mov) (Reg (General ThirtyTwo rax)) (Storage (Reg (General ThirtyTwo r12))), 3)"
    "fetch 0x1b73e \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour rcx)) (Storage (Memory SixtyFour (A_SizeDirective 64 (A_Plus (A_FromReg (General SixtyFour rsi)) (A_Minus (A_Mult 1 (A_FromReg (General SixtyFour rax))) (A_WordConstant 8)))))), 5)"
    "fetch 0x1b743 \<equiv> (Binary (IS_8088 Mov) (Memory SixtyFour (A_SizeDirective 64 (A_Plus (A_FromReg (General SixtyFour rbp)) (A_Minus (A_Mult 1 (A_FromReg (General SixtyFour rax))) (A_WordConstant 8))))) (Storage (Reg (General SixtyFour rcx))), 5)"
    "fetch 0x1b748 \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour rax)) (Storage (Reg (General SixtyFour rbp))), 3)"
    "fetch 0x1b74b \<equiv> (Binary (IS_8088 Sub) (Reg (General SixtyFour rax)) (Storage (Reg (General SixtyFour rdi))), 3)"
    "fetch 0x1b74e \<equiv> (Binary (IS_8088 Lea) (Reg (General ThirtyTwo rcx)) (Storage (Memory SixtyFour (A_Plus (A_FromReg (General SixtyFour r12)) (A_Mult 1 (A_FromReg (General SixtyFour rax)))))), 4)"
    "fetch 0x1b752 \<equiv> (Binary (IS_8088 Sub) (Reg (General SixtyFour rsi)) (Storage (Reg (General SixtyFour rax))), 3)"
    "fetch 0x1b755 \<equiv> (Binary (IS_8088 Mov) (Reg (General ThirtyTwo rax)) (Storage (Reg (General ThirtyTwo rcx))), 2)"
    "fetch 0x1b757 \<equiv> (Binary (IS_8088 Shr) (Reg (General ThirtyTwo rax)) (Immediate SixtyFour (ImmVal 3)), 3)"
    "fetch 0x1b75a \<equiv> (Binary (IS_8088 Mov) (Reg (General ThirtyTwo rcx)) (Storage (Reg (General ThirtyTwo rax))), 2)"
    "fetch 0x1b75c \<equiv> (Unary (IS_8088 Call) (Immediate SixtyFour (ImmLabel ''rep_movs_ESRDI_DSRSI'')), 3)"
    "fetch 0x1b75f \<equiv> (Binary (IS_8088 Add) (Reg (General SixtyFour rbp)) (Storage (Reg (General SixtyFour rdx))), 3)"
    "fetch 0x1b762 \<equiv> (Binary (IS_8088 Add) (Reg (General SixtyFour rbx)) (Storage (Reg (General SixtyFour rdx))), 3)"
    "fetch 0x1b765 \<equiv> (Binary (IS_8088 Sub) (Reg (General ThirtyTwo r15)) (Storage (Reg (General ThirtyTwo r12))), 3)"
    "fetch 0x1b768 \<equiv> (Unary (IS_8088 Je) (Immediate SixtyFour (ImmVal 112630)), 6)"
    "fetch 0x1b76e \<equiv> (Binary (IS_8088 Test) (Reg (General ThirtyTwo r15)) (Immediate SixtyFour (ImmVal 511)), 7)"
    "fetch 0x1b775 \<equiv> (Unary (IS_8088 Jne) (Immediate SixtyFour (ImmVal 112528)), 2)"
    "fetch 0x1b777 \<equiv> (Binary (IS_8088 Test) (Reg (General ThirtyTwo rbp)) (Immediate SixtyFour (ImmVal 511)), 6)"
    "fetch 0x1b77d \<equiv> (Unary (IS_8088 Jne) (Immediate SixtyFour (ImmVal 112528)), 2)"
    "fetch 0x1b77f \<equiv> (Unary (IS_8088 Jmp) (Immediate SixtyFour (ImmVal 112372)), 5)"
    "fetch 0x1b784 \<equiv> (Unary (IS_8088 Nop) (Storage (Memory ThirtyTwo (A_SizeDirective 32 (A_Plus (A_FromReg (General SixtyFour rax)) (A_WordConstant 0))))), 4)"
    "fetch 0x1b788 \<equiv> (Binary (IS_8088 Xor) (Reg (General ThirtyTwo r12)) (Storage (Reg (General ThirtyTwo r12))), 3)"
    "fetch 0x1b78b \<equiv> (Unary (IS_8088 Jmp) (Immediate SixtyFour (ImmVal 112532)), 2)"
    "fetch 0x1b78d \<equiv> (Unary (IS_8088 Nop) (Storage (Memory ThirtyTwo (A_SizeDirective 32 (A_FromReg (General SixtyFour rax))))), 3)"
    "fetch 0x1b790 \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour rdx)) (Storage (Memory SixtyFour (A_SizeDirective 64 (A_Plus (A_FromReg (General SixtyFour r13)) (A_WordConstant 40))))), 4)"
    "fetch 0x1b794 \<equiv> (Binary (IS_8088 Lea) (Reg (General ThirtyTwo rcx)) (Storage (Memory SixtyFour (A_Plus (A_FromReg (General SixtyFour r15)) (A_WordConstant 511)))), 7)"
    "fetch 0x1b79b \<equiv> (Binary (IS_8088 Mov) (Reg (General ThirtyTwo rax)) (Immediate SixtyFour (ImmVal 16384)), 5)"
    "fetch 0x1b7a0 \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour rdi)) (Storage (Memory SixtyFour (A_SizeDirective 64 (A_Plus (A_FromReg (General SixtyFour rsp)) (A_WordConstant 8))))), 5)"
    "fetch 0x1b7a5 \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour rsi)) (Storage (Reg (General SixtyFour rbx))), 3)"
    "fetch 0x1b7a8 \<equiv> (Binary (IS_8088 And) (Reg (General ThirtyTwo rcx)) (Immediate SixtyFour (ImmVal 4294966784)), 6)"
    "fetch 0x1b7ae \<equiv> (Binary (IS_8088 Cmp) (Reg (General ThirtyTwo rcx)) (Immediate SixtyFour (ImmVal 16384)), 6)"
    "fetch 0x1b7b4 \<equiv> (Binary (IS_PentiumPro Cmovg) (Reg (General ThirtyTwo rcx)) (Storage (Reg (General ThirtyTwo rax))), 3)"
    "fetch 0x1b7b7 \<equiv> (Unary (IS_8088 Call) (Immediate SixtyFour (ImmLabel ''raw_pread_aligned'')), 5)"
    "fetch 0x1b7bc \<equiv> (Binary (IS_8088 Test) (Reg (General ThirtyTwo rax)) (Storage (Reg (General ThirtyTwo rax))), 2)"
    "fetch 0x1b7be \<equiv> (Unary (IS_8088 Js) (Immediate SixtyFour (ImmVal 112394)), 6)"
    "fetch 0x1b7c4 \<equiv> (Binary (IS_8088 Cmp) (Reg (General ThirtyTwo rax)) (Storage (Reg (General ThirtyTwo r15))), 3)"
    "fetch 0x1b7c7 \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour rsi)) (Storage (Memory SixtyFour (A_SizeDirective 64 (A_Plus (A_FromReg (General SixtyFour r13)) (A_WordConstant 40))))), 4)"
    "fetch 0x1b7cb \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour rdi)) (Storage (Reg (General SixtyFour rbp))), 3)"
    "fetch 0x1b7ce \<equiv> (Binary (IS_PentiumPro Cmovg) (Reg (General ThirtyTwo rax)) (Storage (Reg (General ThirtyTwo r15))), 4)"
    "fetch 0x1b7d2 \<equiv> (Binary (IS_X86_64 Movsxd) (Reg (General SixtyFour r9)) (Storage (Reg (General ThirtyTwo rax))), 3)"
    "fetch 0x1b7d5 \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour rdx)) (Storage (Reg (General SixtyFour r9))), 3)"
    "fetch 0x1b7d8 \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour r14)) (Storage (Reg (General SixtyFour r9))), 3)"
    "fetch 0x1b7db \<equiv> (Binary (IS_8088 Mov) (Memory SixtyFour (A_SizeDirective 64 (A_FromReg (General SixtyFour rsp)))) (Storage (Reg (General SixtyFour r9))), 4)"
    "fetch 0x1b7df \<equiv> (Unary (IS_8088 Call) (Immediate SixtyFour (ImmLabel ''memcpy'')), 5)"
    "fetch 0x1b7e4 \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour r9)) (Storage (Memory SixtyFour (A_SizeDirective 64 (A_FromReg (General SixtyFour rsp))))), 4)"
    "fetch 0x1b7e8 \<equiv> (Binary (IS_8088 Add) (Reg (General ThirtyTwo r12)) (Storage (Reg (General ThirtyTwo r14))), 3)"
    "fetch 0x1b7eb \<equiv> (Binary (IS_8088 Add) (Reg (General SixtyFour rbp)) (Storage (Reg (General SixtyFour r9))), 3)"
    "fetch 0x1b7ee \<equiv> (Binary (IS_8088 Add) (Reg (General SixtyFour rbx)) (Storage (Reg (General SixtyFour r9))), 3)"
    "fetch 0x1b7f1 \<equiv> (Binary (IS_8088 Sub) (Reg (General ThirtyTwo r15)) (Storage (Reg (General ThirtyTwo r14))), 3)"
    "fetch 0x1b7f4 \<equiv> (Unary (IS_8088 Jne) (Immediate SixtyFour (ImmVal 112528)), 2)"
    "fetch 0x1b7f6 \<equiv> (Binary (IS_8088 Add) (Reg (General SixtyFour rsp)) (Immediate SixtyFour (ImmVal 24)), 4)"
    "fetch 0x1b7fa \<equiv> (Binary (IS_8088 Mov) (Reg (General ThirtyTwo rax)) (Storage (Reg (General ThirtyTwo r12))), 3)"
    "fetch 0x1b7fd \<equiv> (Unary (IS_8088 Pop) (Storage (Reg (General SixtyFour rbx))), 1)"
    "fetch 0x1b7fe \<equiv> (Unary (IS_8088 Pop) (Storage (Reg (General SixtyFour rbp))), 1)"
    "fetch 0x1b7ff \<equiv> (Unary (IS_8088 Pop) (Storage (Reg (General SixtyFour r12))), 2)"
    "fetch 0x1b801 \<equiv> (Unary (IS_8088 Pop) (Storage (Reg (General SixtyFour r13))), 2)"
    "fetch 0x1b803 \<equiv> (Unary (IS_8088 Pop) (Storage (Reg (General SixtyFour r14))), 2)"
    "fetch 0x1b805 \<equiv> (Unary (IS_8088 Pop) (Storage (Reg (General SixtyFour r15))), 2)"
    "fetch 0x1b807 \<equiv> (Nullary (IS_8088 Ret), 1)"
    "fetch 0x1b808 \<equiv> (Unary (IS_8088 Nop) (Storage (Memory ThirtyTwo (A_SizeDirective 32 (A_Plus (A_FromReg (General SixtyFour rax)) (A_Plus (A_Mult 1 (A_FromReg (General SixtyFour rax))) (A_WordConstant 0)))))), 8)"
    "fetch 0x1b810 \<equiv> (Binary (IS_8088 Xor) (Reg (General ThirtyTwo rax)) (Storage (Reg (General ThirtyTwo rax))), 2)"
    "fetch 0x1b812 \<equiv> (Binary (IS_8088 Test) (Reg (General ThirtyTwo rcx)) (Storage (Reg (General ThirtyTwo rcx))), 2)"
    "fetch 0x1b814 \<equiv> (Unary (IS_8088 Jne) (Immediate SixtyFour (ImmVal 112532)), 6)"
    "fetch 0x1b81a \<equiv> (Unary (IS_8088 Jmp) (Immediate SixtyFour (ImmVal 112394)), 5)"
    "fetch 0x1b81f \<equiv> (Nullary (IS_8088 Nop), 1)"
    "fetch 0x1b820 \<equiv> (Binary (IS_8088 Test) (Reg (General Eight rax)) (Immediate SixtyFour (ImmVal 4)), 2)"
    "fetch 0x1b822 \<equiv> (Unary (IS_8088 Jne) (Immediate SixtyFour (ImmVal 112811)), 6)"
    "fetch 0x1b828 \<equiv> (Binary (IS_8088 Test) (Reg (General ThirtyTwo rax)) (Storage (Reg (General ThirtyTwo rax))), 2)"
    "fetch 0x1b82a \<equiv> (Unary (IS_8088 Je) (Immediate SixtyFour (ImmVal 112479)), 6)"
    "fetch 0x1b830 \<equiv> (Binary (IS_80386 Movzx) (Reg (General ThirtyTwo rax)) (Storage (Memory Eight (A_SizeDirective 8 (A_FromReg (General SixtyFour rsi))))), 3)"
    "fetch 0x1b833 \<equiv> (Binary (IS_8088 Mov) (Memory Eight (A_SizeDirective 8 (A_Plus (A_FromReg (General SixtyFour rbp)) (A_WordConstant 0)))) (Storage (Reg (General Eight rax))), 3)"
    "fetch 0x1b836 \<equiv> (Binary (IS_8088 Test) (Reg (General Eight r12)) (Immediate SixtyFour (ImmVal 2)), 4)"
    "fetch 0x1b83a \<equiv> (Unary (IS_8088 Je) (Immediate SixtyFour (ImmVal 112479)), 6)"
    "fetch 0x1b840 \<equiv> (Binary (IS_8088 Mov) (Reg (General ThirtyTwo rax)) (Storage (Reg (General ThirtyTwo r12))), 3)"
    "fetch 0x1b843 \<equiv> (Binary (IS_80386 Movzx) (Reg (General ThirtyTwo rcx)) (Storage (Memory Sixteen (A_SizeDirective 16 (A_Plus (A_FromReg (General SixtyFour rsi)) (A_Minus (A_Mult 1 (A_FromReg (General SixtyFour rax))) (A_WordConstant 2)))))), 5)"
    "fetch 0x1b848 \<equiv> (Binary (IS_8088 Mov) (Memory Sixteen (A_SizeDirective 16 (A_Plus (A_FromReg (General SixtyFour rbp)) (A_Minus (A_Mult 1 (A_FromReg (General SixtyFour rax))) (A_WordConstant 2))))) (Storage (Reg (General Sixteen rcx))), 5)"
    "fetch 0x1b84d \<equiv> (Unary (IS_8088 Jmp) (Immediate SixtyFour (ImmVal 112479)), 5)"
    "fetch 0x1b852 \<equiv> (Unary (IS_8088 Nop) (Storage (Memory Sixteen (A_SizeDirective 16 (A_Plus (A_FromReg (General SixtyFour rax)) (A_Plus (A_Mult 1 (A_FromReg (General SixtyFour rax))) (A_WordConstant 0)))))), 6)"
    "fetch 0x1b858 \<equiv> (Binary (IS_8088 Xor) (Reg (General ThirtyTwo r12)) (Storage (Reg (General ThirtyTwo r12))), 3)"
    "fetch 0x1b85b \<equiv> (Unary (IS_8088 Jmp) (Immediate SixtyFour (ImmVal 112372)), 5)"
    "fetch 0x1b860 \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour rdx)) (Storage (Memory SixtyFour (A_SizeDirective 64 (A_FromReg (General SixtyFour rsi))))), 3)"
    "fetch 0x1b863 \<equiv> (Binary (IS_8088 Lea) (Reg (General SixtyFour rdi)) (Storage (Memory SixtyFour (A_Plus (A_FromReg (General SixtyFour rbp)) (A_WordConstant 8)))), 4)"
    "fetch 0x1b867 \<equiv> (Binary (IS_8088 And) (Reg (General SixtyFour rdi)) (Immediate SixtyFour (ImmVal 18446744073709551608)), 4)"
    "fetch 0x1b86b \<equiv> (Binary (IS_8088 Mov) (Memory SixtyFour (A_SizeDirective 64 (A_Plus (A_FromReg (General SixtyFour rbp)) (A_WordConstant 0)))) (Storage (Reg (General SixtyFour rdx))), 4)"
    "fetch 0x1b86f \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour rdx)) (Storage (Memory SixtyFour (A_SizeDirective 64 (A_Plus (A_FromReg (General SixtyFour rsi)) (A_Minus (A_Mult 1 (A_FromReg (General SixtyFour rax))) (A_WordConstant 8)))))), 5)"
    "fetch 0x1b874 \<equiv> (Binary (IS_8088 Mov) (Memory SixtyFour (A_SizeDirective 64 (A_Plus (A_FromReg (General SixtyFour rbp)) (A_Minus (A_Mult 1 (A_FromReg (General SixtyFour rax))) (A_WordConstant 8))))) (Storage (Reg (General SixtyFour rdx))), 5)"
    "fetch 0x1b879 \<equiv> (Binary (IS_8088 Sub) (Reg (General SixtyFour rbp)) (Storage (Reg (General SixtyFour rdi))), 3)"
    "fetch 0x1b87c \<equiv> (Binary (IS_8088 Lea) (Reg (General SixtyFour rcx)) (Storage (Memory SixtyFour (A_Plus (A_FromReg (General SixtyFour rax)) (A_Mult 1 (A_FromReg (General SixtyFour rbp)))))), 4)"
    "fetch 0x1b880 \<equiv> (Binary (IS_8088 Sub) (Reg (General SixtyFour rsi)) (Storage (Reg (General SixtyFour rbp))), 3)"
    "fetch 0x1b883 \<equiv> (Binary (IS_8088 Shr) (Reg (General SixtyFour rcx)) (Immediate SixtyFour (ImmVal 3)), 4)"
    "fetch 0x1b887 \<equiv> (Unary (IS_8088 Call) (Immediate SixtyFour (ImmLabel ''rep_movs_ESRDI_DSRSI'')), 3)"
    "fetch 0x1b88a \<equiv> (Binary (IS_8088 Add) (Reg (General SixtyFour rsp)) (Immediate SixtyFour (ImmVal 24)), 4)"
    "fetch 0x1b88e \<equiv> (Binary (IS_8088 Mov) (Reg (General ThirtyTwo rax)) (Storage (Reg (General ThirtyTwo r15))), 3)"
    "fetch 0x1b891 \<equiv> (Unary (IS_8088 Pop) (Storage (Reg (General SixtyFour rbx))), 1)"
    "fetch 0x1b892 \<equiv> (Unary (IS_8088 Pop) (Storage (Reg (General SixtyFour rbp))), 1)"
    "fetch 0x1b893 \<equiv> (Unary (IS_8088 Pop) (Storage (Reg (General SixtyFour r12))), 2)"
    "fetch 0x1b895 \<equiv> (Unary (IS_8088 Pop) (Storage (Reg (General SixtyFour r13))), 2)"
    "fetch 0x1b897 \<equiv> (Unary (IS_8088 Pop) (Storage (Reg (General SixtyFour r14))), 2)"
    "fetch 0x1b899 \<equiv> (Unary (IS_8088 Pop) (Storage (Reg (General SixtyFour r15))), 2)"
    "fetch 0x1b89b \<equiv> (Nullary (IS_8088 Ret), 1)"
    "fetch 0x1b89c \<equiv> (Binary (IS_8088 Mov) (Reg (General ThirtyTwo rdx)) (Storage (Memory ThirtyTwo (A_SizeDirective 32 (A_FromReg (General SixtyFour rsi))))), 2)"
    "fetch 0x1b89e \<equiv> (Binary (IS_8088 Mov) (Memory ThirtyTwo (A_SizeDirective 32 (A_Plus (A_FromReg (General SixtyFour rbp)) (A_WordConstant 0)))) (Storage (Reg (General ThirtyTwo rdx))), 3)"
    "fetch 0x1b8a1 \<equiv> (Binary (IS_8088 Mov) (Reg (General ThirtyTwo rdx)) (Storage (Memory ThirtyTwo (A_SizeDirective 32 (A_Plus (A_FromReg (General SixtyFour rsi)) (A_Minus (A_Mult 1 (A_FromReg (General SixtyFour rax))) (A_WordConstant 4)))))), 4)"
    "fetch 0x1b8a5 \<equiv> (Binary (IS_8088 Mov) (Memory ThirtyTwo (A_SizeDirective 32 (A_Plus (A_FromReg (General SixtyFour rbp)) (A_Minus (A_Mult 1 (A_FromReg (General SixtyFour rax))) (A_WordConstant 4))))) (Storage (Reg (General ThirtyTwo rdx))), 4)"
    "fetch 0x1b8a9 \<equiv> (Unary (IS_8088 Jmp) (Immediate SixtyFour (ImmVal 112778)), 2)"
    "fetch 0x1b8ab \<equiv> (Binary (IS_8088 Mov) (Reg (General ThirtyTwo rax)) (Storage (Memory ThirtyTwo (A_SizeDirective 32 (A_FromReg (General SixtyFour rsi))))), 2)"
    "fetch 0x1b8ad \<equiv> (Binary (IS_8088 Mov) (Memory ThirtyTwo (A_SizeDirective 32 (A_Plus (A_FromReg (General SixtyFour rbp)) (A_WordConstant 0)))) (Storage (Reg (General ThirtyTwo rax))), 3)"
    "fetch 0x1b8b0 \<equiv> (Binary (IS_8088 Mov) (Reg (General ThirtyTwo rax)) (Storage (Reg (General ThirtyTwo r12))), 3)"
    "fetch 0x1b8b3 \<equiv> (Binary (IS_8088 Mov) (Reg (General ThirtyTwo rcx)) (Storage (Memory ThirtyTwo (A_SizeDirective 32 (A_Plus (A_FromReg (General SixtyFour rsi)) (A_Minus (A_Mult 1 (A_FromReg (General SixtyFour rax))) (A_WordConstant 4)))))), 4)"
    "fetch 0x1b8b7 \<equiv> (Binary (IS_8088 Mov) (Memory ThirtyTwo (A_SizeDirective 32 (A_Plus (A_FromReg (General SixtyFour rbp)) (A_Minus (A_Mult 1 (A_FromReg (General SixtyFour rax))) (A_WordConstant 4))))) (Storage (Reg (General ThirtyTwo rcx))), 4)"
    "fetch 0x1b8bb \<equiv> (Unary (IS_8088 Jmp) (Immediate SixtyFour (ImmVal 112479)), 5)"
    and \<alpha>_def: \<open>\<alpha> = \<lparr>text_sections = [], data_sections = [], labels_to_offsets = [], binary_offset = 0\<rparr>\<close>
    and memcpy\<^sub>a\<^sub>d\<^sub>d\<^sub>r[simp]: \<open>the (label_to_address \<alpha> ''memcpy'') = memcpy_addr\<close>
    and raw_pread_aligned\<^sub>a\<^sub>d\<^sub>d\<^sub>r[simp]: \<open>the (label_to_address \<alpha> ''raw_pread_aligned'') = raw_pread_aligned_addr\<close>
    and rep_movs_ESRDI_DSRSI\<^sub>a\<^sub>d\<^sub>d\<^sub>r[simp]: \<open>the (label_to_address \<alpha> ''rep_movs_ESRDI_DSRSI'') = rep_movs_ESRDI_DSRSI_addr\<close>
begin

text \<open>Using definitions that don't get unfolded immediately prevents locale argument issues.\<close>
definition \<open>raw_pread_aligned_0x1b66f_retval \<equiv> raw_pread_aligned_0x1b66f_retval\<^sub>v\<close>
definition \<open>raw_pread_aligned_0x1b702_retval \<equiv> raw_pread_aligned_0x1b702_retval\<^sub>v\<close>
definition \<open>rep_movs_ESRDI_DSRSI_0x1b75c_retval \<equiv> rep_movs_ESRDI_DSRSI_0x1b75c_retval\<^sub>v\<close>
definition \<open>raw_pread_aligned_0x1b7b7_retval \<equiv> raw_pread_aligned_0x1b7b7_retval\<^sub>v\<close>
definition \<open>memcpy_0x1b7df_retval \<equiv> memcpy_0x1b7df_retval\<^sub>v\<close>
definition \<open>rep_movs_ESRDI_DSRSI_0x1b887_retval \<equiv> rep_movs_ESRDI_DSRSI_0x1b887_retval\<^sub>v\<close>

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
  )?

method vcg uses acode assms =
  subst acode,
  (vcg_step assms: assms)+

end

locale "raw_pread" = "qemu_img_xen" +
  fixes RAX\<^sub>0\<^sub>v RBX\<^sub>0\<^sub>v RCX\<^sub>0\<^sub>v RDX\<^sub>0\<^sub>v RDI\<^sub>0\<^sub>v RSI\<^sub>0\<^sub>v RSP\<^sub>0\<^sub>v RBP\<^sub>0\<^sub>v R15\<^sub>0\<^sub>v R14\<^sub>0\<^sub>v R13\<^sub>0\<^sub>v R12\<^sub>0\<^sub>v R9\<^sub>0\<^sub>v ret_address\<^sub>v :: \<open>64 word\<close>
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
definition \<open>ret_address \<equiv> ret_address\<^sub>v\<close>

definition P_0x1b610_0 :: state_pred where
  \<open>P_0x1b610_0 \<sigma> \<equiv> RIP \<sigma> = 0x1b610 \<and> RAX \<sigma> = RAX\<^sub>0 \<and> RBX \<sigma> = RBX\<^sub>0 \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = RDX\<^sub>0 \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = RSP\<^sub>0 \<and> RBP \<sigma> = RBP\<^sub>0 \<and> R15 \<sigma> = R15\<^sub>0 \<and> R14 \<sigma> = R14\<^sub>0 \<and> R13 \<sigma> = R13\<^sub>0 \<and> R12 \<sigma> = R12\<^sub>0 \<and> R9 \<sigma> = R9\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address\<close>
declare P_0x1b610_0_def[Ps]

definition P_0x1b610_0_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x1b610_0_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((RDI\<^sub>0::64 word) + 0x40), 8),
    (2, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x40), 8)
  }\<close>

definition P_0x1b610_0_regions :: state_pred where
  \<open>P_0x1b610_0_regions \<sigma> \<equiv> \<exists>regions. P_0x1b610_0_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x1b637_0 :: state_pred where
  \<open>Q_0x1b637_0 \<sigma> \<equiv> RIP \<sigma> = 0x1b637 \<and> RAX \<sigma> = RAX\<^sub>0 \<and> RBX \<sigma> = RSI\<^sub>0 \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word) \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x48) \<and> RBP \<sigma> = RDX\<^sub>0 \<and> R15 \<sigma> = ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)) \<and> R14 \<sigma> = R14\<^sub>0 \<and> R13 \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> R12 \<sigma> = R12\<^sub>0 \<and> R9 \<sigma> = R9\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = RDI\<^sub>0\<close>
declare Q_0x1b637_0_def[Qs]

schematic_goal raw_pread_0_14_0x1b610_0x1b634_0[blocks]:
  assumes \<open>(P_0x1b610_0 && P_0x1b610_0_regions) \<sigma>\<close>
  shows \<open>exec_block 14 0x1b634 0 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x1b637_0 ?\<sigma> \<and> block_usage P_0x1b610_0_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x1b610_0_def P_0x1b610_0_regions_def post: Q_0x1b637_0_def regionset: P_0x1b610_0_regions_set_def)

definition P_0x1b637_true_1 :: state_pred where
  \<open>P_0x1b637_true_1 \<sigma> \<equiv> RIP \<sigma> = 0x1b637 \<and> RAX \<sigma> = RAX\<^sub>0 \<and> RBX \<sigma> = RSI\<^sub>0 \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word) \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x48) \<and> RBP \<sigma> = RDX\<^sub>0 \<and> R15 \<sigma> = ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)) \<and> R14 \<sigma> = R14\<^sub>0 \<and> R13 \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> R12 \<sigma> = R12\<^sub>0 \<and> R9 \<sigma> = R9\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = RDI\<^sub>0\<close>
declare P_0x1b637_true_1_def[Ps]

definition P_0x1b637_true_1_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x1b637_true_1_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((RDI\<^sub>0::64 word) + 0x40), 8),
    (2, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x40), 8)
  }\<close>

definition P_0x1b637_true_1_regions :: state_pred where
  \<open>P_0x1b637_true_1_regions \<sigma> \<equiv> \<exists>regions. P_0x1b637_true_1_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x1b6f4_1 :: state_pred where
  \<open>Q_0x1b6f4_1 \<sigma> \<equiv> RIP \<sigma> = 0x1b6f4 \<and> RAX \<sigma> = RAX\<^sub>0 \<and> RBX \<sigma> = RSI\<^sub>0 \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word) \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x48) \<and> RBP \<sigma> = RDX\<^sub>0 \<and> R15 \<sigma> = ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)) \<and> R14 \<sigma> = R14\<^sub>0 \<and> R13 \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> R12 \<sigma> = 0x0 \<and> R9 \<sigma> = R9\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = RDI\<^sub>0\<close>
declare Q_0x1b6f4_1_def[Qs]

schematic_goal raw_pread_0_3_0x1b637_0x1b85b_1[blocks]:
  assumes \<open>(P_0x1b637_true_1 && P_0x1b637_true_1_regions && ZF) \<sigma>\<close>
  shows \<open>exec_block 3 0x1b85b (Suc 0) \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x1b6f4_1 ?\<sigma> \<and> block_usage P_0x1b637_true_1_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x1b637_true_1_def P_0x1b637_true_1_regions_def post: Q_0x1b6f4_1_def regionset: P_0x1b637_true_1_regions_set_def)

definition P_0x1b6f4_2 :: state_pred where
  \<open>P_0x1b6f4_2 \<sigma> \<equiv> RIP \<sigma> = 0x1b6f4 \<and> RAX \<sigma> = RAX\<^sub>0 \<and> RBX \<sigma> = RSI\<^sub>0 \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word) \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x48) \<and> RBP \<sigma> = RDX\<^sub>0 \<and> R15 \<sigma> = ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)) \<and> R14 \<sigma> = R14\<^sub>0 \<and> R13 \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> R12 \<sigma> = 0x0 \<and> R9 \<sigma> = R9\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = RDI\<^sub>0\<close>
declare P_0x1b6f4_2_def[Ps]

definition P_0x1b6f4_2_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x1b6f4_2_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((RDI\<^sub>0::64 word) + 0x40), 8),
    (2, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x40), 8)
  }\<close>

definition P_0x1b6f4_2_regions :: state_pred where
  \<open>P_0x1b6f4_2_regions \<sigma> \<equiv> \<exists>regions. P_0x1b6f4_2_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x1b702_2 :: state_pred where
  \<open>Q_0x1b702_2 \<sigma> \<equiv> RIP \<sigma> = 0x1b702 \<and> RAX \<sigma> = RAX\<^sub>0 \<and> RBX \<sigma> = RSI\<^sub>0 \<and> RCX \<sigma> = ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)) \<and> RDX \<sigma> = RDX\<^sub>0 \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x48) \<and> RBP \<sigma> = RDX\<^sub>0 \<and> R15 \<sigma> = ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)) \<and> R14 \<sigma> = R14\<^sub>0 \<and> R13 \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> R12 \<sigma> = 0x0 \<and> R9 \<sigma> = R9\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = RDI\<^sub>0\<close>
declare Q_0x1b702_2_def[Qs]

schematic_goal raw_pread_0_4_0x1b6f4_0x1b6ff_2[blocks]:
  assumes \<open>(P_0x1b6f4_2 && P_0x1b6f4_2_regions) \<sigma>\<close>
  shows \<open>exec_block 4 0x1b6ff 2 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x1b702_2 ?\<sigma> \<and> block_usage P_0x1b6f4_2_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x1b6f4_2_def P_0x1b6f4_2_regions_def post: Q_0x1b702_2_def regionset: P_0x1b6f4_2_regions_set_def)

definition P_0x1b702_3 :: state_pred where
  \<open>P_0x1b702_3 \<sigma> \<equiv> RIP \<sigma> = 0x1b702 \<and> RAX \<sigma> = RAX\<^sub>0 \<and> RBX \<sigma> = RSI\<^sub>0 \<and> RCX \<sigma> = ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)) \<and> RDX \<sigma> = RDX\<^sub>0 \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x48) \<and> RBP \<sigma> = RDX\<^sub>0 \<and> R15 \<sigma> = ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)) \<and> R14 \<sigma> = R14\<^sub>0 \<and> R13 \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> R12 \<sigma> = 0x0 \<and> R9 \<sigma> = R9\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = RDI\<^sub>0\<close>
declare P_0x1b702_3_def[Ps]

definition P_0x1b702_3_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x1b702_3_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((RDI\<^sub>0::64 word) + 0x40), 8),
    (2, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x40), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x50), 8)
  }\<close>

definition P_0x1b702_3_regions :: state_pred where
  \<open>P_0x1b702_3_regions \<sigma> \<equiv> \<exists>regions. P_0x1b702_3_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_raw_pread_aligned_addr_0x1b702_3 :: state_pred where
  \<open>Q_raw_pread_aligned_addr_0x1b702_3 \<sigma> \<equiv> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x50) \<and> RIP \<sigma> = raw_pread_aligned_addr \<and> RAX \<sigma> = RAX\<^sub>0 \<and> RBX \<sigma> = RSI\<^sub>0 \<and> RCX \<sigma> = ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)) \<and> RDX \<sigma> = RDX\<^sub>0 \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RBP \<sigma> = RDX\<^sub>0 \<and> R15 \<sigma> = ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)) \<and> R14 \<sigma> = R14\<^sub>0 \<and> R13 \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> R12 \<sigma> = 0x0 \<and> R9 \<sigma> = R9\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = RDI\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),8]::64 word) = 0x1b707\<close>
declare Q_raw_pread_aligned_addr_0x1b702_3_def[Qs]

schematic_goal raw_pread_0_1_0x1b702_0x1b702_3[blocks]:
  assumes \<open>(P_0x1b702_3 && P_0x1b702_3_regions) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x1b702 3 \<sigma> \<triangleq> ?\<sigma> \<and> Q_raw_pread_aligned_addr_0x1b702_3 ?\<sigma> \<and> block_usage P_0x1b702_3_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x1b702_3_def P_0x1b702_3_regions_def post: Q_raw_pread_aligned_addr_0x1b702_3_def regionset: P_0x1b702_3_regions_set_def)

definition P_0x1b707_4 :: state_pred where
  \<open>P_0x1b707_4 \<sigma> \<equiv> RIP \<sigma> = 0x1b707 \<and> RAX \<sigma> = raw_pread_aligned_0x1b702_retval \<and> RBX \<sigma> = RSI\<^sub>0 \<and> RCX \<sigma> = ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)) \<and> RDX \<sigma> = RDX\<^sub>0 \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x48) \<and> RBP \<sigma> = RDX\<^sub>0 \<and> R15 \<sigma> = ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)) \<and> R14 \<sigma> = R14\<^sub>0 \<and> R13 \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> R12 \<sigma> = 0x0 \<and> R9 \<sigma> = R9\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = RDI\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),8]::64 word) = 0x1b707\<close>
declare P_0x1b707_4_def[Ps]

definition P_0x1b707_4_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x1b707_4_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((RDI\<^sub>0::64 word) + 0x40), 8),
    (2, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x40), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x50), 8)
  }\<close>

definition P_0x1b707_4_regions :: state_pred where
  \<open>P_0x1b707_4_regions \<sigma> \<equiv> \<exists>regions. P_0x1b707_4_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x1b70a_4 :: state_pred where
  \<open>Q_0x1b70a_4 \<sigma> \<equiv> RIP \<sigma> = 0x1b70a \<and> RAX \<sigma> = ucast ((\<langle>31,0\<rangle>raw_pread_aligned_0x1b702_retval::32 word)) \<and> RBX \<sigma> = RSI\<^sub>0 \<and> RCX \<sigma> = ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)) \<and> RDX \<sigma> = RDX\<^sub>0 \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x48) \<and> RBP \<sigma> = RDX\<^sub>0 \<and> R15 \<sigma> = ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)) \<and> R14 \<sigma> = R14\<^sub>0 \<and> R13 \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> R12 \<sigma> = 0x0 \<and> R9 \<sigma> = R9\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = RDI\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),8]::64 word) = 0x1b707\<close>
declare Q_0x1b70a_4_def[Qs]

schematic_goal raw_pread_0_1_0x1b707_0x1b707_4[blocks]:
  assumes \<open>(P_0x1b707_4 && P_0x1b707_4_regions) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x1b707 4 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x1b70a_4 ?\<sigma> \<and> block_usage P_0x1b707_4_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x1b707_4_def P_0x1b707_4_regions_def post: Q_0x1b70a_4_def regionset: P_0x1b707_4_regions_set_def)

definition P_0x1b70a_5 :: state_pred where
  \<open>P_0x1b70a_5 \<sigma> \<equiv> RIP \<sigma> = 0x1b70a \<and> RAX \<sigma> = ucast ((\<langle>31,0\<rangle>raw_pread_aligned_0x1b702_retval::32 word)) \<and> RBX \<sigma> = RSI\<^sub>0 \<and> RCX \<sigma> = ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)) \<and> RDX \<sigma> = RDX\<^sub>0 \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x48) \<and> RBP \<sigma> = RDX\<^sub>0 \<and> R15 \<sigma> = ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)) \<and> R14 \<sigma> = R14\<^sub>0 \<and> R13 \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> R12 \<sigma> = 0x0 \<and> R9 \<sigma> = R9\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = RDI\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),8]::64 word) = 0x1b707\<close>
declare P_0x1b70a_5_def[Ps]

definition P_0x1b70a_5_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x1b70a_5_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((RDI\<^sub>0::64 word) + 0x40), 8),
    (2, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x40), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x50), 8)
  }\<close>

definition P_0x1b70a_5_regions :: state_pred where
  \<open>P_0x1b70a_5_regions \<sigma> \<equiv> \<exists>regions. P_0x1b70a_5_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_ret_address_5 :: state_pred where
  \<open>Q_ret_address_5 \<sigma> \<equiv> RIP \<sigma> = ret_address \<and> RBX \<sigma> = RBX\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) + 0x8) \<and> RBP \<sigma> = RBP\<^sub>0 \<and> R15 \<sigma> = R15\<^sub>0 \<and> R14 \<sigma> = R14\<^sub>0 \<and> R13 \<sigma> = R13\<^sub>0 \<and> R12 \<sigma> = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = RDI\<^sub>0\<close>
declare Q_ret_address_5_def[Qs]

schematic_goal raw_pread_0_8_0x1b70a_0x1b718_5[blocks]:
  assumes \<open>(P_0x1b70a_5 && P_0x1b70a_5_regions) \<sigma>\<close>
  shows \<open>exec_block 8 0x1b718 5 \<sigma> \<triangleq> ?\<sigma> \<and> Q_ret_address_5 ?\<sigma> \<and> block_usage P_0x1b70a_5_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x1b70a_5_def P_0x1b70a_5_regions_def post: Q_ret_address_5_def regionset: P_0x1b70a_5_regions_set_def)

definition P_0x1b637_false_6 :: state_pred where
  \<open>P_0x1b637_false_6 \<sigma> \<equiv> RIP \<sigma> = 0x1b637 \<and> RAX \<sigma> = RAX\<^sub>0 \<and> RBX \<sigma> = RSI\<^sub>0 \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word) \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x48) \<and> RBP \<sigma> = RDX\<^sub>0 \<and> R15 \<sigma> = ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)) \<and> R14 \<sigma> = R14\<^sub>0 \<and> R13 \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> R12 \<sigma> = R12\<^sub>0 \<and> R9 \<sigma> = R9\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = RDI\<^sub>0\<close>
declare P_0x1b637_false_6_def[Ps]

definition P_0x1b637_false_6_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x1b637_false_6_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((RDI\<^sub>0::64 word) + 0x40), 8),
    (2, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x40), 8)
  }\<close>

definition P_0x1b637_false_6_regions :: state_pred where
  \<open>P_0x1b637_false_6_regions \<sigma> \<equiv> \<exists>regions. P_0x1b637_false_6_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x1b647_6 :: state_pred where
  \<open>Q_0x1b647_6 \<sigma> \<equiv> RIP \<sigma> = 0x1b647 \<and> RAX \<sigma> = RAX\<^sub>0 \<and> RBX \<sigma> = RSI\<^sub>0 \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word) \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x48) \<and> RBP \<sigma> = RDX\<^sub>0 \<and> R15 \<sigma> = ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)) \<and> R14 \<sigma> = R14\<^sub>0 \<and> R13 \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> R12 \<sigma> = ucast ((((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) AND 0x1ff)) \<and> R9 \<sigma> = R9\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = RDI\<^sub>0\<close>
declare Q_0x1b647_6_def[Qs]

schematic_goal raw_pread_0_3_0x1b637_0x1b640_6[blocks]:
  assumes \<open>(P_0x1b637_false_6 && P_0x1b637_false_6_regions && ! ZF) \<sigma>\<close>
  shows \<open>exec_block 3 0x1b640 6 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x1b647_6 ?\<sigma> \<and> block_usage P_0x1b637_false_6_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x1b637_false_6_def P_0x1b637_false_6_regions_def post: Q_0x1b647_6_def regionset: P_0x1b637_false_6_regions_set_def)

definition P_0x1b647_true_7 :: state_pred where
  \<open>P_0x1b647_true_7 \<sigma> \<equiv> RIP \<sigma> = 0x1b647 \<and> RAX \<sigma> = RAX\<^sub>0 \<and> RBX \<sigma> = RSI\<^sub>0 \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word) \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x48) \<and> RBP \<sigma> = RDX\<^sub>0 \<and> R15 \<sigma> = ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)) \<and> R14 \<sigma> = R14\<^sub>0 \<and> R13 \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> R12 \<sigma> = ucast ((((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) AND 0x1ff)) \<and> R9 \<sigma> = R9\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = RDI\<^sub>0\<close>
declare P_0x1b647_true_7_def[Ps]

definition P_0x1b647_true_7_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x1b647_true_7_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((RDI\<^sub>0::64 word) + 0x40), 8),
    (2, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x40), 8)
  }\<close>

definition P_0x1b647_true_7_regions :: state_pred where
  \<open>P_0x1b647_true_7_regions \<sigma> \<equiv> \<exists>regions. P_0x1b647_true_7_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x1b6e2_7 :: state_pred where
  \<open>Q_0x1b6e2_7 \<sigma> \<equiv> RIP \<sigma> = 0x1b6e2 \<and> RAX \<sigma> = RAX\<^sub>0 \<and> RBX \<sigma> = RSI\<^sub>0 \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word) \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x48) \<and> RBP \<sigma> = RDX\<^sub>0 \<and> R15 \<sigma> = ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)) \<and> R14 \<sigma> = R14\<^sub>0 \<and> R13 \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> R12 \<sigma> = ucast ((((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) AND 0x1ff)) \<and> R9 \<sigma> = R9\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = RDI\<^sub>0\<close>
declare Q_0x1b6e2_7_def[Qs]

schematic_goal raw_pread_0_3_0x1b647_0x1b6db_7[blocks]:
  assumes \<open>(P_0x1b647_true_7 && P_0x1b647_true_7_regions && ZF) \<sigma>\<close>
  shows \<open>exec_block 3 0x1b6db 7 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x1b6e2_7 ?\<sigma> \<and> block_usage P_0x1b647_true_7_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x1b647_true_7_def P_0x1b647_true_7_regions_def post: Q_0x1b6e2_7_def regionset: P_0x1b647_true_7_regions_set_def)

definition P_0x1b6e2_true_8 :: state_pred where
  \<open>P_0x1b6e2_true_8 \<sigma> \<equiv> RIP \<sigma> = 0x1b6e2 \<and> RAX \<sigma> = RAX\<^sub>0 \<and> RBX \<sigma> = RSI\<^sub>0 \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word) \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x48) \<and> RBP \<sigma> = RDX\<^sub>0 \<and> R15 \<sigma> = ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)) \<and> R14 \<sigma> = R14\<^sub>0 \<and> R13 \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> R12 \<sigma> = ucast ((((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) AND 0x1ff)) \<and> R9 \<sigma> = R9\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = RDI\<^sub>0\<close>
declare P_0x1b6e2_true_8_def[Ps]

definition P_0x1b6e2_true_8_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x1b6e2_true_8_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((RDI\<^sub>0::64 word) + 0x40), 8),
    (2, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x40), 8)
  }\<close>

definition P_0x1b6e2_true_8_regions :: state_pred where
  \<open>P_0x1b6e2_true_8_regions \<sigma> \<equiv> \<exists>regions. P_0x1b6e2_true_8_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x1b794_8 :: state_pred where
  \<open>Q_0x1b794_8 \<sigma> \<equiv> RIP \<sigma> = 0x1b794 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x48) \<and> R13 \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = RDI\<^sub>0\<close>
declare Q_0x1b794_8_def[Qs]

schematic_goal raw_pread_0_3_0x1b6e2_0x1b78b_8[blocks]:
  assumes \<open>(P_0x1b6e2_true_8 && P_0x1b6e2_true_8_regions && !ZF) \<sigma>\<close>
  shows \<open>exec_block 3 0x1b78b 8 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x1b794_8 ?\<sigma> \<and> block_usage P_0x1b6e2_true_8_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x1b6e2_true_8_def P_0x1b6e2_true_8_regions_def post: Q_0x1b794_8_def regionset: P_0x1b6e2_true_8_regions_set_def)

definition P_0x1b794_9 :: state_pred where
  \<open>P_0x1b794_9 \<sigma> \<equiv> RIP \<sigma> = 0x1b794 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x48) \<and> R13 \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = RDI\<^sub>0\<close>
declare P_0x1b794_9_def[Ps]

definition P_0x1b794_9_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x1b794_9_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((RDI\<^sub>0::64 word) + 0x40), 8),
    (2, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x40), 8)
  }\<close>

definition P_0x1b794_9_regions :: state_pred where
  \<open>P_0x1b794_9_regions \<sigma> \<equiv> \<exists>regions. P_0x1b794_9_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x1b7b7_9 :: state_pred where
  \<open>Q_0x1b7b7_9 \<sigma> \<equiv> RIP \<sigma> = 0x1b7b7 \<and> RAX \<sigma> = 0x4000 \<and> RCX \<sigma> = ucast ((if' ((((\<langle>31,0\<rangle>((R15 \<sigma>::64 word) + 0x1ff)::32 word)::32 word) AND 0xfffffe00)::32 word) >s 0x4000 then 0x4000 else ((((\<langle>31,0\<rangle>((R15 \<sigma>::64 word) + 0x1ff)::32 word)::32 word) AND 0xfffffe00)::32 word))) \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = RBX \<sigma> \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x48) \<and> R13 \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = RDI\<^sub>0\<close>
declare Q_0x1b7b7_9_def[Qs]

schematic_goal raw_pread_0_7_0x1b794_0x1b7b4_9[blocks]:
  assumes \<open>(P_0x1b794_9 && P_0x1b794_9_regions) \<sigma>\<close>
  shows \<open>exec_block 7 0x1b7b4 9 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x1b7b7_9 ?\<sigma> \<and> block_usage P_0x1b794_9_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x1b794_9_def P_0x1b794_9_regions_def post: Q_0x1b7b7_9_def regionset: P_0x1b794_9_regions_set_def)

definition P_0x1b7b7_10 :: state_pred where
  \<open>P_0x1b7b7_10 \<sigma> \<equiv> RIP \<sigma> = 0x1b7b7 \<and> RAX \<sigma> = 0x4000 \<and> RCX \<sigma> = ucast ((if' ((((\<langle>31,0\<rangle>((R15 \<sigma>::64 word) + 0x1ff)::32 word)::32 word) AND 0xfffffe00)::32 word) >s 0x4000 then 0x4000 else ((((\<langle>31,0\<rangle>((R15 \<sigma>::64 word) + 0x1ff)::32 word)::32 word) AND 0xfffffe00)::32 word))) \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = RBX \<sigma> \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x48) \<and> R13 \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = RDI\<^sub>0\<close>
declare P_0x1b7b7_10_def[Ps]

definition P_0x1b7b7_10_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x1b7b7_10_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((RDI\<^sub>0::64 word) + 0x40), 8),
    (2, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x40), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x50), 8)
  }\<close>

definition P_0x1b7b7_10_regions :: state_pred where
  \<open>P_0x1b7b7_10_regions \<sigma> \<equiv> \<exists>regions. P_0x1b7b7_10_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_raw_pread_aligned_addr_0x1b7b7_10 :: state_pred where
  \<open>Q_raw_pread_aligned_addr_0x1b7b7_10 \<sigma> \<equiv> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x50) \<and> RIP \<sigma> = raw_pread_aligned_addr \<and> RAX \<sigma> = 0x4000 \<and> RCX \<sigma> = ucast ((if' ((((\<langle>31,0\<rangle>((R15 \<sigma>::64 word) + 0x1ff)::32 word)::32 word) AND 0xfffffe00)::32 word) >s 0x4000 then 0x4000 else ((((\<langle>31,0\<rangle>((R15 \<sigma>::64 word) + 0x1ff)::32 word)::32 word) AND 0xfffffe00)::32 word))) \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = RBX \<sigma> \<and> R13 \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = RDI\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),8]::64 word) = 0x1b7bc\<close>
declare Q_raw_pread_aligned_addr_0x1b7b7_10_def[Qs]

schematic_goal raw_pread_0_1_0x1b7b7_0x1b7b7_10[blocks]:
  assumes \<open>(P_0x1b7b7_10 && P_0x1b7b7_10_regions) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x1b7b7 10 \<sigma> \<triangleq> ?\<sigma> \<and> Q_raw_pread_aligned_addr_0x1b7b7_10 ?\<sigma> \<and> block_usage P_0x1b7b7_10_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x1b7b7_10_def P_0x1b7b7_10_regions_def post: Q_raw_pread_aligned_addr_0x1b7b7_10_def regionset: P_0x1b7b7_10_regions_set_def)

definition P_0x1b7bc_11 :: state_pred where
  \<open>P_0x1b7bc_11 \<sigma> \<equiv> RIP \<sigma> = 0x1b7bc \<and> RAX \<sigma> = raw_pread_aligned_0x1b7b7_retval \<and> RCX \<sigma> = ucast ((if' ((((\<langle>31,0\<rangle>((R15 \<sigma>::64 word) + 0x1ff)::32 word)::32 word) AND 0xfffffe00)::32 word) >s 0x4000 then 0x4000 else ((((\<langle>31,0\<rangle>((R15 \<sigma>::64 word) + 0x1ff)::32 word)::32 word) AND 0xfffffe00)::32 word))) \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = RBX \<sigma> \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x48) \<and> R13 \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = RDI\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),8]::64 word) = 0x1b7bc\<close>
declare P_0x1b7bc_11_def[Ps]

definition P_0x1b7bc_11_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x1b7bc_11_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((RDI\<^sub>0::64 word) + 0x40), 8),
    (2, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x40), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x50), 8)
  }\<close>

definition P_0x1b7bc_11_regions :: state_pred where
  \<open>P_0x1b7bc_11_regions \<sigma> \<equiv> \<exists>regions. P_0x1b7bc_11_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x1b7be_11 :: state_pred where
  \<open>Q_0x1b7be_11 \<sigma> \<equiv> RIP \<sigma> = 0x1b7be \<and> RAX \<sigma> = raw_pread_aligned_0x1b7b7_retval \<and> RCX \<sigma> = ucast ((if' ((((\<langle>31,0\<rangle>((R15 \<sigma>::64 word) + 0x1ff)::32 word)::32 word) AND 0xfffffe00)::32 word) >s 0x4000 then 0x4000 else ((((\<langle>31,0\<rangle>((R15 \<sigma>::64 word) + 0x1ff)::32 word)::32 word) AND 0xfffffe00)::32 word))) \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = RBX \<sigma> \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x48) \<and> R13 \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = RDI\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),8]::64 word) = 0x1b7bc\<close>
declare Q_0x1b7be_11_def[Qs]

schematic_goal raw_pread_0_1_0x1b7bc_0x1b7bc_11[blocks]:
  assumes \<open>(P_0x1b7bc_11 && P_0x1b7bc_11_regions) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x1b7bc 11 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x1b7be_11 ?\<sigma> \<and> block_usage P_0x1b7bc_11_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x1b7bc_11_def P_0x1b7bc_11_regions_def post: Q_0x1b7be_11_def regionset: P_0x1b7bc_11_regions_set_def)

definition P_0x1b7be_true_12 :: state_pred where
  \<open>P_0x1b7be_true_12 \<sigma> \<equiv> RIP \<sigma> = 0x1b7be \<and> RAX \<sigma> = raw_pread_aligned_0x1b7b7_retval \<and> RCX \<sigma> = ucast ((if' ((((\<langle>31,0\<rangle>((R15 \<sigma>::64 word) + 0x1ff)::32 word)::32 word) AND 0xfffffe00)::32 word) >s 0x4000 then 0x4000 else ((((\<langle>31,0\<rangle>((R15 \<sigma>::64 word) + 0x1ff)::32 word)::32 word) AND 0xfffffe00)::32 word))) \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = RBX \<sigma> \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x48) \<and> R13 \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = RDI\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),8]::64 word) = 0x1b7bc\<close>
declare P_0x1b7be_true_12_def[Ps]

definition P_0x1b7be_true_12_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x1b7be_true_12_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((RDI\<^sub>0::64 word) + 0x40), 8),
    (2, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x40), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x50), 8)
  }\<close>

definition P_0x1b7be_true_12_regions :: state_pred where
  \<open>P_0x1b7be_true_12_regions \<sigma> \<equiv> \<exists>regions. P_0x1b7be_true_12_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x1b70a_12 :: state_pred where
  \<open>Q_0x1b70a_12 \<sigma> \<equiv> RIP \<sigma> = 0x1b70a \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x48) \<and> R13 \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = RDI\<^sub>0\<close>
declare Q_0x1b70a_12_def[Qs]

schematic_goal raw_pread_0_1_0x1b7be_0x1b7be_12[blocks]:
  assumes \<open>(P_0x1b7be_true_12 && P_0x1b7be_true_12_regions && SF) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x1b7be 12 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x1b70a_12 ?\<sigma> \<and> block_usage P_0x1b7be_true_12_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x1b7be_true_12_def P_0x1b7be_true_12_regions_def post: Q_0x1b70a_12_def regionset: P_0x1b7be_true_12_regions_set_def)

definition P_0x1b7be_false_13 :: state_pred where
  \<open>P_0x1b7be_false_13 \<sigma> \<equiv> RIP \<sigma> = 0x1b7be \<and> RAX \<sigma> = raw_pread_aligned_0x1b7b7_retval \<and> RCX \<sigma> = ucast ((if' ((((\<langle>31,0\<rangle>((R15 \<sigma>::64 word) + 0x1ff)::32 word)::32 word) AND 0xfffffe00)::32 word) >s 0x4000 then 0x4000 else ((((\<langle>31,0\<rangle>((R15 \<sigma>::64 word) + 0x1ff)::32 word)::32 word) AND 0xfffffe00)::32 word))) \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = RBX \<sigma> \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x48) \<and> R13 \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = RDI\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),8]::64 word) = 0x1b7bc\<close>
declare P_0x1b7be_false_13_def[Ps]

definition P_0x1b7be_false_13_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x1b7be_false_13_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((RDI\<^sub>0::64 word) + 0x40), 8),
    (2, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x40), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x48), 8),
    (11, ((RSP\<^sub>0::64 word) - 0x50), 8)
  }\<close>

definition P_0x1b7be_false_13_regions :: state_pred where
  \<open>P_0x1b7be_false_13_regions \<sigma> \<equiv> \<exists>regions. P_0x1b7be_false_13_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x1b7df_13 :: state_pred where
  \<open>Q_0x1b7df_13 \<sigma> \<equiv> RIP \<sigma> = 0x1b7df \<and> RAX \<sigma> = ucast ((if' ((\<langle>31,0\<rangle>raw_pread_aligned_0x1b7b7_retval::32 word)::32 word) >s (\<langle>31,0\<rangle>R15 \<sigma>::32 word) then (\<langle>31,0\<rangle>R15 \<sigma>::32 word) else ((\<langle>31,0\<rangle>raw_pread_aligned_0x1b7b7_retval::32 word)::32 word))) \<and> RCX \<sigma> = ucast ((if' ((((\<langle>31,0\<rangle>((R15 \<sigma>::64 word) + 0x1ff)::32 word)::32 word) AND 0xfffffe00)::32 word) >s 0x4000 then 0x4000 else ((((\<langle>31,0\<rangle>((R15 \<sigma>::64 word) + 0x1ff)::32 word)::32 word) AND 0xfffffe00)::32 word))) \<and> RDX \<sigma> = (sextend (ucast ((if' ((\<langle>31,0\<rangle>raw_pread_aligned_0x1b7b7_retval::32 word)::32 word) >s (\<langle>31,0\<rangle>R15 \<sigma>::32 word) then (\<langle>31,0\<rangle>R15 \<sigma>::32 word) else ((\<langle>31,0\<rangle>raw_pread_aligned_0x1b7b7_retval::32 word)::32 word)))) 32 64::64 word) \<and> RDI \<sigma> = RBP \<sigma> \<and> RSI \<sigma> = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x48) \<and> R14 \<sigma> = (sextend (ucast ((if' ((\<langle>31,0\<rangle>raw_pread_aligned_0x1b7b7_retval::32 word)::32 word) >s (\<langle>31,0\<rangle>R15 \<sigma>::32 word) then (\<langle>31,0\<rangle>R15 \<sigma>::32 word) else ((\<langle>31,0\<rangle>raw_pread_aligned_0x1b7b7_retval::32 word)::32 word)))) 32 64::64 word) \<and> R13 \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> R9 \<sigma> = (sextend (ucast ((if' ((\<langle>31,0\<rangle>raw_pread_aligned_0x1b7b7_retval::32 word)::32 word) >s (\<langle>31,0\<rangle>R15 \<sigma>::32 word) then (\<langle>31,0\<rangle>R15 \<sigma>::32 word) else ((\<langle>31,0\<rangle>raw_pread_aligned_0x1b7b7_retval::32 word)::32 word)))) 32 64::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = RDI\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x48),8]::64 word) = (sextend (ucast ((if' ((\<langle>31,0\<rangle>raw_pread_aligned_0x1b7b7_retval::32 word)::32 word) >s (\<langle>31,0\<rangle>R15 \<sigma>::32 word) then (\<langle>31,0\<rangle>R15 \<sigma>::32 word) else ((\<langle>31,0\<rangle>raw_pread_aligned_0x1b7b7_retval::32 word)::32 word)))) 32 64::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),8]::64 word) = 0x1b7bc\<close>
declare Q_0x1b7df_13_def[Qs]

schematic_goal raw_pread_0_9_0x1b7be_0x1b7db_13[blocks]:
  assumes \<open>(P_0x1b7be_false_13 && P_0x1b7be_false_13_regions && ! SF) \<sigma>\<close>
  shows \<open>exec_block 9 0x1b7db 13 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x1b7df_13 ?\<sigma> \<and> block_usage P_0x1b7be_false_13_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x1b7be_false_13_def P_0x1b7be_false_13_regions_def post: Q_0x1b7df_13_def regionset: P_0x1b7be_false_13_regions_set_def)

definition P_0x1b7df_14 :: state_pred where
  \<open>P_0x1b7df_14 \<sigma> \<equiv> RIP \<sigma> = 0x1b7df \<and> RAX \<sigma> = ucast ((if' ((\<langle>31,0\<rangle>raw_pread_aligned_0x1b7b7_retval::32 word)::32 word) >s (\<langle>31,0\<rangle>R15 \<sigma>::32 word) then (\<langle>31,0\<rangle>R15 \<sigma>::32 word) else ((\<langle>31,0\<rangle>raw_pread_aligned_0x1b7b7_retval::32 word)::32 word))) \<and> RCX \<sigma> = ucast ((if' ((((\<langle>31,0\<rangle>((R15 \<sigma>::64 word) + 0x1ff)::32 word)::32 word) AND 0xfffffe00)::32 word) >s 0x4000 then 0x4000 else ((((\<langle>31,0\<rangle>((R15 \<sigma>::64 word) + 0x1ff)::32 word)::32 word) AND 0xfffffe00)::32 word))) \<and> RDX \<sigma> = (sextend (ucast ((if' ((\<langle>31,0\<rangle>raw_pread_aligned_0x1b7b7_retval::32 word)::32 word) >s (\<langle>31,0\<rangle>R15 \<sigma>::32 word) then (\<langle>31,0\<rangle>R15 \<sigma>::32 word) else ((\<langle>31,0\<rangle>raw_pread_aligned_0x1b7b7_retval::32 word)::32 word)))) 32 64::64 word) \<and> RDI \<sigma> = RBP \<sigma> \<and> RSI \<sigma> = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x48) \<and> R14 \<sigma> = (sextend (ucast ((if' ((\<langle>31,0\<rangle>raw_pread_aligned_0x1b7b7_retval::32 word)::32 word) >s (\<langle>31,0\<rangle>R15 \<sigma>::32 word) then (\<langle>31,0\<rangle>R15 \<sigma>::32 word) else ((\<langle>31,0\<rangle>raw_pread_aligned_0x1b7b7_retval::32 word)::32 word)))) 32 64::64 word) \<and> R13 \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> R9 \<sigma> = (sextend (ucast ((if' ((\<langle>31,0\<rangle>raw_pread_aligned_0x1b7b7_retval::32 word)::32 word) >s (\<langle>31,0\<rangle>R15 \<sigma>::32 word) then (\<langle>31,0\<rangle>R15 \<sigma>::32 word) else ((\<langle>31,0\<rangle>raw_pread_aligned_0x1b7b7_retval::32 word)::32 word)))) 32 64::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = RDI\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x48),8]::64 word) = (sextend (ucast ((if' ((\<langle>31,0\<rangle>raw_pread_aligned_0x1b7b7_retval::32 word)::32 word) >s (\<langle>31,0\<rangle>R15 \<sigma>::32 word) then (\<langle>31,0\<rangle>R15 \<sigma>::32 word) else ((\<langle>31,0\<rangle>raw_pread_aligned_0x1b7b7_retval::32 word)::32 word)))) 32 64::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),8]::64 word) = 0x1b7bc\<close>
declare P_0x1b7df_14_def[Ps]

definition P_0x1b7df_14_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x1b7df_14_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((RDI\<^sub>0::64 word) + 0x40), 8),
    (2, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x40), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x48), 8),
    (11, ((RSP\<^sub>0::64 word) - 0x50), 8)
  }\<close>

definition P_0x1b7df_14_regions :: state_pred where
  \<open>P_0x1b7df_14_regions \<sigma> \<equiv> \<exists>regions. P_0x1b7df_14_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_memcpy_addr_0x1b7df_14 :: state_pred where
  \<open>Q_memcpy_addr_0x1b7df_14 \<sigma> \<equiv> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x50) \<and> RIP \<sigma> = memcpy_addr \<and> RAX \<sigma> = ucast ((if' ((\<langle>31,0\<rangle>raw_pread_aligned_0x1b7b7_retval::32 word)::32 word) >s (\<langle>31,0\<rangle>R15 \<sigma>::32 word) then (\<langle>31,0\<rangle>R15 \<sigma>::32 word) else ((\<langle>31,0\<rangle>raw_pread_aligned_0x1b7b7_retval::32 word)::32 word))) \<and> RCX \<sigma> = ucast ((if' ((((\<langle>31,0\<rangle>((R15 \<sigma>::64 word) + 0x1ff)::32 word)::32 word) AND 0xfffffe00)::32 word) >s 0x4000 then 0x4000 else ((((\<langle>31,0\<rangle>((R15 \<sigma>::64 word) + 0x1ff)::32 word)::32 word) AND 0xfffffe00)::32 word))) \<and> RDX \<sigma> = (sextend (ucast ((if' ((\<langle>31,0\<rangle>raw_pread_aligned_0x1b7b7_retval::32 word)::32 word) >s (\<langle>31,0\<rangle>R15 \<sigma>::32 word) then (\<langle>31,0\<rangle>R15 \<sigma>::32 word) else ((\<langle>31,0\<rangle>raw_pread_aligned_0x1b7b7_retval::32 word)::32 word)))) 32 64::64 word) \<and> RDI \<sigma> = RBP \<sigma> \<and> RSI \<sigma> = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word) \<and> R14 \<sigma> = (sextend (ucast ((if' ((\<langle>31,0\<rangle>raw_pread_aligned_0x1b7b7_retval::32 word)::32 word) >s (\<langle>31,0\<rangle>R15 \<sigma>::32 word) then (\<langle>31,0\<rangle>R15 \<sigma>::32 word) else ((\<langle>31,0\<rangle>raw_pread_aligned_0x1b7b7_retval::32 word)::32 word)))) 32 64::64 word) \<and> R13 \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> R9 \<sigma> = (sextend (ucast ((if' ((\<langle>31,0\<rangle>raw_pread_aligned_0x1b7b7_retval::32 word)::32 word) >s (\<langle>31,0\<rangle>R15 \<sigma>::32 word) then (\<langle>31,0\<rangle>R15 \<sigma>::32 word) else ((\<langle>31,0\<rangle>raw_pread_aligned_0x1b7b7_retval::32 word)::32 word)))) 32 64::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = RDI\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x48),8]::64 word) = (sextend (ucast ((if' ((\<langle>31,0\<rangle>raw_pread_aligned_0x1b7b7_retval::32 word)::32 word) >s (\<langle>31,0\<rangle>R15 \<sigma>::32 word) then (\<langle>31,0\<rangle>R15 \<sigma>::32 word) else ((\<langle>31,0\<rangle>raw_pread_aligned_0x1b7b7_retval::32 word)::32 word)))) 32 64::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),8]::64 word) = 0x1b7e4\<close>
declare Q_memcpy_addr_0x1b7df_14_def[Qs]

schematic_goal raw_pread_0_1_0x1b7df_0x1b7df_14[blocks]:
  assumes \<open>(P_0x1b7df_14 && P_0x1b7df_14_regions) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x1b7df 14 \<sigma> \<triangleq> ?\<sigma> \<and> Q_memcpy_addr_0x1b7df_14 ?\<sigma> \<and> block_usage P_0x1b7df_14_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x1b7df_14_def P_0x1b7df_14_regions_def post: Q_memcpy_addr_0x1b7df_14_def regionset: P_0x1b7df_14_regions_set_def)

definition P_0x1b7e4_15 :: state_pred where
  \<open>P_0x1b7e4_15 \<sigma> \<equiv> RIP \<sigma> = 0x1b7e4 \<and> RAX \<sigma> = memcpy_0x1b7df_retval \<and> RCX \<sigma> = ucast ((if' ((((\<langle>31,0\<rangle>((R15 \<sigma>::64 word) + 0x1ff)::32 word)::32 word) AND 0xfffffe00)::32 word) >s 0x4000 then 0x4000 else ((((\<langle>31,0\<rangle>((R15 \<sigma>::64 word) + 0x1ff)::32 word)::32 word) AND 0xfffffe00)::32 word))) \<and> RDX \<sigma> = (sextend (ucast ((if' ((\<langle>31,0\<rangle>raw_pread_aligned_0x1b7b7_retval::32 word)::32 word) >s (\<langle>31,0\<rangle>R15 \<sigma>::32 word) then (\<langle>31,0\<rangle>R15 \<sigma>::32 word) else ((\<langle>31,0\<rangle>raw_pread_aligned_0x1b7b7_retval::32 word)::32 word)))) 32 64::64 word) \<and> RDI \<sigma> = RBP \<sigma> \<and> RSI \<sigma> = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x48) \<and> R14 \<sigma> = (sextend (ucast ((if' ((\<langle>31,0\<rangle>raw_pread_aligned_0x1b7b7_retval::32 word)::32 word) >s (\<langle>31,0\<rangle>R15 \<sigma>::32 word) then (\<langle>31,0\<rangle>R15 \<sigma>::32 word) else ((\<langle>31,0\<rangle>raw_pread_aligned_0x1b7b7_retval::32 word)::32 word)))) 32 64::64 word) \<and> R13 \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> R9 \<sigma> = (sextend (ucast ((if' ((\<langle>31,0\<rangle>raw_pread_aligned_0x1b7b7_retval::32 word)::32 word) >s (\<langle>31,0\<rangle>R15 \<sigma>::32 word) then (\<langle>31,0\<rangle>R15 \<sigma>::32 word) else ((\<langle>31,0\<rangle>raw_pread_aligned_0x1b7b7_retval::32 word)::32 word)))) 32 64::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = RDI\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x48),8]::64 word) = (sextend (ucast ((if' ((\<langle>31,0\<rangle>raw_pread_aligned_0x1b7b7_retval::32 word)::32 word) >s (\<langle>31,0\<rangle>R15 \<sigma>::32 word) then (\<langle>31,0\<rangle>R15 \<sigma>::32 word) else ((\<langle>31,0\<rangle>raw_pread_aligned_0x1b7b7_retval::32 word)::32 word)))) 32 64::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),8]::64 word) = 0x1b7e4\<close>
declare P_0x1b7e4_15_def[Ps]

definition P_0x1b7e4_15_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x1b7e4_15_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((RDI\<^sub>0::64 word) + 0x40), 8),
    (2, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x40), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x48), 8),
    (11, ((RSP\<^sub>0::64 word) - 0x50), 8)
  }\<close>

definition P_0x1b7e4_15_regions :: state_pred where
  \<open>P_0x1b7e4_15_regions \<sigma> \<equiv> \<exists>regions. P_0x1b7e4_15_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x1b7f4_15 :: state_pred where
  \<open>Q_0x1b7f4_15 \<sigma> \<equiv> RIP \<sigma> = 0x1b7f4 \<and> RAX \<sigma> = memcpy_0x1b7df_retval \<and> RSI \<sigma> = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x48) \<and> R13 \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = RDI\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),8]::64 word) = 0x1b7e4\<close>
declare Q_0x1b7f4_15_def[Qs]

schematic_goal raw_pread_0_5_0x1b7e4_0x1b7f1_15[blocks]:
  assumes \<open>(P_0x1b7e4_15 && P_0x1b7e4_15_regions) \<sigma>\<close>
  shows \<open>exec_block 5 0x1b7f1 15 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x1b7f4_15 ?\<sigma> \<and> block_usage P_0x1b7e4_15_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x1b7e4_15_def P_0x1b7e4_15_regions_def post: Q_0x1b7f4_15_def regionset: P_0x1b7e4_15_regions_set_def)

definition P_0x1b7f4_true_16 :: state_pred where
  \<open>P_0x1b7f4_true_16 \<sigma> \<equiv> RIP \<sigma> = 0x1b7f4 \<and> RAX \<sigma> = memcpy_0x1b7df_retval \<and> RSI \<sigma> = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x48) \<and> R13 \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = RDI\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),8]::64 word) = 0x1b7e4\<close>
declare P_0x1b7f4_true_16_def[Ps]

<<<<<<< HEAD


=======
>>>>>>> 720d01f42871b7fc47452cfc4b6d3c3cb0d6693e
definition P_0x1b7f4_true_16_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x1b7f4_true_16_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((RDI\<^sub>0::64 word) + 0x40), 8),
    (2, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x40), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x50), 8)
  }\<close>

definition P_0x1b7f4_true_16_regions :: state_pred where
  \<open>P_0x1b7f4_true_16_regions \<sigma> \<equiv> \<exists>regions. P_0x1b7f4_true_16_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x1b794_16 :: state_pred where
  \<open>Q_0x1b794_16 \<sigma> \<equiv> RIP \<sigma> = 0x1b794 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x48) \<and> R13 \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = RDI\<^sub>0\<close>
declare Q_0x1b794_16_def[Qs]

schematic_goal raw_pread_0_2_0x1b7f4_0x1b790_16[blocks]:
  assumes \<open>(P_0x1b7f4_true_16 && P_0x1b7f4_true_16_regions && !ZF) \<sigma>\<close>
  shows \<open>exec_block 2 0x1b790 16 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x1b794_16 ?\<sigma> \<and> block_usage P_0x1b7f4_true_16_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x1b7f4_true_16_def P_0x1b7f4_true_16_regions_def post: Q_0x1b794_16_def regionset: P_0x1b7f4_true_16_regions_set_def)

definition P_0x1b7f4_false_17 :: state_pred where
  \<open>P_0x1b7f4_false_17 \<sigma> \<equiv> RIP \<sigma> = 0x1b7f4 \<and> RAX \<sigma> = memcpy_0x1b7df_retval \<and> RSI \<sigma> = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x48) \<and> R13 \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = RDI\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),8]::64 word) = 0x1b7e4\<close>
declare P_0x1b7f4_false_17_def[Ps]

definition P_0x1b7f4_false_17_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x1b7f4_false_17_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((RDI\<^sub>0::64 word) + 0x40), 8),
    (2, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x40), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x50), 8)
  }\<close>

definition P_0x1b7f4_false_17_regions :: state_pred where
  \<open>P_0x1b7f4_false_17_regions \<sigma> \<equiv> \<exists>regions. P_0x1b7f4_false_17_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x1b7f6_17 :: state_pred where
  \<open>Q_0x1b7f6_17 \<sigma> \<equiv> RIP \<sigma> = 0x1b7f6 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x48) \<and> R13 \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = RDI\<^sub>0\<close>
declare Q_0x1b7f6_17_def[Qs]

schematic_goal raw_pread_0_1_0x1b7f4_0x1b7f4_17[blocks]:
  assumes \<open>(P_0x1b7f4_false_17 && P_0x1b7f4_false_17_regions && ! !ZF) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x1b7f4 17 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x1b7f6_17 ?\<sigma> \<and> block_usage P_0x1b7f4_false_17_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x1b7f4_false_17_def P_0x1b7f4_false_17_regions_def post: Q_0x1b7f6_17_def regionset: P_0x1b7f4_false_17_regions_set_def)

definition P_0x1b7f6_18 :: state_pred where
  \<open>P_0x1b7f6_18 \<sigma> \<equiv> RIP \<sigma> = 0x1b7f6 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x48) \<and> R13 \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = RDI\<^sub>0\<close>
declare P_0x1b7f6_18_def[Ps]

definition P_0x1b7f6_18_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x1b7f6_18_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((RDI\<^sub>0::64 word) + 0x40), 8),
    (2, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x40), 8)
  }\<close>

definition P_0x1b7f6_18_regions :: state_pred where
  \<open>P_0x1b7f6_18_regions \<sigma> \<equiv> \<exists>regions. P_0x1b7f6_18_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_ret_address_18 :: state_pred where
  \<open>Q_ret_address_18 \<sigma> \<equiv> RIP \<sigma> = ret_address \<and> RBX \<sigma> = RBX\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) + 0x8) \<and> RBP \<sigma> = RBP\<^sub>0 \<and> R15 \<sigma> = R15\<^sub>0 \<and> R14 \<sigma> = R14\<^sub>0 \<and> R13 \<sigma> = R13\<^sub>0 \<and> R12 \<sigma> = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = RDI\<^sub>0\<close>
declare Q_ret_address_18_def[Qs]

schematic_goal raw_pread_0_9_0x1b7f6_0x1b807_18[blocks]:
  assumes \<open>(P_0x1b7f6_18 && P_0x1b7f6_18_regions) \<sigma>\<close>
  shows \<open>exec_block 9 0x1b807 18 \<sigma> \<triangleq> ?\<sigma> \<and> Q_ret_address_18 ?\<sigma> \<and> block_usage P_0x1b7f6_18_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x1b7f6_18_def P_0x1b7f6_18_regions_def post: Q_ret_address_18_def regionset: P_0x1b7f6_18_regions_set_def)

definition P_0x1b70a_19 :: state_pred where
  \<open>P_0x1b70a_19 \<sigma> \<equiv> RIP \<sigma> = 0x1b70a \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x48) \<and> R13 \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = RDI\<^sub>0\<close>
declare P_0x1b70a_19_def[Ps]

definition P_0x1b70a_19_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x1b70a_19_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((RDI\<^sub>0::64 word) + 0x40), 8),
    (2, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x40), 8)
  }\<close>

definition P_0x1b70a_19_regions :: state_pred where
  \<open>P_0x1b70a_19_regions \<sigma> \<equiv> \<exists>regions. P_0x1b70a_19_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_ret_address_19 :: state_pred where
  \<open>Q_ret_address_19 \<sigma> \<equiv> RIP \<sigma> = ret_address \<and> RBX \<sigma> = RBX\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) + 0x8) \<and> RBP \<sigma> = RBP\<^sub>0 \<and> R15 \<sigma> = R15\<^sub>0 \<and> R14 \<sigma> = R14\<^sub>0 \<and> R13 \<sigma> = R13\<^sub>0 \<and> R12 \<sigma> = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = RDI\<^sub>0\<close>
declare Q_ret_address_19_def[Qs]

schematic_goal raw_pread_0_8_0x1b70a_0x1b718_19[blocks]:
  assumes \<open>(P_0x1b70a_19 && P_0x1b70a_19_regions) \<sigma>\<close>
  shows \<open>exec_block 8 0x1b718 19 \<sigma> \<triangleq> ?\<sigma> \<and> Q_ret_address_19 ?\<sigma> \<and> block_usage P_0x1b70a_19_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x1b70a_19_def P_0x1b70a_19_regions_def post: Q_ret_address_19_def regionset: P_0x1b70a_19_regions_set_def)

definition P_0x1b6e2_false_20 :: state_pred where
  \<open>P_0x1b6e2_false_20 \<sigma> \<equiv> RIP \<sigma> = 0x1b6e2 \<and> RAX \<sigma> = RAX\<^sub>0 \<and> RBX \<sigma> = RSI\<^sub>0 \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word) \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x48) \<and> RBP \<sigma> = RDX\<^sub>0 \<and> R15 \<sigma> = ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)) \<and> R14 \<sigma> = R14\<^sub>0 \<and> R13 \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> R12 \<sigma> = ucast ((((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) AND 0x1ff)) \<and> R9 \<sigma> = R9\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = RDI\<^sub>0\<close>
declare P_0x1b6e2_false_20_def[Ps]

definition P_0x1b6e2_false_20_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x1b6e2_false_20_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((RDI\<^sub>0::64 word) + 0x40), 8),
    (2, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x40), 8)
  }\<close>

definition P_0x1b6e2_false_20_regions :: state_pred where
  \<open>P_0x1b6e2_false_20_regions \<sigma> \<equiv> \<exists>regions. P_0x1b6e2_false_20_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x1b6ee_20 :: state_pred where
  \<open>Q_0x1b6ee_20 \<sigma> \<equiv> RIP \<sigma> = 0x1b6ee \<and> RAX \<sigma> = RAX\<^sub>0 \<and> RBX \<sigma> = RSI\<^sub>0 \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word) \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x48) \<and> RBP \<sigma> = RDX\<^sub>0 \<and> R15 \<sigma> = ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)) \<and> R14 \<sigma> = R14\<^sub>0 \<and> R13 \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> R12 \<sigma> = ucast ((((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) AND 0x1ff)) \<and> R9 \<sigma> = R9\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = RDI\<^sub>0\<close>
declare Q_0x1b6ee_20_def[Qs]

schematic_goal raw_pread_0_2_0x1b6e2_0x1b6e8_20[blocks]:
  assumes \<open>(P_0x1b6e2_false_20 && P_0x1b6e2_false_20_regions && ! !ZF) \<sigma>\<close>
  shows \<open>exec_block 2 0x1b6e8 20 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x1b6ee_20 ?\<sigma> \<and> block_usage P_0x1b6e2_false_20_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x1b6e2_false_20_def P_0x1b6e2_false_20_regions_def post: Q_0x1b6ee_20_def regionset: P_0x1b6e2_false_20_regions_set_def)

definition P_0x1b6ee_true_21 :: state_pred where
  \<open>P_0x1b6ee_true_21 \<sigma> \<equiv> RIP \<sigma> = 0x1b6ee \<and> RAX \<sigma> = RAX\<^sub>0 \<and> RBX \<sigma> = RSI\<^sub>0 \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word) \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x48) \<and> RBP \<sigma> = RDX\<^sub>0 \<and> R15 \<sigma> = ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)) \<and> R14 \<sigma> = R14\<^sub>0 \<and> R13 \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> R12 \<sigma> = ucast ((((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) AND 0x1ff)) \<and> R9 \<sigma> = R9\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = RDI\<^sub>0\<close>
declare P_0x1b6ee_true_21_def[Ps]

definition P_0x1b6ee_true_21_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x1b6ee_true_21_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((RDI\<^sub>0::64 word) + 0x40), 8),
    (2, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x40), 8)
  }\<close>

definition P_0x1b6ee_true_21_regions :: state_pred where
  \<open>P_0x1b6ee_true_21_regions \<sigma> \<equiv> \<exists>regions. P_0x1b6ee_true_21_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x1b814_21 :: state_pred where
  \<open>Q_0x1b814_21 \<sigma> \<equiv> RIP \<sigma> = 0x1b814 \<and> RAX \<sigma> = 0x0 \<and> RBX \<sigma> = RSI\<^sub>0 \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word) \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x48) \<and> RBP \<sigma> = RDX\<^sub>0 \<and> R15 \<sigma> = ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)) \<and> R14 \<sigma> = R14\<^sub>0 \<and> R13 \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> R12 \<sigma> = ucast ((((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) AND 0x1ff)) \<and> R9 \<sigma> = R9\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = RDI\<^sub>0\<close>
declare Q_0x1b814_21_def[Qs]

schematic_goal raw_pread_0_3_0x1b6ee_0x1b812_21[blocks]:
  assumes \<open>(P_0x1b6ee_true_21 && P_0x1b6ee_true_21_regions && !ZF) \<sigma>\<close>
  shows \<open>exec_block 3 0x1b812 21 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x1b814_21 ?\<sigma> \<and> block_usage P_0x1b6ee_true_21_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x1b6ee_true_21_def P_0x1b6ee_true_21_regions_def post: Q_0x1b814_21_def regionset: P_0x1b6ee_true_21_regions_set_def)

definition P_0x1b814_true_22 :: state_pred where
  \<open>P_0x1b814_true_22 \<sigma> \<equiv> RIP \<sigma> = 0x1b814 \<and> RAX \<sigma> = 0x0 \<and> RBX \<sigma> = RSI\<^sub>0 \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word) \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x48) \<and> RBP \<sigma> = RDX\<^sub>0 \<and> R15 \<sigma> = ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)) \<and> R14 \<sigma> = R14\<^sub>0 \<and> R13 \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> R12 \<sigma> = ucast ((((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) AND 0x1ff)) \<and> R9 \<sigma> = R9\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = RDI\<^sub>0\<close>
declare P_0x1b814_true_22_def[Ps]

definition P_0x1b814_true_22_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x1b814_true_22_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((RDI\<^sub>0::64 word) + 0x40), 8),
    (2, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x40), 8)
  }\<close>

definition P_0x1b814_true_22_regions :: state_pred where
  \<open>P_0x1b814_true_22_regions \<sigma> \<equiv> \<exists>regions. P_0x1b814_true_22_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x1b794_22 :: state_pred where
  \<open>Q_0x1b794_22 \<sigma> \<equiv> RIP \<sigma> = 0x1b794 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x48) \<and> R13 \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = RDI\<^sub>0\<close>
declare Q_0x1b794_22_def[Qs]

schematic_goal raw_pread_0_1_0x1b814_0x1b814_22[blocks]:
  assumes \<open>(P_0x1b814_true_22 && P_0x1b814_true_22_regions && !ZF) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x1b814 22 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x1b794_22 ?\<sigma> \<and> block_usage P_0x1b814_true_22_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x1b814_true_22_def P_0x1b814_true_22_regions_def post: Q_0x1b794_22_def regionset: P_0x1b814_true_22_regions_set_def)

definition P_0x1b794_23 :: state_pred where
  \<open>P_0x1b794_23 \<sigma> \<equiv> RIP \<sigma> = 0x1b794 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x48) \<and> R13 \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = RDI\<^sub>0\<close>
declare P_0x1b794_23_def[Ps]

definition P_0x1b794_23_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x1b794_23_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((RDI\<^sub>0::64 word) + 0x40), 8),
    (2, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x40), 8)
  }\<close>

definition P_0x1b794_23_regions :: state_pred where
  \<open>P_0x1b794_23_regions \<sigma> \<equiv> \<exists>regions. P_0x1b794_23_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x1b7b7_23 :: state_pred where
  \<open>Q_0x1b7b7_23 \<sigma> \<equiv> RIP \<sigma> = 0x1b7b7 \<and> RAX \<sigma> = 0x4000 \<and> RCX \<sigma> = ucast ((if' ((((\<langle>31,0\<rangle>((R15 \<sigma>::64 word) + 0x1ff)::32 word)::32 word) AND 0xfffffe00)::32 word) >s 0x4000 then 0x4000 else ((((\<langle>31,0\<rangle>((R15 \<sigma>::64 word) + 0x1ff)::32 word)::32 word) AND 0xfffffe00)::32 word))) \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = RBX \<sigma> \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x48) \<and> R13 \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = RDI\<^sub>0\<close>
declare Q_0x1b7b7_23_def[Qs]

schematic_goal raw_pread_0_7_0x1b794_0x1b7b4_23[blocks]:
  assumes \<open>(P_0x1b794_23 && P_0x1b794_23_regions) \<sigma>\<close>
  shows \<open>exec_block 7 0x1b7b4 23 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x1b7b7_23 ?\<sigma> \<and> block_usage P_0x1b794_23_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x1b794_23_def P_0x1b794_23_regions_def post: Q_0x1b7b7_23_def regionset: P_0x1b794_23_regions_set_def)

definition P_0x1b7b7_24 :: state_pred where
  \<open>P_0x1b7b7_24 \<sigma> \<equiv> RIP \<sigma> = 0x1b7b7 \<and> RAX \<sigma> = 0x4000 \<and> RCX \<sigma> = ucast ((if' ((((\<langle>31,0\<rangle>((R15 \<sigma>::64 word) + 0x1ff)::32 word)::32 word) AND 0xfffffe00)::32 word) >s 0x4000 then 0x4000 else ((((\<langle>31,0\<rangle>((R15 \<sigma>::64 word) + 0x1ff)::32 word)::32 word) AND 0xfffffe00)::32 word))) \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = RBX \<sigma> \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x48) \<and> R13 \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = RDI\<^sub>0\<close>
declare P_0x1b7b7_24_def[Ps]

definition P_0x1b7b7_24_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x1b7b7_24_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((RDI\<^sub>0::64 word) + 0x40), 8),
    (2, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x40), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x50), 8)
  }\<close>

definition P_0x1b7b7_24_regions :: state_pred where
  \<open>P_0x1b7b7_24_regions \<sigma> \<equiv> \<exists>regions. P_0x1b7b7_24_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_raw_pread_aligned_addr_0x1b7b7_24 :: state_pred where
  \<open>Q_raw_pread_aligned_addr_0x1b7b7_24 \<sigma> \<equiv> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x50) \<and> RIP \<sigma> = raw_pread_aligned_addr \<and> RAX \<sigma> = 0x4000 \<and> RCX \<sigma> = ucast ((if' ((((\<langle>31,0\<rangle>((R15 \<sigma>::64 word) + 0x1ff)::32 word)::32 word) AND 0xfffffe00)::32 word) >s 0x4000 then 0x4000 else ((((\<langle>31,0\<rangle>((R15 \<sigma>::64 word) + 0x1ff)::32 word)::32 word) AND 0xfffffe00)::32 word))) \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = RBX \<sigma> \<and> R13 \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = RDI\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),8]::64 word) = 0x1b7bc\<close>
declare Q_raw_pread_aligned_addr_0x1b7b7_24_def[Qs]

schematic_goal raw_pread_0_1_0x1b7b7_0x1b7b7_24[blocks]:
  assumes \<open>(P_0x1b7b7_24 && P_0x1b7b7_24_regions) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x1b7b7 24 \<sigma> \<triangleq> ?\<sigma> \<and> Q_raw_pread_aligned_addr_0x1b7b7_24 ?\<sigma> \<and> block_usage P_0x1b7b7_24_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x1b7b7_24_def P_0x1b7b7_24_regions_def post: Q_raw_pread_aligned_addr_0x1b7b7_24_def regionset: P_0x1b7b7_24_regions_set_def)

definition P_0x1b7bc_25 :: state_pred where
  \<open>P_0x1b7bc_25 \<sigma> \<equiv> RIP \<sigma> = 0x1b7bc \<and> RAX \<sigma> = raw_pread_aligned_0x1b7b7_retval \<and> RCX \<sigma> = ucast ((if' ((((\<langle>31,0\<rangle>((R15 \<sigma>::64 word) + 0x1ff)::32 word)::32 word) AND 0xfffffe00)::32 word) >s 0x4000 then 0x4000 else ((((\<langle>31,0\<rangle>((R15 \<sigma>::64 word) + 0x1ff)::32 word)::32 word) AND 0xfffffe00)::32 word))) \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = RBX \<sigma> \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x48) \<and> R13 \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = RDI\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),8]::64 word) = 0x1b7bc\<close>
declare P_0x1b7bc_25_def[Ps]

definition P_0x1b7bc_25_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x1b7bc_25_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((RDI\<^sub>0::64 word) + 0x40), 8),
    (2, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x40), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x50), 8)
  }\<close>

definition P_0x1b7bc_25_regions :: state_pred where
  \<open>P_0x1b7bc_25_regions \<sigma> \<equiv> \<exists>regions. P_0x1b7bc_25_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x1b7be_25 :: state_pred where
  \<open>Q_0x1b7be_25 \<sigma> \<equiv> RIP \<sigma> = 0x1b7be \<and> RAX \<sigma> = raw_pread_aligned_0x1b7b7_retval \<and> RCX \<sigma> = ucast ((if' ((((\<langle>31,0\<rangle>((R15 \<sigma>::64 word) + 0x1ff)::32 word)::32 word) AND 0xfffffe00)::32 word) >s 0x4000 then 0x4000 else ((((\<langle>31,0\<rangle>((R15 \<sigma>::64 word) + 0x1ff)::32 word)::32 word) AND 0xfffffe00)::32 word))) \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = RBX \<sigma> \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x48) \<and> R13 \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = RDI\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),8]::64 word) = 0x1b7bc\<close>
declare Q_0x1b7be_25_def[Qs]

schematic_goal raw_pread_0_1_0x1b7bc_0x1b7bc_25[blocks]:
  assumes \<open>(P_0x1b7bc_25 && P_0x1b7bc_25_regions) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x1b7bc 25 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x1b7be_25 ?\<sigma> \<and> block_usage P_0x1b7bc_25_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x1b7bc_25_def P_0x1b7bc_25_regions_def post: Q_0x1b7be_25_def regionset: P_0x1b7bc_25_regions_set_def)

definition P_0x1b7be_true_26 :: state_pred where
  \<open>P_0x1b7be_true_26 \<sigma> \<equiv> RIP \<sigma> = 0x1b7be \<and> RAX \<sigma> = raw_pread_aligned_0x1b7b7_retval \<and> RCX \<sigma> = ucast ((if' ((((\<langle>31,0\<rangle>((R15 \<sigma>::64 word) + 0x1ff)::32 word)::32 word) AND 0xfffffe00)::32 word) >s 0x4000 then 0x4000 else ((((\<langle>31,0\<rangle>((R15 \<sigma>::64 word) + 0x1ff)::32 word)::32 word) AND 0xfffffe00)::32 word))) \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = RBX \<sigma> \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x48) \<and> R13 \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = RDI\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),8]::64 word) = 0x1b7bc\<close>
declare P_0x1b7be_true_26_def[Ps]

definition P_0x1b7be_true_26_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x1b7be_true_26_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((RDI\<^sub>0::64 word) + 0x40), 8),
    (2, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x40), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x50), 8)
  }\<close>

definition P_0x1b7be_true_26_regions :: state_pred where
  \<open>P_0x1b7be_true_26_regions \<sigma> \<equiv> \<exists>regions. P_0x1b7be_true_26_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x1b70a_26 :: state_pred where
  \<open>Q_0x1b70a_26 \<sigma> \<equiv> RIP \<sigma> = 0x1b70a \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x48) \<and> R13 \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = RDI\<^sub>0\<close>
declare Q_0x1b70a_26_def[Qs]

schematic_goal raw_pread_0_1_0x1b7be_0x1b7be_26[blocks]:
  assumes \<open>(P_0x1b7be_true_26 && P_0x1b7be_true_26_regions && SF) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x1b7be 26 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x1b70a_26 ?\<sigma> \<and> block_usage P_0x1b7be_true_26_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x1b7be_true_26_def P_0x1b7be_true_26_regions_def post: Q_0x1b70a_26_def regionset: P_0x1b7be_true_26_regions_set_def)

definition P_0x1b7be_false_27 :: state_pred where
  \<open>P_0x1b7be_false_27 \<sigma> \<equiv> RIP \<sigma> = 0x1b7be \<and> RAX \<sigma> = raw_pread_aligned_0x1b7b7_retval \<and> RCX \<sigma> = ucast ((if' ((((\<langle>31,0\<rangle>((R15 \<sigma>::64 word) + 0x1ff)::32 word)::32 word) AND 0xfffffe00)::32 word) >s 0x4000 then 0x4000 else ((((\<langle>31,0\<rangle>((R15 \<sigma>::64 word) + 0x1ff)::32 word)::32 word) AND 0xfffffe00)::32 word))) \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = RBX \<sigma> \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x48) \<and> R13 \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = RDI\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),8]::64 word) = 0x1b7bc\<close>
declare P_0x1b7be_false_27_def[Ps]

definition P_0x1b7be_false_27_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x1b7be_false_27_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((RDI\<^sub>0::64 word) + 0x40), 8),
    (2, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x40), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x48), 8),
    (11, ((RSP\<^sub>0::64 word) - 0x50), 8)
  }\<close>

definition P_0x1b7be_false_27_regions :: state_pred where
  \<open>P_0x1b7be_false_27_regions \<sigma> \<equiv> \<exists>regions. P_0x1b7be_false_27_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x1b7df_27 :: state_pred where
  \<open>Q_0x1b7df_27 \<sigma> \<equiv> RIP \<sigma> = 0x1b7df \<and> RAX \<sigma> = ucast ((if' ((\<langle>31,0\<rangle>raw_pread_aligned_0x1b7b7_retval::32 word)::32 word) >s (\<langle>31,0\<rangle>R15 \<sigma>::32 word) then (\<langle>31,0\<rangle>R15 \<sigma>::32 word) else ((\<langle>31,0\<rangle>raw_pread_aligned_0x1b7b7_retval::32 word)::32 word))) \<and> RCX \<sigma> = ucast ((if' ((((\<langle>31,0\<rangle>((R15 \<sigma>::64 word) + 0x1ff)::32 word)::32 word) AND 0xfffffe00)::32 word) >s 0x4000 then 0x4000 else ((((\<langle>31,0\<rangle>((R15 \<sigma>::64 word) + 0x1ff)::32 word)::32 word) AND 0xfffffe00)::32 word))) \<and> RDX \<sigma> = (sextend (ucast ((if' ((\<langle>31,0\<rangle>raw_pread_aligned_0x1b7b7_retval::32 word)::32 word) >s (\<langle>31,0\<rangle>R15 \<sigma>::32 word) then (\<langle>31,0\<rangle>R15 \<sigma>::32 word) else ((\<langle>31,0\<rangle>raw_pread_aligned_0x1b7b7_retval::32 word)::32 word)))) 32 64::64 word) \<and> RDI \<sigma> = RBP \<sigma> \<and> RSI \<sigma> = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x48) \<and> R14 \<sigma> = (sextend (ucast ((if' ((\<langle>31,0\<rangle>raw_pread_aligned_0x1b7b7_retval::32 word)::32 word) >s (\<langle>31,0\<rangle>R15 \<sigma>::32 word) then (\<langle>31,0\<rangle>R15 \<sigma>::32 word) else ((\<langle>31,0\<rangle>raw_pread_aligned_0x1b7b7_retval::32 word)::32 word)))) 32 64::64 word) \<and> R13 \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> R9 \<sigma> = (sextend (ucast ((if' ((\<langle>31,0\<rangle>raw_pread_aligned_0x1b7b7_retval::32 word)::32 word) >s (\<langle>31,0\<rangle>R15 \<sigma>::32 word) then (\<langle>31,0\<rangle>R15 \<sigma>::32 word) else ((\<langle>31,0\<rangle>raw_pread_aligned_0x1b7b7_retval::32 word)::32 word)))) 32 64::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = RDI\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x48),8]::64 word) = (sextend (ucast ((if' ((\<langle>31,0\<rangle>raw_pread_aligned_0x1b7b7_retval::32 word)::32 word) >s (\<langle>31,0\<rangle>R15 \<sigma>::32 word) then (\<langle>31,0\<rangle>R15 \<sigma>::32 word) else ((\<langle>31,0\<rangle>raw_pread_aligned_0x1b7b7_retval::32 word)::32 word)))) 32 64::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),8]::64 word) = 0x1b7bc\<close>
declare Q_0x1b7df_27_def[Qs]

schematic_goal raw_pread_0_9_0x1b7be_0x1b7db_27[blocks]:
  assumes \<open>(P_0x1b7be_false_27 && P_0x1b7be_false_27_regions && ! SF) \<sigma>\<close>
  shows \<open>exec_block 9 0x1b7db 27 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x1b7df_27 ?\<sigma> \<and> block_usage P_0x1b7be_false_27_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x1b7be_false_27_def P_0x1b7be_false_27_regions_def post: Q_0x1b7df_27_def regionset: P_0x1b7be_false_27_regions_set_def)

definition P_0x1b7df_28 :: state_pred where
  \<open>P_0x1b7df_28 \<sigma> \<equiv> RIP \<sigma> = 0x1b7df \<and> RAX \<sigma> = ucast ((if' ((\<langle>31,0\<rangle>raw_pread_aligned_0x1b7b7_retval::32 word)::32 word) >s (\<langle>31,0\<rangle>R15 \<sigma>::32 word) then (\<langle>31,0\<rangle>R15 \<sigma>::32 word) else ((\<langle>31,0\<rangle>raw_pread_aligned_0x1b7b7_retval::32 word)::32 word))) \<and> RCX \<sigma> = ucast ((if' ((((\<langle>31,0\<rangle>((R15 \<sigma>::64 word) + 0x1ff)::32 word)::32 word) AND 0xfffffe00)::32 word) >s 0x4000 then 0x4000 else ((((\<langle>31,0\<rangle>((R15 \<sigma>::64 word) + 0x1ff)::32 word)::32 word) AND 0xfffffe00)::32 word))) \<and> RDX \<sigma> = (sextend (ucast ((if' ((\<langle>31,0\<rangle>raw_pread_aligned_0x1b7b7_retval::32 word)::32 word) >s (\<langle>31,0\<rangle>R15 \<sigma>::32 word) then (\<langle>31,0\<rangle>R15 \<sigma>::32 word) else ((\<langle>31,0\<rangle>raw_pread_aligned_0x1b7b7_retval::32 word)::32 word)))) 32 64::64 word) \<and> RDI \<sigma> = RBP \<sigma> \<and> RSI \<sigma> = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x48) \<and> R14 \<sigma> = (sextend (ucast ((if' ((\<langle>31,0\<rangle>raw_pread_aligned_0x1b7b7_retval::32 word)::32 word) >s (\<langle>31,0\<rangle>R15 \<sigma>::32 word) then (\<langle>31,0\<rangle>R15 \<sigma>::32 word) else ((\<langle>31,0\<rangle>raw_pread_aligned_0x1b7b7_retval::32 word)::32 word)))) 32 64::64 word) \<and> R13 \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> R9 \<sigma> = (sextend (ucast ((if' ((\<langle>31,0\<rangle>raw_pread_aligned_0x1b7b7_retval::32 word)::32 word) >s (\<langle>31,0\<rangle>R15 \<sigma>::32 word) then (\<langle>31,0\<rangle>R15 \<sigma>::32 word) else ((\<langle>31,0\<rangle>raw_pread_aligned_0x1b7b7_retval::32 word)::32 word)))) 32 64::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = RDI\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x48),8]::64 word) = (sextend (ucast ((if' ((\<langle>31,0\<rangle>raw_pread_aligned_0x1b7b7_retval::32 word)::32 word) >s (\<langle>31,0\<rangle>R15 \<sigma>::32 word) then (\<langle>31,0\<rangle>R15 \<sigma>::32 word) else ((\<langle>31,0\<rangle>raw_pread_aligned_0x1b7b7_retval::32 word)::32 word)))) 32 64::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),8]::64 word) = 0x1b7bc\<close>
declare P_0x1b7df_28_def[Ps]

definition P_0x1b7df_28_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x1b7df_28_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((RDI\<^sub>0::64 word) + 0x40), 8),
    (2, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x40), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x48), 8),
    (11, ((RSP\<^sub>0::64 word) - 0x50), 8)
  }\<close>

definition P_0x1b7df_28_regions :: state_pred where
  \<open>P_0x1b7df_28_regions \<sigma> \<equiv> \<exists>regions. P_0x1b7df_28_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_memcpy_addr_0x1b7df_28 :: state_pred where
  \<open>Q_memcpy_addr_0x1b7df_28 \<sigma> \<equiv> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x50) \<and> RIP \<sigma> = memcpy_addr \<and> RAX \<sigma> = ucast ((if' ((\<langle>31,0\<rangle>raw_pread_aligned_0x1b7b7_retval::32 word)::32 word) >s (\<langle>31,0\<rangle>R15 \<sigma>::32 word) then (\<langle>31,0\<rangle>R15 \<sigma>::32 word) else ((\<langle>31,0\<rangle>raw_pread_aligned_0x1b7b7_retval::32 word)::32 word))) \<and> RCX \<sigma> = ucast ((if' ((((\<langle>31,0\<rangle>((R15 \<sigma>::64 word) + 0x1ff)::32 word)::32 word) AND 0xfffffe00)::32 word) >s 0x4000 then 0x4000 else ((((\<langle>31,0\<rangle>((R15 \<sigma>::64 word) + 0x1ff)::32 word)::32 word) AND 0xfffffe00)::32 word))) \<and> RDX \<sigma> = (sextend (ucast ((if' ((\<langle>31,0\<rangle>raw_pread_aligned_0x1b7b7_retval::32 word)::32 word) >s (\<langle>31,0\<rangle>R15 \<sigma>::32 word) then (\<langle>31,0\<rangle>R15 \<sigma>::32 word) else ((\<langle>31,0\<rangle>raw_pread_aligned_0x1b7b7_retval::32 word)::32 word)))) 32 64::64 word) \<and> RDI \<sigma> = RBP \<sigma> \<and> RSI \<sigma> = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word) \<and> R14 \<sigma> = (sextend (ucast ((if' ((\<langle>31,0\<rangle>raw_pread_aligned_0x1b7b7_retval::32 word)::32 word) >s (\<langle>31,0\<rangle>R15 \<sigma>::32 word) then (\<langle>31,0\<rangle>R15 \<sigma>::32 word) else ((\<langle>31,0\<rangle>raw_pread_aligned_0x1b7b7_retval::32 word)::32 word)))) 32 64::64 word) \<and> R13 \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> R9 \<sigma> = (sextend (ucast ((if' ((\<langle>31,0\<rangle>raw_pread_aligned_0x1b7b7_retval::32 word)::32 word) >s (\<langle>31,0\<rangle>R15 \<sigma>::32 word) then (\<langle>31,0\<rangle>R15 \<sigma>::32 word) else ((\<langle>31,0\<rangle>raw_pread_aligned_0x1b7b7_retval::32 word)::32 word)))) 32 64::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = RDI\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x48),8]::64 word) = (sextend (ucast ((if' ((\<langle>31,0\<rangle>raw_pread_aligned_0x1b7b7_retval::32 word)::32 word) >s (\<langle>31,0\<rangle>R15 \<sigma>::32 word) then (\<langle>31,0\<rangle>R15 \<sigma>::32 word) else ((\<langle>31,0\<rangle>raw_pread_aligned_0x1b7b7_retval::32 word)::32 word)))) 32 64::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),8]::64 word) = 0x1b7e4\<close>
declare Q_memcpy_addr_0x1b7df_28_def[Qs]

schematic_goal raw_pread_0_1_0x1b7df_0x1b7df_28[blocks]:
  assumes \<open>(P_0x1b7df_28 && P_0x1b7df_28_regions) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x1b7df 28 \<sigma> \<triangleq> ?\<sigma> \<and> Q_memcpy_addr_0x1b7df_28 ?\<sigma> \<and> block_usage P_0x1b7df_28_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x1b7df_28_def P_0x1b7df_28_regions_def post: Q_memcpy_addr_0x1b7df_28_def regionset: P_0x1b7df_28_regions_set_def)

definition P_0x1b7e4_29 :: state_pred where
  \<open>P_0x1b7e4_29 \<sigma> \<equiv> RIP \<sigma> = 0x1b7e4 \<and> RAX \<sigma> = memcpy_0x1b7df_retval \<and> RCX \<sigma> = ucast ((if' ((((\<langle>31,0\<rangle>((R15 \<sigma>::64 word) + 0x1ff)::32 word)::32 word) AND 0xfffffe00)::32 word) >s 0x4000 then 0x4000 else ((((\<langle>31,0\<rangle>((R15 \<sigma>::64 word) + 0x1ff)::32 word)::32 word) AND 0xfffffe00)::32 word))) \<and> RDX \<sigma> = (sextend (ucast ((if' ((\<langle>31,0\<rangle>raw_pread_aligned_0x1b7b7_retval::32 word)::32 word) >s (\<langle>31,0\<rangle>R15 \<sigma>::32 word) then (\<langle>31,0\<rangle>R15 \<sigma>::32 word) else ((\<langle>31,0\<rangle>raw_pread_aligned_0x1b7b7_retval::32 word)::32 word)))) 32 64::64 word) \<and> RDI \<sigma> = RBP \<sigma> \<and> RSI \<sigma> = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x48) \<and> R14 \<sigma> = (sextend (ucast ((if' ((\<langle>31,0\<rangle>raw_pread_aligned_0x1b7b7_retval::32 word)::32 word) >s (\<langle>31,0\<rangle>R15 \<sigma>::32 word) then (\<langle>31,0\<rangle>R15 \<sigma>::32 word) else ((\<langle>31,0\<rangle>raw_pread_aligned_0x1b7b7_retval::32 word)::32 word)))) 32 64::64 word) \<and> R13 \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> R9 \<sigma> = (sextend (ucast ((if' ((\<langle>31,0\<rangle>raw_pread_aligned_0x1b7b7_retval::32 word)::32 word) >s (\<langle>31,0\<rangle>R15 \<sigma>::32 word) then (\<langle>31,0\<rangle>R15 \<sigma>::32 word) else ((\<langle>31,0\<rangle>raw_pread_aligned_0x1b7b7_retval::32 word)::32 word)))) 32 64::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = RDI\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x48),8]::64 word) = (sextend (ucast ((if' ((\<langle>31,0\<rangle>raw_pread_aligned_0x1b7b7_retval::32 word)::32 word) >s (\<langle>31,0\<rangle>R15 \<sigma>::32 word) then (\<langle>31,0\<rangle>R15 \<sigma>::32 word) else ((\<langle>31,0\<rangle>raw_pread_aligned_0x1b7b7_retval::32 word)::32 word)))) 32 64::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),8]::64 word) = 0x1b7e4\<close>
declare P_0x1b7e4_29_def[Ps]

definition P_0x1b7e4_29_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x1b7e4_29_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((RDI\<^sub>0::64 word) + 0x40), 8),
    (2, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x40), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x48), 8),
    (11, ((RSP\<^sub>0::64 word) - 0x50), 8)
  }\<close>

definition P_0x1b7e4_29_regions :: state_pred where
  \<open>P_0x1b7e4_29_regions \<sigma> \<equiv> \<exists>regions. P_0x1b7e4_29_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x1b7f4_29 :: state_pred where
  \<open>Q_0x1b7f4_29 \<sigma> \<equiv> RIP \<sigma> = 0x1b7f4 \<and> RAX \<sigma> = memcpy_0x1b7df_retval \<and> RSI \<sigma> = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x48) \<and> R13 \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = RDI\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),8]::64 word) = 0x1b7e4\<close>
declare Q_0x1b7f4_29_def[Qs]

schematic_goal raw_pread_0_5_0x1b7e4_0x1b7f1_29[blocks]:
  assumes \<open>(P_0x1b7e4_29 && P_0x1b7e4_29_regions) \<sigma>\<close>
  shows \<open>exec_block 5 0x1b7f1 29 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x1b7f4_29 ?\<sigma> \<and> block_usage P_0x1b7e4_29_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x1b7e4_29_def P_0x1b7e4_29_regions_def post: Q_0x1b7f4_29_def regionset: P_0x1b7e4_29_regions_set_def)

definition P_0x1b7f4_true_30 :: state_pred where
  \<open>P_0x1b7f4_true_30 \<sigma> \<equiv> RIP \<sigma> = 0x1b7f4 \<and> RAX \<sigma> = memcpy_0x1b7df_retval \<and> RSI \<sigma> = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x48) \<and> R13 \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = RDI\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),8]::64 word) = 0x1b7e4\<close>
declare P_0x1b7f4_true_30_def[Ps]

definition P_0x1b7f4_true_30_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x1b7f4_true_30_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((RDI\<^sub>0::64 word) + 0x40), 8),
    (2, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x40), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x50), 8)
  }\<close>

definition P_0x1b7f4_true_30_regions :: state_pred where
  \<open>P_0x1b7f4_true_30_regions \<sigma> \<equiv> \<exists>regions. P_0x1b7f4_true_30_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x1b794_30 :: state_pred where
  \<open>Q_0x1b794_30 \<sigma> \<equiv> RIP \<sigma> = 0x1b794 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x48) \<and> R13 \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = RDI\<^sub>0\<close>
declare Q_0x1b794_30_def[Qs]

schematic_goal raw_pread_0_2_0x1b7f4_0x1b790_30[blocks]:
  assumes \<open>(P_0x1b7f4_true_30 && P_0x1b7f4_true_30_regions && !ZF) \<sigma>\<close>
  shows \<open>exec_block 2 0x1b790 30 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x1b794_30 ?\<sigma> \<and> block_usage P_0x1b7f4_true_30_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x1b7f4_true_30_def P_0x1b7f4_true_30_regions_def post: Q_0x1b794_30_def regionset: P_0x1b7f4_true_30_regions_set_def)

definition P_0x1b7f4_false_31 :: state_pred where
  \<open>P_0x1b7f4_false_31 \<sigma> \<equiv> RIP \<sigma> = 0x1b7f4 \<and> RAX \<sigma> = memcpy_0x1b7df_retval \<and> RSI \<sigma> = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x48) \<and> R13 \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = RDI\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),8]::64 word) = 0x1b7e4\<close>
declare P_0x1b7f4_false_31_def[Ps]

definition P_0x1b7f4_false_31_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x1b7f4_false_31_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((RDI\<^sub>0::64 word) + 0x40), 8),
    (2, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x40), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x50), 8)
  }\<close>

definition P_0x1b7f4_false_31_regions :: state_pred where
  \<open>P_0x1b7f4_false_31_regions \<sigma> \<equiv> \<exists>regions. P_0x1b7f4_false_31_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x1b7f6_31 :: state_pred where
  \<open>Q_0x1b7f6_31 \<sigma> \<equiv> RIP \<sigma> = 0x1b7f6 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x48) \<and> R13 \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = RDI\<^sub>0\<close>
declare Q_0x1b7f6_31_def[Qs]

schematic_goal raw_pread_0_1_0x1b7f4_0x1b7f4_31[blocks]:
  assumes \<open>(P_0x1b7f4_false_31 && P_0x1b7f4_false_31_regions && ! !ZF) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x1b7f4 31 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x1b7f6_31 ?\<sigma> \<and> block_usage P_0x1b7f4_false_31_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x1b7f4_false_31_def P_0x1b7f4_false_31_regions_def post: Q_0x1b7f6_31_def regionset: P_0x1b7f4_false_31_regions_set_def)

definition P_0x1b7f6_32 :: state_pred where
  \<open>P_0x1b7f6_32 \<sigma> \<equiv> RIP \<sigma> = 0x1b7f6 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x48) \<and> R13 \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = RDI\<^sub>0\<close>
declare P_0x1b7f6_32_def[Ps]

definition P_0x1b7f6_32_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x1b7f6_32_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((RDI\<^sub>0::64 word) + 0x40), 8),
    (2, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x40), 8)
  }\<close>

definition P_0x1b7f6_32_regions :: state_pred where
  \<open>P_0x1b7f6_32_regions \<sigma> \<equiv> \<exists>regions. P_0x1b7f6_32_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_ret_address_32 :: state_pred where
  \<open>Q_ret_address_32 \<sigma> \<equiv> RIP \<sigma> = ret_address \<and> RBX \<sigma> = RBX\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) + 0x8) \<and> RBP \<sigma> = RBP\<^sub>0 \<and> R15 \<sigma> = R15\<^sub>0 \<and> R14 \<sigma> = R14\<^sub>0 \<and> R13 \<sigma> = R13\<^sub>0 \<and> R12 \<sigma> = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = RDI\<^sub>0\<close>
declare Q_ret_address_32_def[Qs]

schematic_goal raw_pread_0_9_0x1b7f6_0x1b807_32[blocks]:
  assumes \<open>(P_0x1b7f6_32 && P_0x1b7f6_32_regions) \<sigma>\<close>
  shows \<open>exec_block 9 0x1b807 32 \<sigma> \<triangleq> ?\<sigma> \<and> Q_ret_address_32 ?\<sigma> \<and> block_usage P_0x1b7f6_32_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x1b7f6_32_def P_0x1b7f6_32_regions_def post: Q_ret_address_32_def regionset: P_0x1b7f6_32_regions_set_def)

definition P_0x1b70a_33 :: state_pred where
  \<open>P_0x1b70a_33 \<sigma> \<equiv> RIP \<sigma> = 0x1b70a \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x48) \<and> R13 \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = RDI\<^sub>0\<close>
declare P_0x1b70a_33_def[Ps]

definition P_0x1b70a_33_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x1b70a_33_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((RDI\<^sub>0::64 word) + 0x40), 8),
    (2, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x40), 8)
  }\<close>

definition P_0x1b70a_33_regions :: state_pred where
  \<open>P_0x1b70a_33_regions \<sigma> \<equiv> \<exists>regions. P_0x1b70a_33_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_ret_address_33 :: state_pred where
  \<open>Q_ret_address_33 \<sigma> \<equiv> RIP \<sigma> = ret_address \<and> RBX \<sigma> = RBX\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) + 0x8) \<and> RBP \<sigma> = RBP\<^sub>0 \<and> R15 \<sigma> = R15\<^sub>0 \<and> R14 \<sigma> = R14\<^sub>0 \<and> R13 \<sigma> = R13\<^sub>0 \<and> R12 \<sigma> = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = RDI\<^sub>0\<close>
declare Q_ret_address_33_def[Qs]

schematic_goal raw_pread_0_8_0x1b70a_0x1b718_33[blocks]:
  assumes \<open>(P_0x1b70a_33 && P_0x1b70a_33_regions) \<sigma>\<close>
  shows \<open>exec_block 8 0x1b718 33 \<sigma> \<triangleq> ?\<sigma> \<and> Q_ret_address_33 ?\<sigma> \<and> block_usage P_0x1b70a_33_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x1b70a_33_def P_0x1b70a_33_regions_def post: Q_ret_address_33_def regionset: P_0x1b70a_33_regions_set_def)

definition P_0x1b814_false_34 :: state_pred where
  \<open>P_0x1b814_false_34 \<sigma> \<equiv> RIP \<sigma> = 0x1b814 \<and> RAX \<sigma> = 0x0 \<and> RBX \<sigma> = RSI\<^sub>0 \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word) \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x48) \<and> RBP \<sigma> = RDX\<^sub>0 \<and> R15 \<sigma> = ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)) \<and> R14 \<sigma> = R14\<^sub>0 \<and> R13 \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> R12 \<sigma> = ucast ((((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) AND 0x1ff)) \<and> R9 \<sigma> = R9\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = RDI\<^sub>0\<close>
declare P_0x1b814_false_34_def[Ps]

definition P_0x1b814_false_34_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x1b814_false_34_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((RDI\<^sub>0::64 word) + 0x40), 8),
    (2, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x40), 8)
  }\<close>

definition P_0x1b814_false_34_regions :: state_pred where
  \<open>P_0x1b814_false_34_regions \<sigma> \<equiv> \<exists>regions. P_0x1b814_false_34_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x1b70a_34 :: state_pred where
  \<open>Q_0x1b70a_34 \<sigma> \<equiv> RIP \<sigma> = 0x1b70a \<and> RAX \<sigma> = 0x0 \<and> RBX \<sigma> = RSI\<^sub>0 \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word) \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x48) \<and> RBP \<sigma> = RDX\<^sub>0 \<and> R15 \<sigma> = ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)) \<and> R14 \<sigma> = R14\<^sub>0 \<and> R13 \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> R12 \<sigma> = ucast ((((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) AND 0x1ff)) \<and> R9 \<sigma> = R9\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = RDI\<^sub>0\<close>
declare Q_0x1b70a_34_def[Qs]

schematic_goal raw_pread_0_2_0x1b814_0x1b81a_34[blocks]:
  assumes \<open>(P_0x1b814_false_34 && P_0x1b814_false_34_regions && ! !ZF) \<sigma>\<close>
  shows \<open>exec_block 2 0x1b81a 34 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x1b70a_34 ?\<sigma> \<and> block_usage P_0x1b814_false_34_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x1b814_false_34_def P_0x1b814_false_34_regions_def post: Q_0x1b70a_34_def regionset: P_0x1b814_false_34_regions_set_def)

definition P_0x1b70a_35 :: state_pred where
  \<open>P_0x1b70a_35 \<sigma> \<equiv> RIP \<sigma> = 0x1b70a \<and> RAX \<sigma> = 0x0 \<and> RBX \<sigma> = RSI\<^sub>0 \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word) \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x48) \<and> RBP \<sigma> = RDX\<^sub>0 \<and> R15 \<sigma> = ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)) \<and> R14 \<sigma> = R14\<^sub>0 \<and> R13 \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> R12 \<sigma> = ucast ((((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) AND 0x1ff)) \<and> R9 \<sigma> = R9\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = RDI\<^sub>0\<close>
declare P_0x1b70a_35_def[Ps]

definition P_0x1b70a_35_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x1b70a_35_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((RDI\<^sub>0::64 word) + 0x40), 8),
    (2, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x40), 8)
  }\<close>

definition P_0x1b70a_35_regions :: state_pred where
  \<open>P_0x1b70a_35_regions \<sigma> \<equiv> \<exists>regions. P_0x1b70a_35_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_ret_address_35 :: state_pred where
  \<open>Q_ret_address_35 \<sigma> \<equiv> RIP \<sigma> = ret_address \<and> RBX \<sigma> = RBX\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) + 0x8) \<and> RBP \<sigma> = RBP\<^sub>0 \<and> R15 \<sigma> = R15\<^sub>0 \<and> R14 \<sigma> = R14\<^sub>0 \<and> R13 \<sigma> = R13\<^sub>0 \<and> R12 \<sigma> = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = RDI\<^sub>0\<close>
declare Q_ret_address_35_def[Qs]

schematic_goal raw_pread_0_8_0x1b70a_0x1b718_35[blocks]:
  assumes \<open>(P_0x1b70a_35 && P_0x1b70a_35_regions) \<sigma>\<close>
  shows \<open>exec_block 8 0x1b718 35 \<sigma> \<triangleq> ?\<sigma> \<and> Q_ret_address_35 ?\<sigma> \<and> block_usage P_0x1b70a_35_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x1b70a_35_def P_0x1b70a_35_regions_def post: Q_ret_address_35_def regionset: P_0x1b70a_35_regions_set_def)

definition P_0x1b6ee_false_36 :: state_pred where
  \<open>P_0x1b6ee_false_36 \<sigma> \<equiv> RIP \<sigma> = 0x1b6ee \<and> RAX \<sigma> = RAX\<^sub>0 \<and> RBX \<sigma> = RSI\<^sub>0 \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word) \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x48) \<and> RBP \<sigma> = RDX\<^sub>0 \<and> R15 \<sigma> = ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)) \<and> R14 \<sigma> = R14\<^sub>0 \<and> R13 \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> R12 \<sigma> = ucast ((((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) AND 0x1ff)) \<and> R9 \<sigma> = R9\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = RDI\<^sub>0\<close>
declare P_0x1b6ee_false_36_def[Ps]

definition P_0x1b6ee_false_36_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x1b6ee_false_36_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((RDI\<^sub>0::64 word) + 0x40), 8),
    (2, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x40), 8)
  }\<close>

definition P_0x1b6ee_false_36_regions :: state_pred where
  \<open>P_0x1b6ee_false_36_regions \<sigma> \<equiv> \<exists>regions. P_0x1b6ee_false_36_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x1b702_36 :: state_pred where
  \<open>Q_0x1b702_36 \<sigma> \<equiv> RIP \<sigma> = 0x1b702 \<and> RAX \<sigma> = RAX\<^sub>0 \<and> RBX \<sigma> = RSI\<^sub>0 \<and> RCX \<sigma> = ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)) \<and> RDX \<sigma> = RDX\<^sub>0 \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x48) \<and> RBP \<sigma> = RDX\<^sub>0 \<and> R15 \<sigma> = ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)) \<and> R14 \<sigma> = R14\<^sub>0 \<and> R13 \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> R12 \<sigma> = ucast ((((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) AND 0x1ff)) \<and> R9 \<sigma> = R9\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = RDI\<^sub>0\<close>
declare Q_0x1b702_36_def[Qs]

schematic_goal raw_pread_0_5_0x1b6ee_0x1b6ff_36[blocks]:
  assumes \<open>(P_0x1b6ee_false_36 && P_0x1b6ee_false_36_regions && ! !ZF) \<sigma>\<close>
  shows \<open>exec_block 5 0x1b6ff 36 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x1b702_36 ?\<sigma> \<and> block_usage P_0x1b6ee_false_36_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x1b6ee_false_36_def P_0x1b6ee_false_36_regions_def post: Q_0x1b702_36_def regionset: P_0x1b6ee_false_36_regions_set_def)

definition P_0x1b702_37 :: state_pred where
  \<open>P_0x1b702_37 \<sigma> \<equiv> RIP \<sigma> = 0x1b702 \<and> RAX \<sigma> = RAX\<^sub>0 \<and> RBX \<sigma> = RSI\<^sub>0 \<and> RCX \<sigma> = ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)) \<and> RDX \<sigma> = RDX\<^sub>0 \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x48) \<and> RBP \<sigma> = RDX\<^sub>0 \<and> R15 \<sigma> = ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)) \<and> R14 \<sigma> = R14\<^sub>0 \<and> R13 \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> R12 \<sigma> = ucast ((((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) AND 0x1ff)) \<and> R9 \<sigma> = R9\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = RDI\<^sub>0\<close>
declare P_0x1b702_37_def[Ps]

definition P_0x1b702_37_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x1b702_37_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((RDI\<^sub>0::64 word) + 0x40), 8),
    (2, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x40), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x50), 8)
  }\<close>

definition P_0x1b702_37_regions :: state_pred where
  \<open>P_0x1b702_37_regions \<sigma> \<equiv> \<exists>regions. P_0x1b702_37_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_raw_pread_aligned_addr_0x1b702_37 :: state_pred where
  \<open>Q_raw_pread_aligned_addr_0x1b702_37 \<sigma> \<equiv> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x50) \<and> RIP \<sigma> = raw_pread_aligned_addr \<and> RAX \<sigma> = RAX\<^sub>0 \<and> RBX \<sigma> = RSI\<^sub>0 \<and> RCX \<sigma> = ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)) \<and> RDX \<sigma> = RDX\<^sub>0 \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RBP \<sigma> = RDX\<^sub>0 \<and> R15 \<sigma> = ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)) \<and> R14 \<sigma> = R14\<^sub>0 \<and> R13 \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> R12 \<sigma> = ucast ((((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) AND 0x1ff)) \<and> R9 \<sigma> = R9\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = RDI\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),8]::64 word) = 0x1b707\<close>
declare Q_raw_pread_aligned_addr_0x1b702_37_def[Qs]

schematic_goal raw_pread_0_1_0x1b702_0x1b702_37[blocks]:
  assumes \<open>(P_0x1b702_37 && P_0x1b702_37_regions) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x1b702 37 \<sigma> \<triangleq> ?\<sigma> \<and> Q_raw_pread_aligned_addr_0x1b702_37 ?\<sigma> \<and> block_usage P_0x1b702_37_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x1b702_37_def P_0x1b702_37_regions_def post: Q_raw_pread_aligned_addr_0x1b702_37_def regionset: P_0x1b702_37_regions_set_def)

definition P_0x1b707_38 :: state_pred where
  \<open>P_0x1b707_38 \<sigma> \<equiv> RIP \<sigma> = 0x1b707 \<and> RAX \<sigma> = raw_pread_aligned_0x1b702_retval \<and> RBX \<sigma> = RSI\<^sub>0 \<and> RCX \<sigma> = ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)) \<and> RDX \<sigma> = RDX\<^sub>0 \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x48) \<and> RBP \<sigma> = RDX\<^sub>0 \<and> R15 \<sigma> = ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)) \<and> R14 \<sigma> = R14\<^sub>0 \<and> R13 \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> R12 \<sigma> = ucast ((((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) AND 0x1ff)) \<and> R9 \<sigma> = R9\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = RDI\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),8]::64 word) = 0x1b707\<close>
declare P_0x1b707_38_def[Ps]

definition P_0x1b707_38_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x1b707_38_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((RDI\<^sub>0::64 word) + 0x40), 8),
    (2, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x40), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x50), 8)
  }\<close>

definition P_0x1b707_38_regions :: state_pred where
  \<open>P_0x1b707_38_regions \<sigma> \<equiv> \<exists>regions. P_0x1b707_38_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x1b70a_38 :: state_pred where
  \<open>Q_0x1b70a_38 \<sigma> \<equiv> RIP \<sigma> = 0x1b70a \<and> RAX \<sigma> = ucast ((((\<langle>31,0\<rangle>raw_pread_aligned_0x1b702_retval::32 word)::32 word) + (((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) AND 0x1ff))) \<and> RBX \<sigma> = RSI\<^sub>0 \<and> RCX \<sigma> = ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)) \<and> RDX \<sigma> = RDX\<^sub>0 \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x48) \<and> RBP \<sigma> = RDX\<^sub>0 \<and> R15 \<sigma> = ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)) \<and> R14 \<sigma> = R14\<^sub>0 \<and> R13 \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> R12 \<sigma> = ucast ((((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) AND 0x1ff)) \<and> R9 \<sigma> = R9\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = RDI\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),8]::64 word) = 0x1b707\<close>
declare Q_0x1b70a_38_def[Qs]

schematic_goal raw_pread_0_1_0x1b707_0x1b707_38[blocks]:
  assumes \<open>(P_0x1b707_38 && P_0x1b707_38_regions) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x1b707 38 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x1b70a_38 ?\<sigma> \<and> block_usage P_0x1b707_38_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x1b707_38_def P_0x1b707_38_regions_def post: Q_0x1b70a_38_def regionset: P_0x1b707_38_regions_set_def)

definition P_0x1b70a_39 :: state_pred where
  \<open>P_0x1b70a_39 \<sigma> \<equiv> RIP \<sigma> = 0x1b70a \<and> RAX \<sigma> = ucast ((((\<langle>31,0\<rangle>raw_pread_aligned_0x1b702_retval::32 word)::32 word) + (((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) AND 0x1ff))) \<and> RBX \<sigma> = RSI\<^sub>0 \<and> RCX \<sigma> = ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)) \<and> RDX \<sigma> = RDX\<^sub>0 \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x48) \<and> RBP \<sigma> = RDX\<^sub>0 \<and> R15 \<sigma> = ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)) \<and> R14 \<sigma> = R14\<^sub>0 \<and> R13 \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> R12 \<sigma> = ucast ((((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) AND 0x1ff)) \<and> R9 \<sigma> = R9\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = RDI\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),8]::64 word) = 0x1b707\<close>
declare P_0x1b70a_39_def[Ps]

definition P_0x1b70a_39_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x1b70a_39_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((RDI\<^sub>0::64 word) + 0x40), 8),
    (2, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x40), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x50), 8)
  }\<close>

definition P_0x1b70a_39_regions :: state_pred where
  \<open>P_0x1b70a_39_regions \<sigma> \<equiv> \<exists>regions. P_0x1b70a_39_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_ret_address_39 :: state_pred where
  \<open>Q_ret_address_39 \<sigma> \<equiv> RIP \<sigma> = ret_address \<and> RBX \<sigma> = RBX\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) + 0x8) \<and> RBP \<sigma> = RBP\<^sub>0 \<and> R15 \<sigma> = R15\<^sub>0 \<and> R14 \<sigma> = R14\<^sub>0 \<and> R13 \<sigma> = R13\<^sub>0 \<and> R12 \<sigma> = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = RDI\<^sub>0\<close>
declare Q_ret_address_39_def[Qs]

schematic_goal raw_pread_0_8_0x1b70a_0x1b718_39[blocks]:
  assumes \<open>(P_0x1b70a_39 && P_0x1b70a_39_regions) \<sigma>\<close>
  shows \<open>exec_block 8 0x1b718 39 \<sigma> \<triangleq> ?\<sigma> \<and> Q_ret_address_39 ?\<sigma> \<and> block_usage P_0x1b70a_39_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x1b70a_39_def P_0x1b70a_39_regions_def post: Q_ret_address_39_def regionset: P_0x1b70a_39_regions_set_def)

definition P_0x1b647_false_40 :: state_pred where
  \<open>P_0x1b647_false_40 \<sigma> \<equiv> RIP \<sigma> = 0x1b647 \<and> RAX \<sigma> = RAX\<^sub>0 \<and> RBX \<sigma> = RSI\<^sub>0 \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word) \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x48) \<and> RBP \<sigma> = RDX\<^sub>0 \<and> R15 \<sigma> = ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)) \<and> R14 \<sigma> = R14\<^sub>0 \<and> R13 \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> R12 \<sigma> = ucast ((((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) AND 0x1ff)) \<and> R9 \<sigma> = R9\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = RDI\<^sub>0\<close>
declare P_0x1b647_false_40_def[Ps]

definition P_0x1b647_false_40_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x1b647_false_40_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((RDI\<^sub>0::64 word) + 0x40), 8),
    (2, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x40), 8)
  }\<close>

definition P_0x1b647_false_40_regions :: state_pred where
  \<open>P_0x1b647_false_40_regions \<sigma> \<equiv> \<exists>regions. P_0x1b647_false_40_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x1b66f_40 :: state_pred where
  \<open>Q_0x1b66f_40 \<sigma> \<equiv> RIP \<sigma> = 0x1b66f \<and> RAX \<sigma> = 0x4000 \<and> RBX \<sigma> = RSI\<^sub>0 \<and> RCX \<sigma> = ucast ((if' ((((\<langle>31,0\<rangle>((RCX\<^sub>0::64 word) + (((\<langle>63,0\<rangle>((ucast (((((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) AND 0x1ff)::32 word))::64 word) * (0x1::64 word))::64 word)::64 word) + 0x1ff))::32 word)::32 word) AND 0xfffffe00)::32 word) >s 0x4000 then 0x4000 else ((((\<langle>31,0\<rangle>((RCX\<^sub>0::64 word) + (((\<langle>63,0\<rangle>((ucast (((((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) AND 0x1ff)::32 word))::64 word) * (0x1::64 word))::64 word)::64 word) + 0x1ff))::32 word)::32 word) AND 0xfffffe00)::32 word))) \<and> RDX \<sigma> = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word) \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = ((RSI\<^sub>0::64 word) - (sextend (ucast ((((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) AND 0x1ff))) 32 64::64 word)) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x48) \<and> RBP \<sigma> = RDX\<^sub>0 \<and> R15 \<sigma> = ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)) \<and> R14 \<sigma> = (sextend (ucast ((((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) AND 0x1ff))) 32 64::64 word) \<and> R13 \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> R12 \<sigma> = ucast ((((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) AND 0x1ff)) \<and> R9 \<sigma> = R9\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = RDI\<^sub>0\<close>
declare Q_0x1b66f_40_def[Qs]

schematic_goal raw_pread_0_8_0x1b647_0x1b66c_40[blocks]:
  assumes \<open>(P_0x1b647_false_40 && P_0x1b647_false_40_regions && ! ZF) \<sigma>\<close>
  shows \<open>exec_block 8 0x1b66c 40 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x1b66f_40 ?\<sigma> \<and> block_usage P_0x1b647_false_40_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x1b647_false_40_def P_0x1b647_false_40_regions_def post: Q_0x1b66f_40_def regionset: P_0x1b647_false_40_regions_set_def)

definition P_0x1b66f_41 :: state_pred where
  \<open>P_0x1b66f_41 \<sigma> \<equiv> RIP \<sigma> = 0x1b66f \<and> RAX \<sigma> = 0x4000 \<and> RBX \<sigma> = RSI\<^sub>0 \<and> RCX \<sigma> = ucast ((if' ((((\<langle>31,0\<rangle>((RCX\<^sub>0::64 word) + (((\<langle>63,0\<rangle>((ucast (((((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) AND 0x1ff)::32 word))::64 word) * (0x1::64 word))::64 word)::64 word) + 0x1ff))::32 word)::32 word) AND 0xfffffe00)::32 word) >s 0x4000 then 0x4000 else ((((\<langle>31,0\<rangle>((RCX\<^sub>0::64 word) + (((\<langle>63,0\<rangle>((ucast (((((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) AND 0x1ff)::32 word))::64 word) * (0x1::64 word))::64 word)::64 word) + 0x1ff))::32 word)::32 word) AND 0xfffffe00)::32 word))) \<and> RDX \<sigma> = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word) \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = ((RSI\<^sub>0::64 word) - (sextend (ucast ((((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) AND 0x1ff))) 32 64::64 word)) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x48) \<and> RBP \<sigma> = RDX\<^sub>0 \<and> R15 \<sigma> = ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)) \<and> R14 \<sigma> = (sextend (ucast ((((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) AND 0x1ff))) 32 64::64 word) \<and> R13 \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> R12 \<sigma> = ucast ((((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) AND 0x1ff)) \<and> R9 \<sigma> = R9\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = RDI\<^sub>0\<close>
declare P_0x1b66f_41_def[Ps]

definition P_0x1b66f_41_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x1b66f_41_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((RDI\<^sub>0::64 word) + 0x40), 8),
    (2, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x40), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x50), 8)
  }\<close>

definition P_0x1b66f_41_regions :: state_pred where
  \<open>P_0x1b66f_41_regions \<sigma> \<equiv> \<exists>regions. P_0x1b66f_41_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_raw_pread_aligned_addr_0x1b66f_41 :: state_pred where
  \<open>Q_raw_pread_aligned_addr_0x1b66f_41 \<sigma> \<equiv> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x50) \<and> RIP \<sigma> = raw_pread_aligned_addr \<and> RAX \<sigma> = 0x4000 \<and> RBX \<sigma> = RSI\<^sub>0 \<and> RCX \<sigma> = ucast ((if' ((((\<langle>31,0\<rangle>((RCX\<^sub>0::64 word) + (((\<langle>63,0\<rangle>((ucast (((((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) AND 0x1ff)::32 word))::64 word) * (0x1::64 word))::64 word)::64 word) + 0x1ff))::32 word)::32 word) AND 0xfffffe00)::32 word) >s 0x4000 then 0x4000 else ((((\<langle>31,0\<rangle>((RCX\<^sub>0::64 word) + (((\<langle>63,0\<rangle>((ucast (((((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) AND 0x1ff)::32 word))::64 word) * (0x1::64 word))::64 word)::64 word) + 0x1ff))::32 word)::32 word) AND 0xfffffe00)::32 word))) \<and> RDX \<sigma> = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word) \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = ((RSI\<^sub>0::64 word) - (sextend (ucast ((((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) AND 0x1ff))) 32 64::64 word)) \<and> RBP \<sigma> = RDX\<^sub>0 \<and> R15 \<sigma> = ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)) \<and> R14 \<sigma> = (sextend (ucast ((((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) AND 0x1ff))) 32 64::64 word) \<and> R13 \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> R12 \<sigma> = ucast ((((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) AND 0x1ff)) \<and> R9 \<sigma> = R9\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = RDI\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),8]::64 word) = 0x1b674\<close>
declare Q_raw_pread_aligned_addr_0x1b66f_41_def[Qs]

schematic_goal raw_pread_0_1_0x1b66f_0x1b66f_41[blocks]:
  assumes \<open>(P_0x1b66f_41 && P_0x1b66f_41_regions) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x1b66f 41 \<sigma> \<triangleq> ?\<sigma> \<and> Q_raw_pread_aligned_addr_0x1b66f_41 ?\<sigma> \<and> block_usage P_0x1b66f_41_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x1b66f_41_def P_0x1b66f_41_regions_def post: Q_raw_pread_aligned_addr_0x1b66f_41_def regionset: P_0x1b66f_41_regions_set_def)

definition P_0x1b674_42 :: state_pred where
  \<open>P_0x1b674_42 \<sigma> \<equiv> RIP \<sigma> = 0x1b674 \<and> RAX \<sigma> = raw_pread_aligned_0x1b66f_retval \<and> RBX \<sigma> = RSI\<^sub>0 \<and> RCX \<sigma> = ucast ((if' ((((\<langle>31,0\<rangle>((RCX\<^sub>0::64 word) + (((\<langle>63,0\<rangle>((ucast (((((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) AND 0x1ff)::32 word))::64 word) * (0x1::64 word))::64 word)::64 word) + 0x1ff))::32 word)::32 word) AND 0xfffffe00)::32 word) >s 0x4000 then 0x4000 else ((((\<langle>31,0\<rangle>((RCX\<^sub>0::64 word) + (((\<langle>63,0\<rangle>((ucast (((((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) AND 0x1ff)::32 word))::64 word) * (0x1::64 word))::64 word)::64 word) + 0x1ff))::32 word)::32 word) AND 0xfffffe00)::32 word))) \<and> RDX \<sigma> = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word) \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = ((RSI\<^sub>0::64 word) - (sextend (ucast ((((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) AND 0x1ff))) 32 64::64 word)) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x48) \<and> RBP \<sigma> = RDX\<^sub>0 \<and> R15 \<sigma> = ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)) \<and> R14 \<sigma> = (sextend (ucast ((((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) AND 0x1ff))) 32 64::64 word) \<and> R13 \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> R12 \<sigma> = ucast ((((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) AND 0x1ff)) \<and> R9 \<sigma> = R9\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = RDI\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),8]::64 word) = 0x1b674\<close>
declare P_0x1b674_42_def[Ps]

definition P_0x1b674_42_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x1b674_42_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((RDI\<^sub>0::64 word) + 0x40), 8),
    (2, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x40), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x50), 8)
  }\<close>

definition P_0x1b674_42_regions :: state_pred where
  \<open>P_0x1b674_42_regions \<sigma> \<equiv> \<exists>regions. P_0x1b674_42_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x1b676_42 :: state_pred where
  \<open>Q_0x1b676_42 \<sigma> \<equiv> RIP \<sigma> = 0x1b676 \<and> RAX \<sigma> = raw_pread_aligned_0x1b66f_retval \<and> RBX \<sigma> = RSI\<^sub>0 \<and> RCX \<sigma> = ucast ((if' ((((\<langle>31,0\<rangle>((RCX\<^sub>0::64 word) + (((\<langle>63,0\<rangle>((ucast (((((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) AND 0x1ff)::32 word))::64 word) * (0x1::64 word))::64 word)::64 word) + 0x1ff))::32 word)::32 word) AND 0xfffffe00)::32 word) >s 0x4000 then 0x4000 else ((((\<langle>31,0\<rangle>((RCX\<^sub>0::64 word) + (((\<langle>63,0\<rangle>((ucast (((((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) AND 0x1ff)::32 word))::64 word) * (0x1::64 word))::64 word)::64 word) + 0x1ff))::32 word)::32 word) AND 0xfffffe00)::32 word))) \<and> RDX \<sigma> = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word) \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = ((RSI\<^sub>0::64 word) - (sextend (ucast ((((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) AND 0x1ff))) 32 64::64 word)) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x48) \<and> RBP \<sigma> = RDX\<^sub>0 \<and> R15 \<sigma> = ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)) \<and> R14 \<sigma> = (sextend (ucast ((((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) AND 0x1ff))) 32 64::64 word) \<and> R13 \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> R12 \<sigma> = ucast ((((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) AND 0x1ff)) \<and> R9 \<sigma> = R9\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = RDI\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),8]::64 word) = 0x1b674\<close>
declare Q_0x1b676_42_def[Qs]

schematic_goal raw_pread_0_1_0x1b674_0x1b674_42[blocks]:
  assumes \<open>(P_0x1b674_42 && P_0x1b674_42_regions) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x1b674 42 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x1b676_42 ?\<sigma> \<and> block_usage P_0x1b674_42_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x1b674_42_def P_0x1b674_42_regions_def post: Q_0x1b676_42_def regionset: P_0x1b674_42_regions_set_def)

definition P_0x1b676_true_43 :: state_pred where
  \<open>P_0x1b676_true_43 \<sigma> \<equiv> RIP \<sigma> = 0x1b676 \<and> RAX \<sigma> = raw_pread_aligned_0x1b66f_retval \<and> RBX \<sigma> = RSI\<^sub>0 \<and> RCX \<sigma> = ucast ((if' ((((\<langle>31,0\<rangle>((RCX\<^sub>0::64 word) + (((\<langle>63,0\<rangle>((ucast (((((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) AND 0x1ff)::32 word))::64 word) * (0x1::64 word))::64 word)::64 word) + 0x1ff))::32 word)::32 word) AND 0xfffffe00)::32 word) >s 0x4000 then 0x4000 else ((((\<langle>31,0\<rangle>((RCX\<^sub>0::64 word) + (((\<langle>63,0\<rangle>((ucast (((((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) AND 0x1ff)::32 word))::64 word) * (0x1::64 word))::64 word)::64 word) + 0x1ff))::32 word)::32 word) AND 0xfffffe00)::32 word))) \<and> RDX \<sigma> = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word) \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = ((RSI\<^sub>0::64 word) - (sextend (ucast ((((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) AND 0x1ff))) 32 64::64 word)) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x48) \<and> RBP \<sigma> = RDX\<^sub>0 \<and> R15 \<sigma> = ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)) \<and> R14 \<sigma> = (sextend (ucast ((((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) AND 0x1ff))) 32 64::64 word) \<and> R13 \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> R12 \<sigma> = ucast ((((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) AND 0x1ff)) \<and> R9 \<sigma> = R9\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = RDI\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),8]::64 word) = 0x1b674\<close>
declare P_0x1b676_true_43_def[Ps]

definition P_0x1b676_true_43_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x1b676_true_43_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((RDI\<^sub>0::64 word) + 0x40), 8),
    (2, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x40), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x50), 8)
  }\<close>

definition P_0x1b676_true_43_regions :: state_pred where
  \<open>P_0x1b676_true_43_regions \<sigma> \<equiv> \<exists>regions. P_0x1b676_true_43_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_ret_address_43 :: state_pred where
  \<open>Q_ret_address_43 \<sigma> \<equiv> RIP \<sigma> = ret_address \<and> RBX \<sigma> = RBX\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) + 0x8) \<and> RBP \<sigma> = RBP\<^sub>0 \<and> R15 \<sigma> = R15\<^sub>0 \<and> R14 \<sigma> = R14\<^sub>0 \<and> R13 \<sigma> = R13\<^sub>0 \<and> R12 \<sigma> = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = RDI\<^sub>0\<close>
declare Q_ret_address_43_def[Qs]

schematic_goal raw_pread_0_9_0x1b676_0x1b718_43[blocks]:
  assumes \<open>(P_0x1b676_true_43 && P_0x1b676_true_43_regions && SF) \<sigma>\<close>
  shows \<open>exec_block 9 0x1b718 43 \<sigma> \<triangleq> ?\<sigma> \<and> Q_ret_address_43 ?\<sigma> \<and> block_usage P_0x1b676_true_43_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x1b676_true_43_def P_0x1b676_true_43_regions_def post: Q_ret_address_43_def regionset: P_0x1b676_true_43_regions_set_def)

definition P_0x1b676_false_44 :: state_pred where
  \<open>P_0x1b676_false_44 \<sigma> \<equiv> RIP \<sigma> = 0x1b676 \<and> RAX \<sigma> = raw_pread_aligned_0x1b66f_retval \<and> RBX \<sigma> = RSI\<^sub>0 \<and> RCX \<sigma> = ucast ((if' ((((\<langle>31,0\<rangle>((RCX\<^sub>0::64 word) + (((\<langle>63,0\<rangle>((ucast (((((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) AND 0x1ff)::32 word))::64 word) * (0x1::64 word))::64 word)::64 word) + 0x1ff))::32 word)::32 word) AND 0xfffffe00)::32 word) >s 0x4000 then 0x4000 else ((((\<langle>31,0\<rangle>((RCX\<^sub>0::64 word) + (((\<langle>63,0\<rangle>((ucast (((((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) AND 0x1ff)::32 word))::64 word) * (0x1::64 word))::64 word)::64 word) + 0x1ff))::32 word)::32 word) AND 0xfffffe00)::32 word))) \<and> RDX \<sigma> = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word) \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = ((RSI\<^sub>0::64 word) - (sextend (ucast ((((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) AND 0x1ff))) 32 64::64 word)) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x48) \<and> RBP \<sigma> = RDX\<^sub>0 \<and> R15 \<sigma> = ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)) \<and> R14 \<sigma> = (sextend (ucast ((((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) AND 0x1ff))) 32 64::64 word) \<and> R13 \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> R12 \<sigma> = ucast ((((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) AND 0x1ff)) \<and> R9 \<sigma> = R9\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = RDI\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),8]::64 word) = 0x1b674\<close>
declare P_0x1b676_false_44_def[Ps]

definition P_0x1b676_false_44_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x1b676_false_44_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((RDI\<^sub>0::64 word) + 0x40), 8),
    (2, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x40), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x50), 8)
  }\<close>

definition P_0x1b676_false_44_regions :: state_pred where
  \<open>P_0x1b676_false_44_regions \<sigma> \<equiv> \<exists>regions. P_0x1b676_false_44_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x1b691_44 :: state_pred where
  \<open>Q_0x1b691_44 \<sigma> \<equiv> RIP \<sigma> = 0x1b691 \<and> RAX \<sigma> = ucast (((0x200::32 word) - (((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) AND 0x1ff))) \<and> RBX \<sigma> = RSI\<^sub>0 \<and> RCX \<sigma> = ucast ((if' ((((\<langle>31,0\<rangle>((RCX\<^sub>0::64 word) + (((\<langle>63,0\<rangle>((ucast (((((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) AND 0x1ff)::32 word))::64 word) * (0x1::64 word))::64 word)::64 word) + 0x1ff))::32 word)::32 word) AND 0xfffffe00)::32 word) >s 0x4000 then 0x4000 else ((((\<langle>31,0\<rangle>((RCX\<^sub>0::64 word) + (((\<langle>63,0\<rangle>((ucast (((((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) AND 0x1ff)::32 word))::64 word) * (0x1::64 word))::64 word)::64 word) + 0x1ff))::32 word)::32 word) AND 0xfffffe00)::32 word))) \<and> RDX \<sigma> = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word) \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = (((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word)::64 word) + (sextend (ucast ((((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) AND 0x1ff))) 32 64::64 word)) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x48) \<and> RBP \<sigma> = RDX\<^sub>0 \<and> R15 \<sigma> = ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)) \<and> R14 \<sigma> = (sextend (ucast ((((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) AND 0x1ff))) 32 64::64 word) \<and> R13 \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> R12 \<sigma> = ucast (((0x200::32 word) - (((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) AND 0x1ff))) \<and> R9 \<sigma> = R9\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = RDI\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),8]::64 word) = 0x1b674\<close>
declare Q_0x1b691_44_def[Qs]

schematic_goal raw_pread_0_7_0x1b676_0x1b68e_44[blocks]:
  assumes \<open>(P_0x1b676_false_44 && P_0x1b676_false_44_regions && ! SF) \<sigma>\<close>
  shows \<open>exec_block 7 0x1b68e 44 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x1b691_44 ?\<sigma> \<and> block_usage P_0x1b676_false_44_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x1b676_false_44_def P_0x1b676_false_44_regions_def post: Q_0x1b691_44_def regionset: P_0x1b676_false_44_regions_set_def)

definition P_0x1b691_true_45 :: state_pred where
  \<open>P_0x1b691_true_45 \<sigma> \<equiv> RIP \<sigma> = 0x1b691 \<and> RAX \<sigma> = ucast (((0x200::32 word) - (((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) AND 0x1ff))) \<and> RBX \<sigma> = RSI\<^sub>0 \<and> RCX \<sigma> = ucast ((if' ((((\<langle>31,0\<rangle>((RCX\<^sub>0::64 word) + (((\<langle>63,0\<rangle>((ucast (((((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) AND 0x1ff)::32 word))::64 word) * (0x1::64 word))::64 word)::64 word) + 0x1ff))::32 word)::32 word) AND 0xfffffe00)::32 word) >s 0x4000 then 0x4000 else ((((\<langle>31,0\<rangle>((RCX\<^sub>0::64 word) + (((\<langle>63,0\<rangle>((ucast (((((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) AND 0x1ff)::32 word))::64 word) * (0x1::64 word))::64 word)::64 word) + 0x1ff))::32 word)::32 word) AND 0xfffffe00)::32 word))) \<and> RDX \<sigma> = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word) \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = (((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word)::64 word) + (sextend (ucast ((((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) AND 0x1ff))) 32 64::64 word)) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x48) \<and> RBP \<sigma> = RDX\<^sub>0 \<and> R15 \<sigma> = ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)) \<and> R14 \<sigma> = (sextend (ucast ((((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) AND 0x1ff))) 32 64::64 word) \<and> R13 \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> R12 \<sigma> = ucast (((0x200::32 word) - (((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) AND 0x1ff))) \<and> R9 \<sigma> = R9\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = RDI\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),8]::64 word) = 0x1b674\<close>
declare P_0x1b691_true_45_def[Ps]

definition P_0x1b691_true_45_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x1b691_true_45_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((RDI\<^sub>0::64 word) + 0x40), 8),
    (2, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x40), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x50), 8)
  }\<close>

definition P_0x1b691_true_45_regions :: state_pred where
  \<open>P_0x1b691_true_45_regions \<sigma> \<equiv> \<exists>regions. P_0x1b691_true_45_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x1b726_45 :: state_pred where
  \<open>Q_0x1b726_45 \<sigma> \<equiv> RIP \<sigma> = 0x1b726 \<and> RAX \<sigma> = ucast (((0x200::32 word) - (((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) AND 0x1ff))) \<and> RBX \<sigma> = RSI\<^sub>0 \<and> RCX \<sigma> = ucast ((if' ((((\<langle>31,0\<rangle>((RCX\<^sub>0::64 word) + (((\<langle>63,0\<rangle>((ucast (((((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) AND 0x1ff)::32 word))::64 word) * (0x1::64 word))::64 word)::64 word) + 0x1ff))::32 word)::32 word) AND 0xfffffe00)::32 word) >s 0x4000 then 0x4000 else ((((\<langle>31,0\<rangle>((RCX\<^sub>0::64 word) + (((\<langle>63,0\<rangle>((ucast (((((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) AND 0x1ff)::32 word))::64 word) * (0x1::64 word))::64 word)::64 word) + 0x1ff))::32 word)::32 word) AND 0xfffffe00)::32 word))) \<and> RDX \<sigma> = (sextend (ucast (((0x200::32 word) - (((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) AND 0x1ff)))) 32 64::64 word) \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = (((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word)::64 word) + (sextend (ucast ((((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) AND 0x1ff))) 32 64::64 word)) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x48) \<and> RBP \<sigma> = RDX\<^sub>0 \<and> R15 \<sigma> = ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)) \<and> R14 \<sigma> = (sextend (ucast ((((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) AND 0x1ff))) 32 64::64 word) \<and> R13 \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> R12 \<sigma> = ucast (((0x200::32 word) - (((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) AND 0x1ff))) \<and> R9 \<sigma> = R9\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = RDI\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),8]::64 word) = 0x1b674\<close>
declare Q_0x1b726_45_def[Qs]

schematic_goal raw_pread_0_3_0x1b691_0x1b723_45[blocks]:
  assumes \<open>(P_0x1b691_true_45 && P_0x1b691_true_45_regions && jge) \<sigma>\<close>
  shows \<open>exec_block 3 0x1b723 45 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x1b726_45 ?\<sigma> \<and> block_usage P_0x1b691_true_45_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x1b691_true_45_def P_0x1b691_true_45_regions_def post: Q_0x1b726_45_def regionset: P_0x1b691_true_45_regions_set_def)

definition P_0x1b726_true_46 :: state_pred where
  \<open>P_0x1b726_true_46 \<sigma> \<equiv> RIP \<sigma> = 0x1b726 \<and> RAX \<sigma> = ucast (((0x200::32 word) - (((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) AND 0x1ff))) \<and> RBX \<sigma> = RSI\<^sub>0 \<and> RCX \<sigma> = ucast ((if' ((((\<langle>31,0\<rangle>((RCX\<^sub>0::64 word) + (((\<langle>63,0\<rangle>((ucast (((((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) AND 0x1ff)::32 word))::64 word) * (0x1::64 word))::64 word)::64 word) + 0x1ff))::32 word)::32 word) AND 0xfffffe00)::32 word) >s 0x4000 then 0x4000 else ((((\<langle>31,0\<rangle>((RCX\<^sub>0::64 word) + (((\<langle>63,0\<rangle>((ucast (((((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) AND 0x1ff)::32 word))::64 word) * (0x1::64 word))::64 word)::64 word) + 0x1ff))::32 word)::32 word) AND 0xfffffe00)::32 word))) \<and> RDX \<sigma> = (sextend (ucast (((0x200::32 word) - (((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) AND 0x1ff)))) 32 64::64 word) \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = (((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word)::64 word) + (sextend (ucast ((((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) AND 0x1ff))) 32 64::64 word)) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x48) \<and> RBP \<sigma> = RDX\<^sub>0 \<and> R15 \<sigma> = ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)) \<and> R14 \<sigma> = (sextend (ucast ((((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) AND 0x1ff))) 32 64::64 word) \<and> R13 \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> R12 \<sigma> = ucast (((0x200::32 word) - (((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) AND 0x1ff))) \<and> R9 \<sigma> = R9\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = RDI\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),8]::64 word) = 0x1b674\<close>
declare P_0x1b726_true_46_def[Ps]

definition P_0x1b726_true_46_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x1b726_true_46_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((RDI\<^sub>0::64 word) + 0x40), 8),
    (2, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x40), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x50), 8)
  }\<close>

definition P_0x1b726_true_46_regions :: state_pred where
  \<open>P_0x1b726_true_46_regions \<sigma> \<equiv> \<exists>regions. P_0x1b726_true_46_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x1b822_46 :: state_pred where
  \<open>Q_0x1b822_46 \<sigma> \<equiv> RIP \<sigma> = 0x1b822 \<and> RAX \<sigma> = ucast (((0x200::32 word) - (((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) AND 0x1ff))) \<and> RBX \<sigma> = RSI\<^sub>0 \<and> RCX \<sigma> = ucast ((if' ((((\<langle>31,0\<rangle>((RCX\<^sub>0::64 word) + (((\<langle>63,0\<rangle>((ucast (((((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) AND 0x1ff)::32 word))::64 word) * (0x1::64 word))::64 word)::64 word) + 0x1ff))::32 word)::32 word) AND 0xfffffe00)::32 word) >s 0x4000 then 0x4000 else ((((\<langle>31,0\<rangle>((RCX\<^sub>0::64 word) + (((\<langle>63,0\<rangle>((ucast (((((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) AND 0x1ff)::32 word))::64 word) * (0x1::64 word))::64 word)::64 word) + 0x1ff))::32 word)::32 word) AND 0xfffffe00)::32 word))) \<and> RDX \<sigma> = (sextend (ucast (((0x200::32 word) - (((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) AND 0x1ff)))) 32 64::64 word) \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = (((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word)::64 word) + (sextend (ucast ((((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) AND 0x1ff))) 32 64::64 word)) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x48) \<and> RBP \<sigma> = RDX\<^sub>0 \<and> R15 \<sigma> = ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)) \<and> R14 \<sigma> = (sextend (ucast ((((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) AND 0x1ff))) 32 64::64 word) \<and> R13 \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> R12 \<sigma> = ucast (((0x200::32 word) - (((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) AND 0x1ff))) \<and> R9 \<sigma> = R9\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = RDI\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),8]::64 word) = 0x1b674\<close>
declare Q_0x1b822_46_def[Qs]

schematic_goal raw_pread_0_2_0x1b726_0x1b820_46[blocks]:
  assumes \<open>(P_0x1b726_true_46 && P_0x1b726_true_46_regions && CF) \<sigma>\<close>
  shows \<open>exec_block 2 0x1b820 46 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x1b822_46 ?\<sigma> \<and> block_usage P_0x1b726_true_46_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x1b726_true_46_def P_0x1b726_true_46_regions_def post: Q_0x1b822_46_def regionset: P_0x1b726_true_46_regions_set_def)

definition P_0x1b822_true_47 :: state_pred where
  \<open>P_0x1b822_true_47 \<sigma> \<equiv> RIP \<sigma> = 0x1b822 \<and> RAX \<sigma> = ucast (((0x200::32 word) - (((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) AND 0x1ff))) \<and> RBX \<sigma> = RSI\<^sub>0 \<and> RCX \<sigma> = ucast ((if' ((((\<langle>31,0\<rangle>((RCX\<^sub>0::64 word) + (((\<langle>63,0\<rangle>((ucast (((((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) AND 0x1ff)::32 word))::64 word) * (0x1::64 word))::64 word)::64 word) + 0x1ff))::32 word)::32 word) AND 0xfffffe00)::32 word) >s 0x4000 then 0x4000 else ((((\<langle>31,0\<rangle>((RCX\<^sub>0::64 word) + (((\<langle>63,0\<rangle>((ucast (((((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) AND 0x1ff)::32 word))::64 word) * (0x1::64 word))::64 word)::64 word) + 0x1ff))::32 word)::32 word) AND 0xfffffe00)::32 word))) \<and> RDX \<sigma> = (sextend (ucast (((0x200::32 word) - (((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) AND 0x1ff)))) 32 64::64 word) \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = (((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word)::64 word) + (sextend (ucast ((((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) AND 0x1ff))) 32 64::64 word)) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x48) \<and> RBP \<sigma> = RDX\<^sub>0 \<and> R15 \<sigma> = ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)) \<and> R14 \<sigma> = (sextend (ucast ((((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) AND 0x1ff))) 32 64::64 word) \<and> R13 \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> R12 \<sigma> = ucast (((0x200::32 word) - (((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) AND 0x1ff))) \<and> R9 \<sigma> = R9\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = RDI\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),8]::64 word) = 0x1b674\<close>
declare P_0x1b822_true_47_def[Ps]

definition P_0x1b822_true_47_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x1b822_true_47_regions_set \<sigma> \<equiv> {
    (0, RDX\<^sub>0, 4),
    (1, RSP\<^sub>0, 8),
    (2, ((RDI\<^sub>0::64 word) + 0x40), 8),
    (3, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28), 8),
    (4, (((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word)::64 word) + (sextend (ucast ((((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) AND 0x1ff))) 32 64::64 word)), 4),
    (5, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (11, ((RSP\<^sub>0::64 word) - 0x40), 8),
    (12, ((RSP\<^sub>0::64 word) - 0x50), 8),
    (13, ((((RDX\<^sub>0::64 word) + (\<langle>63,0\<rangle>((ucast ((((0x200::32 word) - (((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) AND 0x1ff))::32 word))::64 word) * (0x1::64 word))::64 word))::64 word) - 0x4), 4),
    (14, (((((((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word)::64 word) + (sextend (ucast ((((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) AND 0x1ff))) 32 64::64 word))::64 word) + (\<langle>63,0\<rangle>((ucast ((((0x200::32 word) - (((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) AND 0x1ff))::32 word))::64 word) * (0x1::64 word))::64 word))::64 word) - 0x4), 4)
  }\<close>

definition P_0x1b822_true_47_regions :: state_pred where
  \<open>P_0x1b822_true_47_regions \<sigma> \<equiv> \<exists>regions. P_0x1b822_true_47_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x1b75f_47 :: state_pred where
  \<open>Q_0x1b75f_47 \<sigma> \<equiv> RIP \<sigma> = 0x1b75f \<and> RBX \<sigma> = RSI\<^sub>0 \<and> RDX \<sigma> = (sextend (ucast (((0x200::32 word) - (((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) AND 0x1ff)))) 32 64::64 word) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x48) \<and> RBP \<sigma> = RDX\<^sub>0 \<and> R15 \<sigma> = ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)) \<and> R14 \<sigma> = (sextend (ucast ((((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) AND 0x1ff))) 32 64::64 word) \<and> R13 \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> R12 \<sigma> = ucast (((0x200::32 word) - (((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) AND 0x1ff))) \<and> R9 \<sigma> = R9\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = RDI\<^sub>0\<close>
declare Q_0x1b75f_47_def[Qs]

schematic_goal raw_pread_0_7_0x1b822_0x1b8bb_47[blocks]:
  assumes \<open>(P_0x1b822_true_47 && P_0x1b822_true_47_regions && !ZF) \<sigma>\<close>
  shows \<open>exec_block 7 0x1b8bb 47 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x1b75f_47 ?\<sigma> \<and> block_usage P_0x1b822_true_47_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x1b822_true_47_def P_0x1b822_true_47_regions_def post: Q_0x1b75f_47_def regionset: P_0x1b822_true_47_regions_set_def)

definition P_0x1b822_false_48 :: state_pred where
  \<open>P_0x1b822_false_48 \<sigma> \<equiv> RIP \<sigma> = 0x1b822 \<and> RAX \<sigma> = ucast (((0x200::32 word) - (((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) AND 0x1ff))) \<and> RBX \<sigma> = RSI\<^sub>0 \<and> RCX \<sigma> = ucast ((if' ((((\<langle>31,0\<rangle>((RCX\<^sub>0::64 word) + (((\<langle>63,0\<rangle>((ucast (((((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) AND 0x1ff)::32 word))::64 word) * (0x1::64 word))::64 word)::64 word) + 0x1ff))::32 word)::32 word) AND 0xfffffe00)::32 word) >s 0x4000 then 0x4000 else ((((\<langle>31,0\<rangle>((RCX\<^sub>0::64 word) + (((\<langle>63,0\<rangle>((ucast (((((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) AND 0x1ff)::32 word))::64 word) * (0x1::64 word))::64 word)::64 word) + 0x1ff))::32 word)::32 word) AND 0xfffffe00)::32 word))) \<and> RDX \<sigma> = (sextend (ucast (((0x200::32 word) - (((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) AND 0x1ff)))) 32 64::64 word) \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = (((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word)::64 word) + (sextend (ucast ((((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) AND 0x1ff))) 32 64::64 word)) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x48) \<and> RBP \<sigma> = RDX\<^sub>0 \<and> R15 \<sigma> = ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)) \<and> R14 \<sigma> = (sextend (ucast ((((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) AND 0x1ff))) 32 64::64 word) \<and> R13 \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> R12 \<sigma> = ucast (((0x200::32 word) - (((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) AND 0x1ff))) \<and> R9 \<sigma> = R9\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = RDI\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),8]::64 word) = 0x1b674\<close>
declare P_0x1b822_false_48_def[Ps]

definition P_0x1b822_false_48_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x1b822_false_48_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((RDI\<^sub>0::64 word) + 0x40), 8),
    (2, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x40), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x50), 8)
  }\<close>

definition P_0x1b822_false_48_regions :: state_pred where
  \<open>P_0x1b822_false_48_regions \<sigma> \<equiv> \<exists>regions. P_0x1b822_false_48_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x1b82a_48 :: state_pred where
  \<open>Q_0x1b82a_48 \<sigma> \<equiv> RIP \<sigma> = 0x1b82a \<and> RAX \<sigma> = ucast (((0x200::32 word) - (((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) AND 0x1ff))) \<and> RBX \<sigma> = RSI\<^sub>0 \<and> RCX \<sigma> = ucast ((if' ((((\<langle>31,0\<rangle>((RCX\<^sub>0::64 word) + (((\<langle>63,0\<rangle>((ucast (((((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) AND 0x1ff)::32 word))::64 word) * (0x1::64 word))::64 word)::64 word) + 0x1ff))::32 word)::32 word) AND 0xfffffe00)::32 word) >s 0x4000 then 0x4000 else ((((\<langle>31,0\<rangle>((RCX\<^sub>0::64 word) + (((\<langle>63,0\<rangle>((ucast (((((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) AND 0x1ff)::32 word))::64 word) * (0x1::64 word))::64 word)::64 word) + 0x1ff))::32 word)::32 word) AND 0xfffffe00)::32 word))) \<and> RDX \<sigma> = (sextend (ucast (((0x200::32 word) - (((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) AND 0x1ff)))) 32 64::64 word) \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = (((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word)::64 word) + (sextend (ucast ((((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) AND 0x1ff))) 32 64::64 word)) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x48) \<and> RBP \<sigma> = RDX\<^sub>0 \<and> R15 \<sigma> = ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)) \<and> R14 \<sigma> = (sextend (ucast ((((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) AND 0x1ff))) 32 64::64 word) \<and> R13 \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> R12 \<sigma> = ucast (((0x200::32 word) - (((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) AND 0x1ff))) \<and> R9 \<sigma> = R9\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = RDI\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),8]::64 word) = 0x1b674\<close>
declare Q_0x1b82a_48_def[Qs]

schematic_goal raw_pread_0_2_0x1b822_0x1b828_48[blocks]:
  assumes \<open>(P_0x1b822_false_48 && P_0x1b822_false_48_regions && ! !ZF) \<sigma>\<close>
  shows \<open>exec_block 2 0x1b828 48 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x1b82a_48 ?\<sigma> \<and> block_usage P_0x1b822_false_48_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x1b822_false_48_def P_0x1b822_false_48_regions_def post: Q_0x1b82a_48_def regionset: P_0x1b822_false_48_regions_set_def)

definition P_0x1b82a_true_49 :: state_pred where
  \<open>P_0x1b82a_true_49 \<sigma> \<equiv> RIP \<sigma> = 0x1b82a \<and> RAX \<sigma> = ucast (((0x200::32 word) - (((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) AND 0x1ff))) \<and> RBX \<sigma> = RSI\<^sub>0 \<and> RCX \<sigma> = ucast ((if' ((((\<langle>31,0\<rangle>((RCX\<^sub>0::64 word) + (((\<langle>63,0\<rangle>((ucast (((((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) AND 0x1ff)::32 word))::64 word) * (0x1::64 word))::64 word)::64 word) + 0x1ff))::32 word)::32 word) AND 0xfffffe00)::32 word) >s 0x4000 then 0x4000 else ((((\<langle>31,0\<rangle>((RCX\<^sub>0::64 word) + (((\<langle>63,0\<rangle>((ucast (((((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) AND 0x1ff)::32 word))::64 word) * (0x1::64 word))::64 word)::64 word) + 0x1ff))::32 word)::32 word) AND 0xfffffe00)::32 word))) \<and> RDX \<sigma> = (sextend (ucast (((0x200::32 word) - (((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) AND 0x1ff)))) 32 64::64 word) \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = (((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word)::64 word) + (sextend (ucast ((((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) AND 0x1ff))) 32 64::64 word)) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x48) \<and> RBP \<sigma> = RDX\<^sub>0 \<and> R15 \<sigma> = ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)) \<and> R14 \<sigma> = (sextend (ucast ((((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) AND 0x1ff))) 32 64::64 word) \<and> R13 \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> R12 \<sigma> = ucast (((0x200::32 word) - (((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) AND 0x1ff))) \<and> R9 \<sigma> = R9\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = RDI\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),8]::64 word) = 0x1b674\<close>
declare P_0x1b82a_true_49_def[Ps]

definition P_0x1b82a_true_49_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x1b82a_true_49_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((RDI\<^sub>0::64 word) + 0x40), 8),
    (2, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x40), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x50), 8)
  }\<close>

definition P_0x1b82a_true_49_regions :: state_pred where
  \<open>P_0x1b82a_true_49_regions \<sigma> \<equiv> \<exists>regions. P_0x1b82a_true_49_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x1b75f_49 :: state_pred where
  \<open>Q_0x1b75f_49 \<sigma> \<equiv> RIP \<sigma> = 0x1b75f \<and> RBX \<sigma> = RSI\<^sub>0 \<and> RDX \<sigma> = (sextend (ucast (((0x200::32 word) - (((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) AND 0x1ff)))) 32 64::64 word) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x48) \<and> RBP \<sigma> = RDX\<^sub>0 \<and> R15 \<sigma> = ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)) \<and> R14 \<sigma> = (sextend (ucast ((((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) AND 0x1ff))) 32 64::64 word) \<and> R13 \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> R12 \<sigma> = ucast (((0x200::32 word) - (((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) AND 0x1ff))) \<and> R9 \<sigma> = R9\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = RDI\<^sub>0\<close>
declare Q_0x1b75f_49_def[Qs]

schematic_goal raw_pread_0_1_0x1b82a_0x1b82a_49[blocks]:
  assumes \<open>(P_0x1b82a_true_49 && P_0x1b82a_true_49_regions && ZF) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x1b82a 49 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x1b75f_49 ?\<sigma> \<and> block_usage P_0x1b82a_true_49_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x1b82a_true_49_def P_0x1b82a_true_49_regions_def post: Q_0x1b75f_49_def regionset: P_0x1b82a_true_49_regions_set_def)

definition P_0x1b82a_false_50 :: state_pred where
  \<open>P_0x1b82a_false_50 \<sigma> \<equiv> RIP \<sigma> = 0x1b82a \<and> RAX \<sigma> = ucast (((0x200::32 word) - (((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) AND 0x1ff))) \<and> RBX \<sigma> = RSI\<^sub>0 \<and> RCX \<sigma> = ucast ((if' ((((\<langle>31,0\<rangle>((RCX\<^sub>0::64 word) + (((\<langle>63,0\<rangle>((ucast (((((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) AND 0x1ff)::32 word))::64 word) * (0x1::64 word))::64 word)::64 word) + 0x1ff))::32 word)::32 word) AND 0xfffffe00)::32 word) >s 0x4000 then 0x4000 else ((((\<langle>31,0\<rangle>((RCX\<^sub>0::64 word) + (((\<langle>63,0\<rangle>((ucast (((((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) AND 0x1ff)::32 word))::64 word) * (0x1::64 word))::64 word)::64 word) + 0x1ff))::32 word)::32 word) AND 0xfffffe00)::32 word))) \<and> RDX \<sigma> = (sextend (ucast (((0x200::32 word) - (((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) AND 0x1ff)))) 32 64::64 word) \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = (((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word)::64 word) + (sextend (ucast ((((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) AND 0x1ff))) 32 64::64 word)) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x48) \<and> RBP \<sigma> = RDX\<^sub>0 \<and> R15 \<sigma> = ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)) \<and> R14 \<sigma> = (sextend (ucast ((((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) AND 0x1ff))) 32 64::64 word) \<and> R13 \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> R12 \<sigma> = ucast (((0x200::32 word) - (((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) AND 0x1ff))) \<and> R9 \<sigma> = R9\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = RDI\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),8]::64 word) = 0x1b674\<close>
declare P_0x1b82a_false_50_def[Ps]

definition P_0x1b82a_false_50_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x1b82a_false_50_regions_set \<sigma> \<equiv> {
    (0, RDX\<^sub>0, Suc 0),
    (1, RSP\<^sub>0, 8),
    (2, ((RDI\<^sub>0::64 word) + 0x40), 8),
    (3, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28), 8),
    (4, (((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word)::64 word) + (sextend (ucast ((((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) AND 0x1ff))) 32 64::64 word)), Suc 0),
    (5, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (11, ((RSP\<^sub>0::64 word) - 0x40), 8),
    (12, ((RSP\<^sub>0::64 word) - 0x50), 8)
  }\<close>

definition P_0x1b82a_false_50_regions :: state_pred where
  \<open>P_0x1b82a_false_50_regions \<sigma> \<equiv> \<exists>regions. P_0x1b82a_false_50_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x1b83a_50 :: state_pred where
  \<open>Q_0x1b83a_50 \<sigma> \<equiv> RIP \<sigma> = 0x1b83a \<and> RAX \<sigma> = ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word)::64 word) + (sextend (ucast ((((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) AND 0x1ff))) 32 64::64 word)),1]::8 word)) \<and> RBX \<sigma> = RSI\<^sub>0 \<and> RCX \<sigma> = ucast ((if' ((((\<langle>31,0\<rangle>((RCX\<^sub>0::64 word) + (((\<langle>63,0\<rangle>((ucast (((((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) AND 0x1ff)::32 word))::64 word) * (0x1::64 word))::64 word)::64 word) + 0x1ff))::32 word)::32 word) AND 0xfffffe00)::32 word) >s 0x4000 then 0x4000 else ((((\<langle>31,0\<rangle>((RCX\<^sub>0::64 word) + (((\<langle>63,0\<rangle>((ucast (((((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) AND 0x1ff)::32 word))::64 word) * (0x1::64 word))::64 word)::64 word) + 0x1ff))::32 word)::32 word) AND 0xfffffe00)::32 word))) \<and> RDX \<sigma> = (sextend (ucast (((0x200::32 word) - (((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) AND 0x1ff)))) 32 64::64 word) \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = (((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word)::64 word) + (sextend (ucast ((((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) AND 0x1ff))) 32 64::64 word)) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x48) \<and> RBP \<sigma> = RDX\<^sub>0 \<and> R15 \<sigma> = ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)) \<and> R14 \<sigma> = (sextend (ucast ((((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) AND 0x1ff))) 32 64::64 word) \<and> R13 \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> R12 \<sigma> = ucast (((0x200::32 word) - (((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) AND 0x1ff))) \<and> R9 \<sigma> = R9\<^sub>0 \<and> (\<sigma> \<turnstile> *[RDX\<^sub>0,1]::8 word) = ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word)::64 word) + (sextend (ucast ((((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) AND 0x1ff))) 32 64::64 word)),1]::8 word)) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word)::64 word) + (sextend (ucast ((((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) AND 0x1ff))) 32 64::64 word)),1]::8 word) = ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word)::64 word) + (sextend (ucast ((((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) AND 0x1ff))) 32 64::64 word)),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = RDI\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),8]::64 word) = 0x1b674\<close>
declare Q_0x1b83a_50_def[Qs]

schematic_goal raw_pread_0_4_0x1b82a_0x1b836_50[blocks]:
  assumes \<open>(P_0x1b82a_false_50 && P_0x1b82a_false_50_regions && ! ZF) \<sigma>\<close>
  shows \<open>exec_block 4 0x1b836 50 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x1b83a_50 ?\<sigma> \<and> block_usage P_0x1b82a_false_50_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x1b82a_false_50_def P_0x1b82a_false_50_regions_def post: Q_0x1b83a_50_def regionset: P_0x1b82a_false_50_regions_set_def)

definition P_0x1b83a_true_51 :: state_pred where
  \<open>P_0x1b83a_true_51 \<sigma> \<equiv> RIP \<sigma> = 0x1b83a \<and> RAX \<sigma> = ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word)::64 word) + (sextend (ucast ((((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) AND 0x1ff))) 32 64::64 word)),1]::8 word)) \<and> RBX \<sigma> = RSI\<^sub>0 \<and> RCX \<sigma> = ucast ((if' ((((\<langle>31,0\<rangle>((RCX\<^sub>0::64 word) + (((\<langle>63,0\<rangle>((ucast (((((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) AND 0x1ff)::32 word))::64 word) * (0x1::64 word))::64 word)::64 word) + 0x1ff))::32 word)::32 word) AND 0xfffffe00)::32 word) >s 0x4000 then 0x4000 else ((((\<langle>31,0\<rangle>((RCX\<^sub>0::64 word) + (((\<langle>63,0\<rangle>((ucast (((((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) AND 0x1ff)::32 word))::64 word) * (0x1::64 word))::64 word)::64 word) + 0x1ff))::32 word)::32 word) AND 0xfffffe00)::32 word))) \<and> RDX \<sigma> = (sextend (ucast (((0x200::32 word) - (((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) AND 0x1ff)))) 32 64::64 word) \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = (((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word)::64 word) + (sextend (ucast ((((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) AND 0x1ff))) 32 64::64 word)) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x48) \<and> RBP \<sigma> = RDX\<^sub>0 \<and> R15 \<sigma> = ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)) \<and> R14 \<sigma> = (sextend (ucast ((((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) AND 0x1ff))) 32 64::64 word) \<and> R13 \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> R12 \<sigma> = ucast (((0x200::32 word) - (((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) AND 0x1ff))) \<and> R9 \<sigma> = R9\<^sub>0 \<and> (\<sigma> \<turnstile> *[RDX\<^sub>0,1]::8 word) = ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word)::64 word) + (sextend (ucast ((((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) AND 0x1ff))) 32 64::64 word)),1]::8 word)) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word)::64 word) + (sextend (ucast ((((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) AND 0x1ff))) 32 64::64 word)),1]::8 word) = ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word)::64 word) + (sextend (ucast ((((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) AND 0x1ff))) 32 64::64 word)),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = RDI\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),8]::64 word) = 0x1b674\<close>
declare P_0x1b83a_true_51_def[Ps]

definition P_0x1b83a_true_51_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x1b83a_true_51_regions_set \<sigma> \<equiv> {
    (0, RDX\<^sub>0, Suc 0),
    (1, RSP\<^sub>0, 8),
    (2, ((RDI\<^sub>0::64 word) + 0x40), 8),
    (3, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28), 8),
    (4, (((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word)::64 word) + (sextend (ucast ((((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) AND 0x1ff))) 32 64::64 word)), Suc 0),
    (5, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (11, ((RSP\<^sub>0::64 word) - 0x40), 8),
    (12, ((RSP\<^sub>0::64 word) - 0x50), 8)
  }\<close>

definition P_0x1b83a_true_51_regions :: state_pred where
  \<open>P_0x1b83a_true_51_regions \<sigma> \<equiv> \<exists>regions. P_0x1b83a_true_51_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x1b75f_51 :: state_pred where
  \<open>Q_0x1b75f_51 \<sigma> \<equiv> RIP \<sigma> = 0x1b75f \<and> RBX \<sigma> = RSI\<^sub>0 \<and> RDX \<sigma> = (sextend (ucast (((0x200::32 word) - (((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) AND 0x1ff)))) 32 64::64 word) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x48) \<and> RBP \<sigma> = RDX\<^sub>0 \<and> R15 \<sigma> = ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)) \<and> R14 \<sigma> = (sextend (ucast ((((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) AND 0x1ff))) 32 64::64 word) \<and> R13 \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> R12 \<sigma> = ucast (((0x200::32 word) - (((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) AND 0x1ff))) \<and> R9 \<sigma> = R9\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = RDI\<^sub>0\<close>
declare Q_0x1b75f_51_def[Qs]

schematic_goal raw_pread_0_1_0x1b83a_0x1b83a_51[blocks]:
  assumes \<open>(P_0x1b83a_true_51 && P_0x1b83a_true_51_regions && ZF) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x1b83a 51 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x1b75f_51 ?\<sigma> \<and> block_usage P_0x1b83a_true_51_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x1b83a_true_51_def P_0x1b83a_true_51_regions_def post: Q_0x1b75f_51_def regionset: P_0x1b83a_true_51_regions_set_def)

definition P_0x1b83a_false_52 :: state_pred where
  \<open>P_0x1b83a_false_52 \<sigma> \<equiv> RIP \<sigma> = 0x1b83a \<and> RAX \<sigma> = ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word)::64 word) + (sextend (ucast ((((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) AND 0x1ff))) 32 64::64 word)),1]::8 word)) \<and> RBX \<sigma> = RSI\<^sub>0 \<and> RCX \<sigma> = ucast ((if' ((((\<langle>31,0\<rangle>((RCX\<^sub>0::64 word) + (((\<langle>63,0\<rangle>((ucast (((((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) AND 0x1ff)::32 word))::64 word) * (0x1::64 word))::64 word)::64 word) + 0x1ff))::32 word)::32 word) AND 0xfffffe00)::32 word) >s 0x4000 then 0x4000 else ((((\<langle>31,0\<rangle>((RCX\<^sub>0::64 word) + (((\<langle>63,0\<rangle>((ucast (((((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) AND 0x1ff)::32 word))::64 word) * (0x1::64 word))::64 word)::64 word) + 0x1ff))::32 word)::32 word) AND 0xfffffe00)::32 word))) \<and> RDX \<sigma> = (sextend (ucast (((0x200::32 word) - (((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) AND 0x1ff)))) 32 64::64 word) \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = (((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word)::64 word) + (sextend (ucast ((((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) AND 0x1ff))) 32 64::64 word)) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x48) \<and> RBP \<sigma> = RDX\<^sub>0 \<and> R15 \<sigma> = ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)) \<and> R14 \<sigma> = (sextend (ucast ((((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) AND 0x1ff))) 32 64::64 word) \<and> R13 \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> R12 \<sigma> = ucast (((0x200::32 word) - (((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) AND 0x1ff))) \<and> R9 \<sigma> = R9\<^sub>0 \<and> (\<sigma> \<turnstile> *[RDX\<^sub>0,1]::8 word) = ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word)::64 word) + (sextend (ucast ((((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) AND 0x1ff))) 32 64::64 word)),1]::8 word)) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word)::64 word) + (sextend (ucast ((((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) AND 0x1ff))) 32 64::64 word)),1]::8 word) = ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word)::64 word) + (sextend (ucast ((((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) AND 0x1ff))) 32 64::64 word)),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = RDI\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),8]::64 word) = 0x1b674\<close>
declare P_0x1b83a_false_52_def[Ps]

definition P_0x1b83a_false_52_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x1b83a_false_52_regions_set \<sigma> \<equiv> {
    (0, RDX\<^sub>0, Suc 0),
    (1, RSP\<^sub>0, 8),
    (2, ((RDI\<^sub>0::64 word) + 0x40), 8),
    (3, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28), 8),
    (4, (((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word)::64 word) + (sextend (ucast ((((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) AND 0x1ff))) 32 64::64 word)), Suc 0),
    (5, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (11, ((RSP\<^sub>0::64 word) - 0x40), 8),
    (12, ((RSP\<^sub>0::64 word) - 0x50), 8),
    (13, ((((RDX\<^sub>0::64 word) + (\<langle>63,0\<rangle>((ucast ((((0x200::32 word) - (((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) AND 0x1ff))::32 word))::64 word) * (0x1::64 word))::64 word))::64 word) - 0x2), 2),
    (14, (((((((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word)::64 word) + (sextend (ucast ((((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) AND 0x1ff))) 32 64::64 word))::64 word) + (\<langle>63,0\<rangle>((ucast ((((0x200::32 word) - (((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) AND 0x1ff))::32 word))::64 word) * (0x1::64 word))::64 word))::64 word) - 0x2), 2)
  }\<close>

definition P_0x1b83a_false_52_regions :: state_pred where
  \<open>P_0x1b83a_false_52_regions \<sigma> \<equiv> \<exists>regions. P_0x1b83a_false_52_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x1b75f_52 :: state_pred where
  \<open>Q_0x1b75f_52 \<sigma> \<equiv> RIP \<sigma> = 0x1b75f \<and> RBX \<sigma> = RSI\<^sub>0 \<and> RDX \<sigma> = (sextend (ucast (((0x200::32 word) - (((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) AND 0x1ff)))) 32 64::64 word) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x48) \<and> RBP \<sigma> = RDX\<^sub>0 \<and> R15 \<sigma> = ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)) \<and> R14 \<sigma> = (sextend (ucast ((((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) AND 0x1ff))) 32 64::64 word) \<and> R13 \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> R12 \<sigma> = ucast (((0x200::32 word) - (((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) AND 0x1ff))) \<and> R9 \<sigma> = R9\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = RDI\<^sub>0\<close>
declare Q_0x1b75f_52_def[Qs]

schematic_goal raw_pread_0_5_0x1b83a_0x1b84d_52[blocks]:
  assumes \<open>(P_0x1b83a_false_52 && P_0x1b83a_false_52_regions && ! ZF) \<sigma>\<close>
  shows \<open>exec_block 5 0x1b84d 52 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x1b75f_52 ?\<sigma> \<and> block_usage P_0x1b83a_false_52_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x1b83a_false_52_def P_0x1b83a_false_52_regions_def post: Q_0x1b75f_52_def regionset: P_0x1b83a_false_52_regions_set_def)

definition P_0x1b726_false_53 :: state_pred where
  \<open>P_0x1b726_false_53 \<sigma> \<equiv> RIP \<sigma> = 0x1b726 \<and> RAX \<sigma> = ucast (((0x200::32 word) - (((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) AND 0x1ff))) \<and> RBX \<sigma> = RSI\<^sub>0 \<and> RCX \<sigma> = ucast ((if' ((((\<langle>31,0\<rangle>((RCX\<^sub>0::64 word) + (((\<langle>63,0\<rangle>((ucast (((((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) AND 0x1ff)::32 word))::64 word) * (0x1::64 word))::64 word)::64 word) + 0x1ff))::32 word)::32 word) AND 0xfffffe00)::32 word) >s 0x4000 then 0x4000 else ((((\<langle>31,0\<rangle>((RCX\<^sub>0::64 word) + (((\<langle>63,0\<rangle>((ucast (((((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) AND 0x1ff)::32 word))::64 word) * (0x1::64 word))::64 word)::64 word) + 0x1ff))::32 word)::32 word) AND 0xfffffe00)::32 word))) \<and> RDX \<sigma> = (sextend (ucast (((0x200::32 word) - (((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) AND 0x1ff)))) 32 64::64 word) \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = (((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word)::64 word) + (sextend (ucast ((((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) AND 0x1ff))) 32 64::64 word)) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x48) \<and> RBP \<sigma> = RDX\<^sub>0 \<and> R15 \<sigma> = ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)) \<and> R14 \<sigma> = (sextend (ucast ((((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) AND 0x1ff))) 32 64::64 word) \<and> R13 \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> R12 \<sigma> = ucast (((0x200::32 word) - (((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) AND 0x1ff))) \<and> R9 \<sigma> = R9\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = RDI\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),8]::64 word) = 0x1b674\<close>
declare P_0x1b726_false_53_def[Ps]

definition P_0x1b726_false_53_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x1b726_false_53_regions_set \<sigma> \<equiv> {
    (0, RDX\<^sub>0, 8),
    (1, RSP\<^sub>0, 8),
    (2, ((RDI\<^sub>0::64 word) + 0x40), 8),
    (3, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28), 8),
    (4, (((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word)::64 word) + (sextend (ucast ((((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) AND 0x1ff))) 32 64::64 word)), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (11, ((RSP\<^sub>0::64 word) - 0x40), 8),
    (12, ((RSP\<^sub>0::64 word) - 0x50), 8),
    (13, ((((RDX\<^sub>0::64 word) + (\<langle>63,0\<rangle>((ucast ((((0x200::32 word) - (((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) AND 0x1ff))::32 word))::64 word) * (0x1::64 word))::64 word))::64 word) - 0x8), 8),
    (14, (((((((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word)::64 word) + (sextend (ucast ((((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) AND 0x1ff))) 32 64::64 word))::64 word) + (\<langle>63,0\<rangle>((ucast ((((0x200::32 word) - (((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) AND 0x1ff))::32 word))::64 word) * (0x1::64 word))::64 word))::64 word) - 0x8), 8)
  }\<close>

definition P_0x1b726_false_53_regions :: state_pred where
  \<open>P_0x1b726_false_53_regions \<sigma> \<equiv> \<exists>regions. P_0x1b726_false_53_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x1b75c_53 :: state_pred where
  \<open>Q_0x1b75c_53 \<sigma> \<equiv> RIP \<sigma> = 0x1b75c \<and> RAX \<sigma> = ucast (((ucast (((\<langle>31,0\<rangle>(((((\<langle>63,0\<rangle>((((RDX\<^sub>0::64 word) - ((((RDX\<^sub>0::64 word) + 0x8)::64 word) AND 0xfffffffffffffff8))::64 word) * 0x1)::64 word)::64 word) - (ucast (((((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) AND 0x1ff)::32 word))::64 word))::64 word) + (ucast ((0x200::32 word))::64 word))::32 word)::32 word))::32 word) >> 3)) \<and> RBX \<sigma> = RSI\<^sub>0 \<and> RCX \<sigma> = ucast (((ucast (((\<langle>31,0\<rangle>(((((\<langle>63,0\<rangle>((((RDX\<^sub>0::64 word) - ((((RDX\<^sub>0::64 word) + 0x8)::64 word) AND 0xfffffffffffffff8))::64 word) * 0x1)::64 word)::64 word) - (ucast (((((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) AND 0x1ff)::32 word))::64 word))::64 word) + (ucast ((0x200::32 word))::64 word))::32 word)::32 word))::32 word) >> 3)) \<and> RDX \<sigma> = (sextend (ucast (((0x200::32 word) - (((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) AND 0x1ff)))) 32 64::64 word) \<and> RDI \<sigma> = ((((RDX\<^sub>0::64 word) + 0x8)::64 word) AND 0xfffffffffffffff8) \<and> RSI \<sigma> = (((((((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word)::64 word) + (sextend (ucast ((((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) AND 0x1ff))) 32 64::64 word))::64 word) - RDX\<^sub>0)::64 word) + ((((RDX\<^sub>0::64 word) + 0x8)::64 word) AND 0xfffffffffffffff8)) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x48) \<and> RBP \<sigma> = RDX\<^sub>0 \<and> R15 \<sigma> = ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)) \<and> R14 \<sigma> = (sextend (ucast ((((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) AND 0x1ff))) 32 64::64 word) \<and> R13 \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> R12 \<sigma> = ucast (((0x200::32 word) - (((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) AND 0x1ff))) \<and> R9 \<sigma> = R9\<^sub>0 \<and> (\<sigma> \<turnstile> *[RDX\<^sub>0,8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word)::64 word) + (sextend (ucast ((((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) AND 0x1ff))) 32 64::64 word)),8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word)::64 word) + (sextend (ucast ((((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) AND 0x1ff))) 32 64::64 word)),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word)::64 word) + (sextend (ucast ((((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) AND 0x1ff))) 32 64::64 word)),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = RDI\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),8]::64 word) = 0x1b674 \<and> (\<sigma> \<turnstile> *[((((RDX\<^sub>0::64 word) + (\<langle>63,0\<rangle>((ucast ((((0x200::32 word) - (((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) AND 0x1ff))::32 word))::64 word) * (0x1::64 word))::64 word))::64 word) - 0x8),8]::64 word) = (\<sigma> \<turnstile> *[(((((((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word)::64 word) + (sextend (ucast ((((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) AND 0x1ff))) 32 64::64 word))::64 word) + (\<langle>63,0\<rangle>((ucast ((((0x200::32 word) - (((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) AND 0x1ff))::32 word))::64 word) * (0x1::64 word))::64 word))::64 word) - 0x8),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((((((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word)::64 word) + (sextend (ucast ((((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) AND 0x1ff))) 32 64::64 word))::64 word) + (\<langle>63,0\<rangle>((ucast ((((0x200::32 word) - (((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) AND 0x1ff))::32 word))::64 word) * (0x1::64 word))::64 word))::64 word) - 0x8),8]::64 word) = (\<sigma> \<turnstile> *[(((((((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word)::64 word) + (sextend (ucast ((((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) AND 0x1ff))) 32 64::64 word))::64 word) + (\<langle>63,0\<rangle>((ucast ((((0x200::32 word) - (((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) AND 0x1ff))::32 word))::64 word) * (0x1::64 word))::64 word))::64 word) - 0x8),8]::64 word)\<close>
declare Q_0x1b75c_53_def[Qs]

schematic_goal raw_pread_0_15_0x1b726_0x1b75a_53[blocks]:
  assumes \<open>(P_0x1b726_false_53 && P_0x1b726_false_53_regions && ! CF) \<sigma>\<close>
  shows \<open>exec_block 15 0x1b75a 53 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x1b75c_53 ?\<sigma> \<and> block_usage P_0x1b726_false_53_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x1b726_false_53_def P_0x1b726_false_53_regions_def post: Q_0x1b75c_53_def regionset: P_0x1b726_false_53_regions_set_def)

definition P_0x1b75c_54 :: state_pred where
  \<open>P_0x1b75c_54 \<sigma> \<equiv> RIP \<sigma> = 0x1b75c \<and> RAX \<sigma> = ucast (((ucast (((\<langle>31,0\<rangle>(((((\<langle>63,0\<rangle>((((RDX\<^sub>0::64 word) - ((((RDX\<^sub>0::64 word) + 0x8)::64 word) AND 0xfffffffffffffff8))::64 word) * 0x1)::64 word)::64 word) - (ucast (((((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) AND 0x1ff)::32 word))::64 word))::64 word) + (ucast ((0x200::32 word))::64 word))::32 word)::32 word))::32 word) >> 3)) \<and> RBX \<sigma> = RSI\<^sub>0 \<and> RCX \<sigma> = ucast (((ucast (((\<langle>31,0\<rangle>(((((\<langle>63,0\<rangle>((((RDX\<^sub>0::64 word) - ((((RDX\<^sub>0::64 word) + 0x8)::64 word) AND 0xfffffffffffffff8))::64 word) * 0x1)::64 word)::64 word) - (ucast (((((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) AND 0x1ff)::32 word))::64 word))::64 word) + (ucast ((0x200::32 word))::64 word))::32 word)::32 word))::32 word) >> 3)) \<and> RDX \<sigma> = (sextend (ucast (((0x200::32 word) - (((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) AND 0x1ff)))) 32 64::64 word) \<and> RDI \<sigma> = ((((RDX\<^sub>0::64 word) + 0x8)::64 word) AND 0xfffffffffffffff8) \<and> RSI \<sigma> = (((((((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word)::64 word) + (sextend (ucast ((((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) AND 0x1ff))) 32 64::64 word))::64 word) - RDX\<^sub>0)::64 word) + ((((RDX\<^sub>0::64 word) + 0x8)::64 word) AND 0xfffffffffffffff8)) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x48) \<and> RBP \<sigma> = RDX\<^sub>0 \<and> R15 \<sigma> = ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)) \<and> R14 \<sigma> = (sextend (ucast ((((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) AND 0x1ff))) 32 64::64 word) \<and> R13 \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> R12 \<sigma> = ucast (((0x200::32 word) - (((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) AND 0x1ff))) \<and> R9 \<sigma> = R9\<^sub>0 \<and> (\<sigma> \<turnstile> *[RDX\<^sub>0,8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word)::64 word) + (sextend (ucast ((((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) AND 0x1ff))) 32 64::64 word)),8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word)::64 word) + (sextend (ucast ((((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) AND 0x1ff))) 32 64::64 word)),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word)::64 word) + (sextend (ucast ((((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) AND 0x1ff))) 32 64::64 word)),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = RDI\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),8]::64 word) = 0x1b674 \<and> (\<sigma> \<turnstile> *[((((RDX\<^sub>0::64 word) + (\<langle>63,0\<rangle>((ucast ((((0x200::32 word) - (((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) AND 0x1ff))::32 word))::64 word) * (0x1::64 word))::64 word))::64 word) - 0x8),8]::64 word) = (\<sigma> \<turnstile> *[(((((((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word)::64 word) + (sextend (ucast ((((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) AND 0x1ff))) 32 64::64 word))::64 word) + (\<langle>63,0\<rangle>((ucast ((((0x200::32 word) - (((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) AND 0x1ff))::32 word))::64 word) * (0x1::64 word))::64 word))::64 word) - 0x8),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((((((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word)::64 word) + (sextend (ucast ((((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) AND 0x1ff))) 32 64::64 word))::64 word) + (\<langle>63,0\<rangle>((ucast ((((0x200::32 word) - (((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) AND 0x1ff))::32 word))::64 word) * (0x1::64 word))::64 word))::64 word) - 0x8),8]::64 word) = (\<sigma> \<turnstile> *[(((((((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word)::64 word) + (sextend (ucast ((((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) AND 0x1ff))) 32 64::64 word))::64 word) + (\<langle>63,0\<rangle>((ucast ((((0x200::32 word) - (((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) AND 0x1ff))::32 word))::64 word) * (0x1::64 word))::64 word))::64 word) - 0x8),8]::64 word)\<close>
declare P_0x1b75c_54_def[Ps]

definition P_0x1b75c_54_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x1b75c_54_regions_set \<sigma> \<equiv> {
    (0, RDX\<^sub>0, 8),
    (1, RSP\<^sub>0, 8),
    (2, ((RDI\<^sub>0::64 word) + 0x40), 8),
    (3, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28), 8),
    (4, (((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word)::64 word) + (sextend (ucast ((((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) AND 0x1ff))) 32 64::64 word)), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (11, ((RSP\<^sub>0::64 word) - 0x40), 8),
    (12, ((RSP\<^sub>0::64 word) - 0x50), 8),
    (13, ((((RDX\<^sub>0::64 word) + (\<langle>63,0\<rangle>((ucast ((((0x200::32 word) - (((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) AND 0x1ff))::32 word))::64 word) * (0x1::64 word))::64 word))::64 word) - 0x8), 8),
    (14, (((((((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word)::64 word) + (sextend (ucast ((((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) AND 0x1ff))) 32 64::64 word))::64 word) + (\<langle>63,0\<rangle>((ucast ((((0x200::32 word) - (((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) AND 0x1ff))::32 word))::64 word) * (0x1::64 word))::64 word))::64 word) - 0x8), 8)
  }\<close>

definition P_0x1b75c_54_regions :: state_pred where
  \<open>P_0x1b75c_54_regions \<sigma> \<equiv> \<exists>regions. P_0x1b75c_54_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_rep_movs_ESRDI_DSRSI_addr_0x1b75c_54 :: state_pred where
  \<open>Q_rep_movs_ESRDI_DSRSI_addr_0x1b75c_54 \<sigma> \<equiv> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x50) \<and> RIP \<sigma> = rep_movs_ESRDI_DSRSI_addr \<and> RAX \<sigma> = ucast (((ucast (((\<langle>31,0\<rangle>(((((\<langle>63,0\<rangle>((((RDX\<^sub>0::64 word) - ((((RDX\<^sub>0::64 word) + 0x8)::64 word) AND 0xfffffffffffffff8))::64 word) * 0x1)::64 word)::64 word) - (ucast (((((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) AND 0x1ff)::32 word))::64 word))::64 word) + (ucast ((0x200::32 word))::64 word))::32 word)::32 word))::32 word) >> 3)) \<and> RBX \<sigma> = RSI\<^sub>0 \<and> RDX \<sigma> = (sextend (ucast (((0x200::32 word) - (((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) AND 0x1ff)))) 32 64::64 word) \<and> RBP \<sigma> = RDX\<^sub>0 \<and> R15 \<sigma> = ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)) \<and> R14 \<sigma> = (sextend (ucast ((((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) AND 0x1ff))) 32 64::64 word) \<and> R13 \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> R12 \<sigma> = ucast (((0x200::32 word) - (((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) AND 0x1ff))) \<and> R9 \<sigma> = R9\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = RDI\<^sub>0\<close>
declare Q_rep_movs_ESRDI_DSRSI_addr_0x1b75c_54_def[Qs]

schematic_goal raw_pread_0_1_0x1b75c_0x1b75c_54[blocks]:
  assumes \<open>(P_0x1b75c_54 && P_0x1b75c_54_regions) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x1b75c 54 \<sigma> \<triangleq> ?\<sigma> \<and> Q_rep_movs_ESRDI_DSRSI_addr_0x1b75c_54 ?\<sigma> \<and> block_usage P_0x1b75c_54_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x1b75c_54_def P_0x1b75c_54_regions_def post: Q_rep_movs_ESRDI_DSRSI_addr_0x1b75c_54_def regionset: P_0x1b75c_54_regions_set_def)

definition P_0x1b75f_55 :: state_pred where
  \<open>P_0x1b75f_55 \<sigma> \<equiv> RIP \<sigma> = 0x1b75f \<and> RBX \<sigma> = RSI\<^sub>0 \<and> RDX \<sigma> = (sextend (ucast (((0x200::32 word) - (((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) AND 0x1ff)))) 32 64::64 word) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x48) \<and> RBP \<sigma> = RDX\<^sub>0 \<and> R15 \<sigma> = ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)) \<and> R14 \<sigma> = (sextend (ucast ((((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) AND 0x1ff))) 32 64::64 word) \<and> R13 \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> R12 \<sigma> = ucast (((0x200::32 word) - (((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) AND 0x1ff))) \<and> R9 \<sigma> = R9\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = RDI\<^sub>0\<close>
declare P_0x1b75f_55_def[Ps]

definition P_0x1b75f_55_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x1b75f_55_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((RDI\<^sub>0::64 word) + 0x40), 8),
    (2, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x40), 8)
  }\<close>

definition P_0x1b75f_55_regions :: state_pred where
  \<open>P_0x1b75f_55_regions \<sigma> \<equiv> \<exists>regions. P_0x1b75f_55_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x1b768_55 :: state_pred where
  \<open>Q_0x1b768_55 \<sigma> \<equiv> RIP \<sigma> = 0x1b768 \<and> RBX \<sigma> = ((RSI\<^sub>0::64 word) + (sextend (ucast (((0x200::32 word) - (((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) AND 0x1ff)))) 32 64::64 word)) \<and> RDX \<sigma> = (sextend (ucast (((0x200::32 word) - (((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) AND 0x1ff)))) 32 64::64 word) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x48) \<and> RBP \<sigma> = ((RDX\<^sub>0::64 word) + (sextend (ucast (((0x200::32 word) - (((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) AND 0x1ff)))) 32 64::64 word)) \<and> R15 \<sigma> = ucast ((((((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) + (((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) AND 0x1ff))::32 word) - 0x200)) \<and> R14 \<sigma> = (sextend (ucast ((((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) AND 0x1ff))) 32 64::64 word) \<and> R13 \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> R12 \<sigma> = ucast (((0x200::32 word) - (((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) AND 0x1ff))) \<and> R9 \<sigma> = R9\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = RDI\<^sub>0\<close>
declare Q_0x1b768_55_def[Qs]

schematic_goal raw_pread_0_3_0x1b75f_0x1b765_55[blocks]:
  assumes \<open>(P_0x1b75f_55 && P_0x1b75f_55_regions) \<sigma>\<close>
  shows \<open>exec_block 3 0x1b765 55 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x1b768_55 ?\<sigma> \<and> block_usage P_0x1b75f_55_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x1b75f_55_def P_0x1b75f_55_regions_def post: Q_0x1b768_55_def regionset: P_0x1b75f_55_regions_set_def)

definition P_0x1b768_true_56 :: state_pred where
  \<open>P_0x1b768_true_56 \<sigma> \<equiv> RIP \<sigma> = 0x1b768 \<and> RBX \<sigma> = ((RSI\<^sub>0::64 word) + (sextend (ucast (((0x200::32 word) - (((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) AND 0x1ff)))) 32 64::64 word)) \<and> RDX \<sigma> = (sextend (ucast (((0x200::32 word) - (((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) AND 0x1ff)))) 32 64::64 word) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x48) \<and> RBP \<sigma> = ((RDX\<^sub>0::64 word) + (sextend (ucast (((0x200::32 word) - (((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) AND 0x1ff)))) 32 64::64 word)) \<and> R15 \<sigma> = ucast ((((((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) + (((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) AND 0x1ff))::32 word) - 0x200)) \<and> R14 \<sigma> = (sextend (ucast ((((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) AND 0x1ff))) 32 64::64 word) \<and> R13 \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> R12 \<sigma> = ucast (((0x200::32 word) - (((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) AND 0x1ff))) \<and> R9 \<sigma> = R9\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = RDI\<^sub>0\<close>
declare P_0x1b768_true_56_def[Ps]

definition P_0x1b768_true_56_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x1b768_true_56_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((RDI\<^sub>0::64 word) + 0x40), 8),
    (2, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x40), 8)
  }\<close>

definition P_0x1b768_true_56_regions :: state_pred where
  \<open>P_0x1b768_true_56_regions \<sigma> \<equiv> \<exists>regions. P_0x1b768_true_56_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_ret_address_56 :: state_pred where
  \<open>Q_ret_address_56 \<sigma> \<equiv> RIP \<sigma> = ret_address \<and> RBX \<sigma> = RBX\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) + 0x8) \<and> RBP \<sigma> = RBP\<^sub>0 \<and> R15 \<sigma> = R15\<^sub>0 \<and> R14 \<sigma> = R14\<^sub>0 \<and> R13 \<sigma> = R13\<^sub>0 \<and> R12 \<sigma> = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = RDI\<^sub>0\<close>
declare Q_ret_address_56_def[Qs]

schematic_goal raw_pread_0_10_0x1b768_0x1b807_56[blocks]:
  assumes \<open>(P_0x1b768_true_56 && P_0x1b768_true_56_regions && ZF) \<sigma>\<close>
  shows \<open>exec_block 10 0x1b807 56 \<sigma> \<triangleq> ?\<sigma> \<and> Q_ret_address_56 ?\<sigma> \<and> block_usage P_0x1b768_true_56_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x1b768_true_56_def P_0x1b768_true_56_regions_def post: Q_ret_address_56_def regionset: P_0x1b768_true_56_regions_set_def)

definition P_0x1b768_false_57 :: state_pred where
  \<open>P_0x1b768_false_57 \<sigma> \<equiv> RIP \<sigma> = 0x1b768 \<and> RBX \<sigma> = ((RSI\<^sub>0::64 word) + (sextend (ucast (((0x200::32 word) - (((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) AND 0x1ff)))) 32 64::64 word)) \<and> RDX \<sigma> = (sextend (ucast (((0x200::32 word) - (((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) AND 0x1ff)))) 32 64::64 word) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x48) \<and> RBP \<sigma> = ((RDX\<^sub>0::64 word) + (sextend (ucast (((0x200::32 word) - (((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) AND 0x1ff)))) 32 64::64 word)) \<and> R15 \<sigma> = ucast ((((((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) + (((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) AND 0x1ff))::32 word) - 0x200)) \<and> R14 \<sigma> = (sextend (ucast ((((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) AND 0x1ff))) 32 64::64 word) \<and> R13 \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> R12 \<sigma> = ucast (((0x200::32 word) - (((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) AND 0x1ff))) \<and> R9 \<sigma> = R9\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = RDI\<^sub>0\<close>
declare P_0x1b768_false_57_def[Ps]

definition P_0x1b768_false_57_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x1b768_false_57_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((RDI\<^sub>0::64 word) + 0x40), 8),
    (2, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x40), 8)
  }\<close>

definition P_0x1b768_false_57_regions :: state_pred where
  \<open>P_0x1b768_false_57_regions \<sigma> \<equiv> \<exists>regions. P_0x1b768_false_57_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x1b775_57 :: state_pred where
  \<open>Q_0x1b775_57 \<sigma> \<equiv> RIP \<sigma> = 0x1b775 \<and> RBX \<sigma> = ((RSI\<^sub>0::64 word) + (sextend (ucast (((0x200::32 word) - (((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) AND 0x1ff)))) 32 64::64 word)) \<and> RDX \<sigma> = (sextend (ucast (((0x200::32 word) - (((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) AND 0x1ff)))) 32 64::64 word) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x48) \<and> RBP \<sigma> = ((RDX\<^sub>0::64 word) + (sextend (ucast (((0x200::32 word) - (((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) AND 0x1ff)))) 32 64::64 word)) \<and> R15 \<sigma> = ucast ((((((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) + (((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) AND 0x1ff))::32 word) - 0x200)) \<and> R14 \<sigma> = (sextend (ucast ((((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) AND 0x1ff))) 32 64::64 word) \<and> R13 \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> R12 \<sigma> = ucast (((0x200::32 word) - (((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) AND 0x1ff))) \<and> R9 \<sigma> = R9\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = RDI\<^sub>0\<close>
declare Q_0x1b775_57_def[Qs]

schematic_goal raw_pread_0_2_0x1b768_0x1b76e_57[blocks]:
  assumes \<open>(P_0x1b768_false_57 && P_0x1b768_false_57_regions && ! ZF) \<sigma>\<close>
  shows \<open>exec_block 2 0x1b76e 57 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x1b775_57 ?\<sigma> \<and> block_usage P_0x1b768_false_57_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x1b768_false_57_def P_0x1b768_false_57_regions_def post: Q_0x1b775_57_def regionset: P_0x1b768_false_57_regions_set_def)

definition P_0x1b775_true_58 :: state_pred where
  \<open>P_0x1b775_true_58 \<sigma> \<equiv> RIP \<sigma> = 0x1b775 \<and> RBX \<sigma> = ((RSI\<^sub>0::64 word) + (sextend (ucast (((0x200::32 word) - (((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) AND 0x1ff)))) 32 64::64 word)) \<and> RDX \<sigma> = (sextend (ucast (((0x200::32 word) - (((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) AND 0x1ff)))) 32 64::64 word) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x48) \<and> RBP \<sigma> = ((RDX\<^sub>0::64 word) + (sextend (ucast (((0x200::32 word) - (((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) AND 0x1ff)))) 32 64::64 word)) \<and> R15 \<sigma> = ucast ((((((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) + (((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) AND 0x1ff))::32 word) - 0x200)) \<and> R14 \<sigma> = (sextend (ucast ((((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) AND 0x1ff))) 32 64::64 word) \<and> R13 \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> R12 \<sigma> = ucast (((0x200::32 word) - (((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) AND 0x1ff))) \<and> R9 \<sigma> = R9\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = RDI\<^sub>0\<close>
declare P_0x1b775_true_58_def[Ps]

definition P_0x1b775_true_58_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x1b775_true_58_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((RDI\<^sub>0::64 word) + 0x40), 8),
    (2, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x40), 8)
  }\<close>

definition P_0x1b775_true_58_regions :: state_pred where
  \<open>P_0x1b775_true_58_regions \<sigma> \<equiv> \<exists>regions. P_0x1b775_true_58_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x1b790_58 :: state_pred where
  \<open>Q_0x1b790_58 \<sigma> \<equiv> RIP \<sigma> = 0x1b790 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x48) \<and> R13 \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = RDI\<^sub>0\<close>
declare Q_0x1b790_58_def[Qs]

schematic_goal raw_pread_0_1_0x1b775_0x1b775_58[blocks]:
  assumes \<open>(P_0x1b775_true_58 && P_0x1b775_true_58_regions && !ZF) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x1b775 58 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x1b790_58 ?\<sigma> \<and> block_usage P_0x1b775_true_58_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x1b775_true_58_def P_0x1b775_true_58_regions_def post: Q_0x1b790_58_def regionset: P_0x1b775_true_58_regions_set_def)

definition P_0x1b790_59 :: state_pred where
  \<open>P_0x1b790_59 \<sigma> \<equiv> RIP \<sigma> = 0x1b790 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x48) \<and> R13 \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = RDI\<^sub>0\<close>
declare P_0x1b790_59_def[Ps]

definition P_0x1b790_59_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x1b790_59_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((RDI\<^sub>0::64 word) + 0x40), 8),
    (2, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x40), 8)
  }\<close>

definition P_0x1b790_59_regions :: state_pred where
  \<open>P_0x1b790_59_regions \<sigma> \<equiv> \<exists>regions. P_0x1b790_59_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x1b794_59 :: state_pred where
  \<open>Q_0x1b794_59 \<sigma> \<equiv> RIP \<sigma> = 0x1b794 \<and> RDX \<sigma> = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x48) \<and> R13 \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = RDI\<^sub>0\<close>
declare Q_0x1b794_59_def[Qs]

schematic_goal raw_pread_0_1_0x1b790_0x1b790_59[blocks]:
  assumes \<open>(P_0x1b790_59 && P_0x1b790_59_regions) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x1b790 59 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x1b794_59 ?\<sigma> \<and> block_usage P_0x1b790_59_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x1b790_59_def P_0x1b790_59_regions_def post: Q_0x1b794_59_def regionset: P_0x1b790_59_regions_set_def)

definition P_0x1b794_60 :: state_pred where
  \<open>P_0x1b794_60 \<sigma> \<equiv> RIP \<sigma> = 0x1b794 \<and> RDX \<sigma> = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x48) \<and> R13 \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = RDI\<^sub>0\<close>
declare P_0x1b794_60_def[Ps]

definition P_0x1b794_60_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x1b794_60_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((RDI\<^sub>0::64 word) + 0x40), 8),
    (2, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x40), 8)
  }\<close>

definition P_0x1b794_60_regions :: state_pred where
  \<open>P_0x1b794_60_regions \<sigma> \<equiv> \<exists>regions. P_0x1b794_60_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x1b7b7_60 :: state_pred where
  \<open>Q_0x1b7b7_60 \<sigma> \<equiv> RIP \<sigma> = 0x1b7b7 \<and> RAX \<sigma> = 0x4000 \<and> RCX \<sigma> = ucast ((if' ((((\<langle>31,0\<rangle>((R15 \<sigma>::64 word) + 0x1ff)::32 word)::32 word) AND 0xfffffe00)::32 word) >s 0x4000 then 0x4000 else ((((\<langle>31,0\<rangle>((R15 \<sigma>::64 word) + 0x1ff)::32 word)::32 word) AND 0xfffffe00)::32 word))) \<and> RDX \<sigma> = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word) \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = RBX \<sigma> \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x48) \<and> R13 \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = RDI\<^sub>0\<close>
declare Q_0x1b7b7_60_def[Qs]

schematic_goal raw_pread_0_7_0x1b794_0x1b7b4_60[blocks]:
  assumes \<open>(P_0x1b794_60 && P_0x1b794_60_regions) \<sigma>\<close>
  shows \<open>exec_block 7 0x1b7b4 60 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x1b7b7_60 ?\<sigma> \<and> block_usage P_0x1b794_60_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x1b794_60_def P_0x1b794_60_regions_def post: Q_0x1b7b7_60_def regionset: P_0x1b794_60_regions_set_def)

definition P_0x1b7b7_61 :: state_pred where
  \<open>P_0x1b7b7_61 \<sigma> \<equiv> RIP \<sigma> = 0x1b7b7 \<and> RAX \<sigma> = 0x4000 \<and> RCX \<sigma> = ucast ((if' ((((\<langle>31,0\<rangle>((R15 \<sigma>::64 word) + 0x1ff)::32 word)::32 word) AND 0xfffffe00)::32 word) >s 0x4000 then 0x4000 else ((((\<langle>31,0\<rangle>((R15 \<sigma>::64 word) + 0x1ff)::32 word)::32 word) AND 0xfffffe00)::32 word))) \<and> RDX \<sigma> = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word) \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = RBX \<sigma> \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x48) \<and> R13 \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = RDI\<^sub>0\<close>
declare P_0x1b7b7_61_def[Ps]

definition P_0x1b7b7_61_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x1b7b7_61_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((RDI\<^sub>0::64 word) + 0x40), 8),
    (2, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x40), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x50), 8)
  }\<close>

definition P_0x1b7b7_61_regions :: state_pred where
  \<open>P_0x1b7b7_61_regions \<sigma> \<equiv> \<exists>regions. P_0x1b7b7_61_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_raw_pread_aligned_addr_0x1b7b7_61 :: state_pred where
  \<open>Q_raw_pread_aligned_addr_0x1b7b7_61 \<sigma> \<equiv> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x50) \<and> RIP \<sigma> = raw_pread_aligned_addr \<and> RAX \<sigma> = 0x4000 \<and> RCX \<sigma> = ucast ((if' ((((\<langle>31,0\<rangle>((R15 \<sigma>::64 word) + 0x1ff)::32 word)::32 word) AND 0xfffffe00)::32 word) >s 0x4000 then 0x4000 else ((((\<langle>31,0\<rangle>((R15 \<sigma>::64 word) + 0x1ff)::32 word)::32 word) AND 0xfffffe00)::32 word))) \<and> RDX \<sigma> = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word) \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = RBX \<sigma> \<and> R13 \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = RDI\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),8]::64 word) = 0x1b7bc\<close>
declare Q_raw_pread_aligned_addr_0x1b7b7_61_def[Qs]

schematic_goal raw_pread_0_1_0x1b7b7_0x1b7b7_61[blocks]:
  assumes \<open>(P_0x1b7b7_61 && P_0x1b7b7_61_regions) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x1b7b7 61 \<sigma> \<triangleq> ?\<sigma> \<and> Q_raw_pread_aligned_addr_0x1b7b7_61 ?\<sigma> \<and> block_usage P_0x1b7b7_61_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x1b7b7_61_def P_0x1b7b7_61_regions_def post: Q_raw_pread_aligned_addr_0x1b7b7_61_def regionset: P_0x1b7b7_61_regions_set_def)

definition P_0x1b7bc_62 :: state_pred where
  \<open>P_0x1b7bc_62 \<sigma> \<equiv> RIP \<sigma> = 0x1b7bc \<and> RAX \<sigma> = raw_pread_aligned_0x1b7b7_retval \<and> RCX \<sigma> = ucast ((if' ((((\<langle>31,0\<rangle>((R15 \<sigma>::64 word) + 0x1ff)::32 word)::32 word) AND 0xfffffe00)::32 word) >s 0x4000 then 0x4000 else ((((\<langle>31,0\<rangle>((R15 \<sigma>::64 word) + 0x1ff)::32 word)::32 word) AND 0xfffffe00)::32 word))) \<and> RDX \<sigma> = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word) \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = RBX \<sigma> \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x48) \<and> R13 \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = RDI\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),8]::64 word) = 0x1b7bc\<close>
declare P_0x1b7bc_62_def[Ps]

definition P_0x1b7bc_62_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x1b7bc_62_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((RDI\<^sub>0::64 word) + 0x40), 8),
    (2, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x40), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x50), 8)
  }\<close>

definition P_0x1b7bc_62_regions :: state_pred where
  \<open>P_0x1b7bc_62_regions \<sigma> \<equiv> \<exists>regions. P_0x1b7bc_62_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x1b7be_62 :: state_pred where
  \<open>Q_0x1b7be_62 \<sigma> \<equiv> RIP \<sigma> = 0x1b7be \<and> RAX \<sigma> = raw_pread_aligned_0x1b7b7_retval \<and> RCX \<sigma> = ucast ((if' ((((\<langle>31,0\<rangle>((R15 \<sigma>::64 word) + 0x1ff)::32 word)::32 word) AND 0xfffffe00)::32 word) >s 0x4000 then 0x4000 else ((((\<langle>31,0\<rangle>((R15 \<sigma>::64 word) + 0x1ff)::32 word)::32 word) AND 0xfffffe00)::32 word))) \<and> RDX \<sigma> = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word) \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = RBX \<sigma> \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x48) \<and> R13 \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = RDI\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),8]::64 word) = 0x1b7bc\<close>
declare Q_0x1b7be_62_def[Qs]

schematic_goal raw_pread_0_1_0x1b7bc_0x1b7bc_62[blocks]:
  assumes \<open>(P_0x1b7bc_62 && P_0x1b7bc_62_regions) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x1b7bc 62 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x1b7be_62 ?\<sigma> \<and> block_usage P_0x1b7bc_62_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x1b7bc_62_def P_0x1b7bc_62_regions_def post: Q_0x1b7be_62_def regionset: P_0x1b7bc_62_regions_set_def)

definition P_0x1b7be_true_63 :: state_pred where
  \<open>P_0x1b7be_true_63 \<sigma> \<equiv> RIP \<sigma> = 0x1b7be \<and> RAX \<sigma> = raw_pread_aligned_0x1b7b7_retval \<and> RCX \<sigma> = ucast ((if' ((((\<langle>31,0\<rangle>((R15 \<sigma>::64 word) + 0x1ff)::32 word)::32 word) AND 0xfffffe00)::32 word) >s 0x4000 then 0x4000 else ((((\<langle>31,0\<rangle>((R15 \<sigma>::64 word) + 0x1ff)::32 word)::32 word) AND 0xfffffe00)::32 word))) \<and> RDX \<sigma> = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word) \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = RBX \<sigma> \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x48) \<and> R13 \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = RDI\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),8]::64 word) = 0x1b7bc\<close>
declare P_0x1b7be_true_63_def[Ps]

definition P_0x1b7be_true_63_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x1b7be_true_63_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((RDI\<^sub>0::64 word) + 0x40), 8),
    (2, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x40), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x50), 8)
  }\<close>

definition P_0x1b7be_true_63_regions :: state_pred where
  \<open>P_0x1b7be_true_63_regions \<sigma> \<equiv> \<exists>regions. P_0x1b7be_true_63_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x1b70a_63 :: state_pred where
  \<open>Q_0x1b70a_63 \<sigma> \<equiv> RIP \<sigma> = 0x1b70a \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x48) \<and> R13 \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = RDI\<^sub>0\<close>
declare Q_0x1b70a_63_def[Qs]

schematic_goal raw_pread_0_1_0x1b7be_0x1b7be_63[blocks]:
  assumes \<open>(P_0x1b7be_true_63 && P_0x1b7be_true_63_regions && SF) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x1b7be 63 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x1b70a_63 ?\<sigma> \<and> block_usage P_0x1b7be_true_63_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x1b7be_true_63_def P_0x1b7be_true_63_regions_def post: Q_0x1b70a_63_def regionset: P_0x1b7be_true_63_regions_set_def)

definition P_0x1b7be_false_64 :: state_pred where
  \<open>P_0x1b7be_false_64 \<sigma> \<equiv> RIP \<sigma> = 0x1b7be \<and> RAX \<sigma> = raw_pread_aligned_0x1b7b7_retval \<and> RCX \<sigma> = ucast ((if' ((((\<langle>31,0\<rangle>((R15 \<sigma>::64 word) + 0x1ff)::32 word)::32 word) AND 0xfffffe00)::32 word) >s 0x4000 then 0x4000 else ((((\<langle>31,0\<rangle>((R15 \<sigma>::64 word) + 0x1ff)::32 word)::32 word) AND 0xfffffe00)::32 word))) \<and> RDX \<sigma> = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word) \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = RBX \<sigma> \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x48) \<and> R13 \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = RDI\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),8]::64 word) = 0x1b7bc\<close>
declare P_0x1b7be_false_64_def[Ps]

definition P_0x1b7be_false_64_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x1b7be_false_64_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((RDI\<^sub>0::64 word) + 0x40), 8),
    (2, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x40), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x48), 8),
    (11, ((RSP\<^sub>0::64 word) - 0x50), 8)
  }\<close>

definition P_0x1b7be_false_64_regions :: state_pred where
  \<open>P_0x1b7be_false_64_regions \<sigma> \<equiv> \<exists>regions. P_0x1b7be_false_64_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x1b7df_64 :: state_pred where
  \<open>Q_0x1b7df_64 \<sigma> \<equiv> RIP \<sigma> = 0x1b7df \<and> RAX \<sigma> = ucast ((if' ((\<langle>31,0\<rangle>raw_pread_aligned_0x1b7b7_retval::32 word)::32 word) >s (\<langle>31,0\<rangle>R15 \<sigma>::32 word) then (\<langle>31,0\<rangle>R15 \<sigma>::32 word) else ((\<langle>31,0\<rangle>raw_pread_aligned_0x1b7b7_retval::32 word)::32 word))) \<and> RCX \<sigma> = ucast ((if' ((((\<langle>31,0\<rangle>((R15 \<sigma>::64 word) + 0x1ff)::32 word)::32 word) AND 0xfffffe00)::32 word) >s 0x4000 then 0x4000 else ((((\<langle>31,0\<rangle>((R15 \<sigma>::64 word) + 0x1ff)::32 word)::32 word) AND 0xfffffe00)::32 word))) \<and> RDX \<sigma> = (sextend (ucast ((if' ((\<langle>31,0\<rangle>raw_pread_aligned_0x1b7b7_retval::32 word)::32 word) >s (\<langle>31,0\<rangle>R15 \<sigma>::32 word) then (\<langle>31,0\<rangle>R15 \<sigma>::32 word) else ((\<langle>31,0\<rangle>raw_pread_aligned_0x1b7b7_retval::32 word)::32 word)))) 32 64::64 word) \<and> RDI \<sigma> = RBP \<sigma> \<and> RSI \<sigma> = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x48) \<and> R14 \<sigma> = (sextend (ucast ((if' ((\<langle>31,0\<rangle>raw_pread_aligned_0x1b7b7_retval::32 word)::32 word) >s (\<langle>31,0\<rangle>R15 \<sigma>::32 word) then (\<langle>31,0\<rangle>R15 \<sigma>::32 word) else ((\<langle>31,0\<rangle>raw_pread_aligned_0x1b7b7_retval::32 word)::32 word)))) 32 64::64 word) \<and> R13 \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> R9 \<sigma> = (sextend (ucast ((if' ((\<langle>31,0\<rangle>raw_pread_aligned_0x1b7b7_retval::32 word)::32 word) >s (\<langle>31,0\<rangle>R15 \<sigma>::32 word) then (\<langle>31,0\<rangle>R15 \<sigma>::32 word) else ((\<langle>31,0\<rangle>raw_pread_aligned_0x1b7b7_retval::32 word)::32 word)))) 32 64::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = RDI\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x48),8]::64 word) = (sextend (ucast ((if' ((\<langle>31,0\<rangle>raw_pread_aligned_0x1b7b7_retval::32 word)::32 word) >s (\<langle>31,0\<rangle>R15 \<sigma>::32 word) then (\<langle>31,0\<rangle>R15 \<sigma>::32 word) else ((\<langle>31,0\<rangle>raw_pread_aligned_0x1b7b7_retval::32 word)::32 word)))) 32 64::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),8]::64 word) = 0x1b7bc\<close>
declare Q_0x1b7df_64_def[Qs]

schematic_goal raw_pread_0_9_0x1b7be_0x1b7db_64[blocks]:
  assumes \<open>(P_0x1b7be_false_64 && P_0x1b7be_false_64_regions && ! SF) \<sigma>\<close>
  shows \<open>exec_block 9 0x1b7db 64 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x1b7df_64 ?\<sigma> \<and> block_usage P_0x1b7be_false_64_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x1b7be_false_64_def P_0x1b7be_false_64_regions_def post: Q_0x1b7df_64_def regionset: P_0x1b7be_false_64_regions_set_def)

definition P_0x1b7df_65 :: state_pred where
  \<open>P_0x1b7df_65 \<sigma> \<equiv> RIP \<sigma> = 0x1b7df \<and> RAX \<sigma> = ucast ((if' ((\<langle>31,0\<rangle>raw_pread_aligned_0x1b7b7_retval::32 word)::32 word) >s (\<langle>31,0\<rangle>R15 \<sigma>::32 word) then (\<langle>31,0\<rangle>R15 \<sigma>::32 word) else ((\<langle>31,0\<rangle>raw_pread_aligned_0x1b7b7_retval::32 word)::32 word))) \<and> RCX \<sigma> = ucast ((if' ((((\<langle>31,0\<rangle>((R15 \<sigma>::64 word) + 0x1ff)::32 word)::32 word) AND 0xfffffe00)::32 word) >s 0x4000 then 0x4000 else ((((\<langle>31,0\<rangle>((R15 \<sigma>::64 word) + 0x1ff)::32 word)::32 word) AND 0xfffffe00)::32 word))) \<and> RDX \<sigma> = (sextend (ucast ((if' ((\<langle>31,0\<rangle>raw_pread_aligned_0x1b7b7_retval::32 word)::32 word) >s (\<langle>31,0\<rangle>R15 \<sigma>::32 word) then (\<langle>31,0\<rangle>R15 \<sigma>::32 word) else ((\<langle>31,0\<rangle>raw_pread_aligned_0x1b7b7_retval::32 word)::32 word)))) 32 64::64 word) \<and> RDI \<sigma> = RBP \<sigma> \<and> RSI \<sigma> = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x48) \<and> R14 \<sigma> = (sextend (ucast ((if' ((\<langle>31,0\<rangle>raw_pread_aligned_0x1b7b7_retval::32 word)::32 word) >s (\<langle>31,0\<rangle>R15 \<sigma>::32 word) then (\<langle>31,0\<rangle>R15 \<sigma>::32 word) else ((\<langle>31,0\<rangle>raw_pread_aligned_0x1b7b7_retval::32 word)::32 word)))) 32 64::64 word) \<and> R13 \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> R9 \<sigma> = (sextend (ucast ((if' ((\<langle>31,0\<rangle>raw_pread_aligned_0x1b7b7_retval::32 word)::32 word) >s (\<langle>31,0\<rangle>R15 \<sigma>::32 word) then (\<langle>31,0\<rangle>R15 \<sigma>::32 word) else ((\<langle>31,0\<rangle>raw_pread_aligned_0x1b7b7_retval::32 word)::32 word)))) 32 64::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = RDI\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x48),8]::64 word) = (sextend (ucast ((if' ((\<langle>31,0\<rangle>raw_pread_aligned_0x1b7b7_retval::32 word)::32 word) >s (\<langle>31,0\<rangle>R15 \<sigma>::32 word) then (\<langle>31,0\<rangle>R15 \<sigma>::32 word) else ((\<langle>31,0\<rangle>raw_pread_aligned_0x1b7b7_retval::32 word)::32 word)))) 32 64::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),8]::64 word) = 0x1b7bc\<close>
declare P_0x1b7df_65_def[Ps]

definition P_0x1b7df_65_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x1b7df_65_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((RDI\<^sub>0::64 word) + 0x40), 8),
    (2, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x40), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x48), 8),
    (11, ((RSP\<^sub>0::64 word) - 0x50), 8)
  }\<close>

definition P_0x1b7df_65_regions :: state_pred where
  \<open>P_0x1b7df_65_regions \<sigma> \<equiv> \<exists>regions. P_0x1b7df_65_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_memcpy_addr_0x1b7df_65 :: state_pred where
  \<open>Q_memcpy_addr_0x1b7df_65 \<sigma> \<equiv> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x50) \<and> RIP \<sigma> = memcpy_addr \<and> RAX \<sigma> = ucast ((if' ((\<langle>31,0\<rangle>raw_pread_aligned_0x1b7b7_retval::32 word)::32 word) >s (\<langle>31,0\<rangle>R15 \<sigma>::32 word) then (\<langle>31,0\<rangle>R15 \<sigma>::32 word) else ((\<langle>31,0\<rangle>raw_pread_aligned_0x1b7b7_retval::32 word)::32 word))) \<and> RCX \<sigma> = ucast ((if' ((((\<langle>31,0\<rangle>((R15 \<sigma>::64 word) + 0x1ff)::32 word)::32 word) AND 0xfffffe00)::32 word) >s 0x4000 then 0x4000 else ((((\<langle>31,0\<rangle>((R15 \<sigma>::64 word) + 0x1ff)::32 word)::32 word) AND 0xfffffe00)::32 word))) \<and> RDX \<sigma> = (sextend (ucast ((if' ((\<langle>31,0\<rangle>raw_pread_aligned_0x1b7b7_retval::32 word)::32 word) >s (\<langle>31,0\<rangle>R15 \<sigma>::32 word) then (\<langle>31,0\<rangle>R15 \<sigma>::32 word) else ((\<langle>31,0\<rangle>raw_pread_aligned_0x1b7b7_retval::32 word)::32 word)))) 32 64::64 word) \<and> RDI \<sigma> = RBP \<sigma> \<and> RSI \<sigma> = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word) \<and> R14 \<sigma> = (sextend (ucast ((if' ((\<langle>31,0\<rangle>raw_pread_aligned_0x1b7b7_retval::32 word)::32 word) >s (\<langle>31,0\<rangle>R15 \<sigma>::32 word) then (\<langle>31,0\<rangle>R15 \<sigma>::32 word) else ((\<langle>31,0\<rangle>raw_pread_aligned_0x1b7b7_retval::32 word)::32 word)))) 32 64::64 word) \<and> R13 \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> R9 \<sigma> = (sextend (ucast ((if' ((\<langle>31,0\<rangle>raw_pread_aligned_0x1b7b7_retval::32 word)::32 word) >s (\<langle>31,0\<rangle>R15 \<sigma>::32 word) then (\<langle>31,0\<rangle>R15 \<sigma>::32 word) else ((\<langle>31,0\<rangle>raw_pread_aligned_0x1b7b7_retval::32 word)::32 word)))) 32 64::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = RDI\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x48),8]::64 word) = (sextend (ucast ((if' ((\<langle>31,0\<rangle>raw_pread_aligned_0x1b7b7_retval::32 word)::32 word) >s (\<langle>31,0\<rangle>R15 \<sigma>::32 word) then (\<langle>31,0\<rangle>R15 \<sigma>::32 word) else ((\<langle>31,0\<rangle>raw_pread_aligned_0x1b7b7_retval::32 word)::32 word)))) 32 64::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),8]::64 word) = 0x1b7e4\<close>
declare Q_memcpy_addr_0x1b7df_65_def[Qs]

schematic_goal raw_pread_0_1_0x1b7df_0x1b7df_65[blocks]:
  assumes \<open>(P_0x1b7df_65 && P_0x1b7df_65_regions) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x1b7df 65 \<sigma> \<triangleq> ?\<sigma> \<and> Q_memcpy_addr_0x1b7df_65 ?\<sigma> \<and> block_usage P_0x1b7df_65_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x1b7df_65_def P_0x1b7df_65_regions_def post: Q_memcpy_addr_0x1b7df_65_def regionset: P_0x1b7df_65_regions_set_def)

definition P_0x1b7e4_66 :: state_pred where
  \<open>P_0x1b7e4_66 \<sigma> \<equiv> RIP \<sigma> = 0x1b7e4 \<and> RAX \<sigma> = memcpy_0x1b7df_retval \<and> RCX \<sigma> = ucast ((if' ((((\<langle>31,0\<rangle>((R15 \<sigma>::64 word) + 0x1ff)::32 word)::32 word) AND 0xfffffe00)::32 word) >s 0x4000 then 0x4000 else ((((\<langle>31,0\<rangle>((R15 \<sigma>::64 word) + 0x1ff)::32 word)::32 word) AND 0xfffffe00)::32 word))) \<and> RDX \<sigma> = (sextend (ucast ((if' ((\<langle>31,0\<rangle>raw_pread_aligned_0x1b7b7_retval::32 word)::32 word) >s (\<langle>31,0\<rangle>R15 \<sigma>::32 word) then (\<langle>31,0\<rangle>R15 \<sigma>::32 word) else ((\<langle>31,0\<rangle>raw_pread_aligned_0x1b7b7_retval::32 word)::32 word)))) 32 64::64 word) \<and> RDI \<sigma> = RBP \<sigma> \<and> RSI \<sigma> = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x48) \<and> R14 \<sigma> = (sextend (ucast ((if' ((\<langle>31,0\<rangle>raw_pread_aligned_0x1b7b7_retval::32 word)::32 word) >s (\<langle>31,0\<rangle>R15 \<sigma>::32 word) then (\<langle>31,0\<rangle>R15 \<sigma>::32 word) else ((\<langle>31,0\<rangle>raw_pread_aligned_0x1b7b7_retval::32 word)::32 word)))) 32 64::64 word) \<and> R13 \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> R9 \<sigma> = (sextend (ucast ((if' ((\<langle>31,0\<rangle>raw_pread_aligned_0x1b7b7_retval::32 word)::32 word) >s (\<langle>31,0\<rangle>R15 \<sigma>::32 word) then (\<langle>31,0\<rangle>R15 \<sigma>::32 word) else ((\<langle>31,0\<rangle>raw_pread_aligned_0x1b7b7_retval::32 word)::32 word)))) 32 64::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = RDI\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x48),8]::64 word) = (sextend (ucast ((if' ((\<langle>31,0\<rangle>raw_pread_aligned_0x1b7b7_retval::32 word)::32 word) >s (\<langle>31,0\<rangle>R15 \<sigma>::32 word) then (\<langle>31,0\<rangle>R15 \<sigma>::32 word) else ((\<langle>31,0\<rangle>raw_pread_aligned_0x1b7b7_retval::32 word)::32 word)))) 32 64::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),8]::64 word) = 0x1b7e4\<close>
declare P_0x1b7e4_66_def[Ps]

definition P_0x1b7e4_66_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x1b7e4_66_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((RDI\<^sub>0::64 word) + 0x40), 8),
    (2, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x40), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x48), 8),
    (11, ((RSP\<^sub>0::64 word) - 0x50), 8)
  }\<close>

definition P_0x1b7e4_66_regions :: state_pred where
  \<open>P_0x1b7e4_66_regions \<sigma> \<equiv> \<exists>regions. P_0x1b7e4_66_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x1b7f4_66 :: state_pred where
  \<open>Q_0x1b7f4_66 \<sigma> \<equiv> RIP \<sigma> = 0x1b7f4 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x48) \<and> R13 \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = RDI\<^sub>0\<close>
declare Q_0x1b7f4_66_def[Qs]

schematic_goal raw_pread_0_5_0x1b7e4_0x1b7f1_66[blocks]:
  assumes \<open>(P_0x1b7e4_66 && P_0x1b7e4_66_regions) \<sigma>\<close>
  shows \<open>exec_block 5 0x1b7f1 66 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x1b7f4_66 ?\<sigma> \<and> block_usage P_0x1b7e4_66_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x1b7e4_66_def P_0x1b7e4_66_regions_def post: Q_0x1b7f4_66_def regionset: P_0x1b7e4_66_regions_set_def)

definition P_0x1b7f4_true_67 :: state_pred where
  \<open>P_0x1b7f4_true_67 \<sigma> \<equiv> RIP \<sigma> = 0x1b7f4 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x48) \<and> R13 \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = RDI\<^sub>0\<close>
declare P_0x1b7f4_true_67_def[Ps]

definition P_0x1b7f4_true_67_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x1b7f4_true_67_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((RDI\<^sub>0::64 word) + 0x40), 8),
    (2, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x40), 8)
  }\<close>

definition P_0x1b7f4_true_67_regions :: state_pred where
  \<open>P_0x1b7f4_true_67_regions \<sigma> \<equiv> \<exists>regions. P_0x1b7f4_true_67_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x1b790_67 :: state_pred where
  \<open>Q_0x1b790_67 \<sigma> \<equiv> RIP \<sigma> = 0x1b790 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x48) \<and> R13 \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = RDI\<^sub>0\<close>
declare Q_0x1b790_67_def[Qs]

schematic_goal raw_pread_0_1_0x1b7f4_0x1b7f4_67[blocks]:
  assumes \<open>(P_0x1b7f4_true_67 && P_0x1b7f4_true_67_regions && !ZF) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x1b7f4 67 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x1b790_67 ?\<sigma> \<and> block_usage P_0x1b7f4_true_67_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x1b7f4_true_67_def P_0x1b7f4_true_67_regions_def post: Q_0x1b790_67_def regionset: P_0x1b7f4_true_67_regions_set_def)

definition P_0x1b7f4_false_68 :: state_pred where
  \<open>P_0x1b7f4_false_68 \<sigma> \<equiv> RIP \<sigma> = 0x1b7f4 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x48) \<and> R13 \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = RDI\<^sub>0\<close>
declare P_0x1b7f4_false_68_def[Ps]

definition P_0x1b7f4_false_68_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x1b7f4_false_68_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((RDI\<^sub>0::64 word) + 0x40), 8),
    (2, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x40), 8)
  }\<close>

definition P_0x1b7f4_false_68_regions :: state_pred where
  \<open>P_0x1b7f4_false_68_regions \<sigma> \<equiv> \<exists>regions. P_0x1b7f4_false_68_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x1b7f6_68 :: state_pred where
  \<open>Q_0x1b7f6_68 \<sigma> \<equiv> RIP \<sigma> = 0x1b7f6 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x48) \<and> R13 \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = RDI\<^sub>0\<close>
declare Q_0x1b7f6_68_def[Qs]

schematic_goal raw_pread_0_1_0x1b7f4_0x1b7f4_68[blocks]:
  assumes \<open>(P_0x1b7f4_false_68 && P_0x1b7f4_false_68_regions && ! !ZF) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x1b7f4 68 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x1b7f6_68 ?\<sigma> \<and> block_usage P_0x1b7f4_false_68_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x1b7f4_false_68_def P_0x1b7f4_false_68_regions_def post: Q_0x1b7f6_68_def regionset: P_0x1b7f4_false_68_regions_set_def)

definition P_0x1b7f6_69 :: state_pred where
  \<open>P_0x1b7f6_69 \<sigma> \<equiv> RIP \<sigma> = 0x1b7f6 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x48) \<and> R13 \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = RDI\<^sub>0\<close>
declare P_0x1b7f6_69_def[Ps]

definition P_0x1b7f6_69_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x1b7f6_69_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((RDI\<^sub>0::64 word) + 0x40), 8),
    (2, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x40), 8)
  }\<close>

definition P_0x1b7f6_69_regions :: state_pred where
  \<open>P_0x1b7f6_69_regions \<sigma> \<equiv> \<exists>regions. P_0x1b7f6_69_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_ret_address_69 :: state_pred where
  \<open>Q_ret_address_69 \<sigma> \<equiv> RIP \<sigma> = ret_address \<and> RBX \<sigma> = RBX\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) + 0x8) \<and> RBP \<sigma> = RBP\<^sub>0 \<and> R15 \<sigma> = R15\<^sub>0 \<and> R14 \<sigma> = R14\<^sub>0 \<and> R13 \<sigma> = R13\<^sub>0 \<and> R12 \<sigma> = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = RDI\<^sub>0\<close>
declare Q_ret_address_69_def[Qs]

schematic_goal raw_pread_0_9_0x1b7f6_0x1b807_69[blocks]:
  assumes \<open>(P_0x1b7f6_69 && P_0x1b7f6_69_regions) \<sigma>\<close>
  shows \<open>exec_block 9 0x1b807 69 \<sigma> \<triangleq> ?\<sigma> \<and> Q_ret_address_69 ?\<sigma> \<and> block_usage P_0x1b7f6_69_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x1b7f6_69_def P_0x1b7f6_69_regions_def post: Q_ret_address_69_def regionset: P_0x1b7f6_69_regions_set_def)

definition P_0x1b70a_70 :: state_pred where
  \<open>P_0x1b70a_70 \<sigma> \<equiv> RIP \<sigma> = 0x1b70a \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x48) \<and> R13 \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = RDI\<^sub>0\<close>
declare P_0x1b70a_70_def[Ps]

definition P_0x1b70a_70_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x1b70a_70_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((RDI\<^sub>0::64 word) + 0x40), 8),
    (2, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x40), 8)
  }\<close>

definition P_0x1b70a_70_regions :: state_pred where
  \<open>P_0x1b70a_70_regions \<sigma> \<equiv> \<exists>regions. P_0x1b70a_70_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_ret_address_70 :: state_pred where
  \<open>Q_ret_address_70 \<sigma> \<equiv> RIP \<sigma> = ret_address \<and> RBX \<sigma> = RBX\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) + 0x8) \<and> RBP \<sigma> = RBP\<^sub>0 \<and> R15 \<sigma> = R15\<^sub>0 \<and> R14 \<sigma> = R14\<^sub>0 \<and> R13 \<sigma> = R13\<^sub>0 \<and> R12 \<sigma> = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = RDI\<^sub>0\<close>
declare Q_ret_address_70_def[Qs]

schematic_goal raw_pread_0_8_0x1b70a_0x1b718_70[blocks]:
  assumes \<open>(P_0x1b70a_70 && P_0x1b70a_70_regions) \<sigma>\<close>
  shows \<open>exec_block 8 0x1b718 70 \<sigma> \<triangleq> ?\<sigma> \<and> Q_ret_address_70 ?\<sigma> \<and> block_usage P_0x1b70a_70_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x1b70a_70_def P_0x1b70a_70_regions_def post: Q_ret_address_70_def regionset: P_0x1b70a_70_regions_set_def)

definition P_0x1b775_false_71 :: state_pred where
  \<open>P_0x1b775_false_71 \<sigma> \<equiv> RIP \<sigma> = 0x1b775 \<and> RBX \<sigma> = ((RSI\<^sub>0::64 word) + (sextend (ucast (((0x200::32 word) - (((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) AND 0x1ff)))) 32 64::64 word)) \<and> RDX \<sigma> = (sextend (ucast (((0x200::32 word) - (((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) AND 0x1ff)))) 32 64::64 word) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x48) \<and> RBP \<sigma> = ((RDX\<^sub>0::64 word) + (sextend (ucast (((0x200::32 word) - (((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) AND 0x1ff)))) 32 64::64 word)) \<and> R15 \<sigma> = ucast ((((((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) + (((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) AND 0x1ff))::32 word) - 0x200)) \<and> R14 \<sigma> = (sextend (ucast ((((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) AND 0x1ff))) 32 64::64 word) \<and> R13 \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> R12 \<sigma> = ucast (((0x200::32 word) - (((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) AND 0x1ff))) \<and> R9 \<sigma> = R9\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = RDI\<^sub>0\<close>
declare P_0x1b775_false_71_def[Ps]

definition P_0x1b775_false_71_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x1b775_false_71_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((RDI\<^sub>0::64 word) + 0x40), 8),
    (2, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x40), 8)
  }\<close>

definition P_0x1b775_false_71_regions :: state_pred where
  \<open>P_0x1b775_false_71_regions \<sigma> \<equiv> \<exists>regions. P_0x1b775_false_71_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x1b77d_71 :: state_pred where
  \<open>Q_0x1b77d_71 \<sigma> \<equiv> RIP \<sigma> = 0x1b77d \<and> RBX \<sigma> = ((RSI\<^sub>0::64 word) + (sextend (ucast (((0x200::32 word) - (((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) AND 0x1ff)))) 32 64::64 word)) \<and> RDX \<sigma> = (sextend (ucast (((0x200::32 word) - (((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) AND 0x1ff)))) 32 64::64 word) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x48) \<and> RBP \<sigma> = ((RDX\<^sub>0::64 word) + (sextend (ucast (((0x200::32 word) - (((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) AND 0x1ff)))) 32 64::64 word)) \<and> R15 \<sigma> = ucast ((((((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) + (((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) AND 0x1ff))::32 word) - 0x200)) \<and> R14 \<sigma> = (sextend (ucast ((((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) AND 0x1ff))) 32 64::64 word) \<and> R13 \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> R12 \<sigma> = ucast (((0x200::32 word) - (((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) AND 0x1ff))) \<and> R9 \<sigma> = R9\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = RDI\<^sub>0\<close>
declare Q_0x1b77d_71_def[Qs]

schematic_goal raw_pread_0_2_0x1b775_0x1b777_71[blocks]:
  assumes \<open>(P_0x1b775_false_71 && P_0x1b775_false_71_regions && ! !ZF) \<sigma>\<close>
  shows \<open>exec_block 2 0x1b777 71 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x1b77d_71 ?\<sigma> \<and> block_usage P_0x1b775_false_71_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x1b775_false_71_def P_0x1b775_false_71_regions_def post: Q_0x1b77d_71_def regionset: P_0x1b775_false_71_regions_set_def)

definition P_0x1b77d_true_72 :: state_pred where
  \<open>P_0x1b77d_true_72 \<sigma> \<equiv> RIP \<sigma> = 0x1b77d \<and> RBX \<sigma> = ((RSI\<^sub>0::64 word) + (sextend (ucast (((0x200::32 word) - (((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) AND 0x1ff)))) 32 64::64 word)) \<and> RDX \<sigma> = (sextend (ucast (((0x200::32 word) - (((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) AND 0x1ff)))) 32 64::64 word) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x48) \<and> RBP \<sigma> = ((RDX\<^sub>0::64 word) + (sextend (ucast (((0x200::32 word) - (((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) AND 0x1ff)))) 32 64::64 word)) \<and> R15 \<sigma> = ucast ((((((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) + (((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) AND 0x1ff))::32 word) - 0x200)) \<and> R14 \<sigma> = (sextend (ucast ((((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) AND 0x1ff))) 32 64::64 word) \<and> R13 \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> R12 \<sigma> = ucast (((0x200::32 word) - (((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) AND 0x1ff))) \<and> R9 \<sigma> = R9\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = RDI\<^sub>0\<close>
declare P_0x1b77d_true_72_def[Ps]

definition P_0x1b77d_true_72_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x1b77d_true_72_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((RDI\<^sub>0::64 word) + 0x40), 8),
    (2, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x40), 8)
  }\<close>

definition P_0x1b77d_true_72_regions :: state_pred where
  \<open>P_0x1b77d_true_72_regions \<sigma> \<equiv> \<exists>regions. P_0x1b77d_true_72_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x1b790_72 :: state_pred where
  \<open>Q_0x1b790_72 \<sigma> \<equiv> RIP \<sigma> = 0x1b790 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x48) \<and> R13 \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = RDI\<^sub>0\<close>
declare Q_0x1b790_72_def[Qs]

schematic_goal raw_pread_0_1_0x1b77d_0x1b77d_72[blocks]:
  assumes \<open>(P_0x1b77d_true_72 && P_0x1b77d_true_72_regions && !ZF) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x1b77d 72 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x1b790_72 ?\<sigma> \<and> block_usage P_0x1b77d_true_72_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x1b77d_true_72_def P_0x1b77d_true_72_regions_def post: Q_0x1b790_72_def regionset: P_0x1b77d_true_72_regions_set_def)

definition P_0x1b790_73 :: state_pred where
  \<open>P_0x1b790_73 \<sigma> \<equiv> RIP \<sigma> = 0x1b790 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x48) \<and> R13 \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = RDI\<^sub>0\<close>
declare P_0x1b790_73_def[Ps]

definition P_0x1b790_73_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x1b790_73_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((RDI\<^sub>0::64 word) + 0x40), 8),
    (2, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x40), 8)
  }\<close>

definition P_0x1b790_73_regions :: state_pred where
  \<open>P_0x1b790_73_regions \<sigma> \<equiv> \<exists>regions. P_0x1b790_73_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x1b794_73 :: state_pred where
  \<open>Q_0x1b794_73 \<sigma> \<equiv> RIP \<sigma> = 0x1b794 \<and> RDX \<sigma> = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x48) \<and> R13 \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = RDI\<^sub>0\<close>
declare Q_0x1b794_73_def[Qs]

schematic_goal raw_pread_0_1_0x1b790_0x1b790_73[blocks]:
  assumes \<open>(P_0x1b790_73 && P_0x1b790_73_regions) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x1b790 73 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x1b794_73 ?\<sigma> \<and> block_usage P_0x1b790_73_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x1b790_73_def P_0x1b790_73_regions_def post: Q_0x1b794_73_def regionset: P_0x1b790_73_regions_set_def)

definition P_0x1b794_74 :: state_pred where
  \<open>P_0x1b794_74 \<sigma> \<equiv> RIP \<sigma> = 0x1b794 \<and> RDX \<sigma> = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x48) \<and> R13 \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = RDI\<^sub>0\<close>
declare P_0x1b794_74_def[Ps]

definition P_0x1b794_74_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x1b794_74_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((RDI\<^sub>0::64 word) + 0x40), 8),
    (2, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x40), 8)
  }\<close>

definition P_0x1b794_74_regions :: state_pred where
  \<open>P_0x1b794_74_regions \<sigma> \<equiv> \<exists>regions. P_0x1b794_74_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x1b7b7_74 :: state_pred where
  \<open>Q_0x1b7b7_74 \<sigma> \<equiv> RIP \<sigma> = 0x1b7b7 \<and> RAX \<sigma> = 0x4000 \<and> RCX \<sigma> = ucast ((if' ((((\<langle>31,0\<rangle>((R15 \<sigma>::64 word) + 0x1ff)::32 word)::32 word) AND 0xfffffe00)::32 word) >s 0x4000 then 0x4000 else ((((\<langle>31,0\<rangle>((R15 \<sigma>::64 word) + 0x1ff)::32 word)::32 word) AND 0xfffffe00)::32 word))) \<and> RDX \<sigma> = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word) \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = RBX \<sigma> \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x48) \<and> R13 \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = RDI\<^sub>0\<close>
declare Q_0x1b7b7_74_def[Qs]

schematic_goal raw_pread_0_7_0x1b794_0x1b7b4_74[blocks]:
  assumes \<open>(P_0x1b794_74 && P_0x1b794_74_regions) \<sigma>\<close>
  shows \<open>exec_block 7 0x1b7b4 74 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x1b7b7_74 ?\<sigma> \<and> block_usage P_0x1b794_74_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x1b794_74_def P_0x1b794_74_regions_def post: Q_0x1b7b7_74_def regionset: P_0x1b794_74_regions_set_def)

definition P_0x1b7b7_75 :: state_pred where
  \<open>P_0x1b7b7_75 \<sigma> \<equiv> RIP \<sigma> = 0x1b7b7 \<and> RAX \<sigma> = 0x4000 \<and> RCX \<sigma> = ucast ((if' ((((\<langle>31,0\<rangle>((R15 \<sigma>::64 word) + 0x1ff)::32 word)::32 word) AND 0xfffffe00)::32 word) >s 0x4000 then 0x4000 else ((((\<langle>31,0\<rangle>((R15 \<sigma>::64 word) + 0x1ff)::32 word)::32 word) AND 0xfffffe00)::32 word))) \<and> RDX \<sigma> = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word) \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = RBX \<sigma> \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x48) \<and> R13 \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = RDI\<^sub>0\<close>
declare P_0x1b7b7_75_def[Ps]

definition P_0x1b7b7_75_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x1b7b7_75_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((RDI\<^sub>0::64 word) + 0x40), 8),
    (2, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x40), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x50), 8)
  }\<close>

definition P_0x1b7b7_75_regions :: state_pred where
  \<open>P_0x1b7b7_75_regions \<sigma> \<equiv> \<exists>regions. P_0x1b7b7_75_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_raw_pread_aligned_addr_0x1b7b7_75 :: state_pred where
  \<open>Q_raw_pread_aligned_addr_0x1b7b7_75 \<sigma> \<equiv> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x50) \<and> RIP \<sigma> = raw_pread_aligned_addr \<and> RAX \<sigma> = 0x4000 \<and> RCX \<sigma> = ucast ((if' ((((\<langle>31,0\<rangle>((R15 \<sigma>::64 word) + 0x1ff)::32 word)::32 word) AND 0xfffffe00)::32 word) >s 0x4000 then 0x4000 else ((((\<langle>31,0\<rangle>((R15 \<sigma>::64 word) + 0x1ff)::32 word)::32 word) AND 0xfffffe00)::32 word))) \<and> RDX \<sigma> = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word) \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = RBX \<sigma> \<and> R13 \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = RDI\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),8]::64 word) = 0x1b7bc\<close>
declare Q_raw_pread_aligned_addr_0x1b7b7_75_def[Qs]

schematic_goal raw_pread_0_1_0x1b7b7_0x1b7b7_75[blocks]:
  assumes \<open>(P_0x1b7b7_75 && P_0x1b7b7_75_regions) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x1b7b7 75 \<sigma> \<triangleq> ?\<sigma> \<and> Q_raw_pread_aligned_addr_0x1b7b7_75 ?\<sigma> \<and> block_usage P_0x1b7b7_75_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x1b7b7_75_def P_0x1b7b7_75_regions_def post: Q_raw_pread_aligned_addr_0x1b7b7_75_def regionset: P_0x1b7b7_75_regions_set_def)

definition P_0x1b7bc_76 :: state_pred where
  \<open>P_0x1b7bc_76 \<sigma> \<equiv> RIP \<sigma> = 0x1b7bc \<and> RAX \<sigma> = raw_pread_aligned_0x1b7b7_retval \<and> RCX \<sigma> = ucast ((if' ((((\<langle>31,0\<rangle>((R15 \<sigma>::64 word) + 0x1ff)::32 word)::32 word) AND 0xfffffe00)::32 word) >s 0x4000 then 0x4000 else ((((\<langle>31,0\<rangle>((R15 \<sigma>::64 word) + 0x1ff)::32 word)::32 word) AND 0xfffffe00)::32 word))) \<and> RDX \<sigma> = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word) \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = RBX \<sigma> \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x48) \<and> R13 \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = RDI\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),8]::64 word) = 0x1b7bc\<close>
declare P_0x1b7bc_76_def[Ps]

definition P_0x1b7bc_76_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x1b7bc_76_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((RDI\<^sub>0::64 word) + 0x40), 8),
    (2, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x40), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x50), 8)
  }\<close>

definition P_0x1b7bc_76_regions :: state_pred where
  \<open>P_0x1b7bc_76_regions \<sigma> \<equiv> \<exists>regions. P_0x1b7bc_76_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x1b7be_76 :: state_pred where
  \<open>Q_0x1b7be_76 \<sigma> \<equiv> RIP \<sigma> = 0x1b7be \<and> RAX \<sigma> = raw_pread_aligned_0x1b7b7_retval \<and> RCX \<sigma> = ucast ((if' ((((\<langle>31,0\<rangle>((R15 \<sigma>::64 word) + 0x1ff)::32 word)::32 word) AND 0xfffffe00)::32 word) >s 0x4000 then 0x4000 else ((((\<langle>31,0\<rangle>((R15 \<sigma>::64 word) + 0x1ff)::32 word)::32 word) AND 0xfffffe00)::32 word))) \<and> RDX \<sigma> = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word) \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = RBX \<sigma> \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x48) \<and> R13 \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = RDI\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),8]::64 word) = 0x1b7bc\<close>
declare Q_0x1b7be_76_def[Qs]

schematic_goal raw_pread_0_1_0x1b7bc_0x1b7bc_76[blocks]:
  assumes \<open>(P_0x1b7bc_76 && P_0x1b7bc_76_regions) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x1b7bc 76 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x1b7be_76 ?\<sigma> \<and> block_usage P_0x1b7bc_76_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x1b7bc_76_def P_0x1b7bc_76_regions_def post: Q_0x1b7be_76_def regionset: P_0x1b7bc_76_regions_set_def)

definition P_0x1b7be_true_77 :: state_pred where
  \<open>P_0x1b7be_true_77 \<sigma> \<equiv> RIP \<sigma> = 0x1b7be \<and> RAX \<sigma> = raw_pread_aligned_0x1b7b7_retval \<and> RCX \<sigma> = ucast ((if' ((((\<langle>31,0\<rangle>((R15 \<sigma>::64 word) + 0x1ff)::32 word)::32 word) AND 0xfffffe00)::32 word) >s 0x4000 then 0x4000 else ((((\<langle>31,0\<rangle>((R15 \<sigma>::64 word) + 0x1ff)::32 word)::32 word) AND 0xfffffe00)::32 word))) \<and> RDX \<sigma> = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word) \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = RBX \<sigma> \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x48) \<and> R13 \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = RDI\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),8]::64 word) = 0x1b7bc\<close>
declare P_0x1b7be_true_77_def[Ps]

definition P_0x1b7be_true_77_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x1b7be_true_77_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((RDI\<^sub>0::64 word) + 0x40), 8),
    (2, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x40), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x50), 8)
  }\<close>

definition P_0x1b7be_true_77_regions :: state_pred where
  \<open>P_0x1b7be_true_77_regions \<sigma> \<equiv> \<exists>regions. P_0x1b7be_true_77_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x1b70a_77 :: state_pred where
  \<open>Q_0x1b70a_77 \<sigma> \<equiv> RIP \<sigma> = 0x1b70a \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x48) \<and> R13 \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = RDI\<^sub>0\<close>
declare Q_0x1b70a_77_def[Qs]

schematic_goal raw_pread_0_1_0x1b7be_0x1b7be_77[blocks]:
  assumes \<open>(P_0x1b7be_true_77 && P_0x1b7be_true_77_regions && SF) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x1b7be 77 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x1b70a_77 ?\<sigma> \<and> block_usage P_0x1b7be_true_77_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x1b7be_true_77_def P_0x1b7be_true_77_regions_def post: Q_0x1b70a_77_def regionset: P_0x1b7be_true_77_regions_set_def)

definition P_0x1b7be_false_78 :: state_pred where
  \<open>P_0x1b7be_false_78 \<sigma> \<equiv> RIP \<sigma> = 0x1b7be \<and> RAX \<sigma> = raw_pread_aligned_0x1b7b7_retval \<and> RCX \<sigma> = ucast ((if' ((((\<langle>31,0\<rangle>((R15 \<sigma>::64 word) + 0x1ff)::32 word)::32 word) AND 0xfffffe00)::32 word) >s 0x4000 then 0x4000 else ((((\<langle>31,0\<rangle>((R15 \<sigma>::64 word) + 0x1ff)::32 word)::32 word) AND 0xfffffe00)::32 word))) \<and> RDX \<sigma> = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word) \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = RBX \<sigma> \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x48) \<and> R13 \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = RDI\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),8]::64 word) = 0x1b7bc\<close>
declare P_0x1b7be_false_78_def[Ps]

definition P_0x1b7be_false_78_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x1b7be_false_78_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((RDI\<^sub>0::64 word) + 0x40), 8),
    (2, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x40), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x48), 8),
    (11, ((RSP\<^sub>0::64 word) - 0x50), 8)
  }\<close>

definition P_0x1b7be_false_78_regions :: state_pred where
  \<open>P_0x1b7be_false_78_regions \<sigma> \<equiv> \<exists>regions. P_0x1b7be_false_78_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x1b7df_78 :: state_pred where
  \<open>Q_0x1b7df_78 \<sigma> \<equiv> RIP \<sigma> = 0x1b7df \<and> RAX \<sigma> = ucast ((if' ((\<langle>31,0\<rangle>raw_pread_aligned_0x1b7b7_retval::32 word)::32 word) >s (\<langle>31,0\<rangle>R15 \<sigma>::32 word) then (\<langle>31,0\<rangle>R15 \<sigma>::32 word) else ((\<langle>31,0\<rangle>raw_pread_aligned_0x1b7b7_retval::32 word)::32 word))) \<and> RCX \<sigma> = ucast ((if' ((((\<langle>31,0\<rangle>((R15 \<sigma>::64 word) + 0x1ff)::32 word)::32 word) AND 0xfffffe00)::32 word) >s 0x4000 then 0x4000 else ((((\<langle>31,0\<rangle>((R15 \<sigma>::64 word) + 0x1ff)::32 word)::32 word) AND 0xfffffe00)::32 word))) \<and> RDX \<sigma> = (sextend (ucast ((if' ((\<langle>31,0\<rangle>raw_pread_aligned_0x1b7b7_retval::32 word)::32 word) >s (\<langle>31,0\<rangle>R15 \<sigma>::32 word) then (\<langle>31,0\<rangle>R15 \<sigma>::32 word) else ((\<langle>31,0\<rangle>raw_pread_aligned_0x1b7b7_retval::32 word)::32 word)))) 32 64::64 word) \<and> RDI \<sigma> = RBP \<sigma> \<and> RSI \<sigma> = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x48) \<and> R14 \<sigma> = (sextend (ucast ((if' ((\<langle>31,0\<rangle>raw_pread_aligned_0x1b7b7_retval::32 word)::32 word) >s (\<langle>31,0\<rangle>R15 \<sigma>::32 word) then (\<langle>31,0\<rangle>R15 \<sigma>::32 word) else ((\<langle>31,0\<rangle>raw_pread_aligned_0x1b7b7_retval::32 word)::32 word)))) 32 64::64 word) \<and> R13 \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> R9 \<sigma> = (sextend (ucast ((if' ((\<langle>31,0\<rangle>raw_pread_aligned_0x1b7b7_retval::32 word)::32 word) >s (\<langle>31,0\<rangle>R15 \<sigma>::32 word) then (\<langle>31,0\<rangle>R15 \<sigma>::32 word) else ((\<langle>31,0\<rangle>raw_pread_aligned_0x1b7b7_retval::32 word)::32 word)))) 32 64::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = RDI\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x48),8]::64 word) = (sextend (ucast ((if' ((\<langle>31,0\<rangle>raw_pread_aligned_0x1b7b7_retval::32 word)::32 word) >s (\<langle>31,0\<rangle>R15 \<sigma>::32 word) then (\<langle>31,0\<rangle>R15 \<sigma>::32 word) else ((\<langle>31,0\<rangle>raw_pread_aligned_0x1b7b7_retval::32 word)::32 word)))) 32 64::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),8]::64 word) = 0x1b7bc\<close>
declare Q_0x1b7df_78_def[Qs]

schematic_goal raw_pread_0_9_0x1b7be_0x1b7db_78[blocks]:
  assumes \<open>(P_0x1b7be_false_78 && P_0x1b7be_false_78_regions && ! SF) \<sigma>\<close>
  shows \<open>exec_block 9 0x1b7db 78 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x1b7df_78 ?\<sigma> \<and> block_usage P_0x1b7be_false_78_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x1b7be_false_78_def P_0x1b7be_false_78_regions_def post: Q_0x1b7df_78_def regionset: P_0x1b7be_false_78_regions_set_def)

definition P_0x1b7df_79 :: state_pred where
  \<open>P_0x1b7df_79 \<sigma> \<equiv> RIP \<sigma> = 0x1b7df \<and> RAX \<sigma> = ucast ((if' ((\<langle>31,0\<rangle>raw_pread_aligned_0x1b7b7_retval::32 word)::32 word) >s (\<langle>31,0\<rangle>R15 \<sigma>::32 word) then (\<langle>31,0\<rangle>R15 \<sigma>::32 word) else ((\<langle>31,0\<rangle>raw_pread_aligned_0x1b7b7_retval::32 word)::32 word))) \<and> RCX \<sigma> = ucast ((if' ((((\<langle>31,0\<rangle>((R15 \<sigma>::64 word) + 0x1ff)::32 word)::32 word) AND 0xfffffe00)::32 word) >s 0x4000 then 0x4000 else ((((\<langle>31,0\<rangle>((R15 \<sigma>::64 word) + 0x1ff)::32 word)::32 word) AND 0xfffffe00)::32 word))) \<and> RDX \<sigma> = (sextend (ucast ((if' ((\<langle>31,0\<rangle>raw_pread_aligned_0x1b7b7_retval::32 word)::32 word) >s (\<langle>31,0\<rangle>R15 \<sigma>::32 word) then (\<langle>31,0\<rangle>R15 \<sigma>::32 word) else ((\<langle>31,0\<rangle>raw_pread_aligned_0x1b7b7_retval::32 word)::32 word)))) 32 64::64 word) \<and> RDI \<sigma> = RBP \<sigma> \<and> RSI \<sigma> = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x48) \<and> R14 \<sigma> = (sextend (ucast ((if' ((\<langle>31,0\<rangle>raw_pread_aligned_0x1b7b7_retval::32 word)::32 word) >s (\<langle>31,0\<rangle>R15 \<sigma>::32 word) then (\<langle>31,0\<rangle>R15 \<sigma>::32 word) else ((\<langle>31,0\<rangle>raw_pread_aligned_0x1b7b7_retval::32 word)::32 word)))) 32 64::64 word) \<and> R13 \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> R9 \<sigma> = (sextend (ucast ((if' ((\<langle>31,0\<rangle>raw_pread_aligned_0x1b7b7_retval::32 word)::32 word) >s (\<langle>31,0\<rangle>R15 \<sigma>::32 word) then (\<langle>31,0\<rangle>R15 \<sigma>::32 word) else ((\<langle>31,0\<rangle>raw_pread_aligned_0x1b7b7_retval::32 word)::32 word)))) 32 64::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = RDI\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x48),8]::64 word) = (sextend (ucast ((if' ((\<langle>31,0\<rangle>raw_pread_aligned_0x1b7b7_retval::32 word)::32 word) >s (\<langle>31,0\<rangle>R15 \<sigma>::32 word) then (\<langle>31,0\<rangle>R15 \<sigma>::32 word) else ((\<langle>31,0\<rangle>raw_pread_aligned_0x1b7b7_retval::32 word)::32 word)))) 32 64::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),8]::64 word) = 0x1b7bc\<close>
declare P_0x1b7df_79_def[Ps]

definition P_0x1b7df_79_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x1b7df_79_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((RDI\<^sub>0::64 word) + 0x40), 8),
    (2, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x40), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x48), 8),
    (11, ((RSP\<^sub>0::64 word) - 0x50), 8)
  }\<close>

definition P_0x1b7df_79_regions :: state_pred where
  \<open>P_0x1b7df_79_regions \<sigma> \<equiv> \<exists>regions. P_0x1b7df_79_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_memcpy_addr_0x1b7df_79 :: state_pred where
  \<open>Q_memcpy_addr_0x1b7df_79 \<sigma> \<equiv> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x50) \<and> RIP \<sigma> = memcpy_addr \<and> RAX \<sigma> = ucast ((if' ((\<langle>31,0\<rangle>raw_pread_aligned_0x1b7b7_retval::32 word)::32 word) >s (\<langle>31,0\<rangle>R15 \<sigma>::32 word) then (\<langle>31,0\<rangle>R15 \<sigma>::32 word) else ((\<langle>31,0\<rangle>raw_pread_aligned_0x1b7b7_retval::32 word)::32 word))) \<and> RCX \<sigma> = ucast ((if' ((((\<langle>31,0\<rangle>((R15 \<sigma>::64 word) + 0x1ff)::32 word)::32 word) AND 0xfffffe00)::32 word) >s 0x4000 then 0x4000 else ((((\<langle>31,0\<rangle>((R15 \<sigma>::64 word) + 0x1ff)::32 word)::32 word) AND 0xfffffe00)::32 word))) \<and> RDX \<sigma> = (sextend (ucast ((if' ((\<langle>31,0\<rangle>raw_pread_aligned_0x1b7b7_retval::32 word)::32 word) >s (\<langle>31,0\<rangle>R15 \<sigma>::32 word) then (\<langle>31,0\<rangle>R15 \<sigma>::32 word) else ((\<langle>31,0\<rangle>raw_pread_aligned_0x1b7b7_retval::32 word)::32 word)))) 32 64::64 word) \<and> RDI \<sigma> = RBP \<sigma> \<and> RSI \<sigma> = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word) \<and> R14 \<sigma> = (sextend (ucast ((if' ((\<langle>31,0\<rangle>raw_pread_aligned_0x1b7b7_retval::32 word)::32 word) >s (\<langle>31,0\<rangle>R15 \<sigma>::32 word) then (\<langle>31,0\<rangle>R15 \<sigma>::32 word) else ((\<langle>31,0\<rangle>raw_pread_aligned_0x1b7b7_retval::32 word)::32 word)))) 32 64::64 word) \<and> R13 \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> R9 \<sigma> = (sextend (ucast ((if' ((\<langle>31,0\<rangle>raw_pread_aligned_0x1b7b7_retval::32 word)::32 word) >s (\<langle>31,0\<rangle>R15 \<sigma>::32 word) then (\<langle>31,0\<rangle>R15 \<sigma>::32 word) else ((\<langle>31,0\<rangle>raw_pread_aligned_0x1b7b7_retval::32 word)::32 word)))) 32 64::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = RDI\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x48),8]::64 word) = (sextend (ucast ((if' ((\<langle>31,0\<rangle>raw_pread_aligned_0x1b7b7_retval::32 word)::32 word) >s (\<langle>31,0\<rangle>R15 \<sigma>::32 word) then (\<langle>31,0\<rangle>R15 \<sigma>::32 word) else ((\<langle>31,0\<rangle>raw_pread_aligned_0x1b7b7_retval::32 word)::32 word)))) 32 64::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),8]::64 word) = 0x1b7e4\<close>
declare Q_memcpy_addr_0x1b7df_79_def[Qs]

schematic_goal raw_pread_0_1_0x1b7df_0x1b7df_79[blocks]:
  assumes \<open>(P_0x1b7df_79 && P_0x1b7df_79_regions) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x1b7df 79 \<sigma> \<triangleq> ?\<sigma> \<and> Q_memcpy_addr_0x1b7df_79 ?\<sigma> \<and> block_usage P_0x1b7df_79_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x1b7df_79_def P_0x1b7df_79_regions_def post: Q_memcpy_addr_0x1b7df_79_def regionset: P_0x1b7df_79_regions_set_def)

definition P_0x1b7e4_80 :: state_pred where
  \<open>P_0x1b7e4_80 \<sigma> \<equiv> RIP \<sigma> = 0x1b7e4 \<and> RAX \<sigma> = memcpy_0x1b7df_retval \<and> RCX \<sigma> = ucast ((if' ((((\<langle>31,0\<rangle>((R15 \<sigma>::64 word) + 0x1ff)::32 word)::32 word) AND 0xfffffe00)::32 word) >s 0x4000 then 0x4000 else ((((\<langle>31,0\<rangle>((R15 \<sigma>::64 word) + 0x1ff)::32 word)::32 word) AND 0xfffffe00)::32 word))) \<and> RDX \<sigma> = (sextend (ucast ((if' ((\<langle>31,0\<rangle>raw_pread_aligned_0x1b7b7_retval::32 word)::32 word) >s (\<langle>31,0\<rangle>R15 \<sigma>::32 word) then (\<langle>31,0\<rangle>R15 \<sigma>::32 word) else ((\<langle>31,0\<rangle>raw_pread_aligned_0x1b7b7_retval::32 word)::32 word)))) 32 64::64 word) \<and> RDI \<sigma> = RBP \<sigma> \<and> RSI \<sigma> = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x48) \<and> R14 \<sigma> = (sextend (ucast ((if' ((\<langle>31,0\<rangle>raw_pread_aligned_0x1b7b7_retval::32 word)::32 word) >s (\<langle>31,0\<rangle>R15 \<sigma>::32 word) then (\<langle>31,0\<rangle>R15 \<sigma>::32 word) else ((\<langle>31,0\<rangle>raw_pread_aligned_0x1b7b7_retval::32 word)::32 word)))) 32 64::64 word) \<and> R13 \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> R9 \<sigma> = (sextend (ucast ((if' ((\<langle>31,0\<rangle>raw_pread_aligned_0x1b7b7_retval::32 word)::32 word) >s (\<langle>31,0\<rangle>R15 \<sigma>::32 word) then (\<langle>31,0\<rangle>R15 \<sigma>::32 word) else ((\<langle>31,0\<rangle>raw_pread_aligned_0x1b7b7_retval::32 word)::32 word)))) 32 64::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = RDI\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x48),8]::64 word) = (sextend (ucast ((if' ((\<langle>31,0\<rangle>raw_pread_aligned_0x1b7b7_retval::32 word)::32 word) >s (\<langle>31,0\<rangle>R15 \<sigma>::32 word) then (\<langle>31,0\<rangle>R15 \<sigma>::32 word) else ((\<langle>31,0\<rangle>raw_pread_aligned_0x1b7b7_retval::32 word)::32 word)))) 32 64::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),8]::64 word) = 0x1b7e4\<close>
declare P_0x1b7e4_80_def[Ps]

definition P_0x1b7e4_80_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x1b7e4_80_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((RDI\<^sub>0::64 word) + 0x40), 8),
    (2, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x40), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x48), 8),
    (11, ((RSP\<^sub>0::64 word) - 0x50), 8)
  }\<close>

definition P_0x1b7e4_80_regions :: state_pred where
  \<open>P_0x1b7e4_80_regions \<sigma> \<equiv> \<exists>regions. P_0x1b7e4_80_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x1b7f4_80 :: state_pred where
  \<open>Q_0x1b7f4_80 \<sigma> \<equiv> RIP \<sigma> = 0x1b7f4 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x48) \<and> R13 \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = RDI\<^sub>0\<close>
declare Q_0x1b7f4_80_def[Qs]

schematic_goal raw_pread_0_5_0x1b7e4_0x1b7f1_80[blocks]:
  assumes \<open>(P_0x1b7e4_80 && P_0x1b7e4_80_regions) \<sigma>\<close>
  shows \<open>exec_block 5 0x1b7f1 80 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x1b7f4_80 ?\<sigma> \<and> block_usage P_0x1b7e4_80_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x1b7e4_80_def P_0x1b7e4_80_regions_def post: Q_0x1b7f4_80_def regionset: P_0x1b7e4_80_regions_set_def)

definition P_0x1b7f4_true_81 :: state_pred where
  \<open>P_0x1b7f4_true_81 \<sigma> \<equiv> RIP \<sigma> = 0x1b7f4 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x48) \<and> R13 \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = RDI\<^sub>0\<close>
declare P_0x1b7f4_true_81_def[Ps]

definition P_0x1b7f4_true_81_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x1b7f4_true_81_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((RDI\<^sub>0::64 word) + 0x40), 8),
    (2, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x40), 8)
  }\<close>

definition P_0x1b7f4_true_81_regions :: state_pred where
  \<open>P_0x1b7f4_true_81_regions \<sigma> \<equiv> \<exists>regions. P_0x1b7f4_true_81_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x1b790_81 :: state_pred where
  \<open>Q_0x1b790_81 \<sigma> \<equiv> RIP \<sigma> = 0x1b790 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x48) \<and> R13 \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = RDI\<^sub>0\<close>
declare Q_0x1b790_81_def[Qs]

schematic_goal raw_pread_0_1_0x1b7f4_0x1b7f4_81[blocks]:
  assumes \<open>(P_0x1b7f4_true_81 && P_0x1b7f4_true_81_regions && !ZF) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x1b7f4 81 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x1b790_81 ?\<sigma> \<and> block_usage P_0x1b7f4_true_81_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x1b7f4_true_81_def P_0x1b7f4_true_81_regions_def post: Q_0x1b790_81_def regionset: P_0x1b7f4_true_81_regions_set_def)

definition P_0x1b7f4_false_82 :: state_pred where
  \<open>P_0x1b7f4_false_82 \<sigma> \<equiv> RIP \<sigma> = 0x1b7f4 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x48) \<and> R13 \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = RDI\<^sub>0\<close>
declare P_0x1b7f4_false_82_def[Ps]

definition P_0x1b7f4_false_82_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x1b7f4_false_82_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((RDI\<^sub>0::64 word) + 0x40), 8),
    (2, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x40), 8)
  }\<close>

definition P_0x1b7f4_false_82_regions :: state_pred where
  \<open>P_0x1b7f4_false_82_regions \<sigma> \<equiv> \<exists>regions. P_0x1b7f4_false_82_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x1b7f6_82 :: state_pred where
  \<open>Q_0x1b7f6_82 \<sigma> \<equiv> RIP \<sigma> = 0x1b7f6 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x48) \<and> R13 \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = RDI\<^sub>0\<close>
declare Q_0x1b7f6_82_def[Qs]

schematic_goal raw_pread_0_1_0x1b7f4_0x1b7f4_82[blocks]:
  assumes \<open>(P_0x1b7f4_false_82 && P_0x1b7f4_false_82_regions && ! !ZF) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x1b7f4 82 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x1b7f6_82 ?\<sigma> \<and> block_usage P_0x1b7f4_false_82_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x1b7f4_false_82_def P_0x1b7f4_false_82_regions_def post: Q_0x1b7f6_82_def regionset: P_0x1b7f4_false_82_regions_set_def)

definition P_0x1b7f6_83 :: state_pred where
  \<open>P_0x1b7f6_83 \<sigma> \<equiv> RIP \<sigma> = 0x1b7f6 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x48) \<and> R13 \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = RDI\<^sub>0\<close>
declare P_0x1b7f6_83_def[Ps]

definition P_0x1b7f6_83_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x1b7f6_83_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((RDI\<^sub>0::64 word) + 0x40), 8),
    (2, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x40), 8)
  }\<close>

definition P_0x1b7f6_83_regions :: state_pred where
  \<open>P_0x1b7f6_83_regions \<sigma> \<equiv> \<exists>regions. P_0x1b7f6_83_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_ret_address_83 :: state_pred where
  \<open>Q_ret_address_83 \<sigma> \<equiv> RIP \<sigma> = ret_address \<and> RBX \<sigma> = RBX\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) + 0x8) \<and> RBP \<sigma> = RBP\<^sub>0 \<and> R15 \<sigma> = R15\<^sub>0 \<and> R14 \<sigma> = R14\<^sub>0 \<and> R13 \<sigma> = R13\<^sub>0 \<and> R12 \<sigma> = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = RDI\<^sub>0\<close>
declare Q_ret_address_83_def[Qs]

schematic_goal raw_pread_0_9_0x1b7f6_0x1b807_83[blocks]:
  assumes \<open>(P_0x1b7f6_83 && P_0x1b7f6_83_regions) \<sigma>\<close>
  shows \<open>exec_block 9 0x1b807 83 \<sigma> \<triangleq> ?\<sigma> \<and> Q_ret_address_83 ?\<sigma> \<and> block_usage P_0x1b7f6_83_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x1b7f6_83_def P_0x1b7f6_83_regions_def post: Q_ret_address_83_def regionset: P_0x1b7f6_83_regions_set_def)

definition P_0x1b70a_84 :: state_pred where
  \<open>P_0x1b70a_84 \<sigma> \<equiv> RIP \<sigma> = 0x1b70a \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x48) \<and> R13 \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = RDI\<^sub>0\<close>
declare P_0x1b70a_84_def[Ps]

definition P_0x1b70a_84_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x1b70a_84_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((RDI\<^sub>0::64 word) + 0x40), 8),
    (2, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x40), 8)
  }\<close>

definition P_0x1b70a_84_regions :: state_pred where
  \<open>P_0x1b70a_84_regions \<sigma> \<equiv> \<exists>regions. P_0x1b70a_84_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_ret_address_84 :: state_pred where
  \<open>Q_ret_address_84 \<sigma> \<equiv> RIP \<sigma> = ret_address \<and> RBX \<sigma> = RBX\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) + 0x8) \<and> RBP \<sigma> = RBP\<^sub>0 \<and> R15 \<sigma> = R15\<^sub>0 \<and> R14 \<sigma> = R14\<^sub>0 \<and> R13 \<sigma> = R13\<^sub>0 \<and> R12 \<sigma> = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = RDI\<^sub>0\<close>
declare Q_ret_address_84_def[Qs]

schematic_goal raw_pread_0_8_0x1b70a_0x1b718_84[blocks]:
  assumes \<open>(P_0x1b70a_84 && P_0x1b70a_84_regions) \<sigma>\<close>
  shows \<open>exec_block 8 0x1b718 84 \<sigma> \<triangleq> ?\<sigma> \<and> Q_ret_address_84 ?\<sigma> \<and> block_usage P_0x1b70a_84_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x1b70a_84_def P_0x1b70a_84_regions_def post: Q_ret_address_84_def regionset: P_0x1b70a_84_regions_set_def)

definition P_0x1b77d_false_85 :: state_pred where
  \<open>P_0x1b77d_false_85 \<sigma> \<equiv> RIP \<sigma> = 0x1b77d \<and> RBX \<sigma> = ((RSI\<^sub>0::64 word) + (sextend (ucast (((0x200::32 word) - (((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) AND 0x1ff)))) 32 64::64 word)) \<and> RDX \<sigma> = (sextend (ucast (((0x200::32 word) - (((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) AND 0x1ff)))) 32 64::64 word) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x48) \<and> RBP \<sigma> = ((RDX\<^sub>0::64 word) + (sextend (ucast (((0x200::32 word) - (((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) AND 0x1ff)))) 32 64::64 word)) \<and> R15 \<sigma> = ucast ((((((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) + (((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) AND 0x1ff))::32 word) - 0x200)) \<and> R14 \<sigma> = (sextend (ucast ((((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) AND 0x1ff))) 32 64::64 word) \<and> R13 \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> R12 \<sigma> = ucast (((0x200::32 word) - (((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) AND 0x1ff))) \<and> R9 \<sigma> = R9\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = RDI\<^sub>0\<close>
declare P_0x1b77d_false_85_def[Ps]

definition P_0x1b77d_false_85_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x1b77d_false_85_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((RDI\<^sub>0::64 word) + 0x40), 8),
    (2, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x40), 8)
  }\<close>

definition P_0x1b77d_false_85_regions :: state_pred where
  \<open>P_0x1b77d_false_85_regions \<sigma> \<equiv> \<exists>regions. P_0x1b77d_false_85_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x1b6f4_85 :: state_pred where
  \<open>Q_0x1b6f4_85 \<sigma> \<equiv> RIP \<sigma> = 0x1b6f4 \<and> RBX \<sigma> = ((RSI\<^sub>0::64 word) + (sextend (ucast (((0x200::32 word) - (((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) AND 0x1ff)))) 32 64::64 word)) \<and> RDX \<sigma> = (sextend (ucast (((0x200::32 word) - (((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) AND 0x1ff)))) 32 64::64 word) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x48) \<and> RBP \<sigma> = ((RDX\<^sub>0::64 word) + (sextend (ucast (((0x200::32 word) - (((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) AND 0x1ff)))) 32 64::64 word)) \<and> R15 \<sigma> = ucast ((((((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) + (((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) AND 0x1ff))::32 word) - 0x200)) \<and> R14 \<sigma> = (sextend (ucast ((((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) AND 0x1ff))) 32 64::64 word) \<and> R13 \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> R12 \<sigma> = ucast (((0x200::32 word) - (((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) AND 0x1ff))) \<and> R9 \<sigma> = R9\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = RDI\<^sub>0\<close>
declare Q_0x1b6f4_85_def[Qs]

schematic_goal raw_pread_0_2_0x1b77d_0x1b77f_85[blocks]:
  assumes \<open>(P_0x1b77d_false_85 && P_0x1b77d_false_85_regions && ! !ZF) \<sigma>\<close>
  shows \<open>exec_block 2 0x1b77f 85 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x1b6f4_85 ?\<sigma> \<and> block_usage P_0x1b77d_false_85_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x1b77d_false_85_def P_0x1b77d_false_85_regions_def post: Q_0x1b6f4_85_def regionset: P_0x1b77d_false_85_regions_set_def)

definition P_0x1b6f4_86 :: state_pred where
  \<open>P_0x1b6f4_86 \<sigma> \<equiv> RIP \<sigma> = 0x1b6f4 \<and> RBX \<sigma> = ((RSI\<^sub>0::64 word) + (sextend (ucast (((0x200::32 word) - (((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) AND 0x1ff)))) 32 64::64 word)) \<and> RDX \<sigma> = (sextend (ucast (((0x200::32 word) - (((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) AND 0x1ff)))) 32 64::64 word) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x48) \<and> RBP \<sigma> = ((RDX\<^sub>0::64 word) + (sextend (ucast (((0x200::32 word) - (((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) AND 0x1ff)))) 32 64::64 word)) \<and> R15 \<sigma> = ucast ((((((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) + (((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) AND 0x1ff))::32 word) - 0x200)) \<and> R14 \<sigma> = (sextend (ucast ((((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) AND 0x1ff))) 32 64::64 word) \<and> R13 \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> R12 \<sigma> = ucast (((0x200::32 word) - (((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) AND 0x1ff))) \<and> R9 \<sigma> = R9\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = RDI\<^sub>0\<close>
declare P_0x1b6f4_86_def[Ps]

definition P_0x1b6f4_86_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x1b6f4_86_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((RDI\<^sub>0::64 word) + 0x40), 8),
    (2, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x40), 8)
  }\<close>

definition P_0x1b6f4_86_regions :: state_pred where
  \<open>P_0x1b6f4_86_regions \<sigma> \<equiv> \<exists>regions. P_0x1b6f4_86_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x1b702_86 :: state_pred where
  \<open>Q_0x1b702_86 \<sigma> \<equiv> RIP \<sigma> = 0x1b702 \<and> RBX \<sigma> = ((RSI\<^sub>0::64 word) + (sextend (ucast (((0x200::32 word) - (((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) AND 0x1ff)))) 32 64::64 word)) \<and> RCX \<sigma> = ucast ((((((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) + (((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) AND 0x1ff))::32 word) - 0x200)) \<and> RDX \<sigma> = ((RDX\<^sub>0::64 word) + (sextend (ucast (((0x200::32 word) - (((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) AND 0x1ff)))) 32 64::64 word)) \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = ((RSI\<^sub>0::64 word) + (sextend (ucast (((0x200::32 word) - (((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) AND 0x1ff)))) 32 64::64 word)) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x48) \<and> RBP \<sigma> = ((RDX\<^sub>0::64 word) + (sextend (ucast (((0x200::32 word) - (((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) AND 0x1ff)))) 32 64::64 word)) \<and> R15 \<sigma> = ucast ((((((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) + (((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) AND 0x1ff))::32 word) - 0x200)) \<and> R14 \<sigma> = (sextend (ucast ((((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) AND 0x1ff))) 32 64::64 word) \<and> R13 \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> R12 \<sigma> = ucast (((0x200::32 word) - (((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) AND 0x1ff))) \<and> R9 \<sigma> = R9\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = RDI\<^sub>0\<close>
declare Q_0x1b702_86_def[Qs]

schematic_goal raw_pread_0_4_0x1b6f4_0x1b6ff_86[blocks]:
  assumes \<open>(P_0x1b6f4_86 && P_0x1b6f4_86_regions) \<sigma>\<close>
  shows \<open>exec_block 4 0x1b6ff 86 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x1b702_86 ?\<sigma> \<and> block_usage P_0x1b6f4_86_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x1b6f4_86_def P_0x1b6f4_86_regions_def post: Q_0x1b702_86_def regionset: P_0x1b6f4_86_regions_set_def)

definition P_0x1b702_87 :: state_pred where
  \<open>P_0x1b702_87 \<sigma> \<equiv> RIP \<sigma> = 0x1b702 \<and> RBX \<sigma> = ((RSI\<^sub>0::64 word) + (sextend (ucast (((0x200::32 word) - (((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) AND 0x1ff)))) 32 64::64 word)) \<and> RCX \<sigma> = ucast ((((((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) + (((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) AND 0x1ff))::32 word) - 0x200)) \<and> RDX \<sigma> = ((RDX\<^sub>0::64 word) + (sextend (ucast (((0x200::32 word) - (((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) AND 0x1ff)))) 32 64::64 word)) \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = ((RSI\<^sub>0::64 word) + (sextend (ucast (((0x200::32 word) - (((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) AND 0x1ff)))) 32 64::64 word)) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x48) \<and> RBP \<sigma> = ((RDX\<^sub>0::64 word) + (sextend (ucast (((0x200::32 word) - (((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) AND 0x1ff)))) 32 64::64 word)) \<and> R15 \<sigma> = ucast ((((((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) + (((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) AND 0x1ff))::32 word) - 0x200)) \<and> R14 \<sigma> = (sextend (ucast ((((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) AND 0x1ff))) 32 64::64 word) \<and> R13 \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> R12 \<sigma> = ucast (((0x200::32 word) - (((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) AND 0x1ff))) \<and> R9 \<sigma> = R9\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = RDI\<^sub>0\<close>
declare P_0x1b702_87_def[Ps]

definition P_0x1b702_87_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x1b702_87_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((RDI\<^sub>0::64 word) + 0x40), 8),
    (2, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x40), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x50), 8)
  }\<close>

definition P_0x1b702_87_regions :: state_pred where
  \<open>P_0x1b702_87_regions \<sigma> \<equiv> \<exists>regions. P_0x1b702_87_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_raw_pread_aligned_addr_0x1b702_87 :: state_pred where
  \<open>Q_raw_pread_aligned_addr_0x1b702_87 \<sigma> \<equiv> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x50) \<and> RIP \<sigma> = raw_pread_aligned_addr \<and> RBX \<sigma> = ((RSI\<^sub>0::64 word) + (sextend (ucast (((0x200::32 word) - (((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) AND 0x1ff)))) 32 64::64 word)) \<and> RCX \<sigma> = ucast ((((((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) + (((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) AND 0x1ff))::32 word) - 0x200)) \<and> RDX \<sigma> = ((RDX\<^sub>0::64 word) + (sextend (ucast (((0x200::32 word) - (((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) AND 0x1ff)))) 32 64::64 word)) \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = ((RSI\<^sub>0::64 word) + (sextend (ucast (((0x200::32 word) - (((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) AND 0x1ff)))) 32 64::64 word)) \<and> RBP \<sigma> = ((RDX\<^sub>0::64 word) + (sextend (ucast (((0x200::32 word) - (((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) AND 0x1ff)))) 32 64::64 word)) \<and> R15 \<sigma> = ucast ((((((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) + (((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) AND 0x1ff))::32 word) - 0x200)) \<and> R14 \<sigma> = (sextend (ucast ((((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) AND 0x1ff))) 32 64::64 word) \<and> R13 \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> R12 \<sigma> = ucast (((0x200::32 word) - (((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) AND 0x1ff))) \<and> R9 \<sigma> = R9\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = RDI\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),8]::64 word) = 0x1b707\<close>
declare Q_raw_pread_aligned_addr_0x1b702_87_def[Qs]

schematic_goal raw_pread_0_1_0x1b702_0x1b702_87[blocks]:
  assumes \<open>(P_0x1b702_87 && P_0x1b702_87_regions) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x1b702 87 \<sigma> \<triangleq> ?\<sigma> \<and> Q_raw_pread_aligned_addr_0x1b702_87 ?\<sigma> \<and> block_usage P_0x1b702_87_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x1b702_87_def P_0x1b702_87_regions_def post: Q_raw_pread_aligned_addr_0x1b702_87_def regionset: P_0x1b702_87_regions_set_def)

definition P_0x1b707_88 :: state_pred where
  \<open>P_0x1b707_88 \<sigma> \<equiv> RIP \<sigma> = 0x1b707 \<and> RBX \<sigma> = ((RSI\<^sub>0::64 word) + (sextend (ucast (((0x200::32 word) - (((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) AND 0x1ff)))) 32 64::64 word)) \<and> RCX \<sigma> = ucast ((((((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) + (((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) AND 0x1ff))::32 word) - 0x200)) \<and> RDX \<sigma> = ((RDX\<^sub>0::64 word) + (sextend (ucast (((0x200::32 word) - (((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) AND 0x1ff)))) 32 64::64 word)) \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = ((RSI\<^sub>0::64 word) + (sextend (ucast (((0x200::32 word) - (((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) AND 0x1ff)))) 32 64::64 word)) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x48) \<and> RBP \<sigma> = ((RDX\<^sub>0::64 word) + (sextend (ucast (((0x200::32 word) - (((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) AND 0x1ff)))) 32 64::64 word)) \<and> R15 \<sigma> = ucast ((((((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) + (((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) AND 0x1ff))::32 word) - 0x200)) \<and> R14 \<sigma> = (sextend (ucast ((((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) AND 0x1ff))) 32 64::64 word) \<and> R13 \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> R12 \<sigma> = ucast (((0x200::32 word) - (((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) AND 0x1ff))) \<and> R9 \<sigma> = R9\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = RDI\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),8]::64 word) = 0x1b707\<close>
declare P_0x1b707_88_def[Ps]

definition P_0x1b707_88_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x1b707_88_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((RDI\<^sub>0::64 word) + 0x40), 8),
    (2, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x40), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x50), 8)
  }\<close>

definition P_0x1b707_88_regions :: state_pred where
  \<open>P_0x1b707_88_regions \<sigma> \<equiv> \<exists>regions. P_0x1b707_88_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x1b70a_88 :: state_pred where
  \<open>Q_0x1b70a_88 \<sigma> \<equiv> RIP \<sigma> = 0x1b70a \<and> RBX \<sigma> = ((RSI\<^sub>0::64 word) + (sextend (ucast (((0x200::32 word) - (((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) AND 0x1ff)))) 32 64::64 word)) \<and> RCX \<sigma> = ucast ((((((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) + (((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) AND 0x1ff))::32 word) - 0x200)) \<and> RDX \<sigma> = ((RDX\<^sub>0::64 word) + (sextend (ucast (((0x200::32 word) - (((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) AND 0x1ff)))) 32 64::64 word)) \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = ((RSI\<^sub>0::64 word) + (sextend (ucast (((0x200::32 word) - (((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) AND 0x1ff)))) 32 64::64 word)) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x48) \<and> RBP \<sigma> = ((RDX\<^sub>0::64 word) + (sextend (ucast (((0x200::32 word) - (((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) AND 0x1ff)))) 32 64::64 word)) \<and> R15 \<sigma> = ucast ((((((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) + (((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) AND 0x1ff))::32 word) - 0x200)) \<and> R14 \<sigma> = (sextend (ucast ((((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) AND 0x1ff))) 32 64::64 word) \<and> R13 \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> R12 \<sigma> = ucast (((0x200::32 word) - (((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) AND 0x1ff))) \<and> R9 \<sigma> = R9\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = RDI\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),8]::64 word) = 0x1b707\<close>
declare Q_0x1b70a_88_def[Qs]

schematic_goal raw_pread_0_1_0x1b707_0x1b707_88[blocks]:
  assumes \<open>(P_0x1b707_88 && P_0x1b707_88_regions) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x1b707 88 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x1b70a_88 ?\<sigma> \<and> block_usage P_0x1b707_88_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x1b707_88_def P_0x1b707_88_regions_def post: Q_0x1b70a_88_def regionset: P_0x1b707_88_regions_set_def)

definition P_0x1b70a_89 :: state_pred where
  \<open>P_0x1b70a_89 \<sigma> \<equiv> RIP \<sigma> = 0x1b70a \<and> RBX \<sigma> = ((RSI\<^sub>0::64 word) + (sextend (ucast (((0x200::32 word) - (((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) AND 0x1ff)))) 32 64::64 word)) \<and> RCX \<sigma> = ucast ((((((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) + (((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) AND 0x1ff))::32 word) - 0x200)) \<and> RDX \<sigma> = ((RDX\<^sub>0::64 word) + (sextend (ucast (((0x200::32 word) - (((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) AND 0x1ff)))) 32 64::64 word)) \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = ((RSI\<^sub>0::64 word) + (sextend (ucast (((0x200::32 word) - (((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) AND 0x1ff)))) 32 64::64 word)) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x48) \<and> RBP \<sigma> = ((RDX\<^sub>0::64 word) + (sextend (ucast (((0x200::32 word) - (((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) AND 0x1ff)))) 32 64::64 word)) \<and> R15 \<sigma> = ucast ((((((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) + (((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) AND 0x1ff))::32 word) - 0x200)) \<and> R14 \<sigma> = (sextend (ucast ((((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) AND 0x1ff))) 32 64::64 word) \<and> R13 \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> R12 \<sigma> = ucast (((0x200::32 word) - (((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) AND 0x1ff))) \<and> R9 \<sigma> = R9\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = RDI\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),8]::64 word) = 0x1b707\<close>
declare P_0x1b70a_89_def[Ps]

definition P_0x1b70a_89_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x1b70a_89_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((RDI\<^sub>0::64 word) + 0x40), 8),
    (2, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x40), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x50), 8)
  }\<close>

definition P_0x1b70a_89_regions :: state_pred where
  \<open>P_0x1b70a_89_regions \<sigma> \<equiv> \<exists>regions. P_0x1b70a_89_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_ret_address_89 :: state_pred where
  \<open>Q_ret_address_89 \<sigma> \<equiv> RIP \<sigma> = ret_address \<and> RBX \<sigma> = RBX\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) + 0x8) \<and> RBP \<sigma> = RBP\<^sub>0 \<and> R15 \<sigma> = R15\<^sub>0 \<and> R14 \<sigma> = R14\<^sub>0 \<and> R13 \<sigma> = R13\<^sub>0 \<and> R12 \<sigma> = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = RDI\<^sub>0\<close>
declare Q_ret_address_89_def[Qs]

schematic_goal raw_pread_0_8_0x1b70a_0x1b718_89[blocks]:
  assumes \<open>(P_0x1b70a_89 && P_0x1b70a_89_regions) \<sigma>\<close>
  shows \<open>exec_block 8 0x1b718 89 \<sigma> \<triangleq> ?\<sigma> \<and> Q_ret_address_89 ?\<sigma> \<and> block_usage P_0x1b70a_89_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x1b70a_89_def P_0x1b70a_89_regions_def post: Q_ret_address_89_def regionset: P_0x1b70a_89_regions_set_def)

definition P_0x1b691_false_90 :: state_pred where
  \<open>P_0x1b691_false_90 \<sigma> \<equiv> RIP \<sigma> = 0x1b691 \<and> RAX \<sigma> = ucast (((0x200::32 word) - (((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) AND 0x1ff))) \<and> RBX \<sigma> = RSI\<^sub>0 \<and> RCX \<sigma> = ucast ((if' ((((\<langle>31,0\<rangle>((RCX\<^sub>0::64 word) + (((\<langle>63,0\<rangle>((ucast (((((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) AND 0x1ff)::32 word))::64 word) * (0x1::64 word))::64 word)::64 word) + 0x1ff))::32 word)::32 word) AND 0xfffffe00)::32 word) >s 0x4000 then 0x4000 else ((((\<langle>31,0\<rangle>((RCX\<^sub>0::64 word) + (((\<langle>63,0\<rangle>((ucast (((((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) AND 0x1ff)::32 word))::64 word) * (0x1::64 word))::64 word)::64 word) + 0x1ff))::32 word)::32 word) AND 0xfffffe00)::32 word))) \<and> RDX \<sigma> = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word) \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = (((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word)::64 word) + (sextend (ucast ((((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) AND 0x1ff))) 32 64::64 word)) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x48) \<and> RBP \<sigma> = RDX\<^sub>0 \<and> R15 \<sigma> = ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)) \<and> R14 \<sigma> = (sextend (ucast ((((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) AND 0x1ff))) 32 64::64 word) \<and> R13 \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> R12 \<sigma> = ucast (((0x200::32 word) - (((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) AND 0x1ff))) \<and> R9 \<sigma> = R9\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = RDI\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),8]::64 word) = 0x1b674\<close>
declare P_0x1b691_false_90_def[Ps]

definition P_0x1b691_false_90_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x1b691_false_90_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((RDI\<^sub>0::64 word) + 0x40), 8),
    (2, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x40), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x50), 8)
  }\<close>

definition P_0x1b691_false_90_regions :: state_pred where
  \<open>P_0x1b691_false_90_regions \<sigma> \<equiv> \<exists>regions. P_0x1b691_false_90_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x1b69e_90 :: state_pred where
  \<open>Q_0x1b69e_90 \<sigma> \<equiv> RIP \<sigma> = 0x1b69e \<and> RAX \<sigma> = (sextend (ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word))) 32 64::64 word) \<and> RBX \<sigma> = RSI\<^sub>0 \<and> RCX \<sigma> = ucast ((if' ((((\<langle>31,0\<rangle>((RCX\<^sub>0::64 word) + (((\<langle>63,0\<rangle>((ucast (((((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) AND 0x1ff)::32 word))::64 word) * (0x1::64 word))::64 word)::64 word) + 0x1ff))::32 word)::32 word) AND 0xfffffe00)::32 word) >s 0x4000 then 0x4000 else ((((\<langle>31,0\<rangle>((RCX\<^sub>0::64 word) + (((\<langle>63,0\<rangle>((ucast (((((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) AND 0x1ff)::32 word))::64 word) * (0x1::64 word))::64 word)::64 word) + 0x1ff))::32 word)::32 word) AND 0xfffffe00)::32 word))) \<and> RDX \<sigma> = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word) \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = (((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word)::64 word) + (sextend (ucast ((((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) AND 0x1ff))) 32 64::64 word)) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x48) \<and> RBP \<sigma> = RDX\<^sub>0 \<and> R15 \<sigma> = ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)) \<and> R14 \<sigma> = (sextend (ucast ((((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) AND 0x1ff))) 32 64::64 word) \<and> R13 \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> R12 \<sigma> = ucast (((0x200::32 word) - (((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) AND 0x1ff))) \<and> R9 \<sigma> = R9\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = RDI\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),8]::64 word) = 0x1b674\<close>
declare Q_0x1b69e_90_def[Qs]

schematic_goal raw_pread_0_3_0x1b691_0x1b69a_90[blocks]:
  assumes \<open>(P_0x1b691_false_90 && P_0x1b691_false_90_regions && ! jge) \<sigma>\<close>
  shows \<open>exec_block 3 0x1b69a 90 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x1b69e_90 ?\<sigma> \<and> block_usage P_0x1b691_false_90_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x1b691_false_90_def P_0x1b691_false_90_regions_def post: Q_0x1b69e_90_def regionset: P_0x1b691_false_90_regions_set_def)

definition P_0x1b69e_true_91 :: state_pred where
  \<open>P_0x1b69e_true_91 \<sigma> \<equiv> RIP \<sigma> = 0x1b69e \<and> RAX \<sigma> = (sextend (ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word))) 32 64::64 word) \<and> RBX \<sigma> = RSI\<^sub>0 \<and> RCX \<sigma> = ucast ((if' ((((\<langle>31,0\<rangle>((RCX\<^sub>0::64 word) + (((\<langle>63,0\<rangle>((ucast (((((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) AND 0x1ff)::32 word))::64 word) * (0x1::64 word))::64 word)::64 word) + 0x1ff))::32 word)::32 word) AND 0xfffffe00)::32 word) >s 0x4000 then 0x4000 else ((((\<langle>31,0\<rangle>((RCX\<^sub>0::64 word) + (((\<langle>63,0\<rangle>((ucast (((((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) AND 0x1ff)::32 word))::64 word) * (0x1::64 word))::64 word)::64 word) + 0x1ff))::32 word)::32 word) AND 0xfffffe00)::32 word))) \<and> RDX \<sigma> = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word) \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = (((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word)::64 word) + (sextend (ucast ((((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) AND 0x1ff))) 32 64::64 word)) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x48) \<and> RBP \<sigma> = RDX\<^sub>0 \<and> R15 \<sigma> = ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)) \<and> R14 \<sigma> = (sextend (ucast ((((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) AND 0x1ff))) 32 64::64 word) \<and> R13 \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> R12 \<sigma> = ucast (((0x200::32 word) - (((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) AND 0x1ff))) \<and> R9 \<sigma> = R9\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = RDI\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),8]::64 word) = 0x1b674\<close>
declare P_0x1b69e_true_91_def[Ps]

definition P_0x1b69e_true_91_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x1b69e_true_91_regions_set \<sigma> \<equiv> {
    (0, RDX\<^sub>0, 8),
    (1, RSP\<^sub>0, 8),
    (2, ((RDI\<^sub>0::64 word) + 0x40), 8),
    (3, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28), 8),
    (4, (((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word)::64 word) + (sextend (ucast ((((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) AND 0x1ff))) 32 64::64 word)), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (11, ((RSP\<^sub>0::64 word) - 0x40), 8),
    (12, ((RSP\<^sub>0::64 word) - 0x50), 8),
    (13, ((((RDX\<^sub>0::64 word) + (\<langle>63,0\<rangle>(((sextend (ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word))) 32 64::64 word)::64 word) * 0x1)::64 word))::64 word) - 0x8), 8),
    (14, (((((((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word)::64 word) + (sextend (ucast ((((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) AND 0x1ff))) 32 64::64 word))::64 word) + (\<langle>63,0\<rangle>(((sextend (ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word))) 32 64::64 word)::64 word) * 0x1)::64 word))::64 word) - 0x8), 8)
  }\<close>

definition P_0x1b69e_true_91_regions :: state_pred where
  \<open>P_0x1b69e_true_91_regions \<sigma> \<equiv> \<exists>regions. P_0x1b69e_true_91_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x1b887_91 :: state_pred where
  \<open>Q_0x1b887_91 \<sigma> \<equiv> RIP \<sigma> = 0x1b887 \<and> RAX \<sigma> = (sextend (ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word))) 32 64::64 word) \<and> RBX \<sigma> = RSI\<^sub>0 \<and> RCX \<sigma> = ((ucast (((((sextend (ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word))) 32 64::64 word)::64 word) + (\<langle>63,0\<rangle>((((RDX\<^sub>0::64 word) - ((((RDX\<^sub>0::64 word) + 0x8)::64 word) AND 0xfffffffffffffff8))::64 word) * 0x1)::64 word))::64 word))::64 word) >> 3) \<and> RDX \<sigma> = (\<sigma> \<turnstile> *[(((((((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word)::64 word) + (sextend (ucast ((((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) AND 0x1ff))) 32 64::64 word))::64 word) + (\<langle>63,0\<rangle>(((sextend (ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word))) 32 64::64 word)::64 word) * 0x1)::64 word))::64 word) - 0x8),8]::64 word) \<and> RDI \<sigma> = ((((RDX\<^sub>0::64 word) + 0x8)::64 word) AND 0xfffffffffffffff8) \<and> RSI \<sigma> = (((((((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word)::64 word) + (sextend (ucast ((((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) AND 0x1ff))) 32 64::64 word))::64 word) - RDX\<^sub>0)::64 word) + ((((RDX\<^sub>0::64 word) + 0x8)::64 word) AND 0xfffffffffffffff8)) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x48) \<and> RBP \<sigma> = ((RDX\<^sub>0::64 word) - ((((RDX\<^sub>0::64 word) + 0x8)::64 word) AND 0xfffffffffffffff8)) \<and> R15 \<sigma> = ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)) \<and> R14 \<sigma> = (sextend (ucast ((((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) AND 0x1ff))) 32 64::64 word) \<and> R13 \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> R12 \<sigma> = ucast (((0x200::32 word) - (((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) AND 0x1ff))) \<and> R9 \<sigma> = R9\<^sub>0 \<and> (\<sigma> \<turnstile> *[RDX\<^sub>0,8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word)::64 word) + (sextend (ucast ((((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) AND 0x1ff))) 32 64::64 word)),8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word)::64 word) + (sextend (ucast ((((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) AND 0x1ff))) 32 64::64 word)),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word)::64 word) + (sextend (ucast ((((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) AND 0x1ff))) 32 64::64 word)),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = RDI\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),8]::64 word) = 0x1b674 \<and> (\<sigma> \<turnstile> *[((((RDX\<^sub>0::64 word) + (\<langle>63,0\<rangle>(((sextend (ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word))) 32 64::64 word)::64 word) * 0x1)::64 word))::64 word) - 0x8),8]::64 word) = (\<sigma> \<turnstile> *[(((((((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word)::64 word) + (sextend (ucast ((((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) AND 0x1ff))) 32 64::64 word))::64 word) + (\<langle>63,0\<rangle>(((sextend (ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word))) 32 64::64 word)::64 word) * 0x1)::64 word))::64 word) - 0x8),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((((((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word)::64 word) + (sextend (ucast ((((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) AND 0x1ff))) 32 64::64 word))::64 word) + (\<langle>63,0\<rangle>(((sextend (ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word))) 32 64::64 word)::64 word) * 0x1)::64 word))::64 word) - 0x8),8]::64 word) = (\<sigma> \<turnstile> *[(((((((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word)::64 word) + (sextend (ucast ((((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) AND 0x1ff))) 32 64::64 word))::64 word) + (\<langle>63,0\<rangle>(((sextend (ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word))) 32 64::64 word)::64 word) * 0x1)::64 word))::64 word) - 0x8),8]::64 word)\<close>
declare Q_0x1b887_91_def[Qs]

schematic_goal raw_pread_0_11_0x1b69e_0x1b883_91[blocks]:
  assumes \<open>(P_0x1b69e_true_91 && P_0x1b69e_true_91_regions && !CF) \<sigma>\<close>
  shows \<open>exec_block 11 0x1b883 91 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x1b887_91 ?\<sigma> \<and> block_usage P_0x1b69e_true_91_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x1b69e_true_91_def P_0x1b69e_true_91_regions_def post: Q_0x1b887_91_def regionset: P_0x1b69e_true_91_regions_set_def)

definition P_0x1b887_92 :: state_pred where
  \<open>P_0x1b887_92 \<sigma> \<equiv> RIP \<sigma> = 0x1b887 \<and> RAX \<sigma> = (sextend (ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word))) 32 64::64 word) \<and> RBX \<sigma> = RSI\<^sub>0 \<and> RCX \<sigma> = ((ucast (((((sextend (ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word))) 32 64::64 word)::64 word) + (\<langle>63,0\<rangle>((((RDX\<^sub>0::64 word) - ((((RDX\<^sub>0::64 word) + 0x8)::64 word) AND 0xfffffffffffffff8))::64 word) * 0x1)::64 word))::64 word))::64 word) >> 3) \<and> RDX \<sigma> = (\<sigma> \<turnstile> *[(((((((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word)::64 word) + (sextend (ucast ((((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) AND 0x1ff))) 32 64::64 word))::64 word) + (\<langle>63,0\<rangle>(((sextend (ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word))) 32 64::64 word)::64 word) * 0x1)::64 word))::64 word) - 0x8),8]::64 word) \<and> RDI \<sigma> = ((((RDX\<^sub>0::64 word) + 0x8)::64 word) AND 0xfffffffffffffff8) \<and> RSI \<sigma> = (((((((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word)::64 word) + (sextend (ucast ((((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) AND 0x1ff))) 32 64::64 word))::64 word) - RDX\<^sub>0)::64 word) + ((((RDX\<^sub>0::64 word) + 0x8)::64 word) AND 0xfffffffffffffff8)) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x48) \<and> RBP \<sigma> = ((RDX\<^sub>0::64 word) - ((((RDX\<^sub>0::64 word) + 0x8)::64 word) AND 0xfffffffffffffff8)) \<and> R15 \<sigma> = ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)) \<and> R14 \<sigma> = (sextend (ucast ((((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) AND 0x1ff))) 32 64::64 word) \<and> R13 \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> R12 \<sigma> = ucast (((0x200::32 word) - (((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) AND 0x1ff))) \<and> R9 \<sigma> = R9\<^sub>0 \<and> (\<sigma> \<turnstile> *[RDX\<^sub>0,8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word)::64 word) + (sextend (ucast ((((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) AND 0x1ff))) 32 64::64 word)),8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word)::64 word) + (sextend (ucast ((((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) AND 0x1ff))) 32 64::64 word)),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word)::64 word) + (sextend (ucast ((((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) AND 0x1ff))) 32 64::64 word)),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = RDI\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),8]::64 word) = 0x1b674 \<and> (\<sigma> \<turnstile> *[((((RDX\<^sub>0::64 word) + (\<langle>63,0\<rangle>(((sextend (ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word))) 32 64::64 word)::64 word) * 0x1)::64 word))::64 word) - 0x8),8]::64 word) = (\<sigma> \<turnstile> *[(((((((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word)::64 word) + (sextend (ucast ((((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) AND 0x1ff))) 32 64::64 word))::64 word) + (\<langle>63,0\<rangle>(((sextend (ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word))) 32 64::64 word)::64 word) * 0x1)::64 word))::64 word) - 0x8),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((((((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word)::64 word) + (sextend (ucast ((((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) AND 0x1ff))) 32 64::64 word))::64 word) + (\<langle>63,0\<rangle>(((sextend (ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word))) 32 64::64 word)::64 word) * 0x1)::64 word))::64 word) - 0x8),8]::64 word) = (\<sigma> \<turnstile> *[(((((((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word)::64 word) + (sextend (ucast ((((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) AND 0x1ff))) 32 64::64 word))::64 word) + (\<langle>63,0\<rangle>(((sextend (ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word))) 32 64::64 word)::64 word) * 0x1)::64 word))::64 word) - 0x8),8]::64 word)\<close>
declare P_0x1b887_92_def[Ps]

definition P_0x1b887_92_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x1b887_92_regions_set \<sigma> \<equiv> {
    (0, RDX\<^sub>0, 8),
    (1, RSP\<^sub>0, 8),
    (2, ((RDI\<^sub>0::64 word) + 0x40), 8),
    (3, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28), 8),
    (4, (((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word)::64 word) + (sextend (ucast ((((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) AND 0x1ff))) 32 64::64 word)), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (11, ((RSP\<^sub>0::64 word) - 0x40), 8),
    (12, ((RSP\<^sub>0::64 word) - 0x50), 8),
    (13, ((((RDX\<^sub>0::64 word) + (\<langle>63,0\<rangle>(((sextend (ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word))) 32 64::64 word)::64 word) * 0x1)::64 word))::64 word) - 0x8), 8),
    (14, (((((((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word)::64 word) + (sextend (ucast ((((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) AND 0x1ff))) 32 64::64 word))::64 word) + (\<langle>63,0\<rangle>(((sextend (ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word))) 32 64::64 word)::64 word) * 0x1)::64 word))::64 word) - 0x8), 8)
  }\<close>

definition P_0x1b887_92_regions :: state_pred where
  \<open>P_0x1b887_92_regions \<sigma> \<equiv> \<exists>regions. P_0x1b887_92_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_rep_movs_ESRDI_DSRSI_addr_0x1b887_92 :: state_pred where
  \<open>Q_rep_movs_ESRDI_DSRSI_addr_0x1b887_92 \<sigma> \<equiv> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x50) \<and> RIP \<sigma> = rep_movs_ESRDI_DSRSI_addr \<and> RAX \<sigma> = (sextend (ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word))) 32 64::64 word) \<and> RBX \<sigma> = RSI\<^sub>0 \<and> R15 \<sigma> = ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)) \<and> R14 \<sigma> = (sextend (ucast ((((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) AND 0x1ff))) 32 64::64 word) \<and> R13 \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> R12 \<sigma> = ucast (((0x200::32 word) - (((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) AND 0x1ff))) \<and> R9 \<sigma> = R9\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = RDI\<^sub>0\<close>
declare Q_rep_movs_ESRDI_DSRSI_addr_0x1b887_92_def[Qs]

schematic_goal raw_pread_0_1_0x1b887_0x1b887_92[blocks]:
  assumes \<open>(P_0x1b887_92 && P_0x1b887_92_regions) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x1b887 92 \<sigma> \<triangleq> ?\<sigma> \<and> Q_rep_movs_ESRDI_DSRSI_addr_0x1b887_92 ?\<sigma> \<and> block_usage P_0x1b887_92_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x1b887_92_def P_0x1b887_92_regions_def post: Q_rep_movs_ESRDI_DSRSI_addr_0x1b887_92_def regionset: P_0x1b887_92_regions_set_def)

definition P_0x1b69e_false_93 :: state_pred where
  \<open>P_0x1b69e_false_93 \<sigma> \<equiv> RIP \<sigma> = 0x1b69e \<and> RAX \<sigma> = (sextend (ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word))) 32 64::64 word) \<and> RBX \<sigma> = RSI\<^sub>0 \<and> RCX \<sigma> = ucast ((if' ((((\<langle>31,0\<rangle>((RCX\<^sub>0::64 word) + (((\<langle>63,0\<rangle>((ucast (((((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) AND 0x1ff)::32 word))::64 word) * (0x1::64 word))::64 word)::64 word) + 0x1ff))::32 word)::32 word) AND 0xfffffe00)::32 word) >s 0x4000 then 0x4000 else ((((\<langle>31,0\<rangle>((RCX\<^sub>0::64 word) + (((\<langle>63,0\<rangle>((ucast (((((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) AND 0x1ff)::32 word))::64 word) * (0x1::64 word))::64 word)::64 word) + 0x1ff))::32 word)::32 word) AND 0xfffffe00)::32 word))) \<and> RDX \<sigma> = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word) \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = (((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word)::64 word) + (sextend (ucast ((((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) AND 0x1ff))) 32 64::64 word)) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x48) \<and> RBP \<sigma> = RDX\<^sub>0 \<and> R15 \<sigma> = ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)) \<and> R14 \<sigma> = (sextend (ucast ((((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) AND 0x1ff))) 32 64::64 word) \<and> R13 \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> R12 \<sigma> = ucast (((0x200::32 word) - (((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) AND 0x1ff))) \<and> R9 \<sigma> = R9\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = RDI\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),8]::64 word) = 0x1b674\<close>
declare P_0x1b69e_false_93_def[Ps]

definition P_0x1b69e_false_93_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x1b69e_false_93_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((RDI\<^sub>0::64 word) + 0x40), 8),
    (2, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x40), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x50), 8)
  }\<close>

definition P_0x1b69e_false_93_regions :: state_pred where
  \<open>P_0x1b69e_false_93_regions \<sigma> \<equiv> \<exists>regions. P_0x1b69e_false_93_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x1b6a6_93 :: state_pred where
  \<open>Q_0x1b6a6_93 \<sigma> \<equiv> RIP \<sigma> = 0x1b6a6 \<and> RAX \<sigma> = (sextend (ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word))) 32 64::64 word) \<and> RBX \<sigma> = RSI\<^sub>0 \<and> RCX \<sigma> = ucast ((if' ((((\<langle>31,0\<rangle>((RCX\<^sub>0::64 word) + (((\<langle>63,0\<rangle>((ucast (((((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) AND 0x1ff)::32 word))::64 word) * (0x1::64 word))::64 word)::64 word) + 0x1ff))::32 word)::32 word) AND 0xfffffe00)::32 word) >s 0x4000 then 0x4000 else ((((\<langle>31,0\<rangle>((RCX\<^sub>0::64 word) + (((\<langle>63,0\<rangle>((ucast (((((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) AND 0x1ff)::32 word))::64 word) * (0x1::64 word))::64 word)::64 word) + 0x1ff))::32 word)::32 word) AND 0xfffffe00)::32 word))) \<and> RDX \<sigma> = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word) \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = (((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word)::64 word) + (sextend (ucast ((((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) AND 0x1ff))) 32 64::64 word)) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x48) \<and> RBP \<sigma> = RDX\<^sub>0 \<and> R15 \<sigma> = ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)) \<and> R14 \<sigma> = (sextend (ucast ((((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) AND 0x1ff))) 32 64::64 word) \<and> R13 \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> R12 \<sigma> = ucast (((0x200::32 word) - (((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) AND 0x1ff))) \<and> R9 \<sigma> = R9\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = RDI\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),8]::64 word) = 0x1b674\<close>
declare Q_0x1b6a6_93_def[Qs]

schematic_goal raw_pread_0_2_0x1b69e_0x1b6a4_93[blocks]:
  assumes \<open>(P_0x1b69e_false_93 && P_0x1b69e_false_93_regions && ! !CF) \<sigma>\<close>
  shows \<open>exec_block 2 0x1b6a4 93 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x1b6a6_93 ?\<sigma> \<and> block_usage P_0x1b69e_false_93_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x1b69e_false_93_def P_0x1b69e_false_93_regions_def post: Q_0x1b6a6_93_def regionset: P_0x1b69e_false_93_regions_set_def)

definition P_0x1b6a6_true_94 :: state_pred where
  \<open>P_0x1b6a6_true_94 \<sigma> \<equiv> RIP \<sigma> = 0x1b6a6 \<and> RAX \<sigma> = (sextend (ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word))) 32 64::64 word) \<and> RBX \<sigma> = RSI\<^sub>0 \<and> RCX \<sigma> = ucast ((if' ((((\<langle>31,0\<rangle>((RCX\<^sub>0::64 word) + (((\<langle>63,0\<rangle>((ucast (((((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) AND 0x1ff)::32 word))::64 word) * (0x1::64 word))::64 word)::64 word) + 0x1ff))::32 word)::32 word) AND 0xfffffe00)::32 word) >s 0x4000 then 0x4000 else ((((\<langle>31,0\<rangle>((RCX\<^sub>0::64 word) + (((\<langle>63,0\<rangle>((ucast (((((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) AND 0x1ff)::32 word))::64 word) * (0x1::64 word))::64 word)::64 word) + 0x1ff))::32 word)::32 word) AND 0xfffffe00)::32 word))) \<and> RDX \<sigma> = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word) \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = (((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word)::64 word) + (sextend (ucast ((((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) AND 0x1ff))) 32 64::64 word)) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x48) \<and> RBP \<sigma> = RDX\<^sub>0 \<and> R15 \<sigma> = ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)) \<and> R14 \<sigma> = (sextend (ucast ((((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) AND 0x1ff))) 32 64::64 word) \<and> R13 \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> R12 \<sigma> = ucast (((0x200::32 word) - (((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) AND 0x1ff))) \<and> R9 \<sigma> = R9\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = RDI\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),8]::64 word) = 0x1b674\<close>
declare P_0x1b6a6_true_94_def[Ps]

definition P_0x1b6a6_true_94_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x1b6a6_true_94_regions_set \<sigma> \<equiv> {
    (0, RDX\<^sub>0, 4),
    (1, RSP\<^sub>0, 8),
    (2, ((RDI\<^sub>0::64 word) + 0x40), 8),
    (3, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28), 8),
    (4, (((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word)::64 word) + (sextend (ucast ((((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) AND 0x1ff))) 32 64::64 word)), 4),
    (5, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (11, ((RSP\<^sub>0::64 word) - 0x40), 8),
    (12, ((RSP\<^sub>0::64 word) - 0x50), 8),
    (13, ((((RDX\<^sub>0::64 word) + (\<langle>63,0\<rangle>(((sextend (ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word))) 32 64::64 word)::64 word) * 0x1)::64 word))::64 word) - 0x4), 4),
    (14, (((((((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word)::64 word) + (sextend (ucast ((((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) AND 0x1ff))) 32 64::64 word))::64 word) + (\<langle>63,0\<rangle>(((sextend (ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word))) 32 64::64 word)::64 word) * 0x1)::64 word))::64 word) - 0x4), 4)
  }\<close>

definition P_0x1b6a6_true_94_regions :: state_pred where
  \<open>P_0x1b6a6_true_94_regions \<sigma> \<equiv> \<exists>regions. P_0x1b6a6_true_94_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x1b88a_94 :: state_pred where
  \<open>Q_0x1b88a_94 \<sigma> \<equiv> RIP \<sigma> = 0x1b88a \<and> RBX \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x48) \<and> R15 \<sigma> = ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)) \<and> R14 \<sigma> = (sextend (ucast ((((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) AND 0x1ff))) 32 64::64 word) \<and> R13 \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> R12 \<sigma> = ucast (((0x200::32 word) - (((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) AND 0x1ff))) \<and> R9 \<sigma> = R9\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = RDI\<^sub>0\<close>
declare Q_0x1b88a_94_def[Qs]

schematic_goal raw_pread_0_6_0x1b6a6_0x1b8a9_94[blocks]:
  assumes \<open>(P_0x1b6a6_true_94 && P_0x1b6a6_true_94_regions && !ZF) \<sigma>\<close>
  shows \<open>exec_block 6 0x1b8a9 94 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x1b88a_94 ?\<sigma> \<and> block_usage P_0x1b6a6_true_94_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x1b6a6_true_94_def P_0x1b6a6_true_94_regions_def post: Q_0x1b88a_94_def regionset: P_0x1b6a6_true_94_regions_set_def)

definition P_0x1b6a6_false_95 :: state_pred where
  \<open>P_0x1b6a6_false_95 \<sigma> \<equiv> RIP \<sigma> = 0x1b6a6 \<and> RAX \<sigma> = (sextend (ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word))) 32 64::64 word) \<and> RBX \<sigma> = RSI\<^sub>0 \<and> RCX \<sigma> = ucast ((if' ((((\<langle>31,0\<rangle>((RCX\<^sub>0::64 word) + (((\<langle>63,0\<rangle>((ucast (((((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) AND 0x1ff)::32 word))::64 word) * (0x1::64 word))::64 word)::64 word) + 0x1ff))::32 word)::32 word) AND 0xfffffe00)::32 word) >s 0x4000 then 0x4000 else ((((\<langle>31,0\<rangle>((RCX\<^sub>0::64 word) + (((\<langle>63,0\<rangle>((ucast (((((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) AND 0x1ff)::32 word))::64 word) * (0x1::64 word))::64 word)::64 word) + 0x1ff))::32 word)::32 word) AND 0xfffffe00)::32 word))) \<and> RDX \<sigma> = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word) \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = (((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word)::64 word) + (sextend (ucast ((((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) AND 0x1ff))) 32 64::64 word)) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x48) \<and> RBP \<sigma> = RDX\<^sub>0 \<and> R15 \<sigma> = ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)) \<and> R14 \<sigma> = (sextend (ucast ((((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) AND 0x1ff))) 32 64::64 word) \<and> R13 \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> R12 \<sigma> = ucast (((0x200::32 word) - (((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) AND 0x1ff))) \<and> R9 \<sigma> = R9\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = RDI\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),8]::64 word) = 0x1b674\<close>
declare P_0x1b6a6_false_95_def[Ps]

definition P_0x1b6a6_false_95_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x1b6a6_false_95_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((RDI\<^sub>0::64 word) + 0x40), 8),
    (2, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x40), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x50), 8)
  }\<close>

definition P_0x1b6a6_false_95_regions :: state_pred where
  \<open>P_0x1b6a6_false_95_regions \<sigma> \<equiv> \<exists>regions. P_0x1b6a6_false_95_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x1b6af_95 :: state_pred where
  \<open>Q_0x1b6af_95 \<sigma> \<equiv> RIP \<sigma> = 0x1b6af \<and> RAX \<sigma> = (sextend (ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word))) 32 64::64 word) \<and> RBX \<sigma> = RSI\<^sub>0 \<and> RCX \<sigma> = ucast ((if' ((((\<langle>31,0\<rangle>((RCX\<^sub>0::64 word) + (((\<langle>63,0\<rangle>((ucast (((((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) AND 0x1ff)::32 word))::64 word) * (0x1::64 word))::64 word)::64 word) + 0x1ff))::32 word)::32 word) AND 0xfffffe00)::32 word) >s 0x4000 then 0x4000 else ((((\<langle>31,0\<rangle>((RCX\<^sub>0::64 word) + (((\<langle>63,0\<rangle>((ucast (((((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) AND 0x1ff)::32 word))::64 word) * (0x1::64 word))::64 word)::64 word) + 0x1ff))::32 word)::32 word) AND 0xfffffe00)::32 word))) \<and> RDX \<sigma> = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word) \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = (((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word)::64 word) + (sextend (ucast ((((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) AND 0x1ff))) 32 64::64 word)) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x48) \<and> RBP \<sigma> = RDX\<^sub>0 \<and> R15 \<sigma> = ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)) \<and> R14 \<sigma> = (sextend (ucast ((((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) AND 0x1ff))) 32 64::64 word) \<and> R13 \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> R12 \<sigma> = ucast (((0x200::32 word) - (((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) AND 0x1ff))) \<and> R9 \<sigma> = R9\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = RDI\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),8]::64 word) = 0x1b674\<close>
declare Q_0x1b6af_95_def[Qs]

schematic_goal raw_pread_0_2_0x1b6a6_0x1b6ac_95[blocks]:
  assumes \<open>(P_0x1b6a6_false_95 && P_0x1b6a6_false_95_regions && ! !ZF) \<sigma>\<close>
  shows \<open>exec_block 2 0x1b6ac 95 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x1b6af_95 ?\<sigma> \<and> block_usage P_0x1b6a6_false_95_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x1b6a6_false_95_def P_0x1b6a6_false_95_regions_def post: Q_0x1b6af_95_def regionset: P_0x1b6a6_false_95_regions_set_def)

definition P_0x1b6af_true_96 :: state_pred where
  \<open>P_0x1b6af_true_96 \<sigma> \<equiv> RIP \<sigma> = 0x1b6af \<and> RAX \<sigma> = (sextend (ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word))) 32 64::64 word) \<and> RBX \<sigma> = RSI\<^sub>0 \<and> RCX \<sigma> = ucast ((if' ((((\<langle>31,0\<rangle>((RCX\<^sub>0::64 word) + (((\<langle>63,0\<rangle>((ucast (((((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) AND 0x1ff)::32 word))::64 word) * (0x1::64 word))::64 word)::64 word) + 0x1ff))::32 word)::32 word) AND 0xfffffe00)::32 word) >s 0x4000 then 0x4000 else ((((\<langle>31,0\<rangle>((RCX\<^sub>0::64 word) + (((\<langle>63,0\<rangle>((ucast (((((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) AND 0x1ff)::32 word))::64 word) * (0x1::64 word))::64 word)::64 word) + 0x1ff))::32 word)::32 word) AND 0xfffffe00)::32 word))) \<and> RDX \<sigma> = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word) \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = (((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word)::64 word) + (sextend (ucast ((((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) AND 0x1ff))) 32 64::64 word)) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x48) \<and> RBP \<sigma> = RDX\<^sub>0 \<and> R15 \<sigma> = ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)) \<and> R14 \<sigma> = (sextend (ucast ((((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) AND 0x1ff))) 32 64::64 word) \<and> R13 \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> R12 \<sigma> = ucast (((0x200::32 word) - (((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) AND 0x1ff))) \<and> R9 \<sigma> = R9\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = RDI\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),8]::64 word) = 0x1b674\<close>
declare P_0x1b6af_true_96_def[Ps]

definition P_0x1b6af_true_96_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x1b6af_true_96_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((RDI\<^sub>0::64 word) + 0x40), 8),
    (2, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x40), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x50), 8)
  }\<close>

definition P_0x1b6af_true_96_regions :: state_pred where
  \<open>P_0x1b6af_true_96_regions \<sigma> \<equiv> \<exists>regions. P_0x1b6af_true_96_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x1b88a_96 :: state_pred where
  \<open>Q_0x1b88a_96 \<sigma> \<equiv> RIP \<sigma> = 0x1b88a \<and> RBX \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x48) \<and> R15 \<sigma> = ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)) \<and> R14 \<sigma> = (sextend (ucast ((((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) AND 0x1ff))) 32 64::64 word) \<and> R13 \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> R12 \<sigma> = ucast (((0x200::32 word) - (((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) AND 0x1ff))) \<and> R9 \<sigma> = R9\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = RDI\<^sub>0\<close>
declare Q_0x1b88a_96_def[Qs]

schematic_goal raw_pread_0_1_0x1b6af_0x1b6af_96[blocks]:
  assumes \<open>(P_0x1b6af_true_96 && P_0x1b6af_true_96_regions && ZF) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x1b6af 96 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x1b88a_96 ?\<sigma> \<and> block_usage P_0x1b6af_true_96_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x1b6af_true_96_def P_0x1b6af_true_96_regions_def post: Q_0x1b88a_96_def regionset: P_0x1b6af_true_96_regions_set_def)

definition P_0x1b6af_false_97 :: state_pred where
  \<open>P_0x1b6af_false_97 \<sigma> \<equiv> RIP \<sigma> = 0x1b6af \<and> RAX \<sigma> = (sextend (ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word))) 32 64::64 word) \<and> RBX \<sigma> = RSI\<^sub>0 \<and> RCX \<sigma> = ucast ((if' ((((\<langle>31,0\<rangle>((RCX\<^sub>0::64 word) + (((\<langle>63,0\<rangle>((ucast (((((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) AND 0x1ff)::32 word))::64 word) * (0x1::64 word))::64 word)::64 word) + 0x1ff))::32 word)::32 word) AND 0xfffffe00)::32 word) >s 0x4000 then 0x4000 else ((((\<langle>31,0\<rangle>((RCX\<^sub>0::64 word) + (((\<langle>63,0\<rangle>((ucast (((((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) AND 0x1ff)::32 word))::64 word) * (0x1::64 word))::64 word)::64 word) + 0x1ff))::32 word)::32 word) AND 0xfffffe00)::32 word))) \<and> RDX \<sigma> = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word) \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = (((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word)::64 word) + (sextend (ucast ((((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) AND 0x1ff))) 32 64::64 word)) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x48) \<and> RBP \<sigma> = RDX\<^sub>0 \<and> R15 \<sigma> = ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)) \<and> R14 \<sigma> = (sextend (ucast ((((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) AND 0x1ff))) 32 64::64 word) \<and> R13 \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> R12 \<sigma> = ucast (((0x200::32 word) - (((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) AND 0x1ff))) \<and> R9 \<sigma> = R9\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = RDI\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),8]::64 word) = 0x1b674\<close>
declare P_0x1b6af_false_97_def[Ps]

definition P_0x1b6af_false_97_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x1b6af_false_97_regions_set \<sigma> \<equiv> {
    (0, RDX\<^sub>0, Suc 0),
    (1, RSP\<^sub>0, 8),
    (2, ((RDI\<^sub>0::64 word) + 0x40), 8),
    (3, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28), 8),
    (4, (((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word)::64 word) + (sextend (ucast ((((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) AND 0x1ff))) 32 64::64 word)), Suc 0),
    (5, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (11, ((RSP\<^sub>0::64 word) - 0x40), 8),
    (12, ((RSP\<^sub>0::64 word) - 0x50), 8)
  }\<close>

definition P_0x1b6af_false_97_regions :: state_pred where
  \<open>P_0x1b6af_false_97_regions \<sigma> \<equiv> \<exists>regions. P_0x1b6af_false_97_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x1b6bd_97 :: state_pred where
  \<open>Q_0x1b6bd_97 \<sigma> \<equiv> RIP \<sigma> = 0x1b6bd \<and> RAX \<sigma> = (sextend (ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word))) 32 64::64 word) \<and> RBX \<sigma> = RSI\<^sub>0 \<and> RCX \<sigma> = ucast ((if' ((((\<langle>31,0\<rangle>((RCX\<^sub>0::64 word) + (((\<langle>63,0\<rangle>((ucast (((((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) AND 0x1ff)::32 word))::64 word) * (0x1::64 word))::64 word)::64 word) + 0x1ff))::32 word)::32 word) AND 0xfffffe00)::32 word) >s 0x4000 then 0x4000 else ((((\<langle>31,0\<rangle>((RCX\<^sub>0::64 word) + (((\<langle>63,0\<rangle>((ucast (((((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) AND 0x1ff)::32 word))::64 word) * (0x1::64 word))::64 word)::64 word) + 0x1ff))::32 word)::32 word) AND 0xfffffe00)::32 word))) \<and> RDX \<sigma> = ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word)::64 word) + (sextend (ucast ((((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) AND 0x1ff))) 32 64::64 word)),1]::8 word)) \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = (((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word)::64 word) + (sextend (ucast ((((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) AND 0x1ff))) 32 64::64 word)) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x48) \<and> RBP \<sigma> = RDX\<^sub>0 \<and> R15 \<sigma> = ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)) \<and> R14 \<sigma> = (sextend (ucast ((((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) AND 0x1ff))) 32 64::64 word) \<and> R13 \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> R12 \<sigma> = ucast (((0x200::32 word) - (((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) AND 0x1ff))) \<and> R9 \<sigma> = R9\<^sub>0 \<and> (\<sigma> \<turnstile> *[RDX\<^sub>0,1]::8 word) = ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word)::64 word) + (sextend (ucast ((((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) AND 0x1ff))) 32 64::64 word)),1]::8 word)) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word)::64 word) + (sextend (ucast ((((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) AND 0x1ff))) 32 64::64 word)),1]::8 word) = ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word)::64 word) + (sextend (ucast ((((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) AND 0x1ff))) 32 64::64 word)),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = RDI\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),8]::64 word) = 0x1b674\<close>
declare Q_0x1b6bd_97_def[Qs]

schematic_goal raw_pread_0_4_0x1b6af_0x1b6bb_97[blocks]:
  assumes \<open>(P_0x1b6af_false_97 && P_0x1b6af_false_97_regions && ! ZF) \<sigma>\<close>
  shows \<open>exec_block 4 0x1b6bb 97 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x1b6bd_97 ?\<sigma> \<and> block_usage P_0x1b6af_false_97_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x1b6af_false_97_def P_0x1b6af_false_97_regions_def post: Q_0x1b6bd_97_def regionset: P_0x1b6af_false_97_regions_set_def)

definition P_0x1b6bd_true_98 :: state_pred where
  \<open>P_0x1b6bd_true_98 \<sigma> \<equiv> RIP \<sigma> = 0x1b6bd \<and> RAX \<sigma> = (sextend (ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word))) 32 64::64 word) \<and> RBX \<sigma> = RSI\<^sub>0 \<and> RCX \<sigma> = ucast ((if' ((((\<langle>31,0\<rangle>((RCX\<^sub>0::64 word) + (((\<langle>63,0\<rangle>((ucast (((((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) AND 0x1ff)::32 word))::64 word) * (0x1::64 word))::64 word)::64 word) + 0x1ff))::32 word)::32 word) AND 0xfffffe00)::32 word) >s 0x4000 then 0x4000 else ((((\<langle>31,0\<rangle>((RCX\<^sub>0::64 word) + (((\<langle>63,0\<rangle>((ucast (((((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) AND 0x1ff)::32 word))::64 word) * (0x1::64 word))::64 word)::64 word) + 0x1ff))::32 word)::32 word) AND 0xfffffe00)::32 word))) \<and> RDX \<sigma> = ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word)::64 word) + (sextend (ucast ((((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) AND 0x1ff))) 32 64::64 word)),1]::8 word)) \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = (((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word)::64 word) + (sextend (ucast ((((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) AND 0x1ff))) 32 64::64 word)) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x48) \<and> RBP \<sigma> = RDX\<^sub>0 \<and> R15 \<sigma> = ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)) \<and> R14 \<sigma> = (sextend (ucast ((((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) AND 0x1ff))) 32 64::64 word) \<and> R13 \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> R12 \<sigma> = ucast (((0x200::32 word) - (((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) AND 0x1ff))) \<and> R9 \<sigma> = R9\<^sub>0 \<and> (\<sigma> \<turnstile> *[RDX\<^sub>0,1]::8 word) = ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word)::64 word) + (sextend (ucast ((((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) AND 0x1ff))) 32 64::64 word)),1]::8 word)) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word)::64 word) + (sextend (ucast ((((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) AND 0x1ff))) 32 64::64 word)),1]::8 word) = ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word)::64 word) + (sextend (ucast ((((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) AND 0x1ff))) 32 64::64 word)),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = RDI\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),8]::64 word) = 0x1b674\<close>
declare P_0x1b6bd_true_98_def[Ps]

definition P_0x1b6bd_true_98_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x1b6bd_true_98_regions_set \<sigma> \<equiv> {
    (0, RDX\<^sub>0, Suc 0),
    (1, RSP\<^sub>0, 8),
    (2, ((RDI\<^sub>0::64 word) + 0x40), 8),
    (3, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28), 8),
    (4, (((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word)::64 word) + (sextend (ucast ((((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) AND 0x1ff))) 32 64::64 word)), Suc 0),
    (5, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (11, ((RSP\<^sub>0::64 word) - 0x40), 8),
    (12, ((RSP\<^sub>0::64 word) - 0x50), 8)
  }\<close>

definition P_0x1b6bd_true_98_regions :: state_pred where
  \<open>P_0x1b6bd_true_98_regions \<sigma> \<equiv> \<exists>regions. P_0x1b6bd_true_98_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x1b88a_98 :: state_pred where
  \<open>Q_0x1b88a_98 \<sigma> \<equiv> RIP \<sigma> = 0x1b88a \<and> RBX \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x48) \<and> R15 \<sigma> = ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)) \<and> R14 \<sigma> = (sextend (ucast ((((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) AND 0x1ff))) 32 64::64 word) \<and> R13 \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> R12 \<sigma> = ucast (((0x200::32 word) - (((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) AND 0x1ff))) \<and> R9 \<sigma> = R9\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = RDI\<^sub>0\<close>
declare Q_0x1b88a_98_def[Qs]

schematic_goal raw_pread_0_1_0x1b6bd_0x1b6bd_98[blocks]:
  assumes \<open>(P_0x1b6bd_true_98 && P_0x1b6bd_true_98_regions && ZF) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x1b6bd 98 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x1b88a_98 ?\<sigma> \<and> block_usage P_0x1b6bd_true_98_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x1b6bd_true_98_def P_0x1b6bd_true_98_regions_def post: Q_0x1b88a_98_def regionset: P_0x1b6bd_true_98_regions_set_def)

definition P_0x1b6bd_false_99 :: state_pred where
  \<open>P_0x1b6bd_false_99 \<sigma> \<equiv> RIP \<sigma> = 0x1b6bd \<and> RAX \<sigma> = (sextend (ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word))) 32 64::64 word) \<and> RBX \<sigma> = RSI\<^sub>0 \<and> RCX \<sigma> = ucast ((if' ((((\<langle>31,0\<rangle>((RCX\<^sub>0::64 word) + (((\<langle>63,0\<rangle>((ucast (((((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) AND 0x1ff)::32 word))::64 word) * (0x1::64 word))::64 word)::64 word) + 0x1ff))::32 word)::32 word) AND 0xfffffe00)::32 word) >s 0x4000 then 0x4000 else ((((\<langle>31,0\<rangle>((RCX\<^sub>0::64 word) + (((\<langle>63,0\<rangle>((ucast (((((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) AND 0x1ff)::32 word))::64 word) * (0x1::64 word))::64 word)::64 word) + 0x1ff))::32 word)::32 word) AND 0xfffffe00)::32 word))) \<and> RDX \<sigma> = ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word)::64 word) + (sextend (ucast ((((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) AND 0x1ff))) 32 64::64 word)),1]::8 word)) \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = (((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word)::64 word) + (sextend (ucast ((((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) AND 0x1ff))) 32 64::64 word)) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x48) \<and> RBP \<sigma> = RDX\<^sub>0 \<and> R15 \<sigma> = ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)) \<and> R14 \<sigma> = (sextend (ucast ((((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) AND 0x1ff))) 32 64::64 word) \<and> R13 \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> R12 \<sigma> = ucast (((0x200::32 word) - (((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) AND 0x1ff))) \<and> R9 \<sigma> = R9\<^sub>0 \<and> (\<sigma> \<turnstile> *[RDX\<^sub>0,1]::8 word) = ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word)::64 word) + (sextend (ucast ((((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) AND 0x1ff))) 32 64::64 word)),1]::8 word)) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word)::64 word) + (sextend (ucast ((((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) AND 0x1ff))) 32 64::64 word)),1]::8 word) = ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word)::64 word) + (sextend (ucast ((((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) AND 0x1ff))) 32 64::64 word)),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = RDI\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),8]::64 word) = 0x1b674\<close>
declare P_0x1b6bd_false_99_def[Ps]

definition P_0x1b6bd_false_99_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x1b6bd_false_99_regions_set \<sigma> \<equiv> {
    (0, RDX\<^sub>0, Suc 0),
    (1, RSP\<^sub>0, 8),
    (2, ((RDI\<^sub>0::64 word) + 0x40), 8),
    (3, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28), 8),
    (4, (((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word)::64 word) + (sextend (ucast ((((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) AND 0x1ff))) 32 64::64 word)), Suc 0),
    (5, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (11, ((RSP\<^sub>0::64 word) - 0x40), 8),
    (12, ((RSP\<^sub>0::64 word) - 0x50), 8),
    (13, ((((RDX\<^sub>0::64 word) + (\<langle>63,0\<rangle>(((sextend (ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word))) 32 64::64 word)::64 word) * 0x1)::64 word))::64 word) - 0x2), 2),
    (14, (((((((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word)::64 word) + (sextend (ucast ((((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) AND 0x1ff))) 32 64::64 word))::64 word) + (\<langle>63,0\<rangle>(((sextend (ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word))) 32 64::64 word)::64 word) * 0x1)::64 word))::64 word) - 0x2), 2)
  }\<close>

definition P_0x1b6bd_false_99_regions :: state_pred where
  \<open>P_0x1b6bd_false_99_regions \<sigma> \<equiv> \<exists>regions. P_0x1b6bd_false_99_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x1b88a_99 :: state_pred where
  \<open>Q_0x1b88a_99 \<sigma> \<equiv> RIP \<sigma> = 0x1b88a \<and> RBX \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x48) \<and> R15 \<sigma> = ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)) \<and> R14 \<sigma> = (sextend (ucast ((((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) AND 0x1ff))) 32 64::64 word) \<and> R13 \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> R12 \<sigma> = ucast (((0x200::32 word) - (((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) AND 0x1ff))) \<and> R9 \<sigma> = R9\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = RDI\<^sub>0\<close>
declare Q_0x1b88a_99_def[Qs]

schematic_goal raw_pread_0_4_0x1b6bd_0x1b6cd_99[blocks]:
  assumes \<open>(P_0x1b6bd_false_99 && P_0x1b6bd_false_99_regions && ! ZF) \<sigma>\<close>
  shows \<open>exec_block 4 0x1b6cd 99 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x1b88a_99 ?\<sigma> \<and> block_usage P_0x1b6bd_false_99_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x1b6bd_false_99_def P_0x1b6bd_false_99_regions_def post: Q_0x1b88a_99_def regionset: P_0x1b6bd_false_99_regions_set_def)

definition P_0x1b88a_100 :: state_pred where
  \<open>P_0x1b88a_100 \<sigma> \<equiv> RIP \<sigma> = 0x1b88a \<and> RBX \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x48) \<and> R15 \<sigma> = ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)) \<and> R14 \<sigma> = (sextend (ucast ((((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) AND 0x1ff))) 32 64::64 word) \<and> R13 \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> R12 \<sigma> = ucast (((0x200::32 word) - (((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) AND 0x1ff))) \<and> R9 \<sigma> = R9\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = RDI\<^sub>0\<close>
declare P_0x1b88a_100_def[Ps]

definition P_0x1b88a_100_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x1b88a_100_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((RDI\<^sub>0::64 word) + 0x40), 8),
    (2, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x40), 8)
  }\<close>

definition P_0x1b88a_100_regions :: state_pred where
  \<open>P_0x1b88a_100_regions \<sigma> \<equiv> \<exists>regions. P_0x1b88a_100_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_ret_address_100 :: state_pred where
  \<open>Q_ret_address_100 \<sigma> \<equiv> RIP \<sigma> = ret_address \<and> RBX \<sigma> = RBX\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) + 0x8) \<and> RBP \<sigma> = RBP\<^sub>0 \<and> R15 \<sigma> = R15\<^sub>0 \<and> R14 \<sigma> = R14\<^sub>0 \<and> R13 \<sigma> = R13\<^sub>0 \<and> R12 \<sigma> = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = RDI\<^sub>0\<close>
declare Q_ret_address_100_def[Qs]

schematic_goal raw_pread_0_9_0x1b88a_0x1b89b_100[blocks]:
  assumes \<open>(P_0x1b88a_100 && P_0x1b88a_100_regions) \<sigma>\<close>
  shows \<open>exec_block 9 0x1b89b 100 \<sigma> \<triangleq> ?\<sigma> \<and> Q_ret_address_100 ?\<sigma> \<and> block_usage P_0x1b88a_100_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x1b88a_100_def P_0x1b88a_100_regions_def post: Q_ret_address_100_def regionset: P_0x1b88a_100_regions_set_def)

definition raw_pread_acode :: ACode where
  \<open>raw_pread_acode =
    Block 14 0x1b634 0;
    IF ZF THEN
      Block 3 0x1b85b (Suc 0);
      Block 4 0x1b6ff 2;
      Block (Suc 0) 0x1b702 3;
      CALL raw_pread_aligned_acode;
      Block (Suc 0) 0x1b707 4;
      Block 8 0x1b718 5
    ELSE
      Block 3 0x1b640 6;
      IF ZF THEN
        Block 3 0x1b6db 7;
        IF !ZF THEN
          Block 3 0x1b78b 8;
          WHILE P_0x1b794_9 DO
            Block 7 0x1b7b4 9;
            Block (Suc 0) 0x1b7b7 10;
            CALL raw_pread_aligned_acode;
            Block (Suc 0) 0x1b7bc 11;
            IF SF THEN
              Block (Suc 0) 0x1b7be 12
            ELSE
              Block 9 0x1b7db 13;
              Block (Suc 0) 0x1b7df 14;
              CALL memcpy_acode;
              Block 5 0x1b7f1 15;
              IF !ZF THEN
                Block 2 0x1b790 16
              ELSE
                Block (Suc 0) 0x1b7f4 17
              FI
            FI
          OD;
          CASES [
            (P_0x1b7f6_18,
              Block 9 0x1b807 18
            ),
            (P_0x1b70a_19,
              Block 8 0x1b718 19
            )
          ]
        ELSE
          Block 2 0x1b6e8 20;
          IF !ZF THEN
            Block 3 0x1b812 21;
            IF !ZF THEN
              Block (Suc 0) 0x1b814 22;
              WHILE P_0x1b794_23 DO
                Block 7 0x1b7b4 23;
                Block (Suc 0) 0x1b7b7 24;
                CALL raw_pread_aligned_acode;
                Block (Suc 0) 0x1b7bc 25;
                IF SF THEN
                  Block (Suc 0) 0x1b7be 26
                ELSE
                  Block 9 0x1b7db 27;
                  Block (Suc 0) 0x1b7df 28;
                  CALL memcpy_acode;
                  Block 5 0x1b7f1 29;
                  IF !ZF THEN
                    Block 2 0x1b790 30
                  ELSE
                    Block (Suc 0) 0x1b7f4 31
                  FI
                FI
              OD;
              CASES [
                (P_0x1b7f6_32,
                  Block 9 0x1b807 32
                ),
                (P_0x1b70a_33,
                  Block 8 0x1b718 33
                )
              ]
            ELSE
              Block 2 0x1b81a 34;
              Block 8 0x1b718 35
            FI
          ELSE
            Block 5 0x1b6ff 36;
            Block (Suc 0) 0x1b702 37;
            CALL raw_pread_aligned_acode;
            Block (Suc 0) 0x1b707 38;
            Block 8 0x1b718 39
          FI
        FI
      ELSE
        Block 8 0x1b66c 40;
        Block (Suc 0) 0x1b66f 41;
        CALL raw_pread_aligned_acode;
        Block (Suc 0) 0x1b674 42;
        IF SF THEN
          Block 9 0x1b718 43
        ELSE
          Block 7 0x1b68e 44;
          IF jge THEN
            Block 3 0x1b723 45;
            IF CF THEN
              Block 2 0x1b820 46;
              IF !ZF THEN
                Block 7 0x1b8bb 47
              ELSE
                Block 2 0x1b828 48;
                IF ZF THEN
                  Block (Suc 0) 0x1b82a 49
                ELSE
                  Block 4 0x1b836 50;
                  IF ZF THEN
                    Block (Suc 0) 0x1b83a 51
                  ELSE
                    Block 5 0x1b84d 52
                  FI
                FI
              FI
            ELSE
              Block 15 0x1b75a 53;
              Block (Suc 0) 0x1b75c 54;
              CALL rep_movs_ESRDI_DSRSI_acode
            FI;
            Block 3 0x1b765 55;
            IF ZF THEN
              Block 10 0x1b807 56
            ELSE
              Block 2 0x1b76e 57;
              IF !ZF THEN
                Block (Suc 0) 0x1b775 58;
                WHILE P_0x1b790_59 DO
                  Block (Suc 0) 0x1b790 59;
                  Block 7 0x1b7b4 60;
                  Block (Suc 0) 0x1b7b7 61;
                  CALL raw_pread_aligned_acode;
                  Block (Suc 0) 0x1b7bc 62;
                  IF SF THEN
                    Block (Suc 0) 0x1b7be 63
                  ELSE
                    Block 9 0x1b7db 64;
                    Block (Suc 0) 0x1b7df 65;
                    CALL memcpy_acode;
                    Block 5 0x1b7f1 66;
                    IF !ZF THEN
                      Block (Suc 0) 0x1b7f4 67
                    ELSE
                      Block (Suc 0) 0x1b7f4 68
                    FI
                  FI
                OD;
                CASES [
                  (P_0x1b7f6_69,
                    Block 9 0x1b807 69
                  ),
                  (P_0x1b70a_70,
                    Block 8 0x1b718 70
                  )
                ]
              ELSE
                Block 2 0x1b777 71;
                IF !ZF THEN
                  Block (Suc 0) 0x1b77d 72;
                  WHILE P_0x1b790_73 DO
                    Block (Suc 0) 0x1b790 73;
                    Block 7 0x1b7b4 74;
                    Block (Suc 0) 0x1b7b7 75;
                    CALL raw_pread_aligned_acode;
                    Block (Suc 0) 0x1b7bc 76;
                    IF SF THEN
                      Block (Suc 0) 0x1b7be 77
                    ELSE
                      Block 9 0x1b7db 78;
                      Block (Suc 0) 0x1b7df 79;
                      CALL memcpy_acode;
                      Block 5 0x1b7f1 80;
                      IF !ZF THEN
                        Block (Suc 0) 0x1b7f4 81
                      ELSE
                        Block (Suc 0) 0x1b7f4 82
                      FI
                    FI
                  OD;
                  CASES [
                    (P_0x1b7f6_83,
                      Block 9 0x1b807 83
                    ),
                    (P_0x1b70a_84,
                      Block 8 0x1b718 84
                    )
                  ]
                ELSE
                  Block 2 0x1b77f 85;
                  Block 4 0x1b6ff 86;
                  Block (Suc 0) 0x1b702 87;
                  CALL raw_pread_aligned_acode;
                  Block (Suc 0) 0x1b707 88;
                  Block 8 0x1b718 89
                FI
              FI
            FI
          ELSE
            Block 3 0x1b69a 90;
            IF !CF THEN
              Block 11 0x1b883 91;
              Block (Suc 0) 0x1b887 92;
              CALL rep_movs_ESRDI_DSRSI_acode
            ELSE
              Block 2 0x1b6a4 93;
              IF !ZF THEN
                Block 6 0x1b8a9 94
              ELSE
                Block 2 0x1b6ac 95;
                IF ZF THEN
                  Block (Suc 0) 0x1b6af 96
                ELSE
                  Block 4 0x1b6bb 97;
                  IF ZF THEN
                    Block (Suc 0) 0x1b6bd 98
                  ELSE
                    Block 4 0x1b6cd 99
                  FI
                FI
              FI
            FI;
            Block 9 0x1b89b 100
          FI
        FI
      FI
    FI
  \<close>

<<<<<<< HEAD
method vcg_while for P :: state_pred uses assms =
  ((rule htriples)+)?,
  rule HTriple_weaken[where P=P],
  simp add: pred_logic Ps Qs assms,
  rule HTriple_while,
  (vcg_step assms: assms)+,
  (
    (vcg_step' assms: assms | vcg_step assms: assms)+,
    ((simp add: assms)+)?
  )?


=======
>>>>>>> 720d01f42871b7fc47452cfc4b6d3c3cb0d6693e
schematic_goal "raw_pread":
  assumes
    \<open>\<forall>\<sigma>. RIP \<sigma> = 0x1b637 \<longrightarrow> P_0x1b637_true_1_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x1b6f4 \<longrightarrow> P_0x1b6f4_2_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x1b702 \<longrightarrow> P_0x1b702_3_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x1b707 \<longrightarrow> P_0x1b707_4_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x1b70a \<longrightarrow> P_0x1b70a_5_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x1b637 \<longrightarrow> P_0x1b637_false_6_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x1b647 \<longrightarrow> P_0x1b647_true_7_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x1b6e2 \<longrightarrow> P_0x1b6e2_true_8_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x1b794 \<longrightarrow> P_0x1b794_9_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x1b7b7 \<longrightarrow> P_0x1b7b7_10_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x1b7bc \<longrightarrow> P_0x1b7bc_11_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x1b7be \<longrightarrow> P_0x1b7be_true_12_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x1b7be \<longrightarrow> P_0x1b7be_false_13_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x1b7df \<longrightarrow> P_0x1b7df_14_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x1b7e4 \<longrightarrow> P_0x1b7e4_15_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x1b7f4 \<longrightarrow> P_0x1b7f4_true_16_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x1b7f4 \<longrightarrow> P_0x1b7f4_false_17_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x1b7f6 \<longrightarrow> P_0x1b7f6_18_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x1b70a \<longrightarrow> P_0x1b70a_19_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x1b6e2 \<longrightarrow> P_0x1b6e2_false_20_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x1b6ee \<longrightarrow> P_0x1b6ee_true_21_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x1b814 \<longrightarrow> P_0x1b814_true_22_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x1b794 \<longrightarrow> P_0x1b794_23_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x1b7b7 \<longrightarrow> P_0x1b7b7_24_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x1b7bc \<longrightarrow> P_0x1b7bc_25_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x1b7be \<longrightarrow> P_0x1b7be_true_26_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x1b7be \<longrightarrow> P_0x1b7be_false_27_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x1b7df \<longrightarrow> P_0x1b7df_28_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x1b7e4 \<longrightarrow> P_0x1b7e4_29_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x1b7f4 \<longrightarrow> P_0x1b7f4_true_30_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x1b7f4 \<longrightarrow> P_0x1b7f4_false_31_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x1b7f6 \<longrightarrow> P_0x1b7f6_32_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x1b70a \<longrightarrow> P_0x1b70a_33_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x1b814 \<longrightarrow> P_0x1b814_false_34_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x1b70a \<longrightarrow> P_0x1b70a_35_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x1b6ee \<longrightarrow> P_0x1b6ee_false_36_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x1b702 \<longrightarrow> P_0x1b702_37_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x1b707 \<longrightarrow> P_0x1b707_38_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x1b70a \<longrightarrow> P_0x1b70a_39_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x1b647 \<longrightarrow> P_0x1b647_false_40_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x1b66f \<longrightarrow> P_0x1b66f_41_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x1b674 \<longrightarrow> P_0x1b674_42_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x1b676 \<longrightarrow> P_0x1b676_true_43_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x1b676 \<longrightarrow> P_0x1b676_false_44_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x1b691 \<longrightarrow> P_0x1b691_true_45_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x1b726 \<longrightarrow> P_0x1b726_true_46_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x1b822 \<longrightarrow> P_0x1b822_true_47_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x1b822 \<longrightarrow> P_0x1b822_false_48_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x1b82a \<longrightarrow> P_0x1b82a_true_49_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x1b82a \<longrightarrow> P_0x1b82a_false_50_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x1b83a \<longrightarrow> P_0x1b83a_true_51_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x1b83a \<longrightarrow> P_0x1b83a_false_52_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x1b726 \<longrightarrow> P_0x1b726_false_53_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x1b75c \<longrightarrow> P_0x1b75c_54_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x1b75f \<longrightarrow> P_0x1b75f_55_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x1b768 \<longrightarrow> P_0x1b768_true_56_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x1b768 \<longrightarrow> P_0x1b768_false_57_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x1b775 \<longrightarrow> P_0x1b775_true_58_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x1b790 \<longrightarrow> P_0x1b790_59_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x1b794 \<longrightarrow> P_0x1b794_60_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x1b7b7 \<longrightarrow> P_0x1b7b7_61_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x1b7bc \<longrightarrow> P_0x1b7bc_62_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x1b7be \<longrightarrow> P_0x1b7be_true_63_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x1b7be \<longrightarrow> P_0x1b7be_false_64_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x1b7df \<longrightarrow> P_0x1b7df_65_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x1b7e4 \<longrightarrow> P_0x1b7e4_66_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x1b7f4 \<longrightarrow> P_0x1b7f4_true_67_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x1b7f4 \<longrightarrow> P_0x1b7f4_false_68_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x1b7f6 \<longrightarrow> P_0x1b7f6_69_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x1b70a \<longrightarrow> P_0x1b70a_70_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x1b775 \<longrightarrow> P_0x1b775_false_71_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x1b77d \<longrightarrow> P_0x1b77d_true_72_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x1b790 \<longrightarrow> P_0x1b790_73_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x1b794 \<longrightarrow> P_0x1b794_74_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x1b7b7 \<longrightarrow> P_0x1b7b7_75_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x1b7bc \<longrightarrow> P_0x1b7bc_76_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x1b7be \<longrightarrow> P_0x1b7be_true_77_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x1b7be \<longrightarrow> P_0x1b7be_false_78_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x1b7df \<longrightarrow> P_0x1b7df_79_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x1b7e4 \<longrightarrow> P_0x1b7e4_80_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x1b7f4 \<longrightarrow> P_0x1b7f4_true_81_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x1b7f4 \<longrightarrow> P_0x1b7f4_false_82_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x1b7f6 \<longrightarrow> P_0x1b7f6_83_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x1b70a \<longrightarrow> P_0x1b70a_84_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x1b77d \<longrightarrow> P_0x1b77d_false_85_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x1b6f4 \<longrightarrow> P_0x1b6f4_86_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x1b702 \<longrightarrow> P_0x1b702_87_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x1b707 \<longrightarrow> P_0x1b707_88_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x1b70a \<longrightarrow> P_0x1b70a_89_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x1b691 \<longrightarrow> P_0x1b691_false_90_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x1b69e \<longrightarrow> P_0x1b69e_true_91_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x1b887 \<longrightarrow> P_0x1b887_92_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x1b69e \<longrightarrow> P_0x1b69e_false_93_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x1b6a6 \<longrightarrow> P_0x1b6a6_true_94_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x1b6a6 \<longrightarrow> P_0x1b6a6_false_95_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x1b6af \<longrightarrow> P_0x1b6af_true_96_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x1b6af \<longrightarrow> P_0x1b6af_false_97_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x1b6bd \<longrightarrow> P_0x1b6bd_true_98_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x1b6bd \<longrightarrow> P_0x1b6bd_false_99_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x1b88a \<longrightarrow> P_0x1b88a_100_regions \<sigma>\<close>
    and [blocks]: \<open>{{Q_raw_pread_aligned_addr_0x1b702_3}} \<box>raw_pread_aligned_acode {{P_0x1b707_4;M_0x1b702}}\<close>
    and [blocks]: \<open>{{Q_raw_pread_aligned_addr_0x1b7b7_10}} \<box>raw_pread_aligned_acode {{P_0x1b7bc_11;M_0x1b7b7}}\<close>
    and [blocks]: \<open>{{Q_memcpy_addr_0x1b7df_14}} \<box>memcpy_acode {{P_0x1b7e4_15;M_0x1b7df}}\<close>
    and [blocks]: \<open>{{Q_raw_pread_aligned_addr_0x1b7b7_24}} \<box>raw_pread_aligned_acode {{P_0x1b7bc_25;M_0x1b7b7}}\<close>
    and [blocks]: \<open>{{Q_memcpy_addr_0x1b7df_28}} \<box>memcpy_acode {{P_0x1b7e4_29;M_0x1b7df}}\<close>
    and [blocks]: \<open>{{Q_raw_pread_aligned_addr_0x1b702_37}} \<box>raw_pread_aligned_acode {{P_0x1b707_38;M_0x1b702}}\<close>
    and [blocks]: \<open>{{Q_raw_pread_aligned_addr_0x1b66f_41}} \<box>raw_pread_aligned_acode {{P_0x1b674_42;M_0x1b66f}}\<close>
    and [blocks]: \<open>{{Q_rep_movs_ESRDI_DSRSI_addr_0x1b75c_54}} \<box>rep_movs_ESRDI_DSRSI_acode {{P_0x1b75f_55;M_0x1b75c}}\<close>
    and [blocks]: \<open>{{Q_raw_pread_aligned_addr_0x1b7b7_61}} \<box>raw_pread_aligned_acode {{P_0x1b7bc_62;M_0x1b7b7}}\<close>
    and [blocks]: \<open>{{Q_memcpy_addr_0x1b7df_65}} \<box>memcpy_acode {{P_0x1b7e4_66;M_0x1b7df}}\<close>
    and [blocks]: \<open>{{Q_raw_pread_aligned_addr_0x1b7b7_75}} \<box>raw_pread_aligned_acode {{P_0x1b7bc_76;M_0x1b7b7}}\<close>
    and [blocks]: \<open>{{Q_memcpy_addr_0x1b7df_79}} \<box>memcpy_acode {{P_0x1b7e4_80;M_0x1b7df}}\<close>
    and [blocks]: \<open>{{Q_raw_pread_aligned_addr_0x1b702_87}} \<box>raw_pread_aligned_acode {{P_0x1b707_88;M_0x1b702}}\<close>
<<<<<<< HEAD
    and [blocks]: \<open>{{Q_rep_movs_ESRDI_DSRSI_addr_0x1b887_92}} \<box>rep_movs_ESRDI_DSRSI_acode {{P_0x1b88a_100;M_0x1b887}}\<close>
  shows \<open>{{?P}} raw_pread_acode {{?Q;?M}}\<close>
  apply (vcg acode: raw_pread_acode_def assms: assms)
  apply (vcg_while "P_0x1b794_9 || P_0x1b7f6_18 || P_0x1b70a_19")
  apply (simp add: assms)[1]
  apply simp
  apply (vcg_step assms: assms)+
  apply (auto simp add: pred_logic Ps Qs assms)[1]
  apply (rule htriples)+
  apply simp
  apply (vcg_step assms: assms)+                  
  apply (vcg_while "P_0x1b794_23 || P_0x1b7f6_32 || P_0x1b70a_33")
  apply (simp add: assms)[1]
  apply simp
  apply (vcg_step assms: assms)+
  apply (auto simp add: pred_logic Ps Qs assms)[1]
  apply (rule htriples)+
  apply simp
  apply (vcg_step assms: assms)+
  apply (vcg_while "P_0x1b790_59 || P_0x1b7f6_69 || P_0x1b70a_70")
  apply (simp add: assms)[1]
  apply simp
  apply (vcg_step assms: assms)+
  apply (auto simp add: pred_logic Ps Qs assms)[1]
  apply (rule htriples)+
  apply simp
  apply (vcg_step assms: assms)+
  apply (vcg_while "P_0x1b790_73 || P_0x1b7f6_83 || P_0x1b70a_84")
  apply (simp add: assms)[1]
  apply simp
  apply (vcg_step assms: assms)+
  apply (auto simp add: pred_logic Ps Qs assms)[1]
  apply (rule htriples)+
  apply simp
  apply (vcg_step assms: assms)+
  done

end
=======
    and [blocks]: \<open>{{Q_rep_movs_ESRDI_DSRSI_addr_0x1b887_92}} \<box>rep_movs_ESRDI_DSRSI_acode {{P_0x1b88a_100;M_0x1b887}}\<close> (* originally _93, generation bug *)
  shows \<open>{{?P}} raw_pread_acode {{?Q;?M}}\<close>
  apply (vcg acode: raw_pread_acode_def assms: assms)
              apply (vcg_while \<open>P_0x1b794_9 || P_0x1b7f6_18 || P_0x1b70a_19\<close> assms: assms)
                     apply (vcg_while \<open>P_0x1b794_23 || P_0x1b7f6_32 || P_0x1b70a_33\<close> assms: assms)
                      apply (vcg_while \<open>P_0x1b790_59 || P_0x1b7f6_69 || P_0x1b70a_70\<close> assms: assms)
                      apply (vcg_while \<open>P_0x1b790_73 || P_0x1b7f6_83 || P_0x1b70a_84\<close> assms: assms)
  done

end

end
>>>>>>> 720d01f42871b7fc47452cfc4b6d3c3cb0d6693e