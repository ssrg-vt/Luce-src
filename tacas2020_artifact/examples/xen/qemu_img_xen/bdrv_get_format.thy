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
theory bdrv_get_format
  imports "../../../isabelle/VCG/HTriple"
begin

locale "qemu_img_xen" = execution_context + exec_code +
  fixes bdrv_new_0x1909c_retval\<^sub>v bdrv_open2_0x190b3_retval\<^sub>v bdrv_delete_0x190e7_retval\<^sub>v qemu_memalign_0x1a2b3_retval\<^sub>v bdrv_aio_read_0x1a2db_retval\<^sub>v qemu_iovec_to_buffer_0x1a307_retval\<^sub>v bdrv_aio_write_0x1a323_retval\<^sub>v qemu_mallocz_0x1a346_retval\<^sub>v qemu_vfree_0x1a379_retval\<^sub>v bdrv_aio_read_addr bdrv_aio_write_addr bdrv_delete_addr bdrv_new_addr bdrv_open2_addr qemu_iovec_to_buffer_addr qemu_mallocz_addr qemu_memalign_addr qemu_vfree_addr :: \<open>64 word\<close>
    and bdrv_aio_read_acode bdrv_aio_write_acode bdrv_delete_acode bdrv_new_acode bdrv_open2_acode qemu_iovec_to_buffer_acode qemu_mallocz_acode qemu_memalign_acode qemu_vfree_acode :: ACode
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
    "fetch 0x19080 \<equiv> (Unary (IS_8088 Push) (Storage (Reg (General SixtyFour r13))), 2)"
    "fetch 0x19082 \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour r13)) (Storage (Reg (General SixtyFour rdi))), 3)"
    "fetch 0x19085 \<equiv> (Binary (IS_8088 Lea) (Reg (General SixtyFour rdi)) (Storage (Memory SixtyFour (A_Plus (A_FromReg (General SixtyFour rip)) (A_WordConstant 31702)))), 7)"
    "fetch 0x1908c \<equiv> (Unary (IS_8088 Push) (Storage (Reg (General SixtyFour r12))), 2)"
    "fetch 0x1908e \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour r12)) (Storage (Reg (General SixtyFour rsi))), 3)"
    "fetch 0x19091 \<equiv> (Unary (IS_8088 Push) (Storage (Reg (General SixtyFour rbp))), 1)"
    "fetch 0x19092 \<equiv> (Unary (IS_8088 Push) (Storage (Reg (General SixtyFour rbx))), 1)"
    "fetch 0x19093 \<equiv> (Binary (IS_8088 Mov) (Reg (General ThirtyTwo rbx)) (Storage (Reg (General ThirtyTwo rdx))), 2)"
    "fetch 0x19095 \<equiv> (Binary (IS_8088 Or) (Reg (General ThirtyTwo rbx)) (Immediate SixtyFour (ImmVal 16)), 3)"
    "fetch 0x19098 \<equiv> (Binary (IS_8088 Sub) (Reg (General SixtyFour rsp)) (Immediate SixtyFour (ImmVal 24)), 4)"
    "fetch 0x1909c \<equiv> (Unary (IS_8088 Call) (Immediate SixtyFour (ImmLabel ''bdrv_new'')), 5)"
    "fetch 0x190a1 \<equiv> (Binary (IS_8088 Mov) (Reg (General ThirtyTwo rdx)) (Storage (Reg (General ThirtyTwo rbx))), 2)"
    "fetch 0x190a3 \<equiv> (Binary (IS_8088 Lea) (Reg (General SixtyFour rcx)) (Storage (Memory SixtyFour (A_Plus (A_FromReg (General SixtyFour rip)) (A_WordConstant 69878)))), 7)"
    "fetch 0x190aa \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour rsi)) (Storage (Reg (General SixtyFour r12))), 3)"
    "fetch 0x190ad \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour rdi)) (Storage (Reg (General SixtyFour rax))), 3)"
    "fetch 0x190b0 \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour rbp)) (Storage (Reg (General SixtyFour rax))), 3)"
    "fetch 0x190b3 \<equiv> (Unary (IS_8088 Call) (Immediate SixtyFour (ImmLabel ''bdrv_open2'')), 5)"
    "fetch 0x190b8 \<equiv> (Binary (IS_8088 Test) (Reg (General ThirtyTwo rax)) (Storage (Reg (General ThirtyTwo rax))), 2)"
    "fetch 0x190ba \<equiv> (Unary (IS_8088 Js) (Immediate SixtyFour (ImmVal 102624)), 2)"
    "fetch 0x190bc \<equiv> (Binary (IS_8088 Mov) (Memory ThirtyTwo (A_SizeDirective 32 (A_Plus (A_FromReg (General SixtyFour rbp)) (A_WordConstant 2176)))) (Immediate SixtyFour (ImmVal 1)), 10)"
    "fetch 0x190c6 \<equiv> (Binary (IS_8088 Xor) (Reg (General ThirtyTwo rax)) (Storage (Reg (General ThirtyTwo rax))), 2)"
    "fetch 0x190c8 \<equiv> (Binary (IS_8088 Mov) (Memory SixtyFour (A_SizeDirective 64 (A_Plus (A_FromReg (General SixtyFour r13)) (A_WordConstant 0)))) (Storage (Reg (General SixtyFour rbp))), 4)"
    "fetch 0x190cc \<equiv> (Binary (IS_8088 Add) (Reg (General SixtyFour rsp)) (Immediate SixtyFour (ImmVal 24)), 4)"
    "fetch 0x190d0 \<equiv> (Unary (IS_8088 Pop) (Storage (Reg (General SixtyFour rbx))), 1)"
    "fetch 0x190d1 \<equiv> (Unary (IS_8088 Pop) (Storage (Reg (General SixtyFour rbp))), 1)"
    "fetch 0x190d2 \<equiv> (Unary (IS_8088 Pop) (Storage (Reg (General SixtyFour r12))), 2)"
    "fetch 0x190d4 \<equiv> (Unary (IS_8088 Pop) (Storage (Reg (General SixtyFour r13))), 2)"
    "fetch 0x190d6 \<equiv> (Nullary (IS_8088 Ret), 1)"
    "fetch 0x190d7 \<equiv> (Unary (IS_8088 Nop) (Storage (Memory Sixteen (A_SizeDirective 16 (A_Plus (A_FromReg (General SixtyFour rax)) (A_Plus (A_Mult 1 (A_FromReg (General SixtyFour rax))) (A_WordConstant 0)))))), 9)"
    "fetch 0x190e0 \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour rdi)) (Storage (Reg (General SixtyFour rbp))), 3)"
    "fetch 0x190e3 \<equiv> (Binary (IS_8088 Mov) (Memory ThirtyTwo (A_SizeDirective 32 (A_Plus (A_FromReg (General SixtyFour rsp)) (A_WordConstant 12)))) (Storage (Reg (General ThirtyTwo rax))), 4)"
    "fetch 0x190e7 \<equiv> (Unary (IS_8088 Call) (Immediate SixtyFour (ImmLabel ''bdrv_delete'')), 5)"
    "fetch 0x190ec \<equiv> (Binary (IS_8088 Mov) (Reg (General ThirtyTwo rax)) (Storage (Memory ThirtyTwo (A_SizeDirective 32 (A_Plus (A_FromReg (General SixtyFour rsp)) (A_WordConstant 12))))), 4)"
    "fetch 0x190f0 \<equiv> (Binary (IS_8088 Add) (Reg (General SixtyFour rsp)) (Immediate SixtyFour (ImmVal 24)), 4)"
    "fetch 0x190f4 \<equiv> (Unary (IS_8088 Pop) (Storage (Reg (General SixtyFour rbx))), 1)"
    "fetch 0x190f5 \<equiv> (Unary (IS_8088 Pop) (Storage (Reg (General SixtyFour rbp))), 1)"
    "fetch 0x190f6 \<equiv> (Unary (IS_8088 Pop) (Storage (Reg (General SixtyFour r12))), 2)"
    "fetch 0x190f8 \<equiv> (Unary (IS_8088 Pop) (Storage (Reg (General SixtyFour r13))), 2)"
    "fetch 0x190fa \<equiv> (Nullary (IS_8088 Ret), 1)"
    "fetch 0x195f0 \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour rax)) (Storage (Memory SixtyFour (A_SizeDirective 64 (A_Plus (A_FromReg (General SixtyFour rdi)) (A_WordConstant 56))))), 4)"
    "fetch 0x195f4 \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour rcx)) (Storage (Reg (General SixtyFour rsi))), 3)"
    "fetch 0x195f7 \<equiv> (Binary (IS_8088 Test) (Reg (General SixtyFour rax)) (Storage (Reg (General SixtyFour rax))), 3)"
    "fetch 0x195fa \<equiv> (Unary (IS_8088 Je) (Immediate SixtyFour (ImmVal 103952)), 2)"
    "fetch 0x195fc \<equiv> (Binary (IS_X86_64 Movsxd) (Reg (General SixtyFour rsi)) (Storage (Reg (General ThirtyTwo rdx))), 3)"
    "fetch 0x195ff \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour rdx)) (Storage (Memory SixtyFour (A_SizeDirective 64 (A_FromReg (General SixtyFour rax))))), 3)"
    "fetch 0x19602 \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour rdi)) (Storage (Reg (General SixtyFour rcx))), 3)"
    "fetch 0x19605 \<equiv> (Unary (IS_8088 Jmp) (Immediate SixtyFour (ImmVal 21856)), 5)"
    "fetch 0x1960a \<equiv> (Unary (IS_8088 Nop) (Storage (Memory Sixteen (A_SizeDirective 16 (A_Plus (A_FromReg (General SixtyFour rax)) (A_Plus (A_Mult 1 (A_FromReg (General SixtyFour rax))) (A_WordConstant 0)))))), 6)"
    "fetch 0x19610 \<equiv> (Binary (IS_8088 Mov) (Memory Eight (A_SizeDirective 8 (A_FromReg (General SixtyFour rsi)))) (Immediate SixtyFour (ImmVal 0)), 3)"
    "fetch 0x19613 \<equiv> (Nullary (IS_8088 Ret), 1)"
    "fetch 0x19614 \<equiv> (Unary (IS_8088 Nop) (Storage (Memory Sixteen (A_SizeDirective 16 (A_Plus (A_FromReg (General SixtyFour cs)) (A_Plus (A_FromReg (General SixtyFour rax)) (A_Plus (A_Mult 1 (A_FromReg (General SixtyFour rax))) (A_WordConstant 0))))))), 11)"
    "fetch 0x19aa0 \<equiv> (Binary (IS_8088 Cmp) (Memory SixtyFour (A_SizeDirective 64 (A_Plus (A_FromReg (General SixtyFour rdi)) (A_WordConstant 2128)))) (Immediate SixtyFour (ImmVal 0)), 8)"
    "fetch 0x19aa8 \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour rax)) (Storage (Reg (General SixtyFour rsi))), 3)"
    "fetch 0x19aab \<equiv> (Binary (IS_X86_64 Movsxd) (Reg (General SixtyFour rsi)) (Storage (Reg (General ThirtyTwo rdx))), 3)"
    "fetch 0x19aae \<equiv> (Unary (IS_8088 Je) (Immediate SixtyFour (ImmVal 105152)), 2)"
    "fetch 0x19ab0 \<equiv> (Binary (IS_8088 Lea) (Reg (General SixtyFour rdx)) (Storage (Memory SixtyFour (A_Plus (A_FromReg (General SixtyFour rdi)) (A_WordConstant 1096)))), 7)"
    "fetch 0x19ab7 \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour rdi)) (Storage (Reg (General SixtyFour rax))), 3)"
    "fetch 0x19aba \<equiv> (Unary (IS_8088 Jmp) (Immediate SixtyFour (ImmVal 21856)), 5)"
    "fetch 0x19abf \<equiv> (Nullary (IS_8088 Nop), 1)"
    "fetch 0x19ac0 \<equiv> (Binary (IS_8088 Lea) (Reg (General SixtyFour rdx)) (Storage (Memory SixtyFour (A_Plus (A_FromReg (General SixtyFour rip)) (A_WordConstant 29083)))), 7)"
    "fetch 0x19ac7 \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour rdi)) (Storage (Reg (General SixtyFour rax))), 3)"
    "fetch 0x19aca \<equiv> (Unary (IS_8088 Jmp) (Immediate SixtyFour (ImmVal 21856)), 5)"
    "fetch 0x1a260 \<equiv> (Unary (IS_8088 Push) (Storage (Reg (General SixtyFour r14))), 2)"
    "fetch 0x1a262 \<equiv> (Binary (IS_8088 Mov) (Reg (General ThirtyTwo r14)) (Storage (Reg (General ThirtyTwo rcx))), 3)"
    "fetch 0x1a265 \<equiv> (Unary (IS_8088 Push) (Storage (Reg (General SixtyFour r13))), 2)"
    "fetch 0x1a267 \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour r13)) (Storage (Reg (General SixtyFour rsi))), 3)"
    "fetch 0x1a26a \<equiv> (Unary (IS_8088 Push) (Storage (Reg (General SixtyFour r12))), 2)"
    "fetch 0x1a26c \<equiv> (Unary (IS_8088 Push) (Storage (Reg (General SixtyFour rbp))), 1)"
    "fetch 0x1a26d \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour rbp)) (Storage (Reg (General SixtyFour rdi))), 3)"
    "fetch 0x1a270 \<equiv> (Unary (IS_8088 Push) (Storage (Reg (General SixtyFour rbx))), 1)"
    "fetch 0x1a271 \<equiv> (Binary (IS_8088 Sub) (Reg (General SixtyFour rsp)) (Immediate SixtyFour (ImmVal 32)), 4)"
    "fetch 0x1a275 \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour rbx)) (Storage (Memory SixtyFour (A_SizeDirective 64 (A_Plus (A_FromReg (General SixtyFour rip)) (A_WordConstant 65828))))), 7)"
    "fetch 0x1a27c \<equiv> (Binary (IS_8088 Mov) (Reg (General ThirtyTwo r12)) (Storage (Memory ThirtyTwo (A_SizeDirective 32 (A_Plus (A_FromReg (General SixtyFour rsp)) (A_WordConstant 80))))), 5)"
    "fetch 0x1a281 \<equiv> (Binary (IS_8088 Test) (Reg (General SixtyFour rbx)) (Storage (Reg (General SixtyFour rbx))), 3)"
    "fetch 0x1a284 \<equiv> (Unary (IS_8088 Je) (Immediate SixtyFour (ImmVal 107312)), 6)"
    "fetch 0x1a28a \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour rax)) (Storage (Memory SixtyFour (A_SizeDirective 64 (A_Plus (A_FromReg (General SixtyFour rbx)) (A_WordConstant 32))))), 4)"
    "fetch 0x1a28e \<equiv> (Binary (IS_8088 Mov) (Memory SixtyFour (A_SizeDirective 64 (A_Plus (A_FromReg (General SixtyFour rip)) (A_WordConstant 65803)))) (Storage (Reg (General SixtyFour rax))), 7)"
    "fetch 0x1a295 \<equiv> (Binary (IS_8088 Mov) (Memory SixtyFour (A_SizeDirective 64 (A_Plus (A_FromReg (General SixtyFour rbx)) (A_WordConstant 8)))) (Storage (Reg (General SixtyFour rbp))), 4)"
    "fetch 0x1a299 \<equiv> (Binary (IS_8088 Mov) (Reg (General ThirtyTwo rsi)) (Storage (Reg (General ThirtyTwo r14))), 3)"
    "fetch 0x1a29c \<equiv> (Binary (IS_8088 Mov) (Reg (General ThirtyTwo rdi)) (Immediate SixtyFour (ImmVal 512)), 5)"
    "fetch 0x1a2a1 \<equiv> (Binary (IS_8088 Mov) (Memory SixtyFour (A_SizeDirective 64 (A_Plus (A_FromReg (General SixtyFour rbx)) (A_WordConstant 16)))) (Storage (Reg (General SixtyFour r8))), 4)"
    "fetch 0x1a2a5 \<equiv> (Binary (IS_8088 Shl) (Reg (General ThirtyTwo rsi)) (Immediate SixtyFour (ImmVal 9)), 3)"
    "fetch 0x1a2a8 \<equiv> (Binary (IS_8088 Mov) (Memory SixtyFour (A_SizeDirective 64 (A_Plus (A_FromReg (General SixtyFour rbx)) (A_WordConstant 24)))) (Storage (Reg (General SixtyFour r9))), 4)"
    "fetch 0x1a2ac \<equiv> (Binary (IS_X86_64 Movsxd) (Reg (General SixtyFour rsi)) (Storage (Reg (General ThirtyTwo rsi))), 3)"
    "fetch 0x1a2af \<equiv> (Binary (IS_8088 Mov) (Memory SixtyFour (A_SizeDirective 64 (A_Plus (A_FromReg (General SixtyFour rbx)) (A_WordConstant 40)))) (Storage (Reg (General SixtyFour rdx))), 4)"
    "fetch 0x1a2b3 \<equiv> (Unary (IS_8088 Call) (Immediate SixtyFour (ImmLabel ''qemu_memalign'')), 5)"
    "fetch 0x1a2b8 \<equiv> (Binary (IS_8088 Mov) (Memory ThirtyTwo (A_SizeDirective 32 (A_Plus (A_FromReg (General SixtyFour rbx)) (A_WordConstant 56)))) (Storage (Reg (General ThirtyTwo r12))), 4)"
    "fetch 0x1a2bc \<equiv> (Binary (IS_8088 Mov) (Memory SixtyFour (A_SizeDirective 64 (A_Plus (A_FromReg (General SixtyFour rbx)) (A_WordConstant 48)))) (Storage (Reg (General SixtyFour rax))), 4)"
    "fetch 0x1a2c0 \<equiv> (Binary (IS_8088 Test) (Reg (General ThirtyTwo r12)) (Storage (Reg (General ThirtyTwo r12))), 3)"
    "fetch 0x1a2c3 \<equiv> (Unary (IS_8088 Jne) (Immediate SixtyFour (ImmVal 107264)), 2)"
    "fetch 0x1a2c5 \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour r9)) (Storage (Reg (General SixtyFour rbx))), 3)"
    "fetch 0x1a2c8 \<equiv> (Binary (IS_8088 Lea) (Reg (General SixtyFour r8)) (Storage (Memory SixtyFour (A_Plus (A_FromReg (General SixtyFour rip)) (A_WordConstant (-9615))))), 7)"
    "fetch 0x1a2cf \<equiv> (Binary (IS_8088 Mov) (Reg (General ThirtyTwo rcx)) (Storage (Reg (General ThirtyTwo r14))), 3)"
    "fetch 0x1a2d2 \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour rdx)) (Storage (Reg (General SixtyFour rax))), 3)"
    "fetch 0x1a2d5 \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour rsi)) (Storage (Reg (General SixtyFour r13))), 3)"
    "fetch 0x1a2d8 \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour rdi)) (Storage (Reg (General SixtyFour rbp))), 3)"
    "fetch 0x1a2db \<equiv> (Unary (IS_8088 Call) (Immediate SixtyFour (ImmLabel ''bdrv_aio_read'')), 5)"
    "fetch 0x1a2e0 \<equiv> (Binary (IS_8088 Mov) (Memory SixtyFour (A_SizeDirective 64 (A_Plus (A_FromReg (General SixtyFour rbx)) (A_WordConstant 64)))) (Storage (Reg (General SixtyFour rax))), 4)"
    "fetch 0x1a2e4 \<equiv> (Binary (IS_8088 Test) (Reg (General SixtyFour rax)) (Storage (Reg (General SixtyFour rax))), 3)"
    "fetch 0x1a2e7 \<equiv> (Unary (IS_8088 Je) (Immediate SixtyFour (ImmVal 107376)), 6)"
    "fetch 0x1a2ed \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour rax)) (Storage (Reg (General SixtyFour rbx))), 3)"
    "fetch 0x1a2f0 \<equiv> (Binary (IS_8088 Add) (Reg (General SixtyFour rsp)) (Immediate SixtyFour (ImmVal 32)), 4)"
    "fetch 0x1a2f4 \<equiv> (Unary (IS_8088 Pop) (Storage (Reg (General SixtyFour rbx))), 1)"
    "fetch 0x1a2f5 \<equiv> (Unary (IS_8088 Pop) (Storage (Reg (General SixtyFour rbp))), 1)"
    "fetch 0x1a2f6 \<equiv> (Unary (IS_8088 Pop) (Storage (Reg (General SixtyFour r12))), 2)"
    "fetch 0x1a2f8 \<equiv> (Unary (IS_8088 Pop) (Storage (Reg (General SixtyFour r13))), 2)"
    "fetch 0x1a2fa \<equiv> (Unary (IS_8088 Pop) (Storage (Reg (General SixtyFour r14))), 2)"
    "fetch 0x1a2fc \<equiv> (Nullary (IS_8088 Ret), 1)"
    "fetch 0x1a2fd \<equiv> (Unary (IS_8088 Nop) (Storage (Memory ThirtyTwo (A_SizeDirective 32 (A_FromReg (General SixtyFour rax))))), 3)"
    "fetch 0x1a300 \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour rdi)) (Storage (Memory SixtyFour (A_SizeDirective 64 (A_Plus (A_FromReg (General SixtyFour rbx)) (A_WordConstant 40))))), 4)"
    "fetch 0x1a304 \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour rsi)) (Storage (Reg (General SixtyFour rax))), 3)"
    "fetch 0x1a307 \<equiv> (Unary (IS_8088 Call) (Immediate SixtyFour (ImmLabel ''qemu_iovec_to_buffer'')), 5)"
    "fetch 0x1a30c \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour rdx)) (Storage (Memory SixtyFour (A_SizeDirective 64 (A_Plus (A_FromReg (General SixtyFour rbx)) (A_WordConstant 48))))), 4)"
    "fetch 0x1a310 \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour r9)) (Storage (Reg (General SixtyFour rbx))), 3)"
    "fetch 0x1a313 \<equiv> (Binary (IS_8088 Mov) (Reg (General ThirtyTwo rcx)) (Storage (Reg (General ThirtyTwo r14))), 3)"
    "fetch 0x1a316 \<equiv> (Binary (IS_8088 Lea) (Reg (General SixtyFour r8)) (Storage (Memory SixtyFour (A_Plus (A_FromReg (General SixtyFour rip)) (A_WordConstant (-9693))))), 7)"
    "fetch 0x1a31d \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour rsi)) (Storage (Reg (General SixtyFour r13))), 3)"
    "fetch 0x1a320 \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour rdi)) (Storage (Reg (General SixtyFour rbp))), 3)"
    "fetch 0x1a323 \<equiv> (Unary (IS_8088 Call) (Immediate SixtyFour (ImmLabel ''bdrv_aio_write'')), 5)"
    "fetch 0x1a328 \<equiv> (Binary (IS_8088 Mov) (Memory SixtyFour (A_SizeDirective 64 (A_Plus (A_FromReg (General SixtyFour rbx)) (A_WordConstant 64)))) (Storage (Reg (General SixtyFour rax))), 4)"
    "fetch 0x1a32c \<equiv> (Unary (IS_8088 Jmp) (Immediate SixtyFour (ImmVal 107236)), 2)"
    "fetch 0x1a32e \<equiv> (Binary (IS_8088 Xchg) (Reg (General Sixteen rax)) (Storage (Reg (General Sixteen rax))), 2)"
    "fetch 0x1a330 \<equiv> (Binary (IS_X86_64 Movsxd) (Reg (General SixtyFour rdi)) (Storage (Memory ThirtyTwo (A_SizeDirective 32 (A_Plus (A_FromReg (General SixtyFour rip)) (A_WordConstant 65633))))), 7)"
    "fetch 0x1a337 \<equiv> (Binary (IS_8088 Mov) (Memory SixtyFour (A_SizeDirective 64 (A_Plus (A_FromReg (General SixtyFour rsp)) (A_WordConstant 24)))) (Storage (Reg (General SixtyFour r9))), 5)"
    "fetch 0x1a33c \<equiv> (Binary (IS_8088 Mov) (Memory SixtyFour (A_SizeDirective 64 (A_Plus (A_FromReg (General SixtyFour rsp)) (A_WordConstant 16)))) (Storage (Reg (General SixtyFour r8))), 5)"
    "fetch 0x1a341 \<equiv> (Binary (IS_8088 Mov) (Memory SixtyFour (A_SizeDirective 64 (A_Plus (A_FromReg (General SixtyFour rsp)) (A_WordConstant 8)))) (Storage (Reg (General SixtyFour rdx))), 5)"
    "fetch 0x1a346 \<equiv> (Unary (IS_8088 Call) (Immediate SixtyFour (ImmLabel ''qemu_mallocz'')), 5)"
    "fetch 0x1a34b \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour r9)) (Storage (Memory SixtyFour (A_SizeDirective 64 (A_Plus (A_FromReg (General SixtyFour rsp)) (A_WordConstant 24))))), 5)"
    "fetch 0x1a350 \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour r8)) (Storage (Memory SixtyFour (A_SizeDirective 64 (A_Plus (A_FromReg (General SixtyFour rsp)) (A_WordConstant 16))))), 5)"
    "fetch 0x1a355 \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour rbx)) (Storage (Reg (General SixtyFour rax))), 3)"
    "fetch 0x1a358 \<equiv> (Binary (IS_8088 Lea) (Reg (General SixtyFour rax)) (Storage (Memory SixtyFour (A_Plus (A_FromReg (General SixtyFour rip)) (A_WordConstant 65585)))), 7)"
    "fetch 0x1a35f \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour rdx)) (Storage (Memory SixtyFour (A_SizeDirective 64 (A_Plus (A_FromReg (General SixtyFour rsp)) (A_WordConstant 8))))), 5)"
    "fetch 0x1a364 \<equiv> (Binary (IS_8088 Mov) (Memory SixtyFour (A_SizeDirective 64 (A_FromReg (General SixtyFour rbx)))) (Storage (Reg (General SixtyFour rax))), 3)"
    "fetch 0x1a367 \<equiv> (Unary (IS_8088 Jmp) (Immediate SixtyFour (ImmVal 107157)), 5)"
    "fetch 0x1a36c \<equiv> (Unary (IS_8088 Nop) (Storage (Memory ThirtyTwo (A_SizeDirective 32 (A_Plus (A_FromReg (General SixtyFour rax)) (A_WordConstant 0))))), 4)"
    "fetch 0x1a370 \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour rdi)) (Storage (Memory SixtyFour (A_SizeDirective 64 (A_Plus (A_FromReg (General SixtyFour rbx)) (A_WordConstant 48))))), 4)"
    "fetch 0x1a374 \<equiv> (Binary (IS_8088 Mov) (Memory SixtyFour (A_SizeDirective 64 (A_Plus (A_FromReg (General SixtyFour rsp)) (A_WordConstant 8)))) (Storage (Reg (General SixtyFour rax))), 5)"
    "fetch 0x1a379 \<equiv> (Unary (IS_8088 Call) (Immediate SixtyFour (ImmLabel ''qemu_vfree'')), 5)"
    "fetch 0x1a37e \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour rdx)) (Storage (Memory SixtyFour (A_SizeDirective 64 (A_FromReg (General SixtyFour rbx))))), 3)"
    "fetch 0x1a381 \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour rax)) (Storage (Memory SixtyFour (A_SizeDirective 64 (A_Plus (A_FromReg (General SixtyFour rsp)) (A_WordConstant 8))))), 5)"
    "fetch 0x1a386 \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour rcx)) (Storage (Memory SixtyFour (A_SizeDirective 64 (A_Plus (A_FromReg (General SixtyFour rdx)) (A_WordConstant 16))))), 4)"
    "fetch 0x1a38a \<equiv> (Binary (IS_8088 Mov) (Memory SixtyFour (A_SizeDirective 64 (A_Plus (A_FromReg (General SixtyFour rbx)) (A_WordConstant 32)))) (Storage (Reg (General SixtyFour rcx))), 4)"
    "fetch 0x1a38e \<equiv> (Binary (IS_8088 Mov) (Memory SixtyFour (A_SizeDirective 64 (A_Plus (A_FromReg (General SixtyFour rdx)) (A_WordConstant 16)))) (Storage (Reg (General SixtyFour rbx))), 4)"
    "fetch 0x1a392 \<equiv> (Unary (IS_8088 Jmp) (Immediate SixtyFour (ImmVal 107248)), 5)"
    and \<alpha>_def: \<open>\<alpha> = \<lparr>text_sections = [], data_sections = [], labels_to_offsets = [], binary_offset = 0\<rparr>\<close>
    and bdrv_aio_read\<^sub>a\<^sub>d\<^sub>d\<^sub>r[simp]: \<open>the (label_to_address \<alpha> ''bdrv_aio_read'') = bdrv_aio_read_addr\<close>
    and bdrv_aio_write\<^sub>a\<^sub>d\<^sub>d\<^sub>r[simp]: \<open>the (label_to_address \<alpha> ''bdrv_aio_write'') = bdrv_aio_write_addr\<close>
    and bdrv_delete\<^sub>a\<^sub>d\<^sub>d\<^sub>r[simp]: \<open>the (label_to_address \<alpha> ''bdrv_delete'') = bdrv_delete_addr\<close>
    and bdrv_new\<^sub>a\<^sub>d\<^sub>d\<^sub>r[simp]: \<open>the (label_to_address \<alpha> ''bdrv_new'') = bdrv_new_addr\<close>
    and bdrv_open2\<^sub>a\<^sub>d\<^sub>d\<^sub>r[simp]: \<open>the (label_to_address \<alpha> ''bdrv_open2'') = bdrv_open2_addr\<close>
    and qemu_iovec_to_buffer\<^sub>a\<^sub>d\<^sub>d\<^sub>r[simp]: \<open>the (label_to_address \<alpha> ''qemu_iovec_to_buffer'') = qemu_iovec_to_buffer_addr\<close>
    and qemu_mallocz\<^sub>a\<^sub>d\<^sub>d\<^sub>r[simp]: \<open>the (label_to_address \<alpha> ''qemu_mallocz'') = qemu_mallocz_addr\<close>
    and qemu_memalign\<^sub>a\<^sub>d\<^sub>d\<^sub>r[simp]: \<open>the (label_to_address \<alpha> ''qemu_memalign'') = qemu_memalign_addr\<close>
    and qemu_vfree\<^sub>a\<^sub>d\<^sub>d\<^sub>r[simp]: \<open>the (label_to_address \<alpha> ''qemu_vfree'') = qemu_vfree_addr\<close>
