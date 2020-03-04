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
theory AES_encrypt
  imports "../../../isabelle/VCG/HTriple"
begin

(* OLD, doesn't regenerate with current code_abstraction *)

locale "qemu_img_xen" = execution_context + exec_code +
  assumes fetch:
    "fetch 0x7ea0 \<equiv> (Unary (IS_8088 Push) (Storage (Reg (General SixtyFour r15))), 2)"
    "fetch 0x7ea2 \<equiv> (Binary (IS_8088 Lea) (Reg (General SixtyFour r11)) (Storage (Memory SixtyFour (A_Plus (A_FromReg (General SixtyFour rip)) (A_WordConstant 99575)))), 7)"
    "fetch 0x7ea9 \<equiv> (Binary (IS_8088 Lea) (Reg (General SixtyFour r10)) (Storage (Memory SixtyFour (A_Plus (A_FromReg (General SixtyFour rip)) (A_WordConstant 96496)))), 7)"
    "fetch 0x7eb0 \<equiv> (Unary (IS_8088 Push) (Storage (Reg (General SixtyFour r14))), 2)"
    "fetch 0x7eb2 \<equiv> (Binary (IS_8088 Lea) (Reg (General SixtyFour r9)) (Storage (Memory SixtyFour (A_Plus (A_FromReg (General SixtyFour rip)) (A_WordConstant 98535)))), 7)"
    "fetch 0x7eb9 \<equiv> (Binary (IS_8088 Lea) (Reg (General SixtyFour r8)) (Storage (Memory SixtyFour (A_Plus (A_FromReg (General SixtyFour rip)) (A_WordConstant 97504)))), 7)"
    "fetch 0x7ec0 \<equiv> (Unary (IS_8088 Push) (Storage (Reg (General SixtyFour r13))), 2)"
    "fetch 0x7ec2 \<equiv> (Unary (IS_8088 Push) (Storage (Reg (General SixtyFour r12))), 2)"
    "fetch 0x7ec4 \<equiv> (Unary (IS_8088 Push) (Storage (Reg (General SixtyFour rbp))), 1)"
    "fetch 0x7ec5 \<equiv> (Unary (IS_8088 Push) (Storage (Reg (General SixtyFour rbx))), 1)"
    "fetch 0x7ec6 \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour rbx)) (Storage (Reg (General SixtyFour rdx))), 3)"
    "fetch 0x7ec9 \<equiv> (Binary (IS_80386 Movzx) (Reg (General ThirtyTwo rax)) (Storage (Memory Eight (A_SizeDirective 8 (A_FromReg (General SixtyFour rdi))))), 3)"
    "fetch 0x7ecc \<equiv> (Binary (IS_80386 Movzx) (Reg (General ThirtyTwo rbp)) (Storage (Memory Eight (A_SizeDirective 8 (A_Plus (A_FromReg (General SixtyFour rdi)) (A_WordConstant 4))))), 4)"
    "fetch 0x7ed0 \<equiv> (Binary (IS_80386 Movzx) (Reg (General ThirtyTwo r12)) (Storage (Memory Eight (A_SizeDirective 8 (A_Plus (A_FromReg (General SixtyFour rdi)) (A_WordConstant 8))))), 5)"
    "fetch 0x7ed5 \<equiv> (Binary (IS_8088 Shl) (Reg (General ThirtyTwo rax)) (Immediate SixtyFour (ImmVal 24)), 3)"
    "fetch 0x7ed8 \<equiv> (Binary (IS_8088 Mov) (Memory SixtyFour (A_SizeDirective 64 (A_Minus (A_FromReg (General SixtyFour rsp)) (A_WordConstant 24)))) (Storage (Reg (General SixtyFour rdx))), 5)"
    "fetch 0x7edd \<equiv> (Binary (IS_80386 Movzx) (Reg (General ThirtyTwo rdx)) (Storage (Memory Eight (A_SizeDirective 8 (A_Plus (A_FromReg (General SixtyFour rdi)) (A_WordConstant 1))))), 4)"
    "fetch 0x7ee1 \<equiv> (Binary (IS_8088 Shl) (Reg (General ThirtyTwo rbp)) (Immediate SixtyFour (ImmVal 24)), 3)"
    "fetch 0x7ee4 \<equiv> (Binary (IS_8088 Shl) (Reg (General ThirtyTwo r12)) (Immediate SixtyFour (ImmVal 24)), 4)"
    "fetch 0x7ee8 \<equiv> (Binary (IS_8088 Mov) (Memory SixtyFour (A_SizeDirective 64 (A_Minus (A_FromReg (General SixtyFour rsp)) (A_WordConstant 16)))) (Storage (Reg (General SixtyFour rsi))), 5)"
    "fetch 0x7eed \<equiv> (Binary (IS_80386 Movzx) (Reg (General ThirtyTwo rsi)) (Storage (Memory Eight (A_SizeDirective 8 (A_Plus (A_FromReg (General SixtyFour rdi)) (A_WordConstant 12))))), 4)"
    "fetch 0x7ef1 \<equiv> (Binary (IS_8088 Shl) (Reg (General ThirtyTwo rdx)) (Immediate SixtyFour (ImmVal 16)), 3)"
    "fetch 0x7ef4 \<equiv> (Binary (IS_8088 Xor) (Reg (General ThirtyTwo rax)) (Storage (Reg (General ThirtyTwo rdx))), 2)"
    "fetch 0x7ef6 \<equiv> (Binary (IS_80386 Movzx) (Reg (General ThirtyTwo rdx)) (Storage (Memory Eight (A_SizeDirective 8 (A_Plus (A_FromReg (General SixtyFour rdi)) (A_WordConstant 3))))), 4)"
    "fetch 0x7efa \<equiv> (Binary (IS_8088 Shl) (Reg (General ThirtyTwo rsi)) (Immediate SixtyFour (ImmVal 24)), 3)"
    "fetch 0x7efd \<equiv> (Binary (IS_8088 Xor) (Reg (General ThirtyTwo rax)) (Storage (Reg (General ThirtyTwo rdx))), 2)"
    "fetch 0x7eff \<equiv> (Binary (IS_80386 Movzx) (Reg (General ThirtyTwo rdx)) (Storage (Memory Eight (A_SizeDirective 8 (A_Plus (A_FromReg (General SixtyFour rdi)) (A_WordConstant 2))))), 4)"
    "fetch 0x7f03 \<equiv> (Binary (IS_8088 Shl) (Reg (General ThirtyTwo rdx)) (Immediate SixtyFour (ImmVal 8)), 3)"
    "fetch 0x7f06 \<equiv> (Binary (IS_8088 Xor) (Reg (General ThirtyTwo rax)) (Storage (Reg (General ThirtyTwo rdx))), 2)"
    "fetch 0x7f08 \<equiv> (Binary (IS_80386 Movzx) (Reg (General ThirtyTwo rdx)) (Storage (Memory Eight (A_SizeDirective 8 (A_Plus (A_FromReg (General SixtyFour rdi)) (A_WordConstant 5))))), 4)"
    "fetch 0x7f0c \<equiv> (Binary (IS_8088 Xor) (Reg (General ThirtyTwo rax)) (Storage (Memory ThirtyTwo (A_SizeDirective 32 (A_FromReg (General SixtyFour rbx))))), 2)"
    "fetch 0x7f0e \<equiv> (Binary (IS_8088 Shl) (Reg (General ThirtyTwo rdx)) (Immediate SixtyFour (ImmVal 16)), 3)"
    "fetch 0x7f11 \<equiv> (Binary (IS_8088 Xor) (Reg (General ThirtyTwo rbp)) (Storage (Reg (General ThirtyTwo rdx))), 2)"
    "fetch 0x7f13 \<equiv> (Binary (IS_80386 Movzx) (Reg (General ThirtyTwo rdx)) (Storage (Memory Eight (A_SizeDirective 8 (A_Plus (A_FromReg (General SixtyFour rdi)) (A_WordConstant 7))))), 4)"
    "fetch 0x7f17 \<equiv> (Binary (IS_8088 Xor) (Reg (General ThirtyTwo rbp)) (Storage (Reg (General ThirtyTwo rdx))), 2)"
    "fetch 0x7f19 \<equiv> (Binary (IS_80386 Movzx) (Reg (General ThirtyTwo rdx)) (Storage (Memory Eight (A_SizeDirective 8 (A_Plus (A_FromReg (General SixtyFour rdi)) (A_WordConstant 6))))), 4)"
    "fetch 0x7f1d \<equiv> (Binary (IS_8088 Shl) (Reg (General ThirtyTwo rdx)) (Immediate SixtyFour (ImmVal 8)), 3)"
    "fetch 0x7f20 \<equiv> (Binary (IS_8088 Xor) (Reg (General ThirtyTwo rbp)) (Storage (Reg (General ThirtyTwo rdx))), 2)"
    "fetch 0x7f22 \<equiv> (Binary (IS_80386 Movzx) (Reg (General ThirtyTwo rdx)) (Storage (Memory Eight (A_SizeDirective 8 (A_Plus (A_FromReg (General SixtyFour rdi)) (A_WordConstant 9))))), 4)"
    "fetch 0x7f26 \<equiv> (Binary (IS_8088 Xor) (Reg (General ThirtyTwo rbp)) (Storage (Memory ThirtyTwo (A_SizeDirective 32 (A_Plus (A_FromReg (General SixtyFour rbx)) (A_WordConstant 4))))), 3)"
    "fetch 0x7f29 \<equiv> (Binary (IS_8088 Shl) (Reg (General ThirtyTwo rdx)) (Immediate SixtyFour (ImmVal 16)), 3)"
    "fetch 0x7f2c \<equiv> (Binary (IS_8088 Xor) (Reg (General ThirtyTwo r12)) (Storage (Reg (General ThirtyTwo rdx))), 3)"
    "fetch 0x7f2f \<equiv> (Binary (IS_80386 Movzx) (Reg (General ThirtyTwo rdx)) (Storage (Memory Eight (A_SizeDirective 8 (A_Plus (A_FromReg (General SixtyFour rdi)) (A_WordConstant 11))))), 4)"
    "fetch 0x7f33 \<equiv> (Binary (IS_8088 Xor) (Reg (General ThirtyTwo r12)) (Storage (Reg (General ThirtyTwo rdx))), 3)"
    "fetch 0x7f36 \<equiv> (Binary (IS_80386 Movzx) (Reg (General ThirtyTwo rdx)) (Storage (Memory Eight (A_SizeDirective 8 (A_Plus (A_FromReg (General SixtyFour rdi)) (A_WordConstant 10))))), 4)"
    "fetch 0x7f3a \<equiv> (Binary (IS_8088 Shl) (Reg (General ThirtyTwo rdx)) (Immediate SixtyFour (ImmVal 8)), 3)"
    "fetch 0x7f3d \<equiv> (Binary (IS_8088 Xor) (Reg (General ThirtyTwo r12)) (Storage (Reg (General ThirtyTwo rdx))), 3)"
    "fetch 0x7f40 \<equiv> (Binary (IS_80386 Movzx) (Reg (General ThirtyTwo rdx)) (Storage (Memory Eight (A_SizeDirective 8 (A_Plus (A_FromReg (General SixtyFour rdi)) (A_WordConstant 13))))), 4)"
    "fetch 0x7f44 \<equiv> (Binary (IS_8088 Xor) (Reg (General ThirtyTwo r12)) (Storage (Memory ThirtyTwo (A_SizeDirective 32 (A_Plus (A_FromReg (General SixtyFour rbx)) (A_WordConstant 8))))), 4)"
    "fetch 0x7f48 \<equiv> (Binary (IS_8088 Shl) (Reg (General ThirtyTwo rdx)) (Immediate SixtyFour (ImmVal 16)), 3)"
    "fetch 0x7f4b \<equiv> (Binary (IS_8088 Xor) (Reg (General ThirtyTwo rsi)) (Storage (Reg (General ThirtyTwo rdx))), 2)"
    "fetch 0x7f4d \<equiv> (Binary (IS_80386 Movzx) (Reg (General ThirtyTwo rdx)) (Storage (Memory Eight (A_SizeDirective 8 (A_Plus (A_FromReg (General SixtyFour rdi)) (A_WordConstant 15))))), 4)"
    "fetch 0x7f51 \<equiv> (Binary (IS_8088 Xor) (Reg (General ThirtyTwo rsi)) (Storage (Reg (General ThirtyTwo rdx))), 2)"
    "fetch 0x7f53 \<equiv> (Binary (IS_80386 Movzx) (Reg (General ThirtyTwo rdx)) (Storage (Memory Eight (A_SizeDirective 8 (A_Plus (A_FromReg (General SixtyFour rdi)) (A_WordConstant 14))))), 4)"
    "fetch 0x7f57 \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour rdi)) (Storage (Reg (General SixtyFour rbx))), 3)"
    "fetch 0x7f5a \<equiv> (Binary (IS_8088 Shl) (Reg (General ThirtyTwo rdx)) (Immediate SixtyFour (ImmVal 8)), 3)"
    "fetch 0x7f5d \<equiv> (Binary (IS_8088 Xor) (Reg (General ThirtyTwo rsi)) (Storage (Reg (General ThirtyTwo rdx))), 2)"
    "fetch 0x7f5f \<equiv> (Binary (IS_8088 Xor) (Reg (General ThirtyTwo rsi)) (Storage (Memory ThirtyTwo (A_SizeDirective 32 (A_Plus (A_FromReg (General SixtyFour rbx)) (A_WordConstant 12))))), 3)"
    "fetch 0x7f62 \<equiv> (Binary (IS_8088 Mov) (Reg (General ThirtyTwo rbx)) (Storage (Memory ThirtyTwo (A_SizeDirective 32 (A_Plus (A_FromReg (General SixtyFour rbx)) (A_WordConstant 240))))), 6)"
    "fetch 0x7f68 \<equiv> (Binary (IS_8088 Mov) (Reg (General ThirtyTwo rdx)) (Storage (Reg (General ThirtyTwo rbx))), 2)"
    "fetch 0x7f6a \<equiv> (Binary (IS_8088 Mov) (Memory ThirtyTwo (A_SizeDirective 32 (A_Minus (A_FromReg (General SixtyFour rsp)) (A_WordConstant 64)))) (Storage (Reg (General ThirtyTwo rbx))), 4)"
    "fetch 0x7f6e \<equiv> (Binary (IS_8088 Sar) (Reg (General ThirtyTwo rdx)) (Immediate SixtyFour (ImmVal 1)), 2)"
    "fetch 0x7f70 \<equiv> (Binary (IS_8088 Sub) (Reg (General ThirtyTwo rdx)) (Immediate SixtyFour (ImmVal 1)), 3)"
    "fetch 0x7f73 \<equiv> (Binary (IS_8088 Mov) (Memory ThirtyTwo (A_SizeDirective 32 (A_Minus (A_FromReg (General SixtyFour rsp)) (A_WordConstant 4)))) (Storage (Reg (General ThirtyTwo rdx))), 4)"
    "fetch 0x7f77 \<equiv> (Binary (IS_8088 Add) (Reg (General SixtyFour rdx)) (Immediate SixtyFour (ImmVal 1)), 4)"
    "fetch 0x7f7b \<equiv> (Binary (IS_8088 Shl) (Reg (General SixtyFour rdx)) (Immediate SixtyFour (ImmVal 5)), 4)"
    "fetch 0x7f7f \<equiv> (Binary (IS_8088 Add) (Reg (General SixtyFour rdx)) (Storage (Reg (General SixtyFour rdi))), 3)"
    "fetch 0x7f82 \<equiv> (Binary (IS_8088 Mov) (Memory SixtyFour (A_SizeDirective 64 (A_Minus (A_FromReg (General SixtyFour rsp)) (A_WordConstant 32)))) (Storage (Reg (General SixtyFour rdx))), 5)"
    "fetch 0x7f87 \<equiv> (Unary (IS_8088 Jmp) (Immediate SixtyFour (ImmVal 32774)), 2)"
    "fetch 0x7f89 \<equiv> (Unary (IS_8088 Nop) (Storage (Memory ThirtyTwo (A_SizeDirective 32 (A_Plus (A_FromReg (General SixtyFour rax)) (A_WordConstant 0))))), 7)"
    "fetch 0x7f90 \<equiv> (Binary (IS_8088 Mov) (Reg (General ThirtyTwo rdx)) (Storage (Memory ThirtyTwo (A_SizeDirective 32 (A_Minus (A_FromReg (General SixtyFour rsp)) (A_WordConstant 60))))), 4)"
    "fetch 0x7f94 \<equiv> (Binary (IS_8088 Mov) (Reg (General ThirtyTwo rax)) (Storage (Memory ThirtyTwo (A_SizeDirective 32 (A_Plus (A_FromReg (General SixtyFour r11)) (A_Mult 4 (A_FromReg (General SixtyFour r12))))))), 4)"
    "fetch 0x7f98 \<equiv> (Binary (IS_8088 Mov) (Reg (General ThirtyTwo rsi)) (Storage (Reg (General ThirtyTwo rsi))), 2)"
    "fetch 0x7f9a \<equiv> (Binary (IS_8088 Mov) (Reg (General ThirtyTwo rbx)) (Storage (Reg (General ThirtyTwo rbx))), 2)"
    "fetch 0x7f9c \<equiv> (Binary (IS_8088 Xor) (Reg (General ThirtyTwo rax)) (Storage (Memory ThirtyTwo (A_SizeDirective 32 (A_Plus (A_FromReg (General SixtyFour r10)) (A_Mult 4 (A_FromReg (General SixtyFour r13))))))), 4)"
    "fetch 0x7fa0 \<equiv> (Binary (IS_8088 Xor) (Reg (General ThirtyTwo rax)) (Storage (Reg (General ThirtyTwo r14))), 3)"
    "fetch 0x7fa3 \<equiv> (Binary (IS_8088 Xor) (Reg (General ThirtyTwo rax)) (Storage (Memory ThirtyTwo (A_SizeDirective 32 (A_Plus (A_FromReg (General SixtyFour r9)) (A_Mult 4 (A_FromReg (General SixtyFour rbp))))))), 4)"
    "fetch 0x7fa7 \<equiv> (Binary (IS_8088 Mov) (Reg (General ThirtyTwo rbp)) (Storage (Memory ThirtyTwo (A_SizeDirective 32 (A_Plus (A_FromReg (General SixtyFour r11)) (A_Mult 4 (A_FromReg (General SixtyFour rdx))))))), 4)"
    "fetch 0x7fab \<equiv> (Binary (IS_8088 Xor) (Reg (General ThirtyTwo rax)) (Storage (Memory ThirtyTwo (A_SizeDirective 32 (A_Plus (A_FromReg (General SixtyFour r8)) (A_Mult 4 (A_FromReg (General SixtyFour rsi))))))), 4)"
    "fetch 0x7faf \<equiv> (Binary (IS_8088 Mov) (Reg (General ThirtyTwo rdx)) (Storage (Memory ThirtyTwo (A_SizeDirective 32 (A_Minus (A_FromReg (General SixtyFour rsp)) (A_WordConstant 56))))), 4)"
    "fetch 0x7fb3 \<equiv> (Binary (IS_8088 Mov) (Reg (General ThirtyTwo rsi)) (Storage (Memory ThirtyTwo (A_SizeDirective 32 (A_Minus (A_FromReg (General SixtyFour rsp)) (A_WordConstant 48))))), 4)"
    "fetch 0x7fb7 \<equiv> (Binary (IS_8088 Xor) (Reg (General ThirtyTwo rbp)) (Storage (Memory ThirtyTwo (A_SizeDirective 32 (A_Plus (A_FromReg (General SixtyFour r10)) (A_Mult 4 (A_FromReg (General SixtyFour rsi))))))), 4)"
    "fetch 0x7fbb \<equiv> (Binary (IS_8088 Xor) (Reg (General ThirtyTwo rbp)) (Storage (Memory ThirtyTwo (A_SizeDirective 32 (A_Plus (A_FromReg (General SixtyFour rdi)) (A_WordConstant 4))))), 3)"
    "fetch 0x7fbe \<equiv> (Binary (IS_8088 Xor) (Reg (General ThirtyTwo rbp)) (Storage (Memory ThirtyTwo (A_SizeDirective 32 (A_Plus (A_FromReg (General SixtyFour r9)) (A_Mult 4 (A_FromReg (General SixtyFour rdx))))))), 4)"
    "fetch 0x7fc2 \<equiv> (Binary (IS_8088 Mov) (Reg (General ThirtyTwo rdx)) (Storage (Memory ThirtyTwo (A_SizeDirective 32 (A_Minus (A_FromReg (General SixtyFour rsp)) (A_WordConstant 52))))), 4)"
    "fetch 0x7fc6 \<equiv> (Binary (IS_8088 Xor) (Reg (General ThirtyTwo rbp)) (Storage (Memory ThirtyTwo (A_SizeDirective 32 (A_Plus (A_FromReg (General SixtyFour r8)) (A_Mult 4 (A_FromReg (General SixtyFour rdx))))))), 4)"
    "fetch 0x7fca \<equiv> (Binary (IS_8088 Mov) (Reg (General ThirtyTwo rdx)) (Storage (Memory ThirtyTwo (A_SizeDirective 32 (A_Minus (A_FromReg (General SixtyFour rsp)) (A_WordConstant 44))))), 4)"
    "fetch 0x7fce \<equiv> (Binary (IS_8088 Mov) (Reg (General ThirtyTwo r12)) (Storage (Memory ThirtyTwo (A_SizeDirective 32 (A_Plus (A_FromReg (General SixtyFour r11)) (A_Mult 4 (A_FromReg (General SixtyFour rdx))))))), 4)"
    "fetch 0x7fd2 \<equiv> (Binary (IS_8088 Mov) (Reg (General ThirtyTwo rdx)) (Storage (Memory ThirtyTwo (A_SizeDirective 32 (A_Minus (A_FromReg (General SixtyFour rsp)) (A_WordConstant 36))))), 4)"
    "fetch 0x7fd6 \<equiv> (Binary (IS_8088 Xor) (Reg (General ThirtyTwo r12)) (Storage (Memory ThirtyTwo (A_SizeDirective 32 (A_Plus (A_FromReg (General SixtyFour r10)) (A_Mult 4 (A_FromReg (General SixtyFour r15))))))), 4)"
    "fetch 0x7fda \<equiv> (Binary (IS_8088 Mov) (Reg (General ThirtyTwo r15)) (Storage (Memory ThirtyTwo (A_SizeDirective 32 (A_Minus (A_FromReg (General SixtyFour rsp)) (A_WordConstant 40))))), 5)"
    "fetch 0x7fdf \<equiv> (Binary (IS_8088 Xor) (Reg (General ThirtyTwo r12)) (Storage (Memory ThirtyTwo (A_SizeDirective 32 (A_Plus (A_FromReg (General SixtyFour rdi)) (A_WordConstant 8))))), 4)"
    "fetch 0x7fe3 \<equiv> (Binary (IS_8088 Xor) (Reg (General ThirtyTwo r12)) (Storage (Memory ThirtyTwo (A_SizeDirective 32 (A_Plus (A_FromReg (General SixtyFour r9)) (A_Mult 4 (A_FromReg (General SixtyFour r15))))))), 4)"
    "fetch 0x7fe7 \<equiv> (Binary (IS_8088 Xor) (Reg (General ThirtyTwo r12)) (Storage (Memory ThirtyTwo (A_SizeDirective 32 (A_Plus (A_FromReg (General SixtyFour r8)) (A_Mult 4 (A_FromReg (General SixtyFour rdx))))))), 4)"
    "fetch 0x7feb \<equiv> (Binary (IS_8088 Mov) (Reg (General ThirtyTwo rdx)) (Storage (Memory ThirtyTwo (A_SizeDirective 32 (A_Minus (A_FromReg (General SixtyFour rsp)) (A_WordConstant 8))))), 4)"
    "fetch 0x7fef \<equiv> (Binary (IS_8088 Mov) (Reg (General ThirtyTwo rsi)) (Storage (Memory ThirtyTwo (A_SizeDirective 32 (A_Plus (A_FromReg (General SixtyFour r11)) (A_Mult 4 (A_FromReg (General SixtyFour rdx))))))), 4)"
    "fetch 0x7ff3 \<equiv> (Binary (IS_8088 Mov) (Reg (General ThirtyTwo rdx)) (Storage (Memory ThirtyTwo (A_SizeDirective 32 (A_Minus (A_FromReg (General SixtyFour rsp)) (A_WordConstant 64))))), 4)"
    "fetch 0x7ff7 \<equiv> (Binary (IS_8088 Xor) (Reg (General ThirtyTwo rsi)) (Storage (Memory ThirtyTwo (A_SizeDirective 32 (A_Plus (A_FromReg (General SixtyFour r10)) (A_Mult 4 (A_FromReg (General SixtyFour rcx))))))), 4)"
    "fetch 0x7ffb \<equiv> (Binary (IS_8088 Xor) (Reg (General ThirtyTwo rsi)) (Storage (Memory ThirtyTwo (A_SizeDirective 32 (A_Plus (A_FromReg (General SixtyFour rdi)) (A_WordConstant 12))))), 3)"
    "fetch 0x7ffe \<equiv> (Binary (IS_8088 Xor) (Reg (General ThirtyTwo rsi)) (Storage (Memory ThirtyTwo (A_SizeDirective 32 (A_Plus (A_FromReg (General SixtyFour r9)) (A_Mult 4 (A_FromReg (General SixtyFour rdx))))))), 4)"
    "fetch 0x8002 \<equiv> (Binary (IS_8088 Xor) (Reg (General ThirtyTwo rsi)) (Storage (Memory ThirtyTwo (A_SizeDirective 32 (A_Plus (A_FromReg (General SixtyFour r8)) (A_Mult 4 (A_FromReg (General SixtyFour rbx))))))), 4)"
    "fetch 0x8006 \<equiv> (Binary (IS_8088 Mov) (Reg (General ThirtyTwo rdx)) (Storage (Reg (General ThirtyTwo rax))), 2)"
    "fetch 0x8008 \<equiv> (Binary (IS_80386 Movzx) (Reg (General ThirtyTwo rcx)) (Storage (Reg (General Eight rsi))), 4)"
    "fetch 0x800c \<equiv> (Binary (IS_8088 Mov) (Reg (General ThirtyTwo rbx)) (Storage (Reg (General ThirtyTwo r12))), 3)"
    "fetch 0x800f \<equiv> (Binary (IS_80386 Movzx) (Reg (General ThirtyTwo r13)) (Storage (Reg (General Eight rax))), 4)"
    "fetch 0x8013 \<equiv> (Binary (IS_8088 Shr) (Reg (General ThirtyTwo rdx)) (Immediate SixtyFour (ImmVal 24)), 3)"
    "fetch 0x8016 \<equiv> (Binary (IS_8088 Add) (Reg (General SixtyFour rdi)) (Immediate SixtyFour (ImmVal 32)), 4)"
    "fetch 0x801a \<equiv> (Binary (IS_8088 Mov) (Reg (General ThirtyTwo rdx)) (Storage (Memory ThirtyTwo (A_SizeDirective 32 (A_Plus (A_FromReg (General SixtyFour r11)) (A_Mult 4 (A_FromReg (General SixtyFour rdx))))))), 4)"
    "fetch 0x801e \<equiv> (Binary (IS_8088 Xor) (Reg (General ThirtyTwo rdx)) (Storage (Memory ThirtyTwo (A_SizeDirective 32 (A_Plus (A_FromReg (General SixtyFour r10)) (A_Mult 4 (A_FromReg (General SixtyFour rcx))))))), 4)"
    "fetch 0x8022 \<equiv> (Binary (IS_8088 Mov) (Reg (General ThirtyTwo rcx)) (Storage (Reg (General ThirtyTwo rbp))), 2)"
    "fetch 0x8024 \<equiv> (Binary (IS_8088 Shr) (Reg (General ThirtyTwo rcx)) (Immediate SixtyFour (ImmVal 16)), 3)"
    "fetch 0x8027 \<equiv> (Binary (IS_8088 Xor) (Reg (General ThirtyTwo rdx)) (Storage (Memory ThirtyTwo (A_SizeDirective 32 (A_Minus (A_FromReg (General SixtyFour rdi)) (A_WordConstant 16))))), 3)"
    "fetch 0x802a \<equiv> (Binary (IS_80386 Movzx) (Reg (General ThirtyTwo rcx)) (Storage (Reg (General Eight rcx))), 3)"
    "fetch 0x802d \<equiv> (Binary (IS_8088 Xor) (Reg (General ThirtyTwo rdx)) (Storage (Memory ThirtyTwo (A_SizeDirective 32 (A_Plus (A_FromReg (General SixtyFour r9)) (A_Mult 4 (A_FromReg (General SixtyFour rcx))))))), 4)"
    "fetch 0x8031 \<equiv> (Binary (IS_80386 Movzx) (Reg (General ThirtyTwo rcx)) (Storage (Reg (General EightHigh rbx))), 3)"
    "fetch 0x8034 \<equiv> (Binary (IS_8088 Xor) (Reg (General ThirtyTwo rdx)) (Storage (Memory ThirtyTwo (A_SizeDirective 32 (A_Plus (A_FromReg (General SixtyFour r8)) (A_Mult 4 (A_FromReg (General SixtyFour rcx))))))), 4)"
    "fetch 0x8038 \<equiv> (Binary (IS_8088 Mov) (Reg (General ThirtyTwo rcx)) (Storage (Reg (General ThirtyTwo rbp))), 2)"
    "fetch 0x803a \<equiv> (Binary (IS_8088 Shr) (Reg (General ThirtyTwo rcx)) (Immediate SixtyFour (ImmVal 24)), 3)"
    "fetch 0x803d \<equiv> (Binary (IS_8088 Mov) (Reg (General ThirtyTwo r14)) (Storage (Reg (General ThirtyTwo rdx))), 3)"
    "fetch 0x8040 \<equiv> (Binary (IS_80386 Movzx) (Reg (General ThirtyTwo rdx)) (Storage (Reg (General EightHigh rax))), 3)"
    "fetch 0x8043 \<equiv> (Binary (IS_8088 Shr) (Reg (General ThirtyTwo rax)) (Immediate SixtyFour (ImmVal 16)), 3)"
    "fetch 0x8046 \<equiv> (Binary (IS_8088 Mov) (Reg (General ThirtyTwo rbx)) (Storage (Memory ThirtyTwo (A_SizeDirective 32 (A_Plus (A_FromReg (General SixtyFour r11)) (A_Mult 4 (A_FromReg (General SixtyFour rcx))))))), 4)"
    "fetch 0x804a \<equiv> (Binary (IS_8088 Mov) (Reg (General ThirtyTwo rcx)) (Storage (Reg (General ThirtyTwo r12))), 3)"
    "fetch 0x804d \<equiv> (Binary (IS_8088 Xor) (Reg (General ThirtyTwo rbx)) (Storage (Memory ThirtyTwo (A_SizeDirective 32 (A_Plus (A_FromReg (General SixtyFour r10)) (A_Mult 4 (A_FromReg (General SixtyFour r13))))))), 4)"
    "fetch 0x8051 \<equiv> (Binary (IS_80386 Movzx) (Reg (General ThirtyTwo r13)) (Storage (Reg (General Eight rbp))), 4)"
    "fetch 0x8055 \<equiv> (Binary (IS_8088 Shr) (Reg (General ThirtyTwo rcx)) (Immediate SixtyFour (ImmVal 16)), 3)"
    "fetch 0x8058 \<equiv> (Binary (IS_8088 Xor) (Reg (General ThirtyTwo rbx)) (Storage (Memory ThirtyTwo (A_SizeDirective 32 (A_Minus (A_FromReg (General SixtyFour rdi)) (A_WordConstant 12))))), 3)"
    "fetch 0x805b \<equiv> (Binary (IS_8088 Mov) (Memory ThirtyTwo (A_SizeDirective 32 (A_Minus (A_FromReg (General SixtyFour rsp)) (A_WordConstant 64)))) (Storage (Reg (General ThirtyTwo r14))), 5)"
    "fetch 0x8060 \<equiv> (Binary (IS_80386 Movzx) (Reg (General ThirtyTwo rax)) (Storage (Reg (General Eight rax))), 3)"
    "fetch 0x8063 \<equiv> (Binary (IS_80386 Movzx) (Reg (General ThirtyTwo rcx)) (Storage (Reg (General Eight rcx))), 3)"
    "fetch 0x8066 \<equiv> (Binary (IS_8088 Xor) (Reg (General ThirtyTwo rbx)) (Storage (Memory ThirtyTwo (A_SizeDirective 32 (A_Plus (A_FromReg (General SixtyFour r9)) (A_Mult 4 (A_FromReg (General SixtyFour rcx))))))), 4)"
    "fetch 0x806a \<equiv> (Binary (IS_8088 Mov) (Reg (General ThirtyTwo rcx)) (Storage (Reg (General ThirtyTwo rsi))), 2)"
    "fetch 0x806c \<equiv> (Binary (IS_80386 Movzx) (Reg (General ThirtyTwo rcx)) (Storage (Reg (General EightHigh rcx))), 3)"
    "fetch 0x806f \<equiv> (Binary (IS_8088 Xor) (Reg (General ThirtyTwo rbx)) (Storage (Memory ThirtyTwo (A_SizeDirective 32 (A_Plus (A_FromReg (General SixtyFour r8)) (A_Mult 4 (A_FromReg (General SixtyFour rcx))))))), 4)"
    "fetch 0x8073 \<equiv> (Binary (IS_8088 Mov) (Reg (General ThirtyTwo rcx)) (Storage (Reg (General ThirtyTwo r12))), 3)"
    "fetch 0x8076 \<equiv> (Binary (IS_80386 Movzx) (Reg (General ThirtyTwo r12)) (Storage (Reg (General Eight r12))), 4)"
    "fetch 0x807a \<equiv> (Binary (IS_8088 Shr) (Reg (General ThirtyTwo rcx)) (Immediate SixtyFour (ImmVal 24)), 3)"
    "fetch 0x807d \<equiv> (Binary (IS_8088 Mov) (Reg (General ThirtyTwo rcx)) (Storage (Memory ThirtyTwo (A_SizeDirective 32 (A_Plus (A_FromReg (General SixtyFour r11)) (A_Mult 4 (A_FromReg (General SixtyFour rcx))))))), 4)"
    "fetch 0x8081 \<equiv> (Binary (IS_8088 Xor) (Reg (General ThirtyTwo rcx)) (Storage (Memory ThirtyTwo (A_SizeDirective 32 (A_Plus (A_FromReg (General SixtyFour r10)) (A_Mult 4 (A_FromReg (General SixtyFour r13))))))), 4)"
    "fetch 0x8085 \<equiv> (Binary (IS_8088 Mov) (Reg (General ThirtyTwo r13)) (Storage (Reg (General ThirtyTwo rsi))), 3)"
    "fetch 0x8088 \<equiv> (Binary (IS_8088 Shr) (Reg (General ThirtyTwo rsi)) (Immediate SixtyFour (ImmVal 24)), 3)"
    "fetch 0x808b \<equiv> (Binary (IS_8088 Shr) (Reg (General ThirtyTwo r13)) (Immediate SixtyFour (ImmVal 16)), 4)"
    "fetch 0x808f \<equiv> (Binary (IS_8088 Xor) (Reg (General ThirtyTwo rcx)) (Storage (Memory ThirtyTwo (A_SizeDirective 32 (A_Minus (A_FromReg (General SixtyFour rdi)) (A_WordConstant 8))))), 3)"
    "fetch 0x8092 \<equiv> (Binary (IS_8088 Mov) (Reg (General ThirtyTwo rsi)) (Storage (Memory ThirtyTwo (A_SizeDirective 32 (A_Plus (A_FromReg (General SixtyFour r11)) (A_Mult 4 (A_FromReg (General SixtyFour rsi))))))), 4)"
    "fetch 0x8096 \<equiv> (Binary (IS_80386 Movzx) (Reg (General ThirtyTwo r13)) (Storage (Reg (General Eight r13))), 4)"
    "fetch 0x809a \<equiv> (Binary (IS_8088 Xor) (Reg (General ThirtyTwo rsi)) (Storage (Memory ThirtyTwo (A_SizeDirective 32 (A_Plus (A_FromReg (General SixtyFour r10)) (A_Mult 4 (A_FromReg (General SixtyFour r12))))))), 4)"
    "fetch 0x809e \<equiv> (Binary (IS_8088 Xor) (Reg (General ThirtyTwo rsi)) (Storage (Memory ThirtyTwo (A_SizeDirective 32 (A_Minus (A_FromReg (General SixtyFour rdi)) (A_WordConstant 4))))), 3)"
    "fetch 0x80a1 \<equiv> (Binary (IS_8088 Mov) (Reg (General ThirtyTwo r12)) (Storage (Reg (General ThirtyTwo r14))), 3)"
    "fetch 0x80a4 \<equiv> (Binary (IS_8088 Xor) (Reg (General ThirtyTwo rcx)) (Storage (Memory ThirtyTwo (A_SizeDirective 32 (A_Plus (A_FromReg (General SixtyFour r9)) (A_Mult 4 (A_FromReg (General SixtyFour r13))))))), 4)"
    "fetch 0x80a8 \<equiv> (Binary (IS_8088 Xor) (Reg (General ThirtyTwo rcx)) (Storage (Memory ThirtyTwo (A_SizeDirective 32 (A_Plus (A_FromReg (General SixtyFour r8)) (A_Mult 4 (A_FromReg (General SixtyFour rdx))))))), 4)"
    "fetch 0x80ac \<equiv> (Binary (IS_8088 Mov) (Reg (General ThirtyTwo rdx)) (Storage (Reg (General ThirtyTwo rbp))), 2)"
    "fetch 0x80ae \<equiv> (Binary (IS_8088 Mov) (Reg (General ThirtyTwo rbp)) (Storage (Reg (General ThirtyTwo rbx))), 2)"
    "fetch 0x80b0 \<equiv> (Binary (IS_8088 Mov) (Reg (General ThirtyTwo r15)) (Storage (Reg (General ThirtyTwo rcx))), 3)"
    "fetch 0x80b3 \<equiv> (Binary (IS_8088 Xor) (Reg (General ThirtyTwo rsi)) (Storage (Memory ThirtyTwo (A_SizeDirective 32 (A_Plus (A_FromReg (General SixtyFour r9)) (A_Mult 4 (A_FromReg (General SixtyFour rax))))))), 4)"
    "fetch 0x80b7 \<equiv> (Binary (IS_8088 Mov) (Reg (General ThirtyTwo r14)) (Storage (Memory ThirtyTwo (A_SizeDirective 32 (A_FromReg (General SixtyFour rdi))))), 3)"
    "fetch 0x80ba \<equiv> (Binary (IS_8088 Shr) (Reg (General ThirtyTwo rbp)) (Immediate SixtyFour (ImmVal 16)), 3)"
    "fetch 0x80bd \<equiv> (Binary (IS_8088 Shr) (Reg (General ThirtyTwo r15)) (Immediate SixtyFour (ImmVal 16)), 4)"
    "fetch 0x80c1 \<equiv> (Binary (IS_8088 Mov) (Reg (General ThirtyTwo rax)) (Storage (Reg (General ThirtyTwo rsi))), 2)"
    "fetch 0x80c3 \<equiv> (Binary (IS_80386 Movzx) (Reg (General ThirtyTwo rsi)) (Storage (Reg (General EightHigh rdx))), 3)"
    "fetch 0x80c6 \<equiv> (Binary (IS_8088 Mov) (Reg (General ThirtyTwo rdx)) (Storage (Reg (General ThirtyTwo rbx))), 2)"
    "fetch 0x80c8 \<equiv> (Binary (IS_80386 Movzx) (Reg (General ThirtyTwo r15)) (Storage (Reg (General Eight r15))), 4)"
    "fetch 0x80cc \<equiv> (Binary (IS_8088 Xor) (Reg (General ThirtyTwo rax)) (Storage (Memory ThirtyTwo (A_SizeDirective 32 (A_Plus (A_FromReg (General SixtyFour r8)) (A_Mult 4 (A_FromReg (General SixtyFour rsi))))))), 4)"
    "fetch 0x80d0 \<equiv> (Binary (IS_8088 Shr) (Reg (General ThirtyTwo rdx)) (Immediate SixtyFour (ImmVal 24)), 3)"
    "fetch 0x80d3 \<equiv> (Binary (IS_80386 Movzx) (Reg (General ThirtyTwo rsi)) (Storage (Reg (General EightHigh rcx))), 3)"
    "fetch 0x80d6 \<equiv> (Binary (IS_8088 Mov) (Memory ThirtyTwo (A_SizeDirective 32 (A_Minus (A_FromReg (General SixtyFour rsp)) (A_WordConstant 60)))) (Storage (Reg (General ThirtyTwo rdx))), 4)"
    "fetch 0x80da \<equiv> (Binary (IS_80386 Movzx) (Reg (General ThirtyTwo rdx)) (Storage (Reg (General EightHigh rax))), 3)"
    "fetch 0x80dd \<equiv> (Binary (IS_80386 Movzx) (Reg (General ThirtyTwo r13)) (Storage (Reg (General Eight rax))), 4)"
    "fetch 0x80e1 \<equiv> (Binary (IS_8088 Shr) (Reg (General ThirtyTwo r12)) (Immediate SixtyFour (ImmVal 24)), 4)"
    "fetch 0x80e5 \<equiv> (Binary (IS_8088 Mov) (Memory ThirtyTwo (A_SizeDirective 32 (A_Minus (A_FromReg (General SixtyFour rsp)) (A_WordConstant 56)))) (Storage (Reg (General ThirtyTwo r15))), 5)"
    "fetch 0x80ea \<equiv> (Binary (IS_80386 Movzx) (Reg (General ThirtyTwo r15)) (Storage (Memory Eight (A_SizeDirective 8 (A_Minus (A_FromReg (General SixtyFour rsp)) (A_WordConstant 64))))), 6)"
    "fetch 0x80f0 \<equiv> (Binary (IS_80386 Movzx) (Reg (General ThirtyTwo rbp)) (Storage (Reg (General Eight rbp))), 4)"
    "fetch 0x80f4 \<equiv> (Binary (IS_8088 Mov) (Memory ThirtyTwo (A_SizeDirective 32 (A_Minus (A_FromReg (General SixtyFour rsp)) (A_WordConstant 52)))) (Storage (Reg (General ThirtyTwo rdx))), 4)"
    "fetch 0x80f8 \<equiv> (Binary (IS_8088 Mov) (Memory ThirtyTwo (A_SizeDirective 32 (A_Minus (A_FromReg (General SixtyFour rsp)) (A_WordConstant 48)))) (Storage (Reg (General ThirtyTwo r15))), 5)"
    "fetch 0x80fd \<equiv> (Binary (IS_8088 Mov) (Reg (General ThirtyTwo r15)) (Storage (Reg (General ThirtyTwo rcx))), 3)"
    "fetch 0x8100 \<equiv> (Binary (IS_80386 Movzx) (Reg (General ThirtyTwo rcx)) (Storage (Reg (General Eight rcx))), 3)"
    "fetch 0x8103 \<equiv> (Binary (IS_8088 Shr) (Reg (General ThirtyTwo r15)) (Immediate SixtyFour (ImmVal 24)), 4)"
    "fetch 0x8107 \<equiv> (Binary (IS_8088 Mov) (Memory ThirtyTwo (A_SizeDirective 32 (A_Minus (A_FromReg (General SixtyFour rsp)) (A_WordConstant 44)))) (Storage (Reg (General ThirtyTwo r15))), 5)"
    "fetch 0x810c \<equiv> (Binary (IS_8088 Mov) (Reg (General ThirtyTwo r15)) (Storage (Reg (General ThirtyTwo rax))), 3)"
    "fetch 0x810f \<equiv> (Binary (IS_8088 Shr) (Reg (General ThirtyTwo rax)) (Immediate SixtyFour (ImmVal 24)), 3)"
    "fetch 0x8112 \<equiv> (Binary (IS_8088 Shr) (Reg (General ThirtyTwo r15)) (Immediate SixtyFour (ImmVal 16)), 4)"
    "fetch 0x8116 \<equiv> (Binary (IS_8088 Mov) (Memory ThirtyTwo (A_SizeDirective 32 (A_Minus (A_FromReg (General SixtyFour rsp)) (A_WordConstant 8)))) (Storage (Reg (General ThirtyTwo rax))), 4)"
    "fetch 0x811a \<equiv> (Binary (IS_80386 Movzx) (Reg (General ThirtyTwo rdx)) (Storage (Reg (General Eight r15))), 4)"
    "fetch 0x811e \<equiv> (Binary (IS_80386 Movzx) (Reg (General ThirtyTwo r15)) (Storage (Reg (General Eight rbx))), 4)"
    "fetch 0x8122 \<equiv> (Binary (IS_80386 Movzx) (Reg (General ThirtyTwo rbx)) (Storage (Reg (General EightHigh rbx))), 3)"
    "fetch 0x8125 \<equiv> (Binary (IS_8088 Mov) (Memory ThirtyTwo (A_SizeDirective 32 (A_Minus (A_FromReg (General SixtyFour rsp)) (A_WordConstant 40)))) (Storage (Reg (General ThirtyTwo rdx))), 4)"
    "fetch 0x8129 \<equiv> (Binary (IS_8088 Mov) (Reg (General ThirtyTwo rdx)) (Storage (Memory ThirtyTwo (A_SizeDirective 32 (A_Minus (A_FromReg (General SixtyFour rsp)) (A_WordConstant 64))))), 4)"
    "fetch 0x812d \<equiv> (Binary (IS_80386 Movzx) (Reg (General ThirtyTwo rdx)) (Storage (Reg (General EightHigh rdx))), 3)"
    "fetch 0x8130 \<equiv> (Binary (IS_8088 Mov) (Memory ThirtyTwo (A_SizeDirective 32 (A_Minus (A_FromReg (General SixtyFour rsp)) (A_WordConstant 36)))) (Storage (Reg (General ThirtyTwo rdx))), 4)"
    "fetch 0x8134 \<equiv> (Binary (IS_8088 Mov) (Reg (General ThirtyTwo rdx)) (Storage (Memory ThirtyTwo (A_SizeDirective 32 (A_Minus (A_FromReg (General SixtyFour rsp)) (A_WordConstant 64))))), 4)"
    "fetch 0x8138 \<equiv> (Binary (IS_8088 Shr) (Reg (General ThirtyTwo rdx)) (Immediate SixtyFour (ImmVal 16)), 3)"
    "fetch 0x813b \<equiv> (Binary (IS_80386 Movzx) (Reg (General ThirtyTwo rax)) (Storage (Reg (General Eight rdx))), 3)"
    "fetch 0x813e \<equiv> (Binary (IS_8088 Mov) (Memory ThirtyTwo (A_SizeDirective 32 (A_Minus (A_FromReg (General SixtyFour rsp)) (A_WordConstant 64)))) (Storage (Reg (General ThirtyTwo rax))), 4)"
    "fetch 0x8142 \<equiv> (Binary (IS_8088 Cmp) (Reg (General SixtyFour rdi)) (Storage (Memory SixtyFour (A_SizeDirective 64 (A_Minus (A_FromReg (General SixtyFour rsp)) (A_WordConstant 32))))), 5)"
    "fetch 0x8147 \<equiv> (Unary (IS_8088 Jne) (Immediate SixtyFour (ImmVal 32656)), 6)"
    "fetch 0x814d \<equiv> (Binary (IS_8088 Mov) (Reg (General ThirtyTwo rdx)) (Storage (Memory ThirtyTwo (A_SizeDirective 32 (A_Minus (A_FromReg (General SixtyFour rsp)) (A_WordConstant 4))))), 4)"
    "fetch 0x8151 \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour r8)) (Storage (Memory SixtyFour (A_SizeDirective 64 (A_Minus (A_FromReg (General SixtyFour rsp)) (A_WordConstant 24))))), 5)"
    "fetch 0x8156 \<equiv> (Binary (IS_8088 Mov) (Reg (General ThirtyTwo rax)) (Storage (Reg (General ThirtyTwo r14))), 3)"
    "fetch 0x8159 \<equiv> (Binary (IS_8088 Mov) (Reg (General ThirtyTwo r14)) (Storage (Reg (General ThirtyTwo rsi))), 3)"
    "fetch 0x815c \<equiv> (Binary (IS_8088 Lea) (Reg (General SixtyFour rdi)) (Storage (Memory SixtyFour (A_Plus (A_FromReg (General SixtyFour rip)) (A_WordConstant 94781)))), 7)"
    "fetch 0x8163 \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour r9)) (Storage (Memory SixtyFour (A_SizeDirective 64 (A_Minus (A_FromReg (General SixtyFour rsp)) (A_WordConstant 16))))), 5)"
    "fetch 0x8168 \<equiv> (Binary (IS_8088 Mov) (Reg (General ThirtyTwo rbx)) (Storage (Reg (General ThirtyTwo rbx))), 2)"
    "fetch 0x816a \<equiv> (Binary (IS_8088 Add) (Reg (General SixtyFour rdx)) (Immediate SixtyFour (ImmVal 1)), 4)"
    "fetch 0x816e \<equiv> (Binary (IS_80386 Movzx) (Reg (General ThirtyTwo rsi)) (Storage (Memory Eight (A_SizeDirective 8 (A_Plus (A_FromReg (General SixtyFour rdi)) (A_Mult 4 (A_FromReg (General SixtyFour r13))))))), 5)"
    "fetch 0x8173 \<equiv> (Binary (IS_8088 Shl) (Reg (General SixtyFour rdx)) (Immediate SixtyFour (ImmVal 5)), 4)"
    "fetch 0x8177 \<equiv> (Binary (IS_8088 Add) (Reg (General SixtyFour r8)) (Storage (Reg (General SixtyFour rdx))), 3)"
    "fetch 0x817a \<equiv> (Binary (IS_8088 Mov) (Reg (General ThirtyTwo rdx)) (Storage (Memory ThirtyTwo (A_SizeDirective 32 (A_Plus (A_FromReg (General SixtyFour rdi)) (A_Mult 4 (A_FromReg (General SixtyFour r14))))))), 4)"
    "fetch 0x817e \<equiv> (Binary (IS_8088 And) (Reg (General ThirtyTwo rdx)) (Immediate SixtyFour (ImmVal 65280)), 6)"
    "fetch 0x8184 \<equiv> (Binary (IS_8088 Or) (Reg (General ThirtyTwo rdx)) (Storage (Reg (General ThirtyTwo rsi))), 2)"
    "fetch 0x8186 \<equiv> (Binary (IS_8088 Mov) (Reg (General ThirtyTwo rsi)) (Storage (Reg (General ThirtyTwo rdx))), 2)"
    "fetch 0x8188 \<equiv> (Binary (IS_8088 Mov) (Reg (General ThirtyTwo rdx)) (Storage (Memory ThirtyTwo (A_SizeDirective 32 (A_Plus (A_FromReg (General SixtyFour rdi)) (A_Mult 4 (A_FromReg (General SixtyFour rbp))))))), 3)"
    "fetch 0x818b \<equiv> (Binary (IS_8088 Xor) (Reg (General ThirtyTwo rsi)) (Storage (Reg (General ThirtyTwo rax))), 2)"
    "fetch 0x818d \<equiv> (Binary (IS_8088 Mov) (Reg (General ThirtyTwo rax)) (Storage (Memory ThirtyTwo (A_SizeDirective 32 (A_Plus (A_FromReg (General SixtyFour rdi)) (A_Mult 4 (A_FromReg (General SixtyFour r12))))))), 4)"
    "fetch 0x8191 \<equiv> (Binary (IS_8088 And) (Reg (General ThirtyTwo rdx)) (Immediate SixtyFour (ImmVal 16711680)), 6)"
    "fetch 0x8197 \<equiv> (Binary (IS_8088 And) (Reg (General ThirtyTwo rax)) (Immediate SixtyFour (ImmVal 4278190080)), 5)"
    "fetch 0x819c \<equiv> (Binary (IS_8088 Or) (Reg (General ThirtyTwo rax)) (Storage (Reg (General ThirtyTwo rdx))), 2)"
    "fetch 0x819e \<equiv> (Binary (IS_8088 Xor) (Reg (General ThirtyTwo rax)) (Storage (Reg (General ThirtyTwo rsi))), 2)"
    "fetch 0x81a0 \<equiv> (Unary (IS_80486 Bswap) (Storage (Reg (General ThirtyTwo rax))), 2)"
    "fetch 0x81a2 \<equiv> (Binary (IS_8088 Mov) (Memory ThirtyTwo (A_SizeDirective 32 (A_FromReg (General SixtyFour r9)))) (Storage (Reg (General ThirtyTwo rax))), 3)"
    "fetch 0x81a5 \<equiv> (Binary (IS_8088 Mov) (Reg (General ThirtyTwo rax)) (Storage (Memory ThirtyTwo (A_SizeDirective 32 (A_Minus (A_FromReg (General SixtyFour rsp)) (A_WordConstant 52))))), 4)"
    "fetch 0x81a9 \<equiv> (Binary (IS_8088 Mov) (Reg (General ThirtyTwo rdx)) (Storage (Memory ThirtyTwo (A_SizeDirective 32 (A_Plus (A_FromReg (General SixtyFour rdi)) (A_Mult 4 (A_FromReg (General SixtyFour rax))))))), 3)"
    "fetch 0x81ac \<equiv> (Binary (IS_8088 Mov) (Reg (General ThirtyTwo rax)) (Storage (Memory ThirtyTwo (A_SizeDirective 32 (A_Minus (A_FromReg (General SixtyFour rsp)) (A_WordConstant 48))))), 4)"
    "fetch 0x81b0 \<equiv> (Binary (IS_80386 Movzx) (Reg (General ThirtyTwo rax)) (Storage (Memory Eight (A_SizeDirective 8 (A_Plus (A_FromReg (General SixtyFour rdi)) (A_Mult 4 (A_FromReg (General SixtyFour rax))))))), 4)"
    "fetch 0x81b4 \<equiv> (Binary (IS_8088 And) (Reg (General ThirtyTwo rdx)) (Immediate SixtyFour (ImmVal 65280)), 6)"
    "fetch 0x81ba \<equiv> (Binary (IS_8088 Or) (Reg (General ThirtyTwo rdx)) (Storage (Reg (General ThirtyTwo rax))), 2)"
    "fetch 0x81bc \<equiv> (Binary (IS_8088 Mov) (Reg (General ThirtyTwo rax)) (Storage (Memory ThirtyTwo (A_SizeDirective 32 (A_Minus (A_FromReg (General SixtyFour rsp)) (A_WordConstant 60))))), 4)"
    "fetch 0x81c0 \<equiv> (Binary (IS_8088 Xor) (Reg (General ThirtyTwo rdx)) (Storage (Memory ThirtyTwo (A_SizeDirective 32 (A_Plus (A_FromReg (General SixtyFour r8)) (A_WordConstant 4))))), 4)"
    "fetch 0x81c4 \<equiv> (Binary (IS_8088 Mov) (Reg (General ThirtyTwo rax)) (Storage (Memory ThirtyTwo (A_SizeDirective 32 (A_Plus (A_FromReg (General SixtyFour rdi)) (A_Mult 4 (A_FromReg (General SixtyFour rax))))))), 3)"
    "fetch 0x81c7 \<equiv> (Binary (IS_8088 And) (Reg (General ThirtyTwo rax)) (Immediate SixtyFour (ImmVal 4278190080)), 5)"
    "fetch 0x81cc \<equiv> (Binary (IS_8088 Mov) (Reg (General ThirtyTwo rsi)) (Storage (Reg (General ThirtyTwo rax))), 2)"
    "fetch 0x81ce \<equiv> (Binary (IS_8088 Mov) (Reg (General ThirtyTwo rax)) (Storage (Memory ThirtyTwo (A_SizeDirective 32 (A_Minus (A_FromReg (General SixtyFour rsp)) (A_WordConstant 56))))), 4)"
    "fetch 0x81d2 \<equiv> (Binary (IS_8088 Mov) (Reg (General ThirtyTwo rax)) (Storage (Memory ThirtyTwo (A_SizeDirective 32 (A_Plus (A_FromReg (General SixtyFour rdi)) (A_Mult 4 (A_FromReg (General SixtyFour rax))))))), 3)"
    "fetch 0x81d5 \<equiv> (Binary (IS_8088 And) (Reg (General ThirtyTwo rax)) (Immediate SixtyFour (ImmVal 16711680)), 5)"
    "fetch 0x81da \<equiv> (Binary (IS_8088 Or) (Reg (General ThirtyTwo rax)) (Storage (Reg (General ThirtyTwo rsi))), 2)"
    "fetch 0x81dc \<equiv> (Binary (IS_8088 Xor) (Reg (General ThirtyTwo rdx)) (Storage (Reg (General ThirtyTwo rax))), 2)"
    "fetch 0x81de \<equiv> (Binary (IS_8088 Mov) (Reg (General ThirtyTwo rax)) (Storage (Memory ThirtyTwo (A_SizeDirective 32 (A_Minus (A_FromReg (General SixtyFour rsp)) (A_WordConstant 36))))), 4)"
    "fetch 0x81e2 \<equiv> (Unary (IS_80486 Bswap) (Storage (Reg (General ThirtyTwo rdx))), 2)"
    "fetch 0x81e4 \<equiv> (Binary (IS_8088 Mov) (Memory ThirtyTwo (A_SizeDirective 32 (A_Plus (A_FromReg (General SixtyFour r9)) (A_WordConstant 4)))) (Storage (Reg (General ThirtyTwo rdx))), 4)"
    "fetch 0x81e8 \<equiv> (Binary (IS_80386 Movzx) (Reg (General ThirtyTwo rdx)) (Storage (Memory Eight (A_SizeDirective 8 (A_Plus (A_FromReg (General SixtyFour rdi)) (A_Mult 4 (A_FromReg (General SixtyFour r15))))))), 5)"
    "fetch 0x81ed \<equiv> (Binary (IS_8088 Mov) (Reg (General ThirtyTwo rax)) (Storage (Memory ThirtyTwo (A_SizeDirective 32 (A_Plus (A_FromReg (General SixtyFour rdi)) (A_Mult 4 (A_FromReg (General SixtyFour rax))))))), 3)"
    "fetch 0x81f0 \<equiv> (Binary (IS_8088 Mov) (Reg (General ThirtyTwo r15)) (Storage (Memory ThirtyTwo (A_SizeDirective 32 (A_Minus (A_FromReg (General SixtyFour rsp)) (A_WordConstant 40))))), 5)"
    "fetch 0x81f5 \<equiv> (Binary (IS_8088 And) (Reg (General ThirtyTwo rax)) (Immediate SixtyFour (ImmVal 65280)), 5)"
    "fetch 0x81fa \<equiv> (Binary (IS_8088 Mov) (Reg (General ThirtyTwo rsi)) (Storage (Memory ThirtyTwo (A_SizeDirective 32 (A_Plus (A_FromReg (General SixtyFour rdi)) (A_Mult 4 (A_FromReg (General SixtyFour r15))))))), 4)"
    "fetch 0x81fe \<equiv> (Binary (IS_8088 Or) (Reg (General ThirtyTwo rax)) (Storage (Reg (General ThirtyTwo rdx))), 2)"
    "fetch 0x8200 \<equiv> (Binary (IS_8088 Xor) (Reg (General ThirtyTwo rax)) (Storage (Memory ThirtyTwo (A_SizeDirective 32 (A_Plus (A_FromReg (General SixtyFour r8)) (A_WordConstant 8))))), 4)"
    "fetch 0x8204 \<equiv> (Binary (IS_8088 Mov) (Reg (General ThirtyTwo rdx)) (Storage (Reg (General ThirtyTwo rax))), 2)"
    "fetch 0x8206 \<equiv> (Binary (IS_8088 Mov) (Reg (General ThirtyTwo rax)) (Storage (Memory ThirtyTwo (A_SizeDirective 32 (A_Minus (A_FromReg (General SixtyFour rsp)) (A_WordConstant 44))))), 4)"
    "fetch 0x820a \<equiv> (Binary (IS_8088 And) (Reg (General ThirtyTwo rsi)) (Immediate SixtyFour (ImmVal 16711680)), 6)"
    "fetch 0x8210 \<equiv> (Binary (IS_8088 Mov) (Reg (General ThirtyTwo rax)) (Storage (Memory ThirtyTwo (A_SizeDirective 32 (A_Plus (A_FromReg (General SixtyFour rdi)) (A_Mult 4 (A_FromReg (General SixtyFour rax))))))), 3)"
    "fetch 0x8213 \<equiv> (Binary (IS_8088 And) (Reg (General ThirtyTwo rax)) (Immediate SixtyFour (ImmVal 4278190080)), 5)"
    "fetch 0x8218 \<equiv> (Binary (IS_8088 Or) (Reg (General ThirtyTwo rax)) (Storage (Reg (General ThirtyTwo rsi))), 2)"
    "fetch 0x821a \<equiv> (Binary (IS_8088 Mov) (Reg (General ThirtyTwo rsi)) (Storage (Memory ThirtyTwo (A_SizeDirective 32 (A_Minus (A_FromReg (General SixtyFour rsp)) (A_WordConstant 8))))), 4)"
    "fetch 0x821e \<equiv> (Binary (IS_8088 Xor) (Reg (General ThirtyTwo rax)) (Storage (Reg (General ThirtyTwo rdx))), 2)"
    "fetch 0x8220 \<equiv> (Binary (IS_80386 Movzx) (Reg (General ThirtyTwo rdx)) (Storage (Memory Eight (A_SizeDirective 8 (A_Plus (A_FromReg (General SixtyFour rdi)) (A_Mult 4 (A_FromReg (General SixtyFour rcx))))))), 4)"
    "fetch 0x8224 \<equiv> (Unary (IS_80486 Bswap) (Storage (Reg (General ThirtyTwo rax))), 2)"
    "fetch 0x8226 \<equiv> (Binary (IS_8088 Mov) (Memory ThirtyTwo (A_SizeDirective 32 (A_Plus (A_FromReg (General SixtyFour r9)) (A_WordConstant 8)))) (Storage (Reg (General ThirtyTwo rax))), 4)"
    "fetch 0x822a \<equiv> (Binary (IS_8088 Mov) (Reg (General ThirtyTwo rax)) (Storage (Memory ThirtyTwo (A_SizeDirective 32 (A_Plus (A_FromReg (General SixtyFour rdi)) (A_Mult 4 (A_FromReg (General SixtyFour rbx))))))), 3)"
    "fetch 0x822d \<equiv> (Binary (IS_8088 And) (Reg (General ThirtyTwo rax)) (Immediate SixtyFour (ImmVal 65280)), 5)"
    "fetch 0x8232 \<equiv> (Binary (IS_8088 Or) (Reg (General ThirtyTwo rax)) (Storage (Reg (General ThirtyTwo rdx))), 2)"
    "fetch 0x8234 \<equiv> (Binary (IS_8088 Mov) (Reg (General ThirtyTwo rdx)) (Storage (Memory ThirtyTwo (A_SizeDirective 32 (A_Plus (A_FromReg (General SixtyFour rdi)) (A_Mult 4 (A_FromReg (General SixtyFour rsi))))))), 3)"
    "fetch 0x8237 \<equiv> (Binary (IS_8088 Xor) (Reg (General ThirtyTwo rax)) (Storage (Memory ThirtyTwo (A_SizeDirective 32 (A_Plus (A_FromReg (General SixtyFour r8)) (A_WordConstant 12))))), 4)"
    "fetch 0x823b \<equiv> (Binary (IS_8088 Mov) (Reg (General ThirtyTwo rcx)) (Storage (Reg (General ThirtyTwo rdx))), 2)"
    "fetch 0x823d \<equiv> (Binary (IS_8088 Mov) (Reg (General ThirtyTwo rdx)) (Storage (Memory ThirtyTwo (A_SizeDirective 32 (A_Minus (A_FromReg (General SixtyFour rsp)) (A_WordConstant 64))))), 4)"
    "fetch 0x8241 \<equiv> (Binary (IS_8088 And) (Reg (General ThirtyTwo rcx)) (Immediate SixtyFour (ImmVal 4278190080)), 6)"
    "fetch 0x8247 \<equiv> (Binary (IS_8088 Mov) (Reg (General ThirtyTwo rdx)) (Storage (Memory ThirtyTwo (A_SizeDirective 32 (A_Plus (A_FromReg (General SixtyFour rdi)) (A_Mult 4 (A_FromReg (General SixtyFour rdx))))))), 3)"
    "fetch 0x824a \<equiv> (Binary (IS_8088 And) (Reg (General ThirtyTwo rdx)) (Immediate SixtyFour (ImmVal 16711680)), 6)"
    "fetch 0x8250 \<equiv> (Binary (IS_8088 Or) (Reg (General ThirtyTwo rdx)) (Storage (Reg (General ThirtyTwo rcx))), 2)"
    "fetch 0x8252 \<equiv> (Binary (IS_8088 Xor) (Reg (General ThirtyTwo rax)) (Storage (Reg (General ThirtyTwo rdx))), 2)"
    "fetch 0x8254 \<equiv> (Unary (IS_80486 Bswap) (Storage (Reg (General ThirtyTwo rax))), 2)"
    "fetch 0x8256 \<equiv> (Binary (IS_8088 Mov) (Memory ThirtyTwo (A_SizeDirective 32 (A_Plus (A_FromReg (General SixtyFour r9)) (A_WordConstant 12)))) (Storage (Reg (General ThirtyTwo rax))), 4)"
    "fetch 0x825a \<equiv> (Unary (IS_8088 Pop) (Storage (Reg (General SixtyFour rbx))), 1)"
    "fetch 0x825b \<equiv> (Unary (IS_8088 Pop) (Storage (Reg (General SixtyFour rbp))), 1)"
    "fetch 0x825c \<equiv> (Unary (IS_8088 Pop) (Storage (Reg (General SixtyFour r12))), 2)"
    "fetch 0x825e \<equiv> (Unary (IS_8088 Pop) (Storage (Reg (General SixtyFour r13))), 2)"
    "fetch 0x8260 \<equiv> (Unary (IS_8088 Pop) (Storage (Reg (General SixtyFour r14))), 2)"
    "fetch 0x8262 \<equiv> (Unary (IS_8088 Pop) (Storage (Reg (General SixtyFour r15))), 2)"
    "fetch 0x8264 \<equiv> (Nullary (IS_8088 Ret), 1)"
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
  (auto simp add: eq_def)[1],
  auto simp: block_usage_def eq_def setcc_def cmovcc_def if'_then_else_def sub_sign_flag_def simp_rules Let'_def read_region'_def write_block'_def get'_def set'_def post regionset

method vcg_step uses assms =
  ((rule htriples)+, rule blocks)+,
  (simp add: assms pred_logic Ps Qs)?,
  (((auto simp: eq_def)[])+)?,
  ((simp add: assms pred_logic Ps Qs)+)?

method vcg_while for P :: state_pred uses assms =
  ((rule htriples)+)?,
  rule HTriple_weaken[where P=P],
  simp add: pred_logic Ps Qs assms,
  rule HTriple_while

method vcg uses acode assms =
  subst acode,
  (vcg_step assms: assms)+

end

locale "AES_encrypt" = "qemu_img_xen" +
  fixes RAX\<^sub>0\<^sub>v RBX\<^sub>0\<^sub>v RCX\<^sub>0\<^sub>v RDX\<^sub>0\<^sub>v RDI\<^sub>0\<^sub>v RSI\<^sub>0\<^sub>v RSP\<^sub>0\<^sub>v RBP\<^sub>0\<^sub>v R15\<^sub>0\<^sub>v R14\<^sub>0\<^sub>v R13\<^sub>0\<^sub>v R12\<^sub>0\<^sub>v R11\<^sub>0\<^sub>v R10\<^sub>0\<^sub>v R9\<^sub>0\<^sub>v R8\<^sub>0\<^sub>v ret_address\<^sub>v :: \<open>64 word\<close>
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
definition \<open>R11\<^sub>0 \<equiv> R11\<^sub>0\<^sub>v\<close>
definition \<open>R10\<^sub>0 \<equiv> R10\<^sub>0\<^sub>v\<close>
definition \<open>R9\<^sub>0 \<equiv> R9\<^sub>0\<^sub>v\<close>
definition \<open>R8\<^sub>0 \<equiv> R8\<^sub>0\<^sub>v\<close>
definition \<open>ret_address \<equiv> ret_address\<^sub>v\<close>

definition P_0x7ea0_0 :: state_pred where
  \<open>P_0x7ea0_0 \<sigma> \<equiv> RIP \<sigma> = 0x7ea0 \<and> RAX \<sigma> = RAX\<^sub>0 \<and> RBX \<sigma> = RBX\<^sub>0 \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = RDX\<^sub>0 \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = RSP\<^sub>0 \<and> RBP \<sigma> = RBP\<^sub>0 \<and> R15 \<sigma> = R15\<^sub>0 \<and> R14 \<sigma> = R14\<^sub>0 \<and> R13 \<sigma> = R13\<^sub>0 \<and> R12 \<sigma> = R12\<^sub>0 \<and> R11 \<sigma> = R11\<^sub>0 \<and> R10 \<sigma> = R10\<^sub>0 \<and> R9 \<sigma> = R9\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address\<close>
declare P_0x7ea0_0_def[Ps]

definition P_0x7ea0_0_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x7ea0_0_regions_set \<sigma> \<equiv> {
    (0, RDI\<^sub>0, Suc 0),
    (1, RDX\<^sub>0, 4),
    (2, RSP\<^sub>0, 8),
    (3, ((RDI\<^sub>0::64 word) + 0x1), Suc 0),
    (4, ((RDI\<^sub>0::64 word) + 0x2), Suc 0),
    (5, ((RDI\<^sub>0::64 word) + 0x3), Suc 0),
    (6, ((RDI\<^sub>0::64 word) + 0x4), Suc 0),
    (7, ((RDI\<^sub>0::64 word) + 0x5), Suc 0),
    (8, ((RDI\<^sub>0::64 word) + 0x6), Suc 0),
    (9, ((RDI\<^sub>0::64 word) + 0x7), Suc 0),
    (10, ((RDI\<^sub>0::64 word) + 0x8), Suc 0),
    (11, ((RDI\<^sub>0::64 word) + 0x9), Suc 0),
    (12, ((RDI\<^sub>0::64 word) + 0xa), Suc 0),
    (13, ((RDI\<^sub>0::64 word) + 0xb), Suc 0),
    (14, ((RDI\<^sub>0::64 word) + 0xc), Suc 0),
    (15, ((RDI\<^sub>0::64 word) + 0xd), Suc 0),
    (16, ((RDI\<^sub>0::64 word) + 0xe), Suc 0),
    (17, ((RDI\<^sub>0::64 word) + 0xf), Suc 0),
    (18, ((RDX\<^sub>0::64 word) + 0x4), 4),
    (19, ((RDX\<^sub>0::64 word) + 0x8), 4),
    (20, ((RDX\<^sub>0::64 word) + 0xc), 4),
    (21, ((RDX\<^sub>0::64 word) + 0xf0), 4),
    (22, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (23, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (24, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (25, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (26, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (27, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (28, ((RSP\<^sub>0::64 word) - 0x34), 4),
    (29, ((RSP\<^sub>0::64 word) - 0x40), 8),
    (30, ((RSP\<^sub>0::64 word) - 0x48), 8),
    (31, ((RSP\<^sub>0::64 word) - 0x50), 8),
    (32, ((RSP\<^sub>0::64 word) - 0x70), 4)
  }\<close>

definition P_0x7ea0_0_regions :: state_pred where
  \<open>P_0x7ea0_0_regions \<sigma> \<equiv> \<exists>regions. P_0x7ea0_0_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x8006_0 :: state_pred where
  \<open>Q_0x8006_0 \<sigma> \<equiv> RIP \<sigma> = 0x8006 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x30) \<and> R11 \<sigma> = 0x203a0 \<and> R10 \<sigma> = 0x1f7a0 \<and> R9 \<sigma> = 0x1ffa0 \<and> R8 \<sigma> = 0x1fba0 \<and> (\<sigma> \<turnstile> *[RDI\<^sub>0,1]::8 word) = ucast ((\<sigma> \<turnstile> *[RDI\<^sub>0,1]::8 word)) \<and> (\<sigma> \<turnstile> *[RDX\<^sub>0,4]::32 word) = ucast ((\<sigma> \<turnstile> *[RDX\<^sub>0,4]::32 word)) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x1),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x1),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x2),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x2),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x3),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x3),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x4),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x4),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x5),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x5),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x6),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x6),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x7),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x7),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x9),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x9),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0xa),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0xa),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0xb),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0xb),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0xc),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0xc),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0xd),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0xd),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0xe),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0xe),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0xf),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0xf),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RDX\<^sub>0::64 word) + 0x4),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RDX\<^sub>0::64 word) + 0x4),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RDX\<^sub>0::64 word) + 0x8),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RDX\<^sub>0::64 word) + 0x8),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RDX\<^sub>0::64 word) + 0xc),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RDX\<^sub>0::64 word) + 0xc),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RDX\<^sub>0::64 word) + 0xf0),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RDX\<^sub>0::64 word) + 0xf0),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x34),4]::32 word) = ucast (((((\<sigma> \<turnstile> *[((RDX\<^sub>0::64 word) + 0xf0),4]::32 word) >>> 1)::32 word) - 0x1)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = RSI\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x48),8]::64 word) = RDX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),8]::64 word) = ((ucast (((((\<sigma> \<turnstile> *[((RDX\<^sub>0::64 word) + 0xf0),4]::32 word) >>> 1) << 5)::32 word))::64 word) + (RDX\<^sub>0::64 word))\<close>
