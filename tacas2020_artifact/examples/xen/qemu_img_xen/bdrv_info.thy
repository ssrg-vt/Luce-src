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
theory bdrv_info
  imports "../../../isabelle/VCG/HTriple"
begin

locale "qemu_img_xen" = execution_context + exec_code +
  fixes term_printf_0x19884_retval\<^sub>v term_printf_0x198a8_retval\<^sub>v term_print_filename_0x198b1_retval\<^sub>v term_printf_0x198cf_retval\<^sub>v term_printf_0x198e4_retval\<^sub>v term_printf_0x1990d_retval\<^sub>v term_printf_0x1991b_retval\<^sub>v term_printf_0x19940_retval\<^sub>v term_printf_0x1994e_retval\<^sub>v term_printf_0x19970_retval\<^sub>v term_printf_0x1998c_retval\<^sub>v term_printf_0x199a5_retval\<^sub>v term_printf_0x199b7_retval\<^sub>v term_printf_0x199d1_retval\<^sub>v term_printf_0x199e9_retval\<^sub>v term_print_filename_0x199f5_retval\<^sub>v term_printf_0x19a58_retval\<^sub>v term_print_filename_addr term_printf_addr :: \<open>64 word\<close>
    and term_print_filename_acode term_printf_acode :: ACode
  assumes fetch:
    "fetch 0x19850 \<equiv> (Unary (IS_8088 Push) (Storage (Reg (General SixtyFour rbx))), 1)"
    "fetch 0x19851 \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour rbx)) (Storage (Memory SixtyFour (A_SizeDirective 64 (A_Plus (A_FromReg (General SixtyFour rip)) (A_WordConstant 68672))))), 7)"
    "fetch 0x19858 \<equiv> (Binary (IS_8088 Test) (Reg (General SixtyFour rbx)) (Storage (Reg (General SixtyFour rbx))), 3)"
    "fetch 0x1985b \<equiv> (Unary (IS_8088 Jne) (Immediate SixtyFour (ImmVal 104752)), 6)"
    "fetch 0x19861 \<equiv> (Unary (IS_8088 Jmp) (Immediate SixtyFour (ImmVal 104960)), 5)"
    "fetch 0x19866 \<equiv> (Unary (IS_8088 Nop) (Storage (Memory Sixteen (A_SizeDirective 16 (A_Plus (A_FromReg (General SixtyFour cs)) (A_Plus (A_FromReg (General SixtyFour rax)) (A_Plus (A_Mult 1 (A_FromReg (General SixtyFour rax))) (A_WordConstant 0))))))), 10)"
    "fetch 0x19870 \<equiv> (Binary (IS_8088 Test) (Reg (General ThirtyTwo rax)) (Storage (Reg (General ThirtyTwo rax))), 2)"
    "fetch 0x19872 \<equiv> (Unary (IS_8088 Je) (Immediate SixtyFour (ImmVal 104880)), 6)"
    "fetch 0x19878 \<equiv> (Binary (IS_8088 Mov) (Reg (General ThirtyTwo rsi)) (Storage (Memory ThirtyTwo (A_SizeDirective 32 (A_Plus (A_FromReg (General SixtyFour rbx)) (A_WordConstant 12))))), 3)"
    "fetch 0x1987b \<equiv> (Binary (IS_8088 Lea) (Reg (General SixtyFour rdi)) (Storage (Memory SixtyFour (A_Plus (A_FromReg (General SixtyFour rip)) (A_WordConstant 33098)))), 7)"
    "fetch 0x19882 \<equiv> (Binary (IS_8088 Xor) (Reg (General ThirtyTwo rax)) (Storage (Reg (General ThirtyTwo rax))), 2)"
    "fetch 0x19884 \<equiv> (Unary (IS_8088 Call) (Immediate SixtyFour (ImmLabel ''term_printf'')), 5)"
    "fetch 0x19889 \<equiv> (Binary (IS_8088 Mov) (Reg (General ThirtyTwo rdx)) (Storage (Memory ThirtyTwo (A_SizeDirective 32 (A_Plus (A_FromReg (General SixtyFour rbx)) (A_WordConstant 12))))), 3)"
    "fetch 0x1988c \<equiv> (Binary (IS_8088 Test) (Reg (General ThirtyTwo rdx)) (Storage (Reg (General ThirtyTwo rdx))), 2)"
    "fetch 0x1988e \<equiv> (Unary (IS_8088 Jne) (Immediate SixtyFour (ImmVal 104832)), 6)"
    "fetch 0x19894 \<equiv> (Binary (IS_8088 Cmp) (Memory SixtyFour (A_SizeDirective 64 (A_Plus (A_FromReg (General SixtyFour rbx)) (A_WordConstant 56)))) (Immediate SixtyFour (ImmVal 0)), 5)"
    "fetch 0x19899 \<equiv> (Unary (IS_8088 Je) (Immediate SixtyFour (ImmVal 104860)), 6)"
    "fetch 0x1989f \<equiv> (Binary (IS_8088 Xor) (Reg (General ThirtyTwo rax)) (Storage (Reg (General ThirtyTwo rax))), 2)"
    "fetch 0x198a1 \<equiv> (Binary (IS_8088 Lea) (Reg (General SixtyFour rdi)) (Storage (Memory SixtyFour (A_Plus (A_FromReg (General SixtyFour rip)) (A_WordConstant 33085)))), 7)"
    "fetch 0x198a8 \<equiv> (Unary (IS_8088 Call) (Immediate SixtyFour (ImmLabel ''term_printf'')), 5)"
    "fetch 0x198ad \<equiv> (Binary (IS_8088 Lea) (Reg (General SixtyFour rdi)) (Storage (Memory SixtyFour (A_Plus (A_FromReg (General SixtyFour rbx)) (A_WordConstant 72)))), 4)"
    "fetch 0x198b1 \<equiv> (Unary (IS_8088 Call) (Immediate SixtyFour (ImmLabel ''term_print_filename'')), 5)"
    "fetch 0x198b6 \<equiv> (Binary (IS_8088 Cmp) (Memory Eight (A_SizeDirective 8 (A_Plus (A_FromReg (General SixtyFour rbx)) (A_WordConstant 1096)))) (Immediate SixtyFour (ImmVal 0)), 7)"
    "fetch 0x198bd \<equiv> (Unary (IS_8088 Jne) (Immediate SixtyFour (ImmVal 104928)), 6)"
    "fetch 0x198c3 \<equiv> (Binary (IS_8088 Mov) (Reg (General ThirtyTwo rsi)) (Storage (Memory ThirtyTwo (A_SizeDirective 32 (A_Plus (A_FromReg (General SixtyFour rbx)) (A_WordConstant 8))))), 3)"
    "fetch 0x198c6 \<equiv> (Binary (IS_8088 Lea) (Reg (General SixtyFour rdi)) (Storage (Memory SixtyFour (A_Plus (A_FromReg (General SixtyFour rip)) (A_WordConstant 33070)))), 7)"
    "fetch 0x198cd \<equiv> (Binary (IS_8088 Xor) (Reg (General ThirtyTwo rax)) (Storage (Reg (General ThirtyTwo rax))), 2)"
    "fetch 0x198cf \<equiv> (Unary (IS_8088 Call) (Immediate SixtyFour (ImmLabel ''term_printf'')), 5)"
    "fetch 0x198d4 \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour rax)) (Storage (Memory SixtyFour (A_SizeDirective 64 (A_Plus (A_FromReg (General SixtyFour rbx)) (A_WordConstant 56))))), 4)"
    "fetch 0x198d8 \<equiv> (Binary (IS_8088 Lea) (Reg (General SixtyFour rdi)) (Storage (Memory SixtyFour (A_Plus (A_FromReg (General SixtyFour rip)) (A_WordConstant 33059)))), 7)"
    "fetch 0x198df \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour rsi)) (Storage (Memory SixtyFour (A_SizeDirective 64 (A_FromReg (General SixtyFour rax))))), 3)"
    "fetch 0x198e2 \<equiv> (Binary (IS_8088 Xor) (Reg (General ThirtyTwo rax)) (Storage (Reg (General ThirtyTwo rax))), 2)"
    "fetch 0x198e4 \<equiv> (Unary (IS_8088 Call) (Immediate SixtyFour (ImmLabel ''term_printf'')), 5)"
    "fetch 0x198e9 \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour rax)) (Storage (Memory SixtyFour (A_SizeDirective 64 (A_Plus (A_FromReg (General SixtyFour rbx)) (A_WordConstant 2128))))), 7)"
    "fetch 0x198f0 \<equiv> (Binary (IS_8088 Test) (Reg (General SixtyFour rax)) (Storage (Reg (General SixtyFour rax))), 3)"
    "fetch 0x198f3 \<equiv> (Unary (IS_8088 Je) (Immediate SixtyFour (ImmVal 104705)), 2)"
    "fetch 0x198f5 \<equiv> (Binary (IS_8088 Mov) (Reg (General ThirtyTwo rax)) (Storage (Memory ThirtyTwo (A_SizeDirective 32 (A_Plus (A_FromReg (General SixtyFour rax)) (A_WordConstant 20))))), 3)"
    "fetch 0x198f8 \<equiv> (Binary (IS_8088 Mov) (Reg (General ThirtyTwo rsi)) (Immediate SixtyFour (ImmVal 1)), 5)"
    "fetch 0x198fd \<equiv> (Binary (IS_8088 Test) (Reg (General ThirtyTwo rax)) (Storage (Reg (General ThirtyTwo rax))), 2)"
    "fetch 0x198ff \<equiv> (Unary (IS_8088 Jne) (Immediate SixtyFour (ImmVal 104708)), 2)"
    "fetch 0x19901 \<equiv> (Binary (IS_8088 Mov) (Reg (General ThirtyTwo rsi)) (Storage (Memory ThirtyTwo (A_SizeDirective 32 (A_Plus (A_FromReg (General SixtyFour rbx)) (A_WordConstant 20))))), 3)"
    "fetch 0x19904 \<equiv> (Binary (IS_8088 Lea) (Reg (General SixtyFour rdi)) (Storage (Memory SixtyFour (A_Plus (A_FromReg (General SixtyFour rip)) (A_WordConstant 33023)))), 7)"
    "fetch 0x1990b \<equiv> (Binary (IS_8088 Xor) (Reg (General ThirtyTwo rax)) (Storage (Reg (General ThirtyTwo rax))), 2)"
    "fetch 0x1990d \<equiv> (Unary (IS_8088 Call) (Immediate SixtyFour (ImmLabel ''term_printf'')), 5)"
    "fetch 0x19912 \<equiv> (Binary (IS_8088 Lea) (Reg (General SixtyFour rdi)) (Storage (Memory SixtyFour (A_Plus (A_FromReg (General SixtyFour rip)) (A_WordConstant 29512)))), 7)"
    "fetch 0x19919 \<equiv> (Binary (IS_8088 Xor) (Reg (General ThirtyTwo rax)) (Storage (Reg (General ThirtyTwo rax))), 2)"
    "fetch 0x1991b \<equiv> (Unary (IS_8088 Call) (Immediate SixtyFour (ImmLabel ''term_printf'')), 5)"
    "fetch 0x19920 \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour rbx)) (Storage (Memory SixtyFour (A_SizeDirective 64 (A_Plus (A_FromReg (General SixtyFour rbx)) (A_WordConstant 2232))))), 7)"
    "fetch 0x19927 \<equiv> (Binary (IS_8088 Test) (Reg (General SixtyFour rbx)) (Storage (Reg (General SixtyFour rbx))), 3)"
    "fetch 0x1992a \<equiv> (Unary (IS_8088 Je) (Immediate SixtyFour (ImmVal 104960)), 6)"
    "fetch 0x19930 \<equiv> (Binary (IS_8088 Lea) (Reg (General SixtyFour rsi)) (Storage (Memory SixtyFour (A_Plus (A_FromReg (General SixtyFour rbx)) (A_WordConstant 2200)))), 7)"
    "fetch 0x19937 \<equiv> (Binary (IS_8088 Lea) (Reg (General SixtyFour rdi)) (Storage (Memory SixtyFour (A_Plus (A_FromReg (General SixtyFour rip)) (A_WordConstant 32889)))), 7)"
    "fetch 0x1993e \<equiv> (Binary (IS_8088 Xor) (Reg (General ThirtyTwo rax)) (Storage (Reg (General ThirtyTwo rax))), 2)"
    "fetch 0x19940 \<equiv> (Unary (IS_8088 Call) (Immediate SixtyFour (ImmLabel ''term_printf'')), 5)"
    "fetch 0x19945 \<equiv> (Binary (IS_8088 Xor) (Reg (General ThirtyTwo rax)) (Storage (Reg (General ThirtyTwo rax))), 2)"
    "fetch 0x19947 \<equiv> (Binary (IS_8088 Lea) (Reg (General SixtyFour rdi)) (Storage (Memory SixtyFour (A_Plus (A_FromReg (General SixtyFour rip)) (A_WordConstant 32877)))), 7)"
    "fetch 0x1994e \<equiv> (Unary (IS_8088 Call) (Immediate SixtyFour (ImmLabel ''term_printf'')), 5)"
    "fetch 0x19953 \<equiv> (Binary (IS_8088 Mov) (Reg (General ThirtyTwo rax)) (Storage (Memory ThirtyTwo (A_SizeDirective 32 (A_Plus (A_FromReg (General SixtyFour rbx)) (A_WordConstant 2196))))), 6)"
    "fetch 0x19959 \<equiv> (Binary (IS_8088 Cmp) (Reg (General ThirtyTwo rax)) (Immediate SixtyFour (ImmVal 1)), 3)"
    "fetch 0x1995c \<equiv> (Unary (IS_8088 Je) (Immediate SixtyFour (ImmVal 104904)), 2)"
    "fetch 0x1995e \<equiv> (Binary (IS_8088 Cmp) (Reg (General ThirtyTwo rax)) (Immediate SixtyFour (ImmVal 2)), 3)"
    "fetch 0x19961 \<equiv> (Unary (IS_8088 Jne) (Immediate SixtyFour (ImmVal 104560)), 6)"
    "fetch 0x19967 \<equiv> (Binary (IS_8088 Lea) (Reg (General SixtyFour rdi)) (Storage (Memory SixtyFour (A_Plus (A_FromReg (General SixtyFour rip)) (A_WordConstant 32855)))), 7)"
    "fetch 0x1996e \<equiv> (Binary (IS_8088 Xor) (Reg (General ThirtyTwo rax)) (Storage (Reg (General ThirtyTwo rax))), 2)"
    "fetch 0x19970 \<equiv> (Unary (IS_8088 Call) (Immediate SixtyFour (ImmLabel ''term_printf'')), 5)"
    "fetch 0x19975 \<equiv> (Unary (IS_8088 Jmp) (Immediate SixtyFour (ImmVal 104568)), 5)"
    "fetch 0x1997a \<equiv> (Unary (IS_8088 Nop) (Storage (Memory Sixteen (A_SizeDirective 16 (A_Plus (A_FromReg (General SixtyFour rax)) (A_Plus (A_Mult 1 (A_FromReg (General SixtyFour rax))) (A_WordConstant 0)))))), 6)"
    "fetch 0x19980 \<equiv> (Binary (IS_8088 Mov) (Reg (General ThirtyTwo rsi)) (Storage (Memory ThirtyTwo (A_SizeDirective 32 (A_Plus (A_FromReg (General SixtyFour rbx)) (A_WordConstant 16))))), 3)"
    "fetch 0x19983 \<equiv> (Binary (IS_8088 Xor) (Reg (General ThirtyTwo rax)) (Storage (Reg (General ThirtyTwo rax))), 2)"
    "fetch 0x19985 \<equiv> (Binary (IS_8088 Lea) (Reg (General SixtyFour rdi)) (Storage (Memory SixtyFour (A_Plus (A_FromReg (General SixtyFour rip)) (A_WordConstant 32846)))), 7)"
    "fetch 0x1998c \<equiv> (Unary (IS_8088 Call) (Immediate SixtyFour (ImmLabel ''term_printf'')), 5)"
    "fetch 0x19991 \<equiv> (Binary (IS_8088 Cmp) (Memory SixtyFour (A_SizeDirective 64 (A_Plus (A_FromReg (General SixtyFour rbx)) (A_WordConstant 56)))) (Immediate SixtyFour (ImmVal 0)), 5)"
    "fetch 0x19996 \<equiv> (Unary (IS_8088 Jne) (Immediate SixtyFour (ImmVal 104607)), 6)"
    "fetch 0x1999c \<equiv> (Binary (IS_8088 Lea) (Reg (General SixtyFour rdi)) (Storage (Memory SixtyFour (A_Plus (A_FromReg (General SixtyFour rip)) (A_WordConstant 32885)))), 7)"
    "fetch 0x199a3 \<equiv> (Binary (IS_8088 Xor) (Reg (General ThirtyTwo rax)) (Storage (Reg (General ThirtyTwo rax))), 2)"
    "fetch 0x199a5 \<equiv> (Unary (IS_8088 Call) (Immediate SixtyFour (ImmLabel ''term_printf'')), 5)"
    "fetch 0x199aa \<equiv> (Unary (IS_8088 Jmp) (Immediate SixtyFour (ImmVal 104722)), 5)"
    "fetch 0x199af \<equiv> (Nullary (IS_8088 Nop), 1)"
    "fetch 0x199b0 \<equiv> (Binary (IS_8088 Lea) (Reg (General SixtyFour rdi)) (Storage (Memory SixtyFour (A_Plus (A_FromReg (General SixtyFour rip)) (A_WordConstant 32779)))), 7)"
    "fetch 0x199b7 \<equiv> (Unary (IS_8088 Call) (Immediate SixtyFour (ImmLabel ''term_printf'')), 5)"
    "fetch 0x199bc \<equiv> (Unary (IS_8088 Jmp) (Immediate SixtyFour (ImmVal 104568)), 5)"
    "fetch 0x199c1 \<equiv> (Unary (IS_8088 Nop) (Storage (Memory ThirtyTwo (A_SizeDirective 32 (A_Plus (A_FromReg (General SixtyFour rax)) (A_WordConstant 0))))), 7)"
    "fetch 0x199c8 \<equiv> (Binary (IS_8088 Lea) (Reg (General SixtyFour rdi)) (Storage (Memory SixtyFour (A_Plus (A_FromReg (General SixtyFour rip)) (A_WordConstant 32738)))), 7)"
    "fetch 0x199cf \<equiv> (Binary (IS_8088 Xor) (Reg (General ThirtyTwo rax)) (Storage (Reg (General ThirtyTwo rax))), 2)"
    "fetch 0x199d1 \<equiv> (Unary (IS_8088 Call) (Immediate SixtyFour (ImmLabel ''term_printf'')), 5)"
    "fetch 0x199d6 \<equiv> (Unary (IS_8088 Jmp) (Immediate SixtyFour (ImmVal 104568)), 5)"
    "fetch 0x199db \<equiv> (Unary (IS_8088 Nop) (Storage (Memory ThirtyTwo (A_SizeDirective 32 (A_Plus (A_FromReg (General SixtyFour rax)) (A_Plus (A_Mult 1 (A_FromReg (General SixtyFour rax))) (A_WordConstant 0)))))), 5)"
    "fetch 0x199e0 \<equiv> (Binary (IS_8088 Lea) (Reg (General SixtyFour rdi)) (Storage (Memory SixtyFour (A_Plus (A_FromReg (General SixtyFour rip)) (A_WordConstant 32773)))), 7)"
    "fetch 0x199e7 \<equiv> (Binary (IS_8088 Xor) (Reg (General ThirtyTwo rax)) (Storage (Reg (General ThirtyTwo rax))), 2)"
    "fetch 0x199e9 \<equiv> (Unary (IS_8088 Call) (Immediate SixtyFour (ImmLabel ''term_printf'')), 5)"
    "fetch 0x199ee \<equiv> (Binary (IS_8088 Lea) (Reg (General SixtyFour rdi)) (Storage (Memory SixtyFour (A_Plus (A_FromReg (General SixtyFour rbx)) (A_WordConstant 1096)))), 7)"
    "fetch 0x199f5 \<equiv> (Unary (IS_8088 Call) (Immediate SixtyFour (ImmLabel ''term_print_filename'')), 5)"
    "fetch 0x199fa \<equiv> (Unary (IS_8088 Jmp) (Immediate SixtyFour (ImmVal 104643)), 5)"
    "fetch 0x199ff \<equiv> (Nullary (IS_8088 Nop), 1)"
    "fetch 0x19a00 \<equiv> (Unary (IS_8088 Pop) (Storage (Reg (General SixtyFour rbx))), 1)"
    "fetch 0x19a01 \<equiv> (Nullary (IS_8088 Ret), 1)"
    "fetch 0x19a02 \<equiv> (Unary (IS_8088 Nop) (Storage (Memory Sixteen (A_SizeDirective 16 (A_Plus (A_FromReg (General SixtyFour cs)) (A_Plus (A_FromReg (General SixtyFour rax)) (A_Plus (A_Mult 1 (A_FromReg (General SixtyFour rax))) (A_WordConstant 0))))))), 11)"
    "fetch 0x19a10 \<equiv> (Unary (IS_8088 Push) (Storage (Reg (General SixtyFour rbp))), 1)"
    "fetch 0x19a11 \<equiv> (Unary (IS_8088 Push) (Storage (Reg (General SixtyFour rbx))), 1)"
    "fetch 0x19a12 \<equiv> (Binary (IS_8088 Sub) (Reg (General SixtyFour rsp)) (Immediate SixtyFour (ImmVal 8)), 4)"
    "fetch 0x19a16 \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour rbx)) (Storage (Memory SixtyFour (A_SizeDirective 64 (A_Plus (A_FromReg (General SixtyFour rip)) (A_WordConstant 68219))))), 7)"
    "fetch 0x19a1d \<equiv> (Binary (IS_8088 Test) (Reg (General SixtyFour rbx)) (Storage (Reg (General SixtyFour rbx))), 3)"
    "fetch 0x19a20 \<equiv> (Unary (IS_8088 Je) (Immediate SixtyFour (ImmVal 105065)), 2)"
    "fetch 0x19a22 \<equiv> (Binary (IS_8088 Lea) (Reg (General SixtyFour rbp)) (Storage (Memory SixtyFour (A_Plus (A_FromReg (General SixtyFour rip)) (A_WordConstant 32895)))), 7)"
    "fetch 0x19a29 \<equiv> (Unary (IS_8088 Nop) (Storage (Memory ThirtyTwo (A_SizeDirective 32 (A_Plus (A_FromReg (General SixtyFour rax)) (A_WordConstant 0))))), 7)"
    "fetch 0x19a30 \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour rcx)) (Storage (Memory SixtyFour (A_SizeDirective 64 (A_Plus (A_FromReg (General SixtyFour rbx)) (A_WordConstant 2152))))), 7)"
    "fetch 0x19a37 \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour rdx)) (Storage (Memory SixtyFour (A_SizeDirective 64 (A_Plus (A_FromReg (General SixtyFour rbx)) (A_WordConstant 2144))))), 7)"
    "fetch 0x19a3e \<equiv> (Binary (IS_8088 Xor) (Reg (General ThirtyTwo rax)) (Storage (Reg (General ThirtyTwo rax))), 2)"
    "fetch 0x19a40 \<equiv> (Binary (IS_8088 Lea) (Reg (General SixtyFour rsi)) (Storage (Memory SixtyFour (A_Plus (A_FromReg (General SixtyFour rbx)) (A_WordConstant 2200)))), 7)"
    "fetch 0x19a47 \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour r9)) (Storage (Memory SixtyFour (A_SizeDirective 64 (A_Plus (A_FromReg (General SixtyFour rbx)) (A_WordConstant 2168))))), 7)"
    "fetch 0x19a4e \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour r8)) (Storage (Memory SixtyFour (A_SizeDirective 64 (A_Plus (A_FromReg (General SixtyFour rbx)) (A_WordConstant 2160))))), 7)"
    "fetch 0x19a55 \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour rdi)) (Storage (Reg (General SixtyFour rbp))), 3)"
    "fetch 0x19a58 \<equiv> (Unary (IS_8088 Call) (Immediate SixtyFour (ImmLabel ''term_printf'')), 5)"
    "fetch 0x19a5d \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour rbx)) (Storage (Memory SixtyFour (A_SizeDirective 64 (A_Plus (A_FromReg (General SixtyFour rbx)) (A_WordConstant 2232))))), 7)"
    "fetch 0x19a64 \<equiv> (Binary (IS_8088 Test) (Reg (General SixtyFour rbx)) (Storage (Reg (General SixtyFour rbx))), 3)"
    "fetch 0x19a67 \<equiv> (Unary (IS_8088 Jne) (Immediate SixtyFour (ImmVal 105008)), 2)"
    "fetch 0x19a69 \<equiv> (Binary (IS_8088 Add) (Reg (General SixtyFour rsp)) (Immediate SixtyFour (ImmVal 8)), 4)"
    "fetch 0x19a6d \<equiv> (Unary (IS_8088 Pop) (Storage (Reg (General SixtyFour rbx))), 1)"
    "fetch 0x19a6e \<equiv> (Unary (IS_8088 Pop) (Storage (Reg (General SixtyFour rbp))), 1)"
    "fetch 0x19a6f \<equiv> (Nullary (IS_8088 Ret), 1)"
    and \<alpha>_def: \<open>\<alpha> = \<lparr>text_sections = [], data_sections = [], labels_to_offsets = [], binary_offset = 0\<rparr>\<close>
    and term_print_filename\<^sub>a\<^sub>d\<^sub>d\<^sub>r[simp]: \<open>the (label_to_address \<alpha> ''term_print_filename'') = term_print_filename_addr\<close>
    and term_printf\<^sub>a\<^sub>d\<^sub>d\<^sub>r[simp]: \<open>the (label_to_address \<alpha> ''term_printf'') = term_printf_addr\<close>
begin

text \<open>Using definitions that don't get unfolded immediately prevents locale argument issues.\<close>
definition \<open>term_printf_0x19884_retval \<equiv> term_printf_0x19884_retval\<^sub>v\<close>
definition \<open>term_printf_0x198a8_retval \<equiv> term_printf_0x198a8_retval\<^sub>v\<close>
definition \<open>term_print_filename_0x198b1_retval \<equiv> term_print_filename_0x198b1_retval\<^sub>v\<close>
definition \<open>term_printf_0x198cf_retval \<equiv> term_printf_0x198cf_retval\<^sub>v\<close>
definition \<open>term_printf_0x198e4_retval \<equiv> term_printf_0x198e4_retval\<^sub>v\<close>
definition \<open>term_printf_0x1990d_retval \<equiv> term_printf_0x1990d_retval\<^sub>v\<close>
definition \<open>term_printf_0x1991b_retval \<equiv> term_printf_0x1991b_retval\<^sub>v\<close>
definition \<open>term_printf_0x19940_retval \<equiv> term_printf_0x19940_retval\<^sub>v\<close>
definition \<open>term_printf_0x1994e_retval \<equiv> term_printf_0x1994e_retval\<^sub>v\<close>
definition \<open>term_printf_0x19970_retval \<equiv> term_printf_0x19970_retval\<^sub>v\<close>
definition \<open>term_printf_0x1998c_retval \<equiv> term_printf_0x1998c_retval\<^sub>v\<close>
definition \<open>term_printf_0x199a5_retval \<equiv> term_printf_0x199a5_retval\<^sub>v\<close>
definition \<open>term_printf_0x199b7_retval \<equiv> term_printf_0x199b7_retval\<^sub>v\<close>
definition \<open>term_printf_0x199d1_retval \<equiv> term_printf_0x199d1_retval\<^sub>v\<close>
definition \<open>term_printf_0x199e9_retval \<equiv> term_printf_0x199e9_retval\<^sub>v\<close>
definition \<open>term_print_filename_0x199f5_retval \<equiv> term_print_filename_0x199f5_retval\<^sub>v\<close>
definition \<open>term_printf_0x19a58_retval \<equiv> term_printf_0x19a58_retval\<^sub>v\<close>

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

