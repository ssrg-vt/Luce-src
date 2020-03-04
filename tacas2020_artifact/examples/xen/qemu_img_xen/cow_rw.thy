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
theory cow_rw
  imports "../../../isabelle/VCG/HTriple"
begin

locale "qemu_img_xen" = execution_context + exec_code +
  fixes lseek64_0x5ba7_retval\<^sub>v write_0x5bb4_retval\<^sub>v bdrv_read_0x5d4d_retval\<^sub>v memset_0x5db5_retval\<^sub>v lseek64_0x5dd7_retval\<^sub>v qemu_read_ok_0x5df2_retval\<^sub>v bdrv_read_addr lseek64_addr memset_addr qemu_read_ok_addr write_addr :: \<open>64 word\<close>
    and bdrv_read_acode lseek64_acode memset_acode qemu_read_ok_acode write_acode :: ACode
  assumes fetch:
    "fetch 0x5b80 \<equiv> (Unary (IS_8088 Push) (Storage (Reg (General SixtyFour r14))), 2)"
    "fetch 0x5b82 \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour r14)) (Storage (Reg (General SixtyFour rsi))), 3)"
    "fetch 0x5b85 \<equiv> (Binary (IS_8088 Shl) (Reg (General SixtyFour rsi)) (Immediate SixtyFour (ImmVal 9)), 4)"
    "fetch 0x5b89 \<equiv> (Unary (IS_8088 Push) (Storage (Reg (General SixtyFour r13))), 2)"
    "fetch 0x5b8b \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour r13)) (Storage (Reg (General SixtyFour rdx))), 3)"
    "fetch 0x5b8e \<equiv> (Binary (IS_8088 Xor) (Reg (General ThirtyTwo rdx)) (Storage (Reg (General ThirtyTwo rdx))), 2)"
    "fetch 0x5b90 \<equiv> (Unary (IS_8088 Push) (Storage (Reg (General SixtyFour r12))), 2)"
    "fetch 0x5b92 \<equiv> (Unary (IS_8088 Push) (Storage (Reg (General SixtyFour rbp))), 1)"
    "fetch 0x5b93 \<equiv> (Binary (IS_8088 Mov) (Reg (General ThirtyTwo rbp)) (Storage (Reg (General ThirtyTwo rcx))), 2)"
    "fetch 0x5b95 \<equiv> (Unary (IS_8088 Push) (Storage (Reg (General SixtyFour rbx))), 1)"
    "fetch 0x5b96 \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour rbx)) (Storage (Memory SixtyFour (A_SizeDirective 64 (A_Plus (A_FromReg (General SixtyFour rdi)) (A_WordConstant 64))))), 4)"
    "fetch 0x5b9a \<equiv> (Binary (IS_8088 Mov) (Reg (General ThirtyTwo r12)) (Storage (Reg (General ThirtyTwo rbp))), 3)"
    "fetch 0x5b9d \<equiv> (Binary (IS_8088 Shl) (Reg (General ThirtyTwo r12)) (Immediate SixtyFour (ImmVal 9)), 4)"
    "fetch 0x5ba1 \<equiv> (Binary (IS_8088 Mov) (Reg (General ThirtyTwo rdi)) (Storage (Memory ThirtyTwo (A_SizeDirective 32 (A_FromReg (General SixtyFour rbx))))), 2)"
    "fetch 0x5ba3 \<equiv> (Binary (IS_8088 Add) (Reg (General SixtyFour rsi)) (Storage (Memory SixtyFour (A_SizeDirective 64 (A_Plus (A_FromReg (General SixtyFour rbx)) (A_WordConstant 32))))), 4)"
    "fetch 0x5ba7 \<equiv> (Unary (IS_8088 Call) (Immediate SixtyFour (ImmLabel ''lseek64'')), 5)"
    "fetch 0x5bac \<equiv> (Binary (IS_8088 Mov) (Reg (General ThirtyTwo rdi)) (Storage (Memory ThirtyTwo (A_SizeDirective 32 (A_FromReg (General SixtyFour rbx))))), 2)"
    "fetch 0x5bae \<equiv> (Binary (IS_X86_64 Movsxd) (Reg (General SixtyFour rdx)) (Storage (Reg (General ThirtyTwo r12))), 3)"
    "fetch 0x5bb1 \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour rsi)) (Storage (Reg (General SixtyFour r13))), 3)"
    "fetch 0x5bb4 \<equiv> (Unary (IS_8088 Call) (Immediate SixtyFour (ImmLabel ''write'')), 5)"
    "fetch 0x5bb9 \<equiv> (Binary (IS_8088 Cmp) (Reg (General ThirtyTwo r12)) (Storage (Reg (General ThirtyTwo rax))), 3)"
    "fetch 0x5bbc \<equiv> (Unary (IS_8088 Jne) (Immediate SixtyFour (ImmVal 23578)), 2)"
    "fetch 0x5bbe \<equiv> (Binary (IS_8088 Test) (Reg (General ThirtyTwo rbp)) (Storage (Reg (General ThirtyTwo rbp))), 2)"
    "fetch 0x5bc0 \<equiv> (Unary (IS_8088 Jle) (Immediate SixtyFour (ImmVal 23567)), 2)"
    "fetch 0x5bc2 \<equiv> (Binary (IS_8088 Lea) (Reg (General ThirtyTwo rax)) (Storage (Memory SixtyFour (A_Minus (A_FromReg (General SixtyFour rbp)) (A_WordConstant 1)))), 3)"
    "fetch 0x5bc5 \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour rsi)) (Storage (Reg (General SixtyFour r14))), 3)"
    "fetch 0x5bc8 \<equiv> (Binary (IS_8088 Mov) (Reg (General ThirtyTwo rdi)) (Immediate SixtyFour (ImmVal 1)), 5)"
    "fetch 0x5bcd \<equiv> (Binary (IS_8088 Lea) (Reg (General SixtyFour r8)) (Storage (Memory SixtyFour (A_Plus (A_FromReg (General SixtyFour r14)) (A_Plus (A_Mult 1 (A_FromReg (General SixtyFour rax))) (A_WordConstant 1))))), 5)"
    "fetch 0x5bd2 \<equiv> (Unary (IS_8088 Nop) (Storage (Memory Sixteen (A_SizeDirective 16 (A_Plus (A_FromReg (General SixtyFour rax)) (A_Plus (A_Mult 1 (A_FromReg (General SixtyFour rax))) (A_WordConstant 0)))))), 6)"
    "fetch 0x5bd8 \<equiv> (Binary (IS_8088 Test) (Reg (General SixtyFour rsi)) (Storage (Reg (General SixtyFour rsi))), 3)"
    "fetch 0x5bdb \<equiv> (Binary (IS_8088 Lea) (Reg (General SixtyFour rax)) (Storage (Memory SixtyFour (A_Plus (A_FromReg (General SixtyFour rsi)) (A_WordConstant 7)))), 4)"
    "fetch 0x5bdf \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour rdx)) (Storage (Reg (General SixtyFour rsi))), 3)"
    "fetch 0x5be2 \<equiv> (Binary (IS_PentiumPro Cmovns) (Reg (General SixtyFour rax)) (Storage (Reg (General SixtyFour rsi))), 4)"
    "fetch 0x5be6 \<equiv> (Binary (IS_8088 Sar) (Reg (General SixtyFour rdx)) (Immediate SixtyFour (ImmVal 63)), 4)"
    "fetch 0x5bea \<equiv> (Binary (IS_8088 Shr) (Reg (General SixtyFour rdx)) (Immediate SixtyFour (ImmVal 61)), 4)"
    "fetch 0x5bee \<equiv> (Binary (IS_8088 Lea) (Reg (General SixtyFour rcx)) (Storage (Memory SixtyFour (A_Plus (A_FromReg (General SixtyFour rsi)) (A_Mult 1 (A_FromReg (General SixtyFour rdx)))))), 4)"
    "fetch 0x5bf2 \<equiv> (Binary (IS_8088 Sar) (Reg (General SixtyFour rax)) (Immediate SixtyFour (ImmVal 3)), 4)"
    "fetch 0x5bf6 \<equiv> (Binary (IS_8088 Add) (Reg (General SixtyFour rsi)) (Immediate SixtyFour (ImmVal 1)), 4)"
    "fetch 0x5bfa \<equiv> (Binary (IS_8088 Add) (Reg (General SixtyFour rax)) (Storage (Memory SixtyFour (A_SizeDirective 64 (A_Plus (A_FromReg (General SixtyFour rbx)) (A_WordConstant 8))))), 4)"
    "fetch 0x5bfe \<equiv> (Binary (IS_8088 And) (Reg (General ThirtyTwo rcx)) (Immediate SixtyFour (ImmVal 7)), 3)"
    "fetch 0x5c01 \<equiv> (Binary (IS_8088 Sub) (Reg (General SixtyFour rcx)) (Storage (Reg (General SixtyFour rdx))), 3)"
    "fetch 0x5c04 \<equiv> (Binary (IS_8088 Mov) (Reg (General ThirtyTwo rdx)) (Storage (Reg (General ThirtyTwo rdi))), 2)"
    "fetch 0x5c06 \<equiv> (Binary (IS_8088 Shl) (Reg (General ThirtyTwo rdx)) (Storage (Reg (General Eight rcx))), 2)"
    "fetch 0x5c08 \<equiv> (Binary (IS_8088 Or) (Memory Eight (A_SizeDirective 8 (A_FromReg (General SixtyFour rax)))) (Storage (Reg (General Eight rdx))), 2)"
    "fetch 0x5c0a \<equiv> (Binary (IS_8088 Cmp) (Reg (General SixtyFour r8)) (Storage (Reg (General SixtyFour rsi))), 3)"
    "fetch 0x5c0d \<equiv> (Unary (IS_8088 Jne) (Immediate SixtyFour (ImmVal 23512)), 2)"
    "fetch 0x5c0f \<equiv> (Binary (IS_8088 Xor) (Reg (General ThirtyTwo rax)) (Storage (Reg (General ThirtyTwo rax))), 2)"
    "fetch 0x5c11 \<equiv> (Unary (IS_8088 Pop) (Storage (Reg (General SixtyFour rbx))), 1)"
    "fetch 0x5c12 \<equiv> (Unary (IS_8088 Pop) (Storage (Reg (General SixtyFour rbp))), 1)"
    "fetch 0x5c13 \<equiv> (Unary (IS_8088 Pop) (Storage (Reg (General SixtyFour r12))), 2)"
    "fetch 0x5c15 \<equiv> (Unary (IS_8088 Pop) (Storage (Reg (General SixtyFour r13))), 2)"
    "fetch 0x5c17 \<equiv> (Unary (IS_8088 Pop) (Storage (Reg (General SixtyFour r14))), 2)"
    "fetch 0x5c19 \<equiv> (Nullary (IS_8088 Ret), 1)"
    "fetch 0x5c1a \<equiv> (Binary (IS_8088 Mov) (Reg (General ThirtyTwo rax)) (Immediate SixtyFour (ImmVal 4294967295)), 5)"
    "fetch 0x5c1f \<equiv> (Unary (IS_8088 Jmp) (Immediate SixtyFour (ImmVal 23569)), 2)"
    "fetch 0x5c21 \<equiv> (Unary (IS_8088 Nop) (Storage (Memory Sixteen (A_SizeDirective 16 (A_Plus (A_FromReg (General SixtyFour cs)) (A_Plus (A_FromReg (General SixtyFour rax)) (A_Plus (A_Mult 1 (A_FromReg (General SixtyFour rax))) (A_WordConstant 0))))))), 11)"
    "fetch 0x5c30 \<equiv> (Unary (IS_8088 Push) (Storage (Reg (General SixtyFour r15))), 2)"
    "fetch 0x5c32 \<equiv> (Unary (IS_8088 Push) (Storage (Reg (General SixtyFour r14))), 2)"
    "fetch 0x5c34 \<equiv> (Unary (IS_8088 Push) (Storage (Reg (General SixtyFour r13))), 2)"
    "fetch 0x5c36 \<equiv> (Unary (IS_8088 Push) (Storage (Reg (General SixtyFour r12))), 2)"
    "fetch 0x5c38 \<equiv> (Unary (IS_8088 Push) (Storage (Reg (General SixtyFour rbp))), 1)"
    "fetch 0x5c39 \<equiv> (Unary (IS_8088 Push) (Storage (Reg (General SixtyFour rbx))), 1)"
    "fetch 0x5c3a \<equiv> (Binary (IS_8088 Sub) (Reg (General SixtyFour rsp)) (Immediate SixtyFour (ImmVal 24)), 4)"
    "fetch 0x5c3e \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour rbx)) (Storage (Memory SixtyFour (A_SizeDirective 64 (A_Plus (A_FromReg (General SixtyFour rdi)) (A_WordConstant 64))))), 4)"
    "fetch 0x5c42 \<equiv> (Binary (IS_8088 Test) (Reg (General ThirtyTwo rcx)) (Storage (Reg (General ThirtyTwo rcx))), 2)"
    "fetch 0x5c44 \<equiv> (Unary (IS_8088 Jle) (Immediate SixtyFour (ImmVal 23928)), 6)"
    "fetch 0x5c4a \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour rbp)) (Storage (Reg (General SixtyFour rdi))), 3)"
    "fetch 0x5c4d \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour r14)) (Storage (Reg (General SixtyFour rsi))), 3)"
    "fetch 0x5c50 \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour r15)) (Storage (Reg (General SixtyFour rdx))), 3)"
    "fetch 0x5c53 \<equiv> (Binary (IS_8088 Mov) (Reg (General ThirtyTwo r13)) (Storage (Reg (General ThirtyTwo rcx))), 3)"
    "fetch 0x5c56 \<equiv> (Unary (IS_8088 Nop) (Storage (Memory Sixteen (A_SizeDirective 16 (A_Plus (A_FromReg (General SixtyFour cs)) (A_Plus (A_FromReg (General SixtyFour rax)) (A_Plus (A_Mult 1 (A_FromReg (General SixtyFour rax))) (A_WordConstant 0))))))), 10)"
    "fetch 0x5c60 \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour rdi)) (Storage (Memory SixtyFour (A_SizeDirective 64 (A_Plus (A_FromReg (General SixtyFour rbx)) (A_WordConstant 8))))), 4)"
    "fetch 0x5c64 \<equiv> (Binary (IS_8088 Test) (Reg (General SixtyFour rdi)) (Storage (Reg (General SixtyFour rdi))), 3)"
    "fetch 0x5c67 \<equiv> (Unary (IS_8088 Je) (Immediate SixtyFour (ImmVal 23952)), 6)"
    "fetch 0x5c6d \<equiv> (Binary (IS_8088 Test) (Reg (General SixtyFour r14)) (Storage (Reg (General SixtyFour r14))), 3)"
    "fetch 0x5c70 \<equiv> (Binary (IS_8088 Lea) (Reg (General SixtyFour rax)) (Storage (Memory SixtyFour (A_Plus (A_FromReg (General SixtyFour r14)) (A_WordConstant 7)))), 4)"
    "fetch 0x5c74 \<equiv> (Binary (IS_PentiumPro Cmovns) (Reg (General SixtyFour rax)) (Storage (Reg (General SixtyFour r14))), 4)"
    "fetch 0x5c78 \<equiv> (Binary (IS_8088 Sar) (Reg (General SixtyFour rax)) (Immediate SixtyFour (ImmVal 3)), 4)"
    "fetch 0x5c7c \<equiv> (Binary (IS_80386 Movzx) (Reg (General ThirtyTwo rsi)) (Storage (Memory Eight (A_SizeDirective 8 (A_Plus (A_FromReg (General SixtyFour rdi)) (A_Mult 1 (A_FromReg (General SixtyFour rax))))))), 4)"
    "fetch 0x5c80 \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour rax)) (Storage (Reg (General SixtyFour r14))), 3)"
    "fetch 0x5c83 \<equiv> (Binary (IS_8088 Sar) (Reg (General SixtyFour rax)) (Immediate SixtyFour (ImmVal 63)), 4)"
    "fetch 0x5c87 \<equiv> (Binary (IS_8088 Shr) (Reg (General SixtyFour rax)) (Immediate SixtyFour (ImmVal 61)), 4)"
    "fetch 0x5c8b \<equiv> (Binary (IS_8088 Lea) (Reg (General SixtyFour rcx)) (Storage (Memory SixtyFour (A_Plus (A_FromReg (General SixtyFour r14)) (A_Mult 1 (A_FromReg (General SixtyFour rax)))))), 4)"
    "fetch 0x5c8f \<equiv> (Binary (IS_8088 And) (Reg (General ThirtyTwo rcx)) (Immediate SixtyFour (ImmVal 7)), 3)"
    "fetch 0x5c92 \<equiv> (Binary (IS_8088 Sub) (Reg (General SixtyFour rcx)) (Storage (Reg (General SixtyFour rax))), 3)"
    "fetch 0x5c95 \<equiv> (Binary (IS_8088 Sar) (Reg (General ThirtyTwo rsi)) (Storage (Reg (General Eight rcx))), 2)"
    "fetch 0x5c97 \<equiv> (Binary (IS_8088 And) (Reg (General ThirtyTwo rsi)) (Immediate SixtyFour (ImmVal 1)), 3)"
    "fetch 0x5c9a \<equiv> (Binary (IS_8088 Cmp) (Reg (General ThirtyTwo r13)) (Immediate SixtyFour (ImmVal 1)), 4)"
    "fetch 0x5c9e \<equiv> (Unary (IS_8088 Je) (Immediate SixtyFour (ImmVal 24096)), 6)"
    "fetch 0x5ca4 \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour rax)) (Storage (Reg (General SixtyFour r14))), 3)"
    "fetch 0x5ca7 \<equiv> (Binary (IS_8088 Lea) (Reg (General SixtyFour rdx)) (Storage (Memory SixtyFour (A_Plus (A_FromReg (General SixtyFour r14)) (A_WordConstant 8)))), 4)"
    "fetch 0x5cab \<equiv> (Binary (IS_8088 Add) (Reg (General SixtyFour rax)) (Immediate SixtyFour (ImmVal 1)), 4)"
    "fetch 0x5caf \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour r8)) (Storage (Reg (General SixtyFour rax))), 3)"
    "fetch 0x5cb2 \<equiv> (Binary (IS_PentiumPro Cmovns) (Reg (General SixtyFour rdx)) (Storage (Reg (General SixtyFour rax))), 4)"
    "fetch 0x5cb6 \<equiv> (Binary (IS_8088 Sar) (Reg (General SixtyFour r8)) (Immediate SixtyFour (ImmVal 63)), 4)"
    "fetch 0x5cba \<equiv> (Binary (IS_8088 Shr) (Reg (General SixtyFour r8)) (Immediate SixtyFour (ImmVal 61)), 4)"
    "fetch 0x5cbe \<equiv> (Binary (IS_8088 Sar) (Reg (General SixtyFour rdx)) (Immediate SixtyFour (ImmVal 3)), 4)"
    "fetch 0x5cc2 \<equiv> (Binary (IS_8088 Lea) (Reg (General SixtyFour rcx)) (Storage (Memory SixtyFour (A_Plus (A_FromReg (General SixtyFour rax)) (A_Mult 1 (A_FromReg (General SixtyFour r8)))))), 4)"
    "fetch 0x5cc6 \<equiv> (Binary (IS_80386 Movzx) (Reg (General ThirtyTwo rdx)) (Storage (Memory Eight (A_SizeDirective 8 (A_Plus (A_FromReg (General SixtyFour rdi)) (A_Mult 1 (A_FromReg (General SixtyFour rdx))))))), 4)"
    "fetch 0x5cca \<equiv> (Binary (IS_8088 And) (Reg (General ThirtyTwo rcx)) (Immediate SixtyFour (ImmVal 7)), 3)"
    "fetch 0x5ccd \<equiv> (Binary (IS_8088 Sub) (Reg (General SixtyFour rcx)) (Storage (Reg (General SixtyFour r8))), 3)"
    "fetch 0x5cd0 \<equiv> (Binary (IS_8088 Sar) (Reg (General ThirtyTwo rdx)) (Storage (Reg (General Eight rcx))), 2)"
    "fetch 0x5cd2 \<equiv> (Binary (IS_8088 And) (Reg (General ThirtyTwo rdx)) (Immediate SixtyFour (ImmVal 1)), 3)"
    "fetch 0x5cd5 \<equiv> (Binary (IS_8088 Cmp) (Reg (General ThirtyTwo rdx)) (Storage (Reg (General ThirtyTwo rsi))), 2)"
    "fetch 0x5cd7 \<equiv> (Unary (IS_8088 Jne) (Immediate SixtyFour (ImmVal 24096)), 6)"
    "fetch 0x5cdd \<equiv> (Binary (IS_8088 Lea) (Reg (General SixtyFour rdx)) (Storage (Memory SixtyFour (A_Plus (A_FromReg (General SixtyFour r14)) (A_WordConstant 2)))), 4)"
    "fetch 0x5ce1 \<equiv> (Binary (IS_8088 Mov) (Reg (General ThirtyTwo r12)) (Immediate SixtyFour (ImmVal 1)), 6)"
    "fetch 0x5ce7 \<equiv> (Unary (IS_8088 Jmp) (Immediate SixtyFour (ImmVal 23847)), 2)"
    "fetch 0x5ce9 \<equiv> (Unary (IS_8088 Nop) (Storage (Memory ThirtyTwo (A_SizeDirective 32 (A_Plus (A_FromReg (General SixtyFour rax)) (A_WordConstant 0))))), 7)"
    "fetch 0x5cf0 \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour rcx)) (Storage (Reg (General SixtyFour rdx))), 3)"
    "fetch 0x5cf3 \<equiv> (Binary (IS_8088 Add) (Reg (General SixtyFour rdx)) (Immediate SixtyFour (ImmVal 1)), 4)"
    "fetch 0x5cf7 \<equiv> (Binary (IS_8088 Lea) (Reg (General SixtyFour rax)) (Storage (Memory SixtyFour (A_Plus (A_FromReg (General SixtyFour rcx)) (A_WordConstant 7)))), 4)"
    "fetch 0x5cfb \<equiv> (Binary (IS_8088 Test) (Reg (General SixtyFour rcx)) (Storage (Reg (General SixtyFour rcx))), 3)"
    "fetch 0x5cfe \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour r8)) (Storage (Reg (General SixtyFour rcx))), 3)"
    "fetch 0x5d01 \<equiv> (Binary (IS_PentiumPro Cmovns) (Reg (General SixtyFour rax)) (Storage (Reg (General SixtyFour rcx))), 4)"
    "fetch 0x5d05 \<equiv> (Binary (IS_8088 Sar) (Reg (General SixtyFour r8)) (Immediate SixtyFour (ImmVal 63)), 4)"
    "fetch 0x5d09 \<equiv> (Binary (IS_8088 Shr) (Reg (General SixtyFour r8)) (Immediate SixtyFour (ImmVal 61)), 4)"
    "fetch 0x5d0d \<equiv> (Binary (IS_8088 Sar) (Reg (General SixtyFour rax)) (Immediate SixtyFour (ImmVal 3)), 4)"
    "fetch 0x5d11 \<equiv> (Binary (IS_8088 Add) (Reg (General SixtyFour rcx)) (Storage (Reg (General SixtyFour r8))), 3)"
    "fetch 0x5d14 \<equiv> (Binary (IS_80386 Movzx) (Reg (General ThirtyTwo rax)) (Storage (Memory Eight (A_SizeDirective 8 (A_Plus (A_FromReg (General SixtyFour rdi)) (A_Mult 1 (A_FromReg (General SixtyFour rax))))))), 4)"
    "fetch 0x5d18 \<equiv> (Binary (IS_8088 And) (Reg (General ThirtyTwo rcx)) (Immediate SixtyFour (ImmVal 7)), 3)"
    "fetch 0x5d1b \<equiv> (Binary (IS_8088 Sub) (Reg (General SixtyFour rcx)) (Storage (Reg (General SixtyFour r8))), 3)"
    "fetch 0x5d1e \<equiv> (Binary (IS_8088 Sar) (Reg (General ThirtyTwo rax)) (Storage (Reg (General Eight rcx))), 2)"
    "fetch 0x5d20 \<equiv> (Binary (IS_8088 And) (Reg (General ThirtyTwo rax)) (Immediate SixtyFour (ImmVal 1)), 3)"
    "fetch 0x5d23 \<equiv> (Binary (IS_8088 Cmp) (Reg (General ThirtyTwo rsi)) (Storage (Reg (General ThirtyTwo rax))), 2)"
    "fetch 0x5d25 \<equiv> (Unary (IS_8088 Jne) (Immediate SixtyFour (ImmVal 23856)), 2)"
    "fetch 0x5d27 \<equiv> (Binary (IS_8088 Add) (Reg (General ThirtyTwo r12)) (Immediate SixtyFour (ImmVal 1)), 4)"
    "fetch 0x5d2b \<equiv> (Binary (IS_8088 Cmp) (Reg (General ThirtyTwo r12)) (Storage (Reg (General ThirtyTwo r13))), 3)"
    "fetch 0x5d2e \<equiv> (Unary (IS_8088 Jne) (Immediate SixtyFour (ImmVal 23792)), 2)"
    "fetch 0x5d30 \<equiv> (Binary (IS_8088 Test) (Reg (General ThirtyTwo rsi)) (Storage (Reg (General ThirtyTwo rsi))), 2)"
    "fetch 0x5d32 \<equiv> (Unary (IS_8088 Jne) (Immediate SixtyFour (ImmVal 24008)), 6)"
    "fetch 0x5d38 \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour rdi)) (Storage (Memory SixtyFour (A_SizeDirective 64 (A_Plus (A_FromReg (General SixtyFour rbp)) (A_WordConstant 2128))))), 7)"
    "fetch 0x5d3f \<equiv> (Binary (IS_8088 Mov) (Reg (General ThirtyTwo rcx)) (Storage (Reg (General ThirtyTwo r12))), 3)"
    "fetch 0x5d42 \<equiv> (Binary (IS_8088 Test) (Reg (General SixtyFour rdi)) (Storage (Reg (General SixtyFour rdi))), 3)"
    "fetch 0x5d45 \<equiv> (Unary (IS_8088 Je) (Immediate SixtyFour (ImmVal 23970)), 2)"
    "fetch 0x5d47 \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour rdx)) (Storage (Reg (General SixtyFour r15))), 3)"
    "fetch 0x5d4a \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour rsi)) (Storage (Reg (General SixtyFour r14))), 3)"
    "fetch 0x5d4d \<equiv> (Unary (IS_8088 Call) (Immediate SixtyFour (ImmLabel ''bdrv_read'')), 5)"
    "fetch 0x5d52 \<equiv> (Binary (IS_8088 Test) (Reg (General ThirtyTwo rax)) (Storage (Reg (General ThirtyTwo rax))), 2)"
    "fetch 0x5d54 \<equiv> (Unary (IS_8088 Js) (Immediate SixtyFour (ImmVal 24068)), 6)"
    "fetch 0x5d5a \<equiv> (Binary (IS_8088 Mov) (Reg (General ThirtyTwo rcx)) (Storage (Reg (General ThirtyTwo r12))), 3)"
    "fetch 0x5d5d \<equiv> (Binary (IS_8088 Shl) (Reg (General ThirtyTwo rcx)) (Immediate SixtyFour (ImmVal 9)), 3)"
    "fetch 0x5d60 \<equiv> (Binary (IS_X86_64 Movsxd) (Reg (General SixtyFour rcx)) (Storage (Reg (General ThirtyTwo rcx))), 3)"
    "fetch 0x5d63 \<equiv> (Binary (IS_8088 Sub) (Reg (General ThirtyTwo r13)) (Storage (Reg (General ThirtyTwo r12))), 3)"
    "fetch 0x5d66 \<equiv> (Binary (IS_X86_64 Movsxd) (Reg (General SixtyFour r12)) (Storage (Reg (General ThirtyTwo r12))), 3)"
    "fetch 0x5d69 \<equiv> (Binary (IS_8088 Add) (Reg (General SixtyFour r15)) (Storage (Reg (General SixtyFour rcx))), 3)"
    "fetch 0x5d6c \<equiv> (Binary (IS_8088 Add) (Reg (General SixtyFour r14)) (Storage (Reg (General SixtyFour r12))), 3)"
    "fetch 0x5d6f \<equiv> (Binary (IS_8088 Test) (Reg (General ThirtyTwo r13)) (Storage (Reg (General ThirtyTwo r13))), 3)"
    "fetch 0x5d72 \<equiv> (Unary (IS_8088 Jg) (Immediate SixtyFour (ImmVal 23648)), 6)"
    "fetch 0x5d78 \<equiv> (Binary (IS_8088 Add) (Reg (General SixtyFour rsp)) (Immediate SixtyFour (ImmVal 24)), 4)"
    "fetch 0x5d7c \<equiv> (Binary (IS_8088 Xor) (Reg (General ThirtyTwo rax)) (Storage (Reg (General ThirtyTwo rax))), 2)"
    "fetch 0x5d7e \<equiv> (Unary (IS_8088 Pop) (Storage (Reg (General SixtyFour rbx))), 1)"
    "fetch 0x5d7f \<equiv> (Unary (IS_8088 Pop) (Storage (Reg (General SixtyFour rbp))), 1)"
    "fetch 0x5d80 \<equiv> (Unary (IS_8088 Pop) (Storage (Reg (General SixtyFour r12))), 2)"
    "fetch 0x5d82 \<equiv> (Unary (IS_8088 Pop) (Storage (Reg (General SixtyFour r13))), 2)"
    "fetch 0x5d84 \<equiv> (Unary (IS_8088 Pop) (Storage (Reg (General SixtyFour r14))), 2)"
    "fetch 0x5d86 \<equiv> (Unary (IS_8088 Pop) (Storage (Reg (General SixtyFour r15))), 2)"
    "fetch 0x5d88 \<equiv> (Nullary (IS_8088 Ret), 1)"
    "fetch 0x5d89 \<equiv> (Unary (IS_8088 Nop) (Storage (Memory ThirtyTwo (A_SizeDirective 32 (A_Plus (A_FromReg (General SixtyFour rax)) (A_WordConstant 0))))), 7)"
    "fetch 0x5d90 \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour rdi)) (Storage (Memory SixtyFour (A_SizeDirective 64 (A_Plus (A_FromReg (General SixtyFour rbp)) (A_WordConstant 2128))))), 7)"
    "fetch 0x5d97 \<equiv> (Binary (IS_8088 Mov) (Reg (General ThirtyTwo r12)) (Storage (Reg (General ThirtyTwo r13))), 3)"
    "fetch 0x5d9a \<equiv> (Binary (IS_8088 Mov) (Reg (General ThirtyTwo rcx)) (Storage (Reg (General ThirtyTwo r12))), 3)"
    "fetch 0x5d9d \<equiv> (Binary (IS_8088 Test) (Reg (General SixtyFour rdi)) (Storage (Reg (General SixtyFour rdi))), 3)"
    "fetch 0x5da0 \<equiv> (Unary (IS_8088 Jne) (Immediate SixtyFour (ImmVal 23879)), 2)"
    "fetch 0x5da2 \<equiv> (Binary (IS_8088 Shl) (Reg (General ThirtyTwo rcx)) (Immediate SixtyFour (ImmVal 9)), 3)"
    "fetch 0x5da5 \<equiv> (Binary (IS_8088 Xor) (Reg (General ThirtyTwo rsi)) (Storage (Reg (General ThirtyTwo rsi))), 2)"
    "fetch 0x5da7 \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour rdi)) (Storage (Reg (General SixtyFour r15))), 3)"
    "fetch 0x5daa \<equiv> (Binary (IS_X86_64 Movsxd) (Reg (General SixtyFour rcx)) (Storage (Reg (General ThirtyTwo rcx))), 3)"
    "fetch 0x5dad \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour rdx)) (Storage (Reg (General SixtyFour rcx))), 3)"
    "fetch 0x5db0 \<equiv> (Binary (IS_8088 Mov) (Memory SixtyFour (A_SizeDirective 64 (A_Plus (A_FromReg (General SixtyFour rsp)) (A_WordConstant 8)))) (Storage (Reg (General SixtyFour rcx))), 5)"
    "fetch 0x5db5 \<equiv> (Unary (IS_8088 Call) (Immediate SixtyFour (ImmLabel ''memset'')), 5)"
    "fetch 0x5dba \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour rcx)) (Storage (Memory SixtyFour (A_SizeDirective 64 (A_Plus (A_FromReg (General SixtyFour rsp)) (A_WordConstant 8))))), 5)"
    "fetch 0x5dbf \<equiv> (Unary (IS_8088 Jmp) (Immediate SixtyFour (ImmVal 23907)), 2)"
    "fetch 0x5dc1 \<equiv> (Unary (IS_8088 Nop) (Storage (Memory ThirtyTwo (A_SizeDirective 32 (A_Plus (A_FromReg (General SixtyFour rax)) (A_WordConstant 0))))), 7)"
    "fetch 0x5dc8 \<equiv> (Binary (IS_8088 Mov) (Reg (General ThirtyTwo rdi)) (Storage (Memory ThirtyTwo (A_SizeDirective 32 (A_FromReg (General SixtyFour rbx))))), 2)"
    "fetch 0x5dca \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour rsi)) (Storage (Reg (General SixtyFour r14))), 3)"
    "fetch 0x5dcd \<equiv> (Binary (IS_8088 Xor) (Reg (General ThirtyTwo rdx)) (Storage (Reg (General ThirtyTwo rdx))), 2)"
    "fetch 0x5dcf \<equiv> (Binary (IS_8088 Shl) (Reg (General SixtyFour rsi)) (Immediate SixtyFour (ImmVal 9)), 4)"
    "fetch 0x5dd3 \<equiv> (Binary (IS_8088 Add) (Reg (General SixtyFour rsi)) (Storage (Memory SixtyFour (A_SizeDirective 64 (A_Plus (A_FromReg (General SixtyFour rbx)) (A_WordConstant 32))))), 4)"
    "fetch 0x5dd7 \<equiv> (Unary (IS_8088 Call) (Immediate SixtyFour (ImmLabel ''lseek64'')), 5)"
    "fetch 0x5ddc \<equiv> (Binary (IS_8088 Mov) (Reg (General ThirtyTwo rcx)) (Storage (Reg (General ThirtyTwo r12))), 3)"
    "fetch 0x5ddf \<equiv> (Binary (IS_8088 Mov) (Reg (General ThirtyTwo rdi)) (Storage (Memory ThirtyTwo (A_SizeDirective 32 (A_FromReg (General SixtyFour rbx))))), 2)"
    "fetch 0x5de1 \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour rsi)) (Storage (Reg (General SixtyFour r15))), 3)"
    "fetch 0x5de4 \<equiv> (Binary (IS_8088 Shl) (Reg (General ThirtyTwo rcx)) (Immediate SixtyFour (ImmVal 9)), 3)"
    "fetch 0x5de7 \<equiv> (Binary (IS_X86_64 Movsxd) (Reg (General SixtyFour rcx)) (Storage (Reg (General ThirtyTwo rcx))), 3)"
    "fetch 0x5dea \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour rdx)) (Storage (Reg (General SixtyFour rcx))), 3)"
    "fetch 0x5ded \<equiv> (Binary (IS_8088 Mov) (Memory SixtyFour (A_SizeDirective 64 (A_Plus (A_FromReg (General SixtyFour rsp)) (A_WordConstant 8)))) (Storage (Reg (General SixtyFour rcx))), 5)"
    "fetch 0x5df2 \<equiv> (Unary (IS_8088 Call) (Immediate SixtyFour (ImmLabel ''qemu_read_ok'')), 5)"
    "fetch 0x5df7 \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour rcx)) (Storage (Memory SixtyFour (A_SizeDirective 64 (A_Plus (A_FromReg (General SixtyFour rsp)) (A_WordConstant 8))))), 5)"
    "fetch 0x5dfc \<equiv> (Binary (IS_8088 Test) (Reg (General ThirtyTwo rax)) (Storage (Reg (General ThirtyTwo rax))), 2)"
    "fetch 0x5dfe \<equiv> (Unary (IS_8088 Jns) (Immediate SixtyFour (ImmVal 23907)), 6)"
    "fetch 0x5e04 \<equiv> (Binary (IS_8088 Add) (Reg (General SixtyFour rsp)) (Immediate SixtyFour (ImmVal 24)), 4)"
    "fetch 0x5e08 \<equiv> (Binary (IS_8088 Mov) (Reg (General ThirtyTwo rax)) (Immediate SixtyFour (ImmVal 4294967295)), 5)"
    "fetch 0x5e0d \<equiv> (Unary (IS_8088 Pop) (Storage (Reg (General SixtyFour rbx))), 1)"
    "fetch 0x5e0e \<equiv> (Unary (IS_8088 Pop) (Storage (Reg (General SixtyFour rbp))), 1)"
    "fetch 0x5e0f \<equiv> (Unary (IS_8088 Pop) (Storage (Reg (General SixtyFour r12))), 2)"
    "fetch 0x5e11 \<equiv> (Unary (IS_8088 Pop) (Storage (Reg (General SixtyFour r13))), 2)"
    "fetch 0x5e13 \<equiv> (Unary (IS_8088 Pop) (Storage (Reg (General SixtyFour r14))), 2)"
    "fetch 0x5e15 \<equiv> (Unary (IS_8088 Pop) (Storage (Reg (General SixtyFour r15))), 2)"
    "fetch 0x5e17 \<equiv> (Nullary (IS_8088 Ret), 1)"
    "fetch 0x5e18 \<equiv> (Unary (IS_8088 Nop) (Storage (Memory ThirtyTwo (A_SizeDirective 32 (A_Plus (A_FromReg (General SixtyFour rax)) (A_Plus (A_Mult 1 (A_FromReg (General SixtyFour rax))) (A_WordConstant 0)))))), 8)"
    "fetch 0x5e20 \<equiv> (Binary (IS_8088 Mov) (Reg (General ThirtyTwo r12)) (Immediate SixtyFour (ImmVal 1)), 6)"
    "fetch 0x5e26 \<equiv> (Unary (IS_8088 Jmp) (Immediate SixtyFour (ImmVal 23856)), 5)"
    and \<alpha>_def: \<open>\<alpha> = \<lparr>text_sections = [], data_sections = [], labels_to_offsets = [], binary_offset = 0\<rparr>\<close>
    and bdrv_read\<^sub>a\<^sub>d\<^sub>d\<^sub>r[simp]: \<open>the (label_to_address \<alpha> ''bdrv_read'') = bdrv_read_addr\<close>
    and lseek64\<^sub>a\<^sub>d\<^sub>d\<^sub>r[simp]: \<open>the (label_to_address \<alpha> ''lseek64'') = lseek64_addr\<close>
    and memset\<^sub>a\<^sub>d\<^sub>d\<^sub>r[simp]: \<open>the (label_to_address \<alpha> ''memset'') = memset_addr\<close>
    and qemu_read_ok\<^sub>a\<^sub>d\<^sub>d\<^sub>r[simp]: \<open>the (label_to_address \<alpha> ''qemu_read_ok'') = qemu_read_ok_addr\<close>
    and write\<^sub>a\<^sub>d\<^sub>d\<^sub>r[simp]: \<open>the (label_to_address \<alpha> ''write'') = write_addr\<close>