declare Q_0x8006_0_def[Qs]

schematic_goal AES_encrypt_0_69_0x7ea0_0x7f87_0[blocks]:
  assumes \<open>(P_0x7ea0_0 && P_0x7ea0_0_regions) \<sigma>\<close>
  shows \<open>exec_block 69 0x7f87 0 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x8006_0 ?\<sigma> \<and> block_usage P_0x7ea0_0_regions_set \<sigma> ?\<sigma>\<close>
  apply (insert assms)
  apply (auto simp: pred_logic P_0x7ea0_0_def P_0x7ea0_0_regions_def P_0x7ea0_0_regions_set_def)
    apply step+
    apply (simp add: block_usage_def eq_def setcc_def cmovcc_def if'_then_else_def sub_sign_flag_def simp_rules Let'_def read_region'_def write_block'_def get'_def set'_def Q_0x8006_0_def P_0x7ea0_0_regions_set_def)
   apply (simp add: block_usage_def eq_def setcc_def cmovcc_def if'_then_else_def sub_sign_flag_def simp_rules Let'_def read_region'_def write_block'_def get'_def set'_def Q_0x8006_0_def P_0x7ea0_0_regions_set_def)
  apply (simp add: block_usage_def eq_def setcc_def cmovcc_def if'_then_else_def sub_sign_flag_def simp_rules Let'_def read_region'_def write_block'_def get'_def set'_def Q_0x8006_0_def P_0x7ea0_0_regions_set_def)
  done
  using assms
  by (steps pre: P_0x7ea0_0_def P_0x7ea0_0_regions_def post: Q_0x8006_0_def regionset: P_0x7ea0_0_regions_set_def)