begin

text \<open>Using definitions that don't get unfolded immediately prevents locale argument issues.\<close>
definition \<open>bdrv_new_0x1909c_retval \<equiv> bdrv_new_0x1909c_retval\<^sub>v\<close>
definition \<open>bdrv_open2_0x190b3_retval \<equiv> bdrv_open2_0x190b3_retval\<^sub>v\<close>
definition \<open>bdrv_delete_0x190e7_retval \<equiv> bdrv_delete_0x190e7_retval\<^sub>v\<close>
definition \<open>qemu_memalign_0x1a2b3_retval \<equiv> qemu_memalign_0x1a2b3_retval\<^sub>v\<close>
definition \<open>bdrv_aio_read_0x1a2db_retval \<equiv> bdrv_aio_read_0x1a2db_retval\<^sub>v\<close>
definition \<open>qemu_iovec_to_buffer_0x1a307_retval \<equiv> qemu_iovec_to_buffer_0x1a307_retval\<^sub>v\<close>
definition \<open>bdrv_aio_write_0x1a323_retval \<equiv> bdrv_aio_write_0x1a323_retval\<^sub>v\<close>
definition \<open>qemu_mallocz_0x1a346_retval \<equiv> qemu_mallocz_0x1a346_retval\<^sub>v\<close>
definition \<open>qemu_vfree_0x1a379_retval \<equiv> qemu_vfree_0x1a379_retval\<^sub>v\<close>

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

