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
theory AES_set_decrypt_key
  imports "../../../isabelle/VCG/HTriple"
begin

locale "qemu_img_xen" = execution_context + exec_code +
  fixes AES_set_encrypt_key_0x7cb7_retval\<^sub>v AES_set_encrypt_key_addr :: \<open>64 word\<close>
    and AES_set_encrypt_key_acode :: ACode
  assumes fetch:
    "fetch 0x7cb0 \<equiv> (Unary (IS_8088 Push) (Storage (Reg (General SixtyFour r14))), 2)"
    "fetch 0x7cb2 \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour r14)) (Storage (Reg (General SixtyFour rdx))), 3)"
    "fetch 0x7cb5 \<equiv> (Unary (IS_8088 Push) (Storage (Reg (General SixtyFour rbp))), 1)"
    "fetch 0x7cb6 \<equiv> (Unary (IS_8088 Push) (Storage (Reg (General SixtyFour rbx))), 1)"
    "fetch 0x7cb7 \<equiv> (Unary (IS_8088 Call) (Immediate SixtyFour (ImmLabel ''AES_set_encrypt_key'')), 5)"
    "fetch 0x7cbc \<equiv> (Binary (IS_8088 Test) (Reg (General ThirtyTwo rax)) (Storage (Reg (General ThirtyTwo rax))), 2)"
    "fetch 0x7cbe \<equiv> (Unary (IS_8088 Js) (Immediate SixtyFour (ImmVal 32401)), 6)"
    "fetch 0x7cc4 \<equiv> (Binary (IS_8088 Mov) (Reg (General ThirtyTwo rax)) (Storage (Memory ThirtyTwo (A_SizeDirective 32 (A_Plus (A_FromReg (General SixtyFour r14)) (A_WordConstant 240))))), 7)"
    "fetch 0x7ccb \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour rdx)) (Storage (Reg (General SixtyFour r14))), 3)"
    "fetch 0x7cce \<equiv> (Binary (IS_8088 Lea) (Reg (General ThirtyTwo r9)) (Storage (Memory SixtyFour (A_Plus (A_Mult 4 (A_FromReg (General SixtyFour rax))) (A_WordConstant 0)))), 8)"
    "fetch 0x7cd6 \<equiv> (Binary (IS_8088 Test) (Reg (General ThirtyTwo r9)) (Storage (Reg (General ThirtyTwo r9))), 3)"
    "fetch 0x7cd9 \<equiv> (Unary (IS_8088 Jle) (Immediate SixtyFour (ImmVal 32065)), 2)"
    "fetch 0x7cdb \<equiv> (Binary (IS_X86_64 Movsxd) (Reg (General SixtyFour rax)) (Storage (Reg (General ThirtyTwo r9))), 3)"
    "fetch 0x7cde \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour rcx)) (Storage (Reg (General SixtyFour r14))), 3)"
    "fetch 0x7ce1 \<equiv> (Binary (IS_8088 Xor) (Reg (General ThirtyTwo rsi)) (Storage (Reg (General ThirtyTwo rsi))), 2)"
    "fetch 0x7ce3 \<equiv> (Binary (IS_8088 Lea) (Reg (General SixtyFour rax)) (Storage (Memory SixtyFour (A_Plus (A_FromReg (General SixtyFour r14)) (A_Mult 4 (A_FromReg (General SixtyFour rax)))))), 4)"
    "fetch 0x7ce7 \<equiv> (Unary (IS_8088 Nop) (Storage (Memory Sixteen (A_SizeDirective 16 (A_Plus (A_FromReg (General SixtyFour rax)) (A_Plus (A_Mult 1 (A_FromReg (General SixtyFour rax))) (A_WordConstant 0)))))), 9)"
    "fetch 0x7cf0 \<equiv> (Binary (IS_8088 Mov) (Reg (General ThirtyTwo rdi)) (Storage (Memory ThirtyTwo (A_SizeDirective 32 (A_FromReg (General SixtyFour rcx))))), 2)"
    "fetch 0x7cf2 \<equiv> (Binary (IS_8088 Mov) (Reg (General ThirtyTwo r8)) (Storage (Memory ThirtyTwo (A_SizeDirective 32 (A_FromReg (General SixtyFour rax))))), 3)"
    "fetch 0x7cf5 \<equiv> (Binary (IS_8088 Add) (Reg (General ThirtyTwo rsi)) (Immediate SixtyFour (ImmVal 4)), 3)"
    "fetch 0x7cf8 \<equiv> (Binary (IS_8088 Add) (Reg (General SixtyFour rcx)) (Immediate SixtyFour (ImmVal 16)), 4)"
    "fetch 0x7cfc \<equiv> (Binary (IS_8088 Sub) (Reg (General SixtyFour rax)) (Immediate SixtyFour (ImmVal 16)), 4)"
    "fetch 0x7d00 \<equiv> (Binary (IS_8088 Mov) (Memory ThirtyTwo (A_SizeDirective 32 (A_Minus (A_FromReg (General SixtyFour rcx)) (A_WordConstant 16)))) (Storage (Reg (General ThirtyTwo r8))), 4)"
    "fetch 0x7d04 \<equiv> (Binary (IS_8088 Mov) (Reg (General ThirtyTwo r8)) (Storage (Memory ThirtyTwo (A_SizeDirective 32 (A_Plus (A_FromReg (General SixtyFour rax)) (A_WordConstant 20))))), 4)"
    "fetch 0x7d08 \<equiv> (Binary (IS_8088 Mov) (Memory ThirtyTwo (A_SizeDirective 32 (A_Plus (A_FromReg (General SixtyFour rax)) (A_WordConstant 16)))) (Storage (Reg (General ThirtyTwo rdi))), 3)"
    "fetch 0x7d0b \<equiv> (Binary (IS_8088 Mov) (Reg (General ThirtyTwo rdi)) (Storage (Memory ThirtyTwo (A_SizeDirective 32 (A_Minus (A_FromReg (General SixtyFour rcx)) (A_WordConstant 12))))), 3)"
    "fetch 0x7d0e \<equiv> (Binary (IS_8088 Mov) (Memory ThirtyTwo (A_SizeDirective 32 (A_Minus (A_FromReg (General SixtyFour rcx)) (A_WordConstant 12)))) (Storage (Reg (General ThirtyTwo r8))), 4)"
    "fetch 0x7d12 \<equiv> (Binary (IS_8088 Mov) (Reg (General ThirtyTwo r8)) (Storage (Memory ThirtyTwo (A_SizeDirective 32 (A_Plus (A_FromReg (General SixtyFour rax)) (A_WordConstant 24))))), 4)"
    "fetch 0x7d16 \<equiv> (Binary (IS_8088 Mov) (Memory ThirtyTwo (A_SizeDirective 32 (A_Plus (A_FromReg (General SixtyFour rax)) (A_WordConstant 20)))) (Storage (Reg (General ThirtyTwo rdi))), 3)"
    "fetch 0x7d19 \<equiv> (Binary (IS_8088 Mov) (Reg (General ThirtyTwo rdi)) (Storage (Memory ThirtyTwo (A_SizeDirective 32 (A_Minus (A_FromReg (General SixtyFour rcx)) (A_WordConstant 8))))), 3)"
    "fetch 0x7d1c \<equiv> (Binary (IS_8088 Mov) (Memory ThirtyTwo (A_SizeDirective 32 (A_Minus (A_FromReg (General SixtyFour rcx)) (A_WordConstant 8)))) (Storage (Reg (General ThirtyTwo r8))), 4)"
    "fetch 0x7d20 \<equiv> (Binary (IS_8088 Mov) (Reg (General ThirtyTwo r8)) (Storage (Memory ThirtyTwo (A_SizeDirective 32 (A_Plus (A_FromReg (General SixtyFour rax)) (A_WordConstant 28))))), 4)"
    "fetch 0x7d24 \<equiv> (Binary (IS_8088 Mov) (Memory ThirtyTwo (A_SizeDirective 32 (A_Plus (A_FromReg (General SixtyFour rax)) (A_WordConstant 24)))) (Storage (Reg (General ThirtyTwo rdi))), 3)"
    "fetch 0x7d27 \<equiv> (Binary (IS_8088 Mov) (Reg (General ThirtyTwo rdi)) (Storage (Memory ThirtyTwo (A_SizeDirective 32 (A_Minus (A_FromReg (General SixtyFour rcx)) (A_WordConstant 4))))), 3)"
    "fetch 0x7d2a \<equiv> (Binary (IS_8088 Mov) (Memory ThirtyTwo (A_SizeDirective 32 (A_Minus (A_FromReg (General SixtyFour rcx)) (A_WordConstant 4)))) (Storage (Reg (General ThirtyTwo r8))), 4)"
    "fetch 0x7d2e \<equiv> (Binary (IS_8088 Mov) (Memory ThirtyTwo (A_SizeDirective 32 (A_Plus (A_FromReg (General SixtyFour rax)) (A_WordConstant 28)))) (Storage (Reg (General ThirtyTwo rdi))), 3)"
    "fetch 0x7d31 \<equiv> (Binary (IS_8088 Mov) (Reg (General ThirtyTwo rdi)) (Storage (Reg (General ThirtyTwo r9))), 3)"
    "fetch 0x7d34 \<equiv> (Binary (IS_8088 Sub) (Reg (General ThirtyTwo rdi)) (Storage (Reg (General ThirtyTwo rsi))), 2)"
    "fetch 0x7d36 \<equiv> (Binary (IS_8088 Cmp) (Reg (General ThirtyTwo rsi)) (Storage (Reg (General ThirtyTwo rdi))), 2)"
    "fetch 0x7d38 \<equiv> (Unary (IS_8088 Jl) (Immediate SixtyFour (ImmVal 31984)), 2)"
    "fetch 0x7d3a \<equiv> (Binary (IS_8088 Mov) (Reg (General ThirtyTwo rax)) (Storage (Memory ThirtyTwo (A_SizeDirective 32 (A_Plus (A_FromReg (General SixtyFour r14)) (A_WordConstant 240))))), 7)"
    "fetch 0x7d41 \<equiv> (Binary (IS_8088 Cmp) (Reg (General ThirtyTwo rax)) (Immediate SixtyFour (ImmVal 1)), 3)"
    "fetch 0x7d44 \<equiv> (Unary (IS_8088 Jle) (Immediate SixtyFour (ImmVal 32399)), 6)"
    "fetch 0x7d4a \<equiv> (Binary (IS_8088 Mov) (Reg (General ThirtyTwo r10)) (Immediate SixtyFour (ImmVal 1)), 6)"
    "fetch 0x7d50 \<equiv> (Binary (IS_8088 Lea) (Reg (General SixtyFour r9)) (Storage (Memory SixtyFour (A_Plus (A_FromReg (General SixtyFour rip)) (A_WordConstant 94793)))), 7)"
    "fetch 0x7d57 \<equiv> (Binary (IS_8088 Lea) (Reg (General SixtyFour rax)) (Storage (Memory SixtyFour (A_Plus (A_FromReg (General SixtyFour rip)) (A_WordConstant 95810)))), 7)"
    "fetch 0x7d5e \<equiv> (Binary (IS_8088 Lea) (Reg (General SixtyFour r8)) (Storage (Memory SixtyFour (A_Plus (A_FromReg (General SixtyFour rip)) (A_WordConstant 91707)))), 7)"
    "fetch 0x7d65 \<equiv> (Binary (IS_8088 Lea) (Reg (General SixtyFour rdi)) (Storage (Memory SixtyFour (A_Plus (A_FromReg (General SixtyFour rip)) (A_WordConstant 93748)))), 7)"
    "fetch 0x7d6c \<equiv> (Binary (IS_8088 Lea) (Reg (General SixtyFour rsi)) (Storage (Memory SixtyFour (A_Plus (A_FromReg (General SixtyFour rip)) (A_WordConstant 92717)))), 7)"
    "fetch 0x7d73 \<equiv> (Unary (IS_8088 Nop) (Storage (Memory ThirtyTwo (A_SizeDirective 32 (A_Plus (A_FromReg (General SixtyFour rax)) (A_Plus (A_Mult 1 (A_FromReg (General SixtyFour rax))) (A_WordConstant 0)))))), 5)"
    "fetch 0x7d78 \<equiv> (Binary (IS_8088 Add) (Reg (General SixtyFour rdx)) (Immediate SixtyFour (ImmVal 16)), 4)"
    "fetch 0x7d7c \<equiv> (Binary (IS_8088 Mov) (Reg (General ThirtyTwo r11)) (Storage (Memory ThirtyTwo (A_SizeDirective 32 (A_FromReg (General SixtyFour rdx))))), 3)"
    "fetch 0x7d7f \<equiv> (Binary (IS_8088 Add) (Reg (General ThirtyTwo r10)) (Immediate SixtyFour (ImmVal 1)), 4)"
    "fetch 0x7d83 \<equiv> (Binary (IS_8088 Mov) (Reg (General ThirtyTwo rcx)) (Storage (Reg (General ThirtyTwo r11))), 3)"
    "fetch 0x7d86 \<equiv> (Binary (IS_80386 Movzx) (Reg (General ThirtyTwo rbp)) (Storage (Reg (General Eight r11))), 4)"
    "fetch 0x7d8a \<equiv> (Binary (IS_8088 Mov) (Reg (General ThirtyTwo rbx)) (Storage (Reg (General ThirtyTwo r11))), 3)"
    "fetch 0x7d8d \<equiv> (Binary (IS_8088 Shr) (Reg (General ThirtyTwo rcx)) (Immediate SixtyFour (ImmVal 24)), 3)"
    "fetch 0x7d90 \<equiv> (Binary (IS_80386 Movzx) (Reg (General ThirtyTwo rbp)) (Storage (Memory Eight (A_SizeDirective 8 (A_Plus (A_FromReg (General SixtyFour rax)) (A_Mult 4 (A_FromReg (General SixtyFour rbp))))))), 4)"
    "fetch 0x7d94 \<equiv> (Binary (IS_80386 Movzx) (Reg (General ThirtyTwo rbx)) (Storage (Reg (General EightHigh rbx))), 3)"
    "fetch 0x7d97 \<equiv> (Binary (IS_80386 Movzx) (Reg (General ThirtyTwo rcx)) (Storage (Memory Eight (A_SizeDirective 8 (A_Plus (A_FromReg (General SixtyFour rax)) (A_Mult 4 (A_FromReg (General SixtyFour rcx))))))), 4)"
    "fetch 0x7d9b \<equiv> (Binary (IS_8088 Mov) (Reg (General ThirtyTwo rcx)) (Storage (Memory ThirtyTwo (A_SizeDirective 32 (A_Plus (A_FromReg (General SixtyFour r9)) (A_Mult 4 (A_FromReg (General SixtyFour rcx))))))), 4)"
    "fetch 0x7d9f \<equiv> (Binary (IS_8088 Xor) (Reg (General ThirtyTwo rcx)) (Storage (Memory ThirtyTwo (A_SizeDirective 32 (A_Plus (A_FromReg (General SixtyFour r8)) (A_Mult 4 (A_FromReg (General SixtyFour rbp))))))), 4)"
    "fetch 0x7da3 \<equiv> (Binary (IS_8088 Mov) (Reg (General ThirtyTwo rbp)) (Storage (Reg (General ThirtyTwo r11))), 3)"
    "fetch 0x7da6 \<equiv> (Binary (IS_8088 Shr) (Reg (General ThirtyTwo rbp)) (Immediate SixtyFour (ImmVal 16)), 3)"
    "fetch 0x7da9 \<equiv> (Binary (IS_80386 Movzx) (Reg (General ThirtyTwo r11)) (Storage (Memory Eight (A_SizeDirective 8 (A_Plus (A_FromReg (General SixtyFour rax)) (A_Mult 4 (A_FromReg (General SixtyFour rbx))))))), 5)"
    "fetch 0x7dae \<equiv> (Binary (IS_80386 Movzx) (Reg (General ThirtyTwo rbp)) (Storage (Reg (General Eight rbp))), 4)"
    "fetch 0x7db2 \<equiv> (Binary (IS_80386 Movzx) (Reg (General ThirtyTwo rbp)) (Storage (Memory Eight (A_SizeDirective 8 (A_Plus (A_FromReg (General SixtyFour rax)) (A_Mult 4 (A_FromReg (General SixtyFour rbp))))))), 4)"
    "fetch 0x7db6 \<equiv> (Binary (IS_8088 Xor) (Reg (General ThirtyTwo rcx)) (Storage (Memory ThirtyTwo (A_SizeDirective 32 (A_Plus (A_FromReg (General SixtyFour rdi)) (A_Mult 4 (A_FromReg (General SixtyFour rbp))))))), 3)"
    "fetch 0x7db9 \<equiv> (Binary (IS_8088 Xor) (Reg (General ThirtyTwo rcx)) (Storage (Memory ThirtyTwo (A_SizeDirective 32 (A_Plus (A_FromReg (General SixtyFour rsi)) (A_Mult 4 (A_FromReg (General SixtyFour r11))))))), 4)"
    "fetch 0x7dbd \<equiv> (Binary (IS_8088 Mov) (Reg (General ThirtyTwo r11)) (Storage (Memory ThirtyTwo (A_SizeDirective 32 (A_Plus (A_FromReg (General SixtyFour rdx)) (A_WordConstant 4))))), 4)"
    "fetch 0x7dc1 \<equiv> (Binary (IS_8088 Mov) (Memory ThirtyTwo (A_SizeDirective 32 (A_FromReg (General SixtyFour rdx)))) (Storage (Reg (General ThirtyTwo rcx))), 2)"
    "fetch 0x7dc3 \<equiv> (Binary (IS_8088 Mov) (Reg (General ThirtyTwo rcx)) (Storage (Reg (General ThirtyTwo r11))), 3)"
    "fetch 0x7dc6 \<equiv> (Binary (IS_80386 Movzx) (Reg (General ThirtyTwo rbp)) (Storage (Reg (General Eight r11))), 4)"
    "fetch 0x7dca \<equiv> (Binary (IS_8088 Mov) (Reg (General ThirtyTwo rbx)) (Storage (Reg (General ThirtyTwo r11))), 3)"
    "fetch 0x7dcd \<equiv> (Binary (IS_8088 Shr) (Reg (General ThirtyTwo rcx)) (Immediate SixtyFour (ImmVal 24)), 3)"
    "fetch 0x7dd0 \<equiv> (Binary (IS_80386 Movzx) (Reg (General ThirtyTwo rbp)) (Storage (Memory Eight (A_SizeDirective 8 (A_Plus (A_FromReg (General SixtyFour rax)) (A_Mult 4 (A_FromReg (General SixtyFour rbp))))))), 4)"
    "fetch 0x7dd4 \<equiv> (Binary (IS_80386 Movzx) (Reg (General ThirtyTwo rbx)) (Storage (Reg (General EightHigh rbx))), 3)"
    "fetch 0x7dd7 \<equiv> (Binary (IS_80386 Movzx) (Reg (General ThirtyTwo rcx)) (Storage (Memory Eight (A_SizeDirective 8 (A_Plus (A_FromReg (General SixtyFour rax)) (A_Mult 4 (A_FromReg (General SixtyFour rcx))))))), 4)"
    "fetch 0x7ddb \<equiv> (Binary (IS_8088 Mov) (Reg (General ThirtyTwo rcx)) (Storage (Memory ThirtyTwo (A_SizeDirective 32 (A_Plus (A_FromReg (General SixtyFour r9)) (A_Mult 4 (A_FromReg (General SixtyFour rcx))))))), 4)"
    "fetch 0x7ddf \<equiv> (Binary (IS_8088 Xor) (Reg (General ThirtyTwo rcx)) (Storage (Memory ThirtyTwo (A_SizeDirective 32 (A_Plus (A_FromReg (General SixtyFour r8)) (A_Mult 4 (A_FromReg (General SixtyFour rbp))))))), 4)"
    "fetch 0x7de3 \<equiv> (Binary (IS_8088 Mov) (Reg (General ThirtyTwo rbp)) (Storage (Reg (General ThirtyTwo r11))), 3)"
    "fetch 0x7de6 \<equiv> (Binary (IS_8088 Shr) (Reg (General ThirtyTwo rbp)) (Immediate SixtyFour (ImmVal 16)), 3)"
    "fetch 0x7de9 \<equiv> (Binary (IS_80386 Movzx) (Reg (General ThirtyTwo r11)) (Storage (Memory Eight (A_SizeDirective 8 (A_Plus (A_FromReg (General SixtyFour rax)) (A_Mult 4 (A_FromReg (General SixtyFour rbx))))))), 5)"
    "fetch 0x7dee \<equiv> (Binary (IS_80386 Movzx) (Reg (General ThirtyTwo rbp)) (Storage (Reg (General Eight rbp))), 4)"
    "fetch 0x7df2 \<equiv> (Binary (IS_80386 Movzx) (Reg (General ThirtyTwo rbp)) (Storage (Memory Eight (A_SizeDirective 8 (A_Plus (A_FromReg (General SixtyFour rax)) (A_Mult 4 (A_FromReg (General SixtyFour rbp))))))), 4)"
    "fetch 0x7df6 \<equiv> (Binary (IS_8088 Xor) (Reg (General ThirtyTwo rcx)) (Storage (Memory ThirtyTwo (A_SizeDirective 32 (A_Plus (A_FromReg (General SixtyFour rdi)) (A_Mult 4 (A_FromReg (General SixtyFour rbp))))))), 3)"
    "fetch 0x7df9 \<equiv> (Binary (IS_8088 Xor) (Reg (General ThirtyTwo rcx)) (Storage (Memory ThirtyTwo (A_SizeDirective 32 (A_Plus (A_FromReg (General SixtyFour rsi)) (A_Mult 4 (A_FromReg (General SixtyFour r11))))))), 4)"
    "fetch 0x7dfd \<equiv> (Binary (IS_8088 Mov) (Reg (General ThirtyTwo r11)) (Storage (Memory ThirtyTwo (A_SizeDirective 32 (A_Plus (A_FromReg (General SixtyFour rdx)) (A_WordConstant 8))))), 4)"
    "fetch 0x7e01 \<equiv> (Binary (IS_8088 Mov) (Memory ThirtyTwo (A_SizeDirective 32 (A_Plus (A_FromReg (General SixtyFour rdx)) (A_WordConstant 4)))) (Storage (Reg (General ThirtyTwo rcx))), 3)"
    "fetch 0x7e04 \<equiv> (Binary (IS_8088 Mov) (Reg (General ThirtyTwo rcx)) (Storage (Reg (General ThirtyTwo r11))), 3)"
    "fetch 0x7e07 \<equiv> (Binary (IS_80386 Movzx) (Reg (General ThirtyTwo rbp)) (Storage (Reg (General Eight r11))), 4)"
    "fetch 0x7e0b \<equiv> (Binary (IS_8088 Mov) (Reg (General ThirtyTwo rbx)) (Storage (Reg (General ThirtyTwo r11))), 3)"
    "fetch 0x7e0e \<equiv> (Binary (IS_8088 Shr) (Reg (General ThirtyTwo rcx)) (Immediate SixtyFour (ImmVal 24)), 3)"
    "fetch 0x7e11 \<equiv> (Binary (IS_80386 Movzx) (Reg (General ThirtyTwo rbp)) (Storage (Memory Eight (A_SizeDirective 8 (A_Plus (A_FromReg (General SixtyFour rax)) (A_Mult 4 (A_FromReg (General SixtyFour rbp))))))), 4)"
    "fetch 0x7e15 \<equiv> (Binary (IS_80386 Movzx) (Reg (General ThirtyTwo rbx)) (Storage (Reg (General EightHigh rbx))), 3)"
    "fetch 0x7e18 \<equiv> (Binary (IS_80386 Movzx) (Reg (General ThirtyTwo rcx)) (Storage (Memory Eight (A_SizeDirective 8 (A_Plus (A_FromReg (General SixtyFour rax)) (A_Mult 4 (A_FromReg (General SixtyFour rcx))))))), 4)"
    "fetch 0x7e1c \<equiv> (Binary (IS_8088 Mov) (Reg (General ThirtyTwo rcx)) (Storage (Memory ThirtyTwo (A_SizeDirective 32 (A_Plus (A_FromReg (General SixtyFour r9)) (A_Mult 4 (A_FromReg (General SixtyFour rcx))))))), 4)"
    "fetch 0x7e20 \<equiv> (Binary (IS_8088 Xor) (Reg (General ThirtyTwo rcx)) (Storage (Memory ThirtyTwo (A_SizeDirective 32 (A_Plus (A_FromReg (General SixtyFour r8)) (A_Mult 4 (A_FromReg (General SixtyFour rbp))))))), 4)"
    "fetch 0x7e24 \<equiv> (Binary (IS_8088 Mov) (Reg (General ThirtyTwo rbp)) (Storage (Reg (General ThirtyTwo r11))), 3)"
    "fetch 0x7e27 \<equiv> (Binary (IS_8088 Shr) (Reg (General ThirtyTwo rbp)) (Immediate SixtyFour (ImmVal 16)), 3)"
    "fetch 0x7e2a \<equiv> (Binary (IS_80386 Movzx) (Reg (General ThirtyTwo r11)) (Storage (Memory Eight (A_SizeDirective 8 (A_Plus (A_FromReg (General SixtyFour rax)) (A_Mult 4 (A_FromReg (General SixtyFour rbx))))))), 5)"
    "fetch 0x7e2f \<equiv> (Binary (IS_80386 Movzx) (Reg (General ThirtyTwo rbp)) (Storage (Reg (General Eight rbp))), 4)"
    "fetch 0x7e33 \<equiv> (Binary (IS_80386 Movzx) (Reg (General ThirtyTwo rbp)) (Storage (Memory Eight (A_SizeDirective 8 (A_Plus (A_FromReg (General SixtyFour rax)) (A_Mult 4 (A_FromReg (General SixtyFour rbp))))))), 4)"
    "fetch 0x7e37 \<equiv> (Binary (IS_8088 Xor) (Reg (General ThirtyTwo rcx)) (Storage (Memory ThirtyTwo (A_SizeDirective 32 (A_Plus (A_FromReg (General SixtyFour rdi)) (A_Mult 4 (A_FromReg (General SixtyFour rbp))))))), 3)"
    "fetch 0x7e3a \<equiv> (Binary (IS_8088 Xor) (Reg (General ThirtyTwo rcx)) (Storage (Memory ThirtyTwo (A_SizeDirective 32 (A_Plus (A_FromReg (General SixtyFour rsi)) (A_Mult 4 (A_FromReg (General SixtyFour r11))))))), 4)"
    "fetch 0x7e3e \<equiv> (Binary (IS_8088 Mov) (Reg (General ThirtyTwo r11)) (Storage (Memory ThirtyTwo (A_SizeDirective 32 (A_Plus (A_FromReg (General SixtyFour rdx)) (A_WordConstant 12))))), 4)"
    "fetch 0x7e42 \<equiv> (Binary (IS_8088 Mov) (Memory ThirtyTwo (A_SizeDirective 32 (A_Plus (A_FromReg (General SixtyFour rdx)) (A_WordConstant 8)))) (Storage (Reg (General ThirtyTwo rcx))), 3)"
    "fetch 0x7e45 \<equiv> (Binary (IS_8088 Mov) (Reg (General ThirtyTwo rcx)) (Storage (Reg (General ThirtyTwo r11))), 3)"
    "fetch 0x7e48 \<equiv> (Binary (IS_80386 Movzx) (Reg (General ThirtyTwo rbp)) (Storage (Reg (General Eight r11))), 4)"
    "fetch 0x7e4c \<equiv> (Binary (IS_8088 Mov) (Reg (General ThirtyTwo rbx)) (Storage (Reg (General ThirtyTwo r11))), 3)"
    "fetch 0x7e4f \<equiv> (Binary (IS_8088 Shr) (Reg (General ThirtyTwo rcx)) (Immediate SixtyFour (ImmVal 24)), 3)"
    "fetch 0x7e52 \<equiv> (Binary (IS_80386 Movzx) (Reg (General ThirtyTwo rbx)) (Storage (Reg (General EightHigh rbx))), 3)"
    "fetch 0x7e55 \<equiv> (Binary (IS_80386 Movzx) (Reg (General ThirtyTwo rcx)) (Storage (Memory Eight (A_SizeDirective 8 (A_Plus (A_FromReg (General SixtyFour rax)) (A_Mult 4 (A_FromReg (General SixtyFour rcx))))))), 4)"
    "fetch 0x7e59 \<equiv> (Binary (IS_80386 Movzx) (Reg (General ThirtyTwo rbp)) (Storage (Memory Eight (A_SizeDirective 8 (A_Plus (A_FromReg (General SixtyFour rax)) (A_Mult 4 (A_FromReg (General SixtyFour rbp))))))), 4)"
    "fetch 0x7e5d \<equiv> (Binary (IS_8088 Mov) (Reg (General ThirtyTwo rcx)) (Storage (Memory ThirtyTwo (A_SizeDirective 32 (A_Plus (A_FromReg (General SixtyFour r9)) (A_Mult 4 (A_FromReg (General SixtyFour rcx))))))), 4)"
    "fetch 0x7e61 \<equiv> (Binary (IS_8088 Xor) (Reg (General ThirtyTwo rcx)) (Storage (Memory ThirtyTwo (A_SizeDirective 32 (A_Plus (A_FromReg (General SixtyFour r8)) (A_Mult 4 (A_FromReg (General SixtyFour rbp))))))), 4)"
    "fetch 0x7e65 \<equiv> (Binary (IS_8088 Mov) (Reg (General ThirtyTwo rbp)) (Storage (Reg (General ThirtyTwo r11))), 3)"
    "fetch 0x7e68 \<equiv> (Binary (IS_8088 Shr) (Reg (General ThirtyTwo rbp)) (Immediate SixtyFour (ImmVal 16)), 3)"
    "fetch 0x7e6b \<equiv> (Binary (IS_80386 Movzx) (Reg (General ThirtyTwo r11)) (Storage (Memory Eight (A_SizeDirective 8 (A_Plus (A_FromReg (General SixtyFour rax)) (A_Mult 4 (A_FromReg (General SixtyFour rbx))))))), 5)"
    "fetch 0x7e70 \<equiv> (Binary (IS_80386 Movzx) (Reg (General ThirtyTwo rbp)) (Storage (Reg (General Eight rbp))), 4)"
    "fetch 0x7e74 \<equiv> (Binary (IS_80386 Movzx) (Reg (General ThirtyTwo rbp)) (Storage (Memory Eight (A_SizeDirective 8 (A_Plus (A_FromReg (General SixtyFour rax)) (A_Mult 4 (A_FromReg (General SixtyFour rbp))))))), 4)"
    "fetch 0x7e78 \<equiv> (Binary (IS_8088 Xor) (Reg (General ThirtyTwo rcx)) (Storage (Memory ThirtyTwo (A_SizeDirective 32 (A_Plus (A_FromReg (General SixtyFour rdi)) (A_Mult 4 (A_FromReg (General SixtyFour rbp))))))), 3)"
    "fetch 0x7e7b \<equiv> (Binary (IS_8088 Xor) (Reg (General ThirtyTwo rcx)) (Storage (Memory ThirtyTwo (A_SizeDirective 32 (A_Plus (A_FromReg (General SixtyFour rsi)) (A_Mult 4 (A_FromReg (General SixtyFour r11))))))), 4)"
    "fetch 0x7e7f \<equiv> (Binary (IS_8088 Mov) (Memory ThirtyTwo (A_SizeDirective 32 (A_Plus (A_FromReg (General SixtyFour rdx)) (A_WordConstant 12)))) (Storage (Reg (General ThirtyTwo rcx))), 3)"
    "fetch 0x7e82 \<equiv> (Binary (IS_8088 Cmp) (Memory ThirtyTwo (A_SizeDirective 32 (A_Plus (A_FromReg (General SixtyFour r14)) (A_WordConstant 240)))) (Storage (Reg (General ThirtyTwo r10))), 7)"
    "fetch 0x7e89 \<equiv> (Unary (IS_8088 Jg) (Immediate SixtyFour (ImmVal 32120)), 6)"
    "fetch 0x7e8f \<equiv> (Binary (IS_8088 Xor) (Reg (General ThirtyTwo rax)) (Storage (Reg (General ThirtyTwo rax))), 2)"
    "fetch 0x7e91 \<equiv> (Unary (IS_8088 Pop) (Storage (Reg (General SixtyFour rbx))), 1)"
    "fetch 0x7e92 \<equiv> (Unary (IS_8088 Pop) (Storage (Reg (General SixtyFour rbp))), 1)"
    "fetch 0x7e93 \<equiv> (Unary (IS_8088 Pop) (Storage (Reg (General SixtyFour r14))), 2)"
    "fetch 0x7e95 \<equiv> (Nullary (IS_8088 Ret), 1)"
    and \<alpha>_def: \<open>\<alpha> = \<lparr>text_sections = [], data_sections = [], labels_to_offsets = [], binary_offset = 0\<rparr>\<close>
    and AES_set_encrypt_key\<^sub>a\<^sub>d\<^sub>d\<^sub>r[simp]: \<open>the (label_to_address \<alpha> ''AES_set_encrypt_key'') = AES_set_encrypt_key_addr\<close>
