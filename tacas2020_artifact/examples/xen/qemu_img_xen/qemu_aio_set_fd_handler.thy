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
theory qemu_aio_set_fd_handler
  imports "../../../isabelle/VCG/HTriple"
begin

locale "qemu_img_xen" = execution_context + exec_code +
  fixes qemu_aio_get_0x1a79a_retval\<^sub>v bdrv_read_0x1a7b5_retval\<^sub>v qemu_bh_schedule_0x1a7c1_retval\<^sub>v qemu_bh_new_0x1a7e2_retval\<^sub>v qemu_aio_get_0x1a80a_retval\<^sub>v bdrv_write_0x1a825_retval\<^sub>v qemu_bh_schedule_0x1a831_retval\<^sub>v qemu_bh_new_0x1a852_retval\<^sub>v qemu_free_0x1ac97_retval\<^sub>v qemu_set_fd_handler2_0x1acaa_retval\<^sub>v qemu_mallocz_0x1acd6_retval\<^sub>v bdrv_read_addr bdrv_write_addr qemu_aio_get_addr qemu_bh_new_addr qemu_bh_schedule_addr qemu_free_addr qemu_mallocz_addr qemu_set_fd_handler2_addr :: \<open>64 word\<close>
    and bdrv_read_acode bdrv_write_acode qemu_aio_get_acode qemu_bh_new_acode qemu_bh_schedule_acode qemu_free_acode qemu_mallocz_acode qemu_set_fd_handler2_acode :: ACode
  assumes fetch:
    "fetch 0x1a780 \<equiv> (Unary (IS_8088 Push) (Storage (Reg (General SixtyFour r14))), 2)"
    "fetch 0x1a782 \<equiv> (Binary (IS_8088 Mov) (Reg (General ThirtyTwo r14)) (Storage (Reg (General ThirtyTwo rcx))), 3)"
    "fetch 0x1a785 \<equiv> (Unary (IS_8088 Push) (Storage (Reg (General SixtyFour r13))), 2)"
    "fetch 0x1a787 \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour r13)) (Storage (Reg (General SixtyFour rdx))), 3)"
    "fetch 0x1a78a \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour rdx)) (Storage (Reg (General SixtyFour r9))), 3)"
    "fetch 0x1a78d \<equiv> (Unary (IS_8088 Push) (Storage (Reg (General SixtyFour r12))), 2)"
    "fetch 0x1a78f \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour r12)) (Storage (Reg (General SixtyFour rsi))), 3)"
    "fetch 0x1a792 \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour rsi)) (Storage (Reg (General SixtyFour r8))), 3)"
    "fetch 0x1a795 \<equiv> (Unary (IS_8088 Push) (Storage (Reg (General SixtyFour rbp))), 1)"
    "fetch 0x1a796 \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour rbp)) (Storage (Reg (General SixtyFour rdi))), 3)"
    "fetch 0x1a799 \<equiv> (Unary (IS_8088 Push) (Storage (Reg (General SixtyFour rbx))), 1)"
    "fetch 0x1a79a \<equiv> (Unary (IS_8088 Call) (Immediate SixtyFour (ImmLabel ''qemu_aio_get'')), 5)"
    "fetch 0x1a79f \<equiv> (Binary (IS_8088 Cmp) (Memory SixtyFour (A_SizeDirective 64 (A_Plus (A_FromReg (General SixtyFour rax)) (A_WordConstant 40)))) (Immediate SixtyFour (ImmVal 0)), 5)"
    "fetch 0x1a7a4 \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour rbx)) (Storage (Reg (General SixtyFour rax))), 3)"
    "fetch 0x1a7a7 \<equiv> (Unary (IS_8088 Je) (Immediate SixtyFour (ImmVal 108504)), 2)"
    "fetch 0x1a7a9 \<equiv> (Binary (IS_8088 Mov) (Reg (General ThirtyTwo rcx)) (Storage (Reg (General ThirtyTwo r14))), 3)"
    "fetch 0x1a7ac \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour rdx)) (Storage (Reg (General SixtyFour r13))), 3)"
    "fetch 0x1a7af \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour rsi)) (Storage (Reg (General SixtyFour r12))), 3)"
    "fetch 0x1a7b2 \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour rdi)) (Storage (Reg (General SixtyFour rbp))), 3)"
    "fetch 0x1a7b5 \<equiv> (Unary (IS_8088 Call) (Immediate SixtyFour (ImmLabel ''bdrv_read'')), 5)"
    "fetch 0x1a7ba \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour rdi)) (Storage (Memory SixtyFour (A_SizeDirective 64 (A_Plus (A_FromReg (General SixtyFour rbx)) (A_WordConstant 40))))), 4)"
    "fetch 0x1a7be \<equiv> (Binary (IS_8088 Mov) (Memory ThirtyTwo (A_SizeDirective 32 (A_Plus (A_FromReg (General SixtyFour rbx)) (A_WordConstant 48)))) (Storage (Reg (General ThirtyTwo rax))), 3)"
    "fetch 0x1a7c1 \<equiv> (Unary (IS_8088 Call) (Immediate SixtyFour (ImmLabel ''qemu_bh_schedule'')), 5)"
    "fetch 0x1a7c6 \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour rax)) (Storage (Reg (General SixtyFour rbx))), 3)"
    "fetch 0x1a7c9 \<equiv> (Unary (IS_8088 Pop) (Storage (Reg (General SixtyFour rbx))), 1)"
    "fetch 0x1a7ca \<equiv> (Unary (IS_8088 Pop) (Storage (Reg (General SixtyFour rbp))), 1)"
    "fetch 0x1a7cb \<equiv> (Unary (IS_8088 Pop) (Storage (Reg (General SixtyFour r12))), 2)"
    "fetch 0x1a7cd \<equiv> (Unary (IS_8088 Pop) (Storage (Reg (General SixtyFour r13))), 2)"
    "fetch 0x1a7cf \<equiv> (Unary (IS_8088 Pop) (Storage (Reg (General SixtyFour r14))), 2)"
    "fetch 0x1a7d1 \<equiv> (Nullary (IS_8088 Ret), 1)"
    "fetch 0x1a7d2 \<equiv> (Unary (IS_8088 Nop) (Storage (Memory Sixteen (A_SizeDirective 16 (A_Plus (A_FromReg (General SixtyFour rax)) (A_Plus (A_Mult 1 (A_FromReg (General SixtyFour rax))) (A_WordConstant 0)))))), 6)"
    "fetch 0x1a7d8 \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour rsi)) (Storage (Reg (General SixtyFour rax))), 3)"
    "fetch 0x1a7db \<equiv> (Binary (IS_8088 Lea) (Reg (General SixtyFour rdi)) (Storage (Memory SixtyFour (A_Plus (A_FromReg (General SixtyFour rip)) (A_WordConstant (-10818))))), 7)"
    "fetch 0x1a7e2 \<equiv> (Unary (IS_8088 Call) (Immediate SixtyFour (ImmLabel ''qemu_bh_new'')), 5)"
    "fetch 0x1a7e7 \<equiv> (Binary (IS_8088 Mov) (Memory SixtyFour (A_SizeDirective 64 (A_Plus (A_FromReg (General SixtyFour rbx)) (A_WordConstant 40)))) (Storage (Reg (General SixtyFour rax))), 4)"
    "fetch 0x1a7eb \<equiv> (Unary (IS_8088 Jmp) (Immediate SixtyFour (ImmVal 108457)), 2)"
    "fetch 0x1a7f0 \<equiv> (Unary (IS_8088 Push) (Storage (Reg (General SixtyFour r14))), 2)"
    "fetch 0x1a7f2 \<equiv> (Binary (IS_8088 Mov) (Reg (General ThirtyTwo r14)) (Storage (Reg (General ThirtyTwo rcx))), 3)"
    "fetch 0x1a7f5 \<equiv> (Unary (IS_8088 Push) (Storage (Reg (General SixtyFour r13))), 2)"
    "fetch 0x1a7f7 \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour r13)) (Storage (Reg (General SixtyFour rdx))), 3)"
    "fetch 0x1a7fa \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour rdx)) (Storage (Reg (General SixtyFour r9))), 3)"
    "fetch 0x1a7fd \<equiv> (Unary (IS_8088 Push) (Storage (Reg (General SixtyFour r12))), 2)"
    "fetch 0x1a7ff \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour r12)) (Storage (Reg (General SixtyFour rsi))), 3)"
    "fetch 0x1a802 \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour rsi)) (Storage (Reg (General SixtyFour r8))), 3)"
    "fetch 0x1a805 \<equiv> (Unary (IS_8088 Push) (Storage (Reg (General SixtyFour rbp))), 1)"
    "fetch 0x1a806 \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour rbp)) (Storage (Reg (General SixtyFour rdi))), 3)"
    "fetch 0x1a809 \<equiv> (Unary (IS_8088 Push) (Storage (Reg (General SixtyFour rbx))), 1)"
    "fetch 0x1a80a \<equiv> (Unary (IS_8088 Call) (Immediate SixtyFour (ImmLabel ''qemu_aio_get'')), 5)"
    "fetch 0x1a80f \<equiv> (Binary (IS_8088 Cmp) (Memory SixtyFour (A_SizeDirective 64 (A_Plus (A_FromReg (General SixtyFour rax)) (A_WordConstant 40)))) (Immediate SixtyFour (ImmVal 0)), 5)"
    "fetch 0x1a814 \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour rbx)) (Storage (Reg (General SixtyFour rax))), 3)"
    "fetch 0x1a817 \<equiv> (Unary (IS_8088 Je) (Immediate SixtyFour (ImmVal 108616)), 2)"
    "fetch 0x1a819 \<equiv> (Binary (IS_8088 Mov) (Reg (General ThirtyTwo rcx)) (Storage (Reg (General ThirtyTwo r14))), 3)"
    "fetch 0x1a81c \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour rdx)) (Storage (Reg (General SixtyFour r13))), 3)"
    "fetch 0x1a81f \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour rsi)) (Storage (Reg (General SixtyFour r12))), 3)"
    "fetch 0x1a822 \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour rdi)) (Storage (Reg (General SixtyFour rbp))), 3)"
    "fetch 0x1a825 \<equiv> (Unary (IS_8088 Call) (Immediate SixtyFour (ImmLabel ''bdrv_write'')), 5)"
    "fetch 0x1a82a \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour rdi)) (Storage (Memory SixtyFour (A_SizeDirective 64 (A_Plus (A_FromReg (General SixtyFour rbx)) (A_WordConstant 40))))), 4)"
    "fetch 0x1a82e \<equiv> (Binary (IS_8088 Mov) (Memory ThirtyTwo (A_SizeDirective 32 (A_Plus (A_FromReg (General SixtyFour rbx)) (A_WordConstant 48)))) (Storage (Reg (General ThirtyTwo rax))), 3)"
    "fetch 0x1a831 \<equiv> (Unary (IS_8088 Call) (Immediate SixtyFour (ImmLabel ''qemu_bh_schedule'')), 5)"
    "fetch 0x1a836 \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour rax)) (Storage (Reg (General SixtyFour rbx))), 3)"
    "fetch 0x1a839 \<equiv> (Unary (IS_8088 Pop) (Storage (Reg (General SixtyFour rbx))), 1)"
    "fetch 0x1a83a \<equiv> (Unary (IS_8088 Pop) (Storage (Reg (General SixtyFour rbp))), 1)"
    "fetch 0x1a83b \<equiv> (Unary (IS_8088 Pop) (Storage (Reg (General SixtyFour r12))), 2)"
    "fetch 0x1a83d \<equiv> (Unary (IS_8088 Pop) (Storage (Reg (General SixtyFour r13))), 2)"
    "fetch 0x1a83f \<equiv> (Unary (IS_8088 Pop) (Storage (Reg (General SixtyFour r14))), 2)"
    "fetch 0x1a841 \<equiv> (Nullary (IS_8088 Ret), 1)"
    "fetch 0x1a842 \<equiv> (Unary (IS_8088 Nop) (Storage (Memory Sixteen (A_SizeDirective 16 (A_Plus (A_FromReg (General SixtyFour rax)) (A_Plus (A_Mult 1 (A_FromReg (General SixtyFour rax))) (A_WordConstant 0)))))), 6)"
    "fetch 0x1a848 \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour rsi)) (Storage (Reg (General SixtyFour rax))), 3)"
    "fetch 0x1a84b \<equiv> (Binary (IS_8088 Lea) (Reg (General SixtyFour rdi)) (Storage (Memory SixtyFour (A_Plus (A_FromReg (General SixtyFour rip)) (A_WordConstant (-10930))))), 7)"
    "fetch 0x1a852 \<equiv> (Unary (IS_8088 Call) (Immediate SixtyFour (ImmLabel ''qemu_bh_new'')), 5)"
    "fetch 0x1a857 \<equiv> (Binary (IS_8088 Mov) (Memory SixtyFour (A_SizeDirective 64 (A_Plus (A_FromReg (General SixtyFour rbx)) (A_WordConstant 40)))) (Storage (Reg (General SixtyFour rax))), 4)"
    "fetch 0x1a85b \<equiv> (Unary (IS_8088 Jmp) (Immediate SixtyFour (ImmVal 108569)), 2)"
    "fetch 0x1ac30 \<equiv> (Unary (IS_8088 Push) (Storage (Reg (General SixtyFour r12))), 2)"
    "fetch 0x1ac32 \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour r12)) (Storage (Reg (General SixtyFour rdx))), 3)"
    "fetch 0x1ac35 \<equiv> (Unary (IS_8088 Push) (Storage (Reg (General SixtyFour rbp))), 1)"
    "fetch 0x1ac36 \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour rbp)) (Storage (Reg (General SixtyFour rsi))), 3)"
    "fetch 0x1ac39 \<equiv> (Unary (IS_8088 Push) (Storage (Reg (General SixtyFour rbx))), 1)"
    "fetch 0x1ac3a \<equiv> (Binary (IS_8088 Mov) (Reg (General ThirtyTwo rbx)) (Storage (Reg (General ThirtyTwo rdi))), 2)"
    "fetch 0x1ac3c \<equiv> (Binary (IS_8088 Sub) (Reg (General SixtyFour rsp)) (Immediate SixtyFour (ImmVal 16)), 4)"
    "fetch 0x1ac40 \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour rdi)) (Storage (Memory SixtyFour (A_SizeDirective 64 (A_Plus (A_FromReg (General SixtyFour rip)) (A_WordConstant 63337))))), 7)"
    "fetch 0x1ac47 \<equiv> (Binary (IS_8088 Test) (Reg (General SixtyFour rdi)) (Storage (Reg (General SixtyFour rdi))), 3)"
    "fetch 0x1ac4a \<equiv> (Unary (IS_8088 Jne) (Immediate SixtyFour (ImmVal 109657)), 2)"
    "fetch 0x1ac4c \<equiv> (Unary (IS_8088 Jmp) (Immediate SixtyFour (ImmVal 109760)), 2)"
    "fetch 0x1ac4e \<equiv> (Binary (IS_8088 Xchg) (Reg (General Sixteen rax)) (Storage (Reg (General Sixteen rax))), 2)"
    "fetch 0x1ac50 \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour rdi)) (Storage (Memory SixtyFour (A_SizeDirective 64 (A_Plus (A_FromReg (General SixtyFour rdi)) (A_WordConstant 48))))), 4)"
    "fetch 0x1ac54 \<equiv> (Binary (IS_8088 Test) (Reg (General SixtyFour rdi)) (Storage (Reg (General SixtyFour rdi))), 3)"
    "fetch 0x1ac57 \<equiv> (Unary (IS_8088 Je) (Immediate SixtyFour (ImmVal 109760)), 2)"
    "fetch 0x1ac59 \<equiv> (Binary (IS_8088 Cmp) (Reg (General ThirtyTwo rbx)) (Storage (Memory ThirtyTwo (A_SizeDirective 32 (A_FromReg (General SixtyFour rdi))))), 2)"
    "fetch 0x1ac5b \<equiv> (Unary (IS_8088 Jne) (Immediate SixtyFour (ImmVal 109648)), 2)"
    "fetch 0x1ac5d \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour rax)) (Storage (Reg (General SixtyFour rbp))), 3)"
    "fetch 0x1ac60 \<equiv> (Binary (IS_8088 Or) (Reg (General SixtyFour rax)) (Storage (Reg (General SixtyFour r12))), 3)"
    "fetch 0x1ac63 \<equiv> (Unary (IS_8088 Jne) (Immediate SixtyFour (ImmVal 109843)), 6)"
    "fetch 0x1ac69 \<equiv> (Binary (IS_8088 Mov) (Reg (General ThirtyTwo rax)) (Storage (Memory ThirtyTwo (A_SizeDirective 32 (A_Plus (A_FromReg (General SixtyFour rip)) (A_WordConstant 63289))))), 6)"
    "fetch 0x1ac6f \<equiv> (Binary (IS_8088 Test) (Reg (General ThirtyTwo rax)) (Storage (Reg (General ThirtyTwo rax))), 2)"
    "fetch 0x1ac71 \<equiv> (Unary (IS_8088 Jne) (Immediate SixtyFour (ImmVal 109872)), 6)"
    "fetch 0x1ac77 \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour rax)) (Storage (Memory SixtyFour (A_SizeDirective 64 (A_Plus (A_FromReg (General SixtyFour rdi)) (A_WordConstant 48))))), 4)"
    "fetch 0x1ac7b \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour rcx)) (Storage (Memory SixtyFour (A_SizeDirective 64 (A_Plus (A_FromReg (General SixtyFour rdi)) (A_WordConstant 56))))), 4)"
    "fetch 0x1ac7f \<equiv> (Binary (IS_8088 Test) (Reg (General SixtyFour rax)) (Storage (Reg (General SixtyFour rax))), 3)"
    "fetch 0x1ac82 \<equiv> (Unary (IS_8088 Je) (Immediate SixtyFour (ImmVal 109712)), 2)"
    "fetch 0x1ac84 \<equiv> (Binary (IS_8088 Mov) (Memory SixtyFour (A_SizeDirective 64 (A_Plus (A_FromReg (General SixtyFour rax)) (A_WordConstant 56)))) (Storage (Reg (General SixtyFour rcx))), 4)"
    "fetch 0x1ac88 \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour rcx)) (Storage (Memory SixtyFour (A_SizeDirective 64 (A_Plus (A_FromReg (General SixtyFour rdi)) (A_WordConstant 56))))), 4)"
    "fetch 0x1ac8c \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour rax)) (Storage (Memory SixtyFour (A_SizeDirective 64 (A_Plus (A_FromReg (General SixtyFour rdi)) (A_WordConstant 48))))), 4)"
    "fetch 0x1ac90 \<equiv> (Binary (IS_8088 Mov) (Memory SixtyFour (A_SizeDirective 64 (A_FromReg (General SixtyFour rcx)))) (Storage (Reg (General SixtyFour rax))), 3)"
    "fetch 0x1ac93 \<equiv> (Binary (IS_8088 Mov) (Memory SixtyFour (A_SizeDirective 64 (A_FromReg (General SixtyFour rsp)))) (Storage (Reg (General SixtyFour r8))), 4)"
    "fetch 0x1ac97 \<equiv> (Unary (IS_8088 Call) (Immediate SixtyFour (ImmLabel ''qemu_free'')), 5)"
    "fetch 0x1ac9c \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour r8)) (Storage (Memory SixtyFour (A_SizeDirective 64 (A_FromReg (General SixtyFour rsp))))), 4)"
    "fetch 0x1aca0 \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour rcx)) (Storage (Reg (General SixtyFour r12))), 3)"
    "fetch 0x1aca3 \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour rdx)) (Storage (Reg (General SixtyFour rbp))), 3)"
    "fetch 0x1aca6 \<equiv> (Binary (IS_8088 Mov) (Reg (General ThirtyTwo rdi)) (Storage (Reg (General ThirtyTwo rbx))), 2)"
    "fetch 0x1aca8 \<equiv> (Binary (IS_8088 Xor) (Reg (General ThirtyTwo rsi)) (Storage (Reg (General ThirtyTwo rsi))), 2)"
    "fetch 0x1acaa \<equiv> (Unary (IS_8088 Call) (Immediate SixtyFour (ImmLabel ''qemu_set_fd_handler2'')), 5)"
    "fetch 0x1acaf \<equiv> (Binary (IS_8088 Add) (Reg (General SixtyFour rsp)) (Immediate SixtyFour (ImmVal 16)), 4)"
    "fetch 0x1acb3 \<equiv> (Binary (IS_8088 Xor) (Reg (General ThirtyTwo rax)) (Storage (Reg (General ThirtyTwo rax))), 2)"
    "fetch 0x1acb5 \<equiv> (Unary (IS_8088 Pop) (Storage (Reg (General SixtyFour rbx))), 1)"
    "fetch 0x1acb6 \<equiv> (Unary (IS_8088 Pop) (Storage (Reg (General SixtyFour rbp))), 1)"
    "fetch 0x1acb7 \<equiv> (Unary (IS_8088 Pop) (Storage (Reg (General SixtyFour r12))), 2)"
    "fetch 0x1acb9 \<equiv> (Nullary (IS_8088 Ret), 1)"
    "fetch 0x1acba \<equiv> (Unary (IS_8088 Nop) (Storage (Memory Sixteen (A_SizeDirective 16 (A_Plus (A_FromReg (General SixtyFour rax)) (A_Plus (A_Mult 1 (A_FromReg (General SixtyFour rax))) (A_WordConstant 0)))))), 6)"
    "fetch 0x1acc0 \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour rax)) (Storage (Reg (General SixtyFour rbp))), 3)"
    "fetch 0x1acc3 \<equiv> (Binary (IS_8088 Or) (Reg (General SixtyFour rax)) (Storage (Reg (General SixtyFour r12))), 3)"
    "fetch 0x1acc6 \<equiv> (Unary (IS_8088 Je) (Immediate SixtyFour (ImmVal 109728)), 2)"
    "fetch 0x1acc8 \<equiv> (Binary (IS_8088 Mov) (Reg (General ThirtyTwo rdi)) (Immediate SixtyFour (ImmVal 64)), 5)"
    "fetch 0x1accd \<equiv> (Binary (IS_8088 Mov) (Memory SixtyFour (A_SizeDirective 64 (A_Plus (A_FromReg (General SixtyFour rsp)) (A_WordConstant 8)))) (Storage (Reg (General SixtyFour r8))), 5)"
    "fetch 0x1acd2 \<equiv> (Binary (IS_8088 Mov) (Memory SixtyFour (A_SizeDirective 64 (A_FromReg (General SixtyFour rsp)))) (Storage (Reg (General SixtyFour rcx))), 4)"
    "fetch 0x1acd6 \<equiv> (Unary (IS_8088 Call) (Immediate SixtyFour (ImmLabel ''qemu_mallocz'')), 5)"
    "fetch 0x1acdb \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour rcx)) (Storage (Memory SixtyFour (A_SizeDirective 64 (A_FromReg (General SixtyFour rsp))))), 4)"
    "fetch 0x1acdf \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour r8)) (Storage (Memory SixtyFour (A_SizeDirective 64 (A_Plus (A_FromReg (General SixtyFour rsp)) (A_WordConstant 8))))), 5)"
    "fetch 0x1ace4 \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour rdi)) (Storage (Reg (General SixtyFour rax))), 3)"
    "fetch 0x1ace7 \<equiv> (Binary (IS_8088 Mov) (Memory ThirtyTwo (A_SizeDirective 32 (A_FromReg (General SixtyFour rax)))) (Storage (Reg (General ThirtyTwo rbx))), 2)"
    "fetch 0x1ace9 \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour rax)) (Storage (Memory SixtyFour (A_SizeDirective 64 (A_Plus (A_FromReg (General SixtyFour rip)) (A_WordConstant 63168))))), 7)"
    "fetch 0x1acf0 \<equiv> (Binary (IS_8088 Test) (Reg (General SixtyFour rax)) (Storage (Reg (General SixtyFour rax))), 3)"
    "fetch 0x1acf3 \<equiv> (Binary (IS_8088 Mov) (Memory SixtyFour (A_SizeDirective 64 (A_Plus (A_FromReg (General SixtyFour rdi)) (A_WordConstant 48)))) (Storage (Reg (General SixtyFour rax))), 4)"
    "fetch 0x1acf7 \<equiv> (Unary (IS_8088 Je) (Immediate SixtyFour (ImmVal 109825)), 2)"
    "fetch 0x1acf9 \<equiv> (Binary (IS_8088 Lea) (Reg (General SixtyFour r9)) (Storage (Memory SixtyFour (A_Plus (A_FromReg (General SixtyFour rdi)) (A_WordConstant 48)))), 4)"
    "fetch 0x1acfd \<equiv> (Binary (IS_8088 Mov) (Memory SixtyFour (A_SizeDirective 64 (A_Plus (A_FromReg (General SixtyFour rax)) (A_WordConstant 56)))) (Storage (Reg (General SixtyFour r9))), 4)"
    "fetch 0x1ad01 \<equiv> (Binary (IS_8088 Lea) (Reg (General SixtyFour rax)) (Storage (Memory SixtyFour (A_Plus (A_FromReg (General SixtyFour rip)) (A_WordConstant 63144)))), 7)"
    "fetch 0x1ad08 \<equiv> (Binary (IS_8088 Mov) (Memory SixtyFour (A_SizeDirective 64 (A_Plus (A_FromReg (General SixtyFour rip)) (A_WordConstant 63137)))) (Storage (Reg (General SixtyFour rdi))), 7)"
    "fetch 0x1ad0f \<equiv> (Binary (IS_8088 Mov) (Memory SixtyFour (A_SizeDirective 64 (A_Plus (A_FromReg (General SixtyFour rdi)) (A_WordConstant 56)))) (Storage (Reg (General SixtyFour rax))), 4)"
    "fetch 0x1ad13 \<equiv> (Binary (IS_8088 Mov) (Memory SixtyFour (A_SizeDirective 64 (A_Plus (A_FromReg (General SixtyFour rdi)) (A_WordConstant 8)))) (Storage (Reg (General SixtyFour rbp))), 4)"
    "fetch 0x1ad17 \<equiv> (Binary (IS_8088 Mov) (Memory SixtyFour (A_SizeDirective 64 (A_Plus (A_FromReg (General SixtyFour rdi)) (A_WordConstant 16)))) (Storage (Reg (General SixtyFour r12))), 4)"
    "fetch 0x1ad1b \<equiv> (Binary (IS_8088 Mov) (Memory SixtyFour (A_SizeDirective 64 (A_Plus (A_FromReg (General SixtyFour rdi)) (A_WordConstant 24)))) (Storage (Reg (General SixtyFour rcx))), 4)"
    "fetch 0x1ad1f \<equiv> (Binary (IS_8088 Mov) (Memory SixtyFour (A_SizeDirective 64 (A_Plus (A_FromReg (General SixtyFour rdi)) (A_WordConstant 40)))) (Storage (Reg (General SixtyFour r8))), 4)"
    "fetch 0x1ad23 \<equiv> (Unary (IS_8088 Jmp) (Immediate SixtyFour (ImmVal 109728)), 5)"
    "fetch 0x1ad28 \<equiv> (Unary (IS_8088 Nop) (Storage (Memory ThirtyTwo (A_SizeDirective 32 (A_Plus (A_FromReg (General SixtyFour rax)) (A_Plus (A_Mult 1 (A_FromReg (General SixtyFour rax))) (A_WordConstant 0)))))), 8)"
    "fetch 0x1ad30 \<equiv> (Binary (IS_8088 Mov) (Memory ThirtyTwo (A_SizeDirective 32 (A_Plus (A_FromReg (General SixtyFour rdi)) (A_WordConstant 32)))) (Immediate SixtyFour (ImmVal 1)), 7)"
    "fetch 0x1ad37 \<equiv> (Unary (IS_8088 Jmp) (Immediate SixtyFour (ImmVal 109728)), 5)"
    and \<alpha>_def: \<open>\<alpha> = \<lparr>text_sections = [], data_sections = [], labels_to_offsets = [], binary_offset = 0\<rparr>\<close>
    and bdrv_read\<^sub>a\<^sub>d\<^sub>d\<^sub>r[simp]: \<open>the (label_to_address \<alpha> ''bdrv_read'') = bdrv_read_addr\<close>
    and bdrv_write\<^sub>a\<^sub>d\<^sub>d\<^sub>r[simp]: \<open>the (label_to_address \<alpha> ''bdrv_write'') = bdrv_write_addr\<close>
    and qemu_aio_get\<^sub>a\<^sub>d\<^sub>d\<^sub>r[simp]: \<open>the (label_to_address \<alpha> ''qemu_aio_get'') = qemu_aio_get_addr\<close>
    and qemu_bh_new\<^sub>a\<^sub>d\<^sub>d\<^sub>r[simp]: \<open>the (label_to_address \<alpha> ''qemu_bh_new'') = qemu_bh_new_addr\<close>
    and qemu_bh_schedule\<^sub>a\<^sub>d\<^sub>d\<^sub>r[simp]: \<open>the (label_to_address \<alpha> ''qemu_bh_schedule'') = qemu_bh_schedule_addr\<close>
    and qemu_free\<^sub>a\<^sub>d\<^sub>d\<^sub>r[simp]: \<open>the (label_to_address \<alpha> ''qemu_free'') = qemu_free_addr\<close>
    and qemu_mallocz\<^sub>a\<^sub>d\<^sub>d\<^sub>r[simp]: \<open>the (label_to_address \<alpha> ''qemu_mallocz'') = qemu_mallocz_addr\<close>
    and qemu_set_fd_handler2\<^sub>a\<^sub>d\<^sub>d\<^sub>r[simp]: \<open>the (label_to_address \<alpha> ''qemu_set_fd_handler2'') = qemu_set_fd_handler2_addr\<close>