locale "bdrv_get_format" = "qemu_img_xen" +
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

definition P_0x195f0_0 :: state_pred where
  \<open>P_0x195f0_0 \<sigma> \<equiv> RIP \<sigma> = 0x195f0 \<and> RAX \<sigma> = RAX\<^sub>0 \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = RDX\<^sub>0 \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = RSP\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address\<close>
declare P_0x195f0_0_def[Ps]

definition P_0x195f0_0_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x195f0_0_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((RDI\<^sub>0::64 word) + 0x38), 8)
  }\<close>

definition P_0x195f0_0_regions :: state_pred where
  \<open>P_0x195f0_0_regions \<sigma> \<equiv> \<exists>regions. P_0x195f0_0_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x195fa_0 :: state_pred where
  \<open>Q_0x195fa_0 \<sigma> \<equiv> RIP \<sigma> = 0x195fa \<and> RAX \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x38),8]::64 word) \<and> RCX \<sigma> = RSI\<^sub>0 \<and> RDX \<sigma> = RDX\<^sub>0 \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = RSP\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x38),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x38),8]::64 word)\<close>
declare Q_0x195fa_0_def[Qs]

schematic_goal bdrv_get_format_0_3_0x195f0_0x195f7_0[blocks]:
  assumes \<open>(P_0x195f0_0 && P_0x195f0_0_regions) \<sigma>\<close>
  shows \<open>exec_block 3 0x195f7 0 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x195fa_0 ?\<sigma> \<and> block_usage P_0x195f0_0_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x195f0_0_def P_0x195f0_0_regions_def post: Q_0x195fa_0_def regionset: P_0x195f0_0_regions_set_def)