begin

text \<open>Using definitions that don't get unfolded immediately prevents locale argument issues.\<close>
definition \<open>AES_set_encrypt_key_0x7cb7_retval \<equiv> AES_set_encrypt_key_0x7cb7_retval\<^sub>v\<close>

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

locale "AES_set_decrypt_key" = "qemu_img_xen" +
  fixes RAX\<^sub>0\<^sub>v RBX\<^sub>0\<^sub>v RCX\<^sub>0\<^sub>v RDX\<^sub>0\<^sub>v RDI\<^sub>0\<^sub>v RSI\<^sub>0\<^sub>v RSP\<^sub>0\<^sub>v RBP\<^sub>0\<^sub>v R14\<^sub>0\<^sub>v R11\<^sub>0\<^sub>v R10\<^sub>0\<^sub>v R9\<^sub>0\<^sub>v R8\<^sub>0\<^sub>v ret_address\<^sub>v :: \<open>64 word\<close>
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
definition \<open>R11\<^sub>0 \<equiv> R11\<^sub>0\<^sub>v\<close>
definition \<open>R10\<^sub>0 \<equiv> R10\<^sub>0\<^sub>v\<close>
definition \<open>R9\<^sub>0 \<equiv> R9\<^sub>0\<^sub>v\<close>
definition \<open>R8\<^sub>0 \<equiv> R8\<^sub>0\<^sub>v\<close>
definition \<open>ret_address \<equiv> ret_address\<^sub>v\<close>