begin

text \<open>Using definitions that don't get unfolded immediately prevents locale argument issues.\<close>
definition \<open>qemu_aio_get_0x1a79a_retval \<equiv> qemu_aio_get_0x1a79a_retval\<^sub>v\<close>
definition \<open>bdrv_read_0x1a7b5_retval \<equiv> bdrv_read_0x1a7b5_retval\<^sub>v\<close>
definition \<open>qemu_bh_schedule_0x1a7c1_retval \<equiv> qemu_bh_schedule_0x1a7c1_retval\<^sub>v\<close>
definition \<open>qemu_bh_new_0x1a7e2_retval \<equiv> qemu_bh_new_0x1a7e2_retval\<^sub>v\<close>
definition \<open>qemu_aio_get_0x1a80a_retval \<equiv> qemu_aio_get_0x1a80a_retval\<^sub>v\<close>
definition \<open>bdrv_write_0x1a825_retval \<equiv> bdrv_write_0x1a825_retval\<^sub>v\<close>
definition \<open>qemu_bh_schedule_0x1a831_retval \<equiv> qemu_bh_schedule_0x1a831_retval\<^sub>v\<close>
definition \<open>qemu_bh_new_0x1a852_retval \<equiv> qemu_bh_new_0x1a852_retval\<^sub>v\<close>
definition \<open>qemu_free_0x1ac97_retval \<equiv> qemu_free_0x1ac97_retval\<^sub>v\<close>
definition \<open>qemu_set_fd_handler2_0x1acaa_retval \<equiv> qemu_set_fd_handler2_0x1acaa_retval\<^sub>v\<close>
definition \<open>qemu_mallocz_0x1acd6_retval \<equiv> qemu_mallocz_0x1acd6_retval\<^sub>v\<close>

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

locale "qemu_aio_set_fd_handler" = "qemu_img_xen" +
  fixes RAX\<^sub>0\<^sub>v RBX\<^sub>0\<^sub>v RCX\<^sub>0\<^sub>v RDX\<^sub>0\<^sub>v RDI\<^sub>0\<^sub>v RSI\<^sub>0\<^sub>v RSP\<^sub>0\<^sub>v RBP\<^sub>0\<^sub>v R12\<^sub>0\<^sub>v R9\<^sub>0\<^sub>v R8\<^sub>0\<^sub>v ret_address\<^sub>v :: \<open>64 word\<close>
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
definition \<open>R9\<^sub>0 \<equiv> R9\<^sub>0\<^sub>v\<close>
definition \<open>R8\<^sub>0 \<equiv> R8\<^sub>0\<^sub>v\<close>
definition \<open>ret_address \<equiv> ret_address\<^sub>v\<close>

definition P_0x1ac30_0 :: state_pred where
  \<open>P_0x1ac30_0 \<sigma> \<equiv> RIP \<sigma> = 0x1ac30 \<and> RAX \<sigma> = RAX\<^sub>0 \<and> RBX \<sigma> = RBX\<^sub>0 \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = RDX\<^sub>0 \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = RSP\<^sub>0 \<and> RBP \<sigma> = RBP\<^sub>0 \<and> R12 \<sigma> = R12\<^sub>0 \<and> R9 \<sigma> = R9\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address\<close>
declare P_0x1ac30_0_def[Ps]

definition P_0x1ac30_0_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x1ac30_0_regions_set \<sigma> \<equiv> {
    (0, 0x2a3b0, 8),
    (1, RSP\<^sub>0, 8),
    (2, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x18), 8)
  }\<close>