definition P_0x8006_1 :: state_pred where
  \<open>P_0x8006_1 \<sigma> \<equiv> RIP \<sigma> = 0x8006 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x30) \<and> R11 \<sigma> = 0x203a0 \<and> R10 \<sigma> = 0x1f7a0 \<and> R9 \<sigma> = 0x1ffa0 \<and> R8 \<sigma> = 0x1fba0 \<and> (\<sigma> \<turnstile> *[RDI\<^sub>0,1]::8 word) = ucast ((\<sigma> \<turnstile> *[RDI\<^sub>0,1]::8 word)) \<and> (\<sigma> \<turnstile> *[RDX\<^sub>0,4]::32 word) = ucast ((\<sigma> \<turnstile> *[RDX\<^sub>0,4]::32 word)) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x1),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x1),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x2),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x2),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x3),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x3),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x4),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x4),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x5),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x5),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x6),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x6),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x7),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x7),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x9),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x9),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0xa),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0xa),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0xb),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0xb),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0xc),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0xc),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0xd),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0xd),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0xe),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0xe),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0xf),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0xf),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RDX\<^sub>0::64 word) + 0x4),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RDX\<^sub>0::64 word) + 0x4),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RDX\<^sub>0::64 word) + 0x8),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RDX\<^sub>0::64 word) + 0x8),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RDX\<^sub>0::64 word) + 0xc),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RDX\<^sub>0::64 word) + 0xc),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RDX\<^sub>0::64 word) + 0xf0),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RDX\<^sub>0::64 word) + 0xf0),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x34),4]::32 word) = ucast (((((\<sigma> \<turnstile> *[((RDX\<^sub>0::64 word) + 0xf0),4]::32 word) >>> 1)::32 word) - 0x1)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = RSI\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x48),8]::64 word) = RDX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),8]::64 word) = ((ucast (((((\<sigma> \<turnstile> *[((RDX\<^sub>0::64 word) + 0xf0),4]::32 word) >>> 1) << 5)::32 word))::64 word) + (RDX\<^sub>0::64 word))\<close>
