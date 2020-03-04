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
theory decode_featureset
  imports "../../../isabelle/VCG/HTriple"
begin

locale "xen_cpuid" = execution_context + exec_code +
  fixes printf_chk_0x2b68_retval\<^sub>v printf_chk_0x2bac_retval\<^sub>v printf_chk_0x2bf6_retval\<^sub>v printf_chk_0x2c2e_retval\<^sub>v printf_chk_0x2c68_retval\<^sub>v putchar_0x2c8d_retval\<^sub>v printf_chk_0x2cc7_retval\<^sub>v printf_chk_0x2cee_retval\<^sub>v printf_chk_addr putchar_addr :: \<open>64 word\<close>
    and printf_chk_acode putchar_acode :: ACode
  assumes fetch:
    "fetch 0x2b40 \<equiv> (Unary (IS_8088 Push) (Storage (Reg (General SixtyFour r15))), 2)"
    "fetch 0x2b42 \<equiv> (Binary (IS_8088 Xor) (Reg (General ThirtyTwo rax)) (Storage (Reg (General ThirtyTwo rax))), 2)"
    "fetch 0x2b44 \<equiv> (Unary (IS_8088 Push) (Storage (Reg (General SixtyFour r14))), 2)"
    "fetch 0x2b46 \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour r14)) (Storage (Reg (General SixtyFour rdi))), 3)"
    "fetch 0x2b49 \<equiv> (Binary (IS_8088 Mov) (Reg (General ThirtyTwo rdi)) (Immediate SixtyFour (ImmVal 1)), 5)"
    "fetch 0x2b4e \<equiv> (Unary (IS_8088 Push) (Storage (Reg (General SixtyFour r13))), 2)"
    "fetch 0x2b50 \<equiv> (Binary (IS_8088 Mov) (Reg (General ThirtyTwo r13)) (Storage (Reg (General ThirtyTwo rcx))), 3)"
    "fetch 0x2b53 \<equiv> (Unary (IS_8088 Push) (Storage (Reg (General SixtyFour r12))), 2)"
    "fetch 0x2b55 \<equiv> (Unary (IS_8088 Push) (Storage (Reg (General SixtyFour rbp))), 1)"
    "fetch 0x2b56 \<equiv> (Unary (IS_8088 Push) (Storage (Reg (General SixtyFour rbx))), 1)"
    "fetch 0x2b57 \<equiv> (Binary (IS_8088 Mov) (Reg (General ThirtyTwo rbx)) (Storage (Reg (General ThirtyTwo rsi))), 2)"
    "fetch 0x2b59 \<equiv> (Binary (IS_8088 Sub) (Reg (General SixtyFour rsp)) (Immediate SixtyFour (ImmVal 24)), 4)"
    "fetch 0x2b5d \<equiv> (Binary (IS_8088 Mov) (Memory ThirtyTwo (A_SizeDirective 32 (A_Plus (A_FromReg (General SixtyFour rsp)) (A_WordConstant 12)))) (Storage (Reg (General ThirtyTwo rsi))), 4)"
    "fetch 0x2b61 \<equiv> (Binary (IS_8088 Lea) (Reg (General SixtyFour rsi)) (Storage (Memory SixtyFour (A_Plus (A_FromReg (General SixtyFour rip)) (A_WordConstant 1573)))), 7)"
    "fetch 0x2b68 \<equiv> (Unary (IS_8088 Call) (Immediate SixtyFour (ImmLabel ''__printf_chk'')), 5)"
    "fetch 0x2b6d \<equiv> (Binary (IS_8088 Test) (Reg (General ThirtyTwo rbx)) (Storage (Reg (General ThirtyTwo rbx))), 2)"
    "fetch 0x2b6f \<equiv> (Unary (IS_8088 Je) (Immediate SixtyFour (ImmVal 11472)), 6)"
    "fetch 0x2b75 \<equiv> (Binary (IS_8088 Lea) (Reg (General ThirtyTwo r12)) (Storage (Memory SixtyFour (A_Minus (A_FromReg (General SixtyFour rbx)) (A_WordConstant 1)))), 4)"
    "fetch 0x2b79 \<equiv> (Binary (IS_8088 Xor) (Reg (General ThirtyTwo r15)) (Storage (Reg (General ThirtyTwo r15))), 3)"
    "fetch 0x2b7c \<equiv> (Binary (IS_8088 Lea) (Reg (General SixtyFour rbp)) (Storage (Memory SixtyFour (A_Plus (A_FromReg (General SixtyFour rip)) (A_WordConstant 1560)))), 7)"
    "fetch 0x2b83 \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour rbx)) (Storage (Reg (General SixtyFour r12))), 3)"
    "fetch 0x2b86 \<equiv> (Unary (IS_8088 Jmp) (Immediate SixtyFour (ImmVal 11155)), 2)"
    "fetch 0x2b88 \<equiv> (Unary (IS_8088 Nop) (Storage (Memory ThirtyTwo (A_SizeDirective 32 (A_Plus (A_FromReg (General SixtyFour rax)) (A_Plus (A_Mult 1 (A_FromReg (General SixtyFour rax))) (A_WordConstant 0)))))), 8)"
    "fetch 0x2b90 \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour r15)) (Storage (Reg (General SixtyFour rax))), 3)"
    "fetch 0x2b93 \<equiv> (Binary (IS_8088 Cmp) (Reg (General ThirtyTwo r15)) (Storage (Reg (General ThirtyTwo rbx))), 3)"
    "fetch 0x2b96 \<equiv> (Binary (IS_8088 Mov) (Reg (General ThirtyTwo rdx)) (Storage (Memory ThirtyTwo (A_SizeDirective 32 (A_Plus (A_FromReg (General SixtyFour r14)) (A_Mult 4 (A_FromReg (General SixtyFour r15))))))), 4)"
    "fetch 0x2b9a \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour rsi)) (Storage (Reg (General SixtyFour rbp))), 3)"
    "fetch 0x2b9d \<equiv> (Binary (IS_8088 Mov) (Reg (General ThirtyTwo rdi)) (Immediate SixtyFour (ImmVal 1)), 5)"
    "fetch 0x2ba2 \<equiv> (Binary (IS_8088 Sbb) (Reg (General ThirtyTwo rcx)) (Storage (Reg (General ThirtyTwo rcx))), 2)"
    "fetch 0x2ba4 \<equiv> (Binary (IS_8088 Xor) (Reg (General ThirtyTwo rax)) (Storage (Reg (General ThirtyTwo rax))), 2)"
    "fetch 0x2ba6 \<equiv> (Binary (IS_8088 And) (Reg (General ThirtyTwo rcx)) (Immediate SixtyFour (ImmVal 48)), 3)"
    "fetch 0x2ba9 \<equiv> (Binary (IS_8088 Add) (Reg (General ThirtyTwo rcx)) (Immediate SixtyFour (ImmVal 10)), 3)"
    "fetch 0x2bac \<equiv> (Unary (IS_8088 Call) (Immediate SixtyFour (ImmLabel ''__printf_chk'')), 5)"
    "fetch 0x2bb1 \<equiv> (Binary (IS_8088 Lea) (Reg (General SixtyFour rax)) (Storage (Memory SixtyFour (A_Plus (A_FromReg (General SixtyFour r15)) (A_WordConstant 1)))), 4)"
    "fetch 0x2bb5 \<equiv> (Binary (IS_8088 Cmp) (Reg (General SixtyFour r15)) (Storage (Reg (General SixtyFour r12))), 3)"
    "fetch 0x2bb8 \<equiv> (Unary (IS_8088 Jne) (Immediate SixtyFour (ImmVal 11152)), 2)"
    "fetch 0x2bba \<equiv> (Binary (IS_8088 Test) (Reg (General Eight r13)) (Storage (Reg (General Eight r13))), 3)"
    "fetch 0x2bbd \<equiv> (Unary (IS_8088 Je) (Immediate SixtyFour (ImmVal 11472)), 6)"
    "fetch 0x2bc3 \<equiv> (Binary (IS_8088 Mov) (Reg (General ThirtyTwo rbx)) (Immediate SixtyFour (ImmVal 1)), 5)"
    "fetch 0x2bc8 \<equiv> (Binary (IS_8088 Lea) (Reg (General SixtyFour rcx)) (Storage (Memory SixtyFour (A_Plus (A_FromReg (General SixtyFour rip)) (A_WordConstant 1455)))), 7)"
    "fetch 0x2bcf \<equiv> (Binary (IS_8088 Lea) (Reg (General SixtyFour rbp)) (Storage (Memory SixtyFour (A_Plus (A_FromReg (General SixtyFour rip)) (A_WordConstant 8250)))), 7)"
    "fetch 0x2bd6 \<equiv> (Binary (IS_8088 Mov) (Reg (General ThirtyTwo r12)) (Storage (Reg (General ThirtyTwo rbx))), 3)"
    "fetch 0x2bd9 \<equiv> (Binary (IS_8088 Lea) (Reg (General ThirtyTwo rdx)) (Storage (Memory SixtyFour (A_Minus (A_FromReg (General SixtyFour rbx)) (A_WordConstant 1)))), 3)"
    "fetch 0x2bdc \<equiv> (Binary (IS_8088 Test) (Reg (General SixtyFour rcx)) (Storage (Reg (General SixtyFour rcx))), 3)"
    "fetch 0x2bdf \<equiv> (Unary (IS_8088 Je) (Immediate SixtyFour (ImmVal 11442)), 6)"
    "fetch 0x2be5 \<equiv> (Unary (IS_8088 Nop) (Storage (Memory ThirtyTwo (A_SizeDirective 32 (A_FromReg (General SixtyFour rax))))), 3)"
    "fetch 0x2be8 \<equiv> (Binary (IS_8088 Lea) (Reg (General SixtyFour rsi)) (Storage (Memory SixtyFour (A_Plus (A_FromReg (General SixtyFour rip)) (A_WordConstant 1474)))), 7)"
    "fetch 0x2bef \<equiv> (Binary (IS_8088 Mov) (Reg (General ThirtyTwo rdi)) (Immediate SixtyFour (ImmVal 1)), 5)"
    "fetch 0x2bf4 \<equiv> (Binary (IS_8088 Xor) (Reg (General ThirtyTwo rax)) (Storage (Reg (General ThirtyTwo rax))), 2)"
    "fetch 0x2bf6 \<equiv> (Unary (IS_8088 Call) (Immediate SixtyFour (ImmLabel ''__printf_chk'')), 5)"
    "fetch 0x2bfb \<equiv> (Binary (IS_8088 Mov) (Reg (General ThirtyTwo rax)) (Storage (Memory ThirtyTwo (A_SizeDirective 32 (A_Plus (A_FromReg (General SixtyFour r14)) (A_Minus (A_Mult 4 (A_FromReg (General SixtyFour rbx))) (A_WordConstant 4)))))), 5)"
    "fetch 0x2c00 \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour r13)) (Storage (Memory SixtyFour (A_SizeDirective 64 (A_Plus (A_FromReg (General SixtyFour rbp)) (A_WordConstant 0))))), 4)"
    "fetch 0x2c04 \<equiv> (Binary (IS_8088 Mov) (Memory ThirtyTwo (A_SizeDirective 32 (A_Plus (A_FromReg (General SixtyFour rsp)) (A_WordConstant 8)))) (Storage (Reg (General ThirtyTwo rax))), 4)"
    "fetch 0x2c08 \<equiv> (Binary (IS_8088 Test) (Reg (General SixtyFour r13)) (Storage (Reg (General SixtyFour r13))), 3)"
    "fetch 0x2c0b \<equiv> (Unary (IS_8088 Je) (Immediate SixtyFour (ImmVal 11488)), 6)"
    "fetch 0x2c11 \<equiv> (Binary (IS_8088 Xor) (Reg (General ThirtyTwo r15)) (Storage (Reg (General ThirtyTwo r15))), 3)"
    "fetch 0x2c14 \<equiv> (Unary (IS_8088 Jmp) (Immediate SixtyFour (ImmVal 11325)), 2)"
    "fetch 0x2c16 \<equiv> (Unary (IS_8088 Nop) (Storage (Memory Sixteen (A_SizeDirective 16 (A_Plus (A_FromReg (General SixtyFour cs)) (A_Plus (A_FromReg (General SixtyFour rax)) (A_Plus (A_Mult 1 (A_FromReg (General SixtyFour rax))) (A_WordConstant 0))))))), 10)"
    "fetch 0x2c20 \<equiv> (Binary (IS_8088 Lea) (Reg (General SixtyFour rsi)) (Storage (Memory SixtyFour (A_Plus (A_FromReg (General SixtyFour rip)) (A_WordConstant 1408)))), 7)"
    "fetch 0x2c27 \<equiv> (Binary (IS_8088 Mov) (Reg (General ThirtyTwo rdi)) (Immediate SixtyFour (ImmVal 1)), 5)"
    "fetch 0x2c2c \<equiv> (Binary (IS_8088 Xor) (Reg (General ThirtyTwo rax)) (Storage (Reg (General ThirtyTwo rax))), 2)"
    "fetch 0x2c2e \<equiv> (Unary (IS_8088 Call) (Immediate SixtyFour (ImmLabel ''__printf_chk'')), 5)"
    "fetch 0x2c33 \<equiv> (Binary (IS_8088 Add) (Reg (General SixtyFour r15)) (Immediate SixtyFour (ImmVal 1)), 4)"
    "fetch 0x2c37 \<equiv> (Binary (IS_8088 Cmp) (Reg (General SixtyFour r15)) (Immediate SixtyFour (ImmVal 32)), 4)"
    "fetch 0x2c3b \<equiv> (Unary (IS_8088 Je) (Immediate SixtyFour (ImmVal 11392)), 2)"
    "fetch 0x2c3d \<equiv> (Binary (IS_8088 Mov) (Reg (General ThirtyTwo rax)) (Immediate SixtyFour (ImmVal 1)), 5)"
    "fetch 0x2c42 \<equiv> (Binary (IS_8088 Mov) (Reg (General ThirtyTwo rcx)) (Storage (Reg (General ThirtyTwo r15))), 3)"
    "fetch 0x2c45 \<equiv> (Binary (IS_8088 Shl) (Reg (General ThirtyTwo rax)) (Storage (Reg (General Eight rcx))), 2)"
    "fetch 0x2c47 \<equiv> (Binary (IS_8088 Test) (Memory ThirtyTwo (A_SizeDirective 32 (A_Plus (A_FromReg (General SixtyFour rsp)) (A_WordConstant 8)))) (Storage (Reg (General ThirtyTwo rax))), 4)"
    "fetch 0x2c4b \<equiv> (Unary (IS_8088 Je) (Immediate SixtyFour (ImmVal 11315)), 2)"
    "fetch 0x2c4d \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour rdx)) (Storage (Memory SixtyFour (A_SizeDirective 64 (A_Plus (A_FromReg (General SixtyFour r13)) (A_Plus (A_Mult 8 (A_FromReg (General SixtyFour r15))) (A_WordConstant 0)))))), 5)"
    "fetch 0x2c52 \<equiv> (Binary (IS_8088 Test) (Reg (General SixtyFour rdx)) (Storage (Reg (General SixtyFour rdx))), 3)"
    "fetch 0x2c55 \<equiv> (Unary (IS_8088 Jne) (Immediate SixtyFour (ImmVal 11296)), 2)"
    "fetch 0x2c57 \<equiv> (Binary (IS_8088 Mov) (Reg (General ThirtyTwo rdx)) (Storage (Reg (General ThirtyTwo r15))), 3)"
    "fetch 0x2c5a \<equiv> (Binary (IS_8088 Lea) (Reg (General SixtyFour rsi)) (Storage (Memory SixtyFour (A_Plus (A_FromReg (General SixtyFour rip)) (A_WordConstant 1354)))), 7)"
    "fetch 0x2c61 \<equiv> (Binary (IS_8088 Mov) (Reg (General ThirtyTwo rdi)) (Immediate SixtyFour (ImmVal 1)), 5)"
    "fetch 0x2c66 \<equiv> (Binary (IS_8088 Xor) (Reg (General ThirtyTwo rax)) (Storage (Reg (General ThirtyTwo rax))), 2)"
    "fetch 0x2c68 \<equiv> (Unary (IS_8088 Call) (Immediate SixtyFour (ImmLabel ''__printf_chk'')), 5)"
    "fetch 0x2c6d \<equiv> (Binary (IS_8088 Add) (Reg (General SixtyFour r15)) (Immediate SixtyFour (ImmVal 1)), 4)"
    "fetch 0x2c71 \<equiv> (Binary (IS_8088 Cmp) (Reg (General SixtyFour r15)) (Immediate SixtyFour (ImmVal 32)), 4)"
    "fetch 0x2c75 \<equiv> (Unary (IS_8088 Jne) (Immediate SixtyFour (ImmVal 11325)), 2)"
    "fetch 0x2c77 \<equiv> (Unary (IS_8088 Nop) (Storage (Memory Sixteen (A_SizeDirective 16 (A_Plus (A_FromReg (General SixtyFour rax)) (A_Plus (A_Mult 1 (A_FromReg (General SixtyFour rax))) (A_WordConstant 0)))))), 9)"
    "fetch 0x2c80 \<equiv> (Binary (IS_8088 Mov) (Reg (General ThirtyTwo rdi)) (Immediate SixtyFour (ImmVal 10)), 5)"
    "fetch 0x2c85 \<equiv> (Binary (IS_8088 Add) (Reg (General SixtyFour rbx)) (Immediate SixtyFour (ImmVal 1)), 4)"
    "fetch 0x2c89 \<equiv> (Binary (IS_8088 Add) (Reg (General SixtyFour rbp)) (Immediate SixtyFour (ImmVal 24)), 4)"
    "fetch 0x2c8d \<equiv> (Unary (IS_8088 Call) (Immediate SixtyFour (ImmLabel ''putchar'')), 5)"
    "fetch 0x2c92 \<equiv> (Binary (IS_8088 Cmp) (Memory ThirtyTwo (A_SizeDirective 32 (A_Plus (A_FromReg (General SixtyFour rsp)) (A_WordConstant 12)))) (Storage (Reg (General ThirtyTwo r12))), 5)"
    "fetch 0x2c97 \<equiv> (Unary (IS_8088 Jbe) (Immediate SixtyFour (ImmVal 11472)), 2)"
    "fetch 0x2c99 \<equiv> (Binary (IS_8088 Cmp) (Reg (General ThirtyTwo r12)) (Immediate SixtyFour (ImmVal 9)), 4)"
    "fetch 0x2c9d \<equiv> (Unary (IS_8088 Ja) (Immediate SixtyFour (ImmVal 11472)), 2)"
    "fetch 0x2c9f \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour rcx)) (Storage (Memory SixtyFour (A_SizeDirective 64 (A_Minus (A_FromReg (General SixtyFour rbp)) (A_WordConstant 16))))), 4)"
    "fetch 0x2ca3 \<equiv> (Binary (IS_8088 Mov) (Reg (General ThirtyTwo r12)) (Storage (Reg (General ThirtyTwo rbx))), 3)"
    "fetch 0x2ca6 \<equiv> (Binary (IS_8088 Lea) (Reg (General ThirtyTwo rdx)) (Storage (Memory SixtyFour (A_Minus (A_FromReg (General SixtyFour rbx)) (A_WordConstant 1)))), 3)"
    "fetch 0x2ca9 \<equiv> (Binary (IS_8088 Test) (Reg (General SixtyFour rcx)) (Storage (Reg (General SixtyFour rcx))), 3)"
    "fetch 0x2cac \<equiv> (Unary (IS_8088 Jne) (Immediate SixtyFour (ImmVal 11240)), 6)"
    "fetch 0x2cb2 \<equiv> (Binary (IS_8088 Lea) (Reg (General SixtyFour rcx)) (Storage (Memory SixtyFour (A_Plus (A_FromReg (General SixtyFour rip)) (A_WordConstant 1287)))), 7)"
    "fetch 0x2cb9 \<equiv> (Binary (IS_8088 Lea) (Reg (General SixtyFour rsi)) (Storage (Memory SixtyFour (A_Plus (A_FromReg (General SixtyFour rip)) (A_WordConstant 1265)))), 7)"
    "fetch 0x2cc0 \<equiv> (Binary (IS_8088 Mov) (Reg (General ThirtyTwo rdi)) (Immediate SixtyFour (ImmVal 1)), 5)"
    "fetch 0x2cc5 \<equiv> (Binary (IS_8088 Xor) (Reg (General ThirtyTwo rax)) (Storage (Reg (General ThirtyTwo rax))), 2)"
    "fetch 0x2cc7 \<equiv> (Unary (IS_8088 Call) (Immediate SixtyFour (ImmLabel ''__printf_chk'')), 5)"
    "fetch 0x2ccc \<equiv> (Unary (IS_8088 Jmp) (Immediate SixtyFour (ImmVal 11392)), 2)"
    "fetch 0x2cce \<equiv> (Binary (IS_8088 Xchg) (Reg (General Sixteen rax)) (Storage (Reg (General Sixteen rax))), 2)"
    "fetch 0x2cd0 \<equiv> (Binary (IS_8088 Add) (Reg (General SixtyFour rsp)) (Immediate SixtyFour (ImmVal 24)), 4)"
    "fetch 0x2cd4 \<equiv> (Unary (IS_8088 Pop) (Storage (Reg (General SixtyFour rbx))), 1)"
    "fetch 0x2cd5 \<equiv> (Unary (IS_8088 Pop) (Storage (Reg (General SixtyFour rbp))), 1)"
    "fetch 0x2cd6 \<equiv> (Unary (IS_8088 Pop) (Storage (Reg (General SixtyFour r12))), 2)"
    "fetch 0x2cd8 \<equiv> (Unary (IS_8088 Pop) (Storage (Reg (General SixtyFour r13))), 2)"
    "fetch 0x2cda \<equiv> (Unary (IS_8088 Pop) (Storage (Reg (General SixtyFour r14))), 2)"
    "fetch 0x2cdc \<equiv> (Unary (IS_8088 Pop) (Storage (Reg (General SixtyFour r15))), 2)"
    "fetch 0x2cde \<equiv> (Nullary (IS_8088 Ret), 1)"
    "fetch 0x2cdf \<equiv> (Nullary (IS_8088 Nop), 1)"
    "fetch 0x2ce0 \<equiv> (Binary (IS_8088 Lea) (Reg (General SixtyFour rsi)) (Storage (Memory SixtyFour (A_Plus (A_FromReg (General SixtyFour rip)) (A_WordConstant 1211)))), 7)"
    "fetch 0x2ce7 \<equiv> (Binary (IS_8088 Mov) (Reg (General ThirtyTwo rdi)) (Immediate SixtyFour (ImmVal 1)), 5)"
    "fetch 0x2cec \<equiv> (Binary (IS_8088 Xor) (Reg (General ThirtyTwo rax)) (Storage (Reg (General ThirtyTwo rax))), 2)"
    "fetch 0x2cee \<equiv> (Unary (IS_8088 Call) (Immediate SixtyFour (ImmLabel ''__printf_chk'')), 5)"
    "fetch 0x2cf3 \<equiv> (Unary (IS_8088 Jmp) (Immediate SixtyFour (ImmVal 11392)), 2)"
    "fetch 0x2cf5 \<equiv> (Unary (IS_8088 Nop) (Storage (Memory Sixteen (A_SizeDirective 16 (A_Plus (A_FromReg (General SixtyFour cs)) (A_Plus (A_FromReg (General SixtyFour rax)) (A_Plus (A_Mult 1 (A_FromReg (General SixtyFour rax))) (A_WordConstant 0))))))), 10)"
    and \<alpha>_def: \<open>\<alpha> = \<lparr>text_sections = [], data_sections = [], labels_to_offsets = [], binary_offset = 0\<rparr>\<close>
    and printf_chk\<^sub>a\<^sub>d\<^sub>d\<^sub>r[simp]: \<open>the (label_to_address \<alpha> ''__printf_chk'') = printf_chk_addr\<close>
    and putchar\<^sub>a\<^sub>d\<^sub>d\<^sub>r[simp]: \<open>the (label_to_address \<alpha> ''putchar'') = putchar_addr\<close>
begin

text \<open>Using definitions that don't get unfolded immediately prevents locale argument issues.\<close>
definition \<open>printf_chk_0x2b68_retval \<equiv> printf_chk_0x2b68_retval\<^sub>v\<close>
definition \<open>printf_chk_0x2bac_retval \<equiv> printf_chk_0x2bac_retval\<^sub>v\<close>
definition \<open>printf_chk_0x2bf6_retval \<equiv> printf_chk_0x2bf6_retval\<^sub>v\<close>
definition \<open>printf_chk_0x2c2e_retval \<equiv> printf_chk_0x2c2e_retval\<^sub>v\<close>
definition \<open>printf_chk_0x2c68_retval \<equiv> printf_chk_0x2c68_retval\<^sub>v\<close>
definition \<open>putchar_0x2c8d_retval \<equiv> putchar_0x2c8d_retval\<^sub>v\<close>
definition \<open>printf_chk_0x2cc7_retval \<equiv> printf_chk_0x2cc7_retval\<^sub>v\<close>
definition \<open>printf_chk_0x2cee_retval \<equiv> printf_chk_0x2cee_retval\<^sub>v\<close>

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

locale "decode_featureset" = "xen_cpuid" +
  fixes RAX\<^sub>0\<^sub>v RBX\<^sub>0\<^sub>v RCX\<^sub>0\<^sub>v RDX\<^sub>0\<^sub>v RDI\<^sub>0\<^sub>v RSI\<^sub>0\<^sub>v RSP\<^sub>0\<^sub>v RBP\<^sub>0\<^sub>v R15\<^sub>0\<^sub>v R14\<^sub>0\<^sub>v R13\<^sub>0\<^sub>v R12\<^sub>0\<^sub>v ret_address\<^sub>v :: \<open>64 word\<close>
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
definition \<open>ret_address \<equiv> ret_address\<^sub>v\<close>

definition P_0x2b40_0 :: state_pred where
  \<open>P_0x2b40_0 \<sigma> \<equiv> RIP \<sigma> = 0x2b40 \<and> RAX \<sigma> = RAX\<^sub>0 \<and> RBX \<sigma> = RBX\<^sub>0 \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = RDX\<^sub>0 \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = RSP\<^sub>0 \<and> RBP \<sigma> = RBP\<^sub>0 \<and> R15 \<sigma> = R15\<^sub>0 \<and> R14 \<sigma> = R14\<^sub>0 \<and> R13 \<sigma> = R13\<^sub>0 \<and> R12 \<sigma> = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address\<close>
declare P_0x2b40_0_def[Ps]

definition P_0x2b40_0_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x2b40_0_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (2, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x3c), 4)
  }\<close>

definition P_0x2b40_0_regions :: state_pred where
  \<open>P_0x2b40_0_regions \<sigma> \<equiv> \<exists>regions. P_0x2b40_0_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x2b68_0 :: state_pred where
  \<open>Q_0x2b68_0 \<sigma> \<equiv> RIP \<sigma> = 0x2b68 \<and> RAX \<sigma> = 0x0 \<and> RBX \<sigma> = ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)) \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = RDX\<^sub>0 \<and> RDI \<sigma> = 0x1 \<and> RSI \<sigma> = 0x318d \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x48) \<and> RBP \<sigma> = RBP\<^sub>0 \<and> R15 \<sigma> = R15\<^sub>0 \<and> R14 \<sigma> = RDI\<^sub>0 \<and> R13 \<sigma> = ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)) \<and> R12 \<sigma> = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x3c),4]::32 word) = ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word))\<close>
declare Q_0x2b68_0_def[Qs]

schematic_goal decode_featureset_0_14_0x2b40_0x2b61_0[blocks]:
  assumes \<open>(P_0x2b40_0 && P_0x2b40_0_regions) \<sigma>\<close>
  shows \<open>exec_block 14 0x2b61 0 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x2b68_0 ?\<sigma> \<and> block_usage P_0x2b40_0_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x2b40_0_def P_0x2b40_0_regions_def post: Q_0x2b68_0_def regionset: P_0x2b40_0_regions_set_def)

definition P_0x2b68_1 :: state_pred where
  \<open>P_0x2b68_1 \<sigma> \<equiv> RIP \<sigma> = 0x2b68 \<and> RAX \<sigma> = 0x0 \<and> RBX \<sigma> = ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)) \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = RDX\<^sub>0 \<and> RDI \<sigma> = 0x1 \<and> RSI \<sigma> = 0x318d \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x48) \<and> RBP \<sigma> = RBP\<^sub>0 \<and> R15 \<sigma> = R15\<^sub>0 \<and> R14 \<sigma> = RDI\<^sub>0 \<and> R13 \<sigma> = ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)) \<and> R12 \<sigma> = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x3c),4]::32 word) = ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word))\<close>
declare P_0x2b68_1_def[Ps]

definition P_0x2b68_1_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x2b68_1_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (2, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x3c), 4),
    (8, ((RSP\<^sub>0::64 word) - 0x50), 8)
  }\<close>

definition P_0x2b68_1_regions :: state_pred where
  \<open>P_0x2b68_1_regions \<sigma> \<equiv> \<exists>regions. P_0x2b68_1_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_printf_chk_addr_0x2b68_1 :: state_pred where
  \<open>Q_printf_chk_addr_0x2b68_1 \<sigma> \<equiv> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x50) \<and> RIP \<sigma> = printf_chk_addr \<and> RAX \<sigma> = 0x0 \<and> RBX \<sigma> = ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)) \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = RDX\<^sub>0 \<and> RDI \<sigma> = 0x1 \<and> RSI \<sigma> = 0x318d \<and> RBP \<sigma> = RBP\<^sub>0 \<and> R15 \<sigma> = R15\<^sub>0 \<and> R14 \<sigma> = RDI\<^sub>0 \<and> R13 \<sigma> = ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)) \<and> R12 \<sigma> = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x3c),4]::32 word) = ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),8]::64 word) = 0x2b6d\<close>
declare Q_printf_chk_addr_0x2b68_1_def[Qs]

schematic_goal decode_featureset_0_1_0x2b68_0x2b68_1[blocks]:
  assumes \<open>(P_0x2b68_1 && P_0x2b68_1_regions) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x2b68 (Suc 0) \<sigma> \<triangleq> ?\<sigma> \<and> Q_printf_chk_addr_0x2b68_1 ?\<sigma> \<and> block_usage P_0x2b68_1_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x2b68_1_def P_0x2b68_1_regions_def post: Q_printf_chk_addr_0x2b68_1_def regionset: P_0x2b68_1_regions_set_def)

definition P_0x2b6d_2 :: state_pred where
  \<open>P_0x2b6d_2 \<sigma> \<equiv> RIP \<sigma> = 0x2b6d \<and> RAX \<sigma> = printf_chk_0x2b68_retval \<and> RBX \<sigma> = ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)) \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = RDX\<^sub>0 \<and> RDI \<sigma> = 0x1 \<and> RSI \<sigma> = 0x318d \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x48) \<and> RBP \<sigma> = RBP\<^sub>0 \<and> R15 \<sigma> = R15\<^sub>0 \<and> R14 \<sigma> = RDI\<^sub>0 \<and> R13 \<sigma> = ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)) \<and> R12 \<sigma> = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x3c),4]::32 word) = ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),8]::64 word) = 0x2b6d\<close>
declare P_0x2b6d_2_def[Ps]

definition P_0x2b6d_2_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x2b6d_2_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (2, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x3c), 4),
    (8, ((RSP\<^sub>0::64 word) - 0x50), 8)
  }\<close>

definition P_0x2b6d_2_regions :: state_pred where
  \<open>P_0x2b6d_2_regions \<sigma> \<equiv> \<exists>regions. P_0x2b6d_2_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x2b6f_2 :: state_pred where
  \<open>Q_0x2b6f_2 \<sigma> \<equiv> RIP \<sigma> = 0x2b6f \<and> RAX \<sigma> = printf_chk_0x2b68_retval \<and> RBX \<sigma> = ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)) \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = RDX\<^sub>0 \<and> RDI \<sigma> = 0x1 \<and> RSI \<sigma> = 0x318d \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x48) \<and> RBP \<sigma> = RBP\<^sub>0 \<and> R15 \<sigma> = R15\<^sub>0 \<and> R14 \<sigma> = RDI\<^sub>0 \<and> R13 \<sigma> = ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)) \<and> R12 \<sigma> = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x3c),4]::32 word) = ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),8]::64 word) = 0x2b6d\<close>
declare Q_0x2b6f_2_def[Qs]

schematic_goal decode_featureset_0_1_0x2b6d_0x2b6d_2[blocks]:
  assumes \<open>(P_0x2b6d_2 && P_0x2b6d_2_regions) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x2b6d 2 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x2b6f_2 ?\<sigma> \<and> block_usage P_0x2b6d_2_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x2b6d_2_def P_0x2b6d_2_regions_def post: Q_0x2b6f_2_def regionset: P_0x2b6d_2_regions_set_def)

definition P_0x2b6f_true_3 :: state_pred where
  \<open>P_0x2b6f_true_3 \<sigma> \<equiv> RIP \<sigma> = 0x2b6f \<and> RAX \<sigma> = printf_chk_0x2b68_retval \<and> RBX \<sigma> = ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)) \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = RDX\<^sub>0 \<and> RDI \<sigma> = 0x1 \<and> RSI \<sigma> = 0x318d \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x48) \<and> RBP \<sigma> = RBP\<^sub>0 \<and> R15 \<sigma> = R15\<^sub>0 \<and> R14 \<sigma> = RDI\<^sub>0 \<and> R13 \<sigma> = ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)) \<and> R12 \<sigma> = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x3c),4]::32 word) = ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),8]::64 word) = 0x2b6d\<close>
declare P_0x2b6f_true_3_def[Ps]

definition P_0x2b6f_true_3_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x2b6f_true_3_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (2, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x3c), 4),
    (8, ((RSP\<^sub>0::64 word) - 0x50), 8)
  }\<close>

definition P_0x2b6f_true_3_regions :: state_pred where
  \<open>P_0x2b6f_true_3_regions \<sigma> \<equiv> \<exists>regions. P_0x2b6f_true_3_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x2cd0_3 :: state_pred where
  \<open>Q_0x2cd0_3 \<sigma> \<equiv> RIP \<sigma> = 0x2cd0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x48) \<and> R14 \<sigma> = RDI\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x3c),4]::32 word) = ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word))\<close>
declare Q_0x2cd0_3_def[Qs]

schematic_goal decode_featureset_0_1_0x2b6f_0x2b6f_3[blocks]:
  assumes \<open>(P_0x2b6f_true_3 && P_0x2b6f_true_3_regions && ZF) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x2b6f 3 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x2cd0_3 ?\<sigma> \<and> block_usage P_0x2b6f_true_3_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x2b6f_true_3_def P_0x2b6f_true_3_regions_def post: Q_0x2cd0_3_def regionset: P_0x2b6f_true_3_regions_set_def)

definition P_0x2b6f_false_4 :: state_pred where
  \<open>P_0x2b6f_false_4 \<sigma> \<equiv> RIP \<sigma> = 0x2b6f \<and> RAX \<sigma> = printf_chk_0x2b68_retval \<and> RBX \<sigma> = ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)) \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = RDX\<^sub>0 \<and> RDI \<sigma> = 0x1 \<and> RSI \<sigma> = 0x318d \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x48) \<and> RBP \<sigma> = RBP\<^sub>0 \<and> R15 \<sigma> = R15\<^sub>0 \<and> R14 \<sigma> = RDI\<^sub>0 \<and> R13 \<sigma> = ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)) \<and> R12 \<sigma> = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x3c),4]::32 word) = ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),8]::64 word) = 0x2b6d\<close>
declare P_0x2b6f_false_4_def[Ps]

definition P_0x2b6f_false_4_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x2b6f_false_4_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (2, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x3c), 4),
    (8, ((RSP\<^sub>0::64 word) - 0x50), 8)
  }\<close>

definition P_0x2b6f_false_4_regions :: state_pred where
  \<open>P_0x2b6f_false_4_regions \<sigma> \<equiv> \<exists>regions. P_0x2b6f_false_4_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x2b93_4 :: state_pred where
  \<open>Q_0x2b93_4 \<sigma> \<equiv> RIP \<sigma> = 0x2b93 \<and> RBX \<sigma> = ucast ((\<langle>31,0\<rangle>((ucast (((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word))::64 word) - (0x1::64 word))::32 word)) \<and> RDI \<sigma> = 0x1 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x48) \<and> RBP \<sigma> = 0x319b \<and> R14 \<sigma> = RDI\<^sub>0 \<and> R13 \<sigma> = ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)) \<and> R12 \<sigma> = ucast ((\<langle>31,0\<rangle>((ucast (((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word))::64 word) - (0x1::64 word))::32 word)) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x3c),4]::32 word) = ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word))\<close>
declare Q_0x2b93_4_def[Qs]

schematic_goal decode_featureset_0_6_0x2b6f_0x2b86_4[blocks]:
  assumes \<open>(P_0x2b6f_false_4 && P_0x2b6f_false_4_regions && ! ZF) \<sigma>\<close>
  shows \<open>exec_block 6 0x2b86 4 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x2b93_4 ?\<sigma> \<and> block_usage P_0x2b6f_false_4_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x2b6f_false_4_def P_0x2b6f_false_4_regions_def post: Q_0x2b93_4_def regionset: P_0x2b6f_false_4_regions_set_def)

definition P_0x2b93_5 :: state_pred where
  \<open>P_0x2b93_5 \<sigma> \<equiv> RIP \<sigma> = 0x2b93 \<and> RBX \<sigma> = ucast ((\<langle>31,0\<rangle>((ucast (((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word))::64 word) - (0x1::64 word))::32 word)) \<and> RDI \<sigma> = 0x1 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x48) \<and> RBP \<sigma> = 0x319b \<and> R14 \<sigma> = RDI\<^sub>0 \<and> R13 \<sigma> = ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)) \<and> R12 \<sigma> = ucast ((\<langle>31,0\<rangle>((ucast (((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word))::64 word) - (0x1::64 word))::32 word)) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x3c),4]::32 word) = ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word))\<close>
declare P_0x2b93_5_def[Ps]

definition P_0x2b93_5_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x2b93_5_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((RDI\<^sub>0::64 word) + (\<langle>63,0\<rangle>((R15 \<sigma>::64 word) * 0x4)::64 word)), 4),
    (2, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x3c), 4)
  }\<close>

definition P_0x2b93_5_regions :: state_pred where
  \<open>P_0x2b93_5_regions \<sigma> \<equiv> \<exists>regions. P_0x2b93_5_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x2bac_5 :: state_pred where
  \<open>Q_0x2bac_5 \<sigma> \<equiv> RIP \<sigma> = 0x2bac \<and> RAX \<sigma> = 0x0 \<and> RBX \<sigma> = ucast ((\<langle>31,0\<rangle>((ucast (((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word))::64 word) - (0x1::64 word))::32 word)) \<and> RDX \<sigma> = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + (\<langle>63,0\<rangle>((R15 \<sigma>::64 word) * 0x4)::64 word)),4]::32 word)) \<and> RDI \<sigma> = 0x1 \<and> RSI \<sigma> = 0x319b \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x48) \<and> RBP \<sigma> = 0x319b \<and> R14 \<sigma> = RDI\<^sub>0 \<and> R13 \<sigma> = ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)) \<and> R12 \<sigma> = ucast ((\<langle>31,0\<rangle>((ucast (((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word))::64 word) - (0x1::64 word))::32 word)) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + (\<langle>63,0\<rangle>((R15 \<sigma>::64 word) * 0x4)::64 word)),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + (\<langle>63,0\<rangle>((R15 \<sigma>::64 word) * 0x4)::64 word)),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x3c),4]::32 word) = ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word))\<close>
declare Q_0x2bac_5_def[Qs]

schematic_goal decode_featureset_0_8_0x2b93_0x2ba9_5[blocks]:
  assumes \<open>(P_0x2b93_5 && P_0x2b93_5_regions) \<sigma>\<close>
  shows \<open>exec_block 8 0x2ba9 5 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x2bac_5 ?\<sigma> \<and> block_usage P_0x2b93_5_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x2b93_5_def P_0x2b93_5_regions_def post: Q_0x2bac_5_def regionset: P_0x2b93_5_regions_set_def)

definition P_0x2bac_6 :: state_pred where
  \<open>P_0x2bac_6 \<sigma> \<equiv> RIP \<sigma> = 0x2bac \<and> RAX \<sigma> = 0x0 \<and> RBX \<sigma> = ucast ((\<langle>31,0\<rangle>((ucast (((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word))::64 word) - (0x1::64 word))::32 word)) \<and> RDX \<sigma> = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + (\<langle>63,0\<rangle>((R15 \<sigma>::64 word) * 0x4)::64 word)),4]::32 word)) \<and> RDI \<sigma> = 0x1 \<and> RSI \<sigma> = 0x319b \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x48) \<and> RBP \<sigma> = 0x319b \<and> R14 \<sigma> = RDI\<^sub>0 \<and> R13 \<sigma> = ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)) \<and> R12 \<sigma> = ucast ((\<langle>31,0\<rangle>((ucast (((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word))::64 word) - (0x1::64 word))::32 word)) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + (\<langle>63,0\<rangle>((R15 \<sigma>::64 word) * 0x4)::64 word)),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + (\<langle>63,0\<rangle>((R15 \<sigma>::64 word) * 0x4)::64 word)),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x3c),4]::32 word) = ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word))\<close>
declare P_0x2bac_6_def[Ps]

definition P_0x2bac_6_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x2bac_6_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((RDI\<^sub>0::64 word) + (\<langle>63,0\<rangle>((R15 \<sigma>::64 word) * 0x4)::64 word)), 4),
    (2, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x3c), 4),
    (9, ((RSP\<^sub>0::64 word) - 0x50), 8)
  }\<close>

definition P_0x2bac_6_regions :: state_pred where
  \<open>P_0x2bac_6_regions \<sigma> \<equiv> \<exists>regions. P_0x2bac_6_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_printf_chk_addr_0x2bac_6 :: state_pred where
  \<open>Q_printf_chk_addr_0x2bac_6 \<sigma> \<equiv> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x50) \<and> RIP \<sigma> = printf_chk_addr \<and> RAX \<sigma> = 0x0 \<and> RBX \<sigma> = ucast ((\<langle>31,0\<rangle>((ucast (((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word))::64 word) - (0x1::64 word))::32 word)) \<and> RDX \<sigma> = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + (\<langle>63,0\<rangle>((R15 \<sigma>::64 word) * 0x4)::64 word)),4]::32 word)) \<and> RDI \<sigma> = 0x1 \<and> RSI \<sigma> = 0x319b \<and> RBP \<sigma> = 0x319b \<and> R14 \<sigma> = RDI\<^sub>0 \<and> R13 \<sigma> = ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)) \<and> R12 \<sigma> = ucast ((\<langle>31,0\<rangle>((ucast (((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word))::64 word) - (0x1::64 word))::32 word)) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + (\<langle>63,0\<rangle>((R15 \<sigma>::64 word) * 0x4)::64 word)),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + (\<langle>63,0\<rangle>((R15 \<sigma>::64 word) * 0x4)::64 word)),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x3c),4]::32 word) = ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),8]::64 word) = 0x2bb1\<close>
declare Q_printf_chk_addr_0x2bac_6_def[Qs]

schematic_goal decode_featureset_0_1_0x2bac_0x2bac_6[blocks]:
  assumes \<open>(P_0x2bac_6 && P_0x2bac_6_regions) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x2bac 6 \<sigma> \<triangleq> ?\<sigma> \<and> Q_printf_chk_addr_0x2bac_6 ?\<sigma> \<and> block_usage P_0x2bac_6_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x2bac_6_def P_0x2bac_6_regions_def post: Q_printf_chk_addr_0x2bac_6_def regionset: P_0x2bac_6_regions_set_def)

definition P_0x2bb1_7 :: state_pred where
  \<open>P_0x2bb1_7 \<sigma> \<equiv> RIP \<sigma> = 0x2bb1 \<and> RAX \<sigma> = printf_chk_0x2bac_retval \<and> RBX \<sigma> = ucast ((\<langle>31,0\<rangle>((ucast (((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word))::64 word) - (0x1::64 word))::32 word)) \<and> RDX \<sigma> = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + (\<langle>63,0\<rangle>((R15 \<sigma>::64 word) * 0x4)::64 word)),4]::32 word)) \<and> RDI \<sigma> = 0x1 \<and> RSI \<sigma> = 0x319b \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x48) \<and> RBP \<sigma> = 0x319b \<and> R14 \<sigma> = RDI\<^sub>0 \<and> R13 \<sigma> = ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)) \<and> R12 \<sigma> = ucast ((\<langle>31,0\<rangle>((ucast (((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word))::64 word) - (0x1::64 word))::32 word)) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + (\<langle>63,0\<rangle>((R15 \<sigma>::64 word) * 0x4)::64 word)),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + (\<langle>63,0\<rangle>((R15 \<sigma>::64 word) * 0x4)::64 word)),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x3c),4]::32 word) = ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),8]::64 word) = 0x2bb1\<close>
declare P_0x2bb1_7_def[Ps]

definition P_0x2bb1_7_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x2bb1_7_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((RDI\<^sub>0::64 word) + (\<langle>63,0\<rangle>((R15 \<sigma>::64 word) * 0x4)::64 word)), 4),
    (2, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x3c), 4),
    (9, ((RSP\<^sub>0::64 word) - 0x50), 8)
  }\<close>

definition P_0x2bb1_7_regions :: state_pred where
  \<open>P_0x2bb1_7_regions \<sigma> \<equiv> \<exists>regions. P_0x2bb1_7_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x2bb8_7 :: state_pred where
  \<open>Q_0x2bb8_7 \<sigma> \<equiv> RIP \<sigma> = 0x2bb8 \<and> RAX \<sigma> = ((R15 \<sigma>::64 word) + 0x1) \<and> RBX \<sigma> = ucast ((\<langle>31,0\<rangle>((ucast (((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word))::64 word) - (0x1::64 word))::32 word)) \<and> RDX \<sigma> = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + (\<langle>63,0\<rangle>((R15 \<sigma>::64 word) * 0x4)::64 word)),4]::32 word)) \<and> RDI \<sigma> = 0x1 \<and> RSI \<sigma> = 0x319b \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x48) \<and> RBP \<sigma> = 0x319b \<and> R14 \<sigma> = RDI\<^sub>0 \<and> R13 \<sigma> = ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)) \<and> R12 \<sigma> = ucast ((\<langle>31,0\<rangle>((ucast (((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word))::64 word) - (0x1::64 word))::32 word)) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + (\<langle>63,0\<rangle>((R15 \<sigma>::64 word) * 0x4)::64 word)),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + (\<langle>63,0\<rangle>((R15 \<sigma>::64 word) * 0x4)::64 word)),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x3c),4]::32 word) = ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),8]::64 word) = 0x2bb1\<close>
declare Q_0x2bb8_7_def[Qs]

schematic_goal decode_featureset_0_2_0x2bb1_0x2bb5_7[blocks]:
  assumes \<open>(P_0x2bb1_7 && P_0x2bb1_7_regions) \<sigma>\<close>
  shows \<open>exec_block 2 0x2bb5 7 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x2bb8_7 ?\<sigma> \<and> block_usage P_0x2bb1_7_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x2bb1_7_def P_0x2bb1_7_regions_def post: Q_0x2bb8_7_def regionset: P_0x2bb1_7_regions_set_def)

definition P_0x2bb8_true_8 :: state_pred where
  \<open>P_0x2bb8_true_8 \<sigma> \<equiv> RIP \<sigma> = 0x2bb8 \<and> RAX \<sigma> = ((R15 \<sigma>::64 word) + 0x1) \<and> RBX \<sigma> = ucast ((\<langle>31,0\<rangle>((ucast (((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word))::64 word) - (0x1::64 word))::32 word)) \<and> RDX \<sigma> = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + (\<langle>63,0\<rangle>((R15 \<sigma>::64 word) * 0x4)::64 word)),4]::32 word)) \<and> RDI \<sigma> = 0x1 \<and> RSI \<sigma> = 0x319b \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x48) \<and> RBP \<sigma> = 0x319b \<and> R14 \<sigma> = RDI\<^sub>0 \<and> R13 \<sigma> = ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)) \<and> R12 \<sigma> = ucast ((\<langle>31,0\<rangle>((ucast (((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word))::64 word) - (0x1::64 word))::32 word)) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + (\<langle>63,0\<rangle>((R15 \<sigma>::64 word) * 0x4)::64 word)),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + (\<langle>63,0\<rangle>((R15 \<sigma>::64 word) * 0x4)::64 word)),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x3c),4]::32 word) = ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),8]::64 word) = 0x2bb1\<close>
declare P_0x2bb8_true_8_def[Ps]

definition P_0x2bb8_true_8_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x2bb8_true_8_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((RDI\<^sub>0::64 word) + (\<langle>63,0\<rangle>((R15 \<sigma>::64 word) * 0x4)::64 word)), 4),
    (2, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x3c), 4),
    (9, ((RSP\<^sub>0::64 word) - 0x50), 8)
  }\<close>

definition P_0x2bb8_true_8_regions :: state_pred where
  \<open>P_0x2bb8_true_8_regions \<sigma> \<equiv> \<exists>regions. P_0x2bb8_true_8_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x2b93_8 :: state_pred where
  \<open>Q_0x2b93_8 \<sigma> \<equiv> RIP \<sigma> = 0x2b93 \<and> RBX \<sigma> = ucast ((\<langle>31,0\<rangle>((ucast (((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word))::64 word) - (0x1::64 word))::32 word)) \<and> RDI \<sigma> = 0x1 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x48) \<and> RBP \<sigma> = 0x319b \<and> R14 \<sigma> = RDI\<^sub>0 \<and> R13 \<sigma> = ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)) \<and> R12 \<sigma> = ucast ((\<langle>31,0\<rangle>((ucast (((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word))::64 word) - (0x1::64 word))::32 word)) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x3c),4]::32 word) = ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word))\<close>
declare Q_0x2b93_8_def[Qs]

schematic_goal decode_featureset_0_2_0x2bb8_0x2b90_8[blocks]:
  assumes \<open>(P_0x2bb8_true_8 && P_0x2bb8_true_8_regions && !ZF) \<sigma>\<close>
  shows \<open>exec_block 2 0x2b90 8 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x2b93_8 ?\<sigma> \<and> block_usage P_0x2bb8_true_8_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x2bb8_true_8_def P_0x2bb8_true_8_regions_def post: Q_0x2b93_8_def regionset: P_0x2bb8_true_8_regions_set_def)

definition P_0x2bb8_false_9 :: state_pred where
  \<open>P_0x2bb8_false_9 \<sigma> \<equiv> RIP \<sigma> = 0x2bb8 \<and> RAX \<sigma> = ((R15 \<sigma>::64 word) + 0x1) \<and> RBX \<sigma> = ucast ((\<langle>31,0\<rangle>((ucast (((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word))::64 word) - (0x1::64 word))::32 word)) \<and> RDX \<sigma> = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + (\<langle>63,0\<rangle>((R15 \<sigma>::64 word) * 0x4)::64 word)),4]::32 word)) \<and> RDI \<sigma> = 0x1 \<and> RSI \<sigma> = 0x319b \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x48) \<and> RBP \<sigma> = 0x319b \<and> R14 \<sigma> = RDI\<^sub>0 \<and> R13 \<sigma> = ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)) \<and> R12 \<sigma> = ucast ((\<langle>31,0\<rangle>((ucast (((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word))::64 word) - (0x1::64 word))::32 word)) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + (\<langle>63,0\<rangle>((R15 \<sigma>::64 word) * 0x4)::64 word)),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + (\<langle>63,0\<rangle>((R15 \<sigma>::64 word) * 0x4)::64 word)),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x3c),4]::32 word) = ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),8]::64 word) = 0x2bb1\<close>
declare P_0x2bb8_false_9_def[Ps]

definition P_0x2bb8_false_9_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x2bb8_false_9_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((RDI\<^sub>0::64 word) + (\<langle>63,0\<rangle>((R15 \<sigma>::64 word) * 0x4)::64 word)), 4),
    (2, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x3c), 4),
    (9, ((RSP\<^sub>0::64 word) - 0x50), 8)
  }\<close>

definition P_0x2bb8_false_9_regions :: state_pred where
  \<open>P_0x2bb8_false_9_regions \<sigma> \<equiv> \<exists>regions. P_0x2bb8_false_9_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x2bba_9 :: state_pred where
  \<open>Q_0x2bba_9 \<sigma> \<equiv> RIP \<sigma> = 0x2bba \<and> RBX \<sigma> = ucast ((\<langle>31,0\<rangle>((ucast (((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word))::64 word) - (0x1::64 word))::32 word)) \<and> RDI \<sigma> = 0x1 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x48) \<and> RBP \<sigma> = 0x319b \<and> R14 \<sigma> = RDI\<^sub>0 \<and> R13 \<sigma> = ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)) \<and> R12 \<sigma> = ucast ((\<langle>31,0\<rangle>((ucast (((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word))::64 word) - (0x1::64 word))::32 word)) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x3c),4]::32 word) = ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word))\<close>
declare Q_0x2bba_9_def[Qs]

schematic_goal decode_featureset_0_1_0x2bb8_0x2bb8_9[blocks]:
  assumes \<open>(P_0x2bb8_false_9 && P_0x2bb8_false_9_regions && ! !ZF) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x2bb8 9 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x2bba_9 ?\<sigma> \<and> block_usage P_0x2bb8_false_9_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x2bb8_false_9_def P_0x2bb8_false_9_regions_def post: Q_0x2bba_9_def regionset: P_0x2bb8_false_9_regions_set_def)

definition P_0x2bba_10 :: state_pred where
  \<open>P_0x2bba_10 \<sigma> \<equiv> RIP \<sigma> = 0x2bba \<and> RBX \<sigma> = ucast ((\<langle>31,0\<rangle>((ucast (((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word))::64 word) - (0x1::64 word))::32 word)) \<and> RDI \<sigma> = 0x1 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x48) \<and> RBP \<sigma> = 0x319b \<and> R14 \<sigma> = RDI\<^sub>0 \<and> R13 \<sigma> = ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)) \<and> R12 \<sigma> = ucast ((\<langle>31,0\<rangle>((ucast (((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word))::64 word) - (0x1::64 word))::32 word)) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x3c),4]::32 word) = ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word))\<close>
declare P_0x2bba_10_def[Ps]

definition P_0x2bba_10_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x2bba_10_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (2, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x3c), 4)
  }\<close>

definition P_0x2bba_10_regions :: state_pred where
  \<open>P_0x2bba_10_regions \<sigma> \<equiv> \<exists>regions. P_0x2bba_10_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x2bbd_10 :: state_pred where
  \<open>Q_0x2bbd_10 \<sigma> \<equiv> RIP \<sigma> = 0x2bbd \<and> RBX \<sigma> = ucast ((\<langle>31,0\<rangle>((ucast (((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word))::64 word) - (0x1::64 word))::32 word)) \<and> RDI \<sigma> = 0x1 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x48) \<and> RBP \<sigma> = 0x319b \<and> R14 \<sigma> = RDI\<^sub>0 \<and> R13 \<sigma> = ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)) \<and> R12 \<sigma> = ucast ((\<langle>31,0\<rangle>((ucast (((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word))::64 word) - (0x1::64 word))::32 word)) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x3c),4]::32 word) = ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word))\<close>
declare Q_0x2bbd_10_def[Qs]

schematic_goal decode_featureset_0_1_0x2bba_0x2bba_10[blocks]:
  assumes \<open>(P_0x2bba_10 && P_0x2bba_10_regions) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x2bba 10 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x2bbd_10 ?\<sigma> \<and> block_usage P_0x2bba_10_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x2bba_10_def P_0x2bba_10_regions_def post: Q_0x2bbd_10_def regionset: P_0x2bba_10_regions_set_def)

definition P_0x2bbd_true_11 :: state_pred where
  \<open>P_0x2bbd_true_11 \<sigma> \<equiv> RIP \<sigma> = 0x2bbd \<and> RBX \<sigma> = ucast ((\<langle>31,0\<rangle>((ucast (((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word))::64 word) - (0x1::64 word))::32 word)) \<and> RDI \<sigma> = 0x1 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x48) \<and> RBP \<sigma> = 0x319b \<and> R14 \<sigma> = RDI\<^sub>0 \<and> R13 \<sigma> = ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)) \<and> R12 \<sigma> = ucast ((\<langle>31,0\<rangle>((ucast (((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word))::64 word) - (0x1::64 word))::32 word)) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x3c),4]::32 word) = ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word))\<close>
declare P_0x2bbd_true_11_def[Ps]

definition P_0x2bbd_true_11_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x2bbd_true_11_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (2, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x3c), 4)
  }\<close>

definition P_0x2bbd_true_11_regions :: state_pred where
  \<open>P_0x2bbd_true_11_regions \<sigma> \<equiv> \<exists>regions. P_0x2bbd_true_11_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x2cd0_11 :: state_pred where
  \<open>Q_0x2cd0_11 \<sigma> \<equiv> RIP \<sigma> = 0x2cd0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x48) \<and> R14 \<sigma> = RDI\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x3c),4]::32 word) = ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word))\<close>
declare Q_0x2cd0_11_def[Qs]

schematic_goal decode_featureset_0_1_0x2bbd_0x2bbd_11[blocks]:
  assumes \<open>(P_0x2bbd_true_11 && P_0x2bbd_true_11_regions && ZF) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x2bbd 11 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x2cd0_11 ?\<sigma> \<and> block_usage P_0x2bbd_true_11_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x2bbd_true_11_def P_0x2bbd_true_11_regions_def post: Q_0x2cd0_11_def regionset: P_0x2bbd_true_11_regions_set_def)

definition P_0x2bbd_false_12 :: state_pred where
  \<open>P_0x2bbd_false_12 \<sigma> \<equiv> RIP \<sigma> = 0x2bbd \<and> RBX \<sigma> = ucast ((\<langle>31,0\<rangle>((ucast (((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word))::64 word) - (0x1::64 word))::32 word)) \<and> RDI \<sigma> = 0x1 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x48) \<and> RBP \<sigma> = 0x319b \<and> R14 \<sigma> = RDI\<^sub>0 \<and> R13 \<sigma> = ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)) \<and> R12 \<sigma> = ucast ((\<langle>31,0\<rangle>((ucast (((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word))::64 word) - (0x1::64 word))::32 word)) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x3c),4]::32 word) = ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word))\<close>
declare P_0x2bbd_false_12_def[Ps]

definition P_0x2bbd_false_12_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x2bbd_false_12_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (2, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x3c), 4)
  }\<close>

definition P_0x2bbd_false_12_regions :: state_pred where
  \<open>P_0x2bbd_false_12_regions \<sigma> \<equiv> \<exists>regions. P_0x2bbd_false_12_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x2bdf_12 :: state_pred where
  \<open>Q_0x2bdf_12 \<sigma> \<equiv> RIP \<sigma> = 0x2bdf \<and> RBX \<sigma> = 0x1 \<and> RCX \<sigma> = 0x317e \<and> RDX \<sigma> = 0x0 \<and> RDI \<sigma> = 0x1 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x48) \<and> RBP \<sigma> = 0x4c10 \<and> R14 \<sigma> = RDI\<^sub>0 \<and> R13 \<sigma> = ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)) \<and> R12 \<sigma> = 0x1 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x3c),4]::32 word) = ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word))\<close>
declare Q_0x2bdf_12_def[Qs]

schematic_goal decode_featureset_0_7_0x2bbd_0x2bdc_12[blocks]:
  assumes \<open>(P_0x2bbd_false_12 && P_0x2bbd_false_12_regions && ! ZF) \<sigma>\<close>
  shows \<open>exec_block 7 0x2bdc 12 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x2bdf_12 ?\<sigma> \<and> block_usage P_0x2bbd_false_12_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x2bbd_false_12_def P_0x2bbd_false_12_regions_def post: Q_0x2bdf_12_def regionset: P_0x2bbd_false_12_regions_set_def)

definition P_0x2bdf_true_13 :: state_pred where
  \<open>P_0x2bdf_true_13 \<sigma> \<equiv> RIP \<sigma> = 0x2bdf \<and> RBX \<sigma> = 0x1 \<and> RCX \<sigma> = 0x317e \<and> RDX \<sigma> = 0x0 \<and> RDI \<sigma> = 0x1 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x48) \<and> RBP \<sigma> = 0x4c10 \<and> R14 \<sigma> = RDI\<^sub>0 \<and> R13 \<sigma> = ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)) \<and> R12 \<sigma> = 0x1 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x3c),4]::32 word) = ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word))\<close>
declare P_0x2bdf_true_13_def[Ps]

definition P_0x2bdf_true_13_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x2bdf_true_13_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (2, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x3c), 4)
  }\<close>

definition P_0x2bdf_true_13_regions :: state_pred where
  \<open>P_0x2bdf_true_13_regions \<sigma> \<equiv> \<exists>regions. P_0x2bdf_true_13_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x2cb2_13 :: state_pred where
  \<open>Q_0x2cb2_13 \<sigma> \<equiv> RIP \<sigma> = 0x2cb2 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x48) \<and> R14 \<sigma> = RDI\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x3c),4]::32 word) = ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word))\<close>
declare Q_0x2cb2_13_def[Qs]

schematic_goal decode_featureset_0_1_0x2bdf_0x2bdf_13[blocks]:
  assumes \<open>(P_0x2bdf_true_13 && P_0x2bdf_true_13_regions && ZF) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x2bdf 13 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x2cb2_13 ?\<sigma> \<and> block_usage P_0x2bdf_true_13_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x2bdf_true_13_def P_0x2bdf_true_13_regions_def post: Q_0x2cb2_13_def regionset: P_0x2bdf_true_13_regions_set_def)

definition P_0x2cb2_14 :: state_pred where
  \<open>P_0x2cb2_14 \<sigma> \<equiv> RIP \<sigma> = 0x2cb2 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x48) \<and> R14 \<sigma> = RDI\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x3c),4]::32 word) = ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word))\<close>
declare P_0x2cb2_14_def[Ps]

definition P_0x2cb2_14_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x2cb2_14_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (2, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x3c), 4)
  }\<close>

definition P_0x2cb2_14_regions :: state_pred where
  \<open>P_0x2cb2_14_regions \<sigma> \<equiv> \<exists>regions. P_0x2cb2_14_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x2cc7_14 :: state_pred where
  \<open>Q_0x2cc7_14 \<sigma> \<equiv> RIP \<sigma> = 0x2cc7 \<and> RAX \<sigma> = 0x0 \<and> RCX \<sigma> = 0x31c0 \<and> RDI \<sigma> = 0x1 \<and> RSI \<sigma> = 0x31b1 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x48) \<and> R14 \<sigma> = RDI\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x3c),4]::32 word) = ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word))\<close>
declare Q_0x2cc7_14_def[Qs]

schematic_goal decode_featureset_0_4_0x2cb2_0x2cc5_14[blocks]:
  assumes \<open>(P_0x2cb2_14 && P_0x2cb2_14_regions) \<sigma>\<close>
  shows \<open>exec_block 4 0x2cc5 14 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x2cc7_14 ?\<sigma> \<and> block_usage P_0x2cb2_14_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x2cb2_14_def P_0x2cb2_14_regions_def post: Q_0x2cc7_14_def regionset: P_0x2cb2_14_regions_set_def)

definition P_0x2cc7_15 :: state_pred where
  \<open>P_0x2cc7_15 \<sigma> \<equiv> RIP \<sigma> = 0x2cc7 \<and> RAX \<sigma> = 0x0 \<and> RCX \<sigma> = 0x31c0 \<and> RDI \<sigma> = 0x1 \<and> RSI \<sigma> = 0x31b1 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x48) \<and> R14 \<sigma> = RDI\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x3c),4]::32 word) = ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word))\<close>
declare P_0x2cc7_15_def[Ps]

definition P_0x2cc7_15_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x2cc7_15_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (2, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x3c), 4),
    (8, ((RSP\<^sub>0::64 word) - 0x50), 8)
  }\<close>

definition P_0x2cc7_15_regions :: state_pred where
  \<open>P_0x2cc7_15_regions \<sigma> \<equiv> \<exists>regions. P_0x2cc7_15_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_printf_chk_addr_0x2cc7_15 :: state_pred where
  \<open>Q_printf_chk_addr_0x2cc7_15 \<sigma> \<equiv> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x50) \<and> RIP \<sigma> = printf_chk_addr \<and> RAX \<sigma> = 0x0 \<and> RCX \<sigma> = 0x31c0 \<and> RDI \<sigma> = 0x1 \<and> RSI \<sigma> = 0x31b1 \<and> R14 \<sigma> = RDI\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x3c),4]::32 word) = ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),8]::64 word) = 0x2ccc\<close>
declare Q_printf_chk_addr_0x2cc7_15_def[Qs]

schematic_goal decode_featureset_0_1_0x2cc7_0x2cc7_15[blocks]:
  assumes \<open>(P_0x2cc7_15 && P_0x2cc7_15_regions) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x2cc7 15 \<sigma> \<triangleq> ?\<sigma> \<and> Q_printf_chk_addr_0x2cc7_15 ?\<sigma> \<and> block_usage P_0x2cc7_15_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x2cc7_15_def P_0x2cc7_15_regions_def post: Q_printf_chk_addr_0x2cc7_15_def regionset: P_0x2cc7_15_regions_set_def)

definition P_0x2ccc_16 :: state_pred where
  \<open>P_0x2ccc_16 \<sigma> \<equiv> RIP \<sigma> = 0x2ccc \<and> RAX \<sigma> = printf_chk_0x2cc7_retval \<and> RCX \<sigma> = 0x31c0 \<and> RDI \<sigma> = 0x1 \<and> RSI \<sigma> = 0x31b1 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x48) \<and> R14 \<sigma> = RDI\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x3c),4]::32 word) = ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),8]::64 word) = 0x2ccc\<close>
declare P_0x2ccc_16_def[Ps]

definition P_0x2ccc_16_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x2ccc_16_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (2, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x3c), 4),
    (8, ((RSP\<^sub>0::64 word) - 0x50), 8)
  }\<close>

definition P_0x2ccc_16_regions :: state_pred where
  \<open>P_0x2ccc_16_regions \<sigma> \<equiv> \<exists>regions. P_0x2ccc_16_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x2c80_16 :: state_pred where
  \<open>Q_0x2c80_16 \<sigma> \<equiv> RIP \<sigma> = 0x2c80 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x48) \<and> R14 \<sigma> = RDI\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x3c),4]::32 word) = ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word))\<close>
declare Q_0x2c80_16_def[Qs]

schematic_goal decode_featureset_0_1_0x2ccc_0x2ccc_16[blocks]:
  assumes \<open>(P_0x2ccc_16 && P_0x2ccc_16_regions) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x2ccc 16 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x2c80_16 ?\<sigma> \<and> block_usage P_0x2ccc_16_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x2ccc_16_def P_0x2ccc_16_regions_def post: Q_0x2c80_16_def regionset: P_0x2ccc_16_regions_set_def)

definition P_0x2c80_17 :: state_pred where
  \<open>P_0x2c80_17 \<sigma> \<equiv> RIP \<sigma> = 0x2c80 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x48) \<and> R14 \<sigma> = RDI\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x3c),4]::32 word) = ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word))\<close>
declare P_0x2c80_17_def[Ps]

definition P_0x2c80_17_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x2c80_17_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (2, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x3c), 4)
  }\<close>

definition P_0x2c80_17_regions :: state_pred where
  \<open>P_0x2c80_17_regions \<sigma> \<equiv> \<exists>regions. P_0x2c80_17_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x2c8d_17 :: state_pred where
  \<open>Q_0x2c8d_17 \<sigma> \<equiv> RIP \<sigma> = 0x2c8d \<and> RDI \<sigma> = 0xa \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x48) \<and> R14 \<sigma> = RDI\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x3c),4]::32 word) = ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word))\<close>
declare Q_0x2c8d_17_def[Qs]

schematic_goal decode_featureset_0_3_0x2c80_0x2c89_17[blocks]:
  assumes \<open>(P_0x2c80_17 && P_0x2c80_17_regions) \<sigma>\<close>
  shows \<open>exec_block 3 0x2c89 17 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x2c8d_17 ?\<sigma> \<and> block_usage P_0x2c80_17_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x2c80_17_def P_0x2c80_17_regions_def post: Q_0x2c8d_17_def regionset: P_0x2c80_17_regions_set_def)

definition P_0x2c8d_18 :: state_pred where
  \<open>P_0x2c8d_18 \<sigma> \<equiv> RIP \<sigma> = 0x2c8d \<and> RDI \<sigma> = 0xa \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x48) \<and> R14 \<sigma> = RDI\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x3c),4]::32 word) = ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word))\<close>
declare P_0x2c8d_18_def[Ps]

definition P_0x2c8d_18_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x2c8d_18_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (2, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x3c), 4),
    (8, ((RSP\<^sub>0::64 word) - 0x50), 8)
  }\<close>

definition P_0x2c8d_18_regions :: state_pred where
  \<open>P_0x2c8d_18_regions \<sigma> \<equiv> \<exists>regions. P_0x2c8d_18_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_putchar_addr_0x2c8d_18 :: state_pred where
  \<open>Q_putchar_addr_0x2c8d_18 \<sigma> \<equiv> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x50) \<and> RIP \<sigma> = putchar_addr \<and> RDI \<sigma> = 0xa \<and> R14 \<sigma> = RDI\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x3c),4]::32 word) = ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),8]::64 word) = 0x2c92\<close>
declare Q_putchar_addr_0x2c8d_18_def[Qs]

schematic_goal decode_featureset_0_1_0x2c8d_0x2c8d_18[blocks]:
  assumes \<open>(P_0x2c8d_18 && P_0x2c8d_18_regions) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x2c8d 18 \<sigma> \<triangleq> ?\<sigma> \<and> Q_putchar_addr_0x2c8d_18 ?\<sigma> \<and> block_usage P_0x2c8d_18_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x2c8d_18_def P_0x2c8d_18_regions_def post: Q_putchar_addr_0x2c8d_18_def regionset: P_0x2c8d_18_regions_set_def)

definition P_0x2c92_19 :: state_pred where
  \<open>P_0x2c92_19 \<sigma> \<equiv> RIP \<sigma> = 0x2c92 \<and> RDI \<sigma> = 0xa \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x48) \<and> R14 \<sigma> = RDI\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x3c),4]::32 word) = ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),8]::64 word) = 0x2c92\<close>
declare P_0x2c92_19_def[Ps]

definition P_0x2c92_19_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x2c92_19_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (2, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x3c), 4),
    (8, ((RSP\<^sub>0::64 word) - 0x50), 8)
  }\<close>

definition P_0x2c92_19_regions :: state_pred where
  \<open>P_0x2c92_19_regions \<sigma> \<equiv> \<exists>regions. P_0x2c92_19_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x2c97_19 :: state_pred where
  \<open>Q_0x2c97_19 \<sigma> \<equiv> RIP \<sigma> = 0x2c97 \<and> RDI \<sigma> = 0xa \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x48) \<and> R14 \<sigma> = RDI\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x3c),4]::32 word) = ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),8]::64 word) = 0x2c92\<close>
declare Q_0x2c97_19_def[Qs]

schematic_goal decode_featureset_0_1_0x2c92_0x2c92_19[blocks]:
  assumes \<open>(P_0x2c92_19 && P_0x2c92_19_regions) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x2c92 19 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x2c97_19 ?\<sigma> \<and> block_usage P_0x2c92_19_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x2c92_19_def P_0x2c92_19_regions_def post: Q_0x2c97_19_def regionset: P_0x2c92_19_regions_set_def)

definition P_0x2c97_true_20 :: state_pred where
  \<open>P_0x2c97_true_20 \<sigma> \<equiv> RIP \<sigma> = 0x2c97 \<and> RDI \<sigma> = 0xa \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x48) \<and> R14 \<sigma> = RDI\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x3c),4]::32 word) = ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),8]::64 word) = 0x2c92\<close>
declare P_0x2c97_true_20_def[Ps]

definition P_0x2c97_true_20_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x2c97_true_20_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (2, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x3c), 4),
    (8, ((RSP\<^sub>0::64 word) - 0x50), 8)
  }\<close>

definition P_0x2c97_true_20_regions :: state_pred where
  \<open>P_0x2c97_true_20_regions \<sigma> \<equiv> \<exists>regions. P_0x2c97_true_20_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x2cd0_20 :: state_pred where
  \<open>Q_0x2cd0_20 \<sigma> \<equiv> RIP \<sigma> = 0x2cd0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x48) \<and> R14 \<sigma> = RDI\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x3c),4]::32 word) = ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word))\<close>
declare Q_0x2cd0_20_def[Qs]

schematic_goal decode_featureset_0_1_0x2c97_0x2c97_20[blocks]:
  assumes \<open>(P_0x2c97_true_20 && P_0x2c97_true_20_regions && jbe) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x2c97 20 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x2cd0_20 ?\<sigma> \<and> block_usage P_0x2c97_true_20_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x2c97_true_20_def P_0x2c97_true_20_regions_def post: Q_0x2cd0_20_def regionset: P_0x2c97_true_20_regions_set_def)

definition P_0x2c97_false_21 :: state_pred where
  \<open>P_0x2c97_false_21 \<sigma> \<equiv> RIP \<sigma> = 0x2c97 \<and> RDI \<sigma> = 0xa \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x48) \<and> R14 \<sigma> = RDI\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x3c),4]::32 word) = ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),8]::64 word) = 0x2c92\<close>
declare P_0x2c97_false_21_def[Ps]

definition P_0x2c97_false_21_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x2c97_false_21_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (2, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x3c), 4),
    (8, ((RSP\<^sub>0::64 word) - 0x50), 8)
  }\<close>

definition P_0x2c97_false_21_regions :: state_pred where
  \<open>P_0x2c97_false_21_regions \<sigma> \<equiv> \<exists>regions. P_0x2c97_false_21_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x2c9d_21 :: state_pred where
  \<open>Q_0x2c9d_21 \<sigma> \<equiv> RIP \<sigma> = 0x2c9d \<and> RDI \<sigma> = 0xa \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x48) \<and> R14 \<sigma> = RDI\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x3c),4]::32 word) = ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),8]::64 word) = 0x2c92\<close>
declare Q_0x2c9d_21_def[Qs]

schematic_goal decode_featureset_0_2_0x2c97_0x2c99_21[blocks]:
  assumes \<open>(P_0x2c97_false_21 && P_0x2c97_false_21_regions && ! jbe) \<sigma>\<close>
  shows \<open>exec_block 2 0x2c99 21 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x2c9d_21 ?\<sigma> \<and> block_usage P_0x2c97_false_21_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x2c97_false_21_def P_0x2c97_false_21_regions_def post: Q_0x2c9d_21_def regionset: P_0x2c97_false_21_regions_set_def)

definition P_0x2c9d_true_22 :: state_pred where
  \<open>P_0x2c9d_true_22 \<sigma> \<equiv> RIP \<sigma> = 0x2c9d \<and> RDI \<sigma> = 0xa \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x48) \<and> R14 \<sigma> = RDI\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x3c),4]::32 word) = ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),8]::64 word) = 0x2c92\<close>
declare P_0x2c9d_true_22_def[Ps]

definition P_0x2c9d_true_22_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x2c9d_true_22_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (2, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x3c), 4),
    (8, ((RSP\<^sub>0::64 word) - 0x50), 8)
  }\<close>

definition P_0x2c9d_true_22_regions :: state_pred where
  \<open>P_0x2c9d_true_22_regions \<sigma> \<equiv> \<exists>regions. P_0x2c9d_true_22_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x2cd0_22 :: state_pred where
  \<open>Q_0x2cd0_22 \<sigma> \<equiv> RIP \<sigma> = 0x2cd0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x48) \<and> R14 \<sigma> = RDI\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x3c),4]::32 word) = ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word))\<close>
declare Q_0x2cd0_22_def[Qs]

schematic_goal decode_featureset_0_1_0x2c9d_0x2c9d_22[blocks]:
  assumes \<open>(P_0x2c9d_true_22 && P_0x2c9d_true_22_regions && ja) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x2c9d 22 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x2cd0_22 ?\<sigma> \<and> block_usage P_0x2c9d_true_22_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x2c9d_true_22_def P_0x2c9d_true_22_regions_def post: Q_0x2cd0_22_def regionset: P_0x2c9d_true_22_regions_set_def)

definition P_0x2c9d_false_23 :: state_pred where
  \<open>P_0x2c9d_false_23 \<sigma> \<equiv> RIP \<sigma> = 0x2c9d \<and> RDI \<sigma> = 0xa \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x48) \<and> R14 \<sigma> = RDI\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x3c),4]::32 word) = ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),8]::64 word) = 0x2c92\<close>
declare P_0x2c9d_false_23_def[Ps]

definition P_0x2c9d_false_23_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x2c9d_false_23_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((RBP \<sigma>::64 word) - 0x10), 8),
    (2, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x3c), 4),
    (9, ((RSP\<^sub>0::64 word) - 0x50), 8)
  }\<close>

definition P_0x2c9d_false_23_regions :: state_pred where
  \<open>P_0x2c9d_false_23_regions \<sigma> \<equiv> \<exists>regions. P_0x2c9d_false_23_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x2cac_23 :: state_pred where
  \<open>Q_0x2cac_23 \<sigma> \<equiv> RIP \<sigma> = 0x2cac \<and> RCX \<sigma> = (\<sigma> \<turnstile> *[((RBP \<sigma>::64 word) - 0x10),8]::64 word) \<and> RDX \<sigma> = ucast ((\<langle>31,0\<rangle>((RBX \<sigma>::64 word) - 0x1)::32 word)) \<and> RDI \<sigma> = 0xa \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x48) \<and> R14 \<sigma> = RDI\<^sub>0 \<and> R12 \<sigma> = ucast ((\<langle>31,0\<rangle>RBX \<sigma>::32 word)) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RBP \<sigma>::64 word) - 0x10),8]::64 word) = (\<sigma> \<turnstile> *[((RBP \<sigma>::64 word) - 0x10),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x3c),4]::32 word) = ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),8]::64 word) = 0x2c92\<close>
declare Q_0x2cac_23_def[Qs]

schematic_goal decode_featureset_0_5_0x2c9d_0x2ca9_23[blocks]:
  assumes \<open>(P_0x2c9d_false_23 && P_0x2c9d_false_23_regions && ! ja) \<sigma>\<close>
  shows \<open>exec_block 5 0x2ca9 23 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x2cac_23 ?\<sigma> \<and> block_usage P_0x2c9d_false_23_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x2c9d_false_23_def P_0x2c9d_false_23_regions_def post: Q_0x2cac_23_def regionset: P_0x2c9d_false_23_regions_set_def)

definition P_0x2cac_true_24 :: state_pred where
  \<open>P_0x2cac_true_24 \<sigma> \<equiv> RIP \<sigma> = 0x2cac \<and> RCX \<sigma> = (\<sigma> \<turnstile> *[((RBP \<sigma>::64 word) - 0x10),8]::64 word) \<and> RDX \<sigma> = ucast ((\<langle>31,0\<rangle>((RBX \<sigma>::64 word) - 0x1)::32 word)) \<and> RDI \<sigma> = 0xa \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x48) \<and> R14 \<sigma> = RDI\<^sub>0 \<and> R12 \<sigma> = ucast ((\<langle>31,0\<rangle>RBX \<sigma>::32 word)) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RBP \<sigma>::64 word) - 0x10),8]::64 word) = (\<sigma> \<turnstile> *[((RBP \<sigma>::64 word) - 0x10),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x3c),4]::32 word) = ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),8]::64 word) = 0x2c92\<close>
declare P_0x2cac_true_24_def[Ps]

definition P_0x2cac_true_24_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x2cac_true_24_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((RBP \<sigma>::64 word) - 0x10), 8),
    (2, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x3c), 4),
    (9, ((RSP\<^sub>0::64 word) - 0x50), 8)
  }\<close>

definition P_0x2cac_true_24_regions :: state_pred where
  \<open>P_0x2cac_true_24_regions \<sigma> \<equiv> \<exists>regions. P_0x2cac_true_24_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x2bf6_24 :: state_pred where
  \<open>Q_0x2bf6_24 \<sigma> \<equiv> RIP \<sigma> = 0x2bf6 \<and> RAX \<sigma> = 0x0 \<and> RCX \<sigma> = (\<sigma> \<turnstile> *[((RBP \<sigma>::64 word) - 0x10),8]::64 word) \<and> RDX \<sigma> = ucast ((\<langle>31,0\<rangle>((RBX \<sigma>::64 word) - 0x1)::32 word)) \<and> RDI \<sigma> = 0x1 \<and> RSI \<sigma> = 0x31b1 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x48) \<and> R14 \<sigma> = RDI\<^sub>0 \<and> R12 \<sigma> = ucast ((\<langle>31,0\<rangle>RBX \<sigma>::32 word)) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RBP \<sigma>::64 word) - 0x10),8]::64 word) = (\<sigma> \<turnstile> *[((RBP \<sigma>::64 word) - 0x10),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x3c),4]::32 word) = ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),8]::64 word) = 0x2c92\<close>
declare Q_0x2bf6_24_def[Qs]

schematic_goal decode_featureset_0_4_0x2cac_0x2bf4_24[blocks]:
  assumes \<open>(P_0x2cac_true_24 && P_0x2cac_true_24_regions && !ZF) \<sigma>\<close>
  shows \<open>exec_block 4 0x2bf4 24 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x2bf6_24 ?\<sigma> \<and> block_usage P_0x2cac_true_24_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x2cac_true_24_def P_0x2cac_true_24_regions_def post: Q_0x2bf6_24_def regionset: P_0x2cac_true_24_regions_set_def)

definition P_0x2bf6_25 :: state_pred where
  \<open>P_0x2bf6_25 \<sigma> \<equiv> RIP \<sigma> = 0x2bf6 \<and> RAX \<sigma> = 0x0 \<and> RCX \<sigma> = (\<sigma> \<turnstile> *[((RBP \<sigma>::64 word) - 0x10),8]::64 word) \<and> RDX \<sigma> = ucast ((\<langle>31,0\<rangle>((RBX \<sigma>::64 word) - 0x1)::32 word)) \<and> RDI \<sigma> = 0x1 \<and> RSI \<sigma> = 0x31b1 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x48) \<and> R14 \<sigma> = RDI\<^sub>0 \<and> R12 \<sigma> = ucast ((\<langle>31,0\<rangle>RBX \<sigma>::32 word)) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RBP \<sigma>::64 word) - 0x10),8]::64 word) = (\<sigma> \<turnstile> *[((RBP \<sigma>::64 word) - 0x10),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x3c),4]::32 word) = ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),8]::64 word) = 0x2c92\<close>
declare P_0x2bf6_25_def[Ps]

definition P_0x2bf6_25_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x2bf6_25_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((RBP \<sigma>::64 word) - 0x10), 8),
    (2, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x3c), 4),
    (9, ((RSP\<^sub>0::64 word) - 0x50), 8)
  }\<close>

definition P_0x2bf6_25_regions :: state_pred where
  \<open>P_0x2bf6_25_regions \<sigma> \<equiv> \<exists>regions. P_0x2bf6_25_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_printf_chk_addr_0x2bf6_25 :: state_pred where
  \<open>Q_printf_chk_addr_0x2bf6_25 \<sigma> \<equiv> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x50) \<and> RIP \<sigma> = printf_chk_addr \<and> RAX \<sigma> = 0x0 \<and> RCX \<sigma> = (\<sigma> \<turnstile> *[((RBP \<sigma>::64 word) - 0x10),8]::64 word) \<and> RDX \<sigma> = ucast ((\<langle>31,0\<rangle>((RBX \<sigma>::64 word) - 0x1)::32 word)) \<and> RDI \<sigma> = 0x1 \<and> RSI \<sigma> = 0x31b1 \<and> R14 \<sigma> = RDI\<^sub>0 \<and> R12 \<sigma> = ucast ((\<langle>31,0\<rangle>RBX \<sigma>::32 word)) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RBP \<sigma>::64 word) - 0x10),8]::64 word) = (\<sigma> \<turnstile> *[((RBP \<sigma>::64 word) - 0x10),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x3c),4]::32 word) = ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),8]::64 word) = 0x2bfb\<close>
declare Q_printf_chk_addr_0x2bf6_25_def[Qs]

schematic_goal decode_featureset_0_1_0x2bf6_0x2bf6_25[blocks]:
  assumes \<open>(P_0x2bf6_25 && P_0x2bf6_25_regions) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x2bf6 25 \<sigma> \<triangleq> ?\<sigma> \<and> Q_printf_chk_addr_0x2bf6_25 ?\<sigma> \<and> block_usage P_0x2bf6_25_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x2bf6_25_def P_0x2bf6_25_regions_def post: Q_printf_chk_addr_0x2bf6_25_def regionset: P_0x2bf6_25_regions_set_def)

definition P_0x2bfb_26 :: state_pred where
  \<open>P_0x2bfb_26 \<sigma> \<equiv> RIP \<sigma> = 0x2bfb \<and> RAX \<sigma> = printf_chk_0x2bf6_retval \<and> RCX \<sigma> = (\<sigma> \<turnstile> *[((RBP \<sigma>::64 word) - 0x10),8]::64 word) \<and> RDX \<sigma> = ucast ((\<langle>31,0\<rangle>((RBX \<sigma>::64 word) - 0x1)::32 word)) \<and> RDI \<sigma> = 0x1 \<and> RSI \<sigma> = 0x31b1 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x48) \<and> R14 \<sigma> = RDI\<^sub>0 \<and> R12 \<sigma> = ucast ((\<langle>31,0\<rangle>RBX \<sigma>::32 word)) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RBP \<sigma>::64 word) - 0x10),8]::64 word) = (\<sigma> \<turnstile> *[((RBP \<sigma>::64 word) - 0x10),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x3c),4]::32 word) = ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),8]::64 word) = 0x2bfb\<close>
declare P_0x2bfb_26_def[Ps]

definition P_0x2bfb_26_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x2bfb_26_regions_set \<sigma> \<equiv> {
    (0, RBP \<sigma>, 8),
    (1, RSP\<^sub>0, 8),
    (2, ((RBP \<sigma>::64 word) - 0x10), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x3c), 4),
    (10, ((RSP\<^sub>0::64 word) - 0x40), 4),
    (11, ((RSP\<^sub>0::64 word) - 0x50), 8),
    (12, ((((RDI\<^sub>0::64 word) + (\<langle>63,0\<rangle>((RBX \<sigma>::64 word) * 0x4)::64 word))::64 word) - 0x4), 4)
  }\<close>

definition P_0x2bfb_26_regions :: state_pred where
  \<open>P_0x2bfb_26_regions \<sigma> \<equiv> \<exists>regions. P_0x2bfb_26_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x2c0b_26 :: state_pred where
  \<open>Q_0x2c0b_26 \<sigma> \<equiv> RIP \<sigma> = 0x2c0b \<and> RAX \<sigma> = ucast ((\<sigma> \<turnstile> *[((((RDI\<^sub>0::64 word) + (\<langle>63,0\<rangle>((RBX \<sigma>::64 word) * 0x4)::64 word))::64 word) - 0x4),4]::32 word)) \<and> RCX \<sigma> = (\<sigma> \<turnstile> *[((RBP \<sigma>::64 word) - 0x10),8]::64 word) \<and> RDX \<sigma> = ucast ((\<langle>31,0\<rangle>((RBX \<sigma>::64 word) - 0x1)::32 word)) \<and> RDI \<sigma> = 0x1 \<and> RSI \<sigma> = 0x31b1 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x48) \<and> R14 \<sigma> = RDI\<^sub>0 \<and> R13 \<sigma> = (\<sigma> \<turnstile> *[RBP \<sigma>,8]::64 word) \<and> R12 \<sigma> = ucast ((\<langle>31,0\<rangle>RBX \<sigma>::32 word)) \<and> (\<sigma> \<turnstile> *[RBP \<sigma>,8]::64 word) = (\<sigma> \<turnstile> *[RBP \<sigma>,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RBP \<sigma>::64 word) - 0x10),8]::64 word) = (\<sigma> \<turnstile> *[((RBP \<sigma>::64 word) - 0x10),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x3c),4]::32 word) = ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((((RDI\<^sub>0::64 word) + (\<langle>63,0\<rangle>((RBX \<sigma>::64 word) * 0x4)::64 word))::64 word) - 0x4),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),8]::64 word) = 0x2bfb \<and> (\<sigma> \<turnstile> *[((((RDI\<^sub>0::64 word) + (\<langle>63,0\<rangle>((RBX \<sigma>::64 word) * 0x4)::64 word))::64 word) - 0x4),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((((RDI\<^sub>0::64 word) + (\<langle>63,0\<rangle>((RBX \<sigma>::64 word) * 0x4)::64 word))::64 word) - 0x4),4]::32 word))\<close>
declare Q_0x2c0b_26_def[Qs]

schematic_goal decode_featureset_0_4_0x2bfb_0x2c08_26[blocks]:
  assumes \<open>(P_0x2bfb_26 && P_0x2bfb_26_regions) \<sigma>\<close>
  shows \<open>exec_block 4 0x2c08 26 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x2c0b_26 ?\<sigma> \<and> block_usage P_0x2bfb_26_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x2bfb_26_def P_0x2bfb_26_regions_def post: Q_0x2c0b_26_def regionset: P_0x2bfb_26_regions_set_def)

definition P_0x2c0b_true_27 :: state_pred where
  \<open>P_0x2c0b_true_27 \<sigma> \<equiv> RIP \<sigma> = 0x2c0b \<and> RAX \<sigma> = ucast ((\<sigma> \<turnstile> *[((((RDI\<^sub>0::64 word) + (\<langle>63,0\<rangle>((RBX \<sigma>::64 word) * 0x4)::64 word))::64 word) - 0x4),4]::32 word)) \<and> RCX \<sigma> = (\<sigma> \<turnstile> *[((RBP \<sigma>::64 word) - 0x10),8]::64 word) \<and> RDX \<sigma> = ucast ((\<langle>31,0\<rangle>((RBX \<sigma>::64 word) - 0x1)::32 word)) \<and> RDI \<sigma> = 0x1 \<and> RSI \<sigma> = 0x31b1 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x48) \<and> R14 \<sigma> = RDI\<^sub>0 \<and> R13 \<sigma> = (\<sigma> \<turnstile> *[RBP \<sigma>,8]::64 word) \<and> R12 \<sigma> = ucast ((\<langle>31,0\<rangle>RBX \<sigma>::32 word)) \<and> (\<sigma> \<turnstile> *[RBP \<sigma>,8]::64 word) = (\<sigma> \<turnstile> *[RBP \<sigma>,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RBP \<sigma>::64 word) - 0x10),8]::64 word) = (\<sigma> \<turnstile> *[((RBP \<sigma>::64 word) - 0x10),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x3c),4]::32 word) = ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((((RDI\<^sub>0::64 word) + (\<langle>63,0\<rangle>((RBX \<sigma>::64 word) * 0x4)::64 word))::64 word) - 0x4),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),8]::64 word) = 0x2bfb \<and> (\<sigma> \<turnstile> *[((((RDI\<^sub>0::64 word) + (\<langle>63,0\<rangle>((RBX \<sigma>::64 word) * 0x4)::64 word))::64 word) - 0x4),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((((RDI\<^sub>0::64 word) + (\<langle>63,0\<rangle>((RBX \<sigma>::64 word) * 0x4)::64 word))::64 word) - 0x4),4]::32 word))\<close>
declare P_0x2c0b_true_27_def[Ps]

definition P_0x2c0b_true_27_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x2c0b_true_27_regions_set \<sigma> \<equiv> {
    (0, RBP \<sigma>, 8),
    (1, RSP\<^sub>0, 8),
    (2, ((RBP \<sigma>::64 word) - 0x10), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x3c), 4),
    (10, ((RSP\<^sub>0::64 word) - 0x40), 4),
    (11, ((RSP\<^sub>0::64 word) - 0x50), 8),
    (12, ((((RDI\<^sub>0::64 word) + (\<langle>63,0\<rangle>((RBX \<sigma>::64 word) * 0x4)::64 word))::64 word) - 0x4), 4)
  }\<close>

definition P_0x2c0b_true_27_regions :: state_pred where
  \<open>P_0x2c0b_true_27_regions \<sigma> \<equiv> \<exists>regions. P_0x2c0b_true_27_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x2cee_27 :: state_pred where
  \<open>Q_0x2cee_27 \<sigma> \<equiv> RIP \<sigma> = 0x2cee \<and> RAX \<sigma> = 0x0 \<and> RCX \<sigma> = (\<sigma> \<turnstile> *[((RBP \<sigma>::64 word) - 0x10),8]::64 word) \<and> RDX \<sigma> = ucast ((\<langle>31,0\<rangle>((RBX \<sigma>::64 word) - 0x1)::32 word)) \<and> RDI \<sigma> = 0x1 \<and> RSI \<sigma> = 0x31a2 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x48) \<and> R14 \<sigma> = RDI\<^sub>0 \<and> R13 \<sigma> = (\<sigma> \<turnstile> *[RBP \<sigma>,8]::64 word) \<and> R12 \<sigma> = ucast ((\<langle>31,0\<rangle>RBX \<sigma>::32 word)) \<and> (\<sigma> \<turnstile> *[RBP \<sigma>,8]::64 word) = (\<sigma> \<turnstile> *[RBP \<sigma>,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RBP \<sigma>::64 word) - 0x10),8]::64 word) = (\<sigma> \<turnstile> *[((RBP \<sigma>::64 word) - 0x10),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x3c),4]::32 word) = ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((((RDI\<^sub>0::64 word) + (\<langle>63,0\<rangle>((RBX \<sigma>::64 word) * 0x4)::64 word))::64 word) - 0x4),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),8]::64 word) = 0x2bfb \<and> (\<sigma> \<turnstile> *[((((RDI\<^sub>0::64 word) + (\<langle>63,0\<rangle>((RBX \<sigma>::64 word) * 0x4)::64 word))::64 word) - 0x4),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((((RDI\<^sub>0::64 word) + (\<langle>63,0\<rangle>((RBX \<sigma>::64 word) * 0x4)::64 word))::64 word) - 0x4),4]::32 word))\<close>
declare Q_0x2cee_27_def[Qs]

schematic_goal decode_featureset_0_4_0x2c0b_0x2cec_27[blocks]:
  assumes \<open>(P_0x2c0b_true_27 && P_0x2c0b_true_27_regions && ZF) \<sigma>\<close>
  shows \<open>exec_block 4 0x2cec 27 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x2cee_27 ?\<sigma> \<and> block_usage P_0x2c0b_true_27_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x2c0b_true_27_def P_0x2c0b_true_27_regions_def post: Q_0x2cee_27_def regionset: P_0x2c0b_true_27_regions_set_def)

definition P_0x2cee_28 :: state_pred where
  \<open>P_0x2cee_28 \<sigma> \<equiv> RIP \<sigma> = 0x2cee \<and> RAX \<sigma> = 0x0 \<and> RCX \<sigma> = (\<sigma> \<turnstile> *[((RBP \<sigma>::64 word) - 0x10),8]::64 word) \<and> RDX \<sigma> = ucast ((\<langle>31,0\<rangle>((RBX \<sigma>::64 word) - 0x1)::32 word)) \<and> RDI \<sigma> = 0x1 \<and> RSI \<sigma> = 0x31a2 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x48) \<and> R14 \<sigma> = RDI\<^sub>0 \<and> R13 \<sigma> = (\<sigma> \<turnstile> *[RBP \<sigma>,8]::64 word) \<and> R12 \<sigma> = ucast ((\<langle>31,0\<rangle>RBX \<sigma>::32 word)) \<and> (\<sigma> \<turnstile> *[RBP \<sigma>,8]::64 word) = (\<sigma> \<turnstile> *[RBP \<sigma>,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RBP \<sigma>::64 word) - 0x10),8]::64 word) = (\<sigma> \<turnstile> *[((RBP \<sigma>::64 word) - 0x10),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x3c),4]::32 word) = ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((((RDI\<^sub>0::64 word) + (\<langle>63,0\<rangle>((RBX \<sigma>::64 word) * 0x4)::64 word))::64 word) - 0x4),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),8]::64 word) = 0x2bfb \<and> (\<sigma> \<turnstile> *[((((RDI\<^sub>0::64 word) + (\<langle>63,0\<rangle>((RBX \<sigma>::64 word) * 0x4)::64 word))::64 word) - 0x4),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((((RDI\<^sub>0::64 word) + (\<langle>63,0\<rangle>((RBX \<sigma>::64 word) * 0x4)::64 word))::64 word) - 0x4),4]::32 word))\<close>
declare P_0x2cee_28_def[Ps]

definition P_0x2cee_28_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x2cee_28_regions_set \<sigma> \<equiv> {
    (0, RBP \<sigma>, 8),
    (1, RSP\<^sub>0, 8),
    (2, ((RBP \<sigma>::64 word) - 0x10), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x3c), 4),
    (10, ((RSP\<^sub>0::64 word) - 0x40), 4),
    (11, ((RSP\<^sub>0::64 word) - 0x50), 8),
    (12, ((((RDI\<^sub>0::64 word) + (\<langle>63,0\<rangle>((RBX \<sigma>::64 word) * 0x4)::64 word))::64 word) - 0x4), 4)
  }\<close>

definition P_0x2cee_28_regions :: state_pred where
  \<open>P_0x2cee_28_regions \<sigma> \<equiv> \<exists>regions. P_0x2cee_28_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_printf_chk_addr_0x2cee_28 :: state_pred where
  \<open>Q_printf_chk_addr_0x2cee_28 \<sigma> \<equiv> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x50) \<and> RIP \<sigma> = printf_chk_addr \<and> RAX \<sigma> = 0x0 \<and> RCX \<sigma> = (\<sigma> \<turnstile> *[((RBP \<sigma>::64 word) - 0x10),8]::64 word) \<and> RDX \<sigma> = ucast ((\<langle>31,0\<rangle>((RBX \<sigma>::64 word) - 0x1)::32 word)) \<and> RDI \<sigma> = 0x1 \<and> RSI \<sigma> = 0x31a2 \<and> R14 \<sigma> = RDI\<^sub>0 \<and> R13 \<sigma> = (\<sigma> \<turnstile> *[RBP \<sigma>,8]::64 word) \<and> R12 \<sigma> = ucast ((\<langle>31,0\<rangle>RBX \<sigma>::32 word)) \<and> (\<sigma> \<turnstile> *[RBP \<sigma>,8]::64 word) = (\<sigma> \<turnstile> *[RBP \<sigma>,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RBP \<sigma>::64 word) - 0x10),8]::64 word) = (\<sigma> \<turnstile> *[((RBP \<sigma>::64 word) - 0x10),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x3c),4]::32 word) = ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((((RDI\<^sub>0::64 word) + (\<langle>63,0\<rangle>((RBX \<sigma>::64 word) * 0x4)::64 word))::64 word) - 0x4),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),8]::64 word) = 0x2cf3 \<and> (\<sigma> \<turnstile> *[((((RDI\<^sub>0::64 word) + (\<langle>63,0\<rangle>((RBX \<sigma>::64 word) * 0x4)::64 word))::64 word) - 0x4),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((((RDI\<^sub>0::64 word) + (\<langle>63,0\<rangle>((RBX \<sigma>::64 word) * 0x4)::64 word))::64 word) - 0x4),4]::32 word))\<close>
declare Q_printf_chk_addr_0x2cee_28_def[Qs]

schematic_goal decode_featureset_0_1_0x2cee_0x2cee_28[blocks]:
  assumes \<open>(P_0x2cee_28 && P_0x2cee_28_regions) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x2cee 28 \<sigma> \<triangleq> ?\<sigma> \<and> Q_printf_chk_addr_0x2cee_28 ?\<sigma> \<and> block_usage P_0x2cee_28_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x2cee_28_def P_0x2cee_28_regions_def post: Q_printf_chk_addr_0x2cee_28_def regionset: P_0x2cee_28_regions_set_def)

definition P_0x2cf3_29 :: state_pred where
  \<open>P_0x2cf3_29 \<sigma> \<equiv> RIP \<sigma> = 0x2cf3 \<and> RAX \<sigma> = printf_chk_0x2cee_retval \<and> RCX \<sigma> = (\<sigma> \<turnstile> *[((RBP \<sigma>::64 word) - 0x10),8]::64 word) \<and> RDX \<sigma> = ucast ((\<langle>31,0\<rangle>((RBX \<sigma>::64 word) - 0x1)::32 word)) \<and> RDI \<sigma> = 0x1 \<and> RSI \<sigma> = 0x31a2 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x48) \<and> R14 \<sigma> = RDI\<^sub>0 \<and> R13 \<sigma> = (\<sigma> \<turnstile> *[RBP \<sigma>,8]::64 word) \<and> R12 \<sigma> = ucast ((\<langle>31,0\<rangle>RBX \<sigma>::32 word)) \<and> (\<sigma> \<turnstile> *[RBP \<sigma>,8]::64 word) = (\<sigma> \<turnstile> *[RBP \<sigma>,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RBP \<sigma>::64 word) - 0x10),8]::64 word) = (\<sigma> \<turnstile> *[((RBP \<sigma>::64 word) - 0x10),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x3c),4]::32 word) = ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((((RDI\<^sub>0::64 word) + (\<langle>63,0\<rangle>((RBX \<sigma>::64 word) * 0x4)::64 word))::64 word) - 0x4),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),8]::64 word) = 0x2cf3 \<and> (\<sigma> \<turnstile> *[((((RDI\<^sub>0::64 word) + (\<langle>63,0\<rangle>((RBX \<sigma>::64 word) * 0x4)::64 word))::64 word) - 0x4),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((((RDI\<^sub>0::64 word) + (\<langle>63,0\<rangle>((RBX \<sigma>::64 word) * 0x4)::64 word))::64 word) - 0x4),4]::32 word))\<close>
declare P_0x2cf3_29_def[Ps]

definition P_0x2cf3_29_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x2cf3_29_regions_set \<sigma> \<equiv> {
    (0, RBP \<sigma>, 8),
    (1, RSP\<^sub>0, 8),
    (2, ((RBP \<sigma>::64 word) - 0x10), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x3c), 4),
    (10, ((RSP\<^sub>0::64 word) - 0x40), 4),
    (11, ((RSP\<^sub>0::64 word) - 0x50), 8),
    (12, ((((RDI\<^sub>0::64 word) + (\<langle>63,0\<rangle>((RBX \<sigma>::64 word) * 0x4)::64 word))::64 word) - 0x4), 4)
  }\<close>

definition P_0x2cf3_29_regions :: state_pred where
  \<open>P_0x2cf3_29_regions \<sigma> \<equiv> \<exists>regions. P_0x2cf3_29_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x2c80_29 :: state_pred where
  \<open>Q_0x2c80_29 \<sigma> \<equiv> RIP \<sigma> = 0x2c80 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x48) \<and> R14 \<sigma> = RDI\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x3c),4]::32 word) = ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word))\<close>
declare Q_0x2c80_29_def[Qs]

schematic_goal decode_featureset_0_1_0x2cf3_0x2cf3_29[blocks]:
  assumes \<open>(P_0x2cf3_29 && P_0x2cf3_29_regions) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x2cf3 29 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x2c80_29 ?\<sigma> \<and> block_usage P_0x2cf3_29_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x2cf3_29_def P_0x2cf3_29_regions_def post: Q_0x2c80_29_def regionset: P_0x2cf3_29_regions_set_def)

definition P_0x2c0b_false_30 :: state_pred where
  \<open>P_0x2c0b_false_30 \<sigma> \<equiv> RIP \<sigma> = 0x2c0b \<and> RAX \<sigma> = ucast ((\<sigma> \<turnstile> *[((((RDI\<^sub>0::64 word) + (\<langle>63,0\<rangle>((RBX \<sigma>::64 word) * 0x4)::64 word))::64 word) - 0x4),4]::32 word)) \<and> RCX \<sigma> = (\<sigma> \<turnstile> *[((RBP \<sigma>::64 word) - 0x10),8]::64 word) \<and> RDX \<sigma> = ucast ((\<langle>31,0\<rangle>((RBX \<sigma>::64 word) - 0x1)::32 word)) \<and> RDI \<sigma> = 0x1 \<and> RSI \<sigma> = 0x31b1 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x48) \<and> R14 \<sigma> = RDI\<^sub>0 \<and> R13 \<sigma> = (\<sigma> \<turnstile> *[RBP \<sigma>,8]::64 word) \<and> R12 \<sigma> = ucast ((\<langle>31,0\<rangle>RBX \<sigma>::32 word)) \<and> (\<sigma> \<turnstile> *[RBP \<sigma>,8]::64 word) = (\<sigma> \<turnstile> *[RBP \<sigma>,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RBP \<sigma>::64 word) - 0x10),8]::64 word) = (\<sigma> \<turnstile> *[((RBP \<sigma>::64 word) - 0x10),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x3c),4]::32 word) = ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((((RDI\<^sub>0::64 word) + (\<langle>63,0\<rangle>((RBX \<sigma>::64 word) * 0x4)::64 word))::64 word) - 0x4),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),8]::64 word) = 0x2bfb \<and> (\<sigma> \<turnstile> *[((((RDI\<^sub>0::64 word) + (\<langle>63,0\<rangle>((RBX \<sigma>::64 word) * 0x4)::64 word))::64 word) - 0x4),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((((RDI\<^sub>0::64 word) + (\<langle>63,0\<rangle>((RBX \<sigma>::64 word) * 0x4)::64 word))::64 word) - 0x4),4]::32 word))\<close>
declare P_0x2c0b_false_30_def[Ps]

definition P_0x2c0b_false_30_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x2c0b_false_30_regions_set \<sigma> \<equiv> {
    (0, RBP \<sigma>, 8),
    (1, RSP\<^sub>0, 8),
    (2, ((RBP \<sigma>::64 word) - 0x10), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x3c), 4),
    (10, ((RSP\<^sub>0::64 word) - 0x40), 4),
    (11, ((RSP\<^sub>0::64 word) - 0x50), 8),
    (12, ((((RDI\<^sub>0::64 word) + (\<langle>63,0\<rangle>((RBX \<sigma>::64 word) * 0x4)::64 word))::64 word) - 0x4), 4)
  }\<close>

definition P_0x2c0b_false_30_regions :: state_pred where
  \<open>P_0x2c0b_false_30_regions \<sigma> \<equiv> \<exists>regions. P_0x2c0b_false_30_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x2c3d_30 :: state_pred where
  \<open>Q_0x2c3d_30 \<sigma> \<equiv> RIP \<sigma> = 0x2c3d \<and> RDI \<sigma> = 0x1 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x48) \<and> R14 \<sigma> = RDI\<^sub>0 \<and> R13 \<sigma> = (\<sigma> \<turnstile> *[RBP \<sigma>,8]::64 word) \<and> R12 \<sigma> = ucast ((\<langle>31,0\<rangle>RBX \<sigma>::32 word)) \<and> (\<sigma> \<turnstile> *[RBP \<sigma>,8]::64 word) = (\<sigma> \<turnstile> *[RBP \<sigma>,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RBP \<sigma>::64 word) - 0x10),8]::64 word) = (\<sigma> \<turnstile> *[((RBP \<sigma>::64 word) - 0x10),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x3c),4]::32 word) = ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((((RDI\<^sub>0::64 word) + (\<langle>63,0\<rangle>((RBX \<sigma>::64 word) * 0x4)::64 word))::64 word) - 0x4),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((((RDI\<^sub>0::64 word) + (\<langle>63,0\<rangle>((RBX \<sigma>::64 word) * 0x4)::64 word))::64 word) - 0x4),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((((RDI\<^sub>0::64 word) + (\<langle>63,0\<rangle>((RBX \<sigma>::64 word) * 0x4)::64 word))::64 word) - 0x4),4]::32 word))\<close>
declare Q_0x2c3d_30_def[Qs]

schematic_goal decode_featureset_0_3_0x2c0b_0x2c14_30[blocks]:
  assumes \<open>(P_0x2c0b_false_30 && P_0x2c0b_false_30_regions && ! ZF) \<sigma>\<close>
  shows \<open>exec_block 3 0x2c14 30 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x2c3d_30 ?\<sigma> \<and> block_usage P_0x2c0b_false_30_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x2c0b_false_30_def P_0x2c0b_false_30_regions_def post: Q_0x2c3d_30_def regionset: P_0x2c0b_false_30_regions_set_def)

definition P_0x2c3d_31 :: state_pred where
  \<open>P_0x2c3d_31 \<sigma> \<equiv> RIP \<sigma> = 0x2c3d \<and> RDI \<sigma> = 0x1 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x48) \<and> R14 \<sigma> = RDI\<^sub>0 \<and> R13 \<sigma> = (\<sigma> \<turnstile> *[RBP \<sigma>,8]::64 word) \<and> R12 \<sigma> = ucast ((\<langle>31,0\<rangle>RBX \<sigma>::32 word)) \<and> (\<sigma> \<turnstile> *[RBP \<sigma>,8]::64 word) = (\<sigma> \<turnstile> *[RBP \<sigma>,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RBP \<sigma>::64 word) - 0x10),8]::64 word) = (\<sigma> \<turnstile> *[((RBP \<sigma>::64 word) - 0x10),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x3c),4]::32 word) = ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((((RDI\<^sub>0::64 word) + (\<langle>63,0\<rangle>((RBX \<sigma>::64 word) * 0x4)::64 word))::64 word) - 0x4),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((((RDI\<^sub>0::64 word) + (\<langle>63,0\<rangle>((RBX \<sigma>::64 word) * 0x4)::64 word))::64 word) - 0x4),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((((RDI\<^sub>0::64 word) + (\<langle>63,0\<rangle>((RBX \<sigma>::64 word) * 0x4)::64 word))::64 word) - 0x4),4]::32 word))\<close>
declare P_0x2c3d_31_def[Ps]

definition P_0x2c3d_31_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x2c3d_31_regions_set \<sigma> \<equiv> {
    (0, RBP \<sigma>, 8),
    (1, RSP\<^sub>0, 8),
    (2, ((RBP \<sigma>::64 word) - 0x10), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x3c), 4),
    (10, ((RSP\<^sub>0::64 word) - 0x40), 4),
    (11, ((((RDI\<^sub>0::64 word) + (\<langle>63,0\<rangle>((RBX \<sigma>::64 word) * 0x4)::64 word))::64 word) - 0x4), 4)
  }\<close>

definition P_0x2c3d_31_regions :: state_pred where
  \<open>P_0x2c3d_31_regions \<sigma> \<equiv> \<exists>regions. P_0x2c3d_31_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x2c4b_31 :: state_pred where
  \<open>Q_0x2c4b_31 \<sigma> \<equiv> RIP \<sigma> = 0x2c4b \<and> RAX \<sigma> = ucast (((ucast ((0x1::32 word))::32 word) << unat (((\<langle>7,0\<rangle>R15 \<sigma>::8 word)::8 word)))) \<and> RCX \<sigma> = ucast ((\<langle>31,0\<rangle>R15 \<sigma>::32 word)) \<and> RDI \<sigma> = 0x1 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x48) \<and> R14 \<sigma> = RDI\<^sub>0 \<and> R13 \<sigma> = (\<sigma> \<turnstile> *[RBP \<sigma>,8]::64 word) \<and> R12 \<sigma> = ucast ((\<langle>31,0\<rangle>RBX \<sigma>::32 word)) \<and> (\<sigma> \<turnstile> *[RBP \<sigma>,8]::64 word) = (\<sigma> \<turnstile> *[RBP \<sigma>,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RBP \<sigma>::64 word) - 0x10),8]::64 word) = (\<sigma> \<turnstile> *[((RBP \<sigma>::64 word) - 0x10),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x3c),4]::32 word) = ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((((RDI\<^sub>0::64 word) + (\<langle>63,0\<rangle>((RBX \<sigma>::64 word) * 0x4)::64 word))::64 word) - 0x4),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((((RDI\<^sub>0::64 word) + (\<langle>63,0\<rangle>((RBX \<sigma>::64 word) * 0x4)::64 word))::64 word) - 0x4),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((((RDI\<^sub>0::64 word) + (\<langle>63,0\<rangle>((RBX \<sigma>::64 word) * 0x4)::64 word))::64 word) - 0x4),4]::32 word))\<close>
declare Q_0x2c4b_31_def[Qs]


lemma temp[simp]:
  fixes a :: "64 word"
  shows "unat (ucast (\<langle>7,0\<rangle>a::64 word)::32 word) = unat (\<langle>7,0\<rangle>a::8 word)"
proof-
  have 1: "(ucast (\<langle>7,0\<rangle>a::64 word)::32 word) = (ucast (\<langle>7,0\<rangle>a::8 word) :: 32 word)"
    apply (rule word_eqI)
    by (auto simp add: nth_ucast test_bit_of_take_bits word_size split: if_split_asm)
  show ?thesis
    apply (subst 1)
    apply (subst unat_ucast)
    by (auto simp add: is_up)
qed

schematic_goal decode_featureset_0_4_0x2c3d_0x2c47_31[blocks]:
  assumes \<open>(P_0x2c3d_31 && P_0x2c3d_31_regions) \<sigma>\<close>
  shows \<open>exec_block 4 0x2c47 31 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x2c4b_31 ?\<sigma> \<and> block_usage P_0x2c3d_31_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x2c3d_31_def P_0x2c3d_31_regions_def post: Q_0x2c4b_31_def regionset: P_0x2c3d_31_regions_set_def)


definition P_0x2c4b_true_32 :: state_pred where
  \<open>P_0x2c4b_true_32 \<sigma> \<equiv> RIP \<sigma> = 0x2c4b \<and> RAX \<sigma> = ucast (((ucast ((0x1::32 word))::32 word) << unat (((\<langle>7,0\<rangle>R15 \<sigma>::8 word)::8 word)))) \<and> RCX \<sigma> = ucast ((\<langle>31,0\<rangle>R15 \<sigma>::32 word)) \<and> RDI \<sigma> = 0x1 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x48) \<and> R14 \<sigma> = RDI\<^sub>0 \<and> R13 \<sigma> = (\<sigma> \<turnstile> *[RBP \<sigma>,8]::64 word) \<and> R12 \<sigma> = ucast ((\<langle>31,0\<rangle>RBX \<sigma>::32 word)) \<and> (\<sigma> \<turnstile> *[RBP \<sigma>,8]::64 word) = (\<sigma> \<turnstile> *[RBP \<sigma>,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RBP \<sigma>::64 word) - 0x10),8]::64 word) = (\<sigma> \<turnstile> *[((RBP \<sigma>::64 word) - 0x10),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x3c),4]::32 word) = ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((((RDI\<^sub>0::64 word) + (\<langle>63,0\<rangle>((RBX \<sigma>::64 word) * 0x4)::64 word))::64 word) - 0x4),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((((RDI\<^sub>0::64 word) + (\<langle>63,0\<rangle>((RBX \<sigma>::64 word) * 0x4)::64 word))::64 word) - 0x4),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((((RDI\<^sub>0::64 word) + (\<langle>63,0\<rangle>((RBX \<sigma>::64 word) * 0x4)::64 word))::64 word) - 0x4),4]::32 word))\<close>
declare P_0x2c4b_true_32_def[Ps]

definition P_0x2c4b_true_32_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x2c4b_true_32_regions_set \<sigma> \<equiv> {
    (0, RBP \<sigma>, 8),
    (1, RSP\<^sub>0, 8),
    (2, ((RBP \<sigma>::64 word) - 0x10), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x3c), 4),
    (10, ((RSP\<^sub>0::64 word) - 0x40), 4),
    (11, ((((RDI\<^sub>0::64 word) + (\<langle>63,0\<rangle>((RBX \<sigma>::64 word) * 0x4)::64 word))::64 word) - 0x4), 4)
  }\<close>

definition P_0x2c4b_true_32_regions :: state_pred where
  \<open>P_0x2c4b_true_32_regions \<sigma> \<equiv> \<exists>regions. P_0x2c4b_true_32_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x2c3b_32 :: state_pred where
  \<open>Q_0x2c3b_32 \<sigma> \<equiv> RIP \<sigma> = 0x2c3b \<and> RDI \<sigma> = 0x1 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x48) \<and> R14 \<sigma> = RDI\<^sub>0 \<and> R13 \<sigma> = (\<sigma> \<turnstile> *[RBP \<sigma>,8]::64 word) \<and> R12 \<sigma> = ucast ((\<langle>31,0\<rangle>RBX \<sigma>::32 word)) \<and> (\<sigma> \<turnstile> *[RBP \<sigma>,8]::64 word) = (\<sigma> \<turnstile> *[RBP \<sigma>,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RBP \<sigma>::64 word) - 0x10),8]::64 word) = (\<sigma> \<turnstile> *[((RBP \<sigma>::64 word) - 0x10),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x3c),4]::32 word) = ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((((RDI\<^sub>0::64 word) + (\<langle>63,0\<rangle>((RBX \<sigma>::64 word) * 0x4)::64 word))::64 word) - 0x4),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((((RDI\<^sub>0::64 word) + (\<langle>63,0\<rangle>((RBX \<sigma>::64 word) * 0x4)::64 word))::64 word) - 0x4),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((((RDI\<^sub>0::64 word) + (\<langle>63,0\<rangle>((RBX \<sigma>::64 word) * 0x4)::64 word))::64 word) - 0x4),4]::32 word))\<close>
declare Q_0x2c3b_32_def[Qs]

schematic_goal decode_featureset_0_3_0x2c4b_0x2c37_32[blocks]:
  assumes \<open>(P_0x2c4b_true_32 && P_0x2c4b_true_32_regions && ZF) \<sigma>\<close>
  shows \<open>exec_block 3 0x2c37 32 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x2c3b_32 ?\<sigma> \<and> block_usage P_0x2c4b_true_32_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x2c4b_true_32_def P_0x2c4b_true_32_regions_def post: Q_0x2c3b_32_def regionset: P_0x2c4b_true_32_regions_set_def)

definition P_0x2c3b_true_33 :: state_pred where
  \<open>P_0x2c3b_true_33 \<sigma> \<equiv> RIP \<sigma> = 0x2c3b \<and> RDI \<sigma> = 0x1 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x48) \<and> R14 \<sigma> = RDI\<^sub>0 \<and> R13 \<sigma> = (\<sigma> \<turnstile> *[RBP \<sigma>,8]::64 word) \<and> R12 \<sigma> = ucast ((\<langle>31,0\<rangle>RBX \<sigma>::32 word)) \<and> (\<sigma> \<turnstile> *[RBP \<sigma>,8]::64 word) = (\<sigma> \<turnstile> *[RBP \<sigma>,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RBP \<sigma>::64 word) - 0x10),8]::64 word) = (\<sigma> \<turnstile> *[((RBP \<sigma>::64 word) - 0x10),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x3c),4]::32 word) = ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((((RDI\<^sub>0::64 word) + (\<langle>63,0\<rangle>((RBX \<sigma>::64 word) * 0x4)::64 word))::64 word) - 0x4),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((((RDI\<^sub>0::64 word) + (\<langle>63,0\<rangle>((RBX \<sigma>::64 word) * 0x4)::64 word))::64 word) - 0x4),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((((RDI\<^sub>0::64 word) + (\<langle>63,0\<rangle>((RBX \<sigma>::64 word) * 0x4)::64 word))::64 word) - 0x4),4]::32 word))\<close>
declare P_0x2c3b_true_33_def[Ps]

definition P_0x2c3b_true_33_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x2c3b_true_33_regions_set \<sigma> \<equiv> {
    (0, RBP \<sigma>, 8),
    (1, RSP\<^sub>0, 8),
    (2, ((RBP \<sigma>::64 word) - 0x10), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x3c), 4),
    (10, ((RSP\<^sub>0::64 word) - 0x40), 4),
    (11, ((((RDI\<^sub>0::64 word) + (\<langle>63,0\<rangle>((RBX \<sigma>::64 word) * 0x4)::64 word))::64 word) - 0x4), 4)
  }\<close>

definition P_0x2c3b_true_33_regions :: state_pred where
  \<open>P_0x2c3b_true_33_regions \<sigma> \<equiv> \<exists>regions. P_0x2c3b_true_33_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x2c80_33 :: state_pred where
  \<open>Q_0x2c80_33 \<sigma> \<equiv> RIP \<sigma> = 0x2c80 \<and> RDI \<sigma> = 0x1 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x48) \<and> R14 \<sigma> = RDI\<^sub>0 \<and> R13 \<sigma> = (\<sigma> \<turnstile> *[RBP \<sigma>,8]::64 word) \<and> R12 \<sigma> = ucast ((\<langle>31,0\<rangle>RBX \<sigma>::32 word)) \<and> (\<sigma> \<turnstile> *[RBP \<sigma>,8]::64 word) = (\<sigma> \<turnstile> *[RBP \<sigma>,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RBP \<sigma>::64 word) - 0x10),8]::64 word) = (\<sigma> \<turnstile> *[((RBP \<sigma>::64 word) - 0x10),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x3c),4]::32 word) = ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((((RDI\<^sub>0::64 word) + (\<langle>63,0\<rangle>((RBX \<sigma>::64 word) * 0x4)::64 word))::64 word) - 0x4),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((((RDI\<^sub>0::64 word) + (\<langle>63,0\<rangle>((RBX \<sigma>::64 word) * 0x4)::64 word))::64 word) - 0x4),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((((RDI\<^sub>0::64 word) + (\<langle>63,0\<rangle>((RBX \<sigma>::64 word) * 0x4)::64 word))::64 word) - 0x4),4]::32 word))\<close>
declare Q_0x2c80_33_def[Qs]

schematic_goal decode_featureset_0_1_0x2c3b_0x2c3b_33[blocks]:
  assumes \<open>(P_0x2c3b_true_33 && P_0x2c3b_true_33_regions && ZF) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x2c3b 33 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x2c80_33 ?\<sigma> \<and> block_usage P_0x2c3b_true_33_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x2c3b_true_33_def P_0x2c3b_true_33_regions_def post: Q_0x2c80_33_def regionset: P_0x2c3b_true_33_regions_set_def)

definition P_0x2c3b_false_34 :: state_pred where
  \<open>P_0x2c3b_false_34 \<sigma> \<equiv> RIP \<sigma> = 0x2c3b \<and> RDI \<sigma> = 0x1 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x48) \<and> R14 \<sigma> = RDI\<^sub>0 \<and> R13 \<sigma> = (\<sigma> \<turnstile> *[RBP \<sigma>,8]::64 word) \<and> R12 \<sigma> = ucast ((\<langle>31,0\<rangle>RBX \<sigma>::32 word)) \<and> (\<sigma> \<turnstile> *[RBP \<sigma>,8]::64 word) = (\<sigma> \<turnstile> *[RBP \<sigma>,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RBP \<sigma>::64 word) - 0x10),8]::64 word) = (\<sigma> \<turnstile> *[((RBP \<sigma>::64 word) - 0x10),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x3c),4]::32 word) = ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((((RDI\<^sub>0::64 word) + (\<langle>63,0\<rangle>((RBX \<sigma>::64 word) * 0x4)::64 word))::64 word) - 0x4),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((((RDI\<^sub>0::64 word) + (\<langle>63,0\<rangle>((RBX \<sigma>::64 word) * 0x4)::64 word))::64 word) - 0x4),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((((RDI\<^sub>0::64 word) + (\<langle>63,0\<rangle>((RBX \<sigma>::64 word) * 0x4)::64 word))::64 word) - 0x4),4]::32 word))\<close>
declare P_0x2c3b_false_34_def[Ps]

definition P_0x2c3b_false_34_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x2c3b_false_34_regions_set \<sigma> \<equiv> {
    (0, RBP \<sigma>, 8),
    (1, RSP\<^sub>0, 8),
    (2, ((RBP \<sigma>::64 word) - 0x10), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x3c), 4),
    (10, ((RSP\<^sub>0::64 word) - 0x40), 4),
    (11, ((((RDI\<^sub>0::64 word) + (\<langle>63,0\<rangle>((RBX \<sigma>::64 word) * 0x4)::64 word))::64 word) - 0x4), 4)
  }\<close>

definition P_0x2c3b_false_34_regions :: state_pred where
  \<open>P_0x2c3b_false_34_regions \<sigma> \<equiv> \<exists>regions. P_0x2c3b_false_34_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x2c3d_34 :: state_pred where
  \<open>Q_0x2c3d_34 \<sigma> \<equiv> RIP \<sigma> = 0x2c3d \<and> RDI \<sigma> = 0x1 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x48) \<and> R14 \<sigma> = RDI\<^sub>0 \<and> R13 \<sigma> = (\<sigma> \<turnstile> *[RBP \<sigma>,8]::64 word) \<and> R12 \<sigma> = ucast ((\<langle>31,0\<rangle>RBX \<sigma>::32 word)) \<and> (\<sigma> \<turnstile> *[RBP \<sigma>,8]::64 word) = (\<sigma> \<turnstile> *[RBP \<sigma>,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RBP \<sigma>::64 word) - 0x10),8]::64 word) = (\<sigma> \<turnstile> *[((RBP \<sigma>::64 word) - 0x10),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x3c),4]::32 word) = ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((((RDI\<^sub>0::64 word) + (\<langle>63,0\<rangle>((RBX \<sigma>::64 word) * 0x4)::64 word))::64 word) - 0x4),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((((RDI\<^sub>0::64 word) + (\<langle>63,0\<rangle>((RBX \<sigma>::64 word) * 0x4)::64 word))::64 word) - 0x4),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((((RDI\<^sub>0::64 word) + (\<langle>63,0\<rangle>((RBX \<sigma>::64 word) * 0x4)::64 word))::64 word) - 0x4),4]::32 word))\<close>
declare Q_0x2c3d_34_def[Qs]

schematic_goal decode_featureset_0_1_0x2c3b_0x2c3b_34[blocks]:
  assumes \<open>(P_0x2c3b_false_34 && P_0x2c3b_false_34_regions && ! ZF) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x2c3b 34 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x2c3d_34 ?\<sigma> \<and> block_usage P_0x2c3b_false_34_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x2c3b_false_34_def P_0x2c3b_false_34_regions_def post: Q_0x2c3d_34_def regionset: P_0x2c3b_false_34_regions_set_def)

definition P_0x2c4b_false_35 :: state_pred where
  \<open>P_0x2c4b_false_35 \<sigma> \<equiv> RIP \<sigma> = 0x2c4b \<and> RAX \<sigma> = ucast (((ucast ((0x1::32 word))::32 word) << unat (((\<langle>7,0\<rangle>R15 \<sigma>::8 word)::8 word)))) \<and> RCX \<sigma> = ucast ((\<langle>31,0\<rangle>R15 \<sigma>::32 word)) \<and> RDI \<sigma> = 0x1 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x48) \<and> R14 \<sigma> = RDI\<^sub>0 \<and> R13 \<sigma> = (\<sigma> \<turnstile> *[RBP \<sigma>,8]::64 word) \<and> R12 \<sigma> = ucast ((\<langle>31,0\<rangle>RBX \<sigma>::32 word)) \<and> (\<sigma> \<turnstile> *[RBP \<sigma>,8]::64 word) = (\<sigma> \<turnstile> *[RBP \<sigma>,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RBP \<sigma>::64 word) - 0x10),8]::64 word) = (\<sigma> \<turnstile> *[((RBP \<sigma>::64 word) - 0x10),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x3c),4]::32 word) = ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((((RDI\<^sub>0::64 word) + (\<langle>63,0\<rangle>((RBX \<sigma>::64 word) * 0x4)::64 word))::64 word) - 0x4),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((((RDI\<^sub>0::64 word) + (\<langle>63,0\<rangle>((RBX \<sigma>::64 word) * 0x4)::64 word))::64 word) - 0x4),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((((RDI\<^sub>0::64 word) + (\<langle>63,0\<rangle>((RBX \<sigma>::64 word) * 0x4)::64 word))::64 word) - 0x4),4]::32 word))\<close>
declare P_0x2c4b_false_35_def[Ps]

definition P_0x2c4b_false_35_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x2c4b_false_35_regions_set \<sigma> \<equiv> {
    (0, RBP \<sigma>, 8),
    (1, RSP\<^sub>0, 8),
    (2, (((\<sigma> \<turnstile> *[RBP \<sigma>,8]::64 word)::64 word) + (\<langle>63,0\<rangle>((R15 \<sigma>::64 word) * 0x8)::64 word)), 8),
    (3, ((RBP \<sigma>::64 word) - 0x10), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x3c), 4),
    (11, ((RSP\<^sub>0::64 word) - 0x40), 4),
    (12, ((((RDI\<^sub>0::64 word) + (\<langle>63,0\<rangle>((RBX \<sigma>::64 word) * 0x4)::64 word))::64 word) - 0x4), 4)
  }\<close>

definition P_0x2c4b_false_35_regions :: state_pred where
  \<open>P_0x2c4b_false_35_regions \<sigma> \<equiv> \<exists>regions. P_0x2c4b_false_35_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x2c55_35 :: state_pred where
  \<open>Q_0x2c55_35 \<sigma> \<equiv> RIP \<sigma> = 0x2c55 \<and> RAX \<sigma> = ucast (((ucast ((0x1::32 word))::32 word) << unat (((\<langle>7,0\<rangle>R15 \<sigma>::8 word)::8 word)))) \<and> RCX \<sigma> = ucast ((\<langle>31,0\<rangle>R15 \<sigma>::32 word)) \<and> RDX \<sigma> = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[RBP \<sigma>,8]::64 word)::64 word) + (\<langle>63,0\<rangle>((R15 \<sigma>::64 word) * 0x8)::64 word)),8]::64 word) \<and> RDI \<sigma> = 0x1 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x48) \<and> R14 \<sigma> = RDI\<^sub>0 \<and> R13 \<sigma> = (\<sigma> \<turnstile> *[RBP \<sigma>,8]::64 word) \<and> R12 \<sigma> = ucast ((\<langle>31,0\<rangle>RBX \<sigma>::32 word)) \<and> (\<sigma> \<turnstile> *[RBP \<sigma>,8]::64 word) = (\<sigma> \<turnstile> *[RBP \<sigma>,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[RBP \<sigma>,8]::64 word)::64 word) + (\<langle>63,0\<rangle>((R15 \<sigma>::64 word) * 0x8)::64 word)),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[RBP \<sigma>,8]::64 word)::64 word) + (\<langle>63,0\<rangle>((R15 \<sigma>::64 word) * 0x8)::64 word)),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RBP \<sigma>::64 word) - 0x10),8]::64 word) = (\<sigma> \<turnstile> *[((RBP \<sigma>::64 word) - 0x10),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x3c),4]::32 word) = ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((((RDI\<^sub>0::64 word) + (\<langle>63,0\<rangle>((RBX \<sigma>::64 word) * 0x4)::64 word))::64 word) - 0x4),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((((RDI\<^sub>0::64 word) + (\<langle>63,0\<rangle>((RBX \<sigma>::64 word) * 0x4)::64 word))::64 word) - 0x4),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((((RDI\<^sub>0::64 word) + (\<langle>63,0\<rangle>((RBX \<sigma>::64 word) * 0x4)::64 word))::64 word) - 0x4),4]::32 word))\<close>
declare Q_0x2c55_35_def[Qs]

schematic_goal decode_featureset_0_3_0x2c4b_0x2c52_35[blocks]:
  assumes \<open>(P_0x2c4b_false_35 && P_0x2c4b_false_35_regions && ! ZF) \<sigma>\<close>
  shows \<open>exec_block 3 0x2c52 35 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x2c55_35 ?\<sigma> \<and> block_usage P_0x2c4b_false_35_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x2c4b_false_35_def P_0x2c4b_false_35_regions_def post: Q_0x2c55_35_def regionset: P_0x2c4b_false_35_regions_set_def)

definition P_0x2c55_true_36 :: state_pred where
  \<open>P_0x2c55_true_36 \<sigma> \<equiv> RIP \<sigma> = 0x2c55 \<and> RAX \<sigma> = ucast (((ucast ((0x1::32 word))::32 word) << unat (((\<langle>7,0\<rangle>R15 \<sigma>::8 word)::8 word)))) \<and> RCX \<sigma> = ucast ((\<langle>31,0\<rangle>R15 \<sigma>::32 word)) \<and> RDX \<sigma> = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[RBP \<sigma>,8]::64 word)::64 word) + (\<langle>63,0\<rangle>((R15 \<sigma>::64 word) * 0x8)::64 word)),8]::64 word) \<and> RDI \<sigma> = 0x1 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x48) \<and> R14 \<sigma> = RDI\<^sub>0 \<and> R13 \<sigma> = (\<sigma> \<turnstile> *[RBP \<sigma>,8]::64 word) \<and> R12 \<sigma> = ucast ((\<langle>31,0\<rangle>RBX \<sigma>::32 word)) \<and> (\<sigma> \<turnstile> *[RBP \<sigma>,8]::64 word) = (\<sigma> \<turnstile> *[RBP \<sigma>,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[RBP \<sigma>,8]::64 word)::64 word) + (\<langle>63,0\<rangle>((R15 \<sigma>::64 word) * 0x8)::64 word)),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[RBP \<sigma>,8]::64 word)::64 word) + (\<langle>63,0\<rangle>((R15 \<sigma>::64 word) * 0x8)::64 word)),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RBP \<sigma>::64 word) - 0x10),8]::64 word) = (\<sigma> \<turnstile> *[((RBP \<sigma>::64 word) - 0x10),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x3c),4]::32 word) = ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((((RDI\<^sub>0::64 word) + (\<langle>63,0\<rangle>((RBX \<sigma>::64 word) * 0x4)::64 word))::64 word) - 0x4),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((((RDI\<^sub>0::64 word) + (\<langle>63,0\<rangle>((RBX \<sigma>::64 word) * 0x4)::64 word))::64 word) - 0x4),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((((RDI\<^sub>0::64 word) + (\<langle>63,0\<rangle>((RBX \<sigma>::64 word) * 0x4)::64 word))::64 word) - 0x4),4]::32 word))\<close>
declare P_0x2c55_true_36_def[Ps]

definition P_0x2c55_true_36_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x2c55_true_36_regions_set \<sigma> \<equiv> {
    (0, RBP \<sigma>, 8),
    (1, RSP\<^sub>0, 8),
    (2, (((\<sigma> \<turnstile> *[RBP \<sigma>,8]::64 word)::64 word) + (\<langle>63,0\<rangle>((R15 \<sigma>::64 word) * 0x8)::64 word)), 8),
    (3, ((RBP \<sigma>::64 word) - 0x10), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x3c), 4),
    (11, ((RSP\<^sub>0::64 word) - 0x40), 4),
    (12, ((((RDI\<^sub>0::64 word) + (\<langle>63,0\<rangle>((RBX \<sigma>::64 word) * 0x4)::64 word))::64 word) - 0x4), 4)
  }\<close>

definition P_0x2c55_true_36_regions :: state_pred where
  \<open>P_0x2c55_true_36_regions \<sigma> \<equiv> \<exists>regions. P_0x2c55_true_36_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x2c2e_36 :: state_pred where
  \<open>Q_0x2c2e_36 \<sigma> \<equiv> RIP \<sigma> = 0x2c2e \<and> RAX \<sigma> = 0x0 \<and> RCX \<sigma> = ucast ((\<langle>31,0\<rangle>R15 \<sigma>::32 word)) \<and> RDX \<sigma> = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[RBP \<sigma>,8]::64 word)::64 word) + (\<langle>63,0\<rangle>((R15 \<sigma>::64 word) * 0x8)::64 word)),8]::64 word) \<and> RDI \<sigma> = 0x1 \<and> RSI \<sigma> = 0x31a7 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x48) \<and> R14 \<sigma> = RDI\<^sub>0 \<and> R13 \<sigma> = (\<sigma> \<turnstile> *[RBP \<sigma>,8]::64 word) \<and> R12 \<sigma> = ucast ((\<langle>31,0\<rangle>RBX \<sigma>::32 word)) \<and> (\<sigma> \<turnstile> *[RBP \<sigma>,8]::64 word) = (\<sigma> \<turnstile> *[RBP \<sigma>,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[RBP \<sigma>,8]::64 word)::64 word) + (\<langle>63,0\<rangle>((R15 \<sigma>::64 word) * 0x8)::64 word)),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[RBP \<sigma>,8]::64 word)::64 word) + (\<langle>63,0\<rangle>((R15 \<sigma>::64 word) * 0x8)::64 word)),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RBP \<sigma>::64 word) - 0x10),8]::64 word) = (\<sigma> \<turnstile> *[((RBP \<sigma>::64 word) - 0x10),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x3c),4]::32 word) = ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((((RDI\<^sub>0::64 word) + (\<langle>63,0\<rangle>((RBX \<sigma>::64 word) * 0x4)::64 word))::64 word) - 0x4),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((((RDI\<^sub>0::64 word) + (\<langle>63,0\<rangle>((RBX \<sigma>::64 word) * 0x4)::64 word))::64 word) - 0x4),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((((RDI\<^sub>0::64 word) + (\<langle>63,0\<rangle>((RBX \<sigma>::64 word) * 0x4)::64 word))::64 word) - 0x4),4]::32 word))\<close>
declare Q_0x2c2e_36_def[Qs]

schematic_goal decode_featureset_0_4_0x2c55_0x2c2c_36[blocks]:
  assumes \<open>(P_0x2c55_true_36 && P_0x2c55_true_36_regions && !ZF) \<sigma>\<close>
  shows \<open>exec_block 4 0x2c2c 36 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x2c2e_36 ?\<sigma> \<and> block_usage P_0x2c55_true_36_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x2c55_true_36_def P_0x2c55_true_36_regions_def post: Q_0x2c2e_36_def regionset: P_0x2c55_true_36_regions_set_def)

definition P_0x2c2e_37 :: state_pred where
  \<open>P_0x2c2e_37 \<sigma> \<equiv> RIP \<sigma> = 0x2c2e \<and> RAX \<sigma> = 0x0 \<and> RCX \<sigma> = ucast ((\<langle>31,0\<rangle>R15 \<sigma>::32 word)) \<and> RDX \<sigma> = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[RBP \<sigma>,8]::64 word)::64 word) + (\<langle>63,0\<rangle>((R15 \<sigma>::64 word) * 0x8)::64 word)),8]::64 word) \<and> RDI \<sigma> = 0x1 \<and> RSI \<sigma> = 0x31a7 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x48) \<and> R14 \<sigma> = RDI\<^sub>0 \<and> R13 \<sigma> = (\<sigma> \<turnstile> *[RBP \<sigma>,8]::64 word) \<and> R12 \<sigma> = ucast ((\<langle>31,0\<rangle>RBX \<sigma>::32 word)) \<and> (\<sigma> \<turnstile> *[RBP \<sigma>,8]::64 word) = (\<sigma> \<turnstile> *[RBP \<sigma>,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[RBP \<sigma>,8]::64 word)::64 word) + (\<langle>63,0\<rangle>((R15 \<sigma>::64 word) * 0x8)::64 word)),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[RBP \<sigma>,8]::64 word)::64 word) + (\<langle>63,0\<rangle>((R15 \<sigma>::64 word) * 0x8)::64 word)),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RBP \<sigma>::64 word) - 0x10),8]::64 word) = (\<sigma> \<turnstile> *[((RBP \<sigma>::64 word) - 0x10),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x3c),4]::32 word) = ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((((RDI\<^sub>0::64 word) + (\<langle>63,0\<rangle>((RBX \<sigma>::64 word) * 0x4)::64 word))::64 word) - 0x4),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((((RDI\<^sub>0::64 word) + (\<langle>63,0\<rangle>((RBX \<sigma>::64 word) * 0x4)::64 word))::64 word) - 0x4),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((((RDI\<^sub>0::64 word) + (\<langle>63,0\<rangle>((RBX \<sigma>::64 word) * 0x4)::64 word))::64 word) - 0x4),4]::32 word))\<close>
declare P_0x2c2e_37_def[Ps]

definition P_0x2c2e_37_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x2c2e_37_regions_set \<sigma> \<equiv> {
    (0, RBP \<sigma>, 8),
    (1, RSP\<^sub>0, 8),
    (2, (((\<sigma> \<turnstile> *[RBP \<sigma>,8]::64 word)::64 word) + (\<langle>63,0\<rangle>((R15 \<sigma>::64 word) * 0x8)::64 word)), 8),
    (3, ((RBP \<sigma>::64 word) - 0x10), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x3c), 4),
    (11, ((RSP\<^sub>0::64 word) - 0x40), 4),
    (12, ((RSP\<^sub>0::64 word) - 0x50), 8),
    (13, ((((RDI\<^sub>0::64 word) + (\<langle>63,0\<rangle>((RBX \<sigma>::64 word) * 0x4)::64 word))::64 word) - 0x4), 4)
  }\<close>

definition P_0x2c2e_37_regions :: state_pred where
  \<open>P_0x2c2e_37_regions \<sigma> \<equiv> \<exists>regions. P_0x2c2e_37_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_printf_chk_addr_0x2c2e_37 :: state_pred where
  \<open>Q_printf_chk_addr_0x2c2e_37 \<sigma> \<equiv> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x50) \<and> RIP \<sigma> = printf_chk_addr \<and> RAX \<sigma> = 0x0 \<and> RCX \<sigma> = ucast ((\<langle>31,0\<rangle>R15 \<sigma>::32 word)) \<and> RDX \<sigma> = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[RBP \<sigma>,8]::64 word)::64 word) + (\<langle>63,0\<rangle>((R15 \<sigma>::64 word) * 0x8)::64 word)),8]::64 word) \<and> RDI \<sigma> = 0x1 \<and> RSI \<sigma> = 0x31a7 \<and> R14 \<sigma> = RDI\<^sub>0 \<and> R13 \<sigma> = (\<sigma> \<turnstile> *[RBP \<sigma>,8]::64 word) \<and> R12 \<sigma> = ucast ((\<langle>31,0\<rangle>RBX \<sigma>::32 word)) \<and> (\<sigma> \<turnstile> *[RBP \<sigma>,8]::64 word) = (\<sigma> \<turnstile> *[RBP \<sigma>,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[RBP \<sigma>,8]::64 word)::64 word) + (\<langle>63,0\<rangle>((R15 \<sigma>::64 word) * 0x8)::64 word)),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[RBP \<sigma>,8]::64 word)::64 word) + (\<langle>63,0\<rangle>((R15 \<sigma>::64 word) * 0x8)::64 word)),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RBP \<sigma>::64 word) - 0x10),8]::64 word) = (\<sigma> \<turnstile> *[((RBP \<sigma>::64 word) - 0x10),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x3c),4]::32 word) = ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((((RDI\<^sub>0::64 word) + (\<langle>63,0\<rangle>((RBX \<sigma>::64 word) * 0x4)::64 word))::64 word) - 0x4),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),8]::64 word) = 0x2c33 \<and> (\<sigma> \<turnstile> *[((((RDI\<^sub>0::64 word) + (\<langle>63,0\<rangle>((RBX \<sigma>::64 word) * 0x4)::64 word))::64 word) - 0x4),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((((RDI\<^sub>0::64 word) + (\<langle>63,0\<rangle>((RBX \<sigma>::64 word) * 0x4)::64 word))::64 word) - 0x4),4]::32 word))\<close>
declare Q_printf_chk_addr_0x2c2e_37_def[Qs]

schematic_goal decode_featureset_0_1_0x2c2e_0x2c2e_37[blocks]:
  assumes \<open>(P_0x2c2e_37 && P_0x2c2e_37_regions) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x2c2e 37 \<sigma> \<triangleq> ?\<sigma> \<and> Q_printf_chk_addr_0x2c2e_37 ?\<sigma> \<and> block_usage P_0x2c2e_37_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x2c2e_37_def P_0x2c2e_37_regions_def post: Q_printf_chk_addr_0x2c2e_37_def regionset: P_0x2c2e_37_regions_set_def)

definition P_0x2c33_38 :: state_pred where
  \<open>P_0x2c33_38 \<sigma> \<equiv> RIP \<sigma> = 0x2c33 \<and> RAX \<sigma> = printf_chk_0x2c2e_retval \<and> RCX \<sigma> = ucast ((\<langle>31,0\<rangle>R15 \<sigma>::32 word)) \<and> RDX \<sigma> = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[RBP \<sigma>,8]::64 word)::64 word) + (\<langle>63,0\<rangle>((R15 \<sigma>::64 word) * 0x8)::64 word)),8]::64 word) \<and> RDI \<sigma> = 0x1 \<and> RSI \<sigma> = 0x31a7 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x48) \<and> R14 \<sigma> = RDI\<^sub>0 \<and> R13 \<sigma> = (\<sigma> \<turnstile> *[RBP \<sigma>,8]::64 word) \<and> R12 \<sigma> = ucast ((\<langle>31,0\<rangle>RBX \<sigma>::32 word)) \<and> (\<sigma> \<turnstile> *[RBP \<sigma>,8]::64 word) = (\<sigma> \<turnstile> *[RBP \<sigma>,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[RBP \<sigma>,8]::64 word)::64 word) + (\<langle>63,0\<rangle>((R15 \<sigma>::64 word) * 0x8)::64 word)),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[RBP \<sigma>,8]::64 word)::64 word) + (\<langle>63,0\<rangle>((R15 \<sigma>::64 word) * 0x8)::64 word)),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RBP \<sigma>::64 word) - 0x10),8]::64 word) = (\<sigma> \<turnstile> *[((RBP \<sigma>::64 word) - 0x10),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x3c),4]::32 word) = ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((((RDI\<^sub>0::64 word) + (\<langle>63,0\<rangle>((RBX \<sigma>::64 word) * 0x4)::64 word))::64 word) - 0x4),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),8]::64 word) = 0x2c33 \<and> (\<sigma> \<turnstile> *[((((RDI\<^sub>0::64 word) + (\<langle>63,0\<rangle>((RBX \<sigma>::64 word) * 0x4)::64 word))::64 word) - 0x4),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((((RDI\<^sub>0::64 word) + (\<langle>63,0\<rangle>((RBX \<sigma>::64 word) * 0x4)::64 word))::64 word) - 0x4),4]::32 word))\<close>
declare P_0x2c33_38_def[Ps]

definition P_0x2c33_38_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x2c33_38_regions_set \<sigma> \<equiv> {
    (0, RBP \<sigma>, 8),
    (1, RSP\<^sub>0, 8),
    (2, (((\<sigma> \<turnstile> *[RBP \<sigma>,8]::64 word)::64 word) + (\<langle>63,0\<rangle>((R15 \<sigma>::64 word) * 0x8)::64 word)), 8),
    (3, ((RBP \<sigma>::64 word) - 0x10), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x3c), 4),
    (11, ((RSP\<^sub>0::64 word) - 0x40), 4),
    (12, ((RSP\<^sub>0::64 word) - 0x50), 8),
    (13, ((((RDI\<^sub>0::64 word) + (\<langle>63,0\<rangle>((RBX \<sigma>::64 word) * 0x4)::64 word))::64 word) - 0x4), 4)
  }\<close>

definition P_0x2c33_38_regions :: state_pred where
  \<open>P_0x2c33_38_regions \<sigma> \<equiv> \<exists>regions. P_0x2c33_38_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x2c3b_38 :: state_pred where
  \<open>Q_0x2c3b_38 \<sigma> \<equiv> RIP \<sigma> = 0x2c3b \<and> RDI \<sigma> = 0x1 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x48) \<and> R14 \<sigma> = RDI\<^sub>0 \<and> R13 \<sigma> = (\<sigma> \<turnstile> *[RBP \<sigma>,8]::64 word) \<and> R12 \<sigma> = ucast ((\<langle>31,0\<rangle>RBX \<sigma>::32 word)) \<and> (\<sigma> \<turnstile> *[RBP \<sigma>,8]::64 word) = (\<sigma> \<turnstile> *[RBP \<sigma>,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RBP \<sigma>::64 word) - 0x10),8]::64 word) = (\<sigma> \<turnstile> *[((RBP \<sigma>::64 word) - 0x10),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x3c),4]::32 word) = ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((((RDI\<^sub>0::64 word) + (\<langle>63,0\<rangle>((RBX \<sigma>::64 word) * 0x4)::64 word))::64 word) - 0x4),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((((RDI\<^sub>0::64 word) + (\<langle>63,0\<rangle>((RBX \<sigma>::64 word) * 0x4)::64 word))::64 word) - 0x4),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((((RDI\<^sub>0::64 word) + (\<langle>63,0\<rangle>((RBX \<sigma>::64 word) * 0x4)::64 word))::64 word) - 0x4),4]::32 word))\<close>
declare Q_0x2c3b_38_def[Qs]

schematic_goal decode_featureset_0_2_0x2c33_0x2c37_38[blocks]:
  assumes \<open>(P_0x2c33_38 && P_0x2c33_38_regions) \<sigma>\<close>
  shows \<open>exec_block 2 0x2c37 38 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x2c3b_38 ?\<sigma> \<and> block_usage P_0x2c33_38_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x2c33_38_def P_0x2c33_38_regions_def post: Q_0x2c3b_38_def regionset: P_0x2c33_38_regions_set_def)

definition P_0x2c3b_true_39 :: state_pred where
  \<open>P_0x2c3b_true_39 \<sigma> \<equiv> RIP \<sigma> = 0x2c3b \<and> RDI \<sigma> = 0x1 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x48) \<and> R14 \<sigma> = RDI\<^sub>0 \<and> R13 \<sigma> = (\<sigma> \<turnstile> *[RBP \<sigma>,8]::64 word) \<and> R12 \<sigma> = ucast ((\<langle>31,0\<rangle>RBX \<sigma>::32 word)) \<and> (\<sigma> \<turnstile> *[RBP \<sigma>,8]::64 word) = (\<sigma> \<turnstile> *[RBP \<sigma>,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RBP \<sigma>::64 word) - 0x10),8]::64 word) = (\<sigma> \<turnstile> *[((RBP \<sigma>::64 word) - 0x10),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x3c),4]::32 word) = ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((((RDI\<^sub>0::64 word) + (\<langle>63,0\<rangle>((RBX \<sigma>::64 word) * 0x4)::64 word))::64 word) - 0x4),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((((RDI\<^sub>0::64 word) + (\<langle>63,0\<rangle>((RBX \<sigma>::64 word) * 0x4)::64 word))::64 word) - 0x4),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((((RDI\<^sub>0::64 word) + (\<langle>63,0\<rangle>((RBX \<sigma>::64 word) * 0x4)::64 word))::64 word) - 0x4),4]::32 word))\<close>
declare P_0x2c3b_true_39_def[Ps]

definition P_0x2c3b_true_39_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x2c3b_true_39_regions_set \<sigma> \<equiv> {
    (0, RBP \<sigma>, 8),
    (1, RSP\<^sub>0, 8),
    (2, ((RBP \<sigma>::64 word) - 0x10), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x3c), 4),
    (10, ((RSP\<^sub>0::64 word) - 0x40), 4),
    (11, ((((RDI\<^sub>0::64 word) + (\<langle>63,0\<rangle>((RBX \<sigma>::64 word) * 0x4)::64 word))::64 word) - 0x4), 4)
  }\<close>

definition P_0x2c3b_true_39_regions :: state_pred where
  \<open>P_0x2c3b_true_39_regions \<sigma> \<equiv> \<exists>regions. P_0x2c3b_true_39_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x2c80_39 :: state_pred where
  \<open>Q_0x2c80_39 \<sigma> \<equiv> RIP \<sigma> = 0x2c80 \<and> RDI \<sigma> = 0x1 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x48) \<and> R14 \<sigma> = RDI\<^sub>0 \<and> R13 \<sigma> = (\<sigma> \<turnstile> *[RBP \<sigma>,8]::64 word) \<and> R12 \<sigma> = ucast ((\<langle>31,0\<rangle>RBX \<sigma>::32 word)) \<and> (\<sigma> \<turnstile> *[RBP \<sigma>,8]::64 word) = (\<sigma> \<turnstile> *[RBP \<sigma>,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RBP \<sigma>::64 word) - 0x10),8]::64 word) = (\<sigma> \<turnstile> *[((RBP \<sigma>::64 word) - 0x10),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x3c),4]::32 word) = ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((((RDI\<^sub>0::64 word) + (\<langle>63,0\<rangle>((RBX \<sigma>::64 word) * 0x4)::64 word))::64 word) - 0x4),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((((RDI\<^sub>0::64 word) + (\<langle>63,0\<rangle>((RBX \<sigma>::64 word) * 0x4)::64 word))::64 word) - 0x4),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((((RDI\<^sub>0::64 word) + (\<langle>63,0\<rangle>((RBX \<sigma>::64 word) * 0x4)::64 word))::64 word) - 0x4),4]::32 word))\<close>
declare Q_0x2c80_39_def[Qs]

schematic_goal decode_featureset_0_1_0x2c3b_0x2c3b_39[blocks]:
  assumes \<open>(P_0x2c3b_true_39 && P_0x2c3b_true_39_regions && ZF) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x2c3b 39 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x2c80_39 ?\<sigma> \<and> block_usage P_0x2c3b_true_39_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x2c3b_true_39_def P_0x2c3b_true_39_regions_def post: Q_0x2c80_39_def regionset: P_0x2c3b_true_39_regions_set_def)

definition P_0x2c3b_false_40 :: state_pred where
  \<open>P_0x2c3b_false_40 \<sigma> \<equiv> RIP \<sigma> = 0x2c3b \<and> RDI \<sigma> = 0x1 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x48) \<and> R14 \<sigma> = RDI\<^sub>0 \<and> R13 \<sigma> = (\<sigma> \<turnstile> *[RBP \<sigma>,8]::64 word) \<and> R12 \<sigma> = ucast ((\<langle>31,0\<rangle>RBX \<sigma>::32 word)) \<and> (\<sigma> \<turnstile> *[RBP \<sigma>,8]::64 word) = (\<sigma> \<turnstile> *[RBP \<sigma>,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RBP \<sigma>::64 word) - 0x10),8]::64 word) = (\<sigma> \<turnstile> *[((RBP \<sigma>::64 word) - 0x10),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x3c),4]::32 word) = ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((((RDI\<^sub>0::64 word) + (\<langle>63,0\<rangle>((RBX \<sigma>::64 word) * 0x4)::64 word))::64 word) - 0x4),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((((RDI\<^sub>0::64 word) + (\<langle>63,0\<rangle>((RBX \<sigma>::64 word) * 0x4)::64 word))::64 word) - 0x4),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((((RDI\<^sub>0::64 word) + (\<langle>63,0\<rangle>((RBX \<sigma>::64 word) * 0x4)::64 word))::64 word) - 0x4),4]::32 word))\<close>
declare P_0x2c3b_false_40_def[Ps]

definition P_0x2c3b_false_40_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x2c3b_false_40_regions_set \<sigma> \<equiv> {
    (0, RBP \<sigma>, 8),
    (1, RSP\<^sub>0, 8),
    (2, ((RBP \<sigma>::64 word) - 0x10), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x3c), 4),
    (10, ((RSP\<^sub>0::64 word) - 0x40), 4),
    (11, ((((RDI\<^sub>0::64 word) + (\<langle>63,0\<rangle>((RBX \<sigma>::64 word) * 0x4)::64 word))::64 word) - 0x4), 4)
  }\<close>

definition P_0x2c3b_false_40_regions :: state_pred where
  \<open>P_0x2c3b_false_40_regions \<sigma> \<equiv> \<exists>regions. P_0x2c3b_false_40_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x2c3d_40 :: state_pred where
  \<open>Q_0x2c3d_40 \<sigma> \<equiv> RIP \<sigma> = 0x2c3d \<and> RDI \<sigma> = 0x1 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x48) \<and> R14 \<sigma> = RDI\<^sub>0 \<and> R13 \<sigma> = (\<sigma> \<turnstile> *[RBP \<sigma>,8]::64 word) \<and> R12 \<sigma> = ucast ((\<langle>31,0\<rangle>RBX \<sigma>::32 word)) \<and> (\<sigma> \<turnstile> *[RBP \<sigma>,8]::64 word) = (\<sigma> \<turnstile> *[RBP \<sigma>,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RBP \<sigma>::64 word) - 0x10),8]::64 word) = (\<sigma> \<turnstile> *[((RBP \<sigma>::64 word) - 0x10),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x3c),4]::32 word) = ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((((RDI\<^sub>0::64 word) + (\<langle>63,0\<rangle>((RBX \<sigma>::64 word) * 0x4)::64 word))::64 word) - 0x4),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((((RDI\<^sub>0::64 word) + (\<langle>63,0\<rangle>((RBX \<sigma>::64 word) * 0x4)::64 word))::64 word) - 0x4),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((((RDI\<^sub>0::64 word) + (\<langle>63,0\<rangle>((RBX \<sigma>::64 word) * 0x4)::64 word))::64 word) - 0x4),4]::32 word))\<close>
declare Q_0x2c3d_40_def[Qs]

schematic_goal decode_featureset_0_1_0x2c3b_0x2c3b_40[blocks]:
  assumes \<open>(P_0x2c3b_false_40 && P_0x2c3b_false_40_regions && ! ZF) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x2c3b 40 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x2c3d_40 ?\<sigma> \<and> block_usage P_0x2c3b_false_40_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x2c3b_false_40_def P_0x2c3b_false_40_regions_def post: Q_0x2c3d_40_def regionset: P_0x2c3b_false_40_regions_set_def)

definition P_0x2c55_false_41 :: state_pred where
  \<open>P_0x2c55_false_41 \<sigma> \<equiv> RIP \<sigma> = 0x2c55 \<and> RAX \<sigma> = ucast (((ucast ((0x1::32 word))::32 word) << unat (((\<langle>7,0\<rangle>R15 \<sigma>::8 word)::8 word)))) \<and> RCX \<sigma> = ucast ((\<langle>31,0\<rangle>R15 \<sigma>::32 word)) \<and> RDX \<sigma> = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[RBP \<sigma>,8]::64 word)::64 word) + (\<langle>63,0\<rangle>((R15 \<sigma>::64 word) * 0x8)::64 word)),8]::64 word) \<and> RDI \<sigma> = 0x1 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x48) \<and> R14 \<sigma> = RDI\<^sub>0 \<and> R13 \<sigma> = (\<sigma> \<turnstile> *[RBP \<sigma>,8]::64 word) \<and> R12 \<sigma> = ucast ((\<langle>31,0\<rangle>RBX \<sigma>::32 word)) \<and> (\<sigma> \<turnstile> *[RBP \<sigma>,8]::64 word) = (\<sigma> \<turnstile> *[RBP \<sigma>,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[RBP \<sigma>,8]::64 word)::64 word) + (\<langle>63,0\<rangle>((R15 \<sigma>::64 word) * 0x8)::64 word)),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[RBP \<sigma>,8]::64 word)::64 word) + (\<langle>63,0\<rangle>((R15 \<sigma>::64 word) * 0x8)::64 word)),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RBP \<sigma>::64 word) - 0x10),8]::64 word) = (\<sigma> \<turnstile> *[((RBP \<sigma>::64 word) - 0x10),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x3c),4]::32 word) = ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((((RDI\<^sub>0::64 word) + (\<langle>63,0\<rangle>((RBX \<sigma>::64 word) * 0x4)::64 word))::64 word) - 0x4),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((((RDI\<^sub>0::64 word) + (\<langle>63,0\<rangle>((RBX \<sigma>::64 word) * 0x4)::64 word))::64 word) - 0x4),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((((RDI\<^sub>0::64 word) + (\<langle>63,0\<rangle>((RBX \<sigma>::64 word) * 0x4)::64 word))::64 word) - 0x4),4]::32 word))\<close>
declare P_0x2c55_false_41_def[Ps]

definition P_0x2c55_false_41_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x2c55_false_41_regions_set \<sigma> \<equiv> {
    (0, RBP \<sigma>, 8),
    (1, RSP\<^sub>0, 8),
    (2, (((\<sigma> \<turnstile> *[RBP \<sigma>,8]::64 word)::64 word) + (\<langle>63,0\<rangle>((R15 \<sigma>::64 word) * 0x8)::64 word)), 8),
    (3, ((RBP \<sigma>::64 word) - 0x10), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x3c), 4),
    (11, ((RSP\<^sub>0::64 word) - 0x40), 4),
    (12, ((((RDI\<^sub>0::64 word) + (\<langle>63,0\<rangle>((RBX \<sigma>::64 word) * 0x4)::64 word))::64 word) - 0x4), 4)
  }\<close>

definition P_0x2c55_false_41_regions :: state_pred where
  \<open>P_0x2c55_false_41_regions \<sigma> \<equiv> \<exists>regions. P_0x2c55_false_41_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x2c68_41 :: state_pred where
  \<open>Q_0x2c68_41 \<sigma> \<equiv> RIP \<sigma> = 0x2c68 \<and> RAX \<sigma> = 0x0 \<and> RCX \<sigma> = ucast ((\<langle>31,0\<rangle>R15 \<sigma>::32 word)) \<and> RDX \<sigma> = ucast ((\<langle>31,0\<rangle>R15 \<sigma>::32 word)) \<and> RDI \<sigma> = 0x1 \<and> RSI \<sigma> = 0x31ab \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x48) \<and> R14 \<sigma> = RDI\<^sub>0 \<and> R13 \<sigma> = (\<sigma> \<turnstile> *[RBP \<sigma>,8]::64 word) \<and> R12 \<sigma> = ucast ((\<langle>31,0\<rangle>RBX \<sigma>::32 word)) \<and> (\<sigma> \<turnstile> *[RBP \<sigma>,8]::64 word) = (\<sigma> \<turnstile> *[RBP \<sigma>,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[RBP \<sigma>,8]::64 word)::64 word) + (\<langle>63,0\<rangle>((R15 \<sigma>::64 word) * 0x8)::64 word)),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[RBP \<sigma>,8]::64 word)::64 word) + (\<langle>63,0\<rangle>((R15 \<sigma>::64 word) * 0x8)::64 word)),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RBP \<sigma>::64 word) - 0x10),8]::64 word) = (\<sigma> \<turnstile> *[((RBP \<sigma>::64 word) - 0x10),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x3c),4]::32 word) = ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((((RDI\<^sub>0::64 word) + (\<langle>63,0\<rangle>((RBX \<sigma>::64 word) * 0x4)::64 word))::64 word) - 0x4),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((((RDI\<^sub>0::64 word) + (\<langle>63,0\<rangle>((RBX \<sigma>::64 word) * 0x4)::64 word))::64 word) - 0x4),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((((RDI\<^sub>0::64 word) + (\<langle>63,0\<rangle>((RBX \<sigma>::64 word) * 0x4)::64 word))::64 word) - 0x4),4]::32 word))\<close>
declare Q_0x2c68_41_def[Qs]

schematic_goal decode_featureset_0_5_0x2c55_0x2c66_41[blocks]:
  assumes \<open>(P_0x2c55_false_41 && P_0x2c55_false_41_regions && ! !ZF) \<sigma>\<close>
  shows \<open>exec_block 5 0x2c66 41 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x2c68_41 ?\<sigma> \<and> block_usage P_0x2c55_false_41_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x2c55_false_41_def P_0x2c55_false_41_regions_def post: Q_0x2c68_41_def regionset: P_0x2c55_false_41_regions_set_def)

definition P_0x2c68_42 :: state_pred where
  \<open>P_0x2c68_42 \<sigma> \<equiv> RIP \<sigma> = 0x2c68 \<and> RAX \<sigma> = 0x0 \<and> RCX \<sigma> = ucast ((\<langle>31,0\<rangle>R15 \<sigma>::32 word)) \<and> RDX \<sigma> = ucast ((\<langle>31,0\<rangle>R15 \<sigma>::32 word)) \<and> RDI \<sigma> = 0x1 \<and> RSI \<sigma> = 0x31ab \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x48) \<and> R14 \<sigma> = RDI\<^sub>0 \<and> R13 \<sigma> = (\<sigma> \<turnstile> *[RBP \<sigma>,8]::64 word) \<and> R12 \<sigma> = ucast ((\<langle>31,0\<rangle>RBX \<sigma>::32 word)) \<and> (\<sigma> \<turnstile> *[RBP \<sigma>,8]::64 word) = (\<sigma> \<turnstile> *[RBP \<sigma>,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[RBP \<sigma>,8]::64 word)::64 word) + (\<langle>63,0\<rangle>((R15 \<sigma>::64 word) * 0x8)::64 word)),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[RBP \<sigma>,8]::64 word)::64 word) + (\<langle>63,0\<rangle>((R15 \<sigma>::64 word) * 0x8)::64 word)),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RBP \<sigma>::64 word) - 0x10),8]::64 word) = (\<sigma> \<turnstile> *[((RBP \<sigma>::64 word) - 0x10),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x3c),4]::32 word) = ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((((RDI\<^sub>0::64 word) + (\<langle>63,0\<rangle>((RBX \<sigma>::64 word) * 0x4)::64 word))::64 word) - 0x4),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((((RDI\<^sub>0::64 word) + (\<langle>63,0\<rangle>((RBX \<sigma>::64 word) * 0x4)::64 word))::64 word) - 0x4),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((((RDI\<^sub>0::64 word) + (\<langle>63,0\<rangle>((RBX \<sigma>::64 word) * 0x4)::64 word))::64 word) - 0x4),4]::32 word))\<close>
declare P_0x2c68_42_def[Ps]

definition P_0x2c68_42_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x2c68_42_regions_set \<sigma> \<equiv> {
    (0, RBP \<sigma>, 8),
    (1, RSP\<^sub>0, 8),
    (2, (((\<sigma> \<turnstile> *[RBP \<sigma>,8]::64 word)::64 word) + (\<langle>63,0\<rangle>((R15 \<sigma>::64 word) * 0x8)::64 word)), 8),
    (3, ((RBP \<sigma>::64 word) - 0x10), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x3c), 4),
    (11, ((RSP\<^sub>0::64 word) - 0x40), 4),
    (12, ((RSP\<^sub>0::64 word) - 0x50), 8),
    (13, ((((RDI\<^sub>0::64 word) + (\<langle>63,0\<rangle>((RBX \<sigma>::64 word) * 0x4)::64 word))::64 word) - 0x4), 4)
  }\<close>

definition P_0x2c68_42_regions :: state_pred where
  \<open>P_0x2c68_42_regions \<sigma> \<equiv> \<exists>regions. P_0x2c68_42_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_printf_chk_addr_0x2c68_42 :: state_pred where
  \<open>Q_printf_chk_addr_0x2c68_42 \<sigma> \<equiv> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x50) \<and> RIP \<sigma> = printf_chk_addr \<and> RAX \<sigma> = 0x0 \<and> RCX \<sigma> = ucast ((\<langle>31,0\<rangle>R15 \<sigma>::32 word)) \<and> RDX \<sigma> = ucast ((\<langle>31,0\<rangle>R15 \<sigma>::32 word)) \<and> RDI \<sigma> = 0x1 \<and> RSI \<sigma> = 0x31ab \<and> R14 \<sigma> = RDI\<^sub>0 \<and> R13 \<sigma> = (\<sigma> \<turnstile> *[RBP \<sigma>,8]::64 word) \<and> R12 \<sigma> = ucast ((\<langle>31,0\<rangle>RBX \<sigma>::32 word)) \<and> (\<sigma> \<turnstile> *[RBP \<sigma>,8]::64 word) = (\<sigma> \<turnstile> *[RBP \<sigma>,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[RBP \<sigma>,8]::64 word)::64 word) + (\<langle>63,0\<rangle>((R15 \<sigma>::64 word) * 0x8)::64 word)),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[RBP \<sigma>,8]::64 word)::64 word) + (\<langle>63,0\<rangle>((R15 \<sigma>::64 word) * 0x8)::64 word)),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RBP \<sigma>::64 word) - 0x10),8]::64 word) = (\<sigma> \<turnstile> *[((RBP \<sigma>::64 word) - 0x10),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x3c),4]::32 word) = ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((((RDI\<^sub>0::64 word) + (\<langle>63,0\<rangle>((RBX \<sigma>::64 word) * 0x4)::64 word))::64 word) - 0x4),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),8]::64 word) = 0x2c6d \<and> (\<sigma> \<turnstile> *[((((RDI\<^sub>0::64 word) + (\<langle>63,0\<rangle>((RBX \<sigma>::64 word) * 0x4)::64 word))::64 word) - 0x4),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((((RDI\<^sub>0::64 word) + (\<langle>63,0\<rangle>((RBX \<sigma>::64 word) * 0x4)::64 word))::64 word) - 0x4),4]::32 word))\<close>
declare Q_printf_chk_addr_0x2c68_42_def[Qs]

schematic_goal decode_featureset_0_1_0x2c68_0x2c68_42[blocks]:
  assumes \<open>(P_0x2c68_42 && P_0x2c68_42_regions) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x2c68 42 \<sigma> \<triangleq> ?\<sigma> \<and> Q_printf_chk_addr_0x2c68_42 ?\<sigma> \<and> block_usage P_0x2c68_42_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x2c68_42_def P_0x2c68_42_regions_def post: Q_printf_chk_addr_0x2c68_42_def regionset: P_0x2c68_42_regions_set_def)

definition P_0x2c6d_43 :: state_pred where
  \<open>P_0x2c6d_43 \<sigma> \<equiv> RIP \<sigma> = 0x2c6d \<and> RAX \<sigma> = printf_chk_0x2c68_retval \<and> RCX \<sigma> = ucast ((\<langle>31,0\<rangle>R15 \<sigma>::32 word)) \<and> RDX \<sigma> = ucast ((\<langle>31,0\<rangle>R15 \<sigma>::32 word)) \<and> RDI \<sigma> = 0x1 \<and> RSI \<sigma> = 0x31ab \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x48) \<and> R14 \<sigma> = RDI\<^sub>0 \<and> R13 \<sigma> = (\<sigma> \<turnstile> *[RBP \<sigma>,8]::64 word) \<and> R12 \<sigma> = ucast ((\<langle>31,0\<rangle>RBX \<sigma>::32 word)) \<and> (\<sigma> \<turnstile> *[RBP \<sigma>,8]::64 word) = (\<sigma> \<turnstile> *[RBP \<sigma>,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[RBP \<sigma>,8]::64 word)::64 word) + (\<langle>63,0\<rangle>((R15 \<sigma>::64 word) * 0x8)::64 word)),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[RBP \<sigma>,8]::64 word)::64 word) + (\<langle>63,0\<rangle>((R15 \<sigma>::64 word) * 0x8)::64 word)),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RBP \<sigma>::64 word) - 0x10),8]::64 word) = (\<sigma> \<turnstile> *[((RBP \<sigma>::64 word) - 0x10),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x3c),4]::32 word) = ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((((RDI\<^sub>0::64 word) + (\<langle>63,0\<rangle>((RBX \<sigma>::64 word) * 0x4)::64 word))::64 word) - 0x4),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),8]::64 word) = 0x2c6d \<and> (\<sigma> \<turnstile> *[((((RDI\<^sub>0::64 word) + (\<langle>63,0\<rangle>((RBX \<sigma>::64 word) * 0x4)::64 word))::64 word) - 0x4),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((((RDI\<^sub>0::64 word) + (\<langle>63,0\<rangle>((RBX \<sigma>::64 word) * 0x4)::64 word))::64 word) - 0x4),4]::32 word))\<close>
declare P_0x2c6d_43_def[Ps]

definition P_0x2c6d_43_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x2c6d_43_regions_set \<sigma> \<equiv> {
    (0, RBP \<sigma>, 8),
    (1, RSP\<^sub>0, 8),
    (2, (((\<sigma> \<turnstile> *[RBP \<sigma>,8]::64 word)::64 word) + (\<langle>63,0\<rangle>((R15 \<sigma>::64 word) * 0x8)::64 word)), 8),
    (3, ((RBP \<sigma>::64 word) - 0x10), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x3c), 4),
    (11, ((RSP\<^sub>0::64 word) - 0x40), 4),
    (12, ((RSP\<^sub>0::64 word) - 0x50), 8),
    (13, ((((RDI\<^sub>0::64 word) + (\<langle>63,0\<rangle>((RBX \<sigma>::64 word) * 0x4)::64 word))::64 word) - 0x4), 4)
  }\<close>

definition P_0x2c6d_43_regions :: state_pred where
  \<open>P_0x2c6d_43_regions \<sigma> \<equiv> \<exists>regions. P_0x2c6d_43_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x2c75_43 :: state_pred where
  \<open>Q_0x2c75_43 \<sigma> \<equiv> RIP \<sigma> = 0x2c75 \<and> RDI \<sigma> = 0x1 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x48) \<and> R14 \<sigma> = RDI\<^sub>0 \<and> R13 \<sigma> = (\<sigma> \<turnstile> *[RBP \<sigma>,8]::64 word) \<and> R12 \<sigma> = ucast ((\<langle>31,0\<rangle>RBX \<sigma>::32 word)) \<and> (\<sigma> \<turnstile> *[RBP \<sigma>,8]::64 word) = (\<sigma> \<turnstile> *[RBP \<sigma>,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RBP \<sigma>::64 word) - 0x10),8]::64 word) = (\<sigma> \<turnstile> *[((RBP \<sigma>::64 word) - 0x10),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x3c),4]::32 word) = ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((((RDI\<^sub>0::64 word) + (\<langle>63,0\<rangle>((RBX \<sigma>::64 word) * 0x4)::64 word))::64 word) - 0x4),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((((RDI\<^sub>0::64 word) + (\<langle>63,0\<rangle>((RBX \<sigma>::64 word) * 0x4)::64 word))::64 word) - 0x4),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((((RDI\<^sub>0::64 word) + (\<langle>63,0\<rangle>((RBX \<sigma>::64 word) * 0x4)::64 word))::64 word) - 0x4),4]::32 word))\<close>
declare Q_0x2c75_43_def[Qs]

schematic_goal decode_featureset_0_2_0x2c6d_0x2c71_43[blocks]:
  assumes \<open>(P_0x2c6d_43 && P_0x2c6d_43_regions) \<sigma>\<close>
  shows \<open>exec_block 2 0x2c71 43 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x2c75_43 ?\<sigma> \<and> block_usage P_0x2c6d_43_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x2c6d_43_def P_0x2c6d_43_regions_def post: Q_0x2c75_43_def regionset: P_0x2c6d_43_regions_set_def)

definition P_0x2c75_true_44 :: state_pred where
  \<open>P_0x2c75_true_44 \<sigma> \<equiv> RIP \<sigma> = 0x2c75 \<and> RDI \<sigma> = 0x1 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x48) \<and> R14 \<sigma> = RDI\<^sub>0 \<and> R13 \<sigma> = (\<sigma> \<turnstile> *[RBP \<sigma>,8]::64 word) \<and> R12 \<sigma> = ucast ((\<langle>31,0\<rangle>RBX \<sigma>::32 word)) \<and> (\<sigma> \<turnstile> *[RBP \<sigma>,8]::64 word) = (\<sigma> \<turnstile> *[RBP \<sigma>,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RBP \<sigma>::64 word) - 0x10),8]::64 word) = (\<sigma> \<turnstile> *[((RBP \<sigma>::64 word) - 0x10),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x3c),4]::32 word) = ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((((RDI\<^sub>0::64 word) + (\<langle>63,0\<rangle>((RBX \<sigma>::64 word) * 0x4)::64 word))::64 word) - 0x4),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((((RDI\<^sub>0::64 word) + (\<langle>63,0\<rangle>((RBX \<sigma>::64 word) * 0x4)::64 word))::64 word) - 0x4),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((((RDI\<^sub>0::64 word) + (\<langle>63,0\<rangle>((RBX \<sigma>::64 word) * 0x4)::64 word))::64 word) - 0x4),4]::32 word))\<close>
declare P_0x2c75_true_44_def[Ps]

definition P_0x2c75_true_44_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x2c75_true_44_regions_set \<sigma> \<equiv> {
    (0, RBP \<sigma>, 8),
    (1, RSP\<^sub>0, 8),
    (2, ((RBP \<sigma>::64 word) - 0x10), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x3c), 4),
    (10, ((RSP\<^sub>0::64 word) - 0x40), 4),
    (11, ((((RDI\<^sub>0::64 word) + (\<langle>63,0\<rangle>((RBX \<sigma>::64 word) * 0x4)::64 word))::64 word) - 0x4), 4)
  }\<close>

definition P_0x2c75_true_44_regions :: state_pred where
  \<open>P_0x2c75_true_44_regions \<sigma> \<equiv> \<exists>regions. P_0x2c75_true_44_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x2c3d_44 :: state_pred where
  \<open>Q_0x2c3d_44 \<sigma> \<equiv> RIP \<sigma> = 0x2c3d \<and> RDI \<sigma> = 0x1 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x48) \<and> R14 \<sigma> = RDI\<^sub>0 \<and> R13 \<sigma> = (\<sigma> \<turnstile> *[RBP \<sigma>,8]::64 word) \<and> R12 \<sigma> = ucast ((\<langle>31,0\<rangle>RBX \<sigma>::32 word)) \<and> (\<sigma> \<turnstile> *[RBP \<sigma>,8]::64 word) = (\<sigma> \<turnstile> *[RBP \<sigma>,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RBP \<sigma>::64 word) - 0x10),8]::64 word) = (\<sigma> \<turnstile> *[((RBP \<sigma>::64 word) - 0x10),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x3c),4]::32 word) = ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((((RDI\<^sub>0::64 word) + (\<langle>63,0\<rangle>((RBX \<sigma>::64 word) * 0x4)::64 word))::64 word) - 0x4),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((((RDI\<^sub>0::64 word) + (\<langle>63,0\<rangle>((RBX \<sigma>::64 word) * 0x4)::64 word))::64 word) - 0x4),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((((RDI\<^sub>0::64 word) + (\<langle>63,0\<rangle>((RBX \<sigma>::64 word) * 0x4)::64 word))::64 word) - 0x4),4]::32 word))\<close>
declare Q_0x2c3d_44_def[Qs]

schematic_goal decode_featureset_0_1_0x2c75_0x2c75_44[blocks]:
  assumes \<open>(P_0x2c75_true_44 && P_0x2c75_true_44_regions && !ZF) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x2c75 44 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x2c3d_44 ?\<sigma> \<and> block_usage P_0x2c75_true_44_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x2c75_true_44_def P_0x2c75_true_44_regions_def post: Q_0x2c3d_44_def regionset: P_0x2c75_true_44_regions_set_def)

definition P_0x2c75_false_45 :: state_pred where
  \<open>P_0x2c75_false_45 \<sigma> \<equiv> RIP \<sigma> = 0x2c75 \<and> RDI \<sigma> = 0x1 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x48) \<and> R14 \<sigma> = RDI\<^sub>0 \<and> R13 \<sigma> = (\<sigma> \<turnstile> *[RBP \<sigma>,8]::64 word) \<and> R12 \<sigma> = ucast ((\<langle>31,0\<rangle>RBX \<sigma>::32 word)) \<and> (\<sigma> \<turnstile> *[RBP \<sigma>,8]::64 word) = (\<sigma> \<turnstile> *[RBP \<sigma>,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RBP \<sigma>::64 word) - 0x10),8]::64 word) = (\<sigma> \<turnstile> *[((RBP \<sigma>::64 word) - 0x10),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x3c),4]::32 word) = ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((((RDI\<^sub>0::64 word) + (\<langle>63,0\<rangle>((RBX \<sigma>::64 word) * 0x4)::64 word))::64 word) - 0x4),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((((RDI\<^sub>0::64 word) + (\<langle>63,0\<rangle>((RBX \<sigma>::64 word) * 0x4)::64 word))::64 word) - 0x4),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((((RDI\<^sub>0::64 word) + (\<langle>63,0\<rangle>((RBX \<sigma>::64 word) * 0x4)::64 word))::64 word) - 0x4),4]::32 word))\<close>
declare P_0x2c75_false_45_def[Ps]

definition P_0x2c75_false_45_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x2c75_false_45_regions_set \<sigma> \<equiv> {
    (0, RBP \<sigma>, 8),
    (1, RSP\<^sub>0, 8),
    (2, ((RBP \<sigma>::64 word) - 0x10), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x3c), 4),
    (10, ((RSP\<^sub>0::64 word) - 0x40), 4),
    (11, ((((RDI\<^sub>0::64 word) + (\<langle>63,0\<rangle>((RBX \<sigma>::64 word) * 0x4)::64 word))::64 word) - 0x4), 4)
  }\<close>

definition P_0x2c75_false_45_regions :: state_pred where
  \<open>P_0x2c75_false_45_regions \<sigma> \<equiv> \<exists>regions. P_0x2c75_false_45_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x2c77_45 :: state_pred where
  \<open>Q_0x2c77_45 \<sigma> \<equiv> RIP \<sigma> = 0x2c77 \<and> RDI \<sigma> = 0x1 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x48) \<and> R14 \<sigma> = RDI\<^sub>0 \<and> R13 \<sigma> = (\<sigma> \<turnstile> *[RBP \<sigma>,8]::64 word) \<and> R12 \<sigma> = ucast ((\<langle>31,0\<rangle>RBX \<sigma>::32 word)) \<and> (\<sigma> \<turnstile> *[RBP \<sigma>,8]::64 word) = (\<sigma> \<turnstile> *[RBP \<sigma>,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RBP \<sigma>::64 word) - 0x10),8]::64 word) = (\<sigma> \<turnstile> *[((RBP \<sigma>::64 word) - 0x10),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x3c),4]::32 word) = ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((((RDI\<^sub>0::64 word) + (\<langle>63,0\<rangle>((RBX \<sigma>::64 word) * 0x4)::64 word))::64 word) - 0x4),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((((RDI\<^sub>0::64 word) + (\<langle>63,0\<rangle>((RBX \<sigma>::64 word) * 0x4)::64 word))::64 word) - 0x4),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((((RDI\<^sub>0::64 word) + (\<langle>63,0\<rangle>((RBX \<sigma>::64 word) * 0x4)::64 word))::64 word) - 0x4),4]::32 word))\<close>
declare Q_0x2c77_45_def[Qs]

schematic_goal decode_featureset_0_1_0x2c75_0x2c75_45[blocks]:
  assumes \<open>(P_0x2c75_false_45 && P_0x2c75_false_45_regions && ! !ZF) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x2c75 45 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x2c77_45 ?\<sigma> \<and> block_usage P_0x2c75_false_45_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x2c75_false_45_def P_0x2c75_false_45_regions_def post: Q_0x2c77_45_def regionset: P_0x2c75_false_45_regions_set_def)

definition P_0x2c77_46 :: state_pred where
  \<open>P_0x2c77_46 \<sigma> \<equiv> RIP \<sigma> = 0x2c77 \<and> RDI \<sigma> = 0x1 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x48) \<and> R14 \<sigma> = RDI\<^sub>0 \<and> R13 \<sigma> = (\<sigma> \<turnstile> *[RBP \<sigma>,8]::64 word) \<and> R12 \<sigma> = ucast ((\<langle>31,0\<rangle>RBX \<sigma>::32 word)) \<and> (\<sigma> \<turnstile> *[RBP \<sigma>,8]::64 word) = (\<sigma> \<turnstile> *[RBP \<sigma>,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RBP \<sigma>::64 word) - 0x10),8]::64 word) = (\<sigma> \<turnstile> *[((RBP \<sigma>::64 word) - 0x10),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x3c),4]::32 word) = ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((((RDI\<^sub>0::64 word) + (\<langle>63,0\<rangle>((RBX \<sigma>::64 word) * 0x4)::64 word))::64 word) - 0x4),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((((RDI\<^sub>0::64 word) + (\<langle>63,0\<rangle>((RBX \<sigma>::64 word) * 0x4)::64 word))::64 word) - 0x4),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((((RDI\<^sub>0::64 word) + (\<langle>63,0\<rangle>((RBX \<sigma>::64 word) * 0x4)::64 word))::64 word) - 0x4),4]::32 word))\<close>
declare P_0x2c77_46_def[Ps]

definition P_0x2c77_46_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x2c77_46_regions_set \<sigma> \<equiv> {
    (0, RBP \<sigma>, 8),
    (1, RSP\<^sub>0, 8),
    (2, ((RBP \<sigma>::64 word) - 0x10), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x3c), 4),
    (10, ((RSP\<^sub>0::64 word) - 0x40), 4),
    (11, ((((RDI\<^sub>0::64 word) + (\<langle>63,0\<rangle>((RBX \<sigma>::64 word) * 0x4)::64 word))::64 word) - 0x4), 4)
  }\<close>

definition P_0x2c77_46_regions :: state_pred where
  \<open>P_0x2c77_46_regions \<sigma> \<equiv> \<exists>regions. P_0x2c77_46_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x2c80_46 :: state_pred where
  \<open>Q_0x2c80_46 \<sigma> \<equiv> RIP \<sigma> = 0x2c80 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x48) \<and> R14 \<sigma> = RDI\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x3c),4]::32 word) = ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word))\<close>
declare Q_0x2c80_46_def[Qs]

schematic_goal decode_featureset_0_1_0x2c77_0x2c77_46[blocks]:
  assumes \<open>(P_0x2c77_46 && P_0x2c77_46_regions) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x2c77 46 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x2c80_46 ?\<sigma> \<and> block_usage P_0x2c77_46_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x2c77_46_def P_0x2c77_46_regions_def post: Q_0x2c80_46_def regionset: P_0x2c77_46_regions_set_def)

definition P_0x2cac_false_47 :: state_pred where
  \<open>P_0x2cac_false_47 \<sigma> \<equiv> RIP \<sigma> = 0x2cac \<and> RCX \<sigma> = (\<sigma> \<turnstile> *[((RBP \<sigma>::64 word) - 0x10),8]::64 word) \<and> RDX \<sigma> = ucast ((\<langle>31,0\<rangle>((RBX \<sigma>::64 word) - 0x1)::32 word)) \<and> RDI \<sigma> = 0xa \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x48) \<and> R14 \<sigma> = RDI\<^sub>0 \<and> R12 \<sigma> = ucast ((\<langle>31,0\<rangle>RBX \<sigma>::32 word)) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RBP \<sigma>::64 word) - 0x10),8]::64 word) = (\<sigma> \<turnstile> *[((RBP \<sigma>::64 word) - 0x10),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x3c),4]::32 word) = ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),8]::64 word) = 0x2c92\<close>
declare P_0x2cac_false_47_def[Ps]

definition P_0x2cac_false_47_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x2cac_false_47_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((RBP \<sigma>::64 word) - 0x10), 8),
    (2, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x3c), 4),
    (9, ((RSP\<^sub>0::64 word) - 0x50), 8)
  }\<close>

definition P_0x2cac_false_47_regions :: state_pred where
  \<open>P_0x2cac_false_47_regions \<sigma> \<equiv> \<exists>regions. P_0x2cac_false_47_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x2cb2_47 :: state_pred where
  \<open>Q_0x2cb2_47 \<sigma> \<equiv> RIP \<sigma> = 0x2cb2 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x48) \<and> R14 \<sigma> = RDI\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x3c),4]::32 word) = ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word))\<close>
declare Q_0x2cb2_47_def[Qs]

schematic_goal decode_featureset_0_1_0x2cac_0x2cac_47[blocks]:
  assumes \<open>(P_0x2cac_false_47 && P_0x2cac_false_47_regions && ! !ZF) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x2cac 47 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x2cb2_47 ?\<sigma> \<and> block_usage P_0x2cac_false_47_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x2cac_false_47_def P_0x2cac_false_47_regions_def post: Q_0x2cb2_47_def regionset: P_0x2cac_false_47_regions_set_def)

definition P_0x2bdf_false_48 :: state_pred where
  \<open>P_0x2bdf_false_48 \<sigma> \<equiv> RIP \<sigma> = 0x2bdf \<and> RBX \<sigma> = 0x1 \<and> RCX \<sigma> = 0x317e \<and> RDX \<sigma> = 0x0 \<and> RDI \<sigma> = 0x1 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x48) \<and> RBP \<sigma> = 0x4c10 \<and> R14 \<sigma> = RDI\<^sub>0 \<and> R13 \<sigma> = ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)) \<and> R12 \<sigma> = 0x1 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x3c),4]::32 word) = ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word))\<close>
declare P_0x2bdf_false_48_def[Ps]

definition P_0x2bdf_false_48_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x2bdf_false_48_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (2, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x3c), 4)
  }\<close>

definition P_0x2bdf_false_48_regions :: state_pred where
  \<open>P_0x2bdf_false_48_regions \<sigma> \<equiv> \<exists>regions. P_0x2bdf_false_48_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x2be8_48 :: state_pred where
  \<open>Q_0x2be8_48 \<sigma> \<equiv> RIP \<sigma> = 0x2be8 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x48) \<and> R14 \<sigma> = RDI\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x3c),4]::32 word) = ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word))\<close>
declare Q_0x2be8_48_def[Qs]

schematic_goal decode_featureset_0_2_0x2bdf_0x2be5_48[blocks]:
  assumes \<open>(P_0x2bdf_false_48 && P_0x2bdf_false_48_regions && ! ZF) \<sigma>\<close>
  shows \<open>exec_block 2 0x2be5 48 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x2be8_48 ?\<sigma> \<and> block_usage P_0x2bdf_false_48_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x2bdf_false_48_def P_0x2bdf_false_48_regions_def post: Q_0x2be8_48_def regionset: P_0x2bdf_false_48_regions_set_def)

definition P_0x2be8_49 :: state_pred where
  \<open>P_0x2be8_49 \<sigma> \<equiv> RIP \<sigma> = 0x2be8 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x48) \<and> R14 \<sigma> = RDI\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x3c),4]::32 word) = ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word))\<close>
declare P_0x2be8_49_def[Ps]

definition P_0x2be8_49_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x2be8_49_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (2, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x3c), 4)
  }\<close>

definition P_0x2be8_49_regions :: state_pred where
  \<open>P_0x2be8_49_regions \<sigma> \<equiv> \<exists>regions. P_0x2be8_49_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x2bf6_49 :: state_pred where
  \<open>Q_0x2bf6_49 \<sigma> \<equiv> RIP \<sigma> = 0x2bf6 \<and> RAX \<sigma> = 0x0 \<and> RDI \<sigma> = 0x1 \<and> RSI \<sigma> = 0x31b1 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x48) \<and> R14 \<sigma> = RDI\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x3c),4]::32 word) = ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word))\<close>
declare Q_0x2bf6_49_def[Qs]

schematic_goal decode_featureset_0_3_0x2be8_0x2bf4_49[blocks]:
  assumes \<open>(P_0x2be8_49 && P_0x2be8_49_regions) \<sigma>\<close>
  shows \<open>exec_block 3 0x2bf4 49 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x2bf6_49 ?\<sigma> \<and> block_usage P_0x2be8_49_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x2be8_49_def P_0x2be8_49_regions_def post: Q_0x2bf6_49_def regionset: P_0x2be8_49_regions_set_def)

definition P_0x2bf6_50 :: state_pred where
  \<open>P_0x2bf6_50 \<sigma> \<equiv> RIP \<sigma> = 0x2bf6 \<and> RAX \<sigma> = 0x0 \<and> RDI \<sigma> = 0x1 \<and> RSI \<sigma> = 0x31b1 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x48) \<and> R14 \<sigma> = RDI\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x3c),4]::32 word) = ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word))\<close>
declare P_0x2bf6_50_def[Ps]

definition P_0x2bf6_50_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x2bf6_50_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (2, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x3c), 4),
    (8, ((RSP\<^sub>0::64 word) - 0x50), 8)
  }\<close>

definition P_0x2bf6_50_regions :: state_pred where
  \<open>P_0x2bf6_50_regions \<sigma> \<equiv> \<exists>regions. P_0x2bf6_50_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_printf_chk_addr_0x2bf6_50 :: state_pred where
  \<open>Q_printf_chk_addr_0x2bf6_50 \<sigma> \<equiv> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x50) \<and> RIP \<sigma> = printf_chk_addr \<and> RAX \<sigma> = 0x0 \<and> RDI \<sigma> = 0x1 \<and> RSI \<sigma> = 0x31b1 \<and> R14 \<sigma> = RDI\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x3c),4]::32 word) = ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),8]::64 word) = 0x2bfb\<close>
declare Q_printf_chk_addr_0x2bf6_50_def[Qs]

schematic_goal decode_featureset_0_1_0x2bf6_0x2bf6_50[blocks]:
  assumes \<open>(P_0x2bf6_50 && P_0x2bf6_50_regions) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x2bf6 50 \<sigma> \<triangleq> ?\<sigma> \<and> Q_printf_chk_addr_0x2bf6_50 ?\<sigma> \<and> block_usage P_0x2bf6_50_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x2bf6_50_def P_0x2bf6_50_regions_def post: Q_printf_chk_addr_0x2bf6_50_def regionset: P_0x2bf6_50_regions_set_def)

definition P_0x2bfb_51 :: state_pred where
  \<open>P_0x2bfb_51 \<sigma> \<equiv> RIP \<sigma> = 0x2bfb \<and> RAX \<sigma> = printf_chk_0x2bf6_retval \<and> RDI \<sigma> = 0x1 \<and> RSI \<sigma> = 0x31b1 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x48) \<and> R14 \<sigma> = RDI\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x3c),4]::32 word) = ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),8]::64 word) = 0x2bfb\<close>
declare P_0x2bfb_51_def[Ps]

definition P_0x2bfb_51_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x2bfb_51_regions_set \<sigma> \<equiv> {
    (0, RBP \<sigma>, 8),
    (1, RSP\<^sub>0, 8),
    (2, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x3c), 4),
    (9, ((RSP\<^sub>0::64 word) - 0x40), 4),
    (10, ((RSP\<^sub>0::64 word) - 0x50), 8),
    (11, ((((RDI\<^sub>0::64 word) + (\<langle>63,0\<rangle>((RBX \<sigma>::64 word) * 0x4)::64 word))::64 word) - 0x4), 4)
  }\<close>

definition P_0x2bfb_51_regions :: state_pred where
  \<open>P_0x2bfb_51_regions \<sigma> \<equiv> \<exists>regions. P_0x2bfb_51_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x2c0b_51 :: state_pred where
  \<open>Q_0x2c0b_51 \<sigma> \<equiv> RIP \<sigma> = 0x2c0b \<and> RAX \<sigma> = ucast ((\<sigma> \<turnstile> *[((((RDI\<^sub>0::64 word) + (\<langle>63,0\<rangle>((RBX \<sigma>::64 word) * 0x4)::64 word))::64 word) - 0x4),4]::32 word)) \<and> RDI \<sigma> = 0x1 \<and> RSI \<sigma> = 0x31b1 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x48) \<and> R14 \<sigma> = RDI\<^sub>0 \<and> R13 \<sigma> = (\<sigma> \<turnstile> *[RBP \<sigma>,8]::64 word) \<and> (\<sigma> \<turnstile> *[RBP \<sigma>,8]::64 word) = (\<sigma> \<turnstile> *[RBP \<sigma>,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x3c),4]::32 word) = ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((((RDI\<^sub>0::64 word) + (\<langle>63,0\<rangle>((RBX \<sigma>::64 word) * 0x4)::64 word))::64 word) - 0x4),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),8]::64 word) = 0x2bfb \<and> (\<sigma> \<turnstile> *[((((RDI\<^sub>0::64 word) + (\<langle>63,0\<rangle>((RBX \<sigma>::64 word) * 0x4)::64 word))::64 word) - 0x4),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((((RDI\<^sub>0::64 word) + (\<langle>63,0\<rangle>((RBX \<sigma>::64 word) * 0x4)::64 word))::64 word) - 0x4),4]::32 word))\<close>
declare Q_0x2c0b_51_def[Qs]

schematic_goal decode_featureset_0_4_0x2bfb_0x2c08_51[blocks]:
  assumes \<open>(P_0x2bfb_51 && P_0x2bfb_51_regions) \<sigma>\<close>
  shows \<open>exec_block 4 0x2c08 51 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x2c0b_51 ?\<sigma> \<and> block_usage P_0x2bfb_51_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x2bfb_51_def P_0x2bfb_51_regions_def post: Q_0x2c0b_51_def regionset: P_0x2bfb_51_regions_set_def)

definition P_0x2c0b_true_52 :: state_pred where
  \<open>P_0x2c0b_true_52 \<sigma> \<equiv> RIP \<sigma> = 0x2c0b \<and> RAX \<sigma> = ucast ((\<sigma> \<turnstile> *[((((RDI\<^sub>0::64 word) + (\<langle>63,0\<rangle>((RBX \<sigma>::64 word) * 0x4)::64 word))::64 word) - 0x4),4]::32 word)) \<and> RDI \<sigma> = 0x1 \<and> RSI \<sigma> = 0x31b1 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x48) \<and> R14 \<sigma> = RDI\<^sub>0 \<and> R13 \<sigma> = (\<sigma> \<turnstile> *[RBP \<sigma>,8]::64 word) \<and> (\<sigma> \<turnstile> *[RBP \<sigma>,8]::64 word) = (\<sigma> \<turnstile> *[RBP \<sigma>,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x3c),4]::32 word) = ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((((RDI\<^sub>0::64 word) + (\<langle>63,0\<rangle>((RBX \<sigma>::64 word) * 0x4)::64 word))::64 word) - 0x4),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),8]::64 word) = 0x2bfb \<and> (\<sigma> \<turnstile> *[((((RDI\<^sub>0::64 word) + (\<langle>63,0\<rangle>((RBX \<sigma>::64 word) * 0x4)::64 word))::64 word) - 0x4),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((((RDI\<^sub>0::64 word) + (\<langle>63,0\<rangle>((RBX \<sigma>::64 word) * 0x4)::64 word))::64 word) - 0x4),4]::32 word))\<close>
declare P_0x2c0b_true_52_def[Ps]

definition P_0x2c0b_true_52_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x2c0b_true_52_regions_set \<sigma> \<equiv> {
    (0, RBP \<sigma>, 8),
    (1, RSP\<^sub>0, 8),
    (2, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x3c), 4),
    (9, ((RSP\<^sub>0::64 word) - 0x40), 4),
    (10, ((RSP\<^sub>0::64 word) - 0x50), 8),
    (11, ((((RDI\<^sub>0::64 word) + (\<langle>63,0\<rangle>((RBX \<sigma>::64 word) * 0x4)::64 word))::64 word) - 0x4), 4)
  }\<close>

definition P_0x2c0b_true_52_regions :: state_pred where
  \<open>P_0x2c0b_true_52_regions \<sigma> \<equiv> \<exists>regions. P_0x2c0b_true_52_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x2cee_52 :: state_pred where
  \<open>Q_0x2cee_52 \<sigma> \<equiv> RIP \<sigma> = 0x2cee \<and> RAX \<sigma> = 0x0 \<and> RDI \<sigma> = 0x1 \<and> RSI \<sigma> = 0x31a2 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x48) \<and> R14 \<sigma> = RDI\<^sub>0 \<and> R13 \<sigma> = (\<sigma> \<turnstile> *[RBP \<sigma>,8]::64 word) \<and> (\<sigma> \<turnstile> *[RBP \<sigma>,8]::64 word) = (\<sigma> \<turnstile> *[RBP \<sigma>,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x3c),4]::32 word) = ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((((RDI\<^sub>0::64 word) + (\<langle>63,0\<rangle>((RBX \<sigma>::64 word) * 0x4)::64 word))::64 word) - 0x4),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),8]::64 word) = 0x2bfb \<and> (\<sigma> \<turnstile> *[((((RDI\<^sub>0::64 word) + (\<langle>63,0\<rangle>((RBX \<sigma>::64 word) * 0x4)::64 word))::64 word) - 0x4),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((((RDI\<^sub>0::64 word) + (\<langle>63,0\<rangle>((RBX \<sigma>::64 word) * 0x4)::64 word))::64 word) - 0x4),4]::32 word))\<close>
declare Q_0x2cee_52_def[Qs]

schematic_goal decode_featureset_0_4_0x2c0b_0x2cec_52[blocks]:
  assumes \<open>(P_0x2c0b_true_52 && P_0x2c0b_true_52_regions && ZF) \<sigma>\<close>
  shows \<open>exec_block 4 0x2cec 52 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x2cee_52 ?\<sigma> \<and> block_usage P_0x2c0b_true_52_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x2c0b_true_52_def P_0x2c0b_true_52_regions_def post: Q_0x2cee_52_def regionset: P_0x2c0b_true_52_regions_set_def)

definition P_0x2cee_53 :: state_pred where
  \<open>P_0x2cee_53 \<sigma> \<equiv> RIP \<sigma> = 0x2cee \<and> RAX \<sigma> = 0x0 \<and> RDI \<sigma> = 0x1 \<and> RSI \<sigma> = 0x31a2 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x48) \<and> R14 \<sigma> = RDI\<^sub>0 \<and> R13 \<sigma> = (\<sigma> \<turnstile> *[RBP \<sigma>,8]::64 word) \<and> (\<sigma> \<turnstile> *[RBP \<sigma>,8]::64 word) = (\<sigma> \<turnstile> *[RBP \<sigma>,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x3c),4]::32 word) = ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((((RDI\<^sub>0::64 word) + (\<langle>63,0\<rangle>((RBX \<sigma>::64 word) * 0x4)::64 word))::64 word) - 0x4),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),8]::64 word) = 0x2bfb \<and> (\<sigma> \<turnstile> *[((((RDI\<^sub>0::64 word) + (\<langle>63,0\<rangle>((RBX \<sigma>::64 word) * 0x4)::64 word))::64 word) - 0x4),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((((RDI\<^sub>0::64 word) + (\<langle>63,0\<rangle>((RBX \<sigma>::64 word) * 0x4)::64 word))::64 word) - 0x4),4]::32 word))\<close>
declare P_0x2cee_53_def[Ps]

definition P_0x2cee_53_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x2cee_53_regions_set \<sigma> \<equiv> {
    (0, RBP \<sigma>, 8),
    (1, RSP\<^sub>0, 8),
    (2, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x3c), 4),
    (9, ((RSP\<^sub>0::64 word) - 0x40), 4),
    (10, ((RSP\<^sub>0::64 word) - 0x50), 8),
    (11, ((((RDI\<^sub>0::64 word) + (\<langle>63,0\<rangle>((RBX \<sigma>::64 word) * 0x4)::64 word))::64 word) - 0x4), 4)
  }\<close>

definition P_0x2cee_53_regions :: state_pred where
  \<open>P_0x2cee_53_regions \<sigma> \<equiv> \<exists>regions. P_0x2cee_53_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_printf_chk_addr_0x2cee_53 :: state_pred where
  \<open>Q_printf_chk_addr_0x2cee_53 \<sigma> \<equiv> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x50) \<and> RIP \<sigma> = printf_chk_addr \<and> RAX \<sigma> = 0x0 \<and> RDI \<sigma> = 0x1 \<and> RSI \<sigma> = 0x31a2 \<and> R14 \<sigma> = RDI\<^sub>0 \<and> R13 \<sigma> = (\<sigma> \<turnstile> *[RBP \<sigma>,8]::64 word) \<and> (\<sigma> \<turnstile> *[RBP \<sigma>,8]::64 word) = (\<sigma> \<turnstile> *[RBP \<sigma>,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x3c),4]::32 word) = ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((((RDI\<^sub>0::64 word) + (\<langle>63,0\<rangle>((RBX \<sigma>::64 word) * 0x4)::64 word))::64 word) - 0x4),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),8]::64 word) = 0x2cf3 \<and> (\<sigma> \<turnstile> *[((((RDI\<^sub>0::64 word) + (\<langle>63,0\<rangle>((RBX \<sigma>::64 word) * 0x4)::64 word))::64 word) - 0x4),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((((RDI\<^sub>0::64 word) + (\<langle>63,0\<rangle>((RBX \<sigma>::64 word) * 0x4)::64 word))::64 word) - 0x4),4]::32 word))\<close>
declare Q_printf_chk_addr_0x2cee_53_def[Qs]

schematic_goal decode_featureset_0_1_0x2cee_0x2cee_53[blocks]:
  assumes \<open>(P_0x2cee_53 && P_0x2cee_53_regions) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x2cee 53 \<sigma> \<triangleq> ?\<sigma> \<and> Q_printf_chk_addr_0x2cee_53 ?\<sigma> \<and> block_usage P_0x2cee_53_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x2cee_53_def P_0x2cee_53_regions_def post: Q_printf_chk_addr_0x2cee_53_def regionset: P_0x2cee_53_regions_set_def)

definition P_0x2cf3_54 :: state_pred where
  \<open>P_0x2cf3_54 \<sigma> \<equiv> RIP \<sigma> = 0x2cf3 \<and> RAX \<sigma> = printf_chk_0x2cee_retval \<and> RDI \<sigma> = 0x1 \<and> RSI \<sigma> = 0x31a2 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x48) \<and> R14 \<sigma> = RDI\<^sub>0 \<and> R13 \<sigma> = (\<sigma> \<turnstile> *[RBP \<sigma>,8]::64 word) \<and> (\<sigma> \<turnstile> *[RBP \<sigma>,8]::64 word) = (\<sigma> \<turnstile> *[RBP \<sigma>,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x3c),4]::32 word) = ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((((RDI\<^sub>0::64 word) + (\<langle>63,0\<rangle>((RBX \<sigma>::64 word) * 0x4)::64 word))::64 word) - 0x4),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),8]::64 word) = 0x2cf3 \<and> (\<sigma> \<turnstile> *[((((RDI\<^sub>0::64 word) + (\<langle>63,0\<rangle>((RBX \<sigma>::64 word) * 0x4)::64 word))::64 word) - 0x4),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((((RDI\<^sub>0::64 word) + (\<langle>63,0\<rangle>((RBX \<sigma>::64 word) * 0x4)::64 word))::64 word) - 0x4),4]::32 word))\<close>
declare P_0x2cf3_54_def[Ps]

definition P_0x2cf3_54_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x2cf3_54_regions_set \<sigma> \<equiv> {
    (0, RBP \<sigma>, 8),
    (1, RSP\<^sub>0, 8),
    (2, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x3c), 4),
    (9, ((RSP\<^sub>0::64 word) - 0x40), 4),
    (10, ((RSP\<^sub>0::64 word) - 0x50), 8),
    (11, ((((RDI\<^sub>0::64 word) + (\<langle>63,0\<rangle>((RBX \<sigma>::64 word) * 0x4)::64 word))::64 word) - 0x4), 4)
  }\<close>

definition P_0x2cf3_54_regions :: state_pred where
  \<open>P_0x2cf3_54_regions \<sigma> \<equiv> \<exists>regions. P_0x2cf3_54_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x2c80_54 :: state_pred where
  \<open>Q_0x2c80_54 \<sigma> \<equiv> RIP \<sigma> = 0x2c80 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x48) \<and> R14 \<sigma> = RDI\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x3c),4]::32 word) = ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word))\<close>
declare Q_0x2c80_54_def[Qs]

schematic_goal decode_featureset_0_1_0x2cf3_0x2cf3_54[blocks]:
  assumes \<open>(P_0x2cf3_54 && P_0x2cf3_54_regions) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x2cf3 54 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x2c80_54 ?\<sigma> \<and> block_usage P_0x2cf3_54_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x2cf3_54_def P_0x2cf3_54_regions_def post: Q_0x2c80_54_def regionset: P_0x2cf3_54_regions_set_def)

definition P_0x2c0b_false_55 :: state_pred where
  \<open>P_0x2c0b_false_55 \<sigma> \<equiv> RIP \<sigma> = 0x2c0b \<and> RAX \<sigma> = ucast ((\<sigma> \<turnstile> *[((((RDI\<^sub>0::64 word) + (\<langle>63,0\<rangle>((RBX \<sigma>::64 word) * 0x4)::64 word))::64 word) - 0x4),4]::32 word)) \<and> RDI \<sigma> = 0x1 \<and> RSI \<sigma> = 0x31b1 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x48) \<and> R14 \<sigma> = RDI\<^sub>0 \<and> R13 \<sigma> = (\<sigma> \<turnstile> *[RBP \<sigma>,8]::64 word) \<and> (\<sigma> \<turnstile> *[RBP \<sigma>,8]::64 word) = (\<sigma> \<turnstile> *[RBP \<sigma>,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x3c),4]::32 word) = ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((((RDI\<^sub>0::64 word) + (\<langle>63,0\<rangle>((RBX \<sigma>::64 word) * 0x4)::64 word))::64 word) - 0x4),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),8]::64 word) = 0x2bfb \<and> (\<sigma> \<turnstile> *[((((RDI\<^sub>0::64 word) + (\<langle>63,0\<rangle>((RBX \<sigma>::64 word) * 0x4)::64 word))::64 word) - 0x4),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((((RDI\<^sub>0::64 word) + (\<langle>63,0\<rangle>((RBX \<sigma>::64 word) * 0x4)::64 word))::64 word) - 0x4),4]::32 word))\<close>
declare P_0x2c0b_false_55_def[Ps]

definition P_0x2c0b_false_55_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x2c0b_false_55_regions_set \<sigma> \<equiv> {
    (0, RBP \<sigma>, 8),
    (1, RSP\<^sub>0, 8),
    (2, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x3c), 4),
    (9, ((RSP\<^sub>0::64 word) - 0x40), 4),
    (10, ((RSP\<^sub>0::64 word) - 0x50), 8),
    (11, ((((RDI\<^sub>0::64 word) + (\<langle>63,0\<rangle>((RBX \<sigma>::64 word) * 0x4)::64 word))::64 word) - 0x4), 4)
  }\<close>

definition P_0x2c0b_false_55_regions :: state_pred where
  \<open>P_0x2c0b_false_55_regions \<sigma> \<equiv> \<exists>regions. P_0x2c0b_false_55_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x2c3d_55 :: state_pred where
  \<open>Q_0x2c3d_55 \<sigma> \<equiv> RIP \<sigma> = 0x2c3d \<and> RDI \<sigma> = 0x1 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x48) \<and> R14 \<sigma> = RDI\<^sub>0 \<and> R13 \<sigma> = (\<sigma> \<turnstile> *[RBP \<sigma>,8]::64 word) \<and> (\<sigma> \<turnstile> *[RBP \<sigma>,8]::64 word) = (\<sigma> \<turnstile> *[RBP \<sigma>,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x3c),4]::32 word) = ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((((RDI\<^sub>0::64 word) + (\<langle>63,0\<rangle>((RBX \<sigma>::64 word) * 0x4)::64 word))::64 word) - 0x4),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((((RDI\<^sub>0::64 word) + (\<langle>63,0\<rangle>((RBX \<sigma>::64 word) * 0x4)::64 word))::64 word) - 0x4),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((((RDI\<^sub>0::64 word) + (\<langle>63,0\<rangle>((RBX \<sigma>::64 word) * 0x4)::64 word))::64 word) - 0x4),4]::32 word))\<close>
declare Q_0x2c3d_55_def[Qs]

schematic_goal decode_featureset_0_3_0x2c0b_0x2c14_55[blocks]:
  assumes \<open>(P_0x2c0b_false_55 && P_0x2c0b_false_55_regions && ! ZF) \<sigma>\<close>
  shows \<open>exec_block 3 0x2c14 55 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x2c3d_55 ?\<sigma> \<and> block_usage P_0x2c0b_false_55_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x2c0b_false_55_def P_0x2c0b_false_55_regions_def post: Q_0x2c3d_55_def regionset: P_0x2c0b_false_55_regions_set_def)

definition P_0x2c3d_56 :: state_pred where
  \<open>P_0x2c3d_56 \<sigma> \<equiv> RIP \<sigma> = 0x2c3d \<and> RDI \<sigma> = 0x1 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x48) \<and> R14 \<sigma> = RDI\<^sub>0 \<and> R13 \<sigma> = (\<sigma> \<turnstile> *[RBP \<sigma>,8]::64 word) \<and> (\<sigma> \<turnstile> *[RBP \<sigma>,8]::64 word) = (\<sigma> \<turnstile> *[RBP \<sigma>,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x3c),4]::32 word) = ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((((RDI\<^sub>0::64 word) + (\<langle>63,0\<rangle>((RBX \<sigma>::64 word) * 0x4)::64 word))::64 word) - 0x4),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((((RDI\<^sub>0::64 word) + (\<langle>63,0\<rangle>((RBX \<sigma>::64 word) * 0x4)::64 word))::64 word) - 0x4),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((((RDI\<^sub>0::64 word) + (\<langle>63,0\<rangle>((RBX \<sigma>::64 word) * 0x4)::64 word))::64 word) - 0x4),4]::32 word))\<close>
declare P_0x2c3d_56_def[Ps]

definition P_0x2c3d_56_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x2c3d_56_regions_set \<sigma> \<equiv> {
    (0, RBP \<sigma>, 8),
    (1, RSP\<^sub>0, 8),
    (2, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x3c), 4),
    (9, ((RSP\<^sub>0::64 word) - 0x40), 4),
    (10, ((((RDI\<^sub>0::64 word) + (\<langle>63,0\<rangle>((RBX \<sigma>::64 word) * 0x4)::64 word))::64 word) - 0x4), 4)
  }\<close>

definition P_0x2c3d_56_regions :: state_pred where
  \<open>P_0x2c3d_56_regions \<sigma> \<equiv> \<exists>regions. P_0x2c3d_56_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x2c4b_56 :: state_pred where
  \<open>Q_0x2c4b_56 \<sigma> \<equiv> RIP \<sigma> = 0x2c4b \<and> RAX \<sigma> = ucast (((ucast ((0x1::32 word))::32 word) << unat (((\<langle>7,0\<rangle>R15 \<sigma>::8 word)::8 word)))) \<and> RCX \<sigma> = ucast ((\<langle>31,0\<rangle>R15 \<sigma>::32 word)) \<and> RDI \<sigma> = 0x1 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x48) \<and> R14 \<sigma> = RDI\<^sub>0 \<and> R13 \<sigma> = (\<sigma> \<turnstile> *[RBP \<sigma>,8]::64 word) \<and> (\<sigma> \<turnstile> *[RBP \<sigma>,8]::64 word) = (\<sigma> \<turnstile> *[RBP \<sigma>,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x3c),4]::32 word) = ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((((RDI\<^sub>0::64 word) + (\<langle>63,0\<rangle>((RBX \<sigma>::64 word) * 0x4)::64 word))::64 word) - 0x4),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((((RDI\<^sub>0::64 word) + (\<langle>63,0\<rangle>((RBX \<sigma>::64 word) * 0x4)::64 word))::64 word) - 0x4),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((((RDI\<^sub>0::64 word) + (\<langle>63,0\<rangle>((RBX \<sigma>::64 word) * 0x4)::64 word))::64 word) - 0x4),4]::32 word))\<close>
declare Q_0x2c4b_56_def[Qs]

schematic_goal decode_featureset_0_4_0x2c3d_0x2c47_56[blocks]:
  assumes \<open>(P_0x2c3d_56 && P_0x2c3d_56_regions) \<sigma>\<close>
  shows \<open>exec_block 4 0x2c47 56 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x2c4b_56 ?\<sigma> \<and> block_usage P_0x2c3d_56_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x2c3d_56_def P_0x2c3d_56_regions_def post: Q_0x2c4b_56_def regionset: P_0x2c3d_56_regions_set_def)

definition P_0x2c4b_true_57 :: state_pred where
  \<open>P_0x2c4b_true_57 \<sigma> \<equiv> RIP \<sigma> = 0x2c4b \<and> RAX \<sigma> = ucast (((ucast ((0x1::32 word))::32 word) << unat (((\<langle>7,0\<rangle>R15 \<sigma>::8 word)::8 word)))) \<and> RCX \<sigma> = ucast ((\<langle>31,0\<rangle>R15 \<sigma>::32 word)) \<and> RDI \<sigma> = 0x1 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x48) \<and> R14 \<sigma> = RDI\<^sub>0 \<and> R13 \<sigma> = (\<sigma> \<turnstile> *[RBP \<sigma>,8]::64 word) \<and> (\<sigma> \<turnstile> *[RBP \<sigma>,8]::64 word) = (\<sigma> \<turnstile> *[RBP \<sigma>,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x3c),4]::32 word) = ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((((RDI\<^sub>0::64 word) + (\<langle>63,0\<rangle>((RBX \<sigma>::64 word) * 0x4)::64 word))::64 word) - 0x4),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((((RDI\<^sub>0::64 word) + (\<langle>63,0\<rangle>((RBX \<sigma>::64 word) * 0x4)::64 word))::64 word) - 0x4),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((((RDI\<^sub>0::64 word) + (\<langle>63,0\<rangle>((RBX \<sigma>::64 word) * 0x4)::64 word))::64 word) - 0x4),4]::32 word))\<close>
declare P_0x2c4b_true_57_def[Ps]

definition P_0x2c4b_true_57_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x2c4b_true_57_regions_set \<sigma> \<equiv> {
    (0, RBP \<sigma>, 8),
    (1, RSP\<^sub>0, 8),
    (2, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x3c), 4),
    (9, ((RSP\<^sub>0::64 word) - 0x40), 4),
    (10, ((((RDI\<^sub>0::64 word) + (\<langle>63,0\<rangle>((RBX \<sigma>::64 word) * 0x4)::64 word))::64 word) - 0x4), 4)
  }\<close>

definition P_0x2c4b_true_57_regions :: state_pred where
  \<open>P_0x2c4b_true_57_regions \<sigma> \<equiv> \<exists>regions. P_0x2c4b_true_57_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x2c3b_57 :: state_pred where
  \<open>Q_0x2c3b_57 \<sigma> \<equiv> RIP \<sigma> = 0x2c3b \<and> RDI \<sigma> = 0x1 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x48) \<and> R14 \<sigma> = RDI\<^sub>0 \<and> R13 \<sigma> = (\<sigma> \<turnstile> *[RBP \<sigma>,8]::64 word) \<and> (\<sigma> \<turnstile> *[RBP \<sigma>,8]::64 word) = (\<sigma> \<turnstile> *[RBP \<sigma>,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x3c),4]::32 word) = ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((((RDI\<^sub>0::64 word) + (\<langle>63,0\<rangle>((RBX \<sigma>::64 word) * 0x4)::64 word))::64 word) - 0x4),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((((RDI\<^sub>0::64 word) + (\<langle>63,0\<rangle>((RBX \<sigma>::64 word) * 0x4)::64 word))::64 word) - 0x4),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((((RDI\<^sub>0::64 word) + (\<langle>63,0\<rangle>((RBX \<sigma>::64 word) * 0x4)::64 word))::64 word) - 0x4),4]::32 word))\<close>
declare Q_0x2c3b_57_def[Qs]

schematic_goal decode_featureset_0_3_0x2c4b_0x2c37_57[blocks]:
  assumes \<open>(P_0x2c4b_true_57 && P_0x2c4b_true_57_regions && ZF) \<sigma>\<close>
  shows \<open>exec_block 3 0x2c37 57 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x2c3b_57 ?\<sigma> \<and> block_usage P_0x2c4b_true_57_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x2c4b_true_57_def P_0x2c4b_true_57_regions_def post: Q_0x2c3b_57_def regionset: P_0x2c4b_true_57_regions_set_def)

definition P_0x2c3b_true_58 :: state_pred where
  \<open>P_0x2c3b_true_58 \<sigma> \<equiv> RIP \<sigma> = 0x2c3b \<and> RDI \<sigma> = 0x1 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x48) \<and> R14 \<sigma> = RDI\<^sub>0 \<and> R13 \<sigma> = (\<sigma> \<turnstile> *[RBP \<sigma>,8]::64 word) \<and> (\<sigma> \<turnstile> *[RBP \<sigma>,8]::64 word) = (\<sigma> \<turnstile> *[RBP \<sigma>,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x3c),4]::32 word) = ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((((RDI\<^sub>0::64 word) + (\<langle>63,0\<rangle>((RBX \<sigma>::64 word) * 0x4)::64 word))::64 word) - 0x4),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((((RDI\<^sub>0::64 word) + (\<langle>63,0\<rangle>((RBX \<sigma>::64 word) * 0x4)::64 word))::64 word) - 0x4),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((((RDI\<^sub>0::64 word) + (\<langle>63,0\<rangle>((RBX \<sigma>::64 word) * 0x4)::64 word))::64 word) - 0x4),4]::32 word))\<close>
declare P_0x2c3b_true_58_def[Ps]

definition P_0x2c3b_true_58_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x2c3b_true_58_regions_set \<sigma> \<equiv> {
    (0, RBP \<sigma>, 8),
    (1, RSP\<^sub>0, 8),
    (2, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x3c), 4),
    (9, ((RSP\<^sub>0::64 word) - 0x40), 4),
    (10, ((((RDI\<^sub>0::64 word) + (\<langle>63,0\<rangle>((RBX \<sigma>::64 word) * 0x4)::64 word))::64 word) - 0x4), 4)
  }\<close>

definition P_0x2c3b_true_58_regions :: state_pred where
  \<open>P_0x2c3b_true_58_regions \<sigma> \<equiv> \<exists>regions. P_0x2c3b_true_58_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x2c80_58 :: state_pred where
  \<open>Q_0x2c80_58 \<sigma> \<equiv> RIP \<sigma> = 0x2c80 \<and> RDI \<sigma> = 0x1 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x48) \<and> R14 \<sigma> = RDI\<^sub>0 \<and> R13 \<sigma> = (\<sigma> \<turnstile> *[RBP \<sigma>,8]::64 word) \<and> (\<sigma> \<turnstile> *[RBP \<sigma>,8]::64 word) = (\<sigma> \<turnstile> *[RBP \<sigma>,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x3c),4]::32 word) = ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((((RDI\<^sub>0::64 word) + (\<langle>63,0\<rangle>((RBX \<sigma>::64 word) * 0x4)::64 word))::64 word) - 0x4),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((((RDI\<^sub>0::64 word) + (\<langle>63,0\<rangle>((RBX \<sigma>::64 word) * 0x4)::64 word))::64 word) - 0x4),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((((RDI\<^sub>0::64 word) + (\<langle>63,0\<rangle>((RBX \<sigma>::64 word) * 0x4)::64 word))::64 word) - 0x4),4]::32 word))\<close>
declare Q_0x2c80_58_def[Qs]

schematic_goal decode_featureset_0_1_0x2c3b_0x2c3b_58[blocks]:
  assumes \<open>(P_0x2c3b_true_58 && P_0x2c3b_true_58_regions && ZF) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x2c3b 58 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x2c80_58 ?\<sigma> \<and> block_usage P_0x2c3b_true_58_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x2c3b_true_58_def P_0x2c3b_true_58_regions_def post: Q_0x2c80_58_def regionset: P_0x2c3b_true_58_regions_set_def)

definition P_0x2c3b_false_59 :: state_pred where
  \<open>P_0x2c3b_false_59 \<sigma> \<equiv> RIP \<sigma> = 0x2c3b \<and> RDI \<sigma> = 0x1 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x48) \<and> R14 \<sigma> = RDI\<^sub>0 \<and> R13 \<sigma> = (\<sigma> \<turnstile> *[RBP \<sigma>,8]::64 word) \<and> (\<sigma> \<turnstile> *[RBP \<sigma>,8]::64 word) = (\<sigma> \<turnstile> *[RBP \<sigma>,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x3c),4]::32 word) = ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((((RDI\<^sub>0::64 word) + (\<langle>63,0\<rangle>((RBX \<sigma>::64 word) * 0x4)::64 word))::64 word) - 0x4),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((((RDI\<^sub>0::64 word) + (\<langle>63,0\<rangle>((RBX \<sigma>::64 word) * 0x4)::64 word))::64 word) - 0x4),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((((RDI\<^sub>0::64 word) + (\<langle>63,0\<rangle>((RBX \<sigma>::64 word) * 0x4)::64 word))::64 word) - 0x4),4]::32 word))\<close>
declare P_0x2c3b_false_59_def[Ps]

definition P_0x2c3b_false_59_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x2c3b_false_59_regions_set \<sigma> \<equiv> {
    (0, RBP \<sigma>, 8),
    (1, RSP\<^sub>0, 8),
    (2, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x3c), 4),
    (9, ((RSP\<^sub>0::64 word) - 0x40), 4),
    (10, ((((RDI\<^sub>0::64 word) + (\<langle>63,0\<rangle>((RBX \<sigma>::64 word) * 0x4)::64 word))::64 word) - 0x4), 4)
  }\<close>

definition P_0x2c3b_false_59_regions :: state_pred where
  \<open>P_0x2c3b_false_59_regions \<sigma> \<equiv> \<exists>regions. P_0x2c3b_false_59_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x2c3d_59 :: state_pred where
  \<open>Q_0x2c3d_59 \<sigma> \<equiv> RIP \<sigma> = 0x2c3d \<and> RDI \<sigma> = 0x1 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x48) \<and> R14 \<sigma> = RDI\<^sub>0 \<and> R13 \<sigma> = (\<sigma> \<turnstile> *[RBP \<sigma>,8]::64 word) \<and> (\<sigma> \<turnstile> *[RBP \<sigma>,8]::64 word) = (\<sigma> \<turnstile> *[RBP \<sigma>,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x3c),4]::32 word) = ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((((RDI\<^sub>0::64 word) + (\<langle>63,0\<rangle>((RBX \<sigma>::64 word) * 0x4)::64 word))::64 word) - 0x4),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((((RDI\<^sub>0::64 word) + (\<langle>63,0\<rangle>((RBX \<sigma>::64 word) * 0x4)::64 word))::64 word) - 0x4),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((((RDI\<^sub>0::64 word) + (\<langle>63,0\<rangle>((RBX \<sigma>::64 word) * 0x4)::64 word))::64 word) - 0x4),4]::32 word))\<close>
declare Q_0x2c3d_59_def[Qs]

schematic_goal decode_featureset_0_1_0x2c3b_0x2c3b_59[blocks]:
  assumes \<open>(P_0x2c3b_false_59 && P_0x2c3b_false_59_regions && ! ZF) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x2c3b 59 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x2c3d_59 ?\<sigma> \<and> block_usage P_0x2c3b_false_59_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x2c3b_false_59_def P_0x2c3b_false_59_regions_def post: Q_0x2c3d_59_def regionset: P_0x2c3b_false_59_regions_set_def)

definition P_0x2c4b_false_60 :: state_pred where
  \<open>P_0x2c4b_false_60 \<sigma> \<equiv> RIP \<sigma> = 0x2c4b \<and> RAX \<sigma> = ucast (((ucast ((0x1::32 word))::32 word) << unat (((\<langle>7,0\<rangle>R15 \<sigma>::8 word)::8 word)))) \<and> RCX \<sigma> = ucast ((\<langle>31,0\<rangle>R15 \<sigma>::32 word)) \<and> RDI \<sigma> = 0x1 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x48) \<and> R14 \<sigma> = RDI\<^sub>0 \<and> R13 \<sigma> = (\<sigma> \<turnstile> *[RBP \<sigma>,8]::64 word) \<and> (\<sigma> \<turnstile> *[RBP \<sigma>,8]::64 word) = (\<sigma> \<turnstile> *[RBP \<sigma>,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x3c),4]::32 word) = ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((((RDI\<^sub>0::64 word) + (\<langle>63,0\<rangle>((RBX \<sigma>::64 word) * 0x4)::64 word))::64 word) - 0x4),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((((RDI\<^sub>0::64 word) + (\<langle>63,0\<rangle>((RBX \<sigma>::64 word) * 0x4)::64 word))::64 word) - 0x4),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((((RDI\<^sub>0::64 word) + (\<langle>63,0\<rangle>((RBX \<sigma>::64 word) * 0x4)::64 word))::64 word) - 0x4),4]::32 word))\<close>
declare P_0x2c4b_false_60_def[Ps]

definition P_0x2c4b_false_60_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x2c4b_false_60_regions_set \<sigma> \<equiv> {
    (0, RBP \<sigma>, 8),
    (1, RSP\<^sub>0, 8),
    (2, (((\<sigma> \<turnstile> *[RBP \<sigma>,8]::64 word)::64 word) + (\<langle>63,0\<rangle>((R15 \<sigma>::64 word) * 0x8)::64 word)), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x3c), 4),
    (10, ((RSP\<^sub>0::64 word) - 0x40), 4),
    (11, ((((RDI\<^sub>0::64 word) + (\<langle>63,0\<rangle>((RBX \<sigma>::64 word) * 0x4)::64 word))::64 word) - 0x4), 4)
  }\<close>

definition P_0x2c4b_false_60_regions :: state_pred where
  \<open>P_0x2c4b_false_60_regions \<sigma> \<equiv> \<exists>regions. P_0x2c4b_false_60_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x2c55_60 :: state_pred where
  \<open>Q_0x2c55_60 \<sigma> \<equiv> RIP \<sigma> = 0x2c55 \<and> RAX \<sigma> = ucast (((ucast ((0x1::32 word))::32 word) << unat (((\<langle>7,0\<rangle>R15 \<sigma>::8 word)::8 word)))) \<and> RCX \<sigma> = ucast ((\<langle>31,0\<rangle>R15 \<sigma>::32 word)) \<and> RDX \<sigma> = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[RBP \<sigma>,8]::64 word)::64 word) + (\<langle>63,0\<rangle>((R15 \<sigma>::64 word) * 0x8)::64 word)),8]::64 word) \<and> RDI \<sigma> = 0x1 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x48) \<and> R14 \<sigma> = RDI\<^sub>0 \<and> R13 \<sigma> = (\<sigma> \<turnstile> *[RBP \<sigma>,8]::64 word) \<and> (\<sigma> \<turnstile> *[RBP \<sigma>,8]::64 word) = (\<sigma> \<turnstile> *[RBP \<sigma>,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[RBP \<sigma>,8]::64 word)::64 word) + (\<langle>63,0\<rangle>((R15 \<sigma>::64 word) * 0x8)::64 word)),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[RBP \<sigma>,8]::64 word)::64 word) + (\<langle>63,0\<rangle>((R15 \<sigma>::64 word) * 0x8)::64 word)),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x3c),4]::32 word) = ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((((RDI\<^sub>0::64 word) + (\<langle>63,0\<rangle>((RBX \<sigma>::64 word) * 0x4)::64 word))::64 word) - 0x4),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((((RDI\<^sub>0::64 word) + (\<langle>63,0\<rangle>((RBX \<sigma>::64 word) * 0x4)::64 word))::64 word) - 0x4),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((((RDI\<^sub>0::64 word) + (\<langle>63,0\<rangle>((RBX \<sigma>::64 word) * 0x4)::64 word))::64 word) - 0x4),4]::32 word))\<close>
declare Q_0x2c55_60_def[Qs]

schematic_goal decode_featureset_0_3_0x2c4b_0x2c52_60[blocks]:
  assumes \<open>(P_0x2c4b_false_60 && P_0x2c4b_false_60_regions && ! ZF) \<sigma>\<close>
  shows \<open>exec_block 3 0x2c52 60 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x2c55_60 ?\<sigma> \<and> block_usage P_0x2c4b_false_60_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x2c4b_false_60_def P_0x2c4b_false_60_regions_def post: Q_0x2c55_60_def regionset: P_0x2c4b_false_60_regions_set_def)

definition P_0x2c55_true_61 :: state_pred where
  \<open>P_0x2c55_true_61 \<sigma> \<equiv> RIP \<sigma> = 0x2c55 \<and> RAX \<sigma> = ucast (((ucast ((0x1::32 word))::32 word) << unat (((\<langle>7,0\<rangle>R15 \<sigma>::8 word)::8 word)))) \<and> RCX \<sigma> = ucast ((\<langle>31,0\<rangle>R15 \<sigma>::32 word)) \<and> RDX \<sigma> = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[RBP \<sigma>,8]::64 word)::64 word) + (\<langle>63,0\<rangle>((R15 \<sigma>::64 word) * 0x8)::64 word)),8]::64 word) \<and> RDI \<sigma> = 0x1 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x48) \<and> R14 \<sigma> = RDI\<^sub>0 \<and> R13 \<sigma> = (\<sigma> \<turnstile> *[RBP \<sigma>,8]::64 word) \<and> (\<sigma> \<turnstile> *[RBP \<sigma>,8]::64 word) = (\<sigma> \<turnstile> *[RBP \<sigma>,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[RBP \<sigma>,8]::64 word)::64 word) + (\<langle>63,0\<rangle>((R15 \<sigma>::64 word) * 0x8)::64 word)),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[RBP \<sigma>,8]::64 word)::64 word) + (\<langle>63,0\<rangle>((R15 \<sigma>::64 word) * 0x8)::64 word)),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x3c),4]::32 word) = ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((((RDI\<^sub>0::64 word) + (\<langle>63,0\<rangle>((RBX \<sigma>::64 word) * 0x4)::64 word))::64 word) - 0x4),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((((RDI\<^sub>0::64 word) + (\<langle>63,0\<rangle>((RBX \<sigma>::64 word) * 0x4)::64 word))::64 word) - 0x4),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((((RDI\<^sub>0::64 word) + (\<langle>63,0\<rangle>((RBX \<sigma>::64 word) * 0x4)::64 word))::64 word) - 0x4),4]::32 word))\<close>
declare P_0x2c55_true_61_def[Ps]

definition P_0x2c55_true_61_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x2c55_true_61_regions_set \<sigma> \<equiv> {
    (0, RBP \<sigma>, 8),
    (1, RSP\<^sub>0, 8),
    (2, (((\<sigma> \<turnstile> *[RBP \<sigma>,8]::64 word)::64 word) + (\<langle>63,0\<rangle>((R15 \<sigma>::64 word) * 0x8)::64 word)), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x3c), 4),
    (10, ((RSP\<^sub>0::64 word) - 0x40), 4),
    (11, ((((RDI\<^sub>0::64 word) + (\<langle>63,0\<rangle>((RBX \<sigma>::64 word) * 0x4)::64 word))::64 word) - 0x4), 4)
  }\<close>

definition P_0x2c55_true_61_regions :: state_pred where
  \<open>P_0x2c55_true_61_regions \<sigma> \<equiv> \<exists>regions. P_0x2c55_true_61_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x2c2e_61 :: state_pred where
  \<open>Q_0x2c2e_61 \<sigma> \<equiv> RIP \<sigma> = 0x2c2e \<and> RAX \<sigma> = 0x0 \<and> RCX \<sigma> = ucast ((\<langle>31,0\<rangle>R15 \<sigma>::32 word)) \<and> RDX \<sigma> = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[RBP \<sigma>,8]::64 word)::64 word) + (\<langle>63,0\<rangle>((R15 \<sigma>::64 word) * 0x8)::64 word)),8]::64 word) \<and> RDI \<sigma> = 0x1 \<and> RSI \<sigma> = 0x31a7 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x48) \<and> R14 \<sigma> = RDI\<^sub>0 \<and> R13 \<sigma> = (\<sigma> \<turnstile> *[RBP \<sigma>,8]::64 word) \<and> (\<sigma> \<turnstile> *[RBP \<sigma>,8]::64 word) = (\<sigma> \<turnstile> *[RBP \<sigma>,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[RBP \<sigma>,8]::64 word)::64 word) + (\<langle>63,0\<rangle>((R15 \<sigma>::64 word) * 0x8)::64 word)),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[RBP \<sigma>,8]::64 word)::64 word) + (\<langle>63,0\<rangle>((R15 \<sigma>::64 word) * 0x8)::64 word)),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x3c),4]::32 word) = ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((((RDI\<^sub>0::64 word) + (\<langle>63,0\<rangle>((RBX \<sigma>::64 word) * 0x4)::64 word))::64 word) - 0x4),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((((RDI\<^sub>0::64 word) + (\<langle>63,0\<rangle>((RBX \<sigma>::64 word) * 0x4)::64 word))::64 word) - 0x4),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((((RDI\<^sub>0::64 word) + (\<langle>63,0\<rangle>((RBX \<sigma>::64 word) * 0x4)::64 word))::64 word) - 0x4),4]::32 word))\<close>
declare Q_0x2c2e_61_def[Qs]

schematic_goal decode_featureset_0_4_0x2c55_0x2c2c_61[blocks]:
  assumes \<open>(P_0x2c55_true_61 && P_0x2c55_true_61_regions && !ZF) \<sigma>\<close>
  shows \<open>exec_block 4 0x2c2c 61 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x2c2e_61 ?\<sigma> \<and> block_usage P_0x2c55_true_61_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x2c55_true_61_def P_0x2c55_true_61_regions_def post: Q_0x2c2e_61_def regionset: P_0x2c55_true_61_regions_set_def)

definition P_0x2c2e_62 :: state_pred where
  \<open>P_0x2c2e_62 \<sigma> \<equiv> RIP \<sigma> = 0x2c2e \<and> RAX \<sigma> = 0x0 \<and> RCX \<sigma> = ucast ((\<langle>31,0\<rangle>R15 \<sigma>::32 word)) \<and> RDX \<sigma> = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[RBP \<sigma>,8]::64 word)::64 word) + (\<langle>63,0\<rangle>((R15 \<sigma>::64 word) * 0x8)::64 word)),8]::64 word) \<and> RDI \<sigma> = 0x1 \<and> RSI \<sigma> = 0x31a7 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x48) \<and> R14 \<sigma> = RDI\<^sub>0 \<and> R13 \<sigma> = (\<sigma> \<turnstile> *[RBP \<sigma>,8]::64 word) \<and> (\<sigma> \<turnstile> *[RBP \<sigma>,8]::64 word) = (\<sigma> \<turnstile> *[RBP \<sigma>,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[RBP \<sigma>,8]::64 word)::64 word) + (\<langle>63,0\<rangle>((R15 \<sigma>::64 word) * 0x8)::64 word)),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[RBP \<sigma>,8]::64 word)::64 word) + (\<langle>63,0\<rangle>((R15 \<sigma>::64 word) * 0x8)::64 word)),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x3c),4]::32 word) = ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((((RDI\<^sub>0::64 word) + (\<langle>63,0\<rangle>((RBX \<sigma>::64 word) * 0x4)::64 word))::64 word) - 0x4),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((((RDI\<^sub>0::64 word) + (\<langle>63,0\<rangle>((RBX \<sigma>::64 word) * 0x4)::64 word))::64 word) - 0x4),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((((RDI\<^sub>0::64 word) + (\<langle>63,0\<rangle>((RBX \<sigma>::64 word) * 0x4)::64 word))::64 word) - 0x4),4]::32 word))\<close>
declare P_0x2c2e_62_def[Ps]

definition P_0x2c2e_62_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x2c2e_62_regions_set \<sigma> \<equiv> {
    (0, RBP \<sigma>, 8),
    (1, RSP\<^sub>0, 8),
    (2, (((\<sigma> \<turnstile> *[RBP \<sigma>,8]::64 word)::64 word) + (\<langle>63,0\<rangle>((R15 \<sigma>::64 word) * 0x8)::64 word)), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x3c), 4),
    (10, ((RSP\<^sub>0::64 word) - 0x40), 4),
    (11, ((RSP\<^sub>0::64 word) - 0x50), 8),
    (12, ((((RDI\<^sub>0::64 word) + (\<langle>63,0\<rangle>((RBX \<sigma>::64 word) * 0x4)::64 word))::64 word) - 0x4), 4)
  }\<close>

definition P_0x2c2e_62_regions :: state_pred where
  \<open>P_0x2c2e_62_regions \<sigma> \<equiv> \<exists>regions. P_0x2c2e_62_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_printf_chk_addr_0x2c2e_62 :: state_pred where
  \<open>Q_printf_chk_addr_0x2c2e_62 \<sigma> \<equiv> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x50) \<and> RIP \<sigma> = printf_chk_addr \<and> RAX \<sigma> = 0x0 \<and> RCX \<sigma> = ucast ((\<langle>31,0\<rangle>R15 \<sigma>::32 word)) \<and> RDX \<sigma> = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[RBP \<sigma>,8]::64 word)::64 word) + (\<langle>63,0\<rangle>((R15 \<sigma>::64 word) * 0x8)::64 word)),8]::64 word) \<and> RDI \<sigma> = 0x1 \<and> RSI \<sigma> = 0x31a7 \<and> R14 \<sigma> = RDI\<^sub>0 \<and> R13 \<sigma> = (\<sigma> \<turnstile> *[RBP \<sigma>,8]::64 word) \<and> (\<sigma> \<turnstile> *[RBP \<sigma>,8]::64 word) = (\<sigma> \<turnstile> *[RBP \<sigma>,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[RBP \<sigma>,8]::64 word)::64 word) + (\<langle>63,0\<rangle>((R15 \<sigma>::64 word) * 0x8)::64 word)),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[RBP \<sigma>,8]::64 word)::64 word) + (\<langle>63,0\<rangle>((R15 \<sigma>::64 word) * 0x8)::64 word)),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x3c),4]::32 word) = ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((((RDI\<^sub>0::64 word) + (\<langle>63,0\<rangle>((RBX \<sigma>::64 word) * 0x4)::64 word))::64 word) - 0x4),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),8]::64 word) = 0x2c33 \<and> (\<sigma> \<turnstile> *[((((RDI\<^sub>0::64 word) + (\<langle>63,0\<rangle>((RBX \<sigma>::64 word) * 0x4)::64 word))::64 word) - 0x4),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((((RDI\<^sub>0::64 word) + (\<langle>63,0\<rangle>((RBX \<sigma>::64 word) * 0x4)::64 word))::64 word) - 0x4),4]::32 word))\<close>
declare Q_printf_chk_addr_0x2c2e_62_def[Qs]

schematic_goal decode_featureset_0_1_0x2c2e_0x2c2e_62[blocks]:
  assumes \<open>(P_0x2c2e_62 && P_0x2c2e_62_regions) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x2c2e 62 \<sigma> \<triangleq> ?\<sigma> \<and> Q_printf_chk_addr_0x2c2e_62 ?\<sigma> \<and> block_usage P_0x2c2e_62_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x2c2e_62_def P_0x2c2e_62_regions_def post: Q_printf_chk_addr_0x2c2e_62_def regionset: P_0x2c2e_62_regions_set_def)

definition P_0x2c33_63 :: state_pred where
  \<open>P_0x2c33_63 \<sigma> \<equiv> RIP \<sigma> = 0x2c33 \<and> RAX \<sigma> = printf_chk_0x2c2e_retval \<and> RCX \<sigma> = ucast ((\<langle>31,0\<rangle>R15 \<sigma>::32 word)) \<and> RDX \<sigma> = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[RBP \<sigma>,8]::64 word)::64 word) + (\<langle>63,0\<rangle>((R15 \<sigma>::64 word) * 0x8)::64 word)),8]::64 word) \<and> RDI \<sigma> = 0x1 \<and> RSI \<sigma> = 0x31a7 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x48) \<and> R14 \<sigma> = RDI\<^sub>0 \<and> R13 \<sigma> = (\<sigma> \<turnstile> *[RBP \<sigma>,8]::64 word) \<and> (\<sigma> \<turnstile> *[RBP \<sigma>,8]::64 word) = (\<sigma> \<turnstile> *[RBP \<sigma>,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[RBP \<sigma>,8]::64 word)::64 word) + (\<langle>63,0\<rangle>((R15 \<sigma>::64 word) * 0x8)::64 word)),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[RBP \<sigma>,8]::64 word)::64 word) + (\<langle>63,0\<rangle>((R15 \<sigma>::64 word) * 0x8)::64 word)),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x3c),4]::32 word) = ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((((RDI\<^sub>0::64 word) + (\<langle>63,0\<rangle>((RBX \<sigma>::64 word) * 0x4)::64 word))::64 word) - 0x4),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),8]::64 word) = 0x2c33 \<and> (\<sigma> \<turnstile> *[((((RDI\<^sub>0::64 word) + (\<langle>63,0\<rangle>((RBX \<sigma>::64 word) * 0x4)::64 word))::64 word) - 0x4),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((((RDI\<^sub>0::64 word) + (\<langle>63,0\<rangle>((RBX \<sigma>::64 word) * 0x4)::64 word))::64 word) - 0x4),4]::32 word))\<close>
declare P_0x2c33_63_def[Ps]

definition P_0x2c33_63_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x2c33_63_regions_set \<sigma> \<equiv> {
    (0, RBP \<sigma>, 8),
    (1, RSP\<^sub>0, 8),
    (2, (((\<sigma> \<turnstile> *[RBP \<sigma>,8]::64 word)::64 word) + (\<langle>63,0\<rangle>((R15 \<sigma>::64 word) * 0x8)::64 word)), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x3c), 4),
    (10, ((RSP\<^sub>0::64 word) - 0x40), 4),
    (11, ((RSP\<^sub>0::64 word) - 0x50), 8),
    (12, ((((RDI\<^sub>0::64 word) + (\<langle>63,0\<rangle>((RBX \<sigma>::64 word) * 0x4)::64 word))::64 word) - 0x4), 4)
  }\<close>

definition P_0x2c33_63_regions :: state_pred where
  \<open>P_0x2c33_63_regions \<sigma> \<equiv> \<exists>regions. P_0x2c33_63_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x2c3b_63 :: state_pred where
  \<open>Q_0x2c3b_63 \<sigma> \<equiv> RIP \<sigma> = 0x2c3b \<and> RDI \<sigma> = 0x1 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x48) \<and> R14 \<sigma> = RDI\<^sub>0 \<and> R13 \<sigma> = (\<sigma> \<turnstile> *[RBP \<sigma>,8]::64 word) \<and> (\<sigma> \<turnstile> *[RBP \<sigma>,8]::64 word) = (\<sigma> \<turnstile> *[RBP \<sigma>,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x3c),4]::32 word) = ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((((RDI\<^sub>0::64 word) + (\<langle>63,0\<rangle>((RBX \<sigma>::64 word) * 0x4)::64 word))::64 word) - 0x4),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((((RDI\<^sub>0::64 word) + (\<langle>63,0\<rangle>((RBX \<sigma>::64 word) * 0x4)::64 word))::64 word) - 0x4),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((((RDI\<^sub>0::64 word) + (\<langle>63,0\<rangle>((RBX \<sigma>::64 word) * 0x4)::64 word))::64 word) - 0x4),4]::32 word))\<close>
declare Q_0x2c3b_63_def[Qs]

schematic_goal decode_featureset_0_2_0x2c33_0x2c37_63[blocks]:
  assumes \<open>(P_0x2c33_63 && P_0x2c33_63_regions) \<sigma>\<close>
  shows \<open>exec_block 2 0x2c37 63 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x2c3b_63 ?\<sigma> \<and> block_usage P_0x2c33_63_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x2c33_63_def P_0x2c33_63_regions_def post: Q_0x2c3b_63_def regionset: P_0x2c33_63_regions_set_def)

definition P_0x2c3b_true_64 :: state_pred where
  \<open>P_0x2c3b_true_64 \<sigma> \<equiv> RIP \<sigma> = 0x2c3b \<and> RDI \<sigma> = 0x1 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x48) \<and> R14 \<sigma> = RDI\<^sub>0 \<and> R13 \<sigma> = (\<sigma> \<turnstile> *[RBP \<sigma>,8]::64 word) \<and> (\<sigma> \<turnstile> *[RBP \<sigma>,8]::64 word) = (\<sigma> \<turnstile> *[RBP \<sigma>,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x3c),4]::32 word) = ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((((RDI\<^sub>0::64 word) + (\<langle>63,0\<rangle>((RBX \<sigma>::64 word) * 0x4)::64 word))::64 word) - 0x4),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((((RDI\<^sub>0::64 word) + (\<langle>63,0\<rangle>((RBX \<sigma>::64 word) * 0x4)::64 word))::64 word) - 0x4),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((((RDI\<^sub>0::64 word) + (\<langle>63,0\<rangle>((RBX \<sigma>::64 word) * 0x4)::64 word))::64 word) - 0x4),4]::32 word))\<close>
declare P_0x2c3b_true_64_def[Ps]

definition P_0x2c3b_true_64_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x2c3b_true_64_regions_set \<sigma> \<equiv> {
    (0, RBP \<sigma>, 8),
    (1, RSP\<^sub>0, 8),
    (2, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x3c), 4),
    (9, ((RSP\<^sub>0::64 word) - 0x40), 4),
    (10, ((((RDI\<^sub>0::64 word) + (\<langle>63,0\<rangle>((RBX \<sigma>::64 word) * 0x4)::64 word))::64 word) - 0x4), 4)
  }\<close>

definition P_0x2c3b_true_64_regions :: state_pred where
  \<open>P_0x2c3b_true_64_regions \<sigma> \<equiv> \<exists>regions. P_0x2c3b_true_64_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x2c80_64 :: state_pred where
  \<open>Q_0x2c80_64 \<sigma> \<equiv> RIP \<sigma> = 0x2c80 \<and> RDI \<sigma> = 0x1 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x48) \<and> R14 \<sigma> = RDI\<^sub>0 \<and> R13 \<sigma> = (\<sigma> \<turnstile> *[RBP \<sigma>,8]::64 word) \<and> (\<sigma> \<turnstile> *[RBP \<sigma>,8]::64 word) = (\<sigma> \<turnstile> *[RBP \<sigma>,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x3c),4]::32 word) = ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((((RDI\<^sub>0::64 word) + (\<langle>63,0\<rangle>((RBX \<sigma>::64 word) * 0x4)::64 word))::64 word) - 0x4),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((((RDI\<^sub>0::64 word) + (\<langle>63,0\<rangle>((RBX \<sigma>::64 word) * 0x4)::64 word))::64 word) - 0x4),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((((RDI\<^sub>0::64 word) + (\<langle>63,0\<rangle>((RBX \<sigma>::64 word) * 0x4)::64 word))::64 word) - 0x4),4]::32 word))\<close>
declare Q_0x2c80_64_def[Qs]

schematic_goal decode_featureset_0_1_0x2c3b_0x2c3b_64[blocks]:
  assumes \<open>(P_0x2c3b_true_64 && P_0x2c3b_true_64_regions && ZF) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x2c3b 64 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x2c80_64 ?\<sigma> \<and> block_usage P_0x2c3b_true_64_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x2c3b_true_64_def P_0x2c3b_true_64_regions_def post: Q_0x2c80_64_def regionset: P_0x2c3b_true_64_regions_set_def)

definition P_0x2c3b_false_65 :: state_pred where
  \<open>P_0x2c3b_false_65 \<sigma> \<equiv> RIP \<sigma> = 0x2c3b \<and> RDI \<sigma> = 0x1 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x48) \<and> R14 \<sigma> = RDI\<^sub>0 \<and> R13 \<sigma> = (\<sigma> \<turnstile> *[RBP \<sigma>,8]::64 word) \<and> (\<sigma> \<turnstile> *[RBP \<sigma>,8]::64 word) = (\<sigma> \<turnstile> *[RBP \<sigma>,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x3c),4]::32 word) = ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((((RDI\<^sub>0::64 word) + (\<langle>63,0\<rangle>((RBX \<sigma>::64 word) * 0x4)::64 word))::64 word) - 0x4),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((((RDI\<^sub>0::64 word) + (\<langle>63,0\<rangle>((RBX \<sigma>::64 word) * 0x4)::64 word))::64 word) - 0x4),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((((RDI\<^sub>0::64 word) + (\<langle>63,0\<rangle>((RBX \<sigma>::64 word) * 0x4)::64 word))::64 word) - 0x4),4]::32 word))\<close>
declare P_0x2c3b_false_65_def[Ps]

definition P_0x2c3b_false_65_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x2c3b_false_65_regions_set \<sigma> \<equiv> {
    (0, RBP \<sigma>, 8),
    (1, RSP\<^sub>0, 8),
    (2, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x3c), 4),
    (9, ((RSP\<^sub>0::64 word) - 0x40), 4),
    (10, ((((RDI\<^sub>0::64 word) + (\<langle>63,0\<rangle>((RBX \<sigma>::64 word) * 0x4)::64 word))::64 word) - 0x4), 4)
  }\<close>

definition P_0x2c3b_false_65_regions :: state_pred where
  \<open>P_0x2c3b_false_65_regions \<sigma> \<equiv> \<exists>regions. P_0x2c3b_false_65_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x2c3d_65 :: state_pred where
  \<open>Q_0x2c3d_65 \<sigma> \<equiv> RIP \<sigma> = 0x2c3d \<and> RDI \<sigma> = 0x1 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x48) \<and> R14 \<sigma> = RDI\<^sub>0 \<and> R13 \<sigma> = (\<sigma> \<turnstile> *[RBP \<sigma>,8]::64 word) \<and> (\<sigma> \<turnstile> *[RBP \<sigma>,8]::64 word) = (\<sigma> \<turnstile> *[RBP \<sigma>,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x3c),4]::32 word) = ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((((RDI\<^sub>0::64 word) + (\<langle>63,0\<rangle>((RBX \<sigma>::64 word) * 0x4)::64 word))::64 word) - 0x4),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((((RDI\<^sub>0::64 word) + (\<langle>63,0\<rangle>((RBX \<sigma>::64 word) * 0x4)::64 word))::64 word) - 0x4),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((((RDI\<^sub>0::64 word) + (\<langle>63,0\<rangle>((RBX \<sigma>::64 word) * 0x4)::64 word))::64 word) - 0x4),4]::32 word))\<close>
declare Q_0x2c3d_65_def[Qs]

schematic_goal decode_featureset_0_1_0x2c3b_0x2c3b_65[blocks]:
  assumes \<open>(P_0x2c3b_false_65 && P_0x2c3b_false_65_regions && ! ZF) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x2c3b 65 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x2c3d_65 ?\<sigma> \<and> block_usage P_0x2c3b_false_65_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x2c3b_false_65_def P_0x2c3b_false_65_regions_def post: Q_0x2c3d_65_def regionset: P_0x2c3b_false_65_regions_set_def)

definition P_0x2c55_false_66 :: state_pred where
  \<open>P_0x2c55_false_66 \<sigma> \<equiv> RIP \<sigma> = 0x2c55 \<and> RAX \<sigma> = ucast (((ucast ((0x1::32 word))::32 word) << unat (((\<langle>7,0\<rangle>R15 \<sigma>::8 word)::8 word)))) \<and> RCX \<sigma> = ucast ((\<langle>31,0\<rangle>R15 \<sigma>::32 word)) \<and> RDX \<sigma> = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[RBP \<sigma>,8]::64 word)::64 word) + (\<langle>63,0\<rangle>((R15 \<sigma>::64 word) * 0x8)::64 word)),8]::64 word) \<and> RDI \<sigma> = 0x1 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x48) \<and> R14 \<sigma> = RDI\<^sub>0 \<and> R13 \<sigma> = (\<sigma> \<turnstile> *[RBP \<sigma>,8]::64 word) \<and> (\<sigma> \<turnstile> *[RBP \<sigma>,8]::64 word) = (\<sigma> \<turnstile> *[RBP \<sigma>,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[RBP \<sigma>,8]::64 word)::64 word) + (\<langle>63,0\<rangle>((R15 \<sigma>::64 word) * 0x8)::64 word)),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[RBP \<sigma>,8]::64 word)::64 word) + (\<langle>63,0\<rangle>((R15 \<sigma>::64 word) * 0x8)::64 word)),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x3c),4]::32 word) = ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((((RDI\<^sub>0::64 word) + (\<langle>63,0\<rangle>((RBX \<sigma>::64 word) * 0x4)::64 word))::64 word) - 0x4),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((((RDI\<^sub>0::64 word) + (\<langle>63,0\<rangle>((RBX \<sigma>::64 word) * 0x4)::64 word))::64 word) - 0x4),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((((RDI\<^sub>0::64 word) + (\<langle>63,0\<rangle>((RBX \<sigma>::64 word) * 0x4)::64 word))::64 word) - 0x4),4]::32 word))\<close>
declare P_0x2c55_false_66_def[Ps]

definition P_0x2c55_false_66_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x2c55_false_66_regions_set \<sigma> \<equiv> {
    (0, RBP \<sigma>, 8),
    (1, RSP\<^sub>0, 8),
    (2, (((\<sigma> \<turnstile> *[RBP \<sigma>,8]::64 word)::64 word) + (\<langle>63,0\<rangle>((R15 \<sigma>::64 word) * 0x8)::64 word)), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x3c), 4),
    (10, ((RSP\<^sub>0::64 word) - 0x40), 4),
    (11, ((((RDI\<^sub>0::64 word) + (\<langle>63,0\<rangle>((RBX \<sigma>::64 word) * 0x4)::64 word))::64 word) - 0x4), 4)
  }\<close>

definition P_0x2c55_false_66_regions :: state_pred where
  \<open>P_0x2c55_false_66_regions \<sigma> \<equiv> \<exists>regions. P_0x2c55_false_66_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x2c68_66 :: state_pred where
  \<open>Q_0x2c68_66 \<sigma> \<equiv> RIP \<sigma> = 0x2c68 \<and> RAX \<sigma> = 0x0 \<and> RCX \<sigma> = ucast ((\<langle>31,0\<rangle>R15 \<sigma>::32 word)) \<and> RDX \<sigma> = ucast ((\<langle>31,0\<rangle>R15 \<sigma>::32 word)) \<and> RDI \<sigma> = 0x1 \<and> RSI \<sigma> = 0x31ab \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x48) \<and> R14 \<sigma> = RDI\<^sub>0 \<and> R13 \<sigma> = (\<sigma> \<turnstile> *[RBP \<sigma>,8]::64 word) \<and> (\<sigma> \<turnstile> *[RBP \<sigma>,8]::64 word) = (\<sigma> \<turnstile> *[RBP \<sigma>,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[RBP \<sigma>,8]::64 word)::64 word) + (\<langle>63,0\<rangle>((R15 \<sigma>::64 word) * 0x8)::64 word)),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[RBP \<sigma>,8]::64 word)::64 word) + (\<langle>63,0\<rangle>((R15 \<sigma>::64 word) * 0x8)::64 word)),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x3c),4]::32 word) = ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((((RDI\<^sub>0::64 word) + (\<langle>63,0\<rangle>((RBX \<sigma>::64 word) * 0x4)::64 word))::64 word) - 0x4),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((((RDI\<^sub>0::64 word) + (\<langle>63,0\<rangle>((RBX \<sigma>::64 word) * 0x4)::64 word))::64 word) - 0x4),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((((RDI\<^sub>0::64 word) + (\<langle>63,0\<rangle>((RBX \<sigma>::64 word) * 0x4)::64 word))::64 word) - 0x4),4]::32 word))\<close>
declare Q_0x2c68_66_def[Qs]

schematic_goal decode_featureset_0_5_0x2c55_0x2c66_66[blocks]:
  assumes \<open>(P_0x2c55_false_66 && P_0x2c55_false_66_regions && ! !ZF) \<sigma>\<close>
  shows \<open>exec_block 5 0x2c66 66 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x2c68_66 ?\<sigma> \<and> block_usage P_0x2c55_false_66_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x2c55_false_66_def P_0x2c55_false_66_regions_def post: Q_0x2c68_66_def regionset: P_0x2c55_false_66_regions_set_def)

definition P_0x2c68_67 :: state_pred where
  \<open>P_0x2c68_67 \<sigma> \<equiv> RIP \<sigma> = 0x2c68 \<and> RAX \<sigma> = 0x0 \<and> RCX \<sigma> = ucast ((\<langle>31,0\<rangle>R15 \<sigma>::32 word)) \<and> RDX \<sigma> = ucast ((\<langle>31,0\<rangle>R15 \<sigma>::32 word)) \<and> RDI \<sigma> = 0x1 \<and> RSI \<sigma> = 0x31ab \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x48) \<and> R14 \<sigma> = RDI\<^sub>0 \<and> R13 \<sigma> = (\<sigma> \<turnstile> *[RBP \<sigma>,8]::64 word) \<and> (\<sigma> \<turnstile> *[RBP \<sigma>,8]::64 word) = (\<sigma> \<turnstile> *[RBP \<sigma>,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[RBP \<sigma>,8]::64 word)::64 word) + (\<langle>63,0\<rangle>((R15 \<sigma>::64 word) * 0x8)::64 word)),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[RBP \<sigma>,8]::64 word)::64 word) + (\<langle>63,0\<rangle>((R15 \<sigma>::64 word) * 0x8)::64 word)),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x3c),4]::32 word) = ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((((RDI\<^sub>0::64 word) + (\<langle>63,0\<rangle>((RBX \<sigma>::64 word) * 0x4)::64 word))::64 word) - 0x4),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((((RDI\<^sub>0::64 word) + (\<langle>63,0\<rangle>((RBX \<sigma>::64 word) * 0x4)::64 word))::64 word) - 0x4),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((((RDI\<^sub>0::64 word) + (\<langle>63,0\<rangle>((RBX \<sigma>::64 word) * 0x4)::64 word))::64 word) - 0x4),4]::32 word))\<close>
declare P_0x2c68_67_def[Ps]

definition P_0x2c68_67_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x2c68_67_regions_set \<sigma> \<equiv> {
    (0, RBP \<sigma>, 8),
    (1, RSP\<^sub>0, 8),
    (2, (((\<sigma> \<turnstile> *[RBP \<sigma>,8]::64 word)::64 word) + (\<langle>63,0\<rangle>((R15 \<sigma>::64 word) * 0x8)::64 word)), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x3c), 4),
    (10, ((RSP\<^sub>0::64 word) - 0x40), 4),
    (11, ((RSP\<^sub>0::64 word) - 0x50), 8),
    (12, ((((RDI\<^sub>0::64 word) + (\<langle>63,0\<rangle>((RBX \<sigma>::64 word) * 0x4)::64 word))::64 word) - 0x4), 4)
  }\<close>

definition P_0x2c68_67_regions :: state_pred where
  \<open>P_0x2c68_67_regions \<sigma> \<equiv> \<exists>regions. P_0x2c68_67_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_printf_chk_addr_0x2c68_67 :: state_pred where
  \<open>Q_printf_chk_addr_0x2c68_67 \<sigma> \<equiv> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x50) \<and> RIP \<sigma> = printf_chk_addr \<and> RAX \<sigma> = 0x0 \<and> RCX \<sigma> = ucast ((\<langle>31,0\<rangle>R15 \<sigma>::32 word)) \<and> RDX \<sigma> = ucast ((\<langle>31,0\<rangle>R15 \<sigma>::32 word)) \<and> RDI \<sigma> = 0x1 \<and> RSI \<sigma> = 0x31ab \<and> R14 \<sigma> = RDI\<^sub>0 \<and> R13 \<sigma> = (\<sigma> \<turnstile> *[RBP \<sigma>,8]::64 word) \<and> (\<sigma> \<turnstile> *[RBP \<sigma>,8]::64 word) = (\<sigma> \<turnstile> *[RBP \<sigma>,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[RBP \<sigma>,8]::64 word)::64 word) + (\<langle>63,0\<rangle>((R15 \<sigma>::64 word) * 0x8)::64 word)),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[RBP \<sigma>,8]::64 word)::64 word) + (\<langle>63,0\<rangle>((R15 \<sigma>::64 word) * 0x8)::64 word)),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x3c),4]::32 word) = ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((((RDI\<^sub>0::64 word) + (\<langle>63,0\<rangle>((RBX \<sigma>::64 word) * 0x4)::64 word))::64 word) - 0x4),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),8]::64 word) = 0x2c6d \<and> (\<sigma> \<turnstile> *[((((RDI\<^sub>0::64 word) + (\<langle>63,0\<rangle>((RBX \<sigma>::64 word) * 0x4)::64 word))::64 word) - 0x4),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((((RDI\<^sub>0::64 word) + (\<langle>63,0\<rangle>((RBX \<sigma>::64 word) * 0x4)::64 word))::64 word) - 0x4),4]::32 word))\<close>
declare Q_printf_chk_addr_0x2c68_67_def[Qs]

schematic_goal decode_featureset_0_1_0x2c68_0x2c68_67[blocks]:
  assumes \<open>(P_0x2c68_67 && P_0x2c68_67_regions) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x2c68 67 \<sigma> \<triangleq> ?\<sigma> \<and> Q_printf_chk_addr_0x2c68_67 ?\<sigma> \<and> block_usage P_0x2c68_67_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x2c68_67_def P_0x2c68_67_regions_def post: Q_printf_chk_addr_0x2c68_67_def regionset: P_0x2c68_67_regions_set_def)

definition P_0x2c6d_68 :: state_pred where
  \<open>P_0x2c6d_68 \<sigma> \<equiv> RIP \<sigma> = 0x2c6d \<and> RAX \<sigma> = printf_chk_0x2c68_retval \<and> RCX \<sigma> = ucast ((\<langle>31,0\<rangle>R15 \<sigma>::32 word)) \<and> RDX \<sigma> = ucast ((\<langle>31,0\<rangle>R15 \<sigma>::32 word)) \<and> RDI \<sigma> = 0x1 \<and> RSI \<sigma> = 0x31ab \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x48) \<and> R14 \<sigma> = RDI\<^sub>0 \<and> R13 \<sigma> = (\<sigma> \<turnstile> *[RBP \<sigma>,8]::64 word) \<and> (\<sigma> \<turnstile> *[RBP \<sigma>,8]::64 word) = (\<sigma> \<turnstile> *[RBP \<sigma>,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[RBP \<sigma>,8]::64 word)::64 word) + (\<langle>63,0\<rangle>((R15 \<sigma>::64 word) * 0x8)::64 word)),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[RBP \<sigma>,8]::64 word)::64 word) + (\<langle>63,0\<rangle>((R15 \<sigma>::64 word) * 0x8)::64 word)),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x3c),4]::32 word) = ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((((RDI\<^sub>0::64 word) + (\<langle>63,0\<rangle>((RBX \<sigma>::64 word) * 0x4)::64 word))::64 word) - 0x4),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),8]::64 word) = 0x2c6d \<and> (\<sigma> \<turnstile> *[((((RDI\<^sub>0::64 word) + (\<langle>63,0\<rangle>((RBX \<sigma>::64 word) * 0x4)::64 word))::64 word) - 0x4),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((((RDI\<^sub>0::64 word) + (\<langle>63,0\<rangle>((RBX \<sigma>::64 word) * 0x4)::64 word))::64 word) - 0x4),4]::32 word))\<close>
declare P_0x2c6d_68_def[Ps]

definition P_0x2c6d_68_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x2c6d_68_regions_set \<sigma> \<equiv> {
    (0, RBP \<sigma>, 8),
    (1, RSP\<^sub>0, 8),
    (2, (((\<sigma> \<turnstile> *[RBP \<sigma>,8]::64 word)::64 word) + (\<langle>63,0\<rangle>((R15 \<sigma>::64 word) * 0x8)::64 word)), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x3c), 4),
    (10, ((RSP\<^sub>0::64 word) - 0x40), 4),
    (11, ((RSP\<^sub>0::64 word) - 0x50), 8),
    (12, ((((RDI\<^sub>0::64 word) + (\<langle>63,0\<rangle>((RBX \<sigma>::64 word) * 0x4)::64 word))::64 word) - 0x4), 4)
  }\<close>

definition P_0x2c6d_68_regions :: state_pred where
  \<open>P_0x2c6d_68_regions \<sigma> \<equiv> \<exists>regions. P_0x2c6d_68_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x2c75_68 :: state_pred where
  \<open>Q_0x2c75_68 \<sigma> \<equiv> RIP \<sigma> = 0x2c75 \<and> RDI \<sigma> = 0x1 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x48) \<and> R14 \<sigma> = RDI\<^sub>0 \<and> R13 \<sigma> = (\<sigma> \<turnstile> *[RBP \<sigma>,8]::64 word) \<and> (\<sigma> \<turnstile> *[RBP \<sigma>,8]::64 word) = (\<sigma> \<turnstile> *[RBP \<sigma>,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x3c),4]::32 word) = ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((((RDI\<^sub>0::64 word) + (\<langle>63,0\<rangle>((RBX \<sigma>::64 word) * 0x4)::64 word))::64 word) - 0x4),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((((RDI\<^sub>0::64 word) + (\<langle>63,0\<rangle>((RBX \<sigma>::64 word) * 0x4)::64 word))::64 word) - 0x4),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((((RDI\<^sub>0::64 word) + (\<langle>63,0\<rangle>((RBX \<sigma>::64 word) * 0x4)::64 word))::64 word) - 0x4),4]::32 word))\<close>
declare Q_0x2c75_68_def[Qs]

schematic_goal decode_featureset_0_2_0x2c6d_0x2c71_68[blocks]:
  assumes \<open>(P_0x2c6d_68 && P_0x2c6d_68_regions) \<sigma>\<close>
  shows \<open>exec_block 2 0x2c71 68 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x2c75_68 ?\<sigma> \<and> block_usage P_0x2c6d_68_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x2c6d_68_def P_0x2c6d_68_regions_def post: Q_0x2c75_68_def regionset: P_0x2c6d_68_regions_set_def)

definition P_0x2c75_true_69 :: state_pred where
  \<open>P_0x2c75_true_69 \<sigma> \<equiv> RIP \<sigma> = 0x2c75 \<and> RDI \<sigma> = 0x1 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x48) \<and> R14 \<sigma> = RDI\<^sub>0 \<and> R13 \<sigma> = (\<sigma> \<turnstile> *[RBP \<sigma>,8]::64 word) \<and> (\<sigma> \<turnstile> *[RBP \<sigma>,8]::64 word) = (\<sigma> \<turnstile> *[RBP \<sigma>,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x3c),4]::32 word) = ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((((RDI\<^sub>0::64 word) + (\<langle>63,0\<rangle>((RBX \<sigma>::64 word) * 0x4)::64 word))::64 word) - 0x4),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((((RDI\<^sub>0::64 word) + (\<langle>63,0\<rangle>((RBX \<sigma>::64 word) * 0x4)::64 word))::64 word) - 0x4),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((((RDI\<^sub>0::64 word) + (\<langle>63,0\<rangle>((RBX \<sigma>::64 word) * 0x4)::64 word))::64 word) - 0x4),4]::32 word))\<close>
declare P_0x2c75_true_69_def[Ps]

definition P_0x2c75_true_69_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x2c75_true_69_regions_set \<sigma> \<equiv> {
    (0, RBP \<sigma>, 8),
    (1, RSP\<^sub>0, 8),
    (2, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x3c), 4),
    (9, ((RSP\<^sub>0::64 word) - 0x40), 4),
    (10, ((((RDI\<^sub>0::64 word) + (\<langle>63,0\<rangle>((RBX \<sigma>::64 word) * 0x4)::64 word))::64 word) - 0x4), 4)
  }\<close>

definition P_0x2c75_true_69_regions :: state_pred where
  \<open>P_0x2c75_true_69_regions \<sigma> \<equiv> \<exists>regions. P_0x2c75_true_69_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x2c3d_69 :: state_pred where
  \<open>Q_0x2c3d_69 \<sigma> \<equiv> RIP \<sigma> = 0x2c3d \<and> RDI \<sigma> = 0x1 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x48) \<and> R14 \<sigma> = RDI\<^sub>0 \<and> R13 \<sigma> = (\<sigma> \<turnstile> *[RBP \<sigma>,8]::64 word) \<and> (\<sigma> \<turnstile> *[RBP \<sigma>,8]::64 word) = (\<sigma> \<turnstile> *[RBP \<sigma>,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x3c),4]::32 word) = ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((((RDI\<^sub>0::64 word) + (\<langle>63,0\<rangle>((RBX \<sigma>::64 word) * 0x4)::64 word))::64 word) - 0x4),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((((RDI\<^sub>0::64 word) + (\<langle>63,0\<rangle>((RBX \<sigma>::64 word) * 0x4)::64 word))::64 word) - 0x4),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((((RDI\<^sub>0::64 word) + (\<langle>63,0\<rangle>((RBX \<sigma>::64 word) * 0x4)::64 word))::64 word) - 0x4),4]::32 word))\<close>
declare Q_0x2c3d_69_def[Qs]

schematic_goal decode_featureset_0_1_0x2c75_0x2c75_69[blocks]:
  assumes \<open>(P_0x2c75_true_69 && P_0x2c75_true_69_regions && !ZF) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x2c75 69 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x2c3d_69 ?\<sigma> \<and> block_usage P_0x2c75_true_69_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x2c75_true_69_def P_0x2c75_true_69_regions_def post: Q_0x2c3d_69_def regionset: P_0x2c75_true_69_regions_set_def)

definition P_0x2c75_false_70 :: state_pred where
  \<open>P_0x2c75_false_70 \<sigma> \<equiv> RIP \<sigma> = 0x2c75 \<and> RDI \<sigma> = 0x1 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x48) \<and> R14 \<sigma> = RDI\<^sub>0 \<and> R13 \<sigma> = (\<sigma> \<turnstile> *[RBP \<sigma>,8]::64 word) \<and> (\<sigma> \<turnstile> *[RBP \<sigma>,8]::64 word) = (\<sigma> \<turnstile> *[RBP \<sigma>,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x3c),4]::32 word) = ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((((RDI\<^sub>0::64 word) + (\<langle>63,0\<rangle>((RBX \<sigma>::64 word) * 0x4)::64 word))::64 word) - 0x4),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((((RDI\<^sub>0::64 word) + (\<langle>63,0\<rangle>((RBX \<sigma>::64 word) * 0x4)::64 word))::64 word) - 0x4),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((((RDI\<^sub>0::64 word) + (\<langle>63,0\<rangle>((RBX \<sigma>::64 word) * 0x4)::64 word))::64 word) - 0x4),4]::32 word))\<close>
declare P_0x2c75_false_70_def[Ps]

definition P_0x2c75_false_70_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x2c75_false_70_regions_set \<sigma> \<equiv> {
    (0, RBP \<sigma>, 8),
    (1, RSP\<^sub>0, 8),
    (2, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x3c), 4),
    (9, ((RSP\<^sub>0::64 word) - 0x40), 4),
    (10, ((((RDI\<^sub>0::64 word) + (\<langle>63,0\<rangle>((RBX \<sigma>::64 word) * 0x4)::64 word))::64 word) - 0x4), 4)
  }\<close>

definition P_0x2c75_false_70_regions :: state_pred where
  \<open>P_0x2c75_false_70_regions \<sigma> \<equiv> \<exists>regions. P_0x2c75_false_70_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x2c77_70 :: state_pred where
  \<open>Q_0x2c77_70 \<sigma> \<equiv> RIP \<sigma> = 0x2c77 \<and> RDI \<sigma> = 0x1 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x48) \<and> R14 \<sigma> = RDI\<^sub>0 \<and> R13 \<sigma> = (\<sigma> \<turnstile> *[RBP \<sigma>,8]::64 word) \<and> (\<sigma> \<turnstile> *[RBP \<sigma>,8]::64 word) = (\<sigma> \<turnstile> *[RBP \<sigma>,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x3c),4]::32 word) = ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((((RDI\<^sub>0::64 word) + (\<langle>63,0\<rangle>((RBX \<sigma>::64 word) * 0x4)::64 word))::64 word) - 0x4),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((((RDI\<^sub>0::64 word) + (\<langle>63,0\<rangle>((RBX \<sigma>::64 word) * 0x4)::64 word))::64 word) - 0x4),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((((RDI\<^sub>0::64 word) + (\<langle>63,0\<rangle>((RBX \<sigma>::64 word) * 0x4)::64 word))::64 word) - 0x4),4]::32 word))\<close>
declare Q_0x2c77_70_def[Qs]

schematic_goal decode_featureset_0_1_0x2c75_0x2c75_70[blocks]:
  assumes \<open>(P_0x2c75_false_70 && P_0x2c75_false_70_regions && ! !ZF) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x2c75 70 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x2c77_70 ?\<sigma> \<and> block_usage P_0x2c75_false_70_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x2c75_false_70_def P_0x2c75_false_70_regions_def post: Q_0x2c77_70_def regionset: P_0x2c75_false_70_regions_set_def)

definition P_0x2c77_71 :: state_pred where
  \<open>P_0x2c77_71 \<sigma> \<equiv> RIP \<sigma> = 0x2c77 \<and> RDI \<sigma> = 0x1 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x48) \<and> R14 \<sigma> = RDI\<^sub>0 \<and> R13 \<sigma> = (\<sigma> \<turnstile> *[RBP \<sigma>,8]::64 word) \<and> (\<sigma> \<turnstile> *[RBP \<sigma>,8]::64 word) = (\<sigma> \<turnstile> *[RBP \<sigma>,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x3c),4]::32 word) = ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((((RDI\<^sub>0::64 word) + (\<langle>63,0\<rangle>((RBX \<sigma>::64 word) * 0x4)::64 word))::64 word) - 0x4),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((((RDI\<^sub>0::64 word) + (\<langle>63,0\<rangle>((RBX \<sigma>::64 word) * 0x4)::64 word))::64 word) - 0x4),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((((RDI\<^sub>0::64 word) + (\<langle>63,0\<rangle>((RBX \<sigma>::64 word) * 0x4)::64 word))::64 word) - 0x4),4]::32 word))\<close>
declare P_0x2c77_71_def[Ps]

definition P_0x2c77_71_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x2c77_71_regions_set \<sigma> \<equiv> {
    (0, RBP \<sigma>, 8),
    (1, RSP\<^sub>0, 8),
    (2, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x3c), 4),
    (9, ((RSP\<^sub>0::64 word) - 0x40), 4),
    (10, ((((RDI\<^sub>0::64 word) + (\<langle>63,0\<rangle>((RBX \<sigma>::64 word) * 0x4)::64 word))::64 word) - 0x4), 4)
  }\<close>

definition P_0x2c77_71_regions :: state_pred where
  \<open>P_0x2c77_71_regions \<sigma> \<equiv> \<exists>regions. P_0x2c77_71_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x2c80_71 :: state_pred where
  \<open>Q_0x2c80_71 \<sigma> \<equiv> RIP \<sigma> = 0x2c80 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x48) \<and> R14 \<sigma> = RDI\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x3c),4]::32 word) = ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word))\<close>
declare Q_0x2c80_71_def[Qs]

schematic_goal decode_featureset_0_1_0x2c77_0x2c77_71[blocks]:
  assumes \<open>(P_0x2c77_71 && P_0x2c77_71_regions) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x2c77 71 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x2c80_71 ?\<sigma> \<and> block_usage P_0x2c77_71_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x2c77_71_def P_0x2c77_71_regions_def post: Q_0x2c80_71_def regionset: P_0x2c77_71_regions_set_def)

definition P_0x2c80_72 :: state_pred where
  \<open>P_0x2c80_72 \<sigma> \<equiv> RIP \<sigma> = 0x2c80 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x48) \<and> R14 \<sigma> = RDI\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x3c),4]::32 word) = ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word))\<close>
declare P_0x2c80_72_def[Ps]

definition P_0x2c80_72_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x2c80_72_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (2, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x3c), 4)
  }\<close>

definition P_0x2c80_72_regions :: state_pred where
  \<open>P_0x2c80_72_regions \<sigma> \<equiv> \<exists>regions. P_0x2c80_72_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x2c8d_72 :: state_pred where
  \<open>Q_0x2c8d_72 \<sigma> \<equiv> RIP \<sigma> = 0x2c8d \<and> RDI \<sigma> = 0xa \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x48) \<and> R14 \<sigma> = RDI\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x3c),4]::32 word) = ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word))\<close>
declare Q_0x2c8d_72_def[Qs]

schematic_goal decode_featureset_0_3_0x2c80_0x2c89_72[blocks]:
  assumes \<open>(P_0x2c80_72 && P_0x2c80_72_regions) \<sigma>\<close>
  shows \<open>exec_block 3 0x2c89 72 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x2c8d_72 ?\<sigma> \<and> block_usage P_0x2c80_72_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x2c80_72_def P_0x2c80_72_regions_def post: Q_0x2c8d_72_def regionset: P_0x2c80_72_regions_set_def)

definition P_0x2c8d_73 :: state_pred where
  \<open>P_0x2c8d_73 \<sigma> \<equiv> RIP \<sigma> = 0x2c8d \<and> RDI \<sigma> = 0xa \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x48) \<and> R14 \<sigma> = RDI\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x3c),4]::32 word) = ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word))\<close>
declare P_0x2c8d_73_def[Ps]

definition P_0x2c8d_73_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x2c8d_73_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (2, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x3c), 4),
    (8, ((RSP\<^sub>0::64 word) - 0x50), 8)
  }\<close>

definition P_0x2c8d_73_regions :: state_pred where
  \<open>P_0x2c8d_73_regions \<sigma> \<equiv> \<exists>regions. P_0x2c8d_73_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_putchar_addr_0x2c8d_73 :: state_pred where
  \<open>Q_putchar_addr_0x2c8d_73 \<sigma> \<equiv> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x50) \<and> RIP \<sigma> = putchar_addr \<and> RDI \<sigma> = 0xa \<and> R14 \<sigma> = RDI\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x3c),4]::32 word) = ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),8]::64 word) = 0x2c92\<close>
declare Q_putchar_addr_0x2c8d_73_def[Qs]

schematic_goal decode_featureset_0_1_0x2c8d_0x2c8d_73[blocks]:
  assumes \<open>(P_0x2c8d_73 && P_0x2c8d_73_regions) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x2c8d 73 \<sigma> \<triangleq> ?\<sigma> \<and> Q_putchar_addr_0x2c8d_73 ?\<sigma> \<and> block_usage P_0x2c8d_73_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x2c8d_73_def P_0x2c8d_73_regions_def post: Q_putchar_addr_0x2c8d_73_def regionset: P_0x2c8d_73_regions_set_def)

definition P_0x2c92_74 :: state_pred where
  \<open>P_0x2c92_74 \<sigma> \<equiv> RIP \<sigma> = 0x2c92 \<and> RDI \<sigma> = 0xa \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x48) \<and> R14 \<sigma> = RDI\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x3c),4]::32 word) = ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),8]::64 word) = 0x2c92\<close>
declare P_0x2c92_74_def[Ps]

definition P_0x2c92_74_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x2c92_74_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (2, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x3c), 4),
    (8, ((RSP\<^sub>0::64 word) - 0x50), 8)
  }\<close>

definition P_0x2c92_74_regions :: state_pred where
  \<open>P_0x2c92_74_regions \<sigma> \<equiv> \<exists>regions. P_0x2c92_74_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x2c97_74 :: state_pred where
  \<open>Q_0x2c97_74 \<sigma> \<equiv> RIP \<sigma> = 0x2c97 \<and> RDI \<sigma> = 0xa \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x48) \<and> R14 \<sigma> = RDI\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x3c),4]::32 word) = ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),8]::64 word) = 0x2c92\<close>
declare Q_0x2c97_74_def[Qs]

schematic_goal decode_featureset_0_1_0x2c92_0x2c92_74[blocks]:
  assumes \<open>(P_0x2c92_74 && P_0x2c92_74_regions) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x2c92 74 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x2c97_74 ?\<sigma> \<and> block_usage P_0x2c92_74_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x2c92_74_def P_0x2c92_74_regions_def post: Q_0x2c97_74_def regionset: P_0x2c92_74_regions_set_def)

definition P_0x2c97_true_75 :: state_pred where
  \<open>P_0x2c97_true_75 \<sigma> \<equiv> RIP \<sigma> = 0x2c97 \<and> RDI \<sigma> = 0xa \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x48) \<and> R14 \<sigma> = RDI\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x3c),4]::32 word) = ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),8]::64 word) = 0x2c92\<close>
declare P_0x2c97_true_75_def[Ps]

definition P_0x2c97_true_75_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x2c97_true_75_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (2, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x3c), 4),
    (8, ((RSP\<^sub>0::64 word) - 0x50), 8)
  }\<close>

definition P_0x2c97_true_75_regions :: state_pred where
  \<open>P_0x2c97_true_75_regions \<sigma> \<equiv> \<exists>regions. P_0x2c97_true_75_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x2cd0_75 :: state_pred where
  \<open>Q_0x2cd0_75 \<sigma> \<equiv> RIP \<sigma> = 0x2cd0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x48) \<and> R14 \<sigma> = RDI\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x3c),4]::32 word) = ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word))\<close>
declare Q_0x2cd0_75_def[Qs]

schematic_goal decode_featureset_0_1_0x2c97_0x2c97_75[blocks]:
  assumes \<open>(P_0x2c97_true_75 && P_0x2c97_true_75_regions && jbe) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x2c97 75 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x2cd0_75 ?\<sigma> \<and> block_usage P_0x2c97_true_75_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x2c97_true_75_def P_0x2c97_true_75_regions_def post: Q_0x2cd0_75_def regionset: P_0x2c97_true_75_regions_set_def)

definition P_0x2c97_false_76 :: state_pred where
  \<open>P_0x2c97_false_76 \<sigma> \<equiv> RIP \<sigma> = 0x2c97 \<and> RDI \<sigma> = 0xa \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x48) \<and> R14 \<sigma> = RDI\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x3c),4]::32 word) = ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),8]::64 word) = 0x2c92\<close>
declare P_0x2c97_false_76_def[Ps]

definition P_0x2c97_false_76_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x2c97_false_76_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (2, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x3c), 4),
    (8, ((RSP\<^sub>0::64 word) - 0x50), 8)
  }\<close>

definition P_0x2c97_false_76_regions :: state_pred where
  \<open>P_0x2c97_false_76_regions \<sigma> \<equiv> \<exists>regions. P_0x2c97_false_76_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x2c9d_76 :: state_pred where
  \<open>Q_0x2c9d_76 \<sigma> \<equiv> RIP \<sigma> = 0x2c9d \<and> RDI \<sigma> = 0xa \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x48) \<and> R14 \<sigma> = RDI\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x3c),4]::32 word) = ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),8]::64 word) = 0x2c92\<close>
declare Q_0x2c9d_76_def[Qs]

schematic_goal decode_featureset_0_2_0x2c97_0x2c99_76[blocks]:
  assumes \<open>(P_0x2c97_false_76 && P_0x2c97_false_76_regions && ! jbe) \<sigma>\<close>
  shows \<open>exec_block 2 0x2c99 76 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x2c9d_76 ?\<sigma> \<and> block_usage P_0x2c97_false_76_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x2c97_false_76_def P_0x2c97_false_76_regions_def post: Q_0x2c9d_76_def regionset: P_0x2c97_false_76_regions_set_def)

definition P_0x2c9d_true_77 :: state_pred where
  \<open>P_0x2c9d_true_77 \<sigma> \<equiv> RIP \<sigma> = 0x2c9d \<and> RDI \<sigma> = 0xa \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x48) \<and> R14 \<sigma> = RDI\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x3c),4]::32 word) = ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),8]::64 word) = 0x2c92\<close>
declare P_0x2c9d_true_77_def[Ps]

definition P_0x2c9d_true_77_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x2c9d_true_77_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (2, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x3c), 4),
    (8, ((RSP\<^sub>0::64 word) - 0x50), 8)
  }\<close>

definition P_0x2c9d_true_77_regions :: state_pred where
  \<open>P_0x2c9d_true_77_regions \<sigma> \<equiv> \<exists>regions. P_0x2c9d_true_77_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x2cd0_77 :: state_pred where
  \<open>Q_0x2cd0_77 \<sigma> \<equiv> RIP \<sigma> = 0x2cd0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x48) \<and> R14 \<sigma> = RDI\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x3c),4]::32 word) = ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word))\<close>
declare Q_0x2cd0_77_def[Qs]

schematic_goal decode_featureset_0_1_0x2c9d_0x2c9d_77[blocks]:
  assumes \<open>(P_0x2c9d_true_77 && P_0x2c9d_true_77_regions && ja) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x2c9d 77 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x2cd0_77 ?\<sigma> \<and> block_usage P_0x2c9d_true_77_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x2c9d_true_77_def P_0x2c9d_true_77_regions_def post: Q_0x2cd0_77_def regionset: P_0x2c9d_true_77_regions_set_def)

definition P_0x2c9d_false_78 :: state_pred where
  \<open>P_0x2c9d_false_78 \<sigma> \<equiv> RIP \<sigma> = 0x2c9d \<and> RDI \<sigma> = 0xa \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x48) \<and> R14 \<sigma> = RDI\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x3c),4]::32 word) = ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),8]::64 word) = 0x2c92\<close>
declare P_0x2c9d_false_78_def[Ps]

definition P_0x2c9d_false_78_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x2c9d_false_78_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((RBP \<sigma>::64 word) - 0x10), 8),
    (2, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x3c), 4),
    (9, ((RSP\<^sub>0::64 word) - 0x50), 8)
  }\<close>

definition P_0x2c9d_false_78_regions :: state_pred where
  \<open>P_0x2c9d_false_78_regions \<sigma> \<equiv> \<exists>regions. P_0x2c9d_false_78_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x2cac_78 :: state_pred where
  \<open>Q_0x2cac_78 \<sigma> \<equiv> RIP \<sigma> = 0x2cac \<and> RCX \<sigma> = (\<sigma> \<turnstile> *[((RBP \<sigma>::64 word) - 0x10),8]::64 word) \<and> RDX \<sigma> = ucast ((\<langle>31,0\<rangle>((RBX \<sigma>::64 word) - 0x1)::32 word)) \<and> RDI \<sigma> = 0xa \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x48) \<and> R14 \<sigma> = RDI\<^sub>0 \<and> R12 \<sigma> = ucast ((\<langle>31,0\<rangle>RBX \<sigma>::32 word)) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RBP \<sigma>::64 word) - 0x10),8]::64 word) = (\<sigma> \<turnstile> *[((RBP \<sigma>::64 word) - 0x10),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x3c),4]::32 word) = ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),8]::64 word) = 0x2c92\<close>
declare Q_0x2cac_78_def[Qs]

schematic_goal decode_featureset_0_5_0x2c9d_0x2ca9_78[blocks]:
  assumes \<open>(P_0x2c9d_false_78 && P_0x2c9d_false_78_regions && ! ja) \<sigma>\<close>
  shows \<open>exec_block 5 0x2ca9 78 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x2cac_78 ?\<sigma> \<and> block_usage P_0x2c9d_false_78_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x2c9d_false_78_def P_0x2c9d_false_78_regions_def post: Q_0x2cac_78_def regionset: P_0x2c9d_false_78_regions_set_def)

definition P_0x2cac_true_79 :: state_pred where
  \<open>P_0x2cac_true_79 \<sigma> \<equiv> RIP \<sigma> = 0x2cac \<and> RCX \<sigma> = (\<sigma> \<turnstile> *[((RBP \<sigma>::64 word) - 0x10),8]::64 word) \<and> RDX \<sigma> = ucast ((\<langle>31,0\<rangle>((RBX \<sigma>::64 word) - 0x1)::32 word)) \<and> RDI \<sigma> = 0xa \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x48) \<and> R14 \<sigma> = RDI\<^sub>0 \<and> R12 \<sigma> = ucast ((\<langle>31,0\<rangle>RBX \<sigma>::32 word)) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RBP \<sigma>::64 word) - 0x10),8]::64 word) = (\<sigma> \<turnstile> *[((RBP \<sigma>::64 word) - 0x10),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x3c),4]::32 word) = ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),8]::64 word) = 0x2c92\<close>
declare P_0x2cac_true_79_def[Ps]

definition P_0x2cac_true_79_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x2cac_true_79_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((RBP \<sigma>::64 word) - 0x10), 8),
    (2, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x3c), 4),
    (9, ((RSP\<^sub>0::64 word) - 0x50), 8)
  }\<close>

definition P_0x2cac_true_79_regions :: state_pred where
  \<open>P_0x2cac_true_79_regions \<sigma> \<equiv> \<exists>regions. P_0x2cac_true_79_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x2be8_79 :: state_pred where
  \<open>Q_0x2be8_79 \<sigma> \<equiv> RIP \<sigma> = 0x2be8 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x48) \<and> R14 \<sigma> = RDI\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x3c),4]::32 word) = ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word))\<close>
declare Q_0x2be8_79_def[Qs]

schematic_goal decode_featureset_0_1_0x2cac_0x2cac_79[blocks]:
  assumes \<open>(P_0x2cac_true_79 && P_0x2cac_true_79_regions && !ZF) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x2cac 79 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x2be8_79 ?\<sigma> \<and> block_usage P_0x2cac_true_79_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x2cac_true_79_def P_0x2cac_true_79_regions_def post: Q_0x2be8_79_def regionset: P_0x2cac_true_79_regions_set_def)

definition P_0x2cac_false_80 :: state_pred where
  \<open>P_0x2cac_false_80 \<sigma> \<equiv> RIP \<sigma> = 0x2cac \<and> RCX \<sigma> = (\<sigma> \<turnstile> *[((RBP \<sigma>::64 word) - 0x10),8]::64 word) \<and> RDX \<sigma> = ucast ((\<langle>31,0\<rangle>((RBX \<sigma>::64 word) - 0x1)::32 word)) \<and> RDI \<sigma> = 0xa \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x48) \<and> R14 \<sigma> = RDI\<^sub>0 \<and> R12 \<sigma> = ucast ((\<langle>31,0\<rangle>RBX \<sigma>::32 word)) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RBP \<sigma>::64 word) - 0x10),8]::64 word) = (\<sigma> \<turnstile> *[((RBP \<sigma>::64 word) - 0x10),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x3c),4]::32 word) = ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),8]::64 word) = 0x2c92\<close>
declare P_0x2cac_false_80_def[Ps]

definition P_0x2cac_false_80_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x2cac_false_80_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((RBP \<sigma>::64 word) - 0x10), 8),
    (2, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x3c), 4),
    (9, ((RSP\<^sub>0::64 word) - 0x50), 8)
  }\<close>

definition P_0x2cac_false_80_regions :: state_pred where
  \<open>P_0x2cac_false_80_regions \<sigma> \<equiv> \<exists>regions. P_0x2cac_false_80_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x2cc7_80 :: state_pred where
  \<open>Q_0x2cc7_80 \<sigma> \<equiv> RIP \<sigma> = 0x2cc7 \<and> RAX \<sigma> = 0x0 \<and> RCX \<sigma> = 0x31c0 \<and> RDX \<sigma> = ucast ((\<langle>31,0\<rangle>((RBX \<sigma>::64 word) - 0x1)::32 word)) \<and> RDI \<sigma> = 0x1 \<and> RSI \<sigma> = 0x31b1 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x48) \<and> R14 \<sigma> = RDI\<^sub>0 \<and> R12 \<sigma> = ucast ((\<langle>31,0\<rangle>RBX \<sigma>::32 word)) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RBP \<sigma>::64 word) - 0x10),8]::64 word) = (\<sigma> \<turnstile> *[((RBP \<sigma>::64 word) - 0x10),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x3c),4]::32 word) = ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),8]::64 word) = 0x2c92\<close>
declare Q_0x2cc7_80_def[Qs]

schematic_goal decode_featureset_0_5_0x2cac_0x2cc5_80[blocks]:
  assumes \<open>(P_0x2cac_false_80 && P_0x2cac_false_80_regions && ! !ZF) \<sigma>\<close>
  shows \<open>exec_block 5 0x2cc5 80 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x2cc7_80 ?\<sigma> \<and> block_usage P_0x2cac_false_80_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x2cac_false_80_def P_0x2cac_false_80_regions_def post: Q_0x2cc7_80_def regionset: P_0x2cac_false_80_regions_set_def)

definition P_0x2cc7_81 :: state_pred where
  \<open>P_0x2cc7_81 \<sigma> \<equiv> RIP \<sigma> = 0x2cc7 \<and> RAX \<sigma> = 0x0 \<and> RCX \<sigma> = 0x31c0 \<and> RDX \<sigma> = ucast ((\<langle>31,0\<rangle>((RBX \<sigma>::64 word) - 0x1)::32 word)) \<and> RDI \<sigma> = 0x1 \<and> RSI \<sigma> = 0x31b1 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x48) \<and> R14 \<sigma> = RDI\<^sub>0 \<and> R12 \<sigma> = ucast ((\<langle>31,0\<rangle>RBX \<sigma>::32 word)) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RBP \<sigma>::64 word) - 0x10),8]::64 word) = (\<sigma> \<turnstile> *[((RBP \<sigma>::64 word) - 0x10),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x3c),4]::32 word) = ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),8]::64 word) = 0x2c92\<close>
declare P_0x2cc7_81_def[Ps]

definition P_0x2cc7_81_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x2cc7_81_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((RBP \<sigma>::64 word) - 0x10), 8),
    (2, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x3c), 4),
    (9, ((RSP\<^sub>0::64 word) - 0x50), 8)
  }\<close>

definition P_0x2cc7_81_regions :: state_pred where
  \<open>P_0x2cc7_81_regions \<sigma> \<equiv> \<exists>regions. P_0x2cc7_81_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_printf_chk_addr_0x2cc7_81 :: state_pred where
  \<open>Q_printf_chk_addr_0x2cc7_81 \<sigma> \<equiv> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x50) \<and> RIP \<sigma> = printf_chk_addr \<and> RAX \<sigma> = 0x0 \<and> RCX \<sigma> = 0x31c0 \<and> RDX \<sigma> = ucast ((\<langle>31,0\<rangle>((RBX \<sigma>::64 word) - 0x1)::32 word)) \<and> RDI \<sigma> = 0x1 \<and> RSI \<sigma> = 0x31b1 \<and> R14 \<sigma> = RDI\<^sub>0 \<and> R12 \<sigma> = ucast ((\<langle>31,0\<rangle>RBX \<sigma>::32 word)) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RBP \<sigma>::64 word) - 0x10),8]::64 word) = (\<sigma> \<turnstile> *[((RBP \<sigma>::64 word) - 0x10),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x3c),4]::32 word) = ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),8]::64 word) = 0x2ccc\<close>
declare Q_printf_chk_addr_0x2cc7_81_def[Qs]

schematic_goal decode_featureset_0_1_0x2cc7_0x2cc7_81[blocks]:
  assumes \<open>(P_0x2cc7_81 && P_0x2cc7_81_regions) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x2cc7 81 \<sigma> \<triangleq> ?\<sigma> \<and> Q_printf_chk_addr_0x2cc7_81 ?\<sigma> \<and> block_usage P_0x2cc7_81_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x2cc7_81_def P_0x2cc7_81_regions_def post: Q_printf_chk_addr_0x2cc7_81_def regionset: P_0x2cc7_81_regions_set_def)

definition P_0x2ccc_82 :: state_pred where
  \<open>P_0x2ccc_82 \<sigma> \<equiv> RIP \<sigma> = 0x2ccc \<and> RAX \<sigma> = printf_chk_0x2cc7_retval \<and> RCX \<sigma> = 0x31c0 \<and> RDX \<sigma> = ucast ((\<langle>31,0\<rangle>((RBX \<sigma>::64 word) - 0x1)::32 word)) \<and> RDI \<sigma> = 0x1 \<and> RSI \<sigma> = 0x31b1 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x48) \<and> R14 \<sigma> = RDI\<^sub>0 \<and> R12 \<sigma> = ucast ((\<langle>31,0\<rangle>RBX \<sigma>::32 word)) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RBP \<sigma>::64 word) - 0x10),8]::64 word) = (\<sigma> \<turnstile> *[((RBP \<sigma>::64 word) - 0x10),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x3c),4]::32 word) = ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),8]::64 word) = 0x2ccc\<close>
declare P_0x2ccc_82_def[Ps]

definition P_0x2ccc_82_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x2ccc_82_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((RBP \<sigma>::64 word) - 0x10), 8),
    (2, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x3c), 4),
    (9, ((RSP\<^sub>0::64 word) - 0x50), 8)
  }\<close>

definition P_0x2ccc_82_regions :: state_pred where
  \<open>P_0x2ccc_82_regions \<sigma> \<equiv> \<exists>regions. P_0x2ccc_82_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x2c80_82 :: state_pred where
  \<open>Q_0x2c80_82 \<sigma> \<equiv> RIP \<sigma> = 0x2c80 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x48) \<and> R14 \<sigma> = RDI\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x3c),4]::32 word) = ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word))\<close>
declare Q_0x2c80_82_def[Qs]

schematic_goal decode_featureset_0_1_0x2ccc_0x2ccc_82[blocks]:
  assumes \<open>(P_0x2ccc_82 && P_0x2ccc_82_regions) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x2ccc 82 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x2c80_82 ?\<sigma> \<and> block_usage P_0x2ccc_82_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x2ccc_82_def P_0x2ccc_82_regions_def post: Q_0x2c80_82_def regionset: P_0x2ccc_82_regions_set_def)

definition P_0x2cd0_83 :: state_pred where
  \<open>P_0x2cd0_83 \<sigma> \<equiv> RIP \<sigma> = 0x2cd0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x48) \<and> R14 \<sigma> = RDI\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x3c),4]::32 word) = ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word))\<close>
declare P_0x2cd0_83_def[Ps]

definition P_0x2cd0_83_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x2cd0_83_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (2, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x3c), 4)
  }\<close>

definition P_0x2cd0_83_regions :: state_pred where
  \<open>P_0x2cd0_83_regions \<sigma> \<equiv> \<exists>regions. P_0x2cd0_83_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_ret_address_83 :: state_pred where
  \<open>Q_ret_address_83 \<sigma> \<equiv> RIP \<sigma> = ret_address \<and> RBX \<sigma> = RBX\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) + 0x8) \<and> RBP \<sigma> = RBP\<^sub>0 \<and> R15 \<sigma> = R15\<^sub>0 \<and> R14 \<sigma> = R14\<^sub>0 \<and> R13 \<sigma> = R13\<^sub>0 \<and> R12 \<sigma> = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x3c),4]::32 word) = ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word))\<close>
declare Q_ret_address_83_def[Qs]

schematic_goal decode_featureset_0_8_0x2cd0_0x2cde_83[blocks]:
  assumes \<open>(P_0x2cd0_83 && P_0x2cd0_83_regions) \<sigma>\<close>
  shows \<open>exec_block 8 0x2cde 83 \<sigma> \<triangleq> ?\<sigma> \<and> Q_ret_address_83 ?\<sigma> \<and> block_usage P_0x2cd0_83_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x2cd0_83_def P_0x2cd0_83_regions_def post: Q_ret_address_83_def regionset: P_0x2cd0_83_regions_set_def)

definition decode_featureset_acode :: ACode where
  \<open>decode_featureset_acode =
    Block 14 0x2b61 0;
    Block (Suc 0) 0x2b68 (Suc 0);
    CALL printf_chk_acode;
    Block (Suc 0) 0x2b6d 2;
    IF ZF THEN
      Block (Suc 0) 0x2b6f 3
    ELSE
      Block 6 0x2b86 4;
      WHILE P_0x2b93_5 DO
        Block 8 0x2ba9 5;
        Block (Suc 0) 0x2bac 6;
        CALL printf_chk_acode;
        Block 2 0x2bb5 7;
        IF !ZF THEN
          Block 2 0x2b90 8
        ELSE
          Block (Suc 0) 0x2bb8 9
        FI
      OD; 
      Block (Suc 0) 0x2bba 10;
      IF ZF THEN
        Block (Suc 0) 0x2bbd 11
      ELSE
        Block 7 0x2bdc 12;
        IF ZF THEN
          Block (Suc 0) 0x2bdf 13;
          WHILE P_0x2cb2_14 DO
            Block 4 0x2cc5 14;
            Block (Suc 0) 0x2cc7 15;
            CALL printf_chk_acode;
            Block (Suc 0) 0x2ccc 16;
            WHILE P_0x2c80_17 DO
              Block 3 0x2c89 17;
              Block (Suc 0) 0x2c8d 18;
              CALL putchar_acode;
              Block (Suc 0) 0x2c92 19;
              IF jbe THEN
                Block (Suc 0) 0x2c97 20
              ELSE
                Block 2 0x2c99 21;
                IF ja THEN
                  Block (Suc 0) 0x2c9d 22
                ELSE
                  Block 5 0x2ca9 23;
                  IF !ZF THEN
                    Block 4 0x2bf4 24;
                    Block (Suc 0) 0x2bf6 25;
                    CALL printf_chk_acode;
                    Block 4 0x2c08 26;
                    IF ZF THEN
                      Block 4 0x2cec 27;
                      Block (Suc 0) 0x2cee 28;
                      CALL printf_chk_acode;
                      Block (Suc 0) 0x2cf3 29
                    ELSE
                      Block 3 0x2c14 30;
                      WHILE P_0x2c3d_31 DO
                        Block 4 0x2c47 31;
                        IF ZF THEN
                          Block 3 0x2c37 32;
                          IF ZF THEN
                            Block (Suc 0) 0x2c3b 33
                          ELSE
                            Block (Suc 0) 0x2c3b 34
                          FI
                        ELSE
                          Block 3 0x2c52 35;
                          IF !ZF THEN
                            Block 4 0x2c2c 36;
                            Block (Suc 0) 0x2c2e 37;
                            CALL printf_chk_acode;
                            Block 2 0x2c37 38;
                            IF ZF THEN
                              Block (Suc 0) 0x2c3b 39
                            ELSE
                              Block (Suc 0) 0x2c3b 40
                            FI
                          ELSE
                            Block 5 0x2c66 41;
                            Block (Suc 0) 0x2c68 42;
                            CALL printf_chk_acode;
                            Block 2 0x2c71 43;
                            IF !ZF THEN
                              Block (Suc 0) 0x2c75 44
                            ELSE
                              Block (Suc 0) 0x2c75 45
                            FI
                          FI
                        FI
                      OD;
                      CASES [
                        (P_0x2c80_17,
                          Skip  \<comment> \<open>continue\<close>),
                        (P_0x2c77_46,
                          Block (Suc 0) 0x2c77 46
                        )
                      ]
                    FI
                  ELSE
                    Block (Suc 0) 0x2cac 47
                  FI
                FI
              FI
            OD;
            CASES [
              (P_0x2cb2_14,
                Skip  \<comment> \<open>continue\<close>
              ),
              (P_0x2cd0_83,
                Skip  \<comment> \<open>break [11472]\<close>
              )
            ]
          OD
        ELSE
          Block 2 0x2be5 48;
          WHILE P_0x2be8_49 DO
            Block 3 0x2bf4 49;
            Block (Suc 0) 0x2bf6 50;
            CALL printf_chk_acode;
            Block 4 0x2c08 51;
            IF ZF THEN
              Block 4 0x2cec 52;
              Block (Suc 0) 0x2cee 53;
              CALL printf_chk_acode;
              Block (Suc 0) 0x2cf3 54
            ELSE
              Block 3 0x2c14 55;
              WHILE P_0x2c3d_56 DO
                Block 4 0x2c47 56;
                IF ZF THEN
                  Block 3 0x2c37 57;
                  IF ZF THEN
                    Block (Suc 0) 0x2c3b 58
                  ELSE
                    Block (Suc 0) 0x2c3b 59
                  FI
                ELSE
                  Block 3 0x2c52 60;
                  IF !ZF THEN
                    Block 4 0x2c2c 61;
                    Block (Suc 0) 0x2c2e 62;
                    CALL printf_chk_acode;
                    Block 2 0x2c37 63;
                    IF ZF THEN
                      Block (Suc 0) 0x2c3b 64
                    ELSE
                      Block (Suc 0) 0x2c3b 65
                    FI
                  ELSE
                    Block 5 0x2c66 66;
                    Block (Suc 0) 0x2c68 67;
                    CALL printf_chk_acode;
                    Block 2 0x2c71 68;
                    IF !ZF THEN
                      Block (Suc 0) 0x2c75 69
                    ELSE
                      Block (Suc 0) 0x2c75 70
                    FI
                  FI
                FI
              OD;
              CASES [
                (P_0x2c77_71,
                  Block (Suc 0) 0x2c77 71
                )
              ]
            FI;
            WHILE P_0x2c80_72 DO
              Block 3 0x2c89 72;
              Block (Suc 0) 0x2c8d 73;
              CALL putchar_acode;
              Block (Suc 0) 0x2c92 74;
              IF jbe THEN
                Block (Suc 0) 0x2c97 75
              ELSE
                Block 2 0x2c99 76;
                IF ja THEN
                  Block (Suc 0) 0x2c9d 77
                ELSE
                  Block 5 0x2ca9 78;
                  IF !ZF THEN
                    Block (Suc 0) 0x2cac 79
                  ELSE
                    Block 5 0x2cc5 80;
                    Block (Suc 0) 0x2cc7 81;
                    CALL printf_chk_acode;
                    Block (Suc 0) 0x2ccc 82
                  FI
                FI
              FI
            OD;
            CASES [
              (P_0x2be8_49,
                Skip  \<comment> \<open>continue\<close>
              ),
              (P_0x2cd0_83,
                Skip  \<comment> \<open>break [11472]\<close>
              )
            ]
          OD
        FI
      FI
    FI;
    Block 8 0x2cde 83
  \<close>


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


schematic_goal "decode_featureset":
  assumes
    \<open>\<forall>\<sigma>. RIP \<sigma> = 0x2b68 \<longrightarrow> P_0x2b68_1_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x2b6d \<longrightarrow> P_0x2b6d_2_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x2b6f \<longrightarrow> P_0x2b6f_true_3_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x2b6f \<longrightarrow> P_0x2b6f_false_4_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x2b93 \<longrightarrow> P_0x2b93_5_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x2bac \<longrightarrow> P_0x2bac_6_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x2bb1 \<longrightarrow> P_0x2bb1_7_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x2bb8 \<longrightarrow> P_0x2bb8_true_8_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x2bb8 \<longrightarrow> P_0x2bb8_false_9_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x2bba \<longrightarrow> P_0x2bba_10_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x2bbd \<longrightarrow> P_0x2bbd_true_11_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x2bbd \<longrightarrow> P_0x2bbd_false_12_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x2bdf \<longrightarrow> P_0x2bdf_true_13_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x2cb2 \<longrightarrow> P_0x2cb2_14_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x2cc7 \<longrightarrow> P_0x2cc7_15_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x2ccc \<longrightarrow> P_0x2ccc_16_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x2c80 \<longrightarrow> P_0x2c80_17_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x2c8d \<longrightarrow> P_0x2c8d_18_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x2c92 \<longrightarrow> P_0x2c92_19_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x2c97 \<longrightarrow> P_0x2c97_true_20_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x2c97 \<longrightarrow> P_0x2c97_false_21_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x2c9d \<longrightarrow> P_0x2c9d_true_22_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x2c9d \<longrightarrow> P_0x2c9d_false_23_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x2cac \<longrightarrow> P_0x2cac_true_24_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x2bf6 \<longrightarrow> P_0x2bf6_25_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x2bfb \<longrightarrow> P_0x2bfb_26_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x2c0b \<longrightarrow> P_0x2c0b_true_27_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x2cee \<longrightarrow> P_0x2cee_28_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x2cf3 \<longrightarrow> P_0x2cf3_29_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x2c0b \<longrightarrow> P_0x2c0b_false_30_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x2c3d \<longrightarrow> P_0x2c3d_31_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x2c4b \<longrightarrow> P_0x2c4b_true_32_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x2c3b \<longrightarrow> P_0x2c3b_true_33_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x2c3b \<longrightarrow> P_0x2c3b_false_34_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x2c4b \<longrightarrow> P_0x2c4b_false_35_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x2c55 \<longrightarrow> P_0x2c55_true_36_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x2c2e \<longrightarrow> P_0x2c2e_37_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x2c33 \<longrightarrow> P_0x2c33_38_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x2c3b \<longrightarrow> P_0x2c3b_true_39_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x2c3b \<longrightarrow> P_0x2c3b_false_40_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x2c55 \<longrightarrow> P_0x2c55_false_41_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x2c68 \<longrightarrow> P_0x2c68_42_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x2c6d \<longrightarrow> P_0x2c6d_43_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x2c75 \<longrightarrow> P_0x2c75_true_44_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x2c75 \<longrightarrow> P_0x2c75_false_45_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x2c77 \<longrightarrow> P_0x2c77_46_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x2cac \<longrightarrow> P_0x2cac_false_47_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x2bdf \<longrightarrow> P_0x2bdf_false_48_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x2be8 \<longrightarrow> P_0x2be8_49_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x2bf6 \<longrightarrow> P_0x2bf6_50_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x2bfb \<longrightarrow> P_0x2bfb_51_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x2c0b \<longrightarrow> P_0x2c0b_true_52_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x2cee \<longrightarrow> P_0x2cee_53_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x2cf3 \<longrightarrow> P_0x2cf3_54_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x2c0b \<longrightarrow> P_0x2c0b_false_55_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x2c3d \<longrightarrow> P_0x2c3d_56_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x2c4b \<longrightarrow> P_0x2c4b_true_57_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x2c3b \<longrightarrow> P_0x2c3b_true_58_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x2c3b \<longrightarrow> P_0x2c3b_false_59_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x2c4b \<longrightarrow> P_0x2c4b_false_60_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x2c55 \<longrightarrow> P_0x2c55_true_61_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x2c2e \<longrightarrow> P_0x2c2e_62_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x2c33 \<longrightarrow> P_0x2c33_63_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x2c3b \<longrightarrow> P_0x2c3b_true_64_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x2c3b \<longrightarrow> P_0x2c3b_false_65_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x2c55 \<longrightarrow> P_0x2c55_false_66_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x2c68 \<longrightarrow> P_0x2c68_67_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x2c6d \<longrightarrow> P_0x2c6d_68_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x2c75 \<longrightarrow> P_0x2c75_true_69_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x2c75 \<longrightarrow> P_0x2c75_false_70_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x2c77 \<longrightarrow> P_0x2c77_71_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x2c80 \<longrightarrow> P_0x2c80_72_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x2c8d \<longrightarrow> P_0x2c8d_73_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x2c92 \<longrightarrow> P_0x2c92_74_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x2c97 \<longrightarrow> P_0x2c97_true_75_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x2c97 \<longrightarrow> P_0x2c97_false_76_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x2c9d \<longrightarrow> P_0x2c9d_true_77_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x2c9d \<longrightarrow> P_0x2c9d_false_78_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x2cac \<longrightarrow> P_0x2cac_true_79_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x2cac \<longrightarrow> P_0x2cac_false_80_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x2cc7 \<longrightarrow> P_0x2cc7_81_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x2ccc \<longrightarrow> P_0x2ccc_82_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x2cd0 \<longrightarrow> P_0x2cd0_83_regions \<sigma>\<close>
    and [blocks]: \<open>{{Q_printf_chk_addr_0x2b68_1}} \<box>printf_chk_acode {{P_0x2b6d_2;M_0x2b68}}\<close>
    and [blocks]: \<open>{{Q_printf_chk_addr_0x2bac_6}} \<box>printf_chk_acode {{P_0x2bb1_7;M_0x2bac}}\<close>
    and [blocks]: \<open>{{Q_printf_chk_addr_0x2cc7_15}} \<box>printf_chk_acode {{P_0x2ccc_16;M_0x2cc7}}\<close>
    and [blocks]: \<open>{{Q_putchar_addr_0x2c8d_18}} \<box>putchar_acode {{P_0x2c92_19;M_0x2c8d}}\<close>
    and [blocks]: \<open>{{Q_printf_chk_addr_0x2bf6_25}} \<box>printf_chk_acode {{P_0x2bfb_26;M_0x2bf6}}\<close>
    and [blocks]: \<open>{{Q_printf_chk_addr_0x2cee_28}} \<box>printf_chk_acode {{P_0x2cf3_29;M_0x2cee}}\<close>
    and [blocks]: \<open>{{Q_printf_chk_addr_0x2c2e_37}} \<box>printf_chk_acode {{P_0x2c33_38;M_0x2c2e}}\<close>
    and [blocks]: \<open>{{Q_printf_chk_addr_0x2c68_42}} \<box>printf_chk_acode {{P_0x2c6d_43;M_0x2c68}}\<close>
    and [blocks]: \<open>{{Q_printf_chk_addr_0x2bf6_50}} \<box>printf_chk_acode {{P_0x2bfb_51;M_0x2bf6}}\<close>
    and [blocks]: \<open>{{Q_printf_chk_addr_0x2cee_53}} \<box>printf_chk_acode {{P_0x2cf3_54;M_0x2cee}}\<close>
    and [blocks]: \<open>{{Q_printf_chk_addr_0x2c2e_62}} \<box>printf_chk_acode {{P_0x2c33_63;M_0x2c2e}}\<close>
    and [blocks]: \<open>{{Q_printf_chk_addr_0x2c68_67}} \<box>printf_chk_acode {{P_0x2c6d_68;M_0x2c68}}\<close>
    and [blocks]: \<open>{{Q_putchar_addr_0x2c8d_73}} \<box>putchar_acode {{P_0x2c92_74;M_0x2c8d}}\<close>
    and [blocks]: \<open>{{Q_printf_chk_addr_0x2cc7_81}} \<box>printf_chk_acode {{P_0x2ccc_82;M_0x2cc7}}\<close>
  shows \<open>{{?P}} decode_featureset_acode {{?Q;?M}}\<close>
  apply (vcg acode: decode_featureset_acode_def assms: assms)

  apply (vcg_while "P_0x2b93_5 || P_0x2bba_10")
  apply (simp add: pred_logic Ps Qs assms)
  apply simp+             
  apply (vcg_step assms: assms)+
  apply (simp add: pred_logic Ps Qs assms)
  apply (vcg_step assms: assms)+
  apply (simp add: pred_logic Ps Qs assms)
  apply simp+             
  apply (vcg_step assms: assms)+
  apply (vcg_while "P_0x2cb2_14 || P_0x2cd0_83")
  apply (simp add: pred_logic Ps Qs assms)
  apply simp+             
  apply (vcg_step assms: assms)+
  apply (vcg_while "P_0x2c80_17 || P_0x2cb2_14 || P_0x2cd0_83")
  apply (simp add: pred_logic Ps Qs assms)
  apply simp+             
  apply (vcg_step assms: assms)+
  apply (vcg_while "P_0x2c3d_31 || P_0x2c80_17 || P_0x2c77_46")
  apply (simp add: pred_logic Ps Qs assms)
  apply simp+             
  apply (vcg_step assms: assms)+
  apply (auto simp add: pred_logic Ps Qs assms)[1]
  apply (rule htriples)+
  apply simp
  apply (rule htriples)+
  apply simp
  apply simp
  apply simp
  apply (vcg_step assms: assms)+
  apply (auto simp add: pred_logic Ps Qs assms)[1]
  apply (rule htriples)+
  apply simp
  apply (rule htriples)+
  apply simp+
  apply (rule htriples)+
  apply simp+
  apply (auto simp add: pred_logic Ps Qs assms)[1]
  apply simp+
  apply (vcg_step assms: assms)+
  apply (vcg_while "P_0x2be8_49 || P_0x2cd0_83")                      
  apply (auto simp add: pred_logic Ps Qs assms)[1]
  apply simp+
  apply (vcg_step assms: assms)+
  apply (vcg_while "P_0x2c3d_56 || P_0x2c77_71 || P_0x2c80_72")
  apply (auto simp add: pred_logic Ps Qs assms)[1]
  apply simp+
  apply (vcg_step assms: assms)+
  apply (auto simp add: pred_logic Ps Qs assms)[1]
  apply (rule htriples)+
  apply simp
  apply (vcg_step assms: assms)+
  apply (vcg_while "P_0x2c80_72 || P_0x2be8_49 || P_0x2cd0_83")
  apply (auto simp add: pred_logic Ps Qs assms)[1]
  apply simp
  apply (vcg_step assms: assms)+
  apply (auto simp add: pred_logic Ps Qs assms)[1]
  apply (rule htriples)+
  apply simp
  apply (rule htriples)+
  apply simp+
  apply (rule htriples)+
  apply simp+
  apply (auto simp add: pred_logic Ps Qs assms)[1]
  apply simp+
  apply (auto simp add: pred_logic Ps Qs assms)[1]
  apply (vcg_step assms: assms)
  apply (auto simp add: pred_logic Ps Qs assms)[1]
  apply (auto simp add: pred_logic Ps Qs assms)[1]
  apply (auto simp add: pred_logic Ps Qs assms)[1]
  apply simp+
  done


end