definition P_0x1ac30_0_regions :: state_pred where
  \<open>P_0x1ac30_0_regions \<sigma> \<equiv> \<exists>regions. P_0x1ac30_0_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x1ac4a_0 :: state_pred where
  \<open>Q_0x1ac4a_0 \<sigma> \<equiv> RIP \<sigma> = 0x1ac4a \<and> RAX \<sigma> = RAX\<^sub>0 \<and> RBX \<sigma> = ucast ((\<langle>31,0\<rangle>RDI\<^sub>0::32 word)) \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = RDX\<^sub>0 \<and> RDI \<sigma> = (\<sigma> \<turnstile> *[0x2a3b0,8]::64 word) \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x28) \<and> RBP \<sigma> = RSI\<^sub>0 \<and> R12 \<sigma> = RDX\<^sub>0 \<and> R9 \<sigma> = R9\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> (\<sigma> \<turnstile> *[0x2a3b0,8]::64 word) = (\<sigma> \<turnstile> *[0x2a3b0,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBX\<^sub>0\<close>
declare Q_0x1ac4a_0_def[Qs]

schematic_goal qemu_aio_set_fd_handler_0_9_0x1ac30_0x1ac47_0[blocks]:
  assumes \<open>(P_0x1ac30_0 && P_0x1ac30_0_regions) \<sigma>\<close>
  shows \<open>exec_block 9 0x1ac47 0 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x1ac4a_0 ?\<sigma> \<and> block_usage P_0x1ac30_0_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x1ac30_0_def P_0x1ac30_0_regions_def post: Q_0x1ac4a_0_def regionset: P_0x1ac30_0_regions_set_def)

definition P_0x1ac4a_true_1 :: state_pred where
  \<open>P_0x1ac4a_true_1 \<sigma> \<equiv> RIP \<sigma> = 0x1ac4a \<and> RAX \<sigma> = RAX\<^sub>0 \<and> RBX \<sigma> = ucast ((\<langle>31,0\<rangle>RDI\<^sub>0::32 word)) \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = RDX\<^sub>0 \<and> RDI \<sigma> = (\<sigma> \<turnstile> *[0x2a3b0,8]::64 word) \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x28) \<and> RBP \<sigma> = RSI\<^sub>0 \<and> R12 \<sigma> = RDX\<^sub>0 \<and> R9 \<sigma> = R9\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> (\<sigma> \<turnstile> *[0x2a3b0,8]::64 word) = (\<sigma> \<turnstile> *[0x2a3b0,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBX\<^sub>0\<close>
declare P_0x1ac4a_true_1_def[Ps]

definition P_0x1ac4a_true_1_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x1ac4a_true_1_regions_set \<sigma> \<equiv> {
    (0, 0x2a3b0, 8),
    (1, RSP\<^sub>0, 8),
    (2, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x18), 8)
  }\<close>

definition P_0x1ac4a_true_1_regions :: state_pred where
  \<open>P_0x1ac4a_true_1_regions \<sigma> \<equiv> \<exists>regions. P_0x1ac4a_true_1_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x1ac59_1 :: state_pred where
  \<open>Q_0x1ac59_1 \<sigma> \<equiv> RIP \<sigma> = 0x1ac59 \<and> RAX \<sigma> = RAX\<^sub>0 \<and> RBX \<sigma> = ucast ((\<langle>31,0\<rangle>RDI\<^sub>0::32 word)) \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = RDX\<^sub>0 \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x28) \<and> RBP \<sigma> = RSI\<^sub>0 \<and> R12 \<sigma> = RDX\<^sub>0 \<and> R9 \<sigma> = R9\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> (\<sigma> \<turnstile> *[0x2a3b0,8]::64 word) = (\<sigma> \<turnstile> *[0x2a3b0,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBX\<^sub>0\<close>
declare Q_0x1ac59_1_def[Qs]

schematic_goal qemu_aio_set_fd_handler_0_1_0x1ac4a_0x1ac4a_1[blocks]:
  assumes \<open>(P_0x1ac4a_true_1 && P_0x1ac4a_true_1_regions && !ZF) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x1ac4a (Suc 0) \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x1ac59_1 ?\<sigma> \<and> block_usage P_0x1ac4a_true_1_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x1ac4a_true_1_def P_0x1ac4a_true_1_regions_def post: Q_0x1ac59_1_def regionset: P_0x1ac4a_true_1_regions_set_def)

definition P_0x1ac59_2 :: state_pred where
  \<open>P_0x1ac59_2 \<sigma> \<equiv> RIP \<sigma> = 0x1ac59 \<and> RAX \<sigma> = RAX\<^sub>0 \<and> RBX \<sigma> = ucast ((\<langle>31,0\<rangle>RDI\<^sub>0::32 word)) \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = RDX\<^sub>0 \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x28) \<and> RBP \<sigma> = RSI\<^sub>0 \<and> R12 \<sigma> = RDX\<^sub>0 \<and> R9 \<sigma> = R9\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> (\<sigma> \<turnstile> *[0x2a3b0,8]::64 word) = (\<sigma> \<turnstile> *[0x2a3b0,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBX\<^sub>0\<close>
declare P_0x1ac59_2_def[Ps]

definition P_0x1ac59_2_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x1ac59_2_regions_set \<sigma> \<equiv> {
    (0, RDI \<sigma>, 4),
    (1, 0x2a3b0, 8),
    (2, RSP\<^sub>0, 8),
    (3, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x18), 8)
  }\<close>

definition P_0x1ac59_2_regions :: state_pred where
  \<open>P_0x1ac59_2_regions \<sigma> \<equiv> \<exists>regions. P_0x1ac59_2_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x1ac5b_2 :: state_pred where
  \<open>Q_0x1ac5b_2 \<sigma> \<equiv> RIP \<sigma> = 0x1ac5b \<and> RAX \<sigma> = RAX\<^sub>0 \<and> RBX \<sigma> = ucast ((\<langle>31,0\<rangle>RDI\<^sub>0::32 word)) \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = RDX\<^sub>0 \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x28) \<and> RBP \<sigma> = RSI\<^sub>0 \<and> R12 \<sigma> = RDX\<^sub>0 \<and> R9 \<sigma> = R9\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> (\<sigma> \<turnstile> *[RDI \<sigma>,4]::32 word) = ucast ((\<sigma> \<turnstile> *[RDI \<sigma>,4]::32 word)) \<and> (\<sigma> \<turnstile> *[0x2a3b0,8]::64 word) = (\<sigma> \<turnstile> *[0x2a3b0,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBX\<^sub>0\<close>
declare Q_0x1ac5b_2_def[Qs]

schematic_goal qemu_aio_set_fd_handler_0_1_0x1ac59_0x1ac59_2[blocks]:
  assumes \<open>(P_0x1ac59_2 && P_0x1ac59_2_regions) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x1ac59 2 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x1ac5b_2 ?\<sigma> \<and> block_usage P_0x1ac59_2_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x1ac59_2_def P_0x1ac59_2_regions_def post: Q_0x1ac5b_2_def regionset: P_0x1ac59_2_regions_set_def)

definition P_0x1ac5b_true_3 :: state_pred where
  \<open>P_0x1ac5b_true_3 \<sigma> \<equiv> RIP \<sigma> = 0x1ac5b \<and> RAX \<sigma> = RAX\<^sub>0 \<and> RBX \<sigma> = ucast ((\<langle>31,0\<rangle>RDI\<^sub>0::32 word)) \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = RDX\<^sub>0 \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x28) \<and> RBP \<sigma> = RSI\<^sub>0 \<and> R12 \<sigma> = RDX\<^sub>0 \<and> R9 \<sigma> = R9\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> (\<sigma> \<turnstile> *[RDI \<sigma>,4]::32 word) = ucast ((\<sigma> \<turnstile> *[RDI \<sigma>,4]::32 word)) \<and> (\<sigma> \<turnstile> *[0x2a3b0,8]::64 word) = (\<sigma> \<turnstile> *[0x2a3b0,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBX\<^sub>0\<close>
declare P_0x1ac5b_true_3_def[Ps]

definition P_0x1ac5b_true_3_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x1ac5b_true_3_regions_set \<sigma> \<equiv> {
    (0, RDI \<sigma>, 4),
    (1, 0x2a3b0, 8),
    (2, RSP\<^sub>0, 8),
    (3, ((RDI \<sigma>::64 word) + 0x30), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x18), 8)
  }\<close>

definition P_0x1ac5b_true_3_regions :: state_pred where
  \<open>P_0x1ac5b_true_3_regions \<sigma> \<equiv> \<exists>regions. P_0x1ac5b_true_3_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x1ac57_3 :: state_pred where
  \<open>Q_0x1ac57_3 \<sigma> \<equiv> RIP \<sigma> = 0x1ac57 \<and> RAX \<sigma> = RAX\<^sub>0 \<and> RBX \<sigma> = ucast ((\<langle>31,0\<rangle>RDI\<^sub>0::32 word)) \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = RDX\<^sub>0 \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x28) \<and> RBP \<sigma> = RSI\<^sub>0 \<and> R12 \<sigma> = RDX\<^sub>0 \<and> R9 \<sigma> = R9\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> (\<sigma> \<turnstile> *[0x2a3b0,8]::64 word) = (\<sigma> \<turnstile> *[0x2a3b0,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBX\<^sub>0\<close>
declare Q_0x1ac57_3_def[Qs]

schematic_goal qemu_aio_set_fd_handler_0_3_0x1ac5b_0x1ac54_3[blocks]:
  assumes \<open>(P_0x1ac5b_true_3 && P_0x1ac5b_true_3_regions && !ZF) \<sigma>\<close>
  shows \<open>exec_block 3 0x1ac54 3 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x1ac57_3 ?\<sigma> \<and> block_usage P_0x1ac5b_true_3_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x1ac5b_true_3_def P_0x1ac5b_true_3_regions_def post: Q_0x1ac57_3_def regionset: P_0x1ac5b_true_3_regions_set_def)

definition P_0x1ac57_true_4 :: state_pred where
  \<open>P_0x1ac57_true_4 \<sigma> \<equiv> RIP \<sigma> = 0x1ac57 \<and> RAX \<sigma> = RAX\<^sub>0 \<and> RBX \<sigma> = ucast ((\<langle>31,0\<rangle>RDI\<^sub>0::32 word)) \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = RDX\<^sub>0 \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x28) \<and> RBP \<sigma> = RSI\<^sub>0 \<and> R12 \<sigma> = RDX\<^sub>0 \<and> R9 \<sigma> = R9\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> (\<sigma> \<turnstile> *[0x2a3b0,8]::64 word) = (\<sigma> \<turnstile> *[0x2a3b0,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBX\<^sub>0\<close>
declare P_0x1ac57_true_4_def[Ps]

definition P_0x1ac57_true_4_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x1ac57_true_4_regions_set \<sigma> \<equiv> {
    (0, 0x2a3b0, 8),
    (1, RSP\<^sub>0, 8),
    (2, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x18), 8)
  }\<close>

definition P_0x1ac57_true_4_regions :: state_pred where
  \<open>P_0x1ac57_true_4_regions \<sigma> \<equiv> \<exists>regions. P_0x1ac57_true_4_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x1acc0_4 :: state_pred where
  \<open>Q_0x1acc0_4 \<sigma> \<equiv> RIP \<sigma> = 0x1acc0 \<and> RAX \<sigma> = RAX\<^sub>0 \<and> RBX \<sigma> = ucast ((\<langle>31,0\<rangle>RDI\<^sub>0::32 word)) \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = RDX\<^sub>0 \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x28) \<and> RBP \<sigma> = RSI\<^sub>0 \<and> R12 \<sigma> = RDX\<^sub>0 \<and> R9 \<sigma> = R9\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> (\<sigma> \<turnstile> *[0x2a3b0,8]::64 word) = (\<sigma> \<turnstile> *[0x2a3b0,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBX\<^sub>0\<close>
declare Q_0x1acc0_4_def[Qs]

schematic_goal qemu_aio_set_fd_handler_0_1_0x1ac57_0x1ac57_4[blocks]:
  assumes \<open>(P_0x1ac57_true_4 && P_0x1ac57_true_4_regions && ZF) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x1ac57 4 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x1acc0_4 ?\<sigma> \<and> block_usage P_0x1ac57_true_4_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x1ac57_true_4_def P_0x1ac57_true_4_regions_def post: Q_0x1acc0_4_def regionset: P_0x1ac57_true_4_regions_set_def)

definition P_0x1ac57_false_5 :: state_pred where
  \<open>P_0x1ac57_false_5 \<sigma> \<equiv> RIP \<sigma> = 0x1ac57 \<and> RAX \<sigma> = RAX\<^sub>0 \<and> RBX \<sigma> = ucast ((\<langle>31,0\<rangle>RDI\<^sub>0::32 word)) \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = RDX\<^sub>0 \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x28) \<and> RBP \<sigma> = RSI\<^sub>0 \<and> R12 \<sigma> = RDX\<^sub>0 \<and> R9 \<sigma> = R9\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> (\<sigma> \<turnstile> *[0x2a3b0,8]::64 word) = (\<sigma> \<turnstile> *[0x2a3b0,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBX\<^sub>0\<close>
declare P_0x1ac57_false_5_def[Ps]

definition P_0x1ac57_false_5_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x1ac57_false_5_regions_set \<sigma> \<equiv> {
    (0, 0x2a3b0, 8),
    (1, RSP\<^sub>0, 8),
    (2, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x18), 8)
  }\<close>

definition P_0x1ac57_false_5_regions :: state_pred where
  \<open>P_0x1ac57_false_5_regions \<sigma> \<equiv> \<exists>regions. P_0x1ac57_false_5_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x1ac59_5 :: state_pred where
  \<open>Q_0x1ac59_5 \<sigma> \<equiv> RIP \<sigma> = 0x1ac59 \<and> RAX \<sigma> = RAX\<^sub>0 \<and> RBX \<sigma> = ucast ((\<langle>31,0\<rangle>RDI\<^sub>0::32 word)) \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = RDX\<^sub>0 \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x28) \<and> RBP \<sigma> = RSI\<^sub>0 \<and> R12 \<sigma> = RDX\<^sub>0 \<and> R9 \<sigma> = R9\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> (\<sigma> \<turnstile> *[0x2a3b0,8]::64 word) = (\<sigma> \<turnstile> *[0x2a3b0,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBX\<^sub>0\<close>
declare Q_0x1ac59_5_def[Qs]

schematic_goal qemu_aio_set_fd_handler_0_1_0x1ac57_0x1ac57_5[blocks]:
  assumes \<open>(P_0x1ac57_false_5 && P_0x1ac57_false_5_regions && ! ZF) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x1ac57 5 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x1ac59_5 ?\<sigma> \<and> block_usage P_0x1ac57_false_5_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x1ac57_false_5_def P_0x1ac57_false_5_regions_def post: Q_0x1ac59_5_def regionset: P_0x1ac57_false_5_regions_set_def)

definition P_0x1ac5b_false_6 :: state_pred where
  \<open>P_0x1ac5b_false_6 \<sigma> \<equiv> RIP \<sigma> = 0x1ac5b \<and> RAX \<sigma> = RAX\<^sub>0 \<and> RBX \<sigma> = ucast ((\<langle>31,0\<rangle>RDI\<^sub>0::32 word)) \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = RDX\<^sub>0 \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x28) \<and> RBP \<sigma> = RSI\<^sub>0 \<and> R12 \<sigma> = RDX\<^sub>0 \<and> R9 \<sigma> = R9\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> (\<sigma> \<turnstile> *[RDI \<sigma>,4]::32 word) = ucast ((\<sigma> \<turnstile> *[RDI \<sigma>,4]::32 word)) \<and> (\<sigma> \<turnstile> *[0x2a3b0,8]::64 word) = (\<sigma> \<turnstile> *[0x2a3b0,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBX\<^sub>0\<close>
declare P_0x1ac5b_false_6_def[Ps]

definition P_0x1ac5b_false_6_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x1ac5b_false_6_regions_set \<sigma> \<equiv> {
    (0, RDI \<sigma>, 4),
    (1, 0x2a3b0, 8),
    (2, RSP\<^sub>0, 8),
    (3, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x18), 8)
  }\<close>

definition P_0x1ac5b_false_6_regions :: state_pred where
  \<open>P_0x1ac5b_false_6_regions \<sigma> \<equiv> \<exists>regions. P_0x1ac5b_false_6_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x1ac5d_6 :: state_pred where
  \<open>Q_0x1ac5d_6 \<sigma> \<equiv> RIP \<sigma> = 0x1ac5d \<and> RAX \<sigma> = RAX\<^sub>0 \<and> RBX \<sigma> = ucast ((\<langle>31,0\<rangle>RDI\<^sub>0::32 word)) \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = RDX\<^sub>0 \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x28) \<and> RBP \<sigma> = RSI\<^sub>0 \<and> R12 \<sigma> = RDX\<^sub>0 \<and> R9 \<sigma> = R9\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> (\<sigma> \<turnstile> *[0x2a3b0,8]::64 word) = (\<sigma> \<turnstile> *[0x2a3b0,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBX\<^sub>0\<close>
declare Q_0x1ac5d_6_def[Qs]

schematic_goal qemu_aio_set_fd_handler_0_1_0x1ac5b_0x1ac5b_6[blocks]:
  assumes \<open>(P_0x1ac5b_false_6 && P_0x1ac5b_false_6_regions && ! !ZF) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x1ac5b 6 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x1ac5d_6 ?\<sigma> \<and> block_usage P_0x1ac5b_false_6_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x1ac5b_false_6_def P_0x1ac5b_false_6_regions_def post: Q_0x1ac5d_6_def regionset: P_0x1ac5b_false_6_regions_set_def)

definition P_0x1acc0_7 :: state_pred where
  \<open>P_0x1acc0_7 \<sigma> \<equiv> RIP \<sigma> = 0x1acc0 \<and> RAX \<sigma> = RAX\<^sub>0 \<and> RBX \<sigma> = ucast ((\<langle>31,0\<rangle>RDI\<^sub>0::32 word)) \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = RDX\<^sub>0 \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x28) \<and> RBP \<sigma> = RSI\<^sub>0 \<and> R12 \<sigma> = RDX\<^sub>0 \<and> R9 \<sigma> = R9\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> (\<sigma> \<turnstile> *[0x2a3b0,8]::64 word) = (\<sigma> \<turnstile> *[0x2a3b0,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBX\<^sub>0\<close>
declare P_0x1acc0_7_def[Ps]

definition P_0x1acc0_7_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x1acc0_7_regions_set \<sigma> \<equiv> {
    (0, 0x2a3b0, 8),
    (1, RSP\<^sub>0, 8),
    (2, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x18), 8)
  }\<close>

definition P_0x1acc0_7_regions :: state_pred where
  \<open>P_0x1acc0_7_regions \<sigma> \<equiv> \<exists>regions. P_0x1acc0_7_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x1acc6_7 :: state_pred where
  \<open>Q_0x1acc6_7 \<sigma> \<equiv> RIP \<sigma> = 0x1acc6 \<and> RAX \<sigma> = ((RSI\<^sub>0::64 word) OR RDX\<^sub>0) \<and> RBX \<sigma> = ucast ((\<langle>31,0\<rangle>RDI\<^sub>0::32 word)) \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = RDX\<^sub>0 \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x28) \<and> RBP \<sigma> = RSI\<^sub>0 \<and> R12 \<sigma> = RDX\<^sub>0 \<and> R9 \<sigma> = R9\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> (\<sigma> \<turnstile> *[0x2a3b0,8]::64 word) = (\<sigma> \<turnstile> *[0x2a3b0,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBX\<^sub>0\<close>
declare Q_0x1acc6_7_def[Qs]

schematic_goal qemu_aio_set_fd_handler_0_2_0x1acc0_0x1acc3_7[blocks]:
  assumes \<open>(P_0x1acc0_7 && P_0x1acc0_7_regions) \<sigma>\<close>
  shows \<open>exec_block 2 0x1acc3 7 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x1acc6_7 ?\<sigma> \<and> block_usage P_0x1acc0_7_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x1acc0_7_def P_0x1acc0_7_regions_def post: Q_0x1acc6_7_def regionset: P_0x1acc0_7_regions_set_def)

definition P_0x1acc6_true_8 :: state_pred where
  \<open>P_0x1acc6_true_8 \<sigma> \<equiv> RIP \<sigma> = 0x1acc6 \<and> RAX \<sigma> = ((RSI\<^sub>0::64 word) OR RDX\<^sub>0) \<and> RBX \<sigma> = ucast ((\<langle>31,0\<rangle>RDI\<^sub>0::32 word)) \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = RDX\<^sub>0 \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x28) \<and> RBP \<sigma> = RSI\<^sub>0 \<and> R12 \<sigma> = RDX\<^sub>0 \<and> R9 \<sigma> = R9\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> (\<sigma> \<turnstile> *[0x2a3b0,8]::64 word) = (\<sigma> \<turnstile> *[0x2a3b0,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBX\<^sub>0\<close>
declare P_0x1acc6_true_8_def[Ps]

definition P_0x1acc6_true_8_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x1acc6_true_8_regions_set \<sigma> \<equiv> {
    (0, 0x2a3b0, 8),
    (1, RSP\<^sub>0, 8),
    (2, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x18), 8)
  }\<close>

definition P_0x1acc6_true_8_regions :: state_pred where
  \<open>P_0x1acc6_true_8_regions \<sigma> \<equiv> \<exists>regions. P_0x1acc6_true_8_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x1aca0_8 :: state_pred where
  \<open>Q_0x1aca0_8 \<sigma> \<equiv> RIP \<sigma> = 0x1aca0 \<and> RBX \<sigma> = ucast ((\<langle>31,0\<rangle>RDI\<^sub>0::32 word)) \<and> RDX \<sigma> = RDX\<^sub>0 \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x28) \<and> RBP \<sigma> = RSI\<^sub>0 \<and> R12 \<sigma> = RDX\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBX\<^sub>0\<close>
declare Q_0x1aca0_8_def[Qs]

schematic_goal qemu_aio_set_fd_handler_0_1_0x1acc6_0x1acc6_8[blocks]:
  assumes \<open>(P_0x1acc6_true_8 && P_0x1acc6_true_8_regions && ZF) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x1acc6 8 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x1aca0_8 ?\<sigma> \<and> block_usage P_0x1acc6_true_8_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x1acc6_true_8_def P_0x1acc6_true_8_regions_def post: Q_0x1aca0_8_def regionset: P_0x1acc6_true_8_regions_set_def)