definition P_0x195fa_true_1 :: state_pred where
  \<open>P_0x195fa_true_1 \<sigma> \<equiv> RIP \<sigma> = 0x195fa \<and> RAX \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x38),8]::64 word) \<and> RCX \<sigma> = RSI\<^sub>0 \<and> RDX \<sigma> = RDX\<^sub>0 \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = RSP\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x38),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x38),8]::64 word)\<close>
declare P_0x195fa_true_1_def[Ps]

definition P_0x195fa_true_1_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x195fa_true_1_regions_set \<sigma> \<equiv> {
    (0, RSI\<^sub>0, Suc 0),
    (1, RSP\<^sub>0, 8),
    (2, ((RDI\<^sub>0::64 word) + 0x38), 8)
  }\<close>

definition P_0x195fa_true_1_regions :: state_pred where
  \<open>P_0x195fa_true_1_regions \<sigma> \<equiv> \<exists>regions. P_0x195fa_true_1_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_ret_address_1 :: state_pred where
  \<open>Q_ret_address_1 \<sigma> \<equiv> RIP \<sigma> = ret_address \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) + 0x8) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x38),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x38),8]::64 word)\<close>
declare Q_ret_address_1_def[Qs]

schematic_goal bdrv_get_format_0_3_0x195fa_0x19613_1[blocks]:
  assumes \<open>(P_0x195fa_true_1 && P_0x195fa_true_1_regions && ZF) \<sigma>\<close>
  shows \<open>exec_block 3 0x19613 (Suc 0) \<sigma> \<triangleq> ?\<sigma> \<and> Q_ret_address_1 ?\<sigma> \<and> block_usage P_0x195fa_true_1_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x195fa_true_1_def P_0x195fa_true_1_regions_def post: Q_ret_address_1_def regionset: P_0x195fa_true_1_regions_set_def)

definition P_0x195fa_false_2 :: state_pred where
  \<open>P_0x195fa_false_2 \<sigma> \<equiv> RIP \<sigma> = 0x195fa \<and> RAX \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x38),8]::64 word) \<and> RCX \<sigma> = RSI\<^sub>0 \<and> RDX \<sigma> = RDX\<^sub>0 \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = RSP\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x38),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x38),8]::64 word)\<close>
declare P_0x195fa_false_2_def[Ps]

definition P_0x195fa_false_2_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x195fa_false_2_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((RDI\<^sub>0::64 word) + 0x38), 8),
    (2, (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x38),8]::64 word), 8)
  }\<close>

definition P_0x195fa_false_2_regions :: state_pred where
  \<open>P_0x195fa_false_2_regions \<sigma> \<equiv> \<exists>regions. P_0x195fa_false_2_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x5563_2 :: state_pred where
  \<open>Q_0x5563_2 \<sigma> \<equiv> RIP \<sigma> = 0x5563 \<and> RAX \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x38),8]::64 word) \<and> RCX \<sigma> = RSI\<^sub>0 \<and> RDX \<sigma> = (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x38),8]::64 word),8]::64 word) \<and> RDI \<sigma> = RSI\<^sub>0 \<and> RSI \<sigma> = (sextend (ucast ((\<langle>31,0\<rangle>RDX\<^sub>0::32 word))) 32 64::64 word) \<and> RSP \<sigma> = RSP\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x38),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x38),8]::64 word) \<and> (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x38),8]::64 word),8]::64 word) = (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x38),8]::64 word),8]::64 word)\<close>
declare Q_0x5563_2_def[Qs]

schematic_goal bdrv_get_format_0_6_0x195fa_0x5560_2[blocks]:
  assumes \<open>(P_0x195fa_false_2 && P_0x195fa_false_2_regions && ! ZF) \<sigma>\<close>
  shows \<open>exec_block 6 0x5560 2 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x5563_2 ?\<sigma> \<and> block_usage P_0x195fa_false_2_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x195fa_false_2_def P_0x195fa_false_2_regions_def post: Q_0x5563_2_def regionset: P_0x195fa_false_2_regions_set_def)