definition P_0x7cb0_0 :: state_pred where
  \<open>P_0x7cb0_0 \<sigma> \<equiv> RIP \<sigma> = 0x7cb0 \<and> RAX \<sigma> = RAX\<^sub>0 \<and> RBX \<sigma> = RBX\<^sub>0 \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = RDX\<^sub>0 \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = RSP\<^sub>0 \<and> RBP \<sigma> = RBP\<^sub>0 \<and> R14 \<sigma> = R14\<^sub>0 \<and> R11 \<sigma> = R11\<^sub>0 \<and> R10 \<sigma> = R10\<^sub>0 \<and> R9 \<sigma> = R9\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address\<close>
declare P_0x7cb0_0_def[Ps]

definition P_0x7cb0_0_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x7cb0_0_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (2, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x18), 8)
  }\<close>

definition P_0x7cb0_0_regions :: state_pred where
  \<open>P_0x7cb0_0_regions \<sigma> \<equiv> \<exists>regions. P_0x7cb0_0_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x7cb7_0 :: state_pred where
  \<open>Q_0x7cb7_0 \<sigma> \<equiv> RIP \<sigma> = 0x7cb7 \<and> RAX \<sigma> = RAX\<^sub>0 \<and> RBX \<sigma> = RBX\<^sub>0 \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = RDX\<^sub>0 \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x18) \<and> RBP \<sigma> = RBP\<^sub>0 \<and> R14 \<sigma> = RDX\<^sub>0 \<and> R11 \<sigma> = R11\<^sub>0 \<and> R10 \<sigma> = R10\<^sub>0 \<and> R9 \<sigma> = R9\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBX\<^sub>0\<close>
declare Q_0x7cb7_0_def[Qs]

schematic_goal AES_set_decrypt_key_0_4_0x7cb0_0x7cb6_0[blocks]:
  assumes \<open>(P_0x7cb0_0 && P_0x7cb0_0_regions) \<sigma>\<close>
  shows \<open>exec_block 4 0x7cb6 0 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x7cb7_0 ?\<sigma> \<and> block_usage P_0x7cb0_0_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x7cb0_0_def P_0x7cb0_0_regions_def post: Q_0x7cb7_0_def regionset: P_0x7cb0_0_regions_set_def)