begin

text \<open>Using definitions that don't get unfolded immediately prevents locale argument issues.\<close>
definition \<open>lseek64_0x5ba7_retval \<equiv> lseek64_0x5ba7_retval\<^sub>v\<close>
definition \<open>write_0x5bb4_retval \<equiv> write_0x5bb4_retval\<^sub>v\<close>
definition \<open>bdrv_read_0x5d4d_retval \<equiv> bdrv_read_0x5d4d_retval\<^sub>v\<close>
definition \<open>memset_0x5db5_retval \<equiv> memset_0x5db5_retval\<^sub>v\<close>
definition \<open>lseek64_0x5dd7_retval \<equiv> lseek64_0x5dd7_retval\<^sub>v\<close>
definition \<open>qemu_read_ok_0x5df2_retval \<equiv> qemu_read_ok_0x5df2_retval\<^sub>v\<close>

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

locale "cow_write" = "qemu_img_xen" +
  fixes RAX\<^sub>0\<^sub>v RBX\<^sub>0\<^sub>v RCX\<^sub>0\<^sub>v RDX\<^sub>0\<^sub>v RDI\<^sub>0\<^sub>v RSI\<^sub>0\<^sub>v RSP\<^sub>0\<^sub>v RBP\<^sub>0\<^sub>v R14\<^sub>0\<^sub>v R13\<^sub>0\<^sub>v R12\<^sub>0\<^sub>v R8\<^sub>0\<^sub>v ret_address\<^sub>v :: \<open>64 word\<close>
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
definition \<open>R8\<^sub>0 \<equiv> R8\<^sub>0\<^sub>v\<close>
definition \<open>ret_address \<equiv> ret_address\<^sub>v\<close>

definition P_0x5b80_0 :: state_pred where
  \<open>P_0x5b80_0 \<sigma> \<equiv> RIP \<sigma> = 0x5b80 \<and> RAX \<sigma> = RAX\<^sub>0 \<and> RBX \<sigma> = RBX\<^sub>0 \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = RDX\<^sub>0 \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = RSP\<^sub>0 \<and> RBP \<sigma> = RBP\<^sub>0 \<and> R14 \<sigma> = R14\<^sub>0 \<and> R13 \<sigma> = R13\<^sub>0 \<and> R12 \<sigma> = R12\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address\<close>
declare P_0x5b80_0_def[Ps]

definition P_0x5b80_0_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x5b80_0_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((RDI\<^sub>0::64 word) + 0x40), 8),
    (2, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x20), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (8, (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word), 4)
  }\<close>

definition P_0x5b80_0_regions :: state_pred where
  \<open>P_0x5b80_0_regions \<sigma> \<equiv> \<exists>regions. P_0x5b80_0_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x5ba7_0 :: state_pred where
  \<open>Q_0x5ba7_0 \<sigma> \<equiv> RIP \<sigma> = 0x5ba7 \<and> RAX \<sigma> = RAX\<^sub>0 \<and> RBX \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = 0x0 \<and> RDI \<sigma> = ucast ((\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word),4]::32 word)) \<and> RSI \<sigma> = (((RSI\<^sub>0 << 9)::64 word) + (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x20),8]::64 word)) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x28) \<and> RBP \<sigma> = ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)) \<and> R14 \<sigma> = RSI\<^sub>0 \<and> R13 \<sigma> = RDX\<^sub>0 \<and> R12 \<sigma> = ucast (((\<langle>31,0\<rangle>RCX\<^sub>0::32 word) << 9)) \<and> R8 \<sigma> = R8\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x20),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x20),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word),4]::32 word) = ucast ((\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word),4]::32 word))\<close>
declare Q_0x5ba7_0_def[Qs]

schematic_goal cow_write_0_15_0x5b80_0x5ba3_0[blocks]:
  assumes \<open>(P_0x5b80_0 && P_0x5b80_0_regions) \<sigma>\<close>
  shows \<open>exec_block 15 0x5ba3 0 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x5ba7_0 ?\<sigma> \<and> block_usage P_0x5b80_0_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x5b80_0_def P_0x5b80_0_regions_def post: Q_0x5ba7_0_def regionset: P_0x5b80_0_regions_set_def)

definition P_0x5ba7_1 :: state_pred where
  \<open>P_0x5ba7_1 \<sigma> \<equiv> RIP \<sigma> = 0x5ba7 \<and> RAX \<sigma> = RAX\<^sub>0 \<and> RBX \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = 0x0 \<and> RDI \<sigma> = ucast ((\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word),4]::32 word)) \<and> RSI \<sigma> = (((RSI\<^sub>0 << 9)::64 word) + (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x20),8]::64 word)) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x28) \<and> RBP \<sigma> = ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)) \<and> R14 \<sigma> = RSI\<^sub>0 \<and> R13 \<sigma> = RDX\<^sub>0 \<and> R12 \<sigma> = ucast (((\<langle>31,0\<rangle>RCX\<^sub>0::32 word) << 9)) \<and> R8 \<sigma> = R8\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x20),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x20),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word),4]::32 word) = ucast ((\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word),4]::32 word))\<close>
declare P_0x5ba7_1_def[Ps]

definition P_0x5ba7_1_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x5ba7_1_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((RDI\<^sub>0::64 word) + 0x40), 8),
    (2, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x20), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (9, (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word), 4)
  }\<close>

definition P_0x5ba7_1_regions :: state_pred where
  \<open>P_0x5ba7_1_regions \<sigma> \<equiv> \<exists>regions. P_0x5ba7_1_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_lseek64_addr_0x5ba7_1 :: state_pred where
  \<open>Q_lseek64_addr_0x5ba7_1 \<sigma> \<equiv> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x30) \<and> RIP \<sigma> = lseek64_addr \<and> RAX \<sigma> = RAX\<^sub>0 \<and> RBX \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = 0x0 \<and> RDI \<sigma> = ucast ((\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word),4]::32 word)) \<and> RSI \<sigma> = (((RSI\<^sub>0 << 9)::64 word) + (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x20),8]::64 word)) \<and> RBP \<sigma> = ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)) \<and> R14 \<sigma> = RSI\<^sub>0 \<and> R13 \<sigma> = RDX\<^sub>0 \<and> R12 \<sigma> = ucast (((\<langle>31,0\<rangle>RCX\<^sub>0::32 word) << 9)) \<and> R8 \<sigma> = R8\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x20),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x20),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = 0x5bac \<and> (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word),4]::32 word) = ucast ((\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word),4]::32 word))\<close>
declare Q_lseek64_addr_0x5ba7_1_def[Qs]

schematic_goal cow_write_0_1_0x5ba7_0x5ba7_1[blocks]:
  assumes \<open>(P_0x5ba7_1 && P_0x5ba7_1_regions) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x5ba7 (Suc 0) \<sigma> \<triangleq> ?\<sigma> \<and> Q_lseek64_addr_0x5ba7_1 ?\<sigma> \<and> block_usage P_0x5ba7_1_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x5ba7_1_def P_0x5ba7_1_regions_def post: Q_lseek64_addr_0x5ba7_1_def regionset: P_0x5ba7_1_regions_set_def)

definition P_0x5bac_2 :: state_pred where
  \<open>P_0x5bac_2 \<sigma> \<equiv> RIP \<sigma> = 0x5bac \<and> RAX \<sigma> = lseek64_0x5ba7_retval \<and> RBX \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = 0x0 \<and> RDI \<sigma> = ucast ((\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word),4]::32 word)) \<and> RSI \<sigma> = (((RSI\<^sub>0 << 9)::64 word) + (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x20),8]::64 word)) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x28) \<and> RBP \<sigma> = ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)) \<and> R14 \<sigma> = RSI\<^sub>0 \<and> R13 \<sigma> = RDX\<^sub>0 \<and> R12 \<sigma> = ucast (((\<langle>31,0\<rangle>RCX\<^sub>0::32 word) << 9)) \<and> R8 \<sigma> = R8\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x20),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x20),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = 0x5bac \<and> (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word),4]::32 word) = ucast ((\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word),4]::32 word))\<close>
declare P_0x5bac_2_def[Ps]

definition P_0x5bac_2_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x5bac_2_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((RDI\<^sub>0::64 word) + 0x40), 8),
    (2, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x20), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (9, (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word), 4)
  }\<close>

definition P_0x5bac_2_regions :: state_pred where
  \<open>P_0x5bac_2_regions \<sigma> \<equiv> \<exists>regions. P_0x5bac_2_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x5bb4_2 :: state_pred where
  \<open>Q_0x5bb4_2 \<sigma> \<equiv> RIP \<sigma> = 0x5bb4 \<and> RAX \<sigma> = lseek64_0x5ba7_retval \<and> RBX \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = (sextend (ucast (((\<langle>31,0\<rangle>RCX\<^sub>0::32 word) << 9))) 32 64::64 word) \<and> RDI \<sigma> = ucast ((\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word),4]::32 word)) \<and> RSI \<sigma> = RDX\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x28) \<and> RBP \<sigma> = ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)) \<and> R14 \<sigma> = RSI\<^sub>0 \<and> R13 \<sigma> = RDX\<^sub>0 \<and> R12 \<sigma> = ucast (((\<langle>31,0\<rangle>RCX\<^sub>0::32 word) << 9)) \<and> R8 \<sigma> = R8\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x20),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x20),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = 0x5bac \<and> (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word),4]::32 word) = ucast ((\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word),4]::32 word))\<close>
declare Q_0x5bb4_2_def[Qs]

schematic_goal cow_write_0_3_0x5bac_0x5bb1_2[blocks]:
  assumes \<open>(P_0x5bac_2 && P_0x5bac_2_regions) \<sigma>\<close>
  shows \<open>exec_block 3 0x5bb1 2 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x5bb4_2 ?\<sigma> \<and> block_usage P_0x5bac_2_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x5bac_2_def P_0x5bac_2_regions_def post: Q_0x5bb4_2_def regionset: P_0x5bac_2_regions_set_def)

definition P_0x5bb4_3 :: state_pred where
  \<open>P_0x5bb4_3 \<sigma> \<equiv> RIP \<sigma> = 0x5bb4 \<and> RAX \<sigma> = lseek64_0x5ba7_retval \<and> RBX \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = (sextend (ucast (((\<langle>31,0\<rangle>RCX\<^sub>0::32 word) << 9))) 32 64::64 word) \<and> RDI \<sigma> = ucast ((\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word),4]::32 word)) \<and> RSI \<sigma> = RDX\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x28) \<and> RBP \<sigma> = ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)) \<and> R14 \<sigma> = RSI\<^sub>0 \<and> R13 \<sigma> = RDX\<^sub>0 \<and> R12 \<sigma> = ucast (((\<langle>31,0\<rangle>RCX\<^sub>0::32 word) << 9)) \<and> R8 \<sigma> = R8\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x20),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x20),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = 0x5bac \<and> (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word),4]::32 word) = ucast ((\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word),4]::32 word))\<close>
declare P_0x5bb4_3_def[Ps]

definition P_0x5bb4_3_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x5bb4_3_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((RDI\<^sub>0::64 word) + 0x40), 8),
    (2, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x20), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (9, (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word), 4)
  }\<close>

definition P_0x5bb4_3_regions :: state_pred where
  \<open>P_0x5bb4_3_regions \<sigma> \<equiv> \<exists>regions. P_0x5bb4_3_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_write_addr_0x5bb4_3 :: state_pred where
  \<open>Q_write_addr_0x5bb4_3 \<sigma> \<equiv> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x30) \<and> RIP \<sigma> = write_addr \<and> RAX \<sigma> = lseek64_0x5ba7_retval \<and> RBX \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = (sextend (ucast (((\<langle>31,0\<rangle>RCX\<^sub>0::32 word) << 9))) 32 64::64 word) \<and> RDI \<sigma> = ucast ((\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word),4]::32 word)) \<and> RSI \<sigma> = RDX\<^sub>0 \<and> RBP \<sigma> = ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)) \<and> R14 \<sigma> = RSI\<^sub>0 \<and> R13 \<sigma> = RDX\<^sub>0 \<and> R12 \<sigma> = ucast (((\<langle>31,0\<rangle>RCX\<^sub>0::32 word) << 9)) \<and> R8 \<sigma> = R8\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x20),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x20),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = 0x5bb9 \<and> (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word),4]::32 word) = ucast ((\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word),4]::32 word))\<close>
declare Q_write_addr_0x5bb4_3_def[Qs]

schematic_goal cow_write_0_1_0x5bb4_0x5bb4_3[blocks]:
  assumes \<open>(P_0x5bb4_3 && P_0x5bb4_3_regions) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x5bb4 3 \<sigma> \<triangleq> ?\<sigma> \<and> Q_write_addr_0x5bb4_3 ?\<sigma> \<and> block_usage P_0x5bb4_3_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x5bb4_3_def P_0x5bb4_3_regions_def post: Q_write_addr_0x5bb4_3_def regionset: P_0x5bb4_3_regions_set_def)

definition P_0x5bb9_4 :: state_pred where
  \<open>P_0x5bb9_4 \<sigma> \<equiv> RIP \<sigma> = 0x5bb9 \<and> RAX \<sigma> = write_0x5bb4_retval \<and> RBX \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = (sextend (ucast (((\<langle>31,0\<rangle>RCX\<^sub>0::32 word) << 9))) 32 64::64 word) \<and> RDI \<sigma> = ucast ((\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word),4]::32 word)) \<and> RSI \<sigma> = RDX\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x28) \<and> RBP \<sigma> = ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)) \<and> R14 \<sigma> = RSI\<^sub>0 \<and> R13 \<sigma> = RDX\<^sub>0 \<and> R12 \<sigma> = ucast (((\<langle>31,0\<rangle>RCX\<^sub>0::32 word) << 9)) \<and> R8 \<sigma> = R8\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x20),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x20),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = 0x5bb9 \<and> (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word),4]::32 word) = ucast ((\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word),4]::32 word))\<close>
declare P_0x5bb9_4_def[Ps]

definition P_0x5bb9_4_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x5bb9_4_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((RDI\<^sub>0::64 word) + 0x40), 8),
    (2, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x20), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (9, (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word), 4)
  }\<close>

definition P_0x5bb9_4_regions :: state_pred where
  \<open>P_0x5bb9_4_regions \<sigma> \<equiv> \<exists>regions. P_0x5bb9_4_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x5bbc_4 :: state_pred where
  \<open>Q_0x5bbc_4 \<sigma> \<equiv> RIP \<sigma> = 0x5bbc \<and> RAX \<sigma> = write_0x5bb4_retval \<and> RBX \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = (sextend (ucast (((\<langle>31,0\<rangle>RCX\<^sub>0::32 word) << 9))) 32 64::64 word) \<and> RDI \<sigma> = ucast ((\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word),4]::32 word)) \<and> RSI \<sigma> = RDX\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x28) \<and> RBP \<sigma> = ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)) \<and> R14 \<sigma> = RSI\<^sub>0 \<and> R13 \<sigma> = RDX\<^sub>0 \<and> R12 \<sigma> = ucast (((\<langle>31,0\<rangle>RCX\<^sub>0::32 word) << 9)) \<and> R8 \<sigma> = R8\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x20),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x20),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = 0x5bb9 \<and> (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word),4]::32 word) = ucast ((\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word),4]::32 word))\<close>
declare Q_0x5bbc_4_def[Qs]

schematic_goal cow_write_0_1_0x5bb9_0x5bb9_4[blocks]:
  assumes \<open>(P_0x5bb9_4 && P_0x5bb9_4_regions) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x5bb9 4 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x5bbc_4 ?\<sigma> \<and> block_usage P_0x5bb9_4_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x5bb9_4_def P_0x5bb9_4_regions_def post: Q_0x5bbc_4_def regionset: P_0x5bb9_4_regions_set_def)

definition P_0x5bbc_true_5 :: state_pred where
  \<open>P_0x5bbc_true_5 \<sigma> \<equiv> RIP \<sigma> = 0x5bbc \<and> RAX \<sigma> = write_0x5bb4_retval \<and> RBX \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = (sextend (ucast (((\<langle>31,0\<rangle>RCX\<^sub>0::32 word) << 9))) 32 64::64 word) \<and> RDI \<sigma> = ucast ((\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word),4]::32 word)) \<and> RSI \<sigma> = RDX\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x28) \<and> RBP \<sigma> = ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)) \<and> R14 \<sigma> = RSI\<^sub>0 \<and> R13 \<sigma> = RDX\<^sub>0 \<and> R12 \<sigma> = ucast (((\<langle>31,0\<rangle>RCX\<^sub>0::32 word) << 9)) \<and> R8 \<sigma> = R8\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x20),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x20),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = 0x5bb9 \<and> (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word),4]::32 word) = ucast ((\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word),4]::32 word))\<close>
declare P_0x5bbc_true_5_def[Ps]

definition P_0x5bbc_true_5_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x5bbc_true_5_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((RDI\<^sub>0::64 word) + 0x40), 8),
    (2, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x20), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (9, (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word), 4)
  }\<close>

definition P_0x5bbc_true_5_regions :: state_pred where
  \<open>P_0x5bbc_true_5_regions \<sigma> \<equiv> \<exists>regions. P_0x5bbc_true_5_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x5c11_5 :: state_pred where
  \<open>Q_0x5c11_5 \<sigma> \<equiv> RIP \<sigma> = 0x5c11 \<and> RBX \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x28) \<and> RBP \<sigma> = ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)) \<and> R14 \<sigma> = RSI\<^sub>0 \<and> R13 \<sigma> = RDX\<^sub>0 \<and> R12 \<sigma> = ucast (((\<langle>31,0\<rangle>RCX\<^sub>0::32 word) << 9)) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x20),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x20),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = 0x5bb9 \<and> (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word),4]::32 word) = ucast ((\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word),4]::32 word))\<close>
declare Q_0x5c11_5_def[Qs]

schematic_goal cow_write_0_3_0x5bbc_0x5c1f_5[blocks]:
  assumes \<open>(P_0x5bbc_true_5 && P_0x5bbc_true_5_regions && !ZF) \<sigma>\<close>
  shows \<open>exec_block 3 0x5c1f 5 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x5c11_5 ?\<sigma> \<and> block_usage P_0x5bbc_true_5_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x5bbc_true_5_def P_0x5bbc_true_5_regions_def post: Q_0x5c11_5_def regionset: P_0x5bbc_true_5_regions_set_def)

definition P_0x5bbc_false_6 :: state_pred where
  \<open>P_0x5bbc_false_6 \<sigma> \<equiv> RIP \<sigma> = 0x5bbc \<and> RAX \<sigma> = write_0x5bb4_retval \<and> RBX \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = (sextend (ucast (((\<langle>31,0\<rangle>RCX\<^sub>0::32 word) << 9))) 32 64::64 word) \<and> RDI \<sigma> = ucast ((\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word),4]::32 word)) \<and> RSI \<sigma> = RDX\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x28) \<and> RBP \<sigma> = ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)) \<and> R14 \<sigma> = RSI\<^sub>0 \<and> R13 \<sigma> = RDX\<^sub>0 \<and> R12 \<sigma> = ucast (((\<langle>31,0\<rangle>RCX\<^sub>0::32 word) << 9)) \<and> R8 \<sigma> = R8\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x20),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x20),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = 0x5bb9 \<and> (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word),4]::32 word) = ucast ((\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word),4]::32 word))\<close>
declare P_0x5bbc_false_6_def[Ps]

definition P_0x5bbc_false_6_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x5bbc_false_6_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((RDI\<^sub>0::64 word) + 0x40), 8),
    (2, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x20), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (9, (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word), 4)
  }\<close>

definition P_0x5bbc_false_6_regions :: state_pred where
  \<open>P_0x5bbc_false_6_regions \<sigma> \<equiv> \<exists>regions. P_0x5bbc_false_6_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x5bc0_6 :: state_pred where
  \<open>Q_0x5bc0_6 \<sigma> \<equiv> RIP \<sigma> = 0x5bc0 \<and> RAX \<sigma> = write_0x5bb4_retval \<and> RBX \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = (sextend (ucast (((\<langle>31,0\<rangle>RCX\<^sub>0::32 word) << 9))) 32 64::64 word) \<and> RDI \<sigma> = ucast ((\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word),4]::32 word)) \<and> RSI \<sigma> = RDX\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x28) \<and> RBP \<sigma> = ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)) \<and> R14 \<sigma> = RSI\<^sub>0 \<and> R13 \<sigma> = RDX\<^sub>0 \<and> R12 \<sigma> = ucast (((\<langle>31,0\<rangle>RCX\<^sub>0::32 word) << 9)) \<and> R8 \<sigma> = R8\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x20),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x20),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = 0x5bb9 \<and> (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word),4]::32 word) = ucast ((\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word),4]::32 word))\<close>
declare Q_0x5bc0_6_def[Qs]

schematic_goal cow_write_0_2_0x5bbc_0x5bbe_6[blocks]:
  assumes \<open>(P_0x5bbc_false_6 && P_0x5bbc_false_6_regions && ! !ZF) \<sigma>\<close>
  shows \<open>exec_block 2 0x5bbe 6 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x5bc0_6 ?\<sigma> \<and> block_usage P_0x5bbc_false_6_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x5bbc_false_6_def P_0x5bbc_false_6_regions_def post: Q_0x5bc0_6_def regionset: P_0x5bbc_false_6_regions_set_def)

definition P_0x5bc0_true_7 :: state_pred where
  \<open>P_0x5bc0_true_7 \<sigma> \<equiv> RIP \<sigma> = 0x5bc0 \<and> RAX \<sigma> = write_0x5bb4_retval \<and> RBX \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = (sextend (ucast (((\<langle>31,0\<rangle>RCX\<^sub>0::32 word) << 9))) 32 64::64 word) \<and> RDI \<sigma> = ucast ((\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word),4]::32 word)) \<and> RSI \<sigma> = RDX\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x28) \<and> RBP \<sigma> = ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)) \<and> R14 \<sigma> = RSI\<^sub>0 \<and> R13 \<sigma> = RDX\<^sub>0 \<and> R12 \<sigma> = ucast (((\<langle>31,0\<rangle>RCX\<^sub>0::32 word) << 9)) \<and> R8 \<sigma> = R8\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x20),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x20),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = 0x5bb9 \<and> (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word),4]::32 word) = ucast ((\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word),4]::32 word))\<close>
declare P_0x5bc0_true_7_def[Ps]

definition P_0x5bc0_true_7_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x5bc0_true_7_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((RDI\<^sub>0::64 word) + 0x40), 8),
    (2, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x20), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (9, (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word), 4)
  }\<close>

definition P_0x5bc0_true_7_regions :: state_pred where
  \<open>P_0x5bc0_true_7_regions \<sigma> \<equiv> \<exists>regions. P_0x5bc0_true_7_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x5c0f_7 :: state_pred where
  \<open>Q_0x5c0f_7 \<sigma> \<equiv> RIP \<sigma> = 0x5c0f \<and> RBX \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x28) \<and> RBP \<sigma> = ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)) \<and> R14 \<sigma> = RSI\<^sub>0 \<and> R13 \<sigma> = RDX\<^sub>0 \<and> R12 \<sigma> = ucast (((\<langle>31,0\<rangle>RCX\<^sub>0::32 word) << 9)) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x20),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x20),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = 0x5bb9 \<and> (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word),4]::32 word) = ucast ((\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word),4]::32 word))\<close>
declare Q_0x5c0f_7_def[Qs]

schematic_goal cow_write_0_1_0x5bc0_0x5bc0_7[blocks]:
  assumes \<open>(P_0x5bc0_true_7 && P_0x5bc0_true_7_regions && jle) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x5bc0 7 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x5c0f_7 ?\<sigma> \<and> block_usage P_0x5bc0_true_7_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x5bc0_true_7_def P_0x5bc0_true_7_regions_def post: Q_0x5c0f_7_def regionset: P_0x5bc0_true_7_regions_set_def)

definition P_0x5bc0_false_8 :: state_pred where
  \<open>P_0x5bc0_false_8 \<sigma> \<equiv> RIP \<sigma> = 0x5bc0 \<and> RAX \<sigma> = write_0x5bb4_retval \<and> RBX \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = (sextend (ucast (((\<langle>31,0\<rangle>RCX\<^sub>0::32 word) << 9))) 32 64::64 word) \<and> RDI \<sigma> = ucast ((\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word),4]::32 word)) \<and> RSI \<sigma> = RDX\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x28) \<and> RBP \<sigma> = ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)) \<and> R14 \<sigma> = RSI\<^sub>0 \<and> R13 \<sigma> = RDX\<^sub>0 \<and> R12 \<sigma> = ucast (((\<langle>31,0\<rangle>RCX\<^sub>0::32 word) << 9)) \<and> R8 \<sigma> = R8\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x20),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x20),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = 0x5bb9 \<and> (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word),4]::32 word) = ucast ((\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word),4]::32 word))\<close>
declare P_0x5bc0_false_8_def[Ps]

definition P_0x5bc0_false_8_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x5bc0_false_8_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((RDI\<^sub>0::64 word) + 0x40), 8),
    (2, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x20), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (9, (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word), 4)
  }\<close>

definition P_0x5bc0_false_8_regions :: state_pred where
  \<open>P_0x5bc0_false_8_regions \<sigma> \<equiv> \<exists>regions. P_0x5bc0_false_8_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x5bd8_8 :: state_pred where
  \<open>Q_0x5bd8_8 \<sigma> \<equiv> RIP \<sigma> = 0x5bd8 \<and> RBX \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> RDI \<sigma> = 0x1 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x28) \<and> RBP \<sigma> = ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)) \<and> R14 \<sigma> = RSI\<^sub>0 \<and> R13 \<sigma> = RDX\<^sub>0 \<and> R12 \<sigma> = ucast (((\<langle>31,0\<rangle>RCX\<^sub>0::32 word) << 9)) \<and> R8 \<sigma> = ((RSI\<^sub>0::64 word) + (((\<langle>63,0\<rangle>((ucast (((\<langle>31,0\<rangle>((ucast (((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word))::64 word) - (0x1::64 word))::32 word)::32 word))::64 word) * (0x1::64 word))::64 word)::64 word) + 0x1)) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x20),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x20),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = 0x5bb9 \<and> (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word),4]::32 word) = ucast ((\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word),4]::32 word))\<close>
declare Q_0x5bd8_8_def[Qs]

schematic_goal cow_write_0_6_0x5bc0_0x5bd2_8[blocks]:
  assumes \<open>(P_0x5bc0_false_8 && P_0x5bc0_false_8_regions && ! jle) \<sigma>\<close>
  shows \<open>exec_block 6 0x5bd2 8 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x5bd8_8 ?\<sigma> \<and> block_usage P_0x5bc0_false_8_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x5bc0_false_8_def P_0x5bc0_false_8_regions_def post: Q_0x5bd8_8_def regionset: P_0x5bc0_false_8_regions_set_def)

definition P_0x5bd8_9 :: state_pred where
  \<open>P_0x5bd8_9 \<sigma> \<equiv> RIP \<sigma> = 0x5bd8 \<and> RBX \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> RDI \<sigma> = 0x1 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x28) \<and> RBP \<sigma> = ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)) \<and> R14 \<sigma> = RSI\<^sub>0 \<and> R13 \<sigma> = RDX\<^sub>0 \<and> R12 \<sigma> = ucast (((\<langle>31,0\<rangle>RCX\<^sub>0::32 word) << 9)) \<and> R8 \<sigma> = ((RSI\<^sub>0::64 word) + (((\<langle>63,0\<rangle>((ucast (((\<langle>31,0\<rangle>((ucast (((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word))::64 word) - (0x1::64 word))::32 word)::32 word))::64 word) * (0x1::64 word))::64 word)::64 word) + 0x1)) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x20),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x20),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = 0x5bb9 \<and> (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word),4]::32 word) = ucast ((\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word),4]::32 word))\<close>
declare P_0x5bd8_9_def[Ps]

definition P_0x5bd8_9_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x5bd8_9_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((RDI\<^sub>0::64 word) + 0x40), 8),
    (2, ((((if' (RSI \<sigma>::64 word) \<ge>s (ucast ((0x0::64 word))::64 word) then RSI \<sigma> else (((RSI \<sigma>::64 word) + 0x7)::64 word)) >>> 3)::64 word) + (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word)), Suc 0),
    (3, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8), 8),
    (4, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x20), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (11, (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word), 4)
  }\<close>

definition P_0x5bd8_9_regions :: state_pred where
  \<open>P_0x5bd8_9_regions \<sigma> \<equiv> \<exists>regions. P_0x5bd8_9_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x5c0d_9 :: state_pred where
  \<open>Q_0x5c0d_9 \<sigma> \<equiv> RIP \<sigma> = 0x5c0d \<and> RBX \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> RDI \<sigma> = 0x1 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x28) \<and> RBP \<sigma> = ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)) \<and> R14 \<sigma> = RSI\<^sub>0 \<and> R13 \<sigma> = RDX\<^sub>0 \<and> R12 \<sigma> = ucast (((\<langle>31,0\<rangle>RCX\<^sub>0::32 word) << 9)) \<and> R8 \<sigma> = ((RSI\<^sub>0::64 word) + (((\<langle>63,0\<rangle>((ucast (((\<langle>31,0\<rangle>((ucast (((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word))::64 word) - (0x1::64 word))::32 word)::32 word))::64 word) * (0x1::64 word))::64 word)::64 word) + 0x1)) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x20),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x20),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = 0x5bb9 \<and> (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word),4]::32 word) = ucast ((\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word),4]::32 word))\<close>
declare Q_0x5c0d_9_def[Qs]

schematic_goal cow_write_0_16_0x5bd8_0x5c0a_9[blocks]:
  assumes \<open>(P_0x5bd8_9 && P_0x5bd8_9_regions) \<sigma>\<close>
  shows \<open>exec_block 16 0x5c0a 9 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x5c0d_9 ?\<sigma> \<and> block_usage P_0x5bd8_9_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x5bd8_9_def P_0x5bd8_9_regions_def post: Q_0x5c0d_9_def regionset: P_0x5bd8_9_regions_set_def)

definition P_0x5c0d_true_10 :: state_pred where
  \<open>P_0x5c0d_true_10 \<sigma> \<equiv> RIP \<sigma> = 0x5c0d \<and> RBX \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> RDI \<sigma> = 0x1 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x28) \<and> RBP \<sigma> = ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)) \<and> R14 \<sigma> = RSI\<^sub>0 \<and> R13 \<sigma> = RDX\<^sub>0 \<and> R12 \<sigma> = ucast (((\<langle>31,0\<rangle>RCX\<^sub>0::32 word) << 9)) \<and> R8 \<sigma> = ((RSI\<^sub>0::64 word) + (((\<langle>63,0\<rangle>((ucast (((\<langle>31,0\<rangle>((ucast (((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word))::64 word) - (0x1::64 word))::32 word)::32 word))::64 word) * (0x1::64 word))::64 word)::64 word) + 0x1)) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x20),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x20),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = 0x5bb9 \<and> (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word),4]::32 word) = ucast ((\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word),4]::32 word))\<close>
declare P_0x5c0d_true_10_def[Ps]

definition P_0x5c0d_true_10_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x5c0d_true_10_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((RDI\<^sub>0::64 word) + 0x40), 8),
    (2, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x20), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (9, (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word), 4)
  }\<close>

definition P_0x5c0d_true_10_regions :: state_pred where
  \<open>P_0x5c0d_true_10_regions \<sigma> \<equiv> \<exists>regions. P_0x5c0d_true_10_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x5bd8_10 :: state_pred where
  \<open>Q_0x5bd8_10 \<sigma> \<equiv> RIP \<sigma> = 0x5bd8 \<and> RBX \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> RDI \<sigma> = 0x1 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x28) \<and> RBP \<sigma> = ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)) \<and> R14 \<sigma> = RSI\<^sub>0 \<and> R13 \<sigma> = RDX\<^sub>0 \<and> R12 \<sigma> = ucast (((\<langle>31,0\<rangle>RCX\<^sub>0::32 word) << 9)) \<and> R8 \<sigma> = ((RSI\<^sub>0::64 word) + (((\<langle>63,0\<rangle>((ucast (((\<langle>31,0\<rangle>((ucast (((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word))::64 word) - (0x1::64 word))::32 word)::32 word))::64 word) * (0x1::64 word))::64 word)::64 word) + 0x1)) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x20),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x20),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = 0x5bb9 \<and> (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word),4]::32 word) = ucast ((\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word),4]::32 word))\<close>
declare Q_0x5bd8_10_def[Qs]

schematic_goal cow_write_0_1_0x5c0d_0x5c0d_10[blocks]:
  assumes \<open>(P_0x5c0d_true_10 && P_0x5c0d_true_10_regions && !ZF) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x5c0d 10 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x5bd8_10 ?\<sigma> \<and> block_usage P_0x5c0d_true_10_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x5c0d_true_10_def P_0x5c0d_true_10_regions_def post: Q_0x5bd8_10_def regionset: P_0x5c0d_true_10_regions_set_def)

definition P_0x5c0d_false_11 :: state_pred where
  \<open>P_0x5c0d_false_11 \<sigma> \<equiv> RIP \<sigma> = 0x5c0d \<and> RBX \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> RDI \<sigma> = 0x1 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x28) \<and> RBP \<sigma> = ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)) \<and> R14 \<sigma> = RSI\<^sub>0 \<and> R13 \<sigma> = RDX\<^sub>0 \<and> R12 \<sigma> = ucast (((\<langle>31,0\<rangle>RCX\<^sub>0::32 word) << 9)) \<and> R8 \<sigma> = ((RSI\<^sub>0::64 word) + (((\<langle>63,0\<rangle>((ucast (((\<langle>31,0\<rangle>((ucast (((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word))::64 word) - (0x1::64 word))::32 word)::32 word))::64 word) * (0x1::64 word))::64 word)::64 word) + 0x1)) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x20),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x20),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = 0x5bb9 \<and> (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word),4]::32 word) = ucast ((\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word),4]::32 word))\<close>
