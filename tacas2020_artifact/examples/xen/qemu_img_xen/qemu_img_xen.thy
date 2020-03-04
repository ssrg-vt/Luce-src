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
theory qemu_img_xen
  imports "../../../isabelle/VCG/HTriple"
begin

locale "qemu_img_xen" = execution_context + exec_code +
  fixes bdrv_read_0x183c3_retval\<^sub>v memcpy_0x183d9_retval\<^sub>v bdrv_read_0x183f8_retval\<^sub>v bdrv_read_0x18460_retval\<^sub>v rep_movs_ESRDI_DSRSI_0x184b8_retval\<^sub>v stack_chk_fail_0x184fa_retval\<^sub>v stack_chk_fail_addr bdrv_read_addr memcpy_addr rep_movs_ESRDI_DSRSI_addr :: \<open>64 word\<close>
    and stack_chk_fail_acode bdrv_read_acode memcpy_acode rep_movs_ESRDI_DSRSI_acode :: ACode
  assumes fetch:
    "fetch 0x18320 \<equiv> (Unary (IS_8088 Push) (Storage (Reg (General SixtyFour r15))), 2)"
    "fetch 0x18322 \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour r15)) (Storage (Reg (General SixtyFour rsi))), 3)"
    "fetch 0x18325 \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour r8)) (Storage (Reg (General SixtyFour rdi))), 3)"
    "fetch 0x18328 \<equiv> (Unary (IS_8088 Push) (Storage (Reg (General SixtyFour r14))), 2)"
    "fetch 0x1832a \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour r14)) (Storage (Reg (General SixtyFour rdx))), 3)"
    "fetch 0x1832d \<equiv> (Unary (IS_8088 Push) (Storage (Reg (General SixtyFour r13))), 2)"
    "fetch 0x1832f \<equiv> (Unary (IS_8088 Push) (Storage (Reg (General SixtyFour r12))), 2)"
    "fetch 0x18331 \<equiv> (Binary (IS_8088 Mov) (Reg (General ThirtyTwo r12)) (Storage (Reg (General ThirtyTwo rcx))), 3)"
    "fetch 0x18334 \<equiv> (Unary (IS_8088 Push) (Storage (Reg (General SixtyFour rbp))), 1)"
    "fetch 0x18335 \<equiv> (Binary (IS_8088 Mov) (Reg (General ThirtyTwo rbp)) (Storage (Reg (General ThirtyTwo rcx))), 2)"
    "fetch 0x18337 \<equiv> (Unary (IS_8088 Push) (Storage (Reg (General SixtyFour rbx))), 1)"
    "fetch 0x18338 \<equiv> (Binary (IS_8088 Mov) (Reg (General ThirtyTwo rbx)) (Storage (Reg (General ThirtyTwo rsi))), 2)"
    "fetch 0x1833a \<equiv> (Unary (IS_8088 Neg) (Storage (Reg (General ThirtyTwo rbx))), 2)"
    "fetch 0x1833c \<equiv> (Binary (IS_8088 And) (Reg (General ThirtyTwo rbx)) (Immediate SixtyFour (ImmVal 511)), 6)"
    "fetch 0x18342 \<equiv> (Binary (IS_8088 Sub) (Reg (General SixtyFour rsp)) (Immediate SixtyFour (ImmVal 552)), 7)"
    "fetch 0x18349 \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour rax)) (Storage (Memory SixtyFour (A_SizeDirective 64 (A_Plus (A_FromReg (General SixtyFour fs)) (A_WordConstant 40))))), 9)"
    "fetch 0x18352 \<equiv> (Binary (IS_8088 Mov) (Memory SixtyFour (A_SizeDirective 64 (A_Plus (A_FromReg (General SixtyFour rsp)) (A_WordConstant 536)))) (Storage (Reg (General SixtyFour rax))), 8)"
    "fetch 0x1835a \<equiv> (Binary (IS_8088 Xor) (Reg (General ThirtyTwo rax)) (Storage (Reg (General ThirtyTwo rax))), 2)"
    "fetch 0x1835c \<equiv> (Binary (IS_8088 Cmp) (Reg (General ThirtyTwo rcx)) (Storage (Reg (General ThirtyTwo rbx))), 2)"
    "fetch 0x1835e \<equiv> (Binary (IS_PentiumPro Cmovle) (Reg (General ThirtyTwo rbx)) (Storage (Reg (General ThirtyTwo rcx))), 3)"
    "fetch 0x18361 \<equiv> (Binary (IS_8088 Sar) (Reg (General SixtyFour r15)) (Immediate SixtyFour (ImmVal 9)), 4)"
    "fetch 0x18365 \<equiv> (Binary (IS_8088 Test) (Reg (General ThirtyTwo rbx)) (Storage (Reg (General ThirtyTwo rbx))), 2)"
    "fetch 0x18367 \<equiv> (Unary (IS_8088 Jg) (Immediate SixtyFour (ImmVal 99296)), 2)"
    "fetch 0x18369 \<equiv> (Binary (IS_8088 Mov) (Reg (General ThirtyTwo rbx)) (Storage (Reg (General ThirtyTwo rbp))), 2)"
    "fetch 0x1836b \<equiv> (Binary (IS_8088 Sar) (Reg (General ThirtyTwo rbx)) (Immediate SixtyFour (ImmVal 9)), 3)"
    "fetch 0x1836e \<equiv> (Binary (IS_8088 Test) (Reg (General ThirtyTwo rbx)) (Storage (Reg (General ThirtyTwo rbx))), 2)"
    "fetch 0x18370 \<equiv> (Unary (IS_8088 Jg) (Immediate SixtyFour (ImmVal 99408)), 6)"
    "fetch 0x18376 \<equiv> (Binary (IS_8088 Test) (Reg (General ThirtyTwo rbp)) (Storage (Reg (General ThirtyTwo rbp))), 2)"
    "fetch 0x18378 \<equiv> (Unary (IS_8088 Jg) (Immediate SixtyFour (ImmVal 99248)), 2)"
    "fetch 0x1837a \<equiv> (Binary (IS_8088 Mov) (Reg (General ThirtyTwo rax)) (Storage (Reg (General ThirtyTwo r12))), 3)"
    "fetch 0x1837d \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour rdi)) (Storage (Memory SixtyFour (A_SizeDirective 64 (A_Plus (A_FromReg (General SixtyFour rsp)) (A_WordConstant 536))))), 8)"
    "fetch 0x18385 \<equiv> (Binary (IS_8088 Xor) (Reg (General SixtyFour rdi)) (Storage (Memory SixtyFour (A_SizeDirective 64 (A_Plus (A_FromReg (General SixtyFour fs)) (A_WordConstant 40))))), 9)"
    "fetch 0x1838e \<equiv> (Unary (IS_8088 Jne) (Immediate SixtyFour (ImmVal 99578)), 6)"
    "fetch 0x18394 \<equiv> (Binary (IS_8088 Add) (Reg (General SixtyFour rsp)) (Immediate SixtyFour (ImmVal 552)), 7)"
    "fetch 0x1839b \<equiv> (Unary (IS_8088 Pop) (Storage (Reg (General SixtyFour rbx))), 1)"
    "fetch 0x1839c \<equiv> (Unary (IS_8088 Pop) (Storage (Reg (General SixtyFour rbp))), 1)"
    "fetch 0x1839d \<equiv> (Unary (IS_8088 Pop) (Storage (Reg (General SixtyFour r12))), 2)"
    "fetch 0x1839f \<equiv> (Unary (IS_8088 Pop) (Storage (Reg (General SixtyFour r13))), 2)"
    "fetch 0x183a1 \<equiv> (Unary (IS_8088 Pop) (Storage (Reg (General SixtyFour r14))), 2)"
    "fetch 0x183a3 \<equiv> (Unary (IS_8088 Pop) (Storage (Reg (General SixtyFour r15))), 2)"
    "fetch 0x183a5 \<equiv> (Nullary (IS_8088 Ret), 1)"
    "fetch 0x183a6 \<equiv> (Unary (IS_8088 Nop) (Storage (Memory Sixteen (A_SizeDirective 16 (A_Plus (A_FromReg (General SixtyFour cs)) (A_Plus (A_FromReg (General SixtyFour rax)) (A_Plus (A_Mult 1 (A_FromReg (General SixtyFour rax))) (A_WordConstant 0))))))), 10)"
    "fetch 0x183b0 \<equiv> (Binary (IS_8088 Lea) (Reg (General SixtyFour rbx)) (Storage (Memory SixtyFour (A_Plus (A_FromReg (General SixtyFour rsp)) (A_WordConstant 16)))), 5)"
    "fetch 0x183b5 \<equiv> (Binary (IS_8088 Mov) (Reg (General ThirtyTwo rcx)) (Immediate SixtyFour (ImmVal 1)), 5)"
    "fetch 0x183ba \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour rsi)) (Storage (Reg (General SixtyFour r15))), 3)"
    "fetch 0x183bd \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour rdi)) (Storage (Reg (General SixtyFour r8))), 3)"
    "fetch 0x183c0 \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour rdx)) (Storage (Reg (General SixtyFour rbx))), 3)"
    "fetch 0x183c3 \<equiv> (Unary (IS_8088 Call) (Immediate SixtyFour (ImmLabel ''bdrv_read'')), 5)"
    "fetch 0x183c8 \<equiv> (Binary (IS_8088 Test) (Reg (General ThirtyTwo rax)) (Storage (Reg (General ThirtyTwo rax))), 2)"
    "fetch 0x183ca \<equiv> (Unary (IS_8088 Js) (Immediate SixtyFour (ImmVal 99568)), 6)"
    "fetch 0x183d0 \<equiv> (Binary (IS_X86_64 Movsxd) (Reg (General SixtyFour rdx)) (Storage (Reg (General ThirtyTwo rbp))), 3)"
    "fetch 0x183d3 \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour rsi)) (Storage (Reg (General SixtyFour rbx))), 3)"
    "fetch 0x183d6 \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour rdi)) (Storage (Reg (General SixtyFour r14))), 3)"
    "fetch 0x183d9 \<equiv> (Unary (IS_8088 Call) (Immediate SixtyFour (ImmLabel ''memcpy'')), 5)"
    "fetch 0x183de \<equiv> (Unary (IS_8088 Jmp) (Immediate SixtyFour (ImmVal 99194)), 2)"
    "fetch 0x183e0 \<equiv> (Binary (IS_8088 Lea) (Reg (General SixtyFour rbp)) (Storage (Memory SixtyFour (A_Plus (A_FromReg (General SixtyFour rsp)) (A_WordConstant 16)))), 5)"
    "fetch 0x183e5 \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour r13)) (Storage (Reg (General SixtyFour rsi))), 3)"
    "fetch 0x183e8 \<equiv> (Binary (IS_8088 Mov) (Reg (General ThirtyTwo rcx)) (Immediate SixtyFour (ImmVal 1)), 5)"
    "fetch 0x183ed \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour rsi)) (Storage (Reg (General SixtyFour r15))), 3)"
    "fetch 0x183f0 \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour rdx)) (Storage (Reg (General SixtyFour rbp))), 3)"
    "fetch 0x183f3 \<equiv> (Binary (IS_8088 Mov) (Memory SixtyFour (A_SizeDirective 64 (A_Plus (A_FromReg (General SixtyFour rsp)) (A_WordConstant 8)))) (Storage (Reg (General SixtyFour rdi))), 5)"
    "fetch 0x183f8 \<equiv> (Unary (IS_8088 Call) (Immediate SixtyFour (ImmLabel ''bdrv_read'')), 5)"
    "fetch 0x183fd \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour r8)) (Storage (Memory SixtyFour (A_SizeDirective 64 (A_Plus (A_FromReg (General SixtyFour rsp)) (A_WordConstant 8))))), 5)"
    "fetch 0x18402 \<equiv> (Binary (IS_8088 Test) (Reg (General ThirtyTwo rax)) (Storage (Reg (General ThirtyTwo rax))), 2)"
    "fetch 0x18404 \<equiv> (Unary (IS_8088 Js) (Immediate SixtyFour (ImmVal 99568)), 6)"
    "fetch 0x1840a \<equiv> (Binary (IS_8088 And) (Reg (General ThirtyTwo r13)) (Immediate SixtyFour (ImmVal 511)), 7)"
    "fetch 0x18411 \<equiv> (Binary (IS_X86_64 Movsxd) (Reg (General SixtyFour rax)) (Storage (Reg (General ThirtyTwo rbx))), 3)"
    "fetch 0x18414 \<equiv> (Binary (IS_8088 Lea) (Reg (General SixtyFour rsi)) (Storage (Memory SixtyFour (A_Plus (A_FromReg (General SixtyFour rbp)) (A_Plus (A_Mult 1 (A_FromReg (General SixtyFour r13))) (A_WordConstant 0))))), 5)"
    "fetch 0x18419 \<equiv> (Binary (IS_8088 Cmp) (Reg (General ThirtyTwo rbx)) (Immediate SixtyFour (ImmVal 8)), 3)"
    "fetch 0x1841c \<equiv> (Unary (IS_8088 Jae) (Immediate SixtyFour (ImmVal 99472)), 2)"
    "fetch 0x1841e \<equiv> (Binary (IS_8088 Test) (Reg (General Eight rbx)) (Immediate SixtyFour (ImmVal 4)), 3)"
    "fetch 0x18421 \<equiv> (Unary (IS_8088 Jne) (Immediate SixtyFour (ImmVal 99544)), 6)"
    "fetch 0x18427 \<equiv> (Binary (IS_8088 Test) (Reg (General ThirtyTwo rbx)) (Storage (Reg (General ThirtyTwo rbx))), 2)"
    "fetch 0x18429 \<equiv> (Unary (IS_8088 Je) (Immediate SixtyFour (ImmVal 99515)), 6)"
    "fetch 0x1842f \<equiv> (Binary (IS_80386 Movzx) (Reg (General ThirtyTwo rdx)) (Storage (Memory Eight (A_SizeDirective 8 (A_FromReg (General SixtyFour rsi))))), 3)"
    "fetch 0x18432 \<equiv> (Binary (IS_8088 Mov) (Memory Eight (A_SizeDirective 8 (A_FromReg (General SixtyFour r14)))) (Storage (Reg (General Eight rdx))), 3)"
    "fetch 0x18435 \<equiv> (Binary (IS_8088 Test) (Reg (General Eight rbx)) (Immediate SixtyFour (ImmVal 2)), 3)"
    "fetch 0x18438 \<equiv> (Unary (IS_8088 Je) (Immediate SixtyFour (ImmVal 99515)), 6)"
    "fetch 0x1843e \<equiv> (Binary (IS_8088 Mov) (Reg (General ThirtyTwo rdx)) (Storage (Reg (General ThirtyTwo rbx))), 2)"
    "fetch 0x18440 \<equiv> (Binary (IS_80386 Movzx) (Reg (General ThirtyTwo rcx)) (Storage (Memory Sixteen (A_SizeDirective 16 (A_Plus (A_FromReg (General SixtyFour rsi)) (A_Minus (A_Mult 1 (A_FromReg (General SixtyFour rdx))) (A_WordConstant 2)))))), 5)"
    "fetch 0x18445 \<equiv> (Binary (IS_8088 Mov) (Memory Sixteen (A_SizeDirective 16 (A_Plus (A_FromReg (General SixtyFour r14)) (A_Minus (A_Mult 1 (A_FromReg (General SixtyFour rdx))) (A_WordConstant 2))))) (Storage (Reg (General Sixteen rcx))), 6)"
    "fetch 0x1844b \<equiv> (Unary (IS_8088 Jmp) (Immediate SixtyFour (ImmVal 99515)), 2)"
    "fetch 0x1844d \<equiv> (Unary (IS_8088 Nop) (Storage (Memory ThirtyTwo (A_SizeDirective 32 (A_FromReg (General SixtyFour rax))))), 3)"
    "fetch 0x18450 \<equiv> (Binary (IS_8088 Mov) (Reg (General ThirtyTwo rcx)) (Storage (Reg (General ThirtyTwo rbx))), 2)"
    "fetch 0x18452 \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour rdx)) (Storage (Reg (General SixtyFour r14))), 3)"
    "fetch 0x18455 \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour rsi)) (Storage (Reg (General SixtyFour r15))), 3)"
    "fetch 0x18458 \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour rdi)) (Storage (Reg (General SixtyFour r8))), 3)"
    "fetch 0x1845b \<equiv> (Binary (IS_8088 Mov) (Memory SixtyFour (A_SizeDirective 64 (A_Plus (A_FromReg (General SixtyFour rsp)) (A_WordConstant 8)))) (Storage (Reg (General SixtyFour r8))), 5)"
    "fetch 0x18460 \<equiv> (Unary (IS_8088 Call) (Immediate SixtyFour (ImmLabel ''bdrv_read'')), 5)"
    "fetch 0x18465 \<equiv> (Binary (IS_8088 Test) (Reg (General ThirtyTwo rax)) (Storage (Reg (General ThirtyTwo rax))), 2)"
    "fetch 0x18467 \<equiv> (Unary (IS_8088 Js) (Immediate SixtyFour (ImmVal 99568)), 6)"
    "fetch 0x1846d \<equiv> (Binary (IS_8088 Mov) (Reg (General ThirtyTwo rax)) (Storage (Reg (General ThirtyTwo rbp))), 2)"
    "fetch 0x1846f \<equiv> (Binary (IS_X86_64 Movsxd) (Reg (General SixtyFour rbx)) (Storage (Reg (General ThirtyTwo rbx))), 3)"
    "fetch 0x18472 \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour r8)) (Storage (Memory SixtyFour (A_SizeDirective 64 (A_Plus (A_FromReg (General SixtyFour rsp)) (A_WordConstant 8))))), 5)"
    "fetch 0x18477 \<equiv> (Binary (IS_8088 And) (Reg (General ThirtyTwo rax)) (Immediate SixtyFour (ImmVal 4294966784)), 5)"
    "fetch 0x1847c \<equiv> (Binary (IS_8088 Add) (Reg (General SixtyFour r15)) (Storage (Reg (General SixtyFour rbx))), 3)"
    "fetch 0x1847f \<equiv> (Binary (IS_X86_64 Movsxd) (Reg (General SixtyFour rdx)) (Storage (Reg (General ThirtyTwo rax))), 3)"
    "fetch 0x18482 \<equiv> (Binary (IS_8088 Sub) (Reg (General ThirtyTwo rbp)) (Storage (Reg (General ThirtyTwo rax))), 2)"
    "fetch 0x18484 \<equiv> (Binary (IS_8088 Add) (Reg (General SixtyFour r14)) (Storage (Reg (General SixtyFour rdx))), 3)"
    "fetch 0x18487 \<equiv> (Unary (IS_8088 Jmp) (Immediate SixtyFour (ImmVal 99190)), 5)"
    "fetch 0x1848c \<equiv> (Unary (IS_8088 Nop) (Storage (Memory ThirtyTwo (A_SizeDirective 32 (A_Plus (A_FromReg (General SixtyFour rax)) (A_WordConstant 0))))), 4)"
    "fetch 0x18490 \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour rdx)) (Storage (Memory SixtyFour (A_SizeDirective 64 (A_FromReg (General SixtyFour rsi))))), 3)"
    "fetch 0x18493 \<equiv> (Binary (IS_8088 Lea) (Reg (General SixtyFour rdi)) (Storage (Memory SixtyFour (A_Plus (A_FromReg (General SixtyFour r14)) (A_WordConstant 8)))), 4)"
    "fetch 0x18497 \<equiv> (Binary (IS_8088 And) (Reg (General SixtyFour rdi)) (Immediate SixtyFour (ImmVal 18446744073709551608)), 4)"
    "fetch 0x1849b \<equiv> (Binary (IS_8088 Mov) (Memory SixtyFour (A_SizeDirective 64 (A_FromReg (General SixtyFour r14)))) (Storage (Reg (General SixtyFour rdx))), 3)"
    "fetch 0x1849e \<equiv> (Binary (IS_8088 Mov) (Reg (General ThirtyTwo rdx)) (Storage (Reg (General ThirtyTwo rbx))), 2)"
    "fetch 0x184a0 \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour rcx)) (Storage (Memory SixtyFour (A_SizeDirective 64 (A_Plus (A_FromReg (General SixtyFour rsi)) (A_Minus (A_Mult 1 (A_FromReg (General SixtyFour rdx))) (A_WordConstant 8)))))), 5)"
    "fetch 0x184a5 \<equiv> (Binary (IS_8088 Mov) (Memory SixtyFour (A_SizeDirective 64 (A_Plus (A_FromReg (General SixtyFour r14)) (A_Minus (A_Mult 1 (A_FromReg (General SixtyFour rdx))) (A_WordConstant 8))))) (Storage (Reg (General SixtyFour rcx))), 5)"
    "fetch 0x184aa \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour rcx)) (Storage (Reg (General SixtyFour r14))), 3)"
    "fetch 0x184ad \<equiv> (Binary (IS_8088 Sub) (Reg (General SixtyFour rcx)) (Storage (Reg (General SixtyFour rdi))), 3)"
    "fetch 0x184b0 \<equiv> (Binary (IS_8088 Sub) (Reg (General SixtyFour rsi)) (Storage (Reg (General SixtyFour rcx))), 3)"
    "fetch 0x184b3 \<equiv> (Binary (IS_8088 Add) (Reg (General ThirtyTwo rcx)) (Storage (Reg (General ThirtyTwo rbx))), 2)"
    "fetch 0x184b5 \<equiv> (Binary (IS_8088 Shr) (Reg (General ThirtyTwo rcx)) (Immediate SixtyFour (ImmVal 3)), 3)"
    "fetch 0x184b8 \<equiv> (Unary (IS_8088 Call) (Immediate SixtyFour (ImmLabel ''rep_movs_ESRDI_DSRSI'')), 3)"
    "fetch 0x184bb \<equiv> (Binary (IS_8088 Mov) (Reg (General ThirtyTwo rbp)) (Storage (Reg (General ThirtyTwo r12))), 3)"
    "fetch 0x184be \<equiv> (Binary (IS_8088 Add) (Reg (General SixtyFour r15)) (Immediate SixtyFour (ImmVal 1)), 4)"
    "fetch 0x184c2 \<equiv> (Binary (IS_8088 Add) (Reg (General SixtyFour r14)) (Storage (Reg (General SixtyFour rax))), 3)"
    "fetch 0x184c5 \<equiv> (Binary (IS_8088 Sub) (Reg (General ThirtyTwo rbp)) (Storage (Reg (General ThirtyTwo rbx))), 2)"
    "fetch 0x184c7 \<equiv> (Unary (IS_8088 Jne) (Immediate SixtyFour (ImmVal 99177)), 6)"
    "fetch 0x184cd \<equiv> (Unary (IS_8088 Jmp) (Immediate SixtyFour (ImmVal 99194)), 5)"
    "fetch 0x184d2 \<equiv> (Unary (IS_8088 Nop) (Storage (Memory Sixteen (A_SizeDirective 16 (A_Plus (A_FromReg (General SixtyFour rax)) (A_Plus (A_Mult 1 (A_FromReg (General SixtyFour rax))) (A_WordConstant 0)))))), 6)"
    "fetch 0x184d8 \<equiv> (Binary (IS_8088 Mov) (Reg (General ThirtyTwo rdx)) (Storage (Memory ThirtyTwo (A_SizeDirective 32 (A_FromReg (General SixtyFour rsi))))), 2)"
    "fetch 0x184da \<equiv> (Binary (IS_8088 Mov) (Memory ThirtyTwo (A_SizeDirective 32 (A_FromReg (General SixtyFour r14)))) (Storage (Reg (General ThirtyTwo rdx))), 3)"
    "fetch 0x184dd \<equiv> (Binary (IS_8088 Mov) (Reg (General ThirtyTwo rdx)) (Storage (Reg (General ThirtyTwo rbx))), 2)"
    "fetch 0x184df \<equiv> (Binary (IS_8088 Mov) (Reg (General ThirtyTwo rcx)) (Storage (Memory ThirtyTwo (A_SizeDirective 32 (A_Plus (A_FromReg (General SixtyFour rsi)) (A_Minus (A_Mult 1 (A_FromReg (General SixtyFour rdx))) (A_WordConstant 4)))))), 4)"
    "fetch 0x184e3 \<equiv> (Binary (IS_8088 Mov) (Memory ThirtyTwo (A_SizeDirective 32 (A_Plus (A_FromReg (General SixtyFour r14)) (A_Minus (A_Mult 1 (A_FromReg (General SixtyFour rdx))) (A_WordConstant 4))))) (Storage (Reg (General ThirtyTwo rcx))), 5)"
    "fetch 0x184e8 \<equiv> (Unary (IS_8088 Jmp) (Immediate SixtyFour (ImmVal 99515)), 2)"
    "fetch 0x184ea \<equiv> (Unary (IS_8088 Nop) (Storage (Memory Sixteen (A_SizeDirective 16 (A_Plus (A_FromReg (General SixtyFour rax)) (A_Plus (A_Mult 1 (A_FromReg (General SixtyFour rax))) (A_WordConstant 0)))))), 6)"
    "fetch 0x184f0 \<equiv> (Binary (IS_8088 Mov) (Reg (General ThirtyTwo rax)) (Immediate SixtyFour (ImmVal 4294967291)), 5)"
    "fetch 0x184f5 \<equiv> (Unary (IS_8088 Jmp) (Immediate SixtyFour (ImmVal 99197)), 5)"
    "fetch 0x184fa \<equiv> (Unary (IS_8088 Call) (Immediate SixtyFour (ImmLabel ''__stack_chk_fail'')), 5)"
    and \<alpha>_def: \<open>\<alpha> = \<lparr>text_sections = [], data_sections = [], labels_to_offsets = [], binary_offset = 0\<rparr>\<close>
    and stack_chk_fail\<^sub>a\<^sub>d\<^sub>d\<^sub>r[simp]: \<open>the (label_to_address \<alpha> ''__stack_chk_fail'') = stack_chk_fail_addr\<close>
    and bdrv_read\<^sub>a\<^sub>d\<^sub>d\<^sub>r[simp]: \<open>the (label_to_address \<alpha> ''bdrv_read'') = bdrv_read_addr\<close>
    and memcpy\<^sub>a\<^sub>d\<^sub>d\<^sub>r[simp]: \<open>the (label_to_address \<alpha> ''memcpy'') = memcpy_addr\<close>
    and rep_movs_ESRDI_DSRSI\<^sub>a\<^sub>d\<^sub>d\<^sub>r[simp]: \<open>the (label_to_address \<alpha> ''rep_movs_ESRDI_DSRSI'') = rep_movs_ESRDI_DSRSI_addr\<close>
begin

text \<open>Using definitions that don't get unfolded immediately prevents locale argument issues.\<close>
definition \<open>bdrv_read_0x183c3_retval \<equiv> bdrv_read_0x183c3_retval\<^sub>v\<close>
definition \<open>memcpy_0x183d9_retval \<equiv> memcpy_0x183d9_retval\<^sub>v\<close>
definition \<open>bdrv_read_0x183f8_retval \<equiv> bdrv_read_0x183f8_retval\<^sub>v\<close>
definition \<open>bdrv_read_0x18460_retval \<equiv> bdrv_read_0x18460_retval\<^sub>v\<close>
definition \<open>rep_movs_ESRDI_DSRSI_0x184b8_retval \<equiv> rep_movs_ESRDI_DSRSI_0x184b8_retval\<^sub>v\<close>
definition \<open>stack_chk_fail_0x184fa_retval \<equiv> stack_chk_fail_0x184fa_retval\<^sub>v\<close>

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

locale "bdrv_pread_em" = "qemu_img_xen" +
  fixes RAX\<^sub>0\<^sub>v RBX\<^sub>0\<^sub>v RCX\<^sub>0\<^sub>v RDX\<^sub>0\<^sub>v RDI\<^sub>0\<^sub>v RSI\<^sub>0\<^sub>v RSP\<^sub>0\<^sub>v RBP\<^sub>0\<^sub>v R15\<^sub>0\<^sub>v R14\<^sub>0\<^sub>v R13\<^sub>0\<^sub>v R12\<^sub>0\<^sub>v R8\<^sub>0\<^sub>v FS\<^sub>0\<^sub>v ret_address\<^sub>v :: \<open>64 word\<close>
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
definition \<open>FS\<^sub>0 \<equiv> FS\<^sub>0\<^sub>v\<close>
definition \<open>ret_address \<equiv> ret_address\<^sub>v\<close>

definition P_0x18320_0 :: state_pred where
  \<open>P_0x18320_0 \<sigma> \<equiv> RIP \<sigma> = 0x18320 \<and> RAX \<sigma> = RAX\<^sub>0 \<and> RBX \<sigma> = RBX\<^sub>0 \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = RDX\<^sub>0 \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = RSP\<^sub>0 \<and> RBP \<sigma> = RBP\<^sub>0 \<and> R15 \<sigma> = R15\<^sub>0 \<and> R14 \<sigma> = R14\<^sub>0 \<and> R13 \<sigma> = R13\<^sub>0 \<and> R12 \<sigma> = R12\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address\<close>
declare P_0x18320_0_def[Ps]

definition P_0x18320_0_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x18320_0_regions_set \<sigma> \<equiv> {
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

definition P_0x18320_0_regions :: state_pred where
  \<open>P_0x18320_0_regions \<sigma> \<equiv> \<exists>regions. P_0x18320_0_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x18367_0 :: state_pred where
  \<open>Q_0x18367_0 \<sigma> \<equiv> RIP \<sigma> = 0x18367 \<and> RAX \<sigma> = 0x0 \<and> RBX \<sigma> = ucast ((if' ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) \<le>s (((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff) then (\<langle>31,0\<rangle>RCX\<^sub>0::32 word) else ((((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff)::32 word))) \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = RDX\<^sub>0 \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x258) \<and> RBP \<sigma> = ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)) \<and> R15 \<sigma> = ((ucast ((RSI\<^sub>0::64 word))::64 word) >>> 9) \<and> R14 \<sigma> = RDX\<^sub>0 \<and> R13 \<sigma> = R13\<^sub>0 \<and> R12 \<sigma> = ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)) \<and> R8 \<sigma> = RDI\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word)\<close>
declare Q_0x18367_0_def[Qs]

schematic_goal bdrv_pread_em_0_22_0x18320_0x18365_0[blocks]:
  assumes \<open>(P_0x18320_0 && P_0x18320_0_regions) \<sigma>\<close>
  shows \<open>exec_block 22 0x18365 0 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x18367_0 ?\<sigma> \<and> block_usage P_0x18320_0_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x18320_0_def P_0x18320_0_regions_def post: Q_0x18367_0_def regionset: P_0x18320_0_regions_set_def)

definition P_0x18367_true_1 :: state_pred where
  \<open>P_0x18367_true_1 \<sigma> \<equiv> RIP \<sigma> = 0x18367 \<and> RAX \<sigma> = 0x0 \<and> RBX \<sigma> = ucast ((if' ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) \<le>s (((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff) then (\<langle>31,0\<rangle>RCX\<^sub>0::32 word) else ((((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff)::32 word))) \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = RDX\<^sub>0 \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x258) \<and> RBP \<sigma> = ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)) \<and> R15 \<sigma> = ((ucast ((RSI\<^sub>0::64 word))::64 word) >>> 9) \<and> R14 \<sigma> = RDX\<^sub>0 \<and> R13 \<sigma> = R13\<^sub>0 \<and> R12 \<sigma> = ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)) \<and> R8 \<sigma> = RDI\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word)\<close>
declare P_0x18367_true_1_def[Ps]

definition P_0x18367_true_1_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x18367_true_1_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((FS\<^sub>0::64 word) + 0x28), 8),
    (2, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x40), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x250), 8)
  }\<close>

definition P_0x18367_true_1_regions :: state_pred where
  \<open>P_0x18367_true_1_regions \<sigma> \<equiv> \<exists>regions. P_0x18367_true_1_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x183f8_1 :: state_pred where
  \<open>Q_0x183f8_1 \<sigma> \<equiv> RIP \<sigma> = 0x183f8 \<and> RAX \<sigma> = 0x0 \<and> RBX \<sigma> = ucast ((if' ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) \<le>s (((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff) then (\<langle>31,0\<rangle>RCX\<^sub>0::32 word) else ((((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff)::32 word))) \<and> RCX \<sigma> = 0x1 \<and> RDX \<sigma> = ((RSP\<^sub>0::64 word) - 0x248) \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = ((ucast ((RSI\<^sub>0::64 word))::64 word) >>> 9) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x258) \<and> RBP \<sigma> = ((RSP\<^sub>0::64 word) - 0x248) \<and> R15 \<sigma> = ((ucast ((RSI\<^sub>0::64 word))::64 word) >>> 9) \<and> R14 \<sigma> = RDX\<^sub>0 \<and> R13 \<sigma> = RSI\<^sub>0 \<and> R12 \<sigma> = ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)) \<and> R8 \<sigma> = RDI\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x250),8]::64 word) = RDI\<^sub>0\<close>
declare Q_0x183f8_1_def[Qs]

schematic_goal bdrv_pread_em_0_7_0x18367_0x183f3_1[blocks]:
  assumes \<open>(P_0x18367_true_1 && P_0x18367_true_1_regions && jg) \<sigma>\<close>
  shows \<open>exec_block 7 0x183f3 (Suc 0) \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x183f8_1 ?\<sigma> \<and> block_usage P_0x18367_true_1_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x18367_true_1_def P_0x18367_true_1_regions_def post: Q_0x183f8_1_def regionset: P_0x18367_true_1_regions_set_def)

definition P_0x183f8_2 :: state_pred where
  \<open>P_0x183f8_2 \<sigma> \<equiv> RIP \<sigma> = 0x183f8 \<and> RAX \<sigma> = 0x0 \<and> RBX \<sigma> = ucast ((if' ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) \<le>s (((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff) then (\<langle>31,0\<rangle>RCX\<^sub>0::32 word) else ((((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff)::32 word))) \<and> RCX \<sigma> = 0x1 \<and> RDX \<sigma> = ((RSP\<^sub>0::64 word) - 0x248) \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = ((ucast ((RSI\<^sub>0::64 word))::64 word) >>> 9) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x258) \<and> RBP \<sigma> = ((RSP\<^sub>0::64 word) - 0x248) \<and> R15 \<sigma> = ((ucast ((RSI\<^sub>0::64 word))::64 word) >>> 9) \<and> R14 \<sigma> = RDX\<^sub>0 \<and> R13 \<sigma> = RSI\<^sub>0 \<and> R12 \<sigma> = ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)) \<and> R8 \<sigma> = RDI\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x250),8]::64 word) = RDI\<^sub>0\<close>
declare P_0x183f8_2_def[Ps]

definition P_0x183f8_2_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x183f8_2_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((FS\<^sub>0::64 word) + 0x28), 8),
    (2, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x40), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x250), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x260), 8)
  }\<close>

definition P_0x183f8_2_regions :: state_pred where
  \<open>P_0x183f8_2_regions \<sigma> \<equiv> \<exists>regions. P_0x183f8_2_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_bdrv_read_addr_0x183f8_2 :: state_pred where
  \<open>Q_bdrv_read_addr_0x183f8_2 \<sigma> \<equiv> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x260) \<and> RIP \<sigma> = bdrv_read_addr \<and> RAX \<sigma> = 0x0 \<and> RBX \<sigma> = ucast ((if' ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) \<le>s (((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff) then (\<langle>31,0\<rangle>RCX\<^sub>0::32 word) else ((((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff)::32 word))) \<and> RCX \<sigma> = 0x1 \<and> RDX \<sigma> = ((RSP\<^sub>0::64 word) - 0x248) \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = ((ucast ((RSI\<^sub>0::64 word))::64 word) >>> 9) \<and> RBP \<sigma> = ((RSP\<^sub>0::64 word) - 0x248) \<and> R15 \<sigma> = ((ucast ((RSI\<^sub>0::64 word))::64 word) >>> 9) \<and> R14 \<sigma> = RDX\<^sub>0 \<and> R13 \<sigma> = RSI\<^sub>0 \<and> R12 \<sigma> = ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)) \<and> R8 \<sigma> = RDI\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x250),8]::64 word) = RDI\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x260),8]::64 word) = 0x183fd\<close>
declare Q_bdrv_read_addr_0x183f8_2_def[Qs]

schematic_goal bdrv_pread_em_0_1_0x183f8_0x183f8_2[blocks]:
  assumes \<open>(P_0x183f8_2 && P_0x183f8_2_regions) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x183f8 2 \<sigma> \<triangleq> ?\<sigma> \<and> Q_bdrv_read_addr_0x183f8_2 ?\<sigma> \<and> block_usage P_0x183f8_2_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x183f8_2_def P_0x183f8_2_regions_def post: Q_bdrv_read_addr_0x183f8_2_def regionset: P_0x183f8_2_regions_set_def)

definition P_0x183fd_3 :: state_pred where
  \<open>P_0x183fd_3 \<sigma> \<equiv> RIP \<sigma> = 0x183fd \<and> RAX \<sigma> = bdrv_read_0x183f8_retval \<and> RBX \<sigma> = ucast ((if' ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) \<le>s (((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff) then (\<langle>31,0\<rangle>RCX\<^sub>0::32 word) else ((((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff)::32 word))) \<and> RCX \<sigma> = 0x1 \<and> RDX \<sigma> = ((RSP\<^sub>0::64 word) - 0x248) \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = ((ucast ((RSI\<^sub>0::64 word))::64 word) >>> 9) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x258) \<and> RBP \<sigma> = ((RSP\<^sub>0::64 word) - 0x248) \<and> R15 \<sigma> = ((ucast ((RSI\<^sub>0::64 word))::64 word) >>> 9) \<and> R14 \<sigma> = RDX\<^sub>0 \<and> R13 \<sigma> = RSI\<^sub>0 \<and> R12 \<sigma> = ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)) \<and> R8 \<sigma> = RDI\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x250),8]::64 word) = RDI\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x260),8]::64 word) = 0x183fd\<close>
declare P_0x183fd_3_def[Ps]

definition P_0x183fd_3_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x183fd_3_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((FS\<^sub>0::64 word) + 0x28), 8),
    (2, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x40), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x250), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x260), 8)
  }\<close>