definition P_0x7cb7_1 :: state_pred where
  \<open>P_0x7cb7_1 \<sigma> \<equiv> RIP \<sigma> = 0x7cb7 \<and> RAX \<sigma> = RAX\<^sub>0 \<and> RBX \<sigma> = RBX\<^sub>0 \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = RDX\<^sub>0 \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x18) \<and> RBP \<sigma> = RBP\<^sub>0 \<and> R14 \<sigma> = RDX\<^sub>0 \<and> R11 \<sigma> = R11\<^sub>0 \<and> R10 \<sigma> = R10\<^sub>0 \<and> R9 \<sigma> = R9\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBX\<^sub>0\<close>
declare P_0x7cb7_1_def[Ps]

definition P_0x7cb7_1_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x7cb7_1_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (2, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x20), 8)
  }\<close>

definition P_0x7cb7_1_regions :: state_pred where
  \<open>P_0x7cb7_1_regions \<sigma> \<equiv> \<exists>regions. P_0x7cb7_1_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_AES_set_encrypt_key_addr_0x7cb7_1 :: state_pred where
  \<open>Q_AES_set_encrypt_key_addr_0x7cb7_1 \<sigma> \<equiv> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x20) \<and> RIP \<sigma> = AES_set_encrypt_key_addr \<and> RAX \<sigma> = RAX\<^sub>0 \<and> RBX \<sigma> = RBX\<^sub>0 \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = RDX\<^sub>0 \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RBP \<sigma> = RBP\<^sub>0 \<and> R14 \<sigma> = RDX\<^sub>0 \<and> R11 \<sigma> = R11\<^sub>0 \<and> R10 \<sigma> = R10\<^sub>0 \<and> R9 \<sigma> = R9\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = 0x7cbc\<close>
declare Q_AES_set_encrypt_key_addr_0x7cb7_1_def[Qs]

schematic_goal AES_set_decrypt_key_0_1_0x7cb7_0x7cb7_1[blocks]:
  assumes \<open>(P_0x7cb7_1 && P_0x7cb7_1_regions) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x7cb7 (Suc 0) \<sigma> \<triangleq> ?\<sigma> \<and> Q_AES_set_encrypt_key_addr_0x7cb7_1 ?\<sigma> \<and> block_usage P_0x7cb7_1_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x7cb7_1_def P_0x7cb7_1_regions_def post: Q_AES_set_encrypt_key_addr_0x7cb7_1_def regionset: P_0x7cb7_1_regions_set_def)

definition P_0x7cbc_2 :: state_pred where
  \<open>P_0x7cbc_2 \<sigma> \<equiv> RIP \<sigma> = 0x7cbc \<and> RAX \<sigma> = AES_set_encrypt_key_0x7cb7_retval \<and> RBX \<sigma> = RBX\<^sub>0 \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = RDX\<^sub>0 \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x18) \<and> RBP \<sigma> = RBP\<^sub>0 \<and> R14 \<sigma> = RDX\<^sub>0 \<and> R11 \<sigma> = R11\<^sub>0 \<and> R10 \<sigma> = R10\<^sub>0 \<and> R9 \<sigma> = R9\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = 0x7cbc\<close>
declare P_0x7cbc_2_def[Ps]

definition P_0x7cbc_2_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x7cbc_2_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (2, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x20), 8)
  }\<close>

definition P_0x7cbc_2_regions :: state_pred where
  \<open>P_0x7cbc_2_regions \<sigma> \<equiv> \<exists>regions. P_0x7cbc_2_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x7cbe_2 :: state_pred where
  \<open>Q_0x7cbe_2 \<sigma> \<equiv> RIP \<sigma> = 0x7cbe \<and> RAX \<sigma> = AES_set_encrypt_key_0x7cb7_retval \<and> RBX \<sigma> = RBX\<^sub>0 \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = RDX\<^sub>0 \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x18) \<and> RBP \<sigma> = RBP\<^sub>0 \<and> R14 \<sigma> = RDX\<^sub>0 \<and> R11 \<sigma> = R11\<^sub>0 \<and> R10 \<sigma> = R10\<^sub>0 \<and> R9 \<sigma> = R9\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = 0x7cbc\<close>
declare Q_0x7cbe_2_def[Qs]

schematic_goal AES_set_decrypt_key_0_1_0x7cbc_0x7cbc_2[blocks]:
  assumes \<open>(P_0x7cbc_2 && P_0x7cbc_2_regions) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x7cbc 2 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x7cbe_2 ?\<sigma> \<and> block_usage P_0x7cbc_2_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x7cbc_2_def P_0x7cbc_2_regions_def post: Q_0x7cbe_2_def regionset: P_0x7cbc_2_regions_set_def)

definition P_0x7cbe_true_3 :: state_pred where
  \<open>P_0x7cbe_true_3 \<sigma> \<equiv> RIP \<sigma> = 0x7cbe \<and> RAX \<sigma> = AES_set_encrypt_key_0x7cb7_retval \<and> RBX \<sigma> = RBX\<^sub>0 \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = RDX\<^sub>0 \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x18) \<and> RBP \<sigma> = RBP\<^sub>0 \<and> R14 \<sigma> = RDX\<^sub>0 \<and> R11 \<sigma> = R11\<^sub>0 \<and> R10 \<sigma> = R10\<^sub>0 \<and> R9 \<sigma> = R9\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = 0x7cbc\<close>
declare P_0x7cbe_true_3_def[Ps]

definition P_0x7cbe_true_3_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x7cbe_true_3_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (2, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x20), 8)
  }\<close>

definition P_0x7cbe_true_3_regions :: state_pred where
  \<open>P_0x7cbe_true_3_regions \<sigma> \<equiv> \<exists>regions. P_0x7cbe_true_3_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x7e91_3 :: state_pred where
  \<open>Q_0x7e91_3 \<sigma> \<equiv> RIP \<sigma> = 0x7e91 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x18) \<and> R14 \<sigma> = RDX\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = 0x7cbc\<close>
declare Q_0x7e91_3_def[Qs]

schematic_goal AES_set_decrypt_key_0_1_0x7cbe_0x7cbe_3[blocks]:
  assumes \<open>(P_0x7cbe_true_3 && P_0x7cbe_true_3_regions && SF) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x7cbe 3 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x7e91_3 ?\<sigma> \<and> block_usage P_0x7cbe_true_3_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x7cbe_true_3_def P_0x7cbe_true_3_regions_def post: Q_0x7e91_3_def regionset: P_0x7cbe_true_3_regions_set_def)

definition P_0x7cbe_false_4 :: state_pred where
  \<open>P_0x7cbe_false_4 \<sigma> \<equiv> RIP \<sigma> = 0x7cbe \<and> RAX \<sigma> = AES_set_encrypt_key_0x7cb7_retval \<and> RBX \<sigma> = RBX\<^sub>0 \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = RDX\<^sub>0 \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x18) \<and> RBP \<sigma> = RBP\<^sub>0 \<and> R14 \<sigma> = RDX\<^sub>0 \<and> R11 \<sigma> = R11\<^sub>0 \<and> R10 \<sigma> = R10\<^sub>0 \<and> R9 \<sigma> = R9\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = 0x7cbc\<close>
declare P_0x7cbe_false_4_def[Ps]

definition P_0x7cbe_false_4_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x7cbe_false_4_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((RDX\<^sub>0::64 word) + 0xf0), 4),
    (2, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x20), 8)
  }\<close>

definition P_0x7cbe_false_4_regions :: state_pred where
  \<open>P_0x7cbe_false_4_regions \<sigma> \<equiv> \<exists>regions. P_0x7cbe_false_4_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x7cd9_4 :: state_pred where
  \<open>Q_0x7cd9_4 \<sigma> \<equiv> RIP \<sigma> = 0x7cd9 \<and> RAX \<sigma> = ucast ((\<sigma> \<turnstile> *[((RDX\<^sub>0::64 word) + 0xf0),4]::32 word)) \<and> RBX \<sigma> = RBX\<^sub>0 \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = RDX\<^sub>0 \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x18) \<and> RBP \<sigma> = RBP\<^sub>0 \<and> R14 \<sigma> = RDX\<^sub>0 \<and> R11 \<sigma> = R11\<^sub>0 \<and> R10 \<sigma> = R10\<^sub>0 \<and> R9 \<sigma> = ucast ((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[((RDX\<^sub>0::64 word) + 0xf0),4]::32 word)::64 word)::64 word) * 0x4)::32 word)) \<and> R8 \<sigma> = R8\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDX\<^sub>0::64 word) + 0xf0),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RDX\<^sub>0::64 word) + 0xf0),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = 0x7cbc\<close>
declare Q_0x7cd9_4_def[Qs]

schematic_goal AES_set_decrypt_key_0_5_0x7cbe_0x7cd6_4[blocks]:
  assumes \<open>(P_0x7cbe_false_4 && P_0x7cbe_false_4_regions && ! SF) \<sigma>\<close>
  shows \<open>exec_block 5 0x7cd6 4 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x7cd9_4 ?\<sigma> \<and> block_usage P_0x7cbe_false_4_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x7cbe_false_4_def P_0x7cbe_false_4_regions_def post: Q_0x7cd9_4_def regionset: P_0x7cbe_false_4_regions_set_def)

definition P_0x7cd9_true_5 :: state_pred where
  \<open>P_0x7cd9_true_5 \<sigma> \<equiv> RIP \<sigma> = 0x7cd9 \<and> RAX \<sigma> = ucast ((\<sigma> \<turnstile> *[((RDX\<^sub>0::64 word) + 0xf0),4]::32 word)) \<and> RBX \<sigma> = RBX\<^sub>0 \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = RDX\<^sub>0 \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x18) \<and> RBP \<sigma> = RBP\<^sub>0 \<and> R14 \<sigma> = RDX\<^sub>0 \<and> R11 \<sigma> = R11\<^sub>0 \<and> R10 \<sigma> = R10\<^sub>0 \<and> R9 \<sigma> = ucast ((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[((RDX\<^sub>0::64 word) + 0xf0),4]::32 word)::64 word)::64 word) * 0x4)::32 word)) \<and> R8 \<sigma> = R8\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDX\<^sub>0::64 word) + 0xf0),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RDX\<^sub>0::64 word) + 0xf0),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = 0x7cbc\<close>
declare P_0x7cd9_true_5_def[Ps]

definition P_0x7cd9_true_5_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x7cd9_true_5_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((RDX\<^sub>0::64 word) + 0xf0), 4),
    (2, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x20), 8)
  }\<close>

definition P_0x7cd9_true_5_regions :: state_pred where
  \<open>P_0x7cd9_true_5_regions \<sigma> \<equiv> \<exists>regions. P_0x7cd9_true_5_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x7d41_5 :: state_pred where
  \<open>Q_0x7d41_5 \<sigma> \<equiv> RIP \<sigma> = 0x7d41 \<and> RAX \<sigma> = ucast ((\<sigma> \<turnstile> *[((RDX\<^sub>0::64 word) + 0xf0),4]::32 word)) \<and> RBX \<sigma> = RBX\<^sub>0 \<and> RDX \<sigma> = RDX\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x18) \<and> RBP \<sigma> = RBP\<^sub>0 \<and> R14 \<sigma> = RDX\<^sub>0 \<and> R11 \<sigma> = R11\<^sub>0 \<and> R10 \<sigma> = R10\<^sub>0 \<and> R9 \<sigma> = ucast ((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[((RDX\<^sub>0::64 word) + 0xf0),4]::32 word)::64 word)::64 word) * 0x4)::32 word)) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDX\<^sub>0::64 word) + 0xf0),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RDX\<^sub>0::64 word) + 0xf0),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = 0x7cbc\<close>
declare Q_0x7d41_5_def[Qs]

schematic_goal AES_set_decrypt_key_0_1_0x7cd9_0x7cd9_5[blocks]:
  assumes \<open>(P_0x7cd9_true_5 && P_0x7cd9_true_5_regions && jle) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x7cd9 5 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x7d41_5 ?\<sigma> \<and> block_usage P_0x7cd9_true_5_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x7cd9_true_5_def P_0x7cd9_true_5_regions_def post: Q_0x7d41_5_def regionset: P_0x7cd9_true_5_regions_set_def)