declare P_0x5c0d_false_11_def[Ps]

definition P_0x5c0d_false_11_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x5c0d_false_11_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((RDI\<^sub>0::64 word) + 0x40), 8),
    (2, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x20), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (9, (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word), 4)
  }\<close>

definition P_0x5c0d_false_11_regions :: state_pred where
  \<open>P_0x5c0d_false_11_regions \<sigma> \<equiv> \<exists>regions. P_0x5c0d_false_11_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x5c0f_11 :: state_pred where
  \<open>Q_0x5c0f_11 \<sigma> \<equiv> RIP \<sigma> = 0x5c0f \<and> RBX \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> RDI \<sigma> = 0x1 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x28) \<and> RBP \<sigma> = ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)) \<and> R14 \<sigma> = RSI\<^sub>0 \<and> R13 \<sigma> = RDX\<^sub>0 \<and> R12 \<sigma> = ucast (((\<langle>31,0\<rangle>RCX\<^sub>0::32 word) << 9)) \<and> R8 \<sigma> = ((RSI\<^sub>0::64 word) + (((\<langle>63,0\<rangle>((ucast (((\<langle>31,0\<rangle>((ucast (((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word))::64 word) - (0x1::64 word))::32 word)::32 word))::64 word) * (0x1::64 word))::64 word)::64 word) + 0x1)) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x20),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x20),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = 0x5bb9 \<and> (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word),4]::32 word) = ucast ((\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word),4]::32 word))\<close>
declare Q_0x5c0f_11_def[Qs]

schematic_goal cow_write_0_1_0x5c0d_0x5c0d_11[blocks]:
  assumes \<open>(P_0x5c0d_false_11 && P_0x5c0d_false_11_regions && ! !ZF) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x5c0d 11 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x5c0f_11 ?\<sigma> \<and> block_usage P_0x5c0d_false_11_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x5c0d_false_11_def P_0x5c0d_false_11_regions_def post: Q_0x5c0f_11_def regionset: P_0x5c0d_false_11_regions_set_def)

definition P_0x5c0f_12 :: state_pred where
  \<open>P_0x5c0f_12 \<sigma> \<equiv> RIP \<sigma> = 0x5c0f \<and> RBX \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x28) \<and> RBP \<sigma> = ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)) \<and> R14 \<sigma> = RSI\<^sub>0 \<and> R13 \<sigma> = RDX\<^sub>0 \<and> R12 \<sigma> = ucast (((\<langle>31,0\<rangle>RCX\<^sub>0::32 word) << 9)) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x20),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x20),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = 0x5bb9 \<and> (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word),4]::32 word) = ucast ((\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word),4]::32 word))\<close>
declare P_0x5c0f_12_def[Ps]

definition P_0x5c0f_12_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x5c0f_12_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((RDI\<^sub>0::64 word) + 0x40), 8),
    (2, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x20), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (9, (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word), 4)
  }\<close>

definition P_0x5c0f_12_regions :: state_pred where
  \<open>P_0x5c0f_12_regions \<sigma> \<equiv> \<exists>regions. P_0x5c0f_12_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x5c11_12 :: state_pred where
  \<open>Q_0x5c11_12 \<sigma> \<equiv> RIP \<sigma> = 0x5c11 \<and> RBX \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x28) \<and> RBP \<sigma> = ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)) \<and> R14 \<sigma> = RSI\<^sub>0 \<and> R13 \<sigma> = RDX\<^sub>0 \<and> R12 \<sigma> = ucast (((\<langle>31,0\<rangle>RCX\<^sub>0::32 word) << 9)) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x20),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x20),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = 0x5bb9 \<and> (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word),4]::32 word) = ucast ((\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word),4]::32 word))\<close>
declare Q_0x5c11_12_def[Qs]

schematic_goal cow_write_0_1_0x5c0f_0x5c0f_12[blocks]:
  assumes \<open>(P_0x5c0f_12 && P_0x5c0f_12_regions) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x5c0f 12 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x5c11_12 ?\<sigma> \<and> block_usage P_0x5c0f_12_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x5c0f_12_def P_0x5c0f_12_regions_def post: Q_0x5c11_12_def regionset: P_0x5c0f_12_regions_set_def)

definition P_0x5c11_13 :: state_pred where
  \<open>P_0x5c11_13 \<sigma> \<equiv> RIP \<sigma> = 0x5c11 \<and> RBX \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x28) \<and> RBP \<sigma> = ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)) \<and> R14 \<sigma> = RSI\<^sub>0 \<and> R13 \<sigma> = RDX\<^sub>0 \<and> R12 \<sigma> = ucast (((\<langle>31,0\<rangle>RCX\<^sub>0::32 word) << 9)) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x20),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x20),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = 0x5bb9 \<and> (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word),4]::32 word) = ucast ((\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word),4]::32 word))\<close>
declare P_0x5c11_13_def[Ps]

definition P_0x5c11_13_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x5c11_13_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((RDI\<^sub>0::64 word) + 0x40), 8),
    (2, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x20), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (9, (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word), 4)
  }\<close>

definition P_0x5c11_13_regions :: state_pred where
  \<open>P_0x5c11_13_regions \<sigma> \<equiv> \<exists>regions. P_0x5c11_13_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_ret_address_13 :: state_pred where
  \<open>Q_ret_address_13 \<sigma> \<equiv> RIP \<sigma> = ret_address \<and> RBX \<sigma> = RBX\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) + 0x8) \<and> RBP \<sigma> = RBP\<^sub>0 \<and> R14 \<sigma> = R14\<^sub>0 \<and> R13 \<sigma> = R13\<^sub>0 \<and> R12 \<sigma> = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x20),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x20),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = 0x5bb9 \<and> (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word),4]::32 word) = ucast ((\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word),4]::32 word))\<close>
declare Q_ret_address_13_def[Qs]

schematic_goal cow_write_0_6_0x5c11_0x5c19_13[blocks]:
  assumes \<open>(P_0x5c11_13 && P_0x5c11_13_regions) \<sigma>\<close>
  shows \<open>exec_block 6 0x5c19 13 \<sigma> \<triangleq> ?\<sigma> \<and> Q_ret_address_13 ?\<sigma> \<and> block_usage P_0x5c11_13_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x5c11_13_def P_0x5c11_13_regions_def post: Q_ret_address_13_def regionset: P_0x5c11_13_regions_set_def)

definition cow_write_acode :: ACode where
  \<open>cow_write_acode =
    Block 15 0x5ba3 0;
    Block (Suc 0) 0x5ba7 (Suc 0);
    CALL lseek64_acode;
    Block 3 0x5bb1 2;
    Block (Suc 0) 0x5bb4 3;
    CALL write_acode;
    Block (Suc 0) 0x5bb9 4;
    IF !ZF THEN
      Block 3 0x5c1f 5
    ELSE
      Block 2 0x5bbe 6;
      IF jle THEN
        Block (Suc 0) 0x5bc0 7
      ELSE
        Block 6 0x5bd2 8;
        WHILE P_0x5bd8_9 DO
          Block 16 0x5c0a 9;
          IF !ZF THEN
            Block (Suc 0) 0x5c0d 10
          ELSE
            Block (Suc 0) 0x5c0d 11
          FI
        OD
      FI;
      Block (Suc 0) 0x5c0f 12
    FI;
    Block 6 0x5c19 13
  \<close>

schematic_goal "cow_write":
  assumes
    \<open>\<forall>\<sigma>. RIP \<sigma> = 0x5ba7 \<longrightarrow> P_0x5ba7_1_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x5bac \<longrightarrow> P_0x5bac_2_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x5bb4 \<longrightarrow> P_0x5bb4_3_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x5bb9 \<longrightarrow> P_0x5bb9_4_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x5bbc \<longrightarrow> P_0x5bbc_true_5_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x5bbc \<longrightarrow> P_0x5bbc_false_6_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x5bc0 \<longrightarrow> P_0x5bc0_true_7_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x5bc0 \<longrightarrow> P_0x5bc0_false_8_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x5bd8 \<longrightarrow> P_0x5bd8_9_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x5c0d \<longrightarrow> P_0x5c0d_true_10_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x5c0d \<longrightarrow> P_0x5c0d_false_11_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x5c0f \<longrightarrow> P_0x5c0f_12_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x5c11 \<longrightarrow> P_0x5c11_13_regions \<sigma>\<close>
    and [blocks]: \<open>{{Q_lseek64_addr_0x5ba7_1}} \<box>lseek64_acode {{P_0x5bac_2;M_0x5ba7}}\<close>
    and [blocks]: \<open>{{Q_write_addr_0x5bb4_3}} \<box>write_acode {{P_0x5bb9_4;M_0x5bb4}}\<close>
  shows \<open>{{?P}} cow_write_acode {{?Q;?M}}\<close>
  apply (vcg acode: cow_write_acode_def assms: assms)
                   apply (vcg_while \<open>P_0x5bd8_9 || P_0x5c0f_12\<close> assms: assms)
                    apply (vcg_step assms: assms)+
                   apply (simp add: pred_logic Ps Qs assms)+
               apply (vcg_step assms: assms)+
                   apply (simp add: assms)+
          apply (vcg_step assms: assms)+
  done

end

locale "cow_read" = "qemu_img_xen" +
  fixes RAX\<^sub>0\<^sub>v RBX\<^sub>0\<^sub>v RCX\<^sub>0\<^sub>v RDX\<^sub>0\<^sub>v RDI\<^sub>0\<^sub>v RSI\<^sub>0\<^sub>v RSP\<^sub>0\<^sub>v RBP\<^sub>0\<^sub>v R15\<^sub>0\<^sub>v R14\<^sub>0\<^sub>v R13\<^sub>0\<^sub>v R12\<^sub>0\<^sub>v R8\<^sub>0\<^sub>v ret_address\<^sub>v :: \<open>64 word\<close>
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
definition \<open>R8\<^sub>0 \<equiv> R8\<^sub>0\<^sub>v\<close>
definition \<open>ret_address \<equiv> ret_address\<^sub>v\<close>

definition P_0x5c30_0 :: state_pred where
  \<open>P_0x5c30_0 \<sigma> \<equiv> RIP \<sigma> = 0x5c30 \<and> RAX \<sigma> = RAX\<^sub>0 \<and> RBX \<sigma> = RBX\<^sub>0 \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = RDX\<^sub>0 \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = RSP\<^sub>0 \<and> RBP \<sigma> = RBP\<^sub>0 \<and> R15 \<sigma> = R15\<^sub>0 \<and> R14 \<sigma> = R14\<^sub>0 \<and> R13 \<sigma> = R13\<^sub>0 \<and> R12 \<sigma> = R12\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address\<close>
declare P_0x5c30_0_def[Ps]

definition P_0x5c30_0_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x5c30_0_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((RDI\<^sub>0::64 word) + 0x40), 8),
    (2, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x30), 8)
  }\<close>

definition P_0x5c30_0_regions :: state_pred where
  \<open>P_0x5c30_0_regions \<sigma> \<equiv> \<exists>regions. P_0x5c30_0_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x5c44_0 :: state_pred where
  \<open>Q_0x5c44_0 \<sigma> \<equiv> RIP \<sigma> = 0x5c44 \<and> RAX \<sigma> = RAX\<^sub>0 \<and> RBX \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = RDX\<^sub>0 \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x48) \<and> RBP \<sigma> = RBP\<^sub>0 \<and> R15 \<sigma> = R15\<^sub>0 \<and> R14 \<sigma> = R14\<^sub>0 \<and> R13 \<sigma> = R13\<^sub>0 \<and> R12 \<sigma> = R12\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0\<close>
declare Q_0x5c44_0_def[Qs]

schematic_goal cow_read_0_9_0x5c30_0x5c42_0[blocks]:
  assumes \<open>(P_0x5c30_0 && P_0x5c30_0_regions) \<sigma>\<close>
  shows \<open>exec_block 9 0x5c42 0 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x5c44_0 ?\<sigma> \<and> block_usage P_0x5c30_0_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x5c30_0_def P_0x5c30_0_regions_def post: Q_0x5c44_0_def regionset: P_0x5c30_0_regions_set_def)

definition P_0x5c44_true_1 :: state_pred where
  \<open>P_0x5c44_true_1 \<sigma> \<equiv> RIP \<sigma> = 0x5c44 \<and> RAX \<sigma> = RAX\<^sub>0 \<and> RBX \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = RDX\<^sub>0 \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x48) \<and> RBP \<sigma> = RBP\<^sub>0 \<and> R15 \<sigma> = R15\<^sub>0 \<and> R14 \<sigma> = R14\<^sub>0 \<and> R13 \<sigma> = R13\<^sub>0 \<and> R12 \<sigma> = R12\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0\<close>
declare P_0x5c44_true_1_def[Ps]

definition P_0x5c44_true_1_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x5c44_true_1_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((RDI\<^sub>0::64 word) + 0x40), 8),
    (2, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x30), 8)
  }\<close>

definition P_0x5c44_true_1_regions :: state_pred where
  \<open>P_0x5c44_true_1_regions \<sigma> \<equiv> \<exists>regions. P_0x5c44_true_1_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_ret_address_1 :: state_pred where
  \<open>Q_ret_address_1 \<sigma> \<equiv> RIP \<sigma> = ret_address \<and> RBX \<sigma> = RBX\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) + 0x8) \<and> RBP \<sigma> = RBP\<^sub>0 \<and> R15 \<sigma> = R15\<^sub>0 \<and> R14 \<sigma> = R14\<^sub>0 \<and> R13 \<sigma> = R13\<^sub>0 \<and> R12 \<sigma> = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0\<close>
declare Q_ret_address_1_def[Qs]

schematic_goal cow_read_0_10_0x5c44_0x5d88_1[blocks]:
  assumes \<open>(P_0x5c44_true_1 && P_0x5c44_true_1_regions && jle) \<sigma>\<close>
  shows \<open>exec_block 10 0x5d88 (Suc 0) \<sigma> \<triangleq> ?\<sigma> \<and> Q_ret_address_1 ?\<sigma> \<and> block_usage P_0x5c44_true_1_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x5c44_true_1_def P_0x5c44_true_1_regions_def post: Q_ret_address_1_def regionset: P_0x5c44_true_1_regions_set_def)

definition P_0x5c44_false_2 :: state_pred where
  \<open>P_0x5c44_false_2 \<sigma> \<equiv> RIP \<sigma> = 0x5c44 \<and> RAX \<sigma> = RAX\<^sub>0 \<and> RBX \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = RDX\<^sub>0 \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x48) \<and> RBP \<sigma> = RBP\<^sub>0 \<and> R15 \<sigma> = R15\<^sub>0 \<and> R14 \<sigma> = R14\<^sub>0 \<and> R13 \<sigma> = R13\<^sub>0 \<and> R12 \<sigma> = R12\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0\<close>
declare P_0x5c44_false_2_def[Ps]

definition P_0x5c44_false_2_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x5c44_false_2_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((RDI\<^sub>0::64 word) + 0x40), 8),
    (2, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x30), 8)
  }\<close>

definition P_0x5c44_false_2_regions :: state_pred where
  \<open>P_0x5c44_false_2_regions \<sigma> \<equiv> \<exists>regions. P_0x5c44_false_2_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x5c60_2 :: state_pred where
  \<open>Q_0x5c60_2 \<sigma> \<equiv> RIP \<sigma> = 0x5c60 \<and> RBX \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x48) \<and> RBP \<sigma> = RDI\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0\<close>
declare Q_0x5c60_2_def[Qs]

schematic_goal cow_read_0_6_0x5c44_0x5c56_2[blocks]:
  assumes \<open>(P_0x5c44_false_2 && P_0x5c44_false_2_regions && ! jle) \<sigma>\<close>
  shows \<open>exec_block 6 0x5c56 2 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x5c60_2 ?\<sigma> \<and> block_usage P_0x5c44_false_2_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x5c44_false_2_def P_0x5c44_false_2_regions_def post: Q_0x5c60_2_def regionset: P_0x5c44_false_2_regions_set_def)

definition P_0x5c60_3 :: state_pred where
  \<open>P_0x5c60_3 \<sigma> \<equiv> RIP \<sigma> = 0x5c60 \<and> RBX \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x48) \<and> RBP \<sigma> = RDI\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0\<close>
declare P_0x5c60_3_def[Ps]

definition P_0x5c60_3_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x5c60_3_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((RDI\<^sub>0::64 word) + 0x40), 8),
    (2, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x30), 8)
  }\<close>

definition P_0x5c60_3_regions :: state_pred where
  \<open>P_0x5c60_3_regions \<sigma> \<equiv> \<exists>regions. P_0x5c60_3_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x5c67_3 :: state_pred where
  \<open>Q_0x5c67_3 \<sigma> \<equiv> RIP \<sigma> = 0x5c67 \<and> RBX \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> RDI \<sigma> = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x48) \<and> RBP \<sigma> = RDI\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0\<close>
declare Q_0x5c67_3_def[Qs]

schematic_goal cow_read_0_2_0x5c60_0x5c64_3[blocks]:
  assumes \<open>(P_0x5c60_3 && P_0x5c60_3_regions) \<sigma>\<close>
  shows \<open>exec_block 2 0x5c64 3 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x5c67_3 ?\<sigma> \<and> block_usage P_0x5c60_3_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x5c60_3_def P_0x5c60_3_regions_def post: Q_0x5c67_3_def regionset: P_0x5c60_3_regions_set_def)

definition P_0x5c67_true_4 :: state_pred where
  \<open>P_0x5c67_true_4 \<sigma> \<equiv> RIP \<sigma> = 0x5c67 \<and> RBX \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> RDI \<sigma> = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x48) \<and> RBP \<sigma> = RDI\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0\<close>
declare P_0x5c67_true_4_def[Ps]

definition P_0x5c67_true_4_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x5c67_true_4_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((RDI\<^sub>0::64 word) + 0x40), 8),
    (2, ((RDI\<^sub>0::64 word) + 0x850), 8),
    (3, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x30), 8)
  }\<close>

definition P_0x5c67_true_4_regions :: state_pred where
  \<open>P_0x5c67_true_4_regions \<sigma> \<equiv> \<exists>regions. P_0x5c67_true_4_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x5da0_4 :: state_pred where
  \<open>Q_0x5da0_4 \<sigma> \<equiv> RIP \<sigma> = 0x5da0 \<and> RBX \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> RCX \<sigma> = ucast ((\<langle>31,0\<rangle>R13 \<sigma>::32 word)) \<and> RDI \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x850),8]::64 word) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x48) \<and> RBP \<sigma> = RDI\<^sub>0 \<and> R12 \<sigma> = ucast ((\<langle>31,0\<rangle>R13 \<sigma>::32 word)) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x850),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x850),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0\<close>
declare Q_0x5da0_4_def[Qs]

schematic_goal cow_read_0_5_0x5c67_0x5d9d_4[blocks]:
  assumes \<open>(P_0x5c67_true_4 && P_0x5c67_true_4_regions && ZF) \<sigma>\<close>
  shows \<open>exec_block 5 0x5d9d 4 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x5da0_4 ?\<sigma> \<and> block_usage P_0x5c67_true_4_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x5c67_true_4_def P_0x5c67_true_4_regions_def post: Q_0x5da0_4_def regionset: P_0x5c67_true_4_regions_set_def)

definition P_0x5da0_true_5 :: state_pred where
  \<open>P_0x5da0_true_5 \<sigma> \<equiv> RIP \<sigma> = 0x5da0 \<and> RBX \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> RCX \<sigma> = ucast ((\<langle>31,0\<rangle>R13 \<sigma>::32 word)) \<and> RDI \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x850),8]::64 word) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x48) \<and> RBP \<sigma> = RDI\<^sub>0 \<and> R12 \<sigma> = ucast ((\<langle>31,0\<rangle>R13 \<sigma>::32 word)) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x850),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x850),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0\<close>
declare P_0x5da0_true_5_def[Ps]

definition P_0x5da0_true_5_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x5da0_true_5_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((RDI\<^sub>0::64 word) + 0x40), 8),
    (2, ((RDI\<^sub>0::64 word) + 0x850), 8),
    (3, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x30), 8)
  }\<close>

definition P_0x5da0_true_5_regions :: state_pred where
  \<open>P_0x5da0_true_5_regions \<sigma> \<equiv> \<exists>regions. P_0x5da0_true_5_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x5d4d_5 :: state_pred where
  \<open>Q_0x5d4d_5 \<sigma> \<equiv> RIP \<sigma> = 0x5d4d \<and> RBX \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> RCX \<sigma> = ucast ((\<langle>31,0\<rangle>R13 \<sigma>::32 word)) \<and> RDX \<sigma> = R15 \<sigma> \<and> RDI \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x850),8]::64 word) \<and> RSI \<sigma> = R14 \<sigma> \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x48) \<and> RBP \<sigma> = RDI\<^sub>0 \<and> R12 \<sigma> = ucast ((\<langle>31,0\<rangle>R13 \<sigma>::32 word)) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x850),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x850),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0\<close>
declare Q_0x5d4d_5_def[Qs]

schematic_goal cow_read_0_3_0x5da0_0x5d4a_5[blocks]:
  assumes \<open>(P_0x5da0_true_5 && P_0x5da0_true_5_regions && !ZF) \<sigma>\<close>
  shows \<open>exec_block 3 0x5d4a 5 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x5d4d_5 ?\<sigma> \<and> block_usage P_0x5da0_true_5_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x5da0_true_5_def P_0x5da0_true_5_regions_def post: Q_0x5d4d_5_def regionset: P_0x5da0_true_5_regions_set_def)

definition P_0x5d4d_6 :: state_pred where
  \<open>P_0x5d4d_6 \<sigma> \<equiv> RIP \<sigma> = 0x5d4d \<and> RBX \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> RCX \<sigma> = ucast ((\<langle>31,0\<rangle>R13 \<sigma>::32 word)) \<and> RDX \<sigma> = R15 \<sigma> \<and> RDI \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x850),8]::64 word) \<and> RSI \<sigma> = R14 \<sigma> \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x48) \<and> RBP \<sigma> = RDI\<^sub>0 \<and> R12 \<sigma> = ucast ((\<langle>31,0\<rangle>R13 \<sigma>::32 word)) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x850),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x850),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0\<close>
declare P_0x5d4d_6_def[Ps]

definition P_0x5d4d_6_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x5d4d_6_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((RDI\<^sub>0::64 word) + 0x40), 8),
    (2, ((RDI\<^sub>0::64 word) + 0x850), 8),
    (3, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x50), 8)
  }\<close>

definition P_0x5d4d_6_regions :: state_pred where
  \<open>P_0x5d4d_6_regions \<sigma> \<equiv> \<exists>regions. P_0x5d4d_6_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_bdrv_read_addr_0x5d4d_6 :: state_pred where
  \<open>Q_bdrv_read_addr_0x5d4d_6 \<sigma> \<equiv> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x50) \<and> RIP \<sigma> = bdrv_read_addr \<and> RBX \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> RCX \<sigma> = ucast ((\<langle>31,0\<rangle>R13 \<sigma>::32 word)) \<and> RDX \<sigma> = R15 \<sigma> \<and> RDI \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x850),8]::64 word) \<and> RSI \<sigma> = R14 \<sigma> \<and> RBP \<sigma> = RDI\<^sub>0 \<and> R12 \<sigma> = ucast ((\<langle>31,0\<rangle>R13 \<sigma>::32 word)) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x850),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x850),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),8]::64 word) = 0x5d52\<close>
declare Q_bdrv_read_addr_0x5d4d_6_def[Qs]

schematic_goal cow_read_0_1_0x5d4d_0x5d4d_6[blocks]:
  assumes \<open>(P_0x5d4d_6 && P_0x5d4d_6_regions) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x5d4d 6 \<sigma> \<triangleq> ?\<sigma> \<and> Q_bdrv_read_addr_0x5d4d_6 ?\<sigma> \<and> block_usage P_0x5d4d_6_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x5d4d_6_def P_0x5d4d_6_regions_def post: Q_bdrv_read_addr_0x5d4d_6_def regionset: P_0x5d4d_6_regions_set_def)

definition P_0x5d52_7 :: state_pred where
  \<open>P_0x5d52_7 \<sigma> \<equiv> RIP \<sigma> = 0x5d52 \<and> RBX \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> RCX \<sigma> = ucast ((\<langle>31,0\<rangle>R13 \<sigma>::32 word)) \<and> RDX \<sigma> = R15 \<sigma> \<and> RDI \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x850),8]::64 word) \<and> RSI \<sigma> = R14 \<sigma> \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x48) \<and> RBP \<sigma> = RDI\<^sub>0 \<and> R12 \<sigma> = ucast ((\<langle>31,0\<rangle>R13 \<sigma>::32 word)) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x850),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x850),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),8]::64 word) = 0x5d52\<close>
declare P_0x5d52_7_def[Ps]

definition P_0x5d52_7_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x5d52_7_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((RDI\<^sub>0::64 word) + 0x40), 8),
    (2, ((RDI\<^sub>0::64 word) + 0x850), 8),
    (3, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x50), 8)
  }\<close>

definition P_0x5d52_7_regions :: state_pred where
  \<open>P_0x5d52_7_regions \<sigma> \<equiv> \<exists>regions. P_0x5d52_7_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x5d54_7 :: state_pred where
  \<open>Q_0x5d54_7 \<sigma> \<equiv> RIP \<sigma> = 0x5d54 \<and> RBX \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> RCX \<sigma> = ucast ((\<langle>31,0\<rangle>R13 \<sigma>::32 word)) \<and> RDX \<sigma> = R15 \<sigma> \<and> RDI \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x850),8]::64 word) \<and> RSI \<sigma> = R14 \<sigma> \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x48) \<and> RBP \<sigma> = RDI\<^sub>0 \<and> R12 \<sigma> = ucast ((\<langle>31,0\<rangle>R13 \<sigma>::32 word)) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x850),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x850),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),8]::64 word) = 0x5d52\<close>
declare Q_0x5d54_7_def[Qs]

schematic_goal cow_read_0_1_0x5d52_0x5d52_7[blocks]:
  assumes \<open>(P_0x5d52_7 && P_0x5d52_7_regions) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x5d52 7 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x5d54_7 ?\<sigma> \<and> block_usage P_0x5d52_7_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x5d52_7_def P_0x5d52_7_regions_def post: Q_0x5d54_7_def regionset: P_0x5d52_7_regions_set_def)

definition P_0x5d54_true_8 :: state_pred where
  \<open>P_0x5d54_true_8 \<sigma> \<equiv> RIP \<sigma> = 0x5d54 \<and> RBX \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> RCX \<sigma> = ucast ((\<langle>31,0\<rangle>R13 \<sigma>::32 word)) \<and> RDX \<sigma> = R15 \<sigma> \<and> RDI \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x850),8]::64 word) \<and> RSI \<sigma> = R14 \<sigma> \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x48) \<and> RBP \<sigma> = RDI\<^sub>0 \<and> R12 \<sigma> = ucast ((\<langle>31,0\<rangle>R13 \<sigma>::32 word)) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x850),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x850),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),8]::64 word) = 0x5d52\<close>
declare P_0x5d54_true_8_def[Ps]

definition P_0x5d54_true_8_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x5d54_true_8_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((RDI\<^sub>0::64 word) + 0x40), 8),
    (2, ((RDI\<^sub>0::64 word) + 0x850), 8),
    (3, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x50), 8)
  }\<close>

definition P_0x5d54_true_8_regions :: state_pred where
  \<open>P_0x5d54_true_8_regions \<sigma> \<equiv> \<exists>regions. P_0x5d54_true_8_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x5e04_8 :: state_pred where
  \<open>Q_0x5e04_8 \<sigma> \<equiv> RIP \<sigma> = 0x5e04 \<and> RBX \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x48) \<and> RBP \<sigma> = RDI\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0\<close>
declare Q_0x5e04_8_def[Qs]

schematic_goal cow_read_0_1_0x5d54_0x5d54_8[blocks]:
  assumes \<open>(P_0x5d54_true_8 && P_0x5d54_true_8_regions && SF) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x5d54 8 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x5e04_8 ?\<sigma> \<and> block_usage P_0x5d54_true_8_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x5d54_true_8_def P_0x5d54_true_8_regions_def post: Q_0x5e04_8_def regionset: P_0x5d54_true_8_regions_set_def)

definition P_0x5d54_false_9 :: state_pred where
  \<open>P_0x5d54_false_9 \<sigma> \<equiv> RIP \<sigma> = 0x5d54 \<and> RBX \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> RCX \<sigma> = ucast ((\<langle>31,0\<rangle>R13 \<sigma>::32 word)) \<and> RDX \<sigma> = R15 \<sigma> \<and> RDI \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x850),8]::64 word) \<and> RSI \<sigma> = R14 \<sigma> \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x48) \<and> RBP \<sigma> = RDI\<^sub>0 \<and> R12 \<sigma> = ucast ((\<langle>31,0\<rangle>R13 \<sigma>::32 word)) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x850),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x850),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),8]::64 word) = 0x5d52\<close>
declare P_0x5d54_false_9_def[Ps]

definition P_0x5d54_false_9_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x5d54_false_9_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((RDI\<^sub>0::64 word) + 0x40), 8),
    (2, ((RDI\<^sub>0::64 word) + 0x850), 8),
    (3, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x50), 8)
  }\<close>

definition P_0x5d54_false_9_regions :: state_pred where
  \<open>P_0x5d54_false_9_regions \<sigma> \<equiv> \<exists>regions. P_0x5d54_false_9_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x5d63_9 :: state_pred where
  \<open>Q_0x5d63_9 \<sigma> \<equiv> RIP \<sigma> = 0x5d63 \<and> RBX \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> RCX \<sigma> = (sextend (ucast (((\<langle>31,0\<rangle>R13 \<sigma>::32 word) << 9))) 32 64::64 word) \<and> RDX \<sigma> = R15 \<sigma> \<and> RDI \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x850),8]::64 word) \<and> RSI \<sigma> = R14 \<sigma> \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x48) \<and> RBP \<sigma> = RDI\<^sub>0 \<and> R12 \<sigma> = ucast ((\<langle>31,0\<rangle>R13 \<sigma>::32 word)) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x850),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x850),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),8]::64 word) = 0x5d52\<close>
declare Q_0x5d63_9_def[Qs]

schematic_goal cow_read_0_4_0x5d54_0x5d60_9[blocks]:
  assumes \<open>(P_0x5d54_false_9 && P_0x5d54_false_9_regions && ! SF) \<sigma>\<close>
  shows \<open>exec_block 4 0x5d60 9 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x5d63_9 ?\<sigma> \<and> block_usage P_0x5d54_false_9_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x5d54_false_9_def P_0x5d54_false_9_regions_def post: Q_0x5d63_9_def regionset: P_0x5d54_false_9_regions_set_def)

definition P_0x5d63_10 :: state_pred where
  \<open>P_0x5d63_10 \<sigma> \<equiv> RIP \<sigma> = 0x5d63 \<and> RBX \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> RCX \<sigma> = (sextend (ucast (((\<langle>31,0\<rangle>R13 \<sigma>::32 word) << 9))) 32 64::64 word) \<and> RDX \<sigma> = R15 \<sigma> \<and> RDI \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x850),8]::64 word) \<and> RSI \<sigma> = R14 \<sigma> \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x48) \<and> RBP \<sigma> = RDI\<^sub>0 \<and> R12 \<sigma> = ucast ((\<langle>31,0\<rangle>R13 \<sigma>::32 word)) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x850),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x850),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),8]::64 word) = 0x5d52\<close>
declare P_0x5d63_10_def[Ps]

definition P_0x5d63_10_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x5d63_10_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((RDI\<^sub>0::64 word) + 0x40), 8),
    (2, ((RDI\<^sub>0::64 word) + 0x850), 8),
    (3, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x50), 8)
  }\<close>

definition P_0x5d63_10_regions :: state_pred where
  \<open>P_0x5d63_10_regions \<sigma> \<equiv> \<exists>regions. P_0x5d63_10_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x5d72_10 :: state_pred where
  \<open>Q_0x5d72_10 \<sigma> \<equiv> RIP \<sigma> = 0x5d72 \<and> RBX \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x48) \<and> RBP \<sigma> = RDI\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0\<close>
declare Q_0x5d72_10_def[Qs]

schematic_goal cow_read_0_5_0x5d63_0x5d6f_10[blocks]:
  assumes \<open>(P_0x5d63_10 && P_0x5d63_10_regions) \<sigma>\<close>
  shows \<open>exec_block 5 0x5d6f 10 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x5d72_10 ?\<sigma> \<and> block_usage P_0x5d63_10_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x5d63_10_def P_0x5d63_10_regions_def post: Q_0x5d72_10_def regionset: P_0x5d63_10_regions_set_def)

definition P_0x5d72_true_11 :: state_pred where
  \<open>P_0x5d72_true_11 \<sigma> \<equiv> RIP \<sigma> = 0x5d72 \<and> RBX \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x48) \<and> RBP \<sigma> = RDI\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0\<close>
declare P_0x5d72_true_11_def[Ps]

definition P_0x5d72_true_11_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x5d72_true_11_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((RDI\<^sub>0::64 word) + 0x40), 8),
    (2, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x30), 8)
  }\<close>

definition P_0x5d72_true_11_regions :: state_pred where
  \<open>P_0x5d72_true_11_regions \<sigma> \<equiv> \<exists>regions. P_0x5d72_true_11_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x5c60_11 :: state_pred where
  \<open>Q_0x5c60_11 \<sigma> \<equiv> RIP \<sigma> = 0x5c60 \<and> RBX \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x48) \<and> RBP \<sigma> = RDI\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0\<close>
declare Q_0x5c60_11_def[Qs]

schematic_goal cow_read_0_1_0x5d72_0x5d72_11[blocks]:
  assumes \<open>(P_0x5d72_true_11 && P_0x5d72_true_11_regions && jg) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x5d72 11 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x5c60_11 ?\<sigma> \<and> block_usage P_0x5d72_true_11_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x5d72_true_11_def P_0x5d72_true_11_regions_def post: Q_0x5c60_11_def regionset: P_0x5d72_true_11_regions_set_def)

definition P_0x5d72_false_12 :: state_pred where
  \<open>P_0x5d72_false_12 \<sigma> \<equiv> RIP \<sigma> = 0x5d72 \<and> RBX \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x48) \<and> RBP \<sigma> = RDI\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0\<close>
declare P_0x5d72_false_12_def[Ps]

definition P_0x5d72_false_12_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x5d72_false_12_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((RDI\<^sub>0::64 word) + 0x40), 8),
    (2, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x30), 8)
  }\<close>

definition P_0x5d72_false_12_regions :: state_pred where
  \<open>P_0x5d72_false_12_regions \<sigma> \<equiv> \<exists>regions. P_0x5d72_false_12_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x5d78_12 :: state_pred where
  \<open>Q_0x5d78_12 \<sigma> \<equiv> RIP \<sigma> = 0x5d78 \<and> RBX \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x48) \<and> RBP \<sigma> = RDI\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0\<close>
declare Q_0x5d78_12_def[Qs]

schematic_goal cow_read_0_1_0x5d72_0x5d72_12[blocks]:
  assumes \<open>(P_0x5d72_false_12 && P_0x5d72_false_12_regions && ! jg) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x5d72 12 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x5d78_12 ?\<sigma> \<and> block_usage P_0x5d72_false_12_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x5d72_false_12_def P_0x5d72_false_12_regions_def post: Q_0x5d78_12_def regionset: P_0x5d72_false_12_regions_set_def)

definition P_0x5da0_false_13 :: state_pred where
  \<open>P_0x5da0_false_13 \<sigma> \<equiv> RIP \<sigma> = 0x5da0 \<and> RBX \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> RCX \<sigma> = ucast ((\<langle>31,0\<rangle>R13 \<sigma>::32 word)) \<and> RDI \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x850),8]::64 word) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x48) \<and> RBP \<sigma> = RDI\<^sub>0 \<and> R12 \<sigma> = ucast ((\<langle>31,0\<rangle>R13 \<sigma>::32 word)) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x850),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x850),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0\<close>
declare P_0x5da0_false_13_def[Ps]