definition P_0x183fd_3_regions :: state_pred where
  \<open>P_0x183fd_3_regions \<sigma> \<equiv> \<exists>regions. P_0x183fd_3_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x18404_3 :: state_pred where
  \<open>Q_0x18404_3 \<sigma> \<equiv> RIP \<sigma> = 0x18404 \<and> RAX \<sigma> = bdrv_read_0x183f8_retval \<and> RBX \<sigma> = ucast ((if' ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) \<le>s (((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff) then (\<langle>31,0\<rangle>RCX\<^sub>0::32 word) else ((((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff)::32 word))) \<and> RCX \<sigma> = 0x1 \<and> RDX \<sigma> = ((RSP\<^sub>0::64 word) - 0x248) \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = ((ucast ((RSI\<^sub>0::64 word))::64 word) >>> 9) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x258) \<and> RBP \<sigma> = ((RSP\<^sub>0::64 word) - 0x248) \<and> R15 \<sigma> = ((ucast ((RSI\<^sub>0::64 word))::64 word) >>> 9) \<and> R14 \<sigma> = RDX\<^sub>0 \<and> R13 \<sigma> = RSI\<^sub>0 \<and> R12 \<sigma> = ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)) \<and> R8 \<sigma> = RDI\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x250),8]::64 word) = RDI\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x260),8]::64 word) = 0x183fd\<close>
declare Q_0x18404_3_def[Qs]

schematic_goal bdrv_pread_em_0_2_0x183fd_0x18402_3[blocks]:
  assumes \<open>(P_0x183fd_3 && P_0x183fd_3_regions) \<sigma>\<close>
  shows \<open>exec_block 2 0x18402 3 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x18404_3 ?\<sigma> \<and> block_usage P_0x183fd_3_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x183fd_3_def P_0x183fd_3_regions_def post: Q_0x18404_3_def regionset: P_0x183fd_3_regions_set_def)

definition P_0x18404_true_4 :: state_pred where
  \<open>P_0x18404_true_4 \<sigma> \<equiv> RIP \<sigma> = 0x18404 \<and> RAX \<sigma> = bdrv_read_0x183f8_retval \<and> RBX \<sigma> = ucast ((if' ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) \<le>s (((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff) then (\<langle>31,0\<rangle>RCX\<^sub>0::32 word) else ((((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff)::32 word))) \<and> RCX \<sigma> = 0x1 \<and> RDX \<sigma> = ((RSP\<^sub>0::64 word) - 0x248) \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = ((ucast ((RSI\<^sub>0::64 word))::64 word) >>> 9) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x258) \<and> RBP \<sigma> = ((RSP\<^sub>0::64 word) - 0x248) \<and> R15 \<sigma> = ((ucast ((RSI\<^sub>0::64 word))::64 word) >>> 9) \<and> R14 \<sigma> = RDX\<^sub>0 \<and> R13 \<sigma> = RSI\<^sub>0 \<and> R12 \<sigma> = ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)) \<and> R8 \<sigma> = RDI\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x250),8]::64 word) = RDI\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x260),8]::64 word) = 0x183fd\<close>
declare P_0x18404_true_4_def[Ps]

definition P_0x18404_true_4_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x18404_true_4_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((FS\<^sub>0::64 word) + 0x28), 8),
    (2, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x40), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x250), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x260), 8)
  }\<close>

definition P_0x18404_true_4_regions :: state_pred where
  \<open>P_0x18404_true_4_regions \<sigma> \<equiv> \<exists>regions. P_0x18404_true_4_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x1837d_4 :: state_pred where
  \<open>Q_0x1837d_4 \<sigma> \<equiv> RIP \<sigma> = 0x1837d \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x258) \<and> R12 \<sigma> = ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)) \<and> R8 \<sigma> = RDI\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word)\<close>
declare Q_0x1837d_4_def[Qs]

schematic_goal bdrv_pread_em_0_3_0x18404_0x184f5_4[blocks]:
  assumes \<open>(P_0x18404_true_4 && P_0x18404_true_4_regions && SF) \<sigma>\<close>
  shows \<open>exec_block 3 0x184f5 4 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x1837d_4 ?\<sigma> \<and> block_usage P_0x18404_true_4_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x18404_true_4_def P_0x18404_true_4_regions_def post: Q_0x1837d_4_def regionset: P_0x18404_true_4_regions_set_def)

definition P_0x18404_false_5 :: state_pred where
  \<open>P_0x18404_false_5 \<sigma> \<equiv> RIP \<sigma> = 0x18404 \<and> RAX \<sigma> = bdrv_read_0x183f8_retval \<and> RBX \<sigma> = ucast ((if' ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) \<le>s (((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff) then (\<langle>31,0\<rangle>RCX\<^sub>0::32 word) else ((((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff)::32 word))) \<and> RCX \<sigma> = 0x1 \<and> RDX \<sigma> = ((RSP\<^sub>0::64 word) - 0x248) \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = ((ucast ((RSI\<^sub>0::64 word))::64 word) >>> 9) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x258) \<and> RBP \<sigma> = ((RSP\<^sub>0::64 word) - 0x248) \<and> R15 \<sigma> = ((ucast ((RSI\<^sub>0::64 word))::64 word) >>> 9) \<and> R14 \<sigma> = RDX\<^sub>0 \<and> R13 \<sigma> = RSI\<^sub>0 \<and> R12 \<sigma> = ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)) \<and> R8 \<sigma> = RDI\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x250),8]::64 word) = RDI\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x260),8]::64 word) = 0x183fd\<close>
declare P_0x18404_false_5_def[Ps]

definition P_0x18404_false_5_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x18404_false_5_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((FS\<^sub>0::64 word) + 0x28), 8),
    (2, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x40), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x250), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x260), 8)
  }\<close>

definition P_0x18404_false_5_regions :: state_pred where
  \<open>P_0x18404_false_5_regions \<sigma> \<equiv> \<exists>regions. P_0x18404_false_5_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x1841c_5 :: state_pred where
  \<open>Q_0x1841c_5 \<sigma> \<equiv> RIP \<sigma> = 0x1841c \<and> RAX \<sigma> = (sextend (ucast ((if' ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) \<le>s (((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff) then (\<langle>31,0\<rangle>RCX\<^sub>0::32 word) else ((((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff)::32 word)))) 32 64::64 word) \<and> RBX \<sigma> = ucast ((if' ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) \<le>s (((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff) then (\<langle>31,0\<rangle>RCX\<^sub>0::32 word) else ((((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff)::32 word))) \<and> RCX \<sigma> = 0x1 \<and> RDX \<sigma> = ((RSP\<^sub>0::64 word) - 0x248) \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = ((((RSP\<^sub>0::64 word) + (\<langle>63,0\<rangle>((((ucast (((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word))::64 word) AND (0x1ff::64 word))::64 word) * 0x1)::64 word))::64 word) - 0x248) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x258) \<and> RBP \<sigma> = ((RSP\<^sub>0::64 word) - 0x248) \<and> R15 \<sigma> = ((ucast ((RSI\<^sub>0::64 word))::64 word) >>> 9) \<and> R14 \<sigma> = RDX\<^sub>0 \<and> R13 \<sigma> = ucast ((((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) AND 0x1ff)) \<and> R12 \<sigma> = ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)) \<and> R8 \<sigma> = RDI\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x250),8]::64 word) = RDI\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x260),8]::64 word) = 0x183fd\<close>
declare Q_0x1841c_5_def[Qs]

schematic_goal bdrv_pread_em_0_5_0x18404_0x18419_5[blocks]:
  assumes \<open>(P_0x18404_false_5 && P_0x18404_false_5_regions && ! SF) \<sigma>\<close>
  shows \<open>exec_block 5 0x18419 5 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x1841c_5 ?\<sigma> \<and> block_usage P_0x18404_false_5_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x18404_false_5_def P_0x18404_false_5_regions_def post: Q_0x1841c_5_def regionset: P_0x18404_false_5_regions_set_def)

definition P_0x1841c_true_6 :: state_pred where
  \<open>P_0x1841c_true_6 \<sigma> \<equiv> RIP \<sigma> = 0x1841c \<and> RAX \<sigma> = (sextend (ucast ((if' ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) \<le>s (((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff) then (\<langle>31,0\<rangle>RCX\<^sub>0::32 word) else ((((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff)::32 word)))) 32 64::64 word) \<and> RBX \<sigma> = ucast ((if' ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) \<le>s (((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff) then (\<langle>31,0\<rangle>RCX\<^sub>0::32 word) else ((((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff)::32 word))) \<and> RCX \<sigma> = 0x1 \<and> RDX \<sigma> = ((RSP\<^sub>0::64 word) - 0x248) \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = ((((RSP\<^sub>0::64 word) + (\<langle>63,0\<rangle>((((ucast (((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word))::64 word) AND (0x1ff::64 word))::64 word) * 0x1)::64 word))::64 word) - 0x248) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x258) \<and> RBP \<sigma> = ((RSP\<^sub>0::64 word) - 0x248) \<and> R15 \<sigma> = ((ucast ((RSI\<^sub>0::64 word))::64 word) >>> 9) \<and> R14 \<sigma> = RDX\<^sub>0 \<and> R13 \<sigma> = ucast ((((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) AND 0x1ff)) \<and> R12 \<sigma> = ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)) \<and> R8 \<sigma> = RDI\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x250),8]::64 word) = RDI\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x260),8]::64 word) = 0x183fd\<close>
declare P_0x1841c_true_6_def[Ps]

