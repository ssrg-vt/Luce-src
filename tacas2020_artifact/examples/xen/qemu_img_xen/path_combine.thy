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
theory path_combine
  imports "../../../isabelle/VCG/HTriple"
begin

locale "qemu_img_xen" = execution_context + exec_code +
  fixes strlen_0x55ad_retval\<^sub>v ioctl_0x17513_retval\<^sub>v errno_location_0x1751b_retval\<^sub>v ioctl_0x1752f_retval\<^sub>v ioctl_0x1753d_retval\<^sub>v nbd_wr_sync_0x17651_retval\<^sub>v fprintf_chk_0x176c1_retval\<^sub>v errno_location_0x176c6_retval\<^sub>v fprintf_chk_0x17706_retval\<^sub>v errno_location_0x1770b_retval\<^sub>v stack_chk_fail_0x17722_retval\<^sub>v nbd_wr_sync_0x17779_retval\<^sub>v fprintf_chk_0x17830_retval\<^sub>v errno_location_0x17835_retval\<^sub>v nbd_wr_sync_0x1788c_retval\<^sub>v bdrv_write_0x178cc_retval\<^sub>v nbd_send_reply_isra_0_0x178ef_retval\<^sub>v fprintf_chk_0x17968_retval\<^sub>v fprintf_chk_0x179a0_retval\<^sub>v errno_location_0x179a5_retval\<^sub>v errno_location_0x179b8_retval\<^sub>v bdrv_read_0x179e8_retval\<^sub>v nbd_send_reply_isra_0_0x17a0b_retval\<^sub>v nbd_wr_sync_0x17a2d_retval\<^sub>v fprintf_chk_0x17ab9_retval\<^sub>v errno_location_0x17abe_retval\<^sub>v stack_chk_fail_0x17b33_retval\<^sub>v strchr_0x17eb9_retval\<^sub>v strchr_0x17f0d_retval\<^sub>v strchr_0x17f2e_retval\<^sub>v strrchr_0x17f3e_retval\<^sub>v memcpy_0x17f78_retval\<^sub>v errno_location_addr fprintf_chk_addr stack_chk_fail_addr bdrv_read_addr bdrv_write_addr ioctl_addr memcpy_addr nbd_send_reply_isra_0_addr nbd_wr_sync_addr strchr_addr strlen_addr strrchr_addr :: \<open>64 word\<close>
    and errno_location_acode fprintf_chk_acode stack_chk_fail_acode bdrv_read_acode bdrv_write_acode ioctl_acode memcpy_acode nbd_send_reply_isra_0_acode nbd_wr_sync_acode strchr_acode strlen_acode strrchr_acode :: ACode
  assumes fetch:
    "fetch 0x5560 \<equiv> (Binary (IS_8088 Test) (Reg (General SixtyFour rsi)) (Storage (Reg (General SixtyFour rsi))), 3)"
    "fetch 0x5563 \<equiv> (Unary (IS_8088 Je) (Immediate SixtyFour (ImmVal 21915)), 2)"
    "fetch 0x5565 \<equiv> (Binary (IS_80386 Movzx) (Reg (General ThirtyTwo rax)) (Storage (Memory Eight (A_SizeDirective 8 (A_FromReg (General SixtyFour rdx))))), 3)"
    "fetch 0x5568 \<equiv> (Binary (IS_8088 Lea) (Reg (General SixtyFour rcx)) (Storage (Memory SixtyFour (A_Plus (A_FromReg (General SixtyFour rdx)) (A_WordConstant 1)))), 4)"
    "fetch 0x556c \<equiv> (Binary (IS_8088 Test) (Reg (General Eight rax)) (Storage (Reg (General Eight rax))), 2)"
    "fetch 0x556e \<equiv> (Unary (IS_8088 Je) (Immediate SixtyFour (ImmVal 21912)), 2)"
    "fetch 0x5570 \<equiv> (Binary (IS_8088 Lea) (Reg (General SixtyFour rdx)) (Storage (Memory SixtyFour (A_Plus (A_FromReg (General SixtyFour rdi)) (A_Minus (A_Mult 1 (A_FromReg (General SixtyFour rsi))) (A_WordConstant 1))))), 5)"
    "fetch 0x5575 \<equiv> (Binary (IS_8088 Cmp) (Reg (General SixtyFour rdi)) (Storage (Reg (General SixtyFour rdx))), 3)"
    "fetch 0x5578 \<equiv> (Unary (IS_8088 Jb) (Immediate SixtyFour (ImmVal 21893)), 2)"
    "fetch 0x557a \<equiv> (Unary (IS_8088 Jmp) (Immediate SixtyFour (ImmVal 21912)), 2)"
    "fetch 0x557c \<equiv> (Unary (IS_8088 Nop) (Storage (Memory ThirtyTwo (A_SizeDirective 32 (A_Plus (A_FromReg (General SixtyFour rax)) (A_WordConstant 0))))), 4)"
    "fetch 0x5580 \<equiv> (Binary (IS_8088 Cmp) (Reg (General SixtyFour rdi)) (Storage (Reg (General SixtyFour rdx))), 3)"
    "fetch 0x5583 \<equiv> (Unary (IS_8088 Je) (Immediate SixtyFour (ImmVal 21912)), 2)"
    "fetch 0x5585 \<equiv> (Binary (IS_8088 Add) (Reg (General SixtyFour rdi)) (Immediate SixtyFour (ImmVal 1)), 4)"
    "fetch 0x5589 \<equiv> (Binary (IS_8088 Add) (Reg (General SixtyFour rcx)) (Immediate SixtyFour (ImmVal 1)), 4)"
    "fetch 0x558d \<equiv> (Binary (IS_8088 Mov) (Memory Eight (A_SizeDirective 8 (A_Minus (A_FromReg (General SixtyFour rdi)) (A_WordConstant 1)))) (Storage (Reg (General Eight rax))), 3)"
    "fetch 0x5590 \<equiv> (Binary (IS_80386 Movzx) (Reg (General ThirtyTwo rax)) (Storage (Memory Eight (A_SizeDirective 8 (A_Minus (A_FromReg (General SixtyFour rcx)) (A_WordConstant 1))))), 4)"
    "fetch 0x5594 \<equiv> (Binary (IS_8088 Test) (Reg (General Eight rax)) (Storage (Reg (General Eight rax))), 2)"
    "fetch 0x5596 \<equiv> (Unary (IS_8088 Jne) (Immediate SixtyFour (ImmVal 21888)), 2)"
    "fetch 0x5598 \<equiv> (Binary (IS_8088 Mov) (Memory Eight (A_SizeDirective 8 (A_FromReg (General SixtyFour rdi)))) (Immediate SixtyFour (ImmVal 0)), 3)"
    "fetch 0x559b \<equiv> (Nullary (IS_8088 Ret), 1)"
    "fetch 0x55a0 \<equiv> (Unary (IS_8088 Push) (Storage (Reg (General SixtyFour r12))), 2)"
    "fetch 0x55a2 \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour r12)) (Storage (Reg (General SixtyFour rdx))), 3)"
    "fetch 0x55a5 \<equiv> (Unary (IS_8088 Push) (Storage (Reg (General SixtyFour rbp))), 1)"
    "fetch 0x55a6 \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour rbp)) (Storage (Reg (General SixtyFour rdi))), 3)"
    "fetch 0x55a9 \<equiv> (Unary (IS_8088 Push) (Storage (Reg (General SixtyFour rbx))), 1)"
    "fetch 0x55aa \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour rbx)) (Storage (Reg (General SixtyFour rsi))), 3)"
    "fetch 0x55ad \<equiv> (Unary (IS_8088 Call) (Immediate SixtyFour (ImmLabel ''strlen'')), 5)"
    "fetch 0x55b2 \<equiv> (Nullary (IS_X86_64 Cdqe), 2)"
    "fetch 0x55b4 \<equiv> (Binary (IS_8088 Cmp) (Reg (General SixtyFour rax)) (Storage (Reg (General SixtyFour rbx))), 3)"
    "fetch 0x55b7 \<equiv> (Unary (IS_8088 Jb) (Immediate SixtyFour (ImmVal 21960)), 2)"
    "fetch 0x55b9 \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour rax)) (Storage (Reg (General SixtyFour rbp))), 3)"
    "fetch 0x55bc \<equiv> (Unary (IS_8088 Pop) (Storage (Reg (General SixtyFour rbx))), 1)"
    "fetch 0x55bd \<equiv> (Unary (IS_8088 Pop) (Storage (Reg (General SixtyFour rbp))), 1)"
    "fetch 0x55be \<equiv> (Unary (IS_8088 Pop) (Storage (Reg (General SixtyFour r12))), 2)"
    "fetch 0x55c0 \<equiv> (Nullary (IS_8088 Ret), 1)"
    "fetch 0x55c1 \<equiv> (Unary (IS_8088 Nop) (Storage (Memory ThirtyTwo (A_SizeDirective 32 (A_Plus (A_FromReg (General SixtyFour rax)) (A_WordConstant 0))))), 7)"
    "fetch 0x55c8 \<equiv> (Binary (IS_80386 Movzx) (Reg (General ThirtyTwo rdx)) (Storage (Memory Eight (A_SizeDirective 8 (A_FromReg (General SixtyFour r12))))), 5)"
    "fetch 0x55cd \<equiv> (Binary (IS_8088 Sub) (Reg (General SixtyFour rbx)) (Immediate SixtyFour (ImmVal 1)), 4)"
    "fetch 0x55d1 \<equiv> (Binary (IS_8088 Add) (Reg (General SixtyFour rax)) (Storage (Reg (General SixtyFour rbp))), 3)"
    "fetch 0x55d4 \<equiv> (Binary (IS_8088 Lea) (Reg (General SixtyFour rcx)) (Storage (Memory SixtyFour (A_Plus (A_FromReg (General SixtyFour r12)) (A_WordConstant 1)))), 5)"
    "fetch 0x55d9 \<equiv> (Binary (IS_8088 Test) (Reg (General Eight rdx)) (Storage (Reg (General Eight rdx))), 2)"
    "fetch 0x55db \<equiv> (Unary (IS_8088 Je) (Immediate SixtyFour (ImmVal 22024)), 2)"
    "fetch 0x55dd \<equiv> (Binary (IS_8088 Add) (Reg (General SixtyFour rbx)) (Storage (Reg (General SixtyFour rbp))), 3)"
    "fetch 0x55e0 \<equiv> (Binary (IS_8088 Cmp) (Reg (General SixtyFour rax)) (Storage (Reg (General SixtyFour rbx))), 3)"
    "fetch 0x55e3 \<equiv> (Unary (IS_8088 Jb) (Immediate SixtyFour (ImmVal 22005)), 2)"
    "fetch 0x55e5 \<equiv> (Unary (IS_8088 Jmp) (Immediate SixtyFour (ImmVal 22024)), 2)"
    "fetch 0x55e7 \<equiv> (Unary (IS_8088 Nop) (Storage (Memory Sixteen (A_SizeDirective 16 (A_Plus (A_FromReg (General SixtyFour rax)) (A_Plus (A_Mult 1 (A_FromReg (General SixtyFour rax))) (A_WordConstant 0)))))), 9)"
    "fetch 0x55f0 \<equiv> (Binary (IS_8088 Cmp) (Reg (General SixtyFour rax)) (Storage (Reg (General SixtyFour rbx))), 3)"
    "fetch 0x55f3 \<equiv> (Unary (IS_8088 Je) (Immediate SixtyFour (ImmVal 22024)), 2)"
    "fetch 0x55f5 \<equiv> (Binary (IS_8088 Add) (Reg (General SixtyFour rax)) (Immediate SixtyFour (ImmVal 1)), 4)"
    "fetch 0x55f9 \<equiv> (Binary (IS_8088 Add) (Reg (General SixtyFour rcx)) (Immediate SixtyFour (ImmVal 1)), 4)"
    "fetch 0x55fd \<equiv> (Binary (IS_8088 Mov) (Memory Eight (A_SizeDirective 8 (A_Minus (A_FromReg (General SixtyFour rax)) (A_WordConstant 1)))) (Storage (Reg (General Eight rdx))), 3)"
    "fetch 0x5600 \<equiv> (Binary (IS_80386 Movzx) (Reg (General ThirtyTwo rdx)) (Storage (Memory Eight (A_SizeDirective 8 (A_Minus (A_FromReg (General SixtyFour rcx)) (A_WordConstant 1))))), 4)"
    "fetch 0x5604 \<equiv> (Binary (IS_8088 Test) (Reg (General Eight rdx)) (Storage (Reg (General Eight rdx))), 2)"
    "fetch 0x5606 \<equiv> (Unary (IS_8088 Jne) (Immediate SixtyFour (ImmVal 22000)), 2)"
    "fetch 0x5608 \<equiv> (Binary (IS_8088 Mov) (Memory Eight (A_SizeDirective 8 (A_FromReg (General SixtyFour rax)))) (Immediate SixtyFour (ImmVal 0)), 3)"
    "fetch 0x560b \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour rax)) (Storage (Reg (General SixtyFour rbp))), 3)"
    "fetch 0x560e \<equiv> (Unary (IS_8088 Pop) (Storage (Reg (General SixtyFour rbx))), 1)"
    "fetch 0x560f \<equiv> (Unary (IS_8088 Pop) (Storage (Reg (General SixtyFour rbp))), 1)"
    "fetch 0x5610 \<equiv> (Unary (IS_8088 Pop) (Storage (Reg (General SixtyFour r12))), 2)"
    "fetch 0x5612 \<equiv> (Nullary (IS_8088 Ret), 1)"
    "fetch 0x5613 \<equiv> (Unary (IS_8088 Nop) (Storage (Memory Sixteen (A_SizeDirective 16 (A_Plus (A_FromReg (General SixtyFour cs)) (A_Plus (A_FromReg (General SixtyFour rax)) (A_Plus (A_Mult 1 (A_FromReg (General SixtyFour rax))) (A_WordConstant 0))))))), 11)"
    "fetch 0x561e \<equiv> (Binary (IS_8088 Xchg) (Reg (General Sixteen rax)) (Storage (Reg (General Sixteen rax))), 5)"
    "fetch 0x17500 \<equiv> (Unary (IS_8088 Push) (Storage (Reg (General SixtyFour r13))), 2)"
    "fetch 0x17502 \<equiv> (Binary (IS_8088 Mov) (Reg (General ThirtyTwo rsi)) (Immediate SixtyFour (ImmVal 43779)), 5)"
    "fetch 0x17507 \<equiv> (Binary (IS_8088 Xor) (Reg (General ThirtyTwo rax)) (Storage (Reg (General ThirtyTwo rax))), 2)"
    "fetch 0x17509 \<equiv> (Unary (IS_8088 Push) (Storage (Reg (General SixtyFour r12))), 2)"
    "fetch 0x1750b \<equiv> (Unary (IS_8088 Push) (Storage (Reg (General SixtyFour rbp))), 1)"
    "fetch 0x1750c \<equiv> (Unary (IS_8088 Push) (Storage (Reg (General SixtyFour rbx))), 1)"
    "fetch 0x1750d \<equiv> (Binary (IS_8088 Mov) (Reg (General ThirtyTwo rbx)) (Storage (Reg (General ThirtyTwo rdi))), 2)"
    "fetch 0x1750f \<equiv> (Binary (IS_8088 Sub) (Reg (General SixtyFour rsp)) (Immediate SixtyFour (ImmVal 8)), 4)"
    "fetch 0x17513 \<equiv> (Unary (IS_8088 Call) (Immediate SixtyFour (ImmLabel ''ioctl'')), 5)"
    "fetch 0x17518 \<equiv> (Binary (IS_8088 Mov) (Reg (General ThirtyTwo r12)) (Storage (Reg (General ThirtyTwo rax))), 3)"
    "fetch 0x1751b \<equiv> (Unary (IS_8088 Call) (Immediate SixtyFour (ImmLabel ''__errno_location'')), 5)"
    "fetch 0x17520 \<equiv> (Binary (IS_8088 Mov) (Reg (General ThirtyTwo rdi)) (Storage (Reg (General ThirtyTwo rbx))), 2)"
    "fetch 0x17522 \<equiv> (Binary (IS_8088 Mov) (Reg (General ThirtyTwo rsi)) (Immediate SixtyFour (ImmVal 43781)), 5)"
    "fetch 0x17527 \<equiv> (Binary (IS_8088 Mov) (Reg (General ThirtyTwo r13)) (Storage (Memory ThirtyTwo (A_SizeDirective 32 (A_FromReg (General SixtyFour rax))))), 3)"
    "fetch 0x1752a \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour rbp)) (Storage (Reg (General SixtyFour rax))), 3)"
    "fetch 0x1752d \<equiv> (Binary (IS_8088 Xor) (Reg (General ThirtyTwo rax)) (Storage (Reg (General ThirtyTwo rax))), 2)"
    "fetch 0x1752f \<equiv> (Unary (IS_8088 Call) (Immediate SixtyFour (ImmLabel ''ioctl'')), 5)"
    "fetch 0x17534 \<equiv> (Binary (IS_8088 Mov) (Reg (General ThirtyTwo rdi)) (Storage (Reg (General ThirtyTwo rbx))), 2)"
    "fetch 0x17536 \<equiv> (Binary (IS_8088 Mov) (Reg (General ThirtyTwo rsi)) (Immediate SixtyFour (ImmVal 43780)), 5)"
    "fetch 0x1753b \<equiv> (Binary (IS_8088 Xor) (Reg (General ThirtyTwo rax)) (Storage (Reg (General ThirtyTwo rax))), 2)"
    "fetch 0x1753d \<equiv> (Unary (IS_8088 Call) (Immediate SixtyFour (ImmLabel ''ioctl'')), 5)"
    "fetch 0x17542 \<equiv> (Binary (IS_8088 Mov) (Memory ThirtyTwo (A_SizeDirective 32 (A_Plus (A_FromReg (General SixtyFour rbp)) (A_WordConstant 0)))) (Storage (Reg (General ThirtyTwo r13))), 4)"
    "fetch 0x17546 \<equiv> (Binary (IS_8088 Add) (Reg (General SixtyFour rsp)) (Immediate SixtyFour (ImmVal 8)), 4)"
    "fetch 0x1754a \<equiv> (Binary (IS_8088 Mov) (Reg (General ThirtyTwo rax)) (Storage (Reg (General ThirtyTwo r12))), 3)"
    "fetch 0x1754d \<equiv> (Unary (IS_8088 Pop) (Storage (Reg (General SixtyFour rbx))), 1)"
    "fetch 0x1754e \<equiv> (Unary (IS_8088 Pop) (Storage (Reg (General SixtyFour rbp))), 1)"
    "fetch 0x1754f \<equiv> (Unary (IS_8088 Pop) (Storage (Reg (General SixtyFour r12))), 2)"
    "fetch 0x17551 \<equiv> (Unary (IS_8088 Pop) (Storage (Reg (General SixtyFour r13))), 2)"
    "fetch 0x17553 \<equiv> (Nullary (IS_8088 Ret), 1)"
    "fetch 0x17554 \<equiv> (Unary (IS_8088 Nop) (Storage (Memory Sixteen (A_SizeDirective 16 (A_Plus (A_FromReg (General SixtyFour cs)) (A_Plus (A_FromReg (General SixtyFour rax)) (A_Plus (A_Mult 1 (A_FromReg (General SixtyFour rax))) (A_WordConstant 0))))))), 11)"
    "fetch 0x17620 \<equiv> (Unary (IS_8088 Push) (Storage (Reg (General SixtyFour rbx))), 1)"
    "fetch 0x17621 \<equiv> (Binary (IS_8088 Mov) (Reg (General ThirtyTwo rcx)) (Immediate SixtyFour (ImmVal 1)), 5)"
    "fetch 0x17626 \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour rbx)) (Storage (Reg (General SixtyFour rsi))), 3)"
    "fetch 0x17629 \<equiv> (Binary (IS_8088 Mov) (Reg (General ThirtyTwo rdx)) (Immediate SixtyFour (ImmVal 16)), 5)"
    "fetch 0x1762e \<equiv> (Binary (IS_8088 Sub) (Reg (General SixtyFour rsp)) (Immediate SixtyFour (ImmVal 32)), 4)"
    "fetch 0x17632 \<equiv> (Binary (IS_SSE2_SIMD Movdqa) (Reg (SIMD OneHundredTwentyEight ymm0w3 ymm0w2 ymm0w1 ymm0w0)) (Storage (Memory OneHundredTwentyEight (A_SizeDirective 128 (A_Plus (A_FromReg (General SixtyFour rip)) (A_WordConstant 41782))))), 8)"
    "fetch 0x1763a \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour rax)) (Storage (Memory SixtyFour (A_SizeDirective 64 (A_Plus (A_FromReg (General SixtyFour fs)) (A_WordConstant 40))))), 9)"
    "fetch 0x17643 \<equiv> (Binary (IS_8088 Mov) (Memory SixtyFour (A_SizeDirective 64 (A_Plus (A_FromReg (General SixtyFour rsp)) (A_WordConstant 24)))) (Storage (Reg (General SixtyFour rax))), 5)"
    "fetch 0x17648 \<equiv> (Binary (IS_8088 Xor) (Reg (General ThirtyTwo rax)) (Storage (Reg (General ThirtyTwo rax))), 2)"
    "fetch 0x1764a \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour rsi)) (Storage (Reg (General SixtyFour rsp))), 3)"
    "fetch 0x1764d \<equiv> (Binary (IS_SSE_SIMD Movaps) (Memory OneHundredTwentyEight (A_SizeDirective 128 (A_FromReg (General SixtyFour rsp)))) (Storage (Reg (SIMD OneHundredTwentyEight ymm0w3 ymm0w2 ymm0w1 ymm0w0))), 4)"
    "fetch 0x17651 \<equiv> (Unary (IS_8088 Call) (Immediate SixtyFour (ImmLabel ''nbd_wr_sync'')), 5)"
    "fetch 0x17656 \<equiv> (Binary (IS_8088 Cmp) (Reg (General SixtyFour rax)) (Immediate SixtyFour (ImmVal 16)), 4)"
    "fetch 0x1765a \<equiv> (Unary (IS_8088 Jne) (Immediate SixtyFour (ImmVal 95896)), 2)"
    "fetch 0x1765c \<equiv> (Binary (IS_8088 Mov) (Reg (General ThirtyTwo rdx)) (Storage (Memory ThirtyTwo (A_SizeDirective 32 (A_Plus (A_FromReg (General SixtyFour rsp)) (A_WordConstant 4))))), 4)"
    "fetch 0x17660 \<equiv> (Binary (IS_8088 Mov) (Reg (General ThirtyTwo rax)) (Storage (Memory ThirtyTwo (A_SizeDirective 32 (A_FromReg (General SixtyFour rsp))))), 3)"
    "fetch 0x17663 \<equiv> (Unary (IS_80486 Bswap) (Storage (Reg (General ThirtyTwo rdx))), 2)"
    "fetch 0x17665 \<equiv> (Binary (IS_8088 Mov) (Memory ThirtyTwo (A_SizeDirective 32 (A_FromReg (General SixtyFour rbx)))) (Storage (Reg (General ThirtyTwo rdx))), 2)"
    "fetch 0x17667 \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour rdx)) (Storage (Memory SixtyFour (A_SizeDirective 64 (A_Plus (A_FromReg (General SixtyFour rsp)) (A_WordConstant 8))))), 5)"
    "fetch 0x1766c \<equiv> (Unary (IS_80486 Bswap) (Storage (Reg (General ThirtyTwo rax))), 2)"
    "fetch 0x1766e \<equiv> (Unary (IS_80486 Bswap) (Storage (Reg (General SixtyFour rdx))), 3)"
    "fetch 0x17671 \<equiv> (Binary (IS_8088 Mov) (Memory SixtyFour (A_SizeDirective 64 (A_Plus (A_FromReg (General SixtyFour rbx)) (A_WordConstant 8)))) (Storage (Reg (General SixtyFour rdx))), 4)"
    "fetch 0x17675 \<equiv> (Binary (IS_8088 Cmp) (Reg (General ThirtyTwo rax)) (Immediate SixtyFour (ImmVal 1732535960)), 5)"
    "fetch 0x1767a \<equiv> (Unary (IS_8088 Jne) (Immediate SixtyFour (ImmVal 95960)), 2)"
    "fetch 0x1767c \<equiv> (Binary (IS_8088 Xor) (Reg (General ThirtyTwo rax)) (Storage (Reg (General ThirtyTwo rax))), 2)"
    "fetch 0x1767e \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour rcx)) (Storage (Memory SixtyFour (A_SizeDirective 64 (A_Plus (A_FromReg (General SixtyFour rsp)) (A_WordConstant 24))))), 5)"
    "fetch 0x17683 \<equiv> (Binary (IS_8088 Xor) (Reg (General SixtyFour rcx)) (Storage (Memory SixtyFour (A_SizeDirective 64 (A_Plus (A_FromReg (General SixtyFour fs)) (A_WordConstant 40))))), 9)"
    "fetch 0x1768c \<equiv> (Unary (IS_8088 Jne) (Immediate SixtyFour (ImmVal 96034)), 6)"
    "fetch 0x17692 \<equiv> (Binary (IS_8088 Add) (Reg (General SixtyFour rsp)) (Immediate SixtyFour (ImmVal 32)), 4)"
    "fetch 0x17696 \<equiv> (Unary (IS_8088 Pop) (Storage (Reg (General SixtyFour rbx))), 1)"
    "fetch 0x17697 \<equiv> (Nullary (IS_8088 Ret), 1)"
    "fetch 0x17698 \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour rdi)) (Storage (Memory SixtyFour (A_SizeDirective 64 (A_Plus (A_FromReg (General SixtyFour rip)) (A_WordConstant 76897))))), 7)"
    "fetch 0x1769f \<equiv> (Binary (IS_8088 Mov) (Reg (General ThirtyTwo r9)) (Immediate SixtyFour (ImmVal 506)), 6)"
    "fetch 0x176a5 \<equiv> (Binary (IS_8088 Xor) (Reg (General ThirtyTwo rax)) (Storage (Reg (General ThirtyTwo rax))), 2)"
    "fetch 0x176a7 \<equiv> (Binary (IS_8088 Lea) (Reg (General SixtyFour r8)) (Storage (Memory SixtyFour (A_Plus (A_FromReg (General SixtyFour rip)) (A_WordConstant 41538)))), 7)"
    "fetch 0x176ae \<equiv> (Binary (IS_8088 Lea) (Reg (General SixtyFour rcx)) (Storage (Memory SixtyFour (A_Plus (A_FromReg (General SixtyFour rip)) (A_WordConstant 40622)))), 7)"
    "fetch 0x176b5 \<equiv> (Binary (IS_8088 Lea) (Reg (General SixtyFour rdx)) (Storage (Memory SixtyFour (A_Plus (A_FromReg (General SixtyFour rip)) (A_WordConstant 40648)))), 7)"
    "fetch 0x176bc \<equiv> (Binary (IS_8088 Mov) (Reg (General ThirtyTwo rsi)) (Immediate SixtyFour (ImmVal 1)), 5)"
    "fetch 0x176c1 \<equiv> (Unary (IS_8088 Call) (Immediate SixtyFour (ImmLabel ''__fprintf_chk'')), 5)"
    "fetch 0x176c6 \<equiv> (Unary (IS_8088 Call) (Immediate SixtyFour (ImmLabel ''__errno_location'')), 5)"
    "fetch 0x176cb \<equiv> (Binary (IS_8088 Mov) (Memory ThirtyTwo (A_SizeDirective 32 (A_FromReg (General SixtyFour rax)))) (Immediate SixtyFour (ImmVal 22)), 6)"
    "fetch 0x176d1 \<equiv> (Binary (IS_8088 Mov) (Reg (General ThirtyTwo rax)) (Immediate SixtyFour (ImmVal 4294967295)), 5)"
    "fetch 0x176d6 \<equiv> (Unary (IS_8088 Jmp) (Immediate SixtyFour (ImmVal 95870)), 2)"
    "fetch 0x176d8 \<equiv> (Binary (IS_8088 Sub) (Reg (General SixtyFour rsp)) (Immediate SixtyFour (ImmVal 8)), 4)"
    "fetch 0x176dc \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour rdi)) (Storage (Memory SixtyFour (A_SizeDirective 64 (A_Plus (A_FromReg (General SixtyFour rip)) (A_WordConstant 76829))))), 7)"
    "fetch 0x176e3 \<equiv> (Binary (IS_8088 Lea) (Reg (General SixtyFour rdx)) (Storage (Memory SixtyFour (A_Plus (A_FromReg (General SixtyFour rip)) (A_WordConstant 40934)))), 7)"
    "fetch 0x176ea \<equiv> (Binary (IS_8088 Mov) (Reg (General ThirtyTwo r9)) (Immediate SixtyFour (ImmVal 526)), 6)"
    "fetch 0x176f0 \<equiv> (Unary (IS_8088 Push) (Storage (Reg (General SixtyFour rax))), 1)"
    "fetch 0x176f1 \<equiv> (Binary (IS_8088 Lea) (Reg (General SixtyFour r8)) (Storage (Memory SixtyFour (A_Plus (A_FromReg (General SixtyFour rip)) (A_WordConstant 41464)))), 7)"
    "fetch 0x176f8 \<equiv> (Binary (IS_8088 Lea) (Reg (General SixtyFour rcx)) (Storage (Memory SixtyFour (A_Plus (A_FromReg (General SixtyFour rip)) (A_WordConstant 40548)))), 7)"
    "fetch 0x176ff \<equiv> (Binary (IS_8088 Xor) (Reg (General ThirtyTwo rax)) (Storage (Reg (General ThirtyTwo rax))), 2)"
    "fetch 0x17701 \<equiv> (Binary (IS_8088 Mov) (Reg (General ThirtyTwo rsi)) (Immediate SixtyFour (ImmVal 1)), 5)"
    "fetch 0x17706 \<equiv> (Unary (IS_8088 Call) (Immediate SixtyFour (ImmLabel ''__fprintf_chk'')), 5)"
    "fetch 0x1770b \<equiv> (Unary (IS_8088 Call) (Immediate SixtyFour (ImmLabel ''__errno_location'')), 5)"
    "fetch 0x17710 \<equiv> (Binary (IS_8088 Mov) (Memory ThirtyTwo (A_SizeDirective 32 (A_FromReg (General SixtyFour rax)))) (Immediate SixtyFour (ImmVal 22)), 6)"
    "fetch 0x17716 \<equiv> (Unary (IS_8088 Pop) (Storage (Reg (General SixtyFour rax))), 1)"
    "fetch 0x17717 \<equiv> (Binary (IS_8088 Mov) (Reg (General ThirtyTwo rax)) (Immediate SixtyFour (ImmVal 4294967295)), 5)"
    "fetch 0x1771c \<equiv> (Unary (IS_8088 Pop) (Storage (Reg (General SixtyFour rdx))), 1)"
    "fetch 0x1771d \<equiv> (Unary (IS_8088 Jmp) (Immediate SixtyFour (ImmVal 95870)), 5)"
    "fetch 0x17722 \<equiv> (Unary (IS_8088 Call) (Immediate SixtyFour (ImmLabel ''__stack_chk_fail'')), 5)"
    "fetch 0x17730 \<equiv> (Unary (IS_8088 Push) (Storage (Reg (General SixtyFour r15))), 2)"
    "fetch 0x17732 \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour r15)) (Storage (Reg (General SixtyFour rdi))), 3)"
    "fetch 0x17735 \<equiv> (Unary (IS_8088 Push) (Storage (Reg (General SixtyFour r14))), 2)"
    "fetch 0x17737 \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour r14)) (Storage (Reg (General SixtyFour r8))), 3)"
    "fetch 0x1773a \<equiv> (Unary (IS_8088 Push) (Storage (Reg (General SixtyFour r13))), 2)"
    "fetch 0x1773c \<equiv> (Unary (IS_8088 Push) (Storage (Reg (General SixtyFour r12))), 2)"
    "fetch 0x1773e \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour r12)) (Storage (Reg (General SixtyFour rcx))), 3)"
    "fetch 0x17741 \<equiv> (Binary (IS_8088 Mov) (Reg (General ThirtyTwo rcx)) (Immediate SixtyFour (ImmVal 1)), 5)"
    "fetch 0x17746 \<equiv> (Unary (IS_8088 Push) (Storage (Reg (General SixtyFour rbp))), 1)"
    "fetch 0x17747 \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour rbp)) (Storage (Reg (General SixtyFour rdx))), 3)"
    "fetch 0x1774a \<equiv> (Binary (IS_8088 Mov) (Reg (General ThirtyTwo rdx)) (Immediate SixtyFour (ImmVal 28)), 5)"
    "fetch 0x1774f \<equiv> (Unary (IS_8088 Push) (Storage (Reg (General SixtyFour rbx))), 1)"
    "fetch 0x17750 \<equiv> (Binary (IS_8088 Mov) (Reg (General ThirtyTwo rbx)) (Storage (Reg (General ThirtyTwo rsi))), 2)"
    "fetch 0x17752 \<equiv> (Binary (IS_8088 Mov) (Reg (General ThirtyTwo rdi)) (Storage (Reg (General ThirtyTwo rbx))), 2)"
    "fetch 0x17754 \<equiv> (Binary (IS_8088 Sub) (Reg (General SixtyFour rsp)) (Immediate SixtyFour (ImmVal 88)), 4)"
    "fetch 0x17758 \<equiv> (Binary (IS_8088 Mov) (Memory ThirtyTwo (A_SizeDirective 32 (A_FromReg (General SixtyFour rsp)))) (Storage (Reg (General ThirtyTwo r9))), 4)"
    "fetch 0x1775c \<equiv> (Binary (IS_8088 Lea) (Reg (General SixtyFour rsi)) (Storage (Memory SixtyFour (A_Plus (A_FromReg (General SixtyFour rsp)) (A_WordConstant 32)))), 5)"
    "fetch 0x17761 \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour r13)) (Storage (Memory SixtyFour (A_SizeDirective 64 (A_Plus (A_FromReg (General SixtyFour rsp)) (A_WordConstant 144))))), 8)"
    "fetch 0x17769 \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour rax)) (Storage (Memory SixtyFour (A_SizeDirective 64 (A_Plus (A_FromReg (General SixtyFour fs)) (A_WordConstant 40))))), 9)"
    "fetch 0x17772 \<equiv> (Binary (IS_8088 Mov) (Memory SixtyFour (A_SizeDirective 64 (A_Plus (A_FromReg (General SixtyFour rsp)) (A_WordConstant 72)))) (Storage (Reg (General SixtyFour rax))), 5)"
    "fetch 0x17777 \<equiv> (Binary (IS_8088 Xor) (Reg (General ThirtyTwo rax)) (Storage (Reg (General ThirtyTwo rax))), 2)"
    "fetch 0x17779 \<equiv> (Unary (IS_8088 Call) (Immediate SixtyFour (ImmLabel ''nbd_wr_sync'')), 5)"
    "fetch 0x1777e \<equiv> (Binary (IS_8088 Cmp) (Reg (General SixtyFour rax)) (Immediate SixtyFour (ImmVal 28)), 4)"
    "fetch 0x17782 \<equiv> (Unary (IS_8088 Jne) (Immediate SixtyFour (ImmVal 96974)), 6)"
    "fetch 0x17788 \<equiv> (Binary (IS_8088 Mov) (Reg (General ThirtyTwo rax)) (Storage (Memory ThirtyTwo (A_SizeDirective 32 (A_Plus (A_FromReg (General SixtyFour rsp)) (A_WordConstant 32))))), 4)"
    "fetch 0x1778c \<equiv> (Binary (IS_8088 Mov) (Reg (General ThirtyTwo r8)) (Storage (Memory ThirtyTwo (A_SizeDirective 32 (A_Plus (A_FromReg (General SixtyFour rsp)) (A_WordConstant 56))))), 5)"
    "fetch 0x17791 \<equiv> (Binary (IS_8088 Mov) (Reg (General ThirtyTwo rdx)) (Storage (Memory ThirtyTwo (A_SizeDirective 32 (A_Plus (A_FromReg (General SixtyFour rsp)) (A_WordConstant 36))))), 4)"
    "fetch 0x17795 \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour rcx)) (Storage (Memory SixtyFour (A_SizeDirective 64 (A_Plus (A_FromReg (General SixtyFour rsp)) (A_WordConstant 40))))), 5)"
    "fetch 0x1779a \<equiv> (Unary (IS_80486 Bswap) (Storage (Reg (General ThirtyTwo rax))), 2)"
    "fetch 0x1779c \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour r9)) (Storage (Memory SixtyFour (A_SizeDirective 64 (A_Plus (A_FromReg (General SixtyFour rsp)) (A_WordConstant 48))))), 5)"
    "fetch 0x177a1 \<equiv> (Unary (IS_80486 Bswap) (Storage (Reg (General ThirtyTwo r8))), 3)"
    "fetch 0x177a4 \<equiv> (Binary (IS_8088 Cmp) (Reg (General ThirtyTwo rax)) (Immediate SixtyFour (ImmVal 627086611)), 5)"
    "fetch 0x177a9 \<equiv> (Unary (IS_8088 Jne) (Immediate SixtyFour (ImmVal 97006)), 6)"
    "fetch 0x177af \<equiv> (Binary (IS_8088 Cmp) (Memory ThirtyTwo (A_SizeDirective 32 (A_Plus (A_FromReg (General SixtyFour rsp)) (A_WordConstant 152)))) (Storage (Reg (General ThirtyTwo r8))), 8)"
    "fetch 0x177b7 \<equiv> (Unary (IS_8088 Jb) (Immediate SixtyFour (ImmVal 96520)), 6)"
    "fetch 0x177bd \<equiv> (Binary (IS_8088 Mov) (Reg (General ThirtyTwo r10)) (Storage (Reg (General ThirtyTwo r8))), 3)"
    "fetch 0x177c0 \<equiv> (Unary (IS_80486 Bswap) (Storage (Reg (General SixtyFour r9))), 3)"
    "fetch 0x177c3 \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour rax)) (Storage (Reg (General SixtyFour r10))), 3)"
    "fetch 0x177c6 \<equiv> (Binary (IS_8088 Add) (Reg (General SixtyFour rax)) (Storage (Reg (General SixtyFour r9))), 3)"
    "fetch 0x177c9 \<equiv> (Unary (IS_8088 Jb) (Immediate SixtyFour (ImmVal 97080)), 6)"
    "fetch 0x177cf \<equiv> (Binary (IS_8088 Cmp) (Reg (General SixtyFour rax)) (Storage (Reg (General SixtyFour rbp))), 3)"
    "fetch 0x177d2 \<equiv> (Unary (IS_8088 Ja) (Immediate SixtyFour (ImmVal 96568)), 6)"
    "fetch 0x177d8 \<equiv> (Binary (IS_8088 Mov) (Reg (General ThirtyTwo rax)) (Storage (Reg (General ThirtyTwo rdx))), 2)"
    "fetch 0x177da \<equiv> (Unary (IS_80486 Bswap) (Storage (Reg (General SixtyFour rcx))), 3)"
    "fetch 0x177dd \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour rbp)) (Storage (Reg (General SixtyFour rcx))), 3)"
    "fetch 0x177e0 \<equiv> (Unary (IS_80486 Bswap) (Storage (Reg (General ThirtyTwo rax))), 2)"
    "fetch 0x177e2 \<equiv> (Binary (IS_8088 Cmp) (Reg (General ThirtyTwo rax)) (Immediate SixtyFour (ImmVal 1)), 3)"
    "fetch 0x177e5 \<equiv> (Unary (IS_8088 Je) (Immediate SixtyFour (ImmVal 96368)), 6)"
    "fetch 0x177eb \<equiv> (Binary (IS_8088 Test) (Reg (General ThirtyTwo rax)) (Storage (Reg (General ThirtyTwo rax))), 2)"
    "fetch 0x177ed \<equiv> (Unary (IS_8088 Je) (Immediate SixtyFour (ImmVal 96720)), 6)"
    "fetch 0x177f3 \<equiv> (Binary (IS_8088 Cmp) (Reg (General ThirtyTwo rax)) (Immediate SixtyFour (ImmVal 2)), 3)"
    "fetch 0x177f6 \<equiv> (Unary (IS_8088 Je) (Immediate SixtyFour (ImmVal 96696)), 6)"
    "fetch 0x177fc \<equiv> (Binary (IS_8088 Sub) (Reg (General SixtyFour rsp)) (Immediate SixtyFour (ImmVal 8)), 4)"
    "fetch 0x17800 \<equiv> (Binary (IS_8088 Mov) (Reg (General ThirtyTwo r9)) (Immediate SixtyFour (ImmVal 655)), 6)"
    "fetch 0x17806 \<equiv> (Binary (IS_8088 Lea) (Reg (General SixtyFour r8)) (Storage (Memory SixtyFour (A_Plus (A_FromReg (General SixtyFour rip)) (A_WordConstant 41163)))), 7)"
    "fetch 0x1780d \<equiv> (Unary (IS_8088 Push) (Storage (Reg (General SixtyFour rax))), 1)"
    "fetch 0x1780e \<equiv> (Binary (IS_8088 Lea) (Reg (General SixtyFour rcx)) (Storage (Memory SixtyFour (A_Plus (A_FromReg (General SixtyFour rip)) (A_WordConstant 40270)))), 7)"
    "fetch 0x17815 \<equiv> (Binary (IS_8088 Lea) (Reg (General SixtyFour rdx)) (Storage (Memory SixtyFour (A_Plus (A_FromReg (General SixtyFour rip)) (A_WordConstant 41044)))), 7)"
    "fetch 0x1781c \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour rdi)) (Storage (Memory SixtyFour (A_SizeDirective 64 (A_Plus (A_FromReg (General SixtyFour rip)) (A_WordConstant 76509))))), 7)"
    "fetch 0x17823 \<equiv> (Binary (IS_8088 Mov) (Reg (General ThirtyTwo rsi)) (Immediate SixtyFour (ImmVal 1)), 5)"
    "fetch 0x17828 \<equiv> (Binary (IS_8088 Xor) (Reg (General ThirtyTwo rax)) (Storage (Reg (General ThirtyTwo rax))), 2)"
    "fetch 0x1782a \<equiv> (Binary (IS_8088 Mov) (Reg (General ThirtyTwo r12)) (Immediate SixtyFour (ImmVal 4294967295)), 6)"
    "fetch 0x17830 \<equiv> (Unary (IS_8088 Call) (Immediate SixtyFour (ImmLabel ''__fprintf_chk'')), 5)"
    "fetch 0x17835 \<equiv> (Unary (IS_8088 Call) (Immediate SixtyFour (ImmLabel ''__errno_location'')), 5)"
    "fetch 0x1783a \<equiv> (Binary (IS_8088 Mov) (Memory ThirtyTwo (A_SizeDirective 32 (A_FromReg (General SixtyFour rax)))) (Immediate SixtyFour (ImmVal 22)), 6)"
    "fetch 0x17840 \<equiv> (Unary (IS_8088 Pop) (Storage (Reg (General SixtyFour rax))), 1)"
    "fetch 0x17841 \<equiv> (Unary (IS_8088 Pop) (Storage (Reg (General SixtyFour rdx))), 1)"
    "fetch 0x17842 \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour rbx)) (Storage (Memory SixtyFour (A_SizeDirective 64 (A_Plus (A_FromReg (General SixtyFour rsp)) (A_WordConstant 72))))), 5)"
    "fetch 0x17847 \<equiv> (Binary (IS_8088 Xor) (Reg (General SixtyFour rbx)) (Storage (Memory SixtyFour (A_SizeDirective 64 (A_Plus (A_FromReg (General SixtyFour fs)) (A_WordConstant 40))))), 9)"
    "fetch 0x17850 \<equiv> (Binary (IS_8088 Mov) (Reg (General ThirtyTwo rax)) (Storage (Reg (General ThirtyTwo r12))), 3)"
    "fetch 0x17853 \<equiv> (Unary (IS_8088 Jne) (Immediate SixtyFour (ImmVal 97075)), 6)"
    "fetch 0x17859 \<equiv> (Binary (IS_8088 Add) (Reg (General SixtyFour rsp)) (Immediate SixtyFour (ImmVal 88)), 4)"
    "fetch 0x1785d \<equiv> (Unary (IS_8088 Pop) (Storage (Reg (General SixtyFour rbx))), 1)"
    "fetch 0x1785e \<equiv> (Unary (IS_8088 Pop) (Storage (Reg (General SixtyFour rbp))), 1)"
    "fetch 0x1785f \<equiv> (Unary (IS_8088 Pop) (Storage (Reg (General SixtyFour r12))), 2)"
    "fetch 0x17861 \<equiv> (Unary (IS_8088 Pop) (Storage (Reg (General SixtyFour r13))), 2)"
    "fetch 0x17863 \<equiv> (Unary (IS_8088 Pop) (Storage (Reg (General SixtyFour r14))), 2)"
    "fetch 0x17865 \<equiv> (Unary (IS_8088 Pop) (Storage (Reg (General SixtyFour r15))), 2)"
    "fetch 0x17867 \<equiv> (Nullary (IS_8088 Ret), 1)"
    "fetch 0x17868 \<equiv> (Unary (IS_8088 Nop) (Storage (Memory ThirtyTwo (A_SizeDirective 32 (A_Plus (A_FromReg (General SixtyFour rax)) (A_Plus (A_Mult 1 (A_FromReg (General SixtyFour rax))) (A_WordConstant 0)))))), 8)"
    "fetch 0x17870 \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour rdx)) (Storage (Reg (General SixtyFour r10))), 3)"
    "fetch 0x17873 \<equiv> (Binary (IS_8088 Mov) (Reg (General ThirtyTwo rcx)) (Immediate SixtyFour (ImmVal 1)), 5)"
    "fetch 0x17878 \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour rsi)) (Storage (Reg (General SixtyFour r13))), 3)"
    "fetch 0x1787b \<equiv> (Binary (IS_8088 Mov) (Reg (General ThirtyTwo rdi)) (Storage (Reg (General ThirtyTwo rbx))), 2)"
    "fetch 0x1787d \<equiv> (Binary (IS_8088 Mov) (Memory ThirtyTwo (A_SizeDirective 32 (A_Plus (A_FromReg (General SixtyFour rsp)) (A_WordConstant 28)))) (Storage (Reg (General ThirtyTwo r8))), 5)"
    "fetch 0x17882 \<equiv> (Binary (IS_8088 Mov) (Memory SixtyFour (A_SizeDirective 64 (A_Plus (A_FromReg (General SixtyFour rsp)) (A_WordConstant 16)))) (Storage (Reg (General SixtyFour r9))), 5)"
    "fetch 0x17887 \<equiv> (Binary (IS_8088 Mov) (Memory SixtyFour (A_SizeDirective 64 (A_Plus (A_FromReg (General SixtyFour rsp)) (A_WordConstant 8)))) (Storage (Reg (General SixtyFour r10))), 5)"
    "fetch 0x1788c \<equiv> (Unary (IS_8088 Call) (Immediate SixtyFour (ImmLabel ''nbd_wr_sync'')), 5)"
    "fetch 0x17891 \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour r10)) (Storage (Memory SixtyFour (A_SizeDirective 64 (A_Plus (A_FromReg (General SixtyFour rsp)) (A_WordConstant 8))))), 5)"
    "fetch 0x17896 \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour r9)) (Storage (Memory SixtyFour (A_SizeDirective 64 (A_Plus (A_FromReg (General SixtyFour rsp)) (A_WordConstant 16))))), 5)"
    "fetch 0x1789b \<equiv> (Binary (IS_8088 Mov) (Reg (General ThirtyTwo r8)) (Storage (Memory ThirtyTwo (A_SizeDirective 32 (A_Plus (A_FromReg (General SixtyFour rsp)) (A_WordConstant 28))))), 5)"
    "fetch 0x178a0 \<equiv> (Binary (IS_8088 Cmp) (Reg (General SixtyFour r10)) (Storage (Reg (General SixtyFour rax))), 3)"
    "fetch 0x178a3 \<equiv> (Unary (IS_8088 Jne) (Immediate SixtyFour (ImmVal 96880)), 6)"
    "fetch 0x178a9 \<equiv> (Binary (IS_8088 Cmp) (Memory Eight (A_SizeDirective 8 (A_FromReg (General SixtyFour rsp)))) (Immediate SixtyFour (ImmVal 0)), 4)"
    "fetch 0x178ad \<equiv> (Binary (IS_8088 Mov) (Memory SixtyFour (A_SizeDirective 64 (A_Plus (A_FromReg (General SixtyFour rsp)) (A_WordConstant 8)))) (Storage (Reg (General SixtyFour r10))), 5)"
    "fetch 0x178b2 \<equiv> (Unary (IS_8088 Jne) (Immediate SixtyFour (ImmVal 96864)), 6)"
    "fetch 0x178b8 \<equiv> (Binary (IS_8088 Lea) (Reg (General SixtyFour rsi)) (Storage (Memory SixtyFour (A_Plus (A_FromReg (General SixtyFour r12)) (A_Mult 1 (A_FromReg (General SixtyFour r9)))))), 4)"
    "fetch 0x178bc \<equiv> (Binary (IS_8088 Mov) (Reg (General ThirtyTwo rcx)) (Storage (Reg (General ThirtyTwo r8))), 3)"
    "fetch 0x178bf \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour rdx)) (Storage (Reg (General SixtyFour r13))), 3)"
    "fetch 0x178c2 \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour rdi)) (Storage (Reg (General SixtyFour r15))), 3)"
    "fetch 0x178c5 \<equiv> (Binary (IS_8088 Shr) (Reg (General ThirtyTwo rcx)) (Immediate SixtyFour (ImmVal 9)), 3)"
    "fetch 0x178c8 \<equiv> (Binary (IS_8088 Shr) (Reg (General SixtyFour rsi)) (Immediate SixtyFour (ImmVal 9)), 4)"
    "fetch 0x178cc \<equiv> (Unary (IS_8088 Call) (Immediate SixtyFour (ImmLabel ''bdrv_write'')), 5)"
    "fetch 0x178d1 \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour r10)) (Storage (Memory SixtyFour (A_SizeDirective 64 (A_Plus (A_FromReg (General SixtyFour rsp)) (A_WordConstant 8))))), 5)"
    "fetch 0x178d6 \<equiv> (Binary (IS_8088 Cmp) (Reg (General ThirtyTwo rax)) (Immediate SixtyFour (ImmVal 4294967295)), 3)"
    "fetch 0x178d9 \<equiv> (Binary (IS_8088 Mov) (Reg (General ThirtyTwo r12)) (Storage (Reg (General ThirtyTwo rax))), 3)"
    "fetch 0x178dc \<equiv> (Unary (IS_8088 Je) (Immediate SixtyFour (ImmVal 97043)), 6)"
    "fetch 0x178e2 \<equiv> (Binary (IS_8088 Add) (Memory SixtyFour (A_SizeDirective 64 (A_FromReg (General SixtyFour r14)))) (Storage (Reg (General SixtyFour r10))), 3)"
    "fetch 0x178e5 \<equiv> (Binary (IS_8088 Xor) (Reg (General ThirtyTwo rsi)) (Storage (Reg (General ThirtyTwo rsi))), 2)"
    "fetch 0x178e7 \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour rdx)) (Storage (Reg (General SixtyFour rbp))), 3)"
    "fetch 0x178ea \<equiv> (Binary (IS_8088 Mov) (Reg (General ThirtyTwo rdi)) (Storage (Reg (General ThirtyTwo rbx))), 2)"
    "fetch 0x178ec \<equiv> (Binary (IS_8088 Xor) (Reg (General ThirtyTwo r12)) (Storage (Reg (General ThirtyTwo r12))), 3)"
    "fetch 0x178ef \<equiv> (Unary (IS_8088 Call) (Immediate SixtyFour (ImmLabel ''nbd_send_reply.isra.0'')), 5)"
    "fetch 0x178f4 \<equiv> (Binary (IS_8088 Cmp) (Reg (General ThirtyTwo rax)) (Immediate SixtyFour (ImmVal 4294967295)), 3)"
    "fetch 0x178f7 \<equiv> (Unary (IS_80386 Sete) (Storage (Reg (General Eight r12))), 4)"
    "fetch 0x178fb \<equiv> (Unary (IS_8088 Neg) (Storage (Reg (General ThirtyTwo r12))), 3)"
    "fetch 0x178fe \<equiv> (Unary (IS_8088 Jmp) (Immediate SixtyFour (ImmVal 96322)), 5)"
    "fetch 0x17903 \<equiv> (Unary (IS_8088 Nop) (Storage (Memory ThirtyTwo (A_SizeDirective 32 (A_Plus (A_FromReg (General SixtyFour rax)) (A_Plus (A_Mult 1 (A_FromReg (General SixtyFour rax))) (A_WordConstant 0)))))), 5)"
    "fetch 0x17908 \<equiv> (Binary (IS_8088 Mov) (Reg (General ThirtyTwo rax)) (Storage (Memory ThirtyTwo (A_SizeDirective 32 (A_Plus (A_FromReg (General SixtyFour rsp)) (A_WordConstant 152))))), 7)"
    "fetch 0x1790f \<equiv> (Binary (IS_8088 Mov) (Reg (General ThirtyTwo r9)) (Immediate SixtyFour (ImmVal 569)), 6)"
    "fetch 0x17915 \<equiv> (Binary (IS_8088 Lea) (Reg (General SixtyFour rcx)) (Storage (Memory SixtyFour (A_Plus (A_FromReg (General SixtyFour rip)) (A_WordConstant 40007)))), 7)"
    "fetch 0x1791c \<equiv> (Binary (IS_8088 Lea) (Reg (General SixtyFour rdx)) (Storage (Memory SixtyFour (A_Plus (A_FromReg (General SixtyFour rip)) (A_WordConstant 40405)))), 7)"
    "fetch 0x17923 \<equiv> (Unary (IS_8088 Push) (Storage (Reg (General SixtyFour rax))), 1)"
    "fetch 0x17924 \<equiv> (Unary (IS_8088 Push) (Storage (Reg (General SixtyFour r8))), 2)"
    "fetch 0x17926 \<equiv> (Binary (IS_8088 Lea) (Reg (General SixtyFour r8)) (Storage (Memory SixtyFour (A_Plus (A_FromReg (General SixtyFour rip)) (A_WordConstant 40875)))), 7)"
    "fetch 0x1792d \<equiv> (Unary (IS_8088 Jmp) (Immediate SixtyFour (ImmVal 96284)), 5)"
    "fetch 0x17932 \<equiv> (Unary (IS_8088 Nop) (Storage (Memory Sixteen (A_SizeDirective 16 (A_Plus (A_FromReg (General SixtyFour rax)) (A_Plus (A_Mult 1 (A_FromReg (General SixtyFour rax))) (A_WordConstant 0)))))), 6)"
    "fetch 0x17938 \<equiv> (Unary (IS_8088 Push) (Storage (Reg (General SixtyFour r12))), 2)"
    "fetch 0x1793a \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour rdi)) (Storage (Memory SixtyFour (A_SizeDirective 64 (A_Plus (A_FromReg (General SixtyFour rip)) (A_WordConstant 76223))))), 7)"
    "fetch 0x17941 \<equiv> (Binary (IS_8088 Mov) (Reg (General ThirtyTwo rsi)) (Immediate SixtyFour (ImmVal 1)), 5)"
    "fetch 0x17946 \<equiv> (Binary (IS_8088 Xor) (Reg (General ThirtyTwo rax)) (Storage (Reg (General ThirtyTwo rax))), 2)"
    "fetch 0x17948 \<equiv> (Unary (IS_8088 Push) (Storage (Reg (General SixtyFour rbp))), 1)"
    "fetch 0x17949 \<equiv> (Binary (IS_8088 Lea) (Reg (General SixtyFour rcx)) (Storage (Memory SixtyFour (A_Plus (A_FromReg (General SixtyFour rip)) (A_WordConstant 39955)))), 7)"
    "fetch 0x17950 \<equiv> (Binary (IS_8088 Lea) (Reg (General SixtyFour rdx)) (Storage (Memory SixtyFour (A_Plus (A_FromReg (General SixtyFour rip)) (A_WordConstant 40481)))), 7)"
    "fetch 0x17957 \<equiv> (Unary (IS_8088 Push) (Storage (Reg (General SixtyFour r8))), 2)"
    "fetch 0x17959 \<equiv> (Binary (IS_8088 Lea) (Reg (General SixtyFour r8)) (Storage (Memory SixtyFour (A_Plus (A_FromReg (General SixtyFour rip)) (A_WordConstant 40824)))), 7)"
    "fetch 0x17960 \<equiv> (Unary (IS_8088 Push) (Storage (Reg (General SixtyFour r9))), 2)"
    "fetch 0x17962 \<equiv> (Binary (IS_8088 Mov) (Reg (General ThirtyTwo r9)) (Immediate SixtyFour (ImmVal 584)), 6)"
    "fetch 0x17968 \<equiv> (Unary (IS_8088 Call) (Immediate SixtyFour (ImmLabel ''__fprintf_chk'')), 5)"
    "fetch 0x1796d \<equiv> (Binary (IS_8088 Add) (Reg (General SixtyFour rsp)) (Immediate SixtyFour (ImmVal 32)), 4)"
    "fetch 0x17971 \<equiv> (Binary (IS_8088 Mov) (Reg (General ThirtyTwo r9)) (Immediate SixtyFour (ImmVal 585)), 6)"
    "fetch 0x17977 \<equiv> (Binary (IS_8088 Lea) (Reg (General SixtyFour r8)) (Storage (Memory SixtyFour (A_Plus (A_FromReg (General SixtyFour rip)) (A_WordConstant 40794)))), 7)"
    "fetch 0x1797e \<equiv> (Binary (IS_8088 Lea) (Reg (General SixtyFour rcx)) (Storage (Memory SixtyFour (A_Plus (A_FromReg (General SixtyFour rip)) (A_WordConstant 39902)))), 7)"
    "fetch 0x17985 \<equiv> (Binary (IS_8088 Lea) (Reg (General SixtyFour rdx)) (Storage (Memory SixtyFour (A_Plus (A_FromReg (General SixtyFour rip)) (A_WordConstant 40492)))), 7)"
    "fetch 0x1798c \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour rdi)) (Storage (Memory SixtyFour (A_SizeDirective 64 (A_Plus (A_FromReg (General SixtyFour rip)) (A_WordConstant 76141))))), 7)"
    "fetch 0x17993 \<equiv> (Binary (IS_8088 Mov) (Reg (General ThirtyTwo rsi)) (Immediate SixtyFour (ImmVal 1)), 5)"
    "fetch 0x17998 \<equiv> (Binary (IS_8088 Xor) (Reg (General ThirtyTwo rax)) (Storage (Reg (General ThirtyTwo rax))), 2)"
    "fetch 0x1799a \<equiv> (Binary (IS_8088 Mov) (Reg (General ThirtyTwo r12)) (Immediate SixtyFour (ImmVal 4294967295)), 6)"
    "fetch 0x179a0 \<equiv> (Unary (IS_8088 Call) (Immediate SixtyFour (ImmLabel ''__fprintf_chk'')), 5)"
    "fetch 0x179a5 \<equiv> (Unary (IS_8088 Call) (Immediate SixtyFour (ImmLabel ''__errno_location'')), 5)"
    "fetch 0x179aa \<equiv> (Binary (IS_8088 Mov) (Memory ThirtyTwo (A_SizeDirective 32 (A_FromReg (General SixtyFour rax)))) (Immediate SixtyFour (ImmVal 22)), 6)"
    "fetch 0x179b0 \<equiv> (Unary (IS_8088 Jmp) (Immediate SixtyFour (ImmVal 96322)), 5)"
    "fetch 0x179b5 \<equiv> (Unary (IS_8088 Nop) (Storage (Memory ThirtyTwo (A_SizeDirective 32 (A_FromReg (General SixtyFour rax))))), 3)"
    "fetch 0x179b8 \<equiv> (Unary (IS_8088 Call) (Immediate SixtyFour (ImmLabel ''__errno_location'')), 5)"
    "fetch 0x179bd \<equiv> (Binary (IS_8088 Mov) (Reg (General ThirtyTwo r12)) (Immediate SixtyFour (ImmVal 1)), 6)"
    "fetch 0x179c3 \<equiv> (Binary (IS_8088 Mov) (Memory ThirtyTwo (A_SizeDirective 32 (A_FromReg (General SixtyFour rax)))) (Immediate SixtyFour (ImmVal 0)), 6)"
    "fetch 0x179c9 \<equiv> (Unary (IS_8088 Jmp) (Immediate SixtyFour (ImmVal 96322)), 5)"
    "fetch 0x179ce \<equiv> (Binary (IS_8088 Xchg) (Reg (General Sixteen rax)) (Storage (Reg (General Sixteen rax))), 2)"
    "fetch 0x179d0 \<equiv> (Binary (IS_8088 Lea) (Reg (General SixtyFour rsi)) (Storage (Memory SixtyFour (A_Plus (A_FromReg (General SixtyFour r12)) (A_Mult 1 (A_FromReg (General SixtyFour r9)))))), 4)"
    "fetch 0x179d4 \<equiv> (Binary (IS_8088 Mov) (Reg (General ThirtyTwo rcx)) (Storage (Reg (General ThirtyTwo r8))), 3)"
    "fetch 0x179d7 \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour rdx)) (Storage (Reg (General SixtyFour r13))), 3)"
    "fetch 0x179da \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour rdi)) (Storage (Reg (General SixtyFour r15))), 3)"
    "fetch 0x179dd \<equiv> (Binary (IS_8088 Shr) (Reg (General ThirtyTwo rcx)) (Immediate SixtyFour (ImmVal 9)), 3)"
    "fetch 0x179e0 \<equiv> (Binary (IS_8088 Shr) (Reg (General SixtyFour rsi)) (Immediate SixtyFour (ImmVal 9)), 4)"
    "fetch 0x179e4 \<equiv> (Binary (IS_8088 Mov) (Memory SixtyFour (A_SizeDirective 64 (A_FromReg (General SixtyFour rsp)))) (Storage (Reg (General SixtyFour r10))), 4)"
    "fetch 0x179e8 \<equiv> (Unary (IS_8088 Call) (Immediate SixtyFour (ImmLabel ''bdrv_read'')), 5)"
    "fetch 0x179ed \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour r10)) (Storage (Memory SixtyFour (A_SizeDirective 64 (A_FromReg (General SixtyFour rsp))))), 4)"
    "fetch 0x179f1 \<equiv> (Binary (IS_8088 Cmp) (Reg (General ThirtyTwo rax)) (Immediate SixtyFour (ImmVal 4294967295)), 3)"
    "fetch 0x179f4 \<equiv> (Binary (IS_8088 Mov) (Reg (General ThirtyTwo r12)) (Storage (Reg (General ThirtyTwo rax))), 3)"
    "fetch 0x179f7 \<equiv> (Unary (IS_8088 Je) (Immediate SixtyFour (ImmVal 96912)), 6)"
    "fetch 0x179fd \<equiv> (Binary (IS_8088 Add) (Memory SixtyFour (A_SizeDirective 64 (A_FromReg (General SixtyFour r14)))) (Storage (Reg (General SixtyFour r10))), 3)"
    "fetch 0x17a00 \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour rdx)) (Storage (Reg (General SixtyFour rbp))), 3)"
    "fetch 0x17a03 \<equiv> (Binary (IS_8088 Xor) (Reg (General ThirtyTwo rsi)) (Storage (Reg (General ThirtyTwo rsi))), 2)"
    "fetch 0x17a05 \<equiv> (Binary (IS_8088 Mov) (Reg (General ThirtyTwo rdi)) (Storage (Reg (General ThirtyTwo rbx))), 2)"
    "fetch 0x17a07 \<equiv> (Binary (IS_8088 Mov) (Memory SixtyFour (A_SizeDirective 64 (A_FromReg (General SixtyFour rsp)))) (Storage (Reg (General SixtyFour r10))), 4)"
    "fetch 0x17a0b \<equiv> (Unary (IS_8088 Call) (Immediate SixtyFour (ImmLabel ''nbd_send_reply.isra.0'')), 5)"
    "fetch 0x17a10 \<equiv> (Binary (IS_8088 Mov) (Reg (General ThirtyTwo r12)) (Storage (Reg (General ThirtyTwo rax))), 3)"
    "fetch 0x17a13 \<equiv> (Binary (IS_8088 Cmp) (Reg (General ThirtyTwo rax)) (Immediate SixtyFour (ImmVal 4294967295)), 3)"
    "fetch 0x17a16 \<equiv> (Unary (IS_8088 Je) (Immediate SixtyFour (ImmVal 96322)), 6)"
    "fetch 0x17a1c \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour r10)) (Storage (Memory SixtyFour (A_SizeDirective 64 (A_FromReg (General SixtyFour rsp))))), 4)"
    "fetch 0x17a20 \<equiv> (Binary (IS_8088 Xor) (Reg (General ThirtyTwo rcx)) (Storage (Reg (General ThirtyTwo rcx))), 2)"
    "fetch 0x17a22 \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour rsi)) (Storage (Reg (General SixtyFour r13))), 3)"
    "fetch 0x17a25 \<equiv> (Binary (IS_8088 Mov) (Reg (General ThirtyTwo rdi)) (Storage (Reg (General ThirtyTwo rbx))), 2)"
    "fetch 0x17a27 \<equiv> (Binary (IS_8088 Xor) (Reg (General ThirtyTwo r12)) (Storage (Reg (General ThirtyTwo r12))), 3)"
    "fetch 0x17a2a \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour rdx)) (Storage (Reg (General SixtyFour r10))), 3)"
    "fetch 0x17a2d \<equiv> (Unary (IS_8088 Call) (Immediate SixtyFour (ImmLabel ''nbd_wr_sync'')), 5)"
    "fetch 0x17a32 \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour r10)) (Storage (Memory SixtyFour (A_SizeDirective 64 (A_FromReg (General SixtyFour rsp))))), 4)"
    "fetch 0x17a36 \<equiv> (Binary (IS_8088 Cmp) (Reg (General SixtyFour r10)) (Storage (Reg (General SixtyFour rax))), 3)"
    "fetch 0x17a39 \<equiv> (Unary (IS_8088 Je) (Immediate SixtyFour (ImmVal 96322)), 6)"
    "fetch 0x17a3f \<equiv> (Binary (IS_8088 Mov) (Reg (General ThirtyTwo r9)) (Immediate SixtyFour (ImmVal 615)), 6)"
    "fetch 0x17a45 \<equiv> (Binary (IS_8088 Lea) (Reg (General SixtyFour r8)) (Storage (Memory SixtyFour (A_Plus (A_FromReg (General SixtyFour rip)) (A_WordConstant 40588)))), 7)"
    "fetch 0x17a4c \<equiv> (Binary (IS_8088 Lea) (Reg (General SixtyFour rcx)) (Storage (Memory SixtyFour (A_Plus (A_FromReg (General SixtyFour rip)) (A_WordConstant 39696)))), 7)"
    "fetch 0x17a53 \<equiv> (Binary (IS_8088 Lea) (Reg (General SixtyFour rdx)) (Storage (Memory SixtyFour (A_Plus (A_FromReg (General SixtyFour rip)) (A_WordConstant 39750)))), 7)"
    "fetch 0x17a5a \<equiv> (Unary (IS_8088 Jmp) (Immediate SixtyFour (ImmVal 96652)), 5)"
    "fetch 0x17a5f \<equiv> (Nullary (IS_8088 Nop), 1)"
    "fetch 0x17a60 \<equiv> (Binary (IS_8088 Mov) (Reg (General ThirtyTwo rsi)) (Immediate SixtyFour (ImmVal 1)), 5)"
    "fetch 0x17a65 \<equiv> (Unary (IS_8088 Jmp) (Immediate SixtyFour (ImmVal 96487)), 5)"
    "fetch 0x17a6a \<equiv> (Unary (IS_8088 Nop) (Storage (Memory Sixteen (A_SizeDirective 16 (A_Plus (A_FromReg (General SixtyFour rax)) (A_Plus (A_Mult 1 (A_FromReg (General SixtyFour rax))) (A_WordConstant 0)))))), 6)"
    "fetch 0x17a70 \<equiv> (Binary (IS_8088 Mov) (Reg (General ThirtyTwo r9)) (Immediate SixtyFour (ImmVal 626)), 6)"
    "fetch 0x17a76 \<equiv> (Binary (IS_8088 Lea) (Reg (General SixtyFour r8)) (Storage (Memory SixtyFour (A_Plus (A_FromReg (General SixtyFour rip)) (A_WordConstant 40539)))), 7)"
    "fetch 0x17a7d \<equiv> (Binary (IS_8088 Lea) (Reg (General SixtyFour rcx)) (Storage (Memory SixtyFour (A_Plus (A_FromReg (General SixtyFour rip)) (A_WordConstant 39647)))), 7)"
    "fetch 0x17a84 \<equiv> (Binary (IS_8088 Lea) (Reg (General SixtyFour rdx)) (Storage (Memory SixtyFour (A_Plus (A_FromReg (General SixtyFour rip)) (A_WordConstant 40333)))), 7)"
    "fetch 0x17a8b \<equiv> (Unary (IS_8088 Jmp) (Immediate SixtyFour (ImmVal 96652)), 5)"
    "fetch 0x17a90 \<equiv> (Binary (IS_8088 Mov) (Reg (General ThirtyTwo r9)) (Immediate SixtyFour (ImmVal 601)), 6)"
    "fetch 0x17a96 \<equiv> (Binary (IS_8088 Lea) (Reg (General SixtyFour r8)) (Storage (Memory SixtyFour (A_Plus (A_FromReg (General SixtyFour rip)) (A_WordConstant 40507)))), 7)"
    "fetch 0x17a9d \<equiv> (Binary (IS_8088 Lea) (Reg (General SixtyFour rcx)) (Storage (Memory SixtyFour (A_Plus (A_FromReg (General SixtyFour rip)) (A_WordConstant 39615)))), 7)"
    "fetch 0x17aa4 \<equiv> (Binary (IS_8088 Lea) (Reg (General SixtyFour rdx)) (Storage (Memory SixtyFour (A_Plus (A_FromReg (General SixtyFour rip)) (A_WordConstant 40261)))), 7)"
    "fetch 0x17aab \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour rdi)) (Storage (Memory SixtyFour (A_SizeDirective 64 (A_Plus (A_FromReg (General SixtyFour rip)) (A_WordConstant 75854))))), 7)"
    "fetch 0x17ab2 \<equiv> (Binary (IS_8088 Mov) (Reg (General ThirtyTwo rsi)) (Immediate SixtyFour (ImmVal 1)), 5)"
    "fetch 0x17ab7 \<equiv> (Binary (IS_8088 Xor) (Reg (General ThirtyTwo rax)) (Storage (Reg (General ThirtyTwo rax))), 2)"
    "fetch 0x17ab9 \<equiv> (Unary (IS_8088 Call) (Immediate SixtyFour (ImmLabel ''__fprintf_chk'')), 5)"
    "fetch 0x17abe \<equiv> (Unary (IS_8088 Call) (Immediate SixtyFour (ImmLabel ''__errno_location'')), 5)"
    "fetch 0x17ac3 \<equiv> (Binary (IS_8088 Mov) (Memory ThirtyTwo (A_SizeDirective 32 (A_FromReg (General SixtyFour rax)))) (Immediate SixtyFour (ImmVal 22)), 6)"
    "fetch 0x17ac9 \<equiv> (Unary (IS_8088 Jmp) (Immediate SixtyFour (ImmVal 96322)), 5)"
    "fetch 0x17ace \<equiv> (Binary (IS_8088 Mov) (Reg (General ThirtyTwo r9)) (Immediate SixtyFour (ImmVal 467)), 6)"
    "fetch 0x17ad4 \<equiv> (Binary (IS_8088 Lea) (Reg (General SixtyFour r8)) (Storage (Memory SixtyFour (A_Plus (A_FromReg (General SixtyFour rip)) (A_WordConstant 40421)))), 7)"
    "fetch 0x17adb \<equiv> (Binary (IS_8088 Lea) (Reg (General SixtyFour rcx)) (Storage (Memory SixtyFour (A_Plus (A_FromReg (General SixtyFour rip)) (A_WordConstant 39553)))), 7)"
    "fetch 0x17ae2 \<equiv> (Binary (IS_8088 Lea) (Reg (General SixtyFour rdx)) (Storage (Memory SixtyFour (A_Plus (A_FromReg (General SixtyFour rip)) (A_WordConstant 39579)))), 7)"
    "fetch 0x17ae9 \<equiv> (Unary (IS_8088 Jmp) (Immediate SixtyFour (ImmVal 96652)), 5)"
    "fetch 0x17aee \<equiv> (Binary (IS_8088 Sub) (Reg (General SixtyFour rsp)) (Immediate SixtyFour (ImmVal 8)), 4)"
    "fetch 0x17af2 \<equiv> (Binary (IS_8088 Mov) (Reg (General ThirtyTwo r9)) (Immediate SixtyFour (ImmVal 491)), 6)"
    "fetch 0x17af8 \<equiv> (Binary (IS_8088 Lea) (Reg (General SixtyFour r8)) (Storage (Memory SixtyFour (A_Plus (A_FromReg (General SixtyFour rip)) (A_WordConstant 40385)))), 7)"
    "fetch 0x17aff \<equiv> (Unary (IS_8088 Push) (Storage (Reg (General SixtyFour rax))), 1)"
    "fetch 0x17b00 \<equiv> (Binary (IS_8088 Lea) (Reg (General SixtyFour rcx)) (Storage (Memory SixtyFour (A_Plus (A_FromReg (General SixtyFour rip)) (A_WordConstant 39516)))), 7)"
    "fetch 0x17b07 \<equiv> (Binary (IS_8088 Lea) (Reg (General SixtyFour rdx)) (Storage (Memory SixtyFour (A_Plus (A_FromReg (General SixtyFour rip)) (A_WordConstant 39874)))), 7)"
    "fetch 0x17b0e \<equiv> (Unary (IS_8088 Jmp) (Immediate SixtyFour (ImmVal 96284)), 5)"
    "fetch 0x17b13 \<equiv> (Binary (IS_8088 Mov) (Reg (General ThirtyTwo r9)) (Immediate SixtyFour (ImmVal 639)), 6)"
    "fetch 0x17b19 \<equiv> (Binary (IS_8088 Lea) (Reg (General SixtyFour r8)) (Storage (Memory SixtyFour (A_Plus (A_FromReg (General SixtyFour rip)) (A_WordConstant 40376)))), 7)"
    "fetch 0x17b20 \<equiv> (Binary (IS_8088 Lea) (Reg (General SixtyFour rcx)) (Storage (Memory SixtyFour (A_Plus (A_FromReg (General SixtyFour rip)) (A_WordConstant 39484)))), 7)"
    "fetch 0x17b27 \<equiv> (Binary (IS_8088 Lea) (Reg (General SixtyFour rdx)) (Storage (Memory SixtyFour (A_Plus (A_FromReg (General SixtyFour rip)) (A_WordConstant 40218)))), 7)"
    "fetch 0x17b2e \<equiv> (Unary (IS_8088 Jmp) (Immediate SixtyFour (ImmVal 96939)), 5)"
    "fetch 0x17b33 \<equiv> (Unary (IS_8088 Call) (Immediate SixtyFour (ImmLabel ''__stack_chk_fail'')), 5)"
    "fetch 0x17b38 \<equiv> (Binary (IS_8088 Mov) (Reg (General ThirtyTwo r9)) (Immediate SixtyFour (ImmVal 576)), 6)"
    "fetch 0x17b3e \<equiv> (Binary (IS_8088 Lea) (Reg (General SixtyFour r8)) (Storage (Memory SixtyFour (A_Plus (A_FromReg (General SixtyFour rip)) (A_WordConstant 40339)))), 7)"
    "fetch 0x17b45 \<equiv> (Binary (IS_8088 Lea) (Reg (General SixtyFour rcx)) (Storage (Memory SixtyFour (A_Plus (A_FromReg (General SixtyFour rip)) (A_WordConstant 39447)))), 7)"
    "fetch 0x17b4c \<equiv> (Binary (IS_8088 Lea) (Reg (General SixtyFour rdx)) (Storage (Memory SixtyFour (A_Plus (A_FromReg (General SixtyFour rip)) (A_WordConstant 39901)))), 7)"
    "fetch 0x17b53 \<equiv> (Unary (IS_8088 Jmp) (Immediate SixtyFour (ImmVal 96652)), 5)"
    "fetch 0x17eb0 \<equiv> (Unary (IS_8088 Push) (Storage (Reg (General SixtyFour rbx))), 1)"
    "fetch 0x17eb1 \<equiv> (Binary (IS_8088 Mov) (Reg (General ThirtyTwo rsi)) (Immediate SixtyFour (ImmVal 58)), 5)"
    "fetch 0x17eb6 \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour rbx)) (Storage (Reg (General SixtyFour rdi))), 3)"
    "fetch 0x17eb9 \<equiv> (Unary (IS_8088 Call) (Immediate SixtyFour (ImmLabel ''strchr'')), 5)"
    "fetch 0x17ebe \<equiv> (Binary (IS_8088 Test) (Reg (General SixtyFour rax)) (Storage (Reg (General SixtyFour rax))), 3)"
    "fetch 0x17ec1 \<equiv> (Binary (IS_8088 Lea) (Reg (General SixtyFour rdx)) (Storage (Memory SixtyFour (A_Plus (A_FromReg (General SixtyFour rax)) (A_WordConstant 1)))), 4)"
    "fetch 0x17ec5 \<equiv> (Binary (IS_PentiumPro Cmovne) (Reg (General SixtyFour rbx)) (Storage (Reg (General SixtyFour rdx))), 4)"
    "fetch 0x17ec9 \<equiv> (Binary (IS_8088 Xor) (Reg (General ThirtyTwo rax)) (Storage (Reg (General ThirtyTwo rax))), 2)"
    "fetch 0x17ecb \<equiv> (Binary (IS_8088 Cmp) (Memory Eight (A_SizeDirective 8 (A_FromReg (General SixtyFour rbx)))) (Immediate SixtyFour (ImmVal 47)), 3)"
    "fetch 0x17ece \<equiv> (Unary (IS_8088 Pop) (Storage (Reg (General SixtyFour rbx))), 1)"
    "fetch 0x17ecf \<equiv> (Unary (IS_80386 Sete) (Storage (Reg (General Eight rax))), 3)"
    "fetch 0x17ed2 \<equiv> (Nullary (IS_8088 Ret), 1)"
    "fetch 0x17ed3 \<equiv> (Unary (IS_8088 Nop) (Storage (Memory Sixteen (A_SizeDirective 16 (A_Plus (A_FromReg (General SixtyFour cs)) (A_Plus (A_FromReg (General SixtyFour rax)) (A_Plus (A_Mult 1 (A_FromReg (General SixtyFour rax))) (A_WordConstant 0))))))), 11)"
    "fetch 0x17ede \<equiv> (Binary (IS_8088 Xchg) (Reg (General Sixteen rax)) (Storage (Reg (General Sixteen rax))), 5)"
    "fetch 0x17ee0 \<equiv> (Binary (IS_8088 Test) (Reg (General ThirtyTwo rsi)) (Storage (Reg (General ThirtyTwo rsi))), 2)"
    "fetch 0x17ee2 \<equiv> (Unary (IS_8088 Jle) (Immediate SixtyFour (ImmVal 98208)), 6)"
    "fetch 0x17ee8 \<equiv> (Unary (IS_8088 Push) (Storage (Reg (General SixtyFour r15))), 2)"
    "fetch 0x17eea \<equiv> (Unary (IS_8088 Push) (Storage (Reg (General SixtyFour r14))), 2)"
    "fetch 0x17eec \<equiv> (Unary (IS_8088 Push) (Storage (Reg (General SixtyFour r13))), 2)"
    "fetch 0x17eee \<equiv> (Binary (IS_X86_64 Movsxd) (Reg (General SixtyFour r13)) (Storage (Reg (General ThirtyTwo rsi))), 3)"
    "fetch 0x17ef1 \<equiv> (Binary (IS_8088 Mov) (Reg (General ThirtyTwo rsi)) (Immediate SixtyFour (ImmVal 58)), 5)"
    "fetch 0x17ef6 \<equiv> (Unary (IS_8088 Push) (Storage (Reg (General SixtyFour r12))), 2)"
    "fetch 0x17ef8 \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour r12)) (Storage (Reg (General SixtyFour rdi))), 3)"
    "fetch 0x17efb \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour rdi)) (Storage (Reg (General SixtyFour rcx))), 3)"
    "fetch 0x17efe \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour r14)) (Storage (Reg (General SixtyFour r13))), 3)"
    "fetch 0x17f01 \<equiv> (Unary (IS_8088 Push) (Storage (Reg (General SixtyFour rbp))), 1)"
    "fetch 0x17f02 \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour rbp)) (Storage (Reg (General SixtyFour rcx))), 3)"
    "fetch 0x17f05 \<equiv> (Unary (IS_8088 Push) (Storage (Reg (General SixtyFour rbx))), 1)"
    "fetch 0x17f06 \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour rbx)) (Storage (Reg (General SixtyFour rdx))), 3)"
    "fetch 0x17f09 \<equiv> (Binary (IS_8088 Sub) (Reg (General SixtyFour rsp)) (Immediate SixtyFour (ImmVal 8)), 4)"
    "fetch 0x17f0d \<equiv> (Unary (IS_8088 Call) (Immediate SixtyFour (ImmLabel ''strchr'')), 5)"
    "fetch 0x17f12 \<equiv> (Binary (IS_8088 Test) (Reg (General SixtyFour rax)) (Storage (Reg (General SixtyFour rax))), 3)"
    "fetch 0x17f15 \<equiv> (Binary (IS_8088 Lea) (Reg (General SixtyFour rdx)) (Storage (Memory SixtyFour (A_Plus (A_FromReg (General SixtyFour rax)) (A_WordConstant 1)))), 4)"
    "fetch 0x17f19 \<equiv> (Binary (IS_PentiumPro Cmove) (Reg (General SixtyFour rdx)) (Storage (Reg (General SixtyFour rbp))), 4)"
    "fetch 0x17f1d \<equiv> (Binary (IS_8088 Cmp) (Memory Eight (A_SizeDirective 8 (A_FromReg (General SixtyFour rdx)))) (Immediate SixtyFour (ImmVal 47)), 3)"
    "fetch 0x17f20 \<equiv> (Unary (IS_8088 Je) (Immediate SixtyFour (ImmVal 98256)), 6)"
    "fetch 0x17f26 \<equiv> (Binary (IS_8088 Mov) (Reg (General ThirtyTwo rsi)) (Immediate SixtyFour (ImmVal 58)), 5)"
    "fetch 0x17f2b \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour rdi)) (Storage (Reg (General SixtyFour rbx))), 3)"
    "fetch 0x17f2e \<equiv> (Unary (IS_8088 Call) (Immediate SixtyFour (ImmLabel ''strchr'')), 5)"
    "fetch 0x17f33 \<equiv> (Binary (IS_8088 Mov) (Reg (General ThirtyTwo rsi)) (Immediate SixtyFour (ImmVal 47)), 5)"
    "fetch 0x17f38 \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour rdi)) (Storage (Reg (General SixtyFour rbx))), 3)"
    "fetch 0x17f3b \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour r15)) (Storage (Reg (General SixtyFour rax))), 3)"
    "fetch 0x17f3e \<equiv> (Unary (IS_8088 Call) (Immediate SixtyFour (ImmLabel ''strrchr'')), 5)"
    "fetch 0x17f43 \<equiv> (Binary (IS_8088 Test) (Reg (General SixtyFour r15)) (Storage (Reg (General SixtyFour r15))), 3)"
    "fetch 0x17f46 \<equiv> (Unary (IS_8088 Je) (Immediate SixtyFour (ImmVal 98232)), 2)"
    "fetch 0x17f48 \<equiv> (Binary (IS_8088 Lea) (Reg (General SixtyFour rdx)) (Storage (Memory SixtyFour (A_Plus (A_FromReg (General SixtyFour r15)) (A_WordConstant 1)))), 4)"
    "fetch 0x17f4c \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour r8)) (Storage (Reg (General SixtyFour rbx))), 3)"
    "fetch 0x17f4f \<equiv> (Binary (IS_8088 Test) (Reg (General SixtyFour rax)) (Storage (Reg (General SixtyFour rax))), 3)"
    "fetch 0x17f52 \<equiv> (Unary (IS_8088 Je) (Immediate SixtyFour (ImmVal 98136)), 2)"
    "fetch 0x17f54 \<equiv> (Binary (IS_8088 Lea) (Reg (General SixtyFour r8)) (Storage (Memory SixtyFour (A_Plus (A_FromReg (General SixtyFour rax)) (A_WordConstant 1)))), 4)"
    "fetch 0x17f58 \<equiv> (Binary (IS_8088 Cmp) (Reg (General SixtyFour r8)) (Storage (Reg (General SixtyFour rdx))), 3)"
    "fetch 0x17f5b \<equiv> (Binary (IS_PentiumPro Cmovae) (Reg (General SixtyFour rdx)) (Storage (Reg (General SixtyFour r8))), 4)"
    "fetch 0x17f5f \<equiv> (Binary (IS_8088 Sub) (Reg (General SixtyFour rdx)) (Storage (Reg (General SixtyFour rbx))), 3)"
    "fetch 0x17f62 \<equiv> (Binary (IS_8088 Cmp) (Reg (General ThirtyTwo r14)) (Storage (Reg (General ThirtyTwo rdx))), 3)"
    "fetch 0x17f65 \<equiv> (Unary (IS_8088 Jg) (Immediate SixtyFour (ImmVal 98216)), 2)"
    "fetch 0x17f67 \<equiv> (Binary (IS_8088 Lea) (Reg (General ThirtyTwo rdx)) (Storage (Memory SixtyFour (A_Minus (A_FromReg (General SixtyFour r14)) (A_WordConstant 1)))), 4)"
    "fetch 0x17f6b \<equiv> (Binary (IS_X86_64 Movsxd) (Reg (General SixtyFour rdx)) (Storage (Reg (General ThirtyTwo rdx))), 3)"
    "fetch 0x17f6e \<equiv> (Binary (IS_8088 Lea) (Reg (General SixtyFour r14)) (Storage (Memory SixtyFour (A_Plus (A_FromReg (General SixtyFour r12)) (A_Mult 1 (A_FromReg (General SixtyFour rdx)))))), 4)"
    "fetch 0x17f72 \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour rsi)) (Storage (Reg (General SixtyFour rbx))), 3)"
    "fetch 0x17f75 \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour rdi)) (Storage (Reg (General SixtyFour r12))), 3)"
    "fetch 0x17f78 \<equiv> (Unary (IS_8088 Call) (Immediate SixtyFour (ImmLabel ''memcpy'')), 5)"
    "fetch 0x17f7d \<equiv> (Binary (IS_8088 Mov) (Memory Eight (A_SizeDirective 8 (A_FromReg (General SixtyFour r14)))) (Immediate SixtyFour (ImmVal 0)), 4)"
    "fetch 0x17f81 \<equiv> (Binary (IS_8088 Add) (Reg (General SixtyFour rsp)) (Immediate SixtyFour (ImmVal 8)), 4)"
    "fetch 0x17f85 \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour rdx)) (Storage (Reg (General SixtyFour rbp))), 3)"
    "fetch 0x17f88 \<equiv> (Unary (IS_8088 Pop) (Storage (Reg (General SixtyFour rbx))), 1)"
    "fetch 0x17f89 \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour rsi)) (Storage (Reg (General SixtyFour r13))), 3)"
    "fetch 0x17f8c \<equiv> (Unary (IS_8088 Pop) (Storage (Reg (General SixtyFour rbp))), 1)"
    "fetch 0x17f8d \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour rdi)) (Storage (Reg (General SixtyFour r12))), 3)"
    "fetch 0x17f90 \<equiv> (Unary (IS_8088 Pop) (Storage (Reg (General SixtyFour r12))), 2)"
    "fetch 0x17f92 \<equiv> (Unary (IS_8088 Pop) (Storage (Reg (General SixtyFour r13))), 2)"
    "fetch 0x17f94 \<equiv> (Unary (IS_8088 Pop) (Storage (Reg (General SixtyFour r14))), 2)"
    "fetch 0x17f96 \<equiv> (Unary (IS_8088 Pop) (Storage (Reg (General SixtyFour r15))), 2)"
    "fetch 0x17f98 \<equiv> (Unary (IS_8088 Jmp) (Immediate SixtyFour (ImmVal 21920)), 5)"
    "fetch 0x17f9d \<equiv> (Unary (IS_8088 Nop) (Storage (Memory ThirtyTwo (A_SizeDirective 32 (A_FromReg (General SixtyFour rax))))), 3)"
    "fetch 0x17fa0 \<equiv> (Nullary (IS_8088 Ret), 1)"
    "fetch 0x17fa1 \<equiv> (Unary (IS_8088 Nop) (Storage (Memory ThirtyTwo (A_SizeDirective 32 (A_Plus (A_FromReg (General SixtyFour rax)) (A_WordConstant 0))))), 7)"
    "fetch 0x17fa8 \<equiv> (Binary (IS_X86_64 Movsxd) (Reg (General SixtyFour rdx)) (Storage (Reg (General ThirtyTwo rdx))), 3)"
    "fetch 0x17fab \<equiv> (Binary (IS_8088 Lea) (Reg (General SixtyFour r14)) (Storage (Memory SixtyFour (A_Plus (A_FromReg (General SixtyFour r12)) (A_Mult 1 (A_FromReg (General SixtyFour rdx)))))), 4)"
    "fetch 0x17faf \<equiv> (Unary (IS_8088 Jmp) (Immediate SixtyFour (ImmVal 98162)), 2)"
    "fetch 0x17fb1 \<equiv> (Unary (IS_8088 Nop) (Storage (Memory ThirtyTwo (A_SizeDirective 32 (A_Plus (A_FromReg (General SixtyFour rax)) (A_WordConstant 0))))), 7)"
    "fetch 0x17fb8 \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour rdx)) (Storage (Reg (General SixtyFour rbx))), 3)"
    "fetch 0x17fbb \<equiv> (Binary (IS_8088 Test) (Reg (General SixtyFour rax)) (Storage (Reg (General SixtyFour rax))), 3)"
    "fetch 0x17fbe \<equiv> (Unary (IS_8088 Jne) (Immediate SixtyFour (ImmVal 98132)), 2)"
    "fetch 0x17fc0 \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour r14)) (Storage (Reg (General SixtyFour r12))), 3)"
    "fetch 0x17fc3 \<equiv> (Binary (IS_8088 Xor) (Reg (General ThirtyTwo rdx)) (Storage (Reg (General ThirtyTwo rdx))), 2)"
    "fetch 0x17fc5 \<equiv> (Unary (IS_8088 Jmp) (Immediate SixtyFour (ImmVal 98162)), 2)"
    "fetch 0x17fc7 \<equiv> (Unary (IS_8088 Nop) (Storage (Memory Sixteen (A_SizeDirective 16 (A_Plus (A_FromReg (General SixtyFour rax)) (A_Plus (A_Mult 1 (A_FromReg (General SixtyFour rax))) (A_WordConstant 0)))))), 9)"
    "fetch 0x17fd0 \<equiv> (Binary (IS_8088 Add) (Reg (General SixtyFour rsp)) (Immediate SixtyFour (ImmVal 8)), 4)"
    "fetch 0x17fd4 \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour rdx)) (Storage (Reg (General SixtyFour rbp))), 3)"
    "fetch 0x17fd7 \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour rsi)) (Storage (Reg (General SixtyFour r13))), 3)"
    "fetch 0x17fda \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour rdi)) (Storage (Reg (General SixtyFour r12))), 3)"
    "fetch 0x17fdd \<equiv> (Unary (IS_8088 Pop) (Storage (Reg (General SixtyFour rbx))), 1)"
    "fetch 0x17fde \<equiv> (Unary (IS_8088 Pop) (Storage (Reg (General SixtyFour rbp))), 1)"
    "fetch 0x17fdf \<equiv> (Unary (IS_8088 Pop) (Storage (Reg (General SixtyFour r12))), 2)"
    "fetch 0x17fe1 \<equiv> (Unary (IS_8088 Pop) (Storage (Reg (General SixtyFour r13))), 2)"
    "fetch 0x17fe3 \<equiv> (Unary (IS_8088 Pop) (Storage (Reg (General SixtyFour r14))), 2)"
    "fetch 0x17fe5 \<equiv> (Unary (IS_8088 Pop) (Storage (Reg (General SixtyFour r15))), 2)"
    "fetch 0x17fe7 \<equiv> (Unary (IS_8088 Jmp) (Immediate SixtyFour (ImmVal 21856)), 5)"
    and \<alpha>_def: \<open>\<alpha> = \<lparr>text_sections = [], data_sections = [], labels_to_offsets = [], binary_offset = 0\<rparr>\<close>
    and errno_location\<^sub>a\<^sub>d\<^sub>d\<^sub>r[simp]: \<open>the (label_to_address \<alpha> ''__errno_location'') = errno_location_addr\<close>
    and fprintf_chk\<^sub>a\<^sub>d\<^sub>d\<^sub>r[simp]: \<open>the (label_to_address \<alpha> ''__fprintf_chk'') = fprintf_chk_addr\<close>
    and stack_chk_fail\<^sub>a\<^sub>d\<^sub>d\<^sub>r[simp]: \<open>the (label_to_address \<alpha> ''__stack_chk_fail'') = stack_chk_fail_addr\<close>
    and bdrv_read\<^sub>a\<^sub>d\<^sub>d\<^sub>r[simp]: \<open>the (label_to_address \<alpha> ''bdrv_read'') = bdrv_read_addr\<close>
    and bdrv_write\<^sub>a\<^sub>d\<^sub>d\<^sub>r[simp]: \<open>the (label_to_address \<alpha> ''bdrv_write'') = bdrv_write_addr\<close>
    and ioctl\<^sub>a\<^sub>d\<^sub>d\<^sub>r[simp]: \<open>the (label_to_address \<alpha> ''ioctl'') = ioctl_addr\<close>
    and memcpy\<^sub>a\<^sub>d\<^sub>d\<^sub>r[simp]: \<open>the (label_to_address \<alpha> ''memcpy'') = memcpy_addr\<close>
    and nbd_send_reply_isra_0\<^sub>a\<^sub>d\<^sub>d\<^sub>r[simp]: \<open>the (label_to_address \<alpha> ''nbd_send_reply.isra.0'') = nbd_send_reply_isra_0_addr\<close>
    and nbd_wr_sync\<^sub>a\<^sub>d\<^sub>d\<^sub>r[simp]: \<open>the (label_to_address \<alpha> ''nbd_wr_sync'') = nbd_wr_sync_addr\<close>
    and strchr\<^sub>a\<^sub>d\<^sub>d\<^sub>r[simp]: \<open>the (label_to_address \<alpha> ''strchr'') = strchr_addr\<close>
    and strlen\<^sub>a\<^sub>d\<^sub>d\<^sub>r[simp]: \<open>the (label_to_address \<alpha> ''strlen'') = strlen_addr\<close>
    and strrchr\<^sub>a\<^sub>d\<^sub>d\<^sub>r[simp]: \<open>the (label_to_address \<alpha> ''strrchr'') = strrchr_addr\<close>
begin

text \<open>Using definitions that don't get unfolded immediately prevents locale argument issues.\<close>
definition \<open>strlen_0x55ad_retval \<equiv> strlen_0x55ad_retval\<^sub>v\<close>
definition \<open>ioctl_0x17513_retval \<equiv> ioctl_0x17513_retval\<^sub>v\<close>
definition \<open>errno_location_0x1751b_retval \<equiv> errno_location_0x1751b_retval\<^sub>v\<close>
definition \<open>ioctl_0x1752f_retval \<equiv> ioctl_0x1752f_retval\<^sub>v\<close>
definition \<open>ioctl_0x1753d_retval \<equiv> ioctl_0x1753d_retval\<^sub>v\<close>
definition \<open>nbd_wr_sync_0x17651_retval \<equiv> nbd_wr_sync_0x17651_retval\<^sub>v\<close>
definition \<open>fprintf_chk_0x176c1_retval \<equiv> fprintf_chk_0x176c1_retval\<^sub>v\<close>
definition \<open>errno_location_0x176c6_retval \<equiv> errno_location_0x176c6_retval\<^sub>v\<close>
definition \<open>fprintf_chk_0x17706_retval \<equiv> fprintf_chk_0x17706_retval\<^sub>v\<close>
definition \<open>errno_location_0x1770b_retval \<equiv> errno_location_0x1770b_retval\<^sub>v\<close>
definition \<open>stack_chk_fail_0x17722_retval \<equiv> stack_chk_fail_0x17722_retval\<^sub>v\<close>
definition \<open>nbd_wr_sync_0x17779_retval \<equiv> nbd_wr_sync_0x17779_retval\<^sub>v\<close>
definition \<open>fprintf_chk_0x17830_retval \<equiv> fprintf_chk_0x17830_retval\<^sub>v\<close>
definition \<open>errno_location_0x17835_retval \<equiv> errno_location_0x17835_retval\<^sub>v\<close>
definition \<open>nbd_wr_sync_0x1788c_retval \<equiv> nbd_wr_sync_0x1788c_retval\<^sub>v\<close>
definition \<open>bdrv_write_0x178cc_retval \<equiv> bdrv_write_0x178cc_retval\<^sub>v\<close>
definition \<open>nbd_send_reply_isra_0_0x178ef_retval \<equiv> nbd_send_reply_isra_0_0x178ef_retval\<^sub>v\<close>
definition \<open>fprintf_chk_0x17968_retval \<equiv> fprintf_chk_0x17968_retval\<^sub>v\<close>
definition \<open>fprintf_chk_0x179a0_retval \<equiv> fprintf_chk_0x179a0_retval\<^sub>v\<close>
definition \<open>errno_location_0x179a5_retval \<equiv> errno_location_0x179a5_retval\<^sub>v\<close>
definition \<open>errno_location_0x179b8_retval \<equiv> errno_location_0x179b8_retval\<^sub>v\<close>
definition \<open>bdrv_read_0x179e8_retval \<equiv> bdrv_read_0x179e8_retval\<^sub>v\<close>
definition \<open>nbd_send_reply_isra_0_0x17a0b_retval \<equiv> nbd_send_reply_isra_0_0x17a0b_retval\<^sub>v\<close>
definition \<open>nbd_wr_sync_0x17a2d_retval \<equiv> nbd_wr_sync_0x17a2d_retval\<^sub>v\<close>
definition \<open>fprintf_chk_0x17ab9_retval \<equiv> fprintf_chk_0x17ab9_retval\<^sub>v\<close>
definition \<open>errno_location_0x17abe_retval \<equiv> errno_location_0x17abe_retval\<^sub>v\<close>
definition \<open>stack_chk_fail_0x17b33_retval \<equiv> stack_chk_fail_0x17b33_retval\<^sub>v\<close>
definition \<open>strchr_0x17eb9_retval \<equiv> strchr_0x17eb9_retval\<^sub>v\<close>
definition \<open>strchr_0x17f0d_retval \<equiv> strchr_0x17f0d_retval\<^sub>v\<close>
definition \<open>strchr_0x17f2e_retval \<equiv> strchr_0x17f2e_retval\<^sub>v\<close>
definition \<open>strrchr_0x17f3e_retval \<equiv> strrchr_0x17f3e_retval\<^sub>v\<close>
definition \<open>memcpy_0x17f78_retval \<equiv> memcpy_0x17f78_retval\<^sub>v\<close>

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

locale "pstrcpy" = "qemu_img_xen" +
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

definition P_0x5560_0 :: state_pred where
  \<open>P_0x5560_0 \<sigma> \<equiv> RIP \<sigma> = 0x5560 \<and> RAX \<sigma> = RAX\<^sub>0 \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = RDX\<^sub>0 \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = RSP\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address\<close>
declare P_0x5560_0_def[Ps]

definition P_0x5560_0_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x5560_0_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8)
  }\<close>

definition P_0x5560_0_regions :: state_pred where
  \<open>P_0x5560_0_regions \<sigma> \<equiv> \<exists>regions. P_0x5560_0_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x5563_0 :: state_pred where
  \<open>Q_0x5563_0 \<sigma> \<equiv> RIP \<sigma> = 0x5563 \<and> RAX \<sigma> = RAX\<^sub>0 \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = RDX\<^sub>0 \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = RSP\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address\<close>
declare Q_0x5563_0_def[Qs]

schematic_goal pstrcpy_0_1_0x5560_0x5560_0[blocks]:
  assumes \<open>(P_0x5560_0 && P_0x5560_0_regions) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x5560 0 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x5563_0 ?\<sigma> \<and> block_usage P_0x5560_0_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x5560_0_def P_0x5560_0_regions_def post: Q_0x5563_0_def regionset: P_0x5560_0_regions_set_def)

definition P_0x5563_true_1 :: state_pred where
  \<open>P_0x5563_true_1 \<sigma> \<equiv> RIP \<sigma> = 0x5563 \<and> RAX \<sigma> = RAX\<^sub>0 \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = RDX\<^sub>0 \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = RSP\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address\<close>
declare P_0x5563_true_1_def[Ps]

definition P_0x5563_true_1_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x5563_true_1_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8)
  }\<close>

definition P_0x5563_true_1_regions :: state_pred where
  \<open>P_0x5563_true_1_regions \<sigma> \<equiv> \<exists>regions. P_0x5563_true_1_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x559b_1 :: state_pred where
  \<open>Q_0x559b_1 \<sigma> \<equiv> RIP \<sigma> = 0x559b \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = RSP\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address\<close>
declare Q_0x559b_1_def[Qs]

schematic_goal pstrcpy_0_1_0x5563_0x5563_1[blocks]:
  assumes \<open>(P_0x5563_true_1 && P_0x5563_true_1_regions && ZF) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x5563 (Suc 0) \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x559b_1 ?\<sigma> \<and> block_usage P_0x5563_true_1_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x5563_true_1_def P_0x5563_true_1_regions_def post: Q_0x559b_1_def regionset: P_0x5563_true_1_regions_set_def)

definition P_0x5563_false_2 :: state_pred where
  \<open>P_0x5563_false_2 \<sigma> \<equiv> RIP \<sigma> = 0x5563 \<and> RAX \<sigma> = RAX\<^sub>0 \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = RDX\<^sub>0 \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = RSP\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address\<close>
declare P_0x5563_false_2_def[Ps]

definition P_0x5563_false_2_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x5563_false_2_regions_set \<sigma> \<equiv> {
    (0, RDX\<^sub>0, Suc 0),
    (1, RSP\<^sub>0, 8)
  }\<close>

definition P_0x5563_false_2_regions :: state_pred where
  \<open>P_0x5563_false_2_regions \<sigma> \<equiv> \<exists>regions. P_0x5563_false_2_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x556e_2 :: state_pred where
  \<open>Q_0x556e_2 \<sigma> \<equiv> RIP \<sigma> = 0x556e \<and> RAX \<sigma> = ucast ((\<sigma> \<turnstile> *[RDX\<^sub>0,1]::8 word)) \<and> RCX \<sigma> = ((RDX\<^sub>0::64 word) + 0x1) \<and> RDX \<sigma> = RDX\<^sub>0 \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = RSP\<^sub>0 \<and> (\<sigma> \<turnstile> *[RDX\<^sub>0,1]::8 word) = ucast ((\<sigma> \<turnstile> *[RDX\<^sub>0,1]::8 word)) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address\<close>
declare Q_0x556e_2_def[Qs]

schematic_goal pstrcpy_0_4_0x5563_0x556c_2[blocks]:
  assumes \<open>(P_0x5563_false_2 && P_0x5563_false_2_regions && ! ZF) \<sigma>\<close>
  shows \<open>exec_block 4 0x556c 2 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x556e_2 ?\<sigma> \<and> block_usage P_0x5563_false_2_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x5563_false_2_def P_0x5563_false_2_regions_def post: Q_0x556e_2_def regionset: P_0x5563_false_2_regions_set_def)

definition P_0x556e_true_3 :: state_pred where
  \<open>P_0x556e_true_3 \<sigma> \<equiv> RIP \<sigma> = 0x556e \<and> RAX \<sigma> = ucast ((\<sigma> \<turnstile> *[RDX\<^sub>0,1]::8 word)) \<and> RCX \<sigma> = ((RDX\<^sub>0::64 word) + 0x1) \<and> RDX \<sigma> = RDX\<^sub>0 \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = RSP\<^sub>0 \<and> (\<sigma> \<turnstile> *[RDX\<^sub>0,1]::8 word) = ucast ((\<sigma> \<turnstile> *[RDX\<^sub>0,1]::8 word)) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address\<close>
declare P_0x556e_true_3_def[Ps]

definition P_0x556e_true_3_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x556e_true_3_regions_set \<sigma> \<equiv> {
    (0, RDX\<^sub>0, Suc 0),
    (1, RSP\<^sub>0, 8)
  }\<close>

definition P_0x556e_true_3_regions :: state_pred where
  \<open>P_0x556e_true_3_regions \<sigma> \<equiv> \<exists>regions. P_0x556e_true_3_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x5598_3 :: state_pred where
  \<open>Q_0x5598_3 \<sigma> \<equiv> RIP \<sigma> = 0x5598 \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = RSP\<^sub>0 \<and> (\<sigma> \<turnstile> *[RDX\<^sub>0,1]::8 word) = ucast ((\<sigma> \<turnstile> *[RDX\<^sub>0,1]::8 word)) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address\<close>
declare Q_0x5598_3_def[Qs]

schematic_goal pstrcpy_0_1_0x556e_0x556e_3[blocks]:
  assumes \<open>(P_0x556e_true_3 && P_0x556e_true_3_regions && ZF) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x556e 3 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x5598_3 ?\<sigma> \<and> block_usage P_0x556e_true_3_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x556e_true_3_def P_0x556e_true_3_regions_def post: Q_0x5598_3_def regionset: P_0x556e_true_3_regions_set_def)

definition P_0x556e_false_4 :: state_pred where
  \<open>P_0x556e_false_4 \<sigma> \<equiv> RIP \<sigma> = 0x556e \<and> RAX \<sigma> = ucast ((\<sigma> \<turnstile> *[RDX\<^sub>0,1]::8 word)) \<and> RCX \<sigma> = ((RDX\<^sub>0::64 word) + 0x1) \<and> RDX \<sigma> = RDX\<^sub>0 \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = RSP\<^sub>0 \<and> (\<sigma> \<turnstile> *[RDX\<^sub>0,1]::8 word) = ucast ((\<sigma> \<turnstile> *[RDX\<^sub>0,1]::8 word)) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address\<close>
declare P_0x556e_false_4_def[Ps]

definition P_0x556e_false_4_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x556e_false_4_regions_set \<sigma> \<equiv> {
    (0, RDX\<^sub>0, Suc 0),
    (1, RSP\<^sub>0, 8)
  }\<close>

definition P_0x556e_false_4_regions :: state_pred where
  \<open>P_0x556e_false_4_regions \<sigma> \<equiv> \<exists>regions. P_0x556e_false_4_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x5578_4 :: state_pred where
  \<open>Q_0x5578_4 \<sigma> \<equiv> RIP \<sigma> = 0x5578 \<and> RAX \<sigma> = ucast ((\<sigma> \<turnstile> *[RDX\<^sub>0,1]::8 word)) \<and> RCX \<sigma> = ((RDX\<^sub>0::64 word) + 0x1) \<and> RDX \<sigma> = ((((RDI\<^sub>0::64 word) + (\<langle>63,0\<rangle>((RSI\<^sub>0::64 word) * 0x1)::64 word))::64 word) - 0x1) \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = RSP\<^sub>0 \<and> (\<sigma> \<turnstile> *[RDX\<^sub>0,1]::8 word) = ucast ((\<sigma> \<turnstile> *[RDX\<^sub>0,1]::8 word)) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address\<close>
declare Q_0x5578_4_def[Qs]

schematic_goal pstrcpy_0_3_0x556e_0x5575_4[blocks]:
  assumes \<open>(P_0x556e_false_4 && P_0x556e_false_4_regions && ! ZF) \<sigma>\<close>
  shows \<open>exec_block 3 0x5575 4 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x5578_4 ?\<sigma> \<and> block_usage P_0x556e_false_4_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x556e_false_4_def P_0x556e_false_4_regions_def post: Q_0x5578_4_def regionset: P_0x556e_false_4_regions_set_def)

definition P_0x5578_true_5 :: state_pred where
  \<open>P_0x5578_true_5 \<sigma> \<equiv> RIP \<sigma> = 0x5578 \<and> RAX \<sigma> = ucast ((\<sigma> \<turnstile> *[RDX\<^sub>0,1]::8 word)) \<and> RCX \<sigma> = ((RDX\<^sub>0::64 word) + 0x1) \<and> RDX \<sigma> = ((((RDI\<^sub>0::64 word) + (\<langle>63,0\<rangle>((RSI\<^sub>0::64 word) * 0x1)::64 word))::64 word) - 0x1) \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = RSP\<^sub>0 \<and> (\<sigma> \<turnstile> *[RDX\<^sub>0,1]::8 word) = ucast ((\<sigma> \<turnstile> *[RDX\<^sub>0,1]::8 word)) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address\<close>
declare P_0x5578_true_5_def[Ps]

definition P_0x5578_true_5_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x5578_true_5_regions_set \<sigma> \<equiv> {
    (0, RDX\<^sub>0, Suc 0),
    (1, RSP\<^sub>0, 8)
  }\<close>

definition P_0x5578_true_5_regions :: state_pred where
  \<open>P_0x5578_true_5_regions \<sigma> \<equiv> \<exists>regions. P_0x5578_true_5_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x5585_5 :: state_pred where
  \<open>Q_0x5585_5 \<sigma> \<equiv> RIP \<sigma> = 0x5585 \<and> RDX \<sigma> = ((((RDI\<^sub>0::64 word) + (\<langle>63,0\<rangle>((RSI\<^sub>0::64 word) * 0x1)::64 word))::64 word) - 0x1) \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = RSP\<^sub>0 \<and> (\<sigma> \<turnstile> *[RDX\<^sub>0,1]::8 word) = ucast ((\<sigma> \<turnstile> *[RDX\<^sub>0,1]::8 word)) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address\<close>
declare Q_0x5585_5_def[Qs]

schematic_goal pstrcpy_0_1_0x5578_0x5578_5[blocks]:
  assumes \<open>(P_0x5578_true_5 && P_0x5578_true_5_regions && CF) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x5578 5 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x5585_5 ?\<sigma> \<and> block_usage P_0x5578_true_5_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x5578_true_5_def P_0x5578_true_5_regions_def post: Q_0x5585_5_def regionset: P_0x5578_true_5_regions_set_def)

definition P_0x5585_6 :: state_pred where
  \<open>P_0x5585_6 \<sigma> \<equiv> RIP \<sigma> = 0x5585 \<and> RDX \<sigma> = ((((RDI\<^sub>0::64 word) + (\<langle>63,0\<rangle>((RSI\<^sub>0::64 word) * 0x1)::64 word))::64 word) - 0x1) \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = RSP\<^sub>0 \<and> (\<sigma> \<turnstile> *[RDX\<^sub>0,1]::8 word) = ucast ((\<sigma> \<turnstile> *[RDX\<^sub>0,1]::8 word)) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address\<close>
declare P_0x5585_6_def[Ps]

definition P_0x5585_6_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x5585_6_regions_set \<sigma> \<equiv> {
    (0, RCX \<sigma>, Suc 0),
    (1, RDI \<sigma>, Suc 0),
    (2, RDX\<^sub>0, Suc 0),
    (3, RSP\<^sub>0, 8)
  }\<close>

definition P_0x5585_6_regions :: state_pred where
  \<open>P_0x5585_6_regions \<sigma> \<equiv> \<exists>regions. P_0x5585_6_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x5596_6 :: state_pred where
  \<open>Q_0x5596_6 \<sigma> \<equiv> RIP \<sigma> = 0x5596 \<and> RDX \<sigma> = ((((RDI\<^sub>0::64 word) + (\<langle>63,0\<rangle>((RSI\<^sub>0::64 word) * 0x1)::64 word))::64 word) - 0x1) \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = RSP\<^sub>0 \<and> (\<sigma> \<turnstile> *[RDX\<^sub>0,1]::8 word) = ucast ((\<sigma> \<turnstile> *[RDX\<^sub>0,1]::8 word)) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address\<close>
declare Q_0x5596_6_def[Qs]

schematic_goal pstrcpy_0_5_0x5585_0x5594_6[blocks]:
  assumes \<open>(P_0x5585_6 && P_0x5585_6_regions) \<sigma>\<close>
  shows \<open>exec_block 5 0x5594 6 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x5596_6 ?\<sigma> \<and> block_usage P_0x5585_6_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x5585_6_def P_0x5585_6_regions_def post: Q_0x5596_6_def regionset: P_0x5585_6_regions_set_def)

definition P_0x5596_true_7 :: state_pred where
  \<open>P_0x5596_true_7 \<sigma> \<equiv> RIP \<sigma> = 0x5596 \<and> RDX \<sigma> = ((((RDI\<^sub>0::64 word) + (\<langle>63,0\<rangle>((RSI\<^sub>0::64 word) * 0x1)::64 word))::64 word) - 0x1) \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = RSP\<^sub>0 \<and> (\<sigma> \<turnstile> *[RDX\<^sub>0,1]::8 word) = ucast ((\<sigma> \<turnstile> *[RDX\<^sub>0,1]::8 word)) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address\<close>
declare P_0x5596_true_7_def[Ps]

definition P_0x5596_true_7_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x5596_true_7_regions_set \<sigma> \<equiv> {
    (0, RDX\<^sub>0, Suc 0),
    (1, RSP\<^sub>0, 8)
  }\<close>

definition P_0x5596_true_7_regions :: state_pred where
  \<open>P_0x5596_true_7_regions \<sigma> \<equiv> \<exists>regions. P_0x5596_true_7_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x5583_7 :: state_pred where
  \<open>Q_0x5583_7 \<sigma> \<equiv> RIP \<sigma> = 0x5583 \<and> RDX \<sigma> = ((((RDI\<^sub>0::64 word) + (\<langle>63,0\<rangle>((RSI\<^sub>0::64 word) * 0x1)::64 word))::64 word) - 0x1) \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = RSP\<^sub>0 \<and> (\<sigma> \<turnstile> *[RDX\<^sub>0,1]::8 word) = ucast ((\<sigma> \<turnstile> *[RDX\<^sub>0,1]::8 word)) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address\<close>
declare Q_0x5583_7_def[Qs]

schematic_goal pstrcpy_0_2_0x5596_0x5580_7[blocks]:
  assumes \<open>(P_0x5596_true_7 && P_0x5596_true_7_regions && !ZF) \<sigma>\<close>
  shows \<open>exec_block 2 0x5580 7 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x5583_7 ?\<sigma> \<and> block_usage P_0x5596_true_7_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x5596_true_7_def P_0x5596_true_7_regions_def post: Q_0x5583_7_def regionset: P_0x5596_true_7_regions_set_def)

definition P_0x5583_true_8 :: state_pred where
  \<open>P_0x5583_true_8 \<sigma> \<equiv> RIP \<sigma> = 0x5583 \<and> RDX \<sigma> = ((((RDI\<^sub>0::64 word) + (\<langle>63,0\<rangle>((RSI\<^sub>0::64 word) * 0x1)::64 word))::64 word) - 0x1) \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = RSP\<^sub>0 \<and> (\<sigma> \<turnstile> *[RDX\<^sub>0,1]::8 word) = ucast ((\<sigma> \<turnstile> *[RDX\<^sub>0,1]::8 word)) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address\<close>
declare P_0x5583_true_8_def[Ps]

definition P_0x5583_true_8_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x5583_true_8_regions_set \<sigma> \<equiv> {
    (0, RDX\<^sub>0, Suc 0),
    (1, RSP\<^sub>0, 8)
  }\<close>

definition P_0x5583_true_8_regions :: state_pred where
  \<open>P_0x5583_true_8_regions \<sigma> \<equiv> \<exists>regions. P_0x5583_true_8_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x5598_8 :: state_pred where
  \<open>Q_0x5598_8 \<sigma> \<equiv> RIP \<sigma> = 0x5598 \<and> RDX \<sigma> = ((((RDI\<^sub>0::64 word) + (\<langle>63,0\<rangle>((RSI\<^sub>0::64 word) * 0x1)::64 word))::64 word) - 0x1) \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = RSP\<^sub>0 \<and> (\<sigma> \<turnstile> *[RDX\<^sub>0,1]::8 word) = ucast ((\<sigma> \<turnstile> *[RDX\<^sub>0,1]::8 word)) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address\<close>
declare Q_0x5598_8_def[Qs]

schematic_goal pstrcpy_0_1_0x5583_0x5583_8[blocks]:
  assumes \<open>(P_0x5583_true_8 && P_0x5583_true_8_regions && ZF) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x5583 8 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x5598_8 ?\<sigma> \<and> block_usage P_0x5583_true_8_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x5583_true_8_def P_0x5583_true_8_regions_def post: Q_0x5598_8_def regionset: P_0x5583_true_8_regions_set_def)

definition P_0x5583_false_9 :: state_pred where
  \<open>P_0x5583_false_9 \<sigma> \<equiv> RIP \<sigma> = 0x5583 \<and> RDX \<sigma> = ((((RDI\<^sub>0::64 word) + (\<langle>63,0\<rangle>((RSI\<^sub>0::64 word) * 0x1)::64 word))::64 word) - 0x1) \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = RSP\<^sub>0 \<and> (\<sigma> \<turnstile> *[RDX\<^sub>0,1]::8 word) = ucast ((\<sigma> \<turnstile> *[RDX\<^sub>0,1]::8 word)) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address\<close>
declare P_0x5583_false_9_def[Ps]

definition P_0x5583_false_9_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x5583_false_9_regions_set \<sigma> \<equiv> {
    (0, RDX\<^sub>0, Suc 0),
    (1, RSP\<^sub>0, 8)
  }\<close>

definition P_0x5583_false_9_regions :: state_pred where
  \<open>P_0x5583_false_9_regions \<sigma> \<equiv> \<exists>regions. P_0x5583_false_9_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x5585_9 :: state_pred where
  \<open>Q_0x5585_9 \<sigma> \<equiv> RIP \<sigma> = 0x5585 \<and> RDX \<sigma> = ((((RDI\<^sub>0::64 word) + (\<langle>63,0\<rangle>((RSI\<^sub>0::64 word) * 0x1)::64 word))::64 word) - 0x1) \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = RSP\<^sub>0 \<and> (\<sigma> \<turnstile> *[RDX\<^sub>0,1]::8 word) = ucast ((\<sigma> \<turnstile> *[RDX\<^sub>0,1]::8 word)) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address\<close>
declare Q_0x5585_9_def[Qs]

schematic_goal pstrcpy_0_1_0x5583_0x5583_9[blocks]:
  assumes \<open>(P_0x5583_false_9 && P_0x5583_false_9_regions && ! ZF) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x5583 9 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x5585_9 ?\<sigma> \<and> block_usage P_0x5583_false_9_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x5583_false_9_def P_0x5583_false_9_regions_def post: Q_0x5585_9_def regionset: P_0x5583_false_9_regions_set_def)

definition P_0x5596_false_10 :: state_pred where
  \<open>P_0x5596_false_10 \<sigma> \<equiv> RIP \<sigma> = 0x5596 \<and> RDX \<sigma> = ((((RDI\<^sub>0::64 word) + (\<langle>63,0\<rangle>((RSI\<^sub>0::64 word) * 0x1)::64 word))::64 word) - 0x1) \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = RSP\<^sub>0 \<and> (\<sigma> \<turnstile> *[RDX\<^sub>0,1]::8 word) = ucast ((\<sigma> \<turnstile> *[RDX\<^sub>0,1]::8 word)) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address\<close>
declare P_0x5596_false_10_def[Ps]

definition P_0x5596_false_10_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x5596_false_10_regions_set \<sigma> \<equiv> {
    (0, RDX\<^sub>0, Suc 0),
    (1, RSP\<^sub>0, 8)
  }\<close>

definition P_0x5596_false_10_regions :: state_pred where
  \<open>P_0x5596_false_10_regions \<sigma> \<equiv> \<exists>regions. P_0x5596_false_10_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x5598_10 :: state_pred where
  \<open>Q_0x5598_10 \<sigma> \<equiv> RIP \<sigma> = 0x5598 \<and> RDX \<sigma> = ((((RDI\<^sub>0::64 word) + (\<langle>63,0\<rangle>((RSI\<^sub>0::64 word) * 0x1)::64 word))::64 word) - 0x1) \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = RSP\<^sub>0 \<and> (\<sigma> \<turnstile> *[RDX\<^sub>0,1]::8 word) = ucast ((\<sigma> \<turnstile> *[RDX\<^sub>0,1]::8 word)) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address\<close>
declare Q_0x5598_10_def[Qs]

schematic_goal pstrcpy_0_1_0x5596_0x5596_10[blocks]:
  assumes \<open>(P_0x5596_false_10 && P_0x5596_false_10_regions && ! !ZF) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x5596 10 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x5598_10 ?\<sigma> \<and> block_usage P_0x5596_false_10_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x5596_false_10_def P_0x5596_false_10_regions_def post: Q_0x5598_10_def regionset: P_0x5596_false_10_regions_set_def)

definition P_0x5578_false_11 :: state_pred where
  \<open>P_0x5578_false_11 \<sigma> \<equiv> RIP \<sigma> = 0x5578 \<and> RAX \<sigma> = ucast ((\<sigma> \<turnstile> *[RDX\<^sub>0,1]::8 word)) \<and> RCX \<sigma> = ((RDX\<^sub>0::64 word) + 0x1) \<and> RDX \<sigma> = ((((RDI\<^sub>0::64 word) + (\<langle>63,0\<rangle>((RSI\<^sub>0::64 word) * 0x1)::64 word))::64 word) - 0x1) \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = RSP\<^sub>0 \<and> (\<sigma> \<turnstile> *[RDX\<^sub>0,1]::8 word) = ucast ((\<sigma> \<turnstile> *[RDX\<^sub>0,1]::8 word)) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address\<close>
declare P_0x5578_false_11_def[Ps]

definition P_0x5578_false_11_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x5578_false_11_regions_set \<sigma> \<equiv> {
    (0, RDX\<^sub>0, Suc 0),
    (1, RSP\<^sub>0, 8)
  }\<close>

definition P_0x5578_false_11_regions :: state_pred where
  \<open>P_0x5578_false_11_regions \<sigma> \<equiv> \<exists>regions. P_0x5578_false_11_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x5598_11 :: state_pred where
  \<open>Q_0x5598_11 \<sigma> \<equiv> RIP \<sigma> = 0x5598 \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = RSP\<^sub>0 \<and> (\<sigma> \<turnstile> *[RDX\<^sub>0,1]::8 word) = ucast ((\<sigma> \<turnstile> *[RDX\<^sub>0,1]::8 word)) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address\<close>
declare Q_0x5598_11_def[Qs]

schematic_goal pstrcpy_0_2_0x5578_0x557a_11[blocks]:
  assumes \<open>(P_0x5578_false_11 && P_0x5578_false_11_regions && ! CF) \<sigma>\<close>
  shows \<open>exec_block 2 0x557a 11 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x5598_11 ?\<sigma> \<and> block_usage P_0x5578_false_11_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x5578_false_11_def P_0x5578_false_11_regions_def post: Q_0x5598_11_def regionset: P_0x5578_false_11_regions_set_def)

definition P_0x5598_12 :: state_pred where
  \<open>P_0x5598_12 \<sigma> \<equiv> RIP \<sigma> = 0x5598 \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = RSP\<^sub>0 \<and> (\<sigma> \<turnstile> *[RDX\<^sub>0,1]::8 word) = ucast ((\<sigma> \<turnstile> *[RDX\<^sub>0,1]::8 word)) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address\<close>
declare P_0x5598_12_def[Ps]

definition P_0x5598_12_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x5598_12_regions_set \<sigma> \<equiv> {
    (0, RDI \<sigma>, Suc 0),
    (1, RDX\<^sub>0, Suc 0),
    (2, RSP\<^sub>0, 8)
  }\<close>

definition P_0x5598_12_regions :: state_pred where
  \<open>P_0x5598_12_regions \<sigma> \<equiv> \<exists>regions. P_0x5598_12_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x559b_12 :: state_pred where
  \<open>Q_0x559b_12 \<sigma> \<equiv> RIP \<sigma> = 0x559b \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = RSP\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address\<close>
declare Q_0x559b_12_def[Qs]

schematic_goal pstrcpy_0_1_0x5598_0x5598_12[blocks]:
  assumes \<open>(P_0x5598_12 && P_0x5598_12_regions) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x5598 12 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x559b_12 ?\<sigma> \<and> block_usage P_0x5598_12_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x5598_12_def P_0x5598_12_regions_def post: Q_0x559b_12_def regionset: P_0x5598_12_regions_set_def)

definition P_0x559b_13 :: state_pred where
  \<open>P_0x559b_13 \<sigma> \<equiv> RIP \<sigma> = 0x559b \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = RSP\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address\<close>
declare P_0x559b_13_def[Ps]

definition P_0x559b_13_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x559b_13_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8)
  }\<close>

definition P_0x559b_13_regions :: state_pred where
  \<open>P_0x559b_13_regions \<sigma> \<equiv> \<exists>regions. P_0x559b_13_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_ret_address_13 :: state_pred where
  \<open>Q_ret_address_13 \<sigma> \<equiv> RIP \<sigma> = ret_address \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) + 0x8) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address\<close>
declare Q_ret_address_13_def[Qs]

schematic_goal pstrcpy_0_1_0x559b_0x559b_13[blocks]:
  assumes \<open>(P_0x559b_13 && P_0x559b_13_regions) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x559b 13 \<sigma> \<triangleq> ?\<sigma> \<and> Q_ret_address_13 ?\<sigma> \<and> block_usage P_0x559b_13_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x559b_13_def P_0x559b_13_regions_def post: Q_ret_address_13_def regionset: P_0x559b_13_regions_set_def)

definition pstrcpy_acode :: ACode where
  \<open>pstrcpy_acode =
    Block (Suc 0) 0x5560 0;
    IF ZF THEN
      Block (Suc 0) 0x5563 (Suc 0)
    ELSE
      Block 4 0x556c 2;
      IF ZF THEN
        Block (Suc 0) 0x556e 3
      ELSE
        Block 3 0x5575 4;
        IF CF THEN
          Block (Suc 0) 0x5578 5;
          WHILE P_0x5585_6 DO
            Block 5 0x5594 6;
            IF !ZF THEN
              Block 2 0x5580 7;
              IF ZF THEN
                Block (Suc 0) 0x5583 8
              ELSE
                Block (Suc 0) 0x5583 9
              FI
            ELSE
              Block (Suc 0) 0x5596 10
            FI
          OD
        ELSE
          Block 2 0x557a 11
        FI
      FI;
      Block (Suc 0) 0x5598 12
    FI;
    Block (Suc 0) 0x559b 13
  \<close>

schematic_goal "pstrcpy":
  assumes
    \<open>\<forall>\<sigma>. RIP \<sigma> = 0x5563 \<longrightarrow> P_0x5563_true_1_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x5563 \<longrightarrow> P_0x5563_false_2_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x556e \<longrightarrow> P_0x556e_true_3_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x556e \<longrightarrow> P_0x556e_false_4_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x5578 \<longrightarrow> P_0x5578_true_5_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x5585 \<longrightarrow> P_0x5585_6_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x5596 \<longrightarrow> P_0x5596_true_7_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x5583 \<longrightarrow> P_0x5583_true_8_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x5583 \<longrightarrow> P_0x5583_false_9_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x5596 \<longrightarrow> P_0x5596_false_10_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x5578 \<longrightarrow> P_0x5578_false_11_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x5598 \<longrightarrow> P_0x5598_12_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x559b \<longrightarrow> P_0x559b_13_regions \<sigma>\<close>
  shows \<open>{{?P}} pstrcpy_acode {{?Q;?M}}\<close>
  apply (vcg acode: pstrcpy_acode_def assms: assms)
                 apply (vcg_while \<open>P_0x5585_6 || P_0x5598_12\<close> assms: assms)
                  apply (vcg_step assms: assms)+
                 apply (simp add: pred_logic Ps Qs assms)
                apply (simp add: pred_logic Ps Qs assms)
               apply (vcg_step assms: assms)+
             apply (simp add: assms)+
    apply (vcg_step assms: assms)+
  done

end

locale "pstrcat" = "qemu_img_xen" +
  fixes RAX\<^sub>0\<^sub>v RBX\<^sub>0\<^sub>v RCX\<^sub>0\<^sub>v RDX\<^sub>0\<^sub>v RDI\<^sub>0\<^sub>v RSI\<^sub>0\<^sub>v RSP\<^sub>0\<^sub>v RBP\<^sub>0\<^sub>v R12\<^sub>0\<^sub>v ret_address\<^sub>v :: \<open>64 word\<close>
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
definition \<open>ret_address \<equiv> ret_address\<^sub>v\<close>

definition P_0x55a0_0 :: state_pred where
  \<open>P_0x55a0_0 \<sigma> \<equiv> RIP \<sigma> = 0x55a0 \<and> RAX \<sigma> = RAX\<^sub>0 \<and> RBX \<sigma> = RBX\<^sub>0 \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = RDX\<^sub>0 \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = RSP\<^sub>0 \<and> RBP \<sigma> = RBP\<^sub>0 \<and> R12 \<sigma> = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address\<close>
declare P_0x55a0_0_def[Ps]

definition P_0x55a0_0_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x55a0_0_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (2, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x18), 8)
  }\<close>

definition P_0x55a0_0_regions :: state_pred where
  \<open>P_0x55a0_0_regions \<sigma> \<equiv> \<exists>regions. P_0x55a0_0_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x55ad_0 :: state_pred where
  \<open>Q_0x55ad_0 \<sigma> \<equiv> RIP \<sigma> = 0x55ad \<and> RAX \<sigma> = RAX\<^sub>0 \<and> RBX \<sigma> = RSI\<^sub>0 \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = RDX\<^sub>0 \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x18) \<and> RBP \<sigma> = RDI\<^sub>0 \<and> R12 \<sigma> = RDX\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBX\<^sub>0\<close>
declare Q_0x55ad_0_def[Qs]

schematic_goal pstrcat_0_6_0x55a0_0x55aa_0[blocks]:
  assumes \<open>(P_0x55a0_0 && P_0x55a0_0_regions) \<sigma>\<close>
  shows \<open>exec_block 6 0x55aa 0 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x55ad_0 ?\<sigma> \<and> block_usage P_0x55a0_0_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x55a0_0_def P_0x55a0_0_regions_def post: Q_0x55ad_0_def regionset: P_0x55a0_0_regions_set_def)

definition P_0x55ad_1 :: state_pred where
  \<open>P_0x55ad_1 \<sigma> \<equiv> RIP \<sigma> = 0x55ad \<and> RAX \<sigma> = RAX\<^sub>0 \<and> RBX \<sigma> = RSI\<^sub>0 \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = RDX\<^sub>0 \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x18) \<and> RBP \<sigma> = RDI\<^sub>0 \<and> R12 \<sigma> = RDX\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBX\<^sub>0\<close>
declare P_0x55ad_1_def[Ps]

definition P_0x55ad_1_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x55ad_1_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (2, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x20), 8)
  }\<close>

definition P_0x55ad_1_regions :: state_pred where
  \<open>P_0x55ad_1_regions \<sigma> \<equiv> \<exists>regions. P_0x55ad_1_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_strlen_addr_0x55ad_1 :: state_pred where
  \<open>Q_strlen_addr_0x55ad_1 \<sigma> \<equiv> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x20) \<and> RIP \<sigma> = strlen_addr \<and> RAX \<sigma> = RAX\<^sub>0 \<and> RBX \<sigma> = RSI\<^sub>0 \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = RDX\<^sub>0 \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RBP \<sigma> = RDI\<^sub>0 \<and> R12 \<sigma> = RDX\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = 0x55b2\<close>
declare Q_strlen_addr_0x55ad_1_def[Qs]

schematic_goal pstrcat_0_1_0x55ad_0x55ad_1[blocks]:
  assumes \<open>(P_0x55ad_1 && P_0x55ad_1_regions) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x55ad (Suc 0) \<sigma> \<triangleq> ?\<sigma> \<and> Q_strlen_addr_0x55ad_1 ?\<sigma> \<and> block_usage P_0x55ad_1_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x55ad_1_def P_0x55ad_1_regions_def post: Q_strlen_addr_0x55ad_1_def regionset: P_0x55ad_1_regions_set_def)

definition P_0x55b2_2 :: state_pred where
  \<open>P_0x55b2_2 \<sigma> \<equiv> RIP \<sigma> = 0x55b2 \<and> RAX \<sigma> = strlen_0x55ad_retval \<and> RBX \<sigma> = RSI\<^sub>0 \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = RDX\<^sub>0 \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x18) \<and> RBP \<sigma> = RDI\<^sub>0 \<and> R12 \<sigma> = RDX\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = 0x55b2\<close>
declare P_0x55b2_2_def[Ps]

definition P_0x55b2_2_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x55b2_2_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (2, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x20), 8)
  }\<close>

definition P_0x55b2_2_regions :: state_pred where
  \<open>P_0x55b2_2_regions \<sigma> \<equiv> \<exists>regions. P_0x55b2_2_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x55b7_2 :: state_pred where
  \<open>Q_0x55b7_2 \<sigma> \<equiv> RIP \<sigma> = 0x55b7 \<and> RAX \<sigma> = (sextend (ucast ((\<langle>31,0\<rangle>strlen_0x55ad_retval::32 word))) 32 64::64 word) \<and> RBX \<sigma> = RSI\<^sub>0 \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = RDX\<^sub>0 \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x18) \<and> RBP \<sigma> = RDI\<^sub>0 \<and> R12 \<sigma> = RDX\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = 0x55b2\<close>
declare Q_0x55b7_2_def[Qs]

schematic_goal pstrcat_0_2_0x55b2_0x55b4_2[blocks]:
  assumes \<open>(P_0x55b2_2 && P_0x55b2_2_regions) \<sigma>\<close>
  shows \<open>exec_block 2 0x55b4 2 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x55b7_2 ?\<sigma> \<and> block_usage P_0x55b2_2_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x55b2_2_def P_0x55b2_2_regions_def post: Q_0x55b7_2_def regionset: P_0x55b2_2_regions_set_def)

definition P_0x55b7_true_3 :: state_pred where
  \<open>P_0x55b7_true_3 \<sigma> \<equiv> RIP \<sigma> = 0x55b7 \<and> RAX \<sigma> = (sextend (ucast ((\<langle>31,0\<rangle>strlen_0x55ad_retval::32 word))) 32 64::64 word) \<and> RBX \<sigma> = RSI\<^sub>0 \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = RDX\<^sub>0 \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x18) \<and> RBP \<sigma> = RDI\<^sub>0 \<and> R12 \<sigma> = RDX\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = 0x55b2\<close>
declare P_0x55b7_true_3_def[Ps]

definition P_0x55b7_true_3_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x55b7_true_3_regions_set \<sigma> \<equiv> {
    (0, RDX\<^sub>0, Suc 0),
    (1, RSP\<^sub>0, 8),
    (2, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x20), 8)
  }\<close>

definition P_0x55b7_true_3_regions :: state_pred where
  \<open>P_0x55b7_true_3_regions \<sigma> \<equiv> \<exists>regions. P_0x55b7_true_3_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x55db_3 :: state_pred where
  \<open>Q_0x55db_3 \<sigma> \<equiv> RIP \<sigma> = 0x55db \<and> RAX \<sigma> = (((sextend (ucast ((\<langle>31,0\<rangle>strlen_0x55ad_retval::32 word))) 32 64::64 word)::64 word) + RDI\<^sub>0) \<and> RBX \<sigma> = ((RSI\<^sub>0::64 word) - 0x1) \<and> RCX \<sigma> = ((RDX\<^sub>0::64 word) + 0x1) \<and> RDX \<sigma> = ucast ((\<sigma> \<turnstile> *[RDX\<^sub>0,1]::8 word)) \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x18) \<and> RBP \<sigma> = RDI\<^sub>0 \<and> R12 \<sigma> = RDX\<^sub>0 \<and> (\<sigma> \<turnstile> *[RDX\<^sub>0,1]::8 word) = ucast ((\<sigma> \<turnstile> *[RDX\<^sub>0,1]::8 word)) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = 0x55b2\<close>
declare Q_0x55db_3_def[Qs]

schematic_goal pstrcat_0_6_0x55b7_0x55d9_3[blocks]:
  assumes \<open>(P_0x55b7_true_3 && P_0x55b7_true_3_regions && CF) \<sigma>\<close>
  shows \<open>exec_block 6 0x55d9 3 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x55db_3 ?\<sigma> \<and> block_usage P_0x55b7_true_3_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x55b7_true_3_def P_0x55b7_true_3_regions_def post: Q_0x55db_3_def regionset: P_0x55b7_true_3_regions_set_def)

definition P_0x55db_true_4 :: state_pred where
  \<open>P_0x55db_true_4 \<sigma> \<equiv> RIP \<sigma> = 0x55db \<and> RAX \<sigma> = (((sextend (ucast ((\<langle>31,0\<rangle>strlen_0x55ad_retval::32 word))) 32 64::64 word)::64 word) + RDI\<^sub>0) \<and> RBX \<sigma> = ((RSI\<^sub>0::64 word) - 0x1) \<and> RCX \<sigma> = ((RDX\<^sub>0::64 word) + 0x1) \<and> RDX \<sigma> = ucast ((\<sigma> \<turnstile> *[RDX\<^sub>0,1]::8 word)) \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x18) \<and> RBP \<sigma> = RDI\<^sub>0 \<and> R12 \<sigma> = RDX\<^sub>0 \<and> (\<sigma> \<turnstile> *[RDX\<^sub>0,1]::8 word) = ucast ((\<sigma> \<turnstile> *[RDX\<^sub>0,1]::8 word)) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = 0x55b2\<close>
declare P_0x55db_true_4_def[Ps]

definition P_0x55db_true_4_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x55db_true_4_regions_set \<sigma> \<equiv> {
    (0, RDX\<^sub>0, Suc 0),
    (1, RSP\<^sub>0, 8),
    (2, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x20), 8)
  }\<close>

definition P_0x55db_true_4_regions :: state_pred where
  \<open>P_0x55db_true_4_regions \<sigma> \<equiv> \<exists>regions. P_0x55db_true_4_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x5608_4 :: state_pred where
  \<open>Q_0x5608_4 \<sigma> \<equiv> RIP \<sigma> = 0x5608 \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x18) \<and> RBP \<sigma> = RDI\<^sub>0 \<and> R12 \<sigma> = RDX\<^sub>0 \<and> (\<sigma> \<turnstile> *[RDX\<^sub>0,1]::8 word) = ucast ((\<sigma> \<turnstile> *[RDX\<^sub>0,1]::8 word)) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = 0x55b2\<close>
declare Q_0x5608_4_def[Qs]

schematic_goal pstrcat_0_1_0x55db_0x55db_4[blocks]:
  assumes \<open>(P_0x55db_true_4 && P_0x55db_true_4_regions && ZF) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x55db 4 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x5608_4 ?\<sigma> \<and> block_usage P_0x55db_true_4_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x55db_true_4_def P_0x55db_true_4_regions_def post: Q_0x5608_4_def regionset: P_0x55db_true_4_regions_set_def)

definition P_0x55db_false_5 :: state_pred where
  \<open>P_0x55db_false_5 \<sigma> \<equiv> RIP \<sigma> = 0x55db \<and> RAX \<sigma> = (((sextend (ucast ((\<langle>31,0\<rangle>strlen_0x55ad_retval::32 word))) 32 64::64 word)::64 word) + RDI\<^sub>0) \<and> RBX \<sigma> = ((RSI\<^sub>0::64 word) - 0x1) \<and> RCX \<sigma> = ((RDX\<^sub>0::64 word) + 0x1) \<and> RDX \<sigma> = ucast ((\<sigma> \<turnstile> *[RDX\<^sub>0,1]::8 word)) \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x18) \<and> RBP \<sigma> = RDI\<^sub>0 \<and> R12 \<sigma> = RDX\<^sub>0 \<and> (\<sigma> \<turnstile> *[RDX\<^sub>0,1]::8 word) = ucast ((\<sigma> \<turnstile> *[RDX\<^sub>0,1]::8 word)) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = 0x55b2\<close>
declare P_0x55db_false_5_def[Ps]

definition P_0x55db_false_5_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x55db_false_5_regions_set \<sigma> \<equiv> {
    (0, RDX\<^sub>0, Suc 0),
    (1, RSP\<^sub>0, 8),
    (2, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x20), 8)
  }\<close>

definition P_0x55db_false_5_regions :: state_pred where
  \<open>P_0x55db_false_5_regions \<sigma> \<equiv> \<exists>regions. P_0x55db_false_5_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x55e3_5 :: state_pred where
  \<open>Q_0x55e3_5 \<sigma> \<equiv> RIP \<sigma> = 0x55e3 \<and> RAX \<sigma> = (((sextend (ucast ((\<langle>31,0\<rangle>strlen_0x55ad_retval::32 word))) 32 64::64 word)::64 word) + RDI\<^sub>0) \<and> RBX \<sigma> = ((((RSI\<^sub>0::64 word) + RDI\<^sub>0)::64 word) - 0x1) \<and> RCX \<sigma> = ((RDX\<^sub>0::64 word) + 0x1) \<and> RDX \<sigma> = ucast ((\<sigma> \<turnstile> *[RDX\<^sub>0,1]::8 word)) \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x18) \<and> RBP \<sigma> = RDI\<^sub>0 \<and> R12 \<sigma> = RDX\<^sub>0 \<and> (\<sigma> \<turnstile> *[RDX\<^sub>0,1]::8 word) = ucast ((\<sigma> \<turnstile> *[RDX\<^sub>0,1]::8 word)) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = 0x55b2\<close>
declare Q_0x55e3_5_def[Qs]

schematic_goal pstrcat_0_3_0x55db_0x55e0_5[blocks]:
  assumes \<open>(P_0x55db_false_5 && P_0x55db_false_5_regions && ! ZF) \<sigma>\<close>
  shows \<open>exec_block 3 0x55e0 5 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x55e3_5 ?\<sigma> \<and> block_usage P_0x55db_false_5_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x55db_false_5_def P_0x55db_false_5_regions_def post: Q_0x55e3_5_def regionset: P_0x55db_false_5_regions_set_def)

definition P_0x55e3_true_6 :: state_pred where
  \<open>P_0x55e3_true_6 \<sigma> \<equiv> RIP \<sigma> = 0x55e3 \<and> RAX \<sigma> = (((sextend (ucast ((\<langle>31,0\<rangle>strlen_0x55ad_retval::32 word))) 32 64::64 word)::64 word) + RDI\<^sub>0) \<and> RBX \<sigma> = ((((RSI\<^sub>0::64 word) + RDI\<^sub>0)::64 word) - 0x1) \<and> RCX \<sigma> = ((RDX\<^sub>0::64 word) + 0x1) \<and> RDX \<sigma> = ucast ((\<sigma> \<turnstile> *[RDX\<^sub>0,1]::8 word)) \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x18) \<and> RBP \<sigma> = RDI\<^sub>0 \<and> R12 \<sigma> = RDX\<^sub>0 \<and> (\<sigma> \<turnstile> *[RDX\<^sub>0,1]::8 word) = ucast ((\<sigma> \<turnstile> *[RDX\<^sub>0,1]::8 word)) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = 0x55b2\<close>
declare P_0x55e3_true_6_def[Ps]

definition P_0x55e3_true_6_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x55e3_true_6_regions_set \<sigma> \<equiv> {
    (0, RDX\<^sub>0, Suc 0),
    (1, RSP\<^sub>0, 8),
    (2, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x20), 8)
  }\<close>

definition P_0x55e3_true_6_regions :: state_pred where
  \<open>P_0x55e3_true_6_regions \<sigma> \<equiv> \<exists>regions. P_0x55e3_true_6_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x55f5_6 :: state_pred where
  \<open>Q_0x55f5_6 \<sigma> \<equiv> RIP \<sigma> = 0x55f5 \<and> RBX \<sigma> = ((((RSI\<^sub>0::64 word) + RDI\<^sub>0)::64 word) - 0x1) \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x18) \<and> RBP \<sigma> = RDI\<^sub>0 \<and> R12 \<sigma> = RDX\<^sub>0 \<and> (\<sigma> \<turnstile> *[RDX\<^sub>0,1]::8 word) = ucast ((\<sigma> \<turnstile> *[RDX\<^sub>0,1]::8 word)) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = 0x55b2\<close>
declare Q_0x55f5_6_def[Qs]

schematic_goal pstrcat_0_1_0x55e3_0x55e3_6[blocks]:
  assumes \<open>(P_0x55e3_true_6 && P_0x55e3_true_6_regions && CF) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x55e3 6 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x55f5_6 ?\<sigma> \<and> block_usage P_0x55e3_true_6_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x55e3_true_6_def P_0x55e3_true_6_regions_def post: Q_0x55f5_6_def regionset: P_0x55e3_true_6_regions_set_def)

definition P_0x55f5_7 :: state_pred where
  \<open>P_0x55f5_7 \<sigma> \<equiv> RIP \<sigma> = 0x55f5 \<and> RBX \<sigma> = ((((RSI\<^sub>0::64 word) + RDI\<^sub>0)::64 word) - 0x1) \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x18) \<and> RBP \<sigma> = RDI\<^sub>0 \<and> R12 \<sigma> = RDX\<^sub>0 \<and> (\<sigma> \<turnstile> *[RDX\<^sub>0,1]::8 word) = ucast ((\<sigma> \<turnstile> *[RDX\<^sub>0,1]::8 word)) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = 0x55b2\<close>
declare P_0x55f5_7_def[Ps]

definition P_0x55f5_7_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x55f5_7_regions_set \<sigma> \<equiv> {
    (0, RAX \<sigma>, Suc 0),
    (1, RCX \<sigma>, Suc 0),
    (2, RDX\<^sub>0, Suc 0),
    (3, RSP\<^sub>0, 8),
    (4, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x20), 8)
  }\<close>

definition P_0x55f5_7_regions :: state_pred where
  \<open>P_0x55f5_7_regions \<sigma> \<equiv> \<exists>regions. P_0x55f5_7_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x5606_7 :: state_pred where
  \<open>Q_0x5606_7 \<sigma> \<equiv> RIP \<sigma> = 0x5606 \<and> RBX \<sigma> = ((((RSI\<^sub>0::64 word) + RDI\<^sub>0)::64 word) - 0x1) \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x18) \<and> RBP \<sigma> = RDI\<^sub>0 \<and> R12 \<sigma> = RDX\<^sub>0 \<and> (\<sigma> \<turnstile> *[RDX\<^sub>0,1]::8 word) = ucast ((\<sigma> \<turnstile> *[RDX\<^sub>0,1]::8 word)) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = 0x55b2\<close>
declare Q_0x5606_7_def[Qs]

schematic_goal pstrcat_0_5_0x55f5_0x5604_7[blocks]:
  assumes \<open>(P_0x55f5_7 && P_0x55f5_7_regions) \<sigma>\<close>
  shows \<open>exec_block 5 0x5604 7 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x5606_7 ?\<sigma> \<and> block_usage P_0x55f5_7_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x55f5_7_def P_0x55f5_7_regions_def post: Q_0x5606_7_def regionset: P_0x55f5_7_regions_set_def)

definition P_0x5606_true_8 :: state_pred where
  \<open>P_0x5606_true_8 \<sigma> \<equiv> RIP \<sigma> = 0x5606 \<and> RBX \<sigma> = ((((RSI\<^sub>0::64 word) + RDI\<^sub>0)::64 word) - 0x1) \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x18) \<and> RBP \<sigma> = RDI\<^sub>0 \<and> R12 \<sigma> = RDX\<^sub>0 \<and> (\<sigma> \<turnstile> *[RDX\<^sub>0,1]::8 word) = ucast ((\<sigma> \<turnstile> *[RDX\<^sub>0,1]::8 word)) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = 0x55b2\<close>
declare P_0x5606_true_8_def[Ps]

definition P_0x5606_true_8_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x5606_true_8_regions_set \<sigma> \<equiv> {
    (0, RDX\<^sub>0, Suc 0),
    (1, RSP\<^sub>0, 8),
    (2, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x20), 8)
  }\<close>

definition P_0x5606_true_8_regions :: state_pred where
  \<open>P_0x5606_true_8_regions \<sigma> \<equiv> \<exists>regions. P_0x5606_true_8_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x55f3_8 :: state_pred where
  \<open>Q_0x55f3_8 \<sigma> \<equiv> RIP \<sigma> = 0x55f3 \<and> RBX \<sigma> = ((((RSI\<^sub>0::64 word) + RDI\<^sub>0)::64 word) - 0x1) \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x18) \<and> RBP \<sigma> = RDI\<^sub>0 \<and> R12 \<sigma> = RDX\<^sub>0 \<and> (\<sigma> \<turnstile> *[RDX\<^sub>0,1]::8 word) = ucast ((\<sigma> \<turnstile> *[RDX\<^sub>0,1]::8 word)) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = 0x55b2\<close>
declare Q_0x55f3_8_def[Qs]

schematic_goal pstrcat_0_2_0x5606_0x55f0_8[blocks]:
  assumes \<open>(P_0x5606_true_8 && P_0x5606_true_8_regions && !ZF) \<sigma>\<close>
  shows \<open>exec_block 2 0x55f0 8 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x55f3_8 ?\<sigma> \<and> block_usage P_0x5606_true_8_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x5606_true_8_def P_0x5606_true_8_regions_def post: Q_0x55f3_8_def regionset: P_0x5606_true_8_regions_set_def)

definition P_0x55f3_true_9 :: state_pred where
  \<open>P_0x55f3_true_9 \<sigma> \<equiv> RIP \<sigma> = 0x55f3 \<and> RBX \<sigma> = ((((RSI\<^sub>0::64 word) + RDI\<^sub>0)::64 word) - 0x1) \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x18) \<and> RBP \<sigma> = RDI\<^sub>0 \<and> R12 \<sigma> = RDX\<^sub>0 \<and> (\<sigma> \<turnstile> *[RDX\<^sub>0,1]::8 word) = ucast ((\<sigma> \<turnstile> *[RDX\<^sub>0,1]::8 word)) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = 0x55b2\<close>
declare P_0x55f3_true_9_def[Ps]

definition P_0x55f3_true_9_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x55f3_true_9_regions_set \<sigma> \<equiv> {
    (0, RDX\<^sub>0, Suc 0),
    (1, RSP\<^sub>0, 8),
    (2, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x20), 8)
  }\<close>

definition P_0x55f3_true_9_regions :: state_pred where
  \<open>P_0x55f3_true_9_regions \<sigma> \<equiv> \<exists>regions. P_0x55f3_true_9_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x5608_9 :: state_pred where
  \<open>Q_0x5608_9 \<sigma> \<equiv> RIP \<sigma> = 0x5608 \<and> RBX \<sigma> = ((((RSI\<^sub>0::64 word) + RDI\<^sub>0)::64 word) - 0x1) \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x18) \<and> RBP \<sigma> = RDI\<^sub>0 \<and> R12 \<sigma> = RDX\<^sub>0 \<and> (\<sigma> \<turnstile> *[RDX\<^sub>0,1]::8 word) = ucast ((\<sigma> \<turnstile> *[RDX\<^sub>0,1]::8 word)) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = 0x55b2\<close>
declare Q_0x5608_9_def[Qs]

schematic_goal pstrcat_0_1_0x55f3_0x55f3_9[blocks]:
  assumes \<open>(P_0x55f3_true_9 && P_0x55f3_true_9_regions && ZF) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x55f3 9 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x5608_9 ?\<sigma> \<and> block_usage P_0x55f3_true_9_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x55f3_true_9_def P_0x55f3_true_9_regions_def post: Q_0x5608_9_def regionset: P_0x55f3_true_9_regions_set_def)

definition P_0x55f3_false_10 :: state_pred where
  \<open>P_0x55f3_false_10 \<sigma> \<equiv> RIP \<sigma> = 0x55f3 \<and> RBX \<sigma> = ((((RSI\<^sub>0::64 word) + RDI\<^sub>0)::64 word) - 0x1) \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x18) \<and> RBP \<sigma> = RDI\<^sub>0 \<and> R12 \<sigma> = RDX\<^sub>0 \<and> (\<sigma> \<turnstile> *[RDX\<^sub>0,1]::8 word) = ucast ((\<sigma> \<turnstile> *[RDX\<^sub>0,1]::8 word)) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = 0x55b2\<close>
declare P_0x55f3_false_10_def[Ps]

definition P_0x55f3_false_10_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x55f3_false_10_regions_set \<sigma> \<equiv> {
    (0, RDX\<^sub>0, Suc 0),
    (1, RSP\<^sub>0, 8),
    (2, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x20), 8)
  }\<close>

definition P_0x55f3_false_10_regions :: state_pred where
  \<open>P_0x55f3_false_10_regions \<sigma> \<equiv> \<exists>regions. P_0x55f3_false_10_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x55f5_10 :: state_pred where
  \<open>Q_0x55f5_10 \<sigma> \<equiv> RIP \<sigma> = 0x55f5 \<and> RBX \<sigma> = ((((RSI\<^sub>0::64 word) + RDI\<^sub>0)::64 word) - 0x1) \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x18) \<and> RBP \<sigma> = RDI\<^sub>0 \<and> R12 \<sigma> = RDX\<^sub>0 \<and> (\<sigma> \<turnstile> *[RDX\<^sub>0,1]::8 word) = ucast ((\<sigma> \<turnstile> *[RDX\<^sub>0,1]::8 word)) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = 0x55b2\<close>
declare Q_0x55f5_10_def[Qs]

schematic_goal pstrcat_0_1_0x55f3_0x55f3_10[blocks]:
  assumes \<open>(P_0x55f3_false_10 && P_0x55f3_false_10_regions && ! ZF) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x55f3 10 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x55f5_10 ?\<sigma> \<and> block_usage P_0x55f3_false_10_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x55f3_false_10_def P_0x55f3_false_10_regions_def post: Q_0x55f5_10_def regionset: P_0x55f3_false_10_regions_set_def)

definition P_0x5606_false_11 :: state_pred where
  \<open>P_0x5606_false_11 \<sigma> \<equiv> RIP \<sigma> = 0x5606 \<and> RBX \<sigma> = ((((RSI\<^sub>0::64 word) + RDI\<^sub>0)::64 word) - 0x1) \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x18) \<and> RBP \<sigma> = RDI\<^sub>0 \<and> R12 \<sigma> = RDX\<^sub>0 \<and> (\<sigma> \<turnstile> *[RDX\<^sub>0,1]::8 word) = ucast ((\<sigma> \<turnstile> *[RDX\<^sub>0,1]::8 word)) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = 0x55b2\<close>
declare P_0x5606_false_11_def[Ps]

definition P_0x5606_false_11_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x5606_false_11_regions_set \<sigma> \<equiv> {
    (0, RDX\<^sub>0, Suc 0),
    (1, RSP\<^sub>0, 8),
    (2, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x20), 8)
  }\<close>

definition P_0x5606_false_11_regions :: state_pred where
  \<open>P_0x5606_false_11_regions \<sigma> \<equiv> \<exists>regions. P_0x5606_false_11_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x5608_11 :: state_pred where
  \<open>Q_0x5608_11 \<sigma> \<equiv> RIP \<sigma> = 0x5608 \<and> RBX \<sigma> = ((((RSI\<^sub>0::64 word) + RDI\<^sub>0)::64 word) - 0x1) \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x18) \<and> RBP \<sigma> = RDI\<^sub>0 \<and> R12 \<sigma> = RDX\<^sub>0 \<and> (\<sigma> \<turnstile> *[RDX\<^sub>0,1]::8 word) = ucast ((\<sigma> \<turnstile> *[RDX\<^sub>0,1]::8 word)) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = 0x55b2\<close>
declare Q_0x5608_11_def[Qs]

schematic_goal pstrcat_0_1_0x5606_0x5606_11[blocks]:
  assumes \<open>(P_0x5606_false_11 && P_0x5606_false_11_regions && ! !ZF) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x5606 11 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x5608_11 ?\<sigma> \<and> block_usage P_0x5606_false_11_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x5606_false_11_def P_0x5606_false_11_regions_def post: Q_0x5608_11_def regionset: P_0x5606_false_11_regions_set_def)

definition P_0x55e3_false_12 :: state_pred where
  \<open>P_0x55e3_false_12 \<sigma> \<equiv> RIP \<sigma> = 0x55e3 \<and> RAX \<sigma> = (((sextend (ucast ((\<langle>31,0\<rangle>strlen_0x55ad_retval::32 word))) 32 64::64 word)::64 word) + RDI\<^sub>0) \<and> RBX \<sigma> = ((((RSI\<^sub>0::64 word) + RDI\<^sub>0)::64 word) - 0x1) \<and> RCX \<sigma> = ((RDX\<^sub>0::64 word) + 0x1) \<and> RDX \<sigma> = ucast ((\<sigma> \<turnstile> *[RDX\<^sub>0,1]::8 word)) \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x18) \<and> RBP \<sigma> = RDI\<^sub>0 \<and> R12 \<sigma> = RDX\<^sub>0 \<and> (\<sigma> \<turnstile> *[RDX\<^sub>0,1]::8 word) = ucast ((\<sigma> \<turnstile> *[RDX\<^sub>0,1]::8 word)) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = 0x55b2\<close>
declare P_0x55e3_false_12_def[Ps]

definition P_0x55e3_false_12_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x55e3_false_12_regions_set \<sigma> \<equiv> {
    (0, RDX\<^sub>0, Suc 0),
    (1, RSP\<^sub>0, 8),
    (2, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x20), 8)
  }\<close>

definition P_0x55e3_false_12_regions :: state_pred where
  \<open>P_0x55e3_false_12_regions \<sigma> \<equiv> \<exists>regions. P_0x55e3_false_12_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x5608_12 :: state_pred where
  \<open>Q_0x5608_12 \<sigma> \<equiv> RIP \<sigma> = 0x5608 \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x18) \<and> RBP \<sigma> = RDI\<^sub>0 \<and> R12 \<sigma> = RDX\<^sub>0 \<and> (\<sigma> \<turnstile> *[RDX\<^sub>0,1]::8 word) = ucast ((\<sigma> \<turnstile> *[RDX\<^sub>0,1]::8 word)) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = 0x55b2\<close>
declare Q_0x5608_12_def[Qs]

schematic_goal pstrcat_0_2_0x55e3_0x55e5_12[blocks]:
  assumes \<open>(P_0x55e3_false_12 && P_0x55e3_false_12_regions && ! CF) \<sigma>\<close>
  shows \<open>exec_block 2 0x55e5 12 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x5608_12 ?\<sigma> \<and> block_usage P_0x55e3_false_12_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x55e3_false_12_def P_0x55e3_false_12_regions_def post: Q_0x5608_12_def regionset: P_0x55e3_false_12_regions_set_def)

definition P_0x5608_13 :: state_pred where
  \<open>P_0x5608_13 \<sigma> \<equiv> RIP \<sigma> = 0x5608 \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x18) \<and> RBP \<sigma> = RDI\<^sub>0 \<and> R12 \<sigma> = RDX\<^sub>0 \<and> (\<sigma> \<turnstile> *[RDX\<^sub>0,1]::8 word) = ucast ((\<sigma> \<turnstile> *[RDX\<^sub>0,1]::8 word)) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = 0x55b2\<close>
declare P_0x5608_13_def[Ps]

definition P_0x5608_13_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x5608_13_regions_set \<sigma> \<equiv> {
    (0, RAX \<sigma>, Suc 0),
    (1, RDX\<^sub>0, Suc 0),
    (2, RSP\<^sub>0, 8),
    (3, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x20), 8)
  }\<close>

definition P_0x5608_13_regions :: state_pred where
  \<open>P_0x5608_13_regions \<sigma> \<equiv> \<exists>regions. P_0x5608_13_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_ret_address_13 :: state_pred where
  \<open>Q_ret_address_13 \<sigma> \<equiv> RIP \<sigma> = ret_address \<and> RAX \<sigma> = RDI\<^sub>0 \<and> RBX \<sigma> = RBX\<^sub>0 \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) + 0x8) \<and> RBP \<sigma> = RBP\<^sub>0 \<and> R12 \<sigma> = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = 0x55b2\<close>
declare Q_ret_address_13_def[Qs]

schematic_goal pstrcat_0_6_0x5608_0x5612_13[blocks]:
  assumes \<open>(P_0x5608_13 && P_0x5608_13_regions) \<sigma>\<close>
  shows \<open>exec_block 6 0x5612 13 \<sigma> \<triangleq> ?\<sigma> \<and> Q_ret_address_13 ?\<sigma> \<and> block_usage P_0x5608_13_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x5608_13_def P_0x5608_13_regions_def post: Q_ret_address_13_def regionset: P_0x5608_13_regions_set_def)

definition P_0x55b7_false_14 :: state_pred where
  \<open>P_0x55b7_false_14 \<sigma> \<equiv> RIP \<sigma> = 0x55b7 \<and> RAX \<sigma> = (sextend (ucast ((\<langle>31,0\<rangle>strlen_0x55ad_retval::32 word))) 32 64::64 word) \<and> RBX \<sigma> = RSI\<^sub>0 \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = RDX\<^sub>0 \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x18) \<and> RBP \<sigma> = RDI\<^sub>0 \<and> R12 \<sigma> = RDX\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = 0x55b2\<close>
declare P_0x55b7_false_14_def[Ps]

definition P_0x55b7_false_14_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x55b7_false_14_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (2, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x20), 8)
  }\<close>

definition P_0x55b7_false_14_regions :: state_pred where
  \<open>P_0x55b7_false_14_regions \<sigma> \<equiv> \<exists>regions. P_0x55b7_false_14_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_ret_address_14 :: state_pred where
  \<open>Q_ret_address_14 \<sigma> \<equiv> RIP \<sigma> = ret_address \<and> RAX \<sigma> = RDI\<^sub>0 \<and> RBX \<sigma> = RBX\<^sub>0 \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) + 0x8) \<and> RBP \<sigma> = RBP\<^sub>0 \<and> R12 \<sigma> = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = 0x55b2\<close>
declare Q_ret_address_14_def[Qs]

schematic_goal pstrcat_0_6_0x55b7_0x55c0_14[blocks]:
  assumes \<open>(P_0x55b7_false_14 && P_0x55b7_false_14_regions && ! CF) \<sigma>\<close>
  shows \<open>exec_block 6 0x55c0 14 \<sigma> \<triangleq> ?\<sigma> \<and> Q_ret_address_14 ?\<sigma> \<and> block_usage P_0x55b7_false_14_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x55b7_false_14_def P_0x55b7_false_14_regions_def post: Q_ret_address_14_def regionset: P_0x55b7_false_14_regions_set_def)

definition pstrcat_acode :: ACode where
  \<open>pstrcat_acode =
    Block 6 0x55aa 0;
    Block (Suc 0) 0x55ad (Suc 0);
    CALL strlen_acode;
    Block 2 0x55b4 2;
    IF CF THEN
      Block 6 0x55d9 3;
      IF ZF THEN
        Block (Suc 0) 0x55db 4
      ELSE
        Block 3 0x55e0 5;
        IF CF THEN
          Block (Suc 0) 0x55e3 6;
          WHILE P_0x55f5_7 DO
            Block 5 0x5604 7;
            IF !ZF THEN
              Block 2 0x55f0 8;
              IF ZF THEN
                Block (Suc 0) 0x55f3 9
              ELSE
                Block (Suc 0) 0x55f3 10
              FI
            ELSE
              Block (Suc 0) 0x5606 11
            FI
          OD
        ELSE
          Block 2 0x55e5 12
        FI
      FI;
      Block 6 0x5612 13
    ELSE
      Block 6 0x55c0 14
    FI
  \<close>

schematic_goal "pstrcat":
  assumes
    \<open>\<forall>\<sigma>. RIP \<sigma> = 0x55ad \<longrightarrow> P_0x55ad_1_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x55b2 \<longrightarrow> P_0x55b2_2_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x55b7 \<longrightarrow> P_0x55b7_true_3_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x55db \<longrightarrow> P_0x55db_true_4_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x55db \<longrightarrow> P_0x55db_false_5_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x55e3 \<longrightarrow> P_0x55e3_true_6_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x55f5 \<longrightarrow> P_0x55f5_7_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x5606 \<longrightarrow> P_0x5606_true_8_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x55f3 \<longrightarrow> P_0x55f3_true_9_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x55f3 \<longrightarrow> P_0x55f3_false_10_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x5606 \<longrightarrow> P_0x5606_false_11_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x55e3 \<longrightarrow> P_0x55e3_false_12_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x5608 \<longrightarrow> P_0x5608_13_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x55b7 \<longrightarrow> P_0x55b7_false_14_regions \<sigma>\<close>
    and [blocks]: \<open>{{Q_strlen_addr_0x55ad_1}} \<box>strlen_acode {{P_0x55b2_2;M_0x55ad}}\<close>
  shows \<open>{{?P}} pstrcat_acode {{?Q;?M}}\<close>
  apply (vcg acode: pstrcat_acode_def assms: assms)
                   apply (vcg_while \<open>P_0x55f5_7 || P_0x5608_13\<close> assms: assms)
                    apply (vcg_step assms: assms)+
                   apply (simp add: pred_logic Ps Qs assms)
                  apply (simp add: pred_logic Ps Qs assms)
                 apply (vcg_step assms: assms)+
               apply (simp add: assms)+
        apply (vcg_step assms: assms)+
  done

end

locale "path_combine" = "qemu_img_xen" +
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

definition P_0x17ee0_0 :: state_pred where
  \<open>P_0x17ee0_0 \<sigma> \<equiv> RIP \<sigma> = 0x17ee0 \<and> RAX \<sigma> = RAX\<^sub>0 \<and> RBX \<sigma> = RBX\<^sub>0 \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = RDX\<^sub>0 \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = RSP\<^sub>0 \<and> RBP \<sigma> = RBP\<^sub>0 \<and> R15 \<sigma> = R15\<^sub>0 \<and> R14 \<sigma> = R14\<^sub>0 \<and> R13 \<sigma> = R13\<^sub>0 \<and> R12 \<sigma> = R12\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address\<close>
declare P_0x17ee0_0_def[Ps]

definition P_0x17ee0_0_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x17ee0_0_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8)
  }\<close>

definition P_0x17ee0_0_regions :: state_pred where
  \<open>P_0x17ee0_0_regions \<sigma> \<equiv> \<exists>regions. P_0x17ee0_0_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x17ee2_0 :: state_pred where
  \<open>Q_0x17ee2_0 \<sigma> \<equiv> RIP \<sigma> = 0x17ee2 \<and> RAX \<sigma> = RAX\<^sub>0 \<and> RBX \<sigma> = RBX\<^sub>0 \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = RDX\<^sub>0 \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = RSP\<^sub>0 \<and> RBP \<sigma> = RBP\<^sub>0 \<and> R15 \<sigma> = R15\<^sub>0 \<and> R14 \<sigma> = R14\<^sub>0 \<and> R13 \<sigma> = R13\<^sub>0 \<and> R12 \<sigma> = R12\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address\<close>
declare Q_0x17ee2_0_def[Qs]

schematic_goal path_combine_0_1_0x17ee0_0x17ee0_0[blocks]:
  assumes \<open>(P_0x17ee0_0 && P_0x17ee0_0_regions) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x17ee0 0 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x17ee2_0 ?\<sigma> \<and> block_usage P_0x17ee0_0_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x17ee0_0_def P_0x17ee0_0_regions_def post: Q_0x17ee2_0_def regionset: P_0x17ee0_0_regions_set_def)

definition P_0x17ee2_true_1 :: state_pred where
  \<open>P_0x17ee2_true_1 \<sigma> \<equiv> RIP \<sigma> = 0x17ee2 \<and> RAX \<sigma> = RAX\<^sub>0 \<and> RBX \<sigma> = RBX\<^sub>0 \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = RDX\<^sub>0 \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = RSP\<^sub>0 \<and> RBP \<sigma> = RBP\<^sub>0 \<and> R15 \<sigma> = R15\<^sub>0 \<and> R14 \<sigma> = R14\<^sub>0 \<and> R13 \<sigma> = R13\<^sub>0 \<and> R12 \<sigma> = R12\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address\<close>
declare P_0x17ee2_true_1_def[Ps]

definition P_0x17ee2_true_1_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x17ee2_true_1_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8)
  }\<close>

definition P_0x17ee2_true_1_regions :: state_pred where
  \<open>P_0x17ee2_true_1_regions \<sigma> \<equiv> \<exists>regions. P_0x17ee2_true_1_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_ret_address_1 :: state_pred where
  \<open>Q_ret_address_1 \<sigma> \<equiv> RIP \<sigma> = ret_address \<and> RBX \<sigma> = RBX\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) + 0x8) \<and> RBP \<sigma> = RBP\<^sub>0 \<and> R15 \<sigma> = R15\<^sub>0 \<and> R14 \<sigma> = R14\<^sub>0 \<and> R13 \<sigma> = R13\<^sub>0 \<and> R12 \<sigma> = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address\<close>
declare Q_ret_address_1_def[Qs]

schematic_goal path_combine_0_2_0x17ee2_0x17fa0_1[blocks]:
  assumes \<open>(P_0x17ee2_true_1 && P_0x17ee2_true_1_regions && jle) \<sigma>\<close>
  shows \<open>exec_block 2 0x17fa0 (Suc 0) \<sigma> \<triangleq> ?\<sigma> \<and> Q_ret_address_1 ?\<sigma> \<and> block_usage P_0x17ee2_true_1_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x17ee2_true_1_def P_0x17ee2_true_1_regions_def post: Q_ret_address_1_def regionset: P_0x17ee2_true_1_regions_set_def)

definition P_0x17ee2_false_2 :: state_pred where
  \<open>P_0x17ee2_false_2 \<sigma> \<equiv> RIP \<sigma> = 0x17ee2 \<and> RAX \<sigma> = RAX\<^sub>0 \<and> RBX \<sigma> = RBX\<^sub>0 \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = RDX\<^sub>0 \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = RSP\<^sub>0 \<and> RBP \<sigma> = RBP\<^sub>0 \<and> R15 \<sigma> = R15\<^sub>0 \<and> R14 \<sigma> = R14\<^sub>0 \<and> R13 \<sigma> = R13\<^sub>0 \<and> R12 \<sigma> = R12\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address\<close>
declare P_0x17ee2_false_2_def[Ps]

definition P_0x17ee2_false_2_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x17ee2_false_2_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (2, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x30), 8)
  }\<close>

definition P_0x17ee2_false_2_regions :: state_pred where
  \<open>P_0x17ee2_false_2_regions \<sigma> \<equiv> \<exists>regions. P_0x17ee2_false_2_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x17f0d_2 :: state_pred where
  \<open>Q_0x17f0d_2 \<sigma> \<equiv> RIP \<sigma> = 0x17f0d \<and> RAX \<sigma> = RAX\<^sub>0 \<and> RBX \<sigma> = RDX\<^sub>0 \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = RDX\<^sub>0 \<and> RDI \<sigma> = RCX\<^sub>0 \<and> RSI \<sigma> = 0x3a \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x38) \<and> RBP \<sigma> = RCX\<^sub>0 \<and> R15 \<sigma> = R15\<^sub>0 \<and> R14 \<sigma> = (sextend (ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word))) 32 64::64 word) \<and> R13 \<sigma> = (sextend (ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word))) 32 64::64 word) \<and> R12 \<sigma> = RDI\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0\<close>
declare Q_0x17f0d_2_def[Qs]

schematic_goal path_combine_0_15_0x17ee2_0x17f09_2[blocks]:
  assumes \<open>(P_0x17ee2_false_2 && P_0x17ee2_false_2_regions && ! jle) \<sigma>\<close>
  shows \<open>exec_block 15 0x17f09 2 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x17f0d_2 ?\<sigma> \<and> block_usage P_0x17ee2_false_2_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x17ee2_false_2_def P_0x17ee2_false_2_regions_def post: Q_0x17f0d_2_def regionset: P_0x17ee2_false_2_regions_set_def)

definition P_0x17f0d_3 :: state_pred where
  \<open>P_0x17f0d_3 \<sigma> \<equiv> RIP \<sigma> = 0x17f0d \<and> RAX \<sigma> = RAX\<^sub>0 \<and> RBX \<sigma> = RDX\<^sub>0 \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = RDX\<^sub>0 \<and> RDI \<sigma> = RCX\<^sub>0 \<and> RSI \<sigma> = 0x3a \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x38) \<and> RBP \<sigma> = RCX\<^sub>0 \<and> R15 \<sigma> = R15\<^sub>0 \<and> R14 \<sigma> = (sextend (ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word))) 32 64::64 word) \<and> R13 \<sigma> = (sextend (ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word))) 32 64::64 word) \<and> R12 \<sigma> = RDI\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0\<close>
declare P_0x17f0d_3_def[Ps]

definition P_0x17f0d_3_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x17f0d_3_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (2, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x40), 8)
  }\<close>

definition P_0x17f0d_3_regions :: state_pred where
  \<open>P_0x17f0d_3_regions \<sigma> \<equiv> \<exists>regions. P_0x17f0d_3_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_strchr_addr_0x17f0d_3 :: state_pred where
  \<open>Q_strchr_addr_0x17f0d_3 \<sigma> \<equiv> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x40) \<and> RIP \<sigma> = strchr_addr \<and> RAX \<sigma> = RAX\<^sub>0 \<and> RBX \<sigma> = RDX\<^sub>0 \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = RDX\<^sub>0 \<and> RDI \<sigma> = RCX\<^sub>0 \<and> RSI \<sigma> = 0x3a \<and> RBP \<sigma> = RCX\<^sub>0 \<and> R15 \<sigma> = R15\<^sub>0 \<and> R14 \<sigma> = (sextend (ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word))) 32 64::64 word) \<and> R13 \<sigma> = (sextend (ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word))) 32 64::64 word) \<and> R12 \<sigma> = RDI\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = 0x17f12\<close>
declare Q_strchr_addr_0x17f0d_3_def[Qs]

schematic_goal path_combine_0_1_0x17f0d_0x17f0d_3[blocks]:
  assumes \<open>(P_0x17f0d_3 && P_0x17f0d_3_regions) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x17f0d 3 \<sigma> \<triangleq> ?\<sigma> \<and> Q_strchr_addr_0x17f0d_3 ?\<sigma> \<and> block_usage P_0x17f0d_3_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x17f0d_3_def P_0x17f0d_3_regions_def post: Q_strchr_addr_0x17f0d_3_def regionset: P_0x17f0d_3_regions_set_def)

definition P_0x17f12_4 :: state_pred where
  \<open>P_0x17f12_4 \<sigma> \<equiv> RIP \<sigma> = 0x17f12 \<and> RAX \<sigma> = strchr_0x17f0d_retval \<and> RBX \<sigma> = RDX\<^sub>0 \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = RDX\<^sub>0 \<and> RDI \<sigma> = RCX\<^sub>0 \<and> RSI \<sigma> = 0x3a \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x38) \<and> RBP \<sigma> = RCX\<^sub>0 \<and> R15 \<sigma> = R15\<^sub>0 \<and> R14 \<sigma> = (sextend (ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word))) 32 64::64 word) \<and> R13 \<sigma> = (sextend (ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word))) 32 64::64 word) \<and> R12 \<sigma> = RDI\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = 0x17f12\<close>
declare P_0x17f12_4_def[Ps]

definition P_0x17f12_4_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x17f12_4_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (2, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x40), 8),
    (8, (if' (strchr_0x17f0d_retval::64 word) = (ucast ((0x0::64 word))::64 word) then RCX\<^sub>0 else (((strchr_0x17f0d_retval::64 word) + 0x1)::64 word)), Suc 0)
  }\<close>

definition P_0x17f12_4_regions :: state_pred where
  \<open>P_0x17f12_4_regions \<sigma> \<equiv> \<exists>regions. P_0x17f12_4_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x17f20_4 :: state_pred where
  \<open>Q_0x17f20_4 \<sigma> \<equiv> RIP \<sigma> = 0x17f20 \<and> RAX \<sigma> = strchr_0x17f0d_retval \<and> RBX \<sigma> = RDX\<^sub>0 \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = (if' (strchr_0x17f0d_retval::64 word) = (ucast ((0x0::64 word))::64 word) then RCX\<^sub>0 else (((strchr_0x17f0d_retval::64 word) + 0x1)::64 word)) \<and> RDI \<sigma> = RCX\<^sub>0 \<and> RSI \<sigma> = 0x3a \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x38) \<and> RBP \<sigma> = RCX\<^sub>0 \<and> R15 \<sigma> = R15\<^sub>0 \<and> R14 \<sigma> = (sextend (ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word))) 32 64::64 word) \<and> R13 \<sigma> = (sextend (ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word))) 32 64::64 word) \<and> R12 \<sigma> = RDI\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = 0x17f12 \<and> (\<sigma> \<turnstile> *[(if' (strchr_0x17f0d_retval::64 word) = (ucast ((0x0::64 word))::64 word) then RCX\<^sub>0 else (((strchr_0x17f0d_retval::64 word) + 0x1)::64 word)),1]::8 word) = ucast ((\<sigma> \<turnstile> *[(if' (strchr_0x17f0d_retval::64 word) = (ucast ((0x0::64 word))::64 word) then RCX\<^sub>0 else (((strchr_0x17f0d_retval::64 word) + 0x1)::64 word)),1]::8 word))\<close>
declare Q_0x17f20_4_def[Qs]

schematic_goal path_combine_0_4_0x17f12_0x17f1d_4[blocks]:
  assumes \<open>(P_0x17f12_4 && P_0x17f12_4_regions) \<sigma>\<close>
  shows \<open>exec_block 4 0x17f1d 4 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x17f20_4 ?\<sigma> \<and> block_usage P_0x17f12_4_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x17f12_4_def P_0x17f12_4_regions_def post: Q_0x17f20_4_def regionset: P_0x17f12_4_regions_set_def)

definition P_0x17f20_true_5 :: state_pred where
  \<open>P_0x17f20_true_5 \<sigma> \<equiv> RIP \<sigma> = 0x17f20 \<and> RAX \<sigma> = strchr_0x17f0d_retval \<and> RBX \<sigma> = RDX\<^sub>0 \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = (if' (strchr_0x17f0d_retval::64 word) = (ucast ((0x0::64 word))::64 word) then RCX\<^sub>0 else (((strchr_0x17f0d_retval::64 word) + 0x1)::64 word)) \<and> RDI \<sigma> = RCX\<^sub>0 \<and> RSI \<sigma> = 0x3a \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x38) \<and> RBP \<sigma> = RCX\<^sub>0 \<and> R15 \<sigma> = R15\<^sub>0 \<and> R14 \<sigma> = (sextend (ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word))) 32 64::64 word) \<and> R13 \<sigma> = (sextend (ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word))) 32 64::64 word) \<and> R12 \<sigma> = RDI\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = 0x17f12 \<and> (\<sigma> \<turnstile> *[(if' (strchr_0x17f0d_retval::64 word) = (ucast ((0x0::64 word))::64 word) then RCX\<^sub>0 else (((strchr_0x17f0d_retval::64 word) + 0x1)::64 word)),1]::8 word) = ucast ((\<sigma> \<turnstile> *[(if' (strchr_0x17f0d_retval::64 word) = (ucast ((0x0::64 word))::64 word) then RCX\<^sub>0 else (((strchr_0x17f0d_retval::64 word) + 0x1)::64 word)),1]::8 word))\<close>
declare P_0x17f20_true_5_def[Ps]

definition P_0x17f20_true_5_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x17f20_true_5_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (2, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x40), 8),
    (8, (if' (strchr_0x17f0d_retval::64 word) = (ucast ((0x0::64 word))::64 word) then RCX\<^sub>0 else (((strchr_0x17f0d_retval::64 word) + 0x1)::64 word)), Suc 0)
  }\<close>

definition P_0x17f20_true_5_regions :: state_pred where
  \<open>P_0x17f20_true_5_regions \<sigma> \<equiv> \<exists>regions. P_0x17f20_true_5_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x5563_5 :: state_pred where
  \<open>Q_0x5563_5 \<sigma> \<equiv> RIP \<sigma> = 0x5563 \<and> RAX \<sigma> = strchr_0x17f0d_retval \<and> RBX \<sigma> = RBX\<^sub>0 \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = RCX\<^sub>0 \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = (sextend (ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word))) 32 64::64 word) \<and> RSP \<sigma> = RSP\<^sub>0 \<and> RBP \<sigma> = RBP\<^sub>0 \<and> R15 \<sigma> = R15\<^sub>0 \<and> R14 \<sigma> = R14\<^sub>0 \<and> R13 \<sigma> = R13\<^sub>0 \<and> R12 \<sigma> = R12\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = 0x17f12 \<and> (\<sigma> \<turnstile> *[(if' (strchr_0x17f0d_retval::64 word) = (ucast ((0x0::64 word))::64 word) then RCX\<^sub>0 else (((strchr_0x17f0d_retval::64 word) + 0x1)::64 word)),1]::8 word) = ucast ((\<sigma> \<turnstile> *[(if' (strchr_0x17f0d_retval::64 word) = (ucast ((0x0::64 word))::64 word) then RCX\<^sub>0 else (((strchr_0x17f0d_retval::64 word) + 0x1)::64 word)),1]::8 word))\<close>
declare Q_0x5563_5_def[Qs]

schematic_goal path_combine_0_13_0x17f20_0x5560_5[blocks]:
  assumes \<open>(P_0x17f20_true_5 && P_0x17f20_true_5_regions && ZF) \<sigma>\<close>
  shows \<open>exec_block 13 0x5560 5 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x5563_5 ?\<sigma> \<and> block_usage P_0x17f20_true_5_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x17f20_true_5_def P_0x17f20_true_5_regions_def post: Q_0x5563_5_def regionset: P_0x17f20_true_5_regions_set_def)

definition P_0x5563_true_6 :: state_pred where
  \<open>P_0x5563_true_6 \<sigma> \<equiv> RIP \<sigma> = 0x5563 \<and> RAX \<sigma> = strchr_0x17f0d_retval \<and> RBX \<sigma> = RBX\<^sub>0 \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = RCX\<^sub>0 \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = (sextend (ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word))) 32 64::64 word) \<and> RSP \<sigma> = RSP\<^sub>0 \<and> RBP \<sigma> = RBP\<^sub>0 \<and> R15 \<sigma> = R15\<^sub>0 \<and> R14 \<sigma> = R14\<^sub>0 \<and> R13 \<sigma> = R13\<^sub>0 \<and> R12 \<sigma> = R12\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = 0x17f12 \<and> (\<sigma> \<turnstile> *[(if' (strchr_0x17f0d_retval::64 word) = (ucast ((0x0::64 word))::64 word) then RCX\<^sub>0 else (((strchr_0x17f0d_retval::64 word) + 0x1)::64 word)),1]::8 word) = ucast ((\<sigma> \<turnstile> *[(if' (strchr_0x17f0d_retval::64 word) = (ucast ((0x0::64 word))::64 word) then RCX\<^sub>0 else (((strchr_0x17f0d_retval::64 word) + 0x1)::64 word)),1]::8 word))\<close>
declare P_0x5563_true_6_def[Ps]

definition P_0x5563_true_6_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x5563_true_6_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (2, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x40), 8),
    (8, (if' (strchr_0x17f0d_retval::64 word) = (ucast ((0x0::64 word))::64 word) then RCX\<^sub>0 else (((strchr_0x17f0d_retval::64 word) + 0x1)::64 word)), Suc 0)
  }\<close>

definition P_0x5563_true_6_regions :: state_pred where
  \<open>P_0x5563_true_6_regions \<sigma> \<equiv> \<exists>regions. P_0x5563_true_6_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x559b_6 :: state_pred where
  \<open>Q_0x559b_6 \<sigma> \<equiv> RIP \<sigma> = 0x559b \<and> RBX \<sigma> = RBX\<^sub>0 \<and> RSI \<sigma> = (sextend (ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word))) 32 64::64 word) \<and> RSP \<sigma> = RSP\<^sub>0 \<and> RBP \<sigma> = RBP\<^sub>0 \<and> R15 \<sigma> = R15\<^sub>0 \<and> R14 \<sigma> = R14\<^sub>0 \<and> R13 \<sigma> = R13\<^sub>0 \<and> R12 \<sigma> = R12\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = 0x17f12 \<and> (\<sigma> \<turnstile> *[(if' (strchr_0x17f0d_retval::64 word) = (ucast ((0x0::64 word))::64 word) then RCX\<^sub>0 else (((strchr_0x17f0d_retval::64 word) + 0x1)::64 word)),1]::8 word) = ucast ((\<sigma> \<turnstile> *[(if' (strchr_0x17f0d_retval::64 word) = (ucast ((0x0::64 word))::64 word) then RCX\<^sub>0 else (((strchr_0x17f0d_retval::64 word) + 0x1)::64 word)),1]::8 word))\<close>
declare Q_0x559b_6_def[Qs]

schematic_goal path_combine_0_1_0x5563_0x5563_6[blocks]:
  assumes \<open>(P_0x5563_true_6 && P_0x5563_true_6_regions && ZF) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x5563 6 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x559b_6 ?\<sigma> \<and> block_usage P_0x5563_true_6_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x5563_true_6_def P_0x5563_true_6_regions_def post: Q_0x559b_6_def regionset: P_0x5563_true_6_regions_set_def)

definition P_0x5563_false_7 :: state_pred where
  \<open>P_0x5563_false_7 \<sigma> \<equiv> RIP \<sigma> = 0x5563 \<and> RAX \<sigma> = strchr_0x17f0d_retval \<and> RBX \<sigma> = RBX\<^sub>0 \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = RCX\<^sub>0 \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = (sextend (ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word))) 32 64::64 word) \<and> RSP \<sigma> = RSP\<^sub>0 \<and> RBP \<sigma> = RBP\<^sub>0 \<and> R15 \<sigma> = R15\<^sub>0 \<and> R14 \<sigma> = R14\<^sub>0 \<and> R13 \<sigma> = R13\<^sub>0 \<and> R12 \<sigma> = R12\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = 0x17f12 \<and> (\<sigma> \<turnstile> *[(if' (strchr_0x17f0d_retval::64 word) = (ucast ((0x0::64 word))::64 word) then RCX\<^sub>0 else (((strchr_0x17f0d_retval::64 word) + 0x1)::64 word)),1]::8 word) = ucast ((\<sigma> \<turnstile> *[(if' (strchr_0x17f0d_retval::64 word) = (ucast ((0x0::64 word))::64 word) then RCX\<^sub>0 else (((strchr_0x17f0d_retval::64 word) + 0x1)::64 word)),1]::8 word))\<close>
declare P_0x5563_false_7_def[Ps]

definition P_0x5563_false_7_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x5563_false_7_regions_set \<sigma> \<equiv> {
    (0, RCX\<^sub>0, Suc 0),
    (1, RSP\<^sub>0, 8),
    (2, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x40), 8),
    (9, (if' (strchr_0x17f0d_retval::64 word) = (ucast ((0x0::64 word))::64 word) then RCX\<^sub>0 else (((strchr_0x17f0d_retval::64 word) + 0x1)::64 word)), Suc 0)
  }\<close>

definition P_0x5563_false_7_regions :: state_pred where
  \<open>P_0x5563_false_7_regions \<sigma> \<equiv> \<exists>regions. P_0x5563_false_7_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x556e_7 :: state_pred where
  \<open>Q_0x556e_7 \<sigma> \<equiv> RIP \<sigma> = 0x556e \<and> RAX \<sigma> = ucast ((\<sigma> \<turnstile> *[RCX\<^sub>0,1]::8 word)) \<and> RBX \<sigma> = RBX\<^sub>0 \<and> RCX \<sigma> = ((RCX\<^sub>0::64 word) + 0x1) \<and> RDX \<sigma> = RCX\<^sub>0 \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = (sextend (ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word))) 32 64::64 word) \<and> RSP \<sigma> = RSP\<^sub>0 \<and> RBP \<sigma> = RBP\<^sub>0 \<and> R15 \<sigma> = R15\<^sub>0 \<and> R14 \<sigma> = R14\<^sub>0 \<and> R13 \<sigma> = R13\<^sub>0 \<and> R12 \<sigma> = R12\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> (\<sigma> \<turnstile> *[RCX\<^sub>0,1]::8 word) = ucast ((\<sigma> \<turnstile> *[RCX\<^sub>0,1]::8 word)) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = 0x17f12 \<and> (\<sigma> \<turnstile> *[(if' (strchr_0x17f0d_retval::64 word) = (ucast ((0x0::64 word))::64 word) then RCX\<^sub>0 else (((strchr_0x17f0d_retval::64 word) + 0x1)::64 word)),1]::8 word) = ucast ((\<sigma> \<turnstile> *[(if' (strchr_0x17f0d_retval::64 word) = (ucast ((0x0::64 word))::64 word) then RCX\<^sub>0 else (((strchr_0x17f0d_retval::64 word) + 0x1)::64 word)),1]::8 word))\<close>
declare Q_0x556e_7_def[Qs]

schematic_goal path_combine_0_4_0x5563_0x556c_7[blocks]:
  assumes \<open>(P_0x5563_false_7 && P_0x5563_false_7_regions && ! ZF) \<sigma>\<close>
  shows \<open>exec_block 4 0x556c 7 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x556e_7 ?\<sigma> \<and> block_usage P_0x5563_false_7_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x5563_false_7_def P_0x5563_false_7_regions_def post: Q_0x556e_7_def regionset: P_0x5563_false_7_regions_set_def)

definition P_0x556e_true_8 :: state_pred where
  \<open>P_0x556e_true_8 \<sigma> \<equiv> RIP \<sigma> = 0x556e \<and> RAX \<sigma> = ucast ((\<sigma> \<turnstile> *[RCX\<^sub>0,1]::8 word)) \<and> RBX \<sigma> = RBX\<^sub>0 \<and> RCX \<sigma> = ((RCX\<^sub>0::64 word) + 0x1) \<and> RDX \<sigma> = RCX\<^sub>0 \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = (sextend (ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word))) 32 64::64 word) \<and> RSP \<sigma> = RSP\<^sub>0 \<and> RBP \<sigma> = RBP\<^sub>0 \<and> R15 \<sigma> = R15\<^sub>0 \<and> R14 \<sigma> = R14\<^sub>0 \<and> R13 \<sigma> = R13\<^sub>0 \<and> R12 \<sigma> = R12\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> (\<sigma> \<turnstile> *[RCX\<^sub>0,1]::8 word) = ucast ((\<sigma> \<turnstile> *[RCX\<^sub>0,1]::8 word)) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = 0x17f12 \<and> (\<sigma> \<turnstile> *[(if' (strchr_0x17f0d_retval::64 word) = (ucast ((0x0::64 word))::64 word) then RCX\<^sub>0 else (((strchr_0x17f0d_retval::64 word) + 0x1)::64 word)),1]::8 word) = ucast ((\<sigma> \<turnstile> *[(if' (strchr_0x17f0d_retval::64 word) = (ucast ((0x0::64 word))::64 word) then RCX\<^sub>0 else (((strchr_0x17f0d_retval::64 word) + 0x1)::64 word)),1]::8 word))\<close>
declare P_0x556e_true_8_def[Ps]

definition P_0x556e_true_8_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x556e_true_8_regions_set \<sigma> \<equiv> {
    (0, RCX\<^sub>0, Suc 0),
    (1, RSP\<^sub>0, 8),
    (2, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x40), 8),
    (9, (if' (strchr_0x17f0d_retval::64 word) = (ucast ((0x0::64 word))::64 word) then RCX\<^sub>0 else (((strchr_0x17f0d_retval::64 word) + 0x1)::64 word)), Suc 0)
  }\<close>

definition P_0x556e_true_8_regions :: state_pred where
  \<open>P_0x556e_true_8_regions \<sigma> \<equiv> \<exists>regions. P_0x556e_true_8_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x5598_8 :: state_pred where
  \<open>Q_0x5598_8 \<sigma> \<equiv> RIP \<sigma> = 0x5598 \<and> RBX \<sigma> = RBX\<^sub>0 \<and> RSI \<sigma> = (sextend (ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word))) 32 64::64 word) \<and> RSP \<sigma> = RSP\<^sub>0 \<and> RBP \<sigma> = RBP\<^sub>0 \<and> R15 \<sigma> = R15\<^sub>0 \<and> R14 \<sigma> = R14\<^sub>0 \<and> R13 \<sigma> = R13\<^sub>0 \<and> R12 \<sigma> = R12\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> (\<sigma> \<turnstile> *[RCX\<^sub>0,1]::8 word) = ucast ((\<sigma> \<turnstile> *[RCX\<^sub>0,1]::8 word)) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = 0x17f12 \<and> (\<sigma> \<turnstile> *[(if' (strchr_0x17f0d_retval::64 word) = (ucast ((0x0::64 word))::64 word) then RCX\<^sub>0 else (((strchr_0x17f0d_retval::64 word) + 0x1)::64 word)),1]::8 word) = ucast ((\<sigma> \<turnstile> *[(if' (strchr_0x17f0d_retval::64 word) = (ucast ((0x0::64 word))::64 word) then RCX\<^sub>0 else (((strchr_0x17f0d_retval::64 word) + 0x1)::64 word)),1]::8 word))\<close>
declare Q_0x5598_8_def[Qs]

schematic_goal path_combine_0_1_0x556e_0x556e_8[blocks]:
  assumes \<open>(P_0x556e_true_8 && P_0x556e_true_8_regions && ZF) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x556e 8 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x5598_8 ?\<sigma> \<and> block_usage P_0x556e_true_8_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x556e_true_8_def P_0x556e_true_8_regions_def post: Q_0x5598_8_def regionset: P_0x556e_true_8_regions_set_def)

definition P_0x556e_false_9 :: state_pred where
  \<open>P_0x556e_false_9 \<sigma> \<equiv> RIP \<sigma> = 0x556e \<and> RAX \<sigma> = ucast ((\<sigma> \<turnstile> *[RCX\<^sub>0,1]::8 word)) \<and> RBX \<sigma> = RBX\<^sub>0 \<and> RCX \<sigma> = ((RCX\<^sub>0::64 word) + 0x1) \<and> RDX \<sigma> = RCX\<^sub>0 \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = (sextend (ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word))) 32 64::64 word) \<and> RSP \<sigma> = RSP\<^sub>0 \<and> RBP \<sigma> = RBP\<^sub>0 \<and> R15 \<sigma> = R15\<^sub>0 \<and> R14 \<sigma> = R14\<^sub>0 \<and> R13 \<sigma> = R13\<^sub>0 \<and> R12 \<sigma> = R12\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> (\<sigma> \<turnstile> *[RCX\<^sub>0,1]::8 word) = ucast ((\<sigma> \<turnstile> *[RCX\<^sub>0,1]::8 word)) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = 0x17f12 \<and> (\<sigma> \<turnstile> *[(if' (strchr_0x17f0d_retval::64 word) = (ucast ((0x0::64 word))::64 word) then RCX\<^sub>0 else (((strchr_0x17f0d_retval::64 word) + 0x1)::64 word)),1]::8 word) = ucast ((\<sigma> \<turnstile> *[(if' (strchr_0x17f0d_retval::64 word) = (ucast ((0x0::64 word))::64 word) then RCX\<^sub>0 else (((strchr_0x17f0d_retval::64 word) + 0x1)::64 word)),1]::8 word))\<close>
declare P_0x556e_false_9_def[Ps]

definition P_0x556e_false_9_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x556e_false_9_regions_set \<sigma> \<equiv> {
    (0, RCX\<^sub>0, Suc 0),
    (1, RSP\<^sub>0, 8),
    (2, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x40), 8),
    (9, (if' (strchr_0x17f0d_retval::64 word) = (ucast ((0x0::64 word))::64 word) then RCX\<^sub>0 else (((strchr_0x17f0d_retval::64 word) + 0x1)::64 word)), Suc 0)
  }\<close>

definition P_0x556e_false_9_regions :: state_pred where
  \<open>P_0x556e_false_9_regions \<sigma> \<equiv> \<exists>regions. P_0x556e_false_9_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x5578_9 :: state_pred where
  \<open>Q_0x5578_9 \<sigma> \<equiv> RIP \<sigma> = 0x5578 \<and> RAX \<sigma> = ucast ((\<sigma> \<turnstile> *[RCX\<^sub>0,1]::8 word)) \<and> RBX \<sigma> = RBX\<^sub>0 \<and> RCX \<sigma> = ((RCX\<^sub>0::64 word) + 0x1) \<and> RDX \<sigma> = ((((RDI\<^sub>0::64 word) + (\<langle>63,0\<rangle>(((sextend (ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word))) 32 64::64 word)::64 word) * 0x1)::64 word))::64 word) - 0x1) \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = (sextend (ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word))) 32 64::64 word) \<and> RSP \<sigma> = RSP\<^sub>0 \<and> RBP \<sigma> = RBP\<^sub>0 \<and> R15 \<sigma> = R15\<^sub>0 \<and> R14 \<sigma> = R14\<^sub>0 \<and> R13 \<sigma> = R13\<^sub>0 \<and> R12 \<sigma> = R12\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> (\<sigma> \<turnstile> *[RCX\<^sub>0,1]::8 word) = ucast ((\<sigma> \<turnstile> *[RCX\<^sub>0,1]::8 word)) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = 0x17f12 \<and> (\<sigma> \<turnstile> *[(if' (strchr_0x17f0d_retval::64 word) = (ucast ((0x0::64 word))::64 word) then RCX\<^sub>0 else (((strchr_0x17f0d_retval::64 word) + 0x1)::64 word)),1]::8 word) = ucast ((\<sigma> \<turnstile> *[(if' (strchr_0x17f0d_retval::64 word) = (ucast ((0x0::64 word))::64 word) then RCX\<^sub>0 else (((strchr_0x17f0d_retval::64 word) + 0x1)::64 word)),1]::8 word))\<close>
declare Q_0x5578_9_def[Qs]

schematic_goal path_combine_0_3_0x556e_0x5575_9[blocks]:
  assumes \<open>(P_0x556e_false_9 && P_0x556e_false_9_regions && ! ZF) \<sigma>\<close>
  shows \<open>exec_block 3 0x5575 9 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x5578_9 ?\<sigma> \<and> block_usage P_0x556e_false_9_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x556e_false_9_def P_0x556e_false_9_regions_def post: Q_0x5578_9_def regionset: P_0x556e_false_9_regions_set_def)

definition P_0x5578_true_10 :: state_pred where
  \<open>P_0x5578_true_10 \<sigma> \<equiv> RIP \<sigma> = 0x5578 \<and> RAX \<sigma> = ucast ((\<sigma> \<turnstile> *[RCX\<^sub>0,1]::8 word)) \<and> RBX \<sigma> = RBX\<^sub>0 \<and> RCX \<sigma> = ((RCX\<^sub>0::64 word) + 0x1) \<and> RDX \<sigma> = ((((RDI\<^sub>0::64 word) + (\<langle>63,0\<rangle>(((sextend (ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word))) 32 64::64 word)::64 word) * 0x1)::64 word))::64 word) - 0x1) \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = (sextend (ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word))) 32 64::64 word) \<and> RSP \<sigma> = RSP\<^sub>0 \<and> RBP \<sigma> = RBP\<^sub>0 \<and> R15 \<sigma> = R15\<^sub>0 \<and> R14 \<sigma> = R14\<^sub>0 \<and> R13 \<sigma> = R13\<^sub>0 \<and> R12 \<sigma> = R12\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> (\<sigma> \<turnstile> *[RCX\<^sub>0,1]::8 word) = ucast ((\<sigma> \<turnstile> *[RCX\<^sub>0,1]::8 word)) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = 0x17f12 \<and> (\<sigma> \<turnstile> *[(if' (strchr_0x17f0d_retval::64 word) = (ucast ((0x0::64 word))::64 word) then RCX\<^sub>0 else (((strchr_0x17f0d_retval::64 word) + 0x1)::64 word)),1]::8 word) = ucast ((\<sigma> \<turnstile> *[(if' (strchr_0x17f0d_retval::64 word) = (ucast ((0x0::64 word))::64 word) then RCX\<^sub>0 else (((strchr_0x17f0d_retval::64 word) + 0x1)::64 word)),1]::8 word))\<close>
declare P_0x5578_true_10_def[Ps]

definition P_0x5578_true_10_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x5578_true_10_regions_set \<sigma> \<equiv> {
    (0, RCX\<^sub>0, Suc 0),
    (1, RSP\<^sub>0, 8),
    (2, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x40), 8),
    (9, (if' (strchr_0x17f0d_retval::64 word) = (ucast ((0x0::64 word))::64 word) then RCX\<^sub>0 else (((strchr_0x17f0d_retval::64 word) + 0x1)::64 word)), Suc 0)
  }\<close>

definition P_0x5578_true_10_regions :: state_pred where
  \<open>P_0x5578_true_10_regions \<sigma> \<equiv> \<exists>regions. P_0x5578_true_10_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x5585_10 :: state_pred where
  \<open>Q_0x5585_10 \<sigma> \<equiv> RIP \<sigma> = 0x5585 \<and> RBX \<sigma> = RBX\<^sub>0 \<and> RDX \<sigma> = ((((RDI\<^sub>0::64 word) + (\<langle>63,0\<rangle>(((sextend (ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word))) 32 64::64 word)::64 word) * 0x1)::64 word))::64 word) - 0x1) \<and> RSI \<sigma> = (sextend (ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word))) 32 64::64 word) \<and> RSP \<sigma> = RSP\<^sub>0 \<and> RBP \<sigma> = RBP\<^sub>0 \<and> R15 \<sigma> = R15\<^sub>0 \<and> R14 \<sigma> = R14\<^sub>0 \<and> R13 \<sigma> = R13\<^sub>0 \<and> R12 \<sigma> = R12\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> (\<sigma> \<turnstile> *[RCX\<^sub>0,1]::8 word) = ucast ((\<sigma> \<turnstile> *[RCX\<^sub>0,1]::8 word)) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = 0x17f12 \<and> (\<sigma> \<turnstile> *[(if' (strchr_0x17f0d_retval::64 word) = (ucast ((0x0::64 word))::64 word) then RCX\<^sub>0 else (((strchr_0x17f0d_retval::64 word) + 0x1)::64 word)),1]::8 word) = ucast ((\<sigma> \<turnstile> *[(if' (strchr_0x17f0d_retval::64 word) = (ucast ((0x0::64 word))::64 word) then RCX\<^sub>0 else (((strchr_0x17f0d_retval::64 word) + 0x1)::64 word)),1]::8 word))\<close>
declare Q_0x5585_10_def[Qs]

schematic_goal path_combine_0_1_0x5578_0x5578_10[blocks]:
  assumes \<open>(P_0x5578_true_10 && P_0x5578_true_10_regions && CF) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x5578 10 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x5585_10 ?\<sigma> \<and> block_usage P_0x5578_true_10_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x5578_true_10_def P_0x5578_true_10_regions_def post: Q_0x5585_10_def regionset: P_0x5578_true_10_regions_set_def)

definition P_0x5585_11 :: state_pred where
  \<open>P_0x5585_11 \<sigma> \<equiv> RIP \<sigma> = 0x5585 \<and> RBX \<sigma> = RBX\<^sub>0 \<and> RDX \<sigma> = ((((RDI\<^sub>0::64 word) + (\<langle>63,0\<rangle>(((sextend (ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word))) 32 64::64 word)::64 word) * 0x1)::64 word))::64 word) - 0x1) \<and> RSI \<sigma> = (sextend (ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word))) 32 64::64 word) \<and> RSP \<sigma> = RSP\<^sub>0 \<and> RBP \<sigma> = RBP\<^sub>0 \<and> R15 \<sigma> = R15\<^sub>0 \<and> R14 \<sigma> = R14\<^sub>0 \<and> R13 \<sigma> = R13\<^sub>0 \<and> R12 \<sigma> = R12\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> (\<sigma> \<turnstile> *[RCX\<^sub>0,1]::8 word) = ucast ((\<sigma> \<turnstile> *[RCX\<^sub>0,1]::8 word)) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = 0x17f12 \<and> (\<sigma> \<turnstile> *[(if' (strchr_0x17f0d_retval::64 word) = (ucast ((0x0::64 word))::64 word) then RCX\<^sub>0 else (((strchr_0x17f0d_retval::64 word) + 0x1)::64 word)),1]::8 word) = ucast ((\<sigma> \<turnstile> *[(if' (strchr_0x17f0d_retval::64 word) = (ucast ((0x0::64 word))::64 word) then RCX\<^sub>0 else (((strchr_0x17f0d_retval::64 word) + 0x1)::64 word)),1]::8 word))\<close>
declare P_0x5585_11_def[Ps]

definition P_0x5585_11_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x5585_11_regions_set \<sigma> \<equiv> {
    (0, RCX \<sigma>, Suc 0),
    (1, RDI \<sigma>, Suc 0),
    (2, RCX\<^sub>0, Suc 0),
    (3, RSP\<^sub>0, 8),
    (4, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x40), 8),
    (11, (if' (strchr_0x17f0d_retval::64 word) = (ucast ((0x0::64 word))::64 word) then RCX\<^sub>0 else (((strchr_0x17f0d_retval::64 word) + 0x1)::64 word)), Suc 0)
  }\<close>

definition P_0x5585_11_regions :: state_pred where
  \<open>P_0x5585_11_regions \<sigma> \<equiv> \<exists>regions. P_0x5585_11_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x5596_11 :: state_pred where
  \<open>Q_0x5596_11 \<sigma> \<equiv> RIP \<sigma> = 0x5596 \<and> RBX \<sigma> = RBX\<^sub>0 \<and> RDX \<sigma> = ((((RDI\<^sub>0::64 word) + (\<langle>63,0\<rangle>(((sextend (ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word))) 32 64::64 word)::64 word) * 0x1)::64 word))::64 word) - 0x1) \<and> RSI \<sigma> = (sextend (ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word))) 32 64::64 word) \<and> RSP \<sigma> = RSP\<^sub>0 \<and> RBP \<sigma> = RBP\<^sub>0 \<and> R15 \<sigma> = R15\<^sub>0 \<and> R14 \<sigma> = R14\<^sub>0 \<and> R13 \<sigma> = R13\<^sub>0 \<and> R12 \<sigma> = R12\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> (\<sigma> \<turnstile> *[RCX\<^sub>0,1]::8 word) = ucast ((\<sigma> \<turnstile> *[RCX\<^sub>0,1]::8 word)) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = 0x17f12 \<and> (\<sigma> \<turnstile> *[(if' (strchr_0x17f0d_retval::64 word) = (ucast ((0x0::64 word))::64 word) then RCX\<^sub>0 else (((strchr_0x17f0d_retval::64 word) + 0x1)::64 word)),1]::8 word) = ucast ((\<sigma> \<turnstile> *[(if' (strchr_0x17f0d_retval::64 word) = (ucast ((0x0::64 word))::64 word) then RCX\<^sub>0 else (((strchr_0x17f0d_retval::64 word) + 0x1)::64 word)),1]::8 word))\<close>
declare Q_0x5596_11_def[Qs]

schematic_goal path_combine_0_5_0x5585_0x5594_11[blocks]:
  assumes \<open>(P_0x5585_11 && P_0x5585_11_regions) \<sigma>\<close>
  shows \<open>exec_block 5 0x5594 11 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x5596_11 ?\<sigma> \<and> block_usage P_0x5585_11_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x5585_11_def P_0x5585_11_regions_def post: Q_0x5596_11_def regionset: P_0x5585_11_regions_set_def)

definition P_0x5596_true_12 :: state_pred where
  \<open>P_0x5596_true_12 \<sigma> \<equiv> RIP \<sigma> = 0x5596 \<and> RBX \<sigma> = RBX\<^sub>0 \<and> RDX \<sigma> = ((((RDI\<^sub>0::64 word) + (\<langle>63,0\<rangle>(((sextend (ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word))) 32 64::64 word)::64 word) * 0x1)::64 word))::64 word) - 0x1) \<and> RSI \<sigma> = (sextend (ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word))) 32 64::64 word) \<and> RSP \<sigma> = RSP\<^sub>0 \<and> RBP \<sigma> = RBP\<^sub>0 \<and> R15 \<sigma> = R15\<^sub>0 \<and> R14 \<sigma> = R14\<^sub>0 \<and> R13 \<sigma> = R13\<^sub>0 \<and> R12 \<sigma> = R12\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> (\<sigma> \<turnstile> *[RCX\<^sub>0,1]::8 word) = ucast ((\<sigma> \<turnstile> *[RCX\<^sub>0,1]::8 word)) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = 0x17f12 \<and> (\<sigma> \<turnstile> *[(if' (strchr_0x17f0d_retval::64 word) = (ucast ((0x0::64 word))::64 word) then RCX\<^sub>0 else (((strchr_0x17f0d_retval::64 word) + 0x1)::64 word)),1]::8 word) = ucast ((\<sigma> \<turnstile> *[(if' (strchr_0x17f0d_retval::64 word) = (ucast ((0x0::64 word))::64 word) then RCX\<^sub>0 else (((strchr_0x17f0d_retval::64 word) + 0x1)::64 word)),1]::8 word))\<close>
declare P_0x5596_true_12_def[Ps]

definition P_0x5596_true_12_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x5596_true_12_regions_set \<sigma> \<equiv> {
    (0, RCX\<^sub>0, Suc 0),
    (1, RSP\<^sub>0, 8),
    (2, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x40), 8),
    (9, (if' (strchr_0x17f0d_retval::64 word) = (ucast ((0x0::64 word))::64 word) then RCX\<^sub>0 else (((strchr_0x17f0d_retval::64 word) + 0x1)::64 word)), Suc 0)
  }\<close>

definition P_0x5596_true_12_regions :: state_pred where
  \<open>P_0x5596_true_12_regions \<sigma> \<equiv> \<exists>regions. P_0x5596_true_12_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x5583_12 :: state_pred where
  \<open>Q_0x5583_12 \<sigma> \<equiv> RIP \<sigma> = 0x5583 \<and> RBX \<sigma> = RBX\<^sub>0 \<and> RDX \<sigma> = ((((RDI\<^sub>0::64 word) + (\<langle>63,0\<rangle>(((sextend (ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word))) 32 64::64 word)::64 word) * 0x1)::64 word))::64 word) - 0x1) \<and> RSI \<sigma> = (sextend (ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word))) 32 64::64 word) \<and> RSP \<sigma> = RSP\<^sub>0 \<and> RBP \<sigma> = RBP\<^sub>0 \<and> R15 \<sigma> = R15\<^sub>0 \<and> R14 \<sigma> = R14\<^sub>0 \<and> R13 \<sigma> = R13\<^sub>0 \<and> R12 \<sigma> = R12\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> (\<sigma> \<turnstile> *[RCX\<^sub>0,1]::8 word) = ucast ((\<sigma> \<turnstile> *[RCX\<^sub>0,1]::8 word)) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = 0x17f12 \<and> (\<sigma> \<turnstile> *[(if' (strchr_0x17f0d_retval::64 word) = (ucast ((0x0::64 word))::64 word) then RCX\<^sub>0 else (((strchr_0x17f0d_retval::64 word) + 0x1)::64 word)),1]::8 word) = ucast ((\<sigma> \<turnstile> *[(if' (strchr_0x17f0d_retval::64 word) = (ucast ((0x0::64 word))::64 word) then RCX\<^sub>0 else (((strchr_0x17f0d_retval::64 word) + 0x1)::64 word)),1]::8 word))\<close>
declare Q_0x5583_12_def[Qs]

schematic_goal path_combine_0_2_0x5596_0x5580_12[blocks]:
  assumes \<open>(P_0x5596_true_12 && P_0x5596_true_12_regions && !ZF) \<sigma>\<close>
  shows \<open>exec_block 2 0x5580 12 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x5583_12 ?\<sigma> \<and> block_usage P_0x5596_true_12_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x5596_true_12_def P_0x5596_true_12_regions_def post: Q_0x5583_12_def regionset: P_0x5596_true_12_regions_set_def)

definition P_0x5583_true_13 :: state_pred where
  \<open>P_0x5583_true_13 \<sigma> \<equiv> RIP \<sigma> = 0x5583 \<and> RBX \<sigma> = RBX\<^sub>0 \<and> RDX \<sigma> = ((((RDI\<^sub>0::64 word) + (\<langle>63,0\<rangle>(((sextend (ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word))) 32 64::64 word)::64 word) * 0x1)::64 word))::64 word) - 0x1) \<and> RSI \<sigma> = (sextend (ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word))) 32 64::64 word) \<and> RSP \<sigma> = RSP\<^sub>0 \<and> RBP \<sigma> = RBP\<^sub>0 \<and> R15 \<sigma> = R15\<^sub>0 \<and> R14 \<sigma> = R14\<^sub>0 \<and> R13 \<sigma> = R13\<^sub>0 \<and> R12 \<sigma> = R12\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> (\<sigma> \<turnstile> *[RCX\<^sub>0,1]::8 word) = ucast ((\<sigma> \<turnstile> *[RCX\<^sub>0,1]::8 word)) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = 0x17f12 \<and> (\<sigma> \<turnstile> *[(if' (strchr_0x17f0d_retval::64 word) = (ucast ((0x0::64 word))::64 word) then RCX\<^sub>0 else (((strchr_0x17f0d_retval::64 word) + 0x1)::64 word)),1]::8 word) = ucast ((\<sigma> \<turnstile> *[(if' (strchr_0x17f0d_retval::64 word) = (ucast ((0x0::64 word))::64 word) then RCX\<^sub>0 else (((strchr_0x17f0d_retval::64 word) + 0x1)::64 word)),1]::8 word))\<close>
declare P_0x5583_true_13_def[Ps]

definition P_0x5583_true_13_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x5583_true_13_regions_set \<sigma> \<equiv> {
    (0, RCX\<^sub>0, Suc 0),
    (1, RSP\<^sub>0, 8),
    (2, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x40), 8),
    (9, (if' (strchr_0x17f0d_retval::64 word) = (ucast ((0x0::64 word))::64 word) then RCX\<^sub>0 else (((strchr_0x17f0d_retval::64 word) + 0x1)::64 word)), Suc 0)
  }\<close>

definition P_0x5583_true_13_regions :: state_pred where
  \<open>P_0x5583_true_13_regions \<sigma> \<equiv> \<exists>regions. P_0x5583_true_13_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x5598_13 :: state_pred where
  \<open>Q_0x5598_13 \<sigma> \<equiv> RIP \<sigma> = 0x5598 \<and> RBX \<sigma> = RBX\<^sub>0 \<and> RDX \<sigma> = ((((RDI\<^sub>0::64 word) + (\<langle>63,0\<rangle>(((sextend (ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word))) 32 64::64 word)::64 word) * 0x1)::64 word))::64 word) - 0x1) \<and> RSI \<sigma> = (sextend (ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word))) 32 64::64 word) \<and> RSP \<sigma> = RSP\<^sub>0 \<and> RBP \<sigma> = RBP\<^sub>0 \<and> R15 \<sigma> = R15\<^sub>0 \<and> R14 \<sigma> = R14\<^sub>0 \<and> R13 \<sigma> = R13\<^sub>0 \<and> R12 \<sigma> = R12\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> (\<sigma> \<turnstile> *[RCX\<^sub>0,1]::8 word) = ucast ((\<sigma> \<turnstile> *[RCX\<^sub>0,1]::8 word)) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = 0x17f12 \<and> (\<sigma> \<turnstile> *[(if' (strchr_0x17f0d_retval::64 word) = (ucast ((0x0::64 word))::64 word) then RCX\<^sub>0 else (((strchr_0x17f0d_retval::64 word) + 0x1)::64 word)),1]::8 word) = ucast ((\<sigma> \<turnstile> *[(if' (strchr_0x17f0d_retval::64 word) = (ucast ((0x0::64 word))::64 word) then RCX\<^sub>0 else (((strchr_0x17f0d_retval::64 word) + 0x1)::64 word)),1]::8 word))\<close>
declare Q_0x5598_13_def[Qs]

schematic_goal path_combine_0_1_0x5583_0x5583_13[blocks]:
  assumes \<open>(P_0x5583_true_13 && P_0x5583_true_13_regions && ZF) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x5583 13 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x5598_13 ?\<sigma> \<and> block_usage P_0x5583_true_13_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x5583_true_13_def P_0x5583_true_13_regions_def post: Q_0x5598_13_def regionset: P_0x5583_true_13_regions_set_def)

definition P_0x5583_false_14 :: state_pred where
  \<open>P_0x5583_false_14 \<sigma> \<equiv> RIP \<sigma> = 0x5583 \<and> RBX \<sigma> = RBX\<^sub>0 \<and> RDX \<sigma> = ((((RDI\<^sub>0::64 word) + (\<langle>63,0\<rangle>(((sextend (ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word))) 32 64::64 word)::64 word) * 0x1)::64 word))::64 word) - 0x1) \<and> RSI \<sigma> = (sextend (ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word))) 32 64::64 word) \<and> RSP \<sigma> = RSP\<^sub>0 \<and> RBP \<sigma> = RBP\<^sub>0 \<and> R15 \<sigma> = R15\<^sub>0 \<and> R14 \<sigma> = R14\<^sub>0 \<and> R13 \<sigma> = R13\<^sub>0 \<and> R12 \<sigma> = R12\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> (\<sigma> \<turnstile> *[RCX\<^sub>0,1]::8 word) = ucast ((\<sigma> \<turnstile> *[RCX\<^sub>0,1]::8 word)) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = 0x17f12 \<and> (\<sigma> \<turnstile> *[(if' (strchr_0x17f0d_retval::64 word) = (ucast ((0x0::64 word))::64 word) then RCX\<^sub>0 else (((strchr_0x17f0d_retval::64 word) + 0x1)::64 word)),1]::8 word) = ucast ((\<sigma> \<turnstile> *[(if' (strchr_0x17f0d_retval::64 word) = (ucast ((0x0::64 word))::64 word) then RCX\<^sub>0 else (((strchr_0x17f0d_retval::64 word) + 0x1)::64 word)),1]::8 word))\<close>
declare P_0x5583_false_14_def[Ps]

definition P_0x5583_false_14_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x5583_false_14_regions_set \<sigma> \<equiv> {
    (0, RCX\<^sub>0, Suc 0),
    (1, RSP\<^sub>0, 8),
    (2, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x40), 8),
    (9, (if' (strchr_0x17f0d_retval::64 word) = (ucast ((0x0::64 word))::64 word) then RCX\<^sub>0 else (((strchr_0x17f0d_retval::64 word) + 0x1)::64 word)), Suc 0)
  }\<close>

definition P_0x5583_false_14_regions :: state_pred where
  \<open>P_0x5583_false_14_regions \<sigma> \<equiv> \<exists>regions. P_0x5583_false_14_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x5585_14 :: state_pred where
  \<open>Q_0x5585_14 \<sigma> \<equiv> RIP \<sigma> = 0x5585 \<and> RBX \<sigma> = RBX\<^sub>0 \<and> RDX \<sigma> = ((((RDI\<^sub>0::64 word) + (\<langle>63,0\<rangle>(((sextend (ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word))) 32 64::64 word)::64 word) * 0x1)::64 word))::64 word) - 0x1) \<and> RSI \<sigma> = (sextend (ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word))) 32 64::64 word) \<and> RSP \<sigma> = RSP\<^sub>0 \<and> RBP \<sigma> = RBP\<^sub>0 \<and> R15 \<sigma> = R15\<^sub>0 \<and> R14 \<sigma> = R14\<^sub>0 \<and> R13 \<sigma> = R13\<^sub>0 \<and> R12 \<sigma> = R12\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> (\<sigma> \<turnstile> *[RCX\<^sub>0,1]::8 word) = ucast ((\<sigma> \<turnstile> *[RCX\<^sub>0,1]::8 word)) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = 0x17f12 \<and> (\<sigma> \<turnstile> *[(if' (strchr_0x17f0d_retval::64 word) = (ucast ((0x0::64 word))::64 word) then RCX\<^sub>0 else (((strchr_0x17f0d_retval::64 word) + 0x1)::64 word)),1]::8 word) = ucast ((\<sigma> \<turnstile> *[(if' (strchr_0x17f0d_retval::64 word) = (ucast ((0x0::64 word))::64 word) then RCX\<^sub>0 else (((strchr_0x17f0d_retval::64 word) + 0x1)::64 word)),1]::8 word))\<close>
declare Q_0x5585_14_def[Qs]

schematic_goal path_combine_0_1_0x5583_0x5583_14[blocks]:
  assumes \<open>(P_0x5583_false_14 && P_0x5583_false_14_regions && ! ZF) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x5583 14 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x5585_14 ?\<sigma> \<and> block_usage P_0x5583_false_14_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x5583_false_14_def P_0x5583_false_14_regions_def post: Q_0x5585_14_def regionset: P_0x5583_false_14_regions_set_def)

definition P_0x5596_false_15 :: state_pred where
  \<open>P_0x5596_false_15 \<sigma> \<equiv> RIP \<sigma> = 0x5596 \<and> RBX \<sigma> = RBX\<^sub>0 \<and> RDX \<sigma> = ((((RDI\<^sub>0::64 word) + (\<langle>63,0\<rangle>(((sextend (ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word))) 32 64::64 word)::64 word) * 0x1)::64 word))::64 word) - 0x1) \<and> RSI \<sigma> = (sextend (ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word))) 32 64::64 word) \<and> RSP \<sigma> = RSP\<^sub>0 \<and> RBP \<sigma> = RBP\<^sub>0 \<and> R15 \<sigma> = R15\<^sub>0 \<and> R14 \<sigma> = R14\<^sub>0 \<and> R13 \<sigma> = R13\<^sub>0 \<and> R12 \<sigma> = R12\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> (\<sigma> \<turnstile> *[RCX\<^sub>0,1]::8 word) = ucast ((\<sigma> \<turnstile> *[RCX\<^sub>0,1]::8 word)) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = 0x17f12 \<and> (\<sigma> \<turnstile> *[(if' (strchr_0x17f0d_retval::64 word) = (ucast ((0x0::64 word))::64 word) then RCX\<^sub>0 else (((strchr_0x17f0d_retval::64 word) + 0x1)::64 word)),1]::8 word) = ucast ((\<sigma> \<turnstile> *[(if' (strchr_0x17f0d_retval::64 word) = (ucast ((0x0::64 word))::64 word) then RCX\<^sub>0 else (((strchr_0x17f0d_retval::64 word) + 0x1)::64 word)),1]::8 word))\<close>
declare P_0x5596_false_15_def[Ps]

definition P_0x5596_false_15_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x5596_false_15_regions_set \<sigma> \<equiv> {
    (0, RCX\<^sub>0, Suc 0),
    (1, RSP\<^sub>0, 8),
    (2, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x40), 8),
    (9, (if' (strchr_0x17f0d_retval::64 word) = (ucast ((0x0::64 word))::64 word) then RCX\<^sub>0 else (((strchr_0x17f0d_retval::64 word) + 0x1)::64 word)), Suc 0)
  }\<close>

definition P_0x5596_false_15_regions :: state_pred where
  \<open>P_0x5596_false_15_regions \<sigma> \<equiv> \<exists>regions. P_0x5596_false_15_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x5598_15 :: state_pred where
  \<open>Q_0x5598_15 \<sigma> \<equiv> RIP \<sigma> = 0x5598 \<and> RBX \<sigma> = RBX\<^sub>0 \<and> RDX \<sigma> = ((((RDI\<^sub>0::64 word) + (\<langle>63,0\<rangle>(((sextend (ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word))) 32 64::64 word)::64 word) * 0x1)::64 word))::64 word) - 0x1) \<and> RSI \<sigma> = (sextend (ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word))) 32 64::64 word) \<and> RSP \<sigma> = RSP\<^sub>0 \<and> RBP \<sigma> = RBP\<^sub>0 \<and> R15 \<sigma> = R15\<^sub>0 \<and> R14 \<sigma> = R14\<^sub>0 \<and> R13 \<sigma> = R13\<^sub>0 \<and> R12 \<sigma> = R12\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> (\<sigma> \<turnstile> *[RCX\<^sub>0,1]::8 word) = ucast ((\<sigma> \<turnstile> *[RCX\<^sub>0,1]::8 word)) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = 0x17f12 \<and> (\<sigma> \<turnstile> *[(if' (strchr_0x17f0d_retval::64 word) = (ucast ((0x0::64 word))::64 word) then RCX\<^sub>0 else (((strchr_0x17f0d_retval::64 word) + 0x1)::64 word)),1]::8 word) = ucast ((\<sigma> \<turnstile> *[(if' (strchr_0x17f0d_retval::64 word) = (ucast ((0x0::64 word))::64 word) then RCX\<^sub>0 else (((strchr_0x17f0d_retval::64 word) + 0x1)::64 word)),1]::8 word))\<close>
declare Q_0x5598_15_def[Qs]

schematic_goal path_combine_0_1_0x5596_0x5596_15[blocks]:
  assumes \<open>(P_0x5596_false_15 && P_0x5596_false_15_regions && ! !ZF) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x5596 15 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x5598_15 ?\<sigma> \<and> block_usage P_0x5596_false_15_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x5596_false_15_def P_0x5596_false_15_regions_def post: Q_0x5598_15_def regionset: P_0x5596_false_15_regions_set_def)

definition P_0x5578_false_16 :: state_pred where
  \<open>P_0x5578_false_16 \<sigma> \<equiv> RIP \<sigma> = 0x5578 \<and> RAX \<sigma> = ucast ((\<sigma> \<turnstile> *[RCX\<^sub>0,1]::8 word)) \<and> RBX \<sigma> = RBX\<^sub>0 \<and> RCX \<sigma> = ((RCX\<^sub>0::64 word) + 0x1) \<and> RDX \<sigma> = ((((RDI\<^sub>0::64 word) + (\<langle>63,0\<rangle>(((sextend (ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word))) 32 64::64 word)::64 word) * 0x1)::64 word))::64 word) - 0x1) \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = (sextend (ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word))) 32 64::64 word) \<and> RSP \<sigma> = RSP\<^sub>0 \<and> RBP \<sigma> = RBP\<^sub>0 \<and> R15 \<sigma> = R15\<^sub>0 \<and> R14 \<sigma> = R14\<^sub>0 \<and> R13 \<sigma> = R13\<^sub>0 \<and> R12 \<sigma> = R12\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> (\<sigma> \<turnstile> *[RCX\<^sub>0,1]::8 word) = ucast ((\<sigma> \<turnstile> *[RCX\<^sub>0,1]::8 word)) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = 0x17f12 \<and> (\<sigma> \<turnstile> *[(if' (strchr_0x17f0d_retval::64 word) = (ucast ((0x0::64 word))::64 word) then RCX\<^sub>0 else (((strchr_0x17f0d_retval::64 word) + 0x1)::64 word)),1]::8 word) = ucast ((\<sigma> \<turnstile> *[(if' (strchr_0x17f0d_retval::64 word) = (ucast ((0x0::64 word))::64 word) then RCX\<^sub>0 else (((strchr_0x17f0d_retval::64 word) + 0x1)::64 word)),1]::8 word))\<close>
declare P_0x5578_false_16_def[Ps]

definition P_0x5578_false_16_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x5578_false_16_regions_set \<sigma> \<equiv> {
    (0, RCX\<^sub>0, Suc 0),
    (1, RSP\<^sub>0, 8),
    (2, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x40), 8),
    (9, (if' (strchr_0x17f0d_retval::64 word) = (ucast ((0x0::64 word))::64 word) then RCX\<^sub>0 else (((strchr_0x17f0d_retval::64 word) + 0x1)::64 word)), Suc 0)
  }\<close>

definition P_0x5578_false_16_regions :: state_pred where
  \<open>P_0x5578_false_16_regions \<sigma> \<equiv> \<exists>regions. P_0x5578_false_16_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x5598_16 :: state_pred where
  \<open>Q_0x5598_16 \<sigma> \<equiv> RIP \<sigma> = 0x5598 \<and> RBX \<sigma> = RBX\<^sub>0 \<and> RSI \<sigma> = (sextend (ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word))) 32 64::64 word) \<and> RSP \<sigma> = RSP\<^sub>0 \<and> RBP \<sigma> = RBP\<^sub>0 \<and> R15 \<sigma> = R15\<^sub>0 \<and> R14 \<sigma> = R14\<^sub>0 \<and> R13 \<sigma> = R13\<^sub>0 \<and> R12 \<sigma> = R12\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> (\<sigma> \<turnstile> *[RCX\<^sub>0,1]::8 word) = ucast ((\<sigma> \<turnstile> *[RCX\<^sub>0,1]::8 word)) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = 0x17f12 \<and> (\<sigma> \<turnstile> *[(if' (strchr_0x17f0d_retval::64 word) = (ucast ((0x0::64 word))::64 word) then RCX\<^sub>0 else (((strchr_0x17f0d_retval::64 word) + 0x1)::64 word)),1]::8 word) = ucast ((\<sigma> \<turnstile> *[(if' (strchr_0x17f0d_retval::64 word) = (ucast ((0x0::64 word))::64 word) then RCX\<^sub>0 else (((strchr_0x17f0d_retval::64 word) + 0x1)::64 word)),1]::8 word))\<close>
declare Q_0x5598_16_def[Qs]

schematic_goal path_combine_0_2_0x5578_0x557a_16[blocks]:
  assumes \<open>(P_0x5578_false_16 && P_0x5578_false_16_regions && ! CF) \<sigma>\<close>
  shows \<open>exec_block 2 0x557a 16 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x5598_16 ?\<sigma> \<and> block_usage P_0x5578_false_16_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x5578_false_16_def P_0x5578_false_16_regions_def post: Q_0x5598_16_def regionset: P_0x5578_false_16_regions_set_def)

definition P_0x5598_17 :: state_pred where
  \<open>P_0x5598_17 \<sigma> \<equiv> RIP \<sigma> = 0x5598 \<and> RBX \<sigma> = RBX\<^sub>0 \<and> RSI \<sigma> = (sextend (ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word))) 32 64::64 word) \<and> RSP \<sigma> = RSP\<^sub>0 \<and> RBP \<sigma> = RBP\<^sub>0 \<and> R15 \<sigma> = R15\<^sub>0 \<and> R14 \<sigma> = R14\<^sub>0 \<and> R13 \<sigma> = R13\<^sub>0 \<and> R12 \<sigma> = R12\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> (\<sigma> \<turnstile> *[RCX\<^sub>0,1]::8 word) = ucast ((\<sigma> \<turnstile> *[RCX\<^sub>0,1]::8 word)) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = 0x17f12 \<and> (\<sigma> \<turnstile> *[(if' (strchr_0x17f0d_retval::64 word) = (ucast ((0x0::64 word))::64 word) then RCX\<^sub>0 else (((strchr_0x17f0d_retval::64 word) + 0x1)::64 word)),1]::8 word) = ucast ((\<sigma> \<turnstile> *[(if' (strchr_0x17f0d_retval::64 word) = (ucast ((0x0::64 word))::64 word) then RCX\<^sub>0 else (((strchr_0x17f0d_retval::64 word) + 0x1)::64 word)),1]::8 word))\<close>
declare P_0x5598_17_def[Ps]

definition P_0x5598_17_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x5598_17_regions_set \<sigma> \<equiv> {
    (0, RDI \<sigma>, Suc 0),
    (1, RCX\<^sub>0, Suc 0),
    (2, RSP\<^sub>0, 8),
    (3, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x40), 8),
    (10, (if' (strchr_0x17f0d_retval::64 word) = (ucast ((0x0::64 word))::64 word) then RCX\<^sub>0 else (((strchr_0x17f0d_retval::64 word) + 0x1)::64 word)), Suc 0)
  }\<close>

definition P_0x5598_17_regions :: state_pred where
  \<open>P_0x5598_17_regions \<sigma> \<equiv> \<exists>regions. P_0x5598_17_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x559b_17 :: state_pred where
  \<open>Q_0x559b_17 \<sigma> \<equiv> RIP \<sigma> = 0x559b \<and> RBX \<sigma> = RBX\<^sub>0 \<and> RSI \<sigma> = (sextend (ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word))) 32 64::64 word) \<and> RSP \<sigma> = RSP\<^sub>0 \<and> RBP \<sigma> = RBP\<^sub>0 \<and> R15 \<sigma> = R15\<^sub>0 \<and> R14 \<sigma> = R14\<^sub>0 \<and> R13 \<sigma> = R13\<^sub>0 \<and> R12 \<sigma> = R12\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = 0x17f12 \<and> (\<sigma> \<turnstile> *[(if' (strchr_0x17f0d_retval::64 word) = (ucast ((0x0::64 word))::64 word) then RCX\<^sub>0 else (((strchr_0x17f0d_retval::64 word) + 0x1)::64 word)),1]::8 word) = ucast ((\<sigma> \<turnstile> *[(if' (strchr_0x17f0d_retval::64 word) = (ucast ((0x0::64 word))::64 word) then RCX\<^sub>0 else (((strchr_0x17f0d_retval::64 word) + 0x1)::64 word)),1]::8 word))\<close>
declare Q_0x559b_17_def[Qs]

schematic_goal path_combine_0_1_0x5598_0x5598_17[blocks]:
  assumes \<open>(P_0x5598_17 && P_0x5598_17_regions) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x5598 17 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x559b_17 ?\<sigma> \<and> block_usage P_0x5598_17_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x5598_17_def P_0x5598_17_regions_def post: Q_0x559b_17_def regionset: P_0x5598_17_regions_set_def)

definition P_0x559b_18 :: state_pred where
  \<open>P_0x559b_18 \<sigma> \<equiv> RIP \<sigma> = 0x559b \<and> RBX \<sigma> = RBX\<^sub>0 \<and> RSI \<sigma> = (sextend (ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word))) 32 64::64 word) \<and> RSP \<sigma> = RSP\<^sub>0 \<and> RBP \<sigma> = RBP\<^sub>0 \<and> R15 \<sigma> = R15\<^sub>0 \<and> R14 \<sigma> = R14\<^sub>0 \<and> R13 \<sigma> = R13\<^sub>0 \<and> R12 \<sigma> = R12\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = 0x17f12 \<and> (\<sigma> \<turnstile> *[(if' (strchr_0x17f0d_retval::64 word) = (ucast ((0x0::64 word))::64 word) then RCX\<^sub>0 else (((strchr_0x17f0d_retval::64 word) + 0x1)::64 word)),1]::8 word) = ucast ((\<sigma> \<turnstile> *[(if' (strchr_0x17f0d_retval::64 word) = (ucast ((0x0::64 word))::64 word) then RCX\<^sub>0 else (((strchr_0x17f0d_retval::64 word) + 0x1)::64 word)),1]::8 word))\<close>
declare P_0x559b_18_def[Ps]

definition P_0x559b_18_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x559b_18_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (2, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x40), 8),
    (8, (if' (strchr_0x17f0d_retval::64 word) = (ucast ((0x0::64 word))::64 word) then RCX\<^sub>0 else (((strchr_0x17f0d_retval::64 word) + 0x1)::64 word)), Suc 0)
  }\<close>

definition P_0x559b_18_regions :: state_pred where
  \<open>P_0x559b_18_regions \<sigma> \<equiv> \<exists>regions. P_0x559b_18_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_ret_address_18 :: state_pred where
  \<open>Q_ret_address_18 \<sigma> \<equiv> RIP \<sigma> = ret_address \<and> RBX \<sigma> = RBX\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) + 0x8) \<and> RBP \<sigma> = RBP\<^sub>0 \<and> R15 \<sigma> = R15\<^sub>0 \<and> R14 \<sigma> = R14\<^sub>0 \<and> R13 \<sigma> = R13\<^sub>0 \<and> R12 \<sigma> = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address\<close>
declare Q_ret_address_18_def[Qs]

schematic_goal path_combine_0_1_0x559b_0x559b_18[blocks]:
  assumes \<open>(P_0x559b_18 && P_0x559b_18_regions) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x559b 18 \<sigma> \<triangleq> ?\<sigma> \<and> Q_ret_address_18 ?\<sigma> \<and> block_usage P_0x559b_18_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x559b_18_def P_0x559b_18_regions_def post: Q_ret_address_18_def regionset: P_0x559b_18_regions_set_def)

definition P_0x17f20_false_19 :: state_pred where
  \<open>P_0x17f20_false_19 \<sigma> \<equiv> RIP \<sigma> = 0x17f20 \<and> RAX \<sigma> = strchr_0x17f0d_retval \<and> RBX \<sigma> = RDX\<^sub>0 \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = (if' (strchr_0x17f0d_retval::64 word) = (ucast ((0x0::64 word))::64 word) then RCX\<^sub>0 else (((strchr_0x17f0d_retval::64 word) + 0x1)::64 word)) \<and> RDI \<sigma> = RCX\<^sub>0 \<and> RSI \<sigma> = 0x3a \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x38) \<and> RBP \<sigma> = RCX\<^sub>0 \<and> R15 \<sigma> = R15\<^sub>0 \<and> R14 \<sigma> = (sextend (ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word))) 32 64::64 word) \<and> R13 \<sigma> = (sextend (ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word))) 32 64::64 word) \<and> R12 \<sigma> = RDI\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = 0x17f12 \<and> (\<sigma> \<turnstile> *[(if' (strchr_0x17f0d_retval::64 word) = (ucast ((0x0::64 word))::64 word) then RCX\<^sub>0 else (((strchr_0x17f0d_retval::64 word) + 0x1)::64 word)),1]::8 word) = ucast ((\<sigma> \<turnstile> *[(if' (strchr_0x17f0d_retval::64 word) = (ucast ((0x0::64 word))::64 word) then RCX\<^sub>0 else (((strchr_0x17f0d_retval::64 word) + 0x1)::64 word)),1]::8 word))\<close>
declare P_0x17f20_false_19_def[Ps]

definition P_0x17f20_false_19_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x17f20_false_19_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (2, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x40), 8),
    (8, (if' (strchr_0x17f0d_retval::64 word) = (ucast ((0x0::64 word))::64 word) then RCX\<^sub>0 else (((strchr_0x17f0d_retval::64 word) + 0x1)::64 word)), Suc 0)
  }\<close>

definition P_0x17f20_false_19_regions :: state_pred where
  \<open>P_0x17f20_false_19_regions \<sigma> \<equiv> \<exists>regions. P_0x17f20_false_19_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x17f2e_19 :: state_pred where
  \<open>Q_0x17f2e_19 \<sigma> \<equiv> RIP \<sigma> = 0x17f2e \<and> RAX \<sigma> = strchr_0x17f0d_retval \<and> RBX \<sigma> = RDX\<^sub>0 \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = (if' (strchr_0x17f0d_retval::64 word) = (ucast ((0x0::64 word))::64 word) then RCX\<^sub>0 else (((strchr_0x17f0d_retval::64 word) + 0x1)::64 word)) \<and> RDI \<sigma> = RDX\<^sub>0 \<and> RSI \<sigma> = 0x3a \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x38) \<and> RBP \<sigma> = RCX\<^sub>0 \<and> R15 \<sigma> = R15\<^sub>0 \<and> R14 \<sigma> = (sextend (ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word))) 32 64::64 word) \<and> R13 \<sigma> = (sextend (ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word))) 32 64::64 word) \<and> R12 \<sigma> = RDI\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = 0x17f12 \<and> (\<sigma> \<turnstile> *[(if' (strchr_0x17f0d_retval::64 word) = (ucast ((0x0::64 word))::64 word) then RCX\<^sub>0 else (((strchr_0x17f0d_retval::64 word) + 0x1)::64 word)),1]::8 word) = ucast ((\<sigma> \<turnstile> *[(if' (strchr_0x17f0d_retval::64 word) = (ucast ((0x0::64 word))::64 word) then RCX\<^sub>0 else (((strchr_0x17f0d_retval::64 word) + 0x1)::64 word)),1]::8 word))\<close>
declare Q_0x17f2e_19_def[Qs]

schematic_goal path_combine_0_3_0x17f20_0x17f2b_19[blocks]:
  assumes \<open>(P_0x17f20_false_19 && P_0x17f20_false_19_regions && ! ZF) \<sigma>\<close>
  shows \<open>exec_block 3 0x17f2b 19 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x17f2e_19 ?\<sigma> \<and> block_usage P_0x17f20_false_19_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x17f20_false_19_def P_0x17f20_false_19_regions_def post: Q_0x17f2e_19_def regionset: P_0x17f20_false_19_regions_set_def)

definition P_0x17f2e_20 :: state_pred where
  \<open>P_0x17f2e_20 \<sigma> \<equiv> RIP \<sigma> = 0x17f2e \<and> RAX \<sigma> = strchr_0x17f0d_retval \<and> RBX \<sigma> = RDX\<^sub>0 \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = (if' (strchr_0x17f0d_retval::64 word) = (ucast ((0x0::64 word))::64 word) then RCX\<^sub>0 else (((strchr_0x17f0d_retval::64 word) + 0x1)::64 word)) \<and> RDI \<sigma> = RDX\<^sub>0 \<and> RSI \<sigma> = 0x3a \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x38) \<and> RBP \<sigma> = RCX\<^sub>0 \<and> R15 \<sigma> = R15\<^sub>0 \<and> R14 \<sigma> = (sextend (ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word))) 32 64::64 word) \<and> R13 \<sigma> = (sextend (ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word))) 32 64::64 word) \<and> R12 \<sigma> = RDI\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = 0x17f12 \<and> (\<sigma> \<turnstile> *[(if' (strchr_0x17f0d_retval::64 word) = (ucast ((0x0::64 word))::64 word) then RCX\<^sub>0 else (((strchr_0x17f0d_retval::64 word) + 0x1)::64 word)),1]::8 word) = ucast ((\<sigma> \<turnstile> *[(if' (strchr_0x17f0d_retval::64 word) = (ucast ((0x0::64 word))::64 word) then RCX\<^sub>0 else (((strchr_0x17f0d_retval::64 word) + 0x1)::64 word)),1]::8 word))\<close>
declare P_0x17f2e_20_def[Ps]

definition P_0x17f2e_20_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x17f2e_20_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (2, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x40), 8),
    (8, (if' (strchr_0x17f0d_retval::64 word) = (ucast ((0x0::64 word))::64 word) then RCX\<^sub>0 else (((strchr_0x17f0d_retval::64 word) + 0x1)::64 word)), Suc 0)
  }\<close>

definition P_0x17f2e_20_regions :: state_pred where
  \<open>P_0x17f2e_20_regions \<sigma> \<equiv> \<exists>regions. P_0x17f2e_20_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_strchr_addr_0x17f2e_20 :: state_pred where
  \<open>Q_strchr_addr_0x17f2e_20 \<sigma> \<equiv> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x40) \<and> RIP \<sigma> = strchr_addr \<and> RAX \<sigma> = strchr_0x17f0d_retval \<and> RBX \<sigma> = RDX\<^sub>0 \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = (if' (strchr_0x17f0d_retval::64 word) = (ucast ((0x0::64 word))::64 word) then RCX\<^sub>0 else (((strchr_0x17f0d_retval::64 word) + 0x1)::64 word)) \<and> RDI \<sigma> = RDX\<^sub>0 \<and> RSI \<sigma> = 0x3a \<and> RBP \<sigma> = RCX\<^sub>0 \<and> R15 \<sigma> = R15\<^sub>0 \<and> R14 \<sigma> = (sextend (ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word))) 32 64::64 word) \<and> R13 \<sigma> = (sextend (ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word))) 32 64::64 word) \<and> R12 \<sigma> = RDI\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = 0x17f33 \<and> (\<sigma> \<turnstile> *[(if' (strchr_0x17f0d_retval::64 word) = (ucast ((0x0::64 word))::64 word) then RCX\<^sub>0 else (((strchr_0x17f0d_retval::64 word) + 0x1)::64 word)),1]::8 word) = ucast ((\<sigma> \<turnstile> *[(if' (strchr_0x17f0d_retval::64 word) = (ucast ((0x0::64 word))::64 word) then RCX\<^sub>0 else (((strchr_0x17f0d_retval::64 word) + 0x1)::64 word)),1]::8 word))\<close>
declare Q_strchr_addr_0x17f2e_20_def[Qs]

schematic_goal path_combine_0_1_0x17f2e_0x17f2e_20[blocks]:
  assumes \<open>(P_0x17f2e_20 && P_0x17f2e_20_regions) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x17f2e 20 \<sigma> \<triangleq> ?\<sigma> \<and> Q_strchr_addr_0x17f2e_20 ?\<sigma> \<and> block_usage P_0x17f2e_20_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x17f2e_20_def P_0x17f2e_20_regions_def post: Q_strchr_addr_0x17f2e_20_def regionset: P_0x17f2e_20_regions_set_def)

definition P_0x17f33_21 :: state_pred where
  \<open>P_0x17f33_21 \<sigma> \<equiv> RIP \<sigma> = 0x17f33 \<and> RAX \<sigma> = strchr_0x17f2e_retval \<and> RBX \<sigma> = RDX\<^sub>0 \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = (if' (strchr_0x17f0d_retval::64 word) = (ucast ((0x0::64 word))::64 word) then RCX\<^sub>0 else (((strchr_0x17f0d_retval::64 word) + 0x1)::64 word)) \<and> RDI \<sigma> = RDX\<^sub>0 \<and> RSI \<sigma> = 0x3a \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x38) \<and> RBP \<sigma> = RCX\<^sub>0 \<and> R15 \<sigma> = R15\<^sub>0 \<and> R14 \<sigma> = (sextend (ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word))) 32 64::64 word) \<and> R13 \<sigma> = (sextend (ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word))) 32 64::64 word) \<and> R12 \<sigma> = RDI\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = 0x17f33 \<and> (\<sigma> \<turnstile> *[(if' (strchr_0x17f0d_retval::64 word) = (ucast ((0x0::64 word))::64 word) then RCX\<^sub>0 else (((strchr_0x17f0d_retval::64 word) + 0x1)::64 word)),1]::8 word) = ucast ((\<sigma> \<turnstile> *[(if' (strchr_0x17f0d_retval::64 word) = (ucast ((0x0::64 word))::64 word) then RCX\<^sub>0 else (((strchr_0x17f0d_retval::64 word) + 0x1)::64 word)),1]::8 word))\<close>
declare P_0x17f33_21_def[Ps]

definition P_0x17f33_21_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x17f33_21_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (2, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x40), 8),
    (8, (if' (strchr_0x17f0d_retval::64 word) = (ucast ((0x0::64 word))::64 word) then RCX\<^sub>0 else (((strchr_0x17f0d_retval::64 word) + 0x1)::64 word)), Suc 0)
  }\<close>

definition P_0x17f33_21_regions :: state_pred where
  \<open>P_0x17f33_21_regions \<sigma> \<equiv> \<exists>regions. P_0x17f33_21_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x17f3e_21 :: state_pred where
  \<open>Q_0x17f3e_21 \<sigma> \<equiv> RIP \<sigma> = 0x17f3e \<and> RAX \<sigma> = strchr_0x17f2e_retval \<and> RBX \<sigma> = RDX\<^sub>0 \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = (if' (strchr_0x17f0d_retval::64 word) = (ucast ((0x0::64 word))::64 word) then RCX\<^sub>0 else (((strchr_0x17f0d_retval::64 word) + 0x1)::64 word)) \<and> RDI \<sigma> = RDX\<^sub>0 \<and> RSI \<sigma> = 0x2f \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x38) \<and> RBP \<sigma> = RCX\<^sub>0 \<and> R15 \<sigma> = strchr_0x17f2e_retval \<and> R14 \<sigma> = (sextend (ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word))) 32 64::64 word) \<and> R13 \<sigma> = (sextend (ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word))) 32 64::64 word) \<and> R12 \<sigma> = RDI\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = 0x17f33 \<and> (\<sigma> \<turnstile> *[(if' (strchr_0x17f0d_retval::64 word) = (ucast ((0x0::64 word))::64 word) then RCX\<^sub>0 else (((strchr_0x17f0d_retval::64 word) + 0x1)::64 word)),1]::8 word) = ucast ((\<sigma> \<turnstile> *[(if' (strchr_0x17f0d_retval::64 word) = (ucast ((0x0::64 word))::64 word) then RCX\<^sub>0 else (((strchr_0x17f0d_retval::64 word) + 0x1)::64 word)),1]::8 word))\<close>
declare Q_0x17f3e_21_def[Qs]

schematic_goal path_combine_0_3_0x17f33_0x17f3b_21[blocks]:
  assumes \<open>(P_0x17f33_21 && P_0x17f33_21_regions) \<sigma>\<close>
  shows \<open>exec_block 3 0x17f3b 21 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x17f3e_21 ?\<sigma> \<and> block_usage P_0x17f33_21_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x17f33_21_def P_0x17f33_21_regions_def post: Q_0x17f3e_21_def regionset: P_0x17f33_21_regions_set_def)

definition P_0x17f3e_22 :: state_pred where
  \<open>P_0x17f3e_22 \<sigma> \<equiv> RIP \<sigma> = 0x17f3e \<and> RAX \<sigma> = strchr_0x17f2e_retval \<and> RBX \<sigma> = RDX\<^sub>0 \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = (if' (strchr_0x17f0d_retval::64 word) = (ucast ((0x0::64 word))::64 word) then RCX\<^sub>0 else (((strchr_0x17f0d_retval::64 word) + 0x1)::64 word)) \<and> RDI \<sigma> = RDX\<^sub>0 \<and> RSI \<sigma> = 0x2f \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x38) \<and> RBP \<sigma> = RCX\<^sub>0 \<and> R15 \<sigma> = strchr_0x17f2e_retval \<and> R14 \<sigma> = (sextend (ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word))) 32 64::64 word) \<and> R13 \<sigma> = (sextend (ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word))) 32 64::64 word) \<and> R12 \<sigma> = RDI\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = 0x17f33 \<and> (\<sigma> \<turnstile> *[(if' (strchr_0x17f0d_retval::64 word) = (ucast ((0x0::64 word))::64 word) then RCX\<^sub>0 else (((strchr_0x17f0d_retval::64 word) + 0x1)::64 word)),1]::8 word) = ucast ((\<sigma> \<turnstile> *[(if' (strchr_0x17f0d_retval::64 word) = (ucast ((0x0::64 word))::64 word) then RCX\<^sub>0 else (((strchr_0x17f0d_retval::64 word) + 0x1)::64 word)),1]::8 word))\<close>
declare P_0x17f3e_22_def[Ps]

definition P_0x17f3e_22_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x17f3e_22_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (2, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x40), 8),
    (8, (if' (strchr_0x17f0d_retval::64 word) = (ucast ((0x0::64 word))::64 word) then RCX\<^sub>0 else (((strchr_0x17f0d_retval::64 word) + 0x1)::64 word)), Suc 0)
  }\<close>

definition P_0x17f3e_22_regions :: state_pred where
  \<open>P_0x17f3e_22_regions \<sigma> \<equiv> \<exists>regions. P_0x17f3e_22_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_strrchr_addr_0x17f3e_22 :: state_pred where
  \<open>Q_strrchr_addr_0x17f3e_22 \<sigma> \<equiv> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x40) \<and> RIP \<sigma> = strrchr_addr \<and> RAX \<sigma> = strchr_0x17f2e_retval \<and> RBX \<sigma> = RDX\<^sub>0 \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = (if' (strchr_0x17f0d_retval::64 word) = (ucast ((0x0::64 word))::64 word) then RCX\<^sub>0 else (((strchr_0x17f0d_retval::64 word) + 0x1)::64 word)) \<and> RDI \<sigma> = RDX\<^sub>0 \<and> RSI \<sigma> = 0x2f \<and> RBP \<sigma> = RCX\<^sub>0 \<and> R15 \<sigma> = strchr_0x17f2e_retval \<and> R14 \<sigma> = (sextend (ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word))) 32 64::64 word) \<and> R13 \<sigma> = (sextend (ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word))) 32 64::64 word) \<and> R12 \<sigma> = RDI\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = 0x17f43 \<and> (\<sigma> \<turnstile> *[(if' (strchr_0x17f0d_retval::64 word) = (ucast ((0x0::64 word))::64 word) then RCX\<^sub>0 else (((strchr_0x17f0d_retval::64 word) + 0x1)::64 word)),1]::8 word) = ucast ((\<sigma> \<turnstile> *[(if' (strchr_0x17f0d_retval::64 word) = (ucast ((0x0::64 word))::64 word) then RCX\<^sub>0 else (((strchr_0x17f0d_retval::64 word) + 0x1)::64 word)),1]::8 word))\<close>
declare Q_strrchr_addr_0x17f3e_22_def[Qs]

schematic_goal path_combine_0_1_0x17f3e_0x17f3e_22[blocks]:
  assumes \<open>(P_0x17f3e_22 && P_0x17f3e_22_regions) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x17f3e 22 \<sigma> \<triangleq> ?\<sigma> \<and> Q_strrchr_addr_0x17f3e_22 ?\<sigma> \<and> block_usage P_0x17f3e_22_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x17f3e_22_def P_0x17f3e_22_regions_def post: Q_strrchr_addr_0x17f3e_22_def regionset: P_0x17f3e_22_regions_set_def)

definition P_0x17f43_23 :: state_pred where
  \<open>P_0x17f43_23 \<sigma> \<equiv> RIP \<sigma> = 0x17f43 \<and> RAX \<sigma> = strrchr_0x17f3e_retval \<and> RBX \<sigma> = RDX\<^sub>0 \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = (if' (strchr_0x17f0d_retval::64 word) = (ucast ((0x0::64 word))::64 word) then RCX\<^sub>0 else (((strchr_0x17f0d_retval::64 word) + 0x1)::64 word)) \<and> RDI \<sigma> = RDX\<^sub>0 \<and> RSI \<sigma> = 0x2f \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x38) \<and> RBP \<sigma> = RCX\<^sub>0 \<and> R15 \<sigma> = strchr_0x17f2e_retval \<and> R14 \<sigma> = (sextend (ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word))) 32 64::64 word) \<and> R13 \<sigma> = (sextend (ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word))) 32 64::64 word) \<and> R12 \<sigma> = RDI\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = 0x17f43 \<and> (\<sigma> \<turnstile> *[(if' (strchr_0x17f0d_retval::64 word) = (ucast ((0x0::64 word))::64 word) then RCX\<^sub>0 else (((strchr_0x17f0d_retval::64 word) + 0x1)::64 word)),1]::8 word) = ucast ((\<sigma> \<turnstile> *[(if' (strchr_0x17f0d_retval::64 word) = (ucast ((0x0::64 word))::64 word) then RCX\<^sub>0 else (((strchr_0x17f0d_retval::64 word) + 0x1)::64 word)),1]::8 word))\<close>
declare P_0x17f43_23_def[Ps]

definition P_0x17f43_23_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x17f43_23_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (2, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x40), 8),
    (8, (if' (strchr_0x17f0d_retval::64 word) = (ucast ((0x0::64 word))::64 word) then RCX\<^sub>0 else (((strchr_0x17f0d_retval::64 word) + 0x1)::64 word)), Suc 0)
  }\<close>

definition P_0x17f43_23_regions :: state_pred where
  \<open>P_0x17f43_23_regions \<sigma> \<equiv> \<exists>regions. P_0x17f43_23_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x17f46_23 :: state_pred where
  \<open>Q_0x17f46_23 \<sigma> \<equiv> RIP \<sigma> = 0x17f46 \<and> RAX \<sigma> = strrchr_0x17f3e_retval \<and> RBX \<sigma> = RDX\<^sub>0 \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = (if' (strchr_0x17f0d_retval::64 word) = (ucast ((0x0::64 word))::64 word) then RCX\<^sub>0 else (((strchr_0x17f0d_retval::64 word) + 0x1)::64 word)) \<and> RDI \<sigma> = RDX\<^sub>0 \<and> RSI \<sigma> = 0x2f \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x38) \<and> RBP \<sigma> = RCX\<^sub>0 \<and> R15 \<sigma> = strchr_0x17f2e_retval \<and> R14 \<sigma> = (sextend (ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word))) 32 64::64 word) \<and> R13 \<sigma> = (sextend (ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word))) 32 64::64 word) \<and> R12 \<sigma> = RDI\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = 0x17f43 \<and> (\<sigma> \<turnstile> *[(if' (strchr_0x17f0d_retval::64 word) = (ucast ((0x0::64 word))::64 word) then RCX\<^sub>0 else (((strchr_0x17f0d_retval::64 word) + 0x1)::64 word)),1]::8 word) = ucast ((\<sigma> \<turnstile> *[(if' (strchr_0x17f0d_retval::64 word) = (ucast ((0x0::64 word))::64 word) then RCX\<^sub>0 else (((strchr_0x17f0d_retval::64 word) + 0x1)::64 word)),1]::8 word))\<close>
declare Q_0x17f46_23_def[Qs]

schematic_goal path_combine_0_1_0x17f43_0x17f43_23[blocks]:
  assumes \<open>(P_0x17f43_23 && P_0x17f43_23_regions) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x17f43 23 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x17f46_23 ?\<sigma> \<and> block_usage P_0x17f43_23_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x17f43_23_def P_0x17f43_23_regions_def post: Q_0x17f46_23_def regionset: P_0x17f43_23_regions_set_def)

definition P_0x17f46_true_24 :: state_pred where
  \<open>P_0x17f46_true_24 \<sigma> \<equiv> RIP \<sigma> = 0x17f46 \<and> RAX \<sigma> = strrchr_0x17f3e_retval \<and> RBX \<sigma> = RDX\<^sub>0 \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = (if' (strchr_0x17f0d_retval::64 word) = (ucast ((0x0::64 word))::64 word) then RCX\<^sub>0 else (((strchr_0x17f0d_retval::64 word) + 0x1)::64 word)) \<and> RDI \<sigma> = RDX\<^sub>0 \<and> RSI \<sigma> = 0x2f \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x38) \<and> RBP \<sigma> = RCX\<^sub>0 \<and> R15 \<sigma> = strchr_0x17f2e_retval \<and> R14 \<sigma> = (sextend (ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word))) 32 64::64 word) \<and> R13 \<sigma> = (sextend (ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word))) 32 64::64 word) \<and> R12 \<sigma> = RDI\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = 0x17f43 \<and> (\<sigma> \<turnstile> *[(if' (strchr_0x17f0d_retval::64 word) = (ucast ((0x0::64 word))::64 word) then RCX\<^sub>0 else (((strchr_0x17f0d_retval::64 word) + 0x1)::64 word)),1]::8 word) = ucast ((\<sigma> \<turnstile> *[(if' (strchr_0x17f0d_retval::64 word) = (ucast ((0x0::64 word))::64 word) then RCX\<^sub>0 else (((strchr_0x17f0d_retval::64 word) + 0x1)::64 word)),1]::8 word))\<close>
declare P_0x17f46_true_24_def[Ps]

definition P_0x17f46_true_24_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x17f46_true_24_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (2, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x40), 8),
    (8, (if' (strchr_0x17f0d_retval::64 word) = (ucast ((0x0::64 word))::64 word) then RCX\<^sub>0 else (((strchr_0x17f0d_retval::64 word) + 0x1)::64 word)), Suc 0)
  }\<close>

definition P_0x17f46_true_24_regions :: state_pred where
  \<open>P_0x17f46_true_24_regions \<sigma> \<equiv> \<exists>regions. P_0x17f46_true_24_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x17fbe_24 :: state_pred where
  \<open>Q_0x17fbe_24 \<sigma> \<equiv> RIP \<sigma> = 0x17fbe \<and> RAX \<sigma> = strrchr_0x17f3e_retval \<and> RBX \<sigma> = RDX\<^sub>0 \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = RDX\<^sub>0 \<and> RDI \<sigma> = RDX\<^sub>0 \<and> RSI \<sigma> = 0x2f \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x38) \<and> RBP \<sigma> = RCX\<^sub>0 \<and> R15 \<sigma> = strchr_0x17f2e_retval \<and> R14 \<sigma> = (sextend (ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word))) 32 64::64 word) \<and> R13 \<sigma> = (sextend (ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word))) 32 64::64 word) \<and> R12 \<sigma> = RDI\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = 0x17f43 \<and> (\<sigma> \<turnstile> *[(if' (strchr_0x17f0d_retval::64 word) = (ucast ((0x0::64 word))::64 word) then RCX\<^sub>0 else (((strchr_0x17f0d_retval::64 word) + 0x1)::64 word)),1]::8 word) = ucast ((\<sigma> \<turnstile> *[(if' (strchr_0x17f0d_retval::64 word) = (ucast ((0x0::64 word))::64 word) then RCX\<^sub>0 else (((strchr_0x17f0d_retval::64 word) + 0x1)::64 word)),1]::8 word))\<close>
declare Q_0x17fbe_24_def[Qs]

schematic_goal path_combine_0_3_0x17f46_0x17fbb_24[blocks]:
  assumes \<open>(P_0x17f46_true_24 && P_0x17f46_true_24_regions && ZF) \<sigma>\<close>
  shows \<open>exec_block 3 0x17fbb 24 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x17fbe_24 ?\<sigma> \<and> block_usage P_0x17f46_true_24_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x17f46_true_24_def P_0x17f46_true_24_regions_def post: Q_0x17fbe_24_def regionset: P_0x17f46_true_24_regions_set_def)

definition P_0x17fbe_true_25 :: state_pred where
  \<open>P_0x17fbe_true_25 \<sigma> \<equiv> RIP \<sigma> = 0x17fbe \<and> RAX \<sigma> = strrchr_0x17f3e_retval \<and> RBX \<sigma> = RDX\<^sub>0 \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = RDX\<^sub>0 \<and> RDI \<sigma> = RDX\<^sub>0 \<and> RSI \<sigma> = 0x2f \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x38) \<and> RBP \<sigma> = RCX\<^sub>0 \<and> R15 \<sigma> = strchr_0x17f2e_retval \<and> R14 \<sigma> = (sextend (ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word))) 32 64::64 word) \<and> R13 \<sigma> = (sextend (ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word))) 32 64::64 word) \<and> R12 \<sigma> = RDI\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = 0x17f43 \<and> (\<sigma> \<turnstile> *[(if' (strchr_0x17f0d_retval::64 word) = (ucast ((0x0::64 word))::64 word) then RCX\<^sub>0 else (((strchr_0x17f0d_retval::64 word) + 0x1)::64 word)),1]::8 word) = ucast ((\<sigma> \<turnstile> *[(if' (strchr_0x17f0d_retval::64 word) = (ucast ((0x0::64 word))::64 word) then RCX\<^sub>0 else (((strchr_0x17f0d_retval::64 word) + 0x1)::64 word)),1]::8 word))\<close>
declare P_0x17fbe_true_25_def[Ps]

definition P_0x17fbe_true_25_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x17fbe_true_25_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (2, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x40), 8),
    (8, (if' (strchr_0x17f0d_retval::64 word) = (ucast ((0x0::64 word))::64 word) then RCX\<^sub>0 else (((strchr_0x17f0d_retval::64 word) + 0x1)::64 word)), Suc 0)
  }\<close>

definition P_0x17fbe_true_25_regions :: state_pred where
  \<open>P_0x17fbe_true_25_regions \<sigma> \<equiv> \<exists>regions. P_0x17fbe_true_25_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x17f58_25 :: state_pred where
  \<open>Q_0x17f58_25 \<sigma> \<equiv> RIP \<sigma> = 0x17f58 \<and> RAX \<sigma> = strrchr_0x17f3e_retval \<and> RBX \<sigma> = RDX\<^sub>0 \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = RDX\<^sub>0 \<and> RDI \<sigma> = RDX\<^sub>0 \<and> RSI \<sigma> = 0x2f \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x38) \<and> RBP \<sigma> = RCX\<^sub>0 \<and> R15 \<sigma> = strchr_0x17f2e_retval \<and> R14 \<sigma> = (sextend (ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word))) 32 64::64 word) \<and> R13 \<sigma> = (sextend (ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word))) 32 64::64 word) \<and> R12 \<sigma> = RDI\<^sub>0 \<and> R8 \<sigma> = ((strrchr_0x17f3e_retval::64 word) + 0x1) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = 0x17f43 \<and> (\<sigma> \<turnstile> *[(if' (strchr_0x17f0d_retval::64 word) = (ucast ((0x0::64 word))::64 word) then RCX\<^sub>0 else (((strchr_0x17f0d_retval::64 word) + 0x1)::64 word)),1]::8 word) = ucast ((\<sigma> \<turnstile> *[(if' (strchr_0x17f0d_retval::64 word) = (ucast ((0x0::64 word))::64 word) then RCX\<^sub>0 else (((strchr_0x17f0d_retval::64 word) + 0x1)::64 word)),1]::8 word))\<close>
declare Q_0x17f58_25_def[Qs]

schematic_goal path_combine_0_2_0x17fbe_0x17f54_25[blocks]:
  assumes \<open>(P_0x17fbe_true_25 && P_0x17fbe_true_25_regions && !ZF) \<sigma>\<close>
  shows \<open>exec_block 2 0x17f54 25 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x17f58_25 ?\<sigma> \<and> block_usage P_0x17fbe_true_25_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x17fbe_true_25_def P_0x17fbe_true_25_regions_def post: Q_0x17f58_25_def regionset: P_0x17fbe_true_25_regions_set_def)

definition P_0x17f58_26 :: state_pred where
  \<open>P_0x17f58_26 \<sigma> \<equiv> RIP \<sigma> = 0x17f58 \<and> RAX \<sigma> = strrchr_0x17f3e_retval \<and> RBX \<sigma> = RDX\<^sub>0 \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = RDX\<^sub>0 \<and> RDI \<sigma> = RDX\<^sub>0 \<and> RSI \<sigma> = 0x2f \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x38) \<and> RBP \<sigma> = RCX\<^sub>0 \<and> R15 \<sigma> = strchr_0x17f2e_retval \<and> R14 \<sigma> = (sextend (ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word))) 32 64::64 word) \<and> R13 \<sigma> = (sextend (ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word))) 32 64::64 word) \<and> R12 \<sigma> = RDI\<^sub>0 \<and> R8 \<sigma> = ((strrchr_0x17f3e_retval::64 word) + 0x1) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = 0x17f43 \<and> (\<sigma> \<turnstile> *[(if' (strchr_0x17f0d_retval::64 word) = (ucast ((0x0::64 word))::64 word) then RCX\<^sub>0 else (((strchr_0x17f0d_retval::64 word) + 0x1)::64 word)),1]::8 word) = ucast ((\<sigma> \<turnstile> *[(if' (strchr_0x17f0d_retval::64 word) = (ucast ((0x0::64 word))::64 word) then RCX\<^sub>0 else (((strchr_0x17f0d_retval::64 word) + 0x1)::64 word)),1]::8 word))\<close>
declare P_0x17f58_26_def[Ps]

definition P_0x17f58_26_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x17f58_26_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (2, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x40), 8),
    (8, (if' (strchr_0x17f0d_retval::64 word) = (ucast ((0x0::64 word))::64 word) then RCX\<^sub>0 else (((strchr_0x17f0d_retval::64 word) + 0x1)::64 word)), Suc 0)
  }\<close>

definition P_0x17f58_26_regions :: state_pred where
  \<open>P_0x17f58_26_regions \<sigma> \<equiv> \<exists>regions. P_0x17f58_26_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x17f65_26 :: state_pred where
  \<open>Q_0x17f65_26 \<sigma> \<equiv> RIP \<sigma> = 0x17f65 \<and> RAX \<sigma> = strrchr_0x17f3e_retval \<and> RBX \<sigma> = RDX\<^sub>0 \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = (((if' (((strrchr_0x17f3e_retval::64 word) + 0x1)::64 word) \<ge> RDX\<^sub>0 then ((strrchr_0x17f3e_retval::64 word) + 0x1) else (RDX\<^sub>0::64 word))::64 word) - RDX\<^sub>0) \<and> RDI \<sigma> = RDX\<^sub>0 \<and> RSI \<sigma> = 0x2f \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x38) \<and> RBP \<sigma> = RCX\<^sub>0 \<and> R15 \<sigma> = strchr_0x17f2e_retval \<and> R14 \<sigma> = (sextend (ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word))) 32 64::64 word) \<and> R13 \<sigma> = (sextend (ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word))) 32 64::64 word) \<and> R12 \<sigma> = RDI\<^sub>0 \<and> R8 \<sigma> = ((strrchr_0x17f3e_retval::64 word) + 0x1) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = 0x17f43 \<and> (\<sigma> \<turnstile> *[(if' (strchr_0x17f0d_retval::64 word) = (ucast ((0x0::64 word))::64 word) then RCX\<^sub>0 else (((strchr_0x17f0d_retval::64 word) + 0x1)::64 word)),1]::8 word) = ucast ((\<sigma> \<turnstile> *[(if' (strchr_0x17f0d_retval::64 word) = (ucast ((0x0::64 word))::64 word) then RCX\<^sub>0 else (((strchr_0x17f0d_retval::64 word) + 0x1)::64 word)),1]::8 word))\<close>
declare Q_0x17f65_26_def[Qs]

schematic_goal path_combine_0_4_0x17f58_0x17f62_26[blocks]:
  assumes \<open>(P_0x17f58_26 && P_0x17f58_26_regions) \<sigma>\<close>
  shows \<open>exec_block 4 0x17f62 26 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x17f65_26 ?\<sigma> \<and> block_usage P_0x17f58_26_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x17f58_26_def P_0x17f58_26_regions_def post: Q_0x17f65_26_def regionset: P_0x17f58_26_regions_set_def)

definition P_0x17f65_true_27 :: state_pred where
  \<open>P_0x17f65_true_27 \<sigma> \<equiv> RIP \<sigma> = 0x17f65 \<and> RAX \<sigma> = strrchr_0x17f3e_retval \<and> RBX \<sigma> = RDX\<^sub>0 \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = (((if' (((strrchr_0x17f3e_retval::64 word) + 0x1)::64 word) \<ge> RDX\<^sub>0 then ((strrchr_0x17f3e_retval::64 word) + 0x1) else (RDX\<^sub>0::64 word))::64 word) - RDX\<^sub>0) \<and> RDI \<sigma> = RDX\<^sub>0 \<and> RSI \<sigma> = 0x2f \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x38) \<and> RBP \<sigma> = RCX\<^sub>0 \<and> R15 \<sigma> = strchr_0x17f2e_retval \<and> R14 \<sigma> = (sextend (ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word))) 32 64::64 word) \<and> R13 \<sigma> = (sextend (ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word))) 32 64::64 word) \<and> R12 \<sigma> = RDI\<^sub>0 \<and> R8 \<sigma> = ((strrchr_0x17f3e_retval::64 word) + 0x1) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = 0x17f43 \<and> (\<sigma> \<turnstile> *[(if' (strchr_0x17f0d_retval::64 word) = (ucast ((0x0::64 word))::64 word) then RCX\<^sub>0 else (((strchr_0x17f0d_retval::64 word) + 0x1)::64 word)),1]::8 word) = ucast ((\<sigma> \<turnstile> *[(if' (strchr_0x17f0d_retval::64 word) = (ucast ((0x0::64 word))::64 word) then RCX\<^sub>0 else (((strchr_0x17f0d_retval::64 word) + 0x1)::64 word)),1]::8 word))\<close>
declare P_0x17f65_true_27_def[Ps]

definition P_0x17f65_true_27_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x17f65_true_27_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (2, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x40), 8),
    (8, (if' (strchr_0x17f0d_retval::64 word) = (ucast ((0x0::64 word))::64 word) then RCX\<^sub>0 else (((strchr_0x17f0d_retval::64 word) + 0x1)::64 word)), Suc 0)
  }\<close>

definition P_0x17f65_true_27_regions :: state_pred where
  \<open>P_0x17f65_true_27_regions \<sigma> \<equiv> \<exists>regions. P_0x17f65_true_27_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x17f72_27 :: state_pred where
  \<open>Q_0x17f72_27 \<sigma> \<equiv> RIP \<sigma> = 0x17f72 \<and> RAX \<sigma> = strrchr_0x17f3e_retval \<and> RBX \<sigma> = RDX\<^sub>0 \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDI \<sigma> = RDX\<^sub>0 \<and> RSI \<sigma> = 0x2f \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x38) \<and> RBP \<sigma> = RCX\<^sub>0 \<and> R15 \<sigma> = strchr_0x17f2e_retval \<and> R13 \<sigma> = (sextend (ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word))) 32 64::64 word) \<and> R12 \<sigma> = RDI\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = 0x17f43 \<and> (\<sigma> \<turnstile> *[(if' (strchr_0x17f0d_retval::64 word) = (ucast ((0x0::64 word))::64 word) then RCX\<^sub>0 else (((strchr_0x17f0d_retval::64 word) + 0x1)::64 word)),1]::8 word) = ucast ((\<sigma> \<turnstile> *[(if' (strchr_0x17f0d_retval::64 word) = (ucast ((0x0::64 word))::64 word) then RCX\<^sub>0 else (((strchr_0x17f0d_retval::64 word) + 0x1)::64 word)),1]::8 word))\<close>
declare Q_0x17f72_27_def[Qs]

schematic_goal path_combine_0_4_0x17f65_0x17faf_27[blocks]:
  assumes \<open>(P_0x17f65_true_27 && P_0x17f65_true_27_regions && jg) \<sigma>\<close>
  shows \<open>exec_block 4 0x17faf 27 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x17f72_27 ?\<sigma> \<and> block_usage P_0x17f65_true_27_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x17f65_true_27_def P_0x17f65_true_27_regions_def post: Q_0x17f72_27_def regionset: P_0x17f65_true_27_regions_set_def)

definition P_0x17f65_false_28 :: state_pred where
  \<open>P_0x17f65_false_28 \<sigma> \<equiv> RIP \<sigma> = 0x17f65 \<and> RAX \<sigma> = strrchr_0x17f3e_retval \<and> RBX \<sigma> = RDX\<^sub>0 \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = (((if' (((strrchr_0x17f3e_retval::64 word) + 0x1)::64 word) \<ge> RDX\<^sub>0 then ((strrchr_0x17f3e_retval::64 word) + 0x1) else (RDX\<^sub>0::64 word))::64 word) - RDX\<^sub>0) \<and> RDI \<sigma> = RDX\<^sub>0 \<and> RSI \<sigma> = 0x2f \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x38) \<and> RBP \<sigma> = RCX\<^sub>0 \<and> R15 \<sigma> = strchr_0x17f2e_retval \<and> R14 \<sigma> = (sextend (ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word))) 32 64::64 word) \<and> R13 \<sigma> = (sextend (ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word))) 32 64::64 word) \<and> R12 \<sigma> = RDI\<^sub>0 \<and> R8 \<sigma> = ((strrchr_0x17f3e_retval::64 word) + 0x1) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = 0x17f43 \<and> (\<sigma> \<turnstile> *[(if' (strchr_0x17f0d_retval::64 word) = (ucast ((0x0::64 word))::64 word) then RCX\<^sub>0 else (((strchr_0x17f0d_retval::64 word) + 0x1)::64 word)),1]::8 word) = ucast ((\<sigma> \<turnstile> *[(if' (strchr_0x17f0d_retval::64 word) = (ucast ((0x0::64 word))::64 word) then RCX\<^sub>0 else (((strchr_0x17f0d_retval::64 word) + 0x1)::64 word)),1]::8 word))\<close>
declare P_0x17f65_false_28_def[Ps]

definition P_0x17f65_false_28_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x17f65_false_28_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (2, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x40), 8),
    (8, (if' (strchr_0x17f0d_retval::64 word) = (ucast ((0x0::64 word))::64 word) then RCX\<^sub>0 else (((strchr_0x17f0d_retval::64 word) + 0x1)::64 word)), Suc 0)
  }\<close>

definition P_0x17f65_false_28_regions :: state_pred where
  \<open>P_0x17f65_false_28_regions \<sigma> \<equiv> \<exists>regions. P_0x17f65_false_28_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x17f72_28 :: state_pred where
  \<open>Q_0x17f72_28 \<sigma> \<equiv> RIP \<sigma> = 0x17f72 \<and> RAX \<sigma> = strrchr_0x17f3e_retval \<and> RBX \<sigma> = RDX\<^sub>0 \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDI \<sigma> = RDX\<^sub>0 \<and> RSI \<sigma> = 0x2f \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x38) \<and> RBP \<sigma> = RCX\<^sub>0 \<and> R15 \<sigma> = strchr_0x17f2e_retval \<and> R13 \<sigma> = (sextend (ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word))) 32 64::64 word) \<and> R12 \<sigma> = RDI\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = 0x17f43 \<and> (\<sigma> \<turnstile> *[(if' (strchr_0x17f0d_retval::64 word) = (ucast ((0x0::64 word))::64 word) then RCX\<^sub>0 else (((strchr_0x17f0d_retval::64 word) + 0x1)::64 word)),1]::8 word) = ucast ((\<sigma> \<turnstile> *[(if' (strchr_0x17f0d_retval::64 word) = (ucast ((0x0::64 word))::64 word) then RCX\<^sub>0 else (((strchr_0x17f0d_retval::64 word) + 0x1)::64 word)),1]::8 word))\<close>
declare Q_0x17f72_28_def[Qs]

schematic_goal path_combine_0_4_0x17f65_0x17f6e_28[blocks]:
  assumes \<open>(P_0x17f65_false_28 && P_0x17f65_false_28_regions && ! jg) \<sigma>\<close>
  shows \<open>exec_block 4 0x17f6e 28 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x17f72_28 ?\<sigma> \<and> block_usage P_0x17f65_false_28_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x17f65_false_28_def P_0x17f65_false_28_regions_def post: Q_0x17f72_28_def regionset: P_0x17f65_false_28_regions_set_def)

definition P_0x17fbe_false_29 :: state_pred where
  \<open>P_0x17fbe_false_29 \<sigma> \<equiv> RIP \<sigma> = 0x17fbe \<and> RAX \<sigma> = strrchr_0x17f3e_retval \<and> RBX \<sigma> = RDX\<^sub>0 \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = RDX\<^sub>0 \<and> RDI \<sigma> = RDX\<^sub>0 \<and> RSI \<sigma> = 0x2f \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x38) \<and> RBP \<sigma> = RCX\<^sub>0 \<and> R15 \<sigma> = strchr_0x17f2e_retval \<and> R14 \<sigma> = (sextend (ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word))) 32 64::64 word) \<and> R13 \<sigma> = (sextend (ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word))) 32 64::64 word) \<and> R12 \<sigma> = RDI\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = 0x17f43 \<and> (\<sigma> \<turnstile> *[(if' (strchr_0x17f0d_retval::64 word) = (ucast ((0x0::64 word))::64 word) then RCX\<^sub>0 else (((strchr_0x17f0d_retval::64 word) + 0x1)::64 word)),1]::8 word) = ucast ((\<sigma> \<turnstile> *[(if' (strchr_0x17f0d_retval::64 word) = (ucast ((0x0::64 word))::64 word) then RCX\<^sub>0 else (((strchr_0x17f0d_retval::64 word) + 0x1)::64 word)),1]::8 word))\<close>
declare P_0x17fbe_false_29_def[Ps]

definition P_0x17fbe_false_29_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x17fbe_false_29_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (2, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x40), 8),
    (8, (if' (strchr_0x17f0d_retval::64 word) = (ucast ((0x0::64 word))::64 word) then RCX\<^sub>0 else (((strchr_0x17f0d_retval::64 word) + 0x1)::64 word)), Suc 0)
  }\<close>

definition P_0x17fbe_false_29_regions :: state_pred where
  \<open>P_0x17fbe_false_29_regions \<sigma> \<equiv> \<exists>regions. P_0x17fbe_false_29_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x17f72_29 :: state_pred where
  \<open>Q_0x17f72_29 \<sigma> \<equiv> RIP \<sigma> = 0x17f72 \<and> RAX \<sigma> = strrchr_0x17f3e_retval \<and> RBX \<sigma> = RDX\<^sub>0 \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDI \<sigma> = RDX\<^sub>0 \<and> RSI \<sigma> = 0x2f \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x38) \<and> RBP \<sigma> = RCX\<^sub>0 \<and> R15 \<sigma> = strchr_0x17f2e_retval \<and> R13 \<sigma> = (sextend (ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word))) 32 64::64 word) \<and> R12 \<sigma> = RDI\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = 0x17f43 \<and> (\<sigma> \<turnstile> *[(if' (strchr_0x17f0d_retval::64 word) = (ucast ((0x0::64 word))::64 word) then RCX\<^sub>0 else (((strchr_0x17f0d_retval::64 word) + 0x1)::64 word)),1]::8 word) = ucast ((\<sigma> \<turnstile> *[(if' (strchr_0x17f0d_retval::64 word) = (ucast ((0x0::64 word))::64 word) then RCX\<^sub>0 else (((strchr_0x17f0d_retval::64 word) + 0x1)::64 word)),1]::8 word))\<close>
declare Q_0x17f72_29_def[Qs]

schematic_goal path_combine_0_4_0x17fbe_0x17fc5_29[blocks]:
  assumes \<open>(P_0x17fbe_false_29 && P_0x17fbe_false_29_regions && ! !ZF) \<sigma>\<close>
  shows \<open>exec_block 4 0x17fc5 29 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x17f72_29 ?\<sigma> \<and> block_usage P_0x17fbe_false_29_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x17fbe_false_29_def P_0x17fbe_false_29_regions_def post: Q_0x17f72_29_def regionset: P_0x17fbe_false_29_regions_set_def)

definition P_0x17f46_false_30 :: state_pred where
  \<open>P_0x17f46_false_30 \<sigma> \<equiv> RIP \<sigma> = 0x17f46 \<and> RAX \<sigma> = strrchr_0x17f3e_retval \<and> RBX \<sigma> = RDX\<^sub>0 \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = (if' (strchr_0x17f0d_retval::64 word) = (ucast ((0x0::64 word))::64 word) then RCX\<^sub>0 else (((strchr_0x17f0d_retval::64 word) + 0x1)::64 word)) \<and> RDI \<sigma> = RDX\<^sub>0 \<and> RSI \<sigma> = 0x2f \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x38) \<and> RBP \<sigma> = RCX\<^sub>0 \<and> R15 \<sigma> = strchr_0x17f2e_retval \<and> R14 \<sigma> = (sextend (ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word))) 32 64::64 word) \<and> R13 \<sigma> = (sextend (ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word))) 32 64::64 word) \<and> R12 \<sigma> = RDI\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = 0x17f43 \<and> (\<sigma> \<turnstile> *[(if' (strchr_0x17f0d_retval::64 word) = (ucast ((0x0::64 word))::64 word) then RCX\<^sub>0 else (((strchr_0x17f0d_retval::64 word) + 0x1)::64 word)),1]::8 word) = ucast ((\<sigma> \<turnstile> *[(if' (strchr_0x17f0d_retval::64 word) = (ucast ((0x0::64 word))::64 word) then RCX\<^sub>0 else (((strchr_0x17f0d_retval::64 word) + 0x1)::64 word)),1]::8 word))\<close>
declare P_0x17f46_false_30_def[Ps]

definition P_0x17f46_false_30_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x17f46_false_30_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (2, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x40), 8),
    (8, (if' (strchr_0x17f0d_retval::64 word) = (ucast ((0x0::64 word))::64 word) then RCX\<^sub>0 else (((strchr_0x17f0d_retval::64 word) + 0x1)::64 word)), Suc 0)
  }\<close>

definition P_0x17f46_false_30_regions :: state_pred where
  \<open>P_0x17f46_false_30_regions \<sigma> \<equiv> \<exists>regions. P_0x17f46_false_30_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x17f52_30 :: state_pred where
  \<open>Q_0x17f52_30 \<sigma> \<equiv> RIP \<sigma> = 0x17f52 \<and> RAX \<sigma> = strrchr_0x17f3e_retval \<and> RBX \<sigma> = RDX\<^sub>0 \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = ((strchr_0x17f2e_retval::64 word) + 0x1) \<and> RDI \<sigma> = RDX\<^sub>0 \<and> RSI \<sigma> = 0x2f \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x38) \<and> RBP \<sigma> = RCX\<^sub>0 \<and> R15 \<sigma> = strchr_0x17f2e_retval \<and> R14 \<sigma> = (sextend (ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word))) 32 64::64 word) \<and> R13 \<sigma> = (sextend (ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word))) 32 64::64 word) \<and> R12 \<sigma> = RDI\<^sub>0 \<and> R8 \<sigma> = RDX\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = 0x17f43 \<and> (\<sigma> \<turnstile> *[(if' (strchr_0x17f0d_retval::64 word) = (ucast ((0x0::64 word))::64 word) then RCX\<^sub>0 else (((strchr_0x17f0d_retval::64 word) + 0x1)::64 word)),1]::8 word) = ucast ((\<sigma> \<turnstile> *[(if' (strchr_0x17f0d_retval::64 word) = (ucast ((0x0::64 word))::64 word) then RCX\<^sub>0 else (((strchr_0x17f0d_retval::64 word) + 0x1)::64 word)),1]::8 word))\<close>
declare Q_0x17f52_30_def[Qs]

schematic_goal path_combine_0_4_0x17f46_0x17f4f_30[blocks]:
  assumes \<open>(P_0x17f46_false_30 && P_0x17f46_false_30_regions && ! ZF) \<sigma>\<close>
  shows \<open>exec_block 4 0x17f4f 30 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x17f52_30 ?\<sigma> \<and> block_usage P_0x17f46_false_30_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x17f46_false_30_def P_0x17f46_false_30_regions_def post: Q_0x17f52_30_def regionset: P_0x17f46_false_30_regions_set_def)

definition P_0x17f52_true_31 :: state_pred where
  \<open>P_0x17f52_true_31 \<sigma> \<equiv> RIP \<sigma> = 0x17f52 \<and> RAX \<sigma> = strrchr_0x17f3e_retval \<and> RBX \<sigma> = RDX\<^sub>0 \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = ((strchr_0x17f2e_retval::64 word) + 0x1) \<and> RDI \<sigma> = RDX\<^sub>0 \<and> RSI \<sigma> = 0x2f \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x38) \<and> RBP \<sigma> = RCX\<^sub>0 \<and> R15 \<sigma> = strchr_0x17f2e_retval \<and> R14 \<sigma> = (sextend (ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word))) 32 64::64 word) \<and> R13 \<sigma> = (sextend (ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word))) 32 64::64 word) \<and> R12 \<sigma> = RDI\<^sub>0 \<and> R8 \<sigma> = RDX\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = 0x17f43 \<and> (\<sigma> \<turnstile> *[(if' (strchr_0x17f0d_retval::64 word) = (ucast ((0x0::64 word))::64 word) then RCX\<^sub>0 else (((strchr_0x17f0d_retval::64 word) + 0x1)::64 word)),1]::8 word) = ucast ((\<sigma> \<turnstile> *[(if' (strchr_0x17f0d_retval::64 word) = (ucast ((0x0::64 word))::64 word) then RCX\<^sub>0 else (((strchr_0x17f0d_retval::64 word) + 0x1)::64 word)),1]::8 word))\<close>
declare P_0x17f52_true_31_def[Ps]

definition P_0x17f52_true_31_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x17f52_true_31_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (2, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x40), 8),
    (8, (if' (strchr_0x17f0d_retval::64 word) = (ucast ((0x0::64 word))::64 word) then RCX\<^sub>0 else (((strchr_0x17f0d_retval::64 word) + 0x1)::64 word)), Suc 0)
  }\<close>

definition P_0x17f52_true_31_regions :: state_pred where
  \<open>P_0x17f52_true_31_regions \<sigma> \<equiv> \<exists>regions. P_0x17f52_true_31_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x17f58_31 :: state_pred where
  \<open>Q_0x17f58_31 \<sigma> \<equiv> RIP \<sigma> = 0x17f58 \<and> RAX \<sigma> = strrchr_0x17f3e_retval \<and> RBX \<sigma> = RDX\<^sub>0 \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = ((strchr_0x17f2e_retval::64 word) + 0x1) \<and> RDI \<sigma> = RDX\<^sub>0 \<and> RSI \<sigma> = 0x2f \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x38) \<and> RBP \<sigma> = RCX\<^sub>0 \<and> R15 \<sigma> = strchr_0x17f2e_retval \<and> R14 \<sigma> = (sextend (ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word))) 32 64::64 word) \<and> R13 \<sigma> = (sextend (ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word))) 32 64::64 word) \<and> R12 \<sigma> = RDI\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = 0x17f43 \<and> (\<sigma> \<turnstile> *[(if' (strchr_0x17f0d_retval::64 word) = (ucast ((0x0::64 word))::64 word) then RCX\<^sub>0 else (((strchr_0x17f0d_retval::64 word) + 0x1)::64 word)),1]::8 word) = ucast ((\<sigma> \<turnstile> *[(if' (strchr_0x17f0d_retval::64 word) = (ucast ((0x0::64 word))::64 word) then RCX\<^sub>0 else (((strchr_0x17f0d_retval::64 word) + 0x1)::64 word)),1]::8 word))\<close>
declare Q_0x17f58_31_def[Qs]

schematic_goal path_combine_0_1_0x17f52_0x17f52_31[blocks]:
  assumes \<open>(P_0x17f52_true_31 && P_0x17f52_true_31_regions && ZF) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x17f52 31 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x17f58_31 ?\<sigma> \<and> block_usage P_0x17f52_true_31_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x17f52_true_31_def P_0x17f52_true_31_regions_def post: Q_0x17f58_31_def regionset: P_0x17f52_true_31_regions_set_def)

definition P_0x17f52_false_32 :: state_pred where
  \<open>P_0x17f52_false_32 \<sigma> \<equiv> RIP \<sigma> = 0x17f52 \<and> RAX \<sigma> = strrchr_0x17f3e_retval \<and> RBX \<sigma> = RDX\<^sub>0 \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = ((strchr_0x17f2e_retval::64 word) + 0x1) \<and> RDI \<sigma> = RDX\<^sub>0 \<and> RSI \<sigma> = 0x2f \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x38) \<and> RBP \<sigma> = RCX\<^sub>0 \<and> R15 \<sigma> = strchr_0x17f2e_retval \<and> R14 \<sigma> = (sextend (ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word))) 32 64::64 word) \<and> R13 \<sigma> = (sextend (ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word))) 32 64::64 word) \<and> R12 \<sigma> = RDI\<^sub>0 \<and> R8 \<sigma> = RDX\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = 0x17f43 \<and> (\<sigma> \<turnstile> *[(if' (strchr_0x17f0d_retval::64 word) = (ucast ((0x0::64 word))::64 word) then RCX\<^sub>0 else (((strchr_0x17f0d_retval::64 word) + 0x1)::64 word)),1]::8 word) = ucast ((\<sigma> \<turnstile> *[(if' (strchr_0x17f0d_retval::64 word) = (ucast ((0x0::64 word))::64 word) then RCX\<^sub>0 else (((strchr_0x17f0d_retval::64 word) + 0x1)::64 word)),1]::8 word))\<close>
declare P_0x17f52_false_32_def[Ps]

definition P_0x17f52_false_32_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x17f52_false_32_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (2, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x40), 8),
    (8, (if' (strchr_0x17f0d_retval::64 word) = (ucast ((0x0::64 word))::64 word) then RCX\<^sub>0 else (((strchr_0x17f0d_retval::64 word) + 0x1)::64 word)), Suc 0)
  }\<close>

definition P_0x17f52_false_32_regions :: state_pred where
  \<open>P_0x17f52_false_32_regions \<sigma> \<equiv> \<exists>regions. P_0x17f52_false_32_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x17f58_32 :: state_pred where
  \<open>Q_0x17f58_32 \<sigma> \<equiv> RIP \<sigma> = 0x17f58 \<and> RAX \<sigma> = strrchr_0x17f3e_retval \<and> RBX \<sigma> = RDX\<^sub>0 \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = ((strchr_0x17f2e_retval::64 word) + 0x1) \<and> RDI \<sigma> = RDX\<^sub>0 \<and> RSI \<sigma> = 0x2f \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x38) \<and> RBP \<sigma> = RCX\<^sub>0 \<and> R15 \<sigma> = strchr_0x17f2e_retval \<and> R14 \<sigma> = (sextend (ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word))) 32 64::64 word) \<and> R13 \<sigma> = (sextend (ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word))) 32 64::64 word) \<and> R12 \<sigma> = RDI\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = 0x17f43 \<and> (\<sigma> \<turnstile> *[(if' (strchr_0x17f0d_retval::64 word) = (ucast ((0x0::64 word))::64 word) then RCX\<^sub>0 else (((strchr_0x17f0d_retval::64 word) + 0x1)::64 word)),1]::8 word) = ucast ((\<sigma> \<turnstile> *[(if' (strchr_0x17f0d_retval::64 word) = (ucast ((0x0::64 word))::64 word) then RCX\<^sub>0 else (((strchr_0x17f0d_retval::64 word) + 0x1)::64 word)),1]::8 word))\<close>
declare Q_0x17f58_32_def[Qs]

schematic_goal path_combine_0_2_0x17f52_0x17f54_32[blocks]:
  assumes \<open>(P_0x17f52_false_32 && P_0x17f52_false_32_regions && ! ZF) \<sigma>\<close>
  shows \<open>exec_block 2 0x17f54 32 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x17f58_32 ?\<sigma> \<and> block_usage P_0x17f52_false_32_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x17f52_false_32_def P_0x17f52_false_32_regions_def post: Q_0x17f58_32_def regionset: P_0x17f52_false_32_regions_set_def)

definition P_0x17f58_33 :: state_pred where
  \<open>P_0x17f58_33 \<sigma> \<equiv> RIP \<sigma> = 0x17f58 \<and> RAX \<sigma> = strrchr_0x17f3e_retval \<and> RBX \<sigma> = RDX\<^sub>0 \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = ((strchr_0x17f2e_retval::64 word) + 0x1) \<and> RDI \<sigma> = RDX\<^sub>0 \<and> RSI \<sigma> = 0x2f \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x38) \<and> RBP \<sigma> = RCX\<^sub>0 \<and> R15 \<sigma> = strchr_0x17f2e_retval \<and> R14 \<sigma> = (sextend (ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word))) 32 64::64 word) \<and> R13 \<sigma> = (sextend (ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word))) 32 64::64 word) \<and> R12 \<sigma> = RDI\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = 0x17f43 \<and> (\<sigma> \<turnstile> *[(if' (strchr_0x17f0d_retval::64 word) = (ucast ((0x0::64 word))::64 word) then RCX\<^sub>0 else (((strchr_0x17f0d_retval::64 word) + 0x1)::64 word)),1]::8 word) = ucast ((\<sigma> \<turnstile> *[(if' (strchr_0x17f0d_retval::64 word) = (ucast ((0x0::64 word))::64 word) then RCX\<^sub>0 else (((strchr_0x17f0d_retval::64 word) + 0x1)::64 word)),1]::8 word))\<close>
declare P_0x17f58_33_def[Ps]

definition P_0x17f58_33_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x17f58_33_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (2, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x40), 8),
    (8, (if' (strchr_0x17f0d_retval::64 word) = (ucast ((0x0::64 word))::64 word) then RCX\<^sub>0 else (((strchr_0x17f0d_retval::64 word) + 0x1)::64 word)), Suc 0)
  }\<close>

definition P_0x17f58_33_regions :: state_pred where
  \<open>P_0x17f58_33_regions \<sigma> \<equiv> \<exists>regions. P_0x17f58_33_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x17f65_33 :: state_pred where
  \<open>Q_0x17f65_33 \<sigma> \<equiv> RIP \<sigma> = 0x17f65 \<and> RAX \<sigma> = strrchr_0x17f3e_retval \<and> RBX \<sigma> = RDX\<^sub>0 \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = (((if' (R8 \<sigma>::64 word) \<ge> ((strchr_0x17f2e_retval::64 word) + 0x1) then R8 \<sigma> else (((strchr_0x17f2e_retval::64 word) + 0x1)::64 word))::64 word) - RDX\<^sub>0) \<and> RDI \<sigma> = RDX\<^sub>0 \<and> RSI \<sigma> = 0x2f \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x38) \<and> RBP \<sigma> = RCX\<^sub>0 \<and> R15 \<sigma> = strchr_0x17f2e_retval \<and> R14 \<sigma> = (sextend (ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word))) 32 64::64 word) \<and> R13 \<sigma> = (sextend (ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word))) 32 64::64 word) \<and> R12 \<sigma> = RDI\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = 0x17f43 \<and> (\<sigma> \<turnstile> *[(if' (strchr_0x17f0d_retval::64 word) = (ucast ((0x0::64 word))::64 word) then RCX\<^sub>0 else (((strchr_0x17f0d_retval::64 word) + 0x1)::64 word)),1]::8 word) = ucast ((\<sigma> \<turnstile> *[(if' (strchr_0x17f0d_retval::64 word) = (ucast ((0x0::64 word))::64 word) then RCX\<^sub>0 else (((strchr_0x17f0d_retval::64 word) + 0x1)::64 word)),1]::8 word))\<close>
declare Q_0x17f65_33_def[Qs]

schematic_goal path_combine_0_4_0x17f58_0x17f62_33[blocks]:
  assumes \<open>(P_0x17f58_33 && P_0x17f58_33_regions) \<sigma>\<close>
  shows \<open>exec_block 4 0x17f62 33 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x17f65_33 ?\<sigma> \<and> block_usage P_0x17f58_33_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x17f58_33_def P_0x17f58_33_regions_def post: Q_0x17f65_33_def regionset: P_0x17f58_33_regions_set_def)

definition P_0x17f65_true_34 :: state_pred where
  \<open>P_0x17f65_true_34 \<sigma> \<equiv> RIP \<sigma> = 0x17f65 \<and> RAX \<sigma> = strrchr_0x17f3e_retval \<and> RBX \<sigma> = RDX\<^sub>0 \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = (((if' (R8 \<sigma>::64 word) \<ge> ((strchr_0x17f2e_retval::64 word) + 0x1) then R8 \<sigma> else (((strchr_0x17f2e_retval::64 word) + 0x1)::64 word))::64 word) - RDX\<^sub>0) \<and> RDI \<sigma> = RDX\<^sub>0 \<and> RSI \<sigma> = 0x2f \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x38) \<and> RBP \<sigma> = RCX\<^sub>0 \<and> R15 \<sigma> = strchr_0x17f2e_retval \<and> R14 \<sigma> = (sextend (ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word))) 32 64::64 word) \<and> R13 \<sigma> = (sextend (ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word))) 32 64::64 word) \<and> R12 \<sigma> = RDI\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = 0x17f43 \<and> (\<sigma> \<turnstile> *[(if' (strchr_0x17f0d_retval::64 word) = (ucast ((0x0::64 word))::64 word) then RCX\<^sub>0 else (((strchr_0x17f0d_retval::64 word) + 0x1)::64 word)),1]::8 word) = ucast ((\<sigma> \<turnstile> *[(if' (strchr_0x17f0d_retval::64 word) = (ucast ((0x0::64 word))::64 word) then RCX\<^sub>0 else (((strchr_0x17f0d_retval::64 word) + 0x1)::64 word)),1]::8 word))\<close>
declare P_0x17f65_true_34_def[Ps]

definition P_0x17f65_true_34_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x17f65_true_34_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (2, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x40), 8),
    (8, (if' (strchr_0x17f0d_retval::64 word) = (ucast ((0x0::64 word))::64 word) then RCX\<^sub>0 else (((strchr_0x17f0d_retval::64 word) + 0x1)::64 word)), Suc 0)
  }\<close>

definition P_0x17f65_true_34_regions :: state_pred where
  \<open>P_0x17f65_true_34_regions \<sigma> \<equiv> \<exists>regions. P_0x17f65_true_34_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x17f72_34 :: state_pred where
  \<open>Q_0x17f72_34 \<sigma> \<equiv> RIP \<sigma> = 0x17f72 \<and> RAX \<sigma> = strrchr_0x17f3e_retval \<and> RBX \<sigma> = RDX\<^sub>0 \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDI \<sigma> = RDX\<^sub>0 \<and> RSI \<sigma> = 0x2f \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x38) \<and> RBP \<sigma> = RCX\<^sub>0 \<and> R15 \<sigma> = strchr_0x17f2e_retval \<and> R13 \<sigma> = (sextend (ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word))) 32 64::64 word) \<and> R12 \<sigma> = RDI\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = 0x17f43 \<and> (\<sigma> \<turnstile> *[(if' (strchr_0x17f0d_retval::64 word) = (ucast ((0x0::64 word))::64 word) then RCX\<^sub>0 else (((strchr_0x17f0d_retval::64 word) + 0x1)::64 word)),1]::8 word) = ucast ((\<sigma> \<turnstile> *[(if' (strchr_0x17f0d_retval::64 word) = (ucast ((0x0::64 word))::64 word) then RCX\<^sub>0 else (((strchr_0x17f0d_retval::64 word) + 0x1)::64 word)),1]::8 word))\<close>
declare Q_0x17f72_34_def[Qs]

schematic_goal path_combine_0_4_0x17f65_0x17faf_34[blocks]:
  assumes \<open>(P_0x17f65_true_34 && P_0x17f65_true_34_regions && jg) \<sigma>\<close>
  shows \<open>exec_block 4 0x17faf 34 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x17f72_34 ?\<sigma> \<and> block_usage P_0x17f65_true_34_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x17f65_true_34_def P_0x17f65_true_34_regions_def post: Q_0x17f72_34_def regionset: P_0x17f65_true_34_regions_set_def)

definition P_0x17f65_false_35 :: state_pred where
  \<open>P_0x17f65_false_35 \<sigma> \<equiv> RIP \<sigma> = 0x17f65 \<and> RAX \<sigma> = strrchr_0x17f3e_retval \<and> RBX \<sigma> = RDX\<^sub>0 \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = (((if' (R8 \<sigma>::64 word) \<ge> ((strchr_0x17f2e_retval::64 word) + 0x1) then R8 \<sigma> else (((strchr_0x17f2e_retval::64 word) + 0x1)::64 word))::64 word) - RDX\<^sub>0) \<and> RDI \<sigma> = RDX\<^sub>0 \<and> RSI \<sigma> = 0x2f \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x38) \<and> RBP \<sigma> = RCX\<^sub>0 \<and> R15 \<sigma> = strchr_0x17f2e_retval \<and> R14 \<sigma> = (sextend (ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word))) 32 64::64 word) \<and> R13 \<sigma> = (sextend (ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word))) 32 64::64 word) \<and> R12 \<sigma> = RDI\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = 0x17f43 \<and> (\<sigma> \<turnstile> *[(if' (strchr_0x17f0d_retval::64 word) = (ucast ((0x0::64 word))::64 word) then RCX\<^sub>0 else (((strchr_0x17f0d_retval::64 word) + 0x1)::64 word)),1]::8 word) = ucast ((\<sigma> \<turnstile> *[(if' (strchr_0x17f0d_retval::64 word) = (ucast ((0x0::64 word))::64 word) then RCX\<^sub>0 else (((strchr_0x17f0d_retval::64 word) + 0x1)::64 word)),1]::8 word))\<close>
declare P_0x17f65_false_35_def[Ps]

definition P_0x17f65_false_35_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x17f65_false_35_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (2, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x40), 8),
    (8, (if' (strchr_0x17f0d_retval::64 word) = (ucast ((0x0::64 word))::64 word) then RCX\<^sub>0 else (((strchr_0x17f0d_retval::64 word) + 0x1)::64 word)), Suc 0)
  }\<close>

definition P_0x17f65_false_35_regions :: state_pred where
  \<open>P_0x17f65_false_35_regions \<sigma> \<equiv> \<exists>regions. P_0x17f65_false_35_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x17f72_35 :: state_pred where
  \<open>Q_0x17f72_35 \<sigma> \<equiv> RIP \<sigma> = 0x17f72 \<and> RAX \<sigma> = strrchr_0x17f3e_retval \<and> RBX \<sigma> = RDX\<^sub>0 \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDI \<sigma> = RDX\<^sub>0 \<and> RSI \<sigma> = 0x2f \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x38) \<and> RBP \<sigma> = RCX\<^sub>0 \<and> R15 \<sigma> = strchr_0x17f2e_retval \<and> R13 \<sigma> = (sextend (ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word))) 32 64::64 word) \<and> R12 \<sigma> = RDI\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = 0x17f43 \<and> (\<sigma> \<turnstile> *[(if' (strchr_0x17f0d_retval::64 word) = (ucast ((0x0::64 word))::64 word) then RCX\<^sub>0 else (((strchr_0x17f0d_retval::64 word) + 0x1)::64 word)),1]::8 word) = ucast ((\<sigma> \<turnstile> *[(if' (strchr_0x17f0d_retval::64 word) = (ucast ((0x0::64 word))::64 word) then RCX\<^sub>0 else (((strchr_0x17f0d_retval::64 word) + 0x1)::64 word)),1]::8 word))\<close>
declare Q_0x17f72_35_def[Qs]

schematic_goal path_combine_0_4_0x17f65_0x17f6e_35[blocks]:
  assumes \<open>(P_0x17f65_false_35 && P_0x17f65_false_35_regions && ! jg) \<sigma>\<close>
  shows \<open>exec_block 4 0x17f6e 35 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x17f72_35 ?\<sigma> \<and> block_usage P_0x17f65_false_35_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x17f65_false_35_def P_0x17f65_false_35_regions_def post: Q_0x17f72_35_def regionset: P_0x17f65_false_35_regions_set_def)

definition P_0x17f72_36 :: state_pred where
  \<open>P_0x17f72_36 \<sigma> \<equiv> RIP \<sigma> = 0x17f72 \<and> RAX \<sigma> = strrchr_0x17f3e_retval \<and> RBX \<sigma> = RDX\<^sub>0 \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDI \<sigma> = RDX\<^sub>0 \<and> RSI \<sigma> = 0x2f \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x38) \<and> RBP \<sigma> = RCX\<^sub>0 \<and> R15 \<sigma> = strchr_0x17f2e_retval \<and> R13 \<sigma> = (sextend (ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word))) 32 64::64 word) \<and> R12 \<sigma> = RDI\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = 0x17f43 \<and> (\<sigma> \<turnstile> *[(if' (strchr_0x17f0d_retval::64 word) = (ucast ((0x0::64 word))::64 word) then RCX\<^sub>0 else (((strchr_0x17f0d_retval::64 word) + 0x1)::64 word)),1]::8 word) = ucast ((\<sigma> \<turnstile> *[(if' (strchr_0x17f0d_retval::64 word) = (ucast ((0x0::64 word))::64 word) then RCX\<^sub>0 else (((strchr_0x17f0d_retval::64 word) + 0x1)::64 word)),1]::8 word))\<close>
declare P_0x17f72_36_def[Ps]

definition P_0x17f72_36_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x17f72_36_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (2, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x40), 8),
    (8, (if' (strchr_0x17f0d_retval::64 word) = (ucast ((0x0::64 word))::64 word) then RCX\<^sub>0 else (((strchr_0x17f0d_retval::64 word) + 0x1)::64 word)), Suc 0)
  }\<close>

definition P_0x17f72_36_regions :: state_pred where
  \<open>P_0x17f72_36_regions \<sigma> \<equiv> \<exists>regions. P_0x17f72_36_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x17f78_36 :: state_pred where
  \<open>Q_0x17f78_36 \<sigma> \<equiv> RIP \<sigma> = 0x17f78 \<and> RAX \<sigma> = strrchr_0x17f3e_retval \<and> RBX \<sigma> = RDX\<^sub>0 \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = RDX\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x38) \<and> RBP \<sigma> = RCX\<^sub>0 \<and> R15 \<sigma> = strchr_0x17f2e_retval \<and> R13 \<sigma> = (sextend (ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word))) 32 64::64 word) \<and> R12 \<sigma> = RDI\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = 0x17f43 \<and> (\<sigma> \<turnstile> *[(if' (strchr_0x17f0d_retval::64 word) = (ucast ((0x0::64 word))::64 word) then RCX\<^sub>0 else (((strchr_0x17f0d_retval::64 word) + 0x1)::64 word)),1]::8 word) = ucast ((\<sigma> \<turnstile> *[(if' (strchr_0x17f0d_retval::64 word) = (ucast ((0x0::64 word))::64 word) then RCX\<^sub>0 else (((strchr_0x17f0d_retval::64 word) + 0x1)::64 word)),1]::8 word))\<close>
declare Q_0x17f78_36_def[Qs]

schematic_goal path_combine_0_2_0x17f72_0x17f75_36[blocks]:
  assumes \<open>(P_0x17f72_36 && P_0x17f72_36_regions) \<sigma>\<close>
  shows \<open>exec_block 2 0x17f75 36 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x17f78_36 ?\<sigma> \<and> block_usage P_0x17f72_36_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x17f72_36_def P_0x17f72_36_regions_def post: Q_0x17f78_36_def regionset: P_0x17f72_36_regions_set_def)

definition P_0x17f78_37 :: state_pred where
  \<open>P_0x17f78_37 \<sigma> \<equiv> RIP \<sigma> = 0x17f78 \<and> RAX \<sigma> = strrchr_0x17f3e_retval \<and> RBX \<sigma> = RDX\<^sub>0 \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = RDX\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x38) \<and> RBP \<sigma> = RCX\<^sub>0 \<and> R15 \<sigma> = strchr_0x17f2e_retval \<and> R13 \<sigma> = (sextend (ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word))) 32 64::64 word) \<and> R12 \<sigma> = RDI\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = 0x17f43 \<and> (\<sigma> \<turnstile> *[(if' (strchr_0x17f0d_retval::64 word) = (ucast ((0x0::64 word))::64 word) then RCX\<^sub>0 else (((strchr_0x17f0d_retval::64 word) + 0x1)::64 word)),1]::8 word) = ucast ((\<sigma> \<turnstile> *[(if' (strchr_0x17f0d_retval::64 word) = (ucast ((0x0::64 word))::64 word) then RCX\<^sub>0 else (((strchr_0x17f0d_retval::64 word) + 0x1)::64 word)),1]::8 word))\<close>
declare P_0x17f78_37_def[Ps]

definition P_0x17f78_37_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x17f78_37_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (2, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x40), 8),
    (8, (if' (strchr_0x17f0d_retval::64 word) = (ucast ((0x0::64 word))::64 word) then RCX\<^sub>0 else (((strchr_0x17f0d_retval::64 word) + 0x1)::64 word)), Suc 0)
  }\<close>

definition P_0x17f78_37_regions :: state_pred where
  \<open>P_0x17f78_37_regions \<sigma> \<equiv> \<exists>regions. P_0x17f78_37_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_memcpy_addr_0x17f78_37 :: state_pred where
  \<open>Q_memcpy_addr_0x17f78_37 \<sigma> \<equiv> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x40) \<and> RIP \<sigma> = memcpy_addr \<and> RAX \<sigma> = strrchr_0x17f3e_retval \<and> RBX \<sigma> = RDX\<^sub>0 \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = RDX\<^sub>0 \<and> RBP \<sigma> = RCX\<^sub>0 \<and> R15 \<sigma> = strchr_0x17f2e_retval \<and> R13 \<sigma> = (sextend (ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word))) 32 64::64 word) \<and> R12 \<sigma> = RDI\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = 0x17f7d \<and> (\<sigma> \<turnstile> *[(if' (strchr_0x17f0d_retval::64 word) = (ucast ((0x0::64 word))::64 word) then RCX\<^sub>0 else (((strchr_0x17f0d_retval::64 word) + 0x1)::64 word)),1]::8 word) = ucast ((\<sigma> \<turnstile> *[(if' (strchr_0x17f0d_retval::64 word) = (ucast ((0x0::64 word))::64 word) then RCX\<^sub>0 else (((strchr_0x17f0d_retval::64 word) + 0x1)::64 word)),1]::8 word))\<close>
declare Q_memcpy_addr_0x17f78_37_def[Qs]

schematic_goal path_combine_0_1_0x17f78_0x17f78_37[blocks]:
  assumes \<open>(P_0x17f78_37 && P_0x17f78_37_regions) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x17f78 37 \<sigma> \<triangleq> ?\<sigma> \<and> Q_memcpy_addr_0x17f78_37 ?\<sigma> \<and> block_usage P_0x17f78_37_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x17f78_37_def P_0x17f78_37_regions_def post: Q_memcpy_addr_0x17f78_37_def regionset: P_0x17f78_37_regions_set_def)

definition P_0x17f7d_38 :: state_pred where
  \<open>P_0x17f7d_38 \<sigma> \<equiv> RIP \<sigma> = 0x17f7d \<and> RAX \<sigma> = memcpy_0x17f78_retval \<and> RBX \<sigma> = RDX\<^sub>0 \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = RDX\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x38) \<and> RBP \<sigma> = RCX\<^sub>0 \<and> R15 \<sigma> = strchr_0x17f2e_retval \<and> R13 \<sigma> = (sextend (ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word))) 32 64::64 word) \<and> R12 \<sigma> = RDI\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = 0x17f7d \<and> (\<sigma> \<turnstile> *[(if' (strchr_0x17f0d_retval::64 word) = (ucast ((0x0::64 word))::64 word) then RCX\<^sub>0 else (((strchr_0x17f0d_retval::64 word) + 0x1)::64 word)),1]::8 word) = ucast ((\<sigma> \<turnstile> *[(if' (strchr_0x17f0d_retval::64 word) = (ucast ((0x0::64 word))::64 word) then RCX\<^sub>0 else (((strchr_0x17f0d_retval::64 word) + 0x1)::64 word)),1]::8 word))\<close>
declare P_0x17f7d_38_def[Ps]

definition P_0x17f7d_38_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x17f7d_38_regions_set \<sigma> \<equiv> {
    (0, R14 \<sigma>, Suc 0),
    (1, RSP\<^sub>0, 8),
    (2, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x40), 8),
    (9, (if' (strchr_0x17f0d_retval::64 word) = (ucast ((0x0::64 word))::64 word) then RCX\<^sub>0 else (((strchr_0x17f0d_retval::64 word) + 0x1)::64 word)), Suc 0)
  }\<close>

definition P_0x17f7d_38_regions :: state_pred where
  \<open>P_0x17f7d_38_regions \<sigma> \<equiv> \<exists>regions. P_0x17f7d_38_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x55ad_38 :: state_pred where
  \<open>Q_0x55ad_38 \<sigma> \<equiv> RIP \<sigma> = 0x55ad \<and> RAX \<sigma> = memcpy_0x17f78_retval \<and> RBX \<sigma> = (sextend (ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word))) 32 64::64 word) \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = RCX\<^sub>0 \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = (sextend (ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word))) 32 64::64 word) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x18) \<and> RBP \<sigma> = RDI\<^sub>0 \<and> R15 \<sigma> = R15\<^sub>0 \<and> R14 \<sigma> = R14\<^sub>0 \<and> R13 \<sigma> = R13\<^sub>0 \<and> R12 \<sigma> = RCX\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = 0x17f7d \<and> (\<sigma> \<turnstile> *[(if' (strchr_0x17f0d_retval::64 word) = (ucast ((0x0::64 word))::64 word) then RCX\<^sub>0 else (((strchr_0x17f0d_retval::64 word) + 0x1)::64 word)),1]::8 word) = ucast ((\<sigma> \<turnstile> *[(if' (strchr_0x17f0d_retval::64 word) = (ucast ((0x0::64 word))::64 word) then RCX\<^sub>0 else (((strchr_0x17f0d_retval::64 word) + 0x1)::64 word)),1]::8 word))\<close>
declare Q_0x55ad_38_def[Qs]

schematic_goal path_combine_0_18_0x17f7d_0x55aa_38[blocks]:
  assumes \<open>(P_0x17f7d_38 && P_0x17f7d_38_regions) \<sigma>\<close>
  shows \<open>exec_block 18 0x55aa 38 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x55ad_38 ?\<sigma> \<and> block_usage P_0x17f7d_38_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x17f7d_38_def P_0x17f7d_38_regions_def post: Q_0x55ad_38_def regionset: P_0x17f7d_38_regions_set_def)

definition P_0x55ad_39 :: state_pred where
  \<open>P_0x55ad_39 \<sigma> \<equiv> RIP \<sigma> = 0x55ad \<and> RAX \<sigma> = memcpy_0x17f78_retval \<and> RBX \<sigma> = (sextend (ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word))) 32 64::64 word) \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = RCX\<^sub>0 \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = (sextend (ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word))) 32 64::64 word) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x18) \<and> RBP \<sigma> = RDI\<^sub>0 \<and> R15 \<sigma> = R15\<^sub>0 \<and> R14 \<sigma> = R14\<^sub>0 \<and> R13 \<sigma> = R13\<^sub>0 \<and> R12 \<sigma> = RCX\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = 0x17f7d \<and> (\<sigma> \<turnstile> *[(if' (strchr_0x17f0d_retval::64 word) = (ucast ((0x0::64 word))::64 word) then RCX\<^sub>0 else (((strchr_0x17f0d_retval::64 word) + 0x1)::64 word)),1]::8 word) = ucast ((\<sigma> \<turnstile> *[(if' (strchr_0x17f0d_retval::64 word) = (ucast ((0x0::64 word))::64 word) then RCX\<^sub>0 else (((strchr_0x17f0d_retval::64 word) + 0x1)::64 word)),1]::8 word))\<close>
declare P_0x55ad_39_def[Ps]

definition P_0x55ad_39_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x55ad_39_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (2, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x40), 8),
    (8, (if' (strchr_0x17f0d_retval::64 word) = (ucast ((0x0::64 word))::64 word) then RCX\<^sub>0 else (((strchr_0x17f0d_retval::64 word) + 0x1)::64 word)), Suc 0)
  }\<close>

definition P_0x55ad_39_regions :: state_pred where
  \<open>P_0x55ad_39_regions \<sigma> \<equiv> \<exists>regions. P_0x55ad_39_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_strlen_addr_0x55ad_39 :: state_pred where
  \<open>Q_strlen_addr_0x55ad_39 \<sigma> \<equiv> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x20) \<and> RIP \<sigma> = strlen_addr \<and> RAX \<sigma> = memcpy_0x17f78_retval \<and> RBX \<sigma> = (sextend (ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word))) 32 64::64 word) \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = RCX\<^sub>0 \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = (sextend (ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word))) 32 64::64 word) \<and> RBP \<sigma> = RDI\<^sub>0 \<and> R15 \<sigma> = R15\<^sub>0 \<and> R14 \<sigma> = R14\<^sub>0 \<and> R13 \<sigma> = R13\<^sub>0 \<and> R12 \<sigma> = RCX\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = 0x55b2 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = 0x17f7d \<and> (\<sigma> \<turnstile> *[(if' (strchr_0x17f0d_retval::64 word) = (ucast ((0x0::64 word))::64 word) then RCX\<^sub>0 else (((strchr_0x17f0d_retval::64 word) + 0x1)::64 word)),1]::8 word) = ucast ((\<sigma> \<turnstile> *[(if' (strchr_0x17f0d_retval::64 word) = (ucast ((0x0::64 word))::64 word) then RCX\<^sub>0 else (((strchr_0x17f0d_retval::64 word) + 0x1)::64 word)),1]::8 word))\<close>
declare Q_strlen_addr_0x55ad_39_def[Qs]

schematic_goal path_combine_0_1_0x55ad_0x55ad_39[blocks]:
  assumes \<open>(P_0x55ad_39 && P_0x55ad_39_regions) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x55ad 39 \<sigma> \<triangleq> ?\<sigma> \<and> Q_strlen_addr_0x55ad_39 ?\<sigma> \<and> block_usage P_0x55ad_39_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x55ad_39_def P_0x55ad_39_regions_def post: Q_strlen_addr_0x55ad_39_def regionset: P_0x55ad_39_regions_set_def)

definition P_0x55b2_40 :: state_pred where
  \<open>P_0x55b2_40 \<sigma> \<equiv> RIP \<sigma> = 0x55b2 \<and> RAX \<sigma> = strlen_0x55ad_retval \<and> RBX \<sigma> = (sextend (ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word))) 32 64::64 word) \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = RCX\<^sub>0 \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = (sextend (ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word))) 32 64::64 word) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x18) \<and> RBP \<sigma> = RDI\<^sub>0 \<and> R15 \<sigma> = R15\<^sub>0 \<and> R14 \<sigma> = R14\<^sub>0 \<and> R13 \<sigma> = R13\<^sub>0 \<and> R12 \<sigma> = RCX\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = 0x55b2 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = 0x17f7d \<and> (\<sigma> \<turnstile> *[(if' (strchr_0x17f0d_retval::64 word) = (ucast ((0x0::64 word))::64 word) then RCX\<^sub>0 else (((strchr_0x17f0d_retval::64 word) + 0x1)::64 word)),1]::8 word) = ucast ((\<sigma> \<turnstile> *[(if' (strchr_0x17f0d_retval::64 word) = (ucast ((0x0::64 word))::64 word) then RCX\<^sub>0 else (((strchr_0x17f0d_retval::64 word) + 0x1)::64 word)),1]::8 word))\<close>
declare P_0x55b2_40_def[Ps]

definition P_0x55b2_40_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x55b2_40_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (2, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x40), 8),
    (8, (if' (strchr_0x17f0d_retval::64 word) = (ucast ((0x0::64 word))::64 word) then RCX\<^sub>0 else (((strchr_0x17f0d_retval::64 word) + 0x1)::64 word)), Suc 0)
  }\<close>

definition P_0x55b2_40_regions :: state_pred where
  \<open>P_0x55b2_40_regions \<sigma> \<equiv> \<exists>regions. P_0x55b2_40_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x55b7_40 :: state_pred where
  \<open>Q_0x55b7_40 \<sigma> \<equiv> RIP \<sigma> = 0x55b7 \<and> RAX \<sigma> = (sextend (ucast ((\<langle>31,0\<rangle>strlen_0x55ad_retval::32 word))) 32 64::64 word) \<and> RBX \<sigma> = (sextend (ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word))) 32 64::64 word) \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = RCX\<^sub>0 \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = (sextend (ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word))) 32 64::64 word) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x18) \<and> RBP \<sigma> = RDI\<^sub>0 \<and> R15 \<sigma> = R15\<^sub>0 \<and> R14 \<sigma> = R14\<^sub>0 \<and> R13 \<sigma> = R13\<^sub>0 \<and> R12 \<sigma> = RCX\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = 0x55b2 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = 0x17f7d \<and> (\<sigma> \<turnstile> *[(if' (strchr_0x17f0d_retval::64 word) = (ucast ((0x0::64 word))::64 word) then RCX\<^sub>0 else (((strchr_0x17f0d_retval::64 word) + 0x1)::64 word)),1]::8 word) = ucast ((\<sigma> \<turnstile> *[(if' (strchr_0x17f0d_retval::64 word) = (ucast ((0x0::64 word))::64 word) then RCX\<^sub>0 else (((strchr_0x17f0d_retval::64 word) + 0x1)::64 word)),1]::8 word))\<close>
declare Q_0x55b7_40_def[Qs]

schematic_goal path_combine_0_2_0x55b2_0x55b4_40[blocks]:
  assumes \<open>(P_0x55b2_40 && P_0x55b2_40_regions) \<sigma>\<close>
  shows \<open>exec_block 2 0x55b4 40 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x55b7_40 ?\<sigma> \<and> block_usage P_0x55b2_40_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x55b2_40_def P_0x55b2_40_regions_def post: Q_0x55b7_40_def regionset: P_0x55b2_40_regions_set_def)

definition P_0x55b7_true_41 :: state_pred where
  \<open>P_0x55b7_true_41 \<sigma> \<equiv> RIP \<sigma> = 0x55b7 \<and> RAX \<sigma> = (sextend (ucast ((\<langle>31,0\<rangle>strlen_0x55ad_retval::32 word))) 32 64::64 word) \<and> RBX \<sigma> = (sextend (ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word))) 32 64::64 word) \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = RCX\<^sub>0 \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = (sextend (ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word))) 32 64::64 word) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x18) \<and> RBP \<sigma> = RDI\<^sub>0 \<and> R15 \<sigma> = R15\<^sub>0 \<and> R14 \<sigma> = R14\<^sub>0 \<and> R13 \<sigma> = R13\<^sub>0 \<and> R12 \<sigma> = RCX\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = 0x55b2 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = 0x17f7d \<and> (\<sigma> \<turnstile> *[(if' (strchr_0x17f0d_retval::64 word) = (ucast ((0x0::64 word))::64 word) then RCX\<^sub>0 else (((strchr_0x17f0d_retval::64 word) + 0x1)::64 word)),1]::8 word) = ucast ((\<sigma> \<turnstile> *[(if' (strchr_0x17f0d_retval::64 word) = (ucast ((0x0::64 word))::64 word) then RCX\<^sub>0 else (((strchr_0x17f0d_retval::64 word) + 0x1)::64 word)),1]::8 word))\<close>
declare P_0x55b7_true_41_def[Ps]

definition P_0x55b7_true_41_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x55b7_true_41_regions_set \<sigma> \<equiv> {
    (0, RCX\<^sub>0, Suc 0),
    (1, RSP\<^sub>0, 8),
    (2, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x40), 8),
    (9, (if' (strchr_0x17f0d_retval::64 word) = (ucast ((0x0::64 word))::64 word) then RCX\<^sub>0 else (((strchr_0x17f0d_retval::64 word) + 0x1)::64 word)), Suc 0)
  }\<close>

definition P_0x55b7_true_41_regions :: state_pred where
  \<open>P_0x55b7_true_41_regions \<sigma> \<equiv> \<exists>regions. P_0x55b7_true_41_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x55db_41 :: state_pred where
  \<open>Q_0x55db_41 \<sigma> \<equiv> RIP \<sigma> = 0x55db \<and> RAX \<sigma> = (((sextend (ucast ((\<langle>31,0\<rangle>strlen_0x55ad_retval::32 word))) 32 64::64 word)::64 word) + RDI\<^sub>0) \<and> RBX \<sigma> = (((sextend (ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word))) 32 64::64 word)::64 word) - 0x1) \<and> RCX \<sigma> = ((RCX\<^sub>0::64 word) + 0x1) \<and> RDX \<sigma> = ucast ((\<sigma> \<turnstile> *[RCX\<^sub>0,1]::8 word)) \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = (sextend (ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word))) 32 64::64 word) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x18) \<and> RBP \<sigma> = RDI\<^sub>0 \<and> R15 \<sigma> = R15\<^sub>0 \<and> R14 \<sigma> = R14\<^sub>0 \<and> R13 \<sigma> = R13\<^sub>0 \<and> R12 \<sigma> = RCX\<^sub>0 \<and> (\<sigma> \<turnstile> *[RCX\<^sub>0,1]::8 word) = ucast ((\<sigma> \<turnstile> *[RCX\<^sub>0,1]::8 word)) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = 0x55b2 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = 0x17f7d \<and> (\<sigma> \<turnstile> *[(if' (strchr_0x17f0d_retval::64 word) = (ucast ((0x0::64 word))::64 word) then RCX\<^sub>0 else (((strchr_0x17f0d_retval::64 word) + 0x1)::64 word)),1]::8 word) = ucast ((\<sigma> \<turnstile> *[(if' (strchr_0x17f0d_retval::64 word) = (ucast ((0x0::64 word))::64 word) then RCX\<^sub>0 else (((strchr_0x17f0d_retval::64 word) + 0x1)::64 word)),1]::8 word))\<close>
declare Q_0x55db_41_def[Qs]

schematic_goal path_combine_0_6_0x55b7_0x55d9_41[blocks]:
  assumes \<open>(P_0x55b7_true_41 && P_0x55b7_true_41_regions && CF) \<sigma>\<close>
  shows \<open>exec_block 6 0x55d9 41 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x55db_41 ?\<sigma> \<and> block_usage P_0x55b7_true_41_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x55b7_true_41_def P_0x55b7_true_41_regions_def post: Q_0x55db_41_def regionset: P_0x55b7_true_41_regions_set_def)

definition P_0x55db_true_42 :: state_pred where
  \<open>P_0x55db_true_42 \<sigma> \<equiv> RIP \<sigma> = 0x55db \<and> RAX \<sigma> = (((sextend (ucast ((\<langle>31,0\<rangle>strlen_0x55ad_retval::32 word))) 32 64::64 word)::64 word) + RDI\<^sub>0) \<and> RBX \<sigma> = (((sextend (ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word))) 32 64::64 word)::64 word) - 0x1) \<and> RCX \<sigma> = ((RCX\<^sub>0::64 word) + 0x1) \<and> RDX \<sigma> = ucast ((\<sigma> \<turnstile> *[RCX\<^sub>0,1]::8 word)) \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = (sextend (ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word))) 32 64::64 word) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x18) \<and> RBP \<sigma> = RDI\<^sub>0 \<and> R15 \<sigma> = R15\<^sub>0 \<and> R14 \<sigma> = R14\<^sub>0 \<and> R13 \<sigma> = R13\<^sub>0 \<and> R12 \<sigma> = RCX\<^sub>0 \<and> (\<sigma> \<turnstile> *[RCX\<^sub>0,1]::8 word) = ucast ((\<sigma> \<turnstile> *[RCX\<^sub>0,1]::8 word)) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = 0x55b2 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = 0x17f7d \<and> (\<sigma> \<turnstile> *[(if' (strchr_0x17f0d_retval::64 word) = (ucast ((0x0::64 word))::64 word) then RCX\<^sub>0 else (((strchr_0x17f0d_retval::64 word) + 0x1)::64 word)),1]::8 word) = ucast ((\<sigma> \<turnstile> *[(if' (strchr_0x17f0d_retval::64 word) = (ucast ((0x0::64 word))::64 word) then RCX\<^sub>0 else (((strchr_0x17f0d_retval::64 word) + 0x1)::64 word)),1]::8 word))\<close>
declare P_0x55db_true_42_def[Ps]

definition P_0x55db_true_42_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x55db_true_42_regions_set \<sigma> \<equiv> {
    (0, RCX\<^sub>0, Suc 0),
    (1, RSP\<^sub>0, 8),
    (2, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x40), 8),
    (9, (if' (strchr_0x17f0d_retval::64 word) = (ucast ((0x0::64 word))::64 word) then RCX\<^sub>0 else (((strchr_0x17f0d_retval::64 word) + 0x1)::64 word)), Suc 0)
  }\<close>

definition P_0x55db_true_42_regions :: state_pred where
  \<open>P_0x55db_true_42_regions \<sigma> \<equiv> \<exists>regions. P_0x55db_true_42_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x5608_42 :: state_pred where
  \<open>Q_0x5608_42 \<sigma> \<equiv> RIP \<sigma> = 0x5608 \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = (sextend (ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word))) 32 64::64 word) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x18) \<and> RBP \<sigma> = RDI\<^sub>0 \<and> R15 \<sigma> = R15\<^sub>0 \<and> R14 \<sigma> = R14\<^sub>0 \<and> R13 \<sigma> = R13\<^sub>0 \<and> R12 \<sigma> = RCX\<^sub>0 \<and> (\<sigma> \<turnstile> *[RCX\<^sub>0,1]::8 word) = ucast ((\<sigma> \<turnstile> *[RCX\<^sub>0,1]::8 word)) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = 0x55b2 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = 0x17f7d \<and> (\<sigma> \<turnstile> *[(if' (strchr_0x17f0d_retval::64 word) = (ucast ((0x0::64 word))::64 word) then RCX\<^sub>0 else (((strchr_0x17f0d_retval::64 word) + 0x1)::64 word)),1]::8 word) = ucast ((\<sigma> \<turnstile> *[(if' (strchr_0x17f0d_retval::64 word) = (ucast ((0x0::64 word))::64 word) then RCX\<^sub>0 else (((strchr_0x17f0d_retval::64 word) + 0x1)::64 word)),1]::8 word))\<close>
declare Q_0x5608_42_def[Qs]

schematic_goal path_combine_0_1_0x55db_0x55db_42[blocks]:
  assumes \<open>(P_0x55db_true_42 && P_0x55db_true_42_regions && ZF) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x55db 42 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x5608_42 ?\<sigma> \<and> block_usage P_0x55db_true_42_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x55db_true_42_def P_0x55db_true_42_regions_def post: Q_0x5608_42_def regionset: P_0x55db_true_42_regions_set_def)

definition P_0x55db_false_43 :: state_pred where
  \<open>P_0x55db_false_43 \<sigma> \<equiv> RIP \<sigma> = 0x55db \<and> RAX \<sigma> = (((sextend (ucast ((\<langle>31,0\<rangle>strlen_0x55ad_retval::32 word))) 32 64::64 word)::64 word) + RDI\<^sub>0) \<and> RBX \<sigma> = (((sextend (ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word))) 32 64::64 word)::64 word) - 0x1) \<and> RCX \<sigma> = ((RCX\<^sub>0::64 word) + 0x1) \<and> RDX \<sigma> = ucast ((\<sigma> \<turnstile> *[RCX\<^sub>0,1]::8 word)) \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = (sextend (ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word))) 32 64::64 word) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x18) \<and> RBP \<sigma> = RDI\<^sub>0 \<and> R15 \<sigma> = R15\<^sub>0 \<and> R14 \<sigma> = R14\<^sub>0 \<and> R13 \<sigma> = R13\<^sub>0 \<and> R12 \<sigma> = RCX\<^sub>0 \<and> (\<sigma> \<turnstile> *[RCX\<^sub>0,1]::8 word) = ucast ((\<sigma> \<turnstile> *[RCX\<^sub>0,1]::8 word)) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = 0x55b2 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = 0x17f7d \<and> (\<sigma> \<turnstile> *[(if' (strchr_0x17f0d_retval::64 word) = (ucast ((0x0::64 word))::64 word) then RCX\<^sub>0 else (((strchr_0x17f0d_retval::64 word) + 0x1)::64 word)),1]::8 word) = ucast ((\<sigma> \<turnstile> *[(if' (strchr_0x17f0d_retval::64 word) = (ucast ((0x0::64 word))::64 word) then RCX\<^sub>0 else (((strchr_0x17f0d_retval::64 word) + 0x1)::64 word)),1]::8 word))\<close>
declare P_0x55db_false_43_def[Ps]

definition P_0x55db_false_43_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x55db_false_43_regions_set \<sigma> \<equiv> {
    (0, RCX\<^sub>0, Suc 0),
    (1, RSP\<^sub>0, 8),
    (2, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x40), 8),
    (9, (if' (strchr_0x17f0d_retval::64 word) = (ucast ((0x0::64 word))::64 word) then RCX\<^sub>0 else (((strchr_0x17f0d_retval::64 word) + 0x1)::64 word)), Suc 0)
  }\<close>

definition P_0x55db_false_43_regions :: state_pred where
  \<open>P_0x55db_false_43_regions \<sigma> \<equiv> \<exists>regions. P_0x55db_false_43_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x55e3_43 :: state_pred where
  \<open>Q_0x55e3_43 \<sigma> \<equiv> RIP \<sigma> = 0x55e3 \<and> RAX \<sigma> = (((sextend (ucast ((\<langle>31,0\<rangle>strlen_0x55ad_retval::32 word))) 32 64::64 word)::64 word) + RDI\<^sub>0) \<and> RBX \<sigma> = (((((sextend (ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word))) 32 64::64 word)::64 word) + RDI\<^sub>0)::64 word) - 0x1) \<and> RCX \<sigma> = ((RCX\<^sub>0::64 word) + 0x1) \<and> RDX \<sigma> = ucast ((\<sigma> \<turnstile> *[RCX\<^sub>0,1]::8 word)) \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = (sextend (ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word))) 32 64::64 word) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x18) \<and> RBP \<sigma> = RDI\<^sub>0 \<and> R15 \<sigma> = R15\<^sub>0 \<and> R14 \<sigma> = R14\<^sub>0 \<and> R13 \<sigma> = R13\<^sub>0 \<and> R12 \<sigma> = RCX\<^sub>0 \<and> (\<sigma> \<turnstile> *[RCX\<^sub>0,1]::8 word) = ucast ((\<sigma> \<turnstile> *[RCX\<^sub>0,1]::8 word)) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = 0x55b2 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = 0x17f7d \<and> (\<sigma> \<turnstile> *[(if' (strchr_0x17f0d_retval::64 word) = (ucast ((0x0::64 word))::64 word) then RCX\<^sub>0 else (((strchr_0x17f0d_retval::64 word) + 0x1)::64 word)),1]::8 word) = ucast ((\<sigma> \<turnstile> *[(if' (strchr_0x17f0d_retval::64 word) = (ucast ((0x0::64 word))::64 word) then RCX\<^sub>0 else (((strchr_0x17f0d_retval::64 word) + 0x1)::64 word)),1]::8 word))\<close>
declare Q_0x55e3_43_def[Qs]

schematic_goal path_combine_0_3_0x55db_0x55e0_43[blocks]:
  assumes \<open>(P_0x55db_false_43 && P_0x55db_false_43_regions && ! ZF) \<sigma>\<close>
  shows \<open>exec_block 3 0x55e0 43 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x55e3_43 ?\<sigma> \<and> block_usage P_0x55db_false_43_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x55db_false_43_def P_0x55db_false_43_regions_def post: Q_0x55e3_43_def regionset: P_0x55db_false_43_regions_set_def)

definition P_0x55e3_true_44 :: state_pred where
  \<open>P_0x55e3_true_44 \<sigma> \<equiv> RIP \<sigma> = 0x55e3 \<and> RAX \<sigma> = (((sextend (ucast ((\<langle>31,0\<rangle>strlen_0x55ad_retval::32 word))) 32 64::64 word)::64 word) + RDI\<^sub>0) \<and> RBX \<sigma> = (((((sextend (ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word))) 32 64::64 word)::64 word) + RDI\<^sub>0)::64 word) - 0x1) \<and> RCX \<sigma> = ((RCX\<^sub>0::64 word) + 0x1) \<and> RDX \<sigma> = ucast ((\<sigma> \<turnstile> *[RCX\<^sub>0,1]::8 word)) \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = (sextend (ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word))) 32 64::64 word) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x18) \<and> RBP \<sigma> = RDI\<^sub>0 \<and> R15 \<sigma> = R15\<^sub>0 \<and> R14 \<sigma> = R14\<^sub>0 \<and> R13 \<sigma> = R13\<^sub>0 \<and> R12 \<sigma> = RCX\<^sub>0 \<and> (\<sigma> \<turnstile> *[RCX\<^sub>0,1]::8 word) = ucast ((\<sigma> \<turnstile> *[RCX\<^sub>0,1]::8 word)) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = 0x55b2 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = 0x17f7d \<and> (\<sigma> \<turnstile> *[(if' (strchr_0x17f0d_retval::64 word) = (ucast ((0x0::64 word))::64 word) then RCX\<^sub>0 else (((strchr_0x17f0d_retval::64 word) + 0x1)::64 word)),1]::8 word) = ucast ((\<sigma> \<turnstile> *[(if' (strchr_0x17f0d_retval::64 word) = (ucast ((0x0::64 word))::64 word) then RCX\<^sub>0 else (((strchr_0x17f0d_retval::64 word) + 0x1)::64 word)),1]::8 word))\<close>
declare P_0x55e3_true_44_def[Ps]

definition P_0x55e3_true_44_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x55e3_true_44_regions_set \<sigma> \<equiv> {
    (0, RCX\<^sub>0, Suc 0),
    (1, RSP\<^sub>0, 8),
    (2, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x40), 8),
    (9, (if' (strchr_0x17f0d_retval::64 word) = (ucast ((0x0::64 word))::64 word) then RCX\<^sub>0 else (((strchr_0x17f0d_retval::64 word) + 0x1)::64 word)), Suc 0)
  }\<close>

definition P_0x55e3_true_44_regions :: state_pred where
  \<open>P_0x55e3_true_44_regions \<sigma> \<equiv> \<exists>regions. P_0x55e3_true_44_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x55f5_44 :: state_pred where
  \<open>Q_0x55f5_44 \<sigma> \<equiv> RIP \<sigma> = 0x55f5 \<and> RBX \<sigma> = (((((sextend (ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word))) 32 64::64 word)::64 word) + RDI\<^sub>0)::64 word) - 0x1) \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = (sextend (ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word))) 32 64::64 word) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x18) \<and> RBP \<sigma> = RDI\<^sub>0 \<and> R15 \<sigma> = R15\<^sub>0 \<and> R14 \<sigma> = R14\<^sub>0 \<and> R13 \<sigma> = R13\<^sub>0 \<and> R12 \<sigma> = RCX\<^sub>0 \<and> (\<sigma> \<turnstile> *[RCX\<^sub>0,1]::8 word) = ucast ((\<sigma> \<turnstile> *[RCX\<^sub>0,1]::8 word)) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = 0x55b2 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = 0x17f7d \<and> (\<sigma> \<turnstile> *[(if' (strchr_0x17f0d_retval::64 word) = (ucast ((0x0::64 word))::64 word) then RCX\<^sub>0 else (((strchr_0x17f0d_retval::64 word) + 0x1)::64 word)),1]::8 word) = ucast ((\<sigma> \<turnstile> *[(if' (strchr_0x17f0d_retval::64 word) = (ucast ((0x0::64 word))::64 word) then RCX\<^sub>0 else (((strchr_0x17f0d_retval::64 word) + 0x1)::64 word)),1]::8 word))\<close>
declare Q_0x55f5_44_def[Qs]

schematic_goal path_combine_0_1_0x55e3_0x55e3_44[blocks]:
  assumes \<open>(P_0x55e3_true_44 && P_0x55e3_true_44_regions && CF) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x55e3 44 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x55f5_44 ?\<sigma> \<and> block_usage P_0x55e3_true_44_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x55e3_true_44_def P_0x55e3_true_44_regions_def post: Q_0x55f5_44_def regionset: P_0x55e3_true_44_regions_set_def)

definition P_0x55f5_45 :: state_pred where
  \<open>P_0x55f5_45 \<sigma> \<equiv> RIP \<sigma> = 0x55f5 \<and> RBX \<sigma> = (((((sextend (ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word))) 32 64::64 word)::64 word) + RDI\<^sub>0)::64 word) - 0x1) \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = (sextend (ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word))) 32 64::64 word) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x18) \<and> RBP \<sigma> = RDI\<^sub>0 \<and> R15 \<sigma> = R15\<^sub>0 \<and> R14 \<sigma> = R14\<^sub>0 \<and> R13 \<sigma> = R13\<^sub>0 \<and> R12 \<sigma> = RCX\<^sub>0 \<and> (\<sigma> \<turnstile> *[RCX\<^sub>0,1]::8 word) = ucast ((\<sigma> \<turnstile> *[RCX\<^sub>0,1]::8 word)) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = 0x55b2 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = 0x17f7d \<and> (\<sigma> \<turnstile> *[(if' (strchr_0x17f0d_retval::64 word) = (ucast ((0x0::64 word))::64 word) then RCX\<^sub>0 else (((strchr_0x17f0d_retval::64 word) + 0x1)::64 word)),1]::8 word) = ucast ((\<sigma> \<turnstile> *[(if' (strchr_0x17f0d_retval::64 word) = (ucast ((0x0::64 word))::64 word) then RCX\<^sub>0 else (((strchr_0x17f0d_retval::64 word) + 0x1)::64 word)),1]::8 word))\<close>
declare P_0x55f5_45_def[Ps]

definition P_0x55f5_45_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x55f5_45_regions_set \<sigma> \<equiv> {
    (0, RAX \<sigma>, Suc 0),
    (1, RCX \<sigma>, Suc 0),
    (2, RCX\<^sub>0, Suc 0),
    (3, RSP\<^sub>0, 8),
    (4, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x40), 8),
    (11, (if' (strchr_0x17f0d_retval::64 word) = (ucast ((0x0::64 word))::64 word) then RCX\<^sub>0 else (((strchr_0x17f0d_retval::64 word) + 0x1)::64 word)), Suc 0)
  }\<close>

definition P_0x55f5_45_regions :: state_pred where
  \<open>P_0x55f5_45_regions \<sigma> \<equiv> \<exists>regions. P_0x55f5_45_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x5606_45 :: state_pred where
  \<open>Q_0x5606_45 \<sigma> \<equiv> RIP \<sigma> = 0x5606 \<and> RBX \<sigma> = (((((sextend (ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word))) 32 64::64 word)::64 word) + RDI\<^sub>0)::64 word) - 0x1) \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = (sextend (ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word))) 32 64::64 word) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x18) \<and> RBP \<sigma> = RDI\<^sub>0 \<and> R15 \<sigma> = R15\<^sub>0 \<and> R14 \<sigma> = R14\<^sub>0 \<and> R13 \<sigma> = R13\<^sub>0 \<and> R12 \<sigma> = RCX\<^sub>0 \<and> (\<sigma> \<turnstile> *[RCX\<^sub>0,1]::8 word) = ucast ((\<sigma> \<turnstile> *[RCX\<^sub>0,1]::8 word)) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = 0x55b2 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = 0x17f7d \<and> (\<sigma> \<turnstile> *[(if' (strchr_0x17f0d_retval::64 word) = (ucast ((0x0::64 word))::64 word) then RCX\<^sub>0 else (((strchr_0x17f0d_retval::64 word) + 0x1)::64 word)),1]::8 word) = ucast ((\<sigma> \<turnstile> *[(if' (strchr_0x17f0d_retval::64 word) = (ucast ((0x0::64 word))::64 word) then RCX\<^sub>0 else (((strchr_0x17f0d_retval::64 word) + 0x1)::64 word)),1]::8 word))\<close>
declare Q_0x5606_45_def[Qs]

schematic_goal path_combine_0_5_0x55f5_0x5604_45[blocks]:
  assumes \<open>(P_0x55f5_45 && P_0x55f5_45_regions) \<sigma>\<close>
  shows \<open>exec_block 5 0x5604 45 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x5606_45 ?\<sigma> \<and> block_usage P_0x55f5_45_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x55f5_45_def P_0x55f5_45_regions_def post: Q_0x5606_45_def regionset: P_0x55f5_45_regions_set_def)

definition P_0x5606_true_46 :: state_pred where
  \<open>P_0x5606_true_46 \<sigma> \<equiv> RIP \<sigma> = 0x5606 \<and> RBX \<sigma> = (((((sextend (ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word))) 32 64::64 word)::64 word) + RDI\<^sub>0)::64 word) - 0x1) \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = (sextend (ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word))) 32 64::64 word) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x18) \<and> RBP \<sigma> = RDI\<^sub>0 \<and> R15 \<sigma> = R15\<^sub>0 \<and> R14 \<sigma> = R14\<^sub>0 \<and> R13 \<sigma> = R13\<^sub>0 \<and> R12 \<sigma> = RCX\<^sub>0 \<and> (\<sigma> \<turnstile> *[RCX\<^sub>0,1]::8 word) = ucast ((\<sigma> \<turnstile> *[RCX\<^sub>0,1]::8 word)) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = 0x55b2 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = 0x17f7d \<and> (\<sigma> \<turnstile> *[(if' (strchr_0x17f0d_retval::64 word) = (ucast ((0x0::64 word))::64 word) then RCX\<^sub>0 else (((strchr_0x17f0d_retval::64 word) + 0x1)::64 word)),1]::8 word) = ucast ((\<sigma> \<turnstile> *[(if' (strchr_0x17f0d_retval::64 word) = (ucast ((0x0::64 word))::64 word) then RCX\<^sub>0 else (((strchr_0x17f0d_retval::64 word) + 0x1)::64 word)),1]::8 word))\<close>
declare P_0x5606_true_46_def[Ps]

definition P_0x5606_true_46_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x5606_true_46_regions_set \<sigma> \<equiv> {
    (0, RCX\<^sub>0, Suc 0),
    (1, RSP\<^sub>0, 8),
    (2, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x40), 8),
    (9, (if' (strchr_0x17f0d_retval::64 word) = (ucast ((0x0::64 word))::64 word) then RCX\<^sub>0 else (((strchr_0x17f0d_retval::64 word) + 0x1)::64 word)), Suc 0)
  }\<close>

definition P_0x5606_true_46_regions :: state_pred where
  \<open>P_0x5606_true_46_regions \<sigma> \<equiv> \<exists>regions. P_0x5606_true_46_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x55f3_46 :: state_pred where
  \<open>Q_0x55f3_46 \<sigma> \<equiv> RIP \<sigma> = 0x55f3 \<and> RBX \<sigma> = (((((sextend (ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word))) 32 64::64 word)::64 word) + RDI\<^sub>0)::64 word) - 0x1) \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = (sextend (ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word))) 32 64::64 word) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x18) \<and> RBP \<sigma> = RDI\<^sub>0 \<and> R15 \<sigma> = R15\<^sub>0 \<and> R14 \<sigma> = R14\<^sub>0 \<and> R13 \<sigma> = R13\<^sub>0 \<and> R12 \<sigma> = RCX\<^sub>0 \<and> (\<sigma> \<turnstile> *[RCX\<^sub>0,1]::8 word) = ucast ((\<sigma> \<turnstile> *[RCX\<^sub>0,1]::8 word)) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = 0x55b2 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = 0x17f7d \<and> (\<sigma> \<turnstile> *[(if' (strchr_0x17f0d_retval::64 word) = (ucast ((0x0::64 word))::64 word) then RCX\<^sub>0 else (((strchr_0x17f0d_retval::64 word) + 0x1)::64 word)),1]::8 word) = ucast ((\<sigma> \<turnstile> *[(if' (strchr_0x17f0d_retval::64 word) = (ucast ((0x0::64 word))::64 word) then RCX\<^sub>0 else (((strchr_0x17f0d_retval::64 word) + 0x1)::64 word)),1]::8 word))\<close>
declare Q_0x55f3_46_def[Qs]

schematic_goal path_combine_0_2_0x5606_0x55f0_46[blocks]:
  assumes \<open>(P_0x5606_true_46 && P_0x5606_true_46_regions && !ZF) \<sigma>\<close>
  shows \<open>exec_block 2 0x55f0 46 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x55f3_46 ?\<sigma> \<and> block_usage P_0x5606_true_46_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x5606_true_46_def P_0x5606_true_46_regions_def post: Q_0x55f3_46_def regionset: P_0x5606_true_46_regions_set_def)

definition P_0x55f3_true_47 :: state_pred where
  \<open>P_0x55f3_true_47 \<sigma> \<equiv> RIP \<sigma> = 0x55f3 \<and> RBX \<sigma> = (((((sextend (ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word))) 32 64::64 word)::64 word) + RDI\<^sub>0)::64 word) - 0x1) \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = (sextend (ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word))) 32 64::64 word) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x18) \<and> RBP \<sigma> = RDI\<^sub>0 \<and> R15 \<sigma> = R15\<^sub>0 \<and> R14 \<sigma> = R14\<^sub>0 \<and> R13 \<sigma> = R13\<^sub>0 \<and> R12 \<sigma> = RCX\<^sub>0 \<and> (\<sigma> \<turnstile> *[RCX\<^sub>0,1]::8 word) = ucast ((\<sigma> \<turnstile> *[RCX\<^sub>0,1]::8 word)) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = 0x55b2 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = 0x17f7d \<and> (\<sigma> \<turnstile> *[(if' (strchr_0x17f0d_retval::64 word) = (ucast ((0x0::64 word))::64 word) then RCX\<^sub>0 else (((strchr_0x17f0d_retval::64 word) + 0x1)::64 word)),1]::8 word) = ucast ((\<sigma> \<turnstile> *[(if' (strchr_0x17f0d_retval::64 word) = (ucast ((0x0::64 word))::64 word) then RCX\<^sub>0 else (((strchr_0x17f0d_retval::64 word) + 0x1)::64 word)),1]::8 word))\<close>
declare P_0x55f3_true_47_def[Ps]

definition P_0x55f3_true_47_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x55f3_true_47_regions_set \<sigma> \<equiv> {
    (0, RCX\<^sub>0, Suc 0),
    (1, RSP\<^sub>0, 8),
    (2, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x40), 8),
    (9, (if' (strchr_0x17f0d_retval::64 word) = (ucast ((0x0::64 word))::64 word) then RCX\<^sub>0 else (((strchr_0x17f0d_retval::64 word) + 0x1)::64 word)), Suc 0)
  }\<close>

definition P_0x55f3_true_47_regions :: state_pred where
  \<open>P_0x55f3_true_47_regions \<sigma> \<equiv> \<exists>regions. P_0x55f3_true_47_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x5608_47 :: state_pred where
  \<open>Q_0x5608_47 \<sigma> \<equiv> RIP \<sigma> = 0x5608 \<and> RBX \<sigma> = (((((sextend (ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word))) 32 64::64 word)::64 word) + RDI\<^sub>0)::64 word) - 0x1) \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = (sextend (ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word))) 32 64::64 word) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x18) \<and> RBP \<sigma> = RDI\<^sub>0 \<and> R15 \<sigma> = R15\<^sub>0 \<and> R14 \<sigma> = R14\<^sub>0 \<and> R13 \<sigma> = R13\<^sub>0 \<and> R12 \<sigma> = RCX\<^sub>0 \<and> (\<sigma> \<turnstile> *[RCX\<^sub>0,1]::8 word) = ucast ((\<sigma> \<turnstile> *[RCX\<^sub>0,1]::8 word)) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = 0x55b2 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = 0x17f7d \<and> (\<sigma> \<turnstile> *[(if' (strchr_0x17f0d_retval::64 word) = (ucast ((0x0::64 word))::64 word) then RCX\<^sub>0 else (((strchr_0x17f0d_retval::64 word) + 0x1)::64 word)),1]::8 word) = ucast ((\<sigma> \<turnstile> *[(if' (strchr_0x17f0d_retval::64 word) = (ucast ((0x0::64 word))::64 word) then RCX\<^sub>0 else (((strchr_0x17f0d_retval::64 word) + 0x1)::64 word)),1]::8 word))\<close>
declare Q_0x5608_47_def[Qs]

schematic_goal path_combine_0_1_0x55f3_0x55f3_47[blocks]:
  assumes \<open>(P_0x55f3_true_47 && P_0x55f3_true_47_regions && ZF) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x55f3 47 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x5608_47 ?\<sigma> \<and> block_usage P_0x55f3_true_47_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x55f3_true_47_def P_0x55f3_true_47_regions_def post: Q_0x5608_47_def regionset: P_0x55f3_true_47_regions_set_def)

definition P_0x55f3_false_48 :: state_pred where
  \<open>P_0x55f3_false_48 \<sigma> \<equiv> RIP \<sigma> = 0x55f3 \<and> RBX \<sigma> = (((((sextend (ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word))) 32 64::64 word)::64 word) + RDI\<^sub>0)::64 word) - 0x1) \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = (sextend (ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word))) 32 64::64 word) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x18) \<and> RBP \<sigma> = RDI\<^sub>0 \<and> R15 \<sigma> = R15\<^sub>0 \<and> R14 \<sigma> = R14\<^sub>0 \<and> R13 \<sigma> = R13\<^sub>0 \<and> R12 \<sigma> = RCX\<^sub>0 \<and> (\<sigma> \<turnstile> *[RCX\<^sub>0,1]::8 word) = ucast ((\<sigma> \<turnstile> *[RCX\<^sub>0,1]::8 word)) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = 0x55b2 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = 0x17f7d \<and> (\<sigma> \<turnstile> *[(if' (strchr_0x17f0d_retval::64 word) = (ucast ((0x0::64 word))::64 word) then RCX\<^sub>0 else (((strchr_0x17f0d_retval::64 word) + 0x1)::64 word)),1]::8 word) = ucast ((\<sigma> \<turnstile> *[(if' (strchr_0x17f0d_retval::64 word) = (ucast ((0x0::64 word))::64 word) then RCX\<^sub>0 else (((strchr_0x17f0d_retval::64 word) + 0x1)::64 word)),1]::8 word))\<close>
declare P_0x55f3_false_48_def[Ps]

definition P_0x55f3_false_48_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x55f3_false_48_regions_set \<sigma> \<equiv> {
    (0, RCX\<^sub>0, Suc 0),
    (1, RSP\<^sub>0, 8),
    (2, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x40), 8),
    (9, (if' (strchr_0x17f0d_retval::64 word) = (ucast ((0x0::64 word))::64 word) then RCX\<^sub>0 else (((strchr_0x17f0d_retval::64 word) + 0x1)::64 word)), Suc 0)
  }\<close>

definition P_0x55f3_false_48_regions :: state_pred where
  \<open>P_0x55f3_false_48_regions \<sigma> \<equiv> \<exists>regions. P_0x55f3_false_48_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x55f5_48 :: state_pred where
  \<open>Q_0x55f5_48 \<sigma> \<equiv> RIP \<sigma> = 0x55f5 \<and> RBX \<sigma> = (((((sextend (ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word))) 32 64::64 word)::64 word) + RDI\<^sub>0)::64 word) - 0x1) \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = (sextend (ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word))) 32 64::64 word) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x18) \<and> RBP \<sigma> = RDI\<^sub>0 \<and> R15 \<sigma> = R15\<^sub>0 \<and> R14 \<sigma> = R14\<^sub>0 \<and> R13 \<sigma> = R13\<^sub>0 \<and> R12 \<sigma> = RCX\<^sub>0 \<and> (\<sigma> \<turnstile> *[RCX\<^sub>0,1]::8 word) = ucast ((\<sigma> \<turnstile> *[RCX\<^sub>0,1]::8 word)) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = 0x55b2 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = 0x17f7d \<and> (\<sigma> \<turnstile> *[(if' (strchr_0x17f0d_retval::64 word) = (ucast ((0x0::64 word))::64 word) then RCX\<^sub>0 else (((strchr_0x17f0d_retval::64 word) + 0x1)::64 word)),1]::8 word) = ucast ((\<sigma> \<turnstile> *[(if' (strchr_0x17f0d_retval::64 word) = (ucast ((0x0::64 word))::64 word) then RCX\<^sub>0 else (((strchr_0x17f0d_retval::64 word) + 0x1)::64 word)),1]::8 word))\<close>
declare Q_0x55f5_48_def[Qs]

schematic_goal path_combine_0_1_0x55f3_0x55f3_48[blocks]:
  assumes \<open>(P_0x55f3_false_48 && P_0x55f3_false_48_regions && ! ZF) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x55f3 48 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x55f5_48 ?\<sigma> \<and> block_usage P_0x55f3_false_48_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x55f3_false_48_def P_0x55f3_false_48_regions_def post: Q_0x55f5_48_def regionset: P_0x55f3_false_48_regions_set_def)

definition P_0x5606_false_49 :: state_pred where
  \<open>P_0x5606_false_49 \<sigma> \<equiv> RIP \<sigma> = 0x5606 \<and> RBX \<sigma> = (((((sextend (ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word))) 32 64::64 word)::64 word) + RDI\<^sub>0)::64 word) - 0x1) \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = (sextend (ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word))) 32 64::64 word) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x18) \<and> RBP \<sigma> = RDI\<^sub>0 \<and> R15 \<sigma> = R15\<^sub>0 \<and> R14 \<sigma> = R14\<^sub>0 \<and> R13 \<sigma> = R13\<^sub>0 \<and> R12 \<sigma> = RCX\<^sub>0 \<and> (\<sigma> \<turnstile> *[RCX\<^sub>0,1]::8 word) = ucast ((\<sigma> \<turnstile> *[RCX\<^sub>0,1]::8 word)) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = 0x55b2 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = 0x17f7d \<and> (\<sigma> \<turnstile> *[(if' (strchr_0x17f0d_retval::64 word) = (ucast ((0x0::64 word))::64 word) then RCX\<^sub>0 else (((strchr_0x17f0d_retval::64 word) + 0x1)::64 word)),1]::8 word) = ucast ((\<sigma> \<turnstile> *[(if' (strchr_0x17f0d_retval::64 word) = (ucast ((0x0::64 word))::64 word) then RCX\<^sub>0 else (((strchr_0x17f0d_retval::64 word) + 0x1)::64 word)),1]::8 word))\<close>
declare P_0x5606_false_49_def[Ps]

definition P_0x5606_false_49_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x5606_false_49_regions_set \<sigma> \<equiv> {
    (0, RCX\<^sub>0, Suc 0),
    (1, RSP\<^sub>0, 8),
    (2, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x40), 8),
    (9, (if' (strchr_0x17f0d_retval::64 word) = (ucast ((0x0::64 word))::64 word) then RCX\<^sub>0 else (((strchr_0x17f0d_retval::64 word) + 0x1)::64 word)), Suc 0)
  }\<close>

definition P_0x5606_false_49_regions :: state_pred where
  \<open>P_0x5606_false_49_regions \<sigma> \<equiv> \<exists>regions. P_0x5606_false_49_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x5608_49 :: state_pred where
  \<open>Q_0x5608_49 \<sigma> \<equiv> RIP \<sigma> = 0x5608 \<and> RBX \<sigma> = (((((sextend (ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word))) 32 64::64 word)::64 word) + RDI\<^sub>0)::64 word) - 0x1) \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = (sextend (ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word))) 32 64::64 word) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x18) \<and> RBP \<sigma> = RDI\<^sub>0 \<and> R15 \<sigma> = R15\<^sub>0 \<and> R14 \<sigma> = R14\<^sub>0 \<and> R13 \<sigma> = R13\<^sub>0 \<and> R12 \<sigma> = RCX\<^sub>0 \<and> (\<sigma> \<turnstile> *[RCX\<^sub>0,1]::8 word) = ucast ((\<sigma> \<turnstile> *[RCX\<^sub>0,1]::8 word)) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = 0x55b2 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = 0x17f7d \<and> (\<sigma> \<turnstile> *[(if' (strchr_0x17f0d_retval::64 word) = (ucast ((0x0::64 word))::64 word) then RCX\<^sub>0 else (((strchr_0x17f0d_retval::64 word) + 0x1)::64 word)),1]::8 word) = ucast ((\<sigma> \<turnstile> *[(if' (strchr_0x17f0d_retval::64 word) = (ucast ((0x0::64 word))::64 word) then RCX\<^sub>0 else (((strchr_0x17f0d_retval::64 word) + 0x1)::64 word)),1]::8 word))\<close>
declare Q_0x5608_49_def[Qs]

schematic_goal path_combine_0_1_0x5606_0x5606_49[blocks]:
  assumes \<open>(P_0x5606_false_49 && P_0x5606_false_49_regions && ! !ZF) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x5606 49 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x5608_49 ?\<sigma> \<and> block_usage P_0x5606_false_49_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x5606_false_49_def P_0x5606_false_49_regions_def post: Q_0x5608_49_def regionset: P_0x5606_false_49_regions_set_def)

definition P_0x55e3_false_50 :: state_pred where
  \<open>P_0x55e3_false_50 \<sigma> \<equiv> RIP \<sigma> = 0x55e3 \<and> RAX \<sigma> = (((sextend (ucast ((\<langle>31,0\<rangle>strlen_0x55ad_retval::32 word))) 32 64::64 word)::64 word) + RDI\<^sub>0) \<and> RBX \<sigma> = (((((sextend (ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word))) 32 64::64 word)::64 word) + RDI\<^sub>0)::64 word) - 0x1) \<and> RCX \<sigma> = ((RCX\<^sub>0::64 word) + 0x1) \<and> RDX \<sigma> = ucast ((\<sigma> \<turnstile> *[RCX\<^sub>0,1]::8 word)) \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = (sextend (ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word))) 32 64::64 word) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x18) \<and> RBP \<sigma> = RDI\<^sub>0 \<and> R15 \<sigma> = R15\<^sub>0 \<and> R14 \<sigma> = R14\<^sub>0 \<and> R13 \<sigma> = R13\<^sub>0 \<and> R12 \<sigma> = RCX\<^sub>0 \<and> (\<sigma> \<turnstile> *[RCX\<^sub>0,1]::8 word) = ucast ((\<sigma> \<turnstile> *[RCX\<^sub>0,1]::8 word)) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = 0x55b2 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = 0x17f7d \<and> (\<sigma> \<turnstile> *[(if' (strchr_0x17f0d_retval::64 word) = (ucast ((0x0::64 word))::64 word) then RCX\<^sub>0 else (((strchr_0x17f0d_retval::64 word) + 0x1)::64 word)),1]::8 word) = ucast ((\<sigma> \<turnstile> *[(if' (strchr_0x17f0d_retval::64 word) = (ucast ((0x0::64 word))::64 word) then RCX\<^sub>0 else (((strchr_0x17f0d_retval::64 word) + 0x1)::64 word)),1]::8 word))\<close>
declare P_0x55e3_false_50_def[Ps]

definition P_0x55e3_false_50_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x55e3_false_50_regions_set \<sigma> \<equiv> {
    (0, RCX\<^sub>0, Suc 0),
    (1, RSP\<^sub>0, 8),
    (2, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x40), 8),
    (9, (if' (strchr_0x17f0d_retval::64 word) = (ucast ((0x0::64 word))::64 word) then RCX\<^sub>0 else (((strchr_0x17f0d_retval::64 word) + 0x1)::64 word)), Suc 0)
  }\<close>

definition P_0x55e3_false_50_regions :: state_pred where
  \<open>P_0x55e3_false_50_regions \<sigma> \<equiv> \<exists>regions. P_0x55e3_false_50_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x5608_50 :: state_pred where
  \<open>Q_0x5608_50 \<sigma> \<equiv> RIP \<sigma> = 0x5608 \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = (sextend (ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word))) 32 64::64 word) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x18) \<and> RBP \<sigma> = RDI\<^sub>0 \<and> R15 \<sigma> = R15\<^sub>0 \<and> R14 \<sigma> = R14\<^sub>0 \<and> R13 \<sigma> = R13\<^sub>0 \<and> R12 \<sigma> = RCX\<^sub>0 \<and> (\<sigma> \<turnstile> *[RCX\<^sub>0,1]::8 word) = ucast ((\<sigma> \<turnstile> *[RCX\<^sub>0,1]::8 word)) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = 0x55b2 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = 0x17f7d \<and> (\<sigma> \<turnstile> *[(if' (strchr_0x17f0d_retval::64 word) = (ucast ((0x0::64 word))::64 word) then RCX\<^sub>0 else (((strchr_0x17f0d_retval::64 word) + 0x1)::64 word)),1]::8 word) = ucast ((\<sigma> \<turnstile> *[(if' (strchr_0x17f0d_retval::64 word) = (ucast ((0x0::64 word))::64 word) then RCX\<^sub>0 else (((strchr_0x17f0d_retval::64 word) + 0x1)::64 word)),1]::8 word))\<close>
declare Q_0x5608_50_def[Qs]

schematic_goal path_combine_0_2_0x55e3_0x55e5_50[blocks]:
  assumes \<open>(P_0x55e3_false_50 && P_0x55e3_false_50_regions && ! CF) \<sigma>\<close>
  shows \<open>exec_block 2 0x55e5 50 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x5608_50 ?\<sigma> \<and> block_usage P_0x55e3_false_50_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x55e3_false_50_def P_0x55e3_false_50_regions_def post: Q_0x5608_50_def regionset: P_0x55e3_false_50_regions_set_def)

definition P_0x5608_51 :: state_pred where
  \<open>P_0x5608_51 \<sigma> \<equiv> RIP \<sigma> = 0x5608 \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = (sextend (ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word))) 32 64::64 word) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x18) \<and> RBP \<sigma> = RDI\<^sub>0 \<and> R15 \<sigma> = R15\<^sub>0 \<and> R14 \<sigma> = R14\<^sub>0 \<and> R13 \<sigma> = R13\<^sub>0 \<and> R12 \<sigma> = RCX\<^sub>0 \<and> (\<sigma> \<turnstile> *[RCX\<^sub>0,1]::8 word) = ucast ((\<sigma> \<turnstile> *[RCX\<^sub>0,1]::8 word)) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = 0x55b2 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = 0x17f7d \<and> (\<sigma> \<turnstile> *[(if' (strchr_0x17f0d_retval::64 word) = (ucast ((0x0::64 word))::64 word) then RCX\<^sub>0 else (((strchr_0x17f0d_retval::64 word) + 0x1)::64 word)),1]::8 word) = ucast ((\<sigma> \<turnstile> *[(if' (strchr_0x17f0d_retval::64 word) = (ucast ((0x0::64 word))::64 word) then RCX\<^sub>0 else (((strchr_0x17f0d_retval::64 word) + 0x1)::64 word)),1]::8 word))\<close>
declare P_0x5608_51_def[Ps]

definition P_0x5608_51_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x5608_51_regions_set \<sigma> \<equiv> {
    (0, RAX \<sigma>, Suc 0),
    (1, RCX\<^sub>0, Suc 0),
    (2, RSP\<^sub>0, 8),
    (3, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x40), 8),
    (10, (if' (strchr_0x17f0d_retval::64 word) = (ucast ((0x0::64 word))::64 word) then RCX\<^sub>0 else (((strchr_0x17f0d_retval::64 word) + 0x1)::64 word)), Suc 0)
  }\<close>

definition P_0x5608_51_regions :: state_pred where
  \<open>P_0x5608_51_regions \<sigma> \<equiv> \<exists>regions. P_0x5608_51_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_ret_address_51 :: state_pred where
  \<open>Q_ret_address_51 \<sigma> \<equiv> RIP \<sigma> = ret_address \<and> RBX \<sigma> = RBX\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) + 0x8) \<and> RBP \<sigma> = RBP\<^sub>0 \<and> R15 \<sigma> = R15\<^sub>0 \<and> R14 \<sigma> = R14\<^sub>0 \<and> R13 \<sigma> = R13\<^sub>0 \<and> R12 \<sigma> = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address\<close>
declare Q_ret_address_51_def[Qs]

schematic_goal path_combine_0_6_0x5608_0x5612_51[blocks]:
  assumes \<open>(P_0x5608_51 && P_0x5608_51_regions) \<sigma>\<close>
  shows \<open>exec_block 6 0x5612 51 \<sigma> \<triangleq> ?\<sigma> \<and> Q_ret_address_51 ?\<sigma> \<and> block_usage P_0x5608_51_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x5608_51_def P_0x5608_51_regions_def post: Q_ret_address_51_def regionset: P_0x5608_51_regions_set_def)

definition P_0x55b7_false_52 :: state_pred where
  \<open>P_0x55b7_false_52 \<sigma> \<equiv> RIP \<sigma> = 0x55b7 \<and> RAX \<sigma> = (sextend (ucast ((\<langle>31,0\<rangle>strlen_0x55ad_retval::32 word))) 32 64::64 word) \<and> RBX \<sigma> = (sextend (ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word))) 32 64::64 word) \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = RCX\<^sub>0 \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = (sextend (ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word))) 32 64::64 word) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x18) \<and> RBP \<sigma> = RDI\<^sub>0 \<and> R15 \<sigma> = R15\<^sub>0 \<and> R14 \<sigma> = R14\<^sub>0 \<and> R13 \<sigma> = R13\<^sub>0 \<and> R12 \<sigma> = RCX\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = 0x55b2 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = 0x17f7d \<and> (\<sigma> \<turnstile> *[(if' (strchr_0x17f0d_retval::64 word) = (ucast ((0x0::64 word))::64 word) then RCX\<^sub>0 else (((strchr_0x17f0d_retval::64 word) + 0x1)::64 word)),1]::8 word) = ucast ((\<sigma> \<turnstile> *[(if' (strchr_0x17f0d_retval::64 word) = (ucast ((0x0::64 word))::64 word) then RCX\<^sub>0 else (((strchr_0x17f0d_retval::64 word) + 0x1)::64 word)),1]::8 word))\<close>
declare P_0x55b7_false_52_def[Ps]

definition P_0x55b7_false_52_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x55b7_false_52_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (2, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x40), 8),
    (8, (if' (strchr_0x17f0d_retval::64 word) = (ucast ((0x0::64 word))::64 word) then RCX\<^sub>0 else (((strchr_0x17f0d_retval::64 word) + 0x1)::64 word)), Suc 0)
  }\<close>

definition P_0x55b7_false_52_regions :: state_pred where
  \<open>P_0x55b7_false_52_regions \<sigma> \<equiv> \<exists>regions. P_0x55b7_false_52_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_ret_address_52 :: state_pred where
  \<open>Q_ret_address_52 \<sigma> \<equiv> RIP \<sigma> = ret_address \<and> RBX \<sigma> = RBX\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) + 0x8) \<and> RBP \<sigma> = RBP\<^sub>0 \<and> R15 \<sigma> = R15\<^sub>0 \<and> R14 \<sigma> = R14\<^sub>0 \<and> R13 \<sigma> = R13\<^sub>0 \<and> R12 \<sigma> = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address\<close>
declare Q_ret_address_52_def[Qs]

schematic_goal path_combine_0_6_0x55b7_0x55c0_52[blocks]:
  assumes \<open>(P_0x55b7_false_52 && P_0x55b7_false_52_regions && ! CF) \<sigma>\<close>
  shows \<open>exec_block 6 0x55c0 52 \<sigma> \<triangleq> ?\<sigma> \<and> Q_ret_address_52 ?\<sigma> \<and> block_usage P_0x55b7_false_52_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x55b7_false_52_def P_0x55b7_false_52_regions_def post: Q_ret_address_52_def regionset: P_0x55b7_false_52_regions_set_def)

definition path_combine_acode :: ACode where
  \<open>path_combine_acode =
    Block (Suc 0) 0x17ee0 0;
    IF jle THEN
      Block 2 0x17fa0 (Suc 0)
    ELSE
      Block 15 0x17f09 2;
      Block (Suc 0) 0x17f0d 3;
      CALL strchr_acode;
      Block 4 0x17f1d 4;
      IF ZF THEN
        Block 13 0x5560 5;
        IF ZF THEN
          Block (Suc 0) 0x5563 6
        ELSE
          Block 4 0x556c 7;
          IF ZF THEN
            Block (Suc 0) 0x556e 8
          ELSE
            Block 3 0x5575 9;
            IF CF THEN
              Block (Suc 0) 0x5578 10;
              WHILE P_0x5585_11 DO
                Block 5 0x5594 11;
                IF !ZF THEN
                  Block 2 0x5580 12;
                  IF ZF THEN
                    Block (Suc 0) 0x5583 13
                  ELSE
                    Block (Suc 0) 0x5583 14
                  FI
                ELSE
                  Block (Suc 0) 0x5596 15
                FI
              OD
            ELSE
              Block 2 0x557a 16
            FI
          FI;
          Block (Suc 0) 0x5598 17
        FI;
        Block (Suc 0) 0x559b 18
      ELSE
        Block 3 0x17f2b 19;
        Block (Suc 0) 0x17f2e 20;
        CALL strchr_acode;
        Block 3 0x17f3b 21;
        Block (Suc 0) 0x17f3e 22;
        CALL strrchr_acode;
        Block (Suc 0) 0x17f43 23;
        IF ZF THEN
          Block 3 0x17fbb 24;
          IF !ZF THEN
            Block 2 0x17f54 25;
            Block 4 0x17f62 26;
            IF jg THEN
              Block 4 0x17faf 27
            ELSE
              Block 4 0x17f6e 28
            FI
          ELSE
            Block 4 0x17fc5 29
          FI
        ELSE
          Block 4 0x17f4f 30;
          IF ZF THEN
            Block (Suc 0) 0x17f52 31
          ELSE
            Block 2 0x17f54 32
          FI;
          Block 4 0x17f62 33;
          IF jg THEN
            Block 4 0x17faf 34
          ELSE
            Block 4 0x17f6e 35
          FI
        FI;
        Block 2 0x17f75 36;
        Block (Suc 0) 0x17f78 37;
        CALL memcpy_acode;
        Block 18 0x55aa 38;
        Block (Suc 0) 0x55ad 39;
        CALL strlen_acode;
        Block 2 0x55b4 40;
        IF CF THEN
          Block 6 0x55d9 41;
          IF ZF THEN
            Block (Suc 0) 0x55db 42
          ELSE
            Block 3 0x55e0 43;
            IF CF THEN
              Block (Suc 0) 0x55e3 44;
              WHILE P_0x55f5_45 DO
                Block 5 0x5604 45;
                IF !ZF THEN
                  Block 2 0x55f0 46;
                  IF ZF THEN
                    Block (Suc 0) 0x55f3 47
                  ELSE
                    Block (Suc 0) 0x55f3 48
                  FI
                ELSE
                  Block (Suc 0) 0x5606 49
                FI
              OD
            ELSE
              Block 2 0x55e5 50
            FI
          FI;
          Block 6 0x5612 51
        ELSE
          Block 6 0x55c0 52
        FI
      FI
    FI
  \<close>

schematic_goal "path_combine":
  assumes
    \<open>\<forall>\<sigma>. RIP \<sigma> = 0x17ee2 \<longrightarrow> P_0x17ee2_true_1_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x17ee2 \<longrightarrow> P_0x17ee2_false_2_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x17f0d \<longrightarrow> P_0x17f0d_3_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x17f12 \<longrightarrow> P_0x17f12_4_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x17f20 \<longrightarrow> P_0x17f20_true_5_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x5563 \<longrightarrow> P_0x5563_true_6_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x5563 \<longrightarrow> P_0x5563_false_7_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x556e \<longrightarrow> P_0x556e_true_8_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x556e \<longrightarrow> P_0x556e_false_9_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x5578 \<longrightarrow> P_0x5578_true_10_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x5585 \<longrightarrow> P_0x5585_11_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x5596 \<longrightarrow> P_0x5596_true_12_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x5583 \<longrightarrow> P_0x5583_true_13_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x5583 \<longrightarrow> P_0x5583_false_14_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x5596 \<longrightarrow> P_0x5596_false_15_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x5578 \<longrightarrow> P_0x5578_false_16_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x5598 \<longrightarrow> P_0x5598_17_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x559b \<longrightarrow> P_0x559b_18_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x17f20 \<longrightarrow> P_0x17f20_false_19_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x17f2e \<longrightarrow> P_0x17f2e_20_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x17f33 \<longrightarrow> P_0x17f33_21_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x17f3e \<longrightarrow> P_0x17f3e_22_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x17f43 \<longrightarrow> P_0x17f43_23_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x17f46 \<longrightarrow> P_0x17f46_true_24_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x17fbe \<longrightarrow> P_0x17fbe_true_25_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x17f58 \<longrightarrow> P_0x17f58_26_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x17f65 \<longrightarrow> P_0x17f65_true_27_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x17f65 \<longrightarrow> P_0x17f65_false_28_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x17fbe \<longrightarrow> P_0x17fbe_false_29_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x17f46 \<longrightarrow> P_0x17f46_false_30_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x17f52 \<longrightarrow> P_0x17f52_true_31_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x17f52 \<longrightarrow> P_0x17f52_false_32_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x17f58 \<longrightarrow> P_0x17f58_33_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x17f65 \<longrightarrow> P_0x17f65_true_34_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x17f65 \<longrightarrow> P_0x17f65_false_35_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x17f72 \<longrightarrow> P_0x17f72_36_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x17f78 \<longrightarrow> P_0x17f78_37_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x17f7d \<longrightarrow> P_0x17f7d_38_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x55ad \<longrightarrow> P_0x55ad_39_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x55b2 \<longrightarrow> P_0x55b2_40_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x55b7 \<longrightarrow> P_0x55b7_true_41_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x55db \<longrightarrow> P_0x55db_true_42_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x55db \<longrightarrow> P_0x55db_false_43_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x55e3 \<longrightarrow> P_0x55e3_true_44_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x55f5 \<longrightarrow> P_0x55f5_45_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x5606 \<longrightarrow> P_0x5606_true_46_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x55f3 \<longrightarrow> P_0x55f3_true_47_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x55f3 \<longrightarrow> P_0x55f3_false_48_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x5606 \<longrightarrow> P_0x5606_false_49_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x55e3 \<longrightarrow> P_0x55e3_false_50_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x5608 \<longrightarrow> P_0x5608_51_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x55b7 \<longrightarrow> P_0x55b7_false_52_regions \<sigma>\<close>
    and [blocks]: \<open>{{Q_strchr_addr_0x17f0d_3}} \<box>strchr_acode {{P_0x17f12_4;M_0x17f0d}}\<close>
    and [blocks]: \<open>{{Q_strchr_addr_0x17f2e_20}} \<box>strchr_acode {{P_0x17f33_21;M_0x17f2e}}\<close>
    and [blocks]: \<open>{{Q_strrchr_addr_0x17f3e_22}} \<box>strrchr_acode {{P_0x17f43_23;M_0x17f3e}}\<close>
    and [blocks]: \<open>{{Q_memcpy_addr_0x17f78_37}} \<box>memcpy_acode {{P_0x17f7d_38;M_0x17f78}}\<close>
    and [blocks]: \<open>{{Q_strlen_addr_0x55ad_39}} \<box>strlen_acode {{P_0x55b2_40;M_0x55ad}}\<close>
  shows \<open>{{?P}} path_combine_acode {{?Q;?M}}\<close>
  apply (vcg acode: path_combine_acode_def assms: assms)
                      apply (vcg_while \<open>P_0x5585_11 || P_0x5598_17\<close> assms: assms)
                      apply (vcg_step assms: assms)+
                      apply (simp add: pred_logic Ps Qs)
                      apply simp
                      apply (vcg_step assms: assms)+
                      apply (simp add: assms)+
              apply (vcg_step assms: assms)+
                      apply (vcg_while \<open>P_0x55f5_45 || P_0x5608_51\<close> assms: assms)
                      apply (vcg_step assms: assms)+
                      apply (simp add: pred_logic Ps Qs)
                      apply simp
                      apply (vcg_step assms: assms)+
                      apply (simp add: assms)+
                      apply (vcg_step assms: assms)
  done

end

end