definition P_0x5da0_false_13_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x5da0_false_13_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((RDI\<^sub>0::64 word) + 0x40), 8),
    (2, ((RDI\<^sub>0::64 word) + 0x850), 8),
    (3, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x40), 8)
  }\<close>

definition P_0x5da0_false_13_regions :: state_pred where
  \<open>P_0x5da0_false_13_regions \<sigma> \<equiv> \<exists>regions. P_0x5da0_false_13_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x5db5_13 :: state_pred where
  \<open>Q_0x5db5_13 \<sigma> \<equiv> RIP \<sigma> = 0x5db5 \<and> RBX \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> RCX \<sigma> = (sextend (ucast (((\<langle>31,0\<rangle>R13 \<sigma>::32 word) << 9))) 32 64::64 word) \<and> RDX \<sigma> = (sextend (ucast (((\<langle>31,0\<rangle>R13 \<sigma>::32 word) << 9))) 32 64::64 word) \<and> RDI \<sigma> = R15 \<sigma> \<and> RSI \<sigma> = 0x0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x48) \<and> RBP \<sigma> = RDI\<^sub>0 \<and> R12 \<sigma> = ucast ((\<langle>31,0\<rangle>R13 \<sigma>::32 word)) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x850),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x850),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (sextend (ucast (((\<langle>31,0\<rangle>R13 \<sigma>::32 word) << 9))) 32 64::64 word)\<close>
declare Q_0x5db5_13_def[Qs]

schematic_goal cow_read_0_7_0x5da0_0x5db0_13[blocks]:
  assumes \<open>(P_0x5da0_false_13 && P_0x5da0_false_13_regions && ! !ZF) \<sigma>\<close>
  shows \<open>exec_block 7 0x5db0 13 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x5db5_13 ?\<sigma> \<and> block_usage P_0x5da0_false_13_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x5da0_false_13_def P_0x5da0_false_13_regions_def post: Q_0x5db5_13_def regionset: P_0x5da0_false_13_regions_set_def)

definition P_0x5db5_14 :: state_pred where
  \<open>P_0x5db5_14 \<sigma> \<equiv> RIP \<sigma> = 0x5db5 \<and> RBX \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> RCX \<sigma> = (sextend (ucast (((\<langle>31,0\<rangle>R13 \<sigma>::32 word) << 9))) 32 64::64 word) \<and> RDX \<sigma> = (sextend (ucast (((\<langle>31,0\<rangle>R13 \<sigma>::32 word) << 9))) 32 64::64 word) \<and> RDI \<sigma> = R15 \<sigma> \<and> RSI \<sigma> = 0x0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x48) \<and> RBP \<sigma> = RDI\<^sub>0 \<and> R12 \<sigma> = ucast ((\<langle>31,0\<rangle>R13 \<sigma>::32 word)) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x850),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x850),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (sextend (ucast (((\<langle>31,0\<rangle>R13 \<sigma>::32 word) << 9))) 32 64::64 word)\<close>
declare P_0x5db5_14_def[Ps]

definition P_0x5db5_14_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x5db5_14_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((RDI\<^sub>0::64 word) + 0x40), 8),
    (2, ((RDI\<^sub>0::64 word) + 0x850), 8),
    (3, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x40), 8),
    (11, ((RSP\<^sub>0::64 word) - 0x50), 8)
  }\<close>

definition P_0x5db5_14_regions :: state_pred where
  \<open>P_0x5db5_14_regions \<sigma> \<equiv> \<exists>regions. P_0x5db5_14_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_memset_addr_0x5db5_14 :: state_pred where
  \<open>Q_memset_addr_0x5db5_14 \<sigma> \<equiv> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x50) \<and> RIP \<sigma> = memset_addr \<and> RBX \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> RCX \<sigma> = (sextend (ucast (((\<langle>31,0\<rangle>R13 \<sigma>::32 word) << 9))) 32 64::64 word) \<and> RDX \<sigma> = (sextend (ucast (((\<langle>31,0\<rangle>R13 \<sigma>::32 word) << 9))) 32 64::64 word) \<and> RDI \<sigma> = R15 \<sigma> \<and> RSI \<sigma> = 0x0 \<and> RBP \<sigma> = RDI\<^sub>0 \<and> R12 \<sigma> = ucast ((\<langle>31,0\<rangle>R13 \<sigma>::32 word)) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x850),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x850),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (sextend (ucast (((\<langle>31,0\<rangle>R13 \<sigma>::32 word) << 9))) 32 64::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),8]::64 word) = 0x5dba\<close>
declare Q_memset_addr_0x5db5_14_def[Qs]

schematic_goal cow_read_0_1_0x5db5_0x5db5_14[blocks]:
  assumes \<open>(P_0x5db5_14 && P_0x5db5_14_regions) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x5db5 14 \<sigma> \<triangleq> ?\<sigma> \<and> Q_memset_addr_0x5db5_14 ?\<sigma> \<and> block_usage P_0x5db5_14_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x5db5_14_def P_0x5db5_14_regions_def post: Q_memset_addr_0x5db5_14_def regionset: P_0x5db5_14_regions_set_def)

definition P_0x5dba_15 :: state_pred where
  \<open>P_0x5dba_15 \<sigma> \<equiv> RIP \<sigma> = 0x5dba \<and> RBX \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> RCX \<sigma> = (sextend (ucast (((\<langle>31,0\<rangle>R13 \<sigma>::32 word) << 9))) 32 64::64 word) \<and> RDX \<sigma> = (sextend (ucast (((\<langle>31,0\<rangle>R13 \<sigma>::32 word) << 9))) 32 64::64 word) \<and> RDI \<sigma> = R15 \<sigma> \<and> RSI \<sigma> = 0x0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x48) \<and> RBP \<sigma> = RDI\<^sub>0 \<and> R12 \<sigma> = ucast ((\<langle>31,0\<rangle>R13 \<sigma>::32 word)) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x850),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x850),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (sextend (ucast (((\<langle>31,0\<rangle>R13 \<sigma>::32 word) << 9))) 32 64::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),8]::64 word) = 0x5dba\<close>
declare P_0x5dba_15_def[Ps]

definition P_0x5dba_15_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x5dba_15_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((RDI\<^sub>0::64 word) + 0x40), 8),
    (2, ((RDI\<^sub>0::64 word) + 0x850), 8),
    (3, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x40), 8),
    (11, ((RSP\<^sub>0::64 word) - 0x50), 8)
  }\<close>

definition P_0x5dba_15_regions :: state_pred where
  \<open>P_0x5dba_15_regions \<sigma> \<equiv> \<exists>regions. P_0x5dba_15_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x5d63_15 :: state_pred where
  \<open>Q_0x5d63_15 \<sigma> \<equiv> RIP \<sigma> = 0x5d63 \<and> RBX \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> RCX \<sigma> = (sextend (ucast (((\<langle>31,0\<rangle>R13 \<sigma>::32 word) << 9))) 32 64::64 word) \<and> RDX \<sigma> = (sextend (ucast (((\<langle>31,0\<rangle>R13 \<sigma>::32 word) << 9))) 32 64::64 word) \<and> RDI \<sigma> = R15 \<sigma> \<and> RSI \<sigma> = 0x0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x48) \<and> RBP \<sigma> = RDI\<^sub>0 \<and> R12 \<sigma> = ucast ((\<langle>31,0\<rangle>R13 \<sigma>::32 word)) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x850),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x850),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (sextend (ucast (((\<langle>31,0\<rangle>R13 \<sigma>::32 word) << 9))) 32 64::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),8]::64 word) = 0x5dba\<close>
declare Q_0x5d63_15_def[Qs]

schematic_goal cow_read_0_2_0x5dba_0x5dbf_15[blocks]:
  assumes \<open>(P_0x5dba_15 && P_0x5dba_15_regions) \<sigma>\<close>
  shows \<open>exec_block 2 0x5dbf 15 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x5d63_15 ?\<sigma> \<and> block_usage P_0x5dba_15_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x5dba_15_def P_0x5dba_15_regions_def post: Q_0x5d63_15_def regionset: P_0x5dba_15_regions_set_def)

definition P_0x5d63_16 :: state_pred where
  \<open>P_0x5d63_16 \<sigma> \<equiv> RIP \<sigma> = 0x5d63 \<and> RBX \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> RCX \<sigma> = (sextend (ucast (((\<langle>31,0\<rangle>R13 \<sigma>::32 word) << 9))) 32 64::64 word) \<and> RDX \<sigma> = (sextend (ucast (((\<langle>31,0\<rangle>R13 \<sigma>::32 word) << 9))) 32 64::64 word) \<and> RDI \<sigma> = R15 \<sigma> \<and> RSI \<sigma> = 0x0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x48) \<and> RBP \<sigma> = RDI\<^sub>0 \<and> R12 \<sigma> = ucast ((\<langle>31,0\<rangle>R13 \<sigma>::32 word)) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x850),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x850),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (sextend (ucast (((\<langle>31,0\<rangle>R13 \<sigma>::32 word) << 9))) 32 64::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),8]::64 word) = 0x5dba\<close>
declare P_0x5d63_16_def[Ps]

definition P_0x5d63_16_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x5d63_16_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((RDI\<^sub>0::64 word) + 0x40), 8),
    (2, ((RDI\<^sub>0::64 word) + 0x850), 8),
    (3, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x40), 8),
    (11, ((RSP\<^sub>0::64 word) - 0x50), 8)
  }\<close>

definition P_0x5d63_16_regions :: state_pred where
  \<open>P_0x5d63_16_regions \<sigma> \<equiv> \<exists>regions. P_0x5d63_16_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x5d72_16 :: state_pred where
  \<open>Q_0x5d72_16 \<sigma> \<equiv> RIP \<sigma> = 0x5d72 \<and> RBX \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x48) \<and> RBP \<sigma> = RDI\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0\<close>
declare Q_0x5d72_16_def[Qs]

schematic_goal cow_read_0_5_0x5d63_0x5d6f_16[blocks]:
  assumes \<open>(P_0x5d63_16 && P_0x5d63_16_regions) \<sigma>\<close>
  shows \<open>exec_block 5 0x5d6f 16 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x5d72_16 ?\<sigma> \<and> block_usage P_0x5d63_16_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x5d63_16_def P_0x5d63_16_regions_def post: Q_0x5d72_16_def regionset: P_0x5d63_16_regions_set_def)

definition P_0x5d72_true_17 :: state_pred where
  \<open>P_0x5d72_true_17 \<sigma> \<equiv> RIP \<sigma> = 0x5d72 \<and> RBX \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x48) \<and> RBP \<sigma> = RDI\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0\<close>
declare P_0x5d72_true_17_def[Ps]

definition P_0x5d72_true_17_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x5d72_true_17_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((RDI\<^sub>0::64 word) + 0x40), 8),
    (2, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x30), 8)
  }\<close>

definition P_0x5d72_true_17_regions :: state_pred where
  \<open>P_0x5d72_true_17_regions \<sigma> \<equiv> \<exists>regions. P_0x5d72_true_17_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x5c60_17 :: state_pred where
  \<open>Q_0x5c60_17 \<sigma> \<equiv> RIP \<sigma> = 0x5c60 \<and> RBX \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x48) \<and> RBP \<sigma> = RDI\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0\<close>
declare Q_0x5c60_17_def[Qs]

schematic_goal cow_read_0_1_0x5d72_0x5d72_17[blocks]:
  assumes \<open>(P_0x5d72_true_17 && P_0x5d72_true_17_regions && jg) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x5d72 17 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x5c60_17 ?\<sigma> \<and> block_usage P_0x5d72_true_17_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x5d72_true_17_def P_0x5d72_true_17_regions_def post: Q_0x5c60_17_def regionset: P_0x5d72_true_17_regions_set_def)

definition P_0x5d72_false_18 :: state_pred where
  \<open>P_0x5d72_false_18 \<sigma> \<equiv> RIP \<sigma> = 0x5d72 \<and> RBX \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x48) \<and> RBP \<sigma> = RDI\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0\<close>
declare P_0x5d72_false_18_def[Ps]

definition P_0x5d72_false_18_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x5d72_false_18_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((RDI\<^sub>0::64 word) + 0x40), 8),
    (2, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x30), 8)
  }\<close>

definition P_0x5d72_false_18_regions :: state_pred where
  \<open>P_0x5d72_false_18_regions \<sigma> \<equiv> \<exists>regions. P_0x5d72_false_18_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x5d78_18 :: state_pred where
  \<open>Q_0x5d78_18 \<sigma> \<equiv> RIP \<sigma> = 0x5d78 \<and> RBX \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x48) \<and> RBP \<sigma> = RDI\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0\<close>
declare Q_0x5d78_18_def[Qs]

schematic_goal cow_read_0_1_0x5d72_0x5d72_18[blocks]:
  assumes \<open>(P_0x5d72_false_18 && P_0x5d72_false_18_regions && ! jg) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x5d72 18 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x5d78_18 ?\<sigma> \<and> block_usage P_0x5d72_false_18_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x5d72_false_18_def P_0x5d72_false_18_regions_def post: Q_0x5d78_18_def regionset: P_0x5d72_false_18_regions_set_def)

definition P_0x5c67_false_19 :: state_pred where
  \<open>P_0x5c67_false_19 \<sigma> \<equiv> RIP \<sigma> = 0x5c67 \<and> RBX \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> RDI \<sigma> = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x48) \<and> RBP \<sigma> = RDI\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0\<close>
declare P_0x5c67_false_19_def[Ps]

definition P_0x5c67_false_19_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x5c67_false_19_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((RDI\<^sub>0::64 word) + 0x40), 8),
    (2, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8), 8),
    (3, (((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word)::64 word) + (\<langle>63,0\<rangle>((((if' (R14 \<sigma>::64 word) \<ge>s (ucast ((0x0::64 word))::64 word) then R14 \<sigma> else (((R14 \<sigma>::64 word) + 0x7)::64 word)) >>> 3)::64 word) * 0x1)::64 word)), Suc 0),
    (4, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x30), 8)
  }\<close>

definition P_0x5c67_false_19_regions :: state_pred where
  \<open>P_0x5c67_false_19_regions \<sigma> \<equiv> \<exists>regions. P_0x5c67_false_19_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x5c9e_19 :: state_pred where
  \<open>Q_0x5c9e_19 \<sigma> \<equiv> RIP \<sigma> = 0x5c9e \<and> RAX \<sigma> = ((R14 \<sigma> >>> 63) >> 61) \<and> RBX \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> RCX \<sigma> = ((ucast (((((\<langle>31,0\<rangle>((R14 \<sigma>::64 word) + (\<langle>63,0\<rangle>((((R14 \<sigma> >>> 63) >> 61)::64 word) * 0x1)::64 word))::32 word)::32 word) AND 0x7)::32 word))::64 word) - (((R14 \<sigma> >>> 63) >> 61)::64 word)) \<and> RDI \<sigma> = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word) \<and> RSI \<sigma> = ucast (((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word)::64 word) + (\<langle>63,0\<rangle>((((if' (R14 \<sigma>::64 word) \<ge>s (ucast ((0x0::64 word))::64 word) then R14 \<sigma> else (((R14 \<sigma>::64 word) + 0x7)::64 word)) >>> 3)::64 word) * 0x1)::64 word)),1]::8 word)::32 word) >>> unat (((\<langle>7,0\<rangle>((ucast (((((\<langle>31,0\<rangle>((R14 \<sigma>::64 word) + (\<langle>63,0\<rangle>((((R14 \<sigma> >>> 63) >> 61)::64 word) * 0x1)::64 word))::32 word)::32 word) AND 0x7)::32 word))::64 word) - (((R14 \<sigma> >>> 63) >> 61)::64 word))::8 word)::8 word)))::32 word) AND 0x1)) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x48) \<and> RBP \<sigma> = RDI\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word)::64 word) + (\<langle>63,0\<rangle>((((if' (R14 \<sigma>::64 word) \<ge>s (ucast ((0x0::64 word))::64 word) then R14 \<sigma> else (((R14 \<sigma>::64 word) + 0x7)::64 word)) >>> 3)::64 word) * 0x1)::64 word)),1]::8 word) = ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word)::64 word) + (\<langle>63,0\<rangle>((((if' (R14 \<sigma>::64 word) \<ge>s (ucast ((0x0::64 word))::64 word) then R14 \<sigma> else (((R14 \<sigma>::64 word) + 0x7)::64 word)) >>> 3)::64 word) * 0x1)::64 word)),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0\<close>
declare Q_0x5c9e_19_def[Qs]

schematic_goal cow_read_0_15_0x5c67_0x5c9a_19[blocks]:
  assumes \<open>(P_0x5c67_false_19 && P_0x5c67_false_19_regions && ! ZF) \<sigma>\<close>
  shows \<open>exec_block 15 0x5c9a 19 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x5c9e_19 ?\<sigma> \<and> block_usage P_0x5c67_false_19_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x5c67_false_19_def P_0x5c67_false_19_regions_def post: Q_0x5c9e_19_def regionset: P_0x5c67_false_19_regions_set_def)

definition P_0x5c9e_true_20 :: state_pred where
  \<open>P_0x5c9e_true_20 \<sigma> \<equiv> RIP \<sigma> = 0x5c9e \<and> RAX \<sigma> = ((R14 \<sigma> >>> 63) >> 61) \<and> RBX \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> RCX \<sigma> = ((ucast (((((\<langle>31,0\<rangle>((R14 \<sigma>::64 word) + (\<langle>63,0\<rangle>((((R14 \<sigma> >>> 63) >> 61)::64 word) * 0x1)::64 word))::32 word)::32 word) AND 0x7)::32 word))::64 word) - (((R14 \<sigma> >>> 63) >> 61)::64 word)) \<and> RDI \<sigma> = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word) \<and> RSI \<sigma> = ucast (((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word)::64 word) + (\<langle>63,0\<rangle>((((if' (R14 \<sigma>::64 word) \<ge>s (ucast ((0x0::64 word))::64 word) then R14 \<sigma> else (((R14 \<sigma>::64 word) + 0x7)::64 word)) >>> 3)::64 word) * 0x1)::64 word)),1]::8 word)::32 word) >>> unat (((\<langle>7,0\<rangle>((ucast (((((\<langle>31,0\<rangle>((R14 \<sigma>::64 word) + (\<langle>63,0\<rangle>((((R14 \<sigma> >>> 63) >> 61)::64 word) * 0x1)::64 word))::32 word)::32 word) AND 0x7)::32 word))::64 word) - (((R14 \<sigma> >>> 63) >> 61)::64 word))::8 word)::8 word)))::32 word) AND 0x1)) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x48) \<and> RBP \<sigma> = RDI\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word)::64 word) + (\<langle>63,0\<rangle>((((if' (R14 \<sigma>::64 word) \<ge>s (ucast ((0x0::64 word))::64 word) then R14 \<sigma> else (((R14 \<sigma>::64 word) + 0x7)::64 word)) >>> 3)::64 word) * 0x1)::64 word)),1]::8 word) = ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word)::64 word) + (\<langle>63,0\<rangle>((((if' (R14 \<sigma>::64 word) \<ge>s (ucast ((0x0::64 word))::64 word) then R14 \<sigma> else (((R14 \<sigma>::64 word) + 0x7)::64 word)) >>> 3)::64 word) * 0x1)::64 word)),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0\<close>
declare P_0x5c9e_true_20_def[Ps]

definition P_0x5c9e_true_20_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x5c9e_true_20_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((RDI\<^sub>0::64 word) + 0x40), 8),
    (2, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8), 8),
    (3, (((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word)::64 word) + (\<langle>63,0\<rangle>((((if' (R14 \<sigma>::64 word) \<ge>s (ucast ((0x0::64 word))::64 word) then R14 \<sigma> else (((R14 \<sigma>::64 word) + 0x7)::64 word)) >>> 3)::64 word) * 0x1)::64 word)), Suc 0),
    (4, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x30), 8)
  }\<close>

definition P_0x5c9e_true_20_regions :: state_pred where
  \<open>P_0x5c9e_true_20_regions \<sigma> \<equiv> \<exists>regions. P_0x5c9e_true_20_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x5d30_20 :: state_pred where
  \<open>Q_0x5d30_20 \<sigma> \<equiv> RIP \<sigma> = 0x5d30 \<and> RBX \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> RDI \<sigma> = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word) \<and> RSI \<sigma> = ucast (((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word)::64 word) + (\<langle>63,0\<rangle>((((if' (R14 \<sigma>::64 word) \<ge>s (ucast ((0x0::64 word))::64 word) then R14 \<sigma> else (((R14 \<sigma>::64 word) + 0x7)::64 word)) >>> 3)::64 word) * 0x1)::64 word)),1]::8 word)::32 word) >>> unat (((\<langle>7,0\<rangle>((ucast (((((\<langle>31,0\<rangle>((R14 \<sigma>::64 word) + (\<langle>63,0\<rangle>((((R14 \<sigma> >>> 63) >> 61)::64 word) * 0x1)::64 word))::32 word)::32 word) AND 0x7)::32 word))::64 word) - (((R14 \<sigma> >>> 63) >> 61)::64 word))::8 word)::8 word)))::32 word) AND 0x1)) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x48) \<and> RBP \<sigma> = RDI\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word)::64 word) + (\<langle>63,0\<rangle>((((if' (R14 \<sigma>::64 word) \<ge>s (ucast ((0x0::64 word))::64 word) then R14 \<sigma> else (((R14 \<sigma>::64 word) + 0x7)::64 word)) >>> 3)::64 word) * 0x1)::64 word)),1]::8 word) = ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word)::64 word) + (\<langle>63,0\<rangle>((((if' (R14 \<sigma>::64 word) \<ge>s (ucast ((0x0::64 word))::64 word) then R14 \<sigma> else (((R14 \<sigma>::64 word) + 0x7)::64 word)) >>> 3)::64 word) * 0x1)::64 word)),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0\<close>
declare Q_0x5d30_20_def[Qs]

schematic_goal cow_read_0_3_0x5c9e_0x5e26_20[blocks]:
  assumes \<open>(P_0x5c9e_true_20 && P_0x5c9e_true_20_regions && ZF) \<sigma>\<close>
  shows \<open>exec_block 3 0x5e26 20 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x5d30_20 ?\<sigma> \<and> block_usage P_0x5c9e_true_20_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x5c9e_true_20_def P_0x5c9e_true_20_regions_def post: Q_0x5d30_20_def regionset: P_0x5c9e_true_20_regions_set_def)

definition P_0x5c9e_false_21 :: state_pred where
  \<open>P_0x5c9e_false_21 \<sigma> \<equiv> RIP \<sigma> = 0x5c9e \<and> RAX \<sigma> = ((R14 \<sigma> >>> 63) >> 61) \<and> RBX \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> RCX \<sigma> = ((ucast (((((\<langle>31,0\<rangle>((R14 \<sigma>::64 word) + (\<langle>63,0\<rangle>((((R14 \<sigma> >>> 63) >> 61)::64 word) * 0x1)::64 word))::32 word)::32 word) AND 0x7)::32 word))::64 word) - (((R14 \<sigma> >>> 63) >> 61)::64 word)) \<and> RDI \<sigma> = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word) \<and> RSI \<sigma> = ucast (((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word)::64 word) + (\<langle>63,0\<rangle>((((if' (R14 \<sigma>::64 word) \<ge>s (ucast ((0x0::64 word))::64 word) then R14 \<sigma> else (((R14 \<sigma>::64 word) + 0x7)::64 word)) >>> 3)::64 word) * 0x1)::64 word)),1]::8 word)::32 word) >>> unat (((\<langle>7,0\<rangle>((ucast (((((\<langle>31,0\<rangle>((R14 \<sigma>::64 word) + (\<langle>63,0\<rangle>((((R14 \<sigma> >>> 63) >> 61)::64 word) * 0x1)::64 word))::32 word)::32 word) AND 0x7)::32 word))::64 word) - (((R14 \<sigma> >>> 63) >> 61)::64 word))::8 word)::8 word)))::32 word) AND 0x1)) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x48) \<and> RBP \<sigma> = RDI\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word)::64 word) + (\<langle>63,0\<rangle>((((if' (R14 \<sigma>::64 word) \<ge>s (ucast ((0x0::64 word))::64 word) then R14 \<sigma> else (((R14 \<sigma>::64 word) + 0x7)::64 word)) >>> 3)::64 word) * 0x1)::64 word)),1]::8 word) = ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word)::64 word) + (\<langle>63,0\<rangle>((((if' (R14 \<sigma>::64 word) \<ge>s (ucast ((0x0::64 word))::64 word) then R14 \<sigma> else (((R14 \<sigma>::64 word) + 0x7)::64 word)) >>> 3)::64 word) * 0x1)::64 word)),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0\<close>
declare P_0x5c9e_false_21_def[Ps]

definition P_0x5c9e_false_21_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x5c9e_false_21_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((RDI\<^sub>0::64 word) + 0x40), 8),
    (2, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8), 8),
    (3, (((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word)::64 word) + (\<langle>63,0\<rangle>((((if' (R14 \<sigma>::64 word) \<ge>s (ucast ((0x0::64 word))::64 word) then R14 \<sigma> else (((R14 \<sigma>::64 word) + 0x7)::64 word)) >>> 3)::64 word) * 0x1)::64 word)), Suc 0),
    (4, (((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word)::64 word) + (\<langle>63,0\<rangle>((((if' (((R14 \<sigma>::64 word) + 0x1)::64 word) \<ge>s (ucast ((0x0::64 word))::64 word) then ((R14 \<sigma>::64 word) + 0x1) else (((R14 \<sigma>::64 word) + 0x8)::64 word)) >>> 3)::64 word) * 0x1)::64 word)), Suc 0),
    (5, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x30), 8)
  }\<close>

definition P_0x5c9e_false_21_regions :: state_pred where
  \<open>P_0x5c9e_false_21_regions \<sigma> \<equiv> \<exists>regions. P_0x5c9e_false_21_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x5cd7_21 :: state_pred where
  \<open>Q_0x5cd7_21 \<sigma> \<equiv> RIP \<sigma> = 0x5cd7 \<and> RAX \<sigma> = ((R14 \<sigma>::64 word) + 0x1) \<and> RBX \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> RCX \<sigma> = ((ucast (((((\<langle>31,0\<rangle>((((R14 \<sigma>::64 word) + (\<langle>63,0\<rangle>((((((R14 \<sigma>::64 word) + 0x1) >>> 63) >> 61)::64 word) * 0x1)::64 word))::64 word) + 0x1)::32 word)::32 word) AND 0x7)::32 word))::64 word) - (((((R14 \<sigma>::64 word) + 0x1) >>> 63) >> 61)::64 word)) \<and> RDX \<sigma> = ucast (((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word)::64 word) + (\<langle>63,0\<rangle>((((if' (((R14 \<sigma>::64 word) + 0x1)::64 word) \<ge>s (ucast ((0x0::64 word))::64 word) then ((R14 \<sigma>::64 word) + 0x1) else (((R14 \<sigma>::64 word) + 0x8)::64 word)) >>> 3)::64 word) * 0x1)::64 word)),1]::8 word)::32 word) >>> unat (((\<langle>7,0\<rangle>((ucast (((((\<langle>31,0\<rangle>((((R14 \<sigma>::64 word) + (\<langle>63,0\<rangle>((((((R14 \<sigma>::64 word) + 0x1) >>> 63) >> 61)::64 word) * 0x1)::64 word))::64 word) + 0x1)::32 word)::32 word) AND 0x7)::32 word))::64 word) - (((((R14 \<sigma>::64 word) + 0x1) >>> 63) >> 61)::64 word))::8 word)::8 word)))::32 word) AND 0x1)) \<and> RDI \<sigma> = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word) \<and> RSI \<sigma> = ucast (((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word)::64 word) + (\<langle>63,0\<rangle>((((if' (R14 \<sigma>::64 word) \<ge>s (ucast ((0x0::64 word))::64 word) then R14 \<sigma> else (((R14 \<sigma>::64 word) + 0x7)::64 word)) >>> 3)::64 word) * 0x1)::64 word)),1]::8 word)::32 word) >>> unat (((\<langle>7,0\<rangle>((ucast (((((\<langle>31,0\<rangle>((R14 \<sigma>::64 word) + (\<langle>63,0\<rangle>((((R14 \<sigma> >>> 63) >> 61)::64 word) * 0x1)::64 word))::32 word)::32 word) AND 0x7)::32 word))::64 word) - (((R14 \<sigma> >>> 63) >> 61)::64 word))::8 word)::8 word)))::32 word) AND 0x1)) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x48) \<and> RBP \<sigma> = RDI\<^sub>0 \<and> R8 \<sigma> = ((((R14 \<sigma>::64 word) + 0x1) >>> 63) >> 61) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word)::64 word) + (\<langle>63,0\<rangle>((((if' (R14 \<sigma>::64 word) \<ge>s (ucast ((0x0::64 word))::64 word) then R14 \<sigma> else (((R14 \<sigma>::64 word) + 0x7)::64 word)) >>> 3)::64 word) * 0x1)::64 word)),1]::8 word) = ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word)::64 word) + (\<langle>63,0\<rangle>((((if' (R14 \<sigma>::64 word) \<ge>s (ucast ((0x0::64 word))::64 word) then R14 \<sigma> else (((R14 \<sigma>::64 word) + 0x7)::64 word)) >>> 3)::64 word) * 0x1)::64 word)),1]::8 word)) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word)::64 word) + (\<langle>63,0\<rangle>((((if' (((R14 \<sigma>::64 word) + 0x1)::64 word) \<ge>s (ucast ((0x0::64 word))::64 word) then ((R14 \<sigma>::64 word) + 0x1) else (((R14 \<sigma>::64 word) + 0x8)::64 word)) >>> 3)::64 word) * 0x1)::64 word)),1]::8 word) = ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word)::64 word) + (\<langle>63,0\<rangle>((((if' (((R14 \<sigma>::64 word) + 0x1)::64 word) \<ge>s (ucast ((0x0::64 word))::64 word) then ((R14 \<sigma>::64 word) + 0x1) else (((R14 \<sigma>::64 word) + 0x8)::64 word)) >>> 3)::64 word) * 0x1)::64 word)),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0\<close>
declare Q_0x5cd7_21_def[Qs]

schematic_goal cow_read_0_16_0x5c9e_0x5cd5_21[blocks]:
  assumes \<open>(P_0x5c9e_false_21 && P_0x5c9e_false_21_regions && ! ZF) \<sigma>\<close>
  shows \<open>exec_block 16 0x5cd5 21 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x5cd7_21 ?\<sigma> \<and> block_usage P_0x5c9e_false_21_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x5c9e_false_21_def P_0x5c9e_false_21_regions_def post: Q_0x5cd7_21_def regionset: P_0x5c9e_false_21_regions_set_def)

definition P_0x5cd7_true_22 :: state_pred where
  \<open>P_0x5cd7_true_22 \<sigma> \<equiv> RIP \<sigma> = 0x5cd7 \<and> RAX \<sigma> = ((R14 \<sigma>::64 word) + 0x1) \<and> RBX \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> RCX \<sigma> = ((ucast (((((\<langle>31,0\<rangle>((((R14 \<sigma>::64 word) + (\<langle>63,0\<rangle>((((((R14 \<sigma>::64 word) + 0x1) >>> 63) >> 61)::64 word) * 0x1)::64 word))::64 word) + 0x1)::32 word)::32 word) AND 0x7)::32 word))::64 word) - (((((R14 \<sigma>::64 word) + 0x1) >>> 63) >> 61)::64 word)) \<and> RDX \<sigma> = ucast (((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word)::64 word) + (\<langle>63,0\<rangle>((((if' (((R14 \<sigma>::64 word) + 0x1)::64 word) \<ge>s (ucast ((0x0::64 word))::64 word) then ((R14 \<sigma>::64 word) + 0x1) else (((R14 \<sigma>::64 word) + 0x8)::64 word)) >>> 3)::64 word) * 0x1)::64 word)),1]::8 word)::32 word) >>> unat (((\<langle>7,0\<rangle>((ucast (((((\<langle>31,0\<rangle>((((R14 \<sigma>::64 word) + (\<langle>63,0\<rangle>((((((R14 \<sigma>::64 word) + 0x1) >>> 63) >> 61)::64 word) * 0x1)::64 word))::64 word) + 0x1)::32 word)::32 word) AND 0x7)::32 word))::64 word) - (((((R14 \<sigma>::64 word) + 0x1) >>> 63) >> 61)::64 word))::8 word)::8 word)))::32 word) AND 0x1)) \<and> RDI \<sigma> = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word) \<and> RSI \<sigma> = ucast (((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word)::64 word) + (\<langle>63,0\<rangle>((((if' (R14 \<sigma>::64 word) \<ge>s (ucast ((0x0::64 word))::64 word) then R14 \<sigma> else (((R14 \<sigma>::64 word) + 0x7)::64 word)) >>> 3)::64 word) * 0x1)::64 word)),1]::8 word)::32 word) >>> unat (((\<langle>7,0\<rangle>((ucast (((((\<langle>31,0\<rangle>((R14 \<sigma>::64 word) + (\<langle>63,0\<rangle>((((R14 \<sigma> >>> 63) >> 61)::64 word) * 0x1)::64 word))::32 word)::32 word) AND 0x7)::32 word))::64 word) - (((R14 \<sigma> >>> 63) >> 61)::64 word))::8 word)::8 word)))::32 word) AND 0x1)) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x48) \<and> RBP \<sigma> = RDI\<^sub>0 \<and> R8 \<sigma> = ((((R14 \<sigma>::64 word) + 0x1) >>> 63) >> 61) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word)::64 word) + (\<langle>63,0\<rangle>((((if' (R14 \<sigma>::64 word) \<ge>s (ucast ((0x0::64 word))::64 word) then R14 \<sigma> else (((R14 \<sigma>::64 word) + 0x7)::64 word)) >>> 3)::64 word) * 0x1)::64 word)),1]::8 word) = ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word)::64 word) + (\<langle>63,0\<rangle>((((if' (R14 \<sigma>::64 word) \<ge>s (ucast ((0x0::64 word))::64 word) then R14 \<sigma> else (((R14 \<sigma>::64 word) + 0x7)::64 word)) >>> 3)::64 word) * 0x1)::64 word)),1]::8 word)) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word)::64 word) + (\<langle>63,0\<rangle>((((if' (((R14 \<sigma>::64 word) + 0x1)::64 word) \<ge>s (ucast ((0x0::64 word))::64 word) then ((R14 \<sigma>::64 word) + 0x1) else (((R14 \<sigma>::64 word) + 0x8)::64 word)) >>> 3)::64 word) * 0x1)::64 word)),1]::8 word) = ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word)::64 word) + (\<langle>63,0\<rangle>((((if' (((R14 \<sigma>::64 word) + 0x1)::64 word) \<ge>s (ucast ((0x0::64 word))::64 word) then ((R14 \<sigma>::64 word) + 0x1) else (((R14 \<sigma>::64 word) + 0x8)::64 word)) >>> 3)::64 word) * 0x1)::64 word)),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0\<close>
declare P_0x5cd7_true_22_def[Ps]