definition P_0x7cd9_false_6 :: state_pred where
  \<open>P_0x7cd9_false_6 \<sigma> \<equiv> RIP \<sigma> = 0x7cd9 \<and> RAX \<sigma> = ucast ((\<sigma> \<turnstile> *[((RDX\<^sub>0::64 word) + 0xf0),4]::32 word)) \<and> RBX \<sigma> = RBX\<^sub>0 \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = RDX\<^sub>0 \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x18) \<and> RBP \<sigma> = RBP\<^sub>0 \<and> R14 \<sigma> = RDX\<^sub>0 \<and> R11 \<sigma> = R11\<^sub>0 \<and> R10 \<sigma> = R10\<^sub>0 \<and> R9 \<sigma> = ucast ((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[((RDX\<^sub>0::64 word) + 0xf0),4]::32 word)::64 word)::64 word) * 0x4)::32 word)) \<and> R8 \<sigma> = R8\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDX\<^sub>0::64 word) + 0xf0),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RDX\<^sub>0::64 word) + 0xf0),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = 0x7cbc\<close>
declare P_0x7cd9_false_6_def[Ps]

definition P_0x7cd9_false_6_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x7cd9_false_6_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((RDX\<^sub>0::64 word) + 0xf0), 4),
    (2, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x20), 8)
  }\<close>

definition P_0x7cd9_false_6_regions :: state_pred where
  \<open>P_0x7cd9_false_6_regions \<sigma> \<equiv> \<exists>regions. P_0x7cd9_false_6_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x7cf0_6 :: state_pred where
  \<open>Q_0x7cf0_6 \<sigma> \<equiv> RIP \<sigma> = 0x7cf0 \<and> RBX \<sigma> = RBX\<^sub>0 \<and> RDX \<sigma> = RDX\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x18) \<and> RBP \<sigma> = RBP\<^sub>0 \<and> R14 \<sigma> = RDX\<^sub>0 \<and> R11 \<sigma> = R11\<^sub>0 \<and> R10 \<sigma> = R10\<^sub>0 \<and> R9 \<sigma> = ucast ((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[((RDX\<^sub>0::64 word) + 0xf0),4]::32 word)::64 word)::64 word) * 0x4)::32 word)) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDX\<^sub>0::64 word) + 0xf0),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RDX\<^sub>0::64 word) + 0xf0),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = 0x7cbc\<close>
declare Q_0x7cf0_6_def[Qs]

schematic_goal AES_set_decrypt_key_0_6_0x7cd9_0x7ce7_6[blocks]:
  assumes \<open>(P_0x7cd9_false_6 && P_0x7cd9_false_6_regions && ! jle) \<sigma>\<close>
  shows \<open>exec_block 6 0x7ce7 6 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x7cf0_6 ?\<sigma> \<and> block_usage P_0x7cd9_false_6_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x7cd9_false_6_def P_0x7cd9_false_6_regions_def post: Q_0x7cf0_6_def regionset: P_0x7cd9_false_6_regions_set_def)

definition P_0x7cf0_7 :: state_pred where
  \<open>P_0x7cf0_7 \<sigma> \<equiv> RIP \<sigma> = 0x7cf0 \<and> RBX \<sigma> = RBX\<^sub>0 \<and> RDX \<sigma> = RDX\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x18) \<and> RBP \<sigma> = RBP\<^sub>0 \<and> R14 \<sigma> = RDX\<^sub>0 \<and> R11 \<sigma> = R11\<^sub>0 \<and> R10 \<sigma> = R10\<^sub>0 \<and> R9 \<sigma> = ucast ((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[((RDX\<^sub>0::64 word) + 0xf0),4]::32 word)::64 word)::64 word) * 0x4)::32 word)) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDX\<^sub>0::64 word) + 0xf0),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RDX\<^sub>0::64 word) + 0xf0),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = 0x7cbc\<close>
declare P_0x7cf0_7_def[Ps]

definition P_0x7cf0_7_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x7cf0_7_regions_set \<sigma> \<equiv> {
    (0, RAX \<sigma>, 4),
    (1, RCX \<sigma>, 4),
    (2, RSP\<^sub>0, 8),
    (3, ((RAX \<sigma>::64 word) + 0x4), 4),
    (4, ((RAX \<sigma>::64 word) + 0x8), 4),
    (5, ((RAX \<sigma>::64 word) + 0xc), 4),
    (6, ((RCX \<sigma>::64 word) + 0x4), 4),
    (7, ((RCX \<sigma>::64 word) + 0x8), 4),
    (8, ((RCX \<sigma>::64 word) + 0xc), 4),
    (9, ((RDX\<^sub>0::64 word) + 0xf0), 4),
    (10, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (11, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (12, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (13, ((RSP\<^sub>0::64 word) - 0x20), 8)
  }\<close>

definition P_0x7cf0_7_regions :: state_pred where
  \<open>P_0x7cf0_7_regions \<sigma> \<equiv> \<exists>regions. P_0x7cf0_7_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x7d38_7 :: state_pred where
  \<open>Q_0x7d38_7 \<sigma> \<equiv> RIP \<sigma> = 0x7d38 \<and> RBX \<sigma> = RBX\<^sub>0 \<and> RDX \<sigma> = RDX\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x18) \<and> RBP \<sigma> = RBP\<^sub>0 \<and> R14 \<sigma> = RDX\<^sub>0 \<and> R11 \<sigma> = R11\<^sub>0 \<and> R10 \<sigma> = R10\<^sub>0 \<and> R9 \<sigma> = ucast ((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[((RDX\<^sub>0::64 word) + 0xf0),4]::32 word)::64 word)::64 word) * 0x4)::32 word)) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDX\<^sub>0::64 word) + 0xf0),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RDX\<^sub>0::64 word) + 0xf0),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = 0x7cbc\<close>
declare Q_0x7d38_7_def[Qs]

schematic_goal AES_set_decrypt_key_0_22_0x7cf0_0x7d36_7[blocks]:
  assumes \<open>(P_0x7cf0_7 && P_0x7cf0_7_regions) \<sigma>\<close>
  shows \<open>exec_block 22 0x7d36 7 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x7d38_7 ?\<sigma> \<and> block_usage P_0x7cf0_7_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x7cf0_7_def P_0x7cf0_7_regions_def post: Q_0x7d38_7_def regionset: P_0x7cf0_7_regions_set_def)

definition P_0x7d38_true_8 :: state_pred where
  \<open>P_0x7d38_true_8 \<sigma> \<equiv> RIP \<sigma> = 0x7d38 \<and> RBX \<sigma> = RBX\<^sub>0 \<and> RDX \<sigma> = RDX\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x18) \<and> RBP \<sigma> = RBP\<^sub>0 \<and> R14 \<sigma> = RDX\<^sub>0 \<and> R11 \<sigma> = R11\<^sub>0 \<and> R10 \<sigma> = R10\<^sub>0 \<and> R9 \<sigma> = ucast ((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[((RDX\<^sub>0::64 word) + 0xf0),4]::32 word)::64 word)::64 word) * 0x4)::32 word)) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDX\<^sub>0::64 word) + 0xf0),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RDX\<^sub>0::64 word) + 0xf0),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = 0x7cbc\<close>
declare P_0x7d38_true_8_def[Ps]

definition P_0x7d38_true_8_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x7d38_true_8_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((RDX\<^sub>0::64 word) + 0xf0), 4),
    (2, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x20), 8)
  }\<close>

definition P_0x7d38_true_8_regions :: state_pred where
  \<open>P_0x7d38_true_8_regions \<sigma> \<equiv> \<exists>regions. P_0x7d38_true_8_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x7cf0_8 :: state_pred where
  \<open>Q_0x7cf0_8 \<sigma> \<equiv> RIP \<sigma> = 0x7cf0 \<and> RBX \<sigma> = RBX\<^sub>0 \<and> RDX \<sigma> = RDX\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x18) \<and> RBP \<sigma> = RBP\<^sub>0 \<and> R14 \<sigma> = RDX\<^sub>0 \<and> R11 \<sigma> = R11\<^sub>0 \<and> R10 \<sigma> = R10\<^sub>0 \<and> R9 \<sigma> = ucast ((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[((RDX\<^sub>0::64 word) + 0xf0),4]::32 word)::64 word)::64 word) * 0x4)::32 word)) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDX\<^sub>0::64 word) + 0xf0),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RDX\<^sub>0::64 word) + 0xf0),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = 0x7cbc\<close>
declare Q_0x7cf0_8_def[Qs]

schematic_goal AES_set_decrypt_key_0_1_0x7d38_0x7d38_8[blocks]:
  assumes \<open>(P_0x7d38_true_8 && P_0x7d38_true_8_regions && jl) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x7d38 8 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x7cf0_8 ?\<sigma> \<and> block_usage P_0x7d38_true_8_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x7d38_true_8_def P_0x7d38_true_8_regions_def post: Q_0x7cf0_8_def regionset: P_0x7d38_true_8_regions_set_def)

definition P_0x7d38_false_9 :: state_pred where
  \<open>P_0x7d38_false_9 \<sigma> \<equiv> RIP \<sigma> = 0x7d38 \<and> RBX \<sigma> = RBX\<^sub>0 \<and> RDX \<sigma> = RDX\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x18) \<and> RBP \<sigma> = RBP\<^sub>0 \<and> R14 \<sigma> = RDX\<^sub>0 \<and> R11 \<sigma> = R11\<^sub>0 \<and> R10 \<sigma> = R10\<^sub>0 \<and> R9 \<sigma> = ucast ((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[((RDX\<^sub>0::64 word) + 0xf0),4]::32 word)::64 word)::64 word) * 0x4)::32 word)) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDX\<^sub>0::64 word) + 0xf0),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RDX\<^sub>0::64 word) + 0xf0),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = 0x7cbc\<close>
declare P_0x7d38_false_9_def[Ps]

definition P_0x7d38_false_9_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x7d38_false_9_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((RDX\<^sub>0::64 word) + 0xf0), 4),
    (2, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x20), 8)
  }\<close>

definition P_0x7d38_false_9_regions :: state_pred where
  \<open>P_0x7d38_false_9_regions \<sigma> \<equiv> \<exists>regions. P_0x7d38_false_9_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x7d3a_9 :: state_pred where
  \<open>Q_0x7d3a_9 \<sigma> \<equiv> RIP \<sigma> = 0x7d3a \<and> RBX \<sigma> = RBX\<^sub>0 \<and> RDX \<sigma> = RDX\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x18) \<and> RBP \<sigma> = RBP\<^sub>0 \<and> R14 \<sigma> = RDX\<^sub>0 \<and> R11 \<sigma> = R11\<^sub>0 \<and> R10 \<sigma> = R10\<^sub>0 \<and> R9 \<sigma> = ucast ((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[((RDX\<^sub>0::64 word) + 0xf0),4]::32 word)::64 word)::64 word) * 0x4)::32 word)) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDX\<^sub>0::64 word) + 0xf0),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RDX\<^sub>0::64 word) + 0xf0),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = 0x7cbc\<close>
declare Q_0x7d3a_9_def[Qs]

schematic_goal AES_set_decrypt_key_0_1_0x7d38_0x7d38_9[blocks]:
  assumes \<open>(P_0x7d38_false_9 && P_0x7d38_false_9_regions && ! jl) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x7d38 9 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x7d3a_9 ?\<sigma> \<and> block_usage P_0x7d38_false_9_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x7d38_false_9_def P_0x7d38_false_9_regions_def post: Q_0x7d3a_9_def regionset: P_0x7d38_false_9_regions_set_def)

definition P_0x7d3a_10 :: state_pred where
  \<open>P_0x7d3a_10 \<sigma> \<equiv> RIP \<sigma> = 0x7d3a \<and> RBX \<sigma> = RBX\<^sub>0 \<and> RDX \<sigma> = RDX\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x18) \<and> RBP \<sigma> = RBP\<^sub>0 \<and> R14 \<sigma> = RDX\<^sub>0 \<and> R11 \<sigma> = R11\<^sub>0 \<and> R10 \<sigma> = R10\<^sub>0 \<and> R9 \<sigma> = ucast ((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[((RDX\<^sub>0::64 word) + 0xf0),4]::32 word)::64 word)::64 word) * 0x4)::32 word)) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDX\<^sub>0::64 word) + 0xf0),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RDX\<^sub>0::64 word) + 0xf0),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = 0x7cbc\<close>
declare P_0x7d3a_10_def[Ps]

definition P_0x7d3a_10_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x7d3a_10_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((RDX\<^sub>0::64 word) + 0xf0), 4),
    (2, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x20), 8)
  }\<close>