definition P_0x1acc6_false_9 :: state_pred where
  \<open>P_0x1acc6_false_9 \<sigma> \<equiv> RIP \<sigma> = 0x1acc6 \<and> RAX \<sigma> = ((RSI\<^sub>0::64 word) OR RDX\<^sub>0) \<and> RBX \<sigma> = ucast ((\<langle>31,0\<rangle>RDI\<^sub>0::32 word)) \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = RDX\<^sub>0 \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x28) \<and> RBP \<sigma> = RSI\<^sub>0 \<and> R12 \<sigma> = RDX\<^sub>0 \<and> R9 \<sigma> = R9\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> (\<sigma> \<turnstile> *[0x2a3b0,8]::64 word) = (\<sigma> \<turnstile> *[0x2a3b0,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBX\<^sub>0\<close>
declare P_0x1acc6_false_9_def[Ps]

definition P_0x1acc6_false_9_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x1acc6_false_9_regions_set \<sigma> \<equiv> {
    (0, 0x2a3b0, 8),
    (1, RSP\<^sub>0, 8),
    (2, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x28), 8)
  }\<close>

definition P_0x1acc6_false_9_regions :: state_pred where
  \<open>P_0x1acc6_false_9_regions \<sigma> \<equiv> \<exists>regions. P_0x1acc6_false_9_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x1acd6_9 :: state_pred where
  \<open>Q_0x1acd6_9 \<sigma> \<equiv> RIP \<sigma> = 0x1acd6 \<and> RAX \<sigma> = ((RSI\<^sub>0::64 word) OR RDX\<^sub>0) \<and> RBX \<sigma> = ucast ((\<langle>31,0\<rangle>RDI\<^sub>0::32 word)) \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = RDX\<^sub>0 \<and> RDI \<sigma> = 0x40 \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x28) \<and> RBP \<sigma> = RSI\<^sub>0 \<and> R12 \<sigma> = RDX\<^sub>0 \<and> R9 \<sigma> = R9\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> (\<sigma> \<turnstile> *[0x2a3b0,8]::64 word) = (\<sigma> \<turnstile> *[0x2a3b0,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R8\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RCX\<^sub>0\<close>
declare Q_0x1acd6_9_def[Qs]

schematic_goal qemu_aio_set_fd_handler_0_4_0x1acc6_0x1acd2_9[blocks]:
  assumes \<open>(P_0x1acc6_false_9 && P_0x1acc6_false_9_regions && ! ZF) \<sigma>\<close>
  shows \<open>exec_block 4 0x1acd2 9 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x1acd6_9 ?\<sigma> \<and> block_usage P_0x1acc6_false_9_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x1acc6_false_9_def P_0x1acc6_false_9_regions_def post: Q_0x1acd6_9_def regionset: P_0x1acc6_false_9_regions_set_def)

definition P_0x1acd6_10 :: state_pred where
  \<open>P_0x1acd6_10 \<sigma> \<equiv> RIP \<sigma> = 0x1acd6 \<and> RAX \<sigma> = ((RSI\<^sub>0::64 word) OR RDX\<^sub>0) \<and> RBX \<sigma> = ucast ((\<langle>31,0\<rangle>RDI\<^sub>0::32 word)) \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = RDX\<^sub>0 \<and> RDI \<sigma> = 0x40 \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x28) \<and> RBP \<sigma> = RSI\<^sub>0 \<and> R12 \<sigma> = RDX\<^sub>0 \<and> R9 \<sigma> = R9\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> (\<sigma> \<turnstile> *[0x2a3b0,8]::64 word) = (\<sigma> \<turnstile> *[0x2a3b0,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R8\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RCX\<^sub>0\<close>
declare P_0x1acd6_10_def[Ps]

definition P_0x1acd6_10_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x1acd6_10_regions_set \<sigma> \<equiv> {
    (0, 0x2a3b0, 8),
    (1, RSP\<^sub>0, 8),
    (2, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x30), 8)
  }\<close>

definition P_0x1acd6_10_regions :: state_pred where
  \<open>P_0x1acd6_10_regions \<sigma> \<equiv> \<exists>regions. P_0x1acd6_10_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_qemu_mallocz_addr_0x1acd6_10 :: state_pred where
  \<open>Q_qemu_mallocz_addr_0x1acd6_10 \<sigma> \<equiv> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x30) \<and> RIP \<sigma> = qemu_mallocz_addr \<and> RAX \<sigma> = ((RSI\<^sub>0::64 word) OR RDX\<^sub>0) \<and> RBX \<sigma> = ucast ((\<langle>31,0\<rangle>RDI\<^sub>0::32 word)) \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = RDX\<^sub>0 \<and> RDI \<sigma> = 0x40 \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RBP \<sigma> = RSI\<^sub>0 \<and> R12 \<sigma> = RDX\<^sub>0 \<and> R9 \<sigma> = R9\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> (\<sigma> \<turnstile> *[0x2a3b0,8]::64 word) = (\<sigma> \<turnstile> *[0x2a3b0,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R8\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RCX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = 0x1acdb\<close>
declare Q_qemu_mallocz_addr_0x1acd6_10_def[Qs]

schematic_goal qemu_aio_set_fd_handler_0_1_0x1acd6_0x1acd6_10[blocks]:
  assumes \<open>(P_0x1acd6_10 && P_0x1acd6_10_regions) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x1acd6 10 \<sigma> \<triangleq> ?\<sigma> \<and> Q_qemu_mallocz_addr_0x1acd6_10 ?\<sigma> \<and> block_usage P_0x1acd6_10_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x1acd6_10_def P_0x1acd6_10_regions_def post: Q_qemu_mallocz_addr_0x1acd6_10_def regionset: P_0x1acd6_10_regions_set_def)

definition P_0x1acdb_11 :: state_pred where
  \<open>P_0x1acdb_11 \<sigma> \<equiv> RIP \<sigma> = 0x1acdb \<and> RAX \<sigma> = qemu_mallocz_0x1acd6_retval \<and> RBX \<sigma> = ucast ((\<langle>31,0\<rangle>RDI\<^sub>0::32 word)) \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = RDX\<^sub>0 \<and> RDI \<sigma> = 0x40 \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x28) \<and> RBP \<sigma> = RSI\<^sub>0 \<and> R12 \<sigma> = RDX\<^sub>0 \<and> R9 \<sigma> = R9\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> (\<sigma> \<turnstile> *[0x2a3b0,8]::64 word) = (\<sigma> \<turnstile> *[0x2a3b0,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R8\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RCX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = 0x1acdb\<close>
declare P_0x1acdb_11_def[Ps]

definition P_0x1acdb_11_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x1acdb_11_regions_set \<sigma> \<equiv> {
    (0, 0x2a3b0, 8),
    (1, RSP\<^sub>0, 8),
    (2, ((qemu_mallocz_0x1acd6_retval::64 word) + 0x30), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (9, qemu_mallocz_0x1acd6_retval, 4)
  }\<close>

definition P_0x1acdb_11_regions :: state_pred where
  \<open>P_0x1acdb_11_regions \<sigma> \<equiv> \<exists>regions. P_0x1acdb_11_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x1acf7_11 :: state_pred where
  \<open>Q_0x1acf7_11 \<sigma> \<equiv> RIP \<sigma> = 0x1acf7 \<and> RAX \<sigma> = (\<sigma> \<turnstile> *[0x2a3b0,8]::64 word) \<and> RBX \<sigma> = ucast ((\<langle>31,0\<rangle>RDI\<^sub>0::32 word)) \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = RDX\<^sub>0 \<and> RDI \<sigma> = qemu_mallocz_0x1acd6_retval \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x28) \<and> RBP \<sigma> = RSI\<^sub>0 \<and> R12 \<sigma> = RDX\<^sub>0 \<and> R9 \<sigma> = R9\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> (\<sigma> \<turnstile> *[0x2a3b0,8]::64 word) = (\<sigma> \<turnstile> *[0x2a3b0,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((qemu_mallocz_0x1acd6_retval::64 word) + 0x30),8]::64 word) = (\<sigma> \<turnstile> *[0x2a3b0,8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R8\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RCX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = 0x1acdb \<and> (\<sigma> \<turnstile> *[qemu_mallocz_0x1acd6_retval,4]::32 word) = ucast ((\<langle>31,0\<rangle>RDI\<^sub>0::32 word))\<close>
declare Q_0x1acf7_11_def[Qs]

schematic_goal qemu_aio_set_fd_handler_0_7_0x1acdb_0x1acf3_11[blocks]:
  assumes \<open>(P_0x1acdb_11 && P_0x1acdb_11_regions) \<sigma>\<close>
  shows \<open>exec_block 7 0x1acf3 11 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x1acf7_11 ?\<sigma> \<and> block_usage P_0x1acdb_11_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x1acdb_11_def P_0x1acdb_11_regions_def post: Q_0x1acf7_11_def regionset: P_0x1acdb_11_regions_set_def)

definition P_0x1acf7_true_12 :: state_pred where
  \<open>P_0x1acf7_true_12 \<sigma> \<equiv> RIP \<sigma> = 0x1acf7 \<and> RAX \<sigma> = (\<sigma> \<turnstile> *[0x2a3b0,8]::64 word) \<and> RBX \<sigma> = ucast ((\<langle>31,0\<rangle>RDI\<^sub>0::32 word)) \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = RDX\<^sub>0 \<and> RDI \<sigma> = qemu_mallocz_0x1acd6_retval \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x28) \<and> RBP \<sigma> = RSI\<^sub>0 \<and> R12 \<sigma> = RDX\<^sub>0 \<and> R9 \<sigma> = R9\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> (\<sigma> \<turnstile> *[0x2a3b0,8]::64 word) = (\<sigma> \<turnstile> *[0x2a3b0,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((qemu_mallocz_0x1acd6_retval::64 word) + 0x30),8]::64 word) = (\<sigma> \<turnstile> *[0x2a3b0,8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R8\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RCX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = 0x1acdb \<and> (\<sigma> \<turnstile> *[qemu_mallocz_0x1acd6_retval,4]::32 word) = ucast ((\<langle>31,0\<rangle>RDI\<^sub>0::32 word))\<close>
declare P_0x1acf7_true_12_def[Ps]

definition P_0x1acf7_true_12_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x1acf7_true_12_regions_set \<sigma> \<equiv> {
    (0, 0x2a3b0, 8),
    (1, RSP\<^sub>0, 8),
    (2, ((qemu_mallocz_0x1acd6_retval::64 word) + 0x30), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (9, qemu_mallocz_0x1acd6_retval, 4)
  }\<close>

definition P_0x1acf7_true_12_regions :: state_pred where
  \<open>P_0x1acf7_true_12_regions \<sigma> \<equiv> \<exists>regions. P_0x1acf7_true_12_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x1ad01_12 :: state_pred where
  \<open>Q_0x1ad01_12 \<sigma> \<equiv> RIP \<sigma> = 0x1ad01 \<and> RAX \<sigma> = (\<sigma> \<turnstile> *[0x2a3b0,8]::64 word) \<and> RBX \<sigma> = ucast ((\<langle>31,0\<rangle>RDI\<^sub>0::32 word)) \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = RDX\<^sub>0 \<and> RDI \<sigma> = qemu_mallocz_0x1acd6_retval \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x28) \<and> RBP \<sigma> = RSI\<^sub>0 \<and> R12 \<sigma> = RDX\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> (\<sigma> \<turnstile> *[0x2a3b0,8]::64 word) = (\<sigma> \<turnstile> *[0x2a3b0,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((qemu_mallocz_0x1acd6_retval::64 word) + 0x30),8]::64 word) = (\<sigma> \<turnstile> *[0x2a3b0,8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R8\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RCX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = 0x1acdb \<and> (\<sigma> \<turnstile> *[qemu_mallocz_0x1acd6_retval,4]::32 word) = ucast ((\<langle>31,0\<rangle>RDI\<^sub>0::32 word))\<close>
declare Q_0x1ad01_12_def[Qs]

schematic_goal qemu_aio_set_fd_handler_0_1_0x1acf7_0x1acf7_12[blocks]:
  assumes \<open>(P_0x1acf7_true_12 && P_0x1acf7_true_12_regions && ZF) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x1acf7 12 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x1ad01_12 ?\<sigma> \<and> block_usage P_0x1acf7_true_12_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x1acf7_true_12_def P_0x1acf7_true_12_regions_def post: Q_0x1ad01_12_def regionset: P_0x1acf7_true_12_regions_set_def)

definition P_0x1acf7_false_13 :: state_pred where
  \<open>P_0x1acf7_false_13 \<sigma> \<equiv> RIP \<sigma> = 0x1acf7 \<and> RAX \<sigma> = (\<sigma> \<turnstile> *[0x2a3b0,8]::64 word) \<and> RBX \<sigma> = ucast ((\<langle>31,0\<rangle>RDI\<^sub>0::32 word)) \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = RDX\<^sub>0 \<and> RDI \<sigma> = qemu_mallocz_0x1acd6_retval \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x28) \<and> RBP \<sigma> = RSI\<^sub>0 \<and> R12 \<sigma> = RDX\<^sub>0 \<and> R9 \<sigma> = R9\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> (\<sigma> \<turnstile> *[0x2a3b0,8]::64 word) = (\<sigma> \<turnstile> *[0x2a3b0,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((qemu_mallocz_0x1acd6_retval::64 word) + 0x30),8]::64 word) = (\<sigma> \<turnstile> *[0x2a3b0,8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R8\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RCX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = 0x1acdb \<and> (\<sigma> \<turnstile> *[qemu_mallocz_0x1acd6_retval,4]::32 word) = ucast ((\<langle>31,0\<rangle>RDI\<^sub>0::32 word))\<close>
declare P_0x1acf7_false_13_def[Ps]

definition P_0x1acf7_false_13_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x1acf7_false_13_regions_set \<sigma> \<equiv> {
    (0, 0x2a3b0, 8),
    (1, RSP\<^sub>0, 8),
    (2, ((qemu_mallocz_0x1acd6_retval::64 word) + 0x30), 8),
    (3, (((\<sigma> \<turnstile> *[0x2a3b0,8]::64 word)::64 word) + 0x38), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (10, qemu_mallocz_0x1acd6_retval, 4)
  }\<close>

definition P_0x1acf7_false_13_regions :: state_pred where
  \<open>P_0x1acf7_false_13_regions \<sigma> \<equiv> \<exists>regions. P_0x1acf7_false_13_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x1ad01_13 :: state_pred where
  \<open>Q_0x1ad01_13 \<sigma> \<equiv> RIP \<sigma> = 0x1ad01 \<and> RAX \<sigma> = (\<sigma> \<turnstile> *[0x2a3b0,8]::64 word) \<and> RBX \<sigma> = ucast ((\<langle>31,0\<rangle>RDI\<^sub>0::32 word)) \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = RDX\<^sub>0 \<and> RDI \<sigma> = qemu_mallocz_0x1acd6_retval \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x28) \<and> RBP \<sigma> = RSI\<^sub>0 \<and> R12 \<sigma> = RDX\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> (\<sigma> \<turnstile> *[0x2a3b0,8]::64 word) = (\<sigma> \<turnstile> *[0x2a3b0,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((qemu_mallocz_0x1acd6_retval::64 word) + 0x30),8]::64 word) = (\<sigma> \<turnstile> *[0x2a3b0,8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R8\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RCX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = 0x1acdb \<and> (\<sigma> \<turnstile> *[qemu_mallocz_0x1acd6_retval,4]::32 word) = ucast ((\<langle>31,0\<rangle>RDI\<^sub>0::32 word))\<close>
declare Q_0x1ad01_13_def[Qs]

schematic_goal qemu_aio_set_fd_handler_0_3_0x1acf7_0x1acfd_13[blocks]:
  assumes \<open>(P_0x1acf7_false_13 && P_0x1acf7_false_13_regions && ! ZF) \<sigma>\<close>
  shows \<open>exec_block 3 0x1acfd 13 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x1ad01_13 ?\<sigma> \<and> block_usage P_0x1acf7_false_13_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x1acf7_false_13_def P_0x1acf7_false_13_regions_def post: Q_0x1ad01_13_def regionset: P_0x1acf7_false_13_regions_set_def)

definition P_0x1ad01_14 :: state_pred where
  \<open>P_0x1ad01_14 \<sigma> \<equiv> RIP \<sigma> = 0x1ad01 \<and> RAX \<sigma> = (\<sigma> \<turnstile> *[0x2a3b0,8]::64 word) \<and> RBX \<sigma> = ucast ((\<langle>31,0\<rangle>RDI\<^sub>0::32 word)) \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = RDX\<^sub>0 \<and> RDI \<sigma> = qemu_mallocz_0x1acd6_retval \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x28) \<and> RBP \<sigma> = RSI\<^sub>0 \<and> R12 \<sigma> = RDX\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> (\<sigma> \<turnstile> *[0x2a3b0,8]::64 word) = (\<sigma> \<turnstile> *[0x2a3b0,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((qemu_mallocz_0x1acd6_retval::64 word) + 0x30),8]::64 word) = (\<sigma> \<turnstile> *[0x2a3b0,8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R8\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RCX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = 0x1acdb \<and> (\<sigma> \<turnstile> *[qemu_mallocz_0x1acd6_retval,4]::32 word) = ucast ((\<langle>31,0\<rangle>RDI\<^sub>0::32 word))\<close>
declare P_0x1ad01_14_def[Ps]

definition P_0x1ad01_14_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x1ad01_14_regions_set \<sigma> \<equiv> {
    (0, 0x2a3b0, 8),
    (1, RSP\<^sub>0, 8),
    (2, ((qemu_mallocz_0x1acd6_retval::64 word) + 0x30), 8),
    (3, ((qemu_mallocz_0x1acd6_retval::64 word) + 0x38), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (10, qemu_mallocz_0x1acd6_retval, 4)
  }\<close>

definition P_0x1ad01_14_regions :: state_pred where
  \<open>P_0x1ad01_14_regions \<sigma> \<equiv> \<exists>regions. P_0x1ad01_14_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x1ad13_14 :: state_pred where
  \<open>Q_0x1ad13_14 \<sigma> \<equiv> RIP \<sigma> = 0x1ad13 \<and> RAX \<sigma> = 0x2a3b0 \<and> RBX \<sigma> = ucast ((\<langle>31,0\<rangle>RDI\<^sub>0::32 word)) \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = RDX\<^sub>0 \<and> RDI \<sigma> = qemu_mallocz_0x1acd6_retval \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x28) \<and> RBP \<sigma> = RSI\<^sub>0 \<and> R12 \<sigma> = RDX\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((qemu_mallocz_0x1acd6_retval::64 word) + 0x38),8]::64 word) = 0x2a3b0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R8\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RCX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = 0x1acdb \<and> (\<sigma> \<turnstile> *[qemu_mallocz_0x1acd6_retval,4]::32 word) = ucast ((\<langle>31,0\<rangle>RDI\<^sub>0::32 word))\<close>
declare Q_0x1ad13_14_def[Qs]

schematic_goal qemu_aio_set_fd_handler_0_3_0x1ad01_0x1ad0f_14[blocks]:
  assumes \<open>(P_0x1ad01_14 && P_0x1ad01_14_regions) \<sigma>\<close>
  shows \<open>exec_block 3 0x1ad0f 14 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x1ad13_14 ?\<sigma> \<and> block_usage P_0x1ad01_14_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x1ad01_14_def P_0x1ad01_14_regions_def post: Q_0x1ad13_14_def regionset: P_0x1ad01_14_regions_set_def)

definition P_0x1ad13_15 :: state_pred where
  \<open>P_0x1ad13_15 \<sigma> \<equiv> RIP \<sigma> = 0x1ad13 \<and> RAX \<sigma> = 0x2a3b0 \<and> RBX \<sigma> = ucast ((\<langle>31,0\<rangle>RDI\<^sub>0::32 word)) \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = RDX\<^sub>0 \<and> RDI \<sigma> = qemu_mallocz_0x1acd6_retval \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x28) \<and> RBP \<sigma> = RSI\<^sub>0 \<and> R12 \<sigma> = RDX\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((qemu_mallocz_0x1acd6_retval::64 word) + 0x38),8]::64 word) = 0x2a3b0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R8\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RCX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = 0x1acdb \<and> (\<sigma> \<turnstile> *[qemu_mallocz_0x1acd6_retval,4]::32 word) = ucast ((\<langle>31,0\<rangle>RDI\<^sub>0::32 word))\<close>
declare P_0x1ad13_15_def[Ps]

definition P_0x1ad13_15_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x1ad13_15_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((qemu_mallocz_0x1acd6_retval::64 word) + 0x8), 8),
    (2, ((qemu_mallocz_0x1acd6_retval::64 word) + 0x10), 8),
    (3, ((qemu_mallocz_0x1acd6_retval::64 word) + 0x18), 8),
    (4, ((qemu_mallocz_0x1acd6_retval::64 word) + 0x28), 8),
    (5, ((qemu_mallocz_0x1acd6_retval::64 word) + 0x38), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (11, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (12, qemu_mallocz_0x1acd6_retval, 4)
  }\<close>

definition P_0x1ad13_15_regions :: state_pred where
  \<open>P_0x1ad13_15_regions \<sigma> \<equiv> \<exists>regions. P_0x1ad13_15_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x1aca0_15 :: state_pred where
  \<open>Q_0x1aca0_15 \<sigma> \<equiv> RIP \<sigma> = 0x1aca0 \<and> RBX \<sigma> = ucast ((\<langle>31,0\<rangle>RDI\<^sub>0::32 word)) \<and> RDX \<sigma> = RDX\<^sub>0 \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x28) \<and> RBP \<sigma> = RSI\<^sub>0 \<and> R12 \<sigma> = RDX\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBX\<^sub>0\<close>
declare Q_0x1aca0_15_def[Qs]

schematic_goal qemu_aio_set_fd_handler_0_5_0x1ad13_0x1ad23_15[blocks]:
  assumes \<open>(P_0x1ad13_15 && P_0x1ad13_15_regions) \<sigma>\<close>
  shows \<open>exec_block 5 0x1ad23 15 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x1aca0_15 ?\<sigma> \<and> block_usage P_0x1ad13_15_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x1ad13_15_def P_0x1ad13_15_regions_def post: Q_0x1aca0_15_def regionset: P_0x1ad13_15_regions_set_def)