text \<open>May need to be moved down (close to the abstract code) to avoid TERM exceptions.\<close>
method vcg_while for P :: state_pred uses assms =
  ((rule htriples)+)?,
  rule HTriple_weaken[where P=P],
  simp add: pred_logic Ps Qs assms,
  rule HTriple_while,
  (vcg_step assms: assms)+,
  (simp add: pred_logic Ps Qs)+,
  (vcg_step' assms: assms | vcg_step assms: assms)+,
  ((simp add: assms)+)?

method vcg uses acode assms =
  subst acode,
  (vcg_step assms: assms)+

end

locale "bdrv_info" = "qemu_img_xen" +
  fixes RAX\<^sub>0\<^sub>v RBX\<^sub>0\<^sub>v RDX\<^sub>0\<^sub>v RDI\<^sub>0\<^sub>v RSI\<^sub>0\<^sub>v RSP\<^sub>0\<^sub>v ret_address\<^sub>v :: \<open>64 word\<close>
begin

text \<open>Using definitions that don't get unfolded immediately prevents locale argument issues.\<close>
definition \<open>RAX\<^sub>0 \<equiv> RAX\<^sub>0\<^sub>v\<close>
definition \<open>RBX\<^sub>0 \<equiv> RBX\<^sub>0\<^sub>v\<close>
definition \<open>RDX\<^sub>0 \<equiv> RDX\<^sub>0\<^sub>v\<close>
definition \<open>RDI\<^sub>0 \<equiv> RDI\<^sub>0\<^sub>v\<close>
definition \<open>RSI\<^sub>0 \<equiv> RSI\<^sub>0\<^sub>v\<close>
definition \<open>RSP\<^sub>0 \<equiv> RSP\<^sub>0\<^sub>v\<close>
definition \<open>ret_address \<equiv> ret_address\<^sub>v\<close>

definition P_0x19850_0 :: state_pred where
  \<open>P_0x19850_0 \<sigma> \<equiv> RIP \<sigma> = 0x19850 \<and> RAX \<sigma> = RAX\<^sub>0 \<and> RBX \<sigma> = RBX\<^sub>0 \<and> RDX \<sigma> = RDX\<^sub>0 \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = RSP\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address\<close>
declare P_0x19850_0_def[Ps]

definition P_0x19850_0_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x19850_0_regions_set \<sigma> \<equiv> {
    (0, 0x2a498, 8),
    (1, RSP\<^sub>0, 8),
    (2, ((RSP\<^sub>0::64 word) - 0x8), 8)
  }\<close>

definition P_0x19850_0_regions :: state_pred where
  \<open>P_0x19850_0_regions \<sigma> \<equiv> \<exists>regions. P_0x19850_0_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x1985b_0 :: state_pred where
  \<open>Q_0x1985b_0 \<sigma> \<equiv> RIP \<sigma> = 0x1985b \<and> RAX \<sigma> = RAX\<^sub>0 \<and> RBX \<sigma> = (\<sigma> \<turnstile> *[0x2a498,8]::64 word) \<and> RDX \<sigma> = RDX\<^sub>0 \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x8) \<and> (\<sigma> \<turnstile> *[0x2a498,8]::64 word) = (\<sigma> \<turnstile> *[0x2a498,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = RBX\<^sub>0\<close>
declare Q_0x1985b_0_def[Qs]

schematic_goal bdrv_info_0_3_0x19850_0x19858_0[blocks]:
  assumes \<open>(P_0x19850_0 && P_0x19850_0_regions) \<sigma>\<close>
  shows \<open>exec_block 3 0x19858 0 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x1985b_0 ?\<sigma> \<and> block_usage P_0x19850_0_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x19850_0_def P_0x19850_0_regions_def post: Q_0x1985b_0_def regionset: P_0x19850_0_regions_set_def)

definition P_0x1985b_true_1 :: state_pred where
  \<open>P_0x1985b_true_1 \<sigma> \<equiv> RIP \<sigma> = 0x1985b \<and> RAX \<sigma> = RAX\<^sub>0 \<and> RBX \<sigma> = (\<sigma> \<turnstile> *[0x2a498,8]::64 word) \<and> RDX \<sigma> = RDX\<^sub>0 \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x8) \<and> (\<sigma> \<turnstile> *[0x2a498,8]::64 word) = (\<sigma> \<turnstile> *[0x2a498,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = RBX\<^sub>0\<close>
declare P_0x1985b_true_1_def[Ps]

definition P_0x1985b_true_1_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x1985b_true_1_regions_set \<sigma> \<equiv> {
    (0, 0x2a498, 8),
    (1, RSP\<^sub>0, 8),
    (2, ((RSP\<^sub>0::64 word) - 0x8), 8)
  }\<close>

definition P_0x1985b_true_1_regions :: state_pred where
  \<open>P_0x1985b_true_1_regions \<sigma> \<equiv> \<exists>regions. P_0x1985b_true_1_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x19930_1 :: state_pred where
  \<open>Q_0x19930_1 \<sigma> \<equiv> RIP \<sigma> = 0x19930 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x8) \<and> (\<sigma> \<turnstile> *[0x2a498,8]::64 word) = (\<sigma> \<turnstile> *[0x2a498,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = RBX\<^sub>0\<close>
declare Q_0x19930_1_def[Qs]

schematic_goal bdrv_info_0_1_0x1985b_0x1985b_1[blocks]:
  assumes \<open>(P_0x1985b_true_1 && P_0x1985b_true_1_regions && !ZF) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x1985b (Suc 0) \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x19930_1 ?\<sigma> \<and> block_usage P_0x1985b_true_1_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x1985b_true_1_def P_0x1985b_true_1_regions_def post: Q_0x19930_1_def regionset: P_0x1985b_true_1_regions_set_def)

definition P_0x19930_2 :: state_pred where
  \<open>P_0x19930_2 \<sigma> \<equiv> RIP \<sigma> = 0x19930 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x8) \<and> (\<sigma> \<turnstile> *[0x2a498,8]::64 word) = (\<sigma> \<turnstile> *[0x2a498,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = RBX\<^sub>0\<close>
declare P_0x19930_2_def[Ps]

definition P_0x19930_2_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x19930_2_regions_set \<sigma> \<equiv> {
    (0, 0x2a498, 8),
    (1, RSP\<^sub>0, 8),
    (2, ((RSP\<^sub>0::64 word) - 0x8), 8)
  }\<close>

definition P_0x19930_2_regions :: state_pred where
  \<open>P_0x19930_2_regions \<sigma> \<equiv> \<exists>regions. P_0x19930_2_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x19940_2 :: state_pred where
  \<open>Q_0x19940_2 \<sigma> \<equiv> RIP \<sigma> = 0x19940 \<and> RAX \<sigma> = 0x0 \<and> RDI \<sigma> = 0x219b7 \<and> RSI \<sigma> = ((RBX \<sigma>::64 word) + 0x898) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x8) \<and> (\<sigma> \<turnstile> *[0x2a498,8]::64 word) = (\<sigma> \<turnstile> *[0x2a498,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = RBX\<^sub>0\<close>
declare Q_0x19940_2_def[Qs]

schematic_goal bdrv_info_0_3_0x19930_0x1993e_2[blocks]:
  assumes \<open>(P_0x19930_2 && P_0x19930_2_regions) \<sigma>\<close>
  shows \<open>exec_block 3 0x1993e 2 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x19940_2 ?\<sigma> \<and> block_usage P_0x19930_2_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x19930_2_def P_0x19930_2_regions_def post: Q_0x19940_2_def regionset: P_0x19930_2_regions_set_def)

definition P_0x19940_3 :: state_pred where
  \<open>P_0x19940_3 \<sigma> \<equiv> RIP \<sigma> = 0x19940 \<and> RAX \<sigma> = 0x0 \<and> RDI \<sigma> = 0x219b7 \<and> RSI \<sigma> = ((RBX \<sigma>::64 word) + 0x898) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x8) \<and> (\<sigma> \<turnstile> *[0x2a498,8]::64 word) = (\<sigma> \<turnstile> *[0x2a498,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = RBX\<^sub>0\<close>
declare P_0x19940_3_def[Ps]

definition P_0x19940_3_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x19940_3_regions_set \<sigma> \<equiv> {
    (0, 0x2a498, 8),
    (1, RSP\<^sub>0, 8),
    (2, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x10), 8)
  }\<close>

definition P_0x19940_3_regions :: state_pred where
  \<open>P_0x19940_3_regions \<sigma> \<equiv> \<exists>regions. P_0x19940_3_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_term_printf_addr_0x19940_3 :: state_pred where
  \<open>Q_term_printf_addr_0x19940_3 \<sigma> \<equiv> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x10) \<and> RIP \<sigma> = term_printf_addr \<and> RAX \<sigma> = 0x0 \<and> RDI \<sigma> = 0x219b7 \<and> RSI \<sigma> = ((RBX \<sigma>::64 word) + 0x898) \<and> (\<sigma> \<turnstile> *[0x2a498,8]::64 word) = (\<sigma> \<turnstile> *[0x2a498,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = 0x19945\<close>
declare Q_term_printf_addr_0x19940_3_def[Qs]

schematic_goal bdrv_info_0_1_0x19940_0x19940_3[blocks]:
  assumes \<open>(P_0x19940_3 && P_0x19940_3_regions) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x19940 3 \<sigma> \<triangleq> ?\<sigma> \<and> Q_term_printf_addr_0x19940_3 ?\<sigma> \<and> block_usage P_0x19940_3_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x19940_3_def P_0x19940_3_regions_def post: Q_term_printf_addr_0x19940_3_def regionset: P_0x19940_3_regions_set_def)

definition P_0x19945_4 :: state_pred where
  \<open>P_0x19945_4 \<sigma> \<equiv> RIP \<sigma> = 0x19945 \<and> RAX \<sigma> = term_printf_0x19940_retval \<and> RDI \<sigma> = 0x219b7 \<and> RSI \<sigma> = ((RBX \<sigma>::64 word) + 0x898) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x8) \<and> (\<sigma> \<turnstile> *[0x2a498,8]::64 word) = (\<sigma> \<turnstile> *[0x2a498,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = 0x19945\<close>
declare P_0x19945_4_def[Ps]

definition P_0x19945_4_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x19945_4_regions_set \<sigma> \<equiv> {
    (0, 0x2a498, 8),
    (1, RSP\<^sub>0, 8),
    (2, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x10), 8)
  }\<close>

definition P_0x19945_4_regions :: state_pred where
  \<open>P_0x19945_4_regions \<sigma> \<equiv> \<exists>regions. P_0x19945_4_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x1994e_4 :: state_pred where
  \<open>Q_0x1994e_4 \<sigma> \<equiv> RIP \<sigma> = 0x1994e \<and> RAX \<sigma> = 0x0 \<and> RDI \<sigma> = 0x219bb \<and> RSI \<sigma> = ((RBX \<sigma>::64 word) + 0x898) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x8) \<and> (\<sigma> \<turnstile> *[0x2a498,8]::64 word) = (\<sigma> \<turnstile> *[0x2a498,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = 0x19945\<close>
declare Q_0x1994e_4_def[Qs]

schematic_goal bdrv_info_0_2_0x19945_0x19947_4[blocks]:
  assumes \<open>(P_0x19945_4 && P_0x19945_4_regions) \<sigma>\<close>
  shows \<open>exec_block 2 0x19947 4 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x1994e_4 ?\<sigma> \<and> block_usage P_0x19945_4_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x19945_4_def P_0x19945_4_regions_def post: Q_0x1994e_4_def regionset: P_0x19945_4_regions_set_def)

definition P_0x1994e_5 :: state_pred where
  \<open>P_0x1994e_5 \<sigma> \<equiv> RIP \<sigma> = 0x1994e \<and> RAX \<sigma> = 0x0 \<and> RDI \<sigma> = 0x219bb \<and> RSI \<sigma> = ((RBX \<sigma>::64 word) + 0x898) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x8) \<and> (\<sigma> \<turnstile> *[0x2a498,8]::64 word) = (\<sigma> \<turnstile> *[0x2a498,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = 0x19945\<close>
declare P_0x1994e_5_def[Ps]

definition P_0x1994e_5_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x1994e_5_regions_set \<sigma> \<equiv> {
    (0, 0x2a498, 8),
    (1, RSP\<^sub>0, 8),
    (2, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x10), 8)
  }\<close>

definition P_0x1994e_5_regions :: state_pred where
  \<open>P_0x1994e_5_regions \<sigma> \<equiv> \<exists>regions. P_0x1994e_5_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_term_printf_addr_0x1994e_5 :: state_pred where
  \<open>Q_term_printf_addr_0x1994e_5 \<sigma> \<equiv> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x10) \<and> RIP \<sigma> = term_printf_addr \<and> RAX \<sigma> = 0x0 \<and> RDI \<sigma> = 0x219bb \<and> RSI \<sigma> = ((RBX \<sigma>::64 word) + 0x898) \<and> (\<sigma> \<turnstile> *[0x2a498,8]::64 word) = (\<sigma> \<turnstile> *[0x2a498,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = 0x19953\<close>
declare Q_term_printf_addr_0x1994e_5_def[Qs]

schematic_goal bdrv_info_0_1_0x1994e_0x1994e_5[blocks]:
  assumes \<open>(P_0x1994e_5 && P_0x1994e_5_regions) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x1994e 5 \<sigma> \<triangleq> ?\<sigma> \<and> Q_term_printf_addr_0x1994e_5 ?\<sigma> \<and> block_usage P_0x1994e_5_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x1994e_5_def P_0x1994e_5_regions_def post: Q_term_printf_addr_0x1994e_5_def regionset: P_0x1994e_5_regions_set_def)

definition P_0x19953_6 :: state_pred where
  \<open>P_0x19953_6 \<sigma> \<equiv> RIP \<sigma> = 0x19953 \<and> RAX \<sigma> = term_printf_0x1994e_retval \<and> RDI \<sigma> = 0x219bb \<and> RSI \<sigma> = ((RBX \<sigma>::64 word) + 0x898) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x8) \<and> (\<sigma> \<turnstile> *[0x2a498,8]::64 word) = (\<sigma> \<turnstile> *[0x2a498,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = 0x19953\<close>
declare P_0x19953_6_def[Ps]

definition P_0x19953_6_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x19953_6_regions_set \<sigma> \<equiv> {
    (0, 0x2a498, 8),
    (1, RSP\<^sub>0, 8),
    (2, ((RBX \<sigma>::64 word) + 0x894), 4),
    (3, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x10), 8)
  }\<close>

definition P_0x19953_6_regions :: state_pred where
  \<open>P_0x19953_6_regions \<sigma> \<equiv> \<exists>regions. P_0x19953_6_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x1995c_6 :: state_pred where
  \<open>Q_0x1995c_6 \<sigma> \<equiv> RIP \<sigma> = 0x1995c \<and> RAX \<sigma> = ucast ((\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x894),4]::32 word)) \<and> RDI \<sigma> = 0x219bb \<and> RSI \<sigma> = ((RBX \<sigma>::64 word) + 0x898) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x8) \<and> (\<sigma> \<turnstile> *[0x2a498,8]::64 word) = (\<sigma> \<turnstile> *[0x2a498,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x894),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x894),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = 0x19953\<close>
declare Q_0x1995c_6_def[Qs]

schematic_goal bdrv_info_0_2_0x19953_0x19959_6[blocks]:
  assumes \<open>(P_0x19953_6 && P_0x19953_6_regions) \<sigma>\<close>
  shows \<open>exec_block 2 0x19959 6 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x1995c_6 ?\<sigma> \<and> block_usage P_0x19953_6_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x19953_6_def P_0x19953_6_regions_def post: Q_0x1995c_6_def regionset: P_0x19953_6_regions_set_def)

definition P_0x1995c_true_7 :: state_pred where
  \<open>P_0x1995c_true_7 \<sigma> \<equiv> RIP \<sigma> = 0x1995c \<and> RAX \<sigma> = ucast ((\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x894),4]::32 word)) \<and> RDI \<sigma> = 0x219bb \<and> RSI \<sigma> = ((RBX \<sigma>::64 word) + 0x898) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x8) \<and> (\<sigma> \<turnstile> *[0x2a498,8]::64 word) = (\<sigma> \<turnstile> *[0x2a498,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x894),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x894),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = 0x19953\<close>
declare P_0x1995c_true_7_def[Ps]

definition P_0x1995c_true_7_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x1995c_true_7_regions_set \<sigma> \<equiv> {
    (0, 0x2a498, 8),
    (1, RSP\<^sub>0, 8),
    (2, ((RBX \<sigma>::64 word) + 0x894), 4),
    (3, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x10), 8)
  }\<close>

definition P_0x1995c_true_7_regions :: state_pred where
  \<open>P_0x1995c_true_7_regions \<sigma> \<equiv> \<exists>regions. P_0x1995c_true_7_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x199d1_7 :: state_pred where
  \<open>Q_0x199d1_7 \<sigma> \<equiv> RIP \<sigma> = 0x199d1 \<and> RAX \<sigma> = 0x0 \<and> RDI \<sigma> = 0x219b1 \<and> RSI \<sigma> = ((RBX \<sigma>::64 word) + 0x898) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x8) \<and> (\<sigma> \<turnstile> *[0x2a498,8]::64 word) = (\<sigma> \<turnstile> *[0x2a498,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x894),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x894),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = 0x19953\<close>
declare Q_0x199d1_7_def[Qs]

schematic_goal bdrv_info_0_3_0x1995c_0x199cf_7[blocks]:
  assumes \<open>(P_0x1995c_true_7 && P_0x1995c_true_7_regions && ZF) \<sigma>\<close>
  shows \<open>exec_block 3 0x199cf 7 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x199d1_7 ?\<sigma> \<and> block_usage P_0x1995c_true_7_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x1995c_true_7_def P_0x1995c_true_7_regions_def post: Q_0x199d1_7_def regionset: P_0x1995c_true_7_regions_set_def)

definition P_0x199d1_8 :: state_pred where
  \<open>P_0x199d1_8 \<sigma> \<equiv> RIP \<sigma> = 0x199d1 \<and> RAX \<sigma> = 0x0 \<and> RDI \<sigma> = 0x219b1 \<and> RSI \<sigma> = ((RBX \<sigma>::64 word) + 0x898) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x8) \<and> (\<sigma> \<turnstile> *[0x2a498,8]::64 word) = (\<sigma> \<turnstile> *[0x2a498,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x894),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x894),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = 0x19953\<close>
declare P_0x199d1_8_def[Ps]

definition P_0x199d1_8_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x199d1_8_regions_set \<sigma> \<equiv> {
    (0, 0x2a498, 8),
    (1, RSP\<^sub>0, 8),
    (2, ((RBX \<sigma>::64 word) + 0x894), 4),
    (3, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x10), 8)
  }\<close>

definition P_0x199d1_8_regions :: state_pred where
  \<open>P_0x199d1_8_regions \<sigma> \<equiv> \<exists>regions. P_0x199d1_8_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_term_printf_addr_0x199d1_8 :: state_pred where
  \<open>Q_term_printf_addr_0x199d1_8 \<sigma> \<equiv> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x10) \<and> RIP \<sigma> = term_printf_addr \<and> RAX \<sigma> = 0x0 \<and> RDI \<sigma> = 0x219b1 \<and> RSI \<sigma> = ((RBX \<sigma>::64 word) + 0x898) \<and> (\<sigma> \<turnstile> *[0x2a498,8]::64 word) = (\<sigma> \<turnstile> *[0x2a498,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x894),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x894),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = 0x199d6\<close>
declare Q_term_printf_addr_0x199d1_8_def[Qs]

schematic_goal bdrv_info_0_1_0x199d1_0x199d1_8[blocks]:
  assumes \<open>(P_0x199d1_8 && P_0x199d1_8_regions) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x199d1 8 \<sigma> \<triangleq> ?\<sigma> \<and> Q_term_printf_addr_0x199d1_8 ?\<sigma> \<and> block_usage P_0x199d1_8_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x199d1_8_def P_0x199d1_8_regions_def post: Q_term_printf_addr_0x199d1_8_def regionset: P_0x199d1_8_regions_set_def)

definition P_0x199d6_9 :: state_pred where
  \<open>P_0x199d6_9 \<sigma> \<equiv> RIP \<sigma> = 0x199d6 \<and> RAX \<sigma> = term_printf_0x199d1_retval \<and> RDI \<sigma> = 0x219b1 \<and> RSI \<sigma> = ((RBX \<sigma>::64 word) + 0x898) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x8) \<and> (\<sigma> \<turnstile> *[0x2a498,8]::64 word) = (\<sigma> \<turnstile> *[0x2a498,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x894),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x894),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = 0x199d6\<close>
declare P_0x199d6_9_def[Ps]

definition P_0x199d6_9_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x199d6_9_regions_set \<sigma> \<equiv> {
    (0, 0x2a498, 8),
    (1, RSP\<^sub>0, 8),
    (2, ((RBX \<sigma>::64 word) + 0x894), 4),
    (3, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x10), 8)
  }\<close>

definition P_0x199d6_9_regions :: state_pred where
  \<open>P_0x199d6_9_regions \<sigma> \<equiv> \<exists>regions. P_0x199d6_9_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x19878_9 :: state_pred where
  \<open>Q_0x19878_9 \<sigma> \<equiv> RIP \<sigma> = 0x19878 \<and> RSI \<sigma> = ((RBX \<sigma>::64 word) + 0x898) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x8) \<and> (\<sigma> \<turnstile> *[0x2a498,8]::64 word) = (\<sigma> \<turnstile> *[0x2a498,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x894),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x894),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = RBX\<^sub>0\<close>
declare Q_0x19878_9_def[Qs]

schematic_goal bdrv_info_0_1_0x199d6_0x199d6_9[blocks]:
  assumes \<open>(P_0x199d6_9 && P_0x199d6_9_regions) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x199d6 9 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x19878_9 ?\<sigma> \<and> block_usage P_0x199d6_9_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x199d6_9_def P_0x199d6_9_regions_def post: Q_0x19878_9_def regionset: P_0x199d6_9_regions_set_def)

definition P_0x1995c_false_10 :: state_pred where
  \<open>P_0x1995c_false_10 \<sigma> \<equiv> RIP \<sigma> = 0x1995c \<and> RAX \<sigma> = ucast ((\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x894),4]::32 word)) \<and> RDI \<sigma> = 0x219bb \<and> RSI \<sigma> = ((RBX \<sigma>::64 word) + 0x898) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x8) \<and> (\<sigma> \<turnstile> *[0x2a498,8]::64 word) = (\<sigma> \<turnstile> *[0x2a498,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x894),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x894),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = 0x19953\<close>
declare P_0x1995c_false_10_def[Ps]

definition P_0x1995c_false_10_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x1995c_false_10_regions_set \<sigma> \<equiv> {
    (0, 0x2a498, 8),
    (1, RSP\<^sub>0, 8),
    (2, ((RBX \<sigma>::64 word) + 0x894), 4),
    (3, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x10), 8)
  }\<close>

definition P_0x1995c_false_10_regions :: state_pred where
  \<open>P_0x1995c_false_10_regions \<sigma> \<equiv> \<exists>regions. P_0x1995c_false_10_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x19961_10 :: state_pred where
  \<open>Q_0x19961_10 \<sigma> \<equiv> RIP \<sigma> = 0x19961 \<and> RAX \<sigma> = ucast ((\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x894),4]::32 word)) \<and> RDI \<sigma> = 0x219bb \<and> RSI \<sigma> = ((RBX \<sigma>::64 word) + 0x898) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x8) \<and> (\<sigma> \<turnstile> *[0x2a498,8]::64 word) = (\<sigma> \<turnstile> *[0x2a498,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x894),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x894),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = 0x19953\<close>
declare Q_0x19961_10_def[Qs]

schematic_goal bdrv_info_0_2_0x1995c_0x1995e_10[blocks]:
  assumes \<open>(P_0x1995c_false_10 && P_0x1995c_false_10_regions && ! ZF) \<sigma>\<close>
  shows \<open>exec_block 2 0x1995e 10 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x19961_10 ?\<sigma> \<and> block_usage P_0x1995c_false_10_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x1995c_false_10_def P_0x1995c_false_10_regions_def post: Q_0x19961_10_def regionset: P_0x1995c_false_10_regions_set_def)

definition P_0x19961_true_11 :: state_pred where
  \<open>P_0x19961_true_11 \<sigma> \<equiv> RIP \<sigma> = 0x19961 \<and> RAX \<sigma> = ucast ((\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x894),4]::32 word)) \<and> RDI \<sigma> = 0x219bb \<and> RSI \<sigma> = ((RBX \<sigma>::64 word) + 0x898) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x8) \<and> (\<sigma> \<turnstile> *[0x2a498,8]::64 word) = (\<sigma> \<turnstile> *[0x2a498,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x894),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x894),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = 0x19953\<close>
declare P_0x19961_true_11_def[Ps]

definition P_0x19961_true_11_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x19961_true_11_regions_set \<sigma> \<equiv> {
    (0, 0x2a498, 8),
    (1, RSP\<^sub>0, 8),
    (2, ((RBX \<sigma>::64 word) + 0x894), 4),
    (3, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x10), 8)
  }\<close>

definition P_0x19961_true_11_regions :: state_pred where
  \<open>P_0x19961_true_11_regions \<sigma> \<equiv> \<exists>regions. P_0x19961_true_11_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x19872_11 :: state_pred where
  \<open>Q_0x19872_11 \<sigma> \<equiv> RIP \<sigma> = 0x19872 \<and> RAX \<sigma> = ucast ((\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x894),4]::32 word)) \<and> RDI \<sigma> = 0x219bb \<and> RSI \<sigma> = ((RBX \<sigma>::64 word) + 0x898) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x8) \<and> (\<sigma> \<turnstile> *[0x2a498,8]::64 word) = (\<sigma> \<turnstile> *[0x2a498,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x894),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x894),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = 0x19953\<close>
declare Q_0x19872_11_def[Qs]

schematic_goal bdrv_info_0_2_0x19961_0x19870_11[blocks]:
  assumes \<open>(P_0x19961_true_11 && P_0x19961_true_11_regions && !ZF) \<sigma>\<close>
  shows \<open>exec_block 2 0x19870 11 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x19872_11 ?\<sigma> \<and> block_usage P_0x19961_true_11_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x19961_true_11_def P_0x19961_true_11_regions_def post: Q_0x19872_11_def regionset: P_0x19961_true_11_regions_set_def)

definition P_0x19872_true_12 :: state_pred where
  \<open>P_0x19872_true_12 \<sigma> \<equiv> RIP \<sigma> = 0x19872 \<and> RAX \<sigma> = ucast ((\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x894),4]::32 word)) \<and> RDI \<sigma> = 0x219bb \<and> RSI \<sigma> = ((RBX \<sigma>::64 word) + 0x898) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x8) \<and> (\<sigma> \<turnstile> *[0x2a498,8]::64 word) = (\<sigma> \<turnstile> *[0x2a498,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x894),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x894),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = 0x19953\<close>
declare P_0x19872_true_12_def[Ps]

definition P_0x19872_true_12_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x19872_true_12_regions_set \<sigma> \<equiv> {
    (0, 0x2a498, 8),
    (1, RSP\<^sub>0, 8),
    (2, ((RBX \<sigma>::64 word) + 0x894), 4),
    (3, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x10), 8)
  }\<close>

definition P_0x19872_true_12_regions :: state_pred where
  \<open>P_0x19872_true_12_regions \<sigma> \<equiv> \<exists>regions. P_0x19872_true_12_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x199b7_12 :: state_pred where
  \<open>Q_0x199b7_12 \<sigma> \<equiv> RIP \<sigma> = 0x199b7 \<and> RAX \<sigma> = ucast ((\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x894),4]::32 word)) \<and> RDI \<sigma> = 0x219c2 \<and> RSI \<sigma> = ((RBX \<sigma>::64 word) + 0x898) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x8) \<and> (\<sigma> \<turnstile> *[0x2a498,8]::64 word) = (\<sigma> \<turnstile> *[0x2a498,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x894),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x894),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = 0x19953\<close>
declare Q_0x199b7_12_def[Qs]

schematic_goal bdrv_info_0_2_0x19872_0x199b0_12[blocks]:
  assumes \<open>(P_0x19872_true_12 && P_0x19872_true_12_regions && ZF) \<sigma>\<close>
  shows \<open>exec_block 2 0x199b0 12 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x199b7_12 ?\<sigma> \<and> block_usage P_0x19872_true_12_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x19872_true_12_def P_0x19872_true_12_regions_def post: Q_0x199b7_12_def regionset: P_0x19872_true_12_regions_set_def)

definition P_0x199b7_13 :: state_pred where
  \<open>P_0x199b7_13 \<sigma> \<equiv> RIP \<sigma> = 0x199b7 \<and> RAX \<sigma> = ucast ((\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x894),4]::32 word)) \<and> RDI \<sigma> = 0x219c2 \<and> RSI \<sigma> = ((RBX \<sigma>::64 word) + 0x898) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x8) \<and> (\<sigma> \<turnstile> *[0x2a498,8]::64 word) = (\<sigma> \<turnstile> *[0x2a498,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x894),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x894),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = 0x19953\<close>
declare P_0x199b7_13_def[Ps]

definition P_0x199b7_13_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x199b7_13_regions_set \<sigma> \<equiv> {
    (0, 0x2a498, 8),
    (1, RSP\<^sub>0, 8),
    (2, ((RBX \<sigma>::64 word) + 0x894), 4),
    (3, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x10), 8)
  }\<close>

definition P_0x199b7_13_regions :: state_pred where
  \<open>P_0x199b7_13_regions \<sigma> \<equiv> \<exists>regions. P_0x199b7_13_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_term_printf_addr_0x199b7_13 :: state_pred where
  \<open>Q_term_printf_addr_0x199b7_13 \<sigma> \<equiv> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x10) \<and> RIP \<sigma> = term_printf_addr \<and> RAX \<sigma> = ucast ((\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x894),4]::32 word)) \<and> RDI \<sigma> = 0x219c2 \<and> RSI \<sigma> = ((RBX \<sigma>::64 word) + 0x898) \<and> (\<sigma> \<turnstile> *[0x2a498,8]::64 word) = (\<sigma> \<turnstile> *[0x2a498,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x894),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x894),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = 0x199bc\<close>
declare Q_term_printf_addr_0x199b7_13_def[Qs]

schematic_goal bdrv_info_0_1_0x199b7_0x199b7_13[blocks]:
  assumes \<open>(P_0x199b7_13 && P_0x199b7_13_regions) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x199b7 13 \<sigma> \<triangleq> ?\<sigma> \<and> Q_term_printf_addr_0x199b7_13 ?\<sigma> \<and> block_usage P_0x199b7_13_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x199b7_13_def P_0x199b7_13_regions_def post: Q_term_printf_addr_0x199b7_13_def regionset: P_0x199b7_13_regions_set_def)

definition P_0x199bc_14 :: state_pred where
  \<open>P_0x199bc_14 \<sigma> \<equiv> RIP \<sigma> = 0x199bc \<and> RAX \<sigma> = term_printf_0x199b7_retval \<and> RDI \<sigma> = 0x219c2 \<and> RSI \<sigma> = ((RBX \<sigma>::64 word) + 0x898) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x8) \<and> (\<sigma> \<turnstile> *[0x2a498,8]::64 word) = (\<sigma> \<turnstile> *[0x2a498,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x894),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x894),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = 0x199bc\<close>
declare P_0x199bc_14_def[Ps]

definition P_0x199bc_14_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x199bc_14_regions_set \<sigma> \<equiv> {
    (0, 0x2a498, 8),
    (1, RSP\<^sub>0, 8),
    (2, ((RBX \<sigma>::64 word) + 0x894), 4),
    (3, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x10), 8)
  }\<close>

definition P_0x199bc_14_regions :: state_pred where
  \<open>P_0x199bc_14_regions \<sigma> \<equiv> \<exists>regions. P_0x199bc_14_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x19878_14 :: state_pred where
  \<open>Q_0x19878_14 \<sigma> \<equiv> RIP \<sigma> = 0x19878 \<and> RSI \<sigma> = ((RBX \<sigma>::64 word) + 0x898) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x8) \<and> (\<sigma> \<turnstile> *[0x2a498,8]::64 word) = (\<sigma> \<turnstile> *[0x2a498,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x894),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x894),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = RBX\<^sub>0\<close>
declare Q_0x19878_14_def[Qs]

schematic_goal bdrv_info_0_1_0x199bc_0x199bc_14[blocks]:
  assumes \<open>(P_0x199bc_14 && P_0x199bc_14_regions) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x199bc 14 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x19878_14 ?\<sigma> \<and> block_usage P_0x199bc_14_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x199bc_14_def P_0x199bc_14_regions_def post: Q_0x19878_14_def regionset: P_0x199bc_14_regions_set_def)

definition P_0x19872_false_15 :: state_pred where
  \<open>P_0x19872_false_15 \<sigma> \<equiv> RIP \<sigma> = 0x19872 \<and> RAX \<sigma> = ucast ((\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x894),4]::32 word)) \<and> RDI \<sigma> = 0x219bb \<and> RSI \<sigma> = ((RBX \<sigma>::64 word) + 0x898) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x8) \<and> (\<sigma> \<turnstile> *[0x2a498,8]::64 word) = (\<sigma> \<turnstile> *[0x2a498,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x894),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x894),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = 0x19953\<close>
declare P_0x19872_false_15_def[Ps]

definition P_0x19872_false_15_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x19872_false_15_regions_set \<sigma> \<equiv> {
    (0, 0x2a498, 8),
    (1, RSP\<^sub>0, 8),
    (2, ((RBX \<sigma>::64 word) + 0x894), 4),
    (3, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x10), 8)
  }\<close>

definition P_0x19872_false_15_regions :: state_pred where
  \<open>P_0x19872_false_15_regions \<sigma> \<equiv> \<exists>regions. P_0x19872_false_15_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x19878_15 :: state_pred where
  \<open>Q_0x19878_15 \<sigma> \<equiv> RIP \<sigma> = 0x19878 \<and> RSI \<sigma> = ((RBX \<sigma>::64 word) + 0x898) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x8) \<and> (\<sigma> \<turnstile> *[0x2a498,8]::64 word) = (\<sigma> \<turnstile> *[0x2a498,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x894),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x894),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = RBX\<^sub>0\<close>
declare Q_0x19878_15_def[Qs]

schematic_goal bdrv_info_0_1_0x19872_0x19872_15[blocks]:
  assumes \<open>(P_0x19872_false_15 && P_0x19872_false_15_regions && ! ZF) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x19872 15 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x19878_15 ?\<sigma> \<and> block_usage P_0x19872_false_15_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x19872_false_15_def P_0x19872_false_15_regions_def post: Q_0x19878_15_def regionset: P_0x19872_false_15_regions_set_def)

definition P_0x19961_false_16 :: state_pred where
  \<open>P_0x19961_false_16 \<sigma> \<equiv> RIP \<sigma> = 0x19961 \<and> RAX \<sigma> = ucast ((\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x894),4]::32 word)) \<and> RDI \<sigma> = 0x219bb \<and> RSI \<sigma> = ((RBX \<sigma>::64 word) + 0x898) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x8) \<and> (\<sigma> \<turnstile> *[0x2a498,8]::64 word) = (\<sigma> \<turnstile> *[0x2a498,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x894),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x894),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = 0x19953\<close>
declare P_0x19961_false_16_def[Ps]

definition P_0x19961_false_16_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x19961_false_16_regions_set \<sigma> \<equiv> {
    (0, 0x2a498, 8),
    (1, RSP\<^sub>0, 8),
    (2, ((RBX \<sigma>::64 word) + 0x894), 4),
    (3, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x10), 8)
  }\<close>

definition P_0x19961_false_16_regions :: state_pred where
  \<open>P_0x19961_false_16_regions \<sigma> \<equiv> \<exists>regions. P_0x19961_false_16_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x19970_16 :: state_pred where
  \<open>Q_0x19970_16 \<sigma> \<equiv> RIP \<sigma> = 0x19970 \<and> RAX \<sigma> = 0x0 \<and> RDI \<sigma> = 0x219c5 \<and> RSI \<sigma> = ((RBX \<sigma>::64 word) + 0x898) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x8) \<and> (\<sigma> \<turnstile> *[0x2a498,8]::64 word) = (\<sigma> \<turnstile> *[0x2a498,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x894),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x894),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = 0x19953\<close>
declare Q_0x19970_16_def[Qs]

schematic_goal bdrv_info_0_3_0x19961_0x1996e_16[blocks]:
  assumes \<open>(P_0x19961_false_16 && P_0x19961_false_16_regions && ! !ZF) \<sigma>\<close>
  shows \<open>exec_block 3 0x1996e 16 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x19970_16 ?\<sigma> \<and> block_usage P_0x19961_false_16_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x19961_false_16_def P_0x19961_false_16_regions_def post: Q_0x19970_16_def regionset: P_0x19961_false_16_regions_set_def)

definition P_0x19970_17 :: state_pred where
  \<open>P_0x19970_17 \<sigma> \<equiv> RIP \<sigma> = 0x19970 \<and> RAX \<sigma> = 0x0 \<and> RDI \<sigma> = 0x219c5 \<and> RSI \<sigma> = ((RBX \<sigma>::64 word) + 0x898) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x8) \<and> (\<sigma> \<turnstile> *[0x2a498,8]::64 word) = (\<sigma> \<turnstile> *[0x2a498,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x894),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x894),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = 0x19953\<close>
declare P_0x19970_17_def[Ps]

definition P_0x19970_17_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x19970_17_regions_set \<sigma> \<equiv> {
    (0, 0x2a498, 8),
    (1, RSP\<^sub>0, 8),
    (2, ((RBX \<sigma>::64 word) + 0x894), 4),
    (3, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x10), 8)
  }\<close>

definition P_0x19970_17_regions :: state_pred where
  \<open>P_0x19970_17_regions \<sigma> \<equiv> \<exists>regions. P_0x19970_17_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_term_printf_addr_0x19970_17 :: state_pred where
  \<open>Q_term_printf_addr_0x19970_17 \<sigma> \<equiv> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x10) \<and> RIP \<sigma> = term_printf_addr \<and> RAX \<sigma> = 0x0 \<and> RDI \<sigma> = 0x219c5 \<and> RSI \<sigma> = ((RBX \<sigma>::64 word) + 0x898) \<and> (\<sigma> \<turnstile> *[0x2a498,8]::64 word) = (\<sigma> \<turnstile> *[0x2a498,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x894),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x894),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = 0x19975\<close>
declare Q_term_printf_addr_0x19970_17_def[Qs]

schematic_goal bdrv_info_0_1_0x19970_0x19970_17[blocks]:
  assumes \<open>(P_0x19970_17 && P_0x19970_17_regions) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x19970 17 \<sigma> \<triangleq> ?\<sigma> \<and> Q_term_printf_addr_0x19970_17 ?\<sigma> \<and> block_usage P_0x19970_17_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x19970_17_def P_0x19970_17_regions_def post: Q_term_printf_addr_0x19970_17_def regionset: P_0x19970_17_regions_set_def)

definition P_0x19975_18 :: state_pred where
  \<open>P_0x19975_18 \<sigma> \<equiv> RIP \<sigma> = 0x19975 \<and> RAX \<sigma> = term_printf_0x19970_retval \<and> RDI \<sigma> = 0x219c5 \<and> RSI \<sigma> = ((RBX \<sigma>::64 word) + 0x898) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x8) \<and> (\<sigma> \<turnstile> *[0x2a498,8]::64 word) = (\<sigma> \<turnstile> *[0x2a498,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x894),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x894),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = 0x19975\<close>
declare P_0x19975_18_def[Ps]

definition P_0x19975_18_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x19975_18_regions_set \<sigma> \<equiv> {
    (0, 0x2a498, 8),
    (1, RSP\<^sub>0, 8),
    (2, ((RBX \<sigma>::64 word) + 0x894), 4),
    (3, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x10), 8)
  }\<close>

definition P_0x19975_18_regions :: state_pred where
  \<open>P_0x19975_18_regions \<sigma> \<equiv> \<exists>regions. P_0x19975_18_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x19878_18 :: state_pred where
  \<open>Q_0x19878_18 \<sigma> \<equiv> RIP \<sigma> = 0x19878 \<and> RSI \<sigma> = ((RBX \<sigma>::64 word) + 0x898) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x8) \<and> (\<sigma> \<turnstile> *[0x2a498,8]::64 word) = (\<sigma> \<turnstile> *[0x2a498,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x894),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x894),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = RBX\<^sub>0\<close>
declare Q_0x19878_18_def[Qs]

schematic_goal bdrv_info_0_1_0x19975_0x19975_18[blocks]:
  assumes \<open>(P_0x19975_18 && P_0x19975_18_regions) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x19975 18 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x19878_18 ?\<sigma> \<and> block_usage P_0x19975_18_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x19975_18_def P_0x19975_18_regions_def post: Q_0x19878_18_def regionset: P_0x19975_18_regions_set_def)

definition P_0x19878_19 :: state_pred where
  \<open>P_0x19878_19 \<sigma> \<equiv> RIP \<sigma> = 0x19878 \<and> RSI \<sigma> = ((RBX \<sigma>::64 word) + 0x898) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x8) \<and> (\<sigma> \<turnstile> *[0x2a498,8]::64 word) = (\<sigma> \<turnstile> *[0x2a498,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x894),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x894),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = RBX\<^sub>0\<close>
declare P_0x19878_19_def[Ps]

definition P_0x19878_19_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x19878_19_regions_set \<sigma> \<equiv> {
    (0, 0x2a498, 8),
    (1, RSP\<^sub>0, 8),
    (2, ((RBX \<sigma>::64 word) + 0xc), 4),
    (3, ((RBX \<sigma>::64 word) + 0x894), 4),
    (4, ((RSP\<^sub>0::64 word) - 0x8), 8)
  }\<close>

definition P_0x19878_19_regions :: state_pred where
  \<open>P_0x19878_19_regions \<sigma> \<equiv> \<exists>regions. P_0x19878_19_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x19884_19 :: state_pred where
  \<open>Q_0x19884_19 \<sigma> \<equiv> RIP \<sigma> = 0x19884 \<and> RAX \<sigma> = 0x0 \<and> RDI \<sigma> = 0x219cc \<and> RSI \<sigma> = ucast ((\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0xc),4]::32 word)) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x8) \<and> (\<sigma> \<turnstile> *[0x2a498,8]::64 word) = (\<sigma> \<turnstile> *[0x2a498,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0xc),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0xc),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x894),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x894),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = RBX\<^sub>0\<close>