definition P_0x5563_true_3 :: state_pred where
  \<open>P_0x5563_true_3 \<sigma> \<equiv> RIP \<sigma> = 0x5563 \<and> RAX \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x38),8]::64 word) \<and> RCX \<sigma> = RSI\<^sub>0 \<and> RDX \<sigma> = (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x38),8]::64 word),8]::64 word) \<and> RDI \<sigma> = RSI\<^sub>0 \<and> RSI \<sigma> = (sextend (ucast ((\<langle>31,0\<rangle>RDX\<^sub>0::32 word))) 32 64::64 word) \<and> RSP \<sigma> = RSP\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x38),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x38),8]::64 word) \<and> (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x38),8]::64 word),8]::64 word) = (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x38),8]::64 word),8]::64 word)\<close>
declare P_0x5563_true_3_def[Ps]

definition P_0x5563_true_3_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x5563_true_3_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((RDI\<^sub>0::64 word) + 0x38), 8),
    (2, (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x38),8]::64 word), 8)
  }\<close>

definition P_0x5563_true_3_regions :: state_pred where
  \<open>P_0x5563_true_3_regions \<sigma> \<equiv> \<exists>regions. P_0x5563_true_3_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x559b_3 :: state_pred where
  \<open>Q_0x559b_3 \<sigma> \<equiv> RIP \<sigma> = 0x559b \<and> RSI \<sigma> = (sextend (ucast ((\<langle>31,0\<rangle>RDX\<^sub>0::32 word))) 32 64::64 word) \<and> RSP \<sigma> = RSP\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x38),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x38),8]::64 word) \<and> (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x38),8]::64 word),8]::64 word) = (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x38),8]::64 word),8]::64 word)\<close>
declare Q_0x559b_3_def[Qs]

schematic_goal bdrv_get_format_0_1_0x5563_0x5563_3[blocks]:
  assumes \<open>(P_0x5563_true_3 && P_0x5563_true_3_regions && ZF) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x5563 3 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x559b_3 ?\<sigma> \<and> block_usage P_0x5563_true_3_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x5563_true_3_def P_0x5563_true_3_regions_def post: Q_0x559b_3_def regionset: P_0x5563_true_3_regions_set_def)

definition P_0x5563_false_4 :: state_pred where
  \<open>P_0x5563_false_4 \<sigma> \<equiv> RIP \<sigma> = 0x5563 \<and> RAX \<sigma> = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x38),8]::64 word) \<and> RCX \<sigma> = RSI\<^sub>0 \<and> RDX \<sigma> = (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x38),8]::64 word),8]::64 word) \<and> RDI \<sigma> = RSI\<^sub>0 \<and> RSI \<sigma> = (sextend (ucast ((\<langle>31,0\<rangle>RDX\<^sub>0::32 word))) 32 64::64 word) \<and> RSP \<sigma> = RSP\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x38),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x38),8]::64 word) \<and> (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x38),8]::64 word),8]::64 word) = (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x38),8]::64 word),8]::64 word)\<close>
declare P_0x5563_false_4_def[Ps]

definition P_0x5563_false_4_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x5563_false_4_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((RDI\<^sub>0::64 word) + 0x38), 8),
    (2, (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x38),8]::64 word), 8),
    (3, (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x38),8]::64 word),8]::64 word), Suc 0)
  }\<close>

definition P_0x5563_false_4_regions :: state_pred where
  \<open>P_0x5563_false_4_regions \<sigma> \<equiv> \<exists>regions. P_0x5563_false_4_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x556e_4 :: state_pred where
  \<open>Q_0x556e_4 \<sigma> \<equiv> RIP \<sigma> = 0x556e \<and> RAX \<sigma> = ucast ((\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x38),8]::64 word),8]::64 word),1]::8 word)) \<and> RCX \<sigma> = (((\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x38),8]::64 word),8]::64 word)::64 word) + 0x1) \<and> RDX \<sigma> = (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x38),8]::64 word),8]::64 word) \<and> RDI \<sigma> = RSI\<^sub>0 \<and> RSI \<sigma> = (sextend (ucast ((\<langle>31,0\<rangle>RDX\<^sub>0::32 word))) 32 64::64 word) \<and> RSP \<sigma> = RSP\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x38),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x38),8]::64 word) \<and> (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x38),8]::64 word),8]::64 word) = (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x38),8]::64 word),8]::64 word) \<and> (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x38),8]::64 word),8]::64 word),1]::8 word) = ucast ((\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x38),8]::64 word),8]::64 word),1]::8 word))\<close>
declare Q_0x556e_4_def[Qs]

schematic_goal bdrv_get_format_0_4_0x5563_0x556c_4[blocks]:
  assumes \<open>(P_0x5563_false_4 && P_0x5563_false_4_regions && ! ZF) \<sigma>\<close>
  shows \<open>exec_block 4 0x556c 4 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x556e_4 ?\<sigma> \<and> block_usage P_0x5563_false_4_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x5563_false_4_def P_0x5563_false_4_regions_def post: Q_0x556e_4_def regionset: P_0x5563_false_4_regions_set_def)

definition P_0x556e_true_5 :: state_pred where
  \<open>P_0x556e_true_5 \<sigma> \<equiv> RIP \<sigma> = 0x556e \<and> RAX \<sigma> = ucast ((\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x38),8]::64 word),8]::64 word),1]::8 word)) \<and> RCX \<sigma> = (((\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x38),8]::64 word),8]::64 word)::64 word) + 0x1) \<and> RDX \<sigma> = (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x38),8]::64 word),8]::64 word) \<and> RDI \<sigma> = RSI\<^sub>0 \<and> RSI \<sigma> = (sextend (ucast ((\<langle>31,0\<rangle>RDX\<^sub>0::32 word))) 32 64::64 word) \<and> RSP \<sigma> = RSP\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x38),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x38),8]::64 word) \<and> (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x38),8]::64 word),8]::64 word) = (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x38),8]::64 word),8]::64 word) \<and> (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x38),8]::64 word),8]::64 word),1]::8 word) = ucast ((\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x38),8]::64 word),8]::64 word),1]::8 word))\<close>
declare P_0x556e_true_5_def[Ps]

definition P_0x556e_true_5_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x556e_true_5_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((RDI\<^sub>0::64 word) + 0x38), 8),
    (2, (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x38),8]::64 word), 8),
    (3, (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x38),8]::64 word),8]::64 word), Suc 0)
  }\<close>

definition P_0x556e_true_5_regions :: state_pred where
  \<open>P_0x556e_true_5_regions \<sigma> \<equiv> \<exists>regions. P_0x556e_true_5_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x5598_5 :: state_pred where
  \<open>Q_0x5598_5 \<sigma> \<equiv> RIP \<sigma> = 0x5598 \<and> RSI \<sigma> = (sextend (ucast ((\<langle>31,0\<rangle>RDX\<^sub>0::32 word))) 32 64::64 word) \<and> RSP \<sigma> = RSP\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x38),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x38),8]::64 word) \<and> (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x38),8]::64 word),8]::64 word) = (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x38),8]::64 word),8]::64 word) \<and> (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x38),8]::64 word),8]::64 word),1]::8 word) = ucast ((\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x38),8]::64 word),8]::64 word),1]::8 word))\<close>
declare Q_0x5598_5_def[Qs]

schematic_goal bdrv_get_format_0_1_0x556e_0x556e_5[blocks]:
  assumes \<open>(P_0x556e_true_5 && P_0x556e_true_5_regions && ZF) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x556e 5 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x5598_5 ?\<sigma> \<and> block_usage P_0x556e_true_5_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x556e_true_5_def P_0x556e_true_5_regions_def post: Q_0x5598_5_def regionset: P_0x556e_true_5_regions_set_def)

definition P_0x556e_false_6 :: state_pred where
  \<open>P_0x556e_false_6 \<sigma> \<equiv> RIP \<sigma> = 0x556e \<and> RAX \<sigma> = ucast ((\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x38),8]::64 word),8]::64 word),1]::8 word)) \<and> RCX \<sigma> = (((\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x38),8]::64 word),8]::64 word)::64 word) + 0x1) \<and> RDX \<sigma> = (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x38),8]::64 word),8]::64 word) \<and> RDI \<sigma> = RSI\<^sub>0 \<and> RSI \<sigma> = (sextend (ucast ((\<langle>31,0\<rangle>RDX\<^sub>0::32 word))) 32 64::64 word) \<and> RSP \<sigma> = RSP\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x38),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x38),8]::64 word) \<and> (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x38),8]::64 word),8]::64 word) = (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x38),8]::64 word),8]::64 word) \<and> (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x38),8]::64 word),8]::64 word),1]::8 word) = ucast ((\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x38),8]::64 word),8]::64 word),1]::8 word))\<close>
declare P_0x556e_false_6_def[Ps]

definition P_0x556e_false_6_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x556e_false_6_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((RDI\<^sub>0::64 word) + 0x38), 8),
    (2, (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x38),8]::64 word), 8),
    (3, (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x38),8]::64 word),8]::64 word), Suc 0)
  }\<close>

definition P_0x556e_false_6_regions :: state_pred where
  \<open>P_0x556e_false_6_regions \<sigma> \<equiv> \<exists>regions. P_0x556e_false_6_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x5578_6 :: state_pred where
  \<open>Q_0x5578_6 \<sigma> \<equiv> RIP \<sigma> = 0x5578 \<and> RAX \<sigma> = ucast ((\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x38),8]::64 word),8]::64 word),1]::8 word)) \<and> RCX \<sigma> = (((\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x38),8]::64 word),8]::64 word)::64 word) + 0x1) \<and> RDX \<sigma> = ((((RSI\<^sub>0::64 word) + (\<langle>63,0\<rangle>(((sextend (ucast ((\<langle>31,0\<rangle>RDX\<^sub>0::32 word))) 32 64::64 word)::64 word) * 0x1)::64 word))::64 word) - 0x1) \<and> RDI \<sigma> = RSI\<^sub>0 \<and> RSI \<sigma> = (sextend (ucast ((\<langle>31,0\<rangle>RDX\<^sub>0::32 word))) 32 64::64 word) \<and> RSP \<sigma> = RSP\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x38),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x38),8]::64 word) \<and> (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x38),8]::64 word),8]::64 word) = (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x38),8]::64 word),8]::64 word) \<and> (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x38),8]::64 word),8]::64 word),1]::8 word) = ucast ((\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x38),8]::64 word),8]::64 word),1]::8 word))\<close>