definition P_0x1ac5d_16 :: state_pred where
  \<open>P_0x1ac5d_16 \<sigma> \<equiv> RIP \<sigma> = 0x1ac5d \<and> RAX \<sigma> = RAX\<^sub>0 \<and> RBX \<sigma> = ucast ((\<langle>31,0\<rangle>RDI\<^sub>0::32 word)) \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = RDX\<^sub>0 \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x28) \<and> RBP \<sigma> = RSI\<^sub>0 \<and> R12 \<sigma> = RDX\<^sub>0 \<and> R9 \<sigma> = R9\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> (\<sigma> \<turnstile> *[0x2a3b0,8]::64 word) = (\<sigma> \<turnstile> *[0x2a3b0,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBX\<^sub>0\<close>
declare P_0x1ac5d_16_def[Ps]

definition P_0x1ac5d_16_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x1ac5d_16_regions_set \<sigma> \<equiv> {
    (0, 0x2a3b0, 8),
    (1, RSP\<^sub>0, 8),
    (2, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x18), 8)
  }\<close>

definition P_0x1ac5d_16_regions :: state_pred where
  \<open>P_0x1ac5d_16_regions \<sigma> \<equiv> \<exists>regions. P_0x1ac5d_16_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x1ac63_16 :: state_pred where
  \<open>Q_0x1ac63_16 \<sigma> \<equiv> RIP \<sigma> = 0x1ac63 \<and> RAX \<sigma> = ((RSI\<^sub>0::64 word) OR RDX\<^sub>0) \<and> RBX \<sigma> = ucast ((\<langle>31,0\<rangle>RDI\<^sub>0::32 word)) \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = RDX\<^sub>0 \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x28) \<and> RBP \<sigma> = RSI\<^sub>0 \<and> R12 \<sigma> = RDX\<^sub>0 \<and> R9 \<sigma> = R9\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> (\<sigma> \<turnstile> *[0x2a3b0,8]::64 word) = (\<sigma> \<turnstile> *[0x2a3b0,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBX\<^sub>0\<close>
declare Q_0x1ac63_16_def[Qs]

schematic_goal qemu_aio_set_fd_handler_0_2_0x1ac5d_0x1ac60_16[blocks]:
  assumes \<open>(P_0x1ac5d_16 && P_0x1ac5d_16_regions) \<sigma>\<close>
  shows \<open>exec_block 2 0x1ac60 16 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x1ac63_16 ?\<sigma> \<and> block_usage P_0x1ac5d_16_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x1ac5d_16_def P_0x1ac5d_16_regions_def post: Q_0x1ac63_16_def regionset: P_0x1ac5d_16_regions_set_def)

definition P_0x1ac63_true_17 :: state_pred where
  \<open>P_0x1ac63_true_17 \<sigma> \<equiv> RIP \<sigma> = 0x1ac63 \<and> RAX \<sigma> = ((RSI\<^sub>0::64 word) OR RDX\<^sub>0) \<and> RBX \<sigma> = ucast ((\<langle>31,0\<rangle>RDI\<^sub>0::32 word)) \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = RDX\<^sub>0 \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x28) \<and> RBP \<sigma> = RSI\<^sub>0 \<and> R12 \<sigma> = RDX\<^sub>0 \<and> R9 \<sigma> = R9\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> (\<sigma> \<turnstile> *[0x2a3b0,8]::64 word) = (\<sigma> \<turnstile> *[0x2a3b0,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBX\<^sub>0\<close>
declare P_0x1ac63_true_17_def[Ps]

definition P_0x1ac63_true_17_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x1ac63_true_17_regions_set \<sigma> \<equiv> {
    (0, 0x2a3b0, 8),
    (1, RSP\<^sub>0, 8),
    (2, ((RDI \<sigma>::64 word) + 0x8), 8),
    (3, ((RDI \<sigma>::64 word) + 0x10), 8),
    (4, ((RDI \<sigma>::64 word) + 0x18), 8),
    (5, ((RDI \<sigma>::64 word) + 0x28), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x18), 8)
  }\<close>

definition P_0x1ac63_true_17_regions :: state_pred where
  \<open>P_0x1ac63_true_17_regions \<sigma> \<equiv> \<exists>regions. P_0x1ac63_true_17_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x1aca0_17 :: state_pred where
  \<open>Q_0x1aca0_17 \<sigma> \<equiv> RIP \<sigma> = 0x1aca0 \<and> RBX \<sigma> = ucast ((\<langle>31,0\<rangle>RDI\<^sub>0::32 word)) \<and> RDX \<sigma> = RDX\<^sub>0 \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x28) \<and> RBP \<sigma> = RSI\<^sub>0 \<and> R12 \<sigma> = RDX\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBX\<^sub>0\<close>
declare Q_0x1aca0_17_def[Qs]

schematic_goal qemu_aio_set_fd_handler_0_6_0x1ac63_0x1ad23_17[blocks]:
  assumes \<open>(P_0x1ac63_true_17 && P_0x1ac63_true_17_regions && !ZF) \<sigma>\<close>
  shows \<open>exec_block 6 0x1ad23 17 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x1aca0_17 ?\<sigma> \<and> block_usage P_0x1ac63_true_17_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x1ac63_true_17_def P_0x1ac63_true_17_regions_def post: Q_0x1aca0_17_def regionset: P_0x1ac63_true_17_regions_set_def)

definition P_0x1ac63_false_18 :: state_pred where
  \<open>P_0x1ac63_false_18 \<sigma> \<equiv> RIP \<sigma> = 0x1ac63 \<and> RAX \<sigma> = ((RSI\<^sub>0::64 word) OR RDX\<^sub>0) \<and> RBX \<sigma> = ucast ((\<langle>31,0\<rangle>RDI\<^sub>0::32 word)) \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = RDX\<^sub>0 \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x28) \<and> RBP \<sigma> = RSI\<^sub>0 \<and> R12 \<sigma> = RDX\<^sub>0 \<and> R9 \<sigma> = R9\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> (\<sigma> \<turnstile> *[0x2a3b0,8]::64 word) = (\<sigma> \<turnstile> *[0x2a3b0,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBX\<^sub>0\<close>
declare P_0x1ac63_false_18_def[Ps]

definition P_0x1ac63_false_18_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x1ac63_false_18_regions_set \<sigma> \<equiv> {
    (0, 0x2a3a8, 4),
    (1, 0x2a3b0, 8),
    (2, RSP\<^sub>0, 8),
    (3, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x18), 8)
  }\<close>

definition P_0x1ac63_false_18_regions :: state_pred where
  \<open>P_0x1ac63_false_18_regions \<sigma> \<equiv> \<exists>regions. P_0x1ac63_false_18_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x1ac71_18 :: state_pred where
  \<open>Q_0x1ac71_18 \<sigma> \<equiv> RIP \<sigma> = 0x1ac71 \<and> RAX \<sigma> = ucast ((\<sigma> \<turnstile> *[0x2a3a8,4]::32 word)) \<and> RBX \<sigma> = ucast ((\<langle>31,0\<rangle>RDI\<^sub>0::32 word)) \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = RDX\<^sub>0 \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x28) \<and> RBP \<sigma> = RSI\<^sub>0 \<and> R12 \<sigma> = RDX\<^sub>0 \<and> R9 \<sigma> = R9\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> (\<sigma> \<turnstile> *[0x2a3a8,4]::32 word) = ucast ((\<sigma> \<turnstile> *[0x2a3a8,4]::32 word)) \<and> (\<sigma> \<turnstile> *[0x2a3b0,8]::64 word) = (\<sigma> \<turnstile> *[0x2a3b0,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBX\<^sub>0\<close>
declare Q_0x1ac71_18_def[Qs]

schematic_goal qemu_aio_set_fd_handler_0_3_0x1ac63_0x1ac6f_18[blocks]:
  assumes \<open>(P_0x1ac63_false_18 && P_0x1ac63_false_18_regions && ! !ZF) \<sigma>\<close>
  shows \<open>exec_block 3 0x1ac6f 18 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x1ac71_18 ?\<sigma> \<and> block_usage P_0x1ac63_false_18_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x1ac63_false_18_def P_0x1ac63_false_18_regions_def post: Q_0x1ac71_18_def regionset: P_0x1ac63_false_18_regions_set_def)

definition P_0x1ac71_true_19 :: state_pred where
  \<open>P_0x1ac71_true_19 \<sigma> \<equiv> RIP \<sigma> = 0x1ac71 \<and> RAX \<sigma> = ucast ((\<sigma> \<turnstile> *[0x2a3a8,4]::32 word)) \<and> RBX \<sigma> = ucast ((\<langle>31,0\<rangle>RDI\<^sub>0::32 word)) \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = RDX\<^sub>0 \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x28) \<and> RBP \<sigma> = RSI\<^sub>0 \<and> R12 \<sigma> = RDX\<^sub>0 \<and> R9 \<sigma> = R9\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> (\<sigma> \<turnstile> *[0x2a3a8,4]::32 word) = ucast ((\<sigma> \<turnstile> *[0x2a3a8,4]::32 word)) \<and> (\<sigma> \<turnstile> *[0x2a3b0,8]::64 word) = (\<sigma> \<turnstile> *[0x2a3b0,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBX\<^sub>0\<close>
declare P_0x1ac71_true_19_def[Ps]

definition P_0x1ac71_true_19_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x1ac71_true_19_regions_set \<sigma> \<equiv> {
    (0, 0x2a3a8, 4),
    (1, 0x2a3b0, 8),
    (2, RSP\<^sub>0, 8),
    (3, ((RDI \<sigma>::64 word) + 0x20), 4),
    (4, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x18), 8)
  }\<close>

definition P_0x1ac71_true_19_regions :: state_pred where
  \<open>P_0x1ac71_true_19_regions \<sigma> \<equiv> \<exists>regions. P_0x1ac71_true_19_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x1aca0_19 :: state_pred where
  \<open>Q_0x1aca0_19 \<sigma> \<equiv> RIP \<sigma> = 0x1aca0 \<and> RBX \<sigma> = ucast ((\<langle>31,0\<rangle>RDI\<^sub>0::32 word)) \<and> RDX \<sigma> = RDX\<^sub>0 \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x28) \<and> RBP \<sigma> = RSI\<^sub>0 \<and> R12 \<sigma> = RDX\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBX\<^sub>0\<close>
declare Q_0x1aca0_19_def[Qs]

schematic_goal qemu_aio_set_fd_handler_0_3_0x1ac71_0x1ad37_19[blocks]:
  assumes \<open>(P_0x1ac71_true_19 && P_0x1ac71_true_19_regions && !ZF) \<sigma>\<close>
  shows \<open>exec_block 3 0x1ad37 19 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x1aca0_19 ?\<sigma> \<and> block_usage P_0x1ac71_true_19_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x1ac71_true_19_def P_0x1ac71_true_19_regions_def post: Q_0x1aca0_19_def regionset: P_0x1ac71_true_19_regions_set_def)

definition P_0x1ac71_false_20 :: state_pred where
  \<open>P_0x1ac71_false_20 \<sigma> \<equiv> RIP \<sigma> = 0x1ac71 \<and> RAX \<sigma> = ucast ((\<sigma> \<turnstile> *[0x2a3a8,4]::32 word)) \<and> RBX \<sigma> = ucast ((\<langle>31,0\<rangle>RDI\<^sub>0::32 word)) \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = RDX\<^sub>0 \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x28) \<and> RBP \<sigma> = RSI\<^sub>0 \<and> R12 \<sigma> = RDX\<^sub>0 \<and> R9 \<sigma> = R9\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> (\<sigma> \<turnstile> *[0x2a3a8,4]::32 word) = ucast ((\<sigma> \<turnstile> *[0x2a3a8,4]::32 word)) \<and> (\<sigma> \<turnstile> *[0x2a3b0,8]::64 word) = (\<sigma> \<turnstile> *[0x2a3b0,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBX\<^sub>0\<close>
declare P_0x1ac71_false_20_def[Ps]

definition P_0x1ac71_false_20_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x1ac71_false_20_regions_set \<sigma> \<equiv> {
    (0, 0x2a3a8, 4),
    (1, 0x2a3b0, 8),
    (2, RSP\<^sub>0, 8),
    (3, ((RDI \<sigma>::64 word) + 0x30), 8),
    (4, ((RDI \<sigma>::64 word) + 0x38), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x18), 8)
  }\<close>

definition P_0x1ac71_false_20_regions :: state_pred where
  \<open>P_0x1ac71_false_20_regions \<sigma> \<equiv> \<exists>regions. P_0x1ac71_false_20_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x1ac82_20 :: state_pred where
  \<open>Q_0x1ac82_20 \<sigma> \<equiv> RIP \<sigma> = 0x1ac82 \<and> RAX \<sigma> = (\<sigma> \<turnstile> *[((RDI \<sigma>::64 word) + 0x30),8]::64 word) \<and> RBX \<sigma> = ucast ((\<langle>31,0\<rangle>RDI\<^sub>0::32 word)) \<and> RCX \<sigma> = (\<sigma> \<turnstile> *[((RDI \<sigma>::64 word) + 0x38),8]::64 word) \<and> RDX \<sigma> = RDX\<^sub>0 \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x28) \<and> RBP \<sigma> = RSI\<^sub>0 \<and> R12 \<sigma> = RDX\<^sub>0 \<and> R9 \<sigma> = R9\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> (\<sigma> \<turnstile> *[0x2a3a8,4]::32 word) = ucast ((\<sigma> \<turnstile> *[0x2a3a8,4]::32 word)) \<and> (\<sigma> \<turnstile> *[0x2a3b0,8]::64 word) = (\<sigma> \<turnstile> *[0x2a3b0,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI \<sigma>::64 word) + 0x30),8]::64 word) = (\<sigma> \<turnstile> *[((RDI \<sigma>::64 word) + 0x30),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI \<sigma>::64 word) + 0x38),8]::64 word) = (\<sigma> \<turnstile> *[((RDI \<sigma>::64 word) + 0x38),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBX\<^sub>0\<close>
declare Q_0x1ac82_20_def[Qs]

schematic_goal qemu_aio_set_fd_handler_0_4_0x1ac71_0x1ac7f_20[blocks]:
  assumes \<open>(P_0x1ac71_false_20 && P_0x1ac71_false_20_regions && ! !ZF) \<sigma>\<close>
  shows \<open>exec_block 4 0x1ac7f 20 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x1ac82_20 ?\<sigma> \<and> block_usage P_0x1ac71_false_20_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x1ac71_false_20_def P_0x1ac71_false_20_regions_def post: Q_0x1ac82_20_def regionset: P_0x1ac71_false_20_regions_set_def)

definition P_0x1ac82_true_21 :: state_pred where
  \<open>P_0x1ac82_true_21 \<sigma> \<equiv> RIP \<sigma> = 0x1ac82 \<and> RAX \<sigma> = (\<sigma> \<turnstile> *[((RDI \<sigma>::64 word) + 0x30),8]::64 word) \<and> RBX \<sigma> = ucast ((\<langle>31,0\<rangle>RDI\<^sub>0::32 word)) \<and> RCX \<sigma> = (\<sigma> \<turnstile> *[((RDI \<sigma>::64 word) + 0x38),8]::64 word) \<and> RDX \<sigma> = RDX\<^sub>0 \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x28) \<and> RBP \<sigma> = RSI\<^sub>0 \<and> R12 \<sigma> = RDX\<^sub>0 \<and> R9 \<sigma> = R9\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> (\<sigma> \<turnstile> *[0x2a3a8,4]::32 word) = ucast ((\<sigma> \<turnstile> *[0x2a3a8,4]::32 word)) \<and> (\<sigma> \<turnstile> *[0x2a3b0,8]::64 word) = (\<sigma> \<turnstile> *[0x2a3b0,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI \<sigma>::64 word) + 0x30),8]::64 word) = (\<sigma> \<turnstile> *[((RDI \<sigma>::64 word) + 0x30),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI \<sigma>::64 word) + 0x38),8]::64 word) = (\<sigma> \<turnstile> *[((RDI \<sigma>::64 word) + 0x38),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBX\<^sub>0\<close>
declare P_0x1ac82_true_21_def[Ps]

definition P_0x1ac82_true_21_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x1ac82_true_21_regions_set \<sigma> \<equiv> {
    (0, 0x2a3a8, 4),
    (1, 0x2a3b0, 8),
    (2, RSP\<^sub>0, 8),
    (3, ((RDI \<sigma>::64 word) + 0x30), 8),
    (4, ((RDI \<sigma>::64 word) + 0x38), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x18), 8)
  }\<close>

definition P_0x1ac82_true_21_regions :: state_pred where
  \<open>P_0x1ac82_true_21_regions \<sigma> \<equiv> \<exists>regions. P_0x1ac82_true_21_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x1ac90_21 :: state_pred where
  \<open>Q_0x1ac90_21 \<sigma> \<equiv> RIP \<sigma> = 0x1ac90 \<and> RAX \<sigma> = (\<sigma> \<turnstile> *[((RDI \<sigma>::64 word) + 0x30),8]::64 word) \<and> RBX \<sigma> = ucast ((\<langle>31,0\<rangle>RDI\<^sub>0::32 word)) \<and> RCX \<sigma> = (\<sigma> \<turnstile> *[((RDI \<sigma>::64 word) + 0x38),8]::64 word) \<and> RDX \<sigma> = RDX\<^sub>0 \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x28) \<and> RBP \<sigma> = RSI\<^sub>0 \<and> R12 \<sigma> = RDX\<^sub>0 \<and> R9 \<sigma> = R9\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> (\<sigma> \<turnstile> *[0x2a3a8,4]::32 word) = ucast ((\<sigma> \<turnstile> *[0x2a3a8,4]::32 word)) \<and> (\<sigma> \<turnstile> *[0x2a3b0,8]::64 word) = (\<sigma> \<turnstile> *[0x2a3b0,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI \<sigma>::64 word) + 0x30),8]::64 word) = (\<sigma> \<turnstile> *[((RDI \<sigma>::64 word) + 0x30),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI \<sigma>::64 word) + 0x38),8]::64 word) = (\<sigma> \<turnstile> *[((RDI \<sigma>::64 word) + 0x38),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBX\<^sub>0\<close>
declare Q_0x1ac90_21_def[Qs]

schematic_goal qemu_aio_set_fd_handler_0_1_0x1ac82_0x1ac82_21[blocks]:
  assumes \<open>(P_0x1ac82_true_21 && P_0x1ac82_true_21_regions && ZF) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x1ac82 21 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x1ac90_21 ?\<sigma> \<and> block_usage P_0x1ac82_true_21_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x1ac82_true_21_def P_0x1ac82_true_21_regions_def post: Q_0x1ac90_21_def regionset: P_0x1ac82_true_21_regions_set_def)

definition P_0x1ac82_false_22 :: state_pred where
  \<open>P_0x1ac82_false_22 \<sigma> \<equiv> RIP \<sigma> = 0x1ac82 \<and> RAX \<sigma> = (\<sigma> \<turnstile> *[((RDI \<sigma>::64 word) + 0x30),8]::64 word) \<and> RBX \<sigma> = ucast ((\<langle>31,0\<rangle>RDI\<^sub>0::32 word)) \<and> RCX \<sigma> = (\<sigma> \<turnstile> *[((RDI \<sigma>::64 word) + 0x38),8]::64 word) \<and> RDX \<sigma> = RDX\<^sub>0 \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x28) \<and> RBP \<sigma> = RSI\<^sub>0 \<and> R12 \<sigma> = RDX\<^sub>0 \<and> R9 \<sigma> = R9\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> (\<sigma> \<turnstile> *[0x2a3a8,4]::32 word) = ucast ((\<sigma> \<turnstile> *[0x2a3a8,4]::32 word)) \<and> (\<sigma> \<turnstile> *[0x2a3b0,8]::64 word) = (\<sigma> \<turnstile> *[0x2a3b0,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI \<sigma>::64 word) + 0x30),8]::64 word) = (\<sigma> \<turnstile> *[((RDI \<sigma>::64 word) + 0x30),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI \<sigma>::64 word) + 0x38),8]::64 word) = (\<sigma> \<turnstile> *[((RDI \<sigma>::64 word) + 0x38),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBX\<^sub>0\<close>
declare P_0x1ac82_false_22_def[Ps]

definition P_0x1ac82_false_22_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x1ac82_false_22_regions_set \<sigma> \<equiv> {
    (0, 0x2a3a8, 4),
    (1, 0x2a3b0, 8),
    (2, RSP\<^sub>0, 8),
    (3, ((RDI \<sigma>::64 word) + 0x30), 8),
    (4, ((RDI \<sigma>::64 word) + 0x38), 8),
    (5, (((\<sigma> \<turnstile> *[((RDI \<sigma>::64 word) + 0x30),8]::64 word)::64 word) + 0x38), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x18), 8)
  }\<close>

definition P_0x1ac82_false_22_regions :: state_pred where
  \<open>P_0x1ac82_false_22_regions \<sigma> \<equiv> \<exists>regions. P_0x1ac82_false_22_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x1ac90_22 :: state_pred where
  \<open>Q_0x1ac90_22 \<sigma> \<equiv> RIP \<sigma> = 0x1ac90 \<and> RAX \<sigma> = (\<sigma> \<turnstile> *[((RDI \<sigma>::64 word) + 0x30),8]::64 word) \<and> RBX \<sigma> = ucast ((\<langle>31,0\<rangle>RDI\<^sub>0::32 word)) \<and> RCX \<sigma> = (\<sigma> \<turnstile> *[((RDI \<sigma>::64 word) + 0x38),8]::64 word) \<and> RDX \<sigma> = RDX\<^sub>0 \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x28) \<and> RBP \<sigma> = RSI\<^sub>0 \<and> R12 \<sigma> = RDX\<^sub>0 \<and> R9 \<sigma> = R9\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> (\<sigma> \<turnstile> *[0x2a3a8,4]::32 word) = ucast ((\<sigma> \<turnstile> *[0x2a3a8,4]::32 word)) \<and> (\<sigma> \<turnstile> *[0x2a3b0,8]::64 word) = (\<sigma> \<turnstile> *[0x2a3b0,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI \<sigma>::64 word) + 0x30),8]::64 word) = (\<sigma> \<turnstile> *[((RDI \<sigma>::64 word) + 0x30),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI \<sigma>::64 word) + 0x38),8]::64 word) = (\<sigma> \<turnstile> *[((RDI \<sigma>::64 word) + 0x38),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBX\<^sub>0\<close>
declare Q_0x1ac90_22_def[Qs]

schematic_goal qemu_aio_set_fd_handler_0_4_0x1ac82_0x1ac8c_22[blocks]:
  assumes \<open>(P_0x1ac82_false_22 && P_0x1ac82_false_22_regions && ! ZF) \<sigma>\<close>
  shows \<open>exec_block 4 0x1ac8c 22 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x1ac90_22 ?\<sigma> \<and> block_usage P_0x1ac82_false_22_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x1ac82_false_22_def P_0x1ac82_false_22_regions_def post: Q_0x1ac90_22_def regionset: P_0x1ac82_false_22_regions_set_def)

definition P_0x1ac90_23 :: state_pred where
  \<open>P_0x1ac90_23 \<sigma> \<equiv> RIP \<sigma> = 0x1ac90 \<and> RAX \<sigma> = (\<sigma> \<turnstile> *[((RDI \<sigma>::64 word) + 0x30),8]::64 word) \<and> RBX \<sigma> = ucast ((\<langle>31,0\<rangle>RDI\<^sub>0::32 word)) \<and> RCX \<sigma> = (\<sigma> \<turnstile> *[((RDI \<sigma>::64 word) + 0x38),8]::64 word) \<and> RDX \<sigma> = RDX\<^sub>0 \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x28) \<and> RBP \<sigma> = RSI\<^sub>0 \<and> R12 \<sigma> = RDX\<^sub>0 \<and> R9 \<sigma> = R9\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> (\<sigma> \<turnstile> *[0x2a3a8,4]::32 word) = ucast ((\<sigma> \<turnstile> *[0x2a3a8,4]::32 word)) \<and> (\<sigma> \<turnstile> *[0x2a3b0,8]::64 word) = (\<sigma> \<turnstile> *[0x2a3b0,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI \<sigma>::64 word) + 0x30),8]::64 word) = (\<sigma> \<turnstile> *[((RDI \<sigma>::64 word) + 0x30),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI \<sigma>::64 word) + 0x38),8]::64 word) = (\<sigma> \<turnstile> *[((RDI \<sigma>::64 word) + 0x38),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBX\<^sub>0\<close>
declare P_0x1ac90_23_def[Ps]

definition P_0x1ac90_23_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x1ac90_23_regions_set \<sigma> \<equiv> {
    (0, 0x2a3a8, 4),
    (1, 0x2a3b0, 8),
    (2, RSP\<^sub>0, 8),
    (3, ((RDI \<sigma>::64 word) + 0x30), 8),
    (4, ((RDI \<sigma>::64 word) + 0x38), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (9, (\<sigma> \<turnstile> *[((RDI \<sigma>::64 word) + 0x38),8]::64 word), 8)
  }\<close>

definition P_0x1ac90_23_regions :: state_pred where
  \<open>P_0x1ac90_23_regions \<sigma> \<equiv> \<exists>regions. P_0x1ac90_23_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x1ac97_23 :: state_pred where
  \<open>Q_0x1ac97_23 \<sigma> \<equiv> RIP \<sigma> = 0x1ac97 \<and> RAX \<sigma> = (\<sigma> \<turnstile> *[((RDI \<sigma>::64 word) + 0x30),8]::64 word) \<and> RBX \<sigma> = ucast ((\<langle>31,0\<rangle>RDI\<^sub>0::32 word)) \<and> RCX \<sigma> = (\<sigma> \<turnstile> *[((RDI \<sigma>::64 word) + 0x38),8]::64 word) \<and> RDX \<sigma> = RDX\<^sub>0 \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x28) \<and> RBP \<sigma> = RSI\<^sub>0 \<and> R12 \<sigma> = RDX\<^sub>0 \<and> R9 \<sigma> = R9\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> (\<sigma> \<turnstile> *[0x2a3a8,4]::32 word) = ucast ((\<sigma> \<turnstile> *[0x2a3a8,4]::32 word)) \<and> (\<sigma> \<turnstile> *[0x2a3b0,8]::64 word) = (\<sigma> \<turnstile> *[0x2a3b0,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI \<sigma>::64 word) + 0x30),8]::64 word) = (\<sigma> \<turnstile> *[((RDI \<sigma>::64 word) + 0x30),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI \<sigma>::64 word) + 0x38),8]::64 word) = (\<sigma> \<turnstile> *[((RDI \<sigma>::64 word) + 0x38),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = R8\<^sub>0 \<and> (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI \<sigma>::64 word) + 0x38),8]::64 word),8]::64 word) = (\<sigma> \<turnstile> *[((RDI \<sigma>::64 word) + 0x30),8]::64 word)\<close>