declare Q_0x19884_19_def[Qs]

schematic_goal bdrv_info_0_3_0x19878_0x19882_19[blocks]:
  assumes \<open>(P_0x19878_19 && P_0x19878_19_regions) \<sigma>\<close>
  shows \<open>exec_block 3 0x19882 19 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x19884_19 ?\<sigma> \<and> block_usage P_0x19878_19_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x19878_19_def P_0x19878_19_regions_def post: Q_0x19884_19_def regionset: P_0x19878_19_regions_set_def)

definition P_0x19884_20 :: state_pred where
  \<open>P_0x19884_20 \<sigma> \<equiv> RIP \<sigma> = 0x19884 \<and> RAX \<sigma> = 0x0 \<and> RDI \<sigma> = 0x219cc \<and> RSI \<sigma> = ucast ((\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0xc),4]::32 word)) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x8) \<and> (\<sigma> \<turnstile> *[0x2a498,8]::64 word) = (\<sigma> \<turnstile> *[0x2a498,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0xc),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0xc),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x894),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x894),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = RBX\<^sub>0\<close>
declare P_0x19884_20_def[Ps]

definition P_0x19884_20_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x19884_20_regions_set \<sigma> \<equiv> {
    (0, 0x2a498, 8),
    (1, RSP\<^sub>0, 8),
    (2, ((RBX \<sigma>::64 word) + 0xc), 4),
    (3, ((RBX \<sigma>::64 word) + 0x894), 4),
    (4, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x10), 8)
  }\<close>

definition P_0x19884_20_regions :: state_pred where
  \<open>P_0x19884_20_regions \<sigma> \<equiv> \<exists>regions. P_0x19884_20_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_term_printf_addr_0x19884_20 :: state_pred where
  \<open>Q_term_printf_addr_0x19884_20 \<sigma> \<equiv> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x10) \<and> RIP \<sigma> = term_printf_addr \<and> RAX \<sigma> = 0x0 \<and> RDI \<sigma> = 0x219cc \<and> RSI \<sigma> = ucast ((\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0xc),4]::32 word)) \<and> (\<sigma> \<turnstile> *[0x2a498,8]::64 word) = (\<sigma> \<turnstile> *[0x2a498,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0xc),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0xc),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x894),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x894),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = 0x19889\<close>
declare Q_term_printf_addr_0x19884_20_def[Qs]

schematic_goal bdrv_info_0_1_0x19884_0x19884_20[blocks]:
  assumes \<open>(P_0x19884_20 && P_0x19884_20_regions) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x19884 20 \<sigma> \<triangleq> ?\<sigma> \<and> Q_term_printf_addr_0x19884_20 ?\<sigma> \<and> block_usage P_0x19884_20_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x19884_20_def P_0x19884_20_regions_def post: Q_term_printf_addr_0x19884_20_def regionset: P_0x19884_20_regions_set_def)

definition P_0x19889_21 :: state_pred where
  \<open>P_0x19889_21 \<sigma> \<equiv> RIP \<sigma> = 0x19889 \<and> RAX \<sigma> = term_printf_0x19884_retval \<and> RDI \<sigma> = 0x219cc \<and> RSI \<sigma> = ucast ((\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0xc),4]::32 word)) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x8) \<and> (\<sigma> \<turnstile> *[0x2a498,8]::64 word) = (\<sigma> \<turnstile> *[0x2a498,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0xc),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0xc),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x894),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x894),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = 0x19889\<close>
declare P_0x19889_21_def[Ps]

definition P_0x19889_21_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x19889_21_regions_set \<sigma> \<equiv> {
    (0, 0x2a498, 8),
    (1, RSP\<^sub>0, 8),
    (2, ((RBX \<sigma>::64 word) + 0xc), 4),
    (3, ((RBX \<sigma>::64 word) + 0x894), 4),
    (4, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x10), 8)
  }\<close>

definition P_0x19889_21_regions :: state_pred where
  \<open>P_0x19889_21_regions \<sigma> \<equiv> \<exists>regions. P_0x19889_21_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x1988e_21 :: state_pred where
  \<open>Q_0x1988e_21 \<sigma> \<equiv> RIP \<sigma> = 0x1988e \<and> RAX \<sigma> = term_printf_0x19884_retval \<and> RDX \<sigma> = ucast ((\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0xc),4]::32 word)) \<and> RDI \<sigma> = 0x219cc \<and> RSI \<sigma> = ucast ((\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0xc),4]::32 word)) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x8) \<and> (\<sigma> \<turnstile> *[0x2a498,8]::64 word) = (\<sigma> \<turnstile> *[0x2a498,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0xc),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0xc),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x894),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x894),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = 0x19889\<close>
declare Q_0x1988e_21_def[Qs]

schematic_goal bdrv_info_0_2_0x19889_0x1988c_21[blocks]:
  assumes \<open>(P_0x19889_21 && P_0x19889_21_regions) \<sigma>\<close>
  shows \<open>exec_block 2 0x1988c 21 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x1988e_21 ?\<sigma> \<and> block_usage P_0x19889_21_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x19889_21_def P_0x19889_21_regions_def post: Q_0x1988e_21_def regionset: P_0x19889_21_regions_set_def)

definition P_0x1988e_true_22 :: state_pred where
  \<open>P_0x1988e_true_22 \<sigma> \<equiv> RIP \<sigma> = 0x1988e \<and> RAX \<sigma> = term_printf_0x19884_retval \<and> RDX \<sigma> = ucast ((\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0xc),4]::32 word)) \<and> RDI \<sigma> = 0x219cc \<and> RSI \<sigma> = ucast ((\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0xc),4]::32 word)) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x8) \<and> (\<sigma> \<turnstile> *[0x2a498,8]::64 word) = (\<sigma> \<turnstile> *[0x2a498,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0xc),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0xc),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x894),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x894),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = 0x19889\<close>
declare P_0x1988e_true_22_def[Ps]

definition P_0x1988e_true_22_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x1988e_true_22_regions_set \<sigma> \<equiv> {
    (0, 0x2a498, 8),
    (1, RSP\<^sub>0, 8),
    (2, ((RBX \<sigma>::64 word) + 0xc), 4),
    (3, ((RBX \<sigma>::64 word) + 0x10), 4),
    (4, ((RBX \<sigma>::64 word) + 0x894), 4),
    (5, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x10), 8)
  }\<close>

definition P_0x1988e_true_22_regions :: state_pred where
  \<open>P_0x1988e_true_22_regions \<sigma> \<equiv> \<exists>regions. P_0x1988e_true_22_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x1998c_22 :: state_pred where
  \<open>Q_0x1998c_22 \<sigma> \<equiv> RIP \<sigma> = 0x1998c \<and> RAX \<sigma> = 0x0 \<and> RDX \<sigma> = ucast ((\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0xc),4]::32 word)) \<and> RDI \<sigma> = 0x219da \<and> RSI \<sigma> = ucast ((\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x10),4]::32 word)) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x8) \<and> (\<sigma> \<turnstile> *[0x2a498,8]::64 word) = (\<sigma> \<turnstile> *[0x2a498,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0xc),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0xc),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x10),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x10),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x894),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x894),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = 0x19889\<close>
declare Q_0x1998c_22_def[Qs]

schematic_goal bdrv_info_0_4_0x1988e_0x19985_22[blocks]:
  assumes \<open>(P_0x1988e_true_22 && P_0x1988e_true_22_regions && !ZF) \<sigma>\<close>
  shows \<open>exec_block 4 0x19985 22 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x1998c_22 ?\<sigma> \<and> block_usage P_0x1988e_true_22_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x1988e_true_22_def P_0x1988e_true_22_regions_def post: Q_0x1998c_22_def regionset: P_0x1988e_true_22_regions_set_def)

definition P_0x1998c_23 :: state_pred where
  \<open>P_0x1998c_23 \<sigma> \<equiv> RIP \<sigma> = 0x1998c \<and> RAX \<sigma> = 0x0 \<and> RDX \<sigma> = ucast ((\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0xc),4]::32 word)) \<and> RDI \<sigma> = 0x219da \<and> RSI \<sigma> = ucast ((\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x10),4]::32 word)) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x8) \<and> (\<sigma> \<turnstile> *[0x2a498,8]::64 word) = (\<sigma> \<turnstile> *[0x2a498,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0xc),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0xc),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x10),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x10),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x894),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x894),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = 0x19889\<close>
declare P_0x1998c_23_def[Ps]

definition P_0x1998c_23_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x1998c_23_regions_set \<sigma> \<equiv> {
    (0, 0x2a498, 8),
    (1, RSP\<^sub>0, 8),
    (2, ((RBX \<sigma>::64 word) + 0xc), 4),
    (3, ((RBX \<sigma>::64 word) + 0x10), 4),
    (4, ((RBX \<sigma>::64 word) + 0x894), 4),
    (5, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x10), 8)
  }\<close>

definition P_0x1998c_23_regions :: state_pred where
  \<open>P_0x1998c_23_regions \<sigma> \<equiv> \<exists>regions. P_0x1998c_23_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_term_printf_addr_0x1998c_23 :: state_pred where
  \<open>Q_term_printf_addr_0x1998c_23 \<sigma> \<equiv> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x10) \<and> RIP \<sigma> = term_printf_addr \<and> RAX \<sigma> = 0x0 \<and> RDX \<sigma> = ucast ((\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0xc),4]::32 word)) \<and> RDI \<sigma> = 0x219da \<and> RSI \<sigma> = ucast ((\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x10),4]::32 word)) \<and> (\<sigma> \<turnstile> *[0x2a498,8]::64 word) = (\<sigma> \<turnstile> *[0x2a498,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0xc),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0xc),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x10),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x10),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x894),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x894),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = 0x19991\<close>
declare Q_term_printf_addr_0x1998c_23_def[Qs]

schematic_goal bdrv_info_0_1_0x1998c_0x1998c_23[blocks]:
  assumes \<open>(P_0x1998c_23 && P_0x1998c_23_regions) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x1998c 23 \<sigma> \<triangleq> ?\<sigma> \<and> Q_term_printf_addr_0x1998c_23 ?\<sigma> \<and> block_usage P_0x1998c_23_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x1998c_23_def P_0x1998c_23_regions_def post: Q_term_printf_addr_0x1998c_23_def regionset: P_0x1998c_23_regions_set_def)

definition P_0x19991_24 :: state_pred where
  \<open>P_0x19991_24 \<sigma> \<equiv> RIP \<sigma> = 0x19991 \<and> RAX \<sigma> = term_printf_0x1998c_retval \<and> RDX \<sigma> = ucast ((\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0xc),4]::32 word)) \<and> RDI \<sigma> = 0x219da \<and> RSI \<sigma> = ucast ((\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x10),4]::32 word)) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x8) \<and> (\<sigma> \<turnstile> *[0x2a498,8]::64 word) = (\<sigma> \<turnstile> *[0x2a498,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0xc),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0xc),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x10),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x10),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x894),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x894),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = 0x19991\<close>
declare P_0x19991_24_def[Ps]

definition P_0x19991_24_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x19991_24_regions_set \<sigma> \<equiv> {
    (0, 0x2a498, 8),
    (1, RSP\<^sub>0, 8),
    (2, ((RBX \<sigma>::64 word) + 0xc), 4),
    (3, ((RBX \<sigma>::64 word) + 0x10), 4),
    (4, ((RBX \<sigma>::64 word) + 0x38), 8),
    (5, ((RBX \<sigma>::64 word) + 0x894), 4),
    (6, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x10), 8)
  }\<close>

definition P_0x19991_24_regions :: state_pred where
  \<open>P_0x19991_24_regions \<sigma> \<equiv> \<exists>regions. P_0x19991_24_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x19996_24 :: state_pred where
  \<open>Q_0x19996_24 \<sigma> \<equiv> RIP \<sigma> = 0x19996 \<and> RAX \<sigma> = term_printf_0x1998c_retval \<and> RDX \<sigma> = ucast ((\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0xc),4]::32 word)) \<and> RDI \<sigma> = 0x219da \<and> RSI \<sigma> = ucast ((\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x10),4]::32 word)) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x8) \<and> (\<sigma> \<turnstile> *[0x2a498,8]::64 word) = (\<sigma> \<turnstile> *[0x2a498,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0xc),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0xc),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x10),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x10),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x38),8]::64 word) = (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x38),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x894),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x894),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = 0x19991\<close>
declare Q_0x19996_24_def[Qs]

schematic_goal bdrv_info_0_1_0x19991_0x19991_24[blocks]:
  assumes \<open>(P_0x19991_24 && P_0x19991_24_regions) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x19991 24 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x19996_24 ?\<sigma> \<and> block_usage P_0x19991_24_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x19991_24_def P_0x19991_24_regions_def post: Q_0x19996_24_def regionset: P_0x19991_24_regions_set_def)

definition P_0x19996_true_25 :: state_pred where
  \<open>P_0x19996_true_25 \<sigma> \<equiv> RIP \<sigma> = 0x19996 \<and> RAX \<sigma> = term_printf_0x1998c_retval \<and> RDX \<sigma> = ucast ((\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0xc),4]::32 word)) \<and> RDI \<sigma> = 0x219da \<and> RSI \<sigma> = ucast ((\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x10),4]::32 word)) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x8) \<and> (\<sigma> \<turnstile> *[0x2a498,8]::64 word) = (\<sigma> \<turnstile> *[0x2a498,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0xc),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0xc),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x10),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x10),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x38),8]::64 word) = (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x38),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x894),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x894),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = 0x19991\<close>
declare P_0x19996_true_25_def[Ps]

definition P_0x19996_true_25_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x19996_true_25_regions_set \<sigma> \<equiv> {
    (0, 0x2a498, 8),
    (1, RSP\<^sub>0, 8),
    (2, ((RBX \<sigma>::64 word) + 0xc), 4),
    (3, ((RBX \<sigma>::64 word) + 0x10), 4),
    (4, ((RBX \<sigma>::64 word) + 0x38), 8),
    (5, ((RBX \<sigma>::64 word) + 0x894), 4),
    (6, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x10), 8)
  }\<close>

definition P_0x19996_true_25_regions :: state_pred where
  \<open>P_0x19996_true_25_regions \<sigma> \<equiv> \<exists>regions. P_0x19996_true_25_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x198a8_25 :: state_pred where
  \<open>Q_0x198a8_25 \<sigma> \<equiv> RIP \<sigma> = 0x198a8 \<and> RAX \<sigma> = 0x0 \<and> RDX \<sigma> = ucast ((\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0xc),4]::32 word)) \<and> RDI \<sigma> = 0x219e5 \<and> RSI \<sigma> = ucast ((\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x10),4]::32 word)) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x8) \<and> (\<sigma> \<turnstile> *[0x2a498,8]::64 word) = (\<sigma> \<turnstile> *[0x2a498,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0xc),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0xc),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x10),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x10),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x38),8]::64 word) = (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x38),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x894),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x894),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = 0x19991\<close>
declare Q_0x198a8_25_def[Qs]

schematic_goal bdrv_info_0_3_0x19996_0x198a1_25[blocks]:
  assumes \<open>(P_0x19996_true_25 && P_0x19996_true_25_regions && !ZF) \<sigma>\<close>
  shows \<open>exec_block 3 0x198a1 25 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x198a8_25 ?\<sigma> \<and> block_usage P_0x19996_true_25_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x19996_true_25_def P_0x19996_true_25_regions_def post: Q_0x198a8_25_def regionset: P_0x19996_true_25_regions_set_def)

definition P_0x198a8_26 :: state_pred where
  \<open>P_0x198a8_26 \<sigma> \<equiv> RIP \<sigma> = 0x198a8 \<and> RAX \<sigma> = 0x0 \<and> RDX \<sigma> = ucast ((\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0xc),4]::32 word)) \<and> RDI \<sigma> = 0x219e5 \<and> RSI \<sigma> = ucast ((\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x10),4]::32 word)) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x8) \<and> (\<sigma> \<turnstile> *[0x2a498,8]::64 word) = (\<sigma> \<turnstile> *[0x2a498,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0xc),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0xc),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x10),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x10),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x38),8]::64 word) = (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x38),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x894),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x894),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = 0x19991\<close>
declare P_0x198a8_26_def[Ps]

definition P_0x198a8_26_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x198a8_26_regions_set \<sigma> \<equiv> {
    (0, 0x2a498, 8),
    (1, RSP\<^sub>0, 8),
    (2, ((RBX \<sigma>::64 word) + 0xc), 4),
    (3, ((RBX \<sigma>::64 word) + 0x10), 4),
    (4, ((RBX \<sigma>::64 word) + 0x38), 8),
    (5, ((RBX \<sigma>::64 word) + 0x894), 4),
    (6, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x10), 8)
  }\<close>

definition P_0x198a8_26_regions :: state_pred where
  \<open>P_0x198a8_26_regions \<sigma> \<equiv> \<exists>regions. P_0x198a8_26_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_term_printf_addr_0x198a8_26 :: state_pred where
  \<open>Q_term_printf_addr_0x198a8_26 \<sigma> \<equiv> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x10) \<and> RIP \<sigma> = term_printf_addr \<and> RAX \<sigma> = 0x0 \<and> RDX \<sigma> = ucast ((\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0xc),4]::32 word)) \<and> RDI \<sigma> = 0x219e5 \<and> RSI \<sigma> = ucast ((\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x10),4]::32 word)) \<and> (\<sigma> \<turnstile> *[0x2a498,8]::64 word) = (\<sigma> \<turnstile> *[0x2a498,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0xc),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0xc),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x10),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x10),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x38),8]::64 word) = (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x38),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x894),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x894),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = 0x198ad\<close>
declare Q_term_printf_addr_0x198a8_26_def[Qs]

schematic_goal bdrv_info_0_1_0x198a8_0x198a8_26[blocks]:
  assumes \<open>(P_0x198a8_26 && P_0x198a8_26_regions) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x198a8 26 \<sigma> \<triangleq> ?\<sigma> \<and> Q_term_printf_addr_0x198a8_26 ?\<sigma> \<and> block_usage P_0x198a8_26_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x198a8_26_def P_0x198a8_26_regions_def post: Q_term_printf_addr_0x198a8_26_def regionset: P_0x198a8_26_regions_set_def)

definition P_0x198ad_27 :: state_pred where
  \<open>P_0x198ad_27 \<sigma> \<equiv> RIP \<sigma> = 0x198ad \<and> RAX \<sigma> = term_printf_0x198a8_retval \<and> RDX \<sigma> = ucast ((\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0xc),4]::32 word)) \<and> RDI \<sigma> = 0x219e5 \<and> RSI \<sigma> = ucast ((\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x10),4]::32 word)) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x8) \<and> (\<sigma> \<turnstile> *[0x2a498,8]::64 word) = (\<sigma> \<turnstile> *[0x2a498,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0xc),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0xc),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x10),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x10),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x38),8]::64 word) = (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x38),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x894),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x894),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = 0x198ad\<close>
declare P_0x198ad_27_def[Ps]

definition P_0x198ad_27_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x198ad_27_regions_set \<sigma> \<equiv> {
    (0, 0x2a498, 8),
    (1, RSP\<^sub>0, 8),
    (2, ((RBX \<sigma>::64 word) + 0xc), 4),
    (3, ((RBX \<sigma>::64 word) + 0x10), 4),
    (4, ((RBX \<sigma>::64 word) + 0x38), 8),
    (5, ((RBX \<sigma>::64 word) + 0x894), 4),
    (6, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x10), 8)
  }\<close>

definition P_0x198ad_27_regions :: state_pred where
  \<open>P_0x198ad_27_regions \<sigma> \<equiv> \<exists>regions. P_0x198ad_27_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x198b1_27 :: state_pred where
  \<open>Q_0x198b1_27 \<sigma> \<equiv> RIP \<sigma> = 0x198b1 \<and> RAX \<sigma> = term_printf_0x198a8_retval \<and> RDX \<sigma> = ucast ((\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0xc),4]::32 word)) \<and> RDI \<sigma> = ((RBX \<sigma>::64 word) + 0x48) \<and> RSI \<sigma> = ucast ((\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x10),4]::32 word)) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x8) \<and> (\<sigma> \<turnstile> *[0x2a498,8]::64 word) = (\<sigma> \<turnstile> *[0x2a498,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0xc),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0xc),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x10),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x10),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x38),8]::64 word) = (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x38),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x894),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x894),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = 0x198ad\<close>
declare Q_0x198b1_27_def[Qs]

schematic_goal bdrv_info_0_1_0x198ad_0x198ad_27[blocks]:
  assumes \<open>(P_0x198ad_27 && P_0x198ad_27_regions) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x198ad 27 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x198b1_27 ?\<sigma> \<and> block_usage P_0x198ad_27_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x198ad_27_def P_0x198ad_27_regions_def post: Q_0x198b1_27_def regionset: P_0x198ad_27_regions_set_def)

definition P_0x198b1_28 :: state_pred where
  \<open>P_0x198b1_28 \<sigma> \<equiv> RIP \<sigma> = 0x198b1 \<and> RAX \<sigma> = term_printf_0x198a8_retval \<and> RDX \<sigma> = ucast ((\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0xc),4]::32 word)) \<and> RDI \<sigma> = ((RBX \<sigma>::64 word) + 0x48) \<and> RSI \<sigma> = ucast ((\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x10),4]::32 word)) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x8) \<and> (\<sigma> \<turnstile> *[0x2a498,8]::64 word) = (\<sigma> \<turnstile> *[0x2a498,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0xc),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0xc),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x10),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x10),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x38),8]::64 word) = (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x38),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x894),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x894),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = 0x198ad\<close>
declare P_0x198b1_28_def[Ps]

definition P_0x198b1_28_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x198b1_28_regions_set \<sigma> \<equiv> {
    (0, 0x2a498, 8),
    (1, RSP\<^sub>0, 8),
    (2, ((RBX \<sigma>::64 word) + 0xc), 4),
    (3, ((RBX \<sigma>::64 word) + 0x10), 4),
    (4, ((RBX \<sigma>::64 word) + 0x38), 8),
    (5, ((RBX \<sigma>::64 word) + 0x894), 4),
    (6, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x10), 8)
  }\<close>

definition P_0x198b1_28_regions :: state_pred where
  \<open>P_0x198b1_28_regions \<sigma> \<equiv> \<exists>regions. P_0x198b1_28_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_term_print_filename_addr_0x198b1_28 :: state_pred where
  \<open>Q_term_print_filename_addr_0x198b1_28 \<sigma> \<equiv> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x10) \<and> RIP \<sigma> = term_print_filename_addr \<and> RAX \<sigma> = term_printf_0x198a8_retval \<and> RDX \<sigma> = ucast ((\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0xc),4]::32 word)) \<and> RDI \<sigma> = ((RBX \<sigma>::64 word) + 0x48) \<and> RSI \<sigma> = ucast ((\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x10),4]::32 word)) \<and> (\<sigma> \<turnstile> *[0x2a498,8]::64 word) = (\<sigma> \<turnstile> *[0x2a498,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0xc),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0xc),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x10),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x10),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x38),8]::64 word) = (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x38),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x894),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x894),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = 0x198b6\<close>
declare Q_term_print_filename_addr_0x198b1_28_def[Qs]

schematic_goal bdrv_info_0_1_0x198b1_0x198b1_28[blocks]:
  assumes \<open>(P_0x198b1_28 && P_0x198b1_28_regions) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x198b1 28 \<sigma> \<triangleq> ?\<sigma> \<and> Q_term_print_filename_addr_0x198b1_28 ?\<sigma> \<and> block_usage P_0x198b1_28_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x198b1_28_def P_0x198b1_28_regions_def post: Q_term_print_filename_addr_0x198b1_28_def regionset: P_0x198b1_28_regions_set_def)

definition P_0x198b6_29 :: state_pred where
  \<open>P_0x198b6_29 \<sigma> \<equiv> RIP \<sigma> = 0x198b6 \<and> RAX \<sigma> = term_print_filename_0x198b1_retval \<and> RDX \<sigma> = ucast ((\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0xc),4]::32 word)) \<and> RDI \<sigma> = ((RBX \<sigma>::64 word) + 0x48) \<and> RSI \<sigma> = ucast ((\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x10),4]::32 word)) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x8) \<and> (\<sigma> \<turnstile> *[0x2a498,8]::64 word) = (\<sigma> \<turnstile> *[0x2a498,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0xc),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0xc),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x10),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x10),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x38),8]::64 word) = (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x38),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x894),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x894),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = 0x198b6\<close>
declare P_0x198b6_29_def[Ps]

definition P_0x198b6_29_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x198b6_29_regions_set \<sigma> \<equiv> {
    (0, 0x2a498, 8),
    (1, RSP\<^sub>0, 8),
    (2, ((RBX \<sigma>::64 word) + 0xc), 4),
    (3, ((RBX \<sigma>::64 word) + 0x10), 4),
    (4, ((RBX \<sigma>::64 word) + 0x38), 8),
    (5, ((RBX \<sigma>::64 word) + 0x448), Suc 0),
    (6, ((RBX \<sigma>::64 word) + 0x894), 4),
    (7, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x10), 8)
  }\<close>

definition P_0x198b6_29_regions :: state_pred where
  \<open>P_0x198b6_29_regions \<sigma> \<equiv> \<exists>regions. P_0x198b6_29_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x198bd_29 :: state_pred where
  \<open>Q_0x198bd_29 \<sigma> \<equiv> RIP \<sigma> = 0x198bd \<and> RAX \<sigma> = term_print_filename_0x198b1_retval \<and> RDX \<sigma> = ucast ((\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0xc),4]::32 word)) \<and> RDI \<sigma> = ((RBX \<sigma>::64 word) + 0x48) \<and> RSI \<sigma> = ucast ((\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x10),4]::32 word)) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x8) \<and> (\<sigma> \<turnstile> *[0x2a498,8]::64 word) = (\<sigma> \<turnstile> *[0x2a498,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0xc),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0xc),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x10),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x10),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x38),8]::64 word) = (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x38),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x448),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x448),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x894),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x894),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = 0x198b6\<close>
declare Q_0x198bd_29_def[Qs]

schematic_goal bdrv_info_0_1_0x198b6_0x198b6_29[blocks]:
  assumes \<open>(P_0x198b6_29 && P_0x198b6_29_regions) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x198b6 29 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x198bd_29 ?\<sigma> \<and> block_usage P_0x198b6_29_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x198b6_29_def P_0x198b6_29_regions_def post: Q_0x198bd_29_def regionset: P_0x198b6_29_regions_set_def)

definition P_0x198bd_true_30 :: state_pred where
  \<open>P_0x198bd_true_30 \<sigma> \<equiv> RIP \<sigma> = 0x198bd \<and> RAX \<sigma> = term_print_filename_0x198b1_retval \<and> RDX \<sigma> = ucast ((\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0xc),4]::32 word)) \<and> RDI \<sigma> = ((RBX \<sigma>::64 word) + 0x48) \<and> RSI \<sigma> = ucast ((\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x10),4]::32 word)) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x8) \<and> (\<sigma> \<turnstile> *[0x2a498,8]::64 word) = (\<sigma> \<turnstile> *[0x2a498,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0xc),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0xc),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x10),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x10),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x38),8]::64 word) = (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x38),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x448),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x448),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x894),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x894),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = 0x198b6\<close>
declare P_0x198bd_true_30_def[Ps]

definition P_0x198bd_true_30_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x198bd_true_30_regions_set \<sigma> \<equiv> {
    (0, 0x2a498, 8),
    (1, RSP\<^sub>0, 8),
    (2, ((RBX \<sigma>::64 word) + 0xc), 4),
    (3, ((RBX \<sigma>::64 word) + 0x10), 4),
    (4, ((RBX \<sigma>::64 word) + 0x38), 8),
    (5, ((RBX \<sigma>::64 word) + 0x448), Suc 0),
    (6, ((RBX \<sigma>::64 word) + 0x894), 4),
    (7, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x10), 8)
  }\<close>

definition P_0x198bd_true_30_regions :: state_pred where
  \<open>P_0x198bd_true_30_regions \<sigma> \<equiv> \<exists>regions. P_0x198bd_true_30_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x199e9_30 :: state_pred where
  \<open>Q_0x199e9_30 \<sigma> \<equiv> RIP \<sigma> = 0x199e9 \<and> RAX \<sigma> = 0x0 \<and> RDX \<sigma> = ucast ((\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0xc),4]::32 word)) \<and> RDI \<sigma> = 0x219ec \<and> RSI \<sigma> = ucast ((\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x10),4]::32 word)) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x8) \<and> (\<sigma> \<turnstile> *[0x2a498,8]::64 word) = (\<sigma> \<turnstile> *[0x2a498,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0xc),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0xc),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x10),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x10),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x38),8]::64 word) = (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x38),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x448),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x448),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x894),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x894),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = 0x198b6\<close>
declare Q_0x199e9_30_def[Qs]

schematic_goal bdrv_info_0_3_0x198bd_0x199e7_30[blocks]:
  assumes \<open>(P_0x198bd_true_30 && P_0x198bd_true_30_regions && !ZF) \<sigma>\<close>
  shows \<open>exec_block 3 0x199e7 30 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x199e9_30 ?\<sigma> \<and> block_usage P_0x198bd_true_30_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x198bd_true_30_def P_0x198bd_true_30_regions_def post: Q_0x199e9_30_def regionset: P_0x198bd_true_30_regions_set_def)

definition P_0x199e9_31 :: state_pred where
  \<open>P_0x199e9_31 \<sigma> \<equiv> RIP \<sigma> = 0x199e9 \<and> RAX \<sigma> = 0x0 \<and> RDX \<sigma> = ucast ((\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0xc),4]::32 word)) \<and> RDI \<sigma> = 0x219ec \<and> RSI \<sigma> = ucast ((\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x10),4]::32 word)) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x8) \<and> (\<sigma> \<turnstile> *[0x2a498,8]::64 word) = (\<sigma> \<turnstile> *[0x2a498,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0xc),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0xc),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x10),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x10),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x38),8]::64 word) = (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x38),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x448),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x448),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x894),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x894),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = 0x198b6\<close>
declare P_0x199e9_31_def[Ps]

definition P_0x199e9_31_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x199e9_31_regions_set \<sigma> \<equiv> {
    (0, 0x2a498, 8),
    (1, RSP\<^sub>0, 8),
    (2, ((RBX \<sigma>::64 word) + 0xc), 4),
    (3, ((RBX \<sigma>::64 word) + 0x10), 4),
    (4, ((RBX \<sigma>::64 word) + 0x38), 8),
    (5, ((RBX \<sigma>::64 word) + 0x448), Suc 0),
    (6, ((RBX \<sigma>::64 word) + 0x894), 4),
    (7, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x10), 8)
  }\<close>

definition P_0x199e9_31_regions :: state_pred where
  \<open>P_0x199e9_31_regions \<sigma> \<equiv> \<exists>regions. P_0x199e9_31_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_term_printf_addr_0x199e9_31 :: state_pred where
  \<open>Q_term_printf_addr_0x199e9_31 \<sigma> \<equiv> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x10) \<and> RIP \<sigma> = term_printf_addr \<and> RAX \<sigma> = 0x0 \<and> RDX \<sigma> = ucast ((\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0xc),4]::32 word)) \<and> RDI \<sigma> = 0x219ec \<and> RSI \<sigma> = ucast ((\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x10),4]::32 word)) \<and> (\<sigma> \<turnstile> *[0x2a498,8]::64 word) = (\<sigma> \<turnstile> *[0x2a498,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0xc),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0xc),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x10),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x10),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x38),8]::64 word) = (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x38),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x448),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x448),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x894),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x894),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = 0x199ee\<close>
declare Q_term_printf_addr_0x199e9_31_def[Qs]

schematic_goal bdrv_info_0_1_0x199e9_0x199e9_31[blocks]:
  assumes \<open>(P_0x199e9_31 && P_0x199e9_31_regions) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x199e9 31 \<sigma> \<triangleq> ?\<sigma> \<and> Q_term_printf_addr_0x199e9_31 ?\<sigma> \<and> block_usage P_0x199e9_31_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x199e9_31_def P_0x199e9_31_regions_def post: Q_term_printf_addr_0x199e9_31_def regionset: P_0x199e9_31_regions_set_def)

definition P_0x199ee_32 :: state_pred where
  \<open>P_0x199ee_32 \<sigma> \<equiv> RIP \<sigma> = 0x199ee \<and> RAX \<sigma> = term_printf_0x199e9_retval \<and> RDX \<sigma> = ucast ((\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0xc),4]::32 word)) \<and> RDI \<sigma> = 0x219ec \<and> RSI \<sigma> = ucast ((\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x10),4]::32 word)) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x8) \<and> (\<sigma> \<turnstile> *[0x2a498,8]::64 word) = (\<sigma> \<turnstile> *[0x2a498,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0xc),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0xc),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x10),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x10),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x38),8]::64 word) = (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x38),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x448),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x448),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x894),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x894),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = 0x199ee\<close>
declare P_0x199ee_32_def[Ps]

definition P_0x199ee_32_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x199ee_32_regions_set \<sigma> \<equiv> {
    (0, 0x2a498, 8),
    (1, RSP\<^sub>0, 8),
    (2, ((RBX \<sigma>::64 word) + 0xc), 4),
    (3, ((RBX \<sigma>::64 word) + 0x10), 4),
    (4, ((RBX \<sigma>::64 word) + 0x38), 8),
    (5, ((RBX \<sigma>::64 word) + 0x448), Suc 0),
    (6, ((RBX \<sigma>::64 word) + 0x894), 4),
    (7, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x10), 8)
  }\<close>

definition P_0x199ee_32_regions :: state_pred where
  \<open>P_0x199ee_32_regions \<sigma> \<equiv> \<exists>regions. P_0x199ee_32_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x199f5_32 :: state_pred where
  \<open>Q_0x199f5_32 \<sigma> \<equiv> RIP \<sigma> = 0x199f5 \<and> RAX \<sigma> = term_printf_0x199e9_retval \<and> RDX \<sigma> = ucast ((\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0xc),4]::32 word)) \<and> RDI \<sigma> = ((RBX \<sigma>::64 word) + 0x448) \<and> RSI \<sigma> = ucast ((\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x10),4]::32 word)) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x8) \<and> (\<sigma> \<turnstile> *[0x2a498,8]::64 word) = (\<sigma> \<turnstile> *[0x2a498,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0xc),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0xc),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x10),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x10),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x38),8]::64 word) = (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x38),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x448),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x448),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x894),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x894),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = 0x199ee\<close>
declare Q_0x199f5_32_def[Qs]

schematic_goal bdrv_info_0_1_0x199ee_0x199ee_32[blocks]:
  assumes \<open>(P_0x199ee_32 && P_0x199ee_32_regions) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x199ee 32 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x199f5_32 ?\<sigma> \<and> block_usage P_0x199ee_32_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x199ee_32_def P_0x199ee_32_regions_def post: Q_0x199f5_32_def regionset: P_0x199ee_32_regions_set_def)

definition P_0x199f5_33 :: state_pred where
  \<open>P_0x199f5_33 \<sigma> \<equiv> RIP \<sigma> = 0x199f5 \<and> RAX \<sigma> = term_printf_0x199e9_retval \<and> RDX \<sigma> = ucast ((\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0xc),4]::32 word)) \<and> RDI \<sigma> = ((RBX \<sigma>::64 word) + 0x448) \<and> RSI \<sigma> = ucast ((\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x10),4]::32 word)) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x8) \<and> (\<sigma> \<turnstile> *[0x2a498,8]::64 word) = (\<sigma> \<turnstile> *[0x2a498,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0xc),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0xc),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x10),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x10),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x38),8]::64 word) = (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x38),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x448),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x448),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x894),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x894),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = 0x199ee\<close>