definition P_0x7d3a_10_regions :: state_pred where
  \<open>P_0x7d3a_10_regions \<sigma> \<equiv> \<exists>regions. P_0x7d3a_10_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x7d41_10 :: state_pred where
  \<open>Q_0x7d41_10 \<sigma> \<equiv> RIP \<sigma> = 0x7d41 \<and> RAX \<sigma> = ucast ((\<sigma> \<turnstile> *[((RDX\<^sub>0::64 word) + 0xf0),4]::32 word)) \<and> RBX \<sigma> = RBX\<^sub>0 \<and> RDX \<sigma> = RDX\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x18) \<and> RBP \<sigma> = RBP\<^sub>0 \<and> R14 \<sigma> = RDX\<^sub>0 \<and> R11 \<sigma> = R11\<^sub>0 \<and> R10 \<sigma> = R10\<^sub>0 \<and> R9 \<sigma> = ucast ((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[((RDX\<^sub>0::64 word) + 0xf0),4]::32 word)::64 word)::64 word) * 0x4)::32 word)) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDX\<^sub>0::64 word) + 0xf0),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RDX\<^sub>0::64 word) + 0xf0),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = 0x7cbc\<close>
declare Q_0x7d41_10_def[Qs]

schematic_goal AES_set_decrypt_key_0_1_0x7d3a_0x7d3a_10[blocks]:
  assumes \<open>(P_0x7d3a_10 && P_0x7d3a_10_regions) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x7d3a 10 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x7d41_10 ?\<sigma> \<and> block_usage P_0x7d3a_10_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x7d3a_10_def P_0x7d3a_10_regions_def post: Q_0x7d41_10_def regionset: P_0x7d3a_10_regions_set_def)

definition P_0x7d41_11 :: state_pred where
  \<open>P_0x7d41_11 \<sigma> \<equiv> RIP \<sigma> = 0x7d41 \<and> RAX \<sigma> = ucast ((\<sigma> \<turnstile> *[((RDX\<^sub>0::64 word) + 0xf0),4]::32 word)) \<and> RBX \<sigma> = RBX\<^sub>0 \<and> RDX \<sigma> = RDX\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x18) \<and> RBP \<sigma> = RBP\<^sub>0 \<and> R14 \<sigma> = RDX\<^sub>0 \<and> R11 \<sigma> = R11\<^sub>0 \<and> R10 \<sigma> = R10\<^sub>0 \<and> R9 \<sigma> = ucast ((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[((RDX\<^sub>0::64 word) + 0xf0),4]::32 word)::64 word)::64 word) * 0x4)::32 word)) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDX\<^sub>0::64 word) + 0xf0),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RDX\<^sub>0::64 word) + 0xf0),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = 0x7cbc\<close>
declare P_0x7d41_11_def[Ps]

definition P_0x7d41_11_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x7d41_11_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((RDX\<^sub>0::64 word) + 0xf0), 4),
    (2, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x20), 8)
  }\<close>

definition P_0x7d41_11_regions :: state_pred where
  \<open>P_0x7d41_11_regions \<sigma> \<equiv> \<exists>regions. P_0x7d41_11_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x7d44_11 :: state_pred where
  \<open>Q_0x7d44_11 \<sigma> \<equiv> RIP \<sigma> = 0x7d44 \<and> RAX \<sigma> = ucast ((\<sigma> \<turnstile> *[((RDX\<^sub>0::64 word) + 0xf0),4]::32 word)) \<and> RBX \<sigma> = RBX\<^sub>0 \<and> RDX \<sigma> = RDX\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x18) \<and> RBP \<sigma> = RBP\<^sub>0 \<and> R14 \<sigma> = RDX\<^sub>0 \<and> R11 \<sigma> = R11\<^sub>0 \<and> R10 \<sigma> = R10\<^sub>0 \<and> R9 \<sigma> = ucast ((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[((RDX\<^sub>0::64 word) + 0xf0),4]::32 word)::64 word)::64 word) * 0x4)::32 word)) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDX\<^sub>0::64 word) + 0xf0),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RDX\<^sub>0::64 word) + 0xf0),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = 0x7cbc\<close>
declare Q_0x7d44_11_def[Qs]

schematic_goal AES_set_decrypt_key_0_1_0x7d41_0x7d41_11[blocks]:
  assumes \<open>(P_0x7d41_11 && P_0x7d41_11_regions) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x7d41 11 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x7d44_11 ?\<sigma> \<and> block_usage P_0x7d41_11_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x7d41_11_def P_0x7d41_11_regions_def post: Q_0x7d44_11_def regionset: P_0x7d41_11_regions_set_def)

definition P_0x7d44_true_12 :: state_pred where
  \<open>P_0x7d44_true_12 \<sigma> \<equiv> RIP \<sigma> = 0x7d44 \<and> RAX \<sigma> = ucast ((\<sigma> \<turnstile> *[((RDX\<^sub>0::64 word) + 0xf0),4]::32 word)) \<and> RBX \<sigma> = RBX\<^sub>0 \<and> RDX \<sigma> = RDX\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x18) \<and> RBP \<sigma> = RBP\<^sub>0 \<and> R14 \<sigma> = RDX\<^sub>0 \<and> R11 \<sigma> = R11\<^sub>0 \<and> R10 \<sigma> = R10\<^sub>0 \<and> R9 \<sigma> = ucast ((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[((RDX\<^sub>0::64 word) + 0xf0),4]::32 word)::64 word)::64 word) * 0x4)::32 word)) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDX\<^sub>0::64 word) + 0xf0),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RDX\<^sub>0::64 word) + 0xf0),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = 0x7cbc\<close>
declare P_0x7d44_true_12_def[Ps]

definition P_0x7d44_true_12_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x7d44_true_12_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((RDX\<^sub>0::64 word) + 0xf0), 4),
    (2, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x20), 8)
  }\<close>

definition P_0x7d44_true_12_regions :: state_pred where
  \<open>P_0x7d44_true_12_regions \<sigma> \<equiv> \<exists>regions. P_0x7d44_true_12_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x7e8f_12 :: state_pred where
  \<open>Q_0x7e8f_12 \<sigma> \<equiv> RIP \<sigma> = 0x7e8f \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x18) \<and> R14 \<sigma> = RDX\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDX\<^sub>0::64 word) + 0xf0),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RDX\<^sub>0::64 word) + 0xf0),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = 0x7cbc\<close>
declare Q_0x7e8f_12_def[Qs]

schematic_goal AES_set_decrypt_key_0_1_0x7d44_0x7d44_12[blocks]:
  assumes \<open>(P_0x7d44_true_12 && P_0x7d44_true_12_regions && jle) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x7d44 12 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x7e8f_12 ?\<sigma> \<and> block_usage P_0x7d44_true_12_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x7d44_true_12_def P_0x7d44_true_12_regions_def post: Q_0x7e8f_12_def regionset: P_0x7d44_true_12_regions_set_def)

definition P_0x7d44_false_13 :: state_pred where
  \<open>P_0x7d44_false_13 \<sigma> \<equiv> RIP \<sigma> = 0x7d44 \<and> RAX \<sigma> = ucast ((\<sigma> \<turnstile> *[((RDX\<^sub>0::64 word) + 0xf0),4]::32 word)) \<and> RBX \<sigma> = RBX\<^sub>0 \<and> RDX \<sigma> = RDX\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x18) \<and> RBP \<sigma> = RBP\<^sub>0 \<and> R14 \<sigma> = RDX\<^sub>0 \<and> R11 \<sigma> = R11\<^sub>0 \<and> R10 \<sigma> = R10\<^sub>0 \<and> R9 \<sigma> = ucast ((\<langle>31,0\<rangle>(((\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[((RDX\<^sub>0::64 word) + 0xf0),4]::32 word)::64 word)::64 word) * 0x4)::32 word)) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDX\<^sub>0::64 word) + 0xf0),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RDX\<^sub>0::64 word) + 0xf0),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = 0x7cbc\<close>
declare P_0x7d44_false_13_def[Ps]

definition P_0x7d44_false_13_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x7d44_false_13_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((RDX\<^sub>0::64 word) + 0xf0), 4),
    (2, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x20), 8)
  }\<close>

definition P_0x7d44_false_13_regions :: state_pred where
  \<open>P_0x7d44_false_13_regions \<sigma> \<equiv> \<exists>regions. P_0x7d44_false_13_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x7d78_13 :: state_pred where
  \<open>Q_0x7d78_13 \<sigma> \<equiv> RIP \<sigma> = 0x7d78 \<and> RAX \<sigma> = 0x1f3a0 \<and> RDI \<sigma> = 0x1eba0 \<and> RSI \<sigma> = 0x1e7a0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x18) \<and> R14 \<sigma> = RDX\<^sub>0 \<and> R9 \<sigma> = 0x1efa0 \<and> R8 \<sigma> = 0x1e3a0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDX\<^sub>0::64 word) + 0xf0),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RDX\<^sub>0::64 word) + 0xf0),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = 0x7cbc\<close>
declare Q_0x7d78_13_def[Qs]

schematic_goal AES_set_decrypt_key_0_8_0x7d44_0x7d73_13[blocks]:
  assumes \<open>(P_0x7d44_false_13 && P_0x7d44_false_13_regions && ! jle) \<sigma>\<close>
  shows \<open>exec_block 8 0x7d73 13 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x7d78_13 ?\<sigma> \<and> block_usage P_0x7d44_false_13_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x7d44_false_13_def P_0x7d44_false_13_regions_def post: Q_0x7d78_13_def regionset: P_0x7d44_false_13_regions_set_def)

definition P_0x7d78_14 :: state_pred where
  \<open>P_0x7d78_14 \<sigma> \<equiv> RIP \<sigma> = 0x7d78 \<and> RAX \<sigma> = 0x1f3a0 \<and> RDI \<sigma> = 0x1eba0 \<and> RSI \<sigma> = 0x1e7a0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x18) \<and> R14 \<sigma> = RDX\<^sub>0 \<and> R9 \<sigma> = 0x1efa0 \<and> R8 \<sigma> = 0x1e3a0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDX\<^sub>0::64 word) + 0xf0),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RDX\<^sub>0::64 word) + 0xf0),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = 0x7cbc\<close>
declare P_0x7d78_14_def[Ps]