declare Q_0x5578_6_def[Qs]

schematic_goal bdrv_get_format_0_3_0x556e_0x5575_6[blocks]:
  assumes \<open>(P_0x556e_false_6 && P_0x556e_false_6_regions && ! ZF) \<sigma>\<close>
  shows \<open>exec_block 3 0x5575 6 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x5578_6 ?\<sigma> \<and> block_usage P_0x556e_false_6_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x556e_false_6_def P_0x556e_false_6_regions_def post: Q_0x5578_6_def regionset: P_0x556e_false_6_regions_set_def)

definition P_0x5578_true_7 :: state_pred where
  \<open>P_0x5578_true_7 \<sigma> \<equiv> RIP \<sigma> = 0x5578 \<and> RAX \<sigma> = ucast ((\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x38),8]::64 word),8]::64 word),1]::8 word)) \<and> RCX \<sigma> = (((\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x38),8]::64 word),8]::64 word)::64 word) + 0x1) \<and> RDX \<sigma> = ((((RSI\<^sub>0::64 word) + (\<langle>63,0\<rangle>(((sextend (ucast ((\<langle>31,0\<rangle>RDX\<^sub>0::32 word))) 32 64::64 word)::64 word) * 0x1)::64 word))::64 word) - 0x1) \<and> RDI \<sigma> = RSI\<^sub>0 \<and> RSI \<sigma> = (sextend (ucast ((\<langle>31,0\<rangle>RDX\<^sub>0::32 word))) 32 64::64 word) \<and> RSP \<sigma> = RSP\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x38),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x38),8]::64 word) \<and> (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x38),8]::64 word),8]::64 word) = (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x38),8]::64 word),8]::64 word) \<and> (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x38),8]::64 word),8]::64 word),1]::8 word) = ucast ((\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x38),8]::64 word),8]::64 word),1]::8 word))\<close>
declare P_0x5578_true_7_def[Ps]

definition P_0x5578_true_7_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x5578_true_7_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((RDI\<^sub>0::64 word) + 0x38), 8),
    (2, (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x38),8]::64 word), 8),
    (3, (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x38),8]::64 word),8]::64 word), Suc 0)
  }\<close>

definition P_0x5578_true_7_regions :: state_pred where
  \<open>P_0x5578_true_7_regions \<sigma> \<equiv> \<exists>regions. P_0x5578_true_7_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x5585_7 :: state_pred where
  \<open>Q_0x5585_7 \<sigma> \<equiv> RIP \<sigma> = 0x5585 \<and> RDX \<sigma> = ((((RSI\<^sub>0::64 word) + (\<langle>63,0\<rangle>(((sextend (ucast ((\<langle>31,0\<rangle>RDX\<^sub>0::32 word))) 32 64::64 word)::64 word) * 0x1)::64 word))::64 word) - 0x1) \<and> RSI \<sigma> = (sextend (ucast ((\<langle>31,0\<rangle>RDX\<^sub>0::32 word))) 32 64::64 word) \<and> RSP \<sigma> = RSP\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x38),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x38),8]::64 word) \<and> (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x38),8]::64 word),8]::64 word) = (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x38),8]::64 word),8]::64 word) \<and> (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x38),8]::64 word),8]::64 word),1]::8 word) = ucast ((\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x38),8]::64 word),8]::64 word),1]::8 word))\<close>
declare Q_0x5585_7_def[Qs]

schematic_goal bdrv_get_format_0_1_0x5578_0x5578_7[blocks]:
  assumes \<open>(P_0x5578_true_7 && P_0x5578_true_7_regions && CF) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x5578 7 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x5585_7 ?\<sigma> \<and> block_usage P_0x5578_true_7_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x5578_true_7_def P_0x5578_true_7_regions_def post: Q_0x5585_7_def regionset: P_0x5578_true_7_regions_set_def)

definition P_0x5585_8 :: state_pred where
  \<open>P_0x5585_8 \<sigma> \<equiv> RIP \<sigma> = 0x5585 \<and> RDX \<sigma> = ((((RSI\<^sub>0::64 word) + (\<langle>63,0\<rangle>(((sextend (ucast ((\<langle>31,0\<rangle>RDX\<^sub>0::32 word))) 32 64::64 word)::64 word) * 0x1)::64 word))::64 word) - 0x1) \<and> RSI \<sigma> = (sextend (ucast ((\<langle>31,0\<rangle>RDX\<^sub>0::32 word))) 32 64::64 word) \<and> RSP \<sigma> = RSP\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x38),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x38),8]::64 word) \<and> (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x38),8]::64 word),8]::64 word) = (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x38),8]::64 word),8]::64 word) \<and> (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x38),8]::64 word),8]::64 word),1]::8 word) = ucast ((\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x38),8]::64 word),8]::64 word),1]::8 word))\<close>
declare P_0x5585_8_def[Ps]

definition P_0x5585_8_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x5585_8_regions_set \<sigma> \<equiv> {
    (0, RCX \<sigma>, Suc 0),
    (1, RDI \<sigma>, Suc 0),
    (2, RSP\<^sub>0, 8),
    (3, ((RDI\<^sub>0::64 word) + 0x38), 8),
    (4, (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x38),8]::64 word), 8),
    (5, (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x38),8]::64 word),8]::64 word), Suc 0)
  }\<close>

definition P_0x5585_8_regions :: state_pred where
  \<open>P_0x5585_8_regions \<sigma> \<equiv> \<exists>regions. P_0x5585_8_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x5596_8 :: state_pred where
  \<open>Q_0x5596_8 \<sigma> \<equiv> RIP \<sigma> = 0x5596 \<and> RDX \<sigma> = ((((RSI\<^sub>0::64 word) + (\<langle>63,0\<rangle>(((sextend (ucast ((\<langle>31,0\<rangle>RDX\<^sub>0::32 word))) 32 64::64 word)::64 word) * 0x1)::64 word))::64 word) - 0x1) \<and> RSI \<sigma> = (sextend (ucast ((\<langle>31,0\<rangle>RDX\<^sub>0::32 word))) 32 64::64 word) \<and> RSP \<sigma> = RSP\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x38),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x38),8]::64 word) \<and> (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x38),8]::64 word),8]::64 word) = (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x38),8]::64 word),8]::64 word) \<and> (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x38),8]::64 word),8]::64 word),1]::8 word) = ucast ((\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x38),8]::64 word),8]::64 word),1]::8 word))\<close>
declare Q_0x5596_8_def[Qs]

schematic_goal bdrv_get_format_0_5_0x5585_0x5594_8[blocks]:
  assumes \<open>(P_0x5585_8 && P_0x5585_8_regions) \<sigma>\<close>
  shows \<open>exec_block 5 0x5594 8 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x5596_8 ?\<sigma> \<and> block_usage P_0x5585_8_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x5585_8_def P_0x5585_8_regions_def post: Q_0x5596_8_def regionset: P_0x5585_8_regions_set_def)

definition P_0x5596_true_9 :: state_pred where
  \<open>P_0x5596_true_9 \<sigma> \<equiv> RIP \<sigma> = 0x5596 \<and> RDX \<sigma> = ((((RSI\<^sub>0::64 word) + (\<langle>63,0\<rangle>(((sextend (ucast ((\<langle>31,0\<rangle>RDX\<^sub>0::32 word))) 32 64::64 word)::64 word) * 0x1)::64 word))::64 word) - 0x1) \<and> RSI \<sigma> = (sextend (ucast ((\<langle>31,0\<rangle>RDX\<^sub>0::32 word))) 32 64::64 word) \<and> RSP \<sigma> = RSP\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x38),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x38),8]::64 word) \<and> (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x38),8]::64 word),8]::64 word) = (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x38),8]::64 word),8]::64 word) \<and> (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x38),8]::64 word),8]::64 word),1]::8 word) = ucast ((\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x38),8]::64 word),8]::64 word),1]::8 word))\<close>
declare P_0x5596_true_9_def[Ps]

definition P_0x5596_true_9_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x5596_true_9_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((RDI\<^sub>0::64 word) + 0x38), 8),
    (2, (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x38),8]::64 word), 8),
    (3, (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x38),8]::64 word),8]::64 word), Suc 0)
  }\<close>

definition P_0x5596_true_9_regions :: state_pred where
  \<open>P_0x5596_true_9_regions \<sigma> \<equiv> \<exists>regions. P_0x5596_true_9_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x5583_9 :: state_pred where
  \<open>Q_0x5583_9 \<sigma> \<equiv> RIP \<sigma> = 0x5583 \<and> RDX \<sigma> = ((((RSI\<^sub>0::64 word) + (\<langle>63,0\<rangle>(((sextend (ucast ((\<langle>31,0\<rangle>RDX\<^sub>0::32 word))) 32 64::64 word)::64 word) * 0x1)::64 word))::64 word) - 0x1) \<and> RSI \<sigma> = (sextend (ucast ((\<langle>31,0\<rangle>RDX\<^sub>0::32 word))) 32 64::64 word) \<and> RSP \<sigma> = RSP\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x38),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x38),8]::64 word) \<and> (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x38),8]::64 word),8]::64 word) = (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x38),8]::64 word),8]::64 word) \<and> (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x38),8]::64 word),8]::64 word),1]::8 word) = ucast ((\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x38),8]::64 word),8]::64 word),1]::8 word))\<close>