declare P_0x199f5_33_def[Ps]

definition P_0x199f5_33_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x199f5_33_regions_set \<sigma> \<equiv> {
    (0, 0x2a498, 8),
    (1, RSP\<^sub>0, 8),
    (2, ((RBX \<sigma>::64 word) + 0xc), 4),
    (3, ((RBX \<sigma>::64 word) + 0x10), 4),
    (4, ((RBX \<sigma>::64 word) + 0x38), 8),
    (5, ((RBX \<sigma>::64 word) + 0x448), Suc 0),
    (6, ((RBX \<sigma>::64 word) + 0x894), 4),
    (7, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x10), 8)
  }\<close>

definition P_0x199f5_33_regions :: state_pred where
  \<open>P_0x199f5_33_regions \<sigma> \<equiv> \<exists>regions. P_0x199f5_33_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_term_print_filename_addr_0x199f5_33 :: state_pred where
  \<open>Q_term_print_filename_addr_0x199f5_33 \<sigma> \<equiv> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x10) \<and> RIP \<sigma> = term_print_filename_addr \<and> RAX \<sigma> = term_printf_0x199e9_retval \<and> RDX \<sigma> = ucast ((\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0xc),4]::32 word)) \<and> RDI \<sigma> = ((RBX \<sigma>::64 word) + 0x448) \<and> RSI \<sigma> = ucast ((\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x10),4]::32 word)) \<and> (\<sigma> \<turnstile> *[0x2a498,8]::64 word) = (\<sigma> \<turnstile> *[0x2a498,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0xc),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0xc),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x10),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x10),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x38),8]::64 word) = (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x38),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x448),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x448),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x894),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x894),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = 0x199fa\<close>
declare Q_term_print_filename_addr_0x199f5_33_def[Qs]

schematic_goal bdrv_info_0_1_0x199f5_0x199f5_33[blocks]:
  assumes \<open>(P_0x199f5_33 && P_0x199f5_33_regions) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x199f5 33 \<sigma> \<triangleq> ?\<sigma> \<and> Q_term_print_filename_addr_0x199f5_33 ?\<sigma> \<and> block_usage P_0x199f5_33_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x199f5_33_def P_0x199f5_33_regions_def post: Q_term_print_filename_addr_0x199f5_33_def regionset: P_0x199f5_33_regions_set_def)

definition P_0x199fa_34 :: state_pred where
  \<open>P_0x199fa_34 \<sigma> \<equiv> RIP \<sigma> = 0x199fa \<and> RAX \<sigma> = term_print_filename_0x199f5_retval \<and> RDX \<sigma> = ucast ((\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0xc),4]::32 word)) \<and> RDI \<sigma> = ((RBX \<sigma>::64 word) + 0x448) \<and> RSI \<sigma> = ucast ((\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x10),4]::32 word)) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x8) \<and> (\<sigma> \<turnstile> *[0x2a498,8]::64 word) = (\<sigma> \<turnstile> *[0x2a498,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0xc),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0xc),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x10),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x10),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x38),8]::64 word) = (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x38),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x448),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x448),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x894),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x894),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = 0x199fa\<close>
declare P_0x199fa_34_def[Ps]

definition P_0x199fa_34_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x199fa_34_regions_set \<sigma> \<equiv> {
    (0, 0x2a498, 8),
    (1, RSP\<^sub>0, 8),
    (2, ((RBX \<sigma>::64 word) + 0xc), 4),
    (3, ((RBX \<sigma>::64 word) + 0x10), 4),
    (4, ((RBX \<sigma>::64 word) + 0x38), 8),
    (5, ((RBX \<sigma>::64 word) + 0x448), Suc 0),
    (6, ((RBX \<sigma>::64 word) + 0x894), 4),
    (7, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x10), 8)
  }\<close>

definition P_0x199fa_34_regions :: state_pred where
  \<open>P_0x199fa_34_regions \<sigma> \<equiv> \<exists>regions. P_0x199fa_34_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x198c3_34 :: state_pred where
  \<open>Q_0x198c3_34 \<sigma> \<equiv> RIP \<sigma> = 0x198c3 \<and> RDX \<sigma> = ucast ((\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0xc),4]::32 word)) \<and> RSI \<sigma> = ucast ((\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x10),4]::32 word)) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x8) \<and> (\<sigma> \<turnstile> *[0x2a498,8]::64 word) = (\<sigma> \<turnstile> *[0x2a498,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0xc),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0xc),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x10),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x10),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x38),8]::64 word) = (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x38),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x448),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x448),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x894),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x894),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = RBX\<^sub>0\<close>
declare Q_0x198c3_34_def[Qs]

schematic_goal bdrv_info_0_1_0x199fa_0x199fa_34[blocks]:
  assumes \<open>(P_0x199fa_34 && P_0x199fa_34_regions) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x199fa 34 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x198c3_34 ?\<sigma> \<and> block_usage P_0x199fa_34_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x199fa_34_def P_0x199fa_34_regions_def post: Q_0x198c3_34_def regionset: P_0x199fa_34_regions_set_def)

definition P_0x198bd_false_35 :: state_pred where
  \<open>P_0x198bd_false_35 \<sigma> \<equiv> RIP \<sigma> = 0x198bd \<and> RAX \<sigma> = term_print_filename_0x198b1_retval \<and> RDX \<sigma> = ucast ((\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0xc),4]::32 word)) \<and> RDI \<sigma> = ((RBX \<sigma>::64 word) + 0x48) \<and> RSI \<sigma> = ucast ((\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x10),4]::32 word)) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x8) \<and> (\<sigma> \<turnstile> *[0x2a498,8]::64 word) = (\<sigma> \<turnstile> *[0x2a498,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0xc),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0xc),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x10),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x10),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x38),8]::64 word) = (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x38),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x448),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x448),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x894),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x894),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = 0x198b6\<close>
declare P_0x198bd_false_35_def[Ps]

definition P_0x198bd_false_35_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x198bd_false_35_regions_set \<sigma> \<equiv> {
    (0, 0x2a498, 8),
    (1, RSP\<^sub>0, 8),
    (2, ((RBX \<sigma>::64 word) + 0xc), 4),
    (3, ((RBX \<sigma>::64 word) + 0x10), 4),
    (4, ((RBX \<sigma>::64 word) + 0x38), 8),
    (5, ((RBX \<sigma>::64 word) + 0x448), Suc 0),
    (6, ((RBX \<sigma>::64 word) + 0x894), 4),
    (7, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x10), 8)
  }\<close>

definition P_0x198bd_false_35_regions :: state_pred where
  \<open>P_0x198bd_false_35_regions \<sigma> \<equiv> \<exists>regions. P_0x198bd_false_35_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x198c3_35 :: state_pred where
  \<open>Q_0x198c3_35 \<sigma> \<equiv> RIP \<sigma> = 0x198c3 \<and> RDX \<sigma> = ucast ((\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0xc),4]::32 word)) \<and> RSI \<sigma> = ucast ((\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x10),4]::32 word)) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x8) \<and> (\<sigma> \<turnstile> *[0x2a498,8]::64 word) = (\<sigma> \<turnstile> *[0x2a498,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0xc),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0xc),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x10),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x10),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x38),8]::64 word) = (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x38),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x448),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x448),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x894),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x894),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = RBX\<^sub>0\<close>
declare Q_0x198c3_35_def[Qs]

schematic_goal bdrv_info_0_1_0x198bd_0x198bd_35[blocks]:
  assumes \<open>(P_0x198bd_false_35 && P_0x198bd_false_35_regions && ! !ZF) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x198bd 35 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x198c3_35 ?\<sigma> \<and> block_usage P_0x198bd_false_35_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x198bd_false_35_def P_0x198bd_false_35_regions_def post: Q_0x198c3_35_def regionset: P_0x198bd_false_35_regions_set_def)

definition P_0x198c3_36 :: state_pred where
  \<open>P_0x198c3_36 \<sigma> \<equiv> RIP \<sigma> = 0x198c3 \<and> RDX \<sigma> = ucast ((\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0xc),4]::32 word)) \<and> RSI \<sigma> = ucast ((\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x10),4]::32 word)) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x8) \<and> (\<sigma> \<turnstile> *[0x2a498,8]::64 word) = (\<sigma> \<turnstile> *[0x2a498,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0xc),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0xc),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x10),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x10),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x38),8]::64 word) = (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x38),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x448),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x448),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x894),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x894),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = RBX\<^sub>0\<close>
declare P_0x198c3_36_def[Ps]

definition P_0x198c3_36_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x198c3_36_regions_set \<sigma> \<equiv> {
    (0, 0x2a498, 8),
    (1, RSP\<^sub>0, 8),
    (2, ((RBX \<sigma>::64 word) + 0x8), 4),
    (3, ((RBX \<sigma>::64 word) + 0xc), 4),
    (4, ((RBX \<sigma>::64 word) + 0x10), 4),
    (5, ((RBX \<sigma>::64 word) + 0x38), 8),
    (6, ((RBX \<sigma>::64 word) + 0x448), Suc 0),
    (7, ((RBX \<sigma>::64 word) + 0x894), 4),
    (8, ((RSP\<^sub>0::64 word) - 0x8), 8)
  }\<close>

definition P_0x198c3_36_regions :: state_pred where
  \<open>P_0x198c3_36_regions \<sigma> \<equiv> \<exists>regions. P_0x198c3_36_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x198cf_36 :: state_pred where
  \<open>Q_0x198cf_36 \<sigma> \<equiv> RIP \<sigma> = 0x198cf \<and> RAX \<sigma> = 0x0 \<and> RDX \<sigma> = ucast ((\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0xc),4]::32 word)) \<and> RDI \<sigma> = 0x219fb \<and> RSI \<sigma> = ucast ((\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x8),4]::32 word)) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x8) \<and> (\<sigma> \<turnstile> *[0x2a498,8]::64 word) = (\<sigma> \<turnstile> *[0x2a498,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x8),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x8),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0xc),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0xc),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x10),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x10),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x38),8]::64 word) = (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x38),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x448),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x448),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x894),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x894),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = RBX\<^sub>0\<close>
declare Q_0x198cf_36_def[Qs]

schematic_goal bdrv_info_0_3_0x198c3_0x198cd_36[blocks]:
  assumes \<open>(P_0x198c3_36 && P_0x198c3_36_regions) \<sigma>\<close>
  shows \<open>exec_block 3 0x198cd 36 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x198cf_36 ?\<sigma> \<and> block_usage P_0x198c3_36_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x198c3_36_def P_0x198c3_36_regions_def post: Q_0x198cf_36_def regionset: P_0x198c3_36_regions_set_def)

definition P_0x198cf_37 :: state_pred where
  \<open>P_0x198cf_37 \<sigma> \<equiv> RIP \<sigma> = 0x198cf \<and> RAX \<sigma> = 0x0 \<and> RDX \<sigma> = ucast ((\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0xc),4]::32 word)) \<and> RDI \<sigma> = 0x219fb \<and> RSI \<sigma> = ucast ((\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x8),4]::32 word)) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x8) \<and> (\<sigma> \<turnstile> *[0x2a498,8]::64 word) = (\<sigma> \<turnstile> *[0x2a498,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x8),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x8),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0xc),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0xc),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x10),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x10),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x38),8]::64 word) = (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x38),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x448),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x448),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x894),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x894),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = RBX\<^sub>0\<close>
declare P_0x198cf_37_def[Ps]

definition P_0x198cf_37_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x198cf_37_regions_set \<sigma> \<equiv> {
    (0, 0x2a498, 8),
    (1, RSP\<^sub>0, 8),
    (2, ((RBX \<sigma>::64 word) + 0x8), 4),
    (3, ((RBX \<sigma>::64 word) + 0xc), 4),
    (4, ((RBX \<sigma>::64 word) + 0x10), 4),
    (5, ((RBX \<sigma>::64 word) + 0x38), 8),
    (6, ((RBX \<sigma>::64 word) + 0x448), Suc 0),
    (7, ((RBX \<sigma>::64 word) + 0x894), 4),
    (8, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x10), 8)
  }\<close>

definition P_0x198cf_37_regions :: state_pred where
  \<open>P_0x198cf_37_regions \<sigma> \<equiv> \<exists>regions. P_0x198cf_37_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_term_printf_addr_0x198cf_37 :: state_pred where
  \<open>Q_term_printf_addr_0x198cf_37 \<sigma> \<equiv> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x10) \<and> RIP \<sigma> = term_printf_addr \<and> RAX \<sigma> = 0x0 \<and> RDX \<sigma> = ucast ((\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0xc),4]::32 word)) \<and> RDI \<sigma> = 0x219fb \<and> RSI \<sigma> = ucast ((\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x8),4]::32 word)) \<and> (\<sigma> \<turnstile> *[0x2a498,8]::64 word) = (\<sigma> \<turnstile> *[0x2a498,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x8),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x8),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0xc),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0xc),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x10),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x10),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x38),8]::64 word) = (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x38),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x448),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x448),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x894),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x894),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = 0x198d4\<close>
declare Q_term_printf_addr_0x198cf_37_def[Qs]

schematic_goal bdrv_info_0_1_0x198cf_0x198cf_37[blocks]:
  assumes \<open>(P_0x198cf_37 && P_0x198cf_37_regions) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x198cf 37 \<sigma> \<triangleq> ?\<sigma> \<and> Q_term_printf_addr_0x198cf_37 ?\<sigma> \<and> block_usage P_0x198cf_37_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x198cf_37_def P_0x198cf_37_regions_def post: Q_term_printf_addr_0x198cf_37_def regionset: P_0x198cf_37_regions_set_def)

definition P_0x198d4_38 :: state_pred where
  \<open>P_0x198d4_38 \<sigma> \<equiv> RIP \<sigma> = 0x198d4 \<and> RAX \<sigma> = term_printf_0x198cf_retval \<and> RDX \<sigma> = ucast ((\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0xc),4]::32 word)) \<and> RDI \<sigma> = 0x219fb \<and> RSI \<sigma> = ucast ((\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x8),4]::32 word)) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x8) \<and> (\<sigma> \<turnstile> *[0x2a498,8]::64 word) = (\<sigma> \<turnstile> *[0x2a498,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x8),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x8),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0xc),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0xc),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x10),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x10),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x38),8]::64 word) = (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x38),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x448),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x448),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x894),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x894),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = 0x198d4\<close>
declare P_0x198d4_38_def[Ps]

definition P_0x198d4_38_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x198d4_38_regions_set \<sigma> \<equiv> {
    (0, 0x2a498, 8),
    (1, RSP\<^sub>0, 8),
    (2, ((RBX \<sigma>::64 word) + 0x8), 4),
    (3, ((RBX \<sigma>::64 word) + 0xc), 4),
    (4, ((RBX \<sigma>::64 word) + 0x10), 4),
    (5, ((RBX \<sigma>::64 word) + 0x38), 8),
    (6, ((RBX \<sigma>::64 word) + 0x448), Suc 0),
    (7, ((RBX \<sigma>::64 word) + 0x894), 4),
    (8, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (10, (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x38),8]::64 word), 8)
  }\<close>

definition P_0x198d4_38_regions :: state_pred where
  \<open>P_0x198d4_38_regions \<sigma> \<equiv> \<exists>regions. P_0x198d4_38_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x198e4_38 :: state_pred where
  \<open>Q_0x198e4_38 \<sigma> \<equiv> RIP \<sigma> = 0x198e4 \<and> RAX \<sigma> = 0x0 \<and> RDX \<sigma> = ucast ((\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0xc),4]::32 word)) \<and> RDI \<sigma> = 0x21a02 \<and> RSI \<sigma> = (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x38),8]::64 word),8]::64 word) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x8) \<and> (\<sigma> \<turnstile> *[0x2a498,8]::64 word) = (\<sigma> \<turnstile> *[0x2a498,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x8),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x8),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0xc),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0xc),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x10),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x10),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x38),8]::64 word) = (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x38),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x448),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x448),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x894),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x894),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = 0x198d4 \<and> (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x38),8]::64 word),8]::64 word) = (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x38),8]::64 word),8]::64 word)\<close>
declare Q_0x198e4_38_def[Qs]

schematic_goal bdrv_info_0_4_0x198d4_0x198e2_38[blocks]:
  assumes \<open>(P_0x198d4_38 && P_0x198d4_38_regions) \<sigma>\<close>
  shows \<open>exec_block 4 0x198e2 38 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x198e4_38 ?\<sigma> \<and> block_usage P_0x198d4_38_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x198d4_38_def P_0x198d4_38_regions_def post: Q_0x198e4_38_def regionset: P_0x198d4_38_regions_set_def)

definition P_0x198e4_39 :: state_pred where
  \<open>P_0x198e4_39 \<sigma> \<equiv> RIP \<sigma> = 0x198e4 \<and> RAX \<sigma> = 0x0 \<and> RDX \<sigma> = ucast ((\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0xc),4]::32 word)) \<and> RDI \<sigma> = 0x21a02 \<and> RSI \<sigma> = (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x38),8]::64 word),8]::64 word) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x8) \<and> (\<sigma> \<turnstile> *[0x2a498,8]::64 word) = (\<sigma> \<turnstile> *[0x2a498,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x8),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x8),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0xc),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0xc),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x10),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x10),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x38),8]::64 word) = (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x38),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x448),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x448),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x894),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x894),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = 0x198d4 \<and> (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x38),8]::64 word),8]::64 word) = (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x38),8]::64 word),8]::64 word)\<close>
declare P_0x198e4_39_def[Ps]

definition P_0x198e4_39_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x198e4_39_regions_set \<sigma> \<equiv> {
    (0, 0x2a498, 8),
    (1, RSP\<^sub>0, 8),
    (2, ((RBX \<sigma>::64 word) + 0x8), 4),
    (3, ((RBX \<sigma>::64 word) + 0xc), 4),
    (4, ((RBX \<sigma>::64 word) + 0x10), 4),
    (5, ((RBX \<sigma>::64 word) + 0x38), 8),
    (6, ((RBX \<sigma>::64 word) + 0x448), Suc 0),
    (7, ((RBX \<sigma>::64 word) + 0x894), 4),
    (8, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (10, (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x38),8]::64 word), 8)
  }\<close>

definition P_0x198e4_39_regions :: state_pred where
  \<open>P_0x198e4_39_regions \<sigma> \<equiv> \<exists>regions. P_0x198e4_39_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_term_printf_addr_0x198e4_39 :: state_pred where
  \<open>Q_term_printf_addr_0x198e4_39 \<sigma> \<equiv> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x10) \<and> RIP \<sigma> = term_printf_addr \<and> RAX \<sigma> = 0x0 \<and> RDX \<sigma> = ucast ((\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0xc),4]::32 word)) \<and> RDI \<sigma> = 0x21a02 \<and> RSI \<sigma> = (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x38),8]::64 word),8]::64 word) \<and> (\<sigma> \<turnstile> *[0x2a498,8]::64 word) = (\<sigma> \<turnstile> *[0x2a498,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x8),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x8),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0xc),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0xc),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x10),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x10),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x38),8]::64 word) = (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x38),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x448),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x448),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x894),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x894),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = 0x198e9 \<and> (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x38),8]::64 word),8]::64 word) = (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x38),8]::64 word),8]::64 word)\<close>
declare Q_term_printf_addr_0x198e4_39_def[Qs]

schematic_goal bdrv_info_0_1_0x198e4_0x198e4_39[blocks]:
  assumes \<open>(P_0x198e4_39 && P_0x198e4_39_regions) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x198e4 39 \<sigma> \<triangleq> ?\<sigma> \<and> Q_term_printf_addr_0x198e4_39 ?\<sigma> \<and> block_usage P_0x198e4_39_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x198e4_39_def P_0x198e4_39_regions_def post: Q_term_printf_addr_0x198e4_39_def regionset: P_0x198e4_39_regions_set_def)

definition P_0x198e9_40 :: state_pred where
  \<open>P_0x198e9_40 \<sigma> \<equiv> RIP \<sigma> = 0x198e9 \<and> RAX \<sigma> = term_printf_0x198e4_retval \<and> RDX \<sigma> = ucast ((\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0xc),4]::32 word)) \<and> RDI \<sigma> = 0x21a02 \<and> RSI \<sigma> = (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x38),8]::64 word),8]::64 word) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x8) \<and> (\<sigma> \<turnstile> *[0x2a498,8]::64 word) = (\<sigma> \<turnstile> *[0x2a498,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x8),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x8),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0xc),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0xc),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x10),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x10),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x38),8]::64 word) = (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x38),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x448),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x448),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x894),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x894),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = 0x198e9 \<and> (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x38),8]::64 word),8]::64 word) = (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x38),8]::64 word),8]::64 word)\<close>
declare P_0x198e9_40_def[Ps]

definition P_0x198e9_40_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x198e9_40_regions_set \<sigma> \<equiv> {
    (0, 0x2a498, 8),
    (1, RSP\<^sub>0, 8),
    (2, ((RBX \<sigma>::64 word) + 0x8), 4),
    (3, ((RBX \<sigma>::64 word) + 0xc), 4),
    (4, ((RBX \<sigma>::64 word) + 0x10), 4),
    (5, ((RBX \<sigma>::64 word) + 0x38), 8),
    (6, ((RBX \<sigma>::64 word) + 0x448), Suc 0),
    (7, ((RBX \<sigma>::64 word) + 0x850), 8),
    (8, ((RBX \<sigma>::64 word) + 0x894), 4),
    (9, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (11, (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x38),8]::64 word), 8)
  }\<close>

definition P_0x198e9_40_regions :: state_pred where
  \<open>P_0x198e9_40_regions \<sigma> \<equiv> \<exists>regions. P_0x198e9_40_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x198f3_40 :: state_pred where
  \<open>Q_0x198f3_40 \<sigma> \<equiv> RIP \<sigma> = 0x198f3 \<and> RAX \<sigma> = (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x850),8]::64 word) \<and> RDX \<sigma> = ucast ((\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0xc),4]::32 word)) \<and> RDI \<sigma> = 0x21a02 \<and> RSI \<sigma> = (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x38),8]::64 word),8]::64 word) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x8) \<and> (\<sigma> \<turnstile> *[0x2a498,8]::64 word) = (\<sigma> \<turnstile> *[0x2a498,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x8),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x8),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0xc),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0xc),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x10),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x10),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x38),8]::64 word) = (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x38),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x448),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x448),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x850),8]::64 word) = (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x850),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x894),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x894),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = 0x198e9 \<and> (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x38),8]::64 word),8]::64 word) = (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x38),8]::64 word),8]::64 word)\<close>
declare Q_0x198f3_40_def[Qs]

schematic_goal bdrv_info_0_2_0x198e9_0x198f0_40[blocks]:
  assumes \<open>(P_0x198e9_40 && P_0x198e9_40_regions) \<sigma>\<close>
  shows \<open>exec_block 2 0x198f0 40 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x198f3_40 ?\<sigma> \<and> block_usage P_0x198e9_40_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x198e9_40_def P_0x198e9_40_regions_def post: Q_0x198f3_40_def regionset: P_0x198e9_40_regions_set_def)

definition P_0x198f3_true_41 :: state_pred where
  \<open>P_0x198f3_true_41 \<sigma> \<equiv> RIP \<sigma> = 0x198f3 \<and> RAX \<sigma> = (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x850),8]::64 word) \<and> RDX \<sigma> = ucast ((\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0xc),4]::32 word)) \<and> RDI \<sigma> = 0x21a02 \<and> RSI \<sigma> = (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x38),8]::64 word),8]::64 word) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x8) \<and> (\<sigma> \<turnstile> *[0x2a498,8]::64 word) = (\<sigma> \<turnstile> *[0x2a498,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x8),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x8),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0xc),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0xc),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x10),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x10),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x38),8]::64 word) = (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x38),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x448),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x448),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x850),8]::64 word) = (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x850),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x894),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x894),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = 0x198e9 \<and> (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x38),8]::64 word),8]::64 word) = (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x38),8]::64 word),8]::64 word)\<close>
declare P_0x198f3_true_41_def[Ps]

definition P_0x198f3_true_41_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x198f3_true_41_regions_set \<sigma> \<equiv> {
    (0, 0x2a498, 8),
    (1, RSP\<^sub>0, 8),
    (2, ((RBX \<sigma>::64 word) + 0x8), 4),
    (3, ((RBX \<sigma>::64 word) + 0xc), 4),
    (4, ((RBX \<sigma>::64 word) + 0x10), 4),
    (5, ((RBX \<sigma>::64 word) + 0x14), 4),
    (6, ((RBX \<sigma>::64 word) + 0x38), 8),
    (7, ((RBX \<sigma>::64 word) + 0x448), Suc 0),
    (8, ((RBX \<sigma>::64 word) + 0x850), 8),
    (9, ((RBX \<sigma>::64 word) + 0x894), 4),
    (10, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (11, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (12, (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x38),8]::64 word), 8)
  }\<close>

definition P_0x198f3_true_41_regions :: state_pred where
  \<open>P_0x198f3_true_41_regions \<sigma> \<equiv> \<exists>regions. P_0x198f3_true_41_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x19904_41 :: state_pred where
  \<open>Q_0x19904_41 \<sigma> \<equiv> RIP \<sigma> = 0x19904 \<and> RDX \<sigma> = ucast ((\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0xc),4]::32 word)) \<and> RDI \<sigma> = 0x21a02 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x8) \<and> (\<sigma> \<turnstile> *[0x2a498,8]::64 word) = (\<sigma> \<turnstile> *[0x2a498,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x8),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x8),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0xc),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0xc),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x10),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x10),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x38),8]::64 word) = (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x38),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x448),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x448),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x850),8]::64 word) = (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x850),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x894),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x894),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = 0x198e9 \<and> (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x38),8]::64 word),8]::64 word) = (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x38),8]::64 word),8]::64 word)\<close>
declare Q_0x19904_41_def[Qs]

schematic_goal bdrv_info_0_2_0x198f3_0x19901_41[blocks]:
  assumes \<open>(P_0x198f3_true_41 && P_0x198f3_true_41_regions && ZF) \<sigma>\<close>
  shows \<open>exec_block 2 0x19901 41 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x19904_41 ?\<sigma> \<and> block_usage P_0x198f3_true_41_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x198f3_true_41_def P_0x198f3_true_41_regions_def post: Q_0x19904_41_def regionset: P_0x198f3_true_41_regions_set_def)

definition P_0x198f3_false_42 :: state_pred where
  \<open>P_0x198f3_false_42 \<sigma> \<equiv> RIP \<sigma> = 0x198f3 \<and> RAX \<sigma> = (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x850),8]::64 word) \<and> RDX \<sigma> = ucast ((\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0xc),4]::32 word)) \<and> RDI \<sigma> = 0x21a02 \<and> RSI \<sigma> = (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x38),8]::64 word),8]::64 word) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x8) \<and> (\<sigma> \<turnstile> *[0x2a498,8]::64 word) = (\<sigma> \<turnstile> *[0x2a498,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x8),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x8),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0xc),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0xc),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x10),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x10),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x38),8]::64 word) = (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x38),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x448),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x448),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x850),8]::64 word) = (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x850),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x894),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x894),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = 0x198e9 \<and> (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x38),8]::64 word),8]::64 word) = (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x38),8]::64 word),8]::64 word)\<close>
declare P_0x198f3_false_42_def[Ps]

definition P_0x198f3_false_42_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x198f3_false_42_regions_set \<sigma> \<equiv> {
    (0, 0x2a498, 8),
    (1, RSP\<^sub>0, 8),
    (2, ((RBX \<sigma>::64 word) + 0x8), 4),
    (3, ((RBX \<sigma>::64 word) + 0xc), 4),
    (4, ((RBX \<sigma>::64 word) + 0x10), 4),
    (5, ((RBX \<sigma>::64 word) + 0x38), 8),
    (6, ((RBX \<sigma>::64 word) + 0x448), Suc 0),
    (7, ((RBX \<sigma>::64 word) + 0x850), 8),
    (8, ((RBX \<sigma>::64 word) + 0x894), 4),
    (9, (((\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x850),8]::64 word)::64 word) + 0x14), 4),
    (10, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (11, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (12, (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x38),8]::64 word), 8)
  }\<close>

definition P_0x198f3_false_42_regions :: state_pred where
  \<open>P_0x198f3_false_42_regions \<sigma> \<equiv> \<exists>regions. P_0x198f3_false_42_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x198ff_42 :: state_pred where
  \<open>Q_0x198ff_42 \<sigma> \<equiv> RIP \<sigma> = 0x198ff \<and> RAX \<sigma> = ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x850),8]::64 word)::64 word) + 0x14),4]::32 word)) \<and> RDX \<sigma> = ucast ((\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0xc),4]::32 word)) \<and> RDI \<sigma> = 0x21a02 \<and> RSI \<sigma> = 0x1 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x8) \<and> (\<sigma> \<turnstile> *[0x2a498,8]::64 word) = (\<sigma> \<turnstile> *[0x2a498,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x8),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x8),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0xc),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0xc),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x10),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x10),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x38),8]::64 word) = (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x38),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x448),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x448),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x850),8]::64 word) = (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x850),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x894),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x894),4]::32 word)) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x850),8]::64 word)::64 word) + 0x14),4]::32 word) = ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x850),8]::64 word)::64 word) + 0x14),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = 0x198e9 \<and> (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x38),8]::64 word),8]::64 word) = (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x38),8]::64 word),8]::64 word)\<close>
declare Q_0x198ff_42_def[Qs]

schematic_goal bdrv_info_0_4_0x198f3_0x198fd_42[blocks]:
  assumes \<open>(P_0x198f3_false_42 && P_0x198f3_false_42_regions && ! ZF) \<sigma>\<close>
  shows \<open>exec_block 4 0x198fd 42 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x198ff_42 ?\<sigma> \<and> block_usage P_0x198f3_false_42_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x198f3_false_42_def P_0x198f3_false_42_regions_def post: Q_0x198ff_42_def regionset: P_0x198f3_false_42_regions_set_def)

definition P_0x198ff_true_43 :: state_pred where
  \<open>P_0x198ff_true_43 \<sigma> \<equiv> RIP \<sigma> = 0x198ff \<and> RAX \<sigma> = ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x850),8]::64 word)::64 word) + 0x14),4]::32 word)) \<and> RDX \<sigma> = ucast ((\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0xc),4]::32 word)) \<and> RDI \<sigma> = 0x21a02 \<and> RSI \<sigma> = 0x1 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x8) \<and> (\<sigma> \<turnstile> *[0x2a498,8]::64 word) = (\<sigma> \<turnstile> *[0x2a498,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x8),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x8),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0xc),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0xc),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x10),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x10),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x38),8]::64 word) = (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x38),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x448),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x448),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x850),8]::64 word) = (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x850),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x894),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x894),4]::32 word)) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x850),8]::64 word)::64 word) + 0x14),4]::32 word) = ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x850),8]::64 word)::64 word) + 0x14),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = 0x198e9 \<and> (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x38),8]::64 word),8]::64 word) = (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x38),8]::64 word),8]::64 word)\<close>
declare P_0x198ff_true_43_def[Ps]

definition P_0x198ff_true_43_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x198ff_true_43_regions_set \<sigma> \<equiv> {
    (0, 0x2a498, 8),
    (1, RSP\<^sub>0, 8),
    (2, ((RBX \<sigma>::64 word) + 0x8), 4),
    (3, ((RBX \<sigma>::64 word) + 0xc), 4),
    (4, ((RBX \<sigma>::64 word) + 0x10), 4),
    (5, ((RBX \<sigma>::64 word) + 0x38), 8),
    (6, ((RBX \<sigma>::64 word) + 0x448), Suc 0),
    (7, ((RBX \<sigma>::64 word) + 0x850), 8),
    (8, ((RBX \<sigma>::64 word) + 0x894), 4),
    (9, (((\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x850),8]::64 word)::64 word) + 0x14), 4),
    (10, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (11, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (12, (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x38),8]::64 word), 8)
  }\<close>

definition P_0x198ff_true_43_regions :: state_pred where
  \<open>P_0x198ff_true_43_regions \<sigma> \<equiv> \<exists>regions. P_0x198ff_true_43_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x19904_43 :: state_pred where
  \<open>Q_0x19904_43 \<sigma> \<equiv> RIP \<sigma> = 0x19904 \<and> RDX \<sigma> = ucast ((\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0xc),4]::32 word)) \<and> RDI \<sigma> = 0x21a02 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x8) \<and> (\<sigma> \<turnstile> *[0x2a498,8]::64 word) = (\<sigma> \<turnstile> *[0x2a498,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x8),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x8),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0xc),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0xc),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x10),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x10),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x38),8]::64 word) = (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x38),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x448),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x448),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x850),8]::64 word) = (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x850),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x894),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x894),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = 0x198e9 \<and> (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x38),8]::64 word),8]::64 word) = (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x38),8]::64 word),8]::64 word)\<close>
declare Q_0x19904_43_def[Qs]

schematic_goal bdrv_info_0_1_0x198ff_0x198ff_43[blocks]:
  assumes \<open>(P_0x198ff_true_43 && P_0x198ff_true_43_regions && !ZF) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x198ff 43 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x19904_43 ?\<sigma> \<and> block_usage P_0x198ff_true_43_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x198ff_true_43_def P_0x198ff_true_43_regions_def post: Q_0x19904_43_def regionset: P_0x198ff_true_43_regions_set_def)

definition P_0x198ff_false_44 :: state_pred where
  \<open>P_0x198ff_false_44 \<sigma> \<equiv> RIP \<sigma> = 0x198ff \<and> RAX \<sigma> = ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x850),8]::64 word)::64 word) + 0x14),4]::32 word)) \<and> RDX \<sigma> = ucast ((\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0xc),4]::32 word)) \<and> RDI \<sigma> = 0x21a02 \<and> RSI \<sigma> = 0x1 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x8) \<and> (\<sigma> \<turnstile> *[0x2a498,8]::64 word) = (\<sigma> \<turnstile> *[0x2a498,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x8),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x8),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0xc),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0xc),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x10),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x10),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x38),8]::64 word) = (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x38),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x448),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x448),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x850),8]::64 word) = (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x850),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x894),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x894),4]::32 word)) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x850),8]::64 word)::64 word) + 0x14),4]::32 word) = ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x850),8]::64 word)::64 word) + 0x14),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = 0x198e9 \<and> (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x38),8]::64 word),8]::64 word) = (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x38),8]::64 word),8]::64 word)\<close>
declare P_0x198ff_false_44_def[Ps]

definition P_0x198ff_false_44_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x198ff_false_44_regions_set \<sigma> \<equiv> {
    (0, 0x2a498, 8),
    (1, RSP\<^sub>0, 8),
    (2, ((RBX \<sigma>::64 word) + 0x8), 4),
    (3, ((RBX \<sigma>::64 word) + 0xc), 4),
    (4, ((RBX \<sigma>::64 word) + 0x10), 4),
    (5, ((RBX \<sigma>::64 word) + 0x14), 4),
    (6, ((RBX \<sigma>::64 word) + 0x38), 8),
    (7, ((RBX \<sigma>::64 word) + 0x448), Suc 0),
    (8, ((RBX \<sigma>::64 word) + 0x850), 8),
    (9, ((RBX \<sigma>::64 word) + 0x894), 4),
    (10, (((\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x850),8]::64 word)::64 word) + 0x14), 4),
    (11, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (12, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (13, (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x38),8]::64 word), 8)
  }\<close>