definition P_0x1841c_true_6_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x1841c_true_6_regions_set \<sigma> \<equiv> {
    (0, RDX\<^sub>0, 8),
    (1, RSP\<^sub>0, 8),
    (2, ((FS\<^sub>0::64 word) + 0x28), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x40), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x250), 8),
    (11, ((RSP\<^sub>0::64 word) - 0x260), 8),
    (12, ((((RDX\<^sub>0::64 word) + (\<langle>63,0\<rangle>((ucast (((if' ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) \<le>s (((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff) then (\<langle>31,0\<rangle>RCX\<^sub>0::32 word) else ((((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff)::32 word))::32 word))::64 word) * (0x1::64 word))::64 word))::64 word) - 0x8), 8),
    (13, ((((RSP\<^sub>0::64 word) + (\<langle>63,0\<rangle>((((ucast (((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word))::64 word) AND (0x1ff::64 word))::64 word) * 0x1)::64 word))::64 word) - 0x248), 8),
    (14, ((((((RSP\<^sub>0::64 word) + (\<langle>63,0\<rangle>((((ucast (((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word))::64 word) AND (0x1ff::64 word))::64 word) * 0x1)::64 word))::64 word) + (\<langle>63,0\<rangle>((ucast (((if' ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) \<le>s (((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff) then (\<langle>31,0\<rangle>RCX\<^sub>0::32 word) else ((((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff)::32 word))::32 word))::64 word) * (0x1::64 word))::64 word))::64 word) - 0x250), 8)
  }\<close>

definition P_0x1841c_true_6_regions :: state_pred where
  \<open>P_0x1841c_true_6_regions \<sigma> \<equiv> \<exists>regions. P_0x1841c_true_6_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x184b8_6 :: state_pred where
  \<open>Q_0x184b8_6 \<sigma> \<equiv> RIP \<sigma> = 0x184b8 \<and> RAX \<sigma> = (sextend (ucast ((if' ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) \<le>s (((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff) then (\<langle>31,0\<rangle>RCX\<^sub>0::32 word) else ((((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff)::32 word)))) 32 64::64 word) \<and> RBX \<sigma> = ucast ((if' ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) \<le>s (((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff) then (\<langle>31,0\<rangle>RCX\<^sub>0::32 word) else ((((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff)::32 word))) \<and> RCX \<sigma> = ucast (((ucast (((((\<langle>31,0\<rangle>((RDX\<^sub>0::64 word) - ((((RDX\<^sub>0::64 word) + 0x8)::64 word) AND 0xfffffffffffffff8))::32 word)::32 word) + (if' ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) \<le>s (((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff) then (\<langle>31,0\<rangle>RCX\<^sub>0::32 word) else ((((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff)::32 word)))::32 word))::32 word) >> 3)) \<and> RDX \<sigma> = ucast ((if' ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) \<le>s (((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff) then (\<langle>31,0\<rangle>RCX\<^sub>0::32 word) else ((((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff)::32 word))) \<and> RDI \<sigma> = ((((RDX\<^sub>0::64 word) + 0x8)::64 word) AND 0xfffffffffffffff8) \<and> RSI \<sigma> = ((((((((RSP\<^sub>0::64 word) + (\<langle>63,0\<rangle>((((ucast (((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word))::64 word) AND (0x1ff::64 word))::64 word) * 0x1)::64 word))::64 word) - RDX\<^sub>0)::64 word) + ((((RDX\<^sub>0::64 word) + 0x8)::64 word) AND 0xfffffffffffffff8))::64 word) - 0x248) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x258) \<and> RBP \<sigma> = ((RSP\<^sub>0::64 word) - 0x248) \<and> R15 \<sigma> = ((ucast ((RSI\<^sub>0::64 word))::64 word) >>> 9) \<and> R14 \<sigma> = RDX\<^sub>0 \<and> R13 \<sigma> = ucast ((((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) AND 0x1ff)) \<and> R12 \<sigma> = ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)) \<and> R8 \<sigma> = RDI\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RDX\<^sub>0,8]::64 word) = (\<sigma> \<turnstile> *[((((RSP\<^sub>0::64 word) + (\<langle>63,0\<rangle>((((ucast (((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word))::64 word) AND (0x1ff::64 word))::64 word) * 0x1)::64 word))::64 word) - 0x248),8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x250),8]::64 word) = RDI\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x260),8]::64 word) = 0x183fd \<and> (\<sigma> \<turnstile> *[((((RDX\<^sub>0::64 word) + (\<langle>63,0\<rangle>((ucast (((if' ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) \<le>s (((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff) then (\<langle>31,0\<rangle>RCX\<^sub>0::32 word) else ((((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff)::32 word))::32 word))::64 word) * (0x1::64 word))::64 word))::64 word) - 0x8),8]::64 word) = (\<sigma> \<turnstile> *[((((((RSP\<^sub>0::64 word) + (\<langle>63,0\<rangle>((((ucast (((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word))::64 word) AND (0x1ff::64 word))::64 word) * 0x1)::64 word))::64 word) + (\<langle>63,0\<rangle>((ucast (((if' ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) \<le>s (((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff) then (\<langle>31,0\<rangle>RCX\<^sub>0::32 word) else ((((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff)::32 word))::32 word))::64 word) * (0x1::64 word))::64 word))::64 word) - 0x250),8]::64 word) \<and> (\<sigma> \<turnstile> *[((((RSP\<^sub>0::64 word) + (\<langle>63,0\<rangle>((((ucast (((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word))::64 word) AND (0x1ff::64 word))::64 word) * 0x1)::64 word))::64 word) - 0x248),8]::64 word) = (\<sigma> \<turnstile> *[((((RSP\<^sub>0::64 word) + (\<langle>63,0\<rangle>((((ucast (((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word))::64 word) AND (0x1ff::64 word))::64 word) * 0x1)::64 word))::64 word) - 0x248),8]::64 word) \<and> (\<sigma> \<turnstile> *[((((((RSP\<^sub>0::64 word) + (\<langle>63,0\<rangle>((((ucast (((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word))::64 word) AND (0x1ff::64 word))::64 word) * 0x1)::64 word))::64 word) + (\<langle>63,0\<rangle>((ucast (((if' ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) \<le>s (((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff) then (\<langle>31,0\<rangle>RCX\<^sub>0::32 word) else ((((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff)::32 word))::32 word))::64 word) * (0x1::64 word))::64 word))::64 word) - 0x250),8]::64 word) = (\<sigma> \<turnstile> *[((((((RSP\<^sub>0::64 word) + (\<langle>63,0\<rangle>((((ucast (((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word))::64 word) AND (0x1ff::64 word))::64 word) * 0x1)::64 word))::64 word) + (\<langle>63,0\<rangle>((ucast (((if' ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) \<le>s (((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff) then (\<langle>31,0\<rangle>RCX\<^sub>0::32 word) else ((((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff)::32 word))::32 word))::64 word) * (0x1::64 word))::64 word))::64 word) - 0x250),8]::64 word)\<close>
declare Q_0x184b8_6_def[Qs]

schematic_goal bdrv_pread_em_0_13_0x1841c_0x184b5_6[blocks]:
  assumes \<open>(P_0x1841c_true_6 && P_0x1841c_true_6_regions && !CF) \<sigma>\<close>
  shows \<open>exec_block 13 0x184b5 6 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x184b8_6 ?\<sigma> \<and> block_usage P_0x1841c_true_6_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x1841c_true_6_def P_0x1841c_true_6_regions_def post: Q_0x184b8_6_def regionset: P_0x1841c_true_6_regions_set_def)

definition P_0x184b8_7 :: state_pred where
  \<open>P_0x184b8_7 \<sigma> \<equiv> RIP \<sigma> = 0x184b8 \<and> RAX \<sigma> = (sextend (ucast ((if' ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) \<le>s (((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff) then (\<langle>31,0\<rangle>RCX\<^sub>0::32 word) else ((((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff)::32 word)))) 32 64::64 word) \<and> RBX \<sigma> = ucast ((if' ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) \<le>s (((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff) then (\<langle>31,0\<rangle>RCX\<^sub>0::32 word) else ((((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff)::32 word))) \<and> RCX \<sigma> = ucast (((ucast (((((\<langle>31,0\<rangle>((RDX\<^sub>0::64 word) - ((((RDX\<^sub>0::64 word) + 0x8)::64 word) AND 0xfffffffffffffff8))::32 word)::32 word) + (if' ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) \<le>s (((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff) then (\<langle>31,0\<rangle>RCX\<^sub>0::32 word) else ((((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff)::32 word)))::32 word))::32 word) >> 3)) \<and> RDX \<sigma> = ucast ((if' ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) \<le>s (((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff) then (\<langle>31,0\<rangle>RCX\<^sub>0::32 word) else ((((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff)::32 word))) \<and> RDI \<sigma> = ((((RDX\<^sub>0::64 word) + 0x8)::64 word) AND 0xfffffffffffffff8) \<and> RSI \<sigma> = ((((((((RSP\<^sub>0::64 word) + (\<langle>63,0\<rangle>((((ucast (((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word))::64 word) AND (0x1ff::64 word))::64 word) * 0x1)::64 word))::64 word) - RDX\<^sub>0)::64 word) + ((((RDX\<^sub>0::64 word) + 0x8)::64 word) AND 0xfffffffffffffff8))::64 word) - 0x248) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x258) \<and> RBP \<sigma> = ((RSP\<^sub>0::64 word) - 0x248) \<and> R15 \<sigma> = ((ucast ((RSI\<^sub>0::64 word))::64 word) >>> 9) \<and> R14 \<sigma> = RDX\<^sub>0 \<and> R13 \<sigma> = ucast ((((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) AND 0x1ff)) \<and> R12 \<sigma> = ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)) \<and> R8 \<sigma> = RDI\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RDX\<^sub>0,8]::64 word) = (\<sigma> \<turnstile> *[((((RSP\<^sub>0::64 word) + (\<langle>63,0\<rangle>((((ucast (((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word))::64 word) AND (0x1ff::64 word))::64 word) * 0x1)::64 word))::64 word) - 0x248),8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x250),8]::64 word) = RDI\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x260),8]::64 word) = 0x183fd \<and> (\<sigma> \<turnstile> *[((((RDX\<^sub>0::64 word) + (\<langle>63,0\<rangle>((ucast (((if' ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) \<le>s (((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff) then (\<langle>31,0\<rangle>RCX\<^sub>0::32 word) else ((((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff)::32 word))::32 word))::64 word) * (0x1::64 word))::64 word))::64 word) - 0x8),8]::64 word) = (\<sigma> \<turnstile> *[((((((RSP\<^sub>0::64 word) + (\<langle>63,0\<rangle>((((ucast (((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word))::64 word) AND (0x1ff::64 word))::64 word) * 0x1)::64 word))::64 word) + (\<langle>63,0\<rangle>((ucast (((if' ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) \<le>s (((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff) then (\<langle>31,0\<rangle>RCX\<^sub>0::32 word) else ((((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff)::32 word))::32 word))::64 word) * (0x1::64 word))::64 word))::64 word) - 0x250),8]::64 word) \<and> (\<sigma> \<turnstile> *[((((RSP\<^sub>0::64 word) + (\<langle>63,0\<rangle>((((ucast (((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word))::64 word) AND (0x1ff::64 word))::64 word) * 0x1)::64 word))::64 word) - 0x248),8]::64 word) = (\<sigma> \<turnstile> *[((((RSP\<^sub>0::64 word) + (\<langle>63,0\<rangle>((((ucast (((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word))::64 word) AND (0x1ff::64 word))::64 word) * 0x1)::64 word))::64 word) - 0x248),8]::64 word) \<and> (\<sigma> \<turnstile> *[((((((RSP\<^sub>0::64 word) + (\<langle>63,0\<rangle>((((ucast (((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word))::64 word) AND (0x1ff::64 word))::64 word) * 0x1)::64 word))::64 word) + (\<langle>63,0\<rangle>((ucast (((if' ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) \<le>s (((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff) then (\<langle>31,0\<rangle>RCX\<^sub>0::32 word) else ((((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff)::32 word))::32 word))::64 word) * (0x1::64 word))::64 word))::64 word) - 0x250),8]::64 word) = (\<sigma> \<turnstile> *[((((((RSP\<^sub>0::64 word) + (\<langle>63,0\<rangle>((((ucast (((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word))::64 word) AND (0x1ff::64 word))::64 word) * 0x1)::64 word))::64 word) + (\<langle>63,0\<rangle>((ucast (((if' ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) \<le>s (((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff) then (\<langle>31,0\<rangle>RCX\<^sub>0::32 word) else ((((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff)::32 word))::32 word))::64 word) * (0x1::64 word))::64 word))::64 word) - 0x250),8]::64 word)\<close>
declare P_0x184b8_7_def[Ps]

definition P_0x184b8_7_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x184b8_7_regions_set \<sigma> \<equiv> {
    (0, RDX\<^sub>0, 8),
    (1, RSP\<^sub>0, 8),
    (2, ((FS\<^sub>0::64 word) + 0x28), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x40), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x250), 8),
    (11, ((RSP\<^sub>0::64 word) - 0x260), 8),
    (12, ((((RDX\<^sub>0::64 word) + (\<langle>63,0\<rangle>((ucast (((if' ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) \<le>s (((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff) then (\<langle>31,0\<rangle>RCX\<^sub>0::32 word) else ((((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff)::32 word))::32 word))::64 word) * (0x1::64 word))::64 word))::64 word) - 0x8), 8),
    (13, ((((RSP\<^sub>0::64 word) + (\<langle>63,0\<rangle>((((ucast (((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word))::64 word) AND (0x1ff::64 word))::64 word) * 0x1)::64 word))::64 word) - 0x248), 8),
    (14, ((((((RSP\<^sub>0::64 word) + (\<langle>63,0\<rangle>((((ucast (((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word))::64 word) AND (0x1ff::64 word))::64 word) * 0x1)::64 word))::64 word) + (\<langle>63,0\<rangle>((ucast (((if' ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) \<le>s (((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff) then (\<langle>31,0\<rangle>RCX\<^sub>0::32 word) else ((((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff)::32 word))::32 word))::64 word) * (0x1::64 word))::64 word))::64 word) - 0x250), 8)
  }\<close>

definition P_0x184b8_7_regions :: state_pred where
  \<open>P_0x184b8_7_regions \<sigma> \<equiv> \<exists>regions. P_0x184b8_7_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_rep_movs_ESRDI_DSRSI_addr_0x184b8_7 :: state_pred where
  \<open>Q_rep_movs_ESRDI_DSRSI_addr_0x184b8_7 \<sigma> \<equiv> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x260) \<and> RIP \<sigma> = rep_movs_ESRDI_DSRSI_addr \<and> RAX \<sigma> = (sextend (ucast ((if' ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) \<le>s (((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff) then (\<langle>31,0\<rangle>RCX\<^sub>0::32 word) else ((((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff)::32 word)))) 32 64::64 word) \<and> RBX \<sigma> = ucast ((if' ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) \<le>s (((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff) then (\<langle>31,0\<rangle>RCX\<^sub>0::32 word) else ((((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff)::32 word))) \<and> RBP \<sigma> = ((RSP\<^sub>0::64 word) - 0x248) \<and> R15 \<sigma> = ((ucast ((RSI\<^sub>0::64 word))::64 word) >>> 9) \<and> R14 \<sigma> = RDX\<^sub>0 \<and> R13 \<sigma> = ucast ((((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) AND 0x1ff)) \<and> R12 \<sigma> = ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)) \<and> R8 \<sigma> = RDI\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x250),8]::64 word) = RDI\<^sub>0\<close>
declare Q_rep_movs_ESRDI_DSRSI_addr_0x184b8_7_def[Qs]

schematic_goal bdrv_pread_em_0_1_0x184b8_0x184b8_7[blocks]:
  assumes \<open>(P_0x184b8_7 && P_0x184b8_7_regions) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x184b8 7 \<sigma> \<triangleq> ?\<sigma> \<and> Q_rep_movs_ESRDI_DSRSI_addr_0x184b8_7 ?\<sigma> \<and> block_usage P_0x184b8_7_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x184b8_7_def P_0x184b8_7_regions_def post: Q_rep_movs_ESRDI_DSRSI_addr_0x184b8_7_def regionset: P_0x184b8_7_regions_set_def)

definition P_0x1841c_false_8 :: state_pred where
  \<open>P_0x1841c_false_8 \<sigma> \<equiv> RIP \<sigma> = 0x1841c \<and> RAX \<sigma> = (sextend (ucast ((if' ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) \<le>s (((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff) then (\<langle>31,0\<rangle>RCX\<^sub>0::32 word) else ((((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff)::32 word)))) 32 64::64 word) \<and> RBX \<sigma> = ucast ((if' ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) \<le>s (((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff) then (\<langle>31,0\<rangle>RCX\<^sub>0::32 word) else ((((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff)::32 word))) \<and> RCX \<sigma> = 0x1 \<and> RDX \<sigma> = ((RSP\<^sub>0::64 word) - 0x248) \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = ((((RSP\<^sub>0::64 word) + (\<langle>63,0\<rangle>((((ucast (((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word))::64 word) AND (0x1ff::64 word))::64 word) * 0x1)::64 word))::64 word) - 0x248) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x258) \<and> RBP \<sigma> = ((RSP\<^sub>0::64 word) - 0x248) \<and> R15 \<sigma> = ((ucast ((RSI\<^sub>0::64 word))::64 word) >>> 9) \<and> R14 \<sigma> = RDX\<^sub>0 \<and> R13 \<sigma> = ucast ((((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) AND 0x1ff)) \<and> R12 \<sigma> = ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)) \<and> R8 \<sigma> = RDI\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x250),8]::64 word) = RDI\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x260),8]::64 word) = 0x183fd\<close>
declare P_0x1841c_false_8_def[Ps]

definition P_0x1841c_false_8_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x1841c_false_8_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((FS\<^sub>0::64 word) + 0x28), 8),
    (2, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x40), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x250), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x260), 8)
  }\<close>

definition P_0x1841c_false_8_regions :: state_pred where
  \<open>P_0x1841c_false_8_regions \<sigma> \<equiv> \<exists>regions. P_0x1841c_false_8_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x18421_8 :: state_pred where
  \<open>Q_0x18421_8 \<sigma> \<equiv> RIP \<sigma> = 0x18421 \<and> RAX \<sigma> = (sextend (ucast ((if' ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) \<le>s (((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff) then (\<langle>31,0\<rangle>RCX\<^sub>0::32 word) else ((((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff)::32 word)))) 32 64::64 word) \<and> RBX \<sigma> = ucast ((if' ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) \<le>s (((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff) then (\<langle>31,0\<rangle>RCX\<^sub>0::32 word) else ((((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff)::32 word))) \<and> RCX \<sigma> = 0x1 \<and> RDX \<sigma> = ((RSP\<^sub>0::64 word) - 0x248) \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = ((((RSP\<^sub>0::64 word) + (\<langle>63,0\<rangle>((((ucast (((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word))::64 word) AND (0x1ff::64 word))::64 word) * 0x1)::64 word))::64 word) - 0x248) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x258) \<and> RBP \<sigma> = ((RSP\<^sub>0::64 word) - 0x248) \<and> R15 \<sigma> = ((ucast ((RSI\<^sub>0::64 word))::64 word) >>> 9) \<and> R14 \<sigma> = RDX\<^sub>0 \<and> R13 \<sigma> = ucast ((((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) AND 0x1ff)) \<and> R12 \<sigma> = ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)) \<and> R8 \<sigma> = RDI\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x250),8]::64 word) = RDI\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x260),8]::64 word) = 0x183fd\<close>
declare Q_0x18421_8_def[Qs]

schematic_goal bdrv_pread_em_0_2_0x1841c_0x1841e_8[blocks]:
  assumes \<open>(P_0x1841c_false_8 && P_0x1841c_false_8_regions && ! !CF) \<sigma>\<close>
  shows \<open>exec_block 2 0x1841e 8 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x18421_8 ?\<sigma> \<and> block_usage P_0x1841c_false_8_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x1841c_false_8_def P_0x1841c_false_8_regions_def post: Q_0x18421_8_def regionset: P_0x1841c_false_8_regions_set_def)

definition P_0x18421_true_9 :: state_pred where
  \<open>P_0x18421_true_9 \<sigma> \<equiv> RIP \<sigma> = 0x18421 \<and> RAX \<sigma> = (sextend (ucast ((if' ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) \<le>s (((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff) then (\<langle>31,0\<rangle>RCX\<^sub>0::32 word) else ((((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff)::32 word)))) 32 64::64 word) \<and> RBX \<sigma> = ucast ((if' ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) \<le>s (((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff) then (\<langle>31,0\<rangle>RCX\<^sub>0::32 word) else ((((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff)::32 word))) \<and> RCX \<sigma> = 0x1 \<and> RDX \<sigma> = ((RSP\<^sub>0::64 word) - 0x248) \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = ((((RSP\<^sub>0::64 word) + (\<langle>63,0\<rangle>((((ucast (((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word))::64 word) AND (0x1ff::64 word))::64 word) * 0x1)::64 word))::64 word) - 0x248) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x258) \<and> RBP \<sigma> = ((RSP\<^sub>0::64 word) - 0x248) \<and> R15 \<sigma> = ((ucast ((RSI\<^sub>0::64 word))::64 word) >>> 9) \<and> R14 \<sigma> = RDX\<^sub>0 \<and> R13 \<sigma> = ucast ((((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) AND 0x1ff)) \<and> R12 \<sigma> = ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)) \<and> R8 \<sigma> = RDI\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x250),8]::64 word) = RDI\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x260),8]::64 word) = 0x183fd\<close>
declare P_0x18421_true_9_def[Ps]

definition P_0x18421_true_9_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x18421_true_9_regions_set \<sigma> \<equiv> {
    (0, RDX\<^sub>0, 4),
    (1, RSP\<^sub>0, 8),
    (2, ((FS\<^sub>0::64 word) + 0x28), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x40), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x250), 8),
    (11, ((RSP\<^sub>0::64 word) - 0x260), 8),
    (12, ((((RDX\<^sub>0::64 word) + (\<langle>63,0\<rangle>((ucast (((if' ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) \<le>s (((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff) then (\<langle>31,0\<rangle>RCX\<^sub>0::32 word) else ((((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff)::32 word))::32 word))::64 word) * (0x1::64 word))::64 word))::64 word) - 0x4), 4),
    (13, ((((RSP\<^sub>0::64 word) + (\<langle>63,0\<rangle>((((ucast (((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word))::64 word) AND (0x1ff::64 word))::64 word) * 0x1)::64 word))::64 word) - 0x248), 4),
    (14, ((((((RSP\<^sub>0::64 word) + (\<langle>63,0\<rangle>((((ucast (((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word))::64 word) AND (0x1ff::64 word))::64 word) * 0x1)::64 word))::64 word) + (\<langle>63,0\<rangle>((ucast (((if' ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) \<le>s (((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff) then (\<langle>31,0\<rangle>RCX\<^sub>0::32 word) else ((((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff)::32 word))::32 word))::64 word) * (0x1::64 word))::64 word))::64 word) - 0x24c), 4)
  }\<close>

definition P_0x18421_true_9_regions :: state_pred where
  \<open>P_0x18421_true_9_regions \<sigma> \<equiv> \<exists>regions. P_0x18421_true_9_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x184bb_9 :: state_pred where
  \<open>Q_0x184bb_9 \<sigma> \<equiv> RIP \<sigma> = 0x184bb \<and> RBX \<sigma> = ucast ((if' ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) \<le>s (((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff) then (\<langle>31,0\<rangle>RCX\<^sub>0::32 word) else ((((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff)::32 word))) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x258) \<and> RBP \<sigma> = ((RSP\<^sub>0::64 word) - 0x248) \<and> R15 \<sigma> = ((ucast ((RSI\<^sub>0::64 word))::64 word) >>> 9) \<and> R14 \<sigma> = RDX\<^sub>0 \<and> R13 \<sigma> = ucast ((((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) AND 0x1ff)) \<and> R12 \<sigma> = ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)) \<and> R8 \<sigma> = RDI\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x250),8]::64 word) = RDI\<^sub>0\<close>
declare Q_0x184bb_9_def[Qs]

schematic_goal bdrv_pread_em_0_7_0x18421_0x184e8_9[blocks]:
  assumes \<open>(P_0x18421_true_9 && P_0x18421_true_9_regions && !ZF) \<sigma>\<close>
  shows \<open>exec_block 7 0x184e8 9 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x184bb_9 ?\<sigma> \<and> block_usage P_0x18421_true_9_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x18421_true_9_def P_0x18421_true_9_regions_def post: Q_0x184bb_9_def regionset: P_0x18421_true_9_regions_set_def)

definition P_0x18421_false_10 :: state_pred where
  \<open>P_0x18421_false_10 \<sigma> \<equiv> RIP \<sigma> = 0x18421 \<and> RAX \<sigma> = (sextend (ucast ((if' ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) \<le>s (((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff) then (\<langle>31,0\<rangle>RCX\<^sub>0::32 word) else ((((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff)::32 word)))) 32 64::64 word) \<and> RBX \<sigma> = ucast ((if' ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) \<le>s (((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff) then (\<langle>31,0\<rangle>RCX\<^sub>0::32 word) else ((((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff)::32 word))) \<and> RCX \<sigma> = 0x1 \<and> RDX \<sigma> = ((RSP\<^sub>0::64 word) - 0x248) \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = ((((RSP\<^sub>0::64 word) + (\<langle>63,0\<rangle>((((ucast (((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word))::64 word) AND (0x1ff::64 word))::64 word) * 0x1)::64 word))::64 word) - 0x248) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x258) \<and> RBP \<sigma> = ((RSP\<^sub>0::64 word) - 0x248) \<and> R15 \<sigma> = ((ucast ((RSI\<^sub>0::64 word))::64 word) >>> 9) \<and> R14 \<sigma> = RDX\<^sub>0 \<and> R13 \<sigma> = ucast ((((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) AND 0x1ff)) \<and> R12 \<sigma> = ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)) \<and> R8 \<sigma> = RDI\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x250),8]::64 word) = RDI\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x260),8]::64 word) = 0x183fd\<close>
declare P_0x18421_false_10_def[Ps]

definition P_0x18421_false_10_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x18421_false_10_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((FS\<^sub>0::64 word) + 0x28), 8),
    (2, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x40), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x250), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x260), 8)
  }\<close>

definition P_0x18421_false_10_regions :: state_pred where
  \<open>P_0x18421_false_10_regions \<sigma> \<equiv> \<exists>regions. P_0x18421_false_10_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x18429_10 :: state_pred where
  \<open>Q_0x18429_10 \<sigma> \<equiv> RIP \<sigma> = 0x18429 \<and> RAX \<sigma> = (sextend (ucast ((if' ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) \<le>s (((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff) then (\<langle>31,0\<rangle>RCX\<^sub>0::32 word) else ((((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff)::32 word)))) 32 64::64 word) \<and> RBX \<sigma> = ucast ((if' ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) \<le>s (((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff) then (\<langle>31,0\<rangle>RCX\<^sub>0::32 word) else ((((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff)::32 word))) \<and> RCX \<sigma> = 0x1 \<and> RDX \<sigma> = ((RSP\<^sub>0::64 word) - 0x248) \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = ((((RSP\<^sub>0::64 word) + (\<langle>63,0\<rangle>((((ucast (((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word))::64 word) AND (0x1ff::64 word))::64 word) * 0x1)::64 word))::64 word) - 0x248) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x258) \<and> RBP \<sigma> = ((RSP\<^sub>0::64 word) - 0x248) \<and> R15 \<sigma> = ((ucast ((RSI\<^sub>0::64 word))::64 word) >>> 9) \<and> R14 \<sigma> = RDX\<^sub>0 \<and> R13 \<sigma> = ucast ((((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) AND 0x1ff)) \<and> R12 \<sigma> = ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)) \<and> R8 \<sigma> = RDI\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x250),8]::64 word) = RDI\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x260),8]::64 word) = 0x183fd\<close>
declare Q_0x18429_10_def[Qs]

schematic_goal bdrv_pread_em_0_2_0x18421_0x18427_10[blocks]:
  assumes \<open>(P_0x18421_false_10 && P_0x18421_false_10_regions && ! !ZF) \<sigma>\<close>
  shows \<open>exec_block 2 0x18427 10 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x18429_10 ?\<sigma> \<and> block_usage P_0x18421_false_10_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x18421_false_10_def P_0x18421_false_10_regions_def post: Q_0x18429_10_def regionset: P_0x18421_false_10_regions_set_def)

definition P_0x18429_true_11 :: state_pred where
  \<open>P_0x18429_true_11 \<sigma> \<equiv> RIP \<sigma> = 0x18429 \<and> RAX \<sigma> = (sextend (ucast ((if' ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) \<le>s (((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff) then (\<langle>31,0\<rangle>RCX\<^sub>0::32 word) else ((((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff)::32 word)))) 32 64::64 word) \<and> RBX \<sigma> = ucast ((if' ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) \<le>s (((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff) then (\<langle>31,0\<rangle>RCX\<^sub>0::32 word) else ((((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff)::32 word))) \<and> RCX \<sigma> = 0x1 \<and> RDX \<sigma> = ((RSP\<^sub>0::64 word) - 0x248) \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = ((((RSP\<^sub>0::64 word) + (\<langle>63,0\<rangle>((((ucast (((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word))::64 word) AND (0x1ff::64 word))::64 word) * 0x1)::64 word))::64 word) - 0x248) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x258) \<and> RBP \<sigma> = ((RSP\<^sub>0::64 word) - 0x248) \<and> R15 \<sigma> = ((ucast ((RSI\<^sub>0::64 word))::64 word) >>> 9) \<and> R14 \<sigma> = RDX\<^sub>0 \<and> R13 \<sigma> = ucast ((((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) AND 0x1ff)) \<and> R12 \<sigma> = ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)) \<and> R8 \<sigma> = RDI\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x250),8]::64 word) = RDI\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x260),8]::64 word) = 0x183fd\<close>
declare P_0x18429_true_11_def[Ps]

definition P_0x18429_true_11_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x18429_true_11_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((FS\<^sub>0::64 word) + 0x28), 8),
    (2, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x40), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x250), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x260), 8)
  }\<close>

definition P_0x18429_true_11_regions :: state_pred where
  \<open>P_0x18429_true_11_regions \<sigma> \<equiv> \<exists>regions. P_0x18429_true_11_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x184bb_11 :: state_pred where
  \<open>Q_0x184bb_11 \<sigma> \<equiv> RIP \<sigma> = 0x184bb \<and> RBX \<sigma> = ucast ((if' ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) \<le>s (((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff) then (\<langle>31,0\<rangle>RCX\<^sub>0::32 word) else ((((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff)::32 word))) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x258) \<and> RBP \<sigma> = ((RSP\<^sub>0::64 word) - 0x248) \<and> R15 \<sigma> = ((ucast ((RSI\<^sub>0::64 word))::64 word) >>> 9) \<and> R14 \<sigma> = RDX\<^sub>0 \<and> R13 \<sigma> = ucast ((((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) AND 0x1ff)) \<and> R12 \<sigma> = ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)) \<and> R8 \<sigma> = RDI\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x250),8]::64 word) = RDI\<^sub>0\<close>
declare Q_0x184bb_11_def[Qs]

schematic_goal bdrv_pread_em_0_1_0x18429_0x18429_11[blocks]:
  assumes \<open>(P_0x18429_true_11 && P_0x18429_true_11_regions && ZF) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x18429 11 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x184bb_11 ?\<sigma> \<and> block_usage P_0x18429_true_11_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x18429_true_11_def P_0x18429_true_11_regions_def post: Q_0x184bb_11_def regionset: P_0x18429_true_11_regions_set_def)

definition P_0x18429_false_12 :: state_pred where
  \<open>P_0x18429_false_12 \<sigma> \<equiv> RIP \<sigma> = 0x18429 \<and> RAX \<sigma> = (sextend (ucast ((if' ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) \<le>s (((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff) then (\<langle>31,0\<rangle>RCX\<^sub>0::32 word) else ((((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff)::32 word)))) 32 64::64 word) \<and> RBX \<sigma> = ucast ((if' ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) \<le>s (((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff) then (\<langle>31,0\<rangle>RCX\<^sub>0::32 word) else ((((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff)::32 word))) \<and> RCX \<sigma> = 0x1 \<and> RDX \<sigma> = ((RSP\<^sub>0::64 word) - 0x248) \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = ((((RSP\<^sub>0::64 word) + (\<langle>63,0\<rangle>((((ucast (((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word))::64 word) AND (0x1ff::64 word))::64 word) * 0x1)::64 word))::64 word) - 0x248) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x258) \<and> RBP \<sigma> = ((RSP\<^sub>0::64 word) - 0x248) \<and> R15 \<sigma> = ((ucast ((RSI\<^sub>0::64 word))::64 word) >>> 9) \<and> R14 \<sigma> = RDX\<^sub>0 \<and> R13 \<sigma> = ucast ((((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) AND 0x1ff)) \<and> R12 \<sigma> = ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)) \<and> R8 \<sigma> = RDI\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x250),8]::64 word) = RDI\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x260),8]::64 word) = 0x183fd\<close>
declare P_0x18429_false_12_def[Ps]

definition P_0x18429_false_12_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x18429_false_12_regions_set \<sigma> \<equiv> {
    (0, RDX\<^sub>0, Suc 0),
    (1, RSP\<^sub>0, 8),
    (2, ((FS\<^sub>0::64 word) + 0x28), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x40), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x250), 8),
    (11, ((RSP\<^sub>0::64 word) - 0x260), 8),
    (12, ((((RSP\<^sub>0::64 word) + (\<langle>63,0\<rangle>((((ucast (((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word))::64 word) AND (0x1ff::64 word))::64 word) * 0x1)::64 word))::64 word) - 0x248), Suc 0)
  }\<close>

definition P_0x18429_false_12_regions :: state_pred where
  \<open>P_0x18429_false_12_regions \<sigma> \<equiv> \<exists>regions. P_0x18429_false_12_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x18438_12 :: state_pred where
  \<open>Q_0x18438_12 \<sigma> \<equiv> RIP \<sigma> = 0x18438 \<and> RAX \<sigma> = (sextend (ucast ((if' ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) \<le>s (((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff) then (\<langle>31,0\<rangle>RCX\<^sub>0::32 word) else ((((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff)::32 word)))) 32 64::64 word) \<and> RBX \<sigma> = ucast ((if' ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) \<le>s (((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff) then (\<langle>31,0\<rangle>RCX\<^sub>0::32 word) else ((((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff)::32 word))) \<and> RCX \<sigma> = 0x1 \<and> RDX \<sigma> = ucast ((\<sigma> \<turnstile> *[((((RSP\<^sub>0::64 word) + (\<langle>63,0\<rangle>((((ucast (((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word))::64 word) AND (0x1ff::64 word))::64 word) * 0x1)::64 word))::64 word) - 0x248),1]::8 word)) \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = ((((RSP\<^sub>0::64 word) + (\<langle>63,0\<rangle>((((ucast (((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word))::64 word) AND (0x1ff::64 word))::64 word) * 0x1)::64 word))::64 word) - 0x248) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x258) \<and> RBP \<sigma> = ((RSP\<^sub>0::64 word) - 0x248) \<and> R15 \<sigma> = ((ucast ((RSI\<^sub>0::64 word))::64 word) >>> 9) \<and> R14 \<sigma> = RDX\<^sub>0 \<and> R13 \<sigma> = ucast ((((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) AND 0x1ff)) \<and> R12 \<sigma> = ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)) \<and> R8 \<sigma> = RDI\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RDX\<^sub>0,1]::8 word) = ucast ((\<sigma> \<turnstile> *[((((RSP\<^sub>0::64 word) + (\<langle>63,0\<rangle>((((ucast (((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word))::64 word) AND (0x1ff::64 word))::64 word) * 0x1)::64 word))::64 word) - 0x248),1]::8 word)) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x250),8]::64 word) = RDI\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x260),8]::64 word) = 0x183fd \<and> (\<sigma> \<turnstile> *[((((RSP\<^sub>0::64 word) + (\<langle>63,0\<rangle>((((ucast (((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word))::64 word) AND (0x1ff::64 word))::64 word) * 0x1)::64 word))::64 word) - 0x248),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((((RSP\<^sub>0::64 word) + (\<langle>63,0\<rangle>((((ucast (((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word))::64 word) AND (0x1ff::64 word))::64 word) * 0x1)::64 word))::64 word) - 0x248),1]::8 word))\<close>
declare Q_0x18438_12_def[Qs]

schematic_goal bdrv_pread_em_0_4_0x18429_0x18435_12[blocks]:
  assumes \<open>(P_0x18429_false_12 && P_0x18429_false_12_regions && ! ZF) \<sigma>\<close>
  shows \<open>exec_block 4 0x18435 12 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x18438_12 ?\<sigma> \<and> block_usage P_0x18429_false_12_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x18429_false_12_def P_0x18429_false_12_regions_def post: Q_0x18438_12_def regionset: P_0x18429_false_12_regions_set_def)

definition P_0x18438_true_13 :: state_pred where
  \<open>P_0x18438_true_13 \<sigma> \<equiv> RIP \<sigma> = 0x18438 \<and> RAX \<sigma> = (sextend (ucast ((if' ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) \<le>s (((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff) then (\<langle>31,0\<rangle>RCX\<^sub>0::32 word) else ((((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff)::32 word)))) 32 64::64 word) \<and> RBX \<sigma> = ucast ((if' ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) \<le>s (((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff) then (\<langle>31,0\<rangle>RCX\<^sub>0::32 word) else ((((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff)::32 word))) \<and> RCX \<sigma> = 0x1 \<and> RDX \<sigma> = ucast ((\<sigma> \<turnstile> *[((((RSP\<^sub>0::64 word) + (\<langle>63,0\<rangle>((((ucast (((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word))::64 word) AND (0x1ff::64 word))::64 word) * 0x1)::64 word))::64 word) - 0x248),1]::8 word)) \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = ((((RSP\<^sub>0::64 word) + (\<langle>63,0\<rangle>((((ucast (((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word))::64 word) AND (0x1ff::64 word))::64 word) * 0x1)::64 word))::64 word) - 0x248) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x258) \<and> RBP \<sigma> = ((RSP\<^sub>0::64 word) - 0x248) \<and> R15 \<sigma> = ((ucast ((RSI\<^sub>0::64 word))::64 word) >>> 9) \<and> R14 \<sigma> = RDX\<^sub>0 \<and> R13 \<sigma> = ucast ((((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) AND 0x1ff)) \<and> R12 \<sigma> = ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)) \<and> R8 \<sigma> = RDI\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RDX\<^sub>0,1]::8 word) = ucast ((\<sigma> \<turnstile> *[((((RSP\<^sub>0::64 word) + (\<langle>63,0\<rangle>((((ucast (((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word))::64 word) AND (0x1ff::64 word))::64 word) * 0x1)::64 word))::64 word) - 0x248),1]::8 word)) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x250),8]::64 word) = RDI\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x260),8]::64 word) = 0x183fd \<and> (\<sigma> \<turnstile> *[((((RSP\<^sub>0::64 word) + (\<langle>63,0\<rangle>((((ucast (((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word))::64 word) AND (0x1ff::64 word))::64 word) * 0x1)::64 word))::64 word) - 0x248),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((((RSP\<^sub>0::64 word) + (\<langle>63,0\<rangle>((((ucast (((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word))::64 word) AND (0x1ff::64 word))::64 word) * 0x1)::64 word))::64 word) - 0x248),1]::8 word))\<close>
declare P_0x18438_true_13_def[Ps]

definition P_0x18438_true_13_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x18438_true_13_regions_set \<sigma> \<equiv> {
    (0, RDX\<^sub>0, Suc 0),
    (1, RSP\<^sub>0, 8),
    (2, ((FS\<^sub>0::64 word) + 0x28), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x40), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x250), 8),
    (11, ((RSP\<^sub>0::64 word) - 0x260), 8),
    (12, ((((RSP\<^sub>0::64 word) + (\<langle>63,0\<rangle>((((ucast (((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word))::64 word) AND (0x1ff::64 word))::64 word) * 0x1)::64 word))::64 word) - 0x248), Suc 0)
  }\<close>

definition P_0x18438_true_13_regions :: state_pred where
  \<open>P_0x18438_true_13_regions \<sigma> \<equiv> \<exists>regions. P_0x18438_true_13_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x184bb_13 :: state_pred where
  \<open>Q_0x184bb_13 \<sigma> \<equiv> RIP \<sigma> = 0x184bb \<and> RBX \<sigma> = ucast ((if' ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) \<le>s (((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff) then (\<langle>31,0\<rangle>RCX\<^sub>0::32 word) else ((((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff)::32 word))) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x258) \<and> RBP \<sigma> = ((RSP\<^sub>0::64 word) - 0x248) \<and> R15 \<sigma> = ((ucast ((RSI\<^sub>0::64 word))::64 word) >>> 9) \<and> R14 \<sigma> = RDX\<^sub>0 \<and> R13 \<sigma> = ucast ((((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) AND 0x1ff)) \<and> R12 \<sigma> = ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)) \<and> R8 \<sigma> = RDI\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x250),8]::64 word) = RDI\<^sub>0\<close>
declare Q_0x184bb_13_def[Qs]

schematic_goal bdrv_pread_em_0_1_0x18438_0x18438_13[blocks]:
  assumes \<open>(P_0x18438_true_13 && P_0x18438_true_13_regions && ZF) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x18438 13 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x184bb_13 ?\<sigma> \<and> block_usage P_0x18438_true_13_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x18438_true_13_def P_0x18438_true_13_regions_def post: Q_0x184bb_13_def regionset: P_0x18438_true_13_regions_set_def)

definition P_0x18438_false_14 :: state_pred where
  \<open>P_0x18438_false_14 \<sigma> \<equiv> RIP \<sigma> = 0x18438 \<and> RAX \<sigma> = (sextend (ucast ((if' ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) \<le>s (((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff) then (\<langle>31,0\<rangle>RCX\<^sub>0::32 word) else ((((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff)::32 word)))) 32 64::64 word) \<and> RBX \<sigma> = ucast ((if' ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) \<le>s (((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff) then (\<langle>31,0\<rangle>RCX\<^sub>0::32 word) else ((((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff)::32 word))) \<and> RCX \<sigma> = 0x1 \<and> RDX \<sigma> = ucast ((\<sigma> \<turnstile> *[((((RSP\<^sub>0::64 word) + (\<langle>63,0\<rangle>((((ucast (((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word))::64 word) AND (0x1ff::64 word))::64 word) * 0x1)::64 word))::64 word) - 0x248),1]::8 word)) \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = ((((RSP\<^sub>0::64 word) + (\<langle>63,0\<rangle>((((ucast (((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word))::64 word) AND (0x1ff::64 word))::64 word) * 0x1)::64 word))::64 word) - 0x248) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x258) \<and> RBP \<sigma> = ((RSP\<^sub>0::64 word) - 0x248) \<and> R15 \<sigma> = ((ucast ((RSI\<^sub>0::64 word))::64 word) >>> 9) \<and> R14 \<sigma> = RDX\<^sub>0 \<and> R13 \<sigma> = ucast ((((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) AND 0x1ff)) \<and> R12 \<sigma> = ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)) \<and> R8 \<sigma> = RDI\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RDX\<^sub>0,1]::8 word) = ucast ((\<sigma> \<turnstile> *[((((RSP\<^sub>0::64 word) + (\<langle>63,0\<rangle>((((ucast (((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word))::64 word) AND (0x1ff::64 word))::64 word) * 0x1)::64 word))::64 word) - 0x248),1]::8 word)) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x250),8]::64 word) = RDI\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x260),8]::64 word) = 0x183fd \<and> (\<sigma> \<turnstile> *[((((RSP\<^sub>0::64 word) + (\<langle>63,0\<rangle>((((ucast (((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word))::64 word) AND (0x1ff::64 word))::64 word) * 0x1)::64 word))::64 word) - 0x248),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((((RSP\<^sub>0::64 word) + (\<langle>63,0\<rangle>((((ucast (((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word))::64 word) AND (0x1ff::64 word))::64 word) * 0x1)::64 word))::64 word) - 0x248),1]::8 word))\<close>
declare P_0x18438_false_14_def[Ps]

definition P_0x18438_false_14_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x18438_false_14_regions_set \<sigma> \<equiv> {
    (0, RDX\<^sub>0, Suc 0),
    (1, RSP\<^sub>0, 8),
    (2, ((FS\<^sub>0::64 word) + 0x28), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x40), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x250), 8),
    (11, ((RSP\<^sub>0::64 word) - 0x260), 8),
    (12, ((((RDX\<^sub>0::64 word) + (\<langle>63,0\<rangle>((ucast (((if' ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) \<le>s (((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff) then (\<langle>31,0\<rangle>RCX\<^sub>0::32 word) else ((((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff)::32 word))::32 word))::64 word) * (0x1::64 word))::64 word))::64 word) - 0x2), 2),
    (13, ((((RSP\<^sub>0::64 word) + (\<langle>63,0\<rangle>((((ucast (((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word))::64 word) AND (0x1ff::64 word))::64 word) * 0x1)::64 word))::64 word) - 0x248), Suc 0),
    (14, ((((((RSP\<^sub>0::64 word) + (\<langle>63,0\<rangle>((((ucast (((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word))::64 word) AND (0x1ff::64 word))::64 word) * 0x1)::64 word))::64 word) + (\<langle>63,0\<rangle>((ucast (((if' ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) \<le>s (((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff) then (\<langle>31,0\<rangle>RCX\<^sub>0::32 word) else ((((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff)::32 word))::32 word))::64 word) * (0x1::64 word))::64 word))::64 word) - 0x24a), 2)
  }\<close>

definition P_0x18438_false_14_regions :: state_pred where
  \<open>P_0x18438_false_14_regions \<sigma> \<equiv> \<exists>regions. P_0x18438_false_14_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x184bb_14 :: state_pred where
  \<open>Q_0x184bb_14 \<sigma> \<equiv> RIP \<sigma> = 0x184bb \<and> RBX \<sigma> = ucast ((if' ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) \<le>s (((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff) then (\<langle>31,0\<rangle>RCX\<^sub>0::32 word) else ((((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff)::32 word))) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x258) \<and> RBP \<sigma> = ((RSP\<^sub>0::64 word) - 0x248) \<and> R15 \<sigma> = ((ucast ((RSI\<^sub>0::64 word))::64 word) >>> 9) \<and> R14 \<sigma> = RDX\<^sub>0 \<and> R13 \<sigma> = ucast ((((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) AND 0x1ff)) \<and> R12 \<sigma> = ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)) \<and> R8 \<sigma> = RDI\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x250),8]::64 word) = RDI\<^sub>0\<close>
declare Q_0x184bb_14_def[Qs]

schematic_goal bdrv_pread_em_0_5_0x18438_0x1844b_14[blocks]:
  assumes \<open>(P_0x18438_false_14 && P_0x18438_false_14_regions && ! ZF) \<sigma>\<close>
  shows \<open>exec_block 5 0x1844b 14 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x184bb_14 ?\<sigma> \<and> block_usage P_0x18438_false_14_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x18438_false_14_def P_0x18438_false_14_regions_def post: Q_0x184bb_14_def regionset: P_0x18438_false_14_regions_set_def)

definition P_0x184bb_15 :: state_pred where
  \<open>P_0x184bb_15 \<sigma> \<equiv> RIP \<sigma> = 0x184bb \<and> RBX \<sigma> = ucast ((if' ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) \<le>s (((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff) then (\<langle>31,0\<rangle>RCX\<^sub>0::32 word) else ((((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff)::32 word))) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x258) \<and> RBP \<sigma> = ((RSP\<^sub>0::64 word) - 0x248) \<and> R15 \<sigma> = ((ucast ((RSI\<^sub>0::64 word))::64 word) >>> 9) \<and> R14 \<sigma> = RDX\<^sub>0 \<and> R13 \<sigma> = ucast ((((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) AND 0x1ff)) \<and> R12 \<sigma> = ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)) \<and> R8 \<sigma> = RDI\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x250),8]::64 word) = RDI\<^sub>0\<close>
declare P_0x184bb_15_def[Ps]

definition P_0x184bb_15_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x184bb_15_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((FS\<^sub>0::64 word) + 0x28), 8),
    (2, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x40), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x250), 8)
  }\<close>

definition P_0x184bb_15_regions :: state_pred where
  \<open>P_0x184bb_15_regions \<sigma> \<equiv> \<exists>regions. P_0x184bb_15_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x184c7_15 :: state_pred where
  \<open>Q_0x184c7_15 \<sigma> \<equiv> RIP \<sigma> = 0x184c7 \<and> RBX \<sigma> = ucast ((if' ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) \<le>s (((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff) then (\<langle>31,0\<rangle>RCX\<^sub>0::32 word) else ((((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff)::32 word))) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x258) \<and> RBP \<sigma> = ucast ((((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) - (if' ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) \<le>s (((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff) then (\<langle>31,0\<rangle>RCX\<^sub>0::32 word) else ((((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff)::32 word)))) \<and> R15 \<sigma> = ((((ucast ((RSI\<^sub>0::64 word))::64 word) >>> 9)::64 word) + 0x1) \<and> R14 \<sigma> = ((RDX\<^sub>0::64 word) + RAX \<sigma>) \<and> R13 \<sigma> = ucast ((((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) AND 0x1ff)) \<and> R12 \<sigma> = ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)) \<and> R8 \<sigma> = RDI\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x250),8]::64 word) = RDI\<^sub>0\<close>
declare Q_0x184c7_15_def[Qs]

schematic_goal bdrv_pread_em_0_4_0x184bb_0x184c5_15[blocks]:
  assumes \<open>(P_0x184bb_15 && P_0x184bb_15_regions) \<sigma>\<close>
  shows \<open>exec_block 4 0x184c5 15 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x184c7_15 ?\<sigma> \<and> block_usage P_0x184bb_15_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x184bb_15_def P_0x184bb_15_regions_def post: Q_0x184c7_15_def regionset: P_0x184bb_15_regions_set_def)

definition P_0x184c7_true_16 :: state_pred where
  \<open>P_0x184c7_true_16 \<sigma> \<equiv> RIP \<sigma> = 0x184c7 \<and> RBX \<sigma> = ucast ((if' ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) \<le>s (((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff) then (\<langle>31,0\<rangle>RCX\<^sub>0::32 word) else ((((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff)::32 word))) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x258) \<and> RBP \<sigma> = ucast ((((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) - (if' ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) \<le>s (((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff) then (\<langle>31,0\<rangle>RCX\<^sub>0::32 word) else ((((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff)::32 word)))) \<and> R15 \<sigma> = ((((ucast ((RSI\<^sub>0::64 word))::64 word) >>> 9)::64 word) + 0x1) \<and> R14 \<sigma> = ((RDX\<^sub>0::64 word) + RAX \<sigma>) \<and> R13 \<sigma> = ucast ((((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) AND 0x1ff)) \<and> R12 \<sigma> = ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)) \<and> R8 \<sigma> = RDI\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x250),8]::64 word) = RDI\<^sub>0\<close>
declare P_0x184c7_true_16_def[Ps]

definition P_0x184c7_true_16_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x184c7_true_16_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((FS\<^sub>0::64 word) + 0x28), 8),
    (2, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x40), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x250), 8)
  }\<close>

definition P_0x184c7_true_16_regions :: state_pred where
  \<open>P_0x184c7_true_16_regions \<sigma> \<equiv> \<exists>regions. P_0x184c7_true_16_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x18370_16 :: state_pred where
  \<open>Q_0x18370_16 \<sigma> \<equiv> RIP \<sigma> = 0x18370 \<and> RBX \<sigma> = ucast (((ucast (((((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) - (if' ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) \<le>s (((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff) then (\<langle>31,0\<rangle>RCX\<^sub>0::32 word) else ((((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff)::32 word)))::32 word))::32 word) >>> 9)) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x258) \<and> RBP \<sigma> = ucast ((((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) - (if' ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) \<le>s (((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff) then (\<langle>31,0\<rangle>RCX\<^sub>0::32 word) else ((((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff)::32 word)))) \<and> R15 \<sigma> = ((((ucast ((RSI\<^sub>0::64 word))::64 word) >>> 9)::64 word) + 0x1) \<and> R14 \<sigma> = ((RDX\<^sub>0::64 word) + RAX \<sigma>) \<and> R13 \<sigma> = ucast ((((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) AND 0x1ff)) \<and> R12 \<sigma> = ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)) \<and> R8 \<sigma> = RDI\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x250),8]::64 word) = RDI\<^sub>0\<close>
declare Q_0x18370_16_def[Qs]

schematic_goal bdrv_pread_em_0_4_0x184c7_0x1836e_16[blocks]:
  assumes \<open>(P_0x184c7_true_16 && P_0x184c7_true_16_regions && !ZF) \<sigma>\<close>
  shows \<open>exec_block 4 0x1836e 16 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x18370_16 ?\<sigma> \<and> block_usage P_0x184c7_true_16_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x184c7_true_16_def P_0x184c7_true_16_regions_def post: Q_0x18370_16_def regionset: P_0x184c7_true_16_regions_set_def)

definition P_0x18370_true_17 :: state_pred where
  \<open>P_0x18370_true_17 \<sigma> \<equiv> RIP \<sigma> = 0x18370 \<and> RBX \<sigma> = ucast (((ucast (((((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) - (if' ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) \<le>s (((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff) then (\<langle>31,0\<rangle>RCX\<^sub>0::32 word) else ((((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff)::32 word)))::32 word))::32 word) >>> 9)) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x258) \<and> RBP \<sigma> = ucast ((((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) - (if' ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) \<le>s (((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff) then (\<langle>31,0\<rangle>RCX\<^sub>0::32 word) else ((((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff)::32 word)))) \<and> R15 \<sigma> = ((((ucast ((RSI\<^sub>0::64 word))::64 word) >>> 9)::64 word) + 0x1) \<and> R14 \<sigma> = ((RDX\<^sub>0::64 word) + RAX \<sigma>) \<and> R13 \<sigma> = ucast ((((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) AND 0x1ff)) \<and> R12 \<sigma> = ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)) \<and> R8 \<sigma> = RDI\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x250),8]::64 word) = RDI\<^sub>0\<close>
declare P_0x18370_true_17_def[Ps]

definition P_0x18370_true_17_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x18370_true_17_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((FS\<^sub>0::64 word) + 0x28), 8),
    (2, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x40), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x250), 8)
  }\<close>

definition P_0x18370_true_17_regions :: state_pred where
  \<open>P_0x18370_true_17_regions \<sigma> \<equiv> \<exists>regions. P_0x18370_true_17_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x18460_17 :: state_pred where
  \<open>Q_0x18460_17 \<sigma> \<equiv> RIP \<sigma> = 0x18460 \<and> RBX \<sigma> = ucast (((ucast (((((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) - (if' ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) \<le>s (((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff) then (\<langle>31,0\<rangle>RCX\<^sub>0::32 word) else ((((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff)::32 word)))::32 word))::32 word) >>> 9)) \<and> RCX \<sigma> = ucast (((ucast (((((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) - (if' ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) \<le>s (((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff) then (\<langle>31,0\<rangle>RCX\<^sub>0::32 word) else ((((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff)::32 word)))::32 word))::32 word) >>> 9)) \<and> RDX \<sigma> = ((RDX\<^sub>0::64 word) + RAX \<sigma>) \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = ((((ucast ((RSI\<^sub>0::64 word))::64 word) >>> 9)::64 word) + 0x1) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x258) \<and> RBP \<sigma> = ucast ((((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) - (if' ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) \<le>s (((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff) then (\<langle>31,0\<rangle>RCX\<^sub>0::32 word) else ((((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff)::32 word)))) \<and> R15 \<sigma> = ((((ucast ((RSI\<^sub>0::64 word))::64 word) >>> 9)::64 word) + 0x1) \<and> R14 \<sigma> = ((RDX\<^sub>0::64 word) + RAX \<sigma>) \<and> R13 \<sigma> = ucast ((((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) AND 0x1ff)) \<and> R12 \<sigma> = ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)) \<and> R8 \<sigma> = RDI\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x250),8]::64 word) = RDI\<^sub>0\<close>
declare Q_0x18460_17_def[Qs]

schematic_goal bdrv_pread_em_0_6_0x18370_0x1845b_17[blocks]:
  assumes \<open>(P_0x18370_true_17 && P_0x18370_true_17_regions && jg) \<sigma>\<close>
  shows \<open>exec_block 6 0x1845b 17 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x18460_17 ?\<sigma> \<and> block_usage P_0x18370_true_17_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x18370_true_17_def P_0x18370_true_17_regions_def post: Q_0x18460_17_def regionset: P_0x18370_true_17_regions_set_def)

definition P_0x18460_18 :: state_pred where
  \<open>P_0x18460_18 \<sigma> \<equiv> RIP \<sigma> = 0x18460 \<and> RBX \<sigma> = ucast (((ucast (((((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) - (if' ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) \<le>s (((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff) then (\<langle>31,0\<rangle>RCX\<^sub>0::32 word) else ((((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff)::32 word)))::32 word))::32 word) >>> 9)) \<and> RCX \<sigma> = ucast (((ucast (((((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) - (if' ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) \<le>s (((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff) then (\<langle>31,0\<rangle>RCX\<^sub>0::32 word) else ((((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff)::32 word)))::32 word))::32 word) >>> 9)) \<and> RDX \<sigma> = ((RDX\<^sub>0::64 word) + RAX \<sigma>) \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = ((((ucast ((RSI\<^sub>0::64 word))::64 word) >>> 9)::64 word) + 0x1) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x258) \<and> RBP \<sigma> = ucast ((((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) - (if' ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) \<le>s (((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff) then (\<langle>31,0\<rangle>RCX\<^sub>0::32 word) else ((((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff)::32 word)))) \<and> R15 \<sigma> = ((((ucast ((RSI\<^sub>0::64 word))::64 word) >>> 9)::64 word) + 0x1) \<and> R14 \<sigma> = ((RDX\<^sub>0::64 word) + RAX \<sigma>) \<and> R13 \<sigma> = ucast ((((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) AND 0x1ff)) \<and> R12 \<sigma> = ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)) \<and> R8 \<sigma> = RDI\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x250),8]::64 word) = RDI\<^sub>0\<close>
declare P_0x18460_18_def[Ps]

definition P_0x18460_18_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x18460_18_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((FS\<^sub>0::64 word) + 0x28), 8),
    (2, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x40), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x250), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x260), 8)
  }\<close>

definition P_0x18460_18_regions :: state_pred where
  \<open>P_0x18460_18_regions \<sigma> \<equiv> \<exists>regions. P_0x18460_18_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_bdrv_read_addr_0x18460_18 :: state_pred where
  \<open>Q_bdrv_read_addr_0x18460_18 \<sigma> \<equiv> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x260) \<and> RIP \<sigma> = bdrv_read_addr \<and> RBX \<sigma> = ucast (((ucast (((((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) - (if' ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) \<le>s (((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff) then (\<langle>31,0\<rangle>RCX\<^sub>0::32 word) else ((((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff)::32 word)))::32 word))::32 word) >>> 9)) \<and> RCX \<sigma> = ucast (((ucast (((((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) - (if' ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) \<le>s (((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff) then (\<langle>31,0\<rangle>RCX\<^sub>0::32 word) else ((((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff)::32 word)))::32 word))::32 word) >>> 9)) \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = ((((ucast ((RSI\<^sub>0::64 word))::64 word) >>> 9)::64 word) + 0x1) \<and> RBP \<sigma> = ucast ((((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) - (if' ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) \<le>s (((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff) then (\<langle>31,0\<rangle>RCX\<^sub>0::32 word) else ((((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff)::32 word)))) \<and> R15 \<sigma> = ((((ucast ((RSI\<^sub>0::64 word))::64 word) >>> 9)::64 word) + 0x1) \<and> R13 \<sigma> = ucast ((((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) AND 0x1ff)) \<and> R12 \<sigma> = ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)) \<and> R8 \<sigma> = RDI\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x250),8]::64 word) = RDI\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x260),8]::64 word) = 0x18465\<close>
declare Q_bdrv_read_addr_0x18460_18_def[Qs]

schematic_goal bdrv_pread_em_0_1_0x18460_0x18460_18[blocks]:
  assumes \<open>(P_0x18460_18 && P_0x18460_18_regions) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x18460 18 \<sigma> \<triangleq> ?\<sigma> \<and> Q_bdrv_read_addr_0x18460_18 ?\<sigma> \<and> block_usage P_0x18460_18_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x18460_18_def P_0x18460_18_regions_def post: Q_bdrv_read_addr_0x18460_18_def regionset: P_0x18460_18_regions_set_def)

definition P_0x18465_19 :: state_pred where
  \<open>P_0x18465_19 \<sigma> \<equiv> RIP \<sigma> = 0x18465 \<and> RBX \<sigma> = ucast (((ucast (((((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) - (if' ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) \<le>s (((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff) then (\<langle>31,0\<rangle>RCX\<^sub>0::32 word) else ((((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff)::32 word)))::32 word))::32 word) >>> 9)) \<and> RCX \<sigma> = ucast (((ucast (((((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) - (if' ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) \<le>s (((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff) then (\<langle>31,0\<rangle>RCX\<^sub>0::32 word) else ((((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff)::32 word)))::32 word))::32 word) >>> 9)) \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = ((((ucast ((RSI\<^sub>0::64 word))::64 word) >>> 9)::64 word) + 0x1) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x258) \<and> RBP \<sigma> = ucast ((((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) - (if' ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) \<le>s (((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff) then (\<langle>31,0\<rangle>RCX\<^sub>0::32 word) else ((((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff)::32 word)))) \<and> R15 \<sigma> = ((((ucast ((RSI\<^sub>0::64 word))::64 word) >>> 9)::64 word) + 0x1) \<and> R13 \<sigma> = ucast ((((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) AND 0x1ff)) \<and> R12 \<sigma> = ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)) \<and> R8 \<sigma> = RDI\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x250),8]::64 word) = RDI\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x260),8]::64 word) = 0x18465\<close>
declare P_0x18465_19_def[Ps]

definition P_0x18465_19_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x18465_19_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((FS\<^sub>0::64 word) + 0x28), 8),
    (2, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x40), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x250), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x260), 8)
  }\<close>

definition P_0x18465_19_regions :: state_pred where
  \<open>P_0x18465_19_regions \<sigma> \<equiv> \<exists>regions. P_0x18465_19_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x18467_19 :: state_pred where
  \<open>Q_0x18467_19 \<sigma> \<equiv> RIP \<sigma> = 0x18467 \<and> RBX \<sigma> = ucast (((ucast (((((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) - (if' ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) \<le>s (((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff) then (\<langle>31,0\<rangle>RCX\<^sub>0::32 word) else ((((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff)::32 word)))::32 word))::32 word) >>> 9)) \<and> RCX \<sigma> = ucast (((ucast (((((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) - (if' ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) \<le>s (((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff) then (\<langle>31,0\<rangle>RCX\<^sub>0::32 word) else ((((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff)::32 word)))::32 word))::32 word) >>> 9)) \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = ((((ucast ((RSI\<^sub>0::64 word))::64 word) >>> 9)::64 word) + 0x1) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x258) \<and> RBP \<sigma> = ucast ((((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) - (if' ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) \<le>s (((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff) then (\<langle>31,0\<rangle>RCX\<^sub>0::32 word) else ((((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff)::32 word)))) \<and> R15 \<sigma> = ((((ucast ((RSI\<^sub>0::64 word))::64 word) >>> 9)::64 word) + 0x1) \<and> R13 \<sigma> = ucast ((((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) AND 0x1ff)) \<and> R12 \<sigma> = ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)) \<and> R8 \<sigma> = RDI\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x250),8]::64 word) = RDI\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x260),8]::64 word) = 0x18465\<close>
declare Q_0x18467_19_def[Qs]

schematic_goal bdrv_pread_em_0_1_0x18465_0x18465_19[blocks]:
  assumes \<open>(P_0x18465_19 && P_0x18465_19_regions) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x18465 19 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x18467_19 ?\<sigma> \<and> block_usage P_0x18465_19_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x18465_19_def P_0x18465_19_regions_def post: Q_0x18467_19_def regionset: P_0x18465_19_regions_set_def)

definition P_0x18467_true_20 :: state_pred where
  \<open>P_0x18467_true_20 \<sigma> \<equiv> RIP \<sigma> = 0x18467 \<and> RBX \<sigma> = ucast (((ucast (((((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) - (if' ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) \<le>s (((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff) then (\<langle>31,0\<rangle>RCX\<^sub>0::32 word) else ((((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff)::32 word)))::32 word))::32 word) >>> 9)) \<and> RCX \<sigma> = ucast (((ucast (((((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) - (if' ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) \<le>s (((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff) then (\<langle>31,0\<rangle>RCX\<^sub>0::32 word) else ((((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff)::32 word)))::32 word))::32 word) >>> 9)) \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = ((((ucast ((RSI\<^sub>0::64 word))::64 word) >>> 9)::64 word) + 0x1) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x258) \<and> RBP \<sigma> = ucast ((((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) - (if' ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) \<le>s (((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff) then (\<langle>31,0\<rangle>RCX\<^sub>0::32 word) else ((((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff)::32 word)))) \<and> R15 \<sigma> = ((((ucast ((RSI\<^sub>0::64 word))::64 word) >>> 9)::64 word) + 0x1) \<and> R13 \<sigma> = ucast ((((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) AND 0x1ff)) \<and> R12 \<sigma> = ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)) \<and> R8 \<sigma> = RDI\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x250),8]::64 word) = RDI\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x260),8]::64 word) = 0x18465\<close>
declare P_0x18467_true_20_def[Ps]

definition P_0x18467_true_20_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x18467_true_20_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((FS\<^sub>0::64 word) + 0x28), 8),
    (2, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x40), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x250), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x260), 8)
  }\<close>

definition P_0x18467_true_20_regions :: state_pred where
  \<open>P_0x18467_true_20_regions \<sigma> \<equiv> \<exists>regions. P_0x18467_true_20_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x1837d_20 :: state_pred where
  \<open>Q_0x1837d_20 \<sigma> \<equiv> RIP \<sigma> = 0x1837d \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x258) \<and> R12 \<sigma> = ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)) \<and> R8 \<sigma> = RDI\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word)\<close>
declare Q_0x1837d_20_def[Qs]

schematic_goal bdrv_pread_em_0_3_0x18467_0x184f5_20[blocks]:
  assumes \<open>(P_0x18467_true_20 && P_0x18467_true_20_regions && SF) \<sigma>\<close>
  shows \<open>exec_block 3 0x184f5 20 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x1837d_20 ?\<sigma> \<and> block_usage P_0x18467_true_20_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x18467_true_20_def P_0x18467_true_20_regions_def post: Q_0x1837d_20_def regionset: P_0x18467_true_20_regions_set_def)

definition P_0x18467_false_21 :: state_pred where
  \<open>P_0x18467_false_21 \<sigma> \<equiv> RIP \<sigma> = 0x18467 \<and> RBX \<sigma> = ucast (((ucast (((((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) - (if' ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) \<le>s (((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff) then (\<langle>31,0\<rangle>RCX\<^sub>0::32 word) else ((((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff)::32 word)))::32 word))::32 word) >>> 9)) \<and> RCX \<sigma> = ucast (((ucast (((((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) - (if' ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) \<le>s (((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff) then (\<langle>31,0\<rangle>RCX\<^sub>0::32 word) else ((((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff)::32 word)))::32 word))::32 word) >>> 9)) \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = ((((ucast ((RSI\<^sub>0::64 word))::64 word) >>> 9)::64 word) + 0x1) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x258) \<and> RBP \<sigma> = ucast ((((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) - (if' ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) \<le>s (((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff) then (\<langle>31,0\<rangle>RCX\<^sub>0::32 word) else ((((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff)::32 word)))) \<and> R15 \<sigma> = ((((ucast ((RSI\<^sub>0::64 word))::64 word) >>> 9)::64 word) + 0x1) \<and> R13 \<sigma> = ucast ((((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) AND 0x1ff)) \<and> R12 \<sigma> = ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)) \<and> R8 \<sigma> = RDI\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x250),8]::64 word) = RDI\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x260),8]::64 word) = 0x18465\<close>
declare P_0x18467_false_21_def[Ps]

definition P_0x18467_false_21_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x18467_false_21_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((FS\<^sub>0::64 word) + 0x28), 8),
    (2, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x40), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x250), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x260), 8)
  }\<close>

definition P_0x18467_false_21_regions :: state_pred where
  \<open>P_0x18467_false_21_regions \<sigma> \<equiv> \<exists>regions. P_0x18467_false_21_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x18376_21 :: state_pred where
  \<open>Q_0x18376_21 \<sigma> \<equiv> RIP \<sigma> = 0x18376 \<and> RAX \<sigma> = ucast ((((((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) - (if' ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) \<le>s (((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff) then (\<langle>31,0\<rangle>RCX\<^sub>0::32 word) else ((((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff)::32 word)))::32 word) AND 0xfffffe00)) \<and> RBX \<sigma> = (sextend (ucast (((ucast (((((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) - (if' ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) \<le>s (((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff) then (\<langle>31,0\<rangle>RCX\<^sub>0::32 word) else ((((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff)::32 word)))::32 word))::32 word) >>> 9))) 32 64::64 word) \<and> RCX \<sigma> = ucast (((ucast (((((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) - (if' ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) \<le>s (((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff) then (\<langle>31,0\<rangle>RCX\<^sub>0::32 word) else ((((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff)::32 word)))::32 word))::32 word) >>> 9)) \<and> RDX \<sigma> = (sextend (ucast ((((((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) - (if' ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) \<le>s (((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff) then (\<langle>31,0\<rangle>RCX\<^sub>0::32 word) else ((((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff)::32 word)))::32 word) AND 0xfffffe00))) 32 64::64 word) \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = ((((ucast ((RSI\<^sub>0::64 word))::64 word) >>> 9)::64 word) + 0x1) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x258) \<and> RBP \<sigma> = ucast ((((((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) - (if' ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) \<le>s (((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff) then (\<langle>31,0\<rangle>RCX\<^sub>0::32 word) else ((((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff)::32 word)))::32 word) - (((((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) - (if' ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) \<le>s (((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff) then (\<langle>31,0\<rangle>RCX\<^sub>0::32 word) else ((((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff)::32 word)))::32 word) AND 0xfffffe00))) \<and> R15 \<sigma> = ((((((ucast ((RSI\<^sub>0::64 word))::64 word) >>> 9)::64 word) + (sextend (ucast (((ucast (((((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) - (if' ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) \<le>s (((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff) then (\<langle>31,0\<rangle>RCX\<^sub>0::32 word) else ((((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff)::32 word)))::32 word))::32 word) >>> 9))) 32 64::64 word))::64 word) + 0x1) \<and> R13 \<sigma> = ucast ((((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) AND 0x1ff)) \<and> R12 \<sigma> = ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)) \<and> R8 \<sigma> = RDI\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x250),8]::64 word) = RDI\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x260),8]::64 word) = 0x18465\<close>
declare Q_0x18376_21_def[Qs]

schematic_goal bdrv_pread_em_0_10_0x18467_0x18487_21[blocks]:
  assumes \<open>(P_0x18467_false_21 && P_0x18467_false_21_regions && ! SF) \<sigma>\<close>
  shows \<open>exec_block 10 0x18487 21 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x18376_21 ?\<sigma> \<and> block_usage P_0x18467_false_21_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x18467_false_21_def P_0x18467_false_21_regions_def post: Q_0x18376_21_def regionset: P_0x18467_false_21_regions_set_def)

definition P_0x18376_22 :: state_pred where
  \<open>P_0x18376_22 \<sigma> \<equiv> RIP \<sigma> = 0x18376 \<and> RAX \<sigma> = ucast ((((((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) - (if' ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) \<le>s (((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff) then (\<langle>31,0\<rangle>RCX\<^sub>0::32 word) else ((((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff)::32 word)))::32 word) AND 0xfffffe00)) \<and> RBX \<sigma> = (sextend (ucast (((ucast (((((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) - (if' ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) \<le>s (((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff) then (\<langle>31,0\<rangle>RCX\<^sub>0::32 word) else ((((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff)::32 word)))::32 word))::32 word) >>> 9))) 32 64::64 word) \<and> RCX \<sigma> = ucast (((ucast (((((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) - (if' ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) \<le>s (((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff) then (\<langle>31,0\<rangle>RCX\<^sub>0::32 word) else ((((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff)::32 word)))::32 word))::32 word) >>> 9)) \<and> RDX \<sigma> = (sextend (ucast ((((((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) - (if' ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) \<le>s (((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff) then (\<langle>31,0\<rangle>RCX\<^sub>0::32 word) else ((((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff)::32 word)))::32 word) AND 0xfffffe00))) 32 64::64 word) \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = ((((ucast ((RSI\<^sub>0::64 word))::64 word) >>> 9)::64 word) + 0x1) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x258) \<and> RBP \<sigma> = ucast ((((((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) - (if' ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) \<le>s (((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff) then (\<langle>31,0\<rangle>RCX\<^sub>0::32 word) else ((((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff)::32 word)))::32 word) - (((((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) - (if' ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) \<le>s (((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff) then (\<langle>31,0\<rangle>RCX\<^sub>0::32 word) else ((((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff)::32 word)))::32 word) AND 0xfffffe00))) \<and> R15 \<sigma> = ((((((ucast ((RSI\<^sub>0::64 word))::64 word) >>> 9)::64 word) + (sextend (ucast (((ucast (((((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) - (if' ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) \<le>s (((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff) then (\<langle>31,0\<rangle>RCX\<^sub>0::32 word) else ((((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff)::32 word)))::32 word))::32 word) >>> 9))) 32 64::64 word))::64 word) + 0x1) \<and> R13 \<sigma> = ucast ((((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) AND 0x1ff)) \<and> R12 \<sigma> = ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)) \<and> R8 \<sigma> = RDI\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x250),8]::64 word) = RDI\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x260),8]::64 word) = 0x18465\<close>
declare P_0x18376_22_def[Ps]

definition P_0x18376_22_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x18376_22_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((FS\<^sub>0::64 word) + 0x28), 8),
    (2, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x40), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x250), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x260), 8)
  }\<close>

definition P_0x18376_22_regions :: state_pred where
  \<open>P_0x18376_22_regions \<sigma> \<equiv> \<exists>regions. P_0x18376_22_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x18378_22 :: state_pred where
  \<open>Q_0x18378_22 \<sigma> \<equiv> RIP \<sigma> = 0x18378 \<and> RAX \<sigma> = ucast ((((((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) - (if' ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) \<le>s (((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff) then (\<langle>31,0\<rangle>RCX\<^sub>0::32 word) else ((((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff)::32 word)))::32 word) AND 0xfffffe00)) \<and> RBX \<sigma> = (sextend (ucast (((ucast (((((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) - (if' ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) \<le>s (((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff) then (\<langle>31,0\<rangle>RCX\<^sub>0::32 word) else ((((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff)::32 word)))::32 word))::32 word) >>> 9))) 32 64::64 word) \<and> RCX \<sigma> = ucast (((ucast (((((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) - (if' ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) \<le>s (((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff) then (\<langle>31,0\<rangle>RCX\<^sub>0::32 word) else ((((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff)::32 word)))::32 word))::32 word) >>> 9)) \<and> RDX \<sigma> = (sextend (ucast ((((((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) - (if' ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) \<le>s (((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff) then (\<langle>31,0\<rangle>RCX\<^sub>0::32 word) else ((((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff)::32 word)))::32 word) AND 0xfffffe00))) 32 64::64 word) \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = ((((ucast ((RSI\<^sub>0::64 word))::64 word) >>> 9)::64 word) + 0x1) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x258) \<and> RBP \<sigma> = ucast ((((((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) - (if' ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) \<le>s (((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff) then (\<langle>31,0\<rangle>RCX\<^sub>0::32 word) else ((((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff)::32 word)))::32 word) - (((((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) - (if' ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) \<le>s (((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff) then (\<langle>31,0\<rangle>RCX\<^sub>0::32 word) else ((((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff)::32 word)))::32 word) AND 0xfffffe00))) \<and> R15 \<sigma> = ((((((ucast ((RSI\<^sub>0::64 word))::64 word) >>> 9)::64 word) + (sextend (ucast (((ucast (((((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) - (if' ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) \<le>s (((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff) then (\<langle>31,0\<rangle>RCX\<^sub>0::32 word) else ((((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff)::32 word)))::32 word))::32 word) >>> 9))) 32 64::64 word))::64 word) + 0x1) \<and> R13 \<sigma> = ucast ((((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) AND 0x1ff)) \<and> R12 \<sigma> = ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)) \<and> R8 \<sigma> = RDI\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x250),8]::64 word) = RDI\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x260),8]::64 word) = 0x18465\<close>
declare Q_0x18378_22_def[Qs]

schematic_goal bdrv_pread_em_0_1_0x18376_0x18376_22[blocks]:
  assumes \<open>(P_0x18376_22 && P_0x18376_22_regions) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x18376 22 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x18378_22 ?\<sigma> \<and> block_usage P_0x18376_22_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x18376_22_def P_0x18376_22_regions_def post: Q_0x18378_22_def regionset: P_0x18376_22_regions_set_def)

definition P_0x18378_true_23 :: state_pred where
  \<open>P_0x18378_true_23 \<sigma> \<equiv> RIP \<sigma> = 0x18378 \<and> RAX \<sigma> = ucast ((((((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) - (if' ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) \<le>s (((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff) then (\<langle>31,0\<rangle>RCX\<^sub>0::32 word) else ((((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff)::32 word)))::32 word) AND 0xfffffe00)) \<and> RBX \<sigma> = (sextend (ucast (((ucast (((((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) - (if' ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) \<le>s (((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff) then (\<langle>31,0\<rangle>RCX\<^sub>0::32 word) else ((((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff)::32 word)))::32 word))::32 word) >>> 9))) 32 64::64 word) \<and> RCX \<sigma> = ucast (((ucast (((((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) - (if' ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) \<le>s (((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff) then (\<langle>31,0\<rangle>RCX\<^sub>0::32 word) else ((((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff)::32 word)))::32 word))::32 word) >>> 9)) \<and> RDX \<sigma> = (sextend (ucast ((((((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) - (if' ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) \<le>s (((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff) then (\<langle>31,0\<rangle>RCX\<^sub>0::32 word) else ((((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff)::32 word)))::32 word) AND 0xfffffe00))) 32 64::64 word) \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = ((((ucast ((RSI\<^sub>0::64 word))::64 word) >>> 9)::64 word) + 0x1) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x258) \<and> RBP \<sigma> = ucast ((((((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) - (if' ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) \<le>s (((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff) then (\<langle>31,0\<rangle>RCX\<^sub>0::32 word) else ((((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff)::32 word)))::32 word) - (((((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) - (if' ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) \<le>s (((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff) then (\<langle>31,0\<rangle>RCX\<^sub>0::32 word) else ((((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff)::32 word)))::32 word) AND 0xfffffe00))) \<and> R15 \<sigma> = ((((((ucast ((RSI\<^sub>0::64 word))::64 word) >>> 9)::64 word) + (sextend (ucast (((ucast (((((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) - (if' ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) \<le>s (((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff) then (\<langle>31,0\<rangle>RCX\<^sub>0::32 word) else ((((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff)::32 word)))::32 word))::32 word) >>> 9))) 32 64::64 word))::64 word) + 0x1) \<and> R13 \<sigma> = ucast ((((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) AND 0x1ff)) \<and> R12 \<sigma> = ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)) \<and> R8 \<sigma> = RDI\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x250),8]::64 word) = RDI\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x260),8]::64 word) = 0x18465\<close>
declare P_0x18378_true_23_def[Ps]

definition P_0x18378_true_23_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x18378_true_23_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((FS\<^sub>0::64 word) + 0x28), 8),
    (2, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x40), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x250), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x260), 8)
  }\<close>

definition P_0x18378_true_23_regions :: state_pred where
  \<open>P_0x18378_true_23_regions \<sigma> \<equiv> \<exists>regions. P_0x18378_true_23_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x183c3_23 :: state_pred where
  \<open>Q_0x183c3_23 \<sigma> \<equiv> RIP \<sigma> = 0x183c3 \<and> RAX \<sigma> = ucast ((((((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) - (if' ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) \<le>s (((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff) then (\<langle>31,0\<rangle>RCX\<^sub>0::32 word) else ((((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff)::32 word)))::32 word) AND 0xfffffe00)) \<and> RBX \<sigma> = ((RSP\<^sub>0::64 word) - 0x248) \<and> RCX \<sigma> = 0x1 \<and> RDX \<sigma> = ((RSP\<^sub>0::64 word) - 0x248) \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = ((((((ucast ((RSI\<^sub>0::64 word))::64 word) >>> 9)::64 word) + (sextend (ucast (((ucast (((((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) - (if' ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) \<le>s (((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff) then (\<langle>31,0\<rangle>RCX\<^sub>0::32 word) else ((((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff)::32 word)))::32 word))::32 word) >>> 9))) 32 64::64 word))::64 word) + 0x1) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x258) \<and> RBP \<sigma> = ucast ((((((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) - (if' ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) \<le>s (((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff) then (\<langle>31,0\<rangle>RCX\<^sub>0::32 word) else ((((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff)::32 word)))::32 word) - (((((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) - (if' ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) \<le>s (((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff) then (\<langle>31,0\<rangle>RCX\<^sub>0::32 word) else ((((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff)::32 word)))::32 word) AND 0xfffffe00))) \<and> R15 \<sigma> = ((((((ucast ((RSI\<^sub>0::64 word))::64 word) >>> 9)::64 word) + (sextend (ucast (((ucast (((((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) - (if' ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) \<le>s (((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff) then (\<langle>31,0\<rangle>RCX\<^sub>0::32 word) else ((((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff)::32 word)))::32 word))::32 word) >>> 9))) 32 64::64 word))::64 word) + 0x1) \<and> R13 \<sigma> = ucast ((((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) AND 0x1ff)) \<and> R12 \<sigma> = ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)) \<and> R8 \<sigma> = RDI\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x250),8]::64 word) = RDI\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x260),8]::64 word) = 0x18465\<close>
declare Q_0x183c3_23_def[Qs]

schematic_goal bdrv_pread_em_0_6_0x18378_0x183c0_23[blocks]:
  assumes \<open>(P_0x18378_true_23 && P_0x18378_true_23_regions && jg) \<sigma>\<close>
  shows \<open>exec_block 6 0x183c0 23 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x183c3_23 ?\<sigma> \<and> block_usage P_0x18378_true_23_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x18378_true_23_def P_0x18378_true_23_regions_def post: Q_0x183c3_23_def regionset: P_0x18378_true_23_regions_set_def)

definition P_0x183c3_24 :: state_pred where
  \<open>P_0x183c3_24 \<sigma> \<equiv> RIP \<sigma> = 0x183c3 \<and> RAX \<sigma> = ucast ((((((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) - (if' ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) \<le>s (((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff) then (\<langle>31,0\<rangle>RCX\<^sub>0::32 word) else ((((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff)::32 word)))::32 word) AND 0xfffffe00)) \<and> RBX \<sigma> = ((RSP\<^sub>0::64 word) - 0x248) \<and> RCX \<sigma> = 0x1 \<and> RDX \<sigma> = ((RSP\<^sub>0::64 word) - 0x248) \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = ((((((ucast ((RSI\<^sub>0::64 word))::64 word) >>> 9)::64 word) + (sextend (ucast (((ucast (((((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) - (if' ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) \<le>s (((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff) then (\<langle>31,0\<rangle>RCX\<^sub>0::32 word) else ((((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff)::32 word)))::32 word))::32 word) >>> 9))) 32 64::64 word))::64 word) + 0x1) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x258) \<and> RBP \<sigma> = ucast ((((((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) - (if' ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) \<le>s (((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff) then (\<langle>31,0\<rangle>RCX\<^sub>0::32 word) else ((((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff)::32 word)))::32 word) - (((((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) - (if' ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) \<le>s (((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff) then (\<langle>31,0\<rangle>RCX\<^sub>0::32 word) else ((((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff)::32 word)))::32 word) AND 0xfffffe00))) \<and> R15 \<sigma> = ((((((ucast ((RSI\<^sub>0::64 word))::64 word) >>> 9)::64 word) + (sextend (ucast (((ucast (((((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) - (if' ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) \<le>s (((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff) then (\<langle>31,0\<rangle>RCX\<^sub>0::32 word) else ((((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff)::32 word)))::32 word))::32 word) >>> 9))) 32 64::64 word))::64 word) + 0x1) \<and> R13 \<sigma> = ucast ((((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) AND 0x1ff)) \<and> R12 \<sigma> = ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)) \<and> R8 \<sigma> = RDI\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x250),8]::64 word) = RDI\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x260),8]::64 word) = 0x18465\<close>
declare P_0x183c3_24_def[Ps]

definition P_0x183c3_24_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x183c3_24_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((FS\<^sub>0::64 word) + 0x28), 8),
    (2, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x40), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x250), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x260), 8)
  }\<close>

definition P_0x183c3_24_regions :: state_pred where
  \<open>P_0x183c3_24_regions \<sigma> \<equiv> \<exists>regions. P_0x183c3_24_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_bdrv_read_addr_0x183c3_24 :: state_pred where
  \<open>Q_bdrv_read_addr_0x183c3_24 \<sigma> \<equiv> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x260) \<and> RIP \<sigma> = bdrv_read_addr \<and> RAX \<sigma> = ucast ((((((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) - (if' ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) \<le>s (((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff) then (\<langle>31,0\<rangle>RCX\<^sub>0::32 word) else ((((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff)::32 word)))::32 word) AND 0xfffffe00)) \<and> RBX \<sigma> = ((RSP\<^sub>0::64 word) - 0x248) \<and> RCX \<sigma> = 0x1 \<and> RDX \<sigma> = ((RSP\<^sub>0::64 word) - 0x248) \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = ((((((ucast ((RSI\<^sub>0::64 word))::64 word) >>> 9)::64 word) + (sextend (ucast (((ucast (((((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) - (if' ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) \<le>s (((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff) then (\<langle>31,0\<rangle>RCX\<^sub>0::32 word) else ((((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff)::32 word)))::32 word))::32 word) >>> 9))) 32 64::64 word))::64 word) + 0x1) \<and> RBP \<sigma> = ucast ((((((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) - (if' ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) \<le>s (((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff) then (\<langle>31,0\<rangle>RCX\<^sub>0::32 word) else ((((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff)::32 word)))::32 word) - (((((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) - (if' ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) \<le>s (((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff) then (\<langle>31,0\<rangle>RCX\<^sub>0::32 word) else ((((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff)::32 word)))::32 word) AND 0xfffffe00))) \<and> R15 \<sigma> = ((((((ucast ((RSI\<^sub>0::64 word))::64 word) >>> 9)::64 word) + (sextend (ucast (((ucast (((((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) - (if' ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) \<le>s (((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff) then (\<langle>31,0\<rangle>RCX\<^sub>0::32 word) else ((((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff)::32 word)))::32 word))::32 word) >>> 9))) 32 64::64 word))::64 word) + 0x1) \<and> R13 \<sigma> = ucast ((((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) AND 0x1ff)) \<and> R12 \<sigma> = ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)) \<and> R8 \<sigma> = RDI\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x250),8]::64 word) = RDI\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x260),8]::64 word) = 0x183c8\<close>
declare Q_bdrv_read_addr_0x183c3_24_def[Qs]

schematic_goal bdrv_pread_em_0_1_0x183c3_0x183c3_24[blocks]:
  assumes \<open>(P_0x183c3_24 && P_0x183c3_24_regions) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x183c3 24 \<sigma> \<triangleq> ?\<sigma> \<and> Q_bdrv_read_addr_0x183c3_24 ?\<sigma> \<and> block_usage P_0x183c3_24_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x183c3_24_def P_0x183c3_24_regions_def post: Q_bdrv_read_addr_0x183c3_24_def regionset: P_0x183c3_24_regions_set_def)

definition P_0x183c8_25 :: state_pred where
  \<open>P_0x183c8_25 \<sigma> \<equiv> RIP \<sigma> = 0x183c8 \<and> RAX \<sigma> = bdrv_read_0x183c3_retval \<and> RBX \<sigma> = ((RSP\<^sub>0::64 word) - 0x248) \<and> RCX \<sigma> = 0x1 \<and> RDX \<sigma> = ((RSP\<^sub>0::64 word) - 0x248) \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = ((((((ucast ((RSI\<^sub>0::64 word))::64 word) >>> 9)::64 word) + (sextend (ucast (((ucast (((((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) - (if' ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) \<le>s (((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff) then (\<langle>31,0\<rangle>RCX\<^sub>0::32 word) else ((((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff)::32 word)))::32 word))::32 word) >>> 9))) 32 64::64 word))::64 word) + 0x1) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x258) \<and> RBP \<sigma> = ucast ((((((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) - (if' ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) \<le>s (((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff) then (\<langle>31,0\<rangle>RCX\<^sub>0::32 word) else ((((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff)::32 word)))::32 word) - (((((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) - (if' ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) \<le>s (((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff) then (\<langle>31,0\<rangle>RCX\<^sub>0::32 word) else ((((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff)::32 word)))::32 word) AND 0xfffffe00))) \<and> R15 \<sigma> = ((((((ucast ((RSI\<^sub>0::64 word))::64 word) >>> 9)::64 word) + (sextend (ucast (((ucast (((((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) - (if' ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) \<le>s (((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff) then (\<langle>31,0\<rangle>RCX\<^sub>0::32 word) else ((((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff)::32 word)))::32 word))::32 word) >>> 9))) 32 64::64 word))::64 word) + 0x1) \<and> R13 \<sigma> = ucast ((((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) AND 0x1ff)) \<and> R12 \<sigma> = ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)) \<and> R8 \<sigma> = RDI\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x250),8]::64 word) = RDI\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x260),8]::64 word) = 0x183c8\<close>
declare P_0x183c8_25_def[Ps]

definition P_0x183c8_25_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x183c8_25_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((FS\<^sub>0::64 word) + 0x28), 8),
    (2, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x40), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x250), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x260), 8)
  }\<close>

definition P_0x183c8_25_regions :: state_pred where
  \<open>P_0x183c8_25_regions \<sigma> \<equiv> \<exists>regions. P_0x183c8_25_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x183ca_25 :: state_pred where
  \<open>Q_0x183ca_25 \<sigma> \<equiv> RIP \<sigma> = 0x183ca \<and> RAX \<sigma> = bdrv_read_0x183c3_retval \<and> RBX \<sigma> = ((RSP\<^sub>0::64 word) - 0x248) \<and> RCX \<sigma> = 0x1 \<and> RDX \<sigma> = ((RSP\<^sub>0::64 word) - 0x248) \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = ((((((ucast ((RSI\<^sub>0::64 word))::64 word) >>> 9)::64 word) + (sextend (ucast (((ucast (((((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) - (if' ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) \<le>s (((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff) then (\<langle>31,0\<rangle>RCX\<^sub>0::32 word) else ((((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff)::32 word)))::32 word))::32 word) >>> 9))) 32 64::64 word))::64 word) + 0x1) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x258) \<and> RBP \<sigma> = ucast ((((((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) - (if' ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) \<le>s (((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff) then (\<langle>31,0\<rangle>RCX\<^sub>0::32 word) else ((((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff)::32 word)))::32 word) - (((((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) - (if' ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) \<le>s (((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff) then (\<langle>31,0\<rangle>RCX\<^sub>0::32 word) else ((((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff)::32 word)))::32 word) AND 0xfffffe00))) \<and> R15 \<sigma> = ((((((ucast ((RSI\<^sub>0::64 word))::64 word) >>> 9)::64 word) + (sextend (ucast (((ucast (((((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) - (if' ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) \<le>s (((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff) then (\<langle>31,0\<rangle>RCX\<^sub>0::32 word) else ((((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff)::32 word)))::32 word))::32 word) >>> 9))) 32 64::64 word))::64 word) + 0x1) \<and> R13 \<sigma> = ucast ((((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) AND 0x1ff)) \<and> R12 \<sigma> = ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)) \<and> R8 \<sigma> = RDI\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x250),8]::64 word) = RDI\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x260),8]::64 word) = 0x183c8\<close>
declare Q_0x183ca_25_def[Qs]

schematic_goal bdrv_pread_em_0_1_0x183c8_0x183c8_25[blocks]:
  assumes \<open>(P_0x183c8_25 && P_0x183c8_25_regions) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x183c8 25 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x183ca_25 ?\<sigma> \<and> block_usage P_0x183c8_25_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x183c8_25_def P_0x183c8_25_regions_def post: Q_0x183ca_25_def regionset: P_0x183c8_25_regions_set_def)

definition P_0x183ca_true_26 :: state_pred where
  \<open>P_0x183ca_true_26 \<sigma> \<equiv> RIP \<sigma> = 0x183ca \<and> RAX \<sigma> = bdrv_read_0x183c3_retval \<and> RBX \<sigma> = ((RSP\<^sub>0::64 word) - 0x248) \<and> RCX \<sigma> = 0x1 \<and> RDX \<sigma> = ((RSP\<^sub>0::64 word) - 0x248) \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = ((((((ucast ((RSI\<^sub>0::64 word))::64 word) >>> 9)::64 word) + (sextend (ucast (((ucast (((((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) - (if' ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) \<le>s (((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff) then (\<langle>31,0\<rangle>RCX\<^sub>0::32 word) else ((((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff)::32 word)))::32 word))::32 word) >>> 9))) 32 64::64 word))::64 word) + 0x1) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x258) \<and> RBP \<sigma> = ucast ((((((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) - (if' ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) \<le>s (((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff) then (\<langle>31,0\<rangle>RCX\<^sub>0::32 word) else ((((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff)::32 word)))::32 word) - (((((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) - (if' ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) \<le>s (((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff) then (\<langle>31,0\<rangle>RCX\<^sub>0::32 word) else ((((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff)::32 word)))::32 word) AND 0xfffffe00))) \<and> R15 \<sigma> = ((((((ucast ((RSI\<^sub>0::64 word))::64 word) >>> 9)::64 word) + (sextend (ucast (((ucast (((((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) - (if' ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) \<le>s (((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff) then (\<langle>31,0\<rangle>RCX\<^sub>0::32 word) else ((((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff)::32 word)))::32 word))::32 word) >>> 9))) 32 64::64 word))::64 word) + 0x1) \<and> R13 \<sigma> = ucast ((((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) AND 0x1ff)) \<and> R12 \<sigma> = ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)) \<and> R8 \<sigma> = RDI\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x250),8]::64 word) = RDI\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x260),8]::64 word) = 0x183c8\<close>
declare P_0x183ca_true_26_def[Ps]

definition P_0x183ca_true_26_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x183ca_true_26_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((FS\<^sub>0::64 word) + 0x28), 8),
    (2, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x40), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x250), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x260), 8)
  }\<close>

definition P_0x183ca_true_26_regions :: state_pred where
  \<open>P_0x183ca_true_26_regions \<sigma> \<equiv> \<exists>regions. P_0x183ca_true_26_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x1837d_26 :: state_pred where
  \<open>Q_0x1837d_26 \<sigma> \<equiv> RIP \<sigma> = 0x1837d \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x258) \<and> R12 \<sigma> = ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)) \<and> R8 \<sigma> = RDI\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word)\<close>
declare Q_0x1837d_26_def[Qs]

schematic_goal bdrv_pread_em_0_3_0x183ca_0x184f5_26[blocks]:
  assumes \<open>(P_0x183ca_true_26 && P_0x183ca_true_26_regions && SF) \<sigma>\<close>
  shows \<open>exec_block 3 0x184f5 26 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x1837d_26 ?\<sigma> \<and> block_usage P_0x183ca_true_26_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x183ca_true_26_def P_0x183ca_true_26_regions_def post: Q_0x1837d_26_def regionset: P_0x183ca_true_26_regions_set_def)

definition P_0x183ca_false_27 :: state_pred where
  \<open>P_0x183ca_false_27 \<sigma> \<equiv> RIP \<sigma> = 0x183ca \<and> RAX \<sigma> = bdrv_read_0x183c3_retval \<and> RBX \<sigma> = ((RSP\<^sub>0::64 word) - 0x248) \<and> RCX \<sigma> = 0x1 \<and> RDX \<sigma> = ((RSP\<^sub>0::64 word) - 0x248) \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = ((((((ucast ((RSI\<^sub>0::64 word))::64 word) >>> 9)::64 word) + (sextend (ucast (((ucast (((((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) - (if' ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) \<le>s (((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff) then (\<langle>31,0\<rangle>RCX\<^sub>0::32 word) else ((((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff)::32 word)))::32 word))::32 word) >>> 9))) 32 64::64 word))::64 word) + 0x1) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x258) \<and> RBP \<sigma> = ucast ((((((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) - (if' ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) \<le>s (((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff) then (\<langle>31,0\<rangle>RCX\<^sub>0::32 word) else ((((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff)::32 word)))::32 word) - (((((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) - (if' ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) \<le>s (((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff) then (\<langle>31,0\<rangle>RCX\<^sub>0::32 word) else ((((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff)::32 word)))::32 word) AND 0xfffffe00))) \<and> R15 \<sigma> = ((((((ucast ((RSI\<^sub>0::64 word))::64 word) >>> 9)::64 word) + (sextend (ucast (((ucast (((((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) - (if' ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) \<le>s (((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff) then (\<langle>31,0\<rangle>RCX\<^sub>0::32 word) else ((((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff)::32 word)))::32 word))::32 word) >>> 9))) 32 64::64 word))::64 word) + 0x1) \<and> R13 \<sigma> = ucast ((((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) AND 0x1ff)) \<and> R12 \<sigma> = ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)) \<and> R8 \<sigma> = RDI\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x250),8]::64 word) = RDI\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x260),8]::64 word) = 0x183c8\<close>
declare P_0x183ca_false_27_def[Ps]

definition P_0x183ca_false_27_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x183ca_false_27_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((FS\<^sub>0::64 word) + 0x28), 8),
    (2, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x40), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x250), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x260), 8)
  }\<close>

definition P_0x183ca_false_27_regions :: state_pred where
  \<open>P_0x183ca_false_27_regions \<sigma> \<equiv> \<exists>regions. P_0x183ca_false_27_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x183d9_27 :: state_pred where
  \<open>Q_0x183d9_27 \<sigma> \<equiv> RIP \<sigma> = 0x183d9 \<and> RAX \<sigma> = bdrv_read_0x183c3_retval \<and> RBX \<sigma> = ((RSP\<^sub>0::64 word) - 0x248) \<and> RCX \<sigma> = 0x1 \<and> RDX \<sigma> = (sextend (ucast ((((((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) - (if' ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) \<le>s (((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff) then (\<langle>31,0\<rangle>RCX\<^sub>0::32 word) else ((((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff)::32 word)))::32 word) - (((((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) - (if' ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) \<le>s (((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff) then (\<langle>31,0\<rangle>RCX\<^sub>0::32 word) else ((((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff)::32 word)))::32 word) AND 0xfffffe00)))) 32 64::64 word) \<and> RDI \<sigma> = R14 \<sigma> \<and> RSI \<sigma> = ((RSP\<^sub>0::64 word) - 0x248) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x258) \<and> RBP \<sigma> = ucast ((((((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) - (if' ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) \<le>s (((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff) then (\<langle>31,0\<rangle>RCX\<^sub>0::32 word) else ((((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff)::32 word)))::32 word) - (((((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) - (if' ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) \<le>s (((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff) then (\<langle>31,0\<rangle>RCX\<^sub>0::32 word) else ((((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff)::32 word)))::32 word) AND 0xfffffe00))) \<and> R15 \<sigma> = ((((((ucast ((RSI\<^sub>0::64 word))::64 word) >>> 9)::64 word) + (sextend (ucast (((ucast (((((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) - (if' ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) \<le>s (((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff) then (\<langle>31,0\<rangle>RCX\<^sub>0::32 word) else ((((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff)::32 word)))::32 word))::32 word) >>> 9))) 32 64::64 word))::64 word) + 0x1) \<and> R13 \<sigma> = ucast ((((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) AND 0x1ff)) \<and> R12 \<sigma> = ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)) \<and> R8 \<sigma> = RDI\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x250),8]::64 word) = RDI\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x260),8]::64 word) = 0x183c8\<close>
declare Q_0x183d9_27_def[Qs]

schematic_goal bdrv_pread_em_0_4_0x183ca_0x183d6_27[blocks]:
  assumes \<open>(P_0x183ca_false_27 && P_0x183ca_false_27_regions && ! SF) \<sigma>\<close>
  shows \<open>exec_block 4 0x183d6 27 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x183d9_27 ?\<sigma> \<and> block_usage P_0x183ca_false_27_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x183ca_false_27_def P_0x183ca_false_27_regions_def post: Q_0x183d9_27_def regionset: P_0x183ca_false_27_regions_set_def)

definition P_0x183d9_28 :: state_pred where
  \<open>P_0x183d9_28 \<sigma> \<equiv> RIP \<sigma> = 0x183d9 \<and> RAX \<sigma> = bdrv_read_0x183c3_retval \<and> RBX \<sigma> = ((RSP\<^sub>0::64 word) - 0x248) \<and> RCX \<sigma> = 0x1 \<and> RDX \<sigma> = (sextend (ucast ((((((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) - (if' ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) \<le>s (((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff) then (\<langle>31,0\<rangle>RCX\<^sub>0::32 word) else ((((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff)::32 word)))::32 word) - (((((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) - (if' ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) \<le>s (((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff) then (\<langle>31,0\<rangle>RCX\<^sub>0::32 word) else ((((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff)::32 word)))::32 word) AND 0xfffffe00)))) 32 64::64 word) \<and> RDI \<sigma> = R14 \<sigma> \<and> RSI \<sigma> = ((RSP\<^sub>0::64 word) - 0x248) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x258) \<and> RBP \<sigma> = ucast ((((((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) - (if' ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) \<le>s (((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff) then (\<langle>31,0\<rangle>RCX\<^sub>0::32 word) else ((((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff)::32 word)))::32 word) - (((((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) - (if' ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) \<le>s (((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff) then (\<langle>31,0\<rangle>RCX\<^sub>0::32 word) else ((((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff)::32 word)))::32 word) AND 0xfffffe00))) \<and> R15 \<sigma> = ((((((ucast ((RSI\<^sub>0::64 word))::64 word) >>> 9)::64 word) + (sextend (ucast (((ucast (((((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) - (if' ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) \<le>s (((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff) then (\<langle>31,0\<rangle>RCX\<^sub>0::32 word) else ((((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff)::32 word)))::32 word))::32 word) >>> 9))) 32 64::64 word))::64 word) + 0x1) \<and> R13 \<sigma> = ucast ((((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) AND 0x1ff)) \<and> R12 \<sigma> = ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)) \<and> R8 \<sigma> = RDI\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x250),8]::64 word) = RDI\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x260),8]::64 word) = 0x183c8\<close>
declare P_0x183d9_28_def[Ps]

definition P_0x183d9_28_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x183d9_28_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((FS\<^sub>0::64 word) + 0x28), 8),
    (2, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x40), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x250), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x260), 8)
  }\<close>

definition P_0x183d9_28_regions :: state_pred where
  \<open>P_0x183d9_28_regions \<sigma> \<equiv> \<exists>regions. P_0x183d9_28_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_memcpy_addr_0x183d9_28 :: state_pred where
  \<open>Q_memcpy_addr_0x183d9_28 \<sigma> \<equiv> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x260) \<and> RIP \<sigma> = memcpy_addr \<and> RAX \<sigma> = bdrv_read_0x183c3_retval \<and> RBX \<sigma> = ((RSP\<^sub>0::64 word) - 0x248) \<and> RCX \<sigma> = 0x1 \<and> RDX \<sigma> = (sextend (ucast ((((((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) - (if' ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) \<le>s (((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff) then (\<langle>31,0\<rangle>RCX\<^sub>0::32 word) else ((((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff)::32 word)))::32 word) - (((((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) - (if' ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) \<le>s (((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff) then (\<langle>31,0\<rangle>RCX\<^sub>0::32 word) else ((((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff)::32 word)))::32 word) AND 0xfffffe00)))) 32 64::64 word) \<and> RDI \<sigma> = R14 \<sigma> \<and> RSI \<sigma> = ((RSP\<^sub>0::64 word) - 0x248) \<and> RBP \<sigma> = ucast ((((((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) - (if' ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) \<le>s (((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff) then (\<langle>31,0\<rangle>RCX\<^sub>0::32 word) else ((((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff)::32 word)))::32 word) - (((((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) - (if' ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) \<le>s (((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff) then (\<langle>31,0\<rangle>RCX\<^sub>0::32 word) else ((((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff)::32 word)))::32 word) AND 0xfffffe00))) \<and> R15 \<sigma> = ((((((ucast ((RSI\<^sub>0::64 word))::64 word) >>> 9)::64 word) + (sextend (ucast (((ucast (((((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) - (if' ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) \<le>s (((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff) then (\<langle>31,0\<rangle>RCX\<^sub>0::32 word) else ((((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff)::32 word)))::32 word))::32 word) >>> 9))) 32 64::64 word))::64 word) + 0x1) \<and> R13 \<sigma> = ucast ((((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) AND 0x1ff)) \<and> R12 \<sigma> = ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)) \<and> R8 \<sigma> = RDI\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x250),8]::64 word) = RDI\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x260),8]::64 word) = 0x183de\<close>
declare Q_memcpy_addr_0x183d9_28_def[Qs]

schematic_goal bdrv_pread_em_0_1_0x183d9_0x183d9_28[blocks]:
  assumes \<open>(P_0x183d9_28 && P_0x183d9_28_regions) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x183d9 28 \<sigma> \<triangleq> ?\<sigma> \<and> Q_memcpy_addr_0x183d9_28 ?\<sigma> \<and> block_usage P_0x183d9_28_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x183d9_28_def P_0x183d9_28_regions_def post: Q_memcpy_addr_0x183d9_28_def regionset: P_0x183d9_28_regions_set_def)

definition P_0x183de_29 :: state_pred where
  \<open>P_0x183de_29 \<sigma> \<equiv> RIP \<sigma> = 0x183de \<and> RAX \<sigma> = memcpy_0x183d9_retval \<and> RBX \<sigma> = ((RSP\<^sub>0::64 word) - 0x248) \<and> RCX \<sigma> = 0x1 \<and> RDX \<sigma> = (sextend (ucast ((((((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) - (if' ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) \<le>s (((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff) then (\<langle>31,0\<rangle>RCX\<^sub>0::32 word) else ((((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff)::32 word)))::32 word) - (((((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) - (if' ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) \<le>s (((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff) then (\<langle>31,0\<rangle>RCX\<^sub>0::32 word) else ((((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff)::32 word)))::32 word) AND 0xfffffe00)))) 32 64::64 word) \<and> RDI \<sigma> = R14 \<sigma> \<and> RSI \<sigma> = ((RSP\<^sub>0::64 word) - 0x248) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x258) \<and> RBP \<sigma> = ucast ((((((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) - (if' ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) \<le>s (((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff) then (\<langle>31,0\<rangle>RCX\<^sub>0::32 word) else ((((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff)::32 word)))::32 word) - (((((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) - (if' ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) \<le>s (((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff) then (\<langle>31,0\<rangle>RCX\<^sub>0::32 word) else ((((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff)::32 word)))::32 word) AND 0xfffffe00))) \<and> R15 \<sigma> = ((((((ucast ((RSI\<^sub>0::64 word))::64 word) >>> 9)::64 word) + (sextend (ucast (((ucast (((((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) - (if' ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) \<le>s (((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff) then (\<langle>31,0\<rangle>RCX\<^sub>0::32 word) else ((((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff)::32 word)))::32 word))::32 word) >>> 9))) 32 64::64 word))::64 word) + 0x1) \<and> R13 \<sigma> = ucast ((((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) AND 0x1ff)) \<and> R12 \<sigma> = ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)) \<and> R8 \<sigma> = RDI\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x250),8]::64 word) = RDI\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x260),8]::64 word) = 0x183de\<close>
declare P_0x183de_29_def[Ps]

definition P_0x183de_29_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x183de_29_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((FS\<^sub>0::64 word) + 0x28), 8),
    (2, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x40), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x250), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x260), 8)
  }\<close>

definition P_0x183de_29_regions :: state_pred where
  \<open>P_0x183de_29_regions \<sigma> \<equiv> \<exists>regions. P_0x183de_29_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x1837a_29 :: state_pred where
  \<open>Q_0x1837a_29 \<sigma> \<equiv> RIP \<sigma> = 0x1837a \<and> RAX \<sigma> = memcpy_0x183d9_retval \<and> RBX \<sigma> = ((RSP\<^sub>0::64 word) - 0x248) \<and> RCX \<sigma> = 0x1 \<and> RDX \<sigma> = (sextend (ucast ((((((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) - (if' ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) \<le>s (((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff) then (\<langle>31,0\<rangle>RCX\<^sub>0::32 word) else ((((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff)::32 word)))::32 word) - (((((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) - (if' ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) \<le>s (((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff) then (\<langle>31,0\<rangle>RCX\<^sub>0::32 word) else ((((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff)::32 word)))::32 word) AND 0xfffffe00)))) 32 64::64 word) \<and> RDI \<sigma> = R14 \<sigma> \<and> RSI \<sigma> = ((RSP\<^sub>0::64 word) - 0x248) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x258) \<and> RBP \<sigma> = ucast ((((((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) - (if' ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) \<le>s (((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff) then (\<langle>31,0\<rangle>RCX\<^sub>0::32 word) else ((((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff)::32 word)))::32 word) - (((((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) - (if' ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) \<le>s (((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff) then (\<langle>31,0\<rangle>RCX\<^sub>0::32 word) else ((((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff)::32 word)))::32 word) AND 0xfffffe00))) \<and> R15 \<sigma> = ((((((ucast ((RSI\<^sub>0::64 word))::64 word) >>> 9)::64 word) + (sextend (ucast (((ucast (((((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) - (if' ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) \<le>s (((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff) then (\<langle>31,0\<rangle>RCX\<^sub>0::32 word) else ((((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff)::32 word)))::32 word))::32 word) >>> 9))) 32 64::64 word))::64 word) + 0x1) \<and> R13 \<sigma> = ucast ((((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) AND 0x1ff)) \<and> R12 \<sigma> = ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)) \<and> R8 \<sigma> = RDI\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x250),8]::64 word) = RDI\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x260),8]::64 word) = 0x183de\<close>
declare Q_0x1837a_29_def[Qs]

schematic_goal bdrv_pread_em_0_1_0x183de_0x183de_29[blocks]:
  assumes \<open>(P_0x183de_29 && P_0x183de_29_regions) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x183de 29 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x1837a_29 ?\<sigma> \<and> block_usage P_0x183de_29_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x183de_29_def P_0x183de_29_regions_def post: Q_0x1837a_29_def regionset: P_0x183de_29_regions_set_def)

definition P_0x1837a_30 :: state_pred where
  \<open>P_0x1837a_30 \<sigma> \<equiv> RIP \<sigma> = 0x1837a \<and> RAX \<sigma> = memcpy_0x183d9_retval \<and> RBX \<sigma> = ((RSP\<^sub>0::64 word) - 0x248) \<and> RCX \<sigma> = 0x1 \<and> RDX \<sigma> = (sextend (ucast ((((((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) - (if' ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) \<le>s (((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff) then (\<langle>31,0\<rangle>RCX\<^sub>0::32 word) else ((((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff)::32 word)))::32 word) - (((((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) - (if' ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) \<le>s (((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff) then (\<langle>31,0\<rangle>RCX\<^sub>0::32 word) else ((((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff)::32 word)))::32 word) AND 0xfffffe00)))) 32 64::64 word) \<and> RDI \<sigma> = R14 \<sigma> \<and> RSI \<sigma> = ((RSP\<^sub>0::64 word) - 0x248) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x258) \<and> RBP \<sigma> = ucast ((((((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) - (if' ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) \<le>s (((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff) then (\<langle>31,0\<rangle>RCX\<^sub>0::32 word) else ((((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff)::32 word)))::32 word) - (((((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) - (if' ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) \<le>s (((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff) then (\<langle>31,0\<rangle>RCX\<^sub>0::32 word) else ((((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff)::32 word)))::32 word) AND 0xfffffe00))) \<and> R15 \<sigma> = ((((((ucast ((RSI\<^sub>0::64 word))::64 word) >>> 9)::64 word) + (sextend (ucast (((ucast (((((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) - (if' ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) \<le>s (((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff) then (\<langle>31,0\<rangle>RCX\<^sub>0::32 word) else ((((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff)::32 word)))::32 word))::32 word) >>> 9))) 32 64::64 word))::64 word) + 0x1) \<and> R13 \<sigma> = ucast ((((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) AND 0x1ff)) \<and> R12 \<sigma> = ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)) \<and> R8 \<sigma> = RDI\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x250),8]::64 word) = RDI\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x260),8]::64 word) = 0x183de\<close>
declare P_0x1837a_30_def[Ps]

definition P_0x1837a_30_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x1837a_30_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((FS\<^sub>0::64 word) + 0x28), 8),
    (2, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x40), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x250), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x260), 8)
  }\<close>

definition P_0x1837a_30_regions :: state_pred where
  \<open>P_0x1837a_30_regions \<sigma> \<equiv> \<exists>regions. P_0x1837a_30_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x1837d_30 :: state_pred where
  \<open>Q_0x1837d_30 \<sigma> \<equiv> RIP \<sigma> = 0x1837d \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x258) \<and> R12 \<sigma> = ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)) \<and> R8 \<sigma> = RDI\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word)\<close>
declare Q_0x1837d_30_def[Qs]

schematic_goal bdrv_pread_em_0_1_0x1837a_0x1837a_30[blocks]:
  assumes \<open>(P_0x1837a_30 && P_0x1837a_30_regions) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x1837a 30 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x1837d_30 ?\<sigma> \<and> block_usage P_0x1837a_30_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x1837a_30_def P_0x1837a_30_regions_def post: Q_0x1837d_30_def regionset: P_0x1837a_30_regions_set_def)

definition P_0x18378_false_31 :: state_pred where
  \<open>P_0x18378_false_31 \<sigma> \<equiv> RIP \<sigma> = 0x18378 \<and> RAX \<sigma> = ucast ((((((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) - (if' ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) \<le>s (((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff) then (\<langle>31,0\<rangle>RCX\<^sub>0::32 word) else ((((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff)::32 word)))::32 word) AND 0xfffffe00)) \<and> RBX \<sigma> = (sextend (ucast (((ucast (((((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) - (if' ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) \<le>s (((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff) then (\<langle>31,0\<rangle>RCX\<^sub>0::32 word) else ((((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff)::32 word)))::32 word))::32 word) >>> 9))) 32 64::64 word) \<and> RCX \<sigma> = ucast (((ucast (((((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) - (if' ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) \<le>s (((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff) then (\<langle>31,0\<rangle>RCX\<^sub>0::32 word) else ((((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff)::32 word)))::32 word))::32 word) >>> 9)) \<and> RDX \<sigma> = (sextend (ucast ((((((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) - (if' ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) \<le>s (((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff) then (\<langle>31,0\<rangle>RCX\<^sub>0::32 word) else ((((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff)::32 word)))::32 word) AND 0xfffffe00))) 32 64::64 word) \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = ((((ucast ((RSI\<^sub>0::64 word))::64 word) >>> 9)::64 word) + 0x1) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x258) \<and> RBP \<sigma> = ucast ((((((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) - (if' ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) \<le>s (((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff) then (\<langle>31,0\<rangle>RCX\<^sub>0::32 word) else ((((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff)::32 word)))::32 word) - (((((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) - (if' ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) \<le>s (((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff) then (\<langle>31,0\<rangle>RCX\<^sub>0::32 word) else ((((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff)::32 word)))::32 word) AND 0xfffffe00))) \<and> R15 \<sigma> = ((((((ucast ((RSI\<^sub>0::64 word))::64 word) >>> 9)::64 word) + (sextend (ucast (((ucast (((((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) - (if' ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) \<le>s (((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff) then (\<langle>31,0\<rangle>RCX\<^sub>0::32 word) else ((((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff)::32 word)))::32 word))::32 word) >>> 9))) 32 64::64 word))::64 word) + 0x1) \<and> R13 \<sigma> = ucast ((((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) AND 0x1ff)) \<and> R12 \<sigma> = ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)) \<and> R8 \<sigma> = RDI\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x250),8]::64 word) = RDI\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x260),8]::64 word) = 0x18465\<close>
declare P_0x18378_false_31_def[Ps]

definition P_0x18378_false_31_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x18378_false_31_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((FS\<^sub>0::64 word) + 0x28), 8),
    (2, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x40), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x250), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x260), 8)
  }\<close>

definition P_0x18378_false_31_regions :: state_pred where
  \<open>P_0x18378_false_31_regions \<sigma> \<equiv> \<exists>regions. P_0x18378_false_31_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x1837d_31 :: state_pred where
  \<open>Q_0x1837d_31 \<sigma> \<equiv> RIP \<sigma> = 0x1837d \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x258) \<and> R12 \<sigma> = ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)) \<and> R8 \<sigma> = RDI\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word)\<close>
declare Q_0x1837d_31_def[Qs]

schematic_goal bdrv_pread_em_0_2_0x18378_0x1837a_31[blocks]:
  assumes \<open>(P_0x18378_false_31 && P_0x18378_false_31_regions && ! jg) \<sigma>\<close>
  shows \<open>exec_block 2 0x1837a 31 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x1837d_31 ?\<sigma> \<and> block_usage P_0x18378_false_31_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x18378_false_31_def P_0x18378_false_31_regions_def post: Q_0x1837d_31_def regionset: P_0x18378_false_31_regions_set_def)

definition P_0x18370_false_32 :: state_pred where
  \<open>P_0x18370_false_32 \<sigma> \<equiv> RIP \<sigma> = 0x18370 \<and> RBX \<sigma> = ucast (((ucast (((((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) - (if' ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) \<le>s (((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff) then (\<langle>31,0\<rangle>RCX\<^sub>0::32 word) else ((((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff)::32 word)))::32 word))::32 word) >>> 9)) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x258) \<and> RBP \<sigma> = ucast ((((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) - (if' ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) \<le>s (((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff) then (\<langle>31,0\<rangle>RCX\<^sub>0::32 word) else ((((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff)::32 word)))) \<and> R15 \<sigma> = ((((ucast ((RSI\<^sub>0::64 word))::64 word) >>> 9)::64 word) + 0x1) \<and> R14 \<sigma> = ((RDX\<^sub>0::64 word) + RAX \<sigma>) \<and> R13 \<sigma> = ucast ((((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) AND 0x1ff)) \<and> R12 \<sigma> = ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)) \<and> R8 \<sigma> = RDI\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x250),8]::64 word) = RDI\<^sub>0\<close>
declare P_0x18370_false_32_def[Ps]

definition P_0x18370_false_32_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x18370_false_32_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((FS\<^sub>0::64 word) + 0x28), 8),
    (2, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x40), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x250), 8)
  }\<close>

definition P_0x18370_false_32_regions :: state_pred where
  \<open>P_0x18370_false_32_regions \<sigma> \<equiv> \<exists>regions. P_0x18370_false_32_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x18378_32 :: state_pred where
  \<open>Q_0x18378_32 \<sigma> \<equiv> RIP \<sigma> = 0x18378 \<and> RBX \<sigma> = ucast (((ucast (((((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) - (if' ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) \<le>s (((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff) then (\<langle>31,0\<rangle>RCX\<^sub>0::32 word) else ((((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff)::32 word)))::32 word))::32 word) >>> 9)) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x258) \<and> RBP \<sigma> = ucast ((((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) - (if' ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) \<le>s (((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff) then (\<langle>31,0\<rangle>RCX\<^sub>0::32 word) else ((((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff)::32 word)))) \<and> R15 \<sigma> = ((((ucast ((RSI\<^sub>0::64 word))::64 word) >>> 9)::64 word) + 0x1) \<and> R14 \<sigma> = ((RDX\<^sub>0::64 word) + RAX \<sigma>) \<and> R13 \<sigma> = ucast ((((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) AND 0x1ff)) \<and> R12 \<sigma> = ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)) \<and> R8 \<sigma> = RDI\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x250),8]::64 word) = RDI\<^sub>0\<close>
declare Q_0x18378_32_def[Qs]

schematic_goal bdrv_pread_em_0_2_0x18370_0x18376_32[blocks]:
  assumes \<open>(P_0x18370_false_32 && P_0x18370_false_32_regions && ! jg) \<sigma>\<close>
  shows \<open>exec_block 2 0x18376 32 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x18378_32 ?\<sigma> \<and> block_usage P_0x18370_false_32_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x18370_false_32_def P_0x18370_false_32_regions_def post: Q_0x18378_32_def regionset: P_0x18370_false_32_regions_set_def)

definition P_0x18378_true_33 :: state_pred where
  \<open>P_0x18378_true_33 \<sigma> \<equiv> RIP \<sigma> = 0x18378 \<and> RBX \<sigma> = ucast (((ucast (((((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) - (if' ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) \<le>s (((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff) then (\<langle>31,0\<rangle>RCX\<^sub>0::32 word) else ((((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff)::32 word)))::32 word))::32 word) >>> 9)) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x258) \<and> RBP \<sigma> = ucast ((((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) - (if' ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) \<le>s (((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff) then (\<langle>31,0\<rangle>RCX\<^sub>0::32 word) else ((((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff)::32 word)))) \<and> R15 \<sigma> = ((((ucast ((RSI\<^sub>0::64 word))::64 word) >>> 9)::64 word) + 0x1) \<and> R14 \<sigma> = ((RDX\<^sub>0::64 word) + RAX \<sigma>) \<and> R13 \<sigma> = ucast ((((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) AND 0x1ff)) \<and> R12 \<sigma> = ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)) \<and> R8 \<sigma> = RDI\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x250),8]::64 word) = RDI\<^sub>0\<close>
declare P_0x18378_true_33_def[Ps]

definition P_0x18378_true_33_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x18378_true_33_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((FS\<^sub>0::64 word) + 0x28), 8),
    (2, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x40), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x250), 8)
  }\<close>

definition P_0x18378_true_33_regions :: state_pred where
  \<open>P_0x18378_true_33_regions \<sigma> \<equiv> \<exists>regions. P_0x18378_true_33_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x183c3_33 :: state_pred where
  \<open>Q_0x183c3_33 \<sigma> \<equiv> RIP \<sigma> = 0x183c3 \<and> RBX \<sigma> = ((RSP\<^sub>0::64 word) - 0x248) \<and> RCX \<sigma> = 0x1 \<and> RDX \<sigma> = ((RSP\<^sub>0::64 word) - 0x248) \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = ((((ucast ((RSI\<^sub>0::64 word))::64 word) >>> 9)::64 word) + 0x1) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x258) \<and> RBP \<sigma> = ucast ((((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) - (if' ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) \<le>s (((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff) then (\<langle>31,0\<rangle>RCX\<^sub>0::32 word) else ((((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff)::32 word)))) \<and> R15 \<sigma> = ((((ucast ((RSI\<^sub>0::64 word))::64 word) >>> 9)::64 word) + 0x1) \<and> R14 \<sigma> = ((RDX\<^sub>0::64 word) + RAX \<sigma>) \<and> R13 \<sigma> = ucast ((((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) AND 0x1ff)) \<and> R12 \<sigma> = ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)) \<and> R8 \<sigma> = RDI\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x250),8]::64 word) = RDI\<^sub>0\<close>
declare Q_0x183c3_33_def[Qs]

schematic_goal bdrv_pread_em_0_6_0x18378_0x183c0_33[blocks]:
  assumes \<open>(P_0x18378_true_33 && P_0x18378_true_33_regions && jg) \<sigma>\<close>
  shows \<open>exec_block 6 0x183c0 33 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x183c3_33 ?\<sigma> \<and> block_usage P_0x18378_true_33_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x18378_true_33_def P_0x18378_true_33_regions_def post: Q_0x183c3_33_def regionset: P_0x18378_true_33_regions_set_def)

definition P_0x183c3_34 :: state_pred where
  \<open>P_0x183c3_34 \<sigma> \<equiv> RIP \<sigma> = 0x183c3 \<and> RBX \<sigma> = ((RSP\<^sub>0::64 word) - 0x248) \<and> RCX \<sigma> = 0x1 \<and> RDX \<sigma> = ((RSP\<^sub>0::64 word) - 0x248) \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = ((((ucast ((RSI\<^sub>0::64 word))::64 word) >>> 9)::64 word) + 0x1) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x258) \<and> RBP \<sigma> = ucast ((((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) - (if' ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) \<le>s (((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff) then (\<langle>31,0\<rangle>RCX\<^sub>0::32 word) else ((((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff)::32 word)))) \<and> R15 \<sigma> = ((((ucast ((RSI\<^sub>0::64 word))::64 word) >>> 9)::64 word) + 0x1) \<and> R14 \<sigma> = ((RDX\<^sub>0::64 word) + RAX \<sigma>) \<and> R13 \<sigma> = ucast ((((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) AND 0x1ff)) \<and> R12 \<sigma> = ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)) \<and> R8 \<sigma> = RDI\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x250),8]::64 word) = RDI\<^sub>0\<close>
declare P_0x183c3_34_def[Ps]

definition P_0x183c3_34_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x183c3_34_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((FS\<^sub>0::64 word) + 0x28), 8),
    (2, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x40), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x250), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x260), 8)
  }\<close>

definition P_0x183c3_34_regions :: state_pred where
  \<open>P_0x183c3_34_regions \<sigma> \<equiv> \<exists>regions. P_0x183c3_34_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_bdrv_read_addr_0x183c3_34 :: state_pred where
  \<open>Q_bdrv_read_addr_0x183c3_34 \<sigma> \<equiv> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x260) \<and> RIP \<sigma> = bdrv_read_addr \<and> RBX \<sigma> = ((RSP\<^sub>0::64 word) - 0x248) \<and> RCX \<sigma> = 0x1 \<and> RDX \<sigma> = ((RSP\<^sub>0::64 word) - 0x248) \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = ((((ucast ((RSI\<^sub>0::64 word))::64 word) >>> 9)::64 word) + 0x1) \<and> RBP \<sigma> = ucast ((((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) - (if' ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) \<le>s (((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff) then (\<langle>31,0\<rangle>RCX\<^sub>0::32 word) else ((((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff)::32 word)))) \<and> R15 \<sigma> = ((((ucast ((RSI\<^sub>0::64 word))::64 word) >>> 9)::64 word) + 0x1) \<and> R13 \<sigma> = ucast ((((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) AND 0x1ff)) \<and> R12 \<sigma> = ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)) \<and> R8 \<sigma> = RDI\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x250),8]::64 word) = RDI\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x260),8]::64 word) = 0x183c8\<close>
declare Q_bdrv_read_addr_0x183c3_34_def[Qs]

schematic_goal bdrv_pread_em_0_1_0x183c3_0x183c3_34[blocks]:
  assumes \<open>(P_0x183c3_34 && P_0x183c3_34_regions) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x183c3 34 \<sigma> \<triangleq> ?\<sigma> \<and> Q_bdrv_read_addr_0x183c3_34 ?\<sigma> \<and> block_usage P_0x183c3_34_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x183c3_34_def P_0x183c3_34_regions_def post: Q_bdrv_read_addr_0x183c3_34_def regionset: P_0x183c3_34_regions_set_def)

definition P_0x183c8_35 :: state_pred where
  \<open>P_0x183c8_35 \<sigma> \<equiv> RIP \<sigma> = 0x183c8 \<and> RBX \<sigma> = ((RSP\<^sub>0::64 word) - 0x248) \<and> RCX \<sigma> = 0x1 \<and> RDX \<sigma> = ((RSP\<^sub>0::64 word) - 0x248) \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = ((((ucast ((RSI\<^sub>0::64 word))::64 word) >>> 9)::64 word) + 0x1) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x258) \<and> RBP \<sigma> = ucast ((((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) - (if' ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) \<le>s (((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff) then (\<langle>31,0\<rangle>RCX\<^sub>0::32 word) else ((((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff)::32 word)))) \<and> R15 \<sigma> = ((((ucast ((RSI\<^sub>0::64 word))::64 word) >>> 9)::64 word) + 0x1) \<and> R13 \<sigma> = ucast ((((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) AND 0x1ff)) \<and> R12 \<sigma> = ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)) \<and> R8 \<sigma> = RDI\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x250),8]::64 word) = RDI\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x260),8]::64 word) = 0x183c8\<close>
declare P_0x183c8_35_def[Ps]

definition P_0x183c8_35_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x183c8_35_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((FS\<^sub>0::64 word) + 0x28), 8),
    (2, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x40), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x250), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x260), 8)
  }\<close>

definition P_0x183c8_35_regions :: state_pred where
  \<open>P_0x183c8_35_regions \<sigma> \<equiv> \<exists>regions. P_0x183c8_35_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x183ca_35 :: state_pred where
  \<open>Q_0x183ca_35 \<sigma> \<equiv> RIP \<sigma> = 0x183ca \<and> RBX \<sigma> = ((RSP\<^sub>0::64 word) - 0x248) \<and> RCX \<sigma> = 0x1 \<and> RDX \<sigma> = ((RSP\<^sub>0::64 word) - 0x248) \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = ((((ucast ((RSI\<^sub>0::64 word))::64 word) >>> 9)::64 word) + 0x1) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x258) \<and> RBP \<sigma> = ucast ((((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) - (if' ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) \<le>s (((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff) then (\<langle>31,0\<rangle>RCX\<^sub>0::32 word) else ((((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff)::32 word)))) \<and> R15 \<sigma> = ((((ucast ((RSI\<^sub>0::64 word))::64 word) >>> 9)::64 word) + 0x1) \<and> R13 \<sigma> = ucast ((((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) AND 0x1ff)) \<and> R12 \<sigma> = ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)) \<and> R8 \<sigma> = RDI\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x250),8]::64 word) = RDI\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x260),8]::64 word) = 0x183c8\<close>
declare Q_0x183ca_35_def[Qs]

schematic_goal bdrv_pread_em_0_1_0x183c8_0x183c8_35[blocks]:
  assumes \<open>(P_0x183c8_35 && P_0x183c8_35_regions) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x183c8 35 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x183ca_35 ?\<sigma> \<and> block_usage P_0x183c8_35_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x183c8_35_def P_0x183c8_35_regions_def post: Q_0x183ca_35_def regionset: P_0x183c8_35_regions_set_def)

definition P_0x183ca_true_36 :: state_pred where
  \<open>P_0x183ca_true_36 \<sigma> \<equiv> RIP \<sigma> = 0x183ca \<and> RBX \<sigma> = ((RSP\<^sub>0::64 word) - 0x248) \<and> RCX \<sigma> = 0x1 \<and> RDX \<sigma> = ((RSP\<^sub>0::64 word) - 0x248) \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = ((((ucast ((RSI\<^sub>0::64 word))::64 word) >>> 9)::64 word) + 0x1) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x258) \<and> RBP \<sigma> = ucast ((((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) - (if' ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) \<le>s (((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff) then (\<langle>31,0\<rangle>RCX\<^sub>0::32 word) else ((((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff)::32 word)))) \<and> R15 \<sigma> = ((((ucast ((RSI\<^sub>0::64 word))::64 word) >>> 9)::64 word) + 0x1) \<and> R13 \<sigma> = ucast ((((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) AND 0x1ff)) \<and> R12 \<sigma> = ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)) \<and> R8 \<sigma> = RDI\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x250),8]::64 word) = RDI\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x260),8]::64 word) = 0x183c8\<close>
declare P_0x183ca_true_36_def[Ps]

definition P_0x183ca_true_36_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x183ca_true_36_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((FS\<^sub>0::64 word) + 0x28), 8),
    (2, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x40), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x250), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x260), 8)
  }\<close>

definition P_0x183ca_true_36_regions :: state_pred where
  \<open>P_0x183ca_true_36_regions \<sigma> \<equiv> \<exists>regions. P_0x183ca_true_36_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x1837d_36 :: state_pred where
  \<open>Q_0x1837d_36 \<sigma> \<equiv> RIP \<sigma> = 0x1837d \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x258) \<and> R12 \<sigma> = ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)) \<and> R8 \<sigma> = RDI\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word)\<close>
declare Q_0x1837d_36_def[Qs]

schematic_goal bdrv_pread_em_0_3_0x183ca_0x184f5_36[blocks]:
  assumes \<open>(P_0x183ca_true_36 && P_0x183ca_true_36_regions && SF) \<sigma>\<close>
  shows \<open>exec_block 3 0x184f5 36 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x1837d_36 ?\<sigma> \<and> block_usage P_0x183ca_true_36_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x183ca_true_36_def P_0x183ca_true_36_regions_def post: Q_0x1837d_36_def regionset: P_0x183ca_true_36_regions_set_def)

definition P_0x183ca_false_37 :: state_pred where
  \<open>P_0x183ca_false_37 \<sigma> \<equiv> RIP \<sigma> = 0x183ca \<and> RBX \<sigma> = ((RSP\<^sub>0::64 word) - 0x248) \<and> RCX \<sigma> = 0x1 \<and> RDX \<sigma> = ((RSP\<^sub>0::64 word) - 0x248) \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = ((((ucast ((RSI\<^sub>0::64 word))::64 word) >>> 9)::64 word) + 0x1) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x258) \<and> RBP \<sigma> = ucast ((((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) - (if' ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) \<le>s (((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff) then (\<langle>31,0\<rangle>RCX\<^sub>0::32 word) else ((((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff)::32 word)))) \<and> R15 \<sigma> = ((((ucast ((RSI\<^sub>0::64 word))::64 word) >>> 9)::64 word) + 0x1) \<and> R13 \<sigma> = ucast ((((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) AND 0x1ff)) \<and> R12 \<sigma> = ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)) \<and> R8 \<sigma> = RDI\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x250),8]::64 word) = RDI\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x260),8]::64 word) = 0x183c8\<close>
declare P_0x183ca_false_37_def[Ps]

definition P_0x183ca_false_37_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x183ca_false_37_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((FS\<^sub>0::64 word) + 0x28), 8),
    (2, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x40), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x250), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x260), 8)
  }\<close>

definition P_0x183ca_false_37_regions :: state_pred where
  \<open>P_0x183ca_false_37_regions \<sigma> \<equiv> \<exists>regions. P_0x183ca_false_37_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x183d9_37 :: state_pred where
  \<open>Q_0x183d9_37 \<sigma> \<equiv> RIP \<sigma> = 0x183d9 \<and> RBX \<sigma> = ((RSP\<^sub>0::64 word) - 0x248) \<and> RCX \<sigma> = 0x1 \<and> RDX \<sigma> = (sextend (ucast ((((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) - (if' ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) \<le>s (((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff) then (\<langle>31,0\<rangle>RCX\<^sub>0::32 word) else ((((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff)::32 word))))) 32 64::64 word) \<and> RDI \<sigma> = R14 \<sigma> \<and> RSI \<sigma> = ((RSP\<^sub>0::64 word) - 0x248) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x258) \<and> RBP \<sigma> = ucast ((((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) - (if' ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) \<le>s (((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff) then (\<langle>31,0\<rangle>RCX\<^sub>0::32 word) else ((((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff)::32 word)))) \<and> R15 \<sigma> = ((((ucast ((RSI\<^sub>0::64 word))::64 word) >>> 9)::64 word) + 0x1) \<and> R13 \<sigma> = ucast ((((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) AND 0x1ff)) \<and> R12 \<sigma> = ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)) \<and> R8 \<sigma> = RDI\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x250),8]::64 word) = RDI\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x260),8]::64 word) = 0x183c8\<close>
declare Q_0x183d9_37_def[Qs]

schematic_goal bdrv_pread_em_0_4_0x183ca_0x183d6_37[blocks]:
  assumes \<open>(P_0x183ca_false_37 && P_0x183ca_false_37_regions && ! SF) \<sigma>\<close>
  shows \<open>exec_block 4 0x183d6 37 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x183d9_37 ?\<sigma> \<and> block_usage P_0x183ca_false_37_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x183ca_false_37_def P_0x183ca_false_37_regions_def post: Q_0x183d9_37_def regionset: P_0x183ca_false_37_regions_set_def)

definition P_0x183d9_38 :: state_pred where
  \<open>P_0x183d9_38 \<sigma> \<equiv> RIP \<sigma> = 0x183d9 \<and> RBX \<sigma> = ((RSP\<^sub>0::64 word) - 0x248) \<and> RCX \<sigma> = 0x1 \<and> RDX \<sigma> = (sextend (ucast ((((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) - (if' ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) \<le>s (((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff) then (\<langle>31,0\<rangle>RCX\<^sub>0::32 word) else ((((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff)::32 word))))) 32 64::64 word) \<and> RDI \<sigma> = R14 \<sigma> \<and> RSI \<sigma> = ((RSP\<^sub>0::64 word) - 0x248) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x258) \<and> RBP \<sigma> = ucast ((((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) - (if' ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) \<le>s (((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff) then (\<langle>31,0\<rangle>RCX\<^sub>0::32 word) else ((((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff)::32 word)))) \<and> R15 \<sigma> = ((((ucast ((RSI\<^sub>0::64 word))::64 word) >>> 9)::64 word) + 0x1) \<and> R13 \<sigma> = ucast ((((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) AND 0x1ff)) \<and> R12 \<sigma> = ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)) \<and> R8 \<sigma> = RDI\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x250),8]::64 word) = RDI\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x260),8]::64 word) = 0x183c8\<close>
declare P_0x183d9_38_def[Ps]

definition P_0x183d9_38_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x183d9_38_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((FS\<^sub>0::64 word) + 0x28), 8),
    (2, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x40), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x250), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x260), 8)
  }\<close>

definition P_0x183d9_38_regions :: state_pred where
  \<open>P_0x183d9_38_regions \<sigma> \<equiv> \<exists>regions. P_0x183d9_38_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_memcpy_addr_0x183d9_38 :: state_pred where
  \<open>Q_memcpy_addr_0x183d9_38 \<sigma> \<equiv> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x260) \<and> RIP \<sigma> = memcpy_addr \<and> RBX \<sigma> = ((RSP\<^sub>0::64 word) - 0x248) \<and> RCX \<sigma> = 0x1 \<and> RDX \<sigma> = (sextend (ucast ((((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) - (if' ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) \<le>s (((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff) then (\<langle>31,0\<rangle>RCX\<^sub>0::32 word) else ((((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff)::32 word))))) 32 64::64 word) \<and> RDI \<sigma> = R14 \<sigma> \<and> RSI \<sigma> = ((RSP\<^sub>0::64 word) - 0x248) \<and> RBP \<sigma> = ucast ((((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) - (if' ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) \<le>s (((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff) then (\<langle>31,0\<rangle>RCX\<^sub>0::32 word) else ((((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff)::32 word)))) \<and> R15 \<sigma> = ((((ucast ((RSI\<^sub>0::64 word))::64 word) >>> 9)::64 word) + 0x1) \<and> R13 \<sigma> = ucast ((((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) AND 0x1ff)) \<and> R12 \<sigma> = ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)) \<and> R8 \<sigma> = RDI\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x250),8]::64 word) = RDI\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x260),8]::64 word) = 0x183de\<close>
declare Q_memcpy_addr_0x183d9_38_def[Qs]

schematic_goal bdrv_pread_em_0_1_0x183d9_0x183d9_38[blocks]:
  assumes \<open>(P_0x183d9_38 && P_0x183d9_38_regions) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x183d9 38 \<sigma> \<triangleq> ?\<sigma> \<and> Q_memcpy_addr_0x183d9_38 ?\<sigma> \<and> block_usage P_0x183d9_38_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x183d9_38_def P_0x183d9_38_regions_def post: Q_memcpy_addr_0x183d9_38_def regionset: P_0x183d9_38_regions_set_def)

definition P_0x183de_39 :: state_pred where
  \<open>P_0x183de_39 \<sigma> \<equiv> RIP \<sigma> = 0x183de \<and> RBX \<sigma> = ((RSP\<^sub>0::64 word) - 0x248) \<and> RCX \<sigma> = 0x1 \<and> RDX \<sigma> = (sextend (ucast ((((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) - (if' ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) \<le>s (((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff) then (\<langle>31,0\<rangle>RCX\<^sub>0::32 word) else ((((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff)::32 word))))) 32 64::64 word) \<and> RDI \<sigma> = R14 \<sigma> \<and> RSI \<sigma> = ((RSP\<^sub>0::64 word) - 0x248) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x258) \<and> RBP \<sigma> = ucast ((((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) - (if' ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) \<le>s (((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff) then (\<langle>31,0\<rangle>RCX\<^sub>0::32 word) else ((((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff)::32 word)))) \<and> R15 \<sigma> = ((((ucast ((RSI\<^sub>0::64 word))::64 word) >>> 9)::64 word) + 0x1) \<and> R13 \<sigma> = ucast ((((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) AND 0x1ff)) \<and> R12 \<sigma> = ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)) \<and> R8 \<sigma> = RDI\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x250),8]::64 word) = RDI\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x260),8]::64 word) = 0x183de\<close>
declare P_0x183de_39_def[Ps]

definition P_0x183de_39_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x183de_39_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((FS\<^sub>0::64 word) + 0x28), 8),
    (2, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x40), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x250), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x260), 8)
  }\<close>

definition P_0x183de_39_regions :: state_pred where
  \<open>P_0x183de_39_regions \<sigma> \<equiv> \<exists>regions. P_0x183de_39_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x1837a_39 :: state_pred where
  \<open>Q_0x1837a_39 \<sigma> \<equiv> RIP \<sigma> = 0x1837a \<and> RBX \<sigma> = ((RSP\<^sub>0::64 word) - 0x248) \<and> RCX \<sigma> = 0x1 \<and> RDX \<sigma> = (sextend (ucast ((((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) - (if' ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) \<le>s (((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff) then (\<langle>31,0\<rangle>RCX\<^sub>0::32 word) else ((((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff)::32 word))))) 32 64::64 word) \<and> RDI \<sigma> = R14 \<sigma> \<and> RSI \<sigma> = ((RSP\<^sub>0::64 word) - 0x248) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x258) \<and> RBP \<sigma> = ucast ((((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) - (if' ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) \<le>s (((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff) then (\<langle>31,0\<rangle>RCX\<^sub>0::32 word) else ((((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff)::32 word)))) \<and> R15 \<sigma> = ((((ucast ((RSI\<^sub>0::64 word))::64 word) >>> 9)::64 word) + 0x1) \<and> R13 \<sigma> = ucast ((((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) AND 0x1ff)) \<and> R12 \<sigma> = ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)) \<and> R8 \<sigma> = RDI\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x250),8]::64 word) = RDI\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x260),8]::64 word) = 0x183de\<close>
declare Q_0x1837a_39_def[Qs]

schematic_goal bdrv_pread_em_0_1_0x183de_0x183de_39[blocks]:
  assumes \<open>(P_0x183de_39 && P_0x183de_39_regions) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x183de 39 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x1837a_39 ?\<sigma> \<and> block_usage P_0x183de_39_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x183de_39_def P_0x183de_39_regions_def post: Q_0x1837a_39_def regionset: P_0x183de_39_regions_set_def)

definition P_0x1837a_40 :: state_pred where
  \<open>P_0x1837a_40 \<sigma> \<equiv> RIP \<sigma> = 0x1837a \<and> RBX \<sigma> = ((RSP\<^sub>0::64 word) - 0x248) \<and> RCX \<sigma> = 0x1 \<and> RDX \<sigma> = (sextend (ucast ((((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) - (if' ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) \<le>s (((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff) then (\<langle>31,0\<rangle>RCX\<^sub>0::32 word) else ((((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff)::32 word))))) 32 64::64 word) \<and> RDI \<sigma> = R14 \<sigma> \<and> RSI \<sigma> = ((RSP\<^sub>0::64 word) - 0x248) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x258) \<and> RBP \<sigma> = ucast ((((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) - (if' ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) \<le>s (((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff) then (\<langle>31,0\<rangle>RCX\<^sub>0::32 word) else ((((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff)::32 word)))) \<and> R15 \<sigma> = ((((ucast ((RSI\<^sub>0::64 word))::64 word) >>> 9)::64 word) + 0x1) \<and> R13 \<sigma> = ucast ((((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) AND 0x1ff)) \<and> R12 \<sigma> = ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)) \<and> R8 \<sigma> = RDI\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x250),8]::64 word) = RDI\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x260),8]::64 word) = 0x183de\<close>
declare P_0x1837a_40_def[Ps]

definition P_0x1837a_40_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x1837a_40_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((FS\<^sub>0::64 word) + 0x28), 8),
    (2, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x40), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x250), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x260), 8)
  }\<close>

definition P_0x1837a_40_regions :: state_pred where
  \<open>P_0x1837a_40_regions \<sigma> \<equiv> \<exists>regions. P_0x1837a_40_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x1837d_40 :: state_pred where
  \<open>Q_0x1837d_40 \<sigma> \<equiv> RIP \<sigma> = 0x1837d \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x258) \<and> R12 \<sigma> = ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)) \<and> R8 \<sigma> = RDI\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word)\<close>
declare Q_0x1837d_40_def[Qs]

schematic_goal bdrv_pread_em_0_1_0x1837a_0x1837a_40[blocks]:
  assumes \<open>(P_0x1837a_40 && P_0x1837a_40_regions) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x1837a 40 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x1837d_40 ?\<sigma> \<and> block_usage P_0x1837a_40_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x1837a_40_def P_0x1837a_40_regions_def post: Q_0x1837d_40_def regionset: P_0x1837a_40_regions_set_def)

definition P_0x18378_false_41 :: state_pred where
  \<open>P_0x18378_false_41 \<sigma> \<equiv> RIP \<sigma> = 0x18378 \<and> RBX \<sigma> = ucast (((ucast (((((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) - (if' ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) \<le>s (((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff) then (\<langle>31,0\<rangle>RCX\<^sub>0::32 word) else ((((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff)::32 word)))::32 word))::32 word) >>> 9)) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x258) \<and> RBP \<sigma> = ucast ((((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) - (if' ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) \<le>s (((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff) then (\<langle>31,0\<rangle>RCX\<^sub>0::32 word) else ((((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff)::32 word)))) \<and> R15 \<sigma> = ((((ucast ((RSI\<^sub>0::64 word))::64 word) >>> 9)::64 word) + 0x1) \<and> R14 \<sigma> = ((RDX\<^sub>0::64 word) + RAX \<sigma>) \<and> R13 \<sigma> = ucast ((((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) AND 0x1ff)) \<and> R12 \<sigma> = ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)) \<and> R8 \<sigma> = RDI\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x250),8]::64 word) = RDI\<^sub>0\<close>
declare P_0x18378_false_41_def[Ps]

definition P_0x18378_false_41_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x18378_false_41_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((FS\<^sub>0::64 word) + 0x28), 8),
    (2, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x40), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x250), 8)
  }\<close>

definition P_0x18378_false_41_regions :: state_pred where
  \<open>P_0x18378_false_41_regions \<sigma> \<equiv> \<exists>regions. P_0x18378_false_41_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x1837d_41 :: state_pred where
  \<open>Q_0x1837d_41 \<sigma> \<equiv> RIP \<sigma> = 0x1837d \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x258) \<and> R12 \<sigma> = ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)) \<and> R8 \<sigma> = RDI\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word)\<close>
declare Q_0x1837d_41_def[Qs]

schematic_goal bdrv_pread_em_0_2_0x18378_0x1837a_41[blocks]:
  assumes \<open>(P_0x18378_false_41 && P_0x18378_false_41_regions && ! jg) \<sigma>\<close>
  shows \<open>exec_block 2 0x1837a 41 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x1837d_41 ?\<sigma> \<and> block_usage P_0x18378_false_41_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x18378_false_41_def P_0x18378_false_41_regions_def post: Q_0x1837d_41_def regionset: P_0x18378_false_41_regions_set_def)

definition P_0x184c7_false_42 :: state_pred where
  \<open>P_0x184c7_false_42 \<sigma> \<equiv> RIP \<sigma> = 0x184c7 \<and> RBX \<sigma> = ucast ((if' ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) \<le>s (((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff) then (\<langle>31,0\<rangle>RCX\<^sub>0::32 word) else ((((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff)::32 word))) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x258) \<and> RBP \<sigma> = ucast ((((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) - (if' ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) \<le>s (((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff) then (\<langle>31,0\<rangle>RCX\<^sub>0::32 word) else ((((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff)::32 word)))) \<and> R15 \<sigma> = ((((ucast ((RSI\<^sub>0::64 word))::64 word) >>> 9)::64 word) + 0x1) \<and> R14 \<sigma> = ((RDX\<^sub>0::64 word) + RAX \<sigma>) \<and> R13 \<sigma> = ucast ((((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) AND 0x1ff)) \<and> R12 \<sigma> = ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)) \<and> R8 \<sigma> = RDI\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x250),8]::64 word) = RDI\<^sub>0\<close>
declare P_0x184c7_false_42_def[Ps]

definition P_0x184c7_false_42_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x184c7_false_42_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((FS\<^sub>0::64 word) + 0x28), 8),
    (2, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x40), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x250), 8)
  }\<close>

definition P_0x184c7_false_42_regions :: state_pred where
  \<open>P_0x184c7_false_42_regions \<sigma> \<equiv> \<exists>regions. P_0x184c7_false_42_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x1837a_42 :: state_pred where
  \<open>Q_0x1837a_42 \<sigma> \<equiv> RIP \<sigma> = 0x1837a \<and> RBX \<sigma> = ucast ((if' ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) \<le>s (((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff) then (\<langle>31,0\<rangle>RCX\<^sub>0::32 word) else ((((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff)::32 word))) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x258) \<and> RBP \<sigma> = ucast ((((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) - (if' ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) \<le>s (((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff) then (\<langle>31,0\<rangle>RCX\<^sub>0::32 word) else ((((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff)::32 word)))) \<and> R15 \<sigma> = ((((ucast ((RSI\<^sub>0::64 word))::64 word) >>> 9)::64 word) + 0x1) \<and> R14 \<sigma> = ((RDX\<^sub>0::64 word) + RAX \<sigma>) \<and> R13 \<sigma> = ucast ((((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) AND 0x1ff)) \<and> R12 \<sigma> = ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)) \<and> R8 \<sigma> = RDI\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x250),8]::64 word) = RDI\<^sub>0\<close>
declare Q_0x1837a_42_def[Qs]

schematic_goal bdrv_pread_em_0_2_0x184c7_0x184cd_42[blocks]:
  assumes \<open>(P_0x184c7_false_42 && P_0x184c7_false_42_regions && ! !ZF) \<sigma>\<close>
  shows \<open>exec_block 2 0x184cd 42 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x1837a_42 ?\<sigma> \<and> block_usage P_0x184c7_false_42_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x184c7_false_42_def P_0x184c7_false_42_regions_def post: Q_0x1837a_42_def regionset: P_0x184c7_false_42_regions_set_def)

definition P_0x1837a_43 :: state_pred where
  \<open>P_0x1837a_43 \<sigma> \<equiv> RIP \<sigma> = 0x1837a \<and> RBX \<sigma> = ucast ((if' ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) \<le>s (((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff) then (\<langle>31,0\<rangle>RCX\<^sub>0::32 word) else ((((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff)::32 word))) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x258) \<and> RBP \<sigma> = ucast ((((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) - (if' ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) \<le>s (((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff) then (\<langle>31,0\<rangle>RCX\<^sub>0::32 word) else ((((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff)::32 word)))) \<and> R15 \<sigma> = ((((ucast ((RSI\<^sub>0::64 word))::64 word) >>> 9)::64 word) + 0x1) \<and> R14 \<sigma> = ((RDX\<^sub>0::64 word) + RAX \<sigma>) \<and> R13 \<sigma> = ucast ((((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)::32 word) AND 0x1ff)) \<and> R12 \<sigma> = ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)) \<and> R8 \<sigma> = RDI\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x250),8]::64 word) = RDI\<^sub>0\<close>
declare P_0x1837a_43_def[Ps]

definition P_0x1837a_43_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x1837a_43_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((FS\<^sub>0::64 word) + 0x28), 8),
    (2, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x40), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x250), 8)
  }\<close>

definition P_0x1837a_43_regions :: state_pred where
  \<open>P_0x1837a_43_regions \<sigma> \<equiv> \<exists>regions. P_0x1837a_43_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x1837d_43 :: state_pred where
  \<open>Q_0x1837d_43 \<sigma> \<equiv> RIP \<sigma> = 0x1837d \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x258) \<and> R12 \<sigma> = ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)) \<and> R8 \<sigma> = RDI\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word)\<close>
declare Q_0x1837d_43_def[Qs]

schematic_goal bdrv_pread_em_0_1_0x1837a_0x1837a_43[blocks]:
  assumes \<open>(P_0x1837a_43 && P_0x1837a_43_regions) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x1837a 43 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x1837d_43 ?\<sigma> \<and> block_usage P_0x1837a_43_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x1837a_43_def P_0x1837a_43_regions_def post: Q_0x1837d_43_def regionset: P_0x1837a_43_regions_set_def)

definition P_0x18367_false_44 :: state_pred where
  \<open>P_0x18367_false_44 \<sigma> \<equiv> RIP \<sigma> = 0x18367 \<and> RAX \<sigma> = 0x0 \<and> RBX \<sigma> = ucast ((if' ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) \<le>s (((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff) then (\<langle>31,0\<rangle>RCX\<^sub>0::32 word) else ((((- (\<langle>31,0\<rangle>RSI\<^sub>0::32 word))::32 word) AND 0x1ff)::32 word))) \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = RDX\<^sub>0 \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x258) \<and> RBP \<sigma> = ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)) \<and> R15 \<sigma> = ((ucast ((RSI\<^sub>0::64 word))::64 word) >>> 9) \<and> R14 \<sigma> = RDX\<^sub>0 \<and> R13 \<sigma> = R13\<^sub>0 \<and> R12 \<sigma> = ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)) \<and> R8 \<sigma> = RDI\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word)\<close>
declare P_0x18367_false_44_def[Ps]

definition P_0x18367_false_44_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x18367_false_44_regions_set \<sigma> \<equiv> {
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

definition P_0x18367_false_44_regions :: state_pred where
  \<open>P_0x18367_false_44_regions \<sigma> \<equiv> \<exists>regions. P_0x18367_false_44_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x18370_44 :: state_pred where
  \<open>Q_0x18370_44 \<sigma> \<equiv> RIP \<sigma> = 0x18370 \<and> RAX \<sigma> = 0x0 \<and> RBX \<sigma> = ucast (((ucast (((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word))::32 word) >>> 9)) \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = RDX\<^sub>0 \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x258) \<and> RBP \<sigma> = ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)) \<and> R15 \<sigma> = ((ucast ((RSI\<^sub>0::64 word))::64 word) >>> 9) \<and> R14 \<sigma> = RDX\<^sub>0 \<and> R13 \<sigma> = R13\<^sub>0 \<and> R12 \<sigma> = ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)) \<and> R8 \<sigma> = RDI\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word)\<close>
declare Q_0x18370_44_def[Qs]

schematic_goal bdrv_pread_em_0_4_0x18367_0x1836e_44[blocks]:
  assumes \<open>(P_0x18367_false_44 && P_0x18367_false_44_regions && ! jg) \<sigma>\<close>
  shows \<open>exec_block 4 0x1836e 44 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x18370_44 ?\<sigma> \<and> block_usage P_0x18367_false_44_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x18367_false_44_def P_0x18367_false_44_regions_def post: Q_0x18370_44_def regionset: P_0x18367_false_44_regions_set_def)

definition P_0x18370_true_45 :: state_pred where
  \<open>P_0x18370_true_45 \<sigma> \<equiv> RIP \<sigma> = 0x18370 \<and> RAX \<sigma> = 0x0 \<and> RBX \<sigma> = ucast (((ucast (((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word))::32 word) >>> 9)) \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = RDX\<^sub>0 \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x258) \<and> RBP \<sigma> = ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)) \<and> R15 \<sigma> = ((ucast ((RSI\<^sub>0::64 word))::64 word) >>> 9) \<and> R14 \<sigma> = RDX\<^sub>0 \<and> R13 \<sigma> = R13\<^sub>0 \<and> R12 \<sigma> = ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)) \<and> R8 \<sigma> = RDI\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word)\<close>
declare P_0x18370_true_45_def[Ps]

definition P_0x18370_true_45_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x18370_true_45_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((FS\<^sub>0::64 word) + 0x28), 8),
    (2, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x40), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x250), 8)
  }\<close>

definition P_0x18370_true_45_regions :: state_pred where
  \<open>P_0x18370_true_45_regions \<sigma> \<equiv> \<exists>regions. P_0x18370_true_45_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x18460_45 :: state_pred where
  \<open>Q_0x18460_45 \<sigma> \<equiv> RIP \<sigma> = 0x18460 \<and> RAX \<sigma> = 0x0 \<and> RBX \<sigma> = ucast (((ucast (((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word))::32 word) >>> 9)) \<and> RCX \<sigma> = ucast (((ucast (((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word))::32 word) >>> 9)) \<and> RDX \<sigma> = RDX\<^sub>0 \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = ((ucast ((RSI\<^sub>0::64 word))::64 word) >>> 9) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x258) \<and> RBP \<sigma> = ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)) \<and> R15 \<sigma> = ((ucast ((RSI\<^sub>0::64 word))::64 word) >>> 9) \<and> R14 \<sigma> = RDX\<^sub>0 \<and> R13 \<sigma> = R13\<^sub>0 \<and> R12 \<sigma> = ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)) \<and> R8 \<sigma> = RDI\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x250),8]::64 word) = RDI\<^sub>0\<close>
declare Q_0x18460_45_def[Qs]

schematic_goal bdrv_pread_em_0_6_0x18370_0x1845b_45[blocks]:
  assumes \<open>(P_0x18370_true_45 && P_0x18370_true_45_regions && jg) \<sigma>\<close>
  shows \<open>exec_block 6 0x1845b 45 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x18460_45 ?\<sigma> \<and> block_usage P_0x18370_true_45_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x18370_true_45_def P_0x18370_true_45_regions_def post: Q_0x18460_45_def regionset: P_0x18370_true_45_regions_set_def)

definition P_0x18460_46 :: state_pred where
  \<open>P_0x18460_46 \<sigma> \<equiv> RIP \<sigma> = 0x18460 \<and> RAX \<sigma> = 0x0 \<and> RBX \<sigma> = ucast (((ucast (((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word))::32 word) >>> 9)) \<and> RCX \<sigma> = ucast (((ucast (((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word))::32 word) >>> 9)) \<and> RDX \<sigma> = RDX\<^sub>0 \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = ((ucast ((RSI\<^sub>0::64 word))::64 word) >>> 9) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x258) \<and> RBP \<sigma> = ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)) \<and> R15 \<sigma> = ((ucast ((RSI\<^sub>0::64 word))::64 word) >>> 9) \<and> R14 \<sigma> = RDX\<^sub>0 \<and> R13 \<sigma> = R13\<^sub>0 \<and> R12 \<sigma> = ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)) \<and> R8 \<sigma> = RDI\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x250),8]::64 word) = RDI\<^sub>0\<close>
declare P_0x18460_46_def[Ps]

definition P_0x18460_46_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x18460_46_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((FS\<^sub>0::64 word) + 0x28), 8),
    (2, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x40), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x250), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x260), 8)
  }\<close>

definition P_0x18460_46_regions :: state_pred where
  \<open>P_0x18460_46_regions \<sigma> \<equiv> \<exists>regions. P_0x18460_46_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_bdrv_read_addr_0x18460_46 :: state_pred where
  \<open>Q_bdrv_read_addr_0x18460_46 \<sigma> \<equiv> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x260) \<and> RIP \<sigma> = bdrv_read_addr \<and> RAX \<sigma> = 0x0 \<and> RBX \<sigma> = ucast (((ucast (((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word))::32 word) >>> 9)) \<and> RCX \<sigma> = ucast (((ucast (((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word))::32 word) >>> 9)) \<and> RDX \<sigma> = RDX\<^sub>0 \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = ((ucast ((RSI\<^sub>0::64 word))::64 word) >>> 9) \<and> RBP \<sigma> = ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)) \<and> R15 \<sigma> = ((ucast ((RSI\<^sub>0::64 word))::64 word) >>> 9) \<and> R14 \<sigma> = RDX\<^sub>0 \<and> R13 \<sigma> = R13\<^sub>0 \<and> R12 \<sigma> = ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)) \<and> R8 \<sigma> = RDI\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x250),8]::64 word) = RDI\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x260),8]::64 word) = 0x18465\<close>
declare Q_bdrv_read_addr_0x18460_46_def[Qs]

schematic_goal bdrv_pread_em_0_1_0x18460_0x18460_46[blocks]:
  assumes \<open>(P_0x18460_46 && P_0x18460_46_regions) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x18460 46 \<sigma> \<triangleq> ?\<sigma> \<and> Q_bdrv_read_addr_0x18460_46 ?\<sigma> \<and> block_usage P_0x18460_46_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x18460_46_def P_0x18460_46_regions_def post: Q_bdrv_read_addr_0x18460_46_def regionset: P_0x18460_46_regions_set_def)

definition P_0x18465_47 :: state_pred where
  \<open>P_0x18465_47 \<sigma> \<equiv> RIP \<sigma> = 0x18465 \<and> RAX \<sigma> = bdrv_read_0x18460_retval \<and> RBX \<sigma> = ucast (((ucast (((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word))::32 word) >>> 9)) \<and> RCX \<sigma> = ucast (((ucast (((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word))::32 word) >>> 9)) \<and> RDX \<sigma> = RDX\<^sub>0 \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = ((ucast ((RSI\<^sub>0::64 word))::64 word) >>> 9) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x258) \<and> RBP \<sigma> = ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)) \<and> R15 \<sigma> = ((ucast ((RSI\<^sub>0::64 word))::64 word) >>> 9) \<and> R14 \<sigma> = RDX\<^sub>0 \<and> R13 \<sigma> = R13\<^sub>0 \<and> R12 \<sigma> = ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)) \<and> R8 \<sigma> = RDI\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x250),8]::64 word) = RDI\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x260),8]::64 word) = 0x18465\<close>
declare P_0x18465_47_def[Ps]

definition P_0x18465_47_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x18465_47_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((FS\<^sub>0::64 word) + 0x28), 8),
    (2, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x40), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x250), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x260), 8)
  }\<close>

definition P_0x18465_47_regions :: state_pred where
  \<open>P_0x18465_47_regions \<sigma> \<equiv> \<exists>regions. P_0x18465_47_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x18467_47 :: state_pred where
  \<open>Q_0x18467_47 \<sigma> \<equiv> RIP \<sigma> = 0x18467 \<and> RAX \<sigma> = bdrv_read_0x18460_retval \<and> RBX \<sigma> = ucast (((ucast (((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word))::32 word) >>> 9)) \<and> RCX \<sigma> = ucast (((ucast (((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word))::32 word) >>> 9)) \<and> RDX \<sigma> = RDX\<^sub>0 \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = ((ucast ((RSI\<^sub>0::64 word))::64 word) >>> 9) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x258) \<and> RBP \<sigma> = ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)) \<and> R15 \<sigma> = ((ucast ((RSI\<^sub>0::64 word))::64 word) >>> 9) \<and> R14 \<sigma> = RDX\<^sub>0 \<and> R13 \<sigma> = R13\<^sub>0 \<and> R12 \<sigma> = ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)) \<and> R8 \<sigma> = RDI\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x250),8]::64 word) = RDI\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x260),8]::64 word) = 0x18465\<close>
declare Q_0x18467_47_def[Qs]

schematic_goal bdrv_pread_em_0_1_0x18465_0x18465_47[blocks]:
  assumes \<open>(P_0x18465_47 && P_0x18465_47_regions) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x18465 47 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x18467_47 ?\<sigma> \<and> block_usage P_0x18465_47_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x18465_47_def P_0x18465_47_regions_def post: Q_0x18467_47_def regionset: P_0x18465_47_regions_set_def)

definition P_0x18467_true_48 :: state_pred where
  \<open>P_0x18467_true_48 \<sigma> \<equiv> RIP \<sigma> = 0x18467 \<and> RAX \<sigma> = bdrv_read_0x18460_retval \<and> RBX \<sigma> = ucast (((ucast (((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word))::32 word) >>> 9)) \<and> RCX \<sigma> = ucast (((ucast (((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word))::32 word) >>> 9)) \<and> RDX \<sigma> = RDX\<^sub>0 \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = ((ucast ((RSI\<^sub>0::64 word))::64 word) >>> 9) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x258) \<and> RBP \<sigma> = ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)) \<and> R15 \<sigma> = ((ucast ((RSI\<^sub>0::64 word))::64 word) >>> 9) \<and> R14 \<sigma> = RDX\<^sub>0 \<and> R13 \<sigma> = R13\<^sub>0 \<and> R12 \<sigma> = ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)) \<and> R8 \<sigma> = RDI\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x250),8]::64 word) = RDI\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x260),8]::64 word) = 0x18465\<close>
declare P_0x18467_true_48_def[Ps]

definition P_0x18467_true_48_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x18467_true_48_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((FS\<^sub>0::64 word) + 0x28), 8),
    (2, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x40), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x250), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x260), 8)
  }\<close>

definition P_0x18467_true_48_regions :: state_pred where
  \<open>P_0x18467_true_48_regions \<sigma> \<equiv> \<exists>regions. P_0x18467_true_48_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x1837d_48 :: state_pred where
  \<open>Q_0x1837d_48 \<sigma> \<equiv> RIP \<sigma> = 0x1837d \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x258) \<and> R12 \<sigma> = ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)) \<and> R8 \<sigma> = RDI\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word)\<close>
declare Q_0x1837d_48_def[Qs]

schematic_goal bdrv_pread_em_0_3_0x18467_0x184f5_48[blocks]:
  assumes \<open>(P_0x18467_true_48 && P_0x18467_true_48_regions && SF) \<sigma>\<close>
  shows \<open>exec_block 3 0x184f5 48 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x1837d_48 ?\<sigma> \<and> block_usage P_0x18467_true_48_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x18467_true_48_def P_0x18467_true_48_regions_def post: Q_0x1837d_48_def regionset: P_0x18467_true_48_regions_set_def)

definition P_0x18467_false_49 :: state_pred where
  \<open>P_0x18467_false_49 \<sigma> \<equiv> RIP \<sigma> = 0x18467 \<and> RAX \<sigma> = bdrv_read_0x18460_retval \<and> RBX \<sigma> = ucast (((ucast (((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word))::32 word) >>> 9)) \<and> RCX \<sigma> = ucast (((ucast (((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word))::32 word) >>> 9)) \<and> RDX \<sigma> = RDX\<^sub>0 \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = ((ucast ((RSI\<^sub>0::64 word))::64 word) >>> 9) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x258) \<and> RBP \<sigma> = ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)) \<and> R15 \<sigma> = ((ucast ((RSI\<^sub>0::64 word))::64 word) >>> 9) \<and> R14 \<sigma> = RDX\<^sub>0 \<and> R13 \<sigma> = R13\<^sub>0 \<and> R12 \<sigma> = ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)) \<and> R8 \<sigma> = RDI\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x250),8]::64 word) = RDI\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x260),8]::64 word) = 0x18465\<close>
declare P_0x18467_false_49_def[Ps]

definition P_0x18467_false_49_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x18467_false_49_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((FS\<^sub>0::64 word) + 0x28), 8),
    (2, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x40), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x250), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x260), 8)
  }\<close>

definition P_0x18467_false_49_regions :: state_pred where
  \<open>P_0x18467_false_49_regions \<sigma> \<equiv> \<exists>regions. P_0x18467_false_49_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x18376_49 :: state_pred where
  \<open>Q_0x18376_49 \<sigma> \<equiv> RIP \<sigma> = 0x18376 \<and> RAX \<sigma> = ucast ((((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) AND 0xfffffe00)) \<and> RBX \<sigma> = (sextend (ucast (((ucast (((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word))::32 word) >>> 9))) 32 64::64 word) \<and> RCX \<sigma> = ucast (((ucast (((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word))::32 word) >>> 9)) \<and> RDX \<sigma> = (sextend (ucast ((((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) AND 0xfffffe00))) 32 64::64 word) \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = ((ucast ((RSI\<^sub>0::64 word))::64 word) >>> 9) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x258) \<and> RBP \<sigma> = ucast ((((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) - (((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) AND 0xfffffe00))) \<and> R15 \<sigma> = ((((ucast ((RSI\<^sub>0::64 word))::64 word) >>> 9)::64 word) + (sextend (ucast (((ucast (((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word))::32 word) >>> 9))) 32 64::64 word)) \<and> R14 \<sigma> = ((RDX\<^sub>0::64 word) + (sextend (ucast ((((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) AND 0xfffffe00))) 32 64::64 word)) \<and> R13 \<sigma> = R13\<^sub>0 \<and> R12 \<sigma> = ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)) \<and> R8 \<sigma> = RDI\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x250),8]::64 word) = RDI\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x260),8]::64 word) = 0x18465\<close>
declare Q_0x18376_49_def[Qs]

schematic_goal bdrv_pread_em_0_10_0x18467_0x18487_49[blocks]:
  assumes \<open>(P_0x18467_false_49 && P_0x18467_false_49_regions && ! SF) \<sigma>\<close>
  shows \<open>exec_block 10 0x18487 49 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x18376_49 ?\<sigma> \<and> block_usage P_0x18467_false_49_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x18467_false_49_def P_0x18467_false_49_regions_def post: Q_0x18376_49_def regionset: P_0x18467_false_49_regions_set_def)

definition P_0x18376_50 :: state_pred where
  \<open>P_0x18376_50 \<sigma> \<equiv> RIP \<sigma> = 0x18376 \<and> RAX \<sigma> = ucast ((((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) AND 0xfffffe00)) \<and> RBX \<sigma> = (sextend (ucast (((ucast (((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word))::32 word) >>> 9))) 32 64::64 word) \<and> RCX \<sigma> = ucast (((ucast (((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word))::32 word) >>> 9)) \<and> RDX \<sigma> = (sextend (ucast ((((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) AND 0xfffffe00))) 32 64::64 word) \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = ((ucast ((RSI\<^sub>0::64 word))::64 word) >>> 9) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x258) \<and> RBP \<sigma> = ucast ((((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) - (((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) AND 0xfffffe00))) \<and> R15 \<sigma> = ((((ucast ((RSI\<^sub>0::64 word))::64 word) >>> 9)::64 word) + (sextend (ucast (((ucast (((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word))::32 word) >>> 9))) 32 64::64 word)) \<and> R14 \<sigma> = ((RDX\<^sub>0::64 word) + (sextend (ucast ((((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) AND 0xfffffe00))) 32 64::64 word)) \<and> R13 \<sigma> = R13\<^sub>0 \<and> R12 \<sigma> = ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)) \<and> R8 \<sigma> = RDI\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x250),8]::64 word) = RDI\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x260),8]::64 word) = 0x18465\<close>
declare P_0x18376_50_def[Ps]

definition P_0x18376_50_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x18376_50_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((FS\<^sub>0::64 word) + 0x28), 8),
    (2, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x40), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x250), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x260), 8)
  }\<close>

definition P_0x18376_50_regions :: state_pred where
  \<open>P_0x18376_50_regions \<sigma> \<equiv> \<exists>regions. P_0x18376_50_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x18378_50 :: state_pred where
  \<open>Q_0x18378_50 \<sigma> \<equiv> RIP \<sigma> = 0x18378 \<and> RAX \<sigma> = ucast ((((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) AND 0xfffffe00)) \<and> RBX \<sigma> = (sextend (ucast (((ucast (((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word))::32 word) >>> 9))) 32 64::64 word) \<and> RCX \<sigma> = ucast (((ucast (((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word))::32 word) >>> 9)) \<and> RDX \<sigma> = (sextend (ucast ((((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) AND 0xfffffe00))) 32 64::64 word) \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = ((ucast ((RSI\<^sub>0::64 word))::64 word) >>> 9) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x258) \<and> RBP \<sigma> = ucast ((((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) - (((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) AND 0xfffffe00))) \<and> R15 \<sigma> = ((((ucast ((RSI\<^sub>0::64 word))::64 word) >>> 9)::64 word) + (sextend (ucast (((ucast (((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word))::32 word) >>> 9))) 32 64::64 word)) \<and> R14 \<sigma> = ((RDX\<^sub>0::64 word) + (sextend (ucast ((((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) AND 0xfffffe00))) 32 64::64 word)) \<and> R13 \<sigma> = R13\<^sub>0 \<and> R12 \<sigma> = ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)) \<and> R8 \<sigma> = RDI\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x250),8]::64 word) = RDI\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x260),8]::64 word) = 0x18465\<close>
declare Q_0x18378_50_def[Qs]

schematic_goal bdrv_pread_em_0_1_0x18376_0x18376_50[blocks]:
  assumes \<open>(P_0x18376_50 && P_0x18376_50_regions) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x18376 50 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x18378_50 ?\<sigma> \<and> block_usage P_0x18376_50_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x18376_50_def P_0x18376_50_regions_def post: Q_0x18378_50_def regionset: P_0x18376_50_regions_set_def)

definition P_0x18378_true_51 :: state_pred where
  \<open>P_0x18378_true_51 \<sigma> \<equiv> RIP \<sigma> = 0x18378 \<and> RAX \<sigma> = ucast ((((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) AND 0xfffffe00)) \<and> RBX \<sigma> = (sextend (ucast (((ucast (((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word))::32 word) >>> 9))) 32 64::64 word) \<and> RCX \<sigma> = ucast (((ucast (((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word))::32 word) >>> 9)) \<and> RDX \<sigma> = (sextend (ucast ((((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) AND 0xfffffe00))) 32 64::64 word) \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = ((ucast ((RSI\<^sub>0::64 word))::64 word) >>> 9) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x258) \<and> RBP \<sigma> = ucast ((((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) - (((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) AND 0xfffffe00))) \<and> R15 \<sigma> = ((((ucast ((RSI\<^sub>0::64 word))::64 word) >>> 9)::64 word) + (sextend (ucast (((ucast (((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word))::32 word) >>> 9))) 32 64::64 word)) \<and> R14 \<sigma> = ((RDX\<^sub>0::64 word) + (sextend (ucast ((((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) AND 0xfffffe00))) 32 64::64 word)) \<and> R13 \<sigma> = R13\<^sub>0 \<and> R12 \<sigma> = ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)) \<and> R8 \<sigma> = RDI\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x250),8]::64 word) = RDI\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x260),8]::64 word) = 0x18465\<close>
declare P_0x18378_true_51_def[Ps]

definition P_0x18378_true_51_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x18378_true_51_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((FS\<^sub>0::64 word) + 0x28), 8),
    (2, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x40), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x250), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x260), 8)
  }\<close>

definition P_0x18378_true_51_regions :: state_pred where
  \<open>P_0x18378_true_51_regions \<sigma> \<equiv> \<exists>regions. P_0x18378_true_51_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x183c3_51 :: state_pred where
  \<open>Q_0x183c3_51 \<sigma> \<equiv> RIP \<sigma> = 0x183c3 \<and> RAX \<sigma> = ucast ((((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) AND 0xfffffe00)) \<and> RBX \<sigma> = ((RSP\<^sub>0::64 word) - 0x248) \<and> RCX \<sigma> = 0x1 \<and> RDX \<sigma> = ((RSP\<^sub>0::64 word) - 0x248) \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = ((((ucast ((RSI\<^sub>0::64 word))::64 word) >>> 9)::64 word) + (sextend (ucast (((ucast (((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word))::32 word) >>> 9))) 32 64::64 word)) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x258) \<and> RBP \<sigma> = ucast ((((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) - (((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) AND 0xfffffe00))) \<and> R15 \<sigma> = ((((ucast ((RSI\<^sub>0::64 word))::64 word) >>> 9)::64 word) + (sextend (ucast (((ucast (((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word))::32 word) >>> 9))) 32 64::64 word)) \<and> R14 \<sigma> = ((RDX\<^sub>0::64 word) + (sextend (ucast ((((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) AND 0xfffffe00))) 32 64::64 word)) \<and> R13 \<sigma> = R13\<^sub>0 \<and> R12 \<sigma> = ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)) \<and> R8 \<sigma> = RDI\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x250),8]::64 word) = RDI\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x260),8]::64 word) = 0x18465\<close>
declare Q_0x183c3_51_def[Qs]

schematic_goal bdrv_pread_em_0_6_0x18378_0x183c0_51[blocks]:
  assumes \<open>(P_0x18378_true_51 && P_0x18378_true_51_regions && jg) \<sigma>\<close>
  shows \<open>exec_block 6 0x183c0 51 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x183c3_51 ?\<sigma> \<and> block_usage P_0x18378_true_51_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x18378_true_51_def P_0x18378_true_51_regions_def post: Q_0x183c3_51_def regionset: P_0x18378_true_51_regions_set_def)

definition P_0x183c3_52 :: state_pred where
  \<open>P_0x183c3_52 \<sigma> \<equiv> RIP \<sigma> = 0x183c3 \<and> RAX \<sigma> = ucast ((((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) AND 0xfffffe00)) \<and> RBX \<sigma> = ((RSP\<^sub>0::64 word) - 0x248) \<and> RCX \<sigma> = 0x1 \<and> RDX \<sigma> = ((RSP\<^sub>0::64 word) - 0x248) \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = ((((ucast ((RSI\<^sub>0::64 word))::64 word) >>> 9)::64 word) + (sextend (ucast (((ucast (((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word))::32 word) >>> 9))) 32 64::64 word)) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x258) \<and> RBP \<sigma> = ucast ((((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) - (((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) AND 0xfffffe00))) \<and> R15 \<sigma> = ((((ucast ((RSI\<^sub>0::64 word))::64 word) >>> 9)::64 word) + (sextend (ucast (((ucast (((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word))::32 word) >>> 9))) 32 64::64 word)) \<and> R14 \<sigma> = ((RDX\<^sub>0::64 word) + (sextend (ucast ((((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) AND 0xfffffe00))) 32 64::64 word)) \<and> R13 \<sigma> = R13\<^sub>0 \<and> R12 \<sigma> = ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)) \<and> R8 \<sigma> = RDI\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x250),8]::64 word) = RDI\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x260),8]::64 word) = 0x18465\<close>
declare P_0x183c3_52_def[Ps]

definition P_0x183c3_52_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x183c3_52_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((FS\<^sub>0::64 word) + 0x28), 8),
    (2, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x40), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x250), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x260), 8)
  }\<close>

definition P_0x183c3_52_regions :: state_pred where
  \<open>P_0x183c3_52_regions \<sigma> \<equiv> \<exists>regions. P_0x183c3_52_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_bdrv_read_addr_0x183c3_52 :: state_pred where
  \<open>Q_bdrv_read_addr_0x183c3_52 \<sigma> \<equiv> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x260) \<and> RIP \<sigma> = bdrv_read_addr \<and> RAX \<sigma> = ucast ((((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) AND 0xfffffe00)) \<and> RBX \<sigma> = ((RSP\<^sub>0::64 word) - 0x248) \<and> RCX \<sigma> = 0x1 \<and> RDX \<sigma> = ((RSP\<^sub>0::64 word) - 0x248) \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = ((((ucast ((RSI\<^sub>0::64 word))::64 word) >>> 9)::64 word) + (sextend (ucast (((ucast (((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word))::32 word) >>> 9))) 32 64::64 word)) \<and> RBP \<sigma> = ucast ((((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) - (((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) AND 0xfffffe00))) \<and> R15 \<sigma> = ((((ucast ((RSI\<^sub>0::64 word))::64 word) >>> 9)::64 word) + (sextend (ucast (((ucast (((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word))::32 word) >>> 9))) 32 64::64 word)) \<and> R14 \<sigma> = ((RDX\<^sub>0::64 word) + (sextend (ucast ((((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) AND 0xfffffe00))) 32 64::64 word)) \<and> R13 \<sigma> = R13\<^sub>0 \<and> R12 \<sigma> = ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)) \<and> R8 \<sigma> = RDI\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x250),8]::64 word) = RDI\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x260),8]::64 word) = 0x183c8\<close>
declare Q_bdrv_read_addr_0x183c3_52_def[Qs]

schematic_goal bdrv_pread_em_0_1_0x183c3_0x183c3_52[blocks]:
  assumes \<open>(P_0x183c3_52 && P_0x183c3_52_regions) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x183c3 52 \<sigma> \<triangleq> ?\<sigma> \<and> Q_bdrv_read_addr_0x183c3_52 ?\<sigma> \<and> block_usage P_0x183c3_52_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x183c3_52_def P_0x183c3_52_regions_def post: Q_bdrv_read_addr_0x183c3_52_def regionset: P_0x183c3_52_regions_set_def)

definition P_0x183c8_53 :: state_pred where
  \<open>P_0x183c8_53 \<sigma> \<equiv> RIP \<sigma> = 0x183c8 \<and> RAX \<sigma> = bdrv_read_0x183c3_retval \<and> RBX \<sigma> = ((RSP\<^sub>0::64 word) - 0x248) \<and> RCX \<sigma> = 0x1 \<and> RDX \<sigma> = ((RSP\<^sub>0::64 word) - 0x248) \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = ((((ucast ((RSI\<^sub>0::64 word))::64 word) >>> 9)::64 word) + (sextend (ucast (((ucast (((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word))::32 word) >>> 9))) 32 64::64 word)) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x258) \<and> RBP \<sigma> = ucast ((((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) - (((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) AND 0xfffffe00))) \<and> R15 \<sigma> = ((((ucast ((RSI\<^sub>0::64 word))::64 word) >>> 9)::64 word) + (sextend (ucast (((ucast (((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word))::32 word) >>> 9))) 32 64::64 word)) \<and> R14 \<sigma> = ((RDX\<^sub>0::64 word) + (sextend (ucast ((((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) AND 0xfffffe00))) 32 64::64 word)) \<and> R13 \<sigma> = R13\<^sub>0 \<and> R12 \<sigma> = ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)) \<and> R8 \<sigma> = RDI\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x250),8]::64 word) = RDI\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x260),8]::64 word) = 0x183c8\<close>
declare P_0x183c8_53_def[Ps]

definition P_0x183c8_53_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x183c8_53_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((FS\<^sub>0::64 word) + 0x28), 8),
    (2, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x40), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x250), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x260), 8)
  }\<close>

definition P_0x183c8_53_regions :: state_pred where
  \<open>P_0x183c8_53_regions \<sigma> \<equiv> \<exists>regions. P_0x183c8_53_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x183ca_53 :: state_pred where
  \<open>Q_0x183ca_53 \<sigma> \<equiv> RIP \<sigma> = 0x183ca \<and> RAX \<sigma> = bdrv_read_0x183c3_retval \<and> RBX \<sigma> = ((RSP\<^sub>0::64 word) - 0x248) \<and> RCX \<sigma> = 0x1 \<and> RDX \<sigma> = ((RSP\<^sub>0::64 word) - 0x248) \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = ((((ucast ((RSI\<^sub>0::64 word))::64 word) >>> 9)::64 word) + (sextend (ucast (((ucast (((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word))::32 word) >>> 9))) 32 64::64 word)) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x258) \<and> RBP \<sigma> = ucast ((((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) - (((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) AND 0xfffffe00))) \<and> R15 \<sigma> = ((((ucast ((RSI\<^sub>0::64 word))::64 word) >>> 9)::64 word) + (sextend (ucast (((ucast (((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word))::32 word) >>> 9))) 32 64::64 word)) \<and> R14 \<sigma> = ((RDX\<^sub>0::64 word) + (sextend (ucast ((((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) AND 0xfffffe00))) 32 64::64 word)) \<and> R13 \<sigma> = R13\<^sub>0 \<and> R12 \<sigma> = ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)) \<and> R8 \<sigma> = RDI\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x250),8]::64 word) = RDI\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x260),8]::64 word) = 0x183c8\<close>
declare Q_0x183ca_53_def[Qs]

schematic_goal bdrv_pread_em_0_1_0x183c8_0x183c8_53[blocks]:
  assumes \<open>(P_0x183c8_53 && P_0x183c8_53_regions) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x183c8 53 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x183ca_53 ?\<sigma> \<and> block_usage P_0x183c8_53_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x183c8_53_def P_0x183c8_53_regions_def post: Q_0x183ca_53_def regionset: P_0x183c8_53_regions_set_def)

definition P_0x183ca_true_54 :: state_pred where
  \<open>P_0x183ca_true_54 \<sigma> \<equiv> RIP \<sigma> = 0x183ca \<and> RAX \<sigma> = bdrv_read_0x183c3_retval \<and> RBX \<sigma> = ((RSP\<^sub>0::64 word) - 0x248) \<and> RCX \<sigma> = 0x1 \<and> RDX \<sigma> = ((RSP\<^sub>0::64 word) - 0x248) \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = ((((ucast ((RSI\<^sub>0::64 word))::64 word) >>> 9)::64 word) + (sextend (ucast (((ucast (((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word))::32 word) >>> 9))) 32 64::64 word)) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x258) \<and> RBP \<sigma> = ucast ((((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) - (((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) AND 0xfffffe00))) \<and> R15 \<sigma> = ((((ucast ((RSI\<^sub>0::64 word))::64 word) >>> 9)::64 word) + (sextend (ucast (((ucast (((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word))::32 word) >>> 9))) 32 64::64 word)) \<and> R14 \<sigma> = ((RDX\<^sub>0::64 word) + (sextend (ucast ((((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) AND 0xfffffe00))) 32 64::64 word)) \<and> R13 \<sigma> = R13\<^sub>0 \<and> R12 \<sigma> = ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)) \<and> R8 \<sigma> = RDI\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x250),8]::64 word) = RDI\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x260),8]::64 word) = 0x183c8\<close>
declare P_0x183ca_true_54_def[Ps]

definition P_0x183ca_true_54_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x183ca_true_54_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((FS\<^sub>0::64 word) + 0x28), 8),
    (2, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x40), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x250), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x260), 8)
  }\<close>

definition P_0x183ca_true_54_regions :: state_pred where
  \<open>P_0x183ca_true_54_regions \<sigma> \<equiv> \<exists>regions. P_0x183ca_true_54_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x1837d_54 :: state_pred where
  \<open>Q_0x1837d_54 \<sigma> \<equiv> RIP \<sigma> = 0x1837d \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x258) \<and> R12 \<sigma> = ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)) \<and> R8 \<sigma> = RDI\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word)\<close>
declare Q_0x1837d_54_def[Qs]

schematic_goal bdrv_pread_em_0_3_0x183ca_0x184f5_54[blocks]:
  assumes \<open>(P_0x183ca_true_54 && P_0x183ca_true_54_regions && SF) \<sigma>\<close>
  shows \<open>exec_block 3 0x184f5 54 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x1837d_54 ?\<sigma> \<and> block_usage P_0x183ca_true_54_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x183ca_true_54_def P_0x183ca_true_54_regions_def post: Q_0x1837d_54_def regionset: P_0x183ca_true_54_regions_set_def)

definition P_0x183ca_false_55 :: state_pred where
  \<open>P_0x183ca_false_55 \<sigma> \<equiv> RIP \<sigma> = 0x183ca \<and> RAX \<sigma> = bdrv_read_0x183c3_retval \<and> RBX \<sigma> = ((RSP\<^sub>0::64 word) - 0x248) \<and> RCX \<sigma> = 0x1 \<and> RDX \<sigma> = ((RSP\<^sub>0::64 word) - 0x248) \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = ((((ucast ((RSI\<^sub>0::64 word))::64 word) >>> 9)::64 word) + (sextend (ucast (((ucast (((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word))::32 word) >>> 9))) 32 64::64 word)) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x258) \<and> RBP \<sigma> = ucast ((((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) - (((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) AND 0xfffffe00))) \<and> R15 \<sigma> = ((((ucast ((RSI\<^sub>0::64 word))::64 word) >>> 9)::64 word) + (sextend (ucast (((ucast (((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word))::32 word) >>> 9))) 32 64::64 word)) \<and> R14 \<sigma> = ((RDX\<^sub>0::64 word) + (sextend (ucast ((((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) AND 0xfffffe00))) 32 64::64 word)) \<and> R13 \<sigma> = R13\<^sub>0 \<and> R12 \<sigma> = ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)) \<and> R8 \<sigma> = RDI\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x250),8]::64 word) = RDI\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x260),8]::64 word) = 0x183c8\<close>
declare P_0x183ca_false_55_def[Ps]

definition P_0x183ca_false_55_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x183ca_false_55_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((FS\<^sub>0::64 word) + 0x28), 8),
    (2, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x40), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x250), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x260), 8)
  }\<close>

definition P_0x183ca_false_55_regions :: state_pred where
  \<open>P_0x183ca_false_55_regions \<sigma> \<equiv> \<exists>regions. P_0x183ca_false_55_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x183d9_55 :: state_pred where
  \<open>Q_0x183d9_55 \<sigma> \<equiv> RIP \<sigma> = 0x183d9 \<and> RAX \<sigma> = bdrv_read_0x183c3_retval \<and> RBX \<sigma> = ((RSP\<^sub>0::64 word) - 0x248) \<and> RCX \<sigma> = 0x1 \<and> RDX \<sigma> = (sextend (ucast ((((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) - (((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) AND 0xfffffe00)))) 32 64::64 word) \<and> RDI \<sigma> = ((RDX\<^sub>0::64 word) + (sextend (ucast ((((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) AND 0xfffffe00))) 32 64::64 word)) \<and> RSI \<sigma> = ((RSP\<^sub>0::64 word) - 0x248) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x258) \<and> RBP \<sigma> = ucast ((((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) - (((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) AND 0xfffffe00))) \<and> R15 \<sigma> = ((((ucast ((RSI\<^sub>0::64 word))::64 word) >>> 9)::64 word) + (sextend (ucast (((ucast (((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word))::32 word) >>> 9))) 32 64::64 word)) \<and> R14 \<sigma> = ((RDX\<^sub>0::64 word) + (sextend (ucast ((((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) AND 0xfffffe00))) 32 64::64 word)) \<and> R13 \<sigma> = R13\<^sub>0 \<and> R12 \<sigma> = ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)) \<and> R8 \<sigma> = RDI\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x250),8]::64 word) = RDI\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x260),8]::64 word) = 0x183c8\<close>
declare Q_0x183d9_55_def[Qs]

schematic_goal bdrv_pread_em_0_4_0x183ca_0x183d6_55[blocks]:
  assumes \<open>(P_0x183ca_false_55 && P_0x183ca_false_55_regions && ! SF) \<sigma>\<close>
  shows \<open>exec_block 4 0x183d6 55 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x183d9_55 ?\<sigma> \<and> block_usage P_0x183ca_false_55_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x183ca_false_55_def P_0x183ca_false_55_regions_def post: Q_0x183d9_55_def regionset: P_0x183ca_false_55_regions_set_def)

definition P_0x183d9_56 :: state_pred where
  \<open>P_0x183d9_56 \<sigma> \<equiv> RIP \<sigma> = 0x183d9 \<and> RAX \<sigma> = bdrv_read_0x183c3_retval \<and> RBX \<sigma> = ((RSP\<^sub>0::64 word) - 0x248) \<and> RCX \<sigma> = 0x1 \<and> RDX \<sigma> = (sextend (ucast ((((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) - (((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) AND 0xfffffe00)))) 32 64::64 word) \<and> RDI \<sigma> = ((RDX\<^sub>0::64 word) + (sextend (ucast ((((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) AND 0xfffffe00))) 32 64::64 word)) \<and> RSI \<sigma> = ((RSP\<^sub>0::64 word) - 0x248) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x258) \<and> RBP \<sigma> = ucast ((((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) - (((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) AND 0xfffffe00))) \<and> R15 \<sigma> = ((((ucast ((RSI\<^sub>0::64 word))::64 word) >>> 9)::64 word) + (sextend (ucast (((ucast (((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word))::32 word) >>> 9))) 32 64::64 word)) \<and> R14 \<sigma> = ((RDX\<^sub>0::64 word) + (sextend (ucast ((((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) AND 0xfffffe00))) 32 64::64 word)) \<and> R13 \<sigma> = R13\<^sub>0 \<and> R12 \<sigma> = ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)) \<and> R8 \<sigma> = RDI\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x250),8]::64 word) = RDI\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x260),8]::64 word) = 0x183c8\<close>
declare P_0x183d9_56_def[Ps]

definition P_0x183d9_56_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x183d9_56_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((FS\<^sub>0::64 word) + 0x28), 8),
    (2, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x40), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x250), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x260), 8)
  }\<close>

definition P_0x183d9_56_regions :: state_pred where
  \<open>P_0x183d9_56_regions \<sigma> \<equiv> \<exists>regions. P_0x183d9_56_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_memcpy_addr_0x183d9_56 :: state_pred where
  \<open>Q_memcpy_addr_0x183d9_56 \<sigma> \<equiv> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x260) \<and> RIP \<sigma> = memcpy_addr \<and> RAX \<sigma> = bdrv_read_0x183c3_retval \<and> RBX \<sigma> = ((RSP\<^sub>0::64 word) - 0x248) \<and> RCX \<sigma> = 0x1 \<and> RDX \<sigma> = (sextend (ucast ((((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) - (((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) AND 0xfffffe00)))) 32 64::64 word) \<and> RDI \<sigma> = ((RDX\<^sub>0::64 word) + (sextend (ucast ((((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) AND 0xfffffe00))) 32 64::64 word)) \<and> RSI \<sigma> = ((RSP\<^sub>0::64 word) - 0x248) \<and> RBP \<sigma> = ucast ((((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) - (((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) AND 0xfffffe00))) \<and> R15 \<sigma> = ((((ucast ((RSI\<^sub>0::64 word))::64 word) >>> 9)::64 word) + (sextend (ucast (((ucast (((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word))::32 word) >>> 9))) 32 64::64 word)) \<and> R14 \<sigma> = ((RDX\<^sub>0::64 word) + (sextend (ucast ((((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) AND 0xfffffe00))) 32 64::64 word)) \<and> R13 \<sigma> = R13\<^sub>0 \<and> R12 \<sigma> = ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)) \<and> R8 \<sigma> = RDI\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x250),8]::64 word) = RDI\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x260),8]::64 word) = 0x183de\<close>
declare Q_memcpy_addr_0x183d9_56_def[Qs]

schematic_goal bdrv_pread_em_0_1_0x183d9_0x183d9_56[blocks]:
  assumes \<open>(P_0x183d9_56 && P_0x183d9_56_regions) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x183d9 56 \<sigma> \<triangleq> ?\<sigma> \<and> Q_memcpy_addr_0x183d9_56 ?\<sigma> \<and> block_usage P_0x183d9_56_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x183d9_56_def P_0x183d9_56_regions_def post: Q_memcpy_addr_0x183d9_56_def regionset: P_0x183d9_56_regions_set_def)

definition P_0x183de_57 :: state_pred where
  \<open>P_0x183de_57 \<sigma> \<equiv> RIP \<sigma> = 0x183de \<and> RAX \<sigma> = memcpy_0x183d9_retval \<and> RBX \<sigma> = ((RSP\<^sub>0::64 word) - 0x248) \<and> RCX \<sigma> = 0x1 \<and> RDX \<sigma> = (sextend (ucast ((((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) - (((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) AND 0xfffffe00)))) 32 64::64 word) \<and> RDI \<sigma> = ((RDX\<^sub>0::64 word) + (sextend (ucast ((((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) AND 0xfffffe00))) 32 64::64 word)) \<and> RSI \<sigma> = ((RSP\<^sub>0::64 word) - 0x248) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x258) \<and> RBP \<sigma> = ucast ((((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) - (((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) AND 0xfffffe00))) \<and> R15 \<sigma> = ((((ucast ((RSI\<^sub>0::64 word))::64 word) >>> 9)::64 word) + (sextend (ucast (((ucast (((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word))::32 word) >>> 9))) 32 64::64 word)) \<and> R14 \<sigma> = ((RDX\<^sub>0::64 word) + (sextend (ucast ((((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) AND 0xfffffe00))) 32 64::64 word)) \<and> R13 \<sigma> = R13\<^sub>0 \<and> R12 \<sigma> = ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)) \<and> R8 \<sigma> = RDI\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x250),8]::64 word) = RDI\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x260),8]::64 word) = 0x183de\<close>
declare P_0x183de_57_def[Ps]

definition P_0x183de_57_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x183de_57_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((FS\<^sub>0::64 word) + 0x28), 8),
    (2, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x40), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x250), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x260), 8)
  }\<close>

definition P_0x183de_57_regions :: state_pred where
  \<open>P_0x183de_57_regions \<sigma> \<equiv> \<exists>regions. P_0x183de_57_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x1837a_57 :: state_pred where
  \<open>Q_0x1837a_57 \<sigma> \<equiv> RIP \<sigma> = 0x1837a \<and> RAX \<sigma> = memcpy_0x183d9_retval \<and> RBX \<sigma> = ((RSP\<^sub>0::64 word) - 0x248) \<and> RCX \<sigma> = 0x1 \<and> RDX \<sigma> = (sextend (ucast ((((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) - (((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) AND 0xfffffe00)))) 32 64::64 word) \<and> RDI \<sigma> = ((RDX\<^sub>0::64 word) + (sextend (ucast ((((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) AND 0xfffffe00))) 32 64::64 word)) \<and> RSI \<sigma> = ((RSP\<^sub>0::64 word) - 0x248) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x258) \<and> RBP \<sigma> = ucast ((((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) - (((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) AND 0xfffffe00))) \<and> R15 \<sigma> = ((((ucast ((RSI\<^sub>0::64 word))::64 word) >>> 9)::64 word) + (sextend (ucast (((ucast (((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word))::32 word) >>> 9))) 32 64::64 word)) \<and> R14 \<sigma> = ((RDX\<^sub>0::64 word) + (sextend (ucast ((((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) AND 0xfffffe00))) 32 64::64 word)) \<and> R13 \<sigma> = R13\<^sub>0 \<and> R12 \<sigma> = ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)) \<and> R8 \<sigma> = RDI\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x250),8]::64 word) = RDI\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x260),8]::64 word) = 0x183de\<close>
declare Q_0x1837a_57_def[Qs]

schematic_goal bdrv_pread_em_0_1_0x183de_0x183de_57[blocks]:
  assumes \<open>(P_0x183de_57 && P_0x183de_57_regions) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x183de 57 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x1837a_57 ?\<sigma> \<and> block_usage P_0x183de_57_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x183de_57_def P_0x183de_57_regions_def post: Q_0x1837a_57_def regionset: P_0x183de_57_regions_set_def)

definition P_0x1837a_58 :: state_pred where
  \<open>P_0x1837a_58 \<sigma> \<equiv> RIP \<sigma> = 0x1837a \<and> RAX \<sigma> = memcpy_0x183d9_retval \<and> RBX \<sigma> = ((RSP\<^sub>0::64 word) - 0x248) \<and> RCX \<sigma> = 0x1 \<and> RDX \<sigma> = (sextend (ucast ((((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) - (((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) AND 0xfffffe00)))) 32 64::64 word) \<and> RDI \<sigma> = ((RDX\<^sub>0::64 word) + (sextend (ucast ((((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) AND 0xfffffe00))) 32 64::64 word)) \<and> RSI \<sigma> = ((RSP\<^sub>0::64 word) - 0x248) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x258) \<and> RBP \<sigma> = ucast ((((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) - (((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) AND 0xfffffe00))) \<and> R15 \<sigma> = ((((ucast ((RSI\<^sub>0::64 word))::64 word) >>> 9)::64 word) + (sextend (ucast (((ucast (((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word))::32 word) >>> 9))) 32 64::64 word)) \<and> R14 \<sigma> = ((RDX\<^sub>0::64 word) + (sextend (ucast ((((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) AND 0xfffffe00))) 32 64::64 word)) \<and> R13 \<sigma> = R13\<^sub>0 \<and> R12 \<sigma> = ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)) \<and> R8 \<sigma> = RDI\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x250),8]::64 word) = RDI\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x260),8]::64 word) = 0x183de\<close>
declare P_0x1837a_58_def[Ps]

definition P_0x1837a_58_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x1837a_58_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((FS\<^sub>0::64 word) + 0x28), 8),
    (2, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x40), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x250), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x260), 8)
  }\<close>

definition P_0x1837a_58_regions :: state_pred where
  \<open>P_0x1837a_58_regions \<sigma> \<equiv> \<exists>regions. P_0x1837a_58_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x1837d_58 :: state_pred where
  \<open>Q_0x1837d_58 \<sigma> \<equiv> RIP \<sigma> = 0x1837d \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x258) \<and> R12 \<sigma> = ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)) \<and> R8 \<sigma> = RDI\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word)\<close>
declare Q_0x1837d_58_def[Qs]

schematic_goal bdrv_pread_em_0_1_0x1837a_0x1837a_58[blocks]:
  assumes \<open>(P_0x1837a_58 && P_0x1837a_58_regions) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x1837a 58 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x1837d_58 ?\<sigma> \<and> block_usage P_0x1837a_58_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x1837a_58_def P_0x1837a_58_regions_def post: Q_0x1837d_58_def regionset: P_0x1837a_58_regions_set_def)

definition P_0x18378_false_59 :: state_pred where
  \<open>P_0x18378_false_59 \<sigma> \<equiv> RIP \<sigma> = 0x18378 \<and> RAX \<sigma> = ucast ((((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) AND 0xfffffe00)) \<and> RBX \<sigma> = (sextend (ucast (((ucast (((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word))::32 word) >>> 9))) 32 64::64 word) \<and> RCX \<sigma> = ucast (((ucast (((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word))::32 word) >>> 9)) \<and> RDX \<sigma> = (sextend (ucast ((((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) AND 0xfffffe00))) 32 64::64 word) \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = ((ucast ((RSI\<^sub>0::64 word))::64 word) >>> 9) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x258) \<and> RBP \<sigma> = ucast ((((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) - (((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) AND 0xfffffe00))) \<and> R15 \<sigma> = ((((ucast ((RSI\<^sub>0::64 word))::64 word) >>> 9)::64 word) + (sextend (ucast (((ucast (((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word))::32 word) >>> 9))) 32 64::64 word)) \<and> R14 \<sigma> = ((RDX\<^sub>0::64 word) + (sextend (ucast ((((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word) AND 0xfffffe00))) 32 64::64 word)) \<and> R13 \<sigma> = R13\<^sub>0 \<and> R12 \<sigma> = ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)) \<and> R8 \<sigma> = RDI\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x250),8]::64 word) = RDI\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x260),8]::64 word) = 0x18465\<close>
declare P_0x18378_false_59_def[Ps]

definition P_0x18378_false_59_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x18378_false_59_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((FS\<^sub>0::64 word) + 0x28), 8),
    (2, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x40), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x250), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x260), 8)
  }\<close>