definition P_0x7d78_14_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x7d78_14_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((RDX \<sigma>::64 word) + 0x10), 4),
    (2, ((RDX \<sigma>::64 word) + 0x14), 4),
    (3, ((RDX \<sigma>::64 word) + 0x18), 4),
    (4, ((RDX \<sigma>::64 word) + 0x1c), 4),
    (5, ((0x1e3a0::64 word) + (\<langle>63,0\<rangle>(((\<langle>7,0\<rangle>(\<sigma> \<turnstile> *[((0x1f3a0::64 word) + (\<langle>63,0\<rangle>((ucast (((\<langle>7,0\<rangle>(\<sigma> \<turnstile> *[((RDX \<sigma>::64 word) + 0x10),4]::32 word)::8 word)::8 word))::64 word) * (0x4::64 word))::64 word)),1]::8 word)::64 word)::64 word) * 0x4)::64 word)), 4),
    (6, ((0x1e3a0::64 word) + (\<langle>63,0\<rangle>(((\<langle>7,0\<rangle>(\<sigma> \<turnstile> *[((0x1f3a0::64 word) + (\<langle>63,0\<rangle>((ucast (((\<langle>7,0\<rangle>(\<sigma> \<turnstile> *[((RDX \<sigma>::64 word) + 0x14),4]::32 word)::8 word)::8 word))::64 word) * (0x4::64 word))::64 word)),1]::8 word)::64 word)::64 word) * 0x4)::64 word)), 4),
    (7, ((0x1e3a0::64 word) + (\<langle>63,0\<rangle>(((\<langle>7,0\<rangle>(\<sigma> \<turnstile> *[((0x1f3a0::64 word) + (\<langle>63,0\<rangle>((ucast (((\<langle>7,0\<rangle>(\<sigma> \<turnstile> *[((RDX \<sigma>::64 word) + 0x18),4]::32 word)::8 word)::8 word))::64 word) * (0x4::64 word))::64 word)),1]::8 word)::64 word)::64 word) * 0x4)::64 word)), 4),
    (8, ((0x1e3a0::64 word) + (\<langle>63,0\<rangle>(((\<langle>7,0\<rangle>(\<sigma> \<turnstile> *[((0x1f3a0::64 word) + (\<langle>63,0\<rangle>((ucast (((\<langle>7,0\<rangle>(\<sigma> \<turnstile> *[((RDX \<sigma>::64 word) + 0x1c),4]::32 word)::8 word)::8 word))::64 word) * (0x4::64 word))::64 word)),1]::8 word)::64 word)::64 word) * 0x4)::64 word)), 4),
    (9, ((0x1e7a0::64 word) + (\<langle>63,0\<rangle>(((\<langle>7,0\<rangle>(\<sigma> \<turnstile> *[((0x1f3a0::64 word) + (\<langle>63,0\<rangle>((ucast (((\<langle>15,8\<rangle>(\<sigma> \<turnstile> *[((RDX \<sigma>::64 word) + 0x10),4]::32 word)::8 word)::8 word))::64 word) * (0x4::64 word))::64 word)),1]::8 word)::64 word)::64 word) * 0x4)::64 word)), 4),
    (10, ((0x1e7a0::64 word) + (\<langle>63,0\<rangle>(((\<langle>7,0\<rangle>(\<sigma> \<turnstile> *[((0x1f3a0::64 word) + (\<langle>63,0\<rangle>((ucast (((\<langle>15,8\<rangle>(\<sigma> \<turnstile> *[((RDX \<sigma>::64 word) + 0x14),4]::32 word)::8 word)::8 word))::64 word) * (0x4::64 word))::64 word)),1]::8 word)::64 word)::64 word) * 0x4)::64 word)), 4),
    (11, ((0x1e7a0::64 word) + (\<langle>63,0\<rangle>(((\<langle>7,0\<rangle>(\<sigma> \<turnstile> *[((0x1f3a0::64 word) + (\<langle>63,0\<rangle>((ucast (((\<langle>15,8\<rangle>(\<sigma> \<turnstile> *[((RDX \<sigma>::64 word) + 0x18),4]::32 word)::8 word)::8 word))::64 word) * (0x4::64 word))::64 word)),1]::8 word)::64 word)::64 word) * 0x4)::64 word)), 4),
    (12, ((0x1e7a0::64 word) + (\<langle>63,0\<rangle>(((\<langle>7,0\<rangle>(\<sigma> \<turnstile> *[((0x1f3a0::64 word) + (\<langle>63,0\<rangle>((ucast (((\<langle>15,8\<rangle>(\<sigma> \<turnstile> *[((RDX \<sigma>::64 word) + 0x1c),4]::32 word)::8 word)::8 word))::64 word) * (0x4::64 word))::64 word)),1]::8 word)::64 word)::64 word) * 0x4)::64 word)), 4),
    (13, ((0x1eba0::64 word) + (\<langle>63,0\<rangle>(((\<langle>7,0\<rangle>(\<sigma> \<turnstile> *[((0x1f3a0::64 word) + (\<langle>63,0\<rangle>((ucast (((\<langle>7,0\<rangle>((ucast (((\<sigma> \<turnstile> *[((RDX \<sigma>::64 word) + 0x10),4]::32 word)::32 word))::32 word) >> 16)::8 word)::8 word))::64 word) * (0x4::64 word))::64 word)),1]::8 word)::64 word)::64 word) * 0x4)::64 word)), 4),
    (14, ((0x1eba0::64 word) + (\<langle>63,0\<rangle>(((\<langle>7,0\<rangle>(\<sigma> \<turnstile> *[((0x1f3a0::64 word) + (\<langle>63,0\<rangle>((ucast (((\<langle>7,0\<rangle>((ucast (((\<sigma> \<turnstile> *[((RDX \<sigma>::64 word) + 0x14),4]::32 word)::32 word))::32 word) >> 16)::8 word)::8 word))::64 word) * (0x4::64 word))::64 word)),1]::8 word)::64 word)::64 word) * 0x4)::64 word)), 4),
    (15, ((0x1eba0::64 word) + (\<langle>63,0\<rangle>(((\<langle>7,0\<rangle>(\<sigma> \<turnstile> *[((0x1f3a0::64 word) + (\<langle>63,0\<rangle>((ucast (((\<langle>7,0\<rangle>((ucast (((\<sigma> \<turnstile> *[((RDX \<sigma>::64 word) + 0x18),4]::32 word)::32 word))::32 word) >> 16)::8 word)::8 word))::64 word) * (0x4::64 word))::64 word)),1]::8 word)::64 word)::64 word) * 0x4)::64 word)), 4),
    (16, ((0x1eba0::64 word) + (\<langle>63,0\<rangle>(((\<langle>7,0\<rangle>(\<sigma> \<turnstile> *[((0x1f3a0::64 word) + (\<langle>63,0\<rangle>((ucast (((\<langle>7,0\<rangle>((ucast (((\<sigma> \<turnstile> *[((RDX \<sigma>::64 word) + 0x1c),4]::32 word)::32 word))::32 word) >> 16)::8 word)::8 word))::64 word) * (0x4::64 word))::64 word)),1]::8 word)::64 word)::64 word) * 0x4)::64 word)), 4),
    (17, ((0x1efa0::64 word) + (\<langle>63,0\<rangle>(((\<langle>7,0\<rangle>(\<sigma> \<turnstile> *[((0x1f3a0::64 word) + (\<langle>63,0\<rangle>(((\<langle>31,0\<rangle>((ucast (((\<sigma> \<turnstile> *[((RDX \<sigma>::64 word) + 0x10),4]::32 word)::32 word))::32 word) >> 24)::64 word)::64 word) * 0x4)::64 word)),1]::8 word)::64 word)::64 word) * 0x4)::64 word)), 4),
    (18, ((0x1efa0::64 word) + (\<langle>63,0\<rangle>(((\<langle>7,0\<rangle>(\<sigma> \<turnstile> *[((0x1f3a0::64 word) + (\<langle>63,0\<rangle>(((\<langle>31,0\<rangle>((ucast (((\<sigma> \<turnstile> *[((RDX \<sigma>::64 word) + 0x14),4]::32 word)::32 word))::32 word) >> 24)::64 word)::64 word) * 0x4)::64 word)),1]::8 word)::64 word)::64 word) * 0x4)::64 word)), 4),
    (19, ((0x1efa0::64 word) + (\<langle>63,0\<rangle>(((\<langle>7,0\<rangle>(\<sigma> \<turnstile> *[((0x1f3a0::64 word) + (\<langle>63,0\<rangle>(((\<langle>31,0\<rangle>((ucast (((\<sigma> \<turnstile> *[((RDX \<sigma>::64 word) + 0x18),4]::32 word)::32 word))::32 word) >> 24)::64 word)::64 word) * 0x4)::64 word)),1]::8 word)::64 word)::64 word) * 0x4)::64 word)), 4),
    (20, ((0x1efa0::64 word) + (\<langle>63,0\<rangle>(((\<langle>7,0\<rangle>(\<sigma> \<turnstile> *[((0x1f3a0::64 word) + (\<langle>63,0\<rangle>(((\<langle>31,0\<rangle>((ucast (((\<sigma> \<turnstile> *[((RDX \<sigma>::64 word) + 0x1c),4]::32 word)::32 word))::32 word) >> 24)::64 word)::64 word) * 0x4)::64 word)),1]::8 word)::64 word)::64 word) * 0x4)::64 word)), 4),
    (21, ((0x1f3a0::64 word) + (\<langle>63,0\<rangle>((ucast (((\<langle>7,0\<rangle>((ucast (((\<sigma> \<turnstile> *[((RDX \<sigma>::64 word) + 0x10),4]::32 word)::32 word))::32 word) >> 16)::8 word)::8 word))::64 word) * (0x4::64 word))::64 word)), Suc 0),
    (22, ((0x1f3a0::64 word) + (\<langle>63,0\<rangle>((ucast (((\<langle>7,0\<rangle>((ucast (((\<sigma> \<turnstile> *[((RDX \<sigma>::64 word) + 0x14),4]::32 word)::32 word))::32 word) >> 16)::8 word)::8 word))::64 word) * (0x4::64 word))::64 word)), Suc 0),
    (23, ((0x1f3a0::64 word) + (\<langle>63,0\<rangle>((ucast (((\<langle>7,0\<rangle>((ucast (((\<sigma> \<turnstile> *[((RDX \<sigma>::64 word) + 0x18),4]::32 word)::32 word))::32 word) >> 16)::8 word)::8 word))::64 word) * (0x4::64 word))::64 word)), Suc 0),
    (24, ((0x1f3a0::64 word) + (\<langle>63,0\<rangle>((ucast (((\<langle>7,0\<rangle>((ucast (((\<sigma> \<turnstile> *[((RDX \<sigma>::64 word) + 0x1c),4]::32 word)::32 word))::32 word) >> 16)::8 word)::8 word))::64 word) * (0x4::64 word))::64 word)), Suc 0),
    (25, ((0x1f3a0::64 word) + (\<langle>63,0\<rangle>((ucast (((\<langle>7,0\<rangle>(\<sigma> \<turnstile> *[((RDX \<sigma>::64 word) + 0x10),4]::32 word)::8 word)::8 word))::64 word) * (0x4::64 word))::64 word)), Suc 0),
    (26, ((0x1f3a0::64 word) + (\<langle>63,0\<rangle>((ucast (((\<langle>7,0\<rangle>(\<sigma> \<turnstile> *[((RDX \<sigma>::64 word) + 0x14),4]::32 word)::8 word)::8 word))::64 word) * (0x4::64 word))::64 word)), Suc 0),
    (27, ((0x1f3a0::64 word) + (\<langle>63,0\<rangle>((ucast (((\<langle>7,0\<rangle>(\<sigma> \<turnstile> *[((RDX \<sigma>::64 word) + 0x18),4]::32 word)::8 word)::8 word))::64 word) * (0x4::64 word))::64 word)), Suc 0),
    (28, ((0x1f3a0::64 word) + (\<langle>63,0\<rangle>((ucast (((\<langle>7,0\<rangle>(\<sigma> \<turnstile> *[((RDX \<sigma>::64 word) + 0x1c),4]::32 word)::8 word)::8 word))::64 word) * (0x4::64 word))::64 word)), Suc 0),
    (29, ((0x1f3a0::64 word) + (\<langle>63,0\<rangle>((ucast (((\<langle>15,8\<rangle>(\<sigma> \<turnstile> *[((RDX \<sigma>::64 word) + 0x10),4]::32 word)::8 word)::8 word))::64 word) * (0x4::64 word))::64 word)), Suc 0),
    (30, ((0x1f3a0::64 word) + (\<langle>63,0\<rangle>((ucast (((\<langle>15,8\<rangle>(\<sigma> \<turnstile> *[((RDX \<sigma>::64 word) + 0x14),4]::32 word)::8 word)::8 word))::64 word) * (0x4::64 word))::64 word)), Suc 0),
    (31, ((0x1f3a0::64 word) + (\<langle>63,0\<rangle>((ucast (((\<langle>15,8\<rangle>(\<sigma> \<turnstile> *[((RDX \<sigma>::64 word) + 0x18),4]::32 word)::8 word)::8 word))::64 word) * (0x4::64 word))::64 word)), Suc 0),
    (32, ((0x1f3a0::64 word) + (\<langle>63,0\<rangle>((ucast (((\<langle>15,8\<rangle>(\<sigma> \<turnstile> *[((RDX \<sigma>::64 word) + 0x1c),4]::32 word)::8 word)::8 word))::64 word) * (0x4::64 word))::64 word)), Suc 0),
    (33, ((0x1f3a0::64 word) + (\<langle>63,0\<rangle>(((\<langle>31,0\<rangle>((ucast (((\<sigma> \<turnstile> *[((RDX \<sigma>::64 word) + 0x10),4]::32 word)::32 word))::32 word) >> 24)::64 word)::64 word) * 0x4)::64 word)), Suc 0),
    (34, ((0x1f3a0::64 word) + (\<langle>63,0\<rangle>(((\<langle>31,0\<rangle>((ucast (((\<sigma> \<turnstile> *[((RDX \<sigma>::64 word) + 0x14),4]::32 word)::32 word))::32 word) >> 24)::64 word)::64 word) * 0x4)::64 word)), Suc 0),
    (35, ((0x1f3a0::64 word) + (\<langle>63,0\<rangle>(((\<langle>31,0\<rangle>((ucast (((\<sigma> \<turnstile> *[((RDX \<sigma>::64 word) + 0x18),4]::32 word)::32 word))::32 word) >> 24)::64 word)::64 word) * 0x4)::64 word)), Suc 0),
    (36, ((0x1f3a0::64 word) + (\<langle>63,0\<rangle>(((\<langle>31,0\<rangle>((ucast (((\<sigma> \<turnstile> *[((RDX \<sigma>::64 word) + 0x1c),4]::32 word)::32 word))::32 word) >> 24)::64 word)::64 word) * 0x4)::64 word)), Suc 0),
    (37, ((RDX\<^sub>0::64 word) + 0xf0), 4),
    (38, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (39, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (40, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (41, ((RSP\<^sub>0::64 word) - 0x20), 8)
  }\<close>

definition P_0x7d78_14_regions :: state_pred where
  \<open>P_0x7d78_14_regions \<sigma> \<equiv> \<exists>regions. P_0x7d78_14_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>


definition Q_0x7e89_14 :: state_pred where
  \<open>Q_0x7e89_14 \<sigma> \<equiv> RIP \<sigma> = 0x7e89 \<and> RAX \<sigma> = 0x1f3a0 \<and> RDI \<sigma> = 0x1eba0 \<and> RSI \<sigma> = 0x1e7a0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x18) \<and> R14 \<sigma> = RDX\<^sub>0 \<and> R9 \<sigma> = 0x1efa0 \<and> R8 \<sigma> = 0x1e3a0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDX\<^sub>0::64 word) + 0xf0),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RDX\<^sub>0::64 word) + 0xf0),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = 0x7cbc\<close>