definition P_0x198ff_false_44_regions :: state_pred where
  \<open>P_0x198ff_false_44_regions \<sigma> \<equiv> \<exists>regions. P_0x198ff_false_44_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x19904_44 :: state_pred where
  \<open>Q_0x19904_44 \<sigma> \<equiv> RIP \<sigma> = 0x19904 \<and> RDX \<sigma> = ucast ((\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0xc),4]::32 word)) \<and> RDI \<sigma> = 0x21a02 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x8) \<and> (\<sigma> \<turnstile> *[0x2a498,8]::64 word) = (\<sigma> \<turnstile> *[0x2a498,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x8),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x8),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0xc),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0xc),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x10),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x10),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x38),8]::64 word) = (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x38),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x448),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x448),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x850),8]::64 word) = (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x850),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x894),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x894),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = 0x198e9 \<and> (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x38),8]::64 word),8]::64 word) = (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x38),8]::64 word),8]::64 word)\<close>
declare Q_0x19904_44_def[Qs]

schematic_goal bdrv_info_0_2_0x198ff_0x19901_44[blocks]:
  assumes \<open>(P_0x198ff_false_44 && P_0x198ff_false_44_regions && ! !ZF) \<sigma>\<close>
  shows \<open>exec_block 2 0x19901 44 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x19904_44 ?\<sigma> \<and> block_usage P_0x198ff_false_44_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x198ff_false_44_def P_0x198ff_false_44_regions_def post: Q_0x19904_44_def regionset: P_0x198ff_false_44_regions_set_def)

definition P_0x19904_45 :: state_pred where
  \<open>P_0x19904_45 \<sigma> \<equiv> RIP \<sigma> = 0x19904 \<and> RDX \<sigma> = ucast ((\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0xc),4]::32 word)) \<and> RDI \<sigma> = 0x21a02 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x8) \<and> (\<sigma> \<turnstile> *[0x2a498,8]::64 word) = (\<sigma> \<turnstile> *[0x2a498,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x8),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x8),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0xc),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0xc),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x10),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x10),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x38),8]::64 word) = (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x38),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x448),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x448),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x850),8]::64 word) = (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x850),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x894),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x894),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = 0x198e9 \<and> (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x38),8]::64 word),8]::64 word) = (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x38),8]::64 word),8]::64 word)\<close>
declare P_0x19904_45_def[Ps]

definition P_0x19904_45_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x19904_45_regions_set \<sigma> \<equiv> {
    (0, 0x2a498, 8),
    (1, RSP\<^sub>0, 8),
    (2, ((RBX \<sigma>::64 word) + 0x8), 4),
    (3, ((RBX \<sigma>::64 word) + 0xc), 4),
    (4, ((RBX \<sigma>::64 word) + 0x10), 4),
    (5, ((RBX \<sigma>::64 word) + 0x38), 8),
    (6, ((RBX \<sigma>::64 word) + 0x448), Suc 0),
    (7, ((RBX \<sigma>::64 word) + 0x850), 8),
    (8, ((RBX \<sigma>::64 word) + 0x894), 4),
    (9, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (11, (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x38),8]::64 word), 8)
  }\<close>

definition P_0x19904_45_regions :: state_pred where
  \<open>P_0x19904_45_regions \<sigma> \<equiv> \<exists>regions. P_0x19904_45_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x1990d_45 :: state_pred where
  \<open>Q_0x1990d_45 \<sigma> \<equiv> RIP \<sigma> = 0x1990d \<and> RAX \<sigma> = 0x0 \<and> RDX \<sigma> = ucast ((\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0xc),4]::32 word)) \<and> RDI \<sigma> = 0x21a0a \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x8) \<and> (\<sigma> \<turnstile> *[0x2a498,8]::64 word) = (\<sigma> \<turnstile> *[0x2a498,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x8),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x8),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0xc),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0xc),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x10),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x10),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x38),8]::64 word) = (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x38),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x448),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x448),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x850),8]::64 word) = (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x850),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x894),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x894),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = 0x198e9 \<and> (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x38),8]::64 word),8]::64 word) = (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x38),8]::64 word),8]::64 word)\<close>
declare Q_0x1990d_45_def[Qs]

schematic_goal bdrv_info_0_2_0x19904_0x1990b_45[blocks]:
  assumes \<open>(P_0x19904_45 && P_0x19904_45_regions) \<sigma>\<close>
  shows \<open>exec_block 2 0x1990b 45 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x1990d_45 ?\<sigma> \<and> block_usage P_0x19904_45_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x19904_45_def P_0x19904_45_regions_def post: Q_0x1990d_45_def regionset: P_0x19904_45_regions_set_def)

definition P_0x1990d_46 :: state_pred where
  \<open>P_0x1990d_46 \<sigma> \<equiv> RIP \<sigma> = 0x1990d \<and> RAX \<sigma> = 0x0 \<and> RDX \<sigma> = ucast ((\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0xc),4]::32 word)) \<and> RDI \<sigma> = 0x21a0a \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x8) \<and> (\<sigma> \<turnstile> *[0x2a498,8]::64 word) = (\<sigma> \<turnstile> *[0x2a498,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x8),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x8),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0xc),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0xc),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x10),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x10),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x38),8]::64 word) = (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x38),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x448),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x448),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x850),8]::64 word) = (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x850),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x894),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x894),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = 0x198e9 \<and> (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x38),8]::64 word),8]::64 word) = (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x38),8]::64 word),8]::64 word)\<close>
declare P_0x1990d_46_def[Ps]

definition P_0x1990d_46_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x1990d_46_regions_set \<sigma> \<equiv> {
    (0, 0x2a498, 8),
    (1, RSP\<^sub>0, 8),
    (2, ((RBX \<sigma>::64 word) + 0x8), 4),
    (3, ((RBX \<sigma>::64 word) + 0xc), 4),
    (4, ((RBX \<sigma>::64 word) + 0x10), 4),
    (5, ((RBX \<sigma>::64 word) + 0x38), 8),
    (6, ((RBX \<sigma>::64 word) + 0x448), Suc 0),
    (7, ((RBX \<sigma>::64 word) + 0x850), 8),
    (8, ((RBX \<sigma>::64 word) + 0x894), 4),
    (9, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (11, (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x38),8]::64 word), 8)
  }\<close>

definition P_0x1990d_46_regions :: state_pred where
  \<open>P_0x1990d_46_regions \<sigma> \<equiv> \<exists>regions. P_0x1990d_46_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_term_printf_addr_0x1990d_46 :: state_pred where
  \<open>Q_term_printf_addr_0x1990d_46 \<sigma> \<equiv> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x10) \<and> RIP \<sigma> = term_printf_addr \<and> RAX \<sigma> = 0x0 \<and> RDX \<sigma> = ucast ((\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0xc),4]::32 word)) \<and> (\<sigma> \<turnstile> *[0x2a498,8]::64 word) = (\<sigma> \<turnstile> *[0x2a498,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0xc),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0xc),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x38),8]::64 word) = (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x38),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x894),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x894),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = RBX\<^sub>0\<close>
declare Q_term_printf_addr_0x1990d_46_def[Qs]

schematic_goal bdrv_info_0_1_0x1990d_0x1990d_46[blocks]:
  assumes \<open>(P_0x1990d_46 && P_0x1990d_46_regions) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x1990d 46 \<sigma> \<triangleq> ?\<sigma> \<and> Q_term_printf_addr_0x1990d_46 ?\<sigma> \<and> block_usage P_0x1990d_46_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x1990d_46_def P_0x1990d_46_regions_def post: Q_term_printf_addr_0x1990d_46_def regionset: P_0x1990d_46_regions_set_def)

definition P_0x19996_false_47 :: state_pred where
  \<open>P_0x19996_false_47 \<sigma> \<equiv> RIP \<sigma> = 0x19996 \<and> RAX \<sigma> = term_printf_0x1998c_retval \<and> RDX \<sigma> = ucast ((\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0xc),4]::32 word)) \<and> RDI \<sigma> = 0x219da \<and> RSI \<sigma> = ucast ((\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x10),4]::32 word)) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x8) \<and> (\<sigma> \<turnstile> *[0x2a498,8]::64 word) = (\<sigma> \<turnstile> *[0x2a498,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0xc),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0xc),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x10),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x10),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x38),8]::64 word) = (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x38),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x894),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x894),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = 0x19991\<close>
declare P_0x19996_false_47_def[Ps]

definition P_0x19996_false_47_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x19996_false_47_regions_set \<sigma> \<equiv> {
    (0, 0x2a498, 8),
    (1, RSP\<^sub>0, 8),
    (2, ((RBX \<sigma>::64 word) + 0xc), 4),
    (3, ((RBX \<sigma>::64 word) + 0x10), 4),
    (4, ((RBX \<sigma>::64 word) + 0x38), 8),
    (5, ((RBX \<sigma>::64 word) + 0x894), 4),
    (6, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x10), 8)
  }\<close>

definition P_0x19996_false_47_regions :: state_pred where
  \<open>P_0x19996_false_47_regions \<sigma> \<equiv> \<exists>regions. P_0x19996_false_47_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x199a5_47 :: state_pred where
  \<open>Q_0x199a5_47 \<sigma> \<equiv> RIP \<sigma> = 0x199a5 \<and> RAX \<sigma> = 0x0 \<and> RDX \<sigma> = ucast ((\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0xc),4]::32 word)) \<and> RDI \<sigma> = 0x21a18 \<and> RSI \<sigma> = ucast ((\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x10),4]::32 word)) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x8) \<and> (\<sigma> \<turnstile> *[0x2a498,8]::64 word) = (\<sigma> \<turnstile> *[0x2a498,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0xc),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0xc),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x10),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x10),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x38),8]::64 word) = (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x38),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x894),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x894),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = 0x19991\<close>
declare Q_0x199a5_47_def[Qs]

schematic_goal bdrv_info_0_3_0x19996_0x199a3_47[blocks]:
  assumes \<open>(P_0x19996_false_47 && P_0x19996_false_47_regions && ! !ZF) \<sigma>\<close>
  shows \<open>exec_block 3 0x199a3 47 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x199a5_47 ?\<sigma> \<and> block_usage P_0x19996_false_47_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x19996_false_47_def P_0x19996_false_47_regions_def post: Q_0x199a5_47_def regionset: P_0x19996_false_47_regions_set_def)

definition P_0x199a5_48 :: state_pred where
  \<open>P_0x199a5_48 \<sigma> \<equiv> RIP \<sigma> = 0x199a5 \<and> RAX \<sigma> = 0x0 \<and> RDX \<sigma> = ucast ((\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0xc),4]::32 word)) \<and> RDI \<sigma> = 0x21a18 \<and> RSI \<sigma> = ucast ((\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x10),4]::32 word)) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x8) \<and> (\<sigma> \<turnstile> *[0x2a498,8]::64 word) = (\<sigma> \<turnstile> *[0x2a498,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0xc),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0xc),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x10),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x10),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x38),8]::64 word) = (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x38),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x894),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x894),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = 0x19991\<close>
declare P_0x199a5_48_def[Ps]

definition P_0x199a5_48_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x199a5_48_regions_set \<sigma> \<equiv> {
    (0, 0x2a498, 8),
    (1, RSP\<^sub>0, 8),
    (2, ((RBX \<sigma>::64 word) + 0xc), 4),
    (3, ((RBX \<sigma>::64 word) + 0x10), 4),
    (4, ((RBX \<sigma>::64 word) + 0x38), 8),
    (5, ((RBX \<sigma>::64 word) + 0x894), 4),
    (6, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x10), 8)
  }\<close>

definition P_0x199a5_48_regions :: state_pred where
  \<open>P_0x199a5_48_regions \<sigma> \<equiv> \<exists>regions. P_0x199a5_48_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_term_printf_addr_0x199a5_48 :: state_pred where
  \<open>Q_term_printf_addr_0x199a5_48 \<sigma> \<equiv> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x10) \<and> RIP \<sigma> = term_printf_addr \<and> RAX \<sigma> = 0x0 \<and> RDX \<sigma> = ucast ((\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0xc),4]::32 word)) \<and> RDI \<sigma> = 0x21a18 \<and> RSI \<sigma> = ucast ((\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x10),4]::32 word)) \<and> (\<sigma> \<turnstile> *[0x2a498,8]::64 word) = (\<sigma> \<turnstile> *[0x2a498,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0xc),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0xc),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x10),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x10),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x38),8]::64 word) = (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x38),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x894),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x894),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = 0x199aa\<close>
declare Q_term_printf_addr_0x199a5_48_def[Qs]

schematic_goal bdrv_info_0_1_0x199a5_0x199a5_48[blocks]:
  assumes \<open>(P_0x199a5_48 && P_0x199a5_48_regions) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x199a5 48 \<sigma> \<triangleq> ?\<sigma> \<and> Q_term_printf_addr_0x199a5_48 ?\<sigma> \<and> block_usage P_0x199a5_48_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x199a5_48_def P_0x199a5_48_regions_def post: Q_term_printf_addr_0x199a5_48_def regionset: P_0x199a5_48_regions_set_def)

definition P_0x199aa_49 :: state_pred where
  \<open>P_0x199aa_49 \<sigma> \<equiv> RIP \<sigma> = 0x199aa \<and> RAX \<sigma> = term_printf_0x199a5_retval \<and> RDX \<sigma> = ucast ((\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0xc),4]::32 word)) \<and> RDI \<sigma> = 0x21a18 \<and> RSI \<sigma> = ucast ((\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x10),4]::32 word)) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x8) \<and> (\<sigma> \<turnstile> *[0x2a498,8]::64 word) = (\<sigma> \<turnstile> *[0x2a498,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0xc),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0xc),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x10),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x10),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x38),8]::64 word) = (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x38),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x894),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x894),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = 0x199aa\<close>
declare P_0x199aa_49_def[Ps]

definition P_0x199aa_49_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x199aa_49_regions_set \<sigma> \<equiv> {
    (0, 0x2a498, 8),
    (1, RSP\<^sub>0, 8),
    (2, ((RBX \<sigma>::64 word) + 0xc), 4),
    (3, ((RBX \<sigma>::64 word) + 0x10), 4),
    (4, ((RBX \<sigma>::64 word) + 0x38), 8),
    (5, ((RBX \<sigma>::64 word) + 0x894), 4),
    (6, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x10), 8)
  }\<close>

definition P_0x199aa_49_regions :: state_pred where
  \<open>P_0x199aa_49_regions \<sigma> \<equiv> \<exists>regions. P_0x199aa_49_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x19912_49 :: state_pred where
  \<open>Q_0x19912_49 \<sigma> \<equiv> RIP \<sigma> = 0x19912 \<and> RDX \<sigma> = ucast ((\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0xc),4]::32 word)) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x8) \<and> (\<sigma> \<turnstile> *[0x2a498,8]::64 word) = (\<sigma> \<turnstile> *[0x2a498,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0xc),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0xc),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x38),8]::64 word) = (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x38),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x894),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x894),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = RBX\<^sub>0\<close>
declare Q_0x19912_49_def[Qs]

schematic_goal bdrv_info_0_1_0x199aa_0x199aa_49[blocks]:
  assumes \<open>(P_0x199aa_49 && P_0x199aa_49_regions) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x199aa 49 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x19912_49 ?\<sigma> \<and> block_usage P_0x199aa_49_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x199aa_49_def P_0x199aa_49_regions_def post: Q_0x19912_49_def regionset: P_0x199aa_49_regions_set_def)

definition P_0x1988e_false_50 :: state_pred where
  \<open>P_0x1988e_false_50 \<sigma> \<equiv> RIP \<sigma> = 0x1988e \<and> RAX \<sigma> = term_printf_0x19884_retval \<and> RDX \<sigma> = ucast ((\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0xc),4]::32 word)) \<and> RDI \<sigma> = 0x219cc \<and> RSI \<sigma> = ucast ((\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0xc),4]::32 word)) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x8) \<and> (\<sigma> \<turnstile> *[0x2a498,8]::64 word) = (\<sigma> \<turnstile> *[0x2a498,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0xc),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0xc),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x894),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x894),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = 0x19889\<close>
declare P_0x1988e_false_50_def[Ps]

definition P_0x1988e_false_50_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x1988e_false_50_regions_set \<sigma> \<equiv> {
    (0, 0x2a498, 8),
    (1, RSP\<^sub>0, 8),
    (2, ((RBX \<sigma>::64 word) + 0xc), 4),
    (3, ((RBX \<sigma>::64 word) + 0x38), 8),
    (4, ((RBX \<sigma>::64 word) + 0x894), 4),
    (5, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x10), 8)
  }\<close>

definition P_0x1988e_false_50_regions :: state_pred where
  \<open>P_0x1988e_false_50_regions \<sigma> \<equiv> \<exists>regions. P_0x1988e_false_50_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x19899_50 :: state_pred where
  \<open>Q_0x19899_50 \<sigma> \<equiv> RIP \<sigma> = 0x19899 \<and> RAX \<sigma> = term_printf_0x19884_retval \<and> RDX \<sigma> = ucast ((\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0xc),4]::32 word)) \<and> RDI \<sigma> = 0x219cc \<and> RSI \<sigma> = ucast ((\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0xc),4]::32 word)) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x8) \<and> (\<sigma> \<turnstile> *[0x2a498,8]::64 word) = (\<sigma> \<turnstile> *[0x2a498,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0xc),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0xc),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x38),8]::64 word) = (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x38),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x894),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x894),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = 0x19889\<close>
declare Q_0x19899_50_def[Qs]

schematic_goal bdrv_info_0_2_0x1988e_0x19894_50[blocks]:
  assumes \<open>(P_0x1988e_false_50 && P_0x1988e_false_50_regions && ! !ZF) \<sigma>\<close>
  shows \<open>exec_block 2 0x19894 50 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x19899_50 ?\<sigma> \<and> block_usage P_0x1988e_false_50_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x1988e_false_50_def P_0x1988e_false_50_regions_def post: Q_0x19899_50_def regionset: P_0x1988e_false_50_regions_set_def)

definition P_0x19899_true_51 :: state_pred where
  \<open>P_0x19899_true_51 \<sigma> \<equiv> RIP \<sigma> = 0x19899 \<and> RAX \<sigma> = term_printf_0x19884_retval \<and> RDX \<sigma> = ucast ((\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0xc),4]::32 word)) \<and> RDI \<sigma> = 0x219cc \<and> RSI \<sigma> = ucast ((\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0xc),4]::32 word)) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x8) \<and> (\<sigma> \<turnstile> *[0x2a498,8]::64 word) = (\<sigma> \<turnstile> *[0x2a498,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0xc),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0xc),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x38),8]::64 word) = (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x38),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x894),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x894),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = 0x19889\<close>
declare P_0x19899_true_51_def[Ps]

definition P_0x19899_true_51_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x19899_true_51_regions_set \<sigma> \<equiv> {
    (0, 0x2a498, 8),
    (1, RSP\<^sub>0, 8),
    (2, ((RBX \<sigma>::64 word) + 0xc), 4),
    (3, ((RBX \<sigma>::64 word) + 0x38), 8),
    (4, ((RBX \<sigma>::64 word) + 0x894), 4),
    (5, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x10), 8)
  }\<close>

definition P_0x19899_true_51_regions :: state_pred where
  \<open>P_0x19899_true_51_regions \<sigma> \<equiv> \<exists>regions. P_0x19899_true_51_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x199a5_51 :: state_pred where
  \<open>Q_0x199a5_51 \<sigma> \<equiv> RIP \<sigma> = 0x199a5 \<and> RAX \<sigma> = 0x0 \<and> RDX \<sigma> = ucast ((\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0xc),4]::32 word)) \<and> RDI \<sigma> = 0x21a18 \<and> RSI \<sigma> = ucast ((\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0xc),4]::32 word)) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x8) \<and> (\<sigma> \<turnstile> *[0x2a498,8]::64 word) = (\<sigma> \<turnstile> *[0x2a498,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0xc),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0xc),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x38),8]::64 word) = (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x38),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x894),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x894),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = 0x19889\<close>
declare Q_0x199a5_51_def[Qs]

schematic_goal bdrv_info_0_3_0x19899_0x199a3_51[blocks]:
  assumes \<open>(P_0x19899_true_51 && P_0x19899_true_51_regions && ZF) \<sigma>\<close>
  shows \<open>exec_block 3 0x199a3 51 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x199a5_51 ?\<sigma> \<and> block_usage P_0x19899_true_51_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x19899_true_51_def P_0x19899_true_51_regions_def post: Q_0x199a5_51_def regionset: P_0x19899_true_51_regions_set_def)

definition P_0x199a5_52 :: state_pred where
  \<open>P_0x199a5_52 \<sigma> \<equiv> RIP \<sigma> = 0x199a5 \<and> RAX \<sigma> = 0x0 \<and> RDX \<sigma> = ucast ((\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0xc),4]::32 word)) \<and> RDI \<sigma> = 0x21a18 \<and> RSI \<sigma> = ucast ((\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0xc),4]::32 word)) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x8) \<and> (\<sigma> \<turnstile> *[0x2a498,8]::64 word) = (\<sigma> \<turnstile> *[0x2a498,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0xc),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0xc),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x38),8]::64 word) = (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x38),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x894),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x894),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = 0x19889\<close>
declare P_0x199a5_52_def[Ps]

definition P_0x199a5_52_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x199a5_52_regions_set \<sigma> \<equiv> {
    (0, 0x2a498, 8),
    (1, RSP\<^sub>0, 8),
    (2, ((RBX \<sigma>::64 word) + 0xc), 4),
    (3, ((RBX \<sigma>::64 word) + 0x38), 8),
    (4, ((RBX \<sigma>::64 word) + 0x894), 4),
    (5, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x10), 8)
  }\<close>

definition P_0x199a5_52_regions :: state_pred where
  \<open>P_0x199a5_52_regions \<sigma> \<equiv> \<exists>regions. P_0x199a5_52_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_term_printf_addr_0x199a5_52 :: state_pred where
  \<open>Q_term_printf_addr_0x199a5_52 \<sigma> \<equiv> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x10) \<and> RIP \<sigma> = term_printf_addr \<and> RAX \<sigma> = 0x0 \<and> RDX \<sigma> = ucast ((\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0xc),4]::32 word)) \<and> RDI \<sigma> = 0x21a18 \<and> RSI \<sigma> = ucast ((\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0xc),4]::32 word)) \<and> (\<sigma> \<turnstile> *[0x2a498,8]::64 word) = (\<sigma> \<turnstile> *[0x2a498,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0xc),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0xc),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x38),8]::64 word) = (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x38),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x894),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x894),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = 0x199aa\<close>
declare Q_term_printf_addr_0x199a5_52_def[Qs]

schematic_goal bdrv_info_0_1_0x199a5_0x199a5_52[blocks]:
  assumes \<open>(P_0x199a5_52 && P_0x199a5_52_regions) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x199a5 52 \<sigma> \<triangleq> ?\<sigma> \<and> Q_term_printf_addr_0x199a5_52 ?\<sigma> \<and> block_usage P_0x199a5_52_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x199a5_52_def P_0x199a5_52_regions_def post: Q_term_printf_addr_0x199a5_52_def regionset: P_0x199a5_52_regions_set_def)

definition P_0x199aa_53 :: state_pred where
  \<open>P_0x199aa_53 \<sigma> \<equiv> RIP \<sigma> = 0x199aa \<and> RAX \<sigma> = term_printf_0x199a5_retval \<and> RDX \<sigma> = ucast ((\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0xc),4]::32 word)) \<and> RDI \<sigma> = 0x21a18 \<and> RSI \<sigma> = ucast ((\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0xc),4]::32 word)) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x8) \<and> (\<sigma> \<turnstile> *[0x2a498,8]::64 word) = (\<sigma> \<turnstile> *[0x2a498,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0xc),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0xc),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x38),8]::64 word) = (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x38),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x894),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x894),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = 0x199aa\<close>
declare P_0x199aa_53_def[Ps]

definition P_0x199aa_53_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x199aa_53_regions_set \<sigma> \<equiv> {
    (0, 0x2a498, 8),
    (1, RSP\<^sub>0, 8),
    (2, ((RBX \<sigma>::64 word) + 0xc), 4),
    (3, ((RBX \<sigma>::64 word) + 0x38), 8),
    (4, ((RBX \<sigma>::64 word) + 0x894), 4),
    (5, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x10), 8)
  }\<close>

definition P_0x199aa_53_regions :: state_pred where
  \<open>P_0x199aa_53_regions \<sigma> \<equiv> \<exists>regions. P_0x199aa_53_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x19912_53 :: state_pred where
  \<open>Q_0x19912_53 \<sigma> \<equiv> RIP \<sigma> = 0x19912 \<and> RDX \<sigma> = ucast ((\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0xc),4]::32 word)) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x8) \<and> (\<sigma> \<turnstile> *[0x2a498,8]::64 word) = (\<sigma> \<turnstile> *[0x2a498,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0xc),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0xc),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x38),8]::64 word) = (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x38),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x894),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x894),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = RBX\<^sub>0\<close>
declare Q_0x19912_53_def[Qs]

schematic_goal bdrv_info_0_1_0x199aa_0x199aa_53[blocks]:
  assumes \<open>(P_0x199aa_53 && P_0x199aa_53_regions) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x199aa 53 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x19912_53 ?\<sigma> \<and> block_usage P_0x199aa_53_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x199aa_53_def P_0x199aa_53_regions_def post: Q_0x19912_53_def regionset: P_0x199aa_53_regions_set_def)

definition P_0x19899_false_54 :: state_pred where
  \<open>P_0x19899_false_54 \<sigma> \<equiv> RIP \<sigma> = 0x19899 \<and> RAX \<sigma> = term_printf_0x19884_retval \<and> RDX \<sigma> = ucast ((\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0xc),4]::32 word)) \<and> RDI \<sigma> = 0x219cc \<and> RSI \<sigma> = ucast ((\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0xc),4]::32 word)) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x8) \<and> (\<sigma> \<turnstile> *[0x2a498,8]::64 word) = (\<sigma> \<turnstile> *[0x2a498,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0xc),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0xc),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x38),8]::64 word) = (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x38),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x894),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x894),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = 0x19889\<close>
declare P_0x19899_false_54_def[Ps]

definition P_0x19899_false_54_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x19899_false_54_regions_set \<sigma> \<equiv> {
    (0, 0x2a498, 8),
    (1, RSP\<^sub>0, 8),
    (2, ((RBX \<sigma>::64 word) + 0xc), 4),
    (3, ((RBX \<sigma>::64 word) + 0x38), 8),
    (4, ((RBX \<sigma>::64 word) + 0x894), 4),
    (5, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x10), 8)
  }\<close>

definition P_0x19899_false_54_regions :: state_pred where
  \<open>P_0x19899_false_54_regions \<sigma> \<equiv> \<exists>regions. P_0x19899_false_54_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x198a8_54 :: state_pred where
  \<open>Q_0x198a8_54 \<sigma> \<equiv> RIP \<sigma> = 0x198a8 \<and> RAX \<sigma> = 0x0 \<and> RDX \<sigma> = ucast ((\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0xc),4]::32 word)) \<and> RDI \<sigma> = 0x219e5 \<and> RSI \<sigma> = ucast ((\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0xc),4]::32 word)) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x8) \<and> (\<sigma> \<turnstile> *[0x2a498,8]::64 word) = (\<sigma> \<turnstile> *[0x2a498,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0xc),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0xc),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x38),8]::64 word) = (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x38),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x894),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x894),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = 0x19889\<close>
declare Q_0x198a8_54_def[Qs]

schematic_goal bdrv_info_0_3_0x19899_0x198a1_54[blocks]:
  assumes \<open>(P_0x19899_false_54 && P_0x19899_false_54_regions && ! ZF) \<sigma>\<close>
  shows \<open>exec_block 3 0x198a1 54 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x198a8_54 ?\<sigma> \<and> block_usage P_0x19899_false_54_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x19899_false_54_def P_0x19899_false_54_regions_def post: Q_0x198a8_54_def regionset: P_0x19899_false_54_regions_set_def)

definition P_0x198a8_55 :: state_pred where
  \<open>P_0x198a8_55 \<sigma> \<equiv> RIP \<sigma> = 0x198a8 \<and> RAX \<sigma> = 0x0 \<and> RDX \<sigma> = ucast ((\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0xc),4]::32 word)) \<and> RDI \<sigma> = 0x219e5 \<and> RSI \<sigma> = ucast ((\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0xc),4]::32 word)) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x8) \<and> (\<sigma> \<turnstile> *[0x2a498,8]::64 word) = (\<sigma> \<turnstile> *[0x2a498,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0xc),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0xc),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x38),8]::64 word) = (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x38),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x894),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x894),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = 0x19889\<close>
declare P_0x198a8_55_def[Ps]

definition P_0x198a8_55_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x198a8_55_regions_set \<sigma> \<equiv> {
    (0, 0x2a498, 8),
    (1, RSP\<^sub>0, 8),
    (2, ((RBX \<sigma>::64 word) + 0xc), 4),
    (3, ((RBX \<sigma>::64 word) + 0x38), 8),
    (4, ((RBX \<sigma>::64 word) + 0x894), 4),
    (5, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x10), 8)
  }\<close>

definition P_0x198a8_55_regions :: state_pred where
  \<open>P_0x198a8_55_regions \<sigma> \<equiv> \<exists>regions. P_0x198a8_55_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_term_printf_addr_0x198a8_55 :: state_pred where
  \<open>Q_term_printf_addr_0x198a8_55 \<sigma> \<equiv> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x10) \<and> RIP \<sigma> = term_printf_addr \<and> RAX \<sigma> = 0x0 \<and> RDX \<sigma> = ucast ((\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0xc),4]::32 word)) \<and> RDI \<sigma> = 0x219e5 \<and> RSI \<sigma> = ucast ((\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0xc),4]::32 word)) \<and> (\<sigma> \<turnstile> *[0x2a498,8]::64 word) = (\<sigma> \<turnstile> *[0x2a498,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0xc),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0xc),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x38),8]::64 word) = (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x38),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x894),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x894),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = 0x198ad\<close>
declare Q_term_printf_addr_0x198a8_55_def[Qs]

schematic_goal bdrv_info_0_1_0x198a8_0x198a8_55[blocks]:
  assumes \<open>(P_0x198a8_55 && P_0x198a8_55_regions) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x198a8 55 \<sigma> \<triangleq> ?\<sigma> \<and> Q_term_printf_addr_0x198a8_55 ?\<sigma> \<and> block_usage P_0x198a8_55_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x198a8_55_def P_0x198a8_55_regions_def post: Q_term_printf_addr_0x198a8_55_def regionset: P_0x198a8_55_regions_set_def)

definition P_0x198ad_56 :: state_pred where
  \<open>P_0x198ad_56 \<sigma> \<equiv> RIP \<sigma> = 0x198ad \<and> RAX \<sigma> = term_printf_0x198a8_retval \<and> RDX \<sigma> = ucast ((\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0xc),4]::32 word)) \<and> RDI \<sigma> = 0x219e5 \<and> RSI \<sigma> = ucast ((\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0xc),4]::32 word)) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x8) \<and> (\<sigma> \<turnstile> *[0x2a498,8]::64 word) = (\<sigma> \<turnstile> *[0x2a498,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0xc),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0xc),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x38),8]::64 word) = (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x38),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x894),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x894),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = 0x198ad\<close>
declare P_0x198ad_56_def[Ps]

definition P_0x198ad_56_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x198ad_56_regions_set \<sigma> \<equiv> {
    (0, 0x2a498, 8),
    (1, RSP\<^sub>0, 8),
    (2, ((RBX \<sigma>::64 word) + 0xc), 4),
    (3, ((RBX \<sigma>::64 word) + 0x38), 8),
    (4, ((RBX \<sigma>::64 word) + 0x894), 4),
    (5, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x10), 8)
  }\<close>

definition P_0x198ad_56_regions :: state_pred where
  \<open>P_0x198ad_56_regions \<sigma> \<equiv> \<exists>regions. P_0x198ad_56_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x198b1_56 :: state_pred where
  \<open>Q_0x198b1_56 \<sigma> \<equiv> RIP \<sigma> = 0x198b1 \<and> RAX \<sigma> = term_printf_0x198a8_retval \<and> RDX \<sigma> = ucast ((\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0xc),4]::32 word)) \<and> RDI \<sigma> = ((RBX \<sigma>::64 word) + 0x48) \<and> RSI \<sigma> = ucast ((\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0xc),4]::32 word)) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x8) \<and> (\<sigma> \<turnstile> *[0x2a498,8]::64 word) = (\<sigma> \<turnstile> *[0x2a498,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0xc),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0xc),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x38),8]::64 word) = (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x38),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x894),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x894),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = 0x198ad\<close>
declare Q_0x198b1_56_def[Qs]

schematic_goal bdrv_info_0_1_0x198ad_0x198ad_56[blocks]:
  assumes \<open>(P_0x198ad_56 && P_0x198ad_56_regions) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x198ad 56 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x198b1_56 ?\<sigma> \<and> block_usage P_0x198ad_56_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x198ad_56_def P_0x198ad_56_regions_def post: Q_0x198b1_56_def regionset: P_0x198ad_56_regions_set_def)

definition P_0x198b1_57 :: state_pred where
  \<open>P_0x198b1_57 \<sigma> \<equiv> RIP \<sigma> = 0x198b1 \<and> RAX \<sigma> = term_printf_0x198a8_retval \<and> RDX \<sigma> = ucast ((\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0xc),4]::32 word)) \<and> RDI \<sigma> = ((RBX \<sigma>::64 word) + 0x48) \<and> RSI \<sigma> = ucast ((\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0xc),4]::32 word)) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x8) \<and> (\<sigma> \<turnstile> *[0x2a498,8]::64 word) = (\<sigma> \<turnstile> *[0x2a498,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0xc),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0xc),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x38),8]::64 word) = (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x38),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x894),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x894),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = 0x198ad\<close>
declare P_0x198b1_57_def[Ps]

definition P_0x198b1_57_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x198b1_57_regions_set \<sigma> \<equiv> {
    (0, 0x2a498, 8),
    (1, RSP\<^sub>0, 8),
    (2, ((RBX \<sigma>::64 word) + 0xc), 4),
    (3, ((RBX \<sigma>::64 word) + 0x38), 8),
    (4, ((RBX \<sigma>::64 word) + 0x894), 4),
    (5, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x10), 8)
  }\<close>

definition P_0x198b1_57_regions :: state_pred where
  \<open>P_0x198b1_57_regions \<sigma> \<equiv> \<exists>regions. P_0x198b1_57_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_term_print_filename_addr_0x198b1_57 :: state_pred where
  \<open>Q_term_print_filename_addr_0x198b1_57 \<sigma> \<equiv> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x10) \<and> RIP \<sigma> = term_print_filename_addr \<and> RAX \<sigma> = term_printf_0x198a8_retval \<and> RDX \<sigma> = ucast ((\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0xc),4]::32 word)) \<and> RDI \<sigma> = ((RBX \<sigma>::64 word) + 0x48) \<and> RSI \<sigma> = ucast ((\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0xc),4]::32 word)) \<and> (\<sigma> \<turnstile> *[0x2a498,8]::64 word) = (\<sigma> \<turnstile> *[0x2a498,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0xc),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0xc),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x38),8]::64 word) = (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x38),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x894),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x894),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = 0x198b6\<close>