definition P_0x18378_false_59_regions :: state_pred where
  \<open>P_0x18378_false_59_regions \<sigma> \<equiv> \<exists>regions. P_0x18378_false_59_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x1837d_59 :: state_pred where
  \<open>Q_0x1837d_59 \<sigma> \<equiv> RIP \<sigma> = 0x1837d \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x258) \<and> R12 \<sigma> = ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)) \<and> R8 \<sigma> = RDI\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word)\<close>
declare Q_0x1837d_59_def[Qs]

schematic_goal bdrv_pread_em_0_2_0x18378_0x1837a_59[blocks]:
  assumes \<open>(P_0x18378_false_59 && P_0x18378_false_59_regions && ! jg) \<sigma>\<close>
  shows \<open>exec_block 2 0x1837a 59 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x1837d_59 ?\<sigma> \<and> block_usage P_0x18378_false_59_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x18378_false_59_def P_0x18378_false_59_regions_def post: Q_0x1837d_59_def regionset: P_0x18378_false_59_regions_set_def)

definition P_0x18370_false_60 :: state_pred where
  \<open>P_0x18370_false_60 \<sigma> \<equiv> RIP \<sigma> = 0x18370 \<and> RAX \<sigma> = 0x0 \<and> RBX \<sigma> = ucast (((ucast (((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word))::32 word) >>> 9)) \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = RDX\<^sub>0 \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x258) \<and> RBP \<sigma> = ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)) \<and> R15 \<sigma> = ((ucast ((RSI\<^sub>0::64 word))::64 word) >>> 9) \<and> R14 \<sigma> = RDX\<^sub>0 \<and> R13 \<sigma> = R13\<^sub>0 \<and> R12 \<sigma> = ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)) \<and> R8 \<sigma> = RDI\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word)\<close>