definition P_0x5cd7_true_22_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x5cd7_true_22_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((RDI\<^sub>0::64 word) + 0x40), 8),
    (2, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8), 8),
    (3, (((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word)::64 word) + (\<langle>63,0\<rangle>((((if' (R14 \<sigma>::64 word) \<ge>s (ucast ((0x0::64 word))::64 word) then R14 \<sigma> else (((R14 \<sigma>::64 word) + 0x7)::64 word)) >>> 3)::64 word) * 0x1)::64 word)), Suc 0),
    (4, (((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word)::64 word) + (\<langle>63,0\<rangle>((((if' (((R14 \<sigma>::64 word) + 0x1)::64 word) \<ge>s (ucast ((0x0::64 word))::64 word) then ((R14 \<sigma>::64 word) + 0x1) else (((R14 \<sigma>::64 word) + 0x8)::64 word)) >>> 3)::64 word) * 0x1)::64 word)), Suc 0),
    (5, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x30), 8)
  }\<close>

definition P_0x5cd7_true_22_regions :: state_pred where
  \<open>P_0x5cd7_true_22_regions \<sigma> \<equiv> \<exists>regions. P_0x5cd7_true_22_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x5d30_22 :: state_pred where
  \<open>Q_0x5d30_22 \<sigma> \<equiv> RIP \<sigma> = 0x5d30 \<and> RBX \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> RDI \<sigma> = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word) \<and> RSI \<sigma> = ucast (((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word)::64 word) + (\<langle>63,0\<rangle>((((if' (R14 \<sigma>::64 word) \<ge>s (ucast ((0x0::64 word))::64 word) then R14 \<sigma> else (((R14 \<sigma>::64 word) + 0x7)::64 word)) >>> 3)::64 word) * 0x1)::64 word)),1]::8 word)::32 word) >>> unat (((\<langle>7,0\<rangle>((ucast (((((\<langle>31,0\<rangle>((R14 \<sigma>::64 word) + (\<langle>63,0\<rangle>((((R14 \<sigma> >>> 63) >> 61)::64 word) * 0x1)::64 word))::32 word)::32 word) AND 0x7)::32 word))::64 word) - (((R14 \<sigma> >>> 63) >> 61)::64 word))::8 word)::8 word)))::32 word) AND 0x1)) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x48) \<and> RBP \<sigma> = RDI\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word)::64 word) + (\<langle>63,0\<rangle>((((if' (R14 \<sigma>::64 word) \<ge>s (ucast ((0x0::64 word))::64 word) then R14 \<sigma> else (((R14 \<sigma>::64 word) + 0x7)::64 word)) >>> 3)::64 word) * 0x1)::64 word)),1]::8 word) = ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word)::64 word) + (\<langle>63,0\<rangle>((((if' (R14 \<sigma>::64 word) \<ge>s (ucast ((0x0::64 word))::64 word) then R14 \<sigma> else (((R14 \<sigma>::64 word) + 0x7)::64 word)) >>> 3)::64 word) * 0x1)::64 word)),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0\<close>
declare Q_0x5d30_22_def[Qs]

schematic_goal cow_read_0_3_0x5cd7_0x5e26_22[blocks]:
  assumes \<open>(P_0x5cd7_true_22 && P_0x5cd7_true_22_regions && !ZF) \<sigma>\<close>
  shows \<open>exec_block 3 0x5e26 22 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x5d30_22 ?\<sigma> \<and> block_usage P_0x5cd7_true_22_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x5cd7_true_22_def P_0x5cd7_true_22_regions_def post: Q_0x5d30_22_def regionset: P_0x5cd7_true_22_regions_set_def)

definition P_0x5cd7_false_23 :: state_pred where
  \<open>P_0x5cd7_false_23 \<sigma> \<equiv> RIP \<sigma> = 0x5cd7 \<and> RAX \<sigma> = ((R14 \<sigma>::64 word) + 0x1) \<and> RBX \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> RCX \<sigma> = ((ucast (((((\<langle>31,0\<rangle>((((R14 \<sigma>::64 word) + (\<langle>63,0\<rangle>((((((R14 \<sigma>::64 word) + 0x1) >>> 63) >> 61)::64 word) * 0x1)::64 word))::64 word) + 0x1)::32 word)::32 word) AND 0x7)::32 word))::64 word) - (((((R14 \<sigma>::64 word) + 0x1) >>> 63) >> 61)::64 word)) \<and> RDX \<sigma> = ucast (((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word)::64 word) + (\<langle>63,0\<rangle>((((if' (((R14 \<sigma>::64 word) + 0x1)::64 word) \<ge>s (ucast ((0x0::64 word))::64 word) then ((R14 \<sigma>::64 word) + 0x1) else (((R14 \<sigma>::64 word) + 0x8)::64 word)) >>> 3)::64 word) * 0x1)::64 word)),1]::8 word)::32 word) >>> unat (((\<langle>7,0\<rangle>((ucast (((((\<langle>31,0\<rangle>((((R14 \<sigma>::64 word) + (\<langle>63,0\<rangle>((((((R14 \<sigma>::64 word) + 0x1) >>> 63) >> 61)::64 word) * 0x1)::64 word))::64 word) + 0x1)::32 word)::32 word) AND 0x7)::32 word))::64 word) - (((((R14 \<sigma>::64 word) + 0x1) >>> 63) >> 61)::64 word))::8 word)::8 word)))::32 word) AND 0x1)) \<and> RDI \<sigma> = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word) \<and> RSI \<sigma> = ucast (((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word)::64 word) + (\<langle>63,0\<rangle>((((if' (R14 \<sigma>::64 word) \<ge>s (ucast ((0x0::64 word))::64 word) then R14 \<sigma> else (((R14 \<sigma>::64 word) + 0x7)::64 word)) >>> 3)::64 word) * 0x1)::64 word)),1]::8 word)::32 word) >>> unat (((\<langle>7,0\<rangle>((ucast (((((\<langle>31,0\<rangle>((R14 \<sigma>::64 word) + (\<langle>63,0\<rangle>((((R14 \<sigma> >>> 63) >> 61)::64 word) * 0x1)::64 word))::32 word)::32 word) AND 0x7)::32 word))::64 word) - (((R14 \<sigma> >>> 63) >> 61)::64 word))::8 word)::8 word)))::32 word) AND 0x1)) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x48) \<and> RBP \<sigma> = RDI\<^sub>0 \<and> R8 \<sigma> = ((((R14 \<sigma>::64 word) + 0x1) >>> 63) >> 61) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word)::64 word) + (\<langle>63,0\<rangle>((((if' (R14 \<sigma>::64 word) \<ge>s (ucast ((0x0::64 word))::64 word) then R14 \<sigma> else (((R14 \<sigma>::64 word) + 0x7)::64 word)) >>> 3)::64 word) * 0x1)::64 word)),1]::8 word) = ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word)::64 word) + (\<langle>63,0\<rangle>((((if' (R14 \<sigma>::64 word) \<ge>s (ucast ((0x0::64 word))::64 word) then R14 \<sigma> else (((R14 \<sigma>::64 word) + 0x7)::64 word)) >>> 3)::64 word) * 0x1)::64 word)),1]::8 word)) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word)::64 word) + (\<langle>63,0\<rangle>((((if' (((R14 \<sigma>::64 word) + 0x1)::64 word) \<ge>s (ucast ((0x0::64 word))::64 word) then ((R14 \<sigma>::64 word) + 0x1) else (((R14 \<sigma>::64 word) + 0x8)::64 word)) >>> 3)::64 word) * 0x1)::64 word)),1]::8 word) = ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word)::64 word) + (\<langle>63,0\<rangle>((((if' (((R14 \<sigma>::64 word) + 0x1)::64 word) \<ge>s (ucast ((0x0::64 word))::64 word) then ((R14 \<sigma>::64 word) + 0x1) else (((R14 \<sigma>::64 word) + 0x8)::64 word)) >>> 3)::64 word) * 0x1)::64 word)),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0\<close>
declare P_0x5cd7_false_23_def[Ps]

definition P_0x5cd7_false_23_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x5cd7_false_23_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((RDI\<^sub>0::64 word) + 0x40), 8),
    (2, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8), 8),
    (3, (((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word)::64 word) + (\<langle>63,0\<rangle>((((if' (R14 \<sigma>::64 word) \<ge>s (ucast ((0x0::64 word))::64 word) then R14 \<sigma> else (((R14 \<sigma>::64 word) + 0x7)::64 word)) >>> 3)::64 word) * 0x1)::64 word)), Suc 0),
    (4, (((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word)::64 word) + (\<langle>63,0\<rangle>((((if' (((R14 \<sigma>::64 word) + 0x1)::64 word) \<ge>s (ucast ((0x0::64 word))::64 word) then ((R14 \<sigma>::64 word) + 0x1) else (((R14 \<sigma>::64 word) + 0x8)::64 word)) >>> 3)::64 word) * 0x1)::64 word)), Suc 0),
    (5, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x30), 8)
  }\<close>

definition P_0x5cd7_false_23_regions :: state_pred where
  \<open>P_0x5cd7_false_23_regions \<sigma> \<equiv> \<exists>regions. P_0x5cd7_false_23_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x5d27_23 :: state_pred where
  \<open>Q_0x5d27_23 \<sigma> \<equiv> RIP \<sigma> = 0x5d27 \<and> RBX \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> RDI \<sigma> = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word) \<and> RSI \<sigma> = ucast (((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word)::64 word) + (\<langle>63,0\<rangle>((((if' (R14 \<sigma>::64 word) \<ge>s (ucast ((0x0::64 word))::64 word) then R14 \<sigma> else (((R14 \<sigma>::64 word) + 0x7)::64 word)) >>> 3)::64 word) * 0x1)::64 word)),1]::8 word)::32 word) >>> unat (((\<langle>7,0\<rangle>((ucast (((((\<langle>31,0\<rangle>((R14 \<sigma>::64 word) + (\<langle>63,0\<rangle>((((R14 \<sigma> >>> 63) >> 61)::64 word) * 0x1)::64 word))::32 word)::32 word) AND 0x7)::32 word))::64 word) - (((R14 \<sigma> >>> 63) >> 61)::64 word))::8 word)::8 word)))::32 word) AND 0x1)) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x48) \<and> RBP \<sigma> = RDI\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word)::64 word) + (\<langle>63,0\<rangle>((((if' (R14 \<sigma>::64 word) \<ge>s (ucast ((0x0::64 word))::64 word) then R14 \<sigma> else (((R14 \<sigma>::64 word) + 0x7)::64 word)) >>> 3)::64 word) * 0x1)::64 word)),1]::8 word) = ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word)::64 word) + (\<langle>63,0\<rangle>((((if' (R14 \<sigma>::64 word) \<ge>s (ucast ((0x0::64 word))::64 word) then R14 \<sigma> else (((R14 \<sigma>::64 word) + 0x7)::64 word)) >>> 3)::64 word) * 0x1)::64 word)),1]::8 word)) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word)::64 word) + (\<langle>63,0\<rangle>((((if' (((R14 \<sigma>::64 word) + 0x1)::64 word) \<ge>s (ucast ((0x0::64 word))::64 word) then ((R14 \<sigma>::64 word) + 0x1) else (((R14 \<sigma>::64 word) + 0x8)::64 word)) >>> 3)::64 word) * 0x1)::64 word)),1]::8 word) = ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word)::64 word) + (\<langle>63,0\<rangle>((((if' (((R14 \<sigma>::64 word) + 0x1)::64 word) \<ge>s (ucast ((0x0::64 word))::64 word) then ((R14 \<sigma>::64 word) + 0x1) else (((R14 \<sigma>::64 word) + 0x8)::64 word)) >>> 3)::64 word) * 0x1)::64 word)),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0\<close>
declare Q_0x5d27_23_def[Qs]

schematic_goal cow_read_0_4_0x5cd7_0x5ce7_23[blocks]:
  assumes \<open>(P_0x5cd7_false_23 && P_0x5cd7_false_23_regions && ! !ZF) \<sigma>\<close>
  shows \<open>exec_block 4 0x5ce7 23 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x5d27_23 ?\<sigma> \<and> block_usage P_0x5cd7_false_23_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x5cd7_false_23_def P_0x5cd7_false_23_regions_def post: Q_0x5d27_23_def regionset: P_0x5cd7_false_23_regions_set_def)

definition P_0x5d27_24 :: state_pred where
  \<open>P_0x5d27_24 \<sigma> \<equiv> RIP \<sigma> = 0x5d27 \<and> RBX \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> RDI \<sigma> = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word) \<and> RSI \<sigma> = ucast (((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word)::64 word) + (\<langle>63,0\<rangle>((((if' (R14 \<sigma>::64 word) \<ge>s (ucast ((0x0::64 word))::64 word) then R14 \<sigma> else (((R14 \<sigma>::64 word) + 0x7)::64 word)) >>> 3)::64 word) * 0x1)::64 word)),1]::8 word)::32 word) >>> unat (((\<langle>7,0\<rangle>((ucast (((((\<langle>31,0\<rangle>((R14 \<sigma>::64 word) + (\<langle>63,0\<rangle>((((R14 \<sigma> >>> 63) >> 61)::64 word) * 0x1)::64 word))::32 word)::32 word) AND 0x7)::32 word))::64 word) - (((R14 \<sigma> >>> 63) >> 61)::64 word))::8 word)::8 word)))::32 word) AND 0x1)) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x48) \<and> RBP \<sigma> = RDI\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word)::64 word) + (\<langle>63,0\<rangle>((((if' (R14 \<sigma>::64 word) \<ge>s (ucast ((0x0::64 word))::64 word) then R14 \<sigma> else (((R14 \<sigma>::64 word) + 0x7)::64 word)) >>> 3)::64 word) * 0x1)::64 word)),1]::8 word) = ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word)::64 word) + (\<langle>63,0\<rangle>((((if' (R14 \<sigma>::64 word) \<ge>s (ucast ((0x0::64 word))::64 word) then R14 \<sigma> else (((R14 \<sigma>::64 word) + 0x7)::64 word)) >>> 3)::64 word) * 0x1)::64 word)),1]::8 word)) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word)::64 word) + (\<langle>63,0\<rangle>((((if' (((R14 \<sigma>::64 word) + 0x1)::64 word) \<ge>s (ucast ((0x0::64 word))::64 word) then ((R14 \<sigma>::64 word) + 0x1) else (((R14 \<sigma>::64 word) + 0x8)::64 word)) >>> 3)::64 word) * 0x1)::64 word)),1]::8 word) = ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word)::64 word) + (\<langle>63,0\<rangle>((((if' (((R14 \<sigma>::64 word) + 0x1)::64 word) \<ge>s (ucast ((0x0::64 word))::64 word) then ((R14 \<sigma>::64 word) + 0x1) else (((R14 \<sigma>::64 word) + 0x8)::64 word)) >>> 3)::64 word) * 0x1)::64 word)),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0\<close>
declare P_0x5d27_24_def[Ps]

definition P_0x5d27_24_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x5d27_24_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((RDI\<^sub>0::64 word) + 0x40), 8),
    (2, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8), 8),
    (3, (((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word)::64 word) + (\<langle>63,0\<rangle>((((if' (R14 \<sigma>::64 word) \<ge>s (ucast ((0x0::64 word))::64 word) then R14 \<sigma> else (((R14 \<sigma>::64 word) + 0x7)::64 word)) >>> 3)::64 word) * 0x1)::64 word)), Suc 0),
    (4, (((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word)::64 word) + (\<langle>63,0\<rangle>((((if' (((R14 \<sigma>::64 word) + 0x1)::64 word) \<ge>s (ucast ((0x0::64 word))::64 word) then ((R14 \<sigma>::64 word) + 0x1) else (((R14 \<sigma>::64 word) + 0x8)::64 word)) >>> 3)::64 word) * 0x1)::64 word)), Suc 0),
    (5, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x30), 8)
  }\<close>

definition P_0x5d27_24_regions :: state_pred where
  \<open>P_0x5d27_24_regions \<sigma> \<equiv> \<exists>regions. P_0x5d27_24_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x5d2e_24 :: state_pred where
  \<open>Q_0x5d2e_24 \<sigma> \<equiv> RIP \<sigma> = 0x5d2e \<and> RBX \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> RDI \<sigma> = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word) \<and> RSI \<sigma> = ucast (((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word)::64 word) + (\<langle>63,0\<rangle>((((if' (R14 \<sigma>::64 word) \<ge>s (ucast ((0x0::64 word))::64 word) then R14 \<sigma> else (((R14 \<sigma>::64 word) + 0x7)::64 word)) >>> 3)::64 word) * 0x1)::64 word)),1]::8 word)::32 word) >>> unat (((\<langle>7,0\<rangle>((ucast (((((\<langle>31,0\<rangle>((R14 \<sigma>::64 word) + (\<langle>63,0\<rangle>((((R14 \<sigma> >>> 63) >> 61)::64 word) * 0x1)::64 word))::32 word)::32 word) AND 0x7)::32 word))::64 word) - (((R14 \<sigma> >>> 63) >> 61)::64 word))::8 word)::8 word)))::32 word) AND 0x1)) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x48) \<and> RBP \<sigma> = RDI\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word)::64 word) + (\<langle>63,0\<rangle>((((if' (R14 \<sigma>::64 word) \<ge>s (ucast ((0x0::64 word))::64 word) then R14 \<sigma> else (((R14 \<sigma>::64 word) + 0x7)::64 word)) >>> 3)::64 word) * 0x1)::64 word)),1]::8 word) = ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word)::64 word) + (\<langle>63,0\<rangle>((((if' (R14 \<sigma>::64 word) \<ge>s (ucast ((0x0::64 word))::64 word) then R14 \<sigma> else (((R14 \<sigma>::64 word) + 0x7)::64 word)) >>> 3)::64 word) * 0x1)::64 word)),1]::8 word)) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word)::64 word) + (\<langle>63,0\<rangle>((((if' (((R14 \<sigma>::64 word) + 0x1)::64 word) \<ge>s (ucast ((0x0::64 word))::64 word) then ((R14 \<sigma>::64 word) + 0x1) else (((R14 \<sigma>::64 word) + 0x8)::64 word)) >>> 3)::64 word) * 0x1)::64 word)),1]::8 word) = ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word)::64 word) + (\<langle>63,0\<rangle>((((if' (((R14 \<sigma>::64 word) + 0x1)::64 word) \<ge>s (ucast ((0x0::64 word))::64 word) then ((R14 \<sigma>::64 word) + 0x1) else (((R14 \<sigma>::64 word) + 0x8)::64 word)) >>> 3)::64 word) * 0x1)::64 word)),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0\<close>
declare Q_0x5d2e_24_def[Qs]

schematic_goal cow_read_0_2_0x5d27_0x5d2b_24[blocks]:
  assumes \<open>(P_0x5d27_24 && P_0x5d27_24_regions) \<sigma>\<close>
  shows \<open>exec_block 2 0x5d2b 24 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x5d2e_24 ?\<sigma> \<and> block_usage P_0x5d27_24_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x5d27_24_def P_0x5d27_24_regions_def post: Q_0x5d2e_24_def regionset: P_0x5d27_24_regions_set_def)

definition P_0x5d2e_true_25 :: state_pred where
  \<open>P_0x5d2e_true_25 \<sigma> \<equiv> RIP \<sigma> = 0x5d2e \<and> RBX \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> RDI \<sigma> = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word) \<and> RSI \<sigma> = ucast (((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word)::64 word) + (\<langle>63,0\<rangle>((((if' (R14 \<sigma>::64 word) \<ge>s (ucast ((0x0::64 word))::64 word) then R14 \<sigma> else (((R14 \<sigma>::64 word) + 0x7)::64 word)) >>> 3)::64 word) * 0x1)::64 word)),1]::8 word)::32 word) >>> unat (((\<langle>7,0\<rangle>((ucast (((((\<langle>31,0\<rangle>((R14 \<sigma>::64 word) + (\<langle>63,0\<rangle>((((R14 \<sigma> >>> 63) >> 61)::64 word) * 0x1)::64 word))::32 word)::32 word) AND 0x7)::32 word))::64 word) - (((R14 \<sigma> >>> 63) >> 61)::64 word))::8 word)::8 word)))::32 word) AND 0x1)) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x48) \<and> RBP \<sigma> = RDI\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word)::64 word) + (\<langle>63,0\<rangle>((((if' (R14 \<sigma>::64 word) \<ge>s (ucast ((0x0::64 word))::64 word) then R14 \<sigma> else (((R14 \<sigma>::64 word) + 0x7)::64 word)) >>> 3)::64 word) * 0x1)::64 word)),1]::8 word) = ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word)::64 word) + (\<langle>63,0\<rangle>((((if' (R14 \<sigma>::64 word) \<ge>s (ucast ((0x0::64 word))::64 word) then R14 \<sigma> else (((R14 \<sigma>::64 word) + 0x7)::64 word)) >>> 3)::64 word) * 0x1)::64 word)),1]::8 word)) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word)::64 word) + (\<langle>63,0\<rangle>((((if' (((R14 \<sigma>::64 word) + 0x1)::64 word) \<ge>s (ucast ((0x0::64 word))::64 word) then ((R14 \<sigma>::64 word) + 0x1) else (((R14 \<sigma>::64 word) + 0x8)::64 word)) >>> 3)::64 word) * 0x1)::64 word)),1]::8 word) = ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word)::64 word) + (\<langle>63,0\<rangle>((((if' (((R14 \<sigma>::64 word) + 0x1)::64 word) \<ge>s (ucast ((0x0::64 word))::64 word) then ((R14 \<sigma>::64 word) + 0x1) else (((R14 \<sigma>::64 word) + 0x8)::64 word)) >>> 3)::64 word) * 0x1)::64 word)),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0\<close>
declare P_0x5d2e_true_25_def[Ps]

definition P_0x5d2e_true_25_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x5d2e_true_25_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((RDI\<^sub>0::64 word) + 0x40), 8),
    (2, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8), 8),
    (3, (((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word)::64 word) + (\<langle>63,0\<rangle>((((if' (RDX \<sigma>::64 word) \<ge>s (ucast ((0x0::64 word))::64 word) then RDX \<sigma> else (((RDX \<sigma>::64 word) + 0x7)::64 word)) >>> 3)::64 word) * 0x1)::64 word)), Suc 0),
    (4, (((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word)::64 word) + (\<langle>63,0\<rangle>((((if' (R14 \<sigma>::64 word) \<ge>s (ucast ((0x0::64 word))::64 word) then R14 \<sigma> else (((R14 \<sigma>::64 word) + 0x7)::64 word)) >>> 3)::64 word) * 0x1)::64 word)), Suc 0),
    (5, (((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word)::64 word) + (\<langle>63,0\<rangle>((((if' (((R14 \<sigma>::64 word) + 0x1)::64 word) \<ge>s (ucast ((0x0::64 word))::64 word) then ((R14 \<sigma>::64 word) + 0x1) else (((R14 \<sigma>::64 word) + 0x8)::64 word)) >>> 3)::64 word) * 0x1)::64 word)), Suc 0),
    (6, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (11, ((RSP\<^sub>0::64 word) - 0x30), 8)
  }\<close>

definition P_0x5d2e_true_25_regions :: state_pred where
  \<open>P_0x5d2e_true_25_regions \<sigma> \<equiv> \<exists>regions. P_0x5d2e_true_25_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x5d25_25 :: state_pred where
  \<open>Q_0x5d25_25 \<sigma> \<equiv> RIP \<sigma> = 0x5d25 \<and> RBX \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> RDI \<sigma> = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word) \<and> RSI \<sigma> = ucast (((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word)::64 word) + (\<langle>63,0\<rangle>((((if' (R14 \<sigma>::64 word) \<ge>s (ucast ((0x0::64 word))::64 word) then R14 \<sigma> else (((R14 \<sigma>::64 word) + 0x7)::64 word)) >>> 3)::64 word) * 0x1)::64 word)),1]::8 word)::32 word) >>> unat (((\<langle>7,0\<rangle>((ucast (((((\<langle>31,0\<rangle>((R14 \<sigma>::64 word) + (\<langle>63,0\<rangle>((((R14 \<sigma> >>> 63) >> 61)::64 word) * 0x1)::64 word))::32 word)::32 word) AND 0x7)::32 word))::64 word) - (((R14 \<sigma> >>> 63) >> 61)::64 word))::8 word)::8 word)))::32 word) AND 0x1)) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x48) \<and> RBP \<sigma> = RDI\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word)::64 word) + (\<langle>63,0\<rangle>((((if' (R14 \<sigma>::64 word) \<ge>s (ucast ((0x0::64 word))::64 word) then R14 \<sigma> else (((R14 \<sigma>::64 word) + 0x7)::64 word)) >>> 3)::64 word) * 0x1)::64 word)),1]::8 word) = ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word)::64 word) + (\<langle>63,0\<rangle>((((if' (R14 \<sigma>::64 word) \<ge>s (ucast ((0x0::64 word))::64 word) then R14 \<sigma> else (((R14 \<sigma>::64 word) + 0x7)::64 word)) >>> 3)::64 word) * 0x1)::64 word)),1]::8 word)) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word)::64 word) + (\<langle>63,0\<rangle>((((if' (((R14 \<sigma>::64 word) + 0x1)::64 word) \<ge>s (ucast ((0x0::64 word))::64 word) then ((R14 \<sigma>::64 word) + 0x1) else (((R14 \<sigma>::64 word) + 0x8)::64 word)) >>> 3)::64 word) * 0x1)::64 word)),1]::8 word) = ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word)::64 word) + (\<langle>63,0\<rangle>((((if' (((R14 \<sigma>::64 word) + 0x1)::64 word) \<ge>s (ucast ((0x0::64 word))::64 word) then ((R14 \<sigma>::64 word) + 0x1) else (((R14 \<sigma>::64 word) + 0x8)::64 word)) >>> 3)::64 word) * 0x1)::64 word)),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0\<close>
declare Q_0x5d25_25_def[Qs]

schematic_goal cow_read_0_17_0x5d2e_0x5d23_25[blocks]:
  assumes \<open>(P_0x5d2e_true_25 && P_0x5d2e_true_25_regions && !ZF) \<sigma>\<close>
  shows \<open>exec_block 17 0x5d23 25 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x5d25_25 ?\<sigma> \<and> block_usage P_0x5d2e_true_25_regions_set \<sigma> ?\<sigma>\<close>
  apply (insert assms)
  apply (auto simp: pred_logic P_0x5d2e_true_25_def P_0x5d2e_true_25_regions_def P_0x5d2e_true_25_regions_set_def)
    apply step+
    apply (simp add: block_usage_def eq_def setcc_def cmovcc_def if'_then_else_def sub_sign_flag_def simp_rules Let'_def read_region'_def write_block'_def get'_def set'_def Q_0x5d25_25_def P_0x5d2e_true_25_regions_set_def)
   apply (simp add: block_usage_def eq_def setcc_def cmovcc_def if'_then_else_def sub_sign_flag_def simp_rules Let'_def read_region'_def write_block'_def get'_def set'_def Q_0x5d25_25_def P_0x5d2e_true_25_regions_set_def)
  apply (simp add: block_usage_def eq_def setcc_def cmovcc_def if'_then_else_def sub_sign_flag_def simp_rules Let'_def read_region'_def write_block'_def get'_def set'_def Q_0x5d25_25_def P_0x5d2e_true_25_regions_set_def)
  done

definition P_0x5d25_true_26 :: state_pred where
  \<open>P_0x5d25_true_26 \<sigma> \<equiv> RIP \<sigma> = 0x5d25 \<and> RBX \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> RDI \<sigma> = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word) \<and> RSI \<sigma> = ucast (((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word)::64 word) + (\<langle>63,0\<rangle>((((if' (R14 \<sigma>::64 word) \<ge>s (ucast ((0x0::64 word))::64 word) then R14 \<sigma> else (((R14 \<sigma>::64 word) + 0x7)::64 word)) >>> 3)::64 word) * 0x1)::64 word)),1]::8 word)::32 word) >>> unat (((\<langle>7,0\<rangle>((ucast (((((\<langle>31,0\<rangle>((R14 \<sigma>::64 word) + (\<langle>63,0\<rangle>((((R14 \<sigma> >>> 63) >> 61)::64 word) * 0x1)::64 word))::32 word)::32 word) AND 0x7)::32 word))::64 word) - (((R14 \<sigma> >>> 63) >> 61)::64 word))::8 word)::8 word)))::32 word) AND 0x1)) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x48) \<and> RBP \<sigma> = RDI\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word)::64 word) + (\<langle>63,0\<rangle>((((if' (R14 \<sigma>::64 word) \<ge>s (ucast ((0x0::64 word))::64 word) then R14 \<sigma> else (((R14 \<sigma>::64 word) + 0x7)::64 word)) >>> 3)::64 word) * 0x1)::64 word)),1]::8 word) = ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word)::64 word) + (\<langle>63,0\<rangle>((((if' (R14 \<sigma>::64 word) \<ge>s (ucast ((0x0::64 word))::64 word) then R14 \<sigma> else (((R14 \<sigma>::64 word) + 0x7)::64 word)) >>> 3)::64 word) * 0x1)::64 word)),1]::8 word)) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word)::64 word) + (\<langle>63,0\<rangle>((((if' (((R14 \<sigma>::64 word) + 0x1)::64 word) \<ge>s (ucast ((0x0::64 word))::64 word) then ((R14 \<sigma>::64 word) + 0x1) else (((R14 \<sigma>::64 word) + 0x8)::64 word)) >>> 3)::64 word) * 0x1)::64 word)),1]::8 word) = ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word)::64 word) + (\<langle>63,0\<rangle>((((if' (((R14 \<sigma>::64 word) + 0x1)::64 word) \<ge>s (ucast ((0x0::64 word))::64 word) then ((R14 \<sigma>::64 word) + 0x1) else (((R14 \<sigma>::64 word) + 0x8)::64 word)) >>> 3)::64 word) * 0x1)::64 word)),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0\<close>
declare P_0x5d25_true_26_def[Ps]

definition P_0x5d25_true_26_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x5d25_true_26_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((RDI\<^sub>0::64 word) + 0x40), 8),
    (2, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8), 8),
    (3, (((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word)::64 word) + (\<langle>63,0\<rangle>((((if' (R14 \<sigma>::64 word) \<ge>s (ucast ((0x0::64 word))::64 word) then R14 \<sigma> else (((R14 \<sigma>::64 word) + 0x7)::64 word)) >>> 3)::64 word) * 0x1)::64 word)), Suc 0),
    (4, (((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word)::64 word) + (\<langle>63,0\<rangle>((((if' (((R14 \<sigma>::64 word) + 0x1)::64 word) \<ge>s (ucast ((0x0::64 word))::64 word) then ((R14 \<sigma>::64 word) + 0x1) else (((R14 \<sigma>::64 word) + 0x8)::64 word)) >>> 3)::64 word) * 0x1)::64 word)), Suc 0),
    (5, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x30), 8)
  }\<close>

definition P_0x5d25_true_26_regions :: state_pred where
  \<open>P_0x5d25_true_26_regions \<sigma> \<equiv> \<exists>regions. P_0x5d25_true_26_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x5d30_26 :: state_pred where
  \<open>Q_0x5d30_26 \<sigma> \<equiv> RIP \<sigma> = 0x5d30 \<and> RBX \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> RDI \<sigma> = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word) \<and> RSI \<sigma> = ucast (((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word)::64 word) + (\<langle>63,0\<rangle>((((if' (R14 \<sigma>::64 word) \<ge>s (ucast ((0x0::64 word))::64 word) then R14 \<sigma> else (((R14 \<sigma>::64 word) + 0x7)::64 word)) >>> 3)::64 word) * 0x1)::64 word)),1]::8 word)::32 word) >>> unat (((\<langle>7,0\<rangle>((ucast (((((\<langle>31,0\<rangle>((R14 \<sigma>::64 word) + (\<langle>63,0\<rangle>((((R14 \<sigma> >>> 63) >> 61)::64 word) * 0x1)::64 word))::32 word)::32 word) AND 0x7)::32 word))::64 word) - (((R14 \<sigma> >>> 63) >> 61)::64 word))::8 word)::8 word)))::32 word) AND 0x1)) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x48) \<and> RBP \<sigma> = RDI\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word)::64 word) + (\<langle>63,0\<rangle>((((if' (R14 \<sigma>::64 word) \<ge>s (ucast ((0x0::64 word))::64 word) then R14 \<sigma> else (((R14 \<sigma>::64 word) + 0x7)::64 word)) >>> 3)::64 word) * 0x1)::64 word)),1]::8 word) = ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word)::64 word) + (\<langle>63,0\<rangle>((((if' (R14 \<sigma>::64 word) \<ge>s (ucast ((0x0::64 word))::64 word) then R14 \<sigma> else (((R14 \<sigma>::64 word) + 0x7)::64 word)) >>> 3)::64 word) * 0x1)::64 word)),1]::8 word)) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word)::64 word) + (\<langle>63,0\<rangle>((((if' (((R14 \<sigma>::64 word) + 0x1)::64 word) \<ge>s (ucast ((0x0::64 word))::64 word) then ((R14 \<sigma>::64 word) + 0x1) else (((R14 \<sigma>::64 word) + 0x8)::64 word)) >>> 3)::64 word) * 0x1)::64 word)),1]::8 word) = ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word)::64 word) + (\<langle>63,0\<rangle>((((if' (((R14 \<sigma>::64 word) + 0x1)::64 word) \<ge>s (ucast ((0x0::64 word))::64 word) then ((R14 \<sigma>::64 word) + 0x1) else (((R14 \<sigma>::64 word) + 0x8)::64 word)) >>> 3)::64 word) * 0x1)::64 word)),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0\<close>
declare Q_0x5d30_26_def[Qs]

schematic_goal cow_read_0_1_0x5d25_0x5d25_26[blocks]:
  assumes \<open>(P_0x5d25_true_26 && P_0x5d25_true_26_regions && !ZF) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x5d25 26 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x5d30_26 ?\<sigma> \<and> block_usage P_0x5d25_true_26_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x5d25_true_26_def P_0x5d25_true_26_regions_def post: Q_0x5d30_26_def regionset: P_0x5d25_true_26_regions_set_def)

definition P_0x5d25_false_27 :: state_pred where
  \<open>P_0x5d25_false_27 \<sigma> \<equiv> RIP \<sigma> = 0x5d25 \<and> RBX \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> RDI \<sigma> = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word) \<and> RSI \<sigma> = ucast (((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word)::64 word) + (\<langle>63,0\<rangle>((((if' (R14 \<sigma>::64 word) \<ge>s (ucast ((0x0::64 word))::64 word) then R14 \<sigma> else (((R14 \<sigma>::64 word) + 0x7)::64 word)) >>> 3)::64 word) * 0x1)::64 word)),1]::8 word)::32 word) >>> unat (((\<langle>7,0\<rangle>((ucast (((((\<langle>31,0\<rangle>((R14 \<sigma>::64 word) + (\<langle>63,0\<rangle>((((R14 \<sigma> >>> 63) >> 61)::64 word) * 0x1)::64 word))::32 word)::32 word) AND 0x7)::32 word))::64 word) - (((R14 \<sigma> >>> 63) >> 61)::64 word))::8 word)::8 word)))::32 word) AND 0x1)) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x48) \<and> RBP \<sigma> = RDI\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word)::64 word) + (\<langle>63,0\<rangle>((((if' (R14 \<sigma>::64 word) \<ge>s (ucast ((0x0::64 word))::64 word) then R14 \<sigma> else (((R14 \<sigma>::64 word) + 0x7)::64 word)) >>> 3)::64 word) * 0x1)::64 word)),1]::8 word) = ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word)::64 word) + (\<langle>63,0\<rangle>((((if' (R14 \<sigma>::64 word) \<ge>s (ucast ((0x0::64 word))::64 word) then R14 \<sigma> else (((R14 \<sigma>::64 word) + 0x7)::64 word)) >>> 3)::64 word) * 0x1)::64 word)),1]::8 word)) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word)::64 word) + (\<langle>63,0\<rangle>((((if' (((R14 \<sigma>::64 word) + 0x1)::64 word) \<ge>s (ucast ((0x0::64 word))::64 word) then ((R14 \<sigma>::64 word) + 0x1) else (((R14 \<sigma>::64 word) + 0x8)::64 word)) >>> 3)::64 word) * 0x1)::64 word)),1]::8 word) = ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word)::64 word) + (\<langle>63,0\<rangle>((((if' (((R14 \<sigma>::64 word) + 0x1)::64 word) \<ge>s (ucast ((0x0::64 word))::64 word) then ((R14 \<sigma>::64 word) + 0x1) else (((R14 \<sigma>::64 word) + 0x8)::64 word)) >>> 3)::64 word) * 0x1)::64 word)),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0\<close>
declare P_0x5d25_false_27_def[Ps]

definition P_0x5d25_false_27_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x5d25_false_27_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((RDI\<^sub>0::64 word) + 0x40), 8),
    (2, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8), 8),
    (3, (((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word)::64 word) + (\<langle>63,0\<rangle>((((if' (R14 \<sigma>::64 word) \<ge>s (ucast ((0x0::64 word))::64 word) then R14 \<sigma> else (((R14 \<sigma>::64 word) + 0x7)::64 word)) >>> 3)::64 word) * 0x1)::64 word)), Suc 0),
    (4, (((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word)::64 word) + (\<langle>63,0\<rangle>((((if' (((R14 \<sigma>::64 word) + 0x1)::64 word) \<ge>s (ucast ((0x0::64 word))::64 word) then ((R14 \<sigma>::64 word) + 0x1) else (((R14 \<sigma>::64 word) + 0x8)::64 word)) >>> 3)::64 word) * 0x1)::64 word)), Suc 0),
    (5, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x30), 8)
  }\<close>

definition P_0x5d25_false_27_regions :: state_pred where
  \<open>P_0x5d25_false_27_regions \<sigma> \<equiv> \<exists>regions. P_0x5d25_false_27_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x5d27_27 :: state_pred where
  \<open>Q_0x5d27_27 \<sigma> \<equiv> RIP \<sigma> = 0x5d27 \<and> RBX \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> RDI \<sigma> = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word) \<and> RSI \<sigma> = ucast (((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word)::64 word) + (\<langle>63,0\<rangle>((((if' (R14 \<sigma>::64 word) \<ge>s (ucast ((0x0::64 word))::64 word) then R14 \<sigma> else (((R14 \<sigma>::64 word) + 0x7)::64 word)) >>> 3)::64 word) * 0x1)::64 word)),1]::8 word)::32 word) >>> unat (((\<langle>7,0\<rangle>((ucast (((((\<langle>31,0\<rangle>((R14 \<sigma>::64 word) + (\<langle>63,0\<rangle>((((R14 \<sigma> >>> 63) >> 61)::64 word) * 0x1)::64 word))::32 word)::32 word) AND 0x7)::32 word))::64 word) - (((R14 \<sigma> >>> 63) >> 61)::64 word))::8 word)::8 word)))::32 word) AND 0x1)) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x48) \<and> RBP \<sigma> = RDI\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word)::64 word) + (\<langle>63,0\<rangle>((((if' (R14 \<sigma>::64 word) \<ge>s (ucast ((0x0::64 word))::64 word) then R14 \<sigma> else (((R14 \<sigma>::64 word) + 0x7)::64 word)) >>> 3)::64 word) * 0x1)::64 word)),1]::8 word) = ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word)::64 word) + (\<langle>63,0\<rangle>((((if' (R14 \<sigma>::64 word) \<ge>s (ucast ((0x0::64 word))::64 word) then R14 \<sigma> else (((R14 \<sigma>::64 word) + 0x7)::64 word)) >>> 3)::64 word) * 0x1)::64 word)),1]::8 word)) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word)::64 word) + (\<langle>63,0\<rangle>((((if' (((R14 \<sigma>::64 word) + 0x1)::64 word) \<ge>s (ucast ((0x0::64 word))::64 word) then ((R14 \<sigma>::64 word) + 0x1) else (((R14 \<sigma>::64 word) + 0x8)::64 word)) >>> 3)::64 word) * 0x1)::64 word)),1]::8 word) = ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word)::64 word) + (\<langle>63,0\<rangle>((((if' (((R14 \<sigma>::64 word) + 0x1)::64 word) \<ge>s (ucast ((0x0::64 word))::64 word) then ((R14 \<sigma>::64 word) + 0x1) else (((R14 \<sigma>::64 word) + 0x8)::64 word)) >>> 3)::64 word) * 0x1)::64 word)),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0\<close>
declare Q_0x5d27_27_def[Qs]

schematic_goal cow_read_0_1_0x5d25_0x5d25_27[blocks]:
  assumes \<open>(P_0x5d25_false_27 && P_0x5d25_false_27_regions && ! !ZF) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x5d25 27 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x5d27_27 ?\<sigma> \<and> block_usage P_0x5d25_false_27_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x5d25_false_27_def P_0x5d25_false_27_regions_def post: Q_0x5d27_27_def regionset: P_0x5d25_false_27_regions_set_def)

definition P_0x5d2e_false_28 :: state_pred where
  \<open>P_0x5d2e_false_28 \<sigma> \<equiv> RIP \<sigma> = 0x5d2e \<and> RBX \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> RDI \<sigma> = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word) \<and> RSI \<sigma> = ucast (((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word)::64 word) + (\<langle>63,0\<rangle>((((if' (R14 \<sigma>::64 word) \<ge>s (ucast ((0x0::64 word))::64 word) then R14 \<sigma> else (((R14 \<sigma>::64 word) + 0x7)::64 word)) >>> 3)::64 word) * 0x1)::64 word)),1]::8 word)::32 word) >>> unat (((\<langle>7,0\<rangle>((ucast (((((\<langle>31,0\<rangle>((R14 \<sigma>::64 word) + (\<langle>63,0\<rangle>((((R14 \<sigma> >>> 63) >> 61)::64 word) * 0x1)::64 word))::32 word)::32 word) AND 0x7)::32 word))::64 word) - (((R14 \<sigma> >>> 63) >> 61)::64 word))::8 word)::8 word)))::32 word) AND 0x1)) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x48) \<and> RBP \<sigma> = RDI\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word)::64 word) + (\<langle>63,0\<rangle>((((if' (R14 \<sigma>::64 word) \<ge>s (ucast ((0x0::64 word))::64 word) then R14 \<sigma> else (((R14 \<sigma>::64 word) + 0x7)::64 word)) >>> 3)::64 word) * 0x1)::64 word)),1]::8 word) = ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word)::64 word) + (\<langle>63,0\<rangle>((((if' (R14 \<sigma>::64 word) \<ge>s (ucast ((0x0::64 word))::64 word) then R14 \<sigma> else (((R14 \<sigma>::64 word) + 0x7)::64 word)) >>> 3)::64 word) * 0x1)::64 word)),1]::8 word)) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word)::64 word) + (\<langle>63,0\<rangle>((((if' (((R14 \<sigma>::64 word) + 0x1)::64 word) \<ge>s (ucast ((0x0::64 word))::64 word) then ((R14 \<sigma>::64 word) + 0x1) else (((R14 \<sigma>::64 word) + 0x8)::64 word)) >>> 3)::64 word) * 0x1)::64 word)),1]::8 word) = ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word)::64 word) + (\<langle>63,0\<rangle>((((if' (((R14 \<sigma>::64 word) + 0x1)::64 word) \<ge>s (ucast ((0x0::64 word))::64 word) then ((R14 \<sigma>::64 word) + 0x1) else (((R14 \<sigma>::64 word) + 0x8)::64 word)) >>> 3)::64 word) * 0x1)::64 word)),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0\<close>
declare P_0x5d2e_false_28_def[Ps]

definition P_0x5d2e_false_28_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x5d2e_false_28_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((RDI\<^sub>0::64 word) + 0x40), 8),
    (2, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8), 8),
    (3, (((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word)::64 word) + (\<langle>63,0\<rangle>((((if' (R14 \<sigma>::64 word) \<ge>s (ucast ((0x0::64 word))::64 word) then R14 \<sigma> else (((R14 \<sigma>::64 word) + 0x7)::64 word)) >>> 3)::64 word) * 0x1)::64 word)), Suc 0),
    (4, (((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word)::64 word) + (\<langle>63,0\<rangle>((((if' (((R14 \<sigma>::64 word) + 0x1)::64 word) \<ge>s (ucast ((0x0::64 word))::64 word) then ((R14 \<sigma>::64 word) + 0x1) else (((R14 \<sigma>::64 word) + 0x8)::64 word)) >>> 3)::64 word) * 0x1)::64 word)), Suc 0),
    (5, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x30), 8)
  }\<close>

definition P_0x5d2e_false_28_regions :: state_pred where
  \<open>P_0x5d2e_false_28_regions \<sigma> \<equiv> \<exists>regions. P_0x5d2e_false_28_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x5d30_28 :: state_pred where
  \<open>Q_0x5d30_28 \<sigma> \<equiv> RIP \<sigma> = 0x5d30 \<and> RBX \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> RDI \<sigma> = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word) \<and> RSI \<sigma> = ucast (((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word)::64 word) + (\<langle>63,0\<rangle>((((if' (R14 \<sigma>::64 word) \<ge>s (ucast ((0x0::64 word))::64 word) then R14 \<sigma> else (((R14 \<sigma>::64 word) + 0x7)::64 word)) >>> 3)::64 word) * 0x1)::64 word)),1]::8 word)::32 word) >>> unat (((\<langle>7,0\<rangle>((ucast (((((\<langle>31,0\<rangle>((R14 \<sigma>::64 word) + (\<langle>63,0\<rangle>((((R14 \<sigma> >>> 63) >> 61)::64 word) * 0x1)::64 word))::32 word)::32 word) AND 0x7)::32 word))::64 word) - (((R14 \<sigma> >>> 63) >> 61)::64 word))::8 word)::8 word)))::32 word) AND 0x1)) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x48) \<and> RBP \<sigma> = RDI\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word)::64 word) + (\<langle>63,0\<rangle>((((if' (R14 \<sigma>::64 word) \<ge>s (ucast ((0x0::64 word))::64 word) then R14 \<sigma> else (((R14 \<sigma>::64 word) + 0x7)::64 word)) >>> 3)::64 word) * 0x1)::64 word)),1]::8 word) = ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word)::64 word) + (\<langle>63,0\<rangle>((((if' (R14 \<sigma>::64 word) \<ge>s (ucast ((0x0::64 word))::64 word) then R14 \<sigma> else (((R14 \<sigma>::64 word) + 0x7)::64 word)) >>> 3)::64 word) * 0x1)::64 word)),1]::8 word)) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word)::64 word) + (\<langle>63,0\<rangle>((((if' (((R14 \<sigma>::64 word) + 0x1)::64 word) \<ge>s (ucast ((0x0::64 word))::64 word) then ((R14 \<sigma>::64 word) + 0x1) else (((R14 \<sigma>::64 word) + 0x8)::64 word)) >>> 3)::64 word) * 0x1)::64 word)),1]::8 word) = ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word)::64 word) + (\<langle>63,0\<rangle>((((if' (((R14 \<sigma>::64 word) + 0x1)::64 word) \<ge>s (ucast ((0x0::64 word))::64 word) then ((R14 \<sigma>::64 word) + 0x1) else (((R14 \<sigma>::64 word) + 0x8)::64 word)) >>> 3)::64 word) * 0x1)::64 word)),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0\<close>
declare Q_0x5d30_28_def[Qs]

schematic_goal cow_read_0_1_0x5d2e_0x5d2e_28[blocks]:
  assumes \<open>(P_0x5d2e_false_28 && P_0x5d2e_false_28_regions && ! !ZF) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x5d2e 28 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x5d30_28 ?\<sigma> \<and> block_usage P_0x5d2e_false_28_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x5d2e_false_28_def P_0x5d2e_false_28_regions_def post: Q_0x5d30_28_def regionset: P_0x5d2e_false_28_regions_set_def)

definition P_0x5d30_29 :: state_pred where
  \<open>P_0x5d30_29 \<sigma> \<equiv> RIP \<sigma> = 0x5d30 \<and> RBX \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> RDI \<sigma> = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word) \<and> RSI \<sigma> = ucast (((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word)::64 word) + (\<langle>63,0\<rangle>((((if' (R14 \<sigma>::64 word) \<ge>s (ucast ((0x0::64 word))::64 word) then R14 \<sigma> else (((R14 \<sigma>::64 word) + 0x7)::64 word)) >>> 3)::64 word) * 0x1)::64 word)),1]::8 word)::32 word) >>> unat (((\<langle>7,0\<rangle>((ucast (((((\<langle>31,0\<rangle>((R14 \<sigma>::64 word) + (\<langle>63,0\<rangle>((((R14 \<sigma> >>> 63) >> 61)::64 word) * 0x1)::64 word))::32 word)::32 word) AND 0x7)::32 word))::64 word) - (((R14 \<sigma> >>> 63) >> 61)::64 word))::8 word)::8 word)))::32 word) AND 0x1)) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x48) \<and> RBP \<sigma> = RDI\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word)::64 word) + (\<langle>63,0\<rangle>((((if' (R14 \<sigma>::64 word) \<ge>s (ucast ((0x0::64 word))::64 word) then R14 \<sigma> else (((R14 \<sigma>::64 word) + 0x7)::64 word)) >>> 3)::64 word) * 0x1)::64 word)),1]::8 word) = ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word)::64 word) + (\<langle>63,0\<rangle>((((if' (R14 \<sigma>::64 word) \<ge>s (ucast ((0x0::64 word))::64 word) then R14 \<sigma> else (((R14 \<sigma>::64 word) + 0x7)::64 word)) >>> 3)::64 word) * 0x1)::64 word)),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0\<close>
declare P_0x5d30_29_def[Ps]

definition P_0x5d30_29_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x5d30_29_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((RDI\<^sub>0::64 word) + 0x40), 8),
    (2, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8), 8),
    (3, (((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word)::64 word) + (\<langle>63,0\<rangle>((((if' (R14 \<sigma>::64 word) \<ge>s (ucast ((0x0::64 word))::64 word) then R14 \<sigma> else (((R14 \<sigma>::64 word) + 0x7)::64 word)) >>> 3)::64 word) * 0x1)::64 word)), Suc 0),
    (4, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x30), 8)
  }\<close>

definition P_0x5d30_29_regions :: state_pred where
  \<open>P_0x5d30_29_regions \<sigma> \<equiv> \<exists>regions. P_0x5d30_29_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x5d32_29 :: state_pred where
  \<open>Q_0x5d32_29 \<sigma> \<equiv> RIP \<sigma> = 0x5d32 \<and> RBX \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> RDI \<sigma> = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word) \<and> RSI \<sigma> = ucast (((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word)::64 word) + (\<langle>63,0\<rangle>((((if' (R14 \<sigma>::64 word) \<ge>s (ucast ((0x0::64 word))::64 word) then R14 \<sigma> else (((R14 \<sigma>::64 word) + 0x7)::64 word)) >>> 3)::64 word) * 0x1)::64 word)),1]::8 word)::32 word) >>> unat (((\<langle>7,0\<rangle>((ucast (((((\<langle>31,0\<rangle>((R14 \<sigma>::64 word) + (\<langle>63,0\<rangle>((((R14 \<sigma> >>> 63) >> 61)::64 word) * 0x1)::64 word))::32 word)::32 word) AND 0x7)::32 word))::64 word) - (((R14 \<sigma> >>> 63) >> 61)::64 word))::8 word)::8 word)))::32 word) AND 0x1)) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x48) \<and> RBP \<sigma> = RDI\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word)::64 word) + (\<langle>63,0\<rangle>((((if' (R14 \<sigma>::64 word) \<ge>s (ucast ((0x0::64 word))::64 word) then R14 \<sigma> else (((R14 \<sigma>::64 word) + 0x7)::64 word)) >>> 3)::64 word) * 0x1)::64 word)),1]::8 word) = ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word)::64 word) + (\<langle>63,0\<rangle>((((if' (R14 \<sigma>::64 word) \<ge>s (ucast ((0x0::64 word))::64 word) then R14 \<sigma> else (((R14 \<sigma>::64 word) + 0x7)::64 word)) >>> 3)::64 word) * 0x1)::64 word)),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0\<close>
declare Q_0x5d32_29_def[Qs]

schematic_goal cow_read_0_1_0x5d30_0x5d30_29[blocks]:
  assumes \<open>(P_0x5d30_29 && P_0x5d30_29_regions) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x5d30 29 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x5d32_29 ?\<sigma> \<and> block_usage P_0x5d30_29_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x5d30_29_def P_0x5d30_29_regions_def post: Q_0x5d32_29_def regionset: P_0x5d30_29_regions_set_def)

definition P_0x5d32_true_30 :: state_pred where
  \<open>P_0x5d32_true_30 \<sigma> \<equiv> RIP \<sigma> = 0x5d32 \<and> RBX \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> RDI \<sigma> = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word) \<and> RSI \<sigma> = ucast (((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word)::64 word) + (\<langle>63,0\<rangle>((((if' (R14 \<sigma>::64 word) \<ge>s (ucast ((0x0::64 word))::64 word) then R14 \<sigma> else (((R14 \<sigma>::64 word) + 0x7)::64 word)) >>> 3)::64 word) * 0x1)::64 word)),1]::8 word)::32 word) >>> unat (((\<langle>7,0\<rangle>((ucast (((((\<langle>31,0\<rangle>((R14 \<sigma>::64 word) + (\<langle>63,0\<rangle>((((R14 \<sigma> >>> 63) >> 61)::64 word) * 0x1)::64 word))::32 word)::32 word) AND 0x7)::32 word))::64 word) - (((R14 \<sigma> >>> 63) >> 61)::64 word))::8 word)::8 word)))::32 word) AND 0x1)) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x48) \<and> RBP \<sigma> = RDI\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word)::64 word) + (\<langle>63,0\<rangle>((((if' (R14 \<sigma>::64 word) \<ge>s (ucast ((0x0::64 word))::64 word) then R14 \<sigma> else (((R14 \<sigma>::64 word) + 0x7)::64 word)) >>> 3)::64 word) * 0x1)::64 word)),1]::8 word) = ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word)::64 word) + (\<langle>63,0\<rangle>((((if' (R14 \<sigma>::64 word) \<ge>s (ucast ((0x0::64 word))::64 word) then R14 \<sigma> else (((R14 \<sigma>::64 word) + 0x7)::64 word)) >>> 3)::64 word) * 0x1)::64 word)),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0\<close>
declare P_0x5d32_true_30_def[Ps]

definition P_0x5d32_true_30_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x5d32_true_30_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((RDI\<^sub>0::64 word) + 0x40), 8),
    (2, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8), 8),
    (3, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x20), 8),
    (4, (((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word)::64 word) + (\<langle>63,0\<rangle>((((if' (R14 \<sigma>::64 word) \<ge>s (ucast ((0x0::64 word))::64 word) then R14 \<sigma> else (((R14 \<sigma>::64 word) + 0x7)::64 word)) >>> 3)::64 word) * 0x1)::64 word)), Suc 0),
    (5, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (11, (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word), 4)
  }\<close>

definition P_0x5d32_true_30_regions :: state_pred where
  \<open>P_0x5d32_true_30_regions \<sigma> \<equiv> \<exists>regions. P_0x5d32_true_30_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x5dd7_30 :: state_pred where
  \<open>Q_0x5dd7_30 \<sigma> \<equiv> RIP \<sigma> = 0x5dd7 \<and> RBX \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> RDX \<sigma> = 0x0 \<and> RDI \<sigma> = ucast ((\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word),4]::32 word)) \<and> RSI \<sigma> = (((R14 \<sigma> << 9)::64 word) + (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x20),8]::64 word)) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x48) \<and> RBP \<sigma> = RDI\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x20),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x20),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word)::64 word) + (\<langle>63,0\<rangle>((((if' (R14 \<sigma>::64 word) \<ge>s (ucast ((0x0::64 word))::64 word) then R14 \<sigma> else (((R14 \<sigma>::64 word) + 0x7)::64 word)) >>> 3)::64 word) * 0x1)::64 word)),1]::8 word) = ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word)::64 word) + (\<langle>63,0\<rangle>((((if' (R14 \<sigma>::64 word) \<ge>s (ucast ((0x0::64 word))::64 word) then R14 \<sigma> else (((R14 \<sigma>::64 word) + 0x7)::64 word)) >>> 3)::64 word) * 0x1)::64 word)),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word),4]::32 word) = ucast ((\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word),4]::32 word))\<close>
declare Q_0x5dd7_30_def[Qs]

schematic_goal cow_read_0_6_0x5d32_0x5dd3_30[blocks]:
  assumes \<open>(P_0x5d32_true_30 && P_0x5d32_true_30_regions && !ZF) \<sigma>\<close>
  shows \<open>exec_block 6 0x5dd3 30 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x5dd7_30 ?\<sigma> \<and> block_usage P_0x5d32_true_30_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x5d32_true_30_def P_0x5d32_true_30_regions_def post: Q_0x5dd7_30_def regionset: P_0x5d32_true_30_regions_set_def)

definition P_0x5dd7_31 :: state_pred where
  \<open>P_0x5dd7_31 \<sigma> \<equiv> RIP \<sigma> = 0x5dd7 \<and> RBX \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> RDX \<sigma> = 0x0 \<and> RDI \<sigma> = ucast ((\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word),4]::32 word)) \<and> RSI \<sigma> = (((R14 \<sigma> << 9)::64 word) + (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x20),8]::64 word)) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x48) \<and> RBP \<sigma> = RDI\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x20),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x20),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word)::64 word) + (\<langle>63,0\<rangle>((((if' (R14 \<sigma>::64 word) \<ge>s (ucast ((0x0::64 word))::64 word) then R14 \<sigma> else (((R14 \<sigma>::64 word) + 0x7)::64 word)) >>> 3)::64 word) * 0x1)::64 word)),1]::8 word) = ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word)::64 word) + (\<langle>63,0\<rangle>((((if' (R14 \<sigma>::64 word) \<ge>s (ucast ((0x0::64 word))::64 word) then R14 \<sigma> else (((R14 \<sigma>::64 word) + 0x7)::64 word)) >>> 3)::64 word) * 0x1)::64 word)),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word),4]::32 word) = ucast ((\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word),4]::32 word))\<close>