declare Q_0x5583_9_def[Qs]

schematic_goal bdrv_get_format_0_2_0x5596_0x5580_9[blocks]:
  assumes \<open>(P_0x5596_true_9 && P_0x5596_true_9_regions && !ZF) \<sigma>\<close>
  shows \<open>exec_block 2 0x5580 9 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x5583_9 ?\<sigma> \<and> block_usage P_0x5596_true_9_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x5596_true_9_def P_0x5596_true_9_regions_def post: Q_0x5583_9_def regionset: P_0x5596_true_9_regions_set_def)

definition P_0x5583_true_10 :: state_pred where
  \<open>P_0x5583_true_10 \<sigma> \<equiv> RIP \<sigma> = 0x5583 \<and> RDX \<sigma> = ((((RSI\<^sub>0::64 word) + (\<langle>63,0\<rangle>(((sextend (ucast ((\<langle>31,0\<rangle>RDX\<^sub>0::32 word))) 32 64::64 word)::64 word) * 0x1)::64 word))::64 word) - 0x1) \<and> RSI \<sigma> = (sextend (ucast ((\<langle>31,0\<rangle>RDX\<^sub>0::32 word))) 32 64::64 word) \<and> RSP \<sigma> = RSP\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x38),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x38),8]::64 word) \<and> (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x38),8]::64 word),8]::64 word) = (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x38),8]::64 word),8]::64 word) \<and> (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x38),8]::64 word),8]::64 word),1]::8 word) = ucast ((\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x38),8]::64 word),8]::64 word),1]::8 word))\<close>
declare P_0x5583_true_10_def[Ps]

definition P_0x5583_true_10_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x5583_true_10_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((RDI\<^sub>0::64 word) + 0x38), 8),
    (2, (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x38),8]::64 word), 8),
    (3, (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x38),8]::64 word),8]::64 word), Suc 0)
  }\<close>

definition P_0x5583_true_10_regions :: state_pred where
  \<open>P_0x5583_true_10_regions \<sigma> \<equiv> \<exists>regions. P_0x5583_true_10_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x5598_10 :: state_pred where
  \<open>Q_0x5598_10 \<sigma> \<equiv> RIP \<sigma> = 0x5598 \<and> RDX \<sigma> = ((((RSI\<^sub>0::64 word) + (\<langle>63,0\<rangle>(((sextend (ucast ((\<langle>31,0\<rangle>RDX\<^sub>0::32 word))) 32 64::64 word)::64 word) * 0x1)::64 word))::64 word) - 0x1) \<and> RSI \<sigma> = (sextend (ucast ((\<langle>31,0\<rangle>RDX\<^sub>0::32 word))) 32 64::64 word) \<and> RSP \<sigma> = RSP\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x38),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x38),8]::64 word) \<and> (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x38),8]::64 word),8]::64 word) = (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x38),8]::64 word),8]::64 word) \<and> (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x38),8]::64 word),8]::64 word),1]::8 word) = ucast ((\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x38),8]::64 word),8]::64 word),1]::8 word))\<close>
declare Q_0x5598_10_def[Qs]

schematic_goal bdrv_get_format_0_1_0x5583_0x5583_10[blocks]:
  assumes \<open>(P_0x5583_true_10 && P_0x5583_true_10_regions && ZF) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x5583 10 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x5598_10 ?\<sigma> \<and> block_usage P_0x5583_true_10_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x5583_true_10_def P_0x5583_true_10_regions_def post: Q_0x5598_10_def regionset: P_0x5583_true_10_regions_set_def)

definition P_0x5583_false_11 :: state_pred where
  \<open>P_0x5583_false_11 \<sigma> \<equiv> RIP \<sigma> = 0x5583 \<and> RDX \<sigma> = ((((RSI\<^sub>0::64 word) + (\<langle>63,0\<rangle>(((sextend (ucast ((\<langle>31,0\<rangle>RDX\<^sub>0::32 word))) 32 64::64 word)::64 word) * 0x1)::64 word))::64 word) - 0x1) \<and> RSI \<sigma> = (sextend (ucast ((\<langle>31,0\<rangle>RDX\<^sub>0::32 word))) 32 64::64 word) \<and> RSP \<sigma> = RSP\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x38),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x38),8]::64 word) \<and> (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x38),8]::64 word),8]::64 word) = (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x38),8]::64 word),8]::64 word) \<and> (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x38),8]::64 word),8]::64 word),1]::8 word) = ucast ((\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x38),8]::64 word),8]::64 word),1]::8 word))\<close>
declare P_0x5583_false_11_def[Ps]

definition P_0x5583_false_11_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x5583_false_11_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((RDI\<^sub>0::64 word) + 0x38), 8),
    (2, (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x38),8]::64 word), 8),
    (3, (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x38),8]::64 word),8]::64 word), Suc 0)
  }\<close>

definition P_0x5583_false_11_regions :: state_pred where
  \<open>P_0x5583_false_11_regions \<sigma> \<equiv> \<exists>regions. P_0x5583_false_11_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x5585_11 :: state_pred where
  \<open>Q_0x5585_11 \<sigma> \<equiv> RIP \<sigma> = 0x5585 \<and> RDX \<sigma> = ((((RSI\<^sub>0::64 word) + (\<langle>63,0\<rangle>(((sextend (ucast ((\<langle>31,0\<rangle>RDX\<^sub>0::32 word))) 32 64::64 word)::64 word) * 0x1)::64 word))::64 word) - 0x1) \<and> RSI \<sigma> = (sextend (ucast ((\<langle>31,0\<rangle>RDX\<^sub>0::32 word))) 32 64::64 word) \<and> RSP \<sigma> = RSP\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x38),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x38),8]::64 word) \<and> (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x38),8]::64 word),8]::64 word) = (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x38),8]::64 word),8]::64 word) \<and> (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x38),8]::64 word),8]::64 word),1]::8 word) = ucast ((\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x38),8]::64 word),8]::64 word),1]::8 word))\<close>
declare Q_0x5585_11_def[Qs]

schematic_goal bdrv_get_format_0_1_0x5583_0x5583_11[blocks]:
  assumes \<open>(P_0x5583_false_11 && P_0x5583_false_11_regions && ! ZF) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x5583 11 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x5585_11 ?\<sigma> \<and> block_usage P_0x5583_false_11_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x5583_false_11_def P_0x5583_false_11_regions_def post: Q_0x5585_11_def regionset: P_0x5583_false_11_regions_set_def)

definition P_0x5596_false_12 :: state_pred where
  \<open>P_0x5596_false_12 \<sigma> \<equiv> RIP \<sigma> = 0x5596 \<and> RDX \<sigma> = ((((RSI\<^sub>0::64 word) + (\<langle>63,0\<rangle>(((sextend (ucast ((\<langle>31,0\<rangle>RDX\<^sub>0::32 word))) 32 64::64 word)::64 word) * 0x1)::64 word))::64 word) - 0x1) \<and> RSI \<sigma> = (sextend (ucast ((\<langle>31,0\<rangle>RDX\<^sub>0::32 word))) 32 64::64 word) \<and> RSP \<sigma> = RSP\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x38),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x38),8]::64 word) \<and> (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x38),8]::64 word),8]::64 word) = (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x38),8]::64 word),8]::64 word) \<and> (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x38),8]::64 word),8]::64 word),1]::8 word) = ucast ((\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x38),8]::64 word),8]::64 word),1]::8 word))\<close>
declare P_0x5596_false_12_def[Ps]

definition P_0x5596_false_12_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x5596_false_12_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((RDI\<^sub>0::64 word) + 0x38), 8),
    (2, (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x38),8]::64 word), 8),
    (3, (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x38),8]::64 word),8]::64 word), Suc 0)
  }\<close>

definition P_0x5596_false_12_regions :: state_pred where
  \<open>P_0x5596_false_12_regions \<sigma> \<equiv> \<exists>regions. P_0x5596_false_12_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x5598_12 :: state_pred where
  \<open>Q_0x5598_12 \<sigma> \<equiv> RIP \<sigma> = 0x5598 \<and> RDX \<sigma> = ((((RSI\<^sub>0::64 word) + (\<langle>63,0\<rangle>(((sextend (ucast ((\<langle>31,0\<rangle>RDX\<^sub>0::32 word))) 32 64::64 word)::64 word) * 0x1)::64 word))::64 word) - 0x1) \<and> RSI \<sigma> = (sextend (ucast ((\<langle>31,0\<rangle>RDX\<^sub>0::32 word))) 32 64::64 word) \<and> RSP \<sigma> = RSP\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x38),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x38),8]::64 word) \<and> (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x38),8]::64 word),8]::64 word) = (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x38),8]::64 word),8]::64 word) \<and> (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x38),8]::64 word),8]::64 word),1]::8 word) = ucast ((\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x38),8]::64 word),8]::64 word),1]::8 word))\<close>
declare Q_0x5598_12_def[Qs]

schematic_goal bdrv_get_format_0_1_0x5596_0x5596_12[blocks]:
  assumes \<open>(P_0x5596_false_12 && P_0x5596_false_12_regions && ! !ZF) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x5596 12 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x5598_12 ?\<sigma> \<and> block_usage P_0x5596_false_12_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x5596_false_12_def P_0x5596_false_12_regions_def post: Q_0x5598_12_def regionset: P_0x5596_false_12_regions_set_def)