declare P_0x18370_false_60_def[Ps]

definition P_0x18370_false_60_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x18370_false_60_regions_set \<sigma> \<equiv> {
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

definition P_0x18370_false_60_regions :: state_pred where
  \<open>P_0x18370_false_60_regions \<sigma> \<equiv> \<exists>regions. P_0x18370_false_60_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x18378_60 :: state_pred where
  \<open>Q_0x18378_60 \<sigma> \<equiv> RIP \<sigma> = 0x18378 \<and> RAX \<sigma> = 0x0 \<and> RBX \<sigma> = ucast (((ucast (((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word))::32 word) >>> 9)) \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = RDX\<^sub>0 \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x258) \<and> RBP \<sigma> = ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)) \<and> R15 \<sigma> = ((ucast ((RSI\<^sub>0::64 word))::64 word) >>> 9) \<and> R14 \<sigma> = RDX\<^sub>0 \<and> R13 \<sigma> = R13\<^sub>0 \<and> R12 \<sigma> = ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)) \<and> R8 \<sigma> = RDI\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word)\<close>
declare Q_0x18378_60_def[Qs]

schematic_goal bdrv_pread_em_0_2_0x18370_0x18376_60[blocks]:
  assumes \<open>(P_0x18370_false_60 && P_0x18370_false_60_regions && ! jg) \<sigma>\<close>
  shows \<open>exec_block 2 0x18376 60 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x18378_60 ?\<sigma> \<and> block_usage P_0x18370_false_60_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x18370_false_60_def P_0x18370_false_60_regions_def post: Q_0x18378_60_def regionset: P_0x18370_false_60_regions_set_def)