declare Q_term_print_filename_addr_0x198b1_57_def[Qs]

schematic_goal bdrv_info_0_1_0x198b1_0x198b1_57[blocks]:
  assumes \<open>(P_0x198b1_57 && P_0x198b1_57_regions) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x198b1 57 \<sigma> \<triangleq> ?\<sigma> \<and> Q_term_print_filename_addr_0x198b1_57 ?\<sigma> \<and> block_usage P_0x198b1_57_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x198b1_57_def P_0x198b1_57_regions_def post: Q_term_print_filename_addr_0x198b1_57_def regionset: P_0x198b1_57_regions_set_def)

definition P_0x198b6_58 :: state_pred where
  \<open>P_0x198b6_58 \<sigma> \<equiv> RIP \<sigma> = 0x198b6 \<and> RAX \<sigma> = term_print_filename_0x198b1_retval \<and> RDX \<sigma> = ucast ((\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0xc),4]::32 word)) \<and> RDI \<sigma> = ((RBX \<sigma>::64 word) + 0x48) \<and> RSI \<sigma> = ucast ((\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0xc),4]::32 word)) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x8) \<and> (\<sigma> \<turnstile> *[0x2a498,8]::64 word) = (\<sigma> \<turnstile> *[0x2a498,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0xc),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0xc),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x38),8]::64 word) = (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x38),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x894),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x894),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = 0x198b6\<close>
declare P_0x198b6_58_def[Ps]

definition P_0x198b6_58_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x198b6_58_regions_set \<sigma> \<equiv> {
    (0, 0x2a498, 8),
    (1, RSP\<^sub>0, 8),
    (2, ((RBX \<sigma>::64 word) + 0xc), 4),
    (3, ((RBX \<sigma>::64 word) + 0x38), 8),
    (4, ((RBX \<sigma>::64 word) + 0x448), Suc 0),
    (5, ((RBX \<sigma>::64 word) + 0x894), 4),
    (6, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x10), 8)
  }\<close>

definition P_0x198b6_58_regions :: state_pred where
  \<open>P_0x198b6_58_regions \<sigma> \<equiv> \<exists>regions. P_0x198b6_58_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x198bd_58 :: state_pred where
  \<open>Q_0x198bd_58 \<sigma> \<equiv> RIP \<sigma> = 0x198bd \<and> RAX \<sigma> = term_print_filename_0x198b1_retval \<and> RDX \<sigma> = ucast ((\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0xc),4]::32 word)) \<and> RDI \<sigma> = ((RBX \<sigma>::64 word) + 0x48) \<and> RSI \<sigma> = ucast ((\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0xc),4]::32 word)) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x8) \<and> (\<sigma> \<turnstile> *[0x2a498,8]::64 word) = (\<sigma> \<turnstile> *[0x2a498,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0xc),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0xc),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x38),8]::64 word) = (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x38),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x448),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x448),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x894),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x894),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = 0x198b6\<close>
declare Q_0x198bd_58_def[Qs]

schematic_goal bdrv_info_0_1_0x198b6_0x198b6_58[blocks]:
  assumes \<open>(P_0x198b6_58 && P_0x198b6_58_regions) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x198b6 58 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x198bd_58 ?\<sigma> \<and> block_usage P_0x198b6_58_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x198b6_58_def P_0x198b6_58_regions_def post: Q_0x198bd_58_def regionset: P_0x198b6_58_regions_set_def)

definition P_0x198bd_true_59 :: state_pred where
  \<open>P_0x198bd_true_59 \<sigma> \<equiv> RIP \<sigma> = 0x198bd \<and> RAX \<sigma> = term_print_filename_0x198b1_retval \<and> RDX \<sigma> = ucast ((\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0xc),4]::32 word)) \<and> RDI \<sigma> = ((RBX \<sigma>::64 word) + 0x48) \<and> RSI \<sigma> = ucast ((\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0xc),4]::32 word)) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x8) \<and> (\<sigma> \<turnstile> *[0x2a498,8]::64 word) = (\<sigma> \<turnstile> *[0x2a498,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0xc),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0xc),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x38),8]::64 word) = (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x38),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x448),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x448),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x894),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x894),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = 0x198b6\<close>
declare P_0x198bd_true_59_def[Ps]

definition P_0x198bd_true_59_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x198bd_true_59_regions_set \<sigma> \<equiv> {
    (0, 0x2a498, 8),
    (1, RSP\<^sub>0, 8),
    (2, ((RBX \<sigma>::64 word) + 0xc), 4),
    (3, ((RBX \<sigma>::64 word) + 0x38), 8),
    (4, ((RBX \<sigma>::64 word) + 0x448), Suc 0),
    (5, ((RBX \<sigma>::64 word) + 0x894), 4),
    (6, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x10), 8)
  }\<close>

definition P_0x198bd_true_59_regions :: state_pred where
  \<open>P_0x198bd_true_59_regions \<sigma> \<equiv> \<exists>regions. P_0x198bd_true_59_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x199e9_59 :: state_pred where
  \<open>Q_0x199e9_59 \<sigma> \<equiv> RIP \<sigma> = 0x199e9 \<and> RAX \<sigma> = 0x0 \<and> RDX \<sigma> = ucast ((\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0xc),4]::32 word)) \<and> RDI \<sigma> = 0x219ec \<and> RSI \<sigma> = ucast ((\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0xc),4]::32 word)) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x8) \<and> (\<sigma> \<turnstile> *[0x2a498,8]::64 word) = (\<sigma> \<turnstile> *[0x2a498,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0xc),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0xc),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x38),8]::64 word) = (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x38),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x448),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x448),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x894),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x894),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = 0x198b6\<close>
declare Q_0x199e9_59_def[Qs]

schematic_goal bdrv_info_0_3_0x198bd_0x199e7_59[blocks]:
  assumes \<open>(P_0x198bd_true_59 && P_0x198bd_true_59_regions && !ZF) \<sigma>\<close>
  shows \<open>exec_block 3 0x199e7 59 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x199e9_59 ?\<sigma> \<and> block_usage P_0x198bd_true_59_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x198bd_true_59_def P_0x198bd_true_59_regions_def post: Q_0x199e9_59_def regionset: P_0x198bd_true_59_regions_set_def)

definition P_0x199e9_60 :: state_pred where
  \<open>P_0x199e9_60 \<sigma> \<equiv> RIP \<sigma> = 0x199e9 \<and> RAX \<sigma> = 0x0 \<and> RDX \<sigma> = ucast ((\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0xc),4]::32 word)) \<and> RDI \<sigma> = 0x219ec \<and> RSI \<sigma> = ucast ((\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0xc),4]::32 word)) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x8) \<and> (\<sigma> \<turnstile> *[0x2a498,8]::64 word) = (\<sigma> \<turnstile> *[0x2a498,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0xc),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0xc),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x38),8]::64 word) = (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x38),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x448),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x448),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x894),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x894),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = 0x198b6\<close>
declare P_0x199e9_60_def[Ps]

definition P_0x199e9_60_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x199e9_60_regions_set \<sigma> \<equiv> {
    (0, 0x2a498, 8),
    (1, RSP\<^sub>0, 8),
    (2, ((RBX \<sigma>::64 word) + 0xc), 4),
    (3, ((RBX \<sigma>::64 word) + 0x38), 8),
    (4, ((RBX \<sigma>::64 word) + 0x448), Suc 0),
    (5, ((RBX \<sigma>::64 word) + 0x894), 4),
    (6, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x10), 8)
  }\<close>

definition P_0x199e9_60_regions :: state_pred where
  \<open>P_0x199e9_60_regions \<sigma> \<equiv> \<exists>regions. P_0x199e9_60_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_term_printf_addr_0x199e9_60 :: state_pred where
  \<open>Q_term_printf_addr_0x199e9_60 \<sigma> \<equiv> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x10) \<and> RIP \<sigma> = term_printf_addr \<and> RAX \<sigma> = 0x0 \<and> RDX \<sigma> = ucast ((\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0xc),4]::32 word)) \<and> RDI \<sigma> = 0x219ec \<and> RSI \<sigma> = ucast ((\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0xc),4]::32 word)) \<and> (\<sigma> \<turnstile> *[0x2a498,8]::64 word) = (\<sigma> \<turnstile> *[0x2a498,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0xc),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0xc),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x38),8]::64 word) = (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x38),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x448),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x448),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x894),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x894),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = 0x199ee\<close>
declare Q_term_printf_addr_0x199e9_60_def[Qs]

schematic_goal bdrv_info_0_1_0x199e9_0x199e9_60[blocks]:
  assumes \<open>(P_0x199e9_60 && P_0x199e9_60_regions) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x199e9 60 \<sigma> \<triangleq> ?\<sigma> \<and> Q_term_printf_addr_0x199e9_60 ?\<sigma> \<and> block_usage P_0x199e9_60_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x199e9_60_def P_0x199e9_60_regions_def post: Q_term_printf_addr_0x199e9_60_def regionset: P_0x199e9_60_regions_set_def)

definition P_0x199ee_61 :: state_pred where
  \<open>P_0x199ee_61 \<sigma> \<equiv> RIP \<sigma> = 0x199ee \<and> RAX \<sigma> = term_printf_0x199e9_retval \<and> RDX \<sigma> = ucast ((\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0xc),4]::32 word)) \<and> RDI \<sigma> = 0x219ec \<and> RSI \<sigma> = ucast ((\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0xc),4]::32 word)) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x8) \<and> (\<sigma> \<turnstile> *[0x2a498,8]::64 word) = (\<sigma> \<turnstile> *[0x2a498,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0xc),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0xc),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x38),8]::64 word) = (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x38),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x448),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x448),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x894),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x894),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = 0x199ee\<close>
declare P_0x199ee_61_def[Ps]

definition P_0x199ee_61_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x199ee_61_regions_set \<sigma> \<equiv> {
    (0, 0x2a498, 8),
    (1, RSP\<^sub>0, 8),
    (2, ((RBX \<sigma>::64 word) + 0xc), 4),
    (3, ((RBX \<sigma>::64 word) + 0x38), 8),
    (4, ((RBX \<sigma>::64 word) + 0x448), Suc 0),
    (5, ((RBX \<sigma>::64 word) + 0x894), 4),
    (6, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x10), 8)
  }\<close>

definition P_0x199ee_61_regions :: state_pred where
  \<open>P_0x199ee_61_regions \<sigma> \<equiv> \<exists>regions. P_0x199ee_61_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x199f5_61 :: state_pred where
  \<open>Q_0x199f5_61 \<sigma> \<equiv> RIP \<sigma> = 0x199f5 \<and> RAX \<sigma> = term_printf_0x199e9_retval \<and> RDX \<sigma> = ucast ((\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0xc),4]::32 word)) \<and> RDI \<sigma> = ((RBX \<sigma>::64 word) + 0x448) \<and> RSI \<sigma> = ucast ((\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0xc),4]::32 word)) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x8) \<and> (\<sigma> \<turnstile> *[0x2a498,8]::64 word) = (\<sigma> \<turnstile> *[0x2a498,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0xc),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0xc),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x38),8]::64 word) = (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x38),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x448),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x448),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x894),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x894),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = 0x199ee\<close>
declare Q_0x199f5_61_def[Qs]

schematic_goal bdrv_info_0_1_0x199ee_0x199ee_61[blocks]:
  assumes \<open>(P_0x199ee_61 && P_0x199ee_61_regions) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x199ee 61 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x199f5_61 ?\<sigma> \<and> block_usage P_0x199ee_61_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x199ee_61_def P_0x199ee_61_regions_def post: Q_0x199f5_61_def regionset: P_0x199ee_61_regions_set_def)

definition P_0x199f5_62 :: state_pred where
  \<open>P_0x199f5_62 \<sigma> \<equiv> RIP \<sigma> = 0x199f5 \<and> RAX \<sigma> = term_printf_0x199e9_retval \<and> RDX \<sigma> = ucast ((\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0xc),4]::32 word)) \<and> RDI \<sigma> = ((RBX \<sigma>::64 word) + 0x448) \<and> RSI \<sigma> = ucast ((\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0xc),4]::32 word)) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x8) \<and> (\<sigma> \<turnstile> *[0x2a498,8]::64 word) = (\<sigma> \<turnstile> *[0x2a498,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0xc),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0xc),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x38),8]::64 word) = (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x38),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x448),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x448),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x894),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x894),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = 0x199ee\<close>
declare P_0x199f5_62_def[Ps]

definition P_0x199f5_62_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x199f5_62_regions_set \<sigma> \<equiv> {
    (0, 0x2a498, 8),
    (1, RSP\<^sub>0, 8),
    (2, ((RBX \<sigma>::64 word) + 0xc), 4),
    (3, ((RBX \<sigma>::64 word) + 0x38), 8),
    (4, ((RBX \<sigma>::64 word) + 0x448), Suc 0),
    (5, ((RBX \<sigma>::64 word) + 0x894), 4),
    (6, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x10), 8)
  }\<close>

definition P_0x199f5_62_regions :: state_pred where
  \<open>P_0x199f5_62_regions \<sigma> \<equiv> \<exists>regions. P_0x199f5_62_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_term_print_filename_addr_0x199f5_62 :: state_pred where
  \<open>Q_term_print_filename_addr_0x199f5_62 \<sigma> \<equiv> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x10) \<and> RIP \<sigma> = term_print_filename_addr \<and> RAX \<sigma> = term_printf_0x199e9_retval \<and> RDX \<sigma> = ucast ((\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0xc),4]::32 word)) \<and> RDI \<sigma> = ((RBX \<sigma>::64 word) + 0x448) \<and> RSI \<sigma> = ucast ((\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0xc),4]::32 word)) \<and> (\<sigma> \<turnstile> *[0x2a498,8]::64 word) = (\<sigma> \<turnstile> *[0x2a498,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0xc),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0xc),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x38),8]::64 word) = (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x38),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x448),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x448),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x894),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x894),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = 0x199fa\<close>
declare Q_term_print_filename_addr_0x199f5_62_def[Qs]

schematic_goal bdrv_info_0_1_0x199f5_0x199f5_62[blocks]:
  assumes \<open>(P_0x199f5_62 && P_0x199f5_62_regions) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x199f5 62 \<sigma> \<triangleq> ?\<sigma> \<and> Q_term_print_filename_addr_0x199f5_62 ?\<sigma> \<and> block_usage P_0x199f5_62_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x199f5_62_def P_0x199f5_62_regions_def post: Q_term_print_filename_addr_0x199f5_62_def regionset: P_0x199f5_62_regions_set_def)

definition P_0x199fa_63 :: state_pred where
  \<open>P_0x199fa_63 \<sigma> \<equiv> RIP \<sigma> = 0x199fa \<and> RAX \<sigma> = term_print_filename_0x199f5_retval \<and> RDX \<sigma> = ucast ((\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0xc),4]::32 word)) \<and> RDI \<sigma> = ((RBX \<sigma>::64 word) + 0x448) \<and> RSI \<sigma> = ucast ((\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0xc),4]::32 word)) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x8) \<and> (\<sigma> \<turnstile> *[0x2a498,8]::64 word) = (\<sigma> \<turnstile> *[0x2a498,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0xc),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0xc),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x38),8]::64 word) = (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x38),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x448),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x448),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x894),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x894),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = 0x199fa\<close>
declare P_0x199fa_63_def[Ps]

definition P_0x199fa_63_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x199fa_63_regions_set \<sigma> \<equiv> {
    (0, 0x2a498, 8),
    (1, RSP\<^sub>0, 8),
    (2, ((RBX \<sigma>::64 word) + 0xc), 4),
    (3, ((RBX \<sigma>::64 word) + 0x38), 8),
    (4, ((RBX \<sigma>::64 word) + 0x448), Suc 0),
    (5, ((RBX \<sigma>::64 word) + 0x894), 4),
    (6, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x10), 8)
  }\<close>

definition P_0x199fa_63_regions :: state_pred where
  \<open>P_0x199fa_63_regions \<sigma> \<equiv> \<exists>regions. P_0x199fa_63_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x198c3_63 :: state_pred where
  \<open>Q_0x198c3_63 \<sigma> \<equiv> RIP \<sigma> = 0x198c3 \<and> RDX \<sigma> = ucast ((\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0xc),4]::32 word)) \<and> RSI \<sigma> = ucast ((\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0xc),4]::32 word)) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x8) \<and> (\<sigma> \<turnstile> *[0x2a498,8]::64 word) = (\<sigma> \<turnstile> *[0x2a498,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0xc),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0xc),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x38),8]::64 word) = (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x38),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x448),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x448),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x894),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x894),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = RBX\<^sub>0\<close>
declare Q_0x198c3_63_def[Qs]

schematic_goal bdrv_info_0_1_0x199fa_0x199fa_63[blocks]:
  assumes \<open>(P_0x199fa_63 && P_0x199fa_63_regions) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x199fa 63 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x198c3_63 ?\<sigma> \<and> block_usage P_0x199fa_63_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x199fa_63_def P_0x199fa_63_regions_def post: Q_0x198c3_63_def regionset: P_0x199fa_63_regions_set_def)

definition P_0x198bd_false_64 :: state_pred where
  \<open>P_0x198bd_false_64 \<sigma> \<equiv> RIP \<sigma> = 0x198bd \<and> RAX \<sigma> = term_print_filename_0x198b1_retval \<and> RDX \<sigma> = ucast ((\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0xc),4]::32 word)) \<and> RDI \<sigma> = ((RBX \<sigma>::64 word) + 0x48) \<and> RSI \<sigma> = ucast ((\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0xc),4]::32 word)) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x8) \<and> (\<sigma> \<turnstile> *[0x2a498,8]::64 word) = (\<sigma> \<turnstile> *[0x2a498,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0xc),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0xc),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x38),8]::64 word) = (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x38),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x448),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x448),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x894),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x894),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = 0x198b6\<close>
declare P_0x198bd_false_64_def[Ps]

definition P_0x198bd_false_64_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x198bd_false_64_regions_set \<sigma> \<equiv> {
    (0, 0x2a498, 8),
    (1, RSP\<^sub>0, 8),
    (2, ((RBX \<sigma>::64 word) + 0xc), 4),
    (3, ((RBX \<sigma>::64 word) + 0x38), 8),
    (4, ((RBX \<sigma>::64 word) + 0x448), Suc 0),
    (5, ((RBX \<sigma>::64 word) + 0x894), 4),
    (6, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x10), 8)
  }\<close>

definition P_0x198bd_false_64_regions :: state_pred where
  \<open>P_0x198bd_false_64_regions \<sigma> \<equiv> \<exists>regions. P_0x198bd_false_64_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x198c3_64 :: state_pred where
  \<open>Q_0x198c3_64 \<sigma> \<equiv> RIP \<sigma> = 0x198c3 \<and> RDX \<sigma> = ucast ((\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0xc),4]::32 word)) \<and> RSI \<sigma> = ucast ((\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0xc),4]::32 word)) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x8) \<and> (\<sigma> \<turnstile> *[0x2a498,8]::64 word) = (\<sigma> \<turnstile> *[0x2a498,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0xc),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0xc),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x38),8]::64 word) = (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x38),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x448),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x448),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x894),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x894),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = RBX\<^sub>0\<close>
declare Q_0x198c3_64_def[Qs]

schematic_goal bdrv_info_0_1_0x198bd_0x198bd_64[blocks]:
  assumes \<open>(P_0x198bd_false_64 && P_0x198bd_false_64_regions && ! !ZF) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x198bd 64 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x198c3_64 ?\<sigma> \<and> block_usage P_0x198bd_false_64_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x198bd_false_64_def P_0x198bd_false_64_regions_def post: Q_0x198c3_64_def regionset: P_0x198bd_false_64_regions_set_def)

definition P_0x198c3_65 :: state_pred where
  \<open>P_0x198c3_65 \<sigma> \<equiv> RIP \<sigma> = 0x198c3 \<and> RDX \<sigma> = ucast ((\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0xc),4]::32 word)) \<and> RSI \<sigma> = ucast ((\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0xc),4]::32 word)) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x8) \<and> (\<sigma> \<turnstile> *[0x2a498,8]::64 word) = (\<sigma> \<turnstile> *[0x2a498,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0xc),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0xc),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x38),8]::64 word) = (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x38),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x448),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x448),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x894),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x894),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = RBX\<^sub>0\<close>
declare P_0x198c3_65_def[Ps]

definition P_0x198c3_65_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x198c3_65_regions_set \<sigma> \<equiv> {
    (0, 0x2a498, 8),
    (1, RSP\<^sub>0, 8),
    (2, ((RBX \<sigma>::64 word) + 0x8), 4),
    (3, ((RBX \<sigma>::64 word) + 0xc), 4),
    (4, ((RBX \<sigma>::64 word) + 0x38), 8),
    (5, ((RBX \<sigma>::64 word) + 0x448), Suc 0),
    (6, ((RBX \<sigma>::64 word) + 0x894), 4),
    (7, ((RSP\<^sub>0::64 word) - 0x8), 8)
  }\<close>

definition P_0x198c3_65_regions :: state_pred where
  \<open>P_0x198c3_65_regions \<sigma> \<equiv> \<exists>regions. P_0x198c3_65_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x198cf_65 :: state_pred where
  \<open>Q_0x198cf_65 \<sigma> \<equiv> RIP \<sigma> = 0x198cf \<and> RAX \<sigma> = 0x0 \<and> RDX \<sigma> = ucast ((\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0xc),4]::32 word)) \<and> RDI \<sigma> = 0x219fb \<and> RSI \<sigma> = ucast ((\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x8),4]::32 word)) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x8) \<and> (\<sigma> \<turnstile> *[0x2a498,8]::64 word) = (\<sigma> \<turnstile> *[0x2a498,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x8),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x8),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0xc),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0xc),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x38),8]::64 word) = (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x38),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x448),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x448),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x894),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x894),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = RBX\<^sub>0\<close>
declare Q_0x198cf_65_def[Qs]

schematic_goal bdrv_info_0_3_0x198c3_0x198cd_65[blocks]:
  assumes \<open>(P_0x198c3_65 && P_0x198c3_65_regions) \<sigma>\<close>
  shows \<open>exec_block 3 0x198cd 65 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x198cf_65 ?\<sigma> \<and> block_usage P_0x198c3_65_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x198c3_65_def P_0x198c3_65_regions_def post: Q_0x198cf_65_def regionset: P_0x198c3_65_regions_set_def)

definition P_0x198cf_66 :: state_pred where
  \<open>P_0x198cf_66 \<sigma> \<equiv> RIP \<sigma> = 0x198cf \<and> RAX \<sigma> = 0x0 \<and> RDX \<sigma> = ucast ((\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0xc),4]::32 word)) \<and> RDI \<sigma> = 0x219fb \<and> RSI \<sigma> = ucast ((\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x8),4]::32 word)) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x8) \<and> (\<sigma> \<turnstile> *[0x2a498,8]::64 word) = (\<sigma> \<turnstile> *[0x2a498,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x8),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x8),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0xc),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0xc),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x38),8]::64 word) = (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x38),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x448),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x448),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x894),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x894),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = RBX\<^sub>0\<close>
declare P_0x198cf_66_def[Ps]

definition P_0x198cf_66_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x198cf_66_regions_set \<sigma> \<equiv> {
    (0, 0x2a498, 8),
    (1, RSP\<^sub>0, 8),
    (2, ((RBX \<sigma>::64 word) + 0x8), 4),
    (3, ((RBX \<sigma>::64 word) + 0xc), 4),
    (4, ((RBX \<sigma>::64 word) + 0x38), 8),
    (5, ((RBX \<sigma>::64 word) + 0x448), Suc 0),
    (6, ((RBX \<sigma>::64 word) + 0x894), 4),
    (7, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x10), 8)
  }\<close>

definition P_0x198cf_66_regions :: state_pred where
  \<open>P_0x198cf_66_regions \<sigma> \<equiv> \<exists>regions. P_0x198cf_66_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_term_printf_addr_0x198cf_66 :: state_pred where
  \<open>Q_term_printf_addr_0x198cf_66 \<sigma> \<equiv> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x10) \<and> RIP \<sigma> = term_printf_addr \<and> RAX \<sigma> = 0x0 \<and> RDX \<sigma> = ucast ((\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0xc),4]::32 word)) \<and> RDI \<sigma> = 0x219fb \<and> RSI \<sigma> = ucast ((\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x8),4]::32 word)) \<and> (\<sigma> \<turnstile> *[0x2a498,8]::64 word) = (\<sigma> \<turnstile> *[0x2a498,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x8),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x8),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0xc),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0xc),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x38),8]::64 word) = (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x38),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x448),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x448),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x894),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x894),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = 0x198d4\<close>
declare Q_term_printf_addr_0x198cf_66_def[Qs]

schematic_goal bdrv_info_0_1_0x198cf_0x198cf_66[blocks]:
  assumes \<open>(P_0x198cf_66 && P_0x198cf_66_regions) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x198cf 66 \<sigma> \<triangleq> ?\<sigma> \<and> Q_term_printf_addr_0x198cf_66 ?\<sigma> \<and> block_usage P_0x198cf_66_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x198cf_66_def P_0x198cf_66_regions_def post: Q_term_printf_addr_0x198cf_66_def regionset: P_0x198cf_66_regions_set_def)

definition P_0x198d4_67 :: state_pred where
  \<open>P_0x198d4_67 \<sigma> \<equiv> RIP \<sigma> = 0x198d4 \<and> RAX \<sigma> = term_printf_0x198cf_retval \<and> RDX \<sigma> = ucast ((\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0xc),4]::32 word)) \<and> RDI \<sigma> = 0x219fb \<and> RSI \<sigma> = ucast ((\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x8),4]::32 word)) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x8) \<and> (\<sigma> \<turnstile> *[0x2a498,8]::64 word) = (\<sigma> \<turnstile> *[0x2a498,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x8),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x8),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0xc),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0xc),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x38),8]::64 word) = (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x38),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x448),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x448),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x894),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x894),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = 0x198d4\<close>
declare P_0x198d4_67_def[Ps]

definition P_0x198d4_67_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x198d4_67_regions_set \<sigma> \<equiv> {
    (0, 0x2a498, 8),
    (1, RSP\<^sub>0, 8),
    (2, ((RBX \<sigma>::64 word) + 0x8), 4),
    (3, ((RBX \<sigma>::64 word) + 0xc), 4),
    (4, ((RBX \<sigma>::64 word) + 0x38), 8),
    (5, ((RBX \<sigma>::64 word) + 0x448), Suc 0),
    (6, ((RBX \<sigma>::64 word) + 0x894), 4),
    (7, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (9, (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x38),8]::64 word), 8)
  }\<close>

definition P_0x198d4_67_regions :: state_pred where
  \<open>P_0x198d4_67_regions \<sigma> \<equiv> \<exists>regions. P_0x198d4_67_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x198e4_67 :: state_pred where
  \<open>Q_0x198e4_67 \<sigma> \<equiv> RIP \<sigma> = 0x198e4 \<and> RAX \<sigma> = 0x0 \<and> RDX \<sigma> = ucast ((\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0xc),4]::32 word)) \<and> RDI \<sigma> = 0x21a02 \<and> RSI \<sigma> = (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x38),8]::64 word),8]::64 word) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x8) \<and> (\<sigma> \<turnstile> *[0x2a498,8]::64 word) = (\<sigma> \<turnstile> *[0x2a498,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x8),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x8),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0xc),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0xc),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x38),8]::64 word) = (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x38),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x448),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x448),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x894),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x894),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = 0x198d4 \<and> (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x38),8]::64 word),8]::64 word) = (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x38),8]::64 word),8]::64 word)\<close>
declare Q_0x198e4_67_def[Qs]

schematic_goal bdrv_info_0_4_0x198d4_0x198e2_67[blocks]:
  assumes \<open>(P_0x198d4_67 && P_0x198d4_67_regions) \<sigma>\<close>
  shows \<open>exec_block 4 0x198e2 67 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x198e4_67 ?\<sigma> \<and> block_usage P_0x198d4_67_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x198d4_67_def P_0x198d4_67_regions_def post: Q_0x198e4_67_def regionset: P_0x198d4_67_regions_set_def)

definition P_0x198e4_68 :: state_pred where
  \<open>P_0x198e4_68 \<sigma> \<equiv> RIP \<sigma> = 0x198e4 \<and> RAX \<sigma> = 0x0 \<and> RDX \<sigma> = ucast ((\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0xc),4]::32 word)) \<and> RDI \<sigma> = 0x21a02 \<and> RSI \<sigma> = (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x38),8]::64 word),8]::64 word) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x8) \<and> (\<sigma> \<turnstile> *[0x2a498,8]::64 word) = (\<sigma> \<turnstile> *[0x2a498,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x8),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x8),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0xc),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0xc),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x38),8]::64 word) = (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x38),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x448),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x448),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x894),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x894),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = 0x198d4 \<and> (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x38),8]::64 word),8]::64 word) = (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x38),8]::64 word),8]::64 word)\<close>
declare P_0x198e4_68_def[Ps]

definition P_0x198e4_68_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x198e4_68_regions_set \<sigma> \<equiv> {
    (0, 0x2a498, 8),
    (1, RSP\<^sub>0, 8),
    (2, ((RBX \<sigma>::64 word) + 0x8), 4),
    (3, ((RBX \<sigma>::64 word) + 0xc), 4),
    (4, ((RBX \<sigma>::64 word) + 0x38), 8),
    (5, ((RBX \<sigma>::64 word) + 0x448), Suc 0),
    (6, ((RBX \<sigma>::64 word) + 0x894), 4),
    (7, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (9, (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x38),8]::64 word), 8)
  }\<close>

definition P_0x198e4_68_regions :: state_pred where
  \<open>P_0x198e4_68_regions \<sigma> \<equiv> \<exists>regions. P_0x198e4_68_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_term_printf_addr_0x198e4_68 :: state_pred where
  \<open>Q_term_printf_addr_0x198e4_68 \<sigma> \<equiv> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x10) \<and> RIP \<sigma> = term_printf_addr \<and> RAX \<sigma> = 0x0 \<and> RDX \<sigma> = ucast ((\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0xc),4]::32 word)) \<and> RDI \<sigma> = 0x21a02 \<and> RSI \<sigma> = (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x38),8]::64 word),8]::64 word) \<and> (\<sigma> \<turnstile> *[0x2a498,8]::64 word) = (\<sigma> \<turnstile> *[0x2a498,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x8),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x8),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0xc),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0xc),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x38),8]::64 word) = (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x38),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x448),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x448),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x894),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x894),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = 0x198e9 \<and> (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x38),8]::64 word),8]::64 word) = (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x38),8]::64 word),8]::64 word)\<close>
declare Q_term_printf_addr_0x198e4_68_def[Qs]

schematic_goal bdrv_info_0_1_0x198e4_0x198e4_68[blocks]:
  assumes \<open>(P_0x198e4_68 && P_0x198e4_68_regions) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x198e4 68 \<sigma> \<triangleq> ?\<sigma> \<and> Q_term_printf_addr_0x198e4_68 ?\<sigma> \<and> block_usage P_0x198e4_68_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x198e4_68_def P_0x198e4_68_regions_def post: Q_term_printf_addr_0x198e4_68_def regionset: P_0x198e4_68_regions_set_def)

definition P_0x198e9_69 :: state_pred where
  \<open>P_0x198e9_69 \<sigma> \<equiv> RIP \<sigma> = 0x198e9 \<and> RAX \<sigma> = term_printf_0x198e4_retval \<and> RDX \<sigma> = ucast ((\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0xc),4]::32 word)) \<and> RDI \<sigma> = 0x21a02 \<and> RSI \<sigma> = (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x38),8]::64 word),8]::64 word) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x8) \<and> (\<sigma> \<turnstile> *[0x2a498,8]::64 word) = (\<sigma> \<turnstile> *[0x2a498,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x8),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x8),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0xc),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0xc),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x38),8]::64 word) = (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x38),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x448),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x448),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x894),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x894),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = 0x198e9 \<and> (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x38),8]::64 word),8]::64 word) = (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x38),8]::64 word),8]::64 word)\<close>
declare P_0x198e9_69_def[Ps]

definition P_0x198e9_69_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x198e9_69_regions_set \<sigma> \<equiv> {
    (0, 0x2a498, 8),
    (1, RSP\<^sub>0, 8),
    (2, ((RBX \<sigma>::64 word) + 0x8), 4),
    (3, ((RBX \<sigma>::64 word) + 0xc), 4),
    (4, ((RBX \<sigma>::64 word) + 0x38), 8),
    (5, ((RBX \<sigma>::64 word) + 0x448), Suc 0),
    (6, ((RBX \<sigma>::64 word) + 0x850), 8),
    (7, ((RBX \<sigma>::64 word) + 0x894), 4),
    (8, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (10, (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x38),8]::64 word), 8)
  }\<close>

definition P_0x198e9_69_regions :: state_pred where
  \<open>P_0x198e9_69_regions \<sigma> \<equiv> \<exists>regions. P_0x198e9_69_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x198f3_69 :: state_pred where
  \<open>Q_0x198f3_69 \<sigma> \<equiv> RIP \<sigma> = 0x198f3 \<and> RAX \<sigma> = (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x850),8]::64 word) \<and> RDX \<sigma> = ucast ((\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0xc),4]::32 word)) \<and> RDI \<sigma> = 0x21a02 \<and> RSI \<sigma> = (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x38),8]::64 word),8]::64 word) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x8) \<and> (\<sigma> \<turnstile> *[0x2a498,8]::64 word) = (\<sigma> \<turnstile> *[0x2a498,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x8),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x8),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0xc),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0xc),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x38),8]::64 word) = (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x38),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x448),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x448),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x850),8]::64 word) = (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x850),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x894),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x894),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = 0x198e9 \<and> (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x38),8]::64 word),8]::64 word) = (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x38),8]::64 word),8]::64 word)\<close>
declare Q_0x198f3_69_def[Qs]

schematic_goal bdrv_info_0_2_0x198e9_0x198f0_69[blocks]:
  assumes \<open>(P_0x198e9_69 && P_0x198e9_69_regions) \<sigma>\<close>
  shows \<open>exec_block 2 0x198f0 69 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x198f3_69 ?\<sigma> \<and> block_usage P_0x198e9_69_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x198e9_69_def P_0x198e9_69_regions_def post: Q_0x198f3_69_def regionset: P_0x198e9_69_regions_set_def)

definition P_0x198f3_true_70 :: state_pred where
  \<open>P_0x198f3_true_70 \<sigma> \<equiv> RIP \<sigma> = 0x198f3 \<and> RAX \<sigma> = (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x850),8]::64 word) \<and> RDX \<sigma> = ucast ((\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0xc),4]::32 word)) \<and> RDI \<sigma> = 0x21a02 \<and> RSI \<sigma> = (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x38),8]::64 word),8]::64 word) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x8) \<and> (\<sigma> \<turnstile> *[0x2a498,8]::64 word) = (\<sigma> \<turnstile> *[0x2a498,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x8),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x8),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0xc),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0xc),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x38),8]::64 word) = (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x38),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x448),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x448),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x850),8]::64 word) = (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x850),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x894),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x894),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = 0x198e9 \<and> (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x38),8]::64 word),8]::64 word) = (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x38),8]::64 word),8]::64 word)\<close>