declare P_0x8006_1_def[Ps]

definition P_0x8006_1_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x8006_1_regions_set \<sigma> \<equiv> {
    (0, RDI\<^sub>0, Suc 0),
    (1, RDX\<^sub>0, 4),
    (2, RSP\<^sub>0, 8),
    (3, ((RDI \<sigma>::64 word) + 0x10), 4),
    (4, ((RDI \<sigma>::64 word) + 0x14), 4),
    (5, ((RDI \<sigma>::64 word) + 0x18), 4),
    (6, ((RDI \<sigma>::64 word) + 0x1c), 4),
    (7, ((RDI \<sigma>::64 word) + 0x20), 4),
    (8, ((0x1f7a0::64 word) + (\<langle>63,0\<rangle>((ucast (((\<langle>7,0\<rangle>RAX \<sigma>::8 word)::8 word))::64 word) * (0x4::64 word))::64 word)), 4),
    (9, ((0x1f7a0::64 word) + (\<langle>63,0\<rangle>((ucast (((\<langle>7,0\<rangle>RSI \<sigma>::8 word)::8 word))::64 word) * (0x4::64 word))::64 word)), 4),
    (10, ((0x1f7a0::64 word) + (\<langle>63,0\<rangle>((ucast (((\<langle>7,0\<rangle>RBP \<sigma>::8 word)::8 word))::64 word) * (0x4::64 word))::64 word)), 4),
    (11, ((0x1f7a0::64 word) + (\<langle>63,0\<rangle>((ucast (((\<langle>7,0\<rangle>R12 \<sigma>::8 word)::8 word))::64 word) * (0x4::64 word))::64 word)), 4),
    (12, ((0x1fba0::64 word) + (\<langle>63,0\<rangle>((ucast (((\<langle>15,8\<rangle>R12 \<sigma>::8 word)::8 word))::64 word) * (0x4::64 word))::64 word)), 4),
    (13, ((0x1ffa0::64 word) + (\<langle>63,0\<rangle>((ucast (((\<langle>7,0\<rangle>((\<langle>31,0\<rangle>RAX \<sigma>::32 word) >> 16)::8 word)::8 word))::64 word) * (0x4::64 word))::64 word)), 4),
    (14, ((0x1ffa0::64 word) + (\<langle>63,0\<rangle>((ucast (((\<langle>7,0\<rangle>((\<langle>31,0\<rangle>RSI \<sigma>::32 word) >> 16)::8 word)::8 word))::64 word) * (0x4::64 word))::64 word)), 4),
    (15, ((0x1ffa0::64 word) + (\<langle>63,0\<rangle>((ucast (((\<langle>7,0\<rangle>((\<langle>31,0\<rangle>RBP \<sigma>::32 word) >> 16)::8 word)::8 word))::64 word) * (0x4::64 word))::64 word)), 4),
    (16, ((0x1ffa0::64 word) + (\<langle>63,0\<rangle>((ucast (((\<langle>7,0\<rangle>((\<langle>31,0\<rangle>R12 \<sigma>::32 word) >> 16)::8 word)::8 word))::64 word) * (0x4::64 word))::64 word)), 4),
    (17, ((0x203a0::64 word) + (\<langle>63,0\<rangle>(((\<langle>63,0\<rangle>((\<langle>31,0\<rangle>RAX \<sigma>::32 word) >> 24)::64 word)::64 word) * 0x4)::64 word)), 4),
    (18, ((0x203a0::64 word) + (\<langle>63,0\<rangle>(((\<langle>63,0\<rangle>((\<langle>31,0\<rangle>RSI \<sigma>::32 word) >> 24)::64 word)::64 word) * 0x4)::64 word)), 4),
    (19, ((0x203a0::64 word) + (\<langle>63,0\<rangle>(((\<langle>63,0\<rangle>((\<langle>31,0\<rangle>RBP \<sigma>::32 word) >> 24)::64 word)::64 word) * 0x4)::64 word)), 4),
    (20, ((0x203a0::64 word) + (\<langle>63,0\<rangle>(((\<langle>63,0\<rangle>((\<langle>31,0\<rangle>R12 \<sigma>::32 word) >> 24)::64 word)::64 word) * 0x4)::64 word)), 4),
    (21, ((RDI\<^sub>0::64 word) + 0x1), Suc 0),
    (22, ((RDI\<^sub>0::64 word) + 0x2), Suc 0),
    (23, ((RDI\<^sub>0::64 word) + 0x3), Suc 0),
    (24, ((RDI\<^sub>0::64 word) + 0x4), Suc 0),
    (25, ((RDI\<^sub>0::64 word) + 0x5), Suc 0),
    (26, ((RDI\<^sub>0::64 word) + 0x6), Suc 0),
    (27, ((RDI\<^sub>0::64 word) + 0x7), Suc 0),
    (28, ((RDI\<^sub>0::64 word) + 0x8), Suc 0),
    (29, ((RDI\<^sub>0::64 word) + 0x9), Suc 0),
    (30, ((RDI\<^sub>0::64 word) + 0xa), Suc 0),
    (31, ((RDI\<^sub>0::64 word) + 0xb), Suc 0),
    (32, ((RDI\<^sub>0::64 word) + 0xc), Suc 0),
    (33, ((RDI\<^sub>0::64 word) + 0xd), Suc 0),
    (34, ((RDI\<^sub>0::64 word) + 0xe), Suc 0),
    (35, ((RDI\<^sub>0::64 word) + 0xf), Suc 0),
    (36, ((RDX\<^sub>0::64 word) + 0x4), 4),
    (37, ((RDX\<^sub>0::64 word) + 0x8), 4),
    (38, ((RDX\<^sub>0::64 word) + 0xc), 4),
    (39, ((RDX\<^sub>0::64 word) + 0xf0), 4),
    (40, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (41, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (42, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (43, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (44, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (45, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (46, ((RSP\<^sub>0::64 word) - 0x34), 4),
    (47, ((RSP\<^sub>0::64 word) - 0x38), 4),
    (48, ((RSP\<^sub>0::64 word) - 0x40), 8),
    (49, ((RSP\<^sub>0::64 word) - 0x48), 8),
    (50, ((RSP\<^sub>0::64 word) - 0x50), 8),
    (51, ((RSP\<^sub>0::64 word) - 0x54), 4),
    (52, ((RSP\<^sub>0::64 word) - 0x58), 4),
    (53, ((RSP\<^sub>0::64 word) - 0x5c), 4),
    (54, ((RSP\<^sub>0::64 word) - 0x60), 4),
    (55, ((RSP\<^sub>0::64 word) - 0x64), 4),
    (56, ((RSP\<^sub>0::64 word) - 0x68), 4),
    (57, ((RSP\<^sub>0::64 word) - 0x6c), 4),
    (58, ((RSP\<^sub>0::64 word) - 0x70), Suc 0),
    (59, ((RSP\<^sub>0::64 word) - 0x70), 4)
  }\<close>

definition P_0x8006_1_regions :: state_pred where
  \<open>P_0x8006_1_regions \<sigma> \<equiv> \<exists>regions. P_0x8006_1_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {(58,59)}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {(58,59), (59,58)}))
\<close>

definition Q_0x8147_1 :: state_pred where
  \<open>Q_0x8147_1 \<sigma> \<equiv> RIP \<sigma> = 0x8147 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x30) \<and> R11 \<sigma> = 0x203a0 \<and> R10 \<sigma> = 0x1f7a0 \<and> R9 \<sigma> = 0x1ffa0 \<and> R8 \<sigma> = 0x1fba0 \<and> (\<sigma> \<turnstile> *[RDI\<^sub>0,1]::8 word) = ucast ((\<sigma> \<turnstile> *[RDI\<^sub>0,1]::8 word)) \<and> (\<sigma> \<turnstile> *[RDX\<^sub>0,4]::32 word) = ucast ((\<sigma> \<turnstile> *[RDX\<^sub>0,4]::32 word)) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x1),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x1),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x2),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x2),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x3),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x3),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x4),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x4),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x5),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x5),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x6),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x6),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x7),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x7),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x9),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x9),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0xa),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0xa),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0xb),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0xb),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0xc),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0xc),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0xd),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0xd),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0xe),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0xe),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0xf),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0xf),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RDX\<^sub>0::64 word) + 0x4),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RDX\<^sub>0::64 word) + 0x4),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RDX\<^sub>0::64 word) + 0x8),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RDX\<^sub>0::64 word) + 0x8),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RDX\<^sub>0::64 word) + 0xc),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RDX\<^sub>0::64 word) + 0xc),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RDX\<^sub>0::64 word) + 0xf0),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RDX\<^sub>0::64 word) + 0xf0),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x34),4]::32 word) = ucast (((((\<sigma> \<turnstile> *[((RDX\<^sub>0::64 word) + 0xf0),4]::32 word) >>> 1)::32 word) - 0x1)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = RSI\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x48),8]::64 word) = RDX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),8]::64 word) = ((ucast (((((\<sigma> \<turnstile> *[((RDX\<^sub>0::64 word) + 0xf0),4]::32 word) >>> 1) << 5)::32 word))::64 word) + (RDX\<^sub>0::64 word))\<close>