definition P_0x18378_true_61 :: state_pred where
  \<open>P_0x18378_true_61 \<sigma> \<equiv> RIP \<sigma> = 0x18378 \<and> RAX \<sigma> = 0x0 \<and> RBX \<sigma> = ucast (((ucast (((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word))::32 word) >>> 9)) \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = RDX\<^sub>0 \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x258) \<and> RBP \<sigma> = ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)) \<and> R15 \<sigma> = ((ucast ((RSI\<^sub>0::64 word))::64 word) >>> 9) \<and> R14 \<sigma> = RDX\<^sub>0 \<and> R13 \<sigma> = R13\<^sub>0 \<and> R12 \<sigma> = ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)) \<and> R8 \<sigma> = RDI\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word)\<close>
declare P_0x18378_true_61_def[Ps]

definition P_0x18378_true_61_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x18378_true_61_regions_set \<sigma> \<equiv> {
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

definition P_0x18378_true_61_regions :: state_pred where
  \<open>P_0x18378_true_61_regions \<sigma> \<equiv> \<exists>regions. P_0x18378_true_61_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x183c3_61 :: state_pred where
  \<open>Q_0x183c3_61 \<sigma> \<equiv> RIP \<sigma> = 0x183c3 \<and> RAX \<sigma> = 0x0 \<and> RBX \<sigma> = ((RSP\<^sub>0::64 word) - 0x248) \<and> RCX \<sigma> = 0x1 \<and> RDX \<sigma> = ((RSP\<^sub>0::64 word) - 0x248) \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = ((ucast ((RSI\<^sub>0::64 word))::64 word) >>> 9) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x258) \<and> RBP \<sigma> = ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)) \<and> R15 \<sigma> = ((ucast ((RSI\<^sub>0::64 word))::64 word) >>> 9) \<and> R14 \<sigma> = RDX\<^sub>0 \<and> R13 \<sigma> = R13\<^sub>0 \<and> R12 \<sigma> = ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)) \<and> R8 \<sigma> = RDI\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word)\<close>