declare P_0x5dd7_31_def[Ps]

definition P_0x5dd7_31_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x5dd7_31_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((RDI\<^sub>0::64 word) + 0x40), 8),
    (2, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8), 8),
    (3, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x20), 8),
    (4, (((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word)::64 word) + (\<langle>63,0\<rangle>((((if' (R14 \<sigma>::64 word) \<ge>s (ucast ((0x0::64 word))::64 word) then R14 \<sigma> else (((R14 \<sigma>::64 word) + 0x7)::64 word)) >>> 3)::64 word) * 0x1)::64 word)), Suc 0),
    (5, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (11, ((RSP\<^sub>0::64 word) - 0x50), 8),
    (12, (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word), 4)
  }\<close>

definition P_0x5dd7_31_regions :: state_pred where
  \<open>P_0x5dd7_31_regions \<sigma> \<equiv> \<exists>regions. P_0x5dd7_31_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_lseek64_addr_0x5dd7_31 :: state_pred where
  \<open>Q_lseek64_addr_0x5dd7_31 \<sigma> \<equiv> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x50) \<and> RIP \<sigma> = lseek64_addr \<and> RBX \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> RDX \<sigma> = 0x0 \<and> RDI \<sigma> = ucast ((\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word),4]::32 word)) \<and> RSI \<sigma> = (((R14 \<sigma> << 9)::64 word) + (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x20),8]::64 word)) \<and> RBP \<sigma> = RDI\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x20),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x20),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word)::64 word) + (\<langle>63,0\<rangle>((((if' (R14 \<sigma>::64 word) \<ge>s (ucast ((0x0::64 word))::64 word) then R14 \<sigma> else (((R14 \<sigma>::64 word) + 0x7)::64 word)) >>> 3)::64 word) * 0x1)::64 word)),1]::8 word) = ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word)::64 word) + (\<langle>63,0\<rangle>((((if' (R14 \<sigma>::64 word) \<ge>s (ucast ((0x0::64 word))::64 word) then R14 \<sigma> else (((R14 \<sigma>::64 word) + 0x7)::64 word)) >>> 3)::64 word) * 0x1)::64 word)),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),8]::64 word) = 0x5ddc \<and> (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word),4]::32 word) = ucast ((\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word),4]::32 word))\<close>
declare Q_lseek64_addr_0x5dd7_31_def[Qs]

schematic_goal cow_read_0_1_0x5dd7_0x5dd7_31[blocks]:
  assumes \<open>(P_0x5dd7_31 && P_0x5dd7_31_regions) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x5dd7 31 \<sigma> \<triangleq> ?\<sigma> \<and> Q_lseek64_addr_0x5dd7_31 ?\<sigma> \<and> block_usage P_0x5dd7_31_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x5dd7_31_def P_0x5dd7_31_regions_def post: Q_lseek64_addr_0x5dd7_31_def regionset: P_0x5dd7_31_regions_set_def)

definition P_0x5ddc_32 :: state_pred where
  \<open>P_0x5ddc_32 \<sigma> \<equiv> RIP \<sigma> = 0x5ddc \<and> RBX \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> RDX \<sigma> = 0x0 \<and> RDI \<sigma> = ucast ((\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word),4]::32 word)) \<and> RSI \<sigma> = (((R14 \<sigma> << 9)::64 word) + (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x20),8]::64 word)) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x48) \<and> RBP \<sigma> = RDI\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x20),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x20),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word)::64 word) + (\<langle>63,0\<rangle>((((if' (R14 \<sigma>::64 word) \<ge>s (ucast ((0x0::64 word))::64 word) then R14 \<sigma> else (((R14 \<sigma>::64 word) + 0x7)::64 word)) >>> 3)::64 word) * 0x1)::64 word)),1]::8 word) = ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word)::64 word) + (\<langle>63,0\<rangle>((((if' (R14 \<sigma>::64 word) \<ge>s (ucast ((0x0::64 word))::64 word) then R14 \<sigma> else (((R14 \<sigma>::64 word) + 0x7)::64 word)) >>> 3)::64 word) * 0x1)::64 word)),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),8]::64 word) = 0x5ddc \<and> (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word),4]::32 word) = ucast ((\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word),4]::32 word))\<close>
declare P_0x5ddc_32_def[Ps]

definition P_0x5ddc_32_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x5ddc_32_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((RDI\<^sub>0::64 word) + 0x40), 8),
    (2, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8), 8),
    (3, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x20), 8),
    (4, (((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word)::64 word) + (\<langle>63,0\<rangle>((((if' (R14 \<sigma>::64 word) \<ge>s (ucast ((0x0::64 word))::64 word) then R14 \<sigma> else (((R14 \<sigma>::64 word) + 0x7)::64 word)) >>> 3)::64 word) * 0x1)::64 word)), Suc 0),
    (5, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (11, ((RSP\<^sub>0::64 word) - 0x40), 8),
    (12, ((RSP\<^sub>0::64 word) - 0x50), 8),
    (13, (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word), 4)
  }\<close>

definition P_0x5ddc_32_regions :: state_pred where
  \<open>P_0x5ddc_32_regions \<sigma> \<equiv> \<exists>regions. P_0x5ddc_32_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x5df2_32 :: state_pred where
  \<open>Q_0x5df2_32 \<sigma> \<equiv> RIP \<sigma> = 0x5df2 \<and> RBX \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> RCX \<sigma> = (sextend (ucast (((\<langle>31,0\<rangle>R12 \<sigma>::32 word) << 9))) 32 64::64 word) \<and> RDX \<sigma> = (sextend (ucast (((\<langle>31,0\<rangle>R12 \<sigma>::32 word) << 9))) 32 64::64 word) \<and> RDI \<sigma> = ucast ((\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word),4]::32 word)) \<and> RSI \<sigma> = R15 \<sigma> \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x48) \<and> RBP \<sigma> = RDI\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x20),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x20),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word)::64 word) + (\<langle>63,0\<rangle>((((if' (R14 \<sigma>::64 word) \<ge>s (ucast ((0x0::64 word))::64 word) then R14 \<sigma> else (((R14 \<sigma>::64 word) + 0x7)::64 word)) >>> 3)::64 word) * 0x1)::64 word)),1]::8 word) = ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word)::64 word) + (\<langle>63,0\<rangle>((((if' (R14 \<sigma>::64 word) \<ge>s (ucast ((0x0::64 word))::64 word) then R14 \<sigma> else (((R14 \<sigma>::64 word) + 0x7)::64 word)) >>> 3)::64 word) * 0x1)::64 word)),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (sextend (ucast (((\<langle>31,0\<rangle>R12 \<sigma>::32 word) << 9))) 32 64::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),8]::64 word) = 0x5ddc \<and> (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word),4]::32 word) = ucast ((\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word),4]::32 word))\<close>
declare Q_0x5df2_32_def[Qs]

schematic_goal cow_read_0_7_0x5ddc_0x5ded_32[blocks]:
  assumes \<open>(P_0x5ddc_32 && P_0x5ddc_32_regions) \<sigma>\<close>
  shows \<open>exec_block 7 0x5ded 32 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x5df2_32 ?\<sigma> \<and> block_usage P_0x5ddc_32_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x5ddc_32_def P_0x5ddc_32_regions_def post: Q_0x5df2_32_def regionset: P_0x5ddc_32_regions_set_def)

definition P_0x5df2_33 :: state_pred where
  \<open>P_0x5df2_33 \<sigma> \<equiv> RIP \<sigma> = 0x5df2 \<and> RBX \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> RCX \<sigma> = (sextend (ucast (((\<langle>31,0\<rangle>R12 \<sigma>::32 word) << 9))) 32 64::64 word) \<and> RDX \<sigma> = (sextend (ucast (((\<langle>31,0\<rangle>R12 \<sigma>::32 word) << 9))) 32 64::64 word) \<and> RDI \<sigma> = ucast ((\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word),4]::32 word)) \<and> RSI \<sigma> = R15 \<sigma> \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x48) \<and> RBP \<sigma> = RDI\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x20),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x20),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word)::64 word) + (\<langle>63,0\<rangle>((((if' (R14 \<sigma>::64 word) \<ge>s (ucast ((0x0::64 word))::64 word) then R14 \<sigma> else (((R14 \<sigma>::64 word) + 0x7)::64 word)) >>> 3)::64 word) * 0x1)::64 word)),1]::8 word) = ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word)::64 word) + (\<langle>63,0\<rangle>((((if' (R14 \<sigma>::64 word) \<ge>s (ucast ((0x0::64 word))::64 word) then R14 \<sigma> else (((R14 \<sigma>::64 word) + 0x7)::64 word)) >>> 3)::64 word) * 0x1)::64 word)),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (sextend (ucast (((\<langle>31,0\<rangle>R12 \<sigma>::32 word) << 9))) 32 64::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),8]::64 word) = 0x5ddc \<and> (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word),4]::32 word) = ucast ((\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word),4]::32 word))\<close>
declare P_0x5df2_33_def[Ps]

definition P_0x5df2_33_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x5df2_33_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((RDI\<^sub>0::64 word) + 0x40), 8),
    (2, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8), 8),
    (3, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x20), 8),
    (4, (((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word)::64 word) + (\<langle>63,0\<rangle>((((if' (R14 \<sigma>::64 word) \<ge>s (ucast ((0x0::64 word))::64 word) then R14 \<sigma> else (((R14 \<sigma>::64 word) + 0x7)::64 word)) >>> 3)::64 word) * 0x1)::64 word)), Suc 0),
    (5, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (11, ((RSP\<^sub>0::64 word) - 0x40), 8),
    (12, ((RSP\<^sub>0::64 word) - 0x50), 8),
    (13, (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word), 4)
  }\<close>

definition P_0x5df2_33_regions :: state_pred where
  \<open>P_0x5df2_33_regions \<sigma> \<equiv> \<exists>regions. P_0x5df2_33_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_qemu_read_ok_addr_0x5df2_33 :: state_pred where
  \<open>Q_qemu_read_ok_addr_0x5df2_33 \<sigma> \<equiv> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x50) \<and> RIP \<sigma> = qemu_read_ok_addr \<and> RBX \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> RCX \<sigma> = (sextend (ucast (((\<langle>31,0\<rangle>R12 \<sigma>::32 word) << 9))) 32 64::64 word) \<and> RDX \<sigma> = (sextend (ucast (((\<langle>31,0\<rangle>R12 \<sigma>::32 word) << 9))) 32 64::64 word) \<and> RDI \<sigma> = ucast ((\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word),4]::32 word)) \<and> RSI \<sigma> = R15 \<sigma> \<and> RBP \<sigma> = RDI\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x20),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x20),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word)::64 word) + (\<langle>63,0\<rangle>((((if' (R14 \<sigma>::64 word) \<ge>s (ucast ((0x0::64 word))::64 word) then R14 \<sigma> else (((R14 \<sigma>::64 word) + 0x7)::64 word)) >>> 3)::64 word) * 0x1)::64 word)),1]::8 word) = ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word)::64 word) + (\<langle>63,0\<rangle>((((if' (R14 \<sigma>::64 word) \<ge>s (ucast ((0x0::64 word))::64 word) then R14 \<sigma> else (((R14 \<sigma>::64 word) + 0x7)::64 word)) >>> 3)::64 word) * 0x1)::64 word)),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (sextend (ucast (((\<langle>31,0\<rangle>R12 \<sigma>::32 word) << 9))) 32 64::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),8]::64 word) = 0x5df7 \<and> (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word),4]::32 word) = ucast ((\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word),4]::32 word))\<close>
declare Q_qemu_read_ok_addr_0x5df2_33_def[Qs]

schematic_goal cow_read_0_1_0x5df2_0x5df2_33[blocks]:
  assumes \<open>(P_0x5df2_33 && P_0x5df2_33_regions) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x5df2 33 \<sigma> \<triangleq> ?\<sigma> \<and> Q_qemu_read_ok_addr_0x5df2_33 ?\<sigma> \<and> block_usage P_0x5df2_33_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x5df2_33_def P_0x5df2_33_regions_def post: Q_qemu_read_ok_addr_0x5df2_33_def regionset: P_0x5df2_33_regions_set_def)

definition P_0x5df7_34 :: state_pred where
  \<open>P_0x5df7_34 \<sigma> \<equiv> RIP \<sigma> = 0x5df7 \<and> RBX \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> RCX \<sigma> = (sextend (ucast (((\<langle>31,0\<rangle>R12 \<sigma>::32 word) << 9))) 32 64::64 word) \<and> RDX \<sigma> = (sextend (ucast (((\<langle>31,0\<rangle>R12 \<sigma>::32 word) << 9))) 32 64::64 word) \<and> RDI \<sigma> = ucast ((\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word),4]::32 word)) \<and> RSI \<sigma> = R15 \<sigma> \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x48) \<and> RBP \<sigma> = RDI\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x20),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x20),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word)::64 word) + (\<langle>63,0\<rangle>((((if' (R14 \<sigma>::64 word) \<ge>s (ucast ((0x0::64 word))::64 word) then R14 \<sigma> else (((R14 \<sigma>::64 word) + 0x7)::64 word)) >>> 3)::64 word) * 0x1)::64 word)),1]::8 word) = ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word)::64 word) + (\<langle>63,0\<rangle>((((if' (R14 \<sigma>::64 word) \<ge>s (ucast ((0x0::64 word))::64 word) then R14 \<sigma> else (((R14 \<sigma>::64 word) + 0x7)::64 word)) >>> 3)::64 word) * 0x1)::64 word)),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (sextend (ucast (((\<langle>31,0\<rangle>R12 \<sigma>::32 word) << 9))) 32 64::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),8]::64 word) = 0x5df7 \<and> (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word),4]::32 word) = ucast ((\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word),4]::32 word))\<close>
declare P_0x5df7_34_def[Ps]

definition P_0x5df7_34_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x5df7_34_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((RDI\<^sub>0::64 word) + 0x40), 8),
    (2, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8), 8),
    (3, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x20), 8),
    (4, (((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word)::64 word) + (\<langle>63,0\<rangle>((((if' (R14 \<sigma>::64 word) \<ge>s (ucast ((0x0::64 word))::64 word) then R14 \<sigma> else (((R14 \<sigma>::64 word) + 0x7)::64 word)) >>> 3)::64 word) * 0x1)::64 word)), Suc 0),
    (5, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (11, ((RSP\<^sub>0::64 word) - 0x40), 8),
    (12, ((RSP\<^sub>0::64 word) - 0x50), 8),
    (13, (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word), 4)
  }\<close>

definition P_0x5df7_34_regions :: state_pred where
  \<open>P_0x5df7_34_regions \<sigma> \<equiv> \<exists>regions. P_0x5df7_34_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x5dfe_34 :: state_pred where
  \<open>Q_0x5dfe_34 \<sigma> \<equiv> RIP \<sigma> = 0x5dfe \<and> RBX \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> RCX \<sigma> = (sextend (ucast (((\<langle>31,0\<rangle>R12 \<sigma>::32 word) << 9))) 32 64::64 word) \<and> RDX \<sigma> = (sextend (ucast (((\<langle>31,0\<rangle>R12 \<sigma>::32 word) << 9))) 32 64::64 word) \<and> RDI \<sigma> = ucast ((\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word),4]::32 word)) \<and> RSI \<sigma> = R15 \<sigma> \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x48) \<and> RBP \<sigma> = RDI\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x20),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x20),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word)::64 word) + (\<langle>63,0\<rangle>((((if' (R14 \<sigma>::64 word) \<ge>s (ucast ((0x0::64 word))::64 word) then R14 \<sigma> else (((R14 \<sigma>::64 word) + 0x7)::64 word)) >>> 3)::64 word) * 0x1)::64 word)),1]::8 word) = ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word)::64 word) + (\<langle>63,0\<rangle>((((if' (R14 \<sigma>::64 word) \<ge>s (ucast ((0x0::64 word))::64 word) then R14 \<sigma> else (((R14 \<sigma>::64 word) + 0x7)::64 word)) >>> 3)::64 word) * 0x1)::64 word)),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (sextend (ucast (((\<langle>31,0\<rangle>R12 \<sigma>::32 word) << 9))) 32 64::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),8]::64 word) = 0x5df7 \<and> (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word),4]::32 word) = ucast ((\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word),4]::32 word))\<close>