declare Q_0x8147_1_def[Qs]

schematic_goal AES_encrypt_0_92_0x8006_0x8142_1[blocks]:
  assumes \<open>(P_0x8006_1 && P_0x8006_1_regions) \<sigma>\<close>
  shows \<open>exec_block 92 0x8142 (Suc 0) \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x8147_1 ?\<sigma> \<and> block_usage P_0x8006_1_regions_set \<sigma> ?\<sigma>\<close>
  apply (insert assms)
  apply (auto simp: pred_logic P_0x8006_1_def P_0x8006_1_regions_def P_0x8006_1_regions_set_def)
    apply step+
    apply (auto simp: block_usage_def eq_def setcc_def cmovcc_def if'_then_else_def sub_sign_flag_def simp_rules Let'_def read_region'_def write_block'_def get'_def set'_def Q_0x8147_1_def P_0x8006_1_regions_set_def)
  done
  using assms
  by (steps pre: P_0x8006_1_def P_0x8006_1_regions_def post: Q_0x8147_1_def regionset: P_0x8006_1_regions_set_def)

definition P_0x8147_true_2 :: state_pred where
  \<open>P_0x8147_true_2 \<sigma> \<equiv> RIP \<sigma> = 0x8147 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x30) \<and> R11 \<sigma> = 0x203a0 \<and> R10 \<sigma> = 0x1f7a0 \<and> R9 \<sigma> = 0x1ffa0 \<and> R8 \<sigma> = 0x1fba0 \<and> (\<sigma> \<turnstile> *[RDI\<^sub>0,1]::8 word) = ucast ((\<sigma> \<turnstile> *[RDI\<^sub>0,1]::8 word)) \<and> (\<sigma> \<turnstile> *[RDX\<^sub>0,4]::32 word) = ucast ((\<sigma> \<turnstile> *[RDX\<^sub>0,4]::32 word)) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x1),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x1),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x2),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x2),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x3),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x3),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x4),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x4),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x5),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x5),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x6),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x6),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x7),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x7),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x9),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x9),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0xa),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0xa),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0xb),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0xb),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0xc),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0xc),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0xd),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0xd),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0xe),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0xe),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0xf),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0xf),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RDX\<^sub>0::64 word) + 0x4),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RDX\<^sub>0::64 word) + 0x4),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RDX\<^sub>0::64 word) + 0x8),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RDX\<^sub>0::64 word) + 0x8),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RDX\<^sub>0::64 word) + 0xc),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RDX\<^sub>0::64 word) + 0xc),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RDX\<^sub>0::64 word) + 0xf0),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RDX\<^sub>0::64 word) + 0xf0),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x34),4]::32 word) = ucast (((((\<sigma> \<turnstile> *[((RDX\<^sub>0::64 word) + 0xf0),4]::32 word) >>> 1)::32 word) - 0x1)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = RSI\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x48),8]::64 word) = RDX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),8]::64 word) = ((ucast (((((\<sigma> \<turnstile> *[((RDX\<^sub>0::64 word) + 0xf0),4]::32 word) >>> 1) << 5)::32 word))::64 word) + (RDX\<^sub>0::64 word))\<close>