declare Q_0x1ac97_23_def[Qs]

schematic_goal qemu_aio_set_fd_handler_0_2_0x1ac90_0x1ac93_23[blocks]:
  assumes \<open>(P_0x1ac90_23 && P_0x1ac90_23_regions) \<sigma>\<close>
  shows \<open>exec_block 2 0x1ac93 23 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x1ac97_23 ?\<sigma> \<and> block_usage P_0x1ac90_23_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x1ac90_23_def P_0x1ac90_23_regions_def post: Q_0x1ac97_23_def regionset: P_0x1ac90_23_regions_set_def)

definition P_0x1ac97_24 :: state_pred where
  \<open>P_0x1ac97_24 \<sigma> \<equiv> RIP \<sigma> = 0x1ac97 \<and> RAX \<sigma> = (\<sigma> \<turnstile> *[((RDI \<sigma>::64 word) + 0x30),8]::64 word) \<and> RBX \<sigma> = ucast ((\<langle>31,0\<rangle>RDI\<^sub>0::32 word)) \<and> RCX \<sigma> = (\<sigma> \<turnstile> *[((RDI \<sigma>::64 word) + 0x38),8]::64 word) \<and> RDX \<sigma> = RDX\<^sub>0 \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x28) \<and> RBP \<sigma> = RSI\<^sub>0 \<and> R12 \<sigma> = RDX\<^sub>0 \<and> R9 \<sigma> = R9\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> (\<sigma> \<turnstile> *[0x2a3a8,4]::32 word) = ucast ((\<sigma> \<turnstile> *[0x2a3a8,4]::32 word)) \<and> (\<sigma> \<turnstile> *[0x2a3b0,8]::64 word) = (\<sigma> \<turnstile> *[0x2a3b0,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI \<sigma>::64 word) + 0x30),8]::64 word) = (\<sigma> \<turnstile> *[((RDI \<sigma>::64 word) + 0x30),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI \<sigma>::64 word) + 0x38),8]::64 word) = (\<sigma> \<turnstile> *[((RDI \<sigma>::64 word) + 0x38),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = R8\<^sub>0 \<and> (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI \<sigma>::64 word) + 0x38),8]::64 word),8]::64 word) = (\<sigma> \<turnstile> *[((RDI \<sigma>::64 word) + 0x30),8]::64 word)\<close>
declare P_0x1ac97_24_def[Ps]

definition P_0x1ac97_24_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x1ac97_24_regions_set \<sigma> \<equiv> {
    (0, 0x2a3a8, 4),
    (1, 0x2a3b0, 8),
    (2, RSP\<^sub>0, 8),
    (3, ((RDI \<sigma>::64 word) + 0x30), 8),
    (4, ((RDI \<sigma>::64 word) + 0x38), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (10, (\<sigma> \<turnstile> *[((RDI \<sigma>::64 word) + 0x38),8]::64 word), 8)
  }\<close>

definition P_0x1ac97_24_regions :: state_pred where
  \<open>P_0x1ac97_24_regions \<sigma> \<equiv> \<exists>regions. P_0x1ac97_24_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_qemu_free_addr_0x1ac97_24 :: state_pred where
  \<open>Q_qemu_free_addr_0x1ac97_24 \<sigma> \<equiv> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x30) \<and> RIP \<sigma> = qemu_free_addr \<and> RAX \<sigma> = (\<sigma> \<turnstile> *[((RDI \<sigma>::64 word) + 0x30),8]::64 word) \<and> RBX \<sigma> = ucast ((\<langle>31,0\<rangle>RDI\<^sub>0::32 word)) \<and> RCX \<sigma> = (\<sigma> \<turnstile> *[((RDI \<sigma>::64 word) + 0x38),8]::64 word) \<and> RDX \<sigma> = RDX\<^sub>0 \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RBP \<sigma> = RSI\<^sub>0 \<and> R12 \<sigma> = RDX\<^sub>0 \<and> R9 \<sigma> = R9\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> (\<sigma> \<turnstile> *[0x2a3a8,4]::32 word) = ucast ((\<sigma> \<turnstile> *[0x2a3a8,4]::32 word)) \<and> (\<sigma> \<turnstile> *[0x2a3b0,8]::64 word) = (\<sigma> \<turnstile> *[0x2a3b0,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI \<sigma>::64 word) + 0x30),8]::64 word) = (\<sigma> \<turnstile> *[((RDI \<sigma>::64 word) + 0x30),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI \<sigma>::64 word) + 0x38),8]::64 word) = (\<sigma> \<turnstile> *[((RDI \<sigma>::64 word) + 0x38),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = R8\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = 0x1ac9c \<and> (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI \<sigma>::64 word) + 0x38),8]::64 word),8]::64 word) = (\<sigma> \<turnstile> *[((RDI \<sigma>::64 word) + 0x30),8]::64 word)\<close>
declare Q_qemu_free_addr_0x1ac97_24_def[Qs]

schematic_goal qemu_aio_set_fd_handler_0_1_0x1ac97_0x1ac97_24[blocks]:
  assumes \<open>(P_0x1ac97_24 && P_0x1ac97_24_regions) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x1ac97 24 \<sigma> \<triangleq> ?\<sigma> \<and> Q_qemu_free_addr_0x1ac97_24 ?\<sigma> \<and> block_usage P_0x1ac97_24_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x1ac97_24_def P_0x1ac97_24_regions_def post: Q_qemu_free_addr_0x1ac97_24_def regionset: P_0x1ac97_24_regions_set_def)

definition P_0x1ac9c_25 :: state_pred where
  \<open>P_0x1ac9c_25 \<sigma> \<equiv> RIP \<sigma> = 0x1ac9c \<and> RAX \<sigma> = qemu_free_0x1ac97_retval \<and> RBX \<sigma> = ucast ((\<langle>31,0\<rangle>RDI\<^sub>0::32 word)) \<and> RCX \<sigma> = (\<sigma> \<turnstile> *[((RDI \<sigma>::64 word) + 0x38),8]::64 word) \<and> RDX \<sigma> = RDX\<^sub>0 \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x28) \<and> RBP \<sigma> = RSI\<^sub>0 \<and> R12 \<sigma> = RDX\<^sub>0 \<and> R9 \<sigma> = R9\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> (\<sigma> \<turnstile> *[0x2a3a8,4]::32 word) = ucast ((\<sigma> \<turnstile> *[0x2a3a8,4]::32 word)) \<and> (\<sigma> \<turnstile> *[0x2a3b0,8]::64 word) = (\<sigma> \<turnstile> *[0x2a3b0,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI \<sigma>::64 word) + 0x30),8]::64 word) = (\<sigma> \<turnstile> *[((RDI \<sigma>::64 word) + 0x30),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDI \<sigma>::64 word) + 0x38),8]::64 word) = (\<sigma> \<turnstile> *[((RDI \<sigma>::64 word) + 0x38),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = R8\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = 0x1ac9c \<and> (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI \<sigma>::64 word) + 0x38),8]::64 word),8]::64 word) = (\<sigma> \<turnstile> *[((RDI \<sigma>::64 word) + 0x30),8]::64 word)\<close>
declare P_0x1ac9c_25_def[Ps]

definition P_0x1ac9c_25_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x1ac9c_25_regions_set \<sigma> \<equiv> {
    (0, 0x2a3a8, 4),
    (1, 0x2a3b0, 8),
    (2, RSP\<^sub>0, 8),
    (3, ((RDI \<sigma>::64 word) + 0x30), 8),
    (4, ((RDI \<sigma>::64 word) + 0x38), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (10, (\<sigma> \<turnstile> *[((RDI \<sigma>::64 word) + 0x38),8]::64 word), 8)
  }\<close>

definition P_0x1ac9c_25_regions :: state_pred where
  \<open>P_0x1ac9c_25_regions \<sigma> \<equiv> \<exists>regions. P_0x1ac9c_25_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x1aca0_25 :: state_pred where
  \<open>Q_0x1aca0_25 \<sigma> \<equiv> RIP \<sigma> = 0x1aca0 \<and> RBX \<sigma> = ucast ((\<langle>31,0\<rangle>RDI\<^sub>0::32 word)) \<and> RDX \<sigma> = RDX\<^sub>0 \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x28) \<and> RBP \<sigma> = RSI\<^sub>0 \<and> R12 \<sigma> = RDX\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBX\<^sub>0\<close>
declare Q_0x1aca0_25_def[Qs]

schematic_goal qemu_aio_set_fd_handler_0_1_0x1ac9c_0x1ac9c_25[blocks]:
  assumes \<open>(P_0x1ac9c_25 && P_0x1ac9c_25_regions) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x1ac9c 25 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x1aca0_25 ?\<sigma> \<and> block_usage P_0x1ac9c_25_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x1ac9c_25_def P_0x1ac9c_25_regions_def post: Q_0x1aca0_25_def regionset: P_0x1ac9c_25_regions_set_def)

definition P_0x1ac4a_false_26 :: state_pred where
  \<open>P_0x1ac4a_false_26 \<sigma> \<equiv> RIP \<sigma> = 0x1ac4a \<and> RAX \<sigma> = RAX\<^sub>0 \<and> RBX \<sigma> = ucast ((\<langle>31,0\<rangle>RDI\<^sub>0::32 word)) \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = RDX\<^sub>0 \<and> RDI \<sigma> = (\<sigma> \<turnstile> *[0x2a3b0,8]::64 word) \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x28) \<and> RBP \<sigma> = RSI\<^sub>0 \<and> R12 \<sigma> = RDX\<^sub>0 \<and> R9 \<sigma> = R9\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> (\<sigma> \<turnstile> *[0x2a3b0,8]::64 word) = (\<sigma> \<turnstile> *[0x2a3b0,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBX\<^sub>0\<close>
declare P_0x1ac4a_false_26_def[Ps]

definition P_0x1ac4a_false_26_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x1ac4a_false_26_regions_set \<sigma> \<equiv> {
    (0, 0x2a3b0, 8),
    (1, RSP\<^sub>0, 8),
    (2, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x18), 8)
  }\<close>

definition P_0x1ac4a_false_26_regions :: state_pred where
  \<open>P_0x1ac4a_false_26_regions \<sigma> \<equiv> \<exists>regions. P_0x1ac4a_false_26_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x1acc0_26 :: state_pred where
  \<open>Q_0x1acc0_26 \<sigma> \<equiv> RIP \<sigma> = 0x1acc0 \<and> RAX \<sigma> = RAX\<^sub>0 \<and> RBX \<sigma> = ucast ((\<langle>31,0\<rangle>RDI\<^sub>0::32 word)) \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = RDX\<^sub>0 \<and> RDI \<sigma> = (\<sigma> \<turnstile> *[0x2a3b0,8]::64 word) \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x28) \<and> RBP \<sigma> = RSI\<^sub>0 \<and> R12 \<sigma> = RDX\<^sub>0 \<and> R9 \<sigma> = R9\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> (\<sigma> \<turnstile> *[0x2a3b0,8]::64 word) = (\<sigma> \<turnstile> *[0x2a3b0,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBX\<^sub>0\<close>
declare Q_0x1acc0_26_def[Qs]

schematic_goal qemu_aio_set_fd_handler_0_2_0x1ac4a_0x1ac4c_26[blocks]:
  assumes \<open>(P_0x1ac4a_false_26 && P_0x1ac4a_false_26_regions && ! !ZF) \<sigma>\<close>
  shows \<open>exec_block 2 0x1ac4c 26 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x1acc0_26 ?\<sigma> \<and> block_usage P_0x1ac4a_false_26_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x1ac4a_false_26_def P_0x1ac4a_false_26_regions_def post: Q_0x1acc0_26_def regionset: P_0x1ac4a_false_26_regions_set_def)

definition P_0x1acc0_27 :: state_pred where
  \<open>P_0x1acc0_27 \<sigma> \<equiv> RIP \<sigma> = 0x1acc0 \<and> RAX \<sigma> = RAX\<^sub>0 \<and> RBX \<sigma> = ucast ((\<langle>31,0\<rangle>RDI\<^sub>0::32 word)) \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = RDX\<^sub>0 \<and> RDI \<sigma> = (\<sigma> \<turnstile> *[0x2a3b0,8]::64 word) \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x28) \<and> RBP \<sigma> = RSI\<^sub>0 \<and> R12 \<sigma> = RDX\<^sub>0 \<and> R9 \<sigma> = R9\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> (\<sigma> \<turnstile> *[0x2a3b0,8]::64 word) = (\<sigma> \<turnstile> *[0x2a3b0,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBX\<^sub>0\<close>
declare P_0x1acc0_27_def[Ps]

definition P_0x1acc0_27_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x1acc0_27_regions_set \<sigma> \<equiv> {
    (0, 0x2a3b0, 8),
    (1, RSP\<^sub>0, 8),
    (2, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x18), 8)
  }\<close>

definition P_0x1acc0_27_regions :: state_pred where
  \<open>P_0x1acc0_27_regions \<sigma> \<equiv> \<exists>regions. P_0x1acc0_27_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x1acc6_27 :: state_pred where
  \<open>Q_0x1acc6_27 \<sigma> \<equiv> RIP \<sigma> = 0x1acc6 \<and> RAX \<sigma> = ((RSI\<^sub>0::64 word) OR RDX\<^sub>0) \<and> RBX \<sigma> = ucast ((\<langle>31,0\<rangle>RDI\<^sub>0::32 word)) \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = RDX\<^sub>0 \<and> RDI \<sigma> = (\<sigma> \<turnstile> *[0x2a3b0,8]::64 word) \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x28) \<and> RBP \<sigma> = RSI\<^sub>0 \<and> R12 \<sigma> = RDX\<^sub>0 \<and> R9 \<sigma> = R9\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> (\<sigma> \<turnstile> *[0x2a3b0,8]::64 word) = (\<sigma> \<turnstile> *[0x2a3b0,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBX\<^sub>0\<close>
declare Q_0x1acc6_27_def[Qs]

schematic_goal qemu_aio_set_fd_handler_0_2_0x1acc0_0x1acc3_27[blocks]:
  assumes \<open>(P_0x1acc0_27 && P_0x1acc0_27_regions) \<sigma>\<close>
  shows \<open>exec_block 2 0x1acc3 27 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x1acc6_27 ?\<sigma> \<and> block_usage P_0x1acc0_27_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x1acc0_27_def P_0x1acc0_27_regions_def post: Q_0x1acc6_27_def regionset: P_0x1acc0_27_regions_set_def)

definition P_0x1acc6_true_28 :: state_pred where
  \<open>P_0x1acc6_true_28 \<sigma> \<equiv> RIP \<sigma> = 0x1acc6 \<and> RAX \<sigma> = ((RSI\<^sub>0::64 word) OR RDX\<^sub>0) \<and> RBX \<sigma> = ucast ((\<langle>31,0\<rangle>RDI\<^sub>0::32 word)) \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = RDX\<^sub>0 \<and> RDI \<sigma> = (\<sigma> \<turnstile> *[0x2a3b0,8]::64 word) \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x28) \<and> RBP \<sigma> = RSI\<^sub>0 \<and> R12 \<sigma> = RDX\<^sub>0 \<and> R9 \<sigma> = R9\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> (\<sigma> \<turnstile> *[0x2a3b0,8]::64 word) = (\<sigma> \<turnstile> *[0x2a3b0,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBX\<^sub>0\<close>
declare P_0x1acc6_true_28_def[Ps]

definition P_0x1acc6_true_28_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x1acc6_true_28_regions_set \<sigma> \<equiv> {
    (0, 0x2a3b0, 8),
    (1, RSP\<^sub>0, 8),
    (2, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x18), 8)
  }\<close>

definition P_0x1acc6_true_28_regions :: state_pred where
  \<open>P_0x1acc6_true_28_regions \<sigma> \<equiv> \<exists>regions. P_0x1acc6_true_28_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x1aca0_28 :: state_pred where
  \<open>Q_0x1aca0_28 \<sigma> \<equiv> RIP \<sigma> = 0x1aca0 \<and> RBX \<sigma> = ucast ((\<langle>31,0\<rangle>RDI\<^sub>0::32 word)) \<and> RDX \<sigma> = RDX\<^sub>0 \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x28) \<and> RBP \<sigma> = RSI\<^sub>0 \<and> R12 \<sigma> = RDX\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBX\<^sub>0\<close>