declare Q_0x5dfe_34_def[Qs]

schematic_goal cow_read_0_2_0x5df7_0x5dfc_34[blocks]:
  assumes \<open>(P_0x5df7_34 && P_0x5df7_34_regions) \<sigma>\<close>
  shows \<open>exec_block 2 0x5dfc 34 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x5dfe_34 ?\<sigma> \<and> block_usage P_0x5df7_34_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x5df7_34_def P_0x5df7_34_regions_def post: Q_0x5dfe_34_def regionset: P_0x5df7_34_regions_set_def)

definition P_0x5dfe_true_35 :: state_pred where
  \<open>P_0x5dfe_true_35 \<sigma> \<equiv> RIP \<sigma> = 0x5dfe \<and> RBX \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> RCX \<sigma> = (sextend (ucast (((\<langle>31,0\<rangle>R12 \<sigma>::32 word) << 9))) 32 64::64 word) \<and> RDX \<sigma> = (sextend (ucast (((\<langle>31,0\<rangle>R12 \<sigma>::32 word) << 9))) 32 64::64 word) \<and> RDI \<sigma> = ucast ((\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word),4]::32 word)) \<and> RSI \<sigma> = R15 \<sigma> \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x48) \<and> RBP \<sigma> = RDI\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x20),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x20),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word)::64 word) + (\<langle>63,0\<rangle>((((if' (R14 \<sigma>::64 word) \<ge>s (ucast ((0x0::64 word))::64 word) then R14 \<sigma> else (((R14 \<sigma>::64 word) + 0x7)::64 word)) >>> 3)::64 word) * 0x1)::64 word)),1]::8 word) = ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word)::64 word) + (\<langle>63,0\<rangle>((((if' (R14 \<sigma>::64 word) \<ge>s (ucast ((0x0::64 word))::64 word) then R14 \<sigma> else (((R14 \<sigma>::64 word) + 0x7)::64 word)) >>> 3)::64 word) * 0x1)::64 word)),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (sextend (ucast (((\<langle>31,0\<rangle>R12 \<sigma>::32 word) << 9))) 32 64::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),8]::64 word) = 0x5df7 \<and> (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word),4]::32 word) = ucast ((\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word),4]::32 word))\<close>
declare P_0x5dfe_true_35_def[Ps]

definition P_0x5dfe_true_35_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x5dfe_true_35_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((RDI\<^sub>0::64 word) + 0x40), 8),
    (2, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8), 8),
    (3, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x20), 8),
    (4, (((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word)::64 word) + (\<langle>63,0\<rangle>((((if' (R14 \<sigma>::64 word) \<ge>s (ucast ((0x0::64 word))::64 word) then R14 \<sigma> else (((R14 \<sigma>::64 word) + 0x7)::64 word)) >>> 3)::64 word) * 0x1)::64 word)), Suc 0),
    (5, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (11, ((RSP\<^sub>0::64 word) - 0x40), 8),
    (12, ((RSP\<^sub>0::64 word) - 0x50), 8),
    (13, (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word), 4)
  }\<close>

definition P_0x5dfe_true_35_regions :: state_pred where
  \<open>P_0x5dfe_true_35_regions \<sigma> \<equiv> \<exists>regions. P_0x5dfe_true_35_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x5d72_35 :: state_pred where
  \<open>Q_0x5d72_35 \<sigma> \<equiv> RIP \<sigma> = 0x5d72 \<and> RBX \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x48) \<and> RBP \<sigma> = RDI\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0\<close>
declare Q_0x5d72_35_def[Qs]

schematic_goal cow_read_0_6_0x5dfe_0x5d6f_35[blocks]:
  assumes \<open>(P_0x5dfe_true_35 && P_0x5dfe_true_35_regions && !SF) \<sigma>\<close>
  shows \<open>exec_block 6 0x5d6f 35 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x5d72_35 ?\<sigma> \<and> block_usage P_0x5dfe_true_35_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x5dfe_true_35_def P_0x5dfe_true_35_regions_def post: Q_0x5d72_35_def regionset: P_0x5dfe_true_35_regions_set_def)

definition P_0x5d72_true_36 :: state_pred where
  \<open>P_0x5d72_true_36 \<sigma> \<equiv> RIP \<sigma> = 0x5d72 \<and> RBX \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x48) \<and> RBP \<sigma> = RDI\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0\<close>
declare P_0x5d72_true_36_def[Ps]

definition P_0x5d72_true_36_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x5d72_true_36_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((RDI\<^sub>0::64 word) + 0x40), 8),
    (2, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x30), 8)
  }\<close>

definition P_0x5d72_true_36_regions :: state_pred where
  \<open>P_0x5d72_true_36_regions \<sigma> \<equiv> \<exists>regions. P_0x5d72_true_36_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x5c60_36 :: state_pred where
  \<open>Q_0x5c60_36 \<sigma> \<equiv> RIP \<sigma> = 0x5c60 \<and> RBX \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x48) \<and> RBP \<sigma> = RDI\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0\<close>
declare Q_0x5c60_36_def[Qs]

schematic_goal cow_read_0_1_0x5d72_0x5d72_36[blocks]:
  assumes \<open>(P_0x5d72_true_36 && P_0x5d72_true_36_regions && jg) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x5d72 36 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x5c60_36 ?\<sigma> \<and> block_usage P_0x5d72_true_36_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x5d72_true_36_def P_0x5d72_true_36_regions_def post: Q_0x5c60_36_def regionset: P_0x5d72_true_36_regions_set_def)

definition P_0x5d72_false_37 :: state_pred where
  \<open>P_0x5d72_false_37 \<sigma> \<equiv> RIP \<sigma> = 0x5d72 \<and> RBX \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x48) \<and> RBP \<sigma> = RDI\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0\<close>
declare P_0x5d72_false_37_def[Ps]

definition P_0x5d72_false_37_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x5d72_false_37_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((RDI\<^sub>0::64 word) + 0x40), 8),
    (2, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x30), 8)
  }\<close>

definition P_0x5d72_false_37_regions :: state_pred where
  \<open>P_0x5d72_false_37_regions \<sigma> \<equiv> \<exists>regions. P_0x5d72_false_37_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x5d78_37 :: state_pred where
  \<open>Q_0x5d78_37 \<sigma> \<equiv> RIP \<sigma> = 0x5d78 \<and> RBX \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x48) \<and> RBP \<sigma> = RDI\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0\<close>
declare Q_0x5d78_37_def[Qs]

schematic_goal cow_read_0_1_0x5d72_0x5d72_37[blocks]:
  assumes \<open>(P_0x5d72_false_37 && P_0x5d72_false_37_regions && ! jg) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x5d72 37 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x5d78_37 ?\<sigma> \<and> block_usage P_0x5d72_false_37_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x5d72_false_37_def P_0x5d72_false_37_regions_def post: Q_0x5d78_37_def regionset: P_0x5d72_false_37_regions_set_def)

definition P_0x5dfe_false_38 :: state_pred where
  \<open>P_0x5dfe_false_38 \<sigma> \<equiv> RIP \<sigma> = 0x5dfe \<and> RBX \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> RCX \<sigma> = (sextend (ucast (((\<langle>31,0\<rangle>R12 \<sigma>::32 word) << 9))) 32 64::64 word) \<and> RDX \<sigma> = (sextend (ucast (((\<langle>31,0\<rangle>R12 \<sigma>::32 word) << 9))) 32 64::64 word) \<and> RDI \<sigma> = ucast ((\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word),4]::32 word)) \<and> RSI \<sigma> = R15 \<sigma> \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x48) \<and> RBP \<sigma> = RDI\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x20),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x20),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word)::64 word) + (\<langle>63,0\<rangle>((((if' (R14 \<sigma>::64 word) \<ge>s (ucast ((0x0::64 word))::64 word) then R14 \<sigma> else (((R14 \<sigma>::64 word) + 0x7)::64 word)) >>> 3)::64 word) * 0x1)::64 word)),1]::8 word) = ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word)::64 word) + (\<langle>63,0\<rangle>((((if' (R14 \<sigma>::64 word) \<ge>s (ucast ((0x0::64 word))::64 word) then R14 \<sigma> else (((R14 \<sigma>::64 word) + 0x7)::64 word)) >>> 3)::64 word) * 0x1)::64 word)),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (sextend (ucast (((\<langle>31,0\<rangle>R12 \<sigma>::32 word) << 9))) 32 64::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),8]::64 word) = 0x5df7 \<and> (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word),4]::32 word) = ucast ((\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word),4]::32 word))\<close>
declare P_0x5dfe_false_38_def[Ps]

definition P_0x5dfe_false_38_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x5dfe_false_38_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((RDI\<^sub>0::64 word) + 0x40), 8),
    (2, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8), 8),
    (3, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x20), 8),
    (4, (((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word)::64 word) + (\<langle>63,0\<rangle>((((if' (R14 \<sigma>::64 word) \<ge>s (ucast ((0x0::64 word))::64 word) then R14 \<sigma> else (((R14 \<sigma>::64 word) + 0x7)::64 word)) >>> 3)::64 word) * 0x1)::64 word)), Suc 0),
    (5, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (11, ((RSP\<^sub>0::64 word) - 0x40), 8),
    (12, ((RSP\<^sub>0::64 word) - 0x50), 8),
    (13, (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word), 4)
  }\<close>

definition P_0x5dfe_false_38_regions :: state_pred where
  \<open>P_0x5dfe_false_38_regions \<sigma> \<equiv> \<exists>regions. P_0x5dfe_false_38_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x5e04_38 :: state_pred where
  \<open>Q_0x5e04_38 \<sigma> \<equiv> RIP \<sigma> = 0x5e04 \<and> RBX \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x48) \<and> RBP \<sigma> = RDI\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0\<close>
declare Q_0x5e04_38_def[Qs]

schematic_goal cow_read_0_1_0x5dfe_0x5dfe_38[blocks]:
  assumes \<open>(P_0x5dfe_false_38 && P_0x5dfe_false_38_regions && ! !SF) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x5dfe 38 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x5e04_38 ?\<sigma> \<and> block_usage P_0x5dfe_false_38_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x5dfe_false_38_def P_0x5dfe_false_38_regions_def post: Q_0x5e04_38_def regionset: P_0x5dfe_false_38_regions_set_def)

definition P_0x5d32_false_39 :: state_pred where
  \<open>P_0x5d32_false_39 \<sigma> \<equiv> RIP \<sigma> = 0x5d32 \<and> RBX \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> RDI \<sigma> = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word) \<and> RSI \<sigma> = ucast (((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word)::64 word) + (\<langle>63,0\<rangle>((((if' (R14 \<sigma>::64 word) \<ge>s (ucast ((0x0::64 word))::64 word) then R14 \<sigma> else (((R14 \<sigma>::64 word) + 0x7)::64 word)) >>> 3)::64 word) * 0x1)::64 word)),1]::8 word)::32 word) >>> unat (((\<langle>7,0\<rangle>((ucast (((((\<langle>31,0\<rangle>((R14 \<sigma>::64 word) + (\<langle>63,0\<rangle>((((R14 \<sigma> >>> 63) >> 61)::64 word) * 0x1)::64 word))::32 word)::32 word) AND 0x7)::32 word))::64 word) - (((R14 \<sigma> >>> 63) >> 61)::64 word))::8 word)::8 word)))::32 word) AND 0x1)) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x48) \<and> RBP \<sigma> = RDI\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word)::64 word) + (\<langle>63,0\<rangle>((((if' (R14 \<sigma>::64 word) \<ge>s (ucast ((0x0::64 word))::64 word) then R14 \<sigma> else (((R14 \<sigma>::64 word) + 0x7)::64 word)) >>> 3)::64 word) * 0x1)::64 word)),1]::8 word) = ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word)::64 word) + (\<langle>63,0\<rangle>((((if' (R14 \<sigma>::64 word) \<ge>s (ucast ((0x0::64 word))::64 word) then R14 \<sigma> else (((R14 \<sigma>::64 word) + 0x7)::64 word)) >>> 3)::64 word) * 0x1)::64 word)),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0\<close>
declare P_0x5d32_false_39_def[Ps]

definition P_0x5d32_false_39_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x5d32_false_39_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((RDI\<^sub>0::64 word) + 0x40), 8),
    (2, ((RDI\<^sub>0::64 word) + 0x850), 8),
    (3, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8), 8),
    (4, (((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word)::64 word) + (\<langle>63,0\<rangle>((((if' (R14 \<sigma>::64 word) \<ge>s (ucast ((0x0::64 word))::64 word) then R14 \<sigma> else (((R14 \<sigma>::64 word) + 0x7)::64 word)) >>> 3)::64 word) * 0x1)::64 word)), Suc 0),
    (5, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x30), 8)
  }\<close>

definition P_0x5d32_false_39_regions :: state_pred where
  \<open>P_0x5d32_false_39_regions \<sigma> \<equiv> \<exists>regions. P_0x5d32_false_39_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x5d45_39 :: state_pred where
  \<open>Q_0x5d45_39 \<sigma> \<equiv> RIP \<sigma> = 0x5d45 \<and> RBX \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> RCX \<sigma> = ucast ((\<langle>31,0\<rangle>R12 \<sigma>::32 word)) \<and> RDI \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x850),8]::64 word) \<and> RSI \<sigma> = ucast (((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word)::64 word) + (\<langle>63,0\<rangle>((((if' (R14 \<sigma>::64 word) \<ge>s (ucast ((0x0::64 word))::64 word) then R14 \<sigma> else (((R14 \<sigma>::64 word) + 0x7)::64 word)) >>> 3)::64 word) * 0x1)::64 word)),1]::8 word)::32 word) >>> unat (((\<langle>7,0\<rangle>((ucast (((((\<langle>31,0\<rangle>((R14 \<sigma>::64 word) + (\<langle>63,0\<rangle>((((R14 \<sigma> >>> 63) >> 61)::64 word) * 0x1)::64 word))::32 word)::32 word) AND 0x7)::32 word))::64 word) - (((R14 \<sigma> >>> 63) >> 61)::64 word))::8 word)::8 word)))::32 word) AND 0x1)) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x48) \<and> RBP \<sigma> = RDI\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x850),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x850),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word)::64 word) + (\<langle>63,0\<rangle>((((if' (R14 \<sigma>::64 word) \<ge>s (ucast ((0x0::64 word))::64 word) then R14 \<sigma> else (((R14 \<sigma>::64 word) + 0x7)::64 word)) >>> 3)::64 word) * 0x1)::64 word)),1]::8 word) = ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word)::64 word) + (\<langle>63,0\<rangle>((((if' (R14 \<sigma>::64 word) \<ge>s (ucast ((0x0::64 word))::64 word) then R14 \<sigma> else (((R14 \<sigma>::64 word) + 0x7)::64 word)) >>> 3)::64 word) * 0x1)::64 word)),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0\<close>
declare Q_0x5d45_39_def[Qs]

schematic_goal cow_read_0_4_0x5d32_0x5d42_39[blocks]:
  assumes \<open>(P_0x5d32_false_39 && P_0x5d32_false_39_regions && ! !ZF) \<sigma>\<close>
  shows \<open>exec_block 4 0x5d42 39 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x5d45_39 ?\<sigma> \<and> block_usage P_0x5d32_false_39_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x5d32_false_39_def P_0x5d32_false_39_regions_def post: Q_0x5d45_39_def regionset: P_0x5d32_false_39_regions_set_def)

definition P_0x5d45_true_40 :: state_pred where
  \<open>P_0x5d45_true_40 \<sigma> \<equiv> RIP \<sigma> = 0x5d45 \<and> RBX \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> RCX \<sigma> = ucast ((\<langle>31,0\<rangle>R12 \<sigma>::32 word)) \<and> RDI \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x850),8]::64 word) \<and> RSI \<sigma> = ucast (((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word)::64 word) + (\<langle>63,0\<rangle>((((if' (R14 \<sigma>::64 word) \<ge>s (ucast ((0x0::64 word))::64 word) then R14 \<sigma> else (((R14 \<sigma>::64 word) + 0x7)::64 word)) >>> 3)::64 word) * 0x1)::64 word)),1]::8 word)::32 word) >>> unat (((\<langle>7,0\<rangle>((ucast (((((\<langle>31,0\<rangle>((R14 \<sigma>::64 word) + (\<langle>63,0\<rangle>((((R14 \<sigma> >>> 63) >> 61)::64 word) * 0x1)::64 word))::32 word)::32 word) AND 0x7)::32 word))::64 word) - (((R14 \<sigma> >>> 63) >> 61)::64 word))::8 word)::8 word)))::32 word) AND 0x1)) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x48) \<and> RBP \<sigma> = RDI\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x850),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x850),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word)::64 word) + (\<langle>63,0\<rangle>((((if' (R14 \<sigma>::64 word) \<ge>s (ucast ((0x0::64 word))::64 word) then R14 \<sigma> else (((R14 \<sigma>::64 word) + 0x7)::64 word)) >>> 3)::64 word) * 0x1)::64 word)),1]::8 word) = ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word)::64 word) + (\<langle>63,0\<rangle>((((if' (R14 \<sigma>::64 word) \<ge>s (ucast ((0x0::64 word))::64 word) then R14 \<sigma> else (((R14 \<sigma>::64 word) + 0x7)::64 word)) >>> 3)::64 word) * 0x1)::64 word)),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0\<close>
declare P_0x5d45_true_40_def[Ps]

definition P_0x5d45_true_40_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x5d45_true_40_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((RDI\<^sub>0::64 word) + 0x40), 8),
    (2, ((RDI\<^sub>0::64 word) + 0x850), 8),
    (3, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8), 8),
    (4, (((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word)::64 word) + (\<langle>63,0\<rangle>((((if' (R14 \<sigma>::64 word) \<ge>s (ucast ((0x0::64 word))::64 word) then R14 \<sigma> else (((R14 \<sigma>::64 word) + 0x7)::64 word)) >>> 3)::64 word) * 0x1)::64 word)), Suc 0),
    (5, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (11, ((RSP\<^sub>0::64 word) - 0x40), 8)
  }\<close>

definition P_0x5d45_true_40_regions :: state_pred where
  \<open>P_0x5d45_true_40_regions \<sigma> \<equiv> \<exists>regions. P_0x5d45_true_40_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x5db5_40 :: state_pred where
  \<open>Q_0x5db5_40 \<sigma> \<equiv> RIP \<sigma> = 0x5db5 \<and> RBX \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> RCX \<sigma> = (sextend (ucast (((\<langle>31,0\<rangle>R12 \<sigma>::32 word) << 9))) 32 64::64 word) \<and> RDX \<sigma> = (sextend (ucast (((\<langle>31,0\<rangle>R12 \<sigma>::32 word) << 9))) 32 64::64 word) \<and> RDI \<sigma> = R15 \<sigma> \<and> RSI \<sigma> = 0x0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x48) \<and> RBP \<sigma> = RDI\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x850),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x850),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word)::64 word) + (\<langle>63,0\<rangle>((((if' (R14 \<sigma>::64 word) \<ge>s (ucast ((0x0::64 word))::64 word) then R14 \<sigma> else (((R14 \<sigma>::64 word) + 0x7)::64 word)) >>> 3)::64 word) * 0x1)::64 word)),1]::8 word) = ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word)::64 word) + (\<langle>63,0\<rangle>((((if' (R14 \<sigma>::64 word) \<ge>s (ucast ((0x0::64 word))::64 word) then R14 \<sigma> else (((R14 \<sigma>::64 word) + 0x7)::64 word)) >>> 3)::64 word) * 0x1)::64 word)),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (sextend (ucast (((\<langle>31,0\<rangle>R12 \<sigma>::32 word) << 9))) 32 64::64 word)\<close>
declare Q_0x5db5_40_def[Qs]

schematic_goal cow_read_0_7_0x5d45_0x5db0_40[blocks]:
  assumes \<open>(P_0x5d45_true_40 && P_0x5d45_true_40_regions && ZF) \<sigma>\<close>
  shows \<open>exec_block 7 0x5db0 40 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x5db5_40 ?\<sigma> \<and> block_usage P_0x5d45_true_40_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x5d45_true_40_def P_0x5d45_true_40_regions_def post: Q_0x5db5_40_def regionset: P_0x5d45_true_40_regions_set_def)

definition P_0x5db5_41 :: state_pred where
  \<open>P_0x5db5_41 \<sigma> \<equiv> RIP \<sigma> = 0x5db5 \<and> RBX \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> RCX \<sigma> = (sextend (ucast (((\<langle>31,0\<rangle>R12 \<sigma>::32 word) << 9))) 32 64::64 word) \<and> RDX \<sigma> = (sextend (ucast (((\<langle>31,0\<rangle>R12 \<sigma>::32 word) << 9))) 32 64::64 word) \<and> RDI \<sigma> = R15 \<sigma> \<and> RSI \<sigma> = 0x0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x48) \<and> RBP \<sigma> = RDI\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x850),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x850),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word)::64 word) + (\<langle>63,0\<rangle>((((if' (R14 \<sigma>::64 word) \<ge>s (ucast ((0x0::64 word))::64 word) then R14 \<sigma> else (((R14 \<sigma>::64 word) + 0x7)::64 word)) >>> 3)::64 word) * 0x1)::64 word)),1]::8 word) = ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word)::64 word) + (\<langle>63,0\<rangle>((((if' (R14 \<sigma>::64 word) \<ge>s (ucast ((0x0::64 word))::64 word) then R14 \<sigma> else (((R14 \<sigma>::64 word) + 0x7)::64 word)) >>> 3)::64 word) * 0x1)::64 word)),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (sextend (ucast (((\<langle>31,0\<rangle>R12 \<sigma>::32 word) << 9))) 32 64::64 word)\<close>
declare P_0x5db5_41_def[Ps]

definition P_0x5db5_41_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x5db5_41_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((RDI\<^sub>0::64 word) + 0x40), 8),
    (2, ((RDI\<^sub>0::64 word) + 0x850), 8),
    (3, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8), 8),
    (4, (((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word)::64 word) + (\<langle>63,0\<rangle>((((if' (R14 \<sigma>::64 word) \<ge>s (ucast ((0x0::64 word))::64 word) then R14 \<sigma> else (((R14 \<sigma>::64 word) + 0x7)::64 word)) >>> 3)::64 word) * 0x1)::64 word)), Suc 0),
    (5, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (11, ((RSP\<^sub>0::64 word) - 0x40), 8),
    (12, ((RSP\<^sub>0::64 word) - 0x50), 8)
  }\<close>

definition P_0x5db5_41_regions :: state_pred where
  \<open>P_0x5db5_41_regions \<sigma> \<equiv> \<exists>regions. P_0x5db5_41_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_memset_addr_0x5db5_41 :: state_pred where
  \<open>Q_memset_addr_0x5db5_41 \<sigma> \<equiv> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x50) \<and> RIP \<sigma> = memset_addr \<and> RBX \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> RCX \<sigma> = (sextend (ucast (((\<langle>31,0\<rangle>R12 \<sigma>::32 word) << 9))) 32 64::64 word) \<and> RDX \<sigma> = (sextend (ucast (((\<langle>31,0\<rangle>R12 \<sigma>::32 word) << 9))) 32 64::64 word) \<and> RDI \<sigma> = R15 \<sigma> \<and> RSI \<sigma> = 0x0 \<and> RBP \<sigma> = RDI\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x850),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x850),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word)::64 word) + (\<langle>63,0\<rangle>((((if' (R14 \<sigma>::64 word) \<ge>s (ucast ((0x0::64 word))::64 word) then R14 \<sigma> else (((R14 \<sigma>::64 word) + 0x7)::64 word)) >>> 3)::64 word) * 0x1)::64 word)),1]::8 word) = ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word)::64 word) + (\<langle>63,0\<rangle>((((if' (R14 \<sigma>::64 word) \<ge>s (ucast ((0x0::64 word))::64 word) then R14 \<sigma> else (((R14 \<sigma>::64 word) + 0x7)::64 word)) >>> 3)::64 word) * 0x1)::64 word)),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (sextend (ucast (((\<langle>31,0\<rangle>R12 \<sigma>::32 word) << 9))) 32 64::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),8]::64 word) = 0x5dba\<close>
declare Q_memset_addr_0x5db5_41_def[Qs]

schematic_goal cow_read_0_1_0x5db5_0x5db5_41[blocks]:
  assumes \<open>(P_0x5db5_41 && P_0x5db5_41_regions) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x5db5 41 \<sigma> \<triangleq> ?\<sigma> \<and> Q_memset_addr_0x5db5_41 ?\<sigma> \<and> block_usage P_0x5db5_41_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x5db5_41_def P_0x5db5_41_regions_def post: Q_memset_addr_0x5db5_41_def regionset: P_0x5db5_41_regions_set_def)

definition P_0x5dba_42 :: state_pred where
  \<open>P_0x5dba_42 \<sigma> \<equiv> RIP \<sigma> = 0x5dba \<and> RBX \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> RCX \<sigma> = (sextend (ucast (((\<langle>31,0\<rangle>R12 \<sigma>::32 word) << 9))) 32 64::64 word) \<and> RDX \<sigma> = (sextend (ucast (((\<langle>31,0\<rangle>R12 \<sigma>::32 word) << 9))) 32 64::64 word) \<and> RDI \<sigma> = R15 \<sigma> \<and> RSI \<sigma> = 0x0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x48) \<and> RBP \<sigma> = RDI\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x850),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x850),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word)::64 word) + (\<langle>63,0\<rangle>((((if' (R14 \<sigma>::64 word) \<ge>s (ucast ((0x0::64 word))::64 word) then R14 \<sigma> else (((R14 \<sigma>::64 word) + 0x7)::64 word)) >>> 3)::64 word) * 0x1)::64 word)),1]::8 word) = ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word)::64 word) + (\<langle>63,0\<rangle>((((if' (R14 \<sigma>::64 word) \<ge>s (ucast ((0x0::64 word))::64 word) then R14 \<sigma> else (((R14 \<sigma>::64 word) + 0x7)::64 word)) >>> 3)::64 word) * 0x1)::64 word)),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (sextend (ucast (((\<langle>31,0\<rangle>R12 \<sigma>::32 word) << 9))) 32 64::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),8]::64 word) = 0x5dba\<close>
declare P_0x5dba_42_def[Ps]

definition P_0x5dba_42_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x5dba_42_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((RDI\<^sub>0::64 word) + 0x40), 8),
    (2, ((RDI\<^sub>0::64 word) + 0x850), 8),
    (3, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8), 8),
    (4, (((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word)::64 word) + (\<langle>63,0\<rangle>((((if' (R14 \<sigma>::64 word) \<ge>s (ucast ((0x0::64 word))::64 word) then R14 \<sigma> else (((R14 \<sigma>::64 word) + 0x7)::64 word)) >>> 3)::64 word) * 0x1)::64 word)), Suc 0),
    (5, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (11, ((RSP\<^sub>0::64 word) - 0x40), 8),
    (12, ((RSP\<^sub>0::64 word) - 0x50), 8)
  }\<close>

definition P_0x5dba_42_regions :: state_pred where
  \<open>P_0x5dba_42_regions \<sigma> \<equiv> \<exists>regions. P_0x5dba_42_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x5d63_42 :: state_pred where
  \<open>Q_0x5d63_42 \<sigma> \<equiv> RIP \<sigma> = 0x5d63 \<and> RBX \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> RCX \<sigma> = (sextend (ucast (((\<langle>31,0\<rangle>R12 \<sigma>::32 word) << 9))) 32 64::64 word) \<and> RDX \<sigma> = (sextend (ucast (((\<langle>31,0\<rangle>R12 \<sigma>::32 word) << 9))) 32 64::64 word) \<and> RDI \<sigma> = R15 \<sigma> \<and> RSI \<sigma> = 0x0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x48) \<and> RBP \<sigma> = RDI\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x850),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x850),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word)::64 word) + (\<langle>63,0\<rangle>((((if' (R14 \<sigma>::64 word) \<ge>s (ucast ((0x0::64 word))::64 word) then R14 \<sigma> else (((R14 \<sigma>::64 word) + 0x7)::64 word)) >>> 3)::64 word) * 0x1)::64 word)),1]::8 word) = ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word)::64 word) + (\<langle>63,0\<rangle>((((if' (R14 \<sigma>::64 word) \<ge>s (ucast ((0x0::64 word))::64 word) then R14 \<sigma> else (((R14 \<sigma>::64 word) + 0x7)::64 word)) >>> 3)::64 word) * 0x1)::64 word)),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (sextend (ucast (((\<langle>31,0\<rangle>R12 \<sigma>::32 word) << 9))) 32 64::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),8]::64 word) = 0x5dba\<close>
declare Q_0x5d63_42_def[Qs]

schematic_goal cow_read_0_2_0x5dba_0x5dbf_42[blocks]:
  assumes \<open>(P_0x5dba_42 && P_0x5dba_42_regions) \<sigma>\<close>
  shows \<open>exec_block 2 0x5dbf 42 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x5d63_42 ?\<sigma> \<and> block_usage P_0x5dba_42_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x5dba_42_def P_0x5dba_42_regions_def post: Q_0x5d63_42_def regionset: P_0x5dba_42_regions_set_def)

definition P_0x5d63_43 :: state_pred where
  \<open>P_0x5d63_43 \<sigma> \<equiv> RIP \<sigma> = 0x5d63 \<and> RBX \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> RCX \<sigma> = (sextend (ucast (((\<langle>31,0\<rangle>R12 \<sigma>::32 word) << 9))) 32 64::64 word) \<and> RDX \<sigma> = (sextend (ucast (((\<langle>31,0\<rangle>R12 \<sigma>::32 word) << 9))) 32 64::64 word) \<and> RDI \<sigma> = R15 \<sigma> \<and> RSI \<sigma> = 0x0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x48) \<and> RBP \<sigma> = RDI\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x850),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x850),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word)::64 word) + (\<langle>63,0\<rangle>((((if' (R14 \<sigma>::64 word) \<ge>s (ucast ((0x0::64 word))::64 word) then R14 \<sigma> else (((R14 \<sigma>::64 word) + 0x7)::64 word)) >>> 3)::64 word) * 0x1)::64 word)),1]::8 word) = ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word)::64 word) + (\<langle>63,0\<rangle>((((if' (R14 \<sigma>::64 word) \<ge>s (ucast ((0x0::64 word))::64 word) then R14 \<sigma> else (((R14 \<sigma>::64 word) + 0x7)::64 word)) >>> 3)::64 word) * 0x1)::64 word)),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (sextend (ucast (((\<langle>31,0\<rangle>R12 \<sigma>::32 word) << 9))) 32 64::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),8]::64 word) = 0x5dba\<close>
declare P_0x5d63_43_def[Ps]

definition P_0x5d63_43_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x5d63_43_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((RDI\<^sub>0::64 word) + 0x40), 8),
    (2, ((RDI\<^sub>0::64 word) + 0x850), 8),
    (3, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8), 8),
    (4, (((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word)::64 word) + (\<langle>63,0\<rangle>((((if' (R14 \<sigma>::64 word) \<ge>s (ucast ((0x0::64 word))::64 word) then R14 \<sigma> else (((R14 \<sigma>::64 word) + 0x7)::64 word)) >>> 3)::64 word) * 0x1)::64 word)), Suc 0),
    (5, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (11, ((RSP\<^sub>0::64 word) - 0x40), 8),
    (12, ((RSP\<^sub>0::64 word) - 0x50), 8)
  }\<close>

definition P_0x5d63_43_regions :: state_pred where
  \<open>P_0x5d63_43_regions \<sigma> \<equiv> \<exists>regions. P_0x5d63_43_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x5d72_43 :: state_pred where
  \<open>Q_0x5d72_43 \<sigma> \<equiv> RIP \<sigma> = 0x5d72 \<and> RBX \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x48) \<and> RBP \<sigma> = RDI\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0\<close>
declare Q_0x5d72_43_def[Qs]

schematic_goal cow_read_0_5_0x5d63_0x5d6f_43[blocks]:
  assumes \<open>(P_0x5d63_43 && P_0x5d63_43_regions) \<sigma>\<close>
  shows \<open>exec_block 5 0x5d6f 43 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x5d72_43 ?\<sigma> \<and> block_usage P_0x5d63_43_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x5d63_43_def P_0x5d63_43_regions_def post: Q_0x5d72_43_def regionset: P_0x5d63_43_regions_set_def)

definition P_0x5d72_true_44 :: state_pred where
  \<open>P_0x5d72_true_44 \<sigma> \<equiv> RIP \<sigma> = 0x5d72 \<and> RBX \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x48) \<and> RBP \<sigma> = RDI\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0\<close>
declare P_0x5d72_true_44_def[Ps]

definition P_0x5d72_true_44_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x5d72_true_44_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((RDI\<^sub>0::64 word) + 0x40), 8),
    (2, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x30), 8)
  }\<close>

definition P_0x5d72_true_44_regions :: state_pred where
  \<open>P_0x5d72_true_44_regions \<sigma> \<equiv> \<exists>regions. P_0x5d72_true_44_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x5c60_44 :: state_pred where
  \<open>Q_0x5c60_44 \<sigma> \<equiv> RIP \<sigma> = 0x5c60 \<and> RBX \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x48) \<and> RBP \<sigma> = RDI\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0\<close>
declare Q_0x5c60_44_def[Qs]

schematic_goal cow_read_0_1_0x5d72_0x5d72_44[blocks]:
  assumes \<open>(P_0x5d72_true_44 && P_0x5d72_true_44_regions && jg) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x5d72 44 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x5c60_44 ?\<sigma> \<and> block_usage P_0x5d72_true_44_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x5d72_true_44_def P_0x5d72_true_44_regions_def post: Q_0x5c60_44_def regionset: P_0x5d72_true_44_regions_set_def)

definition P_0x5d72_false_45 :: state_pred where
  \<open>P_0x5d72_false_45 \<sigma> \<equiv> RIP \<sigma> = 0x5d72 \<and> RBX \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x48) \<and> RBP \<sigma> = RDI\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0\<close>
declare P_0x5d72_false_45_def[Ps]

definition P_0x5d72_false_45_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x5d72_false_45_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((RDI\<^sub>0::64 word) + 0x40), 8),
    (2, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x30), 8)
  }\<close>

definition P_0x5d72_false_45_regions :: state_pred where
  \<open>P_0x5d72_false_45_regions \<sigma> \<equiv> \<exists>regions. P_0x5d72_false_45_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x5d78_45 :: state_pred where
  \<open>Q_0x5d78_45 \<sigma> \<equiv> RIP \<sigma> = 0x5d78 \<and> RBX \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x48) \<and> RBP \<sigma> = RDI\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0\<close>
declare Q_0x5d78_45_def[Qs]

schematic_goal cow_read_0_1_0x5d72_0x5d72_45[blocks]:
  assumes \<open>(P_0x5d72_false_45 && P_0x5d72_false_45_regions && ! jg) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x5d72 45 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x5d78_45 ?\<sigma> \<and> block_usage P_0x5d72_false_45_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x5d72_false_45_def P_0x5d72_false_45_regions_def post: Q_0x5d78_45_def regionset: P_0x5d72_false_45_regions_set_def)