declare P_0x8147_true_2_def[Ps]

definition P_0x8147_true_2_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x8147_true_2_regions_set \<sigma> \<equiv> {
    (0, RDI\<^sub>0, Suc 0),
    (1, RDX\<^sub>0, 4),
    (2, RSP\<^sub>0, 8),
    (3, ((RDI \<sigma>::64 word) + 0x4), 4),
    (4, ((RDI \<sigma>::64 word) + 0x8), 4),
    (5, ((RDI \<sigma>::64 word) + 0xc), 4),
    (6, ((0x1f7a0::64 word) + (\<langle>63,0\<rangle>((RCX \<sigma>::64 word) * 0x4)::64 word)), 4),
    (7, ((0x1f7a0::64 word) + (\<langle>63,0\<rangle>((R15 \<sigma>::64 word) * 0x4)::64 word)), 4),
    (8, ((0x1f7a0::64 word) + (\<langle>63,0\<rangle>((R13 \<sigma>::64 word) * 0x4)::64 word)), 4),
    (9, ((0x1f7a0::64 word) + (\<langle>63,0\<rangle>(((\<langle>63,0\<rangle>(\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x60),4]::32 word)::64 word)::64 word) * 0x4)::64 word)), 4),
    (10, ((0x1fba0::64 word) + (\<langle>63,0\<rangle>((ucast (((\<langle>31,0\<rangle>RBX \<sigma>::32 word)::32 word))::64 word) * (0x4::64 word))::64 word)), 4),
    (11, ((0x1fba0::64 word) + (\<langle>63,0\<rangle>((ucast (((\<langle>31,0\<rangle>RSI \<sigma>::32 word)::32 word))::64 word) * (0x4::64 word))::64 word)), 4),
    (12, ((0x1fba0::64 word) + (\<langle>63,0\<rangle>(((\<langle>63,0\<rangle>(\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x54),4]::32 word)::64 word)::64 word) * 0x4)::64 word)), 4),
    (13, ((0x1fba0::64 word) + (\<langle>63,0\<rangle>(((\<langle>63,0\<rangle>(\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x64),4]::32 word)::64 word)::64 word) * 0x4)::64 word)), 4),
    (14, ((0x1ffa0::64 word) + (\<langle>63,0\<rangle>((RBP \<sigma>::64 word) * 0x4)::64 word)), 4),
    (15, ((0x1ffa0::64 word) + (\<langle>63,0\<rangle>(((\<langle>63,0\<rangle>(\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),4]::32 word)::64 word)::64 word) * 0x4)::64 word)), 4),
    (16, ((0x1ffa0::64 word) + (\<langle>63,0\<rangle>(((\<langle>63,0\<rangle>(\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),4]::32 word)::64 word)::64 word) * 0x4)::64 word)), 4),
    (17, ((0x1ffa0::64 word) + (\<langle>63,0\<rangle>(((\<langle>63,0\<rangle>(\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),4]::32 word)::64 word)::64 word) * 0x4)::64 word)), 4),
    (18, ((0x203a0::64 word) + (\<langle>63,0\<rangle>((R12 \<sigma>::64 word) * 0x4)::64 word)), 4),
    (19, ((0x203a0::64 word) + (\<langle>63,0\<rangle>(((\<langle>63,0\<rangle>(\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x38),4]::32 word)::64 word)::64 word) * 0x4)::64 word)), 4),
    (20, ((0x203a0::64 word) + (\<langle>63,0\<rangle>(((\<langle>63,0\<rangle>(\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x5c),4]::32 word)::64 word)::64 word) * 0x4)::64 word)), 4),
    (21, ((0x203a0::64 word) + (\<langle>63,0\<rangle>(((\<langle>63,0\<rangle>(\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x6c),4]::32 word)::64 word)::64 word) * 0x4)::64 word)), 4),
    (22, ((RDI\<^sub>0::64 word) + 0x1), Suc 0),
    (23, ((RDI\<^sub>0::64 word) + 0x2), Suc 0),
    (24, ((RDI\<^sub>0::64 word) + 0x3), Suc 0),
    (25, ((RDI\<^sub>0::64 word) + 0x4), Suc 0),
    (26, ((RDI\<^sub>0::64 word) + 0x5), Suc 0),
    (27, ((RDI\<^sub>0::64 word) + 0x6), Suc 0),
    (28, ((RDI\<^sub>0::64 word) + 0x7), Suc 0),
    (29, ((RDI\<^sub>0::64 word) + 0x8), Suc 0),
    (30, ((RDI\<^sub>0::64 word) + 0x9), Suc 0),
    (31, ((RDI\<^sub>0::64 word) + 0xa), Suc 0),
    (32, ((RDI\<^sub>0::64 word) + 0xb), Suc 0),
    (33, ((RDI\<^sub>0::64 word) + 0xc), Suc 0),
    (34, ((RDI\<^sub>0::64 word) + 0xd), Suc 0),
    (35, ((RDI\<^sub>0::64 word) + 0xe), Suc 0),
    (36, ((RDI\<^sub>0::64 word) + 0xf), Suc 0),
    (37, ((RDX\<^sub>0::64 word) + 0x4), 4),
    (38, ((RDX\<^sub>0::64 word) + 0x8), 4),
    (39, ((RDX\<^sub>0::64 word) + 0xc), 4),
    (40, ((RDX\<^sub>0::64 word) + 0xf0), 4),
    (41, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (42, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (43, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (44, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (45, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (46, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (47, ((RSP\<^sub>0::64 word) - 0x34), 4),
    (48, ((RSP\<^sub>0::64 word) - 0x38), 4),
    (49, ((RSP\<^sub>0::64 word) - 0x40), 8),
    (50, ((RSP\<^sub>0::64 word) - 0x48), 8),
    (51, ((RSP\<^sub>0::64 word) - 0x50), 8),
    (52, ((RSP\<^sub>0::64 word) - 0x54), 4),
    (53, ((RSP\<^sub>0::64 word) - 0x58), 4),
    (54, ((RSP\<^sub>0::64 word) - 0x5c), 4),
    (55, ((RSP\<^sub>0::64 word) - 0x60), 4),
    (56, ((RSP\<^sub>0::64 word) - 0x64), 4),
    (57, ((RSP\<^sub>0::64 word) - 0x68), 4),
    (58, ((RSP\<^sub>0::64 word) - 0x6c), 4),
    (59, ((RSP\<^sub>0::64 word) - 0x70), 4)
  }\<close>

definition P_0x8147_true_2_regions :: state_pred where
  \<open>P_0x8147_true_2_regions \<sigma> \<equiv> \<exists>regions. P_0x8147_true_2_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x8006_2 :: state_pred where
  \<open>Q_0x8006_2 \<sigma> \<equiv> RIP \<sigma> = 0x8006 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x30) \<and> R11 \<sigma> = 0x203a0 \<and> R10 \<sigma> = 0x1f7a0 \<and> R9 \<sigma> = 0x1ffa0 \<and> R8 \<sigma> = 0x1fba0 \<and> (\<sigma> \<turnstile> *[RDI\<^sub>0,1]::8 word) = ucast ((\<sigma> \<turnstile> *[RDI\<^sub>0,1]::8 word)) \<and> (\<sigma> \<turnstile> *[RDX\<^sub>0,4]::32 word) = ucast ((\<sigma> \<turnstile> *[RDX\<^sub>0,4]::32 word)) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x1),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x1),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x2),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x2),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x3),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x3),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x4),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x4),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x5),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x5),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x6),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x6),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x7),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x7),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x9),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x9),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0xa),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0xa),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0xb),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0xb),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0xc),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0xc),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0xd),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0xd),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0xe),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0xe),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0xf),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0xf),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RDX\<^sub>0::64 word) + 0x4),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RDX\<^sub>0::64 word) + 0x4),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RDX\<^sub>0::64 word) + 0x8),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RDX\<^sub>0::64 word) + 0x8),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RDX\<^sub>0::64 word) + 0xc),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RDX\<^sub>0::64 word) + 0xc),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RDX\<^sub>0::64 word) + 0xf0),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RDX\<^sub>0::64 word) + 0xf0),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x34),4]::32 word) = ucast (((((\<sigma> \<turnstile> *[((RDX\<^sub>0::64 word) + 0xf0),4]::32 word) >>> 1)::32 word) - 0x1)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = RSI\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x48),8]::64 word) = RDX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),8]::64 word) = ((ucast (((((\<sigma> \<turnstile> *[((RDX\<^sub>0::64 word) + 0xf0),4]::32 word) >>> 1) << 5)::32 word))::64 word) + (RDX\<^sub>0::64 word))\<close>