declare Q_0x1aca0_28_def[Qs]

schematic_goal qemu_aio_set_fd_handler_0_1_0x1acc6_0x1acc6_28[blocks]:
  assumes \<open>(P_0x1acc6_true_28 && P_0x1acc6_true_28_regions && ZF) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x1acc6 28 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x1aca0_28 ?\<sigma> \<and> block_usage P_0x1acc6_true_28_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x1acc6_true_28_def P_0x1acc6_true_28_regions_def post: Q_0x1aca0_28_def regionset: P_0x1acc6_true_28_regions_set_def)

definition P_0x1acc6_false_29 :: state_pred where
  \<open>P_0x1acc6_false_29 \<sigma> \<equiv> RIP \<sigma> = 0x1acc6 \<and> RAX \<sigma> = ((RSI\<^sub>0::64 word) OR RDX\<^sub>0) \<and> RBX \<sigma> = ucast ((\<langle>31,0\<rangle>RDI\<^sub>0::32 word)) \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = RDX\<^sub>0 \<and> RDI \<sigma> = (\<sigma> \<turnstile> *[0x2a3b0,8]::64 word) \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x28) \<and> RBP \<sigma> = RSI\<^sub>0 \<and> R12 \<sigma> = RDX\<^sub>0 \<and> R9 \<sigma> = R9\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> (\<sigma> \<turnstile> *[0x2a3b0,8]::64 word) = (\<sigma> \<turnstile> *[0x2a3b0,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBX\<^sub>0\<close>
declare P_0x1acc6_false_29_def[Ps]

definition P_0x1acc6_false_29_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x1acc6_false_29_regions_set \<sigma> \<equiv> {
    (0, 0x2a3b0, 8),
    (1, RSP\<^sub>0, 8),
    (2, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x28), 8)
  }\<close>

definition P_0x1acc6_false_29_regions :: state_pred where
  \<open>P_0x1acc6_false_29_regions \<sigma> \<equiv> \<exists>regions. P_0x1acc6_false_29_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x1acd6_29 :: state_pred where
  \<open>Q_0x1acd6_29 \<sigma> \<equiv> RIP \<sigma> = 0x1acd6 \<and> RAX \<sigma> = ((RSI\<^sub>0::64 word) OR RDX\<^sub>0) \<and> RBX \<sigma> = ucast ((\<langle>31,0\<rangle>RDI\<^sub>0::32 word)) \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = RDX\<^sub>0 \<and> RDI \<sigma> = 0x40 \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x28) \<and> RBP \<sigma> = RSI\<^sub>0 \<and> R12 \<sigma> = RDX\<^sub>0 \<and> R9 \<sigma> = R9\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> (\<sigma> \<turnstile> *[0x2a3b0,8]::64 word) = (\<sigma> \<turnstile> *[0x2a3b0,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R8\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RCX\<^sub>0\<close>
declare Q_0x1acd6_29_def[Qs]

schematic_goal qemu_aio_set_fd_handler_0_4_0x1acc6_0x1acd2_29[blocks]:
  assumes \<open>(P_0x1acc6_false_29 && P_0x1acc6_false_29_regions && ! ZF) \<sigma>\<close>
  shows \<open>exec_block 4 0x1acd2 29 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x1acd6_29 ?\<sigma> \<and> block_usage P_0x1acc6_false_29_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x1acc6_false_29_def P_0x1acc6_false_29_regions_def post: Q_0x1acd6_29_def regionset: P_0x1acc6_false_29_regions_set_def)

definition P_0x1acd6_30 :: state_pred where
  \<open>P_0x1acd6_30 \<sigma> \<equiv> RIP \<sigma> = 0x1acd6 \<and> RAX \<sigma> = ((RSI\<^sub>0::64 word) OR RDX\<^sub>0) \<and> RBX \<sigma> = ucast ((\<langle>31,0\<rangle>RDI\<^sub>0::32 word)) \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = RDX\<^sub>0 \<and> RDI \<sigma> = 0x40 \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x28) \<and> RBP \<sigma> = RSI\<^sub>0 \<and> R12 \<sigma> = RDX\<^sub>0 \<and> R9 \<sigma> = R9\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> (\<sigma> \<turnstile> *[0x2a3b0,8]::64 word) = (\<sigma> \<turnstile> *[0x2a3b0,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R8\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RCX\<^sub>0\<close>
declare P_0x1acd6_30_def[Ps]

definition P_0x1acd6_30_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x1acd6_30_regions_set \<sigma> \<equiv> {
    (0, 0x2a3b0, 8),
    (1, RSP\<^sub>0, 8),
    (2, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x30), 8)
  }\<close>

definition P_0x1acd6_30_regions :: state_pred where
  \<open>P_0x1acd6_30_regions \<sigma> \<equiv> \<exists>regions. P_0x1acd6_30_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_qemu_mallocz_addr_0x1acd6_30 :: state_pred where
  \<open>Q_qemu_mallocz_addr_0x1acd6_30 \<sigma> \<equiv> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x30) \<and> RIP \<sigma> = qemu_mallocz_addr \<and> RAX \<sigma> = ((RSI\<^sub>0::64 word) OR RDX\<^sub>0) \<and> RBX \<sigma> = ucast ((\<langle>31,0\<rangle>RDI\<^sub>0::32 word)) \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = RDX\<^sub>0 \<and> RDI \<sigma> = 0x40 \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RBP \<sigma> = RSI\<^sub>0 \<and> R12 \<sigma> = RDX\<^sub>0 \<and> R9 \<sigma> = R9\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> (\<sigma> \<turnstile> *[0x2a3b0,8]::64 word) = (\<sigma> \<turnstile> *[0x2a3b0,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R8\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RCX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = 0x1acdb\<close>
declare Q_qemu_mallocz_addr_0x1acd6_30_def[Qs]

schematic_goal qemu_aio_set_fd_handler_0_1_0x1acd6_0x1acd6_30[blocks]:
  assumes \<open>(P_0x1acd6_30 && P_0x1acd6_30_regions) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x1acd6 30 \<sigma> \<triangleq> ?\<sigma> \<and> Q_qemu_mallocz_addr_0x1acd6_30 ?\<sigma> \<and> block_usage P_0x1acd6_30_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x1acd6_30_def P_0x1acd6_30_regions_def post: Q_qemu_mallocz_addr_0x1acd6_30_def regionset: P_0x1acd6_30_regions_set_def)

definition P_0x1acdb_31 :: state_pred where
  \<open>P_0x1acdb_31 \<sigma> \<equiv> RIP \<sigma> = 0x1acdb \<and> RAX \<sigma> = qemu_mallocz_0x1acd6_retval \<and> RBX \<sigma> = ucast ((\<langle>31,0\<rangle>RDI\<^sub>0::32 word)) \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = RDX\<^sub>0 \<and> RDI \<sigma> = 0x40 \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x28) \<and> RBP \<sigma> = RSI\<^sub>0 \<and> R12 \<sigma> = RDX\<^sub>0 \<and> R9 \<sigma> = R9\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> (\<sigma> \<turnstile> *[0x2a3b0,8]::64 word) = (\<sigma> \<turnstile> *[0x2a3b0,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R8\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RCX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = 0x1acdb\<close>
declare P_0x1acdb_31_def[Ps]

definition P_0x1acdb_31_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x1acdb_31_regions_set \<sigma> \<equiv> {
    (0, 0x2a3b0, 8),
    (1, RSP\<^sub>0, 8),
    (2, ((qemu_mallocz_0x1acd6_retval::64 word) + 0x30), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (9, qemu_mallocz_0x1acd6_retval, 4)
  }\<close>

definition P_0x1acdb_31_regions :: state_pred where
  \<open>P_0x1acdb_31_regions \<sigma> \<equiv> \<exists>regions. P_0x1acdb_31_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x1acf7_31 :: state_pred where
  \<open>Q_0x1acf7_31 \<sigma> \<equiv> RIP \<sigma> = 0x1acf7 \<and> RAX \<sigma> = (\<sigma> \<turnstile> *[0x2a3b0,8]::64 word) \<and> RBX \<sigma> = ucast ((\<langle>31,0\<rangle>RDI\<^sub>0::32 word)) \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = RDX\<^sub>0 \<and> RDI \<sigma> = qemu_mallocz_0x1acd6_retval \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x28) \<and> RBP \<sigma> = RSI\<^sub>0 \<and> R12 \<sigma> = RDX\<^sub>0 \<and> R9 \<sigma> = R9\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> (\<sigma> \<turnstile> *[0x2a3b0,8]::64 word) = (\<sigma> \<turnstile> *[0x2a3b0,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((qemu_mallocz_0x1acd6_retval::64 word) + 0x30),8]::64 word) = (\<sigma> \<turnstile> *[0x2a3b0,8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R8\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RCX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = 0x1acdb \<and> (\<sigma> \<turnstile> *[qemu_mallocz_0x1acd6_retval,4]::32 word) = ucast ((\<langle>31,0\<rangle>RDI\<^sub>0::32 word))\<close>
declare Q_0x1acf7_31_def[Qs]

schematic_goal qemu_aio_set_fd_handler_0_7_0x1acdb_0x1acf3_31[blocks]:
  assumes \<open>(P_0x1acdb_31 && P_0x1acdb_31_regions) \<sigma>\<close>
  shows \<open>exec_block 7 0x1acf3 31 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x1acf7_31 ?\<sigma> \<and> block_usage P_0x1acdb_31_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x1acdb_31_def P_0x1acdb_31_regions_def post: Q_0x1acf7_31_def regionset: P_0x1acdb_31_regions_set_def)

definition P_0x1acf7_true_32 :: state_pred where
  \<open>P_0x1acf7_true_32 \<sigma> \<equiv> RIP \<sigma> = 0x1acf7 \<and> RAX \<sigma> = (\<sigma> \<turnstile> *[0x2a3b0,8]::64 word) \<and> RBX \<sigma> = ucast ((\<langle>31,0\<rangle>RDI\<^sub>0::32 word)) \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = RDX\<^sub>0 \<and> RDI \<sigma> = qemu_mallocz_0x1acd6_retval \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x28) \<and> RBP \<sigma> = RSI\<^sub>0 \<and> R12 \<sigma> = RDX\<^sub>0 \<and> R9 \<sigma> = R9\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> (\<sigma> \<turnstile> *[0x2a3b0,8]::64 word) = (\<sigma> \<turnstile> *[0x2a3b0,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((qemu_mallocz_0x1acd6_retval::64 word) + 0x30),8]::64 word) = (\<sigma> \<turnstile> *[0x2a3b0,8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R8\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RCX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = 0x1acdb \<and> (\<sigma> \<turnstile> *[qemu_mallocz_0x1acd6_retval,4]::32 word) = ucast ((\<langle>31,0\<rangle>RDI\<^sub>0::32 word))\<close>
declare P_0x1acf7_true_32_def[Ps]

definition P_0x1acf7_true_32_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x1acf7_true_32_regions_set \<sigma> \<equiv> {
    (0, 0x2a3b0, 8),
    (1, RSP\<^sub>0, 8),
    (2, ((qemu_mallocz_0x1acd6_retval::64 word) + 0x30), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (9, qemu_mallocz_0x1acd6_retval, 4)
  }\<close>

definition P_0x1acf7_true_32_regions :: state_pred where
  \<open>P_0x1acf7_true_32_regions \<sigma> \<equiv> \<exists>regions. P_0x1acf7_true_32_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x1ad01_32 :: state_pred where
  \<open>Q_0x1ad01_32 \<sigma> \<equiv> RIP \<sigma> = 0x1ad01 \<and> RAX \<sigma> = (\<sigma> \<turnstile> *[0x2a3b0,8]::64 word) \<and> RBX \<sigma> = ucast ((\<langle>31,0\<rangle>RDI\<^sub>0::32 word)) \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = RDX\<^sub>0 \<and> RDI \<sigma> = qemu_mallocz_0x1acd6_retval \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x28) \<and> RBP \<sigma> = RSI\<^sub>0 \<and> R12 \<sigma> = RDX\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> (\<sigma> \<turnstile> *[0x2a3b0,8]::64 word) = (\<sigma> \<turnstile> *[0x2a3b0,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((qemu_mallocz_0x1acd6_retval::64 word) + 0x30),8]::64 word) = (\<sigma> \<turnstile> *[0x2a3b0,8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R8\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RCX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = 0x1acdb \<and> (\<sigma> \<turnstile> *[qemu_mallocz_0x1acd6_retval,4]::32 word) = ucast ((\<langle>31,0\<rangle>RDI\<^sub>0::32 word))\<close>
declare Q_0x1ad01_32_def[Qs]

schematic_goal qemu_aio_set_fd_handler_0_1_0x1acf7_0x1acf7_32[blocks]:
  assumes \<open>(P_0x1acf7_true_32 && P_0x1acf7_true_32_regions && ZF) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x1acf7 32 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x1ad01_32 ?\<sigma> \<and> block_usage P_0x1acf7_true_32_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x1acf7_true_32_def P_0x1acf7_true_32_regions_def post: Q_0x1ad01_32_def regionset: P_0x1acf7_true_32_regions_set_def)

definition P_0x1acf7_false_33 :: state_pred where
  \<open>P_0x1acf7_false_33 \<sigma> \<equiv> RIP \<sigma> = 0x1acf7 \<and> RAX \<sigma> = (\<sigma> \<turnstile> *[0x2a3b0,8]::64 word) \<and> RBX \<sigma> = ucast ((\<langle>31,0\<rangle>RDI\<^sub>0::32 word)) \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = RDX\<^sub>0 \<and> RDI \<sigma> = qemu_mallocz_0x1acd6_retval \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x28) \<and> RBP \<sigma> = RSI\<^sub>0 \<and> R12 \<sigma> = RDX\<^sub>0 \<and> R9 \<sigma> = R9\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> (\<sigma> \<turnstile> *[0x2a3b0,8]::64 word) = (\<sigma> \<turnstile> *[0x2a3b0,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((qemu_mallocz_0x1acd6_retval::64 word) + 0x30),8]::64 word) = (\<sigma> \<turnstile> *[0x2a3b0,8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R8\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RCX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = 0x1acdb \<and> (\<sigma> \<turnstile> *[qemu_mallocz_0x1acd6_retval,4]::32 word) = ucast ((\<langle>31,0\<rangle>RDI\<^sub>0::32 word))\<close>
declare P_0x1acf7_false_33_def[Ps]

definition P_0x1acf7_false_33_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x1acf7_false_33_regions_set \<sigma> \<equiv> {
    (0, 0x2a3b0, 8),
    (1, RSP\<^sub>0, 8),
    (2, ((qemu_mallocz_0x1acd6_retval::64 word) + 0x30), 8),
    (3, (((\<sigma> \<turnstile> *[0x2a3b0,8]::64 word)::64 word) + 0x38), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (10, qemu_mallocz_0x1acd6_retval, 4)
  }\<close>

definition P_0x1acf7_false_33_regions :: state_pred where
  \<open>P_0x1acf7_false_33_regions \<sigma> \<equiv> \<exists>regions. P_0x1acf7_false_33_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x1ad01_33 :: state_pred where
  \<open>Q_0x1ad01_33 \<sigma> \<equiv> RIP \<sigma> = 0x1ad01 \<and> RAX \<sigma> = (\<sigma> \<turnstile> *[0x2a3b0,8]::64 word) \<and> RBX \<sigma> = ucast ((\<langle>31,0\<rangle>RDI\<^sub>0::32 word)) \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = RDX\<^sub>0 \<and> RDI \<sigma> = qemu_mallocz_0x1acd6_retval \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x28) \<and> RBP \<sigma> = RSI\<^sub>0 \<and> R12 \<sigma> = RDX\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> (\<sigma> \<turnstile> *[0x2a3b0,8]::64 word) = (\<sigma> \<turnstile> *[0x2a3b0,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((qemu_mallocz_0x1acd6_retval::64 word) + 0x30),8]::64 word) = (\<sigma> \<turnstile> *[0x2a3b0,8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R8\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RCX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = 0x1acdb \<and> (\<sigma> \<turnstile> *[qemu_mallocz_0x1acd6_retval,4]::32 word) = ucast ((\<langle>31,0\<rangle>RDI\<^sub>0::32 word))\<close>
declare Q_0x1ad01_33_def[Qs]

schematic_goal qemu_aio_set_fd_handler_0_3_0x1acf7_0x1acfd_33[blocks]:
  assumes \<open>(P_0x1acf7_false_33 && P_0x1acf7_false_33_regions && ! ZF) \<sigma>\<close>
  shows \<open>exec_block 3 0x1acfd 33 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x1ad01_33 ?\<sigma> \<and> block_usage P_0x1acf7_false_33_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x1acf7_false_33_def P_0x1acf7_false_33_regions_def post: Q_0x1ad01_33_def regionset: P_0x1acf7_false_33_regions_set_def)

definition P_0x1ad01_34 :: state_pred where
  \<open>P_0x1ad01_34 \<sigma> \<equiv> RIP \<sigma> = 0x1ad01 \<and> RAX \<sigma> = (\<sigma> \<turnstile> *[0x2a3b0,8]::64 word) \<and> RBX \<sigma> = ucast ((\<langle>31,0\<rangle>RDI\<^sub>0::32 word)) \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = RDX\<^sub>0 \<and> RDI \<sigma> = qemu_mallocz_0x1acd6_retval \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x28) \<and> RBP \<sigma> = RSI\<^sub>0 \<and> R12 \<sigma> = RDX\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> (\<sigma> \<turnstile> *[0x2a3b0,8]::64 word) = (\<sigma> \<turnstile> *[0x2a3b0,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((qemu_mallocz_0x1acd6_retval::64 word) + 0x30),8]::64 word) = (\<sigma> \<turnstile> *[0x2a3b0,8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R8\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RCX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = 0x1acdb \<and> (\<sigma> \<turnstile> *[qemu_mallocz_0x1acd6_retval,4]::32 word) = ucast ((\<langle>31,0\<rangle>RDI\<^sub>0::32 word))\<close>
declare P_0x1ad01_34_def[Ps]

definition P_0x1ad01_34_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x1ad01_34_regions_set \<sigma> \<equiv> {
    (0, 0x2a3b0, 8),
    (1, RSP\<^sub>0, 8),
    (2, ((qemu_mallocz_0x1acd6_retval::64 word) + 0x30), 8),
    (3, ((qemu_mallocz_0x1acd6_retval::64 word) + 0x38), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (10, qemu_mallocz_0x1acd6_retval, 4)
  }\<close>

definition P_0x1ad01_34_regions :: state_pred where
  \<open>P_0x1ad01_34_regions \<sigma> \<equiv> \<exists>regions. P_0x1ad01_34_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x1ad13_34 :: state_pred where
  \<open>Q_0x1ad13_34 \<sigma> \<equiv> RIP \<sigma> = 0x1ad13 \<and> RAX \<sigma> = 0x2a3b0 \<and> RBX \<sigma> = ucast ((\<langle>31,0\<rangle>RDI\<^sub>0::32 word)) \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = RDX\<^sub>0 \<and> RDI \<sigma> = qemu_mallocz_0x1acd6_retval \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x28) \<and> RBP \<sigma> = RSI\<^sub>0 \<and> R12 \<sigma> = RDX\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((qemu_mallocz_0x1acd6_retval::64 word) + 0x38),8]::64 word) = 0x2a3b0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R8\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RCX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = 0x1acdb \<and> (\<sigma> \<turnstile> *[qemu_mallocz_0x1acd6_retval,4]::32 word) = ucast ((\<langle>31,0\<rangle>RDI\<^sub>0::32 word))\<close>
declare Q_0x1ad13_34_def[Qs]

schematic_goal qemu_aio_set_fd_handler_0_3_0x1ad01_0x1ad0f_34[blocks]:
  assumes \<open>(P_0x1ad01_34 && P_0x1ad01_34_regions) \<sigma>\<close>
  shows \<open>exec_block 3 0x1ad0f 34 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x1ad13_34 ?\<sigma> \<and> block_usage P_0x1ad01_34_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x1ad01_34_def P_0x1ad01_34_regions_def post: Q_0x1ad13_34_def regionset: P_0x1ad01_34_regions_set_def)

definition P_0x1ad13_35 :: state_pred where
  \<open>P_0x1ad13_35 \<sigma> \<equiv> RIP \<sigma> = 0x1ad13 \<and> RAX \<sigma> = 0x2a3b0 \<and> RBX \<sigma> = ucast ((\<langle>31,0\<rangle>RDI\<^sub>0::32 word)) \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = RDX\<^sub>0 \<and> RDI \<sigma> = qemu_mallocz_0x1acd6_retval \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x28) \<and> RBP \<sigma> = RSI\<^sub>0 \<and> R12 \<sigma> = RDX\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((qemu_mallocz_0x1acd6_retval::64 word) + 0x38),8]::64 word) = 0x2a3b0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R8\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RCX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = 0x1acdb \<and> (\<sigma> \<turnstile> *[qemu_mallocz_0x1acd6_retval,4]::32 word) = ucast ((\<langle>31,0\<rangle>RDI\<^sub>0::32 word))\<close>
declare P_0x1ad13_35_def[Ps]

definition P_0x1ad13_35_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x1ad13_35_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((qemu_mallocz_0x1acd6_retval::64 word) + 0x8), 8),
    (2, ((qemu_mallocz_0x1acd6_retval::64 word) + 0x10), 8),
    (3, ((qemu_mallocz_0x1acd6_retval::64 word) + 0x18), 8),
    (4, ((qemu_mallocz_0x1acd6_retval::64 word) + 0x28), 8),
    (5, ((qemu_mallocz_0x1acd6_retval::64 word) + 0x38), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (11, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (12, qemu_mallocz_0x1acd6_retval, 4)
  }\<close>

definition P_0x1ad13_35_regions :: state_pred where
  \<open>P_0x1ad13_35_regions \<sigma> \<equiv> \<exists>regions. P_0x1ad13_35_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x1aca0_35 :: state_pred where
  \<open>Q_0x1aca0_35 \<sigma> \<equiv> RIP \<sigma> = 0x1aca0 \<and> RBX \<sigma> = ucast ((\<langle>31,0\<rangle>RDI\<^sub>0::32 word)) \<and> RDX \<sigma> = RDX\<^sub>0 \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x28) \<and> RBP \<sigma> = RSI\<^sub>0 \<and> R12 \<sigma> = RDX\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBX\<^sub>0\<close>
declare Q_0x1aca0_35_def[Qs]

schematic_goal qemu_aio_set_fd_handler_0_5_0x1ad13_0x1ad23_35[blocks]:
  assumes \<open>(P_0x1ad13_35 && P_0x1ad13_35_regions) \<sigma>\<close>
  shows \<open>exec_block 5 0x1ad23 35 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x1aca0_35 ?\<sigma> \<and> block_usage P_0x1ad13_35_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x1ad13_35_def P_0x1ad13_35_regions_def post: Q_0x1aca0_35_def regionset: P_0x1ad13_35_regions_set_def)