definition P_0x5d45_false_46 :: state_pred where
  \<open>P_0x5d45_false_46 \<sigma> \<equiv> RIP \<sigma> = 0x5d45 \<and> RBX \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> RCX \<sigma> = ucast ((\<langle>31,0\<rangle>R12 \<sigma>::32 word)) \<and> RDI \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x850),8]::64 word) \<and> RSI \<sigma> = ucast (((((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word)::64 word) + (\<langle>63,0\<rangle>((((if' (R14 \<sigma>::64 word) \<ge>s (ucast ((0x0::64 word))::64 word) then R14 \<sigma> else (((R14 \<sigma>::64 word) + 0x7)::64 word)) >>> 3)::64 word) * 0x1)::64 word)),1]::8 word)::32 word) >>> unat (((\<langle>7,0\<rangle>((ucast (((((\<langle>31,0\<rangle>((R14 \<sigma>::64 word) + (\<langle>63,0\<rangle>((((R14 \<sigma> >>> 63) >> 61)::64 word) * 0x1)::64 word))::32 word)::32 word) AND 0x7)::32 word))::64 word) - (((R14 \<sigma> >>> 63) >> 61)::64 word))::8 word)::8 word)))::32 word) AND 0x1)) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x48) \<and> RBP \<sigma> = RDI\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x850),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x850),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word)::64 word) + (\<langle>63,0\<rangle>((((if' (R14 \<sigma>::64 word) \<ge>s (ucast ((0x0::64 word))::64 word) then R14 \<sigma> else (((R14 \<sigma>::64 word) + 0x7)::64 word)) >>> 3)::64 word) * 0x1)::64 word)),1]::8 word) = ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word)::64 word) + (\<langle>63,0\<rangle>((((if' (R14 \<sigma>::64 word) \<ge>s (ucast ((0x0::64 word))::64 word) then R14 \<sigma> else (((R14 \<sigma>::64 word) + 0x7)::64 word)) >>> 3)::64 word) * 0x1)::64 word)),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0\<close>
declare P_0x5d45_false_46_def[Ps]

definition P_0x5d45_false_46_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x5d45_false_46_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((RDI\<^sub>0::64 word) + 0x40), 8),
    (2, ((RDI\<^sub>0::64 word) + 0x850), 8),
    (3, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8), 8),
    (4, (((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word)::64 word) + (\<langle>63,0\<rangle>((((if' (R14 \<sigma>::64 word) \<ge>s (ucast ((0x0::64 word))::64 word) then R14 \<sigma> else (((R14 \<sigma>::64 word) + 0x7)::64 word)) >>> 3)::64 word) * 0x1)::64 word)), Suc 0),
    (5, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x30), 8)
  }\<close>

definition P_0x5d45_false_46_regions :: state_pred where
  \<open>P_0x5d45_false_46_regions \<sigma> \<equiv> \<exists>regions. P_0x5d45_false_46_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x5d4d_46 :: state_pred where
  \<open>Q_0x5d4d_46 \<sigma> \<equiv> RIP \<sigma> = 0x5d4d \<and> RBX \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> RCX \<sigma> = ucast ((\<langle>31,0\<rangle>R12 \<sigma>::32 word)) \<and> RDX \<sigma> = R15 \<sigma> \<and> RDI \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x850),8]::64 word) \<and> RSI \<sigma> = R14 \<sigma> \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x48) \<and> RBP \<sigma> = RDI\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x850),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x850),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word)::64 word) + (\<langle>63,0\<rangle>((((if' (R14 \<sigma>::64 word) \<ge>s (ucast ((0x0::64 word))::64 word) then R14 \<sigma> else (((R14 \<sigma>::64 word) + 0x7)::64 word)) >>> 3)::64 word) * 0x1)::64 word)),1]::8 word) = ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word)::64 word) + (\<langle>63,0\<rangle>((((if' (R14 \<sigma>::64 word) \<ge>s (ucast ((0x0::64 word))::64 word) then R14 \<sigma> else (((R14 \<sigma>::64 word) + 0x7)::64 word)) >>> 3)::64 word) * 0x1)::64 word)),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0\<close>
declare Q_0x5d4d_46_def[Qs]

schematic_goal cow_read_0_3_0x5d45_0x5d4a_46[blocks]:
  assumes \<open>(P_0x5d45_false_46 && P_0x5d45_false_46_regions && ! ZF) \<sigma>\<close>
  shows \<open>exec_block 3 0x5d4a 46 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x5d4d_46 ?\<sigma> \<and> block_usage P_0x5d45_false_46_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x5d45_false_46_def P_0x5d45_false_46_regions_def post: Q_0x5d4d_46_def regionset: P_0x5d45_false_46_regions_set_def)

definition P_0x5d4d_47 :: state_pred where
  \<open>P_0x5d4d_47 \<sigma> \<equiv> RIP \<sigma> = 0x5d4d \<and> RBX \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> RCX \<sigma> = ucast ((\<langle>31,0\<rangle>R12 \<sigma>::32 word)) \<and> RDX \<sigma> = R15 \<sigma> \<and> RDI \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x850),8]::64 word) \<and> RSI \<sigma> = R14 \<sigma> \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x48) \<and> RBP \<sigma> = RDI\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x850),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x850),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word)::64 word) + (\<langle>63,0\<rangle>((((if' (R14 \<sigma>::64 word) \<ge>s (ucast ((0x0::64 word))::64 word) then R14 \<sigma> else (((R14 \<sigma>::64 word) + 0x7)::64 word)) >>> 3)::64 word) * 0x1)::64 word)),1]::8 word) = ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word)::64 word) + (\<langle>63,0\<rangle>((((if' (R14 \<sigma>::64 word) \<ge>s (ucast ((0x0::64 word))::64 word) then R14 \<sigma> else (((R14 \<sigma>::64 word) + 0x7)::64 word)) >>> 3)::64 word) * 0x1)::64 word)),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0\<close>
declare P_0x5d4d_47_def[Ps]

definition P_0x5d4d_47_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x5d4d_47_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((RDI\<^sub>0::64 word) + 0x40), 8),
    (2, ((RDI\<^sub>0::64 word) + 0x850), 8),
    (3, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8), 8),
    (4, (((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word)::64 word) + (\<langle>63,0\<rangle>((((if' (R14 \<sigma>::64 word) \<ge>s (ucast ((0x0::64 word))::64 word) then R14 \<sigma> else (((R14 \<sigma>::64 word) + 0x7)::64 word)) >>> 3)::64 word) * 0x1)::64 word)), Suc 0),
    (5, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (11, ((RSP\<^sub>0::64 word) - 0x50), 8)
  }\<close>

definition P_0x5d4d_47_regions :: state_pred where
  \<open>P_0x5d4d_47_regions \<sigma> \<equiv> \<exists>regions. P_0x5d4d_47_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_bdrv_read_addr_0x5d4d_47 :: state_pred where
  \<open>Q_bdrv_read_addr_0x5d4d_47 \<sigma> \<equiv> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x50) \<and> RIP \<sigma> = bdrv_read_addr \<and> RBX \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> RCX \<sigma> = ucast ((\<langle>31,0\<rangle>R12 \<sigma>::32 word)) \<and> RDX \<sigma> = R15 \<sigma> \<and> RDI \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x850),8]::64 word) \<and> RSI \<sigma> = R14 \<sigma> \<and> RBP \<sigma> = RDI\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x850),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x850),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word)::64 word) + (\<langle>63,0\<rangle>((((if' (R14 \<sigma>::64 word) \<ge>s (ucast ((0x0::64 word))::64 word) then R14 \<sigma> else (((R14 \<sigma>::64 word) + 0x7)::64 word)) >>> 3)::64 word) * 0x1)::64 word)),1]::8 word) = ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word)::64 word) + (\<langle>63,0\<rangle>((((if' (R14 \<sigma>::64 word) \<ge>s (ucast ((0x0::64 word))::64 word) then R14 \<sigma> else (((R14 \<sigma>::64 word) + 0x7)::64 word)) >>> 3)::64 word) * 0x1)::64 word)),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),8]::64 word) = 0x5d52\<close>
declare Q_bdrv_read_addr_0x5d4d_47_def[Qs]

schematic_goal cow_read_0_1_0x5d4d_0x5d4d_47[blocks]:
  assumes \<open>(P_0x5d4d_47 && P_0x5d4d_47_regions) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x5d4d 47 \<sigma> \<triangleq> ?\<sigma> \<and> Q_bdrv_read_addr_0x5d4d_47 ?\<sigma> \<and> block_usage P_0x5d4d_47_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x5d4d_47_def P_0x5d4d_47_regions_def post: Q_bdrv_read_addr_0x5d4d_47_def regionset: P_0x5d4d_47_regions_set_def)

definition P_0x5d52_48 :: state_pred where
  \<open>P_0x5d52_48 \<sigma> \<equiv> RIP \<sigma> = 0x5d52 \<and> RBX \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> RCX \<sigma> = ucast ((\<langle>31,0\<rangle>R12 \<sigma>::32 word)) \<and> RDX \<sigma> = R15 \<sigma> \<and> RDI \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x850),8]::64 word) \<and> RSI \<sigma> = R14 \<sigma> \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x48) \<and> RBP \<sigma> = RDI\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x850),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x850),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word)::64 word) + (\<langle>63,0\<rangle>((((if' (R14 \<sigma>::64 word) \<ge>s (ucast ((0x0::64 word))::64 word) then R14 \<sigma> else (((R14 \<sigma>::64 word) + 0x7)::64 word)) >>> 3)::64 word) * 0x1)::64 word)),1]::8 word) = ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word)::64 word) + (\<langle>63,0\<rangle>((((if' (R14 \<sigma>::64 word) \<ge>s (ucast ((0x0::64 word))::64 word) then R14 \<sigma> else (((R14 \<sigma>::64 word) + 0x7)::64 word)) >>> 3)::64 word) * 0x1)::64 word)),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),8]::64 word) = 0x5d52\<close>
declare P_0x5d52_48_def[Ps]

definition P_0x5d52_48_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x5d52_48_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((RDI\<^sub>0::64 word) + 0x40), 8),
    (2, ((RDI\<^sub>0::64 word) + 0x850), 8),
    (3, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8), 8),
    (4, (((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word)::64 word) + (\<langle>63,0\<rangle>((((if' (R14 \<sigma>::64 word) \<ge>s (ucast ((0x0::64 word))::64 word) then R14 \<sigma> else (((R14 \<sigma>::64 word) + 0x7)::64 word)) >>> 3)::64 word) * 0x1)::64 word)), Suc 0),
    (5, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (11, ((RSP\<^sub>0::64 word) - 0x50), 8)
  }\<close>

definition P_0x5d52_48_regions :: state_pred where
  \<open>P_0x5d52_48_regions \<sigma> \<equiv> \<exists>regions. P_0x5d52_48_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x5d54_48 :: state_pred where
  \<open>Q_0x5d54_48 \<sigma> \<equiv> RIP \<sigma> = 0x5d54 \<and> RBX \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> RCX \<sigma> = ucast ((\<langle>31,0\<rangle>R12 \<sigma>::32 word)) \<and> RDX \<sigma> = R15 \<sigma> \<and> RDI \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x850),8]::64 word) \<and> RSI \<sigma> = R14 \<sigma> \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x48) \<and> RBP \<sigma> = RDI\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x850),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x850),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word)::64 word) + (\<langle>63,0\<rangle>((((if' (R14 \<sigma>::64 word) \<ge>s (ucast ((0x0::64 word))::64 word) then R14 \<sigma> else (((R14 \<sigma>::64 word) + 0x7)::64 word)) >>> 3)::64 word) * 0x1)::64 word)),1]::8 word) = ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word)::64 word) + (\<langle>63,0\<rangle>((((if' (R14 \<sigma>::64 word) \<ge>s (ucast ((0x0::64 word))::64 word) then R14 \<sigma> else (((R14 \<sigma>::64 word) + 0x7)::64 word)) >>> 3)::64 word) * 0x1)::64 word)),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),8]::64 word) = 0x5d52\<close>
declare Q_0x5d54_48_def[Qs]

schematic_goal cow_read_0_1_0x5d52_0x5d52_48[blocks]:
  assumes \<open>(P_0x5d52_48 && P_0x5d52_48_regions) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x5d52 48 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x5d54_48 ?\<sigma> \<and> block_usage P_0x5d52_48_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x5d52_48_def P_0x5d52_48_regions_def post: Q_0x5d54_48_def regionset: P_0x5d52_48_regions_set_def)

definition P_0x5d54_true_49 :: state_pred where
  \<open>P_0x5d54_true_49 \<sigma> \<equiv> RIP \<sigma> = 0x5d54 \<and> RBX \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> RCX \<sigma> = ucast ((\<langle>31,0\<rangle>R12 \<sigma>::32 word)) \<and> RDX \<sigma> = R15 \<sigma> \<and> RDI \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x850),8]::64 word) \<and> RSI \<sigma> = R14 \<sigma> \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x48) \<and> RBP \<sigma> = RDI\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x850),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x850),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word)::64 word) + (\<langle>63,0\<rangle>((((if' (R14 \<sigma>::64 word) \<ge>s (ucast ((0x0::64 word))::64 word) then R14 \<sigma> else (((R14 \<sigma>::64 word) + 0x7)::64 word)) >>> 3)::64 word) * 0x1)::64 word)),1]::8 word) = ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word)::64 word) + (\<langle>63,0\<rangle>((((if' (R14 \<sigma>::64 word) \<ge>s (ucast ((0x0::64 word))::64 word) then R14 \<sigma> else (((R14 \<sigma>::64 word) + 0x7)::64 word)) >>> 3)::64 word) * 0x1)::64 word)),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),8]::64 word) = 0x5d52\<close>
declare P_0x5d54_true_49_def[Ps]

definition P_0x5d54_true_49_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x5d54_true_49_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((RDI\<^sub>0::64 word) + 0x40), 8),
    (2, ((RDI\<^sub>0::64 word) + 0x850), 8),
    (3, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8), 8),
    (4, (((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word)::64 word) + (\<langle>63,0\<rangle>((((if' (R14 \<sigma>::64 word) \<ge>s (ucast ((0x0::64 word))::64 word) then R14 \<sigma> else (((R14 \<sigma>::64 word) + 0x7)::64 word)) >>> 3)::64 word) * 0x1)::64 word)), Suc 0),
    (5, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (11, ((RSP\<^sub>0::64 word) - 0x50), 8)
  }\<close>

definition P_0x5d54_true_49_regions :: state_pred where
  \<open>P_0x5d54_true_49_regions \<sigma> \<equiv> \<exists>regions. P_0x5d54_true_49_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x5e04_49 :: state_pred where
  \<open>Q_0x5e04_49 \<sigma> \<equiv> RIP \<sigma> = 0x5e04 \<and> RBX \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x48) \<and> RBP \<sigma> = RDI\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0\<close>
declare Q_0x5e04_49_def[Qs]

schematic_goal cow_read_0_1_0x5d54_0x5d54_49[blocks]:
  assumes \<open>(P_0x5d54_true_49 && P_0x5d54_true_49_regions && SF) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x5d54 49 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x5e04_49 ?\<sigma> \<and> block_usage P_0x5d54_true_49_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x5d54_true_49_def P_0x5d54_true_49_regions_def post: Q_0x5e04_49_def regionset: P_0x5d54_true_49_regions_set_def)

definition P_0x5d54_false_50 :: state_pred where
  \<open>P_0x5d54_false_50 \<sigma> \<equiv> RIP \<sigma> = 0x5d54 \<and> RBX \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> RCX \<sigma> = ucast ((\<langle>31,0\<rangle>R12 \<sigma>::32 word)) \<and> RDX \<sigma> = R15 \<sigma> \<and> RDI \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x850),8]::64 word) \<and> RSI \<sigma> = R14 \<sigma> \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x48) \<and> RBP \<sigma> = RDI\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x850),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x850),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word)::64 word) + (\<langle>63,0\<rangle>((((if' (R14 \<sigma>::64 word) \<ge>s (ucast ((0x0::64 word))::64 word) then R14 \<sigma> else (((R14 \<sigma>::64 word) + 0x7)::64 word)) >>> 3)::64 word) * 0x1)::64 word)),1]::8 word) = ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word)::64 word) + (\<langle>63,0\<rangle>((((if' (R14 \<sigma>::64 word) \<ge>s (ucast ((0x0::64 word))::64 word) then R14 \<sigma> else (((R14 \<sigma>::64 word) + 0x7)::64 word)) >>> 3)::64 word) * 0x1)::64 word)),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),8]::64 word) = 0x5d52\<close>
declare P_0x5d54_false_50_def[Ps]

definition P_0x5d54_false_50_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x5d54_false_50_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((RDI\<^sub>0::64 word) + 0x40), 8),
    (2, ((RDI\<^sub>0::64 word) + 0x850), 8),
    (3, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8), 8),
    (4, (((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word)::64 word) + (\<langle>63,0\<rangle>((((if' (R14 \<sigma>::64 word) \<ge>s (ucast ((0x0::64 word))::64 word) then R14 \<sigma> else (((R14 \<sigma>::64 word) + 0x7)::64 word)) >>> 3)::64 word) * 0x1)::64 word)), Suc 0),
    (5, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (11, ((RSP\<^sub>0::64 word) - 0x50), 8)
  }\<close>

definition P_0x5d54_false_50_regions :: state_pred where
  \<open>P_0x5d54_false_50_regions \<sigma> \<equiv> \<exists>regions. P_0x5d54_false_50_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x5d63_50 :: state_pred where
  \<open>Q_0x5d63_50 \<sigma> \<equiv> RIP \<sigma> = 0x5d63 \<and> RBX \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> RCX \<sigma> = (sextend (ucast (((\<langle>31,0\<rangle>R12 \<sigma>::32 word) << 9))) 32 64::64 word) \<and> RDX \<sigma> = R15 \<sigma> \<and> RDI \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x850),8]::64 word) \<and> RSI \<sigma> = R14 \<sigma> \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x48) \<and> RBP \<sigma> = RDI\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x850),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x850),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word)::64 word) + (\<langle>63,0\<rangle>((((if' (R14 \<sigma>::64 word) \<ge>s (ucast ((0x0::64 word))::64 word) then R14 \<sigma> else (((R14 \<sigma>::64 word) + 0x7)::64 word)) >>> 3)::64 word) * 0x1)::64 word)),1]::8 word) = ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word)::64 word) + (\<langle>63,0\<rangle>((((if' (R14 \<sigma>::64 word) \<ge>s (ucast ((0x0::64 word))::64 word) then R14 \<sigma> else (((R14 \<sigma>::64 word) + 0x7)::64 word)) >>> 3)::64 word) * 0x1)::64 word)),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),8]::64 word) = 0x5d52\<close>
declare Q_0x5d63_50_def[Qs]

schematic_goal cow_read_0_4_0x5d54_0x5d60_50[blocks]:
  assumes \<open>(P_0x5d54_false_50 && P_0x5d54_false_50_regions && ! SF) \<sigma>\<close>
  shows \<open>exec_block 4 0x5d60 50 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x5d63_50 ?\<sigma> \<and> block_usage P_0x5d54_false_50_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x5d54_false_50_def P_0x5d54_false_50_regions_def post: Q_0x5d63_50_def regionset: P_0x5d54_false_50_regions_set_def)

definition P_0x5d63_51 :: state_pred where
  \<open>P_0x5d63_51 \<sigma> \<equiv> RIP \<sigma> = 0x5d63 \<and> RBX \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> RCX \<sigma> = (sextend (ucast (((\<langle>31,0\<rangle>R12 \<sigma>::32 word) << 9))) 32 64::64 word) \<and> RDX \<sigma> = R15 \<sigma> \<and> RDI \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x850),8]::64 word) \<and> RSI \<sigma> = R14 \<sigma> \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x48) \<and> RBP \<sigma> = RDI\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x850),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x850),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word)::64 word) + (\<langle>63,0\<rangle>((((if' (R14 \<sigma>::64 word) \<ge>s (ucast ((0x0::64 word))::64 word) then R14 \<sigma> else (((R14 \<sigma>::64 word) + 0x7)::64 word)) >>> 3)::64 word) * 0x1)::64 word)),1]::8 word) = ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word)::64 word) + (\<langle>63,0\<rangle>((((if' (R14 \<sigma>::64 word) \<ge>s (ucast ((0x0::64 word))::64 word) then R14 \<sigma> else (((R14 \<sigma>::64 word) + 0x7)::64 word)) >>> 3)::64 word) * 0x1)::64 word)),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),8]::64 word) = 0x5d52\<close>
declare P_0x5d63_51_def[Ps]

definition P_0x5d63_51_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x5d63_51_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((RDI\<^sub>0::64 word) + 0x40), 8),
    (2, ((RDI\<^sub>0::64 word) + 0x850), 8),
    (3, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8), 8),
    (4, (((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x8),8]::64 word)::64 word) + (\<langle>63,0\<rangle>((((if' (R14 \<sigma>::64 word) \<ge>s (ucast ((0x0::64 word))::64 word) then R14 \<sigma> else (((R14 \<sigma>::64 word) + 0x7)::64 word)) >>> 3)::64 word) * 0x1)::64 word)), Suc 0),
    (5, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (11, ((RSP\<^sub>0::64 word) - 0x50), 8)
  }\<close>

definition P_0x5d63_51_regions :: state_pred where
  \<open>P_0x5d63_51_regions \<sigma> \<equiv> \<exists>regions. P_0x5d63_51_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x5d72_51 :: state_pred where
  \<open>Q_0x5d72_51 \<sigma> \<equiv> RIP \<sigma> = 0x5d72 \<and> RBX \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x48) \<and> RBP \<sigma> = RDI\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0\<close>
declare Q_0x5d72_51_def[Qs]

schematic_goal cow_read_0_5_0x5d63_0x5d6f_51[blocks]:
  assumes \<open>(P_0x5d63_51 && P_0x5d63_51_regions) \<sigma>\<close>
  shows \<open>exec_block 5 0x5d6f 51 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x5d72_51 ?\<sigma> \<and> block_usage P_0x5d63_51_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x5d63_51_def P_0x5d63_51_regions_def post: Q_0x5d72_51_def regionset: P_0x5d63_51_regions_set_def)

definition P_0x5d72_true_52 :: state_pred where
  \<open>P_0x5d72_true_52 \<sigma> \<equiv> RIP \<sigma> = 0x5d72 \<and> RBX \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x48) \<and> RBP \<sigma> = RDI\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0\<close>
declare P_0x5d72_true_52_def[Ps]

definition P_0x5d72_true_52_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x5d72_true_52_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((RDI\<^sub>0::64 word) + 0x40), 8),
    (2, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x30), 8)
  }\<close>

definition P_0x5d72_true_52_regions :: state_pred where
  \<open>P_0x5d72_true_52_regions \<sigma> \<equiv> \<exists>regions. P_0x5d72_true_52_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x5c60_52 :: state_pred where
  \<open>Q_0x5c60_52 \<sigma> \<equiv> RIP \<sigma> = 0x5c60 \<and> RBX \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x48) \<and> RBP \<sigma> = RDI\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0\<close>
declare Q_0x5c60_52_def[Qs]

schematic_goal cow_read_0_1_0x5d72_0x5d72_52[blocks]:
  assumes \<open>(P_0x5d72_true_52 && P_0x5d72_true_52_regions && jg) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x5d72 52 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x5c60_52 ?\<sigma> \<and> block_usage P_0x5d72_true_52_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x5d72_true_52_def P_0x5d72_true_52_regions_def post: Q_0x5c60_52_def regionset: P_0x5d72_true_52_regions_set_def)

definition P_0x5d72_false_53 :: state_pred where
  \<open>P_0x5d72_false_53 \<sigma> \<equiv> RIP \<sigma> = 0x5d72 \<and> RBX \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x48) \<and> RBP \<sigma> = RDI\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0\<close>
declare P_0x5d72_false_53_def[Ps]

definition P_0x5d72_false_53_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x5d72_false_53_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((RDI\<^sub>0::64 word) + 0x40), 8),
    (2, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x30), 8)
  }\<close>

definition P_0x5d72_false_53_regions :: state_pred where
  \<open>P_0x5d72_false_53_regions \<sigma> \<equiv> \<exists>regions. P_0x5d72_false_53_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x5d78_53 :: state_pred where
  \<open>Q_0x5d78_53 \<sigma> \<equiv> RIP \<sigma> = 0x5d78 \<and> RBX \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x48) \<and> RBP \<sigma> = RDI\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0\<close>
declare Q_0x5d78_53_def[Qs]

schematic_goal cow_read_0_1_0x5d72_0x5d72_53[blocks]:
  assumes \<open>(P_0x5d72_false_53 && P_0x5d72_false_53_regions && ! jg) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x5d72 53 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x5d78_53 ?\<sigma> \<and> block_usage P_0x5d72_false_53_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x5d72_false_53_def P_0x5d72_false_53_regions_def post: Q_0x5d78_53_def regionset: P_0x5d72_false_53_regions_set_def)

definition P_0x5e04_54 :: state_pred where
  \<open>P_0x5e04_54 \<sigma> \<equiv> RIP \<sigma> = 0x5e04 \<and> RBX \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x48) \<and> RBP \<sigma> = RDI\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0\<close>
declare P_0x5e04_54_def[Ps]

definition P_0x5e04_54_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x5e04_54_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((RDI\<^sub>0::64 word) + 0x40), 8),
    (2, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x30), 8)
  }\<close>

definition P_0x5e04_54_regions :: state_pred where
  \<open>P_0x5e04_54_regions \<sigma> \<equiv> \<exists>regions. P_0x5e04_54_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_ret_address_54 :: state_pred where
  \<open>Q_ret_address_54 \<sigma> \<equiv> RIP \<sigma> = ret_address \<and> RBX \<sigma> = RBX\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) + 0x8) \<and> RBP \<sigma> = RBP\<^sub>0 \<and> R15 \<sigma> = R15\<^sub>0 \<and> R14 \<sigma> = R14\<^sub>0 \<and> R13 \<sigma> = R13\<^sub>0 \<and> R12 \<sigma> = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0\<close>
declare Q_ret_address_54_def[Qs]

schematic_goal cow_read_0_9_0x5e04_0x5e17_54[blocks]:
  assumes \<open>(P_0x5e04_54 && P_0x5e04_54_regions) \<sigma>\<close>
  shows \<open>exec_block 9 0x5e17 54 \<sigma> \<triangleq> ?\<sigma> \<and> Q_ret_address_54 ?\<sigma> \<and> block_usage P_0x5e04_54_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x5e04_54_def P_0x5e04_54_regions_def post: Q_ret_address_54_def regionset: P_0x5e04_54_regions_set_def)

definition P_0x5d78_55 :: state_pred where
  \<open>P_0x5d78_55 \<sigma> \<equiv> RIP \<sigma> = 0x5d78 \<and> RBX \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x48) \<and> RBP \<sigma> = RDI\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0\<close>
declare P_0x5d78_55_def[Ps]

definition P_0x5d78_55_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x5d78_55_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((RDI\<^sub>0::64 word) + 0x40), 8),
    (2, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x30), 8)
  }\<close>

definition P_0x5d78_55_regions :: state_pred where
  \<open>P_0x5d78_55_regions \<sigma> \<equiv> \<exists>regions. P_0x5d78_55_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_ret_address_55 :: state_pred where
  \<open>Q_ret_address_55 \<sigma> \<equiv> RIP \<sigma> = ret_address \<and> RBX \<sigma> = RBX\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) + 0x8) \<and> RBP \<sigma> = RBP\<^sub>0 \<and> R15 \<sigma> = R15\<^sub>0 \<and> R14 \<sigma> = R14\<^sub>0 \<and> R13 \<sigma> = R13\<^sub>0 \<and> R12 \<sigma> = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0\<close>
declare Q_ret_address_55_def[Qs]

schematic_goal cow_read_0_9_0x5d78_0x5d88_55[blocks]:
  assumes \<open>(P_0x5d78_55 && P_0x5d78_55_regions) \<sigma>\<close>
  shows \<open>exec_block 9 0x5d88 55 \<sigma> \<triangleq> ?\<sigma> \<and> Q_ret_address_55 ?\<sigma> \<and> block_usage P_0x5d78_55_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x5d78_55_def P_0x5d78_55_regions_def post: Q_ret_address_55_def regionset: P_0x5d78_55_regions_set_def)

definition cow_read_acode :: ACode where
  \<open>cow_read_acode =
    Block 9 0x5c42 0;
    IF jle THEN
      Block 10 0x5d88 (Suc 0)
    ELSE
      Block 6 0x5c56 2;
      WHILE P_0x5c60_3 DO
        Block 2 0x5c64 3;
        IF ZF THEN
          Block 5 0x5d9d 4;
          IF !ZF THEN
            Block 3 0x5d4a 5;
            Block (Suc 0) 0x5d4d 6;
            CALL bdrv_read_acode;
            Block (Suc 0) 0x5d52 7;
            IF SF THEN
              Block (Suc 0) 0x5d54 8
            ELSE
              Block 4 0x5d60 9;
              Block 5 0x5d6f 10;
              IF jg THEN
                Block (Suc 0) 0x5d72 11
              ELSE
                Block (Suc 0) 0x5d72 12
              FI
            FI
          ELSE
            Block 7 0x5db0 13;
            Block (Suc 0) 0x5db5 14;
            CALL memset_acode;
            Block 2 0x5dbf 15;
            Block 5 0x5d6f 16;
            IF jg THEN
              Block (Suc 0) 0x5d72 17
            ELSE
              Block (Suc 0) 0x5d72 18
            FI
          FI
        ELSE
          Block 15 0x5c9a 19;
          IF ZF THEN
            Block 3 0x5e26 20
          ELSE
            Block 16 0x5cd5 21;
            IF !ZF THEN
              Block 3 0x5e26 22
            ELSE
              Block 4 0x5ce7 23;
              WHILE P_0x5d27_24 DO
                Block 2 0x5d2b 24;
                IF !ZF THEN
                  Block 17 0x5d23 25;
                  IF !ZF THEN
                    Block (Suc 0) 0x5d25 26
                  ELSE
                    Block (Suc 0) 0x5d25 27
                  FI
                ELSE
                  Block (Suc 0) 0x5d2e 28
                FI
              OD
            FI
          FI;
          Block (Suc 0) 0x5d30 29;
          IF !ZF THEN
            Block 6 0x5dd3 30;
            Block (Suc 0) 0x5dd7 31;
            CALL lseek64_acode;
            Block 7 0x5ded 32;
            Block (Suc 0) 0x5df2 33;
            CALL qemu_read_ok_acode;
            Block 2 0x5dfc 34;
            IF !SF THEN
              Block 6 0x5d6f 35;
              IF jg THEN
                Block (Suc 0) 0x5d72 36
              ELSE
                Block (Suc 0) 0x5d72 37
              FI
            ELSE
              Block (Suc 0) 0x5dfe 38
            FI
          ELSE
            Block 4 0x5d42 39;
            IF ZF THEN
              Block 7 0x5db0 40;
              Block (Suc 0) 0x5db5 41;
              CALL memset_acode;
              Block 2 0x5dbf 42;
              Block 5 0x5d6f 43;
              IF jg THEN
                Block (Suc 0) 0x5d72 44
              ELSE
                Block (Suc 0) 0x5d72 45
              FI
            ELSE
              Block 3 0x5d4a 46;
              Block (Suc 0) 0x5d4d 47;
              CALL bdrv_read_acode;
              Block (Suc 0) 0x5d52 48;
              IF SF THEN
                Block (Suc 0) 0x5d54 49
              ELSE
                Block 4 0x5d60 50;
                Block 5 0x5d6f 51;
                IF jg THEN
                  Block (Suc 0) 0x5d72 52
                ELSE
                  Block (Suc 0) 0x5d72 53
                FI
              FI
            FI
          FI
        FI
      OD;
      CASES [
        (P_0x5e04_54,
          Block 9 0x5e17 54
        ),
        (P_0x5d78_55,
          Block 9 0x5d88 55
        )
      ]
    FI
  \<close>

schematic_goal "cow_read":
  assumes
    \<open>\<forall>\<sigma>. RIP \<sigma> = 0x5c44 \<longrightarrow> P_0x5c44_true_1_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x5c44 \<longrightarrow> P_0x5c44_false_2_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x5c60 \<longrightarrow> P_0x5c60_3_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x5c67 \<longrightarrow> P_0x5c67_true_4_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x5da0 \<longrightarrow> P_0x5da0_true_5_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x5d4d \<longrightarrow> P_0x5d4d_6_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x5d52 \<longrightarrow> P_0x5d52_7_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x5d54 \<longrightarrow> P_0x5d54_true_8_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x5d54 \<longrightarrow> P_0x5d54_false_9_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x5d63 \<longrightarrow> P_0x5d63_10_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x5d72 \<longrightarrow> P_0x5d72_true_11_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x5d72 \<longrightarrow> P_0x5d72_false_12_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x5da0 \<longrightarrow> P_0x5da0_false_13_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x5db5 \<longrightarrow> P_0x5db5_14_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x5dba \<longrightarrow> P_0x5dba_15_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x5d63 \<longrightarrow> P_0x5d63_16_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x5d72 \<longrightarrow> P_0x5d72_true_17_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x5d72 \<longrightarrow> P_0x5d72_false_18_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x5c67 \<longrightarrow> P_0x5c67_false_19_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x5c9e \<longrightarrow> P_0x5c9e_true_20_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x5c9e \<longrightarrow> P_0x5c9e_false_21_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x5cd7 \<longrightarrow> P_0x5cd7_true_22_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x5cd7 \<longrightarrow> P_0x5cd7_false_23_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x5d27 \<longrightarrow> P_0x5d27_24_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x5d2e \<longrightarrow> P_0x5d2e_true_25_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x5d25 \<longrightarrow> P_0x5d25_true_26_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x5d25 \<longrightarrow> P_0x5d25_false_27_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x5d2e \<longrightarrow> P_0x5d2e_false_28_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x5d30 \<longrightarrow> P_0x5d30_29_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x5d32 \<longrightarrow> P_0x5d32_true_30_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x5dd7 \<longrightarrow> P_0x5dd7_31_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x5ddc \<longrightarrow> P_0x5ddc_32_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x5df2 \<longrightarrow> P_0x5df2_33_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x5df7 \<longrightarrow> P_0x5df7_34_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x5dfe \<longrightarrow> P_0x5dfe_true_35_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x5d72 \<longrightarrow> P_0x5d72_true_36_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x5d72 \<longrightarrow> P_0x5d72_false_37_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x5dfe \<longrightarrow> P_0x5dfe_false_38_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x5d32 \<longrightarrow> P_0x5d32_false_39_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x5d45 \<longrightarrow> P_0x5d45_true_40_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x5db5 \<longrightarrow> P_0x5db5_41_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x5dba \<longrightarrow> P_0x5dba_42_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x5d63 \<longrightarrow> P_0x5d63_43_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x5d72 \<longrightarrow> P_0x5d72_true_44_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x5d72 \<longrightarrow> P_0x5d72_false_45_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x5d45 \<longrightarrow> P_0x5d45_false_46_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x5d4d \<longrightarrow> P_0x5d4d_47_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x5d52 \<longrightarrow> P_0x5d52_48_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x5d54 \<longrightarrow> P_0x5d54_true_49_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x5d54 \<longrightarrow> P_0x5d54_false_50_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x5d63 \<longrightarrow> P_0x5d63_51_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x5d72 \<longrightarrow> P_0x5d72_true_52_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x5d72 \<longrightarrow> P_0x5d72_false_53_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x5e04 \<longrightarrow> P_0x5e04_54_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x5d78 \<longrightarrow> P_0x5d78_55_regions \<sigma>\<close>
    and [blocks]: \<open>{{Q_bdrv_read_addr_0x5d4d_6}} \<box>bdrv_read_acode {{P_0x5d52_7;M_0x5d4d}}\<close>
    and [blocks]: \<open>{{Q_memset_addr_0x5db5_14}} \<box>memset_acode {{P_0x5dba_15;M_0x5db5}}\<close>
    and [blocks]: \<open>{{Q_lseek64_addr_0x5dd7_31}} \<box>lseek64_acode {{P_0x5ddc_32;M_0x5dd7}}\<close>
    and [blocks]: \<open>{{Q_qemu_read_ok_addr_0x5df2_33}} \<box>qemu_read_ok_acode {{P_0x5df7_34;M_0x5df2}}\<close>
    and [blocks]: \<open>{{Q_memset_addr_0x5db5_41}} \<box>memset_acode {{P_0x5dba_42;M_0x5db5}}\<close>
    and [blocks]: \<open>{{Q_bdrv_read_addr_0x5d4d_47}} \<box>bdrv_read_acode {{P_0x5d52_48;M_0x5d4d}}\<close>
  shows \<open>{{?P}} cow_read_acode {{?Q;?M}}\<close>
  apply (vcg acode: cow_read_acode_def assms: assms)
      apply (vcg_while \<open>P_0x5c60_3 || P_0x5e04_54 || P_0x5d78_55\<close> assms: assms)
         apply (vcg_step assms: assms)+
                     apply (vcg_while \<open>P_0x5d27_24 || P_0x5d30_29\<close> assms: assms)
                      apply (vcg_step assms: assms)+
                     apply (simp add: pred_logic Ps Qs assms)+
              apply (vcg_step assms: assms)+
                   apply (simp add: assms)+
               apply (vcg_step assms: assms)+
        apply (simp add: pred_logic Ps Qs assms)
       apply (rule htriples)
          apply (simp only: snd_conv fst_conv)
          apply (vcg_step assms: assms)+
  done

end

end
