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
theory raw_aio_remove_cancel
  imports "../../../isabelle/VCG/HTriple"
begin

locale "qemu_img_xen" = execution_context + exec_code +
  fixes errno_location_0x1ae14_retval\<^sub>v die2_0x1ae1e_retval\<^sub>v fsync_0x1ae3f_retval\<^sub>v assert_fail_0x1ae70_retval\<^sub>v assert_fail_0x1ae8f_retval\<^sub>v fd_open_0x1b8e6_retval\<^sub>v qemu_aio_get_0x1b8fd_retval\<^sub>v fd_open_0x1bca6_retval\<^sub>v lseek64_0x1bcbc_retval\<^sub>v qemu_write_0x1bcd7_retval\<^sub>v errno_location_0x1bcf0_retval\<^sub>v fwrite_0x1c069_retval\<^sub>v qemu_paio_cancel_0x1c0f3_retval\<^sub>v qemu_paio_error_0x1c113_retval\<^sub>v qemu_paio_error_0x1c120_retval\<^sub>v raw_aio_setup_0x1c157_retval\<^sub>v qemu_paio_write_0x1c168_retval\<^sub>v qemu_aio_get_0x1c1a2_retval\<^sub>v raw_pwrite_0x1c1be_retval\<^sub>v qemu_bh_new_0x1c1d3_retval\<^sub>v qemu_bh_schedule_0x1c1db_retval\<^sub>v raw_aio_remove_0x1c1ed_retval\<^sub>v raw_aio_setup_0x1c227_retval\<^sub>v qemu_paio_read_0x1c238_retval\<^sub>v qemu_aio_get_0x1c272_retval\<^sub>v raw_pread_0x1c28e_retval\<^sub>v qemu_bh_new_0x1c2a3_retval\<^sub>v qemu_bh_schedule_0x1c2ab_retval\<^sub>v raw_aio_remove_0x1c2bd_retval\<^sub>v fsync_0x1c2da_retval\<^sub>v errno_location_0x1c2e3_retval\<^sub>v qemu_malloc_0x1c376_retval\<^sub>v sigemptyset_0x1c381_retval\<^sub>v sigaddset_0x1c38e_retval\<^sub>v sigprocmask_0x1c39d_retval\<^sub>v sigfillset_0x1c3b2_retval\<^sub>v sigaction_0x1c3db_retval\<^sub>v pipe_0x1c3ed_retval\<^sub>v fcntl64_0x1c414_retval\<^sub>v fcntl64_0x1c428_retval\<^sub>v qemu_aio_set_fd_handler_0x1c442_retval\<^sub>v qemu_paio_init_0x1c463_retval\<^sub>v fwrite_0x1c4a8_retval\<^sub>v qemu_free_0x1c4b0_retval\<^sub>v errno_location_0x1c4b5_retval\<^sub>v stack_chk_fail_0x1c4c0_retval\<^sub>v ftruncate64_0x1c77e_retval\<^sub>v errno_location_0x1c790_retval\<^sub>v assert_fail_addr errno_location_addr stack_chk_fail_addr die2_addr fcntl64_addr fd_open_addr fsync_addr ftruncate64_addr fwrite_addr lseek64_addr pipe_addr qemu_aio_get_addr qemu_aio_set_fd_handler_addr qemu_bh_new_addr qemu_bh_schedule_addr qemu_free_addr qemu_malloc_addr qemu_paio_cancel_addr qemu_paio_error_addr qemu_paio_init_addr qemu_paio_read_addr qemu_paio_write_addr qemu_write_addr raw_pread_addr raw_pwrite_addr sigaction_addr sigaddset_addr sigemptyset_addr sigfillset_addr sigprocmask_addr :: \<open>64 word\<close>
    and assert_fail_acode errno_location_acode stack_chk_fail_acode die2_acode fcntl64_acode fd_open_acode fsync_acode ftruncate64_acode fwrite_acode lseek64_acode pipe_acode qemu_aio_get_acode qemu_aio_set_fd_handler_acode qemu_bh_new_acode qemu_bh_schedule_acode qemu_free_acode qemu_malloc_acode qemu_paio_cancel_acode qemu_paio_error_acode qemu_paio_init_acode qemu_paio_read_acode qemu_paio_write_acode qemu_write_acode raw_pread_acode raw_pwrite_acode sigaction_acode sigaddset_acode sigemptyset_acode sigfillset_acode sigprocmask_acode :: ACode
  assumes fetch:
    "fetch 0x1a860 \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour rax)) (Storage (Memory SixtyFour (A_SizeDirective 64 (A_FromReg (General SixtyFour rdi))))), 3)"
    "fetch 0x1a863 \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour rdx)) (Storage (Memory SixtyFour (A_SizeDirective 64 (A_Plus (A_FromReg (General SixtyFour rax)) (A_WordConstant 16))))), 4)"
    "fetch 0x1a867 \<equiv> (Binary (IS_8088 Mov) (Memory SixtyFour (A_SizeDirective 64 (A_Plus (A_FromReg (General SixtyFour rdi)) (A_WordConstant 32)))) (Storage (Reg (General SixtyFour rdx))), 4)"
    "fetch 0x1a86b \<equiv> (Binary (IS_8088 Mov) (Memory SixtyFour (A_SizeDirective 64 (A_Plus (A_FromReg (General SixtyFour rax)) (A_WordConstant 16)))) (Storage (Reg (General SixtyFour rdi))), 4)"
    "fetch 0x1a86f \<equiv> (Nullary (IS_8088 Ret), 1)"
    "fetch 0x1ae10 \<equiv> (Unary (IS_8088 Push) (Storage (Reg (General SixtyFour rbx))), 1)"
    "fetch 0x1ae11 \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour rbx)) (Storage (Reg (General SixtyFour rdi))), 3)"
    "fetch 0x1ae14 \<equiv> (Unary (IS_8088 Call) (Immediate SixtyFour (ImmLabel ''__errno_location'')), 5)"
    "fetch 0x1ae19 \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour rsi)) (Storage (Reg (General SixtyFour rbx))), 3)"
    "fetch 0x1ae1c \<equiv> (Binary (IS_8088 Mov) (Reg (General ThirtyTwo rdi)) (Storage (Memory ThirtyTwo (A_SizeDirective 32 (A_FromReg (General SixtyFour rax))))), 2)"
    "fetch 0x1ae1e \<equiv> (Unary (IS_8088 Call) (Immediate SixtyFour (ImmLabel ''die2'')), 5)"
    "fetch 0x1ae23 \<equiv> (Unary (IS_8088 Nop) (Storage (Memory Sixteen (A_SizeDirective 16 (A_Plus (A_FromReg (General SixtyFour cs)) (A_Plus (A_FromReg (General SixtyFour rax)) (A_Plus (A_Mult 1 (A_FromReg (General SixtyFour rax))) (A_WordConstant 0))))))), 11)"
    "fetch 0x1ae2e \<equiv> (Binary (IS_8088 Xchg) (Reg (General Sixteen rax)) (Storage (Reg (General Sixteen rax))), 5)"
    "fetch 0x1ae30 \<equiv> (Binary (IS_8088 Sub) (Reg (General SixtyFour rsp)) (Immediate SixtyFour (ImmVal 8)), 4)"
    "fetch 0x1ae34 \<equiv> (Binary (IS_8088 Cmp) (Reg (General SixtyFour rdx)) (Immediate SixtyFour (ImmVal 1)), 4)"
    "fetch 0x1ae38 \<equiv> (Unary (IS_8088 Jne) (Immediate SixtyFour (ImmVal 110166)), 2)"
    "fetch 0x1ae3a \<equiv> (Binary (IS_8088 Test) (Reg (General SixtyFour rcx)) (Storage (Reg (General SixtyFour rcx))), 3)"
    "fetch 0x1ae3d \<equiv> (Unary (IS_8088 Jne) (Immediate SixtyFour (ImmVal 110197)), 2)"
    "fetch 0x1ae3f \<equiv> (Unary (IS_8088 Call) (Immediate SixtyFour (ImmLabel ''fsync'')), 5)"
    "fetch 0x1ae44 \<equiv> (Binary (IS_8088 Cmp) (Reg (General ThirtyTwo rax)) (Immediate SixtyFour (ImmVal 1)), 3)"
    "fetch 0x1ae47 \<equiv> (Binary (IS_8088 Sbb) (Reg (General SixtyFour rax)) (Storage (Reg (General SixtyFour rax))), 3)"
    "fetch 0x1ae4a \<equiv> (Binary (IS_8088 Add) (Reg (General SixtyFour rsp)) (Immediate SixtyFour (ImmVal 8)), 4)"
    "fetch 0x1ae4e \<equiv> (Binary (IS_8088 And) (Reg (General ThirtyTwo rax)) (Immediate SixtyFour (ImmVal 2)), 3)"
    "fetch 0x1ae51 \<equiv> (Binary (IS_8088 Sub) (Reg (General SixtyFour rax)) (Immediate SixtyFour (ImmVal 1)), 4)"
    "fetch 0x1ae55 \<equiv> (Nullary (IS_8088 Ret), 1)"
    "fetch 0x1ae56 \<equiv> (Binary (IS_8088 Lea) (Reg (General SixtyFour rcx)) (Storage (Memory SixtyFour (A_Plus (A_FromReg (General SixtyFour rip)) (A_WordConstant 28067)))), 7)"
    "fetch 0x1ae5d \<equiv> (Binary (IS_8088 Mov) (Reg (General ThirtyTwo rdx)) (Immediate SixtyFour (ImmVal 207)), 5)"
    "fetch 0x1ae62 \<equiv> (Binary (IS_8088 Lea) (Reg (General SixtyFour rsi)) (Storage (Memory SixtyFour (A_Plus (A_FromReg (General SixtyFour rip)) (A_WordConstant 27806)))), 7)"
    "fetch 0x1ae69 \<equiv> (Binary (IS_8088 Lea) (Reg (General SixtyFour rdi)) (Storage (Memory SixtyFour (A_Plus (A_FromReg (General SixtyFour rip)) (A_WordConstant 27818)))), 7)"
    "fetch 0x1ae70 \<equiv> (Unary (IS_8088 Call) (Immediate SixtyFour (ImmLabel ''__assert_fail'')), 5)"
    "fetch 0x1ae75 \<equiv> (Binary (IS_8088 Lea) (Reg (General SixtyFour rcx)) (Storage (Memory SixtyFour (A_Plus (A_FromReg (General SixtyFour rip)) (A_WordConstant 28036)))), 7)"
    "fetch 0x1ae7c \<equiv> (Binary (IS_8088 Mov) (Reg (General ThirtyTwo rdx)) (Immediate SixtyFour (ImmVal 208)), 5)"
    "fetch 0x1ae81 \<equiv> (Binary (IS_8088 Lea) (Reg (General SixtyFour rsi)) (Storage (Memory SixtyFour (A_Plus (A_FromReg (General SixtyFour rip)) (A_WordConstant 27775)))), 7)"
    "fetch 0x1ae88 \<equiv> (Binary (IS_8088 Lea) (Reg (General SixtyFour rdi)) (Storage (Memory SixtyFour (A_Plus (A_FromReg (General SixtyFour rip)) (A_WordConstant 27986)))), 7)"
    "fetch 0x1ae8f \<equiv> (Unary (IS_8088 Call) (Immediate SixtyFour (ImmLabel ''__assert_fail'')), 5)"
    "fetch 0x1ae94 \<equiv> (Unary (IS_8088 Nop) (Storage (Memory Sixteen (A_SizeDirective 16 (A_Plus (A_FromReg (General SixtyFour cs)) (A_Plus (A_FromReg (General SixtyFour rax)) (A_Plus (A_Mult 1 (A_FromReg (General SixtyFour rax))) (A_WordConstant 0))))))), 11)"
    "fetch 0x1b8c0 \<equiv> (Unary (IS_8088 Push) (Storage (Reg (General SixtyFour r15))), 2)"
    "fetch 0x1b8c2 \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour r15)) (Storage (Reg (General SixtyFour r8))), 3)"
    "fetch 0x1b8c5 \<equiv> (Unary (IS_8088 Push) (Storage (Reg (General SixtyFour r14))), 2)"
    "fetch 0x1b8c7 \<equiv> (Unary (IS_8088 Push) (Storage (Reg (General SixtyFour r13))), 2)"
    "fetch 0x1b8c9 \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour r13)) (Storage (Reg (General SixtyFour rdx))), 3)"
    "fetch 0x1b8cc \<equiv> (Unary (IS_8088 Push) (Storage (Reg (General SixtyFour r12))), 2)"
    "fetch 0x1b8ce \<equiv> (Binary (IS_8088 Mov) (Reg (General ThirtyTwo r12)) (Storage (Reg (General ThirtyTwo rcx))), 3)"
    "fetch 0x1b8d1 \<equiv> (Unary (IS_8088 Push) (Storage (Reg (General SixtyFour rbp))), 1)"
    "fetch 0x1b8d2 \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour rbp)) (Storage (Reg (General SixtyFour rsi))), 3)"
    "fetch 0x1b8d5 \<equiv> (Unary (IS_8088 Push) (Storage (Reg (General SixtyFour rbx))), 1)"
    "fetch 0x1b8d6 \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour rbx)) (Storage (Reg (General SixtyFour rdi))), 3)"
    "fetch 0x1b8d9 \<equiv> (Binary (IS_8088 Sub) (Reg (General SixtyFour rsp)) (Immediate SixtyFour (ImmVal 24)), 4)"
    "fetch 0x1b8dd \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour r14)) (Storage (Memory SixtyFour (A_SizeDirective 64 (A_Plus (A_FromReg (General SixtyFour rdi)) (A_WordConstant 64))))), 4)"
    "fetch 0x1b8e1 \<equiv> (Binary (IS_8088 Mov) (Memory SixtyFour (A_SizeDirective 64 (A_Plus (A_FromReg (General SixtyFour rsp)) (A_WordConstant 8)))) (Storage (Reg (General SixtyFour r9))), 5)"
    "fetch 0x1b8e6 \<equiv> (Unary (IS_8088 Call) (Immediate SixtyFour (ImmLabel ''fd_open'')), 5)"
    "fetch 0x1b8eb \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour r9)) (Storage (Memory SixtyFour (A_SizeDirective 64 (A_Plus (A_FromReg (General SixtyFour rsp)) (A_WordConstant 8))))), 5)"
    "fetch 0x1b8f0 \<equiv> (Binary (IS_8088 Test) (Reg (General ThirtyTwo rax)) (Storage (Reg (General ThirtyTwo rax))), 2)"
    "fetch 0x1b8f2 \<equiv> (Unary (IS_8088 Js) (Immediate SixtyFour (ImmVal 112992)), 2)"
    "fetch 0x1b8f4 \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour rdx)) (Storage (Reg (General SixtyFour r9))), 3)"
    "fetch 0x1b8f7 \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour rsi)) (Storage (Reg (General SixtyFour r15))), 3)"
    "fetch 0x1b8fa \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour rdi)) (Storage (Reg (General SixtyFour rbx))), 3)"
    "fetch 0x1b8fd \<equiv> (Unary (IS_8088 Call) (Immediate SixtyFour (ImmLabel ''qemu_aio_get'')), 5)"
    "fetch 0x1b902 \<equiv> (Binary (IS_8088 Test) (Reg (General SixtyFour rax)) (Storage (Reg (General SixtyFour rax))), 3)"
    "fetch 0x1b905 \<equiv> (Unary (IS_8088 Je) (Immediate SixtyFour (ImmVal 112992)), 2)"
    "fetch 0x1b907 \<equiv> (Binary (IS_8088 Mov) (Reg (General ThirtyTwo rdx)) (Storage (Memory ThirtyTwo (A_SizeDirective 32 (A_FromReg (General SixtyFour r14))))), 3)"
    "fetch 0x1b90a \<equiv> (Binary (IS_8088 Mov) (Reg (General ThirtyTwo rcx)) (Storage (Reg (General ThirtyTwo r12))), 3)"
    "fetch 0x1b90d \<equiv> (Binary (IS_8088 Mov) (Memory ThirtyTwo (A_SizeDirective 32 (A_Plus (A_FromReg (General SixtyFour rax)) (A_WordConstant 64)))) (Immediate SixtyFour (ImmVal 12)), 7)"
    "fetch 0x1b914 \<equiv> (Unary (IS_8088 Neg) (Storage (Reg (General ThirtyTwo rcx))), 2)"
    "fetch 0x1b916 \<equiv> (Binary (IS_8088 Mov) (Memory SixtyFour (A_SizeDirective 64 (A_Plus (A_FromReg (General SixtyFour rax)) (A_WordConstant 48)))) (Storage (Reg (General SixtyFour r13))), 4)"
    "fetch 0x1b91a \<equiv> (Binary (IS_8088 Mov) (Memory ThirtyTwo (A_SizeDirective 32 (A_Plus (A_FromReg (General SixtyFour rax)) (A_WordConstant 40)))) (Storage (Reg (General ThirtyTwo rdx))), 3)"
    "fetch 0x1b91d \<equiv> (Binary (IS_8088 Mov) (Reg (General ThirtyTwo rdx)) (Storage (Reg (General ThirtyTwo r12))), 3)"
    "fetch 0x1b920 \<equiv> (Binary (IS_X86_64 Movsxd) (Reg (General SixtyFour rcx)) (Storage (Reg (General ThirtyTwo rcx))), 3)"
    "fetch 0x1b923 \<equiv> (Binary (IS_8088 Shl) (Reg (General ThirtyTwo rdx)) (Immediate SixtyFour (ImmVal 9)), 3)"
    "fetch 0x1b926 \<equiv> (Binary (IS_8088 Test) (Reg (General ThirtyTwo r12)) (Storage (Reg (General ThirtyTwo r12))), 3)"
    "fetch 0x1b929 \<equiv> (Binary (IS_X86_64 Movsxd) (Reg (General SixtyFour rdx)) (Storage (Reg (General ThirtyTwo rdx))), 3)"
    "fetch 0x1b92c \<equiv> (Binary (IS_PentiumPro Cmovs) (Reg (General SixtyFour rdx)) (Storage (Reg (General SixtyFour rcx))), 4)"
    "fetch 0x1b930 \<equiv> (Binary (IS_8088 Shl) (Reg (General SixtyFour rbp)) (Immediate SixtyFour (ImmVal 9)), 4)"
    "fetch 0x1b934 \<equiv> (Binary (IS_8088 Mov) (Memory SixtyFour (A_SizeDirective 64 (A_Plus (A_FromReg (General SixtyFour rax)) (A_WordConstant 72)))) (Storage (Reg (General SixtyFour rbp))), 4)"
    "fetch 0x1b938 \<equiv> (Binary (IS_8088 Mov) (Memory SixtyFour (A_SizeDirective 64 (A_Plus (A_FromReg (General SixtyFour rax)) (A_WordConstant 56)))) (Storage (Reg (General SixtyFour rdx))), 4)"
    "fetch 0x1b93c \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour rdx)) (Storage (Memory SixtyFour (A_SizeDirective 64 (A_Plus (A_FromReg (General SixtyFour rip)) (A_WordConstant 60229))))), 7)"
    "fetch 0x1b943 \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour rcx)) (Storage (Memory SixtyFour (A_SizeDirective 64 (A_Plus (A_FromReg (General SixtyFour rdx)) (A_WordConstant 8))))), 4)"
    "fetch 0x1b947 \<equiv> (Binary (IS_8088 Mov) (Memory SixtyFour (A_SizeDirective 64 (A_Plus (A_FromReg (General SixtyFour rax)) (A_WordConstant 120)))) (Storage (Reg (General SixtyFour rcx))), 4)"
    "fetch 0x1b94b \<equiv> (Binary (IS_8088 Mov) (Memory SixtyFour (A_SizeDirective 64 (A_Plus (A_FromReg (General SixtyFour rdx)) (A_WordConstant 8)))) (Storage (Reg (General SixtyFour rax))), 4)"
    "fetch 0x1b94f \<equiv> (Binary (IS_8088 Add) (Reg (General SixtyFour rsp)) (Immediate SixtyFour (ImmVal 24)), 4)"
    "fetch 0x1b953 \<equiv> (Unary (IS_8088 Pop) (Storage (Reg (General SixtyFour rbx))), 1)"
    "fetch 0x1b954 \<equiv> (Unary (IS_8088 Pop) (Storage (Reg (General SixtyFour rbp))), 1)"
    "fetch 0x1b955 \<equiv> (Unary (IS_8088 Pop) (Storage (Reg (General SixtyFour r12))), 2)"
    "fetch 0x1b957 \<equiv> (Unary (IS_8088 Pop) (Storage (Reg (General SixtyFour r13))), 2)"
    "fetch 0x1b959 \<equiv> (Unary (IS_8088 Pop) (Storage (Reg (General SixtyFour r14))), 2)"
    "fetch 0x1b95b \<equiv> (Unary (IS_8088 Pop) (Storage (Reg (General SixtyFour r15))), 2)"
    "fetch 0x1b95d \<equiv> (Nullary (IS_8088 Ret), 1)"
    "fetch 0x1b95e \<equiv> (Binary (IS_8088 Xchg) (Reg (General Sixteen rax)) (Storage (Reg (General Sixteen rax))), 2)"
    "fetch 0x1b960 \<equiv> (Binary (IS_8088 Add) (Reg (General SixtyFour rsp)) (Immediate SixtyFour (ImmVal 24)), 4)"
    "fetch 0x1b964 \<equiv> (Binary (IS_8088 Xor) (Reg (General ThirtyTwo rax)) (Storage (Reg (General ThirtyTwo rax))), 2)"
    "fetch 0x1b966 \<equiv> (Unary (IS_8088 Pop) (Storage (Reg (General SixtyFour rbx))), 1)"
    "fetch 0x1b967 \<equiv> (Unary (IS_8088 Pop) (Storage (Reg (General SixtyFour rbp))), 1)"
    "fetch 0x1b968 \<equiv> (Unary (IS_8088 Pop) (Storage (Reg (General SixtyFour r12))), 2)"
    "fetch 0x1b96a \<equiv> (Unary (IS_8088 Pop) (Storage (Reg (General SixtyFour r13))), 2)"
    "fetch 0x1b96c \<equiv> (Unary (IS_8088 Pop) (Storage (Reg (General SixtyFour r14))), 2)"
    "fetch 0x1b96e \<equiv> (Unary (IS_8088 Pop) (Storage (Reg (General SixtyFour r15))), 2)"
    "fetch 0x1b970 \<equiv> (Nullary (IS_8088 Ret), 1)"
    "fetch 0x1b971 \<equiv> (Unary (IS_8088 Nop) (Storage (Memory Sixteen (A_SizeDirective 16 (A_Plus (A_FromReg (General SixtyFour cs)) (A_Plus (A_FromReg (General SixtyFour rax)) (A_Plus (A_Mult 1 (A_FromReg (General SixtyFour rax))) (A_WordConstant 0))))))), 11)"
    "fetch 0x1bc90 \<equiv> (Unary (IS_8088 Push) (Storage (Reg (General SixtyFour r13))), 2)"
    "fetch 0x1bc92 \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour r13)) (Storage (Reg (General SixtyFour rsi))), 3)"
    "fetch 0x1bc95 \<equiv> (Unary (IS_8088 Push) (Storage (Reg (General SixtyFour r12))), 2)"
    "fetch 0x1bc97 \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour r12)) (Storage (Reg (General SixtyFour rdx))), 3)"
    "fetch 0x1bc9a \<equiv> (Unary (IS_8088 Push) (Storage (Reg (General SixtyFour rbp))), 1)"
    "fetch 0x1bc9b \<equiv> (Unary (IS_8088 Push) (Storage (Reg (General SixtyFour rbx))), 1)"
    "fetch 0x1bc9c \<equiv> (Binary (IS_8088 Mov) (Reg (General ThirtyTwo rbx)) (Storage (Reg (General ThirtyTwo rcx))), 2)"
    "fetch 0x1bc9e \<equiv> (Binary (IS_8088 Sub) (Reg (General SixtyFour rsp)) (Immediate SixtyFour (ImmVal 8)), 4)"
    "fetch 0x1bca2 \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour rbp)) (Storage (Memory SixtyFour (A_SizeDirective 64 (A_Plus (A_FromReg (General SixtyFour rdi)) (A_WordConstant 64))))), 4)"
    "fetch 0x1bca6 \<equiv> (Unary (IS_8088 Call) (Immediate SixtyFour (ImmLabel ''fd_open'')), 5)"
    "fetch 0x1bcab \<equiv> (Binary (IS_8088 Test) (Reg (General ThirtyTwo rax)) (Storage (Reg (General ThirtyTwo rax))), 2)"
    "fetch 0x1bcad \<equiv> (Unary (IS_8088 Js) (Immediate SixtyFour (ImmVal 113904)), 2)"
    "fetch 0x1bcaf \<equiv> (Binary (IS_8088 Mov) (Reg (General ThirtyTwo rdi)) (Storage (Memory ThirtyTwo (A_SizeDirective 32 (A_Plus (A_FromReg (General SixtyFour rbp)) (A_WordConstant 0))))), 3)"
    "fetch 0x1bcb2 \<equiv> (Binary (IS_8088 Test) (Reg (General SixtyFour r13)) (Storage (Reg (General SixtyFour r13))), 3)"
    "fetch 0x1bcb5 \<equiv> (Unary (IS_8088 Js) (Immediate SixtyFour (ImmVal 113866)), 2)"
    "fetch 0x1bcb7 \<equiv> (Binary (IS_8088 Xor) (Reg (General ThirtyTwo rdx)) (Storage (Reg (General ThirtyTwo rdx))), 2)"
    "fetch 0x1bcb9 \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour rsi)) (Storage (Reg (General SixtyFour r13))), 3)"
    "fetch 0x1bcbc \<equiv> (Unary (IS_8088 Call) (Immediate SixtyFour (ImmLabel ''lseek64'')), 5)"
    "fetch 0x1bcc1 \<equiv> (Binary (IS_8088 Cmp) (Reg (General SixtyFour rax)) (Immediate SixtyFour (ImmVal 18446744073709551615)), 4)"
    "fetch 0x1bcc5 \<equiv> (Unary (IS_8088 Je) (Immediate SixtyFour (ImmVal 113926)), 2)"
    "fetch 0x1bcc7 \<equiv> (Binary (IS_8088 Mov) (Reg (General ThirtyTwo rdi)) (Storage (Memory ThirtyTwo (A_SizeDirective 32 (A_Plus (A_FromReg (General SixtyFour rbp)) (A_WordConstant 0))))), 3)"
    "fetch 0x1bcca \<equiv> (Binary (IS_8088 Mov) (Memory ThirtyTwo (A_SizeDirective 32 (A_Plus (A_FromReg (General SixtyFour rbp)) (A_WordConstant 8)))) (Immediate SixtyFour (ImmVal 0)), 7)"
    "fetch 0x1bcd1 \<equiv> (Binary (IS_X86_64 Movsxd) (Reg (General SixtyFour rdx)) (Storage (Reg (General ThirtyTwo rbx))), 3)"
    "fetch 0x1bcd4 \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour rsi)) (Storage (Reg (General SixtyFour r12))), 3)"
    "fetch 0x1bcd7 \<equiv> (Unary (IS_8088 Call) (Immediate SixtyFour (ImmLabel ''qemu_write'')), 5)"
    "fetch 0x1bcdc \<equiv> (Binary (IS_8088 Mov) (Reg (General ThirtyTwo rdx)) (Storage (Reg (General ThirtyTwo rax))), 2)"
    "fetch 0x1bcde \<equiv> (Binary (IS_8088 Test) (Reg (General ThirtyTwo rax)) (Storage (Reg (General ThirtyTwo rax))), 2)"
    "fetch 0x1bce0 \<equiv> (Unary (IS_8088 Js) (Immediate SixtyFour (ImmVal 113904)), 2)"
    "fetch 0x1bce2 \<equiv> (Binary (IS_8088 Add) (Reg (General SixtyFour rsp)) (Immediate SixtyFour (ImmVal 8)), 4)"
    "fetch 0x1bce6 \<equiv> (Binary (IS_8088 Mov) (Reg (General ThirtyTwo rax)) (Storage (Reg (General ThirtyTwo rdx))), 2)"
    "fetch 0x1bce8 \<equiv> (Unary (IS_8088 Pop) (Storage (Reg (General SixtyFour rbx))), 1)"
    "fetch 0x1bce9 \<equiv> (Unary (IS_8088 Pop) (Storage (Reg (General SixtyFour rbp))), 1)"
    "fetch 0x1bcea \<equiv> (Unary (IS_8088 Pop) (Storage (Reg (General SixtyFour r12))), 2)"
    "fetch 0x1bcec \<equiv> (Unary (IS_8088 Pop) (Storage (Reg (General SixtyFour r13))), 2)"
    "fetch 0x1bcee \<equiv> (Nullary (IS_8088 Ret), 1)"
    "fetch 0x1bcef \<equiv> (Nullary (IS_8088 Nop), 1)"
    "fetch 0x1bcf0 \<equiv> (Unary (IS_8088 Call) (Immediate SixtyFour (ImmLabel ''__errno_location'')), 5)"
    "fetch 0x1bcf5 \<equiv> (Binary (IS_8088 Mov) (Reg (General ThirtyTwo rdx)) (Storage (Memory ThirtyTwo (A_SizeDirective 32 (A_FromReg (General SixtyFour rax))))), 2)"
    "fetch 0x1bcf7 \<equiv> (Binary (IS_8088 Add) (Reg (General SixtyFour rsp)) (Immediate SixtyFour (ImmVal 8)), 4)"
    "fetch 0x1bcfb \<equiv> (Unary (IS_8088 Pop) (Storage (Reg (General SixtyFour rbx))), 1)"
    "fetch 0x1bcfc \<equiv> (Unary (IS_8088 Pop) (Storage (Reg (General SixtyFour rbp))), 1)"
    "fetch 0x1bcfd \<equiv> (Unary (IS_8088 Neg) (Storage (Reg (General ThirtyTwo rdx))), 2)"
    "fetch 0x1bcff \<equiv> (Unary (IS_8088 Pop) (Storage (Reg (General SixtyFour r12))), 2)"
    "fetch 0x1bd01 \<equiv> (Unary (IS_8088 Pop) (Storage (Reg (General SixtyFour r13))), 2)"
    "fetch 0x1bd03 \<equiv> (Binary (IS_8088 Mov) (Reg (General ThirtyTwo rax)) (Storage (Reg (General ThirtyTwo rdx))), 2)"
    "fetch 0x1bd05 \<equiv> (Nullary (IS_8088 Ret), 1)"
    "fetch 0x1bd06 \<equiv> (Binary (IS_8088 Add) (Memory ThirtyTwo (A_SizeDirective 32 (A_Plus (A_FromReg (General SixtyFour rbp)) (A_WordConstant 8)))) (Immediate SixtyFour (ImmVal 1)), 4)"
    "fetch 0x1bd0a \<equiv> (Binary (IS_8088 Mov) (Reg (General ThirtyTwo rdx)) (Immediate SixtyFour (ImmVal 4294967291)), 5)"
    "fetch 0x1bd0f \<equiv> (Unary (IS_8088 Jmp) (Immediate SixtyFour (ImmVal 113890)), 2)"
    "fetch 0x1bd11 \<equiv> (Unary (IS_8088 Nop) (Storage (Memory Sixteen (A_SizeDirective 16 (A_Plus (A_FromReg (General SixtyFour cs)) (A_Plus (A_FromReg (General SixtyFour rax)) (A_Plus (A_Mult 1 (A_FromReg (General SixtyFour rax))) (A_WordConstant 0))))))), 11)"
    "fetch 0x1c020 \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour rax)) (Storage (Memory SixtyFour (A_SizeDirective 64 (A_Plus (A_FromReg (General SixtyFour rip)) (A_WordConstant 58465))))), 7)"
    "fetch 0x1c027 \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour rdx)) (Storage (Memory SixtyFour (A_SizeDirective 64 (A_Plus (A_FromReg (General SixtyFour rax)) (A_WordConstant 8))))), 4)"
    "fetch 0x1c02b \<equiv> (Binary (IS_8088 Test) (Reg (General SixtyFour rdx)) (Storage (Reg (General SixtyFour rdx))), 3)"
    "fetch 0x1c02e \<equiv> (Unary (IS_8088 Je) (Immediate SixtyFour (ImmVal 114769)), 2)"
    "fetch 0x1c030 \<equiv> (Binary (IS_8088 Cmp) (Reg (General SixtyFour rdx)) (Storage (Reg (General SixtyFour rdi))), 3)"
    "fetch 0x1c033 \<equiv> (Unary (IS_8088 Jne) (Immediate SixtyFour (ImmVal 114760)), 2)"
    "fetch 0x1c035 \<equiv> (Unary (IS_8088 Jmp) (Immediate SixtyFour (ImmVal 114816)), 2)"
    "fetch 0x1c037 \<equiv> (Unary (IS_8088 Nop) (Storage (Memory Sixteen (A_SizeDirective 16 (A_Plus (A_FromReg (General SixtyFour rax)) (A_Plus (A_Mult 1 (A_FromReg (General SixtyFour rax))) (A_WordConstant 0)))))), 9)"
    "fetch 0x1c040 \<equiv> (Binary (IS_8088 Cmp) (Reg (General SixtyFour rax)) (Storage (Reg (General SixtyFour rdi))), 3)"
    "fetch 0x1c043 \<equiv> (Unary (IS_8088 Je) (Immediate SixtyFour (ImmVal 114800)), 2)"
    "fetch 0x1c045 \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour rdx)) (Storage (Reg (General SixtyFour rax))), 3)"
    "fetch 0x1c048 \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour rax)) (Storage (Memory SixtyFour (A_SizeDirective 64 (A_Plus (A_FromReg (General SixtyFour rdx)) (A_WordConstant 120))))), 4)"
    "fetch 0x1c04c \<equiv> (Binary (IS_8088 Test) (Reg (General SixtyFour rax)) (Storage (Reg (General SixtyFour rax))), 3)"
    "fetch 0x1c04f \<equiv> (Unary (IS_8088 Jne) (Immediate SixtyFour (ImmVal 114752)), 2)"
    "fetch 0x1c051 \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour rcx)) (Storage (Memory SixtyFour (A_SizeDirective 64 (A_Plus (A_FromReg (General SixtyFour rip)) (A_WordConstant 58024))))), 7)"
    "fetch 0x1c058 \<equiv> (Binary (IS_8088 Mov) (Reg (General ThirtyTwo rdx)) (Immediate SixtyFour (ImmVal 39)), 5)"
    "fetch 0x1c05d \<equiv> (Binary (IS_8088 Mov) (Reg (General ThirtyTwo rsi)) (Immediate SixtyFour (ImmVal 1)), 5)"
    "fetch 0x1c062 \<equiv> (Binary (IS_8088 Lea) (Reg (General SixtyFour rdi)) (Storage (Memory SixtyFour (A_Plus (A_FromReg (General SixtyFour rip)) (A_WordConstant 23575)))), 7)"
    "fetch 0x1c069 \<equiv> (Unary (IS_8088 Call) (Immediate SixtyFour (ImmLabel ''fwrite'')), 1)"
    "fetch 0x1c06a \<equiv> (Nullary (IS_8088 Ret), 4)"
    "fetch 0x1c06e \<equiv> (Binary (IS_8088 Xchg) (Reg (General Sixteen rax)) (Storage (Reg (General Sixteen rax))), 2)"
    "fetch 0x1c070 \<equiv> (Binary (IS_8088 Add) (Reg (General SixtyFour rdx)) (Immediate SixtyFour (ImmVal 120)), 4)"
    "fetch 0x1c074 \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour rax)) (Storage (Memory SixtyFour (A_SizeDirective 64 (A_Plus (A_FromReg (General SixtyFour rdi)) (A_WordConstant 120))))), 4)"
    "fetch 0x1c078 \<equiv> (Binary (IS_8088 Mov) (Memory SixtyFour (A_SizeDirective 64 (A_FromReg (General SixtyFour rdx)))) (Storage (Reg (General SixtyFour rax))), 3)"
    "fetch 0x1c07b \<equiv> (Unary (IS_8088 Jmp) (Immediate SixtyFour (ImmVal 108640)), 5)"
    "fetch 0x1c080 \<equiv> (Binary (IS_8088 Lea) (Reg (General SixtyFour rdx)) (Storage (Memory SixtyFour (A_Plus (A_FromReg (General SixtyFour rax)) (A_WordConstant 8)))), 4)"
    "fetch 0x1c084 \<equiv> (Unary (IS_8088 Jmp) (Immediate SixtyFour (ImmVal 114804)), 2)"
    "fetch 0x1c0e0 \<equiv> (Unary (IS_8088 Push) (Storage (Reg (General SixtyFour rbp))), 1)"
    "fetch 0x1c0e1 \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour rbp)) (Storage (Reg (General SixtyFour rdi))), 3)"
    "fetch 0x1c0e4 \<equiv> (Unary (IS_8088 Push) (Storage (Reg (General SixtyFour rbx))), 1)"
    "fetch 0x1c0e5 \<equiv> (Binary (IS_8088 Lea) (Reg (General SixtyFour rbx)) (Storage (Memory SixtyFour (A_Plus (A_FromReg (General SixtyFour rdi)) (A_WordConstant 40)))), 4)"
    "fetch 0x1c0e9 \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour rsi)) (Storage (Reg (General SixtyFour rbx))), 3)"
    "fetch 0x1c0ec \<equiv> (Binary (IS_8088 Sub) (Reg (General SixtyFour rsp)) (Immediate SixtyFour (ImmVal 8)), 4)"
    "fetch 0x1c0f0 \<equiv> (Binary (IS_8088 Mov) (Reg (General ThirtyTwo rdi)) (Storage (Memory ThirtyTwo (A_SizeDirective 32 (A_Plus (A_FromReg (General SixtyFour rdi)) (A_WordConstant 40))))), 3)"
    "fetch 0x1c0f3 \<equiv> (Unary (IS_8088 Call) (Immediate SixtyFour (ImmLabel ''qemu_paio_cancel'')), 5)"
    "fetch 0x1c0f8 \<equiv> (Binary (IS_8088 Cmp) (Reg (General ThirtyTwo rax)) (Immediate SixtyFour (ImmVal 2)), 3)"
    "fetch 0x1c0fb \<equiv> (Unary (IS_8088 Je) (Immediate SixtyFour (ImmVal 114960)), 2)"
    "fetch 0x1c0fd \<equiv> (Binary (IS_8088 Add) (Reg (General SixtyFour rsp)) (Immediate SixtyFour (ImmVal 8)), 4)"
    "fetch 0x1c101 \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour rdi)) (Storage (Reg (General SixtyFour rbp))), 3)"
    "fetch 0x1c104 \<equiv> (Unary (IS_8088 Pop) (Storage (Reg (General SixtyFour rbx))), 1)"
    "fetch 0x1c105 \<equiv> (Unary (IS_8088 Pop) (Storage (Reg (General SixtyFour rbp))), 1)"
    "fetch 0x1c106 \<equiv> (Unary (IS_8088 Jmp) (Immediate SixtyFour (ImmVal 114720)), 5)"
    "fetch 0x1c10b \<equiv> (Unary (IS_8088 Nop) (Storage (Memory ThirtyTwo (A_SizeDirective 32 (A_Plus (A_FromReg (General SixtyFour rax)) (A_Plus (A_Mult 1 (A_FromReg (General SixtyFour rax))) (A_WordConstant 0)))))), 5)"
    "fetch 0x1c110 \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour rdi)) (Storage (Reg (General SixtyFour rbx))), 3)"
    "fetch 0x1c113 \<equiv> (Unary (IS_8088 Call) (Immediate SixtyFour (ImmLabel ''qemu_paio_error'')), 5)"
    "fetch 0x1c118 \<equiv> (Binary (IS_8088 Cmp) (Reg (General ThirtyTwo rax)) (Immediate SixtyFour (ImmVal 115)), 3)"
    "fetch 0x1c11b \<equiv> (Unary (IS_8088 Jne) (Immediate SixtyFour (ImmVal 114941)), 2)"
    "fetch 0x1c11d \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour rdi)) (Storage (Reg (General SixtyFour rbx))), 3)"
    "fetch 0x1c120 \<equiv> (Unary (IS_8088 Call) (Immediate SixtyFour (ImmLabel ''qemu_paio_error'')), 5)"
    "fetch 0x1c125 \<equiv> (Binary (IS_8088 Cmp) (Reg (General ThirtyTwo rax)) (Immediate SixtyFour (ImmVal 115)), 3)"
    "fetch 0x1c128 \<equiv> (Unary (IS_8088 Je) (Immediate SixtyFour (ImmVal 114960)), 2)"
    "fetch 0x1c12a \<equiv> (Unary (IS_8088 Jmp) (Immediate SixtyFour (ImmVal 114941)), 2)"
    "fetch 0x1c130 \<equiv> (Unary (IS_8088 Push) (Storage (Reg (General SixtyFour r13))), 2)"
    "fetch 0x1c132 \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour r13)) (Storage (Reg (General SixtyFour rsi))), 3)"
    "fetch 0x1c135 \<equiv> (Unary (IS_8088 Push) (Storage (Reg (General SixtyFour r12))), 2)"
    "fetch 0x1c137 \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour r12)) (Storage (Reg (General SixtyFour rdx))), 3)"
    "fetch 0x1c13a \<equiv> (Unary (IS_8088 Push) (Storage (Reg (General SixtyFour rbp))), 1)"
    "fetch 0x1c13b \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour rbp)) (Storage (Reg (General SixtyFour rdi))), 3)"
    "fetch 0x1c13e \<equiv> (Unary (IS_8088 Push) (Storage (Reg (General SixtyFour rbx))), 1)"
    "fetch 0x1c13f \<equiv> (Binary (IS_8088 Sub) (Reg (General SixtyFour rsp)) (Immediate SixtyFour (ImmVal 24)), 4)"
    "fetch 0x1c143 \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour rax)) (Storage (Memory SixtyFour (A_SizeDirective 64 (A_Plus (A_FromReg (General SixtyFour rdi)) (A_WordConstant 64))))), 4)"
    "fetch 0x1c147 \<equiv> (Binary (IS_8088 Cmp) (Memory SixtyFour (A_SizeDirective 64 (A_Plus (A_FromReg (General SixtyFour rax)) (A_WordConstant 40)))) (Immediate SixtyFour (ImmVal 0)), 5)"
    "fetch 0x1c14c \<equiv> (Unary (IS_8088 Jne) (Immediate SixtyFour (ImmVal 115088)), 2)"
    "fetch 0x1c14e \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour rdx)) (Storage (Reg (General SixtyFour r12))), 3)"
    "fetch 0x1c151 \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour rsi)) (Storage (Reg (General SixtyFour r13))), 3)"
    "fetch 0x1c154 \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour rdi)) (Storage (Reg (General SixtyFour rbp))), 3)"
    "fetch 0x1c157 \<equiv> (Unary (IS_8088 Call) (Immediate SixtyFour (ImmLabel ''raw_aio_setup'')), 5)"
    "fetch 0x1c15c \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour rbx)) (Storage (Reg (General SixtyFour rax))), 3)"
    "fetch 0x1c15f \<equiv> (Binary (IS_8088 Test) (Reg (General SixtyFour rax)) (Storage (Reg (General SixtyFour rax))), 3)"
    "fetch 0x1c162 \<equiv> (Unary (IS_8088 Je) (Immediate SixtyFour (ImmVal 115072)), 2)"
    "fetch 0x1c164 \<equiv> (Binary (IS_8088 Lea) (Reg (General SixtyFour rdi)) (Storage (Memory SixtyFour (A_Plus (A_FromReg (General SixtyFour rax)) (A_WordConstant 40)))), 4)"
    "fetch 0x1c168 \<equiv> (Unary (IS_8088 Call) (Immediate SixtyFour (ImmLabel ''qemu_paio_write'')), 5)"
    "fetch 0x1c16d \<equiv> (Binary (IS_8088 Test) (Reg (General ThirtyTwo rax)) (Storage (Reg (General ThirtyTwo rax))), 2)"
    "fetch 0x1c16f \<equiv> (Unary (IS_8088 Js) (Immediate SixtyFour (ImmVal 115176)), 2)"
    "fetch 0x1c171 \<equiv> (Binary (IS_8088 Add) (Reg (General SixtyFour rsp)) (Immediate SixtyFour (ImmVal 24)), 4)"
    "fetch 0x1c175 \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour rax)) (Storage (Reg (General SixtyFour rbx))), 3)"
    "fetch 0x1c178 \<equiv> (Unary (IS_8088 Pop) (Storage (Reg (General SixtyFour rbx))), 1)"
    "fetch 0x1c179 \<equiv> (Unary (IS_8088 Pop) (Storage (Reg (General SixtyFour rbp))), 1)"
    "fetch 0x1c17a \<equiv> (Unary (IS_8088 Pop) (Storage (Reg (General SixtyFour r12))), 2)"
    "fetch 0x1c17c \<equiv> (Unary (IS_8088 Pop) (Storage (Reg (General SixtyFour r13))), 2)"
    "fetch 0x1c17e \<equiv> (Nullary (IS_8088 Ret), 1)"
    "fetch 0x1c17f \<equiv> (Nullary (IS_8088 Nop), 1)"
    "fetch 0x1c180 \<equiv> (Binary (IS_8088 Add) (Reg (General SixtyFour rsp)) (Immediate SixtyFour (ImmVal 24)), 4)"
    "fetch 0x1c184 \<equiv> (Binary (IS_8088 Xor) (Reg (General ThirtyTwo rbx)) (Storage (Reg (General ThirtyTwo rbx))), 2)"
    "fetch 0x1c186 \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour rax)) (Storage (Reg (General SixtyFour rbx))), 3)"
    "fetch 0x1c189 \<equiv> (Unary (IS_8088 Pop) (Storage (Reg (General SixtyFour rbx))), 1)"
    "fetch 0x1c18a \<equiv> (Unary (IS_8088 Pop) (Storage (Reg (General SixtyFour rbp))), 1)"
    "fetch 0x1c18b \<equiv> (Unary (IS_8088 Pop) (Storage (Reg (General SixtyFour r12))), 2)"
    "fetch 0x1c18d \<equiv> (Unary (IS_8088 Pop) (Storage (Reg (General SixtyFour r13))), 2)"
    "fetch 0x1c18f \<equiv> (Nullary (IS_8088 Ret), 1)"
    "fetch 0x1c190 \<equiv> (Binary (IS_8088 Test) (Reg (General ThirtyTwo rdx)) (Immediate SixtyFour (ImmVal 511)), 6)"
    "fetch 0x1c196 \<equiv> (Unary (IS_8088 Je) (Immediate SixtyFour (ImmVal 115022)), 2)"
    "fetch 0x1c198 \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour rdx)) (Storage (Reg (General SixtyFour r9))), 3)"
    "fetch 0x1c19b \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour rsi)) (Storage (Reg (General SixtyFour r8))), 3)"
    "fetch 0x1c19e \<equiv> (Binary (IS_8088 Mov) (Memory ThirtyTwo (A_SizeDirective 32 (A_Plus (A_FromReg (General SixtyFour rsp)) (A_WordConstant 12)))) (Storage (Reg (General ThirtyTwo rcx))), 4)"
    "fetch 0x1c1a2 \<equiv> (Unary (IS_8088 Call) (Immediate SixtyFour (ImmLabel ''qemu_aio_get'')), 5)"
    "fetch 0x1c1a7 \<equiv> (Binary (IS_8088 Mov) (Reg (General ThirtyTwo rcx)) (Storage (Memory ThirtyTwo (A_SizeDirective 32 (A_Plus (A_FromReg (General SixtyFour rsp)) (A_WordConstant 12))))), 4)"
    "fetch 0x1c1ab \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour rsi)) (Storage (Reg (General SixtyFour r13))), 3)"
    "fetch 0x1c1ae \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour rdx)) (Storage (Reg (General SixtyFour r12))), 3)"
    "fetch 0x1c1b1 \<equiv> (Binary (IS_8088 Shl) (Reg (General SixtyFour rsi)) (Immediate SixtyFour (ImmVal 9)), 4)"
    "fetch 0x1c1b5 \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour rdi)) (Storage (Reg (General SixtyFour rbp))), 3)"
    "fetch 0x1c1b8 \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour rbx)) (Storage (Reg (General SixtyFour rax))), 3)"
    "fetch 0x1c1bb \<equiv> (Binary (IS_8088 Shl) (Reg (General ThirtyTwo rcx)) (Immediate SixtyFour (ImmVal 9)), 3)"
    "fetch 0x1c1be \<equiv> (Unary (IS_8088 Call) (Immediate SixtyFour (ImmLabel ''raw_pwrite'')), 5)"
    "fetch 0x1c1c3 \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour rsi)) (Storage (Reg (General SixtyFour rbx))), 3)"
    "fetch 0x1c1c6 \<equiv> (Binary (IS_8088 Lea) (Reg (General SixtyFour rdi)) (Storage (Memory SixtyFour (A_Plus (A_FromReg (General SixtyFour rip)) (A_WordConstant (-2125))))), 7)"
    "fetch 0x1c1cd \<equiv> (Binary (IS_8088 Mov) (Memory ThirtyTwo (A_SizeDirective 32 (A_Plus (A_FromReg (General SixtyFour rbx)) (A_WordConstant 128)))) (Storage (Reg (General ThirtyTwo rax))), 6)"
    "fetch 0x1c1d3 \<equiv> (Unary (IS_8088 Call) (Immediate SixtyFour (ImmLabel ''qemu_bh_new'')), 5)"
    "fetch 0x1c1d8 \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour rdi)) (Storage (Reg (General SixtyFour rax))), 3)"
    "fetch 0x1c1db \<equiv> (Unary (IS_8088 Call) (Immediate SixtyFour (ImmLabel ''qemu_bh_schedule'')), 5)"
    "fetch 0x1c1e0 \<equiv> (Unary (IS_8088 Jmp) (Immediate SixtyFour (ImmVal 115057)), 2)"
    "fetch 0x1c1e2 \<equiv> (Unary (IS_8088 Nop) (Storage (Memory Sixteen (A_SizeDirective 16 (A_Plus (A_FromReg (General SixtyFour rax)) (A_Plus (A_Mult 1 (A_FromReg (General SixtyFour rax))) (A_WordConstant 0)))))), 6)"
    "fetch 0x1c1e8 \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour rdi)) (Storage (Reg (General SixtyFour rbx))), 3)"
    "fetch 0x1c1eb \<equiv> (Binary (IS_8088 Xor) (Reg (General ThirtyTwo rbx)) (Storage (Reg (General ThirtyTwo rbx))), 2)"
    "fetch 0x1c1ed \<equiv> (Unary (IS_8088 Call) (Immediate SixtyFour (ImmLabel ''raw_aio_remove'')), 5)"
    "fetch 0x1c1f2 \<equiv> (Unary (IS_8088 Jmp) (Immediate SixtyFour (ImmVal 115057)), 5)"
    "fetch 0x1c200 \<equiv> (Unary (IS_8088 Push) (Storage (Reg (General SixtyFour r13))), 2)"
    "fetch 0x1c202 \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour r13)) (Storage (Reg (General SixtyFour rsi))), 3)"
    "fetch 0x1c205 \<equiv> (Unary (IS_8088 Push) (Storage (Reg (General SixtyFour r12))), 2)"
    "fetch 0x1c207 \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour r12)) (Storage (Reg (General SixtyFour rdx))), 3)"
    "fetch 0x1c20a \<equiv> (Unary (IS_8088 Push) (Storage (Reg (General SixtyFour rbp))), 1)"
    "fetch 0x1c20b \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour rbp)) (Storage (Reg (General SixtyFour rdi))), 3)"
    "fetch 0x1c20e \<equiv> (Unary (IS_8088 Push) (Storage (Reg (General SixtyFour rbx))), 1)"
    "fetch 0x1c20f \<equiv> (Binary (IS_8088 Sub) (Reg (General SixtyFour rsp)) (Immediate SixtyFour (ImmVal 24)), 4)"
    "fetch 0x1c213 \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour rax)) (Storage (Memory SixtyFour (A_SizeDirective 64 (A_Plus (A_FromReg (General SixtyFour rdi)) (A_WordConstant 64))))), 4)"
    "fetch 0x1c217 \<equiv> (Binary (IS_8088 Cmp) (Memory SixtyFour (A_SizeDirective 64 (A_Plus (A_FromReg (General SixtyFour rax)) (A_WordConstant 40)))) (Immediate SixtyFour (ImmVal 0)), 5)"
    "fetch 0x1c21c \<equiv> (Unary (IS_8088 Jne) (Immediate SixtyFour (ImmVal 115296)), 2)"
    "fetch 0x1c21e \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour rdx)) (Storage (Reg (General SixtyFour r12))), 3)"
    "fetch 0x1c221 \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour rsi)) (Storage (Reg (General SixtyFour r13))), 3)"
    "fetch 0x1c224 \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour rdi)) (Storage (Reg (General SixtyFour rbp))), 3)"
    "fetch 0x1c227 \<equiv> (Unary (IS_8088 Call) (Immediate SixtyFour (ImmLabel ''raw_aio_setup'')), 5)"
    "fetch 0x1c22c \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour rbx)) (Storage (Reg (General SixtyFour rax))), 3)"
    "fetch 0x1c22f \<equiv> (Binary (IS_8088 Test) (Reg (General SixtyFour rax)) (Storage (Reg (General SixtyFour rax))), 3)"
    "fetch 0x1c232 \<equiv> (Unary (IS_8088 Je) (Immediate SixtyFour (ImmVal 115280)), 2)"
    "fetch 0x1c234 \<equiv> (Binary (IS_8088 Lea) (Reg (General SixtyFour rdi)) (Storage (Memory SixtyFour (A_Plus (A_FromReg (General SixtyFour rax)) (A_WordConstant 40)))), 4)"
    "fetch 0x1c238 \<equiv> (Unary (IS_8088 Call) (Immediate SixtyFour (ImmLabel ''qemu_paio_read'')), 5)"
    "fetch 0x1c23d \<equiv> (Binary (IS_8088 Test) (Reg (General ThirtyTwo rax)) (Storage (Reg (General ThirtyTwo rax))), 2)"
    "fetch 0x1c23f \<equiv> (Unary (IS_8088 Js) (Immediate SixtyFour (ImmVal 115384)), 2)"
    "fetch 0x1c241 \<equiv> (Binary (IS_8088 Add) (Reg (General SixtyFour rsp)) (Immediate SixtyFour (ImmVal 24)), 4)"
    "fetch 0x1c245 \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour rax)) (Storage (Reg (General SixtyFour rbx))), 3)"
    "fetch 0x1c248 \<equiv> (Unary (IS_8088 Pop) (Storage (Reg (General SixtyFour rbx))), 1)"
    "fetch 0x1c249 \<equiv> (Unary (IS_8088 Pop) (Storage (Reg (General SixtyFour rbp))), 1)"
    "fetch 0x1c24a \<equiv> (Unary (IS_8088 Pop) (Storage (Reg (General SixtyFour r12))), 2)"
    "fetch 0x1c24c \<equiv> (Unary (IS_8088 Pop) (Storage (Reg (General SixtyFour r13))), 2)"
    "fetch 0x1c24e \<equiv> (Nullary (IS_8088 Ret), 1)"
    "fetch 0x1c24f \<equiv> (Nullary (IS_8088 Nop), 1)"
    "fetch 0x1c250 \<equiv> (Binary (IS_8088 Add) (Reg (General SixtyFour rsp)) (Immediate SixtyFour (ImmVal 24)), 4)"
    "fetch 0x1c254 \<equiv> (Binary (IS_8088 Xor) (Reg (General ThirtyTwo rbx)) (Storage (Reg (General ThirtyTwo rbx))), 2)"
    "fetch 0x1c256 \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour rax)) (Storage (Reg (General SixtyFour rbx))), 3)"
    "fetch 0x1c259 \<equiv> (Unary (IS_8088 Pop) (Storage (Reg (General SixtyFour rbx))), 1)"
    "fetch 0x1c25a \<equiv> (Unary (IS_8088 Pop) (Storage (Reg (General SixtyFour rbp))), 1)"
    "fetch 0x1c25b \<equiv> (Unary (IS_8088 Pop) (Storage (Reg (General SixtyFour r12))), 2)"
    "fetch 0x1c25d \<equiv> (Unary (IS_8088 Pop) (Storage (Reg (General SixtyFour r13))), 2)"
    "fetch 0x1c25f \<equiv> (Nullary (IS_8088 Ret), 1)"
    "fetch 0x1c260 \<equiv> (Binary (IS_8088 Test) (Reg (General ThirtyTwo rdx)) (Immediate SixtyFour (ImmVal 511)), 6)"
    "fetch 0x1c266 \<equiv> (Unary (IS_8088 Je) (Immediate SixtyFour (ImmVal 115230)), 2)"
    "fetch 0x1c268 \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour rdx)) (Storage (Reg (General SixtyFour r9))), 3)"
    "fetch 0x1c26b \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour rsi)) (Storage (Reg (General SixtyFour r8))), 3)"
    "fetch 0x1c26e \<equiv> (Binary (IS_8088 Mov) (Memory ThirtyTwo (A_SizeDirective 32 (A_Plus (A_FromReg (General SixtyFour rsp)) (A_WordConstant 12)))) (Storage (Reg (General ThirtyTwo rcx))), 4)"
    "fetch 0x1c272 \<equiv> (Unary (IS_8088 Call) (Immediate SixtyFour (ImmLabel ''qemu_aio_get'')), 5)"
    "fetch 0x1c277 \<equiv> (Binary (IS_8088 Mov) (Reg (General ThirtyTwo rcx)) (Storage (Memory ThirtyTwo (A_SizeDirective 32 (A_Plus (A_FromReg (General SixtyFour rsp)) (A_WordConstant 12))))), 4)"
    "fetch 0x1c27b \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour rsi)) (Storage (Reg (General SixtyFour r13))), 3)"
    "fetch 0x1c27e \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour rdx)) (Storage (Reg (General SixtyFour r12))), 3)"
    "fetch 0x1c281 \<equiv> (Binary (IS_8088 Shl) (Reg (General SixtyFour rsi)) (Immediate SixtyFour (ImmVal 9)), 4)"
    "fetch 0x1c285 \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour rdi)) (Storage (Reg (General SixtyFour rbp))), 3)"
    "fetch 0x1c288 \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour rbx)) (Storage (Reg (General SixtyFour rax))), 3)"
    "fetch 0x1c28b \<equiv> (Binary (IS_8088 Shl) (Reg (General ThirtyTwo rcx)) (Immediate SixtyFour (ImmVal 9)), 3)"
    "fetch 0x1c28e \<equiv> (Unary (IS_8088 Call) (Immediate SixtyFour (ImmLabel ''raw_pread'')), 5)"
    "fetch 0x1c293 \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour rsi)) (Storage (Reg (General SixtyFour rbx))), 3)"
    "fetch 0x1c296 \<equiv> (Binary (IS_8088 Lea) (Reg (General SixtyFour rdi)) (Storage (Memory SixtyFour (A_Plus (A_FromReg (General SixtyFour rip)) (A_WordConstant (-2333))))), 7)"
    "fetch 0x1c29d \<equiv> (Binary (IS_8088 Mov) (Memory ThirtyTwo (A_SizeDirective 32 (A_Plus (A_FromReg (General SixtyFour rbx)) (A_WordConstant 128)))) (Storage (Reg (General ThirtyTwo rax))), 6)"
    "fetch 0x1c2a3 \<equiv> (Unary (IS_8088 Call) (Immediate SixtyFour (ImmLabel ''qemu_bh_new'')), 5)"
    "fetch 0x1c2a8 \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour rdi)) (Storage (Reg (General SixtyFour rax))), 3)"
    "fetch 0x1c2ab \<equiv> (Unary (IS_8088 Call) (Immediate SixtyFour (ImmLabel ''qemu_bh_schedule'')), 5)"
    "fetch 0x1c2b0 \<equiv> (Unary (IS_8088 Jmp) (Immediate SixtyFour (ImmVal 115265)), 2)"
    "fetch 0x1c2b2 \<equiv> (Unary (IS_8088 Nop) (Storage (Memory Sixteen (A_SizeDirective 16 (A_Plus (A_FromReg (General SixtyFour rax)) (A_Plus (A_Mult 1 (A_FromReg (General SixtyFour rax))) (A_WordConstant 0)))))), 6)"
    "fetch 0x1c2b8 \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour rdi)) (Storage (Reg (General SixtyFour rbx))), 3)"
    "fetch 0x1c2bb \<equiv> (Binary (IS_8088 Xor) (Reg (General ThirtyTwo rbx)) (Storage (Reg (General ThirtyTwo rbx))), 2)"
    "fetch 0x1c2bd \<equiv> (Unary (IS_8088 Call) (Immediate SixtyFour (ImmLabel ''raw_aio_remove'')), 5)"
    "fetch 0x1c2c2 \<equiv> (Unary (IS_8088 Jmp) (Immediate SixtyFour (ImmVal 115265)), 5)"
    "fetch 0x1c2d0 \<equiv> (Binary (IS_8088 Sub) (Reg (General SixtyFour rsp)) (Immediate SixtyFour (ImmVal 8)), 4)"
    "fetch 0x1c2d4 \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour rax)) (Storage (Memory SixtyFour (A_SizeDirective 64 (A_Plus (A_FromReg (General SixtyFour rdi)) (A_WordConstant 64))))), 4)"
    "fetch 0x1c2d8 \<equiv> (Binary (IS_8088 Mov) (Reg (General ThirtyTwo rdi)) (Storage (Memory ThirtyTwo (A_SizeDirective 32 (A_FromReg (General SixtyFour rax))))), 2)"
    "fetch 0x1c2da \<equiv> (Unary (IS_8088 Call) (Immediate SixtyFour (ImmLabel ''fsync'')), 5)"
    "fetch 0x1c2df \<equiv> (Binary (IS_8088 Test) (Reg (General ThirtyTwo rax)) (Storage (Reg (General ThirtyTwo rax))), 2)"
    "fetch 0x1c2e1 \<equiv> (Unary (IS_8088 Je) (Immediate SixtyFour (ImmVal 115434)), 2)"
    "fetch 0x1c2e3 \<equiv> (Unary (IS_8088 Call) (Immediate SixtyFour (ImmLabel ''__errno_location'')), 5)"
    "fetch 0x1c2e8 \<equiv> (Binary (IS_8088 Mov) (Reg (General ThirtyTwo rax)) (Storage (Memory ThirtyTwo (A_SizeDirective 32 (A_FromReg (General SixtyFour rax))))), 2)"
    "fetch 0x1c2ea \<equiv> (Binary (IS_8088 Add) (Reg (General SixtyFour rsp)) (Immediate SixtyFour (ImmVal 8)), 4)"
    "fetch 0x1c2ee \<equiv> (Nullary (IS_8088 Ret), 1)"
    "fetch 0x1c350 \<equiv> (Unary (IS_8088 Push) (Storage (Reg (General SixtyFour rbp))), 1)"
    "fetch 0x1c351 \<equiv> (Binary (IS_8088 Mov) (Reg (General ThirtyTwo rdi)) (Immediate SixtyFour (ImmVal 16)), 5)"
    "fetch 0x1c356 \<equiv> (Unary (IS_8088 Push) (Storage (Reg (General SixtyFour rbx))), 1)"
    "fetch 0x1c357 \<equiv> (Binary (IS_8088 Sub) (Reg (General SixtyFour rsp)) (Immediate SixtyFour (ImmVal 328)), 7)"
    "fetch 0x1c35e \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour rax)) (Storage (Memory SixtyFour (A_SizeDirective 64 (A_Plus (A_FromReg (General SixtyFour fs)) (A_WordConstant 40))))), 9)"
    "fetch 0x1c367 \<equiv> (Binary (IS_8088 Mov) (Memory SixtyFour (A_SizeDirective 64 (A_Plus (A_FromReg (General SixtyFour rsp)) (A_WordConstant 312)))) (Storage (Reg (General SixtyFour rax))), 8)"
    "fetch 0x1c36f \<equiv> (Binary (IS_8088 Xor) (Reg (General ThirtyTwo rax)) (Storage (Reg (General ThirtyTwo rax))), 2)"
    "fetch 0x1c371 \<equiv> (Binary (IS_8088 Lea) (Reg (General SixtyFour rbp)) (Storage (Memory SixtyFour (A_Plus (A_FromReg (General SixtyFour rsp)) (A_WordConstant 32)))), 5)"
    "fetch 0x1c376 \<equiv> (Unary (IS_8088 Call) (Immediate SixtyFour (ImmLabel ''qemu_malloc'')), 5)"
    "fetch 0x1c37b \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour rdi)) (Storage (Reg (General SixtyFour rbp))), 3)"
    "fetch 0x1c37e \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour rbx)) (Storage (Reg (General SixtyFour rax))), 3)"
    "fetch 0x1c381 \<equiv> (Unary (IS_8088 Call) (Immediate SixtyFour (ImmLabel ''sigemptyset'')), 5)"
    "fetch 0x1c386 \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour rdi)) (Storage (Reg (General SixtyFour rbp))), 3)"
    "fetch 0x1c389 \<equiv> (Binary (IS_8088 Mov) (Reg (General ThirtyTwo rsi)) (Immediate SixtyFour (ImmVal 12)), 5)"
    "fetch 0x1c38e \<equiv> (Unary (IS_8088 Call) (Immediate SixtyFour (ImmLabel ''sigaddset'')), 5)"
    "fetch 0x1c393 \<equiv> (Binary (IS_8088 Xor) (Reg (General ThirtyTwo rdx)) (Storage (Reg (General ThirtyTwo rdx))), 2)"
    "fetch 0x1c395 \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour rsi)) (Storage (Reg (General SixtyFour rbp))), 3)"
    "fetch 0x1c398 \<equiv> (Binary (IS_8088 Mov) (Reg (General ThirtyTwo rdi)) (Immediate SixtyFour (ImmVal 1)), 5)"
    "fetch 0x1c39d \<equiv> (Unary (IS_8088 Call) (Immediate SixtyFour (ImmLabel ''sigprocmask'')), 5)"
    "fetch 0x1c3a2 \<equiv> (Binary (IS_8088 Lea) (Reg (General SixtyFour rbp)) (Storage (Memory SixtyFour (A_Plus (A_FromReg (General SixtyFour rsp)) (A_WordConstant 160)))), 8)"
    "fetch 0x1c3aa \<equiv> (Binary (IS_8088 Lea) (Reg (General SixtyFour rdi)) (Storage (Memory SixtyFour (A_Plus (A_FromReg (General SixtyFour rsp)) (A_WordConstant 168)))), 8)"
    "fetch 0x1c3b2 \<equiv> (Unary (IS_8088 Call) (Immediate SixtyFour (ImmLabel ''sigfillset'')), 5)"
    "fetch 0x1c3b7 \<equiv> (Binary (IS_8088 Xor) (Reg (General ThirtyTwo rdx)) (Storage (Reg (General ThirtyTwo rdx))), 2)"
    "fetch 0x1c3b9 \<equiv> (Binary (IS_8088 Mov) (Reg (General ThirtyTwo rdi)) (Immediate SixtyFour (ImmVal 12)), 5)"
    "fetch 0x1c3be \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour rsi)) (Storage (Reg (General SixtyFour rbp))), 3)"
    "fetch 0x1c3c1 \<equiv> (Binary (IS_8088 Lea) (Reg (General SixtyFour rax)) (Storage (Memory SixtyFour (A_Plus (A_FromReg (General SixtyFour rip)) (A_WordConstant (-2184))))), 7)"
    "fetch 0x1c3c8 \<equiv> (Binary (IS_8088 Mov) (Memory ThirtyTwo (A_SizeDirective 32 (A_Plus (A_FromReg (General SixtyFour rsp)) (A_WordConstant 296)))) (Immediate SixtyFour (ImmVal 0)), 11)"
    "fetch 0x1c3d3 \<equiv> (Binary (IS_8088 Mov) (Memory SixtyFour (A_SizeDirective 64 (A_Plus (A_FromReg (General SixtyFour rsp)) (A_WordConstant 160)))) (Storage (Reg (General SixtyFour rax))), 8)"
    "fetch 0x1c3db \<equiv> (Unary (IS_8088 Call) (Immediate SixtyFour (ImmLabel ''sigaction'')), 5)"
    "fetch 0x1c3e0 \<equiv> (Binary (IS_8088 Mov) (Memory SixtyFour (A_SizeDirective 64 (A_Plus (A_FromReg (General SixtyFour rbx)) (A_WordConstant 8)))) (Immediate SixtyFour (ImmVal 0)), 8)"
    "fetch 0x1c3e8 \<equiv> (Binary (IS_8088 Lea) (Reg (General SixtyFour rdi)) (Storage (Memory SixtyFour (A_Plus (A_FromReg (General SixtyFour rsp)) (A_WordConstant 24)))), 5)"
    "fetch 0x1c3ed \<equiv> (Unary (IS_8088 Call) (Immediate SixtyFour (ImmLabel ''pipe'')), 5)"
    "fetch 0x1c3f2 \<equiv> (Binary (IS_8088 Cmp) (Reg (General ThirtyTwo rax)) (Immediate SixtyFour (ImmVal 4294967295)), 3)"
    "fetch 0x1c3f5 \<equiv> (Unary (IS_8088 Je) (Immediate SixtyFour (ImmVal 115856)), 6)"
    "fetch 0x1c3fb \<equiv> (Binary (IS_8088 Mov) (Reg (General ThirtyTwo rdi)) (Storage (Memory ThirtyTwo (A_SizeDirective 32 (A_Plus (A_FromReg (General SixtyFour rsp)) (A_WordConstant 24))))), 4)"
    "fetch 0x1c3ff \<equiv> (Binary (IS_8088 Mov) (Reg (General ThirtyTwo rdx)) (Immediate SixtyFour (ImmVal 2048)), 5)"
    "fetch 0x1c404 \<equiv> (Binary (IS_8088 Mov) (Reg (General ThirtyTwo rsi)) (Immediate SixtyFour (ImmVal 4)), 5)"
    "fetch 0x1c409 \<equiv> (Binary (IS_8088 Mov) (Memory ThirtyTwo (A_SizeDirective 32 (A_FromReg (General SixtyFour rbx)))) (Storage (Reg (General ThirtyTwo rdi))), 2)"
    "fetch 0x1c40b \<equiv> (Binary (IS_8088 Mov) (Reg (General ThirtyTwo rax)) (Storage (Memory ThirtyTwo (A_SizeDirective 32 (A_Plus (A_FromReg (General SixtyFour rsp)) (A_WordConstant 28))))), 4)"
    "fetch 0x1c40f \<equiv> (Binary (IS_8088 Mov) (Memory ThirtyTwo (A_SizeDirective 32 (A_Plus (A_FromReg (General SixtyFour rbx)) (A_WordConstant 4)))) (Storage (Reg (General ThirtyTwo rax))), 3)"
    "fetch 0x1c412 \<equiv> (Binary (IS_8088 Xor) (Reg (General ThirtyTwo rax)) (Storage (Reg (General ThirtyTwo rax))), 2)"
    "fetch 0x1c414 \<equiv> (Unary (IS_8088 Call) (Immediate SixtyFour (ImmLabel ''fcntl64'')), 5)"
    "fetch 0x1c419 \<equiv> (Binary (IS_8088 Mov) (Reg (General ThirtyTwo rdi)) (Storage (Memory ThirtyTwo (A_SizeDirective 32 (A_Plus (A_FromReg (General SixtyFour rbx)) (A_WordConstant 4))))), 3)"
    "fetch 0x1c41c \<equiv> (Binary (IS_8088 Mov) (Reg (General ThirtyTwo rdx)) (Immediate SixtyFour (ImmVal 2048)), 5)"
    "fetch 0x1c421 \<equiv> (Binary (IS_8088 Xor) (Reg (General ThirtyTwo rax)) (Storage (Reg (General ThirtyTwo rax))), 2)"
    "fetch 0x1c423 \<equiv> (Binary (IS_8088 Mov) (Reg (General ThirtyTwo rsi)) (Immediate SixtyFour (ImmVal 4)), 5)"
    "fetch 0x1c428 \<equiv> (Unary (IS_8088 Call) (Immediate SixtyFour (ImmLabel ''fcntl64'')), 5)"
    "fetch 0x1c42d \<equiv> (Binary (IS_8088 Mov) (Reg (General ThirtyTwo rdi)) (Storage (Memory ThirtyTwo (A_SizeDirective 32 (A_FromReg (General SixtyFour rbx))))), 2)"
    "fetch 0x1c42f \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour r8)) (Storage (Reg (General SixtyFour rbx))), 3)"
    "fetch 0x1c432 \<equiv> (Binary (IS_8088 Xor) (Reg (General ThirtyTwo rdx)) (Storage (Reg (General ThirtyTwo rdx))), 2)"
    "fetch 0x1c434 \<equiv> (Binary (IS_8088 Lea) (Reg (General SixtyFour rcx)) (Storage (Memory SixtyFour (A_Plus (A_FromReg (General SixtyFour rip)) (A_WordConstant (-4283))))), 7)"
    "fetch 0x1c43b \<equiv> (Binary (IS_8088 Lea) (Reg (General SixtyFour rsi)) (Storage (Memory SixtyFour (A_Plus (A_FromReg (General SixtyFour rip)) (A_WordConstant (-2594))))), 7)"
    "fetch 0x1c442 \<equiv> (Unary (IS_8088 Call) (Immediate SixtyFour (ImmLabel ''qemu_aio_set_fd_handler'')), 5)"
    "fetch 0x1c447 \<equiv> (Binary (IS_8088 Lea) (Reg (General SixtyFour rdi)) (Storage (Memory SixtyFour (A_Plus (A_FromReg (General SixtyFour rsp)) (A_WordConstant 12)))), 5)"
    "fetch 0x1c44c \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour rax)) (Immediate SixtyFour (ImmVal 274877907008)), 10)"
    "fetch 0x1c456 \<equiv> (Binary (IS_8088 Mov) (Memory ThirtyTwo (A_SizeDirective 32 (A_Plus (A_FromReg (General SixtyFour rsp)) (A_WordConstant 20)))) (Immediate SixtyFour (ImmVal 0)), 8)"
    "fetch 0x1c45e \<equiv> (Binary (IS_8088 Mov) (Memory SixtyFour (A_SizeDirective 64 (A_Plus (A_FromReg (General SixtyFour rsp)) (A_WordConstant 12)))) (Storage (Reg (General SixtyFour rax))), 5)"
    "fetch 0x1c463 \<equiv> (Unary (IS_8088 Call) (Immediate SixtyFour (ImmLabel ''qemu_paio_init'')), 5)"
    "fetch 0x1c468 \<equiv> (Binary (IS_8088 Mov) (Memory SixtyFour (A_SizeDirective 64 (A_Plus (A_FromReg (General SixtyFour rip)) (A_WordConstant 57369)))) (Storage (Reg (General SixtyFour rbx))), 7)"
    "fetch 0x1c46f \<equiv> (Binary (IS_8088 Xor) (Reg (General ThirtyTwo rax)) (Storage (Reg (General ThirtyTwo rax))), 2)"
    "fetch 0x1c471 \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour rcx)) (Storage (Memory SixtyFour (A_SizeDirective 64 (A_Plus (A_FromReg (General SixtyFour rsp)) (A_WordConstant 312))))), 8)"
    "fetch 0x1c479 \<equiv> (Binary (IS_8088 Xor) (Reg (General SixtyFour rcx)) (Storage (Memory SixtyFour (A_SizeDirective 64 (A_Plus (A_FromReg (General SixtyFour fs)) (A_WordConstant 40))))), 9)"
    "fetch 0x1c482 \<equiv> (Unary (IS_8088 Jne) (Immediate SixtyFour (ImmVal 115904)), 2)"
    "fetch 0x1c484 \<equiv> (Binary (IS_8088 Add) (Reg (General SixtyFour rsp)) (Immediate SixtyFour (ImmVal 328)), 7)"
    "fetch 0x1c48b \<equiv> (Unary (IS_8088 Pop) (Storage (Reg (General SixtyFour rbx))), 1)"
    "fetch 0x1c48c \<equiv> (Unary (IS_8088 Pop) (Storage (Reg (General SixtyFour rbp))), 1)"
    "fetch 0x1c48d \<equiv> (Nullary (IS_8088 Ret), 1)"
    "fetch 0x1c48e \<equiv> (Binary (IS_8088 Xchg) (Reg (General Sixteen rax)) (Storage (Reg (General Sixteen rax))), 2)"
    "fetch 0x1c490 \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour rcx)) (Storage (Memory SixtyFour (A_SizeDirective 64 (A_Plus (A_FromReg (General SixtyFour rip)) (A_WordConstant 56937))))), 7)"
    "fetch 0x1c497 \<equiv> (Binary (IS_8088 Mov) (Reg (General ThirtyTwo rdx)) (Immediate SixtyFour (ImmVal 22)), 5)"
    "fetch 0x1c49c \<equiv> (Binary (IS_8088 Mov) (Reg (General ThirtyTwo rsi)) (Immediate SixtyFour (ImmVal 1)), 5)"
    "fetch 0x1c4a1 \<equiv> (Binary (IS_8088 Lea) (Reg (General SixtyFour rdi)) (Storage (Memory SixtyFour (A_Plus (A_FromReg (General SixtyFour rip)) (A_WordConstant 22427)))), 7)"
    "fetch 0x1c4a8 \<equiv> (Unary (IS_8088 Call) (Immediate SixtyFour (ImmLabel ''fwrite'')), 5)"
    "fetch 0x1c4ad \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour rdi)) (Storage (Reg (General SixtyFour rbx))), 3)"
    "fetch 0x1c4b0 \<equiv> (Unary (IS_8088 Call) (Immediate SixtyFour (ImmLabel ''qemu_free'')), 5)"
    "fetch 0x1c4b5 \<equiv> (Unary (IS_8088 Call) (Immediate SixtyFour (ImmLabel ''__errno_location'')), 5)"
    "fetch 0x1c4ba \<equiv> (Binary (IS_8088 Mov) (Reg (General ThirtyTwo rax)) (Storage (Memory ThirtyTwo (A_SizeDirective 32 (A_FromReg (General SixtyFour rax))))), 2)"
    "fetch 0x1c4bc \<equiv> (Unary (IS_8088 Neg) (Storage (Reg (General ThirtyTwo rax))), 2)"
    "fetch 0x1c4be \<equiv> (Unary (IS_8088 Jmp) (Immediate SixtyFour (ImmVal 115825)), 2)"
    "fetch 0x1c4c0 \<equiv> (Unary (IS_8088 Call) (Immediate SixtyFour (ImmLabel ''__stack_chk_fail'')), 5)"
    "fetch 0x1c770 \<equiv> (Unary (IS_8088 Push) (Storage (Reg (General SixtyFour rbx))), 1)"
    "fetch 0x1c771 \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour rax)) (Storage (Memory SixtyFour (A_SizeDirective 64 (A_Plus (A_FromReg (General SixtyFour rdi)) (A_WordConstant 64))))), 4)"
    "fetch 0x1c775 \<equiv> (Binary (IS_8088 Mov) (Reg (General ThirtyTwo rbx)) (Storage (Memory ThirtyTwo (A_SizeDirective 32 (A_Plus (A_FromReg (General SixtyFour rax)) (A_WordConstant 4))))), 3)"
    "fetch 0x1c778 \<equiv> (Binary (IS_8088 Test) (Reg (General ThirtyTwo rbx)) (Storage (Reg (General ThirtyTwo rbx))), 2)"
    "fetch 0x1c77a \<equiv> (Unary (IS_8088 Jne) (Immediate SixtyFour (ImmVal 116640)), 2)"
    "fetch 0x1c77c \<equiv> (Binary (IS_8088 Mov) (Reg (General ThirtyTwo rdi)) (Storage (Memory ThirtyTwo (A_SizeDirective 32 (A_FromReg (General SixtyFour rax))))), 2)"
    "fetch 0x1c77e \<equiv> (Unary (IS_8088 Call) (Immediate SixtyFour (ImmLabel ''ftruncate64'')), 5)"
    "fetch 0x1c783 \<equiv> (Binary (IS_8088 Test) (Reg (General ThirtyTwo rax)) (Storage (Reg (General ThirtyTwo rax))), 2)"
    "fetch 0x1c785 \<equiv> (Unary (IS_8088 Js) (Immediate SixtyFour (ImmVal 116624)), 2)"
    "fetch 0x1c787 \<equiv> (Binary (IS_8088 Mov) (Reg (General ThirtyTwo rax)) (Storage (Reg (General ThirtyTwo rbx))), 2)"
    "fetch 0x1c789 \<equiv> (Unary (IS_8088 Pop) (Storage (Reg (General SixtyFour rbx))), 1)"
    "fetch 0x1c78a \<equiv> (Nullary (IS_8088 Ret), 1)"
    "fetch 0x1c78b \<equiv> (Unary (IS_8088 Nop) (Storage (Memory ThirtyTwo (A_SizeDirective 32 (A_Plus (A_FromReg (General SixtyFour rax)) (A_Plus (A_Mult 1 (A_FromReg (General SixtyFour rax))) (A_WordConstant 0)))))), 5)"
    "fetch 0x1c790 \<equiv> (Unary (IS_8088 Call) (Immediate SixtyFour (ImmLabel ''__errno_location'')), 5)"
    "fetch 0x1c795 \<equiv> (Binary (IS_8088 Mov) (Reg (General ThirtyTwo rbx)) (Storage (Memory ThirtyTwo (A_SizeDirective 32 (A_FromReg (General SixtyFour rax))))), 2)"
    "fetch 0x1c797 \<equiv> (Unary (IS_8088 Neg) (Storage (Reg (General ThirtyTwo rbx))), 2)"
    "fetch 0x1c799 \<equiv> (Binary (IS_8088 Mov) (Reg (General ThirtyTwo rax)) (Storage (Reg (General ThirtyTwo rbx))), 2)"
    "fetch 0x1c79b \<equiv> (Unary (IS_8088 Pop) (Storage (Reg (General SixtyFour rbx))), 1)"
    "fetch 0x1c79c \<equiv> (Nullary (IS_8088 Ret), 1)"
    "fetch 0x1c79d \<equiv> (Unary (IS_8088 Nop) (Storage (Memory ThirtyTwo (A_SizeDirective 32 (A_FromReg (General SixtyFour rax))))), 3)"
    "fetch 0x1c7a0 \<equiv> (Binary (IS_8088 Mov) (Reg (General ThirtyTwo rbx)) (Immediate SixtyFour (ImmVal 4294967201)), 5)"
    "fetch 0x1c7a5 \<equiv> (Unary (IS_8088 Jmp) (Immediate SixtyFour (ImmVal 116615)), 2)"
    and \<alpha>_def: \<open>\<alpha> = \<lparr>text_sections = [], data_sections = [], labels_to_offsets = [], binary_offset = 0\<rparr>\<close>
    and assert_fail\<^sub>a\<^sub>d\<^sub>d\<^sub>r[simp]: \<open>the (label_to_address \<alpha> ''__assert_fail'') = assert_fail_addr\<close>
    and errno_location\<^sub>a\<^sub>d\<^sub>d\<^sub>r[simp]: \<open>the (label_to_address \<alpha> ''__errno_location'') = errno_location_addr\<close>
    and stack_chk_fail\<^sub>a\<^sub>d\<^sub>d\<^sub>r[simp]: \<open>the (label_to_address \<alpha> ''__stack_chk_fail'') = stack_chk_fail_addr\<close>
    and die2\<^sub>a\<^sub>d\<^sub>d\<^sub>r[simp]: \<open>the (label_to_address \<alpha> ''die2'') = die2_addr\<close>
    and fcntl64\<^sub>a\<^sub>d\<^sub>d\<^sub>r[simp]: \<open>the (label_to_address \<alpha> ''fcntl64'') = fcntl64_addr\<close>
    and fd_open\<^sub>a\<^sub>d\<^sub>d\<^sub>r[simp]: \<open>the (label_to_address \<alpha> ''fd_open'') = fd_open_addr\<close>
    and fsync\<^sub>a\<^sub>d\<^sub>d\<^sub>r[simp]: \<open>the (label_to_address \<alpha> ''fsync'') = fsync_addr\<close>
    and ftruncate64\<^sub>a\<^sub>d\<^sub>d\<^sub>r[simp]: \<open>the (label_to_address \<alpha> ''ftruncate64'') = ftruncate64_addr\<close>
    and fwrite\<^sub>a\<^sub>d\<^sub>d\<^sub>r[simp]: \<open>the (label_to_address \<alpha> ''fwrite'') = fwrite_addr\<close>
    and lseek64\<^sub>a\<^sub>d\<^sub>d\<^sub>r[simp]: \<open>the (label_to_address \<alpha> ''lseek64'') = lseek64_addr\<close>
    and pipe\<^sub>a\<^sub>d\<^sub>d\<^sub>r[simp]: \<open>the (label_to_address \<alpha> ''pipe'') = pipe_addr\<close>
    and qemu_aio_get\<^sub>a\<^sub>d\<^sub>d\<^sub>r[simp]: \<open>the (label_to_address \<alpha> ''qemu_aio_get'') = qemu_aio_get_addr\<close>
    and qemu_aio_set_fd_handler\<^sub>a\<^sub>d\<^sub>d\<^sub>r[simp]: \<open>the (label_to_address \<alpha> ''qemu_aio_set_fd_handler'') = qemu_aio_set_fd_handler_addr\<close>
    and qemu_bh_new\<^sub>a\<^sub>d\<^sub>d\<^sub>r[simp]: \<open>the (label_to_address \<alpha> ''qemu_bh_new'') = qemu_bh_new_addr\<close>
    and qemu_bh_schedule\<^sub>a\<^sub>d\<^sub>d\<^sub>r[simp]: \<open>the (label_to_address \<alpha> ''qemu_bh_schedule'') = qemu_bh_schedule_addr\<close>
    and qemu_free\<^sub>a\<^sub>d\<^sub>d\<^sub>r[simp]: \<open>the (label_to_address \<alpha> ''qemu_free'') = qemu_free_addr\<close>
    and qemu_malloc\<^sub>a\<^sub>d\<^sub>d\<^sub>r[simp]: \<open>the (label_to_address \<alpha> ''qemu_malloc'') = qemu_malloc_addr\<close>
    and qemu_paio_cancel\<^sub>a\<^sub>d\<^sub>d\<^sub>r[simp]: \<open>the (label_to_address \<alpha> ''qemu_paio_cancel'') = qemu_paio_cancel_addr\<close>
    and qemu_paio_error\<^sub>a\<^sub>d\<^sub>d\<^sub>r[simp]: \<open>the (label_to_address \<alpha> ''qemu_paio_error'') = qemu_paio_error_addr\<close>
    and qemu_paio_init\<^sub>a\<^sub>d\<^sub>d\<^sub>r[simp]: \<open>the (label_to_address \<alpha> ''qemu_paio_init'') = qemu_paio_init_addr\<close>
    and qemu_paio_read\<^sub>a\<^sub>d\<^sub>d\<^sub>r[simp]: \<open>the (label_to_address \<alpha> ''qemu_paio_read'') = qemu_paio_read_addr\<close>
    and qemu_paio_write\<^sub>a\<^sub>d\<^sub>d\<^sub>r[simp]: \<open>the (label_to_address \<alpha> ''qemu_paio_write'') = qemu_paio_write_addr\<close>
    and qemu_write\<^sub>a\<^sub>d\<^sub>d\<^sub>r[simp]: \<open>the (label_to_address \<alpha> ''qemu_write'') = qemu_write_addr\<close>
    and raw_aio_remove\<^sub>a\<^sub>d\<^sub>d\<^sub>r[simp]: \<open>the (label_to_address \<alpha> ''raw_aio_remove'') = 0x1c020\<close>
    and raw_aio_setup\<^sub>a\<^sub>d\<^sub>d\<^sub>r[simp]: \<open>the (label_to_address \<alpha> ''raw_aio_setup'') = 0x1b8c0\<close>
    and raw_pread\<^sub>a\<^sub>d\<^sub>d\<^sub>r[simp]: \<open>the (label_to_address \<alpha> ''raw_pread'') = raw_pread_addr\<close>
    and raw_pwrite\<^sub>a\<^sub>d\<^sub>d\<^sub>r[simp]: \<open>the (label_to_address \<alpha> ''raw_pwrite'') = raw_pwrite_addr\<close>
    and sigaction\<^sub>a\<^sub>d\<^sub>d\<^sub>r[simp]: \<open>the (label_to_address \<alpha> ''sigaction'') = sigaction_addr\<close>
    and sigaddset\<^sub>a\<^sub>d\<^sub>d\<^sub>r[simp]: \<open>the (label_to_address \<alpha> ''sigaddset'') = sigaddset_addr\<close>
    and sigemptyset\<^sub>a\<^sub>d\<^sub>d\<^sub>r[simp]: \<open>the (label_to_address \<alpha> ''sigemptyset'') = sigemptyset_addr\<close>
    and sigfillset\<^sub>a\<^sub>d\<^sub>d\<^sub>r[simp]: \<open>the (label_to_address \<alpha> ''sigfillset'') = sigfillset_addr\<close>
    and sigprocmask\<^sub>a\<^sub>d\<^sub>d\<^sub>r[simp]: \<open>the (label_to_address \<alpha> ''sigprocmask'') = sigprocmask_addr\<close>
begin

text \<open>Using definitions that don't get unfolded immediately prevents locale argument issues.\<close>
definition \<open>errno_location_0x1ae14_retval \<equiv> errno_location_0x1ae14_retval\<^sub>v\<close>
definition \<open>die2_0x1ae1e_retval \<equiv> die2_0x1ae1e_retval\<^sub>v\<close>
definition \<open>fsync_0x1ae3f_retval \<equiv> fsync_0x1ae3f_retval\<^sub>v\<close>
definition \<open>assert_fail_0x1ae70_retval \<equiv> assert_fail_0x1ae70_retval\<^sub>v\<close>
definition \<open>assert_fail_0x1ae8f_retval \<equiv> assert_fail_0x1ae8f_retval\<^sub>v\<close>
definition \<open>fd_open_0x1b8e6_retval \<equiv> fd_open_0x1b8e6_retval\<^sub>v\<close>
definition \<open>qemu_aio_get_0x1b8fd_retval \<equiv> qemu_aio_get_0x1b8fd_retval\<^sub>v\<close>
definition \<open>fd_open_0x1bca6_retval \<equiv> fd_open_0x1bca6_retval\<^sub>v\<close>
definition \<open>lseek64_0x1bcbc_retval \<equiv> lseek64_0x1bcbc_retval\<^sub>v\<close>
definition \<open>qemu_write_0x1bcd7_retval \<equiv> qemu_write_0x1bcd7_retval\<^sub>v\<close>
definition \<open>errno_location_0x1bcf0_retval \<equiv> errno_location_0x1bcf0_retval\<^sub>v\<close>
definition \<open>fwrite_0x1c069_retval \<equiv> fwrite_0x1c069_retval\<^sub>v\<close>
definition \<open>qemu_paio_cancel_0x1c0f3_retval \<equiv> qemu_paio_cancel_0x1c0f3_retval\<^sub>v\<close>
definition \<open>qemu_paio_error_0x1c113_retval \<equiv> qemu_paio_error_0x1c113_retval\<^sub>v\<close>
definition \<open>qemu_paio_error_0x1c120_retval \<equiv> qemu_paio_error_0x1c120_retval\<^sub>v\<close>
definition \<open>raw_aio_setup_0x1c157_retval \<equiv> raw_aio_setup_0x1c157_retval\<^sub>v\<close>
definition \<open>qemu_paio_write_0x1c168_retval \<equiv> qemu_paio_write_0x1c168_retval\<^sub>v\<close>
definition \<open>qemu_aio_get_0x1c1a2_retval \<equiv> qemu_aio_get_0x1c1a2_retval\<^sub>v\<close>
definition \<open>raw_pwrite_0x1c1be_retval \<equiv> raw_pwrite_0x1c1be_retval\<^sub>v\<close>
definition \<open>qemu_bh_new_0x1c1d3_retval \<equiv> qemu_bh_new_0x1c1d3_retval\<^sub>v\<close>
definition \<open>qemu_bh_schedule_0x1c1db_retval \<equiv> qemu_bh_schedule_0x1c1db_retval\<^sub>v\<close>
definition \<open>raw_aio_remove_0x1c1ed_retval \<equiv> raw_aio_remove_0x1c1ed_retval\<^sub>v\<close>
definition \<open>raw_aio_setup_0x1c227_retval \<equiv> raw_aio_setup_0x1c227_retval\<^sub>v\<close>
definition \<open>qemu_paio_read_0x1c238_retval \<equiv> qemu_paio_read_0x1c238_retval\<^sub>v\<close>
definition \<open>qemu_aio_get_0x1c272_retval \<equiv> qemu_aio_get_0x1c272_retval\<^sub>v\<close>
definition \<open>raw_pread_0x1c28e_retval \<equiv> raw_pread_0x1c28e_retval\<^sub>v\<close>
definition \<open>qemu_bh_new_0x1c2a3_retval \<equiv> qemu_bh_new_0x1c2a3_retval\<^sub>v\<close>
definition \<open>qemu_bh_schedule_0x1c2ab_retval \<equiv> qemu_bh_schedule_0x1c2ab_retval\<^sub>v\<close>
definition \<open>raw_aio_remove_0x1c2bd_retval \<equiv> raw_aio_remove_0x1c2bd_retval\<^sub>v\<close>
definition \<open>fsync_0x1c2da_retval \<equiv> fsync_0x1c2da_retval\<^sub>v\<close>
definition \<open>errno_location_0x1c2e3_retval \<equiv> errno_location_0x1c2e3_retval\<^sub>v\<close>
definition \<open>qemu_malloc_0x1c376_retval \<equiv> qemu_malloc_0x1c376_retval\<^sub>v\<close>
definition \<open>sigemptyset_0x1c381_retval \<equiv> sigemptyset_0x1c381_retval\<^sub>v\<close>
definition \<open>sigaddset_0x1c38e_retval \<equiv> sigaddset_0x1c38e_retval\<^sub>v\<close>
definition \<open>sigprocmask_0x1c39d_retval \<equiv> sigprocmask_0x1c39d_retval\<^sub>v\<close>
definition \<open>sigfillset_0x1c3b2_retval \<equiv> sigfillset_0x1c3b2_retval\<^sub>v\<close>
definition \<open>sigaction_0x1c3db_retval \<equiv> sigaction_0x1c3db_retval\<^sub>v\<close>
definition \<open>pipe_0x1c3ed_retval \<equiv> pipe_0x1c3ed_retval\<^sub>v\<close>
definition \<open>fcntl64_0x1c414_retval \<equiv> fcntl64_0x1c414_retval\<^sub>v\<close>
definition \<open>fcntl64_0x1c428_retval \<equiv> fcntl64_0x1c428_retval\<^sub>v\<close>
definition \<open>qemu_aio_set_fd_handler_0x1c442_retval \<equiv> qemu_aio_set_fd_handler_0x1c442_retval\<^sub>v\<close>
definition \<open>qemu_paio_init_0x1c463_retval \<equiv> qemu_paio_init_0x1c463_retval\<^sub>v\<close>
definition \<open>fwrite_0x1c4a8_retval \<equiv> fwrite_0x1c4a8_retval\<^sub>v\<close>
definition \<open>qemu_free_0x1c4b0_retval \<equiv> qemu_free_0x1c4b0_retval\<^sub>v\<close>
definition \<open>errno_location_0x1c4b5_retval \<equiv> errno_location_0x1c4b5_retval\<^sub>v\<close>
definition \<open>stack_chk_fail_0x1c4c0_retval \<equiv> stack_chk_fail_0x1c4c0_retval\<^sub>v\<close>
definition \<open>ftruncate64_0x1c77e_retval \<equiv> ftruncate64_0x1c77e_retval\<^sub>v\<close>
definition \<open>errno_location_0x1c790_retval \<equiv> errno_location_0x1c790_retval\<^sub>v\<close>

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

locale "raw_aio_setup" = "qemu_img_xen" +
  fixes RAX\<^sub>0\<^sub>v RBX\<^sub>0\<^sub>v RCX\<^sub>0\<^sub>v RDX\<^sub>0\<^sub>v RDI\<^sub>0\<^sub>v RSI\<^sub>0\<^sub>v RSP\<^sub>0\<^sub>v RBP\<^sub>0\<^sub>v R15\<^sub>0\<^sub>v R14\<^sub>0\<^sub>v R13\<^sub>0\<^sub>v R12\<^sub>0\<^sub>v R9\<^sub>0\<^sub>v R8\<^sub>0\<^sub>v ret_address\<^sub>v :: \<open>64 word\<close>
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
definition \<open>ret_address \<equiv> ret_address\<^sub>v\<close>

definition P_0x1b8c0_0 :: state_pred where
  \<open>P_0x1b8c0_0 \<sigma> \<equiv> RIP \<sigma> = 0x1b8c0 \<and> RAX \<sigma> = RAX\<^sub>0 \<and> RBX \<sigma> = RBX\<^sub>0 \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = RDX\<^sub>0 \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = RSP\<^sub>0 \<and> RBP \<sigma> = RBP\<^sub>0 \<and> R15 \<sigma> = R15\<^sub>0 \<and> R14 \<sigma> = R14\<^sub>0 \<and> R13 \<sigma> = R13\<^sub>0 \<and> R12 \<sigma> = R12\<^sub>0 \<and> R9 \<sigma> = R9\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address\<close>
declare P_0x1b8c0_0_def[Ps]

definition P_0x1b8c0_0_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x1b8c0_0_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((RDI\<^sub>0::64 word) + 0x40), 8),
    (2, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x40), 8)
  }\<close>

definition P_0x1b8c0_0_regions :: state_pred where
  \<open>P_0x1b8c0_0_regions \<sigma> \<equiv> \<exists>regions. P_0x1b8c0_0_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x1b8e6_0 :: state_pred where
  \<open>Q_0x1b8e6_0 \<sigma> \<equiv> RIP \<sigma> = 0x1b8e6 \<and> RAX \<sigma> = RAX\<^sub>0 \<and> RBX \<sigma> = RDI\<^sub>0 \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = RDX\<^sub>0 \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x48) \<and> RBP \<sigma> = RSI\<^sub>0 \<and> R15 \<sigma> = R8\<^sub>0 \<and> R14 \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> R13 \<sigma> = RDX\<^sub>0 \<and> R12 \<sigma> = ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)) \<and> R9 \<sigma> = R9\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = R9\<^sub>0\<close>
declare Q_0x1b8e6_0_def[Qs]

schematic_goal raw_aio_setup_0_14_0x1b8c0_0x1b8e1_0[blocks]:
  assumes \<open>(P_0x1b8c0_0 && P_0x1b8c0_0_regions) \<sigma>\<close>
  shows \<open>exec_block 14 0x1b8e1 0 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x1b8e6_0 ?\<sigma> \<and> block_usage P_0x1b8c0_0_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x1b8c0_0_def P_0x1b8c0_0_regions_def post: Q_0x1b8e6_0_def regionset: P_0x1b8c0_0_regions_set_def)

definition P_0x1b8e6_1 :: state_pred where
  \<open>P_0x1b8e6_1 \<sigma> \<equiv> RIP \<sigma> = 0x1b8e6 \<and> RAX \<sigma> = RAX\<^sub>0 \<and> RBX \<sigma> = RDI\<^sub>0 \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = RDX\<^sub>0 \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x48) \<and> RBP \<sigma> = RSI\<^sub>0 \<and> R15 \<sigma> = R8\<^sub>0 \<and> R14 \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> R13 \<sigma> = RDX\<^sub>0 \<and> R12 \<sigma> = ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)) \<and> R9 \<sigma> = R9\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = R9\<^sub>0\<close>
declare P_0x1b8e6_1_def[Ps]

definition P_0x1b8e6_1_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x1b8e6_1_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((RDI\<^sub>0::64 word) + 0x40), 8),
    (2, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x40), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x50), 8)
  }\<close>

definition P_0x1b8e6_1_regions :: state_pred where
  \<open>P_0x1b8e6_1_regions \<sigma> \<equiv> \<exists>regions. P_0x1b8e6_1_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_fd_open_addr_0x1b8e6_1 :: state_pred where
  \<open>Q_fd_open_addr_0x1b8e6_1 \<sigma> \<equiv> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x50) \<and> RIP \<sigma> = fd_open_addr \<and> RAX \<sigma> = RAX\<^sub>0 \<and> RBX \<sigma> = RDI\<^sub>0 \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = RDX\<^sub>0 \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RBP \<sigma> = RSI\<^sub>0 \<and> R15 \<sigma> = R8\<^sub>0 \<and> R14 \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> R13 \<sigma> = RDX\<^sub>0 \<and> R12 \<sigma> = ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)) \<and> R9 \<sigma> = R9\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = R9\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),8]::64 word) = 0x1b8eb\<close>
declare Q_fd_open_addr_0x1b8e6_1_def[Qs]

schematic_goal raw_aio_setup_0_1_0x1b8e6_0x1b8e6_1[blocks]:
  assumes \<open>(P_0x1b8e6_1 && P_0x1b8e6_1_regions) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x1b8e6 (Suc 0) \<sigma> \<triangleq> ?\<sigma> \<and> Q_fd_open_addr_0x1b8e6_1 ?\<sigma> \<and> block_usage P_0x1b8e6_1_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x1b8e6_1_def P_0x1b8e6_1_regions_def post: Q_fd_open_addr_0x1b8e6_1_def regionset: P_0x1b8e6_1_regions_set_def)

definition P_0x1b8eb_2 :: state_pred where
  \<open>P_0x1b8eb_2 \<sigma> \<equiv> RIP \<sigma> = 0x1b8eb \<and> RAX \<sigma> = fd_open_0x1b8e6_retval \<and> RBX \<sigma> = RDI\<^sub>0 \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = RDX\<^sub>0 \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x48) \<and> RBP \<sigma> = RSI\<^sub>0 \<and> R15 \<sigma> = R8\<^sub>0 \<and> R14 \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> R13 \<sigma> = RDX\<^sub>0 \<and> R12 \<sigma> = ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)) \<and> R9 \<sigma> = R9\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = R9\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),8]::64 word) = 0x1b8eb\<close>
declare P_0x1b8eb_2_def[Ps]

definition P_0x1b8eb_2_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x1b8eb_2_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((RDI\<^sub>0::64 word) + 0x40), 8),
    (2, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x40), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x50), 8)
  }\<close>

definition P_0x1b8eb_2_regions :: state_pred where
  \<open>P_0x1b8eb_2_regions \<sigma> \<equiv> \<exists>regions. P_0x1b8eb_2_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x1b8f2_2 :: state_pred where
  \<open>Q_0x1b8f2_2 \<sigma> \<equiv> RIP \<sigma> = 0x1b8f2 \<and> RAX \<sigma> = fd_open_0x1b8e6_retval \<and> RBX \<sigma> = RDI\<^sub>0 \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = RDX\<^sub>0 \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x48) \<and> RBP \<sigma> = RSI\<^sub>0 \<and> R15 \<sigma> = R8\<^sub>0 \<and> R14 \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> R13 \<sigma> = RDX\<^sub>0 \<and> R12 \<sigma> = ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)) \<and> R9 \<sigma> = R9\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = R9\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),8]::64 word) = 0x1b8eb\<close>
declare Q_0x1b8f2_2_def[Qs]

schematic_goal raw_aio_setup_0_2_0x1b8eb_0x1b8f0_2[blocks]:
  assumes \<open>(P_0x1b8eb_2 && P_0x1b8eb_2_regions) \<sigma>\<close>
  shows \<open>exec_block 2 0x1b8f0 2 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x1b8f2_2 ?\<sigma> \<and> block_usage P_0x1b8eb_2_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x1b8eb_2_def P_0x1b8eb_2_regions_def post: Q_0x1b8f2_2_def regionset: P_0x1b8eb_2_regions_set_def)

definition P_0x1b8f2_true_3 :: state_pred where
  \<open>P_0x1b8f2_true_3 \<sigma> \<equiv> RIP \<sigma> = 0x1b8f2 \<and> RAX \<sigma> = fd_open_0x1b8e6_retval \<and> RBX \<sigma> = RDI\<^sub>0 \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = RDX\<^sub>0 \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x48) \<and> RBP \<sigma> = RSI\<^sub>0 \<and> R15 \<sigma> = R8\<^sub>0 \<and> R14 \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> R13 \<sigma> = RDX\<^sub>0 \<and> R12 \<sigma> = ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)) \<and> R9 \<sigma> = R9\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = R9\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),8]::64 word) = 0x1b8eb\<close>
declare P_0x1b8f2_true_3_def[Ps]

definition P_0x1b8f2_true_3_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x1b8f2_true_3_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((RDI\<^sub>0::64 word) + 0x40), 8),
    (2, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x40), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x50), 8)
  }\<close>

definition P_0x1b8f2_true_3_regions :: state_pred where
  \<open>P_0x1b8f2_true_3_regions \<sigma> \<equiv> \<exists>regions. P_0x1b8f2_true_3_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_ret_address_3 :: state_pred where
  \<open>Q_ret_address_3 \<sigma> \<equiv> RIP \<sigma> = ret_address \<and> RBX \<sigma> = RBX\<^sub>0 \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) + 0x8) \<and> RBP \<sigma> = RBP\<^sub>0 \<and> R15 \<sigma> = R15\<^sub>0 \<and> R14 \<sigma> = R14\<^sub>0 \<and> R13 \<sigma> = R13\<^sub>0 \<and> R12 \<sigma> = R12\<^sub>0 \<and> R9 \<sigma> = R9\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = R9\<^sub>0\<close>
declare Q_ret_address_3_def[Qs]

schematic_goal raw_aio_setup_0_10_0x1b8f2_0x1b970_3[blocks]:
  assumes \<open>(P_0x1b8f2_true_3 && P_0x1b8f2_true_3_regions && SF) \<sigma>\<close>
  shows \<open>exec_block 10 0x1b970 3 \<sigma> \<triangleq> ?\<sigma> \<and> Q_ret_address_3 ?\<sigma> \<and> block_usage P_0x1b8f2_true_3_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x1b8f2_true_3_def P_0x1b8f2_true_3_regions_def post: Q_ret_address_3_def regionset: P_0x1b8f2_true_3_regions_set_def)

definition P_0x1b8f2_false_4 :: state_pred where
  \<open>P_0x1b8f2_false_4 \<sigma> \<equiv> RIP \<sigma> = 0x1b8f2 \<and> RAX \<sigma> = fd_open_0x1b8e6_retval \<and> RBX \<sigma> = RDI\<^sub>0 \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = RDX\<^sub>0 \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x48) \<and> RBP \<sigma> = RSI\<^sub>0 \<and> R15 \<sigma> = R8\<^sub>0 \<and> R14 \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> R13 \<sigma> = RDX\<^sub>0 \<and> R12 \<sigma> = ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)) \<and> R9 \<sigma> = R9\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = R9\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),8]::64 word) = 0x1b8eb\<close>
declare P_0x1b8f2_false_4_def[Ps]

definition P_0x1b8f2_false_4_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x1b8f2_false_4_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((RDI\<^sub>0::64 word) + 0x40), 8),
    (2, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x40), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x50), 8)
  }\<close>

definition P_0x1b8f2_false_4_regions :: state_pred where
  \<open>P_0x1b8f2_false_4_regions \<sigma> \<equiv> \<exists>regions. P_0x1b8f2_false_4_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x1b8fd_4 :: state_pred where
  \<open>Q_0x1b8fd_4 \<sigma> \<equiv> RIP \<sigma> = 0x1b8fd \<and> RAX \<sigma> = fd_open_0x1b8e6_retval \<and> RBX \<sigma> = RDI\<^sub>0 \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = R9\<^sub>0 \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = R8\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x48) \<and> RBP \<sigma> = RSI\<^sub>0 \<and> R15 \<sigma> = R8\<^sub>0 \<and> R14 \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> R13 \<sigma> = RDX\<^sub>0 \<and> R12 \<sigma> = ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)) \<and> R9 \<sigma> = R9\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = R9\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),8]::64 word) = 0x1b8eb\<close>
declare Q_0x1b8fd_4_def[Qs]

schematic_goal raw_aio_setup_0_4_0x1b8f2_0x1b8fa_4[blocks]:
  assumes \<open>(P_0x1b8f2_false_4 && P_0x1b8f2_false_4_regions && ! SF) \<sigma>\<close>
  shows \<open>exec_block 4 0x1b8fa 4 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x1b8fd_4 ?\<sigma> \<and> block_usage P_0x1b8f2_false_4_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x1b8f2_false_4_def P_0x1b8f2_false_4_regions_def post: Q_0x1b8fd_4_def regionset: P_0x1b8f2_false_4_regions_set_def)

definition P_0x1b8fd_5 :: state_pred where
  \<open>P_0x1b8fd_5 \<sigma> \<equiv> RIP \<sigma> = 0x1b8fd \<and> RAX \<sigma> = fd_open_0x1b8e6_retval \<and> RBX \<sigma> = RDI\<^sub>0 \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = R9\<^sub>0 \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = R8\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x48) \<and> RBP \<sigma> = RSI\<^sub>0 \<and> R15 \<sigma> = R8\<^sub>0 \<and> R14 \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> R13 \<sigma> = RDX\<^sub>0 \<and> R12 \<sigma> = ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)) \<and> R9 \<sigma> = R9\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = R9\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),8]::64 word) = 0x1b8eb\<close>
declare P_0x1b8fd_5_def[Ps]

definition P_0x1b8fd_5_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x1b8fd_5_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((RDI\<^sub>0::64 word) + 0x40), 8),
    (2, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x40), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x50), 8)
  }\<close>

definition P_0x1b8fd_5_regions :: state_pred where
  \<open>P_0x1b8fd_5_regions \<sigma> \<equiv> \<exists>regions. P_0x1b8fd_5_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_qemu_aio_get_addr_0x1b8fd_5 :: state_pred where
  \<open>Q_qemu_aio_get_addr_0x1b8fd_5 \<sigma> \<equiv> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x50) \<and> RIP \<sigma> = qemu_aio_get_addr \<and> RAX \<sigma> = fd_open_0x1b8e6_retval \<and> RBX \<sigma> = RDI\<^sub>0 \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = R9\<^sub>0 \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = R8\<^sub>0 \<and> RBP \<sigma> = RSI\<^sub>0 \<and> R15 \<sigma> = R8\<^sub>0 \<and> R14 \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> R13 \<sigma> = RDX\<^sub>0 \<and> R12 \<sigma> = ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)) \<and> R9 \<sigma> = R9\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = R9\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),8]::64 word) = 0x1b902\<close>
declare Q_qemu_aio_get_addr_0x1b8fd_5_def[Qs]

schematic_goal raw_aio_setup_0_1_0x1b8fd_0x1b8fd_5[blocks]:
  assumes \<open>(P_0x1b8fd_5 && P_0x1b8fd_5_regions) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x1b8fd 5 \<sigma> \<triangleq> ?\<sigma> \<and> Q_qemu_aio_get_addr_0x1b8fd_5 ?\<sigma> \<and> block_usage P_0x1b8fd_5_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x1b8fd_5_def P_0x1b8fd_5_regions_def post: Q_qemu_aio_get_addr_0x1b8fd_5_def regionset: P_0x1b8fd_5_regions_set_def)

definition P_0x1b902_6 :: state_pred where
  \<open>P_0x1b902_6 \<sigma> \<equiv> RIP \<sigma> = 0x1b902 \<and> RAX \<sigma> = qemu_aio_get_0x1b8fd_retval \<and> RBX \<sigma> = RDI\<^sub>0 \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = R9\<^sub>0 \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = R8\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x48) \<and> RBP \<sigma> = RSI\<^sub>0 \<and> R15 \<sigma> = R8\<^sub>0 \<and> R14 \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> R13 \<sigma> = RDX\<^sub>0 \<and> R12 \<sigma> = ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)) \<and> R9 \<sigma> = R9\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = R9\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),8]::64 word) = 0x1b902\<close>
declare P_0x1b902_6_def[Ps]

definition P_0x1b902_6_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x1b902_6_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((RDI\<^sub>0::64 word) + 0x40), 8),
    (2, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x40), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x50), 8)
  }\<close>

definition P_0x1b902_6_regions :: state_pred where
  \<open>P_0x1b902_6_regions \<sigma> \<equiv> \<exists>regions. P_0x1b902_6_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x1b905_6 :: state_pred where
  \<open>Q_0x1b905_6 \<sigma> \<equiv> RIP \<sigma> = 0x1b905 \<and> RAX \<sigma> = qemu_aio_get_0x1b8fd_retval \<and> RBX \<sigma> = RDI\<^sub>0 \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = R9\<^sub>0 \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = R8\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x48) \<and> RBP \<sigma> = RSI\<^sub>0 \<and> R15 \<sigma> = R8\<^sub>0 \<and> R14 \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> R13 \<sigma> = RDX\<^sub>0 \<and> R12 \<sigma> = ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)) \<and> R9 \<sigma> = R9\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = R9\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),8]::64 word) = 0x1b902\<close>
declare Q_0x1b905_6_def[Qs]

schematic_goal raw_aio_setup_0_1_0x1b902_0x1b902_6[blocks]:
  assumes \<open>(P_0x1b902_6 && P_0x1b902_6_regions) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x1b902 6 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x1b905_6 ?\<sigma> \<and> block_usage P_0x1b902_6_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x1b902_6_def P_0x1b902_6_regions_def post: Q_0x1b905_6_def regionset: P_0x1b902_6_regions_set_def)

definition P_0x1b905_true_7 :: state_pred where
  \<open>P_0x1b905_true_7 \<sigma> \<equiv> RIP \<sigma> = 0x1b905 \<and> RAX \<sigma> = qemu_aio_get_0x1b8fd_retval \<and> RBX \<sigma> = RDI\<^sub>0 \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = R9\<^sub>0 \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = R8\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x48) \<and> RBP \<sigma> = RSI\<^sub>0 \<and> R15 \<sigma> = R8\<^sub>0 \<and> R14 \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> R13 \<sigma> = RDX\<^sub>0 \<and> R12 \<sigma> = ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)) \<and> R9 \<sigma> = R9\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = R9\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),8]::64 word) = 0x1b902\<close>
declare P_0x1b905_true_7_def[Ps]

definition P_0x1b905_true_7_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x1b905_true_7_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((RDI\<^sub>0::64 word) + 0x40), 8),
    (2, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x40), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x50), 8)
  }\<close>

definition P_0x1b905_true_7_regions :: state_pred where
  \<open>P_0x1b905_true_7_regions \<sigma> \<equiv> \<exists>regions. P_0x1b905_true_7_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_ret_address_7 :: state_pred where
  \<open>Q_ret_address_7 \<sigma> \<equiv> RIP \<sigma> = ret_address \<and> RBX \<sigma> = RBX\<^sub>0 \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) + 0x8) \<and> RBP \<sigma> = RBP\<^sub>0 \<and> R15 \<sigma> = R15\<^sub>0 \<and> R14 \<sigma> = R14\<^sub>0 \<and> R13 \<sigma> = R13\<^sub>0 \<and> R12 \<sigma> = R12\<^sub>0 \<and> R9 \<sigma> = R9\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = R9\<^sub>0\<close>
declare Q_ret_address_7_def[Qs]

schematic_goal raw_aio_setup_0_10_0x1b905_0x1b970_7[blocks]:
  assumes \<open>(P_0x1b905_true_7 && P_0x1b905_true_7_regions && ZF) \<sigma>\<close>
  shows \<open>exec_block 10 0x1b970 7 \<sigma> \<triangleq> ?\<sigma> \<and> Q_ret_address_7 ?\<sigma> \<and> block_usage P_0x1b905_true_7_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x1b905_true_7_def P_0x1b905_true_7_regions_def post: Q_ret_address_7_def regionset: P_0x1b905_true_7_regions_set_def)

definition P_0x1b905_false_8 :: state_pred where
  \<open>P_0x1b905_false_8 \<sigma> \<equiv> RIP \<sigma> = 0x1b905 \<and> RAX \<sigma> = qemu_aio_get_0x1b8fd_retval \<and> RBX \<sigma> = RDI\<^sub>0 \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = R9\<^sub>0 \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = R8\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x48) \<and> RBP \<sigma> = RSI\<^sub>0 \<and> R15 \<sigma> = R8\<^sub>0 \<and> R14 \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> R13 \<sigma> = RDX\<^sub>0 \<and> R12 \<sigma> = ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)) \<and> R9 \<sigma> = R9\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = R9\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),8]::64 word) = 0x1b902\<close>
declare P_0x1b905_false_8_def[Ps]

definition P_0x1b905_false_8_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x1b905_false_8_regions_set \<sigma> \<equiv> {
    (0, 0x2a488, 8),
    (1, RSP\<^sub>0, 8),
    (2, ((RDI\<^sub>0::64 word) + 0x40), 8),
    (3, ((qemu_aio_get_0x1b8fd_retval::64 word) + 0x28), 4),
    (4, ((qemu_aio_get_0x1b8fd_retval::64 word) + 0x30), 8),
    (5, ((qemu_aio_get_0x1b8fd_retval::64 word) + 0x38), 8),
    (6, ((qemu_aio_get_0x1b8fd_retval::64 word) + 0x40), 4),
    (7, ((qemu_aio_get_0x1b8fd_retval::64 word) + 0x48), 8),
    (8, ((qemu_aio_get_0x1b8fd_retval::64 word) + 0x78), 8),
    (9, (((\<sigma> \<turnstile> *[0x2a488,8]::64 word)::64 word) + 0x8), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (11, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (12, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (13, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (14, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (15, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (16, ((RSP\<^sub>0::64 word) - 0x40), 8),
    (17, ((RSP\<^sub>0::64 word) - 0x50), 8),
    (18, (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word), 4)
  }\<close>

definition P_0x1b905_false_8_regions :: state_pred where
  \<open>P_0x1b905_false_8_regions \<sigma> \<equiv> \<exists>regions. P_0x1b905_false_8_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_ret_address_8 :: state_pred where
  \<open>Q_ret_address_8 \<sigma> \<equiv> RIP \<sigma> = ret_address \<and> RBX \<sigma> = RBX\<^sub>0 \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) + 0x8) \<and> RBP \<sigma> = RBP\<^sub>0 \<and> R15 \<sigma> = R15\<^sub>0 \<and> R14 \<sigma> = R14\<^sub>0 \<and> R13 \<sigma> = R13\<^sub>0 \<and> R12 \<sigma> = R12\<^sub>0 \<and> R9 \<sigma> = R9\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = R9\<^sub>0\<close>
declare Q_ret_address_8_def[Qs]

schematic_goal raw_aio_setup_0_28_0x1b905_0x1b95d_8[blocks]:
  assumes \<open>(P_0x1b905_false_8 && P_0x1b905_false_8_regions && ! ZF) \<sigma>\<close>
  shows \<open>exec_block 28 0x1b95d 8 \<sigma> \<triangleq> ?\<sigma> \<and> Q_ret_address_8 ?\<sigma> \<and> block_usage P_0x1b905_false_8_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x1b905_false_8_def P_0x1b905_false_8_regions_def post: Q_ret_address_8_def regionset: P_0x1b905_false_8_regions_set_def)

definition raw_aio_setup_acode :: ACode where
  \<open>raw_aio_setup_acode =
    Block 14 0x1b8e1 0;
    Block (Suc 0) 0x1b8e6 (Suc 0);
    CALL fd_open_acode;
    Block 2 0x1b8f0 2;
    IF SF THEN
      Block 10 0x1b970 3
    ELSE
      Block 4 0x1b8fa 4;
      Block (Suc 0) 0x1b8fd 5;
      CALL qemu_aio_get_acode;
      Block (Suc 0) 0x1b902 6;
      IF ZF THEN
        Block 10 0x1b970 7
      ELSE
        Block 28 0x1b95d 8
      FI
    FI
  \<close>

schematic_goal "raw_aio_setup":
  assumes
    \<open>\<forall>\<sigma>. RIP \<sigma> = 0x1b8e6 \<longrightarrow> P_0x1b8e6_1_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x1b8eb \<longrightarrow> P_0x1b8eb_2_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x1b8f2 \<longrightarrow> P_0x1b8f2_true_3_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x1b8f2 \<longrightarrow> P_0x1b8f2_false_4_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x1b8fd \<longrightarrow> P_0x1b8fd_5_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x1b902 \<longrightarrow> P_0x1b902_6_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x1b905 \<longrightarrow> P_0x1b905_true_7_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x1b905 \<longrightarrow> P_0x1b905_false_8_regions \<sigma>\<close>
    and [blocks]: \<open>{{Q_fd_open_addr_0x1b8e6_1}} \<box>fd_open_acode {{P_0x1b8eb_2;M_0x1b8e6}}\<close>
    and [blocks]: \<open>{{Q_qemu_aio_get_addr_0x1b8fd_5}} \<box>qemu_aio_get_acode {{P_0x1b902_6;M_0x1b8fd}}\<close>
  shows \<open>{{?P}} raw_aio_setup_acode {{?Q;?M}}\<close>
  by (vcg acode: raw_aio_setup_acode_def assms: assms)

end

locale "raw_aio_remove" = "qemu_img_xen" +
  fixes RAX\<^sub>0\<^sub>v RCX\<^sub>0\<^sub>v RDX\<^sub>0\<^sub>v RDI\<^sub>0\<^sub>v RSI\<^sub>0\<^sub>v RSP\<^sub>0\<^sub>v ret_address\<^sub>v :: \<open>64 word\<close>
begin

text \<open>Using definitions that don't get unfolded immediately prevents locale argument issues.\<close>
definition \<open>RAX\<^sub>0 \<equiv> RAX\<^sub>0\<^sub>v\<close>
definition \<open>RCX\<^sub>0 \<equiv> RCX\<^sub>0\<^sub>v\<close>
definition \<open>RDX\<^sub>0 \<equiv> RDX\<^sub>0\<^sub>v\<close>
definition \<open>RDI\<^sub>0 \<equiv> RDI\<^sub>0\<^sub>v\<close>
definition \<open>RSI\<^sub>0 \<equiv> RSI\<^sub>0\<^sub>v\<close>
definition \<open>RSP\<^sub>0 \<equiv> RSP\<^sub>0\<^sub>v\<close>
definition \<open>ret_address \<equiv> ret_address\<^sub>v\<close>

definition P_0x1c020_0 :: state_pred where
  \<open>P_0x1c020_0 \<sigma> \<equiv> RIP \<sigma> = 0x1c020 \<and> RAX \<sigma> = RAX\<^sub>0 \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = RDX\<^sub>0 \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = RSP\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address\<close>
declare P_0x1c020_0_def[Ps]

definition P_0x1c020_0_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x1c020_0_regions_set \<sigma> \<equiv> {
    (0, 0x2a488, 8),
    (1, RSP\<^sub>0, 8),
    (2, (((\<sigma> \<turnstile> *[0x2a488,8]::64 word)::64 word) + 0x8), 8)
  }\<close>

definition P_0x1c020_0_regions :: state_pred where
  \<open>P_0x1c020_0_regions \<sigma> \<equiv> \<exists>regions. P_0x1c020_0_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x1c02e_0 :: state_pred where
  \<open>Q_0x1c02e_0 \<sigma> \<equiv> RIP \<sigma> = 0x1c02e \<and> RAX \<sigma> = (\<sigma> \<turnstile> *[0x2a488,8]::64 word) \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[0x2a488,8]::64 word)::64 word) + 0x8),8]::64 word) \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = RSP\<^sub>0 \<and> (\<sigma> \<turnstile> *[0x2a488,8]::64 word) = (\<sigma> \<turnstile> *[0x2a488,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[0x2a488,8]::64 word)::64 word) + 0x8),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[0x2a488,8]::64 word)::64 word) + 0x8),8]::64 word)\<close>
declare Q_0x1c02e_0_def[Qs]

schematic_goal raw_aio_remove_0_3_0x1c020_0x1c02b_0[blocks]:
  assumes \<open>(P_0x1c020_0 && P_0x1c020_0_regions) \<sigma>\<close>
  shows \<open>exec_block 3 0x1c02b 0 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x1c02e_0 ?\<sigma> \<and> block_usage P_0x1c020_0_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x1c020_0_def P_0x1c020_0_regions_def post: Q_0x1c02e_0_def regionset: P_0x1c020_0_regions_set_def)

definition P_0x1c02e_true_1 :: state_pred where
  \<open>P_0x1c02e_true_1 \<sigma> \<equiv> RIP \<sigma> = 0x1c02e \<and> RAX \<sigma> = (\<sigma> \<turnstile> *[0x2a488,8]::64 word) \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[0x2a488,8]::64 word)::64 word) + 0x8),8]::64 word) \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = RSP\<^sub>0 \<and> (\<sigma> \<turnstile> *[0x2a488,8]::64 word) = (\<sigma> \<turnstile> *[0x2a488,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[0x2a488,8]::64 word)::64 word) + 0x8),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[0x2a488,8]::64 word)::64 word) + 0x8),8]::64 word)\<close>
declare P_0x1c02e_true_1_def[Ps]

definition P_0x1c02e_true_1_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x1c02e_true_1_regions_set \<sigma> \<equiv> {
    (0, 0x2a300, 8),
    (1, 0x2a488, 8),
    (2, RSP\<^sub>0, 8),
    (3, (((\<sigma> \<turnstile> *[0x2a488,8]::64 word)::64 word) + 0x8), 8)
  }\<close>

definition P_0x1c02e_true_1_regions :: state_pred where
  \<open>P_0x1c02e_true_1_regions \<sigma> \<equiv> \<exists>regions. P_0x1c02e_true_1_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x1c069_1 :: state_pred where
  \<open>Q_0x1c069_1 \<sigma> \<equiv> RIP \<sigma> = 0x1c069 \<and> RAX \<sigma> = (\<sigma> \<turnstile> *[0x2a488,8]::64 word) \<and> RCX \<sigma> = (\<sigma> \<turnstile> *[0x2a300,8]::64 word) \<and> RDX \<sigma> = 0x27 \<and> RDI \<sigma> = 0x21c80 \<and> RSI \<sigma> = 0x1 \<and> RSP \<sigma> = RSP\<^sub>0 \<and> (\<sigma> \<turnstile> *[0x2a300,8]::64 word) = (\<sigma> \<turnstile> *[0x2a300,8]::64 word) \<and> (\<sigma> \<turnstile> *[0x2a488,8]::64 word) = (\<sigma> \<turnstile> *[0x2a488,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[0x2a488,8]::64 word)::64 word) + 0x8),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[0x2a488,8]::64 word)::64 word) + 0x8),8]::64 word)\<close>
declare Q_0x1c069_1_def[Qs]

schematic_goal raw_aio_remove_0_5_0x1c02e_0x1c062_1[blocks]:
  assumes \<open>(P_0x1c02e_true_1 && P_0x1c02e_true_1_regions && ZF) \<sigma>\<close>
  shows \<open>exec_block 5 0x1c062 (Suc 0) \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x1c069_1 ?\<sigma> \<and> block_usage P_0x1c02e_true_1_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x1c02e_true_1_def P_0x1c02e_true_1_regions_def post: Q_0x1c069_1_def regionset: P_0x1c02e_true_1_regions_set_def)

definition P_0x1c069_2 :: state_pred where
  \<open>P_0x1c069_2 \<sigma> \<equiv> RIP \<sigma> = 0x1c069 \<and> RAX \<sigma> = (\<sigma> \<turnstile> *[0x2a488,8]::64 word) \<and> RCX \<sigma> = (\<sigma> \<turnstile> *[0x2a300,8]::64 word) \<and> RDX \<sigma> = 0x27 \<and> RDI \<sigma> = 0x21c80 \<and> RSI \<sigma> = 0x1 \<and> RSP \<sigma> = RSP\<^sub>0 \<and> (\<sigma> \<turnstile> *[0x2a300,8]::64 word) = (\<sigma> \<turnstile> *[0x2a300,8]::64 word) \<and> (\<sigma> \<turnstile> *[0x2a488,8]::64 word) = (\<sigma> \<turnstile> *[0x2a488,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[0x2a488,8]::64 word)::64 word) + 0x8),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[0x2a488,8]::64 word)::64 word) + 0x8),8]::64 word)\<close>
declare P_0x1c069_2_def[Ps]

definition P_0x1c069_2_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x1c069_2_regions_set \<sigma> \<equiv> {
    (0, 0x2a300, 8),
    (1, 0x2a488, 8),
    (2, RSP\<^sub>0, 8),
    (3, (((\<sigma> \<turnstile> *[0x2a488,8]::64 word)::64 word) + 0x8), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x8), 8)
  }\<close>

definition P_0x1c069_2_regions :: state_pred where
  \<open>P_0x1c069_2_regions \<sigma> \<equiv> \<exists>regions. P_0x1c069_2_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_fwrite_addr_0x1c069_2 :: state_pred where
  \<open>Q_fwrite_addr_0x1c069_2 \<sigma> \<equiv> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x8) \<and> RIP \<sigma> = fwrite_addr \<and> RAX \<sigma> = (\<sigma> \<turnstile> *[0x2a488,8]::64 word) \<and> RCX \<sigma> = (\<sigma> \<turnstile> *[0x2a300,8]::64 word) \<and> RDX \<sigma> = 0x27 \<and> RDI \<sigma> = 0x21c80 \<and> RSI \<sigma> = 0x1 \<and> (\<sigma> \<turnstile> *[0x2a300,8]::64 word) = (\<sigma> \<turnstile> *[0x2a300,8]::64 word) \<and> (\<sigma> \<turnstile> *[0x2a488,8]::64 word) = (\<sigma> \<turnstile> *[0x2a488,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[0x2a488,8]::64 word)::64 word) + 0x8),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[0x2a488,8]::64 word)::64 word) + 0x8),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = 0x1c06a\<close>
declare Q_fwrite_addr_0x1c069_2_def[Qs]

schematic_goal raw_aio_remove_0_1_0x1c069_0x1c069_2[blocks]:
  assumes \<open>(P_0x1c069_2 && P_0x1c069_2_regions) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x1c069 2 \<sigma> \<triangleq> ?\<sigma> \<and> Q_fwrite_addr_0x1c069_2 ?\<sigma> \<and> block_usage P_0x1c069_2_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x1c069_2_def P_0x1c069_2_regions_def post: Q_fwrite_addr_0x1c069_2_def regionset: P_0x1c069_2_regions_set_def)

definition P_0x1c06a_3 :: state_pred where
  \<open>P_0x1c06a_3 \<sigma> \<equiv> RIP \<sigma> = 0x1c06a \<and> RAX \<sigma> = fwrite_0x1c069_retval \<and> RCX \<sigma> = (\<sigma> \<turnstile> *[0x2a300,8]::64 word) \<and> RDX \<sigma> = 0x27 \<and> RDI \<sigma> = 0x21c80 \<and> RSI \<sigma> = 0x1 \<and> RSP \<sigma> = RSP\<^sub>0 \<and> (\<sigma> \<turnstile> *[0x2a300,8]::64 word) = (\<sigma> \<turnstile> *[0x2a300,8]::64 word) \<and> (\<sigma> \<turnstile> *[0x2a488,8]::64 word) = (\<sigma> \<turnstile> *[0x2a488,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[0x2a488,8]::64 word)::64 word) + 0x8),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[0x2a488,8]::64 word)::64 word) + 0x8),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = 0x1c06a\<close>
declare P_0x1c06a_3_def[Ps]

definition P_0x1c06a_3_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x1c06a_3_regions_set \<sigma> \<equiv> {
    (0, 0x2a300, 8),
    (1, 0x2a488, 8),
    (2, RSP\<^sub>0, 8),
    (3, (((\<sigma> \<turnstile> *[0x2a488,8]::64 word)::64 word) + 0x8), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x8), 8)
  }\<close>

definition P_0x1c06a_3_regions :: state_pred where
  \<open>P_0x1c06a_3_regions \<sigma> \<equiv> \<exists>regions. P_0x1c06a_3_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_ret_address_3 :: state_pred where
  \<open>Q_ret_address_3 \<sigma> \<equiv> RIP \<sigma> = ret_address \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) + 0x8) \<and> (\<sigma> \<turnstile> *[0x2a488,8]::64 word) = (\<sigma> \<turnstile> *[0x2a488,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address\<close>
declare Q_ret_address_3_def[Qs]

schematic_goal raw_aio_remove_0_1_0x1c06a_0x1c06a_3[blocks]:
  assumes \<open>(P_0x1c06a_3 && P_0x1c06a_3_regions) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x1c06a 3 \<sigma> \<triangleq> ?\<sigma> \<and> Q_ret_address_3 ?\<sigma> \<and> block_usage P_0x1c06a_3_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x1c06a_3_def P_0x1c06a_3_regions_def post: Q_ret_address_3_def regionset: P_0x1c06a_3_regions_set_def)

definition P_0x1c02e_false_4 :: state_pred where
  \<open>P_0x1c02e_false_4 \<sigma> \<equiv> RIP \<sigma> = 0x1c02e \<and> RAX \<sigma> = (\<sigma> \<turnstile> *[0x2a488,8]::64 word) \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[0x2a488,8]::64 word)::64 word) + 0x8),8]::64 word) \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = RSP\<^sub>0 \<and> (\<sigma> \<turnstile> *[0x2a488,8]::64 word) = (\<sigma> \<turnstile> *[0x2a488,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[0x2a488,8]::64 word)::64 word) + 0x8),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[0x2a488,8]::64 word)::64 word) + 0x8),8]::64 word)\<close>
declare P_0x1c02e_false_4_def[Ps]

definition P_0x1c02e_false_4_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x1c02e_false_4_regions_set \<sigma> \<equiv> {
    (0, 0x2a488, 8),
    (1, RSP\<^sub>0, 8),
    (2, (((\<sigma> \<turnstile> *[0x2a488,8]::64 word)::64 word) + 0x8), 8)
  }\<close>

definition P_0x1c02e_false_4_regions :: state_pred where
  \<open>P_0x1c02e_false_4_regions \<sigma> \<equiv> \<exists>regions. P_0x1c02e_false_4_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x1c033_4 :: state_pred where
  \<open>Q_0x1c033_4 \<sigma> \<equiv> RIP \<sigma> = 0x1c033 \<and> RAX \<sigma> = (\<sigma> \<turnstile> *[0x2a488,8]::64 word) \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[0x2a488,8]::64 word)::64 word) + 0x8),8]::64 word) \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = RSP\<^sub>0 \<and> (\<sigma> \<turnstile> *[0x2a488,8]::64 word) = (\<sigma> \<turnstile> *[0x2a488,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[0x2a488,8]::64 word)::64 word) + 0x8),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[0x2a488,8]::64 word)::64 word) + 0x8),8]::64 word)\<close>
declare Q_0x1c033_4_def[Qs]

schematic_goal raw_aio_remove_0_2_0x1c02e_0x1c030_4[blocks]:
  assumes \<open>(P_0x1c02e_false_4 && P_0x1c02e_false_4_regions && ! ZF) \<sigma>\<close>
  shows \<open>exec_block 2 0x1c030 4 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x1c033_4 ?\<sigma> \<and> block_usage P_0x1c02e_false_4_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x1c02e_false_4_def P_0x1c02e_false_4_regions_def post: Q_0x1c033_4_def regionset: P_0x1c02e_false_4_regions_set_def)

definition P_0x1c033_true_5 :: state_pred where
  \<open>P_0x1c033_true_5 \<sigma> \<equiv> RIP \<sigma> = 0x1c033 \<and> RAX \<sigma> = (\<sigma> \<turnstile> *[0x2a488,8]::64 word) \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[0x2a488,8]::64 word)::64 word) + 0x8),8]::64 word) \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = RSP\<^sub>0 \<and> (\<sigma> \<turnstile> *[0x2a488,8]::64 word) = (\<sigma> \<turnstile> *[0x2a488,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[0x2a488,8]::64 word)::64 word) + 0x8),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[0x2a488,8]::64 word)::64 word) + 0x8),8]::64 word)\<close>
declare P_0x1c033_true_5_def[Ps]

definition P_0x1c033_true_5_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x1c033_true_5_regions_set \<sigma> \<equiv> {
    (0, 0x2a488, 8),
    (1, RSP\<^sub>0, 8),
    (2, (((\<sigma> \<turnstile> *[0x2a488,8]::64 word)::64 word) + 0x8), 8)
  }\<close>

definition P_0x1c033_true_5_regions :: state_pred where
  \<open>P_0x1c033_true_5_regions \<sigma> \<equiv> \<exists>regions. P_0x1c033_true_5_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x1c048_5 :: state_pred where
  \<open>Q_0x1c048_5 \<sigma> \<equiv> RIP \<sigma> = 0x1c048 \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = RSP\<^sub>0 \<and> (\<sigma> \<turnstile> *[0x2a488,8]::64 word) = (\<sigma> \<turnstile> *[0x2a488,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[0x2a488,8]::64 word)::64 word) + 0x8),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[0x2a488,8]::64 word)::64 word) + 0x8),8]::64 word)\<close>
declare Q_0x1c048_5_def[Qs]

schematic_goal raw_aio_remove_0_1_0x1c033_0x1c033_5[blocks]:
  assumes \<open>(P_0x1c033_true_5 && P_0x1c033_true_5_regions && !ZF) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x1c033 5 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x1c048_5 ?\<sigma> \<and> block_usage P_0x1c033_true_5_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x1c033_true_5_def P_0x1c033_true_5_regions_def post: Q_0x1c048_5_def regionset: P_0x1c033_true_5_regions_set_def)

definition P_0x1c048_6 :: state_pred where
  \<open>P_0x1c048_6 \<sigma> \<equiv> RIP \<sigma> = 0x1c048 \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = RSP\<^sub>0 \<and> (\<sigma> \<turnstile> *[0x2a488,8]::64 word) = (\<sigma> \<turnstile> *[0x2a488,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[0x2a488,8]::64 word)::64 word) + 0x8),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[0x2a488,8]::64 word)::64 word) + 0x8),8]::64 word)\<close>
declare P_0x1c048_6_def[Ps]

definition P_0x1c048_6_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x1c048_6_regions_set \<sigma> \<equiv> {
    (0, 0x2a488, 8),
    (1, RSP\<^sub>0, 8),
    (2, ((RDX \<sigma>::64 word) + 0x78), 8),
    (3, (((\<sigma> \<turnstile> *[0x2a488,8]::64 word)::64 word) + 0x8), 8)
  }\<close>

definition P_0x1c048_6_regions :: state_pred where
  \<open>P_0x1c048_6_regions \<sigma> \<equiv> \<exists>regions. P_0x1c048_6_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x1c04f_6 :: state_pred where
  \<open>Q_0x1c04f_6 \<sigma> \<equiv> RIP \<sigma> = 0x1c04f \<and> RAX \<sigma> = (\<sigma> \<turnstile> *[((RDX \<sigma>::64 word) + 0x78),8]::64 word) \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = RSP\<^sub>0 \<and> (\<sigma> \<turnstile> *[0x2a488,8]::64 word) = (\<sigma> \<turnstile> *[0x2a488,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDX \<sigma>::64 word) + 0x78),8]::64 word) = (\<sigma> \<turnstile> *[((RDX \<sigma>::64 word) + 0x78),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[0x2a488,8]::64 word)::64 word) + 0x8),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[0x2a488,8]::64 word)::64 word) + 0x8),8]::64 word)\<close>
declare Q_0x1c04f_6_def[Qs]

schematic_goal raw_aio_remove_0_2_0x1c048_0x1c04c_6[blocks]:
  assumes \<open>(P_0x1c048_6 && P_0x1c048_6_regions) \<sigma>\<close>
  shows \<open>exec_block 2 0x1c04c 6 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x1c04f_6 ?\<sigma> \<and> block_usage P_0x1c048_6_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x1c048_6_def P_0x1c048_6_regions_def post: Q_0x1c04f_6_def regionset: P_0x1c048_6_regions_set_def)

definition P_0x1c04f_true_7 :: state_pred where
  \<open>P_0x1c04f_true_7 \<sigma> \<equiv> RIP \<sigma> = 0x1c04f \<and> RAX \<sigma> = (\<sigma> \<turnstile> *[((RDX \<sigma>::64 word) + 0x78),8]::64 word) \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = RSP\<^sub>0 \<and> (\<sigma> \<turnstile> *[0x2a488,8]::64 word) = (\<sigma> \<turnstile> *[0x2a488,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDX \<sigma>::64 word) + 0x78),8]::64 word) = (\<sigma> \<turnstile> *[((RDX \<sigma>::64 word) + 0x78),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[0x2a488,8]::64 word)::64 word) + 0x8),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[0x2a488,8]::64 word)::64 word) + 0x8),8]::64 word)\<close>
declare P_0x1c04f_true_7_def[Ps]

definition P_0x1c04f_true_7_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x1c04f_true_7_regions_set \<sigma> \<equiv> {
    (0, 0x2a488, 8),
    (1, RSP\<^sub>0, 8),
    (2, ((RDX \<sigma>::64 word) + 0x78), 8),
    (3, (((\<sigma> \<turnstile> *[0x2a488,8]::64 word)::64 word) + 0x8), 8)
  }\<close>

definition P_0x1c04f_true_7_regions :: state_pred where
  \<open>P_0x1c04f_true_7_regions \<sigma> \<equiv> \<exists>regions. P_0x1c04f_true_7_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x1c043_7 :: state_pred where
  \<open>Q_0x1c043_7 \<sigma> \<equiv> RIP \<sigma> = 0x1c043 \<and> RAX \<sigma> = (\<sigma> \<turnstile> *[((RDX \<sigma>::64 word) + 0x78),8]::64 word) \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = RSP\<^sub>0 \<and> (\<sigma> \<turnstile> *[0x2a488,8]::64 word) = (\<sigma> \<turnstile> *[0x2a488,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDX \<sigma>::64 word) + 0x78),8]::64 word) = (\<sigma> \<turnstile> *[((RDX \<sigma>::64 word) + 0x78),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[0x2a488,8]::64 word)::64 word) + 0x8),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[0x2a488,8]::64 word)::64 word) + 0x8),8]::64 word)\<close>
declare Q_0x1c043_7_def[Qs]

schematic_goal raw_aio_remove_0_2_0x1c04f_0x1c040_7[blocks]:
  assumes \<open>(P_0x1c04f_true_7 && P_0x1c04f_true_7_regions && !ZF) \<sigma>\<close>
  shows \<open>exec_block 2 0x1c040 7 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x1c043_7 ?\<sigma> \<and> block_usage P_0x1c04f_true_7_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x1c04f_true_7_def P_0x1c04f_true_7_regions_def post: Q_0x1c043_7_def regionset: P_0x1c04f_true_7_regions_set_def)

definition P_0x1c043_true_8 :: state_pred where
  \<open>P_0x1c043_true_8 \<sigma> \<equiv> RIP \<sigma> = 0x1c043 \<and> RAX \<sigma> = (\<sigma> \<turnstile> *[((RDX \<sigma>::64 word) + 0x78),8]::64 word) \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = RSP\<^sub>0 \<and> (\<sigma> \<turnstile> *[0x2a488,8]::64 word) = (\<sigma> \<turnstile> *[0x2a488,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDX \<sigma>::64 word) + 0x78),8]::64 word) = (\<sigma> \<turnstile> *[((RDX \<sigma>::64 word) + 0x78),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[0x2a488,8]::64 word)::64 word) + 0x8),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[0x2a488,8]::64 word)::64 word) + 0x8),8]::64 word)\<close>
declare P_0x1c043_true_8_def[Ps]

definition P_0x1c043_true_8_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x1c043_true_8_regions_set \<sigma> \<equiv> {
    (0, 0x2a488, 8),
    (1, RSP\<^sub>0, 8),
    (2, ((RDX \<sigma>::64 word) + 0x78), 8),
    (3, (((\<sigma> \<turnstile> *[0x2a488,8]::64 word)::64 word) + 0x8), 8)
  }\<close>

definition P_0x1c043_true_8_regions :: state_pred where
  \<open>P_0x1c043_true_8_regions \<sigma> \<equiv> \<exists>regions. P_0x1c043_true_8_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x1c070_8 :: state_pred where
  \<open>Q_0x1c070_8 \<sigma> \<equiv> RIP \<sigma> = 0x1c070 \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = RSP\<^sub>0 \<and> (\<sigma> \<turnstile> *[0x2a488,8]::64 word) = (\<sigma> \<turnstile> *[0x2a488,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[0x2a488,8]::64 word)::64 word) + 0x8),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[0x2a488,8]::64 word)::64 word) + 0x8),8]::64 word)\<close>
declare Q_0x1c070_8_def[Qs]

schematic_goal raw_aio_remove_0_1_0x1c043_0x1c043_8[blocks]:
  assumes \<open>(P_0x1c043_true_8 && P_0x1c043_true_8_regions && ZF) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x1c043 8 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x1c070_8 ?\<sigma> \<and> block_usage P_0x1c043_true_8_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x1c043_true_8_def P_0x1c043_true_8_regions_def post: Q_0x1c070_8_def regionset: P_0x1c043_true_8_regions_set_def)

definition P_0x1c043_false_9 :: state_pred where
  \<open>P_0x1c043_false_9 \<sigma> \<equiv> RIP \<sigma> = 0x1c043 \<and> RAX \<sigma> = (\<sigma> \<turnstile> *[((RDX \<sigma>::64 word) + 0x78),8]::64 word) \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = RSP\<^sub>0 \<and> (\<sigma> \<turnstile> *[0x2a488,8]::64 word) = (\<sigma> \<turnstile> *[0x2a488,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDX \<sigma>::64 word) + 0x78),8]::64 word) = (\<sigma> \<turnstile> *[((RDX \<sigma>::64 word) + 0x78),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[0x2a488,8]::64 word)::64 word) + 0x8),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[0x2a488,8]::64 word)::64 word) + 0x8),8]::64 word)\<close>
declare P_0x1c043_false_9_def[Ps]

definition P_0x1c043_false_9_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x1c043_false_9_regions_set \<sigma> \<equiv> {
    (0, 0x2a488, 8),
    (1, RSP\<^sub>0, 8),
    (2, ((RDX \<sigma>::64 word) + 0x78), 8),
    (3, (((\<sigma> \<turnstile> *[0x2a488,8]::64 word)::64 word) + 0x8), 8)
  }\<close>

definition P_0x1c043_false_9_regions :: state_pred where
  \<open>P_0x1c043_false_9_regions \<sigma> \<equiv> \<exists>regions. P_0x1c043_false_9_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x1c048_9 :: state_pred where
  \<open>Q_0x1c048_9 \<sigma> \<equiv> RIP \<sigma> = 0x1c048 \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = RSP\<^sub>0 \<and> (\<sigma> \<turnstile> *[0x2a488,8]::64 word) = (\<sigma> \<turnstile> *[0x2a488,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[0x2a488,8]::64 word)::64 word) + 0x8),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[0x2a488,8]::64 word)::64 word) + 0x8),8]::64 word)\<close>
declare Q_0x1c048_9_def[Qs]

schematic_goal raw_aio_remove_0_2_0x1c043_0x1c045_9[blocks]:
  assumes \<open>(P_0x1c043_false_9 && P_0x1c043_false_9_regions && ! ZF) \<sigma>\<close>
  shows \<open>exec_block 2 0x1c045 9 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x1c048_9 ?\<sigma> \<and> block_usage P_0x1c043_false_9_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x1c043_false_9_def P_0x1c043_false_9_regions_def post: Q_0x1c048_9_def regionset: P_0x1c043_false_9_regions_set_def)

definition P_0x1c04f_false_10 :: state_pred where
  \<open>P_0x1c04f_false_10 \<sigma> \<equiv> RIP \<sigma> = 0x1c04f \<and> RAX \<sigma> = (\<sigma> \<turnstile> *[((RDX \<sigma>::64 word) + 0x78),8]::64 word) \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = RSP\<^sub>0 \<and> (\<sigma> \<turnstile> *[0x2a488,8]::64 word) = (\<sigma> \<turnstile> *[0x2a488,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDX \<sigma>::64 word) + 0x78),8]::64 word) = (\<sigma> \<turnstile> *[((RDX \<sigma>::64 word) + 0x78),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[0x2a488,8]::64 word)::64 word) + 0x8),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[0x2a488,8]::64 word)::64 word) + 0x8),8]::64 word)\<close>
declare P_0x1c04f_false_10_def[Ps]

definition P_0x1c04f_false_10_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x1c04f_false_10_regions_set \<sigma> \<equiv> {
    (0, 0x2a488, 8),
    (1, RSP\<^sub>0, 8),
    (2, ((RDX \<sigma>::64 word) + 0x78), 8),
    (3, (((\<sigma> \<turnstile> *[0x2a488,8]::64 word)::64 word) + 0x8), 8)
  }\<close>

definition P_0x1c04f_false_10_regions :: state_pred where
  \<open>P_0x1c04f_false_10_regions \<sigma> \<equiv> \<exists>regions. P_0x1c04f_false_10_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x1c051_10 :: state_pred where
  \<open>Q_0x1c051_10 \<sigma> \<equiv> RIP \<sigma> = 0x1c051 \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = RSP\<^sub>0 \<and> (\<sigma> \<turnstile> *[0x2a488,8]::64 word) = (\<sigma> \<turnstile> *[0x2a488,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[0x2a488,8]::64 word)::64 word) + 0x8),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[0x2a488,8]::64 word)::64 word) + 0x8),8]::64 word)\<close>
declare Q_0x1c051_10_def[Qs]

schematic_goal raw_aio_remove_0_1_0x1c04f_0x1c04f_10[blocks]:
  assumes \<open>(P_0x1c04f_false_10 && P_0x1c04f_false_10_regions && ! !ZF) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x1c04f 10 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x1c051_10 ?\<sigma> \<and> block_usage P_0x1c04f_false_10_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x1c04f_false_10_def P_0x1c04f_false_10_regions_def post: Q_0x1c051_10_def regionset: P_0x1c04f_false_10_regions_set_def)

definition P_0x1c070_11 :: state_pred where
  \<open>P_0x1c070_11 \<sigma> \<equiv> RIP \<sigma> = 0x1c070 \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = RSP\<^sub>0 \<and> (\<sigma> \<turnstile> *[0x2a488,8]::64 word) = (\<sigma> \<turnstile> *[0x2a488,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[0x2a488,8]::64 word)::64 word) + 0x8),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[0x2a488,8]::64 word)::64 word) + 0x8),8]::64 word)\<close>
declare P_0x1c070_11_def[Ps]

definition P_0x1c070_11_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x1c070_11_regions_set \<sigma> \<equiv> {
    (0, 0x2a488, 8),
    (1, RSP\<^sub>0, 8),
    (2, (((\<sigma> \<turnstile> *[0x2a488,8]::64 word)::64 word) + 0x8), 8)
  }\<close>

definition P_0x1c070_11_regions :: state_pred where
  \<open>P_0x1c070_11_regions \<sigma> \<equiv> \<exists>regions. P_0x1c070_11_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x1c074_11 :: state_pred where
  \<open>Q_0x1c074_11 \<sigma> \<equiv> RIP \<sigma> = 0x1c074 \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = RSP\<^sub>0 \<and> (\<sigma> \<turnstile> *[0x2a488,8]::64 word) = (\<sigma> \<turnstile> *[0x2a488,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[0x2a488,8]::64 word)::64 word) + 0x8),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[0x2a488,8]::64 word)::64 word) + 0x8),8]::64 word)\<close>
declare Q_0x1c074_11_def[Qs]

schematic_goal raw_aio_remove_0_1_0x1c070_0x1c070_11[blocks]:
  assumes \<open>(P_0x1c070_11 && P_0x1c070_11_regions) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x1c070 11 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x1c074_11 ?\<sigma> \<and> block_usage P_0x1c070_11_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x1c070_11_def P_0x1c070_11_regions_def post: Q_0x1c074_11_def regionset: P_0x1c070_11_regions_set_def)

definition P_0x1c074_12 :: state_pred where
  \<open>P_0x1c074_12 \<sigma> \<equiv> RIP \<sigma> = 0x1c074 \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = RSP\<^sub>0 \<and> (\<sigma> \<turnstile> *[0x2a488,8]::64 word) = (\<sigma> \<turnstile> *[0x2a488,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[0x2a488,8]::64 word)::64 word) + 0x8),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[0x2a488,8]::64 word)::64 word) + 0x8),8]::64 word)\<close>
declare P_0x1c074_12_def[Ps]

definition P_0x1c074_12_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x1c074_12_regions_set \<sigma> \<equiv> {
    (0, RDX \<sigma>, 8),
    (1, 0x2a488, 8),
    (2, RDI\<^sub>0, 8),
    (3, RSP\<^sub>0, 8),
    (4, ((RDI\<^sub>0::64 word) + 0x20), 8),
    (5, ((RDI\<^sub>0::64 word) + 0x78), 8),
    (6, (((\<sigma> \<turnstile> *[0x2a488,8]::64 word)::64 word) + 0x8), 8),
    (7, (((\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word)::64 word) + 0x10), 8)
  }\<close>

definition P_0x1c074_12_regions :: state_pred where
  \<open>P_0x1c074_12_regions \<sigma> \<equiv> \<exists>regions. P_0x1c074_12_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_ret_address_12 :: state_pred where
  \<open>Q_ret_address_12 \<sigma> \<equiv> RIP \<sigma> = ret_address \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) + 0x8) \<and> (\<sigma> \<turnstile> *[0x2a488,8]::64 word) = (\<sigma> \<turnstile> *[0x2a488,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address\<close>
declare Q_ret_address_12_def[Qs]

schematic_goal raw_aio_remove_0_8_0x1c074_0x1a86f_12[blocks]:
  assumes \<open>(P_0x1c074_12 && P_0x1c074_12_regions) \<sigma>\<close>
  shows \<open>exec_block 8 0x1a86f 12 \<sigma> \<triangleq> ?\<sigma> \<and> Q_ret_address_12 ?\<sigma> \<and> block_usage P_0x1c074_12_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x1c074_12_def P_0x1c074_12_regions_def post: Q_ret_address_12_def regionset: P_0x1c074_12_regions_set_def)

definition P_0x1c051_13 :: state_pred where
  \<open>P_0x1c051_13 \<sigma> \<equiv> RIP \<sigma> = 0x1c051 \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = RSP\<^sub>0 \<and> (\<sigma> \<turnstile> *[0x2a488,8]::64 word) = (\<sigma> \<turnstile> *[0x2a488,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[0x2a488,8]::64 word)::64 word) + 0x8),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[0x2a488,8]::64 word)::64 word) + 0x8),8]::64 word)\<close>
declare P_0x1c051_13_def[Ps]

definition P_0x1c051_13_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x1c051_13_regions_set \<sigma> \<equiv> {
    (0, 0x2a300, 8),
    (1, 0x2a488, 8),
    (2, RSP\<^sub>0, 8),
    (3, (((\<sigma> \<turnstile> *[0x2a488,8]::64 word)::64 word) + 0x8), 8)
  }\<close>

definition P_0x1c051_13_regions :: state_pred where
  \<open>P_0x1c051_13_regions \<sigma> \<equiv> \<exists>regions. P_0x1c051_13_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x1c069_13 :: state_pred where
  \<open>Q_0x1c069_13 \<sigma> \<equiv> RIP \<sigma> = 0x1c069 \<and> RCX \<sigma> = (\<sigma> \<turnstile> *[0x2a300,8]::64 word) \<and> RDX \<sigma> = 0x27 \<and> RDI \<sigma> = 0x21c80 \<and> RSI \<sigma> = 0x1 \<and> RSP \<sigma> = RSP\<^sub>0 \<and> (\<sigma> \<turnstile> *[0x2a300,8]::64 word) = (\<sigma> \<turnstile> *[0x2a300,8]::64 word) \<and> (\<sigma> \<turnstile> *[0x2a488,8]::64 word) = (\<sigma> \<turnstile> *[0x2a488,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[0x2a488,8]::64 word)::64 word) + 0x8),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[0x2a488,8]::64 word)::64 word) + 0x8),8]::64 word)\<close>
declare Q_0x1c069_13_def[Qs]

schematic_goal raw_aio_remove_0_4_0x1c051_0x1c062_13[blocks]:
  assumes \<open>(P_0x1c051_13 && P_0x1c051_13_regions) \<sigma>\<close>
  shows \<open>exec_block 4 0x1c062 13 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x1c069_13 ?\<sigma> \<and> block_usage P_0x1c051_13_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x1c051_13_def P_0x1c051_13_regions_def post: Q_0x1c069_13_def regionset: P_0x1c051_13_regions_set_def)

definition P_0x1c069_14 :: state_pred where
  \<open>P_0x1c069_14 \<sigma> \<equiv> RIP \<sigma> = 0x1c069 \<and> RCX \<sigma> = (\<sigma> \<turnstile> *[0x2a300,8]::64 word) \<and> RDX \<sigma> = 0x27 \<and> RDI \<sigma> = 0x21c80 \<and> RSI \<sigma> = 0x1 \<and> RSP \<sigma> = RSP\<^sub>0 \<and> (\<sigma> \<turnstile> *[0x2a300,8]::64 word) = (\<sigma> \<turnstile> *[0x2a300,8]::64 word) \<and> (\<sigma> \<turnstile> *[0x2a488,8]::64 word) = (\<sigma> \<turnstile> *[0x2a488,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[0x2a488,8]::64 word)::64 word) + 0x8),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[0x2a488,8]::64 word)::64 word) + 0x8),8]::64 word)\<close>
declare P_0x1c069_14_def[Ps]

definition P_0x1c069_14_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x1c069_14_regions_set \<sigma> \<equiv> {
    (0, 0x2a300, 8),
    (1, 0x2a488, 8),
    (2, RSP\<^sub>0, 8),
    (3, (((\<sigma> \<turnstile> *[0x2a488,8]::64 word)::64 word) + 0x8), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x8), 8)
  }\<close>

definition P_0x1c069_14_regions :: state_pred where
  \<open>P_0x1c069_14_regions \<sigma> \<equiv> \<exists>regions. P_0x1c069_14_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_fwrite_addr_0x1c069_14 :: state_pred where
  \<open>Q_fwrite_addr_0x1c069_14 \<sigma> \<equiv> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x8) \<and> RIP \<sigma> = fwrite_addr \<and> RCX \<sigma> = (\<sigma> \<turnstile> *[0x2a300,8]::64 word) \<and> RDX \<sigma> = 0x27 \<and> RDI \<sigma> = 0x21c80 \<and> RSI \<sigma> = 0x1 \<and> (\<sigma> \<turnstile> *[0x2a300,8]::64 word) = (\<sigma> \<turnstile> *[0x2a300,8]::64 word) \<and> (\<sigma> \<turnstile> *[0x2a488,8]::64 word) = (\<sigma> \<turnstile> *[0x2a488,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[0x2a488,8]::64 word)::64 word) + 0x8),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[0x2a488,8]::64 word)::64 word) + 0x8),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = 0x1c06a\<close>
declare Q_fwrite_addr_0x1c069_14_def[Qs]

schematic_goal raw_aio_remove_0_1_0x1c069_0x1c069_14[blocks]:
  assumes \<open>(P_0x1c069_14 && P_0x1c069_14_regions) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x1c069 14 \<sigma> \<triangleq> ?\<sigma> \<and> Q_fwrite_addr_0x1c069_14 ?\<sigma> \<and> block_usage P_0x1c069_14_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x1c069_14_def P_0x1c069_14_regions_def post: Q_fwrite_addr_0x1c069_14_def regionset: P_0x1c069_14_regions_set_def)

definition P_0x1c06a_15 :: state_pred where
  \<open>P_0x1c06a_15 \<sigma> \<equiv> RIP \<sigma> = 0x1c06a \<and> RCX \<sigma> = (\<sigma> \<turnstile> *[0x2a300,8]::64 word) \<and> RDX \<sigma> = 0x27 \<and> RDI \<sigma> = 0x21c80 \<and> RSI \<sigma> = 0x1 \<and> RSP \<sigma> = RSP\<^sub>0 \<and> (\<sigma> \<turnstile> *[0x2a300,8]::64 word) = (\<sigma> \<turnstile> *[0x2a300,8]::64 word) \<and> (\<sigma> \<turnstile> *[0x2a488,8]::64 word) = (\<sigma> \<turnstile> *[0x2a488,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[0x2a488,8]::64 word)::64 word) + 0x8),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[0x2a488,8]::64 word)::64 word) + 0x8),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = 0x1c06a\<close>
declare P_0x1c06a_15_def[Ps]

definition P_0x1c06a_15_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x1c06a_15_regions_set \<sigma> \<equiv> {
    (0, 0x2a300, 8),
    (1, 0x2a488, 8),
    (2, RSP\<^sub>0, 8),
    (3, (((\<sigma> \<turnstile> *[0x2a488,8]::64 word)::64 word) + 0x8), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x8), 8)
  }\<close>

definition P_0x1c06a_15_regions :: state_pred where
  \<open>P_0x1c06a_15_regions \<sigma> \<equiv> \<exists>regions. P_0x1c06a_15_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_ret_address_15 :: state_pred where
  \<open>Q_ret_address_15 \<sigma> \<equiv> RIP \<sigma> = ret_address \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) + 0x8) \<and> (\<sigma> \<turnstile> *[0x2a488,8]::64 word) = (\<sigma> \<turnstile> *[0x2a488,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address\<close>
declare Q_ret_address_15_def[Qs]

schematic_goal raw_aio_remove_0_1_0x1c06a_0x1c06a_15[blocks]:
  assumes \<open>(P_0x1c06a_15 && P_0x1c06a_15_regions) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x1c06a 15 \<sigma> \<triangleq> ?\<sigma> \<and> Q_ret_address_15 ?\<sigma> \<and> block_usage P_0x1c06a_15_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x1c06a_15_def P_0x1c06a_15_regions_def post: Q_ret_address_15_def regionset: P_0x1c06a_15_regions_set_def)

definition P_0x1c033_false_16 :: state_pred where
  \<open>P_0x1c033_false_16 \<sigma> \<equiv> RIP \<sigma> = 0x1c033 \<and> RAX \<sigma> = (\<sigma> \<turnstile> *[0x2a488,8]::64 word) \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[0x2a488,8]::64 word)::64 word) + 0x8),8]::64 word) \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = RSP\<^sub>0 \<and> (\<sigma> \<turnstile> *[0x2a488,8]::64 word) = (\<sigma> \<turnstile> *[0x2a488,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[0x2a488,8]::64 word)::64 word) + 0x8),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[0x2a488,8]::64 word)::64 word) + 0x8),8]::64 word)\<close>
declare P_0x1c033_false_16_def[Ps]

definition P_0x1c033_false_16_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x1c033_false_16_regions_set \<sigma> \<equiv> {
    (0, 0x2a488, 8),
    (1, RSP\<^sub>0, 8),
    (2, (((\<sigma> \<turnstile> *[0x2a488,8]::64 word)::64 word) + 0x8), 8)
  }\<close>

definition P_0x1c033_false_16_regions :: state_pred where
  \<open>P_0x1c033_false_16_regions \<sigma> \<equiv> \<exists>regions. P_0x1c033_false_16_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x1c074_16 :: state_pred where
  \<open>Q_0x1c074_16 \<sigma> \<equiv> RIP \<sigma> = 0x1c074 \<and> RAX \<sigma> = (\<sigma> \<turnstile> *[0x2a488,8]::64 word) \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = (((\<sigma> \<turnstile> *[0x2a488,8]::64 word)::64 word) + 0x8) \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = RSP\<^sub>0 \<and> (\<sigma> \<turnstile> *[0x2a488,8]::64 word) = (\<sigma> \<turnstile> *[0x2a488,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[0x2a488,8]::64 word)::64 word) + 0x8),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[0x2a488,8]::64 word)::64 word) + 0x8),8]::64 word)\<close>
declare Q_0x1c074_16_def[Qs]

schematic_goal raw_aio_remove_0_4_0x1c033_0x1c084_16[blocks]:
  assumes \<open>(P_0x1c033_false_16 && P_0x1c033_false_16_regions && ! !ZF) \<sigma>\<close>
  shows \<open>exec_block 4 0x1c084 16 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x1c074_16 ?\<sigma> \<and> block_usage P_0x1c033_false_16_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x1c033_false_16_def P_0x1c033_false_16_regions_def post: Q_0x1c074_16_def regionset: P_0x1c033_false_16_regions_set_def)

definition P_0x1c074_17 :: state_pred where
  \<open>P_0x1c074_17 \<sigma> \<equiv> RIP \<sigma> = 0x1c074 \<and> RAX \<sigma> = (\<sigma> \<turnstile> *[0x2a488,8]::64 word) \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = (((\<sigma> \<turnstile> *[0x2a488,8]::64 word)::64 word) + 0x8) \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = RSP\<^sub>0 \<and> (\<sigma> \<turnstile> *[0x2a488,8]::64 word) = (\<sigma> \<turnstile> *[0x2a488,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[0x2a488,8]::64 word)::64 word) + 0x8),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[0x2a488,8]::64 word)::64 word) + 0x8),8]::64 word)\<close>
declare P_0x1c074_17_def[Ps]

definition P_0x1c074_17_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x1c074_17_regions_set \<sigma> \<equiv> {
    (0, 0x2a488, 8),
    (1, RDI\<^sub>0, 8),
    (2, RSP\<^sub>0, 8),
    (3, ((RDI\<^sub>0::64 word) + 0x20), 8),
    (4, ((RDI\<^sub>0::64 word) + 0x78), 8),
    (5, (((\<sigma> \<turnstile> *[0x2a488,8]::64 word)::64 word) + 0x8), 8),
    (6, (((\<sigma> \<turnstile> *[RDI\<^sub>0,8]::64 word)::64 word) + 0x10), 8)
  }\<close>

definition P_0x1c074_17_regions :: state_pred where
  \<open>P_0x1c074_17_regions \<sigma> \<equiv> \<exists>regions. P_0x1c074_17_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_ret_address_17 :: state_pred where
  \<open>Q_ret_address_17 \<sigma> \<equiv> RIP \<sigma> = ret_address \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) + 0x8) \<and> (\<sigma> \<turnstile> *[0x2a488,8]::64 word) = (\<sigma> \<turnstile> *[0x2a488,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address\<close>
declare Q_ret_address_17_def[Qs]

schematic_goal raw_aio_remove_0_8_0x1c074_0x1a86f_17[blocks]:
  assumes \<open>(P_0x1c074_17 && P_0x1c074_17_regions) \<sigma>\<close>
  shows \<open>exec_block 8 0x1a86f 17 \<sigma> \<triangleq> ?\<sigma> \<and> Q_ret_address_17 ?\<sigma> \<and> block_usage P_0x1c074_17_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x1c074_17_def P_0x1c074_17_regions_def post: Q_ret_address_17_def regionset: P_0x1c074_17_regions_set_def)

definition raw_aio_remove_acode :: ACode where
  \<open>raw_aio_remove_acode =
    Block 3 0x1c02b 0;
    IF ZF THEN
      Block 5 0x1c062 (Suc 0);
      Block (Suc 0) 0x1c069 2;
      CALL fwrite_acode;
      Block (Suc 0) 0x1c06a 3
    ELSE
      Block 2 0x1c030 4;
      IF !ZF THEN
        Block (Suc 0) 0x1c033 5;
        WHILE P_0x1c048_6 DO
          Block 2 0x1c04c 6;
          IF !ZF THEN
            Block 2 0x1c040 7;
            IF ZF THEN
              Block (Suc 0) 0x1c043 8
            ELSE
              Block 2 0x1c045 9
            FI
          ELSE
            Block (Suc 0) 0x1c04f 10
          FI
        OD;
        CASES [
          (P_0x1c070_11,
            Block (Suc 0) 0x1c070 11;
            Block 8 0x1a86f 12
          ),
          (P_0x1c051_13,
            Block 4 0x1c062 13;
            Block (Suc 0) 0x1c069 14;
            CALL fwrite_acode;
            Block (Suc 0) 0x1c06a 15
          )
        ]
      ELSE
        Block 4 0x1c084 16;
        Block 8 0x1a86f 17
      FI
    FI
  \<close>

schematic_goal "raw_aio_remove":
  assumes
    \<open>\<forall>\<sigma>. RIP \<sigma> = 0x1c02e \<longrightarrow> P_0x1c02e_true_1_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x1c069 \<longrightarrow> P_0x1c069_2_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x1c06a \<longrightarrow> P_0x1c06a_3_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x1c02e \<longrightarrow> P_0x1c02e_false_4_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x1c033 \<longrightarrow> P_0x1c033_true_5_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x1c048 \<longrightarrow> P_0x1c048_6_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x1c04f \<longrightarrow> P_0x1c04f_true_7_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x1c043 \<longrightarrow> P_0x1c043_true_8_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x1c043 \<longrightarrow> P_0x1c043_false_9_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x1c04f \<longrightarrow> P_0x1c04f_false_10_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x1c070 \<longrightarrow> P_0x1c070_11_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x1c074 \<longrightarrow> P_0x1c074_12_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x1c051 \<longrightarrow> P_0x1c051_13_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x1c069 \<longrightarrow> P_0x1c069_14_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x1c06a \<longrightarrow> P_0x1c06a_15_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x1c033 \<longrightarrow> P_0x1c033_false_16_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x1c074 \<longrightarrow> P_0x1c074_17_regions \<sigma>\<close>
    and [blocks]: \<open>{{Q_fwrite_addr_0x1c069_2}} \<box>fwrite_acode {{P_0x1c06a_3;M_0x1c069}}\<close>
    and [blocks]: \<open>{{Q_fwrite_addr_0x1c069_14}} \<box>fwrite_acode {{P_0x1c06a_15;M_0x1c069}}\<close>
  shows \<open>{{?P}} raw_aio_remove_acode {{?Q;?M}}\<close>
  apply (vcg acode: raw_aio_remove_acode_def assms: assms)
          apply (vcg_while \<open>P_0x1c048_6 || P_0x1c070_11 || P_0x1c051_13\<close> assms: assms)
             apply (vcg_step assms: assms)+
            apply (simp add: pred_logic Ps Qs)
           apply (vcg_step' assms: assms)
               apply (vcg_step assms: assms)+
  done

end

locale "raw_aio_cancel" = "qemu_img_xen" +
  fixes RAX\<^sub>0\<^sub>v RBX\<^sub>0\<^sub>v RCX\<^sub>0\<^sub>v RDX\<^sub>0\<^sub>v RDI\<^sub>0\<^sub>v RSI\<^sub>0\<^sub>v RSP\<^sub>0\<^sub>v RBP\<^sub>0\<^sub>v R13\<^sub>0\<^sub>v R12\<^sub>0\<^sub>v R9\<^sub>0\<^sub>v R8\<^sub>0\<^sub>v ret_address\<^sub>v :: \<open>64 word\<close>
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
definition \<open>R13\<^sub>0 \<equiv> R13\<^sub>0\<^sub>v\<close>
definition \<open>R12\<^sub>0 \<equiv> R12\<^sub>0\<^sub>v\<close>
definition \<open>R9\<^sub>0 \<equiv> R9\<^sub>0\<^sub>v\<close>
definition \<open>R8\<^sub>0 \<equiv> R8\<^sub>0\<^sub>v\<close>
definition \<open>ret_address \<equiv> ret_address\<^sub>v\<close>

definition P_0x1c130_0 :: state_pred where
  \<open>P_0x1c130_0 \<sigma> \<equiv> RIP \<sigma> = 0x1c130 \<and> RAX \<sigma> = RAX\<^sub>0 \<and> RBX \<sigma> = RBX\<^sub>0 \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = RDX\<^sub>0 \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = RSP\<^sub>0 \<and> RBP \<sigma> = RBP\<^sub>0 \<and> R13 \<sigma> = R13\<^sub>0 \<and> R12 \<sigma> = R12\<^sub>0 \<and> R9 \<sigma> = R9\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address\<close>
declare P_0x1c130_0_def[Ps]

definition P_0x1c130_0_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x1c130_0_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((RDI\<^sub>0::64 word) + 0x40), 8),
    (2, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x20), 8)
  }\<close>

definition P_0x1c130_0_regions :: state_pred where
  \<open>P_0x1c130_0_regions \<sigma> \<equiv> \<exists>regions. P_0x1c130_0_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x1c14c_0 :: state_pred where
  \<open>Q_0x1c14c_0 \<sigma> \<equiv> RIP \<sigma> = 0x1c14c \<and> RAX \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> RBX \<sigma> = RBX\<^sub>0 \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = RDX\<^sub>0 \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x38) \<and> RBP \<sigma> = RDI\<^sub>0 \<and> R13 \<sigma> = RSI\<^sub>0 \<and> R12 \<sigma> = RDX\<^sub>0 \<and> R9 \<sigma> = R9\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBX\<^sub>0\<close>
declare Q_0x1c14c_0_def[Qs]

schematic_goal raw_aio_cancel_0_10_0x1c130_0x1c147_0[blocks]:
  assumes \<open>(P_0x1c130_0 && P_0x1c130_0_regions) \<sigma>\<close>
  shows \<open>exec_block 10 0x1c147 0 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x1c14c_0 ?\<sigma> \<and> block_usage P_0x1c130_0_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x1c130_0_def P_0x1c130_0_regions_def post: Q_0x1c14c_0_def regionset: P_0x1c130_0_regions_set_def)

definition P_0x1c14c_true_1 :: state_pred where
  \<open>P_0x1c14c_true_1 \<sigma> \<equiv> RIP \<sigma> = 0x1c14c \<and> RAX \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> RBX \<sigma> = RBX\<^sub>0 \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = RDX\<^sub>0 \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x38) \<and> RBP \<sigma> = RDI\<^sub>0 \<and> R13 \<sigma> = RSI\<^sub>0 \<and> R12 \<sigma> = RDX\<^sub>0 \<and> R9 \<sigma> = R9\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBX\<^sub>0\<close>
declare P_0x1c14c_true_1_def[Ps]

definition P_0x1c14c_true_1_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x1c14c_true_1_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((RDI\<^sub>0::64 word) + 0x40), 8),
    (2, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x20), 8)
  }\<close>

definition P_0x1c14c_true_1_regions :: state_pred where
  \<open>P_0x1c14c_true_1_regions \<sigma> \<equiv> \<exists>regions. P_0x1c14c_true_1_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x1c196_1 :: state_pred where
  \<open>Q_0x1c196_1 \<sigma> \<equiv> RIP \<sigma> = 0x1c196 \<and> RAX \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> RBX \<sigma> = RBX\<^sub>0 \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = RDX\<^sub>0 \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x38) \<and> RBP \<sigma> = RDI\<^sub>0 \<and> R13 \<sigma> = RSI\<^sub>0 \<and> R12 \<sigma> = RDX\<^sub>0 \<and> R9 \<sigma> = R9\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBX\<^sub>0\<close>
declare Q_0x1c196_1_def[Qs]

schematic_goal raw_aio_cancel_0_2_0x1c14c_0x1c190_1[blocks]:
  assumes \<open>(P_0x1c14c_true_1 && P_0x1c14c_true_1_regions && !ZF) \<sigma>\<close>
  shows \<open>exec_block 2 0x1c190 (Suc 0) \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x1c196_1 ?\<sigma> \<and> block_usage P_0x1c14c_true_1_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x1c14c_true_1_def P_0x1c14c_true_1_regions_def post: Q_0x1c196_1_def regionset: P_0x1c14c_true_1_regions_set_def)

definition P_0x1c196_true_2 :: state_pred where
  \<open>P_0x1c196_true_2 \<sigma> \<equiv> RIP \<sigma> = 0x1c196 \<and> RAX \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> RBX \<sigma> = RBX\<^sub>0 \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = RDX\<^sub>0 \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x38) \<and> RBP \<sigma> = RDI\<^sub>0 \<and> R13 \<sigma> = RSI\<^sub>0 \<and> R12 \<sigma> = RDX\<^sub>0 \<and> R9 \<sigma> = R9\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBX\<^sub>0\<close>
declare P_0x1c196_true_2_def[Ps]

definition P_0x1c196_true_2_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x1c196_true_2_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((RDI\<^sub>0::64 word) + 0x40), 8),
    (2, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x20), 8)
  }\<close>

definition P_0x1c196_true_2_regions :: state_pred where
  \<open>P_0x1c196_true_2_regions \<sigma> \<equiv> \<exists>regions. P_0x1c196_true_2_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x1c157_2 :: state_pred where
  \<open>Q_0x1c157_2 \<sigma> \<equiv> RIP \<sigma> = 0x1c157 \<and> RAX \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> RBX \<sigma> = RBX\<^sub>0 \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = RDX\<^sub>0 \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x38) \<and> RBP \<sigma> = RDI\<^sub>0 \<and> R13 \<sigma> = RSI\<^sub>0 \<and> R12 \<sigma> = RDX\<^sub>0 \<and> R9 \<sigma> = R9\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBX\<^sub>0\<close>
declare Q_0x1c157_2_def[Qs]

schematic_goal raw_aio_cancel_0_4_0x1c196_0x1c154_2[blocks]:
  assumes \<open>(P_0x1c196_true_2 && P_0x1c196_true_2_regions && ZF) \<sigma>\<close>
  shows \<open>exec_block 4 0x1c154 2 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x1c157_2 ?\<sigma> \<and> block_usage P_0x1c196_true_2_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x1c196_true_2_def P_0x1c196_true_2_regions_def post: Q_0x1c157_2_def regionset: P_0x1c196_true_2_regions_set_def)

definition P_0x1c157_3 :: state_pred where
  \<open>P_0x1c157_3 \<sigma> \<equiv> RIP \<sigma> = 0x1c157 \<and> RAX \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> RBX \<sigma> = RBX\<^sub>0 \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = RDX\<^sub>0 \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x38) \<and> RBP \<sigma> = RDI\<^sub>0 \<and> R13 \<sigma> = RSI\<^sub>0 \<and> R12 \<sigma> = RDX\<^sub>0 \<and> R9 \<sigma> = R9\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBX\<^sub>0\<close>
declare P_0x1c157_3_def[Ps]

definition P_0x1c157_3_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x1c157_3_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((RDI\<^sub>0::64 word) + 0x40), 8),
    (2, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x40), 8)
  }\<close>

definition P_0x1c157_3_regions :: state_pred where
  \<open>P_0x1c157_3_regions \<sigma> \<equiv> \<exists>regions. P_0x1c157_3_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x1b8c0_0x1c157_3 :: state_pred where
  \<open>Q_0x1b8c0_0x1c157_3 \<sigma> \<equiv> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x40) \<and> RIP \<sigma> = 0x1b8c0 \<and> RAX \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> RBX \<sigma> = RBX\<^sub>0 \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = RDX\<^sub>0 \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RBP \<sigma> = RDI\<^sub>0 \<and> R13 \<sigma> = RSI\<^sub>0 \<and> R12 \<sigma> = RDX\<^sub>0 \<and> R9 \<sigma> = R9\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = 0x1c15c\<close>
declare Q_0x1b8c0_0x1c157_3_def[Qs]

schematic_goal raw_aio_cancel_0_1_0x1c157_0x1c157_3[blocks]:
  assumes \<open>(P_0x1c157_3 && P_0x1c157_3_regions) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x1c157 3 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x1b8c0_0x1c157_3 ?\<sigma> \<and> block_usage P_0x1c157_3_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x1c157_3_def P_0x1c157_3_regions_def post: Q_0x1b8c0_0x1c157_3_def regionset: P_0x1c157_3_regions_set_def)

definition P_0x1c15c_4 :: state_pred where
  \<open>P_0x1c15c_4 \<sigma> \<equiv> RIP \<sigma> = 0x1c15c \<and> RAX \<sigma> = raw_aio_setup_0x1c157_retval \<and> RBX \<sigma> = RBX\<^sub>0 \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = RDX\<^sub>0 \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x38) \<and> RBP \<sigma> = RDI\<^sub>0 \<and> R13 \<sigma> = RSI\<^sub>0 \<and> R12 \<sigma> = RDX\<^sub>0 \<and> R9 \<sigma> = R9\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = 0x1c15c\<close>
declare P_0x1c15c_4_def[Ps]

definition P_0x1c15c_4_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x1c15c_4_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((RDI\<^sub>0::64 word) + 0x40), 8),
    (2, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x40), 8)
  }\<close>

definition P_0x1c15c_4_regions :: state_pred where
  \<open>P_0x1c15c_4_regions \<sigma> \<equiv> \<exists>regions. P_0x1c15c_4_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x1c162_4 :: state_pred where
  \<open>Q_0x1c162_4 \<sigma> \<equiv> RIP \<sigma> = 0x1c162 \<and> RAX \<sigma> = raw_aio_setup_0x1c157_retval \<and> RBX \<sigma> = raw_aio_setup_0x1c157_retval \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = RDX\<^sub>0 \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x38) \<and> RBP \<sigma> = RDI\<^sub>0 \<and> R13 \<sigma> = RSI\<^sub>0 \<and> R12 \<sigma> = RDX\<^sub>0 \<and> R9 \<sigma> = R9\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = 0x1c15c\<close>
declare Q_0x1c162_4_def[Qs]

schematic_goal raw_aio_cancel_0_2_0x1c15c_0x1c15f_4[blocks]:
  assumes \<open>(P_0x1c15c_4 && P_0x1c15c_4_regions) \<sigma>\<close>
  shows \<open>exec_block 2 0x1c15f 4 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x1c162_4 ?\<sigma> \<and> block_usage P_0x1c15c_4_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x1c15c_4_def P_0x1c15c_4_regions_def post: Q_0x1c162_4_def regionset: P_0x1c15c_4_regions_set_def)

definition P_0x1c162_true_5 :: state_pred where
  \<open>P_0x1c162_true_5 \<sigma> \<equiv> RIP \<sigma> = 0x1c162 \<and> RAX \<sigma> = raw_aio_setup_0x1c157_retval \<and> RBX \<sigma> = raw_aio_setup_0x1c157_retval \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = RDX\<^sub>0 \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x38) \<and> RBP \<sigma> = RDI\<^sub>0 \<and> R13 \<sigma> = RSI\<^sub>0 \<and> R12 \<sigma> = RDX\<^sub>0 \<and> R9 \<sigma> = R9\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = 0x1c15c\<close>
declare P_0x1c162_true_5_def[Ps]

definition P_0x1c162_true_5_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x1c162_true_5_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((RDI\<^sub>0::64 word) + 0x40), 8),
    (2, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x40), 8)
  }\<close>

definition P_0x1c162_true_5_regions :: state_pred where
  \<open>P_0x1c162_true_5_regions \<sigma> \<equiv> \<exists>regions. P_0x1c162_true_5_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_ret_address_5 :: state_pred where
  \<open>Q_ret_address_5 \<sigma> \<equiv> RIP \<sigma> = ret_address \<and> RBX \<sigma> = RBX\<^sub>0 \<and> RDX \<sigma> = RDX\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) + 0x8) \<and> RBP \<sigma> = RBP\<^sub>0 \<and> R13 \<sigma> = R13\<^sub>0 \<and> R12 \<sigma> = R12\<^sub>0 \<and> R9 \<sigma> = R9\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBX\<^sub>0\<close>
declare Q_ret_address_5_def[Qs]

schematic_goal raw_aio_cancel_0_9_0x1c162_0x1c18f_5[blocks]:
  assumes \<open>(P_0x1c162_true_5 && P_0x1c162_true_5_regions && ZF) \<sigma>\<close>
  shows \<open>exec_block 9 0x1c18f 5 \<sigma> \<triangleq> ?\<sigma> \<and> Q_ret_address_5 ?\<sigma> \<and> block_usage P_0x1c162_true_5_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x1c162_true_5_def P_0x1c162_true_5_regions_def post: Q_ret_address_5_def regionset: P_0x1c162_true_5_regions_set_def)

definition P_0x1c162_false_6 :: state_pred where
  \<open>P_0x1c162_false_6 \<sigma> \<equiv> RIP \<sigma> = 0x1c162 \<and> RAX \<sigma> = raw_aio_setup_0x1c157_retval \<and> RBX \<sigma> = raw_aio_setup_0x1c157_retval \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = RDX\<^sub>0 \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x38) \<and> RBP \<sigma> = RDI\<^sub>0 \<and> R13 \<sigma> = RSI\<^sub>0 \<and> R12 \<sigma> = RDX\<^sub>0 \<and> R9 \<sigma> = R9\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = 0x1c15c\<close>
declare P_0x1c162_false_6_def[Ps]

definition P_0x1c162_false_6_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x1c162_false_6_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((RDI\<^sub>0::64 word) + 0x40), 8),
    (2, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x40), 8)
  }\<close>

definition P_0x1c162_false_6_regions :: state_pred where
  \<open>P_0x1c162_false_6_regions \<sigma> \<equiv> \<exists>regions. P_0x1c162_false_6_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x1c168_6 :: state_pred where
  \<open>Q_0x1c168_6 \<sigma> \<equiv> RIP \<sigma> = 0x1c168 \<and> RAX \<sigma> = raw_aio_setup_0x1c157_retval \<and> RBX \<sigma> = raw_aio_setup_0x1c157_retval \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = RDX\<^sub>0 \<and> RDI \<sigma> = ((raw_aio_setup_0x1c157_retval::64 word) + 0x28) \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x38) \<and> RBP \<sigma> = RDI\<^sub>0 \<and> R13 \<sigma> = RSI\<^sub>0 \<and> R12 \<sigma> = RDX\<^sub>0 \<and> R9 \<sigma> = R9\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = 0x1c15c\<close>
declare Q_0x1c168_6_def[Qs]

schematic_goal raw_aio_cancel_0_2_0x1c162_0x1c164_6[blocks]:
  assumes \<open>(P_0x1c162_false_6 && P_0x1c162_false_6_regions && ! ZF) \<sigma>\<close>
  shows \<open>exec_block 2 0x1c164 6 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x1c168_6 ?\<sigma> \<and> block_usage P_0x1c162_false_6_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x1c162_false_6_def P_0x1c162_false_6_regions_def post: Q_0x1c168_6_def regionset: P_0x1c162_false_6_regions_set_def)

definition P_0x1c168_7 :: state_pred where
  \<open>P_0x1c168_7 \<sigma> \<equiv> RIP \<sigma> = 0x1c168 \<and> RAX \<sigma> = raw_aio_setup_0x1c157_retval \<and> RBX \<sigma> = raw_aio_setup_0x1c157_retval \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = RDX\<^sub>0 \<and> RDI \<sigma> = ((raw_aio_setup_0x1c157_retval::64 word) + 0x28) \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x38) \<and> RBP \<sigma> = RDI\<^sub>0 \<and> R13 \<sigma> = RSI\<^sub>0 \<and> R12 \<sigma> = RDX\<^sub>0 \<and> R9 \<sigma> = R9\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = 0x1c15c\<close>
declare P_0x1c168_7_def[Ps]

definition P_0x1c168_7_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x1c168_7_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((RDI\<^sub>0::64 word) + 0x40), 8),
    (2, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x40), 8)
  }\<close>

definition P_0x1c168_7_regions :: state_pred where
  \<open>P_0x1c168_7_regions \<sigma> \<equiv> \<exists>regions. P_0x1c168_7_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_qemu_paio_write_addr_0x1c168_7 :: state_pred where
  \<open>Q_qemu_paio_write_addr_0x1c168_7 \<sigma> \<equiv> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x40) \<and> RIP \<sigma> = qemu_paio_write_addr \<and> RAX \<sigma> = raw_aio_setup_0x1c157_retval \<and> RBX \<sigma> = raw_aio_setup_0x1c157_retval \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = RDX\<^sub>0 \<and> RDI \<sigma> = ((raw_aio_setup_0x1c157_retval::64 word) + 0x28) \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RBP \<sigma> = RDI\<^sub>0 \<and> R13 \<sigma> = RSI\<^sub>0 \<and> R12 \<sigma> = RDX\<^sub>0 \<and> R9 \<sigma> = R9\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = 0x1c16d\<close>
declare Q_qemu_paio_write_addr_0x1c168_7_def[Qs]

schematic_goal raw_aio_cancel_0_1_0x1c168_0x1c168_7[blocks]:
  assumes \<open>(P_0x1c168_7 && P_0x1c168_7_regions) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x1c168 7 \<sigma> \<triangleq> ?\<sigma> \<and> Q_qemu_paio_write_addr_0x1c168_7 ?\<sigma> \<and> block_usage P_0x1c168_7_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x1c168_7_def P_0x1c168_7_regions_def post: Q_qemu_paio_write_addr_0x1c168_7_def regionset: P_0x1c168_7_regions_set_def)

definition P_0x1c16d_8 :: state_pred where
  \<open>P_0x1c16d_8 \<sigma> \<equiv> RIP \<sigma> = 0x1c16d \<and> RAX \<sigma> = qemu_paio_write_0x1c168_retval \<and> RBX \<sigma> = raw_aio_setup_0x1c157_retval \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = RDX\<^sub>0 \<and> RDI \<sigma> = ((raw_aio_setup_0x1c157_retval::64 word) + 0x28) \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x38) \<and> RBP \<sigma> = RDI\<^sub>0 \<and> R13 \<sigma> = RSI\<^sub>0 \<and> R12 \<sigma> = RDX\<^sub>0 \<and> R9 \<sigma> = R9\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = 0x1c16d\<close>
declare P_0x1c16d_8_def[Ps]

definition P_0x1c16d_8_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x1c16d_8_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((RDI\<^sub>0::64 word) + 0x40), 8),
    (2, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x40), 8)
  }\<close>

definition P_0x1c16d_8_regions :: state_pred where
  \<open>P_0x1c16d_8_regions \<sigma> \<equiv> \<exists>regions. P_0x1c16d_8_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x1c16f_8 :: state_pred where
  \<open>Q_0x1c16f_8 \<sigma> \<equiv> RIP \<sigma> = 0x1c16f \<and> RAX \<sigma> = qemu_paio_write_0x1c168_retval \<and> RBX \<sigma> = raw_aio_setup_0x1c157_retval \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = RDX\<^sub>0 \<and> RDI \<sigma> = ((raw_aio_setup_0x1c157_retval::64 word) + 0x28) \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x38) \<and> RBP \<sigma> = RDI\<^sub>0 \<and> R13 \<sigma> = RSI\<^sub>0 \<and> R12 \<sigma> = RDX\<^sub>0 \<and> R9 \<sigma> = R9\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = 0x1c16d\<close>
declare Q_0x1c16f_8_def[Qs]

schematic_goal raw_aio_cancel_0_1_0x1c16d_0x1c16d_8[blocks]:
  assumes \<open>(P_0x1c16d_8 && P_0x1c16d_8_regions) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x1c16d 8 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x1c16f_8 ?\<sigma> \<and> block_usage P_0x1c16d_8_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x1c16d_8_def P_0x1c16d_8_regions_def post: Q_0x1c16f_8_def regionset: P_0x1c16d_8_regions_set_def)

definition P_0x1c16f_true_9 :: state_pred where
  \<open>P_0x1c16f_true_9 \<sigma> \<equiv> RIP \<sigma> = 0x1c16f \<and> RAX \<sigma> = qemu_paio_write_0x1c168_retval \<and> RBX \<sigma> = raw_aio_setup_0x1c157_retval \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = RDX\<^sub>0 \<and> RDI \<sigma> = ((raw_aio_setup_0x1c157_retval::64 word) + 0x28) \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x38) \<and> RBP \<sigma> = RDI\<^sub>0 \<and> R13 \<sigma> = RSI\<^sub>0 \<and> R12 \<sigma> = RDX\<^sub>0 \<and> R9 \<sigma> = R9\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = 0x1c16d\<close>
declare P_0x1c16f_true_9_def[Ps]

definition P_0x1c16f_true_9_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x1c16f_true_9_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((RDI\<^sub>0::64 word) + 0x40), 8),
    (2, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x40), 8)
  }\<close>

definition P_0x1c16f_true_9_regions :: state_pred where
  \<open>P_0x1c16f_true_9_regions \<sigma> \<equiv> \<exists>regions. P_0x1c16f_true_9_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x1c1ed_9 :: state_pred where
  \<open>Q_0x1c1ed_9 \<sigma> \<equiv> RIP \<sigma> = 0x1c1ed \<and> RAX \<sigma> = qemu_paio_write_0x1c168_retval \<and> RBX \<sigma> = 0x0 \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = RDX\<^sub>0 \<and> RDI \<sigma> = raw_aio_setup_0x1c157_retval \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x38) \<and> RBP \<sigma> = RDI\<^sub>0 \<and> R13 \<sigma> = RSI\<^sub>0 \<and> R12 \<sigma> = RDX\<^sub>0 \<and> R9 \<sigma> = R9\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = 0x1c16d\<close>
declare Q_0x1c1ed_9_def[Qs]

schematic_goal raw_aio_cancel_0_3_0x1c16f_0x1c1eb_9[blocks]:
  assumes \<open>(P_0x1c16f_true_9 && P_0x1c16f_true_9_regions && SF) \<sigma>\<close>
  shows \<open>exec_block 3 0x1c1eb 9 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x1c1ed_9 ?\<sigma> \<and> block_usage P_0x1c16f_true_9_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x1c16f_true_9_def P_0x1c16f_true_9_regions_def post: Q_0x1c1ed_9_def regionset: P_0x1c16f_true_9_regions_set_def)

definition P_0x1c1ed_10 :: state_pred where
  \<open>P_0x1c1ed_10 \<sigma> \<equiv> RIP \<sigma> = 0x1c1ed \<and> RAX \<sigma> = qemu_paio_write_0x1c168_retval \<and> RBX \<sigma> = 0x0 \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = RDX\<^sub>0 \<and> RDI \<sigma> = raw_aio_setup_0x1c157_retval \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x38) \<and> RBP \<sigma> = RDI\<^sub>0 \<and> R13 \<sigma> = RSI\<^sub>0 \<and> R12 \<sigma> = RDX\<^sub>0 \<and> R9 \<sigma> = R9\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = 0x1c16d\<close>
declare P_0x1c1ed_10_def[Ps]

definition P_0x1c1ed_10_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x1c1ed_10_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((RDI\<^sub>0::64 word) + 0x40), 8),
    (2, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x40), 8)
  }\<close>

definition P_0x1c1ed_10_regions :: state_pred where
  \<open>P_0x1c1ed_10_regions \<sigma> \<equiv> \<exists>regions. P_0x1c1ed_10_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x1c020_0x1c1ed_10 :: state_pred where
  \<open>Q_0x1c020_0x1c1ed_10 \<sigma> \<equiv> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x40) \<and> RIP \<sigma> = 0x1c020 \<and> RAX \<sigma> = qemu_paio_write_0x1c168_retval \<and> RBX \<sigma> = 0x0 \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = RDX\<^sub>0 \<and> RDI \<sigma> = raw_aio_setup_0x1c157_retval \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RBP \<sigma> = RDI\<^sub>0 \<and> R13 \<sigma> = RSI\<^sub>0 \<and> R12 \<sigma> = RDX\<^sub>0 \<and> R9 \<sigma> = R9\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = 0x1c1f2\<close>
declare Q_0x1c020_0x1c1ed_10_def[Qs]

schematic_goal raw_aio_cancel_0_1_0x1c1ed_0x1c1ed_10[blocks]:
  assumes \<open>(P_0x1c1ed_10 && P_0x1c1ed_10_regions) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x1c1ed 10 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x1c020_0x1c1ed_10 ?\<sigma> \<and> block_usage P_0x1c1ed_10_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x1c1ed_10_def P_0x1c1ed_10_regions_def post: Q_0x1c020_0x1c1ed_10_def regionset: P_0x1c1ed_10_regions_set_def)

definition P_0x1c1f2_11 :: state_pred where
  \<open>P_0x1c1f2_11 \<sigma> \<equiv> RIP \<sigma> = 0x1c1f2 \<and> RAX \<sigma> = raw_aio_remove_0x1c1ed_retval \<and> RBX \<sigma> = 0x0 \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = RDX\<^sub>0 \<and> RDI \<sigma> = raw_aio_setup_0x1c157_retval \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x38) \<and> RBP \<sigma> = RDI\<^sub>0 \<and> R13 \<sigma> = RSI\<^sub>0 \<and> R12 \<sigma> = RDX\<^sub>0 \<and> R9 \<sigma> = R9\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = 0x1c1f2\<close>
declare P_0x1c1f2_11_def[Ps]

definition P_0x1c1f2_11_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x1c1f2_11_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((RDI\<^sub>0::64 word) + 0x40), 8),
    (2, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x40), 8)
  }\<close>

definition P_0x1c1f2_11_regions :: state_pred where
  \<open>P_0x1c1f2_11_regions \<sigma> \<equiv> \<exists>regions. P_0x1c1f2_11_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x1c171_11 :: state_pred where
  \<open>Q_0x1c171_11 \<sigma> \<equiv> RIP \<sigma> = 0x1c171 \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = RDX\<^sub>0 \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x38) \<and> RBP \<sigma> = RDI\<^sub>0 \<and> R13 \<sigma> = RSI\<^sub>0 \<and> R12 \<sigma> = RDX\<^sub>0 \<and> R9 \<sigma> = R9\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBX\<^sub>0\<close>
declare Q_0x1c171_11_def[Qs]

schematic_goal raw_aio_cancel_0_1_0x1c1f2_0x1c1f2_11[blocks]:
  assumes \<open>(P_0x1c1f2_11 && P_0x1c1f2_11_regions) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x1c1f2 11 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x1c171_11 ?\<sigma> \<and> block_usage P_0x1c1f2_11_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x1c1f2_11_def P_0x1c1f2_11_regions_def post: Q_0x1c171_11_def regionset: P_0x1c1f2_11_regions_set_def)

definition P_0x1c16f_false_12 :: state_pred where
  \<open>P_0x1c16f_false_12 \<sigma> \<equiv> RIP \<sigma> = 0x1c16f \<and> RAX \<sigma> = qemu_paio_write_0x1c168_retval \<and> RBX \<sigma> = raw_aio_setup_0x1c157_retval \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = RDX\<^sub>0 \<and> RDI \<sigma> = ((raw_aio_setup_0x1c157_retval::64 word) + 0x28) \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x38) \<and> RBP \<sigma> = RDI\<^sub>0 \<and> R13 \<sigma> = RSI\<^sub>0 \<and> R12 \<sigma> = RDX\<^sub>0 \<and> R9 \<sigma> = R9\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = 0x1c16d\<close>
declare P_0x1c16f_false_12_def[Ps]

definition P_0x1c16f_false_12_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x1c16f_false_12_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((RDI\<^sub>0::64 word) + 0x40), 8),
    (2, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x40), 8)
  }\<close>

definition P_0x1c16f_false_12_regions :: state_pred where
  \<open>P_0x1c16f_false_12_regions \<sigma> \<equiv> \<exists>regions. P_0x1c16f_false_12_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x1c171_12 :: state_pred where
  \<open>Q_0x1c171_12 \<sigma> \<equiv> RIP \<sigma> = 0x1c171 \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = RDX\<^sub>0 \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x38) \<and> RBP \<sigma> = RDI\<^sub>0 \<and> R13 \<sigma> = RSI\<^sub>0 \<and> R12 \<sigma> = RDX\<^sub>0 \<and> R9 \<sigma> = R9\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBX\<^sub>0\<close>
declare Q_0x1c171_12_def[Qs]

schematic_goal raw_aio_cancel_0_1_0x1c16f_0x1c16f_12[blocks]:
  assumes \<open>(P_0x1c16f_false_12 && P_0x1c16f_false_12_regions && ! SF) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x1c16f 12 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x1c171_12 ?\<sigma> \<and> block_usage P_0x1c16f_false_12_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x1c16f_false_12_def P_0x1c16f_false_12_regions_def post: Q_0x1c171_12_def regionset: P_0x1c16f_false_12_regions_set_def)

definition P_0x1c171_13 :: state_pred where
  \<open>P_0x1c171_13 \<sigma> \<equiv> RIP \<sigma> = 0x1c171 \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = RDX\<^sub>0 \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x38) \<and> RBP \<sigma> = RDI\<^sub>0 \<and> R13 \<sigma> = RSI\<^sub>0 \<and> R12 \<sigma> = RDX\<^sub>0 \<and> R9 \<sigma> = R9\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBX\<^sub>0\<close>
declare P_0x1c171_13_def[Ps]

definition P_0x1c171_13_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x1c171_13_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((RDI\<^sub>0::64 word) + 0x40), 8),
    (2, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x20), 8)
  }\<close>

definition P_0x1c171_13_regions :: state_pred where
  \<open>P_0x1c171_13_regions \<sigma> \<equiv> \<exists>regions. P_0x1c171_13_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_ret_address_13 :: state_pred where
  \<open>Q_ret_address_13 \<sigma> \<equiv> RIP \<sigma> = ret_address \<and> RBX \<sigma> = RBX\<^sub>0 \<and> RDX \<sigma> = RDX\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) + 0x8) \<and> RBP \<sigma> = RBP\<^sub>0 \<and> R13 \<sigma> = R13\<^sub>0 \<and> R12 \<sigma> = R12\<^sub>0 \<and> R9 \<sigma> = R9\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBX\<^sub>0\<close>
declare Q_ret_address_13_def[Qs]

schematic_goal raw_aio_cancel_0_7_0x1c171_0x1c17e_13[blocks]:
  assumes \<open>(P_0x1c171_13 && P_0x1c171_13_regions) \<sigma>\<close>
  shows \<open>exec_block 7 0x1c17e 13 \<sigma> \<triangleq> ?\<sigma> \<and> Q_ret_address_13 ?\<sigma> \<and> block_usage P_0x1c171_13_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x1c171_13_def P_0x1c171_13_regions_def post: Q_ret_address_13_def regionset: P_0x1c171_13_regions_set_def)

definition P_0x1c196_false_14 :: state_pred where
  \<open>P_0x1c196_false_14 \<sigma> \<equiv> RIP \<sigma> = 0x1c196 \<and> RAX \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> RBX \<sigma> = RBX\<^sub>0 \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = RDX\<^sub>0 \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x38) \<and> RBP \<sigma> = RDI\<^sub>0 \<and> R13 \<sigma> = RSI\<^sub>0 \<and> R12 \<sigma> = RDX\<^sub>0 \<and> R9 \<sigma> = R9\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBX\<^sub>0\<close>
declare P_0x1c196_false_14_def[Ps]

definition P_0x1c196_false_14_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x1c196_false_14_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((RDI\<^sub>0::64 word) + 0x40), 8),
    (2, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x2c), 4)
  }\<close>

definition P_0x1c196_false_14_regions :: state_pred where
  \<open>P_0x1c196_false_14_regions \<sigma> \<equiv> \<exists>regions. P_0x1c196_false_14_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x1c1a2_14 :: state_pred where
  \<open>Q_0x1c1a2_14 \<sigma> \<equiv> RIP \<sigma> = 0x1c1a2 \<and> RAX \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> RBX \<sigma> = RBX\<^sub>0 \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = R9\<^sub>0 \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = R8\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x38) \<and> RBP \<sigma> = RDI\<^sub>0 \<and> R13 \<sigma> = RSI\<^sub>0 \<and> R12 \<sigma> = RDX\<^sub>0 \<and> R9 \<sigma> = R9\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x2c),4]::32 word) = ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word))\<close>
declare Q_0x1c1a2_14_def[Qs]

schematic_goal raw_aio_cancel_0_4_0x1c196_0x1c19e_14[blocks]:
  assumes \<open>(P_0x1c196_false_14 && P_0x1c196_false_14_regions && ! ZF) \<sigma>\<close>
  shows \<open>exec_block 4 0x1c19e 14 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x1c1a2_14 ?\<sigma> \<and> block_usage P_0x1c196_false_14_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x1c196_false_14_def P_0x1c196_false_14_regions_def post: Q_0x1c1a2_14_def regionset: P_0x1c196_false_14_regions_set_def)

definition P_0x1c1a2_15 :: state_pred where
  \<open>P_0x1c1a2_15 \<sigma> \<equiv> RIP \<sigma> = 0x1c1a2 \<and> RAX \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> RBX \<sigma> = RBX\<^sub>0 \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = R9\<^sub>0 \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = R8\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x38) \<and> RBP \<sigma> = RDI\<^sub>0 \<and> R13 \<sigma> = RSI\<^sub>0 \<and> R12 \<sigma> = RDX\<^sub>0 \<and> R9 \<sigma> = R9\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x2c),4]::32 word) = ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word))\<close>
declare P_0x1c1a2_15_def[Ps]

definition P_0x1c1a2_15_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x1c1a2_15_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((RDI\<^sub>0::64 word) + 0x40), 8),
    (2, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x2c), 4),
    (8, ((RSP\<^sub>0::64 word) - 0x40), 8)
  }\<close>

definition P_0x1c1a2_15_regions :: state_pred where
  \<open>P_0x1c1a2_15_regions \<sigma> \<equiv> \<exists>regions. P_0x1c1a2_15_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_qemu_aio_get_addr_0x1c1a2_15 :: state_pred where
  \<open>Q_qemu_aio_get_addr_0x1c1a2_15 \<sigma> \<equiv> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x40) \<and> RIP \<sigma> = qemu_aio_get_addr \<and> RAX \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> RBX \<sigma> = RBX\<^sub>0 \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = R9\<^sub>0 \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = R8\<^sub>0 \<and> RBP \<sigma> = RDI\<^sub>0 \<and> R13 \<sigma> = RSI\<^sub>0 \<and> R12 \<sigma> = RDX\<^sub>0 \<and> R9 \<sigma> = R9\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x2c),4]::32 word) = ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = 0x1c1a7\<close>
declare Q_qemu_aio_get_addr_0x1c1a2_15_def[Qs]

schematic_goal raw_aio_cancel_0_1_0x1c1a2_0x1c1a2_15[blocks]:
  assumes \<open>(P_0x1c1a2_15 && P_0x1c1a2_15_regions) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x1c1a2 15 \<sigma> \<triangleq> ?\<sigma> \<and> Q_qemu_aio_get_addr_0x1c1a2_15 ?\<sigma> \<and> block_usage P_0x1c1a2_15_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x1c1a2_15_def P_0x1c1a2_15_regions_def post: Q_qemu_aio_get_addr_0x1c1a2_15_def regionset: P_0x1c1a2_15_regions_set_def)

definition P_0x1c1a7_16 :: state_pred where
  \<open>P_0x1c1a7_16 \<sigma> \<equiv> RIP \<sigma> = 0x1c1a7 \<and> RAX \<sigma> = qemu_aio_get_0x1c1a2_retval \<and> RBX \<sigma> = RBX\<^sub>0 \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = R9\<^sub>0 \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = R8\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x38) \<and> RBP \<sigma> = RDI\<^sub>0 \<and> R13 \<sigma> = RSI\<^sub>0 \<and> R12 \<sigma> = RDX\<^sub>0 \<and> R9 \<sigma> = R9\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x2c),4]::32 word) = ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = 0x1c1a7\<close>
declare P_0x1c1a7_16_def[Ps]

definition P_0x1c1a7_16_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x1c1a7_16_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((RDI\<^sub>0::64 word) + 0x40), 8),
    (2, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x2c), 4),
    (8, ((RSP\<^sub>0::64 word) - 0x40), 8)
  }\<close>

definition P_0x1c1a7_16_regions :: state_pred where
  \<open>P_0x1c1a7_16_regions \<sigma> \<equiv> \<exists>regions. P_0x1c1a7_16_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x1c1be_16 :: state_pred where
  \<open>Q_0x1c1be_16 \<sigma> \<equiv> RIP \<sigma> = 0x1c1be \<and> RAX \<sigma> = qemu_aio_get_0x1c1a2_retval \<and> RBX \<sigma> = qemu_aio_get_0x1c1a2_retval \<and> RCX \<sigma> = ucast (((ucast (((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word))::32 word) << 9)) \<and> RDX \<sigma> = RDX\<^sub>0 \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = ((ucast ((RSI\<^sub>0::64 word))::64 word) << 9) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x38) \<and> RBP \<sigma> = RDI\<^sub>0 \<and> R13 \<sigma> = RSI\<^sub>0 \<and> R12 \<sigma> = RDX\<^sub>0 \<and> R9 \<sigma> = R9\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x2c),4]::32 word) = ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = 0x1c1a7\<close>
declare Q_0x1c1be_16_def[Qs]

schematic_goal raw_aio_cancel_0_7_0x1c1a7_0x1c1bb_16[blocks]:
  assumes \<open>(P_0x1c1a7_16 && P_0x1c1a7_16_regions) \<sigma>\<close>
  shows \<open>exec_block 7 0x1c1bb 16 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x1c1be_16 ?\<sigma> \<and> block_usage P_0x1c1a7_16_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x1c1a7_16_def P_0x1c1a7_16_regions_def post: Q_0x1c1be_16_def regionset: P_0x1c1a7_16_regions_set_def)

definition P_0x1c1be_17 :: state_pred where
  \<open>P_0x1c1be_17 \<sigma> \<equiv> RIP \<sigma> = 0x1c1be \<and> RAX \<sigma> = qemu_aio_get_0x1c1a2_retval \<and> RBX \<sigma> = qemu_aio_get_0x1c1a2_retval \<and> RCX \<sigma> = ucast (((ucast (((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word))::32 word) << 9)) \<and> RDX \<sigma> = RDX\<^sub>0 \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = ((ucast ((RSI\<^sub>0::64 word))::64 word) << 9) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x38) \<and> RBP \<sigma> = RDI\<^sub>0 \<and> R13 \<sigma> = RSI\<^sub>0 \<and> R12 \<sigma> = RDX\<^sub>0 \<and> R9 \<sigma> = R9\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x2c),4]::32 word) = ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = 0x1c1a7\<close>
declare P_0x1c1be_17_def[Ps]

definition P_0x1c1be_17_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x1c1be_17_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((RDI\<^sub>0::64 word) + 0x40), 8),
    (2, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x2c), 4),
    (8, ((RSP\<^sub>0::64 word) - 0x40), 8)
  }\<close>

definition P_0x1c1be_17_regions :: state_pred where
  \<open>P_0x1c1be_17_regions \<sigma> \<equiv> \<exists>regions. P_0x1c1be_17_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_raw_pwrite_addr_0x1c1be_17 :: state_pred where
  \<open>Q_raw_pwrite_addr_0x1c1be_17 \<sigma> \<equiv> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x40) \<and> RIP \<sigma> = raw_pwrite_addr \<and> RAX \<sigma> = qemu_aio_get_0x1c1a2_retval \<and> RBX \<sigma> = qemu_aio_get_0x1c1a2_retval \<and> RCX \<sigma> = ucast (((ucast (((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word))::32 word) << 9)) \<and> RDX \<sigma> = RDX\<^sub>0 \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = ((ucast ((RSI\<^sub>0::64 word))::64 word) << 9) \<and> RBP \<sigma> = RDI\<^sub>0 \<and> R13 \<sigma> = RSI\<^sub>0 \<and> R12 \<sigma> = RDX\<^sub>0 \<and> R9 \<sigma> = R9\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x2c),4]::32 word) = ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = 0x1c1c3\<close>
declare Q_raw_pwrite_addr_0x1c1be_17_def[Qs]

schematic_goal raw_aio_cancel_0_1_0x1c1be_0x1c1be_17[blocks]:
  assumes \<open>(P_0x1c1be_17 && P_0x1c1be_17_regions) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x1c1be 17 \<sigma> \<triangleq> ?\<sigma> \<and> Q_raw_pwrite_addr_0x1c1be_17 ?\<sigma> \<and> block_usage P_0x1c1be_17_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x1c1be_17_def P_0x1c1be_17_regions_def post: Q_raw_pwrite_addr_0x1c1be_17_def regionset: P_0x1c1be_17_regions_set_def)

definition P_0x1c1c3_18 :: state_pred where
  \<open>P_0x1c1c3_18 \<sigma> \<equiv> RIP \<sigma> = 0x1c1c3 \<and> RAX \<sigma> = raw_pwrite_0x1c1be_retval \<and> RBX \<sigma> = qemu_aio_get_0x1c1a2_retval \<and> RCX \<sigma> = ucast (((ucast (((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word))::32 word) << 9)) \<and> RDX \<sigma> = RDX\<^sub>0 \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = ((ucast ((RSI\<^sub>0::64 word))::64 word) << 9) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x38) \<and> RBP \<sigma> = RDI\<^sub>0 \<and> R13 \<sigma> = RSI\<^sub>0 \<and> R12 \<sigma> = RDX\<^sub>0 \<and> R9 \<sigma> = R9\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x2c),4]::32 word) = ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = 0x1c1c3\<close>
declare P_0x1c1c3_18_def[Ps]

definition P_0x1c1c3_18_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x1c1c3_18_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((RDI\<^sub>0::64 word) + 0x40), 8),
    (2, ((qemu_aio_get_0x1c1a2_retval::64 word) + 0x80), 4),
    (3, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x2c), 4),
    (9, ((RSP\<^sub>0::64 word) - 0x40), 8)
  }\<close>

definition P_0x1c1c3_18_regions :: state_pred where
  \<open>P_0x1c1c3_18_regions \<sigma> \<equiv> \<exists>regions. P_0x1c1c3_18_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x1c1d3_18 :: state_pred where
  \<open>Q_0x1c1d3_18 \<sigma> \<equiv> RIP \<sigma> = 0x1c1d3 \<and> RAX \<sigma> = raw_pwrite_0x1c1be_retval \<and> RBX \<sigma> = qemu_aio_get_0x1c1a2_retval \<and> RCX \<sigma> = ucast (((ucast (((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word))::32 word) << 9)) \<and> RDX \<sigma> = RDX\<^sub>0 \<and> RDI \<sigma> = 0x1b980 \<and> RSI \<sigma> = qemu_aio_get_0x1c1a2_retval \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x38) \<and> RBP \<sigma> = RDI\<^sub>0 \<and> R13 \<sigma> = RSI\<^sub>0 \<and> R12 \<sigma> = RDX\<^sub>0 \<and> R9 \<sigma> = R9\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x2c),4]::32 word) = ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = 0x1c1c3\<close>
declare Q_0x1c1d3_18_def[Qs]

schematic_goal raw_aio_cancel_0_3_0x1c1c3_0x1c1cd_18[blocks]:
  assumes \<open>(P_0x1c1c3_18 && P_0x1c1c3_18_regions) \<sigma>\<close>
  shows \<open>exec_block 3 0x1c1cd 18 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x1c1d3_18 ?\<sigma> \<and> block_usage P_0x1c1c3_18_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x1c1c3_18_def P_0x1c1c3_18_regions_def post: Q_0x1c1d3_18_def regionset: P_0x1c1c3_18_regions_set_def)

definition P_0x1c1d3_19 :: state_pred where
  \<open>P_0x1c1d3_19 \<sigma> \<equiv> RIP \<sigma> = 0x1c1d3 \<and> RAX \<sigma> = raw_pwrite_0x1c1be_retval \<and> RBX \<sigma> = qemu_aio_get_0x1c1a2_retval \<and> RCX \<sigma> = ucast (((ucast (((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word))::32 word) << 9)) \<and> RDX \<sigma> = RDX\<^sub>0 \<and> RDI \<sigma> = 0x1b980 \<and> RSI \<sigma> = qemu_aio_get_0x1c1a2_retval \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x38) \<and> RBP \<sigma> = RDI\<^sub>0 \<and> R13 \<sigma> = RSI\<^sub>0 \<and> R12 \<sigma> = RDX\<^sub>0 \<and> R9 \<sigma> = R9\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x2c),4]::32 word) = ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = 0x1c1c3\<close>
declare P_0x1c1d3_19_def[Ps]

definition P_0x1c1d3_19_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x1c1d3_19_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((RDI\<^sub>0::64 word) + 0x40), 8),
    (2, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x2c), 4),
    (8, ((RSP\<^sub>0::64 word) - 0x40), 8)
  }\<close>

definition P_0x1c1d3_19_regions :: state_pred where
  \<open>P_0x1c1d3_19_regions \<sigma> \<equiv> \<exists>regions. P_0x1c1d3_19_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_qemu_bh_new_addr_0x1c1d3_19 :: state_pred where
  \<open>Q_qemu_bh_new_addr_0x1c1d3_19 \<sigma> \<equiv> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x40) \<and> RIP \<sigma> = qemu_bh_new_addr \<and> RAX \<sigma> = raw_pwrite_0x1c1be_retval \<and> RBX \<sigma> = qemu_aio_get_0x1c1a2_retval \<and> RCX \<sigma> = ucast (((ucast (((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word))::32 word) << 9)) \<and> RDX \<sigma> = RDX\<^sub>0 \<and> RDI \<sigma> = 0x1b980 \<and> RSI \<sigma> = qemu_aio_get_0x1c1a2_retval \<and> RBP \<sigma> = RDI\<^sub>0 \<and> R13 \<sigma> = RSI\<^sub>0 \<and> R12 \<sigma> = RDX\<^sub>0 \<and> R9 \<sigma> = R9\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x2c),4]::32 word) = ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = 0x1c1d8\<close>
declare Q_qemu_bh_new_addr_0x1c1d3_19_def[Qs]

schematic_goal raw_aio_cancel_0_1_0x1c1d3_0x1c1d3_19[blocks]:
  assumes \<open>(P_0x1c1d3_19 && P_0x1c1d3_19_regions) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x1c1d3 19 \<sigma> \<triangleq> ?\<sigma> \<and> Q_qemu_bh_new_addr_0x1c1d3_19 ?\<sigma> \<and> block_usage P_0x1c1d3_19_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x1c1d3_19_def P_0x1c1d3_19_regions_def post: Q_qemu_bh_new_addr_0x1c1d3_19_def regionset: P_0x1c1d3_19_regions_set_def)

definition P_0x1c1d8_20 :: state_pred where
  \<open>P_0x1c1d8_20 \<sigma> \<equiv> RIP \<sigma> = 0x1c1d8 \<and> RAX \<sigma> = qemu_bh_new_0x1c1d3_retval \<and> RBX \<sigma> = qemu_aio_get_0x1c1a2_retval \<and> RCX \<sigma> = ucast (((ucast (((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word))::32 word) << 9)) \<and> RDX \<sigma> = RDX\<^sub>0 \<and> RDI \<sigma> = 0x1b980 \<and> RSI \<sigma> = qemu_aio_get_0x1c1a2_retval \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x38) \<and> RBP \<sigma> = RDI\<^sub>0 \<and> R13 \<sigma> = RSI\<^sub>0 \<and> R12 \<sigma> = RDX\<^sub>0 \<and> R9 \<sigma> = R9\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x2c),4]::32 word) = ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = 0x1c1d8\<close>
declare P_0x1c1d8_20_def[Ps]

definition P_0x1c1d8_20_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x1c1d8_20_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((RDI\<^sub>0::64 word) + 0x40), 8),
    (2, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x2c), 4),
    (8, ((RSP\<^sub>0::64 word) - 0x40), 8)
  }\<close>

definition P_0x1c1d8_20_regions :: state_pred where
  \<open>P_0x1c1d8_20_regions \<sigma> \<equiv> \<exists>regions. P_0x1c1d8_20_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x1c1db_20 :: state_pred where
  \<open>Q_0x1c1db_20 \<sigma> \<equiv> RIP \<sigma> = 0x1c1db \<and> RAX \<sigma> = qemu_bh_new_0x1c1d3_retval \<and> RBX \<sigma> = qemu_aio_get_0x1c1a2_retval \<and> RCX \<sigma> = ucast (((ucast (((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word))::32 word) << 9)) \<and> RDX \<sigma> = RDX\<^sub>0 \<and> RDI \<sigma> = qemu_bh_new_0x1c1d3_retval \<and> RSI \<sigma> = qemu_aio_get_0x1c1a2_retval \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x38) \<and> RBP \<sigma> = RDI\<^sub>0 \<and> R13 \<sigma> = RSI\<^sub>0 \<and> R12 \<sigma> = RDX\<^sub>0 \<and> R9 \<sigma> = R9\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x2c),4]::32 word) = ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = 0x1c1d8\<close>
declare Q_0x1c1db_20_def[Qs]

schematic_goal raw_aio_cancel_0_1_0x1c1d8_0x1c1d8_20[blocks]:
  assumes \<open>(P_0x1c1d8_20 && P_0x1c1d8_20_regions) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x1c1d8 20 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x1c1db_20 ?\<sigma> \<and> block_usage P_0x1c1d8_20_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x1c1d8_20_def P_0x1c1d8_20_regions_def post: Q_0x1c1db_20_def regionset: P_0x1c1d8_20_regions_set_def)

definition P_0x1c1db_21 :: state_pred where
  \<open>P_0x1c1db_21 \<sigma> \<equiv> RIP \<sigma> = 0x1c1db \<and> RAX \<sigma> = qemu_bh_new_0x1c1d3_retval \<and> RBX \<sigma> = qemu_aio_get_0x1c1a2_retval \<and> RCX \<sigma> = ucast (((ucast (((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word))::32 word) << 9)) \<and> RDX \<sigma> = RDX\<^sub>0 \<and> RDI \<sigma> = qemu_bh_new_0x1c1d3_retval \<and> RSI \<sigma> = qemu_aio_get_0x1c1a2_retval \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x38) \<and> RBP \<sigma> = RDI\<^sub>0 \<and> R13 \<sigma> = RSI\<^sub>0 \<and> R12 \<sigma> = RDX\<^sub>0 \<and> R9 \<sigma> = R9\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x2c),4]::32 word) = ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = 0x1c1d8\<close>
declare P_0x1c1db_21_def[Ps]

definition P_0x1c1db_21_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x1c1db_21_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((RDI\<^sub>0::64 word) + 0x40), 8),
    (2, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x2c), 4),
    (8, ((RSP\<^sub>0::64 word) - 0x40), 8)
  }\<close>

definition P_0x1c1db_21_regions :: state_pred where
  \<open>P_0x1c1db_21_regions \<sigma> \<equiv> \<exists>regions. P_0x1c1db_21_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_qemu_bh_schedule_addr_0x1c1db_21 :: state_pred where
  \<open>Q_qemu_bh_schedule_addr_0x1c1db_21 \<sigma> \<equiv> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x40) \<and> RIP \<sigma> = qemu_bh_schedule_addr \<and> RAX \<sigma> = qemu_bh_new_0x1c1d3_retval \<and> RBX \<sigma> = qemu_aio_get_0x1c1a2_retval \<and> RCX \<sigma> = ucast (((ucast (((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word))::32 word) << 9)) \<and> RDX \<sigma> = RDX\<^sub>0 \<and> RDI \<sigma> = qemu_bh_new_0x1c1d3_retval \<and> RSI \<sigma> = qemu_aio_get_0x1c1a2_retval \<and> RBP \<sigma> = RDI\<^sub>0 \<and> R13 \<sigma> = RSI\<^sub>0 \<and> R12 \<sigma> = RDX\<^sub>0 \<and> R9 \<sigma> = R9\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x2c),4]::32 word) = ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = 0x1c1e0\<close>
declare Q_qemu_bh_schedule_addr_0x1c1db_21_def[Qs]

schematic_goal raw_aio_cancel_0_1_0x1c1db_0x1c1db_21[blocks]:
  assumes \<open>(P_0x1c1db_21 && P_0x1c1db_21_regions) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x1c1db 21 \<sigma> \<triangleq> ?\<sigma> \<and> Q_qemu_bh_schedule_addr_0x1c1db_21 ?\<sigma> \<and> block_usage P_0x1c1db_21_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x1c1db_21_def P_0x1c1db_21_regions_def post: Q_qemu_bh_schedule_addr_0x1c1db_21_def regionset: P_0x1c1db_21_regions_set_def)

definition P_0x1c1e0_22 :: state_pred where
  \<open>P_0x1c1e0_22 \<sigma> \<equiv> RIP \<sigma> = 0x1c1e0 \<and> RAX \<sigma> = qemu_bh_schedule_0x1c1db_retval \<and> RBX \<sigma> = qemu_aio_get_0x1c1a2_retval \<and> RCX \<sigma> = ucast (((ucast (((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word))::32 word) << 9)) \<and> RDX \<sigma> = RDX\<^sub>0 \<and> RDI \<sigma> = qemu_bh_new_0x1c1d3_retval \<and> RSI \<sigma> = qemu_aio_get_0x1c1a2_retval \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x38) \<and> RBP \<sigma> = RDI\<^sub>0 \<and> R13 \<sigma> = RSI\<^sub>0 \<and> R12 \<sigma> = RDX\<^sub>0 \<and> R9 \<sigma> = R9\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x2c),4]::32 word) = ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = 0x1c1e0\<close>
declare P_0x1c1e0_22_def[Ps]

definition P_0x1c1e0_22_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x1c1e0_22_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((RDI\<^sub>0::64 word) + 0x40), 8),
    (2, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x2c), 4),
    (8, ((RSP\<^sub>0::64 word) - 0x40), 8)
  }\<close>

definition P_0x1c1e0_22_regions :: state_pred where
  \<open>P_0x1c1e0_22_regions \<sigma> \<equiv> \<exists>regions. P_0x1c1e0_22_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x1c171_22 :: state_pred where
  \<open>Q_0x1c171_22 \<sigma> \<equiv> RIP \<sigma> = 0x1c171 \<and> RAX \<sigma> = qemu_bh_schedule_0x1c1db_retval \<and> RBX \<sigma> = qemu_aio_get_0x1c1a2_retval \<and> RCX \<sigma> = ucast (((ucast (((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word))::32 word) << 9)) \<and> RDX \<sigma> = RDX\<^sub>0 \<and> RDI \<sigma> = qemu_bh_new_0x1c1d3_retval \<and> RSI \<sigma> = qemu_aio_get_0x1c1a2_retval \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x38) \<and> RBP \<sigma> = RDI\<^sub>0 \<and> R13 \<sigma> = RSI\<^sub>0 \<and> R12 \<sigma> = RDX\<^sub>0 \<and> R9 \<sigma> = R9\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x2c),4]::32 word) = ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = 0x1c1e0\<close>
declare Q_0x1c171_22_def[Qs]

schematic_goal raw_aio_cancel_0_1_0x1c1e0_0x1c1e0_22[blocks]:
  assumes \<open>(P_0x1c1e0_22 && P_0x1c1e0_22_regions) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x1c1e0 22 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x1c171_22 ?\<sigma> \<and> block_usage P_0x1c1e0_22_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x1c1e0_22_def P_0x1c1e0_22_regions_def post: Q_0x1c171_22_def regionset: P_0x1c1e0_22_regions_set_def)

definition P_0x1c171_23 :: state_pred where
  \<open>P_0x1c171_23 \<sigma> \<equiv> RIP \<sigma> = 0x1c171 \<and> RAX \<sigma> = qemu_bh_schedule_0x1c1db_retval \<and> RBX \<sigma> = qemu_aio_get_0x1c1a2_retval \<and> RCX \<sigma> = ucast (((ucast (((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word))::32 word) << 9)) \<and> RDX \<sigma> = RDX\<^sub>0 \<and> RDI \<sigma> = qemu_bh_new_0x1c1d3_retval \<and> RSI \<sigma> = qemu_aio_get_0x1c1a2_retval \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x38) \<and> RBP \<sigma> = RDI\<^sub>0 \<and> R13 \<sigma> = RSI\<^sub>0 \<and> R12 \<sigma> = RDX\<^sub>0 \<and> R9 \<sigma> = R9\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x2c),4]::32 word) = ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = 0x1c1e0\<close>
declare P_0x1c171_23_def[Ps]

definition P_0x1c171_23_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x1c171_23_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((RDI\<^sub>0::64 word) + 0x40), 8),
    (2, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x2c), 4),
    (8, ((RSP\<^sub>0::64 word) - 0x40), 8)
  }\<close>

definition P_0x1c171_23_regions :: state_pred where
  \<open>P_0x1c171_23_regions \<sigma> \<equiv> \<exists>regions. P_0x1c171_23_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_ret_address_23 :: state_pred where
  \<open>Q_ret_address_23 \<sigma> \<equiv> RIP \<sigma> = ret_address \<and> RBX \<sigma> = RBX\<^sub>0 \<and> RDX \<sigma> = RDX\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) + 0x8) \<and> RBP \<sigma> = RBP\<^sub>0 \<and> R13 \<sigma> = R13\<^sub>0 \<and> R12 \<sigma> = R12\<^sub>0 \<and> R9 \<sigma> = R9\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBX\<^sub>0\<close>
declare Q_ret_address_23_def[Qs]

schematic_goal raw_aio_cancel_0_7_0x1c171_0x1c17e_23[blocks]:
  assumes \<open>(P_0x1c171_23 && P_0x1c171_23_regions) \<sigma>\<close>
  shows \<open>exec_block 7 0x1c17e 23 \<sigma> \<triangleq> ?\<sigma> \<and> Q_ret_address_23 ?\<sigma> \<and> block_usage P_0x1c171_23_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x1c171_23_def P_0x1c171_23_regions_def post: Q_ret_address_23_def regionset: P_0x1c171_23_regions_set_def)

definition P_0x1c14c_false_24 :: state_pred where
  \<open>P_0x1c14c_false_24 \<sigma> \<equiv> RIP \<sigma> = 0x1c14c \<and> RAX \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> RBX \<sigma> = RBX\<^sub>0 \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = RDX\<^sub>0 \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x38) \<and> RBP \<sigma> = RDI\<^sub>0 \<and> R13 \<sigma> = RSI\<^sub>0 \<and> R12 \<sigma> = RDX\<^sub>0 \<and> R9 \<sigma> = R9\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBX\<^sub>0\<close>
declare P_0x1c14c_false_24_def[Ps]

definition P_0x1c14c_false_24_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x1c14c_false_24_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((RDI\<^sub>0::64 word) + 0x40), 8),
    (2, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x20), 8)
  }\<close>

definition P_0x1c14c_false_24_regions :: state_pred where
  \<open>P_0x1c14c_false_24_regions \<sigma> \<equiv> \<exists>regions. P_0x1c14c_false_24_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x1c157_24 :: state_pred where
  \<open>Q_0x1c157_24 \<sigma> \<equiv> RIP \<sigma> = 0x1c157 \<and> RAX \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> RBX \<sigma> = RBX\<^sub>0 \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = RDX\<^sub>0 \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x38) \<and> RBP \<sigma> = RDI\<^sub>0 \<and> R13 \<sigma> = RSI\<^sub>0 \<and> R12 \<sigma> = RDX\<^sub>0 \<and> R9 \<sigma> = R9\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBX\<^sub>0\<close>
declare Q_0x1c157_24_def[Qs]

schematic_goal raw_aio_cancel_0_4_0x1c14c_0x1c154_24[blocks]:
  assumes \<open>(P_0x1c14c_false_24 && P_0x1c14c_false_24_regions && ! !ZF) \<sigma>\<close>
  shows \<open>exec_block 4 0x1c154 24 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x1c157_24 ?\<sigma> \<and> block_usage P_0x1c14c_false_24_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x1c14c_false_24_def P_0x1c14c_false_24_regions_def post: Q_0x1c157_24_def regionset: P_0x1c14c_false_24_regions_set_def)

definition P_0x1c157_25 :: state_pred where
  \<open>P_0x1c157_25 \<sigma> \<equiv> RIP \<sigma> = 0x1c157 \<and> RAX \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> RBX \<sigma> = RBX\<^sub>0 \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = RDX\<^sub>0 \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x38) \<and> RBP \<sigma> = RDI\<^sub>0 \<and> R13 \<sigma> = RSI\<^sub>0 \<and> R12 \<sigma> = RDX\<^sub>0 \<and> R9 \<sigma> = R9\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBX\<^sub>0\<close>
declare P_0x1c157_25_def[Ps]

definition P_0x1c157_25_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x1c157_25_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((RDI\<^sub>0::64 word) + 0x40), 8),
    (2, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x40), 8)
  }\<close>

definition P_0x1c157_25_regions :: state_pred where
  \<open>P_0x1c157_25_regions \<sigma> \<equiv> \<exists>regions. P_0x1c157_25_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x1b8c0_0x1c157_25 :: state_pred where
  \<open>Q_0x1b8c0_0x1c157_25 \<sigma> \<equiv> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x40) \<and> RIP \<sigma> = 0x1b8c0 \<and> RAX \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> RBX \<sigma> = RBX\<^sub>0 \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = RDX\<^sub>0 \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RBP \<sigma> = RDI\<^sub>0 \<and> R13 \<sigma> = RSI\<^sub>0 \<and> R12 \<sigma> = RDX\<^sub>0 \<and> R9 \<sigma> = R9\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = 0x1c15c\<close>
declare Q_0x1b8c0_0x1c157_25_def[Qs]

schematic_goal raw_aio_cancel_0_1_0x1c157_0x1c157_25[blocks]:
  assumes \<open>(P_0x1c157_25 && P_0x1c157_25_regions) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x1c157 25 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x1b8c0_0x1c157_25 ?\<sigma> \<and> block_usage P_0x1c157_25_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x1c157_25_def P_0x1c157_25_regions_def post: Q_0x1b8c0_0x1c157_25_def regionset: P_0x1c157_25_regions_set_def)

definition P_0x1c15c_26 :: state_pred where
  \<open>P_0x1c15c_26 \<sigma> \<equiv> RIP \<sigma> = 0x1c15c \<and> RAX \<sigma> = raw_aio_setup_0x1c157_retval \<and> RBX \<sigma> = RBX\<^sub>0 \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = RDX\<^sub>0 \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x38) \<and> RBP \<sigma> = RDI\<^sub>0 \<and> R13 \<sigma> = RSI\<^sub>0 \<and> R12 \<sigma> = RDX\<^sub>0 \<and> R9 \<sigma> = R9\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = 0x1c15c\<close>
declare P_0x1c15c_26_def[Ps]

definition P_0x1c15c_26_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x1c15c_26_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((RDI\<^sub>0::64 word) + 0x40), 8),
    (2, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x40), 8)
  }\<close>

definition P_0x1c15c_26_regions :: state_pred where
  \<open>P_0x1c15c_26_regions \<sigma> \<equiv> \<exists>regions. P_0x1c15c_26_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x1c162_26 :: state_pred where
  \<open>Q_0x1c162_26 \<sigma> \<equiv> RIP \<sigma> = 0x1c162 \<and> RAX \<sigma> = raw_aio_setup_0x1c157_retval \<and> RBX \<sigma> = raw_aio_setup_0x1c157_retval \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = RDX\<^sub>0 \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x38) \<and> RBP \<sigma> = RDI\<^sub>0 \<and> R13 \<sigma> = RSI\<^sub>0 \<and> R12 \<sigma> = RDX\<^sub>0 \<and> R9 \<sigma> = R9\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = 0x1c15c\<close>
declare Q_0x1c162_26_def[Qs]

schematic_goal raw_aio_cancel_0_2_0x1c15c_0x1c15f_26[blocks]:
  assumes \<open>(P_0x1c15c_26 && P_0x1c15c_26_regions) \<sigma>\<close>
  shows \<open>exec_block 2 0x1c15f 26 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x1c162_26 ?\<sigma> \<and> block_usage P_0x1c15c_26_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x1c15c_26_def P_0x1c15c_26_regions_def post: Q_0x1c162_26_def regionset: P_0x1c15c_26_regions_set_def)

definition P_0x1c162_true_27 :: state_pred where
  \<open>P_0x1c162_true_27 \<sigma> \<equiv> RIP \<sigma> = 0x1c162 \<and> RAX \<sigma> = raw_aio_setup_0x1c157_retval \<and> RBX \<sigma> = raw_aio_setup_0x1c157_retval \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = RDX\<^sub>0 \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x38) \<and> RBP \<sigma> = RDI\<^sub>0 \<and> R13 \<sigma> = RSI\<^sub>0 \<and> R12 \<sigma> = RDX\<^sub>0 \<and> R9 \<sigma> = R9\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = 0x1c15c\<close>
declare P_0x1c162_true_27_def[Ps]

definition P_0x1c162_true_27_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x1c162_true_27_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((RDI\<^sub>0::64 word) + 0x40), 8),
    (2, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x40), 8)
  }\<close>

definition P_0x1c162_true_27_regions :: state_pred where
  \<open>P_0x1c162_true_27_regions \<sigma> \<equiv> \<exists>regions. P_0x1c162_true_27_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_ret_address_27 :: state_pred where
  \<open>Q_ret_address_27 \<sigma> \<equiv> RIP \<sigma> = ret_address \<and> RBX \<sigma> = RBX\<^sub>0 \<and> RDX \<sigma> = RDX\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) + 0x8) \<and> RBP \<sigma> = RBP\<^sub>0 \<and> R13 \<sigma> = R13\<^sub>0 \<and> R12 \<sigma> = R12\<^sub>0 \<and> R9 \<sigma> = R9\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBX\<^sub>0\<close>
declare Q_ret_address_27_def[Qs]

schematic_goal raw_aio_cancel_0_9_0x1c162_0x1c18f_27[blocks]:
  assumes \<open>(P_0x1c162_true_27 && P_0x1c162_true_27_regions && ZF) \<sigma>\<close>
  shows \<open>exec_block 9 0x1c18f 27 \<sigma> \<triangleq> ?\<sigma> \<and> Q_ret_address_27 ?\<sigma> \<and> block_usage P_0x1c162_true_27_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x1c162_true_27_def P_0x1c162_true_27_regions_def post: Q_ret_address_27_def regionset: P_0x1c162_true_27_regions_set_def)

definition P_0x1c162_false_28 :: state_pred where
  \<open>P_0x1c162_false_28 \<sigma> \<equiv> RIP \<sigma> = 0x1c162 \<and> RAX \<sigma> = raw_aio_setup_0x1c157_retval \<and> RBX \<sigma> = raw_aio_setup_0x1c157_retval \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = RDX\<^sub>0 \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x38) \<and> RBP \<sigma> = RDI\<^sub>0 \<and> R13 \<sigma> = RSI\<^sub>0 \<and> R12 \<sigma> = RDX\<^sub>0 \<and> R9 \<sigma> = R9\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = 0x1c15c\<close>
declare P_0x1c162_false_28_def[Ps]

definition P_0x1c162_false_28_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x1c162_false_28_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((RDI\<^sub>0::64 word) + 0x40), 8),
    (2, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x40), 8)
  }\<close>

definition P_0x1c162_false_28_regions :: state_pred where
  \<open>P_0x1c162_false_28_regions \<sigma> \<equiv> \<exists>regions. P_0x1c162_false_28_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x1c168_28 :: state_pred where
  \<open>Q_0x1c168_28 \<sigma> \<equiv> RIP \<sigma> = 0x1c168 \<and> RAX \<sigma> = raw_aio_setup_0x1c157_retval \<and> RBX \<sigma> = raw_aio_setup_0x1c157_retval \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = RDX\<^sub>0 \<and> RDI \<sigma> = ((raw_aio_setup_0x1c157_retval::64 word) + 0x28) \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x38) \<and> RBP \<sigma> = RDI\<^sub>0 \<and> R13 \<sigma> = RSI\<^sub>0 \<and> R12 \<sigma> = RDX\<^sub>0 \<and> R9 \<sigma> = R9\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = 0x1c15c\<close>
declare Q_0x1c168_28_def[Qs]

schematic_goal raw_aio_cancel_0_2_0x1c162_0x1c164_28[blocks]:
  assumes \<open>(P_0x1c162_false_28 && P_0x1c162_false_28_regions && ! ZF) \<sigma>\<close>
  shows \<open>exec_block 2 0x1c164 28 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x1c168_28 ?\<sigma> \<and> block_usage P_0x1c162_false_28_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x1c162_false_28_def P_0x1c162_false_28_regions_def post: Q_0x1c168_28_def regionset: P_0x1c162_false_28_regions_set_def)

definition P_0x1c168_29 :: state_pred where
  \<open>P_0x1c168_29 \<sigma> \<equiv> RIP \<sigma> = 0x1c168 \<and> RAX \<sigma> = raw_aio_setup_0x1c157_retval \<and> RBX \<sigma> = raw_aio_setup_0x1c157_retval \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = RDX\<^sub>0 \<and> RDI \<sigma> = ((raw_aio_setup_0x1c157_retval::64 word) + 0x28) \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x38) \<and> RBP \<sigma> = RDI\<^sub>0 \<and> R13 \<sigma> = RSI\<^sub>0 \<and> R12 \<sigma> = RDX\<^sub>0 \<and> R9 \<sigma> = R9\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = 0x1c15c\<close>
declare P_0x1c168_29_def[Ps]

definition P_0x1c168_29_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x1c168_29_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((RDI\<^sub>0::64 word) + 0x40), 8),
    (2, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x40), 8)
  }\<close>

definition P_0x1c168_29_regions :: state_pred where
  \<open>P_0x1c168_29_regions \<sigma> \<equiv> \<exists>regions. P_0x1c168_29_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_qemu_paio_write_addr_0x1c168_29 :: state_pred where
  \<open>Q_qemu_paio_write_addr_0x1c168_29 \<sigma> \<equiv> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x40) \<and> RIP \<sigma> = qemu_paio_write_addr \<and> RAX \<sigma> = raw_aio_setup_0x1c157_retval \<and> RBX \<sigma> = raw_aio_setup_0x1c157_retval \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = RDX\<^sub>0 \<and> RDI \<sigma> = ((raw_aio_setup_0x1c157_retval::64 word) + 0x28) \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RBP \<sigma> = RDI\<^sub>0 \<and> R13 \<sigma> = RSI\<^sub>0 \<and> R12 \<sigma> = RDX\<^sub>0 \<and> R9 \<sigma> = R9\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = 0x1c16d\<close>
declare Q_qemu_paio_write_addr_0x1c168_29_def[Qs]

schematic_goal raw_aio_cancel_0_1_0x1c168_0x1c168_29[blocks]:
  assumes \<open>(P_0x1c168_29 && P_0x1c168_29_regions) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x1c168 29 \<sigma> \<triangleq> ?\<sigma> \<and> Q_qemu_paio_write_addr_0x1c168_29 ?\<sigma> \<and> block_usage P_0x1c168_29_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x1c168_29_def P_0x1c168_29_regions_def post: Q_qemu_paio_write_addr_0x1c168_29_def regionset: P_0x1c168_29_regions_set_def)

definition P_0x1c16d_30 :: state_pred where
  \<open>P_0x1c16d_30 \<sigma> \<equiv> RIP \<sigma> = 0x1c16d \<and> RAX \<sigma> = qemu_paio_write_0x1c168_retval \<and> RBX \<sigma> = raw_aio_setup_0x1c157_retval \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = RDX\<^sub>0 \<and> RDI \<sigma> = ((raw_aio_setup_0x1c157_retval::64 word) + 0x28) \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x38) \<and> RBP \<sigma> = RDI\<^sub>0 \<and> R13 \<sigma> = RSI\<^sub>0 \<and> R12 \<sigma> = RDX\<^sub>0 \<and> R9 \<sigma> = R9\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = 0x1c16d\<close>
declare P_0x1c16d_30_def[Ps]

definition P_0x1c16d_30_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x1c16d_30_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((RDI\<^sub>0::64 word) + 0x40), 8),
    (2, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x40), 8)
  }\<close>

definition P_0x1c16d_30_regions :: state_pred where
  \<open>P_0x1c16d_30_regions \<sigma> \<equiv> \<exists>regions. P_0x1c16d_30_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x1c16f_30 :: state_pred where
  \<open>Q_0x1c16f_30 \<sigma> \<equiv> RIP \<sigma> = 0x1c16f \<and> RAX \<sigma> = qemu_paio_write_0x1c168_retval \<and> RBX \<sigma> = raw_aio_setup_0x1c157_retval \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = RDX\<^sub>0 \<and> RDI \<sigma> = ((raw_aio_setup_0x1c157_retval::64 word) + 0x28) \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x38) \<and> RBP \<sigma> = RDI\<^sub>0 \<and> R13 \<sigma> = RSI\<^sub>0 \<and> R12 \<sigma> = RDX\<^sub>0 \<and> R9 \<sigma> = R9\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = 0x1c16d\<close>
declare Q_0x1c16f_30_def[Qs]

schematic_goal raw_aio_cancel_0_1_0x1c16d_0x1c16d_30[blocks]:
  assumes \<open>(P_0x1c16d_30 && P_0x1c16d_30_regions) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x1c16d 30 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x1c16f_30 ?\<sigma> \<and> block_usage P_0x1c16d_30_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x1c16d_30_def P_0x1c16d_30_regions_def post: Q_0x1c16f_30_def regionset: P_0x1c16d_30_regions_set_def)

definition P_0x1c16f_true_31 :: state_pred where
  \<open>P_0x1c16f_true_31 \<sigma> \<equiv> RIP \<sigma> = 0x1c16f \<and> RAX \<sigma> = qemu_paio_write_0x1c168_retval \<and> RBX \<sigma> = raw_aio_setup_0x1c157_retval \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = RDX\<^sub>0 \<and> RDI \<sigma> = ((raw_aio_setup_0x1c157_retval::64 word) + 0x28) \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x38) \<and> RBP \<sigma> = RDI\<^sub>0 \<and> R13 \<sigma> = RSI\<^sub>0 \<and> R12 \<sigma> = RDX\<^sub>0 \<and> R9 \<sigma> = R9\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = 0x1c16d\<close>
declare P_0x1c16f_true_31_def[Ps]

definition P_0x1c16f_true_31_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x1c16f_true_31_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((RDI\<^sub>0::64 word) + 0x40), 8),
    (2, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x40), 8)
  }\<close>

definition P_0x1c16f_true_31_regions :: state_pred where
  \<open>P_0x1c16f_true_31_regions \<sigma> \<equiv> \<exists>regions. P_0x1c16f_true_31_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x1c1ed_31 :: state_pred where
  \<open>Q_0x1c1ed_31 \<sigma> \<equiv> RIP \<sigma> = 0x1c1ed \<and> RAX \<sigma> = qemu_paio_write_0x1c168_retval \<and> RBX \<sigma> = 0x0 \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = RDX\<^sub>0 \<and> RDI \<sigma> = raw_aio_setup_0x1c157_retval \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x38) \<and> RBP \<sigma> = RDI\<^sub>0 \<and> R13 \<sigma> = RSI\<^sub>0 \<and> R12 \<sigma> = RDX\<^sub>0 \<and> R9 \<sigma> = R9\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = 0x1c16d\<close>
declare Q_0x1c1ed_31_def[Qs]

schematic_goal raw_aio_cancel_0_3_0x1c16f_0x1c1eb_31[blocks]:
  assumes \<open>(P_0x1c16f_true_31 && P_0x1c16f_true_31_regions && SF) \<sigma>\<close>
  shows \<open>exec_block 3 0x1c1eb 31 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x1c1ed_31 ?\<sigma> \<and> block_usage P_0x1c16f_true_31_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x1c16f_true_31_def P_0x1c16f_true_31_regions_def post: Q_0x1c1ed_31_def regionset: P_0x1c16f_true_31_regions_set_def)

definition P_0x1c1ed_32 :: state_pred where
  \<open>P_0x1c1ed_32 \<sigma> \<equiv> RIP \<sigma> = 0x1c1ed \<and> RAX \<sigma> = qemu_paio_write_0x1c168_retval \<and> RBX \<sigma> = 0x0 \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = RDX\<^sub>0 \<and> RDI \<sigma> = raw_aio_setup_0x1c157_retval \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x38) \<and> RBP \<sigma> = RDI\<^sub>0 \<and> R13 \<sigma> = RSI\<^sub>0 \<and> R12 \<sigma> = RDX\<^sub>0 \<and> R9 \<sigma> = R9\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = 0x1c16d\<close>
declare P_0x1c1ed_32_def[Ps]

definition P_0x1c1ed_32_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x1c1ed_32_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((RDI\<^sub>0::64 word) + 0x40), 8),
    (2, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x40), 8)
  }\<close>

definition P_0x1c1ed_32_regions :: state_pred where
  \<open>P_0x1c1ed_32_regions \<sigma> \<equiv> \<exists>regions. P_0x1c1ed_32_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x1c020_0x1c1ed_32 :: state_pred where
  \<open>Q_0x1c020_0x1c1ed_32 \<sigma> \<equiv> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x40) \<and> RIP \<sigma> = 0x1c020 \<and> RAX \<sigma> = qemu_paio_write_0x1c168_retval \<and> RBX \<sigma> = 0x0 \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = RDX\<^sub>0 \<and> RDI \<sigma> = raw_aio_setup_0x1c157_retval \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RBP \<sigma> = RDI\<^sub>0 \<and> R13 \<sigma> = RSI\<^sub>0 \<and> R12 \<sigma> = RDX\<^sub>0 \<and> R9 \<sigma> = R9\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = 0x1c1f2\<close>
declare Q_0x1c020_0x1c1ed_32_def[Qs]

schematic_goal raw_aio_cancel_0_1_0x1c1ed_0x1c1ed_32[blocks]:
  assumes \<open>(P_0x1c1ed_32 && P_0x1c1ed_32_regions) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x1c1ed 32 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x1c020_0x1c1ed_32 ?\<sigma> \<and> block_usage P_0x1c1ed_32_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x1c1ed_32_def P_0x1c1ed_32_regions_def post: Q_0x1c020_0x1c1ed_32_def regionset: P_0x1c1ed_32_regions_set_def)

definition P_0x1c1f2_33 :: state_pred where
  \<open>P_0x1c1f2_33 \<sigma> \<equiv> RIP \<sigma> = 0x1c1f2 \<and> RAX \<sigma> = raw_aio_remove_0x1c1ed_retval \<and> RBX \<sigma> = 0x0 \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = RDX\<^sub>0 \<and> RDI \<sigma> = raw_aio_setup_0x1c157_retval \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x38) \<and> RBP \<sigma> = RDI\<^sub>0 \<and> R13 \<sigma> = RSI\<^sub>0 \<and> R12 \<sigma> = RDX\<^sub>0 \<and> R9 \<sigma> = R9\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = 0x1c1f2\<close>
declare P_0x1c1f2_33_def[Ps]

definition P_0x1c1f2_33_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x1c1f2_33_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((RDI\<^sub>0::64 word) + 0x40), 8),
    (2, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x40), 8)
  }\<close>

definition P_0x1c1f2_33_regions :: state_pred where
  \<open>P_0x1c1f2_33_regions \<sigma> \<equiv> \<exists>regions. P_0x1c1f2_33_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x1c171_33 :: state_pred where
  \<open>Q_0x1c171_33 \<sigma> \<equiv> RIP \<sigma> = 0x1c171 \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = RDX\<^sub>0 \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x38) \<and> RBP \<sigma> = RDI\<^sub>0 \<and> R13 \<sigma> = RSI\<^sub>0 \<and> R12 \<sigma> = RDX\<^sub>0 \<and> R9 \<sigma> = R9\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBX\<^sub>0\<close>
declare Q_0x1c171_33_def[Qs]

schematic_goal raw_aio_cancel_0_1_0x1c1f2_0x1c1f2_33[blocks]:
  assumes \<open>(P_0x1c1f2_33 && P_0x1c1f2_33_regions) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x1c1f2 33 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x1c171_33 ?\<sigma> \<and> block_usage P_0x1c1f2_33_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x1c1f2_33_def P_0x1c1f2_33_regions_def post: Q_0x1c171_33_def regionset: P_0x1c1f2_33_regions_set_def)

definition P_0x1c16f_false_34 :: state_pred where
  \<open>P_0x1c16f_false_34 \<sigma> \<equiv> RIP \<sigma> = 0x1c16f \<and> RAX \<sigma> = qemu_paio_write_0x1c168_retval \<and> RBX \<sigma> = raw_aio_setup_0x1c157_retval \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = RDX\<^sub>0 \<and> RDI \<sigma> = ((raw_aio_setup_0x1c157_retval::64 word) + 0x28) \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x38) \<and> RBP \<sigma> = RDI\<^sub>0 \<and> R13 \<sigma> = RSI\<^sub>0 \<and> R12 \<sigma> = RDX\<^sub>0 \<and> R9 \<sigma> = R9\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = 0x1c16d\<close>
declare P_0x1c16f_false_34_def[Ps]

definition P_0x1c16f_false_34_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x1c16f_false_34_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((RDI\<^sub>0::64 word) + 0x40), 8),
    (2, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x40), 8)
  }\<close>

definition P_0x1c16f_false_34_regions :: state_pred where
  \<open>P_0x1c16f_false_34_regions \<sigma> \<equiv> \<exists>regions. P_0x1c16f_false_34_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x1c171_34 :: state_pred where
  \<open>Q_0x1c171_34 \<sigma> \<equiv> RIP \<sigma> = 0x1c171 \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = RDX\<^sub>0 \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x38) \<and> RBP \<sigma> = RDI\<^sub>0 \<and> R13 \<sigma> = RSI\<^sub>0 \<and> R12 \<sigma> = RDX\<^sub>0 \<and> R9 \<sigma> = R9\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBX\<^sub>0\<close>
declare Q_0x1c171_34_def[Qs]

schematic_goal raw_aio_cancel_0_1_0x1c16f_0x1c16f_34[blocks]:
  assumes \<open>(P_0x1c16f_false_34 && P_0x1c16f_false_34_regions && ! SF) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x1c16f 34 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x1c171_34 ?\<sigma> \<and> block_usage P_0x1c16f_false_34_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x1c16f_false_34_def P_0x1c16f_false_34_regions_def post: Q_0x1c171_34_def regionset: P_0x1c16f_false_34_regions_set_def)

definition P_0x1c171_35 :: state_pred where
  \<open>P_0x1c171_35 \<sigma> \<equiv> RIP \<sigma> = 0x1c171 \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = RDX\<^sub>0 \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x38) \<and> RBP \<sigma> = RDI\<^sub>0 \<and> R13 \<sigma> = RSI\<^sub>0 \<and> R12 \<sigma> = RDX\<^sub>0 \<and> R9 \<sigma> = R9\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBX\<^sub>0\<close>
declare P_0x1c171_35_def[Ps]

definition P_0x1c171_35_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x1c171_35_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((RDI\<^sub>0::64 word) + 0x40), 8),
    (2, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x20), 8)
  }\<close>

definition P_0x1c171_35_regions :: state_pred where
  \<open>P_0x1c171_35_regions \<sigma> \<equiv> \<exists>regions. P_0x1c171_35_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_ret_address_35 :: state_pred where
  \<open>Q_ret_address_35 \<sigma> \<equiv> RIP \<sigma> = ret_address \<and> RBX \<sigma> = RBX\<^sub>0 \<and> RDX \<sigma> = RDX\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) + 0x8) \<and> RBP \<sigma> = RBP\<^sub>0 \<and> R13 \<sigma> = R13\<^sub>0 \<and> R12 \<sigma> = R12\<^sub>0 \<and> R9 \<sigma> = R9\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBX\<^sub>0\<close>
declare Q_ret_address_35_def[Qs]

schematic_goal raw_aio_cancel_0_7_0x1c171_0x1c17e_35[blocks]:
  assumes \<open>(P_0x1c171_35 && P_0x1c171_35_regions) \<sigma>\<close>
  shows \<open>exec_block 7 0x1c17e 35 \<sigma> \<triangleq> ?\<sigma> \<and> Q_ret_address_35 ?\<sigma> \<and> block_usage P_0x1c171_35_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x1c171_35_def P_0x1c171_35_regions_def post: Q_ret_address_35_def regionset: P_0x1c171_35_regions_set_def)

interpretation raw_aio_setup_0x1c157_3: raw_aio_setup _ _ _ _ _ _ _ _ _ _ \<open>(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)\<close> \<open>RBX\<^sub>0\<close> \<open>RCX\<^sub>0\<close> \<open>RDX\<^sub>0\<close> \<open>RDI\<^sub>0\<close> \<open>RSI\<^sub>0\<close> \<open>((RSP\<^sub>0::64 word) - 0x38)\<close> \<open>RDI\<^sub>0\<close> \<open>RSI\<^sub>0\<close> \<open>RDX\<^sub>0\<close> \<open>R9\<^sub>0\<close> \<open>R8\<^sub>0\<close> \<open>0x1c157\<close>
  by unfold_locales

interpretation raw_aio_remove_0x1c1ed_10: raw_aio_remove _ _ _ _ _ _ _ _ _ _ \<open>qemu_paio_write_0x1c168_retval\<close> \<open>0x0\<close> \<open>RCX\<^sub>0\<close> \<open>RDX\<^sub>0\<close> \<open>raw_aio_setup_0x1c157_retval\<close> \<open>RSI\<^sub>0\<close> \<open>((RSP\<^sub>0::64 word) - 0x38)\<close> \<open>RDI\<^sub>0\<close> \<open>RSI\<^sub>0\<close> \<open>RDX\<^sub>0\<close> \<open>R9\<^sub>0\<close> \<open>R8\<^sub>0\<close> \<open>0x1c1ed\<close>
  by unfold_locales

(* These interpretations don't seem to work, possibly because of having the same arguments as the above
interpretation raw_aio_setup_0x1c157_25: raw_aio_setup _ _ _ _ _ _ _ _ _ _ \<open>(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)\<close> \<open>RBX\<^sub>0\<close> \<open>RCX\<^sub>0\<close> \<open>RDX\<^sub>0\<close> \<open>RDI\<^sub>0\<close> \<open>RSI\<^sub>0\<close> \<open>((RSP\<^sub>0::64 word) - 0x38)\<close> \<open>RDI\<^sub>0\<close> \<open>RSI\<^sub>0\<close> \<open>RDX\<^sub>0\<close> \<open>R9\<^sub>0\<close> \<open>R8\<^sub>0\<close> \<open>0x1c157\<close>
  by unfold_locales

interpretation raw_aio_remove_0x1c1ed_32: raw_aio_remove _ _ _ _ _ _ _ _ _ _ \<open>qemu_paio_write_0x1c168_retval\<close> \<open>0x0\<close> \<open>RCX\<^sub>0\<close> \<open>RDX\<^sub>0\<close> \<open>raw_aio_setup_0x1c157_retval\<close> \<open>RSI\<^sub>0\<close> \<open>((RSP\<^sub>0::64 word) - 0x38)\<close> \<open>RDI\<^sub>0\<close> \<open>RSI\<^sub>0\<close> \<open>RDX\<^sub>0\<close> \<open>R9\<^sub>0\<close> \<open>R8\<^sub>0\<close> \<open>0x1c1ed\<close>
  by unfold_locales
*)

definition raw_aio_cancel_acode :: ACode where
  \<open>raw_aio_cancel_acode =
    Block 10 0x1c147 0;
    IF !ZF THEN
      Block 2 0x1c190 (Suc 0);
      IF ZF THEN
        Block 4 0x1c154 2;
        Block (Suc 0) 0x1c157 3;
        CALL raw_aio_setup_0x1c157_3.raw_aio_setup_acode;
        Block 2 0x1c15f 4;
        IF ZF THEN
          Block 9 0x1c18f 5
        ELSE
          Block 2 0x1c164 6;
          Block (Suc 0) 0x1c168 7;
          CALL qemu_paio_write_acode;
          Block (Suc 0) 0x1c16d 8;
          IF SF THEN
            Block 3 0x1c1eb 9;
            Block (Suc 0) 0x1c1ed 10;
            CALL raw_aio_remove_0x1c1ed_10.raw_aio_remove_acode;
            Block (Suc 0) 0x1c1f2 11
          ELSE
            Block (Suc 0) 0x1c16f 12
          FI;
          Block 7 0x1c17e 13
        FI
      ELSE
        Block 4 0x1c19e 14;
        Block (Suc 0) 0x1c1a2 15;
        CALL qemu_aio_get_acode;
        Block 7 0x1c1bb 16;
        Block (Suc 0) 0x1c1be 17;
        CALL raw_pwrite_acode;
        Block 3 0x1c1cd 18;
        Block (Suc 0) 0x1c1d3 19;
        CALL qemu_bh_new_acode;
        Block (Suc 0) 0x1c1d8 20;
        Block (Suc 0) 0x1c1db 21;
        CALL qemu_bh_schedule_acode;
        Block (Suc 0) 0x1c1e0 22;
        Block 7 0x1c17e 23
      FI
    ELSE
      Block 4 0x1c154 24;
      Block (Suc 0) 0x1c157 25;
      CALL raw_aio_setup_0x1c157_3.raw_aio_setup_acode; (* originally aw_aio_setup_0x1c157_25 *)
      Block 2 0x1c15f 26;
      IF ZF THEN
        Block 9 0x1c18f 27
      ELSE
        Block 2 0x1c164 28;
        Block (Suc 0) 0x1c168 29;
        CALL qemu_paio_write_acode;
        Block (Suc 0) 0x1c16d 30;
        IF SF THEN
          Block 3 0x1c1eb 31;
          Block (Suc 0) 0x1c1ed 32;
          CALL raw_aio_remove_0x1c1ed_10.raw_aio_remove_acode; (* originally raw_aio_remove_0x1c1ed_32 *)
          Block (Suc 0) 0x1c1f2 33
        ELSE
          Block (Suc 0) 0x1c16f 34
        FI;
        Block 7 0x1c17e 35
      FI
    FI
  \<close>

schematic_goal "raw_aio_cancel":
  assumes
    \<open>\<forall>\<sigma>. RIP \<sigma> = 0x1c14c \<longrightarrow> P_0x1c14c_true_1_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x1c196 \<longrightarrow> P_0x1c196_true_2_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x1c157 \<longrightarrow> P_0x1c157_3_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x1c15c \<longrightarrow> P_0x1c15c_4_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x1c162 \<longrightarrow> P_0x1c162_true_5_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x1c162 \<longrightarrow> P_0x1c162_false_6_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x1c168 \<longrightarrow> P_0x1c168_7_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x1c16d \<longrightarrow> P_0x1c16d_8_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x1c16f \<longrightarrow> P_0x1c16f_true_9_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x1c1ed \<longrightarrow> P_0x1c1ed_10_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x1c1f2 \<longrightarrow> P_0x1c1f2_11_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x1c16f \<longrightarrow> P_0x1c16f_false_12_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x1c171 \<longrightarrow> P_0x1c171_13_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x1c196 \<longrightarrow> P_0x1c196_false_14_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x1c1a2 \<longrightarrow> P_0x1c1a2_15_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x1c1a7 \<longrightarrow> P_0x1c1a7_16_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x1c1be \<longrightarrow> P_0x1c1be_17_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x1c1c3 \<longrightarrow> P_0x1c1c3_18_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x1c1d3 \<longrightarrow> P_0x1c1d3_19_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x1c1d8 \<longrightarrow> P_0x1c1d8_20_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x1c1db \<longrightarrow> P_0x1c1db_21_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x1c1e0 \<longrightarrow> P_0x1c1e0_22_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x1c171 \<longrightarrow> P_0x1c171_23_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x1c14c \<longrightarrow> P_0x1c14c_false_24_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x1c157 \<longrightarrow> P_0x1c157_25_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x1c15c \<longrightarrow> P_0x1c15c_26_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x1c162 \<longrightarrow> P_0x1c162_true_27_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x1c162 \<longrightarrow> P_0x1c162_false_28_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x1c168 \<longrightarrow> P_0x1c168_29_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x1c16d \<longrightarrow> P_0x1c16d_30_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x1c16f \<longrightarrow> P_0x1c16f_true_31_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x1c1ed \<longrightarrow> P_0x1c1ed_32_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x1c1f2 \<longrightarrow> P_0x1c1f2_33_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x1c16f \<longrightarrow> P_0x1c16f_false_34_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x1c171 \<longrightarrow> P_0x1c171_35_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x1b8c0 \<longrightarrow> raw_aio_setup_0x1c157_3.P_0x1b8c0_0_regions \<sigma>\<close> (* manually adjusted *)
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x1c020 \<longrightarrow> raw_aio_remove_0x1c1ed_10.P_0x1c020_0_regions \<sigma>\<close> (* manually adjusted *)
    and [blocks]: \<open>{{Q_0x1b8c0_0x1c157_3}} \<box>raw_aio_setup_0x1c157_3.raw_aio_setup_acode {{P_0x1c15c_4;M_0x1c157}}\<close>
    and [blocks]: \<open>{{Q_qemu_paio_write_addr_0x1c168_7}} \<box>qemu_paio_write_acode {{P_0x1c16d_8;M_0x1c168}}\<close>
    and [blocks]: \<open>{{Q_0x1c020_0x1c1ed_10}} \<box>raw_aio_remove_0x1c1ed_10.raw_aio_remove_acode {{P_0x1c1f2_11;M_0x1c1ed}}\<close>
    and [blocks]: \<open>{{Q_qemu_aio_get_addr_0x1c1a2_15}} \<box>qemu_aio_get_acode {{P_0x1c1a7_16;M_0x1c1a2}}\<close>
    and [blocks]: \<open>{{Q_raw_pwrite_addr_0x1c1be_17}} \<box>raw_pwrite_acode {{P_0x1c1c3_18;M_0x1c1be}}\<close>
    and [blocks]: \<open>{{Q_qemu_bh_new_addr_0x1c1d3_19}} \<box>qemu_bh_new_acode {{P_0x1c1d8_20;M_0x1c1d3}}\<close>
    and [blocks]: \<open>{{Q_qemu_bh_schedule_addr_0x1c1db_21}} \<box>qemu_bh_schedule_acode {{P_0x1c1e0_22;M_0x1c1db}}\<close>
    and [blocks]: \<open>{{Q_0x1b8c0_0x1c157_25}} \<box>raw_aio_setup_0x1c157_3.raw_aio_setup_acode {{P_0x1c15c_26;M_0x1c157}}\<close> (* originally raw_aio_setup_0x1c157_25 *)
    and [blocks]: \<open>{{Q_qemu_paio_write_addr_0x1c168_29}} \<box>qemu_paio_write_acode {{P_0x1c16d_30;M_0x1c168}}\<close>
    and [blocks]: \<open>{{Q_0x1c020_0x1c1ed_32}} \<box>raw_aio_remove_0x1c1ed_10.raw_aio_remove_acode {{P_0x1c1f2_33;M_0x1c1ed}}\<close> (* originally raw_aio_remove_0x1c1ed_32 *)
  shows \<open>{{?P}} raw_aio_cancel_acode {{?Q;?M}}\<close>
  by (vcg acode: raw_aio_cancel_acode_def assms: assms)

end

locale "raw_aio_read" = "qemu_img_xen" +
  fixes RAX\<^sub>0\<^sub>v RBX\<^sub>0\<^sub>v RCX\<^sub>0\<^sub>v RDX\<^sub>0\<^sub>v RDI\<^sub>0\<^sub>v RSI\<^sub>0\<^sub>v RSP\<^sub>0\<^sub>v RBP\<^sub>0\<^sub>v R13\<^sub>0\<^sub>v R12\<^sub>0\<^sub>v R9\<^sub>0\<^sub>v R8\<^sub>0\<^sub>v ret_address\<^sub>v :: \<open>64 word\<close>
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
definition \<open>R13\<^sub>0 \<equiv> R13\<^sub>0\<^sub>v\<close>
definition \<open>R12\<^sub>0 \<equiv> R12\<^sub>0\<^sub>v\<close>
definition \<open>R9\<^sub>0 \<equiv> R9\<^sub>0\<^sub>v\<close>
definition \<open>R8\<^sub>0 \<equiv> R8\<^sub>0\<^sub>v\<close>
definition \<open>ret_address \<equiv> ret_address\<^sub>v\<close>

definition P_0x1c200_0 :: state_pred where
  \<open>P_0x1c200_0 \<sigma> \<equiv> RIP \<sigma> = 0x1c200 \<and> RAX \<sigma> = RAX\<^sub>0 \<and> RBX \<sigma> = RBX\<^sub>0 \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = RDX\<^sub>0 \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = RSP\<^sub>0 \<and> RBP \<sigma> = RBP\<^sub>0 \<and> R13 \<sigma> = R13\<^sub>0 \<and> R12 \<sigma> = R12\<^sub>0 \<and> R9 \<sigma> = R9\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address\<close>
declare P_0x1c200_0_def[Ps]

definition P_0x1c200_0_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x1c200_0_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((RDI\<^sub>0::64 word) + 0x40), 8),
    (2, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x20), 8)
  }\<close>

definition P_0x1c200_0_regions :: state_pred where
  \<open>P_0x1c200_0_regions \<sigma> \<equiv> \<exists>regions. P_0x1c200_0_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x1c21c_0 :: state_pred where
  \<open>Q_0x1c21c_0 \<sigma> \<equiv> RIP \<sigma> = 0x1c21c \<and> RAX \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> RBX \<sigma> = RBX\<^sub>0 \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = RDX\<^sub>0 \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x38) \<and> RBP \<sigma> = RDI\<^sub>0 \<and> R13 \<sigma> = RSI\<^sub>0 \<and> R12 \<sigma> = RDX\<^sub>0 \<and> R9 \<sigma> = R9\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBX\<^sub>0\<close>
declare Q_0x1c21c_0_def[Qs]

schematic_goal raw_aio_read_0_10_0x1c200_0x1c217_0[blocks]:
  assumes \<open>(P_0x1c200_0 && P_0x1c200_0_regions) \<sigma>\<close>
  shows \<open>exec_block 10 0x1c217 0 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x1c21c_0 ?\<sigma> \<and> block_usage P_0x1c200_0_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x1c200_0_def P_0x1c200_0_regions_def post: Q_0x1c21c_0_def regionset: P_0x1c200_0_regions_set_def)

definition P_0x1c21c_true_1 :: state_pred where
  \<open>P_0x1c21c_true_1 \<sigma> \<equiv> RIP \<sigma> = 0x1c21c \<and> RAX \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> RBX \<sigma> = RBX\<^sub>0 \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = RDX\<^sub>0 \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x38) \<and> RBP \<sigma> = RDI\<^sub>0 \<and> R13 \<sigma> = RSI\<^sub>0 \<and> R12 \<sigma> = RDX\<^sub>0 \<and> R9 \<sigma> = R9\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBX\<^sub>0\<close>
declare P_0x1c21c_true_1_def[Ps]

definition P_0x1c21c_true_1_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x1c21c_true_1_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((RDI\<^sub>0::64 word) + 0x40), 8),
    (2, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x20), 8)
  }\<close>

definition P_0x1c21c_true_1_regions :: state_pred where
  \<open>P_0x1c21c_true_1_regions \<sigma> \<equiv> \<exists>regions. P_0x1c21c_true_1_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x1c266_1 :: state_pred where
  \<open>Q_0x1c266_1 \<sigma> \<equiv> RIP \<sigma> = 0x1c266 \<and> RAX \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> RBX \<sigma> = RBX\<^sub>0 \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = RDX\<^sub>0 \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x38) \<and> RBP \<sigma> = RDI\<^sub>0 \<and> R13 \<sigma> = RSI\<^sub>0 \<and> R12 \<sigma> = RDX\<^sub>0 \<and> R9 \<sigma> = R9\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBX\<^sub>0\<close>
declare Q_0x1c266_1_def[Qs]

schematic_goal raw_aio_read_0_2_0x1c21c_0x1c260_1[blocks]:
  assumes \<open>(P_0x1c21c_true_1 && P_0x1c21c_true_1_regions && !ZF) \<sigma>\<close>
  shows \<open>exec_block 2 0x1c260 (Suc 0) \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x1c266_1 ?\<sigma> \<and> block_usage P_0x1c21c_true_1_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x1c21c_true_1_def P_0x1c21c_true_1_regions_def post: Q_0x1c266_1_def regionset: P_0x1c21c_true_1_regions_set_def)

definition P_0x1c266_true_2 :: state_pred where
  \<open>P_0x1c266_true_2 \<sigma> \<equiv> RIP \<sigma> = 0x1c266 \<and> RAX \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> RBX \<sigma> = RBX\<^sub>0 \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = RDX\<^sub>0 \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x38) \<and> RBP \<sigma> = RDI\<^sub>0 \<and> R13 \<sigma> = RSI\<^sub>0 \<and> R12 \<sigma> = RDX\<^sub>0 \<and> R9 \<sigma> = R9\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBX\<^sub>0\<close>
declare P_0x1c266_true_2_def[Ps]

definition P_0x1c266_true_2_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x1c266_true_2_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((RDI\<^sub>0::64 word) + 0x40), 8),
    (2, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x20), 8)
  }\<close>

definition P_0x1c266_true_2_regions :: state_pred where
  \<open>P_0x1c266_true_2_regions \<sigma> \<equiv> \<exists>regions. P_0x1c266_true_2_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x1c227_2 :: state_pred where
  \<open>Q_0x1c227_2 \<sigma> \<equiv> RIP \<sigma> = 0x1c227 \<and> RAX \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> RBX \<sigma> = RBX\<^sub>0 \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = RDX\<^sub>0 \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x38) \<and> RBP \<sigma> = RDI\<^sub>0 \<and> R13 \<sigma> = RSI\<^sub>0 \<and> R12 \<sigma> = RDX\<^sub>0 \<and> R9 \<sigma> = R9\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBX\<^sub>0\<close>
declare Q_0x1c227_2_def[Qs]

schematic_goal raw_aio_read_0_4_0x1c266_0x1c224_2[blocks]:
  assumes \<open>(P_0x1c266_true_2 && P_0x1c266_true_2_regions && ZF) \<sigma>\<close>
  shows \<open>exec_block 4 0x1c224 2 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x1c227_2 ?\<sigma> \<and> block_usage P_0x1c266_true_2_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x1c266_true_2_def P_0x1c266_true_2_regions_def post: Q_0x1c227_2_def regionset: P_0x1c266_true_2_regions_set_def)

definition P_0x1c227_3 :: state_pred where
  \<open>P_0x1c227_3 \<sigma> \<equiv> RIP \<sigma> = 0x1c227 \<and> RAX \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> RBX \<sigma> = RBX\<^sub>0 \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = RDX\<^sub>0 \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x38) \<and> RBP \<sigma> = RDI\<^sub>0 \<and> R13 \<sigma> = RSI\<^sub>0 \<and> R12 \<sigma> = RDX\<^sub>0 \<and> R9 \<sigma> = R9\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBX\<^sub>0\<close>
declare P_0x1c227_3_def[Ps]

definition P_0x1c227_3_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x1c227_3_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((RDI\<^sub>0::64 word) + 0x40), 8),
    (2, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x40), 8)
  }\<close>

definition P_0x1c227_3_regions :: state_pred where
  \<open>P_0x1c227_3_regions \<sigma> \<equiv> \<exists>regions. P_0x1c227_3_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x1b8c0_0x1c227_3 :: state_pred where
  \<open>Q_0x1b8c0_0x1c227_3 \<sigma> \<equiv> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x40) \<and> RIP \<sigma> = 0x1b8c0 \<and> RAX \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> RBX \<sigma> = RBX\<^sub>0 \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = RDX\<^sub>0 \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RBP \<sigma> = RDI\<^sub>0 \<and> R13 \<sigma> = RSI\<^sub>0 \<and> R12 \<sigma> = RDX\<^sub>0 \<and> R9 \<sigma> = R9\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = 0x1c22c\<close>
declare Q_0x1b8c0_0x1c227_3_def[Qs]

schematic_goal raw_aio_read_0_1_0x1c227_0x1c227_3[blocks]:
  assumes \<open>(P_0x1c227_3 && P_0x1c227_3_regions) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x1c227 3 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x1b8c0_0x1c227_3 ?\<sigma> \<and> block_usage P_0x1c227_3_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x1c227_3_def P_0x1c227_3_regions_def post: Q_0x1b8c0_0x1c227_3_def regionset: P_0x1c227_3_regions_set_def)

definition P_0x1c22c_4 :: state_pred where
  \<open>P_0x1c22c_4 \<sigma> \<equiv> RIP \<sigma> = 0x1c22c \<and> RAX \<sigma> = raw_aio_setup_0x1c227_retval \<and> RBX \<sigma> = RBX\<^sub>0 \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = RDX\<^sub>0 \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x38) \<and> RBP \<sigma> = RDI\<^sub>0 \<and> R13 \<sigma> = RSI\<^sub>0 \<and> R12 \<sigma> = RDX\<^sub>0 \<and> R9 \<sigma> = R9\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = 0x1c22c\<close>
declare P_0x1c22c_4_def[Ps]

definition P_0x1c22c_4_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x1c22c_4_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((RDI\<^sub>0::64 word) + 0x40), 8),
    (2, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x40), 8)
  }\<close>

definition P_0x1c22c_4_regions :: state_pred where
  \<open>P_0x1c22c_4_regions \<sigma> \<equiv> \<exists>regions. P_0x1c22c_4_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x1c232_4 :: state_pred where
  \<open>Q_0x1c232_4 \<sigma> \<equiv> RIP \<sigma> = 0x1c232 \<and> RAX \<sigma> = raw_aio_setup_0x1c227_retval \<and> RBX \<sigma> = raw_aio_setup_0x1c227_retval \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = RDX\<^sub>0 \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x38) \<and> RBP \<sigma> = RDI\<^sub>0 \<and> R13 \<sigma> = RSI\<^sub>0 \<and> R12 \<sigma> = RDX\<^sub>0 \<and> R9 \<sigma> = R9\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = 0x1c22c\<close>
declare Q_0x1c232_4_def[Qs]

schematic_goal raw_aio_read_0_2_0x1c22c_0x1c22f_4[blocks]:
  assumes \<open>(P_0x1c22c_4 && P_0x1c22c_4_regions) \<sigma>\<close>
  shows \<open>exec_block 2 0x1c22f 4 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x1c232_4 ?\<sigma> \<and> block_usage P_0x1c22c_4_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x1c22c_4_def P_0x1c22c_4_regions_def post: Q_0x1c232_4_def regionset: P_0x1c22c_4_regions_set_def)

definition P_0x1c232_true_5 :: state_pred where
  \<open>P_0x1c232_true_5 \<sigma> \<equiv> RIP \<sigma> = 0x1c232 \<and> RAX \<sigma> = raw_aio_setup_0x1c227_retval \<and> RBX \<sigma> = raw_aio_setup_0x1c227_retval \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = RDX\<^sub>0 \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x38) \<and> RBP \<sigma> = RDI\<^sub>0 \<and> R13 \<sigma> = RSI\<^sub>0 \<and> R12 \<sigma> = RDX\<^sub>0 \<and> R9 \<sigma> = R9\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = 0x1c22c\<close>
declare P_0x1c232_true_5_def[Ps]

definition P_0x1c232_true_5_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x1c232_true_5_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((RDI\<^sub>0::64 word) + 0x40), 8),
    (2, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x40), 8)
  }\<close>

definition P_0x1c232_true_5_regions :: state_pred where
  \<open>P_0x1c232_true_5_regions \<sigma> \<equiv> \<exists>regions. P_0x1c232_true_5_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_ret_address_5 :: state_pred where
  \<open>Q_ret_address_5 \<sigma> \<equiv> RIP \<sigma> = ret_address \<and> RBX \<sigma> = RBX\<^sub>0 \<and> RDX \<sigma> = RDX\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) + 0x8) \<and> RBP \<sigma> = RBP\<^sub>0 \<and> R13 \<sigma> = R13\<^sub>0 \<and> R12 \<sigma> = R12\<^sub>0 \<and> R9 \<sigma> = R9\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBX\<^sub>0\<close>
declare Q_ret_address_5_def[Qs]

schematic_goal raw_aio_read_0_9_0x1c232_0x1c25f_5[blocks]:
  assumes \<open>(P_0x1c232_true_5 && P_0x1c232_true_5_regions && ZF) \<sigma>\<close>
  shows \<open>exec_block 9 0x1c25f 5 \<sigma> \<triangleq> ?\<sigma> \<and> Q_ret_address_5 ?\<sigma> \<and> block_usage P_0x1c232_true_5_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x1c232_true_5_def P_0x1c232_true_5_regions_def post: Q_ret_address_5_def regionset: P_0x1c232_true_5_regions_set_def)

definition P_0x1c232_false_6 :: state_pred where
  \<open>P_0x1c232_false_6 \<sigma> \<equiv> RIP \<sigma> = 0x1c232 \<and> RAX \<sigma> = raw_aio_setup_0x1c227_retval \<and> RBX \<sigma> = raw_aio_setup_0x1c227_retval \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = RDX\<^sub>0 \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x38) \<and> RBP \<sigma> = RDI\<^sub>0 \<and> R13 \<sigma> = RSI\<^sub>0 \<and> R12 \<sigma> = RDX\<^sub>0 \<and> R9 \<sigma> = R9\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = 0x1c22c\<close>
declare P_0x1c232_false_6_def[Ps]

definition P_0x1c232_false_6_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x1c232_false_6_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((RDI\<^sub>0::64 word) + 0x40), 8),
    (2, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x40), 8)
  }\<close>

definition P_0x1c232_false_6_regions :: state_pred where
  \<open>P_0x1c232_false_6_regions \<sigma> \<equiv> \<exists>regions. P_0x1c232_false_6_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x1c238_6 :: state_pred where
  \<open>Q_0x1c238_6 \<sigma> \<equiv> RIP \<sigma> = 0x1c238 \<and> RAX \<sigma> = raw_aio_setup_0x1c227_retval \<and> RBX \<sigma> = raw_aio_setup_0x1c227_retval \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = RDX\<^sub>0 \<and> RDI \<sigma> = ((raw_aio_setup_0x1c227_retval::64 word) + 0x28) \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x38) \<and> RBP \<sigma> = RDI\<^sub>0 \<and> R13 \<sigma> = RSI\<^sub>0 \<and> R12 \<sigma> = RDX\<^sub>0 \<and> R9 \<sigma> = R9\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = 0x1c22c\<close>
declare Q_0x1c238_6_def[Qs]

schematic_goal raw_aio_read_0_2_0x1c232_0x1c234_6[blocks]:
  assumes \<open>(P_0x1c232_false_6 && P_0x1c232_false_6_regions && ! ZF) \<sigma>\<close>
  shows \<open>exec_block 2 0x1c234 6 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x1c238_6 ?\<sigma> \<and> block_usage P_0x1c232_false_6_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x1c232_false_6_def P_0x1c232_false_6_regions_def post: Q_0x1c238_6_def regionset: P_0x1c232_false_6_regions_set_def)

definition P_0x1c238_7 :: state_pred where
  \<open>P_0x1c238_7 \<sigma> \<equiv> RIP \<sigma> = 0x1c238 \<and> RAX \<sigma> = raw_aio_setup_0x1c227_retval \<and> RBX \<sigma> = raw_aio_setup_0x1c227_retval \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = RDX\<^sub>0 \<and> RDI \<sigma> = ((raw_aio_setup_0x1c227_retval::64 word) + 0x28) \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x38) \<and> RBP \<sigma> = RDI\<^sub>0 \<and> R13 \<sigma> = RSI\<^sub>0 \<and> R12 \<sigma> = RDX\<^sub>0 \<and> R9 \<sigma> = R9\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = 0x1c22c\<close>
declare P_0x1c238_7_def[Ps]

definition P_0x1c238_7_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x1c238_7_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((RDI\<^sub>0::64 word) + 0x40), 8),
    (2, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x40), 8)
  }\<close>

definition P_0x1c238_7_regions :: state_pred where
  \<open>P_0x1c238_7_regions \<sigma> \<equiv> \<exists>regions. P_0x1c238_7_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_qemu_paio_read_addr_0x1c238_7 :: state_pred where
  \<open>Q_qemu_paio_read_addr_0x1c238_7 \<sigma> \<equiv> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x40) \<and> RIP \<sigma> = qemu_paio_read_addr \<and> RAX \<sigma> = raw_aio_setup_0x1c227_retval \<and> RBX \<sigma> = raw_aio_setup_0x1c227_retval \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = RDX\<^sub>0 \<and> RDI \<sigma> = ((raw_aio_setup_0x1c227_retval::64 word) + 0x28) \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RBP \<sigma> = RDI\<^sub>0 \<and> R13 \<sigma> = RSI\<^sub>0 \<and> R12 \<sigma> = RDX\<^sub>0 \<and> R9 \<sigma> = R9\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = 0x1c23d\<close>
declare Q_qemu_paio_read_addr_0x1c238_7_def[Qs]

schematic_goal raw_aio_read_0_1_0x1c238_0x1c238_7[blocks]:
  assumes \<open>(P_0x1c238_7 && P_0x1c238_7_regions) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x1c238 7 \<sigma> \<triangleq> ?\<sigma> \<and> Q_qemu_paio_read_addr_0x1c238_7 ?\<sigma> \<and> block_usage P_0x1c238_7_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x1c238_7_def P_0x1c238_7_regions_def post: Q_qemu_paio_read_addr_0x1c238_7_def regionset: P_0x1c238_7_regions_set_def)

definition P_0x1c23d_8 :: state_pred where
  \<open>P_0x1c23d_8 \<sigma> \<equiv> RIP \<sigma> = 0x1c23d \<and> RAX \<sigma> = qemu_paio_read_0x1c238_retval \<and> RBX \<sigma> = raw_aio_setup_0x1c227_retval \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = RDX\<^sub>0 \<and> RDI \<sigma> = ((raw_aio_setup_0x1c227_retval::64 word) + 0x28) \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x38) \<and> RBP \<sigma> = RDI\<^sub>0 \<and> R13 \<sigma> = RSI\<^sub>0 \<and> R12 \<sigma> = RDX\<^sub>0 \<and> R9 \<sigma> = R9\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = 0x1c23d\<close>
declare P_0x1c23d_8_def[Ps]

definition P_0x1c23d_8_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x1c23d_8_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((RDI\<^sub>0::64 word) + 0x40), 8),
    (2, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x40), 8)
  }\<close>

definition P_0x1c23d_8_regions :: state_pred where
  \<open>P_0x1c23d_8_regions \<sigma> \<equiv> \<exists>regions. P_0x1c23d_8_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x1c23f_8 :: state_pred where
  \<open>Q_0x1c23f_8 \<sigma> \<equiv> RIP \<sigma> = 0x1c23f \<and> RAX \<sigma> = qemu_paio_read_0x1c238_retval \<and> RBX \<sigma> = raw_aio_setup_0x1c227_retval \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = RDX\<^sub>0 \<and> RDI \<sigma> = ((raw_aio_setup_0x1c227_retval::64 word) + 0x28) \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x38) \<and> RBP \<sigma> = RDI\<^sub>0 \<and> R13 \<sigma> = RSI\<^sub>0 \<and> R12 \<sigma> = RDX\<^sub>0 \<and> R9 \<sigma> = R9\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = 0x1c23d\<close>
declare Q_0x1c23f_8_def[Qs]

schematic_goal raw_aio_read_0_1_0x1c23d_0x1c23d_8[blocks]:
  assumes \<open>(P_0x1c23d_8 && P_0x1c23d_8_regions) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x1c23d 8 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x1c23f_8 ?\<sigma> \<and> block_usage P_0x1c23d_8_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x1c23d_8_def P_0x1c23d_8_regions_def post: Q_0x1c23f_8_def regionset: P_0x1c23d_8_regions_set_def)

definition P_0x1c23f_true_9 :: state_pred where
  \<open>P_0x1c23f_true_9 \<sigma> \<equiv> RIP \<sigma> = 0x1c23f \<and> RAX \<sigma> = qemu_paio_read_0x1c238_retval \<and> RBX \<sigma> = raw_aio_setup_0x1c227_retval \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = RDX\<^sub>0 \<and> RDI \<sigma> = ((raw_aio_setup_0x1c227_retval::64 word) + 0x28) \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x38) \<and> RBP \<sigma> = RDI\<^sub>0 \<and> R13 \<sigma> = RSI\<^sub>0 \<and> R12 \<sigma> = RDX\<^sub>0 \<and> R9 \<sigma> = R9\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = 0x1c23d\<close>
declare P_0x1c23f_true_9_def[Ps]

definition P_0x1c23f_true_9_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x1c23f_true_9_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((RDI\<^sub>0::64 word) + 0x40), 8),
    (2, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x40), 8)
  }\<close>

definition P_0x1c23f_true_9_regions :: state_pred where
  \<open>P_0x1c23f_true_9_regions \<sigma> \<equiv> \<exists>regions. P_0x1c23f_true_9_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x1c2bd_9 :: state_pred where
  \<open>Q_0x1c2bd_9 \<sigma> \<equiv> RIP \<sigma> = 0x1c2bd \<and> RAX \<sigma> = qemu_paio_read_0x1c238_retval \<and> RBX \<sigma> = 0x0 \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = RDX\<^sub>0 \<and> RDI \<sigma> = raw_aio_setup_0x1c227_retval \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x38) \<and> RBP \<sigma> = RDI\<^sub>0 \<and> R13 \<sigma> = RSI\<^sub>0 \<and> R12 \<sigma> = RDX\<^sub>0 \<and> R9 \<sigma> = R9\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = 0x1c23d\<close>
declare Q_0x1c2bd_9_def[Qs]

schematic_goal raw_aio_read_0_3_0x1c23f_0x1c2bb_9[blocks]:
  assumes \<open>(P_0x1c23f_true_9 && P_0x1c23f_true_9_regions && SF) \<sigma>\<close>
  shows \<open>exec_block 3 0x1c2bb 9 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x1c2bd_9 ?\<sigma> \<and> block_usage P_0x1c23f_true_9_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x1c23f_true_9_def P_0x1c23f_true_9_regions_def post: Q_0x1c2bd_9_def regionset: P_0x1c23f_true_9_regions_set_def)

definition P_0x1c2bd_10 :: state_pred where
  \<open>P_0x1c2bd_10 \<sigma> \<equiv> RIP \<sigma> = 0x1c2bd \<and> RAX \<sigma> = qemu_paio_read_0x1c238_retval \<and> RBX \<sigma> = 0x0 \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = RDX\<^sub>0 \<and> RDI \<sigma> = raw_aio_setup_0x1c227_retval \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x38) \<and> RBP \<sigma> = RDI\<^sub>0 \<and> R13 \<sigma> = RSI\<^sub>0 \<and> R12 \<sigma> = RDX\<^sub>0 \<and> R9 \<sigma> = R9\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = 0x1c23d\<close>
declare P_0x1c2bd_10_def[Ps]

definition P_0x1c2bd_10_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x1c2bd_10_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((RDI\<^sub>0::64 word) + 0x40), 8),
    (2, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x40), 8)
  }\<close>

definition P_0x1c2bd_10_regions :: state_pred where
  \<open>P_0x1c2bd_10_regions \<sigma> \<equiv> \<exists>regions. P_0x1c2bd_10_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x1c020_0x1c2bd_10 :: state_pred where
  \<open>Q_0x1c020_0x1c2bd_10 \<sigma> \<equiv> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x40) \<and> RIP \<sigma> = 0x1c020 \<and> RAX \<sigma> = qemu_paio_read_0x1c238_retval \<and> RBX \<sigma> = 0x0 \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = RDX\<^sub>0 \<and> RDI \<sigma> = raw_aio_setup_0x1c227_retval \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RBP \<sigma> = RDI\<^sub>0 \<and> R13 \<sigma> = RSI\<^sub>0 \<and> R12 \<sigma> = RDX\<^sub>0 \<and> R9 \<sigma> = R9\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = 0x1c2c2\<close>
declare Q_0x1c020_0x1c2bd_10_def[Qs]

schematic_goal raw_aio_read_0_1_0x1c2bd_0x1c2bd_10[blocks]:
  assumes \<open>(P_0x1c2bd_10 && P_0x1c2bd_10_regions) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x1c2bd 10 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x1c020_0x1c2bd_10 ?\<sigma> \<and> block_usage P_0x1c2bd_10_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x1c2bd_10_def P_0x1c2bd_10_regions_def post: Q_0x1c020_0x1c2bd_10_def regionset: P_0x1c2bd_10_regions_set_def)

definition P_0x1c2c2_11 :: state_pred where
  \<open>P_0x1c2c2_11 \<sigma> \<equiv> RIP \<sigma> = 0x1c2c2 \<and> RAX \<sigma> = raw_aio_remove_0x1c2bd_retval \<and> RBX \<sigma> = 0x0 \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = RDX\<^sub>0 \<and> RDI \<sigma> = raw_aio_setup_0x1c227_retval \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x38) \<and> RBP \<sigma> = RDI\<^sub>0 \<and> R13 \<sigma> = RSI\<^sub>0 \<and> R12 \<sigma> = RDX\<^sub>0 \<and> R9 \<sigma> = R9\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = 0x1c2c2\<close>
declare P_0x1c2c2_11_def[Ps]

definition P_0x1c2c2_11_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x1c2c2_11_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((RDI\<^sub>0::64 word) + 0x40), 8),
    (2, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x40), 8)
  }\<close>

definition P_0x1c2c2_11_regions :: state_pred where
  \<open>P_0x1c2c2_11_regions \<sigma> \<equiv> \<exists>regions. P_0x1c2c2_11_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x1c241_11 :: state_pred where
  \<open>Q_0x1c241_11 \<sigma> \<equiv> RIP \<sigma> = 0x1c241 \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = RDX\<^sub>0 \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x38) \<and> RBP \<sigma> = RDI\<^sub>0 \<and> R13 \<sigma> = RSI\<^sub>0 \<and> R12 \<sigma> = RDX\<^sub>0 \<and> R9 \<sigma> = R9\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBX\<^sub>0\<close>
declare Q_0x1c241_11_def[Qs]

schematic_goal raw_aio_read_0_1_0x1c2c2_0x1c2c2_11[blocks]:
  assumes \<open>(P_0x1c2c2_11 && P_0x1c2c2_11_regions) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x1c2c2 11 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x1c241_11 ?\<sigma> \<and> block_usage P_0x1c2c2_11_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x1c2c2_11_def P_0x1c2c2_11_regions_def post: Q_0x1c241_11_def regionset: P_0x1c2c2_11_regions_set_def)

definition P_0x1c23f_false_12 :: state_pred where
  \<open>P_0x1c23f_false_12 \<sigma> \<equiv> RIP \<sigma> = 0x1c23f \<and> RAX \<sigma> = qemu_paio_read_0x1c238_retval \<and> RBX \<sigma> = raw_aio_setup_0x1c227_retval \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = RDX\<^sub>0 \<and> RDI \<sigma> = ((raw_aio_setup_0x1c227_retval::64 word) + 0x28) \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x38) \<and> RBP \<sigma> = RDI\<^sub>0 \<and> R13 \<sigma> = RSI\<^sub>0 \<and> R12 \<sigma> = RDX\<^sub>0 \<and> R9 \<sigma> = R9\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = 0x1c23d\<close>
declare P_0x1c23f_false_12_def[Ps]

definition P_0x1c23f_false_12_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x1c23f_false_12_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((RDI\<^sub>0::64 word) + 0x40), 8),
    (2, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x40), 8)
  }\<close>

definition P_0x1c23f_false_12_regions :: state_pred where
  \<open>P_0x1c23f_false_12_regions \<sigma> \<equiv> \<exists>regions. P_0x1c23f_false_12_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x1c241_12 :: state_pred where
  \<open>Q_0x1c241_12 \<sigma> \<equiv> RIP \<sigma> = 0x1c241 \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = RDX\<^sub>0 \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x38) \<and> RBP \<sigma> = RDI\<^sub>0 \<and> R13 \<sigma> = RSI\<^sub>0 \<and> R12 \<sigma> = RDX\<^sub>0 \<and> R9 \<sigma> = R9\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBX\<^sub>0\<close>
declare Q_0x1c241_12_def[Qs]

schematic_goal raw_aio_read_0_1_0x1c23f_0x1c23f_12[blocks]:
  assumes \<open>(P_0x1c23f_false_12 && P_0x1c23f_false_12_regions && ! SF) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x1c23f 12 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x1c241_12 ?\<sigma> \<and> block_usage P_0x1c23f_false_12_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x1c23f_false_12_def P_0x1c23f_false_12_regions_def post: Q_0x1c241_12_def regionset: P_0x1c23f_false_12_regions_set_def)

definition P_0x1c241_13 :: state_pred where
  \<open>P_0x1c241_13 \<sigma> \<equiv> RIP \<sigma> = 0x1c241 \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = RDX\<^sub>0 \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x38) \<and> RBP \<sigma> = RDI\<^sub>0 \<and> R13 \<sigma> = RSI\<^sub>0 \<and> R12 \<sigma> = RDX\<^sub>0 \<and> R9 \<sigma> = R9\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBX\<^sub>0\<close>
declare P_0x1c241_13_def[Ps]

definition P_0x1c241_13_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x1c241_13_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((RDI\<^sub>0::64 word) + 0x40), 8),
    (2, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x20), 8)
  }\<close>

definition P_0x1c241_13_regions :: state_pred where
  \<open>P_0x1c241_13_regions \<sigma> \<equiv> \<exists>regions. P_0x1c241_13_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_ret_address_13 :: state_pred where
  \<open>Q_ret_address_13 \<sigma> \<equiv> RIP \<sigma> = ret_address \<and> RBX \<sigma> = RBX\<^sub>0 \<and> RDX \<sigma> = RDX\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) + 0x8) \<and> RBP \<sigma> = RBP\<^sub>0 \<and> R13 \<sigma> = R13\<^sub>0 \<and> R12 \<sigma> = R12\<^sub>0 \<and> R9 \<sigma> = R9\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBX\<^sub>0\<close>
declare Q_ret_address_13_def[Qs]

schematic_goal raw_aio_read_0_7_0x1c241_0x1c24e_13[blocks]:
  assumes \<open>(P_0x1c241_13 && P_0x1c241_13_regions) \<sigma>\<close>
  shows \<open>exec_block 7 0x1c24e 13 \<sigma> \<triangleq> ?\<sigma> \<and> Q_ret_address_13 ?\<sigma> \<and> block_usage P_0x1c241_13_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x1c241_13_def P_0x1c241_13_regions_def post: Q_ret_address_13_def regionset: P_0x1c241_13_regions_set_def)

definition P_0x1c266_false_14 :: state_pred where
  \<open>P_0x1c266_false_14 \<sigma> \<equiv> RIP \<sigma> = 0x1c266 \<and> RAX \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> RBX \<sigma> = RBX\<^sub>0 \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = RDX\<^sub>0 \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x38) \<and> RBP \<sigma> = RDI\<^sub>0 \<and> R13 \<sigma> = RSI\<^sub>0 \<and> R12 \<sigma> = RDX\<^sub>0 \<and> R9 \<sigma> = R9\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBX\<^sub>0\<close>
declare P_0x1c266_false_14_def[Ps]

definition P_0x1c266_false_14_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x1c266_false_14_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((RDI\<^sub>0::64 word) + 0x40), 8),
    (2, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x2c), 4)
  }\<close>

definition P_0x1c266_false_14_regions :: state_pred where
  \<open>P_0x1c266_false_14_regions \<sigma> \<equiv> \<exists>regions. P_0x1c266_false_14_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x1c272_14 :: state_pred where
  \<open>Q_0x1c272_14 \<sigma> \<equiv> RIP \<sigma> = 0x1c272 \<and> RAX \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> RBX \<sigma> = RBX\<^sub>0 \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = R9\<^sub>0 \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = R8\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x38) \<and> RBP \<sigma> = RDI\<^sub>0 \<and> R13 \<sigma> = RSI\<^sub>0 \<and> R12 \<sigma> = RDX\<^sub>0 \<and> R9 \<sigma> = R9\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x2c),4]::32 word) = ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word))\<close>
declare Q_0x1c272_14_def[Qs]

schematic_goal raw_aio_read_0_4_0x1c266_0x1c26e_14[blocks]:
  assumes \<open>(P_0x1c266_false_14 && P_0x1c266_false_14_regions && ! ZF) \<sigma>\<close>
  shows \<open>exec_block 4 0x1c26e 14 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x1c272_14 ?\<sigma> \<and> block_usage P_0x1c266_false_14_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x1c266_false_14_def P_0x1c266_false_14_regions_def post: Q_0x1c272_14_def regionset: P_0x1c266_false_14_regions_set_def)

definition P_0x1c272_15 :: state_pred where
  \<open>P_0x1c272_15 \<sigma> \<equiv> RIP \<sigma> = 0x1c272 \<and> RAX \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> RBX \<sigma> = RBX\<^sub>0 \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = R9\<^sub>0 \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = R8\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x38) \<and> RBP \<sigma> = RDI\<^sub>0 \<and> R13 \<sigma> = RSI\<^sub>0 \<and> R12 \<sigma> = RDX\<^sub>0 \<and> R9 \<sigma> = R9\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x2c),4]::32 word) = ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word))\<close>
declare P_0x1c272_15_def[Ps]

definition P_0x1c272_15_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x1c272_15_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((RDI\<^sub>0::64 word) + 0x40), 8),
    (2, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x2c), 4),
    (8, ((RSP\<^sub>0::64 word) - 0x40), 8)
  }\<close>

definition P_0x1c272_15_regions :: state_pred where
  \<open>P_0x1c272_15_regions \<sigma> \<equiv> \<exists>regions. P_0x1c272_15_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_qemu_aio_get_addr_0x1c272_15 :: state_pred where
  \<open>Q_qemu_aio_get_addr_0x1c272_15 \<sigma> \<equiv> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x40) \<and> RIP \<sigma> = qemu_aio_get_addr \<and> RAX \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> RBX \<sigma> = RBX\<^sub>0 \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = R9\<^sub>0 \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = R8\<^sub>0 \<and> RBP \<sigma> = RDI\<^sub>0 \<and> R13 \<sigma> = RSI\<^sub>0 \<and> R12 \<sigma> = RDX\<^sub>0 \<and> R9 \<sigma> = R9\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x2c),4]::32 word) = ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = 0x1c277\<close>
declare Q_qemu_aio_get_addr_0x1c272_15_def[Qs]

schematic_goal raw_aio_read_0_1_0x1c272_0x1c272_15[blocks]:
  assumes \<open>(P_0x1c272_15 && P_0x1c272_15_regions) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x1c272 15 \<sigma> \<triangleq> ?\<sigma> \<and> Q_qemu_aio_get_addr_0x1c272_15 ?\<sigma> \<and> block_usage P_0x1c272_15_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x1c272_15_def P_0x1c272_15_regions_def post: Q_qemu_aio_get_addr_0x1c272_15_def regionset: P_0x1c272_15_regions_set_def)

definition P_0x1c277_16 :: state_pred where
  \<open>P_0x1c277_16 \<sigma> \<equiv> RIP \<sigma> = 0x1c277 \<and> RAX \<sigma> = qemu_aio_get_0x1c272_retval \<and> RBX \<sigma> = RBX\<^sub>0 \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = R9\<^sub>0 \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = R8\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x38) \<and> RBP \<sigma> = RDI\<^sub>0 \<and> R13 \<sigma> = RSI\<^sub>0 \<and> R12 \<sigma> = RDX\<^sub>0 \<and> R9 \<sigma> = R9\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x2c),4]::32 word) = ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = 0x1c277\<close>
declare P_0x1c277_16_def[Ps]

definition P_0x1c277_16_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x1c277_16_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((RDI\<^sub>0::64 word) + 0x40), 8),
    (2, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x2c), 4),
    (8, ((RSP\<^sub>0::64 word) - 0x40), 8)
  }\<close>

definition P_0x1c277_16_regions :: state_pred where
  \<open>P_0x1c277_16_regions \<sigma> \<equiv> \<exists>regions. P_0x1c277_16_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x1c28e_16 :: state_pred where
  \<open>Q_0x1c28e_16 \<sigma> \<equiv> RIP \<sigma> = 0x1c28e \<and> RAX \<sigma> = qemu_aio_get_0x1c272_retval \<and> RBX \<sigma> = qemu_aio_get_0x1c272_retval \<and> RCX \<sigma> = ucast (((ucast (((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word))::32 word) << 9)) \<and> RDX \<sigma> = RDX\<^sub>0 \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = ((ucast ((RSI\<^sub>0::64 word))::64 word) << 9) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x38) \<and> RBP \<sigma> = RDI\<^sub>0 \<and> R13 \<sigma> = RSI\<^sub>0 \<and> R12 \<sigma> = RDX\<^sub>0 \<and> R9 \<sigma> = R9\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x2c),4]::32 word) = ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = 0x1c277\<close>
declare Q_0x1c28e_16_def[Qs]

schematic_goal raw_aio_read_0_7_0x1c277_0x1c28b_16[blocks]:
  assumes \<open>(P_0x1c277_16 && P_0x1c277_16_regions) \<sigma>\<close>
  shows \<open>exec_block 7 0x1c28b 16 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x1c28e_16 ?\<sigma> \<and> block_usage P_0x1c277_16_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x1c277_16_def P_0x1c277_16_regions_def post: Q_0x1c28e_16_def regionset: P_0x1c277_16_regions_set_def)

definition P_0x1c28e_17 :: state_pred where
  \<open>P_0x1c28e_17 \<sigma> \<equiv> RIP \<sigma> = 0x1c28e \<and> RAX \<sigma> = qemu_aio_get_0x1c272_retval \<and> RBX \<sigma> = qemu_aio_get_0x1c272_retval \<and> RCX \<sigma> = ucast (((ucast (((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word))::32 word) << 9)) \<and> RDX \<sigma> = RDX\<^sub>0 \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = ((ucast ((RSI\<^sub>0::64 word))::64 word) << 9) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x38) \<and> RBP \<sigma> = RDI\<^sub>0 \<and> R13 \<sigma> = RSI\<^sub>0 \<and> R12 \<sigma> = RDX\<^sub>0 \<and> R9 \<sigma> = R9\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x2c),4]::32 word) = ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = 0x1c277\<close>
declare P_0x1c28e_17_def[Ps]

definition P_0x1c28e_17_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x1c28e_17_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((RDI\<^sub>0::64 word) + 0x40), 8),
    (2, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x2c), 4),
    (8, ((RSP\<^sub>0::64 word) - 0x40), 8)
  }\<close>

definition P_0x1c28e_17_regions :: state_pred where
  \<open>P_0x1c28e_17_regions \<sigma> \<equiv> \<exists>regions. P_0x1c28e_17_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_raw_pread_addr_0x1c28e_17 :: state_pred where
  \<open>Q_raw_pread_addr_0x1c28e_17 \<sigma> \<equiv> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x40) \<and> RIP \<sigma> = raw_pread_addr \<and> RAX \<sigma> = qemu_aio_get_0x1c272_retval \<and> RBX \<sigma> = qemu_aio_get_0x1c272_retval \<and> RCX \<sigma> = ucast (((ucast (((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word))::32 word) << 9)) \<and> RDX \<sigma> = RDX\<^sub>0 \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = ((ucast ((RSI\<^sub>0::64 word))::64 word) << 9) \<and> RBP \<sigma> = RDI\<^sub>0 \<and> R13 \<sigma> = RSI\<^sub>0 \<and> R12 \<sigma> = RDX\<^sub>0 \<and> R9 \<sigma> = R9\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x2c),4]::32 word) = ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = 0x1c293\<close>
declare Q_raw_pread_addr_0x1c28e_17_def[Qs]

schematic_goal raw_aio_read_0_1_0x1c28e_0x1c28e_17[blocks]:
  assumes \<open>(P_0x1c28e_17 && P_0x1c28e_17_regions) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x1c28e 17 \<sigma> \<triangleq> ?\<sigma> \<and> Q_raw_pread_addr_0x1c28e_17 ?\<sigma> \<and> block_usage P_0x1c28e_17_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x1c28e_17_def P_0x1c28e_17_regions_def post: Q_raw_pread_addr_0x1c28e_17_def regionset: P_0x1c28e_17_regions_set_def)

definition P_0x1c293_18 :: state_pred where
  \<open>P_0x1c293_18 \<sigma> \<equiv> RIP \<sigma> = 0x1c293 \<and> RAX \<sigma> = raw_pread_0x1c28e_retval \<and> RBX \<sigma> = qemu_aio_get_0x1c272_retval \<and> RCX \<sigma> = ucast (((ucast (((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word))::32 word) << 9)) \<and> RDX \<sigma> = RDX\<^sub>0 \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = ((ucast ((RSI\<^sub>0::64 word))::64 word) << 9) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x38) \<and> RBP \<sigma> = RDI\<^sub>0 \<and> R13 \<sigma> = RSI\<^sub>0 \<and> R12 \<sigma> = RDX\<^sub>0 \<and> R9 \<sigma> = R9\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x2c),4]::32 word) = ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = 0x1c293\<close>
declare P_0x1c293_18_def[Ps]

definition P_0x1c293_18_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x1c293_18_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((RDI\<^sub>0::64 word) + 0x40), 8),
    (2, ((qemu_aio_get_0x1c272_retval::64 word) + 0x80), 4),
    (3, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x2c), 4),
    (9, ((RSP\<^sub>0::64 word) - 0x40), 8)
  }\<close>

definition P_0x1c293_18_regions :: state_pred where
  \<open>P_0x1c293_18_regions \<sigma> \<equiv> \<exists>regions. P_0x1c293_18_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x1c2a3_18 :: state_pred where
  \<open>Q_0x1c2a3_18 \<sigma> \<equiv> RIP \<sigma> = 0x1c2a3 \<and> RAX \<sigma> = raw_pread_0x1c28e_retval \<and> RBX \<sigma> = qemu_aio_get_0x1c272_retval \<and> RCX \<sigma> = ucast (((ucast (((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word))::32 word) << 9)) \<and> RDX \<sigma> = RDX\<^sub>0 \<and> RDI \<sigma> = 0x1b980 \<and> RSI \<sigma> = qemu_aio_get_0x1c272_retval \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x38) \<and> RBP \<sigma> = RDI\<^sub>0 \<and> R13 \<sigma> = RSI\<^sub>0 \<and> R12 \<sigma> = RDX\<^sub>0 \<and> R9 \<sigma> = R9\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x2c),4]::32 word) = ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = 0x1c293\<close>
declare Q_0x1c2a3_18_def[Qs]

schematic_goal raw_aio_read_0_3_0x1c293_0x1c29d_18[blocks]:
  assumes \<open>(P_0x1c293_18 && P_0x1c293_18_regions) \<sigma>\<close>
  shows \<open>exec_block 3 0x1c29d 18 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x1c2a3_18 ?\<sigma> \<and> block_usage P_0x1c293_18_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x1c293_18_def P_0x1c293_18_regions_def post: Q_0x1c2a3_18_def regionset: P_0x1c293_18_regions_set_def)

definition P_0x1c2a3_19 :: state_pred where
  \<open>P_0x1c2a3_19 \<sigma> \<equiv> RIP \<sigma> = 0x1c2a3 \<and> RAX \<sigma> = raw_pread_0x1c28e_retval \<and> RBX \<sigma> = qemu_aio_get_0x1c272_retval \<and> RCX \<sigma> = ucast (((ucast (((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word))::32 word) << 9)) \<and> RDX \<sigma> = RDX\<^sub>0 \<and> RDI \<sigma> = 0x1b980 \<and> RSI \<sigma> = qemu_aio_get_0x1c272_retval \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x38) \<and> RBP \<sigma> = RDI\<^sub>0 \<and> R13 \<sigma> = RSI\<^sub>0 \<and> R12 \<sigma> = RDX\<^sub>0 \<and> R9 \<sigma> = R9\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x2c),4]::32 word) = ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = 0x1c293\<close>
declare P_0x1c2a3_19_def[Ps]

definition P_0x1c2a3_19_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x1c2a3_19_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((RDI\<^sub>0::64 word) + 0x40), 8),
    (2, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x2c), 4),
    (8, ((RSP\<^sub>0::64 word) - 0x40), 8)
  }\<close>

definition P_0x1c2a3_19_regions :: state_pred where
  \<open>P_0x1c2a3_19_regions \<sigma> \<equiv> \<exists>regions. P_0x1c2a3_19_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_qemu_bh_new_addr_0x1c2a3_19 :: state_pred where
  \<open>Q_qemu_bh_new_addr_0x1c2a3_19 \<sigma> \<equiv> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x40) \<and> RIP \<sigma> = qemu_bh_new_addr \<and> RAX \<sigma> = raw_pread_0x1c28e_retval \<and> RBX \<sigma> = qemu_aio_get_0x1c272_retval \<and> RCX \<sigma> = ucast (((ucast (((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word))::32 word) << 9)) \<and> RDX \<sigma> = RDX\<^sub>0 \<and> RDI \<sigma> = 0x1b980 \<and> RSI \<sigma> = qemu_aio_get_0x1c272_retval \<and> RBP \<sigma> = RDI\<^sub>0 \<and> R13 \<sigma> = RSI\<^sub>0 \<and> R12 \<sigma> = RDX\<^sub>0 \<and> R9 \<sigma> = R9\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x2c),4]::32 word) = ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = 0x1c2a8\<close>
declare Q_qemu_bh_new_addr_0x1c2a3_19_def[Qs]

schematic_goal raw_aio_read_0_1_0x1c2a3_0x1c2a3_19[blocks]:
  assumes \<open>(P_0x1c2a3_19 && P_0x1c2a3_19_regions) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x1c2a3 19 \<sigma> \<triangleq> ?\<sigma> \<and> Q_qemu_bh_new_addr_0x1c2a3_19 ?\<sigma> \<and> block_usage P_0x1c2a3_19_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x1c2a3_19_def P_0x1c2a3_19_regions_def post: Q_qemu_bh_new_addr_0x1c2a3_19_def regionset: P_0x1c2a3_19_regions_set_def)

definition P_0x1c2a8_20 :: state_pred where
  \<open>P_0x1c2a8_20 \<sigma> \<equiv> RIP \<sigma> = 0x1c2a8 \<and> RAX \<sigma> = qemu_bh_new_0x1c2a3_retval \<and> RBX \<sigma> = qemu_aio_get_0x1c272_retval \<and> RCX \<sigma> = ucast (((ucast (((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word))::32 word) << 9)) \<and> RDX \<sigma> = RDX\<^sub>0 \<and> RDI \<sigma> = 0x1b980 \<and> RSI \<sigma> = qemu_aio_get_0x1c272_retval \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x38) \<and> RBP \<sigma> = RDI\<^sub>0 \<and> R13 \<sigma> = RSI\<^sub>0 \<and> R12 \<sigma> = RDX\<^sub>0 \<and> R9 \<sigma> = R9\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x2c),4]::32 word) = ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = 0x1c2a8\<close>
declare P_0x1c2a8_20_def[Ps]

definition P_0x1c2a8_20_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x1c2a8_20_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((RDI\<^sub>0::64 word) + 0x40), 8),
    (2, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x2c), 4),
    (8, ((RSP\<^sub>0::64 word) - 0x40), 8)
  }\<close>

definition P_0x1c2a8_20_regions :: state_pred where
  \<open>P_0x1c2a8_20_regions \<sigma> \<equiv> \<exists>regions. P_0x1c2a8_20_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x1c2ab_20 :: state_pred where
  \<open>Q_0x1c2ab_20 \<sigma> \<equiv> RIP \<sigma> = 0x1c2ab \<and> RAX \<sigma> = qemu_bh_new_0x1c2a3_retval \<and> RBX \<sigma> = qemu_aio_get_0x1c272_retval \<and> RCX \<sigma> = ucast (((ucast (((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word))::32 word) << 9)) \<and> RDX \<sigma> = RDX\<^sub>0 \<and> RDI \<sigma> = qemu_bh_new_0x1c2a3_retval \<and> RSI \<sigma> = qemu_aio_get_0x1c272_retval \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x38) \<and> RBP \<sigma> = RDI\<^sub>0 \<and> R13 \<sigma> = RSI\<^sub>0 \<and> R12 \<sigma> = RDX\<^sub>0 \<and> R9 \<sigma> = R9\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x2c),4]::32 word) = ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = 0x1c2a8\<close>
declare Q_0x1c2ab_20_def[Qs]

schematic_goal raw_aio_read_0_1_0x1c2a8_0x1c2a8_20[blocks]:
  assumes \<open>(P_0x1c2a8_20 && P_0x1c2a8_20_regions) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x1c2a8 20 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x1c2ab_20 ?\<sigma> \<and> block_usage P_0x1c2a8_20_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x1c2a8_20_def P_0x1c2a8_20_regions_def post: Q_0x1c2ab_20_def regionset: P_0x1c2a8_20_regions_set_def)

definition P_0x1c2ab_21 :: state_pred where
  \<open>P_0x1c2ab_21 \<sigma> \<equiv> RIP \<sigma> = 0x1c2ab \<and> RAX \<sigma> = qemu_bh_new_0x1c2a3_retval \<and> RBX \<sigma> = qemu_aio_get_0x1c272_retval \<and> RCX \<sigma> = ucast (((ucast (((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word))::32 word) << 9)) \<and> RDX \<sigma> = RDX\<^sub>0 \<and> RDI \<sigma> = qemu_bh_new_0x1c2a3_retval \<and> RSI \<sigma> = qemu_aio_get_0x1c272_retval \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x38) \<and> RBP \<sigma> = RDI\<^sub>0 \<and> R13 \<sigma> = RSI\<^sub>0 \<and> R12 \<sigma> = RDX\<^sub>0 \<and> R9 \<sigma> = R9\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x2c),4]::32 word) = ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = 0x1c2a8\<close>
declare P_0x1c2ab_21_def[Ps]

definition P_0x1c2ab_21_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x1c2ab_21_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((RDI\<^sub>0::64 word) + 0x40), 8),
    (2, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x2c), 4),
    (8, ((RSP\<^sub>0::64 word) - 0x40), 8)
  }\<close>

definition P_0x1c2ab_21_regions :: state_pred where
  \<open>P_0x1c2ab_21_regions \<sigma> \<equiv> \<exists>regions. P_0x1c2ab_21_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_qemu_bh_schedule_addr_0x1c2ab_21 :: state_pred where
  \<open>Q_qemu_bh_schedule_addr_0x1c2ab_21 \<sigma> \<equiv> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x40) \<and> RIP \<sigma> = qemu_bh_schedule_addr \<and> RAX \<sigma> = qemu_bh_new_0x1c2a3_retval \<and> RBX \<sigma> = qemu_aio_get_0x1c272_retval \<and> RCX \<sigma> = ucast (((ucast (((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word))::32 word) << 9)) \<and> RDX \<sigma> = RDX\<^sub>0 \<and> RDI \<sigma> = qemu_bh_new_0x1c2a3_retval \<and> RSI \<sigma> = qemu_aio_get_0x1c272_retval \<and> RBP \<sigma> = RDI\<^sub>0 \<and> R13 \<sigma> = RSI\<^sub>0 \<and> R12 \<sigma> = RDX\<^sub>0 \<and> R9 \<sigma> = R9\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x2c),4]::32 word) = ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = 0x1c2b0\<close>
declare Q_qemu_bh_schedule_addr_0x1c2ab_21_def[Qs]

schematic_goal raw_aio_read_0_1_0x1c2ab_0x1c2ab_21[blocks]:
  assumes \<open>(P_0x1c2ab_21 && P_0x1c2ab_21_regions) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x1c2ab 21 \<sigma> \<triangleq> ?\<sigma> \<and> Q_qemu_bh_schedule_addr_0x1c2ab_21 ?\<sigma> \<and> block_usage P_0x1c2ab_21_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x1c2ab_21_def P_0x1c2ab_21_regions_def post: Q_qemu_bh_schedule_addr_0x1c2ab_21_def regionset: P_0x1c2ab_21_regions_set_def)

definition P_0x1c2b0_22 :: state_pred where
  \<open>P_0x1c2b0_22 \<sigma> \<equiv> RIP \<sigma> = 0x1c2b0 \<and> RAX \<sigma> = qemu_bh_schedule_0x1c2ab_retval \<and> RBX \<sigma> = qemu_aio_get_0x1c272_retval \<and> RCX \<sigma> = ucast (((ucast (((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word))::32 word) << 9)) \<and> RDX \<sigma> = RDX\<^sub>0 \<and> RDI \<sigma> = qemu_bh_new_0x1c2a3_retval \<and> RSI \<sigma> = qemu_aio_get_0x1c272_retval \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x38) \<and> RBP \<sigma> = RDI\<^sub>0 \<and> R13 \<sigma> = RSI\<^sub>0 \<and> R12 \<sigma> = RDX\<^sub>0 \<and> R9 \<sigma> = R9\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x2c),4]::32 word) = ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = 0x1c2b0\<close>
declare P_0x1c2b0_22_def[Ps]

definition P_0x1c2b0_22_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x1c2b0_22_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((RDI\<^sub>0::64 word) + 0x40), 8),
    (2, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x2c), 4),
    (8, ((RSP\<^sub>0::64 word) - 0x40), 8)
  }\<close>

definition P_0x1c2b0_22_regions :: state_pred where
  \<open>P_0x1c2b0_22_regions \<sigma> \<equiv> \<exists>regions. P_0x1c2b0_22_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x1c241_22 :: state_pred where
  \<open>Q_0x1c241_22 \<sigma> \<equiv> RIP \<sigma> = 0x1c241 \<and> RAX \<sigma> = qemu_bh_schedule_0x1c2ab_retval \<and> RBX \<sigma> = qemu_aio_get_0x1c272_retval \<and> RCX \<sigma> = ucast (((ucast (((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word))::32 word) << 9)) \<and> RDX \<sigma> = RDX\<^sub>0 \<and> RDI \<sigma> = qemu_bh_new_0x1c2a3_retval \<and> RSI \<sigma> = qemu_aio_get_0x1c272_retval \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x38) \<and> RBP \<sigma> = RDI\<^sub>0 \<and> R13 \<sigma> = RSI\<^sub>0 \<and> R12 \<sigma> = RDX\<^sub>0 \<and> R9 \<sigma> = R9\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x2c),4]::32 word) = ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = 0x1c2b0\<close>
declare Q_0x1c241_22_def[Qs]

schematic_goal raw_aio_read_0_1_0x1c2b0_0x1c2b0_22[blocks]:
  assumes \<open>(P_0x1c2b0_22 && P_0x1c2b0_22_regions) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x1c2b0 22 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x1c241_22 ?\<sigma> \<and> block_usage P_0x1c2b0_22_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x1c2b0_22_def P_0x1c2b0_22_regions_def post: Q_0x1c241_22_def regionset: P_0x1c2b0_22_regions_set_def)

definition P_0x1c241_23 :: state_pred where
  \<open>P_0x1c241_23 \<sigma> \<equiv> RIP \<sigma> = 0x1c241 \<and> RAX \<sigma> = qemu_bh_schedule_0x1c2ab_retval \<and> RBX \<sigma> = qemu_aio_get_0x1c272_retval \<and> RCX \<sigma> = ucast (((ucast (((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word))::32 word) << 9)) \<and> RDX \<sigma> = RDX\<^sub>0 \<and> RDI \<sigma> = qemu_bh_new_0x1c2a3_retval \<and> RSI \<sigma> = qemu_aio_get_0x1c272_retval \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x38) \<and> RBP \<sigma> = RDI\<^sub>0 \<and> R13 \<sigma> = RSI\<^sub>0 \<and> R12 \<sigma> = RDX\<^sub>0 \<and> R9 \<sigma> = R9\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x2c),4]::32 word) = ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = 0x1c2b0\<close>
declare P_0x1c241_23_def[Ps]

definition P_0x1c241_23_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x1c241_23_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((RDI\<^sub>0::64 word) + 0x40), 8),
    (2, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x2c), 4),
    (8, ((RSP\<^sub>0::64 word) - 0x40), 8)
  }\<close>

definition P_0x1c241_23_regions :: state_pred where
  \<open>P_0x1c241_23_regions \<sigma> \<equiv> \<exists>regions. P_0x1c241_23_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_ret_address_23 :: state_pred where
  \<open>Q_ret_address_23 \<sigma> \<equiv> RIP \<sigma> = ret_address \<and> RBX \<sigma> = RBX\<^sub>0 \<and> RDX \<sigma> = RDX\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) + 0x8) \<and> RBP \<sigma> = RBP\<^sub>0 \<and> R13 \<sigma> = R13\<^sub>0 \<and> R12 \<sigma> = R12\<^sub>0 \<and> R9 \<sigma> = R9\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBX\<^sub>0\<close>
declare Q_ret_address_23_def[Qs]

schematic_goal raw_aio_read_0_7_0x1c241_0x1c24e_23[blocks]:
  assumes \<open>(P_0x1c241_23 && P_0x1c241_23_regions) \<sigma>\<close>
  shows \<open>exec_block 7 0x1c24e 23 \<sigma> \<triangleq> ?\<sigma> \<and> Q_ret_address_23 ?\<sigma> \<and> block_usage P_0x1c241_23_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x1c241_23_def P_0x1c241_23_regions_def post: Q_ret_address_23_def regionset: P_0x1c241_23_regions_set_def)

definition P_0x1c21c_false_24 :: state_pred where
  \<open>P_0x1c21c_false_24 \<sigma> \<equiv> RIP \<sigma> = 0x1c21c \<and> RAX \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> RBX \<sigma> = RBX\<^sub>0 \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = RDX\<^sub>0 \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x38) \<and> RBP \<sigma> = RDI\<^sub>0 \<and> R13 \<sigma> = RSI\<^sub>0 \<and> R12 \<sigma> = RDX\<^sub>0 \<and> R9 \<sigma> = R9\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBX\<^sub>0\<close>
declare P_0x1c21c_false_24_def[Ps]

definition P_0x1c21c_false_24_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x1c21c_false_24_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((RDI\<^sub>0::64 word) + 0x40), 8),
    (2, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x20), 8)
  }\<close>

definition P_0x1c21c_false_24_regions :: state_pred where
  \<open>P_0x1c21c_false_24_regions \<sigma> \<equiv> \<exists>regions. P_0x1c21c_false_24_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x1c227_24 :: state_pred where
  \<open>Q_0x1c227_24 \<sigma> \<equiv> RIP \<sigma> = 0x1c227 \<and> RAX \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> RBX \<sigma> = RBX\<^sub>0 \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = RDX\<^sub>0 \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x38) \<and> RBP \<sigma> = RDI\<^sub>0 \<and> R13 \<sigma> = RSI\<^sub>0 \<and> R12 \<sigma> = RDX\<^sub>0 \<and> R9 \<sigma> = R9\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBX\<^sub>0\<close>
declare Q_0x1c227_24_def[Qs]

schematic_goal raw_aio_read_0_4_0x1c21c_0x1c224_24[blocks]:
  assumes \<open>(P_0x1c21c_false_24 && P_0x1c21c_false_24_regions && ! !ZF) \<sigma>\<close>
  shows \<open>exec_block 4 0x1c224 24 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x1c227_24 ?\<sigma> \<and> block_usage P_0x1c21c_false_24_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x1c21c_false_24_def P_0x1c21c_false_24_regions_def post: Q_0x1c227_24_def regionset: P_0x1c21c_false_24_regions_set_def)

definition P_0x1c227_25 :: state_pred where
  \<open>P_0x1c227_25 \<sigma> \<equiv> RIP \<sigma> = 0x1c227 \<and> RAX \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> RBX \<sigma> = RBX\<^sub>0 \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = RDX\<^sub>0 \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x38) \<and> RBP \<sigma> = RDI\<^sub>0 \<and> R13 \<sigma> = RSI\<^sub>0 \<and> R12 \<sigma> = RDX\<^sub>0 \<and> R9 \<sigma> = R9\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBX\<^sub>0\<close>
declare P_0x1c227_25_def[Ps]

definition P_0x1c227_25_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x1c227_25_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((RDI\<^sub>0::64 word) + 0x40), 8),
    (2, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x40), 8)
  }\<close>

definition P_0x1c227_25_regions :: state_pred where
  \<open>P_0x1c227_25_regions \<sigma> \<equiv> \<exists>regions. P_0x1c227_25_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x1b8c0_0x1c227_25 :: state_pred where
  \<open>Q_0x1b8c0_0x1c227_25 \<sigma> \<equiv> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x40) \<and> RIP \<sigma> = 0x1b8c0 \<and> RAX \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> RBX \<sigma> = RBX\<^sub>0 \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = RDX\<^sub>0 \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RBP \<sigma> = RDI\<^sub>0 \<and> R13 \<sigma> = RSI\<^sub>0 \<and> R12 \<sigma> = RDX\<^sub>0 \<and> R9 \<sigma> = R9\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = 0x1c22c\<close>
declare Q_0x1b8c0_0x1c227_25_def[Qs]

schematic_goal raw_aio_read_0_1_0x1c227_0x1c227_25[blocks]:
  assumes \<open>(P_0x1c227_25 && P_0x1c227_25_regions) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x1c227 25 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x1b8c0_0x1c227_25 ?\<sigma> \<and> block_usage P_0x1c227_25_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x1c227_25_def P_0x1c227_25_regions_def post: Q_0x1b8c0_0x1c227_25_def regionset: P_0x1c227_25_regions_set_def)

definition P_0x1c22c_26 :: state_pred where
  \<open>P_0x1c22c_26 \<sigma> \<equiv> RIP \<sigma> = 0x1c22c \<and> RAX \<sigma> = raw_aio_setup_0x1c227_retval \<and> RBX \<sigma> = RBX\<^sub>0 \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = RDX\<^sub>0 \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x38) \<and> RBP \<sigma> = RDI\<^sub>0 \<and> R13 \<sigma> = RSI\<^sub>0 \<and> R12 \<sigma> = RDX\<^sub>0 \<and> R9 \<sigma> = R9\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = 0x1c22c\<close>
declare P_0x1c22c_26_def[Ps]

definition P_0x1c22c_26_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x1c22c_26_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((RDI\<^sub>0::64 word) + 0x40), 8),
    (2, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x40), 8)
  }\<close>

definition P_0x1c22c_26_regions :: state_pred where
  \<open>P_0x1c22c_26_regions \<sigma> \<equiv> \<exists>regions. P_0x1c22c_26_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x1c232_26 :: state_pred where
  \<open>Q_0x1c232_26 \<sigma> \<equiv> RIP \<sigma> = 0x1c232 \<and> RAX \<sigma> = raw_aio_setup_0x1c227_retval \<and> RBX \<sigma> = raw_aio_setup_0x1c227_retval \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = RDX\<^sub>0 \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x38) \<and> RBP \<sigma> = RDI\<^sub>0 \<and> R13 \<sigma> = RSI\<^sub>0 \<and> R12 \<sigma> = RDX\<^sub>0 \<and> R9 \<sigma> = R9\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = 0x1c22c\<close>
declare Q_0x1c232_26_def[Qs]

schematic_goal raw_aio_read_0_2_0x1c22c_0x1c22f_26[blocks]:
  assumes \<open>(P_0x1c22c_26 && P_0x1c22c_26_regions) \<sigma>\<close>
  shows \<open>exec_block 2 0x1c22f 26 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x1c232_26 ?\<sigma> \<and> block_usage P_0x1c22c_26_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x1c22c_26_def P_0x1c22c_26_regions_def post: Q_0x1c232_26_def regionset: P_0x1c22c_26_regions_set_def)

definition P_0x1c232_true_27 :: state_pred where
  \<open>P_0x1c232_true_27 \<sigma> \<equiv> RIP \<sigma> = 0x1c232 \<and> RAX \<sigma> = raw_aio_setup_0x1c227_retval \<and> RBX \<sigma> = raw_aio_setup_0x1c227_retval \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = RDX\<^sub>0 \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x38) \<and> RBP \<sigma> = RDI\<^sub>0 \<and> R13 \<sigma> = RSI\<^sub>0 \<and> R12 \<sigma> = RDX\<^sub>0 \<and> R9 \<sigma> = R9\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = 0x1c22c\<close>
declare P_0x1c232_true_27_def[Ps]

definition P_0x1c232_true_27_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x1c232_true_27_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((RDI\<^sub>0::64 word) + 0x40), 8),
    (2, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x40), 8)
  }\<close>

definition P_0x1c232_true_27_regions :: state_pred where
  \<open>P_0x1c232_true_27_regions \<sigma> \<equiv> \<exists>regions. P_0x1c232_true_27_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_ret_address_27 :: state_pred where
  \<open>Q_ret_address_27 \<sigma> \<equiv> RIP \<sigma> = ret_address \<and> RBX \<sigma> = RBX\<^sub>0 \<and> RDX \<sigma> = RDX\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) + 0x8) \<and> RBP \<sigma> = RBP\<^sub>0 \<and> R13 \<sigma> = R13\<^sub>0 \<and> R12 \<sigma> = R12\<^sub>0 \<and> R9 \<sigma> = R9\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBX\<^sub>0\<close>
declare Q_ret_address_27_def[Qs]

schematic_goal raw_aio_read_0_9_0x1c232_0x1c25f_27[blocks]:
  assumes \<open>(P_0x1c232_true_27 && P_0x1c232_true_27_regions && ZF) \<sigma>\<close>
  shows \<open>exec_block 9 0x1c25f 27 \<sigma> \<triangleq> ?\<sigma> \<and> Q_ret_address_27 ?\<sigma> \<and> block_usage P_0x1c232_true_27_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x1c232_true_27_def P_0x1c232_true_27_regions_def post: Q_ret_address_27_def regionset: P_0x1c232_true_27_regions_set_def)

definition P_0x1c232_false_28 :: state_pred where
  \<open>P_0x1c232_false_28 \<sigma> \<equiv> RIP \<sigma> = 0x1c232 \<and> RAX \<sigma> = raw_aio_setup_0x1c227_retval \<and> RBX \<sigma> = raw_aio_setup_0x1c227_retval \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = RDX\<^sub>0 \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x38) \<and> RBP \<sigma> = RDI\<^sub>0 \<and> R13 \<sigma> = RSI\<^sub>0 \<and> R12 \<sigma> = RDX\<^sub>0 \<and> R9 \<sigma> = R9\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = 0x1c22c\<close>
declare P_0x1c232_false_28_def[Ps]

definition P_0x1c232_false_28_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x1c232_false_28_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((RDI\<^sub>0::64 word) + 0x40), 8),
    (2, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x40), 8)
  }\<close>

definition P_0x1c232_false_28_regions :: state_pred where
  \<open>P_0x1c232_false_28_regions \<sigma> \<equiv> \<exists>regions. P_0x1c232_false_28_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x1c238_28 :: state_pred where
  \<open>Q_0x1c238_28 \<sigma> \<equiv> RIP \<sigma> = 0x1c238 \<and> RAX \<sigma> = raw_aio_setup_0x1c227_retval \<and> RBX \<sigma> = raw_aio_setup_0x1c227_retval \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = RDX\<^sub>0 \<and> RDI \<sigma> = ((raw_aio_setup_0x1c227_retval::64 word) + 0x28) \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x38) \<and> RBP \<sigma> = RDI\<^sub>0 \<and> R13 \<sigma> = RSI\<^sub>0 \<and> R12 \<sigma> = RDX\<^sub>0 \<and> R9 \<sigma> = R9\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = 0x1c22c\<close>
declare Q_0x1c238_28_def[Qs]

schematic_goal raw_aio_read_0_2_0x1c232_0x1c234_28[blocks]:
  assumes \<open>(P_0x1c232_false_28 && P_0x1c232_false_28_regions && ! ZF) \<sigma>\<close>
  shows \<open>exec_block 2 0x1c234 28 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x1c238_28 ?\<sigma> \<and> block_usage P_0x1c232_false_28_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x1c232_false_28_def P_0x1c232_false_28_regions_def post: Q_0x1c238_28_def regionset: P_0x1c232_false_28_regions_set_def)

definition P_0x1c238_29 :: state_pred where
  \<open>P_0x1c238_29 \<sigma> \<equiv> RIP \<sigma> = 0x1c238 \<and> RAX \<sigma> = raw_aio_setup_0x1c227_retval \<and> RBX \<sigma> = raw_aio_setup_0x1c227_retval \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = RDX\<^sub>0 \<and> RDI \<sigma> = ((raw_aio_setup_0x1c227_retval::64 word) + 0x28) \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x38) \<and> RBP \<sigma> = RDI\<^sub>0 \<and> R13 \<sigma> = RSI\<^sub>0 \<and> R12 \<sigma> = RDX\<^sub>0 \<and> R9 \<sigma> = R9\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = 0x1c22c\<close>
declare P_0x1c238_29_def[Ps]

definition P_0x1c238_29_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x1c238_29_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((RDI\<^sub>0::64 word) + 0x40), 8),
    (2, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x40), 8)
  }\<close>

definition P_0x1c238_29_regions :: state_pred where
  \<open>P_0x1c238_29_regions \<sigma> \<equiv> \<exists>regions. P_0x1c238_29_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_qemu_paio_read_addr_0x1c238_29 :: state_pred where
  \<open>Q_qemu_paio_read_addr_0x1c238_29 \<sigma> \<equiv> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x40) \<and> RIP \<sigma> = qemu_paio_read_addr \<and> RAX \<sigma> = raw_aio_setup_0x1c227_retval \<and> RBX \<sigma> = raw_aio_setup_0x1c227_retval \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = RDX\<^sub>0 \<and> RDI \<sigma> = ((raw_aio_setup_0x1c227_retval::64 word) + 0x28) \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RBP \<sigma> = RDI\<^sub>0 \<and> R13 \<sigma> = RSI\<^sub>0 \<and> R12 \<sigma> = RDX\<^sub>0 \<and> R9 \<sigma> = R9\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = 0x1c23d\<close>
declare Q_qemu_paio_read_addr_0x1c238_29_def[Qs]

schematic_goal raw_aio_read_0_1_0x1c238_0x1c238_29[blocks]:
  assumes \<open>(P_0x1c238_29 && P_0x1c238_29_regions) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x1c238 29 \<sigma> \<triangleq> ?\<sigma> \<and> Q_qemu_paio_read_addr_0x1c238_29 ?\<sigma> \<and> block_usage P_0x1c238_29_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x1c238_29_def P_0x1c238_29_regions_def post: Q_qemu_paio_read_addr_0x1c238_29_def regionset: P_0x1c238_29_regions_set_def)

definition P_0x1c23d_30 :: state_pred where
  \<open>P_0x1c23d_30 \<sigma> \<equiv> RIP \<sigma> = 0x1c23d \<and> RAX \<sigma> = qemu_paio_read_0x1c238_retval \<and> RBX \<sigma> = raw_aio_setup_0x1c227_retval \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = RDX\<^sub>0 \<and> RDI \<sigma> = ((raw_aio_setup_0x1c227_retval::64 word) + 0x28) \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x38) \<and> RBP \<sigma> = RDI\<^sub>0 \<and> R13 \<sigma> = RSI\<^sub>0 \<and> R12 \<sigma> = RDX\<^sub>0 \<and> R9 \<sigma> = R9\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = 0x1c23d\<close>
declare P_0x1c23d_30_def[Ps]

definition P_0x1c23d_30_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x1c23d_30_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((RDI\<^sub>0::64 word) + 0x40), 8),
    (2, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x40), 8)
  }\<close>

definition P_0x1c23d_30_regions :: state_pred where
  \<open>P_0x1c23d_30_regions \<sigma> \<equiv> \<exists>regions. P_0x1c23d_30_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x1c23f_30 :: state_pred where
  \<open>Q_0x1c23f_30 \<sigma> \<equiv> RIP \<sigma> = 0x1c23f \<and> RAX \<sigma> = qemu_paio_read_0x1c238_retval \<and> RBX \<sigma> = raw_aio_setup_0x1c227_retval \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = RDX\<^sub>0 \<and> RDI \<sigma> = ((raw_aio_setup_0x1c227_retval::64 word) + 0x28) \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x38) \<and> RBP \<sigma> = RDI\<^sub>0 \<and> R13 \<sigma> = RSI\<^sub>0 \<and> R12 \<sigma> = RDX\<^sub>0 \<and> R9 \<sigma> = R9\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = 0x1c23d\<close>
declare Q_0x1c23f_30_def[Qs]

schematic_goal raw_aio_read_0_1_0x1c23d_0x1c23d_30[blocks]:
  assumes \<open>(P_0x1c23d_30 && P_0x1c23d_30_regions) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x1c23d 30 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x1c23f_30 ?\<sigma> \<and> block_usage P_0x1c23d_30_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x1c23d_30_def P_0x1c23d_30_regions_def post: Q_0x1c23f_30_def regionset: P_0x1c23d_30_regions_set_def)

definition P_0x1c23f_true_31 :: state_pred where
  \<open>P_0x1c23f_true_31 \<sigma> \<equiv> RIP \<sigma> = 0x1c23f \<and> RAX \<sigma> = qemu_paio_read_0x1c238_retval \<and> RBX \<sigma> = raw_aio_setup_0x1c227_retval \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = RDX\<^sub>0 \<and> RDI \<sigma> = ((raw_aio_setup_0x1c227_retval::64 word) + 0x28) \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x38) \<and> RBP \<sigma> = RDI\<^sub>0 \<and> R13 \<sigma> = RSI\<^sub>0 \<and> R12 \<sigma> = RDX\<^sub>0 \<and> R9 \<sigma> = R9\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = 0x1c23d\<close>
declare P_0x1c23f_true_31_def[Ps]

definition P_0x1c23f_true_31_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x1c23f_true_31_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((RDI\<^sub>0::64 word) + 0x40), 8),
    (2, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x40), 8)
  }\<close>

definition P_0x1c23f_true_31_regions :: state_pred where
  \<open>P_0x1c23f_true_31_regions \<sigma> \<equiv> \<exists>regions. P_0x1c23f_true_31_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x1c2bd_31 :: state_pred where
  \<open>Q_0x1c2bd_31 \<sigma> \<equiv> RIP \<sigma> = 0x1c2bd \<and> RAX \<sigma> = qemu_paio_read_0x1c238_retval \<and> RBX \<sigma> = 0x0 \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = RDX\<^sub>0 \<and> RDI \<sigma> = raw_aio_setup_0x1c227_retval \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x38) \<and> RBP \<sigma> = RDI\<^sub>0 \<and> R13 \<sigma> = RSI\<^sub>0 \<and> R12 \<sigma> = RDX\<^sub>0 \<and> R9 \<sigma> = R9\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = 0x1c23d\<close>
declare Q_0x1c2bd_31_def[Qs]

schematic_goal raw_aio_read_0_3_0x1c23f_0x1c2bb_31[blocks]:
  assumes \<open>(P_0x1c23f_true_31 && P_0x1c23f_true_31_regions && SF) \<sigma>\<close>
  shows \<open>exec_block 3 0x1c2bb 31 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x1c2bd_31 ?\<sigma> \<and> block_usage P_0x1c23f_true_31_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x1c23f_true_31_def P_0x1c23f_true_31_regions_def post: Q_0x1c2bd_31_def regionset: P_0x1c23f_true_31_regions_set_def)

definition P_0x1c2bd_32 :: state_pred where
  \<open>P_0x1c2bd_32 \<sigma> \<equiv> RIP \<sigma> = 0x1c2bd \<and> RAX \<sigma> = qemu_paio_read_0x1c238_retval \<and> RBX \<sigma> = 0x0 \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = RDX\<^sub>0 \<and> RDI \<sigma> = raw_aio_setup_0x1c227_retval \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x38) \<and> RBP \<sigma> = RDI\<^sub>0 \<and> R13 \<sigma> = RSI\<^sub>0 \<and> R12 \<sigma> = RDX\<^sub>0 \<and> R9 \<sigma> = R9\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = 0x1c23d\<close>
declare P_0x1c2bd_32_def[Ps]

definition P_0x1c2bd_32_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x1c2bd_32_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((RDI\<^sub>0::64 word) + 0x40), 8),
    (2, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x40), 8)
  }\<close>

definition P_0x1c2bd_32_regions :: state_pred where
  \<open>P_0x1c2bd_32_regions \<sigma> \<equiv> \<exists>regions. P_0x1c2bd_32_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x1c020_0x1c2bd_32 :: state_pred where
  \<open>Q_0x1c020_0x1c2bd_32 \<sigma> \<equiv> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x40) \<and> RIP \<sigma> = 0x1c020 \<and> RAX \<sigma> = qemu_paio_read_0x1c238_retval \<and> RBX \<sigma> = 0x0 \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = RDX\<^sub>0 \<and> RDI \<sigma> = raw_aio_setup_0x1c227_retval \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RBP \<sigma> = RDI\<^sub>0 \<and> R13 \<sigma> = RSI\<^sub>0 \<and> R12 \<sigma> = RDX\<^sub>0 \<and> R9 \<sigma> = R9\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = 0x1c2c2\<close>
declare Q_0x1c020_0x1c2bd_32_def[Qs]

schematic_goal raw_aio_read_0_1_0x1c2bd_0x1c2bd_32[blocks]:
  assumes \<open>(P_0x1c2bd_32 && P_0x1c2bd_32_regions) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x1c2bd 32 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x1c020_0x1c2bd_32 ?\<sigma> \<and> block_usage P_0x1c2bd_32_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x1c2bd_32_def P_0x1c2bd_32_regions_def post: Q_0x1c020_0x1c2bd_32_def regionset: P_0x1c2bd_32_regions_set_def)

definition P_0x1c2c2_33 :: state_pred where
  \<open>P_0x1c2c2_33 \<sigma> \<equiv> RIP \<sigma> = 0x1c2c2 \<and> RAX \<sigma> = raw_aio_remove_0x1c2bd_retval \<and> RBX \<sigma> = 0x0 \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = RDX\<^sub>0 \<and> RDI \<sigma> = raw_aio_setup_0x1c227_retval \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x38) \<and> RBP \<sigma> = RDI\<^sub>0 \<and> R13 \<sigma> = RSI\<^sub>0 \<and> R12 \<sigma> = RDX\<^sub>0 \<and> R9 \<sigma> = R9\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = 0x1c2c2\<close>
declare P_0x1c2c2_33_def[Ps]

definition P_0x1c2c2_33_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x1c2c2_33_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((RDI\<^sub>0::64 word) + 0x40), 8),
    (2, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x40), 8)
  }\<close>

definition P_0x1c2c2_33_regions :: state_pred where
  \<open>P_0x1c2c2_33_regions \<sigma> \<equiv> \<exists>regions. P_0x1c2c2_33_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x1c241_33 :: state_pred where
  \<open>Q_0x1c241_33 \<sigma> \<equiv> RIP \<sigma> = 0x1c241 \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = RDX\<^sub>0 \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x38) \<and> RBP \<sigma> = RDI\<^sub>0 \<and> R13 \<sigma> = RSI\<^sub>0 \<and> R12 \<sigma> = RDX\<^sub>0 \<and> R9 \<sigma> = R9\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBX\<^sub>0\<close>
declare Q_0x1c241_33_def[Qs]

schematic_goal raw_aio_read_0_1_0x1c2c2_0x1c2c2_33[blocks]:
  assumes \<open>(P_0x1c2c2_33 && P_0x1c2c2_33_regions) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x1c2c2 33 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x1c241_33 ?\<sigma> \<and> block_usage P_0x1c2c2_33_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x1c2c2_33_def P_0x1c2c2_33_regions_def post: Q_0x1c241_33_def regionset: P_0x1c2c2_33_regions_set_def)

definition P_0x1c23f_false_34 :: state_pred where
  \<open>P_0x1c23f_false_34 \<sigma> \<equiv> RIP \<sigma> = 0x1c23f \<and> RAX \<sigma> = qemu_paio_read_0x1c238_retval \<and> RBX \<sigma> = raw_aio_setup_0x1c227_retval \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = RDX\<^sub>0 \<and> RDI \<sigma> = ((raw_aio_setup_0x1c227_retval::64 word) + 0x28) \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x38) \<and> RBP \<sigma> = RDI\<^sub>0 \<and> R13 \<sigma> = RSI\<^sub>0 \<and> R12 \<sigma> = RDX\<^sub>0 \<and> R9 \<sigma> = R9\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = 0x1c23d\<close>
declare P_0x1c23f_false_34_def[Ps]

definition P_0x1c23f_false_34_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x1c23f_false_34_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((RDI\<^sub>0::64 word) + 0x40), 8),
    (2, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x40), 8)
  }\<close>

definition P_0x1c23f_false_34_regions :: state_pred where
  \<open>P_0x1c23f_false_34_regions \<sigma> \<equiv> \<exists>regions. P_0x1c23f_false_34_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x1c241_34 :: state_pred where
  \<open>Q_0x1c241_34 \<sigma> \<equiv> RIP \<sigma> = 0x1c241 \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = RDX\<^sub>0 \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x38) \<and> RBP \<sigma> = RDI\<^sub>0 \<and> R13 \<sigma> = RSI\<^sub>0 \<and> R12 \<sigma> = RDX\<^sub>0 \<and> R9 \<sigma> = R9\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBX\<^sub>0\<close>
declare Q_0x1c241_34_def[Qs]

schematic_goal raw_aio_read_0_1_0x1c23f_0x1c23f_34[blocks]:
  assumes \<open>(P_0x1c23f_false_34 && P_0x1c23f_false_34_regions && ! SF) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x1c23f 34 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x1c241_34 ?\<sigma> \<and> block_usage P_0x1c23f_false_34_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x1c23f_false_34_def P_0x1c23f_false_34_regions_def post: Q_0x1c241_34_def regionset: P_0x1c23f_false_34_regions_set_def)

definition P_0x1c241_35 :: state_pred where
  \<open>P_0x1c241_35 \<sigma> \<equiv> RIP \<sigma> = 0x1c241 \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = RDX\<^sub>0 \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x38) \<and> RBP \<sigma> = RDI\<^sub>0 \<and> R13 \<sigma> = RSI\<^sub>0 \<and> R12 \<sigma> = RDX\<^sub>0 \<and> R9 \<sigma> = R9\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBX\<^sub>0\<close>
declare P_0x1c241_35_def[Ps]

definition P_0x1c241_35_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x1c241_35_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((RDI\<^sub>0::64 word) + 0x40), 8),
    (2, (((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x20), 8)
  }\<close>

definition P_0x1c241_35_regions :: state_pred where
  \<open>P_0x1c241_35_regions \<sigma> \<equiv> \<exists>regions. P_0x1c241_35_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_ret_address_35 :: state_pred where
  \<open>Q_ret_address_35 \<sigma> \<equiv> RIP \<sigma> = ret_address \<and> RBX \<sigma> = RBX\<^sub>0 \<and> RDX \<sigma> = RDX\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) + 0x8) \<and> RBP \<sigma> = RBP\<^sub>0 \<and> R13 \<sigma> = R13\<^sub>0 \<and> R12 \<sigma> = R12\<^sub>0 \<and> R9 \<sigma> = R9\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word) \<and> (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[(((\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBX\<^sub>0\<close>
declare Q_ret_address_35_def[Qs]

schematic_goal raw_aio_read_0_7_0x1c241_0x1c24e_35[blocks]:
  assumes \<open>(P_0x1c241_35 && P_0x1c241_35_regions) \<sigma>\<close>
  shows \<open>exec_block 7 0x1c24e 35 \<sigma> \<triangleq> ?\<sigma> \<and> Q_ret_address_35 ?\<sigma> \<and> block_usage P_0x1c241_35_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x1c241_35_def P_0x1c241_35_regions_def post: Q_ret_address_35_def regionset: P_0x1c241_35_regions_set_def)

interpretation raw_aio_setup_0x1c227_3: raw_aio_setup _ _ _ _ _ _ _ _ _ _ \<open>(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)\<close> \<open>RBX\<^sub>0\<close> \<open>RCX\<^sub>0\<close> \<open>RDX\<^sub>0\<close> \<open>RDI\<^sub>0\<close> \<open>RSI\<^sub>0\<close> \<open>((RSP\<^sub>0::64 word) - 0x38)\<close> \<open>RDI\<^sub>0\<close> \<open>RSI\<^sub>0\<close> \<open>RDX\<^sub>0\<close> \<open>R9\<^sub>0\<close> \<open>R8\<^sub>0\<close> \<open>0x1c227\<close>
  by unfold_locales

interpretation raw_aio_remove_0x1c2bd_10: raw_aio_remove _ _ _ _ _ _ _ _ _ _ \<open>qemu_paio_read_0x1c238_retval\<close> \<open>0x0\<close> \<open>RCX\<^sub>0\<close> \<open>RDX\<^sub>0\<close> \<open>raw_aio_setup_0x1c227_retval\<close> \<open>RSI\<^sub>0\<close> \<open>((RSP\<^sub>0::64 word) - 0x38)\<close> \<open>RDI\<^sub>0\<close> \<open>RSI\<^sub>0\<close> \<open>RDX\<^sub>0\<close> \<open>R9\<^sub>0\<close> \<open>R8\<^sub>0\<close> \<open>0x1c2bd\<close>
  by unfold_locales

(* Same issue as above
interpretation raw_aio_setup_0x1c227_25: raw_aio_setup _ _ _ _ _ _ _ _ _ _ \<open>(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x40),8]::64 word)\<close> \<open>RBX\<^sub>0\<close> \<open>RCX\<^sub>0\<close> \<open>RDX\<^sub>0\<close> \<open>RDI\<^sub>0\<close> \<open>RSI\<^sub>0\<close> \<open>((RSP\<^sub>0::64 word) - 0x38)\<close> \<open>RDI\<^sub>0\<close> \<open>RSI\<^sub>0\<close> \<open>RDX\<^sub>0\<close> \<open>R9\<^sub>0\<close> \<open>R8\<^sub>0\<close> \<open>0x1c227\<close>
  by unfold_locales

interpretation raw_aio_remove_0x1c2bd_32: raw_aio_remove _ _ _ _ _ _ _ _ _ _ \<open>qemu_paio_read_0x1c238_retval\<close> \<open>0x0\<close> \<open>RCX\<^sub>0\<close> \<open>RDX\<^sub>0\<close> \<open>raw_aio_setup_0x1c227_retval\<close> \<open>RSI\<^sub>0\<close> \<open>((RSP\<^sub>0::64 word) - 0x38)\<close> \<open>RDI\<^sub>0\<close> \<open>RSI\<^sub>0\<close> \<open>RDX\<^sub>0\<close> \<open>R9\<^sub>0\<close> \<open>R8\<^sub>0\<close> \<open>0x1c2bd\<close>
  by unfold_locales
*)

definition raw_aio_read_acode :: ACode where
  \<open>raw_aio_read_acode =
    Block 10 0x1c217 0;
    IF !ZF THEN
      Block 2 0x1c260 (Suc 0);
      IF ZF THEN
        Block 4 0x1c224 2;
        Block (Suc 0) 0x1c227 3;
        CALL raw_aio_setup_0x1c227_3.raw_aio_setup_acode;
        Block 2 0x1c22f 4;
        IF ZF THEN
          Block 9 0x1c25f 5
        ELSE
          Block 2 0x1c234 6;
          Block (Suc 0) 0x1c238 7;
          CALL qemu_paio_read_acode;
          Block (Suc 0) 0x1c23d 8;
          IF SF THEN
            Block 3 0x1c2bb 9;
            Block (Suc 0) 0x1c2bd 10;
            CALL raw_aio_remove_0x1c2bd_10.raw_aio_remove_acode;
            Block (Suc 0) 0x1c2c2 11
          ELSE
            Block (Suc 0) 0x1c23f 12
          FI;
          Block 7 0x1c24e 13
        FI
      ELSE
        Block 4 0x1c26e 14;
        Block (Suc 0) 0x1c272 15;
        CALL qemu_aio_get_acode;
        Block 7 0x1c28b 16;
        Block (Suc 0) 0x1c28e 17;
        CALL raw_pread_acode;
        Block 3 0x1c29d 18;
        Block (Suc 0) 0x1c2a3 19;
        CALL qemu_bh_new_acode;
        Block (Suc 0) 0x1c2a8 20;
        Block (Suc 0) 0x1c2ab 21;
        CALL qemu_bh_schedule_acode;
        Block (Suc 0) 0x1c2b0 22;
        Block 7 0x1c24e 23
      FI
    ELSE
      Block 4 0x1c224 24;
      Block (Suc 0) 0x1c227 25;
      CALL raw_aio_setup_0x1c227_3.raw_aio_setup_acode; (* originally raw_aio_setup_0x1c227_25 *)
      Block 2 0x1c22f 26;
      IF ZF THEN
        Block 9 0x1c25f 27
      ELSE
        Block 2 0x1c234 28;
        Block (Suc 0) 0x1c238 29;
        CALL qemu_paio_read_acode;
        Block (Suc 0) 0x1c23d 30;
        IF SF THEN
          Block 3 0x1c2bb 31;
          Block (Suc 0) 0x1c2bd 32;
          CALL raw_aio_remove_0x1c2bd_10.raw_aio_remove_acode; (* originally raw_aio_remove_0x1c2bd_32 *)
          Block (Suc 0) 0x1c2c2 33
        ELSE
          Block (Suc 0) 0x1c23f 34
        FI;
        Block 7 0x1c24e 35
      FI
    FI
  \<close>

schematic_goal "raw_aio_read":
  assumes
    \<open>\<forall>\<sigma>. RIP \<sigma> = 0x1c21c \<longrightarrow> P_0x1c21c_true_1_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x1c266 \<longrightarrow> P_0x1c266_true_2_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x1c227 \<longrightarrow> P_0x1c227_3_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x1c22c \<longrightarrow> P_0x1c22c_4_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x1c232 \<longrightarrow> P_0x1c232_true_5_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x1c232 \<longrightarrow> P_0x1c232_false_6_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x1c238 \<longrightarrow> P_0x1c238_7_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x1c23d \<longrightarrow> P_0x1c23d_8_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x1c23f \<longrightarrow> P_0x1c23f_true_9_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x1c2bd \<longrightarrow> P_0x1c2bd_10_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x1c2c2 \<longrightarrow> P_0x1c2c2_11_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x1c23f \<longrightarrow> P_0x1c23f_false_12_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x1c241 \<longrightarrow> P_0x1c241_13_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x1c266 \<longrightarrow> P_0x1c266_false_14_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x1c272 \<longrightarrow> P_0x1c272_15_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x1c277 \<longrightarrow> P_0x1c277_16_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x1c28e \<longrightarrow> P_0x1c28e_17_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x1c293 \<longrightarrow> P_0x1c293_18_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x1c2a3 \<longrightarrow> P_0x1c2a3_19_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x1c2a8 \<longrightarrow> P_0x1c2a8_20_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x1c2ab \<longrightarrow> P_0x1c2ab_21_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x1c2b0 \<longrightarrow> P_0x1c2b0_22_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x1c241 \<longrightarrow> P_0x1c241_23_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x1c21c \<longrightarrow> P_0x1c21c_false_24_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x1c227 \<longrightarrow> P_0x1c227_25_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x1c22c \<longrightarrow> P_0x1c22c_26_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x1c232 \<longrightarrow> P_0x1c232_true_27_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x1c232 \<longrightarrow> P_0x1c232_false_28_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x1c238 \<longrightarrow> P_0x1c238_29_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x1c23d \<longrightarrow> P_0x1c23d_30_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x1c23f \<longrightarrow> P_0x1c23f_true_31_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x1c2bd \<longrightarrow> P_0x1c2bd_32_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x1c2c2 \<longrightarrow> P_0x1c2c2_33_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x1c23f \<longrightarrow> P_0x1c23f_false_34_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x1c241 \<longrightarrow> P_0x1c241_35_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x1b8c0 \<longrightarrow> raw_aio_setup_0x1c227_3.P_0x1b8c0_0_regions \<sigma>\<close> (* modified *)
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x1c020 \<longrightarrow> raw_aio_remove_0x1c2bd_10.P_0x1c020_0_regions \<sigma>\<close> (* modified *)
    and [blocks]: \<open>{{Q_0x1b8c0_0x1c227_3}} \<box>raw_aio_setup_0x1c227_3.raw_aio_setup_acode {{P_0x1c22c_4;M_0x1c227}}\<close>
    and [blocks]: \<open>{{Q_qemu_paio_read_addr_0x1c238_7}} \<box>qemu_paio_read_acode {{P_0x1c23d_8;M_0x1c238}}\<close>
    and [blocks]: \<open>{{Q_0x1c020_0x1c2bd_10}} \<box>raw_aio_remove_0x1c2bd_10.raw_aio_remove_acode {{P_0x1c2c2_11;M_0x1c2bd}}\<close>
    and [blocks]: \<open>{{Q_qemu_aio_get_addr_0x1c272_15}} \<box>qemu_aio_get_acode {{P_0x1c277_16;M_0x1c272}}\<close>
    and [blocks]: \<open>{{Q_raw_pread_addr_0x1c28e_17}} \<box>raw_pread_acode {{P_0x1c293_18;M_0x1c28e}}\<close>
    and [blocks]: \<open>{{Q_qemu_bh_new_addr_0x1c2a3_19}} \<box>qemu_bh_new_acode {{P_0x1c2a8_20;M_0x1c2a3}}\<close>
    and [blocks]: \<open>{{Q_qemu_bh_schedule_addr_0x1c2ab_21}} \<box>qemu_bh_schedule_acode {{P_0x1c2b0_22;M_0x1c2ab}}\<close>
    and [blocks]: \<open>{{Q_0x1b8c0_0x1c227_25}} \<box>raw_aio_setup_0x1c227_3.raw_aio_setup_acode {{P_0x1c22c_26;M_0x1c227}}\<close> (* originally raw_aio_setup_0x1c227_25 *)
    and [blocks]: \<open>{{Q_qemu_paio_read_addr_0x1c238_29}} \<box>qemu_paio_read_acode {{P_0x1c23d_30;M_0x1c238}}\<close>
    and [blocks]: \<open>{{Q_0x1c020_0x1c2bd_32}} \<box>raw_aio_remove_0x1c2bd_10.raw_aio_remove_acode {{P_0x1c2c2_33;M_0x1c2bd}}\<close> (* originally raw_aio_remove_0x1c2bd_32 *)
  shows \<open>{{?P}} raw_aio_read_acode {{?Q;?M}}\<close>
  by (vcg acode: raw_aio_read_acode_def assms: assms)

end

end