declare P_0x198f3_true_70_def[Ps]

definition P_0x198f3_true_70_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x198f3_true_70_regions_set \<sigma> \<equiv> {
    (0, 0x2a498, 8),
    (1, RSP\<^sub>0, 8),
    (2, ((RBX \<sigma>::64 word) + 0x8), 4),
    (3, ((RBX \<sigma>::64 word) + 0xc), 4),
    (4, ((RBX \<sigma>::64 word) + 0x14), 4),
    (5, ((RBX \<sigma>::64 word) + 0x38), 8),
    (6, ((RBX \<sigma>::64 word) + 0x448), Suc 0),
    (7, ((RBX \<sigma>::64 word) + 0x850), 8),
    (8, ((RBX \<sigma>::64 word) + 0x894), 4),
    (9, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (11, (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x38),8]::64 word), 8)
  }\<close>

definition P_0x198f3_true_70_regions :: state_pred where
  \<open>P_0x198f3_true_70_regions \<sigma> \<equiv> \<exists>regions. P_0x198f3_true_70_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x19904_70 :: state_pred where
  \<open>Q_0x19904_70 \<sigma> \<equiv> RIP \<sigma> = 0x19904 \<and> RDX \<sigma> = ucast ((\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0xc),4]::32 word)) \<and> RDI \<sigma> = 0x21a02 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x8) \<and> (\<sigma> \<turnstile> *[0x2a498,8]::64 word) = (\<sigma> \<turnstile> *[0x2a498,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x8),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x8),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0xc),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0xc),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x38),8]::64 word) = (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x38),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x448),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x448),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x850),8]::64 word) = (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x850),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x894),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x894),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = 0x198e9 \<and> (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x38),8]::64 word),8]::64 word) = (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x38),8]::64 word),8]::64 word)\<close>
declare Q_0x19904_70_def[Qs]

schematic_goal bdrv_info_0_2_0x198f3_0x19901_70[blocks]:
  assumes \<open>(P_0x198f3_true_70 && P_0x198f3_true_70_regions && ZF) \<sigma>\<close>
  shows \<open>exec_block 2 0x19901 70 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x19904_70 ?\<sigma> \<and> block_usage P_0x198f3_true_70_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x198f3_true_70_def P_0x198f3_true_70_regions_def post: Q_0x19904_70_def regionset: P_0x198f3_true_70_regions_set_def)

definition P_0x198f3_false_71 :: state_pred where
  \<open>P_0x198f3_false_71 \<sigma> \<equiv> RIP \<sigma> = 0x198f3 \<and> RAX \<sigma> = (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x850),8]::64 word) \<and> RDX \<sigma> = ucast ((\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0xc),4]::32 word)) \<and> RDI \<sigma> = 0x21a02 \<and> RSI \<sigma> = (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x38),8]::64 word),8]::64 word) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x8) \<and> (\<sigma> \<turnstile> *[0x2a498,8]::64 word) = (\<sigma> \<turnstile> *[0x2a498,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x8),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x8),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0xc),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0xc),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x38),8]::64 word) = (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x38),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x448),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x448),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x850),8]::64 word) = (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x850),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x894),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x894),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = 0x198e9 \<and> (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x38),8]::64 word),8]::64 word) = (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x38),8]::64 word),8]::64 word)\<close>
declare P_0x198f3_false_71_def[Ps]

definition P_0x198f3_false_71_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x198f3_false_71_regions_set \<sigma> \<equiv> {
    (0, 0x2a498, 8),
    (1, RSP\<^sub>0, 8),
    (2, ((RBX \<sigma>::64 word) + 0x8), 4),
    (3, ((RBX \<sigma>::64 word) + 0xc), 4),
    (4, ((RBX \<sigma>::64 word) + 0x38), 8),
    (5, ((RBX \<sigma>::64 word) + 0x448), Suc 0),
    (6, ((RBX \<sigma>::64 word) + 0x850), 8),
    (7, ((RBX \<sigma>::64 word) + 0x894), 4),
    (8, (((\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x850),8]::64 word)::64 word) + 0x14), 4),
    (9, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (11, (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x38),8]::64 word), 8)
  }\<close>

definition P_0x198f3_false_71_regions :: state_pred where
  \<open>P_0x198f3_false_71_regions \<sigma> \<equiv> \<exists>regions. P_0x198f3_false_71_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x198ff_71 :: state_pred where
  \<open>Q_0x198ff_71 \<sigma> \<equiv> RIP \<sigma> = 0x198ff \<and> RAX \<sigma> = ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x850),8]::64 word)::64 word) + 0x14),4]::32 word)) \<and> RDX \<sigma> = ucast ((\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0xc),4]::32 word)) \<and> RDI \<sigma> = 0x21a02 \<and> RSI \<sigma> = 0x1 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x8) \<and> (\<sigma> \<turnstile> *[0x2a498,8]::64 word) = (\<sigma> \<turnstile> *[0x2a498,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x8),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x8),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0xc),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0xc),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x38),8]::64 word) = (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x38),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x448),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x448),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x850),8]::64 word) = (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x850),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x894),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x894),4]::32 word)) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x850),8]::64 word)::64 word) + 0x14),4]::32 word) = ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x850),8]::64 word)::64 word) + 0x14),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = 0x198e9 \<and> (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x38),8]::64 word),8]::64 word) = (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x38),8]::64 word),8]::64 word)\<close>
declare Q_0x198ff_71_def[Qs]

schematic_goal bdrv_info_0_4_0x198f3_0x198fd_71[blocks]:
  assumes \<open>(P_0x198f3_false_71 && P_0x198f3_false_71_regions && ! ZF) \<sigma>\<close>
  shows \<open>exec_block 4 0x198fd 71 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x198ff_71 ?\<sigma> \<and> block_usage P_0x198f3_false_71_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x198f3_false_71_def P_0x198f3_false_71_regions_def post: Q_0x198ff_71_def regionset: P_0x198f3_false_71_regions_set_def)

definition P_0x198ff_true_72 :: state_pred where
  \<open>P_0x198ff_true_72 \<sigma> \<equiv> RIP \<sigma> = 0x198ff \<and> RAX \<sigma> = ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x850),8]::64 word)::64 word) + 0x14),4]::32 word)) \<and> RDX \<sigma> = ucast ((\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0xc),4]::32 word)) \<and> RDI \<sigma> = 0x21a02 \<and> RSI \<sigma> = 0x1 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x8) \<and> (\<sigma> \<turnstile> *[0x2a498,8]::64 word) = (\<sigma> \<turnstile> *[0x2a498,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x8),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x8),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0xc),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0xc),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x38),8]::64 word) = (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x38),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x448),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x448),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x850),8]::64 word) = (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x850),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x894),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x894),4]::32 word)) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x850),8]::64 word)::64 word) + 0x14),4]::32 word) = ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x850),8]::64 word)::64 word) + 0x14),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = 0x198e9 \<and> (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x38),8]::64 word),8]::64 word) = (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x38),8]::64 word),8]::64 word)\<close>
declare P_0x198ff_true_72_def[Ps]

definition P_0x198ff_true_72_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x198ff_true_72_regions_set \<sigma> \<equiv> {
    (0, 0x2a498, 8),
    (1, RSP\<^sub>0, 8),
    (2, ((RBX \<sigma>::64 word) + 0x8), 4),
    (3, ((RBX \<sigma>::64 word) + 0xc), 4),
    (4, ((RBX \<sigma>::64 word) + 0x38), 8),
    (5, ((RBX \<sigma>::64 word) + 0x448), Suc 0),
    (6, ((RBX \<sigma>::64 word) + 0x850), 8),
    (7, ((RBX \<sigma>::64 word) + 0x894), 4),
    (8, (((\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x850),8]::64 word)::64 word) + 0x14), 4),
    (9, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (11, (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x38),8]::64 word), 8)
  }\<close>

definition P_0x198ff_true_72_regions :: state_pred where
  \<open>P_0x198ff_true_72_regions \<sigma> \<equiv> \<exists>regions. P_0x198ff_true_72_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x19904_72 :: state_pred where
  \<open>Q_0x19904_72 \<sigma> \<equiv> RIP \<sigma> = 0x19904 \<and> RDX \<sigma> = ucast ((\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0xc),4]::32 word)) \<and> RDI \<sigma> = 0x21a02 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x8) \<and> (\<sigma> \<turnstile> *[0x2a498,8]::64 word) = (\<sigma> \<turnstile> *[0x2a498,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x8),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x8),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0xc),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0xc),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x38),8]::64 word) = (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x38),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x448),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x448),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x850),8]::64 word) = (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x850),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x894),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x894),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = 0x198e9 \<and> (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x38),8]::64 word),8]::64 word) = (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x38),8]::64 word),8]::64 word)\<close>
declare Q_0x19904_72_def[Qs]

schematic_goal bdrv_info_0_1_0x198ff_0x198ff_72[blocks]:
  assumes \<open>(P_0x198ff_true_72 && P_0x198ff_true_72_regions && !ZF) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x198ff 72 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x19904_72 ?\<sigma> \<and> block_usage P_0x198ff_true_72_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x198ff_true_72_def P_0x198ff_true_72_regions_def post: Q_0x19904_72_def regionset: P_0x198ff_true_72_regions_set_def)

definition P_0x198ff_false_73 :: state_pred where
  \<open>P_0x198ff_false_73 \<sigma> \<equiv> RIP \<sigma> = 0x198ff \<and> RAX \<sigma> = ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x850),8]::64 word)::64 word) + 0x14),4]::32 word)) \<and> RDX \<sigma> = ucast ((\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0xc),4]::32 word)) \<and> RDI \<sigma> = 0x21a02 \<and> RSI \<sigma> = 0x1 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x8) \<and> (\<sigma> \<turnstile> *[0x2a498,8]::64 word) = (\<sigma> \<turnstile> *[0x2a498,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x8),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x8),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0xc),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0xc),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x38),8]::64 word) = (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x38),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x448),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x448),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x850),8]::64 word) = (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x850),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x894),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x894),4]::32 word)) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x850),8]::64 word)::64 word) + 0x14),4]::32 word) = ucast ((\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x850),8]::64 word)::64 word) + 0x14),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = 0x198e9 \<and> (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x38),8]::64 word),8]::64 word) = (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x38),8]::64 word),8]::64 word)\<close>
declare P_0x198ff_false_73_def[Ps]

definition P_0x198ff_false_73_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x198ff_false_73_regions_set \<sigma> \<equiv> {
    (0, 0x2a498, 8),
    (1, RSP\<^sub>0, 8),
    (2, ((RBX \<sigma>::64 word) + 0x8), 4),
    (3, ((RBX \<sigma>::64 word) + 0xc), 4),
    (4, ((RBX \<sigma>::64 word) + 0x14), 4),
    (5, ((RBX \<sigma>::64 word) + 0x38), 8),
    (6, ((RBX \<sigma>::64 word) + 0x448), Suc 0),
    (7, ((RBX \<sigma>::64 word) + 0x850), 8),
    (8, ((RBX \<sigma>::64 word) + 0x894), 4),
    (9, (((\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x850),8]::64 word)::64 word) + 0x14), 4),
    (10, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (11, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (12, (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x38),8]::64 word), 8)
  }\<close>

definition P_0x198ff_false_73_regions :: state_pred where
  \<open>P_0x198ff_false_73_regions \<sigma> \<equiv> \<exists>regions. P_0x198ff_false_73_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x19904_73 :: state_pred where
  \<open>Q_0x19904_73 \<sigma> \<equiv> RIP \<sigma> = 0x19904 \<and> RDX \<sigma> = ucast ((\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0xc),4]::32 word)) \<and> RDI \<sigma> = 0x21a02 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x8) \<and> (\<sigma> \<turnstile> *[0x2a498,8]::64 word) = (\<sigma> \<turnstile> *[0x2a498,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x8),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x8),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0xc),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0xc),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x38),8]::64 word) = (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x38),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x448),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x448),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x850),8]::64 word) = (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x850),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x894),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x894),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = 0x198e9 \<and> (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x38),8]::64 word),8]::64 word) = (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x38),8]::64 word),8]::64 word)\<close>
declare Q_0x19904_73_def[Qs]

schematic_goal bdrv_info_0_2_0x198ff_0x19901_73[blocks]:
  assumes \<open>(P_0x198ff_false_73 && P_0x198ff_false_73_regions && ! !ZF) \<sigma>\<close>
  shows \<open>exec_block 2 0x19901 73 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x19904_73 ?\<sigma> \<and> block_usage P_0x198ff_false_73_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x198ff_false_73_def P_0x198ff_false_73_regions_def post: Q_0x19904_73_def regionset: P_0x198ff_false_73_regions_set_def)

definition P_0x19904_74 :: state_pred where
  \<open>P_0x19904_74 \<sigma> \<equiv> RIP \<sigma> = 0x19904 \<and> RDX \<sigma> = ucast ((\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0xc),4]::32 word)) \<and> RDI \<sigma> = 0x21a02 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x8) \<and> (\<sigma> \<turnstile> *[0x2a498,8]::64 word) = (\<sigma> \<turnstile> *[0x2a498,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x8),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x8),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0xc),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0xc),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x38),8]::64 word) = (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x38),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x448),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x448),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x850),8]::64 word) = (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x850),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x894),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x894),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = 0x198e9 \<and> (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x38),8]::64 word),8]::64 word) = (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x38),8]::64 word),8]::64 word)\<close>
declare P_0x19904_74_def[Ps]

definition P_0x19904_74_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x19904_74_regions_set \<sigma> \<equiv> {
    (0, 0x2a498, 8),
    (1, RSP\<^sub>0, 8),
    (2, ((RBX \<sigma>::64 word) + 0x8), 4),
    (3, ((RBX \<sigma>::64 word) + 0xc), 4),
    (4, ((RBX \<sigma>::64 word) + 0x38), 8),
    (5, ((RBX \<sigma>::64 word) + 0x448), Suc 0),
    (6, ((RBX \<sigma>::64 word) + 0x850), 8),
    (7, ((RBX \<sigma>::64 word) + 0x894), 4),
    (8, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (10, (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x38),8]::64 word), 8)
  }\<close>

definition P_0x19904_74_regions :: state_pred where
  \<open>P_0x19904_74_regions \<sigma> \<equiv> \<exists>regions. P_0x19904_74_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x1990d_74 :: state_pred where
  \<open>Q_0x1990d_74 \<sigma> \<equiv> RIP \<sigma> = 0x1990d \<and> RAX \<sigma> = 0x0 \<and> RDX \<sigma> = ucast ((\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0xc),4]::32 word)) \<and> RDI \<sigma> = 0x21a0a \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x8) \<and> (\<sigma> \<turnstile> *[0x2a498,8]::64 word) = (\<sigma> \<turnstile> *[0x2a498,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x8),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x8),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0xc),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0xc),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x38),8]::64 word) = (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x38),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x448),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x448),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x850),8]::64 word) = (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x850),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x894),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x894),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = 0x198e9 \<and> (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x38),8]::64 word),8]::64 word) = (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x38),8]::64 word),8]::64 word)\<close>
declare Q_0x1990d_74_def[Qs]

schematic_goal bdrv_info_0_2_0x19904_0x1990b_74[blocks]:
  assumes \<open>(P_0x19904_74 && P_0x19904_74_regions) \<sigma>\<close>
  shows \<open>exec_block 2 0x1990b 74 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x1990d_74 ?\<sigma> \<and> block_usage P_0x19904_74_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x19904_74_def P_0x19904_74_regions_def post: Q_0x1990d_74_def regionset: P_0x19904_74_regions_set_def)

definition P_0x1990d_75 :: state_pred where
  \<open>P_0x1990d_75 \<sigma> \<equiv> RIP \<sigma> = 0x1990d \<and> RAX \<sigma> = 0x0 \<and> RDX \<sigma> = ucast ((\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0xc),4]::32 word)) \<and> RDI \<sigma> = 0x21a0a \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x8) \<and> (\<sigma> \<turnstile> *[0x2a498,8]::64 word) = (\<sigma> \<turnstile> *[0x2a498,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x8),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x8),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0xc),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0xc),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x38),8]::64 word) = (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x38),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x448),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x448),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x850),8]::64 word) = (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x850),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x894),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x894),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = 0x198e9 \<and> (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x38),8]::64 word),8]::64 word) = (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x38),8]::64 word),8]::64 word)\<close>
declare P_0x1990d_75_def[Ps]

definition P_0x1990d_75_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x1990d_75_regions_set \<sigma> \<equiv> {
    (0, 0x2a498, 8),
    (1, RSP\<^sub>0, 8),
    (2, ((RBX \<sigma>::64 word) + 0x8), 4),
    (3, ((RBX \<sigma>::64 word) + 0xc), 4),
    (4, ((RBX \<sigma>::64 word) + 0x38), 8),
    (5, ((RBX \<sigma>::64 word) + 0x448), Suc 0),
    (6, ((RBX \<sigma>::64 word) + 0x850), 8),
    (7, ((RBX \<sigma>::64 word) + 0x894), 4),
    (8, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (10, (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x38),8]::64 word), 8)
  }\<close>

definition P_0x1990d_75_regions :: state_pred where
  \<open>P_0x1990d_75_regions \<sigma> \<equiv> \<exists>regions. P_0x1990d_75_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_term_printf_addr_0x1990d_75 :: state_pred where
  \<open>Q_term_printf_addr_0x1990d_75 \<sigma> \<equiv> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x10) \<and> RIP \<sigma> = term_printf_addr \<and> RAX \<sigma> = 0x0 \<and> RDX \<sigma> = ucast ((\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0xc),4]::32 word)) \<and> (\<sigma> \<turnstile> *[0x2a498,8]::64 word) = (\<sigma> \<turnstile> *[0x2a498,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0xc),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0xc),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x38),8]::64 word) = (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x38),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x894),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x894),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = RBX\<^sub>0\<close>
declare Q_term_printf_addr_0x1990d_75_def[Qs]

schematic_goal bdrv_info_0_1_0x1990d_0x1990d_75[blocks]:
  assumes \<open>(P_0x1990d_75 && P_0x1990d_75_regions) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x1990d 75 \<sigma> \<triangleq> ?\<sigma> \<and> Q_term_printf_addr_0x1990d_75 ?\<sigma> \<and> block_usage P_0x1990d_75_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x1990d_75_def P_0x1990d_75_regions_def post: Q_term_printf_addr_0x1990d_75_def regionset: P_0x1990d_75_regions_set_def)

definition P_0x19912_76 :: state_pred where
  \<open>P_0x19912_76 \<sigma> \<equiv> RIP \<sigma> = 0x19912 \<and> RDX \<sigma> = ucast ((\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0xc),4]::32 word)) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x8) \<and> (\<sigma> \<turnstile> *[0x2a498,8]::64 word) = (\<sigma> \<turnstile> *[0x2a498,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0xc),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0xc),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x38),8]::64 word) = (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x38),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x894),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x894),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = RBX\<^sub>0\<close>
declare P_0x19912_76_def[Ps]

definition P_0x19912_76_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x19912_76_regions_set \<sigma> \<equiv> {
    (0, 0x2a498, 8),
    (1, RSP\<^sub>0, 8),
    (2, ((RBX \<sigma>::64 word) + 0xc), 4),
    (3, ((RBX \<sigma>::64 word) + 0x38), 8),
    (4, ((RBX \<sigma>::64 word) + 0x894), 4),
    (5, ((RSP\<^sub>0::64 word) - 0x8), 8)
  }\<close>

definition P_0x19912_76_regions :: state_pred where
  \<open>P_0x19912_76_regions \<sigma> \<equiv> \<exists>regions. P_0x19912_76_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x1991b_76 :: state_pred where
  \<open>Q_0x1991b_76 \<sigma> \<equiv> RIP \<sigma> = 0x1991b \<and> RAX \<sigma> = 0x0 \<and> RDX \<sigma> = ucast ((\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0xc),4]::32 word)) \<and> RDI \<sigma> = 0x20c61 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x8) \<and> (\<sigma> \<turnstile> *[0x2a498,8]::64 word) = (\<sigma> \<turnstile> *[0x2a498,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0xc),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0xc),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x38),8]::64 word) = (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x38),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x894),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x894),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = RBX\<^sub>0\<close>
declare Q_0x1991b_76_def[Qs]

schematic_goal bdrv_info_0_2_0x19912_0x19919_76[blocks]:
  assumes \<open>(P_0x19912_76 && P_0x19912_76_regions) \<sigma>\<close>
  shows \<open>exec_block 2 0x19919 76 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x1991b_76 ?\<sigma> \<and> block_usage P_0x19912_76_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x19912_76_def P_0x19912_76_regions_def post: Q_0x1991b_76_def regionset: P_0x19912_76_regions_set_def)

definition P_0x1991b_77 :: state_pred where
  \<open>P_0x1991b_77 \<sigma> \<equiv> RIP \<sigma> = 0x1991b \<and> RAX \<sigma> = 0x0 \<and> RDX \<sigma> = ucast ((\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0xc),4]::32 word)) \<and> RDI \<sigma> = 0x20c61 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x8) \<and> (\<sigma> \<turnstile> *[0x2a498,8]::64 word) = (\<sigma> \<turnstile> *[0x2a498,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0xc),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0xc),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x38),8]::64 word) = (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x38),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x894),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x894),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = RBX\<^sub>0\<close>
declare P_0x1991b_77_def[Ps]

definition P_0x1991b_77_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x1991b_77_regions_set \<sigma> \<equiv> {
    (0, 0x2a498, 8),
    (1, RSP\<^sub>0, 8),
    (2, ((RBX \<sigma>::64 word) + 0xc), 4),
    (3, ((RBX \<sigma>::64 word) + 0x38), 8),
    (4, ((RBX \<sigma>::64 word) + 0x894), 4),
    (5, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x10), 8)
  }\<close>

definition P_0x1991b_77_regions :: state_pred where
  \<open>P_0x1991b_77_regions \<sigma> \<equiv> \<exists>regions. P_0x1991b_77_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_term_printf_addr_0x1991b_77 :: state_pred where
  \<open>Q_term_printf_addr_0x1991b_77 \<sigma> \<equiv> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x10) \<and> RIP \<sigma> = term_printf_addr \<and> RAX \<sigma> = 0x0 \<and> RDX \<sigma> = ucast ((\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0xc),4]::32 word)) \<and> RDI \<sigma> = 0x20c61 \<and> (\<sigma> \<turnstile> *[0x2a498,8]::64 word) = (\<sigma> \<turnstile> *[0x2a498,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0xc),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0xc),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x38),8]::64 word) = (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x38),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x894),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x894),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = 0x19920\<close>
declare Q_term_printf_addr_0x1991b_77_def[Qs]

schematic_goal bdrv_info_0_1_0x1991b_0x1991b_77[blocks]:
  assumes \<open>(P_0x1991b_77 && P_0x1991b_77_regions) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x1991b 77 \<sigma> \<triangleq> ?\<sigma> \<and> Q_term_printf_addr_0x1991b_77 ?\<sigma> \<and> block_usage P_0x1991b_77_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x1991b_77_def P_0x1991b_77_regions_def post: Q_term_printf_addr_0x1991b_77_def regionset: P_0x1991b_77_regions_set_def)

definition P_0x19920_78 :: state_pred where
  \<open>P_0x19920_78 \<sigma> \<equiv> RIP \<sigma> = 0x19920 \<and> RAX \<sigma> = term_printf_0x1991b_retval \<and> RDX \<sigma> = ucast ((\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0xc),4]::32 word)) \<and> RDI \<sigma> = 0x20c61 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x8) \<and> (\<sigma> \<turnstile> *[0x2a498,8]::64 word) = (\<sigma> \<turnstile> *[0x2a498,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0xc),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0xc),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x38),8]::64 word) = (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x38),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x894),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x894),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = 0x19920\<close>
declare P_0x19920_78_def[Ps]

definition P_0x19920_78_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x19920_78_regions_set \<sigma> \<equiv> {
    (0, 0x2a498, 8),
    (1, RSP\<^sub>0, 8),
    (2, ((RBX \<sigma>::64 word) + 0xc), 4),
    (3, ((RBX \<sigma>::64 word) + 0x38), 8),
    (4, ((RBX \<sigma>::64 word) + 0x894), 4),
    (5, ((RBX \<sigma>::64 word) + 0x8b8), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x10), 8)
  }\<close>