declare Q_0x183c3_61_def[Qs]

schematic_goal bdrv_pread_em_0_6_0x18378_0x183c0_61[blocks]:
  assumes \<open>(P_0x18378_true_61 && P_0x18378_true_61_regions && jg) \<sigma>\<close>
  shows \<open>exec_block 6 0x183c0 61 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x183c3_61 ?\<sigma> \<and> block_usage P_0x18378_true_61_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x18378_true_61_def P_0x18378_true_61_regions_def post: Q_0x183c3_61_def regionset: P_0x18378_true_61_regions_set_def)

definition P_0x183c3_62 :: state_pred where
  \<open>P_0x183c3_62 \<sigma> \<equiv> RIP \<sigma> = 0x183c3 \<and> RAX \<sigma> = 0x0 \<and> RBX \<sigma> = ((RSP\<^sub>0::64 word) - 0x248) \<and> RCX \<sigma> = 0x1 \<and> RDX \<sigma> = ((RSP\<^sub>0::64 word) - 0x248) \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = ((ucast ((RSI\<^sub>0::64 word))::64 word) >>> 9) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x258) \<and> RBP \<sigma> = ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)) \<and> R15 \<sigma> = ((ucast ((RSI\<^sub>0::64 word))::64 word) >>> 9) \<and> R14 \<sigma> = RDX\<^sub>0 \<and> R13 \<sigma> = R13\<^sub>0 \<and> R12 \<sigma> = ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)) \<and> R8 \<sigma> = RDI\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word)\<close>
declare P_0x183c3_62_def[Ps]

definition P_0x183c3_62_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x183c3_62_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((FS\<^sub>0::64 word) + 0x28), 8),
    (2, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x40), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x260), 8)
  }\<close>