declare Q_0x7e89_14_def[Qs]

schematic_goal AES_set_decrypt_key_0_75_0x7d78_0x7e82_14[blocks]:
  assumes \<open>(P_0x7d78_14 && P_0x7d78_14_regions) \<sigma>\<close>
  shows \<open>exec_block 75 0x7e82 14 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x7e89_14 ?\<sigma> \<and> block_usage P_0x7d78_14_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x7d78_14_def P_0x7d78_14_regions_def post: Q_0x7e89_14_def regionset: P_0x7d78_14_regions_set_def)

definition P_0x7e89_true_15 :: state_pred where
  \<open>P_0x7e89_true_15 \<sigma> \<equiv> RIP \<sigma> = 0x7e89 \<and> RAX \<sigma> = 0x1f3a0 \<and> RDI \<sigma> = 0x1eba0 \<and> RSI \<sigma> = 0x1e7a0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x18) \<and> R14 \<sigma> = RDX\<^sub>0 \<and> R9 \<sigma> = 0x1efa0 \<and> R8 \<sigma> = 0x1e3a0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDX\<^sub>0::64 word) + 0xf0),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RDX\<^sub>0::64 word) + 0xf0),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = 0x7cbc\<close>
declare P_0x7e89_true_15_def[Ps]

definition P_0x7e89_true_15_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x7e89_true_15_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((RDX\<^sub>0::64 word) + 0xf0), 4),
    (2, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x20), 8)
  }\<close>

definition P_0x7e89_true_15_regions :: state_pred where
  \<open>P_0x7e89_true_15_regions \<sigma> \<equiv> \<exists>regions. P_0x7e89_true_15_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x7d78_15 :: state_pred where
  \<open>Q_0x7d78_15 \<sigma> \<equiv> RIP \<sigma> = 0x7d78 \<and> RAX \<sigma> = 0x1f3a0 \<and> RDI \<sigma> = 0x1eba0 \<and> RSI \<sigma> = 0x1e7a0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x18) \<and> R14 \<sigma> = RDX\<^sub>0 \<and> R9 \<sigma> = 0x1efa0 \<and> R8 \<sigma> = 0x1e3a0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDX\<^sub>0::64 word) + 0xf0),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RDX\<^sub>0::64 word) + 0xf0),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = 0x7cbc\<close>
declare Q_0x7d78_15_def[Qs]

schematic_goal AES_set_decrypt_key_0_1_0x7e89_0x7e89_15[blocks]:
  assumes \<open>(P_0x7e89_true_15 && P_0x7e89_true_15_regions && jg) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x7e89 15 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x7d78_15 ?\<sigma> \<and> block_usage P_0x7e89_true_15_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x7e89_true_15_def P_0x7e89_true_15_regions_def post: Q_0x7d78_15_def regionset: P_0x7e89_true_15_regions_set_def)

definition P_0x7e89_false_16 :: state_pred where
  \<open>P_0x7e89_false_16 \<sigma> \<equiv> RIP \<sigma> = 0x7e89 \<and> RAX \<sigma> = 0x1f3a0 \<and> RDI \<sigma> = 0x1eba0 \<and> RSI \<sigma> = 0x1e7a0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x18) \<and> R14 \<sigma> = RDX\<^sub>0 \<and> R9 \<sigma> = 0x1efa0 \<and> R8 \<sigma> = 0x1e3a0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDX\<^sub>0::64 word) + 0xf0),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RDX\<^sub>0::64 word) + 0xf0),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = 0x7cbc\<close>
declare P_0x7e89_false_16_def[Ps]

definition P_0x7e89_false_16_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x7e89_false_16_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((RDX\<^sub>0::64 word) + 0xf0), 4),
    (2, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x20), 8)
  }\<close>

definition P_0x7e89_false_16_regions :: state_pred where
  \<open>P_0x7e89_false_16_regions \<sigma> \<equiv> \<exists>regions. P_0x7e89_false_16_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x7e8f_16 :: state_pred where
  \<open>Q_0x7e8f_16 \<sigma> \<equiv> RIP \<sigma> = 0x7e8f \<and> RAX \<sigma> = 0x1f3a0 \<and> RDI \<sigma> = 0x1eba0 \<and> RSI \<sigma> = 0x1e7a0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x18) \<and> R14 \<sigma> = RDX\<^sub>0 \<and> R9 \<sigma> = 0x1efa0 \<and> R8 \<sigma> = 0x1e3a0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDX\<^sub>0::64 word) + 0xf0),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RDX\<^sub>0::64 word) + 0xf0),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = 0x7cbc\<close>
declare Q_0x7e8f_16_def[Qs]

schematic_goal AES_set_decrypt_key_0_1_0x7e89_0x7e89_16[blocks]:
  assumes \<open>(P_0x7e89_false_16 && P_0x7e89_false_16_regions && ! jg) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x7e89 16 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x7e8f_16 ?\<sigma> \<and> block_usage P_0x7e89_false_16_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x7e89_false_16_def P_0x7e89_false_16_regions_def post: Q_0x7e8f_16_def regionset: P_0x7e89_false_16_regions_set_def)

definition P_0x7e8f_17 :: state_pred where
  \<open>P_0x7e8f_17 \<sigma> \<equiv> RIP \<sigma> = 0x7e8f \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x18) \<and> R14 \<sigma> = RDX\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDX\<^sub>0::64 word) + 0xf0),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RDX\<^sub>0::64 word) + 0xf0),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = 0x7cbc\<close>
declare P_0x7e8f_17_def[Ps]

definition P_0x7e8f_17_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x7e8f_17_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((RDX\<^sub>0::64 word) + 0xf0), 4),
    (2, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x20), 8)
  }\<close>

definition P_0x7e8f_17_regions :: state_pred where
  \<open>P_0x7e8f_17_regions \<sigma> \<equiv> \<exists>regions. P_0x7e8f_17_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x7e91_17 :: state_pred where
  \<open>Q_0x7e91_17 \<sigma> \<equiv> RIP \<sigma> = 0x7e91 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x18) \<and> R14 \<sigma> = RDX\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = 0x7cbc\<close>
declare Q_0x7e91_17_def[Qs]

schematic_goal AES_set_decrypt_key_0_1_0x7e8f_0x7e8f_17[blocks]:
  assumes \<open>(P_0x7e8f_17 && P_0x7e8f_17_regions) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x7e8f 17 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x7e91_17 ?\<sigma> \<and> block_usage P_0x7e8f_17_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x7e8f_17_def P_0x7e8f_17_regions_def post: Q_0x7e91_17_def regionset: P_0x7e8f_17_regions_set_def)

definition P_0x7e91_18 :: state_pred where
  \<open>P_0x7e91_18 \<sigma> \<equiv> RIP \<sigma> = 0x7e91 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x18) \<and> R14 \<sigma> = RDX\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = 0x7cbc\<close>
declare P_0x7e91_18_def[Ps]

definition P_0x7e91_18_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x7e91_18_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (2, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x20), 8)
  }\<close>

definition P_0x7e91_18_regions :: state_pred where
  \<open>P_0x7e91_18_regions \<sigma> \<equiv> \<exists>regions. P_0x7e91_18_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_ret_address_18 :: state_pred where
  \<open>Q_ret_address_18 \<sigma> \<equiv> RIP \<sigma> = ret_address \<and> RBX \<sigma> = RBX\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) + 0x8) \<and> RBP \<sigma> = RBP\<^sub>0 \<and> R14 \<sigma> = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = 0x7cbc\<close>
declare Q_ret_address_18_def[Qs]

schematic_goal AES_set_decrypt_key_0_4_0x7e91_0x7e95_18[blocks]:
  assumes \<open>(P_0x7e91_18 && P_0x7e91_18_regions) \<sigma>\<close>
  shows \<open>exec_block 4 0x7e95 18 \<sigma> \<triangleq> ?\<sigma> \<and> Q_ret_address_18 ?\<sigma> \<and> block_usage P_0x7e91_18_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x7e91_18_def P_0x7e91_18_regions_def post: Q_ret_address_18_def regionset: P_0x7e91_18_regions_set_def)

definition AES_set_decrypt_key_acode :: ACode where
  \<open>AES_set_decrypt_key_acode =
    Block 4 0x7cb6 0;
    Block (Suc 0) 0x7cb7 (Suc 0);
    CALL AES_set_encrypt_key_acode;
    Block (Suc 0) 0x7cbc 2;
    IF SF THEN
      Block (Suc 0) 0x7cbe 3
    ELSE
      Block 5 0x7cd6 4;
      IF jle THEN
        Block (Suc 0) 0x7cd9 5
      ELSE
        Block 6 0x7ce7 6;
        WHILE P_0x7cf0_7 DO
          Block 22 0x7d36 7;
          IF jl THEN
            Block (Suc 0) 0x7d38 8
          ELSE
            Block (Suc 0) 0x7d38 9
          FI
        OD;
        Block (Suc 0) 0x7d3a 10
      FI;
      Block (Suc 0) 0x7d41 11;
      IF jle THEN
        Block (Suc 0) 0x7d44 12
      ELSE
        Block 8 0x7d73 13;
        WHILE P_0x7d78_14 DO
          Block 75 0x7e82 14;
          IF jg THEN
            Block (Suc 0) 0x7e89 15
          ELSE
            Block (Suc 0) 0x7e89 16
          FI
        OD
      FI;
      Block (Suc 0) 0x7e8f 17
    FI;
    Block 4 0x7e95 18
  \<close>

schematic_goal "AES_set_decrypt_key":
  assumes
    \<open>\<forall>\<sigma>. RIP \<sigma> = 0x7cb7 \<longrightarrow> P_0x7cb7_1_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x7cbc \<longrightarrow> P_0x7cbc_2_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x7cbe \<longrightarrow> P_0x7cbe_true_3_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x7cbe \<longrightarrow> P_0x7cbe_false_4_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x7cd9 \<longrightarrow> P_0x7cd9_true_5_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x7cd9 \<longrightarrow> P_0x7cd9_false_6_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x7cf0 \<longrightarrow> P_0x7cf0_7_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x7d38 \<longrightarrow> P_0x7d38_true_8_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x7d38 \<longrightarrow> P_0x7d38_false_9_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x7d3a \<longrightarrow> P_0x7d3a_10_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x7d41 \<longrightarrow> P_0x7d41_11_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x7d44 \<longrightarrow> P_0x7d44_true_12_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x7d44 \<longrightarrow> P_0x7d44_false_13_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x7d78 \<longrightarrow> P_0x7d78_14_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x7e89 \<longrightarrow> P_0x7e89_true_15_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x7e89 \<longrightarrow> P_0x7e89_false_16_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x7e8f \<longrightarrow> P_0x7e8f_17_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x7e91 \<longrightarrow> P_0x7e91_18_regions \<sigma>\<close>
    and [blocks]: \<open>{{Q_AES_set_encrypt_key_addr_0x7cb7_1}} \<box>AES_set_encrypt_key_acode {{P_0x7cbc_2;M_0x7cb7}}\<close>
  shows \<open>{{?P}} AES_set_decrypt_key_acode {{?Q;?M}}\<close>
  apply (vcg acode: AES_set_decrypt_key_acode_def assms: assms)
  apply (vcg_while \<open>P_0x7cf0_7 || P_0x7d3a_10\<close> assms: assms)
  apply (vcg_step assms: assms)+
  apply (vcg_while \<open>P_0x7d78_14 || P_0x7e8f_17\<close> assms: assms)
  apply (vcg_step assms: assms)
  done

end

end