definition P_0x19920_78_regions :: state_pred where
  \<open>P_0x19920_78_regions \<sigma> \<equiv> \<exists>regions. P_0x19920_78_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x1992a_78 :: state_pred where
  \<open>Q_0x1992a_78 \<sigma> \<equiv> RIP \<sigma> = 0x1992a \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x8) \<and> (\<sigma> \<turnstile> *[0x2a498,8]::64 word) = (\<sigma> \<turnstile> *[0x2a498,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = RBX\<^sub>0\<close>
declare Q_0x1992a_78_def[Qs]

schematic_goal bdrv_info_0_2_0x19920_0x19927_78[blocks]:
  assumes \<open>(P_0x19920_78 && P_0x19920_78_regions) \<sigma>\<close>
  shows \<open>exec_block 2 0x19927 78 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x1992a_78 ?\<sigma> \<and> block_usage P_0x19920_78_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x19920_78_def P_0x19920_78_regions_def post: Q_0x1992a_78_def regionset: P_0x19920_78_regions_set_def)

definition P_0x1992a_true_79 :: state_pred where
  \<open>P_0x1992a_true_79 \<sigma> \<equiv> RIP \<sigma> = 0x1992a \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x8) \<and> (\<sigma> \<turnstile> *[0x2a498,8]::64 word) = (\<sigma> \<turnstile> *[0x2a498,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = RBX\<^sub>0\<close>
declare P_0x1992a_true_79_def[Ps]

definition P_0x1992a_true_79_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x1992a_true_79_regions_set \<sigma> \<equiv> {
    (0, 0x2a498, 8),
    (1, RSP\<^sub>0, 8),
    (2, ((RSP\<^sub>0::64 word) - 0x8), 8)
  }\<close>

definition P_0x1992a_true_79_regions :: state_pred where
  \<open>P_0x1992a_true_79_regions \<sigma> \<equiv> \<exists>regions. P_0x1992a_true_79_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x19a00_79 :: state_pred where
  \<open>Q_0x19a00_79 \<sigma> \<equiv> RIP \<sigma> = 0x19a00 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x8) \<and> (\<sigma> \<turnstile> *[0x2a498,8]::64 word) = (\<sigma> \<turnstile> *[0x2a498,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = RBX\<^sub>0\<close>
declare Q_0x19a00_79_def[Qs]

schematic_goal bdrv_info_0_1_0x1992a_0x1992a_79[blocks]:
  assumes \<open>(P_0x1992a_true_79 && P_0x1992a_true_79_regions && ZF) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x1992a 79 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x19a00_79 ?\<sigma> \<and> block_usage P_0x1992a_true_79_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x1992a_true_79_def P_0x1992a_true_79_regions_def post: Q_0x19a00_79_def regionset: P_0x1992a_true_79_regions_set_def)

definition P_0x1992a_false_80 :: state_pred where
  \<open>P_0x1992a_false_80 \<sigma> \<equiv> RIP \<sigma> = 0x1992a \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x8) \<and> (\<sigma> \<turnstile> *[0x2a498,8]::64 word) = (\<sigma> \<turnstile> *[0x2a498,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = RBX\<^sub>0\<close>
declare P_0x1992a_false_80_def[Ps]

definition P_0x1992a_false_80_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x1992a_false_80_regions_set \<sigma> \<equiv> {
    (0, 0x2a498, 8),
    (1, RSP\<^sub>0, 8),
    (2, ((RSP\<^sub>0::64 word) - 0x8), 8)
  }\<close>

definition P_0x1992a_false_80_regions :: state_pred where
  \<open>P_0x1992a_false_80_regions \<sigma> \<equiv> \<exists>regions. P_0x1992a_false_80_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x19930_80 :: state_pred where
  \<open>Q_0x19930_80 \<sigma> \<equiv> RIP \<sigma> = 0x19930 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x8) \<and> (\<sigma> \<turnstile> *[0x2a498,8]::64 word) = (\<sigma> \<turnstile> *[0x2a498,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = RBX\<^sub>0\<close>
declare Q_0x19930_80_def[Qs]

schematic_goal bdrv_info_0_1_0x1992a_0x1992a_80[blocks]:
  assumes \<open>(P_0x1992a_false_80 && P_0x1992a_false_80_regions && ! ZF) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x1992a 80 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x19930_80 ?\<sigma> \<and> block_usage P_0x1992a_false_80_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x1992a_false_80_def P_0x1992a_false_80_regions_def post: Q_0x19930_80_def regionset: P_0x1992a_false_80_regions_set_def)

definition P_0x1985b_false_81 :: state_pred where
  \<open>P_0x1985b_false_81 \<sigma> \<equiv> RIP \<sigma> = 0x1985b \<and> RAX \<sigma> = RAX\<^sub>0 \<and> RBX \<sigma> = (\<sigma> \<turnstile> *[0x2a498,8]::64 word) \<and> RDX \<sigma> = RDX\<^sub>0 \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x8) \<and> (\<sigma> \<turnstile> *[0x2a498,8]::64 word) = (\<sigma> \<turnstile> *[0x2a498,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = RBX\<^sub>0\<close>
declare P_0x1985b_false_81_def[Ps]

definition P_0x1985b_false_81_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x1985b_false_81_regions_set \<sigma> \<equiv> {
    (0, 0x2a498, 8),
    (1, RSP\<^sub>0, 8),
    (2, ((RSP\<^sub>0::64 word) - 0x8), 8)
  }\<close>

definition P_0x1985b_false_81_regions :: state_pred where
  \<open>P_0x1985b_false_81_regions \<sigma> \<equiv> \<exists>regions. P_0x1985b_false_81_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x19a00_81 :: state_pred where
  \<open>Q_0x19a00_81 \<sigma> \<equiv> RIP \<sigma> = 0x19a00 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x8) \<and> (\<sigma> \<turnstile> *[0x2a498,8]::64 word) = (\<sigma> \<turnstile> *[0x2a498,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = RBX\<^sub>0\<close>
declare Q_0x19a00_81_def[Qs]

schematic_goal bdrv_info_0_2_0x1985b_0x19861_81[blocks]:
  assumes \<open>(P_0x1985b_false_81 && P_0x1985b_false_81_regions && ! !ZF) \<sigma>\<close>
  shows \<open>exec_block 2 0x19861 81 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x19a00_81 ?\<sigma> \<and> block_usage P_0x1985b_false_81_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x1985b_false_81_def P_0x1985b_false_81_regions_def post: Q_0x19a00_81_def regionset: P_0x1985b_false_81_regions_set_def)

definition P_0x19a00_82 :: state_pred where
  \<open>P_0x19a00_82 \<sigma> \<equiv> RIP \<sigma> = 0x19a00 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x8) \<and> (\<sigma> \<turnstile> *[0x2a498,8]::64 word) = (\<sigma> \<turnstile> *[0x2a498,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = RBX\<^sub>0\<close>
declare P_0x19a00_82_def[Ps]

definition P_0x19a00_82_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x19a00_82_regions_set \<sigma> \<equiv> {
    (0, 0x2a498, 8),
    (1, RSP\<^sub>0, 8),
    (2, ((RSP\<^sub>0::64 word) - 0x8), 8)
  }\<close>

definition P_0x19a00_82_regions :: state_pred where
  \<open>P_0x19a00_82_regions \<sigma> \<equiv> \<exists>regions. P_0x19a00_82_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_ret_address_82 :: state_pred where
  \<open>Q_ret_address_82 \<sigma> \<equiv> RIP \<sigma> = ret_address \<and> RBX \<sigma> = RBX\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) + 0x8) \<and> (\<sigma> \<turnstile> *[0x2a498,8]::64 word) = (\<sigma> \<turnstile> *[0x2a498,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = RBX\<^sub>0\<close>
declare Q_ret_address_82_def[Qs]

schematic_goal bdrv_info_0_2_0x19a00_0x19a01_82[blocks]:
  assumes \<open>(P_0x19a00_82 && P_0x19a00_82_regions) \<sigma>\<close>
  shows \<open>exec_block 2 0x19a01 82 \<sigma> \<triangleq> ?\<sigma> \<and> Q_ret_address_82 ?\<sigma> \<and> block_usage P_0x19a00_82_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x19a00_82_def P_0x19a00_82_regions_def post: Q_ret_address_82_def regionset: P_0x19a00_82_regions_set_def)

definition bdrv_info_acode :: ACode where
  \<open>bdrv_info_acode =
    Block 3 0x19858 0;
    IF !ZF THEN
      Block (Suc 0) 0x1985b (Suc 0);
      WHILE P_0x19930_2 DO
        Block 3 0x1993e 2;
        Block (Suc 0) 0x19940 3;
        CALL term_printf_acode;
        Block 2 0x19947 4;
        Block (Suc 0) 0x1994e 5;
        CALL term_printf_acode;
        Block 2 0x19959 6;
        IF ZF THEN
          Block 3 0x199cf 7;
          Block (Suc 0) 0x199d1 8;
          CALL term_printf_acode;
          Block (Suc 0) 0x199d6 9
        ELSE
          Block 2 0x1995e 10;
          IF !ZF THEN
            Block 2 0x19870 11;
            IF ZF THEN
              Block 2 0x199b0 12;
              Block (Suc 0) 0x199b7 13;
              CALL term_printf_acode;
              Block (Suc 0) 0x199bc 14
            ELSE
              Block (Suc 0) 0x19872 15
            FI
          ELSE
            Block 3 0x1996e 16;
            Block (Suc 0) 0x19970 17;
            CALL term_printf_acode;
            Block (Suc 0) 0x19975 18
          FI
        FI;
        Block 3 0x19882 19;
        Block (Suc 0) 0x19884 20;
        CALL term_printf_acode;
        Block 2 0x1988c 21;
        IF !ZF THEN
          Block 4 0x19985 22;
          Block (Suc 0) 0x1998c 23;
          CALL term_printf_acode;
          Block (Suc 0) 0x19991 24;
          IF !ZF THEN
            Block 3 0x198a1 25;
            Block (Suc 0) 0x198a8 26;
            CALL term_printf_acode;
            Block (Suc 0) 0x198ad 27;
            Block (Suc 0) 0x198b1 28;
            CALL term_print_filename_acode;
            Block (Suc 0) 0x198b6 29;
            IF !ZF THEN
              Block 3 0x199e7 30;
              Block (Suc 0) 0x199e9 31;
              CALL term_printf_acode;
              Block (Suc 0) 0x199ee 32;
              Block (Suc 0) 0x199f5 33;
              CALL term_print_filename_acode;
              Block (Suc 0) 0x199fa 34
            ELSE
              Block (Suc 0) 0x198bd 35
            FI;
            Block 3 0x198cd 36;
            Block (Suc 0) 0x198cf 37;
            CALL term_printf_acode;
            Block 4 0x198e2 38;
            Block (Suc 0) 0x198e4 39;
            CALL term_printf_acode;
            Block 2 0x198f0 40;
            IF ZF THEN
              Block 2 0x19901 41
            ELSE
              Block 4 0x198fd 42;
              IF !ZF THEN
                Block (Suc 0) 0x198ff 43
              ELSE
                Block 2 0x19901 44
              FI
            FI;
            Block 2 0x1990b 45;
            Block (Suc 0) 0x1990d 46;
            CALL term_printf_acode
          ELSE
            Block 3 0x199a3 47;
            Block (Suc 0) 0x199a5 48;
            CALL term_printf_acode;
            Block (Suc 0) 0x199aa 49
          FI
        ELSE
          Block 2 0x19894 50;
          IF ZF THEN
            Block 3 0x199a3 51;
            Block (Suc 0) 0x199a5 52;
            CALL term_printf_acode;
            Block (Suc 0) 0x199aa 53
          ELSE
            Block 3 0x198a1 54;
            Block (Suc 0) 0x198a8 55;
            CALL term_printf_acode;
            Block (Suc 0) 0x198ad 56;
            Block (Suc 0) 0x198b1 57;
            CALL term_print_filename_acode;
            Block (Suc 0) 0x198b6 58;
            IF !ZF THEN
              Block 3 0x199e7 59;
              Block (Suc 0) 0x199e9 60;
              CALL term_printf_acode;
              Block (Suc 0) 0x199ee 61;
              Block (Suc 0) 0x199f5 62;
              CALL term_print_filename_acode;
              Block (Suc 0) 0x199fa 63
            ELSE
              Block (Suc 0) 0x198bd 64
            FI;
            Block 3 0x198cd 65;
            Block (Suc 0) 0x198cf 66;
            CALL term_printf_acode;
            Block 4 0x198e2 67;
            Block (Suc 0) 0x198e4 68;
            CALL term_printf_acode;
            Block 2 0x198f0 69;
            IF ZF THEN
              Block 2 0x19901 70
            ELSE
              Block 4 0x198fd 71;
              IF !ZF THEN
                Block (Suc 0) 0x198ff 72
              ELSE
                Block 2 0x19901 73
              FI
            FI;
            Block 2 0x1990b 74;
            Block (Suc 0) 0x1990d 75;
            CALL term_printf_acode
          FI
        FI;
        Block 2 0x19919 76;
        Block (Suc 0) 0x1991b 77;
        CALL term_printf_acode;
        Block 2 0x19927 78;
        IF ZF THEN
          Block (Suc 0) 0x1992a 79
        ELSE
          Block (Suc 0) 0x1992a 80
        FI
      OD
    ELSE
      Block 2 0x19861 81
    FI;
    Block 2 0x19a01 82
  \<close>

method vcg_while for P :: state_pred uses assms =
  ((rule htriples)+)?,
  rule HTriple_weaken[where P=P],
  simp add: pred_logic Ps Qs assms,
  rule HTriple_while,
  (vcg_step assms: assms)+,
  (simp add: pred_logic Ps Qs)+,
  (vcg_step' assms: assms | vcg_step assms: assms)+,
  ((simp add: assms)+)?

schematic_goal "bdrv_info":
  assumes
    \<open>\<forall>\<sigma>. RIP \<sigma> = 0x1985b \<longrightarrow> P_0x1985b_true_1_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x19930 \<longrightarrow> P_0x19930_2_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x19940 \<longrightarrow> P_0x19940_3_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x19945 \<longrightarrow> P_0x19945_4_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x1994e \<longrightarrow> P_0x1994e_5_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x19953 \<longrightarrow> P_0x19953_6_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x1995c \<longrightarrow> P_0x1995c_true_7_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x199d1 \<longrightarrow> P_0x199d1_8_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x199d6 \<longrightarrow> P_0x199d6_9_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x1995c \<longrightarrow> P_0x1995c_false_10_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x19961 \<longrightarrow> P_0x19961_true_11_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x19872 \<longrightarrow> P_0x19872_true_12_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x199b7 \<longrightarrow> P_0x199b7_13_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x199bc \<longrightarrow> P_0x199bc_14_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x19872 \<longrightarrow> P_0x19872_false_15_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x19961 \<longrightarrow> P_0x19961_false_16_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x19970 \<longrightarrow> P_0x19970_17_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x19975 \<longrightarrow> P_0x19975_18_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x19878 \<longrightarrow> P_0x19878_19_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x19884 \<longrightarrow> P_0x19884_20_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x19889 \<longrightarrow> P_0x19889_21_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x1988e \<longrightarrow> P_0x1988e_true_22_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x1998c \<longrightarrow> P_0x1998c_23_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x19991 \<longrightarrow> P_0x19991_24_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x19996 \<longrightarrow> P_0x19996_true_25_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x198a8 \<longrightarrow> P_0x198a8_26_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x198ad \<longrightarrow> P_0x198ad_27_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x198b1 \<longrightarrow> P_0x198b1_28_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x198b6 \<longrightarrow> P_0x198b6_29_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x198bd \<longrightarrow> P_0x198bd_true_30_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x199e9 \<longrightarrow> P_0x199e9_31_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x199ee \<longrightarrow> P_0x199ee_32_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x199f5 \<longrightarrow> P_0x199f5_33_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x199fa \<longrightarrow> P_0x199fa_34_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x198bd \<longrightarrow> P_0x198bd_false_35_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x198c3 \<longrightarrow> P_0x198c3_36_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x198cf \<longrightarrow> P_0x198cf_37_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x198d4 \<longrightarrow> P_0x198d4_38_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x198e4 \<longrightarrow> P_0x198e4_39_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x198e9 \<longrightarrow> P_0x198e9_40_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x198f3 \<longrightarrow> P_0x198f3_true_41_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x198f3 \<longrightarrow> P_0x198f3_false_42_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x198ff \<longrightarrow> P_0x198ff_true_43_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x198ff \<longrightarrow> P_0x198ff_false_44_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x19904 \<longrightarrow> P_0x19904_45_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x1990d \<longrightarrow> P_0x1990d_46_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x19996 \<longrightarrow> P_0x19996_false_47_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x199a5 \<longrightarrow> P_0x199a5_48_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x199aa \<longrightarrow> P_0x199aa_49_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x1988e \<longrightarrow> P_0x1988e_false_50_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x19899 \<longrightarrow> P_0x19899_true_51_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x199a5 \<longrightarrow> P_0x199a5_52_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x199aa \<longrightarrow> P_0x199aa_53_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x19899 \<longrightarrow> P_0x19899_false_54_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x198a8 \<longrightarrow> P_0x198a8_55_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x198ad \<longrightarrow> P_0x198ad_56_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x198b1 \<longrightarrow> P_0x198b1_57_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x198b6 \<longrightarrow> P_0x198b6_58_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x198bd \<longrightarrow> P_0x198bd_true_59_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x199e9 \<longrightarrow> P_0x199e9_60_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x199ee \<longrightarrow> P_0x199ee_61_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x199f5 \<longrightarrow> P_0x199f5_62_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x199fa \<longrightarrow> P_0x199fa_63_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x198bd \<longrightarrow> P_0x198bd_false_64_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x198c3 \<longrightarrow> P_0x198c3_65_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x198cf \<longrightarrow> P_0x198cf_66_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x198d4 \<longrightarrow> P_0x198d4_67_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x198e4 \<longrightarrow> P_0x198e4_68_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x198e9 \<longrightarrow> P_0x198e9_69_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x198f3 \<longrightarrow> P_0x198f3_true_70_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x198f3 \<longrightarrow> P_0x198f3_false_71_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x198ff \<longrightarrow> P_0x198ff_true_72_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x198ff \<longrightarrow> P_0x198ff_false_73_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x19904 \<longrightarrow> P_0x19904_74_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x1990d \<longrightarrow> P_0x1990d_75_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x19912 \<longrightarrow> P_0x19912_76_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x1991b \<longrightarrow> P_0x1991b_77_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x19920 \<longrightarrow> P_0x19920_78_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x1992a \<longrightarrow> P_0x1992a_true_79_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x1992a \<longrightarrow> P_0x1992a_false_80_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x1985b \<longrightarrow> P_0x1985b_false_81_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x19a00 \<longrightarrow> P_0x19a00_82_regions \<sigma>\<close>
    and [blocks]: \<open>{{Q_term_printf_addr_0x19940_3}} \<box>term_printf_acode {{P_0x19945_4;M_0x19940}}\<close>
    and [blocks]: \<open>{{Q_term_printf_addr_0x1994e_5}} \<box>term_printf_acode {{P_0x19953_6;M_0x1994e}}\<close>
    and [blocks]: \<open>{{Q_term_printf_addr_0x199d1_8}} \<box>term_printf_acode {{P_0x199d6_9;M_0x199d1}}\<close>
    and [blocks]: \<open>{{Q_term_printf_addr_0x199b7_13}} \<box>term_printf_acode {{P_0x199bc_14;M_0x199b7}}\<close>
    and [blocks]: \<open>{{Q_term_printf_addr_0x19970_17}} \<box>term_printf_acode {{P_0x19975_18;M_0x19970}}\<close>
    and [blocks]: \<open>{{Q_term_printf_addr_0x19884_20}} \<box>term_printf_acode {{P_0x19889_21;M_0x19884}}\<close>
    and [blocks]: \<open>{{Q_term_printf_addr_0x1998c_23}} \<box>term_printf_acode {{P_0x19991_24;M_0x1998c}}\<close>
    and [blocks]: \<open>{{Q_term_printf_addr_0x198a8_26}} \<box>term_printf_acode {{P_0x198ad_27;M_0x198a8}}\<close>
    and [blocks]: \<open>{{Q_term_print_filename_addr_0x198b1_28}} \<box>term_print_filename_acode {{P_0x198b6_29;M_0x198b1}}\<close>
    and [blocks]: \<open>{{Q_term_printf_addr_0x199e9_31}} \<box>term_printf_acode {{P_0x199ee_32;M_0x199e9}}\<close>
    and [blocks]: \<open>{{Q_term_print_filename_addr_0x199f5_33}} \<box>term_print_filename_acode {{P_0x199fa_34;M_0x199f5}}\<close>
    and [blocks]: \<open>{{Q_term_printf_addr_0x198cf_37}} \<box>term_printf_acode {{P_0x198d4_38;M_0x198cf}}\<close>
    and [blocks]: \<open>{{Q_term_printf_addr_0x198e4_39}} \<box>term_printf_acode {{P_0x198e9_40;M_0x198e4}}\<close>
    and [blocks]: \<open>{{Q_term_printf_addr_0x1990d_46}} \<box>term_printf_acode {{P_0x19912_76;M_0x1990d}}\<close>
    and [blocks]: \<open>{{Q_term_printf_addr_0x199a5_48}} \<box>term_printf_acode {{P_0x199aa_49;M_0x199a5}}\<close>
    and [blocks]: \<open>{{Q_term_printf_addr_0x199a5_52}} \<box>term_printf_acode {{P_0x199aa_53;M_0x199a5}}\<close>
    and [blocks]: \<open>{{Q_term_printf_addr_0x198a8_55}} \<box>term_printf_acode {{P_0x198ad_56;M_0x198a8}}\<close>
    and [blocks]: \<open>{{Q_term_print_filename_addr_0x198b1_57}} \<box>term_print_filename_acode {{P_0x198b6_58;M_0x198b1}}\<close>
    and [blocks]: \<open>{{Q_term_printf_addr_0x199e9_60}} \<box>term_printf_acode {{P_0x199ee_61;M_0x199e9}}\<close>
    and [blocks]: \<open>{{Q_term_print_filename_addr_0x199f5_62}} \<box>term_print_filename_acode {{P_0x199fa_63;M_0x199f5}}\<close>
    and [blocks]: \<open>{{Q_term_printf_addr_0x198cf_66}} \<box>term_printf_acode {{P_0x198d4_67;M_0x198cf}}\<close>
    and [blocks]: \<open>{{Q_term_printf_addr_0x198e4_68}} \<box>term_printf_acode {{P_0x198e9_69;M_0x198e4}}\<close>
    and [blocks]: \<open>{{Q_term_printf_addr_0x1990d_75}} \<box>term_printf_acode {{P_0x19912_76;M_0x1990d}}\<close>
    and [blocks]: \<open>{{Q_term_printf_addr_0x1991b_77}} \<box>term_printf_acode {{P_0x19920_78;M_0x1991b}}\<close>
  shows \<open>{{?P}} bdrv_info_acode {{?Q;?M}}\<close>
  apply (vcg acode: bdrv_info_acode_def assms: assms)
         apply (vcg_while \<open>P_0x19930_2 || P_0x19a00_82\<close> assms: assms)
  done

end

locale "bdrv_info_stats" = "qemu_img_xen" +
  fixes RAX\<^sub>0\<^sub>v RBX\<^sub>0\<^sub>v RCX\<^sub>0\<^sub>v RDX\<^sub>0\<^sub>v RDI\<^sub>0\<^sub>v RSI\<^sub>0\<^sub>v RSP\<^sub>0\<^sub>v RBP\<^sub>0\<^sub>v R9\<^sub>0\<^sub>v R8\<^sub>0\<^sub>v ret_address\<^sub>v :: \<open>64 word\<close>
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
definition \<open>R9\<^sub>0 \<equiv> R9\<^sub>0\<^sub>v\<close>
definition \<open>R8\<^sub>0 \<equiv> R8\<^sub>0\<^sub>v\<close>
definition \<open>ret_address \<equiv> ret_address\<^sub>v\<close>

definition P_0x19a10_0 :: state_pred where
  \<open>P_0x19a10_0 \<sigma> \<equiv> RIP \<sigma> = 0x19a10 \<and> RAX \<sigma> = RAX\<^sub>0 \<and> RBX \<sigma> = RBX\<^sub>0 \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = RDX\<^sub>0 \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = RSP\<^sub>0 \<and> RBP \<sigma> = RBP\<^sub>0 \<and> R9 \<sigma> = R9\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address\<close>
declare P_0x19a10_0_def[Ps]

definition P_0x19a10_0_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x19a10_0_regions_set \<sigma> \<equiv> {
    (0, 0x2a498, 8),
    (1, RSP\<^sub>0, 8),
    (2, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x10), 8)
  }\<close>

definition P_0x19a10_0_regions :: state_pred where
  \<open>P_0x19a10_0_regions \<sigma> \<equiv> \<exists>regions. P_0x19a10_0_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x19a20_0 :: state_pred where
  \<open>Q_0x19a20_0 \<sigma> \<equiv> RIP \<sigma> = 0x19a20 \<and> RAX \<sigma> = RAX\<^sub>0 \<and> RBX \<sigma> = (\<sigma> \<turnstile> *[0x2a498,8]::64 word) \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = RDX\<^sub>0 \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x18) \<and> RBP \<sigma> = RBP\<^sub>0 \<and> R9 \<sigma> = R9\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> (\<sigma> \<turnstile> *[0x2a498,8]::64 word) = (\<sigma> \<turnstile> *[0x2a498,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = RBX\<^sub>0\<close>
declare Q_0x19a20_0_def[Qs]

schematic_goal bdrv_info_stats_0_5_0x19a10_0x19a1d_0[blocks]:
  assumes \<open>(P_0x19a10_0 && P_0x19a10_0_regions) \<sigma>\<close>
  shows \<open>exec_block 5 0x19a1d 0 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x19a20_0 ?\<sigma> \<and> block_usage P_0x19a10_0_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x19a10_0_def P_0x19a10_0_regions_def post: Q_0x19a20_0_def regionset: P_0x19a10_0_regions_set_def)

definition P_0x19a20_true_1 :: state_pred where
  \<open>P_0x19a20_true_1 \<sigma> \<equiv> RIP \<sigma> = 0x19a20 \<and> RAX \<sigma> = RAX\<^sub>0 \<and> RBX \<sigma> = (\<sigma> \<turnstile> *[0x2a498,8]::64 word) \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = RDX\<^sub>0 \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x18) \<and> RBP \<sigma> = RBP\<^sub>0 \<and> R9 \<sigma> = R9\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> (\<sigma> \<turnstile> *[0x2a498,8]::64 word) = (\<sigma> \<turnstile> *[0x2a498,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = RBX\<^sub>0\<close>
declare P_0x19a20_true_1_def[Ps]

definition P_0x19a20_true_1_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x19a20_true_1_regions_set \<sigma> \<equiv> {
    (0, 0x2a498, 8),
    (1, RSP\<^sub>0, 8),
    (2, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x10), 8)
  }\<close>

definition P_0x19a20_true_1_regions :: state_pred where
  \<open>P_0x19a20_true_1_regions \<sigma> \<equiv> \<exists>regions. P_0x19a20_true_1_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x19a69_1 :: state_pred where
  \<open>Q_0x19a69_1 \<sigma> \<equiv> RIP \<sigma> = 0x19a69 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x18) \<and> (\<sigma> \<turnstile> *[0x2a498,8]::64 word) = (\<sigma> \<turnstile> *[0x2a498,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = RBX\<^sub>0\<close>
declare Q_0x19a69_1_def[Qs]

schematic_goal bdrv_info_stats_0_1_0x19a20_0x19a20_1[blocks]:
  assumes \<open>(P_0x19a20_true_1 && P_0x19a20_true_1_regions && ZF) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x19a20 (Suc 0) \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x19a69_1 ?\<sigma> \<and> block_usage P_0x19a20_true_1_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x19a20_true_1_def P_0x19a20_true_1_regions_def post: Q_0x19a69_1_def regionset: P_0x19a20_true_1_regions_set_def)

definition P_0x19a20_false_2 :: state_pred where
  \<open>P_0x19a20_false_2 \<sigma> \<equiv> RIP \<sigma> = 0x19a20 \<and> RAX \<sigma> = RAX\<^sub>0 \<and> RBX \<sigma> = (\<sigma> \<turnstile> *[0x2a498,8]::64 word) \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = RDX\<^sub>0 \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x18) \<and> RBP \<sigma> = RBP\<^sub>0 \<and> R9 \<sigma> = R9\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> (\<sigma> \<turnstile> *[0x2a498,8]::64 word) = (\<sigma> \<turnstile> *[0x2a498,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = RBX\<^sub>0\<close>
declare P_0x19a20_false_2_def[Ps]

definition P_0x19a20_false_2_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x19a20_false_2_regions_set \<sigma> \<equiv> {
    (0, 0x2a498, 8),
    (1, RSP\<^sub>0, 8),
    (2, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x10), 8)
  }\<close>

definition P_0x19a20_false_2_regions :: state_pred where
  \<open>P_0x19a20_false_2_regions \<sigma> \<equiv> \<exists>regions. P_0x19a20_false_2_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x19a30_2 :: state_pred where
  \<open>Q_0x19a30_2 \<sigma> \<equiv> RIP \<sigma> = 0x19a30 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x18) \<and> RBP \<sigma> = 0x21aa8 \<and> (\<sigma> \<turnstile> *[0x2a498,8]::64 word) = (\<sigma> \<turnstile> *[0x2a498,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = RBX\<^sub>0\<close>
declare Q_0x19a30_2_def[Qs]

schematic_goal bdrv_info_stats_0_3_0x19a20_0x19a29_2[blocks]:
  assumes \<open>(P_0x19a20_false_2 && P_0x19a20_false_2_regions && ! ZF) \<sigma>\<close>
  shows \<open>exec_block 3 0x19a29 2 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x19a30_2 ?\<sigma> \<and> block_usage P_0x19a20_false_2_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x19a20_false_2_def P_0x19a20_false_2_regions_def post: Q_0x19a30_2_def regionset: P_0x19a20_false_2_regions_set_def)

definition P_0x19a30_3 :: state_pred where
  \<open>P_0x19a30_3 \<sigma> \<equiv> RIP \<sigma> = 0x19a30 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x18) \<and> RBP \<sigma> = 0x21aa8 \<and> (\<sigma> \<turnstile> *[0x2a498,8]::64 word) = (\<sigma> \<turnstile> *[0x2a498,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = RBX\<^sub>0\<close>
declare P_0x19a30_3_def[Ps]

definition P_0x19a30_3_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x19a30_3_regions_set \<sigma> \<equiv> {
    (0, 0x2a498, 8),
    (1, RSP\<^sub>0, 8),
    (2, ((RBX \<sigma>::64 word) + 0x860), 8),
    (3, ((RBX \<sigma>::64 word) + 0x868), 8),
    (4, ((RBX \<sigma>::64 word) + 0x870), 8),
    (5, ((RBX \<sigma>::64 word) + 0x878), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x10), 8)
  }\<close>

definition P_0x19a30_3_regions :: state_pred where
  \<open>P_0x19a30_3_regions \<sigma> \<equiv> \<exists>regions. P_0x19a30_3_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x19a58_3 :: state_pred where
  \<open>Q_0x19a58_3 \<sigma> \<equiv> RIP \<sigma> = 0x19a58 \<and> RAX \<sigma> = 0x0 \<and> RCX \<sigma> = (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x868),8]::64 word) \<and> RDX \<sigma> = (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x860),8]::64 word) \<and> RDI \<sigma> = 0x21aa8 \<and> RSI \<sigma> = ((RBX \<sigma>::64 word) + 0x898) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x18) \<and> RBP \<sigma> = 0x21aa8 \<and> R9 \<sigma> = (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x878),8]::64 word) \<and> R8 \<sigma> = (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x870),8]::64 word) \<and> (\<sigma> \<turnstile> *[0x2a498,8]::64 word) = (\<sigma> \<turnstile> *[0x2a498,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x860),8]::64 word) = (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x860),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x868),8]::64 word) = (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x868),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x870),8]::64 word) = (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x870),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x878),8]::64 word) = (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x878),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = RBX\<^sub>0\<close>
declare Q_0x19a58_3_def[Qs]

schematic_goal bdrv_info_stats_0_7_0x19a30_0x19a55_3[blocks]:
  assumes \<open>(P_0x19a30_3 && P_0x19a30_3_regions) \<sigma>\<close>
  shows \<open>exec_block 7 0x19a55 3 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x19a58_3 ?\<sigma> \<and> block_usage P_0x19a30_3_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x19a30_3_def P_0x19a30_3_regions_def post: Q_0x19a58_3_def regionset: P_0x19a30_3_regions_set_def)

definition P_0x19a58_4 :: state_pred where
  \<open>P_0x19a58_4 \<sigma> \<equiv> RIP \<sigma> = 0x19a58 \<and> RAX \<sigma> = 0x0 \<and> RCX \<sigma> = (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x868),8]::64 word) \<and> RDX \<sigma> = (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x860),8]::64 word) \<and> RDI \<sigma> = 0x21aa8 \<and> RSI \<sigma> = ((RBX \<sigma>::64 word) + 0x898) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x18) \<and> RBP \<sigma> = 0x21aa8 \<and> R9 \<sigma> = (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x878),8]::64 word) \<and> R8 \<sigma> = (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x870),8]::64 word) \<and> (\<sigma> \<turnstile> *[0x2a498,8]::64 word) = (\<sigma> \<turnstile> *[0x2a498,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x860),8]::64 word) = (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x860),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x868),8]::64 word) = (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x868),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x870),8]::64 word) = (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x870),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x878),8]::64 word) = (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x878),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = RBX\<^sub>0\<close>
declare P_0x19a58_4_def[Ps]

definition P_0x19a58_4_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x19a58_4_regions_set \<sigma> \<equiv> {
    (0, 0x2a498, 8),
    (1, RSP\<^sub>0, 8),
    (2, ((RBX \<sigma>::64 word) + 0x860), 8),
    (3, ((RBX \<sigma>::64 word) + 0x868), 8),
    (4, ((RBX \<sigma>::64 word) + 0x870), 8),
    (5, ((RBX \<sigma>::64 word) + 0x878), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x20), 8)
  }\<close>

definition P_0x19a58_4_regions :: state_pred where
  \<open>P_0x19a58_4_regions \<sigma> \<equiv> \<exists>regions. P_0x19a58_4_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_term_printf_addr_0x19a58_4 :: state_pred where
  \<open>Q_term_printf_addr_0x19a58_4 \<sigma> \<equiv> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x20) \<and> RIP \<sigma> = term_printf_addr \<and> RAX \<sigma> = 0x0 \<and> RCX \<sigma> = (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x868),8]::64 word) \<and> RDX \<sigma> = (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x860),8]::64 word) \<and> RDI \<sigma> = 0x21aa8 \<and> RSI \<sigma> = ((RBX \<sigma>::64 word) + 0x898) \<and> RBP \<sigma> = 0x21aa8 \<and> R9 \<sigma> = (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x878),8]::64 word) \<and> R8 \<sigma> = (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x870),8]::64 word) \<and> (\<sigma> \<turnstile> *[0x2a498,8]::64 word) = (\<sigma> \<turnstile> *[0x2a498,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x860),8]::64 word) = (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x860),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x868),8]::64 word) = (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x868),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x870),8]::64 word) = (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x870),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x878),8]::64 word) = (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x878),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = 0x19a5d\<close>
declare Q_term_printf_addr_0x19a58_4_def[Qs]

schematic_goal bdrv_info_stats_0_1_0x19a58_0x19a58_4[blocks]:
  assumes \<open>(P_0x19a58_4 && P_0x19a58_4_regions) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x19a58 4 \<sigma> \<triangleq> ?\<sigma> \<and> Q_term_printf_addr_0x19a58_4 ?\<sigma> \<and> block_usage P_0x19a58_4_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x19a58_4_def P_0x19a58_4_regions_def post: Q_term_printf_addr_0x19a58_4_def regionset: P_0x19a58_4_regions_set_def)

definition P_0x19a5d_5 :: state_pred where
  \<open>P_0x19a5d_5 \<sigma> \<equiv> RIP \<sigma> = 0x19a5d \<and> RAX \<sigma> = term_printf_0x19a58_retval \<and> RCX \<sigma> = (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x868),8]::64 word) \<and> RDX \<sigma> = (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x860),8]::64 word) \<and> RDI \<sigma> = 0x21aa8 \<and> RSI \<sigma> = ((RBX \<sigma>::64 word) + 0x898) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x18) \<and> RBP \<sigma> = 0x21aa8 \<and> R9 \<sigma> = (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x878),8]::64 word) \<and> R8 \<sigma> = (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x870),8]::64 word) \<and> (\<sigma> \<turnstile> *[0x2a498,8]::64 word) = (\<sigma> \<turnstile> *[0x2a498,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x860),8]::64 word) = (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x860),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x868),8]::64 word) = (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x868),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x870),8]::64 word) = (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x870),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x878),8]::64 word) = (\<sigma> \<turnstile> *[((RBX \<sigma>::64 word) + 0x878),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = 0x19a5d\<close>
declare P_0x19a5d_5_def[Ps]

definition P_0x19a5d_5_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x19a5d_5_regions_set \<sigma> \<equiv> {
    (0, 0x2a498, 8),
    (1, RSP\<^sub>0, 8),
    (2, ((RBX \<sigma>::64 word) + 0x860), 8),
    (3, ((RBX \<sigma>::64 word) + 0x868), 8),
    (4, ((RBX \<sigma>::64 word) + 0x870), 8),
    (5, ((RBX \<sigma>::64 word) + 0x878), 8),
    (6, ((RBX \<sigma>::64 word) + 0x8b8), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x20), 8)
  }\<close>

definition P_0x19a5d_5_regions :: state_pred where
  \<open>P_0x19a5d_5_regions \<sigma> \<equiv> \<exists>regions. P_0x19a5d_5_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x19a67_5 :: state_pred where
  \<open>Q_0x19a67_5 \<sigma> \<equiv> RIP \<sigma> = 0x19a67 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x18) \<and> RBP \<sigma> = 0x21aa8 \<and> (\<sigma> \<turnstile> *[0x2a498,8]::64 word) = (\<sigma> \<turnstile> *[0x2a498,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = RBX\<^sub>0\<close>
declare Q_0x19a67_5_def[Qs]

schematic_goal bdrv_info_stats_0_2_0x19a5d_0x19a64_5[blocks]:
  assumes \<open>(P_0x19a5d_5 && P_0x19a5d_5_regions) \<sigma>\<close>
  shows \<open>exec_block 2 0x19a64 5 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x19a67_5 ?\<sigma> \<and> block_usage P_0x19a5d_5_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x19a5d_5_def P_0x19a5d_5_regions_def post: Q_0x19a67_5_def regionset: P_0x19a5d_5_regions_set_def)

definition P_0x19a67_true_6 :: state_pred where
  \<open>P_0x19a67_true_6 \<sigma> \<equiv> RIP \<sigma> = 0x19a67 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x18) \<and> RBP \<sigma> = 0x21aa8 \<and> (\<sigma> \<turnstile> *[0x2a498,8]::64 word) = (\<sigma> \<turnstile> *[0x2a498,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = RBX\<^sub>0\<close>
declare P_0x19a67_true_6_def[Ps]

definition P_0x19a67_true_6_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x19a67_true_6_regions_set \<sigma> \<equiv> {
    (0, 0x2a498, 8),
    (1, RSP\<^sub>0, 8),
    (2, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x10), 8)
  }\<close>

definition P_0x19a67_true_6_regions :: state_pred where
  \<open>P_0x19a67_true_6_regions \<sigma> \<equiv> \<exists>regions. P_0x19a67_true_6_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x19a30_6 :: state_pred where
  \<open>Q_0x19a30_6 \<sigma> \<equiv> RIP \<sigma> = 0x19a30 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x18) \<and> RBP \<sigma> = 0x21aa8 \<and> (\<sigma> \<turnstile> *[0x2a498,8]::64 word) = (\<sigma> \<turnstile> *[0x2a498,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = RBX\<^sub>0\<close>
declare Q_0x19a30_6_def[Qs]

schematic_goal bdrv_info_stats_0_1_0x19a67_0x19a67_6[blocks]:
  assumes \<open>(P_0x19a67_true_6 && P_0x19a67_true_6_regions && !ZF) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x19a67 6 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x19a30_6 ?\<sigma> \<and> block_usage P_0x19a67_true_6_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x19a67_true_6_def P_0x19a67_true_6_regions_def post: Q_0x19a30_6_def regionset: P_0x19a67_true_6_regions_set_def)

definition P_0x19a67_false_7 :: state_pred where
  \<open>P_0x19a67_false_7 \<sigma> \<equiv> RIP \<sigma> = 0x19a67 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x18) \<and> RBP \<sigma> = 0x21aa8 \<and> (\<sigma> \<turnstile> *[0x2a498,8]::64 word) = (\<sigma> \<turnstile> *[0x2a498,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = RBX\<^sub>0\<close>
declare P_0x19a67_false_7_def[Ps]

definition P_0x19a67_false_7_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x19a67_false_7_regions_set \<sigma> \<equiv> {
    (0, 0x2a498, 8),
    (1, RSP\<^sub>0, 8),
    (2, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x10), 8)
  }\<close>

definition P_0x19a67_false_7_regions :: state_pred where
  \<open>P_0x19a67_false_7_regions \<sigma> \<equiv> \<exists>regions. P_0x19a67_false_7_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x19a69_7 :: state_pred where
  \<open>Q_0x19a69_7 \<sigma> \<equiv> RIP \<sigma> = 0x19a69 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x18) \<and> RBP \<sigma> = 0x21aa8 \<and> (\<sigma> \<turnstile> *[0x2a498,8]::64 word) = (\<sigma> \<turnstile> *[0x2a498,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = RBX\<^sub>0\<close>
declare Q_0x19a69_7_def[Qs]

schematic_goal bdrv_info_stats_0_1_0x19a67_0x19a67_7[blocks]:
  assumes \<open>(P_0x19a67_false_7 && P_0x19a67_false_7_regions && ! !ZF) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x19a67 7 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x19a69_7 ?\<sigma> \<and> block_usage P_0x19a67_false_7_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x19a67_false_7_def P_0x19a67_false_7_regions_def post: Q_0x19a69_7_def regionset: P_0x19a67_false_7_regions_set_def)

definition P_0x19a69_8 :: state_pred where
  \<open>P_0x19a69_8 \<sigma> \<equiv> RIP \<sigma> = 0x19a69 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x18) \<and> (\<sigma> \<turnstile> *[0x2a498,8]::64 word) = (\<sigma> \<turnstile> *[0x2a498,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = RBX\<^sub>0\<close>
declare P_0x19a69_8_def[Ps]

definition P_0x19a69_8_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x19a69_8_regions_set \<sigma> \<equiv> {
    (0, 0x2a498, 8),
    (1, RSP\<^sub>0, 8),
    (2, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x10), 8)
  }\<close>

definition P_0x19a69_8_regions :: state_pred where
  \<open>P_0x19a69_8_regions \<sigma> \<equiv> \<exists>regions. P_0x19a69_8_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_ret_address_8 :: state_pred where
  \<open>Q_ret_address_8 \<sigma> \<equiv> RIP \<sigma> = ret_address \<and> RBX \<sigma> = RBX\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) + 0x8) \<and> RBP \<sigma> = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[0x2a498,8]::64 word) = (\<sigma> \<turnstile> *[0x2a498,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = RBX\<^sub>0\<close>
declare Q_ret_address_8_def[Qs]

schematic_goal bdrv_info_stats_0_4_0x19a69_0x19a6f_8[blocks]:
  assumes \<open>(P_0x19a69_8 && P_0x19a69_8_regions) \<sigma>\<close>
  shows \<open>exec_block 4 0x19a6f 8 \<sigma> \<triangleq> ?\<sigma> \<and> Q_ret_address_8 ?\<sigma> \<and> block_usage P_0x19a69_8_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x19a69_8_def P_0x19a69_8_regions_def post: Q_ret_address_8_def regionset: P_0x19a69_8_regions_set_def)

definition bdrv_info_stats_acode :: ACode where
  \<open>bdrv_info_stats_acode =
    Block 5 0x19a1d 0;
    IF ZF THEN
      Block (Suc 0) 0x19a20 (Suc 0)
    ELSE
      Block 3 0x19a29 2;
      WHILE P_0x19a30_3 DO
        Block 7 0x19a55 3;
        Block (Suc 0) 0x19a58 4;
        CALL term_printf_acode;
        Block 2 0x19a64 5;
        IF !ZF THEN
          Block (Suc 0) 0x19a67 6
        ELSE
          Block (Suc 0) 0x19a67 7
        FI
      OD
    FI;
    Block 4 0x19a6f 8
  \<close>

schematic_goal "bdrv_info_stats":
  assumes
    \<open>\<forall>\<sigma>. RIP \<sigma> = 0x19a20 \<longrightarrow> P_0x19a20_true_1_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x19a20 \<longrightarrow> P_0x19a20_false_2_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x19a30 \<longrightarrow> P_0x19a30_3_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x19a58 \<longrightarrow> P_0x19a58_4_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x19a5d \<longrightarrow> P_0x19a5d_5_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x19a67 \<longrightarrow> P_0x19a67_true_6_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x19a67 \<longrightarrow> P_0x19a67_false_7_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x19a69 \<longrightarrow> P_0x19a69_8_regions \<sigma>\<close>
    and [blocks]: \<open>{{Q_term_printf_addr_0x19a58_4}} \<box>term_printf_acode {{P_0x19a5d_5;M_0x19a58}}\<close>
  shows \<open>{{?P}} bdrv_info_stats_acode {{?Q;?M}}\<close>
  apply (vcg acode: bdrv_info_stats_acode_def assms: assms)
        apply (vcg_while \<open>P_0x19a30_3 || P_0x19a69_8\<close> assms: assms)
  done

end

end