definition P_0x183c3_62_regions :: state_pred where
  \<open>P_0x183c3_62_regions \<sigma> \<equiv> \<exists>regions. P_0x183c3_62_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_bdrv_read_addr_0x183c3_62 :: state_pred where
  \<open>Q_bdrv_read_addr_0x183c3_62 \<sigma> \<equiv> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x260) \<and> RIP \<sigma> = bdrv_read_addr \<and> RAX \<sigma> = 0x0 \<and> RBX \<sigma> = ((RSP\<^sub>0::64 word) - 0x248) \<and> RCX \<sigma> = 0x1 \<and> RDX \<sigma> = ((RSP\<^sub>0::64 word) - 0x248) \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = ((ucast ((RSI\<^sub>0::64 word))::64 word) >>> 9) \<and> RBP \<sigma> = ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)) \<and> R15 \<sigma> = ((ucast ((RSI\<^sub>0::64 word))::64 word) >>> 9) \<and> R14 \<sigma> = RDX\<^sub>0 \<and> R13 \<sigma> = R13\<^sub>0 \<and> R12 \<sigma> = ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)) \<and> R8 \<sigma> = RDI\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x260),8]::64 word) = 0x183c8\<close>
declare Q_bdrv_read_addr_0x183c3_62_def[Qs]

schematic_goal bdrv_pread_em_0_1_0x183c3_0x183c3_62[blocks]:
  assumes \<open>(P_0x183c3_62 && P_0x183c3_62_regions) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x183c3 62 \<sigma> \<triangleq> ?\<sigma> \<and> Q_bdrv_read_addr_0x183c3_62 ?\<sigma> \<and> block_usage P_0x183c3_62_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x183c3_62_def P_0x183c3_62_regions_def post: Q_bdrv_read_addr_0x183c3_62_def regionset: P_0x183c3_62_regions_set_def)

definition P_0x183c8_63 :: state_pred where
  \<open>P_0x183c8_63 \<sigma> \<equiv> RIP \<sigma> = 0x183c8 \<and> RAX \<sigma> = bdrv_read_0x183c3_retval \<and> RBX \<sigma> = ((RSP\<^sub>0::64 word) - 0x248) \<and> RCX \<sigma> = 0x1 \<and> RDX \<sigma> = ((RSP\<^sub>0::64 word) - 0x248) \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = ((ucast ((RSI\<^sub>0::64 word))::64 word) >>> 9) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x258) \<and> RBP \<sigma> = ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)) \<and> R15 \<sigma> = ((ucast ((RSI\<^sub>0::64 word))::64 word) >>> 9) \<and> R14 \<sigma> = RDX\<^sub>0 \<and> R13 \<sigma> = R13\<^sub>0 \<and> R12 \<sigma> = ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)) \<and> R8 \<sigma> = RDI\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x260),8]::64 word) = 0x183c8\<close>
declare P_0x183c8_63_def[Ps]

definition P_0x183c8_63_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x183c8_63_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((FS\<^sub>0::64 word) + 0x28), 8),
    (2, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x40), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x260), 8)
  }\<close>

definition P_0x183c8_63_regions :: state_pred where
  \<open>P_0x183c8_63_regions \<sigma> \<equiv> \<exists>regions. P_0x183c8_63_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x183ca_63 :: state_pred where
  \<open>Q_0x183ca_63 \<sigma> \<equiv> RIP \<sigma> = 0x183ca \<and> RAX \<sigma> = bdrv_read_0x183c3_retval \<and> RBX \<sigma> = ((RSP\<^sub>0::64 word) - 0x248) \<and> RCX \<sigma> = 0x1 \<and> RDX \<sigma> = ((RSP\<^sub>0::64 word) - 0x248) \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = ((ucast ((RSI\<^sub>0::64 word))::64 word) >>> 9) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x258) \<and> RBP \<sigma> = ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)) \<and> R15 \<sigma> = ((ucast ((RSI\<^sub>0::64 word))::64 word) >>> 9) \<and> R14 \<sigma> = RDX\<^sub>0 \<and> R13 \<sigma> = R13\<^sub>0 \<and> R12 \<sigma> = ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)) \<and> R8 \<sigma> = RDI\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x260),8]::64 word) = 0x183c8\<close>
declare Q_0x183ca_63_def[Qs]

schematic_goal bdrv_pread_em_0_1_0x183c8_0x183c8_63[blocks]:
  assumes \<open>(P_0x183c8_63 && P_0x183c8_63_regions) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x183c8 63 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x183ca_63 ?\<sigma> \<and> block_usage P_0x183c8_63_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x183c8_63_def P_0x183c8_63_regions_def post: Q_0x183ca_63_def regionset: P_0x183c8_63_regions_set_def)

definition P_0x183ca_true_64 :: state_pred where
  \<open>P_0x183ca_true_64 \<sigma> \<equiv> RIP \<sigma> = 0x183ca \<and> RAX \<sigma> = bdrv_read_0x183c3_retval \<and> RBX \<sigma> = ((RSP\<^sub>0::64 word) - 0x248) \<and> RCX \<sigma> = 0x1 \<and> RDX \<sigma> = ((RSP\<^sub>0::64 word) - 0x248) \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = ((ucast ((RSI\<^sub>0::64 word))::64 word) >>> 9) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x258) \<and> RBP \<sigma> = ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)) \<and> R15 \<sigma> = ((ucast ((RSI\<^sub>0::64 word))::64 word) >>> 9) \<and> R14 \<sigma> = RDX\<^sub>0 \<and> R13 \<sigma> = R13\<^sub>0 \<and> R12 \<sigma> = ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)) \<and> R8 \<sigma> = RDI\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x260),8]::64 word) = 0x183c8\<close>
declare P_0x183ca_true_64_def[Ps]

definition P_0x183ca_true_64_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x183ca_true_64_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((FS\<^sub>0::64 word) + 0x28), 8),
    (2, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x40), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x260), 8)
  }\<close>

definition P_0x183ca_true_64_regions :: state_pred where
  \<open>P_0x183ca_true_64_regions \<sigma> \<equiv> \<exists>regions. P_0x183ca_true_64_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x1837d_64 :: state_pred where
  \<open>Q_0x1837d_64 \<sigma> \<equiv> RIP \<sigma> = 0x1837d \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x258) \<and> R12 \<sigma> = ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)) \<and> R8 \<sigma> = RDI\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word)\<close>
declare Q_0x1837d_64_def[Qs]

schematic_goal bdrv_pread_em_0_3_0x183ca_0x184f5_64[blocks]:
  assumes \<open>(P_0x183ca_true_64 && P_0x183ca_true_64_regions && SF) \<sigma>\<close>
  shows \<open>exec_block 3 0x184f5 64 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x1837d_64 ?\<sigma> \<and> block_usage P_0x183ca_true_64_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x183ca_true_64_def P_0x183ca_true_64_regions_def post: Q_0x1837d_64_def regionset: P_0x183ca_true_64_regions_set_def)

definition P_0x183ca_false_65 :: state_pred where
  \<open>P_0x183ca_false_65 \<sigma> \<equiv> RIP \<sigma> = 0x183ca \<and> RAX \<sigma> = bdrv_read_0x183c3_retval \<and> RBX \<sigma> = ((RSP\<^sub>0::64 word) - 0x248) \<and> RCX \<sigma> = 0x1 \<and> RDX \<sigma> = ((RSP\<^sub>0::64 word) - 0x248) \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = ((ucast ((RSI\<^sub>0::64 word))::64 word) >>> 9) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x258) \<and> RBP \<sigma> = ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)) \<and> R15 \<sigma> = ((ucast ((RSI\<^sub>0::64 word))::64 word) >>> 9) \<and> R14 \<sigma> = RDX\<^sub>0 \<and> R13 \<sigma> = R13\<^sub>0 \<and> R12 \<sigma> = ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)) \<and> R8 \<sigma> = RDI\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x260),8]::64 word) = 0x183c8\<close>
declare P_0x183ca_false_65_def[Ps]

definition P_0x183ca_false_65_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x183ca_false_65_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((FS\<^sub>0::64 word) + 0x28), 8),
    (2, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x40), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x260), 8)
  }\<close>

definition P_0x183ca_false_65_regions :: state_pred where
  \<open>P_0x183ca_false_65_regions \<sigma> \<equiv> \<exists>regions. P_0x183ca_false_65_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x183d9_65 :: state_pred where
  \<open>Q_0x183d9_65 \<sigma> \<equiv> RIP \<sigma> = 0x183d9 \<and> RAX \<sigma> = bdrv_read_0x183c3_retval \<and> RBX \<sigma> = ((RSP\<^sub>0::64 word) - 0x248) \<and> RCX \<sigma> = 0x1 \<and> RDX \<sigma> = (sextend (ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word))) 32 64::64 word) \<and> RDI \<sigma> = RDX\<^sub>0 \<and> RSI \<sigma> = ((RSP\<^sub>0::64 word) - 0x248) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x258) \<and> RBP \<sigma> = ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)) \<and> R15 \<sigma> = ((ucast ((RSI\<^sub>0::64 word))::64 word) >>> 9) \<and> R14 \<sigma> = RDX\<^sub>0 \<and> R13 \<sigma> = R13\<^sub>0 \<and> R12 \<sigma> = ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)) \<and> R8 \<sigma> = RDI\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x260),8]::64 word) = 0x183c8\<close>
declare Q_0x183d9_65_def[Qs]

schematic_goal bdrv_pread_em_0_4_0x183ca_0x183d6_65[blocks]:
  assumes \<open>(P_0x183ca_false_65 && P_0x183ca_false_65_regions && ! SF) \<sigma>\<close>
  shows \<open>exec_block 4 0x183d6 65 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x183d9_65 ?\<sigma> \<and> block_usage P_0x183ca_false_65_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x183ca_false_65_def P_0x183ca_false_65_regions_def post: Q_0x183d9_65_def regionset: P_0x183ca_false_65_regions_set_def)

definition P_0x183d9_66 :: state_pred where
  \<open>P_0x183d9_66 \<sigma> \<equiv> RIP \<sigma> = 0x183d9 \<and> RAX \<sigma> = bdrv_read_0x183c3_retval \<and> RBX \<sigma> = ((RSP\<^sub>0::64 word) - 0x248) \<and> RCX \<sigma> = 0x1 \<and> RDX \<sigma> = (sextend (ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word))) 32 64::64 word) \<and> RDI \<sigma> = RDX\<^sub>0 \<and> RSI \<sigma> = ((RSP\<^sub>0::64 word) - 0x248) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x258) \<and> RBP \<sigma> = ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)) \<and> R15 \<sigma> = ((ucast ((RSI\<^sub>0::64 word))::64 word) >>> 9) \<and> R14 \<sigma> = RDX\<^sub>0 \<and> R13 \<sigma> = R13\<^sub>0 \<and> R12 \<sigma> = ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)) \<and> R8 \<sigma> = RDI\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x260),8]::64 word) = 0x183c8\<close>
declare P_0x183d9_66_def[Ps]

definition P_0x183d9_66_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x183d9_66_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((FS\<^sub>0::64 word) + 0x28), 8),
    (2, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x40), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x260), 8)
  }\<close>

definition P_0x183d9_66_regions :: state_pred where
  \<open>P_0x183d9_66_regions \<sigma> \<equiv> \<exists>regions. P_0x183d9_66_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_memcpy_addr_0x183d9_66 :: state_pred where
  \<open>Q_memcpy_addr_0x183d9_66 \<sigma> \<equiv> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x260) \<and> RIP \<sigma> = memcpy_addr \<and> RAX \<sigma> = bdrv_read_0x183c3_retval \<and> RBX \<sigma> = ((RSP\<^sub>0::64 word) - 0x248) \<and> RCX \<sigma> = 0x1 \<and> RDX \<sigma> = (sextend (ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word))) 32 64::64 word) \<and> RDI \<sigma> = RDX\<^sub>0 \<and> RSI \<sigma> = ((RSP\<^sub>0::64 word) - 0x248) \<and> RBP \<sigma> = ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)) \<and> R15 \<sigma> = ((ucast ((RSI\<^sub>0::64 word))::64 word) >>> 9) \<and> R14 \<sigma> = RDX\<^sub>0 \<and> R13 \<sigma> = R13\<^sub>0 \<and> R12 \<sigma> = ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)) \<and> R8 \<sigma> = RDI\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x260),8]::64 word) = 0x183de\<close>
declare Q_memcpy_addr_0x183d9_66_def[Qs]

schematic_goal bdrv_pread_em_0_1_0x183d9_0x183d9_66[blocks]:
  assumes \<open>(P_0x183d9_66 && P_0x183d9_66_regions) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x183d9 66 \<sigma> \<triangleq> ?\<sigma> \<and> Q_memcpy_addr_0x183d9_66 ?\<sigma> \<and> block_usage P_0x183d9_66_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x183d9_66_def P_0x183d9_66_regions_def post: Q_memcpy_addr_0x183d9_66_def regionset: P_0x183d9_66_regions_set_def)

definition P_0x183de_67 :: state_pred where
  \<open>P_0x183de_67 \<sigma> \<equiv> RIP \<sigma> = 0x183de \<and> RAX \<sigma> = memcpy_0x183d9_retval \<and> RBX \<sigma> = ((RSP\<^sub>0::64 word) - 0x248) \<and> RCX \<sigma> = 0x1 \<and> RDX \<sigma> = (sextend (ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word))) 32 64::64 word) \<and> RDI \<sigma> = RDX\<^sub>0 \<and> RSI \<sigma> = ((RSP\<^sub>0::64 word) - 0x248) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x258) \<and> RBP \<sigma> = ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)) \<and> R15 \<sigma> = ((ucast ((RSI\<^sub>0::64 word))::64 word) >>> 9) \<and> R14 \<sigma> = RDX\<^sub>0 \<and> R13 \<sigma> = R13\<^sub>0 \<and> R12 \<sigma> = ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)) \<and> R8 \<sigma> = RDI\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x260),8]::64 word) = 0x183de\<close>
declare P_0x183de_67_def[Ps]

definition P_0x183de_67_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x183de_67_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((FS\<^sub>0::64 word) + 0x28), 8),
    (2, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x40), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x260), 8)
  }\<close>

definition P_0x183de_67_regions :: state_pred where
  \<open>P_0x183de_67_regions \<sigma> \<equiv> \<exists>regions. P_0x183de_67_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x1837a_67 :: state_pred where
  \<open>Q_0x1837a_67 \<sigma> \<equiv> RIP \<sigma> = 0x1837a \<and> RAX \<sigma> = memcpy_0x183d9_retval \<and> RBX \<sigma> = ((RSP\<^sub>0::64 word) - 0x248) \<and> RCX \<sigma> = 0x1 \<and> RDX \<sigma> = (sextend (ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word))) 32 64::64 word) \<and> RDI \<sigma> = RDX\<^sub>0 \<and> RSI \<sigma> = ((RSP\<^sub>0::64 word) - 0x248) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x258) \<and> RBP \<sigma> = ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)) \<and> R15 \<sigma> = ((ucast ((RSI\<^sub>0::64 word))::64 word) >>> 9) \<and> R14 \<sigma> = RDX\<^sub>0 \<and> R13 \<sigma> = R13\<^sub>0 \<and> R12 \<sigma> = ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)) \<and> R8 \<sigma> = RDI\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x260),8]::64 word) = 0x183de\<close>
declare Q_0x1837a_67_def[Qs]

schematic_goal bdrv_pread_em_0_1_0x183de_0x183de_67[blocks]:
  assumes \<open>(P_0x183de_67 && P_0x183de_67_regions) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x183de 67 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x1837a_67 ?\<sigma> \<and> block_usage P_0x183de_67_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x183de_67_def P_0x183de_67_regions_def post: Q_0x1837a_67_def regionset: P_0x183de_67_regions_set_def)

definition P_0x1837a_68 :: state_pred where
  \<open>P_0x1837a_68 \<sigma> \<equiv> RIP \<sigma> = 0x1837a \<and> RAX \<sigma> = memcpy_0x183d9_retval \<and> RBX \<sigma> = ((RSP\<^sub>0::64 word) - 0x248) \<and> RCX \<sigma> = 0x1 \<and> RDX \<sigma> = (sextend (ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word))) 32 64::64 word) \<and> RDI \<sigma> = RDX\<^sub>0 \<and> RSI \<sigma> = ((RSP\<^sub>0::64 word) - 0x248) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x258) \<and> RBP \<sigma> = ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)) \<and> R15 \<sigma> = ((ucast ((RSI\<^sub>0::64 word))::64 word) >>> 9) \<and> R14 \<sigma> = RDX\<^sub>0 \<and> R13 \<sigma> = R13\<^sub>0 \<and> R12 \<sigma> = ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)) \<and> R8 \<sigma> = RDI\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x260),8]::64 word) = 0x183de\<close>
declare P_0x1837a_68_def[Ps]

definition P_0x1837a_68_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x1837a_68_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((FS\<^sub>0::64 word) + 0x28), 8),
    (2, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x40), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x260), 8)
  }\<close>

definition P_0x1837a_68_regions :: state_pred where
  \<open>P_0x1837a_68_regions \<sigma> \<equiv> \<exists>regions. P_0x1837a_68_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x1837d_68 :: state_pred where
  \<open>Q_0x1837d_68 \<sigma> \<equiv> RIP \<sigma> = 0x1837d \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x258) \<and> R12 \<sigma> = ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)) \<and> R8 \<sigma> = RDI\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word)\<close>
declare Q_0x1837d_68_def[Qs]

schematic_goal bdrv_pread_em_0_1_0x1837a_0x1837a_68[blocks]:
  assumes \<open>(P_0x1837a_68 && P_0x1837a_68_regions) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x1837a 68 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x1837d_68 ?\<sigma> \<and> block_usage P_0x1837a_68_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x1837a_68_def P_0x1837a_68_regions_def post: Q_0x1837d_68_def regionset: P_0x1837a_68_regions_set_def)

definition P_0x18378_false_69 :: state_pred where
  \<open>P_0x18378_false_69 \<sigma> \<equiv> RIP \<sigma> = 0x18378 \<and> RAX \<sigma> = 0x0 \<and> RBX \<sigma> = ucast (((ucast (((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)::32 word))::32 word) >>> 9)) \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = RDX\<^sub>0 \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x258) \<and> RBP \<sigma> = ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)) \<and> R15 \<sigma> = ((ucast ((RSI\<^sub>0::64 word))::64 word) >>> 9) \<and> R14 \<sigma> = RDX\<^sub>0 \<and> R13 \<sigma> = R13\<^sub>0 \<and> R12 \<sigma> = ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)) \<and> R8 \<sigma> = RDI\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word)\<close>
declare P_0x18378_false_69_def[Ps]

definition P_0x18378_false_69_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x18378_false_69_regions_set \<sigma> \<equiv> {
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

definition P_0x18378_false_69_regions :: state_pred where
  \<open>P_0x18378_false_69_regions \<sigma> \<equiv> \<exists>regions. P_0x18378_false_69_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x1837d_69 :: state_pred where
  \<open>Q_0x1837d_69 \<sigma> \<equiv> RIP \<sigma> = 0x1837d \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x258) \<and> R12 \<sigma> = ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)) \<and> R8 \<sigma> = RDI\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word)\<close>
declare Q_0x1837d_69_def[Qs]

schematic_goal bdrv_pread_em_0_2_0x18378_0x1837a_69[blocks]:
  assumes \<open>(P_0x18378_false_69 && P_0x18378_false_69_regions && ! jg) \<sigma>\<close>
  shows \<open>exec_block 2 0x1837a 69 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x1837d_69 ?\<sigma> \<and> block_usage P_0x18378_false_69_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x18378_false_69_def P_0x18378_false_69_regions_def post: Q_0x1837d_69_def regionset: P_0x18378_false_69_regions_set_def)

definition P_0x1837d_70 :: state_pred where
  \<open>P_0x1837d_70 \<sigma> \<equiv> RIP \<sigma> = 0x1837d \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x258) \<and> R12 \<sigma> = ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)) \<and> R8 \<sigma> = RDI\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word)\<close>
declare P_0x1837d_70_def[Ps]

definition P_0x1837d_70_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x1837d_70_regions_set \<sigma> \<equiv> {
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

definition P_0x1837d_70_regions :: state_pred where
  \<open>P_0x1837d_70_regions \<sigma> \<equiv> \<exists>regions. P_0x1837d_70_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x1838e_70 :: state_pred where
  \<open>Q_0x1838e_70 \<sigma> \<equiv> RIP \<sigma> = 0x1838e \<and> RDI \<sigma> = 0x0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x258) \<and> R12 \<sigma> = ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)) \<and> R8 \<sigma> = RDI\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word)\<close>
declare Q_0x1838e_70_def[Qs]

schematic_goal bdrv_pread_em_0_2_0x1837d_0x18385_70[blocks]:
  assumes \<open>(P_0x1837d_70 && P_0x1837d_70_regions) \<sigma>\<close>
  shows \<open>exec_block 2 0x18385 70 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x1838e_70 ?\<sigma> \<and> block_usage P_0x1837d_70_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x1837d_70_def P_0x1837d_70_regions_def post: Q_0x1838e_70_def regionset: P_0x1837d_70_regions_set_def)

definition P_0x1838e_true_71 :: state_pred where
  \<open>P_0x1838e_true_71 \<sigma> \<equiv> RIP \<sigma> = 0x1838e \<and> RDI \<sigma> = 0x0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x258) \<and> R12 \<sigma> = ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)) \<and> R8 \<sigma> = RDI\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word)\<close>
declare P_0x1838e_true_71_def[Ps]

definition P_0x1838e_true_71_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x1838e_true_71_regions_set \<sigma> \<equiv> {
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

definition P_0x1838e_true_71_regions :: state_pred where
  \<open>P_0x1838e_true_71_regions \<sigma> \<equiv> \<exists>regions. P_0x1838e_true_71_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x184fa_71 :: state_pred where
  \<open>Q_0x184fa_71 \<sigma> \<equiv> RIP \<sigma> = 0x184fa \<and> RDI \<sigma> = 0x0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x258) \<and> R12 \<sigma> = ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)) \<and> R8 \<sigma> = RDI\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word)\<close>
declare Q_0x184fa_71_def[Qs]

schematic_goal bdrv_pread_em_0_1_0x1838e_0x1838e_71[blocks]:
  assumes \<open>(P_0x1838e_true_71 && P_0x1838e_true_71_regions && !ZF) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x1838e 71 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x184fa_71 ?\<sigma> \<and> block_usage P_0x1838e_true_71_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x1838e_true_71_def P_0x1838e_true_71_regions_def post: Q_0x184fa_71_def regionset: P_0x1838e_true_71_regions_set_def)

definition P_0x184fa_72 :: state_pred where
  \<open>P_0x184fa_72 \<sigma> \<equiv> RIP \<sigma> = 0x184fa \<and> RDI \<sigma> = 0x0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x258) \<and> R12 \<sigma> = ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)) \<and> R8 \<sigma> = RDI\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word)\<close>
declare P_0x184fa_72_def[Ps]

definition P_0x184fa_72_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x184fa_72_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((FS\<^sub>0::64 word) + 0x28), 8),
    (2, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x40), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x260), 8)
  }\<close>

definition P_0x184fa_72_regions :: state_pred where
  \<open>P_0x184fa_72_regions \<sigma> \<equiv> \<exists>regions. P_0x184fa_72_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_stack_chk_fail_addr_0x184fa_72 :: state_pred where
  \<open>Q_stack_chk_fail_addr_0x184fa_72 \<sigma> \<equiv> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x260) \<and> RIP \<sigma> = stack_chk_fail_addr \<and> RDI \<sigma> = 0x0 \<and> R8 \<sigma> = RDI\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word)\<close>
declare Q_stack_chk_fail_addr_0x184fa_72_def[Qs]

schematic_goal bdrv_pread_em_0_1_0x184fa_0x184fa_72[blocks]:
  assumes \<open>(P_0x184fa_72 && P_0x184fa_72_regions) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x184fa 72 \<sigma> \<triangleq> ?\<sigma> \<and> Q_stack_chk_fail_addr_0x184fa_72 ?\<sigma> \<and> block_usage P_0x184fa_72_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x184fa_72_def P_0x184fa_72_regions_def post: Q_stack_chk_fail_addr_0x184fa_72_def regionset: P_0x184fa_72_regions_set_def)

definition P_0x1838e_false_73 :: state_pred where
  \<open>P_0x1838e_false_73 \<sigma> \<equiv> RIP \<sigma> = 0x1838e \<and> RDI \<sigma> = 0x0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x258) \<and> R12 \<sigma> = ucast ((\<langle>31,0\<rangle>RCX\<^sub>0::32 word)) \<and> R8 \<sigma> = RDI\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word)\<close>
declare P_0x1838e_false_73_def[Ps]

definition P_0x1838e_false_73_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x1838e_false_73_regions_set \<sigma> \<equiv> {
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

definition P_0x1838e_false_73_regions :: state_pred where
  \<open>P_0x1838e_false_73_regions \<sigma> \<equiv> \<exists>regions. P_0x1838e_false_73_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_ret_address_73 :: state_pred where
  \<open>Q_ret_address_73 \<sigma> \<equiv> RIP \<sigma> = ret_address \<and> RDI \<sigma> = 0x0 \<and> R8 \<sigma> = RDI\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word)\<close>
declare Q_ret_address_73_def[Qs]

schematic_goal bdrv_pread_em_0_9_0x1838e_0x183a5_73[blocks]:
  assumes \<open>(P_0x1838e_false_73 && P_0x1838e_false_73_regions && ! !ZF) \<sigma>\<close>
  shows \<open>exec_block 9 0x183a5 73 \<sigma> \<triangleq> ?\<sigma> \<and> Q_ret_address_73 ?\<sigma> \<and> block_usage P_0x1838e_false_73_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x1838e_false_73_def P_0x1838e_false_73_regions_def post: Q_ret_address_73_def regionset: P_0x1838e_false_73_regions_set_def)

definition bdrv_pread_em_acode :: ACode where
  \<open>bdrv_pread_em_acode =
    Block 22 0x18365 0;
    IF jg THEN
      Block 7 0x183f3 (Suc 0);
      Block (Suc 0) 0x183f8 2;
      CALL bdrv_read_acode;
      Block 2 0x18402 3;
      IF SF THEN
        Block 3 0x184f5 4
      ELSE
        Block 5 0x18419 5;
        IF !CF THEN
          Block 13 0x184b5 6;
          Block (Suc 0) 0x184b8 7;
          CALL rep_movs_ESRDI_DSRSI_acode
        ELSE
          Block 2 0x1841e 8;
          IF !ZF THEN
            Block 7 0x184e8 9
          ELSE
            Block 2 0x18427 10;
            IF ZF THEN
              Block (Suc 0) 0x18429 11
            ELSE
              Block 4 0x18435 12;
              IF ZF THEN
                Block (Suc 0) 0x18438 13
              ELSE
                Block 5 0x1844b 14
              FI
            FI
          FI
        FI;
        Block 4 0x184c5 15;
        IF !ZF THEN
          Block 4 0x1836e 16;
          IF jg THEN
            Block 6 0x1845b 17;
            Block (Suc 0) 0x18460 18;
            CALL bdrv_read_acode;
            Block (Suc 0) 0x18465 19;
            IF SF THEN
              Block 3 0x184f5 20
            ELSE
              Block 10 0x18487 21;
              Block (Suc 0) 0x18376 22;
              IF jg THEN
                Block 6 0x183c0 23;
                Block (Suc 0) 0x183c3 24;
                CALL bdrv_read_acode;
                Block (Suc 0) 0x183c8 25;
                IF SF THEN
                  Block 3 0x184f5 26
                ELSE
                  Block 4 0x183d6 27;
                  Block (Suc 0) 0x183d9 28;
                  CALL memcpy_acode;
                  Block (Suc 0) 0x183de 29;
                  Block (Suc 0) 0x1837a 30
                FI
              ELSE
                Block 2 0x1837a 31
              FI
            FI
          ELSE
            Block 2 0x18376 32;
            IF jg THEN
              Block 6 0x183c0 33;
              Block (Suc 0) 0x183c3 34;
              CALL bdrv_read_acode;
              Block (Suc 0) 0x183c8 35;
              IF SF THEN
                Block 3 0x184f5 36
              ELSE
                Block 4 0x183d6 37;
                Block (Suc 0) 0x183d9 38;
                CALL memcpy_acode;
                Block (Suc 0) 0x183de 39;
                Block (Suc 0) 0x1837a 40
              FI
            ELSE
              Block 2 0x1837a 41
            FI
          FI
        ELSE
          Block 2 0x184cd 42;
          Block (Suc 0) 0x1837a 43
        FI
      FI
    ELSE
      Block 4 0x1836e 44;
      IF jg THEN
        Block 6 0x1845b 45;
        Block (Suc 0) 0x18460 46;
        CALL bdrv_read_acode;
        Block (Suc 0) 0x18465 47;
        IF SF THEN
          Block 3 0x184f5 48
        ELSE
          Block 10 0x18487 49;
          Block (Suc 0) 0x18376 50;
          IF jg THEN
            Block 6 0x183c0 51;
            Block (Suc 0) 0x183c3 52;
            CALL bdrv_read_acode;
            Block (Suc 0) 0x183c8 53;
            IF SF THEN
              Block 3 0x184f5 54
            ELSE
              Block 4 0x183d6 55;
              Block (Suc 0) 0x183d9 56;
              CALL memcpy_acode;
              Block (Suc 0) 0x183de 57;
              Block (Suc 0) 0x1837a 58
            FI
          ELSE
            Block 2 0x1837a 59
          FI
        FI
      ELSE
        Block 2 0x18376 60;
        IF jg THEN
          Block 6 0x183c0 61;
          Block (Suc 0) 0x183c3 62;
          CALL bdrv_read_acode;
          Block (Suc 0) 0x183c8 63;
          IF SF THEN
            Block 3 0x184f5 64
          ELSE
            Block 4 0x183d6 65;
            Block (Suc 0) 0x183d9 66;
            CALL memcpy_acode;
            Block (Suc 0) 0x183de 67;
            Block (Suc 0) 0x1837a 68
          FI
        ELSE
          Block 2 0x1837a 69
        FI
      FI
    FI;
    Block 2 0x18385 70;
    IF !ZF THEN
      Block (Suc 0) 0x1838e 71;
      Block (Suc 0) 0x184fa 72;
      CALL stack_chk_fail_acode
    ELSE
      Block 9 0x183a5 73
    FI
  \<close>

schematic_goal "bdrv_pread_em":
  assumes
    \<open>\<forall>\<sigma>. RIP \<sigma> = 0x18367 \<longrightarrow> P_0x18367_true_1_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x183f8 \<longrightarrow> P_0x183f8_2_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x183fd \<longrightarrow> P_0x183fd_3_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x18404 \<longrightarrow> P_0x18404_true_4_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x18404 \<longrightarrow> P_0x18404_false_5_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x1841c \<longrightarrow> P_0x1841c_true_6_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x184b8 \<longrightarrow> P_0x184b8_7_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x1841c \<longrightarrow> P_0x1841c_false_8_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x18421 \<longrightarrow> P_0x18421_true_9_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x18421 \<longrightarrow> P_0x18421_false_10_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x18429 \<longrightarrow> P_0x18429_true_11_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x18429 \<longrightarrow> P_0x18429_false_12_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x18438 \<longrightarrow> P_0x18438_true_13_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x18438 \<longrightarrow> P_0x18438_false_14_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x184bb \<longrightarrow> P_0x184bb_15_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x184c7 \<longrightarrow> P_0x184c7_true_16_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x18370 \<longrightarrow> P_0x18370_true_17_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x18460 \<longrightarrow> P_0x18460_18_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x18465 \<longrightarrow> P_0x18465_19_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x18467 \<longrightarrow> P_0x18467_true_20_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x18467 \<longrightarrow> P_0x18467_false_21_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x18376 \<longrightarrow> P_0x18376_22_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x18378 \<longrightarrow> P_0x18378_true_23_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x183c3 \<longrightarrow> P_0x183c3_24_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x183c8 \<longrightarrow> P_0x183c8_25_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x183ca \<longrightarrow> P_0x183ca_true_26_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x183ca \<longrightarrow> P_0x183ca_false_27_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x183d9 \<longrightarrow> P_0x183d9_28_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x183de \<longrightarrow> P_0x183de_29_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x1837a \<longrightarrow> P_0x1837a_30_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x18378 \<longrightarrow> P_0x18378_false_31_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x18370 \<longrightarrow> P_0x18370_false_32_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x18378 \<longrightarrow> P_0x18378_true_33_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x183c3 \<longrightarrow> P_0x183c3_34_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x183c8 \<longrightarrow> P_0x183c8_35_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x183ca \<longrightarrow> P_0x183ca_true_36_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x183ca \<longrightarrow> P_0x183ca_false_37_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x183d9 \<longrightarrow> P_0x183d9_38_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x183de \<longrightarrow> P_0x183de_39_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x1837a \<longrightarrow> P_0x1837a_40_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x18378 \<longrightarrow> P_0x18378_false_41_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x184c7 \<longrightarrow> P_0x184c7_false_42_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x1837a \<longrightarrow> P_0x1837a_43_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x18367 \<longrightarrow> P_0x18367_false_44_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x18370 \<longrightarrow> P_0x18370_true_45_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x18460 \<longrightarrow> P_0x18460_46_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x18465 \<longrightarrow> P_0x18465_47_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x18467 \<longrightarrow> P_0x18467_true_48_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x18467 \<longrightarrow> P_0x18467_false_49_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x18376 \<longrightarrow> P_0x18376_50_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x18378 \<longrightarrow> P_0x18378_true_51_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x183c3 \<longrightarrow> P_0x183c3_52_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x183c8 \<longrightarrow> P_0x183c8_53_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x183ca \<longrightarrow> P_0x183ca_true_54_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x183ca \<longrightarrow> P_0x183ca_false_55_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x183d9 \<longrightarrow> P_0x183d9_56_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x183de \<longrightarrow> P_0x183de_57_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x1837a \<longrightarrow> P_0x1837a_58_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x18378 \<longrightarrow> P_0x18378_false_59_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x18370 \<longrightarrow> P_0x18370_false_60_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x18378 \<longrightarrow> P_0x18378_true_61_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x183c3 \<longrightarrow> P_0x183c3_62_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x183c8 \<longrightarrow> P_0x183c8_63_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x183ca \<longrightarrow> P_0x183ca_true_64_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x183ca \<longrightarrow> P_0x183ca_false_65_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x183d9 \<longrightarrow> P_0x183d9_66_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x183de \<longrightarrow> P_0x183de_67_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x1837a \<longrightarrow> P_0x1837a_68_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x18378 \<longrightarrow> P_0x18378_false_69_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x1837d \<longrightarrow> P_0x1837d_70_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x1838e \<longrightarrow> P_0x1838e_true_71_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x184fa \<longrightarrow> P_0x184fa_72_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x1838e \<longrightarrow> P_0x1838e_false_73_regions \<sigma>\<close>
    and [blocks]: \<open>{{Q_bdrv_read_addr_0x183f8_2}} \<box>bdrv_read_acode {{P_0x183fd_3;M_0x183f8}}\<close>
    and [blocks]: \<open>{{Q_rep_movs_ESRDI_DSRSI_addr_0x184b8_7}} \<box>rep_movs_ESRDI_DSRSI_acode {{P_0x184bb_8;M_0x184b8}}\<close>
    and [blocks]: \<open>{{Q_bdrv_read_addr_0x18460_18}} \<box>bdrv_read_acode {{P_0x18465_19;M_0x18460}}\<close>
    and [blocks]: \<open>{{Q_bdrv_read_addr_0x183c3_24}} \<box>bdrv_read_acode {{P_0x183c8_25;M_0x183c3}}\<close>
    and [blocks]: \<open>{{Q_memcpy_addr_0x183d9_28}} \<box>memcpy_acode {{P_0x183de_29;M_0x183d9}}\<close>
    and [blocks]: \<open>{{Q_bdrv_read_addr_0x183c3_34}} \<box>bdrv_read_acode {{P_0x183c8_35;M_0x183c3}}\<close>
    and [blocks]: \<open>{{Q_memcpy_addr_0x183d9_38}} \<box>memcpy_acode {{P_0x183de_39;M_0x183d9}}\<close>
    and [blocks]: \<open>{{Q_bdrv_read_addr_0x18460_46}} \<box>bdrv_read_acode {{P_0x18465_47;M_0x18460}}\<close>
    and [blocks]: \<open>{{Q_bdrv_read_addr_0x183c3_52}} \<box>bdrv_read_acode {{P_0x183c8_53;M_0x183c3}}\<close>
    and [blocks]: \<open>{{Q_memcpy_addr_0x183d9_56}} \<box>memcpy_acode {{P_0x183de_57;M_0x183d9}}\<close>
    and [blocks]: \<open>{{Q_bdrv_read_addr_0x183c3_62}} \<box>bdrv_read_acode {{P_0x183c8_63;M_0x183c3}}\<close>
    and [blocks]: \<open>{{Q_memcpy_addr_0x183d9_66}} \<box>memcpy_acode {{P_0x183de_67;M_0x183d9}}\<close>
    and [blocks]: \<open>{{Q_stack_chk_fail_addr_0x184fa_72}} \<box>stack_chk_fail_acode {{Q_fail;M_0x184fa}}\<close>
  shows \<open>{{?P}} bdrv_pread_em_acode {{?Q;?M}}\<close>
  by (vcg acode: bdrv_pread_em_acode_def assms: assms)

end

end