declare Q_0x8006_2_def[Qs]

schematic_goal AES_encrypt_0_32_0x8147_0x8002_2[blocks]:
  assumes \<open>(P_0x8147_true_2 && P_0x8147_true_2_regions && !ZF) \<sigma>\<close>
  shows \<open>exec_block 32 0x8002 2 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x8006_2 ?\<sigma> \<and> block_usage P_0x8147_true_2_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x8147_true_2_def P_0x8147_true_2_regions_def post: Q_0x8006_2_def regionset: P_0x8147_true_2_regions_set_def)

definition P_0x8147_false_3 :: state_pred where
  \<open>P_0x8147_false_3 \<sigma> \<equiv> RIP \<sigma> = 0x8147 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x30) \<and> R11 \<sigma> = 0x203a0 \<and> R10 \<sigma> = 0x1f7a0 \<and> R9 \<sigma> = 0x1ffa0 \<and> R8 \<sigma> = 0x1fba0 \<and> (\<sigma> \<turnstile> *[RDI\<^sub>0,1]::8 word) = ucast ((\<sigma> \<turnstile> *[RDI\<^sub>0,1]::8 word)) \<and> (\<sigma> \<turnstile> *[RDX\<^sub>0,4]::32 word) = ucast ((\<sigma> \<turnstile> *[RDX\<^sub>0,4]::32 word)) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x1),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x1),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x2),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x2),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x3),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x3),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x4),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x4),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x5),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x5),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x6),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x6),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x7),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x7),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x9),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x9),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0xa),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0xa),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0xb),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0xb),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0xc),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0xc),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0xd),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0xd),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0xe),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0xe),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0xf),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0xf),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RDX\<^sub>0::64 word) + 0x4),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RDX\<^sub>0::64 word) + 0x4),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RDX\<^sub>0::64 word) + 0x8),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RDX\<^sub>0::64 word) + 0x8),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RDX\<^sub>0::64 word) + 0xc),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RDX\<^sub>0::64 word) + 0xc),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RDX\<^sub>0::64 word) + 0xf0),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RDX\<^sub>0::64 word) + 0xf0),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x34),4]::32 word) = ucast (((((\<sigma> \<turnstile> *[((RDX\<^sub>0::64 word) + 0xf0),4]::32 word) >>> 1)::32 word) - 0x1)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = RSI\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x48),8]::64 word) = RDX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),8]::64 word) = ((ucast (((((\<sigma> \<turnstile> *[((RDX\<^sub>0::64 word) + 0xf0),4]::32 word) >>> 1) << 5)::32 word))::64 word) + (RDX\<^sub>0::64 word))\<close>
declare P_0x8147_false_3_def[Ps]

definition P_0x8147_false_3_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x8147_false_3_regions_set \<sigma> \<equiv> {
    (0, RDI\<^sub>0, Suc 0),
    (1, RDX\<^sub>0, 4),
    (2, RSP\<^sub>0, 8),
    (3, ((RDI\<^sub>0::64 word) + 0x1), Suc 0),
    (4, ((RDI\<^sub>0::64 word) + 0x2), Suc 0),
    (5, ((RDI\<^sub>0::64 word) + 0x3), Suc 0),
    (6, ((RDI\<^sub>0::64 word) + 0x4), Suc 0),
    (7, ((RDI\<^sub>0::64 word) + 0x5), Suc 0),
    (8, ((RDI\<^sub>0::64 word) + 0x6), Suc 0),
    (9, ((RDI\<^sub>0::64 word) + 0x7), Suc 0),
    (10, ((RDI\<^sub>0::64 word) + 0x8), Suc 0),
    (11, ((RDI\<^sub>0::64 word) + 0x9), Suc 0),
    (12, ((RDI\<^sub>0::64 word) + 0xa), Suc 0),
    (13, ((RDI\<^sub>0::64 word) + 0xb), Suc 0),
    (14, ((RDI\<^sub>0::64 word) + 0xc), Suc 0),
    (15, ((RDI\<^sub>0::64 word) + 0xd), Suc 0),
    (16, ((RDI\<^sub>0::64 word) + 0xe), Suc 0),
    (17, ((RDI\<^sub>0::64 word) + 0xf), Suc 0),
    (18, ((RDX\<^sub>0::64 word) + 0x4), 4),
    (19, ((RDX\<^sub>0::64 word) + 0x8), 4),
    (20, ((RDX\<^sub>0::64 word) + 0xc), 4),
    (21, ((RDX\<^sub>0::64 word) + 0xf0), 4),
    (22, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (23, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (24, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (25, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (26, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (27, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (28, ((RSP\<^sub>0::64 word) - 0x34), 4),
    (29, ((RSP\<^sub>0::64 word) - 0x40), 8),
    (30, ((RSP\<^sub>0::64 word) - 0x48), 8),
    (31, ((RSP\<^sub>0::64 word) - 0x50), 8)
  }\<close>

definition P_0x8147_false_3_regions :: state_pred where
  \<open>P_0x8147_false_3_regions \<sigma> \<equiv> \<exists>regions. P_0x8147_false_3_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x814d_3 :: state_pred where
  \<open>Q_0x814d_3 \<sigma> \<equiv> RIP \<sigma> = 0x814d \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x30) \<and> R11 \<sigma> = 0x203a0 \<and> R10 \<sigma> = 0x1f7a0 \<and> R9 \<sigma> = 0x1ffa0 \<and> R8 \<sigma> = 0x1fba0 \<and> (\<sigma> \<turnstile> *[RDI\<^sub>0,1]::8 word) = ucast ((\<sigma> \<turnstile> *[RDI\<^sub>0,1]::8 word)) \<and> (\<sigma> \<turnstile> *[RDX\<^sub>0,4]::32 word) = ucast ((\<sigma> \<turnstile> *[RDX\<^sub>0,4]::32 word)) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x1),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x1),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x2),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x2),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x3),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x3),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x4),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x4),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x5),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x5),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x6),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x6),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x7),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x7),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x9),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x9),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0xa),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0xa),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0xb),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0xb),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0xc),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0xc),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0xd),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0xd),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0xe),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0xe),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0xf),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0xf),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RDX\<^sub>0::64 word) + 0x4),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RDX\<^sub>0::64 word) + 0x4),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RDX\<^sub>0::64 word) + 0x8),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RDX\<^sub>0::64 word) + 0x8),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RDX\<^sub>0::64 word) + 0xc),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RDX\<^sub>0::64 word) + 0xc),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RDX\<^sub>0::64 word) + 0xf0),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RDX\<^sub>0::64 word) + 0xf0),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x34),4]::32 word) = ucast (((((\<sigma> \<turnstile> *[((RDX\<^sub>0::64 word) + 0xf0),4]::32 word) >>> 1)::32 word) - 0x1)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = RSI\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x48),8]::64 word) = RDX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),8]::64 word) = ((ucast (((((\<sigma> \<turnstile> *[((RDX\<^sub>0::64 word) + 0xf0),4]::32 word) >>> 1) << 5)::32 word))::64 word) + (RDX\<^sub>0::64 word))\<close>
declare Q_0x814d_3_def[Qs]

schematic_goal AES_encrypt_0_1_0x8147_0x8147_3[blocks]:
  assumes \<open>(P_0x8147_false_3 && P_0x8147_false_3_regions && ! !ZF) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x8147 3 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x814d_3 ?\<sigma> \<and> block_usage P_0x8147_false_3_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x8147_false_3_def P_0x8147_false_3_regions_def post: Q_0x814d_3_def regionset: P_0x8147_false_3_regions_set_def)

definition P_0x814d_4 :: state_pred where
  \<open>P_0x814d_4 \<sigma> \<equiv> RIP \<sigma> = 0x814d \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x30) \<and> R11 \<sigma> = 0x203a0 \<and> R10 \<sigma> = 0x1f7a0 \<and> R9 \<sigma> = 0x1ffa0 \<and> R8 \<sigma> = 0x1fba0 \<and> (\<sigma> \<turnstile> *[RDI\<^sub>0,1]::8 word) = ucast ((\<sigma> \<turnstile> *[RDI\<^sub>0,1]::8 word)) \<and> (\<sigma> \<turnstile> *[RDX\<^sub>0,4]::32 word) = ucast ((\<sigma> \<turnstile> *[RDX\<^sub>0,4]::32 word)) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x1),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x1),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x2),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x2),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x3),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x3),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x4),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x4),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x5),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x5),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x6),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x6),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x7),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x7),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x9),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x9),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0xa),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0xa),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0xb),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0xb),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0xc),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0xc),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0xd),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0xd),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0xe),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0xe),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0xf),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0xf),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RDX\<^sub>0::64 word) + 0x4),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RDX\<^sub>0::64 word) + 0x4),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RDX\<^sub>0::64 word) + 0x8),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RDX\<^sub>0::64 word) + 0x8),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RDX\<^sub>0::64 word) + 0xc),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RDX\<^sub>0::64 word) + 0xc),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RDX\<^sub>0::64 word) + 0xf0),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RDX\<^sub>0::64 word) + 0xf0),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x34),4]::32 word) = ucast (((((\<sigma> \<turnstile> *[((RDX\<^sub>0::64 word) + 0xf0),4]::32 word) >>> 1)::32 word) - 0x1)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = RSI\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x48),8]::64 word) = RDX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),8]::64 word) = ((ucast (((((\<sigma> \<turnstile> *[((RDX\<^sub>0::64 word) + 0xf0),4]::32 word) >>> 1) << 5)::32 word))::64 word) + (RDX\<^sub>0::64 word))\<close>
declare P_0x814d_4_def[Ps]