definition P_0x1aca0_36 :: state_pred where
  \<open>P_0x1aca0_36 \<sigma> \<equiv> RIP \<sigma> = 0x1aca0 \<and> RBX \<sigma> = ucast ((\<langle>31,0\<rangle>RDI\<^sub>0::32 word)) \<and> RDX \<sigma> = RDX\<^sub>0 \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x28) \<and> RBP \<sigma> = RSI\<^sub>0 \<and> R12 \<sigma> = RDX\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBX\<^sub>0\<close>
declare P_0x1aca0_36_def[Ps]

definition P_0x1aca0_36_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x1aca0_36_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (2, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x18), 8)
  }\<close>

definition P_0x1aca0_36_regions :: state_pred where
  \<open>P_0x1aca0_36_regions \<sigma> \<equiv> \<exists>regions. P_0x1aca0_36_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x1acaa_36 :: state_pred where
  \<open>Q_0x1acaa_36 \<sigma> \<equiv> RIP \<sigma> = 0x1acaa \<and> RBX \<sigma> = ucast ((\<langle>31,0\<rangle>RDI\<^sub>0::32 word)) \<and> RCX \<sigma> = RDX\<^sub>0 \<and> RDX \<sigma> = RSI\<^sub>0 \<and> RDI \<sigma> = ucast ((\<langle>31,0\<rangle>RDI\<^sub>0::32 word)) \<and> RSI \<sigma> = 0x0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x28) \<and> RBP \<sigma> = RSI\<^sub>0 \<and> R12 \<sigma> = RDX\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBX\<^sub>0\<close>
declare Q_0x1acaa_36_def[Qs]

schematic_goal qemu_aio_set_fd_handler_0_4_0x1aca0_0x1aca8_36[blocks]:
  assumes \<open>(P_0x1aca0_36 && P_0x1aca0_36_regions) \<sigma>\<close>
  shows \<open>exec_block 4 0x1aca8 36 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x1acaa_36 ?\<sigma> \<and> block_usage P_0x1aca0_36_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x1aca0_36_def P_0x1aca0_36_regions_def post: Q_0x1acaa_36_def regionset: P_0x1aca0_36_regions_set_def)

definition P_0x1acaa_37 :: state_pred where
  \<open>P_0x1acaa_37 \<sigma> \<equiv> RIP \<sigma> = 0x1acaa \<and> RBX \<sigma> = ucast ((\<langle>31,0\<rangle>RDI\<^sub>0::32 word)) \<and> RCX \<sigma> = RDX\<^sub>0 \<and> RDX \<sigma> = RSI\<^sub>0 \<and> RDI \<sigma> = ucast ((\<langle>31,0\<rangle>RDI\<^sub>0::32 word)) \<and> RSI \<sigma> = 0x0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x28) \<and> RBP \<sigma> = RSI\<^sub>0 \<and> R12 \<sigma> = RDX\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBX\<^sub>0\<close>
declare P_0x1acaa_37_def[Ps]

definition P_0x1acaa_37_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x1acaa_37_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (2, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x30), 8)
  }\<close>

definition P_0x1acaa_37_regions :: state_pred where
  \<open>P_0x1acaa_37_regions \<sigma> \<equiv> \<exists>regions. P_0x1acaa_37_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_qemu_set_fd_handler2_addr_0x1acaa_37 :: state_pred where
  \<open>Q_qemu_set_fd_handler2_addr_0x1acaa_37 \<sigma> \<equiv> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x30) \<and> RIP \<sigma> = qemu_set_fd_handler2_addr \<and> RBX \<sigma> = ucast ((\<langle>31,0\<rangle>RDI\<^sub>0::32 word)) \<and> RCX \<sigma> = RDX\<^sub>0 \<and> RDX \<sigma> = RSI\<^sub>0 \<and> RDI \<sigma> = ucast ((\<langle>31,0\<rangle>RDI\<^sub>0::32 word)) \<and> RSI \<sigma> = 0x0 \<and> RBP \<sigma> = RSI\<^sub>0 \<and> R12 \<sigma> = RDX\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = 0x1acaf\<close>
declare Q_qemu_set_fd_handler2_addr_0x1acaa_37_def[Qs]

schematic_goal qemu_aio_set_fd_handler_0_1_0x1acaa_0x1acaa_37[blocks]:
  assumes \<open>(P_0x1acaa_37 && P_0x1acaa_37_regions) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x1acaa 37 \<sigma> \<triangleq> ?\<sigma> \<and> Q_qemu_set_fd_handler2_addr_0x1acaa_37 ?\<sigma> \<and> block_usage P_0x1acaa_37_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x1acaa_37_def P_0x1acaa_37_regions_def post: Q_qemu_set_fd_handler2_addr_0x1acaa_37_def regionset: P_0x1acaa_37_regions_set_def)

definition P_0x1acaf_38 :: state_pred where
  \<open>P_0x1acaf_38 \<sigma> \<equiv> RIP \<sigma> = 0x1acaf \<and> RBX \<sigma> = ucast ((\<langle>31,0\<rangle>RDI\<^sub>0::32 word)) \<and> RCX \<sigma> = RDX\<^sub>0 \<and> RDX \<sigma> = RSI\<^sub>0 \<and> RDI \<sigma> = ucast ((\<langle>31,0\<rangle>RDI\<^sub>0::32 word)) \<and> RSI \<sigma> = 0x0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x28) \<and> RBP \<sigma> = RSI\<^sub>0 \<and> R12 \<sigma> = RDX\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = 0x1acaf\<close>
declare P_0x1acaf_38_def[Ps]

definition P_0x1acaf_38_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x1acaf_38_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (2, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x30), 8)
  }\<close>

definition P_0x1acaf_38_regions :: state_pred where
  \<open>P_0x1acaf_38_regions \<sigma> \<equiv> \<exists>regions. P_0x1acaf_38_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_ret_address_38 :: state_pred where
  \<open>Q_ret_address_38 \<sigma> \<equiv> RIP \<sigma> = ret_address \<and> RAX \<sigma> = 0x0 \<and> RBX \<sigma> = RBX\<^sub>0 \<and> RCX \<sigma> = RDX\<^sub>0 \<and> RDX \<sigma> = RSI\<^sub>0 \<and> RDI \<sigma> = ucast ((\<langle>31,0\<rangle>RDI\<^sub>0::32 word)) \<and> RSI \<sigma> = 0x0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) + 0x8) \<and> RBP \<sigma> = RBP\<^sub>0 \<and> R12 \<sigma> = R12\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = 0x1acaf\<close>
declare Q_ret_address_38_def[Qs]

schematic_goal qemu_aio_set_fd_handler_0_6_0x1acaf_0x1acb9_38[blocks]:
  assumes \<open>(P_0x1acaf_38 && P_0x1acaf_38_regions) \<sigma>\<close>
  shows \<open>exec_block 6 0x1acb9 38 \<sigma> \<triangleq> ?\<sigma> \<and> Q_ret_address_38 ?\<sigma> \<and> block_usage P_0x1acaf_38_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x1acaf_38_def P_0x1acaf_38_regions_def post: Q_ret_address_38_def regionset: P_0x1acaf_38_regions_set_def)

definition qemu_aio_set_fd_handler_acode :: ACode where
  \<open>qemu_aio_set_fd_handler_acode =
    Block 9 0x1ac47 0;
    IF !ZF THEN
      Block (Suc 0) 0x1ac4a (Suc 0);
      WHILE P_0x1ac59_2 DO
        Block (Suc 0) 0x1ac59 2;
        IF !ZF THEN
          Block 3 0x1ac54 3;
          IF ZF THEN
            Block (Suc 0) 0x1ac57 4
          ELSE
            Block (Suc 0) 0x1ac57 5
          FI
        ELSE
          Block (Suc 0) 0x1ac5b 6
        FI
      OD;
      CASES [
        (P_0x1acc0_7,
          Block 2 0x1acc3 7;
          IF ZF THEN
            Block (Suc 0) 0x1acc6 8
          ELSE
            Block 4 0x1acd2 9;
            Block (Suc 0) 0x1acd6 10;
            CALL qemu_mallocz_acode;
            Block 7 0x1acf3 11;
            IF ZF THEN
              Block (Suc 0) 0x1acf7 12
            ELSE
              Block 3 0x1acfd 13
            FI;
            Block 3 0x1ad0f 14;
            Block 5 0x1ad23 15
          FI
        ),
        (P_0x1ac5d_16,
          Block 2 0x1ac60 16;
          IF !ZF THEN
            Block 6 0x1ad23 17
          ELSE
            Block 3 0x1ac6f 18;
            IF !ZF THEN
              Block 3 0x1ad37 19
            ELSE
              Block 4 0x1ac7f 20;
              IF ZF THEN
                Block (Suc 0) 0x1ac82 21
              ELSE
                Block 4 0x1ac8c 22
              FI;
              Block 2 0x1ac93 23;
              Block (Suc 0) 0x1ac97 24;
              CALL qemu_free_acode;
              Block (Suc 0) 0x1ac9c 25
            FI
          FI
        )
      ]
    ELSE
      Block 2 0x1ac4c 26;
      Block 2 0x1acc3 27;
      IF ZF THEN
        Block (Suc 0) 0x1acc6 28
      ELSE
        Block 4 0x1acd2 29;
        Block (Suc 0) 0x1acd6 30;
        CALL qemu_mallocz_acode;
        Block 7 0x1acf3 31;
        IF ZF THEN
          Block (Suc 0) 0x1acf7 32
        ELSE
          Block 3 0x1acfd 33
        FI;
        Block 3 0x1ad0f 34;
        Block 5 0x1ad23 35
      FI
    FI;
    Block 4 0x1aca8 36;
    Block (Suc 0) 0x1acaa 37;
    CALL qemu_set_fd_handler2_acode;
    Block 6 0x1acb9 38
  \<close>

schematic_goal "qemu_aio_set_fd_handler":
  assumes
    \<open>\<forall>\<sigma>. RIP \<sigma> = 0x1ac4a \<longrightarrow> P_0x1ac4a_true_1_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x1ac59 \<longrightarrow> P_0x1ac59_2_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x1ac5b \<longrightarrow> P_0x1ac5b_true_3_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x1ac57 \<longrightarrow> P_0x1ac57_true_4_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x1ac57 \<longrightarrow> P_0x1ac57_false_5_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x1ac5b \<longrightarrow> P_0x1ac5b_false_6_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x1acc0 \<longrightarrow> P_0x1acc0_7_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x1acc6 \<longrightarrow> P_0x1acc6_true_8_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x1acc6 \<longrightarrow> P_0x1acc6_false_9_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x1acd6 \<longrightarrow> P_0x1acd6_10_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x1acdb \<longrightarrow> P_0x1acdb_11_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x1acf7 \<longrightarrow> P_0x1acf7_true_12_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x1acf7 \<longrightarrow> P_0x1acf7_false_13_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x1ad01 \<longrightarrow> P_0x1ad01_14_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x1ad13 \<longrightarrow> P_0x1ad13_15_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x1ac5d \<longrightarrow> P_0x1ac5d_16_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x1ac63 \<longrightarrow> P_0x1ac63_true_17_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x1ac63 \<longrightarrow> P_0x1ac63_false_18_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x1ac71 \<longrightarrow> P_0x1ac71_true_19_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x1ac71 \<longrightarrow> P_0x1ac71_false_20_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x1ac82 \<longrightarrow> P_0x1ac82_true_21_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x1ac82 \<longrightarrow> P_0x1ac82_false_22_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x1ac90 \<longrightarrow> P_0x1ac90_23_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x1ac97 \<longrightarrow> P_0x1ac97_24_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x1ac9c \<longrightarrow> P_0x1ac9c_25_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x1ac4a \<longrightarrow> P_0x1ac4a_false_26_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x1acc0 \<longrightarrow> P_0x1acc0_27_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x1acc6 \<longrightarrow> P_0x1acc6_true_28_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x1acc6 \<longrightarrow> P_0x1acc6_false_29_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x1acd6 \<longrightarrow> P_0x1acd6_30_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x1acdb \<longrightarrow> P_0x1acdb_31_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x1acf7 \<longrightarrow> P_0x1acf7_true_32_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x1acf7 \<longrightarrow> P_0x1acf7_false_33_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x1ad01 \<longrightarrow> P_0x1ad01_34_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x1ad13 \<longrightarrow> P_0x1ad13_35_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x1aca0 \<longrightarrow> P_0x1aca0_36_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x1acaa \<longrightarrow> P_0x1acaa_37_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x1acaf \<longrightarrow> P_0x1acaf_38_regions \<sigma>\<close>
    and [blocks]: \<open>{{Q_qemu_mallocz_addr_0x1acd6_10}} \<box>qemu_mallocz_acode {{P_0x1acdb_11;M_0x1acd6}}\<close>
    and [blocks]: \<open>{{Q_qemu_free_addr_0x1ac97_24}} \<box>qemu_free_acode {{P_0x1ac9c_25;M_0x1ac97}}\<close>
    and [blocks]: \<open>{{Q_qemu_mallocz_addr_0x1acd6_30}} \<box>qemu_mallocz_acode {{P_0x1acdb_31;M_0x1acd6}}\<close>
    and [blocks]: \<open>{{Q_qemu_set_fd_handler2_addr_0x1acaa_37}} \<box>qemu_set_fd_handler2_acode {{P_0x1acaf_38;M_0x1acaa}}\<close>
  shows \<open>{{?P}} qemu_aio_set_fd_handler_acode {{?Q;?M}}\<close>
  apply (vcg acode: qemu_aio_set_fd_handler_acode_def assms: assms)
         apply (vcg_while \<open>P_0x1ac59_2 || P_0x1acc0_7 || P_0x1ac5d_16\<close> assms: assms)
            apply (vcg_step assms: assms)+
           apply (simp add: pred_logic Ps Qs)
          apply (vcg_step' assms: assms)
              apply (vcg_step assms: assms)+
  done

end

end