definition P_0x5578_false_13 :: state_pred where
  \<open>P_0x5578_false_13 \<sigma> \<equiv> RIP \<sigma> = 0x5578 \<and> RAX \<sigma> = ucast ((\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x38),8]::64 word),8]::64 word),1]::8 word)) \<and> RCX \<sigma> = (((\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x38),8]::64 word),8]::64 word)::64 word) + 0x1) \<and> RDX \<sigma> = ((((RSI\<^sub>0::64 word) + (\<langle>63,0\<rangle>(((sextend (ucast ((\<langle>31,0\<rangle>RDX\<^sub>0::32 word))) 32 64::64 word)::64 word) * 0x1)::64 word))::64 word) - 0x1) \<and> RDI \<sigma> = RSI\<^sub>0 \<and> RSI \<sigma> = (sextend (ucast ((\<langle>31,0\<rangle>RDX\<^sub>0::32 word))) 32 64::64 word) \<and> RSP \<sigma> = RSP\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x38),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x38),8]::64 word) \<and> (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x38),8]::64 word),8]::64 word) = (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x38),8]::64 word),8]::64 word) \<and> (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x38),8]::64 word),8]::64 word),1]::8 word) = ucast ((\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x38),8]::64 word),8]::64 word),1]::8 word))\<close>
declare P_0x5578_false_13_def[Ps]

definition P_0x5578_false_13_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x5578_false_13_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((RDI\<^sub>0::64 word) + 0x38), 8),
    (2, (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x38),8]::64 word), 8),
    (3, (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x38),8]::64 word),8]::64 word), Suc 0)
  }\<close>

definition P_0x5578_false_13_regions :: state_pred where
  \<open>P_0x5578_false_13_regions \<sigma> \<equiv> \<exists>regions. P_0x5578_false_13_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x5598_13 :: state_pred where
  \<open>Q_0x5598_13 \<sigma> \<equiv> RIP \<sigma> = 0x5598 \<and> RSI \<sigma> = (sextend (ucast ((\<langle>31,0\<rangle>RDX\<^sub>0::32 word))) 32 64::64 word) \<and> RSP \<sigma> = RSP\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x38),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x38),8]::64 word) \<and> (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x38),8]::64 word),8]::64 word) = (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x38),8]::64 word),8]::64 word) \<and> (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x38),8]::64 word),8]::64 word),1]::8 word) = ucast ((\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x38),8]::64 word),8]::64 word),1]::8 word))\<close>
declare Q_0x5598_13_def[Qs]

schematic_goal bdrv_get_format_0_2_0x5578_0x557a_13[blocks]:
  assumes \<open>(P_0x5578_false_13 && P_0x5578_false_13_regions && ! CF) \<sigma>\<close>
  shows \<open>exec_block 2 0x557a 13 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x5598_13 ?\<sigma> \<and> block_usage P_0x5578_false_13_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x5578_false_13_def P_0x5578_false_13_regions_def post: Q_0x5598_13_def regionset: P_0x5578_false_13_regions_set_def)

definition P_0x5598_14 :: state_pred where
  \<open>P_0x5598_14 \<sigma> \<equiv> RIP \<sigma> = 0x5598 \<and> RSI \<sigma> = (sextend (ucast ((\<langle>31,0\<rangle>RDX\<^sub>0::32 word))) 32 64::64 word) \<and> RSP \<sigma> = RSP\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x38),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x38),8]::64 word) \<and> (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x38),8]::64 word),8]::64 word) = (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x38),8]::64 word),8]::64 word) \<and> (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x38),8]::64 word),8]::64 word),1]::8 word) = ucast ((\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x38),8]::64 word),8]::64 word),1]::8 word))\<close>
declare P_0x5598_14_def[Ps]

definition P_0x5598_14_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x5598_14_regions_set \<sigma> \<equiv> {
    (0, RDI \<sigma>, Suc 0),
    (1, RSP\<^sub>0, 8),
    (2, ((RDI\<^sub>0::64 word) + 0x38), 8),
    (3, (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x38),8]::64 word), 8),
    (4, (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x38),8]::64 word),8]::64 word), Suc 0)
  }\<close>

definition P_0x5598_14_regions :: state_pred where
  \<open>P_0x5598_14_regions \<sigma> \<equiv> \<exists>regions. P_0x5598_14_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x559b_14 :: state_pred where
  \<open>Q_0x559b_14 \<sigma> \<equiv> RIP \<sigma> = 0x559b \<and> RSI \<sigma> = (sextend (ucast ((\<langle>31,0\<rangle>RDX\<^sub>0::32 word))) 32 64::64 word) \<and> RSP \<sigma> = RSP\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x38),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x38),8]::64 word) \<and> (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x38),8]::64 word),8]::64 word) = (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x38),8]::64 word),8]::64 word)\<close>
declare Q_0x559b_14_def[Qs]

schematic_goal bdrv_get_format_0_1_0x5598_0x5598_14[blocks]:
  assumes \<open>(P_0x5598_14 && P_0x5598_14_regions) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x5598 14 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x559b_14 ?\<sigma> \<and> block_usage P_0x5598_14_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x5598_14_def P_0x5598_14_regions_def post: Q_0x559b_14_def regionset: P_0x5598_14_regions_set_def)

definition P_0x559b_15 :: state_pred where
  \<open>P_0x559b_15 \<sigma> \<equiv> RIP \<sigma> = 0x559b \<and> RSI \<sigma> = (sextend (ucast ((\<langle>31,0\<rangle>RDX\<^sub>0::32 word))) 32 64::64 word) \<and> RSP \<sigma> = RSP\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x38),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x38),8]::64 word) \<and> (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x38),8]::64 word),8]::64 word) = (\<sigma> \<turnstile> *[(\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x38),8]::64 word),8]::64 word)\<close>
declare P_0x559b_15_def[Ps]

definition P_0x559b_15_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x559b_15_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((RDI\<^sub>0::64 word) + 0x38), 8),
    (2, (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x38),8]::64 word), 8)
  }\<close>

definition P_0x559b_15_regions :: state_pred where
  \<open>P_0x559b_15_regions \<sigma> \<equiv> \<exists>regions. P_0x559b_15_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_ret_address_15 :: state_pred where
  \<open>Q_ret_address_15 \<sigma> \<equiv> RIP \<sigma> = ret_address \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) + 0x8) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x38),8]::64 word) = (\<sigma> \<turnstile> *[((RDI\<^sub>0::64 word) + 0x38),8]::64 word)\<close>
declare Q_ret_address_15_def[Qs]

schematic_goal bdrv_get_format_0_1_0x559b_0x559b_15[blocks]:
  assumes \<open>(P_0x559b_15 && P_0x559b_15_regions) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x559b 15 \<sigma> \<triangleq> ?\<sigma> \<and> Q_ret_address_15 ?\<sigma> \<and> block_usage P_0x559b_15_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x559b_15_def P_0x559b_15_regions_def post: Q_ret_address_15_def regionset: P_0x559b_15_regions_set_def)

definition bdrv_get_format_acode :: ACode where
  \<open>bdrv_get_format_acode =
    Block 3 0x195f7 0;
    IF ZF THEN
      Block 3 0x19613 (Suc 0)
    ELSE
      Block 6 0x5560 2;
      IF ZF THEN
        Block (Suc 0) 0x5563 3
      ELSE
        Block 4 0x556c 4;
        IF ZF THEN
          Block (Suc 0) 0x556e 5
        ELSE
          Block 3 0x5575 6;
          IF CF THEN
            Block (Suc 0) 0x5578 7;
            WHILE P_0x5585_8 DO
              Block 5 0x5594 8;
              IF !ZF THEN
                Block 2 0x5580 9;
                IF ZF THEN
                  Block (Suc 0) 0x5583 10
                ELSE
                  Block (Suc 0) 0x5583 11
                FI
              ELSE
                Block (Suc 0) 0x5596 12
              FI
            OD
          ELSE
            Block 2 0x557a 13
          FI
        FI;
        Block (Suc 0) 0x5598 14
      FI;
      Block (Suc 0) 0x559b 15
    FI
  \<close>

schematic_goal "bdrv_get_format":
  assumes
    \<open>\<forall>\<sigma>. RIP \<sigma> = 0x195fa \<longrightarrow> P_0x195fa_true_1_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x195fa \<longrightarrow> P_0x195fa_false_2_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x5563 \<longrightarrow> P_0x5563_true_3_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x5563 \<longrightarrow> P_0x5563_false_4_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x556e \<longrightarrow> P_0x556e_true_5_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x556e \<longrightarrow> P_0x556e_false_6_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x5578 \<longrightarrow> P_0x5578_true_7_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x5585 \<longrightarrow> P_0x5585_8_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x5596 \<longrightarrow> P_0x5596_true_9_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x5583 \<longrightarrow> P_0x5583_true_10_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x5583 \<longrightarrow> P_0x5583_false_11_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x5596 \<longrightarrow> P_0x5596_false_12_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x5578 \<longrightarrow> P_0x5578_false_13_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x5598 \<longrightarrow> P_0x5598_14_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x559b \<longrightarrow> P_0x559b_15_regions \<sigma>\<close>
  shows \<open>{{?P}} bdrv_get_format_acode {{?Q;?M}}\<close>
  apply (vcg acode: bdrv_get_format_acode_def assms: assms)
                    apply (vcg_while \<open>P_0x5585_8 || P_0x5598_14\<close> assms: assms)
                     apply (vcg_step assms: assms)+
                    apply (simp add: pred_logic Ps Qs)
                   apply simp
                  apply (vcg_step assms: assms)+
                apply (simp add: assms)+
       apply (vcg_step assms: assms)
  done

end

end