definition P_0x814d_4_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x814d_4_regions_set \<sigma> \<equiv> {
    (0, RDI\<^sub>0, Suc 0),
    (1, RDX\<^sub>0, 4),
    (2, RSI\<^sub>0, 4),
    (3, RSP\<^sub>0, 8),
    (4, ((0x1f3a0::64 word) + (\<langle>63,0\<rangle>((RCX \<sigma>::64 word) * 0x4)::64 word)), Suc 0),
    (5, ((0x1f3a0::64 word) + (\<langle>63,0\<rangle>((RBP \<sigma>::64 word) * 0x4)::64 word)), 4),
    (6, ((0x1f3a0::64 word) + (\<langle>63,0\<rangle>((R15 \<sigma>::64 word) * 0x4)::64 word)), Suc 0),
    (7, ((0x1f3a0::64 word) + (\<langle>63,0\<rangle>((R13 \<sigma>::64 word) * 0x4)::64 word)), Suc 0),
    (8, ((0x1f3a0::64 word) + (\<langle>63,0\<rangle>((R12 \<sigma>::64 word) * 0x4)::64 word)), 4),
    (9, ((0x1f3a0::64 word) + (\<langle>63,0\<rangle>((ucast (((\<langle>31,0\<rangle>RBX \<sigma>::32 word)::32 word))::64 word) * (0x4::64 word))::64 word)), 4),
    (10, ((0x1f3a0::64 word) + (\<langle>63,0\<rangle>((ucast (((\<langle>31,0\<rangle>RSI \<sigma>::32 word)::32 word))::64 word) * (0x4::64 word))::64 word)), 4),
    (11, ((0x1f3a0::64 word) + (\<langle>63,0\<rangle>(((\<langle>63,0\<rangle>(\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x38),4]::32 word)::64 word)::64 word) * 0x4)::64 word)), 4),
    (12, ((0x1f3a0::64 word) + (\<langle>63,0\<rangle>(((\<langle>63,0\<rangle>(\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x54),4]::32 word)::64 word)::64 word) * 0x4)::64 word)), 4),
    (13, ((0x1f3a0::64 word) + (\<langle>63,0\<rangle>(((\<langle>63,0\<rangle>(\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),4]::32 word)::64 word)::64 word) * 0x4)::64 word)), 4),
    (14, ((0x1f3a0::64 word) + (\<langle>63,0\<rangle>(((\<langle>63,0\<rangle>(\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x5c),4]::32 word)::64 word)::64 word) * 0x4)::64 word)), 4),
    (15, ((0x1f3a0::64 word) + (\<langle>63,0\<rangle>(((\<langle>63,0\<rangle>(\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x60),4]::32 word)::64 word)::64 word) * 0x4)::64 word)), Suc 0),
    (16, ((0x1f3a0::64 word) + (\<langle>63,0\<rangle>(((\<langle>63,0\<rangle>(\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x64),4]::32 word)::64 word)::64 word) * 0x4)::64 word)), 4),
    (17, ((0x1f3a0::64 word) + (\<langle>63,0\<rangle>(((\<langle>63,0\<rangle>(\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),4]::32 word)::64 word)::64 word) * 0x4)::64 word)), 4),
    (18, ((0x1f3a0::64 word) + (\<langle>63,0\<rangle>(((\<langle>63,0\<rangle>(\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x6c),4]::32 word)::64 word)::64 word) * 0x4)::64 word)), 4),
    (19, ((0x1f3a0::64 word) + (\<langle>63,0\<rangle>(((\<langle>63,0\<rangle>(\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),4]::32 word)::64 word)::64 word) * 0x4)::64 word)), 4),
    (20, ((RDI\<^sub>0::64 word) + 0x1), Suc 0),
    (21, ((RDI\<^sub>0::64 word) + 0x2), Suc 0),
    (22, ((RDI\<^sub>0::64 word) + 0x3), Suc 0),
    (23, ((RDI\<^sub>0::64 word) + 0x4), Suc 0),
    (24, ((RDI\<^sub>0::64 word) + 0x5), Suc 0),
    (25, ((RDI\<^sub>0::64 word) + 0x6), Suc 0),
    (26, ((RDI\<^sub>0::64 word) + 0x7), Suc 0),
    (27, ((RDI\<^sub>0::64 word) + 0x8), Suc 0),
    (28, ((RDI\<^sub>0::64 word) + 0x9), Suc 0),
    (29, ((RDI\<^sub>0::64 word) + 0xa), Suc 0),
    (30, ((RDI\<^sub>0::64 word) + 0xb), Suc 0),
    (31, ((RDI\<^sub>0::64 word) + 0xc), Suc 0),
    (32, ((RDI\<^sub>0::64 word) + 0xd), Suc 0),
    (33, ((RDI\<^sub>0::64 word) + 0xe), Suc 0),
    (34, ((RDI\<^sub>0::64 word) + 0xf), Suc 0),
    (35, ((RDX\<^sub>0::64 word) + 0x4), 4),
    (36, ((RDX\<^sub>0::64 word) + 0x8), 4),
    (37, ((RDX\<^sub>0::64 word) + 0xc), 4),
    (38, ((RDX\<^sub>0::64 word) + 0xf0), 4),
    (39, ((RSI\<^sub>0::64 word) + 0x4), 4),
    (40, ((RSI\<^sub>0::64 word) + 0x8), 4),
    (41, ((RSI\<^sub>0::64 word) + 0xc), 4),
    (42, ((((RDX\<^sub>0::64 word) + (ucast (((((\<sigma> \<turnstile> *[((RDX\<^sub>0::64 word) + 0xf0),4]::32 word) >>> 1) << 5)::32 word))::64 word))::64 word) + 0x4), 4),
    (43, ((((RDX\<^sub>0::64 word) + (ucast (((((\<sigma> \<turnstile> *[((RDX\<^sub>0::64 word) + 0xf0),4]::32 word) >>> 1) << 5)::32 word))::64 word))::64 word) + 0x8), 4),
    (44, ((((RDX\<^sub>0::64 word) + (ucast (((((\<sigma> \<turnstile> *[((RDX\<^sub>0::64 word) + 0xf0),4]::32 word) >>> 1) << 5)::32 word))::64 word))::64 word) + 0xc), 4),
    (45, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (46, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (47, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (48, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (49, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (50, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (51, ((RSP\<^sub>0::64 word) - 0x34), 4),
    (52, ((RSP\<^sub>0::64 word) - 0x38), 4),
    (53, ((RSP\<^sub>0::64 word) - 0x40), 8),
    (54, ((RSP\<^sub>0::64 word) - 0x48), 8),
    (55, ((RSP\<^sub>0::64 word) - 0x50), 8),
    (56, ((RSP\<^sub>0::64 word) - 0x54), 4),
    (57, ((RSP\<^sub>0::64 word) - 0x58), 4),
    (58, ((RSP\<^sub>0::64 word) - 0x5c), 4),
    (59, ((RSP\<^sub>0::64 word) - 0x60), 4),
    (60, ((RSP\<^sub>0::64 word) - 0x64), 4),
    (61, ((RSP\<^sub>0::64 word) - 0x68), 4),
    (62, ((RSP\<^sub>0::64 word) - 0x6c), 4),
    (63, ((RSP\<^sub>0::64 word) - 0x70), 4)
  }\<close>

definition P_0x814d_4_regions :: state_pred where
  \<open>P_0x814d_4_regions \<sigma> \<equiv> \<exists>regions. P_0x814d_4_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_ret_address_4 :: state_pred where
  \<open>Q_ret_address_4 \<sigma> \<equiv> RIP \<sigma> = ret_address \<and> RBX \<sigma> = RBX\<^sub>0 \<and> RCX \<sigma> = ucast ((((\<sigma> \<turnstile> *[((0x1f3a0::64 word) + (\<langle>63,0\<rangle>(((\<langle>63,0\<rangle>(\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x38),4]::32 word)::64 word)::64 word) * 0x4)::64 word)),4]::32 word)::32 word) AND 0xff000000)) \<and> RDX \<sigma> = ucast ((((((\<sigma> \<turnstile> *[((0x1f3a0::64 word) + (\<langle>63,0\<rangle>(((\<langle>63,0\<rangle>(\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),4]::32 word)::64 word)::64 word) * 0x4)::64 word)),4]::32 word)::32 word) AND 0xff0000)::32 word) OR (((\<sigma> \<turnstile> *[((0x1f3a0::64 word) + (\<langle>63,0\<rangle>(((\<langle>63,0\<rangle>(\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x38),4]::32 word)::64 word)::64 word) * 0x4)::64 word)),4]::32 word)::32 word) AND 0xff000000))) \<and> RDI \<sigma> = 0x1f3a0 \<and> RSI \<sigma> = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x38),4]::32 word)) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) + 0x8) \<and> RBP \<sigma> = RBP\<^sub>0 \<and> R15 \<sigma> = R15\<^sub>0 \<and> R14 \<sigma> = R14\<^sub>0 \<and> R13 \<sigma> = R13\<^sub>0 \<and> R12 \<sigma> = R12\<^sub>0 \<and> R11 \<sigma> = 0x203a0 \<and> R10 \<sigma> = 0x1f7a0 \<and> R9 \<sigma> = RSI\<^sub>0 \<and> R8 \<sigma> = ((RDX\<^sub>0::64 word) + (ucast (((((\<sigma> \<turnstile> *[((RDX\<^sub>0::64 word) + 0xf0),4]::32 word) >>> 1) << 5)::32 word))::64 word)) \<and> (\<sigma> \<turnstile> *[RDI\<^sub>0,1]::8 word) = ucast ((\<sigma> \<turnstile> *[RDI\<^sub>0,1]::8 word)) \<and> (\<sigma> \<turnstile> *[RDX\<^sub>0,4]::32 word) = ucast ((\<sigma> \<turnstile> *[RDX\<^sub>0,4]::32 word)) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((0x1f3a0::64 word) + (\<langle>63,0\<rangle>(((\<langle>63,0\<rangle>(\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x38),4]::32 word)::64 word)::64 word) * 0x4)::64 word)),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((0x1f3a0::64 word) + (\<langle>63,0\<rangle>(((\<langle>63,0\<rangle>(\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x38),4]::32 word)::64 word)::64 word) * 0x4)::64 word)),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((0x1f3a0::64 word) + (\<langle>63,0\<rangle>(((\<langle>63,0\<rangle>(\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x54),4]::32 word)::64 word)::64 word) * 0x4)::64 word)),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((0x1f3a0::64 word) + (\<langle>63,0\<rangle>(((\<langle>63,0\<rangle>(\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x54),4]::32 word)::64 word)::64 word) * 0x4)::64 word)),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((0x1f3a0::64 word) + (\<langle>63,0\<rangle>(((\<langle>63,0\<rangle>(\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),4]::32 word)::64 word)::64 word) * 0x4)::64 word)),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((0x1f3a0::64 word) + (\<langle>63,0\<rangle>(((\<langle>63,0\<rangle>(\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),4]::32 word)::64 word)::64 word) * 0x4)::64 word)),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((0x1f3a0::64 word) + (\<langle>63,0\<rangle>(((\<langle>63,0\<rangle>(\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x5c),4]::32 word)::64 word)::64 word) * 0x4)::64 word)),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((0x1f3a0::64 word) + (\<langle>63,0\<rangle>(((\<langle>63,0\<rangle>(\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x5c),4]::32 word)::64 word)::64 word) * 0x4)::64 word)),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((0x1f3a0::64 word) + (\<langle>63,0\<rangle>(((\<langle>63,0\<rangle>(\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x60),4]::32 word)::64 word)::64 word) * 0x4)::64 word)),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((0x1f3a0::64 word) + (\<langle>63,0\<rangle>(((\<langle>63,0\<rangle>(\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x60),4]::32 word)::64 word)::64 word) * 0x4)::64 word)),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((0x1f3a0::64 word) + (\<langle>63,0\<rangle>(((\<langle>63,0\<rangle>(\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x64),4]::32 word)::64 word)::64 word) * 0x4)::64 word)),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((0x1f3a0::64 word) + (\<langle>63,0\<rangle>(((\<langle>63,0\<rangle>(\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x64),4]::32 word)::64 word)::64 word) * 0x4)::64 word)),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((0x1f3a0::64 word) + (\<langle>63,0\<rangle>(((\<langle>63,0\<rangle>(\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),4]::32 word)::64 word)::64 word) * 0x4)::64 word)),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((0x1f3a0::64 word) + (\<langle>63,0\<rangle>(((\<langle>63,0\<rangle>(\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),4]::32 word)::64 word)::64 word) * 0x4)::64 word)),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((0x1f3a0::64 word) + (\<langle>63,0\<rangle>(((\<langle>63,0\<rangle>(\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x6c),4]::32 word)::64 word)::64 word) * 0x4)::64 word)),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((0x1f3a0::64 word) + (\<langle>63,0\<rangle>(((\<langle>63,0\<rangle>(\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x6c),4]::32 word)::64 word)::64 word) * 0x4)::64 word)),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((0x1f3a0::64 word) + (\<langle>63,0\<rangle>(((\<langle>63,0\<rangle>(\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),4]::32 word)::64 word)::64 word) * 0x4)::64 word)),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((0x1f3a0::64 word) + (\<langle>63,0\<rangle>(((\<langle>63,0\<rangle>(\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),4]::32 word)::64 word)::64 word) * 0x4)::64 word)),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x1),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x1),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x2),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x2),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x3),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x3),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x4),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x4),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x5),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x5),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x6),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x6),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x7),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x7),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x8),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x9),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x9),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0xa),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0xa),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0xb),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0xb),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0xc),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0xc),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0xd),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0xd),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0xe),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0xe),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0xf),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0xf),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RDX\<^sub>0::64 word) + 0x4),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RDX\<^sub>0::64 word) + 0x4),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RDX\<^sub>0::64 word) + 0x8),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RDX\<^sub>0::64 word) + 0x8),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RDX\<^sub>0::64 word) + 0xc),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RDX\<^sub>0::64 word) + 0xc),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RDX\<^sub>0::64 word) + 0xf0),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RDX\<^sub>0::64 word) + 0xf0),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + 0x4),4]::32 word) = ucast ((bswap ((ucast (((((((((((\<sigma> \<turnstile> *[((0x1f3a0::64 word) + (\<langle>63,0\<rangle>(((\<langle>63,0\<rangle>(\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x64),4]::32 word)::64 word)::64 word) * 0x4)::64 word)),4]::32 word)::32 word) AND 0xff00)::32 word) OR (\<langle>31,0\<rangle>(\<sigma> \<turnstile> *[((0x1f3a0::64 word) + (\<langle>63,0\<rangle>(((\<langle>63,0\<rangle>(\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x60),4]::32 word)::64 word)::64 word) * 0x4)::64 word)),1]::8 word)::32 word))::32 word) XOR (\<sigma> \<turnstile> *[((((RDX\<^sub>0::64 word) + (ucast (((((\<sigma> \<turnstile> *[((RDX\<^sub>0::64 word) + 0xf0),4]::32 word) >>> 1) << 5)::32 word))::64 word))::64 word) + 0x4),4]::32 word))::32 word) XOR (((((\<sigma> \<turnstile> *[((0x1f3a0::64 word) + (\<langle>63,0\<rangle>(((\<langle>63,0\<rangle>(\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),4]::32 word)::64 word)::64 word) * 0x4)::64 word)),4]::32 word)::32 word) AND 0xff0000)::32 word) OR (((\<sigma> \<turnstile> *[((0x1f3a0::64 word) + (\<langle>63,0\<rangle>(((\<langle>63,0\<rangle>(\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x6c),4]::32 word)::64 word)::64 word) * 0x4)::64 word)),4]::32 word)::32 word) AND 0xff000000)))::32 word))::64 word)) 32)) \<and> (\<sigma> \<turnstile> *[((((RDX\<^sub>0::64 word) + (ucast (((((\<sigma> \<turnstile> *[((RDX\<^sub>0::64 word) + 0xf0),4]::32 word) >>> 1) << 5)::32 word))::64 word))::64 word) + 0x4),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((((RDX\<^sub>0::64 word) + (ucast (((((\<sigma> \<turnstile> *[((RDX\<^sub>0::64 word) + 0xf0),4]::32 word) >>> 1) << 5)::32 word))::64 word))::64 word) + 0x4),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((((RDX\<^sub>0::64 word) + (ucast (((((\<sigma> \<turnstile> *[((RDX\<^sub>0::64 word) + 0xf0),4]::32 word) >>> 1) << 5)::32 word))::64 word))::64 word) + 0x8),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((((RDX\<^sub>0::64 word) + (ucast (((((\<sigma> \<turnstile> *[((RDX\<^sub>0::64 word) + 0xf0),4]::32 word) >>> 1) << 5)::32 word))::64 word))::64 word) + 0x8),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((((RDX\<^sub>0::64 word) + (ucast (((((\<sigma> \<turnstile> *[((RDX\<^sub>0::64 word) + 0xf0),4]::32 word) >>> 1) << 5)::32 word))::64 word))::64 word) + 0xc),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((((RDX\<^sub>0::64 word) + (ucast (((((\<sigma> \<turnstile> *[((RDX\<^sub>0::64 word) + 0xf0),4]::32 word) >>> 1) << 5)::32 word))::64 word))::64 word) + 0xc),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x34),4]::32 word) = ucast (((((\<sigma> \<turnstile> *[((RDX\<^sub>0::64 word) + 0xf0),4]::32 word) >>> 1)::32 word) - 0x1)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x38),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x38),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = RSI\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x48),8]::64 word) = RDX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),8]::64 word) = ((ucast (((((\<sigma> \<turnstile> *[((RDX\<^sub>0::64 word) + 0xf0),4]::32 word) >>> 1) << 5)::32 word))::64 word) + (RDX\<^sub>0::64 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x54),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x54),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x5c),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x5c),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x60),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x60),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x64),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x64),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x6c),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x6c),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x70),4]::32 word))\<close>
declare Q_ret_address_4_def[Qs]

schematic_goal AES_encrypt_0_82_0x814d_0x8264_4[blocks]:
  assumes \<open>(P_0x814d_4 && P_0x814d_4_regions) \<sigma>\<close>
  shows \<open>exec_block 82 0x8264 4 \<sigma> \<triangleq> ?\<sigma> \<and> Q_ret_address_4 ?\<sigma> \<and> block_usage P_0x814d_4_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x814d_4_def P_0x814d_4_regions_def post: Q_ret_address_4_def regionset: P_0x814d_4_regions_set_def)

definition AES_encrypt_acode :: ACode where
  \<open>AES_encrypt_acode =
    Block 69 0x7f87 0;
    WHILE P_0x8006_1 DO
      Block 92 0x8142 (Suc 0);
      IF !ZF THEN
        Block 32 0x8002 2
      ELSE
        Block (Suc 0) 0x8147 3
      FI
    OD;
    Block 82 0x8264 4
  \<close>

schematic_goal "AES_encrypt":
  assumes
    \<open>\<forall>\<sigma>. RIP \<sigma> = 0x8006 \<longrightarrow> P_0x8006_1_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x8147 \<longrightarrow> P_0x8147_true_2_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x8147 \<longrightarrow> P_0x8147_false_3_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x814d \<longrightarrow> P_0x814d_4_regions \<sigma>\<close>
  shows \<open>{{?P}} AES_encrypt_acode {{?Q;?M}}\<close>
  apply (vcg acode: AES_encrypt_acode_def assms: assms)
  apply (vcg_while \<open>P_0x8006_1 || P_0x8264_1\<close> assms: assms)
                  apply (vcg_step assms: assms)+
  done

end

end
