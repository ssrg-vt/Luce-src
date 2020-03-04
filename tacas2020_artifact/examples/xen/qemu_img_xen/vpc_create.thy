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
theory vpc_create
  imports "../../../isabelle/VCG/HTriple"
begin

locale "qemu_img_xen" = execution_context + exec_code +
  fixes UD2_0x3748_retval\<^sub>v UD2_0x3751_retval\<^sub>v UD2_0x375f_retval\<^sub>v UD2_0x3769_retval\<^sub>v UD2_0x3773_retval\<^sub>v UD2_0x3796_retval\<^sub>v UD2_0x37a0_retval\<^sub>v UD2_0x37aa_retval\<^sub>v UD2_0x37b7_retval\<^sub>v open64_0xb4a1_retval\<^sub>v rep_stos_ESRDI_RAX_0xb535_retval\<^sub>v time_0xb577_retval\<^sub>v write_0xb5e9_retval\<^sub>v lseek64_0xb618_retval\<^sub>v write_0xb62d_retval\<^sub>v lseek64_0xb644_retval\<^sub>v rep_stos_ESRDI_RAX_0xb663_retval\<^sub>v write_0xb683_retval\<^sub>v rep_stos_ESRDI_RAX_0xb6ed_retval\<^sub>v lseek64_0xb762_retval\<^sub>v write_0xb77b_retval\<^sub>v close_0xb78f_retval\<^sub>v stack_chk_fail_0xb936_retval\<^sub>v UD2_addr stack_chk_fail_addr close_addr lseek64_addr open64_addr rep_stos_ESRDI_RAX_addr time_addr write_addr :: \<open>64 word\<close>
    and UD2_acode stack_chk_fail_acode close_acode lseek64_acode open64_acode rep_stos_ESRDI_RAX_acode time_acode write_acode :: ACode
  assumes fetch:
    "fetch 0x3741 \<equiv> (Binary (IS_8088 Mov) (Reg (General ThirtyTwo rax)) (Storage (Memory ThirtyTwo (A_SizeDirective 32 (A_Plus (A_FromReg (General SixtyFour ds)) (A_WordConstant 20))))), 7)"
    "fetch 0x3748 \<equiv> (Unary (IS_8088 Call) (Immediate SixtyFour (ImmLabel ''UD2'')), 2)"
    "fetch 0x374a \<equiv> (Binary (IS_8088 Mov) (Reg (General ThirtyTwo rax)) (Storage (Memory ThirtyTwo (A_SizeDirective 32 (A_Plus (A_FromReg (General SixtyFour ds)) (A_WordConstant 32))))), 7)"
    "fetch 0x3751 \<equiv> (Unary (IS_8088 Call) (Immediate SixtyFour (ImmLabel ''UD2'')), 5)"
    "fetch 0x3753 \<equiv> (Binary (IS_8088 Mov) (Memory SixtyFour (A_SizeDirective 64 (A_Plus (A_FromReg (General SixtyFour ds)) (A_WordConstant 0)))) (Immediate SixtyFour (ImmVal 0)), 12)"
    "fetch 0x375f \<equiv> (Unary (IS_8088 Call) (Immediate SixtyFour (ImmLabel ''UD2'')), 2)"
    "fetch 0x3761 \<equiv> (Binary (IS_8088 Mov) (Memory SixtyFour (A_SizeDirective 64 (A_Plus (A_FromReg (General SixtyFour ds)) (A_WordConstant 0)))) (Storage (Reg (General SixtyFour r8))), 8)"
    "fetch 0x3769 \<equiv> (Unary (IS_8088 Call) (Immediate SixtyFour (ImmLabel ''UD2'')), 2)"
    "fetch 0x376b \<equiv> (Binary (IS_8088 Mov) (Memory SixtyFour (A_SizeDirective 64 (A_Plus (A_FromReg (General SixtyFour ds)) (A_WordConstant 0)))) (Storage (Reg (General SixtyFour r12))), 8)"
    "fetch 0x3773 \<equiv> (Unary (IS_8088 Call) (Immediate SixtyFour (ImmLabel ''UD2'')), 5)"
    "fetch 0x377f \<equiv> (Binary (IS_8088 Mov) (Memory SixtyFour (A_SizeDirective 64 (A_Plus (A_FromReg (General SixtyFour r12)) (A_WordConstant 32896)))) (Immediate SixtyFour (ImmVal 0)), 12)"
    "fetch 0x378b \<equiv> (Binary (IS_8088 Mov) (Memory ThirtyTwo (A_SizeDirective 32 (A_Plus (A_FromReg (General SixtyFour ds)) (A_WordConstant 0)))) (Immediate SixtyFour (ImmVal 0)), 11)"
    "fetch 0x3796 \<equiv> (Unary (IS_8088 Call) (Immediate SixtyFour (ImmLabel ''UD2'')), 2)"
    "fetch 0x3798 \<equiv> (Binary (IS_8088 Mov) (Memory Eight (A_SizeDirective 8 (A_Plus (A_FromReg (General SixtyFour ds)) (A_WordConstant 11)))) (Immediate SixtyFour (ImmVal 0)), 8)"
    "fetch 0x37a0 \<equiv> (Unary (IS_8088 Call) (Immediate SixtyFour (ImmLabel ''UD2'')), 5)"
    "fetch 0x37a2 \<equiv> (Binary (IS_8088 Mov) (Memory Eight (A_SizeDirective 8 (A_Plus (A_FromReg (General SixtyFour ds)) (A_WordConstant 11)))) (Immediate SixtyFour (ImmVal 0)), 8)"
    "fetch 0x37aa \<equiv> (Unary (IS_8088 Call) (Immediate SixtyFour (ImmLabel ''UD2'')), 2)"
    "fetch 0x37ac \<equiv> (Binary (IS_8088 Mov) (Memory ThirtyTwo (A_SizeDirective 32 (A_Plus (A_FromReg (General SixtyFour ds)) (A_WordConstant 0)))) (Immediate SixtyFour (ImmVal 0)), 11)"
    "fetch 0x37b7 \<equiv> (Unary (IS_8088 Call) (Immediate SixtyFour (ImmLabel ''UD2'')), 2)"
    "fetch 0xb460 \<equiv> (Unary (IS_8088 Push) (Storage (Reg (General SixtyFour r15))), 2)"
    "fetch 0xb462 \<equiv> (Unary (IS_8088 Push) (Storage (Reg (General SixtyFour r14))), 2)"
    "fetch 0xb464 \<equiv> (Unary (IS_8088 Push) (Storage (Reg (General SixtyFour r13))), 2)"
    "fetch 0xb466 \<equiv> (Unary (IS_8088 Push) (Storage (Reg (General SixtyFour r12))), 2)"
    "fetch 0xb468 \<equiv> (Unary (IS_8088 Push) (Storage (Reg (General SixtyFour rbp))), 1)"
    "fetch 0xb469 \<equiv> (Unary (IS_8088 Push) (Storage (Reg (General SixtyFour rbx))), 1)"
    "fetch 0xb46a \<equiv> (Binary (IS_8088 Sub) (Reg (General SixtyFour rsp)) (Immediate SixtyFour (ImmVal 1064)), 7)"
    "fetch 0xb471 \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour rax)) (Storage (Memory SixtyFour (A_SizeDirective 64 (A_Plus (A_FromReg (General SixtyFour fs)) (A_WordConstant 40))))), 9)"
    "fetch 0xb47a \<equiv> (Binary (IS_8088 Mov) (Memory SixtyFour (A_SizeDirective 64 (A_Plus (A_FromReg (General SixtyFour rsp)) (A_WordConstant 1048)))) (Storage (Reg (General SixtyFour rax))), 8)"
    "fetch 0xb482 \<equiv> (Binary (IS_8088 Xor) (Reg (General ThirtyTwo rax)) (Storage (Reg (General ThirtyTwo rax))), 2)"
    "fetch 0xb484 \<equiv> (Binary (IS_8088 Mov) (Reg (General ThirtyTwo rax)) (Immediate SixtyFour (ImmVal 4294967201)), 5)"
    "fetch 0xb489 \<equiv> (Binary (IS_8088 Test) (Reg (General SixtyFour rdx)) (Storage (Reg (General SixtyFour rdx))), 3)"
    "fetch 0xb48c \<equiv> (Unary (IS_8088 Jne) (Immediate SixtyFour (ImmVal 46741)), 6)"
    "fetch 0xb492 \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour rbx)) (Storage (Reg (General SixtyFour rsi))), 3)"
    "fetch 0xb495 \<equiv> (Binary (IS_8088 Mov) (Reg (General ThirtyTwo rdx)) (Immediate SixtyFour (ImmVal 420)), 5)"
    "fetch 0xb49a \<equiv> (Binary (IS_8088 Mov) (Reg (General ThirtyTwo rsi)) (Immediate SixtyFour (ImmVal 577)), 5)"
    "fetch 0xb49f \<equiv> (Binary (IS_8088 Xor) (Reg (General ThirtyTwo rax)) (Storage (Reg (General ThirtyTwo rax))), 2)"
    "fetch 0xb4a1 \<equiv> (Unary (IS_8088 Call) (Immediate SixtyFour (ImmLabel ''open64'')), 5)"
    "fetch 0xb4a6 \<equiv> (Binary (IS_8088 Mov) (Reg (General ThirtyTwo r13)) (Storage (Reg (General ThirtyTwo rax))), 3)"
    "fetch 0xb4a9 \<equiv> (Binary (IS_8088 Test) (Reg (General ThirtyTwo rax)) (Storage (Reg (General ThirtyTwo rax))), 2)"
    "fetch 0xb4ab \<equiv> (Unary (IS_8088 Js) (Immediate SixtyFour (ImmVal 46736)), 6)"
    "fetch 0xb4b1 \<equiv> (Binary (IS_8088 Cmp) (Reg (General SixtyFour rbx)) (Immediate SixtyFour (ImmVal 267382800)), 7)"
    "fetch 0xb4b8 \<equiv> (Unary (IS_8088 Jg) (Immediate SixtyFour (ImmVal 46784)), 6)"
    "fetch 0xb4be \<equiv> (Binary (IS_8088 Cmp) (Reg (General SixtyFour rbx)) (Immediate SixtyFour (ImmVal 66059280)), 7)"
    "fetch 0xb4c5 \<equiv> (Unary (IS_8088 Jle) (Immediate SixtyFour (ImmVal 47008)), 6)"
    "fetch 0xb4cb \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour rdx)) (Immediate SixtyFour (ImmVal 9259542123273814145)), 10)"
    "fetch 0xb4d5 \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour rax)) (Storage (Reg (General SixtyFour rbx))), 3)"
    "fetch 0xb4d8 \<equiv> (Unary (IS_8088 Imul) (Storage (Reg (General SixtyFour rdx))), 3)"
    "fetch 0xb4db \<equiv> (Binary (IS_8088 Add) (Reg (General SixtyFour rdx)) (Storage (Reg (General SixtyFour rbx))), 3)"
    "fetch 0xb4de \<equiv> (Binary (IS_8088 Sar) (Reg (General SixtyFour rbx)) (Immediate SixtyFour (ImmVal 63)), 4)"
    "fetch 0xb4e2 \<equiv> (Binary (IS_8088 Sar) (Reg (General SixtyFour rdx)) (Immediate SixtyFour (ImmVal 7)), 4)"
    "fetch 0xb4e6 \<equiv> (Binary (IS_8088 Sub) (Reg (General SixtyFour rdx)) (Storage (Reg (General SixtyFour rbx))), 3)"
    "fetch 0xb4e9 \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour rbx)) (Storage (Reg (General SixtyFour rdx))), 3)"
    "fetch 0xb4ec \<equiv> (Binary (IS_8088 Add) (Reg (General ThirtyTwo rbx)) (Immediate SixtyFour (ImmVal 15)), 3)"
    "fetch 0xb4ef \<equiv> (Binary (IS_8088 Shr) (Reg (General ThirtyTwo rbx)) (Immediate SixtyFour (ImmVal 4)), 3)"
    "fetch 0xb4f2 \<equiv> (Binary (IS_8088 Mov) (Reg (General ThirtyTwo rax)) (Storage (Reg (General ThirtyTwo rbx))), 2)"
    "fetch 0xb4f4 \<equiv> (Binary (IS_8088 Rol) (Reg (General Sixteen rbx)) (Immediate SixtyFour (ImmVal 8)), 4)"
    "fetch 0xb4f8 \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour r12)) (Storage (Reg (General SixtyFour rax))), 3)"
    "fetch 0xb4fb \<equiv> (Binary (IS_8088 Shl) (Reg (General SixtyFour r12)) (Immediate SixtyFour (ImmVal 8)), 4)"
    "fetch 0xb4ff \<equiv> (Binary (IS_8088 Sub) (Reg (General SixtyFour r12)) (Storage (Reg (General SixtyFour rax))), 3)"
    "fetch 0xb502 \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour r14)) (Storage (Reg (General SixtyFour r12))), 3)"
    "fetch 0xb505 \<equiv> (Binary (IS_8088 Shl) (Reg (General SixtyFour r12)) (Immediate SixtyFour (ImmVal 13)), 4)"
    "fetch 0xb509 \<equiv> (Binary (IS_8088 Shl) (Reg (General SixtyFour r14)) (Immediate SixtyFour (ImmVal 4)), 4)"
    "fetch 0xb50d \<equiv> (Unary (IS_80486 Bswap) (Storage (Reg (General SixtyFour r12))), 3)"
    "fetch 0xb510 \<equiv> (Binary (IS_8088 Add) (Reg (General SixtyFour r14)) (Immediate SixtyFour (ImmVal 4096)), 7)"
    "fetch 0xb517 \<equiv> (Binary (IS_8088 Shr) (Reg (General SixtyFour r14)) (Immediate SixtyFour (ImmVal 12)), 4)"
    "fetch 0xb51b \<equiv> (Binary (IS_8088 Mov) (Memory Eight (A_SizeDirective 8 (A_Plus (A_FromReg (General SixtyFour rsp)) (A_WordConstant 15)))) (Immediate SixtyFour (ImmVal 255)), 5)"
    "fetch 0xb520 \<equiv> (Binary (IS_8088 Mov) (Reg (General ThirtyTwo r15)) (Immediate SixtyFour (ImmVal 16)), 6)"
    "fetch 0xb526 \<equiv> (Binary (IS_8088 Lea) (Reg (General SixtyFour rbp)) (Storage (Memory SixtyFour (A_Plus (A_FromReg (General SixtyFour rsp)) (A_WordConstant 16)))), 5)"
    "fetch 0xb52b \<equiv> (Binary (IS_8088 Xor) (Reg (General ThirtyTwo rax)) (Storage (Reg (General ThirtyTwo rax))), 2)"
    "fetch 0xb52d \<equiv> (Binary (IS_8088 Mov) (Reg (General ThirtyTwo rcx)) (Immediate SixtyFour (ImmVal 128)), 5)"
    "fetch 0xb532 \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour rdi)) (Storage (Reg (General SixtyFour rbp))), 3)"
    "fetch 0xb535 \<equiv> (Unary (IS_8088 Call) (Immediate SixtyFour (ImmLabel ''rep_stos_ESRDI_RAX'')), 3)"
    "fetch 0xb538 \<equiv> (Binary (IS_8088 Xor) (Reg (General ThirtyTwo rdi)) (Storage (Reg (General ThirtyTwo rdi))), 2)"
    "fetch 0xb53a \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour rax)) (Immediate SixtyFour (ImmVal 8676594127358291811)), 10)"
    "fetch 0xb544 \<equiv> (Binary (IS_8088 Mov) (Memory ThirtyTwo (A_SizeDirective 32 (A_Plus (A_FromReg (General SixtyFour rsp)) (A_WordConstant 44)))) (Immediate SixtyFour (ImmVal 1970103665)), 8)"
    "fetch 0xb54c \<equiv> (Binary (IS_8088 Mov) (Memory SixtyFour (A_SizeDirective 64 (A_Plus (A_FromReg (General SixtyFour rsp)) (A_WordConstant 16)))) (Storage (Reg (General SixtyFour rax))), 5)"
    "fetch 0xb551 \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour rax)) (Immediate SixtyFour (ImmVal 1099545182208)), 10)"
    "fetch 0xb55b \<equiv> (Binary (IS_8088 Mov) (Memory SixtyFour (A_SizeDirective 64 (A_Plus (A_FromReg (General SixtyFour rsp)) (A_WordConstant 24)))) (Storage (Reg (General SixtyFour rax))), 5)"
    "fetch 0xb560 \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour rax)) (Immediate SixtyFour (ImmVal 562949953421312)), 10)"
    "fetch 0xb56a \<equiv> (Binary (IS_8088 Mov) (Memory ThirtyTwo (A_SizeDirective 32 (A_Plus (A_FromReg (General SixtyFour rsp)) (A_WordConstant 52)))) (Immediate SixtyFour (ImmVal 1798465879)), 8)"
    "fetch 0xb572 \<equiv> (Binary (IS_8088 Mov) (Memory SixtyFour (A_SizeDirective 64 (A_Plus (A_FromReg (General SixtyFour rsp)) (A_WordConstant 32)))) (Storage (Reg (General SixtyFour rax))), 5)"
    "fetch 0xb577 \<equiv> (Unary (IS_8088 Call) (Immediate SixtyFour (ImmLabel ''time'')), 5)"
    "fetch 0xb57c \<equiv> (Binary (IS_8088 Mov) (Memory ThirtyTwo (A_SizeDirective 32 (A_Plus (A_FromReg (General SixtyFour rsp)) (A_WordConstant 48)))) (Immediate SixtyFour (ImmVal 50332928)), 8)"
    "fetch 0xb584 \<equiv> (Binary (IS_8088 Xor) (Reg (General ThirtyTwo rdx)) (Storage (Reg (General ThirtyTwo rdx))), 2)"
    "fetch 0xb586 \<equiv> (Binary (IS_8088 Lea) (Reg (General SixtyFour rsi)) (Storage (Memory SixtyFour (A_Plus (A_FromReg (General SixtyFour rbp)) (A_WordConstant 512)))), 7)"
    "fetch 0xb58d \<equiv> (Binary (IS_8088 Sub) (Reg (General ThirtyTwo rax)) (Immediate SixtyFour (ImmVal 946684800)), 5)"
    "fetch 0xb592 \<equiv> (Binary (IS_8088 Mov) (Memory Sixteen (A_SizeDirective 16 (A_Plus (A_FromReg (General SixtyFour rsp)) (A_WordConstant 72)))) (Storage (Reg (General Sixteen rbx))), 5)"
    "fetch 0xb597 \<equiv> (Unary (IS_80486 Bswap) (Storage (Reg (General ThirtyTwo rax))), 2)"
    "fetch 0xb599 \<equiv> (Binary (IS_8088 Mov) (Memory Eight (A_SizeDirective 8 (A_Plus (A_FromReg (General SixtyFour rsp)) (A_WordConstant 74)))) (Storage (Reg (General Eight r15))), 5)"
    "fetch 0xb59e \<equiv> (Binary (IS_8088 Mov) (Memory ThirtyTwo (A_SizeDirective 32 (A_Plus (A_FromReg (General SixtyFour rsp)) (A_WordConstant 40)))) (Storage (Reg (General ThirtyTwo rax))), 4)"
    "fetch 0xb5a2 \<equiv> (Binary (IS_80386 Movzx) (Reg (General ThirtyTwo rax)) (Storage (Memory Eight (A_SizeDirective 8 (A_Plus (A_FromReg (General SixtyFour rsp)) (A_WordConstant 15))))), 5)"
    "fetch 0xb5a7 \<equiv> (Binary (IS_8088 Mov) (Memory ThirtyTwo (A_SizeDirective 32 (A_Plus (A_FromReg (General SixtyFour rsp)) (A_WordConstant 76)))) (Immediate SixtyFour (ImmVal 50331648)), 8)"
    "fetch 0xb5af \<equiv> (Binary (IS_8088 Mov) (Memory SixtyFour (A_SizeDirective 64 (A_Plus (A_FromReg (General SixtyFour rsp)) (A_WordConstant 56)))) (Storage (Reg (General SixtyFour r12))), 5)"
    "fetch 0xb5b4 \<equiv> (Binary (IS_8088 Mov) (Memory SixtyFour (A_SizeDirective 64 (A_Plus (A_FromReg (General SixtyFour rsp)) (A_WordConstant 64)))) (Storage (Reg (General SixtyFour r12))), 5)"
    "fetch 0xb5b9 \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour r12)) (Storage (Reg (General SixtyFour rbp))), 3)"
    "fetch 0xb5bc \<equiv> (Binary (IS_8088 Mov) (Memory Eight (A_SizeDirective 8 (A_Plus (A_FromReg (General SixtyFour rsp)) (A_WordConstant 75)))) (Storage (Reg (General Eight rax))), 4)"
    "fetch 0xb5c0 \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour rax)) (Storage (Reg (General SixtyFour rbp))), 3)"
    "fetch 0xb5c3 \<equiv> (Unary (IS_8088 Nop) (Storage (Memory ThirtyTwo (A_SizeDirective 32 (A_Plus (A_FromReg (General SixtyFour rax)) (A_Plus (A_Mult 1 (A_FromReg (General SixtyFour rax))) (A_WordConstant 0)))))), 5)"
    "fetch 0xb5c8 \<equiv> (Binary (IS_80386 Movzx) (Reg (General ThirtyTwo rcx)) (Storage (Memory Eight (A_SizeDirective 8 (A_FromReg (General SixtyFour rax))))), 3)"
    "fetch 0xb5cb \<equiv> (Binary (IS_8088 Add) (Reg (General SixtyFour rax)) (Immediate SixtyFour (ImmVal 1)), 4)"
    "fetch 0xb5cf \<equiv> (Binary (IS_8088 Add) (Reg (General ThirtyTwo rdx)) (Storage (Reg (General ThirtyTwo rcx))), 2)"
    "fetch 0xb5d1 \<equiv> (Binary (IS_8088 Cmp) (Reg (General SixtyFour rsi)) (Storage (Reg (General SixtyFour rax))), 3)"
    "fetch 0xb5d4 \<equiv> (Unary (IS_8088 Jne) (Immediate SixtyFour (ImmVal 46536)), 2)"
    "fetch 0xb5d6 \<equiv> (Unary (IS_8088 Not) (Storage (Reg (General ThirtyTwo rdx))), 2)"
    "fetch 0xb5d8 \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour rsi)) (Storage (Reg (General SixtyFour rbp))), 3)"
    "fetch 0xb5db \<equiv> (Binary (IS_8088 Mov) (Reg (General ThirtyTwo rdi)) (Storage (Reg (General ThirtyTwo r13))), 3)"
    "fetch 0xb5de \<equiv> (Unary (IS_80486 Bswap) (Storage (Reg (General ThirtyTwo rdx))), 2)"
    "fetch 0xb5e0 \<equiv> (Binary (IS_8088 Mov) (Memory ThirtyTwo (A_SizeDirective 32 (A_Plus (A_FromReg (General SixtyFour rsp)) (A_WordConstant 80)))) (Storage (Reg (General ThirtyTwo rdx))), 4)"
    "fetch 0xb5e4 \<equiv> (Binary (IS_8088 Mov) (Reg (General ThirtyTwo rdx)) (Immediate SixtyFour (ImmVal 512)), 5)"
    "fetch 0xb5e9 \<equiv> (Unary (IS_8088 Call) (Immediate SixtyFour (ImmLabel ''write'')), 5)"
    "fetch 0xb5ee \<equiv> (Binary (IS_8088 Cmp) (Reg (General SixtyFour rax)) (Immediate SixtyFour (ImmVal 512)), 6)"
    "fetch 0xb5f4 \<equiv> (Unary (IS_8088 Jne) (Immediate SixtyFour (ImmVal 46736)), 6)"
    "fetch 0xb5fa \<equiv> (Binary (IS_8088 Lea) (Reg (General SixtyFour r15)) (Storage (Memory SixtyFour (A_Plus (A_Mult 4 (A_FromReg (General SixtyFour r14))) (A_WordConstant 511)))), 8)"
    "fetch 0xb602 \<equiv> (Binary (IS_8088 Xor) (Reg (General ThirtyTwo rdx)) (Storage (Reg (General ThirtyTwo rdx))), 2)"
    "fetch 0xb604 \<equiv> (Binary (IS_8088 Mov) (Reg (General ThirtyTwo rdi)) (Storage (Reg (General ThirtyTwo r13))), 3)"
    "fetch 0xb607 \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour rsi)) (Storage (Reg (General SixtyFour r15))), 3)"
    "fetch 0xb60a \<equiv> (Binary (IS_8088 And) (Reg (General SixtyFour rsi)) (Immediate SixtyFour (ImmVal 18446744073709551104)), 7)"
    "fetch 0xb611 \<equiv> (Binary (IS_8088 Add) (Reg (General SixtyFour rsi)) (Immediate SixtyFour (ImmVal 1536)), 7)"
    "fetch 0xb618 \<equiv> (Unary (IS_8088 Call) (Immediate SixtyFour (ImmLabel ''lseek64'')), 5)"
    "fetch 0xb61d \<equiv> (Binary (IS_8088 Test) (Reg (General SixtyFour rax)) (Storage (Reg (General SixtyFour rax))), 3)"
    "fetch 0xb620 \<equiv> (Unary (IS_8088 Js) (Immediate SixtyFour (ImmVal 46736)), 2)"
    "fetch 0xb622 \<equiv> (Binary (IS_8088 Mov) (Reg (General ThirtyTwo rdx)) (Immediate SixtyFour (ImmVal 512)), 5)"
    "fetch 0xb627 \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour rsi)) (Storage (Reg (General SixtyFour rbp))), 3)"
    "fetch 0xb62a \<equiv> (Binary (IS_8088 Mov) (Reg (General ThirtyTwo rdi)) (Storage (Reg (General ThirtyTwo r13))), 3)"
    "fetch 0xb62d \<equiv> (Unary (IS_8088 Call) (Immediate SixtyFour (ImmLabel ''write'')), 5)"
    "fetch 0xb632 \<equiv> (Binary (IS_8088 Cmp) (Reg (General SixtyFour rax)) (Immediate SixtyFour (ImmVal 512)), 6)"
    "fetch 0xb638 \<equiv> (Unary (IS_8088 Jne) (Immediate SixtyFour (ImmVal 46736)), 2)"
    "fetch 0xb63a \<equiv> (Binary (IS_8088 Xor) (Reg (General ThirtyTwo rdx)) (Storage (Reg (General ThirtyTwo rdx))), 2)"
    "fetch 0xb63c \<equiv> (Binary (IS_8088 Mov) (Reg (General ThirtyTwo rsi)) (Immediate SixtyFour (ImmVal 1536)), 5)"
    "fetch 0xb641 \<equiv> (Binary (IS_8088 Mov) (Reg (General ThirtyTwo rdi)) (Storage (Reg (General ThirtyTwo r13))), 3)"
    "fetch 0xb644 \<equiv> (Unary (IS_8088 Call) (Immediate SixtyFour (ImmLabel ''lseek64'')), 5)"
    "fetch 0xb649 \<equiv> (Binary (IS_8088 Test) (Reg (General SixtyFour rax)) (Storage (Reg (General SixtyFour rax))), 3)"
    "fetch 0xb64c \<equiv> (Unary (IS_8088 Js) (Immediate SixtyFour (ImmVal 46736)), 2)"
    "fetch 0xb64e \<equiv> (Binary (IS_8088 Mov) (Reg (General ThirtyTwo rcx)) (Immediate SixtyFour (ImmVal 64)), 5)"
    "fetch 0xb653 \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour rdi)) (Storage (Reg (General SixtyFour rbp))), 3)"
    "fetch 0xb656 \<equiv> (Binary (IS_8088 Shr) (Reg (General SixtyFour r15)) (Immediate SixtyFour (ImmVal 9)), 4)"
    "fetch 0xb65a \<equiv> (Binary (IS_8088 Xor) (Reg (General ThirtyTwo rbx)) (Storage (Reg (General ThirtyTwo rbx))), 2)"
    "fetch 0xb65c \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour rax)) (Immediate SixtyFour (ImmVal 18446744073709551615)), 7)"
    "fetch 0xb663 \<equiv> (Unary (IS_8088 Call) (Immediate SixtyFour (ImmLabel ''rep_stos_ESRDI_RAX'')), 3)"
    "fetch 0xb666 \<equiv> (Unary (IS_8088 Jmp) (Immediate SixtyFour (ImmVal 46712)), 2)"
    "fetch 0xb668 \<equiv> (Unary (IS_8088 Nop) (Storage (Memory ThirtyTwo (A_SizeDirective 32 (A_Plus (A_FromReg (General SixtyFour rax)) (A_Plus (A_Mult 1 (A_FromReg (General SixtyFour rax))) (A_WordConstant 0)))))), 8)"
    "fetch 0xb670 \<equiv> (Binary (IS_8088 Add) (Reg (General ThirtyTwo rbx)) (Immediate SixtyFour (ImmVal 1)), 3)"
    "fetch 0xb673 \<equiv> (Binary (IS_8088 Cmp) (Reg (General ThirtyTwo rbx)) (Storage (Reg (General ThirtyTwo r15))), 3)"
    "fetch 0xb676 \<equiv> (Unary (IS_8088 Je) (Immediate SixtyFour (ImmVal 46816)), 2)"
    "fetch 0xb678 \<equiv> (Binary (IS_8088 Mov) (Reg (General ThirtyTwo rdx)) (Immediate SixtyFour (ImmVal 512)), 5)"
    "fetch 0xb67d \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour rsi)) (Storage (Reg (General SixtyFour rbp))), 3)"
    "fetch 0xb680 \<equiv> (Binary (IS_8088 Mov) (Reg (General ThirtyTwo rdi)) (Storage (Reg (General ThirtyTwo r13))), 3)"
    "fetch 0xb683 \<equiv> (Unary (IS_8088 Call) (Immediate SixtyFour (ImmLabel ''write'')), 5)"
    "fetch 0xb688 \<equiv> (Binary (IS_8088 Cmp) (Reg (General SixtyFour rax)) (Immediate SixtyFour (ImmVal 512)), 6)"
    "fetch 0xb68e \<equiv> (Unary (IS_8088 Je) (Immediate SixtyFour (ImmVal 46704)), 2)"
    "fetch 0xb690 \<equiv> (Binary (IS_8088 Mov) (Reg (General ThirtyTwo rax)) (Immediate SixtyFour (ImmVal 4294967291)), 5)"
    "fetch 0xb695 \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour rdi)) (Storage (Memory SixtyFour (A_SizeDirective 64 (A_Plus (A_FromReg (General SixtyFour rsp)) (A_WordConstant 1048))))), 8)"
    "fetch 0xb69d \<equiv> (Binary (IS_8088 Xor) (Reg (General SixtyFour rdi)) (Storage (Memory SixtyFour (A_SizeDirective 64 (A_Plus (A_FromReg (General SixtyFour fs)) (A_WordConstant 40))))), 9)"
    "fetch 0xb6a6 \<equiv> (Unary (IS_8088 Jne) (Immediate SixtyFour (ImmVal 47414)), 6)"
    "fetch 0xb6ac \<equiv> (Binary (IS_8088 Add) (Reg (General SixtyFour rsp)) (Immediate SixtyFour (ImmVal 1064)), 7)"
    "fetch 0xb6b3 \<equiv> (Unary (IS_8088 Pop) (Storage (Reg (General SixtyFour rbx))), 1)"
    "fetch 0xb6b4 \<equiv> (Unary (IS_8088 Pop) (Storage (Reg (General SixtyFour rbp))), 1)"
    "fetch 0xb6b5 \<equiv> (Unary (IS_8088 Pop) (Storage (Reg (General SixtyFour r12))), 2)"
    "fetch 0xb6b7 \<equiv> (Unary (IS_8088 Pop) (Storage (Reg (General SixtyFour r13))), 2)"
    "fetch 0xb6b9 \<equiv> (Unary (IS_8088 Pop) (Storage (Reg (General SixtyFour r14))), 2)"
    "fetch 0xb6bb \<equiv> (Unary (IS_8088 Pop) (Storage (Reg (General SixtyFour r15))), 2)"
    "fetch 0xb6bd \<equiv> (Nullary (IS_8088 Ret), 1)"
    "fetch 0xb6be \<equiv> (Binary (IS_8088 Xchg) (Reg (General Sixteen rax)) (Storage (Reg (General Sixteen rax))), 2)"
    "fetch 0xb6c0 \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour r12)) (Immediate SixtyFour (ImmVal 9254448157163520)), 10)"
    "fetch 0xb6ca \<equiv> (Binary (IS_8088 Mov) (Reg (General ThirtyTwo rbx)) (Immediate SixtyFour (ImmVal 4294967295)), 5)"
    "fetch 0xb6cf \<equiv> (Binary (IS_8088 Mov) (Reg (General ThirtyTwo r14)) (Immediate SixtyFour (ImmVal 65280)), 6)"
    "fetch 0xb6d5 \<equiv> (Unary (IS_8088 Jmp) (Immediate SixtyFour (ImmVal 46363)), 5)"
    "fetch 0xb6da \<equiv> (Unary (IS_8088 Nop) (Storage (Memory Sixteen (A_SizeDirective 16 (A_Plus (A_FromReg (General SixtyFour rax)) (A_Plus (A_Mult 1 (A_FromReg (General SixtyFour rax))) (A_WordConstant 0)))))), 6)"
    "fetch 0xb6e0 \<equiv> (Binary (IS_8088 Xor) (Reg (General ThirtyTwo rax)) (Storage (Reg (General ThirtyTwo rax))), 2)"
    "fetch 0xb6e2 \<equiv> (Binary (IS_8088 Mov) (Reg (General ThirtyTwo rcx)) (Immediate SixtyFour (ImmVal 128)), 5)"
    "fetch 0xb6e7 \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour rdi)) (Storage (Reg (General SixtyFour rbp))), 3)"
    "fetch 0xb6ea \<equiv> (Unary (IS_80486 Bswap) (Storage (Reg (General ThirtyTwo r14))), 3)"
    "fetch 0xb6ed \<equiv> (Unary (IS_8088 Call) (Immediate SixtyFour (ImmLabel ''rep_stos_ESRDI_RAX'')), 3)"
    "fetch 0xb6f0 \<equiv> (Binary (IS_8088 Mov) (Memory ThirtyTwo (A_SizeDirective 32 (A_Plus (A_FromReg (General SixtyFour rsp)) (A_WordConstant 44)))) (Storage (Reg (General ThirtyTwo r14))), 5)"
    "fetch 0xb6f5 \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour rax)) (Immediate SixtyFour (ImmVal 7310312382976456803)), 10)"
    "fetch 0xb6ff \<equiv> (Binary (IS_8088 Lea) (Reg (General SixtyFour rcx)) (Storage (Memory SixtyFour (A_Plus (A_FromReg (General SixtyFour rbp)) (A_WordConstant 1024)))), 7)"
    "fetch 0xb706 \<equiv> (Binary (IS_8088 Mov) (Memory SixtyFour (A_SizeDirective 64 (A_Plus (A_FromReg (General SixtyFour rbp)) (A_WordConstant 0)))) (Storage (Reg (General SixtyFour rax))), 4)"
    "fetch 0xb70a \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour rax)) (Immediate SixtyFour (ImmVal 18446744069414584320)), 10)"
    "fetch 0xb714 \<equiv> (Binary (IS_8088 Mov) (Memory ThirtyTwo (A_SizeDirective 32 (A_Plus (A_FromReg (General SixtyFour rsp)) (A_WordConstant 40)))) (Immediate SixtyFour (ImmVal 256)), 8)"
    "fetch 0xb71c \<equiv> (Binary (IS_8088 Mov) (Memory ThirtyTwo (A_SizeDirective 32 (A_Plus (A_FromReg (General SixtyFour rsp)) (A_WordConstant 48)))) (Immediate SixtyFour (ImmVal 8192)), 8)"
    "fetch 0xb724 \<equiv> (Binary (IS_8088 Mov) (Memory SixtyFour (A_SizeDirective 64 (A_Plus (A_FromReg (General SixtyFour rsp)) (A_WordConstant 24)))) (Storage (Reg (General SixtyFour rax))), 5)"
    "fetch 0xb729 \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour rax)) (Immediate SixtyFour (ImmVal 1688849860263936)), 10)"
    "fetch 0xb733 \<equiv> (Binary (IS_8088 Mov) (Memory SixtyFour (A_SizeDirective 64 (A_Plus (A_FromReg (General SixtyFour rsp)) (A_WordConstant 32)))) (Storage (Reg (General SixtyFour rax))), 5)"
    "fetch 0xb738 \<equiv> (Binary (IS_8088 Xor) (Reg (General ThirtyTwo rax)) (Storage (Reg (General ThirtyTwo rax))), 2)"
    "fetch 0xb73a \<equiv> (Unary (IS_8088 Nop) (Storage (Memory Sixteen (A_SizeDirective 16 (A_Plus (A_FromReg (General SixtyFour rax)) (A_Plus (A_Mult 1 (A_FromReg (General SixtyFour rax))) (A_WordConstant 0)))))), 6)"
    "fetch 0xb740 \<equiv> (Binary (IS_80386 Movzx) (Reg (General ThirtyTwo rdx)) (Storage (Memory Eight (A_SizeDirective 8 (A_FromReg (General SixtyFour r12))))), 5)"
    "fetch 0xb745 \<equiv> (Binary (IS_8088 Add) (Reg (General SixtyFour r12)) (Immediate SixtyFour (ImmVal 1)), 4)"
    "fetch 0xb749 \<equiv> (Binary (IS_8088 Add) (Reg (General ThirtyTwo rax)) (Storage (Reg (General ThirtyTwo rdx))), 2)"
    "fetch 0xb74b \<equiv> (Binary (IS_8088 Cmp) (Reg (General SixtyFour rcx)) (Storage (Reg (General SixtyFour r12))), 3)"
    "fetch 0xb74e \<equiv> (Unary (IS_8088 Jne) (Immediate SixtyFour (ImmVal 46912)), 2)"
    "fetch 0xb750 \<equiv> (Unary (IS_8088 Not) (Storage (Reg (General ThirtyTwo rax))), 2)"
    "fetch 0xb752 \<equiv> (Binary (IS_8088 Xor) (Reg (General ThirtyTwo rdx)) (Storage (Reg (General ThirtyTwo rdx))), 2)"
    "fetch 0xb754 \<equiv> (Binary (IS_8088 Mov) (Reg (General ThirtyTwo rsi)) (Immediate SixtyFour (ImmVal 512)), 5)"
    "fetch 0xb759 \<equiv> (Binary (IS_8088 Mov) (Reg (General ThirtyTwo rdi)) (Storage (Reg (General ThirtyTwo r13))), 3)"
    "fetch 0xb75c \<equiv> (Unary (IS_80486 Bswap) (Storage (Reg (General ThirtyTwo rax))), 2)"
    "fetch 0xb75e \<equiv> (Binary (IS_8088 Mov) (Memory ThirtyTwo (A_SizeDirective 32 (A_Plus (A_FromReg (General SixtyFour rsp)) (A_WordConstant 52)))) (Storage (Reg (General ThirtyTwo rax))), 4)"
    "fetch 0xb762 \<equiv> (Unary (IS_8088 Call) (Immediate SixtyFour (ImmLabel ''lseek64'')), 5)"
    "fetch 0xb767 \<equiv> (Binary (IS_8088 Test) (Reg (General SixtyFour rax)) (Storage (Reg (General SixtyFour rax))), 3)"
    "fetch 0xb76a \<equiv> (Unary (IS_8088 Js) (Immediate SixtyFour (ImmVal 46736)), 6)"
    "fetch 0xb770 \<equiv> (Binary (IS_8088 Mov) (Reg (General ThirtyTwo rdx)) (Immediate SixtyFour (ImmVal 1024)), 5)"
    "fetch 0xb775 \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour rsi)) (Storage (Reg (General SixtyFour rbp))), 3)"
    "fetch 0xb778 \<equiv> (Binary (IS_8088 Mov) (Reg (General ThirtyTwo rdi)) (Storage (Reg (General ThirtyTwo r13))), 3)"
    "fetch 0xb77b \<equiv> (Unary (IS_8088 Call) (Immediate SixtyFour (ImmLabel ''write'')), 5)"
    "fetch 0xb780 \<equiv> (Binary (IS_8088 Cmp) (Reg (General SixtyFour rax)) (Immediate SixtyFour (ImmVal 1024)), 6)"
    "fetch 0xb786 \<equiv> (Unary (IS_8088 Jne) (Immediate SixtyFour (ImmVal 46736)), 6)"
    "fetch 0xb78c \<equiv> (Binary (IS_8088 Mov) (Reg (General ThirtyTwo rdi)) (Storage (Reg (General ThirtyTwo r13))), 3)"
    "fetch 0xb78f \<equiv> (Unary (IS_8088 Call) (Immediate SixtyFour (ImmLabel ''close'')), 5)"
    "fetch 0xb794 \<equiv> (Binary (IS_8088 Xor) (Reg (General ThirtyTwo rax)) (Storage (Reg (General ThirtyTwo rax))), 2)"
    "fetch 0xb796 \<equiv> (Unary (IS_8088 Jmp) (Immediate SixtyFour (ImmVal 46741)), 5)"
    "fetch 0xb79b \<equiv> (Unary (IS_8088 Nop) (Storage (Memory ThirtyTwo (A_SizeDirective 32 (A_Plus (A_FromReg (General SixtyFour rax)) (A_Plus (A_Mult 1 (A_FromReg (General SixtyFour rax))) (A_WordConstant 0)))))), 5)"
    "fetch 0xb7a0 \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour rdx)) (Immediate SixtyFour (ImmVal 8680820740569200761)), 10)"
    "fetch 0xb7aa \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour rax)) (Storage (Reg (General SixtyFour rbx))), 3)"
    "fetch 0xb7ad \<equiv> (Unary (IS_8088 Imul) (Storage (Reg (General SixtyFour rdx))), 3)"
    "fetch 0xb7b0 \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour rax)) (Storage (Reg (General SixtyFour rbx))), 3)"
    "fetch 0xb7b3 \<equiv> (Binary (IS_8088 Sar) (Reg (General SixtyFour rax)) (Immediate SixtyFour (ImmVal 63)), 4)"
    "fetch 0xb7b7 \<equiv> (Binary (IS_8088 Sar) (Reg (General SixtyFour rdx)) (Immediate SixtyFour (ImmVal 3)), 4)"
    "fetch 0xb7bb \<equiv> (Binary (IS_8088 Sub) (Reg (General SixtyFour rdx)) (Storage (Reg (General SixtyFour rax))), 3)"
    "fetch 0xb7be \<equiv> (Binary (IS_8088 Lea) (Reg (General ThirtyTwo rax)) (Storage (Memory SixtyFour (A_Plus (A_FromReg (General SixtyFour rdx)) (A_WordConstant 1023)))), 6)"
    "fetch 0xb7c4 \<equiv> (Binary (IS_8088 Shr) (Reg (General ThirtyTwo rax)) (Immediate SixtyFour (ImmVal 10)), 3)"
    "fetch 0xb7c7 \<equiv> (Binary (IS_8088 Mov) (Reg (General ThirtyTwo r15)) (Storage (Reg (General ThirtyTwo rax))), 3)"
    "fetch 0xb7ca \<equiv> (Binary (IS_8088 Cmp) (Reg (General Eight rax)) (Immediate SixtyFour (ImmVal 3)), 2)"
    "fetch 0xb7cc \<equiv> (Unary (IS_8088 Jbe) (Immediate SixtyFour (ImmVal 47216)), 6)"
    "fetch 0xb7d2 \<equiv> (Binary (IS_80386 Movzx) (Reg (General ThirtyTwo rcx)) (Storage (Reg (General Eight rax))), 3)"
    "fetch 0xb7d5 \<equiv> (Binary (IS_8088 Mov) (Reg (General ThirtyTwo rdi)) (Storage (Reg (General ThirtyTwo rcx))), 2)"
    "fetch 0xb7d7 \<equiv> (Binary (IS_8088 Shl) (Reg (General ThirtyTwo rdi)) (Immediate SixtyFour (ImmVal 10)), 3)"
    "fetch 0xb7da \<equiv> (Binary (IS_8088 Cmp) (Reg (General ThirtyTwo rdi)) (Storage (Reg (General ThirtyTwo rdx))), 2)"
    "fetch 0xb7dc \<equiv> (Unary (IS_8088 Jbe) (Immediate SixtyFour (ImmVal 47078)), 2)"
    "fetch 0xb7de \<equiv> (Binary (IS_8088 Cmp) (Reg (General Eight rax)) (Immediate SixtyFour (ImmVal 16)), 2)"
    "fetch 0xb7e0 \<equiv> (Unary (IS_8088 Jbe) (Immediate SixtyFour (ImmVal 47348)), 6)"
    "fetch 0xb7e6 \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour rdx)) (Immediate SixtyFour (ImmVal 9520900167075897609)), 10)"
    "fetch 0xb7f0 \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour rax)) (Storage (Reg (General SixtyFour rbx))), 3)"
    "fetch 0xb7f3 \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour rcx)) (Storage (Reg (General SixtyFour rbx))), 3)"
    "fetch 0xb7f6 \<equiv> (Unary (IS_8088 Imul) (Storage (Reg (General SixtyFour rdx))), 3)"
    "fetch 0xb7f9 \<equiv> (Binary (IS_8088 Sar) (Reg (General SixtyFour rcx)) (Immediate SixtyFour (ImmVal 63)), 4)"
    "fetch 0xb7fd \<equiv> (Binary (IS_8088 Lea) (Reg (General SixtyFour rax)) (Storage (Memory SixtyFour (A_Plus (A_FromReg (General SixtyFour rdx)) (A_Mult 1 (A_FromReg (General SixtyFour rbx)))))), 4)"
    "fetch 0xb801 \<equiv> (Binary (IS_8088 Sar) (Reg (General SixtyFour rax)) (Immediate SixtyFour (ImmVal 4)), 4)"
    "fetch 0xb805 \<equiv> (Binary (IS_8088 Sub) (Reg (General SixtyFour rax)) (Storage (Reg (General SixtyFour rcx))), 3)"
    "fetch 0xb808 \<equiv> (Binary (IS_8088 Cmp) (Reg (General ThirtyTwo rax)) (Immediate SixtyFour (ImmVal 16383)), 5)"
    "fetch 0xb80d \<equiv> (Unary (IS_8088 Jbe) (Immediate SixtyFour (ImmVal 47285)), 6)"
    "fetch 0xb813 \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour rax)) (Storage (Reg (General SixtyFour rbx))), 3)"
    "fetch 0xb816 \<equiv> (Binary (IS_8088 Mov) (Memory Eight (A_SizeDirective 8 (A_Plus (A_FromReg (General SixtyFour rsp)) (A_WordConstant 15)))) (Immediate SixtyFour (ImmVal 63)), 5)"
    "fetch 0xb81b \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour rdx)) (Immediate SixtyFour (ImmVal 9369774767598502409)), 10)"
    "fetch 0xb825 \<equiv> (Binary (IS_8088 Mov) (Reg (General ThirtyTwo r15)) (Immediate SixtyFour (ImmVal 16)), 6)"
    "fetch 0xb82b \<equiv> (Unary (IS_8088 Imul) (Storage (Reg (General SixtyFour rdx))), 3)"
    "fetch 0xb82e \<equiv> (Binary (IS_8088 Add) (Reg (General SixtyFour rbx)) (Storage (Reg (General SixtyFour rdx))), 3)"
    "fetch 0xb831 \<equiv> (Binary (IS_8088 Sar) (Reg (General SixtyFour rbx)) (Immediate SixtyFour (ImmVal 5)), 4)"
    "fetch 0xb835 \<equiv> (Binary (IS_8088 Sub) (Reg (General SixtyFour rbx)) (Storage (Reg (General SixtyFour rcx))), 3)"
    "fetch 0xb838 \<equiv> (Binary (IS_8088 Add) (Reg (General ThirtyTwo rbx)) (Immediate SixtyFour (ImmVal 15)), 3)"
    "fetch 0xb83b \<equiv> (Binary (IS_8088 Shr) (Reg (General ThirtyTwo rbx)) (Immediate SixtyFour (ImmVal 4)), 3)"
    "fetch 0xb83e \<equiv> (Binary (IS_80386 Movzx) (Reg (General ThirtyTwo rax)) (Storage (Reg (General Sixteen rbx))), 3)"
    "fetch 0xb841 \<equiv> (Binary (IS_8088 Rol) (Reg (General Sixteen rbx)) (Immediate SixtyFour (ImmVal 8)), 4)"
    "fetch 0xb845 \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour r12)) (Storage (Reg (General SixtyFour rax))), 3)"
    "fetch 0xb848 \<equiv> (Binary (IS_8088 Shl) (Reg (General SixtyFour r12)) (Immediate SixtyFour (ImmVal 6)), 4)"
    "fetch 0xb84c \<equiv> (Binary (IS_8088 Sub) (Reg (General SixtyFour r12)) (Storage (Reg (General SixtyFour rax))), 3)"
    "fetch 0xb84f \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour r14)) (Storage (Reg (General SixtyFour r12))), 3)"
    "fetch 0xb852 \<equiv> (Binary (IS_8088 Shl) (Reg (General SixtyFour r12)) (Immediate SixtyFour (ImmVal 13)), 4)"
    "fetch 0xb856 \<equiv> (Binary (IS_8088 Shl) (Reg (General SixtyFour r14)) (Immediate SixtyFour (ImmVal 4)), 4)"
    "fetch 0xb85a \<equiv> (Unary (IS_80486 Bswap) (Storage (Reg (General SixtyFour r12))), 3)"
    "fetch 0xb85d \<equiv> (Binary (IS_8088 Add) (Reg (General SixtyFour r14)) (Immediate SixtyFour (ImmVal 4096)), 7)"
    "fetch 0xb864 \<equiv> (Binary (IS_8088 Shr) (Reg (General SixtyFour r14)) (Immediate SixtyFour (ImmVal 12)), 4)"
    "fetch 0xb868 \<equiv> (Unary (IS_8088 Jmp) (Immediate SixtyFour (ImmVal 46374)), 5)"
    "fetch 0xb86d \<equiv> (Unary (IS_8088 Nop) (Storage (Memory ThirtyTwo (A_SizeDirective 32 (A_FromReg (General SixtyFour rax))))), 3)"
    "fetch 0xb870 \<equiv> (Binary (IS_8088 Cmp) (Reg (General ThirtyTwo rdx)) (Immediate SixtyFour (ImmVal 4095)), 6)"
    "fetch 0xb876 \<equiv> (Unary (IS_8088 Ja) (Immediate SixtyFour (ImmVal 47078)), 6)"
    "fetch 0xb87c \<equiv> (Binary (IS_8088 Lea) (Reg (General ThirtyTwo rbx)) (Storage (Memory SixtyFour (A_Plus (A_FromReg (General SixtyFour rdx)) (A_WordConstant 3)))), 3)"
    "fetch 0xb87f \<equiv> (Binary (IS_8088 Mov) (Memory Eight (A_SizeDirective 8 (A_Plus (A_FromReg (General SixtyFour rsp)) (A_WordConstant 15)))) (Immediate SixtyFour (ImmVal 17)), 5)"
    "fetch 0xb884 \<equiv> (Binary (IS_8088 Mov) (Reg (General ThirtyTwo r15)) (Immediate SixtyFour (ImmVal 4)), 6)"
    "fetch 0xb88a \<equiv> (Binary (IS_8088 Shr) (Reg (General ThirtyTwo rbx)) (Immediate SixtyFour (ImmVal 2)), 3)"
    "fetch 0xb88d \<equiv> (Binary (IS_8088 Mov) (Reg (General ThirtyTwo rax)) (Storage (Reg (General ThirtyTwo rbx))), 2)"
    "fetch 0xb88f \<equiv> (Binary (IS_8088 Rol) (Reg (General Sixteen rbx)) (Immediate SixtyFour (ImmVal 8)), 4)"
    "fetch 0xb893 \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour r12)) (Storage (Reg (General SixtyFour rax))), 3)"
    "fetch 0xb896 \<equiv> (Binary (IS_8088 Shl) (Reg (General SixtyFour r12)) (Immediate SixtyFour (ImmVal 4)), 4)"
    "fetch 0xb89a \<equiv> (Binary (IS_8088 Add) (Reg (General SixtyFour r12)) (Storage (Reg (General SixtyFour rax))), 3)"
    "fetch 0xb89d \<equiv> (Binary (IS_8088 Lea) (Reg (General SixtyFour r14)) (Storage (Memory SixtyFour (A_Plus (A_Mult 4 (A_FromReg (General SixtyFour r12))) (A_WordConstant 4096)))), 8)"
    "fetch 0xb8a5 \<equiv> (Binary (IS_8088 Shl) (Reg (General SixtyFour r12)) (Immediate SixtyFour (ImmVal 11)), 4)"
    "fetch 0xb8a9 \<equiv> (Binary (IS_8088 Shr) (Reg (General SixtyFour r14)) (Immediate SixtyFour (ImmVal 12)), 4)"
    "fetch 0xb8ad \<equiv> (Unary (IS_80486 Bswap) (Storage (Reg (General SixtyFour r12))), 3)"
    "fetch 0xb8b0 \<equiv> (Unary (IS_8088 Jmp) (Immediate SixtyFour (ImmVal 46374)), 5)"
    "fetch 0xb8b5 \<equiv> (Binary (IS_8088 Lea) (Reg (General ThirtyTwo rbx)) (Storage (Memory SixtyFour (A_Plus (A_FromReg (General SixtyFour rax)) (A_WordConstant 15)))), 3)"
    "fetch 0xb8b8 \<equiv> (Binary (IS_8088 Mov) (Memory Eight (A_SizeDirective 8 (A_Plus (A_FromReg (General SixtyFour rsp)) (A_WordConstant 15)))) (Immediate SixtyFour (ImmVal 31)), 5)"
    "fetch 0xb8bd \<equiv> (Binary (IS_8088 Mov) (Reg (General ThirtyTwo r15)) (Immediate SixtyFour (ImmVal 16)), 6)"
    "fetch 0xb8c3 \<equiv> (Binary (IS_8088 Shr) (Reg (General ThirtyTwo rbx)) (Immediate SixtyFour (ImmVal 4)), 3)"
    "fetch 0xb8c6 \<equiv> (Binary (IS_8088 Mov) (Reg (General ThirtyTwo rax)) (Storage (Reg (General ThirtyTwo rbx))), 2)"
    "fetch 0xb8c8 \<equiv> (Binary (IS_8088 Rol) (Reg (General Sixteen rbx)) (Immediate SixtyFour (ImmVal 8)), 4)"
    "fetch 0xb8cc \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour r12)) (Storage (Reg (General SixtyFour rax))), 3)"
    "fetch 0xb8cf \<equiv> (Binary (IS_8088 Shl) (Reg (General SixtyFour r12)) (Immediate SixtyFour (ImmVal 5)), 4)"
    "fetch 0xb8d3 \<equiv> (Binary (IS_8088 Sub) (Reg (General SixtyFour r12)) (Storage (Reg (General SixtyFour rax))), 3)"
    "fetch 0xb8d6 \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour r14)) (Storage (Reg (General SixtyFour r12))), 3)"
    "fetch 0xb8d9 \<equiv> (Binary (IS_8088 Shl) (Reg (General SixtyFour r12)) (Immediate SixtyFour (ImmVal 13)), 4)"
    "fetch 0xb8dd \<equiv> (Binary (IS_8088 Shl) (Reg (General SixtyFour r14)) (Immediate SixtyFour (ImmVal 4)), 4)"
    "fetch 0xb8e1 \<equiv> (Unary (IS_80486 Bswap) (Storage (Reg (General SixtyFour r12))), 3)"
    "fetch 0xb8e4 \<equiv> (Binary (IS_8088 Add) (Reg (General SixtyFour r14)) (Immediate SixtyFour (ImmVal 4096)), 7)"
    "fetch 0xb8eb \<equiv> (Binary (IS_8088 Shr) (Reg (General SixtyFour r14)) (Immediate SixtyFour (ImmVal 12)), 4)"
    "fetch 0xb8ef \<equiv> (Unary (IS_8088 Jmp) (Immediate SixtyFour (ImmVal 46374)), 5)"
    "fetch 0xb8f4 \<equiv> (Binary (IS_8088 Lea) (Reg (General ThirtyTwo rax)) (Storage (Memory SixtyFour (A_Plus (A_FromReg (General SixtyFour rcx)) (A_Minus (A_Mult 1 (A_FromReg (General SixtyFour rdx))) (A_WordConstant 1))))), 4)"
    "fetch 0xb8f8 \<equiv> (Binary (IS_8088 Xor) (Reg (General ThirtyTwo rdx)) (Storage (Reg (General ThirtyTwo rdx))), 2)"
    "fetch 0xb8fa \<equiv> (Binary (IS_8088 Mov) (Memory Eight (A_SizeDirective 8 (A_Plus (A_FromReg (General SixtyFour rsp)) (A_WordConstant 15)))) (Immediate SixtyFour (ImmVal 17)), 5)"
    "fetch 0xb8ff \<equiv> (Unary (IS_8088 Div) (Storage (Reg (General ThirtyTwo rcx))), 2)"
    "fetch 0xb901 \<equiv> (Binary (IS_80386 Movzx) (Reg (General ThirtyTwo rdx)) (Storage (Reg (General Eight r15))), 4)"
    "fetch 0xb905 \<equiv> (Binary (IS_80386 Movzx) (Reg (General ThirtyTwo rcx)) (Storage (Reg (General Sixteen rax))), 3)"
    "fetch 0xb908 \<equiv> (Binary (IS_8088 Mov) (Reg (General ThirtyTwo rbx)) (Storage (Reg (General ThirtyTwo rax))), 2)"
    "fetch 0xb90a \<equiv> (Binary (IS_8088 Imul) (Reg (General SixtyFour rcx)) (Storage (Reg (General SixtyFour rdx))), 4)"
    "fetch 0xb90e \<equiv> (Binary (IS_8088 Rol) (Reg (General Sixteen rbx)) (Immediate SixtyFour (ImmVal 8)), 4)"
    "fetch 0xb912 \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour rdx)) (Storage (Reg (General SixtyFour rcx))), 3)"
    "fetch 0xb915 \<equiv> (Binary (IS_8088 Shl) (Reg (General SixtyFour rdx)) (Immediate SixtyFour (ImmVal 4)), 4)"
    "fetch 0xb919 \<equiv> (Binary (IS_8088 Add) (Reg (General SixtyFour rdx)) (Storage (Reg (General SixtyFour rcx))), 3)"
    "fetch 0xb91c \<equiv> (Binary (IS_8088 Lea) (Reg (General SixtyFour r14)) (Storage (Memory SixtyFour (A_Plus (A_FromReg (General SixtyFour rdx)) (A_WordConstant 4096)))), 7)"
    "fetch 0xb923 \<equiv> (Binary (IS_8088 Shl) (Reg (General SixtyFour rdx)) (Immediate SixtyFour (ImmVal 9)), 4)"
    "fetch 0xb927 \<equiv> (Unary (IS_80486 Bswap) (Storage (Reg (General SixtyFour rdx))), 3)"
    "fetch 0xb92a \<equiv> (Binary (IS_8088 Shr) (Reg (General SixtyFour r14)) (Immediate SixtyFour (ImmVal 12)), 4)"
    "fetch 0xb92e \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour r12)) (Storage (Reg (General SixtyFour rdx))), 3)"
    "fetch 0xb931 \<equiv> (Unary (IS_8088 Jmp) (Immediate SixtyFour (ImmVal 46374)), 5)"
    "fetch 0xb936 \<equiv> (Unary (IS_8088 Call) (Immediate SixtyFour (ImmLabel ''__stack_chk_fail'')), 5)"
    and \<alpha>_def: \<open>\<alpha> = \<lparr>text_sections = [], data_sections = [], labels_to_offsets = [], binary_offset = 0\<rparr>\<close>
    and UD2\<^sub>a\<^sub>d\<^sub>d\<^sub>r[simp]: \<open>the (label_to_address \<alpha> ''UD2'') = UD2_addr\<close>
    and stack_chk_fail\<^sub>a\<^sub>d\<^sub>d\<^sub>r[simp]: \<open>the (label_to_address \<alpha> ''__stack_chk_fail'') = stack_chk_fail_addr\<close>
    and close\<^sub>a\<^sub>d\<^sub>d\<^sub>r[simp]: \<open>the (label_to_address \<alpha> ''close'') = close_addr\<close>
    and lseek64\<^sub>a\<^sub>d\<^sub>d\<^sub>r[simp]: \<open>the (label_to_address \<alpha> ''lseek64'') = lseek64_addr\<close>
    and open64\<^sub>a\<^sub>d\<^sub>d\<^sub>r[simp]: \<open>the (label_to_address \<alpha> ''open64'') = open64_addr\<close>
    and rep_stos_ESRDI_RAX\<^sub>a\<^sub>d\<^sub>d\<^sub>r[simp]: \<open>the (label_to_address \<alpha> ''rep_stos_ESRDI_RAX'') = rep_stos_ESRDI_RAX_addr\<close>
    and time\<^sub>a\<^sub>d\<^sub>d\<^sub>r[simp]: \<open>the (label_to_address \<alpha> ''time'') = time_addr\<close>
    and write\<^sub>a\<^sub>d\<^sub>d\<^sub>r[simp]: \<open>the (label_to_address \<alpha> ''write'') = write_addr\<close>
begin

text \<open>Using definitions that don't get unfolded immediately prevents locale argument issues.\<close>
definition \<open>UD2_0x3748_retval \<equiv> UD2_0x3748_retval\<^sub>v\<close>
definition \<open>UD2_0x3751_retval \<equiv> UD2_0x3751_retval\<^sub>v\<close>
definition \<open>UD2_0x375f_retval \<equiv> UD2_0x375f_retval\<^sub>v\<close>
definition \<open>UD2_0x3769_retval \<equiv> UD2_0x3769_retval\<^sub>v\<close>
definition \<open>UD2_0x3773_retval \<equiv> UD2_0x3773_retval\<^sub>v\<close>
definition \<open>UD2_0x3796_retval \<equiv> UD2_0x3796_retval\<^sub>v\<close>
definition \<open>UD2_0x37a0_retval \<equiv> UD2_0x37a0_retval\<^sub>v\<close>
definition \<open>UD2_0x37aa_retval \<equiv> UD2_0x37aa_retval\<^sub>v\<close>
definition \<open>UD2_0x37b7_retval \<equiv> UD2_0x37b7_retval\<^sub>v\<close>
definition \<open>open64_0xb4a1_retval \<equiv> open64_0xb4a1_retval\<^sub>v\<close>
definition \<open>rep_stos_ESRDI_RAX_0xb535_retval \<equiv> rep_stos_ESRDI_RAX_0xb535_retval\<^sub>v\<close>
definition \<open>time_0xb577_retval \<equiv> time_0xb577_retval\<^sub>v\<close>
definition \<open>write_0xb5e9_retval \<equiv> write_0xb5e9_retval\<^sub>v\<close>
definition \<open>lseek64_0xb618_retval \<equiv> lseek64_0xb618_retval\<^sub>v\<close>
definition \<open>write_0xb62d_retval \<equiv> write_0xb62d_retval\<^sub>v\<close>
definition \<open>lseek64_0xb644_retval \<equiv> lseek64_0xb644_retval\<^sub>v\<close>
definition \<open>rep_stos_ESRDI_RAX_0xb663_retval \<equiv> rep_stos_ESRDI_RAX_0xb663_retval\<^sub>v\<close>
definition \<open>write_0xb683_retval \<equiv> write_0xb683_retval\<^sub>v\<close>
definition \<open>rep_stos_ESRDI_RAX_0xb6ed_retval \<equiv> rep_stos_ESRDI_RAX_0xb6ed_retval\<^sub>v\<close>
definition \<open>lseek64_0xb762_retval \<equiv> lseek64_0xb762_retval\<^sub>v\<close>
definition \<open>write_0xb77b_retval \<equiv> write_0xb77b_retval\<^sub>v\<close>
definition \<open>close_0xb78f_retval \<equiv> close_0xb78f_retval\<^sub>v\<close>
definition \<open>stack_chk_fail_0xb936_retval \<equiv> stack_chk_fail_0xb936_retval\<^sub>v\<close>

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

locale "commit_direntries_cold_11" = "qemu_img_xen" +
  fixes RAX\<^sub>0\<^sub>v RSP\<^sub>0\<^sub>v DS\<^sub>0\<^sub>v ret_address\<^sub>v :: \<open>64 word\<close>
begin

text \<open>Using definitions that don't get unfolded immediately prevents locale argument issues.\<close>
definition \<open>RAX\<^sub>0 \<equiv> RAX\<^sub>0\<^sub>v\<close>
definition \<open>RSP\<^sub>0 \<equiv> RSP\<^sub>0\<^sub>v\<close>
definition \<open>DS\<^sub>0 \<equiv> DS\<^sub>0\<^sub>v\<close>
definition \<open>ret_address \<equiv> ret_address\<^sub>v\<close>

definition P_0x3741_0 :: state_pred where
  \<open>P_0x3741_0 \<sigma> \<equiv> RIP \<sigma> = 0x3741 \<and> RAX \<sigma> = RAX\<^sub>0 \<and> RSP \<sigma> = RSP\<^sub>0 \<and> DS \<sigma> = DS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address\<close>
declare P_0x3741_0_def[Ps]

definition P_0x3741_0_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x3741_0_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((DS\<^sub>0::64 word) + 0x14), 4)
  }\<close>

definition P_0x3741_0_regions :: state_pred where
  \<open>P_0x3741_0_regions \<sigma> \<equiv> \<exists>regions. P_0x3741_0_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x3748_0 :: state_pred where
  \<open>Q_0x3748_0 \<sigma> \<equiv> RIP \<sigma> = 0x3748 \<and> RAX \<sigma> = ucast ((\<sigma> \<turnstile> *[((DS\<^sub>0::64 word) + 0x14),4]::32 word)) \<and> RSP \<sigma> = RSP\<^sub>0 \<and> DS \<sigma> = DS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((DS\<^sub>0::64 word) + 0x14),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((DS\<^sub>0::64 word) + 0x14),4]::32 word))\<close>
declare Q_0x3748_0_def[Qs]

schematic_goal commit_direntries_cold_11_0_1_0x3741_0x3741_0[blocks]:
  assumes \<open>(P_0x3741_0 && P_0x3741_0_regions) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x3741 0 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x3748_0 ?\<sigma> \<and> block_usage P_0x3741_0_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x3741_0_def P_0x3741_0_regions_def post: Q_0x3748_0_def regionset: P_0x3741_0_regions_set_def)

definition P_0x3748_1 :: state_pred where
  \<open>P_0x3748_1 \<sigma> \<equiv> RIP \<sigma> = 0x3748 \<and> RAX \<sigma> = ucast ((\<sigma> \<turnstile> *[((DS\<^sub>0::64 word) + 0x14),4]::32 word)) \<and> RSP \<sigma> = RSP\<^sub>0 \<and> DS \<sigma> = DS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((DS\<^sub>0::64 word) + 0x14),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((DS\<^sub>0::64 word) + 0x14),4]::32 word))\<close>
declare P_0x3748_1_def[Ps]

definition P_0x3748_1_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x3748_1_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((DS\<^sub>0::64 word) + 0x14), 4),
    (2, ((RSP\<^sub>0::64 word) - 0x8), 8)
  }\<close>

definition P_0x3748_1_regions :: state_pred where
  \<open>P_0x3748_1_regions \<sigma> \<equiv> \<exists>regions. P_0x3748_1_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_UD2_addr_0x3748_1 :: state_pred where
  \<open>Q_UD2_addr_0x3748_1 \<sigma> \<equiv> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x8) \<and> RIP \<sigma> = UD2_addr \<and> RAX \<sigma> = ucast ((\<sigma> \<turnstile> *[((DS\<^sub>0::64 word) + 0x14),4]::32 word)) \<and> DS \<sigma> = DS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((DS\<^sub>0::64 word) + 0x14),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((DS\<^sub>0::64 word) + 0x14),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = 0x374a\<close>
declare Q_UD2_addr_0x3748_1_def[Qs]

schematic_goal commit_direntries_cold_11_0_1_0x3748_0x3748_1[blocks]:
  assumes \<open>(P_0x3748_1 && P_0x3748_1_regions) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x3748 (Suc 0) \<sigma> \<triangleq> ?\<sigma> \<and> Q_UD2_addr_0x3748_1 ?\<sigma> \<and> block_usage P_0x3748_1_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x3748_1_def P_0x3748_1_regions_def post: Q_UD2_addr_0x3748_1_def regionset: P_0x3748_1_regions_set_def)

definition commit_direntries_cold_11_acode :: ACode where
  \<open>commit_direntries_cold_11_acode =
    Block (Suc 0) 0x3741 0;
    Block (Suc 0) 0x3748 (Suc 0);
    CALL UD2_acode
  \<close>

schematic_goal "commit_direntries_cold_11":
  assumes
    \<open>\<forall>\<sigma>. RIP \<sigma> = 0x3748 \<longrightarrow> P_0x3748_1_regions \<sigma>\<close>
    and [blocks]: \<open>{{Q_UD2_addr_0x3748_1}} \<box>UD2_acode {{Q_fail;M_0x3748}}\<close>
  shows \<open>{{?P}} commit_direntries_cold_11_acode {{?Q;?M}}\<close>
  by (vcg acode: commit_direntries_cold_11_acode_def assms: assms)

end

locale "check_directory_consistency_cold_12" = "qemu_img_xen" +
  fixes RAX\<^sub>0\<^sub>v RSP\<^sub>0\<^sub>v DS\<^sub>0\<^sub>v ret_address\<^sub>v :: \<open>64 word\<close>
begin

text \<open>Using definitions that don't get unfolded immediately prevents locale argument issues.\<close>
definition \<open>RAX\<^sub>0 \<equiv> RAX\<^sub>0\<^sub>v\<close>
definition \<open>RSP\<^sub>0 \<equiv> RSP\<^sub>0\<^sub>v\<close>
definition \<open>DS\<^sub>0 \<equiv> DS\<^sub>0\<^sub>v\<close>
definition \<open>ret_address \<equiv> ret_address\<^sub>v\<close>

definition P_0x3753_0 :: state_pred where
  \<open>P_0x3753_0 \<sigma> \<equiv> RIP \<sigma> = 0x3753 \<and> RAX \<sigma> = RAX\<^sub>0 \<and> RSP \<sigma> = RSP\<^sub>0 \<and> DS \<sigma> = DS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address\<close>
declare P_0x3753_0_def[Ps]

definition P_0x3753_0_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x3753_0_regions_set \<sigma> \<equiv> {
    (0, DS\<^sub>0, 8),
    (1, RSP\<^sub>0, 8)
  }\<close>

definition P_0x3753_0_regions :: state_pred where
  \<open>P_0x3753_0_regions \<sigma> \<equiv> \<exists>regions. P_0x3753_0_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x375f_0 :: state_pred where
  \<open>Q_0x375f_0 \<sigma> \<equiv> RIP \<sigma> = 0x375f \<and> RAX \<sigma> = RAX\<^sub>0 \<and> RSP \<sigma> = RSP\<^sub>0 \<and> DS \<sigma> = DS\<^sub>0 \<and> (\<sigma> \<turnstile> *[DS\<^sub>0,8]::64 word) = 0x0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address\<close>
declare Q_0x375f_0_def[Qs]

schematic_goal check_directory_consistency_cold_12_0_1_0x3753_0x3753_0[blocks]:
  assumes \<open>(P_0x3753_0 && P_0x3753_0_regions) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x3753 0 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x375f_0 ?\<sigma> \<and> block_usage P_0x3753_0_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x3753_0_def P_0x3753_0_regions_def post: Q_0x375f_0_def regionset: P_0x3753_0_regions_set_def)

definition P_0x375f_1 :: state_pred where
  \<open>P_0x375f_1 \<sigma> \<equiv> RIP \<sigma> = 0x375f \<and> RAX \<sigma> = RAX\<^sub>0 \<and> RSP \<sigma> = RSP\<^sub>0 \<and> DS \<sigma> = DS\<^sub>0 \<and> (\<sigma> \<turnstile> *[DS\<^sub>0,8]::64 word) = 0x0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address\<close>
declare P_0x375f_1_def[Ps]

definition P_0x375f_1_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x375f_1_regions_set \<sigma> \<equiv> {
    (0, DS\<^sub>0, 8),
    (1, RSP\<^sub>0, 8),
    (2, ((RSP\<^sub>0::64 word) - 0x8), 8)
  }\<close>

definition P_0x375f_1_regions :: state_pred where
  \<open>P_0x375f_1_regions \<sigma> \<equiv> \<exists>regions. P_0x375f_1_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_UD2_addr_0x375f_1 :: state_pred where
  \<open>Q_UD2_addr_0x375f_1 \<sigma> \<equiv> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x8) \<and> RIP \<sigma> = UD2_addr \<and> RAX \<sigma> = RAX\<^sub>0 \<and> DS \<sigma> = DS\<^sub>0 \<and> (\<sigma> \<turnstile> *[DS\<^sub>0,8]::64 word) = 0x0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = 0x3761\<close>
declare Q_UD2_addr_0x375f_1_def[Qs]

schematic_goal check_directory_consistency_cold_12_0_1_0x375f_0x375f_1[blocks]:
  assumes \<open>(P_0x375f_1 && P_0x375f_1_regions) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x375f (Suc 0) \<sigma> \<triangleq> ?\<sigma> \<and> Q_UD2_addr_0x375f_1 ?\<sigma> \<and> block_usage P_0x375f_1_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x375f_1_def P_0x375f_1_regions_def post: Q_UD2_addr_0x375f_1_def regionset: P_0x375f_1_regions_set_def)

definition check_directory_consistency_cold_12_acode :: ACode where
  \<open>check_directory_consistency_cold_12_acode =
    Block (Suc 0) 0x3753 0;
    Block (Suc 0) 0x375f (Suc 0);
    CALL UD2_acode
  \<close>

schematic_goal "check_directory_consistency_cold_12":
  assumes
    \<open>\<forall>\<sigma>. RIP \<sigma> = 0x375f \<longrightarrow> P_0x375f_1_regions \<sigma>\<close>
    and [blocks]: \<open>{{Q_UD2_addr_0x375f_1}} \<box>UD2_acode {{Q_fail;M_0x375f}}\<close>
  shows \<open>{{?P}} check_directory_consistency_cold_12_acode {{?Q;?M}}\<close>
  by (vcg acode: check_directory_consistency_cold_12_acode_def assms: assms)

end

locale "read_directory_cold_14" = "qemu_img_xen" +
  fixes RAX\<^sub>0\<^sub>v RSP\<^sub>0\<^sub>v R12\<^sub>0\<^sub>v DS\<^sub>0\<^sub>v ret_address\<^sub>v :: \<open>64 word\<close>
begin

text \<open>Using definitions that don't get unfolded immediately prevents locale argument issues.\<close>
definition \<open>RAX\<^sub>0 \<equiv> RAX\<^sub>0\<^sub>v\<close>
definition \<open>RSP\<^sub>0 \<equiv> RSP\<^sub>0\<^sub>v\<close>
definition \<open>R12\<^sub>0 \<equiv> R12\<^sub>0\<^sub>v\<close>
definition \<open>DS\<^sub>0 \<equiv> DS\<^sub>0\<^sub>v\<close>
definition \<open>ret_address \<equiv> ret_address\<^sub>v\<close>

definition P_0x377f_0 :: state_pred where
  \<open>P_0x377f_0 \<sigma> \<equiv> RIP \<sigma> = 0x377f \<and> RAX \<sigma> = RAX\<^sub>0 \<and> RSP \<sigma> = RSP\<^sub>0 \<and> R12 \<sigma> = R12\<^sub>0 \<and> DS \<sigma> = DS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address\<close>
declare P_0x377f_0_def[Ps]

definition P_0x377f_0_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x377f_0_regions_set \<sigma> \<equiv> {
    (0, DS\<^sub>0, 4),
    (1, RSP\<^sub>0, 8),
    (2, ((R12\<^sub>0::64 word) + 0x8080), 8)
  }\<close>

definition P_0x377f_0_regions :: state_pred where
  \<open>P_0x377f_0_regions \<sigma> \<equiv> \<exists>regions. P_0x377f_0_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x3796_0 :: state_pred where
  \<open>Q_0x3796_0 \<sigma> \<equiv> RIP \<sigma> = 0x3796 \<and> RAX \<sigma> = RAX\<^sub>0 \<and> RSP \<sigma> = RSP\<^sub>0 \<and> R12 \<sigma> = R12\<^sub>0 \<and> DS \<sigma> = DS\<^sub>0 \<and> (\<sigma> \<turnstile> *[DS\<^sub>0,4]::32 word) = 0x0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((R12\<^sub>0::64 word) + 0x8080),8]::64 word) = 0x0\<close>
declare Q_0x3796_0_def[Qs]

schematic_goal read_directory_cold_14_0_2_0x377f_0x378b_0[blocks]:
  assumes \<open>(P_0x377f_0 && P_0x377f_0_regions) \<sigma>\<close>
  shows \<open>exec_block 2 0x378b 0 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x3796_0 ?\<sigma> \<and> block_usage P_0x377f_0_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x377f_0_def P_0x377f_0_regions_def post: Q_0x3796_0_def regionset: P_0x377f_0_regions_set_def)

definition P_0x3796_1 :: state_pred where
  \<open>P_0x3796_1 \<sigma> \<equiv> RIP \<sigma> = 0x3796 \<and> RAX \<sigma> = RAX\<^sub>0 \<and> RSP \<sigma> = RSP\<^sub>0 \<and> R12 \<sigma> = R12\<^sub>0 \<and> DS \<sigma> = DS\<^sub>0 \<and> (\<sigma> \<turnstile> *[DS\<^sub>0,4]::32 word) = 0x0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((R12\<^sub>0::64 word) + 0x8080),8]::64 word) = 0x0\<close>
declare P_0x3796_1_def[Ps]

definition P_0x3796_1_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x3796_1_regions_set \<sigma> \<equiv> {
    (0, DS\<^sub>0, 4),
    (1, RSP\<^sub>0, 8),
    (2, ((R12\<^sub>0::64 word) + 0x8080), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x8), 8)
  }\<close>

definition P_0x3796_1_regions :: state_pred where
  \<open>P_0x3796_1_regions \<sigma> \<equiv> \<exists>regions. P_0x3796_1_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_UD2_addr_0x3796_1 :: state_pred where
  \<open>Q_UD2_addr_0x3796_1 \<sigma> \<equiv> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x8) \<and> RIP \<sigma> = UD2_addr \<and> RAX \<sigma> = RAX\<^sub>0 \<and> R12 \<sigma> = R12\<^sub>0 \<and> DS \<sigma> = DS\<^sub>0 \<and> (\<sigma> \<turnstile> *[DS\<^sub>0,4]::32 word) = 0x0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((R12\<^sub>0::64 word) + 0x8080),8]::64 word) = 0x0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = 0x3798\<close>
declare Q_UD2_addr_0x3796_1_def[Qs]

schematic_goal read_directory_cold_14_0_1_0x3796_0x3796_1[blocks]:
  assumes \<open>(P_0x3796_1 && P_0x3796_1_regions) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x3796 (Suc 0) \<sigma> \<triangleq> ?\<sigma> \<and> Q_UD2_addr_0x3796_1 ?\<sigma> \<and> block_usage P_0x3796_1_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x3796_1_def P_0x3796_1_regions_def post: Q_UD2_addr_0x3796_1_def regionset: P_0x3796_1_regions_set_def)

definition read_directory_cold_14_acode :: ACode where
  \<open>read_directory_cold_14_acode =
    Block 2 0x378b 0;
    Block (Suc 0) 0x3796 (Suc 0);
    CALL UD2_acode
  \<close>

schematic_goal "read_directory_cold_14":
  assumes
    \<open>\<forall>\<sigma>. RIP \<sigma> = 0x3796 \<longrightarrow> P_0x3796_1_regions \<sigma>\<close>
    and [blocks]: \<open>{{Q_UD2_addr_0x3796_1}} \<box>UD2_acode {{Q_fail;M_0x3796}}\<close>
  shows \<open>{{?P}} read_directory_cold_14_acode {{?Q;?M}}\<close>
  by (vcg acode: read_directory_cold_14_acode_def assms: assms)

end

locale "vvfat_open_cold_15" = "qemu_img_xen" +
  fixes RAX\<^sub>0\<^sub>v RSP\<^sub>0\<^sub>v DS\<^sub>0\<^sub>v ret_address\<^sub>v :: \<open>64 word\<close>
begin

text \<open>Using definitions that don't get unfolded immediately prevents locale argument issues.\<close>
definition \<open>RAX\<^sub>0 \<equiv> RAX\<^sub>0\<^sub>v\<close>
definition \<open>RSP\<^sub>0 \<equiv> RSP\<^sub>0\<^sub>v\<close>
definition \<open>DS\<^sub>0 \<equiv> DS\<^sub>0\<^sub>v\<close>
definition \<open>ret_address \<equiv> ret_address\<^sub>v\<close>

definition P_0x37a2_0 :: state_pred where
  \<open>P_0x37a2_0 \<sigma> \<equiv> RIP \<sigma> = 0x37a2 \<and> RAX \<sigma> = RAX\<^sub>0 \<and> RSP \<sigma> = RSP\<^sub>0 \<and> DS \<sigma> = DS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address\<close>
declare P_0x37a2_0_def[Ps]

definition P_0x37a2_0_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x37a2_0_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((DS\<^sub>0::64 word) + 0xb), Suc 0)
  }\<close>

definition P_0x37a2_0_regions :: state_pred where
  \<open>P_0x37a2_0_regions \<sigma> \<equiv> \<exists>regions. P_0x37a2_0_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x37aa_0 :: state_pred where
  \<open>Q_0x37aa_0 \<sigma> \<equiv> RIP \<sigma> = 0x37aa \<and> RAX \<sigma> = RAX\<^sub>0 \<and> RSP \<sigma> = RSP\<^sub>0 \<and> DS \<sigma> = DS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((DS\<^sub>0::64 word) + 0xb),1]::8 word) = 0x0\<close>
declare Q_0x37aa_0_def[Qs]

schematic_goal vvfat_open_cold_15_0_1_0x37a2_0x37a2_0[blocks]:
  assumes \<open>(P_0x37a2_0 && P_0x37a2_0_regions) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x37a2 0 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x37aa_0 ?\<sigma> \<and> block_usage P_0x37a2_0_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x37a2_0_def P_0x37a2_0_regions_def post: Q_0x37aa_0_def regionset: P_0x37a2_0_regions_set_def)

definition P_0x37aa_1 :: state_pred where
  \<open>P_0x37aa_1 \<sigma> \<equiv> RIP \<sigma> = 0x37aa \<and> RAX \<sigma> = RAX\<^sub>0 \<and> RSP \<sigma> = RSP\<^sub>0 \<and> DS \<sigma> = DS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((DS\<^sub>0::64 word) + 0xb),1]::8 word) = 0x0\<close>
declare P_0x37aa_1_def[Ps]

definition P_0x37aa_1_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x37aa_1_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((DS\<^sub>0::64 word) + 0xb), Suc 0),
    (2, ((RSP\<^sub>0::64 word) - 0x8), 8)
  }\<close>

definition P_0x37aa_1_regions :: state_pred where
  \<open>P_0x37aa_1_regions \<sigma> \<equiv> \<exists>regions. P_0x37aa_1_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_UD2_addr_0x37aa_1 :: state_pred where
  \<open>Q_UD2_addr_0x37aa_1 \<sigma> \<equiv> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x8) \<and> RIP \<sigma> = UD2_addr \<and> RAX \<sigma> = RAX\<^sub>0 \<and> DS \<sigma> = DS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((DS\<^sub>0::64 word) + 0xb),1]::8 word) = 0x0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = 0x37ac\<close>
declare Q_UD2_addr_0x37aa_1_def[Qs]

schematic_goal vvfat_open_cold_15_0_1_0x37aa_0x37aa_1[blocks]:
  assumes \<open>(P_0x37aa_1 && P_0x37aa_1_regions) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x37aa (Suc 0) \<sigma> \<triangleq> ?\<sigma> \<and> Q_UD2_addr_0x37aa_1 ?\<sigma> \<and> block_usage P_0x37aa_1_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x37aa_1_def P_0x37aa_1_regions_def post: Q_UD2_addr_0x37aa_1_def regionset: P_0x37aa_1_regions_set_def)

definition vvfat_open_cold_15_acode :: ACode where
  \<open>vvfat_open_cold_15_acode =
    Block (Suc 0) 0x37a2 0;
    Block (Suc 0) 0x37aa (Suc 0);
    CALL UD2_acode
  \<close>

schematic_goal "vvfat_open_cold_15":
  assumes
    \<open>\<forall>\<sigma>. RIP \<sigma> = 0x37aa \<longrightarrow> P_0x37aa_1_regions \<sigma>\<close>
    and [blocks]: \<open>{{Q_UD2_addr_0x37aa_1}} \<box>UD2_acode {{Q_fail;M_0x37aa}}\<close>
  shows \<open>{{?P}} vvfat_open_cold_15_acode {{?Q;?M}}\<close>
  by (vcg acode: vvfat_open_cold_15_acode_def assms: assms)

end

locale "vpc_create" = "qemu_img_xen" +
  fixes RAX\<^sub>0\<^sub>v RBX\<^sub>0\<^sub>v RCX\<^sub>0\<^sub>v RDX\<^sub>0\<^sub>v RDI\<^sub>0\<^sub>v RSI\<^sub>0\<^sub>v RSP\<^sub>0\<^sub>v RBP\<^sub>0\<^sub>v R15\<^sub>0\<^sub>v R14\<^sub>0\<^sub>v R13\<^sub>0\<^sub>v R12\<^sub>0\<^sub>v FS\<^sub>0\<^sub>v ret_address\<^sub>v :: \<open>64 word\<close>
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
definition \<open>FS\<^sub>0 \<equiv> FS\<^sub>0\<^sub>v\<close>
definition \<open>ret_address \<equiv> ret_address\<^sub>v\<close>

definition P_0xb460_0 :: state_pred where
  \<open>P_0xb460_0 \<sigma> \<equiv> RIP \<sigma> = 0xb460 \<and> RAX \<sigma> = RAX\<^sub>0 \<and> RBX \<sigma> = RBX\<^sub>0 \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = RDX\<^sub>0 \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = RSP\<^sub>0 \<and> RBP \<sigma> = RBP\<^sub>0 \<and> R15 \<sigma> = R15\<^sub>0 \<and> R14 \<sigma> = R14\<^sub>0 \<and> R13 \<sigma> = R13\<^sub>0 \<and> R12 \<sigma> = R12\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address\<close>
declare P_0xb460_0_def[Ps]

definition P_0xb460_0_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0xb460_0_regions_set \<sigma> \<equiv> {
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

definition P_0xb460_0_regions :: state_pred where
  \<open>P_0xb460_0_regions \<sigma> \<equiv> \<exists>regions. P_0xb460_0_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0xb48c_0 :: state_pred where
  \<open>Q_0xb48c_0 \<sigma> \<equiv> RIP \<sigma> = 0xb48c \<and> RAX \<sigma> = 0xffffffa1 \<and> RBX \<sigma> = RBX\<^sub>0 \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = RDX\<^sub>0 \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x458) \<and> RBP \<sigma> = RBP\<^sub>0 \<and> R15 \<sigma> = R15\<^sub>0 \<and> R14 \<sigma> = R14\<^sub>0 \<and> R13 \<sigma> = R13\<^sub>0 \<and> R12 \<sigma> = R12\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word)\<close>
declare Q_0xb48c_0_def[Qs]

schematic_goal vpc_create_0_12_0xb460_0xb489_0[blocks]:
  assumes \<open>(P_0xb460_0 && P_0xb460_0_regions) \<sigma>\<close>
  shows \<open>exec_block 12 0xb489 0 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0xb48c_0 ?\<sigma> \<and> block_usage P_0xb460_0_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0xb460_0_def P_0xb460_0_regions_def post: Q_0xb48c_0_def regionset: P_0xb460_0_regions_set_def)

definition P_0xb48c_true_1 :: state_pred where
  \<open>P_0xb48c_true_1 \<sigma> \<equiv> RIP \<sigma> = 0xb48c \<and> RAX \<sigma> = 0xffffffa1 \<and> RBX \<sigma> = RBX\<^sub>0 \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = RDX\<^sub>0 \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x458) \<and> RBP \<sigma> = RBP\<^sub>0 \<and> R15 \<sigma> = R15\<^sub>0 \<and> R14 \<sigma> = R14\<^sub>0 \<and> R13 \<sigma> = R13\<^sub>0 \<and> R12 \<sigma> = R12\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word)\<close>
declare P_0xb48c_true_1_def[Ps]

definition P_0xb48c_true_1_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0xb48c_true_1_regions_set \<sigma> \<equiv> {
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

definition P_0xb48c_true_1_regions :: state_pred where
  \<open>P_0xb48c_true_1_regions \<sigma> \<equiv> \<exists>regions. P_0xb48c_true_1_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0xb695_1 :: state_pred where
  \<open>Q_0xb695_1 \<sigma> \<equiv> RIP \<sigma> = 0xb695 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x458) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word)\<close>
declare Q_0xb695_1_def[Qs]

schematic_goal vpc_create_0_1_0xb48c_0xb48c_1[blocks]:
  assumes \<open>(P_0xb48c_true_1 && P_0xb48c_true_1_regions && !ZF) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0xb48c (Suc 0) \<sigma> \<triangleq> ?\<sigma> \<and> Q_0xb695_1 ?\<sigma> \<and> block_usage P_0xb48c_true_1_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0xb48c_true_1_def P_0xb48c_true_1_regions_def post: Q_0xb695_1_def regionset: P_0xb48c_true_1_regions_set_def)

definition P_0xb48c_false_2 :: state_pred where
  \<open>P_0xb48c_false_2 \<sigma> \<equiv> RIP \<sigma> = 0xb48c \<and> RAX \<sigma> = 0xffffffa1 \<and> RBX \<sigma> = RBX\<^sub>0 \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = RDX\<^sub>0 \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x458) \<and> RBP \<sigma> = RBP\<^sub>0 \<and> R15 \<sigma> = R15\<^sub>0 \<and> R14 \<sigma> = R14\<^sub>0 \<and> R13 \<sigma> = R13\<^sub>0 \<and> R12 \<sigma> = R12\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word)\<close>
declare P_0xb48c_false_2_def[Ps]

definition P_0xb48c_false_2_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0xb48c_false_2_regions_set \<sigma> \<equiv> {
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

definition P_0xb48c_false_2_regions :: state_pred where
  \<open>P_0xb48c_false_2_regions \<sigma> \<equiv> \<exists>regions. P_0xb48c_false_2_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0xb4a1_2 :: state_pred where
  \<open>Q_0xb4a1_2 \<sigma> \<equiv> RIP \<sigma> = 0xb4a1 \<and> RAX \<sigma> = 0x0 \<and> RBX \<sigma> = RSI\<^sub>0 \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = 0x1a4 \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = 0x241 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x458) \<and> RBP \<sigma> = RBP\<^sub>0 \<and> R15 \<sigma> = R15\<^sub>0 \<and> R14 \<sigma> = R14\<^sub>0 \<and> R13 \<sigma> = R13\<^sub>0 \<and> R12 \<sigma> = R12\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word)\<close>
declare Q_0xb4a1_2_def[Qs]

schematic_goal vpc_create_0_5_0xb48c_0xb49f_2[blocks]:
  assumes \<open>(P_0xb48c_false_2 && P_0xb48c_false_2_regions && ! !ZF) \<sigma>\<close>
  shows \<open>exec_block 5 0xb49f 2 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0xb4a1_2 ?\<sigma> \<and> block_usage P_0xb48c_false_2_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0xb48c_false_2_def P_0xb48c_false_2_regions_def post: Q_0xb4a1_2_def regionset: P_0xb48c_false_2_regions_set_def)

definition P_0xb4a1_3 :: state_pred where
  \<open>P_0xb4a1_3 \<sigma> \<equiv> RIP \<sigma> = 0xb4a1 \<and> RAX \<sigma> = 0x0 \<and> RBX \<sigma> = RSI\<^sub>0 \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = 0x1a4 \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = 0x241 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x458) \<and> RBP \<sigma> = RBP\<^sub>0 \<and> R15 \<sigma> = R15\<^sub>0 \<and> R14 \<sigma> = R14\<^sub>0 \<and> R13 \<sigma> = R13\<^sub>0 \<and> R12 \<sigma> = R12\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word)\<close>
declare P_0xb4a1_3_def[Ps]

definition P_0xb4a1_3_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0xb4a1_3_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((FS\<^sub>0::64 word) + 0x28), 8),
    (2, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x40), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x460), 8)
  }\<close>

definition P_0xb4a1_3_regions :: state_pred where
  \<open>P_0xb4a1_3_regions \<sigma> \<equiv> \<exists>regions. P_0xb4a1_3_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_open64_addr_0xb4a1_3 :: state_pred where
  \<open>Q_open64_addr_0xb4a1_3 \<sigma> \<equiv> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x460) \<and> RIP \<sigma> = open64_addr \<and> RAX \<sigma> = 0x0 \<and> RBX \<sigma> = RSI\<^sub>0 \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = 0x1a4 \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = 0x241 \<and> RBP \<sigma> = RBP\<^sub>0 \<and> R15 \<sigma> = R15\<^sub>0 \<and> R14 \<sigma> = R14\<^sub>0 \<and> R13 \<sigma> = R13\<^sub>0 \<and> R12 \<sigma> = R12\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x460),8]::64 word) = 0xb4a6\<close>
declare Q_open64_addr_0xb4a1_3_def[Qs]

schematic_goal vpc_create_0_1_0xb4a1_0xb4a1_3[blocks]:
  assumes \<open>(P_0xb4a1_3 && P_0xb4a1_3_regions) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0xb4a1 3 \<sigma> \<triangleq> ?\<sigma> \<and> Q_open64_addr_0xb4a1_3 ?\<sigma> \<and> block_usage P_0xb4a1_3_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0xb4a1_3_def P_0xb4a1_3_regions_def post: Q_open64_addr_0xb4a1_3_def regionset: P_0xb4a1_3_regions_set_def)

definition P_0xb4a6_4 :: state_pred where
  \<open>P_0xb4a6_4 \<sigma> \<equiv> RIP \<sigma> = 0xb4a6 \<and> RAX \<sigma> = open64_0xb4a1_retval \<and> RBX \<sigma> = RSI\<^sub>0 \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = 0x1a4 \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = 0x241 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x458) \<and> RBP \<sigma> = RBP\<^sub>0 \<and> R15 \<sigma> = R15\<^sub>0 \<and> R14 \<sigma> = R14\<^sub>0 \<and> R13 \<sigma> = R13\<^sub>0 \<and> R12 \<sigma> = R12\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x460),8]::64 word) = 0xb4a6\<close>
declare P_0xb4a6_4_def[Ps]

definition P_0xb4a6_4_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0xb4a6_4_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((FS\<^sub>0::64 word) + 0x28), 8),
    (2, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x40), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x460), 8)
  }\<close>

definition P_0xb4a6_4_regions :: state_pred where
  \<open>P_0xb4a6_4_regions \<sigma> \<equiv> \<exists>regions. P_0xb4a6_4_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0xb4ab_4 :: state_pred where
  \<open>Q_0xb4ab_4 \<sigma> \<equiv> RIP \<sigma> = 0xb4ab \<and> RAX \<sigma> = open64_0xb4a1_retval \<and> RBX \<sigma> = RSI\<^sub>0 \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = 0x1a4 \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = 0x241 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x458) \<and> RBP \<sigma> = RBP\<^sub>0 \<and> R15 \<sigma> = R15\<^sub>0 \<and> R14 \<sigma> = R14\<^sub>0 \<and> R13 \<sigma> = ucast ((\<langle>31,0\<rangle>open64_0xb4a1_retval::32 word)) \<and> R12 \<sigma> = R12\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x460),8]::64 word) = 0xb4a6\<close>
declare Q_0xb4ab_4_def[Qs]

schematic_goal vpc_create_0_2_0xb4a6_0xb4a9_4[blocks]:
  assumes \<open>(P_0xb4a6_4 && P_0xb4a6_4_regions) \<sigma>\<close>
  shows \<open>exec_block 2 0xb4a9 4 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0xb4ab_4 ?\<sigma> \<and> block_usage P_0xb4a6_4_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0xb4a6_4_def P_0xb4a6_4_regions_def post: Q_0xb4ab_4_def regionset: P_0xb4a6_4_regions_set_def)

definition P_0xb4ab_true_5 :: state_pred where
  \<open>P_0xb4ab_true_5 \<sigma> \<equiv> RIP \<sigma> = 0xb4ab \<and> RAX \<sigma> = open64_0xb4a1_retval \<and> RBX \<sigma> = RSI\<^sub>0 \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = 0x1a4 \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = 0x241 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x458) \<and> RBP \<sigma> = RBP\<^sub>0 \<and> R15 \<sigma> = R15\<^sub>0 \<and> R14 \<sigma> = R14\<^sub>0 \<and> R13 \<sigma> = ucast ((\<langle>31,0\<rangle>open64_0xb4a1_retval::32 word)) \<and> R12 \<sigma> = R12\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x460),8]::64 word) = 0xb4a6\<close>
declare P_0xb4ab_true_5_def[Ps]

definition P_0xb4ab_true_5_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0xb4ab_true_5_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((FS\<^sub>0::64 word) + 0x28), 8),
    (2, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x40), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x460), 8)
  }\<close>

definition P_0xb4ab_true_5_regions :: state_pred where
  \<open>P_0xb4ab_true_5_regions \<sigma> \<equiv> \<exists>regions. P_0xb4ab_true_5_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0xb695_5 :: state_pred where
  \<open>Q_0xb695_5 \<sigma> \<equiv> RIP \<sigma> = 0xb695 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x458) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word)\<close>
declare Q_0xb695_5_def[Qs]

schematic_goal vpc_create_0_2_0xb4ab_0xb690_5[blocks]:
  assumes \<open>(P_0xb4ab_true_5 && P_0xb4ab_true_5_regions && SF) \<sigma>\<close>
  shows \<open>exec_block 2 0xb690 5 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0xb695_5 ?\<sigma> \<and> block_usage P_0xb4ab_true_5_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0xb4ab_true_5_def P_0xb4ab_true_5_regions_def post: Q_0xb695_5_def regionset: P_0xb4ab_true_5_regions_set_def)

definition P_0xb4ab_false_6 :: state_pred where
  \<open>P_0xb4ab_false_6 \<sigma> \<equiv> RIP \<sigma> = 0xb4ab \<and> RAX \<sigma> = open64_0xb4a1_retval \<and> RBX \<sigma> = RSI\<^sub>0 \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = 0x1a4 \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = 0x241 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x458) \<and> RBP \<sigma> = RBP\<^sub>0 \<and> R15 \<sigma> = R15\<^sub>0 \<and> R14 \<sigma> = R14\<^sub>0 \<and> R13 \<sigma> = ucast ((\<langle>31,0\<rangle>open64_0xb4a1_retval::32 word)) \<and> R12 \<sigma> = R12\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x460),8]::64 word) = 0xb4a6\<close>
declare P_0xb4ab_false_6_def[Ps]

definition P_0xb4ab_false_6_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0xb4ab_false_6_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((FS\<^sub>0::64 word) + 0x28), 8),
    (2, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x40), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x460), 8)
  }\<close>

definition P_0xb4ab_false_6_regions :: state_pred where
  \<open>P_0xb4ab_false_6_regions \<sigma> \<equiv> \<exists>regions. P_0xb4ab_false_6_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0xb4b8_6 :: state_pred where
  \<open>Q_0xb4b8_6 \<sigma> \<equiv> RIP \<sigma> = 0xb4b8 \<and> RAX \<sigma> = open64_0xb4a1_retval \<and> RBX \<sigma> = RSI\<^sub>0 \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = 0x1a4 \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = 0x241 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x458) \<and> RBP \<sigma> = RBP\<^sub>0 \<and> R15 \<sigma> = R15\<^sub>0 \<and> R14 \<sigma> = R14\<^sub>0 \<and> R13 \<sigma> = ucast ((\<langle>31,0\<rangle>open64_0xb4a1_retval::32 word)) \<and> R12 \<sigma> = R12\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x460),8]::64 word) = 0xb4a6\<close>
declare Q_0xb4b8_6_def[Qs]

schematic_goal vpc_create_0_2_0xb4ab_0xb4b1_6[blocks]:
  assumes \<open>(P_0xb4ab_false_6 && P_0xb4ab_false_6_regions && ! SF) \<sigma>\<close>
  shows \<open>exec_block 2 0xb4b1 6 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0xb4b8_6 ?\<sigma> \<and> block_usage P_0xb4ab_false_6_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0xb4ab_false_6_def P_0xb4ab_false_6_regions_def post: Q_0xb4b8_6_def regionset: P_0xb4ab_false_6_regions_set_def)

definition P_0xb4b8_true_7 :: state_pred where
  \<open>P_0xb4b8_true_7 \<sigma> \<equiv> RIP \<sigma> = 0xb4b8 \<and> RAX \<sigma> = open64_0xb4a1_retval \<and> RBX \<sigma> = RSI\<^sub>0 \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = 0x1a4 \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = 0x241 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x458) \<and> RBP \<sigma> = RBP\<^sub>0 \<and> R15 \<sigma> = R15\<^sub>0 \<and> R14 \<sigma> = R14\<^sub>0 \<and> R13 \<sigma> = ucast ((\<langle>31,0\<rangle>open64_0xb4a1_retval::32 word)) \<and> R12 \<sigma> = R12\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x460),8]::64 word) = 0xb4a6\<close>
declare P_0xb4b8_true_7_def[Ps]

definition P_0xb4b8_true_7_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0xb4b8_true_7_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((FS\<^sub>0::64 word) + 0x28), 8),
    (2, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x40), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x460), 8)
  }\<close>

definition P_0xb4b8_true_7_regions :: state_pred where
  \<open>P_0xb4b8_true_7_regions \<sigma> \<equiv> \<exists>regions. P_0xb4b8_true_7_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0xb51b_7 :: state_pred where
  \<open>Q_0xb51b_7 \<sigma> \<equiv> RIP \<sigma> = 0xb51b \<and> RAX \<sigma> = open64_0xb4a1_retval \<and> RBX \<sigma> = 0xffffffff \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = 0x1a4 \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = 0x241 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x458) \<and> RBP \<sigma> = RBP\<^sub>0 \<and> R15 \<sigma> = R15\<^sub>0 \<and> R14 \<sigma> = 0xff00 \<and> R13 \<sigma> = ucast ((\<langle>31,0\<rangle>open64_0xb4a1_retval::32 word)) \<and> R12 \<sigma> = 0x20e0df1f000000 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x460),8]::64 word) = 0xb4a6\<close>
declare Q_0xb51b_7_def[Qs]

schematic_goal vpc_create_0_5_0xb4b8_0xb6d5_7[blocks]:
  assumes \<open>(P_0xb4b8_true_7 && P_0xb4b8_true_7_regions && jg) \<sigma>\<close>
  shows \<open>exec_block 5 0xb6d5 7 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0xb51b_7 ?\<sigma> \<and> block_usage P_0xb4b8_true_7_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0xb4b8_true_7_def P_0xb4b8_true_7_regions_def post: Q_0xb51b_7_def regionset: P_0xb4b8_true_7_regions_set_def)

definition P_0xb51b_8 :: state_pred where
  \<open>P_0xb51b_8 \<sigma> \<equiv> RIP \<sigma> = 0xb51b \<and> RAX \<sigma> = open64_0xb4a1_retval \<and> RBX \<sigma> = 0xffffffff \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = 0x1a4 \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = 0x241 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x458) \<and> RBP \<sigma> = RBP\<^sub>0 \<and> R15 \<sigma> = R15\<^sub>0 \<and> R14 \<sigma> = 0xff00 \<and> R13 \<sigma> = ucast ((\<langle>31,0\<rangle>open64_0xb4a1_retval::32 word)) \<and> R12 \<sigma> = 0x20e0df1f000000 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x460),8]::64 word) = 0xb4a6\<close>
declare P_0xb51b_8_def[Ps]

definition P_0xb51b_8_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0xb51b_8_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((FS\<^sub>0::64 word) + 0x28), 8),
    (2, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x40), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x449), Suc 0),
    (10, ((RSP\<^sub>0::64 word) - 0x460), 8)
  }\<close>

definition P_0xb51b_8_regions :: state_pred where
  \<open>P_0xb51b_8_regions \<sigma> \<equiv> \<exists>regions. P_0xb51b_8_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0xb526_8 :: state_pred where
  \<open>Q_0xb526_8 \<sigma> \<equiv> RIP \<sigma> = 0xb526 \<and> RSI \<sigma> = 0x241 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x458) \<and> RBP \<sigma> = RBP\<^sub>0 \<and> R13 \<sigma> = ucast ((\<langle>31,0\<rangle>open64_0xb4a1_retval::32 word)) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x460),8]::64 word) = 0xb4a6\<close>
declare Q_0xb526_8_def[Qs]

schematic_goal vpc_create_0_2_0xb51b_0xb520_8[blocks]:
  assumes \<open>(P_0xb51b_8 && P_0xb51b_8_regions) \<sigma>\<close>
  shows \<open>exec_block 2 0xb520 8 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0xb526_8 ?\<sigma> \<and> block_usage P_0xb51b_8_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0xb51b_8_def P_0xb51b_8_regions_def post: Q_0xb526_8_def regionset: P_0xb51b_8_regions_set_def)

definition P_0xb4b8_false_9 :: state_pred where
  \<open>P_0xb4b8_false_9 \<sigma> \<equiv> RIP \<sigma> = 0xb4b8 \<and> RAX \<sigma> = open64_0xb4a1_retval \<and> RBX \<sigma> = RSI\<^sub>0 \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = 0x1a4 \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = 0x241 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x458) \<and> RBP \<sigma> = RBP\<^sub>0 \<and> R15 \<sigma> = R15\<^sub>0 \<and> R14 \<sigma> = R14\<^sub>0 \<and> R13 \<sigma> = ucast ((\<langle>31,0\<rangle>open64_0xb4a1_retval::32 word)) \<and> R12 \<sigma> = R12\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x460),8]::64 word) = 0xb4a6\<close>
declare P_0xb4b8_false_9_def[Ps]

definition P_0xb4b8_false_9_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0xb4b8_false_9_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((FS\<^sub>0::64 word) + 0x28), 8),
    (2, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x40), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x460), 8)
  }\<close>

definition P_0xb4b8_false_9_regions :: state_pred where
  \<open>P_0xb4b8_false_9_regions \<sigma> \<equiv> \<exists>regions. P_0xb4b8_false_9_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0xb4c5_9 :: state_pred where
  \<open>Q_0xb4c5_9 \<sigma> \<equiv> RIP \<sigma> = 0xb4c5 \<and> RAX \<sigma> = open64_0xb4a1_retval \<and> RBX \<sigma> = RSI\<^sub>0 \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = 0x1a4 \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = 0x241 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x458) \<and> RBP \<sigma> = RBP\<^sub>0 \<and> R15 \<sigma> = R15\<^sub>0 \<and> R14 \<sigma> = R14\<^sub>0 \<and> R13 \<sigma> = ucast ((\<langle>31,0\<rangle>open64_0xb4a1_retval::32 word)) \<and> R12 \<sigma> = R12\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x460),8]::64 word) = 0xb4a6\<close>
declare Q_0xb4c5_9_def[Qs]

schematic_goal vpc_create_0_2_0xb4b8_0xb4be_9[blocks]:
  assumes \<open>(P_0xb4b8_false_9 && P_0xb4b8_false_9_regions && ! jg) \<sigma>\<close>
  shows \<open>exec_block 2 0xb4be 9 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0xb4c5_9 ?\<sigma> \<and> block_usage P_0xb4b8_false_9_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0xb4b8_false_9_def P_0xb4b8_false_9_regions_def post: Q_0xb4c5_9_def regionset: P_0xb4b8_false_9_regions_set_def)

definition P_0xb4c5_true_10 :: state_pred where
  \<open>P_0xb4c5_true_10 \<sigma> \<equiv> RIP \<sigma> = 0xb4c5 \<and> RAX \<sigma> = open64_0xb4a1_retval \<and> RBX \<sigma> = RSI\<^sub>0 \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = 0x1a4 \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = 0x241 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x458) \<and> RBP \<sigma> = RBP\<^sub>0 \<and> R15 \<sigma> = R15\<^sub>0 \<and> R14 \<sigma> = R14\<^sub>0 \<and> R13 \<sigma> = ucast ((\<langle>31,0\<rangle>open64_0xb4a1_retval::32 word)) \<and> R12 \<sigma> = R12\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x460),8]::64 word) = 0xb4a6\<close>
declare P_0xb4c5_true_10_def[Ps]

definition P_0xb4c5_true_10_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0xb4c5_true_10_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((FS\<^sub>0::64 word) + 0x28), 8),
    (2, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x40), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x460), 8)
  }\<close>

definition P_0xb4c5_true_10_regions :: state_pred where
  \<open>P_0xb4c5_true_10_regions \<sigma> \<equiv> \<exists>regions. P_0xb4c5_true_10_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0xb7cc_10 :: state_pred where
  \<open>Q_0xb7cc_10 \<sigma> \<equiv> RIP \<sigma> = 0xb7cc \<and> RAX \<sigma> = ucast (((ucast (((\<langle>31,0\<rangle>((((((ucast (((hi_imul(ucast ((RSI\<^sub>0::64 word))::64 word) (ucast ((0x7878787878787879::64 word))::64 word))::64 word))::64 word) >>> 3)::64 word) - ((ucast ((RSI\<^sub>0::64 word))::64 word) >>> 63))::64 word) + 0x3ff)::32 word)::32 word))::32 word) >> 10)) \<and> RBX \<sigma> = RSI\<^sub>0 \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = ((((ucast (((hi_imul(ucast ((RSI\<^sub>0::64 word))::64 word) (ucast ((0x7878787878787879::64 word))::64 word))::64 word))::64 word) >>> 3)::64 word) - ((ucast ((RSI\<^sub>0::64 word))::64 word) >>> 63)) \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = 0x241 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x458) \<and> RBP \<sigma> = RBP\<^sub>0 \<and> R15 \<sigma> = ucast (((ucast (((\<langle>31,0\<rangle>((((((ucast (((hi_imul(ucast ((RSI\<^sub>0::64 word))::64 word) (ucast ((0x7878787878787879::64 word))::64 word))::64 word))::64 word) >>> 3)::64 word) - ((ucast ((RSI\<^sub>0::64 word))::64 word) >>> 63))::64 word) + 0x3ff)::32 word)::32 word))::32 word) >> 10)) \<and> R14 \<sigma> = R14\<^sub>0 \<and> R13 \<sigma> = ucast ((\<langle>31,0\<rangle>open64_0xb4a1_retval::32 word)) \<and> R12 \<sigma> = R12\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x460),8]::64 word) = 0xb4a6\<close>
declare Q_0xb7cc_10_def[Qs]

schematic_goal vpc_create_0_12_0xb4c5_0xb7ca_10[blocks]:
  assumes \<open>(P_0xb4c5_true_10 && P_0xb4c5_true_10_regions && jle) \<sigma>\<close>
  shows \<open>exec_block 12 0xb7ca 10 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0xb7cc_10 ?\<sigma> \<and> block_usage P_0xb4c5_true_10_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0xb4c5_true_10_def P_0xb4c5_true_10_regions_def post: Q_0xb7cc_10_def regionset: P_0xb4c5_true_10_regions_set_def)

definition P_0xb7cc_true_11 :: state_pred where
  \<open>P_0xb7cc_true_11 \<sigma> \<equiv> RIP \<sigma> = 0xb7cc \<and> RAX \<sigma> = ucast (((ucast (((\<langle>31,0\<rangle>((((((ucast (((hi_imul(ucast ((RSI\<^sub>0::64 word))::64 word) (ucast ((0x7878787878787879::64 word))::64 word))::64 word))::64 word) >>> 3)::64 word) - ((ucast ((RSI\<^sub>0::64 word))::64 word) >>> 63))::64 word) + 0x3ff)::32 word)::32 word))::32 word) >> 10)) \<and> RBX \<sigma> = RSI\<^sub>0 \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = ((((ucast (((hi_imul(ucast ((RSI\<^sub>0::64 word))::64 word) (ucast ((0x7878787878787879::64 word))::64 word))::64 word))::64 word) >>> 3)::64 word) - ((ucast ((RSI\<^sub>0::64 word))::64 word) >>> 63)) \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = 0x241 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x458) \<and> RBP \<sigma> = RBP\<^sub>0 \<and> R15 \<sigma> = ucast (((ucast (((\<langle>31,0\<rangle>((((((ucast (((hi_imul(ucast ((RSI\<^sub>0::64 word))::64 word) (ucast ((0x7878787878787879::64 word))::64 word))::64 word))::64 word) >>> 3)::64 word) - ((ucast ((RSI\<^sub>0::64 word))::64 word) >>> 63))::64 word) + 0x3ff)::32 word)::32 word))::32 word) >> 10)) \<and> R14 \<sigma> = R14\<^sub>0 \<and> R13 \<sigma> = ucast ((\<langle>31,0\<rangle>open64_0xb4a1_retval::32 word)) \<and> R12 \<sigma> = R12\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x460),8]::64 word) = 0xb4a6\<close>
declare P_0xb7cc_true_11_def[Ps]

definition P_0xb7cc_true_11_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0xb7cc_true_11_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((FS\<^sub>0::64 word) + 0x28), 8),
    (2, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x40), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x460), 8)
  }\<close>

definition P_0xb7cc_true_11_regions :: state_pred where
  \<open>P_0xb7cc_true_11_regions \<sigma> \<equiv> \<exists>regions. P_0xb7cc_true_11_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0xb876_11 :: state_pred where
  \<open>Q_0xb876_11 \<sigma> \<equiv> RIP \<sigma> = 0xb876 \<and> RAX \<sigma> = ucast (((ucast (((\<langle>31,0\<rangle>((((((ucast (((hi_imul(ucast ((RSI\<^sub>0::64 word))::64 word) (ucast ((0x7878787878787879::64 word))::64 word))::64 word))::64 word) >>> 3)::64 word) - ((ucast ((RSI\<^sub>0::64 word))::64 word) >>> 63))::64 word) + 0x3ff)::32 word)::32 word))::32 word) >> 10)) \<and> RBX \<sigma> = RSI\<^sub>0 \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = ((((ucast (((hi_imul(ucast ((RSI\<^sub>0::64 word))::64 word) (ucast ((0x7878787878787879::64 word))::64 word))::64 word))::64 word) >>> 3)::64 word) - ((ucast ((RSI\<^sub>0::64 word))::64 word) >>> 63)) \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = 0x241 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x458) \<and> RBP \<sigma> = RBP\<^sub>0 \<and> R15 \<sigma> = ucast (((ucast (((\<langle>31,0\<rangle>((((((ucast (((hi_imul(ucast ((RSI\<^sub>0::64 word))::64 word) (ucast ((0x7878787878787879::64 word))::64 word))::64 word))::64 word) >>> 3)::64 word) - ((ucast ((RSI\<^sub>0::64 word))::64 word) >>> 63))::64 word) + 0x3ff)::32 word)::32 word))::32 word) >> 10)) \<and> R14 \<sigma> = R14\<^sub>0 \<and> R13 \<sigma> = ucast ((\<langle>31,0\<rangle>open64_0xb4a1_retval::32 word)) \<and> R12 \<sigma> = R12\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x460),8]::64 word) = 0xb4a6\<close>
declare Q_0xb876_11_def[Qs]

schematic_goal vpc_create_0_2_0xb7cc_0xb870_11[blocks]:
  assumes \<open>(P_0xb7cc_true_11 && P_0xb7cc_true_11_regions && jbe) \<sigma>\<close>
  shows \<open>exec_block 2 0xb870 11 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0xb876_11 ?\<sigma> \<and> block_usage P_0xb7cc_true_11_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0xb7cc_true_11_def P_0xb7cc_true_11_regions_def post: Q_0xb876_11_def regionset: P_0xb7cc_true_11_regions_set_def)

definition P_0xb876_true_12 :: state_pred where
  \<open>P_0xb876_true_12 \<sigma> \<equiv> RIP \<sigma> = 0xb876 \<and> RAX \<sigma> = ucast (((ucast (((\<langle>31,0\<rangle>((((((ucast (((hi_imul(ucast ((RSI\<^sub>0::64 word))::64 word) (ucast ((0x7878787878787879::64 word))::64 word))::64 word))::64 word) >>> 3)::64 word) - ((ucast ((RSI\<^sub>0::64 word))::64 word) >>> 63))::64 word) + 0x3ff)::32 word)::32 word))::32 word) >> 10)) \<and> RBX \<sigma> = RSI\<^sub>0 \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = ((((ucast (((hi_imul(ucast ((RSI\<^sub>0::64 word))::64 word) (ucast ((0x7878787878787879::64 word))::64 word))::64 word))::64 word) >>> 3)::64 word) - ((ucast ((RSI\<^sub>0::64 word))::64 word) >>> 63)) \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = 0x241 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x458) \<and> RBP \<sigma> = RBP\<^sub>0 \<and> R15 \<sigma> = ucast (((ucast (((\<langle>31,0\<rangle>((((((ucast (((hi_imul(ucast ((RSI\<^sub>0::64 word))::64 word) (ucast ((0x7878787878787879::64 word))::64 word))::64 word))::64 word) >>> 3)::64 word) - ((ucast ((RSI\<^sub>0::64 word))::64 word) >>> 63))::64 word) + 0x3ff)::32 word)::32 word))::32 word) >> 10)) \<and> R14 \<sigma> = R14\<^sub>0 \<and> R13 \<sigma> = ucast ((\<langle>31,0\<rangle>open64_0xb4a1_retval::32 word)) \<and> R12 \<sigma> = R12\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x460),8]::64 word) = 0xb4a6\<close>
declare P_0xb876_true_12_def[Ps]

definition P_0xb876_true_12_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0xb876_true_12_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((FS\<^sub>0::64 word) + 0x28), 8),
    (2, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x40), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x460), 8)
  }\<close>

definition P_0xb876_true_12_regions :: state_pred where
  \<open>P_0xb876_true_12_regions \<sigma> \<equiv> \<exists>regions. P_0xb876_true_12_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0xb80d_12 :: state_pred where
  \<open>Q_0xb80d_12 \<sigma> \<equiv> RIP \<sigma> = 0xb80d \<and> RAX \<sigma> = ((((ucast (((((hi_imul(ucast ((RSI\<^sub>0::64 word))::64 word) (ucast ((0x8421084210842109::64 word))::64 word))::64 word) + (\<langle>63,0\<rangle>((RSI\<^sub>0::64 word) * 0x1)::64 word))::64 word))::64 word) >>> 4)::64 word) - ((ucast ((RSI\<^sub>0::64 word))::64 word) >>> 63)) \<and> RBX \<sigma> = RSI\<^sub>0 \<and> RCX \<sigma> = ((ucast ((RSI\<^sub>0::64 word))::64 word) >>> 63) \<and> RDX \<sigma> = (hi_imul(ucast ((RSI\<^sub>0::64 word))::64 word) (ucast ((0x8421084210842109::64 word))::64 word)) \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = 0x241 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x458) \<and> RBP \<sigma> = RBP\<^sub>0 \<and> R15 \<sigma> = ucast (((ucast (((\<langle>31,0\<rangle>((((((ucast (((hi_imul(ucast ((RSI\<^sub>0::64 word))::64 word) (ucast ((0x7878787878787879::64 word))::64 word))::64 word))::64 word) >>> 3)::64 word) - ((ucast ((RSI\<^sub>0::64 word))::64 word) >>> 63))::64 word) + 0x3ff)::32 word)::32 word))::32 word) >> 10)) \<and> R14 \<sigma> = R14\<^sub>0 \<and> R13 \<sigma> = ucast ((\<langle>31,0\<rangle>open64_0xb4a1_retval::32 word)) \<and> R12 \<sigma> = R12\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x460),8]::64 word) = 0xb4a6\<close>
declare Q_0xb80d_12_def[Qs]

schematic_goal vpc_create_0_10_0xb876_0xb808_12[blocks]:
  assumes \<open>(P_0xb876_true_12 && P_0xb876_true_12_regions && ja) \<sigma>\<close>
  shows \<open>exec_block 10 0xb808 12 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0xb80d_12 ?\<sigma> \<and> block_usage P_0xb876_true_12_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0xb876_true_12_def P_0xb876_true_12_regions_def post: Q_0xb80d_12_def regionset: P_0xb876_true_12_regions_set_def)

definition P_0xb80d_true_13 :: state_pred where
  \<open>P_0xb80d_true_13 \<sigma> \<equiv> RIP \<sigma> = 0xb80d \<and> RAX \<sigma> = ((((ucast (((((hi_imul(ucast ((RSI\<^sub>0::64 word))::64 word) (ucast ((0x8421084210842109::64 word))::64 word))::64 word) + (\<langle>63,0\<rangle>((RSI\<^sub>0::64 word) * 0x1)::64 word))::64 word))::64 word) >>> 4)::64 word) - ((ucast ((RSI\<^sub>0::64 word))::64 word) >>> 63)) \<and> RBX \<sigma> = RSI\<^sub>0 \<and> RCX \<sigma> = ((ucast ((RSI\<^sub>0::64 word))::64 word) >>> 63) \<and> RDX \<sigma> = (hi_imul(ucast ((RSI\<^sub>0::64 word))::64 word) (ucast ((0x8421084210842109::64 word))::64 word)) \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = 0x241 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x458) \<and> RBP \<sigma> = RBP\<^sub>0 \<and> R15 \<sigma> = ucast (((ucast (((\<langle>31,0\<rangle>((((((ucast (((hi_imul(ucast ((RSI\<^sub>0::64 word))::64 word) (ucast ((0x7878787878787879::64 word))::64 word))::64 word))::64 word) >>> 3)::64 word) - ((ucast ((RSI\<^sub>0::64 word))::64 word) >>> 63))::64 word) + 0x3ff)::32 word)::32 word))::32 word) >> 10)) \<and> R14 \<sigma> = R14\<^sub>0 \<and> R13 \<sigma> = ucast ((\<langle>31,0\<rangle>open64_0xb4a1_retval::32 word)) \<and> R12 \<sigma> = R12\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x460),8]::64 word) = 0xb4a6\<close>
declare P_0xb80d_true_13_def[Ps]

definition P_0xb80d_true_13_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0xb80d_true_13_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((FS\<^sub>0::64 word) + 0x28), 8),
    (2, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x40), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x449), Suc 0),
    (10, ((RSP\<^sub>0::64 word) - 0x460), 8)
  }\<close>

definition P_0xb80d_true_13_regions :: state_pred where
  \<open>P_0xb80d_true_13_regions \<sigma> \<equiv> \<exists>regions. P_0xb80d_true_13_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0xb526_13 :: state_pred where
  \<open>Q_0xb526_13 \<sigma> \<equiv> RIP \<sigma> = 0xb526 \<and> RSI \<sigma> = 0x241 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x458) \<and> RBP \<sigma> = RBP\<^sub>0 \<and> R13 \<sigma> = ucast ((\<langle>31,0\<rangle>open64_0xb4a1_retval::32 word)) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x460),8]::64 word) = 0xb4a6\<close>
declare Q_0xb526_13_def[Qs]

schematic_goal vpc_create_0_17_0xb80d_0xb8ef_13[blocks]:
  assumes \<open>(P_0xb80d_true_13 && P_0xb80d_true_13_regions && jbe) \<sigma>\<close>
  shows \<open>exec_block 17 0xb8ef 13 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0xb526_13 ?\<sigma> \<and> block_usage P_0xb80d_true_13_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0xb80d_true_13_def P_0xb80d_true_13_regions_def post: Q_0xb526_13_def regionset: P_0xb80d_true_13_regions_set_def)

definition P_0xb80d_false_14 :: state_pred where
  \<open>P_0xb80d_false_14 \<sigma> \<equiv> RIP \<sigma> = 0xb80d \<and> RAX \<sigma> = ((((ucast (((((hi_imul(ucast ((RSI\<^sub>0::64 word))::64 word) (ucast ((0x8421084210842109::64 word))::64 word))::64 word) + (\<langle>63,0\<rangle>((RSI\<^sub>0::64 word) * 0x1)::64 word))::64 word))::64 word) >>> 4)::64 word) - ((ucast ((RSI\<^sub>0::64 word))::64 word) >>> 63)) \<and> RBX \<sigma> = RSI\<^sub>0 \<and> RCX \<sigma> = ((ucast ((RSI\<^sub>0::64 word))::64 word) >>> 63) \<and> RDX \<sigma> = (hi_imul(ucast ((RSI\<^sub>0::64 word))::64 word) (ucast ((0x8421084210842109::64 word))::64 word)) \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = 0x241 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x458) \<and> RBP \<sigma> = RBP\<^sub>0 \<and> R15 \<sigma> = ucast (((ucast (((\<langle>31,0\<rangle>((((((ucast (((hi_imul(ucast ((RSI\<^sub>0::64 word))::64 word) (ucast ((0x7878787878787879::64 word))::64 word))::64 word))::64 word) >>> 3)::64 word) - ((ucast ((RSI\<^sub>0::64 word))::64 word) >>> 63))::64 word) + 0x3ff)::32 word)::32 word))::32 word) >> 10)) \<and> R14 \<sigma> = R14\<^sub>0 \<and> R13 \<sigma> = ucast ((\<langle>31,0\<rangle>open64_0xb4a1_retval::32 word)) \<and> R12 \<sigma> = R12\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x460),8]::64 word) = 0xb4a6\<close>
declare P_0xb80d_false_14_def[Ps]

definition P_0xb80d_false_14_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0xb80d_false_14_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((FS\<^sub>0::64 word) + 0x28), 8),
    (2, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x40), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x449), Suc 0),
    (10, ((RSP\<^sub>0::64 word) - 0x460), 8)
  }\<close>

definition P_0xb80d_false_14_regions :: state_pred where
  \<open>P_0xb80d_false_14_regions \<sigma> \<equiv> \<exists>regions. P_0xb80d_false_14_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0xb526_14 :: state_pred where
  \<open>Q_0xb526_14 \<sigma> \<equiv> RIP \<sigma> = 0xb526 \<and> RSI \<sigma> = 0x241 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x458) \<and> RBP \<sigma> = RBP\<^sub>0 \<and> R13 \<sigma> = ucast ((\<langle>31,0\<rangle>open64_0xb4a1_retval::32 word)) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x460),8]::64 word) = 0xb4a6\<close>
declare Q_0xb526_14_def[Qs]

schematic_goal vpc_create_0_23_0xb80d_0xb868_14[blocks]:
  assumes \<open>(P_0xb80d_false_14 && P_0xb80d_false_14_regions && ! jbe) \<sigma>\<close>
  shows \<open>exec_block 23 0xb868 14 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0xb526_14 ?\<sigma> \<and> block_usage P_0xb80d_false_14_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0xb80d_false_14_def P_0xb80d_false_14_regions_def post: Q_0xb526_14_def regionset: P_0xb80d_false_14_regions_set_def)

definition P_0xb876_false_15 :: state_pred where
  \<open>P_0xb876_false_15 \<sigma> \<equiv> RIP \<sigma> = 0xb876 \<and> RAX \<sigma> = ucast (((ucast (((\<langle>31,0\<rangle>((((((ucast (((hi_imul(ucast ((RSI\<^sub>0::64 word))::64 word) (ucast ((0x7878787878787879::64 word))::64 word))::64 word))::64 word) >>> 3)::64 word) - ((ucast ((RSI\<^sub>0::64 word))::64 word) >>> 63))::64 word) + 0x3ff)::32 word)::32 word))::32 word) >> 10)) \<and> RBX \<sigma> = RSI\<^sub>0 \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = ((((ucast (((hi_imul(ucast ((RSI\<^sub>0::64 word))::64 word) (ucast ((0x7878787878787879::64 word))::64 word))::64 word))::64 word) >>> 3)::64 word) - ((ucast ((RSI\<^sub>0::64 word))::64 word) >>> 63)) \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = 0x241 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x458) \<and> RBP \<sigma> = RBP\<^sub>0 \<and> R15 \<sigma> = ucast (((ucast (((\<langle>31,0\<rangle>((((((ucast (((hi_imul(ucast ((RSI\<^sub>0::64 word))::64 word) (ucast ((0x7878787878787879::64 word))::64 word))::64 word))::64 word) >>> 3)::64 word) - ((ucast ((RSI\<^sub>0::64 word))::64 word) >>> 63))::64 word) + 0x3ff)::32 word)::32 word))::32 word) >> 10)) \<and> R14 \<sigma> = R14\<^sub>0 \<and> R13 \<sigma> = ucast ((\<langle>31,0\<rangle>open64_0xb4a1_retval::32 word)) \<and> R12 \<sigma> = R12\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x460),8]::64 word) = 0xb4a6\<close>
declare P_0xb876_false_15_def[Ps]

definition P_0xb876_false_15_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0xb876_false_15_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((FS\<^sub>0::64 word) + 0x28), 8),
    (2, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x40), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x449), Suc 0),
    (10, ((RSP\<^sub>0::64 word) - 0x460), 8)
  }\<close>

definition P_0xb876_false_15_regions :: state_pred where
  \<open>P_0xb876_false_15_regions \<sigma> \<equiv> \<exists>regions. P_0xb876_false_15_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0xb526_15 :: state_pred where
  \<open>Q_0xb526_15 \<sigma> \<equiv> RIP \<sigma> = 0xb526 \<and> RSI \<sigma> = 0x241 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x458) \<and> RBP \<sigma> = RBP\<^sub>0 \<and> R13 \<sigma> = ucast ((\<langle>31,0\<rangle>open64_0xb4a1_retval::32 word)) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x460),8]::64 word) = 0xb4a6\<close>
declare Q_0xb526_15_def[Qs]

schematic_goal vpc_create_0_15_0xb876_0xb8b0_15[blocks]:
  assumes \<open>(P_0xb876_false_15 && P_0xb876_false_15_regions && ! ja) \<sigma>\<close>
  shows \<open>exec_block 15 0xb8b0 15 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0xb526_15 ?\<sigma> \<and> block_usage P_0xb876_false_15_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0xb876_false_15_def P_0xb876_false_15_regions_def post: Q_0xb526_15_def regionset: P_0xb876_false_15_regions_set_def)

definition P_0xb7cc_false_16 :: state_pred where
  \<open>P_0xb7cc_false_16 \<sigma> \<equiv> RIP \<sigma> = 0xb7cc \<and> RAX \<sigma> = ucast (((ucast (((\<langle>31,0\<rangle>((((((ucast (((hi_imul(ucast ((RSI\<^sub>0::64 word))::64 word) (ucast ((0x7878787878787879::64 word))::64 word))::64 word))::64 word) >>> 3)::64 word) - ((ucast ((RSI\<^sub>0::64 word))::64 word) >>> 63))::64 word) + 0x3ff)::32 word)::32 word))::32 word) >> 10)) \<and> RBX \<sigma> = RSI\<^sub>0 \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = ((((ucast (((hi_imul(ucast ((RSI\<^sub>0::64 word))::64 word) (ucast ((0x7878787878787879::64 word))::64 word))::64 word))::64 word) >>> 3)::64 word) - ((ucast ((RSI\<^sub>0::64 word))::64 word) >>> 63)) \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = 0x241 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x458) \<and> RBP \<sigma> = RBP\<^sub>0 \<and> R15 \<sigma> = ucast (((ucast (((\<langle>31,0\<rangle>((((((ucast (((hi_imul(ucast ((RSI\<^sub>0::64 word))::64 word) (ucast ((0x7878787878787879::64 word))::64 word))::64 word))::64 word) >>> 3)::64 word) - ((ucast ((RSI\<^sub>0::64 word))::64 word) >>> 63))::64 word) + 0x3ff)::32 word)::32 word))::32 word) >> 10)) \<and> R14 \<sigma> = R14\<^sub>0 \<and> R13 \<sigma> = ucast ((\<langle>31,0\<rangle>open64_0xb4a1_retval::32 word)) \<and> R12 \<sigma> = R12\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x460),8]::64 word) = 0xb4a6\<close>
declare P_0xb7cc_false_16_def[Ps]

definition P_0xb7cc_false_16_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0xb7cc_false_16_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((FS\<^sub>0::64 word) + 0x28), 8),
    (2, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x40), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x460), 8)
  }\<close>

definition P_0xb7cc_false_16_regions :: state_pred where
  \<open>P_0xb7cc_false_16_regions \<sigma> \<equiv> \<exists>regions. P_0xb7cc_false_16_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0xb7dc_16 :: state_pred where
  \<open>Q_0xb7dc_16 \<sigma> \<equiv> RIP \<sigma> = 0xb7dc \<and> RAX \<sigma> = ucast (((ucast (((\<langle>31,0\<rangle>((((((ucast (((hi_imul(ucast ((RSI\<^sub>0::64 word))::64 word) (ucast ((0x7878787878787879::64 word))::64 word))::64 word))::64 word) >>> 3)::64 word) - ((ucast ((RSI\<^sub>0::64 word))::64 word) >>> 63))::64 word) + 0x3ff)::32 word)::32 word))::32 word) >> 10)) \<and> RBX \<sigma> = RSI\<^sub>0 \<and> RCX \<sigma> = ucast ((\<langle>7,0\<rangle>((ucast (((\<langle>31,0\<rangle>((((((ucast (((hi_imul(ucast ((RSI\<^sub>0::64 word))::64 word) (ucast ((0x7878787878787879::64 word))::64 word))::64 word))::64 word) >>> 3)::64 word) - ((ucast ((RSI\<^sub>0::64 word))::64 word) >>> 63))::64 word) + 0x3ff)::32 word)::32 word))::32 word) >> 10)::8 word)) \<and> RDX \<sigma> = ((((ucast (((hi_imul(ucast ((RSI\<^sub>0::64 word))::64 word) (ucast ((0x7878787878787879::64 word))::64 word))::64 word))::64 word) >>> 3)::64 word) - ((ucast ((RSI\<^sub>0::64 word))::64 word) >>> 63)) \<and> RDI \<sigma> = ucast (((ucast (((\<langle>7,0\<rangle>((ucast (((\<langle>31,0\<rangle>((((((ucast (((hi_imul(ucast ((RSI\<^sub>0::64 word))::64 word) (ucast ((0x7878787878787879::64 word))::64 word))::64 word))::64 word) >>> 3)::64 word) - ((ucast ((RSI\<^sub>0::64 word))::64 word) >>> 63))::64 word) + 0x3ff)::32 word)::32 word))::32 word) >> 10)::8 word)::8 word))::32 word) << 10)) \<and> RSI \<sigma> = 0x241 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x458) \<and> RBP \<sigma> = RBP\<^sub>0 \<and> R15 \<sigma> = ucast (((ucast (((\<langle>31,0\<rangle>((((((ucast (((hi_imul(ucast ((RSI\<^sub>0::64 word))::64 word) (ucast ((0x7878787878787879::64 word))::64 word))::64 word))::64 word) >>> 3)::64 word) - ((ucast ((RSI\<^sub>0::64 word))::64 word) >>> 63))::64 word) + 0x3ff)::32 word)::32 word))::32 word) >> 10)) \<and> R14 \<sigma> = R14\<^sub>0 \<and> R13 \<sigma> = ucast ((\<langle>31,0\<rangle>open64_0xb4a1_retval::32 word)) \<and> R12 \<sigma> = R12\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x460),8]::64 word) = 0xb4a6\<close>
declare Q_0xb7dc_16_def[Qs]

schematic_goal vpc_create_0_5_0xb7cc_0xb7da_16[blocks]:
  assumes \<open>(P_0xb7cc_false_16 && P_0xb7cc_false_16_regions && ! jbe) \<sigma>\<close>
  shows \<open>exec_block 5 0xb7da 16 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0xb7dc_16 ?\<sigma> \<and> block_usage P_0xb7cc_false_16_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0xb7cc_false_16_def P_0xb7cc_false_16_regions_def post: Q_0xb7dc_16_def regionset: P_0xb7cc_false_16_regions_set_def)

definition P_0xb7dc_true_17 :: state_pred where
  \<open>P_0xb7dc_true_17 \<sigma> \<equiv> RIP \<sigma> = 0xb7dc \<and> RAX \<sigma> = ucast (((ucast (((\<langle>31,0\<rangle>((((((ucast (((hi_imul(ucast ((RSI\<^sub>0::64 word))::64 word) (ucast ((0x7878787878787879::64 word))::64 word))::64 word))::64 word) >>> 3)::64 word) - ((ucast ((RSI\<^sub>0::64 word))::64 word) >>> 63))::64 word) + 0x3ff)::32 word)::32 word))::32 word) >> 10)) \<and> RBX \<sigma> = RSI\<^sub>0 \<and> RCX \<sigma> = ucast ((\<langle>7,0\<rangle>((ucast (((\<langle>31,0\<rangle>((((((ucast (((hi_imul(ucast ((RSI\<^sub>0::64 word))::64 word) (ucast ((0x7878787878787879::64 word))::64 word))::64 word))::64 word) >>> 3)::64 word) - ((ucast ((RSI\<^sub>0::64 word))::64 word) >>> 63))::64 word) + 0x3ff)::32 word)::32 word))::32 word) >> 10)::8 word)) \<and> RDX \<sigma> = ((((ucast (((hi_imul(ucast ((RSI\<^sub>0::64 word))::64 word) (ucast ((0x7878787878787879::64 word))::64 word))::64 word))::64 word) >>> 3)::64 word) - ((ucast ((RSI\<^sub>0::64 word))::64 word) >>> 63)) \<and> RDI \<sigma> = ucast (((ucast (((\<langle>7,0\<rangle>((ucast (((\<langle>31,0\<rangle>((((((ucast (((hi_imul(ucast ((RSI\<^sub>0::64 word))::64 word) (ucast ((0x7878787878787879::64 word))::64 word))::64 word))::64 word) >>> 3)::64 word) - ((ucast ((RSI\<^sub>0::64 word))::64 word) >>> 63))::64 word) + 0x3ff)::32 word)::32 word))::32 word) >> 10)::8 word)::8 word))::32 word) << 10)) \<and> RSI \<sigma> = 0x241 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x458) \<and> RBP \<sigma> = RBP\<^sub>0 \<and> R15 \<sigma> = ucast (((ucast (((\<langle>31,0\<rangle>((((((ucast (((hi_imul(ucast ((RSI\<^sub>0::64 word))::64 word) (ucast ((0x7878787878787879::64 word))::64 word))::64 word))::64 word) >>> 3)::64 word) - ((ucast ((RSI\<^sub>0::64 word))::64 word) >>> 63))::64 word) + 0x3ff)::32 word)::32 word))::32 word) >> 10)) \<and> R14 \<sigma> = R14\<^sub>0 \<and> R13 \<sigma> = ucast ((\<langle>31,0\<rangle>open64_0xb4a1_retval::32 word)) \<and> R12 \<sigma> = R12\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x460),8]::64 word) = 0xb4a6\<close>
declare P_0xb7dc_true_17_def[Ps]

definition P_0xb7dc_true_17_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0xb7dc_true_17_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((FS\<^sub>0::64 word) + 0x28), 8),
    (2, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x40), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x460), 8)
  }\<close>

definition P_0xb7dc_true_17_regions :: state_pred where
  \<open>P_0xb7dc_true_17_regions \<sigma> \<equiv> \<exists>regions. P_0xb7dc_true_17_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0xb80d_17 :: state_pred where
  \<open>Q_0xb80d_17 \<sigma> \<equiv> RIP \<sigma> = 0xb80d \<and> RAX \<sigma> = ((((ucast (((((hi_imul(ucast ((RSI\<^sub>0::64 word))::64 word) (ucast ((0x8421084210842109::64 word))::64 word))::64 word) + (\<langle>63,0\<rangle>((RSI\<^sub>0::64 word) * 0x1)::64 word))::64 word))::64 word) >>> 4)::64 word) - ((ucast ((RSI\<^sub>0::64 word))::64 word) >>> 63)) \<and> RBX \<sigma> = RSI\<^sub>0 \<and> RCX \<sigma> = ((ucast ((RSI\<^sub>0::64 word))::64 word) >>> 63) \<and> RDX \<sigma> = (hi_imul(ucast ((RSI\<^sub>0::64 word))::64 word) (ucast ((0x8421084210842109::64 word))::64 word)) \<and> RDI \<sigma> = ucast (((ucast (((\<langle>7,0\<rangle>((ucast (((\<langle>31,0\<rangle>((((((ucast (((hi_imul(ucast ((RSI\<^sub>0::64 word))::64 word) (ucast ((0x7878787878787879::64 word))::64 word))::64 word))::64 word) >>> 3)::64 word) - ((ucast ((RSI\<^sub>0::64 word))::64 word) >>> 63))::64 word) + 0x3ff)::32 word)::32 word))::32 word) >> 10)::8 word)::8 word))::32 word) << 10)) \<and> RSI \<sigma> = 0x241 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x458) \<and> RBP \<sigma> = RBP\<^sub>0 \<and> R15 \<sigma> = ucast (((ucast (((\<langle>31,0\<rangle>((((((ucast (((hi_imul(ucast ((RSI\<^sub>0::64 word))::64 word) (ucast ((0x7878787878787879::64 word))::64 word))::64 word))::64 word) >>> 3)::64 word) - ((ucast ((RSI\<^sub>0::64 word))::64 word) >>> 63))::64 word) + 0x3ff)::32 word)::32 word))::32 word) >> 10)) \<and> R14 \<sigma> = R14\<^sub>0 \<and> R13 \<sigma> = ucast ((\<langle>31,0\<rangle>open64_0xb4a1_retval::32 word)) \<and> R12 \<sigma> = R12\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x460),8]::64 word) = 0xb4a6\<close>
declare Q_0xb80d_17_def[Qs]

schematic_goal vpc_create_0_10_0xb7dc_0xb808_17[blocks]:
  assumes \<open>(P_0xb7dc_true_17 && P_0xb7dc_true_17_regions && jbe) \<sigma>\<close>
  shows \<open>exec_block 10 0xb808 17 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0xb80d_17 ?\<sigma> \<and> block_usage P_0xb7dc_true_17_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0xb7dc_true_17_def P_0xb7dc_true_17_regions_def post: Q_0xb80d_17_def regionset: P_0xb7dc_true_17_regions_set_def)

definition P_0xb80d_true_18 :: state_pred where
  \<open>P_0xb80d_true_18 \<sigma> \<equiv> RIP \<sigma> = 0xb80d \<and> RAX \<sigma> = ((((ucast (((((hi_imul(ucast ((RSI\<^sub>0::64 word))::64 word) (ucast ((0x8421084210842109::64 word))::64 word))::64 word) + (\<langle>63,0\<rangle>((RSI\<^sub>0::64 word) * 0x1)::64 word))::64 word))::64 word) >>> 4)::64 word) - ((ucast ((RSI\<^sub>0::64 word))::64 word) >>> 63)) \<and> RBX \<sigma> = RSI\<^sub>0 \<and> RCX \<sigma> = ((ucast ((RSI\<^sub>0::64 word))::64 word) >>> 63) \<and> RDX \<sigma> = (hi_imul(ucast ((RSI\<^sub>0::64 word))::64 word) (ucast ((0x8421084210842109::64 word))::64 word)) \<and> RDI \<sigma> = ucast (((ucast (((\<langle>7,0\<rangle>((ucast (((\<langle>31,0\<rangle>((((((ucast (((hi_imul(ucast ((RSI\<^sub>0::64 word))::64 word) (ucast ((0x7878787878787879::64 word))::64 word))::64 word))::64 word) >>> 3)::64 word) - ((ucast ((RSI\<^sub>0::64 word))::64 word) >>> 63))::64 word) + 0x3ff)::32 word)::32 word))::32 word) >> 10)::8 word)::8 word))::32 word) << 10)) \<and> RSI \<sigma> = 0x241 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x458) \<and> RBP \<sigma> = RBP\<^sub>0 \<and> R15 \<sigma> = ucast (((ucast (((\<langle>31,0\<rangle>((((((ucast (((hi_imul(ucast ((RSI\<^sub>0::64 word))::64 word) (ucast ((0x7878787878787879::64 word))::64 word))::64 word))::64 word) >>> 3)::64 word) - ((ucast ((RSI\<^sub>0::64 word))::64 word) >>> 63))::64 word) + 0x3ff)::32 word)::32 word))::32 word) >> 10)) \<and> R14 \<sigma> = R14\<^sub>0 \<and> R13 \<sigma> = ucast ((\<langle>31,0\<rangle>open64_0xb4a1_retval::32 word)) \<and> R12 \<sigma> = R12\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x460),8]::64 word) = 0xb4a6\<close>
declare P_0xb80d_true_18_def[Ps]

definition P_0xb80d_true_18_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0xb80d_true_18_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((FS\<^sub>0::64 word) + 0x28), 8),
    (2, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x40), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x449), Suc 0),
    (10, ((RSP\<^sub>0::64 word) - 0x460), 8)
  }\<close>

definition P_0xb80d_true_18_regions :: state_pred where
  \<open>P_0xb80d_true_18_regions \<sigma> \<equiv> \<exists>regions. P_0xb80d_true_18_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0xb526_18 :: state_pred where
  \<open>Q_0xb526_18 \<sigma> \<equiv> RIP \<sigma> = 0xb526 \<and> RSI \<sigma> = 0x241 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x458) \<and> RBP \<sigma> = RBP\<^sub>0 \<and> R13 \<sigma> = ucast ((\<langle>31,0\<rangle>open64_0xb4a1_retval::32 word)) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x460),8]::64 word) = 0xb4a6\<close>
declare Q_0xb526_18_def[Qs]

schematic_goal vpc_create_0_17_0xb80d_0xb8ef_18[blocks]:
  assumes \<open>(P_0xb80d_true_18 && P_0xb80d_true_18_regions && jbe) \<sigma>\<close>
  shows \<open>exec_block 17 0xb8ef 18 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0xb526_18 ?\<sigma> \<and> block_usage P_0xb80d_true_18_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0xb80d_true_18_def P_0xb80d_true_18_regions_def post: Q_0xb526_18_def regionset: P_0xb80d_true_18_regions_set_def)

definition P_0xb80d_false_19 :: state_pred where
  \<open>P_0xb80d_false_19 \<sigma> \<equiv> RIP \<sigma> = 0xb80d \<and> RAX \<sigma> = ((((ucast (((((hi_imul(ucast ((RSI\<^sub>0::64 word))::64 word) (ucast ((0x8421084210842109::64 word))::64 word))::64 word) + (\<langle>63,0\<rangle>((RSI\<^sub>0::64 word) * 0x1)::64 word))::64 word))::64 word) >>> 4)::64 word) - ((ucast ((RSI\<^sub>0::64 word))::64 word) >>> 63)) \<and> RBX \<sigma> = RSI\<^sub>0 \<and> RCX \<sigma> = ((ucast ((RSI\<^sub>0::64 word))::64 word) >>> 63) \<and> RDX \<sigma> = (hi_imul(ucast ((RSI\<^sub>0::64 word))::64 word) (ucast ((0x8421084210842109::64 word))::64 word)) \<and> RDI \<sigma> = ucast (((ucast (((\<langle>7,0\<rangle>((ucast (((\<langle>31,0\<rangle>((((((ucast (((hi_imul(ucast ((RSI\<^sub>0::64 word))::64 word) (ucast ((0x7878787878787879::64 word))::64 word))::64 word))::64 word) >>> 3)::64 word) - ((ucast ((RSI\<^sub>0::64 word))::64 word) >>> 63))::64 word) + 0x3ff)::32 word)::32 word))::32 word) >> 10)::8 word)::8 word))::32 word) << 10)) \<and> RSI \<sigma> = 0x241 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x458) \<and> RBP \<sigma> = RBP\<^sub>0 \<and> R15 \<sigma> = ucast (((ucast (((\<langle>31,0\<rangle>((((((ucast (((hi_imul(ucast ((RSI\<^sub>0::64 word))::64 word) (ucast ((0x7878787878787879::64 word))::64 word))::64 word))::64 word) >>> 3)::64 word) - ((ucast ((RSI\<^sub>0::64 word))::64 word) >>> 63))::64 word) + 0x3ff)::32 word)::32 word))::32 word) >> 10)) \<and> R14 \<sigma> = R14\<^sub>0 \<and> R13 \<sigma> = ucast ((\<langle>31,0\<rangle>open64_0xb4a1_retval::32 word)) \<and> R12 \<sigma> = R12\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x460),8]::64 word) = 0xb4a6\<close>
declare P_0xb80d_false_19_def[Ps]

definition P_0xb80d_false_19_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0xb80d_false_19_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((FS\<^sub>0::64 word) + 0x28), 8),
    (2, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x40), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x449), Suc 0),
    (10, ((RSP\<^sub>0::64 word) - 0x460), 8)
  }\<close>

definition P_0xb80d_false_19_regions :: state_pred where
  \<open>P_0xb80d_false_19_regions \<sigma> \<equiv> \<exists>regions. P_0xb80d_false_19_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0xb526_19 :: state_pred where
  \<open>Q_0xb526_19 \<sigma> \<equiv> RIP \<sigma> = 0xb526 \<and> RSI \<sigma> = 0x241 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x458) \<and> RBP \<sigma> = RBP\<^sub>0 \<and> R13 \<sigma> = ucast ((\<langle>31,0\<rangle>open64_0xb4a1_retval::32 word)) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x460),8]::64 word) = 0xb4a6\<close>
declare Q_0xb526_19_def[Qs]

schematic_goal vpc_create_0_23_0xb80d_0xb868_19[blocks]:
  assumes \<open>(P_0xb80d_false_19 && P_0xb80d_false_19_regions && ! jbe) \<sigma>\<close>
  shows \<open>exec_block 23 0xb868 19 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0xb526_19 ?\<sigma> \<and> block_usage P_0xb80d_false_19_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0xb80d_false_19_def P_0xb80d_false_19_regions_def post: Q_0xb526_19_def regionset: P_0xb80d_false_19_regions_set_def)

definition P_0xb7dc_false_20 :: state_pred where
  \<open>P_0xb7dc_false_20 \<sigma> \<equiv> RIP \<sigma> = 0xb7dc \<and> RAX \<sigma> = ucast (((ucast (((\<langle>31,0\<rangle>((((((ucast (((hi_imul(ucast ((RSI\<^sub>0::64 word))::64 word) (ucast ((0x7878787878787879::64 word))::64 word))::64 word))::64 word) >>> 3)::64 word) - ((ucast ((RSI\<^sub>0::64 word))::64 word) >>> 63))::64 word) + 0x3ff)::32 word)::32 word))::32 word) >> 10)) \<and> RBX \<sigma> = RSI\<^sub>0 \<and> RCX \<sigma> = ucast ((\<langle>7,0\<rangle>((ucast (((\<langle>31,0\<rangle>((((((ucast (((hi_imul(ucast ((RSI\<^sub>0::64 word))::64 word) (ucast ((0x7878787878787879::64 word))::64 word))::64 word))::64 word) >>> 3)::64 word) - ((ucast ((RSI\<^sub>0::64 word))::64 word) >>> 63))::64 word) + 0x3ff)::32 word)::32 word))::32 word) >> 10)::8 word)) \<and> RDX \<sigma> = ((((ucast (((hi_imul(ucast ((RSI\<^sub>0::64 word))::64 word) (ucast ((0x7878787878787879::64 word))::64 word))::64 word))::64 word) >>> 3)::64 word) - ((ucast ((RSI\<^sub>0::64 word))::64 word) >>> 63)) \<and> RDI \<sigma> = ucast (((ucast (((\<langle>7,0\<rangle>((ucast (((\<langle>31,0\<rangle>((((((ucast (((hi_imul(ucast ((RSI\<^sub>0::64 word))::64 word) (ucast ((0x7878787878787879::64 word))::64 word))::64 word))::64 word) >>> 3)::64 word) - ((ucast ((RSI\<^sub>0::64 word))::64 word) >>> 63))::64 word) + 0x3ff)::32 word)::32 word))::32 word) >> 10)::8 word)::8 word))::32 word) << 10)) \<and> RSI \<sigma> = 0x241 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x458) \<and> RBP \<sigma> = RBP\<^sub>0 \<and> R15 \<sigma> = ucast (((ucast (((\<langle>31,0\<rangle>((((((ucast (((hi_imul(ucast ((RSI\<^sub>0::64 word))::64 word) (ucast ((0x7878787878787879::64 word))::64 word))::64 word))::64 word) >>> 3)::64 word) - ((ucast ((RSI\<^sub>0::64 word))::64 word) >>> 63))::64 word) + 0x3ff)::32 word)::32 word))::32 word) >> 10)) \<and> R14 \<sigma> = R14\<^sub>0 \<and> R13 \<sigma> = ucast ((\<langle>31,0\<rangle>open64_0xb4a1_retval::32 word)) \<and> R12 \<sigma> = R12\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x460),8]::64 word) = 0xb4a6\<close>
declare P_0xb7dc_false_20_def[Ps]

definition P_0xb7dc_false_20_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0xb7dc_false_20_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((FS\<^sub>0::64 word) + 0x28), 8),
    (2, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x40), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x460), 8)
  }\<close>

definition P_0xb7dc_false_20_regions :: state_pred where
  \<open>P_0xb7dc_false_20_regions \<sigma> \<equiv> \<exists>regions. P_0xb7dc_false_20_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0xb7e0_20 :: state_pred where
  \<open>Q_0xb7e0_20 \<sigma> \<equiv> RIP \<sigma> = 0xb7e0 \<and> RAX \<sigma> = ucast (((ucast (((\<langle>31,0\<rangle>((((((ucast (((hi_imul(ucast ((RSI\<^sub>0::64 word))::64 word) (ucast ((0x7878787878787879::64 word))::64 word))::64 word))::64 word) >>> 3)::64 word) - ((ucast ((RSI\<^sub>0::64 word))::64 word) >>> 63))::64 word) + 0x3ff)::32 word)::32 word))::32 word) >> 10)) \<and> RBX \<sigma> = RSI\<^sub>0 \<and> RCX \<sigma> = ucast ((\<langle>7,0\<rangle>((ucast (((\<langle>31,0\<rangle>((((((ucast (((hi_imul(ucast ((RSI\<^sub>0::64 word))::64 word) (ucast ((0x7878787878787879::64 word))::64 word))::64 word))::64 word) >>> 3)::64 word) - ((ucast ((RSI\<^sub>0::64 word))::64 word) >>> 63))::64 word) + 0x3ff)::32 word)::32 word))::32 word) >> 10)::8 word)) \<and> RDX \<sigma> = ((((ucast (((hi_imul(ucast ((RSI\<^sub>0::64 word))::64 word) (ucast ((0x7878787878787879::64 word))::64 word))::64 word))::64 word) >>> 3)::64 word) - ((ucast ((RSI\<^sub>0::64 word))::64 word) >>> 63)) \<and> RDI \<sigma> = ucast (((ucast (((\<langle>7,0\<rangle>((ucast (((\<langle>31,0\<rangle>((((((ucast (((hi_imul(ucast ((RSI\<^sub>0::64 word))::64 word) (ucast ((0x7878787878787879::64 word))::64 word))::64 word))::64 word) >>> 3)::64 word) - ((ucast ((RSI\<^sub>0::64 word))::64 word) >>> 63))::64 word) + 0x3ff)::32 word)::32 word))::32 word) >> 10)::8 word)::8 word))::32 word) << 10)) \<and> RSI \<sigma> = 0x241 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x458) \<and> RBP \<sigma> = RBP\<^sub>0 \<and> R15 \<sigma> = ucast (((ucast (((\<langle>31,0\<rangle>((((((ucast (((hi_imul(ucast ((RSI\<^sub>0::64 word))::64 word) (ucast ((0x7878787878787879::64 word))::64 word))::64 word))::64 word) >>> 3)::64 word) - ((ucast ((RSI\<^sub>0::64 word))::64 word) >>> 63))::64 word) + 0x3ff)::32 word)::32 word))::32 word) >> 10)) \<and> R14 \<sigma> = R14\<^sub>0 \<and> R13 \<sigma> = ucast ((\<langle>31,0\<rangle>open64_0xb4a1_retval::32 word)) \<and> R12 \<sigma> = R12\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x460),8]::64 word) = 0xb4a6\<close>
declare Q_0xb7e0_20_def[Qs]

schematic_goal vpc_create_0_2_0xb7dc_0xb7de_20[blocks]:
  assumes \<open>(P_0xb7dc_false_20 && P_0xb7dc_false_20_regions && ! jbe) \<sigma>\<close>
  shows \<open>exec_block 2 0xb7de 20 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0xb7e0_20 ?\<sigma> \<and> block_usage P_0xb7dc_false_20_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0xb7dc_false_20_def P_0xb7dc_false_20_regions_def post: Q_0xb7e0_20_def regionset: P_0xb7dc_false_20_regions_set_def)

definition P_0xb7e0_true_21 :: state_pred where
  \<open>P_0xb7e0_true_21 \<sigma> \<equiv> RIP \<sigma> = 0xb7e0 \<and> RAX \<sigma> = ucast (((ucast (((\<langle>31,0\<rangle>((((((ucast (((hi_imul(ucast ((RSI\<^sub>0::64 word))::64 word) (ucast ((0x7878787878787879::64 word))::64 word))::64 word))::64 word) >>> 3)::64 word) - ((ucast ((RSI\<^sub>0::64 word))::64 word) >>> 63))::64 word) + 0x3ff)::32 word)::32 word))::32 word) >> 10)) \<and> RBX \<sigma> = RSI\<^sub>0 \<and> RCX \<sigma> = ucast ((\<langle>7,0\<rangle>((ucast (((\<langle>31,0\<rangle>((((((ucast (((hi_imul(ucast ((RSI\<^sub>0::64 word))::64 word) (ucast ((0x7878787878787879::64 word))::64 word))::64 word))::64 word) >>> 3)::64 word) - ((ucast ((RSI\<^sub>0::64 word))::64 word) >>> 63))::64 word) + 0x3ff)::32 word)::32 word))::32 word) >> 10)::8 word)) \<and> RDX \<sigma> = ((((ucast (((hi_imul(ucast ((RSI\<^sub>0::64 word))::64 word) (ucast ((0x7878787878787879::64 word))::64 word))::64 word))::64 word) >>> 3)::64 word) - ((ucast ((RSI\<^sub>0::64 word))::64 word) >>> 63)) \<and> RDI \<sigma> = ucast (((ucast (((\<langle>7,0\<rangle>((ucast (((\<langle>31,0\<rangle>((((((ucast (((hi_imul(ucast ((RSI\<^sub>0::64 word))::64 word) (ucast ((0x7878787878787879::64 word))::64 word))::64 word))::64 word) >>> 3)::64 word) - ((ucast ((RSI\<^sub>0::64 word))::64 word) >>> 63))::64 word) + 0x3ff)::32 word)::32 word))::32 word) >> 10)::8 word)::8 word))::32 word) << 10)) \<and> RSI \<sigma> = 0x241 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x458) \<and> RBP \<sigma> = RBP\<^sub>0 \<and> R15 \<sigma> = ucast (((ucast (((\<langle>31,0\<rangle>((((((ucast (((hi_imul(ucast ((RSI\<^sub>0::64 word))::64 word) (ucast ((0x7878787878787879::64 word))::64 word))::64 word))::64 word) >>> 3)::64 word) - ((ucast ((RSI\<^sub>0::64 word))::64 word) >>> 63))::64 word) + 0x3ff)::32 word)::32 word))::32 word) >> 10)) \<and> R14 \<sigma> = R14\<^sub>0 \<and> R13 \<sigma> = ucast ((\<langle>31,0\<rangle>open64_0xb4a1_retval::32 word)) \<and> R12 \<sigma> = R12\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x460),8]::64 word) = 0xb4a6\<close>
declare P_0xb7e0_true_21_def[Ps]

definition P_0xb7e0_true_21_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0xb7e0_true_21_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((FS\<^sub>0::64 word) + 0x28), 8),
    (2, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x40), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x449), Suc 0),
    (10, ((RSP\<^sub>0::64 word) - 0x460), 8)
  }\<close>

definition P_0xb7e0_true_21_regions :: state_pred where
  \<open>P_0xb7e0_true_21_regions \<sigma> \<equiv> \<exists>regions. P_0xb7e0_true_21_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0xb526_21 :: state_pred where
  \<open>Q_0xb526_21 \<sigma> \<equiv> RIP \<sigma> = 0xb526 \<and> RSI \<sigma> = 0x241 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x458) \<and> RBP \<sigma> = RBP\<^sub>0 \<and> R13 \<sigma> = ucast ((\<langle>31,0\<rangle>open64_0xb4a1_retval::32 word)) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x460),8]::64 word) = 0xb4a6\<close>
declare Q_0xb526_21_def[Qs]

schematic_goal vpc_create_0_19_0xb7e0_0xb931_21[blocks]:
  assumes \<open>(P_0xb7e0_true_21 && P_0xb7e0_true_21_regions && jbe) \<sigma>\<close>
  shows \<open>exec_block 19 0xb931 21 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0xb526_21 ?\<sigma> \<and> block_usage P_0xb7e0_true_21_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0xb7e0_true_21_def P_0xb7e0_true_21_regions_def post: Q_0xb526_21_def regionset: P_0xb7e0_true_21_regions_set_def)

definition P_0xb7e0_false_22 :: state_pred where
  \<open>P_0xb7e0_false_22 \<sigma> \<equiv> RIP \<sigma> = 0xb7e0 \<and> RAX \<sigma> = ucast (((ucast (((\<langle>31,0\<rangle>((((((ucast (((hi_imul(ucast ((RSI\<^sub>0::64 word))::64 word) (ucast ((0x7878787878787879::64 word))::64 word))::64 word))::64 word) >>> 3)::64 word) - ((ucast ((RSI\<^sub>0::64 word))::64 word) >>> 63))::64 word) + 0x3ff)::32 word)::32 word))::32 word) >> 10)) \<and> RBX \<sigma> = RSI\<^sub>0 \<and> RCX \<sigma> = ucast ((\<langle>7,0\<rangle>((ucast (((\<langle>31,0\<rangle>((((((ucast (((hi_imul(ucast ((RSI\<^sub>0::64 word))::64 word) (ucast ((0x7878787878787879::64 word))::64 word))::64 word))::64 word) >>> 3)::64 word) - ((ucast ((RSI\<^sub>0::64 word))::64 word) >>> 63))::64 word) + 0x3ff)::32 word)::32 word))::32 word) >> 10)::8 word)) \<and> RDX \<sigma> = ((((ucast (((hi_imul(ucast ((RSI\<^sub>0::64 word))::64 word) (ucast ((0x7878787878787879::64 word))::64 word))::64 word))::64 word) >>> 3)::64 word) - ((ucast ((RSI\<^sub>0::64 word))::64 word) >>> 63)) \<and> RDI \<sigma> = ucast (((ucast (((\<langle>7,0\<rangle>((ucast (((\<langle>31,0\<rangle>((((((ucast (((hi_imul(ucast ((RSI\<^sub>0::64 word))::64 word) (ucast ((0x7878787878787879::64 word))::64 word))::64 word))::64 word) >>> 3)::64 word) - ((ucast ((RSI\<^sub>0::64 word))::64 word) >>> 63))::64 word) + 0x3ff)::32 word)::32 word))::32 word) >> 10)::8 word)::8 word))::32 word) << 10)) \<and> RSI \<sigma> = 0x241 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x458) \<and> RBP \<sigma> = RBP\<^sub>0 \<and> R15 \<sigma> = ucast (((ucast (((\<langle>31,0\<rangle>((((((ucast (((hi_imul(ucast ((RSI\<^sub>0::64 word))::64 word) (ucast ((0x7878787878787879::64 word))::64 word))::64 word))::64 word) >>> 3)::64 word) - ((ucast ((RSI\<^sub>0::64 word))::64 word) >>> 63))::64 word) + 0x3ff)::32 word)::32 word))::32 word) >> 10)) \<and> R14 \<sigma> = R14\<^sub>0 \<and> R13 \<sigma> = ucast ((\<langle>31,0\<rangle>open64_0xb4a1_retval::32 word)) \<and> R12 \<sigma> = R12\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x460),8]::64 word) = 0xb4a6\<close>
declare P_0xb7e0_false_22_def[Ps]

definition P_0xb7e0_false_22_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0xb7e0_false_22_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((FS\<^sub>0::64 word) + 0x28), 8),
    (2, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x40), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x460), 8)
  }\<close>

definition P_0xb7e0_false_22_regions :: state_pred where
  \<open>P_0xb7e0_false_22_regions \<sigma> \<equiv> \<exists>regions. P_0xb7e0_false_22_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0xb80d_22 :: state_pred where
  \<open>Q_0xb80d_22 \<sigma> \<equiv> RIP \<sigma> = 0xb80d \<and> RAX \<sigma> = ((((ucast (((((hi_imul(ucast ((RSI\<^sub>0::64 word))::64 word) (ucast ((0x8421084210842109::64 word))::64 word))::64 word) + (\<langle>63,0\<rangle>((RSI\<^sub>0::64 word) * 0x1)::64 word))::64 word))::64 word) >>> 4)::64 word) - ((ucast ((RSI\<^sub>0::64 word))::64 word) >>> 63)) \<and> RBX \<sigma> = RSI\<^sub>0 \<and> RCX \<sigma> = ((ucast ((RSI\<^sub>0::64 word))::64 word) >>> 63) \<and> RDX \<sigma> = (hi_imul(ucast ((RSI\<^sub>0::64 word))::64 word) (ucast ((0x8421084210842109::64 word))::64 word)) \<and> RDI \<sigma> = ucast (((ucast (((\<langle>7,0\<rangle>((ucast (((\<langle>31,0\<rangle>((((((ucast (((hi_imul(ucast ((RSI\<^sub>0::64 word))::64 word) (ucast ((0x7878787878787879::64 word))::64 word))::64 word))::64 word) >>> 3)::64 word) - ((ucast ((RSI\<^sub>0::64 word))::64 word) >>> 63))::64 word) + 0x3ff)::32 word)::32 word))::32 word) >> 10)::8 word)::8 word))::32 word) << 10)) \<and> RSI \<sigma> = 0x241 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x458) \<and> RBP \<sigma> = RBP\<^sub>0 \<and> R15 \<sigma> = ucast (((ucast (((\<langle>31,0\<rangle>((((((ucast (((hi_imul(ucast ((RSI\<^sub>0::64 word))::64 word) (ucast ((0x7878787878787879::64 word))::64 word))::64 word))::64 word) >>> 3)::64 word) - ((ucast ((RSI\<^sub>0::64 word))::64 word) >>> 63))::64 word) + 0x3ff)::32 word)::32 word))::32 word) >> 10)) \<and> R14 \<sigma> = R14\<^sub>0 \<and> R13 \<sigma> = ucast ((\<langle>31,0\<rangle>open64_0xb4a1_retval::32 word)) \<and> R12 \<sigma> = R12\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x460),8]::64 word) = 0xb4a6\<close>
declare Q_0xb80d_22_def[Qs]

schematic_goal vpc_create_0_10_0xb7e0_0xb808_22[blocks]:
  assumes \<open>(P_0xb7e0_false_22 && P_0xb7e0_false_22_regions && ! jbe) \<sigma>\<close>
  shows \<open>exec_block 10 0xb808 22 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0xb80d_22 ?\<sigma> \<and> block_usage P_0xb7e0_false_22_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0xb7e0_false_22_def P_0xb7e0_false_22_regions_def post: Q_0xb80d_22_def regionset: P_0xb7e0_false_22_regions_set_def)

definition P_0xb80d_true_23 :: state_pred where
  \<open>P_0xb80d_true_23 \<sigma> \<equiv> RIP \<sigma> = 0xb80d \<and> RAX \<sigma> = ((((ucast (((((hi_imul(ucast ((RSI\<^sub>0::64 word))::64 word) (ucast ((0x8421084210842109::64 word))::64 word))::64 word) + (\<langle>63,0\<rangle>((RSI\<^sub>0::64 word) * 0x1)::64 word))::64 word))::64 word) >>> 4)::64 word) - ((ucast ((RSI\<^sub>0::64 word))::64 word) >>> 63)) \<and> RBX \<sigma> = RSI\<^sub>0 \<and> RCX \<sigma> = ((ucast ((RSI\<^sub>0::64 word))::64 word) >>> 63) \<and> RDX \<sigma> = (hi_imul(ucast ((RSI\<^sub>0::64 word))::64 word) (ucast ((0x8421084210842109::64 word))::64 word)) \<and> RDI \<sigma> = ucast (((ucast (((\<langle>7,0\<rangle>((ucast (((\<langle>31,0\<rangle>((((((ucast (((hi_imul(ucast ((RSI\<^sub>0::64 word))::64 word) (ucast ((0x7878787878787879::64 word))::64 word))::64 word))::64 word) >>> 3)::64 word) - ((ucast ((RSI\<^sub>0::64 word))::64 word) >>> 63))::64 word) + 0x3ff)::32 word)::32 word))::32 word) >> 10)::8 word)::8 word))::32 word) << 10)) \<and> RSI \<sigma> = 0x241 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x458) \<and> RBP \<sigma> = RBP\<^sub>0 \<and> R15 \<sigma> = ucast (((ucast (((\<langle>31,0\<rangle>((((((ucast (((hi_imul(ucast ((RSI\<^sub>0::64 word))::64 word) (ucast ((0x7878787878787879::64 word))::64 word))::64 word))::64 word) >>> 3)::64 word) - ((ucast ((RSI\<^sub>0::64 word))::64 word) >>> 63))::64 word) + 0x3ff)::32 word)::32 word))::32 word) >> 10)) \<and> R14 \<sigma> = R14\<^sub>0 \<and> R13 \<sigma> = ucast ((\<langle>31,0\<rangle>open64_0xb4a1_retval::32 word)) \<and> R12 \<sigma> = R12\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x460),8]::64 word) = 0xb4a6\<close>
declare P_0xb80d_true_23_def[Ps]

definition P_0xb80d_true_23_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0xb80d_true_23_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((FS\<^sub>0::64 word) + 0x28), 8),
    (2, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x40), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x449), Suc 0),
    (10, ((RSP\<^sub>0::64 word) - 0x460), 8)
  }\<close>

definition P_0xb80d_true_23_regions :: state_pred where
  \<open>P_0xb80d_true_23_regions \<sigma> \<equiv> \<exists>regions. P_0xb80d_true_23_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0xb526_23 :: state_pred where
  \<open>Q_0xb526_23 \<sigma> \<equiv> RIP \<sigma> = 0xb526 \<and> RSI \<sigma> = 0x241 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x458) \<and> RBP \<sigma> = RBP\<^sub>0 \<and> R13 \<sigma> = ucast ((\<langle>31,0\<rangle>open64_0xb4a1_retval::32 word)) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x460),8]::64 word) = 0xb4a6\<close>
declare Q_0xb526_23_def[Qs]

schematic_goal vpc_create_0_17_0xb80d_0xb8ef_23[blocks]:
  assumes \<open>(P_0xb80d_true_23 && P_0xb80d_true_23_regions && jbe) \<sigma>\<close>
  shows \<open>exec_block 17 0xb8ef 23 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0xb526_23 ?\<sigma> \<and> block_usage P_0xb80d_true_23_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0xb80d_true_23_def P_0xb80d_true_23_regions_def post: Q_0xb526_23_def regionset: P_0xb80d_true_23_regions_set_def)

definition P_0xb80d_false_24 :: state_pred where
  \<open>P_0xb80d_false_24 \<sigma> \<equiv> RIP \<sigma> = 0xb80d \<and> RAX \<sigma> = ((((ucast (((((hi_imul(ucast ((RSI\<^sub>0::64 word))::64 word) (ucast ((0x8421084210842109::64 word))::64 word))::64 word) + (\<langle>63,0\<rangle>((RSI\<^sub>0::64 word) * 0x1)::64 word))::64 word))::64 word) >>> 4)::64 word) - ((ucast ((RSI\<^sub>0::64 word))::64 word) >>> 63)) \<and> RBX \<sigma> = RSI\<^sub>0 \<and> RCX \<sigma> = ((ucast ((RSI\<^sub>0::64 word))::64 word) >>> 63) \<and> RDX \<sigma> = (hi_imul(ucast ((RSI\<^sub>0::64 word))::64 word) (ucast ((0x8421084210842109::64 word))::64 word)) \<and> RDI \<sigma> = ucast (((ucast (((\<langle>7,0\<rangle>((ucast (((\<langle>31,0\<rangle>((((((ucast (((hi_imul(ucast ((RSI\<^sub>0::64 word))::64 word) (ucast ((0x7878787878787879::64 word))::64 word))::64 word))::64 word) >>> 3)::64 word) - ((ucast ((RSI\<^sub>0::64 word))::64 word) >>> 63))::64 word) + 0x3ff)::32 word)::32 word))::32 word) >> 10)::8 word)::8 word))::32 word) << 10)) \<and> RSI \<sigma> = 0x241 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x458) \<and> RBP \<sigma> = RBP\<^sub>0 \<and> R15 \<sigma> = ucast (((ucast (((\<langle>31,0\<rangle>((((((ucast (((hi_imul(ucast ((RSI\<^sub>0::64 word))::64 word) (ucast ((0x7878787878787879::64 word))::64 word))::64 word))::64 word) >>> 3)::64 word) - ((ucast ((RSI\<^sub>0::64 word))::64 word) >>> 63))::64 word) + 0x3ff)::32 word)::32 word))::32 word) >> 10)) \<and> R14 \<sigma> = R14\<^sub>0 \<and> R13 \<sigma> = ucast ((\<langle>31,0\<rangle>open64_0xb4a1_retval::32 word)) \<and> R12 \<sigma> = R12\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x460),8]::64 word) = 0xb4a6\<close>
declare P_0xb80d_false_24_def[Ps]

definition P_0xb80d_false_24_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0xb80d_false_24_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((FS\<^sub>0::64 word) + 0x28), 8),
    (2, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x40), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x449), Suc 0),
    (10, ((RSP\<^sub>0::64 word) - 0x460), 8)
  }\<close>

definition P_0xb80d_false_24_regions :: state_pred where
  \<open>P_0xb80d_false_24_regions \<sigma> \<equiv> \<exists>regions. P_0xb80d_false_24_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0xb526_24 :: state_pred where
  \<open>Q_0xb526_24 \<sigma> \<equiv> RIP \<sigma> = 0xb526 \<and> RSI \<sigma> = 0x241 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x458) \<and> RBP \<sigma> = RBP\<^sub>0 \<and> R13 \<sigma> = ucast ((\<langle>31,0\<rangle>open64_0xb4a1_retval::32 word)) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x460),8]::64 word) = 0xb4a6\<close>
declare Q_0xb526_24_def[Qs]

schematic_goal vpc_create_0_23_0xb80d_0xb868_24[blocks]:
  assumes \<open>(P_0xb80d_false_24 && P_0xb80d_false_24_regions && ! jbe) \<sigma>\<close>
  shows \<open>exec_block 23 0xb868 24 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0xb526_24 ?\<sigma> \<and> block_usage P_0xb80d_false_24_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0xb80d_false_24_def P_0xb80d_false_24_regions_def post: Q_0xb526_24_def regionset: P_0xb80d_false_24_regions_set_def)

definition P_0xb4c5_false_25 :: state_pred where
  \<open>P_0xb4c5_false_25 \<sigma> \<equiv> RIP \<sigma> = 0xb4c5 \<and> RAX \<sigma> = open64_0xb4a1_retval \<and> RBX \<sigma> = RSI\<^sub>0 \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = 0x1a4 \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = 0x241 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x458) \<and> RBP \<sigma> = RBP\<^sub>0 \<and> R15 \<sigma> = R15\<^sub>0 \<and> R14 \<sigma> = R14\<^sub>0 \<and> R13 \<sigma> = ucast ((\<langle>31,0\<rangle>open64_0xb4a1_retval::32 word)) \<and> R12 \<sigma> = R12\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x460),8]::64 word) = 0xb4a6\<close>
declare P_0xb4c5_false_25_def[Ps]

definition P_0xb4c5_false_25_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0xb4c5_false_25_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((FS\<^sub>0::64 word) + 0x28), 8),
    (2, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x40), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x460), 8)
  }\<close>

definition P_0xb4c5_false_25_regions :: state_pred where
  \<open>P_0xb4c5_false_25_regions \<sigma> \<equiv> \<exists>regions. P_0xb4c5_false_25_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0xb51b_25 :: state_pred where
  \<open>Q_0xb51b_25 \<sigma> \<equiv> RIP \<sigma> = 0xb51b \<and> RAX \<sigma> = ucast (((ucast (((((\<langle>31,0\<rangle>((((ucast (((((hi_imul(ucast ((RSI\<^sub>0::64 word))::64 word) (ucast ((0x8080808080808081::64 word))::64 word))::64 word) + RSI\<^sub>0)::64 word))::64 word) >>> 7)::64 word) - ((ucast ((RSI\<^sub>0::64 word))::64 word) >>> 63))::32 word)::32 word) + 0xf)::32 word))::32 word) >> 4)) \<and> RBX \<sigma> = (ucast(fst (bv_cat ((ucast (((\<langle>31,16\<rangle>((ucast (((((\<langle>31,0\<rangle>((((ucast (((((hi_imul(ucast ((RSI\<^sub>0::64 word))::64 word) (ucast ((0x8080808080808081::64 word))::64 word))::64 word) + RSI\<^sub>0)::64 word))::64 word) >>> 7)::64 word) - ((ucast ((RSI\<^sub>0::64 word))::64 word) >>> 63))::32 word)::32 word) + 0xf)::32 word))::32 word) >> 4)::48 word)::48 word))::64 word), 48) ((ucast ((word_rotl 0x8 (ucast (((\<langle>15,0\<rangle>((ucast (((((\<langle>31,0\<rangle>((((ucast (((((hi_imul(ucast ((RSI\<^sub>0::64 word))::64 word) (ucast ((0x8080808080808081::64 word))::64 word))::64 word) + RSI\<^sub>0)::64 word))::64 word) >>> 7)::64 word) - ((ucast ((RSI\<^sub>0::64 word))::64 word) >>> 63))::32 word)::32 word) + 0xf)::32 word))::32 word) >> 4)::16 word)::16 word))::16 word)::16 word))::64 word), 16)))::64 word) \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = ((((ucast (((((hi_imul(ucast ((RSI\<^sub>0::64 word))::64 word) (ucast ((0x8080808080808081::64 word))::64 word))::64 word) + RSI\<^sub>0)::64 word))::64 word) >>> 7)::64 word) - ((ucast ((RSI\<^sub>0::64 word))::64 word) >>> 63)) \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = 0x241 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x458) \<and> RBP \<sigma> = RBP\<^sub>0 \<and> R15 \<sigma> = R15\<^sub>0 \<and> R14 \<sigma> = ((ucast ((((((ucast ((((((ucast ((((ucast (((((\<langle>31,0\<rangle>((((ucast (((((hi_imul(ucast ((RSI\<^sub>0::64 word))::64 word) (ucast ((0x8080808080808081::64 word))::64 word))::64 word) + RSI\<^sub>0)::64 word))::64 word) >>> 7)::64 word) - ((ucast ((RSI\<^sub>0::64 word))::64 word) >>> 63))::32 word)::32 word) + 0xf)::32 word))::32 word) >> 4)::32 word))::64 word) << 8)::64 word) - (ucast ((((ucast (((((\<langle>31,0\<rangle>((((ucast (((((hi_imul(ucast ((RSI\<^sub>0::64 word))::64 word) (ucast ((0x8080808080808081::64 word))::64 word))::64 word) + RSI\<^sub>0)::64 word))::64 word) >>> 7)::64 word) - ((ucast ((RSI\<^sub>0::64 word))::64 word) >>> 63))::32 word)::32 word) + 0xf)::32 word))::32 word) >> 4)::32 word))::64 word))::64 word))::64 word) << 4)::64 word) + 0x1000)::64 word))::64 word) >> 12) \<and> R13 \<sigma> = ucast ((\<langle>31,0\<rangle>open64_0xb4a1_retval::32 word)) \<and> R12 \<sigma> = (bswap ((ucast ((((ucast ((((((ucast ((((ucast (((((\<langle>31,0\<rangle>((((ucast (((((hi_imul(ucast ((RSI\<^sub>0::64 word))::64 word) (ucast ((0x8080808080808081::64 word))::64 word))::64 word) + RSI\<^sub>0)::64 word))::64 word) >>> 7)::64 word) - ((ucast ((RSI\<^sub>0::64 word))::64 word) >>> 63))::32 word)::32 word) + 0xf)::32 word))::32 word) >> 4)::32 word))::64 word) << 8)::64 word) - (ucast ((((ucast (((((\<langle>31,0\<rangle>((((ucast (((((hi_imul(ucast ((RSI\<^sub>0::64 word))::64 word) (ucast ((0x8080808080808081::64 word))::64 word))::64 word) + RSI\<^sub>0)::64 word))::64 word) >>> 7)::64 word) - ((ucast ((RSI\<^sub>0::64 word))::64 word) >>> 63))::32 word)::32 word) + 0xf)::32 word))::32 word) >> 4)::32 word))::64 word))::64 word))::64 word) << 13)::64 word))::64 word))) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x460),8]::64 word) = 0xb4a6\<close>
declare Q_0xb51b_25_def[Qs]

schematic_goal vpc_create_0_22_0xb4c5_0xb517_25[blocks]:
  assumes \<open>(P_0xb4c5_false_25 && P_0xb4c5_false_25_regions && ! jle) \<sigma>\<close>
  shows \<open>exec_block 22 0xb517 25 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0xb51b_25 ?\<sigma> \<and> block_usage P_0xb4c5_false_25_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0xb4c5_false_25_def P_0xb4c5_false_25_regions_def post: Q_0xb51b_25_def regionset: P_0xb4c5_false_25_regions_set_def)

definition P_0xb51b_26 :: state_pred where
  \<open>P_0xb51b_26 \<sigma> \<equiv> RIP \<sigma> = 0xb51b \<and> RAX \<sigma> = ucast (((ucast (((((\<langle>31,0\<rangle>((((ucast (((((hi_imul(ucast ((RSI\<^sub>0::64 word))::64 word) (ucast ((0x8080808080808081::64 word))::64 word))::64 word) + RSI\<^sub>0)::64 word))::64 word) >>> 7)::64 word) - ((ucast ((RSI\<^sub>0::64 word))::64 word) >>> 63))::32 word)::32 word) + 0xf)::32 word))::32 word) >> 4)) \<and> RBX \<sigma> = (ucast(fst (bv_cat ((ucast (((\<langle>31,16\<rangle>((ucast (((((\<langle>31,0\<rangle>((((ucast (((((hi_imul(ucast ((RSI\<^sub>0::64 word))::64 word) (ucast ((0x8080808080808081::64 word))::64 word))::64 word) + RSI\<^sub>0)::64 word))::64 word) >>> 7)::64 word) - ((ucast ((RSI\<^sub>0::64 word))::64 word) >>> 63))::32 word)::32 word) + 0xf)::32 word))::32 word) >> 4)::48 word)::48 word))::64 word), 48) ((ucast ((word_rotl 0x8 (ucast (((\<langle>15,0\<rangle>((ucast (((((\<langle>31,0\<rangle>((((ucast (((((hi_imul(ucast ((RSI\<^sub>0::64 word))::64 word) (ucast ((0x8080808080808081::64 word))::64 word))::64 word) + RSI\<^sub>0)::64 word))::64 word) >>> 7)::64 word) - ((ucast ((RSI\<^sub>0::64 word))::64 word) >>> 63))::32 word)::32 word) + 0xf)::32 word))::32 word) >> 4)::16 word)::16 word))::16 word)::16 word))::64 word), 16)))::64 word) \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = ((((ucast (((((hi_imul(ucast ((RSI\<^sub>0::64 word))::64 word) (ucast ((0x8080808080808081::64 word))::64 word))::64 word) + RSI\<^sub>0)::64 word))::64 word) >>> 7)::64 word) - ((ucast ((RSI\<^sub>0::64 word))::64 word) >>> 63)) \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = 0x241 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x458) \<and> RBP \<sigma> = RBP\<^sub>0 \<and> R15 \<sigma> = R15\<^sub>0 \<and> R14 \<sigma> = ((ucast ((((((ucast ((((((ucast ((((ucast (((((\<langle>31,0\<rangle>((((ucast (((((hi_imul(ucast ((RSI\<^sub>0::64 word))::64 word) (ucast ((0x8080808080808081::64 word))::64 word))::64 word) + RSI\<^sub>0)::64 word))::64 word) >>> 7)::64 word) - ((ucast ((RSI\<^sub>0::64 word))::64 word) >>> 63))::32 word)::32 word) + 0xf)::32 word))::32 word) >> 4)::32 word))::64 word) << 8)::64 word) - (ucast ((((ucast (((((\<langle>31,0\<rangle>((((ucast (((((hi_imul(ucast ((RSI\<^sub>0::64 word))::64 word) (ucast ((0x8080808080808081::64 word))::64 word))::64 word) + RSI\<^sub>0)::64 word))::64 word) >>> 7)::64 word) - ((ucast ((RSI\<^sub>0::64 word))::64 word) >>> 63))::32 word)::32 word) + 0xf)::32 word))::32 word) >> 4)::32 word))::64 word))::64 word))::64 word) << 4)::64 word) + 0x1000)::64 word))::64 word) >> 12) \<and> R13 \<sigma> = ucast ((\<langle>31,0\<rangle>open64_0xb4a1_retval::32 word)) \<and> R12 \<sigma> = (bswap ((ucast ((((ucast ((((((ucast ((((ucast (((((\<langle>31,0\<rangle>((((ucast (((((hi_imul(ucast ((RSI\<^sub>0::64 word))::64 word) (ucast ((0x8080808080808081::64 word))::64 word))::64 word) + RSI\<^sub>0)::64 word))::64 word) >>> 7)::64 word) - ((ucast ((RSI\<^sub>0::64 word))::64 word) >>> 63))::32 word)::32 word) + 0xf)::32 word))::32 word) >> 4)::32 word))::64 word) << 8)::64 word) - (ucast ((((ucast (((((\<langle>31,0\<rangle>((((ucast (((((hi_imul(ucast ((RSI\<^sub>0::64 word))::64 word) (ucast ((0x8080808080808081::64 word))::64 word))::64 word) + RSI\<^sub>0)::64 word))::64 word) >>> 7)::64 word) - ((ucast ((RSI\<^sub>0::64 word))::64 word) >>> 63))::32 word)::32 word) + 0xf)::32 word))::32 word) >> 4)::32 word))::64 word))::64 word))::64 word) << 13)::64 word))::64 word))) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x460),8]::64 word) = 0xb4a6\<close>
declare P_0xb51b_26_def[Ps]

definition P_0xb51b_26_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0xb51b_26_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((FS\<^sub>0::64 word) + 0x28), 8),
    (2, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x40), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x449), Suc 0),
    (10, ((RSP\<^sub>0::64 word) - 0x460), 8)
  }\<close>

definition P_0xb51b_26_regions :: state_pred where
  \<open>P_0xb51b_26_regions \<sigma> \<equiv> \<exists>regions. P_0xb51b_26_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0xb526_26 :: state_pred where
  \<open>Q_0xb526_26 \<sigma> \<equiv> RIP \<sigma> = 0xb526 \<and> RSI \<sigma> = 0x241 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x458) \<and> RBP \<sigma> = RBP\<^sub>0 \<and> R13 \<sigma> = ucast ((\<langle>31,0\<rangle>open64_0xb4a1_retval::32 word)) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x460),8]::64 word) = 0xb4a6\<close>
declare Q_0xb526_26_def[Qs]

schematic_goal vpc_create_0_2_0xb51b_0xb520_26[blocks]:
  assumes \<open>(P_0xb51b_26 && P_0xb51b_26_regions) \<sigma>\<close>
  shows \<open>exec_block 2 0xb520 26 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0xb526_26 ?\<sigma> \<and> block_usage P_0xb51b_26_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0xb51b_26_def P_0xb51b_26_regions_def post: Q_0xb526_26_def regionset: P_0xb51b_26_regions_set_def)

definition P_0xb526_27 :: state_pred where
  \<open>P_0xb526_27 \<sigma> \<equiv> RIP \<sigma> = 0xb526 \<and> RSI \<sigma> = 0x241 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x458) \<and> RBP \<sigma> = RBP\<^sub>0 \<and> R13 \<sigma> = ucast ((\<langle>31,0\<rangle>open64_0xb4a1_retval::32 word)) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x460),8]::64 word) = 0xb4a6\<close>
declare P_0xb526_27_def[Ps]

definition P_0xb526_27_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0xb526_27_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((FS\<^sub>0::64 word) + 0x28), 8),
    (2, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x40), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x460), 8)
  }\<close>

definition P_0xb526_27_regions :: state_pred where
  \<open>P_0xb526_27_regions \<sigma> \<equiv> \<exists>regions. P_0xb526_27_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0xb535_27 :: state_pred where
  \<open>Q_0xb535_27 \<sigma> \<equiv> RIP \<sigma> = 0xb535 \<and> RAX \<sigma> = 0x0 \<and> RCX \<sigma> = 0x80 \<and> RDI \<sigma> = ((RSP\<^sub>0::64 word) - 0x448) \<and> RSI \<sigma> = 0x241 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x458) \<and> RBP \<sigma> = ((RSP\<^sub>0::64 word) - 0x448) \<and> R13 \<sigma> = ucast ((\<langle>31,0\<rangle>open64_0xb4a1_retval::32 word)) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x460),8]::64 word) = 0xb4a6\<close>
declare Q_0xb535_27_def[Qs]

schematic_goal vpc_create_0_4_0xb526_0xb532_27[blocks]:
  assumes \<open>(P_0xb526_27 && P_0xb526_27_regions) \<sigma>\<close>
  shows \<open>exec_block 4 0xb532 27 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0xb535_27 ?\<sigma> \<and> block_usage P_0xb526_27_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0xb526_27_def P_0xb526_27_regions_def post: Q_0xb535_27_def regionset: P_0xb526_27_regions_set_def)

definition P_0xb535_28 :: state_pred where
  \<open>P_0xb535_28 \<sigma> \<equiv> RIP \<sigma> = 0xb535 \<and> RAX \<sigma> = 0x0 \<and> RCX \<sigma> = 0x80 \<and> RDI \<sigma> = ((RSP\<^sub>0::64 word) - 0x448) \<and> RSI \<sigma> = 0x241 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x458) \<and> RBP \<sigma> = ((RSP\<^sub>0::64 word) - 0x448) \<and> R13 \<sigma> = ucast ((\<langle>31,0\<rangle>open64_0xb4a1_retval::32 word)) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x460),8]::64 word) = 0xb4a6\<close>
declare P_0xb535_28_def[Ps]

definition P_0xb535_28_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0xb535_28_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((FS\<^sub>0::64 word) + 0x28), 8),
    (2, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x40), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x460), 8)
  }\<close>

definition P_0xb535_28_regions :: state_pred where
  \<open>P_0xb535_28_regions \<sigma> \<equiv> \<exists>regions. P_0xb535_28_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_rep_stos_ESRDI_RAX_addr_0xb535_28 :: state_pred where
  \<open>Q_rep_stos_ESRDI_RAX_addr_0xb535_28 \<sigma> \<equiv> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x460) \<and> RIP \<sigma> = rep_stos_ESRDI_RAX_addr \<and> RAX \<sigma> = 0x0 \<and> RCX \<sigma> = 0x80 \<and> RDI \<sigma> = ((RSP\<^sub>0::64 word) - 0x448) \<and> RSI \<sigma> = 0x241 \<and> RBP \<sigma> = ((RSP\<^sub>0::64 word) - 0x448) \<and> R13 \<sigma> = ucast ((\<langle>31,0\<rangle>open64_0xb4a1_retval::32 word)) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x460),8]::64 word) = 0xb538\<close>
declare Q_rep_stos_ESRDI_RAX_addr_0xb535_28_def[Qs]

schematic_goal vpc_create_0_1_0xb535_0xb535_28[blocks]:
  assumes \<open>(P_0xb535_28 && P_0xb535_28_regions) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0xb535 28 \<sigma> \<triangleq> ?\<sigma> \<and> Q_rep_stos_ESRDI_RAX_addr_0xb535_28 ?\<sigma> \<and> block_usage P_0xb535_28_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0xb535_28_def P_0xb535_28_regions_def post: Q_rep_stos_ESRDI_RAX_addr_0xb535_28_def regionset: P_0xb535_28_regions_set_def)

definition P_0xb538_29 :: state_pred where
  \<open>P_0xb538_29 \<sigma> \<equiv> RIP \<sigma> = 0xb538 \<and> RAX \<sigma> = rep_stos_ESRDI_RAX_0xb535_retval \<and> RCX \<sigma> = 0x80 \<and> RDI \<sigma> = ((RSP\<^sub>0::64 word) - 0x448) \<and> RSI \<sigma> = 0x241 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x458) \<and> RBP \<sigma> = ((RSP\<^sub>0::64 word) - 0x448) \<and> R13 \<sigma> = ucast ((\<langle>31,0\<rangle>open64_0xb4a1_retval::32 word)) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x460),8]::64 word) = 0xb538\<close>
declare P_0xb538_29_def[Ps]

definition P_0xb538_29_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0xb538_29_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((FS\<^sub>0::64 word) + 0x28), 8),
    (2, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x40), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x424), 4),
    (10, ((RSP\<^sub>0::64 word) - 0x42c), 4),
    (11, ((RSP\<^sub>0::64 word) - 0x438), 8),
    (12, ((RSP\<^sub>0::64 word) - 0x440), 8),
    (13, ((RSP\<^sub>0::64 word) - 0x448), 8),
    (14, ((RSP\<^sub>0::64 word) - 0x460), 8)
  }\<close>

definition P_0xb538_29_regions :: state_pred where
  \<open>P_0xb538_29_regions \<sigma> \<equiv> \<exists>regions. P_0xb538_29_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0xb577_29 :: state_pred where
  \<open>Q_0xb577_29 \<sigma> \<equiv> RIP \<sigma> = 0xb577 \<and> RAX \<sigma> = 0x2000000000000 \<and> RCX \<sigma> = 0x80 \<and> RDI \<sigma> = 0x0 \<and> RSI \<sigma> = 0x241 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x458) \<and> RBP \<sigma> = ((RSP\<^sub>0::64 word) - 0x448) \<and> R13 \<sigma> = ucast ((\<langle>31,0\<rangle>open64_0xb4a1_retval::32 word)) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x424),4]::32 word) = 0x6b326957 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x42c),4]::32 word) = 0x756d6571 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x438),8]::64 word) = 0x2000000000000 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x440),8]::64 word) = 0x10002000000 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x448),8]::64 word) = 0x78697463656e6f63 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x460),8]::64 word) = 0xb538\<close>
declare Q_0xb577_29_def[Qs]

schematic_goal vpc_create_0_9_0xb538_0xb572_29[blocks]:
  assumes \<open>(P_0xb538_29 && P_0xb538_29_regions) \<sigma>\<close>
  shows \<open>exec_block 9 0xb572 29 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0xb577_29 ?\<sigma> \<and> block_usage P_0xb538_29_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0xb538_29_def P_0xb538_29_regions_def post: Q_0xb577_29_def regionset: P_0xb538_29_regions_set_def)

definition P_0xb577_30 :: state_pred where
  \<open>P_0xb577_30 \<sigma> \<equiv> RIP \<sigma> = 0xb577 \<and> RAX \<sigma> = 0x2000000000000 \<and> RCX \<sigma> = 0x80 \<and> RDI \<sigma> = 0x0 \<and> RSI \<sigma> = 0x241 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x458) \<and> RBP \<sigma> = ((RSP\<^sub>0::64 word) - 0x448) \<and> R13 \<sigma> = ucast ((\<langle>31,0\<rangle>open64_0xb4a1_retval::32 word)) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x424),4]::32 word) = 0x6b326957 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x42c),4]::32 word) = 0x756d6571 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x438),8]::64 word) = 0x2000000000000 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x440),8]::64 word) = 0x10002000000 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x448),8]::64 word) = 0x78697463656e6f63 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x460),8]::64 word) = 0xb538\<close>
declare P_0xb577_30_def[Ps]

definition P_0xb577_30_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0xb577_30_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((FS\<^sub>0::64 word) + 0x28), 8),
    (2, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x40), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x424), 4),
    (10, ((RSP\<^sub>0::64 word) - 0x42c), 4),
    (11, ((RSP\<^sub>0::64 word) - 0x438), 8),
    (12, ((RSP\<^sub>0::64 word) - 0x440), 8),
    (13, ((RSP\<^sub>0::64 word) - 0x448), 8),
    (14, ((RSP\<^sub>0::64 word) - 0x460), 8)
  }\<close>

definition P_0xb577_30_regions :: state_pred where
  \<open>P_0xb577_30_regions \<sigma> \<equiv> \<exists>regions. P_0xb577_30_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_time_addr_0xb577_30 :: state_pred where
  \<open>Q_time_addr_0xb577_30 \<sigma> \<equiv> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x460) \<and> RIP \<sigma> = time_addr \<and> RAX \<sigma> = 0x2000000000000 \<and> RCX \<sigma> = 0x80 \<and> RDI \<sigma> = 0x0 \<and> RSI \<sigma> = 0x241 \<and> RBP \<sigma> = ((RSP\<^sub>0::64 word) - 0x448) \<and> R13 \<sigma> = ucast ((\<langle>31,0\<rangle>open64_0xb4a1_retval::32 word)) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x424),4]::32 word) = 0x6b326957 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x42c),4]::32 word) = 0x756d6571 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x438),8]::64 word) = 0x2000000000000 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x440),8]::64 word) = 0x10002000000 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x448),8]::64 word) = 0x78697463656e6f63 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x460),8]::64 word) = 0xb57c\<close>
declare Q_time_addr_0xb577_30_def[Qs]

schematic_goal vpc_create_0_1_0xb577_0xb577_30[blocks]:
  assumes \<open>(P_0xb577_30 && P_0xb577_30_regions) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0xb577 30 \<sigma> \<triangleq> ?\<sigma> \<and> Q_time_addr_0xb577_30 ?\<sigma> \<and> block_usage P_0xb577_30_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0xb577_30_def P_0xb577_30_regions_def post: Q_time_addr_0xb577_30_def regionset: P_0xb577_30_regions_set_def)

definition P_0xb57c_31 :: state_pred where
  \<open>P_0xb57c_31 \<sigma> \<equiv> RIP \<sigma> = 0xb57c \<and> RAX \<sigma> = time_0xb577_retval \<and> RCX \<sigma> = 0x80 \<and> RDI \<sigma> = 0x0 \<and> RSI \<sigma> = 0x241 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x458) \<and> RBP \<sigma> = ((RSP\<^sub>0::64 word) - 0x448) \<and> R13 \<sigma> = ucast ((\<langle>31,0\<rangle>open64_0xb4a1_retval::32 word)) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x424),4]::32 word) = 0x6b326957 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x42c),4]::32 word) = 0x756d6571 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x438),8]::64 word) = 0x2000000000000 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x440),8]::64 word) = 0x10002000000 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x448),8]::64 word) = 0x78697463656e6f63 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x460),8]::64 word) = 0xb57c\<close>
declare P_0xb57c_31_def[Ps]

definition P_0xb57c_31_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0xb57c_31_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((FS\<^sub>0::64 word) + 0x28), 8),
    (2, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x40), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x40c), 4),
    (10, ((RSP\<^sub>0::64 word) - 0x40d), Suc 0),
    (11, ((RSP\<^sub>0::64 word) - 0x40e), Suc 0),
    (12, ((RSP\<^sub>0::64 word) - 0x410), 2),
    (13, ((RSP\<^sub>0::64 word) - 0x418), 8),
    (14, ((RSP\<^sub>0::64 word) - 0x420), 8),
    (15, ((RSP\<^sub>0::64 word) - 0x424), 4),
    (16, ((RSP\<^sub>0::64 word) - 0x428), 4),
    (17, ((RSP\<^sub>0::64 word) - 0x42c), 4),
    (18, ((RSP\<^sub>0::64 word) - 0x430), 4),
    (19, ((RSP\<^sub>0::64 word) - 0x438), 8),
    (20, ((RSP\<^sub>0::64 word) - 0x440), 8),
    (21, ((RSP\<^sub>0::64 word) - 0x448), 8),
    (22, ((RSP\<^sub>0::64 word) - 0x449), Suc 0),
    (23, ((RSP\<^sub>0::64 word) - 0x460), 8)
  }\<close>

definition P_0xb57c_31_regions :: state_pred where
  \<open>P_0xb57c_31_regions \<sigma> \<equiv> \<exists>regions. P_0xb57c_31_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0xb5c8_31 :: state_pred where
  \<open>Q_0xb5c8_31 \<sigma> \<equiv> RIP \<sigma> = 0xb5c8 \<and> RDI \<sigma> = 0x0 \<and> RSI \<sigma> = ((RSP\<^sub>0::64 word) - 0x248) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x458) \<and> RBP \<sigma> = ((RSP\<^sub>0::64 word) - 0x448) \<and> R13 \<sigma> = ucast ((\<langle>31,0\<rangle>open64_0xb4a1_retval::32 word)) \<and> R12 \<sigma> = ((RSP\<^sub>0::64 word) - 0x448) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40c),4]::32 word) = 0x3000000 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40d),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x449),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40e),1]::8 word) = ucast ((\<langle>7,0\<rangle>R15 \<sigma>::8 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x410),2]::16 word) = ucast ((\<langle>15,0\<rangle>RBX \<sigma>::16 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x424),4]::32 word) = 0x6b326957 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x428),4]::32 word) = 0x3000500 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x42c),4]::32 word) = 0x756d6571 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x438),8]::64 word) = 0x2000000000000 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x440),8]::64 word) = 0x10002000000 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x448),8]::64 word) = 0x78697463656e6f63 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x449),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x449),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x460),8]::64 word) = 0xb57c\<close>
declare Q_0xb5c8_31_def[Qs]

schematic_goal vpc_create_0_16_0xb57c_0xb5c3_31[blocks]:
  assumes \<open>(P_0xb57c_31 && P_0xb57c_31_regions) \<sigma>\<close>
  shows \<open>exec_block 16 0xb5c3 31 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0xb5c8_31 ?\<sigma> \<and> block_usage P_0xb57c_31_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0xb57c_31_def P_0xb57c_31_regions_def post: Q_0xb5c8_31_def regionset: P_0xb57c_31_regions_set_def)

definition P_0xb5c8_32 :: state_pred where
  \<open>P_0xb5c8_32 \<sigma> \<equiv> RIP \<sigma> = 0xb5c8 \<and> RDI \<sigma> = 0x0 \<and> RSI \<sigma> = ((RSP\<^sub>0::64 word) - 0x248) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x458) \<and> RBP \<sigma> = ((RSP\<^sub>0::64 word) - 0x448) \<and> R13 \<sigma> = ucast ((\<langle>31,0\<rangle>open64_0xb4a1_retval::32 word)) \<and> R12 \<sigma> = ((RSP\<^sub>0::64 word) - 0x448) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40c),4]::32 word) = 0x3000000 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40d),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x449),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40e),1]::8 word) = ucast ((\<langle>7,0\<rangle>R15 \<sigma>::8 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x410),2]::16 word) = ucast ((\<langle>15,0\<rangle>RBX \<sigma>::16 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x424),4]::32 word) = 0x6b326957 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x428),4]::32 word) = 0x3000500 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x42c),4]::32 word) = 0x756d6571 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x438),8]::64 word) = 0x2000000000000 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x440),8]::64 word) = 0x10002000000 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x448),8]::64 word) = 0x78697463656e6f63 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x449),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x449),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x460),8]::64 word) = 0xb57c\<close>
declare P_0xb5c8_32_def[Ps]

definition P_0xb5c8_32_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0xb5c8_32_regions_set \<sigma> \<equiv> {
    (0, RAX \<sigma>, Suc 0),
    (1, RSP\<^sub>0, 8),
    (2, ((FS\<^sub>0::64 word) + 0x28), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x40), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x40c), 4),
    (11, ((RSP\<^sub>0::64 word) - 0x40d), Suc 0),
    (12, ((RSP\<^sub>0::64 word) - 0x40e), Suc 0),
    (13, ((RSP\<^sub>0::64 word) - 0x410), 2),
    (14, ((RSP\<^sub>0::64 word) - 0x424), 4),
    (15, ((RSP\<^sub>0::64 word) - 0x428), 4),
    (16, ((RSP\<^sub>0::64 word) - 0x42c), 4),
    (17, ((RSP\<^sub>0::64 word) - 0x438), 8),
    (18, ((RSP\<^sub>0::64 word) - 0x440), 8),
    (19, ((RSP\<^sub>0::64 word) - 0x448), 8),
    (20, ((RSP\<^sub>0::64 word) - 0x449), Suc 0),
    (21, ((RSP\<^sub>0::64 word) - 0x460), 8)
  }\<close>

definition P_0xb5c8_32_regions :: state_pred where
  \<open>P_0xb5c8_32_regions \<sigma> \<equiv> \<exists>regions. P_0xb5c8_32_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0xb5d4_32 :: state_pred where
  \<open>Q_0xb5d4_32 \<sigma> \<equiv> RIP \<sigma> = 0xb5d4 \<and> RDI \<sigma> = 0x0 \<and> RSI \<sigma> = ((RSP\<^sub>0::64 word) - 0x248) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x458) \<and> RBP \<sigma> = ((RSP\<^sub>0::64 word) - 0x448) \<and> R13 \<sigma> = ucast ((\<langle>31,0\<rangle>open64_0xb4a1_retval::32 word)) \<and> R12 \<sigma> = ((RSP\<^sub>0::64 word) - 0x448) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40c),4]::32 word) = 0x3000000 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40d),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x449),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40e),1]::8 word) = ucast ((\<langle>7,0\<rangle>R15 \<sigma>::8 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x410),2]::16 word) = ucast ((\<langle>15,0\<rangle>RBX \<sigma>::16 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x424),4]::32 word) = 0x6b326957 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x428),4]::32 word) = 0x3000500 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x42c),4]::32 word) = 0x756d6571 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x438),8]::64 word) = 0x2000000000000 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x440),8]::64 word) = 0x10002000000 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x448),8]::64 word) = 0x78697463656e6f63 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x449),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x449),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x460),8]::64 word) = 0xb57c\<close>
declare Q_0xb5d4_32_def[Qs]

schematic_goal vpc_create_0_4_0xb5c8_0xb5d1_32[blocks]:
  assumes \<open>(P_0xb5c8_32 && P_0xb5c8_32_regions) \<sigma>\<close>
  shows \<open>exec_block 4 0xb5d1 32 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0xb5d4_32 ?\<sigma> \<and> block_usage P_0xb5c8_32_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0xb5c8_32_def P_0xb5c8_32_regions_def post: Q_0xb5d4_32_def regionset: P_0xb5c8_32_regions_set_def)

definition P_0xb5d4_true_33 :: state_pred where
  \<open>P_0xb5d4_true_33 \<sigma> \<equiv> RIP \<sigma> = 0xb5d4 \<and> RDI \<sigma> = 0x0 \<and> RSI \<sigma> = ((RSP\<^sub>0::64 word) - 0x248) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x458) \<and> RBP \<sigma> = ((RSP\<^sub>0::64 word) - 0x448) \<and> R13 \<sigma> = ucast ((\<langle>31,0\<rangle>open64_0xb4a1_retval::32 word)) \<and> R12 \<sigma> = ((RSP\<^sub>0::64 word) - 0x448) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40c),4]::32 word) = 0x3000000 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40d),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x449),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40e),1]::8 word) = ucast ((\<langle>7,0\<rangle>R15 \<sigma>::8 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x410),2]::16 word) = ucast ((\<langle>15,0\<rangle>RBX \<sigma>::16 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x424),4]::32 word) = 0x6b326957 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x428),4]::32 word) = 0x3000500 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x42c),4]::32 word) = 0x756d6571 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x438),8]::64 word) = 0x2000000000000 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x440),8]::64 word) = 0x10002000000 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x448),8]::64 word) = 0x78697463656e6f63 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x449),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x449),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x460),8]::64 word) = 0xb57c\<close>
declare P_0xb5d4_true_33_def[Ps]

definition P_0xb5d4_true_33_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0xb5d4_true_33_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((FS\<^sub>0::64 word) + 0x28), 8),
    (2, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x40), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x40c), 4),
    (10, ((RSP\<^sub>0::64 word) - 0x40d), Suc 0),
    (11, ((RSP\<^sub>0::64 word) - 0x40e), Suc 0),
    (12, ((RSP\<^sub>0::64 word) - 0x410), 2),
    (13, ((RSP\<^sub>0::64 word) - 0x424), 4),
    (14, ((RSP\<^sub>0::64 word) - 0x428), 4),
    (15, ((RSP\<^sub>0::64 word) - 0x42c), 4),
    (16, ((RSP\<^sub>0::64 word) - 0x438), 8),
    (17, ((RSP\<^sub>0::64 word) - 0x440), 8),
    (18, ((RSP\<^sub>0::64 word) - 0x448), 8),
    (19, ((RSP\<^sub>0::64 word) - 0x449), Suc 0),
    (20, ((RSP\<^sub>0::64 word) - 0x460), 8)
  }\<close>

definition P_0xb5d4_true_33_regions :: state_pred where
  \<open>P_0xb5d4_true_33_regions \<sigma> \<equiv> \<exists>regions. P_0xb5d4_true_33_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0xb5c8_33 :: state_pred where
  \<open>Q_0xb5c8_33 \<sigma> \<equiv> RIP \<sigma> = 0xb5c8 \<and> RDI \<sigma> = 0x0 \<and> RSI \<sigma> = ((RSP\<^sub>0::64 word) - 0x248) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x458) \<and> RBP \<sigma> = ((RSP\<^sub>0::64 word) - 0x448) \<and> R13 \<sigma> = ucast ((\<langle>31,0\<rangle>open64_0xb4a1_retval::32 word)) \<and> R12 \<sigma> = ((RSP\<^sub>0::64 word) - 0x448) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40c),4]::32 word) = 0x3000000 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40d),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x449),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40e),1]::8 word) = ucast ((\<langle>7,0\<rangle>R15 \<sigma>::8 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x410),2]::16 word) = ucast ((\<langle>15,0\<rangle>RBX \<sigma>::16 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x424),4]::32 word) = 0x6b326957 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x428),4]::32 word) = 0x3000500 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x42c),4]::32 word) = 0x756d6571 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x438),8]::64 word) = 0x2000000000000 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x440),8]::64 word) = 0x10002000000 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x448),8]::64 word) = 0x78697463656e6f63 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x449),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x449),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x460),8]::64 word) = 0xb57c\<close>
declare Q_0xb5c8_33_def[Qs]

schematic_goal vpc_create_0_1_0xb5d4_0xb5d4_33[blocks]:
  assumes \<open>(P_0xb5d4_true_33 && P_0xb5d4_true_33_regions && !ZF) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0xb5d4 33 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0xb5c8_33 ?\<sigma> \<and> block_usage P_0xb5d4_true_33_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0xb5d4_true_33_def P_0xb5d4_true_33_regions_def post: Q_0xb5c8_33_def regionset: P_0xb5d4_true_33_regions_set_def)

definition P_0xb5d4_false_34 :: state_pred where
  \<open>P_0xb5d4_false_34 \<sigma> \<equiv> RIP \<sigma> = 0xb5d4 \<and> RDI \<sigma> = 0x0 \<and> RSI \<sigma> = ((RSP\<^sub>0::64 word) - 0x248) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x458) \<and> RBP \<sigma> = ((RSP\<^sub>0::64 word) - 0x448) \<and> R13 \<sigma> = ucast ((\<langle>31,0\<rangle>open64_0xb4a1_retval::32 word)) \<and> R12 \<sigma> = ((RSP\<^sub>0::64 word) - 0x448) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40c),4]::32 word) = 0x3000000 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40d),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x449),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40e),1]::8 word) = ucast ((\<langle>7,0\<rangle>R15 \<sigma>::8 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x410),2]::16 word) = ucast ((\<langle>15,0\<rangle>RBX \<sigma>::16 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x424),4]::32 word) = 0x6b326957 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x428),4]::32 word) = 0x3000500 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x42c),4]::32 word) = 0x756d6571 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x438),8]::64 word) = 0x2000000000000 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x440),8]::64 word) = 0x10002000000 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x448),8]::64 word) = 0x78697463656e6f63 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x449),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x449),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x460),8]::64 word) = 0xb57c\<close>
declare P_0xb5d4_false_34_def[Ps]

definition P_0xb5d4_false_34_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0xb5d4_false_34_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((FS\<^sub>0::64 word) + 0x28), 8),
    (2, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x40), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x40c), 4),
    (10, ((RSP\<^sub>0::64 word) - 0x40d), Suc 0),
    (11, ((RSP\<^sub>0::64 word) - 0x40e), Suc 0),
    (12, ((RSP\<^sub>0::64 word) - 0x410), 2),
    (13, ((RSP\<^sub>0::64 word) - 0x424), 4),
    (14, ((RSP\<^sub>0::64 word) - 0x428), 4),
    (15, ((RSP\<^sub>0::64 word) - 0x42c), 4),
    (16, ((RSP\<^sub>0::64 word) - 0x438), 8),
    (17, ((RSP\<^sub>0::64 word) - 0x440), 8),
    (18, ((RSP\<^sub>0::64 word) - 0x448), 8),
    (19, ((RSP\<^sub>0::64 word) - 0x449), Suc 0),
    (20, ((RSP\<^sub>0::64 word) - 0x460), 8)
  }\<close>

definition P_0xb5d4_false_34_regions :: state_pred where
  \<open>P_0xb5d4_false_34_regions \<sigma> \<equiv> \<exists>regions. P_0xb5d4_false_34_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0xb5d6_34 :: state_pred where
  \<open>Q_0xb5d6_34 \<sigma> \<equiv> RIP \<sigma> = 0xb5d6 \<and> RDI \<sigma> = 0x0 \<and> RSI \<sigma> = ((RSP\<^sub>0::64 word) - 0x248) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x458) \<and> RBP \<sigma> = ((RSP\<^sub>0::64 word) - 0x448) \<and> R13 \<sigma> = ucast ((\<langle>31,0\<rangle>open64_0xb4a1_retval::32 word)) \<and> R12 \<sigma> = ((RSP\<^sub>0::64 word) - 0x448) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40c),4]::32 word) = 0x3000000 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40d),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x449),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40e),1]::8 word) = ucast ((\<langle>7,0\<rangle>R15 \<sigma>::8 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x410),2]::16 word) = ucast ((\<langle>15,0\<rangle>RBX \<sigma>::16 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x424),4]::32 word) = 0x6b326957 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x428),4]::32 word) = 0x3000500 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x42c),4]::32 word) = 0x756d6571 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x438),8]::64 word) = 0x2000000000000 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x440),8]::64 word) = 0x10002000000 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x448),8]::64 word) = 0x78697463656e6f63 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x449),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x449),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x460),8]::64 word) = 0xb57c\<close>
declare Q_0xb5d6_34_def[Qs]

schematic_goal vpc_create_0_1_0xb5d4_0xb5d4_34[blocks]:
  assumes \<open>(P_0xb5d4_false_34 && P_0xb5d4_false_34_regions && ! !ZF) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0xb5d4 34 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0xb5d6_34 ?\<sigma> \<and> block_usage P_0xb5d4_false_34_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0xb5d4_false_34_def P_0xb5d4_false_34_regions_def post: Q_0xb5d6_34_def regionset: P_0xb5d4_false_34_regions_set_def)

definition P_0xb5d6_35 :: state_pred where
  \<open>P_0xb5d6_35 \<sigma> \<equiv> RIP \<sigma> = 0xb5d6 \<and> RDI \<sigma> = 0x0 \<and> RSI \<sigma> = ((RSP\<^sub>0::64 word) - 0x248) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x458) \<and> RBP \<sigma> = ((RSP\<^sub>0::64 word) - 0x448) \<and> R13 \<sigma> = ucast ((\<langle>31,0\<rangle>open64_0xb4a1_retval::32 word)) \<and> R12 \<sigma> = ((RSP\<^sub>0::64 word) - 0x448) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40c),4]::32 word) = 0x3000000 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40d),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x449),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40e),1]::8 word) = ucast ((\<langle>7,0\<rangle>R15 \<sigma>::8 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x410),2]::16 word) = ucast ((\<langle>15,0\<rangle>RBX \<sigma>::16 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x424),4]::32 word) = 0x6b326957 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x428),4]::32 word) = 0x3000500 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x42c),4]::32 word) = 0x756d6571 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x438),8]::64 word) = 0x2000000000000 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x440),8]::64 word) = 0x10002000000 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x448),8]::64 word) = 0x78697463656e6f63 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x449),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x449),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x460),8]::64 word) = 0xb57c\<close>
declare P_0xb5d6_35_def[Ps]

definition P_0xb5d6_35_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0xb5d6_35_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((FS\<^sub>0::64 word) + 0x28), 8),
    (2, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x40), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x408), 4),
    (10, ((RSP\<^sub>0::64 word) - 0x40c), 4),
    (11, ((RSP\<^sub>0::64 word) - 0x40d), Suc 0),
    (12, ((RSP\<^sub>0::64 word) - 0x40e), Suc 0),
    (13, ((RSP\<^sub>0::64 word) - 0x410), 2),
    (14, ((RSP\<^sub>0::64 word) - 0x424), 4),
    (15, ((RSP\<^sub>0::64 word) - 0x428), 4),
    (16, ((RSP\<^sub>0::64 word) - 0x42c), 4),
    (17, ((RSP\<^sub>0::64 word) - 0x438), 8),
    (18, ((RSP\<^sub>0::64 word) - 0x440), 8),
    (19, ((RSP\<^sub>0::64 word) - 0x448), 8),
    (20, ((RSP\<^sub>0::64 word) - 0x449), Suc 0),
    (21, ((RSP\<^sub>0::64 word) - 0x460), 8)
  }\<close>

definition P_0xb5d6_35_regions :: state_pred where
  \<open>P_0xb5d6_35_regions \<sigma> \<equiv> \<exists>regions. P_0xb5d6_35_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0xb5e9_35 :: state_pred where
  \<open>Q_0xb5e9_35 \<sigma> \<equiv> RIP \<sigma> = 0xb5e9 \<and> RDX \<sigma> = 0x200 \<and> RDI \<sigma> = ucast ((\<langle>31,0\<rangle>open64_0xb4a1_retval::32 word)) \<and> RSI \<sigma> = ((RSP\<^sub>0::64 word) - 0x448) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x458) \<and> RBP \<sigma> = ((RSP\<^sub>0::64 word) - 0x448) \<and> R13 \<sigma> = ucast ((\<langle>31,0\<rangle>open64_0xb4a1_retval::32 word)) \<and> R12 \<sigma> = ((RSP\<^sub>0::64 word) - 0x448) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40c),4]::32 word) = 0x3000000 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40d),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x449),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40e),1]::8 word) = ucast ((\<langle>7,0\<rangle>R15 \<sigma>::8 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x410),2]::16 word) = ucast ((\<langle>15,0\<rangle>RBX \<sigma>::16 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x424),4]::32 word) = 0x6b326957 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x428),4]::32 word) = 0x3000500 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x42c),4]::32 word) = 0x756d6571 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x438),8]::64 word) = 0x2000000000000 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x440),8]::64 word) = 0x10002000000 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x448),8]::64 word) = 0x78697463656e6f63 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x449),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x449),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x460),8]::64 word) = 0xb57c\<close>
declare Q_0xb5e9_35_def[Qs]

schematic_goal vpc_create_0_6_0xb5d6_0xb5e4_35[blocks]:
  assumes \<open>(P_0xb5d6_35 && P_0xb5d6_35_regions) \<sigma>\<close>
  shows \<open>exec_block 6 0xb5e4 35 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0xb5e9_35 ?\<sigma> \<and> block_usage P_0xb5d6_35_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0xb5d6_35_def P_0xb5d6_35_regions_def post: Q_0xb5e9_35_def regionset: P_0xb5d6_35_regions_set_def)

definition P_0xb5e9_36 :: state_pred where
  \<open>P_0xb5e9_36 \<sigma> \<equiv> RIP \<sigma> = 0xb5e9 \<and> RDX \<sigma> = 0x200 \<and> RDI \<sigma> = ucast ((\<langle>31,0\<rangle>open64_0xb4a1_retval::32 word)) \<and> RSI \<sigma> = ((RSP\<^sub>0::64 word) - 0x448) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x458) \<and> RBP \<sigma> = ((RSP\<^sub>0::64 word) - 0x448) \<and> R13 \<sigma> = ucast ((\<langle>31,0\<rangle>open64_0xb4a1_retval::32 word)) \<and> R12 \<sigma> = ((RSP\<^sub>0::64 word) - 0x448) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40c),4]::32 word) = 0x3000000 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40d),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x449),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40e),1]::8 word) = ucast ((\<langle>7,0\<rangle>R15 \<sigma>::8 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x410),2]::16 word) = ucast ((\<langle>15,0\<rangle>RBX \<sigma>::16 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x424),4]::32 word) = 0x6b326957 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x428),4]::32 word) = 0x3000500 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x42c),4]::32 word) = 0x756d6571 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x438),8]::64 word) = 0x2000000000000 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x440),8]::64 word) = 0x10002000000 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x448),8]::64 word) = 0x78697463656e6f63 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x449),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x449),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x460),8]::64 word) = 0xb57c\<close>
declare P_0xb5e9_36_def[Ps]

definition P_0xb5e9_36_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0xb5e9_36_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((FS\<^sub>0::64 word) + 0x28), 8),
    (2, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x40), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x40c), 4),
    (10, ((RSP\<^sub>0::64 word) - 0x40d), Suc 0),
    (11, ((RSP\<^sub>0::64 word) - 0x40e), Suc 0),
    (12, ((RSP\<^sub>0::64 word) - 0x410), 2),
    (13, ((RSP\<^sub>0::64 word) - 0x424), 4),
    (14, ((RSP\<^sub>0::64 word) - 0x428), 4),
    (15, ((RSP\<^sub>0::64 word) - 0x42c), 4),
    (16, ((RSP\<^sub>0::64 word) - 0x438), 8),
    (17, ((RSP\<^sub>0::64 word) - 0x440), 8),
    (18, ((RSP\<^sub>0::64 word) - 0x448), 8),
    (19, ((RSP\<^sub>0::64 word) - 0x449), Suc 0),
    (20, ((RSP\<^sub>0::64 word) - 0x460), 8)
  }\<close>

definition P_0xb5e9_36_regions :: state_pred where
  \<open>P_0xb5e9_36_regions \<sigma> \<equiv> \<exists>regions. P_0xb5e9_36_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_write_addr_0xb5e9_36 :: state_pred where
  \<open>Q_write_addr_0xb5e9_36 \<sigma> \<equiv> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x460) \<and> RIP \<sigma> = write_addr \<and> RDX \<sigma> = 0x200 \<and> RDI \<sigma> = ucast ((\<langle>31,0\<rangle>open64_0xb4a1_retval::32 word)) \<and> RSI \<sigma> = ((RSP\<^sub>0::64 word) - 0x448) \<and> RBP \<sigma> = ((RSP\<^sub>0::64 word) - 0x448) \<and> R13 \<sigma> = ucast ((\<langle>31,0\<rangle>open64_0xb4a1_retval::32 word)) \<and> R12 \<sigma> = ((RSP\<^sub>0::64 word) - 0x448) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40c),4]::32 word) = 0x3000000 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40d),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x449),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40e),1]::8 word) = ucast ((\<langle>7,0\<rangle>R15 \<sigma>::8 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x410),2]::16 word) = ucast ((\<langle>15,0\<rangle>RBX \<sigma>::16 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x424),4]::32 word) = 0x6b326957 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x428),4]::32 word) = 0x3000500 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x42c),4]::32 word) = 0x756d6571 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x438),8]::64 word) = 0x2000000000000 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x440),8]::64 word) = 0x10002000000 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x448),8]::64 word) = 0x78697463656e6f63 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x449),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x449),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x460),8]::64 word) = 0xb5ee\<close>
declare Q_write_addr_0xb5e9_36_def[Qs]

schematic_goal vpc_create_0_1_0xb5e9_0xb5e9_36[blocks]:
  assumes \<open>(P_0xb5e9_36 && P_0xb5e9_36_regions) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0xb5e9 36 \<sigma> \<triangleq> ?\<sigma> \<and> Q_write_addr_0xb5e9_36 ?\<sigma> \<and> block_usage P_0xb5e9_36_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0xb5e9_36_def P_0xb5e9_36_regions_def post: Q_write_addr_0xb5e9_36_def regionset: P_0xb5e9_36_regions_set_def)

definition P_0xb5ee_37 :: state_pred where
  \<open>P_0xb5ee_37 \<sigma> \<equiv> RIP \<sigma> = 0xb5ee \<and> RDX \<sigma> = 0x200 \<and> RDI \<sigma> = ucast ((\<langle>31,0\<rangle>open64_0xb4a1_retval::32 word)) \<and> RSI \<sigma> = ((RSP\<^sub>0::64 word) - 0x448) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x458) \<and> RBP \<sigma> = ((RSP\<^sub>0::64 word) - 0x448) \<and> R13 \<sigma> = ucast ((\<langle>31,0\<rangle>open64_0xb4a1_retval::32 word)) \<and> R12 \<sigma> = ((RSP\<^sub>0::64 word) - 0x448) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40c),4]::32 word) = 0x3000000 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40d),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x449),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40e),1]::8 word) = ucast ((\<langle>7,0\<rangle>R15 \<sigma>::8 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x410),2]::16 word) = ucast ((\<langle>15,0\<rangle>RBX \<sigma>::16 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x424),4]::32 word) = 0x6b326957 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x428),4]::32 word) = 0x3000500 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x42c),4]::32 word) = 0x756d6571 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x438),8]::64 word) = 0x2000000000000 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x440),8]::64 word) = 0x10002000000 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x448),8]::64 word) = 0x78697463656e6f63 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x449),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x449),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x460),8]::64 word) = 0xb5ee\<close>
declare P_0xb5ee_37_def[Ps]

definition P_0xb5ee_37_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0xb5ee_37_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((FS\<^sub>0::64 word) + 0x28), 8),
    (2, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x40), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x40c), 4),
    (10, ((RSP\<^sub>0::64 word) - 0x40d), Suc 0),
    (11, ((RSP\<^sub>0::64 word) - 0x40e), Suc 0),
    (12, ((RSP\<^sub>0::64 word) - 0x410), 2),
    (13, ((RSP\<^sub>0::64 word) - 0x424), 4),
    (14, ((RSP\<^sub>0::64 word) - 0x428), 4),
    (15, ((RSP\<^sub>0::64 word) - 0x42c), 4),
    (16, ((RSP\<^sub>0::64 word) - 0x438), 8),
    (17, ((RSP\<^sub>0::64 word) - 0x440), 8),
    (18, ((RSP\<^sub>0::64 word) - 0x448), 8),
    (19, ((RSP\<^sub>0::64 word) - 0x449), Suc 0),
    (20, ((RSP\<^sub>0::64 word) - 0x460), 8)
  }\<close>

definition P_0xb5ee_37_regions :: state_pred where
  \<open>P_0xb5ee_37_regions \<sigma> \<equiv> \<exists>regions. P_0xb5ee_37_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0xb5f4_37 :: state_pred where
  \<open>Q_0xb5f4_37 \<sigma> \<equiv> RIP \<sigma> = 0xb5f4 \<and> RDX \<sigma> = 0x200 \<and> RDI \<sigma> = ucast ((\<langle>31,0\<rangle>open64_0xb4a1_retval::32 word)) \<and> RSI \<sigma> = ((RSP\<^sub>0::64 word) - 0x448) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x458) \<and> RBP \<sigma> = ((RSP\<^sub>0::64 word) - 0x448) \<and> R13 \<sigma> = ucast ((\<langle>31,0\<rangle>open64_0xb4a1_retval::32 word)) \<and> R12 \<sigma> = ((RSP\<^sub>0::64 word) - 0x448) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40c),4]::32 word) = 0x3000000 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40d),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x449),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40e),1]::8 word) = ucast ((\<langle>7,0\<rangle>R15 \<sigma>::8 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x410),2]::16 word) = ucast ((\<langle>15,0\<rangle>RBX \<sigma>::16 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x424),4]::32 word) = 0x6b326957 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x428),4]::32 word) = 0x3000500 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x42c),4]::32 word) = 0x756d6571 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x438),8]::64 word) = 0x2000000000000 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x440),8]::64 word) = 0x10002000000 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x448),8]::64 word) = 0x78697463656e6f63 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x449),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x449),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x460),8]::64 word) = 0xb5ee\<close>
declare Q_0xb5f4_37_def[Qs]

schematic_goal vpc_create_0_1_0xb5ee_0xb5ee_37[blocks]:
  assumes \<open>(P_0xb5ee_37 && P_0xb5ee_37_regions) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0xb5ee 37 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0xb5f4_37 ?\<sigma> \<and> block_usage P_0xb5ee_37_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0xb5ee_37_def P_0xb5ee_37_regions_def post: Q_0xb5f4_37_def regionset: P_0xb5ee_37_regions_set_def)

definition P_0xb5f4_true_38 :: state_pred where
  \<open>P_0xb5f4_true_38 \<sigma> \<equiv> RIP \<sigma> = 0xb5f4 \<and> RDX \<sigma> = 0x200 \<and> RDI \<sigma> = ucast ((\<langle>31,0\<rangle>open64_0xb4a1_retval::32 word)) \<and> RSI \<sigma> = ((RSP\<^sub>0::64 word) - 0x448) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x458) \<and> RBP \<sigma> = ((RSP\<^sub>0::64 word) - 0x448) \<and> R13 \<sigma> = ucast ((\<langle>31,0\<rangle>open64_0xb4a1_retval::32 word)) \<and> R12 \<sigma> = ((RSP\<^sub>0::64 word) - 0x448) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40c),4]::32 word) = 0x3000000 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40d),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x449),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40e),1]::8 word) = ucast ((\<langle>7,0\<rangle>R15 \<sigma>::8 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x410),2]::16 word) = ucast ((\<langle>15,0\<rangle>RBX \<sigma>::16 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x424),4]::32 word) = 0x6b326957 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x428),4]::32 word) = 0x3000500 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x42c),4]::32 word) = 0x756d6571 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x438),8]::64 word) = 0x2000000000000 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x440),8]::64 word) = 0x10002000000 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x448),8]::64 word) = 0x78697463656e6f63 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x449),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x449),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x460),8]::64 word) = 0xb5ee\<close>
declare P_0xb5f4_true_38_def[Ps]

definition P_0xb5f4_true_38_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0xb5f4_true_38_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((FS\<^sub>0::64 word) + 0x28), 8),
    (2, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x40), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x40c), 4),
    (10, ((RSP\<^sub>0::64 word) - 0x40d), Suc 0),
    (11, ((RSP\<^sub>0::64 word) - 0x40e), Suc 0),
    (12, ((RSP\<^sub>0::64 word) - 0x410), 2),
    (13, ((RSP\<^sub>0::64 word) - 0x424), 4),
    (14, ((RSP\<^sub>0::64 word) - 0x428), 4),
    (15, ((RSP\<^sub>0::64 word) - 0x42c), 4),
    (16, ((RSP\<^sub>0::64 word) - 0x438), 8),
    (17, ((RSP\<^sub>0::64 word) - 0x440), 8),
    (18, ((RSP\<^sub>0::64 word) - 0x448), 8),
    (19, ((RSP\<^sub>0::64 word) - 0x449), Suc 0),
    (20, ((RSP\<^sub>0::64 word) - 0x460), 8)
  }\<close>

definition P_0xb5f4_true_38_regions :: state_pred where
  \<open>P_0xb5f4_true_38_regions \<sigma> \<equiv> \<exists>regions. P_0xb5f4_true_38_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0xb695_38 :: state_pred where
  \<open>Q_0xb695_38 \<sigma> \<equiv> RIP \<sigma> = 0xb695 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x458) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word)\<close>
declare Q_0xb695_38_def[Qs]

schematic_goal vpc_create_0_2_0xb5f4_0xb690_38[blocks]:
  assumes \<open>(P_0xb5f4_true_38 && P_0xb5f4_true_38_regions && !ZF) \<sigma>\<close>
  shows \<open>exec_block 2 0xb690 38 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0xb695_38 ?\<sigma> \<and> block_usage P_0xb5f4_true_38_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0xb5f4_true_38_def P_0xb5f4_true_38_regions_def post: Q_0xb695_38_def regionset: P_0xb5f4_true_38_regions_set_def)

definition P_0xb5f4_false_39 :: state_pred where
  \<open>P_0xb5f4_false_39 \<sigma> \<equiv> RIP \<sigma> = 0xb5f4 \<and> RDX \<sigma> = 0x200 \<and> RDI \<sigma> = ucast ((\<langle>31,0\<rangle>open64_0xb4a1_retval::32 word)) \<and> RSI \<sigma> = ((RSP\<^sub>0::64 word) - 0x448) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x458) \<and> RBP \<sigma> = ((RSP\<^sub>0::64 word) - 0x448) \<and> R13 \<sigma> = ucast ((\<langle>31,0\<rangle>open64_0xb4a1_retval::32 word)) \<and> R12 \<sigma> = ((RSP\<^sub>0::64 word) - 0x448) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40c),4]::32 word) = 0x3000000 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40d),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x449),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40e),1]::8 word) = ucast ((\<langle>7,0\<rangle>R15 \<sigma>::8 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x410),2]::16 word) = ucast ((\<langle>15,0\<rangle>RBX \<sigma>::16 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x424),4]::32 word) = 0x6b326957 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x428),4]::32 word) = 0x3000500 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x42c),4]::32 word) = 0x756d6571 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x438),8]::64 word) = 0x2000000000000 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x440),8]::64 word) = 0x10002000000 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x448),8]::64 word) = 0x78697463656e6f63 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x449),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x449),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x460),8]::64 word) = 0xb5ee\<close>
declare P_0xb5f4_false_39_def[Ps]

definition P_0xb5f4_false_39_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0xb5f4_false_39_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((FS\<^sub>0::64 word) + 0x28), 8),
    (2, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x40), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x40c), 4),
    (10, ((RSP\<^sub>0::64 word) - 0x40d), Suc 0),
    (11, ((RSP\<^sub>0::64 word) - 0x40e), Suc 0),
    (12, ((RSP\<^sub>0::64 word) - 0x410), 2),
    (13, ((RSP\<^sub>0::64 word) - 0x424), 4),
    (14, ((RSP\<^sub>0::64 word) - 0x428), 4),
    (15, ((RSP\<^sub>0::64 word) - 0x42c), 4),
    (16, ((RSP\<^sub>0::64 word) - 0x438), 8),
    (17, ((RSP\<^sub>0::64 word) - 0x440), 8),
    (18, ((RSP\<^sub>0::64 word) - 0x448), 8),
    (19, ((RSP\<^sub>0::64 word) - 0x449), Suc 0),
    (20, ((RSP\<^sub>0::64 word) - 0x460), 8)
  }\<close>

definition P_0xb5f4_false_39_regions :: state_pred where
  \<open>P_0xb5f4_false_39_regions \<sigma> \<equiv> \<exists>regions. P_0xb5f4_false_39_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0xb618_39 :: state_pred where
  \<open>Q_0xb618_39 \<sigma> \<equiv> RIP \<sigma> = 0xb618 \<and> RDX \<sigma> = 0x0 \<and> RDI \<sigma> = ucast ((\<langle>31,0\<rangle>open64_0xb4a1_retval::32 word)) \<and> RSI \<sigma> = (((((((\<langle>63,0\<rangle>((R14 \<sigma>::64 word) * 0x4)::64 word)::64 word) + 0x1ff)::64 word) AND 0xfffffffffffffe00)::64 word) + 0x600) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x458) \<and> RBP \<sigma> = ((RSP\<^sub>0::64 word) - 0x448) \<and> R15 \<sigma> = (((\<langle>63,0\<rangle>((R14 \<sigma>::64 word) * 0x4)::64 word)::64 word) + 0x1ff) \<and> R13 \<sigma> = ucast ((\<langle>31,0\<rangle>open64_0xb4a1_retval::32 word)) \<and> R12 \<sigma> = ((RSP\<^sub>0::64 word) - 0x448) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40c),4]::32 word) = 0x3000000 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40d),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x449),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x410),2]::16 word) = ucast ((\<langle>15,0\<rangle>RBX \<sigma>::16 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x424),4]::32 word) = 0x6b326957 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x428),4]::32 word) = 0x3000500 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x42c),4]::32 word) = 0x756d6571 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x438),8]::64 word) = 0x2000000000000 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x440),8]::64 word) = 0x10002000000 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x448),8]::64 word) = 0x78697463656e6f63 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x449),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x449),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x460),8]::64 word) = 0xb5ee\<close>
declare Q_0xb618_39_def[Qs]

schematic_goal vpc_create_0_7_0xb5f4_0xb611_39[blocks]:
  assumes \<open>(P_0xb5f4_false_39 && P_0xb5f4_false_39_regions && ! !ZF) \<sigma>\<close>
  shows \<open>exec_block 7 0xb611 39 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0xb618_39 ?\<sigma> \<and> block_usage P_0xb5f4_false_39_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0xb5f4_false_39_def P_0xb5f4_false_39_regions_def post: Q_0xb618_39_def regionset: P_0xb5f4_false_39_regions_set_def)

definition P_0xb618_40 :: state_pred where
  \<open>P_0xb618_40 \<sigma> \<equiv> RIP \<sigma> = 0xb618 \<and> RDX \<sigma> = 0x0 \<and> RDI \<sigma> = ucast ((\<langle>31,0\<rangle>open64_0xb4a1_retval::32 word)) \<and> RSI \<sigma> = (((((((\<langle>63,0\<rangle>((R14 \<sigma>::64 word) * 0x4)::64 word)::64 word) + 0x1ff)::64 word) AND 0xfffffffffffffe00)::64 word) + 0x600) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x458) \<and> RBP \<sigma> = ((RSP\<^sub>0::64 word) - 0x448) \<and> R15 \<sigma> = (((\<langle>63,0\<rangle>((R14 \<sigma>::64 word) * 0x4)::64 word)::64 word) + 0x1ff) \<and> R13 \<sigma> = ucast ((\<langle>31,0\<rangle>open64_0xb4a1_retval::32 word)) \<and> R12 \<sigma> = ((RSP\<^sub>0::64 word) - 0x448) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40c),4]::32 word) = 0x3000000 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40d),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x449),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x410),2]::16 word) = ucast ((\<langle>15,0\<rangle>RBX \<sigma>::16 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x424),4]::32 word) = 0x6b326957 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x428),4]::32 word) = 0x3000500 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x42c),4]::32 word) = 0x756d6571 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x438),8]::64 word) = 0x2000000000000 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x440),8]::64 word) = 0x10002000000 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x448),8]::64 word) = 0x78697463656e6f63 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x449),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x449),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x460),8]::64 word) = 0xb5ee\<close>
declare P_0xb618_40_def[Ps]

definition P_0xb618_40_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0xb618_40_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((FS\<^sub>0::64 word) + 0x28), 8),
    (2, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x40), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x40c), 4),
    (10, ((RSP\<^sub>0::64 word) - 0x40d), Suc 0),
    (11, ((RSP\<^sub>0::64 word) - 0x410), 2),
    (12, ((RSP\<^sub>0::64 word) - 0x424), 4),
    (13, ((RSP\<^sub>0::64 word) - 0x428), 4),
    (14, ((RSP\<^sub>0::64 word) - 0x42c), 4),
    (15, ((RSP\<^sub>0::64 word) - 0x438), 8),
    (16, ((RSP\<^sub>0::64 word) - 0x440), 8),
    (17, ((RSP\<^sub>0::64 word) - 0x448), 8),
    (18, ((RSP\<^sub>0::64 word) - 0x449), Suc 0),
    (19, ((RSP\<^sub>0::64 word) - 0x460), 8)
  }\<close>

definition P_0xb618_40_regions :: state_pred where
  \<open>P_0xb618_40_regions \<sigma> \<equiv> \<exists>regions. P_0xb618_40_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_lseek64_addr_0xb618_40 :: state_pred where
  \<open>Q_lseek64_addr_0xb618_40 \<sigma> \<equiv> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x460) \<and> RIP \<sigma> = lseek64_addr \<and> RDX \<sigma> = 0x0 \<and> RDI \<sigma> = ucast ((\<langle>31,0\<rangle>open64_0xb4a1_retval::32 word)) \<and> RSI \<sigma> = (((((((\<langle>63,0\<rangle>((R14 \<sigma>::64 word) * 0x4)::64 word)::64 word) + 0x1ff)::64 word) AND 0xfffffffffffffe00)::64 word) + 0x600) \<and> RBP \<sigma> = ((RSP\<^sub>0::64 word) - 0x448) \<and> R15 \<sigma> = (((\<langle>63,0\<rangle>((R14 \<sigma>::64 word) * 0x4)::64 word)::64 word) + 0x1ff) \<and> R13 \<sigma> = ucast ((\<langle>31,0\<rangle>open64_0xb4a1_retval::32 word)) \<and> R12 \<sigma> = ((RSP\<^sub>0::64 word) - 0x448) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40c),4]::32 word) = 0x3000000 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40d),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x449),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x410),2]::16 word) = ucast ((\<langle>15,0\<rangle>RBX \<sigma>::16 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x424),4]::32 word) = 0x6b326957 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x428),4]::32 word) = 0x3000500 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x42c),4]::32 word) = 0x756d6571 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x438),8]::64 word) = 0x2000000000000 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x440),8]::64 word) = 0x10002000000 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x448),8]::64 word) = 0x78697463656e6f63 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x449),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x449),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x460),8]::64 word) = 0xb61d\<close>
declare Q_lseek64_addr_0xb618_40_def[Qs]

schematic_goal vpc_create_0_1_0xb618_0xb618_40[blocks]:
  assumes \<open>(P_0xb618_40 && P_0xb618_40_regions) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0xb618 40 \<sigma> \<triangleq> ?\<sigma> \<and> Q_lseek64_addr_0xb618_40 ?\<sigma> \<and> block_usage P_0xb618_40_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0xb618_40_def P_0xb618_40_regions_def post: Q_lseek64_addr_0xb618_40_def regionset: P_0xb618_40_regions_set_def)

definition P_0xb61d_41 :: state_pred where
  \<open>P_0xb61d_41 \<sigma> \<equiv> RIP \<sigma> = 0xb61d \<and> RDX \<sigma> = 0x0 \<and> RDI \<sigma> = ucast ((\<langle>31,0\<rangle>open64_0xb4a1_retval::32 word)) \<and> RSI \<sigma> = (((((((\<langle>63,0\<rangle>((R14 \<sigma>::64 word) * 0x4)::64 word)::64 word) + 0x1ff)::64 word) AND 0xfffffffffffffe00)::64 word) + 0x600) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x458) \<and> RBP \<sigma> = ((RSP\<^sub>0::64 word) - 0x448) \<and> R15 \<sigma> = (((\<langle>63,0\<rangle>((R14 \<sigma>::64 word) * 0x4)::64 word)::64 word) + 0x1ff) \<and> R13 \<sigma> = ucast ((\<langle>31,0\<rangle>open64_0xb4a1_retval::32 word)) \<and> R12 \<sigma> = ((RSP\<^sub>0::64 word) - 0x448) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40c),4]::32 word) = 0x3000000 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40d),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x449),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x410),2]::16 word) = ucast ((\<langle>15,0\<rangle>RBX \<sigma>::16 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x424),4]::32 word) = 0x6b326957 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x428),4]::32 word) = 0x3000500 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x42c),4]::32 word) = 0x756d6571 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x438),8]::64 word) = 0x2000000000000 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x440),8]::64 word) = 0x10002000000 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x448),8]::64 word) = 0x78697463656e6f63 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x449),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x449),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x460),8]::64 word) = 0xb61d\<close>
declare P_0xb61d_41_def[Ps]

definition P_0xb61d_41_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0xb61d_41_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((FS\<^sub>0::64 word) + 0x28), 8),
    (2, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x40), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x40c), 4),
    (10, ((RSP\<^sub>0::64 word) - 0x40d), Suc 0),
    (11, ((RSP\<^sub>0::64 word) - 0x410), 2),
    (12, ((RSP\<^sub>0::64 word) - 0x424), 4),
    (13, ((RSP\<^sub>0::64 word) - 0x428), 4),
    (14, ((RSP\<^sub>0::64 word) - 0x42c), 4),
    (15, ((RSP\<^sub>0::64 word) - 0x438), 8),
    (16, ((RSP\<^sub>0::64 word) - 0x440), 8),
    (17, ((RSP\<^sub>0::64 word) - 0x448), 8),
    (18, ((RSP\<^sub>0::64 word) - 0x449), Suc 0),
    (19, ((RSP\<^sub>0::64 word) - 0x460), 8)
  }\<close>

definition P_0xb61d_41_regions :: state_pred where
  \<open>P_0xb61d_41_regions \<sigma> \<equiv> \<exists>regions. P_0xb61d_41_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0xb620_41 :: state_pred where
  \<open>Q_0xb620_41 \<sigma> \<equiv> RIP \<sigma> = 0xb620 \<and> RDX \<sigma> = 0x0 \<and> RDI \<sigma> = ucast ((\<langle>31,0\<rangle>open64_0xb4a1_retval::32 word)) \<and> RSI \<sigma> = (((((((\<langle>63,0\<rangle>((R14 \<sigma>::64 word) * 0x4)::64 word)::64 word) + 0x1ff)::64 word) AND 0xfffffffffffffe00)::64 word) + 0x600) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x458) \<and> RBP \<sigma> = ((RSP\<^sub>0::64 word) - 0x448) \<and> R15 \<sigma> = (((\<langle>63,0\<rangle>((R14 \<sigma>::64 word) * 0x4)::64 word)::64 word) + 0x1ff) \<and> R13 \<sigma> = ucast ((\<langle>31,0\<rangle>open64_0xb4a1_retval::32 word)) \<and> R12 \<sigma> = ((RSP\<^sub>0::64 word) - 0x448) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40c),4]::32 word) = 0x3000000 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40d),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x449),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x410),2]::16 word) = ucast ((\<langle>15,0\<rangle>RBX \<sigma>::16 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x424),4]::32 word) = 0x6b326957 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x428),4]::32 word) = 0x3000500 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x42c),4]::32 word) = 0x756d6571 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x438),8]::64 word) = 0x2000000000000 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x440),8]::64 word) = 0x10002000000 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x448),8]::64 word) = 0x78697463656e6f63 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x449),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x449),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x460),8]::64 word) = 0xb61d\<close>
declare Q_0xb620_41_def[Qs]

schematic_goal vpc_create_0_1_0xb61d_0xb61d_41[blocks]:
  assumes \<open>(P_0xb61d_41 && P_0xb61d_41_regions) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0xb61d 41 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0xb620_41 ?\<sigma> \<and> block_usage P_0xb61d_41_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0xb61d_41_def P_0xb61d_41_regions_def post: Q_0xb620_41_def regionset: P_0xb61d_41_regions_set_def)

definition P_0xb620_true_42 :: state_pred where
  \<open>P_0xb620_true_42 \<sigma> \<equiv> RIP \<sigma> = 0xb620 \<and> RDX \<sigma> = 0x0 \<and> RDI \<sigma> = ucast ((\<langle>31,0\<rangle>open64_0xb4a1_retval::32 word)) \<and> RSI \<sigma> = (((((((\<langle>63,0\<rangle>((R14 \<sigma>::64 word) * 0x4)::64 word)::64 word) + 0x1ff)::64 word) AND 0xfffffffffffffe00)::64 word) + 0x600) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x458) \<and> RBP \<sigma> = ((RSP\<^sub>0::64 word) - 0x448) \<and> R15 \<sigma> = (((\<langle>63,0\<rangle>((R14 \<sigma>::64 word) * 0x4)::64 word)::64 word) + 0x1ff) \<and> R13 \<sigma> = ucast ((\<langle>31,0\<rangle>open64_0xb4a1_retval::32 word)) \<and> R12 \<sigma> = ((RSP\<^sub>0::64 word) - 0x448) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40c),4]::32 word) = 0x3000000 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40d),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x449),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x410),2]::16 word) = ucast ((\<langle>15,0\<rangle>RBX \<sigma>::16 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x424),4]::32 word) = 0x6b326957 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x428),4]::32 word) = 0x3000500 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x42c),4]::32 word) = 0x756d6571 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x438),8]::64 word) = 0x2000000000000 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x440),8]::64 word) = 0x10002000000 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x448),8]::64 word) = 0x78697463656e6f63 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x449),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x449),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x460),8]::64 word) = 0xb61d\<close>
declare P_0xb620_true_42_def[Ps]

definition P_0xb620_true_42_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0xb620_true_42_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((FS\<^sub>0::64 word) + 0x28), 8),
    (2, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x40), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x40c), 4),
    (10, ((RSP\<^sub>0::64 word) - 0x40d), Suc 0),
    (11, ((RSP\<^sub>0::64 word) - 0x410), 2),
    (12, ((RSP\<^sub>0::64 word) - 0x424), 4),
    (13, ((RSP\<^sub>0::64 word) - 0x428), 4),
    (14, ((RSP\<^sub>0::64 word) - 0x42c), 4),
    (15, ((RSP\<^sub>0::64 word) - 0x438), 8),
    (16, ((RSP\<^sub>0::64 word) - 0x440), 8),
    (17, ((RSP\<^sub>0::64 word) - 0x448), 8),
    (18, ((RSP\<^sub>0::64 word) - 0x449), Suc 0),
    (19, ((RSP\<^sub>0::64 word) - 0x460), 8)
  }\<close>

definition P_0xb620_true_42_regions :: state_pred where
  \<open>P_0xb620_true_42_regions \<sigma> \<equiv> \<exists>regions. P_0xb620_true_42_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0xb695_42 :: state_pred where
  \<open>Q_0xb695_42 \<sigma> \<equiv> RIP \<sigma> = 0xb695 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x458) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word)\<close>
declare Q_0xb695_42_def[Qs]

schematic_goal vpc_create_0_2_0xb620_0xb690_42[blocks]:
  assumes \<open>(P_0xb620_true_42 && P_0xb620_true_42_regions && SF) \<sigma>\<close>
  shows \<open>exec_block 2 0xb690 42 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0xb695_42 ?\<sigma> \<and> block_usage P_0xb620_true_42_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0xb620_true_42_def P_0xb620_true_42_regions_def post: Q_0xb695_42_def regionset: P_0xb620_true_42_regions_set_def)

definition P_0xb620_false_43 :: state_pred where
  \<open>P_0xb620_false_43 \<sigma> \<equiv> RIP \<sigma> = 0xb620 \<and> RDX \<sigma> = 0x0 \<and> RDI \<sigma> = ucast ((\<langle>31,0\<rangle>open64_0xb4a1_retval::32 word)) \<and> RSI \<sigma> = (((((((\<langle>63,0\<rangle>((R14 \<sigma>::64 word) * 0x4)::64 word)::64 word) + 0x1ff)::64 word) AND 0xfffffffffffffe00)::64 word) + 0x600) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x458) \<and> RBP \<sigma> = ((RSP\<^sub>0::64 word) - 0x448) \<and> R15 \<sigma> = (((\<langle>63,0\<rangle>((R14 \<sigma>::64 word) * 0x4)::64 word)::64 word) + 0x1ff) \<and> R13 \<sigma> = ucast ((\<langle>31,0\<rangle>open64_0xb4a1_retval::32 word)) \<and> R12 \<sigma> = ((RSP\<^sub>0::64 word) - 0x448) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40c),4]::32 word) = 0x3000000 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40d),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x449),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x410),2]::16 word) = ucast ((\<langle>15,0\<rangle>RBX \<sigma>::16 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x424),4]::32 word) = 0x6b326957 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x428),4]::32 word) = 0x3000500 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x42c),4]::32 word) = 0x756d6571 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x438),8]::64 word) = 0x2000000000000 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x440),8]::64 word) = 0x10002000000 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x448),8]::64 word) = 0x78697463656e6f63 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x449),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x449),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x460),8]::64 word) = 0xb61d\<close>
declare P_0xb620_false_43_def[Ps]

definition P_0xb620_false_43_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0xb620_false_43_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((FS\<^sub>0::64 word) + 0x28), 8),
    (2, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x40), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x40c), 4),
    (10, ((RSP\<^sub>0::64 word) - 0x40d), Suc 0),
    (11, ((RSP\<^sub>0::64 word) - 0x410), 2),
    (12, ((RSP\<^sub>0::64 word) - 0x424), 4),
    (13, ((RSP\<^sub>0::64 word) - 0x428), 4),
    (14, ((RSP\<^sub>0::64 word) - 0x42c), 4),
    (15, ((RSP\<^sub>0::64 word) - 0x438), 8),
    (16, ((RSP\<^sub>0::64 word) - 0x440), 8),
    (17, ((RSP\<^sub>0::64 word) - 0x448), 8),
    (18, ((RSP\<^sub>0::64 word) - 0x449), Suc 0),
    (19, ((RSP\<^sub>0::64 word) - 0x460), 8)
  }\<close>

definition P_0xb620_false_43_regions :: state_pred where
  \<open>P_0xb620_false_43_regions \<sigma> \<equiv> \<exists>regions. P_0xb620_false_43_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0xb62d_43 :: state_pred where
  \<open>Q_0xb62d_43 \<sigma> \<equiv> RIP \<sigma> = 0xb62d \<and> RDX \<sigma> = 0x200 \<and> RDI \<sigma> = ucast ((\<langle>31,0\<rangle>open64_0xb4a1_retval::32 word)) \<and> RSI \<sigma> = ((RSP\<^sub>0::64 word) - 0x448) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x458) \<and> RBP \<sigma> = ((RSP\<^sub>0::64 word) - 0x448) \<and> R15 \<sigma> = (((\<langle>63,0\<rangle>((R14 \<sigma>::64 word) * 0x4)::64 word)::64 word) + 0x1ff) \<and> R13 \<sigma> = ucast ((\<langle>31,0\<rangle>open64_0xb4a1_retval::32 word)) \<and> R12 \<sigma> = ((RSP\<^sub>0::64 word) - 0x448) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40c),4]::32 word) = 0x3000000 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40d),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x449),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x410),2]::16 word) = ucast ((\<langle>15,0\<rangle>RBX \<sigma>::16 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x424),4]::32 word) = 0x6b326957 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x428),4]::32 word) = 0x3000500 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x42c),4]::32 word) = 0x756d6571 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x438),8]::64 word) = 0x2000000000000 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x440),8]::64 word) = 0x10002000000 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x448),8]::64 word) = 0x78697463656e6f63 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x449),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x449),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x460),8]::64 word) = 0xb61d\<close>
declare Q_0xb62d_43_def[Qs]

schematic_goal vpc_create_0_4_0xb620_0xb62a_43[blocks]:
  assumes \<open>(P_0xb620_false_43 && P_0xb620_false_43_regions && ! SF) \<sigma>\<close>
  shows \<open>exec_block 4 0xb62a 43 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0xb62d_43 ?\<sigma> \<and> block_usage P_0xb620_false_43_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0xb620_false_43_def P_0xb620_false_43_regions_def post: Q_0xb62d_43_def regionset: P_0xb620_false_43_regions_set_def)

definition P_0xb62d_44 :: state_pred where
  \<open>P_0xb62d_44 \<sigma> \<equiv> RIP \<sigma> = 0xb62d \<and> RDX \<sigma> = 0x200 \<and> RDI \<sigma> = ucast ((\<langle>31,0\<rangle>open64_0xb4a1_retval::32 word)) \<and> RSI \<sigma> = ((RSP\<^sub>0::64 word) - 0x448) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x458) \<and> RBP \<sigma> = ((RSP\<^sub>0::64 word) - 0x448) \<and> R15 \<sigma> = (((\<langle>63,0\<rangle>((R14 \<sigma>::64 word) * 0x4)::64 word)::64 word) + 0x1ff) \<and> R13 \<sigma> = ucast ((\<langle>31,0\<rangle>open64_0xb4a1_retval::32 word)) \<and> R12 \<sigma> = ((RSP\<^sub>0::64 word) - 0x448) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40c),4]::32 word) = 0x3000000 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40d),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x449),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x410),2]::16 word) = ucast ((\<langle>15,0\<rangle>RBX \<sigma>::16 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x424),4]::32 word) = 0x6b326957 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x428),4]::32 word) = 0x3000500 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x42c),4]::32 word) = 0x756d6571 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x438),8]::64 word) = 0x2000000000000 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x440),8]::64 word) = 0x10002000000 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x448),8]::64 word) = 0x78697463656e6f63 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x449),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x449),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x460),8]::64 word) = 0xb61d\<close>
declare P_0xb62d_44_def[Ps]

definition P_0xb62d_44_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0xb62d_44_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((FS\<^sub>0::64 word) + 0x28), 8),
    (2, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x40), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x40c), 4),
    (10, ((RSP\<^sub>0::64 word) - 0x40d), Suc 0),
    (11, ((RSP\<^sub>0::64 word) - 0x410), 2),
    (12, ((RSP\<^sub>0::64 word) - 0x424), 4),
    (13, ((RSP\<^sub>0::64 word) - 0x428), 4),
    (14, ((RSP\<^sub>0::64 word) - 0x42c), 4),
    (15, ((RSP\<^sub>0::64 word) - 0x438), 8),
    (16, ((RSP\<^sub>0::64 word) - 0x440), 8),
    (17, ((RSP\<^sub>0::64 word) - 0x448), 8),
    (18, ((RSP\<^sub>0::64 word) - 0x449), Suc 0),
    (19, ((RSP\<^sub>0::64 word) - 0x460), 8)
  }\<close>

definition P_0xb62d_44_regions :: state_pred where
  \<open>P_0xb62d_44_regions \<sigma> \<equiv> \<exists>regions. P_0xb62d_44_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_write_addr_0xb62d_44 :: state_pred where
  \<open>Q_write_addr_0xb62d_44 \<sigma> \<equiv> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x460) \<and> RIP \<sigma> = write_addr \<and> RDX \<sigma> = 0x200 \<and> RDI \<sigma> = ucast ((\<langle>31,0\<rangle>open64_0xb4a1_retval::32 word)) \<and> RSI \<sigma> = ((RSP\<^sub>0::64 word) - 0x448) \<and> RBP \<sigma> = ((RSP\<^sub>0::64 word) - 0x448) \<and> R15 \<sigma> = (((\<langle>63,0\<rangle>((R14 \<sigma>::64 word) * 0x4)::64 word)::64 word) + 0x1ff) \<and> R13 \<sigma> = ucast ((\<langle>31,0\<rangle>open64_0xb4a1_retval::32 word)) \<and> R12 \<sigma> = ((RSP\<^sub>0::64 word) - 0x448) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40c),4]::32 word) = 0x3000000 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40d),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x449),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x410),2]::16 word) = ucast ((\<langle>15,0\<rangle>RBX \<sigma>::16 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x424),4]::32 word) = 0x6b326957 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x428),4]::32 word) = 0x3000500 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x42c),4]::32 word) = 0x756d6571 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x438),8]::64 word) = 0x2000000000000 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x440),8]::64 word) = 0x10002000000 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x448),8]::64 word) = 0x78697463656e6f63 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x449),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x449),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x460),8]::64 word) = 0xb632\<close>
declare Q_write_addr_0xb62d_44_def[Qs]

schematic_goal vpc_create_0_1_0xb62d_0xb62d_44[blocks]:
  assumes \<open>(P_0xb62d_44 && P_0xb62d_44_regions) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0xb62d 44 \<sigma> \<triangleq> ?\<sigma> \<and> Q_write_addr_0xb62d_44 ?\<sigma> \<and> block_usage P_0xb62d_44_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0xb62d_44_def P_0xb62d_44_regions_def post: Q_write_addr_0xb62d_44_def regionset: P_0xb62d_44_regions_set_def)

definition P_0xb632_45 :: state_pred where
  \<open>P_0xb632_45 \<sigma> \<equiv> RIP \<sigma> = 0xb632 \<and> RDX \<sigma> = 0x200 \<and> RDI \<sigma> = ucast ((\<langle>31,0\<rangle>open64_0xb4a1_retval::32 word)) \<and> RSI \<sigma> = ((RSP\<^sub>0::64 word) - 0x448) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x458) \<and> RBP \<sigma> = ((RSP\<^sub>0::64 word) - 0x448) \<and> R15 \<sigma> = (((\<langle>63,0\<rangle>((R14 \<sigma>::64 word) * 0x4)::64 word)::64 word) + 0x1ff) \<and> R13 \<sigma> = ucast ((\<langle>31,0\<rangle>open64_0xb4a1_retval::32 word)) \<and> R12 \<sigma> = ((RSP\<^sub>0::64 word) - 0x448) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40c),4]::32 word) = 0x3000000 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40d),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x449),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x410),2]::16 word) = ucast ((\<langle>15,0\<rangle>RBX \<sigma>::16 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x424),4]::32 word) = 0x6b326957 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x428),4]::32 word) = 0x3000500 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x42c),4]::32 word) = 0x756d6571 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x438),8]::64 word) = 0x2000000000000 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x440),8]::64 word) = 0x10002000000 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x448),8]::64 word) = 0x78697463656e6f63 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x449),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x449),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x460),8]::64 word) = 0xb632\<close>
declare P_0xb632_45_def[Ps]

definition P_0xb632_45_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0xb632_45_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((FS\<^sub>0::64 word) + 0x28), 8),
    (2, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x40), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x40c), 4),
    (10, ((RSP\<^sub>0::64 word) - 0x40d), Suc 0),
    (11, ((RSP\<^sub>0::64 word) - 0x410), 2),
    (12, ((RSP\<^sub>0::64 word) - 0x424), 4),
    (13, ((RSP\<^sub>0::64 word) - 0x428), 4),
    (14, ((RSP\<^sub>0::64 word) - 0x42c), 4),
    (15, ((RSP\<^sub>0::64 word) - 0x438), 8),
    (16, ((RSP\<^sub>0::64 word) - 0x440), 8),
    (17, ((RSP\<^sub>0::64 word) - 0x448), 8),
    (18, ((RSP\<^sub>0::64 word) - 0x449), Suc 0),
    (19, ((RSP\<^sub>0::64 word) - 0x460), 8)
  }\<close>

definition P_0xb632_45_regions :: state_pred where
  \<open>P_0xb632_45_regions \<sigma> \<equiv> \<exists>regions. P_0xb632_45_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0xb638_45 :: state_pred where
  \<open>Q_0xb638_45 \<sigma> \<equiv> RIP \<sigma> = 0xb638 \<and> RDX \<sigma> = 0x200 \<and> RDI \<sigma> = ucast ((\<langle>31,0\<rangle>open64_0xb4a1_retval::32 word)) \<and> RSI \<sigma> = ((RSP\<^sub>0::64 word) - 0x448) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x458) \<and> RBP \<sigma> = ((RSP\<^sub>0::64 word) - 0x448) \<and> R15 \<sigma> = (((\<langle>63,0\<rangle>((R14 \<sigma>::64 word) * 0x4)::64 word)::64 word) + 0x1ff) \<and> R13 \<sigma> = ucast ((\<langle>31,0\<rangle>open64_0xb4a1_retval::32 word)) \<and> R12 \<sigma> = ((RSP\<^sub>0::64 word) - 0x448) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40c),4]::32 word) = 0x3000000 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40d),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x449),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x410),2]::16 word) = ucast ((\<langle>15,0\<rangle>RBX \<sigma>::16 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x424),4]::32 word) = 0x6b326957 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x428),4]::32 word) = 0x3000500 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x42c),4]::32 word) = 0x756d6571 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x438),8]::64 word) = 0x2000000000000 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x440),8]::64 word) = 0x10002000000 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x448),8]::64 word) = 0x78697463656e6f63 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x449),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x449),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x460),8]::64 word) = 0xb632\<close>
declare Q_0xb638_45_def[Qs]

schematic_goal vpc_create_0_1_0xb632_0xb632_45[blocks]:
  assumes \<open>(P_0xb632_45 && P_0xb632_45_regions) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0xb632 45 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0xb638_45 ?\<sigma> \<and> block_usage P_0xb632_45_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0xb632_45_def P_0xb632_45_regions_def post: Q_0xb638_45_def regionset: P_0xb632_45_regions_set_def)

definition P_0xb638_true_46 :: state_pred where
  \<open>P_0xb638_true_46 \<sigma> \<equiv> RIP \<sigma> = 0xb638 \<and> RDX \<sigma> = 0x200 \<and> RDI \<sigma> = ucast ((\<langle>31,0\<rangle>open64_0xb4a1_retval::32 word)) \<and> RSI \<sigma> = ((RSP\<^sub>0::64 word) - 0x448) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x458) \<and> RBP \<sigma> = ((RSP\<^sub>0::64 word) - 0x448) \<and> R15 \<sigma> = (((\<langle>63,0\<rangle>((R14 \<sigma>::64 word) * 0x4)::64 word)::64 word) + 0x1ff) \<and> R13 \<sigma> = ucast ((\<langle>31,0\<rangle>open64_0xb4a1_retval::32 word)) \<and> R12 \<sigma> = ((RSP\<^sub>0::64 word) - 0x448) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40c),4]::32 word) = 0x3000000 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40d),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x449),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x410),2]::16 word) = ucast ((\<langle>15,0\<rangle>RBX \<sigma>::16 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x424),4]::32 word) = 0x6b326957 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x428),4]::32 word) = 0x3000500 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x42c),4]::32 word) = 0x756d6571 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x438),8]::64 word) = 0x2000000000000 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x440),8]::64 word) = 0x10002000000 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x448),8]::64 word) = 0x78697463656e6f63 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x449),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x449),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x460),8]::64 word) = 0xb632\<close>
declare P_0xb638_true_46_def[Ps]

definition P_0xb638_true_46_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0xb638_true_46_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((FS\<^sub>0::64 word) + 0x28), 8),
    (2, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x40), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x40c), 4),
    (10, ((RSP\<^sub>0::64 word) - 0x40d), Suc 0),
    (11, ((RSP\<^sub>0::64 word) - 0x410), 2),
    (12, ((RSP\<^sub>0::64 word) - 0x424), 4),
    (13, ((RSP\<^sub>0::64 word) - 0x428), 4),
    (14, ((RSP\<^sub>0::64 word) - 0x42c), 4),
    (15, ((RSP\<^sub>0::64 word) - 0x438), 8),
    (16, ((RSP\<^sub>0::64 word) - 0x440), 8),
    (17, ((RSP\<^sub>0::64 word) - 0x448), 8),
    (18, ((RSP\<^sub>0::64 word) - 0x449), Suc 0),
    (19, ((RSP\<^sub>0::64 word) - 0x460), 8)
  }\<close>

definition P_0xb638_true_46_regions :: state_pred where
  \<open>P_0xb638_true_46_regions \<sigma> \<equiv> \<exists>regions. P_0xb638_true_46_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0xb695_46 :: state_pred where
  \<open>Q_0xb695_46 \<sigma> \<equiv> RIP \<sigma> = 0xb695 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x458) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word)\<close>
declare Q_0xb695_46_def[Qs]

schematic_goal vpc_create_0_2_0xb638_0xb690_46[blocks]:
  assumes \<open>(P_0xb638_true_46 && P_0xb638_true_46_regions && !ZF) \<sigma>\<close>
  shows \<open>exec_block 2 0xb690 46 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0xb695_46 ?\<sigma> \<and> block_usage P_0xb638_true_46_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0xb638_true_46_def P_0xb638_true_46_regions_def post: Q_0xb695_46_def regionset: P_0xb638_true_46_regions_set_def)

definition P_0xb638_false_47 :: state_pred where
  \<open>P_0xb638_false_47 \<sigma> \<equiv> RIP \<sigma> = 0xb638 \<and> RDX \<sigma> = 0x200 \<and> RDI \<sigma> = ucast ((\<langle>31,0\<rangle>open64_0xb4a1_retval::32 word)) \<and> RSI \<sigma> = ((RSP\<^sub>0::64 word) - 0x448) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x458) \<and> RBP \<sigma> = ((RSP\<^sub>0::64 word) - 0x448) \<and> R15 \<sigma> = (((\<langle>63,0\<rangle>((R14 \<sigma>::64 word) * 0x4)::64 word)::64 word) + 0x1ff) \<and> R13 \<sigma> = ucast ((\<langle>31,0\<rangle>open64_0xb4a1_retval::32 word)) \<and> R12 \<sigma> = ((RSP\<^sub>0::64 word) - 0x448) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40c),4]::32 word) = 0x3000000 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40d),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x449),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x410),2]::16 word) = ucast ((\<langle>15,0\<rangle>RBX \<sigma>::16 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x424),4]::32 word) = 0x6b326957 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x428),4]::32 word) = 0x3000500 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x42c),4]::32 word) = 0x756d6571 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x438),8]::64 word) = 0x2000000000000 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x440),8]::64 word) = 0x10002000000 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x448),8]::64 word) = 0x78697463656e6f63 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x449),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x449),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x460),8]::64 word) = 0xb632\<close>
declare P_0xb638_false_47_def[Ps]

definition P_0xb638_false_47_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0xb638_false_47_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((FS\<^sub>0::64 word) + 0x28), 8),
    (2, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x40), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x40c), 4),
    (10, ((RSP\<^sub>0::64 word) - 0x40d), Suc 0),
    (11, ((RSP\<^sub>0::64 word) - 0x410), 2),
    (12, ((RSP\<^sub>0::64 word) - 0x424), 4),
    (13, ((RSP\<^sub>0::64 word) - 0x428), 4),
    (14, ((RSP\<^sub>0::64 word) - 0x42c), 4),
    (15, ((RSP\<^sub>0::64 word) - 0x438), 8),
    (16, ((RSP\<^sub>0::64 word) - 0x440), 8),
    (17, ((RSP\<^sub>0::64 word) - 0x448), 8),
    (18, ((RSP\<^sub>0::64 word) - 0x449), Suc 0),
    (19, ((RSP\<^sub>0::64 word) - 0x460), 8)
  }\<close>

definition P_0xb638_false_47_regions :: state_pred where
  \<open>P_0xb638_false_47_regions \<sigma> \<equiv> \<exists>regions. P_0xb638_false_47_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0xb644_47 :: state_pred where
  \<open>Q_0xb644_47 \<sigma> \<equiv> RIP \<sigma> = 0xb644 \<and> RDX \<sigma> = 0x0 \<and> RDI \<sigma> = ucast ((\<langle>31,0\<rangle>open64_0xb4a1_retval::32 word)) \<and> RSI \<sigma> = 0x600 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x458) \<and> RBP \<sigma> = ((RSP\<^sub>0::64 word) - 0x448) \<and> R15 \<sigma> = (((\<langle>63,0\<rangle>((R14 \<sigma>::64 word) * 0x4)::64 word)::64 word) + 0x1ff) \<and> R13 \<sigma> = ucast ((\<langle>31,0\<rangle>open64_0xb4a1_retval::32 word)) \<and> R12 \<sigma> = ((RSP\<^sub>0::64 word) - 0x448) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40c),4]::32 word) = 0x3000000 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40d),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x449),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x410),2]::16 word) = ucast ((\<langle>15,0\<rangle>RBX \<sigma>::16 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x424),4]::32 word) = 0x6b326957 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x428),4]::32 word) = 0x3000500 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x42c),4]::32 word) = 0x756d6571 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x438),8]::64 word) = 0x2000000000000 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x440),8]::64 word) = 0x10002000000 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x448),8]::64 word) = 0x78697463656e6f63 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x449),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x449),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x460),8]::64 word) = 0xb632\<close>
declare Q_0xb644_47_def[Qs]

schematic_goal vpc_create_0_4_0xb638_0xb641_47[blocks]:
  assumes \<open>(P_0xb638_false_47 && P_0xb638_false_47_regions && ! !ZF) \<sigma>\<close>
  shows \<open>exec_block 4 0xb641 47 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0xb644_47 ?\<sigma> \<and> block_usage P_0xb638_false_47_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0xb638_false_47_def P_0xb638_false_47_regions_def post: Q_0xb644_47_def regionset: P_0xb638_false_47_regions_set_def)

definition P_0xb644_48 :: state_pred where
  \<open>P_0xb644_48 \<sigma> \<equiv> RIP \<sigma> = 0xb644 \<and> RDX \<sigma> = 0x0 \<and> RDI \<sigma> = ucast ((\<langle>31,0\<rangle>open64_0xb4a1_retval::32 word)) \<and> RSI \<sigma> = 0x600 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x458) \<and> RBP \<sigma> = ((RSP\<^sub>0::64 word) - 0x448) \<and> R15 \<sigma> = (((\<langle>63,0\<rangle>((R14 \<sigma>::64 word) * 0x4)::64 word)::64 word) + 0x1ff) \<and> R13 \<sigma> = ucast ((\<langle>31,0\<rangle>open64_0xb4a1_retval::32 word)) \<and> R12 \<sigma> = ((RSP\<^sub>0::64 word) - 0x448) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40c),4]::32 word) = 0x3000000 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40d),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x449),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x410),2]::16 word) = ucast ((\<langle>15,0\<rangle>RBX \<sigma>::16 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x424),4]::32 word) = 0x6b326957 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x428),4]::32 word) = 0x3000500 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x42c),4]::32 word) = 0x756d6571 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x438),8]::64 word) = 0x2000000000000 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x440),8]::64 word) = 0x10002000000 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x448),8]::64 word) = 0x78697463656e6f63 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x449),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x449),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x460),8]::64 word) = 0xb632\<close>
declare P_0xb644_48_def[Ps]

definition P_0xb644_48_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0xb644_48_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((FS\<^sub>0::64 word) + 0x28), 8),
    (2, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x40), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x40c), 4),
    (10, ((RSP\<^sub>0::64 word) - 0x40d), Suc 0),
    (11, ((RSP\<^sub>0::64 word) - 0x410), 2),
    (12, ((RSP\<^sub>0::64 word) - 0x424), 4),
    (13, ((RSP\<^sub>0::64 word) - 0x428), 4),
    (14, ((RSP\<^sub>0::64 word) - 0x42c), 4),
    (15, ((RSP\<^sub>0::64 word) - 0x438), 8),
    (16, ((RSP\<^sub>0::64 word) - 0x440), 8),
    (17, ((RSP\<^sub>0::64 word) - 0x448), 8),
    (18, ((RSP\<^sub>0::64 word) - 0x449), Suc 0),
    (19, ((RSP\<^sub>0::64 word) - 0x460), 8)
  }\<close>

definition P_0xb644_48_regions :: state_pred where
  \<open>P_0xb644_48_regions \<sigma> \<equiv> \<exists>regions. P_0xb644_48_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_lseek64_addr_0xb644_48 :: state_pred where
  \<open>Q_lseek64_addr_0xb644_48 \<sigma> \<equiv> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x460) \<and> RIP \<sigma> = lseek64_addr \<and> RDX \<sigma> = 0x0 \<and> RDI \<sigma> = ucast ((\<langle>31,0\<rangle>open64_0xb4a1_retval::32 word)) \<and> RSI \<sigma> = 0x600 \<and> RBP \<sigma> = ((RSP\<^sub>0::64 word) - 0x448) \<and> R15 \<sigma> = (((\<langle>63,0\<rangle>((R14 \<sigma>::64 word) * 0x4)::64 word)::64 word) + 0x1ff) \<and> R13 \<sigma> = ucast ((\<langle>31,0\<rangle>open64_0xb4a1_retval::32 word)) \<and> R12 \<sigma> = ((RSP\<^sub>0::64 word) - 0x448) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40c),4]::32 word) = 0x3000000 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40d),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x449),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x410),2]::16 word) = ucast ((\<langle>15,0\<rangle>RBX \<sigma>::16 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x424),4]::32 word) = 0x6b326957 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x428),4]::32 word) = 0x3000500 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x42c),4]::32 word) = 0x756d6571 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x438),8]::64 word) = 0x2000000000000 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x440),8]::64 word) = 0x10002000000 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x448),8]::64 word) = 0x78697463656e6f63 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x449),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x449),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x460),8]::64 word) = 0xb649\<close>
declare Q_lseek64_addr_0xb644_48_def[Qs]

schematic_goal vpc_create_0_1_0xb644_0xb644_48[blocks]:
  assumes \<open>(P_0xb644_48 && P_0xb644_48_regions) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0xb644 48 \<sigma> \<triangleq> ?\<sigma> \<and> Q_lseek64_addr_0xb644_48 ?\<sigma> \<and> block_usage P_0xb644_48_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0xb644_48_def P_0xb644_48_regions_def post: Q_lseek64_addr_0xb644_48_def regionset: P_0xb644_48_regions_set_def)

definition P_0xb649_49 :: state_pred where
  \<open>P_0xb649_49 \<sigma> \<equiv> RIP \<sigma> = 0xb649 \<and> RDX \<sigma> = 0x0 \<and> RDI \<sigma> = ucast ((\<langle>31,0\<rangle>open64_0xb4a1_retval::32 word)) \<and> RSI \<sigma> = 0x600 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x458) \<and> RBP \<sigma> = ((RSP\<^sub>0::64 word) - 0x448) \<and> R15 \<sigma> = (((\<langle>63,0\<rangle>((R14 \<sigma>::64 word) * 0x4)::64 word)::64 word) + 0x1ff) \<and> R13 \<sigma> = ucast ((\<langle>31,0\<rangle>open64_0xb4a1_retval::32 word)) \<and> R12 \<sigma> = ((RSP\<^sub>0::64 word) - 0x448) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40c),4]::32 word) = 0x3000000 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40d),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x449),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x410),2]::16 word) = ucast ((\<langle>15,0\<rangle>RBX \<sigma>::16 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x424),4]::32 word) = 0x6b326957 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x428),4]::32 word) = 0x3000500 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x42c),4]::32 word) = 0x756d6571 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x438),8]::64 word) = 0x2000000000000 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x440),8]::64 word) = 0x10002000000 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x448),8]::64 word) = 0x78697463656e6f63 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x449),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x449),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x460),8]::64 word) = 0xb649\<close>
declare P_0xb649_49_def[Ps]

definition P_0xb649_49_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0xb649_49_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((FS\<^sub>0::64 word) + 0x28), 8),
    (2, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x40), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x40c), 4),
    (10, ((RSP\<^sub>0::64 word) - 0x40d), Suc 0),
    (11, ((RSP\<^sub>0::64 word) - 0x410), 2),
    (12, ((RSP\<^sub>0::64 word) - 0x424), 4),
    (13, ((RSP\<^sub>0::64 word) - 0x428), 4),
    (14, ((RSP\<^sub>0::64 word) - 0x42c), 4),
    (15, ((RSP\<^sub>0::64 word) - 0x438), 8),
    (16, ((RSP\<^sub>0::64 word) - 0x440), 8),
    (17, ((RSP\<^sub>0::64 word) - 0x448), 8),
    (18, ((RSP\<^sub>0::64 word) - 0x449), Suc 0),
    (19, ((RSP\<^sub>0::64 word) - 0x460), 8)
  }\<close>

definition P_0xb649_49_regions :: state_pred where
  \<open>P_0xb649_49_regions \<sigma> \<equiv> \<exists>regions. P_0xb649_49_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0xb64c_49 :: state_pred where
  \<open>Q_0xb64c_49 \<sigma> \<equiv> RIP \<sigma> = 0xb64c \<and> RDX \<sigma> = 0x0 \<and> RDI \<sigma> = ucast ((\<langle>31,0\<rangle>open64_0xb4a1_retval::32 word)) \<and> RSI \<sigma> = 0x600 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x458) \<and> RBP \<sigma> = ((RSP\<^sub>0::64 word) - 0x448) \<and> R15 \<sigma> = (((\<langle>63,0\<rangle>((R14 \<sigma>::64 word) * 0x4)::64 word)::64 word) + 0x1ff) \<and> R13 \<sigma> = ucast ((\<langle>31,0\<rangle>open64_0xb4a1_retval::32 word)) \<and> R12 \<sigma> = ((RSP\<^sub>0::64 word) - 0x448) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40c),4]::32 word) = 0x3000000 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40d),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x449),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x410),2]::16 word) = ucast ((\<langle>15,0\<rangle>RBX \<sigma>::16 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x424),4]::32 word) = 0x6b326957 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x428),4]::32 word) = 0x3000500 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x42c),4]::32 word) = 0x756d6571 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x438),8]::64 word) = 0x2000000000000 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x440),8]::64 word) = 0x10002000000 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x448),8]::64 word) = 0x78697463656e6f63 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x449),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x449),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x460),8]::64 word) = 0xb649\<close>
declare Q_0xb64c_49_def[Qs]

schematic_goal vpc_create_0_1_0xb649_0xb649_49[blocks]:
  assumes \<open>(P_0xb649_49 && P_0xb649_49_regions) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0xb649 49 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0xb64c_49 ?\<sigma> \<and> block_usage P_0xb649_49_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0xb649_49_def P_0xb649_49_regions_def post: Q_0xb64c_49_def regionset: P_0xb649_49_regions_set_def)

definition P_0xb64c_true_50 :: state_pred where
  \<open>P_0xb64c_true_50 \<sigma> \<equiv> RIP \<sigma> = 0xb64c \<and> RDX \<sigma> = 0x0 \<and> RDI \<sigma> = ucast ((\<langle>31,0\<rangle>open64_0xb4a1_retval::32 word)) \<and> RSI \<sigma> = 0x600 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x458) \<and> RBP \<sigma> = ((RSP\<^sub>0::64 word) - 0x448) \<and> R15 \<sigma> = (((\<langle>63,0\<rangle>((R14 \<sigma>::64 word) * 0x4)::64 word)::64 word) + 0x1ff) \<and> R13 \<sigma> = ucast ((\<langle>31,0\<rangle>open64_0xb4a1_retval::32 word)) \<and> R12 \<sigma> = ((RSP\<^sub>0::64 word) - 0x448) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40c),4]::32 word) = 0x3000000 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40d),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x449),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x410),2]::16 word) = ucast ((\<langle>15,0\<rangle>RBX \<sigma>::16 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x424),4]::32 word) = 0x6b326957 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x428),4]::32 word) = 0x3000500 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x42c),4]::32 word) = 0x756d6571 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x438),8]::64 word) = 0x2000000000000 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x440),8]::64 word) = 0x10002000000 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x448),8]::64 word) = 0x78697463656e6f63 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x449),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x449),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x460),8]::64 word) = 0xb649\<close>
declare P_0xb64c_true_50_def[Ps]

definition P_0xb64c_true_50_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0xb64c_true_50_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((FS\<^sub>0::64 word) + 0x28), 8),
    (2, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x40), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x40c), 4),
    (10, ((RSP\<^sub>0::64 word) - 0x40d), Suc 0),
    (11, ((RSP\<^sub>0::64 word) - 0x410), 2),
    (12, ((RSP\<^sub>0::64 word) - 0x424), 4),
    (13, ((RSP\<^sub>0::64 word) - 0x428), 4),
    (14, ((RSP\<^sub>0::64 word) - 0x42c), 4),
    (15, ((RSP\<^sub>0::64 word) - 0x438), 8),
    (16, ((RSP\<^sub>0::64 word) - 0x440), 8),
    (17, ((RSP\<^sub>0::64 word) - 0x448), 8),
    (18, ((RSP\<^sub>0::64 word) - 0x449), Suc 0),
    (19, ((RSP\<^sub>0::64 word) - 0x460), 8)
  }\<close>

definition P_0xb64c_true_50_regions :: state_pred where
  \<open>P_0xb64c_true_50_regions \<sigma> \<equiv> \<exists>regions. P_0xb64c_true_50_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0xb695_50 :: state_pred where
  \<open>Q_0xb695_50 \<sigma> \<equiv> RIP \<sigma> = 0xb695 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x458) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word)\<close>
declare Q_0xb695_50_def[Qs]

schematic_goal vpc_create_0_2_0xb64c_0xb690_50[blocks]:
  assumes \<open>(P_0xb64c_true_50 && P_0xb64c_true_50_regions && SF) \<sigma>\<close>
  shows \<open>exec_block 2 0xb690 50 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0xb695_50 ?\<sigma> \<and> block_usage P_0xb64c_true_50_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0xb64c_true_50_def P_0xb64c_true_50_regions_def post: Q_0xb695_50_def regionset: P_0xb64c_true_50_regions_set_def)

definition P_0xb64c_false_51 :: state_pred where
  \<open>P_0xb64c_false_51 \<sigma> \<equiv> RIP \<sigma> = 0xb64c \<and> RDX \<sigma> = 0x0 \<and> RDI \<sigma> = ucast ((\<langle>31,0\<rangle>open64_0xb4a1_retval::32 word)) \<and> RSI \<sigma> = 0x600 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x458) \<and> RBP \<sigma> = ((RSP\<^sub>0::64 word) - 0x448) \<and> R15 \<sigma> = (((\<langle>63,0\<rangle>((R14 \<sigma>::64 word) * 0x4)::64 word)::64 word) + 0x1ff) \<and> R13 \<sigma> = ucast ((\<langle>31,0\<rangle>open64_0xb4a1_retval::32 word)) \<and> R12 \<sigma> = ((RSP\<^sub>0::64 word) - 0x448) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40c),4]::32 word) = 0x3000000 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40d),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x449),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x410),2]::16 word) = ucast ((\<langle>15,0\<rangle>RBX \<sigma>::16 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x424),4]::32 word) = 0x6b326957 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x428),4]::32 word) = 0x3000500 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x42c),4]::32 word) = 0x756d6571 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x438),8]::64 word) = 0x2000000000000 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x440),8]::64 word) = 0x10002000000 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x448),8]::64 word) = 0x78697463656e6f63 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x449),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x449),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x460),8]::64 word) = 0xb649\<close>
declare P_0xb64c_false_51_def[Ps]

definition P_0xb64c_false_51_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0xb64c_false_51_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((FS\<^sub>0::64 word) + 0x28), 8),
    (2, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x40), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x40c), 4),
    (10, ((RSP\<^sub>0::64 word) - 0x40d), Suc 0),
    (11, ((RSP\<^sub>0::64 word) - 0x410), 2),
    (12, ((RSP\<^sub>0::64 word) - 0x424), 4),
    (13, ((RSP\<^sub>0::64 word) - 0x428), 4),
    (14, ((RSP\<^sub>0::64 word) - 0x42c), 4),
    (15, ((RSP\<^sub>0::64 word) - 0x438), 8),
    (16, ((RSP\<^sub>0::64 word) - 0x440), 8),
    (17, ((RSP\<^sub>0::64 word) - 0x448), 8),
    (18, ((RSP\<^sub>0::64 word) - 0x449), Suc 0),
    (19, ((RSP\<^sub>0::64 word) - 0x460), 8)
  }\<close>

definition P_0xb64c_false_51_regions :: state_pred where
  \<open>P_0xb64c_false_51_regions \<sigma> \<equiv> \<exists>regions. P_0xb64c_false_51_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0xb663_51 :: state_pred where
  \<open>Q_0xb663_51 \<sigma> \<equiv> RIP \<sigma> = 0xb663 \<and> RAX \<sigma> = 0xffffffffffffffff \<and> RBX \<sigma> = 0x0 \<and> RCX \<sigma> = 0x40 \<and> RDX \<sigma> = 0x0 \<and> RDI \<sigma> = ((RSP\<^sub>0::64 word) - 0x448) \<and> RSI \<sigma> = 0x600 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x458) \<and> RBP \<sigma> = ((RSP\<^sub>0::64 word) - 0x448) \<and> R15 \<sigma> = ((ucast (((((\<langle>63,0\<rangle>((R14 \<sigma>::64 word) * 0x4)::64 word)::64 word) + 0x1ff)::64 word))::64 word) >> 9) \<and> R13 \<sigma> = ucast ((\<langle>31,0\<rangle>open64_0xb4a1_retval::32 word)) \<and> R12 \<sigma> = ((RSP\<^sub>0::64 word) - 0x448) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40c),4]::32 word) = 0x3000000 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40d),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x449),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x424),4]::32 word) = 0x6b326957 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x428),4]::32 word) = 0x3000500 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x42c),4]::32 word) = 0x756d6571 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x438),8]::64 word) = 0x2000000000000 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x440),8]::64 word) = 0x10002000000 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x448),8]::64 word) = 0x78697463656e6f63 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x449),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x449),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x460),8]::64 word) = 0xb649\<close>
declare Q_0xb663_51_def[Qs]

schematic_goal vpc_create_0_6_0xb64c_0xb65c_51[blocks]:
  assumes \<open>(P_0xb64c_false_51 && P_0xb64c_false_51_regions && ! SF) \<sigma>\<close>
  shows \<open>exec_block 6 0xb65c 51 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0xb663_51 ?\<sigma> \<and> block_usage P_0xb64c_false_51_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0xb64c_false_51_def P_0xb64c_false_51_regions_def post: Q_0xb663_51_def regionset: P_0xb64c_false_51_regions_set_def)

definition P_0xb663_52 :: state_pred where
  \<open>P_0xb663_52 \<sigma> \<equiv> RIP \<sigma> = 0xb663 \<and> RAX \<sigma> = 0xffffffffffffffff \<and> RBX \<sigma> = 0x0 \<and> RCX \<sigma> = 0x40 \<and> RDX \<sigma> = 0x0 \<and> RDI \<sigma> = ((RSP\<^sub>0::64 word) - 0x448) \<and> RSI \<sigma> = 0x600 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x458) \<and> RBP \<sigma> = ((RSP\<^sub>0::64 word) - 0x448) \<and> R15 \<sigma> = ((ucast (((((\<langle>63,0\<rangle>((R14 \<sigma>::64 word) * 0x4)::64 word)::64 word) + 0x1ff)::64 word))::64 word) >> 9) \<and> R13 \<sigma> = ucast ((\<langle>31,0\<rangle>open64_0xb4a1_retval::32 word)) \<and> R12 \<sigma> = ((RSP\<^sub>0::64 word) - 0x448) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40c),4]::32 word) = 0x3000000 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40d),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x449),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x424),4]::32 word) = 0x6b326957 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x428),4]::32 word) = 0x3000500 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x42c),4]::32 word) = 0x756d6571 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x438),8]::64 word) = 0x2000000000000 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x440),8]::64 word) = 0x10002000000 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x448),8]::64 word) = 0x78697463656e6f63 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x449),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x449),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x460),8]::64 word) = 0xb649\<close>
declare P_0xb663_52_def[Ps]

definition P_0xb663_52_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0xb663_52_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((FS\<^sub>0::64 word) + 0x28), 8),
    (2, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x40), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x40c), 4),
    (10, ((RSP\<^sub>0::64 word) - 0x40d), Suc 0),
    (11, ((RSP\<^sub>0::64 word) - 0x424), 4),
    (12, ((RSP\<^sub>0::64 word) - 0x428), 4),
    (13, ((RSP\<^sub>0::64 word) - 0x42c), 4),
    (14, ((RSP\<^sub>0::64 word) - 0x438), 8),
    (15, ((RSP\<^sub>0::64 word) - 0x440), 8),
    (16, ((RSP\<^sub>0::64 word) - 0x448), 8),
    (17, ((RSP\<^sub>0::64 word) - 0x449), Suc 0),
    (18, ((RSP\<^sub>0::64 word) - 0x460), 8)
  }\<close>

definition P_0xb663_52_regions :: state_pred where
  \<open>P_0xb663_52_regions \<sigma> \<equiv> \<exists>regions. P_0xb663_52_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_rep_stos_ESRDI_RAX_addr_0xb663_52 :: state_pred where
  \<open>Q_rep_stos_ESRDI_RAX_addr_0xb663_52 \<sigma> \<equiv> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x460) \<and> RIP \<sigma> = rep_stos_ESRDI_RAX_addr \<and> RAX \<sigma> = 0xffffffffffffffff \<and> RBX \<sigma> = 0x0 \<and> RCX \<sigma> = 0x40 \<and> RDX \<sigma> = 0x0 \<and> RDI \<sigma> = ((RSP\<^sub>0::64 word) - 0x448) \<and> RSI \<sigma> = 0x600 \<and> RBP \<sigma> = ((RSP\<^sub>0::64 word) - 0x448) \<and> R15 \<sigma> = ((ucast (((((\<langle>63,0\<rangle>((R14 \<sigma>::64 word) * 0x4)::64 word)::64 word) + 0x1ff)::64 word))::64 word) >> 9) \<and> R13 \<sigma> = ucast ((\<langle>31,0\<rangle>open64_0xb4a1_retval::32 word)) \<and> R12 \<sigma> = ((RSP\<^sub>0::64 word) - 0x448) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40c),4]::32 word) = 0x3000000 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40d),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x449),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x424),4]::32 word) = 0x6b326957 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x428),4]::32 word) = 0x3000500 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x42c),4]::32 word) = 0x756d6571 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x438),8]::64 word) = 0x2000000000000 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x440),8]::64 word) = 0x10002000000 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x448),8]::64 word) = 0x78697463656e6f63 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x449),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x449),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x460),8]::64 word) = 0xb666\<close>
declare Q_rep_stos_ESRDI_RAX_addr_0xb663_52_def[Qs]

schematic_goal vpc_create_0_1_0xb663_0xb663_52[blocks]:
  assumes \<open>(P_0xb663_52 && P_0xb663_52_regions) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0xb663 52 \<sigma> \<triangleq> ?\<sigma> \<and> Q_rep_stos_ESRDI_RAX_addr_0xb663_52 ?\<sigma> \<and> block_usage P_0xb663_52_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0xb663_52_def P_0xb663_52_regions_def post: Q_rep_stos_ESRDI_RAX_addr_0xb663_52_def regionset: P_0xb663_52_regions_set_def)

definition P_0xb666_53 :: state_pred where
  \<open>P_0xb666_53 \<sigma> \<equiv> RIP \<sigma> = 0xb666 \<and> RAX \<sigma> = rep_stos_ESRDI_RAX_0xb663_retval \<and> RBX \<sigma> = 0x0 \<and> RCX \<sigma> = 0x40 \<and> RDX \<sigma> = 0x0 \<and> RDI \<sigma> = ((RSP\<^sub>0::64 word) - 0x448) \<and> RSI \<sigma> = 0x600 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x458) \<and> RBP \<sigma> = ((RSP\<^sub>0::64 word) - 0x448) \<and> R15 \<sigma> = ((ucast (((((\<langle>63,0\<rangle>((R14 \<sigma>::64 word) * 0x4)::64 word)::64 word) + 0x1ff)::64 word))::64 word) >> 9) \<and> R13 \<sigma> = ucast ((\<langle>31,0\<rangle>open64_0xb4a1_retval::32 word)) \<and> R12 \<sigma> = ((RSP\<^sub>0::64 word) - 0x448) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40c),4]::32 word) = 0x3000000 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40d),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x449),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x424),4]::32 word) = 0x6b326957 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x428),4]::32 word) = 0x3000500 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x42c),4]::32 word) = 0x756d6571 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x438),8]::64 word) = 0x2000000000000 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x440),8]::64 word) = 0x10002000000 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x448),8]::64 word) = 0x78697463656e6f63 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x449),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x449),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x460),8]::64 word) = 0xb666\<close>
declare P_0xb666_53_def[Ps]

definition P_0xb666_53_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0xb666_53_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((FS\<^sub>0::64 word) + 0x28), 8),
    (2, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x40), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x40c), 4),
    (10, ((RSP\<^sub>0::64 word) - 0x40d), Suc 0),
    (11, ((RSP\<^sub>0::64 word) - 0x424), 4),
    (12, ((RSP\<^sub>0::64 word) - 0x428), 4),
    (13, ((RSP\<^sub>0::64 word) - 0x42c), 4),
    (14, ((RSP\<^sub>0::64 word) - 0x438), 8),
    (15, ((RSP\<^sub>0::64 word) - 0x440), 8),
    (16, ((RSP\<^sub>0::64 word) - 0x448), 8),
    (17, ((RSP\<^sub>0::64 word) - 0x449), Suc 0),
    (18, ((RSP\<^sub>0::64 word) - 0x460), 8)
  }\<close>

definition P_0xb666_53_regions :: state_pred where
  \<open>P_0xb666_53_regions \<sigma> \<equiv> \<exists>regions. P_0xb666_53_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0xb678_53 :: state_pred where
  \<open>Q_0xb678_53 \<sigma> \<equiv> RIP \<sigma> = 0xb678 \<and> RCX \<sigma> = 0x40 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x458) \<and> RBP \<sigma> = ((RSP\<^sub>0::64 word) - 0x448) \<and> R15 \<sigma> = ((ucast (((((\<langle>63,0\<rangle>((R14 \<sigma>::64 word) * 0x4)::64 word)::64 word) + 0x1ff)::64 word))::64 word) >> 9) \<and> R13 \<sigma> = ucast ((\<langle>31,0\<rangle>open64_0xb4a1_retval::32 word)) \<and> R12 \<sigma> = ((RSP\<^sub>0::64 word) - 0x448) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40c),4]::32 word) = 0x3000000 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40d),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x449),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x424),4]::32 word) = 0x6b326957 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x428),4]::32 word) = 0x3000500 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x42c),4]::32 word) = 0x756d6571 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x438),8]::64 word) = 0x2000000000000 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x440),8]::64 word) = 0x10002000000 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x448),8]::64 word) = 0x78697463656e6f63 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x449),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x449),1]::8 word))\<close>
declare Q_0xb678_53_def[Qs]

schematic_goal vpc_create_0_1_0xb666_0xb666_53[blocks]:
  assumes \<open>(P_0xb666_53 && P_0xb666_53_regions) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0xb666 53 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0xb678_53 ?\<sigma> \<and> block_usage P_0xb666_53_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0xb666_53_def P_0xb666_53_regions_def post: Q_0xb678_53_def regionset: P_0xb666_53_regions_set_def)

definition P_0xb678_54 :: state_pred where
  \<open>P_0xb678_54 \<sigma> \<equiv> RIP \<sigma> = 0xb678 \<and> RCX \<sigma> = 0x40 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x458) \<and> RBP \<sigma> = ((RSP\<^sub>0::64 word) - 0x448) \<and> R15 \<sigma> = ((ucast (((((\<langle>63,0\<rangle>((R14 \<sigma>::64 word) * 0x4)::64 word)::64 word) + 0x1ff)::64 word))::64 word) >> 9) \<and> R13 \<sigma> = ucast ((\<langle>31,0\<rangle>open64_0xb4a1_retval::32 word)) \<and> R12 \<sigma> = ((RSP\<^sub>0::64 word) - 0x448) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40c),4]::32 word) = 0x3000000 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40d),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x449),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x424),4]::32 word) = 0x6b326957 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x428),4]::32 word) = 0x3000500 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x42c),4]::32 word) = 0x756d6571 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x438),8]::64 word) = 0x2000000000000 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x440),8]::64 word) = 0x10002000000 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x448),8]::64 word) = 0x78697463656e6f63 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x449),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x449),1]::8 word))\<close>
declare P_0xb678_54_def[Ps]

definition P_0xb678_54_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0xb678_54_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((FS\<^sub>0::64 word) + 0x28), 8),
    (2, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x40), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x40c), 4),
    (10, ((RSP\<^sub>0::64 word) - 0x40d), Suc 0),
    (11, ((RSP\<^sub>0::64 word) - 0x424), 4),
    (12, ((RSP\<^sub>0::64 word) - 0x428), 4),
    (13, ((RSP\<^sub>0::64 word) - 0x42c), 4),
    (14, ((RSP\<^sub>0::64 word) - 0x438), 8),
    (15, ((RSP\<^sub>0::64 word) - 0x440), 8),
    (16, ((RSP\<^sub>0::64 word) - 0x448), 8),
    (17, ((RSP\<^sub>0::64 word) - 0x449), Suc 0)
  }\<close>

definition P_0xb678_54_regions :: state_pred where
  \<open>P_0xb678_54_regions \<sigma> \<equiv> \<exists>regions. P_0xb678_54_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0xb683_54 :: state_pred where
  \<open>Q_0xb683_54 \<sigma> \<equiv> RIP \<sigma> = 0xb683 \<and> RCX \<sigma> = 0x40 \<and> RDX \<sigma> = 0x200 \<and> RSI \<sigma> = ((RSP\<^sub>0::64 word) - 0x448) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x458) \<and> RBP \<sigma> = ((RSP\<^sub>0::64 word) - 0x448) \<and> R15 \<sigma> = ((ucast (((((\<langle>63,0\<rangle>((R14 \<sigma>::64 word) * 0x4)::64 word)::64 word) + 0x1ff)::64 word))::64 word) >> 9) \<and> R13 \<sigma> = ucast ((\<langle>31,0\<rangle>open64_0xb4a1_retval::32 word)) \<and> R12 \<sigma> = ((RSP\<^sub>0::64 word) - 0x448) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40c),4]::32 word) = 0x3000000 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40d),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x449),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x424),4]::32 word) = 0x6b326957 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x428),4]::32 word) = 0x3000500 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x42c),4]::32 word) = 0x756d6571 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x438),8]::64 word) = 0x2000000000000 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x440),8]::64 word) = 0x10002000000 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x448),8]::64 word) = 0x78697463656e6f63 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x449),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x449),1]::8 word))\<close>
declare Q_0xb683_54_def[Qs]

schematic_goal vpc_create_0_3_0xb678_0xb680_54[blocks]:
  assumes \<open>(P_0xb678_54 && P_0xb678_54_regions) \<sigma>\<close>
  shows \<open>exec_block 3 0xb680 54 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0xb683_54 ?\<sigma> \<and> block_usage P_0xb678_54_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0xb678_54_def P_0xb678_54_regions_def post: Q_0xb683_54_def regionset: P_0xb678_54_regions_set_def)

definition P_0xb683_55 :: state_pred where
  \<open>P_0xb683_55 \<sigma> \<equiv> RIP \<sigma> = 0xb683 \<and> RCX \<sigma> = 0x40 \<and> RDX \<sigma> = 0x200 \<and> RSI \<sigma> = ((RSP\<^sub>0::64 word) - 0x448) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x458) \<and> RBP \<sigma> = ((RSP\<^sub>0::64 word) - 0x448) \<and> R15 \<sigma> = ((ucast (((((\<langle>63,0\<rangle>((R14 \<sigma>::64 word) * 0x4)::64 word)::64 word) + 0x1ff)::64 word))::64 word) >> 9) \<and> R13 \<sigma> = ucast ((\<langle>31,0\<rangle>open64_0xb4a1_retval::32 word)) \<and> R12 \<sigma> = ((RSP\<^sub>0::64 word) - 0x448) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40c),4]::32 word) = 0x3000000 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40d),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x449),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x424),4]::32 word) = 0x6b326957 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x428),4]::32 word) = 0x3000500 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x42c),4]::32 word) = 0x756d6571 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x438),8]::64 word) = 0x2000000000000 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x440),8]::64 word) = 0x10002000000 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x448),8]::64 word) = 0x78697463656e6f63 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x449),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x449),1]::8 word))\<close>
declare P_0xb683_55_def[Ps]

definition P_0xb683_55_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0xb683_55_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((FS\<^sub>0::64 word) + 0x28), 8),
    (2, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x40), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x40c), 4),
    (10, ((RSP\<^sub>0::64 word) - 0x40d), Suc 0),
    (11, ((RSP\<^sub>0::64 word) - 0x424), 4),
    (12, ((RSP\<^sub>0::64 word) - 0x428), 4),
    (13, ((RSP\<^sub>0::64 word) - 0x42c), 4),
    (14, ((RSP\<^sub>0::64 word) - 0x438), 8),
    (15, ((RSP\<^sub>0::64 word) - 0x440), 8),
    (16, ((RSP\<^sub>0::64 word) - 0x448), 8),
    (17, ((RSP\<^sub>0::64 word) - 0x449), Suc 0),
    (18, ((RSP\<^sub>0::64 word) - 0x460), 8)
  }\<close>

definition P_0xb683_55_regions :: state_pred where
  \<open>P_0xb683_55_regions \<sigma> \<equiv> \<exists>regions. P_0xb683_55_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_write_addr_0xb683_55 :: state_pred where
  \<open>Q_write_addr_0xb683_55 \<sigma> \<equiv> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x460) \<and> RIP \<sigma> = write_addr \<and> RCX \<sigma> = 0x40 \<and> RDX \<sigma> = 0x200 \<and> RSI \<sigma> = ((RSP\<^sub>0::64 word) - 0x448) \<and> RBP \<sigma> = ((RSP\<^sub>0::64 word) - 0x448) \<and> R15 \<sigma> = ((ucast (((((\<langle>63,0\<rangle>((R14 \<sigma>::64 word) * 0x4)::64 word)::64 word) + 0x1ff)::64 word))::64 word) >> 9) \<and> R13 \<sigma> = ucast ((\<langle>31,0\<rangle>open64_0xb4a1_retval::32 word)) \<and> R12 \<sigma> = ((RSP\<^sub>0::64 word) - 0x448) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40c),4]::32 word) = 0x3000000 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40d),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x449),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x424),4]::32 word) = 0x6b326957 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x428),4]::32 word) = 0x3000500 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x42c),4]::32 word) = 0x756d6571 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x438),8]::64 word) = 0x2000000000000 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x440),8]::64 word) = 0x10002000000 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x448),8]::64 word) = 0x78697463656e6f63 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x449),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x449),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x460),8]::64 word) = 0xb688\<close>
declare Q_write_addr_0xb683_55_def[Qs]

schematic_goal vpc_create_0_1_0xb683_0xb683_55[blocks]:
  assumes \<open>(P_0xb683_55 && P_0xb683_55_regions) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0xb683 55 \<sigma> \<triangleq> ?\<sigma> \<and> Q_write_addr_0xb683_55 ?\<sigma> \<and> block_usage P_0xb683_55_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0xb683_55_def P_0xb683_55_regions_def post: Q_write_addr_0xb683_55_def regionset: P_0xb683_55_regions_set_def)

definition P_0xb688_56 :: state_pred where
  \<open>P_0xb688_56 \<sigma> \<equiv> RIP \<sigma> = 0xb688 \<and> RCX \<sigma> = 0x40 \<and> RDX \<sigma> = 0x200 \<and> RSI \<sigma> = ((RSP\<^sub>0::64 word) - 0x448) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x458) \<and> RBP \<sigma> = ((RSP\<^sub>0::64 word) - 0x448) \<and> R15 \<sigma> = ((ucast (((((\<langle>63,0\<rangle>((R14 \<sigma>::64 word) * 0x4)::64 word)::64 word) + 0x1ff)::64 word))::64 word) >> 9) \<and> R13 \<sigma> = ucast ((\<langle>31,0\<rangle>open64_0xb4a1_retval::32 word)) \<and> R12 \<sigma> = ((RSP\<^sub>0::64 word) - 0x448) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40c),4]::32 word) = 0x3000000 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40d),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x449),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x424),4]::32 word) = 0x6b326957 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x428),4]::32 word) = 0x3000500 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x42c),4]::32 word) = 0x756d6571 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x438),8]::64 word) = 0x2000000000000 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x440),8]::64 word) = 0x10002000000 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x448),8]::64 word) = 0x78697463656e6f63 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x449),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x449),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x460),8]::64 word) = 0xb688\<close>
declare P_0xb688_56_def[Ps]

definition P_0xb688_56_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0xb688_56_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((FS\<^sub>0::64 word) + 0x28), 8),
    (2, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x40), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x40c), 4),
    (10, ((RSP\<^sub>0::64 word) - 0x40d), Suc 0),
    (11, ((RSP\<^sub>0::64 word) - 0x424), 4),
    (12, ((RSP\<^sub>0::64 word) - 0x428), 4),
    (13, ((RSP\<^sub>0::64 word) - 0x42c), 4),
    (14, ((RSP\<^sub>0::64 word) - 0x438), 8),
    (15, ((RSP\<^sub>0::64 word) - 0x440), 8),
    (16, ((RSP\<^sub>0::64 word) - 0x448), 8),
    (17, ((RSP\<^sub>0::64 word) - 0x449), Suc 0),
    (18, ((RSP\<^sub>0::64 word) - 0x460), 8)
  }\<close>

definition P_0xb688_56_regions :: state_pred where
  \<open>P_0xb688_56_regions \<sigma> \<equiv> \<exists>regions. P_0xb688_56_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0xb68e_56 :: state_pred where
  \<open>Q_0xb68e_56 \<sigma> \<equiv> RIP \<sigma> = 0xb68e \<and> RCX \<sigma> = 0x40 \<and> RDX \<sigma> = 0x200 \<and> RSI \<sigma> = ((RSP\<^sub>0::64 word) - 0x448) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x458) \<and> RBP \<sigma> = ((RSP\<^sub>0::64 word) - 0x448) \<and> R15 \<sigma> = ((ucast (((((\<langle>63,0\<rangle>((R14 \<sigma>::64 word) * 0x4)::64 word)::64 word) + 0x1ff)::64 word))::64 word) >> 9) \<and> R13 \<sigma> = ucast ((\<langle>31,0\<rangle>open64_0xb4a1_retval::32 word)) \<and> R12 \<sigma> = ((RSP\<^sub>0::64 word) - 0x448) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40c),4]::32 word) = 0x3000000 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40d),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x449),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x424),4]::32 word) = 0x6b326957 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x428),4]::32 word) = 0x3000500 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x42c),4]::32 word) = 0x756d6571 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x438),8]::64 word) = 0x2000000000000 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x440),8]::64 word) = 0x10002000000 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x448),8]::64 word) = 0x78697463656e6f63 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x449),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x449),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x460),8]::64 word) = 0xb688\<close>
declare Q_0xb68e_56_def[Qs]

schematic_goal vpc_create_0_1_0xb688_0xb688_56[blocks]:
  assumes \<open>(P_0xb688_56 && P_0xb688_56_regions) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0xb688 56 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0xb68e_56 ?\<sigma> \<and> block_usage P_0xb688_56_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0xb688_56_def P_0xb688_56_regions_def post: Q_0xb68e_56_def regionset: P_0xb688_56_regions_set_def)

definition P_0xb68e_true_57 :: state_pred where
  \<open>P_0xb68e_true_57 \<sigma> \<equiv> RIP \<sigma> = 0xb68e \<and> RCX \<sigma> = 0x40 \<and> RDX \<sigma> = 0x200 \<and> RSI \<sigma> = ((RSP\<^sub>0::64 word) - 0x448) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x458) \<and> RBP \<sigma> = ((RSP\<^sub>0::64 word) - 0x448) \<and> R15 \<sigma> = ((ucast (((((\<langle>63,0\<rangle>((R14 \<sigma>::64 word) * 0x4)::64 word)::64 word) + 0x1ff)::64 word))::64 word) >> 9) \<and> R13 \<sigma> = ucast ((\<langle>31,0\<rangle>open64_0xb4a1_retval::32 word)) \<and> R12 \<sigma> = ((RSP\<^sub>0::64 word) - 0x448) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40c),4]::32 word) = 0x3000000 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40d),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x449),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x424),4]::32 word) = 0x6b326957 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x428),4]::32 word) = 0x3000500 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x42c),4]::32 word) = 0x756d6571 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x438),8]::64 word) = 0x2000000000000 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x440),8]::64 word) = 0x10002000000 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x448),8]::64 word) = 0x78697463656e6f63 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x449),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x449),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x460),8]::64 word) = 0xb688\<close>
declare P_0xb68e_true_57_def[Ps]

definition P_0xb68e_true_57_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0xb68e_true_57_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((FS\<^sub>0::64 word) + 0x28), 8),
    (2, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x40), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x40c), 4),
    (10, ((RSP\<^sub>0::64 word) - 0x40d), Suc 0),
    (11, ((RSP\<^sub>0::64 word) - 0x424), 4),
    (12, ((RSP\<^sub>0::64 word) - 0x428), 4),
    (13, ((RSP\<^sub>0::64 word) - 0x42c), 4),
    (14, ((RSP\<^sub>0::64 word) - 0x438), 8),
    (15, ((RSP\<^sub>0::64 word) - 0x440), 8),
    (16, ((RSP\<^sub>0::64 word) - 0x448), 8),
    (17, ((RSP\<^sub>0::64 word) - 0x449), Suc 0),
    (18, ((RSP\<^sub>0::64 word) - 0x460), 8)
  }\<close>

definition P_0xb68e_true_57_regions :: state_pred where
  \<open>P_0xb68e_true_57_regions \<sigma> \<equiv> \<exists>regions. P_0xb68e_true_57_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0xb676_57 :: state_pred where
  \<open>Q_0xb676_57 \<sigma> \<equiv> RIP \<sigma> = 0xb676 \<and> RCX \<sigma> = 0x40 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x458) \<and> RBP \<sigma> = ((RSP\<^sub>0::64 word) - 0x448) \<and> R15 \<sigma> = ((ucast (((((\<langle>63,0\<rangle>((R14 \<sigma>::64 word) * 0x4)::64 word)::64 word) + 0x1ff)::64 word))::64 word) >> 9) \<and> R13 \<sigma> = ucast ((\<langle>31,0\<rangle>open64_0xb4a1_retval::32 word)) \<and> R12 \<sigma> = ((RSP\<^sub>0::64 word) - 0x448) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40c),4]::32 word) = 0x3000000 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40d),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x449),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x424),4]::32 word) = 0x6b326957 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x428),4]::32 word) = 0x3000500 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x42c),4]::32 word) = 0x756d6571 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x438),8]::64 word) = 0x2000000000000 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x440),8]::64 word) = 0x10002000000 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x448),8]::64 word) = 0x78697463656e6f63 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x449),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x449),1]::8 word))\<close>
declare Q_0xb676_57_def[Qs]

schematic_goal vpc_create_0_3_0xb68e_0xb673_57[blocks]:
  assumes \<open>(P_0xb68e_true_57 && P_0xb68e_true_57_regions && ZF) \<sigma>\<close>
  shows \<open>exec_block 3 0xb673 57 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0xb676_57 ?\<sigma> \<and> block_usage P_0xb68e_true_57_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0xb68e_true_57_def P_0xb68e_true_57_regions_def post: Q_0xb676_57_def regionset: P_0xb68e_true_57_regions_set_def)

definition P_0xb676_true_58 :: state_pred where
  \<open>P_0xb676_true_58 \<sigma> \<equiv> RIP \<sigma> = 0xb676 \<and> RCX \<sigma> = 0x40 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x458) \<and> RBP \<sigma> = ((RSP\<^sub>0::64 word) - 0x448) \<and> R15 \<sigma> = ((ucast (((((\<langle>63,0\<rangle>((R14 \<sigma>::64 word) * 0x4)::64 word)::64 word) + 0x1ff)::64 word))::64 word) >> 9) \<and> R13 \<sigma> = ucast ((\<langle>31,0\<rangle>open64_0xb4a1_retval::32 word)) \<and> R12 \<sigma> = ((RSP\<^sub>0::64 word) - 0x448) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40c),4]::32 word) = 0x3000000 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40d),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x449),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x424),4]::32 word) = 0x6b326957 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x428),4]::32 word) = 0x3000500 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x42c),4]::32 word) = 0x756d6571 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x438),8]::64 word) = 0x2000000000000 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x440),8]::64 word) = 0x10002000000 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x448),8]::64 word) = 0x78697463656e6f63 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x449),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x449),1]::8 word))\<close>
declare P_0xb676_true_58_def[Ps]

definition P_0xb676_true_58_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0xb676_true_58_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((FS\<^sub>0::64 word) + 0x28), 8),
    (2, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x40), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x40c), 4),
    (10, ((RSP\<^sub>0::64 word) - 0x40d), Suc 0),
    (11, ((RSP\<^sub>0::64 word) - 0x424), 4),
    (12, ((RSP\<^sub>0::64 word) - 0x428), 4),
    (13, ((RSP\<^sub>0::64 word) - 0x42c), 4),
    (14, ((RSP\<^sub>0::64 word) - 0x438), 8),
    (15, ((RSP\<^sub>0::64 word) - 0x440), 8),
    (16, ((RSP\<^sub>0::64 word) - 0x448), 8),
    (17, ((RSP\<^sub>0::64 word) - 0x449), Suc 0)
  }\<close>

definition P_0xb676_true_58_regions :: state_pred where
  \<open>P_0xb676_true_58_regions \<sigma> \<equiv> \<exists>regions. P_0xb676_true_58_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0xb6e0_58 :: state_pred where
  \<open>Q_0xb6e0_58 \<sigma> \<equiv> RIP \<sigma> = 0xb6e0 \<and> RCX \<sigma> = 0x40 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x458) \<and> RBP \<sigma> = ((RSP\<^sub>0::64 word) - 0x448) \<and> R15 \<sigma> = ((ucast (((((\<langle>63,0\<rangle>((R14 \<sigma>::64 word) * 0x4)::64 word)::64 word) + 0x1ff)::64 word))::64 word) >> 9) \<and> R13 \<sigma> = ucast ((\<langle>31,0\<rangle>open64_0xb4a1_retval::32 word)) \<and> R12 \<sigma> = ((RSP\<^sub>0::64 word) - 0x448) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40c),4]::32 word) = 0x3000000 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40d),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x449),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x424),4]::32 word) = 0x6b326957 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x428),4]::32 word) = 0x3000500 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x42c),4]::32 word) = 0x756d6571 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x438),8]::64 word) = 0x2000000000000 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x440),8]::64 word) = 0x10002000000 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x448),8]::64 word) = 0x78697463656e6f63 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x449),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x449),1]::8 word))\<close>
declare Q_0xb6e0_58_def[Qs]

schematic_goal vpc_create_0_1_0xb676_0xb676_58[blocks]:
  assumes \<open>(P_0xb676_true_58 && P_0xb676_true_58_regions && ZF) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0xb676 58 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0xb6e0_58 ?\<sigma> \<and> block_usage P_0xb676_true_58_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0xb676_true_58_def P_0xb676_true_58_regions_def post: Q_0xb6e0_58_def regionset: P_0xb676_true_58_regions_set_def)

definition P_0xb676_false_59 :: state_pred where
  \<open>P_0xb676_false_59 \<sigma> \<equiv> RIP \<sigma> = 0xb676 \<and> RCX \<sigma> = 0x40 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x458) \<and> RBP \<sigma> = ((RSP\<^sub>0::64 word) - 0x448) \<and> R15 \<sigma> = ((ucast (((((\<langle>63,0\<rangle>((R14 \<sigma>::64 word) * 0x4)::64 word)::64 word) + 0x1ff)::64 word))::64 word) >> 9) \<and> R13 \<sigma> = ucast ((\<langle>31,0\<rangle>open64_0xb4a1_retval::32 word)) \<and> R12 \<sigma> = ((RSP\<^sub>0::64 word) - 0x448) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40c),4]::32 word) = 0x3000000 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40d),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x449),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x424),4]::32 word) = 0x6b326957 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x428),4]::32 word) = 0x3000500 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x42c),4]::32 word) = 0x756d6571 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x438),8]::64 word) = 0x2000000000000 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x440),8]::64 word) = 0x10002000000 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x448),8]::64 word) = 0x78697463656e6f63 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x449),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x449),1]::8 word))\<close>
declare P_0xb676_false_59_def[Ps]

definition P_0xb676_false_59_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0xb676_false_59_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((FS\<^sub>0::64 word) + 0x28), 8),
    (2, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x40), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x40c), 4),
    (10, ((RSP\<^sub>0::64 word) - 0x40d), Suc 0),
    (11, ((RSP\<^sub>0::64 word) - 0x424), 4),
    (12, ((RSP\<^sub>0::64 word) - 0x428), 4),
    (13, ((RSP\<^sub>0::64 word) - 0x42c), 4),
    (14, ((RSP\<^sub>0::64 word) - 0x438), 8),
    (15, ((RSP\<^sub>0::64 word) - 0x440), 8),
    (16, ((RSP\<^sub>0::64 word) - 0x448), 8),
    (17, ((RSP\<^sub>0::64 word) - 0x449), Suc 0)
  }\<close>

definition P_0xb676_false_59_regions :: state_pred where
  \<open>P_0xb676_false_59_regions \<sigma> \<equiv> \<exists>regions. P_0xb676_false_59_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0xb678_59 :: state_pred where
  \<open>Q_0xb678_59 \<sigma> \<equiv> RIP \<sigma> = 0xb678 \<and> RCX \<sigma> = 0x40 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x458) \<and> RBP \<sigma> = ((RSP\<^sub>0::64 word) - 0x448) \<and> R15 \<sigma> = ((ucast (((((\<langle>63,0\<rangle>((R14 \<sigma>::64 word) * 0x4)::64 word)::64 word) + 0x1ff)::64 word))::64 word) >> 9) \<and> R13 \<sigma> = ucast ((\<langle>31,0\<rangle>open64_0xb4a1_retval::32 word)) \<and> R12 \<sigma> = ((RSP\<^sub>0::64 word) - 0x448) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40c),4]::32 word) = 0x3000000 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40d),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x449),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x424),4]::32 word) = 0x6b326957 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x428),4]::32 word) = 0x3000500 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x42c),4]::32 word) = 0x756d6571 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x438),8]::64 word) = 0x2000000000000 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x440),8]::64 word) = 0x10002000000 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x448),8]::64 word) = 0x78697463656e6f63 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x449),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x449),1]::8 word))\<close>
declare Q_0xb678_59_def[Qs]

schematic_goal vpc_create_0_1_0xb676_0xb676_59[blocks]:
  assumes \<open>(P_0xb676_false_59 && P_0xb676_false_59_regions && ! ZF) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0xb676 59 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0xb678_59 ?\<sigma> \<and> block_usage P_0xb676_false_59_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0xb676_false_59_def P_0xb676_false_59_regions_def post: Q_0xb678_59_def regionset: P_0xb676_false_59_regions_set_def)

definition P_0xb68e_false_60 :: state_pred where
  \<open>P_0xb68e_false_60 \<sigma> \<equiv> RIP \<sigma> = 0xb68e \<and> RCX \<sigma> = 0x40 \<and> RDX \<sigma> = 0x200 \<and> RSI \<sigma> = ((RSP\<^sub>0::64 word) - 0x448) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x458) \<and> RBP \<sigma> = ((RSP\<^sub>0::64 word) - 0x448) \<and> R15 \<sigma> = ((ucast (((((\<langle>63,0\<rangle>((R14 \<sigma>::64 word) * 0x4)::64 word)::64 word) + 0x1ff)::64 word))::64 word) >> 9) \<and> R13 \<sigma> = ucast ((\<langle>31,0\<rangle>open64_0xb4a1_retval::32 word)) \<and> R12 \<sigma> = ((RSP\<^sub>0::64 word) - 0x448) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40c),4]::32 word) = 0x3000000 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40d),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x449),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x424),4]::32 word) = 0x6b326957 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x428),4]::32 word) = 0x3000500 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x42c),4]::32 word) = 0x756d6571 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x438),8]::64 word) = 0x2000000000000 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x440),8]::64 word) = 0x10002000000 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x448),8]::64 word) = 0x78697463656e6f63 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x449),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x449),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x460),8]::64 word) = 0xb688\<close>
declare P_0xb68e_false_60_def[Ps]

definition P_0xb68e_false_60_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0xb68e_false_60_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((FS\<^sub>0::64 word) + 0x28), 8),
    (2, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x40), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x40c), 4),
    (10, ((RSP\<^sub>0::64 word) - 0x40d), Suc 0),
    (11, ((RSP\<^sub>0::64 word) - 0x424), 4),
    (12, ((RSP\<^sub>0::64 word) - 0x428), 4),
    (13, ((RSP\<^sub>0::64 word) - 0x42c), 4),
    (14, ((RSP\<^sub>0::64 word) - 0x438), 8),
    (15, ((RSP\<^sub>0::64 word) - 0x440), 8),
    (16, ((RSP\<^sub>0::64 word) - 0x448), 8),
    (17, ((RSP\<^sub>0::64 word) - 0x449), Suc 0),
    (18, ((RSP\<^sub>0::64 word) - 0x460), 8)
  }\<close>

definition P_0xb68e_false_60_regions :: state_pred where
  \<open>P_0xb68e_false_60_regions \<sigma> \<equiv> \<exists>regions. P_0xb68e_false_60_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0xb690_60 :: state_pred where
  \<open>Q_0xb690_60 \<sigma> \<equiv> RIP \<sigma> = 0xb690 \<and> RCX \<sigma> = 0x40 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x458) \<and> RBP \<sigma> = ((RSP\<^sub>0::64 word) - 0x448) \<and> R15 \<sigma> = ((ucast (((((\<langle>63,0\<rangle>((R14 \<sigma>::64 word) * 0x4)::64 word)::64 word) + 0x1ff)::64 word))::64 word) >> 9) \<and> R13 \<sigma> = ucast ((\<langle>31,0\<rangle>open64_0xb4a1_retval::32 word)) \<and> R12 \<sigma> = ((RSP\<^sub>0::64 word) - 0x448) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40c),4]::32 word) = 0x3000000 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40d),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x449),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x424),4]::32 word) = 0x6b326957 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x428),4]::32 word) = 0x3000500 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x42c),4]::32 word) = 0x756d6571 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x438),8]::64 word) = 0x2000000000000 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x440),8]::64 word) = 0x10002000000 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x448),8]::64 word) = 0x78697463656e6f63 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x449),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x449),1]::8 word))\<close>
declare Q_0xb690_60_def[Qs]

schematic_goal vpc_create_0_1_0xb68e_0xb68e_60[blocks]:
  assumes \<open>(P_0xb68e_false_60 && P_0xb68e_false_60_regions && ! ZF) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0xb68e 60 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0xb690_60 ?\<sigma> \<and> block_usage P_0xb68e_false_60_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0xb68e_false_60_def P_0xb68e_false_60_regions_def post: Q_0xb690_60_def regionset: P_0xb68e_false_60_regions_set_def)

definition P_0xb6e0_61 :: state_pred where
  \<open>P_0xb6e0_61 \<sigma> \<equiv> RIP \<sigma> = 0xb6e0 \<and> RCX \<sigma> = 0x40 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x458) \<and> RBP \<sigma> = ((RSP\<^sub>0::64 word) - 0x448) \<and> R15 \<sigma> = ((ucast (((((\<langle>63,0\<rangle>((R14 \<sigma>::64 word) * 0x4)::64 word)::64 word) + 0x1ff)::64 word))::64 word) >> 9) \<and> R13 \<sigma> = ucast ((\<langle>31,0\<rangle>open64_0xb4a1_retval::32 word)) \<and> R12 \<sigma> = ((RSP\<^sub>0::64 word) - 0x448) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40c),4]::32 word) = 0x3000000 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40d),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x449),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x424),4]::32 word) = 0x6b326957 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x428),4]::32 word) = 0x3000500 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x42c),4]::32 word) = 0x756d6571 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x438),8]::64 word) = 0x2000000000000 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x440),8]::64 word) = 0x10002000000 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x448),8]::64 word) = 0x78697463656e6f63 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x449),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x449),1]::8 word))\<close>
declare P_0xb6e0_61_def[Ps]

definition P_0xb6e0_61_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0xb6e0_61_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((FS\<^sub>0::64 word) + 0x28), 8),
    (2, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x40), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x40c), 4),
    (10, ((RSP\<^sub>0::64 word) - 0x40d), Suc 0),
    (11, ((RSP\<^sub>0::64 word) - 0x424), 4),
    (12, ((RSP\<^sub>0::64 word) - 0x428), 4),
    (13, ((RSP\<^sub>0::64 word) - 0x42c), 4),
    (14, ((RSP\<^sub>0::64 word) - 0x438), 8),
    (15, ((RSP\<^sub>0::64 word) - 0x440), 8),
    (16, ((RSP\<^sub>0::64 word) - 0x448), 8),
    (17, ((RSP\<^sub>0::64 word) - 0x449), Suc 0)
  }\<close>

definition P_0xb6e0_61_regions :: state_pred where
  \<open>P_0xb6e0_61_regions \<sigma> \<equiv> \<exists>regions. P_0xb6e0_61_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0xb6ed_61 :: state_pred where
  \<open>Q_0xb6ed_61 \<sigma> \<equiv> RIP \<sigma> = 0xb6ed \<and> RAX \<sigma> = 0x0 \<and> RCX \<sigma> = 0x80 \<and> RDI \<sigma> = ((RSP\<^sub>0::64 word) - 0x448) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x458) \<and> RBP \<sigma> = ((RSP\<^sub>0::64 word) - 0x448) \<and> R13 \<sigma> = ucast ((\<langle>31,0\<rangle>open64_0xb4a1_retval::32 word)) \<and> R12 \<sigma> = ((RSP\<^sub>0::64 word) - 0x448) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40c),4]::32 word) = 0x3000000 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40d),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x449),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x424),4]::32 word) = 0x6b326957 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x428),4]::32 word) = 0x3000500 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x42c),4]::32 word) = 0x756d6571 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x438),8]::64 word) = 0x2000000000000 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x440),8]::64 word) = 0x10002000000 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x448),8]::64 word) = 0x78697463656e6f63 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x449),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x449),1]::8 word))\<close>
declare Q_0xb6ed_61_def[Qs]

schematic_goal vpc_create_0_4_0xb6e0_0xb6ea_61[blocks]:
  assumes \<open>(P_0xb6e0_61 && P_0xb6e0_61_regions) \<sigma>\<close>
  shows \<open>exec_block 4 0xb6ea 61 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0xb6ed_61 ?\<sigma> \<and> block_usage P_0xb6e0_61_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0xb6e0_61_def P_0xb6e0_61_regions_def post: Q_0xb6ed_61_def regionset: P_0xb6e0_61_regions_set_def)

definition P_0xb6ed_62 :: state_pred where
  \<open>P_0xb6ed_62 \<sigma> \<equiv> RIP \<sigma> = 0xb6ed \<and> RAX \<sigma> = 0x0 \<and> RCX \<sigma> = 0x80 \<and> RDI \<sigma> = ((RSP\<^sub>0::64 word) - 0x448) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x458) \<and> RBP \<sigma> = ((RSP\<^sub>0::64 word) - 0x448) \<and> R13 \<sigma> = ucast ((\<langle>31,0\<rangle>open64_0xb4a1_retval::32 word)) \<and> R12 \<sigma> = ((RSP\<^sub>0::64 word) - 0x448) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40c),4]::32 word) = 0x3000000 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40d),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x449),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x424),4]::32 word) = 0x6b326957 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x428),4]::32 word) = 0x3000500 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x42c),4]::32 word) = 0x756d6571 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x438),8]::64 word) = 0x2000000000000 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x440),8]::64 word) = 0x10002000000 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x448),8]::64 word) = 0x78697463656e6f63 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x449),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x449),1]::8 word))\<close>
declare P_0xb6ed_62_def[Ps]

definition P_0xb6ed_62_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0xb6ed_62_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((FS\<^sub>0::64 word) + 0x28), 8),
    (2, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x40), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x40c), 4),
    (10, ((RSP\<^sub>0::64 word) - 0x40d), Suc 0),
    (11, ((RSP\<^sub>0::64 word) - 0x424), 4),
    (12, ((RSP\<^sub>0::64 word) - 0x428), 4),
    (13, ((RSP\<^sub>0::64 word) - 0x42c), 4),
    (14, ((RSP\<^sub>0::64 word) - 0x438), 8),
    (15, ((RSP\<^sub>0::64 word) - 0x440), 8),
    (16, ((RSP\<^sub>0::64 word) - 0x448), 8),
    (17, ((RSP\<^sub>0::64 word) - 0x449), Suc 0),
    (18, ((RSP\<^sub>0::64 word) - 0x460), 8)
  }\<close>

definition P_0xb6ed_62_regions :: state_pred where
  \<open>P_0xb6ed_62_regions \<sigma> \<equiv> \<exists>regions. P_0xb6ed_62_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_rep_stos_ESRDI_RAX_addr_0xb6ed_62 :: state_pred where
  \<open>Q_rep_stos_ESRDI_RAX_addr_0xb6ed_62 \<sigma> \<equiv> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x460) \<and> RIP \<sigma> = rep_stos_ESRDI_RAX_addr \<and> RAX \<sigma> = 0x0 \<and> RCX \<sigma> = 0x80 \<and> RDI \<sigma> = ((RSP\<^sub>0::64 word) - 0x448) \<and> RBP \<sigma> = ((RSP\<^sub>0::64 word) - 0x448) \<and> R13 \<sigma> = ucast ((\<langle>31,0\<rangle>open64_0xb4a1_retval::32 word)) \<and> R12 \<sigma> = ((RSP\<^sub>0::64 word) - 0x448) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40c),4]::32 word) = 0x3000000 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40d),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x449),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x424),4]::32 word) = 0x6b326957 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x428),4]::32 word) = 0x3000500 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x42c),4]::32 word) = 0x756d6571 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x438),8]::64 word) = 0x2000000000000 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x440),8]::64 word) = 0x10002000000 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x448),8]::64 word) = 0x78697463656e6f63 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x449),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x449),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x460),8]::64 word) = 0xb6f0\<close>
declare Q_rep_stos_ESRDI_RAX_addr_0xb6ed_62_def[Qs]

schematic_goal vpc_create_0_1_0xb6ed_0xb6ed_62[blocks]:
  assumes \<open>(P_0xb6ed_62 && P_0xb6ed_62_regions) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0xb6ed 62 \<sigma> \<triangleq> ?\<sigma> \<and> Q_rep_stos_ESRDI_RAX_addr_0xb6ed_62 ?\<sigma> \<and> block_usage P_0xb6ed_62_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0xb6ed_62_def P_0xb6ed_62_regions_def post: Q_rep_stos_ESRDI_RAX_addr_0xb6ed_62_def regionset: P_0xb6ed_62_regions_set_def)

definition P_0xb6f0_63 :: state_pred where
  \<open>P_0xb6f0_63 \<sigma> \<equiv> RIP \<sigma> = 0xb6f0 \<and> RAX \<sigma> = rep_stos_ESRDI_RAX_0xb6ed_retval \<and> RCX \<sigma> = 0x80 \<and> RDI \<sigma> = ((RSP\<^sub>0::64 word) - 0x448) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x458) \<and> RBP \<sigma> = ((RSP\<^sub>0::64 word) - 0x448) \<and> R13 \<sigma> = ucast ((\<langle>31,0\<rangle>open64_0xb4a1_retval::32 word)) \<and> R12 \<sigma> = ((RSP\<^sub>0::64 word) - 0x448) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40c),4]::32 word) = 0x3000000 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40d),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x449),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x424),4]::32 word) = 0x6b326957 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x428),4]::32 word) = 0x3000500 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x42c),4]::32 word) = 0x756d6571 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x438),8]::64 word) = 0x2000000000000 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x440),8]::64 word) = 0x10002000000 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x448),8]::64 word) = 0x78697463656e6f63 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x449),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x449),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x460),8]::64 word) = 0xb6f0\<close>
declare P_0xb6f0_63_def[Ps]

definition P_0xb6f0_63_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0xb6f0_63_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((FS\<^sub>0::64 word) + 0x28), 8),
    (2, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x40), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x40c), 4),
    (10, ((RSP\<^sub>0::64 word) - 0x40d), Suc 0),
    (11, ((RSP\<^sub>0::64 word) - 0x424), 4),
    (12, ((RSP\<^sub>0::64 word) - 0x428), 4),
    (13, ((RSP\<^sub>0::64 word) - 0x42c), 4),
    (14, ((RSP\<^sub>0::64 word) - 0x430), 4),
    (15, ((RSP\<^sub>0::64 word) - 0x438), 8),
    (16, ((RSP\<^sub>0::64 word) - 0x440), 8),
    (17, ((RSP\<^sub>0::64 word) - 0x448), 8),
    (18, ((RSP\<^sub>0::64 word) - 0x449), Suc 0),
    (19, ((RSP\<^sub>0::64 word) - 0x460), 8)
  }\<close>

definition P_0xb6f0_63_regions :: state_pred where
  \<open>P_0xb6f0_63_regions \<sigma> \<equiv> \<exists>regions. P_0xb6f0_63_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0xb740_63 :: state_pred where
  \<open>Q_0xb740_63 \<sigma> \<equiv> RIP \<sigma> = 0xb740 \<and> RCX \<sigma> = ((RSP\<^sub>0::64 word) - 0x48) \<and> RDI \<sigma> = ((RSP\<^sub>0::64 word) - 0x448) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x458) \<and> RBP \<sigma> = ((RSP\<^sub>0::64 word) - 0x448) \<and> R13 \<sigma> = ucast ((\<langle>31,0\<rangle>open64_0xb4a1_retval::32 word)) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40c),4]::32 word) = 0x3000000 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40d),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x449),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x424),4]::32 word) = 0x6b326957 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x428),4]::32 word) = 0x2000 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x42c),4]::32 word) = ucast ((\<langle>31,0\<rangle>R14 \<sigma>::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x430),4]::32 word) = 0x100 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x438),8]::64 word) = 0x6000000000000 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x440),8]::64 word) = 0xffffffff00000000 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x448),8]::64 word) = 0x6573726170737863 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x449),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x449),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x460),8]::64 word) = 0xb6f0\<close>
declare Q_0xb740_63_def[Qs]

schematic_goal vpc_create_0_12_0xb6f0_0xb73a_63[blocks]:
  assumes \<open>(P_0xb6f0_63 && P_0xb6f0_63_regions) \<sigma>\<close>
  shows \<open>exec_block 12 0xb73a 63 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0xb740_63 ?\<sigma> \<and> block_usage P_0xb6f0_63_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0xb6f0_63_def P_0xb6f0_63_regions_def post: Q_0xb740_63_def regionset: P_0xb6f0_63_regions_set_def)

definition P_0xb740_64 :: state_pred where
  \<open>P_0xb740_64 \<sigma> \<equiv> RIP \<sigma> = 0xb740 \<and> RCX \<sigma> = ((RSP\<^sub>0::64 word) - 0x48) \<and> RDI \<sigma> = ((RSP\<^sub>0::64 word) - 0x448) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x458) \<and> RBP \<sigma> = ((RSP\<^sub>0::64 word) - 0x448) \<and> R13 \<sigma> = ucast ((\<langle>31,0\<rangle>open64_0xb4a1_retval::32 word)) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40c),4]::32 word) = 0x3000000 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40d),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x449),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x424),4]::32 word) = 0x6b326957 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x428),4]::32 word) = 0x2000 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x42c),4]::32 word) = ucast ((\<langle>31,0\<rangle>R14 \<sigma>::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x430),4]::32 word) = 0x100 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x438),8]::64 word) = 0x6000000000000 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x440),8]::64 word) = 0xffffffff00000000 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x448),8]::64 word) = 0x6573726170737863 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x449),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x449),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x460),8]::64 word) = 0xb6f0\<close>
declare P_0xb740_64_def[Ps]

definition P_0xb740_64_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0xb740_64_regions_set \<sigma> \<equiv> {
    (0, R12 \<sigma>, Suc 0),
    (1, RSP\<^sub>0, 8),
    (2, ((FS\<^sub>0::64 word) + 0x28), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x40), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x40c), 4),
    (11, ((RSP\<^sub>0::64 word) - 0x40d), Suc 0),
    (12, ((RSP\<^sub>0::64 word) - 0x424), 4),
    (13, ((RSP\<^sub>0::64 word) - 0x428), 4),
    (14, ((RSP\<^sub>0::64 word) - 0x42c), 4),
    (15, ((RSP\<^sub>0::64 word) - 0x430), 4),
    (16, ((RSP\<^sub>0::64 word) - 0x438), 8),
    (17, ((RSP\<^sub>0::64 word) - 0x440), 8),
    (18, ((RSP\<^sub>0::64 word) - 0x448), 8),
    (19, ((RSP\<^sub>0::64 word) - 0x449), Suc 0),
    (20, ((RSP\<^sub>0::64 word) - 0x460), 8)
  }\<close>

definition P_0xb740_64_regions :: state_pred where
  \<open>P_0xb740_64_regions \<sigma> \<equiv> \<exists>regions. P_0xb740_64_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0xb74e_64 :: state_pred where
  \<open>Q_0xb74e_64 \<sigma> \<equiv> RIP \<sigma> = 0xb74e \<and> RCX \<sigma> = ((RSP\<^sub>0::64 word) - 0x48) \<and> RDI \<sigma> = ((RSP\<^sub>0::64 word) - 0x448) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x458) \<and> RBP \<sigma> = ((RSP\<^sub>0::64 word) - 0x448) \<and> R13 \<sigma> = ucast ((\<langle>31,0\<rangle>open64_0xb4a1_retval::32 word)) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40c),4]::32 word) = 0x3000000 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40d),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x449),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x424),4]::32 word) = 0x6b326957 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x428),4]::32 word) = 0x2000 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x42c),4]::32 word) = ucast ((\<langle>31,0\<rangle>R14 \<sigma>::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x430),4]::32 word) = 0x100 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x438),8]::64 word) = 0x6000000000000 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x440),8]::64 word) = 0xffffffff00000000 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x448),8]::64 word) = 0x6573726170737863 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x449),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x449),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x460),8]::64 word) = 0xb6f0\<close>
declare Q_0xb74e_64_def[Qs]

schematic_goal vpc_create_0_4_0xb740_0xb74b_64[blocks]:
  assumes \<open>(P_0xb740_64 && P_0xb740_64_regions) \<sigma>\<close>
  shows \<open>exec_block 4 0xb74b 64 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0xb74e_64 ?\<sigma> \<and> block_usage P_0xb740_64_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0xb740_64_def P_0xb740_64_regions_def post: Q_0xb74e_64_def regionset: P_0xb740_64_regions_set_def)

definition P_0xb74e_true_65 :: state_pred where
  \<open>P_0xb74e_true_65 \<sigma> \<equiv> RIP \<sigma> = 0xb74e \<and> RCX \<sigma> = ((RSP\<^sub>0::64 word) - 0x48) \<and> RDI \<sigma> = ((RSP\<^sub>0::64 word) - 0x448) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x458) \<and> RBP \<sigma> = ((RSP\<^sub>0::64 word) - 0x448) \<and> R13 \<sigma> = ucast ((\<langle>31,0\<rangle>open64_0xb4a1_retval::32 word)) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40c),4]::32 word) = 0x3000000 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40d),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x449),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x424),4]::32 word) = 0x6b326957 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x428),4]::32 word) = 0x2000 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x42c),4]::32 word) = ucast ((\<langle>31,0\<rangle>R14 \<sigma>::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x430),4]::32 word) = 0x100 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x438),8]::64 word) = 0x6000000000000 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x440),8]::64 word) = 0xffffffff00000000 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x448),8]::64 word) = 0x6573726170737863 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x449),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x449),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x460),8]::64 word) = 0xb6f0\<close>
declare P_0xb74e_true_65_def[Ps]

definition P_0xb74e_true_65_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0xb74e_true_65_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((FS\<^sub>0::64 word) + 0x28), 8),
    (2, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x40), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x40c), 4),
    (10, ((RSP\<^sub>0::64 word) - 0x40d), Suc 0),
    (11, ((RSP\<^sub>0::64 word) - 0x424), 4),
    (12, ((RSP\<^sub>0::64 word) - 0x428), 4),
    (13, ((RSP\<^sub>0::64 word) - 0x42c), 4),
    (14, ((RSP\<^sub>0::64 word) - 0x430), 4),
    (15, ((RSP\<^sub>0::64 word) - 0x438), 8),
    (16, ((RSP\<^sub>0::64 word) - 0x440), 8),
    (17, ((RSP\<^sub>0::64 word) - 0x448), 8),
    (18, ((RSP\<^sub>0::64 word) - 0x449), Suc 0),
    (19, ((RSP\<^sub>0::64 word) - 0x460), 8)
  }\<close>

definition P_0xb74e_true_65_regions :: state_pred where
  \<open>P_0xb74e_true_65_regions \<sigma> \<equiv> \<exists>regions. P_0xb74e_true_65_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0xb740_65 :: state_pred where
  \<open>Q_0xb740_65 \<sigma> \<equiv> RIP \<sigma> = 0xb740 \<and> RCX \<sigma> = ((RSP\<^sub>0::64 word) - 0x48) \<and> RDI \<sigma> = ((RSP\<^sub>0::64 word) - 0x448) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x458) \<and> RBP \<sigma> = ((RSP\<^sub>0::64 word) - 0x448) \<and> R13 \<sigma> = ucast ((\<langle>31,0\<rangle>open64_0xb4a1_retval::32 word)) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40c),4]::32 word) = 0x3000000 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40d),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x449),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x424),4]::32 word) = 0x6b326957 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x428),4]::32 word) = 0x2000 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x42c),4]::32 word) = ucast ((\<langle>31,0\<rangle>R14 \<sigma>::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x430),4]::32 word) = 0x100 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x438),8]::64 word) = 0x6000000000000 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x440),8]::64 word) = 0xffffffff00000000 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x448),8]::64 word) = 0x6573726170737863 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x449),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x449),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x460),8]::64 word) = 0xb6f0\<close>
declare Q_0xb740_65_def[Qs]

schematic_goal vpc_create_0_1_0xb74e_0xb74e_65[blocks]:
  assumes \<open>(P_0xb74e_true_65 && P_0xb74e_true_65_regions && !ZF) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0xb74e 65 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0xb740_65 ?\<sigma> \<and> block_usage P_0xb74e_true_65_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0xb74e_true_65_def P_0xb74e_true_65_regions_def post: Q_0xb740_65_def regionset: P_0xb74e_true_65_regions_set_def)

definition P_0xb74e_false_66 :: state_pred where
  \<open>P_0xb74e_false_66 \<sigma> \<equiv> RIP \<sigma> = 0xb74e \<and> RCX \<sigma> = ((RSP\<^sub>0::64 word) - 0x48) \<and> RDI \<sigma> = ((RSP\<^sub>0::64 word) - 0x448) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x458) \<and> RBP \<sigma> = ((RSP\<^sub>0::64 word) - 0x448) \<and> R13 \<sigma> = ucast ((\<langle>31,0\<rangle>open64_0xb4a1_retval::32 word)) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40c),4]::32 word) = 0x3000000 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40d),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x449),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x424),4]::32 word) = 0x6b326957 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x428),4]::32 word) = 0x2000 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x42c),4]::32 word) = ucast ((\<langle>31,0\<rangle>R14 \<sigma>::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x430),4]::32 word) = 0x100 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x438),8]::64 word) = 0x6000000000000 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x440),8]::64 word) = 0xffffffff00000000 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x448),8]::64 word) = 0x6573726170737863 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x449),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x449),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x460),8]::64 word) = 0xb6f0\<close>
declare P_0xb74e_false_66_def[Ps]

definition P_0xb74e_false_66_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0xb74e_false_66_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((FS\<^sub>0::64 word) + 0x28), 8),
    (2, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x40), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x40c), 4),
    (10, ((RSP\<^sub>0::64 word) - 0x40d), Suc 0),
    (11, ((RSP\<^sub>0::64 word) - 0x424), 4),
    (12, ((RSP\<^sub>0::64 word) - 0x428), 4),
    (13, ((RSP\<^sub>0::64 word) - 0x42c), 4),
    (14, ((RSP\<^sub>0::64 word) - 0x430), 4),
    (15, ((RSP\<^sub>0::64 word) - 0x438), 8),
    (16, ((RSP\<^sub>0::64 word) - 0x440), 8),
    (17, ((RSP\<^sub>0::64 word) - 0x448), 8),
    (18, ((RSP\<^sub>0::64 word) - 0x449), Suc 0),
    (19, ((RSP\<^sub>0::64 word) - 0x460), 8)
  }\<close>

definition P_0xb74e_false_66_regions :: state_pred where
  \<open>P_0xb74e_false_66_regions \<sigma> \<equiv> \<exists>regions. P_0xb74e_false_66_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0xb750_66 :: state_pred where
  \<open>Q_0xb750_66 \<sigma> \<equiv> RIP \<sigma> = 0xb750 \<and> RCX \<sigma> = ((RSP\<^sub>0::64 word) - 0x48) \<and> RDI \<sigma> = ((RSP\<^sub>0::64 word) - 0x448) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x458) \<and> RBP \<sigma> = ((RSP\<^sub>0::64 word) - 0x448) \<and> R13 \<sigma> = ucast ((\<langle>31,0\<rangle>open64_0xb4a1_retval::32 word)) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40c),4]::32 word) = 0x3000000 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40d),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x449),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x424),4]::32 word) = 0x6b326957 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x428),4]::32 word) = 0x2000 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x42c),4]::32 word) = ucast ((\<langle>31,0\<rangle>R14 \<sigma>::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x430),4]::32 word) = 0x100 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x438),8]::64 word) = 0x6000000000000 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x440),8]::64 word) = 0xffffffff00000000 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x448),8]::64 word) = 0x6573726170737863 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x449),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x449),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x460),8]::64 word) = 0xb6f0\<close>
declare Q_0xb750_66_def[Qs]

schematic_goal vpc_create_0_1_0xb74e_0xb74e_66[blocks]:
  assumes \<open>(P_0xb74e_false_66 && P_0xb74e_false_66_regions && ! !ZF) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0xb74e 66 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0xb750_66 ?\<sigma> \<and> block_usage P_0xb74e_false_66_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0xb74e_false_66_def P_0xb74e_false_66_regions_def post: Q_0xb750_66_def regionset: P_0xb74e_false_66_regions_set_def)

definition P_0xb750_67 :: state_pred where
  \<open>P_0xb750_67 \<sigma> \<equiv> RIP \<sigma> = 0xb750 \<and> RCX \<sigma> = ((RSP\<^sub>0::64 word) - 0x48) \<and> RDI \<sigma> = ((RSP\<^sub>0::64 word) - 0x448) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x458) \<and> RBP \<sigma> = ((RSP\<^sub>0::64 word) - 0x448) \<and> R13 \<sigma> = ucast ((\<langle>31,0\<rangle>open64_0xb4a1_retval::32 word)) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40c),4]::32 word) = 0x3000000 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40d),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x449),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x424),4]::32 word) = 0x6b326957 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x428),4]::32 word) = 0x2000 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x42c),4]::32 word) = ucast ((\<langle>31,0\<rangle>R14 \<sigma>::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x430),4]::32 word) = 0x100 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x438),8]::64 word) = 0x6000000000000 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x440),8]::64 word) = 0xffffffff00000000 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x448),8]::64 word) = 0x6573726170737863 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x449),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x449),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x460),8]::64 word) = 0xb6f0\<close>
declare P_0xb750_67_def[Ps]

definition P_0xb750_67_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0xb750_67_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((FS\<^sub>0::64 word) + 0x28), 8),
    (2, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x40), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x40c), 4),
    (10, ((RSP\<^sub>0::64 word) - 0x40d), Suc 0),
    (11, ((RSP\<^sub>0::64 word) - 0x424), 4),
    (12, ((RSP\<^sub>0::64 word) - 0x428), 4),
    (13, ((RSP\<^sub>0::64 word) - 0x42c), 4),
    (14, ((RSP\<^sub>0::64 word) - 0x430), 4),
    (15, ((RSP\<^sub>0::64 word) - 0x438), 8),
    (16, ((RSP\<^sub>0::64 word) - 0x440), 8),
    (17, ((RSP\<^sub>0::64 word) - 0x448), 8),
    (18, ((RSP\<^sub>0::64 word) - 0x449), Suc 0),
    (19, ((RSP\<^sub>0::64 word) - 0x460), 8)
  }\<close>

definition P_0xb750_67_regions :: state_pred where
  \<open>P_0xb750_67_regions \<sigma> \<equiv> \<exists>regions. P_0xb750_67_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0xb762_67 :: state_pred where
  \<open>Q_0xb762_67 \<sigma> \<equiv> RIP \<sigma> = 0xb762 \<and> RCX \<sigma> = ((RSP\<^sub>0::64 word) - 0x48) \<and> RDX \<sigma> = 0x0 \<and> RDI \<sigma> = ucast ((\<langle>31,0\<rangle>open64_0xb4a1_retval::32 word)) \<and> RSI \<sigma> = 0x200 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x458) \<and> RBP \<sigma> = ((RSP\<^sub>0::64 word) - 0x448) \<and> R13 \<sigma> = ucast ((\<langle>31,0\<rangle>open64_0xb4a1_retval::32 word)) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40c),4]::32 word) = 0x3000000 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40d),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x449),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x428),4]::32 word) = 0x2000 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x42c),4]::32 word) = ucast ((\<langle>31,0\<rangle>R14 \<sigma>::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x430),4]::32 word) = 0x100 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x438),8]::64 word) = 0x6000000000000 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x440),8]::64 word) = 0xffffffff00000000 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x448),8]::64 word) = 0x6573726170737863 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x449),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x449),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x460),8]::64 word) = 0xb6f0\<close>
declare Q_0xb762_67_def[Qs]

schematic_goal vpc_create_0_6_0xb750_0xb75e_67[blocks]:
  assumes \<open>(P_0xb750_67 && P_0xb750_67_regions) \<sigma>\<close>
  shows \<open>exec_block 6 0xb75e 67 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0xb762_67 ?\<sigma> \<and> block_usage P_0xb750_67_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0xb750_67_def P_0xb750_67_regions_def post: Q_0xb762_67_def regionset: P_0xb750_67_regions_set_def)

definition P_0xb762_68 :: state_pred where
  \<open>P_0xb762_68 \<sigma> \<equiv> RIP \<sigma> = 0xb762 \<and> RCX \<sigma> = ((RSP\<^sub>0::64 word) - 0x48) \<and> RDX \<sigma> = 0x0 \<and> RDI \<sigma> = ucast ((\<langle>31,0\<rangle>open64_0xb4a1_retval::32 word)) \<and> RSI \<sigma> = 0x200 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x458) \<and> RBP \<sigma> = ((RSP\<^sub>0::64 word) - 0x448) \<and> R13 \<sigma> = ucast ((\<langle>31,0\<rangle>open64_0xb4a1_retval::32 word)) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40c),4]::32 word) = 0x3000000 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40d),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x449),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x428),4]::32 word) = 0x2000 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x42c),4]::32 word) = ucast ((\<langle>31,0\<rangle>R14 \<sigma>::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x430),4]::32 word) = 0x100 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x438),8]::64 word) = 0x6000000000000 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x440),8]::64 word) = 0xffffffff00000000 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x448),8]::64 word) = 0x6573726170737863 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x449),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x449),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x460),8]::64 word) = 0xb6f0\<close>
declare P_0xb762_68_def[Ps]

definition P_0xb762_68_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0xb762_68_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((FS\<^sub>0::64 word) + 0x28), 8),
    (2, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x40), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x40c), 4),
    (10, ((RSP\<^sub>0::64 word) - 0x40d), Suc 0),
    (11, ((RSP\<^sub>0::64 word) - 0x428), 4),
    (12, ((RSP\<^sub>0::64 word) - 0x42c), 4),
    (13, ((RSP\<^sub>0::64 word) - 0x430), 4),
    (14, ((RSP\<^sub>0::64 word) - 0x438), 8),
    (15, ((RSP\<^sub>0::64 word) - 0x440), 8),
    (16, ((RSP\<^sub>0::64 word) - 0x448), 8),
    (17, ((RSP\<^sub>0::64 word) - 0x449), Suc 0),
    (18, ((RSP\<^sub>0::64 word) - 0x460), 8)
  }\<close>

definition P_0xb762_68_regions :: state_pred where
  \<open>P_0xb762_68_regions \<sigma> \<equiv> \<exists>regions. P_0xb762_68_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_lseek64_addr_0xb762_68 :: state_pred where
  \<open>Q_lseek64_addr_0xb762_68 \<sigma> \<equiv> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x460) \<and> RIP \<sigma> = lseek64_addr \<and> RCX \<sigma> = ((RSP\<^sub>0::64 word) - 0x48) \<and> RDX \<sigma> = 0x0 \<and> RDI \<sigma> = ucast ((\<langle>31,0\<rangle>open64_0xb4a1_retval::32 word)) \<and> RSI \<sigma> = 0x200 \<and> RBP \<sigma> = ((RSP\<^sub>0::64 word) - 0x448) \<and> R13 \<sigma> = ucast ((\<langle>31,0\<rangle>open64_0xb4a1_retval::32 word)) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40c),4]::32 word) = 0x3000000 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40d),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x449),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x428),4]::32 word) = 0x2000 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x42c),4]::32 word) = ucast ((\<langle>31,0\<rangle>R14 \<sigma>::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x430),4]::32 word) = 0x100 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x438),8]::64 word) = 0x6000000000000 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x440),8]::64 word) = 0xffffffff00000000 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x448),8]::64 word) = 0x6573726170737863 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x449),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x449),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x460),8]::64 word) = 0xb767\<close>
declare Q_lseek64_addr_0xb762_68_def[Qs]

schematic_goal vpc_create_0_1_0xb762_0xb762_68[blocks]:
  assumes \<open>(P_0xb762_68 && P_0xb762_68_regions) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0xb762 68 \<sigma> \<triangleq> ?\<sigma> \<and> Q_lseek64_addr_0xb762_68 ?\<sigma> \<and> block_usage P_0xb762_68_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0xb762_68_def P_0xb762_68_regions_def post: Q_lseek64_addr_0xb762_68_def regionset: P_0xb762_68_regions_set_def)

definition P_0xb767_69 :: state_pred where
  \<open>P_0xb767_69 \<sigma> \<equiv> RIP \<sigma> = 0xb767 \<and> RCX \<sigma> = ((RSP\<^sub>0::64 word) - 0x48) \<and> RDX \<sigma> = 0x0 \<and> RDI \<sigma> = ucast ((\<langle>31,0\<rangle>open64_0xb4a1_retval::32 word)) \<and> RSI \<sigma> = 0x200 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x458) \<and> RBP \<sigma> = ((RSP\<^sub>0::64 word) - 0x448) \<and> R13 \<sigma> = ucast ((\<langle>31,0\<rangle>open64_0xb4a1_retval::32 word)) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40c),4]::32 word) = 0x3000000 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40d),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x449),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x428),4]::32 word) = 0x2000 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x42c),4]::32 word) = ucast ((\<langle>31,0\<rangle>R14 \<sigma>::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x430),4]::32 word) = 0x100 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x438),8]::64 word) = 0x6000000000000 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x440),8]::64 word) = 0xffffffff00000000 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x448),8]::64 word) = 0x6573726170737863 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x449),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x449),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x460),8]::64 word) = 0xb767\<close>
declare P_0xb767_69_def[Ps]

definition P_0xb767_69_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0xb767_69_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((FS\<^sub>0::64 word) + 0x28), 8),
    (2, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x40), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x40c), 4),
    (10, ((RSP\<^sub>0::64 word) - 0x40d), Suc 0),
    (11, ((RSP\<^sub>0::64 word) - 0x428), 4),
    (12, ((RSP\<^sub>0::64 word) - 0x42c), 4),
    (13, ((RSP\<^sub>0::64 word) - 0x430), 4),
    (14, ((RSP\<^sub>0::64 word) - 0x438), 8),
    (15, ((RSP\<^sub>0::64 word) - 0x440), 8),
    (16, ((RSP\<^sub>0::64 word) - 0x448), 8),
    (17, ((RSP\<^sub>0::64 word) - 0x449), Suc 0),
    (18, ((RSP\<^sub>0::64 word) - 0x460), 8)
  }\<close>

definition P_0xb767_69_regions :: state_pred where
  \<open>P_0xb767_69_regions \<sigma> \<equiv> \<exists>regions. P_0xb767_69_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0xb76a_69 :: state_pred where
  \<open>Q_0xb76a_69 \<sigma> \<equiv> RIP \<sigma> = 0xb76a \<and> RCX \<sigma> = ((RSP\<^sub>0::64 word) - 0x48) \<and> RDX \<sigma> = 0x0 \<and> RDI \<sigma> = ucast ((\<langle>31,0\<rangle>open64_0xb4a1_retval::32 word)) \<and> RSI \<sigma> = 0x200 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x458) \<and> RBP \<sigma> = ((RSP\<^sub>0::64 word) - 0x448) \<and> R13 \<sigma> = ucast ((\<langle>31,0\<rangle>open64_0xb4a1_retval::32 word)) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40c),4]::32 word) = 0x3000000 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40d),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x449),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x428),4]::32 word) = 0x2000 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x42c),4]::32 word) = ucast ((\<langle>31,0\<rangle>R14 \<sigma>::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x430),4]::32 word) = 0x100 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x438),8]::64 word) = 0x6000000000000 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x440),8]::64 word) = 0xffffffff00000000 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x448),8]::64 word) = 0x6573726170737863 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x449),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x449),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x460),8]::64 word) = 0xb767\<close>
declare Q_0xb76a_69_def[Qs]

schematic_goal vpc_create_0_1_0xb767_0xb767_69[blocks]:
  assumes \<open>(P_0xb767_69 && P_0xb767_69_regions) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0xb767 69 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0xb76a_69 ?\<sigma> \<and> block_usage P_0xb767_69_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0xb767_69_def P_0xb767_69_regions_def post: Q_0xb76a_69_def regionset: P_0xb767_69_regions_set_def)

definition P_0xb76a_true_70 :: state_pred where
  \<open>P_0xb76a_true_70 \<sigma> \<equiv> RIP \<sigma> = 0xb76a \<and> RCX \<sigma> = ((RSP\<^sub>0::64 word) - 0x48) \<and> RDX \<sigma> = 0x0 \<and> RDI \<sigma> = ucast ((\<langle>31,0\<rangle>open64_0xb4a1_retval::32 word)) \<and> RSI \<sigma> = 0x200 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x458) \<and> RBP \<sigma> = ((RSP\<^sub>0::64 word) - 0x448) \<and> R13 \<sigma> = ucast ((\<langle>31,0\<rangle>open64_0xb4a1_retval::32 word)) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40c),4]::32 word) = 0x3000000 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40d),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x449),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x428),4]::32 word) = 0x2000 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x42c),4]::32 word) = ucast ((\<langle>31,0\<rangle>R14 \<sigma>::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x430),4]::32 word) = 0x100 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x438),8]::64 word) = 0x6000000000000 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x440),8]::64 word) = 0xffffffff00000000 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x448),8]::64 word) = 0x6573726170737863 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x449),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x449),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x460),8]::64 word) = 0xb767\<close>
declare P_0xb76a_true_70_def[Ps]

definition P_0xb76a_true_70_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0xb76a_true_70_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((FS\<^sub>0::64 word) + 0x28), 8),
    (2, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x40), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x40c), 4),
    (10, ((RSP\<^sub>0::64 word) - 0x40d), Suc 0),
    (11, ((RSP\<^sub>0::64 word) - 0x428), 4),
    (12, ((RSP\<^sub>0::64 word) - 0x42c), 4),
    (13, ((RSP\<^sub>0::64 word) - 0x430), 4),
    (14, ((RSP\<^sub>0::64 word) - 0x438), 8),
    (15, ((RSP\<^sub>0::64 word) - 0x440), 8),
    (16, ((RSP\<^sub>0::64 word) - 0x448), 8),
    (17, ((RSP\<^sub>0::64 word) - 0x449), Suc 0),
    (18, ((RSP\<^sub>0::64 word) - 0x460), 8)
  }\<close>

definition P_0xb76a_true_70_regions :: state_pred where
  \<open>P_0xb76a_true_70_regions \<sigma> \<equiv> \<exists>regions. P_0xb76a_true_70_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0xb695_70 :: state_pred where
  \<open>Q_0xb695_70 \<sigma> \<equiv> RIP \<sigma> = 0xb695 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x458) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word)\<close>
declare Q_0xb695_70_def[Qs]

schematic_goal vpc_create_0_2_0xb76a_0xb690_70[blocks]:
  assumes \<open>(P_0xb76a_true_70 && P_0xb76a_true_70_regions && SF) \<sigma>\<close>
  shows \<open>exec_block 2 0xb690 70 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0xb695_70 ?\<sigma> \<and> block_usage P_0xb76a_true_70_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0xb76a_true_70_def P_0xb76a_true_70_regions_def post: Q_0xb695_70_def regionset: P_0xb76a_true_70_regions_set_def)

definition P_0xb76a_false_71 :: state_pred where
  \<open>P_0xb76a_false_71 \<sigma> \<equiv> RIP \<sigma> = 0xb76a \<and> RCX \<sigma> = ((RSP\<^sub>0::64 word) - 0x48) \<and> RDX \<sigma> = 0x0 \<and> RDI \<sigma> = ucast ((\<langle>31,0\<rangle>open64_0xb4a1_retval::32 word)) \<and> RSI \<sigma> = 0x200 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x458) \<and> RBP \<sigma> = ((RSP\<^sub>0::64 word) - 0x448) \<and> R13 \<sigma> = ucast ((\<langle>31,0\<rangle>open64_0xb4a1_retval::32 word)) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40c),4]::32 word) = 0x3000000 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40d),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x449),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x428),4]::32 word) = 0x2000 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x42c),4]::32 word) = ucast ((\<langle>31,0\<rangle>R14 \<sigma>::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x430),4]::32 word) = 0x100 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x438),8]::64 word) = 0x6000000000000 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x440),8]::64 word) = 0xffffffff00000000 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x448),8]::64 word) = 0x6573726170737863 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x449),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x449),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x460),8]::64 word) = 0xb767\<close>
declare P_0xb76a_false_71_def[Ps]

definition P_0xb76a_false_71_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0xb76a_false_71_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((FS\<^sub>0::64 word) + 0x28), 8),
    (2, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x40), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x40c), 4),
    (10, ((RSP\<^sub>0::64 word) - 0x40d), Suc 0),
    (11, ((RSP\<^sub>0::64 word) - 0x428), 4),
    (12, ((RSP\<^sub>0::64 word) - 0x42c), 4),
    (13, ((RSP\<^sub>0::64 word) - 0x430), 4),
    (14, ((RSP\<^sub>0::64 word) - 0x438), 8),
    (15, ((RSP\<^sub>0::64 word) - 0x440), 8),
    (16, ((RSP\<^sub>0::64 word) - 0x448), 8),
    (17, ((RSP\<^sub>0::64 word) - 0x449), Suc 0),
    (18, ((RSP\<^sub>0::64 word) - 0x460), 8)
  }\<close>

definition P_0xb76a_false_71_regions :: state_pred where
  \<open>P_0xb76a_false_71_regions \<sigma> \<equiv> \<exists>regions. P_0xb76a_false_71_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0xb77b_71 :: state_pred where
  \<open>Q_0xb77b_71 \<sigma> \<equiv> RIP \<sigma> = 0xb77b \<and> RCX \<sigma> = ((RSP\<^sub>0::64 word) - 0x48) \<and> RDX \<sigma> = 0x400 \<and> RDI \<sigma> = ucast ((\<langle>31,0\<rangle>open64_0xb4a1_retval::32 word)) \<and> RSI \<sigma> = ((RSP\<^sub>0::64 word) - 0x448) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x458) \<and> RBP \<sigma> = ((RSP\<^sub>0::64 word) - 0x448) \<and> R13 \<sigma> = ucast ((\<langle>31,0\<rangle>open64_0xb4a1_retval::32 word)) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40c),4]::32 word) = 0x3000000 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40d),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x449),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x428),4]::32 word) = 0x2000 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x42c),4]::32 word) = ucast ((\<langle>31,0\<rangle>R14 \<sigma>::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x430),4]::32 word) = 0x100 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x438),8]::64 word) = 0x6000000000000 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x440),8]::64 word) = 0xffffffff00000000 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x448),8]::64 word) = 0x6573726170737863 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x449),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x449),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x460),8]::64 word) = 0xb767\<close>
declare Q_0xb77b_71_def[Qs]

schematic_goal vpc_create_0_4_0xb76a_0xb778_71[blocks]:
  assumes \<open>(P_0xb76a_false_71 && P_0xb76a_false_71_regions && ! SF) \<sigma>\<close>
  shows \<open>exec_block 4 0xb778 71 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0xb77b_71 ?\<sigma> \<and> block_usage P_0xb76a_false_71_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0xb76a_false_71_def P_0xb76a_false_71_regions_def post: Q_0xb77b_71_def regionset: P_0xb76a_false_71_regions_set_def)

definition P_0xb77b_72 :: state_pred where
  \<open>P_0xb77b_72 \<sigma> \<equiv> RIP \<sigma> = 0xb77b \<and> RCX \<sigma> = ((RSP\<^sub>0::64 word) - 0x48) \<and> RDX \<sigma> = 0x400 \<and> RDI \<sigma> = ucast ((\<langle>31,0\<rangle>open64_0xb4a1_retval::32 word)) \<and> RSI \<sigma> = ((RSP\<^sub>0::64 word) - 0x448) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x458) \<and> RBP \<sigma> = ((RSP\<^sub>0::64 word) - 0x448) \<and> R13 \<sigma> = ucast ((\<langle>31,0\<rangle>open64_0xb4a1_retval::32 word)) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40c),4]::32 word) = 0x3000000 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40d),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x449),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x428),4]::32 word) = 0x2000 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x42c),4]::32 word) = ucast ((\<langle>31,0\<rangle>R14 \<sigma>::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x430),4]::32 word) = 0x100 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x438),8]::64 word) = 0x6000000000000 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x440),8]::64 word) = 0xffffffff00000000 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x448),8]::64 word) = 0x6573726170737863 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x449),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x449),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x460),8]::64 word) = 0xb767\<close>
declare P_0xb77b_72_def[Ps]

definition P_0xb77b_72_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0xb77b_72_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((FS\<^sub>0::64 word) + 0x28), 8),
    (2, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x40), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x40c), 4),
    (10, ((RSP\<^sub>0::64 word) - 0x40d), Suc 0),
    (11, ((RSP\<^sub>0::64 word) - 0x428), 4),
    (12, ((RSP\<^sub>0::64 word) - 0x42c), 4),
    (13, ((RSP\<^sub>0::64 word) - 0x430), 4),
    (14, ((RSP\<^sub>0::64 word) - 0x438), 8),
    (15, ((RSP\<^sub>0::64 word) - 0x440), 8),
    (16, ((RSP\<^sub>0::64 word) - 0x448), 8),
    (17, ((RSP\<^sub>0::64 word) - 0x449), Suc 0),
    (18, ((RSP\<^sub>0::64 word) - 0x460), 8)
  }\<close>

definition P_0xb77b_72_regions :: state_pred where
  \<open>P_0xb77b_72_regions \<sigma> \<equiv> \<exists>regions. P_0xb77b_72_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_write_addr_0xb77b_72 :: state_pred where
  \<open>Q_write_addr_0xb77b_72 \<sigma> \<equiv> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x460) \<and> RIP \<sigma> = write_addr \<and> RCX \<sigma> = ((RSP\<^sub>0::64 word) - 0x48) \<and> RDX \<sigma> = 0x400 \<and> RDI \<sigma> = ucast ((\<langle>31,0\<rangle>open64_0xb4a1_retval::32 word)) \<and> RSI \<sigma> = ((RSP\<^sub>0::64 word) - 0x448) \<and> RBP \<sigma> = ((RSP\<^sub>0::64 word) - 0x448) \<and> R13 \<sigma> = ucast ((\<langle>31,0\<rangle>open64_0xb4a1_retval::32 word)) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40c),4]::32 word) = 0x3000000 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40d),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x449),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x428),4]::32 word) = 0x2000 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x42c),4]::32 word) = ucast ((\<langle>31,0\<rangle>R14 \<sigma>::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x430),4]::32 word) = 0x100 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x438),8]::64 word) = 0x6000000000000 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x440),8]::64 word) = 0xffffffff00000000 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x448),8]::64 word) = 0x6573726170737863 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x449),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x449),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x460),8]::64 word) = 0xb780\<close>
declare Q_write_addr_0xb77b_72_def[Qs]

schematic_goal vpc_create_0_1_0xb77b_0xb77b_72[blocks]:
  assumes \<open>(P_0xb77b_72 && P_0xb77b_72_regions) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0xb77b 72 \<sigma> \<triangleq> ?\<sigma> \<and> Q_write_addr_0xb77b_72 ?\<sigma> \<and> block_usage P_0xb77b_72_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0xb77b_72_def P_0xb77b_72_regions_def post: Q_write_addr_0xb77b_72_def regionset: P_0xb77b_72_regions_set_def)

definition P_0xb780_73 :: state_pred where
  \<open>P_0xb780_73 \<sigma> \<equiv> RIP \<sigma> = 0xb780 \<and> RCX \<sigma> = ((RSP\<^sub>0::64 word) - 0x48) \<and> RDX \<sigma> = 0x400 \<and> RDI \<sigma> = ucast ((\<langle>31,0\<rangle>open64_0xb4a1_retval::32 word)) \<and> RSI \<sigma> = ((RSP\<^sub>0::64 word) - 0x448) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x458) \<and> RBP \<sigma> = ((RSP\<^sub>0::64 word) - 0x448) \<and> R13 \<sigma> = ucast ((\<langle>31,0\<rangle>open64_0xb4a1_retval::32 word)) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40c),4]::32 word) = 0x3000000 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40d),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x449),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x428),4]::32 word) = 0x2000 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x42c),4]::32 word) = ucast ((\<langle>31,0\<rangle>R14 \<sigma>::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x430),4]::32 word) = 0x100 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x438),8]::64 word) = 0x6000000000000 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x440),8]::64 word) = 0xffffffff00000000 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x448),8]::64 word) = 0x6573726170737863 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x449),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x449),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x460),8]::64 word) = 0xb780\<close>
declare P_0xb780_73_def[Ps]

definition P_0xb780_73_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0xb780_73_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((FS\<^sub>0::64 word) + 0x28), 8),
    (2, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x40), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x40c), 4),
    (10, ((RSP\<^sub>0::64 word) - 0x40d), Suc 0),
    (11, ((RSP\<^sub>0::64 word) - 0x428), 4),
    (12, ((RSP\<^sub>0::64 word) - 0x42c), 4),
    (13, ((RSP\<^sub>0::64 word) - 0x430), 4),
    (14, ((RSP\<^sub>0::64 word) - 0x438), 8),
    (15, ((RSP\<^sub>0::64 word) - 0x440), 8),
    (16, ((RSP\<^sub>0::64 word) - 0x448), 8),
    (17, ((RSP\<^sub>0::64 word) - 0x449), Suc 0),
    (18, ((RSP\<^sub>0::64 word) - 0x460), 8)
  }\<close>

definition P_0xb780_73_regions :: state_pred where
  \<open>P_0xb780_73_regions \<sigma> \<equiv> \<exists>regions. P_0xb780_73_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0xb786_73 :: state_pred where
  \<open>Q_0xb786_73 \<sigma> \<equiv> RIP \<sigma> = 0xb786 \<and> RCX \<sigma> = ((RSP\<^sub>0::64 word) - 0x48) \<and> RDX \<sigma> = 0x400 \<and> RDI \<sigma> = ucast ((\<langle>31,0\<rangle>open64_0xb4a1_retval::32 word)) \<and> RSI \<sigma> = ((RSP\<^sub>0::64 word) - 0x448) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x458) \<and> RBP \<sigma> = ((RSP\<^sub>0::64 word) - 0x448) \<and> R13 \<sigma> = ucast ((\<langle>31,0\<rangle>open64_0xb4a1_retval::32 word)) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40c),4]::32 word) = 0x3000000 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40d),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x449),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x428),4]::32 word) = 0x2000 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x42c),4]::32 word) = ucast ((\<langle>31,0\<rangle>R14 \<sigma>::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x430),4]::32 word) = 0x100 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x438),8]::64 word) = 0x6000000000000 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x440),8]::64 word) = 0xffffffff00000000 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x448),8]::64 word) = 0x6573726170737863 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x449),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x449),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x460),8]::64 word) = 0xb780\<close>
declare Q_0xb786_73_def[Qs]

schematic_goal vpc_create_0_1_0xb780_0xb780_73[blocks]:
  assumes \<open>(P_0xb780_73 && P_0xb780_73_regions) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0xb780 73 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0xb786_73 ?\<sigma> \<and> block_usage P_0xb780_73_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0xb780_73_def P_0xb780_73_regions_def post: Q_0xb786_73_def regionset: P_0xb780_73_regions_set_def)

definition P_0xb786_true_74 :: state_pred where
  \<open>P_0xb786_true_74 \<sigma> \<equiv> RIP \<sigma> = 0xb786 \<and> RCX \<sigma> = ((RSP\<^sub>0::64 word) - 0x48) \<and> RDX \<sigma> = 0x400 \<and> RDI \<sigma> = ucast ((\<langle>31,0\<rangle>open64_0xb4a1_retval::32 word)) \<and> RSI \<sigma> = ((RSP\<^sub>0::64 word) - 0x448) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x458) \<and> RBP \<sigma> = ((RSP\<^sub>0::64 word) - 0x448) \<and> R13 \<sigma> = ucast ((\<langle>31,0\<rangle>open64_0xb4a1_retval::32 word)) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40c),4]::32 word) = 0x3000000 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40d),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x449),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x428),4]::32 word) = 0x2000 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x42c),4]::32 word) = ucast ((\<langle>31,0\<rangle>R14 \<sigma>::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x430),4]::32 word) = 0x100 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x438),8]::64 word) = 0x6000000000000 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x440),8]::64 word) = 0xffffffff00000000 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x448),8]::64 word) = 0x6573726170737863 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x449),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x449),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x460),8]::64 word) = 0xb780\<close>
declare P_0xb786_true_74_def[Ps]

definition P_0xb786_true_74_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0xb786_true_74_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((FS\<^sub>0::64 word) + 0x28), 8),
    (2, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x40), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x40c), 4),
    (10, ((RSP\<^sub>0::64 word) - 0x40d), Suc 0),
    (11, ((RSP\<^sub>0::64 word) - 0x428), 4),
    (12, ((RSP\<^sub>0::64 word) - 0x42c), 4),
    (13, ((RSP\<^sub>0::64 word) - 0x430), 4),
    (14, ((RSP\<^sub>0::64 word) - 0x438), 8),
    (15, ((RSP\<^sub>0::64 word) - 0x440), 8),
    (16, ((RSP\<^sub>0::64 word) - 0x448), 8),
    (17, ((RSP\<^sub>0::64 word) - 0x449), Suc 0),
    (18, ((RSP\<^sub>0::64 word) - 0x460), 8)
  }\<close>

definition P_0xb786_true_74_regions :: state_pred where
  \<open>P_0xb786_true_74_regions \<sigma> \<equiv> \<exists>regions. P_0xb786_true_74_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0xb695_74 :: state_pred where
  \<open>Q_0xb695_74 \<sigma> \<equiv> RIP \<sigma> = 0xb695 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x458) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word)\<close>
declare Q_0xb695_74_def[Qs]

schematic_goal vpc_create_0_2_0xb786_0xb690_74[blocks]:
  assumes \<open>(P_0xb786_true_74 && P_0xb786_true_74_regions && !ZF) \<sigma>\<close>
  shows \<open>exec_block 2 0xb690 74 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0xb695_74 ?\<sigma> \<and> block_usage P_0xb786_true_74_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0xb786_true_74_def P_0xb786_true_74_regions_def post: Q_0xb695_74_def regionset: P_0xb786_true_74_regions_set_def)

definition P_0xb786_false_75 :: state_pred where
  \<open>P_0xb786_false_75 \<sigma> \<equiv> RIP \<sigma> = 0xb786 \<and> RCX \<sigma> = ((RSP\<^sub>0::64 word) - 0x48) \<and> RDX \<sigma> = 0x400 \<and> RDI \<sigma> = ucast ((\<langle>31,0\<rangle>open64_0xb4a1_retval::32 word)) \<and> RSI \<sigma> = ((RSP\<^sub>0::64 word) - 0x448) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x458) \<and> RBP \<sigma> = ((RSP\<^sub>0::64 word) - 0x448) \<and> R13 \<sigma> = ucast ((\<langle>31,0\<rangle>open64_0xb4a1_retval::32 word)) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40c),4]::32 word) = 0x3000000 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40d),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x449),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x428),4]::32 word) = 0x2000 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x42c),4]::32 word) = ucast ((\<langle>31,0\<rangle>R14 \<sigma>::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x430),4]::32 word) = 0x100 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x438),8]::64 word) = 0x6000000000000 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x440),8]::64 word) = 0xffffffff00000000 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x448),8]::64 word) = 0x6573726170737863 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x449),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x449),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x460),8]::64 word) = 0xb780\<close>
declare P_0xb786_false_75_def[Ps]

definition P_0xb786_false_75_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0xb786_false_75_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((FS\<^sub>0::64 word) + 0x28), 8),
    (2, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x40), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x40c), 4),
    (10, ((RSP\<^sub>0::64 word) - 0x40d), Suc 0),
    (11, ((RSP\<^sub>0::64 word) - 0x428), 4),
    (12, ((RSP\<^sub>0::64 word) - 0x42c), 4),
    (13, ((RSP\<^sub>0::64 word) - 0x430), 4),
    (14, ((RSP\<^sub>0::64 word) - 0x438), 8),
    (15, ((RSP\<^sub>0::64 word) - 0x440), 8),
    (16, ((RSP\<^sub>0::64 word) - 0x448), 8),
    (17, ((RSP\<^sub>0::64 word) - 0x449), Suc 0),
    (18, ((RSP\<^sub>0::64 word) - 0x460), 8)
  }\<close>

definition P_0xb786_false_75_regions :: state_pred where
  \<open>P_0xb786_false_75_regions \<sigma> \<equiv> \<exists>regions. P_0xb786_false_75_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0xb78f_75 :: state_pred where
  \<open>Q_0xb78f_75 \<sigma> \<equiv> RIP \<sigma> = 0xb78f \<and> RCX \<sigma> = ((RSP\<^sub>0::64 word) - 0x48) \<and> RDX \<sigma> = 0x400 \<and> RDI \<sigma> = ucast ((\<langle>31,0\<rangle>open64_0xb4a1_retval::32 word)) \<and> RSI \<sigma> = ((RSP\<^sub>0::64 word) - 0x448) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x458) \<and> RBP \<sigma> = ((RSP\<^sub>0::64 word) - 0x448) \<and> R13 \<sigma> = ucast ((\<langle>31,0\<rangle>open64_0xb4a1_retval::32 word)) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40c),4]::32 word) = 0x3000000 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40d),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x449),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x428),4]::32 word) = 0x2000 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x42c),4]::32 word) = ucast ((\<langle>31,0\<rangle>R14 \<sigma>::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x430),4]::32 word) = 0x100 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x438),8]::64 word) = 0x6000000000000 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x440),8]::64 word) = 0xffffffff00000000 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x448),8]::64 word) = 0x6573726170737863 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x449),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x449),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x460),8]::64 word) = 0xb780\<close>
declare Q_0xb78f_75_def[Qs]

schematic_goal vpc_create_0_2_0xb786_0xb78c_75[blocks]:
  assumes \<open>(P_0xb786_false_75 && P_0xb786_false_75_regions && ! !ZF) \<sigma>\<close>
  shows \<open>exec_block 2 0xb78c 75 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0xb78f_75 ?\<sigma> \<and> block_usage P_0xb786_false_75_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0xb786_false_75_def P_0xb786_false_75_regions_def post: Q_0xb78f_75_def regionset: P_0xb786_false_75_regions_set_def)

definition P_0xb78f_76 :: state_pred where
  \<open>P_0xb78f_76 \<sigma> \<equiv> RIP \<sigma> = 0xb78f \<and> RCX \<sigma> = ((RSP\<^sub>0::64 word) - 0x48) \<and> RDX \<sigma> = 0x400 \<and> RDI \<sigma> = ucast ((\<langle>31,0\<rangle>open64_0xb4a1_retval::32 word)) \<and> RSI \<sigma> = ((RSP\<^sub>0::64 word) - 0x448) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x458) \<and> RBP \<sigma> = ((RSP\<^sub>0::64 word) - 0x448) \<and> R13 \<sigma> = ucast ((\<langle>31,0\<rangle>open64_0xb4a1_retval::32 word)) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40c),4]::32 word) = 0x3000000 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40d),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x449),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x428),4]::32 word) = 0x2000 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x42c),4]::32 word) = ucast ((\<langle>31,0\<rangle>R14 \<sigma>::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x430),4]::32 word) = 0x100 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x438),8]::64 word) = 0x6000000000000 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x440),8]::64 word) = 0xffffffff00000000 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x448),8]::64 word) = 0x6573726170737863 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x449),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x449),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x460),8]::64 word) = 0xb780\<close>
declare P_0xb78f_76_def[Ps]

definition P_0xb78f_76_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0xb78f_76_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((FS\<^sub>0::64 word) + 0x28), 8),
    (2, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x40), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x40c), 4),
    (10, ((RSP\<^sub>0::64 word) - 0x40d), Suc 0),
    (11, ((RSP\<^sub>0::64 word) - 0x428), 4),
    (12, ((RSP\<^sub>0::64 word) - 0x42c), 4),
    (13, ((RSP\<^sub>0::64 word) - 0x430), 4),
    (14, ((RSP\<^sub>0::64 word) - 0x438), 8),
    (15, ((RSP\<^sub>0::64 word) - 0x440), 8),
    (16, ((RSP\<^sub>0::64 word) - 0x448), 8),
    (17, ((RSP\<^sub>0::64 word) - 0x449), Suc 0),
    (18, ((RSP\<^sub>0::64 word) - 0x460), 8)
  }\<close>

definition P_0xb78f_76_regions :: state_pred where
  \<open>P_0xb78f_76_regions \<sigma> \<equiv> \<exists>regions. P_0xb78f_76_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_close_addr_0xb78f_76 :: state_pred where
  \<open>Q_close_addr_0xb78f_76 \<sigma> \<equiv> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x460) \<and> RIP \<sigma> = close_addr \<and> RCX \<sigma> = ((RSP\<^sub>0::64 word) - 0x48) \<and> RDX \<sigma> = 0x400 \<and> RDI \<sigma> = ucast ((\<langle>31,0\<rangle>open64_0xb4a1_retval::32 word)) \<and> RSI \<sigma> = ((RSP\<^sub>0::64 word) - 0x448) \<and> RBP \<sigma> = ((RSP\<^sub>0::64 word) - 0x448) \<and> R13 \<sigma> = ucast ((\<langle>31,0\<rangle>open64_0xb4a1_retval::32 word)) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40c),4]::32 word) = 0x3000000 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40d),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x449),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x428),4]::32 word) = 0x2000 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x42c),4]::32 word) = ucast ((\<langle>31,0\<rangle>R14 \<sigma>::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x430),4]::32 word) = 0x100 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x438),8]::64 word) = 0x6000000000000 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x440),8]::64 word) = 0xffffffff00000000 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x448),8]::64 word) = 0x6573726170737863 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x449),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x449),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x460),8]::64 word) = 0xb794\<close>
declare Q_close_addr_0xb78f_76_def[Qs]

schematic_goal vpc_create_0_1_0xb78f_0xb78f_76[blocks]:
  assumes \<open>(P_0xb78f_76 && P_0xb78f_76_regions) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0xb78f 76 \<sigma> \<triangleq> ?\<sigma> \<and> Q_close_addr_0xb78f_76 ?\<sigma> \<and> block_usage P_0xb78f_76_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0xb78f_76_def P_0xb78f_76_regions_def post: Q_close_addr_0xb78f_76_def regionset: P_0xb78f_76_regions_set_def)

definition P_0xb794_77 :: state_pred where
  \<open>P_0xb794_77 \<sigma> \<equiv> RIP \<sigma> = 0xb794 \<and> RCX \<sigma> = ((RSP\<^sub>0::64 word) - 0x48) \<and> RDX \<sigma> = 0x400 \<and> RDI \<sigma> = ucast ((\<langle>31,0\<rangle>open64_0xb4a1_retval::32 word)) \<and> RSI \<sigma> = ((RSP\<^sub>0::64 word) - 0x448) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x458) \<and> RBP \<sigma> = ((RSP\<^sub>0::64 word) - 0x448) \<and> R13 \<sigma> = ucast ((\<langle>31,0\<rangle>open64_0xb4a1_retval::32 word)) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40c),4]::32 word) = 0x3000000 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40d),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x449),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x428),4]::32 word) = 0x2000 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x42c),4]::32 word) = ucast ((\<langle>31,0\<rangle>R14 \<sigma>::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x430),4]::32 word) = 0x100 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x438),8]::64 word) = 0x6000000000000 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x440),8]::64 word) = 0xffffffff00000000 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x448),8]::64 word) = 0x6573726170737863 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x449),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x449),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x460),8]::64 word) = 0xb794\<close>
declare P_0xb794_77_def[Ps]

definition P_0xb794_77_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0xb794_77_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((FS\<^sub>0::64 word) + 0x28), 8),
    (2, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x40), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x40c), 4),
    (10, ((RSP\<^sub>0::64 word) - 0x40d), Suc 0),
    (11, ((RSP\<^sub>0::64 word) - 0x428), 4),
    (12, ((RSP\<^sub>0::64 word) - 0x42c), 4),
    (13, ((RSP\<^sub>0::64 word) - 0x430), 4),
    (14, ((RSP\<^sub>0::64 word) - 0x438), 8),
    (15, ((RSP\<^sub>0::64 word) - 0x440), 8),
    (16, ((RSP\<^sub>0::64 word) - 0x448), 8),
    (17, ((RSP\<^sub>0::64 word) - 0x449), Suc 0),
    (18, ((RSP\<^sub>0::64 word) - 0x460), 8)
  }\<close>

definition P_0xb794_77_regions :: state_pred where
  \<open>P_0xb794_77_regions \<sigma> \<equiv> \<exists>regions. P_0xb794_77_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0xb695_77 :: state_pred where
  \<open>Q_0xb695_77 \<sigma> \<equiv> RIP \<sigma> = 0xb695 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x458) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word)\<close>
declare Q_0xb695_77_def[Qs]

schematic_goal vpc_create_0_2_0xb794_0xb796_77[blocks]:
  assumes \<open>(P_0xb794_77 && P_0xb794_77_regions) \<sigma>\<close>
  shows \<open>exec_block 2 0xb796 77 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0xb695_77 ?\<sigma> \<and> block_usage P_0xb794_77_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0xb794_77_def P_0xb794_77_regions_def post: Q_0xb695_77_def regionset: P_0xb794_77_regions_set_def)

definition P_0xb690_78 :: state_pred where
  \<open>P_0xb690_78 \<sigma> \<equiv> RIP \<sigma> = 0xb690 \<and> RCX \<sigma> = 0x40 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x458) \<and> RBP \<sigma> = ((RSP\<^sub>0::64 word) - 0x448) \<and> R15 \<sigma> = ((ucast (((((\<langle>63,0\<rangle>((R14 \<sigma>::64 word) * 0x4)::64 word)::64 word) + 0x1ff)::64 word))::64 word) >> 9) \<and> R13 \<sigma> = ucast ((\<langle>31,0\<rangle>open64_0xb4a1_retval::32 word)) \<and> R12 \<sigma> = ((RSP\<^sub>0::64 word) - 0x448) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40c),4]::32 word) = 0x3000000 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40d),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x449),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x424),4]::32 word) = 0x6b326957 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x428),4]::32 word) = 0x3000500 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x42c),4]::32 word) = 0x756d6571 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x438),8]::64 word) = 0x2000000000000 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x440),8]::64 word) = 0x10002000000 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x448),8]::64 word) = 0x78697463656e6f63 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x449),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x449),1]::8 word))\<close>
declare P_0xb690_78_def[Ps]

definition P_0xb690_78_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0xb690_78_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((FS\<^sub>0::64 word) + 0x28), 8),
    (2, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x40), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x40c), 4),
    (10, ((RSP\<^sub>0::64 word) - 0x40d), Suc 0),
    (11, ((RSP\<^sub>0::64 word) - 0x424), 4),
    (12, ((RSP\<^sub>0::64 word) - 0x428), 4),
    (13, ((RSP\<^sub>0::64 word) - 0x42c), 4),
    (14, ((RSP\<^sub>0::64 word) - 0x438), 8),
    (15, ((RSP\<^sub>0::64 word) - 0x440), 8),
    (16, ((RSP\<^sub>0::64 word) - 0x448), 8),
    (17, ((RSP\<^sub>0::64 word) - 0x449), Suc 0)
  }\<close>

definition P_0xb690_78_regions :: state_pred where
  \<open>P_0xb690_78_regions \<sigma> \<equiv> \<exists>regions. P_0xb690_78_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0xb695_78 :: state_pred where
  \<open>Q_0xb695_78 \<sigma> \<equiv> RIP \<sigma> = 0xb695 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x458) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word)\<close>
declare Q_0xb695_78_def[Qs]

schematic_goal vpc_create_0_1_0xb690_0xb690_78[blocks]:
  assumes \<open>(P_0xb690_78 && P_0xb690_78_regions) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0xb690 78 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0xb695_78 ?\<sigma> \<and> block_usage P_0xb690_78_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0xb690_78_def P_0xb690_78_regions_def post: Q_0xb695_78_def regionset: P_0xb690_78_regions_set_def)

definition P_0xb695_79 :: state_pred where
  \<open>P_0xb695_79 \<sigma> \<equiv> RIP \<sigma> = 0xb695 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x458) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word)\<close>
declare P_0xb695_79_def[Ps]

definition P_0xb695_79_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0xb695_79_regions_set \<sigma> \<equiv> {
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

definition P_0xb695_79_regions :: state_pred where
  \<open>P_0xb695_79_regions \<sigma> \<equiv> \<exists>regions. P_0xb695_79_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0xb6a6_79 :: state_pred where
  \<open>Q_0xb6a6_79 \<sigma> \<equiv> RIP \<sigma> = 0xb6a6 \<and> RDI \<sigma> = 0x0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x458) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word)\<close>
declare Q_0xb6a6_79_def[Qs]

schematic_goal vpc_create_0_2_0xb695_0xb69d_79[blocks]:
  assumes \<open>(P_0xb695_79 && P_0xb695_79_regions) \<sigma>\<close>
  shows \<open>exec_block 2 0xb69d 79 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0xb6a6_79 ?\<sigma> \<and> block_usage P_0xb695_79_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0xb695_79_def P_0xb695_79_regions_def post: Q_0xb6a6_79_def regionset: P_0xb695_79_regions_set_def)

definition P_0xb6a6_true_80 :: state_pred where
  \<open>P_0xb6a6_true_80 \<sigma> \<equiv> RIP \<sigma> = 0xb6a6 \<and> RDI \<sigma> = 0x0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x458) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word)\<close>
declare P_0xb6a6_true_80_def[Ps]

definition P_0xb6a6_true_80_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0xb6a6_true_80_regions_set \<sigma> \<equiv> {
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

definition P_0xb6a6_true_80_regions :: state_pred where
  \<open>P_0xb6a6_true_80_regions \<sigma> \<equiv> \<exists>regions. P_0xb6a6_true_80_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0xb936_80 :: state_pred where
  \<open>Q_0xb936_80 \<sigma> \<equiv> RIP \<sigma> = 0xb936 \<and> RDI \<sigma> = 0x0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x458) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word)\<close>
declare Q_0xb936_80_def[Qs]

schematic_goal vpc_create_0_1_0xb6a6_0xb6a6_80[blocks]:
  assumes \<open>(P_0xb6a6_true_80 && P_0xb6a6_true_80_regions && !ZF) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0xb6a6 80 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0xb936_80 ?\<sigma> \<and> block_usage P_0xb6a6_true_80_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0xb6a6_true_80_def P_0xb6a6_true_80_regions_def post: Q_0xb936_80_def regionset: P_0xb6a6_true_80_regions_set_def)

definition P_0xb936_81 :: state_pred where
  \<open>P_0xb936_81 \<sigma> \<equiv> RIP \<sigma> = 0xb936 \<and> RDI \<sigma> = 0x0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x458) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word)\<close>
declare P_0xb936_81_def[Ps]

definition P_0xb936_81_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0xb936_81_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((FS\<^sub>0::64 word) + 0x28), 8),
    (2, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x40), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x460), 8)
  }\<close>

definition P_0xb936_81_regions :: state_pred where
  \<open>P_0xb936_81_regions \<sigma> \<equiv> \<exists>regions. P_0xb936_81_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_stack_chk_fail_addr_0xb936_81 :: state_pred where
  \<open>Q_stack_chk_fail_addr_0xb936_81 \<sigma> \<equiv> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x460) \<and> RIP \<sigma> = stack_chk_fail_addr \<and> RDI \<sigma> = 0x0 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word)\<close>
declare Q_stack_chk_fail_addr_0xb936_81_def[Qs]

schematic_goal vpc_create_0_1_0xb936_0xb936_81[blocks]:
  assumes \<open>(P_0xb936_81 && P_0xb936_81_regions) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0xb936 81 \<sigma> \<triangleq> ?\<sigma> \<and> Q_stack_chk_fail_addr_0xb936_81 ?\<sigma> \<and> block_usage P_0xb936_81_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0xb936_81_def P_0xb936_81_regions_def post: Q_stack_chk_fail_addr_0xb936_81_def regionset: P_0xb936_81_regions_set_def)

definition P_0xb6a6_false_82 :: state_pred where
  \<open>P_0xb6a6_false_82 \<sigma> \<equiv> RIP \<sigma> = 0xb6a6 \<and> RDI \<sigma> = 0x0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x458) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word)\<close>
declare P_0xb6a6_false_82_def[Ps]

definition P_0xb6a6_false_82_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0xb6a6_false_82_regions_set \<sigma> \<equiv> {
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

definition P_0xb6a6_false_82_regions :: state_pred where
  \<open>P_0xb6a6_false_82_regions \<sigma> \<equiv> \<exists>regions. P_0xb6a6_false_82_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_ret_address_82 :: state_pred where
  \<open>Q_ret_address_82 \<sigma> \<equiv> RIP \<sigma> = ret_address \<and> RDI \<sigma> = 0x0 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word)\<close>
declare Q_ret_address_82_def[Qs]

schematic_goal vpc_create_0_9_0xb6a6_0xb6bd_82[blocks]:
  assumes \<open>(P_0xb6a6_false_82 && P_0xb6a6_false_82_regions && ! !ZF) \<sigma>\<close>
  shows \<open>exec_block 9 0xb6bd 82 \<sigma> \<triangleq> ?\<sigma> \<and> Q_ret_address_82 ?\<sigma> \<and> block_usage P_0xb6a6_false_82_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0xb6a6_false_82_def P_0xb6a6_false_82_regions_def post: Q_ret_address_82_def regionset: P_0xb6a6_false_82_regions_set_def)

definition vpc_create_acode :: ACode where
  \<open>vpc_create_acode =
    Block 12 0xb489 0;
    IF !ZF THEN
      Block (Suc 0) 0xb48c (Suc 0)
    ELSE
      Block 5 0xb49f 2;
      Block (Suc 0) 0xb4a1 3;
      CALL open64_acode;
      Block 2 0xb4a9 4;
      IF SF THEN
        Block 2 0xb690 5
      ELSE
        Block 2 0xb4b1 6;
        IF jg THEN
          Block 5 0xb6d5 7;
          Block 2 0xb520 8
        ELSE
          Block 2 0xb4be 9;
          IF jle THEN
            Block 12 0xb7ca 10;
            IF jbe THEN
              Block 2 0xb870 11;
              IF ja THEN
                Block 10 0xb808 12;
                IF jbe THEN
                  Block 17 0xb8ef 13
                ELSE
                  Block 23 0xb868 14
                FI
              ELSE
                Block 15 0xb8b0 15
              FI
            ELSE
              Block 5 0xb7da 16;
              IF jbe THEN
                Block 10 0xb808 17;
                IF jbe THEN
                  Block 17 0xb8ef 18
                ELSE
                  Block 23 0xb868 19
                FI
              ELSE
                Block 2 0xb7de 20;
                IF jbe THEN
                  Block 19 0xb931 21
                ELSE
                  Block 10 0xb808 22;
                  IF jbe THEN
                    Block 17 0xb8ef 23
                  ELSE
                    Block 23 0xb868 24
                  FI
                FI
              FI
            FI
          ELSE
            Block 22 0xb517 25;
            Block 2 0xb520 26
          FI
        FI;
        Block 4 0xb532 27;
        Block (Suc 0) 0xb535 28;
        CALL rep_stos_ESRDI_RAX_acode;
        Block 9 0xb572 29;
        Block (Suc 0) 0xb577 30;
        CALL time_acode;
        Block 16 0xb5c3 31;
        WHILE P_0xb5c8_32 DO
          Block 4 0xb5d1 32;
          IF !ZF THEN
            Block (Suc 0) 0xb5d4 33
          ELSE
            Block (Suc 0) 0xb5d4 34
          FI
        OD;
        Block 6 0xb5e4 35;
        Block (Suc 0) 0xb5e9 36;
        CALL write_acode;
        Block (Suc 0) 0xb5ee 37;
        IF !ZF THEN
          Block 2 0xb690 38
        ELSE
          Block 7 0xb611 39;
          Block (Suc 0) 0xb618 40;
          CALL lseek64_acode;
          Block (Suc 0) 0xb61d 41;
          IF SF THEN
            Block 2 0xb690 42
          ELSE
            Block 4 0xb62a 43;
            Block (Suc 0) 0xb62d 44;
            CALL write_acode;
            Block (Suc 0) 0xb632 45;
            IF !ZF THEN
              Block 2 0xb690 46
            ELSE
              Block 4 0xb641 47;
              Block (Suc 0) 0xb644 48;
              CALL lseek64_acode;
              Block (Suc 0) 0xb649 49;
              IF SF THEN
                Block 2 0xb690 50
              ELSE
                Block 6 0xb65c 51;
                Block (Suc 0) 0xb663 52;
                CALL rep_stos_ESRDI_RAX_acode;
                Block (Suc 0) 0xb666 53;
                WHILE P_0xb678_54 DO
                  Block 3 0xb680 54;
                  Block (Suc 0) 0xb683 55;
                  CALL write_acode;
                  Block (Suc 0) 0xb688 56;
                  IF ZF THEN
                    Block 3 0xb673 57;
                    IF ZF THEN
                      Block (Suc 0) 0xb676 58
                    ELSE
                      Block (Suc 0) 0xb676 59
                    FI
                  ELSE
                    Block (Suc 0) 0xb68e 60
                  FI
                OD;
                CASES [
                  (P_0xb6e0_61,
                    Block 4 0xb6ea 61;
                    Block (Suc 0) 0xb6ed 62;
                    CALL rep_stos_ESRDI_RAX_acode;
                    Block 12 0xb73a 63;
                    WHILE P_0xb740_64 DO
                      Block 4 0xb74b 64;
                      IF !ZF THEN
                        Block (Suc 0) 0xb74e 65
                      ELSE
                        Block (Suc 0) 0xb74e 66
                      FI
                    OD;
                    Block 6 0xb75e 67;
                    Block (Suc 0) 0xb762 68;
                    CALL lseek64_acode;
                    Block (Suc 0) 0xb767 69;
                    IF SF THEN
                      Block 2 0xb690 70
                    ELSE
                      Block 4 0xb778 71;
                      Block (Suc 0) 0xb77b 72;
                      CALL write_acode;
                      Block (Suc 0) 0xb780 73;
                      IF !ZF THEN
                        Block 2 0xb690 74
                      ELSE
                        Block 2 0xb78c 75;
                        Block (Suc 0) 0xb78f 76;
                        CALL close_acode;
                        Block 2 0xb796 77
                      FI
                    FI
                  ),
                  (P_0xb690_78,
                    Block (Suc 0) 0xb690 78
                  )
                ]
              FI
            FI
          FI
        FI
      FI
    FI;
    Block 2 0xb69d 79;
    IF !ZF THEN
      Block (Suc 0) 0xb6a6 80;
      Block (Suc 0) 0xb936 81;
      CALL stack_chk_fail_acode
    ELSE
      Block 9 0xb6bd 82
    FI
  \<close>

schematic_goal "vpc_create":
  assumes
    \<open>\<forall>\<sigma>. RIP \<sigma> = 0xb48c \<longrightarrow> P_0xb48c_true_1_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0xb48c \<longrightarrow> P_0xb48c_false_2_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0xb4a1 \<longrightarrow> P_0xb4a1_3_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0xb4a6 \<longrightarrow> P_0xb4a6_4_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0xb4ab \<longrightarrow> P_0xb4ab_true_5_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0xb4ab \<longrightarrow> P_0xb4ab_false_6_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0xb4b8 \<longrightarrow> P_0xb4b8_true_7_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0xb51b \<longrightarrow> P_0xb51b_8_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0xb4b8 \<longrightarrow> P_0xb4b8_false_9_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0xb4c5 \<longrightarrow> P_0xb4c5_true_10_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0xb7cc \<longrightarrow> P_0xb7cc_true_11_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0xb876 \<longrightarrow> P_0xb876_true_12_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0xb80d \<longrightarrow> P_0xb80d_true_13_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0xb80d \<longrightarrow> P_0xb80d_false_14_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0xb876 \<longrightarrow> P_0xb876_false_15_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0xb7cc \<longrightarrow> P_0xb7cc_false_16_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0xb7dc \<longrightarrow> P_0xb7dc_true_17_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0xb80d \<longrightarrow> P_0xb80d_true_18_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0xb80d \<longrightarrow> P_0xb80d_false_19_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0xb7dc \<longrightarrow> P_0xb7dc_false_20_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0xb7e0 \<longrightarrow> P_0xb7e0_true_21_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0xb7e0 \<longrightarrow> P_0xb7e0_false_22_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0xb80d \<longrightarrow> P_0xb80d_true_23_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0xb80d \<longrightarrow> P_0xb80d_false_24_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0xb4c5 \<longrightarrow> P_0xb4c5_false_25_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0xb51b \<longrightarrow> P_0xb51b_26_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0xb526 \<longrightarrow> P_0xb526_27_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0xb535 \<longrightarrow> P_0xb535_28_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0xb538 \<longrightarrow> P_0xb538_29_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0xb577 \<longrightarrow> P_0xb577_30_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0xb57c \<longrightarrow> P_0xb57c_31_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0xb5c8 \<longrightarrow> P_0xb5c8_32_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0xb5d4 \<longrightarrow> P_0xb5d4_true_33_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0xb5d4 \<longrightarrow> P_0xb5d4_false_34_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0xb5d6 \<longrightarrow> P_0xb5d6_35_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0xb5e9 \<longrightarrow> P_0xb5e9_36_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0xb5ee \<longrightarrow> P_0xb5ee_37_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0xb5f4 \<longrightarrow> P_0xb5f4_true_38_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0xb5f4 \<longrightarrow> P_0xb5f4_false_39_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0xb618 \<longrightarrow> P_0xb618_40_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0xb61d \<longrightarrow> P_0xb61d_41_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0xb620 \<longrightarrow> P_0xb620_true_42_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0xb620 \<longrightarrow> P_0xb620_false_43_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0xb62d \<longrightarrow> P_0xb62d_44_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0xb632 \<longrightarrow> P_0xb632_45_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0xb638 \<longrightarrow> P_0xb638_true_46_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0xb638 \<longrightarrow> P_0xb638_false_47_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0xb644 \<longrightarrow> P_0xb644_48_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0xb649 \<longrightarrow> P_0xb649_49_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0xb64c \<longrightarrow> P_0xb64c_true_50_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0xb64c \<longrightarrow> P_0xb64c_false_51_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0xb663 \<longrightarrow> P_0xb663_52_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0xb666 \<longrightarrow> P_0xb666_53_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0xb678 \<longrightarrow> P_0xb678_54_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0xb683 \<longrightarrow> P_0xb683_55_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0xb688 \<longrightarrow> P_0xb688_56_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0xb68e \<longrightarrow> P_0xb68e_true_57_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0xb676 \<longrightarrow> P_0xb676_true_58_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0xb676 \<longrightarrow> P_0xb676_false_59_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0xb68e \<longrightarrow> P_0xb68e_false_60_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0xb6e0 \<longrightarrow> P_0xb6e0_61_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0xb6ed \<longrightarrow> P_0xb6ed_62_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0xb6f0 \<longrightarrow> P_0xb6f0_63_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0xb740 \<longrightarrow> P_0xb740_64_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0xb74e \<longrightarrow> P_0xb74e_true_65_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0xb74e \<longrightarrow> P_0xb74e_false_66_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0xb750 \<longrightarrow> P_0xb750_67_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0xb762 \<longrightarrow> P_0xb762_68_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0xb767 \<longrightarrow> P_0xb767_69_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0xb76a \<longrightarrow> P_0xb76a_true_70_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0xb76a \<longrightarrow> P_0xb76a_false_71_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0xb77b \<longrightarrow> P_0xb77b_72_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0xb780 \<longrightarrow> P_0xb780_73_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0xb786 \<longrightarrow> P_0xb786_true_74_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0xb786 \<longrightarrow> P_0xb786_false_75_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0xb78f \<longrightarrow> P_0xb78f_76_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0xb794 \<longrightarrow> P_0xb794_77_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0xb690 \<longrightarrow> P_0xb690_78_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0xb695 \<longrightarrow> P_0xb695_79_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0xb6a6 \<longrightarrow> P_0xb6a6_true_80_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0xb936 \<longrightarrow> P_0xb936_81_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0xb6a6 \<longrightarrow> P_0xb6a6_false_82_regions \<sigma>\<close>
    and [blocks]: \<open>{{Q_open64_addr_0xb4a1_3}} \<box>open64_acode {{P_0xb4a6_4;M_0xb4a1}}\<close>
    and [blocks]: \<open>{{Q_rep_stos_ESRDI_RAX_addr_0xb535_28}} \<box>rep_stos_ESRDI_RAX_acode {{P_0xb538_29;M_0xb535}}\<close>
    and [blocks]: \<open>{{Q_time_addr_0xb577_30}} \<box>time_acode {{P_0xb57c_31;M_0xb577}}\<close>
    and [blocks]: \<open>{{Q_write_addr_0xb5e9_36}} \<box>write_acode {{P_0xb5ee_37;M_0xb5e9}}\<close>
    and [blocks]: \<open>{{Q_lseek64_addr_0xb618_40}} \<box>lseek64_acode {{P_0xb61d_41;M_0xb618}}\<close>
    and [blocks]: \<open>{{Q_write_addr_0xb62d_44}} \<box>write_acode {{P_0xb632_45;M_0xb62d}}\<close>
    and [blocks]: \<open>{{Q_lseek64_addr_0xb644_48}} \<box>lseek64_acode {{P_0xb649_49;M_0xb644}}\<close>
    and [blocks]: \<open>{{Q_rep_stos_ESRDI_RAX_addr_0xb663_52}} \<box>rep_stos_ESRDI_RAX_acode {{P_0xb666_53;M_0xb663}}\<close>
    and [blocks]: \<open>{{Q_write_addr_0xb683_55}} \<box>write_acode {{P_0xb688_56;M_0xb683}}\<close>
    and [blocks]: \<open>{{Q_rep_stos_ESRDI_RAX_addr_0xb6ed_62}} \<box>rep_stos_ESRDI_RAX_acode {{P_0xb6f0_63;M_0xb6ed}}\<close>
    and [blocks]: \<open>{{Q_lseek64_addr_0xb762_68}} \<box>lseek64_acode {{P_0xb767_69;M_0xb762}}\<close>
    and [blocks]: \<open>{{Q_write_addr_0xb77b_72}} \<box>write_acode {{P_0xb780_73;M_0xb77b}}\<close>
    and [blocks]: \<open>{{Q_close_addr_0xb78f_76}} \<box>close_acode {{P_0xb794_77;M_0xb78f}}\<close>
    and [blocks]: \<open>{{Q_stack_chk_fail_addr_0xb936_81}} \<box>stack_chk_fail_acode {{Q_fail;M_0xb936}}\<close>
  shows \<open>{{?P}} vpc_create_acode {{?Q;?M}}\<close>
  apply (vcg acode: vpc_create_acode_def assms: assms)
                      apply (vcg_while \<open>P_0xb5c8_32 || P_0xb5d6_35\<close> assms: assms)
                      apply (vcg_step assms: assms)+
                      apply (vcg_while \<open>P_0xb678_54 || P_0xb6e0_61 || P_0xb690_78\<close> assms: assms)
                      apply (vcg_while \<open>P_0xb740_64 || P_0xb750_67\<close> assms: assms)
                      apply (vcg_step assms: assms)+
  done

end

end
